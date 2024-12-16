
bin/dl.so:     file format elf64-x86-64


Disassembly of section .plt:

0000000000001000 <get_got@plt-0x10>:
    1000:	ff 35 02 50 00 00    	push   QWORD PTR [rip+0x5002]        # 6008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1006:	ff 25 04 50 00 00    	jmp    QWORD PTR [rip+0x5004]        # 6010 <_GLOBAL_OFFSET_TABLE_+0x10>
    100c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000001010 <get_got@plt>:
    1010:	ff 25 02 50 00 00    	jmp    QWORD PTR [rip+0x5002]        # 6018 <get_got+0x39f9>
    1016:	68 00 00 00 00       	push   0x0
    101b:	e9 e0 ff ff ff       	jmp    1000 <get_got@plt-0x10>

0000000000001020 <malloc@plt>:
    1020:	ff 25 fa 4f 00 00    	jmp    QWORD PTR [rip+0x4ffa]        # 6020 <malloc>
    1026:	68 01 00 00 00       	push   0x1
    102b:	e9 d0 ff ff ff       	jmp    1000 <get_got@plt-0x10>

0000000000001030 <fill_reloc@plt>:
    1030:	ff 25 f2 4f 00 00    	jmp    QWORD PTR [rip+0x4ff2]        # 6028 <fill_reloc+0x391f>
    1036:	68 02 00 00 00       	push   0x2
    103b:	e9 c0 ff ff ff       	jmp    1000 <get_got@plt-0x10>

0000000000001040 <mmap@plt>:
    1040:	ff 25 ea 4f 00 00    	jmp    QWORD PTR [rip+0x4fea]        # 6030 <mmap+0x2e90>
    1046:	68 03 00 00 00       	push   0x3
    104b:	e9 b0 ff ff ff       	jmp    1000 <get_got@plt-0x10>

0000000000001050 <read@plt>:
    1050:	ff 25 e2 4f 00 00    	jmp    QWORD PTR [rip+0x4fe2]        # 6038 <read+0x2fa8>
    1056:	68 04 00 00 00       	push   0x4
    105b:	e9 a0 ff ff ff       	jmp    1000 <get_got@plt-0x10>

0000000000001060 <dlstrcmp@plt>:
    1060:	ff 25 da 4f 00 00    	jmp    QWORD PTR [rip+0x4fda]        # 6040 <dlstrcmp+0x3ab8>
    1066:	68 05 00 00 00       	push   0x5
    106b:	e9 90 ff ff ff       	jmp    1000 <get_got@plt-0x10>

0000000000001070 <seek@plt>:
    1070:	ff 25 d2 4f 00 00    	jmp    QWORD PTR [rip+0x4fd2]        # 6048 <seek+0x2f98>
    1076:	68 06 00 00 00       	push   0x6
    107b:	e9 80 ff ff ff       	jmp    1000 <get_got@plt-0x10>

0000000000001080 <get_load_base@plt>:
    1080:	ff 25 ca 4f 00 00    	jmp    QWORD PTR [rip+0x4fca]        # 6050 <get_load_base+0x3a5d>
    1086:	68 07 00 00 00       	push   0x7
    108b:	e9 70 ff ff ff       	jmp    1000 <get_got@plt-0x10>

0000000000001090 <load_elfso@plt>:
    1090:	ff 25 c2 4f 00 00    	jmp    QWORD PTR [rip+0x4fc2]        # 6058 <load_elfso+0x4897>
    1096:	68 08 00 00 00       	push   0x8
    109b:	e9 60 ff ff ff       	jmp    1000 <get_got@plt-0x10>

00000000000010a0 <chkmmap@plt>:
    10a0:	ff 25 ba 4f 00 00    	jmp    QWORD PTR [rip+0x4fba]        # 6060 <chkmmap+0x2e60>
    10a6:	68 09 00 00 00       	push   0x9
    10ab:	e9 50 ff ff ff       	jmp    1000 <get_got@plt-0x10>

00000000000010b0 <open@plt>:
    10b0:	ff 25 b2 4f 00 00    	jmp    QWORD PTR [rip+0x4fb2]        # 6068 <open+0x2ff8>
    10b6:	68 0a 00 00 00       	push   0xa
    10bb:	e9 40 ff ff ff       	jmp    1000 <get_got@plt-0x10>

00000000000010c0 <close@plt>:
    10c0:	ff 25 aa 4f 00 00    	jmp    QWORD PTR [rip+0x4faa]        # 6070 <close+0x2ff0>
    10c6:	68 0b 00 00 00       	push   0xb
    10cb:	e9 30 ff ff ff       	jmp    1000 <get_got@plt-0x10>

00000000000010d0 <free@plt>:
    10d0:	ff 25 a2 4f 00 00    	jmp    QWORD PTR [rip+0x4fa2]        # 6078 <free>
    10d6:	68 0c 00 00 00       	push   0xc
    10db:	e9 20 ff ff ff       	jmp    1000 <get_got@plt-0x10>

Disassembly of section .text:

00000000000010e0 <get_modid>:
extern char _GLOBAL_OFFSET_TABLE_[];
void*       symtabs[MAX_SYMTABS] = {0};
module      modules[MAX_MODULES];
int         dlid;
id_t        get_modid(void)
{
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	55                   	push   rbp
    10e5:	48 89 e5             	mov    rbp,rsp
    static id_t modid_d = 0;
    return modid_d++;
    10e8:	8b 05 f2 80 00 00    	mov    eax,DWORD PTR [rip+0x80f2]        # 91e0 <modid_d.0>
    10ee:	8d 50 01             	lea    edx,[rax+0x1]
    10f1:	89 15 e9 80 00 00    	mov    DWORD PTR [rip+0x80e9],edx        # 91e0 <modid_d.0>
}
    10f7:	5d                   	pop    rbp
    10f8:	c3                   	ret    

00000000000010f9 <dlmain>:
int dlmain(int fno, void* load_offset, int argc, char** argv, char** environ)
{
    10f9:	f3 0f 1e fa          	endbr64 
    10fd:	55                   	push   rbp
    10fe:	48 89 e5             	mov    rbp,rsp
    1101:	48 83 ec 30          	sub    rsp,0x30
    1105:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    1108:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    110c:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    110f:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    1113:	4c 89 45 d0          	mov    QWORD PTR [rbp-0x30],r8
    //完成自我重定位（自举）
    dlid = dl_init(load_offset);
    1117:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    111b:	48 89 c7             	mov    rdi,rax
    111e:	e8 63 18 00 00       	call   2986 <dl_init>
    1123:	48 8b 15 be 4e 00 00 	mov    rdx,QWORD PTR [rip+0x4ebe]        # 5fe8 <dlid-0x3198>
    112a:	89 02                	mov    DWORD PTR [rdx],eax

    //加载elf文件
    //读取文件头

    //递归加载elf和so
    off_t entry = load_elfso(fno);
    112c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    112f:	89 c7                	mov    edi,eax
    1131:	e8 5a ff ff ff       	call   1090 <load_elfso@plt>
    1136:	48 98                	cdqe   
    1138:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    close(fno);
    113c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    113f:	89 c7                	mov    edi,eax
    1141:	e8 7a ff ff ff       	call   10c0 <close@plt>
    //跳转到程序入口
    int (*main)(int, char**, char**) = entry;
    1146:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    114a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    main(argc, argv, environ);
    114e:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    1152:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
    1156:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
    1159:	4c 8b 45 f0          	mov    r8,QWORD PTR [rbp-0x10]
    115d:	48 89 ce             	mov    rsi,rcx
    1160:	89 c7                	mov    edi,eax
    1162:	41 ff d0             	call   r8
    return 0;
    1165:	b8 00 00 00 00       	mov    eax,0x0
}
    116a:	c9                   	leave  
    116b:	c3                   	ret    

