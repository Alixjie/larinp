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

  // 若没出错 不会执行到这里
  // exit() 最后调用 sched() 切换进程 父进程将会把剩下占中的资源释放
  return 0;
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
  int_t para;

  if (argint(0, &para) < 0)
    return -1;
  int_t addr = getproc()->sz;
  if (growproc(para) < 0)
    return -1;
  // 返回改变前的进程大小（程序用户态可用的最大地址）
  return addr;
}

int sys_sleep(void)
{
  int para;

  if (argint(0, &para) < 0)
    return -1;
  acquire(&didalock);
  uint_t rec = dida;
  while (dida - rec < para)
  {
    // 进程在休眠期间被杀死 释放锁 返回
    if (getproc()->killed)
    {
      release(&didalock);
      return -1;
    }
    // 继续睡眠 直到时间到来
    sleep(&dida, &didalock);
  }
  release(&didalock);
  return 0;
}

// 开机到现在的系统 dida 数
int sys_uptime(void)
{
  acquire(&didalock);
  uint_t setupdida = dida;
  release(&didalock);
  return setupdida;
}
