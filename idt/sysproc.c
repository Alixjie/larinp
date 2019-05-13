#include "types.h"
#include "x86.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "idt.h"

extern struct lock didalock;
extern uint_t dida;

int sys_fork(void)
{
  return fork();
}

int sys_exit(void)
{
  exit();
  return 0; // not reached
}

int sys_wait(void)
{
  return wait();
}

int sys_kill(void)
{
  int pid;

  if (argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int sys_getpid(void)
{
  return getproc()->pid;
}

int sys_sbrk(void)
{
  int addr;
  int n;

  if (argint(0, &n) < 0)
    return -1;
  addr = getproc()->sz;
  if (growproc(n) < 0)
    return -1;
  return addr;
}

int sys_sleep(void)
{
  int n;
  uint_t ticks0;

  if (argint(0, &n) < 0)
    return -1;
  acquire(&didalock);
  ticks0 = dida;
  while (dida - ticks0 < n)
  {
    if (getproc()->killed)
    {
      release(&didalock);
      return -1;
    }
    sleep(&dida, &didalock);
  }
  release(&didalock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int sys_uptime(void)
{
  uint_t xticks;

  acquire(&didalock);
  xticks = dida;
  release(&didalock);
  return xticks;
  return 0;
}
