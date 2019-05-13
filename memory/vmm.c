#include "param.h"
#include "x86.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "vmm.h"
#include "multiboot.h"
#include "kalloc.h"
#include "string.h"
#include "debug.h"
//#include "elf.h"
#include "lock.h"

// 内核数据段开始 data + bss
extern char kern_data[];

// 内核页目录基址
pde_t *kpgdir;

multiboot_t *glb_mboot_ptr;

void gdt_init(void)
{
    struct cpu *c = getcpu();

    c->gdt[SEG_KCODE] = SEG(STA_X | STA_R, 0, 0xffffffff, 0);
    c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
    c->gdt[SEG_UCODE] = SEG(STA_X | STA_R, 0, 0xffffffff, DPL_USER);
    c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
    lgdt(c->gdt, sizeof(c->gdt));
}

static struct kmap
{
    void *virt;
    uint_t phys_start;
    uint_t phys_end;
    int perm;
} kmap[] = {
    {(void *)KERNBASE, 0, EXTMEM, PTE_W},                     // 1M 内空间
    {(void *)KERNLINK, V2P_P(KERNLINK), V2P_P(kern_data), 0}, // 内核只读空间
    {(void *)kern_data, V2P_P(kern_data), PHYSTOP, PTE_W},    // 内核数据 + free memory 可读写
};

// 探测物理内存的最大值
void dct_phy_mem(void)
{
    glb_mboot_ptr = P2V_P(glb_mboot_ptr);
    // 测试 glb_mboot_ptr 的地址是否转换成功
    //printk("%08x\n", glb_mboot_ptr);

    uint_t mmap_addr = glb_mboot_ptr->mmap_addr;
    uint_t mmap_length = glb_mboot_ptr->mmap_length;

    for (mmap_entry_t *mmap = (mmap_entry_t *)mmap_addr; (uint_t)mmap < mmap_addr + mmap_length; ++mmap)
    {
        if ((mmap->type == 1) && (mmap->base_addr_low == 0x100000))
        {
            phy_end = (mmap->base_addr_low + mmap->length_low) & PHY_PAGE_MASK;

            if (phy_end < PHYSTOP)
                kmap[2].phys_end = phy_end;
            else
                phy_end = PHYSTOP;
            break;
        }
    }
}

// 找到当前虚拟地址所在页表的页表项
// 若页表还不存在 则根据 alloc 参数决定是否新建一个 pde 项（即是否新建一个页表）
static pte_t *find_pte(pde_t *pgdir, const void *va, int alloc)
{
    pte_t *pte;
    pde_t *pde = &pgdir[PGD_INDEX(va)];
    // 查看页表是否已经存在
    if (*pde & PTE_P)
        // 保存的是物理地址 需要转换为虚拟地址后使用（在使用临时页目录项时 没有错误）
        pte = (pte_t *)P2V_P(PTE_ADDR(*pde));

    // 没有对应页表 根据alloc的值决定是否新建页目录项即页表
    else
    {
        if ((!alloc) || ((pte = (pte_t *)memalloc()) == NULL))
            return 0;
        // 回收内存时页已被写满 1 清空该段内存
        memset(pte, 0, PGSIZE);

        // 存在、可写、用户可访问
        *pde = V2P_P(pte) | PTE_P | PTE_W | PTE_U;
    }
    return &pte[PTE_INDEX(va)];
}

// 将从 VA（取地板）开始的虚拟地址映射到 PA 开始的物理地址 映射 size 大小 （向两边膨胀）
static int mapping(pde_t *pgdir, void *va, uint_t size, uint_t pa, int perm)
{
    // 取地板
    uchar_t *vadown = (uchar_t *)PGROUNDDOWN((uint_t)va);
    // 结束所在页的起始地址
    uchar_t *last = (uchar_t *)PGROUNDDOWN(((uint_t)va) + size - 1);

    while (TRUE)
    {
        pte_t *pte = find_pte(pgdir, vadown, 1);
        if (pte == NULL)
            return -1;
        if (*pte & PTE_P)
            printk("pte alread exist\n");
        // 添加页表项
        *pte = pa | perm | PTE_P;
        if (vadown == last)
            break;
        vadown += PGSIZE;
        pa += PGSIZE;
    }
    return 0;
}

