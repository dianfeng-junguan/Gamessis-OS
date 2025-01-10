
bin/dl.so:     file format elf64-x86-64


Disassembly of section .plt:

0000000000001000 <heap_size_in_pages@plt-0x10>:
    1000:	ff 35 02 50 00 00    	push   QWORD PTR [rip+0x5002]        # 6008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1006:	ff 25 04 50 00 00    	jmp    QWORD PTR [rip+0x5004]        # 6010 <_GLOBAL_OFFSET_TABLE_+0x10>
    100c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000001010 <heap_size_in_pages@plt>:
    1010:	ff 25 02 50 00 00    	jmp    QWORD PTR [rip+0x5002]        # 6018 <heap_size_in_pages+0x2cd8>
    1016:	68 00 00 00 00       	push   0x0
    101b:	e9 e0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001020 <get_got@plt>:
    1020:	ff 25 fa 4f 00 00    	jmp    QWORD PTR [rip+0x4ffa]        # 6020 <get_got+0x39a6>
    1026:	68 01 00 00 00       	push   0x1
    102b:	e9 d0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001030 <malloc@plt>:
    1030:	ff 25 f2 4f 00 00    	jmp    QWORD PTR [rip+0x4ff2]        # 6028 <malloc+0x2768>
    1036:	68 02 00 00 00       	push   0x2
    103b:	e9 c0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001040 <fill_reloc@plt>:
    1040:	ff 25 ea 4f 00 00    	jmp    QWORD PTR [rip+0x4fea]        # 6030 <fill_reloc+0x38b8>
    1046:	68 03 00 00 00       	push   0x3
    104b:	e9 b0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001050 <mmap@plt>:
    1050:	ff 25 e2 4f 00 00    	jmp    QWORD PTR [rip+0x4fe2]        # 6038 <mmap+0x2558>
    1056:	68 04 00 00 00       	push   0x4
    105b:	e9 a0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001060 <read@plt>:
    1060:	ff 25 da 4f 00 00    	jmp    QWORD PTR [rip+0x4fda]        # 6040 <read+0x2670>
    1066:	68 05 00 00 00       	push   0x5
    106b:	e9 90 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001070 <sbrk@plt>:
    1070:	ff 25 d2 4f 00 00    	jmp    QWORD PTR [rip+0x4fd2]        # 6048 <sbrk+0x2518>
    1076:	68 06 00 00 00       	push   0x6
    107b:	e9 80 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001080 <dlstrcmp@plt>:
    1080:	ff 25 ca 4f 00 00    	jmp    QWORD PTR [rip+0x4fca]        # 6050 <dlstrcmp+0x3a6d>
    1086:	68 07 00 00 00       	push   0x7
    108b:	e9 70 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001090 <seek@plt>:
    1090:	ff 25 c2 4f 00 00    	jmp    QWORD PTR [rip+0x4fc2]        # 6058 <seek+0x2668>
    1096:	68 08 00 00 00       	push   0x8
    109b:	e9 60 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010a0 <get_load_base@plt>:
    10a0:	ff 25 ba 4f 00 00    	jmp    QWORD PTR [rip+0x4fba]        # 6060 <get_load_base+0x3a12>
    10a6:	68 09 00 00 00       	push   0x9
    10ab:	e9 50 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010b0 <load_elfso@plt>:
    10b0:	ff 25 b2 4f 00 00    	jmp    QWORD PTR [rip+0x4fb2]        # 6068 <load_elfso+0x4868>
    10b6:	68 0a 00 00 00       	push   0xa
    10bb:	e9 40 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010c0 <chkmmap@plt>:
    10c0:	ff 25 aa 4f 00 00    	jmp    QWORD PTR [rip+0x4faa]        # 6070 <chkmmap+0x2530>
    10c6:	68 0b 00 00 00       	push   0xb
    10cb:	e9 30 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010d0 <open@plt>:
    10d0:	ff 25 a2 4f 00 00    	jmp    QWORD PTR [rip+0x4fa2]        # 6078 <open+0x26c8>
    10d6:	68 0c 00 00 00       	push   0xc
    10db:	e9 20 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010e0 <close@plt>:
    10e0:	ff 25 9a 4f 00 00    	jmp    QWORD PTR [rip+0x4f9a]        # 6080 <close+0x26c0>
    10e6:	68 0d 00 00 00       	push   0xd
    10eb:	e9 10 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010f0 <free@plt>:
    10f0:	ff 25 92 4f 00 00    	jmp    QWORD PTR [rip+0x4f92]        # 6088 <free+0x2dc8>
    10f6:	68 0e 00 00 00       	push   0xe
    10fb:	e9 00 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

Disassembly of section .text:

0000000000001100 <maybe_merge_free_large_object.cold>:
{
	struct large_object* obj = *prev;
	while(1)
	{
		char* end = get_large_object_payload(obj) + obj->size;
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
    1100:	0f 0b                	ud2    

0000000000001102 <get_small_object_freelist.cold>:
{
	return (size + GRANULE_SIZE - 1) >> GRANULE_SIZE_LOG_2;
}
static struct freelist** get_small_object_freelist(enum chunk_kind kind)
{
	ASSERT(kind < SMALL_OBJECT_CHUNK_KINDS);
    1102:	0f 0b                	ud2    

0000000000001104 <allocate_pages.constprop.0.cold>:
		ASSERT(grow);
    1104:	0f 0b                	ud2    

0000000000001106 <allocate_large_object.cold>:
		ASSERT(best_size >= size_with_header);
    1106:	0f 0b                	ud2    

0000000000001108 <get_modid>:
extern char _GLOBAL_OFFSET_TABLE_[];
void*       symtabs[MAX_SYMTABS] = {0};
module      modules[MAX_MODULES];
int         dlid;
id_t        get_modid(void)
{
    1108:	f3 0f 1e fa          	endbr64 
    110c:	55                   	push   rbp
    110d:	48 89 e5             	mov    rbp,rsp
    static id_t modid_d = 0;
    return modid_d++;
    1110:	8b 05 ea 80 00 00    	mov    eax,DWORD PTR [rip+0x80ea]        # 9200 <modid_d.0>
    1116:	8d 50 01             	lea    edx,[rax+0x1]
    1119:	89 15 e1 80 00 00    	mov    DWORD PTR [rip+0x80e1],edx        # 9200 <modid_d.0>
}
    111f:	5d                   	pop    rbp
    1120:	c3                   	ret    

0000000000001121 <dlmain>:
int dlmain(int fno, void* load_offset, int argc, char** argv, char** environ)
{
    1121:	f3 0f 1e fa          	endbr64 
    1125:	55                   	push   rbp
    1126:	48 89 e5             	mov    rbp,rsp
    1129:	48 83 ec 30          	sub    rsp,0x30
    112d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    1130:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    1134:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    1137:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    113b:	4c 89 45 d0          	mov    QWORD PTR [rbp-0x30],r8
    //完成自我重定位（自举）
    dlid = dl_init(load_offset);
    113f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1143:	48 89 c7             	mov    rdi,rax
    1146:	e8 aa 18 00 00       	call   29f5 <dl_init>
    114b:	48 8b 15 8e 4e 00 00 	mov    rdx,QWORD PTR [rip+0x4e8e]        # 5fe0 <dlid-0x31c0>
    1152:	89 02                	mov    DWORD PTR [rdx],eax

    //这部分是因为c库的malloc需要这个变量，但是现在又不能直接设置入口函数为entry
    extern unsigned long long __heap_base;
    __heap_base = sbrk(0);
    1154:	bf 00 00 00 00       	mov    edi,0x0
    1159:	e8 12 ff ff ff       	call   1070 <sbrk@plt>
    115e:	48 89 c2             	mov    rdx,rax
    1161:	48 8b 05 80 4e 00 00 	mov    rax,QWORD PTR [rip+0x4e80]        # 5fe8 <__heap_base-0x3288>
    1168:	48 89 10             	mov    QWORD PTR [rax],rdx
    //加载elf文件
    //读取文件头

    //递归加载elf和so
    off_t entry = load_elfso(fno);
    116b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    116e:	89 c7                	mov    edi,eax
    1170:	e8 3b ff ff ff       	call   10b0 <load_elfso@plt>
    1175:	48 98                	cdqe   
    1177:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    close(fno);
    117b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    117e:	89 c7                	mov    edi,eax
    1180:	e8 5b ff ff ff       	call   10e0 <close@plt>
    //跳转到程序入口
    int (*main)(int, char**, char**) = entry;
    1185:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1189:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    main(argc, argv, environ);
    118d:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    1191:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
    1195:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
    1198:	4c 8b 45 f0          	mov    r8,QWORD PTR [rbp-0x10]
    119c:	48 89 ce             	mov    rsi,rcx
    119f:	89 c7                	mov    edi,eax
    11a1:	41 ff d0             	call   r8
    return 0;
    11a4:	b8 00 00 00 00       	mov    eax,0x0
}
    11a9:	c9                   	leave  
    11aa:	c3                   	ret    

00000000000011ab <load_elfso_old>:
int load_elfso_old(int fno)
{
    11ab:	f3 0f 1e fa          	endbr64 
    11af:	55                   	push   rbp
    11b0:	48 89 e5             	mov    rbp,rsp
    11b3:	48 81 ec 30 01 00 00 	sub    rsp,0x130
    11ba:	89 bd dc fe ff ff    	mov    DWORD PTR [rbp-0x124],edi
    // 读取文件头
    Elf64_Ehdr ehdr;
    //读取文件头
    read(fno, &ehdr, sizeof(ehdr));
    11c0:	48 8d 8d e0 fe ff ff 	lea    rcx,[rbp-0x120]
    11c7:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    11cd:	ba 40 00 00 00       	mov    edx,0x40
    11d2:	48 89 ce             	mov    rsi,rcx
    11d5:	89 c7                	mov    edi,eax
    11d7:	e8 84 fe ff ff       	call   1060 <read@plt>

    unsigned short entn = ehdr.e_phnum;
    11dc:	0f b7 85 18 ff ff ff 	movzx  eax,WORD PTR [rbp-0xe8]
    11e3:	66 89 45 86          	mov    WORD PTR [rbp-0x7a],ax
    unsigned short ents = ehdr.e_phentsize;
    11e7:	0f b7 85 16 ff ff ff 	movzx  eax,WORD PTR [rbp-0xea]
    11ee:	66 89 45 84          	mov    WORD PTR [rbp-0x7c],ax
    module*        mod  = 0;
    11f2:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    11f9:	00 
    // module项设置
    //注册自己
    for (int i = 0; i < MAX_MODULES; i++) {
    11fa:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    1201:	e9 d1 00 00 00       	jmp    12d7 <load_elfso_old+0x12c>
        if (modules[i].type == ET_NONE) {
    1206:	48 8b 0d cb 4d 00 00 	mov    rcx,QWORD PTR [rip+0x4dcb]        # 5fd8 <modules-0x1c8>
    120d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1210:	48 63 d0             	movsxd rdx,eax
    1213:	48 89 d0             	mov    rax,rdx
    1216:	48 01 c0             	add    rax,rax
    1219:	48 01 d0             	add    rax,rdx
    121c:	48 c1 e0 05          	shl    rax,0x5
    1220:	48 01 c8             	add    rax,rcx
    1223:	48 83 c0 18          	add    rax,0x18
    1227:	48 8b 00             	mov    rax,QWORD PTR [rax]
    122a:	48 85 c0             	test   rax,rax
    122d:	0f 85 a0 00 00 00    	jne    12d3 <load_elfso_old+0x128>
            modules[i].type        = ehdr.e_type;
    1233:	0f b7 85 f0 fe ff ff 	movzx  eax,WORD PTR [rbp-0x110]
    123a:	0f b7 d0             	movzx  edx,ax
    123d:	48 8b 35 94 4d 00 00 	mov    rsi,QWORD PTR [rip+0x4d94]        # 5fd8 <modules-0x1c8>
    1244:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1247:	48 63 c8             	movsxd rcx,eax
    124a:	48 89 c8             	mov    rax,rcx
    124d:	48 01 c0             	add    rax,rax
    1250:	48 01 c8             	add    rax,rcx
    1253:	48 c1 e0 05          	shl    rax,0x5
    1257:	48 01 f0             	add    rax,rsi
    125a:	48 83 c0 18          	add    rax,0x18
    125e:	48 89 10             	mov    QWORD PTR [rax],rdx
            modules[i].load_offset = 0;
    1261:	48 8b 0d 70 4d 00 00 	mov    rcx,QWORD PTR [rip+0x4d70]        # 5fd8 <modules-0x1c8>
    1268:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    126b:	48 63 d0             	movsxd rdx,eax
    126e:	48 89 d0             	mov    rax,rdx
    1271:	48 01 c0             	add    rax,rax
    1274:	48 01 d0             	add    rax,rdx
    1277:	48 c1 e0 05          	shl    rax,0x5
    127b:	48 01 c8             	add    rax,rcx
    127e:	48 83 c0 08          	add    rax,0x8
    1282:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            modules[i].base        = 0;
    1289:	48 8b 0d 48 4d 00 00 	mov    rcx,QWORD PTR [rip+0x4d48]        # 5fd8 <modules-0x1c8>
    1290:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1293:	48 63 d0             	movsxd rdx,eax
    1296:	48 89 d0             	mov    rax,rdx
    1299:	48 01 c0             	add    rax,rax
    129c:	48 01 d0             	add    rax,rdx
    129f:	48 c1 e0 05          	shl    rax,0x5
    12a3:	48 01 c8             	add    rax,rcx
    12a6:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            mod                    = modules + i;
    12ad:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    12b0:	48 63 d0             	movsxd rdx,eax
    12b3:	48 89 d0             	mov    rax,rdx
    12b6:	48 01 c0             	add    rax,rax
    12b9:	48 01 d0             	add    rax,rdx
    12bc:	48 c1 e0 05          	shl    rax,0x5
    12c0:	48 89 c2             	mov    rdx,rax
    12c3:	48 8b 05 0e 4d 00 00 	mov    rax,QWORD PTR [rip+0x4d0e]        # 5fd8 <modules-0x1c8>
    12ca:	48 01 d0             	add    rax,rdx
    12cd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
            break;
    12d1:	eb 0e                	jmp    12e1 <load_elfso_old+0x136>
    for (int i = 0; i < MAX_MODULES; i++) {
    12d3:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
    12d7:	83 7d f4 7f          	cmp    DWORD PTR [rbp-0xc],0x7f
    12db:	0f 8e 25 ff ff ff    	jle    1206 <load_elfso_old+0x5b>
        }
    }
    //需要malloc一块内存
    Elf64_Phdr* ph = malloc(entn * ents);   //(Elf64_Phdr *) (tmpla + ehdr.e_phoff);
    12e1:	0f b7 55 86          	movzx  edx,WORD PTR [rbp-0x7a]
    12e5:	0f b7 45 84          	movzx  eax,WORD PTR [rbp-0x7c]
    12e9:	0f af c2             	imul   eax,edx
    12ec:	48 98                	cdqe   
    12ee:	48 89 c7             	mov    rdi,rax
    12f1:	e8 3a fd ff ff       	call   1030 <malloc@plt>
    12f6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    seek(fno, ehdr.e_phoff, SEEK_SET);
    12fa:	48 8b 8d 00 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x100]
    1301:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    1307:	ba 00 00 00 00       	mov    edx,0x0
    130c:	48 89 ce             	mov    rsi,rcx
    130f:	89 c7                	mov    edi,eax
    1311:	b8 00 00 00 00       	mov    eax,0x0
    1316:	e8 75 fd ff ff       	call   1090 <seek@plt>
    read(fno, ph, entn * ents);
    131b:	0f b7 55 86          	movzx  edx,WORD PTR [rbp-0x7a]
    131f:	0f b7 45 84          	movzx  eax,WORD PTR [rbp-0x7c]
    1323:	0f af c2             	imul   eax,edx
    1326:	48 63 d0             	movsxd rdx,eax
    1329:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
    132d:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    1333:	48 89 ce             	mov    rsi,rcx
    1336:	89 c7                	mov    edi,eax
    1338:	e8 23 fd ff ff       	call   1060 <read@plt>
    size_t tot_sz = 0;
    133d:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
    1344:	00 00 00 00 
    off_t  base = ph->p_vaddr, offset = 0;
    1348:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    134c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    1350:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    1357:	48 c7 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],0x0
    135e:	00 00 00 00 
    int (**init)() = 0, init_arraysz = 0;
    1362:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    1369:	00 
    136a:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0

    for (int i = 0; i < entn; i++) {
    1371:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [rbp-0x28],0x0
    1378:	e9 ca 00 00 00       	jmp    1447 <load_elfso_old+0x29c>
        //加载段
        if ((ph->p_type | PT_LOAD) != 0) {
            unsigned long off  = ph->p_offset;
    137d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1381:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1385:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
            unsigned long fs   = ph->p_filesz;
    138c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1390:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    1394:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            size_t        ms   = ph->p_memsz;
    139b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    139f:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    13a3:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            char*         vptr = (char*)ph->p_vaddr + offset;
    13aa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    13ae:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    13b2:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    13b9:	48 01 d0             	add    rax,rdx
    13bc:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            if (off == 0) {
    13c3:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
    13ca:	00 
    13cb:	75 0f                	jne    13dc <load_elfso_old+0x231>
                mod->header = vptr;
    13cd:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
    13d4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    13d8:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
            }
            //先映射好内存
            int prot = PROT_READ;
    13dc:	c7 85 24 ff ff ff 01 	mov    DWORD PTR [rbp-0xdc],0x1
    13e3:	00 00 00 
            if ((ph->p_flags | PF_X))
                prot |= PROT_EXEC;
    13e6:	83 8d 24 ff ff ff 04 	or     DWORD PTR [rbp-0xdc],0x4
            if ((ph->p_flags | PF_W))
                prot |= PROT_WRITE;
    13ed:	83 8d 24 ff ff ff 02 	or     DWORD PTR [rbp-0xdc],0x2
            int flags = MAP_PRIVATE;
    13f4:	c7 45 d4 02 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x2
            if (ehdr.e_type == ET_EXEC)
    13fb:	0f b7 85 f0 fe ff ff 	movzx  eax,WORD PTR [rbp-0x110]
    1402:	66 83 f8 02          	cmp    ax,0x2
    1406:	75 04                	jne    140c <load_elfso_old+0x261>
                flags |= MAP_FIXED;
    1408:	83 4d d4 01          	or     DWORD PTR [rbp-0x2c],0x1
            mmap(vptr, fs, prot, flags, fno, off);
    140c:	4c 8b 85 40 ff ff ff 	mov    r8,QWORD PTR [rbp-0xc0]
    1413:	8b bd dc fe ff ff    	mov    edi,DWORD PTR [rbp-0x124]
    1419:	8b 4d d4             	mov    ecx,DWORD PTR [rbp-0x2c]
    141c:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
    1422:	48 8b b5 38 ff ff ff 	mov    rsi,QWORD PTR [rbp-0xc8]
    1429:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    1430:	4d 89 c1             	mov    r9,r8
    1433:	41 89 f8             	mov    r8d,edi
    1436:	48 89 c7             	mov    rdi,rax
    1439:	e8 12 fc ff ff       	call   1050 <mmap@plt>
        }
        ph++;
    143e:	48 83 45 e8 38       	add    QWORD PTR [rbp-0x18],0x38
    for (int i = 0; i < entn; i++) {
    1443:	83 45 d8 01          	add    DWORD PTR [rbp-0x28],0x1
    1447:	0f b7 45 86          	movzx  eax,WORD PTR [rbp-0x7a]
    144b:	39 45 d8             	cmp    DWORD PTR [rbp-0x28],eax
    144e:	0f 8c 29 ff ff ff    	jl     137d <load_elfso_old+0x1d2>
    }

    Elf64_Dyn* dynamic = 0;
    1454:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
    145b:	00 
    //寻找dynamic段
    struct Elf64_Shdr* shdr =
        mmap(0, ehdr.e_shentsize * ehdr.e_shnum, PROT_READ, MAP_PRIVATE, fno, ehdr.e_shoff);
    145c:	48 8b 8d 08 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xf8]
    1463:	0f b7 85 1a ff ff ff 	movzx  eax,WORD PTR [rbp-0xe6]
    146a:	0f b7 d0             	movzx  edx,ax
    146d:	0f b7 85 1c ff ff ff 	movzx  eax,WORD PTR [rbp-0xe4]
    1474:	0f b7 c0             	movzx  eax,ax
    1477:	0f af c2             	imul   eax,edx
    147a:	48 98                	cdqe   
    147c:	8b 95 dc fe ff ff    	mov    edx,DWORD PTR [rbp-0x124]
    1482:	49 89 c9             	mov    r9,rcx
    1485:	41 89 d0             	mov    r8d,edx
    1488:	b9 02 00 00 00       	mov    ecx,0x2
    148d:	ba 01 00 00 00       	mov    edx,0x1
    1492:	48 89 c6             	mov    rsi,rax
    1495:	bf 00 00 00 00       	mov    edi,0x0
    149a:	e8 b1 fb ff ff       	call   1050 <mmap@plt>
    149f:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    mod->p_shdrs = shdr;
    14a6:	48 8b 95 60 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xa0]
    14ad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    14b1:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
    for (int i = 0; i < ehdr.e_shnum; i++) {
    14b5:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
    14bc:	eb 3e                	jmp    14fc <load_elfso_old+0x351>
        if (shdr[i].sh_type == SHT_DYNAMIC) {
    14be:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    14c1:	48 98                	cdqe   
    14c3:	48 c1 e0 06          	shl    rax,0x6
    14c7:	48 89 c2             	mov    rdx,rax
    14ca:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    14d1:	48 01 d0             	add    rax,rdx
    14d4:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    14d7:	83 f8 06             	cmp    eax,0x6
    14da:	75 1c                	jne    14f8 <load_elfso_old+0x34d>
            dynamic = shdr + i;
    14dc:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    14df:	48 98                	cdqe   
    14e1:	48 c1 e0 06          	shl    rax,0x6
    14e5:	48 89 c2             	mov    rdx,rax
    14e8:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    14ef:	48 01 d0             	add    rax,rdx
    14f2:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            break;
    14f6:	eb 13                	jmp    150b <load_elfso_old+0x360>
    for (int i = 0; i < ehdr.e_shnum; i++) {
    14f8:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
    14fc:	0f b7 85 1c ff ff ff 	movzx  eax,WORD PTR [rbp-0xe4]
    1503:	0f b7 c0             	movzx  eax,ax
    1506:	39 45 c4             	cmp    DWORD PTR [rbp-0x3c],eax
    1509:	7c b3                	jl     14be <load_elfso_old+0x313>
        }
    }
    if (!dynamic)
        ;
    char*  dynstr = 0;
    150b:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
    1512:	00 
    off_t* got    = 0;
    1513:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
    151a:	00 00 00 00 
    //这里一堆获取函数之后实现细节
    // dynstr=so_get_dynstr(dyn);
    // so_get_dynstr从so中获取.dynstr节
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    151e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    1522:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
    1526:	eb 2a                	jmp    1552 <load_elfso_old+0x3a7>
        if (p->d_tag == DT_STRTAB) {
    1528:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    152c:	48 8b 00             	mov    rax,QWORD PTR [rax]
    152f:	48 83 f8 05          	cmp    rax,0x5
    1533:	75 18                	jne    154d <load_elfso_old+0x3a2>
            dynstr = p->d_un.d_ptr + offset;
    1535:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    1539:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    153d:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    1544:	48 01 d0             	add    rax,rdx
    1547:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
            break;
    154b:	eb 11                	jmp    155e <load_elfso_old+0x3b3>
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    154d:	48 83 45 b0 10       	add    QWORD PTR [rbp-0x50],0x10
    1552:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    1556:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1559:	48 85 c0             	test   rax,rax
    155c:	75 ca                	jne    1528 <load_elfso_old+0x37d>
        }
    }

    size_t relsz = 0, relentsz = 0;
    155e:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
    1565:	00 
    1566:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    156d:	00 
    off_t  relptr = 0;
    156e:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    1575:	00 
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    1576:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    157a:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    157e:	e9 1d 02 00 00       	jmp    17a0 <load_elfso_old+0x5f5>
        switch (p->d_tag) {
    1583:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1587:	48 8b 00             	mov    rax,QWORD PTR [rax]
    158a:	48 83 f8 1b          	cmp    rax,0x1b
    158e:	0f 87 4d 01 00 00    	ja     16e1 <load_elfso_old+0x536>
    1594:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    159b:	00 
    159c:	48 8d 05 5d 2a 00 00 	lea    rax,[rip+0x2a5d]        # 4000 <chkmmap+0x4c0>
    15a3:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    15a6:	48 98                	cdqe   
    15a8:	48 8d 15 51 2a 00 00 	lea    rdx,[rip+0x2a51]        # 4000 <chkmmap+0x4c0>
    15af:	48 01 d0             	add    rax,rdx
    15b2:	3e ff e0             	notrack jmp rax
        case DT_NEEDED:
            char* pathname = p->d_un.d_val + dynstr;
    15b5:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    15b9:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    15bd:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    15c1:	48 01 d0             	add    rax,rdx
    15c4:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
            int   so_fno   = open(pathname, O_EXEC);
    15cb:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
    15d2:	be 00 10 00 00       	mov    esi,0x1000
    15d7:	48 89 c7             	mov    rdi,rax
    15da:	e8 f1 fa ff ff       	call   10d0 <open@plt>
    15df:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
            //不查错了
            load_elfso(open(pathname, O_EXEC));
    15e5:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
    15ec:	be 00 10 00 00       	mov    esi,0x1000
    15f1:	48 89 c7             	mov    rdi,rax
    15f4:	e8 d7 fa ff ff       	call   10d0 <open@plt>
    15f9:	89 c7                	mov    edi,eax
    15fb:	e8 b0 fa ff ff       	call   10b0 <load_elfso@plt>
            close(so_fno);
    1600:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
    1606:	89 c7                	mov    edi,eax
    1608:	e8 d3 fa ff ff       	call   10e0 <close@plt>

            break;
    160d:	e9 d0 00 00 00       	jmp    16e2 <load_elfso_old+0x537>
        case DT_PLTGOT:
            got = p->d_un.d_ptr + offset;
    1612:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1616:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    161a:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    1621:	48 01 d0             	add    rax,rdx
    1624:	48 89 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rax

            //赋值为dl的运行时重定位函数
            got[2] = dl_runtime_resolve;
    162b:	48 8b 85 58 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa8]
    1632:	48 83 c0 10          	add    rax,0x10
    1636:	48 8d 15 6d 10 00 00 	lea    rdx,[rip+0x106d]        # 26aa <dl_runtime_resolve>
    163d:	48 89 10             	mov    QWORD PTR [rax],rdx
            //填入模块id
            got[1]     = mod - modules;
    1640:	48 8b 05 91 49 00 00 	mov    rax,QWORD PTR [rip+0x4991]        # 5fd8 <modules-0x1c8>
    1647:	48 89 c2             	mov    rdx,rax
    164a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    164e:	48 29 d0             	sub    rax,rdx
    1651:	48 c1 f8 05          	sar    rax,0x5
    1655:	48 89 c2             	mov    rdx,rax
    1658:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
    165f:	aa aa aa 
    1662:	48 0f af c2          	imul   rax,rdx
    1666:	48 89 c2             	mov    rdx,rax
    1669:	48 8b 85 58 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa8]
    1670:	48 83 c0 08          	add    rax,0x8
    1674:	48 89 10             	mov    QWORD PTR [rax],rdx
            mod->p_got = got;
    1677:	48 8b 95 58 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xa8]
    167e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1682:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
        case DT_SYMTAB: mod->p_symbol = p->d_un.d_ptr; break;
    1686:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    168a:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    168e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1692:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    1696:	eb 4a                	jmp    16e2 <load_elfso_old+0x537>
        case DT_RELSZ:
        case DT_RELASZ: relsz = p->d_un.d_val; goto is_rel_prepared;
    1698:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    169c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    16a0:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    16a4:	eb 41                	jmp    16e7 <load_elfso_old+0x53c>
        case DT_REL:
        case DT_RELA: relptr = p->d_un.d_ptr; goto is_rel_prepared;
    16a6:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    16aa:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    16ae:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    16b2:	eb 33                	jmp    16e7 <load_elfso_old+0x53c>
        case DT_RELENT:
        case DT_RELAENT: relentsz = p->d_un.d_val; goto is_rel_prepared;
    16b4:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    16b8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    16bc:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
    16c0:	eb 25                	jmp    16e7 <load_elfso_old+0x53c>
        case DT_INIT_ARRAY: init = p->d_un.d_ptr; break;
    16c2:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    16c6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    16ca:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    16ce:	eb 12                	jmp    16e2 <load_elfso_old+0x537>
        case DT_INIT_ARRAYSZ: init_arraysz = p->d_un.d_val / 8; break;
    16d0:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    16d4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    16d8:	48 c1 e8 03          	shr    rax,0x3
    16dc:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    16df:	eb 01                	jmp    16e2 <load_elfso_old+0x537>
        default: break;
    16e1:	90                   	nop
        }
        continue;
    16e2:	e9 b4 00 00 00       	jmp    179b <load_elfso_old+0x5f0>
    is_rel_prepared:
        if (!(relsz && relentsz && relptr))
    16e7:	48 83 7d a8 00       	cmp    QWORD PTR [rbp-0x58],0x0
    16ec:	0f 84 a8 00 00 00    	je     179a <load_elfso_old+0x5ef>
    16f2:	48 83 7d a0 00       	cmp    QWORD PTR [rbp-0x60],0x0
    16f7:	0f 84 9d 00 00 00    	je     179a <load_elfso_old+0x5ef>
    16fd:	48 83 7d 98 00       	cmp    QWORD PTR [rbp-0x68],0x0
    1702:	0f 84 92 00 00 00    	je     179a <load_elfso_old+0x5ef>
            continue;
        for (int j = 0; j < relsz / relentsz; j++) {
    1708:	c7 45 8c 00 00 00 00 	mov    DWORD PTR [rbp-0x74],0x0
    170f:	eb 57                	jmp    1768 <load_elfso_old+0x5bd>
            fill_reloc(relptr + j * relentsz, mod - modules, shdr, 0);
    1711:	48 8b 05 c0 48 00 00 	mov    rax,QWORD PTR [rip+0x48c0]        # 5fd8 <modules-0x1c8>
    1718:	48 89 c2             	mov    rdx,rax
    171b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    171f:	48 29 d0             	sub    rax,rdx
    1722:	48 c1 f8 05          	sar    rax,0x5
    1726:	48 89 c2             	mov    rdx,rax
    1729:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
    1730:	aa aa aa 
    1733:	48 0f af c2          	imul   rax,rdx
    1737:	89 c6                	mov    esi,eax
    1739:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    173c:	48 98                	cdqe   
    173e:	48 0f af 45 a0       	imul   rax,QWORD PTR [rbp-0x60]
    1743:	48 89 c2             	mov    rdx,rax
    1746:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
    174a:	48 01 d0             	add    rax,rdx
    174d:	48 89 c7             	mov    rdi,rax
    1750:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    1757:	b9 00 00 00 00       	mov    ecx,0x0
    175c:	48 89 c2             	mov    rdx,rax
    175f:	e8 dc f8 ff ff       	call   1040 <fill_reloc@plt>
        for (int j = 0; j < relsz / relentsz; j++) {
    1764:	83 45 8c 01          	add    DWORD PTR [rbp-0x74],0x1
    1768:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    176b:	48 63 c8             	movsxd rcx,eax
    176e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
    1772:	ba 00 00 00 00       	mov    edx,0x0
    1777:	48 f7 75 a0          	div    QWORD PTR [rbp-0x60]
    177b:	48 39 c1             	cmp    rcx,rax
    177e:	72 91                	jb     1711 <load_elfso_old+0x566>
        }
        relsz = relentsz = relptr = 0;
    1780:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    1787:	00 
    1788:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    178f:	00 
    1790:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    1794:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    1798:	eb 01                	jmp    179b <load_elfso_old+0x5f0>
            continue;
    179a:	90                   	nop
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    179b:	48 83 45 90 10       	add    QWORD PTR [rbp-0x70],0x10
    17a0:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    17a4:	48 8b 00             	mov    rax,QWORD PTR [rax]
    17a7:	48 85 c0             	test   rax,rax
    17aa:	0f 85 d3 fd ff ff    	jne    1583 <load_elfso_old+0x3d8>
    }
    if (init) {
    17b0:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
    17b5:	74 33                	je     17ea <load_elfso_old+0x63f>
        //调用模块入口函数
        for (int i = 0; i < init_arraysz; i++) {
    17b7:	c7 45 88 00 00 00 00 	mov    DWORD PTR [rbp-0x78],0x0
    17be:	eb 22                	jmp    17e2 <load_elfso_old+0x637>
            (init[i])();
    17c0:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    17c3:	48 98                	cdqe   
    17c5:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
    17cc:	00 
    17cd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    17d1:	48 01 d0             	add    rax,rdx
    17d4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    17d7:	b8 00 00 00 00       	mov    eax,0x0
    17dc:	ff d2                	call   rdx
        for (int i = 0; i < init_arraysz; i++) {
    17de:	83 45 88 01          	add    DWORD PTR [rbp-0x78],0x1
    17e2:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    17e5:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
    17e8:	7c d6                	jl     17c0 <load_elfso_old+0x615>
        }
    }
    free(&ehdr);
    17ea:	48 8d 85 e0 fe ff ff 	lea    rax,[rbp-0x120]
    17f1:	48 89 c7             	mov    rdi,rax
    17f4:	e8 f7 f8 ff ff       	call   10f0 <free@plt>
    return 0;
    17f9:	b8 00 00 00 00       	mov    eax,0x0
}
    17fe:	c9                   	leave  
    17ff:	c3                   	ret    

