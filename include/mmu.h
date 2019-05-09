#ifndef INCLUDE_MMU_H
#define INCLUDE_MMU_H

// EFLAGS寄存器 中断允许标志位
#define FL_IF 0x00000200

// 控制寄存器CR0、CR4
#define CR0_PE 0x00000001 // 开启保护模式
#define CR0_WP 0x00010000 // 用于超级用户的写保护
#define CR0_PG 0x80000000 // 开启分页

#define CR4_PSE 0x00000010 // 允许使用大小为 4M 的超级页

// GDT表总项数 GDT[0]不使用
#define SEG_NUM 6

#define SEG_KCODE 1 // 内核代码段
#define SEG_KDATA 2 // 内核数据 + 堆栈段
#define SEG_UCODE 3 // 用户代码段
#define SEG_UDATA 4 // 用户数据 + 堆栈段
#define SEG_TSS 5   // 进程状态段

// 段描述符结构体
struct segdesc
{
    uint_t lim_15_0 : 16;  // 段限长
    uint_t base_15_0 : 16; // 段基址
    uint_t base_23_16 : 8; // 段基址
    uint_t type : 4;
    uint_t s : 1;
    uint_t dpl : 2;       // DPL
    uint_t p : 1;         // 存在位
    uint_t lim_19_16 : 4; // 段限长
    uint_t avl : 1;       // 未使用
    uint_t rsv1 : 1;
    uint_t db : 1;
    uint_t g : 1;
    uint_t base_31_24 : 8; // 段基址
};

// 设置段描述符
#define SEG(type, base, lim, dpl)                             \
    (struct segdesc)                                          \
    {                                                         \
        ((lim) >> 12) & 0xffff, (uint_t)(base)&0xffff,          \
            ((uint_t)(base) >> 16) & 0xff, type, 1, dpl, 1,     \
            (uint_t)(lim) >> 28, 0, 0, 1, 1, (uint_t)(base) >> 24 \
    }

#define SEG_T(type, base, lim, dpl)                         \
    (struct segdesc)                                          \
    {                                                         \
        (lim) & 0xffff, (uint_t)(base)&0xffff,                  \
            ((uint_t)(base) >> 16) & 0xff, type, 1, dpl, 1,     \
            (uint_t)(lim) >> 16, 0, 0, 1, 0, (uint_t)(base) >> 24 \
    }

#define DPL_USER 0x3   // 用户 DPL
#define DPL_KERNEL 0x0 // Kernel DPL

// 段权限
#define STA_X 0x8 // 可执行段
#define STA_W 0x2 // 可写段（不可执行）
#define STA_R 0x2 // 可读段（可以执行）

#define STS_T32A 0x9 // 32位 TSS (可用)
#define STS_IG32 0xE // 中断门
#define STS_TG32 0xF // 陷阱门

// 获取一个地址的页目录项
#define PGD_INDEX(x) (((x) >> PGDSHIFT) & 0x3FF)

// 获取一个地址的页表项
#define PTE_INDEX(x) (((x) >> PTESHIFT) & 0x3FF)

// 获取一个地址的页內偏移
#define OFFSET_INDEX(x) ((x)&0xFFF)

// 根据索引和偏移量构造虚拟地址
#define PGADDR(d, t, o) ((uint_t)((d) << PGDSHIFT | (t) << PTESHIFT | (o)))

#define NPDENTRIES 1024 // 页目录项数
#define NPTENTRIES 1024 // 页表项数
#define PGSIZE 4096     // 页大小

#define PTESHIFT 12 // 页表项偏移
#define PGDSHIFT 22 // 页目录项偏移

// 页取天棚
#define PGROUNDUP(sz) (((sz) + PGSIZE - 1) & ~(PGSIZE - 1))
// 页取地板
#define PGROUNDDOWN(a) (((a)) & ~(PGSIZE - 1))

#define PTE_P 0x001  // 页存在位
#define PTE_W 0x002  // 可写位
#define PTE_U 0x004  // 用户标志位
#define PTE_PS 0x080 // 4M 页

#define PTE_ADDR(pte) ((uint_t)(pte) & ~0xFFF)
#define PTE_FLAGS(pte) ((uint_t)(pte)&0xFFF)

// TSS段（进程状态段）
struct taskstate
{
    uint_t link;
    uint_t esp0;    // 内核态堆栈指针
    ushort_t ss0; // 内核态堆栈段
    ushort_t padding1;
    uint_t *esp1;
    ushort_t ss1;
    ushort_t padding2;
    uint_t *esp2;
    ushort_t ss2;
    ushort_t padding3;
    void *cr3; // 页目录基址
    uint_t *eip; // 切换进程时的 EIP
    uint_t eflags;
    uint_t eax;
    uint_t ecx;
    uint_t edx;
    uint_t ebx;
    uint_t *esp;
    uint_t *ebp;
    uint_t esi;
    uint_t edi;
    ushort_t es;
    ushort_t padding4;
    ushort_t cs;
    ushort_t padding5;
    ushort_t ss;
    ushort_t padding6;
    ushort_t ds;
    ushort_t padding7;
    ushort_t fs;
    ushort_t padding8;
    ushort_t gs;
    ushort_t padding9;
    ushort_t ldt;
    ushort_t padding10;
    ushort_t t;
    ushort_t iomb; // I/O map基址
};

// 门描述符结构体
struct gatedesc
{
    uint_t off_15_0 : 16;  // 低16位偏移
    uint_t cs : 16;        // 段选择符
    uint_t args : 5;       // 中断门/陷阱门
    uint_t rsv1 : 3;       // 0
    uint_t type : 4;       // type(STS_{IG32,TG32})
    uint_t s : 1;          // 0
    uint_t dpl : 2;        // DPL
    uint_t p : 1;          // 存在位
    uint_t off_31_16 : 16; // 高16位偏移
};

// 设置门描述符
// istrap: 1 陷阱门, 0 中断门
#define SETGATE(gate, istrap, sel, off, d)            \
    {                                                 \
        (gate).off_15_0 = (uint_t)(off)&0xffff;         \
        (gate).cs = (sel);                            \
        (gate).args = 0;                              \
        (gate).rsv1 = 0;                              \
        (gate).type = (istrap) ? STS_TG32 : STS_IG32; \
        (gate).s = 0;                                 \
        (gate).dpl = (d);                             \
        (gate).p = 1;                                 \
        (gate).off_31_16 = (uint_t)(off) >> 16;         \
    }

#endif