archobjs=clock.o float.o gdt.o int.o
archobjsasm=clocka.o floata.o gdta.o inta.o \
	int_handlera.o
$(archobjs): %.o: arch/%.c
	$(CC) $(CFLAGS) -c $< -o bin/$@
$(archobjsasm): %a.o: arch/%.s
	nasm -f elf64 $< -o bin/$@ -Iinclude
arch: $(archobjs) $(archobjsasm)