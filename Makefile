.PHONY: boot mount umount run knl cpknl com grub all
CFLAGS = -w -g -fno-pie -fno-pic -nostdlib -fno-stack-protector -nostartfiles \
-I include -m64 -O0 -fno-strict-aliasing -mcmodel=large -fPIC
ASMFLAGS=-g -f elf64 -w-zext-reloc -w-zeroing
SETUPFLAGS=-g -f elf32 -w-zext-reloc -w-zeroing
OBJCOPY=objcopy
BOOT = boot.efi
ASM=nasm
CC=gcc
BUILD=bin
LD=ld
include loader/loader.mk
include test/test.mk
include usrlib/lib.mk
include dl/dl.mk
include tools/kallsyms/kallsyms.mk
KNL_OFILES = int.o main.o log.o \
			memory.o devman.o proc.o inta.o \
			gdt.o gdta.o clock.o clocka.o exe.o \
			syscalla.o framebuffer.o vfs.o sys.o ramfs.o ramdisk.o \
			kallsyms.o signal.o int_handlera.o driverman.o \
			binload.o drvload.o volume.o
MODS_OFILES = kb.o disk.o diska.o fat32.o \
				tty.o com.o rd.o elfbin.o scanner.o#test.o
COM_OFILES = mem.o str.o types.o proca.o font.o
PH_MODIFIER = /mnt/d/Code/Python/elfph/elf.py
QEMU_LOG = -d int,cpu_reset,guest_errors,page -D log/log.txt
all:
	make knl
	make loader
	make cpknl
k:
	make knl
	sync
	make cpknl
knl:protoknl font
	objcopy rd.img bin/rd.o -B i386 -O elf64-x86-64 -I binary
	@ld -T knl.lds -o bin/gmsknl.elf $(addprefix $(BUILD)/,$(KNL_OFILES)) $(addprefix $(BUILD)/,$(MODS_OFILES)) $(addprefix $(BUILD)/,$(COM_OFILES)) --emit-relocs
	make kallsyms
	@ld -T knl.lds -o bin/gmsknl.elf $(addprefix $(BUILD)/,$(KNL_OFILES)) $(addprefix $(BUILD)/,$(MODS_OFILES)) $(addprefix $(BUILD)/,$(COM_OFILES)) --emit-relocs
	debugedit bin/gmsknl.elf -b /mnt/d/Code/Comprehensive/OS/workspace/64 -d D://Code/Comprehensive/OS/workspace/64
	@cp bin/gmsknl.elf bin/gmsknlm.elf
	@objcopy bin/gmsknl.elf -I binary -O elf64-x86-64 bin/gmsknl.o -B i386
	@objdump -l -S -d bin/gmsknl.elf -M intel > disas/knl.s
font: res/font.psf
	@objcopy -O elf64-x86-64 -B i386 -I binary res/font.psf bin/font.o
boot:
	@gcc -w -e main -nostdlib \
        -fno-builtin -Wl,--subsystem,10 -o bin/boot.efi boot/boot.c \
		-I lib/efi/em64t -I lib/efi $(CFLAGS)
cpboot:
	@sudo cp bin/$(BOOT) /mnt/boot/$(BOOT)
genint:
	python gen_inthandler.py -i tools/ints.list -o knl/int_handler.s -t tools/int_template.s
com:
	@gcc -c com/mem.c -o bin/mem.o $(CFLAGS)
	@gcc -c com/str.c -o bin/str.o $(CFLAGS)
	@gcc -c com/syscall.c -o bin/syscall.o $(CFLAGS)
	@gcc -c com/types.c -o bin/types.o $(CFLAGS)
cpknl_old:
	@make mount
	@sudo cp bin/gmsknl.elf /mnt/gmsknl
	@make umount
ck:
	@sudo cp bin/gmsknl.elf /mnt/boot/gmsknl
cpknl:
	@make imgcon
	@make imgmnt
	@sudo cp bin/gmsknl.img /mnt/boot/gmsknl
	@make imgdismnt
	@make imgdiscon
mount:
	@sudo mount hd.img /mnt
umount:
	@sudo umount /mnt
refi:
	@sudo qemu-system-x86_64 -hda hda.img -m 2G -bios OVMF.fd
run:
	@rm log.txt -f
	@sudo qemu-system-x86_64 -hda hda.img -m 2G -bios OVMF.fd $(QEMU_LOG)
debug_bios:
	@qemu-system-x86_64 -hda hda.img -m 2G -s -S -serial stdio
debug:
	@qemu-system-x86_64 -hda hda.img -m 2G -s -S -bios OVMF.fd -serial stdio $(QEMU_LOG)
	#file:qemucom.txt
debuglog:
	@qemu-system-x86_64 -hda hda.img -m 2G -s -S -bios OVMF.fd -serial file:log/qemu.txt $(QEMU_LOG)
debs:
	@qemu-system-x86_64 -hda hda.img -m 2G -s -S -bios OVMF.fd -serial stdio

runser:
	@qemu-system-x86_64 -hda hda.img -m 2G -bios OVMF.fd -serial stdio
debugdev:
	@sudo qemu-system-i386 /dev/nbd0 -m 2G -s -S
debugnew:
	@sudo qemu-system-i386 plpbt/plpbt.img -m 2G
bochs:
	@bochsdbg -q -f bochsrc.bxrc
bochsl:
	@bochs -q -f bochsrc.bxrc
qcow2:
	@qemu-img create -f qcow2 hda.img 512M
	@sudo modprobe nbd
	@sudo qemu-nbd --connect=/dev/nbd0 hda.img
	@sudo fdisk /dev/nbd0
imgdismnt:
	@sudo umount /mnt/boot
	@sudo umount /mnt
imgdiscon:
	@sudo qemu-nbd --disconnect /dev/nbd0
imgcon:
	@sudo modprobe nbd
	@sudo qemu-nbd --connect=/dev/nbd0 hda.img
imgmkfs:
	@sudo mkfs.fat -F 32 /dev/nbd0p1
	@sudo mkfs.fat -F 32 /dev/nbd0p2
imgmnt:
	@sudo mount /dev/nbd0p2 /mnt
	@sudo mount /dev/nbd0p1 /mnt/boot
imgmntf:
	@sudo mount /dev/nbd0p2 /mnt
	@sudo mkdir /mnt/boot   
	@sudo mount /dev/nbd0p1 /mnt/boot
grub:
	@sudo mkdir /mnt/boot/EFI
	@sudo grub-install --target=x86_64-efi --efi-directory=/mnt/boot/EFI --bootloader-id=GRUB --recheck --boot-directory=/mnt/boot /dev/nbd0
	@sudo cp -r well-confugured-grub/* /mnt/boot/grub/
clean:
	@rm bin/*.o
include knl/Makefile
proto_knl: KNL_OFILES
	$(LD) $^ -o $(BUILD)/gmsknl.elf