
bin/dl.so:     file format elf64-x86-64


Disassembly of section .plt:

0000000000001000 <heap_size_in_pages@plt-0x10>:
    1000:	ff 35 02 50 00 00    	push   QWORD PTR [rip+0x5002]        # 6008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1006:	ff 25 04 50 00 00    	jmp    QWORD PTR [rip+0x5004]        # 6010 <_GLOBAL_OFFSET_TABLE_+0x10>
    100c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000001010 <heap_size_in_pages@plt>:
    1010:	ff 25 02 50 00 00    	jmp    QWORD PTR [rip+0x5002]        # 6018 <heap_size_in_pages+0x2aa8>
    1016:	68 00 00 00 00       	push   0x0
    101b:	e9 e0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001020 <get_got@plt>:
    1020:	ff 25 fa 4f 00 00    	jmp    QWORD PTR [rip+0x4ffa]        # 6020 <get_got+0x3835>
    1026:	68 01 00 00 00       	push   0x1
    102b:	e9 d0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001030 <malloc@plt>:
    1030:	ff 25 f2 4f 00 00    	jmp    QWORD PTR [rip+0x4ff2]        # 6028 <malloc+0x2538>
    1036:	68 02 00 00 00       	push   0x2
    103b:	e9 c0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001040 <fill_reloc@plt>:
    1040:	ff 25 ea 4f 00 00    	jmp    QWORD PTR [rip+0x4fea]        # 6030 <fill_reloc+0x36ae>
    1046:	68 03 00 00 00       	push   0x3
    104b:	e9 b0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001050 <mmap@plt>:
    1050:	ff 25 e2 4f 00 00    	jmp    QWORD PTR [rip+0x4fe2]        # 6038 <mmap+0x2328>
    1056:	68 04 00 00 00       	push   0x4
    105b:	e9 a0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001060 <read@plt>:
    1060:	ff 25 da 4f 00 00    	jmp    QWORD PTR [rip+0x4fda]        # 6040 <read+0x2440>
    1066:	68 05 00 00 00       	push   0x5
    106b:	e9 90 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001070 <sbrk@plt>:
    1070:	ff 25 d2 4f 00 00    	jmp    QWORD PTR [rip+0x4fd2]        # 6048 <sbrk+0x22e8>
    1076:	68 06 00 00 00       	push   0x6
    107b:	e9 80 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001080 <dlstrcmp@plt>:
    1080:	ff 25 ca 4f 00 00    	jmp    QWORD PTR [rip+0x4fca]        # 6050 <dlstrcmp+0x38fc>
    1086:	68 07 00 00 00       	push   0x7
    108b:	e9 70 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001090 <seek@plt>:
    1090:	ff 25 c2 4f 00 00    	jmp    QWORD PTR [rip+0x4fc2]        # 6058 <seek+0x2438>
    1096:	68 08 00 00 00       	push   0x8
    109b:	e9 60 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010a0 <load_elfso@plt>:
    10a0:	ff 25 ba 4f 00 00    	jmp    QWORD PTR [rip+0x4fba]        # 6060 <load_elfso+0x487a>
    10a6:	68 09 00 00 00       	push   0x9
    10ab:	e9 50 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010b0 <chkmmap@plt>:
    10b0:	ff 25 b2 4f 00 00    	jmp    QWORD PTR [rip+0x4fb2]        # 6068 <chkmmap+0x22f8>
    10b6:	68 0a 00 00 00       	push   0xa
    10bb:	e9 40 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010c0 <open@plt>:
    10c0:	ff 25 aa 4f 00 00    	jmp    QWORD PTR [rip+0x4faa]        # 6070 <open+0x2490>
    10c6:	68 0b 00 00 00       	push   0xb
    10cb:	e9 30 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010d0 <close@plt>:
    10d0:	ff 25 a2 4f 00 00    	jmp    QWORD PTR [rip+0x4fa2]        # 6078 <close+0x2488>
    10d6:	68 0c 00 00 00       	push   0xc
    10db:	e9 20 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010e0 <free@plt>:
    10e0:	ff 25 9a 4f 00 00    	jmp    QWORD PTR [rip+0x4f9a]        # 6080 <free+0x2b90>
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
int dlmain(int fno, void* load_offset, int argc, char** argv, char** environ)
{
    1111:	f3 0f 1e fa          	endbr64 
    1115:	55                   	push   rbp
    1116:	48 89 e5             	mov    rbp,rsp
    1119:	48 83 ec 30          	sub    rsp,0x30
    111d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    1120:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    1124:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    1127:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    112b:	4c 89 45 d0          	mov    QWORD PTR [rbp-0x30],r8
    //完成自我重定位（自举）
    dlid = dl_init(load_offset);
    112f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1133:	48 89 c7             	mov    rdi,rax
    1136:	e8 a3 1a 00 00       	call   2bde <dl_init>
    113b:	48 8b 15 9e 4e 00 00 	mov    rdx,QWORD PTR [rip+0x4e9e]        # 5fe0 <dlid-0x31c0>
    1142:	89 02                	mov    DWORD PTR [rdx],eax

    //这部分是因为c库的malloc需要这个变量，但是现在又不能直接设置入口函数为entry
    extern unsigned long long __heap_base;
    __heap_base = sbrk(0);
    1144:	bf 00 00 00 00       	mov    edi,0x0
    1149:	e8 22 ff ff ff       	call   1070 <sbrk@plt>
    114e:	48 89 c2             	mov    rdx,rax
    1151:	48 8b 05 90 4e 00 00 	mov    rax,QWORD PTR [rip+0x4e90]        # 5fe8 <__heap_base-0x3288>
    1158:	48 89 10             	mov    QWORD PTR [rax],rdx
    //加载elf文件
    //读取文件头

    //递归加载elf和so
    off_t entry = load_elfso(fno);
    115b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    115e:	89 c7                	mov    edi,eax
    1160:	e8 3b ff ff ff       	call   10a0 <load_elfso@plt>
    1165:	48 98                	cdqe   
    1167:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //跳转到程序入口
    int (*main)(int, char**, char**) = entry;
    116b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    116f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    main(argc, argv, environ);
    1173:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    1177:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
    117b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
    117e:	4c 8b 45 f0          	mov    r8,QWORD PTR [rbp-0x10]
    1182:	48 89 ce             	mov    rsi,rcx
    1185:	89 c7                	mov    edi,eax
    1187:	41 ff d0             	call   r8
    return 0;
    118a:	b8 00 00 00 00       	mov    eax,0x0
}
    118f:	c9                   	leave  
    1190:	c3                   	ret    

0000000000001191 <load_elfso_old>:
int load_elfso_old(int fno)
{
    1191:	f3 0f 1e fa          	endbr64 
    1195:	55                   	push   rbp
    1196:	48 89 e5             	mov    rbp,rsp
    1199:	48 81 ec 30 01 00 00 	sub    rsp,0x130
    11a0:	89 bd dc fe ff ff    	mov    DWORD PTR [rbp-0x124],edi
    // 读取文件头
    Elf64_Ehdr ehdr;
    //读取文件头
    read(fno, &ehdr, sizeof(ehdr));
    11a6:	48 8d 8d e0 fe ff ff 	lea    rcx,[rbp-0x120]
    11ad:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    11b3:	ba 40 00 00 00       	mov    edx,0x40
    11b8:	48 89 ce             	mov    rsi,rcx
    11bb:	89 c7                	mov    edi,eax
    11bd:	e8 9e fe ff ff       	call   1060 <read@plt>

    unsigned short entn = ehdr.e_phnum;
    11c2:	0f b7 85 18 ff ff ff 	movzx  eax,WORD PTR [rbp-0xe8]
    11c9:	66 89 45 86          	mov    WORD PTR [rbp-0x7a],ax
    unsigned short ents = ehdr.e_phentsize;
    11cd:	0f b7 85 16 ff ff ff 	movzx  eax,WORD PTR [rbp-0xea]
    11d4:	66 89 45 84          	mov    WORD PTR [rbp-0x7c],ax
    module*        mod  = 0;
    11d8:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    11df:	00 
    // module项设置
    //注册自己
    for (int i = 0; i < MAX_MODULES; i++) {
    11e0:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    11e7:	e9 d1 00 00 00       	jmp    12bd <load_elfso_old+0x12c>
        if (modules[i].type == ET_NONE) {
    11ec:	48 8b 0d e5 4d 00 00 	mov    rcx,QWORD PTR [rip+0x4de5]        # 5fd8 <modules-0x1c8>
    11f3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    11f6:	48 63 d0             	movsxd rdx,eax
    11f9:	48 89 d0             	mov    rax,rdx
    11fc:	48 01 c0             	add    rax,rax
    11ff:	48 01 d0             	add    rax,rdx
    1202:	48 c1 e0 05          	shl    rax,0x5
    1206:	48 01 c8             	add    rax,rcx
    1209:	48 83 c0 18          	add    rax,0x18
    120d:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1210:	48 85 c0             	test   rax,rax
    1213:	0f 85 a0 00 00 00    	jne    12b9 <load_elfso_old+0x128>
            modules[i].type        = ehdr.e_type;
    1219:	0f b7 85 f0 fe ff ff 	movzx  eax,WORD PTR [rbp-0x110]
    1220:	0f b7 d0             	movzx  edx,ax
    1223:	48 8b 35 ae 4d 00 00 	mov    rsi,QWORD PTR [rip+0x4dae]        # 5fd8 <modules-0x1c8>
    122a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    122d:	48 63 c8             	movsxd rcx,eax
    1230:	48 89 c8             	mov    rax,rcx
    1233:	48 01 c0             	add    rax,rax
    1236:	48 01 c8             	add    rax,rcx
    1239:	48 c1 e0 05          	shl    rax,0x5
    123d:	48 01 f0             	add    rax,rsi
    1240:	48 83 c0 18          	add    rax,0x18
    1244:	48 89 10             	mov    QWORD PTR [rax],rdx
            modules[i].load_offset = 0;
    1247:	48 8b 0d 8a 4d 00 00 	mov    rcx,QWORD PTR [rip+0x4d8a]        # 5fd8 <modules-0x1c8>
    124e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1251:	48 63 d0             	movsxd rdx,eax
    1254:	48 89 d0             	mov    rax,rdx
    1257:	48 01 c0             	add    rax,rax
    125a:	48 01 d0             	add    rax,rdx
    125d:	48 c1 e0 05          	shl    rax,0x5
    1261:	48 01 c8             	add    rax,rcx
    1264:	48 83 c0 08          	add    rax,0x8
    1268:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            modules[i].base        = 0;
    126f:	48 8b 0d 62 4d 00 00 	mov    rcx,QWORD PTR [rip+0x4d62]        # 5fd8 <modules-0x1c8>
    1276:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1279:	48 63 d0             	movsxd rdx,eax
    127c:	48 89 d0             	mov    rax,rdx
    127f:	48 01 c0             	add    rax,rax
    1282:	48 01 d0             	add    rax,rdx
    1285:	48 c1 e0 05          	shl    rax,0x5
    1289:	48 01 c8             	add    rax,rcx
    128c:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            mod                    = modules + i;
    1293:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1296:	48 63 d0             	movsxd rdx,eax
    1299:	48 89 d0             	mov    rax,rdx
    129c:	48 01 c0             	add    rax,rax
    129f:	48 01 d0             	add    rax,rdx
    12a2:	48 c1 e0 05          	shl    rax,0x5
    12a6:	48 89 c2             	mov    rdx,rax
    12a9:	48 8b 05 28 4d 00 00 	mov    rax,QWORD PTR [rip+0x4d28]        # 5fd8 <modules-0x1c8>
    12b0:	48 01 d0             	add    rax,rdx
    12b3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
            break;
    12b7:	eb 0e                	jmp    12c7 <load_elfso_old+0x136>
    for (int i = 0; i < MAX_MODULES; i++) {
    12b9:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
    12bd:	83 7d f4 7f          	cmp    DWORD PTR [rbp-0xc],0x7f
    12c1:	0f 8e 25 ff ff ff    	jle    11ec <load_elfso_old+0x5b>
        }
    }
    //需要malloc一块内存
    Elf64_Phdr* ph = malloc(entn * ents);   //(Elf64_Phdr *) (tmpla + ehdr.e_phoff);
    12c7:	0f b7 55 86          	movzx  edx,WORD PTR [rbp-0x7a]
    12cb:	0f b7 45 84          	movzx  eax,WORD PTR [rbp-0x7c]
    12cf:	0f af c2             	imul   eax,edx
    12d2:	48 98                	cdqe   
    12d4:	48 89 c7             	mov    rdi,rax
    12d7:	e8 54 fd ff ff       	call   1030 <malloc@plt>
    12dc:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    seek(fno, ehdr.e_phoff, SEEK_SET);
    12e0:	48 8b 8d 00 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x100]
    12e7:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    12ed:	ba 00 00 00 00       	mov    edx,0x0
    12f2:	48 89 ce             	mov    rsi,rcx
    12f5:	89 c7                	mov    edi,eax
    12f7:	b8 00 00 00 00       	mov    eax,0x0
    12fc:	e8 8f fd ff ff       	call   1090 <seek@plt>
    read(fno, ph, entn * ents);
    1301:	0f b7 55 86          	movzx  edx,WORD PTR [rbp-0x7a]
    1305:	0f b7 45 84          	movzx  eax,WORD PTR [rbp-0x7c]
    1309:	0f af c2             	imul   eax,edx
    130c:	48 63 d0             	movsxd rdx,eax
    130f:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
    1313:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    1319:	48 89 ce             	mov    rsi,rcx
    131c:	89 c7                	mov    edi,eax
    131e:	e8 3d fd ff ff       	call   1060 <read@plt>
    size_t tot_sz = 0;
    1323:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
    132a:	00 00 00 00 
    off_t  base = ph->p_vaddr, offset = 0;
    132e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1332:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    1336:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    133d:	48 c7 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],0x0
    1344:	00 00 00 00 
    int (**init)() = 0, init_arraysz = 0;
    1348:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    134f:	00 
    1350:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0

    for (int i = 0; i < entn; i++) {
    1357:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [rbp-0x28],0x0
    135e:	e9 ca 00 00 00       	jmp    142d <load_elfso_old+0x29c>
        //加载段
        if ((ph->p_type | PT_LOAD) != 0) {
            unsigned long off  = ph->p_offset;
    1363:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1367:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    136b:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
            unsigned long fs   = ph->p_filesz;
    1372:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1376:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    137a:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            size_t        ms   = ph->p_memsz;
    1381:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1385:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    1389:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            char*         vptr = (char*)ph->p_vaddr + offset;
    1390:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1394:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    1398:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    139f:	48 01 d0             	add    rax,rdx
    13a2:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            if (off == 0) {
    13a9:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
    13b0:	00 
    13b1:	75 0f                	jne    13c2 <load_elfso_old+0x231>
                mod->header = vptr;
    13b3:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
    13ba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    13be:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
            }
            //先映射好内存
            int prot = PROT_READ;
    13c2:	c7 85 24 ff ff ff 01 	mov    DWORD PTR [rbp-0xdc],0x1
    13c9:	00 00 00 
            if ((ph->p_flags | PF_X))
                prot |= PROT_EXEC;
    13cc:	83 8d 24 ff ff ff 04 	or     DWORD PTR [rbp-0xdc],0x4
            if ((ph->p_flags | PF_W))
                prot |= PROT_WRITE;
    13d3:	83 8d 24 ff ff ff 02 	or     DWORD PTR [rbp-0xdc],0x2
            int flags = MAP_PRIVATE;
    13da:	c7 45 d4 02 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x2
            if (ehdr.e_type == ET_EXEC)
    13e1:	0f b7 85 f0 fe ff ff 	movzx  eax,WORD PTR [rbp-0x110]
    13e8:	66 83 f8 02          	cmp    ax,0x2
    13ec:	75 04                	jne    13f2 <load_elfso_old+0x261>
                flags |= MAP_FIXED;
    13ee:	83 4d d4 01          	or     DWORD PTR [rbp-0x2c],0x1
            mmap(vptr, fs, prot, flags, fno, off);
    13f2:	4c 8b 85 40 ff ff ff 	mov    r8,QWORD PTR [rbp-0xc0]
    13f9:	8b bd dc fe ff ff    	mov    edi,DWORD PTR [rbp-0x124]
    13ff:	8b 4d d4             	mov    ecx,DWORD PTR [rbp-0x2c]
    1402:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
    1408:	48 8b b5 38 ff ff ff 	mov    rsi,QWORD PTR [rbp-0xc8]
    140f:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    1416:	4d 89 c1             	mov    r9,r8
    1419:	41 89 f8             	mov    r8d,edi
    141c:	48 89 c7             	mov    rdi,rax
    141f:	e8 2c fc ff ff       	call   1050 <mmap@plt>
        }
        ph++;
    1424:	48 83 45 e8 38       	add    QWORD PTR [rbp-0x18],0x38
    for (int i = 0; i < entn; i++) {
    1429:	83 45 d8 01          	add    DWORD PTR [rbp-0x28],0x1
    142d:	0f b7 45 86          	movzx  eax,WORD PTR [rbp-0x7a]
    1431:	39 45 d8             	cmp    DWORD PTR [rbp-0x28],eax
    1434:	0f 8c 29 ff ff ff    	jl     1363 <load_elfso_old+0x1d2>
    }

    Elf64_Dyn* dynamic = 0;
    143a:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
    1441:	00 
    //寻找dynamic段
    struct Elf64_Shdr* shdr =
        mmap(0, ehdr.e_shentsize * ehdr.e_shnum, PROT_READ, MAP_PRIVATE, fno, ehdr.e_shoff);
    1442:	48 8b 8d 08 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xf8]
    1449:	0f b7 85 1a ff ff ff 	movzx  eax,WORD PTR [rbp-0xe6]
    1450:	0f b7 d0             	movzx  edx,ax
    1453:	0f b7 85 1c ff ff ff 	movzx  eax,WORD PTR [rbp-0xe4]
    145a:	0f b7 c0             	movzx  eax,ax
    145d:	0f af c2             	imul   eax,edx
    1460:	48 98                	cdqe   
    1462:	8b 95 dc fe ff ff    	mov    edx,DWORD PTR [rbp-0x124]
    1468:	49 89 c9             	mov    r9,rcx
    146b:	41 89 d0             	mov    r8d,edx
    146e:	b9 02 00 00 00       	mov    ecx,0x2
    1473:	ba 01 00 00 00       	mov    edx,0x1
    1478:	48 89 c6             	mov    rsi,rax
    147b:	bf 00 00 00 00       	mov    edi,0x0
    1480:	e8 cb fb ff ff       	call   1050 <mmap@plt>
    1485:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    mod->p_shdrs = shdr;
    148c:	48 8b 95 60 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xa0]
    1493:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1497:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
    for (int i = 0; i < ehdr.e_shnum; i++) {
    149b:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
    14a2:	eb 3e                	jmp    14e2 <load_elfso_old+0x351>
        if (shdr[i].sh_type == SHT_DYNAMIC) {
    14a4:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    14a7:	48 98                	cdqe   
    14a9:	48 c1 e0 06          	shl    rax,0x6
    14ad:	48 89 c2             	mov    rdx,rax
    14b0:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    14b7:	48 01 d0             	add    rax,rdx
    14ba:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    14bd:	83 f8 06             	cmp    eax,0x6
    14c0:	75 1c                	jne    14de <load_elfso_old+0x34d>
            dynamic = shdr + i;
    14c2:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    14c5:	48 98                	cdqe   
    14c7:	48 c1 e0 06          	shl    rax,0x6
    14cb:	48 89 c2             	mov    rdx,rax
    14ce:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    14d5:	48 01 d0             	add    rax,rdx
    14d8:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            break;
    14dc:	eb 13                	jmp    14f1 <load_elfso_old+0x360>
    for (int i = 0; i < ehdr.e_shnum; i++) {
    14de:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
    14e2:	0f b7 85 1c ff ff ff 	movzx  eax,WORD PTR [rbp-0xe4]
    14e9:	0f b7 c0             	movzx  eax,ax
    14ec:	39 45 c4             	cmp    DWORD PTR [rbp-0x3c],eax
    14ef:	7c b3                	jl     14a4 <load_elfso_old+0x313>
        }
    }
    if (!dynamic)
        ;
    char*  dynstr = 0;
    14f1:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
    14f8:	00 
    off_t* got    = 0;
    14f9:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
    1500:	00 00 00 00 
    //这里一堆获取函数之后实现细节
    // dynstr=so_get_dynstr(dyn);
    // so_get_dynstr从so中获取.dynstr节
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    1504:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    1508:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
    150c:	eb 2a                	jmp    1538 <load_elfso_old+0x3a7>
        if (p->d_tag == DT_STRTAB) {
    150e:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    1512:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1515:	48 83 f8 05          	cmp    rax,0x5
    1519:	75 18                	jne    1533 <load_elfso_old+0x3a2>
            dynstr = p->d_un.d_ptr + offset;
    151b:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    151f:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1523:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    152a:	48 01 d0             	add    rax,rdx
    152d:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
            break;
    1531:	eb 11                	jmp    1544 <load_elfso_old+0x3b3>
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    1533:	48 83 45 b0 10       	add    QWORD PTR [rbp-0x50],0x10
    1538:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    153c:	48 8b 00             	mov    rax,QWORD PTR [rax]
    153f:	48 85 c0             	test   rax,rax
    1542:	75 ca                	jne    150e <load_elfso_old+0x37d>
        }
    }

    size_t relsz = 0, relentsz = 0;
    1544:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
    154b:	00 
    154c:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    1553:	00 
    off_t  relptr = 0;
    1554:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    155b:	00 
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    155c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    1560:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    1564:	e9 1d 02 00 00       	jmp    1786 <load_elfso_old+0x5f5>
        switch (p->d_tag) {
    1569:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    156d:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1570:	48 83 f8 1b          	cmp    rax,0x1b
    1574:	0f 87 4d 01 00 00    	ja     16c7 <load_elfso_old+0x536>
    157a:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    1581:	00 
    1582:	48 8d 05 77 2a 00 00 	lea    rax,[rip+0x2a77]        # 4000 <chkmmap+0x290>
    1589:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    158c:	48 98                	cdqe   
    158e:	48 8d 15 6b 2a 00 00 	lea    rdx,[rip+0x2a6b]        # 4000 <chkmmap+0x290>
    1595:	48 01 d0             	add    rax,rdx
    1598:	3e ff e0             	notrack jmp rax
        case DT_NEEDED:
            char* pathname = p->d_un.d_val + dynstr;
    159b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    159f:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    15a3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    15a7:	48 01 d0             	add    rax,rdx
    15aa:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
            int   so_fno   = open(pathname, O_EXEC);
    15b1:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
    15b8:	be 00 10 00 00       	mov    esi,0x1000
    15bd:	48 89 c7             	mov    rdi,rax
    15c0:	e8 fb fa ff ff       	call   10c0 <open@plt>
    15c5:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
            //不查错了
            load_elfso(open(pathname, O_EXEC));
    15cb:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
    15d2:	be 00 10 00 00       	mov    esi,0x1000
    15d7:	48 89 c7             	mov    rdi,rax
    15da:	e8 e1 fa ff ff       	call   10c0 <open@plt>
    15df:	89 c7                	mov    edi,eax
    15e1:	e8 ba fa ff ff       	call   10a0 <load_elfso@plt>
            close(so_fno);
    15e6:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
    15ec:	89 c7                	mov    edi,eax
    15ee:	e8 dd fa ff ff       	call   10d0 <close@plt>

            break;
    15f3:	e9 d0 00 00 00       	jmp    16c8 <load_elfso_old+0x537>
        case DT_PLTGOT:
            got = p->d_un.d_ptr + offset;
    15f8:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    15fc:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1600:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    1607:	48 01 d0             	add    rax,rdx
    160a:	48 89 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rax

            //赋值为dl的运行时重定位函数
            got[2] = dl_runtime_resolve;
    1611:	48 8b 85 58 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa8]
    1618:	48 83 c0 10          	add    rax,0x10
    161c:	48 8d 15 f8 11 00 00 	lea    rdx,[rip+0x11f8]        # 281b <dl_runtime_resolve>
    1623:	48 89 10             	mov    QWORD PTR [rax],rdx
            //填入模块id
            got[1]     = mod - modules;
    1626:	48 8b 05 ab 49 00 00 	mov    rax,QWORD PTR [rip+0x49ab]        # 5fd8 <modules-0x1c8>
    162d:	48 89 c2             	mov    rdx,rax
    1630:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1634:	48 29 d0             	sub    rax,rdx
    1637:	48 c1 f8 05          	sar    rax,0x5
    163b:	48 89 c2             	mov    rdx,rax
    163e:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
    1645:	aa aa aa 
    1648:	48 0f af c2          	imul   rax,rdx
    164c:	48 89 c2             	mov    rdx,rax
    164f:	48 8b 85 58 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa8]
    1656:	48 83 c0 08          	add    rax,0x8
    165a:	48 89 10             	mov    QWORD PTR [rax],rdx
            mod->p_got = got;
    165d:	48 8b 95 58 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xa8]
    1664:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1668:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
        case DT_SYMTAB: mod->p_symbol = p->d_un.d_ptr; break;
    166c:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1670:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1674:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1678:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    167c:	eb 4a                	jmp    16c8 <load_elfso_old+0x537>
        case DT_RELSZ:
        case DT_RELASZ: relsz = p->d_un.d_val; goto is_rel_prepared;
    167e:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1682:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1686:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    168a:	eb 41                	jmp    16cd <load_elfso_old+0x53c>
        case DT_REL:
        case DT_RELA: relptr = p->d_un.d_ptr; goto is_rel_prepared;
    168c:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1690:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1694:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    1698:	eb 33                	jmp    16cd <load_elfso_old+0x53c>
        case DT_RELENT:
        case DT_RELAENT: relentsz = p->d_un.d_val; goto is_rel_prepared;
    169a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    169e:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    16a2:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
    16a6:	eb 25                	jmp    16cd <load_elfso_old+0x53c>
        case DT_INIT_ARRAY: init = p->d_un.d_ptr; break;
    16a8:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    16ac:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    16b0:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    16b4:	eb 12                	jmp    16c8 <load_elfso_old+0x537>
        case DT_INIT_ARRAYSZ: init_arraysz = p->d_un.d_val / 8; break;
    16b6:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    16ba:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    16be:	48 c1 e8 03          	shr    rax,0x3
    16c2:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    16c5:	eb 01                	jmp    16c8 <load_elfso_old+0x537>
        default: break;
    16c7:	90                   	nop
        }
        continue;
    16c8:	e9 b4 00 00 00       	jmp    1781 <load_elfso_old+0x5f0>
    is_rel_prepared:
        if (!(relsz && relentsz && relptr))
    16cd:	48 83 7d a8 00       	cmp    QWORD PTR [rbp-0x58],0x0
    16d2:	0f 84 a8 00 00 00    	je     1780 <load_elfso_old+0x5ef>
    16d8:	48 83 7d a0 00       	cmp    QWORD PTR [rbp-0x60],0x0
    16dd:	0f 84 9d 00 00 00    	je     1780 <load_elfso_old+0x5ef>
    16e3:	48 83 7d 98 00       	cmp    QWORD PTR [rbp-0x68],0x0
    16e8:	0f 84 92 00 00 00    	je     1780 <load_elfso_old+0x5ef>
            continue;
        for (int j = 0; j < relsz / relentsz; j++) {
    16ee:	c7 45 8c 00 00 00 00 	mov    DWORD PTR [rbp-0x74],0x0
    16f5:	eb 57                	jmp    174e <load_elfso_old+0x5bd>
            fill_reloc(relptr + j * relentsz, mod - modules, shdr, 0);
    16f7:	48 8b 05 da 48 00 00 	mov    rax,QWORD PTR [rip+0x48da]        # 5fd8 <modules-0x1c8>
    16fe:	48 89 c2             	mov    rdx,rax
    1701:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1705:	48 29 d0             	sub    rax,rdx
    1708:	48 c1 f8 05          	sar    rax,0x5
    170c:	48 89 c2             	mov    rdx,rax
    170f:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
    1716:	aa aa aa 
    1719:	48 0f af c2          	imul   rax,rdx
    171d:	89 c6                	mov    esi,eax
    171f:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    1722:	48 98                	cdqe   
    1724:	48 0f af 45 a0       	imul   rax,QWORD PTR [rbp-0x60]
    1729:	48 89 c2             	mov    rdx,rax
    172c:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
    1730:	48 01 d0             	add    rax,rdx
    1733:	48 89 c7             	mov    rdi,rax
    1736:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    173d:	b9 00 00 00 00       	mov    ecx,0x0
    1742:	48 89 c2             	mov    rdx,rax
    1745:	e8 f6 f8 ff ff       	call   1040 <fill_reloc@plt>
        for (int j = 0; j < relsz / relentsz; j++) {
    174a:	83 45 8c 01          	add    DWORD PTR [rbp-0x74],0x1
    174e:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    1751:	48 63 c8             	movsxd rcx,eax
    1754:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
    1758:	ba 00 00 00 00       	mov    edx,0x0
    175d:	48 f7 75 a0          	div    QWORD PTR [rbp-0x60]
    1761:	48 39 c1             	cmp    rcx,rax
    1764:	72 91                	jb     16f7 <load_elfso_old+0x566>
        }
        relsz = relentsz = relptr = 0;
    1766:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    176d:	00 
    176e:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    1775:	00 
    1776:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    177a:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    177e:	eb 01                	jmp    1781 <load_elfso_old+0x5f0>
            continue;
    1780:	90                   	nop
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    1781:	48 83 45 90 10       	add    QWORD PTR [rbp-0x70],0x10
    1786:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    178a:	48 8b 00             	mov    rax,QWORD PTR [rax]
    178d:	48 85 c0             	test   rax,rax
    1790:	0f 85 d3 fd ff ff    	jne    1569 <load_elfso_old+0x3d8>
    }
    if (init) {
    1796:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
    179b:	74 33                	je     17d0 <load_elfso_old+0x63f>
        //调用模块入口函数
        for (int i = 0; i < init_arraysz; i++) {
    179d:	c7 45 88 00 00 00 00 	mov    DWORD PTR [rbp-0x78],0x0
    17a4:	eb 22                	jmp    17c8 <load_elfso_old+0x637>
            (init[i])();
    17a6:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    17a9:	48 98                	cdqe   
    17ab:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
    17b2:	00 
    17b3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    17b7:	48 01 d0             	add    rax,rdx
    17ba:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    17bd:	b8 00 00 00 00       	mov    eax,0x0
    17c2:	ff d2                	call   rdx
        for (int i = 0; i < init_arraysz; i++) {
    17c4:	83 45 88 01          	add    DWORD PTR [rbp-0x78],0x1
    17c8:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    17cb:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
    17ce:	7c d6                	jl     17a6 <load_elfso_old+0x615>
        }
    }
    free(&ehdr);
    17d0:	48 8d 85 e0 fe ff ff 	lea    rax,[rbp-0x120]
    17d7:	48 89 c7             	mov    rdi,rax
    17da:	e8 01 f9 ff ff       	call   10e0 <free@plt>
    return 0;
    17df:	b8 00 00 00 00       	mov    eax,0x0
}
    17e4:	c9                   	leave  
    17e5:	c3                   	ret    

