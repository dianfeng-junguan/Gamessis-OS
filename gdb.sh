gdb -ex "target remote localhost:1234" \
 -ex "set disassembly-flavor intel" -ex "add-symbol-file bin/gmsknl.elf" -ex "b main" \
 -ex "layout src" -ex "set disassemble-next-line on" -ex "b disk_int_handler_c"
