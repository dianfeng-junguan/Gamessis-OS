gdb -ex "target remote localhost:1234" -ex "set disassembly-flavor intel" -ex "layout asm" -ex "add-symbol-file bin/gmsknl.elf" -ex "b main" -ex "set disassemble-next-line on" -ex "b disk_int_handler_c" -ex "b *0x103000"