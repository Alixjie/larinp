#include "mmu.h"

.globl dotsame
dotsame:
  # 建立中断帧大家相同的部分
  pushl %ds
  pushl %es
  pushl %fs
  pushl %gs
  pushal
  
  # 切换到内核数据段
  movw $(SEG_KDATA<<3), %ax
  movw %ax, %ds
  movw %ax, %es

  # 将当前 esp 作为参数压入栈 intr(*esp)
  pushl %esp
  call intr
  addl $4, %esp

  # 返回中断前恢复
.globl trapret
trapret:
  popal
  popl %gs
  popl %fs
  popl %es
  popl %ds
  addl $0x8, %esp 
  iret
