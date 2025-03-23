
bin/dl.so:     file format elf64-x86-64


Disassembly of section .plt:

0000000000001000 <heap_size_in_pages@plt-0x10>:
    1000:	ff 35 02 50 00 00    	push   QWORD PTR [rip+0x5002]        # 6008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1006:	ff 25 04 50 00 00    	jmp    QWORD PTR [rip+0x5004]        # 6010 <_GLOBAL_OFFSET_TABLE_+0x10>
    100c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000001010 <heap_size_in_pages@plt>:
    1010:	ff 25 02 50 00 00    	jmp    QWORD PTR [rip+0x5002]        # 6018 <heap_size_in_pages+0x2a38>
    1016:	68 00 00 00 00       	push   0x0
    101b:	e9 e0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001020 <get_got@plt>:
    1020:	ff 25 fa 4f 00 00    	jmp    QWORD PTR [rip+0x4ffa]        # 6020 <get_got+0x37db>
    1026:	68 01 00 00 00       	push   0x1
    102b:	e9 d0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001030 <malloc@plt>:
    1030:	ff 25 f2 4f 00 00    	jmp    QWORD PTR [rip+0x4ff2]        # 6028 <malloc+0x24c8>
    1036:	68 02 00 00 00       	push   0x2
    103b:	e9 c0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001040 <fill_reloc@plt>:
    1040:	ff 25 ea 4f 00 00    	jmp    QWORD PTR [rip+0x4fea]        # 6030 <fill_reloc+0x3640>
    1046:	68 03 00 00 00       	push   0x3
    104b:	e9 b0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001050 <mmap@plt>:
    1050:	ff 25 e2 4f 00 00    	jmp    QWORD PTR [rip+0x4fe2]        # 6038 <mmap+0x22b8>
    1056:	68 04 00 00 00       	push   0x4
    105b:	e9 a0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001060 <read@plt>:
    1060:	ff 25 da 4f 00 00    	jmp    QWORD PTR [rip+0x4fda]        # 6040 <read+0x23d0>
    1066:	68 05 00 00 00       	push   0x5
    106b:	e9 90 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001070 <sbrk@plt>:
    1070:	ff 25 d2 4f 00 00    	jmp    QWORD PTR [rip+0x4fd2]        # 6048 <sbrk+0x2278>
    1076:	68 06 00 00 00       	push   0x6
    107b:	e9 80 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001080 <dlstrcmp@plt>:
    1080:	ff 25 ca 4f 00 00    	jmp    QWORD PTR [rip+0x4fca]        # 6050 <dlstrcmp+0x38a2>
    1086:	68 07 00 00 00       	push   0x7
    108b:	e9 70 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001090 <seek@plt>:
    1090:	ff 25 c2 4f 00 00    	jmp    QWORD PTR [rip+0x4fc2]        # 6058 <seek+0x23c8>
    1096:	68 08 00 00 00       	push   0x8
    109b:	e9 60 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010a0 <load_elfso@plt>:
    10a0:	ff 25 ba 4f 00 00    	jmp    QWORD PTR [rip+0x4fba]        # 6060 <load_elfso+0x484c>
    10a6:	68 09 00 00 00       	push   0x9
    10ab:	e9 50 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010b0 <chkmmap@plt>:
    10b0:	ff 25 b2 4f 00 00    	jmp    QWORD PTR [rip+0x4fb2]        # 6068 <chkmmap+0x2288>
    10b6:	68 0a 00 00 00       	push   0xa
    10bb:	e9 40 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010c0 <open@plt>:
    10c0:	ff 25 aa 4f 00 00    	jmp    QWORD PTR [rip+0x4faa]        # 6070 <open+0x2420>
    10c6:	68 0b 00 00 00       	push   0xb
    10cb:	e9 30 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010d0 <close@plt>:
    10d0:	ff 25 a2 4f 00 00    	jmp    QWORD PTR [rip+0x4fa2]        # 6078 <close+0x2418>
    10d6:	68 0c 00 00 00       	push   0xc
    10db:	e9 20 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010e0 <free@plt>:
    10e0:	ff 25 9a 4f 00 00    	jmp    QWORD PTR [rip+0x4f9a]        # 6080 <free+0x2b20>
    10e6:	68 0d 00 00 00       	push   0xd
    10eb:	e9 10 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

Disassembly of section .text:

00000000000010f0 <maybe_merge_free_large_object.cold>:
{
	struct large_object* obj = *prev;
	while(1)
	{
		char* end = get_large_object_payload(obj) + obj->size;
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
    10f0:	0f 0b                	ud2    

00000000000010f2 <get_small_object_freelist.cold>:
{
	return (size + GRANULE_SIZE - 1) >> GRANULE_SIZE_LOG_2;
}
static struct freelist** get_small_object_freelist(enum chunk_kind kind)
{
	ASSERT(kind < SMALL_OBJECT_CHUNK_KINDS);
    10f2:	0f 0b                	ud2    

00000000000010f4 <allocate_pages.constprop.0.cold>:
		ASSERT(grow);
    10f4:	0f 0b                	ud2    

00000000000010f6 <allocate_large_object.cold>:
		ASSERT(best_size >= size_with_header);
    10f6:	0f 0b                	ud2    

00000000000010f8 <get_modid>:
extern char _GLOBAL_OFFSET_TABLE_[];
void*       symtabs[MAX_SYMTABS] = {0};
module      modules[MAX_MODULES];
int         dlid;
id_t        get_modid(void)
{
    10f8:	f3 0f 1e fa          	endbr64 
    10fc:	55                   	push   rbp
    10fd:	48 89 e5             	mov    rbp,rsp
    static id_t modid_d = 0;
    return modid_d++;
    1100:	8b 05 fa 80 00 00    	mov    eax,DWORD PTR [rip+0x80fa]        # 9200 <modid_d.0>
    1106:	8d 50 01             	lea    edx,[rax+0x1]
    1109:	89 15 f1 80 00 00    	mov    DWORD PTR [rip+0x80f1],edx        # 9200 <modid_d.0>
}
    110f:	5d                   	pop    rbp
    1110:	c3                   	ret    

0000000000001111 <dlmain>:
int dlmain(int fno, char** argv, char** environ)
{
    1111:	f3 0f 1e fa          	endbr64 
    1115:	55                   	push   rbp
    1116:	48 89 e5             	mov    rbp,rsp
    1119:	48 83 ec 40          	sub    rsp,0x40
    111d:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    1120:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
    1124:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    //完成自我重定位（自举）
    dlid = dl_init(0);
    1128:	bf 00 00 00 00       	mov    edi,0x0
    112d:	e8 1a 1b 00 00       	call   2c4c <dl_init>
    1132:	48 8b 15 a7 4e 00 00 	mov    rdx,QWORD PTR [rip+0x4ea7]        # 5fe0 <dlid-0x31c0>
    1139:	89 02                	mov    DWORD PTR [rdx],eax

    //这部分是因为c库的malloc需要这个变量，但是现在又不能直接设置入口函数为entry
    extern unsigned long long __heap_base;
    __heap_base = sbrk(0);
    113b:	bf 00 00 00 00       	mov    edi,0x0
    1140:	e8 2b ff ff ff       	call   1070 <sbrk@plt>
    1145:	48 89 c2             	mov    rdx,rax
    1148:	48 8b 05 99 4e 00 00 	mov    rax,QWORD PTR [rip+0x4e99]        # 5fe8 <__heap_base-0x3288>
    114f:	48 89 10             	mov    QWORD PTR [rax],rdx
    //加载elf文件
    //读取文件头

    //递归加载elf和so
    off_t entry = load_elfso(fno);
    1152:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    1155:	89 c7                	mov    edi,eax
    1157:	e8 44 ff ff ff       	call   10a0 <load_elfso@plt>
    115c:	48 98                	cdqe   
    115e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if (entry == -1) {
    1162:	48 83 7d f0 ff       	cmp    QWORD PTR [rbp-0x10],0xffffffffffffffff
    1167:	75 07                	jne    1170 <dlmain+0x5f>
        return -1;
    1169:	b8 ff ff ff ff       	mov    eax,0xffffffff
    116e:	eb 4d                	jmp    11bd <dlmain+0xac>
    }
    int argc = 1;   //计数argv
    1170:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
    for (; argv[argc - 1]; argc++) {}
    1177:	eb 04                	jmp    117d <dlmain+0x6c>
    1179:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    117d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    1180:	48 98                	cdqe   
    1182:	48 c1 e0 03          	shl    rax,0x3
    1186:	48 8d 50 f8          	lea    rdx,[rax-0x8]
    118a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    118e:	48 01 d0             	add    rax,rdx
    1191:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1194:	48 85 c0             	test   rax,rax
    1197:	75 e0                	jne    1179 <dlmain+0x68>
    //跳转到程序入口
    int (*main)(int, char**, char**) = entry;
    1199:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    119d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    main(argc, argv, environ);
    11a1:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    11a5:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
    11a9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    11ac:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
    11b0:	48 89 ce             	mov    rsi,rcx
    11b3:	89 c7                	mov    edi,eax
    11b5:	41 ff d0             	call   r8
    return 0;
    11b8:	b8 00 00 00 00       	mov    eax,0x0
}
    11bd:	c9                   	leave  
    11be:	c3                   	ret    

00000000000011bf <load_elfso_old>:
int load_elfso_old(int fno)
{
    11bf:	f3 0f 1e fa          	endbr64 
    11c3:	55                   	push   rbp
    11c4:	48 89 e5             	mov    rbp,rsp
    11c7:	48 81 ec 30 01 00 00 	sub    rsp,0x130
    11ce:	89 bd dc fe ff ff    	mov    DWORD PTR [rbp-0x124],edi
    // 读取文件头
    Elf64_Ehdr ehdr;
    //读取文件头
    read(fno, &ehdr, sizeof(ehdr));
    11d4:	48 8d 8d e0 fe ff ff 	lea    rcx,[rbp-0x120]
    11db:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    11e1:	ba 40 00 00 00       	mov    edx,0x40
    11e6:	48 89 ce             	mov    rsi,rcx
    11e9:	89 c7                	mov    edi,eax
    11eb:	e8 70 fe ff ff       	call   1060 <read@plt>

    unsigned short entn = ehdr.e_phnum;
    11f0:	0f b7 85 18 ff ff ff 	movzx  eax,WORD PTR [rbp-0xe8]
    11f7:	66 89 45 86          	mov    WORD PTR [rbp-0x7a],ax
    unsigned short ents = ehdr.e_phentsize;
    11fb:	0f b7 85 16 ff ff ff 	movzx  eax,WORD PTR [rbp-0xea]
    1202:	66 89 45 84          	mov    WORD PTR [rbp-0x7c],ax
    module*        mod  = 0;
    1206:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    120d:	00 
    // module项设置
    //注册自己
    for (int i = 0; i < MAX_MODULES; i++) {
    120e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    1215:	e9 d1 00 00 00       	jmp    12eb <load_elfso_old+0x12c>
        if (modules[i].type == ET_NONE) {
    121a:	48 8b 0d b7 4d 00 00 	mov    rcx,QWORD PTR [rip+0x4db7]        # 5fd8 <modules-0x1c8>
    1221:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1224:	48 63 d0             	movsxd rdx,eax
    1227:	48 89 d0             	mov    rax,rdx
    122a:	48 01 c0             	add    rax,rax
    122d:	48 01 d0             	add    rax,rdx
    1230:	48 c1 e0 05          	shl    rax,0x5
    1234:	48 01 c8             	add    rax,rcx
    1237:	48 83 c0 18          	add    rax,0x18
    123b:	48 8b 00             	mov    rax,QWORD PTR [rax]
    123e:	48 85 c0             	test   rax,rax
    1241:	0f 85 a0 00 00 00    	jne    12e7 <load_elfso_old+0x128>
            modules[i].type        = ehdr.e_type;
    1247:	0f b7 85 f0 fe ff ff 	movzx  eax,WORD PTR [rbp-0x110]
    124e:	0f b7 d0             	movzx  edx,ax
    1251:	48 8b 35 80 4d 00 00 	mov    rsi,QWORD PTR [rip+0x4d80]        # 5fd8 <modules-0x1c8>
    1258:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    125b:	48 63 c8             	movsxd rcx,eax
    125e:	48 89 c8             	mov    rax,rcx
    1261:	48 01 c0             	add    rax,rax
    1264:	48 01 c8             	add    rax,rcx
    1267:	48 c1 e0 05          	shl    rax,0x5
    126b:	48 01 f0             	add    rax,rsi
    126e:	48 83 c0 18          	add    rax,0x18
    1272:	48 89 10             	mov    QWORD PTR [rax],rdx
            modules[i].load_offset = 0;
    1275:	48 8b 0d 5c 4d 00 00 	mov    rcx,QWORD PTR [rip+0x4d5c]        # 5fd8 <modules-0x1c8>
    127c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    127f:	48 63 d0             	movsxd rdx,eax
    1282:	48 89 d0             	mov    rax,rdx
    1285:	48 01 c0             	add    rax,rax
    1288:	48 01 d0             	add    rax,rdx
    128b:	48 c1 e0 05          	shl    rax,0x5
    128f:	48 01 c8             	add    rax,rcx
    1292:	48 83 c0 08          	add    rax,0x8
    1296:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            modules[i].base        = 0;
    129d:	48 8b 0d 34 4d 00 00 	mov    rcx,QWORD PTR [rip+0x4d34]        # 5fd8 <modules-0x1c8>
    12a4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    12a7:	48 63 d0             	movsxd rdx,eax
    12aa:	48 89 d0             	mov    rax,rdx
    12ad:	48 01 c0             	add    rax,rax
    12b0:	48 01 d0             	add    rax,rdx
    12b3:	48 c1 e0 05          	shl    rax,0x5
    12b7:	48 01 c8             	add    rax,rcx
    12ba:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            mod                    = modules + i;
    12c1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    12c4:	48 63 d0             	movsxd rdx,eax
    12c7:	48 89 d0             	mov    rax,rdx
    12ca:	48 01 c0             	add    rax,rax
    12cd:	48 01 d0             	add    rax,rdx
    12d0:	48 c1 e0 05          	shl    rax,0x5
    12d4:	48 89 c2             	mov    rdx,rax
    12d7:	48 8b 05 fa 4c 00 00 	mov    rax,QWORD PTR [rip+0x4cfa]        # 5fd8 <modules-0x1c8>
    12de:	48 01 d0             	add    rax,rdx
    12e1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
            break;
    12e5:	eb 0e                	jmp    12f5 <load_elfso_old+0x136>
    for (int i = 0; i < MAX_MODULES; i++) {
    12e7:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
    12eb:	83 7d f4 7f          	cmp    DWORD PTR [rbp-0xc],0x7f
    12ef:	0f 8e 25 ff ff ff    	jle    121a <load_elfso_old+0x5b>
        }
    }
    //需要malloc一块内存
    Elf64_Phdr* ph = malloc(entn * ents);   //(Elf64_Phdr *) (tmpla + ehdr.e_phoff);
    12f5:	0f b7 55 86          	movzx  edx,WORD PTR [rbp-0x7a]
    12f9:	0f b7 45 84          	movzx  eax,WORD PTR [rbp-0x7c]
    12fd:	0f af c2             	imul   eax,edx
    1300:	48 98                	cdqe   
    1302:	48 89 c7             	mov    rdi,rax
    1305:	e8 26 fd ff ff       	call   1030 <malloc@plt>
    130a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    seek(fno, ehdr.e_phoff, SEEK_SET);
    130e:	48 8b 8d 00 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x100]
    1315:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    131b:	ba 00 00 00 00       	mov    edx,0x0
    1320:	48 89 ce             	mov    rsi,rcx
    1323:	89 c7                	mov    edi,eax
    1325:	b8 00 00 00 00       	mov    eax,0x0
    132a:	e8 61 fd ff ff       	call   1090 <seek@plt>
    read(fno, ph, entn * ents);
    132f:	0f b7 55 86          	movzx  edx,WORD PTR [rbp-0x7a]
    1333:	0f b7 45 84          	movzx  eax,WORD PTR [rbp-0x7c]
    1337:	0f af c2             	imul   eax,edx
    133a:	48 63 d0             	movsxd rdx,eax
    133d:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
    1341:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    1347:	48 89 ce             	mov    rsi,rcx
    134a:	89 c7                	mov    edi,eax
    134c:	e8 0f fd ff ff       	call   1060 <read@plt>
    size_t tot_sz = 0;
    1351:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
    1358:	00 00 00 00 
    off_t  base = ph->p_vaddr, offset = 0;
    135c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1360:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    1364:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    136b:	48 c7 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],0x0
    1372:	00 00 00 00 
    int (**init)() = 0, init_arraysz = 0;
    1376:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    137d:	00 
    137e:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0

    for (int i = 0; i < entn; i++) {
    1385:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [rbp-0x28],0x0
    138c:	e9 ca 00 00 00       	jmp    145b <load_elfso_old+0x29c>
        //加载段
        if ((ph->p_type | PT_LOAD) != 0) {
            unsigned long off  = ph->p_offset;
    1391:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1395:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1399:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
            unsigned long fs   = ph->p_filesz;
    13a0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    13a4:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    13a8:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            size_t        ms   = ph->p_memsz;
    13af:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    13b3:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    13b7:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            char*         vptr = (char*)ph->p_vaddr + offset;
    13be:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    13c2:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    13c6:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    13cd:	48 01 d0             	add    rax,rdx
    13d0:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            if (off == 0) {
    13d7:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
    13de:	00 
    13df:	75 0f                	jne    13f0 <load_elfso_old+0x231>
                mod->header = vptr;
    13e1:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
    13e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    13ec:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
            }
            //先映射好内存
            int prot = PROT_READ;
    13f0:	c7 85 24 ff ff ff 01 	mov    DWORD PTR [rbp-0xdc],0x1
    13f7:	00 00 00 
            if ((ph->p_flags | PF_X))
                prot |= PROT_EXEC;
    13fa:	83 8d 24 ff ff ff 04 	or     DWORD PTR [rbp-0xdc],0x4
            if ((ph->p_flags | PF_W))
                prot |= PROT_WRITE;
    1401:	83 8d 24 ff ff ff 02 	or     DWORD PTR [rbp-0xdc],0x2
            int flags = MAP_PRIVATE;
    1408:	c7 45 d4 02 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x2
            if (ehdr.e_type == ET_EXEC)
    140f:	0f b7 85 f0 fe ff ff 	movzx  eax,WORD PTR [rbp-0x110]
    1416:	66 83 f8 02          	cmp    ax,0x2
    141a:	75 04                	jne    1420 <load_elfso_old+0x261>
                flags |= MAP_FIXED;
    141c:	83 4d d4 01          	or     DWORD PTR [rbp-0x2c],0x1
            mmap(vptr, fs, prot, flags, fno, off);
    1420:	4c 8b 85 40 ff ff ff 	mov    r8,QWORD PTR [rbp-0xc0]
    1427:	8b bd dc fe ff ff    	mov    edi,DWORD PTR [rbp-0x124]
    142d:	8b 4d d4             	mov    ecx,DWORD PTR [rbp-0x2c]
    1430:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
    1436:	48 8b b5 38 ff ff ff 	mov    rsi,QWORD PTR [rbp-0xc8]
    143d:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    1444:	4d 89 c1             	mov    r9,r8
    1447:	41 89 f8             	mov    r8d,edi
    144a:	48 89 c7             	mov    rdi,rax
    144d:	e8 fe fb ff ff       	call   1050 <mmap@plt>
        }
        ph++;
    1452:	48 83 45 e8 38       	add    QWORD PTR [rbp-0x18],0x38
    for (int i = 0; i < entn; i++) {
    1457:	83 45 d8 01          	add    DWORD PTR [rbp-0x28],0x1
    145b:	0f b7 45 86          	movzx  eax,WORD PTR [rbp-0x7a]
    145f:	39 45 d8             	cmp    DWORD PTR [rbp-0x28],eax
    1462:	0f 8c 29 ff ff ff    	jl     1391 <load_elfso_old+0x1d2>
    }

    Elf64_Dyn* dynamic = 0;
    1468:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
    146f:	00 
    //寻找dynamic段
    struct Elf64_Shdr* shdr =
        mmap(0, ehdr.e_shentsize * ehdr.e_shnum, PROT_READ, MAP_PRIVATE, fno, ehdr.e_shoff);
    1470:	48 8b 8d 08 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xf8]
    1477:	0f b7 85 1a ff ff ff 	movzx  eax,WORD PTR [rbp-0xe6]
    147e:	0f b7 d0             	movzx  edx,ax
    1481:	0f b7 85 1c ff ff ff 	movzx  eax,WORD PTR [rbp-0xe4]
    1488:	0f b7 c0             	movzx  eax,ax
    148b:	0f af c2             	imul   eax,edx
    148e:	48 98                	cdqe   
    1490:	8b 95 dc fe ff ff    	mov    edx,DWORD PTR [rbp-0x124]
    1496:	49 89 c9             	mov    r9,rcx
    1499:	41 89 d0             	mov    r8d,edx
    149c:	b9 02 00 00 00       	mov    ecx,0x2
    14a1:	ba 01 00 00 00       	mov    edx,0x1
    14a6:	48 89 c6             	mov    rsi,rax
    14a9:	bf 00 00 00 00       	mov    edi,0x0
    14ae:	e8 9d fb ff ff       	call   1050 <mmap@plt>
    14b3:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    mod->p_shdrs = shdr;
    14ba:	48 8b 95 60 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xa0]
    14c1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    14c5:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
    for (int i = 0; i < ehdr.e_shnum; i++) {
    14c9:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
    14d0:	eb 3e                	jmp    1510 <load_elfso_old+0x351>
        if (shdr[i].sh_type == SHT_DYNAMIC) {
    14d2:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    14d5:	48 98                	cdqe   
    14d7:	48 c1 e0 06          	shl    rax,0x6
    14db:	48 89 c2             	mov    rdx,rax
    14de:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    14e5:	48 01 d0             	add    rax,rdx
    14e8:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    14eb:	83 f8 06             	cmp    eax,0x6
    14ee:	75 1c                	jne    150c <load_elfso_old+0x34d>
            dynamic = shdr + i;
    14f0:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    14f3:	48 98                	cdqe   
    14f5:	48 c1 e0 06          	shl    rax,0x6
    14f9:	48 89 c2             	mov    rdx,rax
    14fc:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    1503:	48 01 d0             	add    rax,rdx
    1506:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            break;
    150a:	eb 13                	jmp    151f <load_elfso_old+0x360>
    for (int i = 0; i < ehdr.e_shnum; i++) {
    150c:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
    1510:	0f b7 85 1c ff ff ff 	movzx  eax,WORD PTR [rbp-0xe4]
    1517:	0f b7 c0             	movzx  eax,ax
    151a:	39 45 c4             	cmp    DWORD PTR [rbp-0x3c],eax
    151d:	7c b3                	jl     14d2 <load_elfso_old+0x313>
        }
    }
    if (!dynamic)
        ;
    char*  dynstr = 0;
    151f:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
    1526:	00 
    off_t* got    = 0;
    1527:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
    152e:	00 00 00 00 
    //这里一堆获取函数之后实现细节
    // dynstr=so_get_dynstr(dyn);
    // so_get_dynstr从so中获取.dynstr节
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    1532:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    1536:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
    153a:	eb 2a                	jmp    1566 <load_elfso_old+0x3a7>
        if (p->d_tag == DT_STRTAB) {
    153c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    1540:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1543:	48 83 f8 05          	cmp    rax,0x5
    1547:	75 18                	jne    1561 <load_elfso_old+0x3a2>
            dynstr = p->d_un.d_ptr + offset;
    1549:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    154d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1551:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    1558:	48 01 d0             	add    rax,rdx
    155b:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
            break;
    155f:	eb 11                	jmp    1572 <load_elfso_old+0x3b3>
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    1561:	48 83 45 b0 10       	add    QWORD PTR [rbp-0x50],0x10
    1566:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    156a:	48 8b 00             	mov    rax,QWORD PTR [rax]
    156d:	48 85 c0             	test   rax,rax
    1570:	75 ca                	jne    153c <load_elfso_old+0x37d>
        }
    }

    size_t relsz = 0, relentsz = 0;
    1572:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
    1579:	00 
    157a:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    1581:	00 
    off_t  relptr = 0;
    1582:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    1589:	00 
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    158a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    158e:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    1592:	e9 1d 02 00 00       	jmp    17b4 <load_elfso_old+0x5f5>
        switch (p->d_tag) {
    1597:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    159b:	48 8b 00             	mov    rax,QWORD PTR [rax]
    159e:	48 83 f8 1b          	cmp    rax,0x1b
    15a2:	0f 87 4d 01 00 00    	ja     16f5 <load_elfso_old+0x536>
    15a8:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    15af:	00 
    15b0:	48 8d 05 49 2a 00 00 	lea    rax,[rip+0x2a49]        # 4000 <chkmmap+0x220>
    15b7:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    15ba:	48 98                	cdqe   
    15bc:	48 8d 15 3d 2a 00 00 	lea    rdx,[rip+0x2a3d]        # 4000 <chkmmap+0x220>
    15c3:	48 01 d0             	add    rax,rdx
    15c6:	3e ff e0             	notrack jmp rax
        case DT_NEEDED:
            char* pathname = p->d_un.d_val + dynstr;
    15c9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    15cd:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    15d1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    15d5:	48 01 d0             	add    rax,rdx
    15d8:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
            int   so_fno   = open(pathname, O_EXEC);
    15df:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
    15e6:	be 00 10 00 00       	mov    esi,0x1000
    15eb:	48 89 c7             	mov    rdi,rax
    15ee:	e8 cd fa ff ff       	call   10c0 <open@plt>
    15f3:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
            //不查错了
            load_elfso(open(pathname, O_EXEC));
    15f9:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
    1600:	be 00 10 00 00       	mov    esi,0x1000
    1605:	48 89 c7             	mov    rdi,rax
    1608:	e8 b3 fa ff ff       	call   10c0 <open@plt>
    160d:	89 c7                	mov    edi,eax
    160f:	e8 8c fa ff ff       	call   10a0 <load_elfso@plt>
            close(so_fno);
    1614:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
    161a:	89 c7                	mov    edi,eax
    161c:	e8 af fa ff ff       	call   10d0 <close@plt>

            break;
    1621:	e9 d0 00 00 00       	jmp    16f6 <load_elfso_old+0x537>
        case DT_PLTGOT:
            got = p->d_un.d_ptr + offset;
    1626:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    162a:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    162e:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    1635:	48 01 d0             	add    rax,rdx
    1638:	48 89 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rax

            //赋值为dl的运行时重定位函数
            got[2] = dl_runtime_resolve;
    163f:	48 8b 85 58 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa8]
    1646:	48 83 c0 10          	add    rax,0x10
    164a:	48 8d 15 24 12 00 00 	lea    rdx,[rip+0x1224]        # 2875 <dl_runtime_resolve>
    1651:	48 89 10             	mov    QWORD PTR [rax],rdx
            //填入模块id
            got[1]     = mod - modules;
    1654:	48 8b 05 7d 49 00 00 	mov    rax,QWORD PTR [rip+0x497d]        # 5fd8 <modules-0x1c8>
    165b:	48 89 c2             	mov    rdx,rax
    165e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1662:	48 29 d0             	sub    rax,rdx
    1665:	48 c1 f8 05          	sar    rax,0x5
    1669:	48 89 c2             	mov    rdx,rax
    166c:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
    1673:	aa aa aa 
    1676:	48 0f af c2          	imul   rax,rdx
    167a:	48 89 c2             	mov    rdx,rax
    167d:	48 8b 85 58 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa8]
    1684:	48 83 c0 08          	add    rax,0x8
    1688:	48 89 10             	mov    QWORD PTR [rax],rdx
            mod->p_got = got;
    168b:	48 8b 95 58 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xa8]
    1692:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1696:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
        case DT_SYMTAB: mod->p_symbol = p->d_un.d_ptr; break;
    169a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    169e:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    16a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    16a6:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    16aa:	eb 4a                	jmp    16f6 <load_elfso_old+0x537>
        case DT_RELSZ:
        case DT_RELASZ: relsz = p->d_un.d_val; goto is_rel_prepared;
    16ac:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    16b0:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    16b4:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    16b8:	eb 41                	jmp    16fb <load_elfso_old+0x53c>
        case DT_REL:
        case DT_RELA: relptr = p->d_un.d_ptr; goto is_rel_prepared;
    16ba:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    16be:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    16c2:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    16c6:	eb 33                	jmp    16fb <load_elfso_old+0x53c>
        case DT_RELENT:
        case DT_RELAENT: relentsz = p->d_un.d_val; goto is_rel_prepared;
    16c8:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    16cc:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    16d0:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
    16d4:	eb 25                	jmp    16fb <load_elfso_old+0x53c>
        case DT_INIT_ARRAY: init = p->d_un.d_ptr; break;
    16d6:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    16da:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    16de:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    16e2:	eb 12                	jmp    16f6 <load_elfso_old+0x537>
        case DT_INIT_ARRAYSZ: init_arraysz = p->d_un.d_val / 8; break;
    16e4:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    16e8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    16ec:	48 c1 e8 03          	shr    rax,0x3
    16f0:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    16f3:	eb 01                	jmp    16f6 <load_elfso_old+0x537>
        default: break;
    16f5:	90                   	nop
        }
        continue;
    16f6:	e9 b4 00 00 00       	jmp    17af <load_elfso_old+0x5f0>
    is_rel_prepared:
        if (!(relsz && relentsz && relptr))
    16fb:	48 83 7d a8 00       	cmp    QWORD PTR [rbp-0x58],0x0
    1700:	0f 84 a8 00 00 00    	je     17ae <load_elfso_old+0x5ef>
    1706:	48 83 7d a0 00       	cmp    QWORD PTR [rbp-0x60],0x0
    170b:	0f 84 9d 00 00 00    	je     17ae <load_elfso_old+0x5ef>
    1711:	48 83 7d 98 00       	cmp    QWORD PTR [rbp-0x68],0x0
    1716:	0f 84 92 00 00 00    	je     17ae <load_elfso_old+0x5ef>
            continue;
        for (int j = 0; j < relsz / relentsz; j++) {
    171c:	c7 45 8c 00 00 00 00 	mov    DWORD PTR [rbp-0x74],0x0
    1723:	eb 57                	jmp    177c <load_elfso_old+0x5bd>
            fill_reloc(relptr + j * relentsz, mod - modules, shdr, 0);
    1725:	48 8b 05 ac 48 00 00 	mov    rax,QWORD PTR [rip+0x48ac]        # 5fd8 <modules-0x1c8>
    172c:	48 89 c2             	mov    rdx,rax
    172f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1733:	48 29 d0             	sub    rax,rdx
    1736:	48 c1 f8 05          	sar    rax,0x5
    173a:	48 89 c2             	mov    rdx,rax
    173d:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
    1744:	aa aa aa 
    1747:	48 0f af c2          	imul   rax,rdx
    174b:	89 c6                	mov    esi,eax
    174d:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    1750:	48 98                	cdqe   
    1752:	48 0f af 45 a0       	imul   rax,QWORD PTR [rbp-0x60]
    1757:	48 89 c2             	mov    rdx,rax
    175a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
    175e:	48 01 d0             	add    rax,rdx
    1761:	48 89 c7             	mov    rdi,rax
    1764:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    176b:	b9 00 00 00 00       	mov    ecx,0x0
    1770:	48 89 c2             	mov    rdx,rax
    1773:	e8 c8 f8 ff ff       	call   1040 <fill_reloc@plt>
        for (int j = 0; j < relsz / relentsz; j++) {
    1778:	83 45 8c 01          	add    DWORD PTR [rbp-0x74],0x1
    177c:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    177f:	48 63 c8             	movsxd rcx,eax
    1782:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
    1786:	ba 00 00 00 00       	mov    edx,0x0
    178b:	48 f7 75 a0          	div    QWORD PTR [rbp-0x60]
    178f:	48 39 c1             	cmp    rcx,rax
    1792:	72 91                	jb     1725 <load_elfso_old+0x566>
        }
        relsz = relentsz = relptr = 0;
    1794:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    179b:	00 
    179c:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    17a3:	00 
    17a4:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    17a8:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    17ac:	eb 01                	jmp    17af <load_elfso_old+0x5f0>
            continue;
    17ae:	90                   	nop
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    17af:	48 83 45 90 10       	add    QWORD PTR [rbp-0x70],0x10
    17b4:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    17b8:	48 8b 00             	mov    rax,QWORD PTR [rax]
    17bb:	48 85 c0             	test   rax,rax
    17be:	0f 85 d3 fd ff ff    	jne    1597 <load_elfso_old+0x3d8>
    }
    if (init) {
    17c4:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
    17c9:	74 33                	je     17fe <load_elfso_old+0x63f>
        //调用模块入口函数
        for (int i = 0; i < init_arraysz; i++) {
    17cb:	c7 45 88 00 00 00 00 	mov    DWORD PTR [rbp-0x78],0x0
    17d2:	eb 22                	jmp    17f6 <load_elfso_old+0x637>
            (init[i])();
    17d4:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    17d7:	48 98                	cdqe   
    17d9:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
    17e0:	00 
    17e1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    17e5:	48 01 d0             	add    rax,rdx
    17e8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    17eb:	b8 00 00 00 00       	mov    eax,0x0
    17f0:	ff d2                	call   rdx
        for (int i = 0; i < init_arraysz; i++) {
    17f2:	83 45 88 01          	add    DWORD PTR [rbp-0x78],0x1
    17f6:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    17f9:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
    17fc:	7c d6                	jl     17d4 <load_elfso_old+0x615>
        }
    }
    free(&ehdr);
    17fe:	48 8d 85 e0 fe ff ff 	lea    rax,[rbp-0x120]
    1805:	48 89 c7             	mov    rdi,rax
    1808:	e8 d3 f8 ff ff       	call   10e0 <free@plt>
    return 0;
    180d:	b8 00 00 00 00       	mov    eax,0x0
}
    1812:	c9                   	leave  
    1813:	c3                   	ret    

