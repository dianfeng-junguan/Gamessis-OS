.PHONY: boot mount umount run knl cpknl com grub all
CUARGS = -w -g -no-pie -fno-pic -fno-stack-protector -I include -m64 -mcmodel=large 
BOOT = boot.efi
include loader/loader.mk
include test/test.mk
include usrlib/lib.mk
include dl/dl.mk
include tools/kallsyms/kallsyms.mk
KNL_OFILES = bin/int.o bin/main.o bin/log.o \
			bin/memory.o bin/devman.o bin/proc.o bin/inta.o \
			bin/gdt.o bin/gdta.o bin/clock.o bin/clocka.o bin/exe.o \
			bin/syscalla.o bin/framebuffer.o bin/vfs.o bin/sys.o bin/ramfs.o bin/ramdisk.o \
			bin/blk_dev.o bin/blk_buf.o bin/kallsyms.o bin/signal.o bin/int_handlera.o
MODS_OFILES = bin/mods/kb.o bin/mods/disk.o bin/mods/diska.o bin/mods/fat32.o \
				bin/mods/tty.o bin/com.o bin/rd.o#bin/test.o
COM_OFILES = bin/mem.o bin/str.o bin/types.o bin/proca.o bin/font.o
PH_MODIFIER = /mnt/d/Code/Python/elfph/elf.py
QEMU_LOG = -d int,cpu_reset -D log.txt
all:
	make knl
	make loader
	make cpknl
k:
	make knl
	sync
	make cpknl
knl:
	@bash knl.sh
	@objcopy -O elf64-x86-64 -B i386 -I binary res/font.psf bin/font.o
	objcopy rd.img bin/rd.o -B i386 -O elf64-x86-64 -I binary
	@ld -T knl.lds -o bin/gmsknl.elf $(KNL_OFILES) $(MODS_OFILES) $(COM_OFILES) --emit-relocs
	make kallsyms
	@ld -T knl.lds -o bin/gmsknl.elf $(KNL_OFILES) $(MODS_OFILES) $(COM_OFILES) --emit-relocs
	debugedit bin/gmsknl.elf -b /mnt/d/Code/Comprehensive/OS/workspace/64 -d D://Code/Comprehensive/OS/workspace/64
	@#python reloccheat.py bin/gmsknl.elf
	@cp bin/gmsknl.elf bin/gmsknlm.elf
	@objcopy bin/gmsknl.elf -I binary -O elf64-x86-64 bin/gmsknl.o -B i386
	@#python $(PH_MODIFIER) bin/gmsknl.elf
	#@objdump -d bin/gmsknl.elf -j .entry -M intel > knl.s
	@objdump -l -S -d bin/gmsknl.elf -M intel > knl.s
	#@objcopy bin/gmsknl.elf bin/gmsknlm.elf #--change-section-lma .bss+0xffff800000000000 \
#                                              --change-section-lma .text+0xffff800000000000 --change-section-lma .data+0xffff800000000000\
#                                              --change-section-lma .rodata+0xffff800000000000 --change-section-lma .eh_frame+0xffff800000000000
boot:
	@gcc -w -e main -nostdlib \
        -fno-builtin -Wl,--subsystem,10 -o bin/boot.efi boot/boot.c \
		-I lib/efi/em64t -I lib/efi $(CUARGS)
cpboot:
	@sudo cp bin/$(BOOT) /mnt/boot/$(BOOT)
genint:
	python gen_inthandler.py -i tools/ints.list -o knl/int_handler.s -t tools/int_template.s
com:
	@gcc -c com/mem.c -o bin/mem.o $(CUARGS)
	@gcc -c com/str.c -o bin/str.o $(CUARGS)
	@gcc -c com/syscall.c -o bin/syscall.o $(CUARGS)
	@gcc -c com/types.c -o bin/types.o $(CUARGS)
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
	# @del log.txt -serial stdio 
	@qemu-system-x86_64 -hda hda.img -m 2G -s -S -bios OVMF.fd -serial stdio $(QEMU_LOG)#file:qemucom.txt
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