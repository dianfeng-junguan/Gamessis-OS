
bin/dl.so:     file format elf64-x86-64


Disassembly of section .plt:

0000000000001000 <heap_size_in_pages@plt-0x10>:
    1000:	ff 35 02 50 00 00    	push   QWORD PTR [rip+0x5002]        # 6008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1006:	ff 25 04 50 00 00    	jmp    QWORD PTR [rip+0x5004]        # 6010 <_GLOBAL_OFFSET_TABLE_+0x10>
    100c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000001010 <heap_size_in_pages@plt>:
    1010:	ff 25 02 50 00 00    	jmp    QWORD PTR [rip+0x5002]        # 6018 <heap_size_in_pages+0x2a58>
    1016:	68 00 00 00 00       	push   0x0
    101b:	e9 e0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001020 <get_got@plt>:
    1020:	ff 25 fa 4f 00 00    	jmp    QWORD PTR [rip+0x4ffa]        # 6020 <get_got+0x37fb>
    1026:	68 01 00 00 00       	push   0x1
    102b:	e9 d0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001030 <malloc@plt>:
    1030:	ff 25 f2 4f 00 00    	jmp    QWORD PTR [rip+0x4ff2]        # 6028 <malloc+0x24e8>
    1036:	68 02 00 00 00       	push   0x2
    103b:	e9 c0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001040 <fill_reloc@plt>:
    1040:	ff 25 ea 4f 00 00    	jmp    QWORD PTR [rip+0x4fea]        # 6030 <fill_reloc+0x3660>
    1046:	68 03 00 00 00       	push   0x3
    104b:	e9 b0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001050 <mmap@plt>:
    1050:	ff 25 e2 4f 00 00    	jmp    QWORD PTR [rip+0x4fe2]        # 6038 <mmap+0x22d8>
    1056:	68 04 00 00 00       	push   0x4
    105b:	e9 a0 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001060 <read@plt>:
    1060:	ff 25 da 4f 00 00    	jmp    QWORD PTR [rip+0x4fda]        # 6040 <read+0x23f0>
    1066:	68 05 00 00 00       	push   0x5
    106b:	e9 90 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001070 <sbrk@plt>:
    1070:	ff 25 d2 4f 00 00    	jmp    QWORD PTR [rip+0x4fd2]        # 6048 <sbrk+0x2298>
    1076:	68 06 00 00 00       	push   0x6
    107b:	e9 80 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001080 <dlstrcmp@plt>:
    1080:	ff 25 ca 4f 00 00    	jmp    QWORD PTR [rip+0x4fca]        # 6050 <dlstrcmp+0x38c2>
    1086:	68 07 00 00 00       	push   0x7
    108b:	e9 70 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

0000000000001090 <seek@plt>:
    1090:	ff 25 c2 4f 00 00    	jmp    QWORD PTR [rip+0x4fc2]        # 6058 <seek+0x23e8>
    1096:	68 08 00 00 00       	push   0x8
    109b:	e9 60 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010a0 <load_elfso@plt>:
    10a0:	ff 25 ba 4f 00 00    	jmp    QWORD PTR [rip+0x4fba]        # 6060 <load_elfso+0x486c>
    10a6:	68 09 00 00 00       	push   0x9
    10ab:	e9 50 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010b0 <chkmmap@plt>:
    10b0:	ff 25 b2 4f 00 00    	jmp    QWORD PTR [rip+0x4fb2]        # 6068 <chkmmap+0x22a8>
    10b6:	68 0a 00 00 00       	push   0xa
    10bb:	e9 40 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010c0 <open@plt>:
    10c0:	ff 25 aa 4f 00 00    	jmp    QWORD PTR [rip+0x4faa]        # 6070 <open+0x2440>
    10c6:	68 0b 00 00 00       	push   0xb
    10cb:	e9 30 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010d0 <close@plt>:
    10d0:	ff 25 a2 4f 00 00    	jmp    QWORD PTR [rip+0x4fa2]        # 6078 <close+0x2438>
    10d6:	68 0c 00 00 00       	push   0xc
    10db:	e9 20 ff ff ff       	jmp    1000 <heap_size_in_pages@plt-0x10>

00000000000010e0 <free@plt>:
    10e0:	ff 25 9a 4f 00 00    	jmp    QWORD PTR [rip+0x4f9a]        # 6080 <free+0x2b40>
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
    1136:	e8 f1 1a 00 00       	call   2c2c <dl_init>
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
    if (entry == -1) {
    116b:	48 83 7d f8 ff       	cmp    QWORD PTR [rbp-0x8],0xffffffffffffffff
    1170:	75 07                	jne    1179 <dlmain+0x68>
        return -1;
    1172:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1177:	eb 24                	jmp    119d <dlmain+0x8c>
    }
    //跳转到程序入口
    int (*main)(int, char**, char**) = entry;
    1179:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    117d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    main(argc, argv, environ);
    1181:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    1185:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
    1189:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
    118c:	4c 8b 45 f0          	mov    r8,QWORD PTR [rbp-0x10]
    1190:	48 89 ce             	mov    rsi,rcx
    1193:	89 c7                	mov    edi,eax
    1195:	41 ff d0             	call   r8
    return 0;
    1198:	b8 00 00 00 00       	mov    eax,0x0
}
    119d:	c9                   	leave  
    119e:	c3                   	ret    

