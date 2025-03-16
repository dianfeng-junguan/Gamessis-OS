.PHONY: loader
LOADERC_ARGS=-w -g -fno-pie -fno-pic -nostdlib -fno-stack-protector -nostartfiles \
             -I include -m64 -O0 -fno-strict-aliasing -mcmodel=large

loader:
	ld -T loader/loader.lds -o bin/gmsknl.img bin/setupa.o bin/setup64a.o bin/gmsknl.o bin/reloc.o
	objdump -d bin/gmsknl.img > img.s