000000000000116c <load_elfso_old>:
int load_elfso_old(int fno)
{
    116c:	f3 0f 1e fa          	endbr64 
    1170:	55                   	push   rbp
    1171:	48 89 e5             	mov    rbp,rsp
    1174:	48 81 ec 30 01 00 00 	sub    rsp,0x130
    117b:	89 bd dc fe ff ff    	mov    DWORD PTR [rbp-0x124],edi
    // 读取文件头
    Elf64_Ehdr ehdr;
    //读取文件头
    read(fno, &ehdr, sizeof(ehdr));
    1181:	48 8d 8d e0 fe ff ff 	lea    rcx,[rbp-0x120]
    1188:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    118e:	ba 40 00 00 00       	mov    edx,0x40
    1193:	48 89 ce             	mov    rsi,rcx
    1196:	89 c7                	mov    edi,eax
    1198:	e8 b3 fe ff ff       	call   1050 <read@plt>

    unsigned short entn = ehdr.e_phnum;
    119d:	0f b7 85 18 ff ff ff 	movzx  eax,WORD PTR [rbp-0xe8]
    11a4:	66 89 45 86          	mov    WORD PTR [rbp-0x7a],ax
    unsigned short ents = ehdr.e_phentsize;
    11a8:	0f b7 85 16 ff ff ff 	movzx  eax,WORD PTR [rbp-0xea]
    11af:	66 89 45 84          	mov    WORD PTR [rbp-0x7c],ax
    module*        mod  = 0;
    11b3:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    11ba:	00 
    // module项设置
    //注册自己
    for (int i = 0; i < MAX_MODULES; i++) {
    11bb:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    11c2:	e9 d1 00 00 00       	jmp    1298 <load_elfso_old+0x12c>
        if (modules[i].type == ET_NONE) {
    11c7:	48 8b 0d 12 4e 00 00 	mov    rcx,QWORD PTR [rip+0x4e12]        # 5fe0 <modules-0x1a0>
    11ce:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    11d1:	48 63 d0             	movsxd rdx,eax
    11d4:	48 89 d0             	mov    rax,rdx
    11d7:	48 01 c0             	add    rax,rax
    11da:	48 01 d0             	add    rax,rdx
    11dd:	48 c1 e0 05          	shl    rax,0x5
    11e1:	48 01 c8             	add    rax,rcx
    11e4:	48 83 c0 18          	add    rax,0x18
    11e8:	48 8b 00             	mov    rax,QWORD PTR [rax]
    11eb:	48 85 c0             	test   rax,rax
    11ee:	0f 85 a0 00 00 00    	jne    1294 <load_elfso_old+0x128>
            modules[i].type        = ehdr.e_type;
    11f4:	0f b7 85 f0 fe ff ff 	movzx  eax,WORD PTR [rbp-0x110]
    11fb:	0f b7 d0             	movzx  edx,ax
    11fe:	48 8b 35 db 4d 00 00 	mov    rsi,QWORD PTR [rip+0x4ddb]        # 5fe0 <modules-0x1a0>
    1205:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1208:	48 63 c8             	movsxd rcx,eax
    120b:	48 89 c8             	mov    rax,rcx
    120e:	48 01 c0             	add    rax,rax
    1211:	48 01 c8             	add    rax,rcx
    1214:	48 c1 e0 05          	shl    rax,0x5
    1218:	48 01 f0             	add    rax,rsi
    121b:	48 83 c0 18          	add    rax,0x18
    121f:	48 89 10             	mov    QWORD PTR [rax],rdx
            modules[i].load_offset = 0;
    1222:	48 8b 0d b7 4d 00 00 	mov    rcx,QWORD PTR [rip+0x4db7]        # 5fe0 <modules-0x1a0>
    1229:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    122c:	48 63 d0             	movsxd rdx,eax
    122f:	48 89 d0             	mov    rax,rdx
    1232:	48 01 c0             	add    rax,rax
    1235:	48 01 d0             	add    rax,rdx
    1238:	48 c1 e0 05          	shl    rax,0x5
    123c:	48 01 c8             	add    rax,rcx
    123f:	48 83 c0 08          	add    rax,0x8
    1243:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            modules[i].base        = 0;
    124a:	48 8b 0d 8f 4d 00 00 	mov    rcx,QWORD PTR [rip+0x4d8f]        # 5fe0 <modules-0x1a0>
    1251:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1254:	48 63 d0             	movsxd rdx,eax
    1257:	48 89 d0             	mov    rax,rdx
    125a:	48 01 c0             	add    rax,rax
    125d:	48 01 d0             	add    rax,rdx
    1260:	48 c1 e0 05          	shl    rax,0x5
    1264:	48 01 c8             	add    rax,rcx
    1267:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            mod                    = modules + i;
    126e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1271:	48 63 d0             	movsxd rdx,eax
    1274:	48 89 d0             	mov    rax,rdx
    1277:	48 01 c0             	add    rax,rax
    127a:	48 01 d0             	add    rax,rdx
    127d:	48 c1 e0 05          	shl    rax,0x5
    1281:	48 89 c2             	mov    rdx,rax
    1284:	48 8b 05 55 4d 00 00 	mov    rax,QWORD PTR [rip+0x4d55]        # 5fe0 <modules-0x1a0>
    128b:	48 01 d0             	add    rax,rdx
    128e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
            break;
    1292:	eb 0e                	jmp    12a2 <load_elfso_old+0x136>
    for (int i = 0; i < MAX_MODULES; i++) {
    1294:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
    1298:	83 7d f4 7f          	cmp    DWORD PTR [rbp-0xc],0x7f
    129c:	0f 8e 25 ff ff ff    	jle    11c7 <load_elfso_old+0x5b>
        }
    }
    //需要malloc一块内存
    Elf64_Phdr* ph = malloc(entn * ents);   //(Elf64_Phdr *) (tmpla + ehdr.e_phoff);
    12a2:	0f b7 55 86          	movzx  edx,WORD PTR [rbp-0x7a]
    12a6:	0f b7 45 84          	movzx  eax,WORD PTR [rbp-0x7c]
    12aa:	0f af c2             	imul   eax,edx
    12ad:	48 98                	cdqe   
    12af:	48 89 c7             	mov    rdi,rax
    12b2:	e8 69 fd ff ff       	call   1020 <malloc@plt>
    12b7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    seek(fno, ehdr.e_phoff, SEEK_SET);
    12bb:	48 8b 8d 00 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x100]
    12c2:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    12c8:	ba 00 00 00 00       	mov    edx,0x0
    12cd:	48 89 ce             	mov    rsi,rcx
    12d0:	89 c7                	mov    edi,eax
    12d2:	b8 00 00 00 00       	mov    eax,0x0
    12d7:	e8 94 fd ff ff       	call   1070 <seek@plt>
    read(fno, ph, entn * ents);
    12dc:	0f b7 55 86          	movzx  edx,WORD PTR [rbp-0x7a]
    12e0:	0f b7 45 84          	movzx  eax,WORD PTR [rbp-0x7c]
    12e4:	0f af c2             	imul   eax,edx
    12e7:	48 63 d0             	movsxd rdx,eax
    12ea:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
    12ee:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    12f4:	48 89 ce             	mov    rsi,rcx
    12f7:	89 c7                	mov    edi,eax
    12f9:	e8 52 fd ff ff       	call   1050 <read@plt>
    size_t tot_sz = 0;
    12fe:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
    1305:	00 00 00 00 
    off_t  base = ph->p_vaddr, offset = 0;
    1309:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    130d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    1311:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    1318:	48 c7 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],0x0
    131f:	00 00 00 00 
    int (**init)() = 0, init_arraysz = 0;
    1323:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    132a:	00 
    132b:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0

    for (int i = 0; i < entn; i++) {
    1332:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [rbp-0x28],0x0
    1339:	e9 ca 00 00 00       	jmp    1408 <load_elfso_old+0x29c>
        //加载段
        if ((ph->p_type | PT_LOAD) != 0) {
            unsigned long off  = ph->p_offset;
    133e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1342:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1346:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
            unsigned long fs   = ph->p_filesz;
    134d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1351:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    1355:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            size_t        ms   = ph->p_memsz;
    135c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1360:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    1364:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            char*         vptr = (char*)ph->p_vaddr + offset;
    136b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    136f:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    1373:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    137a:	48 01 d0             	add    rax,rdx
    137d:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            if (off == 0) {
    1384:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
    138b:	00 
    138c:	75 0f                	jne    139d <load_elfso_old+0x231>
                mod->header = vptr;
    138e:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
    1395:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1399:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
            }
            //先映射好内存
            int prot = PROT_READ;
    139d:	c7 85 24 ff ff ff 01 	mov    DWORD PTR [rbp-0xdc],0x1
    13a4:	00 00 00 
            if ((ph->p_flags | PF_X))
                prot |= PROT_EXEC;
    13a7:	83 8d 24 ff ff ff 04 	or     DWORD PTR [rbp-0xdc],0x4
            if ((ph->p_flags | PF_W))
                prot |= PROT_WRITE;
    13ae:	83 8d 24 ff ff ff 02 	or     DWORD PTR [rbp-0xdc],0x2
            int flags = MAP_PRIVATE;
    13b5:	c7 45 d4 02 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x2
            if (ehdr.e_type == ET_EXEC)
    13bc:	0f b7 85 f0 fe ff ff 	movzx  eax,WORD PTR [rbp-0x110]
    13c3:	66 83 f8 02          	cmp    ax,0x2
    13c7:	75 04                	jne    13cd <load_elfso_old+0x261>
                flags |= MAP_FIXED;
    13c9:	83 4d d4 01          	or     DWORD PTR [rbp-0x2c],0x1
            mmap(vptr, fs, prot, flags, fno, off);
    13cd:	4c 8b 85 40 ff ff ff 	mov    r8,QWORD PTR [rbp-0xc0]
    13d4:	8b bd dc fe ff ff    	mov    edi,DWORD PTR [rbp-0x124]
    13da:	8b 4d d4             	mov    ecx,DWORD PTR [rbp-0x2c]
    13dd:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
    13e3:	48 8b b5 38 ff ff ff 	mov    rsi,QWORD PTR [rbp-0xc8]
    13ea:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    13f1:	4d 89 c1             	mov    r9,r8
    13f4:	41 89 f8             	mov    r8d,edi
    13f7:	48 89 c7             	mov    rdi,rax
    13fa:	e8 41 fc ff ff       	call   1040 <mmap@plt>
        }
        ph++;
    13ff:	48 83 45 e8 38       	add    QWORD PTR [rbp-0x18],0x38
    for (int i = 0; i < entn; i++) {
    1404:	83 45 d8 01          	add    DWORD PTR [rbp-0x28],0x1
    1408:	0f b7 45 86          	movzx  eax,WORD PTR [rbp-0x7a]
    140c:	39 45 d8             	cmp    DWORD PTR [rbp-0x28],eax
    140f:	0f 8c 29 ff ff ff    	jl     133e <load_elfso_old+0x1d2>
    }

    Elf64_Dyn* dynamic = 0;
    1415:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
    141c:	00 
    //寻找dynamic段
    struct Elf64_Shdr* shdr =
        mmap(0, ehdr.e_shentsize * ehdr.e_shnum, PROT_READ, MAP_PRIVATE, fno, ehdr.e_shoff);
    141d:	48 8b 8d 08 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xf8]
    1424:	0f b7 85 1a ff ff ff 	movzx  eax,WORD PTR [rbp-0xe6]
    142b:	0f b7 d0             	movzx  edx,ax
    142e:	0f b7 85 1c ff ff ff 	movzx  eax,WORD PTR [rbp-0xe4]
    1435:	0f b7 c0             	movzx  eax,ax
    1438:	0f af c2             	imul   eax,edx
    143b:	48 98                	cdqe   
    143d:	8b 95 dc fe ff ff    	mov    edx,DWORD PTR [rbp-0x124]
    1443:	49 89 c9             	mov    r9,rcx
    1446:	41 89 d0             	mov    r8d,edx
    1449:	b9 02 00 00 00       	mov    ecx,0x2
    144e:	ba 01 00 00 00       	mov    edx,0x1
    1453:	48 89 c6             	mov    rsi,rax
    1456:	bf 00 00 00 00       	mov    edi,0x0
    145b:	e8 e0 fb ff ff       	call   1040 <mmap@plt>
    1460:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    mod->p_shdrs = shdr;
    1467:	48 8b 95 60 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xa0]
    146e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1472:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
    for (int i = 0; i < ehdr.e_shnum; i++) {
    1476:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
    147d:	eb 3e                	jmp    14bd <load_elfso_old+0x351>
        if (shdr[i].sh_type == SHT_DYNAMIC) {
    147f:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    1482:	48 98                	cdqe   
    1484:	48 c1 e0 06          	shl    rax,0x6
    1488:	48 89 c2             	mov    rdx,rax
    148b:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    1492:	48 01 d0             	add    rax,rdx
    1495:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1498:	83 f8 06             	cmp    eax,0x6
    149b:	75 1c                	jne    14b9 <load_elfso_old+0x34d>
            dynamic = shdr + i;
    149d:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    14a0:	48 98                	cdqe   
    14a2:	48 c1 e0 06          	shl    rax,0x6
    14a6:	48 89 c2             	mov    rdx,rax
    14a9:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    14b0:	48 01 d0             	add    rax,rdx
    14b3:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            break;
    14b7:	eb 13                	jmp    14cc <load_elfso_old+0x360>
    for (int i = 0; i < ehdr.e_shnum; i++) {
    14b9:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
    14bd:	0f b7 85 1c ff ff ff 	movzx  eax,WORD PTR [rbp-0xe4]
    14c4:	0f b7 c0             	movzx  eax,ax
    14c7:	39 45 c4             	cmp    DWORD PTR [rbp-0x3c],eax
    14ca:	7c b3                	jl     147f <load_elfso_old+0x313>
        }
    }
    if (!dynamic)
        ;
    char*  dynstr = 0;
    14cc:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
    14d3:	00 
    off_t* got    = 0;
    14d4:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
    14db:	00 00 00 00 
    //这里一堆获取函数之后实现细节
    // dynstr=so_get_dynstr(dyn);
    // so_get_dynstr从so中获取.dynstr节
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    14df:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    14e3:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
    14e7:	eb 2a                	jmp    1513 <load_elfso_old+0x3a7>
        if (p->d_tag == DT_STRTAB) {
    14e9:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    14ed:	48 8b 00             	mov    rax,QWORD PTR [rax]
    14f0:	48 83 f8 05          	cmp    rax,0x5
    14f4:	75 18                	jne    150e <load_elfso_old+0x3a2>
            dynstr = p->d_un.d_ptr + offset;
    14f6:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    14fa:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    14fe:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    1505:	48 01 d0             	add    rax,rdx
    1508:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
            break;
    150c:	eb 11                	jmp    151f <load_elfso_old+0x3b3>
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    150e:	48 83 45 b0 10       	add    QWORD PTR [rbp-0x50],0x10
    1513:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    1517:	48 8b 00             	mov    rax,QWORD PTR [rax]
    151a:	48 85 c0             	test   rax,rax
    151d:	75 ca                	jne    14e9 <load_elfso_old+0x37d>
        }
    }

    size_t relsz = 0, relentsz = 0;
    151f:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
    1526:	00 
    1527:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    152e:	00 
    off_t  relptr = 0;
    152f:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    1536:	00 
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    1537:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    153b:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    153f:	e9 1d 02 00 00       	jmp    1761 <load_elfso_old+0x5f5>
        switch (p->d_tag) {
    1544:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1548:	48 8b 00             	mov    rax,QWORD PTR [rax]
    154b:	48 83 f8 1b          	cmp    rax,0x1b
    154f:	0f 87 4d 01 00 00    	ja     16a2 <load_elfso_old+0x536>
    1555:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    155c:	00 
    155d:	48 8d 05 9c 2a 00 00 	lea    rax,[rip+0x2a9c]        # 4000 <chkmmap+0xe00>
    1564:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    1567:	48 98                	cdqe   
    1569:	48 8d 15 90 2a 00 00 	lea    rdx,[rip+0x2a90]        # 4000 <chkmmap+0xe00>
    1570:	48 01 d0             	add    rax,rdx
    1573:	3e ff e0             	notrack jmp rax
        case DT_NEEDED:
            char* pathname = p->d_un.d_val + dynstr;
    1576:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    157a:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    157e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    1582:	48 01 d0             	add    rax,rdx
    1585:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
            int   so_fno   = open(pathname, O_EXEC);
    158c:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
    1593:	be 00 10 00 00       	mov    esi,0x1000
    1598:	48 89 c7             	mov    rdi,rax
    159b:	e8 10 fb ff ff       	call   10b0 <open@plt>
    15a0:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
            //不查错了
            load_elfso(open(pathname, O_EXEC));
    15a6:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
    15ad:	be 00 10 00 00       	mov    esi,0x1000
    15b2:	48 89 c7             	mov    rdi,rax
    15b5:	e8 f6 fa ff ff       	call   10b0 <open@plt>
    15ba:	89 c7                	mov    edi,eax
    15bc:	e8 cf fa ff ff       	call   1090 <load_elfso@plt>
            close(so_fno);
    15c1:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
    15c7:	89 c7                	mov    edi,eax
    15c9:	e8 f2 fa ff ff       	call   10c0 <close@plt>

            break;
    15ce:	e9 d0 00 00 00       	jmp    16a3 <load_elfso_old+0x537>
        case DT_PLTGOT:
            got = p->d_un.d_ptr + offset;
    15d3:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    15d7:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    15db:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    15e2:	48 01 d0             	add    rax,rdx
    15e5:	48 89 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rax

            //赋值为dl的运行时重定位函数
            got[2] = dl_runtime_resolve;
    15ec:	48 8b 85 58 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa8]
    15f3:	48 83 c0 10          	add    rax,0x10
    15f7:	48 8d 15 51 10 00 00 	lea    rdx,[rip+0x1051]        # 264f <dl_runtime_resolve>
    15fe:	48 89 10             	mov    QWORD PTR [rax],rdx
            //填入模块id
            got[1]     = mod - modules;
    1601:	48 8b 05 d8 49 00 00 	mov    rax,QWORD PTR [rip+0x49d8]        # 5fe0 <modules-0x1a0>
    1608:	48 89 c2             	mov    rdx,rax
    160b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    160f:	48 29 d0             	sub    rax,rdx
    1612:	48 c1 f8 05          	sar    rax,0x5
    1616:	48 89 c2             	mov    rdx,rax
    1619:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
    1620:	aa aa aa 
    1623:	48 0f af c2          	imul   rax,rdx
    1627:	48 89 c2             	mov    rdx,rax
    162a:	48 8b 85 58 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa8]
    1631:	48 83 c0 08          	add    rax,0x8
    1635:	48 89 10             	mov    QWORD PTR [rax],rdx
            mod->p_got = got;
    1638:	48 8b 95 58 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xa8]
    163f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1643:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
        case DT_SYMTAB: mod->p_symbol = p->d_un.d_ptr; break;
    1647:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    164b:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    164f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1653:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    1657:	eb 4a                	jmp    16a3 <load_elfso_old+0x537>
        case DT_RELSZ:
        case DT_RELASZ: relsz = p->d_un.d_val; goto is_rel_prepared;
    1659:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    165d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1661:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    1665:	eb 41                	jmp    16a8 <load_elfso_old+0x53c>
        case DT_REL:
        case DT_RELA: relptr = p->d_un.d_ptr; goto is_rel_prepared;
    1667:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    166b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    166f:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    1673:	eb 33                	jmp    16a8 <load_elfso_old+0x53c>
        case DT_RELENT:
        case DT_RELAENT: relentsz = p->d_un.d_val; goto is_rel_prepared;
    1675:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1679:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    167d:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
    1681:	eb 25                	jmp    16a8 <load_elfso_old+0x53c>
        case DT_INIT_ARRAY: init = p->d_un.d_ptr; break;
    1683:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1687:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    168b:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    168f:	eb 12                	jmp    16a3 <load_elfso_old+0x537>
        case DT_INIT_ARRAYSZ: init_arraysz = p->d_un.d_val / 8; break;
    1691:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1695:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1699:	48 c1 e8 03          	shr    rax,0x3
    169d:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    16a0:	eb 01                	jmp    16a3 <load_elfso_old+0x537>
        default: break;
    16a2:	90                   	nop
        }
        continue;
    16a3:	e9 b4 00 00 00       	jmp    175c <load_elfso_old+0x5f0>
    is_rel_prepared:
        if (!(relsz && relentsz && relptr))
    16a8:	48 83 7d a8 00       	cmp    QWORD PTR [rbp-0x58],0x0
    16ad:	0f 84 a8 00 00 00    	je     175b <load_elfso_old+0x5ef>
    16b3:	48 83 7d a0 00       	cmp    QWORD PTR [rbp-0x60],0x0
    16b8:	0f 84 9d 00 00 00    	je     175b <load_elfso_old+0x5ef>
    16be:	48 83 7d 98 00       	cmp    QWORD PTR [rbp-0x68],0x0
    16c3:	0f 84 92 00 00 00    	je     175b <load_elfso_old+0x5ef>
            continue;
        for (int j = 0; j < relsz / relentsz; j++) {
    16c9:	c7 45 8c 00 00 00 00 	mov    DWORD PTR [rbp-0x74],0x0
    16d0:	eb 57                	jmp    1729 <load_elfso_old+0x5bd>
            fill_reloc(relptr + j * relentsz, mod - modules, shdr, 0);
    16d2:	48 8b 05 07 49 00 00 	mov    rax,QWORD PTR [rip+0x4907]        # 5fe0 <modules-0x1a0>
    16d9:	48 89 c2             	mov    rdx,rax
    16dc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    16e0:	48 29 d0             	sub    rax,rdx
    16e3:	48 c1 f8 05          	sar    rax,0x5
    16e7:	48 89 c2             	mov    rdx,rax
    16ea:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
    16f1:	aa aa aa 
    16f4:	48 0f af c2          	imul   rax,rdx
    16f8:	89 c6                	mov    esi,eax
    16fa:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    16fd:	48 98                	cdqe   
    16ff:	48 0f af 45 a0       	imul   rax,QWORD PTR [rbp-0x60]
    1704:	48 89 c2             	mov    rdx,rax
    1707:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
    170b:	48 01 d0             	add    rax,rdx
    170e:	48 89 c7             	mov    rdi,rax
    1711:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    1718:	b9 00 00 00 00       	mov    ecx,0x0
    171d:	48 89 c2             	mov    rdx,rax
    1720:	e8 0b f9 ff ff       	call   1030 <fill_reloc@plt>
        for (int j = 0; j < relsz / relentsz; j++) {
    1725:	83 45 8c 01          	add    DWORD PTR [rbp-0x74],0x1
    1729:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    172c:	48 63 c8             	movsxd rcx,eax
    172f:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
    1733:	ba 00 00 00 00       	mov    edx,0x0
    1738:	48 f7 75 a0          	div    QWORD PTR [rbp-0x60]
    173c:	48 39 c1             	cmp    rcx,rax
    173f:	72 91                	jb     16d2 <load_elfso_old+0x566>
        }
        relsz = relentsz = relptr = 0;
    1741:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    1748:	00 
    1749:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    1750:	00 
    1751:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    1755:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    1759:	eb 01                	jmp    175c <load_elfso_old+0x5f0>
            continue;
    175b:	90                   	nop
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    175c:	48 83 45 90 10       	add    QWORD PTR [rbp-0x70],0x10
    1761:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1765:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1768:	48 85 c0             	test   rax,rax
    176b:	0f 85 d3 fd ff ff    	jne    1544 <load_elfso_old+0x3d8>
    }
    if (init) {
    1771:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
    1776:	74 33                	je     17ab <load_elfso_old+0x63f>
        //调用模块入口函数
        for (int i = 0; i < init_arraysz; i++) {
    1778:	c7 45 88 00 00 00 00 	mov    DWORD PTR [rbp-0x78],0x0
    177f:	eb 22                	jmp    17a3 <load_elfso_old+0x637>
            (init[i])();
    1781:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    1784:	48 98                	cdqe   
    1786:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
    178d:	00 
    178e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1792:	48 01 d0             	add    rax,rdx
    1795:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    1798:	b8 00 00 00 00       	mov    eax,0x0
    179d:	ff d2                	call   rdx
        for (int i = 0; i < init_arraysz; i++) {
    179f:	83 45 88 01          	add    DWORD PTR [rbp-0x78],0x1
    17a3:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    17a6:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
    17a9:	7c d6                	jl     1781 <load_elfso_old+0x615>
        }
    }
    free(&ehdr);
    17ab:	48 8d 85 e0 fe ff ff 	lea    rax,[rbp-0x120]
    17b2:	48 89 c7             	mov    rdi,rax
    17b5:	e8 16 f9 ff ff       	call   10d0 <free@plt>
    return 0;
    17ba:	b8 00 00 00 00       	mov    eax,0x0
}
    17bf:	c9                   	leave  
    17c0:	c3                   	ret    

