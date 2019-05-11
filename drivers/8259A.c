#include "x86.h"

void init_8259A(void)
{
    // 初始化两片级联的 Intel 8259A 芯片

	// 主片端口 0x20 0x21
	// 从片端口 0xA0 0xA1

	//设置ICW1
	// 级连、边沿触发、ICW4
	outb(0x20, 0x11);
	outb(0xA0, 0x11);

	// 设置ICW2
	// 设置主片 IRQ 从 0x20(32) 号中断开始
	// 设置从片 IRQ 从 0x28(40) 号中断开始
	outb(0x21, 0x20);
	outb(0xA1, 0x28);

	// 设置ICW3
	// 设置主片 IR2 引脚连接从片
	// 设置从片输出引脚和主片 IR2 号相连
	outb(0x21, 0x04);
	outb(0xA1, 0x02);

	// 设置ICW4
	// 设置主片和从片按照 8086 的方式工作（全嵌套、非缓冲、正常中断结束）
	outb(0x21, 0x01);
	outb(0xA1, 0x01);

	// 设置OCW1
	// 设置主从片禁止中断（初始化相应设备时 开启对应中断）
	outb(0x21, 0x0);
	outb(0xA1, 0x0);
}

void empty_int(int trapno)
{
	// 设置OCW2（正常EOI中断结束命令，使ISR中最高的非零位清0）
	if (trapno >= 40) {
		// 发送重设信号给从片
		outb(0xA0, 0x20);
	}
	// 发送重设信号给主片
	outb(0x20, 0x20);
}