gdb -ex "target remote localhost:1234" -ex "set disassembly-flavor intel" -ex "layout src" -ex "add-symbol-file bin/gmsknl.elf" -ex "add-symbol-file bin/gmsknl.img" -ex "add-symbol-file bin/test.elf" -ex "b main" -ex "b sys_execve" -ex "set disassemble-next-line on"
#-s .text 0xffff800000800000
