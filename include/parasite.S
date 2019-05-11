#include "syscall.h"
#include "idt.h"


# 调用 exec(char *path, char **argv) 加载文件系统中的 init.c
.globl start
start:
  pushl $argv
  pushl $init
  # 模拟函数调用压入返回地址
  pushl $0  
  movl $SYS_exec, %eax
  int $SYS_CALL

# for(;;) exit();
exit:
  movl $SYS_exit, %eax
  int $SYS_CALL
  jmp exit

# char init[] = "/init\0";
init:
  .string "/init\0"

# char *argv[] = { init, 0 };
.p2align 2
argv:
  .long init
  .long 0

