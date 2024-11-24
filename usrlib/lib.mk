.PHONY: libc
LIBC_CARGS = -I include -w -nostdlib -nostdinc -nostartfiles -nodefaultlibs -fno-stack-protector
libc:
	gcc -c usrlib/unistd.c -o bin/libc/unistd.o $(LIBC_CARGS)
	gcc -c usrlib/stdlib.c -o bin/libc/stdlib.o $(LIBC_CARGS)
	gcc -c usrlib/wait.c -o bin/libc/wait.o $(LIBC_CARGS)
	cp usrlib/libc.a bin/libc.a
	ar rcs bin/gmslibc.a bin/libc/*.o