// 建立进程内核部分的页表
pde_t *build_kvm(void)
{
    pde_t *pgdir;

    if ((pgdir = (pde_t *)memalloc()) == NULL)
        return FALSE;

    memset(pgdir, 0, PGSIZE);

    for (struct kmap *k = kmap; k < &kmap[NUMOFELE(kmap)]; ++k)
        if (mapping(pgdir, k->virt, k->phys_end - k->phys_start, (uint_t)k->phys_start, k->perm) < 0)
        {
            clearpgd(pgdir);
            return FALSE;
        }
    return pgdir;
}

// 建立内核页目录
void build_kpgdir(void)
{
    kpgdir = build_kvm();
    switchkvm();
}

// 当没有进程运行时 切换至只有内核映射的页目录
void switchkvm(void)
{
    lcr3(V2P_P(kpgdir));
}

void firstuvm(pde_t *pgdir, char_t *init, uint_t sz)
{
    if (sz >= PGSIZE)
        printk("first process must small than 4KB");
    char_t *mem = memalloc();
    memset(mem, 0, PGSIZE);
    // 将用户空间 0 字节开始的 4K 页映射到申请的物理内存上（申请的物理内存是虚拟地址 需要做转化）
    mapping(pgdir, 0, PGSIZE, V2P_P(mem), PTE_W | PTE_U);
    memmove(mem, init, sz);
}

void changeuvm(struct proc *p)
{
    if (p == 0)
        printk("no process\n");
    if (p->kstack == 0)
        printk("no kstack\n");
    if (p->pgdir == 0)
        printk("no pgdir\n");

    pcli();
    getcpu()->gdt[SEG_TSS] = SEG_T(STS_T32A, &getcpu()->ts, sizeof(getcpu()->ts) - 1, 0);
    // 系统描述符
    getcpu()->gdt[SEG_TSS].s = 0;
    // 设置内核堆栈段和内核栈栈顶
    getcpu()->ts.ss0 = SEG_KDATA << 3;
    getcpu()->ts.esp0 = (uint_t)p->kstack + KSTACKSIZE;

    getcpu()->ts.iomb = (ushort_t)0xFFFF;
    // 加载 tr 寄存器 设置进程页目录表
    ltr(SEG_TSS << 3);
    lcr3(V2P_P(p->pgdir));
    vcli();
}

// 将进程的用户态虚拟内存从 oldsize -> newsize（增加）
// 但 newsize 可以小于 oldsize 这种情况不需要调用该函数 直接返回
int gvusrmem(pde_t *pgdir, uint_t oldsz, uint_t newsz)
{
    if (newsz >= KERNBASE)
        return FALSE;
    if (newsz < oldsz)
        return oldsz;

    uint_t tmp = PGROUNDUP(oldsz);
    for (; tmp < newsz; tmp += PGSIZE)
    {
        char *tmpk = memalloc();
        if (tmpk == FALSE)
        {
            printk("there have no more memory\n");
            // 本函数调用失败内存空间恢复到原来的状态
            cfcusrmem(pgdir, newsz, oldsz);
            return FALSE;
        }
        memset(kmap, 0, PGSIZE);
        if (mapping(pgdir, (char *)tmp, PGSIZE, V2P_P(tmpk), PTE_W | PTE_U) < 0)
        {
            printk("mapping faliure\n");
            // 本函数调用失败内存空间恢复到原来的状态
            cfcusrmem(pgdir, newsz, oldsz);
            memfree(tmpk);
            return FALSE;
        }
    }
    return newsz;
}

// 将进程的用户态虚拟内存从 oldsize -> newsize（减少）
// 但 newsize 可以大于 oldsize 这种情况不需要调用该函数 直接返回
int cfcusrmem(pde_t *pgdir, uint_t oldsz, uint_t newsz)
{
    if (newsz >= oldsz)
        return oldsz;

    uint_t tmp = PGROUNDUP(newsz);
    for (; tmp < oldsz; tmp += PGSIZE)
    {
        pte_t *tmpte = find_pte(pgdir, (char *)tmp, 0);
        if (!tmpte)
            // 对应的页目录项为空 既不存在该页表
            tmp = PGADDR(PGD_INDEX(tmp) + 1, 0, 0) - PGSIZE;

        // 对应页表项不为空 且存在位为 1 既存在该页
        else if ((*tmpte & PTE_P) != 0)
        {
            // 获得该页的物理地址
            uint_t adr = PTE_ADDR(*tmpte);
            if (adr == 0)
                printk("zore allways not use\n");
            // 转化为虚拟地址释放
            char *v = P2V_P(adr);
            memfree(v);
            *tmpte = 0;
        }
    }
    return newsz;
}

