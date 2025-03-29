comobjs=mem.o str.o wchar.o #syscall.o
$(comobjs): %.o: com/%.c
	$(CC) $(CFLAGS) -c $< -o bin/$@
com: $(comobjs)
