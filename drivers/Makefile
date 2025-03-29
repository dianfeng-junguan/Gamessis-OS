driverobjs=com.o conhost.o disk.o elfbin.o framebuffer.o\
	kb.o ramdisk.o scanner.o tty.o
driverobjsasm= diska.o ttya.o
$(driverobjs): %.o: drivers/%.c
	$(CC) $(CFLAGS) -c $< -o bin/$@
$(driverobjsasm): %a.o: drivers/%.s
	nasm -f elf64 $< -o bin/$@ -Iinclude
drivers: $(driverobjs) $(driverobjsasm)
