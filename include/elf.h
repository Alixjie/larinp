#include "types.h"

// 查看 ELF 文件头的 magic 字段 是否是 0x7F，“E”，“L”，“F”
#define ELF_MAGIC 0x464C457FU

// ELF 文件头
struct elfhdr
{
  uint_t magic; 
  uchar_t elf[12];
  ushort_t type;
  ushort_t machine;
  uint_t version;
  uint_t entry;
  uint_t phoff;
  uint_t shoff;
  uint_t flags;
  ushort_t ehsize;
  ushort_t phentsize;
  ushort_t phnum;
  ushort_t shentsize;
  ushort_t shnum;
  ushort_t shstrndx;
};

// 程序段头结构体
struct proghdr
{
  uint_t type;
  uint_t off;
  uint_t vaddr;
  uint_t paddr;
  uint_t filesz;
  uint_t memsz;
  uint_t flags;
  uint_t align;
};

// 该段允许加载
#define ELF_PROG_LOAD 1

// 该段的属性
#define ELF_PROG_FLAG_EXEC 1
#define ELF_PROG_FLAG_WRITE 2
#define ELF_PROG_FLAG_READ 4
