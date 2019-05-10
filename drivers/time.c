#include "time.h"
//#include "idt.h"
#include "x86.h"

void init_timer(uint_t frequency)
{
 //   register_interrupt_handler((uchar_t)IRQ0, timer_callback);

    // Intel 8253/8254 PIT芯片 I/O端口地址范围是40h~43h
	// 输入频率为 1193180，frequency 即每秒中断次数
	uint_t divisor = 1193180 / frequency;

	// 设置 8253/8254 芯片计数器 0 工作在方式 3 下
	outb(0x43, 0x36);

	// 拆分低字节和高字节
	uchar_t low = (uchar_t)(divisor & 0xFF);
	uchar_t hign = (uchar_t)((divisor >> 8) & 0xFF);
	
	// 分别写入低字节和高字节
	outb(0x40, low);
	outb(0x40, hign);
}