00000000000017e6 <load_elfso>:
Elf64_Ehdr ehdr;
//切换进程前,在execve系统调用中
int load_elfso(int fildes)
{
    17e6:	f3 0f 1e fa          	endbr64 
    17ea:	55                   	push   rbp
    17eb:	48 89 e5             	mov    rbp,rsp
    17ee:	48 81 ec 90 02 00 00 	sub    rsp,0x290
    17f5:	89 bd 7c fd ff ff    	mov    DWORD PTR [rbp-0x284],edi
    extern int chkmmap(off_t, size_t);
    extern int seek(int, off_t, int);
    read(fildes, &ehdr, sizeof(ehdr));
    17fb:	8b 85 7c fd ff ff    	mov    eax,DWORD PTR [rbp-0x284]
    1801:	ba 40 00 00 00       	mov    edx,0x40
    1806:	48 8b 0d e3 47 00 00 	mov    rcx,QWORD PTR [rip+0x47e3]        # 5ff0 <ehdr-0x31d0>
    180d:	48 89 ce             	mov    rsi,rcx
    1810:	89 c7                	mov    edi,eax
    1812:	e8 49 f8 ff ff       	call   1060 <read@plt>
    off_t          entry = ehdr.e_entry;
    1817:	48 8b 05 d2 47 00 00 	mov    rax,QWORD PTR [rip+0x47d2]        # 5ff0 <ehdr-0x31d0>
    181e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
    1822:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
    unsigned short entn  = ehdr.e_phnum;
    1829:	48 8b 05 c0 47 00 00 	mov    rax,QWORD PTR [rip+0x47c0]        # 5ff0 <ehdr-0x31d0>
    1830:	0f b7 40 38          	movzx  eax,WORD PTR [rax+0x38]
    1834:	66 89 85 fe fe ff ff 	mov    WORD PTR [rbp-0x102],ax
    unsigned short ents  = ehdr.e_phentsize;
    183b:	48 8b 05 ae 47 00 00 	mov    rax,QWORD PTR [rip+0x47ae]        # 5ff0 <ehdr-0x31d0>
    1842:	0f b7 40 36          	movzx  eax,WORD PTR [rax+0x36]
    1846:	66 89 85 fc fe ff ff 	mov    WORD PTR [rbp-0x104],ax
    off_t          shla  = malloc(ehdr.e_shnum * ehdr.e_shentsize);
    184d:	48 8b 05 9c 47 00 00 	mov    rax,QWORD PTR [rip+0x479c]        # 5ff0 <ehdr-0x31d0>
    1854:	0f b7 40 3c          	movzx  eax,WORD PTR [rax+0x3c]
    1858:	0f b7 d0             	movzx  edx,ax
    185b:	48 8b 05 8e 47 00 00 	mov    rax,QWORD PTR [rip+0x478e]        # 5ff0 <ehdr-0x31d0>
    1862:	0f b7 40 3a          	movzx  eax,WORD PTR [rax+0x3a]
    1866:	0f b7 c0             	movzx  eax,ax
    1869:	0f af c2             	imul   eax,edx
    186c:	48 98                	cdqe   
    186e:	48 89 c7             	mov    rdi,rax
    1871:	e8 ba f7 ff ff       	call   1030 <malloc@plt>
    1876:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
    seek(fildes, ehdr.e_shoff, SEEK_SET);
    187d:	48 8b 05 6c 47 00 00 	mov    rax,QWORD PTR [rip+0x476c]        # 5ff0 <ehdr-0x31d0>
    1884:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
    1888:	8b 85 7c fd ff ff    	mov    eax,DWORD PTR [rbp-0x284]
    188e:	ba 00 00 00 00       	mov    edx,0x0
    1893:	48 89 ce             	mov    rsi,rcx
    1896:	89 c7                	mov    edi,eax
    1898:	e8 f3 f7 ff ff       	call   1090 <seek@plt>
    read(fildes, shla, ehdr.e_shnum * ehdr.e_shentsize);
    189d:	48 8b 05 4c 47 00 00 	mov    rax,QWORD PTR [rip+0x474c]        # 5ff0 <ehdr-0x31d0>
    18a4:	0f b7 40 3c          	movzx  eax,WORD PTR [rax+0x3c]
    18a8:	0f b7 d0             	movzx  edx,ax
    18ab:	48 8b 05 3e 47 00 00 	mov    rax,QWORD PTR [rip+0x473e]        # 5ff0 <ehdr-0x31d0>
    18b2:	0f b7 40 3a          	movzx  eax,WORD PTR [rax+0x3a]
    18b6:	0f b7 c0             	movzx  eax,ax
    18b9:	0f af c2             	imul   eax,edx
    18bc:	48 63 d0             	movsxd rdx,eax
    18bf:	48 8b 8d f0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x110]
    18c6:	8b 85 7c fd ff ff    	mov    eax,DWORD PTR [rbp-0x284]
    18cc:	48 89 ce             	mov    rsi,rcx
    18cf:	89 c7                	mov    edi,eax
    18d1:	e8 8a f7 ff ff       	call   1060 <read@plt>

    struct Elf64_Shdr* sh = (struct Elf64_Shdr*)(shla);
    18d6:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
    18dd:	48 89 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rax
    Elf64_Phdr*        ph = malloc(entn * ents);
    18e4:	0f b7 95 fe fe ff ff 	movzx  edx,WORD PTR [rbp-0x102]
    18eb:	0f b7 85 fc fe ff ff 	movzx  eax,WORD PTR [rbp-0x104]
    18f2:	0f af c2             	imul   eax,edx
    18f5:	48 98                	cdqe   
    18f7:	48 89 c7             	mov    rdi,rax
    18fa:	e8 31 f7 ff ff       	call   1030 <malloc@plt>
    18ff:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    seek(fildes, ehdr.e_phoff, SEEK_SET);
    1903:	48 8b 05 e6 46 00 00 	mov    rax,QWORD PTR [rip+0x46e6]        # 5ff0 <ehdr-0x31d0>
    190a:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
    190e:	8b 85 7c fd ff ff    	mov    eax,DWORD PTR [rbp-0x284]
    1914:	ba 00 00 00 00       	mov    edx,0x0
    1919:	48 89 ce             	mov    rsi,rcx
    191c:	89 c7                	mov    edi,eax
    191e:	e8 6d f7 ff ff       	call   1090 <seek@plt>
    read(fildes, ph, entn * ents);
    1923:	0f b7 95 fe fe ff ff 	movzx  edx,WORD PTR [rbp-0x102]
    192a:	0f b7 85 fc fe ff ff 	movzx  eax,WORD PTR [rbp-0x104]
    1931:	0f af c2             	imul   eax,edx
    1934:	48 63 d0             	movsxd rdx,eax
    1937:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
    193b:	8b 85 7c fd ff ff    	mov    eax,DWORD PTR [rbp-0x284]
    1941:	48 89 ce             	mov    rsi,rcx
    1944:	89 c7                	mov    edi,eax
    1946:	e8 15 f7 ff ff       	call   1060 <read@plt>
    size_t tot_sz = 0;
    194b:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
    1952:	00 
    off_t  base = ph->p_vaddr, offset = 0;
    1953:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1957:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    195b:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    195f:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    1966:	00 
    int    reloc_flag = 0;
    1967:	c7 85 e4 fe ff ff 00 	mov    DWORD PTR [rbp-0x11c],0x0
    196e:	00 00 00 
    //判断是否为DYN
    if (ehdr.e_type == ET_DYN) {
    1971:	48 8b 05 78 46 00 00 	mov    rax,QWORD PTR [rip+0x4678]        # 5ff0 <ehdr-0x31d0>
    1978:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
    197c:	66 83 f8 03          	cmp    ax,0x3
    1980:	0f 85 28 01 00 00    	jne    1aae <load_elfso+0x2c8>
        reloc_flag = 1;
    1986:	c7 85 e4 fe ff ff 01 	mov    DWORD PTR [rbp-0x11c],0x1
    198d:	00 00 00 
        for (int i = 0; i < ehdr.e_phnum; i++) {
    1990:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
    1997:	eb 78                	jmp    1a11 <load_elfso+0x22b>
            tot_sz += ph[i].p_memsz;
    1999:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    199c:	48 63 d0             	movsxd rdx,eax
    199f:	48 89 d0             	mov    rax,rdx
    19a2:	48 c1 e0 03          	shl    rax,0x3
    19a6:	48 29 d0             	sub    rax,rdx
    19a9:	48 c1 e0 03          	shl    rax,0x3
    19ad:	48 89 c2             	mov    rdx,rax
    19b0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    19b4:	48 01 d0             	add    rax,rdx
    19b7:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    19bb:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
            if (ph[i].p_vaddr < base)
    19bf:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    19c2:	48 63 d0             	movsxd rdx,eax
    19c5:	48 89 d0             	mov    rax,rdx
    19c8:	48 c1 e0 03          	shl    rax,0x3
    19cc:	48 29 d0             	sub    rax,rdx
    19cf:	48 c1 e0 03          	shl    rax,0x3
    19d3:	48 89 c2             	mov    rdx,rax
    19d6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    19da:	48 01 d0             	add    rax,rdx
    19dd:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    19e1:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
    19e5:	76 26                	jbe    1a0d <load_elfso+0x227>
                base = ph[i].p_vaddr;
    19e7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    19ea:	48 63 d0             	movsxd rdx,eax
    19ed:	48 89 d0             	mov    rax,rdx
    19f0:	48 c1 e0 03          	shl    rax,0x3
    19f4:	48 29 d0             	sub    rax,rdx
    19f7:	48 c1 e0 03          	shl    rax,0x3
    19fb:	48 89 c2             	mov    rdx,rax
    19fe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1a02:	48 01 d0             	add    rax,rdx
    1a05:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    1a09:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for (int i = 0; i < ehdr.e_phnum; i++) {
    1a0d:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
    1a11:	48 8b 05 d8 45 00 00 	mov    rax,QWORD PTR [rip+0x45d8]        # 5ff0 <ehdr-0x31d0>
    1a18:	0f b7 40 38          	movzx  eax,WORD PTR [rax+0x38]
    1a1c:	0f b7 c0             	movzx  eax,ax
    1a1f:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
    1a22:	0f 8c 71 ff ff ff    	jl     1999 <load_elfso+0x1b3>
        }
        /*
        似乎有的系统支持单个段的重定位。但是这样在有些重定位方式下，尤其是跨段的相对地址调用来说，这会带来大难度，
        所以这里先整体移动。*/
        if (!chkmmap(base, tot_sz)) {
    1a28:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
    1a2c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1a30:	48 89 d6             	mov    rsi,rdx
    1a33:	48 89 c7             	mov    rdi,rax
    1a36:	e8 75 f6 ff ff       	call   10b0 <chkmmap@plt>
    1a3b:	85 c0                	test   eax,eax
    1a3d:	75 6f                	jne    1aae <load_elfso+0x2c8>
            //原来的地方已经被映射
            //需要重定位
            //找到另一块大小符合的连续虚拟内存，然后返回首地址（不映射，下面手动映射）
            reloc_flag     = 2;
    1a3f:	c7 85 e4 fe ff ff 02 	mov    DWORD PTR [rbp-0x11c],0x2
    1a46:	00 00 00 
            off_t new_base = base + 4096;
    1a49:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1a4d:	48 05 00 10 00 00    	add    rax,0x1000
    1a53:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            while (!chkmmap(new_base, tot_sz) && new_base < KNL_BASE) {
    1a57:	eb 08                	jmp    1a61 <load_elfso+0x27b>
                new_base += 4096;
    1a59:	48 81 45 d0 00 10 00 	add    QWORD PTR [rbp-0x30],0x1000
    1a60:	00 
            while (!chkmmap(new_base, tot_sz) && new_base < KNL_BASE) {
    1a61:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
    1a65:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    1a69:	48 89 d6             	mov    rsi,rdx
    1a6c:	48 89 c7             	mov    rdi,rax
    1a6f:	e8 3c f6 ff ff       	call   10b0 <chkmmap@plt>
    1a74:	85 c0                	test   eax,eax
    1a76:	75 10                	jne    1a88 <load_elfso+0x2a2>
    1a78:	48 b8 ff ff ff ff ff 	movabs rax,0xffff7fffffffffff
    1a7f:	7f ff ff 
    1a82:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
    1a86:	76 d1                	jbe    1a59 <load_elfso+0x273>
            }
            if (new_base >= KNL_BASE) {
    1a88:	48 b8 ff ff ff ff ff 	movabs rax,0xffff7fffffffffff
    1a8f:	7f ff ff 
    1a92:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
    1a96:	76 0a                	jbe    1aa2 <load_elfso+0x2bc>
                return -ENOMEM;
    1a98:	b8 cf ff ff ff       	mov    eax,0xffffffcf
    1a9d:	e9 f1 09 00 00       	jmp    2493 <load_elfso+0xcad>
            }
            offset = new_base - base;
    1aa2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    1aa6:	48 2b 45 e8          	sub    rax,QWORD PTR [rbp-0x18]
    1aaa:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        }
    }


    module* mod      = 0;
    1aae:	48 c7 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],0x0
    1ab5:	00 00 00 00 
    int     elfid    = reg_module();
    1ab9:	b8 00 00 00 00       	mov    eax,0x0
    1abe:	e8 cb 10 00 00       	call   2b8e <reg_module>
    1ac3:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
    mod              = modules + elfid;
    1ac9:	8b 85 d4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x12c]
    1acf:	48 63 d0             	movsxd rdx,eax
    1ad2:	48 89 d0             	mov    rax,rdx
    1ad5:	48 01 c0             	add    rax,rax
    1ad8:	48 01 d0             	add    rax,rdx
    1adb:	48 c1 e0 05          	shl    rax,0x5
    1adf:	48 89 c2             	mov    rdx,rax
    1ae2:	48 8b 05 ef 44 00 00 	mov    rax,QWORD PTR [rip+0x44ef]        # 5fd8 <modules-0x1c8>
    1ae9:	48 01 d0             	add    rax,rdx
    1aec:	48 89 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rax
    mod->type        = ehdr.e_type;
    1af3:	48 8b 05 f6 44 00 00 	mov    rax,QWORD PTR [rip+0x44f6]        # 5ff0 <ehdr-0x31d0>
    1afa:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
    1afe:	0f b7 d0             	movzx  edx,ax
    1b01:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1b08:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    mod->load_offset = offset;
    1b0c:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1b13:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    1b17:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    mod->base        = base + offset;
    1b1b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    1b1f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b23:	48 01 c2             	add    rdx,rax
    1b26:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1b2d:	48 89 10             	mov    QWORD PTR [rax],rdx
    mod->p_shdrs     = base + offset + ehdr.e_shoff;
    1b30:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    1b34:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b38:	48 01 c2             	add    rdx,rax
    1b3b:	48 8b 05 ae 44 00 00 	mov    rax,QWORD PTR [rip+0x44ae]        # 5ff0 <ehdr-0x31d0>
    1b42:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    1b46:	48 01 c2             	add    rdx,rax
    1b49:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1b50:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx

    //找dynamic段
    struct Elf64_Shdr* dynamic  = 0;
    1b54:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
    1b5b:	00 
    off_t*             got      = 0;
    1b5c:	48 c7 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],0x0
    1b63:	00 00 00 00 
    size_t             got_size = 0;
    1b67:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
    1b6e:	00 

    for (int i = 0; i < ehdr.e_shnum; i++) {
    1b6f:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
    1b76:	e9 83 00 00 00       	jmp    1bfe <load_elfso+0x418>
        if (sh[i].sh_type == SHT_DYNSYM) {
    1b7b:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
    1b7e:	48 98                	cdqe   
    1b80:	48 c1 e0 06          	shl    rax,0x6
    1b84:	48 89 c2             	mov    rdx,rax
    1b87:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1b8e:	48 01 d0             	add    rax,rdx
    1b91:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1b94:	83 f8 0b             	cmp    eax,0xb
    1b97:	75 27                	jne    1bc0 <load_elfso+0x3da>
            mod->s_symtabsz = sh[i].sh_size;
    1b99:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
    1b9c:	48 98                	cdqe   
    1b9e:	48 c1 e0 06          	shl    rax,0x6
    1ba2:	48 89 c2             	mov    rdx,rax
    1ba5:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1bac:	48 01 d0             	add    rax,rdx
    1baf:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
    1bb3:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1bba:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    1bbe:	eb 3a                	jmp    1bfa <load_elfso+0x414>
        }
        else if (sh[i].sh_type == SHT_DYNAMIC) {
    1bc0:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
    1bc3:	48 98                	cdqe   
    1bc5:	48 c1 e0 06          	shl    rax,0x6
    1bc9:	48 89 c2             	mov    rdx,rax
    1bcc:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1bd3:	48 01 d0             	add    rax,rdx
    1bd6:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1bd9:	83 f8 06             	cmp    eax,0x6
    1bdc:	75 1c                	jne    1bfa <load_elfso+0x414>
            dynamic = sh + i;
    1bde:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
    1be1:	48 98                	cdqe   
    1be3:	48 c1 e0 06          	shl    rax,0x6
    1be7:	48 89 c2             	mov    rdx,rax
    1bea:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1bf1:	48 01 d0             	add    rax,rdx
    1bf4:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            break;
    1bf8:	eb 1b                	jmp    1c15 <load_elfso+0x42f>
    for (int i = 0; i < ehdr.e_shnum; i++) {
    1bfa:	83 45 bc 01          	add    DWORD PTR [rbp-0x44],0x1
    1bfe:	48 8b 05 eb 43 00 00 	mov    rax,QWORD PTR [rip+0x43eb]        # 5ff0 <ehdr-0x31d0>
    1c05:	0f b7 40 3c          	movzx  eax,WORD PTR [rax+0x3c]
    1c09:	0f b7 c0             	movzx  eax,ax
    1c0c:	39 45 bc             	cmp    DWORD PTR [rbp-0x44],eax
    1c0f:	0f 8c 66 ff ff ff    	jl     1b7b <load_elfso+0x395>
        }
    }
    //程序占用的最高地址，这里就是堆开始分配的地方
    off_t max_allocated = 0;
    1c15:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
    1c1c:	00 
    for (int i = 0; i < entn; i++) {
    1c1d:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
    1c24:	e9 12 01 00 00       	jmp    1d3b <load_elfso+0x555>
        //加载段
        if (ph->p_type == PT_LOAD) {
    1c29:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c2d:	8b 00                	mov    eax,DWORD PTR [rax]
    1c2f:	83 f8 01             	cmp    eax,0x1
    1c32:	0f 85 fa 00 00 00    	jne    1d32 <load_elfso+0x54c>
            unsigned long off  = ph->p_offset;
    1c38:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c3c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1c40:	48 89 85 a0 fe ff ff 	mov    QWORD PTR [rbp-0x160],rax
            unsigned long fs   = ph->p_filesz;
    1c47:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c4b:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    1c4f:	48 89 85 98 fe ff ff 	mov    QWORD PTR [rbp-0x168],rax
            size_t        ms   = ph->p_memsz;
    1c56:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c5a:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    1c5e:	48 89 85 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],rax
            char*         vptr = (char*)ph->p_vaddr + offset;
    1c65:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c69:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    1c6d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1c71:	48 01 d0             	add    rax,rdx
    1c74:	48 89 85 88 fe ff ff 	mov    QWORD PTR [rbp-0x178],rax
            if (max_allocated < vptr + ms)
    1c7b:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
    1c82:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
    1c89:	48 01 c2             	add    rdx,rax
    1c8c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    1c90:	48 39 c2             	cmp    rdx,rax
    1c93:	76 15                	jbe    1caa <load_elfso+0x4c4>
                max_allocated = vptr + ms;
    1c95:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
    1c9c:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
    1ca3:	48 01 d0             	add    rax,rdx
    1ca6:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
            if (off == 0) {
    1caa:	48 83 bd a0 fe ff ff 	cmp    QWORD PTR [rbp-0x160],0x0
    1cb1:	00 
    1cb2:	75 12                	jne    1cc6 <load_elfso+0x4e0>
                mod->header = vptr;
    1cb4:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
    1cbb:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1cc2:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
            }
            //先映射好内存，访问时再分配内存
            int attr = PROT_READ;
    1cc6:	c7 45 a8 01 00 00 00 	mov    DWORD PTR [rbp-0x58],0x1
            if ((ph->p_flags & PF_W))
    1ccd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1cd1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1cd4:	83 e0 02             	and    eax,0x2
    1cd7:	85 c0                	test   eax,eax
    1cd9:	74 04                	je     1cdf <load_elfso+0x4f9>
                attr |= PROT_WRITE;
    1cdb:	83 4d a8 02          	or     DWORD PTR [rbp-0x58],0x2
            if ((ph->p_flags & PF_X)) {
    1cdf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1ce3:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1ce6:	83 e0 01             	and    eax,0x1
    1ce9:	85 c0                	test   eax,eax
    1ceb:	74 04                	je     1cf1 <load_elfso+0x50b>
                attr |= PROT_EXEC;
    1ced:	83 4d a8 04          	or     DWORD PTR [rbp-0x58],0x4
            }
            if (mmap(vptr, ms, attr, MAP_FIXED | MAP_PRIVATE, fildes, off) == -1)
    1cf1:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
    1cf8:	8b 8d 7c fd ff ff    	mov    ecx,DWORD PTR [rbp-0x284]
    1cfe:	8b 55 a8             	mov    edx,DWORD PTR [rbp-0x58]
    1d01:	48 8b b5 90 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x170]
    1d08:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
    1d0f:	49 89 f9             	mov    r9,rdi
    1d12:	41 89 c8             	mov    r8d,ecx
    1d15:	b9 03 00 00 00       	mov    ecx,0x3
    1d1a:	48 89 c7             	mov    rdi,rax
    1d1d:	e8 2e f3 ff ff       	call   1050 <mmap@plt>
    1d22:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
    1d26:	75 0a                	jne    1d32 <load_elfso+0x54c>
                return -1;   //加载失败
    1d28:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1d2d:	e9 61 07 00 00       	jmp    2493 <load_elfso+0xcad>
        }
        ph++;
    1d32:	48 83 45 f8 38       	add    QWORD PTR [rbp-0x8],0x38
    for (int i = 0; i < entn; i++) {
    1d37:	83 45 ac 01          	add    DWORD PTR [rbp-0x54],0x1
    1d3b:	0f b7 85 fe fe ff ff 	movzx  eax,WORD PTR [rbp-0x102]
    1d42:	39 45 ac             	cmp    DWORD PTR [rbp-0x54],eax
    1d45:	0f 8c de fe ff ff    	jl     1c29 <load_elfso+0x443>
    }
    if (dynamic) {
    1d4b:	48 83 7d c8 00       	cmp    QWORD PTR [rbp-0x38],0x0
    1d50:	0f 84 36 07 00 00    	je     248c <load_elfso+0xca6>
        void*      needed_nameoff[32];
        int        t_needed = 0;
    1d56:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
        char*      dynstr   = 0;
    1d5d:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    1d64:	00 
        Elf64_Dyn* dyn      = dynamic->sh_addr + offset;
    1d65:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    1d69:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    1d6d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1d71:	48 01 d0             	add    rax,rdx
    1d74:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
        size_t     relsz = 0, relentsz = 0;
    1d7b:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
    1d82:	00 
    1d83:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
    1d8a:	00 
        size_t     relasz = 0, relaentsz = 0;
    1d8b:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
    1d92:	00 
    1d93:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
    1d9a:	00 00 00 00 
        size_t     jmprelsz = 0, jmprelaentsz = 0;
    1d9e:	48 c7 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],0x0
    1da5:	00 00 00 00 
    1da9:	48 c7 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],0x0
    1db0:	00 00 00 00 
        off_t      relptr = 0, relaptr = 0, jmprelptr = 0;
    1db4:	48 c7 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],0x0
    1dbb:	00 00 00 00 
    1dbf:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
    1dc6:	00 00 00 00 
    1dca:	48 c7 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],0x0
    1dd1:	00 00 00 00 
        int        pltrel = 0, bind_now = 0;
    1dd5:	c7 85 4c ff ff ff 00 	mov    DWORD PTR [rbp-0xb4],0x0
    1ddc:	00 00 00 
    1ddf:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x0
    1de6:	00 00 00 
        int (*init)()     = 0;
    1de9:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x0
    1df0:	00 00 00 00 
        size_t init_arrsz = 0;
    1df4:	48 c7 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],0x0
    1dfb:	00 00 00 00 
        mod->p_dynamic    = dynamic;
    1dff:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    1e03:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1e0a:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
        //这里一堆获取函数之后实现细节
        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    1e0e:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
    1e15:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
    1e1c:	eb 3f                	jmp    1e5d <load_elfso+0x677>
            if (p->d_tag == DT_STRTAB) {
    1e1e:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1e25:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1e28:	48 83 f8 05          	cmp    rax,0x5
    1e2c:	75 27                	jne    1e55 <load_elfso+0x66f>
                dynstr        = p->d_un.d_ptr + offset;
    1e2e:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1e35:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1e39:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1e3d:	48 01 d0             	add    rax,rdx
    1e40:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
                mod->p_strtab = dynstr;
    1e44:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
    1e48:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1e4f:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
                break;
    1e53:	eb 17                	jmp    1e6c <load_elfso+0x686>
        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    1e55:	48 83 85 30 ff ff ff 	add    QWORD PTR [rbp-0xd0],0x10
    1e5c:	10 
    1e5d:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1e64:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1e67:	48 85 c0             	test   rax,rax
    1e6a:	75 b2                	jne    1e1e <load_elfso+0x638>
            }
        }
        if (!dynstr) {
    1e6c:	48 83 7d 98 00       	cmp    QWORD PTR [rbp-0x68],0x0
    1e71:	75 0a                	jne    1e7d <load_elfso+0x697>
            return -1;
    1e73:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1e78:	e9 16 06 00 00       	jmp    2493 <load_elfso+0xcad>
        }

        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    1e7d:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
    1e84:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
    1e8b:	e9 17 03 00 00       	jmp    21a7 <load_elfso+0x9c1>
            switch (p->d_tag) {
    1e90:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    1e97:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1e9a:	48 83 f8 1b          	cmp    rax,0x1b
    1e9e:	0f 87 fa 02 00 00    	ja     219e <load_elfso+0x9b8>
    1ea4:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    1eab:	00 
    1eac:	48 8d 05 bd 21 00 00 	lea    rax,[rip+0x21bd]        # 4070 <chkmmap+0x300>
    1eb3:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    1eb6:	48 98                	cdqe   
    1eb8:	48 8d 15 b1 21 00 00 	lea    rdx,[rip+0x21b1]        # 4070 <chkmmap+0x300>
    1ebf:	48 01 d0             	add    rax,rdx
    1ec2:	3e ff e0             	notrack jmp rax
            case DT_NEEDED:
                //不查错了
                needed_nameoff[t_needed++] = p->d_un.d_val + dynstr;
    1ec5:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    1ecc:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
    1ed0:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
    1ed3:	8d 50 01             	lea    edx,[rax+0x1]
    1ed6:	89 55 a4             	mov    DWORD PTR [rbp-0x5c],edx
    1ed9:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
    1edd:	48 01 ca             	add    rdx,rcx
    1ee0:	48 98                	cdqe   
    1ee2:	48 89 94 c5 80 fd ff 	mov    QWORD PTR [rbp+rax*8-0x280],rdx
    1ee9:	ff 
                break;
    1eea:	e9 b0 02 00 00       	jmp    219f <load_elfso+0x9b9>
            case DT_PLTGOT:
                got = p->d_un.d_ptr + offset;
    1eef:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    1ef6:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1efa:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1efe:	48 01 d0             	add    rax,rdx
    1f01:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax

                //赋值为dl的运行时重定位函数
                got[2] = dl_runtime_resolve;
    1f08:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    1f0f:	48 83 c0 10          	add    rax,0x10
    1f13:	48 8d 15 01 09 00 00 	lea    rdx,[rip+0x901]        # 281b <dl_runtime_resolve>
    1f1a:	48 89 10             	mov    QWORD PTR [rax],rdx
                //填入模块id
                got[1] = mod - modules;
    1f1d:	48 8b 05 b4 40 00 00 	mov    rax,QWORD PTR [rip+0x40b4]        # 5fd8 <modules-0x1c8>
    1f24:	48 89 c2             	mov    rdx,rax
    1f27:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1f2e:	48 29 d0             	sub    rax,rdx
    1f31:	48 c1 f8 05          	sar    rax,0x5
    1f35:	48 89 c2             	mov    rdx,rax
    1f38:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
    1f3f:	aa aa aa 
    1f42:	48 0f af c2          	imul   rax,rdx
    1f46:	48 89 c2             	mov    rdx,rax
    1f49:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    1f50:	48 83 c0 08          	add    rax,0x8
    1f54:	48 89 10             	mov    QWORD PTR [rax],rdx
                got[0] += offset;   // 0th项存着.dynamic的地址
    1f57:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    1f5e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    1f61:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1f65:	48 01 c2             	add    rdx,rax
    1f68:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    1f6f:	48 89 10             	mov    QWORD PTR [rax],rdx
                mod->p_got = got;
    1f72:	48 8b 95 c8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x138]
    1f79:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1f80:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
                //这里需要把got表里面的地址先偏移offset，因为plt里面jmp到plt0要用到
                for (int i = 0; i < ehdr.e_shnum; i++) {
    1f84:	c7 85 24 ff ff ff 00 	mov    DWORD PTR [rbp-0xdc],0x0
    1f8b:	00 00 00 
    1f8e:	eb 57                	jmp    1fe7 <load_elfso+0x801>
                    if (sh[i].sh_addr == p->d_un.d_ptr) {
    1f90:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
    1f96:	48 98                	cdqe   
    1f98:	48 c1 e0 06          	shl    rax,0x6
    1f9c:	48 89 c2             	mov    rdx,rax
    1f9f:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1fa6:	48 01 d0             	add    rax,rdx
    1fa9:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    1fad:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    1fb4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1fb8:	48 39 c2             	cmp    rdx,rax
    1fbb:	75 23                	jne    1fe0 <load_elfso+0x7fa>
                        //.got.plt表
                        got_size = sh[i].sh_size;
    1fbd:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
    1fc3:	48 98                	cdqe   
    1fc5:	48 c1 e0 06          	shl    rax,0x6
    1fc9:	48 89 c2             	mov    rdx,rax
    1fcc:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1fd3:	48 01 d0             	add    rax,rdx
    1fd6:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    1fda:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
                        break;
    1fde:	eb 1d                	jmp    1ffd <load_elfso+0x817>
                for (int i = 0; i < ehdr.e_shnum; i++) {
    1fe0:	83 85 24 ff ff ff 01 	add    DWORD PTR [rbp-0xdc],0x1
    1fe7:	48 8b 05 02 40 00 00 	mov    rax,QWORD PTR [rip+0x4002]        # 5ff0 <ehdr-0x31d0>
    1fee:	0f b7 40 3c          	movzx  eax,WORD PTR [rax+0x3c]
    1ff2:	0f b7 c0             	movzx  eax,ax
    1ff5:	39 85 24 ff ff ff    	cmp    DWORD PTR [rbp-0xdc],eax
    1ffb:	7c 93                	jl     1f90 <load_elfso+0x7aa>
                    }
                }
                size_t nr_gotent = got_size / sizeof(off_t);
    1ffd:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    2001:	48 c1 e8 03          	shr    rax,0x3
    2005:	48 89 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],rax
                for (int i = 3; i < nr_gotent; i++) {
    200c:	c7 85 20 ff ff ff 03 	mov    DWORD PTR [rbp-0xe0],0x3
    2013:	00 00 00 
    2016:	eb 48                	jmp    2060 <load_elfso+0x87a>
                    got[i] += offset;
    2018:	8b 85 20 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe0]
    201e:	48 98                	cdqe   
    2020:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
    2027:	00 
    2028:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    202f:	48 01 d0             	add    rax,rdx
    2032:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    2035:	8b 85 20 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe0]
    203b:	48 98                	cdqe   
    203d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
    2044:	00 
    2045:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    204c:	48 01 d0             	add    rax,rdx
    204f:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    2053:	48 01 ca             	add    rdx,rcx
    2056:	48 89 10             	mov    QWORD PTR [rax],rdx
                for (int i = 3; i < nr_gotent; i++) {
    2059:	83 85 20 ff ff ff 01 	add    DWORD PTR [rbp-0xe0],0x1
    2060:	8b 85 20 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe0]
    2066:	48 98                	cdqe   
    2068:	48 39 85 a8 fe ff ff 	cmp    QWORD PTR [rbp-0x158],rax
    206f:	77 a7                	ja     2018 <load_elfso+0x832>
                }
                break;
    2071:	e9 29 01 00 00       	jmp    219f <load_elfso+0x9b9>
            case DT_SYMTAB: mod->p_symbol = p->d_un.d_ptr + offset; break;
    2076:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    207d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    2081:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2085:	48 01 c2             	add    rdx,rax
    2088:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    208f:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    2093:	e9 07 01 00 00       	jmp    219f <load_elfso+0x9b9>
            case DT_PLTRELSZ: jmprelsz = p->d_un.d_val; break;
    2098:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    209f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    20a3:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    20aa:	e9 f0 00 00 00       	jmp    219f <load_elfso+0x9b9>
            case DT_RELSZ: relsz = p->d_un.d_val; break;
    20af:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    20b6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    20ba:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    20be:	e9 dc 00 00 00       	jmp    219f <load_elfso+0x9b9>
            case DT_RELASZ: relasz = p->d_un.d_val; break;
    20c3:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    20ca:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    20ce:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    20d2:	e9 c8 00 00 00       	jmp    219f <load_elfso+0x9b9>
            case DT_PLTREL: pltrel = p->d_un.d_val; break;
    20d7:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    20de:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    20e2:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
    20e8:	e9 b2 00 00 00       	jmp    219f <load_elfso+0x9b9>
            case DT_JMPREL:
                jmprelptr    = p->d_un.d_val;
    20ed:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    20f4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    20f8:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
                mod->p_reloc = jmprelptr + offset;
    20ff:	48 8b 95 50 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb0]
    2106:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    210a:	48 01 c2             	add    rdx,rax
    210d:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    2114:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
                break;
    2118:	e9 82 00 00 00       	jmp    219f <load_elfso+0x9b9>
            case DT_REL: relptr = p->d_un.d_ptr; break;
    211d:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    2124:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2128:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    212f:	eb 6e                	jmp    219f <load_elfso+0x9b9>
            case DT_RELA: relaptr = p->d_un.d_ptr; break;
    2131:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    2138:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    213c:	48 89 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rax
    2143:	eb 5a                	jmp    219f <load_elfso+0x9b9>
            case DT_RELENT: relentsz = p->d_un.d_val; break;
    2145:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    214c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2150:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
    2154:	eb 49                	jmp    219f <load_elfso+0x9b9>
            case DT_RELAENT: relaentsz = p->d_un.d_val; break;
    2156:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    215d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2161:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    2168:	eb 35                	jmp    219f <load_elfso+0x9b9>
            case DT_INIT_ARRAY: init = p->d_un.d_ptr; break;
    216a:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    2171:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2175:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    217c:	eb 21                	jmp    219f <load_elfso+0x9b9>
            case DT_INIT_ARRAYSZ: init_arrsz = p->d_un.d_val; break;
    217e:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    2185:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2189:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
    2190:	eb 0d                	jmp    219f <load_elfso+0x9b9>
            case DT_BIND_NOW: bind_now = 1; break;
    2192:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
    2199:	00 00 00 
    219c:	eb 01                	jmp    219f <load_elfso+0x9b9>
            default: break;
    219e:	90                   	nop
        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    219f:	48 83 85 28 ff ff ff 	add    QWORD PTR [rbp-0xd8],0x10
    21a6:	10 
    21a7:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    21ae:	48 8b 00             	mov    rax,QWORD PTR [rax]
    21b1:	48 85 c0             	test   rax,rax
    21b4:	0f 85 d6 fc ff ff    	jne    1e90 <load_elfso+0x6aa>
            }
        }
        for (int i = 0; i < t_needed; i++) {
    21ba:	c7 85 1c ff ff ff 00 	mov    DWORD PTR [rbp-0xe4],0x0
    21c1:	00 00 00 
    21c4:	eb 5a                	jmp    2220 <load_elfso+0xa3a>
            char* pathname = 0;
    21c6:	48 c7 85 b8 fe ff ff 	mov    QWORD PTR [rbp-0x148],0x0
    21cd:	00 00 00 00 
            int   so_fno   = 0;
    21d1:	c7 85 b4 fe ff ff 00 	mov    DWORD PTR [rbp-0x14c],0x0
    21d8:	00 00 00 
            pathname       = needed_nameoff[i];
    21db:	8b 85 1c ff ff ff    	mov    eax,DWORD PTR [rbp-0xe4]
    21e1:	48 98                	cdqe   
    21e3:	48 8b 84 c5 80 fd ff 	mov    rax,QWORD PTR [rbp+rax*8-0x280]
    21ea:	ff 
    21eb:	48 89 85 b8 fe ff ff 	mov    QWORD PTR [rbp-0x148],rax
            so_fno         = open(pathname, O_EXEC);
    21f2:	48 8b 85 b8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x148]
    21f9:	be 00 10 00 00       	mov    esi,0x1000
    21fe:	48 89 c7             	mov    rdi,rax
    2201:	e8 ba ee ff ff       	call   10c0 <open@plt>
    2206:	89 85 b4 fe ff ff    	mov    DWORD PTR [rbp-0x14c],eax
            load_elfso(so_fno);
    220c:	8b 85 b4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x14c]
    2212:	89 c7                	mov    edi,eax
    2214:	e8 cd f5 ff ff       	call   17e6 <load_elfso>
        for (int i = 0; i < t_needed; i++) {
    2219:	83 85 1c ff ff ff 01 	add    DWORD PTR [rbp-0xe4],0x1
    2220:	8b 85 1c ff ff ff    	mov    eax,DWORD PTR [rbp-0xe4]
    2226:	3b 45 a4             	cmp    eax,DWORD PTR [rbp-0x5c]
    2229:	7c 9b                	jl     21c6 <load_elfso+0x9e0>
        }
        if (relptr && relentsz && relsz)   // REL
    222b:	48 83 bd 60 ff ff ff 	cmp    QWORD PTR [rbp-0xa0],0x0
    2232:	00 
    2233:	74 7d                	je     22b2 <load_elfso+0xacc>
    2235:	48 83 7d 88 00       	cmp    QWORD PTR [rbp-0x78],0x0
    223a:	74 76                	je     22b2 <load_elfso+0xacc>
    223c:	48 83 7d 90 00       	cmp    QWORD PTR [rbp-0x70],0x0
    2241:	74 6f                	je     22b2 <load_elfso+0xacc>
            for (int j = 0; j < relsz / relentsz; j++)
    2243:	c7 85 18 ff ff ff 00 	mov    DWORD PTR [rbp-0xe8],0x0
    224a:	00 00 00 
    224d:	eb 48                	jmp    2297 <load_elfso+0xab1>
                fill_reloc(relptr + offset + j * relentsz, elfid, mod->p_symbol, 0);
    224f:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    2256:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    225a:	48 89 c2             	mov    rdx,rax
    225d:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
    2264:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2268:	48 01 c1             	add    rcx,rax
    226b:	8b 85 18 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe8]
    2271:	48 98                	cdqe   
    2273:	48 0f af 45 88       	imul   rax,QWORD PTR [rbp-0x78]
    2278:	48 01 c8             	add    rax,rcx
    227b:	48 89 c7             	mov    rdi,rax
    227e:	8b 85 d4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x12c]
    2284:	b9 00 00 00 00       	mov    ecx,0x0
    2289:	89 c6                	mov    esi,eax
    228b:	e8 b0 ed ff ff       	call   1040 <fill_reloc@plt>
            for (int j = 0; j < relsz / relentsz; j++)
    2290:	83 85 18 ff ff ff 01 	add    DWORD PTR [rbp-0xe8],0x1
    2297:	8b 85 18 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe8]
    229d:	48 63 c8             	movsxd rcx,eax
    22a0:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    22a4:	ba 00 00 00 00       	mov    edx,0x0
    22a9:	48 f7 75 88          	div    QWORD PTR [rbp-0x78]
    22ad:	48 39 c1             	cmp    rcx,rax
    22b0:	72 9d                	jb     224f <load_elfso+0xa69>
        if (relaptr && relaentsz && relasz)   // RELA
    22b2:	48 83 bd 58 ff ff ff 	cmp    QWORD PTR [rbp-0xa8],0x0
    22b9:	00 
    22ba:	0f 84 86 00 00 00    	je     2346 <load_elfso+0xb60>
    22c0:	48 83 bd 78 ff ff ff 	cmp    QWORD PTR [rbp-0x88],0x0
    22c7:	00 
    22c8:	74 7c                	je     2346 <load_elfso+0xb60>
    22ca:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
    22cf:	74 75                	je     2346 <load_elfso+0xb60>
            for (int j = 0; j < relasz / relaentsz; j++)
    22d1:	c7 85 14 ff ff ff 00 	mov    DWORD PTR [rbp-0xec],0x0
    22d8:	00 00 00 
    22db:	eb 4b                	jmp    2328 <load_elfso+0xb42>
                fill_reloc(relaptr + offset + j * relaentsz, elfid, mod->p_symbol, 1);
    22dd:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    22e4:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    22e8:	48 89 c2             	mov    rdx,rax
    22eb:	48 8b 8d 58 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa8]
    22f2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    22f6:	48 01 c1             	add    rcx,rax
    22f9:	8b 85 14 ff ff ff    	mov    eax,DWORD PTR [rbp-0xec]
    22ff:	48 98                	cdqe   
    2301:	48 0f af 85 78 ff ff 	imul   rax,QWORD PTR [rbp-0x88]
    2308:	ff 
    2309:	48 01 c8             	add    rax,rcx
    230c:	48 89 c7             	mov    rdi,rax
    230f:	8b 85 d4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x12c]
    2315:	b9 01 00 00 00       	mov    ecx,0x1
    231a:	89 c6                	mov    esi,eax
    231c:	e8 1f ed ff ff       	call   1040 <fill_reloc@plt>
            for (int j = 0; j < relasz / relaentsz; j++)
    2321:	83 85 14 ff ff ff 01 	add    DWORD PTR [rbp-0xec],0x1
    2328:	8b 85 14 ff ff ff    	mov    eax,DWORD PTR [rbp-0xec]
    232e:	48 63 c8             	movsxd rcx,eax
    2331:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
    2335:	ba 00 00 00 00       	mov    edx,0x0
    233a:	48 f7 b5 78 ff ff ff 	div    QWORD PTR [rbp-0x88]
    2341:	48 39 c1             	cmp    rcx,rax
    2344:	72 97                	jb     22dd <load_elfso+0xaf7>
        if (pltrel == DT_REL)
    2346:	83 bd 4c ff ff ff 11 	cmp    DWORD PTR [rbp-0xb4],0x11
    234d:	75 17                	jne    2366 <load_elfso+0xb80>
            jmprelaentsz = relentsz, pltrel = 0;
    234f:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
    2353:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    235a:	c7 85 4c ff ff ff 00 	mov    DWORD PTR [rbp-0xb4],0x0
    2361:	00 00 00 
    2364:	eb 18                	jmp    237e <load_elfso+0xb98>
        else
            jmprelaentsz = relaentsz, pltrel = 1;
    2366:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
    236d:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    2374:	c7 85 4c ff ff ff 01 	mov    DWORD PTR [rbp-0xb4],0x1
    237b:	00 00 00 
        if (bind_now && jmprelptr && jmprelaentsz && jmprelsz)   // PLTREL
    237e:	83 bd 48 ff ff ff 00 	cmp    DWORD PTR [rbp-0xb8],0x0
    2385:	0f 84 a4 00 00 00    	je     242f <load_elfso+0xc49>
    238b:	48 83 bd 50 ff ff ff 	cmp    QWORD PTR [rbp-0xb0],0x0
    2392:	00 
    2393:	0f 84 96 00 00 00    	je     242f <load_elfso+0xc49>
    2399:	48 83 bd 68 ff ff ff 	cmp    QWORD PTR [rbp-0x98],0x0
    23a0:	00 
    23a1:	0f 84 88 00 00 00    	je     242f <load_elfso+0xc49>
    23a7:	48 83 bd 70 ff ff ff 	cmp    QWORD PTR [rbp-0x90],0x0
    23ae:	00 
    23af:	74 7e                	je     242f <load_elfso+0xc49>
            for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    23b1:	c7 85 10 ff ff ff 00 	mov    DWORD PTR [rbp-0xf0],0x0
    23b8:	00 00 00 
    23bb:	eb 51                	jmp    240e <load_elfso+0xc28>
                fill_reloc(jmprelptr + offset + j * jmprelaentsz, elfid, mod->p_symbol, pltrel);
    23bd:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    23c4:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    23c8:	48 89 c6             	mov    rsi,rax
    23cb:	48 8b 95 50 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb0]
    23d2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    23d6:	48 01 c2             	add    rdx,rax
    23d9:	8b 85 10 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf0]
    23df:	48 98                	cdqe   
    23e1:	48 0f af 85 68 ff ff 	imul   rax,QWORD PTR [rbp-0x98]
    23e8:	ff 
    23e9:	48 01 d0             	add    rax,rdx
    23ec:	48 89 c7             	mov    rdi,rax
    23ef:	8b 95 4c ff ff ff    	mov    edx,DWORD PTR [rbp-0xb4]
    23f5:	8b 85 d4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x12c]
    23fb:	89 d1                	mov    ecx,edx
    23fd:	48 89 f2             	mov    rdx,rsi
    2400:	89 c6                	mov    esi,eax
    2402:	e8 39 ec ff ff       	call   1040 <fill_reloc@plt>
            for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    2407:	83 85 10 ff ff ff 01 	add    DWORD PTR [rbp-0xf0],0x1
    240e:	8b 85 10 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf0]
    2414:	48 63 c8             	movsxd rcx,eax
    2417:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
    241e:	ba 00 00 00 00       	mov    edx,0x0
    2423:	48 f7 b5 68 ff ff ff 	div    QWORD PTR [rbp-0x98]
    242a:	48 39 c1             	cmp    rcx,rax
    242d:	72 8e                	jb     23bd <load_elfso+0xbd7>
        mod->s_relentsz = jmprelaentsz;
    242f:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    2436:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
    243d:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
        if (init) {
    2441:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
    2448:	00 
    2449:	74 41                	je     248c <load_elfso+0xca6>
            //调用模块入口函数
            for (int i = 0; i < init_arrsz; i++) {
    244b:	c7 85 0c ff ff ff 00 	mov    DWORD PTR [rbp-0xf4],0x0
    2452:	00 00 00 
    2455:	eb 24                	jmp    247b <load_elfso+0xc95>
                (init + i * 8)();
    2457:	8b 85 0c ff ff ff    	mov    eax,DWORD PTR [rbp-0xf4]
    245d:	c1 e0 03             	shl    eax,0x3
    2460:	48 63 d0             	movsxd rdx,eax
    2463:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
    246a:	48 01 c2             	add    rdx,rax
    246d:	b8 00 00 00 00       	mov    eax,0x0
    2472:	ff d2                	call   rdx
            for (int i = 0; i < init_arrsz; i++) {
    2474:	83 85 0c ff ff ff 01 	add    DWORD PTR [rbp-0xf4],0x1
    247b:	8b 85 0c ff ff ff    	mov    eax,DWORD PTR [rbp-0xf4]
    2481:	48 98                	cdqe   
    2483:	48 39 85 38 ff ff ff 	cmp    QWORD PTR [rbp-0xc8],rax
    248a:	77 cb                	ja     2457 <load_elfso+0xc71>
            }
        }
    }

    return entry;
    248c:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
}
    2493:	c9                   	leave  
    2494:	c3                   	ret    

