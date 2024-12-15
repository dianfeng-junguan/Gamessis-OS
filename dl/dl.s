
bin/dl.so:     file format elf64-x86-64


Disassembly of section .plt:

0000000000001000 <.plt>:
    1000:	ff 35 02 30 00 00    	push   QWORD PTR [rip+0x3002]        # 4008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1006:	f2 ff 25 03 30 00 00 	bnd jmp QWORD PTR [rip+0x3003]        # 4010 <_GLOBAL_OFFSET_TABLE_+0x10>
    100d:	0f 1f 00             	nop    DWORD PTR [rax]
    1010:	f3 0f 1e fa          	endbr64 
    1014:	68 00 00 00 00       	push   0x0
    1019:	f2 e9 e1 ff ff ff    	bnd jmp 1000 <get_got@plt-0xe0>
    101f:	90                   	nop
    1020:	f3 0f 1e fa          	endbr64 
    1024:	68 01 00 00 00       	push   0x1
    1029:	f2 e9 d1 ff ff ff    	bnd jmp 1000 <get_got@plt-0xe0>
    102f:	90                   	nop
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 02 00 00 00       	push   0x2
    1039:	f2 e9 c1 ff ff ff    	bnd jmp 1000 <get_got@plt-0xe0>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 03 00 00 00       	push   0x3
    1049:	f2 e9 b1 ff ff ff    	bnd jmp 1000 <get_got@plt-0xe0>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 04 00 00 00       	push   0x4
    1059:	f2 e9 a1 ff ff ff    	bnd jmp 1000 <get_got@plt-0xe0>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 05 00 00 00       	push   0x5
    1069:	f2 e9 91 ff ff ff    	bnd jmp 1000 <get_got@plt-0xe0>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 06 00 00 00       	push   0x6
    1079:	f2 e9 81 ff ff ff    	bnd jmp 1000 <get_got@plt-0xe0>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64 
    1084:	68 07 00 00 00       	push   0x7
    1089:	f2 e9 71 ff ff ff    	bnd jmp 1000 <get_got@plt-0xe0>
    108f:	90                   	nop
    1090:	f3 0f 1e fa          	endbr64 
    1094:	68 08 00 00 00       	push   0x8
    1099:	f2 e9 61 ff ff ff    	bnd jmp 1000 <get_got@plt-0xe0>
    109f:	90                   	nop
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	68 09 00 00 00       	push   0x9
    10a9:	f2 e9 51 ff ff ff    	bnd jmp 1000 <get_got@plt-0xe0>
    10af:	90                   	nop
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	68 0a 00 00 00       	push   0xa
    10b9:	f2 e9 41 ff ff ff    	bnd jmp 1000 <get_got@plt-0xe0>
    10bf:	90                   	nop
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	68 0b 00 00 00       	push   0xb
    10c9:	f2 e9 31 ff ff ff    	bnd jmp 1000 <get_got@plt-0xe0>
    10cf:	90                   	nop
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	68 0c 00 00 00       	push   0xc
    10d9:	f2 e9 21 ff ff ff    	bnd jmp 1000 <get_got@plt-0xe0>
    10df:	90                   	nop

Disassembly of section .plt.sec:

00000000000010e0 <get_got@plt>:
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	f2 ff 25 2d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f2d]        # 4018 <get_got+0x263e>
    10eb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000010f0 <malloc@plt>:
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	f2 ff 25 25 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f25]        # 4020 <malloc>
    10fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001100 <get_sym_plt@plt>:
    1100:	f3 0f 1e fa          	endbr64 
    1104:	f2 ff 25 1d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f1d]        # 4028 <get_sym_plt+0x2684>
    110b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001110 <lseek@plt>:
    1110:	f3 0f 1e fa          	endbr64 
    1114:	f2 ff 25 15 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f15]        # 4030 <lseek>
    111b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001120 <fill_reloc@plt>:
    1120:	f3 0f 1e fa          	endbr64 
    1124:	f2 ff 25 0d 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f0d]        # 4038 <fill_reloc+0x24b5>
    112b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001130 <mmap@plt>:
    1130:	f3 0f 1e fa          	endbr64 
    1134:	f2 ff 25 05 2f 00 00 	bnd jmp QWORD PTR [rip+0x2f05]        # 4040 <mmap>
    113b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001140 <read@plt>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	f2 ff 25 fd 2e 00 00 	bnd jmp QWORD PTR [rip+0x2efd]        # 4048 <read>
    114b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001150 <get_load_base@plt>:
    1150:	f3 0f 1e fa          	endbr64 
    1154:	f2 ff 25 f5 2e 00 00 	bnd jmp QWORD PTR [rip+0x2ef5]        # 4050 <get_load_base+0x2699>
    115b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001160 <load_elfso@plt>:
    1160:	f3 0f 1e fa          	endbr64 
    1164:	f2 ff 25 ed 2e 00 00 	bnd jmp QWORD PTR [rip+0x2eed]        # 4058 <load_elfso+0x2d78>
    116b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001170 <get_sym_addr@plt>:
    1170:	f3 0f 1e fa          	endbr64 
    1174:	f2 ff 25 e5 2e 00 00 	bnd jmp QWORD PTR [rip+0x2ee5]        # 4060 <get_sym_addr+0x278d>
    117b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001180 <open@plt>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	f2 ff 25 dd 2e 00 00 	bnd jmp QWORD PTR [rip+0x2edd]        # 4068 <open>
    118b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000001190 <close@plt>:
    1190:	f3 0f 1e fa          	endbr64 
    1194:	f2 ff 25 d5 2e 00 00 	bnd jmp QWORD PTR [rip+0x2ed5]        # 4070 <close>
    119b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000011a0 <free@plt>:
    11a0:	f3 0f 1e fa          	endbr64 
    11a4:	f2 ff 25 cd 2e 00 00 	bnd jmp QWORD PTR [rip+0x2ecd]        # 4078 <free>
    11ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

Disassembly of section .text:

00000000000011b0 <get_modid>:
#include <exe.h>

void   fill_reloc(Elf64_Rel* rel, int modid, struct Elf64_Shdr* shdrs);
module modules[MAX_MODULES];
id_t   get_modid(void)
{
    11b0:	f3 0f 1e fa          	endbr64 
    11b4:	55                   	push   rbp
    11b5:	48 89 e5             	mov    rbp,rsp
    static id_t modid_d = 0;
    return modid_d++;
    11b8:	8b 05 c2 4e 00 00    	mov    eax,DWORD PTR [rip+0x4ec2]        # 6080 <modid_d.0>
    11be:	8d 50 01             	lea    edx,[rax+0x1]
    11c1:	89 15 b9 4e 00 00    	mov    DWORD PTR [rip+0x4eb9],edx        # 6080 <modid_d.0>
}
    11c7:	5d                   	pop    rbp
    11c8:	c3                   	ret    