0000000000001800 <load_elfso>:
Elf64_Ehdr ehdr;
//切换进程前,在execve系统调用中
int load_elfso(int fildes)
{
    1800:	f3 0f 1e fa          	endbr64 
    1804:	55                   	push   rbp
    1805:	48 89 e5             	mov    rbp,rsp
    1808:	48 81 ec 70 02 00 00 	sub    rsp,0x270
    180f:	89 bd 9c fd ff ff    	mov    DWORD PTR [rbp-0x264],edi
    extern int chkmmap(off_t, size_t);
    extern int seek(int, off_t, int);
    read(fildes, &ehdr, sizeof(ehdr));
    1815:	8b 85 9c fd ff ff    	mov    eax,DWORD PTR [rbp-0x264]
    181b:	ba 40 00 00 00       	mov    edx,0x40
    1820:	48 8b 0d c9 47 00 00 	mov    rcx,QWORD PTR [rip+0x47c9]        # 5ff0 <ehdr-0x31d0>
    1827:	48 89 ce             	mov    rsi,rcx
    182a:	89 c7                	mov    edi,eax
    182c:	e8 2f f8 ff ff       	call   1060 <read@plt>
    off_t          entry = ehdr.e_entry;
    1831:	48 8b 05 b8 47 00 00 	mov    rax,QWORD PTR [rip+0x47b8]        # 5ff0 <ehdr-0x31d0>
    1838:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
    183c:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
    unsigned short entn  = ehdr.e_phnum;
    1843:	48 8b 05 a6 47 00 00 	mov    rax,QWORD PTR [rip+0x47a6]        # 5ff0 <ehdr-0x31d0>
    184a:	0f b7 40 38          	movzx  eax,WORD PTR [rax+0x38]
    184e:	66 89 85 0e ff ff ff 	mov    WORD PTR [rbp-0xf2],ax
    unsigned short ents  = ehdr.e_phentsize;
    1855:	48 8b 05 94 47 00 00 	mov    rax,QWORD PTR [rip+0x4794]        # 5ff0 <ehdr-0x31d0>
    185c:	0f b7 40 36          	movzx  eax,WORD PTR [rax+0x36]
    1860:	66 89 85 0c ff ff ff 	mov    WORD PTR [rbp-0xf4],ax
    off_t          shla  = malloc(ehdr.e_shnum * ehdr.e_shentsize);
    1867:	48 8b 05 82 47 00 00 	mov    rax,QWORD PTR [rip+0x4782]        # 5ff0 <ehdr-0x31d0>
    186e:	0f b7 40 3c          	movzx  eax,WORD PTR [rax+0x3c]
    1872:	0f b7 d0             	movzx  edx,ax
    1875:	48 8b 05 74 47 00 00 	mov    rax,QWORD PTR [rip+0x4774]        # 5ff0 <ehdr-0x31d0>
    187c:	0f b7 40 3a          	movzx  eax,WORD PTR [rax+0x3a]
    1880:	0f b7 c0             	movzx  eax,ax
    1883:	0f af c2             	imul   eax,edx
    1886:	48 98                	cdqe   
    1888:	48 89 c7             	mov    rdi,rax
    188b:	e8 a0 f7 ff ff       	call   1030 <malloc@plt>
    1890:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
    seek(fildes, ehdr.e_shoff, SEEK_SET);
    1897:	48 8b 05 52 47 00 00 	mov    rax,QWORD PTR [rip+0x4752]        # 5ff0 <ehdr-0x31d0>
    189e:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
    18a2:	8b 85 9c fd ff ff    	mov    eax,DWORD PTR [rbp-0x264]
    18a8:	ba 00 00 00 00       	mov    edx,0x0
    18ad:	48 89 ce             	mov    rsi,rcx
    18b0:	89 c7                	mov    edi,eax
    18b2:	e8 d9 f7 ff ff       	call   1090 <seek@plt>
    read(fildes, shla, ehdr.e_shnum * ehdr.e_shentsize);
    18b7:	48 8b 05 32 47 00 00 	mov    rax,QWORD PTR [rip+0x4732]        # 5ff0 <ehdr-0x31d0>
    18be:	0f b7 40 3c          	movzx  eax,WORD PTR [rax+0x3c]
    18c2:	0f b7 d0             	movzx  edx,ax
    18c5:	48 8b 05 24 47 00 00 	mov    rax,QWORD PTR [rip+0x4724]        # 5ff0 <ehdr-0x31d0>
    18cc:	0f b7 40 3a          	movzx  eax,WORD PTR [rax+0x3a]
    18d0:	0f b7 c0             	movzx  eax,ax
    18d3:	0f af c2             	imul   eax,edx
    18d6:	48 63 d0             	movsxd rdx,eax
    18d9:	48 8b 8d 00 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x100]
    18e0:	8b 85 9c fd ff ff    	mov    eax,DWORD PTR [rbp-0x264]
    18e6:	48 89 ce             	mov    rsi,rcx
    18e9:	89 c7                	mov    edi,eax
    18eb:	e8 70 f7 ff ff       	call   1060 <read@plt>

    struct Elf64_Shdr* sh = (struct Elf64_Shdr*)(shla);
    18f0:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
    18f7:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
    Elf64_Phdr*        ph = malloc(entn * ents);
    18fe:	0f b7 95 0e ff ff ff 	movzx  edx,WORD PTR [rbp-0xf2]
    1905:	0f b7 85 0c ff ff ff 	movzx  eax,WORD PTR [rbp-0xf4]
    190c:	0f af c2             	imul   eax,edx
    190f:	48 98                	cdqe   
    1911:	48 89 c7             	mov    rdi,rax
    1914:	e8 17 f7 ff ff       	call   1030 <malloc@plt>
    1919:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    seek(fildes, ehdr.e_phoff, SEEK_SET);
    191d:	48 8b 05 cc 46 00 00 	mov    rax,QWORD PTR [rip+0x46cc]        # 5ff0 <ehdr-0x31d0>
    1924:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
    1928:	8b 85 9c fd ff ff    	mov    eax,DWORD PTR [rbp-0x264]
    192e:	ba 00 00 00 00       	mov    edx,0x0
    1933:	48 89 ce             	mov    rsi,rcx
    1936:	89 c7                	mov    edi,eax
    1938:	e8 53 f7 ff ff       	call   1090 <seek@plt>
    read(fildes, ph, entn * ents);
    193d:	0f b7 95 0e ff ff ff 	movzx  edx,WORD PTR [rbp-0xf2]
    1944:	0f b7 85 0c ff ff ff 	movzx  eax,WORD PTR [rbp-0xf4]
    194b:	0f af c2             	imul   eax,edx
    194e:	48 63 d0             	movsxd rdx,eax
    1951:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
    1955:	8b 85 9c fd ff ff    	mov    eax,DWORD PTR [rbp-0x264]
    195b:	48 89 ce             	mov    rsi,rcx
    195e:	89 c7                	mov    edi,eax
    1960:	e8 fb f6 ff ff       	call   1060 <read@plt>
    size_t tot_sz = 0;
    1965:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
    196c:	00 
    off_t  base = ph->p_vaddr, offset = 0;
    196d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1971:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    1975:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    1979:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    1980:	00 
    int    reloc_flag = 0;
    1981:	c7 85 f4 fe ff ff 00 	mov    DWORD PTR [rbp-0x10c],0x0
    1988:	00 00 00 
    //判断是否为DYN
    if (ehdr.e_type == ET_DYN) {
    198b:	48 8b 05 5e 46 00 00 	mov    rax,QWORD PTR [rip+0x465e]        # 5ff0 <ehdr-0x31d0>
    1992:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
    1996:	66 83 f8 03          	cmp    ax,0x3
    199a:	0f 85 28 01 00 00    	jne    1ac8 <load_elfso+0x2c8>
        reloc_flag = 1;
    19a0:	c7 85 f4 fe ff ff 01 	mov    DWORD PTR [rbp-0x10c],0x1
    19a7:	00 00 00 
        for (int i = 0; i < ehdr.e_phnum; i++) {
    19aa:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
    19b1:	eb 78                	jmp    1a2b <load_elfso+0x22b>
            tot_sz += ph[i].p_memsz;
    19b3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    19b6:	48 63 d0             	movsxd rdx,eax
    19b9:	48 89 d0             	mov    rax,rdx
    19bc:	48 c1 e0 03          	shl    rax,0x3
    19c0:	48 29 d0             	sub    rax,rdx
    19c3:	48 c1 e0 03          	shl    rax,0x3
    19c7:	48 89 c2             	mov    rdx,rax
    19ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    19ce:	48 01 d0             	add    rax,rdx
    19d1:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    19d5:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
            if (ph[i].p_vaddr < base)
    19d9:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    19dc:	48 63 d0             	movsxd rdx,eax
    19df:	48 89 d0             	mov    rax,rdx
    19e2:	48 c1 e0 03          	shl    rax,0x3
    19e6:	48 29 d0             	sub    rax,rdx
    19e9:	48 c1 e0 03          	shl    rax,0x3
    19ed:	48 89 c2             	mov    rdx,rax
    19f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    19f4:	48 01 d0             	add    rax,rdx
    19f7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    19fb:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
    19ff:	76 26                	jbe    1a27 <load_elfso+0x227>
                base = ph[i].p_vaddr;
    1a01:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    1a04:	48 63 d0             	movsxd rdx,eax
    1a07:	48 89 d0             	mov    rax,rdx
    1a0a:	48 c1 e0 03          	shl    rax,0x3
    1a0e:	48 29 d0             	sub    rax,rdx
    1a11:	48 c1 e0 03          	shl    rax,0x3
    1a15:	48 89 c2             	mov    rdx,rax
    1a18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1a1c:	48 01 d0             	add    rax,rdx
    1a1f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    1a23:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for (int i = 0; i < ehdr.e_phnum; i++) {
    1a27:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
    1a2b:	48 8b 05 be 45 00 00 	mov    rax,QWORD PTR [rip+0x45be]        # 5ff0 <ehdr-0x31d0>
    1a32:	0f b7 40 38          	movzx  eax,WORD PTR [rax+0x38]
    1a36:	0f b7 c0             	movzx  eax,ax
    1a39:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
    1a3c:	0f 8c 71 ff ff ff    	jl     19b3 <load_elfso+0x1b3>
        }
        /*
        似乎有的系统支持单个段的重定位。但是这样在有些重定位方式下，尤其是跨段的相对地址调用来说，这会带来大难度，
        所以这里先整体移动。*/
        if (!chkmmap(base, tot_sz)) {
    1a42:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
    1a46:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1a4a:	48 89 d6             	mov    rsi,rdx
    1a4d:	48 89 c7             	mov    rdi,rax
    1a50:	e8 6b f6 ff ff       	call   10c0 <chkmmap@plt>
    1a55:	85 c0                	test   eax,eax
    1a57:	75 6f                	jne    1ac8 <load_elfso+0x2c8>
            //原来的地方已经被映射
            //需要重定位
            //找到另一块大小符合的连续虚拟内存，然后返回首地址（不映射，下面手动映射）
            reloc_flag     = 2;
    1a59:	c7 85 f4 fe ff ff 02 	mov    DWORD PTR [rbp-0x10c],0x2
    1a60:	00 00 00 
            off_t new_base = base + 4096;
    1a63:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1a67:	48 05 00 10 00 00    	add    rax,0x1000
    1a6d:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            while (!chkmmap(new_base, tot_sz) && new_base < KNL_BASE) {
    1a71:	eb 08                	jmp    1a7b <load_elfso+0x27b>
                new_base += 4096;
    1a73:	48 81 45 d0 00 10 00 	add    QWORD PTR [rbp-0x30],0x1000
    1a7a:	00 
            while (!chkmmap(new_base, tot_sz) && new_base < KNL_BASE) {
    1a7b:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
    1a7f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    1a83:	48 89 d6             	mov    rsi,rdx
    1a86:	48 89 c7             	mov    rdi,rax
    1a89:	e8 32 f6 ff ff       	call   10c0 <chkmmap@plt>
    1a8e:	85 c0                	test   eax,eax
    1a90:	75 10                	jne    1aa2 <load_elfso+0x2a2>
    1a92:	48 b8 ff ff ff ff ff 	movabs rax,0xffff7fffffffffff
    1a99:	7f ff ff 
    1a9c:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
    1aa0:	76 d1                	jbe    1a73 <load_elfso+0x273>
            }
            if (new_base >= KNL_BASE) {
    1aa2:	48 b8 ff ff ff ff ff 	movabs rax,0xffff7fffffffffff
    1aa9:	7f ff ff 
    1aac:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
    1ab0:	76 0a                	jbe    1abc <load_elfso+0x2bc>
                return -ENOMEM;
    1ab2:	b8 cf ff ff ff       	mov    eax,0xffffffcf
    1ab7:	e9 66 08 00 00       	jmp    2322 <load_elfso+0xb22>
            }
            offset = new_base - base;
    1abc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    1ac0:	48 2b 45 e8          	sub    rax,QWORD PTR [rbp-0x18]
    1ac4:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        }
    }


    module* mod      = 0;
    1ac8:	48 c7 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],0x0
    1acf:	00 00 00 00 
    int     elfid    = reg_module();
    1ad3:	b8 00 00 00 00       	mov    eax,0x0
    1ad8:	e8 a0 0e 00 00       	call   297d <reg_module>
    1add:	89 85 e4 fe ff ff    	mov    DWORD PTR [rbp-0x11c],eax
    mod              = modules + elfid;
    1ae3:	8b 85 e4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x11c]
    1ae9:	48 63 d0             	movsxd rdx,eax
    1aec:	48 89 d0             	mov    rax,rdx
    1aef:	48 01 c0             	add    rax,rax
    1af2:	48 01 d0             	add    rax,rdx
    1af5:	48 c1 e0 05          	shl    rax,0x5
    1af9:	48 89 c2             	mov    rdx,rax
    1afc:	48 8b 05 d5 44 00 00 	mov    rax,QWORD PTR [rip+0x44d5]        # 5fd8 <modules-0x1c8>
    1b03:	48 01 d0             	add    rax,rdx
    1b06:	48 89 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rax
    mod->load_offset = offset;
    1b0d:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1b14:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    1b18:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    mod->base        = base;
    1b1c:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1b23:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    1b27:	48 89 10             	mov    QWORD PTR [rax],rdx
    //找dynamic段
    struct Elf64_Shdr* dynamic = 0;
    1b2a:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
    1b31:	00 
    off_t*             got     = 0;
    1b32:	48 c7 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],0x0
    1b39:	00 00 00 00 

    for (int i = 0; i < ehdr.e_shnum; i++) {
    1b3d:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
    1b44:	e9 83 00 00 00       	jmp    1bcc <load_elfso+0x3cc>
        if (sh[i].sh_type == SHT_DYNSYM) {
    1b49:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    1b4c:	48 98                	cdqe   
    1b4e:	48 c1 e0 06          	shl    rax,0x6
    1b52:	48 89 c2             	mov    rdx,rax
    1b55:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
    1b5c:	48 01 d0             	add    rax,rdx
    1b5f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1b62:	83 f8 0b             	cmp    eax,0xb
    1b65:	75 27                	jne    1b8e <load_elfso+0x38e>
            mod->s_symtabsz = sh[i].sh_size;
    1b67:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    1b6a:	48 98                	cdqe   
    1b6c:	48 c1 e0 06          	shl    rax,0x6
    1b70:	48 89 c2             	mov    rdx,rax
    1b73:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
    1b7a:	48 01 d0             	add    rax,rdx
    1b7d:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
    1b81:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1b88:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    1b8c:	eb 3a                	jmp    1bc8 <load_elfso+0x3c8>
        }
        else if (sh[i].sh_type == SHT_DYNAMIC) {
    1b8e:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    1b91:	48 98                	cdqe   
    1b93:	48 c1 e0 06          	shl    rax,0x6
    1b97:	48 89 c2             	mov    rdx,rax
    1b9a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
    1ba1:	48 01 d0             	add    rax,rdx
    1ba4:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1ba7:	83 f8 06             	cmp    eax,0x6
    1baa:	75 1c                	jne    1bc8 <load_elfso+0x3c8>
            dynamic = sh + i;
    1bac:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    1baf:	48 98                	cdqe   
    1bb1:	48 c1 e0 06          	shl    rax,0x6
    1bb5:	48 89 c2             	mov    rdx,rax
    1bb8:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
    1bbf:	48 01 d0             	add    rax,rdx
    1bc2:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            break;
    1bc6:	eb 1b                	jmp    1be3 <load_elfso+0x3e3>
    for (int i = 0; i < ehdr.e_shnum; i++) {
    1bc8:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
    1bcc:	48 8b 05 1d 44 00 00 	mov    rax,QWORD PTR [rip+0x441d]        # 5ff0 <ehdr-0x31d0>
    1bd3:	0f b7 40 3c          	movzx  eax,WORD PTR [rax+0x3c]
    1bd7:	0f b7 c0             	movzx  eax,ax
    1bda:	39 45 c4             	cmp    DWORD PTR [rbp-0x3c],eax
    1bdd:	0f 8c 66 ff ff ff    	jl     1b49 <load_elfso+0x349>
        }
    }
    //程序占用的最高地址，这里就是堆开始分配的地方
    off_t max_allocated = 0;
    1be3:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
    1bea:	00 
    for (int i = 0; i < entn; i++) {
    1beb:	c7 45 b4 00 00 00 00 	mov    DWORD PTR [rbp-0x4c],0x0
    1bf2:	e9 12 01 00 00       	jmp    1d09 <load_elfso+0x509>
        //加载段
        if (ph->p_type == PT_LOAD) {
    1bf7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1bfb:	8b 00                	mov    eax,DWORD PTR [rax]
    1bfd:	83 f8 01             	cmp    eax,0x1
    1c00:	0f 85 fa 00 00 00    	jne    1d00 <load_elfso+0x500>
            unsigned long off  = ph->p_offset;
    1c06:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c0a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1c0e:	48 89 85 b8 fe ff ff 	mov    QWORD PTR [rbp-0x148],rax
            unsigned long fs   = ph->p_filesz;
    1c15:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c19:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    1c1d:	48 89 85 b0 fe ff ff 	mov    QWORD PTR [rbp-0x150],rax
            size_t        ms   = ph->p_memsz;
    1c24:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c28:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    1c2c:	48 89 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],rax
            char*         vptr = (char*)ph->p_vaddr + offset;
    1c33:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c37:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    1c3b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1c3f:	48 01 d0             	add    rax,rdx
    1c42:	48 89 85 a0 fe ff ff 	mov    QWORD PTR [rbp-0x160],rax
            if (max_allocated < vptr + ms)
    1c49:	48 8b 95 a0 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x160]
    1c50:	48 8b 85 a8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x158]
    1c57:	48 01 c2             	add    rdx,rax
    1c5a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    1c5e:	48 39 c2             	cmp    rdx,rax
    1c61:	76 15                	jbe    1c78 <load_elfso+0x478>
                max_allocated = vptr + ms;
    1c63:	48 8b 95 a0 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x160]
    1c6a:	48 8b 85 a8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x158]
    1c71:	48 01 d0             	add    rax,rdx
    1c74:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
            if (off == 0) {
    1c78:	48 83 bd b8 fe ff ff 	cmp    QWORD PTR [rbp-0x148],0x0
    1c7f:	00 
    1c80:	75 12                	jne    1c94 <load_elfso+0x494>
                mod->header = vptr;
    1c82:	48 8b 95 a0 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x160]
    1c89:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1c90:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
            }
            //先映射好内存，访问时再分配内存
            int attr = PROT_READ;
    1c94:	c7 45 b0 01 00 00 00 	mov    DWORD PTR [rbp-0x50],0x1
            if ((ph->p_flags & PF_W))
    1c9b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c9f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1ca2:	83 e0 02             	and    eax,0x2
    1ca5:	85 c0                	test   eax,eax
    1ca7:	74 04                	je     1cad <load_elfso+0x4ad>
                attr |= PROT_WRITE;
    1ca9:	83 4d b0 02          	or     DWORD PTR [rbp-0x50],0x2
            if ((ph->p_flags & PF_X)) {
    1cad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1cb1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1cb4:	83 e0 01             	and    eax,0x1
    1cb7:	85 c0                	test   eax,eax
    1cb9:	74 04                	je     1cbf <load_elfso+0x4bf>
                attr |= PROT_EXEC;
    1cbb:	83 4d b0 04          	or     DWORD PTR [rbp-0x50],0x4
            }
            if (mmap(vptr, ms, attr, MAP_FIXED | MAP_PRIVATE, fildes, off) == -1)
    1cbf:	48 8b bd b8 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x148]
    1cc6:	8b 8d 9c fd ff ff    	mov    ecx,DWORD PTR [rbp-0x264]
    1ccc:	8b 55 b0             	mov    edx,DWORD PTR [rbp-0x50]
    1ccf:	48 8b b5 a8 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x158]
    1cd6:	48 8b 85 a0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x160]
    1cdd:	49 89 f9             	mov    r9,rdi
    1ce0:	41 89 c8             	mov    r8d,ecx
    1ce3:	b9 03 00 00 00       	mov    ecx,0x3
    1ce8:	48 89 c7             	mov    rdi,rax
    1ceb:	e8 60 f3 ff ff       	call   1050 <mmap@plt>
    1cf0:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
    1cf4:	75 0a                	jne    1d00 <load_elfso+0x500>
                return -1;   //加载失败
    1cf6:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1cfb:	e9 22 06 00 00       	jmp    2322 <load_elfso+0xb22>
        }
        ph++;
    1d00:	48 83 45 f8 38       	add    QWORD PTR [rbp-0x8],0x38
    for (int i = 0; i < entn; i++) {
    1d05:	83 45 b4 01          	add    DWORD PTR [rbp-0x4c],0x1
    1d09:	0f b7 85 0e ff ff ff 	movzx  eax,WORD PTR [rbp-0xf2]
    1d10:	39 45 b4             	cmp    DWORD PTR [rbp-0x4c],eax
    1d13:	0f 8c de fe ff ff    	jl     1bf7 <load_elfso+0x3f7>
    }
    if (dynamic) {
    1d19:	48 83 7d c8 00       	cmp    QWORD PTR [rbp-0x38],0x0
    1d1e:	0f 84 f7 05 00 00    	je     231b <load_elfso+0xb1b>
        void*      needed_nameoff[32];
        int        t_needed = 0;
    1d24:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
        char*      dynstr   = 0;
    1d2b:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    1d32:	00 
        Elf64_Dyn* dyn      = dynamic->sh_addr + offset;
    1d33:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    1d37:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    1d3b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1d3f:	48 01 d0             	add    rax,rdx
    1d42:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
        size_t     relsz = 0, relentsz = 0;
    1d49:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    1d50:	00 
    1d51:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
    1d58:	00 
        size_t     relasz = 0, relaentsz = 0;
    1d59:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
    1d60:	00 
    1d61:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
    1d68:	00 
        size_t     jmprelsz = 0, jmprelaentsz = 0;
    1d69:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
    1d70:	00 00 00 00 
    1d74:	48 c7 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],0x0
    1d7b:	00 00 00 00 
        off_t      relptr = 0, relaptr = 0, jmprelptr = 0;
    1d7f:	48 c7 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],0x0
    1d86:	00 00 00 00 
    1d8a:	48 c7 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],0x0
    1d91:	00 00 00 00 
    1d95:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
    1d9c:	00 00 00 00 
        int        pltrel = 0, bind_now = 0;
    1da0:	c7 85 54 ff ff ff 00 	mov    DWORD PTR [rbp-0xac],0x0
    1da7:	00 00 00 
    1daa:	c7 85 50 ff ff ff 00 	mov    DWORD PTR [rbp-0xb0],0x0
    1db1:	00 00 00 
        int (*init)()     = 0;
    1db4:	48 c7 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],0x0
    1dbb:	00 00 00 00 
        size_t init_arrsz = 0;
    1dbf:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x0
    1dc6:	00 00 00 00 
        mod->p_dynamic    = dynamic;
    1dca:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    1dce:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1dd5:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
        //这里一堆获取函数之后实现细节
        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    1dd9:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
    1de0:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
    1de7:	eb 3f                	jmp    1e28 <load_elfso+0x628>
            if (p->d_tag == DT_STRTAB) {
    1de9:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
    1df0:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1df3:	48 83 f8 05          	cmp    rax,0x5
    1df7:	75 27                	jne    1e20 <load_elfso+0x620>
                dynstr        = p->d_un.d_ptr + offset;
    1df9:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
    1e00:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1e04:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1e08:	48 01 d0             	add    rax,rdx
    1e0b:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
                mod->p_strtab = dynstr;
    1e0f:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
    1e13:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1e1a:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
                break;
    1e1e:	eb 17                	jmp    1e37 <load_elfso+0x637>
        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    1e20:	48 83 85 38 ff ff ff 	add    QWORD PTR [rbp-0xc8],0x10
    1e27:	10 
    1e28:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
    1e2f:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1e32:	48 85 c0             	test   rax,rax
    1e35:	75 b2                	jne    1de9 <load_elfso+0x5e9>
            }
        }
        if (!dynstr) {
    1e37:	48 83 7d a0 00       	cmp    QWORD PTR [rbp-0x60],0x0
    1e3c:	75 0a                	jne    1e48 <load_elfso+0x648>
            return -1;
    1e3e:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1e43:	e9 da 04 00 00       	jmp    2322 <load_elfso+0xb22>
        }

        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    1e48:	48 8b 85 d0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x130]
    1e4f:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
    1e56:	e9 f0 01 00 00       	jmp    204b <load_elfso+0x84b>
            switch (p->d_tag) {
    1e5b:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1e62:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1e65:	48 83 f8 1b          	cmp    rax,0x1b
    1e69:	0f 87 d3 01 00 00    	ja     2042 <load_elfso+0x842>
    1e6f:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    1e76:	00 
    1e77:	48 8d 05 f2 21 00 00 	lea    rax,[rip+0x21f2]        # 4070 <chkmmap+0x530>
    1e7e:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    1e81:	48 98                	cdqe   
    1e83:	48 8d 15 e6 21 00 00 	lea    rdx,[rip+0x21e6]        # 4070 <chkmmap+0x530>
    1e8a:	48 01 d0             	add    rax,rdx
    1e8d:	3e ff e0             	notrack jmp rax
            case DT_NEEDED:
                //不查错了
                needed_nameoff[t_needed++] = p->d_un.d_val + dynstr;
    1e90:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1e97:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
    1e9b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
    1e9e:	8d 50 01             	lea    edx,[rax+0x1]
    1ea1:	89 55 ac             	mov    DWORD PTR [rbp-0x54],edx
    1ea4:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
    1ea8:	48 01 ca             	add    rdx,rcx
    1eab:	48 98                	cdqe   
    1ead:	48 89 94 c5 a0 fd ff 	mov    QWORD PTR [rbp+rax*8-0x260],rdx
    1eb4:	ff 
                break;
    1eb5:	e9 89 01 00 00       	jmp    2043 <load_elfso+0x843>
            case DT_PLTGOT:
                got = p->d_un.d_ptr + offset;
    1eba:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1ec1:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1ec5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1ec9:	48 01 d0             	add    rax,rdx
    1ecc:	48 89 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rax

                //赋值为dl的运行时重定位函数
                got[2] = dl_runtime_resolve;
    1ed3:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1eda:	48 83 c0 10          	add    rax,0x10
    1ede:	48 8d 15 c5 07 00 00 	lea    rdx,[rip+0x7c5]        # 26aa <dl_runtime_resolve>
    1ee5:	48 89 10             	mov    QWORD PTR [rax],rdx
                //填入模块id
                got[1]     = mod - modules;
    1ee8:	48 8b 05 e9 40 00 00 	mov    rax,QWORD PTR [rip+0x40e9]        # 5fd8 <modules-0x1c8>
    1eef:	48 89 c2             	mov    rdx,rax
    1ef2:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1ef9:	48 29 d0             	sub    rax,rdx
    1efc:	48 c1 f8 05          	sar    rax,0x5
    1f00:	48 89 c2             	mov    rdx,rax
    1f03:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
    1f0a:	aa aa aa 
    1f0d:	48 0f af c2          	imul   rax,rdx
    1f11:	48 89 c2             	mov    rdx,rax
    1f14:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1f1b:	48 83 c0 08          	add    rax,0x8
    1f1f:	48 89 10             	mov    QWORD PTR [rax],rdx
                mod->p_got = got;
    1f22:	48 8b 95 d8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x128]
    1f29:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1f30:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
                break;
    1f34:	e9 0a 01 00 00       	jmp    2043 <load_elfso+0x843>
            case DT_SYMTAB: mod->p_symbol = p->d_un.d_ptr + offset; break;
    1f39:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1f40:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1f44:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1f48:	48 01 c2             	add    rdx,rax
    1f4b:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1f52:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    1f56:	e9 e8 00 00 00       	jmp    2043 <load_elfso+0x843>
            case DT_PLTRELSZ: jmprelsz = p->d_un.d_val; break;
    1f5b:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1f62:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1f66:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    1f6d:	e9 d1 00 00 00       	jmp    2043 <load_elfso+0x843>
            case DT_RELSZ: relsz = p->d_un.d_val; break;
    1f72:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1f79:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1f7d:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    1f81:	e9 bd 00 00 00       	jmp    2043 <load_elfso+0x843>
            case DT_RELASZ: relasz = p->d_un.d_val; break;
    1f86:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1f8d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1f91:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
    1f95:	e9 a9 00 00 00       	jmp    2043 <load_elfso+0x843>
            case DT_PLTREL: pltrel = p->d_un.d_val; break;
    1f9a:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1fa1:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1fa5:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
    1fab:	e9 93 00 00 00       	jmp    2043 <load_elfso+0x843>
            case DT_JMPREL: jmprelptr = p->d_un.d_val; break;
    1fb0:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1fb7:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1fbb:	48 89 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rax
    1fc2:	eb 7f                	jmp    2043 <load_elfso+0x843>
            case DT_REL: relptr = p->d_un.d_ptr; break;
    1fc4:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1fcb:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1fcf:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    1fd6:	eb 6b                	jmp    2043 <load_elfso+0x843>
            case DT_RELA: relaptr = p->d_un.d_ptr; break;
    1fd8:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1fdf:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1fe3:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    1fea:	eb 57                	jmp    2043 <load_elfso+0x843>
            case DT_RELENT: relentsz = p->d_un.d_val; break;
    1fec:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1ff3:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1ff7:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    1ffb:	eb 46                	jmp    2043 <load_elfso+0x843>
            case DT_RELAENT: relaentsz = p->d_un.d_val; break;
    1ffd:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    2004:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2008:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    200c:	eb 35                	jmp    2043 <load_elfso+0x843>
            case DT_INIT_ARRAY: init = p->d_un.d_ptr; break;
    200e:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    2015:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2019:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    2020:	eb 21                	jmp    2043 <load_elfso+0x843>
            case DT_INIT_ARRAYSZ: init_arrsz = p->d_un.d_val; break;
    2022:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    2029:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    202d:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    2034:	eb 0d                	jmp    2043 <load_elfso+0x843>
            case DT_BIND_NOW: bind_now = 1; break;
    2036:	c7 85 50 ff ff ff 01 	mov    DWORD PTR [rbp-0xb0],0x1
    203d:	00 00 00 
    2040:	eb 01                	jmp    2043 <load_elfso+0x843>
            default: break;
    2042:	90                   	nop
        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    2043:	48 83 85 30 ff ff ff 	add    QWORD PTR [rbp-0xd0],0x10
    204a:	10 
    204b:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    2052:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2055:	48 85 c0             	test   rax,rax
    2058:	0f 85 fd fd ff ff    	jne    1e5b <load_elfso+0x65b>
            }
        }
        for (int i = 0; i < t_needed; i++) {
    205e:	c7 85 2c ff ff ff 00 	mov    DWORD PTR [rbp-0xd4],0x0
    2065:	00 00 00 
    2068:	eb 67                	jmp    20d1 <load_elfso+0x8d1>
            char* pathname = 0;
    206a:	48 c7 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],0x0
    2071:	00 00 00 00 
            int   so_fno   = 0;
    2075:	c7 85 c4 fe ff ff 00 	mov    DWORD PTR [rbp-0x13c],0x0
    207c:	00 00 00 
            pathname       = needed_nameoff[i];
    207f:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
    2085:	48 98                	cdqe   
    2087:	48 8b 84 c5 a0 fd ff 	mov    rax,QWORD PTR [rbp+rax*8-0x260]
    208e:	ff 
    208f:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
            so_fno         = open(pathname, O_EXEC);
    2096:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    209d:	be 00 10 00 00       	mov    esi,0x1000
    20a2:	48 89 c7             	mov    rdi,rax
    20a5:	e8 26 f0 ff ff       	call   10d0 <open@plt>
    20aa:	89 85 c4 fe ff ff    	mov    DWORD PTR [rbp-0x13c],eax
            load_elfso(so_fno);
    20b0:	8b 85 c4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x13c]
    20b6:	89 c7                	mov    edi,eax
    20b8:	e8 43 f7 ff ff       	call   1800 <load_elfso>
            close(so_fno);
    20bd:	8b 85 c4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x13c]
    20c3:	89 c7                	mov    edi,eax
    20c5:	e8 16 f0 ff ff       	call   10e0 <close@plt>
        for (int i = 0; i < t_needed; i++) {
    20ca:	83 85 2c ff ff ff 01 	add    DWORD PTR [rbp-0xd4],0x1
    20d1:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
    20d7:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
    20da:	7c 8e                	jl     206a <load_elfso+0x86a>
        }
        if (relptr && relentsz && relsz)   // REL
    20dc:	48 83 bd 68 ff ff ff 	cmp    QWORD PTR [rbp-0x98],0x0
    20e3:	00 
    20e4:	74 7d                	je     2163 <load_elfso+0x963>
    20e6:	48 83 7d 90 00       	cmp    QWORD PTR [rbp-0x70],0x0
    20eb:	74 76                	je     2163 <load_elfso+0x963>
    20ed:	48 83 7d 98 00       	cmp    QWORD PTR [rbp-0x68],0x0
    20f2:	74 6f                	je     2163 <load_elfso+0x963>
            for (int j = 0; j < relsz / relentsz; j++)
    20f4:	c7 85 28 ff ff ff 00 	mov    DWORD PTR [rbp-0xd8],0x0
    20fb:	00 00 00 
    20fe:	eb 48                	jmp    2148 <load_elfso+0x948>
                fill_reloc(relptr + offset + j * relentsz, elfid, mod->p_symbol, 0);
    2100:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    2107:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    210b:	48 89 c2             	mov    rdx,rax
    210e:	48 8b 8d 68 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x98]
    2115:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2119:	48 01 c1             	add    rcx,rax
    211c:	8b 85 28 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd8]
    2122:	48 98                	cdqe   
    2124:	48 0f af 45 90       	imul   rax,QWORD PTR [rbp-0x70]
    2129:	48 01 c8             	add    rax,rcx
    212c:	48 89 c7             	mov    rdi,rax
    212f:	8b 85 e4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x11c]
    2135:	b9 00 00 00 00       	mov    ecx,0x0
    213a:	89 c6                	mov    esi,eax
    213c:	e8 ff ee ff ff       	call   1040 <fill_reloc@plt>
            for (int j = 0; j < relsz / relentsz; j++)
    2141:	83 85 28 ff ff ff 01 	add    DWORD PTR [rbp-0xd8],0x1
    2148:	8b 85 28 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd8]
    214e:	48 63 c8             	movsxd rcx,eax
    2151:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
    2155:	ba 00 00 00 00       	mov    edx,0x0
    215a:	48 f7 75 90          	div    QWORD PTR [rbp-0x70]
    215e:	48 39 c1             	cmp    rcx,rax
    2161:	72 9d                	jb     2100 <load_elfso+0x900>
        if (relaptr && relaentsz && relasz)   // RELA
    2163:	48 83 bd 60 ff ff ff 	cmp    QWORD PTR [rbp-0xa0],0x0
    216a:	00 
    216b:	74 7d                	je     21ea <load_elfso+0x9ea>
    216d:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
    2172:	74 76                	je     21ea <load_elfso+0x9ea>
    2174:	48 83 7d 88 00       	cmp    QWORD PTR [rbp-0x78],0x0
    2179:	74 6f                	je     21ea <load_elfso+0x9ea>
            for (int j = 0; j < relasz / relaentsz; j++)
    217b:	c7 85 24 ff ff ff 00 	mov    DWORD PTR [rbp-0xdc],0x0
    2182:	00 00 00 
    2185:	eb 48                	jmp    21cf <load_elfso+0x9cf>
                fill_reloc(relaptr + offset + j * relaentsz, elfid, mod->p_symbol, 1);
    2187:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    218e:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    2192:	48 89 c2             	mov    rdx,rax
    2195:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
    219c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    21a0:	48 01 c1             	add    rcx,rax
    21a3:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
    21a9:	48 98                	cdqe   
    21ab:	48 0f af 45 80       	imul   rax,QWORD PTR [rbp-0x80]
    21b0:	48 01 c8             	add    rax,rcx
    21b3:	48 89 c7             	mov    rdi,rax
    21b6:	8b 85 e4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x11c]
    21bc:	b9 01 00 00 00       	mov    ecx,0x1
    21c1:	89 c6                	mov    esi,eax
    21c3:	e8 78 ee ff ff       	call   1040 <fill_reloc@plt>
            for (int j = 0; j < relasz / relaentsz; j++)
    21c8:	83 85 24 ff ff ff 01 	add    DWORD PTR [rbp-0xdc],0x1
    21cf:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
    21d5:	48 63 c8             	movsxd rcx,eax
    21d8:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
    21dc:	ba 00 00 00 00       	mov    edx,0x0
    21e1:	48 f7 75 80          	div    QWORD PTR [rbp-0x80]
    21e5:	48 39 c1             	cmp    rcx,rax
    21e8:	72 9d                	jb     2187 <load_elfso+0x987>
        if (pltrel == DT_REL)
    21ea:	83 bd 54 ff ff ff 11 	cmp    DWORD PTR [rbp-0xac],0x11
    21f1:	75 17                	jne    220a <load_elfso+0xa0a>
            jmprelaentsz = relentsz, pltrel = 0;
    21f3:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    21f7:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    21fe:	c7 85 54 ff ff ff 00 	mov    DWORD PTR [rbp-0xac],0x0
    2205:	00 00 00 
    2208:	eb 15                	jmp    221f <load_elfso+0xa1f>
        else
            jmprelaentsz = relaentsz, pltrel = 1;
    220a:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
    220e:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    2215:	c7 85 54 ff ff ff 01 	mov    DWORD PTR [rbp-0xac],0x1
    221c:	00 00 00 
        if (bind_now && jmprelptr && jmprelaentsz && jmprelsz)   // PLTREL
    221f:	83 bd 50 ff ff ff 00 	cmp    DWORD PTR [rbp-0xb0],0x0
    2226:	0f 84 a4 00 00 00    	je     22d0 <load_elfso+0xad0>
    222c:	48 83 bd 58 ff ff ff 	cmp    QWORD PTR [rbp-0xa8],0x0
    2233:	00 
    2234:	0f 84 96 00 00 00    	je     22d0 <load_elfso+0xad0>
    223a:	48 83 bd 70 ff ff ff 	cmp    QWORD PTR [rbp-0x90],0x0
    2241:	00 
    2242:	0f 84 88 00 00 00    	je     22d0 <load_elfso+0xad0>
    2248:	48 83 bd 78 ff ff ff 	cmp    QWORD PTR [rbp-0x88],0x0
    224f:	00 
    2250:	74 7e                	je     22d0 <load_elfso+0xad0>
            for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    2252:	c7 85 20 ff ff ff 00 	mov    DWORD PTR [rbp-0xe0],0x0
    2259:	00 00 00 
    225c:	eb 51                	jmp    22af <load_elfso+0xaaf>
                fill_reloc(jmprelptr + offset + j * jmprelaentsz, elfid, mod->p_symbol, pltrel);
    225e:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    2265:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    2269:	48 89 c6             	mov    rsi,rax
    226c:	48 8b 95 58 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xa8]
    2273:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2277:	48 01 c2             	add    rdx,rax
    227a:	8b 85 20 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe0]
    2280:	48 98                	cdqe   
    2282:	48 0f af 85 70 ff ff 	imul   rax,QWORD PTR [rbp-0x90]
    2289:	ff 
    228a:	48 01 d0             	add    rax,rdx
    228d:	48 89 c7             	mov    rdi,rax
    2290:	8b 95 54 ff ff ff    	mov    edx,DWORD PTR [rbp-0xac]
    2296:	8b 85 e4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x11c]
    229c:	89 d1                	mov    ecx,edx
    229e:	48 89 f2             	mov    rdx,rsi
    22a1:	89 c6                	mov    esi,eax
    22a3:	e8 98 ed ff ff       	call   1040 <fill_reloc@plt>
            for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    22a8:	83 85 20 ff ff ff 01 	add    DWORD PTR [rbp-0xe0],0x1
    22af:	8b 85 20 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe0]
    22b5:	48 63 c8             	movsxd rcx,eax
    22b8:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
    22bf:	ba 00 00 00 00       	mov    edx,0x0
    22c4:	48 f7 b5 70 ff ff ff 	div    QWORD PTR [rbp-0x90]
    22cb:	48 39 c1             	cmp    rcx,rax
    22ce:	72 8e                	jb     225e <load_elfso+0xa5e>
        if (init) {
    22d0:	48 83 bd 48 ff ff ff 	cmp    QWORD PTR [rbp-0xb8],0x0
    22d7:	00 
    22d8:	74 41                	je     231b <load_elfso+0xb1b>
            //调用模块入口函数
            for (int i = 0; i < init_arrsz; i++) {
    22da:	c7 85 1c ff ff ff 00 	mov    DWORD PTR [rbp-0xe4],0x0
    22e1:	00 00 00 
    22e4:	eb 24                	jmp    230a <load_elfso+0xb0a>
                (init + i * 8)();
    22e6:	8b 85 1c ff ff ff    	mov    eax,DWORD PTR [rbp-0xe4]
    22ec:	c1 e0 03             	shl    eax,0x3
    22ef:	48 63 d0             	movsxd rdx,eax
    22f2:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    22f9:	48 01 c2             	add    rdx,rax
    22fc:	b8 00 00 00 00       	mov    eax,0x0
    2301:	ff d2                	call   rdx
            for (int i = 0; i < init_arrsz; i++) {
    2303:	83 85 1c ff ff ff 01 	add    DWORD PTR [rbp-0xe4],0x1
    230a:	8b 85 1c ff ff ff    	mov    eax,DWORD PTR [rbp-0xe4]
    2310:	48 98                	cdqe   
    2312:	48 39 85 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],rax
    2319:	77 cb                	ja     22e6 <load_elfso+0xae6>
            }
        }
    }

    return entry;
    231b:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
}
    2322:	c9                   	leave  
    2323:	c3                   	ret    

