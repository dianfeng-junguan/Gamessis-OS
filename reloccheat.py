import sys
path=sys.argv[1]
f=open(path,"rb+")
dat=f.read(64)
print(dat)
i=0
for e in [0x7f,0x45,0x4c,0x46]:
    if dat[i]!=e:
        print('invalid elf:',dat[0:4])
        sys.exit()
    i+=1
if dat[4]==1:
    print('32 bit')
else:
    print('64 bit')

#shoffset 40
sh_off=int.from_bytes(dat[40:48],byteorder='little')
print("sh off:",hex(sh_off))
#50 52
#shentsize shennum shorts
shents=int.from_bytes(dat[58:60],byteorder='little')
shentnum=int.from_bytes(dat[60:62],byteorder='little')
strtabi=int.from_bytes(dat[62:64],byteorder='little')
print('sh ent size:',shents,"\nsh ent num:",shentnum,"\nstrtab index:",strtabi)
f.seek(sh_off)
shtab=f.read(shentnum*shents)
p=0
#首先获取strtab
strtabh_base=sh_off+shents*strtabi
f.seek(strtabh_base)
strtabh=f.read(shents)
for i in range(shentnum):
    sh=shtab[p:p+shents]
    type=int.from_bytes(sh[4:8],byteorder='little')
    print("type:",type)
    if type==4 or type==9:
        #SHT_RELA
        type=1#progbits
        f.seek(sh_off+i*shents+4)
        f.write(int.to_bytes(1,4,byteorder='little'))

    p+=shents
f.close()