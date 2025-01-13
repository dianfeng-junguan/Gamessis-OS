gdb -ex "target remote localhost:1234" -ex "set disassembly-flavor intel" -ex "layout src" -ex "add-symbol-file bin/gmsknl.elf" -ex "add-symbol-file bin/gmsknl.img" -ex "add-symbol-file bin/test.elf" -ex "set disassemble-next-line on" -ex "b main" -ex "add-symbol-file bin/dl.so" -ex "b test/test.c:40" -ex "b test/test.c:53" 
#-s .text 0xffff800000800000