0000000000002495 <get_sym_addr>:
//返回指定模块中指定索引的符号地址，已经计算了加载偏移。
static off_t get_sym_addr(unsigned long modid, unsigned long symi)
{
    2495:	f3 0f 1e fa          	endbr64 
    2499:	55                   	push   rbp
    249a:	48 89 e5             	mov    rbp,rsp
    249d:	48 83 ec 40          	sub    rsp,0x40
    24a1:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
    24a5:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
    struct Elf64_Sym* sym = modules[modid].p_symbol;
    24a9:	48 8b 0d 28 3b 00 00 	mov    rcx,QWORD PTR [rip+0x3b28]        # 5fd8 <modules-0x1c8>
    24b0:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    24b4:	48 89 d0             	mov    rax,rdx
    24b7:	48 01 c0             	add    rax,rax
    24ba:	48 01 d0             	add    rax,rdx
    24bd:	48 c1 e0 05          	shl    rax,0x5
    24c1:	48 01 c8             	add    rax,rcx
    24c4:	48 83 c0 28          	add    rax,0x28
    24c8:	48 8b 00             	mov    rax,QWORD PTR [rax]
    24cb:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    sym += symi;
    24cf:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
    24d3:	48 89 d0             	mov    rax,rdx
    24d6:	48 01 c0             	add    rax,rax
    24d9:	48 01 d0             	add    rax,rdx
    24dc:	48 c1 e0 03          	shl    rax,0x3
    24e0:	48 01 45 e8          	add    QWORD PTR [rbp-0x18],rax
    if (sym->st_shndx == SHN_COMMON) {
        //还没分配空间的符号，需要分配空间，st_value表示地址对齐约束
    }
    off_t symaddr = 0;
    24e4:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    24eb:	00 
    if (sym->st_shndx != SHN_UNDEF && sym->st_value)
    24ec:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    24f0:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
    24f4:	66 85 c0             	test   ax,ax
    24f7:	74 43                	je     253c <get_sym_addr+0xa7>
    24f9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    24fd:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2501:	48 85 c0             	test   rax,rax
    2504:	74 36                	je     253c <get_sym_addr+0xa7>
        symaddr = sym->st_value + modules[modid].load_offset;
    2506:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    250a:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
    250e:	48 8b 35 c3 3a 00 00 	mov    rsi,QWORD PTR [rip+0x3ac3]        # 5fd8 <modules-0x1c8>
    2515:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    2519:	48 89 d0             	mov    rax,rdx
    251c:	48 01 c0             	add    rax,rax
    251f:	48 01 d0             	add    rax,rdx
    2522:	48 c1 e0 05          	shl    rax,0x5
    2526:	48 01 f0             	add    rax,rsi
    2529:	48 83 c0 08          	add    rax,0x8
    252d:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2530:	48 01 c8             	add    rax,rcx
    2533:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    2537:	e9 12 02 00 00       	jmp    274e <get_sym_addr+0x2b9>
    else {
        //不在本模块，需要在别的模块符号表中寻找
        char* target_name = modules[modid].p_strtab + sym->st_name;
    253c:	48 8b 0d 95 3a 00 00 	mov    rcx,QWORD PTR [rip+0x3a95]        # 5fd8 <modules-0x1c8>
    2543:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    2547:	48 89 d0             	mov    rax,rdx
    254a:	48 01 c0             	add    rax,rax
    254d:	48 01 d0             	add    rax,rdx
    2550:	48 c1 e0 05          	shl    rax,0x5
    2554:	48 01 c8             	add    rax,rcx
    2557:	48 83 c0 40          	add    rax,0x40
    255b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    255e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2562:	8b 00                	mov    eax,DWORD PTR [rax]
    2564:	89 c0                	mov    eax,eax
    2566:	48 01 d0             	add    rax,rdx
    2569:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for (int i = 0; i < MAX_MODULES; i++) {
    256d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    2574:	e9 cb 01 00 00       	jmp    2744 <get_sym_addr+0x2af>
            if (modules[i].type == ET_NONE || i == modid)
    2579:	48 8b 0d 58 3a 00 00 	mov    rcx,QWORD PTR [rip+0x3a58]        # 5fd8 <modules-0x1c8>
    2580:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    2583:	48 63 d0             	movsxd rdx,eax
    2586:	48 89 d0             	mov    rax,rdx
    2589:	48 01 c0             	add    rax,rax
    258c:	48 01 d0             	add    rax,rdx
    258f:	48 c1 e0 05          	shl    rax,0x5
    2593:	48 01 c8             	add    rax,rcx
    2596:	48 83 c0 18          	add    rax,0x18
    259a:	48 8b 00             	mov    rax,QWORD PTR [rax]
    259d:	48 85 c0             	test   rax,rax
    25a0:	0f 84 96 01 00 00    	je     273c <get_sym_addr+0x2a7>
    25a6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    25a9:	48 98                	cdqe   
    25ab:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
    25af:	0f 84 87 01 00 00    	je     273c <get_sym_addr+0x2a7>
                continue;
            sym = modules[i].p_symbol;
    25b5:	48 8b 0d 1c 3a 00 00 	mov    rcx,QWORD PTR [rip+0x3a1c]        # 5fd8 <modules-0x1c8>
    25bc:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    25bf:	48 63 d0             	movsxd rdx,eax
    25c2:	48 89 d0             	mov    rax,rdx
    25c5:	48 01 c0             	add    rax,rax
    25c8:	48 01 d0             	add    rax,rdx
    25cb:	48 c1 e0 05          	shl    rax,0x5
    25cf:	48 01 c8             	add    rax,rcx
    25d2:	48 83 c0 28          	add    rax,0x28
    25d6:	48 8b 00             	mov    rax,QWORD PTR [rax]
    25d9:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            if (!sym)
    25dd:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
    25e2:	0f 84 57 01 00 00    	je     273f <get_sym_addr+0x2aa>
                continue;
            for (int j = 0; j < modules[i].s_symtabsz / sizeof(struct Elf64_Sym); j++) {
    25e8:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
    25ef:	e9 ff 00 00 00       	jmp    26f3 <get_sym_addr+0x25e>
                //获取符号名称
                if (!sym[j].st_name)
    25f4:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    25f7:	48 63 d0             	movsxd rdx,eax
    25fa:	48 89 d0             	mov    rax,rdx
    25fd:	48 01 c0             	add    rax,rax
    2600:	48 01 d0             	add    rax,rdx
    2603:	48 c1 e0 03          	shl    rax,0x3
    2607:	48 89 c2             	mov    rdx,rax
    260a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    260e:	48 01 d0             	add    rax,rdx
    2611:	8b 00                	mov    eax,DWORD PTR [rax]
    2613:	85 c0                	test   eax,eax
    2615:	0f 84 d3 00 00 00    	je     26ee <get_sym_addr+0x259>
                    continue;
                char* symname = modules[i].p_strtab + sym[j].st_name;
    261b:	48 8b 0d b6 39 00 00 	mov    rcx,QWORD PTR [rip+0x39b6]        # 5fd8 <modules-0x1c8>
    2622:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    2625:	48 63 d0             	movsxd rdx,eax
    2628:	48 89 d0             	mov    rax,rdx
    262b:	48 01 c0             	add    rax,rax
    262e:	48 01 d0             	add    rax,rdx
    2631:	48 c1 e0 05          	shl    rax,0x5
    2635:	48 01 c8             	add    rax,rcx
    2638:	48 83 c0 40          	add    rax,0x40
    263c:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    263f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    2642:	48 63 d0             	movsxd rdx,eax
    2645:	48 89 d0             	mov    rax,rdx
    2648:	48 01 c0             	add    rax,rax
    264b:	48 01 d0             	add    rax,rdx
    264e:	48 c1 e0 03          	shl    rax,0x3
    2652:	48 89 c2             	mov    rdx,rax
    2655:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2659:	48 01 d0             	add    rax,rdx
    265c:	8b 00                	mov    eax,DWORD PTR [rax]
    265e:	89 c0                	mov    eax,eax
    2660:	48 01 c8             	add    rax,rcx
    2663:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
                if (sym[j].st_value && dlstrcmp(target_name, symname) == 0) {
    2667:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    266a:	48 63 d0             	movsxd rdx,eax
    266d:	48 89 d0             	mov    rax,rdx
    2670:	48 01 c0             	add    rax,rax
    2673:	48 01 d0             	add    rax,rdx
    2676:	48 c1 e0 03          	shl    rax,0x3
    267a:	48 89 c2             	mov    rdx,rax
    267d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2681:	48 01 d0             	add    rax,rdx
    2684:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2688:	48 85 c0             	test   rax,rax
    268b:	74 62                	je     26ef <get_sym_addr+0x25a>
    268d:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
    2691:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2695:	48 89 d6             	mov    rsi,rdx
    2698:	48 89 c7             	mov    rdi,rax
    269b:	e8 e0 e9 ff ff       	call   1080 <dlstrcmp@plt>
    26a0:	85 c0                	test   eax,eax
    26a2:	75 4b                	jne    26ef <get_sym_addr+0x25a>
                    return modules[i].load_offset + sym[j].st_value;
    26a4:	48 8b 0d 2d 39 00 00 	mov    rcx,QWORD PTR [rip+0x392d]        # 5fd8 <modules-0x1c8>
    26ab:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    26ae:	48 63 d0             	movsxd rdx,eax
    26b1:	48 89 d0             	mov    rax,rdx
    26b4:	48 01 c0             	add    rax,rax
    26b7:	48 01 d0             	add    rax,rdx
    26ba:	48 c1 e0 05          	shl    rax,0x5
    26be:	48 01 c8             	add    rax,rcx
    26c1:	48 83 c0 08          	add    rax,0x8
    26c5:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    26c8:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    26cb:	48 63 d0             	movsxd rdx,eax
    26ce:	48 89 d0             	mov    rax,rdx
    26d1:	48 01 c0             	add    rax,rax
    26d4:	48 01 d0             	add    rax,rdx
    26d7:	48 c1 e0 03          	shl    rax,0x3
    26db:	48 89 c2             	mov    rdx,rax
    26de:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    26e2:	48 01 d0             	add    rax,rdx
    26e5:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    26e9:	48 01 c8             	add    rax,rcx
    26ec:	eb 64                	jmp    2752 <get_sym_addr+0x2bd>
                    continue;
    26ee:	90                   	nop
            for (int j = 0; j < modules[i].s_symtabsz / sizeof(struct Elf64_Sym); j++) {
    26ef:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
    26f3:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    26f6:	48 63 c8             	movsxd rcx,eax
    26f9:	48 8b 35 d8 38 00 00 	mov    rsi,QWORD PTR [rip+0x38d8]        # 5fd8 <modules-0x1c8>
    2700:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    2703:	48 63 d0             	movsxd rdx,eax
    2706:	48 89 d0             	mov    rax,rdx
    2709:	48 01 c0             	add    rax,rax
    270c:	48 01 d0             	add    rax,rdx
    270f:	48 c1 e0 05          	shl    rax,0x5
    2713:	48 01 f0             	add    rax,rsi
    2716:	48 83 c0 48          	add    rax,0x48
    271a:	48 8b 00             	mov    rax,QWORD PTR [rax]
    271d:	48 ba ab aa aa aa aa 	movabs rdx,0xaaaaaaaaaaaaaaab
    2724:	aa aa aa 
    2727:	48 f7 e2             	mul    rdx
    272a:	48 89 d0             	mov    rax,rdx
    272d:	48 c1 e8 04          	shr    rax,0x4
    2731:	48 39 c1             	cmp    rcx,rax
    2734:	0f 82 ba fe ff ff    	jb     25f4 <get_sym_addr+0x15f>
    273a:	eb 04                	jmp    2740 <get_sym_addr+0x2ab>
                continue;
    273c:	90                   	nop
    273d:	eb 01                	jmp    2740 <get_sym_addr+0x2ab>
                continue;
    273f:	90                   	nop
        for (int i = 0; i < MAX_MODULES; i++) {
    2740:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
    2744:	83 7d f4 7f          	cmp    DWORD PTR [rbp-0xc],0x7f
    2748:	0f 8e 2b fe ff ff    	jle    2579 <get_sym_addr+0xe4>
                }
            }
        }
    }
    return symaddr;
    274e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
    2752:	c9                   	leave  
    2753:	c3                   	ret    

0000000000002754 <dlstrcmp>:
int dlstrcmp(char* src, char* dst)
{
    2754:	f3 0f 1e fa          	endbr64 
    2758:	55                   	push   rbp
    2759:	48 89 e5             	mov    rbp,rsp
    275c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    2760:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while (*src++ && *dst++) {
    2764:	eb 2c                	jmp    2792 <dlstrcmp+0x3e>
        if (*src != *dst) {
    2766:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    276a:	0f b6 10             	movzx  edx,BYTE PTR [rax]
    276d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2771:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    2774:	38 c2                	cmp    dl,al
    2776:	74 1a                	je     2792 <dlstrcmp+0x3e>
            return *src - *dst;
    2778:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    277c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    277f:	0f be d0             	movsx  edx,al
    2782:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2786:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    2789:	0f be c8             	movsx  ecx,al
    278c:	89 d0                	mov    eax,edx
    278e:	29 c8                	sub    eax,ecx
    2790:	eb 2b                	jmp    27bd <dlstrcmp+0x69>
    while (*src++ && *dst++) {
    2792:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2796:	48 8d 50 01          	lea    rdx,[rax+0x1]
    279a:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
    279e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    27a1:	84 c0                	test   al,al
    27a3:	74 13                	je     27b8 <dlstrcmp+0x64>
    27a5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    27a9:	48 8d 50 01          	lea    rdx,[rax+0x1]
    27ad:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    27b1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    27b4:	84 c0                	test   al,al
    27b6:	75 ae                	jne    2766 <dlstrcmp+0x12>
        }
    }
    return 0;
    27b8:	b8 00 00 00 00       	mov    eax,0x0
}
    27bd:	5d                   	pop    rbp
    27be:	c3                   	ret    

00000000000027bf <get_load_base>:
static off_t get_load_base(unsigned long modid)
{
    27bf:	f3 0f 1e fa          	endbr64 
    27c3:	55                   	push   rbp
    27c4:	48 89 e5             	mov    rbp,rsp
    27c7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return modules[modid].base;
    27cb:	48 8b 0d 06 38 00 00 	mov    rcx,QWORD PTR [rip+0x3806]        # 5fd8 <modules-0x1c8>
    27d2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    27d6:	48 89 d0             	mov    rax,rdx
    27d9:	48 01 c0             	add    rax,rax
    27dc:	48 01 d0             	add    rax,rdx
    27df:	48 c1 e0 05          	shl    rax,0x5
    27e3:	48 01 c8             	add    rax,rcx
    27e6:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
    27e9:	5d                   	pop    rbp
    27ea:	c3                   	ret    

00000000000027eb <get_got>:
off_t get_got(unsigned long modid)
{
    27eb:	f3 0f 1e fa          	endbr64 
    27ef:	55                   	push   rbp
    27f0:	48 89 e5             	mov    rbp,rsp
    27f3:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return modules[modid].p_got;
    27f7:	48 8b 0d da 37 00 00 	mov    rcx,QWORD PTR [rip+0x37da]        # 5fd8 <modules-0x1c8>
    27fe:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2802:	48 89 d0             	mov    rax,rdx
    2805:	48 01 c0             	add    rax,rax
    2808:	48 01 d0             	add    rax,rdx
    280b:	48 c1 e0 05          	shl    rax,0x5
    280f:	48 01 c8             	add    rax,rcx
    2812:	48 83 c0 30          	add    rax,0x30
    2816:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
    2819:	5d                   	pop    rbp
    281a:	c3                   	ret    

000000000000281b <dl_runtime_resolve>:
static void dl_runtime_resolve()
{
    281b:	f3 0f 1e fa          	endbr64 
    281f:	55                   	push   rbp
    2820:	48 89 e5             	mov    rbp,rsp
    2823:	48 83 ec 40          	sub    rsp,0x40
    //需要先保存寄存器，里面可能保存了函数的参数
    __asm__ volatile("push %rdi\n push %rsi\n push %rcx\n push %rdx\n push %r8\n push %r9\n");
    2827:	57                   	push   rdi
    2828:	56                   	push   rsi
    2829:	51                   	push   rcx
    282a:	52                   	push   rdx
    282b:	41 50                	push   r8
    282d:	41 51                	push   r9
    //获取modid
    unsigned long long modid, rel_offset;
    __asm__ volatile("mov 8(%%rbp),%%rax\n mov %%rax,%0" : "=m"(modid));
    282f:	48 8b 45 08          	mov    rax,QWORD PTR [rbp+0x8]
    2833:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    __asm__ volatile("mov 16(%%rbp),%%rax\n mov %%rax,%0" : "=m"(rel_offset));
    2837:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
    283b:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

    //排除COPY项的影响，他们不算在索引内
    Elf64_Rel* rel_table = modules[modid].p_reloc;
    283f:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    2843:	48 8b 0d 8e 37 00 00 	mov    rcx,QWORD PTR [rip+0x378e]        # 5fd8 <modules-0x1c8>
    284a:	48 89 d0             	mov    rax,rdx
    284d:	48 01 c0             	add    rax,rax
    2850:	48 01 d0             	add    rax,rdx
    2853:	48 c1 e0 05          	shl    rax,0x5
    2857:	48 01 c8             	add    rax,rcx
    285a:	48 83 c0 50          	add    rax,0x50
    285e:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2861:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int        eff = 0, i = 0;
    2865:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    286c:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    for (; eff < rel_offset && i < 37268; i++) {
    2873:	eb 27                	jmp    289c <dl_runtime_resolve+0x81>
        if (ELF64_R_TYPE(rel_table[i].r_info) != R_X86_64_COPY)
    2875:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
    2878:	48 98                	cdqe   
    287a:	48 c1 e0 04          	shl    rax,0x4
    287e:	48 89 c2             	mov    rdx,rax
    2881:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2885:	48 01 d0             	add    rax,rdx
    2888:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    288c:	89 c0                	mov    eax,eax
    288e:	48 83 f8 05          	cmp    rax,0x5
    2892:	74 04                	je     2898 <dl_runtime_resolve+0x7d>
            eff++;
    2894:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for (; eff < rel_offset && i < 37268; i++) {
    2898:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
    289c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    289f:	48 63 d0             	movsxd rdx,eax
    28a2:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    28a6:	48 39 c2             	cmp    rdx,rax
    28a9:	73 09                	jae    28b4 <dl_runtime_resolve+0x99>
    28ab:	81 7d f8 93 91 00 00 	cmp    DWORD PTR [rbp-0x8],0x9193
    28b2:	7e c1                	jle    2875 <dl_runtime_resolve+0x5a>
    }

    Elf64_Rel* rel     = i * modules[modid].s_relentsz + modules[modid].p_reloc;
    28b4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
    28b7:	48 63 c8             	movsxd rcx,eax
    28ba:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    28be:	48 8b 35 13 37 00 00 	mov    rsi,QWORD PTR [rip+0x3713]        # 5fd8 <modules-0x1c8>
    28c5:	48 89 d0             	mov    rax,rdx
    28c8:	48 01 c0             	add    rax,rax
    28cb:	48 01 d0             	add    rax,rdx
    28ce:	48 c1 e0 05          	shl    rax,0x5
    28d2:	48 01 f0             	add    rax,rsi
    28d5:	48 83 c0 58          	add    rax,0x58
    28d9:	48 8b 00             	mov    rax,QWORD PTR [rax]
    28dc:	48 0f af c8          	imul   rcx,rax
    28e0:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    28e4:	48 8b 35 ed 36 00 00 	mov    rsi,QWORD PTR [rip+0x36ed]        # 5fd8 <modules-0x1c8>
    28eb:	48 89 d0             	mov    rax,rdx
    28ee:	48 01 c0             	add    rax,rax
    28f1:	48 01 d0             	add    rax,rdx
    28f4:	48 c1 e0 05          	shl    rax,0x5
    28f8:	48 01 f0             	add    rax,rsi
    28fb:	48 83 c0 50          	add    rax,0x50
    28ff:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2902:	48 01 c8             	add    rax,rcx
    2905:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int        symi    = ELF64_R_SYM(rel->r_info);
    2909:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    290d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2911:	48 c1 e8 20          	shr    rax,0x20
    2915:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    off_t      sym_off = get_sym_addr(modid, symi);
    2918:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
    291b:	48 63 d0             	movsxd rdx,eax
    291e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2922:	48 89 d6             	mov    rsi,rdx
    2925:	48 89 c7             	mov    rdi,rax
    2928:	e8 68 fb ff ff       	call   2495 <get_sym_addr>
    292d:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    //必然是R_X86_64_JUMP_SLOT
    off_t* v_rel = rel->r_offset + modules[modid].load_offset;
    2931:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2935:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    2938:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    293c:	48 8b 35 95 36 00 00 	mov    rsi,QWORD PTR [rip+0x3695]        # 5fd8 <modules-0x1c8>
    2943:	48 89 d0             	mov    rax,rdx
    2946:	48 01 c0             	add    rax,rax
    2949:	48 01 d0             	add    rax,rdx
    294c:	48 c1 e0 05          	shl    rax,0x5
    2950:	48 01 f0             	add    rax,rsi
    2953:	48 83 c0 08          	add    rax,0x8
    2957:	48 8b 00             	mov    rax,QWORD PTR [rax]
    295a:	48 01 c8             	add    rax,rcx
    295d:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    *v_rel       = sym_off;
    2961:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
    2965:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2969:	48 89 10             	mov    QWORD PTR [rax],rdx

    //恢复原函数调用参数
    __asm__ volatile("pop %r9\n pop %r8\n pop %rdx\n pop %rcx\n pop %rsi\n pop %rdi\n");
    296c:	41 59                	pop    r9
    296e:	41 58                	pop    r8
    2970:	5a                   	pop    rdx
    2971:	59                   	pop    rcx
    2972:	5e                   	pop    rsi
    2973:	5f                   	pop    rdi
    //重定位完毕，直接返回到目标地址
    __asm__ volatile("mov %0,%%rax\n leave\n add $16,%%rsp\n jmp *%%rax\n" ::"m"(sym_off));
    2974:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    2978:	c9                   	leave  
    2979:	48 83 c4 10          	add    rsp,0x10
    297d:	ff e0                	jmp    rax
}
    297f:	90                   	nop
    2980:	c9                   	leave  
    2981:	c3                   	ret    

0000000000002982 <fill_reloc>:

void fill_reloc(void* relp, int modid, void* shdrs, int rela)
{
    2982:	f3 0f 1e fa          	endbr64 
    2986:	55                   	push   rbp
    2987:	48 89 e5             	mov    rbp,rsp
    298a:	48 83 ec 50          	sub    rsp,0x50
    298e:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
    2992:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
    2995:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    2999:	89 4d c0             	mov    DWORD PTR [rbp-0x40],ecx
    Elf64_Rela* rel  = relp;
    299c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    29a0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int         symi = ELF64_R_SYM(rel->r_info), type = ELF64_R_TYPE(rel->r_info);
    29a4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    29a8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    29ac:	48 c1 e8 20          	shr    rax,0x20
    29b0:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    29b3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    29b7:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    29bb:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    off_t       sym_off   = get_sym_addr(modid, symi);
    29be:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    29c1:	48 63 d0             	movsxd rdx,eax
    29c4:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    29c7:	48 98                	cdqe   
    29c9:	48 89 d6             	mov    rsi,rdx
    29cc:	48 89 c7             	mov    rdi,rax
    29cf:	e8 c1 fa ff ff       	call   2495 <get_sym_addr>
    29d4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    off_t       load_base = get_load_base(modid);
    29d8:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    29db:	48 98                	cdqe   
    29dd:	48 89 c7             	mov    rdi,rax
    29e0:	e8 da fd ff ff       	call   27bf <get_load_base>
    29e5:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    off_t       got       = get_got(modid);
    29e9:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    29ec:	48 98                	cdqe   
    29ee:	48 89 c7             	mov    rdi,rax
    29f1:	e8 2a e6 ff ff       	call   1020 <get_got@plt>
    29f6:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    //这里假定获取符号的地址是正确的，可以不修改符号表，而是通过记录模块整体加载地址，
    //来加上偏移量获取正确的符号地址
    off_t* v_rel = rel->r_offset + load_base;
    29fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    29fe:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2a01:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2a05:	48 01 d0             	add    rax,rdx
    2a08:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    switch (type) {
    2a0c:	83 7d f0 0b          	cmp    DWORD PTR [rbp-0x10],0xb
    2a10:	0f 87 45 01 00 00    	ja     2b5b <fill_reloc+0x1d9>
    2a16:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    2a19:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    2a20:	00 
    2a21:	48 8d 05 b8 16 00 00 	lea    rax,[rip+0x16b8]        # 40e0 <chkmmap+0x370>
    2a28:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    2a2b:	48 98                	cdqe   
    2a2d:	48 8d 15 ac 16 00 00 	lea    rdx,[rip+0x16ac]        # 40e0 <chkmmap+0x370>
    2a34:	48 01 d0             	add    rax,rdx
    2a37:	3e ff e0             	notrack jmp rax
    case R_X86_64_GLOB_DAT:
    case R_X86_64_JUMP_SLOT: *v_rel = sym_off; break;
    2a3a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2a3e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    2a42:	48 89 10             	mov    QWORD PTR [rax],rdx
    2a45:	e9 12 01 00 00       	jmp    2b5c <fill_reloc+0x1da>
    case R_X86_64_RELATIVE:
        if (rela)
    2a4a:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    2a4e:	74 1e                	je     2a6e <fill_reloc+0xec>
            *v_rel = rel->r_addend + load_base;
    2a50:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2a54:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2a58:	48 89 c2             	mov    rdx,rax
    2a5b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2a5f:	48 01 c2             	add    rdx,rax
    2a62:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2a66:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += load_base;
        break;
    2a69:	e9 ee 00 00 00       	jmp    2b5c <fill_reloc+0x1da>
            *v_rel += load_base;
    2a6e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2a72:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2a75:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2a79:	48 01 c2             	add    rdx,rax
    2a7c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2a80:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2a83:	e9 d4 00 00 00       	jmp    2b5c <fill_reloc+0x1da>
    case R_X86_64_GOTPC:
        if (rela)
    2a88:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    2a8c:	74 28                	je     2ab6 <fill_reloc+0x134>
            *v_rel = got + rel->r_addend - rel->r_offset;
    2a8e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2a92:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2a96:	48 89 c2             	mov    rdx,rax
    2a99:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2a9d:	48 01 c2             	add    rdx,rax
    2aa0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2aa4:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2aa7:	48 29 c2             	sub    rdx,rax
    2aaa:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2aae:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += got - (unsigned long long)rel;
        break;
    2ab1:	e9 a6 00 00 00       	jmp    2b5c <fill_reloc+0x1da>
            *v_rel += got - (unsigned long long)rel;
    2ab6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2aba:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2abd:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
    2ac1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2ac5:	48 29 c8             	sub    rax,rcx
    2ac8:	48 01 c2             	add    rdx,rax
    2acb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2acf:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2ad2:	e9 85 00 00 00       	jmp    2b5c <fill_reloc+0x1da>
    case R_X86_64_32S:
    case R_X86_64_64:
        if (rela)
    2ad7:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    2adb:	74 17                	je     2af4 <fill_reloc+0x172>
            *v_rel += sym_off;
    2add:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2ae1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2ae4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2ae8:	48 01 c2             	add    rdx,rax
    2aeb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2aef:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off;
        break;
    2af2:	eb 68                	jmp    2b5c <fill_reloc+0x1da>
            *v_rel = rel->r_addend + sym_off;
    2af4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2af8:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2afc:	48 89 c2             	mov    rdx,rax
    2aff:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2b03:	48 01 c2             	add    rdx,rax
    2b06:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b0a:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2b0d:	eb 4d                	jmp    2b5c <fill_reloc+0x1da>
    case R_X86_64_PC32:
        if (rela)
    2b0f:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    2b13:	74 21                	je     2b36 <fill_reloc+0x1b4>
            *v_rel += sym_off - rel->r_offset;
    2b15:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b19:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2b1c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2b20:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    2b23:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2b27:	48 29 c8             	sub    rax,rcx
    2b2a:	48 01 c2             	add    rdx,rax
    2b2d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b31:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
        break;
    2b34:	eb 26                	jmp    2b5c <fill_reloc+0x1da>
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
    2b36:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2b3a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2b3e:	48 89 c2             	mov    rdx,rax
    2b41:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2b45:	48 01 c2             	add    rdx,rax
    2b48:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2b4c:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2b4f:	48 29 c2             	sub    rdx,rax
    2b52:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b56:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2b59:	eb 01                	jmp    2b5c <fill_reloc+0x1da>
    default: break;
    2b5b:	90                   	nop
    }
}
    2b5c:	90                   	nop
    2b5d:	c9                   	leave  
    2b5e:	c3                   	ret    

0000000000002b5f <set_symtab>:
void set_symtab(void* symtab, int modid)
{
    2b5f:	f3 0f 1e fa          	endbr64 
    2b63:	55                   	push   rbp
    2b64:	48 89 e5             	mov    rbp,rsp
    2b67:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    2b6b:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    if (modid >= MAX_SYMTABS)
    2b6e:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
    2b72:	7f 17                	jg     2b8b <set_symtab+0x2c>
        return;
    symtabs[modid] = symtab;
    2b74:	48 8b 05 7d 34 00 00 	mov    rax,QWORD PTR [rip+0x347d]        # 5ff8 <symtabs-0xa8>
    2b7b:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
    2b7e:	48 63 d2             	movsxd rdx,edx
    2b81:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
    2b85:	48 89 0c d0          	mov    QWORD PTR [rax+rdx*8],rcx
    2b89:	eb 01                	jmp    2b8c <set_symtab+0x2d>
        return;
    2b8b:	90                   	nop
}
    2b8c:	5d                   	pop    rbp
    2b8d:	c3                   	ret    

0000000000002b8e <reg_module>:

static int reg_module()
{
    2b8e:	f3 0f 1e fa          	endbr64 
    2b92:	55                   	push   rbp
    2b93:	48 89 e5             	mov    rbp,rsp
    int i = 0;
    2b96:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for (; i < MAX_MODULES; i++) {
    2b9d:	eb 32                	jmp    2bd1 <reg_module+0x43>
        if (modules[i].type == ET_NONE) {
    2b9f:	48 8b 0d 32 34 00 00 	mov    rcx,QWORD PTR [rip+0x3432]        # 5fd8 <modules-0x1c8>
    2ba6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    2ba9:	48 63 d0             	movsxd rdx,eax
    2bac:	48 89 d0             	mov    rax,rdx
    2baf:	48 01 c0             	add    rax,rax
    2bb2:	48 01 d0             	add    rax,rdx
    2bb5:	48 c1 e0 05          	shl    rax,0x5
    2bb9:	48 01 c8             	add    rax,rcx
    2bbc:	48 83 c0 18          	add    rax,0x18
    2bc0:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2bc3:	48 85 c0             	test   rax,rax
    2bc6:	75 05                	jne    2bcd <reg_module+0x3f>
            return i;
    2bc8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    2bcb:	eb 0f                	jmp    2bdc <reg_module+0x4e>
    for (; i < MAX_MODULES; i++) {
    2bcd:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    2bd1:	83 7d fc 7f          	cmp    DWORD PTR [rbp-0x4],0x7f
    2bd5:	7e c8                	jle    2b9f <reg_module+0x11>
        }
    }
    return -1;
    2bd7:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
    2bdc:	5d                   	pop    rbp
    2bdd:	c3                   	ret    

0000000000002bde <dl_init>:
static int dl_init(void* load_offset)
{
    2bde:	f3 0f 1e fa          	endbr64 
    2be2:	55                   	push   rbp
    2be3:	48 89 e5             	mov    rbp,rsp
    2be6:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
    2bed:	48 89 bd 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdi
    //自举，不能调用任何全局函数和使用任何全局变量，完成自身重定位
    Elf64_Ehdr*       ehdr = load_offset;
    2bf4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2bfb:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    Elf64_Phdr*       ph   = ehdr->e_phoff;
    2c02:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
    2c09:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    2c0d:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    Elf64_Dyn*        dyn  = &_DYNAMIC;
    2c14:	48 8b 05 b5 33 00 00 	mov    rax,QWORD PTR [rip+0x33b5]        # 5fd0 <_DYNAMIC+0x120>
    2c1b:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    struct Elf64_Sym* sym  = 0;
    2c22:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    2c29:	00 

    size_t              relsz = 0, relentsz = 0;
    2c2a:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
    2c31:	00 
    2c32:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
    2c39:	00 
    size_t              relasz = 0, relaentsz = 0;
    2c3a:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    2c41:	00 
    2c42:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
    2c49:	00 
    size_t              jmprelsz = 0, jmprelaentsz = 0;
    2c4a:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
    2c51:	00 
    2c52:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
    2c59:	00 
    unsigned long long  relptr = 0, relaptr = 0, jmprelptr = 0;
    2c5a:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
    2c61:	00 
    2c62:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
    2c69:	00 
    2c6a:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
    2c71:	00 
    int                 pltrel = 0;
    2c72:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
    unsigned long long* got    = 0;
    2c79:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    2c80:	00 

    int bind_now = 0;
    2c81:	c7 45 9c 00 00 00 00 	mov    DWORD PTR [rbp-0x64],0x0
    for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    2c88:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    2c8f:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    2c93:	e9 2a 01 00 00       	jmp    2dc2 <dl_init+0x1e4>
        char* pathname = 0;
    2c98:	48 c7 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],0x0
    2c9f:	00 00 00 00 
        int   so_fno   = 0;
    2ca3:	c7 85 5c ff ff ff 00 	mov    DWORD PTR [rbp-0xa4],0x0
    2caa:	00 00 00 
        switch (p->d_tag) {
    2cad:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2cb1:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2cb4:	48 83 f8 18          	cmp    rax,0x18
    2cb8:	0f 87 fe 00 00 00    	ja     2dbc <dl_init+0x1de>
    2cbe:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    2cc5:	00 
    2cc6:	48 8d 05 43 14 00 00 	lea    rax,[rip+0x1443]        # 4110 <chkmmap+0x3a0>
    2ccd:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    2cd0:	48 98                	cdqe   
    2cd2:	48 8d 15 37 14 00 00 	lea    rdx,[rip+0x1437]        # 4110 <chkmmap+0x3a0>
    2cd9:	48 01 d0             	add    rax,rdx
    2cdc:	3e ff e0             	notrack jmp rax
        case DT_PLTGOT:   //赋值为dl的运行时重定位函数
            got    = p->d_un.d_ptr + load_offset;
    2cdf:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2ce3:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    2ce7:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2cee:	48 01 d0             	add    rax,rdx
    2cf1:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
            got[2] = dl_runtime_resolve;
    2cf5:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    2cf9:	48 83 c0 10          	add    rax,0x10
    2cfd:	48 8d 15 17 fb ff ff 	lea    rdx,[rip+0xfffffffffffffb17]        # 281b <dl_runtime_resolve>
    2d04:	48 89 10             	mov    QWORD PTR [rax],rdx
            //填入模块id
            got[1] = 0;
    2d07:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    2d0b:	48 83 c0 08          	add    rax,0x8
    2d0f:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            break;
    2d16:	e9 a2 00 00 00       	jmp    2dbd <dl_init+0x1df>
        case DT_SYMTAB: sym = p->d_un.d_ptr + load_offset; break;
    2d1b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2d1f:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    2d23:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2d2a:	48 01 d0             	add    rax,rdx
    2d2d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    2d31:	e9 87 00 00 00       	jmp    2dbd <dl_init+0x1df>
        case DT_PLTRELSZ: jmprelsz = p->d_un.d_val; break;
    2d36:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2d3a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2d3e:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    2d42:	eb 79                	jmp    2dbd <dl_init+0x1df>
        case DT_RELSZ: relsz = p->d_un.d_val; break;
    2d44:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2d48:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2d4c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    2d50:	eb 6b                	jmp    2dbd <dl_init+0x1df>
        case DT_RELASZ: relasz = p->d_un.d_val; break;
    2d52:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2d56:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2d5a:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    2d5e:	eb 5d                	jmp    2dbd <dl_init+0x1df>
        case DT_PLTREL: pltrel = p->d_un.d_val; break;
    2d60:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2d64:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2d68:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    2d6b:	eb 50                	jmp    2dbd <dl_init+0x1df>
        case DT_JMPREL: jmprelptr = p->d_un.d_val; break;
    2d6d:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2d71:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2d75:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
    2d79:	eb 42                	jmp    2dbd <dl_init+0x1df>
        case DT_REL: relptr = p->d_un.d_ptr; break;
    2d7b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2d7f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2d83:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    2d87:	eb 34                	jmp    2dbd <dl_init+0x1df>
        case DT_RELA: relaptr = p->d_un.d_ptr; break;
    2d89:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2d8d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2d91:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    2d95:	eb 26                	jmp    2dbd <dl_init+0x1df>
        case DT_RELENT: relentsz = p->d_un.d_val; break;
    2d97:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2d9b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2d9f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    2da3:	eb 18                	jmp    2dbd <dl_init+0x1df>
        case DT_RELAENT: relaentsz = p->d_un.d_val; break;
    2da5:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2da9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2dad:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    2db1:	eb 0a                	jmp    2dbd <dl_init+0x1df>
        case DT_BIND_NOW: bind_now = 1; break;
    2db3:	c7 45 9c 01 00 00 00 	mov    DWORD PTR [rbp-0x64],0x1
    2dba:	eb 01                	jmp    2dbd <dl_init+0x1df>
        default: break;
    2dbc:	90                   	nop
    for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    2dbd:	48 83 45 90 10       	add    QWORD PTR [rbp-0x70],0x10
    2dc2:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2dc6:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2dc9:	48 85 c0             	test   rax,rax
    2dcc:	0f 85 c6 fe ff ff    	jne    2c98 <dl_init+0xba>
        }
    }
    if (relptr && relentsz && relsz)   // REL
    2dd2:	48 83 7d c0 00       	cmp    QWORD PTR [rbp-0x40],0x0
    2dd7:	74 72                	je     2e4b <dl_init+0x26d>
    2dd9:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
    2dde:	74 6b                	je     2e4b <dl_init+0x26d>
    2de0:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
    2de5:	74 64                	je     2e4b <dl_init+0x26d>
        for (int j = 0; j < relsz / relentsz; j++)
    2de7:	c7 45 8c 00 00 00 00 	mov    DWORD PTR [rbp-0x74],0x0
    2dee:	eb 43                	jmp    2e33 <dl_init+0x255>
            init_fill_reloc(relptr + load_offset + j * relentsz, load_offset, sym, 0, got);
    2df0:	48 8b 4d a0          	mov    rcx,QWORD PTR [rbp-0x60]
    2df4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2dfb:	8b 55 8c             	mov    edx,DWORD PTR [rbp-0x74]
    2dfe:	48 63 d2             	movsxd rdx,edx
    2e01:	48 89 d6             	mov    rsi,rdx
    2e04:	48 0f af 75 e8       	imul   rsi,QWORD PTR [rbp-0x18]
    2e09:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
    2e0d:	48 01 d6             	add    rsi,rdx
    2e10:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2e17:	48 8d 3c 16          	lea    rdi,[rsi+rdx*1]
    2e1b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2e1f:	49 89 c8             	mov    r8,rcx
    2e22:	b9 00 00 00 00       	mov    ecx,0x0
    2e27:	48 89 c6             	mov    rsi,rax
    2e2a:	e8 0c 02 00 00       	call   303b <init_fill_reloc>
        for (int j = 0; j < relsz / relentsz; j++)
    2e2f:	83 45 8c 01          	add    DWORD PTR [rbp-0x74],0x1
    2e33:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    2e36:	48 63 c8             	movsxd rcx,eax
    2e39:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2e3d:	ba 00 00 00 00       	mov    edx,0x0
    2e42:	48 f7 75 e8          	div    QWORD PTR [rbp-0x18]
    2e46:	48 39 c1             	cmp    rcx,rax
    2e49:	72 a5                	jb     2df0 <dl_init+0x212>
    if (relaptr && relaentsz && relasz)   // RELA
    2e4b:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
    2e50:	74 72                	je     2ec4 <dl_init+0x2e6>
    2e52:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
    2e57:	74 6b                	je     2ec4 <dl_init+0x2e6>
    2e59:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
    2e5e:	74 64                	je     2ec4 <dl_init+0x2e6>
        for (int j = 0; j < relasz / relaentsz; j++)
    2e60:	c7 45 88 00 00 00 00 	mov    DWORD PTR [rbp-0x78],0x0
    2e67:	eb 43                	jmp    2eac <dl_init+0x2ce>
            init_fill_reloc(relaptr + load_offset + j * relaentsz, load_offset, sym, 1, got);
    2e69:	48 8b 4d a0          	mov    rcx,QWORD PTR [rbp-0x60]
    2e6d:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2e74:	8b 55 88             	mov    edx,DWORD PTR [rbp-0x78]
    2e77:	48 63 d2             	movsxd rdx,edx
    2e7a:	48 89 d6             	mov    rsi,rdx
    2e7d:	48 0f af 75 d8       	imul   rsi,QWORD PTR [rbp-0x28]
    2e82:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
    2e86:	48 01 d6             	add    rsi,rdx
    2e89:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2e90:	48 8d 3c 16          	lea    rdi,[rsi+rdx*1]
    2e94:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2e98:	49 89 c8             	mov    r8,rcx
    2e9b:	b9 01 00 00 00       	mov    ecx,0x1
    2ea0:	48 89 c6             	mov    rsi,rax
    2ea3:	e8 93 01 00 00       	call   303b <init_fill_reloc>
        for (int j = 0; j < relasz / relaentsz; j++)
    2ea8:	83 45 88 01          	add    DWORD PTR [rbp-0x78],0x1
    2eac:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    2eaf:	48 63 c8             	movsxd rcx,eax
    2eb2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2eb6:	ba 00 00 00 00       	mov    edx,0x0
    2ebb:	48 f7 75 d8          	div    QWORD PTR [rbp-0x28]
    2ebf:	48 39 c1             	cmp    rcx,rax
    2ec2:	72 a5                	jb     2e69 <dl_init+0x28b>
    if (pltrel == DT_REL)
    2ec4:	83 7d ac 11          	cmp    DWORD PTR [rbp-0x54],0x11
    2ec8:	75 11                	jne    2edb <dl_init+0x2fd>
        jmprelaentsz = relentsz, pltrel = 0;
    2eca:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2ece:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    2ed2:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
    2ed9:	eb 0f                	jmp    2eea <dl_init+0x30c>
    else
        jmprelaentsz = relaentsz, pltrel = 1;
    2edb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2edf:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    2ee3:	c7 45 ac 01 00 00 00 	mov    DWORD PTR [rbp-0x54],0x1
    if (bind_now && jmprelptr && jmprelaentsz && jmprelsz)   // PLTREL
    2eea:	83 7d 9c 00          	cmp    DWORD PTR [rbp-0x64],0x0
    2eee:	74 77                	je     2f67 <dl_init+0x389>
    2ef0:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
    2ef5:	74 70                	je     2f67 <dl_init+0x389>
    2ef7:	48 83 7d c8 00       	cmp    QWORD PTR [rbp-0x38],0x0
    2efc:	74 69                	je     2f67 <dl_init+0x389>
    2efe:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
    2f03:	74 62                	je     2f67 <dl_init+0x389>
        for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    2f05:	c7 45 84 00 00 00 00 	mov    DWORD PTR [rbp-0x7c],0x0
    2f0c:	eb 41                	jmp    2f4f <dl_init+0x371>
            init_fill_reloc(
    2f0e:	48 8b 75 a0          	mov    rsi,QWORD PTR [rbp-0x60]
    2f12:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
                jmprelptr + load_offset + j * jmprelaentsz, load_offset, sym, pltrel, got);
    2f19:	8b 55 84             	mov    edx,DWORD PTR [rbp-0x7c]
    2f1c:	48 63 d2             	movsxd rdx,edx
    2f1f:	48 89 d1             	mov    rcx,rdx
    2f22:	48 0f af 4d c8       	imul   rcx,QWORD PTR [rbp-0x38]
    2f27:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
    2f2b:	48 01 d1             	add    rcx,rdx
            init_fill_reloc(
    2f2e:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2f35:	48 8d 3c 11          	lea    rdi,[rcx+rdx*1]
    2f39:	8b 4d ac             	mov    ecx,DWORD PTR [rbp-0x54]
    2f3c:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2f40:	49 89 f0             	mov    r8,rsi
    2f43:	48 89 c6             	mov    rsi,rax
    2f46:	e8 f0 00 00 00       	call   303b <init_fill_reloc>
        for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    2f4b:	83 45 84 01          	add    DWORD PTR [rbp-0x7c],0x1
    2f4f:	8b 45 84             	mov    eax,DWORD PTR [rbp-0x7c]
    2f52:	48 63 c8             	movsxd rcx,eax
    2f55:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2f59:	ba 00 00 00 00       	mov    edx,0x0
    2f5e:	48 f7 75 c8          	div    QWORD PTR [rbp-0x38]
    2f62:	48 39 c1             	cmp    rcx,rax
    2f65:	72 a7                	jb     2f0e <dl_init+0x330>
    //重定位完毕，可以使用全局变量和全局函数
    for (int i = 0; i < MAX_MODULES; i++) {
    2f67:	c7 45 80 00 00 00 00 	mov    DWORD PTR [rbp-0x80],0x0
    2f6e:	eb 2c                	jmp    2f9c <dl_init+0x3be>
        modules[i].type = ET_NONE;
    2f70:	48 8b 0d 61 30 00 00 	mov    rcx,QWORD PTR [rip+0x3061]        # 5fd8 <modules-0x1c8>
    2f77:	8b 45 80             	mov    eax,DWORD PTR [rbp-0x80]
    2f7a:	48 63 d0             	movsxd rdx,eax
    2f7d:	48 89 d0             	mov    rax,rdx
    2f80:	48 01 c0             	add    rax,rax
    2f83:	48 01 d0             	add    rax,rdx
    2f86:	48 c1 e0 05          	shl    rax,0x5
    2f8a:	48 01 c8             	add    rax,rcx
    2f8d:	48 83 c0 18          	add    rax,0x18
    2f91:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    for (int i = 0; i < MAX_MODULES; i++) {
    2f98:	83 45 80 01          	add    DWORD PTR [rbp-0x80],0x1
    2f9c:	83 7d 80 7f          	cmp    DWORD PTR [rbp-0x80],0x7f
    2fa0:	7e ce                	jle    2f70 <dl_init+0x392>
    }
    modules[0].p_symbol    = sym;
    2fa2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2fa6:	48 8b 05 2b 30 00 00 	mov    rax,QWORD PTR [rip+0x302b]        # 5fd8 <modules-0x1c8>
    2fad:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    modules[0].load_offset = load_offset;
    2fb1:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2fb8:	48 8b 05 19 30 00 00 	mov    rax,QWORD PTR [rip+0x3019]        # 5fd8 <modules-0x1c8>
    2fbf:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    modules[0].base        = load_offset;
    2fc3:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2fca:	48 8b 05 07 30 00 00 	mov    rax,QWORD PTR [rip+0x3007]        # 5fd8 <modules-0x1c8>
    2fd1:	48 89 10             	mov    QWORD PTR [rax],rdx
    modules[0].p_dynamic   = dyn;
    2fd4:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
    2fdb:	48 8b 05 f6 2f 00 00 	mov    rax,QWORD PTR [rip+0x2ff6]        # 5fd8 <modules-0x1c8>
    2fe2:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    modules[0].p_got       = got;
    2fe6:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
    2fea:	48 8b 05 e7 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fe7]        # 5fd8 <modules-0x1c8>
    2ff1:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    modules[0].type        = ET_DYN;
    2ff5:	48 8b 05 dc 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fdc]        # 5fd8 <modules-0x1c8>
    2ffc:	48 c7 40 18 03 00 00 	mov    QWORD PTR [rax+0x18],0x3
    3003:	00 
    modules[0].header      = load_offset;
    3004:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    300b:	48 8b 05 c6 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fc6]        # 5fd8 <modules-0x1c8>
    3012:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    modules[0].p_reloc     = jmprelptr;
    3016:	48 8b 05 bb 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fbb]        # 5fd8 <modules-0x1c8>
    301d:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
    3021:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    modules[0].s_relentsz  = jmprelaentsz;
    3025:	48 8b 05 ac 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fac]        # 5fd8 <modules-0x1c8>
    302c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    3030:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
    return 0;
    3034:	b8 00 00 00 00       	mov    eax,0x0
}
    3039:	c9                   	leave  
    303a:	c3                   	ret    

000000000000303b <init_fill_reloc>:
//自举用的小重定位函数
static void init_fill_reloc(void* relp, unsigned long long load_base, void* symtab, int rela,
                            off_t igot)
{
    303b:	f3 0f 1e fa          	endbr64 
    303f:	55                   	push   rbp
    3040:	48 89 e5             	mov    rbp,rsp
    3043:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
    3047:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
    304b:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    304f:	89 4d b4             	mov    DWORD PTR [rbp-0x4c],ecx
    3052:	4c 89 45 a8          	mov    QWORD PTR [rbp-0x58],r8
    unsigned long long got  = igot + load_base;
    3056:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
    305a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    305e:	48 01 d0             	add    rax,rdx
    3061:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    Elf64_Rela*        rel  = relp;
    3065:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    3069:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int                symi = ELF64_R_SYM(rel->r_info), type = ELF64_R_TYPE(rel->r_info);
    306d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    3071:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    3075:	48 c1 e8 20          	shr    rax,0x20
    3079:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    307c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    3080:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    3084:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    unsigned long long sym_off = (((struct Elf64_Sym*)symtab)[symi]).st_value;
    3087:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    308a:	48 63 d0             	movsxd rdx,eax
    308d:	48 89 d0             	mov    rax,rdx
    3090:	48 01 c0             	add    rax,rax
    3093:	48 01 d0             	add    rax,rdx
    3096:	48 c1 e0 03          	shl    rax,0x3
    309a:	48 89 c2             	mov    rdx,rax
    309d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    30a1:	48 01 d0             	add    rax,rdx
    30a4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    30a8:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if (!sym_off) {
    30ac:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
    30b1:	0f 84 5a 01 00 00    	je     3211 <init_fill_reloc+0x1d6>
        //外部符号
        return;
    }
    //这里假定获取符号的地址是正确的，可以不修改符号表，而是通过记录模块整体加载地址，
    //来加上偏移量获取正确的符号地址
    unsigned long long* v_rel = rel->r_offset;
    30b7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    30bb:	48 8b 00             	mov    rax,QWORD PTR [rax]
    30be:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (type) {
    30c2:	83 7d e8 0b          	cmp    DWORD PTR [rbp-0x18],0xb
    30c6:	0f 87 48 01 00 00    	ja     3214 <init_fill_reloc+0x1d9>
    30cc:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
    30cf:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    30d6:	00 
    30d7:	48 8d 05 96 10 00 00 	lea    rax,[rip+0x1096]        # 4174 <chkmmap+0x404>
    30de:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    30e1:	48 98                	cdqe   
    30e3:	48 8d 15 8a 10 00 00 	lea    rdx,[rip+0x108a]        # 4174 <chkmmap+0x404>
    30ea:	48 01 d0             	add    rax,rdx
    30ed:	3e ff e0             	notrack jmp rax
    case R_X86_64_GLOB_DAT:
    case R_X86_64_JUMP_SLOT: *v_rel = sym_off; break;
    30f0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    30f4:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    30f8:	48 89 10             	mov    QWORD PTR [rax],rdx
    30fb:	e9 15 01 00 00       	jmp    3215 <init_fill_reloc+0x1da>
    case R_X86_64_RELATIVE:
        if (rela)
    3100:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    3104:	74 1e                	je     3124 <init_fill_reloc+0xe9>
            *v_rel = rel->r_addend + load_base;
    3106:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    310a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    310e:	48 89 c2             	mov    rdx,rax
    3111:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    3115:	48 01 c2             	add    rdx,rax
    3118:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    311c:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += load_base;
        break;
    311f:	e9 f1 00 00 00       	jmp    3215 <init_fill_reloc+0x1da>
            *v_rel += load_base;
    3124:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3128:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    312b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    312f:	48 01 c2             	add    rdx,rax
    3132:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3136:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    3139:	e9 d7 00 00 00       	jmp    3215 <init_fill_reloc+0x1da>
    case R_X86_64_GOTPC:
        if (rela)
    313e:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    3142:	74 28                	je     316c <init_fill_reloc+0x131>
            *v_rel = got + rel->r_addend - rel->r_offset;
    3144:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    3148:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    314c:	48 89 c2             	mov    rdx,rax
    314f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    3153:	48 01 c2             	add    rdx,rax
    3156:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    315a:	48 8b 00             	mov    rax,QWORD PTR [rax]
    315d:	48 29 c2             	sub    rdx,rax
    3160:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3164:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += got - (unsigned long long)rel;
        break;
    3167:	e9 a9 00 00 00       	jmp    3215 <init_fill_reloc+0x1da>
            *v_rel += got - (unsigned long long)rel;
    316c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3170:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    3173:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
    3177:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    317b:	48 29 c8             	sub    rax,rcx
    317e:	48 01 c2             	add    rdx,rax
    3181:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3185:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    3188:	e9 88 00 00 00       	jmp    3215 <init_fill_reloc+0x1da>
    case R_X86_64_32S:
    case R_X86_64_64:
        if (rela)
    318d:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    3191:	74 17                	je     31aa <init_fill_reloc+0x16f>
            *v_rel += sym_off;
    3193:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3197:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    319a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    319e:	48 01 c2             	add    rdx,rax
    31a1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    31a5:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off;
        break;
    31a8:	eb 6b                	jmp    3215 <init_fill_reloc+0x1da>
            *v_rel = rel->r_addend + sym_off;
    31aa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    31ae:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    31b2:	48 89 c2             	mov    rdx,rax
    31b5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    31b9:	48 01 c2             	add    rdx,rax
    31bc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    31c0:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    31c3:	eb 50                	jmp    3215 <init_fill_reloc+0x1da>
    case R_X86_64_PC32:
        if (rela)
    31c5:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    31c9:	74 21                	je     31ec <init_fill_reloc+0x1b1>
            *v_rel += sym_off - rel->r_offset;
    31cb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    31cf:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    31d2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    31d6:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    31d9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    31dd:	48 29 c8             	sub    rax,rcx
    31e0:	48 01 c2             	add    rdx,rax
    31e3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    31e7:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
        break;
    31ea:	eb 29                	jmp    3215 <init_fill_reloc+0x1da>
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
    31ec:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    31f0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    31f4:	48 89 c2             	mov    rdx,rax
    31f7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    31fb:	48 01 c2             	add    rdx,rax
    31fe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    3202:	48 8b 00             	mov    rax,QWORD PTR [rax]
    3205:	48 29 c2             	sub    rdx,rax
    3208:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    320c:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    320f:	eb 04                	jmp    3215 <init_fill_reloc+0x1da>
        return;
    3211:	90                   	nop
    3212:	eb 01                	jmp    3215 <init_fill_reloc+0x1da>
    default: break;
    3214:	90                   	nop
    }
}
    3215:	5d                   	pop    rbp
    3216:	c3                   	ret    

0000000000003217 <lookup_strtab>:
/**
    @brief 查找字符串。
 */
static char* lookup_strtab(char* strtab, int index)
{
    3217:	f3 0f 1e fa          	endbr64 
    321b:	55                   	push   rbp
    321c:	48 89 e5             	mov    rbp,rsp
    321f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    3223:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    char* ptr = strtab;
    3226:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    322a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for (int i = 0; i < index; i++) {
    322e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    3235:	eb 18                	jmp    324f <lookup_strtab+0x38>
        while (*ptr++)
    3237:	90                   	nop
    3238:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    323c:	48 8d 50 01          	lea    rdx,[rax+0x1]
    3240:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
    3244:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    3247:	84 c0                	test   al,al
    3249:	75 ed                	jne    3238 <lookup_strtab+0x21>
    for (int i = 0; i < index; i++) {
    324b:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
    324f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    3252:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
    3255:	7c e0                	jl     3237 <lookup_strtab+0x20>
            ;
    }
    3257:	90                   	nop
    3258:	5d                   	pop    rbp
    3259:	c3                   	ret    
    325a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000003260 <max>:
	return a < b ? b : a;
    3260:	48 39 f7             	cmp    rdi,rsi
    3263:	48 89 f0             	mov    rax,rsi
    3266:	48 0f 43 c7          	cmovae rax,rdi
}
    326a:	c3                   	ret    
    326b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000003270 <align>:
	return (val + alignment - 1) & ~(alignment - 1);
    3270:	48 8d 44 3e ff       	lea    rax,[rsi+rdi*1-0x1]
    3275:	48 f7 de             	neg    rsi
    3278:	48 21 f0             	and    rax,rsi
}
    327b:	c3                   	ret    
    327c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000003280 <granules_to_chunk_kind>:
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
    3280:	31 c0                	xor    eax,eax
    3282:	83 ff 01             	cmp    edi,0x1
    3285:	76 4e                	jbe    32d5 <granules_to_chunk_kind+0x55>
    3287:	b8 01 00 00 00       	mov    eax,0x1
    328c:	83 ff 02             	cmp    edi,0x2
    328f:	74 44                	je     32d5 <granules_to_chunk_kind+0x55>
    3291:	83 ff 03             	cmp    edi,0x3
    3294:	74 5a                	je     32f0 <granules_to_chunk_kind+0x70>
    3296:	83 ff 04             	cmp    edi,0x4
    3299:	74 45                	je     32e0 <granules_to_chunk_kind+0x60>
    329b:	83 ff 05             	cmp    edi,0x5
    329e:	74 60                	je     3300 <granules_to_chunk_kind+0x80>
    32a0:	83 ff 06             	cmp    edi,0x6
    32a3:	74 2b                	je     32d0 <granules_to_chunk_kind+0x50>
    32a5:	b8 06 00 00 00       	mov    eax,0x6
    32aa:	83 ff 08             	cmp    edi,0x8
    32ad:	76 26                	jbe    32d5 <granules_to_chunk_kind+0x55>
    32af:	b8 07 00 00 00       	mov    eax,0x7
    32b4:	83 ff 0a             	cmp    edi,0xa
    32b7:	76 1c                	jbe    32d5 <granules_to_chunk_kind+0x55>
    32b9:	b8 08 00 00 00       	mov    eax,0x8
    32be:	83 ff 10             	cmp    edi,0x10
    32c1:	76 12                	jbe    32d5 <granules_to_chunk_kind+0x55>
    32c3:	83 ff 21             	cmp    edi,0x21
    32c6:	19 c0                	sbb    eax,eax
    32c8:	24 0a                	and    al,0xa
    32ca:	05 ff 00 00 00       	add    eax,0xff
    32cf:	c3                   	ret    
    32d0:	b8 05 00 00 00       	mov    eax,0x5
}
    32d5:	c3                   	ret    
    32d6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    32dd:	00 00 00 
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
    32e0:	b8 03 00 00 00       	mov    eax,0x3
    32e5:	c3                   	ret    
    32e6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    32ed:	00 00 00 
    32f0:	b8 02 00 00 00       	mov    eax,0x2
    32f5:	c3                   	ret    
    32f6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    32fd:	00 00 00 
    3300:	b8 04 00 00 00       	mov    eax,0x4
    3305:	c3                   	ret    
    3306:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    330d:	00 00 00 

0000000000003310 <chunk_kind_to_granules>:
{
    3310:	b8 ff ff ff ff       	mov    eax,0xffffffff
    3315:	83 ff 09             	cmp    edi,0x9
    3318:	77 0c                	ja     3326 <chunk_kind_to_granules+0x16>
    331a:	89 ff                	mov    edi,edi
    331c:	48 8d 05 9d 0e 00 00 	lea    rax,[rip+0xe9d]        # 41c0 <CSWTCH.34>
    3323:	8b 04 b8             	mov    eax,DWORD PTR [rax+rdi*4]
}
    3326:	c3                   	ret    
    3327:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    332e:	00 00 

0000000000003330 <get_page>:
	return (struct page*)(char*)(((uintptr_t)ptr) & ~PAGE_MASK);
    3330:	48 89 f8             	mov    rax,rdi
    3333:	66 31 c0             	xor    ax,ax
}
    3336:	c3                   	ret    
    3337:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    333e:	00 00 

0000000000003340 <get_chunk_index>:
	return (((uintptr_t)ptr) & PAGE_MASK) / CHUNK_SIZE;
    3340:	89 f8                	mov    eax,edi
    3342:	0f b6 c4             	movzx  eax,ah
}
    3345:	c3                   	ret    
    3346:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    334d:	00 00 00 

0000000000003350 <get_large_object_payload>:
	return ((char*)obj) + LARGE_OBJECT_HEADER_SIZE;
    3350:	48 8d 47 10          	lea    rax,[rdi+0x10]
}
    3354:	c3                   	ret    
    3355:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    335c:	00 00 00 
    335f:	90                   	nop

