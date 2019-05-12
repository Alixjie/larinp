// 定义 IRQ
#define IRQ_TIMER 32  // 电脑系统计时器
#define IRQ_KEBD 33  // 键盘
#define IRQ_IDE0 46 // IDE0 传输控制使用
#define IRQ_IDE1 47 // IDE1 传输控制使用

// 定义 0x80
#define SYS_CALL 0x80

// 定义每秒钟的中断次数
#define PERSECINTNUM 100

#ifndef __ASSEMBLER__

// 8253 初始化函数 frequency 表示每秒钟的终端次数
void init_timer(uint_t frequency);

// 8259A 的相关函数
// 初始化 8259A
void init_8259A(void);

// IRQ 中断完成后清空标志位
void empty_int(int trapno);

// idt 的相关函数
// idt 初始化
void idt_init(void);

// 中断处理函数
void intr(struct trapframe *tf);

// 系统调用总入口函数（通过函数指针数组跳转到不同的系统函数）
void syscall(void);

#endif