0000000000002324 <get_sym_addr>:
static off_t get_sym_addr(unsigned long modid, unsigned long symi)
{
    2324:	f3 0f 1e fa          	endbr64 
    2328:	55                   	push   rbp
    2329:	48 89 e5             	mov    rbp,rsp
    232c:	48 83 ec 40          	sub    rsp,0x40
    2330:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
    2334:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
    struct Elf64_Sym* sym = modules[modid].p_symbol;
    2338:	48 8b 0d 99 3c 00 00 	mov    rcx,QWORD PTR [rip+0x3c99]        # 5fd8 <modules-0x1c8>
    233f:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    2343:	48 89 d0             	mov    rax,rdx
    2346:	48 01 c0             	add    rax,rax
    2349:	48 01 d0             	add    rax,rdx
    234c:	48 c1 e0 05          	shl    rax,0x5
    2350:	48 01 c8             	add    rax,rcx
    2353:	48 83 c0 28          	add    rax,0x28
    2357:	48 8b 00             	mov    rax,QWORD PTR [rax]
    235a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    sym += symi;
    235e:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
    2362:	48 89 d0             	mov    rax,rdx
    2365:	48 01 c0             	add    rax,rax
    2368:	48 01 d0             	add    rax,rdx
    236b:	48 c1 e0 03          	shl    rax,0x3
    236f:	48 01 45 e8          	add    QWORD PTR [rbp-0x18],rax
    if (sym->st_shndx == SHN_COMMON) {
        //还没分配空间的符号，需要分配空间，st_value表示地址对齐约束
    }
    off_t symaddr = 0;
    2373:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    237a:	00 
    if (sym->st_shndx != SHN_UNDEF && sym->st_value)
    237b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    237f:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
    2383:	66 85 c0             	test   ax,ax
    2386:	74 43                	je     23cb <get_sym_addr+0xa7>
    2388:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    238c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2390:	48 85 c0             	test   rax,rax
    2393:	74 36                	je     23cb <get_sym_addr+0xa7>
        symaddr = sym->st_value + modules[modid].load_offset;
    2395:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2399:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
    239d:	48 8b 35 34 3c 00 00 	mov    rsi,QWORD PTR [rip+0x3c34]        # 5fd8 <modules-0x1c8>
    23a4:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    23a8:	48 89 d0             	mov    rax,rdx
    23ab:	48 01 c0             	add    rax,rax
    23ae:	48 01 d0             	add    rax,rdx
    23b1:	48 c1 e0 05          	shl    rax,0x5
    23b5:	48 01 f0             	add    rax,rsi
    23b8:	48 83 c0 08          	add    rax,0x8
    23bc:	48 8b 00             	mov    rax,QWORD PTR [rax]
    23bf:	48 01 c8             	add    rax,rcx
    23c2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    23c6:	e9 12 02 00 00       	jmp    25dd <get_sym_addr+0x2b9>
    else {
        //不在本模块，需要在别的模块符号表中寻找
        char* target_name = modules[modid].p_strtab + sym->st_name;
    23cb:	48 8b 0d 06 3c 00 00 	mov    rcx,QWORD PTR [rip+0x3c06]        # 5fd8 <modules-0x1c8>
    23d2:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    23d6:	48 89 d0             	mov    rax,rdx
    23d9:	48 01 c0             	add    rax,rax
    23dc:	48 01 d0             	add    rax,rdx
    23df:	48 c1 e0 05          	shl    rax,0x5
    23e3:	48 01 c8             	add    rax,rcx
    23e6:	48 83 c0 40          	add    rax,0x40
    23ea:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    23ed:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    23f1:	8b 00                	mov    eax,DWORD PTR [rax]
    23f3:	89 c0                	mov    eax,eax
    23f5:	48 01 d0             	add    rax,rdx
    23f8:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for (int i = 0; i < MAX_MODULES; i++) {
    23fc:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    2403:	e9 cb 01 00 00       	jmp    25d3 <get_sym_addr+0x2af>
            if (modules[i].type == ET_NONE || i == modid)
    2408:	48 8b 0d c9 3b 00 00 	mov    rcx,QWORD PTR [rip+0x3bc9]        # 5fd8 <modules-0x1c8>
    240f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    2412:	48 63 d0             	movsxd rdx,eax
    2415:	48 89 d0             	mov    rax,rdx
    2418:	48 01 c0             	add    rax,rax
    241b:	48 01 d0             	add    rax,rdx
    241e:	48 c1 e0 05          	shl    rax,0x5
    2422:	48 01 c8             	add    rax,rcx
    2425:	48 83 c0 18          	add    rax,0x18
    2429:	48 8b 00             	mov    rax,QWORD PTR [rax]
    242c:	48 85 c0             	test   rax,rax
    242f:	0f 84 96 01 00 00    	je     25cb <get_sym_addr+0x2a7>
    2435:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    2438:	48 98                	cdqe   
    243a:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
    243e:	0f 84 87 01 00 00    	je     25cb <get_sym_addr+0x2a7>
                continue;
            sym = modules[i].p_symbol;
    2444:	48 8b 0d 8d 3b 00 00 	mov    rcx,QWORD PTR [rip+0x3b8d]        # 5fd8 <modules-0x1c8>
    244b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    244e:	48 63 d0             	movsxd rdx,eax
    2451:	48 89 d0             	mov    rax,rdx
    2454:	48 01 c0             	add    rax,rax
    2457:	48 01 d0             	add    rax,rdx
    245a:	48 c1 e0 05          	shl    rax,0x5
    245e:	48 01 c8             	add    rax,rcx
    2461:	48 83 c0 28          	add    rax,0x28
    2465:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2468:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            if (!sym)
    246c:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
    2471:	0f 84 57 01 00 00    	je     25ce <get_sym_addr+0x2aa>
                continue;
            for (int j = 0; j < modules[i].s_symtabsz / sizeof(struct Elf64_Sym); j++) {
    2477:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
    247e:	e9 ff 00 00 00       	jmp    2582 <get_sym_addr+0x25e>
                //获取符号名称
                if (!sym[j].st_name)
    2483:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    2486:	48 63 d0             	movsxd rdx,eax
    2489:	48 89 d0             	mov    rax,rdx
    248c:	48 01 c0             	add    rax,rax
    248f:	48 01 d0             	add    rax,rdx
    2492:	48 c1 e0 03          	shl    rax,0x3
    2496:	48 89 c2             	mov    rdx,rax
    2499:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    249d:	48 01 d0             	add    rax,rdx
    24a0:	8b 00                	mov    eax,DWORD PTR [rax]
    24a2:	85 c0                	test   eax,eax
    24a4:	0f 84 d3 00 00 00    	je     257d <get_sym_addr+0x259>
                    continue;
                char* symname = modules[i].p_strtab + sym[j].st_name;
    24aa:	48 8b 0d 27 3b 00 00 	mov    rcx,QWORD PTR [rip+0x3b27]        # 5fd8 <modules-0x1c8>
    24b1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    24b4:	48 63 d0             	movsxd rdx,eax
    24b7:	48 89 d0             	mov    rax,rdx
    24ba:	48 01 c0             	add    rax,rax
    24bd:	48 01 d0             	add    rax,rdx
    24c0:	48 c1 e0 05          	shl    rax,0x5
    24c4:	48 01 c8             	add    rax,rcx
    24c7:	48 83 c0 40          	add    rax,0x40
    24cb:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    24ce:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    24d1:	48 63 d0             	movsxd rdx,eax
    24d4:	48 89 d0             	mov    rax,rdx
    24d7:	48 01 c0             	add    rax,rax
    24da:	48 01 d0             	add    rax,rdx
    24dd:	48 c1 e0 03          	shl    rax,0x3
    24e1:	48 89 c2             	mov    rdx,rax
    24e4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    24e8:	48 01 d0             	add    rax,rdx
    24eb:	8b 00                	mov    eax,DWORD PTR [rax]
    24ed:	89 c0                	mov    eax,eax
    24ef:	48 01 c8             	add    rax,rcx
    24f2:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
                if (sym[j].st_value && dlstrcmp(target_name, symname) == 0) {
    24f6:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    24f9:	48 63 d0             	movsxd rdx,eax
    24fc:	48 89 d0             	mov    rax,rdx
    24ff:	48 01 c0             	add    rax,rax
    2502:	48 01 d0             	add    rax,rdx
    2505:	48 c1 e0 03          	shl    rax,0x3
    2509:	48 89 c2             	mov    rdx,rax
    250c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2510:	48 01 d0             	add    rax,rdx
    2513:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2517:	48 85 c0             	test   rax,rax
    251a:	74 62                	je     257e <get_sym_addr+0x25a>
    251c:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
    2520:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2524:	48 89 d6             	mov    rsi,rdx
    2527:	48 89 c7             	mov    rdi,rax
    252a:	e8 51 eb ff ff       	call   1080 <dlstrcmp@plt>
    252f:	85 c0                	test   eax,eax
    2531:	75 4b                	jne    257e <get_sym_addr+0x25a>
                    return modules[i].load_offset + sym[j].st_value;
    2533:	48 8b 0d 9e 3a 00 00 	mov    rcx,QWORD PTR [rip+0x3a9e]        # 5fd8 <modules-0x1c8>
    253a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    253d:	48 63 d0             	movsxd rdx,eax
    2540:	48 89 d0             	mov    rax,rdx
    2543:	48 01 c0             	add    rax,rax
    2546:	48 01 d0             	add    rax,rdx
    2549:	48 c1 e0 05          	shl    rax,0x5
    254d:	48 01 c8             	add    rax,rcx
    2550:	48 83 c0 08          	add    rax,0x8
    2554:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    2557:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    255a:	48 63 d0             	movsxd rdx,eax
    255d:	48 89 d0             	mov    rax,rdx
    2560:	48 01 c0             	add    rax,rax
    2563:	48 01 d0             	add    rax,rdx
    2566:	48 c1 e0 03          	shl    rax,0x3
    256a:	48 89 c2             	mov    rdx,rax
    256d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2571:	48 01 d0             	add    rax,rdx
    2574:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2578:	48 01 c8             	add    rax,rcx
    257b:	eb 64                	jmp    25e1 <get_sym_addr+0x2bd>
                    continue;
    257d:	90                   	nop
            for (int j = 0; j < modules[i].s_symtabsz / sizeof(struct Elf64_Sym); j++) {
    257e:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
    2582:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    2585:	48 63 c8             	movsxd rcx,eax
    2588:	48 8b 35 49 3a 00 00 	mov    rsi,QWORD PTR [rip+0x3a49]        # 5fd8 <modules-0x1c8>
    258f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    2592:	48 63 d0             	movsxd rdx,eax
    2595:	48 89 d0             	mov    rax,rdx
    2598:	48 01 c0             	add    rax,rax
    259b:	48 01 d0             	add    rax,rdx
    259e:	48 c1 e0 05          	shl    rax,0x5
    25a2:	48 01 f0             	add    rax,rsi
    25a5:	48 83 c0 48          	add    rax,0x48
    25a9:	48 8b 00             	mov    rax,QWORD PTR [rax]
    25ac:	48 ba ab aa aa aa aa 	movabs rdx,0xaaaaaaaaaaaaaaab
    25b3:	aa aa aa 
    25b6:	48 f7 e2             	mul    rdx
    25b9:	48 89 d0             	mov    rax,rdx
    25bc:	48 c1 e8 04          	shr    rax,0x4
    25c0:	48 39 c1             	cmp    rcx,rax
    25c3:	0f 82 ba fe ff ff    	jb     2483 <get_sym_addr+0x15f>
    25c9:	eb 04                	jmp    25cf <get_sym_addr+0x2ab>
                continue;
    25cb:	90                   	nop
    25cc:	eb 01                	jmp    25cf <get_sym_addr+0x2ab>
                continue;
    25ce:	90                   	nop
        for (int i = 0; i < MAX_MODULES; i++) {
    25cf:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
    25d3:	83 7d f4 7f          	cmp    DWORD PTR [rbp-0xc],0x7f
    25d7:	0f 8e 2b fe ff ff    	jle    2408 <get_sym_addr+0xe4>
                }
            }
        }
    }
    return symaddr;
    25dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
    25e1:	c9                   	leave  
    25e2:	c3                   	ret    

00000000000025e3 <dlstrcmp>:
int dlstrcmp(char* src, char* dst)
{
    25e3:	f3 0f 1e fa          	endbr64 
    25e7:	55                   	push   rbp
    25e8:	48 89 e5             	mov    rbp,rsp
    25eb:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    25ef:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while (*src++ && *dst++) {
    25f3:	eb 2c                	jmp    2621 <dlstrcmp+0x3e>
        if (*src != *dst) {
    25f5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    25f9:	0f b6 10             	movzx  edx,BYTE PTR [rax]
    25fc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2600:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    2603:	38 c2                	cmp    dl,al
    2605:	74 1a                	je     2621 <dlstrcmp+0x3e>
            return *src - *dst;
    2607:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    260b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    260e:	0f be d0             	movsx  edx,al
    2611:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2615:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    2618:	0f be c8             	movsx  ecx,al
    261b:	89 d0                	mov    eax,edx
    261d:	29 c8                	sub    eax,ecx
    261f:	eb 2b                	jmp    264c <dlstrcmp+0x69>
    while (*src++ && *dst++) {
    2621:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2625:	48 8d 50 01          	lea    rdx,[rax+0x1]
    2629:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
    262d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    2630:	84 c0                	test   al,al
    2632:	74 13                	je     2647 <dlstrcmp+0x64>
    2634:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2638:	48 8d 50 01          	lea    rdx,[rax+0x1]
    263c:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    2640:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    2643:	84 c0                	test   al,al
    2645:	75 ae                	jne    25f5 <dlstrcmp+0x12>
        }
    }
    return 0;
    2647:	b8 00 00 00 00       	mov    eax,0x0
}
    264c:	5d                   	pop    rbp
    264d:	c3                   	ret    

000000000000264e <get_load_base>:
off_t get_load_base(unsigned long modid)
{
    264e:	f3 0f 1e fa          	endbr64 
    2652:	55                   	push   rbp
    2653:	48 89 e5             	mov    rbp,rsp
    2656:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return modules[modid].base;
    265a:	48 8b 0d 77 39 00 00 	mov    rcx,QWORD PTR [rip+0x3977]        # 5fd8 <modules-0x1c8>
    2661:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2665:	48 89 d0             	mov    rax,rdx
    2668:	48 01 c0             	add    rax,rax
    266b:	48 01 d0             	add    rax,rdx
    266e:	48 c1 e0 05          	shl    rax,0x5
    2672:	48 01 c8             	add    rax,rcx
    2675:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
    2678:	5d                   	pop    rbp
    2679:	c3                   	ret    

000000000000267a <get_got>:
off_t get_got(unsigned long modid)
{
    267a:	f3 0f 1e fa          	endbr64 
    267e:	55                   	push   rbp
    267f:	48 89 e5             	mov    rbp,rsp
    2682:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return modules[modid].p_got;
    2686:	48 8b 0d 4b 39 00 00 	mov    rcx,QWORD PTR [rip+0x394b]        # 5fd8 <modules-0x1c8>
    268d:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2691:	48 89 d0             	mov    rax,rdx
    2694:	48 01 c0             	add    rax,rax
    2697:	48 01 d0             	add    rax,rdx
    269a:	48 c1 e0 05          	shl    rax,0x5
    269e:	48 01 c8             	add    rax,rcx
    26a1:	48 83 c0 30          	add    rax,0x30
    26a5:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
    26a8:	5d                   	pop    rbp
    26a9:	c3                   	ret    

00000000000026aa <dl_runtime_resolve>:
static void dl_runtime_resolve()
{
    26aa:	f3 0f 1e fa          	endbr64 
    26ae:	55                   	push   rbp
    26af:	48 89 e5             	mov    rbp,rsp
    26b2:	48 83 ec 30          	sub    rsp,0x30
    //需要先保存寄存器，里面可能保存了函数的参数
    __asm__ volatile("push %rdi\n push %rsi\n push %rcx\n push %rdx\n push %r8\n push %r9\n");
    26b6:	57                   	push   rdi
    26b7:	56                   	push   rsi
    26b8:	51                   	push   rcx
    26b9:	52                   	push   rdx
    26ba:	41 50                	push   r8
    26bc:	41 51                	push   r9
    //获取modid
    unsigned long long modid, rel_offset;
    __asm__ volatile("mov 8(%%rbp),%%rax\n mov %%rax,%0" : "=m"(modid));
    26be:	48 8b 45 08          	mov    rax,QWORD PTR [rbp+0x8]
    26c2:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    __asm__ volatile("mov 16(%%rbp),%%rax\n mov %%rax,%0" : "=m"(rel_offset));
    26c6:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
    26ca:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    Elf64_Rel* rel     = rel_offset * modules[modid].s_relentsz + modules[modid].p_reloc;
    26ce:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    26d2:	48 8b 0d ff 38 00 00 	mov    rcx,QWORD PTR [rip+0x38ff]        # 5fd8 <modules-0x1c8>
    26d9:	48 89 d0             	mov    rax,rdx
    26dc:	48 01 c0             	add    rax,rax
    26df:	48 01 d0             	add    rax,rdx
    26e2:	48 c1 e0 05          	shl    rax,0x5
    26e6:	48 01 c8             	add    rax,rcx
    26e9:	48 83 c0 58          	add    rax,0x58
    26ed:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    26f0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    26f4:	48 89 d1             	mov    rcx,rdx
    26f7:	48 0f af c8          	imul   rcx,rax
    26fb:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    26ff:	48 8b 35 d2 38 00 00 	mov    rsi,QWORD PTR [rip+0x38d2]        # 5fd8 <modules-0x1c8>
    2706:	48 89 d0             	mov    rax,rdx
    2709:	48 01 c0             	add    rax,rax
    270c:	48 01 d0             	add    rax,rdx
    270f:	48 c1 e0 05          	shl    rax,0x5
    2713:	48 01 f0             	add    rax,rsi
    2716:	48 83 c0 50          	add    rax,0x50
    271a:	48 8b 00             	mov    rax,QWORD PTR [rax]
    271d:	48 01 c8             	add    rax,rcx
    2720:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int        symi    = ELF64_R_SYM(rel->r_info);
    2724:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2728:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    272c:	48 c1 e8 20          	shr    rax,0x20
    2730:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    off_t      sym_off = get_sym_addr(modid, symi);
    2733:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    2736:	48 63 d0             	movsxd rdx,eax
    2739:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    273d:	48 89 d6             	mov    rsi,rdx
    2740:	48 89 c7             	mov    rdi,rax
    2743:	e8 dc fb ff ff       	call   2324 <get_sym_addr>
    2748:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    //必然是R_X86_64_JUMP_SLOT
    off_t* v_rel = rel->r_offset;
    274c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2750:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2753:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    *v_rel       = sym_off;
    2757:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    275b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    275f:	48 89 10             	mov    QWORD PTR [rax],rdx

    //恢复原函数调用参数
    __asm__ volatile("pop %r9\n pop %r8\n pop %rdx\n pop %rcx\n pop %rsi\n pop %rdi\n");
    2762:	41 59                	pop    r9
    2764:	41 58                	pop    r8
    2766:	5a                   	pop    rdx
    2767:	59                   	pop    rcx
    2768:	5e                   	pop    rsi
    2769:	5f                   	pop    rdi
    //重定位完毕，直接返回到目标地址
    __asm__ volatile("mov %0,%%rax\n leave\n add $16,%%rsp\n jmp *%%rax\n" ::"m"(sym_off));
    276a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    276e:	c9                   	leave  
    276f:	48 83 c4 10          	add    rsp,0x10
    2773:	ff e0                	jmp    rax
}
    2775:	90                   	nop
    2776:	c9                   	leave  
    2777:	c3                   	ret    

0000000000002778 <fill_reloc>:

void fill_reloc(void* relp, int modid, void* shdrs, int rela)
{
    2778:	f3 0f 1e fa          	endbr64 
    277c:	55                   	push   rbp
    277d:	48 89 e5             	mov    rbp,rsp
    2780:	48 83 ec 50          	sub    rsp,0x50
    2784:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
    2788:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
    278b:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    278f:	89 4d c0             	mov    DWORD PTR [rbp-0x40],ecx
    Elf64_Rela* rel  = relp;
    2792:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    2796:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int         symi = ELF64_R_SYM(rel->r_info), type = ELF64_R_TYPE(rel->r_info);
    279a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    279e:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    27a2:	48 c1 e8 20          	shr    rax,0x20
    27a6:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    27a9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    27ad:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    27b1:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    off_t       sym_off   = get_sym_addr(modid, symi);
    27b4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    27b7:	48 63 d0             	movsxd rdx,eax
    27ba:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    27bd:	48 98                	cdqe   
    27bf:	48 89 d6             	mov    rsi,rdx
    27c2:	48 89 c7             	mov    rdi,rax
    27c5:	e8 5a fb ff ff       	call   2324 <get_sym_addr>
    27ca:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    off_t       load_base = get_load_base(modid);
    27ce:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    27d1:	48 98                	cdqe   
    27d3:	48 89 c7             	mov    rdi,rax
    27d6:	e8 c5 e8 ff ff       	call   10a0 <get_load_base@plt>
    27db:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    off_t       got       = get_got(modid);
    27df:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    27e2:	48 98                	cdqe   
    27e4:	48 89 c7             	mov    rdi,rax
    27e7:	e8 34 e8 ff ff       	call   1020 <get_got@plt>
    27ec:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    //这里假定获取符号的地址是正确的，可以不修改符号表，而是通过记录模块整体加载地址，
    //来加上偏移量获取正确的符号地址
    off_t* v_rel = rel->r_offset;
    27f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    27f4:	48 8b 00             	mov    rax,QWORD PTR [rax]
    27f7:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    switch (type) {
    27fb:	83 7d f0 0b          	cmp    DWORD PTR [rbp-0x10],0xb
    27ff:	0f 87 45 01 00 00    	ja     294a <fill_reloc+0x1d2>
    2805:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    2808:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    280f:	00 
    2810:	48 8d 05 c9 18 00 00 	lea    rax,[rip+0x18c9]        # 40e0 <chkmmap+0x5a0>
    2817:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    281a:	48 98                	cdqe   
    281c:	48 8d 15 bd 18 00 00 	lea    rdx,[rip+0x18bd]        # 40e0 <chkmmap+0x5a0>
    2823:	48 01 d0             	add    rax,rdx
    2826:	3e ff e0             	notrack jmp rax
    case R_X86_64_GLOB_DAT:
    case R_X86_64_JUMP_SLOT: *v_rel = sym_off; break;
    2829:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    282d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    2831:	48 89 10             	mov    QWORD PTR [rax],rdx
    2834:	e9 12 01 00 00       	jmp    294b <fill_reloc+0x1d3>
    case R_X86_64_RELATIVE:
        if (rela)
    2839:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    283d:	74 1e                	je     285d <fill_reloc+0xe5>
            *v_rel = rel->r_addend + load_base;
    283f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2843:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2847:	48 89 c2             	mov    rdx,rax
    284a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    284e:	48 01 c2             	add    rdx,rax
    2851:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2855:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += load_base;
        break;
    2858:	e9 ee 00 00 00       	jmp    294b <fill_reloc+0x1d3>
            *v_rel += load_base;
    285d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2861:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2864:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2868:	48 01 c2             	add    rdx,rax
    286b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    286f:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2872:	e9 d4 00 00 00       	jmp    294b <fill_reloc+0x1d3>
    case R_X86_64_GOTPC:
        if (rela)
    2877:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    287b:	74 28                	je     28a5 <fill_reloc+0x12d>
            *v_rel = got + rel->r_addend - rel->r_offset;
    287d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2881:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2885:	48 89 c2             	mov    rdx,rax
    2888:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    288c:	48 01 c2             	add    rdx,rax
    288f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2893:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2896:	48 29 c2             	sub    rdx,rax
    2899:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    289d:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += got - (unsigned long long)rel;
        break;
    28a0:	e9 a6 00 00 00       	jmp    294b <fill_reloc+0x1d3>
            *v_rel += got - (unsigned long long)rel;
    28a5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    28a9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    28ac:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
    28b0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    28b4:	48 29 c8             	sub    rax,rcx
    28b7:	48 01 c2             	add    rdx,rax
    28ba:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    28be:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    28c1:	e9 85 00 00 00       	jmp    294b <fill_reloc+0x1d3>
    case R_X86_64_32S:
    case R_X86_64_64:
        if (rela)
    28c6:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    28ca:	74 17                	je     28e3 <fill_reloc+0x16b>
            *v_rel += sym_off;
    28cc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    28d0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    28d3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    28d7:	48 01 c2             	add    rdx,rax
    28da:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    28de:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off;
        break;
    28e1:	eb 68                	jmp    294b <fill_reloc+0x1d3>
            *v_rel = rel->r_addend + sym_off;
    28e3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    28e7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    28eb:	48 89 c2             	mov    rdx,rax
    28ee:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    28f2:	48 01 c2             	add    rdx,rax
    28f5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    28f9:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    28fc:	eb 4d                	jmp    294b <fill_reloc+0x1d3>
    case R_X86_64_PC32:
        if (rela)
    28fe:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    2902:	74 21                	je     2925 <fill_reloc+0x1ad>
            *v_rel += sym_off - rel->r_offset;
    2904:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2908:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    290b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    290f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    2912:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2916:	48 29 c8             	sub    rax,rcx
    2919:	48 01 c2             	add    rdx,rax
    291c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2920:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
        break;
    2923:	eb 26                	jmp    294b <fill_reloc+0x1d3>
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
    2925:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2929:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    292d:	48 89 c2             	mov    rdx,rax
    2930:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2934:	48 01 c2             	add    rdx,rax
    2937:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    293b:	48 8b 00             	mov    rax,QWORD PTR [rax]
    293e:	48 29 c2             	sub    rdx,rax
    2941:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2945:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2948:	eb 01                	jmp    294b <fill_reloc+0x1d3>
    default: break;
    294a:	90                   	nop
    }
}
    294b:	90                   	nop
    294c:	c9                   	leave  
    294d:	c3                   	ret    

000000000000294e <set_symtab>:
void set_symtab(void* symtab, int modid)
{
    294e:	f3 0f 1e fa          	endbr64 
    2952:	55                   	push   rbp
    2953:	48 89 e5             	mov    rbp,rsp
    2956:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    295a:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    if (modid >= MAX_SYMTABS)
    295d:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
    2961:	7f 17                	jg     297a <set_symtab+0x2c>
        return;
    symtabs[modid] = symtab;
    2963:	48 8b 05 8e 36 00 00 	mov    rax,QWORD PTR [rip+0x368e]        # 5ff8 <symtabs-0xa8>
    296a:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
    296d:	48 63 d2             	movsxd rdx,edx
    2970:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
    2974:	48 89 0c d0          	mov    QWORD PTR [rax+rdx*8],rcx
    2978:	eb 01                	jmp    297b <set_symtab+0x2d>
        return;
    297a:	90                   	nop
}
    297b:	5d                   	pop    rbp
    297c:	c3                   	ret    

000000000000297d <reg_module>:

static int reg_module()
{
    297d:	f3 0f 1e fa          	endbr64 
    2981:	55                   	push   rbp
    2982:	48 89 e5             	mov    rbp,rsp
    int i = 0;
    2985:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for (; i < MAX_MODULES; i++) {
    298c:	eb 5a                	jmp    29e8 <reg_module+0x6b>
        if (modules[i].type = ET_NONE) {
    298e:	48 8b 0d 43 36 00 00 	mov    rcx,QWORD PTR [rip+0x3643]        # 5fd8 <modules-0x1c8>
    2995:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    2998:	48 63 d0             	movsxd rdx,eax
    299b:	48 89 d0             	mov    rax,rdx
    299e:	48 01 c0             	add    rax,rax
    29a1:	48 01 d0             	add    rax,rdx
    29a4:	48 c1 e0 05          	shl    rax,0x5
    29a8:	48 01 c8             	add    rax,rcx
    29ab:	48 83 c0 18          	add    rax,0x18
    29af:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    29b6:	48 8b 0d 1b 36 00 00 	mov    rcx,QWORD PTR [rip+0x361b]        # 5fd8 <modules-0x1c8>
    29bd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    29c0:	48 63 d0             	movsxd rdx,eax
    29c3:	48 89 d0             	mov    rax,rdx
    29c6:	48 01 c0             	add    rax,rax
    29c9:	48 01 d0             	add    rax,rdx
    29cc:	48 c1 e0 05          	shl    rax,0x5
    29d0:	48 01 c8             	add    rax,rcx
    29d3:	48 83 c0 18          	add    rax,0x18
    29d7:	48 8b 00             	mov    rax,QWORD PTR [rax]
    29da:	48 85 c0             	test   rax,rax
    29dd:	74 05                	je     29e4 <reg_module+0x67>
            return i;
    29df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    29e2:	eb 0f                	jmp    29f3 <reg_module+0x76>
    for (; i < MAX_MODULES; i++) {
    29e4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    29e8:	83 7d fc 7f          	cmp    DWORD PTR [rbp-0x4],0x7f
    29ec:	7e a0                	jle    298e <reg_module+0x11>
        }
    }
    return -1;
    29ee:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
    29f3:	5d                   	pop    rbp
    29f4:	c3                   	ret    

00000000000029f5 <dl_init>:
static int dl_init(void* load_offset)
{
    29f5:	f3 0f 1e fa          	endbr64 
    29f9:	55                   	push   rbp
    29fa:	48 89 e5             	mov    rbp,rsp
    29fd:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
    2a04:	48 89 bd 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdi
    //自举，不能调用任何全局函数和使用任何全局变量，完成自身重定位
    Elf64_Ehdr*       ehdr = load_offset;
    2a0b:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2a12:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    Elf64_Phdr*       ph   = ehdr->e_phoff;
    2a19:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
    2a20:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    2a24:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    Elf64_Dyn*        dyn  = &_DYNAMIC;
    2a2b:	48 8b 05 9e 35 00 00 	mov    rax,QWORD PTR [rip+0x359e]        # 5fd0 <_DYNAMIC+0x120>
    2a32:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    struct Elf64_Sym* sym  = 0;
    2a39:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    2a40:	00 

    size_t              relsz = 0, relentsz = 0;
    2a41:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
    2a48:	00 
    2a49:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
    2a50:	00 
    size_t              relasz = 0, relaentsz = 0;
    2a51:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    2a58:	00 
    2a59:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
    2a60:	00 
    size_t              jmprelsz = 0, jmprelaentsz = 0;
    2a61:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
    2a68:	00 
    2a69:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
    2a70:	00 
    unsigned long long  relptr = 0, relaptr = 0, jmprelptr = 0;
    2a71:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
    2a78:	00 
    2a79:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
    2a80:	00 
    2a81:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
    2a88:	00 
    int                 pltrel = 0;
    2a89:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
    unsigned long long* got    = 0;
    2a90:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    2a97:	00 

    int bind_now = 0;
    2a98:	c7 45 9c 00 00 00 00 	mov    DWORD PTR [rbp-0x64],0x0
    for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    2a9f:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    2aa6:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    2aaa:	e9 2a 01 00 00       	jmp    2bd9 <dl_init+0x1e4>
        char* pathname = 0;
    2aaf:	48 c7 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],0x0
    2ab6:	00 00 00 00 
        int   so_fno   = 0;
    2aba:	c7 85 5c ff ff ff 00 	mov    DWORD PTR [rbp-0xa4],0x0
    2ac1:	00 00 00 
        switch (p->d_tag) {
    2ac4:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2ac8:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2acb:	48 83 f8 18          	cmp    rax,0x18
    2acf:	0f 87 fe 00 00 00    	ja     2bd3 <dl_init+0x1de>
    2ad5:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    2adc:	00 
    2add:	48 8d 05 2c 16 00 00 	lea    rax,[rip+0x162c]        # 4110 <chkmmap+0x5d0>
    2ae4:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    2ae7:	48 98                	cdqe   
    2ae9:	48 8d 15 20 16 00 00 	lea    rdx,[rip+0x1620]        # 4110 <chkmmap+0x5d0>
    2af0:	48 01 d0             	add    rax,rdx
    2af3:	3e ff e0             	notrack jmp rax
        case DT_PLTGOT:   //赋值为dl的运行时重定位函数
            got    = p->d_un.d_ptr + load_offset;
    2af6:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2afa:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    2afe:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2b05:	48 01 d0             	add    rax,rdx
    2b08:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
            got[2] = dl_runtime_resolve;
    2b0c:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    2b10:	48 83 c0 10          	add    rax,0x10
    2b14:	48 8d 15 8f fb ff ff 	lea    rdx,[rip+0xfffffffffffffb8f]        # 26aa <dl_runtime_resolve>
    2b1b:	48 89 10             	mov    QWORD PTR [rax],rdx
            //填入模块id
            got[1] = 0;
    2b1e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    2b22:	48 83 c0 08          	add    rax,0x8
    2b26:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            break;
    2b2d:	e9 a2 00 00 00       	jmp    2bd4 <dl_init+0x1df>
        case DT_SYMTAB: sym = p->d_un.d_ptr + load_offset; break;
    2b32:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2b36:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    2b3a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2b41:	48 01 d0             	add    rax,rdx
    2b44:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    2b48:	e9 87 00 00 00       	jmp    2bd4 <dl_init+0x1df>
        case DT_PLTRELSZ: jmprelsz = p->d_un.d_val; break;
    2b4d:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2b51:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2b55:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    2b59:	eb 79                	jmp    2bd4 <dl_init+0x1df>
        case DT_RELSZ: relsz = p->d_un.d_val; break;
    2b5b:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2b5f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2b63:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    2b67:	eb 6b                	jmp    2bd4 <dl_init+0x1df>
        case DT_RELASZ: relasz = p->d_un.d_val; break;
    2b69:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2b6d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2b71:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    2b75:	eb 5d                	jmp    2bd4 <dl_init+0x1df>
        case DT_PLTREL: pltrel = p->d_un.d_val; break;
    2b77:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2b7b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2b7f:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    2b82:	eb 50                	jmp    2bd4 <dl_init+0x1df>
        case DT_JMPREL: jmprelptr = p->d_un.d_val; break;
    2b84:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2b88:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2b8c:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
    2b90:	eb 42                	jmp    2bd4 <dl_init+0x1df>
        case DT_REL: relptr = p->d_un.d_ptr; break;
    2b92:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2b96:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2b9a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    2b9e:	eb 34                	jmp    2bd4 <dl_init+0x1df>
        case DT_RELA: relaptr = p->d_un.d_ptr; break;
    2ba0:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2ba4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2ba8:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    2bac:	eb 26                	jmp    2bd4 <dl_init+0x1df>
        case DT_RELENT: relentsz = p->d_un.d_val; break;
    2bae:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2bb2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2bb6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    2bba:	eb 18                	jmp    2bd4 <dl_init+0x1df>
        case DT_RELAENT: relaentsz = p->d_un.d_val; break;
    2bbc:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2bc0:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2bc4:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    2bc8:	eb 0a                	jmp    2bd4 <dl_init+0x1df>
        case DT_BIND_NOW: bind_now = 1; break;
    2bca:	c7 45 9c 01 00 00 00 	mov    DWORD PTR [rbp-0x64],0x1
    2bd1:	eb 01                	jmp    2bd4 <dl_init+0x1df>
        default: break;
    2bd3:	90                   	nop
    for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    2bd4:	48 83 45 90 10       	add    QWORD PTR [rbp-0x70],0x10
    2bd9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2bdd:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2be0:	48 85 c0             	test   rax,rax
    2be3:	0f 85 c6 fe ff ff    	jne    2aaf <dl_init+0xba>
        }
    }
    if (relptr && relentsz && relsz)   // REL
    2be9:	48 83 7d c0 00       	cmp    QWORD PTR [rbp-0x40],0x0
    2bee:	74 72                	je     2c62 <dl_init+0x26d>
    2bf0:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
    2bf5:	74 6b                	je     2c62 <dl_init+0x26d>
    2bf7:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
    2bfc:	74 64                	je     2c62 <dl_init+0x26d>
        for (int j = 0; j < relsz / relentsz; j++)
    2bfe:	c7 45 8c 00 00 00 00 	mov    DWORD PTR [rbp-0x74],0x0
    2c05:	eb 43                	jmp    2c4a <dl_init+0x255>
            init_fill_reloc(relptr + load_offset + j * relentsz, load_offset, sym, 0, got);
    2c07:	48 8b 4d a0          	mov    rcx,QWORD PTR [rbp-0x60]
    2c0b:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2c12:	8b 55 8c             	mov    edx,DWORD PTR [rbp-0x74]
    2c15:	48 63 d2             	movsxd rdx,edx
    2c18:	48 89 d6             	mov    rsi,rdx
    2c1b:	48 0f af 75 e8       	imul   rsi,QWORD PTR [rbp-0x18]
    2c20:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
    2c24:	48 01 d6             	add    rsi,rdx
    2c27:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2c2e:	48 8d 3c 16          	lea    rdi,[rsi+rdx*1]
    2c32:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2c36:	49 89 c8             	mov    r8,rcx
    2c39:	b9 00 00 00 00       	mov    ecx,0x0
    2c3e:	48 89 c6             	mov    rsi,rax
    2c41:	e8 0c 02 00 00       	call   2e52 <init_fill_reloc>
        for (int j = 0; j < relsz / relentsz; j++)
    2c46:	83 45 8c 01          	add    DWORD PTR [rbp-0x74],0x1
    2c4a:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    2c4d:	48 63 c8             	movsxd rcx,eax
    2c50:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2c54:	ba 00 00 00 00       	mov    edx,0x0
    2c59:	48 f7 75 e8          	div    QWORD PTR [rbp-0x18]
    2c5d:	48 39 c1             	cmp    rcx,rax
    2c60:	72 a5                	jb     2c07 <dl_init+0x212>
    if (relaptr && relaentsz && relasz)   // RELA
    2c62:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
    2c67:	74 72                	je     2cdb <dl_init+0x2e6>
    2c69:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
    2c6e:	74 6b                	je     2cdb <dl_init+0x2e6>
    2c70:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
    2c75:	74 64                	je     2cdb <dl_init+0x2e6>
        for (int j = 0; j < relasz / relaentsz; j++)
    2c77:	c7 45 88 00 00 00 00 	mov    DWORD PTR [rbp-0x78],0x0
    2c7e:	eb 43                	jmp    2cc3 <dl_init+0x2ce>
            init_fill_reloc(relaptr + load_offset + j * relaentsz, load_offset, sym, 1, got);
    2c80:	48 8b 4d a0          	mov    rcx,QWORD PTR [rbp-0x60]
    2c84:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2c8b:	8b 55 88             	mov    edx,DWORD PTR [rbp-0x78]
    2c8e:	48 63 d2             	movsxd rdx,edx
    2c91:	48 89 d6             	mov    rsi,rdx
    2c94:	48 0f af 75 d8       	imul   rsi,QWORD PTR [rbp-0x28]
    2c99:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
    2c9d:	48 01 d6             	add    rsi,rdx
    2ca0:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2ca7:	48 8d 3c 16          	lea    rdi,[rsi+rdx*1]
    2cab:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2caf:	49 89 c8             	mov    r8,rcx
    2cb2:	b9 01 00 00 00       	mov    ecx,0x1
    2cb7:	48 89 c6             	mov    rsi,rax
    2cba:	e8 93 01 00 00       	call   2e52 <init_fill_reloc>
        for (int j = 0; j < relasz / relaentsz; j++)
    2cbf:	83 45 88 01          	add    DWORD PTR [rbp-0x78],0x1
    2cc3:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    2cc6:	48 63 c8             	movsxd rcx,eax
    2cc9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2ccd:	ba 00 00 00 00       	mov    edx,0x0
    2cd2:	48 f7 75 d8          	div    QWORD PTR [rbp-0x28]
    2cd6:	48 39 c1             	cmp    rcx,rax
    2cd9:	72 a5                	jb     2c80 <dl_init+0x28b>
    if (pltrel == DT_REL)
    2cdb:	83 7d ac 11          	cmp    DWORD PTR [rbp-0x54],0x11
    2cdf:	75 11                	jne    2cf2 <dl_init+0x2fd>
        jmprelaentsz = relentsz, pltrel = 0;
    2ce1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2ce5:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    2ce9:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
    2cf0:	eb 0f                	jmp    2d01 <dl_init+0x30c>
    else
        jmprelaentsz = relaentsz, pltrel = 1;
    2cf2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2cf6:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    2cfa:	c7 45 ac 01 00 00 00 	mov    DWORD PTR [rbp-0x54],0x1
    if (bind_now && jmprelptr && jmprelaentsz && jmprelsz)   // PLTREL
    2d01:	83 7d 9c 00          	cmp    DWORD PTR [rbp-0x64],0x0
    2d05:	74 77                	je     2d7e <dl_init+0x389>
    2d07:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
    2d0c:	74 70                	je     2d7e <dl_init+0x389>
    2d0e:	48 83 7d c8 00       	cmp    QWORD PTR [rbp-0x38],0x0
    2d13:	74 69                	je     2d7e <dl_init+0x389>
    2d15:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
    2d1a:	74 62                	je     2d7e <dl_init+0x389>
        for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    2d1c:	c7 45 84 00 00 00 00 	mov    DWORD PTR [rbp-0x7c],0x0
    2d23:	eb 41                	jmp    2d66 <dl_init+0x371>
            init_fill_reloc(
    2d25:	48 8b 75 a0          	mov    rsi,QWORD PTR [rbp-0x60]
    2d29:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
                jmprelptr + load_offset + j * jmprelaentsz, load_offset, sym, pltrel, got);
    2d30:	8b 55 84             	mov    edx,DWORD PTR [rbp-0x7c]
    2d33:	48 63 d2             	movsxd rdx,edx
    2d36:	48 89 d1             	mov    rcx,rdx
    2d39:	48 0f af 4d c8       	imul   rcx,QWORD PTR [rbp-0x38]
    2d3e:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
    2d42:	48 01 d1             	add    rcx,rdx
            init_fill_reloc(
    2d45:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2d4c:	48 8d 3c 11          	lea    rdi,[rcx+rdx*1]
    2d50:	8b 4d ac             	mov    ecx,DWORD PTR [rbp-0x54]
    2d53:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2d57:	49 89 f0             	mov    r8,rsi
    2d5a:	48 89 c6             	mov    rsi,rax
    2d5d:	e8 f0 00 00 00       	call   2e52 <init_fill_reloc>
        for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    2d62:	83 45 84 01          	add    DWORD PTR [rbp-0x7c],0x1
    2d66:	8b 45 84             	mov    eax,DWORD PTR [rbp-0x7c]
    2d69:	48 63 c8             	movsxd rcx,eax
    2d6c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2d70:	ba 00 00 00 00       	mov    edx,0x0
    2d75:	48 f7 75 c8          	div    QWORD PTR [rbp-0x38]
    2d79:	48 39 c1             	cmp    rcx,rax
    2d7c:	72 a7                	jb     2d25 <dl_init+0x330>
    //重定位完毕，可以使用全局变量和全局函数
    for (int i = 0; i < MAX_MODULES; i++) {
    2d7e:	c7 45 80 00 00 00 00 	mov    DWORD PTR [rbp-0x80],0x0
    2d85:	eb 2c                	jmp    2db3 <dl_init+0x3be>
        modules[i].type = ET_NONE;
    2d87:	48 8b 0d 4a 32 00 00 	mov    rcx,QWORD PTR [rip+0x324a]        # 5fd8 <modules-0x1c8>
    2d8e:	8b 45 80             	mov    eax,DWORD PTR [rbp-0x80]
    2d91:	48 63 d0             	movsxd rdx,eax
    2d94:	48 89 d0             	mov    rax,rdx
    2d97:	48 01 c0             	add    rax,rax
    2d9a:	48 01 d0             	add    rax,rdx
    2d9d:	48 c1 e0 05          	shl    rax,0x5
    2da1:	48 01 c8             	add    rax,rcx
    2da4:	48 83 c0 18          	add    rax,0x18
    2da8:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    for (int i = 0; i < MAX_MODULES; i++) {
    2daf:	83 45 80 01          	add    DWORD PTR [rbp-0x80],0x1
    2db3:	83 7d 80 7f          	cmp    DWORD PTR [rbp-0x80],0x7f
    2db7:	7e ce                	jle    2d87 <dl_init+0x392>
    }
    modules[0].p_symbol    = sym;
    2db9:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2dbd:	48 8b 05 14 32 00 00 	mov    rax,QWORD PTR [rip+0x3214]        # 5fd8 <modules-0x1c8>
    2dc4:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    modules[0].load_offset = load_offset;
    2dc8:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2dcf:	48 8b 05 02 32 00 00 	mov    rax,QWORD PTR [rip+0x3202]        # 5fd8 <modules-0x1c8>
    2dd6:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    modules[0].base        = load_offset;
    2dda:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2de1:	48 8b 05 f0 31 00 00 	mov    rax,QWORD PTR [rip+0x31f0]        # 5fd8 <modules-0x1c8>
    2de8:	48 89 10             	mov    QWORD PTR [rax],rdx
    modules[0].p_dynamic   = dyn;
    2deb:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
    2df2:	48 8b 05 df 31 00 00 	mov    rax,QWORD PTR [rip+0x31df]        # 5fd8 <modules-0x1c8>
    2df9:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    modules[0].p_got       = got;
    2dfd:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
    2e01:	48 8b 05 d0 31 00 00 	mov    rax,QWORD PTR [rip+0x31d0]        # 5fd8 <modules-0x1c8>
    2e08:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    modules[0].type        = ET_DYN;
    2e0c:	48 8b 05 c5 31 00 00 	mov    rax,QWORD PTR [rip+0x31c5]        # 5fd8 <modules-0x1c8>
    2e13:	48 c7 40 18 03 00 00 	mov    QWORD PTR [rax+0x18],0x3
    2e1a:	00 
    modules[0].header      = load_offset;
    2e1b:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2e22:	48 8b 05 af 31 00 00 	mov    rax,QWORD PTR [rip+0x31af]        # 5fd8 <modules-0x1c8>
    2e29:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    modules[0].p_reloc     = jmprelptr;
    2e2d:	48 8b 05 a4 31 00 00 	mov    rax,QWORD PTR [rip+0x31a4]        # 5fd8 <modules-0x1c8>
    2e34:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
    2e38:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    modules[0].s_relentsz  = jmprelaentsz;
    2e3c:	48 8b 05 95 31 00 00 	mov    rax,QWORD PTR [rip+0x3195]        # 5fd8 <modules-0x1c8>
    2e43:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    2e47:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
    return 0;
    2e4b:	b8 00 00 00 00       	mov    eax,0x0
}
    2e50:	c9                   	leave  
    2e51:	c3                   	ret    

0000000000002e52 <init_fill_reloc>:
//自举用的小重定位函数
static void init_fill_reloc(void* relp, unsigned long long load_base, void* symtab, int rela,
                            off_t igot)
{
    2e52:	f3 0f 1e fa          	endbr64 
    2e56:	55                   	push   rbp
    2e57:	48 89 e5             	mov    rbp,rsp
    2e5a:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
    2e5e:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
    2e62:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    2e66:	89 4d b4             	mov    DWORD PTR [rbp-0x4c],ecx
    2e69:	4c 89 45 a8          	mov    QWORD PTR [rbp-0x58],r8
    unsigned long long got  = igot + load_base;
    2e6d:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
    2e71:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    2e75:	48 01 d0             	add    rax,rdx
    2e78:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    Elf64_Rela*        rel  = relp;
    2e7c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    2e80:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int                symi = ELF64_R_SYM(rel->r_info), type = ELF64_R_TYPE(rel->r_info);
    2e84:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2e88:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2e8c:	48 c1 e8 20          	shr    rax,0x20
    2e90:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    2e93:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2e97:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2e9b:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    unsigned long long sym_off = (((struct Elf64_Sym*)symtab)[symi]).st_value;
    2e9e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    2ea1:	48 63 d0             	movsxd rdx,eax
    2ea4:	48 89 d0             	mov    rax,rdx
    2ea7:	48 01 c0             	add    rax,rax
    2eaa:	48 01 d0             	add    rax,rdx
    2ead:	48 c1 e0 03          	shl    rax,0x3
    2eb1:	48 89 c2             	mov    rdx,rax
    2eb4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    2eb8:	48 01 d0             	add    rax,rdx
    2ebb:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2ebf:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if (!sym_off) {
    2ec3:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
    2ec8:	0f 84 5a 01 00 00    	je     3028 <init_fill_reloc+0x1d6>
        //外部符号
        return;
    }
    //这里假定获取符号的地址是正确的，可以不修改符号表，而是通过记录模块整体加载地址，
    //来加上偏移量获取正确的符号地址
    unsigned long long* v_rel = rel->r_offset;
    2ece:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2ed2:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2ed5:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (type) {
    2ed9:	83 7d e8 0b          	cmp    DWORD PTR [rbp-0x18],0xb
    2edd:	0f 87 48 01 00 00    	ja     302b <init_fill_reloc+0x1d9>
    2ee3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
    2ee6:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    2eed:	00 
    2eee:	48 8d 05 7f 12 00 00 	lea    rax,[rip+0x127f]        # 4174 <chkmmap+0x634>
    2ef5:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    2ef8:	48 98                	cdqe   
    2efa:	48 8d 15 73 12 00 00 	lea    rdx,[rip+0x1273]        # 4174 <chkmmap+0x634>
    2f01:	48 01 d0             	add    rax,rdx
    2f04:	3e ff e0             	notrack jmp rax
    case R_X86_64_GLOB_DAT:
    case R_X86_64_JUMP_SLOT: *v_rel = sym_off; break;
    2f07:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2f0b:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    2f0f:	48 89 10             	mov    QWORD PTR [rax],rdx
    2f12:	e9 15 01 00 00       	jmp    302c <init_fill_reloc+0x1da>
    case R_X86_64_RELATIVE:
        if (rela)
    2f17:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    2f1b:	74 1e                	je     2f3b <init_fill_reloc+0xe9>
            *v_rel = rel->r_addend + load_base;
    2f1d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2f21:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2f25:	48 89 c2             	mov    rdx,rax
    2f28:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    2f2c:	48 01 c2             	add    rdx,rax
    2f2f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2f33:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += load_base;
        break;
    2f36:	e9 f1 00 00 00       	jmp    302c <init_fill_reloc+0x1da>
            *v_rel += load_base;
    2f3b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2f3f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2f42:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    2f46:	48 01 c2             	add    rdx,rax
    2f49:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2f4d:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2f50:	e9 d7 00 00 00       	jmp    302c <init_fill_reloc+0x1da>
    case R_X86_64_GOTPC:
        if (rela)
    2f55:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    2f59:	74 28                	je     2f83 <init_fill_reloc+0x131>
            *v_rel = got + rel->r_addend - rel->r_offset;
    2f5b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2f5f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2f63:	48 89 c2             	mov    rdx,rax
    2f66:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2f6a:	48 01 c2             	add    rdx,rax
    2f6d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2f71:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2f74:	48 29 c2             	sub    rdx,rax
    2f77:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2f7b:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += got - (unsigned long long)rel;
        break;
    2f7e:	e9 a9 00 00 00       	jmp    302c <init_fill_reloc+0x1da>
            *v_rel += got - (unsigned long long)rel;
    2f83:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2f87:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2f8a:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
    2f8e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2f92:	48 29 c8             	sub    rax,rcx
    2f95:	48 01 c2             	add    rdx,rax
    2f98:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2f9c:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2f9f:	e9 88 00 00 00       	jmp    302c <init_fill_reloc+0x1da>
    case R_X86_64_32S:
    case R_X86_64_64:
        if (rela)
    2fa4:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    2fa8:	74 17                	je     2fc1 <init_fill_reloc+0x16f>
            *v_rel += sym_off;
    2faa:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2fae:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2fb1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2fb5:	48 01 c2             	add    rdx,rax
    2fb8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2fbc:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off;
        break;
    2fbf:	eb 6b                	jmp    302c <init_fill_reloc+0x1da>
            *v_rel = rel->r_addend + sym_off;
    2fc1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2fc5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2fc9:	48 89 c2             	mov    rdx,rax
    2fcc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2fd0:	48 01 c2             	add    rdx,rax
    2fd3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2fd7:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2fda:	eb 50                	jmp    302c <init_fill_reloc+0x1da>
    case R_X86_64_PC32:
        if (rela)
    2fdc:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    2fe0:	74 21                	je     3003 <init_fill_reloc+0x1b1>
            *v_rel += sym_off - rel->r_offset;
    2fe2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2fe6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2fe9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2fed:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    2ff0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2ff4:	48 29 c8             	sub    rax,rcx
    2ff7:	48 01 c2             	add    rdx,rax
    2ffa:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2ffe:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
        break;
    3001:	eb 29                	jmp    302c <init_fill_reloc+0x1da>
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
    3003:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    3007:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    300b:	48 89 c2             	mov    rdx,rax
    300e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    3012:	48 01 c2             	add    rdx,rax
    3015:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    3019:	48 8b 00             	mov    rax,QWORD PTR [rax]
    301c:	48 29 c2             	sub    rdx,rax
    301f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3023:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    3026:	eb 04                	jmp    302c <init_fill_reloc+0x1da>
        return;
    3028:	90                   	nop
    3029:	eb 01                	jmp    302c <init_fill_reloc+0x1da>
    default: break;
    302b:	90                   	nop
    }
    302c:	5d                   	pop    rbp
    302d:	c3                   	ret    
    302e:	66 90                	xchg   ax,ax

0000000000003030 <max>:
	return a < b ? b : a;
    3030:	48 39 f7             	cmp    rdi,rsi
    3033:	48 89 f0             	mov    rax,rsi
    3036:	48 0f 43 c7          	cmovae rax,rdi
}
    303a:	c3                   	ret    
    303b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000003040 <align>:
	return (val + alignment - 1) & ~(alignment - 1);
    3040:	48 8d 44 3e ff       	lea    rax,[rsi+rdi*1-0x1]
    3045:	48 f7 de             	neg    rsi
    3048:	48 21 f0             	and    rax,rsi
}
    304b:	c3                   	ret    
    304c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000003050 <granules_to_chunk_kind>:
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
    3050:	31 c0                	xor    eax,eax
    3052:	83 ff 01             	cmp    edi,0x1
    3055:	76 4e                	jbe    30a5 <granules_to_chunk_kind+0x55>
    3057:	b8 01 00 00 00       	mov    eax,0x1
    305c:	83 ff 02             	cmp    edi,0x2
    305f:	74 44                	je     30a5 <granules_to_chunk_kind+0x55>
    3061:	83 ff 03             	cmp    edi,0x3
    3064:	74 5a                	je     30c0 <granules_to_chunk_kind+0x70>
    3066:	83 ff 04             	cmp    edi,0x4
    3069:	74 45                	je     30b0 <granules_to_chunk_kind+0x60>
    306b:	83 ff 05             	cmp    edi,0x5
    306e:	74 60                	je     30d0 <granules_to_chunk_kind+0x80>
    3070:	83 ff 06             	cmp    edi,0x6
    3073:	74 2b                	je     30a0 <granules_to_chunk_kind+0x50>
    3075:	b8 06 00 00 00       	mov    eax,0x6
    307a:	83 ff 08             	cmp    edi,0x8
    307d:	76 26                	jbe    30a5 <granules_to_chunk_kind+0x55>
    307f:	b8 07 00 00 00       	mov    eax,0x7
    3084:	83 ff 0a             	cmp    edi,0xa
    3087:	76 1c                	jbe    30a5 <granules_to_chunk_kind+0x55>
    3089:	b8 08 00 00 00       	mov    eax,0x8
    308e:	83 ff 10             	cmp    edi,0x10
    3091:	76 12                	jbe    30a5 <granules_to_chunk_kind+0x55>
    3093:	83 ff 21             	cmp    edi,0x21
    3096:	19 c0                	sbb    eax,eax
    3098:	24 0a                	and    al,0xa
    309a:	05 ff 00 00 00       	add    eax,0xff
    309f:	c3                   	ret    
    30a0:	b8 05 00 00 00       	mov    eax,0x5
}
    30a5:	c3                   	ret    
    30a6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    30ad:	00 00 00 
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
    30b0:	b8 03 00 00 00       	mov    eax,0x3
    30b5:	c3                   	ret    
    30b6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    30bd:	00 00 00 
    30c0:	b8 02 00 00 00       	mov    eax,0x2
    30c5:	c3                   	ret    
    30c6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    30cd:	00 00 00 
    30d0:	b8 04 00 00 00       	mov    eax,0x4
    30d5:	c3                   	ret    
    30d6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    30dd:	00 00 00 

00000000000030e0 <chunk_kind_to_granules>:
{
    30e0:	b8 ff ff ff ff       	mov    eax,0xffffffff
    30e5:	83 ff 09             	cmp    edi,0x9
    30e8:	77 0c                	ja     30f6 <chunk_kind_to_granules+0x16>
    30ea:	89 ff                	mov    edi,edi
    30ec:	48 8d 05 cd 10 00 00 	lea    rax,[rip+0x10cd]        # 41c0 <CSWTCH.34>
    30f3:	8b 04 b8             	mov    eax,DWORD PTR [rax+rdi*4]
}
    30f6:	c3                   	ret    
    30f7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    30fe:	00 00 

0000000000003100 <get_page>:
	return (struct page*)(char*)(((uintptr_t)ptr) & ~PAGE_MASK);
    3100:	48 89 f8             	mov    rax,rdi
    3103:	66 31 c0             	xor    ax,ax
}
    3106:	c3                   	ret    
    3107:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    310e:	00 00 

0000000000003110 <get_chunk_index>:
	return (((uintptr_t)ptr) & PAGE_MASK) / CHUNK_SIZE;
    3110:	89 f8                	mov    eax,edi
    3112:	0f b6 c4             	movzx  eax,ah
}
    3115:	c3                   	ret    
    3116:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    311d:	00 00 00 

0000000000003120 <get_large_object_payload>:
	return ((char*)obj) + LARGE_OBJECT_HEADER_SIZE;
    3120:	48 8d 47 10          	lea    rax,[rdi+0x10]
}
    3124:	c3                   	ret    
    3125:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    312c:	00 00 00 
    312f:	90                   	nop

0000000000003130 <get_large_object>:
	return (struct large_object*)(((char*)ptr) - LARGE_OBJECT_HEADER_SIZE);
    3130:	48 8d 47 f0          	lea    rax,[rdi-0x10]
}
    3134:	c3                   	ret    
    3135:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    313c:	00 00 00 
    313f:	90                   	nop

0000000000003140 <allocate_chunk>:
	page->header.chunk_kinds[idx] = kind;
    3140:	89 f6                	mov    esi,esi
    3142:	88 14 37             	mov    BYTE PTR [rdi+rsi*1],dl
	return page->chunks[idx].data;
    3145:	48 c1 e6 08          	shl    rsi,0x8
    3149:	48 8d 04 37          	lea    rax,[rdi+rsi*1]
}
    314d:	c3                   	ret    
    314e:	66 90                	xchg   ax,ax

0000000000003150 <maybe_repurpose_single_chunk_large_objects_head>:
	if(large_objects->size < CHUNK_SIZE)
    3150:	48 8b 0d b9 60 00 00 	mov    rcx,QWORD PTR [rip+0x60b9]        # 9210 <large_objects>
    3157:	48 81 79 08 ff 00 00 	cmp    QWORD PTR [rcx+0x8],0xff
    315e:	00 
    315f:	76 07                	jbe    3168 <maybe_repurpose_single_chunk_large_objects_head+0x18>
}
    3161:	c3                   	ret    
    3162:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		unsigned idx = get_chunk_index(large_objects);
    3168:	48 89 cf             	mov    rdi,rcx
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
    316b:	ba 09 00 00 00       	mov    edx,0x9
		unsigned idx = get_chunk_index(large_objects);
    3170:	e8 9b ff ff ff       	call   3110 <get_chunk_index>
    3175:	89 c6                	mov    esi,eax
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
    3177:	e8 84 ff ff ff       	call   3100 <get_page>
    317c:	48 89 c7             	mov    rdi,rax
    317f:	e8 bc ff ff ff       	call   3140 <allocate_chunk>
		large_objects = large_objects->next;
    3184:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
    3187:	48 89 15 82 60 00 00 	mov    QWORD PTR [rip+0x6082],rdx        # 9210 <large_objects>
		head->next = small_object_freelists[GRANULES_32];
    318e:	48 8b 15 d3 60 00 00 	mov    rdx,QWORD PTR [rip+0x60d3]        # 9268 <small_object_freelists+0x48>
    3195:	48 89 10             	mov    QWORD PTR [rax],rdx
		small_object_freelists[GRANULES_32] = head;
    3198:	48 89 05 c9 60 00 00 	mov    QWORD PTR [rip+0x60c9],rax        # 9268 <small_object_freelists+0x48>
}
    319f:	c3                   	ret    