0000000000001814 <load_elfso>:
Elf64_Ehdr ehdr;
//切换进程前,在execve系统调用中
int load_elfso(int fildes)
{
    1814:	f3 0f 1e fa          	endbr64 
    1818:	55                   	push   rbp
    1819:	48 89 e5             	mov    rbp,rsp
    181c:	48 81 ec 90 02 00 00 	sub    rsp,0x290
    1823:	89 bd 7c fd ff ff    	mov    DWORD PTR [rbp-0x284],edi
    extern int chkmmap(off_t, size_t);
    extern int seek(int, off_t, int);
    read(fildes, &ehdr, sizeof(ehdr));
    1829:	8b 85 7c fd ff ff    	mov    eax,DWORD PTR [rbp-0x284]
    182f:	ba 40 00 00 00       	mov    edx,0x40
    1834:	48 8b 0d b5 47 00 00 	mov    rcx,QWORD PTR [rip+0x47b5]        # 5ff0 <ehdr-0x31d0>
    183b:	48 89 ce             	mov    rsi,rcx
    183e:	89 c7                	mov    edi,eax
    1840:	e8 1b f8 ff ff       	call   1060 <read@plt>
    off_t          entry = ehdr.e_entry;
    1845:	48 8b 05 a4 47 00 00 	mov    rax,QWORD PTR [rip+0x47a4]        # 5ff0 <ehdr-0x31d0>
    184c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
    1850:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
    unsigned short entn  = ehdr.e_phnum;
    1857:	48 8b 05 92 47 00 00 	mov    rax,QWORD PTR [rip+0x4792]        # 5ff0 <ehdr-0x31d0>
    185e:	0f b7 40 38          	movzx  eax,WORD PTR [rax+0x38]
    1862:	66 89 85 fe fe ff ff 	mov    WORD PTR [rbp-0x102],ax
    unsigned short ents  = ehdr.e_phentsize;
    1869:	48 8b 05 80 47 00 00 	mov    rax,QWORD PTR [rip+0x4780]        # 5ff0 <ehdr-0x31d0>
    1870:	0f b7 40 36          	movzx  eax,WORD PTR [rax+0x36]
    1874:	66 89 85 fc fe ff ff 	mov    WORD PTR [rbp-0x104],ax
    off_t          shla  = malloc(ehdr.e_shnum * ehdr.e_shentsize);
    187b:	48 8b 05 6e 47 00 00 	mov    rax,QWORD PTR [rip+0x476e]        # 5ff0 <ehdr-0x31d0>
    1882:	0f b7 40 3c          	movzx  eax,WORD PTR [rax+0x3c]
    1886:	0f b7 d0             	movzx  edx,ax
    1889:	48 8b 05 60 47 00 00 	mov    rax,QWORD PTR [rip+0x4760]        # 5ff0 <ehdr-0x31d0>
    1890:	0f b7 40 3a          	movzx  eax,WORD PTR [rax+0x3a]
    1894:	0f b7 c0             	movzx  eax,ax
    1897:	0f af c2             	imul   eax,edx
    189a:	48 98                	cdqe   
    189c:	48 89 c7             	mov    rdi,rax
    189f:	e8 8c f7 ff ff       	call   1030 <malloc@plt>
    18a4:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
    seek(fildes, ehdr.e_shoff, SEEK_SET);
    18ab:	48 8b 05 3e 47 00 00 	mov    rax,QWORD PTR [rip+0x473e]        # 5ff0 <ehdr-0x31d0>
    18b2:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
    18b6:	8b 85 7c fd ff ff    	mov    eax,DWORD PTR [rbp-0x284]
    18bc:	ba 00 00 00 00       	mov    edx,0x0
    18c1:	48 89 ce             	mov    rsi,rcx
    18c4:	89 c7                	mov    edi,eax
    18c6:	e8 c5 f7 ff ff       	call   1090 <seek@plt>
    read(fildes, shla, ehdr.e_shnum * ehdr.e_shentsize);
    18cb:	48 8b 05 1e 47 00 00 	mov    rax,QWORD PTR [rip+0x471e]        # 5ff0 <ehdr-0x31d0>
    18d2:	0f b7 40 3c          	movzx  eax,WORD PTR [rax+0x3c]
    18d6:	0f b7 d0             	movzx  edx,ax
    18d9:	48 8b 05 10 47 00 00 	mov    rax,QWORD PTR [rip+0x4710]        # 5ff0 <ehdr-0x31d0>
    18e0:	0f b7 40 3a          	movzx  eax,WORD PTR [rax+0x3a]
    18e4:	0f b7 c0             	movzx  eax,ax
    18e7:	0f af c2             	imul   eax,edx
    18ea:	48 63 d0             	movsxd rdx,eax
    18ed:	48 8b 8d f0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x110]
    18f4:	8b 85 7c fd ff ff    	mov    eax,DWORD PTR [rbp-0x284]
    18fa:	48 89 ce             	mov    rsi,rcx
    18fd:	89 c7                	mov    edi,eax
    18ff:	e8 5c f7 ff ff       	call   1060 <read@plt>

    struct Elf64_Shdr* sh = (struct Elf64_Shdr*)(shla);
    1904:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
    190b:	48 89 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rax
    Elf64_Phdr*        ph = malloc(entn * ents);
    1912:	0f b7 95 fe fe ff ff 	movzx  edx,WORD PTR [rbp-0x102]
    1919:	0f b7 85 fc fe ff ff 	movzx  eax,WORD PTR [rbp-0x104]
    1920:	0f af c2             	imul   eax,edx
    1923:	48 98                	cdqe   
    1925:	48 89 c7             	mov    rdi,rax
    1928:	e8 03 f7 ff ff       	call   1030 <malloc@plt>
    192d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    seek(fildes, ehdr.e_phoff, SEEK_SET);
    1931:	48 8b 05 b8 46 00 00 	mov    rax,QWORD PTR [rip+0x46b8]        # 5ff0 <ehdr-0x31d0>
    1938:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
    193c:	8b 85 7c fd ff ff    	mov    eax,DWORD PTR [rbp-0x284]
    1942:	ba 00 00 00 00       	mov    edx,0x0
    1947:	48 89 ce             	mov    rsi,rcx
    194a:	89 c7                	mov    edi,eax
    194c:	e8 3f f7 ff ff       	call   1090 <seek@plt>
    read(fildes, ph, entn * ents);
    1951:	0f b7 95 fe fe ff ff 	movzx  edx,WORD PTR [rbp-0x102]
    1958:	0f b7 85 fc fe ff ff 	movzx  eax,WORD PTR [rbp-0x104]
    195f:	0f af c2             	imul   eax,edx
    1962:	48 63 d0             	movsxd rdx,eax
    1965:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
    1969:	8b 85 7c fd ff ff    	mov    eax,DWORD PTR [rbp-0x284]
    196f:	48 89 ce             	mov    rsi,rcx
    1972:	89 c7                	mov    edi,eax
    1974:	e8 e7 f6 ff ff       	call   1060 <read@plt>
    size_t tot_sz = 0;
    1979:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
    1980:	00 
    off_t  base = ph->p_vaddr, offset = 0;
    1981:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1985:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    1989:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    198d:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    1994:	00 
    int    reloc_flag = 0;
    1995:	c7 85 e4 fe ff ff 00 	mov    DWORD PTR [rbp-0x11c],0x0
    199c:	00 00 00 
    //判断是否为DYN
    if (ehdr.e_type == ET_DYN) {
    199f:	48 8b 05 4a 46 00 00 	mov    rax,QWORD PTR [rip+0x464a]        # 5ff0 <ehdr-0x31d0>
    19a6:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
    19aa:	66 83 f8 03          	cmp    ax,0x3
    19ae:	0f 85 28 01 00 00    	jne    1adc <load_elfso+0x2c8>
        reloc_flag = 1;
    19b4:	c7 85 e4 fe ff ff 01 	mov    DWORD PTR [rbp-0x11c],0x1
    19bb:	00 00 00 
        for (int i = 0; i < ehdr.e_phnum; i++) {
    19be:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
    19c5:	eb 78                	jmp    1a3f <load_elfso+0x22b>
            tot_sz += ph[i].p_memsz;
    19c7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    19ca:	48 63 d0             	movsxd rdx,eax
    19cd:	48 89 d0             	mov    rax,rdx
    19d0:	48 c1 e0 03          	shl    rax,0x3
    19d4:	48 29 d0             	sub    rax,rdx
    19d7:	48 c1 e0 03          	shl    rax,0x3
    19db:	48 89 c2             	mov    rdx,rax
    19de:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    19e2:	48 01 d0             	add    rax,rdx
    19e5:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    19e9:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
            if (ph[i].p_vaddr < base)
    19ed:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    19f0:	48 63 d0             	movsxd rdx,eax
    19f3:	48 89 d0             	mov    rax,rdx
    19f6:	48 c1 e0 03          	shl    rax,0x3
    19fa:	48 29 d0             	sub    rax,rdx
    19fd:	48 c1 e0 03          	shl    rax,0x3
    1a01:	48 89 c2             	mov    rdx,rax
    1a04:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1a08:	48 01 d0             	add    rax,rdx
    1a0b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    1a0f:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
    1a13:	76 26                	jbe    1a3b <load_elfso+0x227>
                base = ph[i].p_vaddr;
    1a15:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    1a18:	48 63 d0             	movsxd rdx,eax
    1a1b:	48 89 d0             	mov    rax,rdx
    1a1e:	48 c1 e0 03          	shl    rax,0x3
    1a22:	48 29 d0             	sub    rax,rdx
    1a25:	48 c1 e0 03          	shl    rax,0x3
    1a29:	48 89 c2             	mov    rdx,rax
    1a2c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1a30:	48 01 d0             	add    rax,rdx
    1a33:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    1a37:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for (int i = 0; i < ehdr.e_phnum; i++) {
    1a3b:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
    1a3f:	48 8b 05 aa 45 00 00 	mov    rax,QWORD PTR [rip+0x45aa]        # 5ff0 <ehdr-0x31d0>
    1a46:	0f b7 40 38          	movzx  eax,WORD PTR [rax+0x38]
    1a4a:	0f b7 c0             	movzx  eax,ax
    1a4d:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
    1a50:	0f 8c 71 ff ff ff    	jl     19c7 <load_elfso+0x1b3>
        }
        /*
        似乎有的系统支持单个段的重定位。但是这样在有些重定位方式下，尤其是跨段的相对地址调用来说，这会带来大难度，
        所以这里先整体移动。*/
        if (!chkmmap(base, tot_sz)) {
    1a56:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
    1a5a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1a5e:	48 89 d6             	mov    rsi,rdx
    1a61:	48 89 c7             	mov    rdi,rax
    1a64:	e8 47 f6 ff ff       	call   10b0 <chkmmap@plt>
    1a69:	85 c0                	test   eax,eax
    1a6b:	75 6f                	jne    1adc <load_elfso+0x2c8>
            //原来的地方已经被映射
            //需要重定位
            //找到另一块大小符合的连续虚拟内存，然后返回首地址（不映射，下面手动映射）
            reloc_flag     = 2;
    1a6d:	c7 85 e4 fe ff ff 02 	mov    DWORD PTR [rbp-0x11c],0x2
    1a74:	00 00 00 
            off_t new_base = base + 4096;
    1a77:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1a7b:	48 05 00 10 00 00    	add    rax,0x1000
    1a81:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            while (!chkmmap(new_base, tot_sz) && new_base < KNL_BASE) {
    1a85:	eb 08                	jmp    1a8f <load_elfso+0x27b>
                new_base += 4096;
    1a87:	48 81 45 d0 00 10 00 	add    QWORD PTR [rbp-0x30],0x1000
    1a8e:	00 
            while (!chkmmap(new_base, tot_sz) && new_base < KNL_BASE) {
    1a8f:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
    1a93:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    1a97:	48 89 d6             	mov    rsi,rdx
    1a9a:	48 89 c7             	mov    rdi,rax
    1a9d:	e8 0e f6 ff ff       	call   10b0 <chkmmap@plt>
    1aa2:	85 c0                	test   eax,eax
    1aa4:	75 10                	jne    1ab6 <load_elfso+0x2a2>
    1aa6:	48 b8 ff ff ff ff ff 	movabs rax,0xffff7fffffffffff
    1aad:	7f ff ff 
    1ab0:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
    1ab4:	76 d1                	jbe    1a87 <load_elfso+0x273>
            }
            if (new_base >= KNL_BASE) {
    1ab6:	48 b8 ff ff ff ff ff 	movabs rax,0xffff7fffffffffff
    1abd:	7f ff ff 
    1ac0:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
    1ac4:	76 0a                	jbe    1ad0 <load_elfso+0x2bc>
                return -ENOMEM;
    1ac6:	b8 cf ff ff ff       	mov    eax,0xffffffcf
    1acb:	e9 1d 0a 00 00       	jmp    24ed <load_elfso+0xcd9>
            }
            offset = new_base - base;
    1ad0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    1ad4:	48 2b 45 e8          	sub    rax,QWORD PTR [rbp-0x18]
    1ad8:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        }
    }


    module* mod      = 0;
    1adc:	48 c7 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],0x0
    1ae3:	00 00 00 00 
    int     elfid    = reg_module();
    1ae7:	b8 00 00 00 00       	mov    eax,0x0
    1aec:	e8 0b 11 00 00       	call   2bfc <reg_module>
    1af1:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
    mod              = modules + elfid;
    1af7:	8b 85 d4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x12c]
    1afd:	48 63 d0             	movsxd rdx,eax
    1b00:	48 89 d0             	mov    rax,rdx
    1b03:	48 01 c0             	add    rax,rax
    1b06:	48 01 d0             	add    rax,rdx
    1b09:	48 c1 e0 05          	shl    rax,0x5
    1b0d:	48 89 c2             	mov    rdx,rax
    1b10:	48 8b 05 c1 44 00 00 	mov    rax,QWORD PTR [rip+0x44c1]        # 5fd8 <modules-0x1c8>
    1b17:	48 01 d0             	add    rax,rdx
    1b1a:	48 89 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rax
    mod->type        = ehdr.e_type;
    1b21:	48 8b 05 c8 44 00 00 	mov    rax,QWORD PTR [rip+0x44c8]        # 5ff0 <ehdr-0x31d0>
    1b28:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
    1b2c:	0f b7 d0             	movzx  edx,ax
    1b2f:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1b36:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    mod->load_offset = offset;
    1b3a:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1b41:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    1b45:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    mod->base        = base + offset;
    1b49:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    1b4d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b51:	48 01 c2             	add    rdx,rax
    1b54:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1b5b:	48 89 10             	mov    QWORD PTR [rax],rdx
    mod->p_shdrs     = base + offset + ehdr.e_shoff;
    1b5e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    1b62:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b66:	48 01 c2             	add    rdx,rax
    1b69:	48 8b 05 80 44 00 00 	mov    rax,QWORD PTR [rip+0x4480]        # 5ff0 <ehdr-0x31d0>
    1b70:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    1b74:	48 01 c2             	add    rdx,rax
    1b77:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1b7e:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx

    //找dynamic段
    struct Elf64_Shdr* dynamic  = 0;
    1b82:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
    1b89:	00 
    off_t*             got      = 0;
    1b8a:	48 c7 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],0x0
    1b91:	00 00 00 00 
    size_t             got_size = 0;
    1b95:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
    1b9c:	00 

    for (int i = 0; i < ehdr.e_shnum; i++) {
    1b9d:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
    1ba4:	e9 83 00 00 00       	jmp    1c2c <load_elfso+0x418>
        if (sh[i].sh_type == SHT_DYNSYM) {
    1ba9:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
    1bac:	48 98                	cdqe   
    1bae:	48 c1 e0 06          	shl    rax,0x6
    1bb2:	48 89 c2             	mov    rdx,rax
    1bb5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1bbc:	48 01 d0             	add    rax,rdx
    1bbf:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1bc2:	83 f8 0b             	cmp    eax,0xb
    1bc5:	75 27                	jne    1bee <load_elfso+0x3da>
            mod->s_symtabsz = sh[i].sh_size;
    1bc7:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
    1bca:	48 98                	cdqe   
    1bcc:	48 c1 e0 06          	shl    rax,0x6
    1bd0:	48 89 c2             	mov    rdx,rax
    1bd3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1bda:	48 01 d0             	add    rax,rdx
    1bdd:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
    1be1:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1be8:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    1bec:	eb 3a                	jmp    1c28 <load_elfso+0x414>
        }
        else if (sh[i].sh_type == SHT_DYNAMIC) {
    1bee:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
    1bf1:	48 98                	cdqe   
    1bf3:	48 c1 e0 06          	shl    rax,0x6
    1bf7:	48 89 c2             	mov    rdx,rax
    1bfa:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1c01:	48 01 d0             	add    rax,rdx
    1c04:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1c07:	83 f8 06             	cmp    eax,0x6
    1c0a:	75 1c                	jne    1c28 <load_elfso+0x414>
            dynamic = sh + i;
    1c0c:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
    1c0f:	48 98                	cdqe   
    1c11:	48 c1 e0 06          	shl    rax,0x6
    1c15:	48 89 c2             	mov    rdx,rax
    1c18:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1c1f:	48 01 d0             	add    rax,rdx
    1c22:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            break;
    1c26:	eb 1b                	jmp    1c43 <load_elfso+0x42f>
    for (int i = 0; i < ehdr.e_shnum; i++) {
    1c28:	83 45 bc 01          	add    DWORD PTR [rbp-0x44],0x1
    1c2c:	48 8b 05 bd 43 00 00 	mov    rax,QWORD PTR [rip+0x43bd]        # 5ff0 <ehdr-0x31d0>
    1c33:	0f b7 40 3c          	movzx  eax,WORD PTR [rax+0x3c]
    1c37:	0f b7 c0             	movzx  eax,ax
    1c3a:	39 45 bc             	cmp    DWORD PTR [rbp-0x44],eax
    1c3d:	0f 8c 66 ff ff ff    	jl     1ba9 <load_elfso+0x395>
        }
    }
    //程序占用的最高地址，这里就是堆开始分配的地方
    off_t max_allocated = 0;
    1c43:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
    1c4a:	00 
    for (int i = 0; i < entn; i++) {
    1c4b:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
    1c52:	e9 12 01 00 00       	jmp    1d69 <load_elfso+0x555>
        //加载段
        if (ph->p_type == PT_LOAD) {
    1c57:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c5b:	8b 00                	mov    eax,DWORD PTR [rax]
    1c5d:	83 f8 01             	cmp    eax,0x1
    1c60:	0f 85 fa 00 00 00    	jne    1d60 <load_elfso+0x54c>
            unsigned long off  = ph->p_offset;
    1c66:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c6a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1c6e:	48 89 85 a0 fe ff ff 	mov    QWORD PTR [rbp-0x160],rax
            unsigned long fs   = ph->p_filesz;
    1c75:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c79:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    1c7d:	48 89 85 98 fe ff ff 	mov    QWORD PTR [rbp-0x168],rax
            size_t        ms   = ph->p_memsz;
    1c84:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c88:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    1c8c:	48 89 85 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],rax
            char*         vptr = (char*)ph->p_vaddr + offset;
    1c93:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c97:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    1c9b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1c9f:	48 01 d0             	add    rax,rdx
    1ca2:	48 89 85 88 fe ff ff 	mov    QWORD PTR [rbp-0x178],rax
            if (max_allocated < vptr + ms)
    1ca9:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
    1cb0:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
    1cb7:	48 01 c2             	add    rdx,rax
    1cba:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    1cbe:	48 39 c2             	cmp    rdx,rax
    1cc1:	76 15                	jbe    1cd8 <load_elfso+0x4c4>
                max_allocated = vptr + ms;
    1cc3:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
    1cca:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
    1cd1:	48 01 d0             	add    rax,rdx
    1cd4:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
            if (off == 0) {
    1cd8:	48 83 bd a0 fe ff ff 	cmp    QWORD PTR [rbp-0x160],0x0
    1cdf:	00 
    1ce0:	75 12                	jne    1cf4 <load_elfso+0x4e0>
                mod->header = vptr;
    1ce2:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
    1ce9:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1cf0:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
            }
            //先映射好内存，访问时再分配内存
            int attr = PROT_READ;
    1cf4:	c7 45 a8 01 00 00 00 	mov    DWORD PTR [rbp-0x58],0x1
            if ((ph->p_flags & PF_W))
    1cfb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1cff:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1d02:	83 e0 02             	and    eax,0x2
    1d05:	85 c0                	test   eax,eax
    1d07:	74 04                	je     1d0d <load_elfso+0x4f9>
                attr |= PROT_WRITE;
    1d09:	83 4d a8 02          	or     DWORD PTR [rbp-0x58],0x2
            if ((ph->p_flags & PF_X)) {
    1d0d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1d11:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1d14:	83 e0 01             	and    eax,0x1
    1d17:	85 c0                	test   eax,eax
    1d19:	74 04                	je     1d1f <load_elfso+0x50b>
                attr |= PROT_EXEC;
    1d1b:	83 4d a8 04          	or     DWORD PTR [rbp-0x58],0x4
            }
            if (mmap(vptr, ms, attr, MAP_FIXED | MAP_PRIVATE, fildes, off) == -1)
    1d1f:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
    1d26:	8b 8d 7c fd ff ff    	mov    ecx,DWORD PTR [rbp-0x284]
    1d2c:	8b 55 a8             	mov    edx,DWORD PTR [rbp-0x58]
    1d2f:	48 8b b5 90 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x170]
    1d36:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
    1d3d:	49 89 f9             	mov    r9,rdi
    1d40:	41 89 c8             	mov    r8d,ecx
    1d43:	b9 03 00 00 00       	mov    ecx,0x3
    1d48:	48 89 c7             	mov    rdi,rax
    1d4b:	e8 00 f3 ff ff       	call   1050 <mmap@plt>
    1d50:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
    1d54:	75 0a                	jne    1d60 <load_elfso+0x54c>
                return -1;   //加载失败
    1d56:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1d5b:	e9 8d 07 00 00       	jmp    24ed <load_elfso+0xcd9>
        }
        ph++;
    1d60:	48 83 45 f8 38       	add    QWORD PTR [rbp-0x8],0x38
    for (int i = 0; i < entn; i++) {
    1d65:	83 45 ac 01          	add    DWORD PTR [rbp-0x54],0x1
    1d69:	0f b7 85 fe fe ff ff 	movzx  eax,WORD PTR [rbp-0x102]
    1d70:	39 45 ac             	cmp    DWORD PTR [rbp-0x54],eax
    1d73:	0f 8c de fe ff ff    	jl     1c57 <load_elfso+0x443>
    }
    if (dynamic) {
    1d79:	48 83 7d c8 00       	cmp    QWORD PTR [rbp-0x38],0x0
    1d7e:	0f 84 62 07 00 00    	je     24e6 <load_elfso+0xcd2>
        void*      needed_nameoff[32];
        int        t_needed = 0;
    1d84:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
        char*      dynstr   = 0;
    1d8b:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    1d92:	00 
        Elf64_Dyn* dyn      = dynamic->sh_addr + offset;
    1d93:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    1d97:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    1d9b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1d9f:	48 01 d0             	add    rax,rdx
    1da2:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
        size_t     relsz = 0, relentsz = 0;
    1da9:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
    1db0:	00 
    1db1:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
    1db8:	00 
        size_t     relasz = 0, relaentsz = 0;
    1db9:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
    1dc0:	00 
    1dc1:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
    1dc8:	00 00 00 00 
        size_t     jmprelsz = 0, jmprelaentsz = 0;
    1dcc:	48 c7 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],0x0
    1dd3:	00 00 00 00 
    1dd7:	48 c7 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],0x0
    1dde:	00 00 00 00 
        off_t      relptr = 0, relaptr = 0, jmprelptr = 0;
    1de2:	48 c7 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],0x0
    1de9:	00 00 00 00 
    1ded:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
    1df4:	00 00 00 00 
    1df8:	48 c7 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],0x0
    1dff:	00 00 00 00 
        int        pltrel = 0, bind_now = 0;
    1e03:	c7 85 4c ff ff ff 00 	mov    DWORD PTR [rbp-0xb4],0x0
    1e0a:	00 00 00 
    1e0d:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x0
    1e14:	00 00 00 
        int (*init)()     = 0;
    1e17:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x0
    1e1e:	00 00 00 00 
        size_t init_arrsz = 0;
    1e22:	48 c7 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],0x0
    1e29:	00 00 00 00 
        mod->p_dynamic    = dynamic;
    1e2d:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    1e31:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1e38:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
        //这里一堆获取函数之后实现细节
        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    1e3c:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
    1e43:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
    1e4a:	eb 3f                	jmp    1e8b <load_elfso+0x677>
            if (p->d_tag == DT_STRTAB) {
    1e4c:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1e53:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1e56:	48 83 f8 05          	cmp    rax,0x5
    1e5a:	75 27                	jne    1e83 <load_elfso+0x66f>
                dynstr        = p->d_un.d_ptr + offset;
    1e5c:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1e63:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1e67:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1e6b:	48 01 d0             	add    rax,rdx
    1e6e:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
                mod->p_strtab = dynstr;
    1e72:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
    1e76:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1e7d:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
                break;
    1e81:	eb 17                	jmp    1e9a <load_elfso+0x686>
        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    1e83:	48 83 85 30 ff ff ff 	add    QWORD PTR [rbp-0xd0],0x10
    1e8a:	10 
    1e8b:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1e92:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1e95:	48 85 c0             	test   rax,rax
    1e98:	75 b2                	jne    1e4c <load_elfso+0x638>
            }
        }
        if (!dynstr) {
    1e9a:	48 83 7d 98 00       	cmp    QWORD PTR [rbp-0x68],0x0
    1e9f:	75 0a                	jne    1eab <load_elfso+0x697>
            return -1;
    1ea1:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1ea6:	e9 42 06 00 00       	jmp    24ed <load_elfso+0xcd9>
        }

        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    1eab:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
    1eb2:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
    1eb9:	e9 17 03 00 00       	jmp    21d5 <load_elfso+0x9c1>
            switch (p->d_tag) {
    1ebe:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    1ec5:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1ec8:	48 83 f8 1b          	cmp    rax,0x1b
    1ecc:	0f 87 fa 02 00 00    	ja     21cc <load_elfso+0x9b8>
    1ed2:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    1ed9:	00 
    1eda:	48 8d 05 8f 21 00 00 	lea    rax,[rip+0x218f]        # 4070 <chkmmap+0x290>
    1ee1:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    1ee4:	48 98                	cdqe   
    1ee6:	48 8d 15 83 21 00 00 	lea    rdx,[rip+0x2183]        # 4070 <chkmmap+0x290>
    1eed:	48 01 d0             	add    rax,rdx
    1ef0:	3e ff e0             	notrack jmp rax
            case DT_NEEDED:
                //不查错了
                needed_nameoff[t_needed++] = p->d_un.d_val + dynstr;
    1ef3:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    1efa:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
    1efe:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
    1f01:	8d 50 01             	lea    edx,[rax+0x1]
    1f04:	89 55 a4             	mov    DWORD PTR [rbp-0x5c],edx
    1f07:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
    1f0b:	48 01 ca             	add    rdx,rcx
    1f0e:	48 98                	cdqe   
    1f10:	48 89 94 c5 80 fd ff 	mov    QWORD PTR [rbp+rax*8-0x280],rdx
    1f17:	ff 
                break;
    1f18:	e9 b0 02 00 00       	jmp    21cd <load_elfso+0x9b9>
            case DT_PLTGOT:
                got = p->d_un.d_ptr + offset;
    1f1d:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    1f24:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1f28:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1f2c:	48 01 d0             	add    rax,rdx
    1f2f:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax

                //赋值为dl的运行时重定位函数
                got[2] = dl_runtime_resolve;
    1f36:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    1f3d:	48 83 c0 10          	add    rax,0x10
    1f41:	48 8d 15 2d 09 00 00 	lea    rdx,[rip+0x92d]        # 2875 <dl_runtime_resolve>
    1f48:	48 89 10             	mov    QWORD PTR [rax],rdx
                //填入模块id
                got[1] = mod - modules;
    1f4b:	48 8b 05 86 40 00 00 	mov    rax,QWORD PTR [rip+0x4086]        # 5fd8 <modules-0x1c8>
    1f52:	48 89 c2             	mov    rdx,rax
    1f55:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1f5c:	48 29 d0             	sub    rax,rdx
    1f5f:	48 c1 f8 05          	sar    rax,0x5
    1f63:	48 89 c2             	mov    rdx,rax
    1f66:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
    1f6d:	aa aa aa 
    1f70:	48 0f af c2          	imul   rax,rdx
    1f74:	48 89 c2             	mov    rdx,rax
    1f77:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    1f7e:	48 83 c0 08          	add    rax,0x8
    1f82:	48 89 10             	mov    QWORD PTR [rax],rdx
                got[0] += offset;   // 0th项存着.dynamic的地址
    1f85:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    1f8c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    1f8f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1f93:	48 01 c2             	add    rdx,rax
    1f96:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    1f9d:	48 89 10             	mov    QWORD PTR [rax],rdx
                mod->p_got = got;
    1fa0:	48 8b 95 c8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x138]
    1fa7:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1fae:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
                //这里需要把got表里面的地址先偏移offset，因为plt里面jmp到plt0要用到
                for (int i = 0; i < ehdr.e_shnum; i++) {
    1fb2:	c7 85 24 ff ff ff 00 	mov    DWORD PTR [rbp-0xdc],0x0
    1fb9:	00 00 00 
    1fbc:	eb 57                	jmp    2015 <load_elfso+0x801>
                    if (sh[i].sh_addr == p->d_un.d_ptr) {
    1fbe:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
    1fc4:	48 98                	cdqe   
    1fc6:	48 c1 e0 06          	shl    rax,0x6
    1fca:	48 89 c2             	mov    rdx,rax
    1fcd:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1fd4:	48 01 d0             	add    rax,rdx
    1fd7:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    1fdb:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    1fe2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1fe6:	48 39 c2             	cmp    rdx,rax
    1fe9:	75 23                	jne    200e <load_elfso+0x7fa>
                        //.got.plt表
                        got_size = sh[i].sh_size;
    1feb:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
    1ff1:	48 98                	cdqe   
    1ff3:	48 c1 e0 06          	shl    rax,0x6
    1ff7:	48 89 c2             	mov    rdx,rax
    1ffa:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    2001:	48 01 d0             	add    rax,rdx
    2004:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    2008:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
                        break;
    200c:	eb 1d                	jmp    202b <load_elfso+0x817>
                for (int i = 0; i < ehdr.e_shnum; i++) {
    200e:	83 85 24 ff ff ff 01 	add    DWORD PTR [rbp-0xdc],0x1
    2015:	48 8b 05 d4 3f 00 00 	mov    rax,QWORD PTR [rip+0x3fd4]        # 5ff0 <ehdr-0x31d0>
    201c:	0f b7 40 3c          	movzx  eax,WORD PTR [rax+0x3c]
    2020:	0f b7 c0             	movzx  eax,ax
    2023:	39 85 24 ff ff ff    	cmp    DWORD PTR [rbp-0xdc],eax
    2029:	7c 93                	jl     1fbe <load_elfso+0x7aa>
                    }
                }
                size_t nr_gotent = got_size / sizeof(off_t);
    202b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    202f:	48 c1 e8 03          	shr    rax,0x3
    2033:	48 89 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],rax
                for (int i = 3; i < nr_gotent; i++) {
    203a:	c7 85 20 ff ff ff 03 	mov    DWORD PTR [rbp-0xe0],0x3
    2041:	00 00 00 
    2044:	eb 48                	jmp    208e <load_elfso+0x87a>
                    got[i] += offset;
    2046:	8b 85 20 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe0]
    204c:	48 98                	cdqe   
    204e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
    2055:	00 
    2056:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    205d:	48 01 d0             	add    rax,rdx
    2060:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    2063:	8b 85 20 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe0]
    2069:	48 98                	cdqe   
    206b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
    2072:	00 
    2073:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    207a:	48 01 d0             	add    rax,rdx
    207d:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    2081:	48 01 ca             	add    rdx,rcx
    2084:	48 89 10             	mov    QWORD PTR [rax],rdx
                for (int i = 3; i < nr_gotent; i++) {
    2087:	83 85 20 ff ff ff 01 	add    DWORD PTR [rbp-0xe0],0x1
    208e:	8b 85 20 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe0]
    2094:	48 98                	cdqe   
    2096:	48 39 85 a8 fe ff ff 	cmp    QWORD PTR [rbp-0x158],rax
    209d:	77 a7                	ja     2046 <load_elfso+0x832>
                }
                break;
    209f:	e9 29 01 00 00       	jmp    21cd <load_elfso+0x9b9>
            case DT_SYMTAB: mod->p_symbol = p->d_un.d_ptr + offset; break;
    20a4:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    20ab:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    20af:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    20b3:	48 01 c2             	add    rdx,rax
    20b6:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    20bd:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    20c1:	e9 07 01 00 00       	jmp    21cd <load_elfso+0x9b9>
            case DT_PLTRELSZ: jmprelsz = p->d_un.d_val; break;
    20c6:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    20cd:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    20d1:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    20d8:	e9 f0 00 00 00       	jmp    21cd <load_elfso+0x9b9>
            case DT_RELSZ: relsz = p->d_un.d_val; break;
    20dd:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    20e4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    20e8:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    20ec:	e9 dc 00 00 00       	jmp    21cd <load_elfso+0x9b9>
            case DT_RELASZ: relasz = p->d_un.d_val; break;
    20f1:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    20f8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    20fc:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    2100:	e9 c8 00 00 00       	jmp    21cd <load_elfso+0x9b9>
            case DT_PLTREL: pltrel = p->d_un.d_val; break;
    2105:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    210c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2110:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
    2116:	e9 b2 00 00 00       	jmp    21cd <load_elfso+0x9b9>
            case DT_JMPREL:
                jmprelptr    = p->d_un.d_val;
    211b:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    2122:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2126:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
                mod->p_reloc = jmprelptr + offset;
    212d:	48 8b 95 50 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb0]
    2134:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2138:	48 01 c2             	add    rdx,rax
    213b:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    2142:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
                break;
    2146:	e9 82 00 00 00       	jmp    21cd <load_elfso+0x9b9>
            case DT_REL: relptr = p->d_un.d_ptr; break;
    214b:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    2152:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2156:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    215d:	eb 6e                	jmp    21cd <load_elfso+0x9b9>
            case DT_RELA: relaptr = p->d_un.d_ptr; break;
    215f:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    2166:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    216a:	48 89 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rax
    2171:	eb 5a                	jmp    21cd <load_elfso+0x9b9>
            case DT_RELENT: relentsz = p->d_un.d_val; break;
    2173:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    217a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    217e:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
    2182:	eb 49                	jmp    21cd <load_elfso+0x9b9>
            case DT_RELAENT: relaentsz = p->d_un.d_val; break;
    2184:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    218b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    218f:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    2196:	eb 35                	jmp    21cd <load_elfso+0x9b9>
            case DT_INIT_ARRAY: init = p->d_un.d_ptr; break;
    2198:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    219f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    21a3:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    21aa:	eb 21                	jmp    21cd <load_elfso+0x9b9>
            case DT_INIT_ARRAYSZ: init_arrsz = p->d_un.d_val; break;
    21ac:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    21b3:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    21b7:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
    21be:	eb 0d                	jmp    21cd <load_elfso+0x9b9>
            case DT_BIND_NOW: bind_now = 1; break;
    21c0:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
    21c7:	00 00 00 
    21ca:	eb 01                	jmp    21cd <load_elfso+0x9b9>
            default: break;
    21cc:	90                   	nop
        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    21cd:	48 83 85 28 ff ff ff 	add    QWORD PTR [rbp-0xd8],0x10
    21d4:	10 
    21d5:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    21dc:	48 8b 00             	mov    rax,QWORD PTR [rax]
    21df:	48 85 c0             	test   rax,rax
    21e2:	0f 85 d6 fc ff ff    	jne    1ebe <load_elfso+0x6aa>
            }
        }
        for (int i = 0; i < t_needed; i++) {
    21e8:	c7 85 1c ff ff ff 00 	mov    DWORD PTR [rbp-0xe4],0x0
    21ef:	00 00 00 
    21f2:	eb 5a                	jmp    224e <load_elfso+0xa3a>
            char* pathname = 0;
    21f4:	48 c7 85 b8 fe ff ff 	mov    QWORD PTR [rbp-0x148],0x0
    21fb:	00 00 00 00 
            int   so_fno   = 0;
    21ff:	c7 85 b4 fe ff ff 00 	mov    DWORD PTR [rbp-0x14c],0x0
    2206:	00 00 00 
            pathname       = needed_nameoff[i];
    2209:	8b 85 1c ff ff ff    	mov    eax,DWORD PTR [rbp-0xe4]
    220f:	48 98                	cdqe   
    2211:	48 8b 84 c5 80 fd ff 	mov    rax,QWORD PTR [rbp+rax*8-0x280]
    2218:	ff 
    2219:	48 89 85 b8 fe ff ff 	mov    QWORD PTR [rbp-0x148],rax
            so_fno         = open(pathname, O_EXEC);
    2220:	48 8b 85 b8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x148]
    2227:	be 00 10 00 00       	mov    esi,0x1000
    222c:	48 89 c7             	mov    rdi,rax
    222f:	e8 8c ee ff ff       	call   10c0 <open@plt>
    2234:	89 85 b4 fe ff ff    	mov    DWORD PTR [rbp-0x14c],eax
            load_elfso(so_fno);
    223a:	8b 85 b4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x14c]
    2240:	89 c7                	mov    edi,eax
    2242:	e8 cd f5 ff ff       	call   1814 <load_elfso>
        for (int i = 0; i < t_needed; i++) {
    2247:	83 85 1c ff ff ff 01 	add    DWORD PTR [rbp-0xe4],0x1
    224e:	8b 85 1c ff ff ff    	mov    eax,DWORD PTR [rbp-0xe4]
    2254:	3b 45 a4             	cmp    eax,DWORD PTR [rbp-0x5c]
    2257:	7c 9b                	jl     21f4 <load_elfso+0x9e0>
        }
        if (relptr && relentsz && relsz)   // REL
    2259:	48 83 bd 60 ff ff ff 	cmp    QWORD PTR [rbp-0xa0],0x0
    2260:	00 
    2261:	74 7d                	je     22e0 <load_elfso+0xacc>
    2263:	48 83 7d 88 00       	cmp    QWORD PTR [rbp-0x78],0x0
    2268:	74 76                	je     22e0 <load_elfso+0xacc>
    226a:	48 83 7d 90 00       	cmp    QWORD PTR [rbp-0x70],0x0
    226f:	74 6f                	je     22e0 <load_elfso+0xacc>
            for (int j = 0; j < relsz / relentsz; j++)
    2271:	c7 85 18 ff ff ff 00 	mov    DWORD PTR [rbp-0xe8],0x0
    2278:	00 00 00 
    227b:	eb 48                	jmp    22c5 <load_elfso+0xab1>
                fill_reloc(relptr + offset + j * relentsz, elfid, mod->p_symbol, 0);
    227d:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    2284:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    2288:	48 89 c2             	mov    rdx,rax
    228b:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
    2292:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2296:	48 01 c1             	add    rcx,rax
    2299:	8b 85 18 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe8]
    229f:	48 98                	cdqe   
    22a1:	48 0f af 45 88       	imul   rax,QWORD PTR [rbp-0x78]
    22a6:	48 01 c8             	add    rax,rcx
    22a9:	48 89 c7             	mov    rdi,rax
    22ac:	8b 85 d4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x12c]
    22b2:	b9 00 00 00 00       	mov    ecx,0x0
    22b7:	89 c6                	mov    esi,eax
    22b9:	e8 82 ed ff ff       	call   1040 <fill_reloc@plt>
            for (int j = 0; j < relsz / relentsz; j++)
    22be:	83 85 18 ff ff ff 01 	add    DWORD PTR [rbp-0xe8],0x1
    22c5:	8b 85 18 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe8]
    22cb:	48 63 c8             	movsxd rcx,eax
    22ce:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    22d2:	ba 00 00 00 00       	mov    edx,0x0
    22d7:	48 f7 75 88          	div    QWORD PTR [rbp-0x78]
    22db:	48 39 c1             	cmp    rcx,rax
    22de:	72 9d                	jb     227d <load_elfso+0xa69>
        if (relaptr && relaentsz && relasz)   // RELA
    22e0:	48 83 bd 58 ff ff ff 	cmp    QWORD PTR [rbp-0xa8],0x0
    22e7:	00 
    22e8:	0f 84 86 00 00 00    	je     2374 <load_elfso+0xb60>
    22ee:	48 83 bd 78 ff ff ff 	cmp    QWORD PTR [rbp-0x88],0x0
    22f5:	00 
    22f6:	74 7c                	je     2374 <load_elfso+0xb60>
    22f8:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
    22fd:	74 75                	je     2374 <load_elfso+0xb60>
            for (int j = 0; j < relasz / relaentsz; j++)
    22ff:	c7 85 14 ff ff ff 00 	mov    DWORD PTR [rbp-0xec],0x0
    2306:	00 00 00 
    2309:	eb 4b                	jmp    2356 <load_elfso+0xb42>
                fill_reloc(relaptr + offset + j * relaentsz, elfid, mod->p_symbol, 1);
    230b:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    2312:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    2316:	48 89 c2             	mov    rdx,rax
    2319:	48 8b 8d 58 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa8]
    2320:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2324:	48 01 c1             	add    rcx,rax
    2327:	8b 85 14 ff ff ff    	mov    eax,DWORD PTR [rbp-0xec]
    232d:	48 98                	cdqe   
    232f:	48 0f af 85 78 ff ff 	imul   rax,QWORD PTR [rbp-0x88]
    2336:	ff 
    2337:	48 01 c8             	add    rax,rcx
    233a:	48 89 c7             	mov    rdi,rax
    233d:	8b 85 d4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x12c]
    2343:	b9 01 00 00 00       	mov    ecx,0x1
    2348:	89 c6                	mov    esi,eax
    234a:	e8 f1 ec ff ff       	call   1040 <fill_reloc@plt>
            for (int j = 0; j < relasz / relaentsz; j++)
    234f:	83 85 14 ff ff ff 01 	add    DWORD PTR [rbp-0xec],0x1
    2356:	8b 85 14 ff ff ff    	mov    eax,DWORD PTR [rbp-0xec]
    235c:	48 63 c8             	movsxd rcx,eax
    235f:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
    2363:	ba 00 00 00 00       	mov    edx,0x0
    2368:	48 f7 b5 78 ff ff ff 	div    QWORD PTR [rbp-0x88]
    236f:	48 39 c1             	cmp    rcx,rax
    2372:	72 97                	jb     230b <load_elfso+0xaf7>
        if (pltrel == DT_REL) {
    2374:	83 bd 4c ff ff ff 11 	cmp    DWORD PTR [rbp-0xb4],0x11
    237b:	75 17                	jne    2394 <load_elfso+0xb80>
            jmprelaentsz = relentsz;
    237d:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
    2381:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
            pltrel       = 0;
    2388:	c7 85 4c ff ff ff 00 	mov    DWORD PTR [rbp-0xb4],0x0
    238f:	00 00 00 
    2392:	eb 18                	jmp    23ac <load_elfso+0xb98>
        }
        else {
            jmprelaentsz = relaentsz;
    2394:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
    239b:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
            pltrel       = 1;
    23a2:	c7 85 4c ff ff ff 01 	mov    DWORD PTR [rbp-0xb4],0x1
    23a9:	00 00 00 
        }
        if (bind_now && jmprelptr && jmprelaentsz && jmprelsz)   // PLTREL
    23ac:	83 bd 48 ff ff ff 00 	cmp    DWORD PTR [rbp-0xb8],0x0
    23b3:	0f 84 a4 00 00 00    	je     245d <load_elfso+0xc49>
    23b9:	48 83 bd 50 ff ff ff 	cmp    QWORD PTR [rbp-0xb0],0x0
    23c0:	00 
    23c1:	0f 84 96 00 00 00    	je     245d <load_elfso+0xc49>
    23c7:	48 83 bd 68 ff ff ff 	cmp    QWORD PTR [rbp-0x98],0x0
    23ce:	00 
    23cf:	0f 84 88 00 00 00    	je     245d <load_elfso+0xc49>
    23d5:	48 83 bd 70 ff ff ff 	cmp    QWORD PTR [rbp-0x90],0x0
    23dc:	00 
    23dd:	74 7e                	je     245d <load_elfso+0xc49>
            for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    23df:	c7 85 10 ff ff ff 00 	mov    DWORD PTR [rbp-0xf0],0x0
    23e6:	00 00 00 
    23e9:	eb 51                	jmp    243c <load_elfso+0xc28>
                fill_reloc(jmprelptr + offset + j * jmprelaentsz, elfid, mod->p_symbol, pltrel);
    23eb:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    23f2:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    23f6:	48 89 c6             	mov    rsi,rax
    23f9:	48 8b 95 50 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb0]
    2400:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2404:	48 01 c2             	add    rdx,rax
    2407:	8b 85 10 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf0]
    240d:	48 98                	cdqe   
    240f:	48 0f af 85 68 ff ff 	imul   rax,QWORD PTR [rbp-0x98]
    2416:	ff 
    2417:	48 01 d0             	add    rax,rdx
    241a:	48 89 c7             	mov    rdi,rax
    241d:	8b 95 4c ff ff ff    	mov    edx,DWORD PTR [rbp-0xb4]
    2423:	8b 85 d4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x12c]
    2429:	89 d1                	mov    ecx,edx
    242b:	48 89 f2             	mov    rdx,rsi
    242e:	89 c6                	mov    esi,eax
    2430:	e8 0b ec ff ff       	call   1040 <fill_reloc@plt>
            for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    2435:	83 85 10 ff ff ff 01 	add    DWORD PTR [rbp-0xf0],0x1
    243c:	8b 85 10 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf0]
    2442:	48 63 c8             	movsxd rcx,eax
    2445:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
    244c:	ba 00 00 00 00       	mov    edx,0x0
    2451:	48 f7 b5 68 ff ff ff 	div    QWORD PTR [rbp-0x98]
    2458:	48 39 c1             	cmp    rcx,rax
    245b:	72 8e                	jb     23eb <load_elfso+0xbd7>
        if (jmprelaentsz) {
    245d:	48 83 bd 68 ff ff ff 	cmp    QWORD PTR [rbp-0x98],0x0
    2464:	00 
    2465:	74 14                	je     247b <load_elfso+0xc67>
            mod->s_relentsz = jmprelaentsz;
    2467:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    246e:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
    2475:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
    2479:	eb 20                	jmp    249b <load_elfso+0xc87>
        }
        else {
            //编译器有的时候不给relasz或者relsz
            mod->s_relentsz = (pltrel ? sizeof(Elf64_Rela) : sizeof(Elf64_Rel));
    247b:	83 bd 4c ff ff ff 00 	cmp    DWORD PTR [rbp-0xb4],0x0
    2482:	74 07                	je     248b <load_elfso+0xc77>
    2484:	ba 18 00 00 00       	mov    edx,0x18
    2489:	eb 05                	jmp    2490 <load_elfso+0xc7c>
    248b:	ba 10 00 00 00       	mov    edx,0x10
    2490:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    2497:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
        }
        if (init) {
    249b:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
    24a2:	00 
    24a3:	74 41                	je     24e6 <load_elfso+0xcd2>
            //调用模块入口函数
            for (int i = 0; i < init_arrsz; i++) {
    24a5:	c7 85 0c ff ff ff 00 	mov    DWORD PTR [rbp-0xf4],0x0
    24ac:	00 00 00 
    24af:	eb 24                	jmp    24d5 <load_elfso+0xcc1>
                (init + i * 8)();
    24b1:	8b 85 0c ff ff ff    	mov    eax,DWORD PTR [rbp-0xf4]
    24b7:	c1 e0 03             	shl    eax,0x3
    24ba:	48 63 d0             	movsxd rdx,eax
    24bd:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
    24c4:	48 01 c2             	add    rdx,rax
    24c7:	b8 00 00 00 00       	mov    eax,0x0
    24cc:	ff d2                	call   rdx
            for (int i = 0; i < init_arrsz; i++) {
    24ce:	83 85 0c ff ff ff 01 	add    DWORD PTR [rbp-0xf4],0x1
    24d5:	8b 85 0c ff ff ff    	mov    eax,DWORD PTR [rbp-0xf4]
    24db:	48 98                	cdqe   
    24dd:	48 39 85 38 ff ff ff 	cmp    QWORD PTR [rbp-0xc8],rax
    24e4:	77 cb                	ja     24b1 <load_elfso+0xc9d>
            }
        }
    }

    return entry;
    24e6:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
}
    24ed:	c9                   	leave  
    24ee:	c3                   	ret    

