#!Makefile

C_SOURCES = $(shell find . -name "*.c")
C_OBJECTS = $(patsubst %.c, %.o, $(C_SOURCES))
S_SOURCES = $(shell find . -name "*.S" ! -path "./drivers/*")
S_OBJECTS = $(patsubst %.S, %.o, $(S_SOURCES))

CC = gcc
LD = ld 
ASM = gas

C_FLAGS = -c -Wall -m32 -ggdb -gstabs+ -nostdinc -fno-builtin -fno-stack-protector -no-pie -fno-pic -I include
LD_FLAGS = -T scripts/kernel.ld -m elf_i386 -nostdlib
ASM_FLAGS = -m32 -gdwarf-2 -Wa,-divide

all: $(S_OBJECTS) $(C_OBJECTS) parasite link update_image 

parasite: include/parasite.S
	$(CC) $(CFLAGS) include/parasite.S
	$(LD) -N -e start -Ttext 0 -o parasite.out
	$(OBJCOPY) -S -O binary parasite.out parasite

.c.o:
	@echo 编译代码文件 $< ...
	$(CC) $(C_FLAGS) $< -o $@

.S.o:
	@echo 编译汇编文件 $< ...
	$(CC) $(C_FLAGS) $< -o $@

link:
	@echo 链接内核文件...
	$(LD) $(LD_FLAGS) $(S_OBJECTS) $(C_OBJECTS) -o jorny_kernel -b binary parasite

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
