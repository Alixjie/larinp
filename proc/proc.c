#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "lock.h"
#include "debug.h"
#include "vmm.h"
#include "kalloc.h"
#include "string.h"

extern void forkret(void);
extern void trapret(void);

struct
{
    struct lock lock;
    struct proc proc[NPROC];
} proctab;

static struct cpu cpu0;

static struct proc *initproc;

int nextpid = 1;

//static void wkupauth(void *chan);

// proctab 的锁初始化
void ptabinit(void)
{
    initlock(&proctab.lock, "proctab");
}

// 得到当前 CPU
struct cpu *getcpu(void)
{
    return &cpu0;
}

// 得到当前 CPU 正在运行的进程
// 有则得到进程的指针 没有返回 NULL
struct proc *getproc(void)
{
    pcli();
    struct proc *p = getcpu()->proc;
    vcli();
    return p;
}

static struct proc *allocproc(void)
{
    struct proc *tmp;

    acquire(&proctab.lock);
    for (tmp = proctab.proc; tmp < &proctab.proc[NPROC]; ++tmp)
        if (tmp->state == UNUSED)
            goto bingo;

    release(&proctab.lock);
    return FALSE;

bingo:
    // 占用该槽位
    tmp->state = EMBRYO;
    tmp->pid = nextpid++;

    release(&proctab.lock);

    // 申请内核栈 4K 大小
    if ((tmp->kstack = memalloc()) == FALSE)
    {
        // 申请失败 将槽位归还
        tmp->state = UNUSED;
        return FALSE;
    }
    char_t *kesp = tmp->kstack + PGSIZE;

    // 内核栈指针向下偏移 trapframe 结构体个大小
    // 并将进程中断帧栈指针指向 kesp 处
    // 后面再做修改
    kesp -= sizeof *tmp->tf;
    tmp->tf = (struct trapframe *)kesp;

    // 内核栈指针继续下移 4 字节 将 trapret 的地址压入内核栈
    // 做好中断返回
    kesp -= 4;
    *(uint_t *)kesp = (uint_t)trapret;

    // 内核栈指针继续下移 context 结构体个字节 将 forkret 的地址压入内核栈
    // 将当前进程内核上下文环境设置在 forkret 中
    kesp -= sizeof *tmp->context;
    tmp->context = (struct context *)kesp;
    memset(tmp->context, 0, sizeof *tmp->context);
    tmp->context->eip = (uint_t)forkret;

    return tmp;
}

void backtouser(void)
{
    extern char _binary_parasite_start[], _binary_parasite_size[];

    struct proc *p = allocproc();

    initproc = p;
    if ((p->pgdir = build_kvm()) == FALSE)
        printk("first process build_kvm failure");
    firstuvm(p->pgdir, _binary_parasite_start, (uint_t)_binary_parasite_size);
    p->sz = PGSIZE;
    memset(p->tf, 0, sizeof(*p->tf));
    p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
    p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
    p->tf->es = p->tf->ds;
    p->tf->ss = p->tf->ds;
    // 允许中断
    p->tf->eflags = FL_IF;
    p->tf->esp = PGSIZE;
    p->tf->eip = 0;

    safestrcpy(p->name, "parasite", sizeof(p->name));
    // 伟哥
    // p->cwd = namei("/");

    p->priority = 10;

    acquire(&proctab.lock);

    p->state = RUNNABLE;

    release(&proctab.lock);
}

void scheduler(void)
{
    getcpu()->proc = NULL;

    while (TRUE)
    {
        // 开启中断
        sti();

        acquire(&proctab.lock);
        for (struct proc *p = proctab.proc; p < &proctab.proc[NPROC]; ++p)
        {
            if (p->state != RUNNABLE)
                continue;

            // 找到状态为 RUMMABLE 的进程 切换到该进程内核上下文
            getcpu()->proc = p;
            changeuvm(p);
            p->state = RUNNING;

            swtch(&(getcpu()->scheduler), p->context);
            switchkvm();

            // 从用户进程返回到内核调度器线程 当前没有运行中的进程
            getcpu()->proc = NULL;
        }
        release(&proctab.lock);
    }
}

// fork 完的子进程首先返回的地方
// parasite 做了特殊处理也会返回到这里
void forkret(void)
{
    static int first = 1;

    // 用于测试 看是否返回到了 forkret
    printk("I am so happy in forkret\n");

    // 释放在 scheduler() 中申请的锁
    release(&proctab.lock);

    if (first)
    {
        first = 0;

        // 伟哥
        //iinit(ROOTDEV);
    }
    // 返回到 trapframe 准备中断返回到用户态
}

// static void wkupauth(void *chan)
// {

// }