00000000000024ef <get_sym_addr>:
//返回指定模块中指定索引的符号地址，已经计算了加载偏移。
static off_t get_sym_addr(unsigned long modid, unsigned long symi)
{
    24ef:	f3 0f 1e fa          	endbr64 
    24f3:	55                   	push   rbp
    24f4:	48 89 e5             	mov    rbp,rsp
    24f7:	48 83 ec 40          	sub    rsp,0x40
    24fb:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
    24ff:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
    struct Elf64_Sym* sym = modules[modid].p_symbol;
    2503:	48 8b 0d ce 3a 00 00 	mov    rcx,QWORD PTR [rip+0x3ace]        # 5fd8 <modules-0x1c8>
    250a:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    250e:	48 89 d0             	mov    rax,rdx
    2511:	48 01 c0             	add    rax,rax
    2514:	48 01 d0             	add    rax,rdx
    2517:	48 c1 e0 05          	shl    rax,0x5
    251b:	48 01 c8             	add    rax,rcx
    251e:	48 83 c0 28          	add    rax,0x28
    2522:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2525:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    sym += symi;
    2529:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
    252d:	48 89 d0             	mov    rax,rdx
    2530:	48 01 c0             	add    rax,rax
    2533:	48 01 d0             	add    rax,rdx
    2536:	48 c1 e0 03          	shl    rax,0x3
    253a:	48 01 45 e8          	add    QWORD PTR [rbp-0x18],rax
    if (sym->st_shndx == SHN_COMMON) {
        //还没分配空间的符号，需要分配空间，st_value表示地址对齐约束
    }
    off_t symaddr = 0;
    253e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    2545:	00 
    if (sym->st_shndx != SHN_UNDEF && sym->st_value)
    2546:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    254a:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
    254e:	66 85 c0             	test   ax,ax
    2551:	74 43                	je     2596 <get_sym_addr+0xa7>
    2553:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2557:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    255b:	48 85 c0             	test   rax,rax
    255e:	74 36                	je     2596 <get_sym_addr+0xa7>
        symaddr = sym->st_value + modules[modid].load_offset;
    2560:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2564:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
    2568:	48 8b 35 69 3a 00 00 	mov    rsi,QWORD PTR [rip+0x3a69]        # 5fd8 <modules-0x1c8>
    256f:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    2573:	48 89 d0             	mov    rax,rdx
    2576:	48 01 c0             	add    rax,rax
    2579:	48 01 d0             	add    rax,rdx
    257c:	48 c1 e0 05          	shl    rax,0x5
    2580:	48 01 f0             	add    rax,rsi
    2583:	48 83 c0 08          	add    rax,0x8
    2587:	48 8b 00             	mov    rax,QWORD PTR [rax]
    258a:	48 01 c8             	add    rax,rcx
    258d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    2591:	e9 12 02 00 00       	jmp    27a8 <get_sym_addr+0x2b9>
    else {
        //不在本模块，需要在别的模块符号表中寻找
        char* target_name = modules[modid].p_strtab + sym->st_name;
    2596:	48 8b 0d 3b 3a 00 00 	mov    rcx,QWORD PTR [rip+0x3a3b]        # 5fd8 <modules-0x1c8>
    259d:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    25a1:	48 89 d0             	mov    rax,rdx
    25a4:	48 01 c0             	add    rax,rax
    25a7:	48 01 d0             	add    rax,rdx
    25aa:	48 c1 e0 05          	shl    rax,0x5
    25ae:	48 01 c8             	add    rax,rcx
    25b1:	48 83 c0 40          	add    rax,0x40
    25b5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    25b8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    25bc:	8b 00                	mov    eax,DWORD PTR [rax]
    25be:	89 c0                	mov    eax,eax
    25c0:	48 01 d0             	add    rax,rdx
    25c3:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for (int i = 0; i < MAX_MODULES; i++) {
    25c7:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    25ce:	e9 cb 01 00 00       	jmp    279e <get_sym_addr+0x2af>
            if (modules[i].type == ET_NONE || i == modid)
    25d3:	48 8b 0d fe 39 00 00 	mov    rcx,QWORD PTR [rip+0x39fe]        # 5fd8 <modules-0x1c8>
    25da:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    25dd:	48 63 d0             	movsxd rdx,eax
    25e0:	48 89 d0             	mov    rax,rdx
    25e3:	48 01 c0             	add    rax,rax
    25e6:	48 01 d0             	add    rax,rdx
    25e9:	48 c1 e0 05          	shl    rax,0x5
    25ed:	48 01 c8             	add    rax,rcx
    25f0:	48 83 c0 18          	add    rax,0x18
    25f4:	48 8b 00             	mov    rax,QWORD PTR [rax]
    25f7:	48 85 c0             	test   rax,rax
    25fa:	0f 84 96 01 00 00    	je     2796 <get_sym_addr+0x2a7>
    2600:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    2603:	48 98                	cdqe   
    2605:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
    2609:	0f 84 87 01 00 00    	je     2796 <get_sym_addr+0x2a7>
                continue;
            sym = modules[i].p_symbol;
    260f:	48 8b 0d c2 39 00 00 	mov    rcx,QWORD PTR [rip+0x39c2]        # 5fd8 <modules-0x1c8>
    2616:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    2619:	48 63 d0             	movsxd rdx,eax
    261c:	48 89 d0             	mov    rax,rdx
    261f:	48 01 c0             	add    rax,rax
    2622:	48 01 d0             	add    rax,rdx
    2625:	48 c1 e0 05          	shl    rax,0x5
    2629:	48 01 c8             	add    rax,rcx
    262c:	48 83 c0 28          	add    rax,0x28
    2630:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2633:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            if (!sym)
    2637:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
    263c:	0f 84 57 01 00 00    	je     2799 <get_sym_addr+0x2aa>
                continue;
            for (int j = 0; j < modules[i].s_symtabsz / sizeof(struct Elf64_Sym); j++) {
    2642:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
    2649:	e9 ff 00 00 00       	jmp    274d <get_sym_addr+0x25e>
                //获取符号名称
                if (!sym[j].st_name)
    264e:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    2651:	48 63 d0             	movsxd rdx,eax
    2654:	48 89 d0             	mov    rax,rdx
    2657:	48 01 c0             	add    rax,rax
    265a:	48 01 d0             	add    rax,rdx
    265d:	48 c1 e0 03          	shl    rax,0x3
    2661:	48 89 c2             	mov    rdx,rax
    2664:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2668:	48 01 d0             	add    rax,rdx
    266b:	8b 00                	mov    eax,DWORD PTR [rax]
    266d:	85 c0                	test   eax,eax
    266f:	0f 84 d3 00 00 00    	je     2748 <get_sym_addr+0x259>
                    continue;
                char* symname = modules[i].p_strtab + sym[j].st_name;
    2675:	48 8b 0d 5c 39 00 00 	mov    rcx,QWORD PTR [rip+0x395c]        # 5fd8 <modules-0x1c8>
    267c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    267f:	48 63 d0             	movsxd rdx,eax
    2682:	48 89 d0             	mov    rax,rdx
    2685:	48 01 c0             	add    rax,rax
    2688:	48 01 d0             	add    rax,rdx
    268b:	48 c1 e0 05          	shl    rax,0x5
    268f:	48 01 c8             	add    rax,rcx
    2692:	48 83 c0 40          	add    rax,0x40
    2696:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    2699:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    269c:	48 63 d0             	movsxd rdx,eax
    269f:	48 89 d0             	mov    rax,rdx
    26a2:	48 01 c0             	add    rax,rax
    26a5:	48 01 d0             	add    rax,rdx
    26a8:	48 c1 e0 03          	shl    rax,0x3
    26ac:	48 89 c2             	mov    rdx,rax
    26af:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    26b3:	48 01 d0             	add    rax,rdx
    26b6:	8b 00                	mov    eax,DWORD PTR [rax]
    26b8:	89 c0                	mov    eax,eax
    26ba:	48 01 c8             	add    rax,rcx
    26bd:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
                if (sym[j].st_value && dlstrcmp(target_name, symname) == 0) {
    26c1:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    26c4:	48 63 d0             	movsxd rdx,eax
    26c7:	48 89 d0             	mov    rax,rdx
    26ca:	48 01 c0             	add    rax,rax
    26cd:	48 01 d0             	add    rax,rdx
    26d0:	48 c1 e0 03          	shl    rax,0x3
    26d4:	48 89 c2             	mov    rdx,rax
    26d7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    26db:	48 01 d0             	add    rax,rdx
    26de:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    26e2:	48 85 c0             	test   rax,rax
    26e5:	74 62                	je     2749 <get_sym_addr+0x25a>
    26e7:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
    26eb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    26ef:	48 89 d6             	mov    rsi,rdx
    26f2:	48 89 c7             	mov    rdi,rax
    26f5:	e8 86 e9 ff ff       	call   1080 <dlstrcmp@plt>
    26fa:	85 c0                	test   eax,eax
    26fc:	75 4b                	jne    2749 <get_sym_addr+0x25a>
                    return modules[i].load_offset + sym[j].st_value;
    26fe:	48 8b 0d d3 38 00 00 	mov    rcx,QWORD PTR [rip+0x38d3]        # 5fd8 <modules-0x1c8>
    2705:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    2708:	48 63 d0             	movsxd rdx,eax
    270b:	48 89 d0             	mov    rax,rdx
    270e:	48 01 c0             	add    rax,rax
    2711:	48 01 d0             	add    rax,rdx
    2714:	48 c1 e0 05          	shl    rax,0x5
    2718:	48 01 c8             	add    rax,rcx
    271b:	48 83 c0 08          	add    rax,0x8
    271f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    2722:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    2725:	48 63 d0             	movsxd rdx,eax
    2728:	48 89 d0             	mov    rax,rdx
    272b:	48 01 c0             	add    rax,rax
    272e:	48 01 d0             	add    rax,rdx
    2731:	48 c1 e0 03          	shl    rax,0x3
    2735:	48 89 c2             	mov    rdx,rax
    2738:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    273c:	48 01 d0             	add    rax,rdx
    273f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2743:	48 01 c8             	add    rax,rcx
    2746:	eb 64                	jmp    27ac <get_sym_addr+0x2bd>
                    continue;
    2748:	90                   	nop
            for (int j = 0; j < modules[i].s_symtabsz / sizeof(struct Elf64_Sym); j++) {
    2749:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
    274d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    2750:	48 63 c8             	movsxd rcx,eax
    2753:	48 8b 35 7e 38 00 00 	mov    rsi,QWORD PTR [rip+0x387e]        # 5fd8 <modules-0x1c8>
    275a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    275d:	48 63 d0             	movsxd rdx,eax
    2760:	48 89 d0             	mov    rax,rdx
    2763:	48 01 c0             	add    rax,rax
    2766:	48 01 d0             	add    rax,rdx
    2769:	48 c1 e0 05          	shl    rax,0x5
    276d:	48 01 f0             	add    rax,rsi
    2770:	48 83 c0 48          	add    rax,0x48
    2774:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2777:	48 ba ab aa aa aa aa 	movabs rdx,0xaaaaaaaaaaaaaaab
    277e:	aa aa aa 
    2781:	48 f7 e2             	mul    rdx
    2784:	48 89 d0             	mov    rax,rdx
    2787:	48 c1 e8 04          	shr    rax,0x4
    278b:	48 39 c1             	cmp    rcx,rax
    278e:	0f 82 ba fe ff ff    	jb     264e <get_sym_addr+0x15f>
    2794:	eb 04                	jmp    279a <get_sym_addr+0x2ab>
                continue;
    2796:	90                   	nop
    2797:	eb 01                	jmp    279a <get_sym_addr+0x2ab>
                continue;
    2799:	90                   	nop
        for (int i = 0; i < MAX_MODULES; i++) {
    279a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
    279e:	83 7d f4 7f          	cmp    DWORD PTR [rbp-0xc],0x7f
    27a2:	0f 8e 2b fe ff ff    	jle    25d3 <get_sym_addr+0xe4>
                }
            }
        }
    }
    return symaddr;
    27a8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
    27ac:	c9                   	leave  
    27ad:	c3                   	ret    

00000000000027ae <dlstrcmp>:
int dlstrcmp(char* src, char* dst)
{
    27ae:	f3 0f 1e fa          	endbr64 
    27b2:	55                   	push   rbp
    27b3:	48 89 e5             	mov    rbp,rsp
    27b6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    27ba:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while (*src++ && *dst++) {
    27be:	eb 2c                	jmp    27ec <dlstrcmp+0x3e>
        if (*src != *dst) {
    27c0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    27c4:	0f b6 10             	movzx  edx,BYTE PTR [rax]
    27c7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    27cb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    27ce:	38 c2                	cmp    dl,al
    27d0:	74 1a                	je     27ec <dlstrcmp+0x3e>
            return *src - *dst;
    27d2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    27d6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    27d9:	0f be d0             	movsx  edx,al
    27dc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    27e0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    27e3:	0f be c8             	movsx  ecx,al
    27e6:	89 d0                	mov    eax,edx
    27e8:	29 c8                	sub    eax,ecx
    27ea:	eb 2b                	jmp    2817 <dlstrcmp+0x69>
    while (*src++ && *dst++) {
    27ec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    27f0:	48 8d 50 01          	lea    rdx,[rax+0x1]
    27f4:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
    27f8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    27fb:	84 c0                	test   al,al
    27fd:	74 13                	je     2812 <dlstrcmp+0x64>
    27ff:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2803:	48 8d 50 01          	lea    rdx,[rax+0x1]
    2807:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    280b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    280e:	84 c0                	test   al,al
    2810:	75 ae                	jne    27c0 <dlstrcmp+0x12>
        }
    }
    return 0;
    2812:	b8 00 00 00 00       	mov    eax,0x0
}
    2817:	5d                   	pop    rbp
    2818:	c3                   	ret    

0000000000002819 <get_load_base>:
static off_t get_load_base(unsigned long modid)
{
    2819:	f3 0f 1e fa          	endbr64 
    281d:	55                   	push   rbp
    281e:	48 89 e5             	mov    rbp,rsp
    2821:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return modules[modid].base;
    2825:	48 8b 0d ac 37 00 00 	mov    rcx,QWORD PTR [rip+0x37ac]        # 5fd8 <modules-0x1c8>
    282c:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2830:	48 89 d0             	mov    rax,rdx
    2833:	48 01 c0             	add    rax,rax
    2836:	48 01 d0             	add    rax,rdx
    2839:	48 c1 e0 05          	shl    rax,0x5
    283d:	48 01 c8             	add    rax,rcx
    2840:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
    2843:	5d                   	pop    rbp
    2844:	c3                   	ret    

0000000000002845 <get_got>:
off_t get_got(unsigned long modid)
{
    2845:	f3 0f 1e fa          	endbr64 
    2849:	55                   	push   rbp
    284a:	48 89 e5             	mov    rbp,rsp
    284d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return modules[modid].p_got;
    2851:	48 8b 0d 80 37 00 00 	mov    rcx,QWORD PTR [rip+0x3780]        # 5fd8 <modules-0x1c8>
    2858:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    285c:	48 89 d0             	mov    rax,rdx
    285f:	48 01 c0             	add    rax,rax
    2862:	48 01 d0             	add    rax,rdx
    2865:	48 c1 e0 05          	shl    rax,0x5
    2869:	48 01 c8             	add    rax,rcx
    286c:	48 83 c0 30          	add    rax,0x30
    2870:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
    2873:	5d                   	pop    rbp
    2874:	c3                   	ret    

0000000000002875 <dl_runtime_resolve>:
static void dl_runtime_resolve()
{
    2875:	f3 0f 1e fa          	endbr64 
    2879:	55                   	push   rbp
    287a:	48 89 e5             	mov    rbp,rsp
    287d:	48 83 ec 40          	sub    rsp,0x40
    //需要先保存寄存器，里面可能保存了函数的参数
    __asm__ volatile("push %rdi\n push %rsi\n push %rcx\n push %rdx\n push %r8\n push %r9\n");
    2881:	57                   	push   rdi
    2882:	56                   	push   rsi
    2883:	51                   	push   rcx
    2884:	52                   	push   rdx
    2885:	41 50                	push   r8
    2887:	41 51                	push   r9
    //获取modid
    unsigned long long modid, rel_offset;
    __asm__ volatile("mov 8(%%rbp),%%rax\n mov %%rax,%0" : "=m"(modid));
    2889:	48 8b 45 08          	mov    rax,QWORD PTR [rbp+0x8]
    288d:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    __asm__ volatile("mov 16(%%rbp),%%rax\n mov %%rax,%0" : "=m"(rel_offset));
    2891:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
    2895:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

    //排除COPY项的影响，他们不算在索引内
    Elf64_Rel* rel_table = modules[modid].p_reloc;
    2899:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    289d:	48 8b 0d 34 37 00 00 	mov    rcx,QWORD PTR [rip+0x3734]        # 5fd8 <modules-0x1c8>
    28a4:	48 89 d0             	mov    rax,rdx
    28a7:	48 01 c0             	add    rax,rax
    28aa:	48 01 d0             	add    rax,rdx
    28ad:	48 c1 e0 05          	shl    rax,0x5
    28b1:	48 01 c8             	add    rax,rcx
    28b4:	48 83 c0 50          	add    rax,0x50
    28b8:	48 8b 00             	mov    rax,QWORD PTR [rax]
    28bb:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int        eff = 0, i = 0;
    28bf:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    28c6:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if (ELF64_R_TYPE(rel_table[0].r_info) == R_X86_64_COPY)   //第一项就是COPY
    28cd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    28d1:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    28d5:	89 c0                	mov    eax,eax
    28d7:	48 83 f8 05          	cmp    rax,0x5
    28db:	75 2d                	jne    290a <dl_runtime_resolve+0x95>
        i++;
    28dd:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
    for (; eff < rel_offset && i < 37268; i++) {
    28e1:	eb 27                	jmp    290a <dl_runtime_resolve+0x95>
        if (ELF64_R_TYPE(rel_table[i].r_info) != R_X86_64_COPY)
    28e3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
    28e6:	48 98                	cdqe   
    28e8:	48 c1 e0 04          	shl    rax,0x4
    28ec:	48 89 c2             	mov    rdx,rax
    28ef:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    28f3:	48 01 d0             	add    rax,rdx
    28f6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    28fa:	89 c0                	mov    eax,eax
    28fc:	48 83 f8 05          	cmp    rax,0x5
    2900:	74 04                	je     2906 <dl_runtime_resolve+0x91>
            eff++;
    2902:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for (; eff < rel_offset && i < 37268; i++) {
    2906:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
    290a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    290d:	48 63 d0             	movsxd rdx,eax
    2910:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    2914:	48 39 c2             	cmp    rdx,rax
    2917:	73 09                	jae    2922 <dl_runtime_resolve+0xad>
    2919:	81 7d f8 93 91 00 00 	cmp    DWORD PTR [rbp-0x8],0x9193
    2920:	7e c1                	jle    28e3 <dl_runtime_resolve+0x6e>
    }

    Elf64_Rel* rel     = i * modules[modid].s_relentsz + modules[modid].p_reloc;
    2922:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
    2925:	48 63 c8             	movsxd rcx,eax
    2928:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    292c:	48 8b 35 a5 36 00 00 	mov    rsi,QWORD PTR [rip+0x36a5]        # 5fd8 <modules-0x1c8>
    2933:	48 89 d0             	mov    rax,rdx
    2936:	48 01 c0             	add    rax,rax
    2939:	48 01 d0             	add    rax,rdx
    293c:	48 c1 e0 05          	shl    rax,0x5
    2940:	48 01 f0             	add    rax,rsi
    2943:	48 83 c0 58          	add    rax,0x58
    2947:	48 8b 00             	mov    rax,QWORD PTR [rax]
    294a:	48 0f af c8          	imul   rcx,rax
    294e:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    2952:	48 8b 35 7f 36 00 00 	mov    rsi,QWORD PTR [rip+0x367f]        # 5fd8 <modules-0x1c8>
    2959:	48 89 d0             	mov    rax,rdx
    295c:	48 01 c0             	add    rax,rax
    295f:	48 01 d0             	add    rax,rdx
    2962:	48 c1 e0 05          	shl    rax,0x5
    2966:	48 01 f0             	add    rax,rsi
    2969:	48 83 c0 50          	add    rax,0x50
    296d:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2970:	48 01 c8             	add    rax,rcx
    2973:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int        symi    = ELF64_R_SYM(rel->r_info);
    2977:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    297b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    297f:	48 c1 e8 20          	shr    rax,0x20
    2983:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    off_t      sym_off = get_sym_addr(modid, symi);
    2986:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
    2989:	48 63 d0             	movsxd rdx,eax
    298c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2990:	48 89 d6             	mov    rsi,rdx
    2993:	48 89 c7             	mov    rdi,rax
    2996:	e8 54 fb ff ff       	call   24ef <get_sym_addr>
    299b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    //必然是R_X86_64_JUMP_SLOT
    off_t* v_rel = rel->r_offset + modules[modid].load_offset;
    299f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    29a3:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    29a6:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    29aa:	48 8b 35 27 36 00 00 	mov    rsi,QWORD PTR [rip+0x3627]        # 5fd8 <modules-0x1c8>
    29b1:	48 89 d0             	mov    rax,rdx
    29b4:	48 01 c0             	add    rax,rax
    29b7:	48 01 d0             	add    rax,rdx
    29ba:	48 c1 e0 05          	shl    rax,0x5
    29be:	48 01 f0             	add    rax,rsi
    29c1:	48 83 c0 08          	add    rax,0x8
    29c5:	48 8b 00             	mov    rax,QWORD PTR [rax]
    29c8:	48 01 c8             	add    rax,rcx
    29cb:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    *v_rel       = sym_off;
    29cf:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
    29d3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    29d7:	48 89 10             	mov    QWORD PTR [rax],rdx

    //恢复原函数调用参数
    __asm__ volatile("pop %r9\n pop %r8\n pop %rdx\n pop %rcx\n pop %rsi\n pop %rdi\n");
    29da:	41 59                	pop    r9
    29dc:	41 58                	pop    r8
    29de:	5a                   	pop    rdx
    29df:	59                   	pop    rcx
    29e0:	5e                   	pop    rsi
    29e1:	5f                   	pop    rdi
    //重定位完毕，直接返回到目标地址
    __asm__ volatile("mov %0,%%rax\n leave\n add $16,%%rsp\n jmp *%%rax\n" ::"m"(sym_off));
    29e2:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    29e6:	c9                   	leave  
    29e7:	48 83 c4 10          	add    rsp,0x10
    29eb:	ff e0                	jmp    rax
}
    29ed:	90                   	nop
    29ee:	c9                   	leave  
    29ef:	c3                   	ret    

00000000000029f0 <fill_reloc>:

void fill_reloc(void* relp, int modid, void* shdrs, int rela)
{
    29f0:	f3 0f 1e fa          	endbr64 
    29f4:	55                   	push   rbp
    29f5:	48 89 e5             	mov    rbp,rsp
    29f8:	48 83 ec 50          	sub    rsp,0x50
    29fc:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
    2a00:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
    2a03:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    2a07:	89 4d c0             	mov    DWORD PTR [rbp-0x40],ecx
    Elf64_Rela* rel  = relp;
    2a0a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    2a0e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int         symi = ELF64_R_SYM(rel->r_info), type = ELF64_R_TYPE(rel->r_info);
    2a12:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2a16:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2a1a:	48 c1 e8 20          	shr    rax,0x20
    2a1e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    2a21:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2a25:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2a29:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    off_t       sym_off   = get_sym_addr(modid, symi);
    2a2c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    2a2f:	48 63 d0             	movsxd rdx,eax
    2a32:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    2a35:	48 98                	cdqe   
    2a37:	48 89 d6             	mov    rsi,rdx
    2a3a:	48 89 c7             	mov    rdi,rax
    2a3d:	e8 ad fa ff ff       	call   24ef <get_sym_addr>
    2a42:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    off_t       load_base = get_load_base(modid);
    2a46:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    2a49:	48 98                	cdqe   
    2a4b:	48 89 c7             	mov    rdi,rax
    2a4e:	e8 c6 fd ff ff       	call   2819 <get_load_base>
    2a53:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    off_t       got       = get_got(modid);
    2a57:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    2a5a:	48 98                	cdqe   
    2a5c:	48 89 c7             	mov    rdi,rax
    2a5f:	e8 bc e5 ff ff       	call   1020 <get_got@plt>
    2a64:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    //这里假定获取符号的地址是正确的，可以不修改符号表，而是通过记录模块整体加载地址，
    //来加上偏移量获取正确的符号地址
    off_t* v_rel = rel->r_offset + load_base;
    2a68:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2a6c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2a6f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2a73:	48 01 d0             	add    rax,rdx
    2a76:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    switch (type) {
    2a7a:	83 7d f0 0b          	cmp    DWORD PTR [rbp-0x10],0xb
    2a7e:	0f 87 45 01 00 00    	ja     2bc9 <fill_reloc+0x1d9>
    2a84:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    2a87:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    2a8e:	00 
    2a8f:	48 8d 05 4a 16 00 00 	lea    rax,[rip+0x164a]        # 40e0 <chkmmap+0x300>
    2a96:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    2a99:	48 98                	cdqe   
    2a9b:	48 8d 15 3e 16 00 00 	lea    rdx,[rip+0x163e]        # 40e0 <chkmmap+0x300>
    2aa2:	48 01 d0             	add    rax,rdx
    2aa5:	3e ff e0             	notrack jmp rax
    case R_X86_64_GLOB_DAT:
    case R_X86_64_JUMP_SLOT: *v_rel = sym_off; break;
    2aa8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2aac:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    2ab0:	48 89 10             	mov    QWORD PTR [rax],rdx
    2ab3:	e9 12 01 00 00       	jmp    2bca <fill_reloc+0x1da>
    case R_X86_64_RELATIVE:
        if (rela)
    2ab8:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    2abc:	74 1e                	je     2adc <fill_reloc+0xec>
            *v_rel = rel->r_addend + load_base;
    2abe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2ac2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2ac6:	48 89 c2             	mov    rdx,rax
    2ac9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2acd:	48 01 c2             	add    rdx,rax
    2ad0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2ad4:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += load_base;
        break;
    2ad7:	e9 ee 00 00 00       	jmp    2bca <fill_reloc+0x1da>
            *v_rel += load_base;
    2adc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2ae0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2ae3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2ae7:	48 01 c2             	add    rdx,rax
    2aea:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2aee:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2af1:	e9 d4 00 00 00       	jmp    2bca <fill_reloc+0x1da>
    case R_X86_64_GOTPC:
        if (rela)
    2af6:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    2afa:	74 28                	je     2b24 <fill_reloc+0x134>
            *v_rel = got + rel->r_addend - rel->r_offset;
    2afc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2b00:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2b04:	48 89 c2             	mov    rdx,rax
    2b07:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2b0b:	48 01 c2             	add    rdx,rax
    2b0e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2b12:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2b15:	48 29 c2             	sub    rdx,rax
    2b18:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b1c:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += got - (unsigned long long)rel;
        break;
    2b1f:	e9 a6 00 00 00       	jmp    2bca <fill_reloc+0x1da>
            *v_rel += got - (unsigned long long)rel;
    2b24:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b28:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2b2b:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
    2b2f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2b33:	48 29 c8             	sub    rax,rcx
    2b36:	48 01 c2             	add    rdx,rax
    2b39:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b3d:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2b40:	e9 85 00 00 00       	jmp    2bca <fill_reloc+0x1da>
    case R_X86_64_32S:
    case R_X86_64_64:
        if (rela)
    2b45:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    2b49:	74 17                	je     2b62 <fill_reloc+0x172>
            *v_rel += sym_off;
    2b4b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b4f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2b52:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2b56:	48 01 c2             	add    rdx,rax
    2b59:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b5d:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off;
        break;
    2b60:	eb 68                	jmp    2bca <fill_reloc+0x1da>
            *v_rel = rel->r_addend + sym_off;
    2b62:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2b66:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2b6a:	48 89 c2             	mov    rdx,rax
    2b6d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2b71:	48 01 c2             	add    rdx,rax
    2b74:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b78:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2b7b:	eb 4d                	jmp    2bca <fill_reloc+0x1da>
    case R_X86_64_PC32:
        if (rela)
    2b7d:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    2b81:	74 21                	je     2ba4 <fill_reloc+0x1b4>
            *v_rel += sym_off - rel->r_offset;
    2b83:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b87:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2b8a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2b8e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    2b91:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2b95:	48 29 c8             	sub    rax,rcx
    2b98:	48 01 c2             	add    rdx,rax
    2b9b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b9f:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
        break;
    2ba2:	eb 26                	jmp    2bca <fill_reloc+0x1da>
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
    2ba4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2ba8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2bac:	48 89 c2             	mov    rdx,rax
    2baf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2bb3:	48 01 c2             	add    rdx,rax
    2bb6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2bba:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2bbd:	48 29 c2             	sub    rdx,rax
    2bc0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2bc4:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2bc7:	eb 01                	jmp    2bca <fill_reloc+0x1da>
    default: break;
    2bc9:	90                   	nop
    }
}
    2bca:	90                   	nop
    2bcb:	c9                   	leave  
    2bcc:	c3                   	ret    

0000000000002bcd <set_symtab>:
void set_symtab(void* symtab, int modid)
{
    2bcd:	f3 0f 1e fa          	endbr64 
    2bd1:	55                   	push   rbp
    2bd2:	48 89 e5             	mov    rbp,rsp
    2bd5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    2bd9:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    if (modid >= MAX_SYMTABS)
    2bdc:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
    2be0:	7f 17                	jg     2bf9 <set_symtab+0x2c>
        return;
    symtabs[modid] = symtab;
    2be2:	48 8b 05 0f 34 00 00 	mov    rax,QWORD PTR [rip+0x340f]        # 5ff8 <symtabs-0xa8>
    2be9:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
    2bec:	48 63 d2             	movsxd rdx,edx
    2bef:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
    2bf3:	48 89 0c d0          	mov    QWORD PTR [rax+rdx*8],rcx
    2bf7:	eb 01                	jmp    2bfa <set_symtab+0x2d>
        return;
    2bf9:	90                   	nop
}
    2bfa:	5d                   	pop    rbp
    2bfb:	c3                   	ret    

0000000000002bfc <reg_module>:

static int reg_module()
{
    2bfc:	f3 0f 1e fa          	endbr64 
    2c00:	55                   	push   rbp
    2c01:	48 89 e5             	mov    rbp,rsp
    int i = 0;
    2c04:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for (; i < MAX_MODULES; i++) {
    2c0b:	eb 32                	jmp    2c3f <reg_module+0x43>
        if (modules[i].type == ET_NONE) {
    2c0d:	48 8b 0d c4 33 00 00 	mov    rcx,QWORD PTR [rip+0x33c4]        # 5fd8 <modules-0x1c8>
    2c14:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    2c17:	48 63 d0             	movsxd rdx,eax
    2c1a:	48 89 d0             	mov    rax,rdx
    2c1d:	48 01 c0             	add    rax,rax
    2c20:	48 01 d0             	add    rax,rdx
    2c23:	48 c1 e0 05          	shl    rax,0x5
    2c27:	48 01 c8             	add    rax,rcx
    2c2a:	48 83 c0 18          	add    rax,0x18
    2c2e:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2c31:	48 85 c0             	test   rax,rax
    2c34:	75 05                	jne    2c3b <reg_module+0x3f>
            return i;
    2c36:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    2c39:	eb 0f                	jmp    2c4a <reg_module+0x4e>
    for (; i < MAX_MODULES; i++) {
    2c3b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    2c3f:	83 7d fc 7f          	cmp    DWORD PTR [rbp-0x4],0x7f
    2c43:	7e c8                	jle    2c0d <reg_module+0x11>
        }
    }
    return -1;
    2c45:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
    2c4a:	5d                   	pop    rbp
    2c4b:	c3                   	ret    

0000000000002c4c <dl_init>:
static int dl_init(void* load_offset)
{
    2c4c:	f3 0f 1e fa          	endbr64 
    2c50:	55                   	push   rbp
    2c51:	48 89 e5             	mov    rbp,rsp
    2c54:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
    2c5b:	48 89 bd 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdi
    //自举，不能调用任何全局函数和使用任何全局变量，完成自身重定位
    Elf64_Ehdr*       ehdr = load_offset;
    2c62:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2c69:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    Elf64_Phdr*       ph   = ehdr->e_phoff;
    2c70:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
    2c77:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    2c7b:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    Elf64_Dyn*        dyn  = &_DYNAMIC;
    2c82:	48 8b 05 47 33 00 00 	mov    rax,QWORD PTR [rip+0x3347]        # 5fd0 <_DYNAMIC+0x120>
    2c89:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    struct Elf64_Sym* sym  = 0;
    2c90:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    2c97:	00 

    size_t              relsz = 0, relentsz = 0;
    2c98:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
    2c9f:	00 
    2ca0:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
    2ca7:	00 
    size_t              relasz = 0, relaentsz = 0;
    2ca8:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    2caf:	00 
    2cb0:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
    2cb7:	00 
    size_t              jmprelsz = 0, jmprelaentsz = 0;
    2cb8:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
    2cbf:	00 
    2cc0:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
    2cc7:	00 
    unsigned long long  relptr = 0, relaptr = 0, jmprelptr = 0;
    2cc8:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
    2ccf:	00 
    2cd0:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
    2cd7:	00 
    2cd8:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
    2cdf:	00 
    int                 pltrel = 0;
    2ce0:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
    unsigned long long* got    = 0;
    2ce7:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    2cee:	00 

    int bind_now = 0;
    2cef:	c7 45 9c 00 00 00 00 	mov    DWORD PTR [rbp-0x64],0x0
    for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    2cf6:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    2cfd:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    2d01:	e9 2a 01 00 00       	jmp    2e30 <dl_init+0x1e4>
        char* pathname = 0;
    2d06:	48 c7 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],0x0
    2d0d:	00 00 00 00 
        int   so_fno   = 0;
    2d11:	c7 85 5c ff ff ff 00 	mov    DWORD PTR [rbp-0xa4],0x0
    2d18:	00 00 00 
        switch (p->d_tag) {
    2d1b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2d1f:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2d22:	48 83 f8 18          	cmp    rax,0x18
    2d26:	0f 87 fe 00 00 00    	ja     2e2a <dl_init+0x1de>
    2d2c:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    2d33:	00 
    2d34:	48 8d 05 d5 13 00 00 	lea    rax,[rip+0x13d5]        # 4110 <chkmmap+0x330>
    2d3b:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    2d3e:	48 98                	cdqe   
    2d40:	48 8d 15 c9 13 00 00 	lea    rdx,[rip+0x13c9]        # 4110 <chkmmap+0x330>
    2d47:	48 01 d0             	add    rax,rdx
    2d4a:	3e ff e0             	notrack jmp rax
        case DT_PLTGOT:   //赋值为dl的运行时重定位函数
            got    = p->d_un.d_ptr + load_offset;
    2d4d:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2d51:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    2d55:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2d5c:	48 01 d0             	add    rax,rdx
    2d5f:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
            got[2] = dl_runtime_resolve;
    2d63:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    2d67:	48 83 c0 10          	add    rax,0x10
    2d6b:	48 8d 15 03 fb ff ff 	lea    rdx,[rip+0xfffffffffffffb03]        # 2875 <dl_runtime_resolve>
    2d72:	48 89 10             	mov    QWORD PTR [rax],rdx
            //填入模块id
            got[1] = 0;
    2d75:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    2d79:	48 83 c0 08          	add    rax,0x8
    2d7d:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            break;
    2d84:	e9 a2 00 00 00       	jmp    2e2b <dl_init+0x1df>
        case DT_SYMTAB: sym = p->d_un.d_ptr + load_offset; break;
    2d89:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2d8d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    2d91:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2d98:	48 01 d0             	add    rax,rdx
    2d9b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    2d9f:	e9 87 00 00 00       	jmp    2e2b <dl_init+0x1df>
        case DT_PLTRELSZ: jmprelsz = p->d_un.d_val; break;
    2da4:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2da8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2dac:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    2db0:	eb 79                	jmp    2e2b <dl_init+0x1df>
        case DT_RELSZ: relsz = p->d_un.d_val; break;
    2db2:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2db6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2dba:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    2dbe:	eb 6b                	jmp    2e2b <dl_init+0x1df>
        case DT_RELASZ: relasz = p->d_un.d_val; break;
    2dc0:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2dc4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2dc8:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    2dcc:	eb 5d                	jmp    2e2b <dl_init+0x1df>
        case DT_PLTREL: pltrel = p->d_un.d_val; break;
    2dce:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2dd2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2dd6:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    2dd9:	eb 50                	jmp    2e2b <dl_init+0x1df>
        case DT_JMPREL: jmprelptr = p->d_un.d_val; break;
    2ddb:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2ddf:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2de3:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
    2de7:	eb 42                	jmp    2e2b <dl_init+0x1df>
        case DT_REL: relptr = p->d_un.d_ptr; break;
    2de9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2ded:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2df1:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    2df5:	eb 34                	jmp    2e2b <dl_init+0x1df>
        case DT_RELA: relaptr = p->d_un.d_ptr; break;
    2df7:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2dfb:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2dff:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    2e03:	eb 26                	jmp    2e2b <dl_init+0x1df>
        case DT_RELENT: relentsz = p->d_un.d_val; break;
    2e05:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2e09:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2e0d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    2e11:	eb 18                	jmp    2e2b <dl_init+0x1df>
        case DT_RELAENT: relaentsz = p->d_un.d_val; break;
    2e13:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2e17:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2e1b:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    2e1f:	eb 0a                	jmp    2e2b <dl_init+0x1df>
        case DT_BIND_NOW: bind_now = 1; break;
    2e21:	c7 45 9c 01 00 00 00 	mov    DWORD PTR [rbp-0x64],0x1
    2e28:	eb 01                	jmp    2e2b <dl_init+0x1df>
        default: break;
    2e2a:	90                   	nop
    for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    2e2b:	48 83 45 90 10       	add    QWORD PTR [rbp-0x70],0x10
    2e30:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2e34:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2e37:	48 85 c0             	test   rax,rax
    2e3a:	0f 85 c6 fe ff ff    	jne    2d06 <dl_init+0xba>
        }
    }
    if (relptr && relentsz && relsz)   // REL
    2e40:	48 83 7d c0 00       	cmp    QWORD PTR [rbp-0x40],0x0
    2e45:	74 72                	je     2eb9 <dl_init+0x26d>
    2e47:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
    2e4c:	74 6b                	je     2eb9 <dl_init+0x26d>
    2e4e:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
    2e53:	74 64                	je     2eb9 <dl_init+0x26d>
        for (int j = 0; j < relsz / relentsz; j++)
    2e55:	c7 45 8c 00 00 00 00 	mov    DWORD PTR [rbp-0x74],0x0
    2e5c:	eb 43                	jmp    2ea1 <dl_init+0x255>
            init_fill_reloc(relptr + load_offset + j * relentsz, load_offset, sym, 0, got);
    2e5e:	48 8b 4d a0          	mov    rcx,QWORD PTR [rbp-0x60]
    2e62:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2e69:	8b 55 8c             	mov    edx,DWORD PTR [rbp-0x74]
    2e6c:	48 63 d2             	movsxd rdx,edx
    2e6f:	48 89 d6             	mov    rsi,rdx
    2e72:	48 0f af 75 e8       	imul   rsi,QWORD PTR [rbp-0x18]
    2e77:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
    2e7b:	48 01 d6             	add    rsi,rdx
    2e7e:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2e85:	48 8d 3c 16          	lea    rdi,[rsi+rdx*1]
    2e89:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2e8d:	49 89 c8             	mov    r8,rcx
    2e90:	b9 00 00 00 00       	mov    ecx,0x0
    2e95:	48 89 c6             	mov    rsi,rax
    2e98:	e8 0c 02 00 00       	call   30a9 <init_fill_reloc>
        for (int j = 0; j < relsz / relentsz; j++)
    2e9d:	83 45 8c 01          	add    DWORD PTR [rbp-0x74],0x1
    2ea1:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    2ea4:	48 63 c8             	movsxd rcx,eax
    2ea7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2eab:	ba 00 00 00 00       	mov    edx,0x0
    2eb0:	48 f7 75 e8          	div    QWORD PTR [rbp-0x18]
    2eb4:	48 39 c1             	cmp    rcx,rax
    2eb7:	72 a5                	jb     2e5e <dl_init+0x212>
    if (relaptr && relaentsz && relasz)   // RELA
    2eb9:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
    2ebe:	74 72                	je     2f32 <dl_init+0x2e6>
    2ec0:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
    2ec5:	74 6b                	je     2f32 <dl_init+0x2e6>
    2ec7:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
    2ecc:	74 64                	je     2f32 <dl_init+0x2e6>
        for (int j = 0; j < relasz / relaentsz; j++)
    2ece:	c7 45 88 00 00 00 00 	mov    DWORD PTR [rbp-0x78],0x0
    2ed5:	eb 43                	jmp    2f1a <dl_init+0x2ce>
            init_fill_reloc(relaptr + load_offset + j * relaentsz, load_offset, sym, 1, got);
    2ed7:	48 8b 4d a0          	mov    rcx,QWORD PTR [rbp-0x60]
    2edb:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2ee2:	8b 55 88             	mov    edx,DWORD PTR [rbp-0x78]
    2ee5:	48 63 d2             	movsxd rdx,edx
    2ee8:	48 89 d6             	mov    rsi,rdx
    2eeb:	48 0f af 75 d8       	imul   rsi,QWORD PTR [rbp-0x28]
    2ef0:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
    2ef4:	48 01 d6             	add    rsi,rdx
    2ef7:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2efe:	48 8d 3c 16          	lea    rdi,[rsi+rdx*1]
    2f02:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2f06:	49 89 c8             	mov    r8,rcx
    2f09:	b9 01 00 00 00       	mov    ecx,0x1
    2f0e:	48 89 c6             	mov    rsi,rax
    2f11:	e8 93 01 00 00       	call   30a9 <init_fill_reloc>
        for (int j = 0; j < relasz / relaentsz; j++)
    2f16:	83 45 88 01          	add    DWORD PTR [rbp-0x78],0x1
    2f1a:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    2f1d:	48 63 c8             	movsxd rcx,eax
    2f20:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2f24:	ba 00 00 00 00       	mov    edx,0x0
    2f29:	48 f7 75 d8          	div    QWORD PTR [rbp-0x28]
    2f2d:	48 39 c1             	cmp    rcx,rax
    2f30:	72 a5                	jb     2ed7 <dl_init+0x28b>
    if (pltrel == DT_REL)
    2f32:	83 7d ac 11          	cmp    DWORD PTR [rbp-0x54],0x11
    2f36:	75 11                	jne    2f49 <dl_init+0x2fd>
        jmprelaentsz = relentsz, pltrel = 0;
    2f38:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2f3c:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    2f40:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
    2f47:	eb 0f                	jmp    2f58 <dl_init+0x30c>
    else
        jmprelaentsz = relaentsz, pltrel = 1;
    2f49:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2f4d:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    2f51:	c7 45 ac 01 00 00 00 	mov    DWORD PTR [rbp-0x54],0x1
    if (bind_now && jmprelptr && jmprelaentsz && jmprelsz)   // PLTREL
    2f58:	83 7d 9c 00          	cmp    DWORD PTR [rbp-0x64],0x0
    2f5c:	74 77                	je     2fd5 <dl_init+0x389>
    2f5e:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
    2f63:	74 70                	je     2fd5 <dl_init+0x389>
    2f65:	48 83 7d c8 00       	cmp    QWORD PTR [rbp-0x38],0x0
    2f6a:	74 69                	je     2fd5 <dl_init+0x389>
    2f6c:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
    2f71:	74 62                	je     2fd5 <dl_init+0x389>
        for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    2f73:	c7 45 84 00 00 00 00 	mov    DWORD PTR [rbp-0x7c],0x0
    2f7a:	eb 41                	jmp    2fbd <dl_init+0x371>
            init_fill_reloc(
    2f7c:	48 8b 75 a0          	mov    rsi,QWORD PTR [rbp-0x60]
    2f80:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
                jmprelptr + load_offset + j * jmprelaentsz, load_offset, sym, pltrel, got);
    2f87:	8b 55 84             	mov    edx,DWORD PTR [rbp-0x7c]
    2f8a:	48 63 d2             	movsxd rdx,edx
    2f8d:	48 89 d1             	mov    rcx,rdx
    2f90:	48 0f af 4d c8       	imul   rcx,QWORD PTR [rbp-0x38]
    2f95:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
    2f99:	48 01 d1             	add    rcx,rdx
            init_fill_reloc(
    2f9c:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2fa3:	48 8d 3c 11          	lea    rdi,[rcx+rdx*1]
    2fa7:	8b 4d ac             	mov    ecx,DWORD PTR [rbp-0x54]
    2faa:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2fae:	49 89 f0             	mov    r8,rsi
    2fb1:	48 89 c6             	mov    rsi,rax
    2fb4:	e8 f0 00 00 00       	call   30a9 <init_fill_reloc>
        for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    2fb9:	83 45 84 01          	add    DWORD PTR [rbp-0x7c],0x1
    2fbd:	8b 45 84             	mov    eax,DWORD PTR [rbp-0x7c]
    2fc0:	48 63 c8             	movsxd rcx,eax
    2fc3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2fc7:	ba 00 00 00 00       	mov    edx,0x0
    2fcc:	48 f7 75 c8          	div    QWORD PTR [rbp-0x38]
    2fd0:	48 39 c1             	cmp    rcx,rax
    2fd3:	72 a7                	jb     2f7c <dl_init+0x330>
    //重定位完毕，可以使用全局变量和全局函数
    for (int i = 0; i < MAX_MODULES; i++) {
    2fd5:	c7 45 80 00 00 00 00 	mov    DWORD PTR [rbp-0x80],0x0
    2fdc:	eb 2c                	jmp    300a <dl_init+0x3be>
        modules[i].type = ET_NONE;
    2fde:	48 8b 0d f3 2f 00 00 	mov    rcx,QWORD PTR [rip+0x2ff3]        # 5fd8 <modules-0x1c8>
    2fe5:	8b 45 80             	mov    eax,DWORD PTR [rbp-0x80]
    2fe8:	48 63 d0             	movsxd rdx,eax
    2feb:	48 89 d0             	mov    rax,rdx
    2fee:	48 01 c0             	add    rax,rax
    2ff1:	48 01 d0             	add    rax,rdx
    2ff4:	48 c1 e0 05          	shl    rax,0x5
    2ff8:	48 01 c8             	add    rax,rcx
    2ffb:	48 83 c0 18          	add    rax,0x18
    2fff:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    for (int i = 0; i < MAX_MODULES; i++) {
    3006:	83 45 80 01          	add    DWORD PTR [rbp-0x80],0x1
    300a:	83 7d 80 7f          	cmp    DWORD PTR [rbp-0x80],0x7f
    300e:	7e ce                	jle    2fde <dl_init+0x392>
    }
    modules[0].p_symbol    = sym;
    3010:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    3014:	48 8b 05 bd 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fbd]        # 5fd8 <modules-0x1c8>
    301b:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    modules[0].load_offset = load_offset;
    301f:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    3026:	48 8b 05 ab 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fab]        # 5fd8 <modules-0x1c8>
    302d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    modules[0].base        = load_offset;
    3031:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    3038:	48 8b 05 99 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f99]        # 5fd8 <modules-0x1c8>
    303f:	48 89 10             	mov    QWORD PTR [rax],rdx
    modules[0].p_dynamic   = dyn;
    3042:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
    3049:	48 8b 05 88 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f88]        # 5fd8 <modules-0x1c8>
    3050:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    modules[0].p_got       = got;
    3054:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
    3058:	48 8b 05 79 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f79]        # 5fd8 <modules-0x1c8>
    305f:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    modules[0].type        = ET_DYN;
    3063:	48 8b 05 6e 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f6e]        # 5fd8 <modules-0x1c8>
    306a:	48 c7 40 18 03 00 00 	mov    QWORD PTR [rax+0x18],0x3
    3071:	00 
    modules[0].header      = load_offset;
    3072:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    3079:	48 8b 05 58 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f58]        # 5fd8 <modules-0x1c8>
    3080:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    modules[0].p_reloc     = jmprelptr;
    3084:	48 8b 05 4d 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f4d]        # 5fd8 <modules-0x1c8>
    308b:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
    308f:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    modules[0].s_relentsz  = jmprelaentsz;
    3093:	48 8b 05 3e 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f3e]        # 5fd8 <modules-0x1c8>
    309a:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    309e:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
    return 0;
    30a2:	b8 00 00 00 00       	mov    eax,0x0
}
    30a7:	c9                   	leave  
    30a8:	c3                   	ret    

