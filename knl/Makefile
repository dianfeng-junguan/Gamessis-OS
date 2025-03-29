knlsrc=knl
knlmodsrc=knl/mods
loadersrc=loader
modobj = kb.o disk.o fat32.o \
				tty.o elfbin.o scanner.o
modobjasm=diska.o ttya.o
kernelobj = main.o log.o \
			devman.o proc.o \
			exe.o \
			sys.o \
			signal.o driverman.o \
			binload.o drvload.o \
			threading.o
loaderobj=reloc.o
loaderobjasm64= setup64.o
kernelobjasm=syscalla.o callinga.o proca.o
$(kernelobj):%.o:$(knlsrc)/%.c
	$(CC) $(CFLAGS) -c $< -o $(BUILD)/$@
$(kernelobjasm):%a.o:$(knlsrc)/%.s
	$(ASM) $(ASMFLAGS) $< -o $(BUILD)/$@
# $(modobj):%.o:$(knlmodsrc)/%.c
# 	$(CC) $(CFLAGS) -c $< -o $(BUILD)/$@
# $(loaderobj):%.o:$(loadersrc)/%.c
# 	$(CC) $(CFLAGS) -c $< -o $(BUILD)/$@

# $(modobjasm):%a.o:$(knlmodsrc)/%.s
# 	$(ASM) $(ASMFLAGS) $< -o $(BUILD)/$@
# $(loaderobjasm64):%.o:$(loadersrc)/%.s
# 	$(ASM) $(ASMFLAGS) $< -o $(BUILD)/$@

# setup.o:$(loadersrc)/setup.s
# 	$(ASM) $(SETUPFLAGS) $< -o $(BUILD)/$@
# 	$(OBJCOPY) -I elf32-i386 -O elf64-x86-64 $(BUILD)/$@ $(BUILD)/$@
# protoknl: setup.o $(loaderobjasm64) $(loaderobj) $(modobjasm) $(kernelobjasm) $(kernelobj) $(modobj)
kernel:$(kernelobjasm) $(kernelobj)