0000000000003360 <get_large_object>:
	return (struct large_object*)(((char*)ptr) - LARGE_OBJECT_HEADER_SIZE);
    3360:	48 8d 47 f0          	lea    rax,[rdi-0x10]
}
    3364:	c3                   	ret    
    3365:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    336c:	00 00 00 
    336f:	90                   	nop

0000000000003370 <allocate_chunk>:
	page->header.chunk_kinds[idx] = kind;
    3370:	89 f6                	mov    esi,esi
    3372:	88 14 37             	mov    BYTE PTR [rdi+rsi*1],dl
	return page->chunks[idx].data;
    3375:	48 c1 e6 08          	shl    rsi,0x8
    3379:	48 8d 04 37          	lea    rax,[rdi+rsi*1]
}
    337d:	c3                   	ret    
    337e:	66 90                	xchg   ax,ax

0000000000003380 <maybe_repurpose_single_chunk_large_objects_head>:
	if(large_objects->size < CHUNK_SIZE)
    3380:	48 8b 0d 89 5e 00 00 	mov    rcx,QWORD PTR [rip+0x5e89]        # 9210 <large_objects>
    3387:	48 81 79 08 ff 00 00 	cmp    QWORD PTR [rcx+0x8],0xff
    338e:	00 
    338f:	76 07                	jbe    3398 <maybe_repurpose_single_chunk_large_objects_head+0x18>
}
    3391:	c3                   	ret    
    3392:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		unsigned idx = get_chunk_index(large_objects);
    3398:	48 89 cf             	mov    rdi,rcx
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
    339b:	ba 09 00 00 00       	mov    edx,0x9
		unsigned idx = get_chunk_index(large_objects);
    33a0:	e8 9b ff ff ff       	call   3340 <get_chunk_index>
    33a5:	89 c6                	mov    esi,eax
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
    33a7:	e8 84 ff ff ff       	call   3330 <get_page>
    33ac:	48 89 c7             	mov    rdi,rax
    33af:	e8 bc ff ff ff       	call   3370 <allocate_chunk>
		large_objects = large_objects->next;
    33b4:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
    33b7:	48 89 15 52 5e 00 00 	mov    QWORD PTR [rip+0x5e52],rdx        # 9210 <large_objects>
		head->next = small_object_freelists[GRANULES_32];
    33be:	48 8b 15 a3 5e 00 00 	mov    rdx,QWORD PTR [rip+0x5ea3]        # 9268 <small_object_freelists+0x48>
    33c5:	48 89 10             	mov    QWORD PTR [rax],rdx
		small_object_freelists[GRANULES_32] = head;
    33c8:	48 89 05 99 5e 00 00 	mov    QWORD PTR [rip+0x5e99],rax        # 9268 <small_object_freelists+0x48>
}
    33cf:	c3                   	ret    

