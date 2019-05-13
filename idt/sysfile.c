#include "types.h"
#include "param.h"
#include "mmu.h"
#include "proc.h"
#include "idt.h"
#include "vmm.h"
#include "string.h"

int sys_exec(void)
{
  char *path, *argv[MAXARG];
  uint_t uargv, uarg;

  // 读取 path argv 的值
  if (argstr(0, &path) < 0 || argint(1, (int *)&uargv) < 0)
    return -1;

  // 清空 argv[MAXARG]
  memset(argv, 0, sizeof(argv));
  for (int_t i = 0;; ++i)
  {
    if (i >= NUMOFELE(argv))
      return -1;
    // 获取第 n 个字符串的首地址
    if (fetchint(uargv + 4 * i, (int *)&uarg) < 0)
      return -1;
    if (uarg == 0)
    {
      argv[i] = 0;
      break;
    }
    // 根据前面获得的第 n 个字符串的首地址 给 uarg 赋值 并返回字符串长度
    if (fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
