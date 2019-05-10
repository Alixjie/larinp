#ifndef INCLUDE_VMM_H
#define INCLUDE_VMM_H

// 页掩码按照 4096 对齐地址
#define PHY_PAGE_MASK 0xFFFFF000

// 探测物理内存最大值 刷新kmap
void dct_phy_mem(void);



#endif