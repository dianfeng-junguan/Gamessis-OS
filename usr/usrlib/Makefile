.PHONY: syscall
libobjs=$(patsubst usr/usrlib/%.c,%.o,$(wildcard usr/usrlib/*.c))
$(libobjs):%.o: usr/usrlib/%.c
	gcc -c $^ -o bin/$@ -nostartfiles -nostdlib -nostdinc -fno-stack-protector -w -g -Iinclude
syscallsa.o: usr/usrlib/syscalls.asm
	nasm -f elf64 -o bin/syscallsa.o usr/usrlib/syscalls.asm
lib:$(libobjs) bin/syscallsa.o
	ar q bin/libgms.a $(addprefix bin/,$(libobjs)) bin/syscallsa.o
	objdump -d bin/libgms.a > bin/libsyscall.txt -Mintel


# python syscall/gen.py
# rm syscall/libsyscall.a
# nasm -f elf64 -o syscall/syscall.o syscall/res/syscalls.asm
# gcc -nostartfiles -nostdlib -nostdinc -fno-stack-protector -c syscall/res/syscallc.c -o syscall/syscallc.o -w -g -Iinclude
