.PHONY: dl
dl:
	gcc -fPIC -w -m64 -c -g dl/dl.c -o bin/dl.o -nostdlib -nostdinc -I include -nostartfiles -nodefaultlibs
	ld bin/dl.o -O elf64-x86-64 -o bin/dl.so -e dlmain -shared
cpdl:
	# sudo mount bin/rd
	sudo mount rd.img /mnt
	sudo cp bin/dl.so /mnt/dl.so
	sudo umount /mnt
	# cd bin
	# find bin/dl.so| cpio -o > bin/rd.tar
	# cd ..
	# sudo cp bin/dl.so /mnt/dl.so