00000000000017c1 <load_elfso>:
Elf64_Ehdr ehdr;
//切换进程前,在execve系统调用中
int load_elfso(int fildes)
{
    17c1:	f3 0f 1e fa          	endbr64 
    17c5:	55                   	push   rbp
    17c6:	48 89 e5             	mov    rbp,rsp
    17c9:	48 81 ec 70 02 00 00 	sub    rsp,0x270
    17d0:	89 bd 9c fd ff ff    	mov    DWORD PTR [rbp-0x264],edi
    extern int chkmmap(off_t, size_t);
    extern int seek(int, off_t, int);
    read(fildes, &ehdr, sizeof(ehdr));
    17d6:	8b 85 9c fd ff ff    	mov    eax,DWORD PTR [rbp-0x264]
    17dc:	ba 40 00 00 00       	mov    edx,0x40
    17e1:	48 8b 0d 08 48 00 00 	mov    rcx,QWORD PTR [rip+0x4808]        # 5ff0 <ehdr-0x31b0>
    17e8:	48 89 ce             	mov    rsi,rcx
    17eb:	89 c7                	mov    edi,eax
    17ed:	e8 5e f8 ff ff       	call   1050 <read@plt>
    off_t          entry = ehdr.e_entry;
    17f2:	48 8b 05 f7 47 00 00 	mov    rax,QWORD PTR [rip+0x47f7]        # 5ff0 <ehdr-0x31b0>
    17f9:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
    17fd:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
    unsigned short entn  = ehdr.e_phnum;
    1804:	48 8b 05 e5 47 00 00 	mov    rax,QWORD PTR [rip+0x47e5]        # 5ff0 <ehdr-0x31b0>
    180b:	0f b7 40 38          	movzx  eax,WORD PTR [rax+0x38]
    180f:	66 89 85 0e ff ff ff 	mov    WORD PTR [rbp-0xf2],ax
    unsigned short ents  = ehdr.e_phentsize;
    1816:	48 8b 05 d3 47 00 00 	mov    rax,QWORD PTR [rip+0x47d3]        # 5ff0 <ehdr-0x31b0>
    181d:	0f b7 40 36          	movzx  eax,WORD PTR [rax+0x36]
    1821:	66 89 85 0c ff ff ff 	mov    WORD PTR [rbp-0xf4],ax
    off_t          shla  = malloc(ehdr.e_shnum * ehdr.e_shentsize);
    1828:	48 8b 05 c1 47 00 00 	mov    rax,QWORD PTR [rip+0x47c1]        # 5ff0 <ehdr-0x31b0>
    182f:	0f b7 40 3c          	movzx  eax,WORD PTR [rax+0x3c]
    1833:	0f b7 d0             	movzx  edx,ax
    1836:	48 8b 05 b3 47 00 00 	mov    rax,QWORD PTR [rip+0x47b3]        # 5ff0 <ehdr-0x31b0>
    183d:	0f b7 40 3a          	movzx  eax,WORD PTR [rax+0x3a]
    1841:	0f b7 c0             	movzx  eax,ax
    1844:	0f af c2             	imul   eax,edx
    1847:	48 98                	cdqe   
    1849:	48 89 c7             	mov    rdi,rax
    184c:	e8 cf f7 ff ff       	call   1020 <malloc@plt>
    1851:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
    seek(fildes, ehdr.e_shoff, SEEK_SET);
    1858:	48 8b 05 91 47 00 00 	mov    rax,QWORD PTR [rip+0x4791]        # 5ff0 <ehdr-0x31b0>
    185f:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
    1863:	8b 85 9c fd ff ff    	mov    eax,DWORD PTR [rbp-0x264]
    1869:	ba 00 00 00 00       	mov    edx,0x0
    186e:	48 89 ce             	mov    rsi,rcx
    1871:	89 c7                	mov    edi,eax
    1873:	e8 f8 f7 ff ff       	call   1070 <seek@plt>
    read(fildes, shla, ehdr.e_shnum * ehdr.e_shentsize);
    1878:	48 8b 05 71 47 00 00 	mov    rax,QWORD PTR [rip+0x4771]        # 5ff0 <ehdr-0x31b0>
    187f:	0f b7 40 3c          	movzx  eax,WORD PTR [rax+0x3c]
    1883:	0f b7 d0             	movzx  edx,ax
    1886:	48 8b 05 63 47 00 00 	mov    rax,QWORD PTR [rip+0x4763]        # 5ff0 <ehdr-0x31b0>
    188d:	0f b7 40 3a          	movzx  eax,WORD PTR [rax+0x3a]
    1891:	0f b7 c0             	movzx  eax,ax
    1894:	0f af c2             	imul   eax,edx
    1897:	48 63 d0             	movsxd rdx,eax
    189a:	48 8b 8d 00 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x100]
    18a1:	8b 85 9c fd ff ff    	mov    eax,DWORD PTR [rbp-0x264]
    18a7:	48 89 ce             	mov    rsi,rcx
    18aa:	89 c7                	mov    edi,eax
    18ac:	e8 9f f7 ff ff       	call   1050 <read@plt>

    struct Elf64_Shdr* sh = (struct Elf64_Shdr*)(shla);
    18b1:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
    18b8:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
    Elf64_Phdr*        ph = malloc(entn * ents);
    18bf:	0f b7 95 0e ff ff ff 	movzx  edx,WORD PTR [rbp-0xf2]
    18c6:	0f b7 85 0c ff ff ff 	movzx  eax,WORD PTR [rbp-0xf4]
    18cd:	0f af c2             	imul   eax,edx
    18d0:	48 98                	cdqe   
    18d2:	48 89 c7             	mov    rdi,rax
    18d5:	e8 46 f7 ff ff       	call   1020 <malloc@plt>
    18da:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    seek(fildes, ehdr.e_phoff, SEEK_SET);
    18de:	48 8b 05 0b 47 00 00 	mov    rax,QWORD PTR [rip+0x470b]        # 5ff0 <ehdr-0x31b0>
    18e5:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
    18e9:	8b 85 9c fd ff ff    	mov    eax,DWORD PTR [rbp-0x264]
    18ef:	ba 00 00 00 00       	mov    edx,0x0
    18f4:	48 89 ce             	mov    rsi,rcx
    18f7:	89 c7                	mov    edi,eax
    18f9:	e8 72 f7 ff ff       	call   1070 <seek@plt>
    read(fildes, ph, entn * ents);
    18fe:	0f b7 95 0e ff ff ff 	movzx  edx,WORD PTR [rbp-0xf2]
    1905:	0f b7 85 0c ff ff ff 	movzx  eax,WORD PTR [rbp-0xf4]
    190c:	0f af c2             	imul   eax,edx
    190f:	48 63 d0             	movsxd rdx,eax
    1912:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
    1916:	8b 85 9c fd ff ff    	mov    eax,DWORD PTR [rbp-0x264]
    191c:	48 89 ce             	mov    rsi,rcx
    191f:	89 c7                	mov    edi,eax
    1921:	e8 2a f7 ff ff       	call   1050 <read@plt>
    size_t tot_sz = 0;
    1926:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
    192d:	00 
    off_t  base = ph->p_vaddr, offset = 0;
    192e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1932:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    1936:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    193a:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    1941:	00 
    int    reloc_flag = 0;
    1942:	c7 85 f4 fe ff ff 00 	mov    DWORD PTR [rbp-0x10c],0x0
    1949:	00 00 00 
    //判断是否为DYN
    if (ehdr.e_type == ET_DYN) {
    194c:	48 8b 05 9d 46 00 00 	mov    rax,QWORD PTR [rip+0x469d]        # 5ff0 <ehdr-0x31b0>
    1953:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
    1957:	66 83 f8 03          	cmp    ax,0x3
    195b:	0f 85 28 01 00 00    	jne    1a89 <load_elfso+0x2c8>
        reloc_flag = 1;
    1961:	c7 85 f4 fe ff ff 01 	mov    DWORD PTR [rbp-0x10c],0x1
    1968:	00 00 00 
        for (int i = 0; i < ehdr.e_phnum; i++) {
    196b:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
    1972:	eb 78                	jmp    19ec <load_elfso+0x22b>
            tot_sz += ph[i].p_memsz;
    1974:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    1977:	48 63 d0             	movsxd rdx,eax
    197a:	48 89 d0             	mov    rax,rdx
    197d:	48 c1 e0 03          	shl    rax,0x3
    1981:	48 29 d0             	sub    rax,rdx
    1984:	48 c1 e0 03          	shl    rax,0x3
    1988:	48 89 c2             	mov    rdx,rax
    198b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    198f:	48 01 d0             	add    rax,rdx
    1992:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    1996:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
            if (ph[i].p_vaddr < base)
    199a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    199d:	48 63 d0             	movsxd rdx,eax
    19a0:	48 89 d0             	mov    rax,rdx
    19a3:	48 c1 e0 03          	shl    rax,0x3
    19a7:	48 29 d0             	sub    rax,rdx
    19aa:	48 c1 e0 03          	shl    rax,0x3
    19ae:	48 89 c2             	mov    rdx,rax
    19b1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    19b5:	48 01 d0             	add    rax,rdx
    19b8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    19bc:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
    19c0:	76 26                	jbe    19e8 <load_elfso+0x227>
                base = ph[i].p_vaddr;
    19c2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    19c5:	48 63 d0             	movsxd rdx,eax
    19c8:	48 89 d0             	mov    rax,rdx
    19cb:	48 c1 e0 03          	shl    rax,0x3
    19cf:	48 29 d0             	sub    rax,rdx
    19d2:	48 c1 e0 03          	shl    rax,0x3
    19d6:	48 89 c2             	mov    rdx,rax
    19d9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    19dd:	48 01 d0             	add    rax,rdx
    19e0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    19e4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for (int i = 0; i < ehdr.e_phnum; i++) {
    19e8:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
    19ec:	48 8b 05 fd 45 00 00 	mov    rax,QWORD PTR [rip+0x45fd]        # 5ff0 <ehdr-0x31b0>
    19f3:	0f b7 40 38          	movzx  eax,WORD PTR [rax+0x38]
    19f7:	0f b7 c0             	movzx  eax,ax
    19fa:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
    19fd:	0f 8c 71 ff ff ff    	jl     1974 <load_elfso+0x1b3>
        }
        /*
        似乎有的系统支持单个段的重定位。但是这样在有些重定位方式下，尤其是跨段的相对地址调用来说，这会带来大难度，
        所以这里先整体移动。*/
        if (!chkmmap(base, tot_sz)) {
    1a03:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
    1a07:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1a0b:	48 89 d6             	mov    rsi,rdx
    1a0e:	48 89 c7             	mov    rdi,rax
    1a11:	e8 8a f6 ff ff       	call   10a0 <chkmmap@plt>
    1a16:	85 c0                	test   eax,eax
    1a18:	75 6f                	jne    1a89 <load_elfso+0x2c8>
            //原来的地方已经被映射
            //需要重定位
            //找到另一块大小符合的连续虚拟内存，然后返回首地址（不映射，下面手动映射）
            reloc_flag     = 2;
    1a1a:	c7 85 f4 fe ff ff 02 	mov    DWORD PTR [rbp-0x10c],0x2
    1a21:	00 00 00 
            off_t new_base = base + 4096;
    1a24:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1a28:	48 05 00 10 00 00    	add    rax,0x1000
    1a2e:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            while (!chkmmap(new_base, tot_sz) && new_base < KNL_BASE) {
    1a32:	eb 08                	jmp    1a3c <load_elfso+0x27b>
                new_base += 4096;
    1a34:	48 81 45 d0 00 10 00 	add    QWORD PTR [rbp-0x30],0x1000
    1a3b:	00 
            while (!chkmmap(new_base, tot_sz) && new_base < KNL_BASE) {
    1a3c:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
    1a40:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    1a44:	48 89 d6             	mov    rsi,rdx
    1a47:	48 89 c7             	mov    rdi,rax
    1a4a:	e8 51 f6 ff ff       	call   10a0 <chkmmap@plt>
    1a4f:	85 c0                	test   eax,eax
    1a51:	75 10                	jne    1a63 <load_elfso+0x2a2>
    1a53:	48 b8 ff ff ff ff ff 	movabs rax,0xffff7fffffffffff
    1a5a:	7f ff ff 
    1a5d:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
    1a61:	76 d1                	jbe    1a34 <load_elfso+0x273>
            }
            if (new_base >= KNL_BASE) {
    1a63:	48 b8 ff ff ff ff ff 	movabs rax,0xffff7fffffffffff
    1a6a:	7f ff ff 
    1a6d:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
    1a71:	76 0a                	jbe    1a7d <load_elfso+0x2bc>
                return -ENOMEM;
    1a73:	b8 cf ff ff ff       	mov    eax,0xffffffcf
    1a78:	e9 4a 08 00 00       	jmp    22c7 <load_elfso+0xb06>
            }
            offset = new_base - base;
    1a7d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    1a81:	48 2b 45 e8          	sub    rax,QWORD PTR [rbp-0x18]
    1a85:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        }
    }


    module* mod   = 0;
    1a89:	48 c7 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],0x0
    1a90:	00 00 00 00 
    int     elfid = reg_module();
    1a94:	b8 00 00 00 00       	mov    eax,0x0
    1a99:	e8 70 0e 00 00       	call   290e <reg_module>
    1a9e:	89 85 e4 fe ff ff    	mov    DWORD PTR [rbp-0x11c],eax
    mod           = modules + elfid;
    1aa4:	8b 85 e4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x11c]
    1aaa:	48 63 d0             	movsxd rdx,eax
    1aad:	48 89 d0             	mov    rax,rdx
    1ab0:	48 01 c0             	add    rax,rax
    1ab3:	48 01 d0             	add    rax,rdx
    1ab6:	48 c1 e0 05          	shl    rax,0x5
    1aba:	48 89 c2             	mov    rdx,rax
    1abd:	48 8b 05 1c 45 00 00 	mov    rax,QWORD PTR [rip+0x451c]        # 5fe0 <modules-0x1a0>
    1ac4:	48 01 d0             	add    rax,rdx
    1ac7:	48 89 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rax
    //找dynamic段
    struct Elf64_Shdr* dynamic = 0;
    1ace:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
    1ad5:	00 
    off_t*             got     = 0;
    1ad6:	48 c7 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],0x0
    1add:	00 00 00 00 

    for (int i = 0; i < ehdr.e_shnum; i++) {
    1ae1:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
    1ae8:	e9 83 00 00 00       	jmp    1b70 <load_elfso+0x3af>
        if (sh[i].sh_type == SHT_DYNSYM) {
    1aed:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    1af0:	48 98                	cdqe   
    1af2:	48 c1 e0 06          	shl    rax,0x6
    1af6:	48 89 c2             	mov    rdx,rax
    1af9:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
    1b00:	48 01 d0             	add    rax,rdx
    1b03:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1b06:	83 f8 0b             	cmp    eax,0xb
    1b09:	75 27                	jne    1b32 <load_elfso+0x371>
            mod->s_symtabsz = sh[i].sh_size;
    1b0b:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    1b0e:	48 98                	cdqe   
    1b10:	48 c1 e0 06          	shl    rax,0x6
    1b14:	48 89 c2             	mov    rdx,rax
    1b17:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
    1b1e:	48 01 d0             	add    rax,rdx
    1b21:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
    1b25:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1b2c:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    1b30:	eb 3a                	jmp    1b6c <load_elfso+0x3ab>
        }
        else if (sh[i].sh_type == SHT_DYNAMIC) {
    1b32:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    1b35:	48 98                	cdqe   
    1b37:	48 c1 e0 06          	shl    rax,0x6
    1b3b:	48 89 c2             	mov    rdx,rax
    1b3e:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
    1b45:	48 01 d0             	add    rax,rdx
    1b48:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1b4b:	83 f8 06             	cmp    eax,0x6
    1b4e:	75 1c                	jne    1b6c <load_elfso+0x3ab>
            dynamic = sh + i;
    1b50:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    1b53:	48 98                	cdqe   
    1b55:	48 c1 e0 06          	shl    rax,0x6
    1b59:	48 89 c2             	mov    rdx,rax
    1b5c:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
    1b63:	48 01 d0             	add    rax,rdx
    1b66:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            break;
    1b6a:	eb 1b                	jmp    1b87 <load_elfso+0x3c6>
    for (int i = 0; i < ehdr.e_shnum; i++) {
    1b6c:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
    1b70:	48 8b 05 79 44 00 00 	mov    rax,QWORD PTR [rip+0x4479]        # 5ff0 <ehdr-0x31b0>
    1b77:	0f b7 40 3c          	movzx  eax,WORD PTR [rax+0x3c]
    1b7b:	0f b7 c0             	movzx  eax,ax
    1b7e:	39 45 c4             	cmp    DWORD PTR [rbp-0x3c],eax
    1b81:	0f 8c 66 ff ff ff    	jl     1aed <load_elfso+0x32c>
        }
    }
    //程序占用的最高地址，这里就是堆开始分配的地方
    off_t max_allocated = 0;
    1b87:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
    1b8e:	00 
    for (int i = 0; i < entn; i++) {
    1b8f:	c7 45 b4 00 00 00 00 	mov    DWORD PTR [rbp-0x4c],0x0
    1b96:	e9 12 01 00 00       	jmp    1cad <load_elfso+0x4ec>
        //加载段
        if (ph->p_type == PT_LOAD) {
    1b9b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1b9f:	8b 00                	mov    eax,DWORD PTR [rax]
    1ba1:	83 f8 01             	cmp    eax,0x1
    1ba4:	0f 85 fa 00 00 00    	jne    1ca4 <load_elfso+0x4e3>
            unsigned long off  = ph->p_offset;
    1baa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1bae:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1bb2:	48 89 85 b8 fe ff ff 	mov    QWORD PTR [rbp-0x148],rax
            unsigned long fs   = ph->p_filesz;
    1bb9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1bbd:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    1bc1:	48 89 85 b0 fe ff ff 	mov    QWORD PTR [rbp-0x150],rax
            size_t        ms   = ph->p_memsz;
    1bc8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1bcc:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    1bd0:	48 89 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],rax
            char*         vptr = (char*)ph->p_vaddr + offset;
    1bd7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1bdb:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    1bdf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1be3:	48 01 d0             	add    rax,rdx
    1be6:	48 89 85 a0 fe ff ff 	mov    QWORD PTR [rbp-0x160],rax
            if (max_allocated < vptr + ms)
    1bed:	48 8b 95 a0 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x160]
    1bf4:	48 8b 85 a8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x158]
    1bfb:	48 01 c2             	add    rdx,rax
    1bfe:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    1c02:	48 39 c2             	cmp    rdx,rax
    1c05:	76 15                	jbe    1c1c <load_elfso+0x45b>
                max_allocated = vptr + ms;
    1c07:	48 8b 95 a0 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x160]
    1c0e:	48 8b 85 a8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x158]
    1c15:	48 01 d0             	add    rax,rdx
    1c18:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
            if (off == 0) {
    1c1c:	48 83 bd b8 fe ff ff 	cmp    QWORD PTR [rbp-0x148],0x0
    1c23:	00 
    1c24:	75 12                	jne    1c38 <load_elfso+0x477>
                mod->header = vptr;
    1c26:	48 8b 95 a0 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x160]
    1c2d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1c34:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
            }
            //先映射好内存，访问时再分配内存
            int attr = PROT_READ;
    1c38:	c7 45 b0 01 00 00 00 	mov    DWORD PTR [rbp-0x50],0x1
            if ((ph->p_flags & PF_W))
    1c3f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c43:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1c46:	83 e0 02             	and    eax,0x2
    1c49:	85 c0                	test   eax,eax
    1c4b:	74 04                	je     1c51 <load_elfso+0x490>
                attr |= PROT_WRITE;
    1c4d:	83 4d b0 02          	or     DWORD PTR [rbp-0x50],0x2
            if ((ph->p_flags & PF_X)) {
    1c51:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c55:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1c58:	83 e0 01             	and    eax,0x1
    1c5b:	85 c0                	test   eax,eax
    1c5d:	74 04                	je     1c63 <load_elfso+0x4a2>
                attr |= PROT_EXEC;
    1c5f:	83 4d b0 04          	or     DWORD PTR [rbp-0x50],0x4
            }
            if (mmap(vptr, ms, attr, MAP_FIXED | MAP_PRIVATE, fildes, off) == -1)
    1c63:	48 8b bd b8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x148]
    1c6a:	8b 8d 9c fd ff ff    	mov    ecx,DWORD PTR [rbp-0x264]
    1c70:	8b 55 b0             	mov    edx,DWORD PTR [rbp-0x50]
    1c73:	48 8b b5 a8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x158]
    1c7a:	48 8b 85 a0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x160]
    1c81:	49 89 f9             	mov    r9,rdi
    1c84:	41 89 c8             	mov    r8d,ecx
    1c87:	b9 03 00 00 00       	mov    ecx,0x3
    1c8c:	48 89 c7             	mov    rdi,rax
    1c8f:	e8 ac f3 ff ff       	call   1040 <mmap@plt>
    1c94:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
    1c98:	75 0a                	jne    1ca4 <load_elfso+0x4e3>
                return -1;   //加载失败
    1c9a:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1c9f:	e9 23 06 00 00       	jmp    22c7 <load_elfso+0xb06>
        }
        ph++;
    1ca4:	48 83 45 f8 38       	add    QWORD PTR [rbp-0x8],0x38
    for (int i = 0; i < entn; i++) {
    1ca9:	83 45 b4 01          	add    DWORD PTR [rbp-0x4c],0x1
    1cad:	0f b7 85 0e ff ff ff 	movzx  eax,WORD PTR [rbp-0xf2]
    1cb4:	39 45 b4             	cmp    DWORD PTR [rbp-0x4c],eax
    1cb7:	0f 8c de fe ff ff    	jl     1b9b <load_elfso+0x3da>
    }
    if (dynamic) {
    1cbd:	48 83 7d c8 00       	cmp    QWORD PTR [rbp-0x38],0x0
    1cc2:	0f 84 f8 05 00 00    	je     22c0 <load_elfso+0xaff>
        void*      needed_nameoff[32];
        int        t_needed = 0;
    1cc8:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
        char*      dynstr   = 0;
    1ccf:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    1cd6:	00 
        Elf64_Dyn* dyn      = dynamic->sh_addr + offset;
    1cd7:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    1cdb:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    1cdf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1ce3:	48 01 d0             	add    rax,rdx
    1ce6:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
        size_t     relsz = 0, relentsz = 0;
    1ced:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    1cf4:	00 
    1cf5:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
    1cfc:	00 
        size_t     relasz = 0, relaentsz = 0;
    1cfd:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
    1d04:	00 
    1d05:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
    1d0c:	00 
        size_t     jmprelsz = 0, jmprelaentsz = 0;
    1d0d:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
    1d14:	00 00 00 00 
    1d18:	48 c7 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],0x0
    1d1f:	00 00 00 00 
        off_t      relptr = 0, relaptr = 0, jmprelptr = 0;
    1d23:	48 c7 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],0x0
    1d2a:	00 00 00 00 
    1d2e:	48 c7 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],0x0
    1d35:	00 00 00 00 
    1d39:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
    1d40:	00 00 00 00 
        int        pltrel = 0, bind_now = 0;
    1d44:	c7 85 54 ff ff ff 00 	mov    DWORD PTR [rbp-0xac],0x0
    1d4b:	00 00 00 
    1d4e:	c7 85 50 ff ff ff 00 	mov    DWORD PTR [rbp-0xb0],0x0
    1d55:	00 00 00 
        int (*init)()     = 0;
    1d58:	48 c7 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],0x0
    1d5f:	00 00 00 00 
        size_t init_arrsz = 0;
    1d63:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x0
    1d6a:	00 00 00 00 
        mod->p_dynamic    = dynamic;
    1d6e:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    1d72:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1d79:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
        //这里一堆获取函数之后实现细节
        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    1d7d:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
    1d84:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
    1d8b:	eb 3f                	jmp    1dcc <load_elfso+0x60b>
            if (p->d_tag == DT_STRTAB) {
    1d8d:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
    1d94:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1d97:	48 83 f8 05          	cmp    rax,0x5
    1d9b:	75 27                	jne    1dc4 <load_elfso+0x603>
                dynstr        = p->d_un.d_ptr + offset;
    1d9d:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
    1da4:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1da8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1dac:	48 01 d0             	add    rax,rdx
    1daf:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
                mod->p_strtab = dynstr;
    1db3:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
    1db7:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1dbe:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
                break;
    1dc2:	eb 17                	jmp    1ddb <load_elfso+0x61a>
        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    1dc4:	48 83 85 38 ff ff ff 	add    QWORD PTR [rbp-0xc8],0x10
    1dcb:	10 
    1dcc:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
    1dd3:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1dd6:	48 85 c0             	test   rax,rax
    1dd9:	75 b2                	jne    1d8d <load_elfso+0x5cc>
            }
        }
        if (!dynstr) {
    1ddb:	48 83 7d a0 00       	cmp    QWORD PTR [rbp-0x60],0x0
    1de0:	75 0a                	jne    1dec <load_elfso+0x62b>
            return -1;
    1de2:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1de7:	e9 db 04 00 00       	jmp    22c7 <load_elfso+0xb06>
        }

        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    1dec:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
    1df3:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
    1dfa:	e9 f0 01 00 00       	jmp    1fef <load_elfso+0x82e>
            switch (p->d_tag) {
    1dff:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1e06:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1e09:	48 83 f8 1b          	cmp    rax,0x1b
    1e0d:	0f 87 d3 01 00 00    	ja     1fe6 <load_elfso+0x825>
    1e13:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    1e1a:	00 
    1e1b:	48 8d 05 4e 22 00 00 	lea    rax,[rip+0x224e]        # 4070 <chkmmap+0xe70>
    1e22:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    1e25:	48 98                	cdqe   
    1e27:	48 8d 15 42 22 00 00 	lea    rdx,[rip+0x2242]        # 4070 <chkmmap+0xe70>
    1e2e:	48 01 d0             	add    rax,rdx
    1e31:	3e ff e0             	notrack jmp rax
            case DT_NEEDED:
                //不查错了
                needed_nameoff[t_needed++] = p->d_un.d_val + dynstr;
    1e34:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1e3b:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
    1e3f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
    1e42:	8d 50 01             	lea    edx,[rax+0x1]
    1e45:	89 55 ac             	mov    DWORD PTR [rbp-0x54],edx
    1e48:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
    1e4c:	48 01 ca             	add    rdx,rcx
    1e4f:	48 98                	cdqe   
    1e51:	48 89 94 c5 a0 fd ff 	mov    QWORD PTR [rbp+rax*8-0x260],rdx
    1e58:	ff 
                break;
    1e59:	e9 89 01 00 00       	jmp    1fe7 <load_elfso+0x826>
            case DT_PLTGOT:
                got = p->d_un.d_ptr + offset;
    1e5e:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1e65:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1e69:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1e6d:	48 01 d0             	add    rax,rdx
    1e70:	48 89 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rax

                //赋值为dl的运行时重定位函数
                got[2] = dl_runtime_resolve;
    1e77:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1e7e:	48 83 c0 10          	add    rax,0x10
    1e82:	48 8d 15 c6 07 00 00 	lea    rdx,[rip+0x7c6]        # 264f <dl_runtime_resolve>
    1e89:	48 89 10             	mov    QWORD PTR [rax],rdx
                //填入模块id
                got[1]     = mod - modules;
    1e8c:	48 8b 05 4d 41 00 00 	mov    rax,QWORD PTR [rip+0x414d]        # 5fe0 <modules-0x1a0>
    1e93:	48 89 c2             	mov    rdx,rax
    1e96:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1e9d:	48 29 d0             	sub    rax,rdx
    1ea0:	48 c1 f8 05          	sar    rax,0x5
    1ea4:	48 89 c2             	mov    rdx,rax
    1ea7:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
    1eae:	aa aa aa 
    1eb1:	48 0f af c2          	imul   rax,rdx
    1eb5:	48 89 c2             	mov    rdx,rax
    1eb8:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1ebf:	48 83 c0 08          	add    rax,0x8
    1ec3:	48 89 10             	mov    QWORD PTR [rax],rdx
                mod->p_got = got;
    1ec6:	48 8b 95 d8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x128]
    1ecd:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1ed4:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
                break;
    1ed8:	e9 0a 01 00 00       	jmp    1fe7 <load_elfso+0x826>
            case DT_SYMTAB: mod->p_symbol = p->d_un.d_ptr + offset; break;
    1edd:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1ee4:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1ee8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1eec:	48 01 c2             	add    rdx,rax
    1eef:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1ef6:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    1efa:	e9 e8 00 00 00       	jmp    1fe7 <load_elfso+0x826>
            case DT_PLTRELSZ: jmprelsz = p->d_un.d_val; break;
    1eff:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1f06:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1f0a:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    1f11:	e9 d1 00 00 00       	jmp    1fe7 <load_elfso+0x826>
            case DT_RELSZ: relsz = p->d_un.d_val; break;
    1f16:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1f1d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1f21:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    1f25:	e9 bd 00 00 00       	jmp    1fe7 <load_elfso+0x826>
            case DT_RELASZ: relasz = p->d_un.d_val; break;
    1f2a:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1f31:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1f35:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
    1f39:	e9 a9 00 00 00       	jmp    1fe7 <load_elfso+0x826>
            case DT_PLTREL: pltrel = p->d_un.d_val; break;
    1f3e:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1f45:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1f49:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    1f4f:	e9 93 00 00 00       	jmp    1fe7 <load_elfso+0x826>
            case DT_JMPREL: jmprelptr = p->d_un.d_val; break;
    1f54:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1f5b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1f5f:	48 89 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rax
    1f66:	eb 7f                	jmp    1fe7 <load_elfso+0x826>
            case DT_REL: relptr = p->d_un.d_ptr; break;
    1f68:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1f6f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1f73:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    1f7a:	eb 6b                	jmp    1fe7 <load_elfso+0x826>
            case DT_RELA: relaptr = p->d_un.d_ptr; break;
    1f7c:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1f83:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1f87:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    1f8e:	eb 57                	jmp    1fe7 <load_elfso+0x826>
            case DT_RELENT: relentsz = p->d_un.d_val; break;
    1f90:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1f97:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1f9b:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    1f9f:	eb 46                	jmp    1fe7 <load_elfso+0x826>
            case DT_RELAENT: relaentsz = p->d_un.d_val; break;
    1fa1:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1fa8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1fac:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    1fb0:	eb 35                	jmp    1fe7 <load_elfso+0x826>
            case DT_INIT_ARRAY: init = p->d_un.d_ptr; break;
    1fb2:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1fb9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1fbd:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    1fc4:	eb 21                	jmp    1fe7 <load_elfso+0x826>
            case DT_INIT_ARRAYSZ: init_arrsz = p->d_un.d_val; break;
    1fc6:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1fcd:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1fd1:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    1fd8:	eb 0d                	jmp    1fe7 <load_elfso+0x826>
            case DT_BIND_NOW: bind_now = 1; break;
    1fda:	c7 85 50 ff ff ff 01 	mov    DWORD PTR [rbp-0xb0],0x1
    1fe1:	00 00 00 
    1fe4:	eb 01                	jmp    1fe7 <load_elfso+0x826>
            default: break;
    1fe6:	90                   	nop
        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    1fe7:	48 83 85 30 ff ff ff 	add    QWORD PTR [rbp-0xd0],0x10
    1fee:	10 
    1fef:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1ff6:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1ff9:	48 85 c0             	test   rax,rax
    1ffc:	0f 85 fd fd ff ff    	jne    1dff <load_elfso+0x63e>
            }
        }
        for (int i = 0; i < t_needed; i++) {
    2002:	c7 85 2c ff ff ff 00 	mov    DWORD PTR [rbp-0xd4],0x0
    2009:	00 00 00 
    200c:	eb 71                	jmp    207f <load_elfso+0x8be>
            char* pathname = 0;
    200e:	48 c7 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],0x0
    2015:	00 00 00 00 
            int   so_fno   = 0;
    2019:	c7 85 c4 fe ff ff 00 	mov    DWORD PTR [rbp-0x13c],0x0
    2020:	00 00 00 
            pathname       = (off_t)dynstr + (off_t)needed_nameoff[i];
    2023:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
    2029:	48 98                	cdqe   
    202b:	48 8b 84 c5 a0 fd ff 	mov    rax,QWORD PTR [rbp+rax*8-0x260]
    2032:	ff 
    2033:	48 89 c2             	mov    rdx,rax
    2036:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    203a:	48 01 d0             	add    rax,rdx
    203d:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
            so_fno         = open(pathname, O_EXEC);
    2044:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    204b:	be 00 10 00 00       	mov    esi,0x1000
    2050:	48 89 c7             	mov    rdi,rax
    2053:	e8 58 f0 ff ff       	call   10b0 <open@plt>
    2058:	89 85 c4 fe ff ff    	mov    DWORD PTR [rbp-0x13c],eax
            load_elfso(so_fno);
    205e:	8b 85 c4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x13c]
    2064:	89 c7                	mov    edi,eax
    2066:	e8 56 f7 ff ff       	call   17c1 <load_elfso>
            close(so_fno);
    206b:	8b 85 c4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x13c]
    2071:	89 c7                	mov    edi,eax
    2073:	e8 48 f0 ff ff       	call   10c0 <close@plt>
        for (int i = 0; i < t_needed; i++) {
    2078:	83 85 2c ff ff ff 01 	add    DWORD PTR [rbp-0xd4],0x1
    207f:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
    2085:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
    2088:	7c 84                	jl     200e <load_elfso+0x84d>
        }
        if (relptr && relentsz && relsz)   // REL
    208a:	48 83 bd 68 ff ff ff 	cmp    QWORD PTR [rbp-0x98],0x0
    2091:	00 
    2092:	74 7b                	je     210f <load_elfso+0x94e>
    2094:	48 83 7d 90 00       	cmp    QWORD PTR [rbp-0x70],0x0
    2099:	74 74                	je     210f <load_elfso+0x94e>
    209b:	48 83 7d 98 00       	cmp    QWORD PTR [rbp-0x68],0x0
    20a0:	74 6d                	je     210f <load_elfso+0x94e>
            for (int j = 0; j < relsz / relentsz; j++)
    20a2:	c7 85 28 ff ff ff 00 	mov    DWORD PTR [rbp-0xd8],0x0
    20a9:	00 00 00 
    20ac:	eb 46                	jmp    20f4 <load_elfso+0x933>
                fill_reloc(relptr + offset + j * relentsz, offset, mod->p_symbol, 0);
    20ae:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    20b5:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    20b9:	48 89 c2             	mov    rdx,rax
    20bc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    20c0:	89 c6                	mov    esi,eax
    20c2:	48 8b 8d 68 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x98]
    20c9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    20cd:	48 01 c1             	add    rcx,rax
    20d0:	8b 85 28 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd8]
    20d6:	48 98                	cdqe   
    20d8:	48 0f af 45 90       	imul   rax,QWORD PTR [rbp-0x70]
    20dd:	48 01 c8             	add    rax,rcx
    20e0:	b9 00 00 00 00       	mov    ecx,0x0
    20e5:	48 89 c7             	mov    rdi,rax
    20e8:	e8 43 ef ff ff       	call   1030 <fill_reloc@plt>
            for (int j = 0; j < relsz / relentsz; j++)
    20ed:	83 85 28 ff ff ff 01 	add    DWORD PTR [rbp-0xd8],0x1
    20f4:	8b 85 28 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd8]
    20fa:	48 63 c8             	movsxd rcx,eax
    20fd:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
    2101:	ba 00 00 00 00       	mov    edx,0x0
    2106:	48 f7 75 90          	div    QWORD PTR [rbp-0x70]
    210a:	48 39 c1             	cmp    rcx,rax
    210d:	72 9f                	jb     20ae <load_elfso+0x8ed>
        if (relaptr && relaentsz && relasz)   // RELA
    210f:	48 83 bd 60 ff ff ff 	cmp    QWORD PTR [rbp-0xa0],0x0
    2116:	00 
    2117:	74 7b                	je     2194 <load_elfso+0x9d3>
    2119:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
    211e:	74 74                	je     2194 <load_elfso+0x9d3>
    2120:	48 83 7d 88 00       	cmp    QWORD PTR [rbp-0x78],0x0
    2125:	74 6d                	je     2194 <load_elfso+0x9d3>
            for (int j = 0; j < relasz / relaentsz; j++)
    2127:	c7 85 24 ff ff ff 00 	mov    DWORD PTR [rbp-0xdc],0x0
    212e:	00 00 00 
    2131:	eb 46                	jmp    2179 <load_elfso+0x9b8>
                fill_reloc(relaptr + offset + j * relaentsz, offset, mod->p_symbol, 1);
    2133:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    213a:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    213e:	48 89 c2             	mov    rdx,rax
    2141:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2145:	89 c6                	mov    esi,eax
    2147:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
    214e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2152:	48 01 c1             	add    rcx,rax
    2155:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
    215b:	48 98                	cdqe   
    215d:	48 0f af 45 80       	imul   rax,QWORD PTR [rbp-0x80]
    2162:	48 01 c8             	add    rax,rcx
    2165:	b9 01 00 00 00       	mov    ecx,0x1
    216a:	48 89 c7             	mov    rdi,rax
    216d:	e8 be ee ff ff       	call   1030 <fill_reloc@plt>
            for (int j = 0; j < relasz / relaentsz; j++)
    2172:	83 85 24 ff ff ff 01 	add    DWORD PTR [rbp-0xdc],0x1
    2179:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
    217f:	48 63 c8             	movsxd rcx,eax
    2182:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
    2186:	ba 00 00 00 00       	mov    edx,0x0
    218b:	48 f7 75 80          	div    QWORD PTR [rbp-0x80]
    218f:	48 39 c1             	cmp    rcx,rax
    2192:	72 9f                	jb     2133 <load_elfso+0x972>
        if (pltrel == DT_REL)
    2194:	83 bd 54 ff ff ff 11 	cmp    DWORD PTR [rbp-0xac],0x11
    219b:	75 17                	jne    21b4 <load_elfso+0x9f3>
            jmprelaentsz = relentsz, pltrel = 0;
    219d:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    21a1:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    21a8:	c7 85 54 ff ff ff 00 	mov    DWORD PTR [rbp-0xac],0x0
    21af:	00 00 00 
    21b2:	eb 15                	jmp    21c9 <load_elfso+0xa08>
        else
            jmprelaentsz = relaentsz, pltrel = 1;
    21b4:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
    21b8:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    21bf:	c7 85 54 ff ff ff 01 	mov    DWORD PTR [rbp-0xac],0x1
    21c6:	00 00 00 
        if (bind_now && jmprelptr && jmprelaentsz && jmprelsz)   // PLTREL
    21c9:	83 bd 50 ff ff ff 00 	cmp    DWORD PTR [rbp-0xb0],0x0
    21d0:	0f 84 9f 00 00 00    	je     2275 <load_elfso+0xab4>
    21d6:	48 83 bd 58 ff ff ff 	cmp    QWORD PTR [rbp-0xa8],0x0
    21dd:	00 
    21de:	0f 84 91 00 00 00    	je     2275 <load_elfso+0xab4>
    21e4:	48 83 bd 70 ff ff ff 	cmp    QWORD PTR [rbp-0x90],0x0
    21eb:	00 
    21ec:	0f 84 83 00 00 00    	je     2275 <load_elfso+0xab4>
    21f2:	48 83 bd 78 ff ff ff 	cmp    QWORD PTR [rbp-0x88],0x0
    21f9:	00 
    21fa:	74 79                	je     2275 <load_elfso+0xab4>
            for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    21fc:	c7 85 20 ff ff ff 00 	mov    DWORD PTR [rbp-0xe0],0x0
    2203:	00 00 00 
    2206:	eb 4c                	jmp    2254 <load_elfso+0xa93>
                fill_reloc(jmprelptr + offset + j * jmprelaentsz, offset, mod->p_symbol, pltrel);
    2208:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    220f:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    2213:	48 89 c2             	mov    rdx,rax
    2216:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    221a:	89 c6                	mov    esi,eax
    221c:	48 8b 8d 58 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa8]
    2223:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2227:	48 01 c1             	add    rcx,rax
    222a:	8b 85 20 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe0]
    2230:	48 98                	cdqe   
    2232:	48 0f af 85 70 ff ff 	imul   rax,QWORD PTR [rbp-0x90]
    2239:	ff 
    223a:	48 01 c8             	add    rax,rcx
    223d:	48 89 c7             	mov    rdi,rax
    2240:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
    2246:	89 c1                	mov    ecx,eax
    2248:	e8 e3 ed ff ff       	call   1030 <fill_reloc@plt>
            for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    224d:	83 85 20 ff ff ff 01 	add    DWORD PTR [rbp-0xe0],0x1
    2254:	8b 85 20 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe0]
    225a:	48 63 c8             	movsxd rcx,eax
    225d:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
    2264:	ba 00 00 00 00       	mov    edx,0x0
    2269:	48 f7 b5 70 ff ff ff 	div    QWORD PTR [rbp-0x90]
    2270:	48 39 c1             	cmp    rcx,rax
    2273:	72 93                	jb     2208 <load_elfso+0xa47>
        if (init) {
    2275:	48 83 bd 48 ff ff ff 	cmp    QWORD PTR [rbp-0xb8],0x0
    227c:	00 
    227d:	74 41                	je     22c0 <load_elfso+0xaff>
            //调用模块入口函数
            for (int i = 0; i < init_arrsz; i++) {
    227f:	c7 85 1c ff ff ff 00 	mov    DWORD PTR [rbp-0xe4],0x0
    2286:	00 00 00 
    2289:	eb 24                	jmp    22af <load_elfso+0xaee>
                (init + i * 8)();
    228b:	8b 85 1c ff ff ff    	mov    eax,DWORD PTR [rbp-0xe4]
    2291:	c1 e0 03             	shl    eax,0x3
    2294:	48 63 d0             	movsxd rdx,eax
    2297:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    229e:	48 01 c2             	add    rdx,rax
    22a1:	b8 00 00 00 00       	mov    eax,0x0
    22a6:	ff d2                	call   rdx
            for (int i = 0; i < init_arrsz; i++) {
    22a8:	83 85 1c ff ff ff 01 	add    DWORD PTR [rbp-0xe4],0x1
    22af:	8b 85 1c ff ff ff    	mov    eax,DWORD PTR [rbp-0xe4]
    22b5:	48 98                	cdqe   
    22b7:	48 39 85 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],rax
    22be:	77 cb                	ja     228b <load_elfso+0xaca>
            }
        }
    }

    return entry;
    22c0:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
}
    22c7:	c9                   	leave  
    22c8:	c3                   	ret    

