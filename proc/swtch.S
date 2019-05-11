# void swtch(struct context **old, struct context *new);


.globl swtch
swtch:
  movl 4(%esp), %eax
  movl 8(%esp), %edx

  # 保存旧的被调用者寄存器
  pushl %ebp
  pushl %ebx
  pushl %esi
  pushl %edi

  # 切换栈
  movl %esp, (%eax)
  movl %edx, %esp

  # 加载新的被调用者寄存器
  popl %edi
  popl %esi
  popl %ebx
  popl %ebp
  ret
