#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "x86.h"
#include "idt.h"
#include "lock.h"

struct gatedesc idt[256];
extern uint_t intrs[];
struct lock didalock;
uint_t dida;

void idt_init(void)
{
    init_8259A();

    init_timer(PERSECINTNUM);

    for (int i = 0; i < 256; i++)
        // 初始化中断向量表 都为中断门 且用户态不可访问
        SETGATE(idt[i], 0, SEG_KCODE << 3, intrs[i], 0);

    // 重新设置 system call 系统调用（是一个陷阱门 且用户态可访问）
    SETGATE(idt[SYS_CALL], 1, SEG_KCODE << 3, intrs[SYS_CALL], DPL_USER);

    lidt(idt, sizeof(idt));

    initlock(&didalock, "time");
}

void intr(struct trapframe *tf)
{
    // 系统调用接口 int 0x80
    if (tf->trapno == SYS_CALL)
    {
        if (getproc()->killed)
            exit();
        getproc()->tf = tf;
        syscall();
        if (getproc()->killed)
            exit();
        return;
    }

    switch (tf->trapno)
    {
    case IRQ_TIMER:
        acquire(&didalock);
        dida++;
        //wakeup(&dida);
        printk("dida %08x\n", dida);
        release(&didalock);
        empty_int(tf->trapno);
        break;

    default:
        if (getproc() == NULL || (tf->cs & 3) == 0)
        {
            // 内核态发生异常中断
            printk("unexpected trap %d, eip %x (cr2=0x%x)\n", tf->trapno, tf->eip, rcr2());
            printk("trap");
        }
        // 用户态发生异常中断 杀死该进程
        printk("pid %d %s: trap %d err %d eip 0x%x addr 0x%x--kill proc\n",
                getproc()->pid, getproc()->name, tf->trapno, tf->err, tf->eip, rcr2());
        getproc()->killed = 1;
    }
}