000000000000119f <load_elfso_old>:
int load_elfso_old(int fno)
{
    119f:	f3 0f 1e fa          	endbr64 
    11a3:	55                   	push   rbp
    11a4:	48 89 e5             	mov    rbp,rsp
    11a7:	48 81 ec 30 01 00 00 	sub    rsp,0x130
    11ae:	89 bd dc fe ff ff    	mov    DWORD PTR [rbp-0x124],edi
    // 读取文件头
    Elf64_Ehdr ehdr;
    //读取文件头
    read(fno, &ehdr, sizeof(ehdr));
    11b4:	48 8d 8d e0 fe ff ff 	lea    rcx,[rbp-0x120]
    11bb:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    11c1:	ba 40 00 00 00       	mov    edx,0x40
    11c6:	48 89 ce             	mov    rsi,rcx
    11c9:	89 c7                	mov    edi,eax
    11cb:	e8 90 fe ff ff       	call   1060 <read@plt>

    unsigned short entn = ehdr.e_phnum;
    11d0:	0f b7 85 18 ff ff ff 	movzx  eax,WORD PTR [rbp-0xe8]
    11d7:	66 89 45 86          	mov    WORD PTR [rbp-0x7a],ax
    unsigned short ents = ehdr.e_phentsize;
    11db:	0f b7 85 16 ff ff ff 	movzx  eax,WORD PTR [rbp-0xea]
    11e2:	66 89 45 84          	mov    WORD PTR [rbp-0x7c],ax
    module*        mod  = 0;
    11e6:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    11ed:	00 
    // module项设置
    //注册自己
    for (int i = 0; i < MAX_MODULES; i++) {
    11ee:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    11f5:	e9 d1 00 00 00       	jmp    12cb <load_elfso_old+0x12c>
        if (modules[i].type == ET_NONE) {
    11fa:	48 8b 0d d7 4d 00 00 	mov    rcx,QWORD PTR [rip+0x4dd7]        # 5fd8 <modules-0x1c8>
    1201:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1204:	48 63 d0             	movsxd rdx,eax
    1207:	48 89 d0             	mov    rax,rdx
    120a:	48 01 c0             	add    rax,rax
    120d:	48 01 d0             	add    rax,rdx
    1210:	48 c1 e0 05          	shl    rax,0x5
    1214:	48 01 c8             	add    rax,rcx
    1217:	48 83 c0 18          	add    rax,0x18
    121b:	48 8b 00             	mov    rax,QWORD PTR [rax]
    121e:	48 85 c0             	test   rax,rax
    1221:	0f 85 a0 00 00 00    	jne    12c7 <load_elfso_old+0x128>
            modules[i].type        = ehdr.e_type;
    1227:	0f b7 85 f0 fe ff ff 	movzx  eax,WORD PTR [rbp-0x110]
    122e:	0f b7 d0             	movzx  edx,ax
    1231:	48 8b 35 a0 4d 00 00 	mov    rsi,QWORD PTR [rip+0x4da0]        # 5fd8 <modules-0x1c8>
    1238:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    123b:	48 63 c8             	movsxd rcx,eax
    123e:	48 89 c8             	mov    rax,rcx
    1241:	48 01 c0             	add    rax,rax
    1244:	48 01 c8             	add    rax,rcx
    1247:	48 c1 e0 05          	shl    rax,0x5
    124b:	48 01 f0             	add    rax,rsi
    124e:	48 83 c0 18          	add    rax,0x18
    1252:	48 89 10             	mov    QWORD PTR [rax],rdx
            modules[i].load_offset = 0;
    1255:	48 8b 0d 7c 4d 00 00 	mov    rcx,QWORD PTR [rip+0x4d7c]        # 5fd8 <modules-0x1c8>
    125c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    125f:	48 63 d0             	movsxd rdx,eax
    1262:	48 89 d0             	mov    rax,rdx
    1265:	48 01 c0             	add    rax,rax
    1268:	48 01 d0             	add    rax,rdx
    126b:	48 c1 e0 05          	shl    rax,0x5
    126f:	48 01 c8             	add    rax,rcx
    1272:	48 83 c0 08          	add    rax,0x8
    1276:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            modules[i].base        = 0;
    127d:	48 8b 0d 54 4d 00 00 	mov    rcx,QWORD PTR [rip+0x4d54]        # 5fd8 <modules-0x1c8>
    1284:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    1287:	48 63 d0             	movsxd rdx,eax
    128a:	48 89 d0             	mov    rax,rdx
    128d:	48 01 c0             	add    rax,rax
    1290:	48 01 d0             	add    rax,rdx
    1293:	48 c1 e0 05          	shl    rax,0x5
    1297:	48 01 c8             	add    rax,rcx
    129a:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            mod                    = modules + i;
    12a1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    12a4:	48 63 d0             	movsxd rdx,eax
    12a7:	48 89 d0             	mov    rax,rdx
    12aa:	48 01 c0             	add    rax,rax
    12ad:	48 01 d0             	add    rax,rdx
    12b0:	48 c1 e0 05          	shl    rax,0x5
    12b4:	48 89 c2             	mov    rdx,rax
    12b7:	48 8b 05 1a 4d 00 00 	mov    rax,QWORD PTR [rip+0x4d1a]        # 5fd8 <modules-0x1c8>
    12be:	48 01 d0             	add    rax,rdx
    12c1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
            break;
    12c5:	eb 0e                	jmp    12d5 <load_elfso_old+0x136>
    for (int i = 0; i < MAX_MODULES; i++) {
    12c7:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
    12cb:	83 7d f4 7f          	cmp    DWORD PTR [rbp-0xc],0x7f
    12cf:	0f 8e 25 ff ff ff    	jle    11fa <load_elfso_old+0x5b>
        }
    }
    //需要malloc一块内存
    Elf64_Phdr* ph = malloc(entn * ents);   //(Elf64_Phdr *) (tmpla + ehdr.e_phoff);
    12d5:	0f b7 55 86          	movzx  edx,WORD PTR [rbp-0x7a]
    12d9:	0f b7 45 84          	movzx  eax,WORD PTR [rbp-0x7c]
    12dd:	0f af c2             	imul   eax,edx
    12e0:	48 98                	cdqe   
    12e2:	48 89 c7             	mov    rdi,rax
    12e5:	e8 46 fd ff ff       	call   1030 <malloc@plt>
    12ea:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    seek(fno, ehdr.e_phoff, SEEK_SET);
    12ee:	48 8b 8d 00 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x100]
    12f5:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    12fb:	ba 00 00 00 00       	mov    edx,0x0
    1300:	48 89 ce             	mov    rsi,rcx
    1303:	89 c7                	mov    edi,eax
    1305:	b8 00 00 00 00       	mov    eax,0x0
    130a:	e8 81 fd ff ff       	call   1090 <seek@plt>
    read(fno, ph, entn * ents);
    130f:	0f b7 55 86          	movzx  edx,WORD PTR [rbp-0x7a]
    1313:	0f b7 45 84          	movzx  eax,WORD PTR [rbp-0x7c]
    1317:	0f af c2             	imul   eax,edx
    131a:	48 63 d0             	movsxd rdx,eax
    131d:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
    1321:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
    1327:	48 89 ce             	mov    rsi,rcx
    132a:	89 c7                	mov    edi,eax
    132c:	e8 2f fd ff ff       	call   1060 <read@plt>
    size_t tot_sz = 0;
    1331:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
    1338:	00 00 00 00 
    off_t  base = ph->p_vaddr, offset = 0;
    133c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1340:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    1344:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    134b:	48 c7 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],0x0
    1352:	00 00 00 00 
    int (**init)() = 0, init_arraysz = 0;
    1356:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    135d:	00 
    135e:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0

    for (int i = 0; i < entn; i++) {
    1365:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [rbp-0x28],0x0
    136c:	e9 ca 00 00 00       	jmp    143b <load_elfso_old+0x29c>
        //加载段
        if ((ph->p_type | PT_LOAD) != 0) {
            unsigned long off  = ph->p_offset;
    1371:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1375:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1379:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
            unsigned long fs   = ph->p_filesz;
    1380:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1384:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    1388:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
            size_t        ms   = ph->p_memsz;
    138f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1393:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    1397:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            char*         vptr = (char*)ph->p_vaddr + offset;
    139e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    13a2:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    13a6:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    13ad:	48 01 d0             	add    rax,rdx
    13b0:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
            if (off == 0) {
    13b7:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
    13be:	00 
    13bf:	75 0f                	jne    13d0 <load_elfso_old+0x231>
                mod->header = vptr;
    13c1:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
    13c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    13cc:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
            }
            //先映射好内存
            int prot = PROT_READ;
    13d0:	c7 85 24 ff ff ff 01 	mov    DWORD PTR [rbp-0xdc],0x1
    13d7:	00 00 00 
            if ((ph->p_flags | PF_X))
                prot |= PROT_EXEC;
    13da:	83 8d 24 ff ff ff 04 	or     DWORD PTR [rbp-0xdc],0x4
            if ((ph->p_flags | PF_W))
                prot |= PROT_WRITE;
    13e1:	83 8d 24 ff ff ff 02 	or     DWORD PTR [rbp-0xdc],0x2
            int flags = MAP_PRIVATE;
    13e8:	c7 45 d4 02 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x2
            if (ehdr.e_type == ET_EXEC)
    13ef:	0f b7 85 f0 fe ff ff 	movzx  eax,WORD PTR [rbp-0x110]
    13f6:	66 83 f8 02          	cmp    ax,0x2
    13fa:	75 04                	jne    1400 <load_elfso_old+0x261>
                flags |= MAP_FIXED;
    13fc:	83 4d d4 01          	or     DWORD PTR [rbp-0x2c],0x1
            mmap(vptr, fs, prot, flags, fno, off);
    1400:	4c 8b 85 40 ff ff ff 	mov    r8,QWORD PTR [rbp-0xc0]
    1407:	8b bd dc fe ff ff    	mov    edi,DWORD PTR [rbp-0x124]
    140d:	8b 4d d4             	mov    ecx,DWORD PTR [rbp-0x2c]
    1410:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
    1416:	48 8b b5 38 ff ff ff 	mov    rsi,QWORD PTR [rbp-0xc8]
    141d:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    1424:	4d 89 c1             	mov    r9,r8
    1427:	41 89 f8             	mov    r8d,edi
    142a:	48 89 c7             	mov    rdi,rax
    142d:	e8 1e fc ff ff       	call   1050 <mmap@plt>
        }
        ph++;
    1432:	48 83 45 e8 38       	add    QWORD PTR [rbp-0x18],0x38
    for (int i = 0; i < entn; i++) {
    1437:	83 45 d8 01          	add    DWORD PTR [rbp-0x28],0x1
    143b:	0f b7 45 86          	movzx  eax,WORD PTR [rbp-0x7a]
    143f:	39 45 d8             	cmp    DWORD PTR [rbp-0x28],eax
    1442:	0f 8c 29 ff ff ff    	jl     1371 <load_elfso_old+0x1d2>
    }

    Elf64_Dyn* dynamic = 0;
    1448:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
    144f:	00 
    //寻找dynamic段
    struct Elf64_Shdr* shdr =
        mmap(0, ehdr.e_shentsize * ehdr.e_shnum, PROT_READ, MAP_PRIVATE, fno, ehdr.e_shoff);
    1450:	48 8b 8d 08 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xf8]
    1457:	0f b7 85 1a ff ff ff 	movzx  eax,WORD PTR [rbp-0xe6]
    145e:	0f b7 d0             	movzx  edx,ax
    1461:	0f b7 85 1c ff ff ff 	movzx  eax,WORD PTR [rbp-0xe4]
    1468:	0f b7 c0             	movzx  eax,ax
    146b:	0f af c2             	imul   eax,edx
    146e:	48 98                	cdqe   
    1470:	8b 95 dc fe ff ff    	mov    edx,DWORD PTR [rbp-0x124]
    1476:	49 89 c9             	mov    r9,rcx
    1479:	41 89 d0             	mov    r8d,edx
    147c:	b9 02 00 00 00       	mov    ecx,0x2
    1481:	ba 01 00 00 00       	mov    edx,0x1
    1486:	48 89 c6             	mov    rsi,rax
    1489:	bf 00 00 00 00       	mov    edi,0x0
    148e:	e8 bd fb ff ff       	call   1050 <mmap@plt>
    1493:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    mod->p_shdrs = shdr;
    149a:	48 8b 95 60 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xa0]
    14a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    14a5:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
    for (int i = 0; i < ehdr.e_shnum; i++) {
    14a9:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
    14b0:	eb 3e                	jmp    14f0 <load_elfso_old+0x351>
        if (shdr[i].sh_type == SHT_DYNAMIC) {
    14b2:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    14b5:	48 98                	cdqe   
    14b7:	48 c1 e0 06          	shl    rax,0x6
    14bb:	48 89 c2             	mov    rdx,rax
    14be:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    14c5:	48 01 d0             	add    rax,rdx
    14c8:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    14cb:	83 f8 06             	cmp    eax,0x6
    14ce:	75 1c                	jne    14ec <load_elfso_old+0x34d>
            dynamic = shdr + i;
    14d0:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    14d3:	48 98                	cdqe   
    14d5:	48 c1 e0 06          	shl    rax,0x6
    14d9:	48 89 c2             	mov    rdx,rax
    14dc:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    14e3:	48 01 d0             	add    rax,rdx
    14e6:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            break;
    14ea:	eb 13                	jmp    14ff <load_elfso_old+0x360>
    for (int i = 0; i < ehdr.e_shnum; i++) {
    14ec:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
    14f0:	0f b7 85 1c ff ff ff 	movzx  eax,WORD PTR [rbp-0xe4]
    14f7:	0f b7 c0             	movzx  eax,ax
    14fa:	39 45 c4             	cmp    DWORD PTR [rbp-0x3c],eax
    14fd:	7c b3                	jl     14b2 <load_elfso_old+0x313>
        }
    }
    if (!dynamic)
        ;
    char*  dynstr = 0;
    14ff:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
    1506:	00 
    off_t* got    = 0;
    1507:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
    150e:	00 00 00 00 
    //这里一堆获取函数之后实现细节
    // dynstr=so_get_dynstr(dyn);
    // so_get_dynstr从so中获取.dynstr节
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    1512:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    1516:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
    151a:	eb 2a                	jmp    1546 <load_elfso_old+0x3a7>
        if (p->d_tag == DT_STRTAB) {
    151c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    1520:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1523:	48 83 f8 05          	cmp    rax,0x5
    1527:	75 18                	jne    1541 <load_elfso_old+0x3a2>
            dynstr = p->d_un.d_ptr + offset;
    1529:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    152d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1531:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    1538:	48 01 d0             	add    rax,rdx
    153b:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
            break;
    153f:	eb 11                	jmp    1552 <load_elfso_old+0x3b3>
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    1541:	48 83 45 b0 10       	add    QWORD PTR [rbp-0x50],0x10
    1546:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    154a:	48 8b 00             	mov    rax,QWORD PTR [rax]
    154d:	48 85 c0             	test   rax,rax
    1550:	75 ca                	jne    151c <load_elfso_old+0x37d>
        }
    }

    size_t relsz = 0, relentsz = 0;
    1552:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
    1559:	00 
    155a:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    1561:	00 
    off_t  relptr = 0;
    1562:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    1569:	00 
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    156a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    156e:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    1572:	e9 1d 02 00 00       	jmp    1794 <load_elfso_old+0x5f5>
        switch (p->d_tag) {
    1577:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    157b:	48 8b 00             	mov    rax,QWORD PTR [rax]
    157e:	48 83 f8 1b          	cmp    rax,0x1b
    1582:	0f 87 4d 01 00 00    	ja     16d5 <load_elfso_old+0x536>
    1588:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    158f:	00 
    1590:	48 8d 05 69 2a 00 00 	lea    rax,[rip+0x2a69]        # 4000 <chkmmap+0x240>
    1597:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    159a:	48 98                	cdqe   
    159c:	48 8d 15 5d 2a 00 00 	lea    rdx,[rip+0x2a5d]        # 4000 <chkmmap+0x240>
    15a3:	48 01 d0             	add    rax,rdx
    15a6:	3e ff e0             	notrack jmp rax
        case DT_NEEDED:
            char* pathname = p->d_un.d_val + dynstr;
    15a9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    15ad:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    15b1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    15b5:	48 01 d0             	add    rax,rdx
    15b8:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
            int   so_fno   = open(pathname, O_EXEC);
    15bf:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
    15c6:	be 00 10 00 00       	mov    esi,0x1000
    15cb:	48 89 c7             	mov    rdi,rax
    15ce:	e8 ed fa ff ff       	call   10c0 <open@plt>
    15d3:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
            //不查错了
            load_elfso(open(pathname, O_EXEC));
    15d9:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
    15e0:	be 00 10 00 00       	mov    esi,0x1000
    15e5:	48 89 c7             	mov    rdi,rax
    15e8:	e8 d3 fa ff ff       	call   10c0 <open@plt>
    15ed:	89 c7                	mov    edi,eax
    15ef:	e8 ac fa ff ff       	call   10a0 <load_elfso@plt>
            close(so_fno);
    15f4:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
    15fa:	89 c7                	mov    edi,eax
    15fc:	e8 cf fa ff ff       	call   10d0 <close@plt>

            break;
    1601:	e9 d0 00 00 00       	jmp    16d6 <load_elfso_old+0x537>
        case DT_PLTGOT:
            got = p->d_un.d_ptr + offset;
    1606:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    160a:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    160e:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    1615:	48 01 d0             	add    rax,rdx
    1618:	48 89 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rax

            //赋值为dl的运行时重定位函数
            got[2] = dl_runtime_resolve;
    161f:	48 8b 85 58 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa8]
    1626:	48 83 c0 10          	add    rax,0x10
    162a:	48 8d 15 24 12 00 00 	lea    rdx,[rip+0x1224]        # 2855 <dl_runtime_resolve>
    1631:	48 89 10             	mov    QWORD PTR [rax],rdx
            //填入模块id
            got[1]     = mod - modules;
    1634:	48 8b 05 9d 49 00 00 	mov    rax,QWORD PTR [rip+0x499d]        # 5fd8 <modules-0x1c8>
    163b:	48 89 c2             	mov    rdx,rax
    163e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1642:	48 29 d0             	sub    rax,rdx
    1645:	48 c1 f8 05          	sar    rax,0x5
    1649:	48 89 c2             	mov    rdx,rax
    164c:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
    1653:	aa aa aa 
    1656:	48 0f af c2          	imul   rax,rdx
    165a:	48 89 c2             	mov    rdx,rax
    165d:	48 8b 85 58 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa8]
    1664:	48 83 c0 08          	add    rax,0x8
    1668:	48 89 10             	mov    QWORD PTR [rax],rdx
            mod->p_got = got;
    166b:	48 8b 95 58 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xa8]
    1672:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1676:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
        case DT_SYMTAB: mod->p_symbol = p->d_un.d_ptr; break;
    167a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    167e:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1682:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1686:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    168a:	eb 4a                	jmp    16d6 <load_elfso_old+0x537>
        case DT_RELSZ:
        case DT_RELASZ: relsz = p->d_un.d_val; goto is_rel_prepared;
    168c:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1690:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1694:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    1698:	eb 41                	jmp    16db <load_elfso_old+0x53c>
        case DT_REL:
        case DT_RELA: relptr = p->d_un.d_ptr; goto is_rel_prepared;
    169a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    169e:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    16a2:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    16a6:	eb 33                	jmp    16db <load_elfso_old+0x53c>
        case DT_RELENT:
        case DT_RELAENT: relentsz = p->d_un.d_val; goto is_rel_prepared;
    16a8:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    16ac:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    16b0:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
    16b4:	eb 25                	jmp    16db <load_elfso_old+0x53c>
        case DT_INIT_ARRAY: init = p->d_un.d_ptr; break;
    16b6:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    16ba:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    16be:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    16c2:	eb 12                	jmp    16d6 <load_elfso_old+0x537>
        case DT_INIT_ARRAYSZ: init_arraysz = p->d_un.d_val / 8; break;
    16c4:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    16c8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    16cc:	48 c1 e8 03          	shr    rax,0x3
    16d0:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    16d3:	eb 01                	jmp    16d6 <load_elfso_old+0x537>
        default: break;
    16d5:	90                   	nop
        }
        continue;
    16d6:	e9 b4 00 00 00       	jmp    178f <load_elfso_old+0x5f0>
    is_rel_prepared:
        if (!(relsz && relentsz && relptr))
    16db:	48 83 7d a8 00       	cmp    QWORD PTR [rbp-0x58],0x0
    16e0:	0f 84 a8 00 00 00    	je     178e <load_elfso_old+0x5ef>
    16e6:	48 83 7d a0 00       	cmp    QWORD PTR [rbp-0x60],0x0
    16eb:	0f 84 9d 00 00 00    	je     178e <load_elfso_old+0x5ef>
    16f1:	48 83 7d 98 00       	cmp    QWORD PTR [rbp-0x68],0x0
    16f6:	0f 84 92 00 00 00    	je     178e <load_elfso_old+0x5ef>
            continue;
        for (int j = 0; j < relsz / relentsz; j++) {
    16fc:	c7 45 8c 00 00 00 00 	mov    DWORD PTR [rbp-0x74],0x0
    1703:	eb 57                	jmp    175c <load_elfso_old+0x5bd>
            fill_reloc(relptr + j * relentsz, mod - modules, shdr, 0);
    1705:	48 8b 05 cc 48 00 00 	mov    rax,QWORD PTR [rip+0x48cc]        # 5fd8 <modules-0x1c8>
    170c:	48 89 c2             	mov    rdx,rax
    170f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1713:	48 29 d0             	sub    rax,rdx
    1716:	48 c1 f8 05          	sar    rax,0x5
    171a:	48 89 c2             	mov    rdx,rax
    171d:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
    1724:	aa aa aa 
    1727:	48 0f af c2          	imul   rax,rdx
    172b:	89 c6                	mov    esi,eax
    172d:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    1730:	48 98                	cdqe   
    1732:	48 0f af 45 a0       	imul   rax,QWORD PTR [rbp-0x60]
    1737:	48 89 c2             	mov    rdx,rax
    173a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
    173e:	48 01 d0             	add    rax,rdx
    1741:	48 89 c7             	mov    rdi,rax
    1744:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
    174b:	b9 00 00 00 00       	mov    ecx,0x0
    1750:	48 89 c2             	mov    rdx,rax
    1753:	e8 e8 f8 ff ff       	call   1040 <fill_reloc@plt>
        for (int j = 0; j < relsz / relentsz; j++) {
    1758:	83 45 8c 01          	add    DWORD PTR [rbp-0x74],0x1
    175c:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    175f:	48 63 c8             	movsxd rcx,eax
    1762:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
    1766:	ba 00 00 00 00       	mov    edx,0x0
    176b:	48 f7 75 a0          	div    QWORD PTR [rbp-0x60]
    176f:	48 39 c1             	cmp    rcx,rax
    1772:	72 91                	jb     1705 <load_elfso_old+0x566>
        }
        relsz = relentsz = relptr = 0;
    1774:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    177b:	00 
    177c:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    1783:	00 
    1784:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    1788:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
    178c:	eb 01                	jmp    178f <load_elfso_old+0x5f0>
            continue;
    178e:	90                   	nop
    for (Elf64_Dyn* p = dynamic; p->d_tag; p++) {
    178f:	48 83 45 90 10       	add    QWORD PTR [rbp-0x70],0x10
    1794:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    1798:	48 8b 00             	mov    rax,QWORD PTR [rax]
    179b:	48 85 c0             	test   rax,rax
    179e:	0f 85 d3 fd ff ff    	jne    1577 <load_elfso_old+0x3d8>
    }
    if (init) {
    17a4:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
    17a9:	74 33                	je     17de <load_elfso_old+0x63f>
        //调用模块入口函数
        for (int i = 0; i < init_arraysz; i++) {
    17ab:	c7 45 88 00 00 00 00 	mov    DWORD PTR [rbp-0x78],0x0
    17b2:	eb 22                	jmp    17d6 <load_elfso_old+0x637>
            (init[i])();
    17b4:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    17b7:	48 98                	cdqe   
    17b9:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
    17c0:	00 
    17c1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    17c5:	48 01 d0             	add    rax,rdx
    17c8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    17cb:	b8 00 00 00 00       	mov    eax,0x0
    17d0:	ff d2                	call   rdx
        for (int i = 0; i < init_arraysz; i++) {
    17d2:	83 45 88 01          	add    DWORD PTR [rbp-0x78],0x1
    17d6:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    17d9:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
    17dc:	7c d6                	jl     17b4 <load_elfso_old+0x615>
        }
    }
    free(&ehdr);
    17de:	48 8d 85 e0 fe ff ff 	lea    rax,[rbp-0x120]
    17e5:	48 89 c7             	mov    rdi,rax
    17e8:	e8 f3 f8 ff ff       	call   10e0 <free@plt>
    return 0;
    17ed:	b8 00 00 00 00       	mov    eax,0x0
}
    17f2:	c9                   	leave  
    17f3:	c3                   	ret    

00000000000017f4 <load_elfso>:
Elf64_Ehdr ehdr;
//切换进程前,在execve系统调用中
int load_elfso(int fildes)
{
    17f4:	f3 0f 1e fa          	endbr64 
    17f8:	55                   	push   rbp
    17f9:	48 89 e5             	mov    rbp,rsp
    17fc:	48 81 ec 90 02 00 00 	sub    rsp,0x290
    1803:	89 bd 7c fd ff ff    	mov    DWORD PTR [rbp-0x284],edi
    extern int chkmmap(off_t, size_t);
    extern int seek(int, off_t, int);
    read(fildes, &ehdr, sizeof(ehdr));
    1809:	8b 85 7c fd ff ff    	mov    eax,DWORD PTR [rbp-0x284]
    180f:	ba 40 00 00 00       	mov    edx,0x40
    1814:	48 8b 0d d5 47 00 00 	mov    rcx,QWORD PTR [rip+0x47d5]        # 5ff0 <ehdr-0x31d0>
    181b:	48 89 ce             	mov    rsi,rcx
    181e:	89 c7                	mov    edi,eax
    1820:	e8 3b f8 ff ff       	call   1060 <read@plt>
    off_t          entry = ehdr.e_entry;
    1825:	48 8b 05 c4 47 00 00 	mov    rax,QWORD PTR [rip+0x47c4]        # 5ff0 <ehdr-0x31d0>
    182c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
    1830:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
    unsigned short entn  = ehdr.e_phnum;
    1837:	48 8b 05 b2 47 00 00 	mov    rax,QWORD PTR [rip+0x47b2]        # 5ff0 <ehdr-0x31d0>
    183e:	0f b7 40 38          	movzx  eax,WORD PTR [rax+0x38]
    1842:	66 89 85 fe fe ff ff 	mov    WORD PTR [rbp-0x102],ax
    unsigned short ents  = ehdr.e_phentsize;
    1849:	48 8b 05 a0 47 00 00 	mov    rax,QWORD PTR [rip+0x47a0]        # 5ff0 <ehdr-0x31d0>
    1850:	0f b7 40 36          	movzx  eax,WORD PTR [rax+0x36]
    1854:	66 89 85 fc fe ff ff 	mov    WORD PTR [rbp-0x104],ax
    off_t          shla  = malloc(ehdr.e_shnum * ehdr.e_shentsize);
    185b:	48 8b 05 8e 47 00 00 	mov    rax,QWORD PTR [rip+0x478e]        # 5ff0 <ehdr-0x31d0>
    1862:	0f b7 40 3c          	movzx  eax,WORD PTR [rax+0x3c]
    1866:	0f b7 d0             	movzx  edx,ax
    1869:	48 8b 05 80 47 00 00 	mov    rax,QWORD PTR [rip+0x4780]        # 5ff0 <ehdr-0x31d0>
    1870:	0f b7 40 3a          	movzx  eax,WORD PTR [rax+0x3a]
    1874:	0f b7 c0             	movzx  eax,ax
    1877:	0f af c2             	imul   eax,edx
    187a:	48 98                	cdqe   
    187c:	48 89 c7             	mov    rdi,rax
    187f:	e8 ac f7 ff ff       	call   1030 <malloc@plt>
    1884:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
    seek(fildes, ehdr.e_shoff, SEEK_SET);
    188b:	48 8b 05 5e 47 00 00 	mov    rax,QWORD PTR [rip+0x475e]        # 5ff0 <ehdr-0x31d0>
    1892:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
    1896:	8b 85 7c fd ff ff    	mov    eax,DWORD PTR [rbp-0x284]
    189c:	ba 00 00 00 00       	mov    edx,0x0
    18a1:	48 89 ce             	mov    rsi,rcx
    18a4:	89 c7                	mov    edi,eax
    18a6:	e8 e5 f7 ff ff       	call   1090 <seek@plt>
    read(fildes, shla, ehdr.e_shnum * ehdr.e_shentsize);
    18ab:	48 8b 05 3e 47 00 00 	mov    rax,QWORD PTR [rip+0x473e]        # 5ff0 <ehdr-0x31d0>
    18b2:	0f b7 40 3c          	movzx  eax,WORD PTR [rax+0x3c]
    18b6:	0f b7 d0             	movzx  edx,ax
    18b9:	48 8b 05 30 47 00 00 	mov    rax,QWORD PTR [rip+0x4730]        # 5ff0 <ehdr-0x31d0>
    18c0:	0f b7 40 3a          	movzx  eax,WORD PTR [rax+0x3a]
    18c4:	0f b7 c0             	movzx  eax,ax
    18c7:	0f af c2             	imul   eax,edx
    18ca:	48 63 d0             	movsxd rdx,eax
    18cd:	48 8b 8d f0 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x110]
    18d4:	8b 85 7c fd ff ff    	mov    eax,DWORD PTR [rbp-0x284]
    18da:	48 89 ce             	mov    rsi,rcx
    18dd:	89 c7                	mov    edi,eax
    18df:	e8 7c f7 ff ff       	call   1060 <read@plt>

    struct Elf64_Shdr* sh = (struct Elf64_Shdr*)(shla);
    18e4:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
    18eb:	48 89 85 e8 fe ff ff 	mov    QWORD PTR [rbp-0x118],rax
    Elf64_Phdr*        ph = malloc(entn * ents);
    18f2:	0f b7 95 fe fe ff ff 	movzx  edx,WORD PTR [rbp-0x102]
    18f9:	0f b7 85 fc fe ff ff 	movzx  eax,WORD PTR [rbp-0x104]
    1900:	0f af c2             	imul   eax,edx
    1903:	48 98                	cdqe   
    1905:	48 89 c7             	mov    rdi,rax
    1908:	e8 23 f7 ff ff       	call   1030 <malloc@plt>
    190d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    seek(fildes, ehdr.e_phoff, SEEK_SET);
    1911:	48 8b 05 d8 46 00 00 	mov    rax,QWORD PTR [rip+0x46d8]        # 5ff0 <ehdr-0x31d0>
    1918:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
    191c:	8b 85 7c fd ff ff    	mov    eax,DWORD PTR [rbp-0x284]
    1922:	ba 00 00 00 00       	mov    edx,0x0
    1927:	48 89 ce             	mov    rsi,rcx
    192a:	89 c7                	mov    edi,eax
    192c:	e8 5f f7 ff ff       	call   1090 <seek@plt>
    read(fildes, ph, entn * ents);
    1931:	0f b7 95 fe fe ff ff 	movzx  edx,WORD PTR [rbp-0x102]
    1938:	0f b7 85 fc fe ff ff 	movzx  eax,WORD PTR [rbp-0x104]
    193f:	0f af c2             	imul   eax,edx
    1942:	48 63 d0             	movsxd rdx,eax
    1945:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
    1949:	8b 85 7c fd ff ff    	mov    eax,DWORD PTR [rbp-0x284]
    194f:	48 89 ce             	mov    rsi,rcx
    1952:	89 c7                	mov    edi,eax
    1954:	e8 07 f7 ff ff       	call   1060 <read@plt>
    size_t tot_sz = 0;
    1959:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
    1960:	00 
    off_t  base = ph->p_vaddr, offset = 0;
    1961:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1965:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    1969:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    196d:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    1974:	00 
    int    reloc_flag = 0;
    1975:	c7 85 e4 fe ff ff 00 	mov    DWORD PTR [rbp-0x11c],0x0
    197c:	00 00 00 
    //判断是否为DYN
    if (ehdr.e_type == ET_DYN) {
    197f:	48 8b 05 6a 46 00 00 	mov    rax,QWORD PTR [rip+0x466a]        # 5ff0 <ehdr-0x31d0>
    1986:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
    198a:	66 83 f8 03          	cmp    ax,0x3
    198e:	0f 85 28 01 00 00    	jne    1abc <load_elfso+0x2c8>
        reloc_flag = 1;
    1994:	c7 85 e4 fe ff ff 01 	mov    DWORD PTR [rbp-0x11c],0x1
    199b:	00 00 00 
        for (int i = 0; i < ehdr.e_phnum; i++) {
    199e:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
    19a5:	eb 78                	jmp    1a1f <load_elfso+0x22b>
            tot_sz += ph[i].p_memsz;
    19a7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    19aa:	48 63 d0             	movsxd rdx,eax
    19ad:	48 89 d0             	mov    rax,rdx
    19b0:	48 c1 e0 03          	shl    rax,0x3
    19b4:	48 29 d0             	sub    rax,rdx
    19b7:	48 c1 e0 03          	shl    rax,0x3
    19bb:	48 89 c2             	mov    rdx,rax
    19be:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    19c2:	48 01 d0             	add    rax,rdx
    19c5:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    19c9:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
            if (ph[i].p_vaddr < base)
    19cd:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    19d0:	48 63 d0             	movsxd rdx,eax
    19d3:	48 89 d0             	mov    rax,rdx
    19d6:	48 c1 e0 03          	shl    rax,0x3
    19da:	48 29 d0             	sub    rax,rdx
    19dd:	48 c1 e0 03          	shl    rax,0x3
    19e1:	48 89 c2             	mov    rdx,rax
    19e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    19e8:	48 01 d0             	add    rax,rdx
    19eb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    19ef:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
    19f3:	76 26                	jbe    1a1b <load_elfso+0x227>
                base = ph[i].p_vaddr;
    19f5:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
    19f8:	48 63 d0             	movsxd rdx,eax
    19fb:	48 89 d0             	mov    rax,rdx
    19fe:	48 c1 e0 03          	shl    rax,0x3
    1a02:	48 29 d0             	sub    rax,rdx
    1a05:	48 c1 e0 03          	shl    rax,0x3
    1a09:	48 89 c2             	mov    rdx,rax
    1a0c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1a10:	48 01 d0             	add    rax,rdx
    1a13:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    1a17:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for (int i = 0; i < ehdr.e_phnum; i++) {
    1a1b:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
    1a1f:	48 8b 05 ca 45 00 00 	mov    rax,QWORD PTR [rip+0x45ca]        # 5ff0 <ehdr-0x31d0>
    1a26:	0f b7 40 38          	movzx  eax,WORD PTR [rax+0x38]
    1a2a:	0f b7 c0             	movzx  eax,ax
    1a2d:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
    1a30:	0f 8c 71 ff ff ff    	jl     19a7 <load_elfso+0x1b3>
        }
        /*
        似乎有的系统支持单个段的重定位。但是这样在有些重定位方式下，尤其是跨段的相对地址调用来说，这会带来大难度，
        所以这里先整体移动。*/
        if (!chkmmap(base, tot_sz)) {
    1a36:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
    1a3a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1a3e:	48 89 d6             	mov    rsi,rdx
    1a41:	48 89 c7             	mov    rdi,rax
    1a44:	e8 67 f6 ff ff       	call   10b0 <chkmmap@plt>
    1a49:	85 c0                	test   eax,eax
    1a4b:	75 6f                	jne    1abc <load_elfso+0x2c8>
            //原来的地方已经被映射
            //需要重定位
            //找到另一块大小符合的连续虚拟内存，然后返回首地址（不映射，下面手动映射）
            reloc_flag     = 2;
    1a4d:	c7 85 e4 fe ff ff 02 	mov    DWORD PTR [rbp-0x11c],0x2
    1a54:	00 00 00 
            off_t new_base = base + 4096;
    1a57:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    1a5b:	48 05 00 10 00 00    	add    rax,0x1000
    1a61:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            while (!chkmmap(new_base, tot_sz) && new_base < KNL_BASE) {
    1a65:	eb 08                	jmp    1a6f <load_elfso+0x27b>
                new_base += 4096;
    1a67:	48 81 45 d0 00 10 00 	add    QWORD PTR [rbp-0x30],0x1000
    1a6e:	00 
            while (!chkmmap(new_base, tot_sz) && new_base < KNL_BASE) {
    1a6f:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
    1a73:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    1a77:	48 89 d6             	mov    rsi,rdx
    1a7a:	48 89 c7             	mov    rdi,rax
    1a7d:	e8 2e f6 ff ff       	call   10b0 <chkmmap@plt>
    1a82:	85 c0                	test   eax,eax
    1a84:	75 10                	jne    1a96 <load_elfso+0x2a2>
    1a86:	48 b8 ff ff ff ff ff 	movabs rax,0xffff7fffffffffff
    1a8d:	7f ff ff 
    1a90:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
    1a94:	76 d1                	jbe    1a67 <load_elfso+0x273>
            }
            if (new_base >= KNL_BASE) {
    1a96:	48 b8 ff ff ff ff ff 	movabs rax,0xffff7fffffffffff
    1a9d:	7f ff ff 
    1aa0:	48 39 45 d0          	cmp    QWORD PTR [rbp-0x30],rax
    1aa4:	76 0a                	jbe    1ab0 <load_elfso+0x2bc>
                return -ENOMEM;
    1aa6:	b8 cf ff ff ff       	mov    eax,0xffffffcf
    1aab:	e9 1d 0a 00 00       	jmp    24cd <load_elfso+0xcd9>
            }
            offset = new_base - base;
    1ab0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    1ab4:	48 2b 45 e8          	sub    rax,QWORD PTR [rbp-0x18]
    1ab8:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        }
    }


    module* mod      = 0;
    1abc:	48 c7 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],0x0
    1ac3:	00 00 00 00 
    int     elfid    = reg_module();
    1ac7:	b8 00 00 00 00       	mov    eax,0x0
    1acc:	e8 0b 11 00 00       	call   2bdc <reg_module>
    1ad1:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
    mod              = modules + elfid;
    1ad7:	8b 85 d4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x12c]
    1add:	48 63 d0             	movsxd rdx,eax
    1ae0:	48 89 d0             	mov    rax,rdx
    1ae3:	48 01 c0             	add    rax,rax
    1ae6:	48 01 d0             	add    rax,rdx
    1ae9:	48 c1 e0 05          	shl    rax,0x5
    1aed:	48 89 c2             	mov    rdx,rax
    1af0:	48 8b 05 e1 44 00 00 	mov    rax,QWORD PTR [rip+0x44e1]        # 5fd8 <modules-0x1c8>
    1af7:	48 01 d0             	add    rax,rdx
    1afa:	48 89 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rax
    mod->type        = ehdr.e_type;
    1b01:	48 8b 05 e8 44 00 00 	mov    rax,QWORD PTR [rip+0x44e8]        # 5ff0 <ehdr-0x31d0>
    1b08:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
    1b0c:	0f b7 d0             	movzx  edx,ax
    1b0f:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1b16:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    mod->load_offset = offset;
    1b1a:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1b21:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    1b25:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    mod->base        = base + offset;
    1b29:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    1b2d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b31:	48 01 c2             	add    rdx,rax
    1b34:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1b3b:	48 89 10             	mov    QWORD PTR [rax],rdx
    mod->p_shdrs     = base + offset + ehdr.e_shoff;
    1b3e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    1b42:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1b46:	48 01 c2             	add    rdx,rax
    1b49:	48 8b 05 a0 44 00 00 	mov    rax,QWORD PTR [rip+0x44a0]        # 5ff0 <ehdr-0x31d0>
    1b50:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    1b54:	48 01 c2             	add    rdx,rax
    1b57:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1b5e:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx

    //找dynamic段
    struct Elf64_Shdr* dynamic  = 0;
    1b62:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
    1b69:	00 
    off_t*             got      = 0;
    1b6a:	48 c7 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],0x0
    1b71:	00 00 00 00 
    size_t             got_size = 0;
    1b75:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
    1b7c:	00 

    for (int i = 0; i < ehdr.e_shnum; i++) {
    1b7d:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
    1b84:	e9 83 00 00 00       	jmp    1c0c <load_elfso+0x418>
        if (sh[i].sh_type == SHT_DYNSYM) {
    1b89:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
    1b8c:	48 98                	cdqe   
    1b8e:	48 c1 e0 06          	shl    rax,0x6
    1b92:	48 89 c2             	mov    rdx,rax
    1b95:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1b9c:	48 01 d0             	add    rax,rdx
    1b9f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1ba2:	83 f8 0b             	cmp    eax,0xb
    1ba5:	75 27                	jne    1bce <load_elfso+0x3da>
            mod->s_symtabsz = sh[i].sh_size;
    1ba7:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
    1baa:	48 98                	cdqe   
    1bac:	48 c1 e0 06          	shl    rax,0x6
    1bb0:	48 89 c2             	mov    rdx,rax
    1bb3:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1bba:	48 01 d0             	add    rax,rdx
    1bbd:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
    1bc1:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1bc8:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    1bcc:	eb 3a                	jmp    1c08 <load_elfso+0x414>
        }
        else if (sh[i].sh_type == SHT_DYNAMIC) {
    1bce:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
    1bd1:	48 98                	cdqe   
    1bd3:	48 c1 e0 06          	shl    rax,0x6
    1bd7:	48 89 c2             	mov    rdx,rax
    1bda:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1be1:	48 01 d0             	add    rax,rdx
    1be4:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1be7:	83 f8 06             	cmp    eax,0x6
    1bea:	75 1c                	jne    1c08 <load_elfso+0x414>
            dynamic = sh + i;
    1bec:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
    1bef:	48 98                	cdqe   
    1bf1:	48 c1 e0 06          	shl    rax,0x6
    1bf5:	48 89 c2             	mov    rdx,rax
    1bf8:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1bff:	48 01 d0             	add    rax,rdx
    1c02:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            break;
    1c06:	eb 1b                	jmp    1c23 <load_elfso+0x42f>
    for (int i = 0; i < ehdr.e_shnum; i++) {
    1c08:	83 45 bc 01          	add    DWORD PTR [rbp-0x44],0x1
    1c0c:	48 8b 05 dd 43 00 00 	mov    rax,QWORD PTR [rip+0x43dd]        # 5ff0 <ehdr-0x31d0>
    1c13:	0f b7 40 3c          	movzx  eax,WORD PTR [rax+0x3c]
    1c17:	0f b7 c0             	movzx  eax,ax
    1c1a:	39 45 bc             	cmp    DWORD PTR [rbp-0x44],eax
    1c1d:	0f 8c 66 ff ff ff    	jl     1b89 <load_elfso+0x395>
        }
    }
    //程序占用的最高地址，这里就是堆开始分配的地方
    off_t max_allocated = 0;
    1c23:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
    1c2a:	00 
    for (int i = 0; i < entn; i++) {
    1c2b:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
    1c32:	e9 12 01 00 00       	jmp    1d49 <load_elfso+0x555>
        //加载段
        if (ph->p_type == PT_LOAD) {
    1c37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c3b:	8b 00                	mov    eax,DWORD PTR [rax]
    1c3d:	83 f8 01             	cmp    eax,0x1
    1c40:	0f 85 fa 00 00 00    	jne    1d40 <load_elfso+0x54c>
            unsigned long off  = ph->p_offset;
    1c46:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c4a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1c4e:	48 89 85 a0 fe ff ff 	mov    QWORD PTR [rbp-0x160],rax
            unsigned long fs   = ph->p_filesz;
    1c55:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c59:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    1c5d:	48 89 85 98 fe ff ff 	mov    QWORD PTR [rbp-0x168],rax
            size_t        ms   = ph->p_memsz;
    1c64:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c68:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    1c6c:	48 89 85 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],rax
            char*         vptr = (char*)ph->p_vaddr + offset;
    1c73:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1c77:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    1c7b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1c7f:	48 01 d0             	add    rax,rdx
    1c82:	48 89 85 88 fe ff ff 	mov    QWORD PTR [rbp-0x178],rax
            if (max_allocated < vptr + ms)
    1c89:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
    1c90:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
    1c97:	48 01 c2             	add    rdx,rax
    1c9a:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
    1c9e:	48 39 c2             	cmp    rdx,rax
    1ca1:	76 15                	jbe    1cb8 <load_elfso+0x4c4>
                max_allocated = vptr + ms;
    1ca3:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
    1caa:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
    1cb1:	48 01 d0             	add    rax,rdx
    1cb4:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
            if (off == 0) {
    1cb8:	48 83 bd a0 fe ff ff 	cmp    QWORD PTR [rbp-0x160],0x0
    1cbf:	00 
    1cc0:	75 12                	jne    1cd4 <load_elfso+0x4e0>
                mod->header = vptr;
    1cc2:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
    1cc9:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1cd0:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
            }
            //先映射好内存，访问时再分配内存
            int attr = PROT_READ;
    1cd4:	c7 45 a8 01 00 00 00 	mov    DWORD PTR [rbp-0x58],0x1
            if ((ph->p_flags & PF_W))
    1cdb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1cdf:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1ce2:	83 e0 02             	and    eax,0x2
    1ce5:	85 c0                	test   eax,eax
    1ce7:	74 04                	je     1ced <load_elfso+0x4f9>
                attr |= PROT_WRITE;
    1ce9:	83 4d a8 02          	or     DWORD PTR [rbp-0x58],0x2
            if ((ph->p_flags & PF_X)) {
    1ced:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    1cf1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    1cf4:	83 e0 01             	and    eax,0x1
    1cf7:	85 c0                	test   eax,eax
    1cf9:	74 04                	je     1cff <load_elfso+0x50b>
                attr |= PROT_EXEC;
    1cfb:	83 4d a8 04          	or     DWORD PTR [rbp-0x58],0x4
            }
            if (mmap(vptr, ms, attr, MAP_FIXED | MAP_PRIVATE, fildes, off) == -1)
    1cff:	48 8b bd a0 fe ff ff 	mov    rdi,QWORD PTR [rbp-0x160]
    1d06:	8b 8d 7c fd ff ff    	mov    ecx,DWORD PTR [rbp-0x284]
    1d0c:	8b 55 a8             	mov    edx,DWORD PTR [rbp-0x58]
    1d0f:	48 8b b5 90 fe ff ff 	mov    rsi,QWORD PTR [rbp-0x170]
    1d16:	48 8b 85 88 fe ff ff 	mov    rax,QWORD PTR [rbp-0x178]
    1d1d:	49 89 f9             	mov    r9,rdi
    1d20:	41 89 c8             	mov    r8d,ecx
    1d23:	b9 03 00 00 00       	mov    ecx,0x3
    1d28:	48 89 c7             	mov    rdi,rax
    1d2b:	e8 20 f3 ff ff       	call   1050 <mmap@plt>
    1d30:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
    1d34:	75 0a                	jne    1d40 <load_elfso+0x54c>
                return -1;   //加载失败
    1d36:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1d3b:	e9 8d 07 00 00       	jmp    24cd <load_elfso+0xcd9>
        }
        ph++;
    1d40:	48 83 45 f8 38       	add    QWORD PTR [rbp-0x8],0x38
    for (int i = 0; i < entn; i++) {
    1d45:	83 45 ac 01          	add    DWORD PTR [rbp-0x54],0x1
    1d49:	0f b7 85 fe fe ff ff 	movzx  eax,WORD PTR [rbp-0x102]
    1d50:	39 45 ac             	cmp    DWORD PTR [rbp-0x54],eax
    1d53:	0f 8c de fe ff ff    	jl     1c37 <load_elfso+0x443>
    }
    if (dynamic) {
    1d59:	48 83 7d c8 00       	cmp    QWORD PTR [rbp-0x38],0x0
    1d5e:	0f 84 62 07 00 00    	je     24c6 <load_elfso+0xcd2>
        void*      needed_nameoff[32];
        int        t_needed = 0;
    1d64:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
        char*      dynstr   = 0;
    1d6b:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
    1d72:	00 
        Elf64_Dyn* dyn      = dynamic->sh_addr + offset;
    1d73:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    1d77:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    1d7b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1d7f:	48 01 d0             	add    rax,rdx
    1d82:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
        size_t     relsz = 0, relentsz = 0;
    1d89:	48 c7 45 90 00 00 00 	mov    QWORD PTR [rbp-0x70],0x0
    1d90:	00 
    1d91:	48 c7 45 88 00 00 00 	mov    QWORD PTR [rbp-0x78],0x0
    1d98:	00 
        size_t     relasz = 0, relaentsz = 0;
    1d99:	48 c7 45 80 00 00 00 	mov    QWORD PTR [rbp-0x80],0x0
    1da0:	00 
    1da1:	48 c7 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],0x0
    1da8:	00 00 00 00 
        size_t     jmprelsz = 0, jmprelaentsz = 0;
    1dac:	48 c7 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],0x0
    1db3:	00 00 00 00 
    1db7:	48 c7 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],0x0
    1dbe:	00 00 00 00 
        off_t      relptr = 0, relaptr = 0, jmprelptr = 0;
    1dc2:	48 c7 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],0x0
    1dc9:	00 00 00 00 
    1dcd:	48 c7 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],0x0
    1dd4:	00 00 00 00 
    1dd8:	48 c7 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],0x0
    1ddf:	00 00 00 00 
        int        pltrel = 0, bind_now = 0;
    1de3:	c7 85 4c ff ff ff 00 	mov    DWORD PTR [rbp-0xb4],0x0
    1dea:	00 00 00 
    1ded:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x0
    1df4:	00 00 00 
        int (*init)()     = 0;
    1df7:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x0
    1dfe:	00 00 00 00 
        size_t init_arrsz = 0;
    1e02:	48 c7 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],0x0
    1e09:	00 00 00 00 
        mod->p_dynamic    = dynamic;
    1e0d:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    1e11:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1e18:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
        //这里一堆获取函数之后实现细节
        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    1e1c:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
    1e23:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
    1e2a:	eb 3f                	jmp    1e6b <load_elfso+0x677>
            if (p->d_tag == DT_STRTAB) {
    1e2c:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1e33:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1e36:	48 83 f8 05          	cmp    rax,0x5
    1e3a:	75 27                	jne    1e63 <load_elfso+0x66f>
                dynstr        = p->d_un.d_ptr + offset;
    1e3c:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1e43:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1e47:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1e4b:	48 01 d0             	add    rax,rdx
    1e4e:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
                mod->p_strtab = dynstr;
    1e52:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
    1e56:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1e5d:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
                break;
    1e61:	eb 17                	jmp    1e7a <load_elfso+0x686>
        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    1e63:	48 83 85 30 ff ff ff 	add    QWORD PTR [rbp-0xd0],0x10
    1e6a:	10 
    1e6b:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
    1e72:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1e75:	48 85 c0             	test   rax,rax
    1e78:	75 b2                	jne    1e2c <load_elfso+0x638>
            }
        }
        if (!dynstr) {
    1e7a:	48 83 7d 98 00       	cmp    QWORD PTR [rbp-0x68],0x0
    1e7f:	75 0a                	jne    1e8b <load_elfso+0x697>
            return -1;
    1e81:	b8 ff ff ff ff       	mov    eax,0xffffffff
    1e86:	e9 42 06 00 00       	jmp    24cd <load_elfso+0xcd9>
        }

        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    1e8b:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
    1e92:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
    1e99:	e9 17 03 00 00       	jmp    21b5 <load_elfso+0x9c1>
            switch (p->d_tag) {
    1e9e:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    1ea5:	48 8b 00             	mov    rax,QWORD PTR [rax]
    1ea8:	48 83 f8 1b          	cmp    rax,0x1b
    1eac:	0f 87 fa 02 00 00    	ja     21ac <load_elfso+0x9b8>
    1eb2:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    1eb9:	00 
    1eba:	48 8d 05 af 21 00 00 	lea    rax,[rip+0x21af]        # 4070 <chkmmap+0x2b0>
    1ec1:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    1ec4:	48 98                	cdqe   
    1ec6:	48 8d 15 a3 21 00 00 	lea    rdx,[rip+0x21a3]        # 4070 <chkmmap+0x2b0>
    1ecd:	48 01 d0             	add    rax,rdx
    1ed0:	3e ff e0             	notrack jmp rax
            case DT_NEEDED:
                //不查错了
                needed_nameoff[t_needed++] = p->d_un.d_val + dynstr;
    1ed3:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    1eda:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
    1ede:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
    1ee1:	8d 50 01             	lea    edx,[rax+0x1]
    1ee4:	89 55 a4             	mov    DWORD PTR [rbp-0x5c],edx
    1ee7:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
    1eeb:	48 01 ca             	add    rdx,rcx
    1eee:	48 98                	cdqe   
    1ef0:	48 89 94 c5 80 fd ff 	mov    QWORD PTR [rbp+rax*8-0x280],rdx
    1ef7:	ff 
                break;
    1ef8:	e9 b0 02 00 00       	jmp    21ad <load_elfso+0x9b9>
            case DT_PLTGOT:
                got = p->d_un.d_ptr + offset;
    1efd:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    1f04:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    1f08:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1f0c:	48 01 d0             	add    rax,rdx
    1f0f:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax

                //赋值为dl的运行时重定位函数
                got[2] = dl_runtime_resolve;
    1f16:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    1f1d:	48 83 c0 10          	add    rax,0x10
    1f21:	48 8d 15 2d 09 00 00 	lea    rdx,[rip+0x92d]        # 2855 <dl_runtime_resolve>
    1f28:	48 89 10             	mov    QWORD PTR [rax],rdx
                //填入模块id
                got[1] = mod - modules;
    1f2b:	48 8b 05 a6 40 00 00 	mov    rax,QWORD PTR [rip+0x40a6]        # 5fd8 <modules-0x1c8>
    1f32:	48 89 c2             	mov    rdx,rax
    1f35:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1f3c:	48 29 d0             	sub    rax,rdx
    1f3f:	48 c1 f8 05          	sar    rax,0x5
    1f43:	48 89 c2             	mov    rdx,rax
    1f46:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
    1f4d:	aa aa aa 
    1f50:	48 0f af c2          	imul   rax,rdx
    1f54:	48 89 c2             	mov    rdx,rax
    1f57:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    1f5e:	48 83 c0 08          	add    rax,0x8
    1f62:	48 89 10             	mov    QWORD PTR [rax],rdx
                got[0] += offset;   // 0th项存着.dynamic的地址
    1f65:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    1f6c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    1f6f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    1f73:	48 01 c2             	add    rdx,rax
    1f76:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    1f7d:	48 89 10             	mov    QWORD PTR [rax],rdx
                mod->p_got = got;
    1f80:	48 8b 95 c8 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x138]
    1f87:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    1f8e:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
                //这里需要把got表里面的地址先偏移offset，因为plt里面jmp到plt0要用到
                for (int i = 0; i < ehdr.e_shnum; i++) {
    1f92:	c7 85 24 ff ff ff 00 	mov    DWORD PTR [rbp-0xdc],0x0
    1f99:	00 00 00 
    1f9c:	eb 57                	jmp    1ff5 <load_elfso+0x801>
                    if (sh[i].sh_addr == p->d_un.d_ptr) {
    1f9e:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
    1fa4:	48 98                	cdqe   
    1fa6:	48 c1 e0 06          	shl    rax,0x6
    1faa:	48 89 c2             	mov    rdx,rax
    1fad:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1fb4:	48 01 d0             	add    rax,rdx
    1fb7:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
    1fbb:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    1fc2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    1fc6:	48 39 c2             	cmp    rdx,rax
    1fc9:	75 23                	jne    1fee <load_elfso+0x7fa>
                        //.got.plt表
                        got_size = sh[i].sh_size;
    1fcb:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
    1fd1:	48 98                	cdqe   
    1fd3:	48 c1 e0 06          	shl    rax,0x6
    1fd7:	48 89 c2             	mov    rdx,rax
    1fda:	48 8b 85 e8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x118]
    1fe1:	48 01 d0             	add    rax,rdx
    1fe4:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    1fe8:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
                        break;
    1fec:	eb 1d                	jmp    200b <load_elfso+0x817>
                for (int i = 0; i < ehdr.e_shnum; i++) {
    1fee:	83 85 24 ff ff ff 01 	add    DWORD PTR [rbp-0xdc],0x1
    1ff5:	48 8b 05 f4 3f 00 00 	mov    rax,QWORD PTR [rip+0x3ff4]        # 5ff0 <ehdr-0x31d0>
    1ffc:	0f b7 40 3c          	movzx  eax,WORD PTR [rax+0x3c]
    2000:	0f b7 c0             	movzx  eax,ax
    2003:	39 85 24 ff ff ff    	cmp    DWORD PTR [rbp-0xdc],eax
    2009:	7c 93                	jl     1f9e <load_elfso+0x7aa>
                    }
                }
                size_t nr_gotent = got_size / sizeof(off_t);
    200b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    200f:	48 c1 e8 03          	shr    rax,0x3
    2013:	48 89 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],rax
                for (int i = 3; i < nr_gotent; i++) {
    201a:	c7 85 20 ff ff ff 03 	mov    DWORD PTR [rbp-0xe0],0x3
    2021:	00 00 00 
    2024:	eb 48                	jmp    206e <load_elfso+0x87a>
                    got[i] += offset;
    2026:	8b 85 20 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe0]
    202c:	48 98                	cdqe   
    202e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
    2035:	00 
    2036:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    203d:	48 01 d0             	add    rax,rdx
    2040:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    2043:	8b 85 20 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe0]
    2049:	48 98                	cdqe   
    204b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
    2052:	00 
    2053:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
    205a:	48 01 d0             	add    rax,rdx
    205d:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    2061:	48 01 ca             	add    rdx,rcx
    2064:	48 89 10             	mov    QWORD PTR [rax],rdx
                for (int i = 3; i < nr_gotent; i++) {
    2067:	83 85 20 ff ff ff 01 	add    DWORD PTR [rbp-0xe0],0x1
    206e:	8b 85 20 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe0]
    2074:	48 98                	cdqe   
    2076:	48 39 85 a8 fe ff ff 	cmp    QWORD PTR [rbp-0x158],rax
    207d:	77 a7                	ja     2026 <load_elfso+0x832>
                }
                break;
    207f:	e9 29 01 00 00       	jmp    21ad <load_elfso+0x9b9>
            case DT_SYMTAB: mod->p_symbol = p->d_un.d_ptr + offset; break;
    2084:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    208b:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    208f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2093:	48 01 c2             	add    rdx,rax
    2096:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    209d:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    20a1:	e9 07 01 00 00       	jmp    21ad <load_elfso+0x9b9>
            case DT_PLTRELSZ: jmprelsz = p->d_un.d_val; break;
    20a6:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    20ad:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    20b1:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    20b8:	e9 f0 00 00 00       	jmp    21ad <load_elfso+0x9b9>
            case DT_RELSZ: relsz = p->d_un.d_val; break;
    20bd:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    20c4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    20c8:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    20cc:	e9 dc 00 00 00       	jmp    21ad <load_elfso+0x9b9>
            case DT_RELASZ: relasz = p->d_un.d_val; break;
    20d1:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    20d8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    20dc:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
    20e0:	e9 c8 00 00 00       	jmp    21ad <load_elfso+0x9b9>
            case DT_PLTREL: pltrel = p->d_un.d_val; break;
    20e5:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    20ec:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    20f0:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
    20f6:	e9 b2 00 00 00       	jmp    21ad <load_elfso+0x9b9>
            case DT_JMPREL:
                jmprelptr    = p->d_un.d_val;
    20fb:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    2102:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2106:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
                mod->p_reloc = jmprelptr + offset;
    210d:	48 8b 95 50 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb0]
    2114:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2118:	48 01 c2             	add    rdx,rax
    211b:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    2122:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
                break;
    2126:	e9 82 00 00 00       	jmp    21ad <load_elfso+0x9b9>
            case DT_REL: relptr = p->d_un.d_ptr; break;
    212b:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    2132:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2136:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
    213d:	eb 6e                	jmp    21ad <load_elfso+0x9b9>
            case DT_RELA: relaptr = p->d_un.d_ptr; break;
    213f:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    2146:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    214a:	48 89 85 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rax
    2151:	eb 5a                	jmp    21ad <load_elfso+0x9b9>
            case DT_RELENT: relentsz = p->d_un.d_val; break;
    2153:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    215a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    215e:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
    2162:	eb 49                	jmp    21ad <load_elfso+0x9b9>
            case DT_RELAENT: relaentsz = p->d_un.d_val; break;
    2164:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    216b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    216f:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    2176:	eb 35                	jmp    21ad <load_elfso+0x9b9>
            case DT_INIT_ARRAY: init = p->d_un.d_ptr; break;
    2178:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    217f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2183:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    218a:	eb 21                	jmp    21ad <load_elfso+0x9b9>
            case DT_INIT_ARRAYSZ: init_arrsz = p->d_un.d_val; break;
    218c:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    2193:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2197:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
    219e:	eb 0d                	jmp    21ad <load_elfso+0x9b9>
            case DT_BIND_NOW: bind_now = 1; break;
    21a0:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
    21a7:	00 00 00 
    21aa:	eb 01                	jmp    21ad <load_elfso+0x9b9>
            default: break;
    21ac:	90                   	nop
        for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    21ad:	48 83 85 28 ff ff ff 	add    QWORD PTR [rbp-0xd8],0x10
    21b4:	10 
    21b5:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
    21bc:	48 8b 00             	mov    rax,QWORD PTR [rax]
    21bf:	48 85 c0             	test   rax,rax
    21c2:	0f 85 d6 fc ff ff    	jne    1e9e <load_elfso+0x6aa>
            }
        }
        for (int i = 0; i < t_needed; i++) {
    21c8:	c7 85 1c ff ff ff 00 	mov    DWORD PTR [rbp-0xe4],0x0
    21cf:	00 00 00 
    21d2:	eb 5a                	jmp    222e <load_elfso+0xa3a>
            char* pathname = 0;
    21d4:	48 c7 85 b8 fe ff ff 	mov    QWORD PTR [rbp-0x148],0x0
    21db:	00 00 00 00 
            int   so_fno   = 0;
    21df:	c7 85 b4 fe ff ff 00 	mov    DWORD PTR [rbp-0x14c],0x0
    21e6:	00 00 00 
            pathname       = needed_nameoff[i];
    21e9:	8b 85 1c ff ff ff    	mov    eax,DWORD PTR [rbp-0xe4]
    21ef:	48 98                	cdqe   
    21f1:	48 8b 84 c5 80 fd ff 	mov    rax,QWORD PTR [rbp+rax*8-0x280]
    21f8:	ff 
    21f9:	48 89 85 b8 fe ff ff 	mov    QWORD PTR [rbp-0x148],rax
            so_fno         = open(pathname, O_EXEC);
    2200:	48 8b 85 b8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x148]
    2207:	be 00 10 00 00       	mov    esi,0x1000
    220c:	48 89 c7             	mov    rdi,rax
    220f:	e8 ac ee ff ff       	call   10c0 <open@plt>
    2214:	89 85 b4 fe ff ff    	mov    DWORD PTR [rbp-0x14c],eax
            load_elfso(so_fno);
    221a:	8b 85 b4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x14c]
    2220:	89 c7                	mov    edi,eax
    2222:	e8 cd f5 ff ff       	call   17f4 <load_elfso>
        for (int i = 0; i < t_needed; i++) {
    2227:	83 85 1c ff ff ff 01 	add    DWORD PTR [rbp-0xe4],0x1
    222e:	8b 85 1c ff ff ff    	mov    eax,DWORD PTR [rbp-0xe4]
    2234:	3b 45 a4             	cmp    eax,DWORD PTR [rbp-0x5c]
    2237:	7c 9b                	jl     21d4 <load_elfso+0x9e0>
        }
        if (relptr && relentsz && relsz)   // REL
    2239:	48 83 bd 60 ff ff ff 	cmp    QWORD PTR [rbp-0xa0],0x0
    2240:	00 
    2241:	74 7d                	je     22c0 <load_elfso+0xacc>
    2243:	48 83 7d 88 00       	cmp    QWORD PTR [rbp-0x78],0x0
    2248:	74 76                	je     22c0 <load_elfso+0xacc>
    224a:	48 83 7d 90 00       	cmp    QWORD PTR [rbp-0x70],0x0
    224f:	74 6f                	je     22c0 <load_elfso+0xacc>
            for (int j = 0; j < relsz / relentsz; j++)
    2251:	c7 85 18 ff ff ff 00 	mov    DWORD PTR [rbp-0xe8],0x0
    2258:	00 00 00 
    225b:	eb 48                	jmp    22a5 <load_elfso+0xab1>
                fill_reloc(relptr + offset + j * relentsz, elfid, mod->p_symbol, 0);
    225d:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    2264:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    2268:	48 89 c2             	mov    rdx,rax
    226b:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
    2272:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2276:	48 01 c1             	add    rcx,rax
    2279:	8b 85 18 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe8]
    227f:	48 98                	cdqe   
    2281:	48 0f af 45 88       	imul   rax,QWORD PTR [rbp-0x78]
    2286:	48 01 c8             	add    rax,rcx
    2289:	48 89 c7             	mov    rdi,rax
    228c:	8b 85 d4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x12c]
    2292:	b9 00 00 00 00       	mov    ecx,0x0
    2297:	89 c6                	mov    esi,eax
    2299:	e8 a2 ed ff ff       	call   1040 <fill_reloc@plt>
            for (int j = 0; j < relsz / relentsz; j++)
    229e:	83 85 18 ff ff ff 01 	add    DWORD PTR [rbp-0xe8],0x1
    22a5:	8b 85 18 ff ff ff    	mov    eax,DWORD PTR [rbp-0xe8]
    22ab:	48 63 c8             	movsxd rcx,eax
    22ae:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    22b2:	ba 00 00 00 00       	mov    edx,0x0
    22b7:	48 f7 75 88          	div    QWORD PTR [rbp-0x78]
    22bb:	48 39 c1             	cmp    rcx,rax
    22be:	72 9d                	jb     225d <load_elfso+0xa69>
        if (relaptr && relaentsz && relasz)   // RELA
    22c0:	48 83 bd 58 ff ff ff 	cmp    QWORD PTR [rbp-0xa8],0x0
    22c7:	00 
    22c8:	0f 84 86 00 00 00    	je     2354 <load_elfso+0xb60>
    22ce:	48 83 bd 78 ff ff ff 	cmp    QWORD PTR [rbp-0x88],0x0
    22d5:	00 
    22d6:	74 7c                	je     2354 <load_elfso+0xb60>
    22d8:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
    22dd:	74 75                	je     2354 <load_elfso+0xb60>
            for (int j = 0; j < relasz / relaentsz; j++)
    22df:	c7 85 14 ff ff ff 00 	mov    DWORD PTR [rbp-0xec],0x0
    22e6:	00 00 00 
    22e9:	eb 4b                	jmp    2336 <load_elfso+0xb42>
                fill_reloc(relaptr + offset + j * relaentsz, elfid, mod->p_symbol, 1);
    22eb:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    22f2:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    22f6:	48 89 c2             	mov    rdx,rax
    22f9:	48 8b 8d 58 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa8]
    2300:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2304:	48 01 c1             	add    rcx,rax
    2307:	8b 85 14 ff ff ff    	mov    eax,DWORD PTR [rbp-0xec]
    230d:	48 98                	cdqe   
    230f:	48 0f af 85 78 ff ff 	imul   rax,QWORD PTR [rbp-0x88]
    2316:	ff 
    2317:	48 01 c8             	add    rax,rcx
    231a:	48 89 c7             	mov    rdi,rax
    231d:	8b 85 d4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x12c]
    2323:	b9 01 00 00 00       	mov    ecx,0x1
    2328:	89 c6                	mov    esi,eax
    232a:	e8 11 ed ff ff       	call   1040 <fill_reloc@plt>
            for (int j = 0; j < relasz / relaentsz; j++)
    232f:	83 85 14 ff ff ff 01 	add    DWORD PTR [rbp-0xec],0x1
    2336:	8b 85 14 ff ff ff    	mov    eax,DWORD PTR [rbp-0xec]
    233c:	48 63 c8             	movsxd rcx,eax
    233f:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
    2343:	ba 00 00 00 00       	mov    edx,0x0
    2348:	48 f7 b5 78 ff ff ff 	div    QWORD PTR [rbp-0x88]
    234f:	48 39 c1             	cmp    rcx,rax
    2352:	72 97                	jb     22eb <load_elfso+0xaf7>
        if (pltrel == DT_REL)
    2354:	83 bd 4c ff ff ff 11 	cmp    DWORD PTR [rbp-0xb4],0x11
    235b:	75 17                	jne    2374 <load_elfso+0xb80>
            jmprelaentsz = relentsz, pltrel = 0;
    235d:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
    2361:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    2368:	c7 85 4c ff ff ff 00 	mov    DWORD PTR [rbp-0xb4],0x0
    236f:	00 00 00 
    2372:	eb 18                	jmp    238c <load_elfso+0xb98>
        else
            jmprelaentsz = relaentsz, pltrel = 1;
    2374:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
    237b:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    2382:	c7 85 4c ff ff ff 01 	mov    DWORD PTR [rbp-0xb4],0x1
    2389:	00 00 00 
        if (bind_now && jmprelptr && jmprelaentsz && jmprelsz)   // PLTREL
    238c:	83 bd 48 ff ff ff 00 	cmp    DWORD PTR [rbp-0xb8],0x0
    2393:	0f 84 a4 00 00 00    	je     243d <load_elfso+0xc49>
    2399:	48 83 bd 50 ff ff ff 	cmp    QWORD PTR [rbp-0xb0],0x0
    23a0:	00 
    23a1:	0f 84 96 00 00 00    	je     243d <load_elfso+0xc49>
    23a7:	48 83 bd 68 ff ff ff 	cmp    QWORD PTR [rbp-0x98],0x0
    23ae:	00 
    23af:	0f 84 88 00 00 00    	je     243d <load_elfso+0xc49>
    23b5:	48 83 bd 70 ff ff ff 	cmp    QWORD PTR [rbp-0x90],0x0
    23bc:	00 
    23bd:	74 7e                	je     243d <load_elfso+0xc49>
            for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    23bf:	c7 85 10 ff ff ff 00 	mov    DWORD PTR [rbp-0xf0],0x0
    23c6:	00 00 00 
    23c9:	eb 51                	jmp    241c <load_elfso+0xc28>
                fill_reloc(jmprelptr + offset + j * jmprelaentsz, elfid, mod->p_symbol, pltrel);
    23cb:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    23d2:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
    23d6:	48 89 c6             	mov    rsi,rax
    23d9:	48 8b 95 50 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb0]
    23e0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    23e4:	48 01 c2             	add    rdx,rax
    23e7:	8b 85 10 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf0]
    23ed:	48 98                	cdqe   
    23ef:	48 0f af 85 68 ff ff 	imul   rax,QWORD PTR [rbp-0x98]
    23f6:	ff 
    23f7:	48 01 d0             	add    rax,rdx
    23fa:	48 89 c7             	mov    rdi,rax
    23fd:	8b 95 4c ff ff ff    	mov    edx,DWORD PTR [rbp-0xb4]
    2403:	8b 85 d4 fe ff ff    	mov    eax,DWORD PTR [rbp-0x12c]
    2409:	89 d1                	mov    ecx,edx
    240b:	48 89 f2             	mov    rdx,rsi
    240e:	89 c6                	mov    esi,eax
    2410:	e8 2b ec ff ff       	call   1040 <fill_reloc@plt>
            for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    2415:	83 85 10 ff ff ff 01 	add    DWORD PTR [rbp-0xf0],0x1
    241c:	8b 85 10 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf0]
    2422:	48 63 c8             	movsxd rcx,eax
    2425:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
    242c:	ba 00 00 00 00       	mov    edx,0x0
    2431:	48 f7 b5 68 ff ff ff 	div    QWORD PTR [rbp-0x98]
    2438:	48 39 c1             	cmp    rcx,rax
    243b:	72 8e                	jb     23cb <load_elfso+0xbd7>
        if (jmprelaentsz) {
    243d:	48 83 bd 68 ff ff ff 	cmp    QWORD PTR [rbp-0x98],0x0
    2444:	00 
    2445:	74 14                	je     245b <load_elfso+0xc67>
            mod->s_relentsz = jmprelaentsz;
    2447:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    244e:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
    2455:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
    2459:	eb 20                	jmp    247b <load_elfso+0xc87>
        }
        else {
            //编译器有的时候不给relasz或者relsz
            mod->s_relentsz = pltrel == DT_RELA ? sizeof(Elf64_Rela) : sizeof(Elf64_Rel);
    245b:	83 bd 4c ff ff ff 07 	cmp    DWORD PTR [rbp-0xb4],0x7
    2462:	75 07                	jne    246b <load_elfso+0xc77>
    2464:	ba 18 00 00 00       	mov    edx,0x18
    2469:	eb 05                	jmp    2470 <load_elfso+0xc7c>
    246b:	ba 10 00 00 00       	mov    edx,0x10
    2470:	48 8b 85 d8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x128]
    2477:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
        }
        if (init) {
    247b:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
    2482:	00 
    2483:	74 41                	je     24c6 <load_elfso+0xcd2>
            //调用模块入口函数
            for (int i = 0; i < init_arrsz; i++) {
    2485:	c7 85 0c ff ff ff 00 	mov    DWORD PTR [rbp-0xf4],0x0
    248c:	00 00 00 
    248f:	eb 24                	jmp    24b5 <load_elfso+0xcc1>
                (init + i * 8)();
    2491:	8b 85 0c ff ff ff    	mov    eax,DWORD PTR [rbp-0xf4]
    2497:	c1 e0 03             	shl    eax,0x3
    249a:	48 63 d0             	movsxd rdx,eax
    249d:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
    24a4:	48 01 c2             	add    rdx,rax
    24a7:	b8 00 00 00 00       	mov    eax,0x0
    24ac:	ff d2                	call   rdx
            for (int i = 0; i < init_arrsz; i++) {
    24ae:	83 85 0c ff ff ff 01 	add    DWORD PTR [rbp-0xf4],0x1
    24b5:	8b 85 0c ff ff ff    	mov    eax,DWORD PTR [rbp-0xf4]
    24bb:	48 98                	cdqe   
    24bd:	48 39 85 38 ff ff ff 	cmp    QWORD PTR [rbp-0xc8],rax
    24c4:	77 cb                	ja     2491 <load_elfso+0xc9d>
            }
        }
    }

    return entry;
    24c6:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
}
    24cd:	c9                   	leave  
    24ce:	c3                   	ret    

