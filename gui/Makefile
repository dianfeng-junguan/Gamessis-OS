guiobjs=wndman.o
$(guiobjs): %.o: gui/%.c
	$(CC) $(CFLAGS) -c $< -o bin/$@
gui: $(guiobjs)