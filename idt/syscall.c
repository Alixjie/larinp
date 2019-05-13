#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "x86.h"
#include "syscall.h"
#include "debug.h"
#include "vmm.h"

extern int sys_chdir(void);
extern int sys_close(void);
extern int sys_dup(void);
extern int sys_exec(void);
extern int sys_exit(void);
extern int sys_fork(void);
extern int sys_fstat(void);
extern int sys_getpid(void);
extern int sys_kill(void);
extern int sys_link(void);
extern int sys_mkdir(void);
extern int sys_mknod(void);
extern int sys_open(void);
extern int sys_pipe(void);
extern int sys_read(void);
extern int sys_sbrk(void);
extern int sys_sleep(void);
extern int sys_unlink(void);
extern int sys_wait(void);
extern int sys_write(void);
extern int sys_uptime(void);
extern int sys_prioty(void);

// 得到当前进程给定地址处的 int 型参数
int fetchint(uint_t addr, int *arg)
{
  struct proc *curproc = getproc();

  // 用户态的代码需要做检查（有没有到达程序边界）
  if (addr >= curproc->sz || addr + 4 > curproc->sz)
    return -1;
  *arg = *(int *)(addr);
  return 0;
}

// 将 addr 的值强转为 char * 赋值给 *parg 
// 检查用户参数是否越界（用户代码不可信）并返回字符串长度
int fetchstr(uint_t addr, char **parg)
{
  struct proc *curproc = getproc();

  // 用户态的代码需要做检查（有没有到达程序边界）
  if (addr >= curproc->sz)
    return -1;
  *parg = (char *)addr;
  char_t end = (char *)curproc->sz;
  for (char *s = *parg; s < end; s++)
  {
    if (*s == 0)
      // 到字符串尾 返回字符串长度
      return s - *parg;
  }
  return -1;
}

// 获取第 n 个 32 位 int 型系统调用参数
int argint(int n, int *arg)
{
  // 从右往左入栈 参数前还有一个 eip
  return fetchint((getproc()->tf->esp) + 4 + 4 * n, arg);
}

// 获得第 n 个 char * 类型的系统调用参数
int argstr(int n, char **parg)
{
  int addr;
  // 获得第 n 个位置的值 即字符串开始位置的地址
  if (argint(n, &addr) < 0)
    return -1;
  return fetchstr(addr, parg);
}

// 定义函数指针数组
static int (*syscalls[])(void) = {
    [SYS_fork] sys_fork,
    [SYS_exit] sys_exit,
    [SYS_wait] sys_wait,
    //[SYS_pipe] sys_pipe,
    //[SYS_read] sys_read,
    [SYS_kill] sys_kill,
    [SYS_exec] sys_exec,
    //[SYS_fstat] sys_fstat,
    //[SYS_chdir] sys_chdir,
    //[SYS_dup] sys_dup,
    [SYS_getpid] sys_getpid,
    [SYS_sbrk] sys_sbrk,
    [SYS_sleep] sys_sleep,
    [SYS_uptime] sys_uptime,
    // [SYS_open] sys_open,
    // [SYS_write] sys_write,
    // [SYS_mknod] sys_mknod,
    // [SYS_unlink] sys_unlink,
    // [SYS_link] sys_link,
    // [SYS_mkdir] sys_mkdir,
    // [SYS_close] sys_close,
    // [SYS_prioty] sys_prioty,
};

void syscall(void)
{
  struct proc *curproc = getproc();

  // 测试
  printk("I am in system call!\n");

  int callnum = curproc->tf->eax;
  if (callnum > 0 && callnum < NUMOFELE(syscalls) && syscalls[callnum])
    // 得到返回值（正数）
    curproc->tf->eax = syscalls[callnum]();
  else
  {
    printk("%d %s: unknown system call %d\n", curproc->pid, curproc->name, callnum);
    // 返回值小于 0 失败的系统调用
    curproc->tf->eax = -1;
  }
}
