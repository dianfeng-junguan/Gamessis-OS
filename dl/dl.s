
bin/dl.so:     file format elf64-x86-64


Disassembly of section .plt:

0000000000001000 <get_got@plt-0x10>:
    1000:	ff 35 02 30 00 00    	push   QWORD PTR [rip+0x3002]        # 4008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1006:	ff 25 04 30 00 00    	jmp    QWORD PTR [rip+0x3004]        # 4010 <_GLOBAL_OFFSET_TABLE_+0x10>
    100c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000001010 <get_got@plt>:
    1010:	ff 25 02 30 00 00    	jmp    QWORD PTR [rip+0x3002]        # 4018 <get_got+0x263b>
    1016:	68 00 00 00 00       	push   0x0
    101b:	e9 e0 ff ff ff       	jmp    1000 <get_got@plt-0x10>

0000000000001020 <malloc@plt>:
    1020:	ff 25 fa 2f 00 00    	jmp    QWORD PTR [rip+0x2ffa]        # 4020 <malloc>
    1026:	68 01 00 00 00       	push   0x1
    102b:	e9 d0 ff ff ff       	jmp    1000 <get_got@plt-0x10>

0000000000001030 <get_sym_plt@plt>:
    1030:	ff 25 f2 2f 00 00    	jmp    QWORD PTR [rip+0x2ff2]        # 4028 <get_sym_plt+0x268b>
    1036:	68 02 00 00 00       	push   0x2
    103b:	e9 c0 ff ff ff       	jmp    1000 <get_got@plt-0x10>

0000000000001040 <lseek@plt>:
    1040:	ff 25 ea 2f 00 00    	jmp    QWORD PTR [rip+0x2fea]        # 4030 <lseek>
    1046:	68 03 00 00 00       	push   0x3
    104b:	e9 b0 ff ff ff       	jmp    1000 <get_got@plt-0x10>

0000000000001050 <fill_reloc@plt>:
    1050:	ff 25 e2 2f 00 00    	jmp    QWORD PTR [rip+0x2fe2]        # 4038 <fill_reloc>
    1056:	68 04 00 00 00       	push   0x4
    105b:	e9 a0 ff ff ff       	jmp    1000 <get_got@plt-0x10>

0000000000001060 <mmap@plt>:
    1060:	ff 25 da 2f 00 00    	jmp    QWORD PTR [rip+0x2fda]        # 4040 <mmap+0x22e0>
    1066:	68 05 00 00 00       	push   0x5
    106b:	e9 90 ff ff ff       	jmp    1000 <get_got@plt-0x10>

0000000000001070 <read@plt>:
    1070:	ff 25 d2 2f 00 00    	jmp    QWORD PTR [rip+0x2fd2]        # 4048 <read+0x23f8>
    1076:	68 06 00 00 00       	push   0x6
    107b:	e9 80 ff ff ff       	jmp    1000 <get_got@plt-0x10>

0000000000001080 <get_load_base@plt>:
    1080:	ff 25 ca 2f 00 00    	jmp    QWORD PTR [rip+0x2fca]        # 4050 <get_load_base+0x26a0>
    1086:	68 07 00 00 00       	push   0x7
    108b:	e9 70 ff ff ff       	jmp    1000 <get_got@plt-0x10>

0000000000001090 <load_elfso@plt>:
    1090:	ff 25 c2 2f 00 00    	jmp    QWORD PTR [rip+0x2fc2]        # 4058 <load_elfso+0x2e1a>
    1096:	68 08 00 00 00       	push   0x8
    109b:	e9 60 ff ff ff       	jmp    1000 <get_got@plt-0x10>

00000000000010a0 <get_sym_addr@plt>:
    10a0:	ff 25 ba 2f 00 00    	jmp    QWORD PTR [rip+0x2fba]        # 4060 <get_sym_addr+0x27ce>
    10a6:	68 09 00 00 00       	push   0x9
    10ab:	e9 50 ff ff ff       	jmp    1000 <get_got@plt-0x10>

00000000000010b0 <open@plt>:
    10b0:	ff 25 b2 2f 00 00    	jmp    QWORD PTR [rip+0x2fb2]        # 4068 <open+0x2438>
    10b6:	68 0a 00 00 00       	push   0xa
    10bb:	e9 40 ff ff ff       	jmp    1000 <get_got@plt-0x10>

00000000000010c0 <close@plt>:
    10c0:	ff 25 aa 2f 00 00    	jmp    QWORD PTR [rip+0x2faa]        # 4070 <close+0x2430>
    10c6:	68 0b 00 00 00       	push   0xb
    10cb:	e9 30 ff ff ff       	jmp    1000 <get_got@plt-0x10>

00000000000010d0 <free@plt>:
    10d0:	ff 25 a2 2f 00 00    	jmp    QWORD PTR [rip+0x2fa2]        # 4078 <free>
    10d6:	68 0c 00 00 00       	push   0xc
    10db:	e9 20 ff ff ff       	jmp    1000 <get_got@plt-0x10>

Disassembly of section .text:

00000000000010e0 <get_modid>:
#include <fcntl.h>
#include <exe.h>

module modules[MAX_MODULES];
id_t   get_modid(void)
{
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	55                   	push   rbp
    10e5:	48 89 e5             	mov    rbp,rsp
    static id_t modid_d = 0;
    return modid_d++;
    10e8:	8b 05 92 4b 00 00    	mov    eax,DWORD PTR [rip+0x4b92]        # 5c80 <modid_d.0>
    10ee:	8d 50 01             	lea    edx,[rax+0x1]
    10f1:	89 15 89 4b 00 00    	mov    DWORD PTR [rip+0x4b89],edx        # 5c80 <modid_d.0>
}
    10f7:	5d                   	pop    rbp
    10f8:	c3                   	ret    

