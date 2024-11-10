.PHONY: boot mount umount run knl cpknl com grub
CUARGS = -w -g -no-pie -fno-pic -fno-stack-protector -I include -m64
BOOT = boot.efi
KNL_OFILES = bin/setupa.o bin/int.o bin/main.o bin/log.o \
			bin/memory.o bin/virfs.o bin/devman.o bin/proc.o bin/inta.o \
			bin/gdt.o bin/gdta.o bin/clock.o bin/clocka.o bin/exe.o \
			bin/syscalla.o bin/framebuffer.o bin/vfs.o bin/sys.o bin/setup64a.o
MODS_OFILES = bin/mods/kb.o bin/mods/disk.o bin/mods/diska.o bin/mods/fat32.o \
				bin/mods/tty.o bin/com.o
COM_OFILES = bin/mem.o bin/str.o bin/types.o bin/proca.o bin/font.o
k:
	make knl
	sync
	make cpknl
knl:
	@bash knl.sh
	@objcopy -O elf64-x86-64 -B i386 -I binary res/font.psf bin/font.o
	@ld -T lds.lds -o bin/gmsknl.elf $(KNL_OFILES) $(MODS_OFILES) $(COM_OFILES)
	@objdump -d bin/gmsknl.elf -j .entry -M intel > knl.s
	@objdump -S -d bin/gmsknl.elf -M intel >> knl.s
	@objcopy bin/gmsknl.elf bin/gmsknlm.elf --change-address=0xffff800000000000
boot:
	@gcc -w -e main -nostdlib \
        -fno-builtin -Wl,--subsystem,10 -o bin/boot.efi boot/boot.c \
		-I lib/efi/em64t -I lib/efi $(CUARGS)
cpboot:
	@sudo cp bin/$(BOOT) /mnt/boot/$(BOOT)
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
	@sudo cp bin/gmsknl.elf /mnt/boot/gmsknl
	@make imgdismnt
	@make imgdiscon
mount:
	@sudo mount hd.img /mnt
umount:
	@sudo umount /mnt
run:
	@sudo qemu-system-x86_64 -hda hda.img -m 2G -bios OVMF.fd
debug:
	@qemu-system-x86_64 -hda hda.img -m 2G -s -S -bios OVMF.fd -serial stdio
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