00000000000011c9 <dlmain>:
int dlmain(int fno, Elf64_Ehdr* dlehdr, char** argv)
{
    11c9:	f3 0f 1e fa          	endbr64 
    11cd:	55                   	push   rbp
    11ce:	48 89 e5             	mov    rbp,rsp
    11d1:	48 83 c4 80          	add    rsp,0xffffffffffffff80
    11d5:	89 7d 9c             	mov    DWORD PTR [rbp-0x64],edi
    11d8:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
    11dc:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx

    //加载elf文件
    // 读取文件头
    Elf64_Ehdr ehdr;
    //读取文件头
    read(fno, &ehdr, sizeof(ehdr));
    11e0:	48 8d 4d a0          	lea    rcx,[rbp-0x60]
    11e4:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
    11e7:	ba 40 00 00 00       	mov    edx,0x40
    11ec:	48 89 ce             	mov    rsi,rcx
    11ef:	89 c7                	mov    edi,eax
    11f1:	e8 4a ff ff ff       	call   1140 <read@plt>

    unsigned short entn = ehdr.e_phnum;
    11f6:	0f b7 45 d8          	movzx  eax,WORD PTR [rbp-0x28]
    11fa:	66 89 45 fa          	mov    WORD PTR [rbp-0x6],ax
    unsigned short ents = ehdr.e_phentsize;
    11fe:	0f b7 45 d6          	movzx  eax,WORD PTR [rbp-0x2a]
    1202:	66 89 45 f8          	mov    WORD PTR [rbp-0x8],ax
    module*        mod  = 0;
    1206:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
    120d:	00 
    // module项设置
    //先注册自己
    for (int i = 0; i < MAX_MODULES; i++) {
    120e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    1215:	eb 7b                	jmp    1292 <dlmain+0xc9>
        if (modules[i].type == ET_NONE) {
    1217:	48 8b 15 d2 2d 00 00 	mov    rdx,QWORD PTR [rip+0x2dd2]        # 3ff0 <modules-0x90>
    121e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    1221:	48 98                	cdqe   
    1223:	48 c1 e0 06          	shl    rax,0x6
    1227:	48 01 d0             	add    rax,rdx
    122a:	48 83 c0 18          	add    rax,0x18
    122e:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1231:	48 85 c0             	test   rax,rax
    1234:	75 58                	jne    128e <dlmain+0xc5>
            modules[i].type        = ET_DYN;
    1236:	48 8b 15 b3 2d 00 00 	mov    rdx,QWORD PTR [rip+0x2db3]        # 3ff0 <modules-0x90>
    123d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    1240:	48 98                	cdqe   
    1242:	48 c1 e0 06          	shl    rax,0x6
    1246:	48 01 d0             	add    rax,rdx
    1249:	48 83 c0 18          	add    rax,0x18
    124d:	48 c7 00 03 00 00 00 	mov    QWORD PTR [rax],0x3
            modules[i].load_offset = 0;
    1254:	48 8b 15 95 2d 00 00 	mov    rdx,QWORD PTR [rip+0x2d95]        # 3ff0 <modules-0x90>
    125b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    125e:	48 98                	cdqe   
    1260:	48 c1 e0 06          	shl    rax,0x6
    1264:	48 01 d0             	add    rax,rdx
    1267:	48 83 c0 08          	add    rax,0x8
    126b:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            modules[i].base        = 0;
    1272:	48 8b 15 77 2d 00 00 	mov    rdx,QWORD PTR [rip+0x2d77]        # 3ff0 <modules-0x90>
    1279:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    127c:	48 98                	cdqe   
    127e:	48 c1 e0 06          	shl    rax,0x6
    1282:	48 01 d0             	add    rax,rdx
    1285:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            break;
    128c:	eb 0e                	jmp    129c <dlmain+0xd3>
    for (int i = 0; i < MAX_MODULES; i++) {
    128e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    1292:	83 7d fc 7f          	cmp    DWORD PTR [rbp-0x4],0x7f
    1296:	0f 8e 7b ff ff ff    	jle    1217 <dlmain+0x4e>
        }
    }
    //递归加载elf和so
    load_elfso(fno);
    129c:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
    129f:	89 c7                	mov    edi,eax
    12a1:	b8 00 00 00 00       	mov    eax,0x0
    12a6:	e8 b5 fe ff ff       	call   1160 <load_elfso@plt>
    close(fno);
    12ab:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
    12ae:	89 c7                	mov    edi,eax
    12b0:	e8 db fe ff ff       	call   1190 <close@plt>
    //跳转到程序入口
    int (*main)(int, char**) = ehdr.e_entry;
    12b5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    12b9:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    free(&ehdr);
    12bd:	48 8d 45 a0          	lea    rax,[rbp-0x60]
    12c1:	48 89 c7             	mov    rdi,rax
    12c4:	e8 d7 fe ff ff       	call   11a0 <free@plt>
    main(1, 0);
    12c9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    12cd:	be 00 00 00 00       	mov    esi,0x0
    12d2:	bf 01 00 00 00       	mov    edi,0x1
    12d7:	ff d0                	call   rax
    return 0;
    12d9:	b8 00 00 00 00       	mov    eax,0x0
}
    12de:	c9                   	leave  
    12df:	c3                   	ret    

00000000000012e0 <load_elfso>:
int load_elfso(int fno)
{
    12e0:	f3 0f 1e fa          	endbr64 
    12e4:	55                   	push   rbp
    12e5:	48 89 e5             	mov    rbp,rsp
    12e8:	48 81 ec 30 01 00 00 	sub    rsp,0x130
    12ef:	89 bd dc fe ff ff    	mov    DWORD PTR [rbp-0x124],edi
    // 读取文件头
    Elf64_Ehdr ehdr;
    //读取文件头
    read(fno, &ehdr, sizeof(ehdr));
    12f5:	48 8d 8d e0 fe ff ff 	lea    rcx,[rbp-0x120]
    12fc:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    1302:	ba 40 00 00 00       	mov    edx,0x40
    1307:	48 89 ce             	mov    rsi,rcx
    130a:	89 c7                	mov    edi,eax
    130c:	e8 2f fe ff ff       	call   1140 <read@plt>

    unsigned short entn = ehdr.e_phnum;
    1311:	0f b7 85 18 ff ff ff 	movzx  eax,WORD PTR [rbp-0xe8]
    1318:	66 89 45 86          	mov    WORD PTR [rbp-0x7a],ax
    unsigned short ents = ehdr.e_phentsize;
    131c:	0f b7 85 16 ff ff ff 	movzx  eax,WORD PTR [rbp-0xea]
    1323:	66 89 45 84          	mov    WORD PTR [rbp-0x7c],ax
    module*        mod  = 0;
    1327:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    132e:	00 
    // module项设置
    //注册自己
    for (int i = 0; i < MAX_MODULES; i++) {
    132f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    1336:	e9 9c 00 00 00       	jmp    13d7 <load_elfso+0xf7>
        if (modules[i].type == ET_NONE) {
    133b:	48 8b 15 ae 2c 00 00 	mov    rdx,QWORD PTR [rip+0x2cae]        # 3ff0 <modules-0x90>
    1342:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1345:	48 98                	cdqe   
    1347:	48 c1 e0 06          	shl    rax,0x6
    134b:	48 01 d0             	add    rax,rdx
    134e:	48 83 c0 18          	add    rax,0x18
    1352:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1355:	48 85 c0             	test   rax,rax
    1358:	75 79                	jne    13d3 <load_elfso+0xf3>
            modules[i].type        = ehdr.e_type;
    135a:	0f b7 85 f0 fe ff ff 	movzx  eax,WORD PTR [rbp-0x110]
    1361:	0f b7 c0             	movzx  eax,ax
    1364:	48 8b 0d 85 2c 00 00 	mov    rcx,QWORD PTR [rip+0x2c85]        # 3ff0 <modules-0x90>
    136b:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
    136e:	48 63 d2             	movsxd rdx,edx
    1371:	48 c1 e2 06          	shl    rdx,0x6
    1375:	48 01 ca             	add    rdx,rcx
    1378:	48 83 c2 18          	add    rdx,0x18
    137c:	48 89 02             	mov    QWORD PTR [rdx],rax
            modules[i].load_offset = 0;
    137f:	48 8b 15 6a 2c 00 00 	mov    rdx,QWORD PTR [rip+0x2c6a]        # 3ff0 <modules-0x90>
    1386:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1389:	48 98                	cdqe   
    138b:	48 c1 e0 06          	shl    rax,0x6
    138f:	48 01 d0             	add    rax,rdx
    1392:	48 83 c0 08          	add    rax,0x8
    1396:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            modules[i].base        = 0;
    139d:	48 8b 15 4c 2c 00 00 	mov    rdx,QWORD PTR [rip+0x2c4c]        # 3ff0 <modules-0x90>
    13a4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    13a7:	48 98                	cdqe   
    13a9:	48 c1 e0 06          	shl    rax,0x6
    13ad:	48 01 d0             	add    rax,rdx
    13b0:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            mod                    = modules + i;
    13b7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    13ba:	48 98                	cdqe   
    13bc:	48 c1 e0 06          	shl    rax,0x6
    13c0:	48 89 c2             	mov    rdx,rax
    13c3:	48 8b 05 26 2c 00 00 	mov    rax,QWORD PTR [rip+0x2c26]        # 3ff0 <modules-0x90>
    13ca:	48 01 d0             	add    rax,rdx
    13cd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
            break;
    13d1:	eb 0e                	jmp    13e1 <load_elfso+0x101>
    for (int i = 0; i < MAX_MODULES; i++) {
    13d3:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
    13d7:	83 7d f4 7f          	cmp    DWORD PTR [rbp-0xc],0x7f
    13db:	0f 8e 5a ff ff ff    	jle    133b <load_elfso+0x5b>
        }
    }
    //需要malloc一块内存
    Elf64_Phdr* ph = malloc(entn * ents);   //(Elf64_Phdr *) (tmpla + ehdr.e_phoff);
    13e1:	0f b7 55 86          	movzx  edx,WORD PTR [rbp-0x7a]
    13e5:	0f b7 45 84          	movzx  eax,WORD PTR [rbp-0x7c]
    13e9:	0f af c2             	imul   eax,edx
    13ec:	48 98                	cdqe   
    13ee:	48 89 c7             	mov    rdi,rax
    13f1:	e8 fa fc ff ff       	call   10f0 <malloc@plt>
    13f6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    lseek(fno, ehdr.e_phoff, SEEK_SET);
    13fa:	48 8b 8d 00 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x100]
    1401:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    1407:	ba 00 00 00 00       	mov    edx,0x0
    140c:	48 89 ce             	mov    rsi,rcx
    140f:	89 c7                	mov    edi,eax
    1411:	e8 fa fc ff ff       	call   1110 <lseek@plt>
    read(fno, ph, entn * ents);
    1416:	0f b7 55 86          	movzx  edx,WORD PTR [rbp-0x7a]
    141a:	0f b7 45 84          	movzx  eax,WORD PTR [rbp-0x7c]
    141e:	0f af c2             	imul   eax,edx
    1421:	48 63 d0             	movsxd rdx,eax
    1424:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
    1428:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    142e:	48 89 ce             	mov    rsi,rcx
    1431:	89 c7                	mov    edi,eax
    1433:	e8 08 fd ff ff       	call   1140 <read@plt>
    size_t tot_sz = 0;
    1438:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
    143f:	00 00 00 00 
    off_t  base = ph->p_vaddr, offset = 0;
    1443:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1447:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    144b:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    1452:	48 c7 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],0x0
    1459:	00 00 00 00 
    int (**init)() = 0, init_arraysz = 0;
    145d:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    1464:	00 
    1465:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0

    for (int i = 0; i < entn; i++) {
    146c:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [rbp-0x28],0x0
    1473:	e9 ca 00 00 00       	jmp    1542 <load_elfso+0x262>
        //加载段
        if ((ph->p_type | PT_LOAD) != 0) {
            unsigned long off  = ph->p_offset;
    1478:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    147c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1480:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
            unsigned long fs   = ph->p_filesz;
    1487:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    148b:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    148f:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            size_t        ms   = ph->p_memsz;
    1496:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    149a:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    149e:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            char*         vptr = (char*)ph->p_vaddr + offset;
    14a5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    14a9:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    14ad:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    14b4:	48 01 d0             	add    rax,rdx
    14b7:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            if (off == 0) { mod->header = vptr; }
    14be:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
    14c5:	00 
    14c6:	75 0f                	jne    14d7 <load_elfso+0x1f7>
    14c8:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
    14cf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    14d3:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
            //先映射好内存
            int prot = PROT_READ;
    14d7:	c7 85 24 ff ff ff 01 	mov    DWORD PTR [rbp-0xdc],0x1
    14de:	00 00 00 
            if ((ph->p_flags | PF_X)) prot |= PROT_EXEC;
    14e1:	83 8d 24 ff ff ff 04 	or     DWORD PTR [rbp-0xdc],0x4
            if ((ph->p_flags | PF_W)) prot |= PROT_WRITE;
    14e8:	83 8d 24 ff ff ff 02 	or     DWORD PTR [rbp-0xdc],0x2
            int flags = MAP_PRIVATE;
    14ef:	c7 45 d4 02 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x2
            if (ehdr.e_type == ET_EXEC) flags |= MAP_FIXED;
    14f6:	0f b7 85 f0 fe ff ff 	movzx  eax,WORD PTR [rbp-0x110]
    14fd:	66 83 f8 02          	cmp    ax,0x2
    1501:	75 04                	jne    1507 <load_elfso+0x227>
    1503:	83 4d d4 01          	or     DWORD PTR [rbp-0x2c],0x1
            mmap(vptr, fs, prot, flags, fno, off);
    1507:	4c 8b 85 40 ff ff ff 	mov    r8,QWORD PTR [rbp-0xc0]
    150e:	8b bd dc fe ff ff    	mov    edi,DWORD PTR [rbp-0x124]
    1514:	8b 4d d4             	mov    ecx,DWORD PTR [rbp-0x2c]
    1517:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
    151d:	48 8b b5 38 ff ff ff 	mov    rsi,QWORD PTR [rbp-0xc8]
    1524:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    152b:	4d 89 c1             	mov    r9,r8
    152e:	41 89 f8             	mov    r8d,edi
    1531:	48 89 c7             	mov    rdi,rax
    1534:	e8 f7 fb ff ff       	call   1130 <mmap@plt>
        }
        ph++;
    1539:	48 83 45 e8 38       	add    QWORD PTR [rbp-0x18],0x38
    for (int i = 0; i < entn; i++) {
    153e:	83 45 d8 01          	add    DWORD PTR [rbp-0x28],0x1
    1542:	0f b7 45 86          	movzx  eax,WORD PTR [rbp-0x7a]
    1546:	39 45 d8             	cmp    DWORD PTR [rbp-0x28],eax
    1549:	0f 8c 29 ff ff ff    	jl     1478 <load_elfso+0x198>
    }

    Elf64_Dyn* dynamic = 0;
    154f:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
    1556:	00 
    //寻找dynamic段
    struct Elf64_Shdr* shdr =
        mmap(0, ehdr.e_shentsize * ehdr.e_shnum, PROT_READ, MAP_PRIVATE, fno, ehdr.e_shoff);
    1557:	48 8b 8d 08 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xf8]
    155e:	0f b7 85 1a ff ff ff 	movzx  eax,WORD PTR [rbp-0xe6]
    1565:	0f b7 d0             	movzx  edx,ax
    1568:	0f b7 85 1c ff ff ff 	movzx  eax,WORD PTR [rbp-0xe4]
    156f:	0f b7 c0             	movzx  eax,ax
    1572:	0f af c2             	imul   eax,edx
    1575:	48 98                	cdqe   
    1577:	8b 95 dc fe ff ff    	mov    edx,DWORD PTR [rbp-0x124]
    157d:	49 89 c9             	mov    r9,rcx
    1580:	41 89 d0             	mov    r8d,edx
    1583:	b9 02 00 00 00       	mov    ecx,0x2
    1588:	ba 01 00 00 00       	mov    edx,0x1
    158d:	48 89 c6             	mov    rsi,rax
    1590:	bf 00 00 00 00       	mov    edi,0x0
    1595:	e8 96 fb ff ff       	call   1130 <mmap@plt>
    159a:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    mod->p_shdrs = shdr;
    15a1:	48 8b 95 60 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xa0]
    15a8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    15ac:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
    for (int i = 0; i < ehdr.e_shnum; i++) {
    15b0:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
    15b7:	eb 3e                	jmp    15f7 <load_elfso+0x317>
        if (shdr[i].sh_type == SHT_DYNAMIC) {
    15b9:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    15bc:	48 98                	cdqe   
    15be:	48 c1 e0 06          	shl    rax,0x6
    15c2:	48 89 c2             	mov    rdx,rax
    15c5:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    15cc:	48 01 d0             	add    rax,rdx
    15cf:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    15d2:	83 f8 06             	cmp    eax,0x6
    15d5:	75 1c                	jne    15f3 <load_elfso+0x313>
            dynamic = shdr + i;
    15d7:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    15da:	48 98                	cdqe   
    15dc:	48 c1 e0 06          	shl    rax,0x6
    15e0:	48 89 c2             	mov    rdx,rax
    15e3:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    15ea:	48 01 d0             	add    rax,rdx
    15ed:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            break;
    15f1:	eb 13                	jmp    1606 <load_elfso+0x326>
    for (int i = 0; i < ehdr.e_shnum; i++) {
    15f3:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
    15f7:	0f b7 85 1c ff ff ff 	movzx  eax,WORD PTR [rbp-0xe4]
    15fe:	0f b7 c0             	movzx  eax,ax
    1601:	39 45 c4             	cmp    DWORD PTR [rbp-0x3c],eax
    1604:	7c b3                	jl     15b9 <load_elfso+0x2d9>
        }
    }
    if (!dynamic)
        ;
    char*  dynstr = 0;
    1606:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
    160d:	00 
    off_t* got    = 0;
    160e:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
    1615:	00 00 00 00 
    //这里一堆获取函数之后实现细节
    // dynstr=so_get_dynstr(dyn);
    // so_get_dynstr从so中获取.dynstr节
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    1619:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    161d:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
    1621:	eb 2a                	jmp    164d <load_elfso+0x36d>
        if (p->d_tag == DT_STRTAB) {
    1623:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    1627:	48 8b 00             	mov    rax,QWORD PTR [rax]
    162a:	48 83 f8 05          	cmp    rax,0x5
    162e:	75 18                	jne    1648 <load_elfso+0x368>
            dynstr = p->d_un.d_ptr + offset;
    1630:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    1634:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1638:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    163f:	48 01 d0             	add    rax,rdx
    1642:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
            break;
    1646:	eb 11                	jmp    1659 <load_elfso+0x379>
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    1648:	48 83 45 b0 10       	add    QWORD PTR [rbp-0x50],0x10
    164d:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    1651:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1654:	48 85 c0             	test   rax,rax
    1657:	75 ca                	jne    1623 <load_elfso+0x343>
        }
    }

    size_t relsz = 0, relentsz = 0;
    1659:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
    1660:	00 
    1661:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    1668:	00 
    off_t  relptr = 0;
    1669:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    1670:	00 
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    1671:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    1675:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    1679:	e9 f5 01 00 00       	jmp    1873 <load_elfso+0x593>
        switch (p->d_tag) {
    167e:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1682:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1685:	48 83 f8 1b          	cmp    rax,0x1b
    1689:	0f 87 3c 01 00 00    	ja     17cb <load_elfso+0x4eb>
    168f:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    1696:	00 
    1697:	48 8d 05 62 09 00 00 	lea    rax,[rip+0x962]        # 2000 <fill_reloc+0x47d>
    169e:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    16a1:	48 98                	cdqe   
    16a3:	48 8d 15 56 09 00 00 	lea    rdx,[rip+0x956]        # 2000 <fill_reloc+0x47d>
    16aa:	48 01 d0             	add    rax,rdx
    16ad:	3e ff e0             	notrack jmp rax
        case DT_NEEDED:
            char* pathname = p->d_un.d_val + dynstr;
    16b0:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    16b4:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    16b8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    16bc:	48 01 d0             	add    rax,rdx
    16bf:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
            int   so_fno   = open(pathname, O_EXEC);
    16c6:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
    16cd:	be 00 10 00 00       	mov    esi,0x1000
    16d2:	48 89 c7             	mov    rdi,rax
    16d5:	e8 a6 fa ff ff       	call   1180 <open@plt>
    16da:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
            //不查错了
            load_elfso(open(pathname, O_EXEC));
    16e0:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
    16e7:	be 00 10 00 00       	mov    esi,0x1000
    16ec:	48 89 c7             	mov    rdi,rax
    16ef:	e8 8c fa ff ff       	call   1180 <open@plt>
    16f4:	89 c7                	mov    edi,eax
    16f6:	e8 e5 fb ff ff       	call   12e0 <load_elfso>
            close(so_fno);
    16fb:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
    1701:	89 c7                	mov    edi,eax
    1703:	e8 88 fa ff ff       	call   1190 <close@plt>

            break;
    1708:	e9 bf 00 00 00       	jmp    17cc <load_elfso+0x4ec>
        case DT_PLTGOT:
            got = p->d_un.d_ptr + offset;
    170d:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1711:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1715:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    171c:	48 01 d0             	add    rax,rdx
    171f:	48 89 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rax

            //赋值为dl的运行时重定位函数
            got[2] = dl_runtime_resolve;
    1726:	48 8b 85 58 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa8]
    172d:	48 83 c0 10          	add    rax,0x10
    1731:	48 8b 15 c0 28 00 00 	mov    rdx,QWORD PTR [rip+0x28c0]        # 3ff8 <dl_runtime_resolve+0x25f7>
    1738:	48 89 10             	mov    QWORD PTR [rax],rdx
            //填入模块id
            got[1]     = mod - modules;
    173b:	48 8b 05 ae 28 00 00 	mov    rax,QWORD PTR [rip+0x28ae]        # 3ff0 <modules-0x90>
    1742:	48 89 c2             	mov    rdx,rax
    1745:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1749:	48 29 d0             	sub    rax,rdx
    174c:	48 c1 f8 06          	sar    rax,0x6
    1750:	48 89 c2             	mov    rdx,rax
    1753:	48 8b 85 58 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa8]
    175a:	48 83 c0 08          	add    rax,0x8
    175e:	48 89 10             	mov    QWORD PTR [rax],rdx
            mod->p_got = got;
    1761:	48 8b 95 58 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xa8]
    1768:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    176c:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
        case DT_SYMTAB: mod->p_symbol = p->d_un.d_ptr; break;
    1770:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1774:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1778:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    177c:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    1780:	eb 4a                	jmp    17cc <load_elfso+0x4ec>
        case DT_RELSZ:
        case DT_RELASZ: relsz = p->d_un.d_val; goto is_rel_prepared;
    1782:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1786:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    178a:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    178e:	eb 41                	jmp    17d1 <load_elfso+0x4f1>
        case DT_REL:
        case DT_RELA: relptr = p->d_un.d_ptr; goto is_rel_prepared;
    1790:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1794:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1798:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    179c:	eb 33                	jmp    17d1 <load_elfso+0x4f1>
        case DT_RELENT:
        case DT_RELAENT: relentsz = p->d_un.d_val; goto is_rel_prepared;
    179e:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    17a2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    17a6:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
    17aa:	eb 25                	jmp    17d1 <load_elfso+0x4f1>
        case DT_INIT_ARRAY: init = p->d_un.d_ptr; break;
    17ac:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    17b0:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    17b4:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    17b8:	eb 12                	jmp    17cc <load_elfso+0x4ec>
        case DT_INIT_ARRAYSZ: init_arraysz = p->d_un.d_val / 8; break;
    17ba:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    17be:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    17c2:	48 c1 e8 03          	shr    rax,0x3
    17c6:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    17c9:	eb 01                	jmp    17cc <load_elfso+0x4ec>
        default: break;
    17cb:	90                   	nop
        }
        continue;
    17cc:	e9 9d 00 00 00       	jmp    186e <load_elfso+0x58e>
    is_rel_prepared:
        if (!(relsz && relentsz && relptr)) continue;
    17d1:	48 83 7d a8 00       	cmp    QWORD PTR [rbp-0x58],0x0
    17d6:	0f 84 91 00 00 00    	je     186d <load_elfso+0x58d>
    17dc:	48 83 7d a0 00       	cmp    QWORD PTR [rbp-0x60],0x0
    17e1:	0f 84 86 00 00 00    	je     186d <load_elfso+0x58d>
    17e7:	48 83 7d 98 00       	cmp    QWORD PTR [rbp-0x68],0x0
    17ec:	74 7f                	je     186d <load_elfso+0x58d>
        for (int j = 0; j < relsz / relentsz; j++) {
    17ee:	c7 45 8c 00 00 00 00 	mov    DWORD PTR [rbp-0x74],0x0
    17f5:	eb 44                	jmp    183b <load_elfso+0x55b>
            fill_reloc(relptr + j * relentsz, mod - modules, shdr);
    17f7:	48 8b 05 f2 27 00 00 	mov    rax,QWORD PTR [rip+0x27f2]        # 3ff0 <modules-0x90>
    17fe:	48 89 c2             	mov    rdx,rax
    1801:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1805:	48 29 d0             	sub    rax,rdx
    1808:	48 c1 f8 06          	sar    rax,0x6
    180c:	89 c6                	mov    esi,eax
    180e:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    1811:	48 98                	cdqe   
    1813:	48 0f af 45 a0       	imul   rax,QWORD PTR [rbp-0x60]
    1818:	48 89 c2             	mov    rdx,rax
    181b:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
    181f:	48 01 d0             	add    rax,rdx
    1822:	48 89 c1             	mov    rcx,rax
    1825:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    182c:	48 89 c2             	mov    rdx,rax
    182f:	48 89 cf             	mov    rdi,rcx
    1832:	e8 e9 f8 ff ff       	call   1120 <fill_reloc@plt>
        for (int j = 0; j < relsz / relentsz; j++) {
    1837:	83 45 8c 01          	add    DWORD PTR [rbp-0x74],0x1
    183b:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    183e:	48 63 c8             	movsxd rcx,eax
    1841:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
    1845:	ba 00 00 00 00       	mov    edx,0x0
    184a:	48 f7 75 a0          	div    QWORD PTR [rbp-0x60]
    184e:	48 39 c1             	cmp    rcx,rax
    1851:	72 a4                	jb     17f7 <load_elfso+0x517>
        }
        relsz = relentsz = relptr = 0;
    1853:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    185a:	00 
    185b:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    1862:	00 
    1863:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    1867:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    186b:	eb 01                	jmp    186e <load_elfso+0x58e>
        if (!(relsz && relentsz && relptr)) continue;
    186d:	90                   	nop
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    186e:	48 83 45 90 10       	add    QWORD PTR [rbp-0x70],0x10
    1873:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1877:	48 8b 00             	mov    rax,QWORD PTR [rax]
    187a:	48 85 c0             	test   rax,rax
    187d:	0f 85 fb fd ff ff    	jne    167e <load_elfso+0x39e>
    }
    if (init) {
    1883:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
    1888:	74 33                	je     18bd <load_elfso+0x5dd>
        //调用模块入口函数
        for (int i = 0; i < init_arraysz; i++) { (init[i])(); }
    188a:	c7 45 88 00 00 00 00 	mov    DWORD PTR [rbp-0x78],0x0
    1891:	eb 22                	jmp    18b5 <load_elfso+0x5d5>
    1893:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    1896:	48 98                	cdqe   
    1898:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
    189f:	00 
    18a0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    18a4:	48 01 d0             	add    rax,rdx
    18a7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    18aa:	b8 00 00 00 00       	mov    eax,0x0
    18af:	ff d2                	call   rdx
    18b1:	83 45 88 01          	add    DWORD PTR [rbp-0x78],0x1
    18b5:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    18b8:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
    18bb:	7c d6                	jl     1893 <load_elfso+0x5b3>
    }
    free(&ehdr);
    18bd:	48 8d 85 e0 fe ff ff 	lea    rax,[rbp-0x120]
    18c4:	48 89 c7             	mov    rdi,rax
    18c7:	e8 d4 f8 ff ff       	call   11a0 <free@plt>
    return 0;
    18cc:	b8 00 00 00 00       	mov    eax,0x0
}
    18d1:	c9                   	leave  
    18d2:	c3                   	ret    