00000000000024cf <get_sym_addr>:
//返回指定模块中指定索引的符号地址，已经计算了加载偏移。
static off_t get_sym_addr(unsigned long modid, unsigned long symi)
{
    24cf:	f3 0f 1e fa          	endbr64 
    24d3:	55                   	push   rbp
    24d4:	48 89 e5             	mov    rbp,rsp
    24d7:	48 83 ec 40          	sub    rsp,0x40
    24db:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
    24df:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
    struct Elf64_Sym* sym = modules[modid].p_symbol;
    24e3:	48 8b 0d ee 3a 00 00 	mov    rcx,QWORD PTR [rip+0x3aee]        # 5fd8 <modules-0x1c8>
    24ea:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    24ee:	48 89 d0             	mov    rax,rdx
    24f1:	48 01 c0             	add    rax,rax
    24f4:	48 01 d0             	add    rax,rdx
    24f7:	48 c1 e0 05          	shl    rax,0x5
    24fb:	48 01 c8             	add    rax,rcx
    24fe:	48 83 c0 28          	add    rax,0x28
    2502:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2505:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    sym += symi;
    2509:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
    250d:	48 89 d0             	mov    rax,rdx
    2510:	48 01 c0             	add    rax,rax
    2513:	48 01 d0             	add    rax,rdx
    2516:	48 c1 e0 03          	shl    rax,0x3
    251a:	48 01 45 e8          	add    QWORD PTR [rbp-0x18],rax
    if (sym->st_shndx == SHN_COMMON) {
        //还没分配空间的符号，需要分配空间，st_value表示地址对齐约束
    }
    off_t symaddr = 0;
    251e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    2525:	00 
    if (sym->st_shndx != SHN_UNDEF && sym->st_value)
    2526:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    252a:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
    252e:	66 85 c0             	test   ax,ax
    2531:	74 43                	je     2576 <get_sym_addr+0xa7>
    2533:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2537:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    253b:	48 85 c0             	test   rax,rax
    253e:	74 36                	je     2576 <get_sym_addr+0xa7>
        symaddr = sym->st_value + modules[modid].load_offset;
    2540:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2544:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
    2548:	48 8b 35 89 3a 00 00 	mov    rsi,QWORD PTR [rip+0x3a89]        # 5fd8 <modules-0x1c8>
    254f:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    2553:	48 89 d0             	mov    rax,rdx
    2556:	48 01 c0             	add    rax,rax
    2559:	48 01 d0             	add    rax,rdx
    255c:	48 c1 e0 05          	shl    rax,0x5
    2560:	48 01 f0             	add    rax,rsi
    2563:	48 83 c0 08          	add    rax,0x8
    2567:	48 8b 00             	mov    rax,QWORD PTR [rax]
    256a:	48 01 c8             	add    rax,rcx
    256d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    2571:	e9 12 02 00 00       	jmp    2788 <get_sym_addr+0x2b9>
    else {
        //不在本模块，需要在别的模块符号表中寻找
        char* target_name = modules[modid].p_strtab + sym->st_name;
    2576:	48 8b 0d 5b 3a 00 00 	mov    rcx,QWORD PTR [rip+0x3a5b]        # 5fd8 <modules-0x1c8>
    257d:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    2581:	48 89 d0             	mov    rax,rdx
    2584:	48 01 c0             	add    rax,rax
    2587:	48 01 d0             	add    rax,rdx
    258a:	48 c1 e0 05          	shl    rax,0x5
    258e:	48 01 c8             	add    rax,rcx
    2591:	48 83 c0 40          	add    rax,0x40
    2595:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2598:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    259c:	8b 00                	mov    eax,DWORD PTR [rax]
    259e:	89 c0                	mov    eax,eax
    25a0:	48 01 d0             	add    rax,rdx
    25a3:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for (int i = 0; i < MAX_MODULES; i++) {
    25a7:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    25ae:	e9 cb 01 00 00       	jmp    277e <get_sym_addr+0x2af>
            if (modules[i].type == ET_NONE || i == modid)
    25b3:	48 8b 0d 1e 3a 00 00 	mov    rcx,QWORD PTR [rip+0x3a1e]        # 5fd8 <modules-0x1c8>
    25ba:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    25bd:	48 63 d0             	movsxd rdx,eax
    25c0:	48 89 d0             	mov    rax,rdx
    25c3:	48 01 c0             	add    rax,rax
    25c6:	48 01 d0             	add    rax,rdx
    25c9:	48 c1 e0 05          	shl    rax,0x5
    25cd:	48 01 c8             	add    rax,rcx
    25d0:	48 83 c0 18          	add    rax,0x18
    25d4:	48 8b 00             	mov    rax,QWORD PTR [rax]
    25d7:	48 85 c0             	test   rax,rax
    25da:	0f 84 96 01 00 00    	je     2776 <get_sym_addr+0x2a7>
    25e0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    25e3:	48 98                	cdqe   
    25e5:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
    25e9:	0f 84 87 01 00 00    	je     2776 <get_sym_addr+0x2a7>
                continue;
            sym = modules[i].p_symbol;
    25ef:	48 8b 0d e2 39 00 00 	mov    rcx,QWORD PTR [rip+0x39e2]        # 5fd8 <modules-0x1c8>
    25f6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    25f9:	48 63 d0             	movsxd rdx,eax
    25fc:	48 89 d0             	mov    rax,rdx
    25ff:	48 01 c0             	add    rax,rax
    2602:	48 01 d0             	add    rax,rdx
    2605:	48 c1 e0 05          	shl    rax,0x5
    2609:	48 01 c8             	add    rax,rcx
    260c:	48 83 c0 28          	add    rax,0x28
    2610:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2613:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            if (!sym)
    2617:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
    261c:	0f 84 57 01 00 00    	je     2779 <get_sym_addr+0x2aa>
                continue;
            for (int j = 0; j < modules[i].s_symtabsz / sizeof(struct Elf64_Sym); j++) {
    2622:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
    2629:	e9 ff 00 00 00       	jmp    272d <get_sym_addr+0x25e>
                //获取符号名称
                if (!sym[j].st_name)
    262e:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    2631:	48 63 d0             	movsxd rdx,eax
    2634:	48 89 d0             	mov    rax,rdx
    2637:	48 01 c0             	add    rax,rax
    263a:	48 01 d0             	add    rax,rdx
    263d:	48 c1 e0 03          	shl    rax,0x3
    2641:	48 89 c2             	mov    rdx,rax
    2644:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2648:	48 01 d0             	add    rax,rdx
    264b:	8b 00                	mov    eax,DWORD PTR [rax]
    264d:	85 c0                	test   eax,eax
    264f:	0f 84 d3 00 00 00    	je     2728 <get_sym_addr+0x259>
                    continue;
                char* symname = modules[i].p_strtab + sym[j].st_name;
    2655:	48 8b 0d 7c 39 00 00 	mov    rcx,QWORD PTR [rip+0x397c]        # 5fd8 <modules-0x1c8>
    265c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    265f:	48 63 d0             	movsxd rdx,eax
    2662:	48 89 d0             	mov    rax,rdx
    2665:	48 01 c0             	add    rax,rax
    2668:	48 01 d0             	add    rax,rdx
    266b:	48 c1 e0 05          	shl    rax,0x5
    266f:	48 01 c8             	add    rax,rcx
    2672:	48 83 c0 40          	add    rax,0x40
    2676:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    2679:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    267c:	48 63 d0             	movsxd rdx,eax
    267f:	48 89 d0             	mov    rax,rdx
    2682:	48 01 c0             	add    rax,rax
    2685:	48 01 d0             	add    rax,rdx
    2688:	48 c1 e0 03          	shl    rax,0x3
    268c:	48 89 c2             	mov    rdx,rax
    268f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2693:	48 01 d0             	add    rax,rdx
    2696:	8b 00                	mov    eax,DWORD PTR [rax]
    2698:	89 c0                	mov    eax,eax
    269a:	48 01 c8             	add    rax,rcx
    269d:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
                if (sym[j].st_value && dlstrcmp(target_name, symname) == 0) {
    26a1:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    26a4:	48 63 d0             	movsxd rdx,eax
    26a7:	48 89 d0             	mov    rax,rdx
    26aa:	48 01 c0             	add    rax,rax
    26ad:	48 01 d0             	add    rax,rdx
    26b0:	48 c1 e0 03          	shl    rax,0x3
    26b4:	48 89 c2             	mov    rdx,rax
    26b7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    26bb:	48 01 d0             	add    rax,rdx
    26be:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    26c2:	48 85 c0             	test   rax,rax
    26c5:	74 62                	je     2729 <get_sym_addr+0x25a>
    26c7:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
    26cb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    26cf:	48 89 d6             	mov    rsi,rdx
    26d2:	48 89 c7             	mov    rdi,rax
    26d5:	e8 a6 e9 ff ff       	call   1080 <dlstrcmp@plt>
    26da:	85 c0                	test   eax,eax
    26dc:	75 4b                	jne    2729 <get_sym_addr+0x25a>
                    return modules[i].load_offset + sym[j].st_value;
    26de:	48 8b 0d f3 38 00 00 	mov    rcx,QWORD PTR [rip+0x38f3]        # 5fd8 <modules-0x1c8>
    26e5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    26e8:	48 63 d0             	movsxd rdx,eax
    26eb:	48 89 d0             	mov    rax,rdx
    26ee:	48 01 c0             	add    rax,rax
    26f1:	48 01 d0             	add    rax,rdx
    26f4:	48 c1 e0 05          	shl    rax,0x5
    26f8:	48 01 c8             	add    rax,rcx
    26fb:	48 83 c0 08          	add    rax,0x8
    26ff:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    2702:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    2705:	48 63 d0             	movsxd rdx,eax
    2708:	48 89 d0             	mov    rax,rdx
    270b:	48 01 c0             	add    rax,rax
    270e:	48 01 d0             	add    rax,rdx
    2711:	48 c1 e0 03          	shl    rax,0x3
    2715:	48 89 c2             	mov    rdx,rax
    2718:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    271c:	48 01 d0             	add    rax,rdx
    271f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2723:	48 01 c8             	add    rax,rcx
    2726:	eb 64                	jmp    278c <get_sym_addr+0x2bd>
                    continue;
    2728:	90                   	nop
            for (int j = 0; j < modules[i].s_symtabsz / sizeof(struct Elf64_Sym); j++) {
    2729:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
    272d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    2730:	48 63 c8             	movsxd rcx,eax
    2733:	48 8b 35 9e 38 00 00 	mov    rsi,QWORD PTR [rip+0x389e]        # 5fd8 <modules-0x1c8>
    273a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    273d:	48 63 d0             	movsxd rdx,eax
    2740:	48 89 d0             	mov    rax,rdx
    2743:	48 01 c0             	add    rax,rax
    2746:	48 01 d0             	add    rax,rdx
    2749:	48 c1 e0 05          	shl    rax,0x5
    274d:	48 01 f0             	add    rax,rsi
    2750:	48 83 c0 48          	add    rax,0x48
    2754:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2757:	48 ba ab aa aa aa aa 	movabs rdx,0xaaaaaaaaaaaaaaab
    275e:	aa aa aa 
    2761:	48 f7 e2             	mul    rdx
    2764:	48 89 d0             	mov    rax,rdx
    2767:	48 c1 e8 04          	shr    rax,0x4
    276b:	48 39 c1             	cmp    rcx,rax
    276e:	0f 82 ba fe ff ff    	jb     262e <get_sym_addr+0x15f>
    2774:	eb 04                	jmp    277a <get_sym_addr+0x2ab>
                continue;
    2776:	90                   	nop
    2777:	eb 01                	jmp    277a <get_sym_addr+0x2ab>
                continue;
    2779:	90                   	nop
        for (int i = 0; i < MAX_MODULES; i++) {
    277a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
    277e:	83 7d f4 7f          	cmp    DWORD PTR [rbp-0xc],0x7f
    2782:	0f 8e 2b fe ff ff    	jle    25b3 <get_sym_addr+0xe4>
                }
            }
        }
    }
    return symaddr;
    2788:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
    278c:	c9                   	leave  
    278d:	c3                   	ret    

000000000000278e <dlstrcmp>:
int dlstrcmp(char* src, char* dst)
{
    278e:	f3 0f 1e fa          	endbr64 
    2792:	55                   	push   rbp
    2793:	48 89 e5             	mov    rbp,rsp
    2796:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    279a:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while (*src++ && *dst++) {
    279e:	eb 2c                	jmp    27cc <dlstrcmp+0x3e>
        if (*src != *dst) {
    27a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    27a4:	0f b6 10             	movzx  edx,BYTE PTR [rax]
    27a7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    27ab:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    27ae:	38 c2                	cmp    dl,al
    27b0:	74 1a                	je     27cc <dlstrcmp+0x3e>
            return *src - *dst;
    27b2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    27b6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    27b9:	0f be d0             	movsx  edx,al
    27bc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    27c0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    27c3:	0f be c8             	movsx  ecx,al
    27c6:	89 d0                	mov    eax,edx
    27c8:	29 c8                	sub    eax,ecx
    27ca:	eb 2b                	jmp    27f7 <dlstrcmp+0x69>
    while (*src++ && *dst++) {
    27cc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    27d0:	48 8d 50 01          	lea    rdx,[rax+0x1]
    27d4:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
    27d8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    27db:	84 c0                	test   al,al
    27dd:	74 13                	je     27f2 <dlstrcmp+0x64>
    27df:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    27e3:	48 8d 50 01          	lea    rdx,[rax+0x1]
    27e7:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    27eb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    27ee:	84 c0                	test   al,al
    27f0:	75 ae                	jne    27a0 <dlstrcmp+0x12>
        }
    }
    return 0;
    27f2:	b8 00 00 00 00       	mov    eax,0x0
}
    27f7:	5d                   	pop    rbp
    27f8:	c3                   	ret    

00000000000027f9 <get_load_base>:
static off_t get_load_base(unsigned long modid)
{
    27f9:	f3 0f 1e fa          	endbr64 
    27fd:	55                   	push   rbp
    27fe:	48 89 e5             	mov    rbp,rsp
    2801:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return modules[modid].base;
    2805:	48 8b 0d cc 37 00 00 	mov    rcx,QWORD PTR [rip+0x37cc]        # 5fd8 <modules-0x1c8>
    280c:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2810:	48 89 d0             	mov    rax,rdx
    2813:	48 01 c0             	add    rax,rax
    2816:	48 01 d0             	add    rax,rdx
    2819:	48 c1 e0 05          	shl    rax,0x5
    281d:	48 01 c8             	add    rax,rcx
    2820:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
    2823:	5d                   	pop    rbp
    2824:	c3                   	ret    

0000000000002825 <get_got>:
off_t get_got(unsigned long modid)
{
    2825:	f3 0f 1e fa          	endbr64 
    2829:	55                   	push   rbp
    282a:	48 89 e5             	mov    rbp,rsp
    282d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return modules[modid].p_got;
    2831:	48 8b 0d a0 37 00 00 	mov    rcx,QWORD PTR [rip+0x37a0]        # 5fd8 <modules-0x1c8>
    2838:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    283c:	48 89 d0             	mov    rax,rdx
    283f:	48 01 c0             	add    rax,rax
    2842:	48 01 d0             	add    rax,rdx
    2845:	48 c1 e0 05          	shl    rax,0x5
    2849:	48 01 c8             	add    rax,rcx
    284c:	48 83 c0 30          	add    rax,0x30
    2850:	48 8b 00             	mov    rax,QWORD PTR [rax]
}
    2853:	5d                   	pop    rbp
    2854:	c3                   	ret    

0000000000002855 <dl_runtime_resolve>:
static void dl_runtime_resolve()
{
    2855:	f3 0f 1e fa          	endbr64 
    2859:	55                   	push   rbp
    285a:	48 89 e5             	mov    rbp,rsp
    285d:	48 83 ec 40          	sub    rsp,0x40
    //需要先保存寄存器，里面可能保存了函数的参数
    __asm__ volatile("push %rdi\n push %rsi\n push %rcx\n push %rdx\n push %r8\n push %r9\n");
    2861:	57                   	push   rdi
    2862:	56                   	push   rsi
    2863:	51                   	push   rcx
    2864:	52                   	push   rdx
    2865:	41 50                	push   r8
    2867:	41 51                	push   r9
    //获取modid
    unsigned long long modid, rel_offset;
    __asm__ volatile("mov 8(%%rbp),%%rax\n mov %%rax,%0" : "=m"(modid));
    2869:	48 8b 45 08          	mov    rax,QWORD PTR [rbp+0x8]
    286d:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    __asm__ volatile("mov 16(%%rbp),%%rax\n mov %%rax,%0" : "=m"(rel_offset));
    2871:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
    2875:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

    //排除COPY项的影响，他们不算在索引内
    Elf64_Rel* rel_table = modules[modid].p_reloc;
    2879:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    287d:	48 8b 0d 54 37 00 00 	mov    rcx,QWORD PTR [rip+0x3754]        # 5fd8 <modules-0x1c8>
    2884:	48 89 d0             	mov    rax,rdx
    2887:	48 01 c0             	add    rax,rax
    288a:	48 01 d0             	add    rax,rdx
    288d:	48 c1 e0 05          	shl    rax,0x5
    2891:	48 01 c8             	add    rax,rcx
    2894:	48 83 c0 50          	add    rax,0x50
    2898:	48 8b 00             	mov    rax,QWORD PTR [rax]
    289b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int        eff = 0, i = 0;
    289f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    28a6:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if (ELF64_R_TYPE(rel_table[0].r_info) == R_X86_64_COPY)   //第一项就是COPY
    28ad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    28b1:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    28b5:	89 c0                	mov    eax,eax
    28b7:	48 83 f8 05          	cmp    rax,0x5
    28bb:	75 2d                	jne    28ea <dl_runtime_resolve+0x95>
        i++;
    28bd:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
    for (; eff < rel_offset && i < 37268; i++) {
    28c1:	eb 27                	jmp    28ea <dl_runtime_resolve+0x95>
        if (ELF64_R_TYPE(rel_table[i].r_info) != R_X86_64_COPY)
    28c3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
    28c6:	48 98                	cdqe   
    28c8:	48 c1 e0 04          	shl    rax,0x4
    28cc:	48 89 c2             	mov    rdx,rax
    28cf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    28d3:	48 01 d0             	add    rax,rdx
    28d6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    28da:	89 c0                	mov    eax,eax
    28dc:	48 83 f8 05          	cmp    rax,0x5
    28e0:	74 04                	je     28e6 <dl_runtime_resolve+0x91>
            eff++;
    28e2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for (; eff < rel_offset && i < 37268; i++) {
    28e6:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
    28ea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    28ed:	48 63 d0             	movsxd rdx,eax
    28f0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    28f4:	48 39 c2             	cmp    rdx,rax
    28f7:	73 09                	jae    2902 <dl_runtime_resolve+0xad>
    28f9:	81 7d f8 93 91 00 00 	cmp    DWORD PTR [rbp-0x8],0x9193
    2900:	7e c1                	jle    28c3 <dl_runtime_resolve+0x6e>
    }

    Elf64_Rel* rel     = i * modules[modid].s_relentsz + modules[modid].p_reloc;
    2902:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
    2905:	48 63 c8             	movsxd rcx,eax
    2908:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    290c:	48 8b 35 c5 36 00 00 	mov    rsi,QWORD PTR [rip+0x36c5]        # 5fd8 <modules-0x1c8>
    2913:	48 89 d0             	mov    rax,rdx
    2916:	48 01 c0             	add    rax,rax
    2919:	48 01 d0             	add    rax,rdx
    291c:	48 c1 e0 05          	shl    rax,0x5
    2920:	48 01 f0             	add    rax,rsi
    2923:	48 83 c0 58          	add    rax,0x58
    2927:	48 8b 00             	mov    rax,QWORD PTR [rax]
    292a:	48 0f af c8          	imul   rcx,rax
    292e:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    2932:	48 8b 35 9f 36 00 00 	mov    rsi,QWORD PTR [rip+0x369f]        # 5fd8 <modules-0x1c8>
    2939:	48 89 d0             	mov    rax,rdx
    293c:	48 01 c0             	add    rax,rax
    293f:	48 01 d0             	add    rax,rdx
    2942:	48 c1 e0 05          	shl    rax,0x5
    2946:	48 01 f0             	add    rax,rsi
    2949:	48 83 c0 50          	add    rax,0x50
    294d:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2950:	48 01 c8             	add    rax,rcx
    2953:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int        symi    = ELF64_R_SYM(rel->r_info);
    2957:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    295b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    295f:	48 c1 e8 20          	shr    rax,0x20
    2963:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    off_t      sym_off = get_sym_addr(modid, symi);
    2966:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
    2969:	48 63 d0             	movsxd rdx,eax
    296c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2970:	48 89 d6             	mov    rsi,rdx
    2973:	48 89 c7             	mov    rdi,rax
    2976:	e8 54 fb ff ff       	call   24cf <get_sym_addr>
    297b:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    //必然是R_X86_64_JUMP_SLOT
    off_t* v_rel = rel->r_offset + modules[modid].load_offset;
    297f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2983:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    2986:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
    298a:	48 8b 35 47 36 00 00 	mov    rsi,QWORD PTR [rip+0x3647]        # 5fd8 <modules-0x1c8>
    2991:	48 89 d0             	mov    rax,rdx
    2994:	48 01 c0             	add    rax,rax
    2997:	48 01 d0             	add    rax,rdx
    299a:	48 c1 e0 05          	shl    rax,0x5
    299e:	48 01 f0             	add    rax,rsi
    29a1:	48 83 c0 08          	add    rax,0x8
    29a5:	48 8b 00             	mov    rax,QWORD PTR [rax]
    29a8:	48 01 c8             	add    rax,rcx
    29ab:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    *v_rel       = sym_off;
    29af:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
    29b3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    29b7:	48 89 10             	mov    QWORD PTR [rax],rdx

    //恢复原函数调用参数
    __asm__ volatile("pop %r9\n pop %r8\n pop %rdx\n pop %rcx\n pop %rsi\n pop %rdi\n");
    29ba:	41 59                	pop    r9
    29bc:	41 58                	pop    r8
    29be:	5a                   	pop    rdx
    29bf:	59                   	pop    rcx
    29c0:	5e                   	pop    rsi
    29c1:	5f                   	pop    rdi
    //重定位完毕，直接返回到目标地址
    __asm__ volatile("mov %0,%%rax\n leave\n add $16,%%rsp\n jmp *%%rax\n" ::"m"(sym_off));
    29c2:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    29c6:	c9                   	leave  
    29c7:	48 83 c4 10          	add    rsp,0x10
    29cb:	ff e0                	jmp    rax
}
    29cd:	90                   	nop
    29ce:	c9                   	leave  
    29cf:	c3                   	ret    

00000000000029d0 <fill_reloc>:

void fill_reloc(void* relp, int modid, void* shdrs, int rela)
{
    29d0:	f3 0f 1e fa          	endbr64 
    29d4:	55                   	push   rbp
    29d5:	48 89 e5             	mov    rbp,rsp
    29d8:	48 83 ec 50          	sub    rsp,0x50
    29dc:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
    29e0:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
    29e3:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    29e7:	89 4d c0             	mov    DWORD PTR [rbp-0x40],ecx
    Elf64_Rela* rel  = relp;
    29ea:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    29ee:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int         symi = ELF64_R_SYM(rel->r_info), type = ELF64_R_TYPE(rel->r_info);
    29f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    29f6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    29fa:	48 c1 e8 20          	shr    rax,0x20
    29fe:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    2a01:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2a05:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2a09:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    off_t       sym_off   = get_sym_addr(modid, symi);
    2a0c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    2a0f:	48 63 d0             	movsxd rdx,eax
    2a12:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    2a15:	48 98                	cdqe   
    2a17:	48 89 d6             	mov    rsi,rdx
    2a1a:	48 89 c7             	mov    rdi,rax
    2a1d:	e8 ad fa ff ff       	call   24cf <get_sym_addr>
    2a22:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    off_t       load_base = get_load_base(modid);
    2a26:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    2a29:	48 98                	cdqe   
    2a2b:	48 89 c7             	mov    rdi,rax
    2a2e:	e8 c6 fd ff ff       	call   27f9 <get_load_base>
    2a33:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    off_t       got       = get_got(modid);
    2a37:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
    2a3a:	48 98                	cdqe   
    2a3c:	48 89 c7             	mov    rdi,rax
    2a3f:	e8 dc e5 ff ff       	call   1020 <get_got@plt>
    2a44:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    //这里假定获取符号的地址是正确的，可以不修改符号表，而是通过记录模块整体加载地址，
    //来加上偏移量获取正确的符号地址
    off_t* v_rel = rel->r_offset + load_base;
    2a48:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2a4c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2a4f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2a53:	48 01 d0             	add    rax,rdx
    2a56:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    switch (type) {
    2a5a:	83 7d f0 0b          	cmp    DWORD PTR [rbp-0x10],0xb
    2a5e:	0f 87 45 01 00 00    	ja     2ba9 <fill_reloc+0x1d9>
    2a64:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
    2a67:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    2a6e:	00 
    2a6f:	48 8d 05 6a 16 00 00 	lea    rax,[rip+0x166a]        # 40e0 <chkmmap+0x320>
    2a76:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    2a79:	48 98                	cdqe   
    2a7b:	48 8d 15 5e 16 00 00 	lea    rdx,[rip+0x165e]        # 40e0 <chkmmap+0x320>
    2a82:	48 01 d0             	add    rax,rdx
    2a85:	3e ff e0             	notrack jmp rax
    case R_X86_64_GLOB_DAT:
    case R_X86_64_JUMP_SLOT: *v_rel = sym_off; break;
    2a88:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2a8c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
    2a90:	48 89 10             	mov    QWORD PTR [rax],rdx
    2a93:	e9 12 01 00 00       	jmp    2baa <fill_reloc+0x1da>
    case R_X86_64_RELATIVE:
        if (rela)
    2a98:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    2a9c:	74 1e                	je     2abc <fill_reloc+0xec>
            *v_rel = rel->r_addend + load_base;
    2a9e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2aa2:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2aa6:	48 89 c2             	mov    rdx,rax
    2aa9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2aad:	48 01 c2             	add    rdx,rax
    2ab0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2ab4:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += load_base;
        break;
    2ab7:	e9 ee 00 00 00       	jmp    2baa <fill_reloc+0x1da>
            *v_rel += load_base;
    2abc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2ac0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2ac3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2ac7:	48 01 c2             	add    rdx,rax
    2aca:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2ace:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2ad1:	e9 d4 00 00 00       	jmp    2baa <fill_reloc+0x1da>
    case R_X86_64_GOTPC:
        if (rela)
    2ad6:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    2ada:	74 28                	je     2b04 <fill_reloc+0x134>
            *v_rel = got + rel->r_addend - rel->r_offset;
    2adc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2ae0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2ae4:	48 89 c2             	mov    rdx,rax
    2ae7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2aeb:	48 01 c2             	add    rdx,rax
    2aee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2af2:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2af5:	48 29 c2             	sub    rdx,rax
    2af8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2afc:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += got - (unsigned long long)rel;
        break;
    2aff:	e9 a6 00 00 00       	jmp    2baa <fill_reloc+0x1da>
            *v_rel += got - (unsigned long long)rel;
    2b04:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b08:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2b0b:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
    2b0f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2b13:	48 29 c8             	sub    rax,rcx
    2b16:	48 01 c2             	add    rdx,rax
    2b19:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b1d:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2b20:	e9 85 00 00 00       	jmp    2baa <fill_reloc+0x1da>
    case R_X86_64_32S:
    case R_X86_64_64:
        if (rela)
    2b25:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    2b29:	74 17                	je     2b42 <fill_reloc+0x172>
            *v_rel += sym_off;
    2b2b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b2f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2b32:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2b36:	48 01 c2             	add    rdx,rax
    2b39:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b3d:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off;
        break;
    2b40:	eb 68                	jmp    2baa <fill_reloc+0x1da>
            *v_rel = rel->r_addend + sym_off;
    2b42:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2b46:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2b4a:	48 89 c2             	mov    rdx,rax
    2b4d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2b51:	48 01 c2             	add    rdx,rax
    2b54:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b58:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2b5b:	eb 4d                	jmp    2baa <fill_reloc+0x1da>
    case R_X86_64_PC32:
        if (rela)
    2b5d:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
    2b61:	74 21                	je     2b84 <fill_reloc+0x1b4>
            *v_rel += sym_off - rel->r_offset;
    2b63:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b67:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    2b6a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2b6e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    2b71:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2b75:	48 29 c8             	sub    rax,rcx
    2b78:	48 01 c2             	add    rdx,rax
    2b7b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2b7f:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
        break;
    2b82:	eb 26                	jmp    2baa <fill_reloc+0x1da>
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
    2b84:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2b88:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    2b8c:	48 89 c2             	mov    rdx,rax
    2b8f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2b93:	48 01 c2             	add    rdx,rax
    2b96:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    2b9a:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2b9d:	48 29 c2             	sub    rdx,rax
    2ba0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2ba4:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    2ba7:	eb 01                	jmp    2baa <fill_reloc+0x1da>
    default: break;
    2ba9:	90                   	nop
    }
}
    2baa:	90                   	nop
    2bab:	c9                   	leave  
    2bac:	c3                   	ret    

0000000000002bad <set_symtab>:
void set_symtab(void* symtab, int modid)
{
    2bad:	f3 0f 1e fa          	endbr64 
    2bb1:	55                   	push   rbp
    2bb2:	48 89 e5             	mov    rbp,rsp
    2bb5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    2bb9:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    if (modid >= MAX_SYMTABS)
    2bbc:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
    2bc0:	7f 17                	jg     2bd9 <set_symtab+0x2c>
        return;
    symtabs[modid] = symtab;
    2bc2:	48 8b 05 2f 34 00 00 	mov    rax,QWORD PTR [rip+0x342f]        # 5ff8 <symtabs-0xa8>
    2bc9:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
    2bcc:	48 63 d2             	movsxd rdx,edx
    2bcf:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
    2bd3:	48 89 0c d0          	mov    QWORD PTR [rax+rdx*8],rcx
    2bd7:	eb 01                	jmp    2bda <set_symtab+0x2d>
        return;
    2bd9:	90                   	nop
}
    2bda:	5d                   	pop    rbp
    2bdb:	c3                   	ret    

0000000000002bdc <reg_module>:

static int reg_module()
{
    2bdc:	f3 0f 1e fa          	endbr64 
    2be0:	55                   	push   rbp
    2be1:	48 89 e5             	mov    rbp,rsp
    int i = 0;
    2be4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for (; i < MAX_MODULES; i++) {
    2beb:	eb 32                	jmp    2c1f <reg_module+0x43>
        if (modules[i].type == ET_NONE) {
    2bed:	48 8b 0d e4 33 00 00 	mov    rcx,QWORD PTR [rip+0x33e4]        # 5fd8 <modules-0x1c8>
    2bf4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    2bf7:	48 63 d0             	movsxd rdx,eax
    2bfa:	48 89 d0             	mov    rax,rdx
    2bfd:	48 01 c0             	add    rax,rax
    2c00:	48 01 d0             	add    rax,rdx
    2c03:	48 c1 e0 05          	shl    rax,0x5
    2c07:	48 01 c8             	add    rax,rcx
    2c0a:	48 83 c0 18          	add    rax,0x18
    2c0e:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2c11:	48 85 c0             	test   rax,rax
    2c14:	75 05                	jne    2c1b <reg_module+0x3f>
            return i;
    2c16:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    2c19:	eb 0f                	jmp    2c2a <reg_module+0x4e>
    for (; i < MAX_MODULES; i++) {
    2c1b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    2c1f:	83 7d fc 7f          	cmp    DWORD PTR [rbp-0x4],0x7f
    2c23:	7e c8                	jle    2bed <reg_module+0x11>
        }
    }
    return -1;
    2c25:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
    2c2a:	5d                   	pop    rbp
    2c2b:	c3                   	ret    

0000000000002c2c <dl_init>:
static int dl_init(void* load_offset)
{
    2c2c:	f3 0f 1e fa          	endbr64 
    2c30:	55                   	push   rbp
    2c31:	48 89 e5             	mov    rbp,rsp
    2c34:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
    2c3b:	48 89 bd 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdi
    //自举，不能调用任何全局函数和使用任何全局变量，完成自身重定位
    Elf64_Ehdr*       ehdr = load_offset;
    2c42:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2c49:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    Elf64_Phdr*       ph   = ehdr->e_phoff;
    2c50:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
    2c57:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
    2c5b:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    Elf64_Dyn*        dyn  = &_DYNAMIC;
    2c62:	48 8b 05 67 33 00 00 	mov    rax,QWORD PTR [rip+0x3367]        # 5fd0 <_DYNAMIC+0x120>
    2c69:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    struct Elf64_Sym* sym  = 0;
    2c70:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
    2c77:	00 

    size_t              relsz = 0, relentsz = 0;
    2c78:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
    2c7f:	00 
    2c80:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
    2c87:	00 
    size_t              relasz = 0, relaentsz = 0;
    2c88:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
    2c8f:	00 
    2c90:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
    2c97:	00 
    size_t              jmprelsz = 0, jmprelaentsz = 0;
    2c98:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
    2c9f:	00 
    2ca0:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
    2ca7:	00 
    unsigned long long  relptr = 0, relaptr = 0, jmprelptr = 0;
    2ca8:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
    2caf:	00 
    2cb0:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
    2cb7:	00 
    2cb8:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
    2cbf:	00 
    int                 pltrel = 0;
    2cc0:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
    unsigned long long* got    = 0;
    2cc7:	48 c7 45 a0 00 00 00 	mov    QWORD PTR [rbp-0x60],0x0
    2cce:	00 

    int bind_now = 0;
    2ccf:	c7 45 9c 00 00 00 00 	mov    DWORD PTR [rbp-0x64],0x0
    for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    2cd6:	48 8b 85 68 ff ff ff 	mov    rax,QWORD PTR [rbp-0x98]
    2cdd:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
    2ce1:	e9 2a 01 00 00       	jmp    2e10 <dl_init+0x1e4>
        char* pathname = 0;
    2ce6:	48 c7 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],0x0
    2ced:	00 00 00 00 
        int   so_fno   = 0;
    2cf1:	c7 85 5c ff ff ff 00 	mov    DWORD PTR [rbp-0xa4],0x0
    2cf8:	00 00 00 
        switch (p->d_tag) {
    2cfb:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2cff:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2d02:	48 83 f8 18          	cmp    rax,0x18
    2d06:	0f 87 fe 00 00 00    	ja     2e0a <dl_init+0x1de>
    2d0c:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    2d13:	00 
    2d14:	48 8d 05 f5 13 00 00 	lea    rax,[rip+0x13f5]        # 4110 <chkmmap+0x350>
    2d1b:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    2d1e:	48 98                	cdqe   
    2d20:	48 8d 15 e9 13 00 00 	lea    rdx,[rip+0x13e9]        # 4110 <chkmmap+0x350>
    2d27:	48 01 d0             	add    rax,rdx
    2d2a:	3e ff e0             	notrack jmp rax
        case DT_PLTGOT:   //赋值为dl的运行时重定位函数
            got    = p->d_un.d_ptr + load_offset;
    2d2d:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2d31:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    2d35:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2d3c:	48 01 d0             	add    rax,rdx
    2d3f:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
            got[2] = dl_runtime_resolve;
    2d43:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    2d47:	48 83 c0 10          	add    rax,0x10
    2d4b:	48 8d 15 03 fb ff ff 	lea    rdx,[rip+0xfffffffffffffb03]        # 2855 <dl_runtime_resolve>
    2d52:	48 89 10             	mov    QWORD PTR [rax],rdx
            //填入模块id
            got[1] = 0;
    2d55:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
    2d59:	48 83 c0 08          	add    rax,0x8
    2d5d:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
            break;
    2d64:	e9 a2 00 00 00       	jmp    2e0b <dl_init+0x1df>
        case DT_SYMTAB: sym = p->d_un.d_ptr + load_offset; break;
    2d69:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2d6d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
    2d71:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2d78:	48 01 d0             	add    rax,rdx
    2d7b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    2d7f:	e9 87 00 00 00       	jmp    2e0b <dl_init+0x1df>
        case DT_PLTRELSZ: jmprelsz = p->d_un.d_val; break;
    2d84:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2d88:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2d8c:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    2d90:	eb 79                	jmp    2e0b <dl_init+0x1df>
        case DT_RELSZ: relsz = p->d_un.d_val; break;
    2d92:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2d96:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2d9a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    2d9e:	eb 6b                	jmp    2e0b <dl_init+0x1df>
        case DT_RELASZ: relasz = p->d_un.d_val; break;
    2da0:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2da4:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2da8:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    2dac:	eb 5d                	jmp    2e0b <dl_init+0x1df>
        case DT_PLTREL: pltrel = p->d_un.d_val; break;
    2dae:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2db2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2db6:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    2db9:	eb 50                	jmp    2e0b <dl_init+0x1df>
        case DT_JMPREL: jmprelptr = p->d_un.d_val; break;
    2dbb:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2dbf:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2dc3:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
    2dc7:	eb 42                	jmp    2e0b <dl_init+0x1df>
        case DT_REL: relptr = p->d_un.d_ptr; break;
    2dc9:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2dcd:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2dd1:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    2dd5:	eb 34                	jmp    2e0b <dl_init+0x1df>
        case DT_RELA: relaptr = p->d_un.d_ptr; break;
    2dd7:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2ddb:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2ddf:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    2de3:	eb 26                	jmp    2e0b <dl_init+0x1df>
        case DT_RELENT: relentsz = p->d_un.d_val; break;
    2de5:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2de9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2ded:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    2df1:	eb 18                	jmp    2e0b <dl_init+0x1df>
        case DT_RELAENT: relaentsz = p->d_un.d_val; break;
    2df3:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2df7:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    2dfb:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    2dff:	eb 0a                	jmp    2e0b <dl_init+0x1df>
        case DT_BIND_NOW: bind_now = 1; break;
    2e01:	c7 45 9c 01 00 00 00 	mov    DWORD PTR [rbp-0x64],0x1
    2e08:	eb 01                	jmp    2e0b <dl_init+0x1df>
        default: break;
    2e0a:	90                   	nop
    for (Elf64_Dyn* p = dyn; p->d_tag; p++) {
    2e0b:	48 83 45 90 10       	add    QWORD PTR [rbp-0x70],0x10
    2e10:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
    2e14:	48 8b 00             	mov    rax,QWORD PTR [rax]
    2e17:	48 85 c0             	test   rax,rax
    2e1a:	0f 85 c6 fe ff ff    	jne    2ce6 <dl_init+0xba>
        }
    }
    if (relptr && relentsz && relsz)   // REL
    2e20:	48 83 7d c0 00       	cmp    QWORD PTR [rbp-0x40],0x0
    2e25:	74 72                	je     2e99 <dl_init+0x26d>
    2e27:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
    2e2c:	74 6b                	je     2e99 <dl_init+0x26d>
    2e2e:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
    2e33:	74 64                	je     2e99 <dl_init+0x26d>
        for (int j = 0; j < relsz / relentsz; j++)
    2e35:	c7 45 8c 00 00 00 00 	mov    DWORD PTR [rbp-0x74],0x0
    2e3c:	eb 43                	jmp    2e81 <dl_init+0x255>
            init_fill_reloc(relptr + load_offset + j * relentsz, load_offset, sym, 0, got);
    2e3e:	48 8b 4d a0          	mov    rcx,QWORD PTR [rbp-0x60]
    2e42:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2e49:	8b 55 8c             	mov    edx,DWORD PTR [rbp-0x74]
    2e4c:	48 63 d2             	movsxd rdx,edx
    2e4f:	48 89 d6             	mov    rsi,rdx
    2e52:	48 0f af 75 e8       	imul   rsi,QWORD PTR [rbp-0x18]
    2e57:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
    2e5b:	48 01 d6             	add    rsi,rdx
    2e5e:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2e65:	48 8d 3c 16          	lea    rdi,[rsi+rdx*1]
    2e69:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2e6d:	49 89 c8             	mov    r8,rcx
    2e70:	b9 00 00 00 00       	mov    ecx,0x0
    2e75:	48 89 c6             	mov    rsi,rax
    2e78:	e8 0c 02 00 00       	call   3089 <init_fill_reloc>
        for (int j = 0; j < relsz / relentsz; j++)
    2e7d:	83 45 8c 01          	add    DWORD PTR [rbp-0x74],0x1
    2e81:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
    2e84:	48 63 c8             	movsxd rcx,eax
    2e87:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    2e8b:	ba 00 00 00 00       	mov    edx,0x0
    2e90:	48 f7 75 e8          	div    QWORD PTR [rbp-0x18]
    2e94:	48 39 c1             	cmp    rcx,rax
    2e97:	72 a5                	jb     2e3e <dl_init+0x212>
    if (relaptr && relaentsz && relasz)   // RELA
    2e99:	48 83 7d b8 00       	cmp    QWORD PTR [rbp-0x48],0x0
    2e9e:	74 72                	je     2f12 <dl_init+0x2e6>
    2ea0:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
    2ea5:	74 6b                	je     2f12 <dl_init+0x2e6>
    2ea7:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
    2eac:	74 64                	je     2f12 <dl_init+0x2e6>
        for (int j = 0; j < relasz / relaentsz; j++)
    2eae:	c7 45 88 00 00 00 00 	mov    DWORD PTR [rbp-0x78],0x0
    2eb5:	eb 43                	jmp    2efa <dl_init+0x2ce>
            init_fill_reloc(relaptr + load_offset + j * relaentsz, load_offset, sym, 1, got);
    2eb7:	48 8b 4d a0          	mov    rcx,QWORD PTR [rbp-0x60]
    2ebb:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
    2ec2:	8b 55 88             	mov    edx,DWORD PTR [rbp-0x78]
    2ec5:	48 63 d2             	movsxd rdx,edx
    2ec8:	48 89 d6             	mov    rsi,rdx
    2ecb:	48 0f af 75 d8       	imul   rsi,QWORD PTR [rbp-0x28]
    2ed0:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
    2ed4:	48 01 d6             	add    rsi,rdx
    2ed7:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2ede:	48 8d 3c 16          	lea    rdi,[rsi+rdx*1]
    2ee2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2ee6:	49 89 c8             	mov    r8,rcx
    2ee9:	b9 01 00 00 00       	mov    ecx,0x1
    2eee:	48 89 c6             	mov    rsi,rax
    2ef1:	e8 93 01 00 00       	call   3089 <init_fill_reloc>
        for (int j = 0; j < relasz / relaentsz; j++)
    2ef6:	83 45 88 01          	add    DWORD PTR [rbp-0x78],0x1
    2efa:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
    2efd:	48 63 c8             	movsxd rcx,eax
    2f00:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    2f04:	ba 00 00 00 00       	mov    edx,0x0
    2f09:	48 f7 75 d8          	div    QWORD PTR [rbp-0x28]
    2f0d:	48 39 c1             	cmp    rcx,rax
    2f10:	72 a5                	jb     2eb7 <dl_init+0x28b>
    if (pltrel == DT_REL)
    2f12:	83 7d ac 11          	cmp    DWORD PTR [rbp-0x54],0x11
    2f16:	75 11                	jne    2f29 <dl_init+0x2fd>
        jmprelaentsz = relentsz, pltrel = 0;
    2f18:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    2f1c:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    2f20:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
    2f27:	eb 0f                	jmp    2f38 <dl_init+0x30c>
    else
        jmprelaentsz = relaentsz, pltrel = 1;
    2f29:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    2f2d:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    2f31:	c7 45 ac 01 00 00 00 	mov    DWORD PTR [rbp-0x54],0x1
    if (bind_now && jmprelptr && jmprelaentsz && jmprelsz)   // PLTREL
    2f38:	83 7d 9c 00          	cmp    DWORD PTR [rbp-0x64],0x0
    2f3c:	74 77                	je     2fb5 <dl_init+0x389>
    2f3e:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
    2f43:	74 70                	je     2fb5 <dl_init+0x389>
    2f45:	48 83 7d c8 00       	cmp    QWORD PTR [rbp-0x38],0x0
    2f4a:	74 69                	je     2fb5 <dl_init+0x389>
    2f4c:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
    2f51:	74 62                	je     2fb5 <dl_init+0x389>
        for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    2f53:	c7 45 84 00 00 00 00 	mov    DWORD PTR [rbp-0x7c],0x0
    2f5a:	eb 41                	jmp    2f9d <dl_init+0x371>
            init_fill_reloc(
    2f5c:	48 8b 75 a0          	mov    rsi,QWORD PTR [rbp-0x60]
    2f60:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
                jmprelptr + load_offset + j * jmprelaentsz, load_offset, sym, pltrel, got);
    2f67:	8b 55 84             	mov    edx,DWORD PTR [rbp-0x7c]
    2f6a:	48 63 d2             	movsxd rdx,edx
    2f6d:	48 89 d1             	mov    rcx,rdx
    2f70:	48 0f af 4d c8       	imul   rcx,QWORD PTR [rbp-0x38]
    2f75:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
    2f79:	48 01 d1             	add    rcx,rdx
            init_fill_reloc(
    2f7c:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    2f83:	48 8d 3c 11          	lea    rdi,[rcx+rdx*1]
    2f87:	8b 4d ac             	mov    ecx,DWORD PTR [rbp-0x54]
    2f8a:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2f8e:	49 89 f0             	mov    r8,rsi
    2f91:	48 89 c6             	mov    rsi,rax
    2f94:	e8 f0 00 00 00       	call   3089 <init_fill_reloc>
        for (int j = 0; j < jmprelsz / jmprelaentsz; j++)
    2f99:	83 45 84 01          	add    DWORD PTR [rbp-0x7c],0x1
    2f9d:	8b 45 84             	mov    eax,DWORD PTR [rbp-0x7c]
    2fa0:	48 63 c8             	movsxd rcx,eax
    2fa3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
    2fa7:	ba 00 00 00 00       	mov    edx,0x0
    2fac:	48 f7 75 c8          	div    QWORD PTR [rbp-0x38]
    2fb0:	48 39 c1             	cmp    rcx,rax
    2fb3:	72 a7                	jb     2f5c <dl_init+0x330>
    //重定位完毕，可以使用全局变量和全局函数
    for (int i = 0; i < MAX_MODULES; i++) {
    2fb5:	c7 45 80 00 00 00 00 	mov    DWORD PTR [rbp-0x80],0x0
    2fbc:	eb 2c                	jmp    2fea <dl_init+0x3be>
        modules[i].type = ET_NONE;
    2fbe:	48 8b 0d 13 30 00 00 	mov    rcx,QWORD PTR [rip+0x3013]        # 5fd8 <modules-0x1c8>
    2fc5:	8b 45 80             	mov    eax,DWORD PTR [rbp-0x80]
    2fc8:	48 63 d0             	movsxd rdx,eax
    2fcb:	48 89 d0             	mov    rax,rdx
    2fce:	48 01 c0             	add    rax,rax
    2fd1:	48 01 d0             	add    rax,rdx
    2fd4:	48 c1 e0 05          	shl    rax,0x5
    2fd8:	48 01 c8             	add    rax,rcx
    2fdb:	48 83 c0 18          	add    rax,0x18
    2fdf:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    for (int i = 0; i < MAX_MODULES; i++) {
    2fe6:	83 45 80 01          	add    DWORD PTR [rbp-0x80],0x1
    2fea:	83 7d 80 7f          	cmp    DWORD PTR [rbp-0x80],0x7f
    2fee:	7e ce                	jle    2fbe <dl_init+0x392>
    }
    modules[0].p_symbol    = sym;
    2ff0:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
    2ff4:	48 8b 05 dd 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fdd]        # 5fd8 <modules-0x1c8>
    2ffb:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
    modules[0].load_offset = load_offset;
    2fff:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    3006:	48 8b 05 cb 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fcb]        # 5fd8 <modules-0x1c8>
    300d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    modules[0].base        = load_offset;
    3011:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    3018:	48 8b 05 b9 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fb9]        # 5fd8 <modules-0x1c8>
    301f:	48 89 10             	mov    QWORD PTR [rax],rdx
    modules[0].p_dynamic   = dyn;
    3022:	48 8b 95 68 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x98]
    3029:	48 8b 05 a8 2f 00 00 	mov    rax,QWORD PTR [rip+0x2fa8]        # 5fd8 <modules-0x1c8>
    3030:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
    modules[0].p_got       = got;
    3034:	48 8b 55 a0          	mov    rdx,QWORD PTR [rbp-0x60]
    3038:	48 8b 05 99 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f99]        # 5fd8 <modules-0x1c8>
    303f:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
    modules[0].type        = ET_DYN;
    3043:	48 8b 05 8e 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f8e]        # 5fd8 <modules-0x1c8>
    304a:	48 c7 40 18 03 00 00 	mov    QWORD PTR [rax+0x18],0x3
    3051:	00 
    modules[0].header      = load_offset;
    3052:	48 8b 95 48 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xb8]
    3059:	48 8b 05 78 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f78]        # 5fd8 <modules-0x1c8>
    3060:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
    modules[0].p_reloc     = jmprelptr;
    3064:	48 8b 05 6d 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f6d]        # 5fd8 <modules-0x1c8>
    306b:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
    306f:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    modules[0].s_relentsz  = jmprelaentsz;
    3073:	48 8b 05 5e 2f 00 00 	mov    rax,QWORD PTR [rip+0x2f5e]        # 5fd8 <modules-0x1c8>
    307a:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
    307e:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
    return 0;
    3082:	b8 00 00 00 00       	mov    eax,0x0
}
    3087:	c9                   	leave  
    3088:	c3                   	ret    

