mmobjs=buddy.o memory.o slab.o 
$(mmobjs): %.o: mm/%.c
	$(CC) $(CFLAGS) -c $< -o bin/$@
mm: $(mmobjs)
