.PHONY: dl
LIB_PREFIX="/mnt/d/Code/Comprehensive/OS/gmslibc/libc/buildresults/src/"
dl:
	gcc -fPIC -w -m64 -g dl/dl.c dl/dlinit.c -o bin/dl.so -L$(LIB_PREFIX) -lc_native -lsyscall -nostdlib -nostdinc -I include -nostartfiles -nodefaultlibs -e dlmain -shared
	# ld bin/dl.o $(LIB_PREFIX)/libsyscall.a -O elf64-x86-64 -o bin/dl.so -e dlmain -shared
	objdump -d bin/dl.so -M intel -S >dl/dl.s
cpdl:
	# sudo mount bin/rd
	sudo mount rd.img /mnt
	sudo cp bin/dl.so /mnt/dl.so
	sudo umount /mnt
	# cd bin
	# find bin/dl.so| cpio -o > bin/rd.tar
	# cd ..
	# sudo cp bin/dl.so /mnt/dl.so