0000000000003089 <init_fill_reloc>:
//自举用的小重定位函数
static void init_fill_reloc(void* relp, unsigned long long load_base, void* symtab, int rela,
                            off_t igot)
{
    3089:	f3 0f 1e fa          	endbr64 
    308d:	55                   	push   rbp
    308e:	48 89 e5             	mov    rbp,rsp
    3091:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
    3095:	48 89 75 c0          	mov    QWORD PTR [rbp-0x40],rsi
    3099:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
    309d:	89 4d b4             	mov    DWORD PTR [rbp-0x4c],ecx
    30a0:	4c 89 45 a8          	mov    QWORD PTR [rbp-0x58],r8
    unsigned long long got  = igot + load_base;
    30a4:	48 8b 55 a8          	mov    rdx,QWORD PTR [rbp-0x58]
    30a8:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    30ac:	48 01 d0             	add    rax,rdx
    30af:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    Elf64_Rela*        rel  = relp;
    30b3:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
    30b7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int                symi = ELF64_R_SYM(rel->r_info), type = ELF64_R_TYPE(rel->r_info);
    30bb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    30bf:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    30c3:	48 c1 e8 20          	shr    rax,0x20
    30c7:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    30ca:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    30ce:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    30d2:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    unsigned long long sym_off = (((struct Elf64_Sym*)symtab)[symi]).st_value;
    30d5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    30d8:	48 63 d0             	movsxd rdx,eax
    30db:	48 89 d0             	mov    rax,rdx
    30de:	48 01 c0             	add    rax,rax
    30e1:	48 01 d0             	add    rax,rdx
    30e4:	48 c1 e0 03          	shl    rax,0x3
    30e8:	48 89 c2             	mov    rdx,rax
    30eb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
    30ef:	48 01 d0             	add    rax,rdx
    30f2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
    30f6:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if (!sym_off) {
    30fa:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
    30ff:	0f 84 5a 01 00 00    	je     325f <init_fill_reloc+0x1d6>
        //外部符号
        return;
    }
    //这里假定获取符号的地址是正确的，可以不修改符号表，而是通过记录模块整体加载地址，
    //来加上偏移量获取正确的符号地址
    unsigned long long* v_rel = rel->r_offset;
    3105:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    3109:	48 8b 00             	mov    rax,QWORD PTR [rax]
    310c:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (type) {
    3110:	83 7d e8 0b          	cmp    DWORD PTR [rbp-0x18],0xb
    3114:	0f 87 48 01 00 00    	ja     3262 <init_fill_reloc+0x1d9>
    311a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
    311d:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
    3124:	00 
    3125:	48 8d 05 48 10 00 00 	lea    rax,[rip+0x1048]        # 4174 <chkmmap+0x3b4>
    312c:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
    312f:	48 98                	cdqe   
    3131:	48 8d 15 3c 10 00 00 	lea    rdx,[rip+0x103c]        # 4174 <chkmmap+0x3b4>
    3138:	48 01 d0             	add    rax,rdx
    313b:	3e ff e0             	notrack jmp rax
    case R_X86_64_GLOB_DAT:
    case R_X86_64_JUMP_SLOT: *v_rel = sym_off; break;
    313e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3142:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
    3146:	48 89 10             	mov    QWORD PTR [rax],rdx
    3149:	e9 15 01 00 00       	jmp    3263 <init_fill_reloc+0x1da>
    case R_X86_64_RELATIVE:
        if (rela)
    314e:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    3152:	74 1e                	je     3172 <init_fill_reloc+0xe9>
            *v_rel = rel->r_addend + load_base;
    3154:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    3158:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    315c:	48 89 c2             	mov    rdx,rax
    315f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    3163:	48 01 c2             	add    rdx,rax
    3166:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    316a:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += load_base;
        break;
    316d:	e9 f1 00 00 00       	jmp    3263 <init_fill_reloc+0x1da>
            *v_rel += load_base;
    3172:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3176:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    3179:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
    317d:	48 01 c2             	add    rdx,rax
    3180:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3184:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    3187:	e9 d7 00 00 00       	jmp    3263 <init_fill_reloc+0x1da>
    case R_X86_64_GOTPC:
        if (rela)
    318c:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    3190:	74 28                	je     31ba <init_fill_reloc+0x131>
            *v_rel = got + rel->r_addend - rel->r_offset;
    3192:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    3196:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    319a:	48 89 c2             	mov    rdx,rax
    319d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    31a1:	48 01 c2             	add    rdx,rax
    31a4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    31a8:	48 8b 00             	mov    rax,QWORD PTR [rax]
    31ab:	48 29 c2             	sub    rdx,rax
    31ae:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    31b2:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel += got - (unsigned long long)rel;
        break;
    31b5:	e9 a9 00 00 00       	jmp    3263 <init_fill_reloc+0x1da>
            *v_rel += got - (unsigned long long)rel;
    31ba:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    31be:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    31c1:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
    31c5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    31c9:	48 29 c8             	sub    rax,rcx
    31cc:	48 01 c2             	add    rdx,rax
    31cf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    31d3:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    31d6:	e9 88 00 00 00       	jmp    3263 <init_fill_reloc+0x1da>
    case R_X86_64_32S:
    case R_X86_64_64:
        if (rela)
    31db:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    31df:	74 17                	je     31f8 <init_fill_reloc+0x16f>
            *v_rel += sym_off;
    31e1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    31e5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    31e8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    31ec:	48 01 c2             	add    rdx,rax
    31ef:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    31f3:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off;
        break;
    31f6:	eb 6b                	jmp    3263 <init_fill_reloc+0x1da>
            *v_rel = rel->r_addend + sym_off;
    31f8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    31fc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    3200:	48 89 c2             	mov    rdx,rax
    3203:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    3207:	48 01 c2             	add    rdx,rax
    320a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    320e:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    3211:	eb 50                	jmp    3263 <init_fill_reloc+0x1da>
    case R_X86_64_PC32:
        if (rela)
    3213:	83 7d b4 00          	cmp    DWORD PTR [rbp-0x4c],0x0
    3217:	74 21                	je     323a <init_fill_reloc+0x1b1>
            *v_rel += sym_off - rel->r_offset;
    3219:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    321d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    3220:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    3224:	48 8b 08             	mov    rcx,QWORD PTR [rax]
    3227:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    322b:	48 29 c8             	sub    rax,rcx
    322e:	48 01 c2             	add    rdx,rax
    3231:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    3235:	48 89 10             	mov    QWORD PTR [rax],rdx
        else
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
        break;
    3238:	eb 29                	jmp    3263 <init_fill_reloc+0x1da>
            *v_rel = rel->r_addend + sym_off - rel->r_offset;
    323a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    323e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
    3242:	48 89 c2             	mov    rdx,rax
    3245:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
    3249:	48 01 c2             	add    rdx,rax
    324c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
    3250:	48 8b 00             	mov    rax,QWORD PTR [rax]
    3253:	48 29 c2             	sub    rdx,rax
    3256:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
    325a:	48 89 10             	mov    QWORD PTR [rax],rdx
        break;
    325d:	eb 04                	jmp    3263 <init_fill_reloc+0x1da>
        return;
    325f:	90                   	nop
    3260:	eb 01                	jmp    3263 <init_fill_reloc+0x1da>
    default: break;
    3262:	90                   	nop
    }
}
    3263:	5d                   	pop    rbp
    3264:	c3                   	ret    

