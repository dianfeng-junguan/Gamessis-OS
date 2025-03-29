.PHONY: loader
loaderobjs=reloc.o setupa.o setup64a.o gmsknl.o
LOADERC_ARGS=-w -g -fno-pie -fno-pic -nostdlib -fno-stack-protector -nostartfiles \
             -I include -m64 -O0 -fno-strict-aliasing -mcmodel=large
setup64a.o:arch/loader/setup64.s
	nasm $(ASMFLAGS) -o bin/$@ $<
setupa.o:arch/loader/setup.s
	$(ASM) $(SETUPFLAGS) $< -o $(BUILD)/$@
	$(OBJCOPY) -I elf32-i386 -O elf64-x86-64 $(BUILD)/$@ $(BUILD)/$@
reloc.o:arch/loader/reloc.c
	$(CC) $(LOADERC_ARGS) -c -o bin/$@ $<
gmsknl.o:bin/gmsknl.o
loader:$(loaderobjs)
	ld -T arch/loader/loader.lds -o bin/gmsknl.img bin/setupa.o bin/setup64a.o bin/gmsknl.o bin/reloc.o
	objdump -d bin/gmsknl.img > img.s