00000000000018d3 <get_sym_addr>:
off_t get_sym_addr(unsigned long modid, unsigned long symi, struct Elf64_Shdr* shdrs)
{
    18d3:	f3 0f 1e fa          	endbr64 
    18d7:	55                   	push   rbp
    18d8:	48 89 e5             	mov    rbp,rsp
    18db:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    18df:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    18e3:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    struct Elf64_Sym* sym = modules[modid].p_symbol;
    18e7:	48 8b 15 02 27 00 00 	mov    rdx,QWORD PTR [rip+0x2702]        # 3ff0 <modules-0x90>
    18ee:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    18f2:	48 c1 e0 06          	shl    rax,0x6
    18f6:	48 01 d0             	add    rax,rdx
    18f9:	48 83 c0 28          	add    rax,0x28
    18fd:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1900:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    sym += symi;
    1904:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    1908:	48 89 d0             	mov    rax,rdx
    190b:	48 01 c0             	add    rax,rax
    190e:	48 01 d0             	add    rax,rdx
    1911:	48 c1 e0 03          	shl    rax,0x3
    1915:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
    if (sym->st_shndx == SHN_COMMON) {
        //还没分配空间的符号，需要分配空间，st_value表示地址对齐约束
    }

    off_t symaddr = sym->st_value + modules[modid].load_offset;
    1919:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    191d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1921:	48 8b 0d c8 26 00 00 	mov    rcx,QWORD PTR [rip+0x26c8]        # 3ff0 <modules-0x90>
    1928:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    192c:	48 c1 e0 06          	shl    rax,0x6
    1930:	48 01 c8             	add    rax,rcx
    1933:	48 83 c0 08          	add    rax,0x8
    1937:	48 8b 00             	mov    rax,QWORD PTR [rax]
    193a:	48 01 d0             	add    rax,rdx
    193d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (modules[modid].type == ET_DYN) {
    1941:	48 8b 15 a8 26 00 00 	mov    rdx,QWORD PTR [rip+0x26a8]        # 3ff0 <modules-0x90>
    1948:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    194c:	48 c1 e0 06          	shl    rax,0x6
    1950:	48 01 d0             	add    rax,rdx
    1953:	48 83 c0 18          	add    rax,0x18
    1957:	48 8b 00             	mov    rax,QWORD PTR [rax]
    195a:	48 83 f8 03          	cmp    rax,0x3
    195e:	75 3e                	jne    199e <get_sym_addr+0xcb>
        //还要加上节地址
        Elf64_Ehdr* ehdr = modules[modid].header;
    1960:	48 8b 15 89 26 00 00 	mov    rdx,QWORD PTR [rip+0x2689]        # 3ff0 <modules-0x90>
    1967:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    196b:	48 c1 e0 06          	shl    rax,0x6
    196f:	48 01 d0             	add    rax,rdx
    1972:	48 83 c0 10          	add    rax,0x10
    1976:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1979:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        symaddr += shdrs[sym->st_shndx].sh_addr;
    197d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    1981:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
    1985:	0f b7 c0             	movzx  eax,ax
    1988:	48 c1 e0 06          	shl    rax,0x6
    198c:	48 89 c2             	mov    rdx,rax
    198f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    1993:	48 01 d0             	add    rax,rdx
    1996:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    199a:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    return symaddr;
    199e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
    19a2:	5d                   	pop    rbp
    19a3:	c3                   	ret    

00000000000019a4 <get_sym_plt>:
off_t get_sym_plt(unsigned long modid, unsigned long symi) {}
    19a4:	f3 0f 1e fa          	endbr64 
    19a8:	55                   	push   rbp
    19a9:	48 89 e5             	mov    rbp,rsp
    19ac:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    19b0:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    19b4:	90                   	nop
    19b5:	5d                   	pop    rbp
    19b6:	c3                   	ret    

00000000000019b7 <get_load_base>:
off_t get_load_base(unsigned long modid)
{
    19b7:	f3 0f 1e fa          	endbr64 
    19bb:	55                   	push   rbp
    19bc:	48 89 e5             	mov    rbp,rsp
    19bf:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return modules[modid].base;
    19c3:	48 8b 15 26 26 00 00 	mov    rdx,QWORD PTR [rip+0x2626]        # 3ff0 <modules-0x90>
    19ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    19ce:	48 c1 e0 06          	shl    rax,0x6
    19d2:	48 01 d0             	add    rax,rdx
    19d5:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
    19d8:	5d                   	pop    rbp
    19d9:	c3                   	ret    

00000000000019da <get_got>:
off_t get_got(unsigned long modid)
{
    19da:	f3 0f 1e fa          	endbr64 
    19de:	55                   	push   rbp
    19df:	48 89 e5             	mov    rbp,rsp
    19e2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return modules[modid].p_got;
    19e6:	48 8b 15 03 26 00 00 	mov    rdx,QWORD PTR [rip+0x2603]        # 3ff0 <modules-0x90>
    19ed:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    19f1:	48 c1 e0 06          	shl    rax,0x6
    19f5:	48 01 d0             	add    rax,rdx
    19f8:	48 83 c0 30          	add    rax,0x30
    19fc:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
    19ff:	5d                   	pop    rbp
    1a00:	c3                   	ret    

0000000000001a01 <dl_runtime_resolve>:
void dl_runtime_resolve()
{
    1a01:	f3 0f 1e fa          	endbr64 
    1a05:	55                   	push   rbp
    1a06:	48 89 e5             	mov    rbp,rsp
    1a09:	48 83 ec 30          	sub    rsp,0x30
    //获取modid
    unsigned long modid, rel_offset;
    __asm__ volatile("push %%rax\n mov 8(%%rsp),%%rax\n mov %%rax,%0" : "=m"(modid));
    1a0d:	50                   	push   rax
    1a0e:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
    1a13:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    __asm__ volatile("push %%rax\n mov 16(%%rsp),%%rax\n mov %%rax,%0" : "=m"(rel_offset));
    1a17:	50                   	push   rax
    1a18:	48 8b 44 24 10       	mov    rax,QWORD PTR [rsp+0x10]
    1a1d:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    Elf64_Rel* rel  = rel_offset;
    1a21:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    1a25:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int        symi = ELF64_R_SYM(rel->r_info), type = ELF64_R_TYPE(rel->r_info);
    1a29:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1a2d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1a31:	48 c1 e8 20          	shr    rax,0x20
    1a35:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    1a38:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1a3c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1a40:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    off_t      sym_off = get_sym_addr(modid, symi, modules[modid].p_shdrs);
    1a43:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1a47:	48 8b 15 a2 25 00 00 	mov    rdx,QWORD PTR [rip+0x25a2]        # 3ff0 <modules-0x90>
    1a4e:	48 c1 e0 06          	shl    rax,0x6
    1a52:	48 01 d0             	add    rax,rdx
    1a55:	48 83 c0 38          	add    rax,0x38
    1a59:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1a5c:	48 89 c2             	mov    rdx,rax
    1a5f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1a62:	48 63 c8             	movsxd rcx,eax
    1a65:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1a69:	48 89 ce             	mov    rsi,rcx
    1a6c:	48 89 c7             	mov    rdi,rax
    1a6f:	e8 fc f6 ff ff       	call   1170 <get_sym_addr@plt>
    1a74:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //这里假定获取符号的地址是正确的，可以不修改符号表，而是通过记录模块整体加载地址，
    //来加上偏移量获取正确的符号地址
    off_t* v_rel = rel->r_offset;
    1a78:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1a7c:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1a7f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    switch (type) {
    1a83:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    1a86:	83 e8 03             	sub    eax,0x3
    1a89:	83 f8 07             	cmp    eax,0x7
    1a8c:	0f 87 e2 00 00 00    	ja     1b74 <dl_runtime_resolve+0x173>
    1a92:	89 c0                	mov    eax,eax
    1a94:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    1a9b:	00 
    1a9c:	48 8d 05 cd 05 00 00 	lea    rax,[rip+0x5cd]        # 2070 <fill_reloc+0x4ed>
    1aa3:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    1aa6:	48 98                	cdqe   
    1aa8:	48 8d 15 c1 05 00 00 	lea    rdx,[rip+0x5c1]        # 2070 <fill_reloc+0x4ed>
    1aaf:	48 01 d0             	add    rax,rdx
    1ab2:	3e ff e0             	notrack jmp rax
    case R_X86_64_GLOB_DAT:
    case R_X86_64_JUMP_SLOT: *v_rel = sym_off; break;
    1ab5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1ab9:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    1abd:	48 89 10             	mov    QWORD PTR [rax],rdx
    1ac0:	e9 b0 00 00 00       	jmp    1b75 <dl_runtime_resolve+0x174>
    case R_X86_64_PLT32: *v_rel = get_sym_plt(modid, symi); break;
    1ac5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1ac8:	48 63 d0             	movsxd rdx,eax
    1acb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1acf:	48 89 d6             	mov    rsi,rdx
    1ad2:	48 89 c7             	mov    rdi,rax
    1ad5:	e8 26 f6 ff ff       	call   1100 <get_sym_plt@plt>
    1ada:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    1ade:	48 89 02             	mov    QWORD PTR [rdx],rax
    1ae1:	e9 8f 00 00 00       	jmp    1b75 <dl_runtime_resolve+0x174>
    case R_X86_64_RELATIVE: *v_rel += get_load_base(modid); break;
    1ae6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1aea:	48 89 c7             	mov    rdi,rax
    1aed:	e8 5e f6 ff ff       	call   1150 <get_load_base@plt>
    1af2:	48 89 c2             	mov    rdx,rax
    1af5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1af9:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1afc:	48 01 c2             	add    rdx,rax
    1aff:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b03:	48 89 10             	mov    QWORD PTR [rax],rdx
    1b06:	eb 6d                	jmp    1b75 <dl_runtime_resolve+0x174>
    case R_X86_64_GOTOFF: *v_rel += sym_off - get_got(modid); break;
    1b08:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1b0c:	48 89 c7             	mov    rdi,rax
    1b0f:	e8 cc f5 ff ff       	call   10e0 <get_got@plt>
    1b14:	48 89 c2             	mov    rdx,rax
    1b17:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1b1b:	48 29 d0             	sub    rax,rdx
    1b1e:	48 89 c1             	mov    rcx,rax
    1b21:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b25:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1b28:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
    1b2c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b30:	48 89 10             	mov    QWORD PTR [rax],rdx
    1b33:	eb 40                	jmp    1b75 <dl_runtime_resolve+0x174>
    case R_X86_64_GOTPC: *v_rel += get_got(modid) - rel_offset; break;
    1b35:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1b39:	48 89 c7             	mov    rdi,rax
    1b3c:	e8 9f f5 ff ff       	call   10e0 <get_got@plt>
    1b41:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    1b45:	48 29 d0             	sub    rax,rdx
    1b48:	48 89 c1             	mov    rcx,rax
    1b4b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b4f:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1b52:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
    1b56:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b5a:	48 89 10             	mov    QWORD PTR [rax],rdx
    1b5d:	eb 16                	jmp    1b75 <dl_runtime_resolve+0x174>
    case R_X86_64_GOT32:
        //这一项,rel里面指向的符号的地址就是got
        *v_rel += sym_off;
    1b5f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b63:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    1b66:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1b6a:	48 01 c2             	add    rdx,rax
    1b6d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b71:	48 89 10             	mov    QWORD PTR [rax],rdx
    default: break;
    1b74:	90                   	nop
    }
    //重定位完毕，直接返回到目标地址

    __asm__ volatile("mov %0,%%rax\n mov %%rax,0(%%rsp)" ::"m"(*v_rel));
    1b75:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b79:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1b7c:	48 89 04 24          	mov    QWORD PTR [rsp],rax
}
    1b80:	90                   	nop
    1b81:	c9                   	leave  
    1b82:	c3                   	ret    

0000000000001b83 <fill_reloc>:

void fill_reloc(Elf64_Rel* rel, int modid, struct Elf64_Shdr* shdrs)
{
    1b83:	f3 0f 1e fa          	endbr64 
    1b87:	55                   	push   rbp
    1b88:	48 89 e5             	mov    rbp,rsp
    1b8b:	48 83 ec 40          	sub    rsp,0x40
    1b8f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    1b93:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    1b96:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    int   symi = ELF64_R_SYM(rel->r_info), type = ELF64_R_TYPE(rel->r_info);
    1b9a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1b9e:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1ba2:	48 c1 e8 20          	shr    rax,0x20
    1ba6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    1ba9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1bad:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1bb1:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    off_t sym_off = get_sym_addr(modid, symi, shdrs);
    1bb4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    1bb7:	48 63 c8             	movsxd rcx,eax
    1bba:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
    1bbd:	48 98                	cdqe   
    1bbf:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    1bc3:	48 89 ce             	mov    rsi,rcx
    1bc6:	48 89 c7             	mov    rdi,rax
    1bc9:	e8 a2 f5 ff ff       	call   1170 <get_sym_addr@plt>
    1bce:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    //这里假定获取符号的地址是正确的，可以不修改符号表，而是通过记录模块整体加载地址，
    //来加上偏移量获取正确的符号地址
    off_t* v_rel = rel->r_offset;
    1bd2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1bd6:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1bd9:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    switch (type) {
    1bdd:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
    1be1:	0f 87 21 01 00 00    	ja     1d08 <fill_reloc+0x185>
    1be7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
    1bea:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    1bf1:	00 
    1bf2:	48 8d 05 97 04 00 00 	lea    rax,[rip+0x497]        # 2090 <fill_reloc+0x50d>
    1bf9:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    1bfc:	48 98                	cdqe   
    1bfe:	48 8d 15 8b 04 00 00 	lea    rdx,[rip+0x48b]        # 2090 <fill_reloc+0x50d>
    1c05:	48 01 d0             	add    rax,rdx
    1c08:	3e ff e0             	notrack jmp rax
    case R_X86_64_GLOB_DAT:
    case R_X86_64_JUMP_SLOT: *v_rel = sym_off; break;
    1c0b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1c0f:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
    1c13:	48 89 10             	mov    QWORD PTR [rax],rdx
    1c16:	e9 ee 00 00 00       	jmp    1d09 <fill_reloc+0x186>
    case R_X86_64_PLT32: *v_rel = get_sym_plt(modid, symi); break;
    1c1b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    1c1e:	48 63 d0             	movsxd rdx,eax
    1c21:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
    1c24:	48 98                	cdqe   
    1c26:	48 89 d6             	mov    rsi,rdx
    1c29:	48 89 c7             	mov    rdi,rax
    1c2c:	e8 cf f4 ff ff       	call   1100 <get_sym_plt@plt>
    1c31:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    1c35:	48 89 02             	mov    QWORD PTR [rdx],rax
    1c38:	e9 cc 00 00 00       	jmp    1d09 <fill_reloc+0x186>
    case R_X86_64_RELATIVE: *v_rel += get_load_base(modid); break;
    1c3d:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
    1c40:	48 98                	cdqe   
    1c42:	48 89 c7             	mov    rdi,rax
    1c45:	e8 06 f5 ff ff       	call   1150 <get_load_base@plt>
    1c4a:	48 89 c2             	mov    rdx,rax
    1c4d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1c51:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1c54:	48 01 c2             	add    rdx,rax
    1c57:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1c5b:	48 89 10             	mov    QWORD PTR [rax],rdx
    1c5e:	e9 a6 00 00 00       	jmp    1d09 <fill_reloc+0x186>
    case R_X86_64_GOTOFF: *v_rel += sym_off - get_got(modid); break;
    1c63:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
    1c66:	48 98                	cdqe   
    1c68:	48 89 c7             	mov    rdi,rax
    1c6b:	e8 70 f4 ff ff       	call   10e0 <get_got@plt>
    1c70:	48 89 c2             	mov    rdx,rax
    1c73:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    1c77:	48 29 d0             	sub    rax,rdx
    1c7a:	48 89 c1             	mov    rcx,rax
    1c7d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1c81:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1c84:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
    1c88:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1c8c:	48 89 10             	mov    QWORD PTR [rax],rdx
    1c8f:	eb 78                	jmp    1d09 <fill_reloc+0x186>
    case R_X86_64_GOTPC: *v_rel += get_got(modid) - (off_t)rel; break;
    1c91:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
    1c94:	48 98                	cdqe   
    1c96:	48 89 c7             	mov    rdi,rax
    1c99:	e8 42 f4 ff ff       	call   10e0 <get_got@plt>
    1c9e:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
    1ca2:	48 29 d0             	sub    rax,rdx
    1ca5:	48 89 c1             	mov    rcx,rax
    1ca8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1cac:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1caf:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
    1cb3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1cb7:	48 89 10             	mov    QWORD PTR [rax],rdx
    1cba:	eb 4d                	jmp    1d09 <fill_reloc+0x186>
    case R_X86_64_GOT32:
        //这一项,rel里面指向的符号的地址就是got
        *v_rel += sym_off;
    1cbc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1cc0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    1cc3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    1cc7:	48 01 c2             	add    rdx,rax
    1cca:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1cce:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    1cd1:	eb 36                	jmp    1d09 <fill_reloc+0x186>
    case R_X86_64_32S:
    case R_X86_64_64: *v_rel += sym_off; break;
    1cd3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1cd7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    1cda:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    1cde:	48 01 c2             	add    rdx,rax
    1ce1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1ce5:	48 89 10             	mov    QWORD PTR [rax],rdx
    1ce8:	eb 1f                	jmp    1d09 <fill_reloc+0x186>
    case R_X86_64_PC32: *v_rel += sym_off - (off_t)rel; break;
    1cea:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1cee:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    1cf1:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
    1cf5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    1cf9:	48 29 c8             	sub    rax,rcx
    1cfc:	48 01 c2             	add    rdx,rax
    1cff:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1d03:	48 89 10             	mov    QWORD PTR [rax],rdx
    1d06:	eb 01                	jmp    1d09 <fill_reloc+0x186>
    default: break;
    1d08:	90                   	nop
    }
    1d09:	90                   	nop
    1d0a:	c9                   	leave  
    1d0b:	c3                   	ret    
