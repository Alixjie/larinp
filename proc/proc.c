#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "lock.h"

extern void forkret(void);
extern void trapret(void);

struct
{
    struct lock lock;
    struct proc proc[NPROC];
} ptable;

static struct cpu cpu0;

static struct proc *initproc;

int nextpid = 1;

static void wkupauth(void *chan);

// ptable 的锁初始化
void ptabinit(void)
{
    initlock(&ptable.lock, "proctab");
}

// 得到当前 CPU 
struct cpu* getcpu(void)
{
    return &cpu0;
}

// 得到当前 CPU 正在运行的进程
// 有则得到进程的指针 没有返回 NULL
struct proc* getproc(void)
{
    pcli();
    struct proc *p = getcpu()->proc;
    vcli();
    return p;
}