00000000000030a9 <init_fill_reloc>:
//自举用的小重定位函数
static void init_fill_reloc(void* relp, unsigned long long load_base, void* symtab, int rela,
                            off_t igot)
{
    30a9:	f3 0f 1e fa          	endbr64 
    30ad:	55                   	push   rbp
    30ae:	48 89 e5             	mov    rbp,rsp
    30b1:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
    30b5:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
    30b9:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    30bd:	89 4d b4             	mov    DWORD PTR [rbp-0x4c],ecx
    30c0:	4c 89 45 a8          	mov    QWORD PTR [rbp-0x58],r8
    unsigned long long got  = igot + load_base;
    30c4:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
    30c8:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    30cc:	48 01 d0             	add    rax,rdx
    30cf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    Elf64_Rela*        rel  = relp;
    30d3:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    30d7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int                symi = ELF64_R_SYM(rel->r_info), type = ELF64_R_TYPE(rel->r_info);
    30db:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    30df:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    30e3:	48 c1 e8 20          	shr    rax,0x20
    30e7:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    30ea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    30ee:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    30f2:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    unsigned long long sym_off = (((struct Elf64_Sym*)symtab)[symi]).st_value;
    30f5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    30f8:	48 63 d0             	movsxd rdx,eax
    30fb:	48 89 d0             	mov    rax,rdx
    30fe:	48 01 c0             	add    rax,rax
    3101:	48 01 d0             	add    rax,rdx
    3104:	48 c1 e0 03          	shl    rax,0x3
    3108:	48 89 c2             	mov    rdx,rax
    310b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    310f:	48 01 d0             	add    rax,rdx
    3112:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    3116:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if (!sym_off) {
    311a:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
    311f:	0f 84 5a 01 00 00    	je     327f <init_fill_reloc+0x1d6>
        //外部符号
        return;
    }
    //这里假定获取符号的地址是正确的，可以不修改符号表，而是通过记录模块整体加载地址，
    //来加上偏移量获取正确的符号地址
    unsigned long long* v_rel = rel->r_offset;
    3125:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    3129:	48 8b 00             	mov    rax,QWORD PTR [rax]
    312c:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (type) {
    3130:	83 7d e8 0b          	cmp    DWORD PTR [rbp-0x18],0xb
    3134:	0f 87 48 01 00 00    	ja     3282 <init_fill_reloc+0x1d9>
    313a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
    313d:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    3144:	00 
    3145:	48 8d 05 28 10 00 00 	lea    rax,[rip+0x1028]        # 4174 <chkmmap+0x394>
    314c:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    314f:	48 98                	cdqe   
    3151:	48 8d 15 1c 10 00 00 	lea    rdx,[rip+0x101c]        # 4174 <chkmmap+0x394>
    3158:	48 01 d0             	add    rax,rdx
    315b:	3e ff e0             	notrack jmp rax
    case R_X86_64_GLOB_DAT:
    case R_X86_64_JUMP_SLOT: *v_rel = sym_off; break;
    315e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3162:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    3166:	48 89 10             	mov    QWORD PTR [rax],rdx
    3169:	e9 15 01 00 00       	jmp    3283 <init_fill_reloc+0x1da>
    case R_X86_64_RELATIVE:
        if (rela)
    316e:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    3172:	74 1e                	je     3192 <init_fill_reloc+0xe9>
            *v_rel = rel->r_addend + load_base;
    3174:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    3178:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    317c:	48 89 c2             	mov    rdx,rax
    317f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    3183:	48 01 c2             	add    rdx,rax
    3186:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    318a:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += load_base;
        break;
    318d:	e9 f1 00 00 00       	jmp    3283 <init_fill_reloc+0x1da>
            *v_rel += load_base;
    3192:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3196:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    3199:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    319d:	48 01 c2             	add    rdx,rax
    31a0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    31a4:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    31a7:	e9 d7 00 00 00       	jmp    3283 <init_fill_reloc+0x1da>
    case R_X86_64_GOTPC:
        if (rela)
    31ac:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    31b0:	74 28                	je     31da <init_fill_reloc+0x131>
            *v_rel = got + rel->r_addend - rel->r_offset;
    31b2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    31b6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    31ba:	48 89 c2             	mov    rdx,rax
    31bd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    31c1:	48 01 c2             	add    rdx,rax
    31c4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    31c8:	48 8b 00             	mov    rax,QWORD PTR [rax]
    31cb:	48 29 c2             	sub    rdx,rax
    31ce:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    31d2:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += got - (unsigned long long)rel;
        break;
    31d5:	e9 a9 00 00 00       	jmp    3283 <init_fill_reloc+0x1da>
            *v_rel += got - (unsigned long long)rel;
    31da:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    31de:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    31e1:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
    31e5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    31e9:	48 29 c8             	sub    rax,rcx
    31ec:	48 01 c2             	add    rdx,rax
    31ef:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    31f3:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    31f6:	e9 88 00 00 00       	jmp    3283 <init_fill_reloc+0x1da>
    case R_X86_64_32S:
    case R_X86_64_64:
        if (rela)
    31fb:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    31ff:	74 17                	je     3218 <init_fill_reloc+0x16f>
            *v_rel += sym_off;
    3201:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3205:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    3208:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    320c:	48 01 c2             	add    rdx,rax
    320f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3213:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off;
        break;
    3216:	eb 6b                	jmp    3283 <init_fill_reloc+0x1da>
            *v_rel = rel->r_addend + sym_off;
    3218:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    321c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    3220:	48 89 c2             	mov    rdx,rax
    3223:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    3227:	48 01 c2             	add    rdx,rax
    322a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    322e:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    3231:	eb 50                	jmp    3283 <init_fill_reloc+0x1da>
    case R_X86_64_PC32:
        if (rela)
    3233:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    3237:	74 21                	je     325a <init_fill_reloc+0x1b1>
            *v_rel += sym_off - rel->r_offset;
    3239:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    323d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    3240:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    3244:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    3247:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    324b:	48 29 c8             	sub    rax,rcx
    324e:	48 01 c2             	add    rdx,rax
    3251:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3255:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
        break;
    3258:	eb 29                	jmp    3283 <init_fill_reloc+0x1da>
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
    325a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    325e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    3262:	48 89 c2             	mov    rdx,rax
    3265:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    3269:	48 01 c2             	add    rdx,rax
    326c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    3270:	48 8b 00             	mov    rax,QWORD PTR [rax]
    3273:	48 29 c2             	sub    rdx,rax
    3276:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    327a:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    327d:	eb 04                	jmp    3283 <init_fill_reloc+0x1da>
        return;
    327f:	90                   	nop
    3280:	eb 01                	jmp    3283 <init_fill_reloc+0x1da>
    default: break;
    3282:	90                   	nop
    }
}
    3283:	5d                   	pop    rbp
    3284:	c3                   	ret    

