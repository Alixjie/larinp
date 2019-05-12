struct cpu
{
    struct context *scheduler;   // 保存内核调度器线程上下文
    struct taskstate ts;         // 进程状态段
    struct segdesc gdt[SEG_NUM]; // GDT 表
    int ncli;                    // cli的层数
    int intena;                  // 在 pcli() 前是否允许中断
    struct proc *proc;           // 当前运行进程（进程 / null）
};

//当前线程上下文（用于schedule()、sche()切换线程）
struct context
{
    uint_t edi;
    uint_t esi;
    uint_t ebx;
    uint_t ebp;
    uint_t eip;
};

// 进程状态（包含进程表状态）
enum procstate
{
    UNUSED, // 未使用
    EMBRYO, // 已占用
    SLEEPING,
    RUNNABLE,
    RUNNING,
    ZOMBIE
};

// Per-process state
struct proc
{
    uint_t sz;                  // 进程大小（字节）
    pde_t *pgdir;               // 页目录地址
    char *kstack;               // 内核栈所在页的起始地址
    enum procstate state;       // 进程状态
    int pid;                    // PID
    struct proc *parent;        // 父进程
    struct trapframe *tf;       // Trap frame帧栈
    struct context *context;    // 用户内核线程上下文
    void *chan;                 // 非零时 进程休眠在某一情况下
    int killed;                 // 非零时 进程将被杀死
    struct file *ofile[NOFILE]; // 打开文件表
    struct dentry *cwd;         // 当前目录 伟哥
    char name[16];              // 进程名

    uint_t priority;      // 用于优先级调度
    struct dentry *thisp; // 用于后续扩展缺页中断时加载 伟哥
};

// proctab 的锁初始化
void ptabinit(void);

// 得到 CPU
struct cpu *getcpu(void);

// 得到 CPU 当前运行进程
// 有则返回进程指针 没有返回 NULL
struct proc *getproc(void);

// 初始化第一个用户进程 返回到用户进程作准备
void backtouser(void);

// 内核态调度线程
void scheduler(void);

// 从 old context 切换到 new context 内核线程切换
void swtch(struct context **, struct context *);

// fork 完的子进程首先返回的地方
// parasite 做了特殊处理也会返回到这里
void forkret(void);

// 增加/减少 当前进程用户态的内存大小
// n > 0 调用 gvusrmen 增加 | n < 0 调用 cfcusrmen 减小
int growproc(int n);

// 创建该进程的影子进程（子进程）
// 子进程将会 forkret()->trapret()->user mode
int fork(void);

// 释放进程的有些资源 唤醒等待的父进程继续回收
// 本函数执行后正常情况下不会返回 若执行最后一句则出错
void exit(void);

// 等待孩子进程退出（孩子进程退出时唤醒）
// 继续释放孩子进程的资源（内核栈、页目录表...）
int wait(void);

// 切回到 scheduler() 即内核线程 重新选取进程调度
// 若没有 RUNNABLE 状态的进程 则开锁等待中断 wakeup() 唤醒后继续选择调度
void sched(void);

// 用户进程的 CPU 时间片已到 时钟中断强行剥夺 调度其他进程
void timetosleep(void);

// 自动释放现在带有的锁 并睡眠在 chan 上 当再次唤醒时会重新获得丢失的锁
// 在申请它的地方释放
void sleep(void *chan, struct lock *lk);

// 做出真正的唤醒操作（此时应该已经获得了 proctab 的锁 或本来就有）
static void wkupauth(void *chan);

// 得到进程表锁
// 调用真正唤醒的函数 wkupauth(chan)
// 释放锁（当已经获得进程表锁时可以直接调用 wkupauth ）
void wakeup(void *chan);

// 杀死给定进程号的进程 若在休眠态则将其唤醒
// 具体只是将 proc->kill 置为非零
// 在调用 system call 时发现并调用真正的 exit() 函数将进程的某些资源释放 并唤醒父进程
int kill(int pid);
