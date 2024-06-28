.PHONY: boot mount umount run knl cpknl com
CUARGS = -w -g -m32 -no-pie -fno-pic -fno-stack-protector -I include
BOOT = boot.efi
KNL_OFILES = bin/setupa.o bin/int.o bin/main.o bin/log.o \
			bin/memory.o bin/virfs.o bin/devman.o bin/proc.o bin/inta.o \
			bin/gdt.o bin/gdta.o bin/clock.o bin/clocka.o bin/exe.o \
			bin/syscalla.o
MODS_OFILES = bin/mods/kb.o bin/mods/disk.o bin/mods/diska.o bin/mods/fat16.o \
				bin/mods/tty.o
COM_OFILES = bin/mem.o bin/str.o bin/types.o bin/proca.o
boot:
	@gcc -w -e main -nostdlib \
        -fno-builtin -Wl,--subsystem,10 -o bin/boot.efi boot/boot.c \
		-I lib/efi/em64t -I lib/efi $(CUARGS)
knl:
	# @nasm knl/setup.s -o bin/setup.o -f elf32 -l setup.lst
	# @gcc -c knl/main.c -o bin/main.o $(CUARGS)
	# @gcc -c knl/log.c -o bin/log.o $(CUARGS)
	@./knl.sh
	@ld -T lds.lds -o bin/gmsknl.elf $(KNL_OFILES) $(MODS_OFILES) $(COM_OFILES)
	@objdump -d bin/gmsknl.elf -M intel > knl.s
cpboot:
	@sudo cp bin/$(BOOT) /mnt/boot/$(BOOT)
com:
	@gcc -c com/mem.c -o bin/mem.o $(CUARGS)
	@gcc -c com/str.c -o bin/str.o $(CUARGS)
	@gcc -c com/syscall.c -o bin/syscall.o $(CUARGS)
	@gcc -c com/types.c -o bin/types.o $(CUARGS)
cpknl:
	@make mount
	@sudo cp bin/gmsknl.elf /mnt/gmsknl
	@make umount
mount:
	@sudo mount hd.img /mnt
umount:
	@sudo umount /mnt
run:
	@sudo qemu-system-x86_64 -hda hd.img -m 1G
debug:
	@qemu-system-i386 hd.img -m 2G -s -S
bochs:
	@bochsdbg -q -f bochsrc.bxrc