0000000000003285 <lookup_strtab>:
/**
    @brief 查找字符串。
 */
static char* lookup_strtab(char* strtab, int index)
{
    3285:	f3 0f 1e fa          	endbr64 
    3289:	55                   	push   rbp
    328a:	48 89 e5             	mov    rbp,rsp
    328d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    3291:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    char* ptr = strtab;
    3294:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    3298:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for (int i = 0; i < index; i++) {
    329c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    32a3:	eb 18                	jmp    32bd <lookup_strtab+0x38>
        while (*ptr++)
    32a5:	90                   	nop
    32a6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    32aa:	48 8d 50 01          	lea    rdx,[rax+0x1]
    32ae:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
    32b2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    32b5:	84 c0                	test   al,al
    32b7:	75 ed                	jne    32a6 <lookup_strtab+0x21>
    for (int i = 0; i < index; i++) {
    32b9:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
    32bd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    32c0:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
    32c3:	7c e0                	jl     32a5 <lookup_strtab+0x20>
            ;
    }
    32c5:	90                   	nop
    32c6:	5d                   	pop    rbp
    32c7:	c3                   	ret    
    32c8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    32cf:	00 

00000000000032d0 <max>:
	return a < b ? b : a;
    32d0:	48 39 f7             	cmp    rdi,rsi
    32d3:	48 89 f0             	mov    rax,rsi
    32d6:	48 0f 43 c7          	cmovae rax,rdi
}
    32da:	c3                   	ret    
    32db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000032e0 <align>:
	return (val + alignment - 1) & ~(alignment - 1);
    32e0:	48 8d 44 3e ff       	lea    rax,[rsi+rdi*1-0x1]
    32e5:	48 f7 de             	neg    rsi
    32e8:	48 21 f0             	and    rax,rsi
}
    32eb:	c3                   	ret    
    32ec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000000032f0 <granules_to_chunk_kind>:
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
    32f0:	31 c0                	xor    eax,eax
    32f2:	83 ff 01             	cmp    edi,0x1
    32f5:	76 4e                	jbe    3345 <granules_to_chunk_kind+0x55>
    32f7:	b8 01 00 00 00       	mov    eax,0x1
    32fc:	83 ff 02             	cmp    edi,0x2
    32ff:	74 44                	je     3345 <granules_to_chunk_kind+0x55>
    3301:	83 ff 03             	cmp    edi,0x3
    3304:	74 5a                	je     3360 <granules_to_chunk_kind+0x70>
    3306:	83 ff 04             	cmp    edi,0x4
    3309:	74 45                	je     3350 <granules_to_chunk_kind+0x60>
    330b:	83 ff 05             	cmp    edi,0x5
    330e:	74 60                	je     3370 <granules_to_chunk_kind+0x80>
    3310:	83 ff 06             	cmp    edi,0x6
    3313:	74 2b                	je     3340 <granules_to_chunk_kind+0x50>
    3315:	b8 06 00 00 00       	mov    eax,0x6
    331a:	83 ff 08             	cmp    edi,0x8
    331d:	76 26                	jbe    3345 <granules_to_chunk_kind+0x55>
    331f:	b8 07 00 00 00       	mov    eax,0x7
    3324:	83 ff 0a             	cmp    edi,0xa
    3327:	76 1c                	jbe    3345 <granules_to_chunk_kind+0x55>
    3329:	b8 08 00 00 00       	mov    eax,0x8
    332e:	83 ff 10             	cmp    edi,0x10
    3331:	76 12                	jbe    3345 <granules_to_chunk_kind+0x55>
    3333:	83 ff 21             	cmp    edi,0x21
    3336:	19 c0                	sbb    eax,eax
    3338:	24 0a                	and    al,0xa
    333a:	05 ff 00 00 00       	add    eax,0xff
    333f:	c3                   	ret    
    3340:	b8 05 00 00 00       	mov    eax,0x5
}
    3345:	c3                   	ret    
    3346:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    334d:	00 00 00 
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
    3350:	b8 03 00 00 00       	mov    eax,0x3
    3355:	c3                   	ret    
    3356:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    335d:	00 00 00 
    3360:	b8 02 00 00 00       	mov    eax,0x2
    3365:	c3                   	ret    
    3366:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    336d:	00 00 00 
    3370:	b8 04 00 00 00       	mov    eax,0x4
    3375:	c3                   	ret    
    3376:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    337d:	00 00 00 