0000000000003265 <lookup_strtab>:
/**
    @brief 查找字符串。
 */
static char* lookup_strtab(char* strtab, int index)
{
    3265:	f3 0f 1e fa          	endbr64 
    3269:	55                   	push   rbp
    326a:	48 89 e5             	mov    rbp,rsp
    326d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    3271:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    char* ptr = strtab;
    3274:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
    3278:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for (int i = 0; i < index; i++) {
    327c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    3283:	eb 18                	jmp    329d <lookup_strtab+0x38>
        while (*ptr++)
    3285:	90                   	nop
    3286:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
    328a:	48 8d 50 01          	lea    rdx,[rax+0x1]
    328e:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
    3292:	0f b6 00             	movzx  eax,BYTE PTR [rax]
    3295:	84 c0                	test   al,al
    3297:	75 ed                	jne    3286 <lookup_strtab+0x21>
    for (int i = 0; i < index; i++) {
    3299:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
    329d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
    32a0:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
    32a3:	7c e0                	jl     3285 <lookup_strtab+0x20>
            ;
    }
    32a5:	90                   	nop
    32a6:	5d                   	pop    rbp
    32a7:	c3                   	ret    
    32a8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    32af:	00 

00000000000032b0 <max>:
	return a < b ? b : a;
    32b0:	48 39 f7             	cmp    rdi,rsi
    32b3:	48 89 f0             	mov    rax,rsi
    32b6:	48 0f 43 c7          	cmovae rax,rdi
}
    32ba:	c3                   	ret    
    32bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000032c0 <align>:
	return (val + alignment - 1) & ~(alignment - 1);
    32c0:	48 8d 44 3e ff       	lea    rax,[rsi+rdi*1-0x1]
    32c5:	48 f7 de             	neg    rsi
    32c8:	48 21 f0             	and    rax,rsi
}
    32cb:	c3                   	ret    
    32cc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

