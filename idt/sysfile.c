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
  int i;
  uint_t uargv, uarg;

  if (argstr(0, &path) < 0 || argint(1, (int *)&uargv) < 0)
  {
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for (i = 0;; i++)
  {
    if (i >= NUMOFELE(argv))
      return -1;
    if (fetchint(uargv + 4 * i, (int *)&uarg) < 0)
      return -1;
    if (uarg == 0)
    {
      argv[i] = 0;
      break;
    }
    if (fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  //return exec(path, argv);
  return 1;
}