// 清空用户态申请的所有内存 并释放内核态映射的页目录项 即页表
void clearpgd(pde_t *pgdir)
{
    if (pgdir == NULL)
        printk("no pgdir\n");
    cfcusrmem(pgdir, KERNBASE, 0);
    for (int i = 0; i < NPDENTRIES; ++i)
    {
        if (pgdir[i] & PTE_P)
        {
            // 回收页目录项 即回收页表
            char *v = P2V_P(PTE_ADDR(pgdir[i]));
            memfree(v);
        }
    }
    // 回收最后的页目录
    memfree((char *)pgdir);
}

// 在用户栈和数据区之间设置一页用户访问不了的页
// 防止意外删除数据区数据 且会发生页保护中断
void setusrcnt(pde_t *pgdir, char *uva)
{
    pte_t *pte = find_pte(pgdir, uva, 0);
    if (pte == 0)
        printk("setusrcnt\n");
    *pte &= ~PTE_U;
}

// 当调用 fork() 函数时 创建内核映射 并复制用户态数据
pde_t *copyuvm(pde_t *pgdir, uint_t sz)
{
    pde_t *tmpd;

    if ((tmpd = build_kvm()) == FALSE)
        return FALSE;
    for (int i = 0; i < sz; i += PGSIZE)
    {
        pte_t *pte;
        if ((pte = find_pte(pgdir, (void *)i, 0)) == 0)
            printk("copyuvm: page table not exist");
        if (!(*pte & PTE_P))
            printk("copyuvm: page not exist\n");
        // 得到映射页的物理地址
        uint_t pa = PTE_ADDR(*pte);
        // 得到属性
        uint_t flags = PTE_FLAGS(*pte);
        char_t *rec;
        if ((rec = memalloc()) == 0)
            goto oyoq;
        // 复制内存页数据
        memmove(rec, (char *)P2V_P(pa), PGSIZE);
        if (mapping(tmpd, (void *)i, PGSIZE, V2P_P(rec), flags) < 0)
        {
            memfree(rec);
            goto oyoq;
        }
    }
    return tmpd;

oyoq:
    clearpgd(tmpd);
    return FALSE;
}

// 加载程序段到指定内存
int ldfromhd(pde_t *pgdir, char *addr, struct inode *ip, uint_t offset, uint_t sz)
{
    pte_t *pte;

    if ((uint_t)addr % PGSIZE != 0)
        printk("loaduvm: addr must be page aligned");
    for (uint_t i = 0; i < sz; i += PGSIZE)
    {
        if ((pte = find_pte(pgdir, addr + i, 0)) == 0)
            printk("loaduvm: address should exist");
        uint_t pa = PTE_ADDR(*pte);

        uint_t n;
        if (sz - i < PGSIZE)
            n = sz - i;
        else
            n = PGSIZE;
        if (readi(ip, P2V_P(pa), offset + i, n) != n)
            return -1;
    }
    return 0;
}

// 得到 uva 物理地址对应的虚拟内核地址
char *uva2ka(pde_t *pgdir, char *uva)
{
    pte_t *pte = find_pte(pgdir, uva, 0);
    if ((*pte & PTE_P) == 0)
        return FALSE;
    if ((*pte & PTE_U) == 0)
        return FALSE;
    return (char *)P2V_P(PTE_ADDR(*pte));
}

// 将 p 开始 len 长度的字节拷贝到 va
// 但是是通过 va 转换成内核的 ka 后复制
int copyout(pde_t *pgdir, uint_t va, void *p, uint_t len)
{
    char *rec = (char *)p;
    while (len > 0)
    {
        uint_t vadown = (uint_t)PGROUNDDOWN(va);
        char *ka = uva2ka(pgdir, (char *)vadown);
        if (ka == 0)
            return -1;
        uint_t n = PGSIZE - (va - vadown);
        // 在该页中就够存了
        if (n > len)
            n = len;
        memmove(ka + (va - vadown), rec, n);
        len -= n;
        rec += n;
        va = vadown + PGSIZE;
    }
    return 0;
}
