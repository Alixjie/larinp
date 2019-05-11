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

    uint_t priority;     // 用于优先级调度
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

void swtch(struct context**, struct context*);