0000000000003380 <chunk_kind_to_granules>:
{
    3380:	b8 ff ff ff ff       	mov    eax,0xffffffff
    3385:	83 ff 09             	cmp    edi,0x9
    3388:	77 0c                	ja     3396 <chunk_kind_to_granules+0x16>
    338a:	89 ff                	mov    edi,edi
    338c:	48 8d 05 2d 0e 00 00 	lea    rax,[rip+0xe2d]        # 41c0 <CSWTCH.34>
    3393:	8b 04 b8             	mov    eax,DWORD PTR [rax+rdi*4]
}
    3396:	c3                   	ret    
    3397:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    339e:	00 00 

00000000000033a0 <get_page>:
	return (struct page*)(char*)(((uintptr_t)ptr) & ~PAGE_MASK);
    33a0:	48 89 f8             	mov    rax,rdi
    33a3:	66 31 c0             	xor    ax,ax
}
    33a6:	c3                   	ret    
    33a7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    33ae:	00 00 

00000000000033b0 <get_chunk_index>:
	return (((uintptr_t)ptr) & PAGE_MASK) / CHUNK_SIZE;
    33b0:	89 f8                	mov    eax,edi
    33b2:	0f b6 c4             	movzx  eax,ah
}
    33b5:	c3                   	ret    
    33b6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    33bd:	00 00 00 

00000000000033c0 <get_large_object_payload>:
	return ((char*)obj) + LARGE_OBJECT_HEADER_SIZE;
    33c0:	48 8d 47 10          	lea    rax,[rdi+0x10]
}
    33c4:	c3                   	ret    
    33c5:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    33cc:	00 00 00 
    33cf:	90                   	nop

00000000000033d0 <get_large_object>:
	return (struct large_object*)(((char*)ptr) - LARGE_OBJECT_HEADER_SIZE);
    33d0:	48 8d 47 f0          	lea    rax,[rdi-0x10]
}
    33d4:	c3                   	ret    
    33d5:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    33dc:	00 00 00 
    33df:	90                   	nop

00000000000033e0 <allocate_chunk>:
	page->header.chunk_kinds[idx] = kind;
    33e0:	89 f6                	mov    esi,esi
    33e2:	88 14 37             	mov    BYTE PTR [rdi+rsi*1],dl
	return page->chunks[idx].data;
    33e5:	48 c1 e6 08          	shl    rsi,0x8
    33e9:	48 8d 04 37          	lea    rax,[rdi+rsi*1]
}
    33ed:	c3                   	ret    
    33ee:	66 90                	xchg   ax,ax

00000000000033f0 <maybe_repurpose_single_chunk_large_objects_head>:
	if(large_objects->size < CHUNK_SIZE)
    33f0:	48 8b 0d 19 5e 00 00 	mov    rcx,QWORD PTR [rip+0x5e19]        # 9210 <large_objects>
    33f7:	48 81 79 08 ff 00 00 	cmp    QWORD PTR [rcx+0x8],0xff
    33fe:	00 
    33ff:	76 07                	jbe    3408 <maybe_repurpose_single_chunk_large_objects_head+0x18>
}
    3401:	c3                   	ret    
    3402:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		unsigned idx = get_chunk_index(large_objects);
    3408:	48 89 cf             	mov    rdi,rcx
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
    340b:	ba 09 00 00 00       	mov    edx,0x9
		unsigned idx = get_chunk_index(large_objects);
    3410:	e8 9b ff ff ff       	call   33b0 <get_chunk_index>
    3415:	89 c6                	mov    esi,eax
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
    3417:	e8 84 ff ff ff       	call   33a0 <get_page>
    341c:	48 89 c7             	mov    rdi,rax
    341f:	e8 bc ff ff ff       	call   33e0 <allocate_chunk>
		large_objects = large_objects->next;
    3424:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
    3427:	48 89 15 e2 5d 00 00 	mov    QWORD PTR [rip+0x5de2],rdx        # 9210 <large_objects>
		head->next = small_object_freelists[GRANULES_32];
    342e:	48 8b 15 33 5e 00 00 	mov    rdx,QWORD PTR [rip+0x5e33]        # 9268 <small_object_freelists+0x48>
    3435:	48 89 10             	mov    QWORD PTR [rax],rdx
		small_object_freelists[GRANULES_32] = head;
    3438:	48 89 05 29 5e 00 00 	mov    QWORD PTR [rip+0x5e29],rax        # 9268 <small_object_freelists+0x48>
}
    343f:	c3                   	ret    

0000000000003440 <size_to_granules>:
	return (size + GRANULE_SIZE - 1) >> GRANULE_SIZE_LOG_2;
    3440:	48 8d 47 07          	lea    rax,[rdi+0x7]
    3444:	48 c1 e8 03          	shr    rax,0x3
}
    3448:	c3                   	ret    
    3449:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000003450 <maybe_merge_free_large_object>:
{
    3450:	53                   	push   rbx
	struct large_object* obj = *prev;
    3451:	4c 8b 1f             	mov    r11,QWORD PTR [rdi]
{
    3454:	49 89 f9             	mov    r9,rdi
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
    3457:	48 8d 1d b2 5d 00 00 	lea    rbx,[rip+0x5db2]        # 9210 <large_objects>
		char* end = get_large_object_payload(obj) + obj->size;
    345e:	4c 89 df             	mov    rdi,r11
    3461:	e8 5a ff ff ff       	call   33c0 <get_large_object_payload>
    3466:	4d 8b 43 08          	mov    r8,QWORD PTR [r11+0x8]
    346a:	49 89 c2             	mov    r10,rax
    346d:	0f 1f 00             	nop    DWORD PTR [rax]
    3470:	4b 8d 14 02          	lea    rdx,[r10+r8*1]
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
    3474:	be 00 01 00 00       	mov    esi,0x100
    3479:	48 89 d7             	mov    rdi,rdx
    347c:	e8 5f fe ff ff       	call   32e0 <align>
    3481:	48 39 c2             	cmp    rdx,rax
    3484:	0f 85 66 dc ff ff    	jne    10f0 <maybe_merge_free_large_object.cold>
		unsigned chunk = get_chunk_index(end);
    348a:	e8 21 ff ff ff       	call   33b0 <get_chunk_index>
    348f:	89 c1                	mov    ecx,eax
		if(chunk < FIRST_ALLOCATABLE_CHUNK)
    3491:	85 c9                	test   ecx,ecx
    3493:	74 53                	je     34e8 <maybe_merge_free_large_object+0x98>
		struct page* page = get_page(end);
    3495:	e8 06 ff ff ff       	call   33a0 <get_page>
		if(page->header.chunk_kinds[chunk] != FREE_LARGE_OBJECT)
    349a:	80 3c 08 fe          	cmp    BYTE PTR [rax+rcx*1],0xfe
    349e:	75 48                	jne    34e8 <maybe_merge_free_large_object+0x98>
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
    34a0:	48 8b 05 69 5d 00 00 	mov    rax,QWORD PTR [rip+0x5d69]        # 9210 <large_objects>
			ASSERT(walk);
    34a7:	48 85 c0             	test   rax,rax
    34aa:	0f 84 40 dc ff ff    	je     10f0 <maybe_merge_free_large_object.cold>
			if(walk == next)
    34b0:	48 39 c2             	cmp    rdx,rax
    34b3:	74 3b                	je     34f0 <maybe_merge_free_large_object+0xa0>
    34b5:	0f 1f 00             	nop    DWORD PTR [rax]
			walk = walk->next;
    34b8:	48 89 c1             	mov    rcx,rax
    34bb:	48 8b 00             	mov    rax,QWORD PTR [rax]
			ASSERT(walk);
    34be:	48 85 c0             	test   rax,rax
    34c1:	74 32                	je     34f5 <maybe_merge_free_large_object+0xa5>
			if(walk == next)
    34c3:	48 39 c2             	cmp    rdx,rax
    34c6:	75 f0                	jne    34b8 <maybe_merge_free_large_object+0x68>
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
    34c8:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
				if(prev == &walk->next)
    34cc:	4c 39 c8             	cmp    rax,r9
    34cf:	4c 0f 44 c9          	cmove  r9,rcx
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
    34d3:	4d 8d 44 10 10       	lea    r8,[r8+rdx*1+0x10]
				*prev_prev = walk->next;
    34d8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
    34db:	4d 89 43 08          	mov    QWORD PTR [r11+0x8],r8
				*prev_prev = walk->next;
    34df:	48 89 11             	mov    QWORD PTR [rcx],rdx
				if(prev == &walk->next)
    34e2:	eb 8c                	jmp    3470 <maybe_merge_free_large_object+0x20>
    34e4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
}
    34e8:	4c 89 c8             	mov    rax,r9
    34eb:	5b                   	pop    rbx
    34ec:	c3                   	ret    
    34ed:	0f 1f 00             	nop    DWORD PTR [rax]
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
    34f0:	48 89 d9             	mov    rcx,rbx
    34f3:	eb d3                	jmp    34c8 <maybe_merge_free_large_object+0x78>
    34f5:	e9 f6 db ff ff       	jmp    10f0 <maybe_merge_free_large_object.cold>
    34fa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000003500 <maybe_compact_free_large_objects>:
	if(pending_large_object_compact)
    3500:	8b 05 fe 5c 00 00    	mov    eax,DWORD PTR [rip+0x5cfe]        # 9204 <pending_large_object_compact>
    3506:	85 c0                	test   eax,eax
    3508:	74 2c                	je     3536 <maybe_compact_free_large_objects+0x36>
		while(*prev)
    350a:	48 83 3d fe 5c 00 00 	cmp    QWORD PTR [rip+0x5cfe],0x0        # 9210 <large_objects>
    3511:	00 
		pending_large_object_compact = 0;
    3512:	c7 05 e8 5c 00 00 00 	mov    DWORD PTR [rip+0x5ce8],0x0        # 9204 <pending_large_object_compact>
    3519:	00 00 00 
		while(*prev)
    351c:	74 18                	je     3536 <maybe_compact_free_large_objects+0x36>
		struct large_object** prev = &large_objects;
    351e:	48 8d 3d eb 5c 00 00 	lea    rdi,[rip+0x5ceb]        # 9210 <large_objects>
    3525:	0f 1f 00             	nop    DWORD PTR [rax]
			prev = &(*maybe_merge_free_large_object(prev))->next;
    3528:	e8 23 ff ff ff       	call   3450 <maybe_merge_free_large_object>
    352d:	48 8b 38             	mov    rdi,QWORD PTR [rax]
		while(*prev)
    3530:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
    3534:	75 f2                	jne    3528 <maybe_compact_free_large_objects+0x28>
}
    3536:	c3                   	ret    
    3537:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    353e:	00 00 

