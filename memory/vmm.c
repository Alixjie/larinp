#include "param.h"
#include "types.h"
#include "x86.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "vmm.h"
#include "multiboot.h"
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
    {(void *)KERNBASE, 0, EXTMEM, PTE_W},                // 1M 内空间
    {(void *)KERNLINK, V2P_P(KERNLINK), V2P_P(kern_data), 0}, // 内核只读空间
    {(void *)kern_data, V2P_P(kern_data), PHYSTOP, PTE_W},         // 内核数据 + free memory 可读写
};

void dct_phy_mem(void)
{
    glb_mboot_ptr = P2V_P(glb_mboot_ptr);
    // 测试 glb_mboot_ptr 的地址是否转换成功
    printk("%08x\n", glb_mboot_ptr);

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
