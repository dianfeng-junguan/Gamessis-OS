.PHONY: loader
LOADERC_ARGS=-w -g -fno-pie -fno-pic -nostdlib -fno-stack-protector -nostartfiles \
             -I include -m64 -O0 -fno-strict-aliasing -mcmodel=large

loader:
	nasm loader/setup.s -o bin/setupa.o -f elf32 -w-zext-reloc -w-zeroing
	objcopy -I elf32-i386 -O elf64-x86-64 bin/setupa.o bin/setupa.o
	nasm loader/setup64.s -o bin/setup64a.o -f elf64 -w-zext-reloc -w-zeroing
	gcc	-c loader/reloc.c -o bin/reloc.o -m64 $(LOADERC_ARGS)
	ld -T loader/loader.lds -o bin/gmsknl.img bin/setupa.o bin/setup64a.o bin/gmsknl.o bin/reloc.o
	objdump -d bin/gmsknl.img > img.s