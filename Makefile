#!Makefile

C_SOURCES = $(shell find . -name "*.c")
C_OBJECTS = $(patsubst %.c, %.o, $(C_SOURCES))
C_BIBID = $(patsubst %.c, %.d, $(C_SOURCES))
S_SOURCES = $(shell find . -name "*.S" ! -path "./parasite.S" ! -path "./boot/*")
S_OBJECTS = $(patsubst %.S, %.o, $(S_SOURCES))


CC = gcc
LD = ld 
ASM = gas
OBJCOPY = objcopy
OBJDUMP = objdump

C_FLAGS = -I include -fno-pic -static -fno-builtin -fno-strict-aliasing -O2 -Wall -MD -ggdb -m32 -Werror -fno-omit-frame-pointer -fno-stack-protector -fno-pie -no-pie -nostdinc -c
S_FLAGS = -I include -m32 -gdwarf-2 -Wa,-divide   -c
LD_FLAGS = -T scripts/kernel.ld -m elf_i386 -nostdlib
ASM_FLAGS = -m32 -gdwarf-2 -Wa,-divide

all: $(S_OBJECTS) $(C_OBJECTS) parasite boot link update_image 

parasite: parasite.S
	$(CC) $(C_FLAGS) parasite.S
	$(LD) -N -e start -Ttext 0 -m elf_i386 -nostdlib -o parasite.out parasite.o
	$(OBJCOPY) -S -O binary parasite.out parasite
	# $(OBJDUMP) -S parasite.o > parasite.asm

boot: boot/boot.S
	$(CC) $(S_FLAGS) $< -o $@

.c.o:
	@echo 编译代码文件 $< ...
	$(CC) $(C_FLAGS) $< -o $@

.S.o:
	@echo 编译汇编文件 $< ...
	$(CC) $(S_FLAGS) $< -o $@

link:
	@echo 链接内核文件...
	$(LD) $(LD_FLAGS) -o jorny_kernel boot/boot.o $(S_OBJECTS) $(C_OBJECTS) -b binary parasite

.PHONY:clean 
clean:
	$(RM) $(C_BIBID) $(S_OBJECTS) $(C_OBJECTS) jorny_kernel parasite parasite.o parasite.out boot/boot.o

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
