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

void ptabinit(void)
{
    initlock(&ptable.lock, "proctab");
}

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu* getcpu(void)
{
    return &cpu0;
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc* getproc(void)
{
    pcli();
    struct proc *p = getcpu()->proc;
    vcli();
    return p;
}

