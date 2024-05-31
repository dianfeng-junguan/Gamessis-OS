.PHONY: boot mount umount run knl cpknl
CUARGS = -w -g -m32 -no-pie -fno-pic -fno-stack-protector -I include
BOOT = boot.efi

boot:
	@gcc -w -e main -nostdlib \
        -fno-builtin -Wl,--subsystem,10 -o bin/boot.efi boot/boot.c \
		-I lib/efi/em64t -I lib/efi $(CUARGS)
knl:
	@nasm knl/setup.s -o bin/setup.o -f elf32 -l setup.lst
	@gcc -c knl/main.c -o bin/main.o $(CUARGS)
	@gcc -c knl/log.c -o bin/log.o $(CUARGS)
	@ld -T lds.lds -o bin/gmsknl.elf bin/setup.o bin/main.o bin/log.o
	@objdump -d bin/gmsknl.elf -M intel > knl.s
cpboot:
	@sudo cp bin/$(BOOT) /mnt/boot/$(BOOT)
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
	@qemu-system-i386 -hda hd.img -m 1G -s -S