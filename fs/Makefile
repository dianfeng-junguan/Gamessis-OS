fsobjs=fat32.o ramfs.o vfs.o volume.o
$(fsobjs): %.o: fs/%.c
	$(CC) $(CFLAGS) -c $< -o bin/$@
fs: $(fsobjs)