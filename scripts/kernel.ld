/*
* kernel.ld −− 针对 kernel 的链接脚本 
*/

ENTRY(_start) 
SECTIONS
{
    PROVIDE( kern_start = 0xC0100000 );

    /* 初始化段起始位置 */
    . = 0xC0100000;

    .text : AT(ADDR(.text) - 0xC0000000)
    {
        *(.text)
        *(.rodata)
        . = ALIGN(4096);
    }

    .stab : AT(ADDR(.stab) - 0xC0000000)
    {
        *(.stab)
        . = ALIGN(4096);
    }

    .stabstr : AT(ADDR(.stabstr) - 0xC0000000)
    {
        *(.stabstr)
        . = ALIGN(4096);
    }

    . = ALIGN(0x1000);

    .data : AT(ADDR(.data) - 0xC0000000)
    {
        *(.data) 
        . = ALIGN(4096);
    }

    .bss : AT(ADDR(.bss) - 0xC0000000)
    {
        *(.bss)
        . = ALIGN(4096);
    }

    PROVIDE( kern_end = . );

    /DISCARD/ : { *(.comment) *(.eh_frame) }
}