#!Makefile

C_SOURCES = $(shell find . -name "*.c")
C_OBJECTS = $(patsubst %.c, %.o, $(C_SOURCES))
S_SOURCES = $(shell find . -name "*.S")
S_OBJECTS = $(patsubst %.S, %.o, $(S_SOURCES))

CC = gcc
LD = ld 
ASM = gas

CFLAGS=-m32 -ggdb -gstabs+ -fno-stack-protector -fno-builtin -fno-strict-aliasing -O0 -Wall -fno-pic -nostdinc  -I include

C_FLAGS = -Wall -m32 -ggdb -gstabs+ -nostdinc -fno-builtin -fno-stack-protector -no-pie -fno-pic -I include
LD_FLAGS = -T scripts/kernel.ld -m elf_i386 -nostdlib
ASM_FLAGS = -m32 -gdwarf-2 -Wa,-divide

all: $(S_OBJECTS) $(C_OBJECTS) link update_image 

boot.o:boot/boot.S
	$(CC) $(CFLAGS) -c boot/boot.S -o boot.o

.c.o:
	@echo 编译代码文件 $< ...
	$(CC) $(C_FLAGS) $< -o $@

.S.o:
	@echo 编译汇编文件 $< ...
	$(CC) $(C_FLAGS) $<

link:
	@echo 链接内核文件...
	$(LD) $(LD_FLAGS) $(S_OBJECTS) $(C_OBJECTS) -o jorny_kernel

.PHONY:clean 
clean:
	$(RM) $(S_OBJECTS) $(C_OBJECTS) jorny_kernel

.PHONY:update_image 
update_image:
	sudo mount floppy.img /mnt/kernel
	sudo cp jorny_kernel /mnt/kernel/jorny_kernel
	sleep 1
	sudo umount /mnt/kernel

.PHONY:mount_image 
mount_image:
	sudo mount floppy.img /mnt/kernel

.PHONY:umount_image 
umount_image:
	sudo umount /mnt/kernel

.PHONY:qemu 
qemu:
	qemu -fda floppy.img -boot a

.PHONY:debug 
debug:
	qemu -S -s -fda floppy.img -boot a &
	sleep 1
	cgdb -x scripts/gdbinit