00000000000033d0 <size_to_granules>:
	return (size + GRANULE_SIZE - 1) >> GRANULE_SIZE_LOG_2;
    33d0:	48 8d 47 07          	lea    rax,[rdi+0x7]
    33d4:	48 c1 e8 03          	shr    rax,0x3
}
    33d8:	c3                   	ret    
    33d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000033e0 <maybe_merge_free_large_object>:
{
    33e0:	53                   	push   rbx
	struct large_object* obj = *prev;
    33e1:	4c 8b 1f             	mov    r11,QWORD PTR [rdi]
{
    33e4:	49 89 f9             	mov    r9,rdi
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
    33e7:	48 8d 1d 22 5e 00 00 	lea    rbx,[rip+0x5e22]        # 9210 <large_objects>
		char* end = get_large_object_payload(obj) + obj->size;
    33ee:	4c 89 df             	mov    rdi,r11
    33f1:	e8 5a ff ff ff       	call   3350 <get_large_object_payload>
    33f6:	4d 8b 43 08          	mov    r8,QWORD PTR [r11+0x8]
    33fa:	49 89 c2             	mov    r10,rax
    33fd:	0f 1f 00             	nop    DWORD PTR [rax]
    3400:	4b 8d 14 02          	lea    rdx,[r10+r8*1]
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
    3404:	be 00 01 00 00       	mov    esi,0x100
    3409:	48 89 d7             	mov    rdi,rdx
    340c:	e8 5f fe ff ff       	call   3270 <align>
    3411:	48 39 c2             	cmp    rdx,rax
    3414:	0f 85 d6 dc ff ff    	jne    10f0 <maybe_merge_free_large_object.cold>
		unsigned chunk = get_chunk_index(end);
    341a:	e8 21 ff ff ff       	call   3340 <get_chunk_index>
    341f:	89 c1                	mov    ecx,eax
		if(chunk < FIRST_ALLOCATABLE_CHUNK)
    3421:	85 c9                	test   ecx,ecx
    3423:	74 53                	je     3478 <maybe_merge_free_large_object+0x98>
		struct page* page = get_page(end);
    3425:	e8 06 ff ff ff       	call   3330 <get_page>
		if(page->header.chunk_kinds[chunk] != FREE_LARGE_OBJECT)
    342a:	80 3c 08 fe          	cmp    BYTE PTR [rax+rcx*1],0xfe
    342e:	75 48                	jne    3478 <maybe_merge_free_large_object+0x98>
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
    3430:	48 8b 05 d9 5d 00 00 	mov    rax,QWORD PTR [rip+0x5dd9]        # 9210 <large_objects>
			ASSERT(walk);
    3437:	48 85 c0             	test   rax,rax
    343a:	0f 84 b0 dc ff ff    	je     10f0 <maybe_merge_free_large_object.cold>
			if(walk == next)
    3440:	48 39 c2             	cmp    rdx,rax
    3443:	74 3b                	je     3480 <maybe_merge_free_large_object+0xa0>
    3445:	0f 1f 00             	nop    DWORD PTR [rax]
			walk = walk->next;
    3448:	48 89 c1             	mov    rcx,rax
    344b:	48 8b 00             	mov    rax,QWORD PTR [rax]
			ASSERT(walk);
    344e:	48 85 c0             	test   rax,rax
    3451:	74 32                	je     3485 <maybe_merge_free_large_object+0xa5>
			if(walk == next)
    3453:	48 39 c2             	cmp    rdx,rax
    3456:	75 f0                	jne    3448 <maybe_merge_free_large_object+0x68>
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
    3458:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
				if(prev == &walk->next)
    345c:	4c 39 c8             	cmp    rax,r9
    345f:	4c 0f 44 c9          	cmove  r9,rcx
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
    3463:	4d 8d 44 10 10       	lea    r8,[r8+rdx*1+0x10]
				*prev_prev = walk->next;
    3468:	48 8b 10             	mov    rdx,QWORD PTR [rax]
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
    346b:	4d 89 43 08          	mov    QWORD PTR [r11+0x8],r8
				*prev_prev = walk->next;
    346f:	48 89 11             	mov    QWORD PTR [rcx],rdx
				if(prev == &walk->next)
    3472:	eb 8c                	jmp    3400 <maybe_merge_free_large_object+0x20>
    3474:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
}
    3478:	4c 89 c8             	mov    rax,r9
    347b:	5b                   	pop    rbx
    347c:	c3                   	ret    
    347d:	0f 1f 00             	nop    DWORD PTR [rax]
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
    3480:	48 89 d9             	mov    rcx,rbx
    3483:	eb d3                	jmp    3458 <maybe_merge_free_large_object+0x78>
    3485:	e9 66 dc ff ff       	jmp    10f0 <maybe_merge_free_large_object.cold>
    348a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000003490 <maybe_compact_free_large_objects>:
	if(pending_large_object_compact)
    3490:	8b 05 6e 5d 00 00    	mov    eax,DWORD PTR [rip+0x5d6e]        # 9204 <pending_large_object_compact>
    3496:	85 c0                	test   eax,eax
    3498:	74 2c                	je     34c6 <maybe_compact_free_large_objects+0x36>
		while(*prev)
    349a:	48 83 3d 6e 5d 00 00 	cmp    QWORD PTR [rip+0x5d6e],0x0        # 9210 <large_objects>
    34a1:	00 
		pending_large_object_compact = 0;
    34a2:	c7 05 58 5d 00 00 00 	mov    DWORD PTR [rip+0x5d58],0x0        # 9204 <pending_large_object_compact>
    34a9:	00 00 00 
		while(*prev)
    34ac:	74 18                	je     34c6 <maybe_compact_free_large_objects+0x36>
		struct large_object** prev = &large_objects;
    34ae:	48 8d 3d 5b 5d 00 00 	lea    rdi,[rip+0x5d5b]        # 9210 <large_objects>
    34b5:	0f 1f 00             	nop    DWORD PTR [rax]
			prev = &(*maybe_merge_free_large_object(prev))->next;
    34b8:	e8 23 ff ff ff       	call   33e0 <maybe_merge_free_large_object>
    34bd:	48 8b 38             	mov    rdi,QWORD PTR [rax]
		while(*prev)
    34c0:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
    34c4:	75 f2                	jne    34b8 <maybe_compact_free_large_objects+0x28>
}
    34c6:	c3                   	ret    
    34c7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    34ce:	00 00 

