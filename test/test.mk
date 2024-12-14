.PHONY: test
INCLUDES=-I include -I "/mnt/d/Code/Comprehensive/OS/gmslibc/libc/include" -I"/mnt/d/Code/Comprehensive/OS/gmslibc/libc/printf/src" -I "/mnt/d/Code/Comprehensive/OS/gmslibc/libc/arch/x86_64/include"
LIB_PREFIX="/mnt/d/Code/Comprehensive/OS/gmslibc/libc/buildresults/src/"
test:
	gcc -g test/test.c -o bin/test.elf -L$(LIB_PREFIX) -lc -nostdlib -nostdinc $(INCLUDES) -nostartfiles -nodefaultlibs -w -e entry -T test/test.lds
	# gcc -c -g test/test.c -o bin/test.o -nostdlib -nostdinc $(INCLUDES) -nostartfiles -nodefaultlibs  -w
	# ld bin/test.o $(LIB_PREFIX)/libc.a $(LIB_PREFIX)/libsyscall.a -O elf64-x86-64 -o bin/test.elf -e entry -T test/test.lds
	objcopy -I binary bin/test.elf -O elf64-x86-64 bin/test.o -B i386
	objdump -M intel -d -S bin/test.elf>test/test.s
cptest:
	sudo mount rd.img /mnt
	sudo cp bin/test.elf /mnt/test.elf
	sudo cp libc.so /mnt/libc.so
	sudo umount /mnt

#-fno-stack-protector