00000000000032d0 <granules_to_chunk_kind>:
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
    32d0:	31 c0                	xor    eax,eax
    32d2:	83 ff 01             	cmp    edi,0x1
    32d5:	76 4e                	jbe    3325 <granules_to_chunk_kind+0x55>
    32d7:	b8 01 00 00 00       	mov    eax,0x1
    32dc:	83 ff 02             	cmp    edi,0x2
    32df:	74 44                	je     3325 <granules_to_chunk_kind+0x55>
    32e1:	83 ff 03             	cmp    edi,0x3
    32e4:	74 5a                	je     3340 <granules_to_chunk_kind+0x70>
    32e6:	83 ff 04             	cmp    edi,0x4
    32e9:	74 45                	je     3330 <granules_to_chunk_kind+0x60>
    32eb:	83 ff 05             	cmp    edi,0x5
    32ee:	74 60                	je     3350 <granules_to_chunk_kind+0x80>
    32f0:	83 ff 06             	cmp    edi,0x6
    32f3:	74 2b                	je     3320 <granules_to_chunk_kind+0x50>
    32f5:	b8 06 00 00 00       	mov    eax,0x6
    32fa:	83 ff 08             	cmp    edi,0x8
    32fd:	76 26                	jbe    3325 <granules_to_chunk_kind+0x55>
    32ff:	b8 07 00 00 00       	mov    eax,0x7
    3304:	83 ff 0a             	cmp    edi,0xa
    3307:	76 1c                	jbe    3325 <granules_to_chunk_kind+0x55>
    3309:	b8 08 00 00 00       	mov    eax,0x8
    330e:	83 ff 10             	cmp    edi,0x10
    3311:	76 12                	jbe    3325 <granules_to_chunk_kind+0x55>
    3313:	83 ff 21             	cmp    edi,0x21
    3316:	19 c0                	sbb    eax,eax
    3318:	24 0a                	and    al,0xa
    331a:	05 ff 00 00 00       	add    eax,0xff
    331f:	c3                   	ret    
    3320:	b8 05 00 00 00       	mov    eax,0x5
}
    3325:	c3                   	ret    
    3326:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    332d:	00 00 00 
	FOR_EACH_SMALL_OBJECT_GRANULES(TEST_GRANULE_SIZE);
    3330:	b8 03 00 00 00       	mov    eax,0x3
    3335:	c3                   	ret    
    3336:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    333d:	00 00 00 
    3340:	b8 02 00 00 00       	mov    eax,0x2
    3345:	c3                   	ret    
    3346:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    334d:	00 00 00 
    3350:	b8 04 00 00 00       	mov    eax,0x4
    3355:	c3                   	ret    
    3356:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    335d:	00 00 00 

0000000000003360 <chunk_kind_to_granules>:
{
    3360:	b8 ff ff ff ff       	mov    eax,0xffffffff
    3365:	83 ff 09             	cmp    edi,0x9
    3368:	77 0c                	ja     3376 <chunk_kind_to_granules+0x16>
    336a:	89 ff                	mov    edi,edi
    336c:	48 8d 05 4d 0e 00 00 	lea    rax,[rip+0xe4d]        # 41c0 <CSWTCH.34>
    3373:	8b 04 b8             	mov    eax,DWORD PTR [rax+rdi*4]
}
    3376:	c3                   	ret    
    3377:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    337e:	00 00 

0000000000003380 <get_page>:
	return (struct page*)(char*)(((uintptr_t)ptr) & ~PAGE_MASK);
    3380:	48 89 f8             	mov    rax,rdi
    3383:	66 31 c0             	xor    ax,ax
}
    3386:	c3                   	ret    
    3387:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    338e:	00 00 

0000000000003390 <get_chunk_index>:
	return (((uintptr_t)ptr) & PAGE_MASK) / CHUNK_SIZE;
    3390:	89 f8                	mov    eax,edi
    3392:	0f b6 c4             	movzx  eax,ah
}
    3395:	c3                   	ret    
    3396:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    339d:	00 00 00 

00000000000033a0 <get_large_object_payload>:
	return ((char*)obj) + LARGE_OBJECT_HEADER_SIZE;
    33a0:	48 8d 47 10          	lea    rax,[rdi+0x10]
}
    33a4:	c3                   	ret    
    33a5:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    33ac:	00 00 00 
    33af:	90                   	nop

00000000000033b0 <get_large_object>:
	return (struct large_object*)(((char*)ptr) - LARGE_OBJECT_HEADER_SIZE);
    33b0:	48 8d 47 f0          	lea    rax,[rdi-0x10]
}
    33b4:	c3                   	ret    
    33b5:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    33bc:	00 00 00 
    33bf:	90                   	nop

00000000000033c0 <allocate_chunk>:
	page->header.chunk_kinds[idx] = kind;
    33c0:	89 f6                	mov    esi,esi
    33c2:	88 14 37             	mov    BYTE PTR [rdi+rsi*1],dl
	return page->chunks[idx].data;
    33c5:	48 c1 e6 08          	shl    rsi,0x8
    33c9:	48 8d 04 37          	lea    rax,[rdi+rsi*1]
}
    33cd:	c3                   	ret    
    33ce:	66 90                	xchg   ax,ax

00000000000033d0 <maybe_repurpose_single_chunk_large_objects_head>:
	if(large_objects->size < CHUNK_SIZE)
    33d0:	48 8b 0d 39 5e 00 00 	mov    rcx,QWORD PTR [rip+0x5e39]        # 9210 <large_objects>
    33d7:	48 81 79 08 ff 00 00 	cmp    QWORD PTR [rcx+0x8],0xff
    33de:	00 
    33df:	76 07                	jbe    33e8 <maybe_repurpose_single_chunk_large_objects_head+0x18>
}
    33e1:	c3                   	ret    
    33e2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		unsigned idx = get_chunk_index(large_objects);
    33e8:	48 89 cf             	mov    rdi,rcx
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
    33eb:	ba 09 00 00 00       	mov    edx,0x9
		unsigned idx = get_chunk_index(large_objects);
    33f0:	e8 9b ff ff ff       	call   3390 <get_chunk_index>
    33f5:	89 c6                	mov    esi,eax
		char* ptr = allocate_chunk(get_page(large_objects), idx, GRANULES_32);
    33f7:	e8 84 ff ff ff       	call   3380 <get_page>
    33fc:	48 89 c7             	mov    rdi,rax
    33ff:	e8 bc ff ff ff       	call   33c0 <allocate_chunk>
		large_objects = large_objects->next;
    3404:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
    3407:	48 89 15 02 5e 00 00 	mov    QWORD PTR [rip+0x5e02],rdx        # 9210 <large_objects>
		head->next = small_object_freelists[GRANULES_32];
    340e:	48 8b 15 53 5e 00 00 	mov    rdx,QWORD PTR [rip+0x5e53]        # 9268 <small_object_freelists+0x48>
    3415:	48 89 10             	mov    QWORD PTR [rax],rdx
		small_object_freelists[GRANULES_32] = head;
    3418:	48 89 05 49 5e 00 00 	mov    QWORD PTR [rip+0x5e49],rax        # 9268 <small_object_freelists+0x48>
}
    341f:	c3                   	ret    

0000000000003420 <size_to_granules>:
	return (size + GRANULE_SIZE - 1) >> GRANULE_SIZE_LOG_2;
    3420:	48 8d 47 07          	lea    rax,[rdi+0x7]
    3424:	48 c1 e8 03          	shr    rax,0x3
}
    3428:	c3                   	ret    
    3429:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]

0000000000003430 <maybe_merge_free_large_object>:
{
    3430:	53                   	push   rbx
	struct large_object* obj = *prev;
    3431:	4c 8b 1f             	mov    r11,QWORD PTR [rdi]
{
    3434:	49 89 f9             	mov    r9,rdi
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
    3437:	48 8d 1d d2 5d 00 00 	lea    rbx,[rip+0x5dd2]        # 9210 <large_objects>
		char* end = get_large_object_payload(obj) + obj->size;
    343e:	4c 89 df             	mov    rdi,r11
    3441:	e8 5a ff ff ff       	call   33a0 <get_large_object_payload>
    3446:	4d 8b 43 08          	mov    r8,QWORD PTR [r11+0x8]
    344a:	49 89 c2             	mov    r10,rax
    344d:	0f 1f 00             	nop    DWORD PTR [rax]
    3450:	4b 8d 14 02          	lea    rdx,[r10+r8*1]
		ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
    3454:	be 00 01 00 00       	mov    esi,0x100
    3459:	48 89 d7             	mov    rdi,rdx
    345c:	e8 5f fe ff ff       	call   32c0 <align>
    3461:	48 39 c2             	cmp    rdx,rax
    3464:	0f 85 86 dc ff ff    	jne    10f0 <maybe_merge_free_large_object.cold>
		unsigned chunk = get_chunk_index(end);
    346a:	e8 21 ff ff ff       	call   3390 <get_chunk_index>
    346f:	89 c1                	mov    ecx,eax
		if(chunk < FIRST_ALLOCATABLE_CHUNK)
    3471:	85 c9                	test   ecx,ecx
    3473:	74 53                	je     34c8 <maybe_merge_free_large_object+0x98>
		struct page* page = get_page(end);
    3475:	e8 06 ff ff ff       	call   3380 <get_page>
		if(page->header.chunk_kinds[chunk] != FREE_LARGE_OBJECT)
    347a:	80 3c 08 fe          	cmp    BYTE PTR [rax+rcx*1],0xfe
    347e:	75 48                	jne    34c8 <maybe_merge_free_large_object+0x98>
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
    3480:	48 8b 05 89 5d 00 00 	mov    rax,QWORD PTR [rip+0x5d89]        # 9210 <large_objects>
			ASSERT(walk);
    3487:	48 85 c0             	test   rax,rax
    348a:	0f 84 60 dc ff ff    	je     10f0 <maybe_merge_free_large_object.cold>
			if(walk == next)
    3490:	48 39 c2             	cmp    rdx,rax
    3493:	74 3b                	je     34d0 <maybe_merge_free_large_object+0xa0>
    3495:	0f 1f 00             	nop    DWORD PTR [rax]
			walk = walk->next;
    3498:	48 89 c1             	mov    rcx,rax
    349b:	48 8b 00             	mov    rax,QWORD PTR [rax]
			ASSERT(walk);
    349e:	48 85 c0             	test   rax,rax
    34a1:	74 32                	je     34d5 <maybe_merge_free_large_object+0xa5>
			if(walk == next)
    34a3:	48 39 c2             	cmp    rdx,rax
    34a6:	75 f0                	jne    3498 <maybe_merge_free_large_object+0x68>
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
    34a8:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
				if(prev == &walk->next)
    34ac:	4c 39 c8             	cmp    rax,r9
    34af:	4c 0f 44 c9          	cmove  r9,rcx
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
    34b3:	4d 8d 44 10 10       	lea    r8,[r8+rdx*1+0x10]
				*prev_prev = walk->next;
    34b8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
				obj->size += LARGE_OBJECT_HEADER_SIZE + walk->size;
    34bb:	4d 89 43 08          	mov    QWORD PTR [r11+0x8],r8
				*prev_prev = walk->next;
    34bf:	48 89 11             	mov    QWORD PTR [rcx],rdx
				if(prev == &walk->next)
    34c2:	eb 8c                	jmp    3450 <maybe_merge_free_large_object+0x20>
    34c4:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
}
    34c8:	4c 89 c8             	mov    rax,r9
    34cb:	5b                   	pop    rbx
    34cc:	c3                   	ret    
    34cd:	0f 1f 00             	nop    DWORD PTR [rax]
		struct large_object **prev_prev = &large_objects, *walk = large_objects;
    34d0:	48 89 d9             	mov    rcx,rbx
    34d3:	eb d3                	jmp    34a8 <maybe_merge_free_large_object+0x78>
    34d5:	e9 16 dc ff ff       	jmp    10f0 <maybe_merge_free_large_object.cold>
    34da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

00000000000034e0 <maybe_compact_free_large_objects>:
	if(pending_large_object_compact)
    34e0:	8b 05 1e 5d 00 00    	mov    eax,DWORD PTR [rip+0x5d1e]        # 9204 <pending_large_object_compact>
    34e6:	85 c0                	test   eax,eax
    34e8:	74 2c                	je     3516 <maybe_compact_free_large_objects+0x36>
		while(*prev)
    34ea:	48 83 3d 1e 5d 00 00 	cmp    QWORD PTR [rip+0x5d1e],0x0        # 9210 <large_objects>
    34f1:	00 
		pending_large_object_compact = 0;
    34f2:	c7 05 08 5d 00 00 00 	mov    DWORD PTR [rip+0x5d08],0x0        # 9204 <pending_large_object_compact>
    34f9:	00 00 00 
		while(*prev)
    34fc:	74 18                	je     3516 <maybe_compact_free_large_objects+0x36>
		struct large_object** prev = &large_objects;
    34fe:	48 8d 3d 0b 5d 00 00 	lea    rdi,[rip+0x5d0b]        # 9210 <large_objects>
    3505:	0f 1f 00             	nop    DWORD PTR [rax]
			prev = &(*maybe_merge_free_large_object(prev))->next;
    3508:	e8 23 ff ff ff       	call   3430 <maybe_merge_free_large_object>
    350d:	48 8b 38             	mov    rdi,QWORD PTR [rax]
		while(*prev)
    3510:	48 83 3f 00          	cmp    QWORD PTR [rdi],0x0
    3514:	75 f2                	jne    3508 <maybe_compact_free_large_objects+0x28>
}
    3516:	c3                   	ret    
    3517:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    351e:	00 00 

0000000000003520 <get_small_object_freelist>:
	ASSERT(kind < SMALL_OBJECT_CHUNK_KINDS);
    3520:	83 ff 09             	cmp    edi,0x9
    3523:	0f 87 c9 db ff ff    	ja     10f2 <get_small_object_freelist.cold>
	return &small_object_freelists[kind];
    3529:	89 ff                	mov    edi,edi
    352b:	48 8d 05 ee 5c 00 00 	lea    rax,[rip+0x5cee]        # 9220 <small_object_freelists>
    3532:	48 8d 04 f8          	lea    rax,[rax+rdi*8]
}
    3536:	c3                   	ret    
    3537:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    353e:	00 00 

