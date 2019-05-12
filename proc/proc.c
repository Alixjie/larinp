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

static void wkupauth(void *chan);

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

// 内核态调度器线程 
// 若有符合状态的进程可以运行 则切换运行
// 若没有 则开放锁 即允许中断 等待在中断中 wakeup
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

// 增加/减少 当前进程用户态的内存大小
// n > 0 调用 gvusrmen 增加 | n < 0 调用 cfcusrmen 减小
int growproc(int n)
{
    struct proc *curproc = getproc();

    uint_t sz = curproc->sz;
    if (n > 0)
    {
        if ((sz = gvusrmem(curproc->pgdir, sz, sz + n)) == 0)
            return -1;
    }
    else if (n < 0)
    {
        if ((sz = cfcusrmem(curproc->pgdir, sz, sz + n)) == 0)
            return -1;
    }
    curproc->sz = sz;
    changeuvm(curproc);
    return 0;
}

// 创建该进程的影子进程（子进程）
// 子进程将会 forkret()->trapret()->user mode
int fork(void)
{
    struct proc *child;
    struct proc *curproc = getproc();

    // 去进程槽申请一个进程 并做好初始化 内核栈 forkret trapret
    if ((child = allocproc()) == NULL)
        return -1;

    // 复制当前进程的资源
    if ((child->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == NULL)
    {
        // 复制资源失败 还原进程槽 退出
        memfree(child->kstack);
        child->kstack = 0;
        child->state = UNUSED;
        return -1;
    }
    child->sz = curproc->sz;
    child->parent = curproc;
    *child->tf = *curproc->tf;

    // 将 EAX 变为 0 用于子进程返回判断条件
    child->tf->eax = 0;

    for (int i = 0; i < NOFILE; i++)
        if (curproc->ofile[i])
           // child->ofile[i] = filedup(curproc->ofile[i]); 伟哥
    //child->cwd = idup(curproc->cwd);

    safestrcpy(child->name, curproc->name, sizeof(curproc->name));

    int_t childpid = child->pid;

    printk("child pid %d", childpid);

    acquire(&proctab.lock);

    child->state = RUNNABLE;

    release(&proctab.lock);

    return childpid;
}

// 释放进程的有些资源 唤醒等待的父进程继续回收
// 本函数执行后正常情况下不会返回 若执行最后一句则出错
void exit(void)
{
    // 测试
    printk("I am in exit\n");
    struct proc *curproc = getproc();

    if (curproc == initproc)
        printk("exiting initproc error!\n");

    // 关闭所有打开的文件
    for (int_t fd = 0; fd < NOFILE; ++fd)
    {
        if (curproc->ofile[fd])
        {
            // fileclose(curproc->ofile[fd]); 伟哥
            curproc->ofile[fd] = 0;
        }
    }

    // begin_op();
    // iput(curproc->cwd);
    // end_op(); 伟哥
    curproc->cwd = 0;

    acquire(&proctab.lock);

    // 唤醒该进程的父进程
    wkupauth(curproc->parent);

    // 将该进程的所有儿子进程挂到 initproc 上 若有子进程状态为 ZOBIE 则唤醒 initproc
    for (struct proc *tmp = proctab.proc; tmp < &proctab.proc[NPROC]; ++tmp)
    {
        if (tmp->parent == curproc)
        {
            tmp->parent = initproc;
            if (tmp->state == ZOMBIE)
                wkupauth(initproc);
        }
    }

    // 改变进程状态 让唤醒的父进程继续回收资源
    curproc->state = ZOMBIE;
    sched();
    // 正常情况下不会运行到这 显示则出错
    printk("zombie exit\n");
}

// 等待孩子进程退出（孩子进程退出时唤醒）
// 继续释放孩子进程的资源（内核栈、页目录表...）
int wait(void)
{
    struct proc *curproc = getproc();

    acquire(&proctab.lock);
    for (;;)
    {
        // 查看进程表看该进程是否有孩子 若没有直接退出
        // 若有 且状态为 ZOMBIE 释放子进程资源 若不是继续循环
        // 扫描完后有孩子 但还没进入 ZOMBIE 状态 则 sleep(curproc, &proctab.lock) 等待
        int_t havekids = FALSE;
        for (struct proc *p = proctab.proc; p < &proctab.proc[NPROC]; p++)
        {
            if (p->parent != curproc)
                continue;
            havekids = TRUE;
            if (p->state == ZOMBIE)
            {
                // 找到符合要求的“僵尸”孩子
                int childpid = p->pid;
                memfree(p->kstack);
                p->kstack = 0;
                clearpgd(p->pgdir);
                p->pid = 0;
                p->name[0] = 0;
                p->parent = NULL;
                p->killed = 0;
                p->state = UNUSED;
                release(&proctab.lock);
                return childpid;
            }
        }

        // 没有孩子或本进程被杀死
        if (!havekids || curproc->killed)
        {
            release(&proctab.lock);
            return -1;
        }

        // 有子进程 睡眠等待 儿子在 exit() 函数中唤醒父进程
        sleep(curproc, &proctab.lock);
    }
}

// 切回到 scheduler() 即内核线程 重新选取进程调度
// 若没有 RUNNABLE 状态的进程 则开锁等待中断 wakeup() 唤醒后继续选择调度
void sched(void)
{
    struct proc *p = getproc();

    // 没有获得锁进入 sched()
    if (!alrdyhold(&proctab.lock))
        printk("sched proctab.lock\n");
    if (getcpu()->ncli != 1)
        printk("sched locks\n");
    if (p->state == RUNNING)
        printk("sched running");
    if (readeflags() & FL_IF)
        printk("sched interruptible");

    // intena 是用户进程自己的属性 在切回后恢复
    int_t intena = getcpu()->intena;
    swtch(&p->context, getcpu()->scheduler);
    // 已回来
    getcpu()->intena = intena;
}

// 用户进程的 CPU 时间片已到 时钟中断强行剥夺 调度其他进程
void timetosleep(void)
{
    acquire(&proctab.lock);
    getproc()->state = RUNNABLE;
    // 测试
    printk("time solt is over! %d\n", getproc()->pid);
    sched();
    printk("reget time solt! %d\n", getproc()->pid);
    release(&proctab.lock);
}

// 自动释放现在带有的锁 并睡眠在 chan 上 当再次唤醒时会重新获得丢失的锁
// 在申请它的地方释放
void sleep(void *chan, struct lock *lk)
{
    struct proc *p = getproc();

    if (p == NULL)
        printk("sleep: have not process\n");

    if (lk == 0)
        printk("sleep without lk\n");

    // 在此持有锁 可以保证任何 wakeup 操作都有效
    // 不存在永远唤不醒的进程
    if (lk != &proctab.lock)
    {
        acquire(&proctab.lock);
        release(lk);
    }

    p->chan = chan;
    p->state = SLEEPING;

    sched();

    // 唤醒后执行 清空 chan
    p->chan = 0;

    // 还原原来的锁 由调用者释放
    if (lk != &proctab.lock)
    {
        release(&proctab.lock);
        acquire(lk);
    }
}

// 做出真正的唤醒操作（此时应该已经获得了 proctab 的锁 或本来就有）
static void wkupauth(void *chan)
{
    for (struct proc *p = proctab.proc; p < &proctab.proc[NPROC]; ++p)
        if (p->state == SLEEPING && p->chan == chan)
            p->state = RUNNABLE;
}

// 得到进程表锁
// 调用真正唤醒的函数 wkupauth(chan)
// 释放锁（当已经获得进程表锁时可以直接调用 wkupauth ）
void wakeup(void *chan)
{
    acquire(&proctab.lock);
    wkupauth(chan);
    release(&proctab.lock);
}

// 杀死给定进程号的进程 若在休眠态则将其唤醒
// 具体只是将 proc->kill 置为非零
// 在调用 system call 时发现并调用真正的 exit() 函数将进程的某些资源释放 并唤醒父进程
int kill(int pid)
{
    acquire(&proctab.lock);
    for (struct proc *p = proctab.proc; p < &proctab.proc[NPROC]; p++)
    {
        if (p->pid == pid)
        {
            p->killed = 1;
            // Wake process from sleep if necessary.
            if (p->state == SLEEPING)
                p->state = RUNNABLE;
            release(&proctab.lock);
            return 0;
        }
    }
    release(&proctab.lock);
    return -1;
}