00000000000031a0 <size_to_granules>:
	return (size + GRANULE_SIZE - 1) >> GRANULE_SIZE_LOG_2;
    31a0:	48 8d 47 07          	lea    rax,[rdi+0x7]
    31a4:	48 c1 e8 03          	shr    rax,0x3
}
    31a8:	c3                   	ret    
    31a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

00000000000031b0 <maybe_merge_free_large_object>:
{
    31b0:	53                   	push   rbx
	struct large_object* obj = *prev;
    31b1:	4c 8b 1f             	mov    r11,QWORD PTR [rdi]
{
    31b4:	49 89 f9             	mov    r9,rdi
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
    31b7:	48 8d 1d 52 60 00 00 	lea    rbx,[rip+0x6052]        # 9210 <large_objects>
		char* end = get_large_object_payload(obj) + obj->size;
    31be:	4c 89 df             	mov    rdi,r11
    31c1:	e8 5a ff ff ff       	call   3120 <get_large_object_payload>
    31c6:	4d 8b 43 08          	mov    r8,QWORD PTR [r11+0x8]
    31ca:	49 89 c2             	mov    r10,rax
    31cd:	0f 1f 00             	nop    DWORD PTR [rax]
    31d0:	4b 8d 14 02          	lea    rdx,[r10+r8*1]
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
    31d4:	be 00 01 00 00       	mov    esi,0x100
    31d9:	48 89 d7             	mov    rdi,rdx
    31dc:	e8 5f fe ff ff       	call   3040 <align>
    31e1:	48 39 c2             	cmp    rdx,rax
    31e4:	0f 85 16 df ff ff    	jne    1100 <maybe_merge_free_large_object.cold>
		unsigned chunk = get_chunk_index(end);
    31ea:	e8 21 ff ff ff       	call   3110 <get_chunk_index>
    31ef:	89 c1                	mov    ecx,eax
		if(chunk < FIRST_ALLOCATABLE_CHUNK)
    31f1:	85 c9                	test   ecx,ecx
    31f3:	74 53                	je     3248 <maybe_merge_free_large_object+0x98>
		struct page* page = get_page(end);
    31f5:	e8 06 ff ff ff       	call   3100 <get_page>
		if(page->header.chunk_kinds[chunk] != FREE_LARGE_OBJECT)
    31fa:	80 3c 08 fe          	cmp    BYTE PTR [rax+rcx*1],0xfe
    31fe:	75 48                	jne    3248 <maybe_merge_free_large_object+0x98>
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
    3200:	48 8b 05 09 60 00 00 	mov    rax,QWORD PTR [rip+0x6009]        # 9210 <large_objects>
			ASSERT(walk);
    3207:	48 85 c0             	test   rax,rax
    320a:	0f 84 f0 de ff ff    	je     1100 <maybe_merge_free_large_object.cold>
			if(walk == next)
    3210:	48 39 c2             	cmp    rdx,rax
    3213:	74 3b                	je     3250 <maybe_merge_free_large_object+0xa0>
    3215:	0f 1f 00             	nop    DWORD PTR [rax]
			walk = walk->next;
    3218:	48 89 c1             	mov    rcx,rax
    321b:	48 8b 00             	mov    rax,QWORD PTR [rax]
			ASSERT(walk);
    321e:	48 85 c0             	test   rax,rax
    3221:	74 32                	je     3255 <maybe_merge_free_large_object+0xa5>
			if(walk == next)
    3223:	48 39 c2             	cmp    rdx,rax
    3226:	75 f0                	jne    3218 <maybe_merge_free_large_object+0x68>
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
    3228:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
				if(prev == &walk->next)
    322c:	4c 39 c8             	cmp    rax,r9
    322f:	4c 0f 44 c9          	cmove  r9,rcx
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
    3233:	4d 8d 44 10 10       	lea    r8,[r8+rdx*1+0x10]
				*prev_prev = walk->next;
    3238:	48 8b 10             	mov    rdx,QWORD PTR [rax]
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
    323b:	4d 89 43 08          	mov    QWORD PTR [r11+0x8],r8
				*prev_prev = walk->next;
    323f:	48 89 11             	mov    QWORD PTR [rcx],rdx
				if(prev == &walk->next)
    3242:	eb 8c                	jmp    31d0 <maybe_merge_free_large_object+0x20>
    3244:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
}
    3248:	4c 89 c8             	mov    rax,r9
    324b:	5b                   	pop    rbx
    324c:	c3                   	ret    
    324d:	0f 1f 00             	nop    DWORD PTR [rax]
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
    3250:	48 89 d9             	mov    rcx,rbx
    3253:	eb d3                	jmp    3228 <maybe_merge_free_large_object+0x78>
    3255:	e9 a6 de ff ff       	jmp    1100 <maybe_merge_free_large_object.cold>
    325a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000003260 <maybe_compact_free_large_objects>:
	if(pending_large_object_compact)
    3260:	8b 05 9e 5f 00 00    	mov    eax,DWORD PTR [rip+0x5f9e]        # 9204 <pending_large_object_compact>
    3266:	85 c0                	test   eax,eax
    3268:	74 2c                	je     3296 <maybe_compact_free_large_objects+0x36>
		while(*prev)
    326a:	48 83 3d 9e 5f 00 00 	cmp    QWORD PTR [rip+0x5f9e],0x0        # 9210 <large_objects>
    3271:	00 
		pending_large_object_compact = 0;
    3272:	c7 05 88 5f 00 00 00 	mov    DWORD PTR [rip+0x5f88],0x0        # 9204 <pending_large_object_compact>
    3279:	00 00 00 
		while(*prev)
    327c:	74 18                	je     3296 <maybe_compact_free_large_objects+0x36>
		struct large_object** prev = &large_objects;
    327e:	48 8d 3d 8b 5f 00 00 	lea    rdi,[rip+0x5f8b]        # 9210 <large_objects>
    3285:	0f 1f 00             	nop    DWORD PTR [rax]
			prev = &(*maybe_merge_free_large_object(prev))->next;
    3288:	e8 23 ff ff ff       	call   31b0 <maybe_merge_free_large_object>
    328d:	48 8b 38             	mov    rdi,QWORD PTR [rax]
		while(*prev)
    3290:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
    3294:	75 f2                	jne    3288 <maybe_compact_free_large_objects+0x28>
}
    3296:	c3                   	ret    
    3297:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    329e:	00 00 