00000000000022c9 <get_sym_addr>:
static off_t get_sym_addr(unsigned long modid, unsigned long symi)
{
    22c9:	f3 0f 1e fa          	endbr64 
    22cd:	55                   	push   rbp
    22ce:	48 89 e5             	mov    rbp,rsp
    22d1:	48 83 ec 40          	sub    rsp,0x40
    22d5:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
    22d9:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
    struct Elf64_Sym* sym = modules[modid].p_symbol;
    22dd:	48 8b 0d fc 3c 00 00 	mov    rcx,QWORD PTR [rip+0x3cfc]        # 5fe0 <modules-0x1a0>
    22e4:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    22e8:	48 89 d0             	mov    rax,rdx
    22eb:	48 01 c0             	add    rax,rax
    22ee:	48 01 d0             	add    rax,rdx
    22f1:	48 c1 e0 05          	shl    rax,0x5
    22f5:	48 01 c8             	add    rax,rcx
    22f8:	48 83 c0 28          	add    rax,0x28
    22fc:	48 8b 00             	mov    rax,QWORD PTR [rax]
    22ff:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    sym += symi;
    2303:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
    2307:	48 89 d0             	mov    rax,rdx
    230a:	48 01 c0             	add    rax,rax
    230d:	48 01 d0             	add    rax,rdx
    2310:	48 c1 e0 03          	shl    rax,0x3
    2314:	48 01 45 e8          	add    QWORD PTR [rbp-0x18],rax
    if (sym->st_shndx == SHN_COMMON) {
        //还没分配空间的符号，需要分配空间，st_value表示地址对齐约束
    }
    off_t symaddr = 0;
    2318:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    231f:	00 
    if (sym->st_shndx != SHN_UNDEF && sym->st_value)
    2320:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2324:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
    2328:	66 85 c0             	test   ax,ax
    232b:	74 43                	je     2370 <get_sym_addr+0xa7>
    232d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2331:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2335:	48 85 c0             	test   rax,rax
    2338:	74 36                	je     2370 <get_sym_addr+0xa7>
        symaddr = sym->st_value + modules[modid].load_offset;
    233a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    233e:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
    2342:	48 8b 35 97 3c 00 00 	mov    rsi,QWORD PTR [rip+0x3c97]        # 5fe0 <modules-0x1a0>
    2349:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    234d:	48 89 d0             	mov    rax,rdx
    2350:	48 01 c0             	add    rax,rax
    2353:	48 01 d0             	add    rax,rdx
    2356:	48 c1 e0 05          	shl    rax,0x5
    235a:	48 01 f0             	add    rax,rsi
    235d:	48 83 c0 08          	add    rax,0x8
    2361:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2364:	48 01 c8             	add    rax,rcx
    2367:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    236b:	e9 12 02 00 00       	jmp    2582 <get_sym_addr+0x2b9>
    else {
        //不在本模块，需要在别的模块符号表中寻找
        char* target_name = modules[modid].p_strtab + sym->st_name;
    2370:	48 8b 0d 69 3c 00 00 	mov    rcx,QWORD PTR [rip+0x3c69]        # 5fe0 <modules-0x1a0>
    2377:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    237b:	48 89 d0             	mov    rax,rdx
    237e:	48 01 c0             	add    rax,rax
    2381:	48 01 d0             	add    rax,rdx
    2384:	48 c1 e0 05          	shl    rax,0x5
    2388:	48 01 c8             	add    rax,rcx
    238b:	48 83 c0 40          	add    rax,0x40
    238f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2392:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2396:	8b 00                	mov    eax,DWORD PTR [rax]
    2398:	89 c0                	mov    eax,eax
    239a:	48 01 d0             	add    rax,rdx
    239d:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for (int i = 0; i < MAX_MODULES; i++) {
    23a1:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    23a8:	e9 cb 01 00 00       	jmp    2578 <get_sym_addr+0x2af>
            if (modules[i].type == ET_NONE || i == modid)
    23ad:	48 8b 0d 2c 3c 00 00 	mov    rcx,QWORD PTR [rip+0x3c2c]        # 5fe0 <modules-0x1a0>
    23b4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    23b7:	48 63 d0             	movsxd rdx,eax
    23ba:	48 89 d0             	mov    rax,rdx
    23bd:	48 01 c0             	add    rax,rax
    23c0:	48 01 d0             	add    rax,rdx
    23c3:	48 c1 e0 05          	shl    rax,0x5
    23c7:	48 01 c8             	add    rax,rcx
    23ca:	48 83 c0 18          	add    rax,0x18
    23ce:	48 8b 00             	mov    rax,QWORD PTR [rax]
    23d1:	48 85 c0             	test   rax,rax
    23d4:	0f 84 96 01 00 00    	je     2570 <get_sym_addr+0x2a7>
    23da:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    23dd:	48 98                	cdqe   
    23df:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
    23e3:	0f 84 87 01 00 00    	je     2570 <get_sym_addr+0x2a7>
                continue;
            sym = modules[i].p_symbol;
    23e9:	48 8b 0d f0 3b 00 00 	mov    rcx,QWORD PTR [rip+0x3bf0]        # 5fe0 <modules-0x1a0>
    23f0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    23f3:	48 63 d0             	movsxd rdx,eax
    23f6:	48 89 d0             	mov    rax,rdx
    23f9:	48 01 c0             	add    rax,rax
    23fc:	48 01 d0             	add    rax,rdx
    23ff:	48 c1 e0 05          	shl    rax,0x5
    2403:	48 01 c8             	add    rax,rcx
    2406:	48 83 c0 28          	add    rax,0x28
    240a:	48 8b 00             	mov    rax,QWORD PTR [rax]
    240d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            if (!sym)
    2411:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
    2416:	0f 84 57 01 00 00    	je     2573 <get_sym_addr+0x2aa>
                continue;
            for (int j = 0; j < modules[i].s_symtabsz / sizeof(struct Elf64_Sym); j++) {
    241c:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
    2423:	e9 ff 00 00 00       	jmp    2527 <get_sym_addr+0x25e>
                //获取符号名称
                if (!sym[j].st_name)
    2428:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    242b:	48 63 d0             	movsxd rdx,eax
    242e:	48 89 d0             	mov    rax,rdx
    2431:	48 01 c0             	add    rax,rax
    2434:	48 01 d0             	add    rax,rdx
    2437:	48 c1 e0 03          	shl    rax,0x3
    243b:	48 89 c2             	mov    rdx,rax
    243e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2442:	48 01 d0             	add    rax,rdx
    2445:	8b 00                	mov    eax,DWORD PTR [rax]
    2447:	85 c0                	test   eax,eax
    2449:	0f 84 d3 00 00 00    	je     2522 <get_sym_addr+0x259>
                    continue;
                char* symname = modules[i].p_strtab + sym[j].st_name;
    244f:	48 8b 0d 8a 3b 00 00 	mov    rcx,QWORD PTR [rip+0x3b8a]        # 5fe0 <modules-0x1a0>
    2456:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    2459:	48 63 d0             	movsxd rdx,eax
    245c:	48 89 d0             	mov    rax,rdx
    245f:	48 01 c0             	add    rax,rax
    2462:	48 01 d0             	add    rax,rdx
    2465:	48 c1 e0 05          	shl    rax,0x5
    2469:	48 01 c8             	add    rax,rcx
    246c:	48 83 c0 40          	add    rax,0x40
    2470:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    2473:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    2476:	48 63 d0             	movsxd rdx,eax
    2479:	48 89 d0             	mov    rax,rdx
    247c:	48 01 c0             	add    rax,rax
    247f:	48 01 d0             	add    rax,rdx
    2482:	48 c1 e0 03          	shl    rax,0x3
    2486:	48 89 c2             	mov    rdx,rax
    2489:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    248d:	48 01 d0             	add    rax,rdx
    2490:	8b 00                	mov    eax,DWORD PTR [rax]
    2492:	89 c0                	mov    eax,eax
    2494:	48 01 c8             	add    rax,rcx
    2497:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
                if (sym[j].st_value && dlstrcmp(target_name, symname) == 0) {
    249b:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    249e:	48 63 d0             	movsxd rdx,eax
    24a1:	48 89 d0             	mov    rax,rdx
    24a4:	48 01 c0             	add    rax,rax
    24a7:	48 01 d0             	add    rax,rdx
    24aa:	48 c1 e0 03          	shl    rax,0x3
    24ae:	48 89 c2             	mov    rdx,rax
    24b1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    24b5:	48 01 d0             	add    rax,rdx
    24b8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    24bc:	48 85 c0             	test   rax,rax
    24bf:	74 62                	je     2523 <get_sym_addr+0x25a>
    24c1:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
    24c5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    24c9:	48 89 d6             	mov    rsi,rdx
    24cc:	48 89 c7             	mov    rdi,rax
    24cf:	e8 8c eb ff ff       	call   1060 <dlstrcmp@plt>
    24d4:	85 c0                	test   eax,eax
    24d6:	75 4b                	jne    2523 <get_sym_addr+0x25a>
                    return modules[i].load_offset + sym[j].st_value;
    24d8:	48 8b 0d 01 3b 00 00 	mov    rcx,QWORD PTR [rip+0x3b01]        # 5fe0 <modules-0x1a0>
    24df:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    24e2:	48 63 d0             	movsxd rdx,eax
    24e5:	48 89 d0             	mov    rax,rdx
    24e8:	48 01 c0             	add    rax,rax
    24eb:	48 01 d0             	add    rax,rdx
    24ee:	48 c1 e0 05          	shl    rax,0x5
    24f2:	48 01 c8             	add    rax,rcx
    24f5:	48 83 c0 08          	add    rax,0x8
    24f9:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    24fc:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    24ff:	48 63 d0             	movsxd rdx,eax
    2502:	48 89 d0             	mov    rax,rdx
    2505:	48 01 c0             	add    rax,rax
    2508:	48 01 d0             	add    rax,rdx
    250b:	48 c1 e0 03          	shl    rax,0x3
    250f:	48 89 c2             	mov    rdx,rax
    2512:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2516:	48 01 d0             	add    rax,rdx
    2519:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    251d:	48 01 c8             	add    rax,rcx
    2520:	eb 64                	jmp    2586 <get_sym_addr+0x2bd>
                    continue;
    2522:	90                   	nop
            for (int j = 0; j < modules[i].s_symtabsz / sizeof(struct Elf64_Sym); j++) {
    2523:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
    2527:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    252a:	48 63 c8             	movsxd rcx,eax
    252d:	48 8b 35 ac 3a 00 00 	mov    rsi,QWORD PTR [rip+0x3aac]        # 5fe0 <modules-0x1a0>
    2534:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    2537:	48 63 d0             	movsxd rdx,eax
    253a:	48 89 d0             	mov    rax,rdx
    253d:	48 01 c0             	add    rax,rax
    2540:	48 01 d0             	add    rax,rdx
    2543:	48 c1 e0 05          	shl    rax,0x5
    2547:	48 01 f0             	add    rax,rsi
    254a:	48 83 c0 48          	add    rax,0x48
    254e:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2551:	48 ba ab aa aa aa aa 	movabs rdx,0xaaaaaaaaaaaaaaab
    2558:	aa aa aa 
    255b:	48 f7 e2             	mul    rdx
    255e:	48 89 d0             	mov    rax,rdx
    2561:	48 c1 e8 04          	shr    rax,0x4
    2565:	48 39 c1             	cmp    rcx,rax
    2568:	0f 82 ba fe ff ff    	jb     2428 <get_sym_addr+0x15f>
    256e:	eb 04                	jmp    2574 <get_sym_addr+0x2ab>
                continue;
    2570:	90                   	nop
    2571:	eb 01                	jmp    2574 <get_sym_addr+0x2ab>
                continue;
    2573:	90                   	nop
        for (int i = 0; i < MAX_MODULES; i++) {
    2574:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
    2578:	83 7d f4 7f          	cmp    DWORD PTR [rbp-0xc],0x7f
    257c:	0f 8e 2b fe ff ff    	jle    23ad <get_sym_addr+0xe4>
                }
            }
        }
    }
    return symaddr;
    2582:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
    2586:	c9                   	leave  
    2587:	c3                   	ret    

0000000000002588 <dlstrcmp>:
int dlstrcmp(char* src, char* dst)
{
    2588:	f3 0f 1e fa          	endbr64 
    258c:	55                   	push   rbp
    258d:	48 89 e5             	mov    rbp,rsp
    2590:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    2594:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while (*src++ && *dst++) {
    2598:	eb 2c                	jmp    25c6 <dlstrcmp+0x3e>
        if (*src != *dst) {
    259a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    259e:	0f b6 10             	movzx  edx,BYTE PTR [rax]
    25a1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    25a5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    25a8:	38 c2                	cmp    dl,al
    25aa:	74 1a                	je     25c6 <dlstrcmp+0x3e>
            return *src - *dst;
    25ac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    25b0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    25b3:	0f be d0             	movsx  edx,al
    25b6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    25ba:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    25bd:	0f be c8             	movsx  ecx,al
    25c0:	89 d0                	mov    eax,edx
    25c2:	29 c8                	sub    eax,ecx
    25c4:	eb 2b                	jmp    25f1 <dlstrcmp+0x69>
    while (*src++ && *dst++) {
    25c6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    25ca:	48 8d 50 01          	lea    rdx,[rax+0x1]
    25ce:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
    25d2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    25d5:	84 c0                	test   al,al
    25d7:	74 13                	je     25ec <dlstrcmp+0x64>
    25d9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    25dd:	48 8d 50 01          	lea    rdx,[rax+0x1]
    25e1:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    25e5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    25e8:	84 c0                	test   al,al
    25ea:	75 ae                	jne    259a <dlstrcmp+0x12>
        }
    }
    return 0;
    25ec:	b8 00 00 00 00       	mov    eax,0x0
}
    25f1:	5d                   	pop    rbp
    25f2:	c3                   	ret    

00000000000025f3 <get_load_base>:
off_t get_load_base(unsigned long modid)
{
    25f3:	f3 0f 1e fa          	endbr64 
    25f7:	55                   	push   rbp
    25f8:	48 89 e5             	mov    rbp,rsp
    25fb:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return modules[modid].base;
    25ff:	48 8b 0d da 39 00 00 	mov    rcx,QWORD PTR [rip+0x39da]        # 5fe0 <modules-0x1a0>
    2606:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    260a:	48 89 d0             	mov    rax,rdx
    260d:	48 01 c0             	add    rax,rax
    2610:	48 01 d0             	add    rax,rdx
    2613:	48 c1 e0 05          	shl    rax,0x5
    2617:	48 01 c8             	add    rax,rcx
    261a:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
    261d:	5d                   	pop    rbp
    261e:	c3                   	ret    

000000000000261f <get_got>:
off_t get_got(unsigned long modid)
{
    261f:	f3 0f 1e fa          	endbr64 
    2623:	55                   	push   rbp
    2624:	48 89 e5             	mov    rbp,rsp
    2627:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return modules[modid].p_got;
    262b:	48 8b 0d ae 39 00 00 	mov    rcx,QWORD PTR [rip+0x39ae]        # 5fe0 <modules-0x1a0>
    2632:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2636:	48 89 d0             	mov    rax,rdx
    2639:	48 01 c0             	add    rax,rax
    263c:	48 01 d0             	add    rax,rdx
    263f:	48 c1 e0 05          	shl    rax,0x5
    2643:	48 01 c8             	add    rax,rcx
    2646:	48 83 c0 30          	add    rax,0x30
    264a:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
    264d:	5d                   	pop    rbp
    264e:	c3                   	ret    

000000000000264f <dl_runtime_resolve>:
static void dl_runtime_resolve()
{
    264f:	f3 0f 1e fa          	endbr64 
    2653:	55                   	push   rbp
    2654:	48 89 e5             	mov    rbp,rsp
    2657:	48 83 ec 30          	sub    rsp,0x30
    //获取modid
    unsigned long long modid, rel_offset;
    __asm__ volatile("mov 8(%%rbp),%%rax\n mov %%rax,%0" : "=m"(modid));
    265b:	48 8b 45 08          	mov    rax,QWORD PTR [rbp+0x8]
    265f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    __asm__ volatile("mov 16(%%rbp),%%rax\n mov %%rax,%0" : "=m"(rel_offset));
    2663:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
    2667:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    Elf64_Rel* rel     = rel_offset * modules[modid].s_relentsz + modules[modid].p_reloc;
    266b:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    266f:	48 8b 0d 6a 39 00 00 	mov    rcx,QWORD PTR [rip+0x396a]        # 5fe0 <modules-0x1a0>
    2676:	48 89 d0             	mov    rax,rdx
    2679:	48 01 c0             	add    rax,rax
    267c:	48 01 d0             	add    rax,rdx
    267f:	48 c1 e0 05          	shl    rax,0x5
    2683:	48 01 c8             	add    rax,rcx
    2686:	48 83 c0 58          	add    rax,0x58
    268a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    268d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2691:	48 89 d1             	mov    rcx,rdx
    2694:	48 0f af c8          	imul   rcx,rax
    2698:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    269c:	48 8b 35 3d 39 00 00 	mov    rsi,QWORD PTR [rip+0x393d]        # 5fe0 <modules-0x1a0>
    26a3:	48 89 d0             	mov    rax,rdx
    26a6:	48 01 c0             	add    rax,rax
    26a9:	48 01 d0             	add    rax,rdx
    26ac:	48 c1 e0 05          	shl    rax,0x5
    26b0:	48 01 f0             	add    rax,rsi
    26b3:	48 83 c0 50          	add    rax,0x50
    26b7:	48 8b 00             	mov    rax,QWORD PTR [rax]
    26ba:	48 01 c8             	add    rax,rcx
    26bd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int        symi    = ELF64_R_SYM(rel->r_info);
    26c1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    26c5:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    26c9:	48 c1 e8 20          	shr    rax,0x20
    26cd:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    off_t      sym_off = get_sym_addr(modid, symi);
    26d0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    26d3:	48 63 d0             	movsxd rdx,eax
    26d6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    26da:	48 89 d6             	mov    rsi,rdx
    26dd:	48 89 c7             	mov    rdi,rax
    26e0:	e8 e4 fb ff ff       	call   22c9 <get_sym_addr>
    26e5:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    //必然是R_X86_64_JUMP_SLOT
    off_t* v_rel = rel->r_offset;
    26e9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    26ed:	48 8b 00             	mov    rax,QWORD PTR [rax]
    26f0:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    *v_rel       = sym_off;
    26f4:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    26f8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    26fc:	48 89 10             	mov    QWORD PTR [rax],rdx

    //重定位完毕，直接返回到目标地址
    __asm__ volatile("mov %0,%%rax\n leave\n jmp *%%rax\n" ::"m"(sym_off));
    26ff:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2703:	c9                   	leave  
    2704:	ff e0                	jmp    rax
}
    2706:	90                   	nop
    2707:	c9                   	leave  
    2708:	c3                   	ret    

0000000000002709 <fill_reloc>:

void fill_reloc(void* relp, int modid, void* shdrs, int rela)
{
    2709:	f3 0f 1e fa          	endbr64 
    270d:	55                   	push   rbp
    270e:	48 89 e5             	mov    rbp,rsp
    2711:	48 83 ec 50          	sub    rsp,0x50
    2715:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
    2719:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
    271c:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    2720:	89 4d c0             	mov    DWORD PTR [rbp-0x40],ecx
    Elf64_Rela* rel  = relp;
    2723:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    2727:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int         symi = ELF64_R_SYM(rel->r_info), type = ELF64_R_TYPE(rel->r_info);
    272b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    272f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2733:	48 c1 e8 20          	shr    rax,0x20
    2737:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    273a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    273e:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2742:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    off_t       sym_off   = get_sym_addr(modid, symi);
    2745:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    2748:	48 63 d0             	movsxd rdx,eax
    274b:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    274e:	48 98                	cdqe   
    2750:	48 89 d6             	mov    rsi,rdx
    2753:	48 89 c7             	mov    rdi,rax
    2756:	e8 6e fb ff ff       	call   22c9 <get_sym_addr>
    275b:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    off_t       load_base = get_load_base(modid);
    275f:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    2762:	48 98                	cdqe   
    2764:	48 89 c7             	mov    rdi,rax
    2767:	e8 14 e9 ff ff       	call   1080 <get_load_base@plt>
    276c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    off_t       got       = get_got(modid);
    2770:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    2773:	48 98                	cdqe   
    2775:	48 89 c7             	mov    rdi,rax
    2778:	e8 93 e8 ff ff       	call   1010 <get_got@plt>
    277d:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    //这里假定获取符号的地址是正确的，可以不修改符号表，而是通过记录模块整体加载地址，
    //来加上偏移量获取正确的符号地址
    off_t* v_rel = rel->r_offset;
    2781:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2785:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2788:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    switch (type) {
    278c:	83 7d f0 0b          	cmp    DWORD PTR [rbp-0x10],0xb
    2790:	0f 87 45 01 00 00    	ja     28db <fill_reloc+0x1d2>
    2796:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    2799:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    27a0:	00 
    27a1:	48 8d 05 38 19 00 00 	lea    rax,[rip+0x1938]        # 40e0 <chkmmap+0xee0>
    27a8:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    27ab:	48 98                	cdqe   
    27ad:	48 8d 15 2c 19 00 00 	lea    rdx,[rip+0x192c]        # 40e0 <chkmmap+0xee0>
    27b4:	48 01 d0             	add    rax,rdx
    27b7:	3e ff e0             	notrack jmp rax
    case R_X86_64_GLOB_DAT:
    case R_X86_64_JUMP_SLOT: *v_rel = sym_off; break;
    27ba:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    27be:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    27c2:	48 89 10             	mov    QWORD PTR [rax],rdx
    27c5:	e9 12 01 00 00       	jmp    28dc <fill_reloc+0x1d3>
    case R_X86_64_RELATIVE:
        if (rela)
    27ca:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    27ce:	74 1e                	je     27ee <fill_reloc+0xe5>
            *v_rel = rel->r_addend + load_base;
    27d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    27d4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    27d8:	48 89 c2             	mov    rdx,rax
    27db:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    27df:	48 01 c2             	add    rdx,rax
    27e2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    27e6:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += load_base;
        break;
    27e9:	e9 ee 00 00 00       	jmp    28dc <fill_reloc+0x1d3>
            *v_rel += load_base;
    27ee:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    27f2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    27f5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    27f9:	48 01 c2             	add    rdx,rax
    27fc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2800:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2803:	e9 d4 00 00 00       	jmp    28dc <fill_reloc+0x1d3>
    case R_X86_64_GOTPC:
        if (rela)
    2808:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    280c:	74 28                	je     2836 <fill_reloc+0x12d>
            *v_rel = got + rel->r_addend - rel->r_offset;
    280e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2812:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2816:	48 89 c2             	mov    rdx,rax
    2819:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    281d:	48 01 c2             	add    rdx,rax
    2820:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2824:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2827:	48 29 c2             	sub    rdx,rax
    282a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    282e:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += got - (unsigned long long)rel;
        break;
    2831:	e9 a6 00 00 00       	jmp    28dc <fill_reloc+0x1d3>
            *v_rel += got - (unsigned long long)rel;
    2836:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    283a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    283d:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
    2841:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2845:	48 29 c8             	sub    rax,rcx
    2848:	48 01 c2             	add    rdx,rax
    284b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    284f:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2852:	e9 85 00 00 00       	jmp    28dc <fill_reloc+0x1d3>
    case R_X86_64_32S:
    case R_X86_64_64:
        if (rela)
    2857:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    285b:	74 17                	je     2874 <fill_reloc+0x16b>
            *v_rel += sym_off;
    285d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2861:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2864:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2868:	48 01 c2             	add    rdx,rax
    286b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    286f:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off;
        break;
    2872:	eb 68                	jmp    28dc <fill_reloc+0x1d3>
            *v_rel = rel->r_addend + sym_off;
    2874:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2878:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    287c:	48 89 c2             	mov    rdx,rax
    287f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2883:	48 01 c2             	add    rdx,rax
    2886:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    288a:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    288d:	eb 4d                	jmp    28dc <fill_reloc+0x1d3>
    case R_X86_64_PC32:
        if (rela)
    288f:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    2893:	74 21                	je     28b6 <fill_reloc+0x1ad>
            *v_rel += sym_off - rel->r_offset;
    2895:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2899:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    289c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    28a0:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    28a3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    28a7:	48 29 c8             	sub    rax,rcx
    28aa:	48 01 c2             	add    rdx,rax
    28ad:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    28b1:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
        break;
    28b4:	eb 26                	jmp    28dc <fill_reloc+0x1d3>
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
    28b6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    28ba:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    28be:	48 89 c2             	mov    rdx,rax
    28c1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    28c5:	48 01 c2             	add    rdx,rax
    28c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    28cc:	48 8b 00             	mov    rax,QWORD PTR [rax]
    28cf:	48 29 c2             	sub    rdx,rax
    28d2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    28d6:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    28d9:	eb 01                	jmp    28dc <fill_reloc+0x1d3>
    default: break;
    28db:	90                   	nop
    }
}
    28dc:	90                   	nop
    28dd:	c9                   	leave  
    28de:	c3                   	ret    

00000000000028df <set_symtab>:
void set_symtab(void* symtab, int modid)
{
    28df:	f3 0f 1e fa          	endbr64 
    28e3:	55                   	push   rbp
    28e4:	48 89 e5             	mov    rbp,rsp
    28e7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    28eb:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    if (modid >= MAX_SYMTABS)
    28ee:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
    28f2:	7f 17                	jg     290b <set_symtab+0x2c>
        return;
    symtabs[modid] = symtab;
    28f4:	48 8b 05 fd 36 00 00 	mov    rax,QWORD PTR [rip+0x36fd]        # 5ff8 <symtabs-0x88>
    28fb:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
    28fe:	48 63 d2             	movsxd rdx,edx
    2901:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
    2905:	48 89 0c d0          	mov    QWORD PTR [rax+rdx*8],rcx
    2909:	eb 01                	jmp    290c <set_symtab+0x2d>
        return;
    290b:	90                   	nop
}
    290c:	5d                   	pop    rbp
    290d:	c3                   	ret    

000000000000290e <reg_module>:

static int reg_module()
{
    290e:	f3 0f 1e fa          	endbr64 
    2912:	55                   	push   rbp
    2913:	48 89 e5             	mov    rbp,rsp
    int i = 0;
    2916:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for (; i < MAX_MODULES; i++) {
    291d:	eb 5a                	jmp    2979 <reg_module+0x6b>
        if (modules[i].type = ET_NONE) {
    291f:	48 8b 0d ba 36 00 00 	mov    rcx,QWORD PTR [rip+0x36ba]        # 5fe0 <modules-0x1a0>
    2926:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    2929:	48 63 d0             	movsxd rdx,eax
    292c:	48 89 d0             	mov    rax,rdx
    292f:	48 01 c0             	add    rax,rax
    2932:	48 01 d0             	add    rax,rdx
    2935:	48 c1 e0 05          	shl    rax,0x5
    2939:	48 01 c8             	add    rax,rcx
    293c:	48 83 c0 18          	add    rax,0x18
    2940:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    2947:	48 8b 0d 92 36 00 00 	mov    rcx,QWORD PTR [rip+0x3692]        # 5fe0 <modules-0x1a0>
    294e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    2951:	48 63 d0             	movsxd rdx,eax
    2954:	48 89 d0             	mov    rax,rdx
    2957:	48 01 c0             	add    rax,rax
    295a:	48 01 d0             	add    rax,rdx
    295d:	48 c1 e0 05          	shl    rax,0x5
    2961:	48 01 c8             	add    rax,rcx
    2964:	48 83 c0 18          	add    rax,0x18
    2968:	48 8b 00             	mov    rax,QWORD PTR [rax]
    296b:	48 85 c0             	test   rax,rax
    296e:	74 05                	je     2975 <reg_module+0x67>
            return i;
    2970:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    2973:	eb 0f                	jmp    2984 <reg_module+0x76>
    for (; i < MAX_MODULES; i++) {
    2975:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    2979:	83 7d fc 7f          	cmp    DWORD PTR [rbp-0x4],0x7f
    297d:	7e a0                	jle    291f <reg_module+0x11>
        }
    }
    return -1;
    297f:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
    2984:	5d                   	pop    rbp
    2985:	c3                   	ret    

0000000000002986 <dl_init>:
static int dl_init(void* load_offset)
{
    2986:	f3 0f 1e fa          	endbr64 
    298a:	55                   	push   rbp
    298b:	48 89 e5             	mov    rbp,rsp
    298e:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
    2995:	48 89 bd 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdi
    //自举，不能调用任何全局函数和使用任何全局变量，完成自身重定位
    Elf64_Ehdr*       ehdr = load_offset;
    299c:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    29a3:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    Elf64_Phdr*       ph   = ehdr->e_phoff;
    29aa:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
    29b1:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    29b5:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    Elf64_Dyn*        dyn  = &_DYNAMIC;
    29bc:	48 8b 05 15 36 00 00 	mov    rax,QWORD PTR [rip+0x3615]        # 5fd8 <_DYNAMIC+0x130>
    29c3:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    struct Elf64_Sym* sym  = 0;
    29ca:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    29d1:	00 

    size_t              relsz = 0, relentsz = 0;
    29d2:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
    29d9:	00 
    29da:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
    29e1:	00 
    size_t              relasz = 0, relaentsz = 0;
    29e2:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    29e9:	00 
    29ea:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
    29f1:	00 
    size_t              jmprelsz = 0, jmprelaentsz = 0;
    29f2:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
    29f9:	00 
    29fa:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
    2a01:	00 
    unsigned long long  relptr = 0, relaptr = 0, jmprelptr = 0;
    2a02:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
    2a09:	00 
    2a0a:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
    2a11:	00 
    2a12:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
    2a19:	00 
    int                 pltrel = 0;
    2a1a:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
    unsigned long long* got    = 0;
    2a21:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    2a28:	00 

    int bind_now = 0;
    2a29:	c7 45 9c 00 00 00 00 	mov    DWORD PTR [rbp-0x64],0x0
    for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    2a30:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    2a37:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    2a3b:	e9 2a 01 00 00       	jmp    2b6a <dl_init+0x1e4>
        char* pathname = 0;
    2a40:	48 c7 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],0x0
    2a47:	00 00 00 00 
        int   so_fno   = 0;
    2a4b:	c7 85 5c ff ff ff 00 	mov    DWORD PTR [rbp-0xa4],0x0
    2a52:	00 00 00 
        switch (p->d_tag) {
    2a55:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2a59:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2a5c:	48 83 f8 18          	cmp    rax,0x18
    2a60:	0f 87 fe 00 00 00    	ja     2b64 <dl_init+0x1de>
    2a66:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    2a6d:	00 
    2a6e:	48 8d 05 9b 16 00 00 	lea    rax,[rip+0x169b]        # 4110 <chkmmap+0xf10>
    2a75:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    2a78:	48 98                	cdqe   
    2a7a:	48 8d 15 8f 16 00 00 	lea    rdx,[rip+0x168f]        # 4110 <chkmmap+0xf10>
    2a81:	48 01 d0             	add    rax,rdx
    2a84:	3e ff e0             	notrack jmp rax
        case DT_PLTGOT:   //赋值为dl的运行时重定位函数
            got    = p->d_un.d_ptr + load_offset;
    2a87:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2a8b:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    2a8f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2a96:	48 01 d0             	add    rax,rdx
    2a99:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
            got[2] = dl_runtime_resolve;
    2a9d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    2aa1:	48 83 c0 10          	add    rax,0x10
    2aa5:	48 8d 15 a3 fb ff ff 	lea    rdx,[rip+0xfffffffffffffba3]        # 264f <dl_runtime_resolve>
    2aac:	48 89 10             	mov    QWORD PTR [rax],rdx
            //填入模块id
            got[1] = 0;
    2aaf:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    2ab3:	48 83 c0 08          	add    rax,0x8
    2ab7:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            break;
    2abe:	e9 a2 00 00 00       	jmp    2b65 <dl_init+0x1df>
        case DT_SYMTAB: sym = p->d_un.d_ptr + load_offset; break;
    2ac3:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2ac7:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    2acb:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2ad2:	48 01 d0             	add    rax,rdx
    2ad5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    2ad9:	e9 87 00 00 00       	jmp    2b65 <dl_init+0x1df>
        case DT_PLTRELSZ: jmprelsz = p->d_un.d_val; break;
    2ade:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2ae2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2ae6:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    2aea:	eb 79                	jmp    2b65 <dl_init+0x1df>
        case DT_RELSZ: relsz = p->d_un.d_val; break;
    2aec:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2af0:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2af4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    2af8:	eb 6b                	jmp    2b65 <dl_init+0x1df>
        case DT_RELASZ: relasz = p->d_un.d_val; break;
    2afa:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2afe:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2b02:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    2b06:	eb 5d                	jmp    2b65 <dl_init+0x1df>
        case DT_PLTREL: pltrel = p->d_un.d_val; break;
    2b08:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2b0c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2b10:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    2b13:	eb 50                	jmp    2b65 <dl_init+0x1df>
        case DT_JMPREL: jmprelptr = p->d_un.d_val; break;
    2b15:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2b19:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2b1d:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
    2b21:	eb 42                	jmp    2b65 <dl_init+0x1df>
        case DT_REL: relptr = p->d_un.d_ptr; break;
    2b23:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2b27:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2b2b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    2b2f:	eb 34                	jmp    2b65 <dl_init+0x1df>
        case DT_RELA: relaptr = p->d_un.d_ptr; break;
    2b31:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2b35:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2b39:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    2b3d:	eb 26                	jmp    2b65 <dl_init+0x1df>
        case DT_RELENT: relentsz = p->d_un.d_val; break;
    2b3f:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2b43:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2b47:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    2b4b:	eb 18                	jmp    2b65 <dl_init+0x1df>
        case DT_RELAENT: relaentsz = p->d_un.d_val; break;
    2b4d:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2b51:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2b55:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    2b59:	eb 0a                	jmp    2b65 <dl_init+0x1df>
        case DT_BIND_NOW: bind_now = 1; break;
    2b5b:	c7 45 9c 01 00 00 00 	mov    DWORD PTR [rbp-0x64],0x1
    2b62:	eb 01                	jmp    2b65 <dl_init+0x1df>
        default: break;
    2b64:	90                   	nop
    for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    2b65:	48 83 45 90 10       	add    QWORD PTR [rbp-0x70],0x10
    2b6a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2b6e:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2b71:	48 85 c0             	test   rax,rax
    2b74:	0f 85 c6 fe ff ff    	jne    2a40 <dl_init+0xba>
        }
    }
    if (relptr && relentsz && relsz)   // REL
    2b7a:	48 83 7d c0 00       	cmp    QWORD PTR [rbp-0x40],0x0
    2b7f:	74 72                	je     2bf3 <dl_init+0x26d>
    2b81:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
    2b86:	74 6b                	je     2bf3 <dl_init+0x26d>
    2b88:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
    2b8d:	74 64                	je     2bf3 <dl_init+0x26d>
        for (int j = 0; j < relsz / relentsz; j++)
    2b8f:	c7 45 8c 00 00 00 00 	mov    DWORD PTR [rbp-0x74],0x0
    2b96:	eb 43                	jmp    2bdb <dl_init+0x255>
            init_fill_reloc(relptr + load_offset + j * relentsz, load_offset, sym, 0, got);
    2b98:	48 8b 4d a0          	mov    rcx,QWORD PTR [rbp-0x60]
    2b9c:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2ba3:	8b 55 8c             	mov    edx,DWORD PTR [rbp-0x74]
    2ba6:	48 63 d2             	movsxd rdx,edx
    2ba9:	48 89 d6             	mov    rsi,rdx
    2bac:	48 0f af 75 e8       	imul   rsi,QWORD PTR [rbp-0x18]
    2bb1:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
    2bb5:	48 01 d6             	add    rsi,rdx
    2bb8:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2bbf:	48 8d 3c 16          	lea    rdi,[rsi+rdx*1]
    2bc3:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2bc7:	49 89 c8             	mov    r8,rcx
    2bca:	b9 00 00 00 00       	mov    ecx,0x0
    2bcf:	48 89 c6             	mov    rsi,rax
    2bd2:	e8 0c 02 00 00       	call   2de3 <init_fill_reloc>
        for (int j = 0; j < relsz / relentsz; j++)
    2bd7:	83 45 8c 01          	add    DWORD PTR [rbp-0x74],0x1
    2bdb:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    2bde:	48 63 c8             	movsxd rcx,eax
    2be1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2be5:	ba 00 00 00 00       	mov    edx,0x0
    2bea:	48 f7 75 e8          	div    QWORD PTR [rbp-0x18]
    2bee:	48 39 c1             	cmp    rcx,rax
    2bf1:	72 a5                	jb     2b98 <dl_init+0x212>
    if (relaptr && relaentsz && relasz)   // RELA
    2bf3:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
    2bf8:	74 72                	je     2c6c <dl_init+0x2e6>
    2bfa:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
    2bff:	74 6b                	je     2c6c <dl_init+0x2e6>
    2c01:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
    2c06:	74 64                	je     2c6c <dl_init+0x2e6>
        for (int j = 0; j < relasz / relaentsz; j++)
    2c08:	c7 45 88 00 00 00 00 	mov    DWORD PTR [rbp-0x78],0x0
    2c0f:	eb 43                	jmp    2c54 <dl_init+0x2ce>
            init_fill_reloc(relaptr + load_offset + j * relaentsz, load_offset, sym, 1, got);
    2c11:	48 8b 4d a0          	mov    rcx,QWORD PTR [rbp-0x60]
    2c15:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2c1c:	8b 55 88             	mov    edx,DWORD PTR [rbp-0x78]
    2c1f:	48 63 d2             	movsxd rdx,edx
    2c22:	48 89 d6             	mov    rsi,rdx
    2c25:	48 0f af 75 d8       	imul   rsi,QWORD PTR [rbp-0x28]
    2c2a:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
    2c2e:	48 01 d6             	add    rsi,rdx
    2c31:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2c38:	48 8d 3c 16          	lea    rdi,[rsi+rdx*1]
    2c3c:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2c40:	49 89 c8             	mov    r8,rcx
    2c43:	b9 01 00 00 00       	mov    ecx,0x1
    2c48:	48 89 c6             	mov    rsi,rax
    2c4b:	e8 93 01 00 00       	call   2de3 <init_fill_reloc>
        for (int j = 0; j < relasz / relaentsz; j++)
    2c50:	83 45 88 01          	add    DWORD PTR [rbp-0x78],0x1
    2c54:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    2c57:	48 63 c8             	movsxd rcx,eax
    2c5a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2c5e:	ba 00 00 00 00       	mov    edx,0x0
    2c63:	48 f7 75 d8          	div    QWORD PTR [rbp-0x28]
    2c67:	48 39 c1             	cmp    rcx,rax
    2c6a:	72 a5                	jb     2c11 <dl_init+0x28b>
    if (pltrel == DT_REL)
    2c6c:	83 7d ac 11          	cmp    DWORD PTR [rbp-0x54],0x11
    2c70:	75 11                	jne    2c83 <dl_init+0x2fd>
        jmprelaentsz = relentsz, pltrel = 0;
    2c72:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2c76:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    2c7a:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
    2c81:	eb 0f                	jmp    2c92 <dl_init+0x30c>
    else
        jmprelaentsz = relaentsz, pltrel = 1;
    2c83:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2c87:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    2c8b:	c7 45 ac 01 00 00 00 	mov    DWORD PTR [rbp-0x54],0x1
    if (bind_now && jmprelptr && jmprelaentsz && jmprelsz)   // PLTREL
    2c92:	83 7d 9c 00          	cmp    DWORD PTR [rbp-0x64],0x0
    2c96:	74 77                	je     2d0f <dl_init+0x389>
    2c98:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
    2c9d:	74 70                	je     2d0f <dl_init+0x389>
    2c9f:	48 83 7d c8 00       	cmp    QWORD PTR [rbp-0x38],0x0
    2ca4:	74 69                	je     2d0f <dl_init+0x389>
    2ca6:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
    2cab:	74 62                	je     2d0f <dl_init+0x389>
        for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    2cad:	c7 45 84 00 00 00 00 	mov    DWORD PTR [rbp-0x7c],0x0
    2cb4:	eb 41                	jmp    2cf7 <dl_init+0x371>
            init_fill_reloc(
    2cb6:	48 8b 75 a0          	mov    rsi,QWORD PTR [rbp-0x60]
    2cba:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
                jmprelptr + load_offset + j * jmprelaentsz, load_offset, sym, pltrel, got);
    2cc1:	8b 55 84             	mov    edx,DWORD PTR [rbp-0x7c]
    2cc4:	48 63 d2             	movsxd rdx,edx
    2cc7:	48 89 d1             	mov    rcx,rdx
    2cca:	48 0f af 4d c8       	imul   rcx,QWORD PTR [rbp-0x38]
    2ccf:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
    2cd3:	48 01 d1             	add    rcx,rdx
            init_fill_reloc(
    2cd6:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2cdd:	48 8d 3c 11          	lea    rdi,[rcx+rdx*1]
    2ce1:	8b 4d ac             	mov    ecx,DWORD PTR [rbp-0x54]
    2ce4:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2ce8:	49 89 f0             	mov    r8,rsi
    2ceb:	48 89 c6             	mov    rsi,rax
    2cee:	e8 f0 00 00 00       	call   2de3 <init_fill_reloc>
        for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    2cf3:	83 45 84 01          	add    DWORD PTR [rbp-0x7c],0x1
    2cf7:	8b 45 84             	mov    eax,DWORD PTR [rbp-0x7c]
    2cfa:	48 63 c8             	movsxd rcx,eax
    2cfd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2d01:	ba 00 00 00 00       	mov    edx,0x0
    2d06:	48 f7 75 c8          	div    QWORD PTR [rbp-0x38]
    2d0a:	48 39 c1             	cmp    rcx,rax
    2d0d:	72 a7                	jb     2cb6 <dl_init+0x330>
    //重定位完毕，可以使用全局变量和全局函数
    for (int i = 0; i < MAX_MODULES; i++) {
    2d0f:	c7 45 80 00 00 00 00 	mov    DWORD PTR [rbp-0x80],0x0
    2d16:	eb 2c                	jmp    2d44 <dl_init+0x3be>
        modules[i].type = ET_NONE;
    2d18:	48 8b 0d c1 32 00 00 	mov    rcx,QWORD PTR [rip+0x32c1]        # 5fe0 <modules-0x1a0>
    2d1f:	8b 45 80             	mov    eax,DWORD PTR [rbp-0x80]
    2d22:	48 63 d0             	movsxd rdx,eax
    2d25:	48 89 d0             	mov    rax,rdx
    2d28:	48 01 c0             	add    rax,rax
    2d2b:	48 01 d0             	add    rax,rdx
    2d2e:	48 c1 e0 05          	shl    rax,0x5
    2d32:	48 01 c8             	add    rax,rcx
    2d35:	48 83 c0 18          	add    rax,0x18
    2d39:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    for (int i = 0; i < MAX_MODULES; i++) {
    2d40:	83 45 80 01          	add    DWORD PTR [rbp-0x80],0x1
    2d44:	83 7d 80 7f          	cmp    DWORD PTR [rbp-0x80],0x7f
    2d48:	7e ce                	jle    2d18 <dl_init+0x392>
    }
    modules[0].p_symbol    = sym;
    2d4a:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2d4e:	48 8b 05 8b 32 00 00 	mov    rax,QWORD PTR [rip+0x328b]        # 5fe0 <modules-0x1a0>
    2d55:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    modules[0].load_offset = load_offset;
    2d59:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2d60:	48 8b 05 79 32 00 00 	mov    rax,QWORD PTR [rip+0x3279]        # 5fe0 <modules-0x1a0>
    2d67:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    modules[0].base        = load_offset;
    2d6b:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2d72:	48 8b 05 67 32 00 00 	mov    rax,QWORD PTR [rip+0x3267]        # 5fe0 <modules-0x1a0>
    2d79:	48 89 10             	mov    QWORD PTR [rax],rdx
    modules[0].p_dynamic   = dyn;
    2d7c:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
    2d83:	48 8b 05 56 32 00 00 	mov    rax,QWORD PTR [rip+0x3256]        # 5fe0 <modules-0x1a0>
    2d8a:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    modules[0].p_got       = got;
    2d8e:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
    2d92:	48 8b 05 47 32 00 00 	mov    rax,QWORD PTR [rip+0x3247]        # 5fe0 <modules-0x1a0>
    2d99:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    modules[0].type        = ET_DYN;
    2d9d:	48 8b 05 3c 32 00 00 	mov    rax,QWORD PTR [rip+0x323c]        # 5fe0 <modules-0x1a0>
    2da4:	48 c7 40 18 03 00 00 	mov    QWORD PTR [rax+0x18],0x3
    2dab:	00 
    modules[0].header      = load_offset;
    2dac:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2db3:	48 8b 05 26 32 00 00 	mov    rax,QWORD PTR [rip+0x3226]        # 5fe0 <modules-0x1a0>
    2dba:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    modules[0].p_reloc     = jmprelptr;
    2dbe:	48 8b 05 1b 32 00 00 	mov    rax,QWORD PTR [rip+0x321b]        # 5fe0 <modules-0x1a0>
    2dc5:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
    2dc9:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    modules[0].s_relentsz  = jmprelaentsz;
    2dcd:	48 8b 05 0c 32 00 00 	mov    rax,QWORD PTR [rip+0x320c]        # 5fe0 <modules-0x1a0>
    2dd4:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    2dd8:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
    return 0;
    2ddc:	b8 00 00 00 00       	mov    eax,0x0
}
    2de1:	c9                   	leave  
    2de2:	c3                   	ret    

0000000000002de3 <init_fill_reloc>:
//自举用的小重定位函数
static void init_fill_reloc(void* relp, unsigned long long load_base, void* symtab, int rela,
                            off_t igot)
{
    2de3:	f3 0f 1e fa          	endbr64 
    2de7:	55                   	push   rbp
    2de8:	48 89 e5             	mov    rbp,rsp
    2deb:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
    2def:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
    2df3:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    2df7:	89 4d b4             	mov    DWORD PTR [rbp-0x4c],ecx
    2dfa:	4c 89 45 a8          	mov    QWORD PTR [rbp-0x58],r8
    unsigned long long got  = igot + load_base;
    2dfe:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
    2e02:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    2e06:	48 01 d0             	add    rax,rdx
    2e09:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    Elf64_Rela*        rel  = relp;
    2e0d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    2e11:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int                symi = ELF64_R_SYM(rel->r_info), type = ELF64_R_TYPE(rel->r_info);
    2e15:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2e19:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2e1d:	48 c1 e8 20          	shr    rax,0x20
    2e21:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    2e24:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2e28:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2e2c:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    unsigned long long sym_off = (((struct Elf64_Sym*)symtab)[symi]).st_value;
    2e2f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    2e32:	48 63 d0             	movsxd rdx,eax
    2e35:	48 89 d0             	mov    rax,rdx
    2e38:	48 01 c0             	add    rax,rax
    2e3b:	48 01 d0             	add    rax,rdx
    2e3e:	48 c1 e0 03          	shl    rax,0x3
    2e42:	48 89 c2             	mov    rdx,rax
    2e45:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    2e49:	48 01 d0             	add    rax,rdx
    2e4c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2e50:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if (!sym_off) {
    2e54:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
    2e59:	0f 84 5a 01 00 00    	je     2fb9 <init_fill_reloc+0x1d6>
        //外部符号
        return;
    }
    //这里假定获取符号的地址是正确的，可以不修改符号表，而是通过记录模块整体加载地址，
    //来加上偏移量获取正确的符号地址
    unsigned long long* v_rel = rel->r_offset;
    2e5f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2e63:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2e66:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (type) {
    2e6a:	83 7d e8 0b          	cmp    DWORD PTR [rbp-0x18],0xb
    2e6e:	0f 87 48 01 00 00    	ja     2fbc <init_fill_reloc+0x1d9>
    2e74:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
    2e77:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    2e7e:	00 
    2e7f:	48 8d 05 ee 12 00 00 	lea    rax,[rip+0x12ee]        # 4174 <chkmmap+0xf74>
    2e86:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    2e89:	48 98                	cdqe   
    2e8b:	48 8d 15 e2 12 00 00 	lea    rdx,[rip+0x12e2]        # 4174 <chkmmap+0xf74>
    2e92:	48 01 d0             	add    rax,rdx
    2e95:	3e ff e0             	notrack jmp rax
    case R_X86_64_GLOB_DAT:
    case R_X86_64_JUMP_SLOT: *v_rel = sym_off; break;
    2e98:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2e9c:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    2ea0:	48 89 10             	mov    QWORD PTR [rax],rdx
    2ea3:	e9 15 01 00 00       	jmp    2fbd <init_fill_reloc+0x1da>
    case R_X86_64_RELATIVE:
        if (rela)
    2ea8:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    2eac:	74 1e                	je     2ecc <init_fill_reloc+0xe9>
            *v_rel = rel->r_addend + load_base;
    2eae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2eb2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2eb6:	48 89 c2             	mov    rdx,rax
    2eb9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    2ebd:	48 01 c2             	add    rdx,rax
    2ec0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2ec4:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += load_base;
        break;
    2ec7:	e9 f1 00 00 00       	jmp    2fbd <init_fill_reloc+0x1da>
            *v_rel += load_base;
    2ecc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2ed0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2ed3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    2ed7:	48 01 c2             	add    rdx,rax
    2eda:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2ede:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2ee1:	e9 d7 00 00 00       	jmp    2fbd <init_fill_reloc+0x1da>
    case R_X86_64_GOTPC:
        if (rela)
    2ee6:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    2eea:	74 28                	je     2f14 <init_fill_reloc+0x131>
            *v_rel = got + rel->r_addend - rel->r_offset;
    2eec:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2ef0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2ef4:	48 89 c2             	mov    rdx,rax
    2ef7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2efb:	48 01 c2             	add    rdx,rax
    2efe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2f02:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2f05:	48 29 c2             	sub    rdx,rax
    2f08:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2f0c:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += got - (unsigned long long)rel;
        break;
    2f0f:	e9 a9 00 00 00       	jmp    2fbd <init_fill_reloc+0x1da>
            *v_rel += got - (unsigned long long)rel;
    2f14:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2f18:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2f1b:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
    2f1f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2f23:	48 29 c8             	sub    rax,rcx
    2f26:	48 01 c2             	add    rdx,rax
    2f29:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2f2d:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2f30:	e9 88 00 00 00       	jmp    2fbd <init_fill_reloc+0x1da>
    case R_X86_64_32S:
    case R_X86_64_64:
        if (rela)
    2f35:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    2f39:	74 17                	je     2f52 <init_fill_reloc+0x16f>
            *v_rel += sym_off;
    2f3b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2f3f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2f42:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2f46:	48 01 c2             	add    rdx,rax
    2f49:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2f4d:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off;
        break;
    2f50:	eb 6b                	jmp    2fbd <init_fill_reloc+0x1da>
            *v_rel = rel->r_addend + sym_off;
    2f52:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2f56:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2f5a:	48 89 c2             	mov    rdx,rax
    2f5d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2f61:	48 01 c2             	add    rdx,rax
    2f64:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2f68:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2f6b:	eb 50                	jmp    2fbd <init_fill_reloc+0x1da>
    case R_X86_64_PC32:
        if (rela)
    2f6d:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    2f71:	74 21                	je     2f94 <init_fill_reloc+0x1b1>
            *v_rel += sym_off - rel->r_offset;
    2f73:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2f77:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2f7a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2f7e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    2f81:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2f85:	48 29 c8             	sub    rax,rcx
    2f88:	48 01 c2             	add    rdx,rax
    2f8b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2f8f:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
        break;
    2f92:	eb 29                	jmp    2fbd <init_fill_reloc+0x1da>
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
    2f94:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2f98:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2f9c:	48 89 c2             	mov    rdx,rax
    2f9f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2fa3:	48 01 c2             	add    rdx,rax
    2fa6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2faa:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2fad:	48 29 c2             	sub    rdx,rax
    2fb0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2fb4:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2fb7:	eb 04                	jmp    2fbd <init_fill_reloc+0x1da>
        return;
    2fb9:	90                   	nop
    2fba:	eb 01                	jmp    2fbd <init_fill_reloc+0x1da>
    default: break;
    2fbc:	90                   	nop
    }
    2fbd:	5d                   	pop    rbp
    2fbe:	c3                   	ret    
    2fbf:	90                   	nop

0000000000002fc0 <reg_dev>:
    2fc0:	55                   	push   rbp
    2fc1:	48 89 e5             	mov    rbp,rsp
    2fc4:	b8 00 00 00 00       	mov    eax,0x0
    2fc9:	55                   	push   rbp
    2fca:	48 0f 05             	rex.W syscall 
    2fcd:	5d                   	pop    rbp
    2fce:	c9                   	leave  
    2fcf:	c3                   	ret    

0000000000002fd0 <dispose_dev>:
    2fd0:	55                   	push   rbp
    2fd1:	48 89 e5             	mov    rbp,rsp
    2fd4:	b8 01 00 00 00       	mov    eax,0x1
    2fd9:	55                   	push   rbp
    2fda:	48 0f 05             	rex.W syscall 
    2fdd:	5d                   	pop    rbp
    2fde:	c9                   	leave  
    2fdf:	c3                   	ret    

0000000000002fe0 <reg_drv>:
    2fe0:	55                   	push   rbp
    2fe1:	48 89 e5             	mov    rbp,rsp
    2fe4:	b8 02 00 00 00       	mov    eax,0x2
    2fe9:	55                   	push   rbp
    2fea:	48 0f 05             	rex.W syscall 
    2fed:	5d                   	pop    rbp
    2fee:	c9                   	leave  
    2fef:	c3                   	ret    

0000000000002ff0 <dispose_drv>:
    2ff0:	55                   	push   rbp
    2ff1:	48 89 e5             	mov    rbp,rsp
    2ff4:	b8 03 00 00 00       	mov    eax,0x3
    2ff9:	55                   	push   rbp
    2ffa:	48 0f 05             	rex.W syscall 
    2ffd:	5d                   	pop    rbp
    2ffe:	c9                   	leave  
    2fff:	c3                   	ret    

0000000000003000 <call_drvfunc>:
    3000:	55                   	push   rbp
    3001:	48 89 e5             	mov    rbp,rsp
    3004:	b8 04 00 00 00       	mov    eax,0x4
    3009:	55                   	push   rbp
    300a:	48 0f 05             	rex.W syscall 
    300d:	5d                   	pop    rbp
    300e:	c9                   	leave  
    300f:	c3                   	ret    

0000000000003010 <req_mem>:
    3010:	55                   	push   rbp
    3011:	48 89 e5             	mov    rbp,rsp
    3014:	b8 05 00 00 00       	mov    eax,0x5
    3019:	55                   	push   rbp
    301a:	48 0f 05             	rex.W syscall 
    301d:	5d                   	pop    rbp
    301e:	c9                   	leave  
    301f:	c3                   	ret    

0000000000003020 <free_mem>:
    3020:	55                   	push   rbp
    3021:	48 89 e5             	mov    rbp,rsp
    3024:	b8 06 00 00 00       	mov    eax,0x6
    3029:	55                   	push   rbp
    302a:	48 0f 05             	rex.W syscall 
    302d:	5d                   	pop    rbp
    302e:	c9                   	leave  
    302f:	c3                   	ret    

0000000000003030 <reg_proc>:
    3030:	55                   	push   rbp
    3031:	48 89 e5             	mov    rbp,rsp
    3034:	b8 07 00 00 00       	mov    eax,0x7
    3039:	55                   	push   rbp
    303a:	48 0f 05             	rex.W syscall 
    303d:	5d                   	pop    rbp
    303e:	c9                   	leave  
    303f:	c3                   	ret    

0000000000003040 <del_proc>:
    3040:	55                   	push   rbp
    3041:	48 89 e5             	mov    rbp,rsp
    3044:	b8 08 00 00 00       	mov    eax,0x8
    3049:	55                   	push   rbp
    304a:	48 0f 05             	rex.W syscall 
    304d:	5d                   	pop    rbp
    304e:	c9                   	leave  
    304f:	c3                   	ret    

0000000000003050 <get_proc_addr>:
    3050:	55                   	push   rbp
    3051:	48 89 e5             	mov    rbp,rsp
    3054:	b8 09 00 00 00       	mov    eax,0x9
    3059:	55                   	push   rbp
    305a:	48 0f 05             	rex.W syscall 
    305d:	5d                   	pop    rbp
    305e:	c9                   	leave  
    305f:	c3                   	ret    

0000000000003060 <chk_vm>:
    3060:	55                   	push   rbp
    3061:	48 89 e5             	mov    rbp,rsp
    3064:	b8 0a 00 00 00       	mov    eax,0xa
    3069:	55                   	push   rbp
    306a:	48 0f 05             	rex.W syscall 
    306d:	5d                   	pop    rbp
    306e:	c9                   	leave  
    306f:	c3                   	ret    

0000000000003070 <open>:
    3070:	55                   	push   rbp
    3071:	48 89 e5             	mov    rbp,rsp
    3074:	b8 0b 00 00 00       	mov    eax,0xb
    3079:	55                   	push   rbp
    307a:	48 0f 05             	rex.W syscall 
    307d:	5d                   	pop    rbp
    307e:	c9                   	leave  
    307f:	c3                   	ret    

0000000000003080 <close>:
    3080:	55                   	push   rbp
    3081:	48 89 e5             	mov    rbp,rsp
    3084:	b8 0c 00 00 00       	mov    eax,0xc
    3089:	55                   	push   rbp
    308a:	48 0f 05             	rex.W syscall 
    308d:	5d                   	pop    rbp
    308e:	c9                   	leave  
    308f:	c3                   	ret    

0000000000003090 <read>:
    3090:	55                   	push   rbp
    3091:	48 89 e5             	mov    rbp,rsp
    3094:	b8 0d 00 00 00       	mov    eax,0xd
    3099:	55                   	push   rbp
    309a:	48 0f 05             	rex.W syscall 
    309d:	5d                   	pop    rbp
    309e:	c9                   	leave  
    309f:	c3                   	ret    

00000000000030a0 <write>:
    30a0:	55                   	push   rbp
    30a1:	48 89 e5             	mov    rbp,rsp
    30a4:	b8 0e 00 00 00       	mov    eax,0xe
    30a9:	55                   	push   rbp
    30aa:	48 0f 05             	rex.W syscall 
    30ad:	5d                   	pop    rbp
    30ae:	c9                   	leave  
    30af:	c3                   	ret    

00000000000030b0 <seek>:
    30b0:	55                   	push   rbp
    30b1:	48 89 e5             	mov    rbp,rsp
    30b4:	b8 0f 00 00 00       	mov    eax,0xf
    30b9:	55                   	push   rbp
    30ba:	48 0f 05             	rex.W syscall 
    30bd:	5d                   	pop    rbp
    30be:	c9                   	leave  
    30bf:	c3                   	ret    

00000000000030c0 <tell>:
    30c0:	55                   	push   rbp
    30c1:	48 89 e5             	mov    rbp,rsp
    30c4:	b8 10 00 00 00       	mov    eax,0x10
    30c9:	55                   	push   rbp
    30ca:	48 0f 05             	rex.W syscall 
    30cd:	5d                   	pop    rbp
    30ce:	c9                   	leave  
    30cf:	c3                   	ret    

00000000000030d0 <reg_vol>:
    30d0:	55                   	push   rbp
    30d1:	48 89 e5             	mov    rbp,rsp
    30d4:	b8 11 00 00 00       	mov    eax,0x11
    30d9:	55                   	push   rbp
    30da:	48 0f 05             	rex.W syscall 
    30dd:	5d                   	pop    rbp
    30de:	c9                   	leave  
    30df:	c3                   	ret    

00000000000030e0 <free_vol>:
    30e0:	55                   	push   rbp
    30e1:	48 89 e5             	mov    rbp,rsp
    30e4:	b8 12 00 00 00       	mov    eax,0x12
    30e9:	55                   	push   rbp
    30ea:	48 0f 05             	rex.W syscall 
    30ed:	5d                   	pop    rbp
    30ee:	c9                   	leave  
    30ef:	c3                   	ret    

00000000000030f0 <exec>:
    30f0:	55                   	push   rbp
    30f1:	48 89 e5             	mov    rbp,rsp
    30f4:	b8 13 00 00 00       	mov    eax,0x13
    30f9:	55                   	push   rbp
    30fa:	48 0f 05             	rex.W syscall 
    30fd:	5d                   	pop    rbp
    30fe:	c9                   	leave  
    30ff:	c3                   	ret    

0000000000003100 <exit>:
    3100:	55                   	push   rbp
    3101:	48 89 e5             	mov    rbp,rsp
    3104:	b8 14 00 00 00       	mov    eax,0x14
    3109:	55                   	push   rbp
    310a:	48 0f 05             	rex.W syscall 
    310d:	5d                   	pop    rbp
    310e:	c9                   	leave  
    310f:	c3                   	ret    

0000000000003110 <abort>:
    3110:	55                   	push   rbp
    3111:	48 89 e5             	mov    rbp,rsp
    3114:	b8 14 00 00 00       	mov    eax,0x14
    3119:	55                   	push   rbp
    311a:	48 0f 05             	rex.W syscall 
    311d:	5d                   	pop    rbp
    311e:	c9                   	leave  
    311f:	c3                   	ret    

0000000000003120 <call>:
    3120:	55                   	push   rbp
    3121:	48 89 e5             	mov    rbp,rsp
    3124:	b8 15 00 00 00       	mov    eax,0x15
    3129:	55                   	push   rbp
    312a:	48 0f 05             	rex.W syscall 
    312d:	5d                   	pop    rbp
    312e:	c9                   	leave  
    312f:	c3                   	ret    

0000000000003130 <mkfifo>:
    3130:	55                   	push   rbp
    3131:	48 89 e5             	mov    rbp,rsp
    3134:	b8 16 00 00 00       	mov    eax,0x16
    3139:	55                   	push   rbp
    313a:	48 0f 05             	rex.W syscall 
    313d:	5d                   	pop    rbp
    313e:	c9                   	leave  
    313f:	c3                   	ret    

0000000000003140 <brk>:
    3140:	55                   	push   rbp
    3141:	48 89 e5             	mov    rbp,rsp
    3144:	b8 17 00 00 00       	mov    eax,0x17
    3149:	55                   	push   rbp
    314a:	48 0f 05             	rex.W syscall 
    314d:	5d                   	pop    rbp
    314e:	c9                   	leave  
    314f:	c3                   	ret    

0000000000003150 <find_dev>:
    3150:	55                   	push   rbp
    3151:	48 89 e5             	mov    rbp,rsp
    3154:	b8 19 00 00 00       	mov    eax,0x19
    3159:	55                   	push   rbp
    315a:	48 0f 05             	rex.W syscall 
    315d:	5d                   	pop    rbp
    315e:	c9                   	leave  
    315f:	c3                   	ret    

0000000000003160 <operate_dev>:
    3160:	55                   	push   rbp
    3161:	48 89 e5             	mov    rbp,rsp
    3164:	b8 1a 00 00 00       	mov    eax,0x1a
    3169:	55                   	push   rbp
    316a:	48 0f 05             	rex.W syscall 
    316d:	5d                   	pop    rbp
    316e:	c9                   	leave  
    316f:	c3                   	ret    

0000000000003170 <fork>:
    3170:	55                   	push   rbp
    3171:	48 89 e5             	mov    rbp,rsp
    3174:	b8 1b 00 00 00       	mov    eax,0x1b
    3179:	55                   	push   rbp
    317a:	48 0f 05             	rex.W syscall 
    317d:	5d                   	pop    rbp
    317e:	c9                   	leave  
    317f:	c3                   	ret    

0000000000003180 <execve>:
    3180:	55                   	push   rbp
    3181:	48 89 e5             	mov    rbp,rsp
    3184:	b8 1c 00 00 00       	mov    eax,0x1c
    3189:	55                   	push   rbp
    318a:	48 0f 05             	rex.W syscall 
    318d:	5d                   	pop    rbp
    318e:	c9                   	leave  
    318f:	c3                   	ret    

0000000000003190 <waitpid>:
    3190:	55                   	push   rbp
    3191:	48 89 e5             	mov    rbp,rsp
    3194:	b8 1d 00 00 00       	mov    eax,0x1d
    3199:	55                   	push   rbp
    319a:	48 0f 05             	rex.W syscall 
    319d:	5d                   	pop    rbp
    319e:	c9                   	leave  
    319f:	c3                   	ret    

00000000000031a0 <mmap>:
    31a0:	55                   	push   rbp
    31a1:	48 89 e5             	mov    rbp,rsp
    31a4:	b8 1e 00 00 00       	mov    eax,0x1e
    31a9:	55                   	push   rbp
    31aa:	48 0f 05             	rex.W syscall 
    31ad:	5d                   	pop    rbp
    31ae:	c9                   	leave  
    31af:	c3                   	ret    

00000000000031b0 <munmap>:
    31b0:	55                   	push   rbp
    31b1:	48 89 e5             	mov    rbp,rsp
    31b4:	b8 1f 00 00 00       	mov    eax,0x1f
    31b9:	55                   	push   rbp
    31ba:	48 0f 05             	rex.W syscall 
    31bd:	5d                   	pop    rbp
    31be:	c9                   	leave  
    31bf:	c3                   	ret    

00000000000031c0 <mknod>:
    31c0:	55                   	push   rbp
    31c1:	48 89 e5             	mov    rbp,rsp
    31c4:	b8 21 00 00 00       	mov    eax,0x21
    31c9:	55                   	push   rbp
    31ca:	48 0f 05             	rex.W syscall 
    31cd:	5d                   	pop    rbp
    31ce:	c9                   	leave  
    31cf:	c3                   	ret    

00000000000031d0 <kb_readc>:
    31d0:	55                   	push   rbp
    31d1:	48 89 e5             	mov    rbp,rsp
    31d4:	b8 64 00 00 00       	mov    eax,0x64
    31d9:	55                   	push   rbp
    31da:	48 0f 05             	rex.W syscall 
    31dd:	5d                   	pop    rbp
    31de:	c9                   	leave  
    31df:	c3                   	ret    

00000000000031e0 <remove>:
    31e0:	55                   	push   rbp
    31e1:	48 89 e5             	mov    rbp,rsp
    31e4:	b8 22 00 00 00       	mov    eax,0x22
    31e9:	55                   	push   rbp
    31ea:	48 0f 05             	rex.W syscall 
    31ed:	5d                   	pop    rbp
    31ee:	c9                   	leave  
    31ef:	c3                   	ret    

00000000000031f0 <sbrk>:
    31f0:	55                   	push   rbp
    31f1:	48 89 e5             	mov    rbp,rsp
    31f4:	b8 23 00 00 00       	mov    eax,0x23
    31f9:	55                   	push   rbp
    31fa:	48 0f 05             	rex.W syscall 
    31fd:	5d                   	pop    rbp
    31fe:	c9                   	leave  
    31ff:	c3                   	ret    

0000000000003200 <chkmmap>:
    3200:	55                   	push   rbp
    3201:	48 89 e5             	mov    rbp,rsp
    3204:	b8 24 00 00 00       	mov    eax,0x24
    3209:	55                   	push   rbp
    320a:	48 0f 05             	rex.W syscall 
    320d:	5d                   	pop    rbp
    320e:	c9                   	leave  
    320f:	c3                   	ret    
