cargs="-w -g -m32 -fno-pie -fno-pic -nostdlib -nostdinc -fno-stack-protector -nostartfiles \
-I include"
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
	nasm $f -o bin/${final}a.o -f elf32
done