00000000000034d0 <get_small_object_freelist>:
	ASSERT(kind < SMALL_OBJECT_CHUNK_KINDS);
    34d0:	83 ff 09             	cmp    edi,0x9
    34d3:	0f 87 19 dc ff ff    	ja     10f2 <get_small_object_freelist.cold>
	return &small_object_freelists[kind];
    34d9:	89 ff                	mov    edi,edi
    34db:	48 8d 05 3e 5d 00 00 	lea    rax,[rip+0x5d3e]        # 9220 <small_object_freelists>
    34e2:	48 8d 04 f8          	lea    rax,[rax+rdi*8]
}
    34e6:	c3                   	ret    
    34e7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    34ee:	00 00 

00000000000034f0 <free>:
	enum chunk_kind kind = granules_to_chunk_kind(granules);
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
}

void free(void* ptr)
{
    34f0:	f3 0f 1e fa          	endbr64 
    34f4:	49 89 f8             	mov    r8,rdi
	if(!ptr)
    34f7:	48 85 ff             	test   rdi,rdi
    34fa:	74 2a                	je     3526 <free+0x36>
		return;
	struct page* page = get_page(ptr);
    34fc:	e8 2f fe ff ff       	call   3330 <get_page>
    3501:	49 89 c1             	mov    r9,rax
	unsigned chunk = get_chunk_index(ptr);
    3504:	e8 37 fe ff ff       	call   3340 <get_chunk_index>
    3509:	89 c6                	mov    esi,eax
	uint8_t kind = page->header.chunk_kinds[chunk];
    350b:	89 c0                	mov    eax,eax
    350d:	41 0f b6 3c 01       	movzx  edi,BYTE PTR [r9+rax*1]
	if(kind == LARGE_OBJECT)
    3512:	40 80 ff ff          	cmp    dil,0xff
    3516:	74 18                	je     3530 <free+0x40>
		pending_large_object_compact = 1;
	}
	else
	{
		size_t granules = kind;
		struct freelist** loc = get_small_object_freelist(granules);
    3518:	e8 b3 ff ff ff       	call   34d0 <get_small_object_freelist>
		struct freelist* obj = ptr;
		obj->next = *loc;
    351d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    3520:	49 89 10             	mov    QWORD PTR [r8],rdx
		*loc = obj;
    3523:	4c 89 00             	mov    QWORD PTR [rax],r8
	}
}
    3526:	c3                   	ret    
    3527:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    352e:	00 00 
		struct large_object* obj = get_large_object(ptr);
    3530:	4c 89 c7             	mov    rdi,r8
    3533:	e8 28 fe ff ff       	call   3360 <get_large_object>
		obj->next = large_objects;
    3538:	48 8b 15 d1 5c 00 00 	mov    rdx,QWORD PTR [rip+0x5cd1]        # 9210 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
    353f:	4c 89 cf             	mov    rdi,r9
		obj->next = large_objects;
    3542:	48 89 10             	mov    QWORD PTR [rax],rdx
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
    3545:	ba fe 00 00 00       	mov    edx,0xfe
		large_objects = obj;
    354a:	48 89 05 bf 5c 00 00 	mov    QWORD PTR [rip+0x5cbf],rax        # 9210 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
    3551:	e8 1a fe ff ff       	call   3370 <allocate_chunk>
		pending_large_object_compact = 1;
    3556:	c7 05 a4 5c 00 00 01 	mov    DWORD PTR [rip+0x5ca4],0x1        # 9204 <pending_large_object_compact>
    355d:	00 00 00 
    3560:	c3                   	ret    
    3561:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    3568:	00 00 00 
    356b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000003570 <heap_size_in_pages>:
