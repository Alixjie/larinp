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
void firstuvm(pde_t *pgdir, char_t *init, uint_t sz);

// 恢复进程的有些属性（主要是 TSS ）
void changeuvm(struct proc *p);

// 切换到内核线程（切换到只有内核映射页目录）
void switchkvm(void);

// 初始化第一个进程的用户态空间
void firstuvm(pde_t *pgdir, char_t *init, uint_t sz);

// 将进程的用户态虚拟内存从 oldsize -> newsize（增加）
// 但 newsize 可以小于 oldsize 这种情况不需要调用该函数 直接返回
int gvusrmem(pde_t *pgdir, uint_t oldsz, uint_t newsz);

// 将进程的用户态虚拟内存从 oldsize -> newsize（减少）
// 但 newsize 可以大于 oldsize 这种情况不需要调用该函数 直接返回
int cfcusrmem(pde_t *pgdir, uint_t oldsz, uint_t newsz);

// 清空用户态申请的所有内存 并释放内核态映射的页目录项 即页表
void clearpgd(pde_t *pgdir);

// 在用户栈和数据区之间设置一页用户访问不了的页
// 防止意外删除数据区数据 且会发生页保护中断
void setusrcnt(pde_t *pgdir, char *uva);

// 当调用 fork() 函数时 创建内核映射 并复制用户态数据
pde_t *copyuvm(pde_t *pgdir, uint_t sz);

// 加载程序段到指定内存
int ldfromhd(pde_t *pgdir, char *addr, struct inode *ip, uint_t offset, uint_t sz);

// 得到 uva 物理地址对应的虚拟内核地址
char *uva2ka(pde_t *pgdir, char *uva);

// 将 p 开始 len 长度的字节拷贝到 va
// 但是是通过 va 转换成内核的 ka 后复制
int copyout(pde_t *pgdir, uint_t va, void *p, uint_t len);

#endif