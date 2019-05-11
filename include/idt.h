

// 定义IRQ
#define IRQ0 32  // 电脑系统计时器
#define IRQ1 33  // 键盘
#define IRQ2 34  // 与 IRQ9 相接，MPU-401 MD 使用
#define IRQ3 35  // 串口设备
#define IRQ4 36  // 串口设备
#define IRQ5 37  // 建议声卡使用
#define IRQ6 38  // 软驱传输控制使用
#define IRQ7 39  // 打印机传输控制使用
#define IRQ8 40  // 即时时钟
#define IRQ9 41  // 与 IRQ2 相接，可设定给其他硬件
#define IRQ10 42 // 建议网卡使用
#define IRQ11 43 // 建议 AGP 显卡使用
#define IRQ12 44 // 接 PS/2 鼠标，也可设定给其他硬件
#define IRQ13 45 // 协处理器使用
#define IRQ14 46 // IDE0 传输控制使用
#define IRQ15 47 // IDE1 传输控制使用