int heap_size_in_pages()
{
    3570:	f3 0f 1e fa          	endbr64 
    3574:	48 83 ec 08          	sub    rsp,0x8
	return (int)sbrk(0) - __heap_base;
    3578:	31 ff                	xor    edi,edi
    357a:	e8 f1 da ff ff       	call   1070 <sbrk@plt>
    357f:	48 8b 15 62 2a 00 00 	mov    rdx,QWORD PTR [rip+0x2a62]        # 5fe8 <__heap_base-0x3288>
    3586:	2b 02                	sub    eax,DWORD PTR [rdx]
    3588:	48 83 c4 08          	add    rsp,0x8
    358c:	c3                   	ret    
    358d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000003590 <allocate_pages.constprop.0>:
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
    3590:	41 55                	push   r13
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
    3592:	31 c0                	xor    eax,eax
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
    3594:	41 54                	push   r12
	size_t needed = payload_size + PAGE_HEADER_SIZE;
    3596:	4c 8d a7 00 01 00 00 	lea    r12,[rdi+0x100]
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
    359d:	55                   	push   rbp
    359e:	48 89 f5             	mov    rbp,rsi
    35a1:	53                   	push   rbx
    35a2:	48 83 ec 08          	sub    rsp,0x8
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
    35a6:	e8 65 da ff ff       	call   1010 <heap_size_in_pages@plt>
	if(!walloc_heap_size)
    35ab:	48 8b 3d 56 5c 00 00 	mov    rdi,QWORD PTR [rip+0x5c56]        # 9208 <walloc_heap_size>
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
    35b2:	c1 e0 10             	shl    eax,0x10
    35b5:	48 63 d8             	movsxd rbx,eax
	if(!walloc_heap_size)
    35b8:	48 85 ff             	test   rdi,rdi
    35bb:	75 63                	jne    3620 <allocate_pages.constprop.0+0x90>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
    35bd:	48 8b 3d 24 2a 00 00 	mov    rdi,QWORD PTR [rip+0x2a24]        # 5fe8 <__heap_base-0x3288>
    35c4:	be 00 00 01 00       	mov    esi,0x10000
    35c9:	e8 a2 fc ff ff       	call   3270 <align>
		walloc_heap_size = preallocated;
    35ce:	48 89 1d 33 5c 00 00 	mov    QWORD PTR [rip+0x5c33],rbx        # 9208 <walloc_heap_size>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
    35d5:	49 89 c0             	mov    r8,rax
	if(preallocated < needed)
    35d8:	49 39 dc             	cmp    r12,rbx
    35db:	0f 87 94 00 00 00    	ja     3675 <allocate_pages.constprop.0+0xe5>
	ASSERT(size);
    35e1:	48 85 db             	test   rbx,rbx
    35e4:	0f 84 0a db ff ff    	je     10f4 <allocate_pages.constprop.0.cold>
	ASSERT_ALIGNED(size, PAGE_SIZE);
    35ea:	be 00 00 01 00       	mov    esi,0x10000
    35ef:	48 89 df             	mov    rdi,rbx
    35f2:	e8 79 fc ff ff       	call   3270 <align>
    35f7:	48 39 c3             	cmp    rbx,rax
    35fa:	0f 85 f4 da ff ff    	jne    10f4 <allocate_pages.constprop.0.cold>
	*n_allocated = size / PAGE_SIZE;
    3600:	48 c1 eb 10          	shr    rbx,0x10
    3604:	48 89 5d 00          	mov    QWORD PTR [rbp+0x0],rbx
}
    3608:	48 83 c4 08          	add    rsp,0x8
    360c:	4c 89 c0             	mov    rax,r8
    360f:	5b                   	pop    rbx
    3610:	5d                   	pop    rbp
    3611:	41 5c                	pop    r12
    3613:	41 5d                	pop    r13
    3615:	c3                   	ret    
    3616:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    361d:	00 00 00 
	if(preallocated < needed)
    3620:	4d 85 e4             	test   r12,r12
    3623:	74 5e                	je     3683 <allocate_pages.constprop.0+0xf3>
	uintptr_t preallocated = 0, grow = 0;
    3625:	45 31 ed             	xor    r13d,r13d
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
    3628:	4c 89 e6             	mov    rsi,r12
    362b:	48 d1 ef             	shr    rdi,1
    362e:	e8 2d fc ff ff       	call   3260 <max>
    3633:	be 00 00 01 00       	mov    esi,0x10000
    3638:	48 89 c7             	mov    rdi,rax
    363b:	e8 30 fc ff ff       	call   3270 <align>
    3640:	49 89 c4             	mov    r12,rax
		ASSERT(grow);
    3643:	48 85 c0             	test   rax,rax
    3646:	0f 84 a8 da ff ff    	je     10f4 <allocate_pages.constprop.0.cold>
		if(sbrk(grow) == -1) // >> PAGE_SIZE_LOG_2
    364c:	48 89 c7             	mov    rdi,rax
    364f:	e8 1c da ff ff       	call   1070 <sbrk@plt>
    3654:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
    3658:	74 16                	je     3670 <allocate_pages.constprop.0+0xe0>
	size_t size = grow + preallocated;
    365a:	49 89 d8             	mov    r8,rbx
		walloc_heap_size += grow;
    365d:	4c 01 25 a4 5b 00 00 	add    QWORD PTR [rip+0x5ba4],r12        # 9208 <walloc_heap_size>
	size_t size = grow + preallocated;
    3664:	4b 8d 1c 2c          	lea    rbx,[r12+r13*1]
    3668:	e9 74 ff ff ff       	jmp    35e1 <allocate_pages.constprop.0+0x51>
    366d:	0f 1f 00             	nop    DWORD PTR [rax]
			return NULL;
    3670:	45 31 c0             	xor    r8d,r8d
    3673:	eb 93                	jmp    3608 <allocate_pages.constprop.0+0x78>
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
    3675:	49 29 dc             	sub    r12,rbx
    3678:	48 89 df             	mov    rdi,rbx
    367b:	49 89 dd             	mov    r13,rbx
		base = heap_base;
    367e:	48 89 c3             	mov    rbx,rax
    3681:	eb a5                	jmp    3628 <allocate_pages.constprop.0+0x98>
    3683:	e9 6c da ff ff       	jmp    10f4 <allocate_pages.constprop.0.cold>
    3688:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    368f:	00 

0000000000003690 <allocate_large_object>:
{
    3690:	41 54                	push   r12
    3692:	55                   	push   rbp
    3693:	53                   	push   rbx
    3694:	48 89 fb             	mov    rbx,rdi
    3697:	48 83 ec 10          	sub    rsp,0x10
	maybe_compact_free_large_objects();
    369b:	e8 f0 fd ff ff       	call   3490 <maybe_compact_free_large_objects>
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
    36a0:	48 8b 15 69 5b 00 00 	mov    rdx,QWORD PTR [rip+0x5b69]        # 9210 <large_objects>
    36a7:	48 85 d2             	test   rdx,rdx
    36aa:	0f 84 da 01 00 00    	je     388a <allocate_large_object+0x1fa>
    36b0:	4c 8d 0d 59 5b 00 00 	lea    r9,[rip+0x5b59]        # 9210 <large_objects>
	size_t best_size = -1;
    36b7:	49 c7 c0 ff ff ff ff 	mov    r8,0xffffffffffffffff
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
    36be:	48 8d 7b 10          	lea    rdi,[rbx+0x10]
	struct large_object *best = NULL, **best_prev = &large_objects;
    36c2:	45 31 d2             	xor    r10d,r10d
    36c5:	4c 89 cd             	mov    rbp,r9
    36c8:	eb 11                	jmp    36db <allocate_large_object+0x4b>
    36ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		prev = &walk->next, walk = walk->next)
    36d0:	49 89 d1             	mov    r9,rdx
    36d3:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
    36d6:	48 85 d2             	test   rdx,rdx
    36d9:	74 39                	je     3714 <allocate_large_object+0x84>
		if(walk->size >= size && walk->size < best_size)
    36db:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
    36df:	4c 39 c1             	cmp    rcx,r8
    36e2:	73 ec                	jae    36d0 <allocate_large_object+0x40>
    36e4:	48 39 d9             	cmp    rcx,rbx
    36e7:	72 e7                	jb     36d0 <allocate_large_object+0x40>
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
    36e9:	be 00 01 00 00       	mov    esi,0x100
    36ee:	e8 7d fb ff ff       	call   3270 <align>
			if(best_size + LARGE_OBJECT_HEADER_SIZE ==
    36f3:	48 8d 71 10          	lea    rsi,[rcx+0x10]
    36f7:	48 39 c6             	cmp    rsi,rax
    36fa:	0f 84 88 02 00 00    	je     3988 <allocate_large_object+0x2f8>
    3700:	4c 89 cd             	mov    rbp,r9
    3703:	49 89 d2             	mov    r10,rdx
		prev = &walk->next, walk = walk->next)
    3706:	49 89 d1             	mov    r9,rdx
    3709:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
    370c:	49 89 c8             	mov    r8,rcx
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
    370f:	48 85 d2             	test   rdx,rdx
    3712:	75 c7                	jne    36db <allocate_large_object+0x4b>
	if(!best)
    3714:	4d 85 d2             	test   r10,r10
    3717:	0f 84 7b 01 00 00    	je     3898 <allocate_large_object+0x208>
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
    371d:	4c 89 d7             	mov    rdi,r10
    3720:	ba ff 00 00 00       	mov    edx,0xff
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
    3725:	4c 89 c1             	mov    rcx,r8
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
    3728:	e8 13 fc ff ff       	call   3340 <get_chunk_index>
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
    372d:	48 29 d9             	sub    rcx,rbx
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
    3730:	89 c6                	mov    esi,eax
    3732:	e8 f9 fb ff ff       	call   3330 <get_page>
    3737:	48 89 c7             	mov    rdi,rax
    373a:	49 89 c1             	mov    r9,rax
    373d:	e8 2e fc ff ff       	call   3370 <allocate_chunk>
	struct large_object* next = best->next;
    3742:	49 8b 02             	mov    rax,QWORD PTR [r10]
	*best_prev = next;
    3745:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
	if(tail_size)
    3749:	48 81 e1 00 ff ff ff 	and    rcx,0xffffffffffffff00
    3750:	75 36                	jne    3788 <allocate_large_object+0xf8>
	ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(best) + best->size), CHUNK_SIZE);
    3752:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
    3756:	4c 89 d7             	mov    rdi,r10
    3759:	be 00 01 00 00       	mov    esi,0x100
    375e:	e8 ed fb ff ff       	call   3350 <get_large_object_payload>
    3763:	48 01 c2             	add    rdx,rax
    3766:	48 89 d7             	mov    rdi,rdx
    3769:	e8 02 fb ff ff       	call   3270 <align>
    376e:	48 39 c2             	cmp    rdx,rax
    3771:	0f 85 7f d9 ff ff    	jne    10f6 <allocate_large_object.cold>
}
    3777:	48 83 c4 10          	add    rsp,0x10
    377b:	4c 89 d0             	mov    rax,r10
    377e:	5b                   	pop    rbx
    377f:	5d                   	pop    rbp
    3780:	41 5c                	pop    r12
    3782:	c3                   	ret    
    3783:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		char* start = get_large_object_payload(best);
    3788:	4c 89 d7             	mov    rdi,r10
    378b:	e8 c0 fb ff ff       	call   3350 <get_large_object_payload>
		if(start_page == get_page(end - tail_size - 1))
    3790:	48 89 cf             	mov    rdi,rcx
		char* end = start + best_size;
    3793:	4e 8d 1c 00          	lea    r11,[rax+r8*1]
		if(start_page == get_page(end - tail_size - 1))
    3797:	48 f7 d7             	not    rdi
		char* start = get_large_object_payload(best);
    379a:	48 89 c5             	mov    rbp,rax
		if(start_page == get_page(end - tail_size - 1))
    379d:	4c 01 df             	add    rdi,r11
    37a0:	e8 8b fb ff ff       	call   3330 <get_page>
    37a5:	49 39 c1             	cmp    r9,rax
    37a8:	0f 84 e8 01 00 00    	je     3996 <allocate_large_object+0x306>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
    37ae:	be 00 00 01 00       	mov    esi,0x10000
    37b3:	4c 89 df             	mov    rdi,r11
    37b6:	e8 b5 fa ff ff       	call   3270 <align>
		else if(size < PAGE_SIZE - LARGE_OBJECT_HEADER_SIZE - CHUNK_SIZE)
    37bb:	48 81 fb ef fe 00 00 	cmp    rbx,0xfeef
    37c2:	0f 86 38 01 00 00    	jbe    3900 <allocate_large_object+0x270>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
    37c8:	4c 39 d8             	cmp    rax,r11
    37cb:	0f 85 25 d9 ff ff    	jne    10f6 <allocate_large_object.cold>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
    37d1:	0f b7 ed             	movzx  ebp,bp
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
    37d4:	be 00 00 01 00       	mov    esi,0x10000
    37d9:	48 8d bc 1d 00 00 ff 	lea    rdi,[rbp+rbx*1-0x10000]
    37e0:	ff 
			tail_size = best_size - size;
    37e1:	4a 8d 8c 05 00 00 ff 	lea    rcx,[rbp+r8*1-0x10000]
    37e8:	ff 
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
    37e9:	e8 82 fa ff ff       	call   3270 <align>
		best->size -= tail_size;
    37ee:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
			tail_size = best_size - size;
    37f2:	48 29 c1             	sub    rcx,rax
		best->size -= tail_size;
    37f5:	48 29 ca             	sub    rdx,rcx
		unsigned tail_idx = get_chunk_index(end - tail_size);
    37f8:	4c 89 df             	mov    rdi,r11
		best->size -= tail_size;
    37fb:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
    37ff:	48 29 cf             	sub    rdi,rcx
    3802:	e8 39 fb ff ff       	call   3340 <get_chunk_index>
    3807:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
    3809:	48 85 c9             	test   rcx,rcx
    380c:	0f 84 44 ff ff ff    	je     3756 <allocate_large_object+0xc6>
    3812:	85 c0                	test   eax,eax
    3814:	75 0c                	jne    3822 <allocate_large_object+0x192>
			tail_size -= CHUNK_SIZE;
    3816:	48 81 e9 00 01 00 00 	sub    rcx,0x100
			tail_idx++;
    381d:	be 01 00 00 00       	mov    esi,0x1
		if(tail_size)
    3822:	48 85 c9             	test   rcx,rcx
    3825:	0f 84 2b ff ff ff    	je     3756 <allocate_large_object+0xc6>
			struct page* page = get_page(end - tail_size);
    382b:	4c 89 df             	mov    rdi,r11
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
    382e:	ba fe 00 00 00       	mov    edx,0xfe
			struct page* page = get_page(end - tail_size);
    3833:	48 29 cf             	sub    rdi,rcx
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
    3836:	48 83 e9 10          	sub    rcx,0x10
			struct page* page = get_page(end - tail_size);
    383a:	e8 f1 fa ff ff       	call   3330 <get_page>
    383f:	48 89 c7             	mov    rdi,rax
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
    3842:	e8 29 fb ff ff       	call   3370 <allocate_chunk>
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
    3847:	be 00 01 00 00       	mov    esi,0x100
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
    384c:	48 89 c2             	mov    rdx,rax
			tail->next = large_objects;
    384f:	48 8b 05 ba 59 00 00 	mov    rax,QWORD PTR [rip+0x59ba]        # 9210 <large_objects>
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
    3856:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
    385a:	48 89 d7             	mov    rdi,rdx
			tail->next = large_objects;
    385d:	48 89 02             	mov    QWORD PTR [rdx],rax
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
    3860:	e8 eb fa ff ff       	call   3350 <get_large_object_payload>
    3865:	48 01 c1             	add    rcx,rax
    3868:	48 89 cf             	mov    rdi,rcx
    386b:	e8 00 fa ff ff       	call   3270 <align>
    3870:	48 39 c1             	cmp    rcx,rax
    3873:	0f 85 7d d8 ff ff    	jne    10f6 <allocate_large_object.cold>
			large_objects = tail;
    3879:	48 89 15 90 59 00 00 	mov    QWORD PTR [rip+0x5990],rdx        # 9210 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
    3880:	e8 fb fa ff ff       	call   3380 <maybe_repurpose_single_chunk_large_objects_head>
    3885:	e9 c8 fe ff ff       	jmp    3752 <allocate_large_object+0xc2>
	struct large_object *best = NULL, **best_prev = &large_objects;
    388a:	48 8d 2d 7f 59 00 00 	lea    rbp,[rip+0x597f]        # 9210 <large_objects>
    3891:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
		size_t size_with_header = size + sizeof(struct large_object);
    3898:	4c 8d 63 10          	lea    r12,[rbx+0x10]
		struct page* page = allocate_pages(size_with_header, &n_allocated);
    389c:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
		size_t n_allocated = 0;
    38a1:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
    38a8:	00 00 
		struct page* page = allocate_pages(size_with_header, &n_allocated);
    38aa:	4c 89 e7             	mov    rdi,r12
    38ad:	e8 de fc ff ff       	call   3590 <allocate_pages.constprop.0>
    38b2:	48 89 c1             	mov    rcx,rax
		if(!page)
    38b5:	48 85 c0             	test   rax,rax
    38b8:	0f 84 10 01 00 00    	je     39ce <allocate_large_object+0x33e>
		char* ptr = allocate_chunk(page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
    38be:	ba ff 00 00 00       	mov    edx,0xff
    38c3:	be 01 00 00 00       	mov    esi,0x1
    38c8:	48 89 c7             	mov    rdi,rax
    38cb:	e8 a0 fa ff ff       	call   3370 <allocate_chunk>
    38d0:	49 89 c2             	mov    r10,rax
		best->next = large_objects;
    38d3:	48 8b 05 36 59 00 00 	mov    rax,QWORD PTR [rip+0x5936]        # 9210 <large_objects>
		size_t page_header = ptr - ((char*)page);
    38da:	4c 29 d1             	sub    rcx,r10
		best->next = large_objects;
    38dd:	49 89 02             	mov    QWORD PTR [r10],rax
		best->size = best_size = n_allocated * PAGE_SIZE - page_header - LARGE_OBJECT_HEADER_SIZE;
    38e0:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
    38e5:	48 c1 e0 10          	shl    rax,0x10
    38e9:	4c 8d 44 01 f0       	lea    r8,[rcx+rax*1-0x10]
    38ee:	4d 89 42 08          	mov    QWORD PTR [r10+0x8],r8
		ASSERT(best_size >= size_with_header);
    38f2:	4d 39 c4             	cmp    r12,r8
    38f5:	0f 86 22 fe ff ff    	jbe    371d <allocate_large_object+0x8d>
    38fb:	e9 f6 d7 ff ff       	jmp    10f6 <allocate_large_object.cold>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
    3900:	4c 39 d8             	cmp    rax,r11
    3903:	0f 85 ed d7 ff ff    	jne    10f6 <allocate_large_object.cold>
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
    3909:	48 89 ef             	mov    rdi,rbp
    390c:	ba fe 00 00 00       	mov    edx,0xfe
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
    3911:	44 0f b7 e5          	movzx  r12d,bp
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
    3915:	e8 26 fa ff ff       	call   3340 <get_chunk_index>
    391a:	4c 89 cf             	mov    rdi,r9
    391d:	89 c6                	mov    esi,eax
    391f:	e8 4c fa ff ff       	call   3370 <allocate_chunk>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
    3924:	b8 00 00 01 00       	mov    eax,0x10000
    3929:	4c 29 e0             	sub    rax,r12
    392c:	49 89 42 08          	mov    QWORD PTR [r10+0x8],rax
			head->next = large_objects;
    3930:	48 8b 05 d9 58 00 00 	mov    rax,QWORD PTR [rip+0x58d9]        # 9210 <large_objects>
    3937:	49 89 02             	mov    QWORD PTR [r10],rax
			large_objects = head;
    393a:	4c 89 15 cf 58 00 00 	mov    QWORD PTR [rip+0x58cf],r10        # 9210 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
    3941:	e8 3a fa ff ff       	call   3380 <maybe_repurpose_single_chunk_large_objects_head>
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
    3946:	ba ff 00 00 00       	mov    edx,0xff
    394b:	be 01 00 00 00       	mov    esi,0x1
			struct page* next_page = start_page + 1;
    3950:	49 8d b9 00 00 01 00 	lea    rdi,[r9+0x10000]
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
    3957:	e8 14 fa ff ff       	call   3370 <allocate_chunk>
			best->size = best_size =
    395c:	4b 8d 94 04 f0 fe fe 	lea    rdx,[r12+r8*1-0x10110]
    3963:	ff 
    3964:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
    3968:	49 89 c2             	mov    r10,rax
			ASSERT(best_size >= size);
    396b:	48 39 d3             	cmp    rbx,rdx
    396e:	0f 87 82 d7 ff ff    	ja     10f6 <allocate_large_object.cold>
			tail_size = (best_size - size) & ~CHUNK_MASK;
    3974:	48 89 d1             	mov    rcx,rdx
    3977:	48 29 d9             	sub    rcx,rbx
    397a:	30 c9                	xor    cl,cl
    397c:	e9 74 fe ff ff       	jmp    37f5 <allocate_large_object+0x165>
    3981:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    3988:	4c 89 cd             	mov    rbp,r9
    398b:	49 89 c8             	mov    r8,rcx
    398e:	49 89 d2             	mov    r10,rdx
    3991:	e9 87 fd ff ff       	jmp    371d <allocate_large_object+0x8d>
			ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
    3996:	be 00 01 00 00       	mov    esi,0x100
    399b:	4c 89 df             	mov    rdi,r11
    399e:	e8 cd f8 ff ff       	call   3270 <align>
    39a3:	49 39 c3             	cmp    r11,rax
    39a6:	0f 85 4a d7 ff ff    	jne    10f6 <allocate_large_object.cold>
		best->size -= tail_size;
    39ac:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
		unsigned tail_idx = get_chunk_index(end - tail_size);
    39b0:	48 29 cf             	sub    rdi,rcx
		best->size -= tail_size;
    39b3:	48 29 ca             	sub    rdx,rcx
    39b6:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
    39ba:	e8 81 f9 ff ff       	call   3340 <get_chunk_index>
    39bf:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
    39c1:	85 c0                	test   eax,eax
    39c3:	0f 84 4d fe ff ff    	je     3816 <allocate_large_object+0x186>
    39c9:	e9 5d fe ff ff       	jmp    382b <allocate_large_object+0x19b>
			return NULL;
    39ce:	45 31 d2             	xor    r10d,r10d
    39d1:	e9 a1 fd ff ff       	jmp    3777 <allocate_large_object+0xe7>
    39d6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    39dd:	00 00 00 

00000000000039e0 <allocate_large>:
{
    39e0:	48 83 ec 08          	sub    rsp,0x8
	struct large_object* obj = allocate_large_object(size);
    39e4:	e8 a7 fc ff ff       	call   3690 <allocate_large_object>
	return obj ? get_large_object_payload(obj) : NULL;
    39e9:	48 85 c0             	test   rax,rax
    39ec:	74 12                	je     3a00 <allocate_large+0x20>
    39ee:	48 89 c7             	mov    rdi,rax
}
    39f1:	48 83 c4 08          	add    rsp,0x8
	return obj ? get_large_object_payload(obj) : NULL;
    39f5:	e9 56 f9 ff ff       	jmp    3350 <get_large_object_payload>
    39fa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
}
    3a00:	31 c0                	xor    eax,eax
    3a02:	48 83 c4 08          	add    rsp,0x8
    3a06:	c3                   	ret    
    3a07:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    3a0e:	00 00 