0000000000003540 <free>:
	enum chunk_kind kind = granules_to_chunk_kind(granules);
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
}

void free(void* ptr)
{
    3540:	f3 0f 1e fa          	endbr64 
    3544:	49 89 f8             	mov    r8,rdi
	if(!ptr)
    3547:	48 85 ff             	test   rdi,rdi
    354a:	74 2a                	je     3576 <free+0x36>
		return;
	struct page* page = get_page(ptr);
    354c:	e8 2f fe ff ff       	call   3380 <get_page>
    3551:	49 89 c1             	mov    r9,rax
	unsigned chunk = get_chunk_index(ptr);
    3554:	e8 37 fe ff ff       	call   3390 <get_chunk_index>
    3559:	89 c6                	mov    esi,eax
	uint8_t kind = page->header.chunk_kinds[chunk];
    355b:	89 c0                	mov    eax,eax
    355d:	41 0f b6 3c 01       	movzx  edi,BYTE PTR [r9+rax*1]
	if(kind == LARGE_OBJECT)
    3562:	40 80 ff ff          	cmp    dil,0xff
    3566:	74 18                	je     3580 <free+0x40>
		pending_large_object_compact = 1;
	}
	else
	{
		size_t granules = kind;
		struct freelist** loc = get_small_object_freelist(granules);
    3568:	e8 b3 ff ff ff       	call   3520 <get_small_object_freelist>
		struct freelist* obj = ptr;
		obj->next = *loc;
    356d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    3570:	49 89 10             	mov    QWORD PTR [r8],rdx
		*loc = obj;
    3573:	4c 89 00             	mov    QWORD PTR [rax],r8
	}
}
    3576:	c3                   	ret    
    3577:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    357e:	00 00 
		struct large_object* obj = get_large_object(ptr);
    3580:	4c 89 c7             	mov    rdi,r8
    3583:	e8 28 fe ff ff       	call   33b0 <get_large_object>
		obj->next = large_objects;
    3588:	48 8b 15 81 5c 00 00 	mov    rdx,QWORD PTR [rip+0x5c81]        # 9210 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
    358f:	4c 89 cf             	mov    rdi,r9
		obj->next = large_objects;
    3592:	48 89 10             	mov    QWORD PTR [rax],rdx
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
    3595:	ba fe 00 00 00       	mov    edx,0xfe
		large_objects = obj;
    359a:	48 89 05 6f 5c 00 00 	mov    QWORD PTR [rip+0x5c6f],rax        # 9210 <large_objects>
		allocate_chunk(page, chunk, FREE_LARGE_OBJECT);
    35a1:	e8 1a fe ff ff       	call   33c0 <allocate_chunk>
		pending_large_object_compact = 1;
    35a6:	c7 05 54 5c 00 00 01 	mov    DWORD PTR [rip+0x5c54],0x1        # 9204 <pending_large_object_compact>
    35ad:	00 00 00 
    35b0:	c3                   	ret    
    35b1:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    35b8:	00 00 00 
    35bb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000000035c0 <heap_size_in_pages>:
int heap_size_in_pages()
{
    35c0:	f3 0f 1e fa          	endbr64 
    35c4:	48 83 ec 08          	sub    rsp,0x8
	return (int)sbrk(0) - __heap_base;
    35c8:	31 ff                	xor    edi,edi
    35ca:	e8 a1 da ff ff       	call   1070 <sbrk@plt>
    35cf:	48 8b 15 12 2a 00 00 	mov    rdx,QWORD PTR [rip+0x2a12]        # 5fe8 <__heap_base-0x3288>
    35d6:	2b 02                	sub    eax,DWORD PTR [rdx]
    35d8:	48 83 c4 08          	add    rsp,0x8
    35dc:	c3                   	ret    
    35dd:	0f 1f 00             	nop    DWORD PTR [rax]

00000000000035e0 <allocate_pages.constprop.0>:
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
    35e0:	41 55                	push   r13
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
    35e2:	31 c0                	xor    eax,eax
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
    35e4:	41 54                	push   r12
	size_t needed = payload_size + PAGE_HEADER_SIZE;
    35e6:	4c 8d a7 00 01 00 00 	lea    r12,[rdi+0x100]
static struct page* allocate_pages(size_t payload_size, size_t* n_allocated)
    35ed:	55                   	push   rbp
    35ee:	48 89 f5             	mov    rbp,rsi
    35f1:	53                   	push   rbx
    35f2:	48 83 ec 08          	sub    rsp,0x8
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
    35f6:	e8 15 da ff ff       	call   1010 <heap_size_in_pages@plt>
	if(!walloc_heap_size)
    35fb:	48 8b 3d 06 5c 00 00 	mov    rdi,QWORD PTR [rip+0x5c06]        # 9208 <walloc_heap_size>
	size_t heap_size = heap_size_in_pages() * PAGE_SIZE;
    3602:	c1 e0 10             	shl    eax,0x10
    3605:	48 63 d8             	movsxd rbx,eax
	if(!walloc_heap_size)
    3608:	48 85 ff             	test   rdi,rdi
    360b:	75 63                	jne    3670 <allocate_pages.constprop.0+0x90>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
    360d:	48 8b 3d d4 29 00 00 	mov    rdi,QWORD PTR [rip+0x29d4]        # 5fe8 <__heap_base-0x3288>
    3614:	be 00 00 01 00       	mov    esi,0x10000
    3619:	e8 a2 fc ff ff       	call   32c0 <align>
		walloc_heap_size = preallocated;
    361e:	48 89 1d e3 5b 00 00 	mov    QWORD PTR [rip+0x5be3],rbx        # 9208 <walloc_heap_size>
		uintptr_t heap_base = align((uintptr_t)&__heap_base, PAGE_SIZE);
    3625:	49 89 c0             	mov    r8,rax
	if(preallocated < needed)
    3628:	49 39 dc             	cmp    r12,rbx
    362b:	0f 87 94 00 00 00    	ja     36c5 <allocate_pages.constprop.0+0xe5>
	ASSERT(size);
    3631:	48 85 db             	test   rbx,rbx
    3634:	0f 84 ba da ff ff    	je     10f4 <allocate_pages.constprop.0.cold>
	ASSERT_ALIGNED(size, PAGE_SIZE);
    363a:	be 00 00 01 00       	mov    esi,0x10000
    363f:	48 89 df             	mov    rdi,rbx
    3642:	e8 79 fc ff ff       	call   32c0 <align>
    3647:	48 39 c3             	cmp    rbx,rax
    364a:	0f 85 a4 da ff ff    	jne    10f4 <allocate_pages.constprop.0.cold>
	*n_allocated = size / PAGE_SIZE;
    3650:	48 c1 eb 10          	shr    rbx,0x10
    3654:	48 89 5d 00          	mov    QWORD PTR [rbp+0x0],rbx
}
    3658:	48 83 c4 08          	add    rsp,0x8
    365c:	4c 89 c0             	mov    rax,r8
    365f:	5b                   	pop    rbx
    3660:	5d                   	pop    rbp
    3661:	41 5c                	pop    r12
    3663:	41 5d                	pop    r13
    3665:	c3                   	ret    
    3666:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    366d:	00 00 00 
	if(preallocated < needed)
    3670:	4d 85 e4             	test   r12,r12
    3673:	74 5e                	je     36d3 <allocate_pages.constprop.0+0xf3>
	uintptr_t preallocated = 0, grow = 0;
    3675:	45 31 ed             	xor    r13d,r13d
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
    3678:	4c 89 e6             	mov    rsi,r12
    367b:	48 d1 ef             	shr    rdi,1
    367e:	e8 2d fc ff ff       	call   32b0 <max>
    3683:	be 00 00 01 00       	mov    esi,0x10000
    3688:	48 89 c7             	mov    rdi,rax
    368b:	e8 30 fc ff ff       	call   32c0 <align>
    3690:	49 89 c4             	mov    r12,rax
		ASSERT(grow);
    3693:	48 85 c0             	test   rax,rax
    3696:	0f 84 58 da ff ff    	je     10f4 <allocate_pages.constprop.0.cold>
		if(sbrk(grow) == -1) // >> PAGE_SIZE_LOG_2
    369c:	48 89 c7             	mov    rdi,rax
    369f:	e8 cc d9 ff ff       	call   1070 <sbrk@plt>
    36a4:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
    36a8:	74 16                	je     36c0 <allocate_pages.constprop.0+0xe0>
	size_t size = grow + preallocated;
    36aa:	49 89 d8             	mov    r8,rbx
		walloc_heap_size += grow;
    36ad:	4c 01 25 54 5b 00 00 	add    QWORD PTR [rip+0x5b54],r12        # 9208 <walloc_heap_size>
	size_t size = grow + preallocated;
    36b4:	4b 8d 1c 2c          	lea    rbx,[r12+r13*1]
    36b8:	e9 74 ff ff ff       	jmp    3631 <allocate_pages.constprop.0+0x51>
    36bd:	0f 1f 00             	nop    DWORD PTR [rax]
			return NULL;
    36c0:	45 31 c0             	xor    r8d,r8d
    36c3:	eb 93                	jmp    3658 <allocate_pages.constprop.0+0x78>
		grow = align(max(walloc_heap_size / 2, needed - preallocated), PAGE_SIZE);
    36c5:	49 29 dc             	sub    r12,rbx
    36c8:	48 89 df             	mov    rdi,rbx
    36cb:	49 89 dd             	mov    r13,rbx
		base = heap_base;
    36ce:	48 89 c3             	mov    rbx,rax
    36d1:	eb a5                	jmp    3678 <allocate_pages.constprop.0+0x98>
    36d3:	e9 1c da ff ff       	jmp    10f4 <allocate_pages.constprop.0.cold>
    36d8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
    36df:	00 

00000000000036e0 <allocate_large_object>:
{
    36e0:	41 54                	push   r12
    36e2:	55                   	push   rbp
    36e3:	53                   	push   rbx
    36e4:	48 89 fb             	mov    rbx,rdi
    36e7:	48 83 ec 10          	sub    rsp,0x10
	maybe_compact_free_large_objects();
    36eb:	e8 f0 fd ff ff       	call   34e0 <maybe_compact_free_large_objects>
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
    36f0:	48 8b 15 19 5b 00 00 	mov    rdx,QWORD PTR [rip+0x5b19]        # 9210 <large_objects>
    36f7:	48 85 d2             	test   rdx,rdx
    36fa:	0f 84 da 01 00 00    	je     38da <allocate_large_object+0x1fa>
    3700:	4c 8d 0d 09 5b 00 00 	lea    r9,[rip+0x5b09]        # 9210 <large_objects>
	size_t best_size = -1;
    3707:	49 c7 c0 ff ff ff ff 	mov    r8,0xffffffffffffffff
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
    370e:	48 8d 7b 10          	lea    rdi,[rbx+0x10]
	struct large_object *best = NULL, **best_prev = &large_objects;
    3712:	45 31 d2             	xor    r10d,r10d
    3715:	4c 89 cd             	mov    rbp,r9
    3718:	eb 11                	jmp    372b <allocate_large_object+0x4b>
    371a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		prev = &walk->next, walk = walk->next)
    3720:	49 89 d1             	mov    r9,rdx
    3723:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
    3726:	48 85 d2             	test   rdx,rdx
    3729:	74 39                	je     3764 <allocate_large_object+0x84>
		if(walk->size >= size && walk->size < best_size)
    372b:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
    372f:	4c 39 c1             	cmp    rcx,r8
    3732:	73 ec                	jae    3720 <allocate_large_object+0x40>
    3734:	48 39 d9             	cmp    rcx,rbx
    3737:	72 e7                	jb     3720 <allocate_large_object+0x40>
			   align(size + LARGE_OBJECT_HEADER_SIZE, CHUNK_SIZE))
    3739:	be 00 01 00 00       	mov    esi,0x100
    373e:	e8 7d fb ff ff       	call   32c0 <align>
			if(best_size + LARGE_OBJECT_HEADER_SIZE ==
    3743:	48 8d 71 10          	lea    rsi,[rcx+0x10]
    3747:	48 39 c6             	cmp    rsi,rax
    374a:	0f 84 88 02 00 00    	je     39d8 <allocate_large_object+0x2f8>
    3750:	4c 89 cd             	mov    rbp,r9
    3753:	49 89 d2             	mov    r10,rdx
		prev = &walk->next, walk = walk->next)
    3756:	49 89 d1             	mov    r9,rdx
    3759:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
    375c:	49 89 c8             	mov    r8,rcx
	for(struct large_object **prev = &large_objects, *walk = large_objects; walk;
    375f:	48 85 d2             	test   rdx,rdx
    3762:	75 c7                	jne    372b <allocate_large_object+0x4b>
	if(!best)
    3764:	4d 85 d2             	test   r10,r10
    3767:	0f 84 7b 01 00 00    	je     38e8 <allocate_large_object+0x208>
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
    376d:	4c 89 d7             	mov    rdi,r10
    3770:	ba ff 00 00 00       	mov    edx,0xff
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
    3775:	4c 89 c1             	mov    rcx,r8
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
    3778:	e8 13 fc ff ff       	call   3390 <get_chunk_index>
	size_t tail_size = (best_size - size) & ~CHUNK_MASK;
    377d:	48 29 d9             	sub    rcx,rbx
	allocate_chunk(get_page(best), get_chunk_index(best), LARGE_OBJECT);
    3780:	89 c6                	mov    esi,eax
    3782:	e8 f9 fb ff ff       	call   3380 <get_page>
    3787:	48 89 c7             	mov    rdi,rax
    378a:	49 89 c1             	mov    r9,rax
    378d:	e8 2e fc ff ff       	call   33c0 <allocate_chunk>
	struct large_object* next = best->next;
    3792:	49 8b 02             	mov    rax,QWORD PTR [r10]
	*best_prev = next;
    3795:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
	if(tail_size)
    3799:	48 81 e1 00 ff ff ff 	and    rcx,0xffffffffffffff00
    37a0:	75 36                	jne    37d8 <allocate_large_object+0xf8>
	ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(best) + best->size), CHUNK_SIZE);
    37a2:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
    37a6:	4c 89 d7             	mov    rdi,r10
    37a9:	be 00 01 00 00       	mov    esi,0x100
    37ae:	e8 ed fb ff ff       	call   33a0 <get_large_object_payload>
    37b3:	48 01 c2             	add    rdx,rax
    37b6:	48 89 d7             	mov    rdi,rdx
    37b9:	e8 02 fb ff ff       	call   32c0 <align>
    37be:	48 39 c2             	cmp    rdx,rax
    37c1:	0f 85 2f d9 ff ff    	jne    10f6 <allocate_large_object.cold>
}
    37c7:	48 83 c4 10          	add    rsp,0x10
    37cb:	4c 89 d0             	mov    rax,r10
    37ce:	5b                   	pop    rbx
    37cf:	5d                   	pop    rbp
    37d0:	41 5c                	pop    r12
    37d2:	c3                   	ret    
    37d3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		char* start = get_large_object_payload(best);
    37d8:	4c 89 d7             	mov    rdi,r10
    37db:	e8 c0 fb ff ff       	call   33a0 <get_large_object_payload>
		if(start_page == get_page(end - tail_size - 1))
    37e0:	48 89 cf             	mov    rdi,rcx
		char* end = start + best_size;
    37e3:	4e 8d 1c 00          	lea    r11,[rax+r8*1]
		if(start_page == get_page(end - tail_size - 1))
    37e7:	48 f7 d7             	not    rdi
		char* start = get_large_object_payload(best);
    37ea:	48 89 c5             	mov    rbp,rax
		if(start_page == get_page(end - tail_size - 1))
    37ed:	4c 01 df             	add    rdi,r11
    37f0:	e8 8b fb ff ff       	call   3380 <get_page>
    37f5:	49 39 c1             	cmp    r9,rax
    37f8:	0f 84 e8 01 00 00    	je     39e6 <allocate_large_object+0x306>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
    37fe:	be 00 00 01 00       	mov    esi,0x10000
    3803:	4c 89 df             	mov    rdi,r11
    3806:	e8 b5 fa ff ff       	call   32c0 <align>
		else if(size < PAGE_SIZE - LARGE_OBJECT_HEADER_SIZE - CHUNK_SIZE)
    380b:	48 81 fb ef fe 00 00 	cmp    rbx,0xfeef
    3812:	0f 86 38 01 00 00    	jbe    3950 <allocate_large_object+0x270>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
    3818:	4c 39 d8             	cmp    rax,r11
    381b:	0f 85 d5 d8 ff ff    	jne    10f6 <allocate_large_object.cold>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
    3821:	0f b7 ed             	movzx  ebp,bp
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
    3824:	be 00 00 01 00       	mov    esi,0x10000
    3829:	48 8d bc 1d 00 00 ff 	lea    rdi,[rbp+rbx*1-0x10000]
    3830:	ff 
			tail_size = best_size - size;
    3831:	4a 8d 8c 05 00 00 ff 	lea    rcx,[rbp+r8*1-0x10000]
    3838:	ff 
			size_t tail_pages_size = align(size - first_page_size, PAGE_SIZE);
    3839:	e8 82 fa ff ff       	call   32c0 <align>
		best->size -= tail_size;
    383e:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
			tail_size = best_size - size;
    3842:	48 29 c1             	sub    rcx,rax
		best->size -= tail_size;
    3845:	48 29 ca             	sub    rdx,rcx
		unsigned tail_idx = get_chunk_index(end - tail_size);
    3848:	4c 89 df             	mov    rdi,r11
		best->size -= tail_size;
    384b:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
    384f:	48 29 cf             	sub    rdi,rcx
    3852:	e8 39 fb ff ff       	call   3390 <get_chunk_index>
    3857:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
    3859:	48 85 c9             	test   rcx,rcx
    385c:	0f 84 44 ff ff ff    	je     37a6 <allocate_large_object+0xc6>
    3862:	85 c0                	test   eax,eax
    3864:	75 0c                	jne    3872 <allocate_large_object+0x192>
			tail_size -= CHUNK_SIZE;
    3866:	48 81 e9 00 01 00 00 	sub    rcx,0x100
			tail_idx++;
    386d:	be 01 00 00 00       	mov    esi,0x1
		if(tail_size)
    3872:	48 85 c9             	test   rcx,rcx
    3875:	0f 84 2b ff ff ff    	je     37a6 <allocate_large_object+0xc6>
			struct page* page = get_page(end - tail_size);
    387b:	4c 89 df             	mov    rdi,r11
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
    387e:	ba fe 00 00 00       	mov    edx,0xfe
			struct page* page = get_page(end - tail_size);
    3883:	48 29 cf             	sub    rdi,rcx
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
    3886:	48 83 e9 10          	sub    rcx,0x10
			struct page* page = get_page(end - tail_size);
    388a:	e8 f1 fa ff ff       	call   3380 <get_page>
    388f:	48 89 c7             	mov    rdi,rax
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
    3892:	e8 29 fb ff ff       	call   33c0 <allocate_chunk>
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
    3897:	be 00 01 00 00       	mov    esi,0x100
			char* tail_ptr = allocate_chunk(page, tail_idx, FREE_LARGE_OBJECT);
    389c:	48 89 c2             	mov    rdx,rax
			tail->next = large_objects;
    389f:	48 8b 05 6a 59 00 00 	mov    rax,QWORD PTR [rip+0x596a]        # 9210 <large_objects>
			tail->size = tail_size - LARGE_OBJECT_HEADER_SIZE;
    38a6:	48 89 4a 08          	mov    QWORD PTR [rdx+0x8],rcx
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
    38aa:	48 89 d7             	mov    rdi,rdx
			tail->next = large_objects;
    38ad:	48 89 02             	mov    QWORD PTR [rdx],rax
			ASSERT_ALIGNED((uintptr_t)(get_large_object_payload(tail) + tail->size), CHUNK_SIZE);
    38b0:	e8 eb fa ff ff       	call   33a0 <get_large_object_payload>
    38b5:	48 01 c1             	add    rcx,rax
    38b8:	48 89 cf             	mov    rdi,rcx
    38bb:	e8 00 fa ff ff       	call   32c0 <align>
    38c0:	48 39 c1             	cmp    rcx,rax
    38c3:	0f 85 2d d8 ff ff    	jne    10f6 <allocate_large_object.cold>
			large_objects = tail;
    38c9:	48 89 15 40 59 00 00 	mov    QWORD PTR [rip+0x5940],rdx        # 9210 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
    38d0:	e8 fb fa ff ff       	call   33d0 <maybe_repurpose_single_chunk_large_objects_head>
    38d5:	e9 c8 fe ff ff       	jmp    37a2 <allocate_large_object+0xc2>
	struct large_object *best = NULL, **best_prev = &large_objects;
    38da:	48 8d 2d 2f 59 00 00 	lea    rbp,[rip+0x592f]        # 9210 <large_objects>
    38e1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
		size_t size_with_header = size + sizeof(struct large_object);
    38e8:	4c 8d 63 10          	lea    r12,[rbx+0x10]
		struct page* page = allocate_pages(size_with_header, &n_allocated);
    38ec:	48 8d 74 24 08       	lea    rsi,[rsp+0x8]
		size_t n_allocated = 0;
    38f1:	48 c7 44 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x0
    38f8:	00 00 
		struct page* page = allocate_pages(size_with_header, &n_allocated);
    38fa:	4c 89 e7             	mov    rdi,r12
    38fd:	e8 de fc ff ff       	call   35e0 <allocate_pages.constprop.0>
    3902:	48 89 c1             	mov    rcx,rax
		if(!page)
    3905:	48 85 c0             	test   rax,rax
    3908:	0f 84 10 01 00 00    	je     3a1e <allocate_large_object+0x33e>
		char* ptr = allocate_chunk(page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
    390e:	ba ff 00 00 00       	mov    edx,0xff
    3913:	be 01 00 00 00       	mov    esi,0x1
    3918:	48 89 c7             	mov    rdi,rax
    391b:	e8 a0 fa ff ff       	call   33c0 <allocate_chunk>
    3920:	49 89 c2             	mov    r10,rax
		best->next = large_objects;
    3923:	48 8b 05 e6 58 00 00 	mov    rax,QWORD PTR [rip+0x58e6]        # 9210 <large_objects>
		size_t page_header = ptr - ((char*)page);
    392a:	4c 29 d1             	sub    rcx,r10
		best->next = large_objects;
    392d:	49 89 02             	mov    QWORD PTR [r10],rax
		best->size = best_size = n_allocated * PAGE_SIZE - page_header - LARGE_OBJECT_HEADER_SIZE;
    3930:	48 8b 44 24 08       	mov    rax,QWORD PTR [rsp+0x8]
    3935:	48 c1 e0 10          	shl    rax,0x10
    3939:	4c 8d 44 01 f0       	lea    r8,[rcx+rax*1-0x10]
    393e:	4d 89 42 08          	mov    QWORD PTR [r10+0x8],r8
		ASSERT(best_size >= size_with_header);
    3942:	4d 39 c4             	cmp    r12,r8
    3945:	0f 86 22 fe ff ff    	jbe    376d <allocate_large_object+0x8d>
    394b:	e9 a6 d7 ff ff       	jmp    10f6 <allocate_large_object.cold>
			ASSERT_ALIGNED((uintptr_t)end, PAGE_SIZE);
    3950:	4c 39 d8             	cmp    rax,r11
    3953:	0f 85 9d d7 ff ff    	jne    10f6 <allocate_large_object.cold>
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
    3959:	48 89 ef             	mov    rdi,rbp
    395c:	ba fe 00 00 00       	mov    edx,0xfe
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
    3961:	44 0f b7 e5          	movzx  r12d,bp
			allocate_chunk(start_page, get_chunk_index(start), FREE_LARGE_OBJECT);
    3965:	e8 26 fa ff ff       	call   3390 <get_chunk_index>
    396a:	4c 89 cf             	mov    rdi,r9
    396d:	89 c6                	mov    esi,eax
    396f:	e8 4c fa ff ff       	call   33c0 <allocate_chunk>
			size_t first_page_size = PAGE_SIZE - (((uintptr_t)start) & PAGE_MASK);
    3974:	b8 00 00 01 00       	mov    eax,0x10000
    3979:	4c 29 e0             	sub    rax,r12
    397c:	49 89 42 08          	mov    QWORD PTR [r10+0x8],rax
			head->next = large_objects;
    3980:	48 8b 05 89 58 00 00 	mov    rax,QWORD PTR [rip+0x5889]        # 9210 <large_objects>
    3987:	49 89 02             	mov    QWORD PTR [r10],rax
			large_objects = head;
    398a:	4c 89 15 7f 58 00 00 	mov    QWORD PTR [rip+0x587f],r10        # 9210 <large_objects>
			maybe_repurpose_single_chunk_large_objects_head();
    3991:	e8 3a fa ff ff       	call   33d0 <maybe_repurpose_single_chunk_large_objects_head>
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
    3996:	ba ff 00 00 00       	mov    edx,0xff
    399b:	be 01 00 00 00       	mov    esi,0x1
			struct page* next_page = start_page + 1;
    39a0:	49 8d b9 00 00 01 00 	lea    rdi,[r9+0x10000]
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
    39a7:	e8 14 fa ff ff       	call   33c0 <allocate_chunk>
			best->size = best_size =
    39ac:	4b 8d 94 04 f0 fe fe 	lea    rdx,[r12+r8*1-0x10110]
    39b3:	ff 
    39b4:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
			char* ptr = allocate_chunk(next_page, FIRST_ALLOCATABLE_CHUNK, LARGE_OBJECT);
    39b8:	49 89 c2             	mov    r10,rax
			ASSERT(best_size >= size);
    39bb:	48 39 d3             	cmp    rbx,rdx
    39be:	0f 87 32 d7 ff ff    	ja     10f6 <allocate_large_object.cold>
			tail_size = (best_size - size) & ~CHUNK_MASK;
    39c4:	48 89 d1             	mov    rcx,rdx
    39c7:	48 29 d9             	sub    rcx,rbx
    39ca:	30 c9                	xor    cl,cl
    39cc:	e9 74 fe ff ff       	jmp    3845 <allocate_large_object+0x165>
    39d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    39d8:	4c 89 cd             	mov    rbp,r9
    39db:	49 89 c8             	mov    r8,rcx
    39de:	49 89 d2             	mov    r10,rdx
    39e1:	e9 87 fd ff ff       	jmp    376d <allocate_large_object+0x8d>
			ASSERT_ALIGNED((uintptr_t)end, CHUNK_SIZE);
    39e6:	be 00 01 00 00       	mov    esi,0x100
    39eb:	4c 89 df             	mov    rdi,r11
    39ee:	e8 cd f8 ff ff       	call   32c0 <align>
    39f3:	49 39 c3             	cmp    r11,rax
    39f6:	0f 85 fa d6 ff ff    	jne    10f6 <allocate_large_object.cold>
		best->size -= tail_size;
    39fc:	49 8b 52 08          	mov    rdx,QWORD PTR [r10+0x8]
		unsigned tail_idx = get_chunk_index(end - tail_size);
    3a00:	48 29 cf             	sub    rdi,rcx
		best->size -= tail_size;
    3a03:	48 29 ca             	sub    rdx,rcx
    3a06:	49 89 52 08          	mov    QWORD PTR [r10+0x8],rdx
		unsigned tail_idx = get_chunk_index(end - tail_size);
    3a0a:	e8 81 f9 ff ff       	call   3390 <get_chunk_index>
    3a0f:	89 c6                	mov    esi,eax
		while(tail_idx < FIRST_ALLOCATABLE_CHUNK && tail_size)
    3a11:	85 c0                	test   eax,eax
    3a13:	0f 84 4d fe ff ff    	je     3866 <allocate_large_object+0x186>
    3a19:	e9 5d fe ff ff       	jmp    387b <allocate_large_object+0x19b>
			return NULL;
    3a1e:	45 31 d2             	xor    r10d,r10d
    3a21:	e9 a1 fd ff ff       	jmp    37c7 <allocate_large_object+0xe7>
    3a26:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    3a2d:	00 00 00 

0000000000003a30 <allocate_large>:
{
    3a30:	48 83 ec 08          	sub    rsp,0x8
	struct large_object* obj = allocate_large_object(size);
    3a34:	e8 a7 fc ff ff       	call   36e0 <allocate_large_object>
	return obj ? get_large_object_payload(obj) : NULL;
    3a39:	48 85 c0             	test   rax,rax
    3a3c:	74 12                	je     3a50 <allocate_large+0x20>
    3a3e:	48 89 c7             	mov    rdi,rax
}
    3a41:	48 83 c4 08          	add    rsp,0x8
	return obj ? get_large_object_payload(obj) : NULL;
    3a45:	e9 56 f9 ff ff       	jmp    33a0 <get_large_object_payload>
    3a4a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
}
    3a50:	31 c0                	xor    eax,eax
    3a52:	48 83 c4 08          	add    rsp,0x8
    3a56:	c3                   	ret    
    3a57:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
    3a5e:	00 00 

