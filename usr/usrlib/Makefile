.PHONY: syscall
libobjs=$(patsubst usr/usrlib/%.c,%.o,$(wildcard usr/usrlib/*.c))
$(libobjs):%.o: usr/usrlib/%.c
	gcc -c $^ -o bin/lib/$@ -nostartfiles -nostdlib -nostdinc -fno-stack-protector -w -g -Iinclude
syscallsa.o: usr/usrlib/syscalls.asm
	nasm -f elf64 -o bin/lib/syscallsa.o usr/usrlib/syscalls.asm
lib:$(libobjs) syscallsa.o
	rm bin/libgms.a
	ar q bin/libgms.a $(addprefix bin/lib/,$(libobjs)) bin/lib/syscallsa.o
	objdump -d bin/libgms.a > bin/libsyscall.txt -Mintel


# python syscall/gen.py
# rm syscall/libsyscall.a
# nasm -f elf64 -o syscall/syscall.o syscall/res/syscalls.asm
# gcc -nostartfiles -nostdlib -nostdinc -fno-stack-protector -c syscall/res/syscallc.c -o syscall/syscallc.o -w -g -Iinclude