00000000000032a0 <get_small_object_freelist>:
	ASSERT(kind < SMALL_OBJECT_CHUNK_KINDS);
    32a0:	83 ff 09             	cmp    edi,0x9
    32a3:	0f 87 59 de ff ff    	ja     1102 <get_small_object_freelist.cold>
	return &small_object_freelists[kind];
    32a9:	89 ff                	mov    edi,edi
    32ab:	48 8d 05 6e 5f 00 00 	lea    rax,[rip+0x5f6e]        # 9220 <small_object_freelists>
    32b2:	48 8d 04 f8          	lea    rax,[rax+rdi*8]
}
    32b6:	c3                   	ret    
    32b7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    32be:	00 00 

00000000000032c0 <free>:
	enum chunk_kind kind = granules_to_chunk_kind(granules);
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
}

void free(void* ptr)
{
    32c0:	f3 0f 1e fa          	endbr64 
    32c4:	49 89 f8             	mov    r8,rdi
	if(!ptr)
    32c7:	48 85 ff             	test   rdi,rdi
    32ca:	74 2a                	je     32f6 <free+0x36>
		return;
	struct page* page = get_page(ptr);
    32cc:	e8 2f fe ff ff       	call   3100 <get_page>
    32d1:	49 89 c1             	mov    r9,rax
	unsigned chunk = get_chunk_index(ptr);
    32d4:	e8 37 fe ff ff       	call   3110 <get_chunk_index>
    32d9:	89 c6                	mov    esi,eax
	uint8_t kind = page->header.chunk_kinds[chunk];
    32db:	89 c0                	mov    eax,eax
    32dd:	41 0f b6 3c 01       	movzx  edi,BYTE PTR [r9+rax*1]
	if(kind == LARGE_OBJECT)
    32e2:	40 80 ff ff          	cmp    dil,0xff
    32e6:	74 18                	je     3300 <free+0x40>
		pending_large_object_compact = 1;
	}
	else
	{
		size_t granules = kind;
		struct freelist** loc = get_small_object_freelist(granules);
    32e8:	e8 b3 ff ff ff       	call   32a0 <get_small_object_freelist>
		struct freelist* obj = ptr;
		obj->next = *loc;
    32ed:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    32f0:	49 89 10             	mov    QWORD PTR [r8],rdx
		*loc = obj;
    32f3:	4c 89 00             	mov    QWORD PTR [rax],r8
	}
}
    32f6:	c3                   	ret    
    32f7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    32fe:	00 00 
		struct large_object* obj = get_large_object(ptr);
    3300:	4c 89 c7             	mov    rdi,r8
    3303:	e8 28 fe ff ff       	call   3130 <get_large_object>
		obj->next = large_objects;
    3308:	48 8b 15 01 5f 00 00 	mov    rdx,QWORD PTR [rip+0x5f01]        # 9210 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
    330f:	4c 89 cf             	mov    rdi,r9
		obj->next = large_objects;
    3312:	48 89 10             	mov    QWORD PTR [rax],rdx
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
    3315:	ba fe 00 00 00       	mov    edx,0xfe
		large_objects = obj;
    331a:	48 89 05 ef 5e 00 00 	mov    QWORD PTR [rip+0x5eef],rax        # 9210 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
    3321:	e8 1a fe ff ff       	call   3140 <allocate_chunk>
		pending_large_object_compact = 1;
    3326:	c7 05 d4 5e 00 00 01 	mov    DWORD PTR [rip+0x5ed4],0x1        # 9204 <pending_large_object_compact>
    332d:	00 00 00 
    3330:	c3                   	ret    
    3331:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    3338:	00 00 00 
    333b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000003340 <heap_size_in_pages>:
int heap_size_in_pages()
{
    3340:	f3 0f 1e fa          	endbr64 
    3344:	48 83 ec 08          	sub    rsp,0x8
	return (int)sbrk(0) - __heap_base;
    3348:	31 ff                	xor    edi,edi
    334a:	e8 21 dd ff ff       	call   1070 <sbrk@plt>
    334f:	48 8b 15 92 2c 00 00 	mov    rdx,QWORD PTR [rip+0x2c92]        # 5fe8 <__heap_base-0x3288>
    3356:	2b 02                	sub    eax,DWORD PTR [rdx]
    3358:	48 83 c4 08          	add    rsp,0x8
    335c:	c3                   	ret    
    335d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000003360 <allocate_pages.constprop.0>:
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
    3360:	41 55                	push   r13
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
    3362:	31 c0                	xor    eax,eax
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
    3364:	41 54                	push   r12
	size_t needed = payload_size + PAGE_HEADER_SIZE;
    3366:	4c 8d a7 00 01 00 00 	lea    r12,[rdi+0x100]
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
    336d:	55                   	push   rbp
    336e:	48 89 f5             	mov    rbp,rsi
    3371:	53                   	push   rbx
    3372:	48 83 ec 08          	sub    rsp,0x8
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
    3376:	e8 95 dc ff ff       	call   1010 <heap_size_in_pages@plt>
	if(!walloc_heap_size)
    337b:	48 8b 3d 86 5e 00 00 	mov    rdi,QWORD PTR [rip+0x5e86]        # 9208 <walloc_heap_size>
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
    3382:	c1 e0 10             	shl    eax,0x10
    3385:	48 63 d8             	movsxd rbx,eax
	if(!walloc_heap_size)
    3388:	48 85 ff             	test   rdi,rdi
    338b:	75 63                	jne    33f0 <allocate_pages.constprop.0+0x90>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
    338d:	48 8b 3d 54 2c 00 00 	mov    rdi,QWORD PTR [rip+0x2c54]        # 5fe8 <__heap_base-0x3288>
    3394:	be 00 00 01 00       	mov    esi,0x10000
    3399:	e8 a2 fc ff ff       	call   3040 <align>
		walloc_heap_size = preallocated;
    339e:	48 89 1d 63 5e 00 00 	mov    QWORD PTR [rip+0x5e63],rbx        # 9208 <walloc_heap_size>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
    33a5:	49 89 c0             	mov    r8,rax
	if(preallocated < needed)
    33a8:	49 39 dc             	cmp    r12,rbx
    33ab:	0f 87 94 00 00 00    	ja     3445 <allocate_pages.constprop.0+0xe5>
	ASSERT(size);
    33b1:	48 85 db             	test   rbx,rbx
    33b4:	0f 84 4a dd ff ff    	je     1104 <allocate_pages.constprop.0.cold>
	ASSERT_ALIGNED(size, PAGE_SIZE);
    33ba:	be 00 00 01 00       	mov    esi,0x10000
    33bf:	48 89 df             	mov    rdi,rbx
    33c2:	e8 79 fc ff ff       	call   3040 <align>
    33c7:	48 39 c3             	cmp    rbx,rax
    33ca:	0f 85 34 dd ff ff    	jne    1104 <allocate_pages.constprop.0.cold>
	*n_allocated = size / PAGE_SIZE;
    33d0:	48 c1 eb 10          	shr    rbx,0x10
    33d4:	48 89 5d 00          	mov    QWORD PTR [rbp+0x0],rbx
}
    33d8:	48 83 c4 08          	add    rsp,0x8
    33dc:	4c 89 c0             	mov    rax,r8
    33df:	5b                   	pop    rbx
    33e0:	5d                   	pop    rbp
    33e1:	41 5c                	pop    r12
    33e3:	41 5d                	pop    r13
    33e5:	c3                   	ret    
    33e6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    33ed:	00 00 00 
	if(preallocated < needed)
    33f0:	4d 85 e4             	test   r12,r12
    33f3:	74 5e                	je     3453 <allocate_pages.constprop.0+0xf3>
	uintptr_t preallocated = 0, grow = 0;
    33f5:	45 31 ed             	xor    r13d,r13d
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
    33f8:	4c 89 e6             	mov    rsi,r12
    33fb:	48 d1 ef             	shr    rdi,1
    33fe:	e8 2d fc ff ff       	call   3030 <max>
    3403:	be 00 00 01 00       	mov    esi,0x10000
    3408:	48 89 c7             	mov    rdi,rax
    340b:	e8 30 fc ff ff       	call   3040 <align>
    3410:	49 89 c4             	mov    r12,rax
		ASSERT(grow);
    3413:	48 85 c0             	test   rax,rax
    3416:	0f 84 e8 dc ff ff    	je     1104 <allocate_pages.constprop.0.cold>
		if(sbrk(grow) == -1) // >> PAGE_SIZE_LOG_2
    341c:	48 89 c7             	mov    rdi,rax
    341f:	e8 4c dc ff ff       	call   1070 <sbrk@plt>
    3424:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
    3428:	74 16                	je     3440 <allocate_pages.constprop.0+0xe0>
	size_t size = grow + preallocated;
    342a:	49 89 d8             	mov    r8,rbx
		walloc_heap_size += grow;
    342d:	4c 01 25 d4 5d 00 00 	add    QWORD PTR [rip+0x5dd4],r12        # 9208 <walloc_heap_size>
	size_t size = grow + preallocated;
    3434:	4b 8d 1c 2c          	lea    rbx,[r12+r13*1]
    3438:	e9 74 ff ff ff       	jmp    33b1 <allocate_pages.constprop.0+0x51>
    343d:	0f 1f 00             	nop    DWORD PTR [rax]
			return NULL;
    3440:	45 31 c0             	xor    r8d,r8d
    3443:	eb 93                	jmp    33d8 <allocate_pages.constprop.0+0x78>
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
    3445:	49 29 dc             	sub    r12,rbx
    3448:	48 89 df             	mov    rdi,rbx
    344b:	49 89 dd             	mov    r13,rbx
		base = heap_base;
    344e:	48 89 c3             	mov    rbx,rax
    3451:	eb a5                	jmp    33f8 <allocate_pages.constprop.0+0x98>
    3453:	e9 ac dc ff ff       	jmp    1104 <allocate_pages.constprop.0.cold>
    3458:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    345f:	00 

