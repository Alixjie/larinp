#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "lock.h"
#include "debug.h"
#include "string.h"

void dorecycle(void *vstart, void *vend);
extern char kern_end[];

struct run
{
    struct run *next;
};

struct
{
    struct lock lock;
    struct run *freemem;
} kmem;

// 回收临时页目录下的内存  [kernel_end, 4M) 按4K页回收
void recyclemem(void *vstart, void *vend)
{
    initlock(&kmem.lock, "kmem");
    dorecycle(vstart, vend);
}

// 回收切换内核页目录后的内存[4M, PHYTOP/512M)，按4K页回收

// 将 vstart - vend 之间的内存按 4K 页回收
// 结果向两边扩
void dorecycle(void *vstart, void *vend)
{
    char_t *p = (char *)PGROUNDUP((uint_t)vstart); // 取天棚
    for (; p + PGSIZE <= (char *)vend; p += PGSIZE)
        memfree(p);
}

// 释放一个 4K 页
void memfree(char *free)
{
    if ((uint_t)free % PGSIZE || free < kern_end || V2P_P(free) >= PHYSTOP)
        printk("mfree");

    memset(free, 1, PGSIZE);

    acquire(&kmem.lock);
    struct run *tem = (struct run *)free;
    tem->next = kmem.freemem;
    kmem.freemem = tem;
    release(&kmem.lock);
}

// 申请一个 4K 页
char *memalloc(void)
{
    acquire(&kmem.lock);
    struct run *tem = kmem.freemem;
    if (tem)
        kmem.freemem = tem->next;
    release(&kmem.lock);
    return (char *)tem;
}
