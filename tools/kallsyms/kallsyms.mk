toolksym:
	gcc tools/kallsyms/kallsyms.c -o ./ksyms -I include
kallsyms:
	nm -n bin/gmsknl.elf>bin/kallsyms.txt --defined-only
	./ksyms bin/kallsyms.txt
	objcopy bin/kallsyms.bin bin/kallsyms.o -O elf64-x86-64 -I binary -B i386