0000000000003540 <get_small_object_freelist>:
	ASSERT(kind < SMALL_OBJECT_CHUNK_KINDS);
    3540:	83 ff 09             	cmp    edi,0x9
    3543:	0f 87 a9 db ff ff    	ja     10f2 <get_small_object_freelist.cold>
	return &small_object_freelists[kind];
    3549:	89 ff                	mov    edi,edi
    354b:	48 8d 05 ce 5c 00 00 	lea    rax,[rip+0x5cce]        # 9220 <small_object_freelists>
    3552:	48 8d 04 f8          	lea    rax,[rax+rdi*8]
}
    3556:	c3                   	ret    
    3557:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    355e:	00 00 

0000000000003560 <free>:
	enum chunk_kind kind = granules_to_chunk_kind(granules);
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
}

void free(void* ptr)
{
    3560:	f3 0f 1e fa          	endbr64 
    3564:	49 89 f8             	mov    r8,rdi
	if(!ptr)
    3567:	48 85 ff             	test   rdi,rdi
    356a:	74 2a                	je     3596 <free+0x36>
		return;
	struct page* page = get_page(ptr);
    356c:	e8 2f fe ff ff       	call   33a0 <get_page>
    3571:	49 89 c1             	mov    r9,rax
	unsigned chunk = get_chunk_index(ptr);
    3574:	e8 37 fe ff ff       	call   33b0 <get_chunk_index>
    3579:	89 c6                	mov    esi,eax
	uint8_t kind = page->header.chunk_kinds[chunk];
    357b:	89 c0                	mov    eax,eax
    357d:	41 0f b6 3c 01       	movzx  edi,BYTE PTR [r9+rax*1]
	if(kind == LARGE_OBJECT)
    3582:	40 80 ff ff          	cmp    dil,0xff
    3586:	74 18                	je     35a0 <free+0x40>
		pending_large_object_compact = 1;
	}
	else
	{
		size_t granules = kind;
		struct freelist** loc = get_small_object_freelist(granules);
    3588:	e8 b3 ff ff ff       	call   3540 <get_small_object_freelist>
		struct freelist* obj = ptr;
		obj->next = *loc;
    358d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    3590:	49 89 10             	mov    QWORD PTR [r8],rdx
		*loc = obj;
    3593:	4c 89 00             	mov    QWORD PTR [rax],r8
	}
}
    3596:	c3                   	ret    
    3597:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    359e:	00 00 
		struct large_object* obj = get_large_object(ptr);
    35a0:	4c 89 c7             	mov    rdi,r8
    35a3:	e8 28 fe ff ff       	call   33d0 <get_large_object>
		obj->next = large_objects;
    35a8:	48 8b 15 61 5c 00 00 	mov    rdx,QWORD PTR [rip+0x5c61]        # 9210 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
    35af:	4c 89 cf             	mov    rdi,r9
		obj->next = large_objects;
    35b2:	48 89 10             	mov    QWORD PTR [rax],rdx
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
    35b5:	ba fe 00 00 00       	mov    edx,0xfe
		large_objects = obj;
    35ba:	48 89 05 4f 5c 00 00 	mov    QWORD PTR [rip+0x5c4f],rax        # 9210 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
    35c1:	e8 1a fe ff ff       	call   33e0 <allocate_chunk>
		pending_large_object_compact = 1;
    35c6:	c7 05 34 5c 00 00 01 	mov    DWORD PTR [rip+0x5c34],0x1        # 9204 <pending_large_object_compact>
    35cd:	00 00 00 
    35d0:	c3                   	ret    
    35d1:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    35d8:	00 00 00 
    35db:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000035e0 <heap_size_in_pages>:
int heap_size_in_pages()
{
    35e0:	f3 0f 1e fa          	endbr64 
    35e4:	48 83 ec 08          	sub    rsp,0x8
	return (int)sbrk(0) - __heap_base;
    35e8:	31 ff                	xor    edi,edi
    35ea:	e8 81 da ff ff       	call   1070 <sbrk@plt>
    35ef:	48 8b 15 f2 29 00 00 	mov    rdx,QWORD PTR [rip+0x29f2]        # 5fe8 <__heap_base-0x3288>
    35f6:	2b 02                	sub    eax,DWORD PTR [rdx]
    35f8:	48 83 c4 08          	add    rsp,0x8
    35fc:	c3                   	ret    
    35fd:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000003600 <allocate_pages.constprop.0>:
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
    3600:	41 55                	push   r13
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
    3602:	31 c0                	xor    eax,eax
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
    3604:	41 54                	push   r12
	size_t needed = payload_size + PAGE_HEADER_SIZE;
    3606:	4c 8d a7 00 01 00 00 	lea    r12,[rdi+0x100]
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
    360d:	55                   	push   rbp
    360e:	48 89 f5             	mov    rbp,rsi
    3611:	53                   	push   rbx
    3612:	48 83 ec 08          	sub    rsp,0x8
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
    3616:	e8 f5 d9 ff ff       	call   1010 <heap_size_in_pages@plt>
	if(!walloc_heap_size)
    361b:	48 8b 3d e6 5b 00 00 	mov    rdi,QWORD PTR [rip+0x5be6]        # 9208 <walloc_heap_size>
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
    3622:	c1 e0 10             	shl    eax,0x10
    3625:	48 63 d8             	movsxd rbx,eax
	if(!walloc_heap_size)
    3628:	48 85 ff             	test   rdi,rdi
    362b:	75 63                	jne    3690 <allocate_pages.constprop.0+0x90>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
    362d:	48 8b 3d b4 29 00 00 	mov    rdi,QWORD PTR [rip+0x29b4]        # 5fe8 <__heap_base-0x3288>
    3634:	be 00 00 01 00       	mov    esi,0x10000
    3639:	e8 a2 fc ff ff       	call   32e0 <align>
		walloc_heap_size = preallocated;
    363e:	48 89 1d c3 5b 00 00 	mov    QWORD PTR [rip+0x5bc3],rbx        # 9208 <walloc_heap_size>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
    3645:	49 89 c0             	mov    r8,rax
	if(preallocated < needed)
    3648:	49 39 dc             	cmp    r12,rbx
    364b:	0f 87 94 00 00 00    	ja     36e5 <allocate_pages.constprop.0+0xe5>
	ASSERT(size);
    3651:	48 85 db             	test   rbx,rbx
    3654:	0f 84 9a da ff ff    	je     10f4 <allocate_pages.constprop.0.cold>
	ASSERT_ALIGNED(size, PAGE_SIZE);
    365a:	be 00 00 01 00       	mov    esi,0x10000
    365f:	48 89 df             	mov    rdi,rbx
    3662:	e8 79 fc ff ff       	call   32e0 <align>
    3667:	48 39 c3             	cmp    rbx,rax
    366a:	0f 85 84 da ff ff    	jne    10f4 <allocate_pages.constprop.0.cold>
	*n_allocated = size / PAGE_SIZE;
    3670:	48 c1 eb 10          	shr    rbx,0x10
    3674:	48 89 5d 00          	mov    QWORD PTR [rbp+0x0],rbx
}
    3678:	48 83 c4 08          	add    rsp,0x8
    367c:	4c 89 c0             	mov    rax,r8
    367f:	5b                   	pop    rbx
    3680:	5d                   	pop    rbp
    3681:	41 5c                	pop    r12
    3683:	41 5d                	pop    r13
    3685:	c3                   	ret    
    3686:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    368d:	00 00 00 
	if(preallocated < needed)
    3690:	4d 85 e4             	test   r12,r12
    3693:	74 5e                	je     36f3 <allocate_pages.constprop.0+0xf3>
	uintptr_t preallocated = 0, grow = 0;
    3695:	45 31 ed             	xor    r13d,r13d
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
    3698:	4c 89 e6             	mov    rsi,r12
    369b:	48 d1 ef             	shr    rdi,1
    369e:	e8 2d fc ff ff       	call   32d0 <max>
    36a3:	be 00 00 01 00       	mov    esi,0x10000
    36a8:	48 89 c7             	mov    rdi,rax
    36ab:	e8 30 fc ff ff       	call   32e0 <align>
    36b0:	49 89 c4             	mov    r12,rax
		ASSERT(grow);
    36b3:	48 85 c0             	test   rax,rax
    36b6:	0f 84 38 da ff ff    	je     10f4 <allocate_pages.constprop.0.cold>
		if(sbrk(grow) == -1) // >> PAGE_SIZE_LOG_2
    36bc:	48 89 c7             	mov    rdi,rax
    36bf:	e8 ac d9 ff ff       	call   1070 <sbrk@plt>
    36c4:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
    36c8:	74 16                	je     36e0 <allocate_pages.constprop.0+0xe0>
	size_t size = grow + preallocated;
    36ca:	49 89 d8             	mov    r8,rbx
		walloc_heap_size += grow;
    36cd:	4c 01 25 34 5b 00 00 	add    QWORD PTR [rip+0x5b34],r12        # 9208 <walloc_heap_size>
	size_t size = grow + preallocated;
    36d4:	4b 8d 1c 2c          	lea    rbx,[r12+r13*1]
    36d8:	e9 74 ff ff ff       	jmp    3651 <allocate_pages.constprop.0+0x51>
    36dd:	0f 1f 00             	nop    DWORD PTR [rax]
			return NULL;
    36e0:	45 31 c0             	xor    r8d,r8d
    36e3:	eb 93                	jmp    3678 <allocate_pages.constprop.0+0x78>
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
    36e5:	49 29 dc             	sub    r12,rbx
    36e8:	48 89 df             	mov    rdi,rbx
    36eb:	49 89 dd             	mov    r13,rbx
		base = heap_base;
    36ee:	48 89 c3             	mov    rbx,rax
    36f1:	eb a5                	jmp    3698 <allocate_pages.constprop.0+0x98>
    36f3:	e9 fc d9 ff ff       	jmp    10f4 <allocate_pages.constprop.0.cold>
    36f8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    36ff:	00 

0000000000003700 <allocate_large_object>:
{
    3700:	41 54                	push   r12
    3702:	55                   	push   rbp
    3703:	53                   	push   rbx
    3704:	48 89 fb             	mov    rbx,rdi
    3707:	48 83 ec 10          	sub    rsp,0x10
	maybe_compact_free_large_objects();
    370b:	e8 f0 fd ff ff       	call   3500 <maybe_compact_free_large_objects>
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
    3710:	48 8b 15 f9 5a 00 00 	mov    rdx,QWORD PTR [rip+0x5af9]        # 9210 <large_objects>
    3717:	48 85 d2             	test   rdx,rdx
    371a:	0f 84 da 01 00 00    	je     38fa <allocate_large_object+0x1fa>
    3720:	4c 8d 0d e9 5a 00 00 	lea    r9,[rip+0x5ae9]        # 9210 <large_objects>
	size_t best_size = -1;
    3727:	49 c7 c0 ff ff ff ff 	mov    r8,0xffffffffffffffff
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
    372e:	48 8d 7b 10          	lea    rdi,[rbx+0x10]
	struct large_object *best = NULL, **best_prev = &large_objects;
    3732:	45 31 d2             	xor    r10d,r10d
    3735:	4c 89 cd             	mov    rbp,r9
    3738:	eb 11                	jmp    374b <allocate_large_object+0x4b>
    373a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		prev = &walk->next, walk = walk->next)
    3740:	49 89 d1             	mov    r9,rdx
    3743:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
    3746:	48 85 d2             	test   rdx,rdx
    3749:	74 39                	je     3784 <allocate_large_object+0x84>
		if(walk->size >= size && walk->size < best_size)
    374b:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
    374f:	4c 39 c1             	cmp    rcx,r8
    3752:	73 ec                	jae    3740 <allocate_large_object+0x40>
    3754:	48 39 d9             	cmp    rcx,rbx
    3757:	72 e7                	jb     3740 <allocate_large_object+0x40>
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
    3759:	be 00 01 00 00       	mov    esi,0x100
    375e:	e8 7d fb ff ff       	call   32e0 <align>
			if(best_size + LARGE_OBJECT_HEADER_SIZE ==
    3763:	48 8d 71 10          	lea    rsi,[rcx+0x10]
    3767:	48 39 c6             	cmp    rsi,rax
    376a:	0f 84 88 02 00 00    	je     39f8 <allocate_large_object+0x2f8>
    3770:	4c 89 cd             	mov    rbp,r9
    3773:	49 89 d2             	mov    r10,rdx
		prev = &walk->next, walk = walk->next)
    3776:	49 89 d1             	mov    r9,rdx
    3779:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
    377c:	49 89 c8             	mov    r8,rcx
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
    377f:	48 85 d2             	test   rdx,rdx
    3782:	75 c7                	jne    374b <allocate_large_object+0x4b>
	if(!best)
    3784:	4d 85 d2             	test   r10,r10
    3787:	0f 84 7b 01 00 00    	je     3908 <allocate_large_object+0x208>
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
    378d:	4c 89 d7             	mov    rdi,r10
    3790:	ba ff 00 00 00       	mov    edx,0xff
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
    3795:	4c 89 c1             	mov    rcx,r8
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
    3798:	e8 13 fc ff ff       	call   33b0 <get_chunk_index>
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
    379d:	48 29 d9             	sub    rcx,rbx
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
    37a0:	89 c6                	mov    esi,eax
    37a2:	e8 f9 fb ff ff       	call   33a0 <get_page>
    37a7:	48 89 c7             	mov    rdi,rax
    37aa:	49 89 c1             	mov    r9,rax
    37ad:	e8 2e fc ff ff       	call   33e0 <allocate_chunk>
	struct large_object* next = best->next;
    37b2:	49 8b 02             	mov    rax,QWORD PTR [r10]
	*best_prev = next;
    37b5:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
	if(tail_size)
    37b9:	48 81 e1 00 ff ff ff 	and    rcx,0xffffffffffffff00
    37c0:	75 36                	jne    37f8 <allocate_large_object+0xf8>
	ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(best) + best->size), CHUNK_SIZE);
    37c2:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
    37c6:	4c 89 d7             	mov    rdi,r10
    37c9:	be 00 01 00 00       	mov    esi,0x100
    37ce:	e8 ed fb ff ff       	call   33c0 <get_large_object_payload>
    37d3:	48 01 c2             	add    rdx,rax
    37d6:	48 89 d7             	mov    rdi,rdx
    37d9:	e8 02 fb ff ff       	call   32e0 <align>
    37de:	48 39 c2             	cmp    rdx,rax
    37e1:	0f 85 0f d9 ff ff    	jne    10f6 <allocate_large_object.cold>
}
    37e7:	48 83 c4 10          	add    rsp,0x10
    37eb:	4c 89 d0             	mov    rax,r10
    37ee:	5b                   	pop    rbx
    37ef:	5d                   	pop    rbp
    37f0:	41 5c                	pop    r12
    37f2:	c3                   	ret    
    37f3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		char* start = get_large_object_payload(best);
    37f8:	4c 89 d7             	mov    rdi,r10
    37fb:	e8 c0 fb ff ff       	call   33c0 <get_large_object_payload>
		if(start_page == get_page(end - tail_size - 1))
    3800:	48 89 cf             	mov    rdi,rcx
		char* end = start + best_size;
    3803:	4e 8d 1c 00          	lea    r11,[rax+r8*1]
		if(start_page == get_page(end - tail_size - 1))
    3807:	48 f7 d7             	not    rdi
		char* start = get_large_object_payload(best);
    380a:	48 89 c5             	mov    rbp,rax
		if(start_page == get_page(end - tail_size - 1))
    380d:	4c 01 df             	add    rdi,r11
    3810:	e8 8b fb ff ff       	call   33a0 <get_page>
    3815:	49 39 c1             	cmp    r9,rax
    3818:	0f 84 e8 01 00 00    	je     3a06 <allocate_large_object+0x306>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
    381e:	be 00 00 01 00       	mov    esi,0x10000
    3823:	4c 89 df             	mov    rdi,r11
    3826:	e8 b5 fa ff ff       	call   32e0 <align>
		else if(size < PAGE_SIZE - LARGE_OBJECT_HEADER_SIZE - CHUNK_SIZE)
    382b:	48 81 fb ef fe 00 00 	cmp    rbx,0xfeef
    3832:	0f 86 38 01 00 00    	jbe    3970 <allocate_large_object+0x270>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
    3838:	4c 39 d8             	cmp    rax,r11
    383b:	0f 85 b5 d8 ff ff    	jne    10f6 <allocate_large_object.cold>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
    3841:	0f b7 ed             	movzx  ebp,bp
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
    3844:	be 00 00 01 00       	mov    esi,0x10000
    3849:	48 8d bc 1d 00 00 ff 	lea    rdi,[rbp+rbx*1-0x10000]
    3850:	ff 
			tail_size = best_size - size;
    3851:	4a 8d 8c 05 00 00 ff 	lea    rcx,[rbp+r8*1-0x10000]
    3858:	ff 
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
    3859:	e8 82 fa ff ff       	call   32e0 <align>
		best->size -= tail_size;
    385e:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
			tail_size = best_size - size;
    3862:	48 29 c1             	sub    rcx,rax
		best->size -= tail_size;
    3865:	48 29 ca             	sub    rdx,rcx
		unsigned tail_idx = get_chunk_index(end - tail_size);
    3868:	4c 89 df             	mov    rdi,r11
		best->size -= tail_size;
    386b:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
    386f:	48 29 cf             	sub    rdi,rcx
    3872:	e8 39 fb ff ff       	call   33b0 <get_chunk_index>
    3877:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
    3879:	48 85 c9             	test   rcx,rcx
    387c:	0f 84 44 ff ff ff    	je     37c6 <allocate_large_object+0xc6>
    3882:	85 c0                	test   eax,eax
    3884:	75 0c                	jne    3892 <allocate_large_object+0x192>
			tail_size -= CHUNK_SIZE;
    3886:	48 81 e9 00 01 00 00 	sub    rcx,0x100
			tail_idx++;
    388d:	be 01 00 00 00       	mov    esi,0x1
		if(tail_size)
    3892:	48 85 c9             	test   rcx,rcx
    3895:	0f 84 2b ff ff ff    	je     37c6 <allocate_large_object+0xc6>
			struct page* page = get_page(end - tail_size);
    389b:	4c 89 df             	mov    rdi,r11
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
    389e:	ba fe 00 00 00       	mov    edx,0xfe
			struct page* page = get_page(end - tail_size);
    38a3:	48 29 cf             	sub    rdi,rcx
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
    38a6:	48 83 e9 10          	sub    rcx,0x10
			struct page* page = get_page(end - tail_size);
    38aa:	e8 f1 fa ff ff       	call   33a0 <get_page>
    38af:	48 89 c7             	mov    rdi,rax
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
    38b2:	e8 29 fb ff ff       	call   33e0 <allocate_chunk>
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
    38b7:	be 00 01 00 00       	mov    esi,0x100
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
    38bc:	48 89 c2             	mov    rdx,rax
			tail->next = large_objects;
    38bf:	48 8b 05 4a 59 00 00 	mov    rax,QWORD PTR [rip+0x594a]        # 9210 <large_objects>
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
    38c6:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
    38ca:	48 89 d7             	mov    rdi,rdx
			tail->next = large_objects;
    38cd:	48 89 02             	mov    QWORD PTR [rdx],rax
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
    38d0:	e8 eb fa ff ff       	call   33c0 <get_large_object_payload>
    38d5:	48 01 c1             	add    rcx,rax
    38d8:	48 89 cf             	mov    rdi,rcx
    38db:	e8 00 fa ff ff       	call   32e0 <align>
    38e0:	48 39 c1             	cmp    rcx,rax
    38e3:	0f 85 0d d8 ff ff    	jne    10f6 <allocate_large_object.cold>
			large_objects = tail;
    38e9:	48 89 15 20 59 00 00 	mov    QWORD PTR [rip+0x5920],rdx        # 9210 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
    38f0:	e8 fb fa ff ff       	call   33f0 <maybe_repurpose_single_chunk_large_objects_head>
    38f5:	e9 c8 fe ff ff       	jmp    37c2 <allocate_large_object+0xc2>
	struct large_object *best = NULL, **best_prev = &large_objects;
    38fa:	48 8d 2d 0f 59 00 00 	lea    rbp,[rip+0x590f]        # 9210 <large_objects>
    3901:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
		size_t size_with_header = size + sizeof(struct large_object);
    3908:	4c 8d 63 10          	lea    r12,[rbx+0x10]
		struct page* page = allocate_pages(size_with_header, &n_allocated);
    390c:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
		size_t n_allocated = 0;
    3911:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
    3918:	00 00 
		struct page* page = allocate_pages(size_with_header, &n_allocated);
    391a:	4c 89 e7             	mov    rdi,r12
    391d:	e8 de fc ff ff       	call   3600 <allocate_pages.constprop.0>
    3922:	48 89 c1             	mov    rcx,rax
		if(!page)
    3925:	48 85 c0             	test   rax,rax
    3928:	0f 84 10 01 00 00    	je     3a3e <allocate_large_object+0x33e>
		char* ptr = allocate_chunk(page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
    392e:	ba ff 00 00 00       	mov    edx,0xff
    3933:	be 01 00 00 00       	mov    esi,0x1
    3938:	48 89 c7             	mov    rdi,rax
    393b:	e8 a0 fa ff ff       	call   33e0 <allocate_chunk>
    3940:	49 89 c2             	mov    r10,rax
		best->next = large_objects;
    3943:	48 8b 05 c6 58 00 00 	mov    rax,QWORD PTR [rip+0x58c6]        # 9210 <large_objects>
		size_t page_header = ptr - ((char*)page);
    394a:	4c 29 d1             	sub    rcx,r10
		best->next = large_objects;
    394d:	49 89 02             	mov    QWORD PTR [r10],rax
		best->size = best_size = n_allocated * PAGE_SIZE - page_header - LARGE_OBJECT_HEADER_SIZE;
    3950:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
    3955:	48 c1 e0 10          	shl    rax,0x10
    3959:	4c 8d 44 01 f0       	lea    r8,[rcx+rax*1-0x10]
    395e:	4d 89 42 08          	mov    QWORD PTR [r10+0x8],r8
		ASSERT(best_size >= size_with_header);
    3962:	4d 39 c4             	cmp    r12,r8
    3965:	0f 86 22 fe ff ff    	jbe    378d <allocate_large_object+0x8d>
    396b:	e9 86 d7 ff ff       	jmp    10f6 <allocate_large_object.cold>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
    3970:	4c 39 d8             	cmp    rax,r11
    3973:	0f 85 7d d7 ff ff    	jne    10f6 <allocate_large_object.cold>
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
    3979:	48 89 ef             	mov    rdi,rbp
    397c:	ba fe 00 00 00       	mov    edx,0xfe
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
    3981:	44 0f b7 e5          	movzx  r12d,bp
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
    3985:	e8 26 fa ff ff       	call   33b0 <get_chunk_index>
    398a:	4c 89 cf             	mov    rdi,r9
    398d:	89 c6                	mov    esi,eax
    398f:	e8 4c fa ff ff       	call   33e0 <allocate_chunk>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
    3994:	b8 00 00 01 00       	mov    eax,0x10000
    3999:	4c 29 e0             	sub    rax,r12
    399c:	49 89 42 08          	mov    QWORD PTR [r10+0x8],rax
			head->next = large_objects;
    39a0:	48 8b 05 69 58 00 00 	mov    rax,QWORD PTR [rip+0x5869]        # 9210 <large_objects>
    39a7:	49 89 02             	mov    QWORD PTR [r10],rax
			large_objects = head;
    39aa:	4c 89 15 5f 58 00 00 	mov    QWORD PTR [rip+0x585f],r10        # 9210 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
    39b1:	e8 3a fa ff ff       	call   33f0 <maybe_repurpose_single_chunk_large_objects_head>
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
    39b6:	ba ff 00 00 00       	mov    edx,0xff
    39bb:	be 01 00 00 00       	mov    esi,0x1
			struct page* next_page = start_page + 1;
    39c0:	49 8d b9 00 00 01 00 	lea    rdi,[r9+0x10000]
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
    39c7:	e8 14 fa ff ff       	call   33e0 <allocate_chunk>
			best->size = best_size =
    39cc:	4b 8d 94 04 f0 fe fe 	lea    rdx,[r12+r8*1-0x10110]
    39d3:	ff 
    39d4:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
    39d8:	49 89 c2             	mov    r10,rax
			ASSERT(best_size >= size);
    39db:	48 39 d3             	cmp    rbx,rdx
    39de:	0f 87 12 d7 ff ff    	ja     10f6 <allocate_large_object.cold>
			tail_size = (best_size - size) & ~CHUNK_MASK;
    39e4:	48 89 d1             	mov    rcx,rdx
    39e7:	48 29 d9             	sub    rcx,rbx
    39ea:	30 c9                	xor    cl,cl
    39ec:	e9 74 fe ff ff       	jmp    3865 <allocate_large_object+0x165>
    39f1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    39f8:	4c 89 cd             	mov    rbp,r9
    39fb:	49 89 c8             	mov    r8,rcx
    39fe:	49 89 d2             	mov    r10,rdx
    3a01:	e9 87 fd ff ff       	jmp    378d <allocate_large_object+0x8d>
			ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
    3a06:	be 00 01 00 00       	mov    esi,0x100
    3a0b:	4c 89 df             	mov    rdi,r11
    3a0e:	e8 cd f8 ff ff       	call   32e0 <align>
    3a13:	49 39 c3             	cmp    r11,rax
    3a16:	0f 85 da d6 ff ff    	jne    10f6 <allocate_large_object.cold>
		best->size -= tail_size;
    3a1c:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
		unsigned tail_idx = get_chunk_index(end - tail_size);
    3a20:	48 29 cf             	sub    rdi,rcx
		best->size -= tail_size;
    3a23:	48 29 ca             	sub    rdx,rcx
    3a26:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
    3a2a:	e8 81 f9 ff ff       	call   33b0 <get_chunk_index>
    3a2f:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
    3a31:	85 c0                	test   eax,eax
    3a33:	0f 84 4d fe ff ff    	je     3886 <allocate_large_object+0x186>
    3a39:	e9 5d fe ff ff       	jmp    389b <allocate_large_object+0x19b>
			return NULL;
    3a3e:	45 31 d2             	xor    r10d,r10d
    3a41:	e9 a1 fd ff ff       	jmp    37e7 <allocate_large_object+0xe7>
    3a46:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    3a4d:	00 00 00 

0000000000003a50 <allocate_large>:
{
    3a50:	48 83 ec 08          	sub    rsp,0x8
	struct large_object* obj = allocate_large_object(size);
    3a54:	e8 a7 fc ff ff       	call   3700 <allocate_large_object>
	return obj ? get_large_object_payload(obj) : NULL;
    3a59:	48 85 c0             	test   rax,rax
    3a5c:	74 12                	je     3a70 <allocate_large+0x20>
    3a5e:	48 89 c7             	mov    rdi,rax
}
    3a61:	48 83 c4 08          	add    rsp,0x8
	return obj ? get_large_object_payload(obj) : NULL;
    3a65:	e9 56 f9 ff ff       	jmp    33c0 <get_large_object_payload>
    3a6a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
}
    3a70:	31 c0                	xor    eax,eax
    3a72:	48 83 c4 08          	add    rsp,0x8
    3a76:	c3                   	ret    
    3a77:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    3a7e:	00 00 