0000000000003a10 <obtain_small_objects>:
{
    3a10:	55                   	push   rbp
    3a11:	89 fd                	mov    ebp,edi
	if(*whole_chunk_freelist)
    3a13:	48 8b 3d 4e 58 00 00 	mov    rdi,QWORD PTR [rip+0x584e]        # 9268 <small_object_freelists+0x48>
    3a1a:	48 85 ff             	test   rdi,rdi
    3a1d:	74 71                	je     3a90 <obtain_small_objects+0x80>
		*whole_chunk_freelist = (*whole_chunk_freelist)->next;
    3a1f:	48 8b 07             	mov    rax,QWORD PTR [rdi]
    3a22:	48 89 05 3f 58 00 00 	mov    QWORD PTR [rip+0x583f],rax        # 9268 <small_object_freelists+0x48>
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
    3a29:	e8 12 f9 ff ff       	call   3340 <get_chunk_index>
    3a2e:	89 ea                	mov    edx,ebp
    3a30:	89 c6                	mov    esi,eax
    3a32:	e8 f9 f8 ff ff       	call   3330 <get_page>
    3a37:	48 89 c7             	mov    rdi,rax
    3a3a:	e8 31 f9 ff ff       	call   3370 <allocate_chunk>
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
    3a3f:	89 ef                	mov    edi,ebp
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
    3a41:	48 89 c2             	mov    rdx,rax
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
    3a44:	e8 c7 f8 ff ff       	call   3310 <chunk_kind_to_granules>
    3a49:	8d 34 c5 00 00 00 00 	lea    esi,[rax*8+0x0]
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
    3a50:	48 81 fe 00 01 00 00 	cmp    rsi,0x100
    3a57:	77 46                	ja     3a9f <obtain_small_objects+0x8f>
    3a59:	48 89 d0             	mov    rax,rdx
    3a5c:	48 89 f1             	mov    rcx,rsi
    3a5f:	48 29 f0             	sub    rax,rsi
    3a62:	48 8d 90 00 01 00 00 	lea    rdx,[rax+0x100]
	struct freelist* next = NULL;
    3a69:	31 c0                	xor    eax,eax
    3a6b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		struct freelist* head = (struct freelist*)(end - i);
    3a70:	48 89 c7             	mov    rdi,rax
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
    3a73:	48 01 f1             	add    rcx,rsi
		struct freelist* head = (struct freelist*)(end - i);
    3a76:	48 89 d0             	mov    rax,rdx
		head->next = next;
    3a79:	48 89 3a             	mov    QWORD PTR [rdx],rdi
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
    3a7c:	48 29 f2             	sub    rdx,rsi
    3a7f:	48 81 f9 00 01 00 00 	cmp    rcx,0x100
    3a86:	76 e8                	jbe    3a70 <obtain_small_objects+0x60>
}
    3a88:	5d                   	pop    rbp
    3a89:	c3                   	ret    
    3a8a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		chunk = allocate_large_object(0);
    3a90:	31 ff                	xor    edi,edi
    3a92:	e8 f9 fb ff ff       	call   3690 <allocate_large_object>
    3a97:	48 89 c7             	mov    rdi,rax
		if(!chunk)
    3a9a:	48 85 c0             	test   rax,rax
    3a9d:	75 8a                	jne    3a29 <obtain_small_objects+0x19>
			return NULL;
    3a9f:	31 c0                	xor    eax,eax
}
    3aa1:	5d                   	pop    rbp
    3aa2:	c3                   	ret    
    3aa3:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    3aaa:	00 00 00 
    3aad:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000003ab0 <allocate_small>:
{
    3ab0:	53                   	push   rbx
    3ab1:	41 89 f8             	mov    r8d,edi
	struct freelist** loc = get_small_object_freelist(kind);
    3ab4:	e8 17 fa ff ff       	call   34d0 <get_small_object_freelist>
    3ab9:	48 89 c3             	mov    rbx,rax
	if(!*loc)
    3abc:	48 8b 00             	mov    rax,QWORD PTR [rax]
    3abf:	48 85 c0             	test   rax,rax
    3ac2:	74 0c                	je     3ad0 <allocate_small+0x20>
	*loc = ret->next;
    3ac4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    3ac7:	48 89 13             	mov    QWORD PTR [rbx],rdx
}
    3aca:	5b                   	pop    rbx
    3acb:	c3                   	ret    
    3acc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		struct freelist* freelist = obtain_small_objects(kind);
    3ad0:	44 89 c7             	mov    edi,r8d
    3ad3:	e8 38 ff ff ff       	call   3a10 <obtain_small_objects>
		if(!freelist)
    3ad8:	48 85 c0             	test   rax,rax
    3adb:	74 ed                	je     3aca <allocate_small+0x1a>
		*loc = freelist;
    3add:	48 89 03             	mov    QWORD PTR [rbx],rax
    3ae0:	eb e2                	jmp    3ac4 <allocate_small+0x14>
    3ae2:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    3ae9:	00 00 00 
    3aec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000003af0 <malloc>:
{
    3af0:	f3 0f 1e fa          	endbr64 
    3af4:	48 83 ec 08          	sub    rsp,0x8
    3af8:	49 89 f8             	mov    r8,rdi
	size_t granules = size_to_granules(size);
    3afb:	e8 d0 f8 ff ff       	call   33d0 <size_to_granules>
	enum chunk_kind kind = granules_to_chunk_kind(granules);
    3b00:	89 c7                	mov    edi,eax
    3b02:	e8 79 f7 ff ff       	call   3280 <granules_to_chunk_kind>
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
    3b07:	3d ff 00 00 00       	cmp    eax,0xff
    3b0c:	74 12                	je     3b20 <malloc+0x30>
    3b0e:	89 c7                	mov    edi,eax
}
    3b10:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
    3b14:	e9 97 ff ff ff       	jmp    3ab0 <allocate_small>
    3b19:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    3b20:	4c 89 c7             	mov    rdi,r8
}
    3b23:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
    3b27:	e9 b4 fe ff ff       	jmp    39e0 <allocate_large>
    3b2c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000003b30 <reg_dev>:
    3b30:	55                   	push   rbp
    3b31:	48 89 e5             	mov    rbp,rsp
    3b34:	b8 00 00 00 00       	mov    eax,0x0
    3b39:	55                   	push   rbp
    3b3a:	48 0f 05             	rex.W syscall 
    3b3d:	5d                   	pop    rbp
    3b3e:	c9                   	leave  
    3b3f:	c3                   	ret    

0000000000003b40 <dispose_dev>:
    3b40:	55                   	push   rbp
    3b41:	48 89 e5             	mov    rbp,rsp
    3b44:	b8 01 00 00 00       	mov    eax,0x1
    3b49:	55                   	push   rbp
    3b4a:	48 0f 05             	rex.W syscall 
    3b4d:	5d                   	pop    rbp
    3b4e:	c9                   	leave  
    3b4f:	c3                   	ret    

0000000000003b50 <reg_drv>:
    3b50:	55                   	push   rbp
    3b51:	48 89 e5             	mov    rbp,rsp
    3b54:	b8 02 00 00 00       	mov    eax,0x2
    3b59:	55                   	push   rbp
    3b5a:	48 0f 05             	rex.W syscall 
    3b5d:	5d                   	pop    rbp
    3b5e:	c9                   	leave  
    3b5f:	c3                   	ret    

0000000000003b60 <dispose_drv>:
    3b60:	55                   	push   rbp
    3b61:	48 89 e5             	mov    rbp,rsp
    3b64:	b8 03 00 00 00       	mov    eax,0x3
    3b69:	55                   	push   rbp
    3b6a:	48 0f 05             	rex.W syscall 
    3b6d:	5d                   	pop    rbp
    3b6e:	c9                   	leave  
    3b6f:	c3                   	ret    

0000000000003b70 <call_drvfunc>:
    3b70:	55                   	push   rbp
    3b71:	48 89 e5             	mov    rbp,rsp
    3b74:	b8 04 00 00 00       	mov    eax,0x4
    3b79:	55                   	push   rbp
    3b7a:	48 0f 05             	rex.W syscall 
    3b7d:	5d                   	pop    rbp
    3b7e:	c9                   	leave  
    3b7f:	c3                   	ret    

0000000000003b80 <req_mem>:
    3b80:	55                   	push   rbp
    3b81:	48 89 e5             	mov    rbp,rsp
    3b84:	b8 05 00 00 00       	mov    eax,0x5
    3b89:	55                   	push   rbp
    3b8a:	48 0f 05             	rex.W syscall 
    3b8d:	5d                   	pop    rbp
    3b8e:	c9                   	leave  
    3b8f:	c3                   	ret    

0000000000003b90 <free_mem>:
    3b90:	55                   	push   rbp
    3b91:	48 89 e5             	mov    rbp,rsp
    3b94:	b8 06 00 00 00       	mov    eax,0x6
    3b99:	55                   	push   rbp
    3b9a:	48 0f 05             	rex.W syscall 
    3b9d:	5d                   	pop    rbp
    3b9e:	c9                   	leave  
    3b9f:	c3                   	ret    

0000000000003ba0 <reg_proc>:
    3ba0:	55                   	push   rbp
    3ba1:	48 89 e5             	mov    rbp,rsp
    3ba4:	b8 07 00 00 00       	mov    eax,0x7
    3ba9:	55                   	push   rbp
    3baa:	48 0f 05             	rex.W syscall 
    3bad:	5d                   	pop    rbp
    3bae:	c9                   	leave  
    3baf:	c3                   	ret    

0000000000003bb0 <del_proc>:
    3bb0:	55                   	push   rbp
    3bb1:	48 89 e5             	mov    rbp,rsp
    3bb4:	b8 08 00 00 00       	mov    eax,0x8
    3bb9:	55                   	push   rbp
    3bba:	48 0f 05             	rex.W syscall 
    3bbd:	5d                   	pop    rbp
    3bbe:	c9                   	leave  
    3bbf:	c3                   	ret    

0000000000003bc0 <get_proc_addr>:
    3bc0:	55                   	push   rbp
    3bc1:	48 89 e5             	mov    rbp,rsp
    3bc4:	b8 09 00 00 00       	mov    eax,0x9
    3bc9:	55                   	push   rbp
    3bca:	48 0f 05             	rex.W syscall 
    3bcd:	5d                   	pop    rbp
    3bce:	c9                   	leave  
    3bcf:	c3                   	ret    

0000000000003bd0 <chk_vm>:
    3bd0:	55                   	push   rbp
    3bd1:	48 89 e5             	mov    rbp,rsp
    3bd4:	b8 0a 00 00 00       	mov    eax,0xa
    3bd9:	55                   	push   rbp
    3bda:	48 0f 05             	rex.W syscall 
    3bdd:	5d                   	pop    rbp
    3bde:	c9                   	leave  
    3bdf:	c3                   	ret    

0000000000003be0 <open>:
    3be0:	55                   	push   rbp
    3be1:	48 89 e5             	mov    rbp,rsp
    3be4:	b8 0b 00 00 00       	mov    eax,0xb
    3be9:	55                   	push   rbp
    3bea:	48 0f 05             	rex.W syscall 
    3bed:	5d                   	pop    rbp
    3bee:	c9                   	leave  
    3bef:	c3                   	ret    

0000000000003bf0 <close>:
    3bf0:	55                   	push   rbp
    3bf1:	48 89 e5             	mov    rbp,rsp
    3bf4:	b8 0c 00 00 00       	mov    eax,0xc
    3bf9:	55                   	push   rbp
    3bfa:	48 0f 05             	rex.W syscall 
    3bfd:	5d                   	pop    rbp
    3bfe:	c9                   	leave  
    3bff:	c3                   	ret    

0000000000003c00 <read>:
    3c00:	55                   	push   rbp
    3c01:	48 89 e5             	mov    rbp,rsp
    3c04:	b8 0d 00 00 00       	mov    eax,0xd
    3c09:	55                   	push   rbp
    3c0a:	48 0f 05             	rex.W syscall 
    3c0d:	5d                   	pop    rbp
    3c0e:	c9                   	leave  
    3c0f:	c3                   	ret    

0000000000003c10 <write>:
    3c10:	55                   	push   rbp
    3c11:	48 89 e5             	mov    rbp,rsp
    3c14:	b8 0e 00 00 00       	mov    eax,0xe
    3c19:	55                   	push   rbp
    3c1a:	48 0f 05             	rex.W syscall 
    3c1d:	5d                   	pop    rbp
    3c1e:	c9                   	leave  
    3c1f:	c3                   	ret    

0000000000003c20 <seek>:
    3c20:	55                   	push   rbp
    3c21:	48 89 e5             	mov    rbp,rsp
    3c24:	b8 0f 00 00 00       	mov    eax,0xf
    3c29:	55                   	push   rbp
    3c2a:	48 0f 05             	rex.W syscall 
    3c2d:	5d                   	pop    rbp
    3c2e:	c9                   	leave  
    3c2f:	c3                   	ret    

0000000000003c30 <tell>:
    3c30:	55                   	push   rbp
    3c31:	48 89 e5             	mov    rbp,rsp
    3c34:	b8 10 00 00 00       	mov    eax,0x10
    3c39:	55                   	push   rbp
    3c3a:	48 0f 05             	rex.W syscall 
    3c3d:	5d                   	pop    rbp
    3c3e:	c9                   	leave  
    3c3f:	c3                   	ret    

0000000000003c40 <reg_vol>:
    3c40:	55                   	push   rbp
    3c41:	48 89 e5             	mov    rbp,rsp
    3c44:	b8 11 00 00 00       	mov    eax,0x11
    3c49:	55                   	push   rbp
    3c4a:	48 0f 05             	rex.W syscall 
    3c4d:	5d                   	pop    rbp
    3c4e:	c9                   	leave  
    3c4f:	c3                   	ret    

0000000000003c50 <free_vol>:
    3c50:	55                   	push   rbp
    3c51:	48 89 e5             	mov    rbp,rsp
    3c54:	b8 12 00 00 00       	mov    eax,0x12
    3c59:	55                   	push   rbp
    3c5a:	48 0f 05             	rex.W syscall 
    3c5d:	5d                   	pop    rbp
    3c5e:	c9                   	leave  
    3c5f:	c3                   	ret    

0000000000003c60 <exec>:
    3c60:	55                   	push   rbp
    3c61:	48 89 e5             	mov    rbp,rsp
    3c64:	b8 13 00 00 00       	mov    eax,0x13
    3c69:	55                   	push   rbp
    3c6a:	48 0f 05             	rex.W syscall 
    3c6d:	5d                   	pop    rbp
    3c6e:	c9                   	leave  
    3c6f:	c3                   	ret    

0000000000003c70 <exit>:
    3c70:	55                   	push   rbp
    3c71:	48 89 e5             	mov    rbp,rsp
    3c74:	b8 14 00 00 00       	mov    eax,0x14
    3c79:	55                   	push   rbp
    3c7a:	48 0f 05             	rex.W syscall 
    3c7d:	5d                   	pop    rbp
    3c7e:	c9                   	leave  
    3c7f:	c3                   	ret    

0000000000003c80 <abort>:
    3c80:	55                   	push   rbp
    3c81:	48 89 e5             	mov    rbp,rsp
    3c84:	b8 14 00 00 00       	mov    eax,0x14
    3c89:	55                   	push   rbp
    3c8a:	48 0f 05             	rex.W syscall 
    3c8d:	5d                   	pop    rbp
    3c8e:	c9                   	leave  
    3c8f:	c3                   	ret    

0000000000003c90 <call>:
    3c90:	55                   	push   rbp
    3c91:	48 89 e5             	mov    rbp,rsp
    3c94:	b8 15 00 00 00       	mov    eax,0x15
    3c99:	55                   	push   rbp
    3c9a:	48 0f 05             	rex.W syscall 
    3c9d:	5d                   	pop    rbp
    3c9e:	c9                   	leave  
    3c9f:	c3                   	ret    

0000000000003ca0 <mkfifo>:
    3ca0:	55                   	push   rbp
    3ca1:	48 89 e5             	mov    rbp,rsp
    3ca4:	b8 16 00 00 00       	mov    eax,0x16
    3ca9:	55                   	push   rbp
    3caa:	48 0f 05             	rex.W syscall 
    3cad:	5d                   	pop    rbp
    3cae:	c9                   	leave  
    3caf:	c3                   	ret    

0000000000003cb0 <brk>:
    3cb0:	55                   	push   rbp
    3cb1:	48 89 e5             	mov    rbp,rsp
    3cb4:	b8 17 00 00 00       	mov    eax,0x17
    3cb9:	55                   	push   rbp
    3cba:	48 0f 05             	rex.W syscall 
    3cbd:	5d                   	pop    rbp
    3cbe:	c9                   	leave  
    3cbf:	c3                   	ret    

0000000000003cc0 <find_dev>:
    3cc0:	55                   	push   rbp
    3cc1:	48 89 e5             	mov    rbp,rsp
    3cc4:	b8 19 00 00 00       	mov    eax,0x19
    3cc9:	55                   	push   rbp
    3cca:	48 0f 05             	rex.W syscall 
    3ccd:	5d                   	pop    rbp
    3cce:	c9                   	leave  
    3ccf:	c3                   	ret    

0000000000003cd0 <operate_dev>:
    3cd0:	55                   	push   rbp
    3cd1:	48 89 e5             	mov    rbp,rsp
    3cd4:	b8 1a 00 00 00       	mov    eax,0x1a
    3cd9:	55                   	push   rbp
    3cda:	48 0f 05             	rex.W syscall 
    3cdd:	5d                   	pop    rbp
    3cde:	c9                   	leave  
    3cdf:	c3                   	ret    

0000000000003ce0 <fork>:
    3ce0:	55                   	push   rbp
    3ce1:	48 89 e5             	mov    rbp,rsp
    3ce4:	b8 1b 00 00 00       	mov    eax,0x1b
    3ce9:	55                   	push   rbp
    3cea:	48 0f 05             	rex.W syscall 
    3ced:	5d                   	pop    rbp
    3cee:	c9                   	leave  
    3cef:	c3                   	ret    

0000000000003cf0 <execve>:
    3cf0:	55                   	push   rbp
    3cf1:	48 89 e5             	mov    rbp,rsp
    3cf4:	b8 1c 00 00 00       	mov    eax,0x1c
    3cf9:	55                   	push   rbp
    3cfa:	48 0f 05             	rex.W syscall 
    3cfd:	5d                   	pop    rbp
    3cfe:	c9                   	leave  
    3cff:	c3                   	ret    

0000000000003d00 <waitpid>:
    3d00:	55                   	push   rbp
    3d01:	48 89 e5             	mov    rbp,rsp
    3d04:	b8 1d 00 00 00       	mov    eax,0x1d
    3d09:	55                   	push   rbp
    3d0a:	48 0f 05             	rex.W syscall 
    3d0d:	5d                   	pop    rbp
    3d0e:	c9                   	leave  
    3d0f:	c3                   	ret    

0000000000003d10 <mmap>:
    3d10:	55                   	push   rbp
    3d11:	48 89 e5             	mov    rbp,rsp
    3d14:	b8 1e 00 00 00       	mov    eax,0x1e
    3d19:	55                   	push   rbp
    3d1a:	48 0f 05             	rex.W syscall 
    3d1d:	5d                   	pop    rbp
    3d1e:	c9                   	leave  
    3d1f:	c3                   	ret    

0000000000003d20 <munmap>:
    3d20:	55                   	push   rbp
    3d21:	48 89 e5             	mov    rbp,rsp
    3d24:	b8 1f 00 00 00       	mov    eax,0x1f
    3d29:	55                   	push   rbp
    3d2a:	48 0f 05             	rex.W syscall 
    3d2d:	5d                   	pop    rbp
    3d2e:	c9                   	leave  
    3d2f:	c3                   	ret    

0000000000003d30 <mknod>:
    3d30:	55                   	push   rbp
    3d31:	48 89 e5             	mov    rbp,rsp
    3d34:	b8 21 00 00 00       	mov    eax,0x21
    3d39:	55                   	push   rbp
    3d3a:	48 0f 05             	rex.W syscall 
    3d3d:	5d                   	pop    rbp
    3d3e:	c9                   	leave  
    3d3f:	c3                   	ret    

0000000000003d40 <kb_readc>:
    3d40:	55                   	push   rbp
    3d41:	48 89 e5             	mov    rbp,rsp
    3d44:	b8 64 00 00 00       	mov    eax,0x64
    3d49:	55                   	push   rbp
    3d4a:	48 0f 05             	rex.W syscall 
    3d4d:	5d                   	pop    rbp
    3d4e:	c9                   	leave  
    3d4f:	c3                   	ret    

0000000000003d50 <remove>:
    3d50:	55                   	push   rbp
    3d51:	48 89 e5             	mov    rbp,rsp
    3d54:	b8 22 00 00 00       	mov    eax,0x22
    3d59:	55                   	push   rbp
    3d5a:	48 0f 05             	rex.W syscall 
    3d5d:	5d                   	pop    rbp
    3d5e:	c9                   	leave  
    3d5f:	c3                   	ret    

0000000000003d60 <sbrk>:
    3d60:	55                   	push   rbp
    3d61:	48 89 e5             	mov    rbp,rsp
    3d64:	b8 23 00 00 00       	mov    eax,0x23
    3d69:	55                   	push   rbp
    3d6a:	48 0f 05             	rex.W syscall 
    3d6d:	5d                   	pop    rbp
    3d6e:	c9                   	leave  
    3d6f:	c3                   	ret    

0000000000003d70 <chkmmap>:
    3d70:	55                   	push   rbp
    3d71:	48 89 e5             	mov    rbp,rsp
    3d74:	b8 24 00 00 00       	mov    eax,0x24
    3d79:	55                   	push   rbp
    3d7a:	48 0f 05             	rex.W syscall 
    3d7d:	5d                   	pop    rbp
    3d7e:	c9                   	leave  
    3d7f:	c3                   	ret    
