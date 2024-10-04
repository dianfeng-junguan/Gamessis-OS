cargs="-w -g -fno-pie -fno-pic -nostdlib -nostdinc -fno-stack-protector -nostartfiles \
-I include -O0 -m64"
for f in $(find knl|grep -E *[.]c$)
do
    final=${f#*/}
    final=${final%%.*}
    echo "$f $final"
	gcc -c $f -o bin/$final.o $cargs
done

for f in $(find knl|grep -E *[.]s$)
do
    final=${f#*/}
    final=${final%%.*}
    #echo "$f $final"
    if [ ${final} == "setup" ]
    then
	    nasm $f -o bin/${final}a.o -f elf32
      objcopy -I elf32-i386 -O elf64-x86-64 bin/${final}a.o bin/${final}a.o
    else
      nasm $f -o bin/${final}a.o -f elf64
    fi
done
