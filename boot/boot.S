#include "memlayout.h"
#include "mmu.h"
#include "param.h"

.p2align 2
.text
.globl multiboot_header
multiboot_header:
  #define magic 0x1badb002
  #define flags 3
  .long magic
  .long flags
  .long (-magic-flags)

.globl _start
.globl glb_mboot_ptr
_start = V2P_A(entry)

.globl entry
entry:
  # 允许 4M 超级页
  movl    %cr4, %eax
  orl     $(CR4_PSE), %eax
  movl    %eax, %cr4

  # 设置临时页目录
  movl    $(V2P_A(tempgdir)), %eax
  movl    %eax, %cr3

  # 开启分页
  movl    %cr0, %eax
  orl     $(CR0_PG|CR0_WP), %eax
  movl    %eax, %cr0

  movl %ebx, (glb_mboot_ptr)

  # 设置内核栈
  movl $stack, %esp

  mov $main, %eax
  jmp *%eax

.comm glb_mboot_ptr, 4

.bss
    .skip KSTACKSIZE
stack:
