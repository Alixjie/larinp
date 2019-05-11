#ifndef INCLUDE_VMM_H
#define INCLUDE_VMM_H

#include "types.h"

// 页掩码按照 4096 对齐地址
#define PHY_PAGE_MASK 0xFFFFF000

#define NUMOFELE(x) (sizeof(x) / sizeof((x)[0]))

// 探测完后物理内存的最大值
uint_t phy_end;

// 初始化 GDT 表
void gdt_init(void);

// 探测物理内存最大值 刷新kmap
void dct_phy_mem(void);

// 建立内核页目录
void build_kpgdir(void);

// 建立进程内核部分的页表
pde_t *build_kvm(void);

// 第一次加载用户程序时使用（进程附带在内核上）
void firstuvm(pde_t *pgdir, uchar_t *init, uint_t sz);

// 恢复进程的有些属性（主要是 TSS ）
void changeuvm(struct proc *p);

#endif