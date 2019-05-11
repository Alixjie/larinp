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

// 内核数据段开始 data + bss
extern char kern_data[];

// 内核页目录基址
pde_t *kpgdir;

multiboot_t *glb_mboot_ptr;

void gdt_init(void)
{
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
            uint_t phy_end = (mmap->base_addr_low + mmap->length_low) & PHY_PAGE_MASK;

            if (phy_end < PHYSTOP)
                kmap[2].phys_end = phy_end;
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
            memfree(pgdir);
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
