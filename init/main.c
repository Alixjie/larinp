#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "x86.h"
#include "debug.h"

// kernel.ld链接脚本中定义 内核结束的内存物理地址
extern char kern_end[];

int main(void)
{
    printk("It's a test!\n");

    while (TRUE)
        ;
}

// 临时页目录
// 映射虚拟地址 0 - 4M 、 KERNBASE - KERNBASE + 4M 到 物理地址 0 - 4M
__attribute__((__aligned__(PGSIZE)))
pde_t tempgdir[NPDENTRIES] = {
    [0] = (0) | PTE_P | PTE_W | PTE_PS,

    [KERNBASE >> PGDSHIFT] = (0) | PTE_P | PTE_W | PTE_PS,
};