00000000000010f9 <dlmain>:
int dlmain(int fno, int argc, char** argv)
{
    10f9:	f3 0f 1e fa          	endbr64 
    10fd:	55                   	push   rbp
    10fe:	48 89 e5             	mov    rbp,rsp
    1101:	48 83 ec 70          	sub    rsp,0x70
    1105:	89 7d 9c             	mov    DWORD PTR [rbp-0x64],edi
    1108:	89 75 98             	mov    DWORD PTR [rbp-0x68],esi
    110b:	48 89 55 90          	mov    QWORD PTR [rbp-0x70],rdx
    //加载elf文件
    // 读取文件头
    Elf64_Ehdr ehdr;
    //读取文件头
    read(fno, &ehdr, sizeof(ehdr));
    110f:	48 8d 4d a0          	lea    rcx,[rbp-0x60]
    1113:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
    1116:	ba 40 00 00 00       	mov    edx,0x40
    111b:	48 89 ce             	mov    rsi,rcx
    111e:	89 c7                	mov    edi,eax
    1120:	e8 4b ff ff ff       	call   1070 <read@plt>

    unsigned short entn = ehdr.e_phnum;
    1125:	0f b7 45 d8          	movzx  eax,WORD PTR [rbp-0x28]
    1129:	66 89 45 fa          	mov    WORD PTR [rbp-0x6],ax
    unsigned short ents = ehdr.e_phentsize;
    112d:	0f b7 45 d6          	movzx  eax,WORD PTR [rbp-0x2a]
    1131:	66 89 45 f8          	mov    WORD PTR [rbp-0x8],ax
    module*        mod  = 0;
    1135:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
    113c:	00 
    // module项设置
    //先注册自己
    for (int i = 0; i < MAX_MODULES; i++) {
    113d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    1144:	e9 a7 00 00 00       	jmp    11f0 <dlmain+0xf7>
        if (modules[i].type == ET_NONE) {
    1149:	48 8b 0d a0 2e 00 00 	mov    rcx,QWORD PTR [rip+0x2ea0]        # 3ff0 <modules-0x90>
    1150:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    1153:	48 63 d0             	movsxd rdx,eax
    1156:	48 89 d0             	mov    rax,rdx
    1159:	48 c1 e0 03          	shl    rax,0x3
    115d:	48 29 d0             	sub    rax,rdx
    1160:	48 c1 e0 03          	shl    rax,0x3
    1164:	48 01 c8             	add    rax,rcx
    1167:	48 83 c0 18          	add    rax,0x18
    116b:	48 8b 00             	mov    rax,QWORD PTR [rax]
    116e:	48 85 c0             	test   rax,rax
    1171:	75 79                	jne    11ec <dlmain+0xf3>
            modules[i].type        = ET_DYN;
    1173:	48 8b 0d 76 2e 00 00 	mov    rcx,QWORD PTR [rip+0x2e76]        # 3ff0 <modules-0x90>
    117a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    117d:	48 63 d0             	movsxd rdx,eax
    1180:	48 89 d0             	mov    rax,rdx
    1183:	48 c1 e0 03          	shl    rax,0x3
    1187:	48 29 d0             	sub    rax,rdx
    118a:	48 c1 e0 03          	shl    rax,0x3
    118e:	48 01 c8             	add    rax,rcx
    1191:	48 83 c0 18          	add    rax,0x18
    1195:	48 c7 00 03 00 00 00 	mov    QWORD PTR [rax],0x3
            modules[i].load_offset = 0;
    119c:	48 8b 0d 4d 2e 00 00 	mov    rcx,QWORD PTR [rip+0x2e4d]        # 3ff0 <modules-0x90>
    11a3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    11a6:	48 63 d0             	movsxd rdx,eax
    11a9:	48 89 d0             	mov    rax,rdx
    11ac:	48 c1 e0 03          	shl    rax,0x3
    11b0:	48 29 d0             	sub    rax,rdx
    11b3:	48 c1 e0 03          	shl    rax,0x3
    11b7:	48 01 c8             	add    rax,rcx
    11ba:	48 83 c0 08          	add    rax,0x8
    11be:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            modules[i].base        = 0;
    11c5:	48 8b 0d 24 2e 00 00 	mov    rcx,QWORD PTR [rip+0x2e24]        # 3ff0 <modules-0x90>
    11cc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    11cf:	48 63 d0             	movsxd rdx,eax
    11d2:	48 89 d0             	mov    rax,rdx
    11d5:	48 c1 e0 03          	shl    rax,0x3
    11d9:	48 29 d0             	sub    rax,rdx
    11dc:	48 c1 e0 03          	shl    rax,0x3
    11e0:	48 01 c8             	add    rax,rcx
    11e3:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            break;
    11ea:	eb 0e                	jmp    11fa <dlmain+0x101>
    for (int i = 0; i < MAX_MODULES; i++) {
    11ec:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    11f0:	83 7d fc 7f          	cmp    DWORD PTR [rbp-0x4],0x7f
    11f4:	0f 8e 4f ff ff ff    	jle    1149 <dlmain+0x50>
        }
    }
    //递归加载elf和so
    load_elfso(fno);
    11fa:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
    11fd:	89 c7                	mov    edi,eax
    11ff:	b8 00 00 00 00       	mov    eax,0x0
    1204:	e8 87 fe ff ff       	call   1090 <load_elfso@plt>
    close(fno);
    1209:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
    120c:	89 c7                	mov    edi,eax
    120e:	e8 ad fe ff ff       	call   10c0 <close@plt>
    //跳转到程序入口
    int (*main)(int, char**) = ehdr.e_entry;
    1213:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    1217:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    free(&ehdr);
    121b:	48 8d 45 a0          	lea    rax,[rbp-0x60]
    121f:	48 89 c7             	mov    rdi,rax
    1222:	e8 a9 fe ff ff       	call   10d0 <free@plt>
    main(1, 0);
    1227:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    122b:	be 00 00 00 00       	mov    esi,0x0
    1230:	bf 01 00 00 00       	mov    edi,0x1
    1235:	ff d0                	call   rax
    return 0;
    1237:	b8 00 00 00 00       	mov    eax,0x0
}
    123c:	c9                   	leave  
    123d:	c3                   	ret    

000000000000123e <load_elfso>:
int load_elfso(int fno)
{
    123e:	f3 0f 1e fa          	endbr64 
    1242:	55                   	push   rbp
    1243:	48 89 e5             	mov    rbp,rsp
    1246:	48 81 ec 30 01 00 00 	sub    rsp,0x130
    124d:	89 bd dc fe ff ff    	mov    DWORD PTR [rbp-0x124],edi
    // 读取文件头
    Elf64_Ehdr ehdr;
    //读取文件头
    read(fno, &ehdr, sizeof(ehdr));
    1253:	48 8d 8d e0 fe ff ff 	lea    rcx,[rbp-0x120]
    125a:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    1260:	ba 40 00 00 00       	mov    edx,0x40
    1265:	48 89 ce             	mov    rsi,rcx
    1268:	89 c7                	mov    edi,eax
    126a:	e8 01 fe ff ff       	call   1070 <read@plt>

    unsigned short entn = ehdr.e_phnum;
    126f:	0f b7 85 18 ff ff ff 	movzx  eax,WORD PTR [rbp-0xe8]
    1276:	66 89 45 86          	mov    WORD PTR [rbp-0x7a],ax
    unsigned short ents = ehdr.e_phentsize;
    127a:	0f b7 85 16 ff ff ff 	movzx  eax,WORD PTR [rbp-0xea]
    1281:	66 89 45 84          	mov    WORD PTR [rbp-0x7c],ax
    module*        mod  = 0;
    1285:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    128c:	00 
    // module项设置
    //注册自己
    for (int i = 0; i < MAX_MODULES; i++) {
    128d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    1294:	e9 d6 00 00 00       	jmp    136f <load_elfso+0x131>
        if (modules[i].type == ET_NONE) {
    1299:	48 8b 0d 50 2d 00 00 	mov    rcx,QWORD PTR [rip+0x2d50]        # 3ff0 <modules-0x90>
    12a0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    12a3:	48 63 d0             	movsxd rdx,eax
    12a6:	48 89 d0             	mov    rax,rdx
    12a9:	48 c1 e0 03          	shl    rax,0x3
    12ad:	48 29 d0             	sub    rax,rdx
    12b0:	48 c1 e0 03          	shl    rax,0x3
    12b4:	48 01 c8             	add    rax,rcx
    12b7:	48 83 c0 18          	add    rax,0x18
    12bb:	48 8b 00             	mov    rax,QWORD PTR [rax]
    12be:	48 85 c0             	test   rax,rax
    12c1:	0f 85 a4 00 00 00    	jne    136b <load_elfso+0x12d>
            modules[i].type        = ehdr.e_type;
    12c7:	0f b7 85 f0 fe ff ff 	movzx  eax,WORD PTR [rbp-0x110]
    12ce:	0f b7 d0             	movzx  edx,ax
    12d1:	48 8b 35 18 2d 00 00 	mov    rsi,QWORD PTR [rip+0x2d18]        # 3ff0 <modules-0x90>
    12d8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    12db:	48 63 c8             	movsxd rcx,eax
    12de:	48 89 c8             	mov    rax,rcx
    12e1:	48 c1 e0 03          	shl    rax,0x3
    12e5:	48 29 c8             	sub    rax,rcx
    12e8:	48 c1 e0 03          	shl    rax,0x3
    12ec:	48 01 f0             	add    rax,rsi
    12ef:	48 83 c0 18          	add    rax,0x18
    12f3:	48 89 10             	mov    QWORD PTR [rax],rdx
            modules[i].load_offset = 0;
    12f6:	48 8b 0d f3 2c 00 00 	mov    rcx,QWORD PTR [rip+0x2cf3]        # 3ff0 <modules-0x90>
    12fd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1300:	48 63 d0             	movsxd rdx,eax
    1303:	48 89 d0             	mov    rax,rdx
    1306:	48 c1 e0 03          	shl    rax,0x3
    130a:	48 29 d0             	sub    rax,rdx
    130d:	48 c1 e0 03          	shl    rax,0x3
    1311:	48 01 c8             	add    rax,rcx
    1314:	48 83 c0 08          	add    rax,0x8
    1318:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            modules[i].base        = 0;
    131f:	48 8b 0d ca 2c 00 00 	mov    rcx,QWORD PTR [rip+0x2cca]        # 3ff0 <modules-0x90>
    1326:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1329:	48 63 d0             	movsxd rdx,eax
    132c:	48 89 d0             	mov    rax,rdx
    132f:	48 c1 e0 03          	shl    rax,0x3
    1333:	48 29 d0             	sub    rax,rdx
    1336:	48 c1 e0 03          	shl    rax,0x3
    133a:	48 01 c8             	add    rax,rcx
    133d:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            mod                    = modules + i;
    1344:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1347:	48 63 d0             	movsxd rdx,eax
    134a:	48 89 d0             	mov    rax,rdx
    134d:	48 c1 e0 03          	shl    rax,0x3
    1351:	48 29 d0             	sub    rax,rdx
    1354:	48 c1 e0 03          	shl    rax,0x3
    1358:	48 89 c2             	mov    rdx,rax
    135b:	48 8b 05 8e 2c 00 00 	mov    rax,QWORD PTR [rip+0x2c8e]        # 3ff0 <modules-0x90>
    1362:	48 01 d0             	add    rax,rdx
    1365:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
            break;
    1369:	eb 0e                	jmp    1379 <load_elfso+0x13b>
    for (int i = 0; i < MAX_MODULES; i++) {
    136b:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
    136f:	83 7d f4 7f          	cmp    DWORD PTR [rbp-0xc],0x7f
    1373:	0f 8e 20 ff ff ff    	jle    1299 <load_elfso+0x5b>
        }
    }
    //需要malloc一块内存
    Elf64_Phdr* ph = malloc(entn * ents);   //(Elf64_Phdr *) (tmpla + ehdr.e_phoff);
    1379:	0f b7 55 86          	movzx  edx,WORD PTR [rbp-0x7a]
    137d:	0f b7 45 84          	movzx  eax,WORD PTR [rbp-0x7c]
    1381:	0f af c2             	imul   eax,edx
    1384:	48 98                	cdqe   
    1386:	48 89 c7             	mov    rdi,rax
    1389:	e8 92 fc ff ff       	call   1020 <malloc@plt>
    138e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    lseek(fno, ehdr.e_phoff, SEEK_SET);
    1392:	48 8b 8d 00 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x100]
    1399:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    139f:	ba 00 00 00 00       	mov    edx,0x0
    13a4:	48 89 ce             	mov    rsi,rcx
    13a7:	89 c7                	mov    edi,eax
    13a9:	e8 92 fc ff ff       	call   1040 <lseek@plt>
    read(fno, ph, entn * ents);
    13ae:	0f b7 55 86          	movzx  edx,WORD PTR [rbp-0x7a]
    13b2:	0f b7 45 84          	movzx  eax,WORD PTR [rbp-0x7c]
    13b6:	0f af c2             	imul   eax,edx
    13b9:	48 63 d0             	movsxd rdx,eax
    13bc:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
    13c0:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    13c6:	48 89 ce             	mov    rsi,rcx
    13c9:	89 c7                	mov    edi,eax
    13cb:	e8 a0 fc ff ff       	call   1070 <read@plt>
    size_t tot_sz = 0;
    13d0:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
    13d7:	00 00 00 00 
    off_t  base = ph->p_vaddr, offset = 0;
    13db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    13df:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    13e3:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    13ea:	48 c7 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],0x0
    13f1:	00 00 00 00 
    int (**init)() = 0, init_arraysz = 0;
    13f5:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    13fc:	00 
    13fd:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0

    for (int i = 0; i < entn; i++) {
    1404:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [rbp-0x28],0x0
    140b:	e9 ca 00 00 00       	jmp    14da <load_elfso+0x29c>
        //加载段
        if ((ph->p_type | PT_LOAD) != 0) {
            unsigned long off  = ph->p_offset;
    1410:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1414:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1418:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
            unsigned long fs   = ph->p_filesz;
    141f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1423:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    1427:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            size_t        ms   = ph->p_memsz;
    142e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1432:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    1436:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            char*         vptr = (char*)ph->p_vaddr + offset;
    143d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1441:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    1445:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    144c:	48 01 d0             	add    rax,rdx
    144f:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            if (off == 0) { mod->header = vptr; }
    1456:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
    145d:	00 
    145e:	75 0f                	jne    146f <load_elfso+0x231>
    1460:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
    1467:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    146b:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
            //先映射好内存
            int prot = PROT_READ;
    146f:	c7 85 24 ff ff ff 01 	mov    DWORD PTR [rbp-0xdc],0x1
    1476:	00 00 00 
            if ((ph->p_flags | PF_X)) prot |= PROT_EXEC;
    1479:	83 8d 24 ff ff ff 04 	or     DWORD PTR [rbp-0xdc],0x4
            if ((ph->p_flags | PF_W)) prot |= PROT_WRITE;
    1480:	83 8d 24 ff ff ff 02 	or     DWORD PTR [rbp-0xdc],0x2
            int flags = MAP_PRIVATE;
    1487:	c7 45 d4 02 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x2
            if (ehdr.e_type == ET_EXEC) flags |= MAP_FIXED;
    148e:	0f b7 85 f0 fe ff ff 	movzx  eax,WORD PTR [rbp-0x110]
    1495:	66 83 f8 02          	cmp    ax,0x2
    1499:	75 04                	jne    149f <load_elfso+0x261>
    149b:	83 4d d4 01          	or     DWORD PTR [rbp-0x2c],0x1
            mmap(vptr, fs, prot, flags, fno, off);
    149f:	4c 8b 85 40 ff ff ff 	mov    r8,QWORD PTR [rbp-0xc0]
    14a6:	8b bd dc fe ff ff    	mov    edi,DWORD PTR [rbp-0x124]
    14ac:	8b 4d d4             	mov    ecx,DWORD PTR [rbp-0x2c]
    14af:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
    14b5:	48 8b b5 38 ff ff ff 	mov    rsi,QWORD PTR [rbp-0xc8]
    14bc:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    14c3:	4d 89 c1             	mov    r9,r8
    14c6:	41 89 f8             	mov    r8d,edi
    14c9:	48 89 c7             	mov    rdi,rax
    14cc:	e8 8f fb ff ff       	call   1060 <mmap@plt>
        }
        ph++;
    14d1:	48 83 45 e8 38       	add    QWORD PTR [rbp-0x18],0x38
    for (int i = 0; i < entn; i++) {
    14d6:	83 45 d8 01          	add    DWORD PTR [rbp-0x28],0x1
    14da:	0f b7 45 86          	movzx  eax,WORD PTR [rbp-0x7a]
    14de:	39 45 d8             	cmp    DWORD PTR [rbp-0x28],eax
    14e1:	0f 8c 29 ff ff ff    	jl     1410 <load_elfso+0x1d2>
    }

    Elf64_Dyn* dynamic = 0;
    14e7:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
    14ee:	00 
    //寻找dynamic段
    struct Elf64_Shdr* shdr =
        mmap(0, ehdr.e_shentsize * ehdr.e_shnum, PROT_READ, MAP_PRIVATE, fno, ehdr.e_shoff);
    14ef:	48 8b 8d 08 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xf8]
    14f6:	0f b7 85 1a ff ff ff 	movzx  eax,WORD PTR [rbp-0xe6]
    14fd:	0f b7 d0             	movzx  edx,ax
    1500:	0f b7 85 1c ff ff ff 	movzx  eax,WORD PTR [rbp-0xe4]
    1507:	0f b7 c0             	movzx  eax,ax
    150a:	0f af c2             	imul   eax,edx
    150d:	48 98                	cdqe   
    150f:	8b 95 dc fe ff ff    	mov    edx,DWORD PTR [rbp-0x124]
    1515:	49 89 c9             	mov    r9,rcx
    1518:	41 89 d0             	mov    r8d,edx
    151b:	b9 02 00 00 00       	mov    ecx,0x2
    1520:	ba 01 00 00 00       	mov    edx,0x1
    1525:	48 89 c6             	mov    rsi,rax
    1528:	bf 00 00 00 00       	mov    edi,0x0
    152d:	e8 2e fb ff ff       	call   1060 <mmap@plt>
    1532:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    for (int i = 0; i < ehdr.e_shnum; i++) {
    1539:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
    1540:	eb 52                	jmp    1594 <load_elfso+0x356>
        if (shdr[i].sh_type == SHT_DYNAMIC) {
    1542:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    1545:	48 63 d0             	movsxd rdx,eax
    1548:	48 89 d0             	mov    rax,rdx
    154b:	48 01 c0             	add    rax,rax
    154e:	48 01 d0             	add    rax,rdx
    1551:	48 c1 e0 04          	shl    rax,0x4
    1555:	48 89 c2             	mov    rdx,rax
    1558:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    155f:	48 01 d0             	add    rax,rdx
    1562:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1565:	83 f8 06             	cmp    eax,0x6
    1568:	75 26                	jne    1590 <load_elfso+0x352>
            dynamic = shdr + i;
    156a:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    156d:	48 63 d0             	movsxd rdx,eax
    1570:	48 89 d0             	mov    rax,rdx
    1573:	48 01 c0             	add    rax,rax
    1576:	48 01 d0             	add    rax,rdx
    1579:	48 c1 e0 04          	shl    rax,0x4
    157d:	48 89 c2             	mov    rdx,rax
    1580:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    1587:	48 01 d0             	add    rax,rdx
    158a:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            break;
    158e:	eb 13                	jmp    15a3 <load_elfso+0x365>
    for (int i = 0; i < ehdr.e_shnum; i++) {
    1590:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
    1594:	0f b7 85 1c ff ff ff 	movzx  eax,WORD PTR [rbp-0xe4]
    159b:	0f b7 c0             	movzx  eax,ax
    159e:	39 45 c4             	cmp    DWORD PTR [rbp-0x3c],eax
    15a1:	7c 9f                	jl     1542 <load_elfso+0x304>
        }
    }
    if (!dynamic)
        ;
    char*  dynstr = 0;
    15a3:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
    15aa:	00 
    off_t* got    = 0;
    15ab:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
    15b2:	00 00 00 00 
    //这里一堆获取函数之后实现细节
    // dynstr=so_get_dynstr(dyn);
    // so_get_dynstr从so中获取.dynstr节
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    15b6:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    15ba:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
    15be:	eb 2a                	jmp    15ea <load_elfso+0x3ac>
        if (p->d_tag == DT_STRTAB) {
    15c0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    15c4:	48 8b 00             	mov    rax,QWORD PTR [rax]
    15c7:	48 83 f8 05          	cmp    rax,0x5
    15cb:	75 18                	jne    15e5 <load_elfso+0x3a7>
            dynstr = p->d_un.d_ptr + offset;
    15cd:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    15d1:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    15d5:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    15dc:	48 01 d0             	add    rax,rdx
    15df:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
            break;
    15e3:	eb 11                	jmp    15f6 <load_elfso+0x3b8>
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    15e5:	48 83 45 b0 10       	add    QWORD PTR [rbp-0x50],0x10
    15ea:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    15ee:	48 8b 00             	mov    rax,QWORD PTR [rax]
    15f1:	48 85 c0             	test   rax,rax
    15f4:	75 ca                	jne    15c0 <load_elfso+0x382>
        }
    }

    size_t relsz = 0, relentsz = 0;
    15f6:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
    15fd:	00 
    15fe:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    1605:	00 
    off_t  relptr = 0;
    1606:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    160d:	00 
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    160e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    1612:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    1616:	e9 17 02 00 00       	jmp    1832 <load_elfso+0x5f4>
        switch (p->d_tag) {
    161b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    161f:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1622:	48 83 f8 1b          	cmp    rax,0x1b
    1626:	0f 87 4d 01 00 00    	ja     1779 <load_elfso+0x53b>
    162c:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    1633:	00 
    1634:	48 8d 05 c5 09 00 00 	lea    rax,[rip+0x9c5]        # 2000 <sbrk+0x250>
    163b:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    163e:	48 98                	cdqe   
    1640:	48 8d 15 b9 09 00 00 	lea    rdx,[rip+0x9b9]        # 2000 <sbrk+0x250>
    1647:	48 01 d0             	add    rax,rdx
    164a:	3e ff e0             	notrack jmp rax
        case DT_NEEDED:
            char* pathname = p->d_un.d_val + dynstr;
    164d:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1651:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1655:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    1659:	48 01 d0             	add    rax,rdx
    165c:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
            int   so_fno   = open(pathname, O_EXEC);
    1663:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
    166a:	be 00 10 00 00       	mov    esi,0x1000
    166f:	48 89 c7             	mov    rdi,rax
    1672:	e8 39 fa ff ff       	call   10b0 <open@plt>
    1677:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
            //不查错了
            load_elfso(open(pathname, O_EXEC));
    167d:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
    1684:	be 00 10 00 00       	mov    esi,0x1000
    1689:	48 89 c7             	mov    rdi,rax
    168c:	e8 1f fa ff ff       	call   10b0 <open@plt>
    1691:	89 c7                	mov    edi,eax
    1693:	e8 a6 fb ff ff       	call   123e <load_elfso>
            close(so_fno);
    1698:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
    169e:	89 c7                	mov    edi,eax
    16a0:	e8 1b fa ff ff       	call   10c0 <close@plt>

            break;
    16a5:	e9 d0 00 00 00       	jmp    177a <load_elfso+0x53c>
        case DT_PLTGOT:
            got = p->d_un.d_ptr + offset;
    16aa:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    16ae:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    16b2:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    16b9:	48 01 d0             	add    rax,rdx
    16bc:	48 89 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rax

            //赋值为dl的运行时重定位函数
            got[2] = dl_runtime_resolve;
    16c3:	48 8b 85 58 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa8]
    16ca:	48 83 c0 10          	add    rax,0x10
    16ce:	48 8b 15 23 29 00 00 	mov    rdx,QWORD PTR [rip+0x2923]        # 3ff8 <dl_runtime_resolve+0x25ea>
    16d5:	48 89 10             	mov    QWORD PTR [rax],rdx
            //填入模块id
            got[1]     = mod - modules;
    16d8:	48 8b 05 11 29 00 00 	mov    rax,QWORD PTR [rip+0x2911]        # 3ff0 <modules-0x90>
    16df:	48 89 c2             	mov    rdx,rax
    16e2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    16e6:	48 29 d0             	sub    rax,rdx
    16e9:	48 c1 f8 03          	sar    rax,0x3
    16ed:	48 89 c2             	mov    rdx,rax
    16f0:	48 b8 b7 6d db b6 6d 	movabs rax,0x6db6db6db6db6db7
    16f7:	db b6 6d 
    16fa:	48 0f af c2          	imul   rax,rdx
    16fe:	48 89 c2             	mov    rdx,rax
    1701:	48 8b 85 58 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa8]
    1708:	48 83 c0 08          	add    rax,0x8
    170c:	48 89 10             	mov    QWORD PTR [rax],rdx
            mod->p_got = got;
    170f:	48 8b 95 58 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xa8]
    1716:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    171a:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
        case DT_SYMTAB: mod->p_symbol = p->d_un.d_ptr; break;
    171e:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1722:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1726:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    172a:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    172e:	eb 4a                	jmp    177a <load_elfso+0x53c>
        case DT_RELSZ:
        case DT_RELASZ: relsz = p->d_un.d_val; goto is_rel_prepared;
    1730:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1734:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1738:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    173c:	eb 41                	jmp    177f <load_elfso+0x541>
        case DT_REL:
        case DT_RELA: relptr = p->d_un.d_ptr; goto is_rel_prepared;
    173e:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1742:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1746:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    174a:	eb 33                	jmp    177f <load_elfso+0x541>
        case DT_RELENT:
        case DT_RELAENT: relentsz = p->d_un.d_val; goto is_rel_prepared;
    174c:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1750:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1754:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
    1758:	eb 25                	jmp    177f <load_elfso+0x541>
        case DT_INIT_ARRAY: init = p->d_un.d_ptr; break;
    175a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    175e:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1762:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    1766:	eb 12                	jmp    177a <load_elfso+0x53c>
        case DT_INIT_ARRAYSZ: init_arraysz = p->d_un.d_val / 8; break;
    1768:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    176c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1770:	48 c1 e8 03          	shr    rax,0x3
    1774:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    1777:	eb 01                	jmp    177a <load_elfso+0x53c>
        default: break;
    1779:	90                   	nop
        }
        continue;
    177a:	e9 ae 00 00 00       	jmp    182d <load_elfso+0x5ef>
    is_rel_prepared:
        if (!(relsz && relentsz && relptr)) continue;
    177f:	48 83 7d a8 00       	cmp    QWORD PTR [rbp-0x58],0x0
    1784:	0f 84 a2 00 00 00    	je     182c <load_elfso+0x5ee>
    178a:	48 83 7d a0 00       	cmp    QWORD PTR [rbp-0x60],0x0
    178f:	0f 84 97 00 00 00    	je     182c <load_elfso+0x5ee>
    1795:	48 83 7d 98 00       	cmp    QWORD PTR [rbp-0x68],0x0
    179a:	0f 84 8c 00 00 00    	je     182c <load_elfso+0x5ee>
        for (int j = 0; j < relsz / relentsz; j++) {
    17a0:	c7 45 8c 00 00 00 00 	mov    DWORD PTR [rbp-0x74],0x0
    17a7:	eb 51                	jmp    17fa <load_elfso+0x5bc>
            fill_reloc(relptr + j * relentsz, mod - modules);
    17a9:	48 8b 05 40 28 00 00 	mov    rax,QWORD PTR [rip+0x2840]        # 3ff0 <modules-0x90>
    17b0:	48 89 c2             	mov    rdx,rax
    17b3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    17b7:	48 29 d0             	sub    rax,rdx
    17ba:	48 c1 f8 03          	sar    rax,0x3
    17be:	48 89 c2             	mov    rdx,rax
    17c1:	48 b8 b7 6d db b6 6d 	movabs rax,0x6db6db6db6db6db7
    17c8:	db b6 6d 
    17cb:	48 0f af c2          	imul   rax,rdx
    17cf:	48 89 c2             	mov    rdx,rax
    17d2:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    17d5:	48 98                	cdqe   
    17d7:	48 0f af 45 a0       	imul   rax,QWORD PTR [rbp-0x60]
    17dc:	48 89 c1             	mov    rcx,rax
    17df:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
    17e3:	48 01 c8             	add    rax,rcx
    17e6:	48 89 d6             	mov    rsi,rdx
    17e9:	48 89 c7             	mov    rdi,rax
    17ec:	b8 00 00 00 00       	mov    eax,0x0
    17f1:	e8 5a f8 ff ff       	call   1050 <fill_reloc@plt>
        for (int j = 0; j < relsz / relentsz; j++) {
    17f6:	83 45 8c 01          	add    DWORD PTR [rbp-0x74],0x1
    17fa:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    17fd:	48 63 c8             	movsxd rcx,eax
    1800:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
    1804:	ba 00 00 00 00       	mov    edx,0x0
    1809:	48 f7 75 a0          	div    QWORD PTR [rbp-0x60]
    180d:	48 39 c1             	cmp    rcx,rax
    1810:	72 97                	jb     17a9 <load_elfso+0x56b>
        }
        relsz = relentsz = relptr = 0;
    1812:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    1819:	00 
    181a:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    1821:	00 
    1822:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    1826:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    182a:	eb 01                	jmp    182d <load_elfso+0x5ef>
        if (!(relsz && relentsz && relptr)) continue;
    182c:	90                   	nop
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    182d:	48 83 45 90 10       	add    QWORD PTR [rbp-0x70],0x10
    1832:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1836:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1839:	48 85 c0             	test   rax,rax
    183c:	0f 85 d9 fd ff ff    	jne    161b <load_elfso+0x3dd>
    }
    if (init) {
    1842:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
    1847:	74 33                	je     187c <load_elfso+0x63e>
        //调用模块入口函数
        for (int i = 0; i < init_arraysz; i++) { (init[i])(); }
    1849:	c7 45 88 00 00 00 00 	mov    DWORD PTR [rbp-0x78],0x0
    1850:	eb 22                	jmp    1874 <load_elfso+0x636>
    1852:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    1855:	48 98                	cdqe   
    1857:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
    185e:	00 
    185f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1863:	48 01 d0             	add    rax,rdx
    1866:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    1869:	b8 00 00 00 00       	mov    eax,0x0
    186e:	ff d2                	call   rdx
    1870:	83 45 88 01          	add    DWORD PTR [rbp-0x78],0x1
    1874:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    1877:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
    187a:	7c d6                	jl     1852 <load_elfso+0x614>
    }
    free(&ehdr);
    187c:	48 8d 85 e0 fe ff ff 	lea    rax,[rbp-0x120]
    1883:	48 89 c7             	mov    rdi,rax
    1886:	e8 45 f8 ff ff       	call   10d0 <free@plt>
    return 0;
    188b:	b8 00 00 00 00       	mov    eax,0x0
}
    1890:	c9                   	leave  
    1891:	c3                   	ret    

