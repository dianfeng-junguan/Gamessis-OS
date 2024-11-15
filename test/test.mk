.PHONY: test
test:
	gcc -c test/test.c -o bin/test.o -nostdlib -nostdinc -I include -nostartfiles -nodefaultlibs
	ld bin/test.o -O elf64-x86-64 -o bin/test.elf -e main
	objcopy -I binary bin/test.elf -O elf64-x86-64 bin/test.o -B i386