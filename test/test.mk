.PHONY: test
test:
	gcc -c -g test/test.c -o bin/test.o -nostdlib -nostdinc -I include -nostartfiles -nodefaultlibs -fno-stack-protector -w
	ld bin/test.o bin/gmslibc.a -O elf64-x86-64 -o bin/test.elf -e main
	objcopy -I binary bin/test.elf -O elf64-x86-64 bin/test.o -B i386
cptest:
	sudo mount rd.img /mnt
	sudo cp bin/test.elf /mnt/test.elf
	sudo umount /mnt