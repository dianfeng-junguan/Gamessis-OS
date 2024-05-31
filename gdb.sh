gdb -ex "target remote localhost:1234" -ex "b *0x100000" -ex "layout asm" \
 -ex "set-disassembly-flavor intel" -ex "add-symbol-file bin/gmsknl.elf"