0000000000003460 <allocate_large_object>:
{
    3460:	41 54                	push   r12
    3462:	55                   	push   rbp
    3463:	53                   	push   rbx
    3464:	48 89 fb             	mov    rbx,rdi
    3467:	48 83 ec 10          	sub    rsp,0x10
	maybe_compact_free_large_objects();
    346b:	e8 f0 fd ff ff       	call   3260 <maybe_compact_free_large_objects>
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
    3470:	48 8b 15 99 5d 00 00 	mov    rdx,QWORD PTR [rip+0x5d99]        # 9210 <large_objects>
    3477:	48 85 d2             	test   rdx,rdx
    347a:	0f 84 da 01 00 00    	je     365a <allocate_large_object+0x1fa>
    3480:	4c 8d 0d 89 5d 00 00 	lea    r9,[rip+0x5d89]        # 9210 <large_objects>
	size_t best_size = -1;
    3487:	49 c7 c0 ff ff ff ff 	mov    r8,0xffffffffffffffff
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
    348e:	48 8d 7b 10          	lea    rdi,[rbx+0x10]
	struct large_object *best = NULL, **best_prev = &large_objects;
    3492:	45 31 d2             	xor    r10d,r10d
    3495:	4c 89 cd             	mov    rbp,r9
    3498:	eb 11                	jmp    34ab <allocate_large_object+0x4b>
    349a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		prev = &walk->next, walk = walk->next)
    34a0:	49 89 d1             	mov    r9,rdx
    34a3:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
    34a6:	48 85 d2             	test   rdx,rdx
    34a9:	74 39                	je     34e4 <allocate_large_object+0x84>
		if(walk->size >= size && walk->size < best_size)
    34ab:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
    34af:	4c 39 c1             	cmp    rcx,r8
    34b2:	73 ec                	jae    34a0 <allocate_large_object+0x40>
    34b4:	48 39 d9             	cmp    rcx,rbx
    34b7:	72 e7                	jb     34a0 <allocate_large_object+0x40>
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
    34b9:	be 00 01 00 00       	mov    esi,0x100
    34be:	e8 7d fb ff ff       	call   3040 <align>
			if(best_size + LARGE_OBJECT_HEADER_SIZE ==
    34c3:	48 8d 71 10          	lea    rsi,[rcx+0x10]
    34c7:	48 39 c6             	cmp    rsi,rax
    34ca:	0f 84 88 02 00 00    	je     3758 <allocate_large_object+0x2f8>
    34d0:	4c 89 cd             	mov    rbp,r9
    34d3:	49 89 d2             	mov    r10,rdx
		prev = &walk->next, walk = walk->next)
    34d6:	49 89 d1             	mov    r9,rdx
    34d9:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
    34dc:	49 89 c8             	mov    r8,rcx
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
    34df:	48 85 d2             	test   rdx,rdx
    34e2:	75 c7                	jne    34ab <allocate_large_object+0x4b>
	if(!best)
    34e4:	4d 85 d2             	test   r10,r10
    34e7:	0f 84 7b 01 00 00    	je     3668 <allocate_large_object+0x208>
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
    34ed:	4c 89 d7             	mov    rdi,r10
    34f0:	ba ff 00 00 00       	mov    edx,0xff
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
    34f5:	4c 89 c1             	mov    rcx,r8
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
    34f8:	e8 13 fc ff ff       	call   3110 <get_chunk_index>
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
    34fd:	48 29 d9             	sub    rcx,rbx
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
    3500:	89 c6                	mov    esi,eax
    3502:	e8 f9 fb ff ff       	call   3100 <get_page>
    3507:	48 89 c7             	mov    rdi,rax
    350a:	49 89 c1             	mov    r9,rax
    350d:	e8 2e fc ff ff       	call   3140 <allocate_chunk>
	struct large_object* next = best->next;
    3512:	49 8b 02             	mov    rax,QWORD PTR [r10]
	*best_prev = next;
    3515:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
	if(tail_size)
    3519:	48 81 e1 00 ff ff ff 	and    rcx,0xffffffffffffff00
    3520:	75 36                	jne    3558 <allocate_large_object+0xf8>
	ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(best) + best->size), CHUNK_SIZE);
    3522:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
    3526:	4c 89 d7             	mov    rdi,r10
    3529:	be 00 01 00 00       	mov    esi,0x100
    352e:	e8 ed fb ff ff       	call   3120 <get_large_object_payload>
    3533:	48 01 c2             	add    rdx,rax
    3536:	48 89 d7             	mov    rdi,rdx
    3539:	e8 02 fb ff ff       	call   3040 <align>
    353e:	48 39 c2             	cmp    rdx,rax
    3541:	0f 85 bf db ff ff    	jne    1106 <allocate_large_object.cold>
}
    3547:	48 83 c4 10          	add    rsp,0x10
    354b:	4c 89 d0             	mov    rax,r10
    354e:	5b                   	pop    rbx
    354f:	5d                   	pop    rbp
    3550:	41 5c                	pop    r12
    3552:	c3                   	ret    
    3553:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		char* start = get_large_object_payload(best);
    3558:	4c 89 d7             	mov    rdi,r10
    355b:	e8 c0 fb ff ff       	call   3120 <get_large_object_payload>
		if(start_page == get_page(end - tail_size - 1))
    3560:	48 89 cf             	mov    rdi,rcx
		char* end = start + best_size;
    3563:	4e 8d 1c 00          	lea    r11,[rax+r8*1]
		if(start_page == get_page(end - tail_size - 1))
    3567:	48 f7 d7             	not    rdi
		char* start = get_large_object_payload(best);
    356a:	48 89 c5             	mov    rbp,rax
		if(start_page == get_page(end - tail_size - 1))
    356d:	4c 01 df             	add    rdi,r11
    3570:	e8 8b fb ff ff       	call   3100 <get_page>
    3575:	49 39 c1             	cmp    r9,rax
    3578:	0f 84 e8 01 00 00    	je     3766 <allocate_large_object+0x306>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
    357e:	be 00 00 01 00       	mov    esi,0x10000
    3583:	4c 89 df             	mov    rdi,r11
    3586:	e8 b5 fa ff ff       	call   3040 <align>
		else if(size < PAGE_SIZE - LARGE_OBJECT_HEADER_SIZE - CHUNK_SIZE)
    358b:	48 81 fb ef fe 00 00 	cmp    rbx,0xfeef
    3592:	0f 86 38 01 00 00    	jbe    36d0 <allocate_large_object+0x270>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
    3598:	4c 39 d8             	cmp    rax,r11
    359b:	0f 85 65 db ff ff    	jne    1106 <allocate_large_object.cold>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
    35a1:	0f b7 ed             	movzx  ebp,bp
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
    35a4:	be 00 00 01 00       	mov    esi,0x10000
    35a9:	48 8d bc 1d 00 00 ff 	lea    rdi,[rbp+rbx*1-0x10000]
    35b0:	ff 
			tail_size = best_size - size;
    35b1:	4a 8d 8c 05 00 00 ff 	lea    rcx,[rbp+r8*1-0x10000]
    35b8:	ff 
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
    35b9:	e8 82 fa ff ff       	call   3040 <align>
		best->size -= tail_size;
    35be:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
			tail_size = best_size - size;
    35c2:	48 29 c1             	sub    rcx,rax
		best->size -= tail_size;
    35c5:	48 29 ca             	sub    rdx,rcx
		unsigned tail_idx = get_chunk_index(end - tail_size);
    35c8:	4c 89 df             	mov    rdi,r11
		best->size -= tail_size;
    35cb:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
    35cf:	48 29 cf             	sub    rdi,rcx
    35d2:	e8 39 fb ff ff       	call   3110 <get_chunk_index>
    35d7:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
    35d9:	48 85 c9             	test   rcx,rcx
    35dc:	0f 84 44 ff ff ff    	je     3526 <allocate_large_object+0xc6>
    35e2:	85 c0                	test   eax,eax
    35e4:	75 0c                	jne    35f2 <allocate_large_object+0x192>
			tail_size -= CHUNK_SIZE;
    35e6:	48 81 e9 00 01 00 00 	sub    rcx,0x100
			tail_idx++;
    35ed:	be 01 00 00 00       	mov    esi,0x1
		if(tail_size)
    35f2:	48 85 c9             	test   rcx,rcx
    35f5:	0f 84 2b ff ff ff    	je     3526 <allocate_large_object+0xc6>
			struct page* page = get_page(end - tail_size);
    35fb:	4c 89 df             	mov    rdi,r11
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
    35fe:	ba fe 00 00 00       	mov    edx,0xfe
			struct page* page = get_page(end - tail_size);
    3603:	48 29 cf             	sub    rdi,rcx
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
    3606:	48 83 e9 10          	sub    rcx,0x10
			struct page* page = get_page(end - tail_size);
    360a:	e8 f1 fa ff ff       	call   3100 <get_page>
    360f:	48 89 c7             	mov    rdi,rax
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
    3612:	e8 29 fb ff ff       	call   3140 <allocate_chunk>
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
    3617:	be 00 01 00 00       	mov    esi,0x100
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
    361c:	48 89 c2             	mov    rdx,rax
			tail->next = large_objects;
    361f:	48 8b 05 ea 5b 00 00 	mov    rax,QWORD PTR [rip+0x5bea]        # 9210 <large_objects>
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
    3626:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
    362a:	48 89 d7             	mov    rdi,rdx
			tail->next = large_objects;
    362d:	48 89 02             	mov    QWORD PTR [rdx],rax
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
    3630:	e8 eb fa ff ff       	call   3120 <get_large_object_payload>
    3635:	48 01 c1             	add    rcx,rax
    3638:	48 89 cf             	mov    rdi,rcx
    363b:	e8 00 fa ff ff       	call   3040 <align>
    3640:	48 39 c1             	cmp    rcx,rax
    3643:	0f 85 bd da ff ff    	jne    1106 <allocate_large_object.cold>
			large_objects = tail;
    3649:	48 89 15 c0 5b 00 00 	mov    QWORD PTR [rip+0x5bc0],rdx        # 9210 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
    3650:	e8 fb fa ff ff       	call   3150 <maybe_repurpose_single_chunk_large_objects_head>
    3655:	e9 c8 fe ff ff       	jmp    3522 <allocate_large_object+0xc2>
	struct large_object *best = NULL, **best_prev = &large_objects;
    365a:	48 8d 2d af 5b 00 00 	lea    rbp,[rip+0x5baf]        # 9210 <large_objects>
    3661:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
		size_t size_with_header = size + sizeof(struct large_object);
    3668:	4c 8d 63 10          	lea    r12,[rbx+0x10]
		struct page* page = allocate_pages(size_with_header, &n_allocated);
    366c:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
		size_t n_allocated = 0;
    3671:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
    3678:	00 00 
		struct page* page = allocate_pages(size_with_header, &n_allocated);
    367a:	4c 89 e7             	mov    rdi,r12
    367d:	e8 de fc ff ff       	call   3360 <allocate_pages.constprop.0>
    3682:	48 89 c1             	mov    rcx,rax
		if(!page)
    3685:	48 85 c0             	test   rax,rax
    3688:	0f 84 10 01 00 00    	je     379e <allocate_large_object+0x33e>
		char* ptr = allocate_chunk(page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
    368e:	ba ff 00 00 00       	mov    edx,0xff
    3693:	be 01 00 00 00       	mov    esi,0x1
    3698:	48 89 c7             	mov    rdi,rax
    369b:	e8 a0 fa ff ff       	call   3140 <allocate_chunk>
    36a0:	49 89 c2             	mov    r10,rax
		best->next = large_objects;
    36a3:	48 8b 05 66 5b 00 00 	mov    rax,QWORD PTR [rip+0x5b66]        # 9210 <large_objects>
		size_t page_header = ptr - ((char*)page);
    36aa:	4c 29 d1             	sub    rcx,r10
		best->next = large_objects;
    36ad:	49 89 02             	mov    QWORD PTR [r10],rax
		best->size = best_size = n_allocated * PAGE_SIZE - page_header - LARGE_OBJECT_HEADER_SIZE;
    36b0:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
    36b5:	48 c1 e0 10          	shl    rax,0x10
    36b9:	4c 8d 44 01 f0       	lea    r8,[rcx+rax*1-0x10]
    36be:	4d 89 42 08          	mov    QWORD PTR [r10+0x8],r8
		ASSERT(best_size >= size_with_header);
    36c2:	4d 39 c4             	cmp    r12,r8
    36c5:	0f 86 22 fe ff ff    	jbe    34ed <allocate_large_object+0x8d>
    36cb:	e9 36 da ff ff       	jmp    1106 <allocate_large_object.cold>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
    36d0:	4c 39 d8             	cmp    rax,r11
    36d3:	0f 85 2d da ff ff    	jne    1106 <allocate_large_object.cold>
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
    36d9:	48 89 ef             	mov    rdi,rbp
    36dc:	ba fe 00 00 00       	mov    edx,0xfe
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
    36e1:	44 0f b7 e5          	movzx  r12d,bp
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
    36e5:	e8 26 fa ff ff       	call   3110 <get_chunk_index>
    36ea:	4c 89 cf             	mov    rdi,r9
    36ed:	89 c6                	mov    esi,eax
    36ef:	e8 4c fa ff ff       	call   3140 <allocate_chunk>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
    36f4:	b8 00 00 01 00       	mov    eax,0x10000
    36f9:	4c 29 e0             	sub    rax,r12
    36fc:	49 89 42 08          	mov    QWORD PTR [r10+0x8],rax
			head->next = large_objects;
    3700:	48 8b 05 09 5b 00 00 	mov    rax,QWORD PTR [rip+0x5b09]        # 9210 <large_objects>
    3707:	49 89 02             	mov    QWORD PTR [r10],rax
			large_objects = head;
    370a:	4c 89 15 ff 5a 00 00 	mov    QWORD PTR [rip+0x5aff],r10        # 9210 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
    3711:	e8 3a fa ff ff       	call   3150 <maybe_repurpose_single_chunk_large_objects_head>
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
    3716:	ba ff 00 00 00       	mov    edx,0xff
    371b:	be 01 00 00 00       	mov    esi,0x1
			struct page* next_page = start_page + 1;
    3720:	49 8d b9 00 00 01 00 	lea    rdi,[r9+0x10000]
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
    3727:	e8 14 fa ff ff       	call   3140 <allocate_chunk>
			best->size = best_size =
    372c:	4b 8d 94 04 f0 fe fe 	lea    rdx,[r12+r8*1-0x10110]
    3733:	ff 
    3734:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
    3738:	49 89 c2             	mov    r10,rax
			ASSERT(best_size >= size);
    373b:	48 39 d3             	cmp    rbx,rdx
    373e:	0f 87 c2 d9 ff ff    	ja     1106 <allocate_large_object.cold>
			tail_size = (best_size - size) & ~CHUNK_MASK;
    3744:	48 89 d1             	mov    rcx,rdx
    3747:	48 29 d9             	sub    rcx,rbx
    374a:	30 c9                	xor    cl,cl
    374c:	e9 74 fe ff ff       	jmp    35c5 <allocate_large_object+0x165>
    3751:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    3758:	4c 89 cd             	mov    rbp,r9
    375b:	49 89 c8             	mov    r8,rcx
    375e:	49 89 d2             	mov    r10,rdx
    3761:	e9 87 fd ff ff       	jmp    34ed <allocate_large_object+0x8d>
			ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
    3766:	be 00 01 00 00       	mov    esi,0x100
    376b:	4c 89 df             	mov    rdi,r11
    376e:	e8 cd f8 ff ff       	call   3040 <align>
    3773:	49 39 c3             	cmp    r11,rax
    3776:	0f 85 8a d9 ff ff    	jne    1106 <allocate_large_object.cold>
		best->size -= tail_size;
    377c:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
		unsigned tail_idx = get_chunk_index(end - tail_size);
    3780:	48 29 cf             	sub    rdi,rcx
		best->size -= tail_size;
    3783:	48 29 ca             	sub    rdx,rcx
    3786:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
    378a:	e8 81 f9 ff ff       	call   3110 <get_chunk_index>
    378f:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
    3791:	85 c0                	test   eax,eax
    3793:	0f 84 4d fe ff ff    	je     35e6 <allocate_large_object+0x186>
    3799:	e9 5d fe ff ff       	jmp    35fb <allocate_large_object+0x19b>
			return NULL;
    379e:	45 31 d2             	xor    r10d,r10d
    37a1:	e9 a1 fd ff ff       	jmp    3547 <allocate_large_object+0xe7>
    37a6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    37ad:	00 00 00 

00000000000037b0 <allocate_large>:
{
    37b0:	48 83 ec 08          	sub    rsp,0x8
	struct large_object* obj = allocate_large_object(size);
    37b4:	e8 a7 fc ff ff       	call   3460 <allocate_large_object>
	return obj ? get_large_object_payload(obj) : NULL;
    37b9:	48 85 c0             	test   rax,rax
    37bc:	74 12                	je     37d0 <allocate_large+0x20>
    37be:	48 89 c7             	mov    rdi,rax
}
    37c1:	48 83 c4 08          	add    rsp,0x8
	return obj ? get_large_object_payload(obj) : NULL;
    37c5:	e9 56 f9 ff ff       	jmp    3120 <get_large_object_payload>
    37ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
}
    37d0:	31 c0                	xor    eax,eax
    37d2:	48 83 c4 08          	add    rsp,0x8
    37d6:	c3                   	ret    
    37d7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    37de:	00 00 

