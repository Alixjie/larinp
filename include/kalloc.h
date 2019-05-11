#ifndef INCLUDE_KALLOC_H
#define INCLUDE_KALLOC_H

// 回收临时页目录下的内存  [kernel_end, 4M) 按4K页回收
void recyclemem(void *vstart, void *vend);

// 回收切换内核页目录后的内存[4M, PHYTOP/512M)，按4K页回收

// 将 vstart - vend 之间的内存按 4K 页回收
// 结果向两边扩
void dorecycle(void *vstart, void *vend);

// 释放一个 4K 页
void memfree(char_t *free);

// 申请一个 4K 页
char *memalloc(void);

#endif