#ifndef INCLUDE_MEMLAY_H
#define INCLUDE_MEMLAY_H

#include "types.h"

// 内核起始的物理地址 1M
#define EXTMEM 0x100000

// 最大支持内存 512M
#define PHYSTOP 0x20000000

// 物理地址与线性地址的偏移 3G
#define KERNBASE 0xC0000000

// 内核起始线性地址 3G+1M
#define KERNLINK (KERNBASE + EXTMEM)

// 传值是指针
#define V2P_P(a) (((uint)(a)) - KERNBASE)
#define P2V_P(a) ((void *)(((char *)(a)) + KERNBASE))

// 传值是地址
#define V2P_A(x) ((x) - KERNBASE)
#define P2V_A(x) ((x) + KERNBASE)

#endif