00000000000037e0 <obtain_small_objects>:
{
    37e0:	55                   	push   rbp
    37e1:	89 fd                	mov    ebp,edi
	if(*whole_chunk_freelist)
    37e3:	48 8b 3d 7e 5a 00 00 	mov    rdi,QWORD PTR [rip+0x5a7e]        # 9268 <small_object_freelists+0x48>
    37ea:	48 85 ff             	test   rdi,rdi
    37ed:	74 71                	je     3860 <obtain_small_objects+0x80>
		*whole_chunk_freelist = (*whole_chunk_freelist)->next;
    37ef:	48 8b 07             	mov    rax,QWORD PTR [rdi]
    37f2:	48 89 05 6f 5a 00 00 	mov    QWORD PTR [rip+0x5a6f],rax        # 9268 <small_object_freelists+0x48>
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
    37f9:	e8 12 f9 ff ff       	call   3110 <get_chunk_index>
    37fe:	89 ea                	mov    edx,ebp
    3800:	89 c6                	mov    esi,eax
    3802:	e8 f9 f8 ff ff       	call   3100 <get_page>
    3807:	48 89 c7             	mov    rdi,rax
    380a:	e8 31 f9 ff ff       	call   3140 <allocate_chunk>
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
    380f:	89 ef                	mov    edi,ebp
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
    3811:	48 89 c2             	mov    rdx,rax
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
    3814:	e8 c7 f8 ff ff       	call   30e0 <chunk_kind_to_granules>
    3819:	8d 34 c5 00 00 00 00 	lea    esi,[rax*8+0x0]
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
    3820:	48 81 fe 00 01 00 00 	cmp    rsi,0x100
    3827:	77 46                	ja     386f <obtain_small_objects+0x8f>
    3829:	48 89 d0             	mov    rax,rdx
    382c:	48 89 f1             	mov    rcx,rsi
    382f:	48 29 f0             	sub    rax,rsi
    3832:	48 8d 90 00 01 00 00 	lea    rdx,[rax+0x100]
	struct freelist* next = NULL;
    3839:	31 c0                	xor    eax,eax
    383b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		struct freelist* head = (struct freelist*)(end - i);
    3840:	48 89 c7             	mov    rdi,rax
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
    3843:	48 01 f1             	add    rcx,rsi
		struct freelist* head = (struct freelist*)(end - i);
    3846:	48 89 d0             	mov    rax,rdx
		head->next = next;
    3849:	48 89 3a             	mov    QWORD PTR [rdx],rdi
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
    384c:	48 29 f2             	sub    rdx,rsi
    384f:	48 81 f9 00 01 00 00 	cmp    rcx,0x100
    3856:	76 e8                	jbe    3840 <obtain_small_objects+0x60>
}
    3858:	5d                   	pop    rbp
    3859:	c3                   	ret    
    385a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		chunk = allocate_large_object(0);
    3860:	31 ff                	xor    edi,edi
    3862:	e8 f9 fb ff ff       	call   3460 <allocate_large_object>
    3867:	48 89 c7             	mov    rdi,rax
		if(!chunk)
    386a:	48 85 c0             	test   rax,rax
    386d:	75 8a                	jne    37f9 <obtain_small_objects+0x19>
			return NULL;
    386f:	31 c0                	xor    eax,eax
}
    3871:	5d                   	pop    rbp
    3872:	c3                   	ret    
    3873:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    387a:	00 00 00 
    387d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000003880 <allocate_small>:
{
    3880:	53                   	push   rbx
    3881:	41 89 f8             	mov    r8d,edi
	struct freelist** loc = get_small_object_freelist(kind);
    3884:	e8 17 fa ff ff       	call   32a0 <get_small_object_freelist>
    3889:	48 89 c3             	mov    rbx,rax
	if(!*loc)
    388c:	48 8b 00             	mov    rax,QWORD PTR [rax]
    388f:	48 85 c0             	test   rax,rax
    3892:	74 0c                	je     38a0 <allocate_small+0x20>
	*loc = ret->next;
    3894:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    3897:	48 89 13             	mov    QWORD PTR [rbx],rdx
}
    389a:	5b                   	pop    rbx
    389b:	c3                   	ret    
    389c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		struct freelist* freelist = obtain_small_objects(kind);
    38a0:	44 89 c7             	mov    edi,r8d
    38a3:	e8 38 ff ff ff       	call   37e0 <obtain_small_objects>
		if(!freelist)
    38a8:	48 85 c0             	test   rax,rax
    38ab:	74 ed                	je     389a <allocate_small+0x1a>
		*loc = freelist;
    38ad:	48 89 03             	mov    QWORD PTR [rbx],rax
    38b0:	eb e2                	jmp    3894 <allocate_small+0x14>
    38b2:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    38b9:	00 00 00 
    38bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000000038c0 <malloc>:
{
    38c0:	f3 0f 1e fa          	endbr64 
    38c4:	48 83 ec 08          	sub    rsp,0x8
    38c8:	49 89 f8             	mov    r8,rdi
	size_t granules = size_to_granules(size);
    38cb:	e8 d0 f8 ff ff       	call   31a0 <size_to_granules>
	enum chunk_kind kind = granules_to_chunk_kind(granules);
    38d0:	89 c7                	mov    edi,eax
    38d2:	e8 79 f7 ff ff       	call   3050 <granules_to_chunk_kind>
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
    38d7:	3d ff 00 00 00       	cmp    eax,0xff
    38dc:	74 12                	je     38f0 <malloc+0x30>
    38de:	89 c7                	mov    edi,eax
}
    38e0:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
    38e4:	e9 97 ff ff ff       	jmp    3880 <allocate_small>
    38e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    38f0:	4c 89 c7             	mov    rdi,r8
}
    38f3:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
    38f7:	e9 b4 fe ff ff       	jmp    37b0 <allocate_large>
    38fc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000003900 <reg_dev>:
    3900:	55                   	push   rbp
    3901:	48 89 e5             	mov    rbp,rsp
    3904:	b8 00 00 00 00       	mov    eax,0x0
    3909:	55                   	push   rbp
    390a:	48 0f 05             	rex.W syscall 
    390d:	5d                   	pop    rbp
    390e:	c9                   	leave  
    390f:	c3                   	ret    

0000000000003910 <dispose_dev>:
    3910:	55                   	push   rbp
    3911:	48 89 e5             	mov    rbp,rsp
    3914:	b8 01 00 00 00       	mov    eax,0x1
    3919:	55                   	push   rbp
    391a:	48 0f 05             	rex.W syscall 
    391d:	5d                   	pop    rbp
    391e:	c9                   	leave  
    391f:	c3                   	ret    

0000000000003920 <reg_drv>:
    3920:	55                   	push   rbp
    3921:	48 89 e5             	mov    rbp,rsp
    3924:	b8 02 00 00 00       	mov    eax,0x2
    3929:	55                   	push   rbp
    392a:	48 0f 05             	rex.W syscall 
    392d:	5d                   	pop    rbp
    392e:	c9                   	leave  
    392f:	c3                   	ret    

0000000000003930 <dispose_drv>:
    3930:	55                   	push   rbp
    3931:	48 89 e5             	mov    rbp,rsp
    3934:	b8 03 00 00 00       	mov    eax,0x3
    3939:	55                   	push   rbp
    393a:	48 0f 05             	rex.W syscall 
    393d:	5d                   	pop    rbp
    393e:	c9                   	leave  
    393f:	c3                   	ret    

0000000000003940 <call_drvfunc>:
    3940:	55                   	push   rbp
    3941:	48 89 e5             	mov    rbp,rsp
    3944:	b8 04 00 00 00       	mov    eax,0x4
    3949:	55                   	push   rbp
    394a:	48 0f 05             	rex.W syscall 
    394d:	5d                   	pop    rbp
    394e:	c9                   	leave  
    394f:	c3                   	ret    

0000000000003950 <req_mem>:
    3950:	55                   	push   rbp
    3951:	48 89 e5             	mov    rbp,rsp
    3954:	b8 05 00 00 00       	mov    eax,0x5
    3959:	55                   	push   rbp
    395a:	48 0f 05             	rex.W syscall 
    395d:	5d                   	pop    rbp
    395e:	c9                   	leave  
    395f:	c3                   	ret    

0000000000003960 <free_mem>:
    3960:	55                   	push   rbp
    3961:	48 89 e5             	mov    rbp,rsp
    3964:	b8 06 00 00 00       	mov    eax,0x6
    3969:	55                   	push   rbp
    396a:	48 0f 05             	rex.W syscall 
    396d:	5d                   	pop    rbp
    396e:	c9                   	leave  
    396f:	c3                   	ret    

0000000000003970 <reg_proc>:
    3970:	55                   	push   rbp
    3971:	48 89 e5             	mov    rbp,rsp
    3974:	b8 07 00 00 00       	mov    eax,0x7
    3979:	55                   	push   rbp
    397a:	48 0f 05             	rex.W syscall 
    397d:	5d                   	pop    rbp
    397e:	c9                   	leave  
    397f:	c3                   	ret    

0000000000003980 <del_proc>:
    3980:	55                   	push   rbp
    3981:	48 89 e5             	mov    rbp,rsp
    3984:	b8 08 00 00 00       	mov    eax,0x8
    3989:	55                   	push   rbp
    398a:	48 0f 05             	rex.W syscall 
    398d:	5d                   	pop    rbp
    398e:	c9                   	leave  
    398f:	c3                   	ret    

0000000000003990 <get_proc_addr>:
    3990:	55                   	push   rbp
    3991:	48 89 e5             	mov    rbp,rsp
    3994:	b8 09 00 00 00       	mov    eax,0x9
    3999:	55                   	push   rbp
    399a:	48 0f 05             	rex.W syscall 
    399d:	5d                   	pop    rbp
    399e:	c9                   	leave  
    399f:	c3                   	ret    

00000000000039a0 <chk_vm>:
    39a0:	55                   	push   rbp
    39a1:	48 89 e5             	mov    rbp,rsp
    39a4:	b8 0a 00 00 00       	mov    eax,0xa
    39a9:	55                   	push   rbp
    39aa:	48 0f 05             	rex.W syscall 
    39ad:	5d                   	pop    rbp
    39ae:	c9                   	leave  
    39af:	c3                   	ret    

00000000000039b0 <open>:
    39b0:	55                   	push   rbp
    39b1:	48 89 e5             	mov    rbp,rsp
    39b4:	b8 0b 00 00 00       	mov    eax,0xb
    39b9:	55                   	push   rbp
    39ba:	48 0f 05             	rex.W syscall 
    39bd:	5d                   	pop    rbp
    39be:	c9                   	leave  
    39bf:	c3                   	ret    

00000000000039c0 <close>:
    39c0:	55                   	push   rbp
    39c1:	48 89 e5             	mov    rbp,rsp
    39c4:	b8 0c 00 00 00       	mov    eax,0xc
    39c9:	55                   	push   rbp
    39ca:	48 0f 05             	rex.W syscall 
    39cd:	5d                   	pop    rbp
    39ce:	c9                   	leave  
    39cf:	c3                   	ret    

00000000000039d0 <read>:
    39d0:	55                   	push   rbp
    39d1:	48 89 e5             	mov    rbp,rsp
    39d4:	b8 0d 00 00 00       	mov    eax,0xd
    39d9:	55                   	push   rbp
    39da:	48 0f 05             	rex.W syscall 
    39dd:	5d                   	pop    rbp
    39de:	c9                   	leave  
    39df:	c3                   	ret    

00000000000039e0 <write>:
    39e0:	55                   	push   rbp
    39e1:	48 89 e5             	mov    rbp,rsp
    39e4:	b8 0e 00 00 00       	mov    eax,0xe
    39e9:	55                   	push   rbp
    39ea:	48 0f 05             	rex.W syscall 
    39ed:	5d                   	pop    rbp
    39ee:	c9                   	leave  
    39ef:	c3                   	ret    

00000000000039f0 <seek>:
    39f0:	55                   	push   rbp
    39f1:	48 89 e5             	mov    rbp,rsp
    39f4:	b8 0f 00 00 00       	mov    eax,0xf
    39f9:	55                   	push   rbp
    39fa:	48 0f 05             	rex.W syscall 
    39fd:	5d                   	pop    rbp
    39fe:	c9                   	leave  
    39ff:	c3                   	ret    

0000000000003a00 <tell>:
    3a00:	55                   	push   rbp
    3a01:	48 89 e5             	mov    rbp,rsp
    3a04:	b8 10 00 00 00       	mov    eax,0x10
    3a09:	55                   	push   rbp
    3a0a:	48 0f 05             	rex.W syscall 
    3a0d:	5d                   	pop    rbp
    3a0e:	c9                   	leave  
    3a0f:	c3                   	ret    

0000000000003a10 <reg_vol>:
    3a10:	55                   	push   rbp
    3a11:	48 89 e5             	mov    rbp,rsp
    3a14:	b8 11 00 00 00       	mov    eax,0x11
    3a19:	55                   	push   rbp
    3a1a:	48 0f 05             	rex.W syscall 
    3a1d:	5d                   	pop    rbp
    3a1e:	c9                   	leave  
    3a1f:	c3                   	ret    

0000000000003a20 <free_vol>:
    3a20:	55                   	push   rbp
    3a21:	48 89 e5             	mov    rbp,rsp
    3a24:	b8 12 00 00 00       	mov    eax,0x12
    3a29:	55                   	push   rbp
    3a2a:	48 0f 05             	rex.W syscall 
    3a2d:	5d                   	pop    rbp
    3a2e:	c9                   	leave  
    3a2f:	c3                   	ret    

0000000000003a30 <exec>:
    3a30:	55                   	push   rbp
    3a31:	48 89 e5             	mov    rbp,rsp
    3a34:	b8 13 00 00 00       	mov    eax,0x13
    3a39:	55                   	push   rbp
    3a3a:	48 0f 05             	rex.W syscall 
    3a3d:	5d                   	pop    rbp
    3a3e:	c9                   	leave  
    3a3f:	c3                   	ret    

0000000000003a40 <exit>:
    3a40:	55                   	push   rbp
    3a41:	48 89 e5             	mov    rbp,rsp
    3a44:	b8 14 00 00 00       	mov    eax,0x14
    3a49:	55                   	push   rbp
    3a4a:	48 0f 05             	rex.W syscall 
    3a4d:	5d                   	pop    rbp
    3a4e:	c9                   	leave  
    3a4f:	c3                   	ret    

0000000000003a50 <abort>:
    3a50:	55                   	push   rbp
    3a51:	48 89 e5             	mov    rbp,rsp
    3a54:	b8 14 00 00 00       	mov    eax,0x14
    3a59:	55                   	push   rbp
    3a5a:	48 0f 05             	rex.W syscall 
    3a5d:	5d                   	pop    rbp
    3a5e:	c9                   	leave  
    3a5f:	c3                   	ret    

0000000000003a60 <call>:
    3a60:	55                   	push   rbp
    3a61:	48 89 e5             	mov    rbp,rsp
    3a64:	b8 15 00 00 00       	mov    eax,0x15
    3a69:	55                   	push   rbp
    3a6a:	48 0f 05             	rex.W syscall 
    3a6d:	5d                   	pop    rbp
    3a6e:	c9                   	leave  
    3a6f:	c3                   	ret    

0000000000003a70 <mkfifo>:
    3a70:	55                   	push   rbp
    3a71:	48 89 e5             	mov    rbp,rsp
    3a74:	b8 16 00 00 00       	mov    eax,0x16
    3a79:	55                   	push   rbp
    3a7a:	48 0f 05             	rex.W syscall 
    3a7d:	5d                   	pop    rbp
    3a7e:	c9                   	leave  
    3a7f:	c3                   	ret    

0000000000003a80 <brk>:
    3a80:	55                   	push   rbp
    3a81:	48 89 e5             	mov    rbp,rsp
    3a84:	b8 17 00 00 00       	mov    eax,0x17
    3a89:	55                   	push   rbp
    3a8a:	48 0f 05             	rex.W syscall 
    3a8d:	5d                   	pop    rbp
    3a8e:	c9                   	leave  
    3a8f:	c3                   	ret    

0000000000003a90 <find_dev>:
    3a90:	55                   	push   rbp
    3a91:	48 89 e5             	mov    rbp,rsp
    3a94:	b8 19 00 00 00       	mov    eax,0x19
    3a99:	55                   	push   rbp
    3a9a:	48 0f 05             	rex.W syscall 
    3a9d:	5d                   	pop    rbp
    3a9e:	c9                   	leave  
    3a9f:	c3                   	ret    

0000000000003aa0 <operate_dev>:
    3aa0:	55                   	push   rbp
    3aa1:	48 89 e5             	mov    rbp,rsp
    3aa4:	b8 1a 00 00 00       	mov    eax,0x1a
    3aa9:	55                   	push   rbp
    3aaa:	48 0f 05             	rex.W syscall 
    3aad:	5d                   	pop    rbp
    3aae:	c9                   	leave  
    3aaf:	c3                   	ret    

0000000000003ab0 <fork>:
    3ab0:	55                   	push   rbp
    3ab1:	48 89 e5             	mov    rbp,rsp
    3ab4:	b8 1b 00 00 00       	mov    eax,0x1b
    3ab9:	55                   	push   rbp
    3aba:	48 0f 05             	rex.W syscall 
    3abd:	5d                   	pop    rbp
    3abe:	c9                   	leave  
    3abf:	c3                   	ret    

0000000000003ac0 <execve>:
    3ac0:	55                   	push   rbp
    3ac1:	48 89 e5             	mov    rbp,rsp
    3ac4:	b8 1c 00 00 00       	mov    eax,0x1c
    3ac9:	55                   	push   rbp
    3aca:	48 0f 05             	rex.W syscall 
    3acd:	5d                   	pop    rbp
    3ace:	c9                   	leave  
    3acf:	c3                   	ret    

0000000000003ad0 <waitpid>:
    3ad0:	55                   	push   rbp
    3ad1:	48 89 e5             	mov    rbp,rsp
    3ad4:	b8 1d 00 00 00       	mov    eax,0x1d
    3ad9:	55                   	push   rbp
    3ada:	48 0f 05             	rex.W syscall 
    3add:	5d                   	pop    rbp
    3ade:	c9                   	leave  
    3adf:	c3                   	ret    

0000000000003ae0 <mmap>:
    3ae0:	55                   	push   rbp
    3ae1:	48 89 e5             	mov    rbp,rsp
    3ae4:	b8 1e 00 00 00       	mov    eax,0x1e
    3ae9:	55                   	push   rbp
    3aea:	48 0f 05             	rex.W syscall 
    3aed:	5d                   	pop    rbp
    3aee:	c9                   	leave  
    3aef:	c3                   	ret    

0000000000003af0 <munmap>:
    3af0:	55                   	push   rbp
    3af1:	48 89 e5             	mov    rbp,rsp
    3af4:	b8 1f 00 00 00       	mov    eax,0x1f
    3af9:	55                   	push   rbp
    3afa:	48 0f 05             	rex.W syscall 
    3afd:	5d                   	pop    rbp
    3afe:	c9                   	leave  
    3aff:	c3                   	ret    

0000000000003b00 <mknod>:
    3b00:	55                   	push   rbp
    3b01:	48 89 e5             	mov    rbp,rsp
    3b04:	b8 21 00 00 00       	mov    eax,0x21
    3b09:	55                   	push   rbp
    3b0a:	48 0f 05             	rex.W syscall 
    3b0d:	5d                   	pop    rbp
    3b0e:	c9                   	leave  
    3b0f:	c3                   	ret    

0000000000003b10 <kb_readc>:
    3b10:	55                   	push   rbp
    3b11:	48 89 e5             	mov    rbp,rsp
    3b14:	b8 64 00 00 00       	mov    eax,0x64
    3b19:	55                   	push   rbp
    3b1a:	48 0f 05             	rex.W syscall 
    3b1d:	5d                   	pop    rbp
    3b1e:	c9                   	leave  
    3b1f:	c3                   	ret    

0000000000003b20 <remove>:
    3b20:	55                   	push   rbp
    3b21:	48 89 e5             	mov    rbp,rsp
    3b24:	b8 22 00 00 00       	mov    eax,0x22
    3b29:	55                   	push   rbp
    3b2a:	48 0f 05             	rex.W syscall 
    3b2d:	5d                   	pop    rbp
    3b2e:	c9                   	leave  
    3b2f:	c3                   	ret    

0000000000003b30 <sbrk>:
    3b30:	55                   	push   rbp
    3b31:	48 89 e5             	mov    rbp,rsp
    3b34:	b8 23 00 00 00       	mov    eax,0x23
    3b39:	55                   	push   rbp
    3b3a:	48 0f 05             	rex.W syscall 
    3b3d:	5d                   	pop    rbp
    3b3e:	c9                   	leave  
    3b3f:	c3                   	ret    

0000000000003b40 <chkmmap>:
    3b40:	55                   	push   rbp
    3b41:	48 89 e5             	mov    rbp,rsp
    3b44:	b8 24 00 00 00       	mov    eax,0x24
    3b49:	55                   	push   rbp
    3b4a:	48 0f 05             	rex.W syscall 
    3b4d:	5d                   	pop    rbp
    3b4e:	c9                   	leave  
    3b4f:	c3                   	ret    
