.PHONY: libc
LIBC_CARGS = -I include -w
libc:
	gcc -c usrlib/unistd.c -o bin/libc/unistd.o $(LIBC_CARGS)
	gcc -c usrlib/stdlib.c -o bin/libc/stdlib.o $(LIBC_CARGS)
	gcc -c usrlib/wait.c -o bin/libc/wait.o $(LIBC_CARGS)
	ar r bin/libc.a bin/libc/*.o