0000000000003a60 <obtain_small_objects>:
{
    3a60:	55                   	push   rbp
    3a61:	89 fd                	mov    ebp,edi
	if(*whole_chunk_freelist)
    3a63:	48 8b 3d fe 57 00 00 	mov    rdi,QWORD PTR [rip+0x57fe]        # 9268 <small_object_freelists+0x48>
    3a6a:	48 85 ff             	test   rdi,rdi
    3a6d:	74 71                	je     3ae0 <obtain_small_objects+0x80>
		*whole_chunk_freelist = (*whole_chunk_freelist)->next;
    3a6f:	48 8b 07             	mov    rax,QWORD PTR [rdi]
    3a72:	48 89 05 ef 57 00 00 	mov    QWORD PTR [rip+0x57ef],rax        # 9268 <small_object_freelists+0x48>
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
    3a79:	e8 12 f9 ff ff       	call   3390 <get_chunk_index>
    3a7e:	89 ea                	mov    edx,ebp
    3a80:	89 c6                	mov    esi,eax
    3a82:	e8 f9 f8 ff ff       	call   3380 <get_page>
    3a87:	48 89 c7             	mov    rdi,rax
    3a8a:	e8 31 f9 ff ff       	call   33c0 <allocate_chunk>
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
    3a8f:	89 ef                	mov    edi,ebp
	char* ptr = allocate_chunk(get_page(chunk), get_chunk_index(chunk), kind);
    3a91:	48 89 c2             	mov    rdx,rax
	size_t size = chunk_kind_to_granules(kind) * GRANULE_SIZE;
    3a94:	e8 c7 f8 ff ff       	call   3360 <chunk_kind_to_granules>
    3a99:	8d 34 c5 00 00 00 00 	lea    esi,[rax*8+0x0]
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
    3aa0:	48 81 fe 00 01 00 00 	cmp    rsi,0x100
    3aa7:	77 46                	ja     3aef <obtain_small_objects+0x8f>
    3aa9:	48 89 d0             	mov    rax,rdx
    3aac:	48 89 f1             	mov    rcx,rsi
    3aaf:	48 29 f0             	sub    rax,rsi
    3ab2:	48 8d 90 00 01 00 00 	lea    rdx,[rax+0x100]
	struct freelist* next = NULL;
    3ab9:	31 c0                	xor    eax,eax
    3abb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
		struct freelist* head = (struct freelist*)(end - i);
    3ac0:	48 89 c7             	mov    rdi,rax
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
    3ac3:	48 01 f1             	add    rcx,rsi
		struct freelist* head = (struct freelist*)(end - i);
    3ac6:	48 89 d0             	mov    rax,rdx
		head->next = next;
    3ac9:	48 89 3a             	mov    QWORD PTR [rdx],rdi
	for(size_t i = size; i <= CHUNK_SIZE; i += size)
    3acc:	48 29 f2             	sub    rdx,rsi
    3acf:	48 81 f9 00 01 00 00 	cmp    rcx,0x100
    3ad6:	76 e8                	jbe    3ac0 <obtain_small_objects+0x60>
}
    3ad8:	5d                   	pop    rbp
    3ad9:	c3                   	ret    
    3ada:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
		chunk = allocate_large_object(0);
    3ae0:	31 ff                	xor    edi,edi
    3ae2:	e8 f9 fb ff ff       	call   36e0 <allocate_large_object>
    3ae7:	48 89 c7             	mov    rdi,rax
		if(!chunk)
    3aea:	48 85 c0             	test   rax,rax
    3aed:	75 8a                	jne    3a79 <obtain_small_objects+0x19>
			return NULL;
    3aef:	31 c0                	xor    eax,eax
}
    3af1:	5d                   	pop    rbp
    3af2:	c3                   	ret    
    3af3:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    3afa:	00 00 00 
    3afd:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000003b00 <allocate_small>:
{
    3b00:	53                   	push   rbx
    3b01:	41 89 f8             	mov    r8d,edi
	struct freelist** loc = get_small_object_freelist(kind);
    3b04:	e8 17 fa ff ff       	call   3520 <get_small_object_freelist>
    3b09:	48 89 c3             	mov    rbx,rax
	if(!*loc)
    3b0c:	48 8b 00             	mov    rax,QWORD PTR [rax]
    3b0f:	48 85 c0             	test   rax,rax
    3b12:	74 0c                	je     3b20 <allocate_small+0x20>
	*loc = ret->next;
    3b14:	48 8b 10             	mov    rdx,QWORD PTR [rax]
    3b17:	48 89 13             	mov    QWORD PTR [rbx],rdx
}
    3b1a:	5b                   	pop    rbx
    3b1b:	c3                   	ret    
    3b1c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
		struct freelist* freelist = obtain_small_objects(kind);
    3b20:	44 89 c7             	mov    edi,r8d
    3b23:	e8 38 ff ff ff       	call   3a60 <obtain_small_objects>
		if(!freelist)
    3b28:	48 85 c0             	test   rax,rax
    3b2b:	74 ed                	je     3b1a <allocate_small+0x1a>
		*loc = freelist;
    3b2d:	48 89 03             	mov    QWORD PTR [rbx],rax
    3b30:	eb e2                	jmp    3b14 <allocate_small+0x14>
    3b32:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
    3b39:	00 00 00 
    3b3c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000003b40 <malloc>:
{
    3b40:	f3 0f 1e fa          	endbr64 
    3b44:	48 83 ec 08          	sub    rsp,0x8
    3b48:	49 89 f8             	mov    r8,rdi
	size_t granules = size_to_granules(size);
    3b4b:	e8 d0 f8 ff ff       	call   3420 <size_to_granules>
	enum chunk_kind kind = granules_to_chunk_kind(granules);
    3b50:	89 c7                	mov    edi,eax
    3b52:	e8 79 f7 ff ff       	call   32d0 <granules_to_chunk_kind>
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
    3b57:	3d ff 00 00 00       	cmp    eax,0xff
    3b5c:	74 12                	je     3b70 <malloc+0x30>
    3b5e:	89 c7                	mov    edi,eax
}
    3b60:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
    3b64:	e9 97 ff ff ff       	jmp    3b00 <allocate_small>
    3b69:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
    3b70:	4c 89 c7             	mov    rdi,r8
}
    3b73:	48 83 c4 08          	add    rsp,0x8
	return (kind == LARGE_OBJECT) ? allocate_large(size) : allocate_small(kind);
    3b77:	e9 b4 fe ff ff       	jmp    3a30 <allocate_large>
    3b7c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000003b80 <reg_dev>:
    3b80:	55                   	push   rbp
    3b81:	48 89 e5             	mov    rbp,rsp
    3b84:	b8 00 00 00 00       	mov    eax,0x0
    3b89:	55                   	push   rbp
    3b8a:	48 0f 05             	rex.W syscall 
    3b8d:	5d                   	pop    rbp
    3b8e:	c9                   	leave  
    3b8f:	c3                   	ret    

0000000000003b90 <dispose_dev>:
    3b90:	55                   	push   rbp
    3b91:	48 89 e5             	mov    rbp,rsp
    3b94:	b8 01 00 00 00       	mov    eax,0x1
    3b99:	55                   	push   rbp
    3b9a:	48 0f 05             	rex.W syscall 
    3b9d:	5d                   	pop    rbp
    3b9e:	c9                   	leave  
    3b9f:	c3                   	ret    

0000000000003ba0 <reg_drv>:
    3ba0:	55                   	push   rbp
    3ba1:	48 89 e5             	mov    rbp,rsp
    3ba4:	b8 02 00 00 00       	mov    eax,0x2
    3ba9:	55                   	push   rbp
    3baa:	48 0f 05             	rex.W syscall 
    3bad:	5d                   	pop    rbp
    3bae:	c9                   	leave  
    3baf:	c3                   	ret    

0000000000003bb0 <dispose_drv>:
    3bb0:	55                   	push   rbp
    3bb1:	48 89 e5             	mov    rbp,rsp
    3bb4:	b8 03 00 00 00       	mov    eax,0x3
    3bb9:	55                   	push   rbp
    3bba:	48 0f 05             	rex.W syscall 
    3bbd:	5d                   	pop    rbp
    3bbe:	c9                   	leave  
    3bbf:	c3                   	ret    

0000000000003bc0 <call_drvfunc>:
    3bc0:	55                   	push   rbp
    3bc1:	48 89 e5             	mov    rbp,rsp
    3bc4:	b8 04 00 00 00       	mov    eax,0x4
    3bc9:	55                   	push   rbp
    3bca:	48 0f 05             	rex.W syscall 
    3bcd:	5d                   	pop    rbp
    3bce:	c9                   	leave  
    3bcf:	c3                   	ret    

0000000000003bd0 <req_mem>:
    3bd0:	55                   	push   rbp
    3bd1:	48 89 e5             	mov    rbp,rsp
    3bd4:	b8 05 00 00 00       	mov    eax,0x5
    3bd9:	55                   	push   rbp
    3bda:	48 0f 05             	rex.W syscall 
    3bdd:	5d                   	pop    rbp
    3bde:	c9                   	leave  
    3bdf:	c3                   	ret    

0000000000003be0 <free_mem>:
    3be0:	55                   	push   rbp
    3be1:	48 89 e5             	mov    rbp,rsp
    3be4:	b8 06 00 00 00       	mov    eax,0x6
    3be9:	55                   	push   rbp
    3bea:	48 0f 05             	rex.W syscall 
    3bed:	5d                   	pop    rbp
    3bee:	c9                   	leave  
    3bef:	c3                   	ret    

0000000000003bf0 <reg_proc>:
    3bf0:	55                   	push   rbp
    3bf1:	48 89 e5             	mov    rbp,rsp
    3bf4:	b8 07 00 00 00       	mov    eax,0x7
    3bf9:	55                   	push   rbp
    3bfa:	48 0f 05             	rex.W syscall 
    3bfd:	5d                   	pop    rbp
    3bfe:	c9                   	leave  
    3bff:	c3                   	ret    

0000000000003c00 <del_proc>:
    3c00:	55                   	push   rbp
    3c01:	48 89 e5             	mov    rbp,rsp
    3c04:	b8 08 00 00 00       	mov    eax,0x8
    3c09:	55                   	push   rbp
    3c0a:	48 0f 05             	rex.W syscall 
    3c0d:	5d                   	pop    rbp
    3c0e:	c9                   	leave  
    3c0f:	c3                   	ret    

0000000000003c10 <get_proc_addr>:
    3c10:	55                   	push   rbp
    3c11:	48 89 e5             	mov    rbp,rsp
    3c14:	b8 09 00 00 00       	mov    eax,0x9
    3c19:	55                   	push   rbp
    3c1a:	48 0f 05             	rex.W syscall 
    3c1d:	5d                   	pop    rbp
    3c1e:	c9                   	leave  
    3c1f:	c3                   	ret    

0000000000003c20 <chk_vm>:
    3c20:	55                   	push   rbp
    3c21:	48 89 e5             	mov    rbp,rsp
    3c24:	b8 0a 00 00 00       	mov    eax,0xa
    3c29:	55                   	push   rbp
    3c2a:	48 0f 05             	rex.W syscall 
    3c2d:	5d                   	pop    rbp
    3c2e:	c9                   	leave  
    3c2f:	c3                   	ret    

0000000000003c30 <open>:
    3c30:	55                   	push   rbp
    3c31:	48 89 e5             	mov    rbp,rsp
    3c34:	b8 0b 00 00 00       	mov    eax,0xb
    3c39:	55                   	push   rbp
    3c3a:	48 0f 05             	rex.W syscall 
    3c3d:	5d                   	pop    rbp
    3c3e:	c9                   	leave  
    3c3f:	c3                   	ret    

0000000000003c40 <close>:
    3c40:	55                   	push   rbp
    3c41:	48 89 e5             	mov    rbp,rsp
    3c44:	b8 0c 00 00 00       	mov    eax,0xc
    3c49:	55                   	push   rbp
    3c4a:	48 0f 05             	rex.W syscall 
    3c4d:	5d                   	pop    rbp
    3c4e:	c9                   	leave  
    3c4f:	c3                   	ret    

0000000000003c50 <read>:
    3c50:	55                   	push   rbp
    3c51:	48 89 e5             	mov    rbp,rsp
    3c54:	b8 0d 00 00 00       	mov    eax,0xd
    3c59:	55                   	push   rbp
    3c5a:	48 0f 05             	rex.W syscall 
    3c5d:	5d                   	pop    rbp
    3c5e:	c9                   	leave  
    3c5f:	c3                   	ret    

0000000000003c60 <write>:
    3c60:	55                   	push   rbp
    3c61:	48 89 e5             	mov    rbp,rsp
    3c64:	b8 0e 00 00 00       	mov    eax,0xe
    3c69:	55                   	push   rbp
    3c6a:	48 0f 05             	rex.W syscall 
    3c6d:	5d                   	pop    rbp
    3c6e:	c9                   	leave  
    3c6f:	c3                   	ret    

0000000000003c70 <seek>:
    3c70:	55                   	push   rbp
    3c71:	48 89 e5             	mov    rbp,rsp
    3c74:	b8 0f 00 00 00       	mov    eax,0xf
    3c79:	55                   	push   rbp
    3c7a:	48 0f 05             	rex.W syscall 
    3c7d:	5d                   	pop    rbp
    3c7e:	c9                   	leave  
    3c7f:	c3                   	ret    

0000000000003c80 <tell>:
    3c80:	55                   	push   rbp
    3c81:	48 89 e5             	mov    rbp,rsp
    3c84:	b8 10 00 00 00       	mov    eax,0x10
    3c89:	55                   	push   rbp
    3c8a:	48 0f 05             	rex.W syscall 
    3c8d:	5d                   	pop    rbp
    3c8e:	c9                   	leave  
    3c8f:	c3                   	ret    

0000000000003c90 <reg_vol>:
    3c90:	55                   	push   rbp
    3c91:	48 89 e5             	mov    rbp,rsp
    3c94:	b8 11 00 00 00       	mov    eax,0x11
    3c99:	55                   	push   rbp
    3c9a:	48 0f 05             	rex.W syscall 
    3c9d:	5d                   	pop    rbp
    3c9e:	c9                   	leave  
    3c9f:	c3                   	ret    

0000000000003ca0 <free_vol>:
    3ca0:	55                   	push   rbp
    3ca1:	48 89 e5             	mov    rbp,rsp
    3ca4:	b8 12 00 00 00       	mov    eax,0x12
    3ca9:	55                   	push   rbp
    3caa:	48 0f 05             	rex.W syscall 
    3cad:	5d                   	pop    rbp
    3cae:	c9                   	leave  
    3caf:	c3                   	ret    

0000000000003cb0 <exec>:
    3cb0:	55                   	push   rbp
    3cb1:	48 89 e5             	mov    rbp,rsp
    3cb4:	b8 13 00 00 00       	mov    eax,0x13
    3cb9:	55                   	push   rbp
    3cba:	48 0f 05             	rex.W syscall 
    3cbd:	5d                   	pop    rbp
    3cbe:	c9                   	leave  
    3cbf:	c3                   	ret    

0000000000003cc0 <exit>:
    3cc0:	55                   	push   rbp
    3cc1:	48 89 e5             	mov    rbp,rsp
    3cc4:	b8 14 00 00 00       	mov    eax,0x14
    3cc9:	55                   	push   rbp
    3cca:	48 0f 05             	rex.W syscall 
    3ccd:	5d                   	pop    rbp
    3cce:	c9                   	leave  
    3ccf:	c3                   	ret    

0000000000003cd0 <abort>:
    3cd0:	55                   	push   rbp
    3cd1:	48 89 e5             	mov    rbp,rsp
    3cd4:	b8 14 00 00 00       	mov    eax,0x14
    3cd9:	55                   	push   rbp
    3cda:	48 0f 05             	rex.W syscall 
    3cdd:	5d                   	pop    rbp
    3cde:	c9                   	leave  
    3cdf:	c3                   	ret    

0000000000003ce0 <call>:
    3ce0:	55                   	push   rbp
    3ce1:	48 89 e5             	mov    rbp,rsp
    3ce4:	b8 15 00 00 00       	mov    eax,0x15
    3ce9:	55                   	push   rbp
    3cea:	48 0f 05             	rex.W syscall 
    3ced:	5d                   	pop    rbp
    3cee:	c9                   	leave  
    3cef:	c3                   	ret    

0000000000003cf0 <mkfifo>:
    3cf0:	55                   	push   rbp
    3cf1:	48 89 e5             	mov    rbp,rsp
    3cf4:	b8 16 00 00 00       	mov    eax,0x16
    3cf9:	55                   	push   rbp
    3cfa:	48 0f 05             	rex.W syscall 
    3cfd:	5d                   	pop    rbp
    3cfe:	c9                   	leave  
    3cff:	c3                   	ret    

0000000000003d00 <brk>:
    3d00:	55                   	push   rbp
    3d01:	48 89 e5             	mov    rbp,rsp
    3d04:	b8 17 00 00 00       	mov    eax,0x17
    3d09:	55                   	push   rbp
    3d0a:	48 0f 05             	rex.W syscall 
    3d0d:	5d                   	pop    rbp
    3d0e:	c9                   	leave  
    3d0f:	c3                   	ret    

0000000000003d10 <find_dev>:
    3d10:	55                   	push   rbp
    3d11:	48 89 e5             	mov    rbp,rsp
    3d14:	b8 19 00 00 00       	mov    eax,0x19
    3d19:	55                   	push   rbp
    3d1a:	48 0f 05             	rex.W syscall 
    3d1d:	5d                   	pop    rbp
    3d1e:	c9                   	leave  
    3d1f:	c3                   	ret    

0000000000003d20 <operate_dev>:
    3d20:	55                   	push   rbp
    3d21:	48 89 e5             	mov    rbp,rsp
    3d24:	b8 1a 00 00 00       	mov    eax,0x1a
    3d29:	55                   	push   rbp
    3d2a:	48 0f 05             	rex.W syscall 
    3d2d:	5d                   	pop    rbp
    3d2e:	c9                   	leave  
    3d2f:	c3                   	ret    

0000000000003d30 <fork>:
    3d30:	55                   	push   rbp
    3d31:	48 89 e5             	mov    rbp,rsp
    3d34:	b8 1b 00 00 00       	mov    eax,0x1b
    3d39:	55                   	push   rbp
    3d3a:	48 0f 05             	rex.W syscall 
    3d3d:	5d                   	pop    rbp
    3d3e:	c9                   	leave  
    3d3f:	c3                   	ret    

0000000000003d40 <execve>:
    3d40:	55                   	push   rbp
    3d41:	48 89 e5             	mov    rbp,rsp
    3d44:	b8 1c 00 00 00       	mov    eax,0x1c
    3d49:	55                   	push   rbp
    3d4a:	48 0f 05             	rex.W syscall 
    3d4d:	5d                   	pop    rbp
    3d4e:	c9                   	leave  
    3d4f:	c3                   	ret    

0000000000003d50 <waitpid>:
    3d50:	55                   	push   rbp
    3d51:	48 89 e5             	mov    rbp,rsp
    3d54:	b8 1d 00 00 00       	mov    eax,0x1d
    3d59:	55                   	push   rbp
    3d5a:	48 0f 05             	rex.W syscall 
    3d5d:	5d                   	pop    rbp
    3d5e:	c9                   	leave  
    3d5f:	c3                   	ret    

0000000000003d60 <mmap>:
    3d60:	55                   	push   rbp
    3d61:	48 89 e5             	mov    rbp,rsp
    3d64:	b8 1e 00 00 00       	mov    eax,0x1e
    3d69:	55                   	push   rbp
    3d6a:	48 0f 05             	rex.W syscall 
    3d6d:	5d                   	pop    rbp
    3d6e:	c9                   	leave  
    3d6f:	c3                   	ret    

0000000000003d70 <munmap>:
    3d70:	55                   	push   rbp
    3d71:	48 89 e5             	mov    rbp,rsp
    3d74:	b8 1f 00 00 00       	mov    eax,0x1f
    3d79:	55                   	push   rbp
    3d7a:	48 0f 05             	rex.W syscall 
    3d7d:	5d                   	pop    rbp
    3d7e:	c9                   	leave  
    3d7f:	c3                   	ret    

0000000000003d80 <mknod>:
    3d80:	55                   	push   rbp
    3d81:	48 89 e5             	mov    rbp,rsp
    3d84:	b8 21 00 00 00       	mov    eax,0x21
    3d89:	55                   	push   rbp
    3d8a:	48 0f 05             	rex.W syscall 
    3d8d:	5d                   	pop    rbp
    3d8e:	c9                   	leave  
    3d8f:	c3                   	ret    

0000000000003d90 <kb_readc>:
    3d90:	55                   	push   rbp
    3d91:	48 89 e5             	mov    rbp,rsp
    3d94:	b8 64 00 00 00       	mov    eax,0x64
    3d99:	55                   	push   rbp
    3d9a:	48 0f 05             	rex.W syscall 
    3d9d:	5d                   	pop    rbp
    3d9e:	c9                   	leave  
    3d9f:	c3                   	ret    

0000000000003da0 <remove>:
    3da0:	55                   	push   rbp
    3da1:	48 89 e5             	mov    rbp,rsp
    3da4:	b8 22 00 00 00       	mov    eax,0x22
    3da9:	55                   	push   rbp
    3daa:	48 0f 05             	rex.W syscall 
    3dad:	5d                   	pop    rbp
    3dae:	c9                   	leave  
    3daf:	c3                   	ret    

0000000000003db0 <sbrk>:
    3db0:	55                   	push   rbp
    3db1:	48 89 e5             	mov    rbp,rsp
    3db4:	b8 23 00 00 00       	mov    eax,0x23
    3db9:	55                   	push   rbp
    3dba:	48 0f 05             	rex.W syscall 
    3dbd:	5d                   	pop    rbp
    3dbe:	c9                   	leave  
    3dbf:	c3                   	ret    

0000000000003dc0 <chkmmap>:
    3dc0:	55                   	push   rbp
    3dc1:	48 89 e5             	mov    rbp,rsp
    3dc4:	b8 24 00 00 00       	mov    eax,0x24
    3dc9:	55                   	push   rbp
    3dca:	48 0f 05             	rex.W syscall 
    3dcd:	5d                   	pop    rbp
    3dce:	c9                   	leave  
    3dcf:	c3                   	ret    
