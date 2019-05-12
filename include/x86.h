#include "types.h"

// 向IO端口输出一个字节
static inline void outb(ushort_t port, uchar_t value)
{
    asm volatile("outb %1, %0"
                 :
                 : "dN"(port), "a"(value));
}

// 从IO端口读取一个字节
static inline uchar_t inb(ushort_t port)
{
    uchar_t ret;
    asm volatile("inb %1, %0"
                 : "=a"(ret)
                 : "dN"(port));
    return ret;
}

// 从IO端口读取一个字
static inline ushort_t inw(ushort_t port)
{
    ushort_t ret;
    asm volatile("inw %1, %0"
                 : "=a"(ret)
                 : "dN"(port));
    return ret;
}

// 向IO端口输出一个字
static inline void outw(ushort_t port, ushort_t data)
{
    asm volatile("out %0,%1"
                 :
                 : "a"(data), "d"(port));
}

// 按字节填充内存单元
static inline void stosb(void *addr, int_t data, int_t cnt)
{
    asm volatile("cld; rep stosb"
                 : "=D"(addr), "=c"(cnt)
                 : "0"(addr), "1"(cnt), "a"(data)
                 : "memory", "cc");
}

// 按长字填充内存单元
static inline void stosl(void *addr, int_t data, int_t cnt)
{
    asm volatile("cld; rep stosl"
                 : "=D"(addr), "=c"(cnt)
                 : "0"(addr), "1"(cnt), "a"(data)
                 : "memory", "cc");
}

struct segdesc;

// 加载 GDT 描述符表
static inline void lgdt(struct segdesc *p, int size)
{
    volatile ushort_t pd[3];

    pd[0] = size - 1;
    pd[1] = (uint_t)p;
    pd[2] = (uint_t)p >> 16;

    asm volatile("lgdt (%0)"
                 :
                 : "r"(pd));
}

struct gatedesc;

// 加载 IDT 描述符表
static inline void lidt(struct gatedesc *p, int size)
{
    volatile ushort_t pd[3];

    pd[0] = size - 1;
    pd[1] = (uint_t)p;
    pd[2] = (uint_t)p >> 16;

    asm volatile("lidt (%0)"
                 :
                 : "r"(pd));
}

// 设置 TR 选择符（默认 5 ）
static inline void ltr(ushort_t sel)
{
    asm volatile("ltr %0"
                 :
                 : "r"(sel));
}

// 读取 EFLAGS
static inline uint_t readeflags(void)
{
    uint_t eflags;
    asm volatile("pushfl; popl %0"
                 : "=r"(eflags));
    return eflags;
}

// 清零TF_IF位 禁止中断
static inline void cli(void)
{
    asm volatile("cli");
}

// 置位TF_IF位 允许中断
static inline void sti(void)
{
    asm volatile("sti");
}

// 用于锁机制 保证原子操作
static inline uint_t xchg(volatile uint_t *addr, uint_t newval)
{
    uint_t result;

    asm volatile("lock; xchgl %0, %1"
                 : "+m"(*addr), "=a"(result)
                 : "1"(newval)
                 : "cc");
    return result;
}

// 读取 CR2 寄存器
static inline uint_t rcr2(void)
{
    uint_t val;
    asm volatile("movl %%cr2,%0"
                 : "=r"(val));
    return val;
}

// 读取 CR3 寄存器
static inline void lcr3(uint_t val)
{
    asm volatile("movl %0,%%cr3"
                 :
                 : "r"(val));
}

//中断帧
struct trapframe
{
    // pusha存入
    uint_t edi;
    uint_t esi;
    uint_t ebp;
    uint_t oesp;
    uint_t ebx;
    uint_t edx;
    uint_t ecx;
    uint_t eax;

    ushort_t gs;
    ushort_t padding1;
    ushort_t fs;
    ushort_t padding2;
    ushort_t es;
    ushort_t padding3;
    ushort_t ds;
    ushort_t padding4;
    uint_t trapno;

    // 以下 x86 硬件保存
    uint_t err;
    uint_t eip;
    ushort_t cs;
    ushort_t padding5;
    uint_t eflags;

    // 当存在特权级变化时硬件自动保存
    uint_t esp;
    ushort_t ss;
    ushort_t padding6;
};