0000000000003a80 <obtain_small_objects>:
{
    3a80:	55                   	push   rbp
    3a81:	89 fd                	mov    ebp,edi
	if(*whole_chunk_freelist)
    3a83:	48 8b 3d de 57 00 00 	mov    rdi,QWORD PTR [rip+0x57de]        # 9268 <small_object_freelists+0x48>
    3a8a:	48 85 ff             	test   rdi,rdi
    3a8d:	74 71                	je     3b00 <obtain_small_objects+0x80>
		*whole_chunk_freelist = (*whole_chunk_freelist)->next;
    3a8f:	48 8b 07             	mov    rax,QWORD PTR [rdi]
    3a92:	48 89 05 cf 57 00 00 	mov    QWORD PTR [rip+0x57cf],rax        # 9268 <small_object_freelists+0x48>
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
    3a99:	e8 12 f9 ff ff       	call   33b0 <get_chunk_index>
    3a9e:	89 ea                	mov    edx,ebp
    3aa0:	89 c6                	mov    esi,eax
    3aa2:	e8 f9 f8 ff ff       	call   33a0 <get_page>
    3aa7:	48 89 c7             	mov    rdi,rax
    3aaa:	e8 31 f9 ff ff       	call   33e0 <allocate_chunk>
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
    3aaf:	89 ef                	mov    edi,ebp
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
    3ab1:	48 89 c2             	mov    rdx,rax
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
    3ab4:	e8 c7 f8 ff ff       	call   3380 <chunk_kind_to_granules>
    3ab9:	8d 34 c5 00 00 00 00 	lea    esi,[rax*8+0x0]
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
    3ac0:	48 81 fe 00 01 00 00 	cmp    rsi,0x100
    3ac7:	77 46                	ja     3b0f <obtain_small_objects+0x8f>
    3ac9:	48 89 d0             	mov    rax,rdx
    3acc:	48 89 f1             	mov    rcx,rsi
    3acf:	48 29 f0             	sub    rax,rsi
    3ad2:	48 8d 90 00 01 00 00 	lea    rdx,[rax+0x100]
	struct freelist* next = NULL;
    3ad9:	31 c0                	xor    eax,eax
    3adb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		struct freelist* head = (struct freelist*)(end - i);
    3ae0:	48 89 c7             	mov    rdi,rax
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
    3ae3:	48 01 f1             	add    rcx,rsi
		struct freelist* head = (struct freelist*)(end - i);
    3ae6:	48 89 d0             	mov    rax,rdx
		head->next = next;
    3ae9:	48 89 3a             	mov    QWORD PTR [rdx],rdi
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
    3aec:	48 29 f2             	sub    rdx,rsi
    3aef:	48 81 f9 00 01 00 00 	cmp    rcx,0x100
    3af6:	76 e8                	jbe    3ae0 <obtain_small_objects+0x60>
}
    3af8:	5d                   	pop    rbp
    3af9:	c3                   	ret    
    3afa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		chunk = allocate_large_object(0);
    3b00:	31 ff                	xor    edi,edi
    3b02:	e8 f9 fb ff ff       	call   3700 <allocate_large_object>
    3b07:	48 89 c7             	mov    rdi,rax
		if(!chunk)
    3b0a:	48 85 c0             	test   rax,rax
    3b0d:	75 8a                	jne    3a99 <obtain_small_objects+0x19>
			return NULL;
    3b0f:	31 c0                	xor    eax,eax
}
    3b11:	5d                   	pop    rbp
    3b12:	c3                   	ret    
    3b13:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    3b1a:	00 00 00 
    3b1d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000003b20 <allocate_small>:
{
    3b20:	53                   	push   rbx
    3b21:	41 89 f8             	mov    r8d,edi
	struct freelist** loc = get_small_object_freelist(kind);
    3b24:	e8 17 fa ff ff       	call   3540 <get_small_object_freelist>
    3b29:	48 89 c3             	mov    rbx,rax
	if(!*loc)
    3b2c:	48 8b 00             	mov    rax,QWORD PTR [rax]
    3b2f:	48 85 c0             	test   rax,rax
    3b32:	74 0c                	je     3b40 <allocate_small+0x20>
	*loc = ret->next;
    3b34:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    3b37:	48 89 13             	mov    QWORD PTR [rbx],rdx
}
    3b3a:	5b                   	pop    rbx
    3b3b:	c3                   	ret    
    3b3c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		struct freelist* freelist = obtain_small_objects(kind);
    3b40:	44 89 c7             	mov    edi,r8d
    3b43:	e8 38 ff ff ff       	call   3a80 <obtain_small_objects>
		if(!freelist)
    3b48:	48 85 c0             	test   rax,rax
    3b4b:	74 ed                	je     3b3a <allocate_small+0x1a>
		*loc = freelist;
    3b4d:	48 89 03             	mov    QWORD PTR [rbx],rax
    3b50:	eb e2                	jmp    3b34 <allocate_small+0x14>
    3b52:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    3b59:	00 00 00 
    3b5c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000003b60 <malloc>:
{
    3b60:	f3 0f 1e fa          	endbr64 
    3b64:	48 83 ec 08          	sub    rsp,0x8
    3b68:	49 89 f8             	mov    r8,rdi
	size_t granules = size_to_granules(size);
    3b6b:	e8 d0 f8 ff ff       	call   3440 <size_to_granules>
	enum chunk_kind kind = granules_to_chunk_kind(granules);
    3b70:	89 c7                	mov    edi,eax
    3b72:	e8 79 f7 ff ff       	call   32f0 <granules_to_chunk_kind>
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
    3b77:	3d ff 00 00 00       	cmp    eax,0xff
    3b7c:	74 12                	je     3b90 <malloc+0x30>
    3b7e:	89 c7                	mov    edi,eax
}
    3b80:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
    3b84:	e9 97 ff ff ff       	jmp    3b20 <allocate_small>
    3b89:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    3b90:	4c 89 c7             	mov    rdi,r8
}
    3b93:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
    3b97:	e9 b4 fe ff ff       	jmp    3a50 <allocate_large>
    3b9c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000003ba0 <reg_dev>:
    3ba0:	55                   	push   rbp
    3ba1:	48 89 e5             	mov    rbp,rsp
    3ba4:	b8 00 00 00 00       	mov    eax,0x0
    3ba9:	55                   	push   rbp
    3baa:	48 0f 05             	rex.W syscall 
    3bad:	5d                   	pop    rbp
    3bae:	c9                   	leave  
    3baf:	c3                   	ret    

0000000000003bb0 <dispose_dev>:
    3bb0:	55                   	push   rbp
    3bb1:	48 89 e5             	mov    rbp,rsp
    3bb4:	b8 01 00 00 00       	mov    eax,0x1
    3bb9:	55                   	push   rbp
    3bba:	48 0f 05             	rex.W syscall 
    3bbd:	5d                   	pop    rbp
    3bbe:	c9                   	leave  
    3bbf:	c3                   	ret    

0000000000003bc0 <reg_drv>:
    3bc0:	55                   	push   rbp
    3bc1:	48 89 e5             	mov    rbp,rsp
    3bc4:	b8 02 00 00 00       	mov    eax,0x2
    3bc9:	55                   	push   rbp
    3bca:	48 0f 05             	rex.W syscall 
    3bcd:	5d                   	pop    rbp
    3bce:	c9                   	leave  
    3bcf:	c3                   	ret    

0000000000003bd0 <dispose_drv>:
    3bd0:	55                   	push   rbp
    3bd1:	48 89 e5             	mov    rbp,rsp
    3bd4:	b8 03 00 00 00       	mov    eax,0x3
    3bd9:	55                   	push   rbp
    3bda:	48 0f 05             	rex.W syscall 
    3bdd:	5d                   	pop    rbp
    3bde:	c9                   	leave  
    3bdf:	c3                   	ret    

0000000000003be0 <call_drvfunc>:
    3be0:	55                   	push   rbp
    3be1:	48 89 e5             	mov    rbp,rsp
    3be4:	b8 04 00 00 00       	mov    eax,0x4
    3be9:	55                   	push   rbp
    3bea:	48 0f 05             	rex.W syscall 
    3bed:	5d                   	pop    rbp
    3bee:	c9                   	leave  
    3bef:	c3                   	ret    

0000000000003bf0 <req_mem>:
    3bf0:	55                   	push   rbp
    3bf1:	48 89 e5             	mov    rbp,rsp
    3bf4:	b8 05 00 00 00       	mov    eax,0x5
    3bf9:	55                   	push   rbp
    3bfa:	48 0f 05             	rex.W syscall 
    3bfd:	5d                   	pop    rbp
    3bfe:	c9                   	leave  
    3bff:	c3                   	ret    

0000000000003c00 <free_mem>:
    3c00:	55                   	push   rbp
    3c01:	48 89 e5             	mov    rbp,rsp
    3c04:	b8 06 00 00 00       	mov    eax,0x6
    3c09:	55                   	push   rbp
    3c0a:	48 0f 05             	rex.W syscall 
    3c0d:	5d                   	pop    rbp
    3c0e:	c9                   	leave  
    3c0f:	c3                   	ret    

0000000000003c10 <reg_proc>:
    3c10:	55                   	push   rbp
    3c11:	48 89 e5             	mov    rbp,rsp
    3c14:	b8 07 00 00 00       	mov    eax,0x7
    3c19:	55                   	push   rbp
    3c1a:	48 0f 05             	rex.W syscall 
    3c1d:	5d                   	pop    rbp
    3c1e:	c9                   	leave  
    3c1f:	c3                   	ret    

0000000000003c20 <del_proc>:
    3c20:	55                   	push   rbp
    3c21:	48 89 e5             	mov    rbp,rsp
    3c24:	b8 08 00 00 00       	mov    eax,0x8
    3c29:	55                   	push   rbp
    3c2a:	48 0f 05             	rex.W syscall 
    3c2d:	5d                   	pop    rbp
    3c2e:	c9                   	leave  
    3c2f:	c3                   	ret    

0000000000003c30 <get_proc_addr>:
    3c30:	55                   	push   rbp
    3c31:	48 89 e5             	mov    rbp,rsp
    3c34:	b8 09 00 00 00       	mov    eax,0x9
    3c39:	55                   	push   rbp
    3c3a:	48 0f 05             	rex.W syscall 
    3c3d:	5d                   	pop    rbp
    3c3e:	c9                   	leave  
    3c3f:	c3                   	ret    

0000000000003c40 <chk_vm>:
    3c40:	55                   	push   rbp
    3c41:	48 89 e5             	mov    rbp,rsp
    3c44:	b8 0a 00 00 00       	mov    eax,0xa
    3c49:	55                   	push   rbp
    3c4a:	48 0f 05             	rex.W syscall 
    3c4d:	5d                   	pop    rbp
    3c4e:	c9                   	leave  
    3c4f:	c3                   	ret    

0000000000003c50 <open>:
    3c50:	55                   	push   rbp
    3c51:	48 89 e5             	mov    rbp,rsp
    3c54:	b8 0b 00 00 00       	mov    eax,0xb
    3c59:	55                   	push   rbp
    3c5a:	48 0f 05             	rex.W syscall 
    3c5d:	5d                   	pop    rbp
    3c5e:	c9                   	leave  
    3c5f:	c3                   	ret    

0000000000003c60 <close>:
    3c60:	55                   	push   rbp
    3c61:	48 89 e5             	mov    rbp,rsp
    3c64:	b8 0c 00 00 00       	mov    eax,0xc
    3c69:	55                   	push   rbp
    3c6a:	48 0f 05             	rex.W syscall 
    3c6d:	5d                   	pop    rbp
    3c6e:	c9                   	leave  
    3c6f:	c3                   	ret    

0000000000003c70 <read>:
    3c70:	55                   	push   rbp
    3c71:	48 89 e5             	mov    rbp,rsp
    3c74:	b8 0d 00 00 00       	mov    eax,0xd
    3c79:	55                   	push   rbp
    3c7a:	48 0f 05             	rex.W syscall 
    3c7d:	5d                   	pop    rbp
    3c7e:	c9                   	leave  
    3c7f:	c3                   	ret    

0000000000003c80 <write>:
    3c80:	55                   	push   rbp
    3c81:	48 89 e5             	mov    rbp,rsp
    3c84:	b8 0e 00 00 00       	mov    eax,0xe
    3c89:	55                   	push   rbp
    3c8a:	48 0f 05             	rex.W syscall 
    3c8d:	5d                   	pop    rbp
    3c8e:	c9                   	leave  
    3c8f:	c3                   	ret    

0000000000003c90 <seek>:
    3c90:	55                   	push   rbp
    3c91:	48 89 e5             	mov    rbp,rsp
    3c94:	b8 0f 00 00 00       	mov    eax,0xf
    3c99:	55                   	push   rbp
    3c9a:	48 0f 05             	rex.W syscall 
    3c9d:	5d                   	pop    rbp
    3c9e:	c9                   	leave  
    3c9f:	c3                   	ret    

0000000000003ca0 <tell>:
    3ca0:	55                   	push   rbp
    3ca1:	48 89 e5             	mov    rbp,rsp
    3ca4:	b8 10 00 00 00       	mov    eax,0x10
    3ca9:	55                   	push   rbp
    3caa:	48 0f 05             	rex.W syscall 
    3cad:	5d                   	pop    rbp
    3cae:	c9                   	leave  
    3caf:	c3                   	ret    

0000000000003cb0 <reg_vol>:
    3cb0:	55                   	push   rbp
    3cb1:	48 89 e5             	mov    rbp,rsp
    3cb4:	b8 11 00 00 00       	mov    eax,0x11
    3cb9:	55                   	push   rbp
    3cba:	48 0f 05             	rex.W syscall 
    3cbd:	5d                   	pop    rbp
    3cbe:	c9                   	leave  
    3cbf:	c3                   	ret    

0000000000003cc0 <free_vol>:
    3cc0:	55                   	push   rbp
    3cc1:	48 89 e5             	mov    rbp,rsp
    3cc4:	b8 12 00 00 00       	mov    eax,0x12
    3cc9:	55                   	push   rbp
    3cca:	48 0f 05             	rex.W syscall 
    3ccd:	5d                   	pop    rbp
    3cce:	c9                   	leave  
    3ccf:	c3                   	ret    

0000000000003cd0 <exec>:
    3cd0:	55                   	push   rbp
    3cd1:	48 89 e5             	mov    rbp,rsp
    3cd4:	b8 13 00 00 00       	mov    eax,0x13
    3cd9:	55                   	push   rbp
    3cda:	48 0f 05             	rex.W syscall 
    3cdd:	5d                   	pop    rbp
    3cde:	c9                   	leave  
    3cdf:	c3                   	ret    

0000000000003ce0 <exit>:
    3ce0:	55                   	push   rbp
    3ce1:	48 89 e5             	mov    rbp,rsp
    3ce4:	b8 14 00 00 00       	mov    eax,0x14
    3ce9:	55                   	push   rbp
    3cea:	48 0f 05             	rex.W syscall 
    3ced:	5d                   	pop    rbp
    3cee:	c9                   	leave  
    3cef:	c3                   	ret    

0000000000003cf0 <abort>:
    3cf0:	55                   	push   rbp
    3cf1:	48 89 e5             	mov    rbp,rsp
    3cf4:	b8 14 00 00 00       	mov    eax,0x14
    3cf9:	55                   	push   rbp
    3cfa:	48 0f 05             	rex.W syscall 
    3cfd:	5d                   	pop    rbp
    3cfe:	c9                   	leave  
    3cff:	c3                   	ret    

0000000000003d00 <call>:
    3d00:	55                   	push   rbp
    3d01:	48 89 e5             	mov    rbp,rsp
    3d04:	b8 15 00 00 00       	mov    eax,0x15
    3d09:	55                   	push   rbp
    3d0a:	48 0f 05             	rex.W syscall 
    3d0d:	5d                   	pop    rbp
    3d0e:	c9                   	leave  
    3d0f:	c3                   	ret    

0000000000003d10 <mkfifo>:
    3d10:	55                   	push   rbp
    3d11:	48 89 e5             	mov    rbp,rsp
    3d14:	b8 16 00 00 00       	mov    eax,0x16
    3d19:	55                   	push   rbp
    3d1a:	48 0f 05             	rex.W syscall 
    3d1d:	5d                   	pop    rbp
    3d1e:	c9                   	leave  
    3d1f:	c3                   	ret    

0000000000003d20 <brk>:
    3d20:	55                   	push   rbp
    3d21:	48 89 e5             	mov    rbp,rsp
    3d24:	b8 17 00 00 00       	mov    eax,0x17
    3d29:	55                   	push   rbp
    3d2a:	48 0f 05             	rex.W syscall 
    3d2d:	5d                   	pop    rbp
    3d2e:	c9                   	leave  
    3d2f:	c3                   	ret    

0000000000003d30 <find_dev>:
    3d30:	55                   	push   rbp
    3d31:	48 89 e5             	mov    rbp,rsp
    3d34:	b8 19 00 00 00       	mov    eax,0x19
    3d39:	55                   	push   rbp
    3d3a:	48 0f 05             	rex.W syscall 
    3d3d:	5d                   	pop    rbp
    3d3e:	c9                   	leave  
    3d3f:	c3                   	ret    

0000000000003d40 <operate_dev>:
    3d40:	55                   	push   rbp
    3d41:	48 89 e5             	mov    rbp,rsp
    3d44:	b8 1a 00 00 00       	mov    eax,0x1a
    3d49:	55                   	push   rbp
    3d4a:	48 0f 05             	rex.W syscall 
    3d4d:	5d                   	pop    rbp
    3d4e:	c9                   	leave  
    3d4f:	c3                   	ret    

0000000000003d50 <fork>:
    3d50:	55                   	push   rbp
    3d51:	48 89 e5             	mov    rbp,rsp
    3d54:	b8 1b 00 00 00       	mov    eax,0x1b
    3d59:	55                   	push   rbp
    3d5a:	48 0f 05             	rex.W syscall 
    3d5d:	5d                   	pop    rbp
    3d5e:	c9                   	leave  
    3d5f:	c3                   	ret    

0000000000003d60 <execve>:
    3d60:	55                   	push   rbp
    3d61:	48 89 e5             	mov    rbp,rsp
    3d64:	b8 1c 00 00 00       	mov    eax,0x1c
    3d69:	55                   	push   rbp
    3d6a:	48 0f 05             	rex.W syscall 
    3d6d:	5d                   	pop    rbp
    3d6e:	c9                   	leave  
    3d6f:	c3                   	ret    

0000000000003d70 <waitpid>:
    3d70:	55                   	push   rbp
    3d71:	48 89 e5             	mov    rbp,rsp
    3d74:	b8 1d 00 00 00       	mov    eax,0x1d
    3d79:	55                   	push   rbp
    3d7a:	48 0f 05             	rex.W syscall 
    3d7d:	5d                   	pop    rbp
    3d7e:	c9                   	leave  
    3d7f:	c3                   	ret    

0000000000003d80 <mmap>:
    3d80:	55                   	push   rbp
    3d81:	48 89 e5             	mov    rbp,rsp
    3d84:	b8 1e 00 00 00       	mov    eax,0x1e
    3d89:	55                   	push   rbp
    3d8a:	48 0f 05             	rex.W syscall 
    3d8d:	5d                   	pop    rbp
    3d8e:	c9                   	leave  
    3d8f:	c3                   	ret    

0000000000003d90 <munmap>:
    3d90:	55                   	push   rbp
    3d91:	48 89 e5             	mov    rbp,rsp
    3d94:	b8 1f 00 00 00       	mov    eax,0x1f
    3d99:	55                   	push   rbp
    3d9a:	48 0f 05             	rex.W syscall 
    3d9d:	5d                   	pop    rbp
    3d9e:	c9                   	leave  
    3d9f:	c3                   	ret    

0000000000003da0 <mknod>:
    3da0:	55                   	push   rbp
    3da1:	48 89 e5             	mov    rbp,rsp
    3da4:	b8 21 00 00 00       	mov    eax,0x21
    3da9:	55                   	push   rbp
    3daa:	48 0f 05             	rex.W syscall 
    3dad:	5d                   	pop    rbp
    3dae:	c9                   	leave  
    3daf:	c3                   	ret    

0000000000003db0 <kb_readc>:
    3db0:	55                   	push   rbp
    3db1:	48 89 e5             	mov    rbp,rsp
    3db4:	b8 64 00 00 00       	mov    eax,0x64
    3db9:	55                   	push   rbp
    3dba:	48 0f 05             	rex.W syscall 
    3dbd:	5d                   	pop    rbp
    3dbe:	c9                   	leave  
    3dbf:	c3                   	ret    

0000000000003dc0 <remove>:
    3dc0:	55                   	push   rbp
    3dc1:	48 89 e5             	mov    rbp,rsp
    3dc4:	b8 22 00 00 00       	mov    eax,0x22
    3dc9:	55                   	push   rbp
    3dca:	48 0f 05             	rex.W syscall 
    3dcd:	5d                   	pop    rbp
    3dce:	c9                   	leave  
    3dcf:	c3                   	ret    

0000000000003dd0 <sbrk>:
    3dd0:	55                   	push   rbp
    3dd1:	48 89 e5             	mov    rbp,rsp
    3dd4:	b8 23 00 00 00       	mov    eax,0x23
    3dd9:	55                   	push   rbp
    3dda:	48 0f 05             	rex.W syscall 
    3ddd:	5d                   	pop    rbp
    3dde:	c9                   	leave  
    3ddf:	c3                   	ret    

0000000000003de0 <chkmmap>:
    3de0:	55                   	push   rbp
    3de1:	48 89 e5             	mov    rbp,rsp
    3de4:	b8 24 00 00 00       	mov    eax,0x24
    3de9:	55                   	push   rbp
    3dea:	48 0f 05             	rex.W syscall 
    3ded:	5d                   	pop    rbp
    3dee:	c9                   	leave  
    3def:	c3                   	ret    