0000000000001892 <get_sym_addr>:
off_t get_sym_addr(unsigned long modid, unsigned long symi)
{
    1892:	f3 0f 1e fa          	endbr64 
    1896:	55                   	push   rbp
    1897:	48 89 e5             	mov    rbp,rsp
    189a:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    189e:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    struct Elf64_Sym* sym = modules[modid].p_symbol;
    18a2:	48 8b 0d 47 27 00 00 	mov    rcx,QWORD PTR [rip+0x2747]        # 3ff0 <modules-0x90>
    18a9:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
    18ad:	48 89 d0             	mov    rax,rdx
    18b0:	48 c1 e0 03          	shl    rax,0x3
    18b4:	48 29 d0             	sub    rax,rdx
    18b7:	48 c1 e0 03          	shl    rax,0x3
    18bb:	48 01 c8             	add    rax,rcx
    18be:	48 83 c0 28          	add    rax,0x28
    18c2:	48 8b 00             	mov    rax,QWORD PTR [rax]
    18c5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    sym += symi;
    18c9:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    18cd:	48 89 d0             	mov    rax,rdx
    18d0:	48 c1 e0 02          	shl    rax,0x2
    18d4:	48 01 d0             	add    rax,rdx
    18d7:	48 c1 e0 02          	shl    rax,0x2
    18db:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
    if (sym->st_shndx == SHN_COMMON) {
        //还没分配空间的符号，需要分配空间，st_value表示地址对齐约束
    }

    off_t symaddr = sym->st_value + modules[modid].load_offset;
    18df:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    18e3:	48 8b 48 04          	mov    rcx,QWORD PTR [rax+0x4]
    18e7:	48 8b 35 02 27 00 00 	mov    rsi,QWORD PTR [rip+0x2702]        # 3ff0 <modules-0x90>
    18ee:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
    18f2:	48 89 d0             	mov    rax,rdx
    18f5:	48 c1 e0 03          	shl    rax,0x3
    18f9:	48 29 d0             	sub    rax,rdx
    18fc:	48 c1 e0 03          	shl    rax,0x3
    1900:	48 01 f0             	add    rax,rsi
    1903:	48 83 c0 08          	add    rax,0x8
    1907:	48 8b 00             	mov    rax,QWORD PTR [rax]
    190a:	48 01 c8             	add    rax,rcx
    190d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (modules[modid].type == ET_DYN) {
    1911:	48 8b 0d d8 26 00 00 	mov    rcx,QWORD PTR [rip+0x26d8]        # 3ff0 <modules-0x90>
    1918:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
    191c:	48 89 d0             	mov    rax,rdx
    191f:	48 c1 e0 03          	shl    rax,0x3
    1923:	48 29 d0             	sub    rax,rdx
    1926:	48 c1 e0 03          	shl    rax,0x3
    192a:	48 01 c8             	add    rax,rcx
    192d:	48 83 c0 18          	add    rax,0x18
    1931:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1934:	48 83 f8 03          	cmp    rax,0x3
    1938:	75 5d                	jne    1997 <get_sym_addr+0x105>
        //还要加上节地址
        Elf64_Ehdr*        ehdr = modules[modid].header;
    193a:	48 8b 0d af 26 00 00 	mov    rcx,QWORD PTR [rip+0x26af]        # 3ff0 <modules-0x90>
    1941:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
    1945:	48 89 d0             	mov    rax,rdx
    1948:	48 c1 e0 03          	shl    rax,0x3
    194c:	48 29 d0             	sub    rax,rdx
    194f:	48 c1 e0 03          	shl    rax,0x3
    1953:	48 01 c8             	add    rax,rcx
    1956:	48 83 c0 10          	add    rax,0x10
    195a:	48 8b 00             	mov    rax,QWORD PTR [rax]
    195d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        struct Elf64_Shdr* shdr = ehdr->e_shoff;
    1961:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1965:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    1969:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        symaddr += shdr[sym->st_shndx].sh_addr;
    196d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    1971:	0f b7 40 12          	movzx  eax,WORD PTR [rax+0x12]
    1975:	0f b7 d0             	movzx  edx,ax
    1978:	48 89 d0             	mov    rax,rdx
    197b:	48 01 c0             	add    rax,rax
    197e:	48 01 d0             	add    rax,rdx
    1981:	48 c1 e0 04          	shl    rax,0x4
    1985:	48 89 c2             	mov    rdx,rax
    1988:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    198c:	48 01 d0             	add    rax,rdx
    198f:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
    1993:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    return symaddr;
    1997:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
    199b:	5d                   	pop    rbp
    199c:	c3                   	ret    

000000000000199d <get_sym_plt>:
off_t get_sym_plt(unsigned long modid, unsigned long symi) {}
    199d:	f3 0f 1e fa          	endbr64 
    19a1:	55                   	push   rbp
    19a2:	48 89 e5             	mov    rbp,rsp
    19a5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    19a9:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    19ad:	90                   	nop
    19ae:	5d                   	pop    rbp
    19af:	c3                   	ret    

00000000000019b0 <get_load_base>:
off_t get_load_base(unsigned long modid)
{
    19b0:	f3 0f 1e fa          	endbr64 
    19b4:	55                   	push   rbp
    19b5:	48 89 e5             	mov    rbp,rsp
    19b8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return modules[modid].base;
    19bc:	48 8b 0d 2d 26 00 00 	mov    rcx,QWORD PTR [rip+0x262d]        # 3ff0 <modules-0x90>
    19c3:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    19c7:	48 89 d0             	mov    rax,rdx
    19ca:	48 c1 e0 03          	shl    rax,0x3
    19ce:	48 29 d0             	sub    rax,rdx
    19d1:	48 c1 e0 03          	shl    rax,0x3
    19d5:	48 01 c8             	add    rax,rcx
    19d8:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
    19db:	5d                   	pop    rbp
    19dc:	c3                   	ret    

00000000000019dd <get_got>:
off_t get_got(unsigned long modid)
{
    19dd:	f3 0f 1e fa          	endbr64 
    19e1:	55                   	push   rbp
    19e2:	48 89 e5             	mov    rbp,rsp
    19e5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return modules[modid].p_got;
    19e9:	48 8b 0d 00 26 00 00 	mov    rcx,QWORD PTR [rip+0x2600]        # 3ff0 <modules-0x90>
    19f0:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    19f4:	48 89 d0             	mov    rax,rdx
    19f7:	48 c1 e0 03          	shl    rax,0x3
    19fb:	48 29 d0             	sub    rax,rdx
    19fe:	48 c1 e0 03          	shl    rax,0x3
    1a02:	48 01 c8             	add    rax,rcx
    1a05:	48 83 c0 30          	add    rax,0x30
    1a09:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
    1a0c:	5d                   	pop    rbp
    1a0d:	c3                   	ret    

0000000000001a0e <dl_runtime_resolve>:
void dl_runtime_resolve()
{
    1a0e:	f3 0f 1e fa          	endbr64 
    1a12:	55                   	push   rbp
    1a13:	48 89 e5             	mov    rbp,rsp
    1a16:	48 83 ec 30          	sub    rsp,0x30
    //获取modid
    unsigned long modid, rel_offset;
    __asm__ volatile("push %%rax\n mov 8(%%rsp),%%rax\n mov %%rax,%0" : "=m"(modid));
    1a1a:	50                   	push   rax
    1a1b:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
    1a20:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    __asm__ volatile("push %%rax\n mov 16(%%rsp),%%rax\n mov %%rax,%0" : "=m"(rel_offset));
    1a24:	50                   	push   rax
    1a25:	48 8b 44 24 10       	mov    rax,QWORD PTR [rsp+0x10]
    1a2a:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    Elf64_Rel* rel  = rel_offset;
    1a2e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    1a32:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int        symi = ELF64_R_SYM(rel->r_info), type = ELF64_R_TYPE(rel->r_info);
    1a36:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1a3a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
    1a3d:	ba 20 00 00 00       	mov    edx,0x20
    1a42:	89 d1                	mov    ecx,edx
    1a44:	d3 e8                	shr    eax,cl
    1a46:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    1a49:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1a4d:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
    1a50:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    off_t      sym_off = get_sym_addr(modid, symi);
    1a53:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1a56:	48 63 d0             	movsxd rdx,eax
    1a59:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1a5d:	48 89 d6             	mov    rsi,rdx
    1a60:	48 89 c7             	mov    rdi,rax
    1a63:	e8 38 f6 ff ff       	call   10a0 <get_sym_addr@plt>
    1a68:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //这里假定获取符号的地址是正确的，可以不修改符号表，而是通过记录模块整体加载地址，
    //来加上偏移量获取正确的符号地址
    off_t* v_rel = rel->r_offset;
    1a6c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1a70:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1a73:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    switch (type) {
    1a77:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    1a7a:	83 e8 03             	sub    eax,0x3
    1a7d:	83 f8 07             	cmp    eax,0x7
    1a80:	0f 87 e2 00 00 00    	ja     1b68 <dl_runtime_resolve+0x15a>
    1a86:	89 c0                	mov    eax,eax
    1a88:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    1a8f:	00 
    1a90:	48 8d 05 d9 05 00 00 	lea    rax,[rip+0x5d9]        # 2070 <sbrk+0x2c0>
    1a97:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    1a9a:	48 98                	cdqe   
    1a9c:	48 8d 15 cd 05 00 00 	lea    rdx,[rip+0x5cd]        # 2070 <sbrk+0x2c0>
    1aa3:	48 01 d0             	add    rax,rdx
    1aa6:	3e ff e0             	notrack jmp rax
    case R_X86_64_GLOB_DAT:
    case R_X86_64_JUMP_SLOT: *v_rel = sym_off; break;
    1aa9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1aad:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    1ab1:	48 89 10             	mov    QWORD PTR [rax],rdx
    1ab4:	e9 b0 00 00 00       	jmp    1b69 <dl_runtime_resolve+0x15b>
    case R_X86_64_PLT32: *v_rel = get_sym_plt(modid, symi); break;
    1ab9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1abc:	48 63 d0             	movsxd rdx,eax
    1abf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1ac3:	48 89 d6             	mov    rsi,rdx
    1ac6:	48 89 c7             	mov    rdi,rax
    1ac9:	e8 62 f5 ff ff       	call   1030 <get_sym_plt@plt>
    1ace:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    1ad2:	48 89 02             	mov    QWORD PTR [rdx],rax
    1ad5:	e9 8f 00 00 00       	jmp    1b69 <dl_runtime_resolve+0x15b>
    case R_X86_64_RELATIVE: *v_rel += get_load_base(modid); break;
    1ada:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1ade:	48 89 c7             	mov    rdi,rax
    1ae1:	e8 9a f5 ff ff       	call   1080 <get_load_base@plt>
    1ae6:	48 89 c2             	mov    rdx,rax
    1ae9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1aed:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1af0:	48 01 c2             	add    rdx,rax
    1af3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1af7:	48 89 10             	mov    QWORD PTR [rax],rdx
    1afa:	eb 6d                	jmp    1b69 <dl_runtime_resolve+0x15b>
    case R_X86_64_GOTOFF: *v_rel += sym_off - get_got(modid); break;
    1afc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1b00:	48 89 c7             	mov    rdi,rax
    1b03:	e8 08 f5 ff ff       	call   1010 <get_got@plt>
    1b08:	48 89 c2             	mov    rdx,rax
    1b0b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1b0f:	48 29 d0             	sub    rax,rdx
    1b12:	48 89 c1             	mov    rcx,rax
    1b15:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b19:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1b1c:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
    1b20:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b24:	48 89 10             	mov    QWORD PTR [rax],rdx
    1b27:	eb 40                	jmp    1b69 <dl_runtime_resolve+0x15b>
    case R_X86_64_GOTPC: *v_rel += get_got(modid) - rel_offset; break;
    1b29:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    1b2d:	48 89 c7             	mov    rdi,rax
    1b30:	e8 db f4 ff ff       	call   1010 <get_got@plt>
    1b35:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    1b39:	48 29 d0             	sub    rax,rdx
    1b3c:	48 89 c1             	mov    rcx,rax
    1b3f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b43:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1b46:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
    1b4a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b4e:	48 89 10             	mov    QWORD PTR [rax],rdx
    1b51:	eb 16                	jmp    1b69 <dl_runtime_resolve+0x15b>
    case R_X86_64_GOT32:
        //这一项,rel里面指向的符号的地址就是got
        *v_rel += sym_off;
    1b53:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b57:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    1b5a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1b5e:	48 01 c2             	add    rdx,rax
    1b61:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b65:	48 89 10             	mov    QWORD PTR [rax],rdx
    default: break;
    1b68:	90                   	nop
    }
    //重定位完毕，直接返回到目标地址

    __asm__ volatile("mov %0,%%rax\n mov %%rax,0(%%rsp)" ::"m"(*v_rel));
    1b69:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b6d:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1b70:	48 89 04 24          	mov    QWORD PTR [rsp],rax
    1b74:	90                   	nop
    1b75:	c9                   	leave  
    1b76:	c3                   	ret    
    1b77:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    1b7e:	00 00 

0000000000001b80 <reg_dev>:
    1b80:	55                   	push   rbp
    1b81:	48 89 e5             	mov    rbp,rsp
    1b84:	b8 00 00 00 00       	mov    eax,0x0
    1b89:	55                   	push   rbp
    1b8a:	48 0f 05             	rex.W syscall 
    1b8d:	5d                   	pop    rbp
    1b8e:	c9                   	leave  
    1b8f:	c3                   	ret    

0000000000001b90 <dispose_dev>:
    1b90:	55                   	push   rbp
    1b91:	48 89 e5             	mov    rbp,rsp
    1b94:	b8 01 00 00 00       	mov    eax,0x1
    1b99:	55                   	push   rbp
    1b9a:	48 0f 05             	rex.W syscall 
    1b9d:	5d                   	pop    rbp
    1b9e:	c9                   	leave  
    1b9f:	c3                   	ret    

0000000000001ba0 <reg_drv>:
    1ba0:	55                   	push   rbp
    1ba1:	48 89 e5             	mov    rbp,rsp
    1ba4:	b8 02 00 00 00       	mov    eax,0x2
    1ba9:	55                   	push   rbp
    1baa:	48 0f 05             	rex.W syscall 
    1bad:	5d                   	pop    rbp
    1bae:	c9                   	leave  
    1baf:	c3                   	ret    

0000000000001bb0 <dispose_drv>:
    1bb0:	55                   	push   rbp
    1bb1:	48 89 e5             	mov    rbp,rsp
    1bb4:	b8 03 00 00 00       	mov    eax,0x3
    1bb9:	55                   	push   rbp
    1bba:	48 0f 05             	rex.W syscall 
    1bbd:	5d                   	pop    rbp
    1bbe:	c9                   	leave  
    1bbf:	c3                   	ret    

0000000000001bc0 <call_drvfunc>:
    1bc0:	55                   	push   rbp
    1bc1:	48 89 e5             	mov    rbp,rsp
    1bc4:	b8 04 00 00 00       	mov    eax,0x4
    1bc9:	55                   	push   rbp
    1bca:	48 0f 05             	rex.W syscall 
    1bcd:	5d                   	pop    rbp
    1bce:	c9                   	leave  
    1bcf:	c3                   	ret    

0000000000001bd0 <req_mem>:
    1bd0:	55                   	push   rbp
    1bd1:	48 89 e5             	mov    rbp,rsp
    1bd4:	b8 05 00 00 00       	mov    eax,0x5
    1bd9:	55                   	push   rbp
    1bda:	48 0f 05             	rex.W syscall 
    1bdd:	5d                   	pop    rbp
    1bde:	c9                   	leave  
    1bdf:	c3                   	ret    

0000000000001be0 <free_mem>:
    1be0:	55                   	push   rbp
    1be1:	48 89 e5             	mov    rbp,rsp
    1be4:	b8 06 00 00 00       	mov    eax,0x6
    1be9:	55                   	push   rbp
    1bea:	48 0f 05             	rex.W syscall 
    1bed:	5d                   	pop    rbp
    1bee:	c9                   	leave  
    1bef:	c3                   	ret    

0000000000001bf0 <reg_proc>:
    1bf0:	55                   	push   rbp
    1bf1:	48 89 e5             	mov    rbp,rsp
    1bf4:	b8 07 00 00 00       	mov    eax,0x7
    1bf9:	55                   	push   rbp
    1bfa:	48 0f 05             	rex.W syscall 
    1bfd:	5d                   	pop    rbp
    1bfe:	c9                   	leave  
    1bff:	c3                   	ret    

0000000000001c00 <del_proc>:
    1c00:	55                   	push   rbp
    1c01:	48 89 e5             	mov    rbp,rsp
    1c04:	b8 08 00 00 00       	mov    eax,0x8
    1c09:	55                   	push   rbp
    1c0a:	48 0f 05             	rex.W syscall 
    1c0d:	5d                   	pop    rbp
    1c0e:	c9                   	leave  
    1c0f:	c3                   	ret    

0000000000001c10 <get_proc_addr>:
    1c10:	55                   	push   rbp
    1c11:	48 89 e5             	mov    rbp,rsp
    1c14:	b8 09 00 00 00       	mov    eax,0x9
    1c19:	55                   	push   rbp
    1c1a:	48 0f 05             	rex.W syscall 
    1c1d:	5d                   	pop    rbp
    1c1e:	c9                   	leave  
    1c1f:	c3                   	ret    

0000000000001c20 <chk_vm>:
    1c20:	55                   	push   rbp
    1c21:	48 89 e5             	mov    rbp,rsp
    1c24:	b8 0a 00 00 00       	mov    eax,0xa
    1c29:	55                   	push   rbp
    1c2a:	48 0f 05             	rex.W syscall 
    1c2d:	5d                   	pop    rbp
    1c2e:	c9                   	leave  
    1c2f:	c3                   	ret    

0000000000001c30 <open>:
    1c30:	55                   	push   rbp
    1c31:	48 89 e5             	mov    rbp,rsp
    1c34:	b8 0b 00 00 00       	mov    eax,0xb
    1c39:	55                   	push   rbp
    1c3a:	48 0f 05             	rex.W syscall 
    1c3d:	5d                   	pop    rbp
    1c3e:	c9                   	leave  
    1c3f:	c3                   	ret    

0000000000001c40 <close>:
    1c40:	55                   	push   rbp
    1c41:	48 89 e5             	mov    rbp,rsp
    1c44:	b8 0c 00 00 00       	mov    eax,0xc
    1c49:	55                   	push   rbp
    1c4a:	48 0f 05             	rex.W syscall 
    1c4d:	5d                   	pop    rbp
    1c4e:	c9                   	leave  
    1c4f:	c3                   	ret    

0000000000001c50 <read>:
    1c50:	55                   	push   rbp
    1c51:	48 89 e5             	mov    rbp,rsp
    1c54:	b8 0d 00 00 00       	mov    eax,0xd
    1c59:	55                   	push   rbp
    1c5a:	48 0f 05             	rex.W syscall 
    1c5d:	5d                   	pop    rbp
    1c5e:	c9                   	leave  
    1c5f:	c3                   	ret    

0000000000001c60 <write>:
    1c60:	55                   	push   rbp
    1c61:	48 89 e5             	mov    rbp,rsp
    1c64:	b8 0e 00 00 00       	mov    eax,0xe
    1c69:	55                   	push   rbp
    1c6a:	48 0f 05             	rex.W syscall 
    1c6d:	5d                   	pop    rbp
    1c6e:	c9                   	leave  
    1c6f:	c3                   	ret    

0000000000001c70 <seek>:
    1c70:	55                   	push   rbp
    1c71:	48 89 e5             	mov    rbp,rsp
    1c74:	b8 0f 00 00 00       	mov    eax,0xf
    1c79:	55                   	push   rbp
    1c7a:	48 0f 05             	rex.W syscall 
    1c7d:	5d                   	pop    rbp
    1c7e:	c9                   	leave  
    1c7f:	c3                   	ret    

0000000000001c80 <tell>:
    1c80:	55                   	push   rbp
    1c81:	48 89 e5             	mov    rbp,rsp
    1c84:	b8 10 00 00 00       	mov    eax,0x10
    1c89:	55                   	push   rbp
    1c8a:	48 0f 05             	rex.W syscall 
    1c8d:	5d                   	pop    rbp
    1c8e:	c9                   	leave  
    1c8f:	c3                   	ret    

0000000000001c90 <reg_vol>:
    1c90:	55                   	push   rbp
    1c91:	48 89 e5             	mov    rbp,rsp
    1c94:	b8 11 00 00 00       	mov    eax,0x11
    1c99:	55                   	push   rbp
    1c9a:	48 0f 05             	rex.W syscall 
    1c9d:	5d                   	pop    rbp
    1c9e:	c9                   	leave  
    1c9f:	c3                   	ret    

0000000000001ca0 <free_vol>:
    1ca0:	55                   	push   rbp
    1ca1:	48 89 e5             	mov    rbp,rsp
    1ca4:	b8 12 00 00 00       	mov    eax,0x12
    1ca9:	55                   	push   rbp
    1caa:	48 0f 05             	rex.W syscall 
    1cad:	5d                   	pop    rbp
    1cae:	c9                   	leave  
    1caf:	c3                   	ret    

0000000000001cb0 <exec>:
    1cb0:	55                   	push   rbp
    1cb1:	48 89 e5             	mov    rbp,rsp
    1cb4:	b8 13 00 00 00       	mov    eax,0x13
    1cb9:	55                   	push   rbp
    1cba:	48 0f 05             	rex.W syscall 
    1cbd:	5d                   	pop    rbp
    1cbe:	c9                   	leave  
    1cbf:	c3                   	ret    

0000000000001cc0 <exit>:
    1cc0:	55                   	push   rbp
    1cc1:	48 89 e5             	mov    rbp,rsp
    1cc4:	b8 14 00 00 00       	mov    eax,0x14
    1cc9:	55                   	push   rbp
    1cca:	48 0f 05             	rex.W syscall 
    1ccd:	5d                   	pop    rbp
    1cce:	c9                   	leave  
    1ccf:	c3                   	ret    

0000000000001cd0 <abort>:
    1cd0:	55                   	push   rbp
    1cd1:	48 89 e5             	mov    rbp,rsp
    1cd4:	b8 14 00 00 00       	mov    eax,0x14
    1cd9:	55                   	push   rbp
    1cda:	48 0f 05             	rex.W syscall 
    1cdd:	5d                   	pop    rbp
    1cde:	c9                   	leave  
    1cdf:	c3                   	ret    

0000000000001ce0 <call>:
    1ce0:	55                   	push   rbp
    1ce1:	48 89 e5             	mov    rbp,rsp
    1ce4:	b8 15 00 00 00       	mov    eax,0x15
    1ce9:	55                   	push   rbp
    1cea:	48 0f 05             	rex.W syscall 
    1ced:	5d                   	pop    rbp
    1cee:	c9                   	leave  
    1cef:	c3                   	ret    

0000000000001cf0 <mkfifo>:
    1cf0:	55                   	push   rbp
    1cf1:	48 89 e5             	mov    rbp,rsp
    1cf4:	b8 16 00 00 00       	mov    eax,0x16
    1cf9:	55                   	push   rbp
    1cfa:	48 0f 05             	rex.W syscall 
    1cfd:	5d                   	pop    rbp
    1cfe:	c9                   	leave  
    1cff:	c3                   	ret    

0000000000001d00 <brk>:
    1d00:	55                   	push   rbp
    1d01:	48 89 e5             	mov    rbp,rsp
    1d04:	b8 17 00 00 00       	mov    eax,0x17
    1d09:	55                   	push   rbp
    1d0a:	48 0f 05             	rex.W syscall 
    1d0d:	5d                   	pop    rbp
    1d0e:	c9                   	leave  
    1d0f:	c3                   	ret    

0000000000001d10 <find_dev>:
    1d10:	55                   	push   rbp
    1d11:	48 89 e5             	mov    rbp,rsp
    1d14:	b8 19 00 00 00       	mov    eax,0x19
    1d19:	55                   	push   rbp
    1d1a:	48 0f 05             	rex.W syscall 
    1d1d:	5d                   	pop    rbp
    1d1e:	c9                   	leave  
    1d1f:	c3                   	ret    

0000000000001d20 <operate_dev>:
    1d20:	55                   	push   rbp
    1d21:	48 89 e5             	mov    rbp,rsp
    1d24:	b8 1a 00 00 00       	mov    eax,0x1a
    1d29:	55                   	push   rbp
    1d2a:	48 0f 05             	rex.W syscall 
    1d2d:	5d                   	pop    rbp
    1d2e:	c9                   	leave  
    1d2f:	c3                   	ret    

0000000000001d30 <fork>:
    1d30:	55                   	push   rbp
    1d31:	48 89 e5             	mov    rbp,rsp
    1d34:	b8 1b 00 00 00       	mov    eax,0x1b
    1d39:	55                   	push   rbp
    1d3a:	48 0f 05             	rex.W syscall 
    1d3d:	5d                   	pop    rbp
    1d3e:	c9                   	leave  
    1d3f:	c3                   	ret    

0000000000001d40 <execve>:
    1d40:	55                   	push   rbp
    1d41:	48 89 e5             	mov    rbp,rsp
    1d44:	b8 1c 00 00 00       	mov    eax,0x1c
    1d49:	55                   	push   rbp
    1d4a:	48 0f 05             	rex.W syscall 
    1d4d:	5d                   	pop    rbp
    1d4e:	c9                   	leave  
    1d4f:	c3                   	ret    

0000000000001d50 <waitpid>:
    1d50:	55                   	push   rbp
    1d51:	48 89 e5             	mov    rbp,rsp
    1d54:	b8 1d 00 00 00       	mov    eax,0x1d
    1d59:	55                   	push   rbp
    1d5a:	48 0f 05             	rex.W syscall 
    1d5d:	5d                   	pop    rbp
    1d5e:	c9                   	leave  
    1d5f:	c3                   	ret    

0000000000001d60 <mmap>:
    1d60:	55                   	push   rbp
    1d61:	48 89 e5             	mov    rbp,rsp
    1d64:	b8 1e 00 00 00       	mov    eax,0x1e
    1d69:	55                   	push   rbp
    1d6a:	48 0f 05             	rex.W syscall 
    1d6d:	5d                   	pop    rbp
    1d6e:	c9                   	leave  
    1d6f:	c3                   	ret    

0000000000001d70 <munmap>:
    1d70:	55                   	push   rbp
    1d71:	48 89 e5             	mov    rbp,rsp
    1d74:	b8 1f 00 00 00       	mov    eax,0x1f
    1d79:	55                   	push   rbp
    1d7a:	48 0f 05             	rex.W syscall 
    1d7d:	5d                   	pop    rbp
    1d7e:	c9                   	leave  
    1d7f:	c3                   	ret    

0000000000001d80 <mknod>:
    1d80:	55                   	push   rbp
    1d81:	48 89 e5             	mov    rbp,rsp
    1d84:	b8 21 00 00 00       	mov    eax,0x21
    1d89:	55                   	push   rbp
    1d8a:	48 0f 05             	rex.W syscall 
    1d8d:	5d                   	pop    rbp
    1d8e:	c9                   	leave  
    1d8f:	c3                   	ret    

0000000000001d90 <kb_readc>:
    1d90:	55                   	push   rbp
    1d91:	48 89 e5             	mov    rbp,rsp
    1d94:	b8 64 00 00 00       	mov    eax,0x64
    1d99:	55                   	push   rbp
    1d9a:	48 0f 05             	rex.W syscall 
    1d9d:	5d                   	pop    rbp
    1d9e:	c9                   	leave  
    1d9f:	c3                   	ret    

0000000000001da0 <remove>:
    1da0:	55                   	push   rbp
    1da1:	48 89 e5             	mov    rbp,rsp
    1da4:	b8 22 00 00 00       	mov    eax,0x22
    1da9:	55                   	push   rbp
    1daa:	48 0f 05             	rex.W syscall 
    1dad:	5d                   	pop    rbp
    1dae:	c9                   	leave  
    1daf:	c3                   	ret    

0000000000001db0 <sbrk>:
    1db0:	55                   	push   rbp
    1db1:	48 89 e5             	mov    rbp,rsp
    1db4:	b8 23 00 00 00       	mov    eax,0x23
    1db9:	55                   	push   rbp
    1dba:	48 0f 05             	rex.W syscall 
    1dbd:	5d                   	pop    rbp
    1dbe:	c9                   	leave  
    1dbf:	c3                   	ret    
