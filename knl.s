
bin/gmsknl.elf:     file format elf64-x86-64


Disassembly of section .entry:

0000000000103000 <init32>:
  103000:	eb 32                	jmp    103034 <init32>

0000000000103002 <gdt64>:
	...
  10300e:	00 98 20 00 00 00    	add    BYTE PTR [rax+0x20],bl
  103014:	00 00                	add    BYTE PTR [rax],al
  103016:	00 92 00 00 00 00    	add    BYTE PTR [rdx+0x0],dl
  10301c:	00 00                	add    BYTE PTR [rax],al
  10301e:	00 f8                	add    al,bh
  103020:	20 00                	and    BYTE PTR [rax],al
  103022:	00 00                	add    BYTE PTR [rax],al
  103024:	00 00                	add    BYTE PTR [rax],al
  103026:	00 f2                	add    dl,dh
	...

000000000010302a <gdtptr>:
  10302a:	27                   	(bad)  
  10302b:	00 00                	add    BYTE PTR [rax],al
  10302d:	30 10                	xor    BYTE PTR [rax],dl
  10302f:	00 00                	add    BYTE PTR [rax],al
  103031:	00 00                	add    BYTE PTR [rax],al
	...

0000000000103034 <init32>:
  103034:	fa                   	cli    
  103035:	89 de                	mov    esi,ebx
  103037:	89 c7                	mov    edi,eax
  103039:	b8 2a 30 10 00       	mov    eax,0x10302a
  10303e:	83 c0 02             	add    eax,0x2
  103041:	c7 00 02 30 10 00    	mov    DWORD PTR [rax],0x103002
  103047:	b8 2a 30 10 00       	mov    eax,0x10302a
  10304c:	66 0f 01 10          	data16 lgdt [rax]

0000000000103050 <set_paging>:
  103050:	66 b8 10 00          	mov    ax,0x10
  103054:	8e d8                	mov    ds,eax
  103056:	8e d0                	mov    ss,eax
  103058:	8e c0                	mov    es,eax
  10305a:	8e e8                	mov    gs,eax
  10305c:	8e e0                	mov    fs,eax
  10305e:	0f 20 e0             	mov    rax,cr4
  103061:	0f ba e8 05          	bts    eax,0x5
  103065:	0f 22 e0             	mov    cr4,rax
  103068:	0f 20 c0             	mov    rax,cr0
  10306b:	bb 00 00 00 80       	mov    ebx,0x80000000
  103070:	f7 d3                	not    ebx
  103072:	21 d8                	and    eax,ebx
  103074:	0f 22 c0             	mov    cr0,rax
  103077:	b8 00 00 10 00       	mov    eax,0x100000
  10307c:	c7 00 07 10 10 00    	mov    DWORD PTR [rax],0x101007
  103082:	c7 80 00 10 00 00 83 	mov    DWORD PTR [rax+0x1000],0x83
  103089:	00 00 00 
  10308c:	b8 00 00 10 00       	mov    eax,0x100000
  103091:	0f 22 d8             	mov    cr3,rax

0000000000103094 <switch_cs>:
  103094:	bc 00 00 40 00       	mov    esp,0x400000
  103099:	b9 80 00 00 c0       	mov    ecx,0xc0000080
  10309e:	0f 32                	rdmsr  
  1030a0:	0f ba e8 08          	bts    eax,0x8
  1030a4:	0f 30                	wrmsr  
  1030a6:	0f 20 c0             	mov    rax,cr0
  1030a9:	0f ba e8 00          	bts    eax,0x0
  1030ad:	0f ba e8 1f          	bts    eax,0x1f
  1030b1:	0f 22 c0             	mov    cr0,rax
  1030b4:	b8 66 07 80 00       	mov    eax,0x800766
  1030b9:	ea                   	(bad)  
  1030ba:	66 07                	data16 (bad) 
  1030bc:	80 00 08             	add    BYTE PTR [rax],0x8
	...

bin/gmsknl.elf:     file format elf64-x86-64


Disassembly of section .text:

0000000000800000 <init_int>:
#include "exe.h"
#include "syscall.h"
#include "kb.h"
gate *idt=IDT_ADDR;
extern int disk_int_handler();
void init_int(){
  800000:	f3 0f 1e fa          	endbr64 
  800004:	55                   	push   rbp
  800005:	48 89 e5             	mov    rbp,rsp
  800008:	48 83 ec 10          	sub    rsp,0x10
    //asm volatile("sidt %0"::"m"(idt));
    set_gate(0,(addr_t)divide_err,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80000c:	b8 98 03 80 00       	mov    eax,0x800398
  800011:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800016:	ba 08 00 00 00       	mov    edx,0x8
  80001b:	48 89 c6             	mov    rsi,rax
  80001e:	bf 00 00 00 00       	mov    edi,0x0
  800023:	e8 e4 02 00 00       	call   80030c <set_gate>
    set_gate(1,(addr_t)debug,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800028:	b8 b1 03 80 00       	mov    eax,0x8003b1
  80002d:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800032:	ba 08 00 00 00       	mov    edx,0x8
  800037:	48 89 c6             	mov    rsi,rax
  80003a:	bf 01 00 00 00       	mov    edi,0x1
  80003f:	e8 c8 02 00 00       	call   80030c <set_gate>
    set_gate(2,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800044:	b8 ca 03 80 00       	mov    eax,0x8003ca
  800049:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80004e:	ba 08 00 00 00       	mov    edx,0x8
  800053:	48 89 c6             	mov    rsi,rax
  800056:	bf 02 00 00 00       	mov    edi,0x2
  80005b:	e8 ac 02 00 00       	call   80030c <set_gate>
    set_gate(3,(addr_t)breakpoint,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800060:	b8 e3 03 80 00       	mov    eax,0x8003e3
  800065:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80006a:	ba 08 00 00 00       	mov    edx,0x8
  80006f:	48 89 c6             	mov    rsi,rax
  800072:	bf 03 00 00 00       	mov    edi,0x3
  800077:	e8 90 02 00 00       	call   80030c <set_gate>
    set_gate(4,(addr_t)overflow,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80007c:	b8 fc 03 80 00       	mov    eax,0x8003fc
  800081:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800086:	ba 08 00 00 00       	mov    edx,0x8
  80008b:	48 89 c6             	mov    rsi,rax
  80008e:	bf 04 00 00 00       	mov    edi,0x4
  800093:	e8 74 02 00 00       	call   80030c <set_gate>
    set_gate(5,(addr_t)bounds,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800098:	b8 15 04 80 00       	mov    eax,0x800415
  80009d:	b9 00 8e 00 00       	mov    ecx,0x8e00
  8000a2:	ba 08 00 00 00       	mov    edx,0x8
  8000a7:	48 89 c6             	mov    rsi,rax
  8000aa:	bf 05 00 00 00       	mov    edi,0x5
  8000af:	e8 58 02 00 00       	call   80030c <set_gate>
    set_gate(6,(addr_t)undefined_operator,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  8000b4:	b8 2e 04 80 00       	mov    eax,0x80042e
  8000b9:	b9 00 8e 00 00       	mov    ecx,0x8e00
  8000be:	ba 08 00 00 00       	mov    edx,0x8
  8000c3:	48 89 c6             	mov    rsi,rax
  8000c6:	bf 06 00 00 00       	mov    edi,0x6
  8000cb:	e8 3c 02 00 00       	call   80030c <set_gate>
    set_gate(7,(addr_t)coprocessor_notexist,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  8000d0:	b8 51 04 80 00       	mov    eax,0x800451
  8000d5:	b9 00 8e 00 00       	mov    ecx,0x8e00
  8000da:	ba 08 00 00 00       	mov    edx,0x8
  8000df:	48 89 c6             	mov    rsi,rax
  8000e2:	bf 07 00 00 00       	mov    edi,0x7
  8000e7:	e8 20 02 00 00       	call   80030c <set_gate>
    set_gate(8,(addr_t)double_ints,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//double_ints
  8000ec:	b8 6a 04 80 00       	mov    eax,0x80046a
  8000f1:	b9 00 8e 00 00       	mov    ecx,0x8e00
  8000f6:	ba 08 00 00 00       	mov    edx,0x8
  8000fb:	48 89 c6             	mov    rsi,rax
  8000fe:	bf 08 00 00 00       	mov    edi,0x8
  800103:	e8 04 02 00 00       	call   80030c <set_gate>
    set_gate(9,(addr_t)coprocessor_seg_overbound,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800108:	b8 83 04 80 00       	mov    eax,0x800483
  80010d:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800112:	ba 08 00 00 00       	mov    edx,0x8
  800117:	48 89 c6             	mov    rsi,rax
  80011a:	bf 09 00 00 00       	mov    edi,0x9
  80011f:	e8 e8 01 00 00       	call   80030c <set_gate>
    set_gate(10,(addr_t)invalid_tss,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800124:	b8 9a 04 80 00       	mov    eax,0x80049a
  800129:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80012e:	ba 08 00 00 00       	mov    edx,0x8
  800133:	48 89 c6             	mov    rsi,rax
  800136:	bf 0a 00 00 00       	mov    edi,0xa
  80013b:	e8 cc 01 00 00       	call   80030c <set_gate>
    set_gate(11,(addr_t)segment_notexist,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800140:	b8 b3 04 80 00       	mov    eax,0x8004b3
  800145:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80014a:	ba 08 00 00 00       	mov    edx,0x8
  80014f:	48 89 c6             	mov    rsi,rax
  800152:	bf 0b 00 00 00       	mov    edi,0xb
  800157:	e8 b0 01 00 00       	call   80030c <set_gate>
    set_gate(12,(addr_t)stackseg_overbound,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80015c:	b8 cc 04 80 00       	mov    eax,0x8004cc
  800161:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800166:	ba 08 00 00 00       	mov    edx,0x8
  80016b:	48 89 c6             	mov    rsi,rax
  80016e:	bf 0c 00 00 00       	mov    edi,0xc
  800173:	e8 94 01 00 00       	call   80030c <set_gate>
    set_gate(13,(addr_t)general_protect,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800178:	b8 e5 04 80 00       	mov    eax,0x8004e5
  80017d:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800182:	ba 08 00 00 00       	mov    edx,0x8
  800187:	48 89 c6             	mov    rsi,rax
  80018a:	bf 0d 00 00 00       	mov    edi,0xd
  80018f:	e8 78 01 00 00       	call   80030c <set_gate>
    set_gate(14,(addr_t)page_err,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800194:	b8 f4 11 80 00       	mov    eax,0x8011f4
  800199:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80019e:	ba 08 00 00 00       	mov    edx,0x8
  8001a3:	48 89 c6             	mov    rsi,rax
  8001a6:	bf 0e 00 00 00       	mov    edi,0xe
  8001ab:	e8 5c 01 00 00       	call   80030c <set_gate>
    set_gate(15,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  8001b0:	b8 ca 03 80 00       	mov    eax,0x8003ca
  8001b5:	b9 00 8e 00 00       	mov    ecx,0x8e00
  8001ba:	ba 08 00 00 00       	mov    edx,0x8
  8001bf:	48 89 c6             	mov    rsi,rax
  8001c2:	bf 0f 00 00 00       	mov    edi,0xf
  8001c7:	e8 40 01 00 00       	call   80030c <set_gate>
    set_gate(16,(addr_t)coprocessor_err,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  8001cc:	b8 0a 05 80 00       	mov    eax,0x80050a
  8001d1:	b9 00 8e 00 00       	mov    ecx,0x8e00
  8001d6:	ba 08 00 00 00       	mov    edx,0x8
  8001db:	48 89 c6             	mov    rsi,rax
  8001de:	bf 10 00 00 00       	mov    edi,0x10
  8001e3:	e8 24 01 00 00       	call   80030c <set_gate>
    for (int i=17;i<48;i++)
  8001e8:	c7 45 fc 11 00 00 00 	mov    DWORD PTR [rbp-0x4],0x11
  8001ef:	eb 20                	jmp    800211 <init_int+0x211>
        set_gate(i,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  8001f1:	be ca 03 80 00       	mov    esi,0x8003ca
  8001f6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8001f9:	0f b6 c0             	movzx  eax,al
  8001fc:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800201:	ba 08 00 00 00       	mov    edx,0x8
  800206:	89 c7                	mov    edi,eax
  800208:	e8 ff 00 00 00       	call   80030c <set_gate>
    for (int i=17;i<48;i++)
  80020d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  800211:	83 7d fc 2f          	cmp    DWORD PTR [rbp-0x4],0x2f
  800215:	7e da                	jle    8001f1 <init_int+0x1f1>
	set_gate(0x21,(addr_t)key_proc,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800217:	b8 58 5e 80 00       	mov    eax,0x805e58
  80021c:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 d9 00 00 00       	call   80030c <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 c0 4c 80 00       	mov    eax,0x804cc0
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 bd 00 00 00       	call   80030c <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 20 6d 80 00       	mov    eax,0x806d20
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 a1 00 00 00       	call   80030c <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);//
  80026b:	b8 e0 56 80 00       	mov    eax,0x8056e0
  800270:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800275:	ba 08 00 00 00       	mov    edx,0x8
  80027a:	48 89 c6             	mov    rsi,rax
  80027d:	bf 80 00 00 00       	mov    edi,0x80
  800282:	e8 85 00 00 00       	call   80030c <set_gate>
    //set_gate(0x2c,mouse_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
    //启动8259A
    
	//ICW1
	outb(0x20,0x11);
  800287:	be 11 00 00 00       	mov    esi,0x11
  80028c:	bf 20 00 00 00       	mov    edi,0x20
  800291:	e8 4a 47 00 00       	call   8049e0 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 3b 47 00 00       	call   8049e0 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 2c 47 00 00       	call   8049e0 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 1d 47 00 00       	call   8049e0 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 0e 47 00 00       	call   8049e0 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 ff 46 00 00       	call   8049e0 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 f0 46 00 00       	call   8049e0 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 e1 46 00 00       	call   8049e0 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 1c 47 00 00       	call   804a25 <turn_on_int>

}
  800309:	90                   	nop
  80030a:	c9                   	leave  
  80030b:	c3                   	ret    

000000000080030c <set_gate>:
void set_gate(u8 index,addr_t offset,u16 selector,u16 attr)
{
  80030c:	f3 0f 1e fa          	endbr64 
  800310:	55                   	push   rbp
  800311:	48 89 e5             	mov    rbp,rsp
  800314:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  800318:	89 c8                	mov    eax,ecx
  80031a:	89 f9                	mov    ecx,edi
  80031c:	88 4d fc             	mov    BYTE PTR [rbp-0x4],cl
  80031f:	66 89 55 f8          	mov    WORD PTR [rbp-0x8],dx
  800323:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    idt[index].offset_low=offset&0xffffu;
  800327:	48 8b 15 d2 fc bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbffcd2]        # 400000 <idt>
  80032e:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800332:	48 c1 e0 03          	shl    rax,0x3
  800336:	48 01 d0             	add    rax,rdx
  800339:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80033d:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_high=(offset>>16)&0xffffu;
  800340:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800344:	48 c1 e8 10          	shr    rax,0x10
  800348:	48 89 c2             	mov    rdx,rax
  80034b:	48 8b 0d ae fc bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbffcae]        # 400000 <idt>
  800352:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800356:	48 c1 e0 03          	shl    rax,0x3
  80035a:	48 01 c8             	add    rax,rcx
  80035d:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].attr=attr;
  800361:	48 8b 15 98 fc bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbffc98]        # 400000 <idt>
  800368:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80036c:	48 c1 e0 03          	shl    rax,0x3
  800370:	48 01 c2             	add    rdx,rax
  800373:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  800377:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
    idt[index].selector=selector;
  80037b:	48 8b 15 7e fc bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbffc7e]        # 400000 <idt>
  800382:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800386:	48 c1 e0 03          	shl    rax,0x3
  80038a:	48 01 c2             	add    rdx,rax
  80038d:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  800391:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
}
  800395:	90                   	nop
  800396:	5d                   	pop    rbp
  800397:	c3                   	ret    

0000000000800398 <divide_err>:

void divide_err(){
  800398:	f3 0f 1e fa          	endbr64 
  80039c:	55                   	push   rbp
  80039d:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8003a0:	fa                   	cli    
    //puts("divide err");
    eoi();
  8003a1:	b8 00 00 00 00       	mov    eax,0x0
  8003a6:	e8 6e 46 00 00       	call   804a19 <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iret");
  8003ab:	fb                   	sti    
  8003ac:	c9                   	leave  
  8003ad:	cf                   	iret   
}
  8003ae:	90                   	nop
  8003af:	5d                   	pop    rbp
  8003b0:	c3                   	ret    

00000000008003b1 <debug>:

void debug(){
  8003b1:	f3 0f 1e fa          	endbr64 
  8003b5:	55                   	push   rbp
  8003b6:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8003b9:	fa                   	cli    
    //puts("debug");
    eoi();
  8003ba:	b8 00 00 00 00       	mov    eax,0x0
  8003bf:	e8 55 46 00 00       	call   804a19 <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iret");
  8003c4:	fb                   	sti    
  8003c5:	c9                   	leave  
  8003c6:	cf                   	iret   
}
  8003c7:	90                   	nop
  8003c8:	5d                   	pop    rbp
  8003c9:	c3                   	ret    

00000000008003ca <default_int_proc>:
void default_int_proc(){
  8003ca:	f3 0f 1e fa          	endbr64 
  8003ce:	55                   	push   rbp
  8003cf:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8003d2:	fa                   	cli    
    //puts("default_int_proc");
    eoi();
  8003d3:	b8 00 00 00 00       	mov    eax,0x0
  8003d8:	e8 3c 46 00 00       	call   804a19 <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iret");
  8003dd:	fb                   	sti    
  8003de:	c9                   	leave  
  8003df:	cf                   	iret   
}
  8003e0:	90                   	nop
  8003e1:	5d                   	pop    rbp
  8003e2:	c3                   	ret    

00000000008003e3 <breakpoint>:
void breakpoint(){
  8003e3:	f3 0f 1e fa          	endbr64 
  8003e7:	55                   	push   rbp
  8003e8:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8003eb:	fa                   	cli    
    //puts("breakpoint");
    eoi();
  8003ec:	b8 00 00 00 00       	mov    eax,0x0
  8003f1:	e8 23 46 00 00       	call   804a19 <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iret");
  8003f6:	fb                   	sti    
  8003f7:	c9                   	leave  
  8003f8:	cf                   	iret   
}
  8003f9:	90                   	nop
  8003fa:	5d                   	pop    rbp
  8003fb:	c3                   	ret    

00000000008003fc <overflow>:
void overflow(){
  8003fc:	f3 0f 1e fa          	endbr64 
  800400:	55                   	push   rbp
  800401:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800404:	fa                   	cli    
    //puts("overflow");
    eoi();
  800405:	b8 00 00 00 00       	mov    eax,0x0
  80040a:	e8 0a 46 00 00       	call   804a19 <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iret");
  80040f:	fb                   	sti    
  800410:	c9                   	leave  
  800411:	cf                   	iret   
}
  800412:	90                   	nop
  800413:	5d                   	pop    rbp
  800414:	c3                   	ret    

0000000000800415 <bounds>:
void bounds(){
  800415:	f3 0f 1e fa          	endbr64 
  800419:	55                   	push   rbp
  80041a:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80041d:	fa                   	cli    
    //puts("bounds");
    eoi();
  80041e:	b8 00 00 00 00       	mov    eax,0x0
  800423:	e8 f1 45 00 00       	call   804a19 <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iret");
  800428:	fb                   	sti    
  800429:	c9                   	leave  
  80042a:	cf                   	iret   
}
  80042b:	90                   	nop
  80042c:	5d                   	pop    rbp
  80042d:	c3                   	ret    

000000000080042e <undefined_operator>:
void undefined_operator(){
  80042e:	f3 0f 1e fa          	endbr64 
  800432:	55                   	push   rbp
  800433:	48 89 e5             	mov    rbp,rsp
    //puts("undef operator");
    eoi();
  800436:	b8 00 00 00 00       	mov    eax,0x0
  80043b:	e8 d9 45 00 00       	call   804a19 <eoi>
    report_back_trace_of_err();
  800440:	b8 00 00 00 00       	mov    eax,0x0
  800445:	e8 fa 45 00 00       	call   804a44 <report_back_trace_of_err>
    __asm__ volatile ("jmp .\r\n leave \r\n iret");
  80044a:	eb fe                	jmp    80044a <undefined_operator+0x1c>
  80044c:	c9                   	leave  
  80044d:	cf                   	iret   
}
  80044e:	90                   	nop
  80044f:	5d                   	pop    rbp
  800450:	c3                   	ret    

0000000000800451 <coprocessor_notexist>:
void coprocessor_notexist(){
  800451:	f3 0f 1e fa          	endbr64 
  800455:	55                   	push   rbp
  800456:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800459:	fa                   	cli    
    //puts("coprocessor doesnt exist");
    eoi();
  80045a:	b8 00 00 00 00       	mov    eax,0x0
  80045f:	e8 b5 45 00 00       	call   804a19 <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iret");
  800464:	fb                   	sti    
  800465:	c9                   	leave  
  800466:	cf                   	iret   
}
  800467:	90                   	nop
  800468:	5d                   	pop    rbp
  800469:	c3                   	ret    

000000000080046a <double_ints>:
void double_ints(){
  80046a:	f3 0f 1e fa          	endbr64 
  80046e:	55                   	push   rbp
  80046f:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800472:	fa                   	cli    
    //puts("double interrupts");
    eoi();
  800473:	b8 00 00 00 00       	mov    eax,0x0
  800478:	e8 9c 45 00 00       	call   804a19 <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iret");
  80047d:	fb                   	sti    
  80047e:	c9                   	leave  
  80047f:	cf                   	iret   
}
  800480:	90                   	nop
  800481:	5d                   	pop    rbp
  800482:	c3                   	ret    

0000000000800483 <coprocessor_seg_overbound>:
void coprocessor_seg_overbound(){
  800483:	f3 0f 1e fa          	endbr64 
  800487:	55                   	push   rbp
  800488:	48 89 e5             	mov    rbp,rsp
    //puts("coprocessfor seg overdound");
    eoi();
  80048b:	b8 00 00 00 00       	mov    eax,0x0
  800490:	e8 84 45 00 00       	call   804a19 <eoi>
    __asm__ volatile ("leave \r\n iret");
  800495:	c9                   	leave  
  800496:	cf                   	iret   
}
  800497:	90                   	nop
  800498:	5d                   	pop    rbp
  800499:	c3                   	ret    

000000000080049a <invalid_tss>:
void invalid_tss(){
  80049a:	f3 0f 1e fa          	endbr64 
  80049e:	55                   	push   rbp
  80049f:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8004a2:	fa                   	cli    
    //puts("invalid tss");
    eoi();
  8004a3:	b8 00 00 00 00       	mov    eax,0x0
  8004a8:	e8 6c 45 00 00       	call   804a19 <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iret");
  8004ad:	fb                   	sti    
  8004ae:	c9                   	leave  
  8004af:	cf                   	iret   
}
  8004b0:	90                   	nop
  8004b1:	5d                   	pop    rbp
  8004b2:	c3                   	ret    

00000000008004b3 <segment_notexist>:
void segment_notexist(){
  8004b3:	f3 0f 1e fa          	endbr64 
  8004b7:	55                   	push   rbp
  8004b8:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8004bb:	fa                   	cli    
    //puts("seg nonexistent");
    eoi();
  8004bc:	b8 00 00 00 00       	mov    eax,0x0
  8004c1:	e8 53 45 00 00       	call   804a19 <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iret");
  8004c6:	fb                   	sti    
  8004c7:	c9                   	leave  
  8004c8:	cf                   	iret   
}
  8004c9:	90                   	nop
  8004ca:	5d                   	pop    rbp
  8004cb:	c3                   	ret    

00000000008004cc <stackseg_overbound>:
void stackseg_overbound(){
  8004cc:	f3 0f 1e fa          	endbr64 
  8004d0:	55                   	push   rbp
  8004d1:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8004d4:	fa                   	cli    
    //puts("stack seg overbound");
    eoi();
  8004d5:	b8 00 00 00 00       	mov    eax,0x0
  8004da:	e8 3a 45 00 00       	call   804a19 <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iret");
  8004df:	fb                   	sti    
  8004e0:	c9                   	leave  
  8004e1:	cf                   	iret   
}
  8004e2:	90                   	nop
  8004e3:	5d                   	pop    rbp
  8004e4:	c3                   	ret    

00000000008004e5 <general_protect>:
void general_protect(){
  8004e5:	f3 0f 1e fa          	endbr64 
  8004e9:	55                   	push   rbp
  8004ea:	48 89 e5             	mov    rbp,rsp
  8004ed:	48 83 ec 10          	sub    rsp,0x10
    asm("cli");
  8004f1:	fa                   	cli    
    //puts("general protect.");
    int err_code=0;
  8004f2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    //杀死问题进程
    del_proc(cur_proc);
    printf("killed the problem process.\n");
	printf("shell:>");
    switch_proc_tss(0); */
    eoi();
  8004f9:	b8 00 00 00 00       	mov    eax,0x0
  8004fe:	e8 16 45 00 00       	call   804a19 <eoi>
    __asm__ volatile ("jmp .\r\n leave \r\n iret");
  800503:	eb fe                	jmp    800503 <general_protect+0x1e>
  800505:	c9                   	leave  
  800506:	cf                   	iret   
}
  800507:	90                   	nop
  800508:	c9                   	leave  
  800509:	c3                   	ret    

000000000080050a <coprocessor_err>:

void coprocessor_err(){
  80050a:	f3 0f 1e fa          	endbr64 
  80050e:	55                   	push   rbp
  80050f:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800512:	fa                   	cli    
    //puts("coprocessor err");
    eoi();
  800513:	b8 00 00 00 00       	mov    eax,0x0
  800518:	e8 fc 44 00 00       	call   804a19 <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iret");
  80051d:	fb                   	sti    
  80051e:	c9                   	leave  
  80051f:	cf                   	iret   
}
  800520:	90                   	nop
  800521:	5d                   	pop    rbp
  800522:	c3                   	ret    

0000000000800523 <syscall>:
int syscall(int func,int b,int c,int d,int e,int f)
{
  800523:	f3 0f 1e fa          	endbr64 
  800527:	55                   	push   rbp
  800528:	48 89 e5             	mov    rbp,rsp
  80052b:	48 83 ec 20          	sub    rsp,0x20
  80052f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  800532:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  800535:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  800538:	89 4d f0             	mov    DWORD PTR [rbp-0x10],ecx
  80053b:	44 89 45 ec          	mov    DWORD PTR [rbp-0x14],r8d
  80053f:	44 89 4d e8          	mov    DWORD PTR [rbp-0x18],r9d
    switch (func)
  800543:	83 7d fc 64          	cmp    DWORD PTR [rbp-0x4],0x64
  800547:	0f 87 17 02 00 00    	ja     800764 <syscall+0x241>
  80054d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  800550:	48 8b 04 c5 c0 14 81 	mov    rax,QWORD PTR [rax*8+0x8114c0]
  800557:	00 
  800558:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(b);
  80055b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80055e:	48 98                	cdqe   
  800560:	48 89 c7             	mov    rdi,rax
  800563:	e8 7e 24 00 00       	call   8029e6 <reg_device>
  800568:	e9 f7 01 00 00       	jmp    800764 <syscall+0x241>
        case 1:return dispose_device(b);
  80056d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800570:	89 c7                	mov    edi,eax
  800572:	e8 ce 2e 00 00       	call   803445 <dispose_device>
  800577:	e9 e8 01 00 00       	jmp    800764 <syscall+0x241>
        case 2:return reg_driver(b);
  80057c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80057f:	48 98                	cdqe   
  800581:	48 89 c7             	mov    rdi,rax
  800584:	e8 45 27 00 00       	call   802cce <reg_driver>
  800589:	e9 d6 01 00 00       	jmp    800764 <syscall+0x241>
        case 3:return dispose_driver(b);
  80058e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800591:	48 98                	cdqe   
  800593:	48 89 c7             	mov    rdi,rax
  800596:	e8 48 2f 00 00       	call   8034e3 <dispose_driver>
  80059b:	e9 c4 01 00 00       	jmp    800764 <syscall+0x241>
        case 4:return call_drv_func(b,c,d);
  8005a0:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8005a3:	48 98                	cdqe   
  8005a5:	48 89 c2             	mov    rdx,rax
  8005a8:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8005ab:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005ae:	89 ce                	mov    esi,ecx
  8005b0:	89 c7                	mov    edi,eax
  8005b2:	e8 37 2c 00 00       	call   8031ee <call_drv_func>
  8005b7:	e9 a8 01 00 00       	jmp    800764 <syscall+0x241>
        case 5:return req_page_at(b,c);
  8005bc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005bf:	48 98                	cdqe   
  8005c1:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8005c4:	89 d6                	mov    esi,edx
  8005c6:	48 89 c7             	mov    rdi,rax
  8005c9:	e8 05 10 00 00       	call   8015d3 <req_page_at>
  8005ce:	e9 91 01 00 00       	jmp    800764 <syscall+0x241>
        case 6:return free_page(b);
  8005d3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005d6:	48 98                	cdqe   
  8005d8:	48 89 c7             	mov    rdi,rax
  8005db:	e8 24 0e 00 00       	call   801404 <free_page>
  8005e0:	e9 7f 01 00 00       	jmp    800764 <syscall+0x241>
        case 7:return reg_proc(b, c, d);
  8005e5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8005e8:	48 98                	cdqe   
  8005ea:	48 89 c2             	mov    rdx,rax
  8005ed:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8005f0:	48 98                	cdqe   
  8005f2:	48 89 c1             	mov    rcx,rax
  8005f5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005f8:	48 89 ce             	mov    rsi,rcx
  8005fb:	89 c7                	mov    edi,eax
  8005fd:	e8 e2 3f 00 00       	call   8045e4 <reg_proc>
  800602:	e9 5d 01 00 00       	jmp    800764 <syscall+0x241>
        case 8:del_proc(b);
  800607:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80060a:	89 c7                	mov    edi,eax
  80060c:	e8 b0 3d 00 00       	call   8043c1 <del_proc>
        case 10:chk_vm(b,c);
  800611:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  800614:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800617:	89 d6                	mov    esi,edx
  800619:	89 c7                	mov    edi,eax
  80061b:	e8 75 10 00 00       	call   801695 <chk_vm>
        case 11:return sys_open(b,c);
  800620:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800623:	48 98                	cdqe   
  800625:	48 89 c2             	mov    rdx,rax
  800628:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80062b:	89 c6                	mov    esi,eax
  80062d:	48 89 d7             	mov    rdi,rdx
  800630:	e8 44 14 00 00       	call   801a79 <sys_open>
  800635:	e9 2a 01 00 00       	jmp    800764 <syscall+0x241>
        case 12:return sys_close(b);
  80063a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80063d:	89 c7                	mov    edi,eax
  80063f:	e8 fe 18 00 00       	call   801f42 <sys_close>
  800644:	e9 1b 01 00 00       	jmp    800764 <syscall+0x241>
        case 13:return sys_read(b,c,d);
  800649:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80064c:	48 98                	cdqe   
  80064e:	48 89 c1             	mov    rcx,rax
  800651:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  800654:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800657:	48 89 ce             	mov    rsi,rcx
  80065a:	89 c7                	mov    edi,eax
  80065c:	e8 f7 19 00 00       	call   802058 <sys_read>
  800661:	e9 fe 00 00 00       	jmp    800764 <syscall+0x241>
        case 14:return sys_write(b,c,d);
  800666:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800669:	48 98                	cdqe   
  80066b:	48 89 c1             	mov    rcx,rax
  80066e:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  800671:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800674:	48 89 ce             	mov    rsi,rcx
  800677:	89 c7                	mov    edi,eax
  800679:	e8 49 19 00 00       	call   801fc7 <sys_write>
  80067e:	e9 e1 00 00 00       	jmp    800764 <syscall+0x241>
        case 15:return sys_seek(b,c,d);
  800683:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  800686:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  800689:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80068c:	89 ce                	mov    esi,ecx
  80068e:	89 c7                	mov    edi,eax
  800690:	e8 54 1a 00 00       	call   8020e9 <sys_seek>
  800695:	e9 ca 00 00 00       	jmp    800764 <syscall+0x241>
        case 16:return sys_tell(b);
  80069a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80069d:	89 c7                	mov    edi,eax
  80069f:	e8 8c 1a 00 00       	call   802130 <sys_tell>
  8006a4:	e9 bb 00 00 00       	jmp    800764 <syscall+0x241>
        case 17:return reg_vol(b,c,d);
  8006a9:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006ac:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006af:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006b2:	89 ce                	mov    esi,ecx
  8006b4:	89 c7                	mov    edi,eax
  8006b6:	b8 00 00 00 00       	mov    eax,0x0
  8006bb:	e8 ae 12 00 00       	call   80196e <reg_vol>
  8006c0:	e9 9f 00 00 00       	jmp    800764 <syscall+0x241>
        case 18:return free_vol(b);
  8006c5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006c8:	89 c7                	mov    edi,eax
  8006ca:	b8 00 00 00 00       	mov    eax,0x0
  8006cf:	e8 7e 12 00 00       	call   801952 <free_vol>
  8006d4:	e9 8b 00 00 00       	jmp    800764 <syscall+0x241>
        case 19:return execute(b);
  8006d9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006dc:	48 98                	cdqe   
  8006de:	48 89 c7             	mov    rdi,rax
  8006e1:	e8 4c 46 00 00       	call   804d32 <execute>
  8006e6:	eb 7c                	jmp    800764 <syscall+0x241>
        case SYSCALL_EXIT:return sys_exit(b);
  8006e8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006eb:	89 c7                	mov    edi,eax
  8006ed:	e8 d1 3e 00 00       	call   8045c3 <sys_exit>
  8006f2:	eb 70                	jmp    800764 <syscall+0x241>
        case SYSCALL_CALL:return exec_call(b);
  8006f4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006f7:	48 98                	cdqe   
  8006f9:	48 89 c7             	mov    rdi,rax
  8006fc:	e8 2c 47 00 00       	call   804e2d <exec_call>
  800701:	eb 61                	jmp    800764 <syscall+0x241>
        case SYSCALL_MKFIFO:return sys_mkfifo(b);
  800703:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800706:	89 c7                	mov    edi,eax
  800708:	e8 e6 10 00 00       	call   8017f3 <sys_mkfifo>
  80070d:	eb 55                	jmp    800764 <syscall+0x241>
        case SYSCALL_MALLOC:return sys_malloc(b);
  80070f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800712:	89 c7                	mov    edi,eax
  800714:	e8 81 40 00 00       	call   80479a <sys_malloc>
  800719:	eb 49                	jmp    800764 <syscall+0x241>
        case SYSCALL_FREE:return sys_free(b);
  80071b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80071e:	89 c7                	mov    edi,eax
  800720:	e8 03 42 00 00       	call   804928 <sys_free>
  800725:	eb 3d                	jmp    800764 <syscall+0x241>
        case SYSCALL_KB_READC:return sys_getkbc();
  800727:	b8 00 00 00 00       	mov    eax,0x0
  80072c:	e8 fe 57 00 00       	call   805f2f <sys_getkbc>
  800731:	0f be c0             	movsx  eax,al
  800734:	eb 2e                	jmp    800764 <syscall+0x241>
        case SYSCALL_FIND_DEV:return sys_find_dev(b);
  800736:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800739:	48 98                	cdqe   
  80073b:	48 89 c7             	mov    rdi,rax
  80073e:	e8 db 26 00 00       	call   802e1e <sys_find_dev>
  800743:	eb 1f                	jmp    800764 <syscall+0x241>
        case SYSCALL_OPERATE_DEV:return sys_operate_dev(b,c,d);
  800745:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  800748:	48 98                	cdqe   
  80074a:	48 89 c2             	mov    rdx,rax
  80074d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800750:	48 98                	cdqe   
  800752:	48 89 c1             	mov    rcx,rax
  800755:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800758:	89 c6                	mov    esi,eax
  80075a:	48 89 cf             	mov    rdi,rcx
  80075d:	e8 4e 27 00 00       	call   802eb0 <sys_operate_dev>
  800762:	eb 00                	jmp    800764 <syscall+0x241>
    }
    // __asm__ volatile("mov %0,%%eax\r\n mov %1,%%ebx\r\n mov %2,%%ecx\r\n mov %3,%%edx\r\n mov %4,%%esi\r\n mov %5,%%edi"\
    // ::"m"(func),"m"(a),"m"(b),"m"(c),"m"(d),"m"(e));
    // __asm__ volatile("int $0x80\r\n leave\r\n ret");
  800764:	c9                   	leave  
  800765:	c3                   	ret    

0000000000800766 <main>:
#include <kb.h>
#include "com.h"

int manage_proc_lock=1;
void main(unsigned int magic,void* addr)
{
  800766:	f3 0f 1e fa          	endbr64 
  80076a:	55                   	push   rbp
  80076b:	48 89 e5             	mov    rbp,rsp
  80076e:	48 83 ec 60          	sub    rsp,0x60
  800772:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  800775:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi

    struct multiboot_header* mbi=0ul;
  800779:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  800780:	00 
    mbi=(struct multiboot_header*)addr;
  800781:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  800785:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    init_logging();
  800789:	b8 00 00 00 00       	mov    eax,0x0
  80078e:	e8 51 03 00 00       	call   800ae4 <init_logging>
        
    }
    //获取tags
    struct multiboot_tag *tag;
	unsigned size;
    size = *(unsigned long*)addr;
  800793:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  800797:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80079a:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
//    //printf("Announced mbi size 0x%x\n", size);
	for (tag = (struct multiboot_tag *)(addr + 8);
  80079d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8007a1:	48 83 c0 08          	add    rax,0x8
  8007a5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8007a9:	e9 90 02 00 00       	jmp    800a3e <main+0x2d8>
		 tag->type != MULTIBOOT_TAG_TYPE_END;
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
	{
		//printf("Tag 0x%x, Size 0x%x\n", tag->type, tag->size);
		switch (tag->type)
  8007ae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8007b2:	8b 00                	mov    eax,DWORD PTR [rax]
  8007b4:	83 f8 08             	cmp    eax,0x8
  8007b7:	0f 87 6e 02 00 00    	ja     800a2b <main+0x2c5>
  8007bd:	89 c0                	mov    eax,eax
  8007bf:	48 8b 04 c5 08 18 81 	mov    rax,QWORD PTR [rax*8+0x811808]
  8007c6:	00 
  8007c7:	3e ff e0             	notrack jmp rax
			break;
		case MULTIBOOT_TAG_TYPE_BASIC_MEMINFO:
			//printf("mem_lower = %uKB, mem_upper = %uKB\n",
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_lower,
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_upper);
			set_high_mem_base(((struct multiboot_tag_basic_meminfo *)tag)->mem_lower);
  8007ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8007ce:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8007d1:	89 c7                	mov    edi,eax
  8007d3:	e8 8d 08 00 00       	call   801065 <set_high_mem_base>
			break;
  8007d8:	e9 4e 02 00 00       	jmp    800a2b <main+0x2c5>
		{
			multiboot_memory_map_t *mmap;

			//printf("mmap\n");

			for (mmap = ((struct multiboot_tag_mmap *)tag)->entries;
  8007dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8007e1:	48 83 c0 10          	add    rax,0x10
  8007e5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8007e9:	eb 66                	jmp    800851 <main+0xeb>
//					   (unsigned)(mmap->addr >> 32),
//					   (unsigned)(mmap->addr & 0xffffffff),
//					   (unsigned)(mmap->len >> 32),
//					   (unsigned)(mmap->len & 0xffffffff),
//					   (unsigned)mmap->type);
					set_mem_area(mmap->addr,mmap->len,mmap->type);
  8007eb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8007ef:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
					   " length = 0x%x%x, type = 0x%x,",
  8007f2:	89 c2                	mov    edx,eax
					set_mem_area(mmap->addr,mmap->len,mmap->type);
  8007f4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8007f8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
					   " length = 0x%x%x, type = 0x%x,",
  8007fc:	89 c1                	mov    ecx,eax
					set_mem_area(mmap->addr,mmap->len,mmap->type);
  8007fe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800802:	48 8b 00             	mov    rax,QWORD PTR [rax]
					   " length = 0x%x%x, type = 0x%x,",
  800805:	89 ce                	mov    esi,ecx
  800807:	89 c7                	mov    edi,eax
  800809:	e8 6e 08 00 00       	call   80107c <set_mem_area>
					switch (mmap->type)
  80080e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800812:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  800815:	83 f8 05             	cmp    eax,0x5
  800818:	74 19                	je     800833 <main+0xcd>
  80081a:	83 f8 05             	cmp    eax,0x5
  80081d:	77 17                	ja     800836 <main+0xd0>
  80081f:	83 f8 04             	cmp    eax,0x4
  800822:	74 15                	je     800839 <main+0xd3>
  800824:	83 f8 04             	cmp    eax,0x4
  800827:	77 0d                	ja     800836 <main+0xd0>
  800829:	83 f8 01             	cmp    eax,0x1
  80082c:	74 0e                	je     80083c <main+0xd6>
  80082e:	83 f8 03             	cmp    eax,0x3
						//printf("available RAM\n");
						break;
					
					case 3:
						//printf("ACPI info\n");
						break;
  800831:	eb 0a                	jmp    80083d <main+0xd7>
					case 4:
						//printf("reserved mem needed to preserve on hibernation\n");
						break;
					case 5:
						//printf("defected mem\n");
						break;
  800833:	90                   	nop
  800834:	eb 07                	jmp    80083d <main+0xd7>
					default:
						//printf("reserved mem\n");
						break;
  800836:	90                   	nop
  800837:	eb 04                	jmp    80083d <main+0xd7>
						break;
  800839:	90                   	nop
  80083a:	eb 01                	jmp    80083d <main+0xd7>
						break;
  80083c:	90                   	nop
				 mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
  80083d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800841:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  800844:	89 c2                	mov    edx,eax
  800846:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80084a:	48 01 d0             	add    rax,rdx
  80084d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
				 (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
  800851:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800855:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800858:	89 c2                	mov    edx,eax
  80085a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80085e:	48 01 d0             	add    rax,rdx
  800861:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  800865:	72 84                	jb     8007eb <main+0x85>
					}

				}
		}
		break;
  800867:	e9 bf 01 00 00       	jmp    800a2b <main+0x2c5>
		case MULTIBOOT_TAG_TYPE_FRAMEBUFFER:
		{
			multiboot_uint32_t color;
			unsigned i;
			struct multiboot_tag_framebuffer *tagfb = (struct multiboot_tag_framebuffer *)tag;
  80086c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800870:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
			void *fb = (void *) FRAMEBUFFER_ADDR;
  800874:	48 b8 00 00 00 00 40 	movabs rax,0x4000000000
  80087b:	00 00 00 
  80087e:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
			set_framebuffer(*tagfb);
  800882:	48 83 ec 08          	sub    rsp,0x8
  800886:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80088a:	ff 70 20             	push   QWORD PTR [rax+0x20]
  80088d:	ff 70 18             	push   QWORD PTR [rax+0x18]
  800890:	ff 70 10             	push   QWORD PTR [rax+0x10]
  800893:	ff 70 08             	push   QWORD PTR [rax+0x8]
  800896:	ff 30                	push   QWORD PTR [rax]
  800898:	e8 0d 50 00 00       	call   8058aa <set_framebuffer>
  80089d:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  8008a1:	b8 00 00 00 00       	mov    eax,0x0
  8008a6:	e8 44 4e 00 00       	call   8056ef <init_framebuffer>
			switch (tagfb->common.framebuffer_type)
  8008ab:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8008af:	0f b6 40 1d          	movzx  eax,BYTE PTR [rax+0x1d]
  8008b3:	0f b6 c0             	movzx  eax,al
  8008b6:	83 f8 02             	cmp    eax,0x2
  8008b9:	0f 84 5a 01 00 00    	je     800a19 <main+0x2b3>
  8008bf:	83 f8 02             	cmp    eax,0x2
  8008c2:	0f 8f 5a 01 00 00    	jg     800a22 <main+0x2bc>
  8008c8:	85 c0                	test   eax,eax
  8008ca:	74 0e                	je     8008da <main+0x174>
  8008cc:	83 f8 01             	cmp    eax,0x1
  8008cf:	0f 84 15 01 00 00    	je     8009ea <main+0x284>
  8008d5:	e9 48 01 00 00       	jmp    800a22 <main+0x2bc>
			case MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED:
			{
				unsigned best_distance, distance;
				struct multiboot_color *palette;

				palette = tagfb->framebuffer_palette;
  8008da:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8008de:	48 83 c0 22          	add    rax,0x22
  8008e2:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

				color = 0;
  8008e6:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
				best_distance = 4 * 256 * 256;
  8008ed:	c7 45 e8 00 00 04 00 	mov    DWORD PTR [rbp-0x18],0x40000

				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  8008f4:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8008fb:	e9 d4 00 00 00       	jmp    8009d4 <main+0x26e>
				{
					distance = (0xff - palette[i].blue) * (0xff - palette[i].blue) + palette[i].red * palette[i].red + palette[i].green * palette[i].green;
  800900:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800903:	48 89 d0             	mov    rax,rdx
  800906:	48 01 c0             	add    rax,rax
  800909:	48 01 c2             	add    rdx,rax
  80090c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800910:	48 01 d0             	add    rax,rdx
  800913:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  800917:	0f b6 c0             	movzx  eax,al
  80091a:	ba ff 00 00 00       	mov    edx,0xff
  80091f:	89 d1                	mov    ecx,edx
  800921:	29 c1                	sub    ecx,eax
  800923:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800926:	48 89 d0             	mov    rax,rdx
  800929:	48 01 c0             	add    rax,rax
  80092c:	48 01 c2             	add    rdx,rax
  80092f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800933:	48 01 d0             	add    rax,rdx
  800936:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  80093a:	0f b6 d0             	movzx  edx,al
  80093d:	b8 ff 00 00 00       	mov    eax,0xff
  800942:	29 d0                	sub    eax,edx
  800944:	89 ce                	mov    esi,ecx
  800946:	0f af f0             	imul   esi,eax
  800949:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80094c:	48 89 d0             	mov    rax,rdx
  80094f:	48 01 c0             	add    rax,rax
  800952:	48 01 c2             	add    rdx,rax
  800955:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800959:	48 01 d0             	add    rax,rdx
  80095c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80095f:	0f b6 c8             	movzx  ecx,al
  800962:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800965:	48 89 d0             	mov    rax,rdx
  800968:	48 01 c0             	add    rax,rax
  80096b:	48 01 c2             	add    rdx,rax
  80096e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800972:	48 01 d0             	add    rax,rdx
  800975:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800978:	0f b6 c0             	movzx  eax,al
  80097b:	0f af c1             	imul   eax,ecx
  80097e:	01 c6                	add    esi,eax
  800980:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800983:	48 89 d0             	mov    rax,rdx
  800986:	48 01 c0             	add    rax,rax
  800989:	48 01 c2             	add    rdx,rax
  80098c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800990:	48 01 d0             	add    rax,rdx
  800993:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800997:	0f b6 c8             	movzx  ecx,al
  80099a:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80099d:	48 89 d0             	mov    rax,rdx
  8009a0:	48 01 c0             	add    rax,rax
  8009a3:	48 01 c2             	add    rdx,rax
  8009a6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009aa:	48 01 d0             	add    rax,rdx
  8009ad:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  8009b1:	0f b6 c0             	movzx  eax,al
  8009b4:	0f af c1             	imul   eax,ecx
  8009b7:	01 f0                	add    eax,esi
  8009b9:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
					if (distance < best_distance)
  8009bc:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8009bf:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  8009c2:	73 0c                	jae    8009d0 <main+0x26a>
					{
						color = i;
  8009c4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8009c7:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
						best_distance = distance;
  8009ca:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8009cd:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  8009d0:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8009d4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8009d8:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
  8009dc:	0f b7 c0             	movzx  eax,ax
  8009df:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8009e2:	0f 82 18 ff ff ff    	jb     800900 <main+0x19a>
					}
				}
			}
			break;
  8009e8:	eb 40                	jmp    800a2a <main+0x2c4>

			case MULTIBOOT_FRAMEBUFFER_TYPE_RGB:
				color = ((1 << tagfb->framebuffer_blue_mask_size) - 1) << tagfb->framebuffer_blue_field_position;
  8009ea:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8009ee:	0f b6 40 25          	movzx  eax,BYTE PTR [rax+0x25]
  8009f2:	0f b6 c0             	movzx  eax,al
  8009f5:	ba 01 00 00 00       	mov    edx,0x1
  8009fa:	89 c1                	mov    ecx,eax
  8009fc:	d3 e2                	shl    edx,cl
  8009fe:	89 d0                	mov    eax,edx
  800a00:	8d 50 ff             	lea    edx,[rax-0x1]
  800a03:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a07:	0f b6 40 24          	movzx  eax,BYTE PTR [rax+0x24]
  800a0b:	0f b6 c0             	movzx  eax,al
  800a0e:	89 c1                	mov    ecx,eax
  800a10:	d3 e2                	shl    edx,cl
  800a12:	89 d0                	mov    eax,edx
  800a14:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
				break;
  800a17:	eb 11                	jmp    800a2a <main+0x2c4>

			case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT:
				color = '\\' | 0x0100;
  800a19:	c7 45 c4 5c 01 00 00 	mov    DWORD PTR [rbp-0x3c],0x15c
				break;
  800a20:	eb 08                	jmp    800a2a <main+0x2c4>

			default:
				color = 0xffffffff;
  800a22:	c7 45 c4 ff ff ff ff 	mov    DWORD PTR [rbp-0x3c],0xffffffff
				break;
  800a29:	90                   	nop
			}

			break;
  800a2a:	90                   	nop
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
  800a2b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800a2f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800a32:	83 c0 07             	add    eax,0x7
  800a35:	89 c0                	mov    eax,eax
  800a37:	83 e0 f8             	and    eax,0xfffffff8
  800a3a:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
		 tag->type != MULTIBOOT_TAG_TYPE_END;
  800a3e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800a42:	8b 00                	mov    eax,DWORD PTR [rax]
  800a44:	85 c0                	test   eax,eax
  800a46:	0f 85 62 fd ff ff    	jne    8007ae <main+0x48>
		}
		}
	}
	tag = (struct multiboot_tag *)((multiboot_uint8_t *)tag + ((tag->size + 7) & ~7));
  800a4c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800a50:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800a53:	83 c0 07             	add    eax,0x7
  800a56:	89 c0                	mov    eax,eax
  800a58:	83 e0 f8             	and    eax,0xfffffff8
  800a5b:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
	//printf("Total mbi size 0x%x\n", (unsigned)tag - addr);
	char disk_count=*(char*)0x475;
  800a5f:	b8 75 04 00 00       	mov    eax,0x475
  800a64:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800a67:	88 45 db             	mov    BYTE PTR [rbp-0x25],al
	//printf("disk count:%d\n",disk_count);
    init_font();
  800a6a:	b8 00 00 00 00       	mov    eax,0x0
  800a6f:	e8 40 4d 00 00       	call   8057b4 <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel");
  800a74:	bf e8 17 81 00       	mov    edi,0x8117e8
  800a79:	e8 66 51 00 00       	call   805be4 <print>
//    init_com(PORT_COM1);
//    com_puts("gamessis os loaded.",PORT_COM1);
	init_paging();
  800a7e:	b8 00 00 00 00       	mov    eax,0x0
  800a83:	e8 b9 05 00 00       	call   801041 <init_paging>
// 	init_gdt();
	init_int();
  800a88:	b8 00 00 00 00       	mov    eax,0x0
  800a8d:	e8 6e f5 ff ff       	call   800000 <init_int>
	init_memory();
  800a92:	b8 00 00 00 00       	mov    eax,0x0
  800a97:	e8 8d 08 00 00       	call   801329 <init_memory>
	init_drvdev_man();
  800a9c:	b8 00 00 00 00       	mov    eax,0x0
  800aa1:	e8 26 1f 00 00       	call   8029cc <init_drvdev_man>
	init_proc();
  800aa6:	b8 00 00 00 00       	mov    eax,0x0
  800aab:	e8 07 2e 00 00       	call   8038b7 <init_proc>
    //自带驱动
    init_tty();
  800ab0:	b8 00 00 00 00       	mov    eax,0x0
  800ab5:	e8 68 81 00 00       	call   808c22 <init_tty>
    init_kb();
  800aba:	b8 00 00 00 00       	mov    eax,0x0
  800abf:	e8 75 53 00 00       	call   805e39 <init_kb>
    init_disk();
  800ac4:	b8 00 00 00 00       	mov    eax,0x0
  800ac9:	e8 c5 54 00 00       	call   805f93 <init_disk>

	init_vfs();
  800ace:	b8 00 00 00 00       	mov    eax,0x0
  800ad3:	e8 8d 1e 00 00       	call   802965 <init_vfs>
    //init_fat16();
	manage_proc_lock=0;
  800ad8:	c7 05 7e 93 00 00 00 	mov    DWORD PTR [rip+0x937e],0x0        # 809e60 <manage_proc_lock>
  800adf:	00 00 00 
    while (1);
  800ae2:	eb fe                	jmp    800ae2 <main+0x37c>

0000000000800ae4 <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800ae4:	f3 0f 1e fa          	endbr64 
  800ae8:	55                   	push   rbp
  800ae9:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800aec:	48 c7 05 11 f5 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff511],0xb8000        # 400008 <video>
  800af3:	00 80 0b 00 
    xpos=0;
  800af7:	c7 05 0f f5 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff50f],0x0        # 400010 <xpos>
  800afe:	00 00 00 
    ypos=0;
  800b01:	c7 05 09 f5 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff509],0x0        # 400014 <ypos>
  800b08:	00 00 00 
}
  800b0b:	90                   	nop
  800b0c:	5d                   	pop    rbp
  800b0d:	c3                   	ret    

0000000000800b0e <itoa>:

static void itoa (char *buf, int base, int d)
{
  800b0e:	f3 0f 1e fa          	endbr64 
  800b12:	55                   	push   rbp
  800b13:	48 89 e5             	mov    rbp,rsp
  800b16:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800b1a:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800b1d:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800b20:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800b24:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800b28:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800b2b:	48 98                	cdqe   
  800b2d:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800b31:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800b38:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800b3c:	75 27                	jne    800b65 <itoa+0x57>
  800b3e:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800b42:	79 21                	jns    800b65 <itoa+0x57>
    {
        *p++ = '-';
  800b44:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800b48:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800b4c:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800b50:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800b53:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800b58:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800b5b:	f7 d8                	neg    eax
  800b5d:	48 98                	cdqe   
  800b5f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800b63:	eb 0d                	jmp    800b72 <itoa+0x64>
    }
    else if (base == 'x')
  800b65:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800b69:	75 07                	jne    800b72 <itoa+0x64>
        divisor = 16;
  800b6b:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800b72:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800b75:	48 63 c8             	movsxd rcx,eax
  800b78:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800b7c:	ba 00 00 00 00       	mov    edx,0x0
  800b81:	48 f7 f1             	div    rcx
  800b84:	48 89 d0             	mov    rax,rdx
  800b87:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800b8a:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800b8e:	7f 0a                	jg     800b9a <itoa+0x8c>
  800b90:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800b93:	83 c0 30             	add    eax,0x30
  800b96:	89 c1                	mov    ecx,eax
  800b98:	eb 08                	jmp    800ba2 <itoa+0x94>
  800b9a:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800b9d:	83 c0 57             	add    eax,0x57
  800ba0:	89 c1                	mov    ecx,eax
  800ba2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ba6:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800baa:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800bae:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800bb0:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800bb3:	48 63 f0             	movsxd rsi,eax
  800bb6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800bba:	ba 00 00 00 00       	mov    edx,0x0
  800bbf:	48 f7 f6             	div    rsi
  800bc2:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800bc6:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800bcb:	75 a5                	jne    800b72 <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800bcd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800bd1:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800bd4:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800bd8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800bdc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800be0:	48 83 e8 01          	sub    rax,0x1
  800be4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800be8:	eb 2b                	jmp    800c15 <itoa+0x107>
    {
        char tmp = *p1;
  800bea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800bee:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800bf1:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800bf4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800bf8:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800bfb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800bff:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800c01:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c05:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800c09:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800c0b:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800c10:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800c15:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c19:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800c1d:	72 cb                	jb     800bea <itoa+0xdc>
    }
}
  800c1f:	90                   	nop
  800c20:	90                   	nop
  800c21:	5d                   	pop    rbp
  800c22:	c3                   	ret    

0000000000800c23 <putchar>:
 
/* 在屏幕上输出字符 C 。 */
static void putchar (int c)
{
  800c23:	f3 0f 1e fa          	endbr64 
  800c27:	55                   	push   rbp
  800c28:	48 89 e5             	mov    rbp,rsp
  800c2b:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if (c == '\n' || c == '\r')
  800c2e:	83 7d fc 0a          	cmp    DWORD PTR [rbp-0x4],0xa
  800c32:	74 06                	je     800c3a <putchar+0x17>
  800c34:	83 7d fc 0d          	cmp    DWORD PTR [rbp-0x4],0xd
  800c38:	75 38                	jne    800c72 <putchar+0x4f>
    {
newline:
  800c3a:	90                   	nop
  800c3b:	eb 01                	jmp    800c3e <putchar+0x1b>
    *(video + (xpos + ypos * COLUMNS) * 2) = c & 0xFF;
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
  800c3d:	90                   	nop
        xpos = 0;
  800c3e:	c7 05 c8 f3 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff3c8],0x0        # 400010 <xpos>
  800c45:	00 00 00 
        ypos++;
  800c48:	8b 05 c6 f3 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff3c6]        # 400014 <ypos>
  800c4e:	83 c0 01             	add    eax,0x1
  800c51:	89 05 bd f3 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff3bd],eax        # 400014 <ypos>
        if (ypos >= LINES)
  800c57:	8b 05 b7 f3 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff3b7]        # 400014 <ypos>
  800c5d:	83 f8 17             	cmp    eax,0x17
  800c60:	0f 8e 88 00 00 00    	jle    800cee <putchar+0xcb>
            ypos = 0;
  800c66:	c7 05 a4 f3 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff3a4],0x0        # 400014 <ypos>
  800c6d:	00 00 00 
        return;
  800c70:	eb 7c                	jmp    800cee <putchar+0xcb>
    *(video + (xpos + ypos * COLUMNS) * 2) = c & 0xFF;
  800c72:	48 8b 0d 8f f3 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbff38f]        # 400008 <video>
  800c79:	8b 15 95 f3 bf ff    	mov    edx,DWORD PTR [rip+0xffffffffffbff395]        # 400014 <ypos>
  800c7f:	89 d0                	mov    eax,edx
  800c81:	c1 e0 02             	shl    eax,0x2
  800c84:	01 d0                	add    eax,edx
  800c86:	c1 e0 04             	shl    eax,0x4
  800c89:	89 c2                	mov    edx,eax
  800c8b:	8b 05 7f f3 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff37f]        # 400010 <xpos>
  800c91:	01 d0                	add    eax,edx
  800c93:	01 c0                	add    eax,eax
  800c95:	48 98                	cdqe   
  800c97:	48 01 c8             	add    rax,rcx
  800c9a:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  800c9d:	88 10                	mov    BYTE PTR [rax],dl
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
  800c9f:	48 8b 0d 62 f3 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbff362]        # 400008 <video>
  800ca6:	8b 15 68 f3 bf ff    	mov    edx,DWORD PTR [rip+0xffffffffffbff368]        # 400014 <ypos>
  800cac:	89 d0                	mov    eax,edx
  800cae:	c1 e0 02             	shl    eax,0x2
  800cb1:	01 d0                	add    eax,edx
  800cb3:	c1 e0 04             	shl    eax,0x4
  800cb6:	89 c2                	mov    edx,eax
  800cb8:	8b 05 52 f3 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff352]        # 400010 <xpos>
  800cbe:	01 d0                	add    eax,edx
  800cc0:	01 c0                	add    eax,eax
  800cc2:	48 98                	cdqe   
  800cc4:	48 83 c0 01          	add    rax,0x1
  800cc8:	48 01 c8             	add    rax,rcx
  800ccb:	c6 00 07             	mov    BYTE PTR [rax],0x7
    xpos++;
  800cce:	8b 05 3c f3 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff33c]        # 400010 <xpos>
  800cd4:	83 c0 01             	add    eax,0x1
  800cd7:	89 05 33 f3 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff333],eax        # 400010 <xpos>
    if (xpos >= COLUMNS)
  800cdd:	8b 05 2d f3 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff32d]        # 400010 <xpos>
  800ce3:	83 f8 4f             	cmp    eax,0x4f
  800ce6:	0f 8f 51 ff ff ff    	jg     800c3d <putchar+0x1a>
  800cec:	eb 01                	jmp    800cef <putchar+0xcc>
        return;
  800cee:	90                   	nop
}
  800cef:	5d                   	pop    rbp
  800cf0:	c3                   	ret    

0000000000800cf1 <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800cf1:	f3 0f 1e fa          	endbr64 
  800cf5:	55                   	push   rbp
  800cf6:	48 89 e5             	mov    rbp,rsp
  800cf9:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800d00:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800d07:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800d0e:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800d15:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800d1c:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800d23:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800d2a:	84 c0                	test   al,al
  800d2c:	74 20                	je     800d4e <printf+0x5d>
  800d2e:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800d32:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800d36:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800d3a:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800d3e:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800d42:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800d46:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800d4a:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800d4e:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800d55:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    int c;
    char buf[20];
 
    arg++;
  800d5c:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800d63:	08 
 
    while ((c = *format++) != 0)
  800d64:	e9 38 01 00 00       	jmp    800ea1 <printf+0x1b0>
    {
        if (c != '%')
  800d69:	83 bd 3c ff ff ff 25 	cmp    DWORD PTR [rbp-0xc4],0x25
  800d70:	74 12                	je     800d84 <printf+0x93>
            putchar (c);
  800d72:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  800d78:	89 c7                	mov    edi,eax
  800d7a:	e8 a4 fe ff ff       	call   800c23 <putchar>
  800d7f:	e9 1d 01 00 00       	jmp    800ea1 <printf+0x1b0>
        else
        {
            char *p;
 
            c = *format++;
  800d84:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800d8b:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800d8f:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800d96:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800d99:	0f be c0             	movsx  eax,al
  800d9c:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
            switch (c)
  800da2:	83 bd 3c ff ff ff 78 	cmp    DWORD PTR [rbp-0xc4],0x78
  800da9:	74 3a                	je     800de5 <printf+0xf4>
  800dab:	83 bd 3c ff ff ff 78 	cmp    DWORD PTR [rbp-0xc4],0x78
  800db2:	0f 8f cd 00 00 00    	jg     800e85 <printf+0x194>
  800db8:	83 bd 3c ff ff ff 75 	cmp    DWORD PTR [rbp-0xc4],0x75
  800dbf:	74 24                	je     800de5 <printf+0xf4>
  800dc1:	83 bd 3c ff ff ff 75 	cmp    DWORD PTR [rbp-0xc4],0x75
  800dc8:	0f 8f b7 00 00 00    	jg     800e85 <printf+0x194>
  800dce:	83 bd 3c ff ff ff 64 	cmp    DWORD PTR [rbp-0xc4],0x64
  800dd5:	74 0e                	je     800de5 <printf+0xf4>
  800dd7:	83 bd 3c ff ff ff 73 	cmp    DWORD PTR [rbp-0xc4],0x73
  800dde:	74 40                	je     800e20 <printf+0x12f>
  800de0:	e9 a0 00 00 00       	jmp    800e85 <printf+0x194>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800de5:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800dec:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800df0:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800df7:	8b 10                	mov    edx,DWORD PTR [rax]
  800df9:	8b 8d 3c ff ff ff    	mov    ecx,DWORD PTR [rbp-0xc4]
  800dff:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800e06:	89 ce                	mov    esi,ecx
  800e08:	48 89 c7             	mov    rdi,rax
  800e0b:	e8 fe fc ff ff       	call   800b0e <itoa>
                p = buf;
  800e10:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800e17:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800e1e:	eb 34                	jmp    800e54 <printf+0x163>
                break;
 
            case 's':
                p = *arg++;
  800e20:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e27:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e2b:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e32:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800e35:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800e3c:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800e43:	00 
  800e44:	75 0d                	jne    800e53 <printf+0x162>
                    p = "(null)";
  800e46:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x811850
  800e4d:	50 18 81 00 
  800e51:	eb 22                	jmp    800e75 <printf+0x184>
 
string:
  800e53:	90                   	nop
                while (*p)
  800e54:	eb 1f                	jmp    800e75 <printf+0x184>
                    putchar (*p++);
  800e56:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e5d:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e61:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800e68:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e6b:	0f be c0             	movsx  eax,al
  800e6e:	89 c7                	mov    edi,eax
  800e70:	e8 ae fd ff ff       	call   800c23 <putchar>
                while (*p)
  800e75:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e7c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e7f:	84 c0                	test   al,al
  800e81:	75 d3                	jne    800e56 <printf+0x165>
                break;
  800e83:	eb 1c                	jmp    800ea1 <printf+0x1b0>
 
            default:
                putchar (*((int *) arg++));
  800e85:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e8c:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e90:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e97:	8b 00                	mov    eax,DWORD PTR [rax]
  800e99:	89 c7                	mov    edi,eax
  800e9b:	e8 83 fd ff ff       	call   800c23 <putchar>
                break;
  800ea0:	90                   	nop
    while ((c = *format++) != 0)
  800ea1:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800ea8:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800eac:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800eb3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800eb6:	0f be c0             	movsx  eax,al
  800eb9:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
  800ebf:	83 bd 3c ff ff ff 00 	cmp    DWORD PTR [rbp-0xc4],0x0
  800ec6:	0f 85 9d fe ff ff    	jne    800d69 <printf+0x78>
            }
        }
    }
}
  800ecc:	90                   	nop
  800ecd:	90                   	nop
  800ece:	c9                   	leave  
  800ecf:	c3                   	ret    

0000000000800ed0 <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800ed0:	f3 0f 1e fa          	endbr64 
  800ed4:	55                   	push   rbp
  800ed5:	48 89 e5             	mov    rbp,rsp
  800ed8:	48 83 ec 40          	sub    rsp,0x40
  800edc:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800ee0:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800ee4:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800ee7:	48 8b 15 8a 8f 00 00 	mov    rdx,QWORD PTR [rip+0x8f8a]        # 809e78 <pml4>
  800eee:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800ef2:	48 c1 e8 27          	shr    rax,0x27
  800ef6:	48 c1 e0 03          	shl    rax,0x3
  800efa:	48 01 d0             	add    rax,rdx
  800efd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f00:	b0 00                	mov    al,0x0
  800f02:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800f06:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800f0d:	00 00 00 
  800f10:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800f14:	48 c1 e8 1e          	shr    rax,0x1e
  800f18:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800f1b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f1e:	48 98                	cdqe   
  800f20:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f27:	00 
  800f28:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f2c:	48 01 d0             	add    rax,rdx
  800f2f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f32:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800f36:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f3a:	83 e0 01             	and    eax,0x1
  800f3d:	48 85 c0             	test   rax,rax
  800f40:	75 2f                	jne    800f71 <mmap+0xa1>
    {
        pdp=(page_item*)vmalloc();
  800f42:	b8 00 00 00 00       	mov    eax,0x0
  800f47:	e8 b3 01 00 00       	call   8010ff <vmalloc>
  800f4c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        pdptp[pdpti]=(addr_t)pdp|attr;
  800f50:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f53:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800f57:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f5a:	48 98                	cdqe   
  800f5c:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f63:	00 
  800f64:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f68:	48 01 f0             	add    rax,rsi
  800f6b:	48 09 ca             	or     rdx,rcx
  800f6e:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800f71:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f75:	b0 00                	mov    al,0x0
  800f77:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800f7b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f7f:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f84:	48 c1 e8 15          	shr    rax,0x15
  800f88:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f8f:	00 
  800f90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f94:	48 01 d0             	add    rax,rdx
  800f97:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f9a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800f9e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fa2:	83 e0 01             	and    eax,0x1
  800fa5:	48 85 c0             	test   rax,rax
  800fa8:	75 37                	jne    800fe1 <mmap+0x111>
    {
        pt=(page_item*)vmalloc();
  800faa:	b8 00 00 00 00       	mov    eax,0x0
  800faf:	e8 4b 01 00 00       	call   8010ff <vmalloc>
  800fb4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800fb8:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800fbb:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800fbf:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800fc3:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800fc8:	48 c1 e8 15          	shr    rax,0x15
  800fcc:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800fd3:	00 
  800fd4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fd8:	48 01 f0             	add    rax,rsi
  800fdb:	48 09 ca             	or     rdx,rcx
  800fde:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  800fe1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fe5:	b0 00                	mov    al,0x0
  800fe7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  800feb:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  800fee:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  800ff2:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  800ff8:	48 c1 ea 0c          	shr    rdx,0xc
  800ffc:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  801003:	00 
  801004:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  801008:	48 01 ca             	add    rdx,rcx
  80100b:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  80100f:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  801012:	b8 00 00 00 00       	mov    eax,0x0
}
  801017:	c9                   	leave  
  801018:	c3                   	ret    

0000000000801019 <mdemap>:

stat_t mdemap(addr_t la)
{
  801019:	f3 0f 1e fa          	endbr64 
  80101d:	55                   	push   rbp
  80101e:	48 89 e5             	mov    rbp,rsp
  801021:	48 83 ec 10          	sub    rsp,0x10
  801025:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  801029:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80102d:	ba 00 00 00 00       	mov    edx,0x0
  801032:	48 89 c6             	mov    rsi,rax
  801035:	bf 00 00 00 00       	mov    edi,0x0
  80103a:	e8 91 fe ff ff       	call   800ed0 <mmap>
}
  80103f:	c9                   	leave  
  801040:	c3                   	ret    

0000000000801041 <init_paging>:
int init_paging()
{
  801041:	f3 0f 1e fa          	endbr64 
  801045:	55                   	push   rbp
  801046:	48 89 e5             	mov    rbp,rsp
                    "mov %%rax,%%cr0":"=m"(page_index));
    #else
    //设置PML4
//    set_page_item(pml4,PDPT_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);
    //设置第一项pdpte，也就是内核空间
    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
  801049:	48 8b 05 30 8e 00 00 	mov    rax,QWORD PTR [rip+0x8e30]        # 809e80 <pdpt>
  801050:	ba 02 00 00 00       	mov    edx,0x2
  801055:	be 00 00 00 00       	mov    esi,0x0
  80105a:	48 89 c7             	mov    rdi,rax
  80105d:	e8 c7 04 00 00       	call   801529 <set_1gb_pdpt>
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  801062:	90                   	nop
  801063:	5d                   	pop    rbp
  801064:	c3                   	ret    

0000000000801065 <set_high_mem_base>:
void set_high_mem_base(int base)
{
  801065:	f3 0f 1e fa          	endbr64 
  801069:	55                   	push   rbp
  80106a:	48 89 e5             	mov    rbp,rsp
  80106d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  801070:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801073:	89 05 17 8e 00 00    	mov    DWORD PTR [rip+0x8e17],eax        # 809e90 <high_mem_base>
}
  801079:	90                   	nop
  80107a:	5d                   	pop    rbp
  80107b:	c3                   	ret    

000000000080107c <set_mem_area>:
void set_mem_area(int base,int len,int type)
{
  80107c:	f3 0f 1e fa          	endbr64 
  801080:	55                   	push   rbp
  801081:	48 89 e5             	mov    rbp,rsp
  801084:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  801087:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  80108a:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    mmap_struct[mmap_t_i].base=base;
  80108d:	8b 05 9d f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff19d]        # 400230 <mmap_t_i>
  801093:	48 63 d0             	movsxd rdx,eax
  801096:	48 89 d0             	mov    rax,rdx
  801099:	48 01 c0             	add    rax,rax
  80109c:	48 01 d0             	add    rax,rdx
  80109f:	48 c1 e0 02          	shl    rax,0x2
  8010a3:	48 8d 90 40 01 40 00 	lea    rdx,[rax+0x400140]
  8010aa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010ad:	89 02                	mov    DWORD PTR [rdx],eax
    mmap_struct[mmap_t_i].len=len;
  8010af:	8b 05 7b f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff17b]        # 400230 <mmap_t_i>
  8010b5:	48 63 d0             	movsxd rdx,eax
  8010b8:	48 89 d0             	mov    rax,rdx
  8010bb:	48 01 c0             	add    rax,rax
  8010be:	48 01 d0             	add    rax,rdx
  8010c1:	48 c1 e0 02          	shl    rax,0x2
  8010c5:	48 8d 90 44 01 40 00 	lea    rdx,[rax+0x400144]
  8010cc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8010cf:	89 02                	mov    DWORD PTR [rdx],eax
    mmap_struct[mmap_t_i++].type=type;
  8010d1:	8b 05 59 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff159]        # 400230 <mmap_t_i>
  8010d7:	8d 50 01             	lea    edx,[rax+0x1]
  8010da:	89 15 50 f1 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff150],edx        # 400230 <mmap_t_i>
  8010e0:	48 63 d0             	movsxd rdx,eax
  8010e3:	48 89 d0             	mov    rax,rdx
  8010e6:	48 01 c0             	add    rax,rax
  8010e9:	48 01 d0             	add    rax,rdx
  8010ec:	48 c1 e0 02          	shl    rax,0x2
  8010f0:	48 8d 90 48 01 40 00 	lea    rdx,[rax+0x400148]
  8010f7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8010fa:	89 02                	mov    DWORD PTR [rdx],eax
}
  8010fc:	90                   	nop
  8010fd:	5d                   	pop    rbp
  8010fe:	c3                   	ret    

00000000008010ff <vmalloc>:
addr_t vmalloc()
{
  8010ff:	f3 0f 1e fa          	endbr64 
  801103:	55                   	push   rbp
  801104:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  801107:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80110e:	eb 76                	jmp    801186 <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  801110:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801117:	eb 63                	jmp    80117c <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  801119:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80111c:	48 98                	cdqe   
  80111e:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [rax*4+0x400120]
  801125:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801128:	be 01 00 00 00       	mov    esi,0x1
  80112d:	89 c1                	mov    ecx,eax
  80112f:	d3 e6                	shl    esi,cl
  801131:	89 f0                	mov    eax,esi
  801133:	21 d0                	and    eax,edx
  801135:	85 c0                	test   eax,eax
  801137:	75 3f                	jne    801178 <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  801139:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80113c:	48 98                	cdqe   
  80113e:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [rax*4+0x400120]
  801145:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801148:	be 01 00 00 00       	mov    esi,0x1
  80114d:	89 c1                	mov    ecx,eax
  80114f:	d3 e6                	shl    esi,cl
  801151:	89 f0                	mov    eax,esi
  801153:	09 c2                	or     edx,eax
  801155:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801158:	48 98                	cdqe   
  80115a:	89 14 85 20 01 40 00 	mov    DWORD PTR [rax*4+0x400120],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  801161:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801164:	c1 e0 05             	shl    eax,0x5
  801167:	89 c2                	mov    edx,eax
  801169:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80116c:	01 d0                	add    eax,edx
  80116e:	83 c0 20             	add    eax,0x20
  801171:	c1 e0 0c             	shl    eax,0xc
  801174:	48 98                	cdqe   
  801176:	eb 14                	jmp    80118c <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  801178:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80117c:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801180:	7e 97                	jle    801119 <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  801182:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801186:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  80118a:	7e 84                	jle    801110 <vmalloc+0x11>
            }
        }
    }
}
  80118c:	5d                   	pop    rbp
  80118d:	c3                   	ret    

000000000080118e <vmfree>:

int vmfree(addr_t ptr)
{
  80118e:	f3 0f 1e fa          	endbr64 
  801192:	55                   	push   rbp
  801193:	48 89 e5             	mov    rbp,rsp
  801196:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  80119a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80119e:	48 c1 e8 0c          	shr    rax,0xc
  8011a2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8011a5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011a8:	8d 50 1f             	lea    edx,[rax+0x1f]
  8011ab:	85 c0                	test   eax,eax
  8011ad:	0f 48 c2             	cmovs  eax,edx
  8011b0:	c1 f8 05             	sar    eax,0x5
  8011b3:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8011b6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011b9:	99                   	cdq    
  8011ba:	c1 ea 1b             	shr    edx,0x1b
  8011bd:	01 d0                	add    eax,edx
  8011bf:	83 e0 1f             	and    eax,0x1f
  8011c2:	29 d0                	sub    eax,edx
  8011c4:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  8011c7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8011ca:	48 98                	cdqe   
  8011cc:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [rax*4+0x400120]
  8011d3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8011d6:	be 01 00 00 00       	mov    esi,0x1
  8011db:	89 c1                	mov    ecx,eax
  8011dd:	d3 e6                	shl    esi,cl
  8011df:	89 f0                	mov    eax,esi
  8011e1:	f7 d0                	not    eax
  8011e3:	21 c2                	and    edx,eax
  8011e5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8011e8:	48 98                	cdqe   
  8011ea:	89 14 85 20 01 40 00 	mov    DWORD PTR [rax*4+0x400120],edx
}
  8011f1:	90                   	nop
  8011f2:	5d                   	pop    rbp
  8011f3:	c3                   	ret    

00000000008011f4 <page_err>:
void page_err(){
  8011f4:	f3 0f 1e fa          	endbr64 
  8011f8:	55                   	push   rbp
  8011f9:	48 89 e5             	mov    rbp,rsp
  8011fc:	48 83 ec 30          	sub    rsp,0x30
    asm("cli");
  801200:	fa                   	cli    
    //puts("page err");
    unsigned long err_code=0,l_addr=0;
  801201:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  801208:	00 
  801209:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  801210:	00 
    asm volatile("mov 4(%%ebp),%0":"=r"(err_code));
  801211:	67 48 8b 45 04       	mov    rax,QWORD PTR [ebp+0x4]
  801216:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  80121a:	0f 20 d0             	mov    rax,cr2
  80121d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int p=err_code&1;
  801221:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801225:	83 e0 01             	and    eax,0x1
  801228:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

    if(!p)
  80122b:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  80122f:	0f 85 e1 00 00 00    	jne    801316 <page_err+0x122>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        int *pdet=0,*pt=0;
  801235:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80123c:	00 
  80123d:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  801244:	00 
        asm volatile("mov %%cr3,%0":"=r"(pdet));
  801245:	0f 20 d8             	mov    rax,cr3
  801248:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        if(!(pdet[l_addr/PAGE_INDEX_SIZE]&PAGE_PRESENT))
  80124c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801250:	48 c1 e8 16          	shr    rax,0x16
  801254:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80125b:	00 
  80125c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801260:	48 01 d0             	add    rax,rdx
  801263:	8b 00                	mov    eax,DWORD PTR [rax]
  801265:	83 e0 01             	and    eax,0x1
  801268:	85 c0                	test   eax,eax
  80126a:	75 32                	jne    80129e <page_err+0xaa>
        {
            //PDE没分配
            pt=(int *)vmalloc();
  80126c:	b8 00 00 00 00       	mov    eax,0x0
  801271:	e8 89 fe ff ff       	call   8010ff <vmalloc>
  801276:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
            pdet[l_addr/PAGE_INDEX_SIZE]=(int)pt|PAGE_PRESENT|PAGE_FOR_ALL;
  80127a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80127e:	89 c2                	mov    edx,eax
  801280:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801284:	48 c1 e8 16          	shr    rax,0x16
  801288:	48 8d 0c 85 00 00 00 	lea    rcx,[rax*4+0x0]
  80128f:	00 
  801290:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801294:	48 01 c8             	add    rax,rcx
  801297:	83 ca 05             	or     edx,0x5
  80129a:	89 10                	mov    DWORD PTR [rax],edx
  80129c:	eb 24                	jmp    8012c2 <page_err+0xce>
        }else
            pt=pdet[l_addr/PAGE_INDEX_SIZE]&0xfffff000;
  80129e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8012a2:	48 c1 e8 16          	shr    rax,0x16
  8012a6:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8012ad:	00 
  8012ae:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8012b2:	48 01 d0             	add    rax,rdx
  8012b5:	8b 00                	mov    eax,DWORD PTR [rax]
  8012b7:	89 c0                	mov    eax,eax
  8012b9:	25 00 f0 ff ff       	and    eax,0xfffff000
  8012be:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        //分配PTE
        int ptei=l_addr%PAGE_INDEX_SIZE/PAGE_SIZE;
  8012c2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8012c6:	25 ff ff 3f 00       	and    eax,0x3fffff
  8012cb:	48 c1 e8 0c          	shr    rax,0xc
  8012cf:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
        pt[ptei]|=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL;
  8012d2:	b8 00 00 00 00       	mov    eax,0x0
  8012d7:	e8 7c 00 00 00       	call   801358 <req_a_page>
  8012dc:	89 c7                	mov    edi,eax
  8012de:	e8 e2 01 00 00       	call   8014c5 <get_phyaddr>
  8012e3:	83 c8 05             	or     eax,0x5
  8012e6:	89 c1                	mov    ecx,eax
  8012e8:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8012eb:	48 98                	cdqe   
  8012ed:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8012f4:	00 
  8012f5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8012f9:	48 01 d0             	add    rax,rdx
  8012fc:	8b 10                	mov    edx,DWORD PTR [rax]
  8012fe:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  801301:	48 98                	cdqe   
  801303:	48 8d 34 85 00 00 00 	lea    rsi,[rax*4+0x0]
  80130a:	00 
  80130b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80130f:	48 01 f0             	add    rax,rsi
  801312:	09 ca                	or     edx,ecx
  801314:	89 10                	mov    DWORD PTR [rax],edx
    }
    //杀死问题进程
    del_proc(cur_proc);*/
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  801316:	b8 00 00 00 00       	mov    eax,0x0
  80131b:	e8 f9 36 00 00       	call   804a19 <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n leave\r\n add $4,%esp \r\n iret");
  801320:	fb                   	sti    
  801321:	c9                   	leave  
  801322:	83 c4 04             	add    esp,0x4
  801325:	cf                   	iret   
}
  801326:	90                   	nop
  801327:	c9                   	leave  
  801328:	c3                   	ret    

0000000000801329 <init_memory>:
void init_memory()
{
  801329:	f3 0f 1e fa          	endbr64 
  80132d:	55                   	push   rbp
  80132e:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<8;i++){
  801331:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801338:	eb 14                	jmp    80134e <init_memory+0x25>
        page_map[i]=0xffffffff;
  80133a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80133d:	48 98                	cdqe   
  80133f:	c7 04 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],0xffffffff
  801346:	ff ff ff ff 
    for(int i=0;i<8;i++){
  80134a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80134e:	83 7d fc 07          	cmp    DWORD PTR [rbp-0x4],0x7
  801352:	7e e6                	jle    80133a <init_memory+0x11>
    剩下正常。
    asm volatile("mov ")
     */
    //page_index[768]=page_index[7];
    //page_index[7]=0;
}
  801354:	90                   	nop
  801355:	90                   	nop
  801356:	5d                   	pop    rbp
  801357:	c3                   	ret    

0000000000801358 <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  801358:	f3 0f 1e fa          	endbr64 
  80135c:	55                   	push   rbp
  80135d:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801360:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801367:	e9 8c 00 00 00       	jmp    8013f8 <req_a_page+0xa0>
        for(int j=0;j<32;j++){
  80136c:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801373:	eb 79                	jmp    8013ee <req_a_page+0x96>
            unsigned int bit=page_map[i]&(1<<j);
  801375:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801378:	48 98                	cdqe   
  80137a:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  801381:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801384:	be 01 00 00 00       	mov    esi,0x1
  801389:	89 c1                	mov    ecx,eax
  80138b:	d3 e6                	shl    esi,cl
  80138d:	89 f0                	mov    eax,esi
  80138f:	21 d0                	and    eax,edx
  801391:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  801394:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801397:	c1 e0 05             	shl    eax,0x5
  80139a:	89 c2                	mov    edx,eax
  80139c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80139f:	01 d0                	add    eax,edx
  8013a1:	c1 e0 0c             	shl    eax,0xc
  8013a4:	3d ff ff 0f 00       	cmp    eax,0xfffff
  8013a9:	7e 3f                	jle    8013ea <req_a_page+0x92>
  8013ab:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8013af:	75 39                	jne    8013ea <req_a_page+0x92>
            {
                page_map[i]=page_map[i]|(1<<j);
  8013b1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8013b4:	48 98                	cdqe   
  8013b6:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  8013bd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8013c0:	be 01 00 00 00       	mov    esi,0x1
  8013c5:	89 c1                	mov    ecx,eax
  8013c7:	d3 e6                	shl    esi,cl
  8013c9:	89 f0                	mov    eax,esi
  8013cb:	09 c2                	or     edx,eax
  8013cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8013d0:	48 98                	cdqe   
  8013d2:	89 14 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],edx
                return i*32+j;//num of page
  8013d9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8013dc:	c1 e0 05             	shl    eax,0x5
  8013df:	89 c2                	mov    edx,eax
  8013e1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8013e4:	01 d0                	add    eax,edx
  8013e6:	48 98                	cdqe   
  8013e8:	eb 18                	jmp    801402 <req_a_page+0xaa>
        for(int j=0;j<32;j++){
  8013ea:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8013ee:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8013f2:	7e 81                	jle    801375 <req_a_page+0x1d>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  8013f4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8013f8:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8013fc:	0f 8e 6a ff ff ff    	jle    80136c <req_a_page+0x14>

            }
        }
    }
}
  801402:	5d                   	pop    rbp
  801403:	c3                   	ret    

0000000000801404 <free_page>:

int free_page(char *paddr){
  801404:	f3 0f 1e fa          	endbr64 
  801408:	55                   	push   rbp
  801409:	48 89 e5             	mov    rbp,rsp
  80140c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  801410:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801414:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80141a:	85 c0                	test   eax,eax
  80141c:	0f 48 c2             	cmovs  eax,edx
  80141f:	c1 f8 0c             	sar    eax,0xc
  801422:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  801425:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801428:	8d 50 1f             	lea    edx,[rax+0x1f]
  80142b:	85 c0                	test   eax,eax
  80142d:	0f 48 c2             	cmovs  eax,edx
  801430:	c1 f8 05             	sar    eax,0x5
  801433:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  801436:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801439:	99                   	cdq    
  80143a:	c1 ea 1b             	shr    edx,0x1b
  80143d:	01 d0                	add    eax,edx
  80143f:	83 e0 1f             	and    eax,0x1f
  801442:	29 d0                	sub    eax,edx
  801444:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  801447:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80144a:	48 98                	cdqe   
  80144c:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  801453:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801456:	be 01 00 00 00       	mov    esi,0x1
  80145b:	89 c1                	mov    ecx,eax
  80145d:	d3 e6                	shl    esi,cl
  80145f:	89 f0                	mov    eax,esi
  801461:	f7 d0                	not    eax
  801463:	21 c2                	and    edx,eax
  801465:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801468:	48 98                	cdqe   
  80146a:	89 14 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],edx
}
  801471:	90                   	nop
  801472:	5d                   	pop    rbp
  801473:	c3                   	ret    

0000000000801474 <check_page>:
int check_page(int num){
  801474:	f3 0f 1e fa          	endbr64 
  801478:	55                   	push   rbp
  801479:	48 89 e5             	mov    rbp,rsp
  80147c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  80147f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801482:	8d 50 1f             	lea    edx,[rax+0x1f]
  801485:	85 c0                	test   eax,eax
  801487:	0f 48 c2             	cmovs  eax,edx
  80148a:	c1 f8 05             	sar    eax,0x5
  80148d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  801490:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801493:	99                   	cdq    
  801494:	c1 ea 1b             	shr    edx,0x1b
  801497:	01 d0                	add    eax,edx
  801499:	83 e0 1f             	and    eax,0x1f
  80149c:	29 d0                	sub    eax,edx
  80149e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  8014a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014a4:	48 98                	cdqe   
  8014a6:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  8014ad:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8014b0:	be 01 00 00 00       	mov    esi,0x1
  8014b5:	89 c1                	mov    ecx,eax
  8014b7:	d3 e6                	shl    esi,cl
  8014b9:	89 f0                	mov    eax,esi
  8014bb:	21 d0                	and    eax,edx
  8014bd:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  8014c0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  8014c3:	5d                   	pop    rbp
  8014c4:	c3                   	ret    

00000000008014c5 <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  8014c5:	f3 0f 1e fa          	endbr64 
  8014c9:	55                   	push   rbp
  8014ca:	48 89 e5             	mov    rbp,rsp
  8014cd:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  8014d0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014d3:	c1 e0 0c             	shl    eax,0xc
}
  8014d6:	5d                   	pop    rbp
  8014d7:	c3                   	ret    

00000000008014d8 <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  8014d8:	f3 0f 1e fa          	endbr64 
  8014dc:	55                   	push   rbp
  8014dd:	48 89 e5             	mov    rbp,rsp
  8014e0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8014e4:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  8014e7:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  8014ea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8014ee:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  8014f5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8014f9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8014fc:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8014ff:	89 c0                	mov    eax,eax
  801501:	25 00 f0 ff ff       	and    eax,0xfffff000
  801506:	48 09 c2             	or     rdx,rax
  801509:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80150d:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  801510:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801514:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801517:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80151a:	48 98                	cdqe   
  80151c:	48 09 c2             	or     rdx,rax
  80151f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801523:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801526:	90                   	nop
  801527:	5d                   	pop    rbp
  801528:	c3                   	ret    

0000000000801529 <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  801529:	f3 0f 1e fa          	endbr64 
  80152d:	55                   	push   rbp
  80152e:	48 89 e5             	mov    rbp,rsp
  801531:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801535:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  801538:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  80153b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80153f:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  801546:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80154a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80154d:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  801550:	0c 81                	or     al,0x81
  801552:	89 c0                	mov    eax,eax
  801554:	48 09 c2             	or     rdx,rax
  801557:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80155b:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  80155e:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801561:	25 00 00 00 c0       	and    eax,0xc0000000
  801566:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  801569:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80156d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801570:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801573:	48 09 c2             	or     rdx,rax
  801576:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80157a:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80157d:	90                   	nop
  80157e:	5d                   	pop    rbp
  80157f:	c3                   	ret    

0000000000801580 <set_2mb_pde>:
void set_2mb_pde(page_item* pde,int pa)
{
  801580:	f3 0f 1e fa          	endbr64 
  801584:	55                   	push   rbp
  801585:	48 89 e5             	mov    rbp,rsp
  801588:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80158c:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    *pde=0;
  80158f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801593:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT;
  80159a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80159e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8015a1:	48 0d 81 10 00 00    	or     rax,0x1081
  8015a7:	48 89 c2             	mov    rdx,rax
  8015aa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8015ae:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  8015b1:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8015b4:	25 00 00 c0 ff       	and    eax,0xffc00000
  8015b9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  8015bc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8015c0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8015c3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015c6:	48 09 c2             	or     rdx,rax
  8015c9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8015cd:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8015d0:	90                   	nop
  8015d1:	5d                   	pop    rbp
  8015d2:	c3                   	ret    

00000000008015d3 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  8015d3:	f3 0f 1e fa          	endbr64 
  8015d7:	55                   	push   rbp
  8015d8:	48 89 e5             	mov    rbp,rsp
  8015db:	48 83 ec 20          	sub    rsp,0x20
  8015df:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8015e3:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  8015e6:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  8015eb:	75 18                	jne    801605 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  8015ed:	b8 00 00 00 00       	mov    eax,0x0
  8015f2:	e8 61 fd ff ff       	call   801358 <req_a_page>
  8015f7:	89 c7                	mov    edi,eax
  8015f9:	e8 c7 fe ff ff       	call   8014c5 <get_phyaddr>
  8015fe:	48 98                	cdqe   
  801600:	e9 8e 00 00 00       	jmp    801693 <req_page_at+0xc0>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  801605:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801609:	89 c2                	mov    edx,eax
  80160b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80160e:	89 c6                	mov    esi,eax
  801610:	89 d7                	mov    edi,edx
  801612:	e8 3b 01 00 00       	call   801752 <is_pgs_ava>
  801617:	85 c0                	test   eax,eax
  801619:	75 09                	jne    801624 <req_page_at+0x51>
  80161b:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801622:	eb 6f                	jmp    801693 <req_page_at+0xc0>
    int pgni=base/4096;
  801624:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801628:	48 c1 e8 0c          	shr    rax,0xc
  80162c:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  80162f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801632:	8d 50 1f             	lea    edx,[rax+0x1f]
  801635:	85 c0                	test   eax,eax
  801637:	0f 48 c2             	cmovs  eax,edx
  80163a:	c1 f8 05             	sar    eax,0x5
  80163d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  801640:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801643:	99                   	cdq    
  801644:	c1 ea 1b             	shr    edx,0x1b
  801647:	01 d0                	add    eax,edx
  801649:	83 e0 1f             	and    eax,0x1f
  80164c:	29 d0                	sub    eax,edx
  80164e:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  801651:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801658:	eb 2c                	jmp    801686 <req_page_at+0xb3>
    {
        page_map[i]|=(1<<pgj);
  80165a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80165d:	48 98                	cdqe   
  80165f:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  801666:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801669:	be 01 00 00 00       	mov    esi,0x1
  80166e:	89 c1                	mov    ecx,eax
  801670:	d3 e6                	shl    esi,cl
  801672:	89 f0                	mov    eax,esi
  801674:	09 c2                	or     edx,eax
  801676:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801679:	48 98                	cdqe   
  80167b:	89 14 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],edx
    for(int i=0;i<pgn;i++)
  801682:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801686:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801689:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80168c:	7c cc                	jl     80165a <req_page_at+0x87>
    }
    return 0;
  80168e:	b8 00 00 00 00       	mov    eax,0x0

}
  801693:	c9                   	leave  
  801694:	c3                   	ret    

0000000000801695 <chk_vm>:
int chk_vm(int base, int pgn)
{
  801695:	f3 0f 1e fa          	endbr64 
  801699:	55                   	push   rbp
  80169a:	48 89 e5             	mov    rbp,rsp
  80169d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8016a0:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  8016a3:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8016aa:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  8016ab:	0f 20 d8             	mov    rax,cr3
  8016ae:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  8016b2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8016b5:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  8016bb:	85 c0                	test   eax,eax
  8016bd:	0f 48 c2             	cmovs  eax,edx
  8016c0:	c1 f8 16             	sar    eax,0x16
  8016c3:	48 98                	cdqe   
  8016c5:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8016cc:	00 
  8016cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8016d1:	48 01 d0             	add    rax,rdx
  8016d4:	8b 00                	mov    eax,DWORD PTR [rax]
  8016d6:	89 c0                	mov    eax,eax
  8016d8:	25 00 f0 ff ff       	and    eax,0xfffff000
  8016dd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  8016e1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8016e4:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  8016ea:	85 c0                	test   eax,eax
  8016ec:	0f 48 c2             	cmovs  eax,edx
  8016ef:	c1 f8 16             	sar    eax,0x16
  8016f2:	48 98                	cdqe   
  8016f4:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8016fb:	00 
  8016fc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801700:	48 01 d0             	add    rax,rdx
  801703:	8b 00                	mov    eax,DWORD PTR [rax]
  801705:	83 e0 01             	and    eax,0x1
  801708:	85 c0                	test   eax,eax
  80170a:	74 38                	je     801744 <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  80170c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80170f:	99                   	cdq    
  801710:	c1 ea 0a             	shr    edx,0xa
  801713:	01 d0                	add    eax,edx
  801715:	25 ff ff 3f 00       	and    eax,0x3fffff
  80171a:	29 d0                	sub    eax,edx
  80171c:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801722:	85 c0                	test   eax,eax
  801724:	0f 48 c2             	cmovs  eax,edx
  801727:	c1 f8 0c             	sar    eax,0xc
  80172a:	48 98                	cdqe   
  80172c:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801733:	00 
  801734:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801738:	48 01 d0             	add    rax,rdx
  80173b:	8b 00                	mov    eax,DWORD PTR [rax]
  80173d:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801740:	85 c0                	test   eax,eax
  801742:	75 07                	jne    80174b <chk_vm+0xb6>
    {
        return -1;
  801744:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801749:	eb 05                	jmp    801750 <chk_vm+0xbb>
    }
    return 0;
  80174b:	b8 00 00 00 00       	mov    eax,0x0
}
  801750:	5d                   	pop    rbp
  801751:	c3                   	ret    

0000000000801752 <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  801752:	f3 0f 1e fa          	endbr64 
  801756:	55                   	push   rbp
  801757:	48 89 e5             	mov    rbp,rsp
  80175a:	48 83 ec 18          	sub    rsp,0x18
  80175e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801761:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  801764:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801767:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80176d:	85 c0                	test   eax,eax
  80176f:	0f 48 c2             	cmovs  eax,edx
  801772:	c1 f8 0c             	sar    eax,0xc
  801775:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  801778:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80177f:	eb 1e                	jmp    80179f <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801781:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801784:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801787:	01 d0                	add    eax,edx
  801789:	89 c7                	mov    edi,eax
  80178b:	e8 e4 fc ff ff       	call   801474 <check_page>
  801790:	85 c0                	test   eax,eax
  801792:	74 07                	je     80179b <is_pgs_ava+0x49>
  801794:	b8 00 00 00 00       	mov    eax,0x0
  801799:	eb 11                	jmp    8017ac <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  80179b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80179f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017a2:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  8017a5:	7c da                	jl     801781 <is_pgs_ava+0x2f>
    }
    return 1;
  8017a7:	b8 01 00 00 00       	mov    eax,0x1

}
  8017ac:	c9                   	leave  
  8017ad:	c3                   	ret    

00000000008017ae <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  8017ae:	f3 0f 1e fa          	endbr64 
  8017b2:	55                   	push   rbp
  8017b3:	48 89 e5             	mov    rbp,rsp
  8017b6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8017ba:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  8017be:	c6 05 7b ea bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfea7b],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  8017c5:	c6 05 75 ea bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfea75],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  8017cc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8017d0:	48 89 05 71 ea bf ff 	mov    QWORD PTR [rip+0xffffffffffbfea71],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  8017d7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8017db:	48 89 05 6e ea bf ff 	mov    QWORD PTR [rip+0xffffffffffbfea6e],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  8017e2:	c7 05 74 ea bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfea74],0x1        # 400260 <vols+0x20>
  8017e9:	00 00 00 
    return 0;
  8017ec:	b8 00 00 00 00       	mov    eax,0x0
}
  8017f1:	5d                   	pop    rbp
  8017f2:	c3                   	ret    

00000000008017f3 <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  8017f3:	f3 0f 1e fa          	endbr64 
  8017f7:	55                   	push   rbp
  8017f8:	48 89 e5             	mov    rbp,rsp
  8017fb:	48 83 ec 20          	sub    rsp,0x20
  8017ff:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  801802:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801809:	eb 38                	jmp    801843 <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  80180b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80180e:	48 98                	cdqe   
  801810:	48 c1 e0 04          	shl    rax,0x4
  801814:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  80181a:	8b 00                	mov    eax,DWORD PTR [rax]
  80181c:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80181f:	75 1e                	jne    80183f <sys_mkfifo+0x4c>
  801821:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801824:	48 98                	cdqe   
  801826:	48 c1 e0 04          	shl    rax,0x4
  80182a:	48 05 68 1e 40 00    	add    rax,0x401e68
  801830:	8b 00                	mov    eax,DWORD PTR [rax]
  801832:	83 f8 01             	cmp    eax,0x1
  801835:	75 08                	jne    80183f <sys_mkfifo+0x4c>
            return i;
  801837:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80183a:	e9 a6 00 00 00       	jmp    8018e5 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  80183f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801843:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801847:	7e c2                	jle    80180b <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  801849:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801850:	e9 81 00 00 00       	jmp    8018d6 <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  801855:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801858:	48 98                	cdqe   
  80185a:	48 c1 e0 04          	shl    rax,0x4
  80185e:	48 05 68 1e 40 00    	add    rax,0x401e68
  801864:	8b 00                	mov    eax,DWORD PTR [rax]
  801866:	85 c0                	test   eax,eax
  801868:	75 68                	jne    8018d2 <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  80186a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80186d:	48 98                	cdqe   
  80186f:	48 c1 e0 04          	shl    rax,0x4
  801873:	48 05 68 1e 40 00    	add    rax,0x401e68
  801879:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  80187f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801882:	48 98                	cdqe   
  801884:	48 c1 e0 04          	shl    rax,0x4
  801888:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  80188f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801892:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801894:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801897:	48 98                	cdqe   
  801899:	48 c1 e0 04          	shl    rax,0x4
  80189d:	48 05 64 1e 40 00    	add    rax,0x401e64
  8018a3:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  8018a9:	b8 00 00 00 00       	mov    eax,0x0
  8018ae:	e8 a5 fa ff ff       	call   801358 <req_a_page>
  8018b3:	89 c7                	mov    edi,eax
  8018b5:	e8 0b fc ff ff       	call   8014c5 <get_phyaddr>
  8018ba:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8018bd:	48 63 d2             	movsxd rdx,edx
  8018c0:	48 c1 e2 04          	shl    rdx,0x4
  8018c4:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  8018cb:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  8018cd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8018d0:	eb 13                	jmp    8018e5 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  8018d2:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8018d6:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  8018da:	0f 8e 75 ff ff ff    	jle    801855 <sys_mkfifo+0x62>
        }
    }
    return -1;
  8018e0:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8018e5:	c9                   	leave  
  8018e6:	c3                   	ret    

00000000008018e7 <sys_rmfifo>:

int sys_rmfifo(int number)
{
  8018e7:	f3 0f 1e fa          	endbr64 
  8018eb:	55                   	push   rbp
  8018ec:	48 89 e5             	mov    rbp,rsp
  8018ef:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  8018f2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8018f9:	eb 4a                	jmp    801945 <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  8018fb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018fe:	48 98                	cdqe   
  801900:	48 c1 e0 04          	shl    rax,0x4
  801904:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  80190a:	8b 00                	mov    eax,DWORD PTR [rax]
  80190c:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80190f:	75 30                	jne    801941 <sys_rmfifo+0x5a>
  801911:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801914:	48 98                	cdqe   
  801916:	48 c1 e0 04          	shl    rax,0x4
  80191a:	48 05 68 1e 40 00    	add    rax,0x401e68
  801920:	8b 00                	mov    eax,DWORD PTR [rax]
  801922:	83 f8 01             	cmp    eax,0x1
  801925:	75 1a                	jne    801941 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801927:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80192a:	48 98                	cdqe   
  80192c:	48 c1 e0 04          	shl    rax,0x4
  801930:	48 05 68 1e 40 00    	add    rax,0x401e68
  801936:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  80193c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80193f:	eb 0f                	jmp    801950 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801941:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801945:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801949:	7e b0                	jle    8018fb <sys_rmfifo+0x14>
        }
    }
    return -1;
  80194b:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801950:	5d                   	pop    rbp
  801951:	c3                   	ret    

0000000000801952 <free_vol>:
int free_vol(int voli)
{
  801952:	f3 0f 1e fa          	endbr64 
  801956:	55                   	push   rbp
  801957:	48 89 e5             	mov    rbp,rsp
  80195a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  80195d:	c7 05 f9 e8 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe8f9],0x0        # 400260 <vols+0x20>
  801964:	00 00 00 
    return 0;
  801967:	b8 00 00 00 00       	mov    eax,0x0
}
  80196c:	5d                   	pop    rbp
  80196d:	c3                   	ret    

000000000080196e <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  80196e:	f3 0f 1e fa          	endbr64 
  801972:	55                   	push   rbp
  801973:	48 89 e5             	mov    rbp,rsp
  801976:	48 83 ec 20          	sub    rsp,0x20
  80197a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80197d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801980:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801984:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80198b:	e9 d8 00 00 00       	jmp    801a68 <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801990:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801993:	48 63 d0             	movsxd rdx,eax
  801996:	48 89 d0             	mov    rax,rdx
  801999:	48 c1 e0 02          	shl    rax,0x2
  80199d:	48 01 d0             	add    rax,rdx
  8019a0:	48 c1 e0 03          	shl    rax,0x3
  8019a4:	48 05 60 02 40 00    	add    rax,0x400260
  8019aa:	8b 00                	mov    eax,DWORD PTR [rax]
  8019ac:	85 c0                	test   eax,eax
  8019ae:	0f 85 b0 00 00 00    	jne    801a64 <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  8019b4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019b7:	48 63 d0             	movsxd rdx,eax
  8019ba:	48 89 d0             	mov    rax,rdx
  8019bd:	48 c1 e0 02          	shl    rax,0x2
  8019c1:	48 01 d0             	add    rax,rdx
  8019c4:	48 c1 e0 03          	shl    rax,0x3
  8019c8:	48 05 60 02 40 00    	add    rax,0x400260
  8019ce:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  8019d4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8019d7:	48 63 d0             	movsxd rdx,eax
  8019da:	48 89 d0             	mov    rax,rdx
  8019dd:	48 01 c0             	add    rax,rax
  8019e0:	48 01 d0             	add    rax,rdx
  8019e3:	48 c1 e0 03          	shl    rax,0x3
  8019e7:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  8019ee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019f1:	48 63 d0             	movsxd rdx,eax
  8019f4:	48 89 d0             	mov    rax,rdx
  8019f7:	48 c1 e0 02          	shl    rax,0x2
  8019fb:	48 01 d0             	add    rax,rdx
  8019fe:	48 c1 e0 03          	shl    rax,0x3
  801a02:	48 05 58 02 40 00    	add    rax,0x400258
  801a08:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801a0b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a0e:	89 c7                	mov    edi,eax
  801a10:	e8 0b 1b 00 00       	call   803520 <get_drv>
  801a15:	48 89 c2             	mov    rdx,rax
  801a18:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a1b:	48 63 c8             	movsxd rcx,eax
  801a1e:	48 89 c8             	mov    rax,rcx
  801a21:	48 c1 e0 02          	shl    rax,0x2
  801a25:	48 01 c8             	add    rax,rcx
  801a28:	48 c1 e0 03          	shl    rax,0x3
  801a2c:	48 05 48 02 40 00    	add    rax,0x400248
  801a32:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801a35:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a38:	48 63 d0             	movsxd rdx,eax
  801a3b:	48 89 d0             	mov    rax,rdx
  801a3e:	48 c1 e0 02          	shl    rax,0x2
  801a42:	48 01 d0             	add    rax,rdx
  801a45:	48 c1 e0 03          	shl    rax,0x3
  801a49:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801a50:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801a54:	48 89 c6             	mov    rsi,rax
  801a57:	48 89 d7             	mov    rdi,rdx
  801a5a:	e8 78 7b 00 00       	call   8095d7 <strcpy>
            return i;
  801a5f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a62:	eb 13                	jmp    801a77 <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801a64:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801a68:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801a6c:	0f 8e 1e ff ff ff    	jle    801990 <reg_vol+0x22>
        }
    }
    return -1;
  801a72:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801a77:	c9                   	leave  
  801a78:	c3                   	ret    

0000000000801a79 <sys_open>:
int sys_open(char *path, int mode)
{
  801a79:	f3 0f 1e fa          	endbr64 
  801a7d:	55                   	push   rbp
  801a7e:	48 89 e5             	mov    rbp,rsp
  801a81:	53                   	push   rbx
  801a82:	48 81 ec 28 02 00 00 	sub    rsp,0x228
  801a89:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
  801a90:	89 b5 d4 fd ff ff    	mov    DWORD PTR [rbp-0x22c],esi
    {

    }
    //根据文件路径找到相应的卷
    char volname[26];
    int i=0,rec=0;
  801a96:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801a9d:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
    for(;path[i]!='/'&&i<26;i++)
  801aa4:	eb 20                	jmp    801ac6 <sys_open+0x4d>
        volname[i]=path[i];
  801aa6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801aa9:	48 63 d0             	movsxd rdx,eax
  801aac:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801ab3:	48 01 d0             	add    rax,rdx
  801ab6:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  801ab9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801abc:	48 98                	cdqe   
  801abe:	88 54 05 c0          	mov    BYTE PTR [rbp+rax*1-0x40],dl
    for(;path[i]!='/'&&i<26;i++)
  801ac2:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801ac6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ac9:	48 63 d0             	movsxd rdx,eax
  801acc:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801ad3:	48 01 d0             	add    rax,rdx
  801ad6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801ad9:	3c 2f                	cmp    al,0x2f
  801adb:	74 06                	je     801ae3 <sys_open+0x6a>
  801add:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801ae1:	7e c3                	jle    801aa6 <sys_open+0x2d>
    volname[i]='\0';
  801ae3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ae6:	48 98                	cdqe   
  801ae8:	c6 44 05 c0 00       	mov    BYTE PTR [rbp+rax*1-0x40],0x0
    if(!path[i+1])
  801aed:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801af0:	48 98                	cdqe   
  801af2:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801af6:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801afd:	48 01 d0             	add    rax,rdx
  801b00:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801b03:	84 c0                	test   al,al
  801b05:	75 0a                	jne    801b11 <sys_open+0x98>
        return -2;//是根目录
  801b07:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  801b0c:	e9 2b 04 00 00       	jmp    801f3c <sys_open+0x4c3>
    rec=i;
  801b11:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b14:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(i=0;i<MAX_VOLUMES;i++)
  801b17:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801b1e:	eb 52                	jmp    801b72 <sys_open+0xf9>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801b20:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b23:	48 63 d0             	movsxd rdx,eax
  801b26:	48 89 d0             	mov    rax,rdx
  801b29:	48 c1 e0 02          	shl    rax,0x2
  801b2d:	48 01 d0             	add    rax,rdx
  801b30:	48 c1 e0 03          	shl    rax,0x3
  801b34:	48 05 60 02 40 00    	add    rax,0x400260
  801b3a:	8b 00                	mov    eax,DWORD PTR [rax]
  801b3c:	85 c0                	test   eax,eax
  801b3e:	74 2e                	je     801b6e <sys_open+0xf5>
        (strcmp(vols[i].name,volname)==0))
  801b40:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b43:	48 63 d0             	movsxd rdx,eax
  801b46:	48 89 d0             	mov    rax,rdx
  801b49:	48 c1 e0 02          	shl    rax,0x2
  801b4d:	48 01 d0             	add    rax,rdx
  801b50:	48 c1 e0 03          	shl    rax,0x3
  801b54:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801b5b:	48 8d 45 c0          	lea    rax,[rbp-0x40]
  801b5f:	48 89 c6             	mov    rsi,rax
  801b62:	48 89 d7             	mov    rdi,rdx
  801b65:	e8 0d 7c 00 00       	call   809777 <strcmp>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801b6a:	85 c0                	test   eax,eax
  801b6c:	74 0c                	je     801b7a <sys_open+0x101>
    for(i=0;i<MAX_VOLUMES;i++)
  801b6e:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801b72:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801b76:	7e a8                	jle    801b20 <sys_open+0xa7>
  801b78:	eb 01                	jmp    801b7b <sys_open+0x102>
            break;
  801b7a:	90                   	nop
    if(i==MAX_VOLUMES)return -1;
  801b7b:	83 7d ec 1a          	cmp    DWORD PTR [rbp-0x14],0x1a
  801b7f:	75 0a                	jne    801b8b <sys_open+0x112>
  801b81:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801b86:	e9 b1 03 00 00       	jmp    801f3c <sys_open+0x4c3>
    driver_args arg={
  801b8b:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  801b92:	b8 00 00 00 00       	mov    eax,0x0
  801b97:	b9 17 00 00 00       	mov    ecx,0x17
  801b9c:	48 89 d7             	mov    rdi,rdx
  801b9f:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  801ba2:	48 89 fa             	mov    rdx,rdi
  801ba5:	89 02                	mov    DWORD PTR [rdx],eax
  801ba7:	48 83 c2 04          	add    rdx,0x4
            .path=path+rec+1
  801bab:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801bae:	48 98                	cdqe   
  801bb0:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801bb4:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801bbb:	48 01 d0             	add    rax,rdx
    driver_args arg={
  801bbe:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    vfs_dir_entry dir;
    vfs_dir_entry res;
    int voln=i;
  801bc5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801bc8:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    if(vols[i].fs->find(path+rec+1,dir,&res)==-1)//找不到文件 ((driver*)vols[i].fs_drv)->find(&arg)==-1
  801bcb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801bce:	48 63 d0             	movsxd rdx,eax
  801bd1:	48 89 d0             	mov    rax,rdx
  801bd4:	48 c1 e0 02          	shl    rax,0x2
  801bd8:	48 01 d0             	add    rax,rdx
  801bdb:	48 c1 e0 03          	shl    rax,0x3
  801bdf:	48 05 58 02 40 00    	add    rax,0x400258
  801be5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801be8:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  801bec:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801bef:	48 98                	cdqe   
  801bf1:	48 8d 48 01          	lea    rcx,[rax+0x1]
  801bf5:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801bfc:	48 01 c1             	add    rcx,rax
  801bff:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
  801c06:	ff b5 f8 fe ff ff    	push   QWORD PTR [rbp-0x108]
  801c0c:	ff b5 f0 fe ff ff    	push   QWORD PTR [rbp-0x110]
  801c12:	ff b5 e8 fe ff ff    	push   QWORD PTR [rbp-0x118]
  801c18:	ff b5 e0 fe ff ff    	push   QWORD PTR [rbp-0x120]
  801c1e:	ff b5 d8 fe ff ff    	push   QWORD PTR [rbp-0x128]
  801c24:	ff b5 d0 fe ff ff    	push   QWORD PTR [rbp-0x130]
  801c2a:	ff b5 c8 fe ff ff    	push   QWORD PTR [rbp-0x138]
  801c30:	ff b5 c0 fe ff ff    	push   QWORD PTR [rbp-0x140]
  801c36:	ff b5 b8 fe ff ff    	push   QWORD PTR [rbp-0x148]
  801c3c:	ff b5 b0 fe ff ff    	push   QWORD PTR [rbp-0x150]
  801c42:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
  801c48:	ff b5 a0 fe ff ff    	push   QWORD PTR [rbp-0x160]
  801c4e:	48 89 c6             	mov    rsi,rax
  801c51:	48 89 cf             	mov    rdi,rcx
  801c54:	ff d2                	call   rdx
  801c56:	48 83 c4 60          	add    rsp,0x60
  801c5a:	83 f8 ff             	cmp    eax,0xffffffff
  801c5d:	75 49                	jne    801ca8 <sys_open+0x22f>
    {
        if(mode&FILE_MODE_WRITE) {
  801c5f:	8b 85 d4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x22c]
  801c65:	83 e0 02             	and    eax,0x2
  801c68:	85 c0                	test   eax,eax
  801c6a:	74 32                	je     801c9e <sys_open+0x225>
            return ((driver *) vols[i].fs_drv)->touch(&arg);//这里之后要改
  801c6c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c6f:	48 63 d0             	movsxd rdx,eax
  801c72:	48 89 d0             	mov    rax,rdx
  801c75:	48 c1 e0 02          	shl    rax,0x2
  801c79:	48 01 d0             	add    rax,rdx
  801c7c:	48 c1 e0 03          	shl    rax,0x3
  801c80:	48 05 50 02 40 00    	add    rax,0x400250
  801c86:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801c89:	48 8b 50 4c          	mov    rdx,QWORD PTR [rax+0x4c]
  801c8d:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  801c94:	48 89 c7             	mov    rdi,rax
  801c97:	ff d2                	call   rdx
  801c99:	e9 9e 02 00 00       	jmp    801f3c <sys_open+0x4c3>
        }else
            return -1;
  801c9e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801ca3:	e9 94 02 00 00       	jmp    801f3c <sys_open+0x4c3>
    }
    vfs_dir_entry entry=res;//=arg.entry;
  801ca8:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
  801caf:	48 8b 95 48 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b8]
  801cb6:	48 89 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rax
  801cbd:	48 89 95 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdx
  801cc4:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
  801ccb:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
  801cd2:	48 89 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],rax
  801cd9:	48 89 95 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],rdx
  801ce0:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
  801ce7:	48 8b 95 68 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x198]
  801cee:	48 89 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],rax
  801cf5:	48 89 95 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],rdx
  801cfc:	48 8b 85 70 fe ff ff 	mov    rax,QWORD PTR [rbp-0x190]
  801d03:	48 8b 95 78 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x188]
  801d0a:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
  801d11:	48 89 95 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdx
  801d18:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
  801d1f:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
  801d26:	48 89 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rax
  801d2d:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
  801d34:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
  801d3b:	48 8b 95 98 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x168]
  801d42:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
  801d49:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
    int j=-1;
  801d50:	c7 45 e8 ff ff ff ff 	mov    DWORD PTR [rbp-0x18],0xffffffff
    for(i=0;i<MAX_OPEN_FILES;i++)
  801d57:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801d5e:	eb 5c                	jmp    801dbc <sys_open+0x343>
    {
        if(opened[i].voln==voln&&opened[i].id==entry.id)
  801d60:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d63:	48 63 d0             	movsxd rdx,eax
  801d66:	48 89 d0             	mov    rax,rdx
  801d69:	48 01 c0             	add    rax,rax
  801d6c:	48 01 d0             	add    rax,rdx
  801d6f:	48 c1 e0 05          	shl    rax,0x5
  801d73:	48 05 68 06 40 00    	add    rax,0x400668
  801d79:	8b 00                	mov    eax,DWORD PTR [rax]
  801d7b:	39 45 e0             	cmp    DWORD PTR [rbp-0x20],eax
  801d7e:	75 38                	jne    801db8 <sys_open+0x33f>
  801d80:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d83:	48 63 d0             	movsxd rdx,eax
  801d86:	48 89 d0             	mov    rax,rdx
  801d89:	48 01 c0             	add    rax,rax
  801d8c:	48 01 d0             	add    rax,rdx
  801d8f:	48 c1 e0 05          	shl    rax,0x5
  801d93:	48 05 74 06 40 00    	add    rax,0x400674
  801d99:	8b 10                	mov    edx,DWORD PTR [rax]
  801d9b:	8b 85 f4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x20c]
  801da1:	39 c2                	cmp    edx,eax
  801da3:	75 13                	jne    801db8 <sys_open+0x33f>
        {
            if(mode==FILE_MODE_WRITE)
  801da5:	83 bd d4 fd ff ff 02 	cmp    DWORD PTR [rbp-0x22c],0x2
  801dac:	75 0a                	jne    801db8 <sys_open+0x33f>
            {
                return -1;//读模式会重新给一个fno但是指向同一个文件
  801dae:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801db3:	e9 84 01 00 00       	jmp    801f3c <sys_open+0x4c3>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801db8:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801dbc:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801dc0:	7e 9e                	jle    801d60 <sys_open+0x2e7>
            }
        }
    }
    for(i=0;i<MAX_OPEN_FILES;i++)
  801dc2:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801dc9:	eb 2b                	jmp    801df6 <sys_open+0x37d>
    {
        if(!opened[i].mode) {
  801dcb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801dce:	48 63 d0             	movsxd rdx,eax
  801dd1:	48 89 d0             	mov    rax,rdx
  801dd4:	48 01 c0             	add    rax,rax
  801dd7:	48 01 d0             	add    rax,rdx
  801dda:	48 c1 e0 05          	shl    rax,0x5
  801dde:	48 05 64 06 40 00    	add    rax,0x400664
  801de4:	8b 00                	mov    eax,DWORD PTR [rax]
  801de6:	85 c0                	test   eax,eax
  801de8:	75 08                	jne    801df2 <sys_open+0x379>
            j = i;
  801dea:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ded:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            break;
  801df0:	eb 0a                	jmp    801dfc <sys_open+0x383>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801df2:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801df6:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801dfa:	7e cf                	jle    801dcb <sys_open+0x352>
        }
    }
    if(j==-1)return -1;
  801dfc:	83 7d e8 ff          	cmp    DWORD PTR [rbp-0x18],0xffffffff
  801e00:	75 0a                	jne    801e0c <sys_open+0x393>
  801e02:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801e07:	e9 30 01 00 00       	jmp    801f3c <sys_open+0x4c3>
    opened[j]=entry;
  801e0c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801e0f:	48 63 d0             	movsxd rdx,eax
  801e12:	48 89 d0             	mov    rax,rdx
  801e15:	48 01 c0             	add    rax,rax
  801e18:	48 01 d0             	add    rax,rdx
  801e1b:	48 c1 e0 05          	shl    rax,0x5
  801e1f:	48 05 60 06 40 00    	add    rax,0x400660
  801e25:	48 8b 8d e0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x220]
  801e2c:	48 8b 9d e8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x218]
  801e33:	48 89 08             	mov    QWORD PTR [rax],rcx
  801e36:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
  801e3a:	48 8b 8d f0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x210]
  801e41:	48 8b 9d f8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x208]
  801e48:	48 89 48 10          	mov    QWORD PTR [rax+0x10],rcx
  801e4c:	48 89 58 18          	mov    QWORD PTR [rax+0x18],rbx
  801e50:	48 8b 8d 00 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x200]
  801e57:	48 8b 9d 08 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1f8]
  801e5e:	48 89 48 20          	mov    QWORD PTR [rax+0x20],rcx
  801e62:	48 89 58 28          	mov    QWORD PTR [rax+0x28],rbx
  801e66:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
  801e6d:	48 8b 9d 18 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1e8]
  801e74:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
  801e78:	48 89 58 38          	mov    QWORD PTR [rax+0x38],rbx
  801e7c:	48 8b 8d 20 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e0]
  801e83:	48 8b 9d 28 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1d8]
  801e8a:	48 89 48 40          	mov    QWORD PTR [rax+0x40],rcx
  801e8e:	48 89 58 48          	mov    QWORD PTR [rax+0x48],rbx
  801e92:	48 8b 8d 30 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1d0]
  801e99:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
  801ea0:	48 89 48 50          	mov    QWORD PTR [rax+0x50],rcx
  801ea4:	48 89 58 58          	mov    QWORD PTR [rax+0x58],rbx
    opened[j].fno=i;
  801ea8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801eab:	48 63 d0             	movsxd rdx,eax
  801eae:	48 89 d0             	mov    rax,rdx
  801eb1:	48 01 c0             	add    rax,rax
  801eb4:	48 01 d0             	add    rax,rdx
  801eb7:	48 c1 e0 05          	shl    rax,0x5
  801ebb:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  801ec2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ec5:	89 02                	mov    DWORD PTR [rdx],eax
    opened[j].link_c++;
  801ec7:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801eca:	48 63 d0             	movsxd rdx,eax
  801ecd:	48 89 d0             	mov    rax,rdx
  801ed0:	48 01 c0             	add    rax,rax
  801ed3:	48 01 d0             	add    rax,rdx
  801ed6:	48 c1 e0 05          	shl    rax,0x5
  801eda:	48 05 6c 06 40 00    	add    rax,0x40066c
  801ee0:	8b 00                	mov    eax,DWORD PTR [rax]
  801ee2:	8d 48 01             	lea    ecx,[rax+0x1]
  801ee5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801ee8:	48 63 d0             	movsxd rdx,eax
  801eeb:	48 89 d0             	mov    rax,rdx
  801eee:	48 01 c0             	add    rax,rax
  801ef1:	48 01 d0             	add    rax,rdx
  801ef4:	48 c1 e0 05          	shl    rax,0x5
  801ef8:	48 05 6c 06 40 00    	add    rax,0x40066c
  801efe:	89 08                	mov    DWORD PTR [rax],ecx
    add_proc_openf(&opened[j]);
  801f00:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801f03:	48 63 d0             	movsxd rdx,eax
  801f06:	48 89 d0             	mov    rax,rdx
  801f09:	48 01 c0             	add    rax,rax
  801f0c:	48 01 d0             	add    rax,rdx
  801f0f:	48 c1 e0 05          	shl    rax,0x5
  801f13:	48 05 60 06 40 00    	add    rax,0x400660
  801f19:	48 89 c7             	mov    rdi,rax
  801f1c:	e8 17 26 00 00       	call   804538 <add_proc_openf>
    return opened[j].fno;
  801f21:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801f24:	48 63 d0             	movsxd rdx,eax
  801f27:	48 89 d0             	mov    rax,rdx
  801f2a:	48 01 c0             	add    rax,rax
  801f2d:	48 01 d0             	add    rax,rdx
  801f30:	48 c1 e0 05          	shl    rax,0x5
  801f34:	48 05 60 06 40 00    	add    rax,0x400660
  801f3a:	8b 00                	mov    eax,DWORD PTR [rax]
}
  801f3c:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  801f40:	c9                   	leave  
  801f41:	c3                   	ret    

0000000000801f42 <sys_close>:
int sys_close(int fno)
{
  801f42:	f3 0f 1e fa          	endbr64 
  801f46:	55                   	push   rbp
  801f47:	48 89 e5             	mov    rbp,rsp
  801f4a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801f4d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801f54:	eb 64                	jmp    801fba <sys_close+0x78>
    {
        if(opened[i].fno==fno)
  801f56:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801f59:	48 63 d0             	movsxd rdx,eax
  801f5c:	48 89 d0             	mov    rax,rdx
  801f5f:	48 01 c0             	add    rax,rax
  801f62:	48 01 d0             	add    rax,rdx
  801f65:	48 c1 e0 05          	shl    rax,0x5
  801f69:	48 05 60 06 40 00    	add    rax,0x400660
  801f6f:	8b 00                	mov    eax,DWORD PTR [rax]
  801f71:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801f74:	75 40                	jne    801fb6 <sys_close+0x74>
        {
            opened[i].link_c--;
  801f76:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801f79:	48 63 d0             	movsxd rdx,eax
  801f7c:	48 89 d0             	mov    rax,rdx
  801f7f:	48 01 c0             	add    rax,rax
  801f82:	48 01 d0             	add    rax,rdx
  801f85:	48 c1 e0 05          	shl    rax,0x5
  801f89:	48 05 6c 06 40 00    	add    rax,0x40066c
  801f8f:	8b 00                	mov    eax,DWORD PTR [rax]
  801f91:	8d 48 ff             	lea    ecx,[rax-0x1]
  801f94:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801f97:	48 63 d0             	movsxd rdx,eax
  801f9a:	48 89 d0             	mov    rax,rdx
  801f9d:	48 01 c0             	add    rax,rax
  801fa0:	48 01 d0             	add    rax,rdx
  801fa3:	48 c1 e0 05          	shl    rax,0x5
  801fa7:	48 05 6c 06 40 00    	add    rax,0x40066c
  801fad:	89 08                	mov    DWORD PTR [rax],ecx
            return 0;
  801faf:	b8 00 00 00 00       	mov    eax,0x0
  801fb4:	eb 0f                	jmp    801fc5 <sys_close+0x83>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801fb6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801fba:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801fbe:	7e 96                	jle    801f56 <sys_close+0x14>
        }
    }
    return -1;
  801fc0:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801fc5:	5d                   	pop    rbp
  801fc6:	c3                   	ret    

0000000000801fc7 <sys_write>:
int sys_write(int fno, char *src, int len)
{
  801fc7:	f3 0f 1e fa          	endbr64 
  801fcb:	55                   	push   rbp
  801fcc:	48 89 e5             	mov    rbp,rsp
  801fcf:	48 83 ec 20          	sub    rsp,0x20
  801fd3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801fd6:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  801fda:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  801fdd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801fe0:	89 c7                	mov    edi,eax
  801fe2:	e8 7d 01 00 00       	call   802164 <get_vfs_entry>
  801fe7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  801feb:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  801ff0:	75 07                	jne    801ff9 <sys_write+0x32>
  801ff2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801ff7:	eb 5d                	jmp    802056 <sys_write+0x8f>
    if(f->type==FTYPE_REG)
  801ff9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801ffd:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802000:	85 c0                	test   eax,eax
  802002:	75 18                	jne    80201c <sys_write+0x55>
    {
        return vfs_write_file(f,src,len);
  802004:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802007:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  80200b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80200f:	48 89 ce             	mov    rsi,rcx
  802012:	48 89 c7             	mov    rdi,rax
  802015:	e8 67 03 00 00       	call   802381 <vfs_write_file>
  80201a:	eb 3a                	jmp    802056 <sys_write+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  80201c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802020:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802023:	83 f8 01             	cmp    eax,0x1
  802026:	75 29                	jne    802051 <sys_write+0x8a>
    {
        int block=get_according_bnr(f);
  802028:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80202c:	48 89 c7             	mov    rdi,rax
  80202f:	e8 5b 04 00 00       	call   80248f <get_according_bnr>
  802034:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return write_block(f->dev,block,src,len);
  802037:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80203b:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  80203e:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  802041:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802045:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  802048:	89 c7                	mov    edi,eax
  80204a:	e8 24 08 00 00       	call   802873 <write_block>
  80204f:	eb 05                	jmp    802056 <sys_write+0x8f>
    }
    return -1;
  802051:	b8 ff ff ff ff       	mov    eax,0xffffffff
            .src_addr=src,
            .len=len,
            .pos=pos
    };
    return ((driver*)vols[f->voln].fs_drv)->write(&args); */
}
  802056:	c9                   	leave  
  802057:	c3                   	ret    

0000000000802058 <sys_read>:
int sys_read(int fno, char *dist,  int len)
{
  802058:	f3 0f 1e fa          	endbr64 
  80205c:	55                   	push   rbp
  80205d:	48 89 e5             	mov    rbp,rsp
  802060:	48 83 ec 20          	sub    rsp,0x20
  802064:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802067:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80206b:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  80206e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802071:	89 c7                	mov    edi,eax
  802073:	e8 ec 00 00 00       	call   802164 <get_vfs_entry>
  802078:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  80207c:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802081:	75 07                	jne    80208a <sys_read+0x32>
  802083:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802088:	eb 5d                	jmp    8020e7 <sys_read+0x8f>
    if(f->type==FTYPE_REG)
  80208a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80208e:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802091:	85 c0                	test   eax,eax
  802093:	75 18                	jne    8020ad <sys_read+0x55>
    {
        return vfs_read_file(f,dist,len);
  802095:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802098:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  80209c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020a0:	48 89 ce             	mov    rsi,rcx
  8020a3:	48 89 c7             	mov    rdi,rax
  8020a6:	e8 37 02 00 00       	call   8022e2 <vfs_read_file>
  8020ab:	eb 3a                	jmp    8020e7 <sys_read+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  8020ad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020b1:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8020b4:	83 f8 01             	cmp    eax,0x1
  8020b7:	75 29                	jne    8020e2 <sys_read+0x8a>
    {
        int block=get_according_bnr(f);
  8020b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020bd:	48 89 c7             	mov    rdi,rax
  8020c0:	e8 ca 03 00 00       	call   80248f <get_according_bnr>
  8020c5:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return read_block(f->dev,block,dist,len);
  8020c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020cc:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8020cf:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  8020d2:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8020d6:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  8020d9:	89 c7                	mov    edi,eax
  8020db:	e8 10 08 00 00       	call   8028f0 <read_block>
  8020e0:	eb 05                	jmp    8020e7 <sys_read+0x8f>
    }
    return -1;
  8020e2:	b8 ff ff ff ff       	mov    eax,0xffffffff
    //         .len=len,
    //         .pos=pos,
    //         .entry=*f
    // };
    // return ((driver*)vols[f->voln].fs_drv)->read(&args);
}
  8020e7:	c9                   	leave  
  8020e8:	c3                   	ret    

00000000008020e9 <sys_seek>:
int sys_seek(int fno, int offset, int origin)
{
  8020e9:	f3 0f 1e fa          	endbr64 
  8020ed:	55                   	push   rbp
  8020ee:	48 89 e5             	mov    rbp,rsp
  8020f1:	48 83 ec 20          	sub    rsp,0x20
  8020f5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8020f8:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8020fb:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  8020fe:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802101:	89 c7                	mov    edi,eax
  802103:	e8 5c 00 00 00       	call   802164 <get_vfs_entry>
  802108:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  80210c:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802111:	75 07                	jne    80211a <sys_seek+0x31>
  802113:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802118:	eb 14                	jmp    80212e <sys_seek+0x45>
    f->ptr=offset+origin;
  80211a:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80211d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802120:	01 c2                	add    edx,eax
  802122:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802126:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
    return 0;
  802129:	b8 00 00 00 00       	mov    eax,0x0
}
  80212e:	c9                   	leave  
  80212f:	c3                   	ret    

0000000000802130 <sys_tell>:
int sys_tell(int fno)
{
  802130:	f3 0f 1e fa          	endbr64 
  802134:	55                   	push   rbp
  802135:	48 89 e5             	mov    rbp,rsp
  802138:	48 83 ec 20          	sub    rsp,0x20
  80213c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    vfs_dir_entry *f= get_vfs_entry(fno);
  80213f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802142:	89 c7                	mov    edi,eax
  802144:	e8 1b 00 00 00       	call   802164 <get_vfs_entry>
  802149:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  80214d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802152:	75 07                	jne    80215b <sys_tell+0x2b>
  802154:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802159:	eb 07                	jmp    802162 <sys_tell+0x32>
    return f->ptr;
  80215b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80215f:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802162:	c9                   	leave  
  802163:	c3                   	ret    

0000000000802164 <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  802164:	f3 0f 1e fa          	endbr64 
  802168:	55                   	push   rbp
  802169:	48 89 e5             	mov    rbp,rsp
  80216c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  80216f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802176:	eb 3f                	jmp    8021b7 <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  802178:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80217b:	48 63 d0             	movsxd rdx,eax
  80217e:	48 89 d0             	mov    rax,rdx
  802181:	48 01 c0             	add    rax,rax
  802184:	48 01 d0             	add    rax,rdx
  802187:	48 c1 e0 05          	shl    rax,0x5
  80218b:	48 05 60 06 40 00    	add    rax,0x400660
  802191:	8b 00                	mov    eax,DWORD PTR [rax]
  802193:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802196:	75 1b                	jne    8021b3 <get_vfs_entry+0x4f>
        {
            return &opened[i];
  802198:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80219b:	48 63 d0             	movsxd rdx,eax
  80219e:	48 89 d0             	mov    rax,rdx
  8021a1:	48 01 c0             	add    rax,rax
  8021a4:	48 01 d0             	add    rax,rdx
  8021a7:	48 c1 e0 05          	shl    rax,0x5
  8021ab:	48 05 60 06 40 00    	add    rax,0x400660
  8021b1:	eb 0f                	jmp    8021c2 <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  8021b3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8021b7:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8021bb:	7e bb                	jle    802178 <get_vfs_entry+0x14>
        }
    }
    return NULL;
  8021bd:	b8 00 00 00 00       	mov    eax,0x0
}
  8021c2:	5d                   	pop    rbp
  8021c3:	c3                   	ret    

00000000008021c4 <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  8021c4:	f3 0f 1e fa          	endbr64 
  8021c8:	55                   	push   rbp
  8021c9:	48 89 e5             	mov    rbp,rsp
  8021cc:	48 83 ec 10          	sub    rsp,0x10
  8021d0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  8021d4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021d8:	48 89 c7             	mov    rdi,rax
  8021db:	e8 a0 04 00 00       	call   802680 <wait_on_buf>
    if(bh->b_count==0)return -1;
  8021e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021e4:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  8021e8:	84 c0                	test   al,al
  8021ea:	75 07                	jne    8021f3 <brelse+0x2f>
  8021ec:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8021f1:	eb 32                	jmp    802225 <brelse+0x61>
    bh->b_count--;
  8021f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021f7:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  8021fb:	8d 50 ff             	lea    edx,[rax-0x1]
  8021fe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802202:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  802205:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802209:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  80220d:	84 c0                	test   al,al
  80220f:	75 0f                	jne    802220 <brelse+0x5c>
        vmfree(bh->b_data);
  802211:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802215:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802218:	48 89 c7             	mov    rdi,rax
  80221b:	e8 6e ef ff ff       	call   80118e <vmfree>
    return 0;
  802220:	b8 00 00 00 00       	mov    eax,0x0
}
  802225:	c9                   	leave  
  802226:	c3                   	ret    

0000000000802227 <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  802227:	f3 0f 1e fa          	endbr64 
  80222b:	55                   	push   rbp
  80222c:	48 89 e5             	mov    rbp,rsp
  80222f:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  802236:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  80223c:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  802242:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  802248:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  80224e:	89 d6                	mov    esi,edx
  802250:	89 c7                	mov    edi,eax
  802252:	e8 78 02 00 00       	call   8024cf <get_buf>
  802257:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  80225b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802260:	75 09                	jne    80226b <bread+0x44>
  802262:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  802269:	eb 75                	jmp    8022e0 <bread+0xb9>
    if(!bh->b_uptodate)
  80226b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80226f:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  802273:	84 c0                	test   al,al
  802275:	75 65                	jne    8022dc <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  802277:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  80227d:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  802280:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  802287:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80228b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80228e:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  802294:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  80229b:	02 00 00 
        arg.lba=bh->b_blocknr;
  80229e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022a2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8022a6:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  8022ac:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  8022b3:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  8022b6:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  8022bd:	48 89 c7             	mov    rdi,rax
  8022c0:	e8 82 12 00 00       	call   803547 <make_request>
  8022c5:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  8022c8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8022cb:	89 c7                	mov    edi,eax
  8022cd:	e8 88 15 00 00       	call   80385a <wait_on_req>
        clear_req(reqi);
  8022d2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8022d5:	89 c7                	mov    edi,eax
  8022d7:	e8 ae 15 00 00       	call   80388a <clear_req>
    }
    return bh;
  8022dc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8022e0:	c9                   	leave  
  8022e1:	c3                   	ret    

00000000008022e2 <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  8022e2:	f3 0f 1e fa          	endbr64 
  8022e6:	55                   	push   rbp
  8022e7:	48 89 e5             	mov    rbp,rsp
  8022ea:	48 83 ec 40          	sub    rsp,0x40
  8022ee:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  8022f2:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  8022f6:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  8022f9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8022fd:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802300:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802303:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802307:	48 89 c7             	mov    rdi,rax
  80230a:	e8 80 01 00 00       	call   80248f <get_according_bnr>
  80230f:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  802312:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  802315:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802318:	89 d6                	mov    esi,edx
  80231a:	89 c7                	mov    edi,eax
  80231c:	e8 06 ff ff ff       	call   802227 <bread>
  802321:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802325:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802328:	ba 00 02 00 00       	mov    edx,0x200
  80232d:	39 d0                	cmp    eax,edx
  80232f:	0f 4f c2             	cmovg  eax,edx
  802332:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  802335:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  802338:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80233c:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80233f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802343:	48 89 ce             	mov    rsi,rcx
  802346:	48 89 c7             	mov    rdi,rax
  802349:	e8 8b 71 00 00       	call   8094d9 <memcpy>
        len-=BLOCK_SIZE;
  80234e:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  802355:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802359:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80235c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80235f:	01 c2                	add    edx,eax
  802361:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802365:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  802368:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80236c:	48 89 c7             	mov    rdi,rax
  80236f:	e8 50 fe ff ff       	call   8021c4 <brelse>
    }while(len>0);
  802374:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  802378:	7f 89                	jg     802303 <vfs_read_file+0x21>
    return 0;
  80237a:	b8 00 00 00 00       	mov    eax,0x0
}
  80237f:	c9                   	leave  
  802380:	c3                   	ret    

0000000000802381 <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  802381:	f3 0f 1e fa          	endbr64 
  802385:	55                   	push   rbp
  802386:	48 89 e5             	mov    rbp,rsp
  802389:	48 83 ec 40          	sub    rsp,0x40
  80238d:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802391:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  802395:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  802398:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80239c:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  80239f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  8023a2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8023a6:	48 89 c7             	mov    rdi,rax
  8023a9:	e8 e1 00 00 00       	call   80248f <get_according_bnr>
  8023ae:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  8023b1:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8023b4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8023b7:	89 d6                	mov    esi,edx
  8023b9:	89 c7                	mov    edi,eax
  8023bb:	e8 0f 01 00 00       	call   8024cf <get_buf>
  8023c0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8023c4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8023c7:	ba 00 02 00 00       	mov    edx,0x200
  8023cc:	39 d0                	cmp    eax,edx
  8023ce:	0f 4f c2             	cmovg  eax,edx
  8023d1:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  8023d4:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8023d7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8023db:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8023de:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  8023e2:	48 89 ce             	mov    rsi,rcx
  8023e5:	48 89 c7             	mov    rdi,rax
  8023e8:	e8 ec 70 00 00       	call   8094d9 <memcpy>
        len-=BLOCK_SIZE;
  8023ed:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  8023f4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8023f8:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8023fb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8023fe:	01 c2                	add    edx,eax
  802400:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802404:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  802407:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80240b:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  80240f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802413:	48 89 c7             	mov    rdi,rax
  802416:	e8 a9 fd ff ff       	call   8021c4 <brelse>
    }while(len>0);
  80241b:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  80241f:	7f 81                	jg     8023a2 <vfs_write_file+0x21>
    return 0;
  802421:	b8 00 00 00 00       	mov    eax,0x0
}
  802426:	c9                   	leave  
  802427:	c3                   	ret    

0000000000802428 <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  802428:	f3 0f 1e fa          	endbr64 
  80242c:	55                   	push   rbp
  80242d:	48 89 e5             	mov    rbp,rsp
  802430:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  802434:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  802437:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  80243a:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  80243e:	74 20                	je     802460 <vfs_seek_file+0x38>
  802440:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  802444:	7f 3f                	jg     802485 <vfs_seek_file+0x5d>
  802446:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  80244a:	74 08                	je     802454 <vfs_seek_file+0x2c>
  80244c:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  802450:	74 23                	je     802475 <vfs_seek_file+0x4d>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  802452:	eb 31                	jmp    802485 <vfs_seek_file+0x5d>
        f->ptr=offset;
  802454:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802458:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80245b:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  80245e:	eb 26                	jmp    802486 <vfs_seek_file+0x5e>
        f->ptr+=offset;
  802460:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802464:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802467:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80246a:	01 c2                	add    edx,eax
  80246c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802470:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802473:	eb 11                	jmp    802486 <vfs_seek_file+0x5e>
        f->ptr=f->size;
  802475:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802479:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  80247c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802480:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802483:	eb 01                	jmp    802486 <vfs_seek_file+0x5e>
        break;
  802485:	90                   	nop
    }
    return f->ptr;
  802486:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80248a:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  80248d:	5d                   	pop    rbp
  80248e:	c3                   	ret    

000000000080248f <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  80248f:	f3 0f 1e fa          	endbr64 
  802493:	55                   	push   rbp
  802494:	48 89 e5             	mov    rbp,rsp
  802497:	48 83 ec 10          	sub    rsp,0x10
  80249b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  80249f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024a3:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8024a6:	48 63 d0             	movsxd rdx,eax
  8024a9:	48 89 d0             	mov    rax,rdx
  8024ac:	48 c1 e0 02          	shl    rax,0x2
  8024b0:	48 01 d0             	add    rax,rdx
  8024b3:	48 c1 e0 03          	shl    rax,0x3
  8024b7:	48 05 58 02 40 00    	add    rax,0x400258
  8024bd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8024c0:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8024c4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8024c8:	48 89 c7             	mov    rdi,rax
  8024cb:	ff d2                	call   rdx

}
  8024cd:	c9                   	leave  
  8024ce:	c3                   	ret    

00000000008024cf <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  8024cf:	f3 0f 1e fa          	endbr64 
  8024d3:	55                   	push   rbp
  8024d4:	48 89 e5             	mov    rbp,rsp
  8024d7:	48 83 ec 20          	sub    rsp,0x20
  8024db:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8024de:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8024e1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8024e8:	e9 b9 00 00 00       	jmp    8025a6 <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  8024ed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8024f0:	48 98                	cdqe   
  8024f2:	48 c1 e0 06          	shl    rax,0x6
  8024f6:	48 05 90 26 40 00    	add    rax,0x402690
  8024fc:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8024ff:	0f b7 c0             	movzx  eax,ax
  802502:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802505:	0f 85 97 00 00 00    	jne    8025a2 <get_buf+0xd3>
  80250b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80250e:	48 98                	cdqe   
  802510:	48 c1 e0 06          	shl    rax,0x6
  802514:	48 05 88 26 40 00    	add    rax,0x402688
  80251a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80251d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802520:	48 98                	cdqe   
  802522:	48 39 c2             	cmp    rdx,rax
  802525:	75 7b                	jne    8025a2 <get_buf+0xd3>
        {
            repeat:
  802527:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  802528:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80252b:	48 98                	cdqe   
  80252d:	48 c1 e0 06          	shl    rax,0x6
  802531:	48 05 80 26 40 00    	add    rax,0x402680
  802537:	48 89 c7             	mov    rdi,rax
  80253a:	e8 41 01 00 00       	call   802680 <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  80253f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802542:	48 98                	cdqe   
  802544:	48 c1 e0 06          	shl    rax,0x6
  802548:	48 05 94 26 40 00    	add    rax,0x402694
  80254e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802551:	84 c0                	test   al,al
  802553:	74 02                	je     802557 <get_buf+0x88>
                goto repeat;
  802555:	eb d1                	jmp    802528 <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  802557:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80255a:	48 98                	cdqe   
  80255c:	48 c1 e0 06          	shl    rax,0x6
  802560:	48 05 90 26 40 00    	add    rax,0x402690
  802566:	0f b7 00             	movzx  eax,WORD PTR [rax]
  802569:	0f b7 c0             	movzx  eax,ax
  80256c:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80256f:	75 30                	jne    8025a1 <get_buf+0xd2>
  802571:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802574:	48 98                	cdqe   
  802576:	48 c1 e0 06          	shl    rax,0x6
  80257a:	48 05 88 26 40 00    	add    rax,0x402688
  802580:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802583:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802586:	48 98                	cdqe   
  802588:	48 39 c2             	cmp    rdx,rax
  80258b:	75 14                	jne    8025a1 <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  80258d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802590:	48 98                	cdqe   
  802592:	48 c1 e0 06          	shl    rax,0x6
  802596:	48 05 80 26 40 00    	add    rax,0x402680
  80259c:	e9 dd 00 00 00       	jmp    80267e <get_buf+0x1af>
                continue;
  8025a1:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8025a2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8025a6:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8025aa:	0f 8e 3d ff ff ff    	jle    8024ed <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8025b0:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8025b7:	e9 b8 00 00 00       	jmp    802674 <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  8025bc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8025bf:	48 98                	cdqe   
  8025c1:	48 c1 e0 06          	shl    rax,0x6
  8025c5:	48 05 94 26 40 00    	add    rax,0x402694
  8025cb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8025ce:	84 c0                	test   al,al
  8025d0:	0f 85 9a 00 00 00    	jne    802670 <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  8025d6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8025d9:	48 98                	cdqe   
  8025db:	48 c1 e0 06          	shl    rax,0x6
  8025df:	48 05 93 26 40 00    	add    rax,0x402693
  8025e5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8025e8:	84 c0                	test   al,al
  8025ea:	74 2e                	je     80261a <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  8025ec:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8025ef:	48 98                	cdqe   
  8025f1:	48 c1 e0 06          	shl    rax,0x6
  8025f5:	48 05 80 26 40 00    	add    rax,0x402680
  8025fb:	48 89 c7             	mov    rdi,rax
  8025fe:	e8 2c 02 00 00       	call   80282f <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  802603:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802606:	48 98                	cdqe   
  802608:	48 c1 e0 06          	shl    rax,0x6
  80260c:	48 05 80 26 40 00    	add    rax,0x402680
  802612:	48 89 c7             	mov    rdi,rax
  802615:	e8 66 00 00 00       	call   802680 <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  80261a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80261d:	48 98                	cdqe   
  80261f:	48 c1 e0 06          	shl    rax,0x6
  802623:	48 05 94 26 40 00    	add    rax,0x402694
  802629:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80262c:	8d 50 01             	lea    edx,[rax+0x1]
  80262f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802632:	48 98                	cdqe   
  802634:	48 c1 e0 06          	shl    rax,0x6
  802638:	48 05 94 26 40 00    	add    rax,0x402694
  80263e:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  802640:	b8 00 00 00 00       	mov    eax,0x0
  802645:	e8 b5 ea ff ff       	call   8010ff <vmalloc>
  80264a:	48 89 c2             	mov    rdx,rax
  80264d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802650:	48 98                	cdqe   
  802652:	48 c1 e0 06          	shl    rax,0x6
  802656:	48 05 80 26 40 00    	add    rax,0x402680
  80265c:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  80265f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802662:	48 98                	cdqe   
  802664:	48 c1 e0 06          	shl    rax,0x6
  802668:	48 05 80 26 40 00    	add    rax,0x402680
  80266e:	eb 0e                	jmp    80267e <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802670:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  802674:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  802678:	0f 8e 3e ff ff ff    	jle    8025bc <get_buf+0xed>
        }
    }
}
  80267e:	c9                   	leave  
  80267f:	c3                   	ret    

0000000000802680 <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  802680:	f3 0f 1e fa          	endbr64 
  802684:	55                   	push   rbp
  802685:	48 89 e5             	mov    rbp,rsp
  802688:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  80268c:	90                   	nop
  80268d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802691:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  802695:	84 c0                	test   al,al
  802697:	75 f4                	jne    80268d <wait_on_buf+0xd>
    
}
  802699:	90                   	nop
  80269a:	90                   	nop
  80269b:	5d                   	pop    rbp
  80269c:	c3                   	ret    

000000000080269d <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  80269d:	f3 0f 1e fa          	endbr64 
  8026a1:	55                   	push   rbp
  8026a2:	48 89 e5             	mov    rbp,rsp
  8026a5:	48 83 ec 40          	sub    rsp,0x40
  8026a9:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    device *blkdev=get_dev(dev);
  8026ac:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8026af:	89 c7                	mov    edi,eax
  8026b1:	e8 3c 0e 00 00       	call   8034f2 <get_dev>
  8026b6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    buffer_head* bh=bread(dev,0);
  8026ba:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8026bd:	be 00 00 00 00       	mov    esi,0x0
  8026c2:	89 c7                	mov    edi,eax
  8026c4:	e8 5e fb ff ff       	call   802227 <bread>
  8026c9:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!bh)return -1;
  8026cd:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  8026d2:	75 0a                	jne    8026de <scan_dev+0x41>
  8026d4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8026d9:	e9 4f 01 00 00       	jmp    80282d <scan_dev+0x190>
    dpt_t* dpte=bh->b_data+0x1be;
  8026de:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8026e2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8026e5:	48 05 be 01 00 00    	add    rax,0x1be
  8026eb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  8026ef:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8026f6:	e9 17 01 00 00       	jmp    802812 <scan_dev+0x175>
    {
        blkdev->par[i].type=dpte->type;
  8026fb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8026ff:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802702:	0f b6 d0             	movzx  edx,al
  802705:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  802709:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80270c:	48 63 c8             	movsxd rcx,eax
  80270f:	48 89 c8             	mov    rax,rcx
  802712:	48 01 c0             	add    rax,rax
  802715:	48 01 c8             	add    rax,rcx
  802718:	48 c1 e0 02          	shl    rax,0x2
  80271c:	48 01 f0             	add    rax,rsi
  80271f:	48 83 c0 40          	add    rax,0x40
  802723:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
        int stlba=dpte->start_lba;
  802726:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80272a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80272d:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
        blkdev->par[i].start_sec=stlba;
  802730:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  802734:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802737:	48 63 d0             	movsxd rdx,eax
  80273a:	48 89 d0             	mov    rax,rdx
  80273d:	48 01 c0             	add    rax,rax
  802740:	48 01 d0             	add    rax,rdx
  802743:	48 c1 e0 02          	shl    rax,0x2
  802747:	48 01 c8             	add    rax,rcx
  80274a:	48 8d 50 40          	lea    rdx,[rax+0x40]
  80274e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802751:	89 02                	mov    DWORD PTR [rdx],eax
        int i;
        for(i=0;i<MAX_FS;i++)
  802753:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80275a:	eb 68                	jmp    8027c4 <scan_dev+0x127>
        {
            if(fs[i].read_superblock&&fs[i].read_superblock(dev,stlba)==0)
  80275c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80275f:	48 63 d0             	movsxd rdx,eax
  802762:	48 89 d0             	mov    rax,rdx
  802765:	48 01 c0             	add    rax,rax
  802768:	48 01 d0             	add    rax,rdx
  80276b:	48 c1 e0 03          	shl    rax,0x3
  80276f:	48 05 80 23 40 00    	add    rax,0x402380
  802775:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802778:	48 85 c0             	test   rax,rax
  80277b:	74 43                	je     8027c0 <scan_dev+0x123>
  80277d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  802780:	48 63 d0             	movsxd rdx,eax
  802783:	48 89 d0             	mov    rax,rdx
  802786:	48 01 c0             	add    rax,rax
  802789:	48 01 d0             	add    rax,rdx
  80278c:	48 c1 e0 03          	shl    rax,0x3
  802790:	48 05 80 23 40 00    	add    rax,0x402380
  802796:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802799:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80279c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80279f:	89 d6                	mov    esi,edx
  8027a1:	89 c7                	mov    edi,eax
  8027a3:	ff d1                	call   rcx
  8027a5:	85 c0                	test   eax,eax
  8027a7:	75 17                	jne    8027c0 <scan_dev+0x123>
            {
                reg_vol(dev,i,blkdev->name);//识别成功，注册卷
  8027a9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8027ad:	48 8d 50 14          	lea    rdx,[rax+0x14]
  8027b1:	8b 4d f0             	mov    ecx,DWORD PTR [rbp-0x10]
  8027b4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8027b7:	89 ce                	mov    esi,ecx
  8027b9:	89 c7                	mov    edi,eax
  8027bb:	e8 ae f1 ff ff       	call   80196e <reg_vol>
        for(i=0;i<MAX_FS;i++)
  8027c0:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8027c4:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  8027c8:	7e 92                	jle    80275c <scan_dev+0xbf>
            }
        }
        if(i==MAX_FS)
  8027ca:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  8027ce:	75 0f                	jne    8027df <scan_dev+0x142>
        {
            printf("err:unrecognised partition fs.\n");
  8027d0:	bf 58 18 81 00       	mov    edi,0x811858
  8027d5:	b8 00 00 00 00       	mov    eax,0x0
  8027da:	e8 12 e5 ff ff       	call   800cf1 <printf>
        }

        blkdev->par[i].end_sec=dpte->end_lba;
  8027df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8027e3:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8027e6:	89 c1                	mov    ecx,eax
  8027e8:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  8027ec:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8027ef:	48 63 d0             	movsxd rdx,eax
  8027f2:	48 89 d0             	mov    rax,rdx
  8027f5:	48 01 c0             	add    rax,rax
  8027f8:	48 01 d0             	add    rax,rdx
  8027fb:	48 c1 e0 02          	shl    rax,0x2
  8027ff:	48 01 f0             	add    rax,rsi
  802802:	48 83 c0 40          	add    rax,0x40
  802806:	89 48 04             	mov    DWORD PTR [rax+0x4],ecx
        dpte++;
  802809:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  80280e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802812:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  802816:	0f 8e df fe ff ff    	jle    8026fb <scan_dev+0x5e>
    }
    brelse(bh);
  80281c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802820:	48 89 c7             	mov    rdi,rax
  802823:	e8 9c f9 ff ff       	call   8021c4 <brelse>
    return 0;
  802828:	b8 00 00 00 00       	mov    eax,0x0
}
  80282d:	c9                   	leave  
  80282e:	c3                   	ret    

000000000080282f <sync_buf>:

int sync_buf(buffer_head* bh)
{
  80282f:	f3 0f 1e fa          	endbr64 
  802833:	55                   	push   rbp
  802834:	48 89 e5             	mov    rbp,rsp
  802837:	48 83 ec 20          	sub    rsp,0x20
  80283b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  80283f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802843:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  802847:	0f b7 c0             	movzx  eax,ax
  80284a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  80284d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802851:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  802855:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  802858:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80285c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80285f:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  802862:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802865:	b9 00 02 00 00       	mov    ecx,0x200
  80286a:	89 c7                	mov    edi,eax
  80286c:	e8 02 00 00 00       	call   802873 <write_block>

}
  802871:	c9                   	leave  
  802872:	c3                   	ret    

0000000000802873 <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  802873:	f3 0f 1e fa          	endbr64 
  802877:	55                   	push   rbp
  802878:	48 89 e5             	mov    rbp,rsp
  80287b:	48 83 ec 30          	sub    rsp,0x30
  80287f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802882:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802885:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802889:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  80288c:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80288f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802892:	89 d6                	mov    esi,edx
  802894:	89 c7                	mov    edi,eax
  802896:	e8 34 fc ff ff       	call   8024cf <get_buf>
  80289b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80289f:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8028a2:	ba 00 02 00 00       	mov    edx,0x200
  8028a7:	39 d0                	cmp    eax,edx
  8028a9:	0f 4f c2             	cmovg  eax,edx
  8028ac:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  8028af:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8028b2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028b6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8028b9:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8028bd:	48 89 ce             	mov    rsi,rcx
  8028c0:	48 89 c7             	mov    rdi,rax
  8028c3:	e8 11 6c 00 00       	call   8094d9 <memcpy>
        len-=BLOCK_SIZE;
  8028c8:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  8028cf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028d3:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  8028d7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028db:	48 89 c7             	mov    rdi,rax
  8028de:	e8 e1 f8 ff ff       	call   8021c4 <brelse>
    }while(len>0);
  8028e3:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  8028e7:	7f a3                	jg     80288c <write_block+0x19>
    return 0;
  8028e9:	b8 00 00 00 00       	mov    eax,0x0
}
  8028ee:	c9                   	leave  
  8028ef:	c3                   	ret    

00000000008028f0 <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  8028f0:	f3 0f 1e fa          	endbr64 
  8028f4:	55                   	push   rbp
  8028f5:	48 89 e5             	mov    rbp,rsp
  8028f8:	48 83 ec 30          	sub    rsp,0x30
  8028fc:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8028ff:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802902:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802906:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  802909:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80290c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80290f:	89 d6                	mov    esi,edx
  802911:	89 c7                	mov    edi,eax
  802913:	e8 0f f9 ff ff       	call   802227 <bread>
  802918:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80291c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80291f:	ba 00 02 00 00       	mov    edx,0x200
  802924:	39 d0                	cmp    eax,edx
  802926:	0f 4f c2             	cmovg  eax,edx
  802929:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  80292c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80292f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802933:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802936:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80293a:	48 89 ce             	mov    rsi,rcx
  80293d:	48 89 c7             	mov    rdi,rax
  802940:	e8 94 6b 00 00       	call   8094d9 <memcpy>
        len-=BLOCK_SIZE;
  802945:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  80294c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802950:	48 89 c7             	mov    rdi,rax
  802953:	e8 6c f8 ff ff       	call   8021c4 <brelse>
    }while(len>0);
  802958:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  80295c:	7f ab                	jg     802909 <read_block+0x19>
    return 0;
  80295e:	b8 00 00 00 00       	mov    eax,0x0
}
  802963:	c9                   	leave  
  802964:	c3                   	ret    

0000000000802965 <init_vfs>:

int init_vfs()
{
  802965:	f3 0f 1e fa          	endbr64 
  802969:	55                   	push   rbp
  80296a:	48 89 e5             	mov    rbp,rsp
  80296d:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  802971:	48 8b 05 08 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05b08]        # 408480 <dev_tree>
  802978:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  80297c:	eb 40                	jmp    8029be <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  80297e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802982:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  802988:	48 c1 f8 02          	sar    rax,0x2
  80298c:	48 89 c2             	mov    rdx,rax
  80298f:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  802996:	18 9c 8f 
  802999:	48 0f af c2          	imul   rax,rdx
  80299d:	89 c7                	mov    edi,eax
  80299f:	e8 f9 fc ff ff       	call   80269d <scan_dev>
  8029a4:	85 c0                	test   eax,eax
  8029a6:	74 07                	je     8029af <init_vfs+0x4a>
  8029a8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8029ad:	eb 1b                	jmp    8029ca <init_vfs+0x65>
    for(;p;p=p->next)
  8029af:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029b3:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8029ba:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8029be:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8029c3:	75 b9                	jne    80297e <init_vfs+0x19>
    }
    return 0;
  8029c5:	b8 00 00 00 00       	mov    eax,0x0
  8029ca:	c9                   	leave  
  8029cb:	c3                   	ret    

00000000008029cc <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  8029cc:	f3 0f 1e fa          	endbr64 
  8029d0:	55                   	push   rbp
  8029d1:	48 89 e5             	mov    rbp,rsp
}
  8029d4:	90                   	nop
  8029d5:	5d                   	pop    rbp
  8029d6:	c3                   	ret    

00000000008029d7 <load_driver>:
int load_driver(char *path)
{
  8029d7:	f3 0f 1e fa          	endbr64 
  8029db:	55                   	push   rbp
  8029dc:	48 89 e5             	mov    rbp,rsp
  8029df:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  8029e3:	90                   	nop
  8029e4:	5d                   	pop    rbp
  8029e5:	c3                   	ret    

00000000008029e6 <reg_device>:

int reg_device(device* dev)
{
  8029e6:	f3 0f 1e fa          	endbr64 
  8029ea:	55                   	push   rbp
  8029eb:	48 89 e5             	mov    rbp,rsp
  8029ee:	53                   	push   rbx
  8029ef:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  8029f3:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  8029fa:	e9 42 01 00 00       	jmp    802b41 <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  8029ff:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802a02:	48 63 d0             	movsxd rdx,eax
  802a05:	48 89 d0             	mov    rax,rdx
  802a08:	48 c1 e0 02          	shl    rax,0x2
  802a0c:	48 01 d0             	add    rax,rdx
  802a0f:	48 c1 e0 02          	shl    rax,0x2
  802a13:	48 01 d0             	add    rax,rdx
  802a16:	48 c1 e0 03          	shl    rax,0x3
  802a1a:	48 05 90 2e 40 00    	add    rax,0x402e90
  802a20:	8b 00                	mov    eax,DWORD PTR [rax]
  802a22:	85 c0                	test   eax,eax
  802a24:	0f 85 13 01 00 00    	jne    802b3d <reg_device+0x157>
        {
            devs[i]=*dev;
  802a2a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802a2d:	48 63 d0             	movsxd rdx,eax
  802a30:	48 89 d0             	mov    rax,rdx
  802a33:	48 c1 e0 02          	shl    rax,0x2
  802a37:	48 01 d0             	add    rax,rdx
  802a3a:	48 c1 e0 02          	shl    rax,0x2
  802a3e:	48 01 d0             	add    rax,rdx
  802a41:	48 c1 e0 03          	shl    rax,0x3
  802a45:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  802a4c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802a50:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802a53:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802a57:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802a5a:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802a5e:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802a62:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802a66:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802a6a:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802a6e:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802a72:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802a76:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802a7a:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802a7e:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802a82:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802a86:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802a8a:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802a8e:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802a92:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802a96:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802a9a:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802a9e:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802aa2:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802aa6:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802aaa:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802aae:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802ab2:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802ab6:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802aba:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802abe:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802ac2:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802ac6:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802aca:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802ace:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802ad5:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802adc:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802ae3:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802aea:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802af1:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802af8:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802aff:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  802b06:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  802b0d:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  802b14:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802b17:	48 63 d0             	movsxd rdx,eax
  802b1a:	48 89 d0             	mov    rax,rdx
  802b1d:	48 c1 e0 02          	shl    rax,0x2
  802b21:	48 01 d0             	add    rax,rdx
  802b24:	48 c1 e0 02          	shl    rax,0x2
  802b28:	48 01 d0             	add    rax,rdx
  802b2b:	48 c1 e0 03          	shl    rax,0x3
  802b2f:	48 05 90 2e 40 00    	add    rax,0x402e90
  802b35:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802b3b:	eb 0e                	jmp    802b4b <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  802b3d:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802b41:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  802b45:	0f 8e b4 fe ff ff    	jle    8029ff <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802b4b:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  802b4f:	75 0a                	jne    802b5b <reg_device+0x175>
        return -1;
  802b51:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802b56:	e9 6d 01 00 00       	jmp    802cc8 <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802b5b:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  802b62:	00 
  802b63:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802b66:	48 63 d0             	movsxd rdx,eax
  802b69:	48 89 d0             	mov    rax,rdx
  802b6c:	48 c1 e0 02          	shl    rax,0x2
  802b70:	48 01 d0             	add    rax,rdx
  802b73:	48 c1 e0 02          	shl    rax,0x2
  802b77:	48 01 d0             	add    rax,rdx
  802b7a:	48 c1 e0 03          	shl    rax,0x3
  802b7e:	48 05 80 2e 40 00    	add    rax,0x402e80
  802b84:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  802b88:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802b8c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802b8f:	83 f8 03             	cmp    eax,0x3
  802b92:	74 3b                	je     802bcf <reg_device+0x1e9>
  802b94:	83 f8 03             	cmp    eax,0x3
  802b97:	7f 4b                	jg     802be4 <reg_device+0x1fe>
  802b99:	83 f8 01             	cmp    eax,0x1
  802b9c:	74 07                	je     802ba5 <reg_device+0x1bf>
  802b9e:	83 f8 02             	cmp    eax,0x2
  802ba1:	74 17                	je     802bba <reg_device+0x1d4>
  802ba3:	eb 3f                	jmp    802be4 <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  802ba5:	48 8b 05 d4 58 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc058d4]        # 408480 <dev_tree>
  802bac:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802bb0:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  802bb7:	00 
        break;
  802bb8:	eb 34                	jmp    802bee <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  802bba:	48 8b 05 c7 58 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc058c7]        # 408488 <dev_tree+0x8>
  802bc1:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802bc5:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  802bcc:	00 
        break;
  802bcd:	eb 1f                	jmp    802bee <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  802bcf:	48 8b 05 ba 58 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc058ba]        # 408490 <dev_tree+0x10>
  802bd6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802bda:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  802be1:	00 
        break;
  802be2:	eb 0a                	jmp    802bee <reg_device+0x208>
    default:return -1;//不可能有其他情况
  802be4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802be9:	e9 da 00 00 00       	jmp    802cc8 <reg_device+0x2e2>
    }
    if(!p){
  802bee:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  802bf3:	75 2b                	jne    802c20 <reg_device+0x23a>
        *pp=neo;
  802bf5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802bf9:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802bfd:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  802c00:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c04:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  802c0b:	00 00 00 00 
  802c0f:	eb 3d                	jmp    802c4e <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  802c11:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802c15:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802c1c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802c20:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802c24:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802c2b:	48 85 c0             	test   rax,rax
  802c2e:	75 e1                	jne    802c11 <reg_device+0x22b>
        p->next=neo;
  802c30:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802c34:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802c38:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  802c3f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c43:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802c47:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802c4e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c52:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802c59:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802c5d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c61:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802c64:	83 f8 04             	cmp    eax,0x4
  802c67:	74 3b                	je     802ca4 <reg_device+0x2be>
  802c69:	83 f8 04             	cmp    eax,0x4
  802c6c:	7f 56                	jg     802cc4 <reg_device+0x2de>
  802c6e:	83 f8 03             	cmp    eax,0x3
  802c71:	74 21                	je     802c94 <reg_device+0x2ae>
  802c73:	83 f8 03             	cmp    eax,0x3
  802c76:	7f 4c                	jg     802cc4 <reg_device+0x2de>
  802c78:	83 f8 01             	cmp    eax,0x1
  802c7b:	74 07                	je     802c84 <reg_device+0x29e>
  802c7d:	83 f8 02             	cmp    eax,0x2
  802c80:	74 32                	je     802cb4 <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802c82:	eb 40                	jmp    802cc4 <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  802c84:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c88:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802c8f:	00 00 00 
        break;
  802c92:	eb 31                	jmp    802cc5 <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  802c94:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c98:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802c9f:	00 00 00 
        break;
  802ca2:	eb 21                	jmp    802cc5 <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  802ca4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802ca8:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  802caf:	00 00 00 
        break;
  802cb2:	eb 11                	jmp    802cc5 <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  802cb4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802cb8:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  802cbf:	00 00 00 
        break;
  802cc2:	eb 01                	jmp    802cc5 <reg_device+0x2df>
        break;
  802cc4:	90                   	nop
    }
    return i;
  802cc5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  802cc8:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802ccc:	c9                   	leave  
  802ccd:	c3                   	ret    

0000000000802cce <reg_driver>:


int reg_driver(driver *drv)
{
  802cce:	f3 0f 1e fa          	endbr64 
  802cd2:	55                   	push   rbp
  802cd3:	48 89 e5             	mov    rbp,rsp
  802cd6:	53                   	push   rbx
  802cd7:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  802cdb:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802ce2:	e9 22 01 00 00       	jmp    802e09 <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  802ce7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802cea:	48 63 d0             	movsxd rdx,eax
  802ced:	48 89 d0             	mov    rax,rdx
  802cf0:	48 c1 e0 02          	shl    rax,0x2
  802cf4:	48 01 d0             	add    rax,rdx
  802cf7:	48 c1 e0 05          	shl    rax,0x5
  802cfb:	48 05 80 58 40 00    	add    rax,0x405880
  802d01:	8b 00                	mov    eax,DWORD PTR [rax]
  802d03:	85 c0                	test   eax,eax
  802d05:	0f 85 fa 00 00 00    	jne    802e05 <reg_driver+0x137>
        {
            drvs[i]=*drv;
  802d0b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802d0e:	48 63 d0             	movsxd rdx,eax
  802d11:	48 89 d0             	mov    rax,rdx
  802d14:	48 c1 e0 02          	shl    rax,0x2
  802d18:	48 01 d0             	add    rax,rdx
  802d1b:	48 c1 e0 05          	shl    rax,0x5
  802d1f:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  802d26:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802d2a:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802d2d:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802d31:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802d34:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802d38:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802d3c:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802d40:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802d44:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802d48:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802d4c:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802d50:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802d54:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802d58:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802d5c:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802d60:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802d64:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802d68:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802d6c:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802d70:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802d74:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802d78:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802d7c:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802d80:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802d84:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802d88:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802d8c:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802d90:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802d94:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802d98:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802d9c:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802da0:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802da4:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802da8:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802daf:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802db6:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802dbd:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802dc4:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802dcb:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802dd2:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802dd9:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  802de0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802de3:	48 63 d0             	movsxd rdx,eax
  802de6:	48 89 d0             	mov    rax,rdx
  802de9:	48 c1 e0 02          	shl    rax,0x2
  802ded:	48 01 d0             	add    rax,rdx
  802df0:	48 c1 e0 05          	shl    rax,0x5
  802df4:	48 05 80 58 40 00    	add    rax,0x405880
  802dfa:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  802e00:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802e03:	eb 13                	jmp    802e18 <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  802e05:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802e09:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  802e0d:	0f 8e d4 fe ff ff    	jle    802ce7 <reg_driver+0x19>
        }
    }
    return -1;
  802e13:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802e18:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802e1c:	c9                   	leave  
  802e1d:	c3                   	ret    

0000000000802e1e <sys_find_dev>:

int sys_find_dev(char *name)
{
  802e1e:	f3 0f 1e fa          	endbr64 
  802e22:	55                   	push   rbp
  802e23:	48 89 e5             	mov    rbp,rsp
  802e26:	48 83 ec 20          	sub    rsp,0x20
  802e2a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802e2e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802e35:	eb 6c                	jmp    802ea3 <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802e37:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e3a:	48 63 d0             	movsxd rdx,eax
  802e3d:	48 89 d0             	mov    rax,rdx
  802e40:	48 c1 e0 02          	shl    rax,0x2
  802e44:	48 01 d0             	add    rax,rdx
  802e47:	48 c1 e0 02          	shl    rax,0x2
  802e4b:	48 01 d0             	add    rax,rdx
  802e4e:	48 c1 e0 03          	shl    rax,0x3
  802e52:	48 05 90 2e 40 00    	add    rax,0x402e90
  802e58:	8b 00                	mov    eax,DWORD PTR [rax]
  802e5a:	85 c0                	test   eax,eax
  802e5c:	74 41                	je     802e9f <sys_find_dev+0x81>
  802e5e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e61:	48 63 d0             	movsxd rdx,eax
  802e64:	48 89 d0             	mov    rax,rdx
  802e67:	48 c1 e0 02          	shl    rax,0x2
  802e6b:	48 01 d0             	add    rax,rdx
  802e6e:	48 c1 e0 02          	shl    rax,0x2
  802e72:	48 01 d0             	add    rax,rdx
  802e75:	48 c1 e0 03          	shl    rax,0x3
  802e79:	48 83 c0 10          	add    rax,0x10
  802e7d:	48 05 80 2e 40 00    	add    rax,0x402e80
  802e83:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802e87:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802e8b:	48 89 d6             	mov    rsi,rdx
  802e8e:	48 89 c7             	mov    rdi,rax
  802e91:	e8 e1 68 00 00       	call   809777 <strcmp>
  802e96:	85 c0                	test   eax,eax
  802e98:	75 05                	jne    802e9f <sys_find_dev+0x81>
            return i;
  802e9a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e9d:	eb 0f                	jmp    802eae <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802e9f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802ea3:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802ea7:	7e 8e                	jle    802e37 <sys_find_dev+0x19>
    }
    return -1;
  802ea9:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802eae:	c9                   	leave  
  802eaf:	c3                   	ret    

0000000000802eb0 <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  802eb0:	f3 0f 1e fa          	endbr64 
  802eb4:	55                   	push   rbp
  802eb5:	48 89 e5             	mov    rbp,rsp
  802eb8:	48 83 ec 30          	sub    rsp,0x30
  802ebc:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802ec0:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  802ec3:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  802ec7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  802ece:	eb 67                	jmp    802f37 <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802ed0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ed3:	48 63 d0             	movsxd rdx,eax
  802ed6:	48 89 d0             	mov    rax,rdx
  802ed9:	48 c1 e0 02          	shl    rax,0x2
  802edd:	48 01 d0             	add    rax,rdx
  802ee0:	48 c1 e0 02          	shl    rax,0x2
  802ee4:	48 01 d0             	add    rax,rdx
  802ee7:	48 c1 e0 03          	shl    rax,0x3
  802eeb:	48 05 90 2e 40 00    	add    rax,0x402e90
  802ef1:	8b 00                	mov    eax,DWORD PTR [rax]
  802ef3:	85 c0                	test   eax,eax
  802ef5:	74 3c                	je     802f33 <sys_operate_dev+0x83>
  802ef7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802efa:	48 63 d0             	movsxd rdx,eax
  802efd:	48 89 d0             	mov    rax,rdx
  802f00:	48 c1 e0 02          	shl    rax,0x2
  802f04:	48 01 d0             	add    rax,rdx
  802f07:	48 c1 e0 02          	shl    rax,0x2
  802f0b:	48 01 d0             	add    rax,rdx
  802f0e:	48 c1 e0 03          	shl    rax,0x3
  802f12:	48 83 c0 10          	add    rax,0x10
  802f16:	48 05 80 2e 40 00    	add    rax,0x402e80
  802f1c:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802f20:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802f24:	48 89 d6             	mov    rsi,rdx
  802f27:	48 89 c7             	mov    rdi,rax
  802f2a:	e8 48 68 00 00       	call   809777 <strcmp>
  802f2f:	85 c0                	test   eax,eax
  802f31:	74 0c                	je     802f3f <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  802f33:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802f37:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802f3b:	7e 93                	jle    802ed0 <sys_operate_dev+0x20>
  802f3d:	eb 01                	jmp    802f40 <sys_operate_dev+0x90>
            break;
  802f3f:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  802f40:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  802f44:	75 0a                	jne    802f50 <sys_operate_dev+0xa0>
  802f46:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802f4b:	e9 9c 02 00 00       	jmp    8031ec <sys_operate_dev+0x33c>
    switch (func) {
  802f50:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  802f54:	0f 87 8d 02 00 00    	ja     8031e7 <sys_operate_dev+0x337>
  802f5a:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802f5d:	48 8b 04 c5 78 18 81 	mov    rax,QWORD PTR [rax*8+0x811878]
  802f64:	00 
  802f65:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  802f68:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f6b:	48 63 d0             	movsxd rdx,eax
  802f6e:	48 89 d0             	mov    rax,rdx
  802f71:	48 c1 e0 02          	shl    rax,0x2
  802f75:	48 01 d0             	add    rax,rdx
  802f78:	48 c1 e0 02          	shl    rax,0x2
  802f7c:	48 01 d0             	add    rax,rdx
  802f7f:	48 c1 e0 03          	shl    rax,0x3
  802f83:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802f89:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802f8c:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802f90:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802f94:	48 89 c7             	mov    rdi,rax
  802f97:	ff d2                	call   rdx
  802f99:	e9 4e 02 00 00       	jmp    8031ec <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  802f9e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fa1:	48 63 d0             	movsxd rdx,eax
  802fa4:	48 89 d0             	mov    rax,rdx
  802fa7:	48 c1 e0 02          	shl    rax,0x2
  802fab:	48 01 d0             	add    rax,rdx
  802fae:	48 c1 e0 02          	shl    rax,0x2
  802fb2:	48 01 d0             	add    rax,rdx
  802fb5:	48 c1 e0 03          	shl    rax,0x3
  802fb9:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802fbf:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802fc2:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  802fc6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802fca:	48 89 c7             	mov    rdi,rax
  802fcd:	ff d2                	call   rdx
  802fcf:	e9 18 02 00 00       	jmp    8031ec <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  802fd4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fd7:	48 63 d0             	movsxd rdx,eax
  802fda:	48 89 d0             	mov    rax,rdx
  802fdd:	48 c1 e0 02          	shl    rax,0x2
  802fe1:	48 01 d0             	add    rax,rdx
  802fe4:	48 c1 e0 02          	shl    rax,0x2
  802fe8:	48 01 d0             	add    rax,rdx
  802feb:	48 c1 e0 03          	shl    rax,0x3
  802fef:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802ff5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802ff8:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  802ffc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803000:	48 89 c7             	mov    rdi,rax
  803003:	ff d2                	call   rdx
  803005:	e9 e2 01 00 00       	jmp    8031ec <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  80300a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80300d:	48 63 d0             	movsxd rdx,eax
  803010:	48 89 d0             	mov    rax,rdx
  803013:	48 c1 e0 02          	shl    rax,0x2
  803017:	48 01 d0             	add    rax,rdx
  80301a:	48 c1 e0 02          	shl    rax,0x2
  80301e:	48 01 d0             	add    rax,rdx
  803021:	48 c1 e0 03          	shl    rax,0x3
  803025:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80302b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80302e:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  803032:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803036:	48 89 c7             	mov    rdi,rax
  803039:	ff d2                	call   rdx
  80303b:	e9 ac 01 00 00       	jmp    8031ec <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  803040:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803043:	48 63 d0             	movsxd rdx,eax
  803046:	48 89 d0             	mov    rax,rdx
  803049:	48 c1 e0 02          	shl    rax,0x2
  80304d:	48 01 d0             	add    rax,rdx
  803050:	48 c1 e0 02          	shl    rax,0x2
  803054:	48 01 d0             	add    rax,rdx
  803057:	48 c1 e0 03          	shl    rax,0x3
  80305b:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803061:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803064:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  803068:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80306c:	48 89 c7             	mov    rdi,rax
  80306f:	ff d2                	call   rdx
  803071:	e9 76 01 00 00       	jmp    8031ec <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  803076:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803079:	48 63 d0             	movsxd rdx,eax
  80307c:	48 89 d0             	mov    rax,rdx
  80307f:	48 c1 e0 02          	shl    rax,0x2
  803083:	48 01 d0             	add    rax,rdx
  803086:	48 c1 e0 02          	shl    rax,0x2
  80308a:	48 01 d0             	add    rax,rdx
  80308d:	48 c1 e0 03          	shl    rax,0x3
  803091:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803097:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80309a:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  80309e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030a2:	48 89 c7             	mov    rdi,rax
  8030a5:	ff d2                	call   rdx
  8030a7:	e9 40 01 00 00       	jmp    8031ec <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  8030ac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030af:	48 63 d0             	movsxd rdx,eax
  8030b2:	48 89 d0             	mov    rax,rdx
  8030b5:	48 c1 e0 02          	shl    rax,0x2
  8030b9:	48 01 d0             	add    rax,rdx
  8030bc:	48 c1 e0 02          	shl    rax,0x2
  8030c0:	48 01 d0             	add    rax,rdx
  8030c3:	48 c1 e0 03          	shl    rax,0x3
  8030c7:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030cd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030d0:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  8030d4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030d8:	48 89 c7             	mov    rdi,rax
  8030db:	ff d2                	call   rdx
  8030dd:	e9 0a 01 00 00       	jmp    8031ec <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  8030e2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030e5:	48 63 d0             	movsxd rdx,eax
  8030e8:	48 89 d0             	mov    rax,rdx
  8030eb:	48 c1 e0 02          	shl    rax,0x2
  8030ef:	48 01 d0             	add    rax,rdx
  8030f2:	48 c1 e0 02          	shl    rax,0x2
  8030f6:	48 01 d0             	add    rax,rdx
  8030f9:	48 c1 e0 03          	shl    rax,0x3
  8030fd:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803103:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803106:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  80310a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80310e:	48 89 c7             	mov    rdi,rax
  803111:	ff d2                	call   rdx
  803113:	e9 d4 00 00 00       	jmp    8031ec <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  803118:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80311b:	48 63 d0             	movsxd rdx,eax
  80311e:	48 89 d0             	mov    rax,rdx
  803121:	48 c1 e0 02          	shl    rax,0x2
  803125:	48 01 d0             	add    rax,rdx
  803128:	48 c1 e0 02          	shl    rax,0x2
  80312c:	48 01 d0             	add    rax,rdx
  80312f:	48 c1 e0 03          	shl    rax,0x3
  803133:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803139:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80313c:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  803140:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803144:	48 89 c7             	mov    rdi,rax
  803147:	ff d2                	call   rdx
  803149:	e9 9e 00 00 00       	jmp    8031ec <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  80314e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803151:	48 63 d0             	movsxd rdx,eax
  803154:	48 89 d0             	mov    rax,rdx
  803157:	48 c1 e0 02          	shl    rax,0x2
  80315b:	48 01 d0             	add    rax,rdx
  80315e:	48 c1 e0 02          	shl    rax,0x2
  803162:	48 01 d0             	add    rax,rdx
  803165:	48 c1 e0 03          	shl    rax,0x3
  803169:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80316f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803172:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  803176:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80317a:	48 89 c7             	mov    rdi,rax
  80317d:	ff d2                	call   rdx
  80317f:	eb 6b                	jmp    8031ec <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  803181:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803184:	48 63 d0             	movsxd rdx,eax
  803187:	48 89 d0             	mov    rax,rdx
  80318a:	48 c1 e0 02          	shl    rax,0x2
  80318e:	48 01 d0             	add    rax,rdx
  803191:	48 c1 e0 02          	shl    rax,0x2
  803195:	48 01 d0             	add    rax,rdx
  803198:	48 c1 e0 03          	shl    rax,0x3
  80319c:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031a2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031a5:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  8031a9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031ad:	48 89 c7             	mov    rdi,rax
  8031b0:	ff d2                	call   rdx
  8031b2:	eb 38                	jmp    8031ec <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  8031b4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031b7:	48 63 d0             	movsxd rdx,eax
  8031ba:	48 89 d0             	mov    rax,rdx
  8031bd:	48 c1 e0 02          	shl    rax,0x2
  8031c1:	48 01 d0             	add    rax,rdx
  8031c4:	48 c1 e0 02          	shl    rax,0x2
  8031c8:	48 01 d0             	add    rax,rdx
  8031cb:	48 c1 e0 03          	shl    rax,0x3
  8031cf:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031d5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031d8:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  8031dc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031e0:	48 89 c7             	mov    rdi,rax
  8031e3:	ff d2                	call   rdx
  8031e5:	eb 05                	jmp    8031ec <sys_operate_dev+0x33c>
    }
    return -1;
  8031e7:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8031ec:	c9                   	leave  
  8031ed:	c3                   	ret    

00000000008031ee <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  8031ee:	f3 0f 1e fa          	endbr64 
  8031f2:	55                   	push   rbp
  8031f3:	48 89 e5             	mov    rbp,rsp
  8031f6:	48 83 ec 10          	sub    rsp,0x10
  8031fa:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8031fd:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  803200:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  803204:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803207:	48 63 d0             	movsxd rdx,eax
  80320a:	48 89 d0             	mov    rax,rdx
  80320d:	48 c1 e0 02          	shl    rax,0x2
  803211:	48 01 d0             	add    rax,rdx
  803214:	48 c1 e0 05          	shl    rax,0x5
  803218:	48 05 80 58 40 00    	add    rax,0x405880
  80321e:	8b 00                	mov    eax,DWORD PTR [rax]
  803220:	85 c0                	test   eax,eax
  803222:	75 0a                	jne    80322e <call_drv_func+0x40>
  803224:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803229:	e9 15 02 00 00       	jmp    803443 <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  80322e:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  803232:	0f 87 06 02 00 00    	ja     80343e <call_drv_func+0x250>
  803238:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80323b:	48 8b 04 c5 d8 18 81 	mov    rax,QWORD PTR [rax*8+0x8118d8]
  803242:	00 
  803243:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  803246:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803249:	48 63 d0             	movsxd rdx,eax
  80324c:	48 89 d0             	mov    rax,rdx
  80324f:	48 c1 e0 02          	shl    rax,0x2
  803253:	48 01 d0             	add    rax,rdx
  803256:	48 c1 e0 05          	shl    rax,0x5
  80325a:	48 05 88 58 40 00    	add    rax,0x405888
  803260:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803263:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803267:	48 89 c7             	mov    rdi,rax
  80326a:	ff d2                	call   rdx
  80326c:	e9 d2 01 00 00       	jmp    803443 <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  803271:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803274:	48 63 d0             	movsxd rdx,eax
  803277:	48 89 d0             	mov    rax,rdx
  80327a:	48 c1 e0 02          	shl    rax,0x2
  80327e:	48 01 d0             	add    rax,rdx
  803281:	48 c1 e0 05          	shl    rax,0x5
  803285:	48 05 90 58 40 00    	add    rax,0x405890
  80328b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80328e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803292:	48 89 c7             	mov    rdi,rax
  803295:	ff d2                	call   rdx
  803297:	e9 a7 01 00 00       	jmp    803443 <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  80329c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80329f:	48 63 d0             	movsxd rdx,eax
  8032a2:	48 89 d0             	mov    rax,rdx
  8032a5:	48 c1 e0 02          	shl    rax,0x2
  8032a9:	48 01 d0             	add    rax,rdx
  8032ac:	48 c1 e0 05          	shl    rax,0x5
  8032b0:	48 05 98 58 40 00    	add    rax,0x405898
  8032b6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8032b9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8032bd:	48 89 c7             	mov    rdi,rax
  8032c0:	ff d2                	call   rdx
  8032c2:	e9 7c 01 00 00       	jmp    803443 <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  8032c7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032ca:	48 63 d0             	movsxd rdx,eax
  8032cd:	48 89 d0             	mov    rax,rdx
  8032d0:	48 c1 e0 02          	shl    rax,0x2
  8032d4:	48 01 d0             	add    rax,rdx
  8032d7:	48 c1 e0 05          	shl    rax,0x5
  8032db:	48 05 a0 58 40 00    	add    rax,0x4058a0
  8032e1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8032e4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8032e8:	48 89 c7             	mov    rdi,rax
  8032eb:	ff d2                	call   rdx
  8032ed:	e9 51 01 00 00       	jmp    803443 <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  8032f2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032f5:	48 63 d0             	movsxd rdx,eax
  8032f8:	48 89 d0             	mov    rax,rdx
  8032fb:	48 c1 e0 02          	shl    rax,0x2
  8032ff:	48 01 d0             	add    rax,rdx
  803302:	48 c1 e0 05          	shl    rax,0x5
  803306:	48 05 a8 58 40 00    	add    rax,0x4058a8
  80330c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80330f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803313:	48 89 c7             	mov    rdi,rax
  803316:	ff d2                	call   rdx
  803318:	e9 26 01 00 00       	jmp    803443 <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  80331d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803320:	48 63 d0             	movsxd rdx,eax
  803323:	48 89 d0             	mov    rax,rdx
  803326:	48 c1 e0 02          	shl    rax,0x2
  80332a:	48 01 d0             	add    rax,rdx
  80332d:	48 c1 e0 05          	shl    rax,0x5
  803331:	48 05 b0 58 40 00    	add    rax,0x4058b0
  803337:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80333a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80333e:	48 89 c7             	mov    rdi,rax
  803341:	ff d2                	call   rdx
  803343:	e9 fb 00 00 00       	jmp    803443 <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  803348:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80334b:	48 63 d0             	movsxd rdx,eax
  80334e:	48 89 d0             	mov    rax,rdx
  803351:	48 c1 e0 02          	shl    rax,0x2
  803355:	48 01 d0             	add    rax,rdx
  803358:	48 c1 e0 05          	shl    rax,0x5
  80335c:	48 05 b8 58 40 00    	add    rax,0x4058b8
  803362:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803365:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803369:	48 89 c7             	mov    rdi,rax
  80336c:	ff d2                	call   rdx
  80336e:	e9 d0 00 00 00       	jmp    803443 <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  803373:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803376:	48 63 d0             	movsxd rdx,eax
  803379:	48 89 d0             	mov    rax,rdx
  80337c:	48 c1 e0 02          	shl    rax,0x2
  803380:	48 01 d0             	add    rax,rdx
  803383:	48 c1 e0 05          	shl    rax,0x5
  803387:	48 05 c0 58 40 00    	add    rax,0x4058c0
  80338d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803390:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803394:	48 89 c7             	mov    rdi,rax
  803397:	ff d2                	call   rdx
  803399:	e9 a5 00 00 00       	jmp    803443 <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  80339e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033a1:	48 63 d0             	movsxd rdx,eax
  8033a4:	48 89 d0             	mov    rax,rdx
  8033a7:	48 c1 e0 02          	shl    rax,0x2
  8033ab:	48 01 d0             	add    rax,rdx
  8033ae:	48 c1 e0 05          	shl    rax,0x5
  8033b2:	48 05 c8 58 40 00    	add    rax,0x4058c8
  8033b8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033bb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033bf:	48 89 c7             	mov    rdi,rax
  8033c2:	ff d2                	call   rdx
  8033c4:	eb 7d                	jmp    803443 <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  8033c6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033c9:	48 63 d0             	movsxd rdx,eax
  8033cc:	48 89 d0             	mov    rax,rdx
  8033cf:	48 c1 e0 02          	shl    rax,0x2
  8033d3:	48 01 d0             	add    rax,rdx
  8033d6:	48 c1 e0 05          	shl    rax,0x5
  8033da:	48 05 d0 58 40 00    	add    rax,0x4058d0
  8033e0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033e3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033e7:	48 89 c7             	mov    rdi,rax
  8033ea:	ff d2                	call   rdx
  8033ec:	eb 55                	jmp    803443 <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  8033ee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033f1:	48 63 d0             	movsxd rdx,eax
  8033f4:	48 89 d0             	mov    rax,rdx
  8033f7:	48 c1 e0 02          	shl    rax,0x2
  8033fb:	48 01 d0             	add    rax,rdx
  8033fe:	48 c1 e0 05          	shl    rax,0x5
  803402:	48 05 d8 58 40 00    	add    rax,0x4058d8
  803408:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80340b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80340f:	48 89 c7             	mov    rdi,rax
  803412:	ff d2                	call   rdx
  803414:	eb 2d                	jmp    803443 <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  803416:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803419:	48 63 d0             	movsxd rdx,eax
  80341c:	48 89 d0             	mov    rax,rdx
  80341f:	48 c1 e0 02          	shl    rax,0x2
  803423:	48 01 d0             	add    rax,rdx
  803426:	48 c1 e0 05          	shl    rax,0x5
  80342a:	48 05 e0 58 40 00    	add    rax,0x4058e0
  803430:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803433:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803437:	48 89 c7             	mov    rdi,rax
  80343a:	ff d2                	call   rdx
  80343c:	eb 05                	jmp    803443 <call_drv_func+0x255>
    }
    return -1;
  80343e:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803443:	c9                   	leave  
  803444:	c3                   	ret    

0000000000803445 <dispose_device>:
int dispose_device(int dev){
  803445:	f3 0f 1e fa          	endbr64 
  803449:	55                   	push   rbp
  80344a:	48 89 e5             	mov    rbp,rsp
  80344d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  803450:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803453:	48 63 d0             	movsxd rdx,eax
  803456:	48 89 d0             	mov    rax,rdx
  803459:	48 c1 e0 02          	shl    rax,0x2
  80345d:	48 01 d0             	add    rax,rdx
  803460:	48 c1 e0 02          	shl    rax,0x2
  803464:	48 01 d0             	add    rax,rdx
  803467:	48 c1 e0 03          	shl    rax,0x3
  80346b:	48 05 90 2e 40 00    	add    rax,0x402e90
  803471:	8b 00                	mov    eax,DWORD PTR [rax]
  803473:	83 f8 01             	cmp    eax,0x1
  803476:	74 07                	je     80347f <dispose_device+0x3a>
  803478:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80347d:	eb 62                	jmp    8034e1 <dispose_device+0x9c>
    device* p=&devs[dev];
  80347f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803482:	48 63 d0             	movsxd rdx,eax
  803485:	48 89 d0             	mov    rax,rdx
  803488:	48 c1 e0 02          	shl    rax,0x2
  80348c:	48 01 d0             	add    rax,rdx
  80348f:	48 c1 e0 02          	shl    rax,0x2
  803493:	48 01 d0             	add    rax,rdx
  803496:	48 c1 e0 03          	shl    rax,0x3
  80349a:	48 05 80 2e 40 00    	add    rax,0x402e80
  8034a0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  8034a4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8034a8:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  8034af:	48 85 c0             	test   rax,rax
  8034b2:	74 1d                	je     8034d1 <dispose_device+0x8c>
  8034b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8034b8:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  8034bf:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8034c3:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  8034ca:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  8034d1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8034d5:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  8034dc:	b8 00 00 00 00       	mov    eax,0x0
}
  8034e1:	5d                   	pop    rbp
  8034e2:	c3                   	ret    

00000000008034e3 <dispose_driver>:
int dispose_driver(driver *drv){
  8034e3:	f3 0f 1e fa          	endbr64 
  8034e7:	55                   	push   rbp
  8034e8:	48 89 e5             	mov    rbp,rsp
  8034eb:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  8034ef:	90                   	nop
  8034f0:	5d                   	pop    rbp
  8034f1:	c3                   	ret    

00000000008034f2 <get_dev>:

device *get_dev(int devi)
{
  8034f2:	f3 0f 1e fa          	endbr64 
  8034f6:	55                   	push   rbp
  8034f7:	48 89 e5             	mov    rbp,rsp
  8034fa:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  8034fd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803500:	48 63 d0             	movsxd rdx,eax
  803503:	48 89 d0             	mov    rax,rdx
  803506:	48 c1 e0 02          	shl    rax,0x2
  80350a:	48 01 d0             	add    rax,rdx
  80350d:	48 c1 e0 02          	shl    rax,0x2
  803511:	48 01 d0             	add    rax,rdx
  803514:	48 c1 e0 03          	shl    rax,0x3
  803518:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  80351e:	5d                   	pop    rbp
  80351f:	c3                   	ret    

0000000000803520 <get_drv>:
driver *get_drv(int drvi)
{
  803520:	f3 0f 1e fa          	endbr64 
  803524:	55                   	push   rbp
  803525:	48 89 e5             	mov    rbp,rsp
  803528:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  80352b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80352e:	48 63 d0             	movsxd rdx,eax
  803531:	48 89 d0             	mov    rax,rdx
  803534:	48 c1 e0 02          	shl    rax,0x2
  803538:	48 01 d0             	add    rax,rdx
  80353b:	48 c1 e0 05          	shl    rax,0x5
  80353f:	48 05 80 58 40 00    	add    rax,0x405880
}
  803545:	5d                   	pop    rbp
  803546:	c3                   	ret    

0000000000803547 <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  803547:	f3 0f 1e fa          	endbr64 
  80354b:	55                   	push   rbp
  80354c:	48 89 e5             	mov    rbp,rsp
  80354f:	53                   	push   rbx
  803550:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  803554:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  80355b:	eb 23                	jmp    803580 <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  80355d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803560:	48 63 d0             	movsxd rdx,eax
  803563:	48 89 d0             	mov    rax,rdx
  803566:	48 01 c0             	add    rax,rax
  803569:	48 01 d0             	add    rax,rdx
  80356c:	48 c1 e0 06          	shl    rax,0x6
  803570:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803576:	8b 00                	mov    eax,DWORD PTR [rax]
  803578:	85 c0                	test   eax,eax
  80357a:	74 0c                	je     803588 <make_request+0x41>
    for(;i<NR_REQS;i++)
  80357c:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  803580:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  803584:	7e d7                	jle    80355d <make_request+0x16>
  803586:	eb 01                	jmp    803589 <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803588:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  803589:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  80358d:	75 0a                	jne    803599 <make_request+0x52>
  80358f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803594:	e9 e7 01 00 00       	jmp    803780 <make_request+0x239>
    reqs[i]=*args;//放入数组
  803599:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80359c:	48 63 d0             	movsxd rdx,eax
  80359f:	48 89 d0             	mov    rax,rdx
  8035a2:	48 01 c0             	add    rax,rax
  8035a5:	48 01 d0             	add    rax,rdx
  8035a8:	48 c1 e0 06          	shl    rax,0x6
  8035ac:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8035b3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8035b7:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8035ba:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  8035be:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  8035c1:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8035c5:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8035c9:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8035cd:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  8035d1:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  8035d5:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  8035d9:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  8035dd:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  8035e1:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  8035e5:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  8035e9:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  8035ed:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  8035f1:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  8035f5:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  8035f9:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  8035fd:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  803601:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  803605:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  803609:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  80360d:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  803611:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  803615:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  803619:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  80361d:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  803621:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  803625:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  803629:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  80362d:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  803631:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  803635:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  80363c:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  803643:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  80364a:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  803651:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  803658:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  80365f:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  803666:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  80366d:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  803674:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  80367b:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  803682:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  803689:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  803690:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  803697:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  80369e:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  8036a5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8036a9:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  8036af:	48 63 d0             	movsxd rdx,eax
  8036b2:	48 89 d0             	mov    rax,rdx
  8036b5:	48 c1 e0 02          	shl    rax,0x2
  8036b9:	48 01 d0             	add    rax,rdx
  8036bc:	48 c1 e0 02          	shl    rax,0x2
  8036c0:	48 01 d0             	add    rax,rdx
  8036c3:	48 c1 e0 03          	shl    rax,0x3
  8036c7:	48 05 80 2e 40 00    	add    rax,0x402e80
  8036cd:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  8036d1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8036d5:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8036dc:	48 85 c0             	test   rax,rax
  8036df:	75 27                	jne    803708 <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  8036e1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8036e4:	48 63 d0             	movsxd rdx,eax
  8036e7:	48 89 d0             	mov    rax,rdx
  8036ea:	48 01 c0             	add    rax,rax
  8036ed:	48 01 d0             	add    rax,rdx
  8036f0:	48 c1 e0 06          	shl    rax,0x6
  8036f4:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8036fb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8036ff:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  803706:	eb 75                	jmp    80377d <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  803708:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80370c:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803713:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  803717:	eb 0f                	jmp    803728 <make_request+0x1e1>
  803719:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80371d:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803724:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803728:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80372c:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803733:	48 85 c0             	test   rax,rax
  803736:	75 e1                	jne    803719 <make_request+0x1d2>
        p->next=&reqs[i];
  803738:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80373b:	48 63 d0             	movsxd rdx,eax
  80373e:	48 89 d0             	mov    rax,rdx
  803741:	48 01 c0             	add    rax,rax
  803744:	48 01 d0             	add    rax,rdx
  803747:	48 c1 e0 06          	shl    rax,0x6
  80374b:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803752:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803756:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  80375d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803760:	48 63 d0             	movsxd rdx,eax
  803763:	48 89 d0             	mov    rax,rdx
  803766:	48 01 c0             	add    rax,rax
  803769:	48 01 d0             	add    rax,rdx
  80376c:	48 c1 e0 06          	shl    rax,0x6
  803770:	48 05 38 6d 40 00    	add    rax,0x406d38
  803776:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  80377d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803780:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  803784:	c9                   	leave  
  803785:	c3                   	ret    

0000000000803786 <do_req>:
//取出一个申请并且执行
int do_req()
{
  803786:	f3 0f 1e fa          	endbr64 
  80378a:	55                   	push   rbp
  80378b:	48 89 e5             	mov    rbp,rsp
  80378e:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  803792:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803799:	e9 ab 00 00 00       	jmp    803849 <do_req+0xc3>
    {
        device* p=dev_tree[i];
  80379e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8037a1:	48 98                	cdqe   
  8037a3:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  8037aa:	00 
  8037ab:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  8037af:	e9 86 00 00 00       	jmp    80383a <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  8037b4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037b8:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  8037bf:	48 85 c0             	test   rax,rax
  8037c2:	75 67                	jne    80382b <do_req+0xa5>
  8037c4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037c8:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8037cf:	48 85 c0             	test   rax,rax
  8037d2:	74 57                	je     80382b <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  8037d4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037d8:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  8037df:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037e3:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  8037ea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037ee:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8037f5:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  8037fc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803800:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  803807:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80380b:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  803811:	48 98                	cdqe   
  803813:	48 8b 14 c5 a0 9e 80 	mov    rdx,QWORD PTR [rax*8+0x809ea0]
  80381a:	00 
  80381b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80381f:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803826:	48 89 c7             	mov    rdi,rax
  803829:	ff d2                	call   rdx
        for(;p;p=p->next)
  80382b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80382f:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  803836:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80383a:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  80383f:	0f 85 6f ff ff ff    	jne    8037b4 <do_req+0x2e>
    for(int i=0;i<3;i++)
  803845:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803849:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  80384d:	0f 8e 4b ff ff ff    	jle    80379e <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  803853:	b8 00 00 00 00       	mov    eax,0x0
}
  803858:	c9                   	leave  
  803859:	c3                   	ret    

000000000080385a <wait_on_req>:


void wait_on_req(int reqi)
{
  80385a:	f3 0f 1e fa          	endbr64 
  80385e:	55                   	push   rbp
  80385f:	48 89 e5             	mov    rbp,rsp
  803862:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  803865:	90                   	nop
  803866:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803869:	48 63 d0             	movsxd rdx,eax
  80386c:	48 89 d0             	mov    rax,rdx
  80386f:	48 01 c0             	add    rax,rax
  803872:	48 01 d0             	add    rax,rdx
  803875:	48 c1 e0 06          	shl    rax,0x6
  803879:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  80387f:	8b 00                	mov    eax,DWORD PTR [rax]
  803881:	83 f8 03             	cmp    eax,0x3
  803884:	75 e0                	jne    803866 <wait_on_req+0xc>
}
  803886:	90                   	nop
  803887:	90                   	nop
  803888:	5d                   	pop    rbp
  803889:	c3                   	ret    

000000000080388a <clear_req>:
void clear_req(int reqi)
{
  80388a:	f3 0f 1e fa          	endbr64 
  80388e:	55                   	push   rbp
  80388f:	48 89 e5             	mov    rbp,rsp
  803892:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  803895:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803898:	48 63 d0             	movsxd rdx,eax
  80389b:	48 89 d0             	mov    rax,rdx
  80389e:	48 01 c0             	add    rax,rax
  8038a1:	48 01 d0             	add    rax,rdx
  8038a4:	48 c1 e0 06          	shl    rax,0x6
  8038a8:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  8038ae:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  8038b4:	90                   	nop
  8038b5:	5d                   	pop    rbp
  8038b6:	c3                   	ret    

00000000008038b7 <init_proc>:
struct process task[MAX_PROC_COUNT];
TSS scene_saver;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  8038b7:	f3 0f 1e fa          	endbr64 
  8038bb:	55                   	push   rbp
  8038bc:	48 89 e5             	mov    rbp,rsp
  8038bf:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  8038c3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8038ca:	eb 4c                	jmp    803918 <init_proc+0x61>
        task[i].pid=-1;
  8038cc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038cf:	48 98                	cdqe   
  8038d1:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8038d8:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8038de:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  8038e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038e7:	48 98                	cdqe   
  8038e9:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8038f0:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8038f6:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  8038fc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038ff:	48 98                	cdqe   
  803901:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803908:	48 05 00 85 40 00    	add    rax,0x408500
  80390e:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803914:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803918:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80391c:	7e ae                	jle    8038cc <init_proc+0x15>
    }
    cur_proc=0;//no proc
  80391e:	c7 05 48 e7 c0 ff 00 	mov    DWORD PTR [rip+0xffffffffffc0e748],0x0        # 412070 <cur_proc>
  803925:	00 00 00 
    pidd=1;
  803928:	c7 05 42 e7 c0 ff 01 	mov    DWORD PTR [rip+0xffffffffffc0e742],0x1        # 412074 <pidd>
  80392f:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  803932:	b8 00 00 00 00       	mov    eax,0x0
  803937:	e8 38 00 00 00       	call   803974 <create_proc>
  80393c:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  80393f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803942:	48 98                	cdqe   
  803944:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80394b:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803951:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  803957:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80395a:	83 c0 03             	add    eax,0x3
  80395d:	c1 e0 04             	shl    eax,0x4
  803960:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  803963:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803966:	01 c0                	add    eax,eax
  803968:	83 c0 05             	add    eax,0x5
  80396b:	c1 e0 03             	shl    eax,0x3
  80396e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
}
  803971:	90                   	nop
  803972:	c9                   	leave  
  803973:	c3                   	ret    

0000000000803974 <create_proc>:

int create_proc()
{
  803974:	f3 0f 1e fa          	endbr64 
  803978:	55                   	push   rbp
  803979:	48 89 e5             	mov    rbp,rsp
  80397c:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  803980:	b8 00 00 00 00       	mov    eax,0x0
  803985:	e8 7d 00 00 00       	call   803a07 <req_proc>
  80398a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  80398d:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  803991:	75 07                	jne    80399a <create_proc+0x26>
  803993:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803998:	eb 6b                	jmp    803a05 <create_proc+0x91>
    int curesp=0x9fc00-1;
  80399a:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%esp,%0":"=m"(curesp));
  8039a1:	89 65 f8             	mov    DWORD PTR [rbp-0x8],esp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0,0,0,0,0x17,0xf,0x17,0x17,0x17,0x17,curesp,0,0,0,0,index);
  8039a4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8039a7:	48 98                	cdqe   
  8039a9:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8039ac:	52                   	push   rdx
  8039ad:	6a 00                	push   0x0
  8039af:	6a 00                	push   0x0
  8039b1:	6a 00                	push   0x0
  8039b3:	6a 00                	push   0x0
  8039b5:	50                   	push   rax
  8039b6:	6a 17                	push   0x17
  8039b8:	6a 17                	push   0x17
  8039ba:	6a 17                	push   0x17
  8039bc:	6a 17                	push   0x17
  8039be:	41 b9 0f 00 00 00    	mov    r9d,0xf
  8039c4:	41 b8 17 00 00 00    	mov    r8d,0x17
  8039ca:	b9 00 00 00 00       	mov    ecx,0x0
  8039cf:	ba 00 00 00 00       	mov    edx,0x0
  8039d4:	be 00 00 00 00       	mov    esi,0x0
  8039d9:	bf 00 00 00 00       	mov    edi,0x0
  8039de:	e8 f0 00 00 00       	call   803ad3 <set_proc>
  8039e3:	48 83 c4 50          	add    rsp,0x50
    task[index].tss.eip=(long)proc_zero;
  8039e7:	ba 57 3d 80 00       	mov    edx,0x803d57
  8039ec:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039ef:	48 98                	cdqe   
  8039f1:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8039f8:	48 05 70 86 40 00    	add    rax,0x408670
  8039fe:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx

    return index;
  803a02:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803a05:	c9                   	leave  
  803a06:	c3                   	ret    

0000000000803a07 <req_proc>:
int req_proc(){
  803a07:	f3 0f 1e fa          	endbr64 
  803a0b:	55                   	push   rbp
  803a0c:	48 89 e5             	mov    rbp,rsp
    int num=0;
  803a0f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803a16:	eb 04                	jmp    803a1c <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  803a18:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803a1c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a1f:	48 98                	cdqe   
  803a21:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803a28:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803a2e:	8b 00                	mov    eax,DWORD PTR [rax]
  803a30:	83 f8 ff             	cmp    eax,0xffffffff
  803a33:	74 1f                	je     803a54 <req_proc+0x4d>
  803a35:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a38:	48 98                	cdqe   
  803a3a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803a41:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803a47:	8b 00                	mov    eax,DWORD PTR [rax]
  803a49:	83 f8 03             	cmp    eax,0x3
  803a4c:	74 06                	je     803a54 <req_proc+0x4d>
  803a4e:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803a52:	7e c4                	jle    803a18 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  803a54:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803a58:	7e 07                	jle    803a61 <req_proc+0x5a>
        return -1;
  803a5a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803a5f:	eb 70                	jmp    803ad1 <req_proc+0xca>
    task[num].pid=pidd++;
  803a61:	8b 05 0d e6 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e60d]        # 412074 <pidd>
  803a67:	8d 50 01             	lea    edx,[rax+0x1]
  803a6a:	89 15 04 e6 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e604],edx        # 412074 <pidd>
  803a70:	89 c2                	mov    edx,eax
  803a72:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a75:	48 98                	cdqe   
  803a77:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803a7e:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803a84:	89 10                	mov    DWORD PTR [rax],edx
    task[num].stat=ENDED;
  803a86:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a89:	48 98                	cdqe   
  803a8b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803a92:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803a98:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  803a9e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803aa1:	48 98                	cdqe   
  803aa3:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803aaa:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803ab0:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803ab6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ab9:	48 98                	cdqe   
  803abb:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803ac2:	48 05 ac 84 40 00    	add    rax,0x4084ac
  803ac8:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  803ace:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803ad1:	5d                   	pop    rbp
  803ad2:	c3                   	ret    

0000000000803ad3 <set_proc>:
void set_proc(long eax,long ebx,long ecx,long edx,long es,long cs,long ss,long ds,long fs,long gs\
,long esp,long ebp,long esi,long edi,long eflags,int proc_nr){
  803ad3:	f3 0f 1e fa          	endbr64 
  803ad7:	55                   	push   rbp
  803ad8:	48 89 e5             	mov    rbp,rsp
  803adb:	48 83 ec 40          	sub    rsp,0x40
  803adf:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803ae3:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803ae7:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803aeb:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803aef:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  803af3:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803af7:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803afa:	48 98                	cdqe   
  803afc:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803b03:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803b09:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->tss.eax=eax;
  803b0d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b11:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803b15:	48 89 90 ec 01 00 00 	mov    QWORD PTR [rax+0x1ec],rdx
    proc->tss.ebx=ebx;
  803b1c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b20:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  803b24:	48 89 90 04 02 00 00 	mov    QWORD PTR [rax+0x204],rdx
    proc->tss.ecx=ecx;
  803b2b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b2f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803b33:	48 89 90 f4 01 00 00 	mov    QWORD PTR [rax+0x1f4],rdx
    proc->tss.edx=edx;
  803b3a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b3e:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  803b42:	48 89 90 fc 01 00 00 	mov    QWORD PTR [rax+0x1fc],rdx
    proc->tss.es=es;
  803b49:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b4d:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803b51:	48 89 90 2c 02 00 00 	mov    QWORD PTR [rax+0x22c],rdx
    proc->tss.cs=cs;
  803b58:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b5c:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803b60:	48 89 90 34 02 00 00 	mov    QWORD PTR [rax+0x234],rdx
    proc->tss.ss=ss;
  803b67:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b6b:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803b6f:	48 89 90 3c 02 00 00 	mov    QWORD PTR [rax+0x23c],rdx
    proc->tss.ss0=ss;
  803b76:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b7a:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803b7e:	48 89 90 ac 01 00 00 	mov    QWORD PTR [rax+0x1ac],rdx
    proc->tss.ss1=ss;
  803b85:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b89:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803b8d:	48 89 90 bc 01 00 00 	mov    QWORD PTR [rax+0x1bc],rdx
    proc->tss.ss2=ss;
  803b94:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b98:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803b9c:	48 89 90 cc 01 00 00 	mov    QWORD PTR [rax+0x1cc],rdx
    proc->tss.ds=ds;
  803ba3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ba7:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803bab:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    proc->tss.fs=fs;
  803bb2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bb6:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803bba:	48 89 90 4c 02 00 00 	mov    QWORD PTR [rax+0x24c],rdx
    proc->tss.gs=gs;
  803bc1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bc5:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803bc9:	48 89 90 54 02 00 00 	mov    QWORD PTR [rax+0x254],rdx
    proc->tss.esp=esp;
  803bd0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bd4:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803bd8:	48 89 90 0c 02 00 00 	mov    QWORD PTR [rax+0x20c],rdx
    proc->tss.esp0=esp;
  803bdf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803be3:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803be7:	48 89 90 a4 01 00 00 	mov    QWORD PTR [rax+0x1a4],rdx
    proc->tss.esp1=esp;
  803bee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bf2:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803bf6:	48 89 90 b4 01 00 00 	mov    QWORD PTR [rax+0x1b4],rdx
    proc->tss.esp2=esp;
  803bfd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c01:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803c05:	48 89 90 c4 01 00 00 	mov    QWORD PTR [rax+0x1c4],rdx
    proc->tss.ebp=ebp;
  803c0c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c10:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803c14:	48 89 90 14 02 00 00 	mov    QWORD PTR [rax+0x214],rdx
    proc->tss.esi=esi;
  803c1b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c1f:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803c23:	48 89 90 1c 02 00 00 	mov    QWORD PTR [rax+0x21c],rdx
    proc->tss.edi=edi;
  803c2a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c2e:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803c32:	48 89 90 24 02 00 00 	mov    QWORD PTR [rax+0x224],rdx
    proc->tss.eflags=0x202;//设置为默认值:0b 0010 0000 0010
  803c39:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c3d:	48 c7 80 e4 01 00 00 	mov    QWORD PTR [rax+0x1e4],0x202
  803c44:	02 02 00 00 
    //能接受中断
    proc->tss.eip=(long)proc_zero;
  803c48:	ba 57 3d 80 00       	mov    edx,0x803d57
  803c4d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c51:	48 89 90 dc 01 00 00 	mov    QWORD PTR [rax+0x1dc],rdx

    proc->tss.cs=cs;
  803c58:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c5c:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803c60:	48 89 90 34 02 00 00 	mov    QWORD PTR [rax+0x234],rdx
    proc->tss.ds=ds;
  803c67:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c6b:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803c6f:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    proc->tss.es=es;
  803c76:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c7a:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803c7e:	48 89 90 2c 02 00 00 	mov    QWORD PTR [rax+0x22c],rdx
    proc->tss.cr3=PAGE_INDEX_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803c85:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c89:	48 c7 80 d4 01 00 00 	mov    QWORD PTR [rax+0x1d4],0x1000
  803c90:	00 10 00 00 

    proc->tss.ldt= _LDT_IND(proc_nr)*8;
  803c94:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803c97:	83 c0 03             	add    eax,0x3
  803c9a:	c1 e0 04             	shl    eax,0x4
  803c9d:	48 63 d0             	movsxd rdx,eax
  803ca0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ca4:	48 89 90 5c 02 00 00 	mov    QWORD PTR [rax+0x25c],rdx
    //在gdt中添加tss
    fill_desc(&proc->tss,0xffff,SEG_SYS_TSS|SEG_PRESENT,_TSS_IND(proc_nr));
  803cab:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803cae:	01 c0                	add    eax,eax
  803cb0:	83 c0 05             	add    eax,0x5
  803cb3:	89 c2                	mov    edx,eax
  803cb5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803cb9:	48 05 9c 01 00 00    	add    rax,0x19c
  803cbf:	89 d1                	mov    ecx,edx
  803cc1:	ba 89 00 00 00       	mov    edx,0x89
  803cc6:	be ff ff 00 00       	mov    esi,0xffff
  803ccb:	89 c7                	mov    edi,eax
  803ccd:	e8 df 0d 00 00       	call   804ab1 <fill_desc>
    //添加ldt
    fill_desc(proc->ldt, sizeof(proc->ldt),SEG_SYS_LDT|SEG_PRESENT, _LDT_IND(proc_nr));
  803cd2:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803cd5:	83 c0 03             	add    eax,0x3
  803cd8:	01 c0                	add    eax,eax
  803cda:	89 c2                	mov    edx,eax
  803cdc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ce0:	48 83 c0 34          	add    rax,0x34
  803ce4:	89 d1                	mov    ecx,edx
  803ce6:	ba 82 00 00 00       	mov    edx,0x82
  803ceb:	be 28 00 00 00       	mov    esi,0x28
  803cf0:	89 c7                	mov    edi,eax
  803cf2:	e8 ba 0d 00 00       	call   804ab1 <fill_desc>
    //设置ldt
    fill_ldt_desc(0,0xffffffff,\
  803cf7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803cfb:	48 83 c0 34          	add    rax,0x34
  803cff:	48 89 c1             	mov    rcx,rax
  803d02:	ba fe cf 00 00       	mov    edx,0xcffe
  803d07:	be ff ff ff ff       	mov    esi,0xffffffff
  803d0c:	bf 00 00 00 00       	mov    edi,0x0
  803d11:	e8 c9 0e 00 00       	call   804bdf <fill_ldt_desc>
    SEG_CONFORMING_RW_CODE|SEG_DPL_3,&proc->ldt[0]);
    fill_ldt_desc(0,0xffffffff,\
  803d16:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d1a:	48 83 c0 3c          	add    rax,0x3c
  803d1e:	48 89 c1             	mov    rcx,rax
  803d21:	ba f2 cf 00 00       	mov    edx,0xcff2
  803d26:	be ff ff ff ff       	mov    esi,0xffffffff
  803d2b:	bf 00 00 00 00       	mov    edi,0x0
  803d30:	e8 aa 0e 00 00       	call   804bdf <fill_ldt_desc>
    SEG_RW_DATA|SEG_DPL_3,&proc->ldt[1]);
    fill_ldt_desc(0x1c00000-0x1000,0x1000,\
  803d35:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d39:	48 83 c0 44          	add    rax,0x44
  803d3d:	48 89 c1             	mov    rcx,rax
  803d40:	ba f6 00 00 00       	mov    edx,0xf6
  803d45:	be 00 10 00 00       	mov    esi,0x1000
  803d4a:	bf 00 f0 bf 01       	mov    edi,0x1bff000
  803d4f:	e8 8b 0e 00 00       	call   804bdf <fill_ldt_desc>
    SEG_STACK|SEG_DPL_3,&proc->ldt[2]);

}
  803d54:	90                   	nop
  803d55:	c9                   	leave  
  803d56:	c3                   	ret    

0000000000803d57 <proc_zero>:
void proc_zero()
{
  803d57:	f3 0f 1e fa          	endbr64 
  803d5b:	55                   	push   rbp
  803d5c:	48 89 e5             	mov    rbp,rsp

    while(1);
  803d5f:	eb fe                	jmp    803d5f <proc_zero+0x8>

0000000000803d61 <manage_proc>:
}
void manage_proc(){
  803d61:	f3 0f 1e fa          	endbr64 
  803d65:	55                   	push   rbp
  803d66:	48 89 e5             	mov    rbp,rsp
  803d69:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803d6d:	8b 05 fd e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e2fd]        # 412070 <cur_proc>
  803d73:	83 f8 ff             	cmp    eax,0xffffffff
  803d76:	74 2d                	je     803da5 <manage_proc+0x44>
        task[cur_proc].utime++;
  803d78:	8b 05 f2 e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e2f2]        # 412070 <cur_proc>
  803d7e:	48 63 d0             	movsxd rdx,eax
  803d81:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  803d88:	48 81 c2 a8 84 40 00 	add    rdx,0x4084a8
  803d8f:	8b 12                	mov    edx,DWORD PTR [rdx]
  803d91:	83 c2 01             	add    edx,0x1
  803d94:	48 98                	cdqe   
  803d96:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803d9d:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803da3:	89 10                	mov    DWORD PTR [rax],edx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803da5:	8b 05 c5 e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e2c5]        # 412070 <cur_proc>
  803dab:	83 f8 ff             	cmp    eax,0xffffffff
  803dae:	74 3c                	je     803dec <manage_proc+0x8b>
  803db0:	8b 05 ba e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e2ba]        # 412070 <cur_proc>
  803db6:	48 98                	cdqe   
  803db8:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803dbf:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803dc5:	8b 00                	mov    eax,DWORD PTR [rax]
  803dc7:	83 f8 01             	cmp    eax,0x1
  803dca:	77 20                	ja     803dec <manage_proc+0x8b>
    task[cur_proc].stat!=READY){
  803dcc:	8b 05 9e e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e29e]        # 412070 <cur_proc>
  803dd2:	48 98                	cdqe   
  803dd4:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803ddb:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803de1:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803de3:	83 f8 01             	cmp    eax,0x1
  803de6:	0f 84 90 00 00 00    	je     803e7c <manage_proc+0x11b>
        if(cur_proc!=-1)
  803dec:	8b 05 7e e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e27e]        # 412070 <cur_proc>
  803df2:	83 f8 ff             	cmp    eax,0xffffffff
  803df5:	74 1b                	je     803e12 <manage_proc+0xb1>
            task[cur_proc].utime=0;
  803df7:	8b 05 73 e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e273]        # 412070 <cur_proc>
  803dfd:	48 98                	cdqe   
  803dff:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803e06:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803e0c:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=0;
  803e12:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  803e19:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803e20:	eb 41                	jmp    803e63 <manage_proc+0x102>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803e22:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803e25:	48 98                	cdqe   
  803e27:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803e2e:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803e34:	8b 00                	mov    eax,DWORD PTR [rax]
  803e36:	83 f8 ff             	cmp    eax,0xffffffff
  803e39:	74 24                	je     803e5f <manage_proc+0xfe>
  803e3b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803e3e:	48 98                	cdqe   
  803e40:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803e47:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803e4d:	8b 00                	mov    eax,DWORD PTR [rax]
  803e4f:	83 f8 01             	cmp    eax,0x1
  803e52:	75 0b                	jne    803e5f <manage_proc+0xfe>
  803e54:	8b 05 16 e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e216]        # 412070 <cur_proc>
  803e5a:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  803e5d:	75 0c                	jne    803e6b <manage_proc+0x10a>
        for(i=0;i<MAX_PROC_COUNT;i++){
  803e5f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803e63:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803e67:	7e b9                	jle    803e22 <manage_proc+0xc1>
  803e69:	eb 01                	jmp    803e6c <manage_proc+0x10b>
                break;
  803e6b:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  803e6c:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803e70:	7f 0d                	jg     803e7f <manage_proc+0x11e>
            return;
        //switch
        switch_proc_tss(i);
  803e72:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803e75:	89 c7                	mov    edi,eax
  803e77:	e8 06 00 00 00       	call   803e82 <switch_proc_tss>
    }
    return;
  803e7c:	90                   	nop
  803e7d:	eb 01                	jmp    803e80 <manage_proc+0x11f>
            return;
  803e7f:	90                   	nop
}
  803e80:	c9                   	leave  
  803e81:	c3                   	ret    

0000000000803e82 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  803e82:	f3 0f 1e fa          	endbr64 
  803e86:	55                   	push   rbp
  803e87:	48 89 e5             	mov    rbp,rsp
  803e8a:	48 83 ec 20          	sub    rsp,0x20
  803e8e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  803e91:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803e94:	01 c0                	add    eax,eax
  803e96:	83 c0 05             	add    eax,0x5
  803e99:	c1 e0 03             	shl    eax,0x3
  803e9c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  803e9f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803ea2:	89 05 c8 e1 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e1c8],eax        # 412070 <cur_proc>
    switch_proc_asm(sel);
  803ea8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803eab:	89 c7                	mov    edi,eax
  803ead:	e8 c9 5e 00 00       	call   809d7b <switch_proc_asm>
}
  803eb2:	90                   	nop
  803eb3:	c9                   	leave  
  803eb4:	c3                   	ret    

0000000000803eb5 <switch_proc>:
void switch_proc(int pnr){
  803eb5:	f3 0f 1e fa          	endbr64 
  803eb9:	55                   	push   rbp
  803eba:	48 89 e5             	mov    rbp,rsp
  803ebd:	48 81 ec 80 02 00 00 	sub    rsp,0x280
  803ec4:	89 bd 8c fd ff ff    	mov    DWORD PTR [rbp-0x274],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  803eca:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803ed0:	48 98                	cdqe   
  803ed2:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803ed9:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803ee0:	48 8d 85 90 fd ff ff 	lea    rax,[rbp-0x270]
  803ee7:	b9 4d 00 00 00       	mov    ecx,0x4d
  803eec:	48 89 c7             	mov    rdi,rax
  803eef:	48 89 d6             	mov    rsi,rdx
  803ef2:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
  803ef5:	48 89 f2             	mov    rdx,rsi
  803ef8:	48 89 f8             	mov    rax,rdi
  803efb:	8b 0a                	mov    ecx,DWORD PTR [rdx]
  803efd:	89 08                	mov    DWORD PTR [rax],ecx
    save_context(&task[cur_proc].tss);
  803eff:	8b 05 6b e1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e16b]        # 412070 <cur_proc>
  803f05:	48 98                	cdqe   
  803f07:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803f0e:	48 05 90 01 00 00    	add    rax,0x190
  803f14:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803f1a:	48 83 c0 0c          	add    rax,0xc
  803f1e:	48 89 c7             	mov    rdi,rax
  803f21:	e8 69 00 00 00       	call   803f8f <save_context>
    //重新设置0号进程
    task[0].tss.eip=proc_zero;
  803f26:	b8 57 3d 80 00       	mov    eax,0x803d57
  803f2b:	48 89 05 4a 47 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc0474a],rax        # 40867c <task+0x1dc>
    task[0].tss.cr3=PAGE_INDEX_ADDR;
  803f32:	48 c7 05 37 47 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc04737],0x1000        # 408674 <task+0x1d4>
  803f39:	00 10 00 00 
    task[0].tss.eflags=0x202;
  803f3d:	48 c7 05 3c 47 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc0473c],0x202        # 408684 <task+0x1e4>
  803f44:	02 02 00 00 
    cur_proc=pnr;
  803f48:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803f4e:	89 05 1c e1 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e11c],eax        # 412070 <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  803f54:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803f5a:	01 c0                	add    eax,eax
  803f5c:	83 c0 05             	add    eax,0x5
  803f5f:	c1 e0 03             	shl    eax,0x3
  803f62:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(&task[pnr].tss);
  803f65:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803f6b:	48 98                	cdqe   
  803f6d:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803f74:	48 05 90 01 00 00    	add    rax,0x190
  803f7a:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803f80:	48 83 c0 0c          	add    rax,0xc
  803f84:	48 89 c7             	mov    rdi,rax
  803f87:	e8 0c 5e 00 00       	call   809d98 <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  803f8c:	90                   	nop
  803f8d:	c9                   	leave  
  803f8e:	c3                   	ret    

0000000000803f8f <save_context>:
void save_context(TSS *tss)
{
  803f8f:	f3 0f 1e fa          	endbr64 
  803f93:	55                   	push   rbp
  803f94:	48 89 e5             	mov    rbp,rsp
  803f97:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    tss->eip=scene_saver.eip;
  803f9b:	48 8b 15 3e e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e03e]        # 411fe0 <scene_saver+0x40>
  803fa2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803fa6:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    tss->eax=scene_saver.eax;
  803faa:	48 8b 15 3f e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e03f]        # 411ff0 <scene_saver+0x50>
  803fb1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803fb5:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    tss->ebx=scene_saver.ebx;
  803fb9:	48 8b 15 48 e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e048]        # 412008 <scene_saver+0x68>
  803fc0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803fc4:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    tss->ecx=scene_saver.ecx;
  803fc8:	48 8b 15 29 e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e029]        # 411ff8 <scene_saver+0x58>
  803fcf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803fd3:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
    tss->edx=scene_saver.edx;
  803fd7:	48 8b 15 22 e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e022]        # 412000 <scene_saver+0x60>
  803fde:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803fe2:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    tss->esi=scene_saver.esi;
  803fe6:	48 8b 15 33 e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e033]        # 412020 <scene_saver+0x80>
  803fed:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ff1:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    tss->edi=scene_saver.edi;
  803ff8:	48 8b 15 29 e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e029]        # 412028 <scene_saver+0x88>
  803fff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804003:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
    tss->eflags=scene_saver.eflags;
  80400a:	48 8b 15 d7 df c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0dfd7]        # 411fe8 <scene_saver+0x48>
  804011:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804015:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    tss->esp=scene_saver.esp;
  804019:	48 8b 15 f0 df c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0dff0]        # 412010 <scene_saver+0x70>
  804020:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804024:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    tss->ebp=scene_saver.ebp;
  804028:	48 8b 15 e9 df c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0dfe9]        # 412018 <scene_saver+0x78>
  80402f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804033:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
}
  804037:	90                   	nop
  804038:	5d                   	pop    rbp
  804039:	c3                   	ret    

000000000080403a <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  80403a:	f3 0f 1e fa          	endbr64 
  80403e:	55                   	push   rbp
  80403f:	48 89 e5             	mov    rbp,rsp
  804042:	48 83 ec 60          	sub    rsp,0x60
  804046:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  804049:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  80404c:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  80404f:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804055:	85 c0                	test   eax,eax
  804057:	0f 48 c2             	cmovs  eax,edx
  80405a:	c1 f8 0c             	sar    eax,0xc
  80405d:	89 c1                	mov    ecx,eax
  80405f:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  804062:	99                   	cdq    
  804063:	c1 ea 14             	shr    edx,0x14
  804066:	01 d0                	add    eax,edx
  804068:	25 ff 0f 00 00       	and    eax,0xfff
  80406d:	29 d0                	sub    eax,edx
  80406f:	01 c8                	add    eax,ecx
  804071:	85 c0                	test   eax,eax
  804073:	0f 95 c0             	setne  al
  804076:	0f b6 c0             	movzx  eax,al
  804079:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  80407c:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  804083:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80408a:	00 
    page_item *pgind=task[proc_index].tss.cr3;
  80408b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80408e:	48 98                	cdqe   
  804090:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804097:	48 05 60 86 40 00    	add    rax,0x408660
  80409d:	48 8b 40 14          	mov    rax,QWORD PTR [rax+0x14]
  8040a1:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    pgind++;
  8040a5:	48 83 45 e8 08       	add    QWORD PTR [rbp-0x18],0x8
    for(int i=1;i<1024;i++)
  8040aa:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x1
  8040b1:	e9 39 02 00 00       	jmp    8042ef <palloc+0x2b5>
    {
        page_item* tblp=*pgind&0xfffff000;
  8040b6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8040ba:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8040bd:	25 00 f0 ff ff       	and    eax,0xfffff000
  8040c2:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        for(int j=0;j<1024;j++)
  8040c6:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
  8040cd:	e9 07 02 00 00       	jmp    8042d9 <palloc+0x29f>
        {
            int v=*tblp&PAGE_PRESENT;
  8040d2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8040d6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8040d9:	83 e0 01             	and    eax,0x1
  8040dc:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
            if(!v)
  8040df:	83 7d d0 00          	cmp    DWORD PTR [rbp-0x30],0x0
  8040e3:	0f 85 e7 01 00 00    	jne    8042d0 <palloc+0x296>
            {
                int new_pg=req_a_page();
  8040e9:	b8 00 00 00 00       	mov    eax,0x0
  8040ee:	e8 65 d2 ff ff       	call   801358 <req_a_page>
  8040f3:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
                if(new_pg==-1)
  8040f6:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  8040fa:	0f 85 b9 00 00 00    	jne    8041b9 <palloc+0x17f>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804100:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804103:	48 98                	cdqe   
  804105:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80410c:	48 05 e4 84 40 00    	add    rax,0x4084e4
  804112:	0f b7 00             	movzx  eax,WORD PTR [rax]
  804115:	0f b7 c0             	movzx  eax,ax
  804118:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  80411b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80411e:	48 98                	cdqe   
  804120:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804127:	48 05 e0 84 40 00    	add    rax,0x4084e0
  80412d:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804131:	0f b7 c0             	movzx  eax,ax
  804134:	c1 e0 10             	shl    eax,0x10
  804137:	25 00 00 0f 00       	and    eax,0xf0000
  80413c:	01 45 b8             	add    DWORD PTR [rbp-0x48],eax
                    size+=c;
  80413f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804142:	01 45 b8             	add    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  804145:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804148:	89 c2                	mov    edx,eax
  80414a:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80414d:	48 98                	cdqe   
  80414f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804156:	48 05 e4 84 40 00    	add    rax,0x4084e4
  80415c:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  80415f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804162:	48 98                	cdqe   
  804164:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80416b:	48 05 e0 84 40 00    	add    rax,0x4084e0
  804171:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804175:	0f b7 c0             	movzx  eax,ax
  804178:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    tmp_attr&=0xfff0;
  80417b:	81 65 b4 f0 ff 00 00 	and    DWORD PTR [rbp-0x4c],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804182:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804185:	c1 e8 10             	shr    eax,0x10
  804188:	83 e0 0f             	and    eax,0xf
  80418b:	89 c2                	mov    edx,eax
  80418d:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  804190:	01 d0                	add    eax,edx
  804192:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  804195:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  804198:	89 c2                	mov    edx,eax
  80419a:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80419d:	48 98                	cdqe   
  80419f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8041a6:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8041ac:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  8041b0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041b4:	e9 48 01 00 00       	jmp    804301 <palloc+0x2c7>
                }
                int addr=get_phyaddr(new_pg);
  8041b9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8041bc:	89 c7                	mov    edi,eax
  8041be:	e8 02 d3 ff ff       	call   8014c5 <get_phyaddr>
  8041c3:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  8041c6:	8b 4d c8             	mov    ecx,DWORD PTR [rbp-0x38]
  8041c9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8041cd:	ba 07 00 00 00       	mov    edx,0x7
  8041d2:	89 ce                	mov    esi,ecx
  8041d4:	48 89 c7             	mov    rdi,rax
  8041d7:	e8 fc d2 ff ff       	call   8014d8 <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  8041dc:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8041df:	c1 e0 0a             	shl    eax,0xa
  8041e2:	89 c2                	mov    edx,eax
  8041e4:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8041e7:	01 d0                	add    eax,edx
  8041e9:	c1 e0 0c             	shl    eax,0xc
  8041ec:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                if(ptr==NULL)
  8041ef:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8041f4:	75 12                	jne    804208 <palloc+0x1ce>
                {
                    ptr=laddr;
  8041f6:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8041f9:	48 98                	cdqe   
  8041fb:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
                    palloc_paddr=addr;
  8041ff:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  804202:	89 05 70 de c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0de70],eax        # 412078 <palloc_paddr>
                }
                page_c--;
  804208:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  80420c:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  804210:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  804214:	0f 85 b6 00 00 00    	jne    8042d0 <palloc+0x296>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  80421a:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80421d:	48 98                	cdqe   
  80421f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804226:	48 05 e4 84 40 00    	add    rax,0x4084e4
  80422c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80422f:	0f b7 c0             	movzx  eax,ax
  804232:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804235:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804238:	48 98                	cdqe   
  80423a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804241:	48 05 e0 84 40 00    	add    rax,0x4084e0
  804247:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80424b:	0f b7 c0             	movzx  eax,ax
  80424e:	c1 e0 10             	shl    eax,0x10
  804251:	25 00 00 0f 00       	and    eax,0xf0000
  804256:	01 45 c0             	add    DWORD PTR [rbp-0x40],eax
                    size+=c;
  804259:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80425c:	01 45 c0             	add    DWORD PTR [rbp-0x40],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  80425f:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  804262:	89 c2                	mov    edx,eax
  804264:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804267:	48 98                	cdqe   
  804269:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804270:	48 05 e4 84 40 00    	add    rax,0x4084e4
  804276:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  804279:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80427c:	48 98                	cdqe   
  80427e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804285:	48 05 e0 84 40 00    	add    rax,0x4084e0
  80428b:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80428f:	0f b7 c0             	movzx  eax,ax
  804292:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    tmp_attr&=0xfff0;
  804295:	81 65 bc f0 ff 00 00 	and    DWORD PTR [rbp-0x44],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  80429c:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  80429f:	c1 e8 10             	shr    eax,0x10
  8042a2:	83 e0 0f             	and    eax,0xf
  8042a5:	89 c2                	mov    edx,eax
  8042a7:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8042aa:	01 d0                	add    eax,edx
  8042ac:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  8042af:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8042b2:	89 c2                	mov    edx,eax
  8042b4:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8042b7:	48 98                	cdqe   
  8042b9:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8042c0:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8042c6:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
                    return ptr;
  8042ca:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8042ce:	eb 31                	jmp    804301 <palloc+0x2c7>
                }
            }
            tblp++;
  8042d0:	48 83 45 d8 08       	add    QWORD PTR [rbp-0x28],0x8
        for(int j=0;j<1024;j++)
  8042d5:	83 45 d4 01          	add    DWORD PTR [rbp-0x2c],0x1
  8042d9:	81 7d d4 ff 03 00 00 	cmp    DWORD PTR [rbp-0x2c],0x3ff
  8042e0:	0f 8e ec fd ff ff    	jle    8040d2 <palloc+0x98>
        }
        pgind++;
  8042e6:	48 83 45 e8 08       	add    QWORD PTR [rbp-0x18],0x8
    for(int i=1;i<1024;i++)
  8042eb:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
  8042ef:	81 7d e4 ff 03 00 00 	cmp    DWORD PTR [rbp-0x1c],0x3ff
  8042f6:	0f 8e ba fd ff ff    	jle    8040b6 <palloc+0x7c>
    }
    return NULL;
  8042fc:	b8 00 00 00 00       	mov    eax,0x0
}
  804301:	c9                   	leave  
  804302:	c3                   	ret    

0000000000804303 <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  804303:	f3 0f 1e fa          	endbr64 
  804307:	55                   	push   rbp
  804308:	48 89 e5             	mov    rbp,rsp
  80430b:	48 83 ec 10          	sub    rsp,0x10
  80430f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  804312:	8b 05 58 dd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dd58]        # 412070 <cur_proc>
  804318:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80431b:	89 d6                	mov    esi,edx
  80431d:	89 c7                	mov    edi,eax
  80431f:	e8 16 fd ff ff       	call   80403a <palloc>
}
  804324:	c9                   	leave  
  804325:	c3                   	ret    

0000000000804326 <proc_end>:
void proc_end()
{
  804326:	f3 0f 1e fa          	endbr64 
  80432a:	55                   	push   rbp
  80432b:	48 89 e5             	mov    rbp,rsp
  80432e:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  804332:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
  804335:	48 8b 05 70 43 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc04370]        # 4086ac <task+0x20c>
  80433c:	48 89 c4             	mov    rsp,rax
    del_proc(cur_proc);
  80433f:	8b 05 2b dd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dd2b]        # 412070 <cur_proc>
  804345:	89 c7                	mov    edi,eax
  804347:	e8 75 00 00 00       	call   8043c1 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  80434c:	8b 05 1e dd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dd1e]        # 412070 <cur_proc>
  804352:	48 98                	cdqe   
  804354:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80435b:	48 05 00 85 40 00    	add    rax,0x408500
  804361:	8b 00                	mov    eax,DWORD PTR [rax]
  804363:	83 f8 ff             	cmp    eax,0xffffffff
  804366:	74 4c                	je     8043b4 <proc_end+0x8e>
        task[task[cur_proc].parent_pid].stat=READY;
  804368:	8b 05 02 dd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dd02]        # 412070 <cur_proc>
  80436e:	48 98                	cdqe   
  804370:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804377:	48 05 00 85 40 00    	add    rax,0x408500
  80437d:	8b 00                	mov    eax,DWORD PTR [rax]
  80437f:	89 c0                	mov    eax,eax
  804381:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804388:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80438e:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  804394:	8b 05 d6 dc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dcd6]        # 412070 <cur_proc>
  80439a:	48 98                	cdqe   
  80439c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8043a3:	48 05 00 85 40 00    	add    rax,0x408500
  8043a9:	8b 00                	mov    eax,DWORD PTR [rax]
  8043ab:	89 c7                	mov    edi,eax
  8043ad:	e8 d0 fa ff ff       	call   803e82 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  8043b2:	eb 0a                	jmp    8043be <proc_end+0x98>
        switch_proc_tss(0);
  8043b4:	bf 00 00 00 00       	mov    edi,0x0
  8043b9:	e8 c4 fa ff ff       	call   803e82 <switch_proc_tss>
}
  8043be:	90                   	nop
  8043bf:	c9                   	leave  
  8043c0:	c3                   	ret    

00000000008043c1 <del_proc>:
void del_proc(int pnr)
{
  8043c1:	f3 0f 1e fa          	endbr64 
  8043c5:	55                   	push   rbp
  8043c6:	48 89 e5             	mov    rbp,rsp
  8043c9:	48 83 ec 30          	sub    rsp,0x30
  8043cd:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  8043d0:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8043d3:	48 98                	cdqe   
  8043d5:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8043dc:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8043e2:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  8043e8:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8043eb:	48 98                	cdqe   
  8043ed:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8043f4:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8043fa:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p=task[pnr].tss.cr3;
  804400:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804403:	48 98                	cdqe   
  804405:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80440c:	48 05 60 86 40 00    	add    rax,0x408660
  804412:	48 8b 40 14          	mov    rax,QWORD PTR [rax+0x14]
  804416:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    p++;
  80441a:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  80441f:	eb 63                	jmp    804484 <del_proc+0xc3>
    {
        page_item *tp=*p&0xfffff000;
  804421:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804425:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804428:	25 00 f0 ff ff       	and    eax,0xfffff000
  80442d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  804431:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804438:	eb 30                	jmp    80446a <del_proc+0xa9>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  80443a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80443e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804441:	83 e0 01             	and    eax,0x1
  804444:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  804447:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  80444b:	74 14                	je     804461 <del_proc+0xa0>
            {
                free_page(*tp&0xfffff000);
  80444d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804451:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804454:	25 00 f0 ff ff       	and    eax,0xfffff000
  804459:	48 89 c7             	mov    rdi,rax
  80445c:	e8 a3 cf ff ff       	call   801404 <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  804461:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  804466:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80446a:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804471:	7e c7                	jle    80443a <del_proc+0x79>
        }
        vmfree(tp);
  804473:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804477:	48 89 c7             	mov    rdi,rax
  80447a:	e8 0f cd ff ff       	call   80118e <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  80447f:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  804484:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804488:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80448b:	83 e0 01             	and    eax,0x1
  80448e:	48 85 c0             	test   rax,rax
  804491:	75 8e                	jne    804421 <del_proc+0x60>
    }
    //释放存放页目录的页面
    vmfree(p);
  804493:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804497:	48 89 c7             	mov    rdi,rax
  80449a:	e8 ef cc ff ff       	call   80118e <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  80449f:	90                   	nop
  8044a0:	c9                   	leave  
  8044a1:	c3                   	ret    

00000000008044a2 <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  8044a2:	f3 0f 1e fa          	endbr64 
  8044a6:	55                   	push   rbp
  8044a7:	48 89 e5             	mov    rbp,rsp
  8044aa:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8044ad:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  8044b0:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8044b4:	75 07                	jne    8044bd <set_proc_stat+0x1b>
  8044b6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8044bb:	eb 79                	jmp    804536 <set_proc_stat+0x94>
    int i=0;
  8044bd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  8044c4:	eb 04                	jmp    8044ca <set_proc_stat+0x28>
  8044c6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8044ca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8044cd:	48 98                	cdqe   
  8044cf:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8044d6:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8044dc:	8b 10                	mov    edx,DWORD PTR [rax]
  8044de:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8044e1:	39 c2                	cmp    edx,eax
  8044e3:	75 e1                	jne    8044c6 <set_proc_stat+0x24>
    if(i==MAX_PROC_COUNT)return -1;
  8044e5:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8044e9:	75 07                	jne    8044f2 <set_proc_stat+0x50>
  8044eb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8044f0:	eb 44                	jmp    804536 <set_proc_stat+0x94>
    task[i].stat=stat;
  8044f2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8044f5:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8044f8:	48 63 d2             	movsxd rdx,edx
  8044fb:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  804502:	48 81 c2 a4 84 40 00 	add    rdx,0x4084a4
  804509:	89 02                	mov    DWORD PTR [rdx],eax
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  80450b:	8b 05 5f db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0db5f]        # 412070 <cur_proc>
  804511:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804514:	75 1b                	jne    804531 <set_proc_stat+0x8f>
        task[cur_proc].utime=MAX_UTIME;
  804516:	8b 05 54 db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0db54]        # 412070 <cur_proc>
  80451c:	48 98                	cdqe   
  80451e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804525:	48 05 a8 84 40 00    	add    rax,0x4084a8
  80452b:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  804531:	b8 00 00 00 00       	mov    eax,0x0
}
  804536:	5d                   	pop    rbp
  804537:	c3                   	ret    

0000000000804538 <add_proc_openf>:

    return 0;
} */

int add_proc_openf(vfs_dir_entry *entry)
{
  804538:	f3 0f 1e fa          	endbr64 
  80453c:	55                   	push   rbp
  80453d:	48 89 e5             	mov    rbp,rsp
  804540:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804544:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80454b:	eb 69                	jmp    8045b6 <add_proc_openf+0x7e>
        if(task[cur_proc].openf[i]==NULL)
  80454d:	8b 05 1d db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0db1d]        # 412070 <cur_proc>
  804553:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804556:	48 63 d2             	movsxd rdx,edx
  804559:	48 83 c2 12          	add    rdx,0x12
  80455d:	48 98                	cdqe   
  80455f:	48 c1 e2 03          	shl    rdx,0x3
  804563:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80456a:	48 01 d0             	add    rax,rdx
  80456d:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804573:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804577:	48 85 c0             	test   rax,rax
  80457a:	75 36                	jne    8045b2 <add_proc_openf+0x7a>
        {
            task[cur_proc].openf[i]=entry;
  80457c:	8b 05 ee da c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0daee]        # 412070 <cur_proc>
  804582:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804585:	48 63 d2             	movsxd rdx,edx
  804588:	48 83 c2 12          	add    rdx,0x12
  80458c:	48 98                	cdqe   
  80458e:	48 c1 e2 03          	shl    rdx,0x3
  804592:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804599:	48 01 d0             	add    rax,rdx
  80459c:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  8045a3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8045a7:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
            return 0;
  8045ab:	b8 00 00 00 00       	mov    eax,0x0
  8045b0:	eb 0f                	jmp    8045c1 <add_proc_openf+0x89>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8045b2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8045b6:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8045ba:	7e 91                	jle    80454d <add_proc_openf+0x15>
        }
    }
    return -1;//full
  8045bc:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8045c1:	5d                   	pop    rbp
  8045c2:	c3                   	ret    

00000000008045c3 <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  8045c3:	f3 0f 1e fa          	endbr64 
  8045c7:	55                   	push   rbp
  8045c8:	48 89 e5             	mov    rbp,rsp
  8045cb:	48 83 ec 10          	sub    rsp,0x10
  8045cf:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  8045d2:	8b 05 98 da c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0da98]        # 412070 <cur_proc>
  8045d8:	89 c7                	mov    edi,eax
  8045da:	e8 e2 fd ff ff       	call   8043c1 <del_proc>
    return code;
  8045df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8045e2:	c9                   	leave  
  8045e3:	c3                   	ret    

00000000008045e4 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(int entry, vfs_dir_entry *cwd, vfs_dir_entry *exef)
{
  8045e4:	f3 0f 1e fa          	endbr64 
  8045e8:	55                   	push   rbp
  8045e9:	48 89 e5             	mov    rbp,rsp
  8045ec:	48 83 ec 40          	sub    rsp,0x40
  8045f0:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  8045f3:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  8045f7:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    
    int i=req_proc();
  8045fb:	b8 00 00 00 00       	mov    eax,0x0
  804600:	e8 02 f4 ff ff       	call   803a07 <req_proc>
  804605:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(i==-1)return -1;
  804608:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  80460c:	75 0a                	jne    804618 <reg_proc+0x34>
  80460e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804613:	e9 80 01 00 00       	jmp    804798 <reg_proc+0x1b4>
    /*set_proc(0,0,0,0,SEL_LDT_DATA,SEL_LDT_CODE,SEL_LDT_STACK,SEL_LDT_DATA\
    ,SEL_LDT_DATA,SEL_LDT_DATA,0x1c00000-4,0,0,0,0,i);*/
    set_proc(0,0,0,0,0x10,0x8,0x10,0x10\
  804618:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80461b:	50                   	push   rax
  80461c:	6a 00                	push   0x0
  80461e:	6a 00                	push   0x0
  804620:	6a 00                	push   0x0
  804622:	6a 00                	push   0x0
  804624:	68 fc ff bf 01       	push   0x1bffffc
  804629:	6a 10                	push   0x10
  80462b:	6a 10                	push   0x10
  80462d:	6a 10                	push   0x10
  80462f:	6a 10                	push   0x10
  804631:	41 b9 08 00 00 00    	mov    r9d,0x8
  804637:	41 b8 10 00 00 00    	mov    r8d,0x10
  80463d:	b9 00 00 00 00       	mov    ecx,0x0
  804642:	ba 00 00 00 00       	mov    edx,0x0
  804647:	be 00 00 00 00       	mov    esi,0x0
  80464c:	bf 00 00 00 00       	mov    edi,0x0
  804651:	e8 7d f4 ff ff       	call   803ad3 <set_proc>
  804656:	48 83 c4 50          	add    rsp,0x50
    ,0x10,0x10,0x1c00000-4,0,0,0,0,i);
    task[i].pdet=vmalloc();
  80465a:	b8 00 00 00 00       	mov    eax,0x0
  80465f:	e8 9b ca ff ff       	call   8010ff <vmalloc>
  804664:	48 89 c2             	mov    rdx,rax
  804667:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80466a:	48 98                	cdqe   
  80466c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804673:	48 05 20 85 40 00    	add    rax,0x408520
  804679:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    int *pt=vmalloc();
  80467d:	b8 00 00 00 00       	mov    eax,0x0
  804682:	e8 78 ca ff ff       	call   8010ff <vmalloc>
  804687:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    task[i].pdet[0]=PAGE_TABLE_ADDR|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;
  80468b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80468e:	48 98                	cdqe   
  804690:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804697:	48 05 20 85 40 00    	add    rax,0x408520
  80469d:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8046a1:	c7 00 07 20 00 00    	mov    DWORD PTR [rax],0x2007
    /*for(int j=0;j<32;j++)
        pt[j]=(PAGE_TABLE_ADDR+j*0x1000)|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;//复制内核页表*/
    //PAGE_TABLE_ADDR|PAGE_PRESENT;//复制内核页表
    //task[i].pdet[7]=PAGE_TABLE_ADDR+7*0x1000|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//sys.dll
    int *stackb=vmalloc();
  8046a7:	b8 00 00 00 00       	mov    eax,0x0
  8046ac:	e8 4e ca ff ff       	call   8010ff <vmalloc>
  8046b1:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    task[i].pdet[6]=(int)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  8046b5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8046b9:	83 c8 07             	or     eax,0x7
  8046bc:	89 c2                	mov    edx,eax
  8046be:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046c1:	48 98                	cdqe   
  8046c3:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8046ca:	48 05 20 85 40 00    	add    rax,0x408520
  8046d0:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8046d4:	48 83 c0 18          	add    rax,0x18
  8046d8:	89 10                	mov    DWORD PTR [rax],edx
    stackb[1023]=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  8046da:	b8 00 00 00 00       	mov    eax,0x0
  8046df:	e8 74 cc ff ff       	call   801358 <req_a_page>
  8046e4:	89 c7                	mov    edi,eax
  8046e6:	e8 da cd ff ff       	call   8014c5 <get_phyaddr>
  8046eb:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8046ef:	48 81 c2 fc 0f 00 00 	add    rdx,0xffc
  8046f6:	83 c8 07             	or     eax,0x7
  8046f9:	89 02                	mov    DWORD PTR [rdx],eax
    task[i].tss.cr3=task[i].pdet;
  8046fb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046fe:	48 98                	cdqe   
  804700:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804707:	48 05 20 85 40 00    	add    rax,0x408520
  80470d:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804711:	48 89 c2             	mov    rdx,rax
  804714:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804717:	48 98                	cdqe   
  804719:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804720:	48 05 60 86 40 00    	add    rax,0x408660
  804726:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx

    task[i].stat=READY;
  80472a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80472d:	48 98                	cdqe   
  80472f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804736:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80473c:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  804742:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804745:	48 98                	cdqe   
  804747:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80474e:	48 8d 90 20 85 40 00 	lea    rdx,[rax+0x408520]
  804755:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804759:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    task[i].exef=exef;
  80475d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804760:	48 98                	cdqe   
  804762:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804769:	48 8d 90 30 85 40 00 	lea    rdx,[rax+0x408530]
  804770:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  804774:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].tss.ds=0x10;
    task[i].tss.ss=0x10;
    task[i].tss.gs=0x10;
    task[i].tss.fs=0x10;
    task[i].tss.cs=0x8;*/
    task[i].tss.eip=entry;
  804778:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80477b:	48 98                	cdqe   
  80477d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804780:	48 63 d2             	movsxd rdx,edx
  804783:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  80478a:	48 81 c2 70 86 40 00 	add    rdx,0x408670
  804791:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    return i;
  804795:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  804798:	c9                   	leave  
  804799:	c3                   	ret    

000000000080479a <sys_malloc>:

void * sys_malloc(int size)
{
  80479a:	f3 0f 1e fa          	endbr64 
  80479e:	55                   	push   rbp
  80479f:	48 89 e5             	mov    rbp,rsp
  8047a2:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  8047a5:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8047a8:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8047ae:	85 c0                	test   eax,eax
  8047b0:	0f 48 c2             	cmovs  eax,edx
  8047b3:	c1 f8 0c             	sar    eax,0xc
  8047b6:	89 c1                	mov    ecx,eax
  8047b8:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8047bb:	99                   	cdq    
  8047bc:	c1 ea 14             	shr    edx,0x14
  8047bf:	01 d0                	add    eax,edx
  8047c1:	25 ff 0f 00 00       	and    eax,0xfff
  8047c6:	29 d0                	sub    eax,edx
  8047c8:	01 c8                	add    eax,ecx
  8047ca:	85 c0                	test   eax,eax
  8047cc:	0f 95 c0             	setne  al
  8047cf:	0f b6 c0             	movzx  eax,al
  8047d2:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  8047d5:	8b 05 95 d8 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d895]        # 412070 <cur_proc>
  8047db:	48 98                	cdqe   
  8047dd:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8047e4:	48 05 b4 84 40 00    	add    rax,0x4084b4
  8047ea:	8b 00                	mov    eax,DWORD PTR [rax]
  8047ec:	48 98                	cdqe   
  8047ee:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  8047f2:	eb 0c                	jmp    804800 <sys_malloc+0x66>
        hp=hp->next;
  8047f4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047f8:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8047fc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804800:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804804:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804808:	48 85 c0             	test   rax,rax
  80480b:	74 16                	je     804823 <sys_malloc+0x89>
  80480d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804811:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804814:	85 c0                	test   eax,eax
  804816:	75 0b                	jne    804823 <sys_malloc+0x89>
  804818:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80481c:	8b 00                	mov    eax,DWORD PTR [rax]
  80481e:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804821:	7e d1                	jle    8047f4 <sys_malloc+0x5a>
    if(hp->pgn<n)
  804823:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804827:	8b 00                	mov    eax,DWORD PTR [rax]
  804829:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  80482c:	7e 7f                	jle    8048ad <sys_malloc+0x113>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  80482e:	8b 05 3c d8 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d83c]        # 412070 <cur_proc>
  804834:	48 98                	cdqe   
  804836:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80483d:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804843:	8b 10                	mov    edx,DWORD PTR [rax]
  804845:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804848:	c1 e0 0c             	shl    eax,0xc
  80484b:	01 d0                	add    eax,edx
  80484d:	3d ff ff ef 01       	cmp    eax,0x1efffff
  804852:	7e 0a                	jle    80485e <sys_malloc+0xc4>
        {
            //超过顶部
            return NULL;
  804854:	b8 00 00 00 00       	mov    eax,0x0
  804859:	e9 c8 00 00 00       	jmp    804926 <sys_malloc+0x18c>
        }
        int needed=n-hp->pgn;
  80485e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804862:	8b 10                	mov    edx,DWORD PTR [rax]
  804864:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804867:	29 d0                	sub    eax,edx
  804869:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  80486c:	8b 05 fe d7 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d7fe]        # 412070 <cur_proc>
  804872:	48 98                	cdqe   
  804874:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80487b:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804881:	8b 00                	mov    eax,DWORD PTR [rax]
  804883:	48 98                	cdqe   
  804885:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804889:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804890:	eb 13                	jmp    8048a5 <sys_malloc+0x10b>
        {
            *p=0;//触发缺页中断
  804892:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804896:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  804899:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  8048a0:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  8048a1:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8048a5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8048a8:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8048ab:	7c e5                	jl     804892 <sys_malloc+0xf8>
        }
    }
    if(hp->pgn>n)
  8048ad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048b1:	8b 00                	mov    eax,DWORD PTR [rax]
  8048b3:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8048b6:	7d 59                	jge    804911 <sys_malloc+0x177>
    {
        //在后面新建一个头
        char *p=hp;
  8048b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048bc:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  8048c0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8048c3:	83 c0 01             	add    eax,0x1
  8048c6:	c1 e0 0c             	shl    eax,0xc
  8048c9:	48 98                	cdqe   
  8048cb:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  8048cf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8048d3:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  8048d7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048db:	8b 00                	mov    eax,DWORD PTR [rax]
  8048dd:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  8048e0:	8d 50 ff             	lea    edx,[rax-0x1]
  8048e3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8048e7:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  8048e9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048ed:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8048f1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8048f5:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  8048f9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8048fd:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804901:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804905:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804909:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80490d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804911:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804915:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  80491c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804920:	48 05 00 10 00 00    	add    rax,0x1000
}
  804926:	5d                   	pop    rbp
  804927:	c3                   	ret    

0000000000804928 <sys_free>:
int sys_free(int ptr)
{
  804928:	f3 0f 1e fa          	endbr64 
  80492c:	55                   	push   rbp
  80492d:	48 89 e5             	mov    rbp,rsp
  804930:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  804933:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804936:	2d 00 10 00 00       	sub    eax,0x1000
  80493b:	48 98                	cdqe   
  80493d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  804941:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804945:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  80494c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804950:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804954:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804958:	eb 2e                	jmp    804988 <sys_free+0x60>
    {
        if(p->alloc==0)
  80495a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80495e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804961:	85 c0                	test   eax,eax
  804963:	75 2c                	jne    804991 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  804965:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804969:	8b 10                	mov    edx,DWORD PTR [rax]
  80496b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80496f:	8b 00                	mov    eax,DWORD PTR [rax]
  804971:	83 c0 01             	add    eax,0x1
  804974:	01 c2                	add    edx,eax
  804976:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80497a:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  80497c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804980:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804984:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804988:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80498d:	75 cb                	jne    80495a <sys_free+0x32>
  80498f:	eb 01                	jmp    804992 <sys_free+0x6a>
            break;
  804991:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  804992:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804996:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80499a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80499e:	eb 2e                	jmp    8049ce <sys_free+0xa6>
    {
        if(p->alloc==0)
  8049a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049a4:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8049a7:	85 c0                	test   eax,eax
  8049a9:	75 2c                	jne    8049d7 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  8049ab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049af:	8b 10                	mov    edx,DWORD PTR [rax]
  8049b1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8049b5:	8b 00                	mov    eax,DWORD PTR [rax]
  8049b7:	83 c0 01             	add    eax,0x1
  8049ba:	01 c2                	add    edx,eax
  8049bc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049c0:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  8049c2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049c6:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8049ca:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8049ce:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8049d3:	75 cb                	jne    8049a0 <sys_free+0x78>
  8049d5:	eb 01                	jmp    8049d8 <sys_free+0xb0>
            break;
  8049d7:	90                   	nop
    }
    //合并完成
    return 0;
  8049d8:	b8 00 00 00 00       	mov    eax,0x0
  8049dd:	5d                   	pop    rbp
  8049de:	c3                   	ret    
  8049df:	90                   	nop

00000000008049e0 <outb>:
  8049e0:	66 8b 54 24 04       	mov    dx,WORD PTR [rsp+0x4]
  8049e5:	8a 44 24 08          	mov    al,BYTE PTR [rsp+0x8]
  8049e9:	ee                   	out    dx,al
  8049ea:	e8 31 00 00 00       	call   804a20 <io_delay>
  8049ef:	c3                   	ret    

00000000008049f0 <outw>:
  8049f0:	66 8b 54 24 04       	mov    dx,WORD PTR [rsp+0x4]
  8049f5:	66 8b 44 24 08       	mov    ax,WORD PTR [rsp+0x8]
  8049fa:	66 ef                	out    dx,ax
  8049fc:	90                   	nop
  8049fd:	90                   	nop
  8049fe:	90                   	nop
  8049ff:	c3                   	ret    

0000000000804a00 <inb>:
  804a00:	31 c0                	xor    eax,eax
  804a02:	66 8b 54 24 04       	mov    dx,WORD PTR [rsp+0x4]
  804a07:	ec                   	in     al,dx
  804a08:	90                   	nop
  804a09:	90                   	nop
  804a0a:	90                   	nop
  804a0b:	c3                   	ret    

0000000000804a0c <inw>:
  804a0c:	31 c0                	xor    eax,eax
  804a0e:	66 8b 54 24 04       	mov    dx,WORD PTR [rsp+0x4]
  804a13:	66 ed                	in     ax,dx
  804a15:	90                   	nop
  804a16:	90                   	nop
  804a17:	90                   	nop
  804a18:	c3                   	ret    

0000000000804a19 <eoi>:
  804a19:	b0 20                	mov    al,0x20
  804a1b:	e6 a0                	out    0xa0,al
  804a1d:	e6 20                	out    0x20,al
  804a1f:	c3                   	ret    

0000000000804a20 <io_delay>:
  804a20:	90                   	nop
  804a21:	90                   	nop
  804a22:	90                   	nop
  804a23:	90                   	nop
  804a24:	c3                   	ret    

0000000000804a25 <turn_on_int>:
  804a25:	b0 f8                	mov    al,0xf8
  804a27:	e6 21                	out    0x21,al
  804a29:	e8 f2 ff ff ff       	call   804a20 <io_delay>
  804a2e:	b0 af                	mov    al,0xaf
  804a30:	e6 a1                	out    0xa1,al
  804a32:	e8 e9 ff ff ff       	call   804a20 <io_delay>
  804a37:	0f 01 1d e0 49 80 00 	lidt   [rip+0x8049e0]        # 100941e <dev_stdout+0x7f749e>
  804a3e:	90                   	nop
  804a3f:	90                   	nop
  804a40:	90                   	nop
  804a41:	90                   	nop
  804a42:	fb                   	sti    
  804a43:	c3                   	ret    

0000000000804a44 <report_back_trace_of_err>:
  804a44:	8b 44 24 04          	mov    eax,DWORD PTR [rsp+0x4]
  804a48:	50                   	push   rax
  804a49:	68 e0 49 80 00       	push   0x8049e0
  804a4e:	83 c4 08             	add    esp,0x8
  804a51:	c3                   	ret    

0000000000804a52 <bt_msg>:
  804a52:	65 72 72             	gs jb  804ac7 <fill_desc+0x16>
  804a55:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804a56:	72 20                	jb     804a78 <init_gdt+0xb>
  804a58:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804a59:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  804a5c:	72 73                	jb     804ad1 <fill_desc+0x20>
  804a5e:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  804a61:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eea6df <dev_stdout+0x6d875f>

0000000000804a67 <idtptr>:
  804a67:	f8                   	clc    
  804a68:	07                   	(bad)  
  804a69:	00 00                	add    BYTE PTR [rax],al
	...

0000000000804a6d <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  804a6d:	f3 0f 1e fa          	endbr64 
  804a71:	55                   	push   rbp
  804a72:	48 89 e5             	mov    rbp,rsp
    //asm volatile("sgdt %0"::"m"(gdt));
    fill_desc(0,0xffffffff,SEG_CONFORMING_RW_CODE,1);
  804a75:	b9 01 00 00 00       	mov    ecx,0x1
  804a7a:	ba 9e cf 00 00       	mov    edx,0xcf9e
  804a7f:	be ff ff ff ff       	mov    esi,0xffffffff
  804a84:	bf 00 00 00 00       	mov    edi,0x0
  804a89:	e8 23 00 00 00       	call   804ab1 <fill_desc>
    fill_desc(0,0xffffffff,SEG_RW_DATA,2);
  804a8e:	b9 02 00 00 00       	mov    ecx,0x2
  804a93:	ba 92 cf 00 00       	mov    edx,0xcf92
  804a98:	be ff ff ff ff       	mov    esi,0xffffffff
  804a9d:	bf 00 00 00 00       	mov    edi,0x0
  804aa2:	e8 0a 00 00 00       	call   804ab1 <fill_desc>
    asm volatile("lgdt %0":"=m"(gdtptr));
  804aa7:	0f 01 15 7c e5 8f ff 	lgdt   [rip+0xffffffffff8fe57c]        # 10302a <gdtptr>

}
  804aae:	90                   	nop
  804aaf:	5d                   	pop    rbp
  804ab0:	c3                   	ret    

0000000000804ab1 <fill_desc>:
void fill_desc(u32 base, u32 limit,u16 attr,u32 index)
{
  804ab1:	f3 0f 1e fa          	endbr64 
  804ab5:	55                   	push   rbp
  804ab6:	48 89 e5             	mov    rbp,rsp
  804ab9:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  804abc:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  804abf:	89 d0                	mov    eax,edx
  804ac1:	89 4d f0             	mov    DWORD PTR [rbp-0x10],ecx
  804ac4:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    gdt[index].base_lo16=base&0xffff;
  804ac8:	48 8b 15 f1 53 00 00 	mov    rdx,QWORD PTR [rip+0x53f1]        # 809ec0 <gdt>
  804acf:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804ad2:	48 c1 e0 03          	shl    rax,0x3
  804ad6:	48 01 d0             	add    rax,rdx
  804ad9:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804adc:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_mid8=(base>>16)&0xff;
  804ae0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804ae3:	c1 e8 10             	shr    eax,0x10
  804ae6:	89 c1                	mov    ecx,eax
  804ae8:	48 8b 15 d1 53 00 00 	mov    rdx,QWORD PTR [rip+0x53d1]        # 809ec0 <gdt>
  804aef:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804af2:	48 c1 e0 03          	shl    rax,0x3
  804af6:	48 01 d0             	add    rax,rdx
  804af9:	89 ca                	mov    edx,ecx
  804afb:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_hi8=(base>>24)&0xff;
  804afe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b01:	c1 e8 18             	shr    eax,0x18
  804b04:	89 c1                	mov    ecx,eax
  804b06:	48 8b 15 b3 53 00 00 	mov    rdx,QWORD PTR [rip+0x53b3]        # 809ec0 <gdt>
  804b0d:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804b10:	48 c1 e0 03          	shl    rax,0x3
  804b14:	48 01 d0             	add    rax,rdx
  804b17:	89 ca                	mov    edx,ecx
  804b19:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].limit_lo16=limit&0xffff;
  804b1c:	48 8b 15 9d 53 00 00 	mov    rdx,QWORD PTR [rip+0x539d]        # 809ec0 <gdt>
  804b23:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804b26:	48 c1 e0 03          	shl    rax,0x3
  804b2a:	48 01 d0             	add    rax,rdx
  804b2d:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  804b30:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr;
  804b33:	48 8b 15 86 53 00 00 	mov    rdx,QWORD PTR [rip+0x5386]        # 809ec0 <gdt>
  804b3a:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804b3d:	48 c1 e0 03          	shl    rax,0x3
  804b41:	48 01 c2             	add    rdx,rax
  804b44:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  804b48:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  804b4c:	90                   	nop
  804b4d:	5d                   	pop    rbp
  804b4e:	c3                   	ret    

0000000000804b4f <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  804b4f:	f3 0f 1e fa          	endbr64 
  804b53:	55                   	push   rbp
  804b54:	48 89 e5             	mov    rbp,rsp
  804b57:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804b5a:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  804b5d:	89 c8                	mov    eax,ecx
  804b5f:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  804b63:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  804b67:	48 8b 05 52 53 00 00 	mov    rax,QWORD PTR [rip+0x5352]        # 809ec0 <gdt>
  804b6e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  804b72:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b75:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  804b7c:	00 
  804b7d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b81:	48 01 d0             	add    rax,rdx
  804b84:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804b87:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  804b8a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804b8d:	c1 e8 10             	shr    eax,0x10
  804b90:	89 c2                	mov    edx,eax
  804b92:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b95:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
  804b9c:	00 
  804b9d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ba1:	48 01 c8             	add    rax,rcx
  804ba4:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    ptr[index].selector=selector;
  804ba8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804bab:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  804bb2:	00 
  804bb3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bb7:	48 01 c2             	add    rdx,rax
  804bba:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  804bbe:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  804bc2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804bc5:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  804bcc:	00 
  804bcd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bd1:	48 01 c2             	add    rdx,rax
  804bd4:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  804bd8:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  804bdc:	90                   	nop
  804bdd:	5d                   	pop    rbp
  804bde:	c3                   	ret    

0000000000804bdf <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  804bdf:	f3 0f 1e fa          	endbr64 
  804be3:	55                   	push   rbp
  804be4:	48 89 e5             	mov    rbp,rsp
  804be7:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  804bea:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  804bed:	89 d0                	mov    eax,edx
  804bef:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  804bf3:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    desc->base_lo16=base&0xffff;
  804bf7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804bfa:	89 c2                	mov    edx,eax
  804bfc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804c00:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    desc->base_mid8=(base>>16)&0xff;
  804c04:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804c07:	c1 e8 10             	shr    eax,0x10
  804c0a:	89 c2                	mov    edx,eax
  804c0c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804c10:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    desc->base_hi8=(base>>24)&0xff;
  804c13:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804c16:	c1 e8 18             	shr    eax,0x18
  804c19:	89 c2                	mov    edx,eax
  804c1b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804c1f:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    desc->limit_lo16=limit&0xffff;
  804c22:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804c25:	89 c2                	mov    edx,eax
  804c27:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804c2b:	66 89 10             	mov    WORD PTR [rax],dx
    desc->attr=attr|(limit>>16&0xf)<<8;
  804c2e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804c31:	c1 e8 10             	shr    eax,0x10
  804c34:	c1 e0 08             	shl    eax,0x8
  804c37:	66 25 00 0f          	and    ax,0xf00
  804c3b:	66 0b 45 f4          	or     ax,WORD PTR [rbp-0xc]
  804c3f:	89 c2                	mov    edx,eax
  804c41:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804c45:	66 89 50 05          	mov    WORD PTR [rax+0x5],dx
  804c49:	90                   	nop
  804c4a:	5d                   	pop    rbp
  804c4b:	c3                   	ret    
  804c4c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000804c50 <fill_desc>:
  804c50:	8b 44 24 04          	mov    eax,DWORD PTR [rsp+0x4]
  804c54:	8b 5c 24 08          	mov    ebx,DWORD PTR [rsp+0x8]
  804c58:	8b 4c 24 0c          	mov    ecx,DWORD PTR [rsp+0xc]
  804c5c:	8b 54 24 10          	mov    edx,DWORD PTR [rsp+0x10]
  804c60:	be 00 60 00 00       	mov    esi,0x6000
  804c65:	c1 e2 03             	shl    edx,0x3
  804c68:	01 d6                	add    esi,edx
  804c6a:	66 89 1e             	mov    WORD PTR [rsi],bx
  804c6d:	66 89 46 02          	mov    WORD PTR [rsi+0x2],ax
  804c71:	c1 e8 10             	shr    eax,0x10
  804c74:	88 46 04             	mov    BYTE PTR [rsi+0x4],al
  804c77:	c1 eb 10             	shr    ebx,0x10
  804c7a:	88 5e 06             	mov    BYTE PTR [rsi+0x6],bl
  804c7d:	88 66 07             	mov    BYTE PTR [rsi+0x7],ah
  804c80:	09 4e 05             	or     DWORD PTR [rsi+0x5],ecx
  804c83:	c3                   	ret    

0000000000804c84 <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  804c84:	f3 0f 1e fa          	endbr64 
  804c88:	55                   	push   rbp
  804c89:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  804c8c:	b8 00 00 00 00       	mov    eax,0x0
  804c91:	e8 6d 16 00 00       	call   806303 <execute_request>
    do_req();
  804c96:	b8 00 00 00 00       	mov    eax,0x0
  804c9b:	e8 e6 ea ff ff       	call   803786 <do_req>
    if(!manage_proc_lock)
  804ca0:	8b 05 ba 51 00 00    	mov    eax,DWORD PTR [rip+0x51ba]        # 809e60 <manage_proc_lock>
  804ca6:	85 c0                	test   eax,eax
  804ca8:	75 0a                	jne    804cb4 <clock_c+0x30>
    {
        manage_proc();
  804caa:	b8 00 00 00 00       	mov    eax,0x0
  804caf:	e8 ad f0 ff ff       	call   803d61 <manage_proc>
    }
    //puts("1 disk req executed.");
  804cb4:	90                   	nop
  804cb5:	5d                   	pop    rbp
  804cb6:	c3                   	ret    
  804cb7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  804cbe:	00 00 

0000000000804cc0 <clock>:
  804cc0:	83 3d 60 9e 80 00 00 	cmp    DWORD PTR [rip+0x809e60],0x0        # 100eb27 <dev_stdout+0x7fcba7>
  804cc7:	75 5d                	jne    804d26 <clock.normal_part>
  804cc9:	60                   	(bad)  
  804cca:	b9 08 00 00 00       	mov    ecx,0x8
  804ccf:	89 e6                	mov    esi,esp
  804cd1:	bf a0 1f 41 00       	mov    edi,0x411fa0
  804cd6:	83 c7 44             	add    edi,0x44

0000000000804cd9 <clock.saver_loop>:
  804cd9:	8b 1e                	mov    ebx,DWORD PTR [rsi]
  804cdb:	89 1f                	mov    DWORD PTR [rdi],ebx
  804cdd:	83 c6 04             	add    esi,0x4
  804ce0:	83 ef 04             	sub    edi,0x4
  804ce3:	e2 f4                	loop   804cd9 <clock.saver_loop>
  804ce5:	61                   	(bad)  
  804ce6:	bf a0 1f 41 00       	mov    edi,0x411fa0
  804ceb:	8b 04 24             	mov    eax,DWORD PTR [rsp]
  804cee:	89 47 20             	mov    DWORD PTR [rdi+0x20],eax
  804cf1:	9c                   	pushf  
  804cf2:	5b                   	pop    rbx
  804cf3:	81 cb 00 02 00 00    	or     ebx,0x200
  804cf9:	89 5f 24             	mov    DWORD PTR [rdi+0x24],ebx
  804cfc:	66 8c c0             	mov    ax,es
  804cff:	66 89 47 48          	mov    WORD PTR [rdi+0x48],ax
  804d03:	66 8c c8             	mov    ax,cs
  804d06:	66 89 47 4c          	mov    WORD PTR [rdi+0x4c],ax
  804d0a:	66 8c d0             	mov    ax,ss
  804d0d:	66 89 47 50          	mov    WORD PTR [rdi+0x50],ax
  804d11:	66 8c d8             	mov    ax,ds
  804d14:	66 89 47 54          	mov    WORD PTR [rdi+0x54],ax
  804d18:	66 8c e0             	mov    ax,fs
  804d1b:	66 89 47 58          	mov    WORD PTR [rdi+0x58],ax
  804d1f:	66 8c e8             	mov    ax,gs
  804d22:	66 89 47 5c          	mov    WORD PTR [rdi+0x5c],ax

0000000000804d26 <clock.normal_part>:
  804d26:	b0 20                	mov    al,0x20
  804d28:	e6 a0                	out    0xa0,al
  804d2a:	e6 20                	out    0x20,al
  804d2c:	e8 57 ff ff ff       	call   804c88 <clock_c+0x4>
  804d31:	cf                   	iret   

0000000000804d32 <execute>:
    return ind;
}
*/

int execute(char *path)
{
  804d32:	f3 0f 1e fa          	endbr64 
  804d36:	55                   	push   rbp
  804d37:	48 89 e5             	mov    rbp,rsp
  804d3a:	48 83 ec 30          	sub    rsp,0x30
  804d3e:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  804d42:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  804d49:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, 1)) == -1)return -1;
  804d50:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804d54:	be 01 00 00 00       	mov    esi,0x1
  804d59:	48 89 c7             	mov    rdi,rax
  804d5c:	e8 18 cd ff ff       	call   801a79 <sys_open>
  804d61:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  804d64:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804d68:	75 0a                	jne    804d74 <execute+0x42>
  804d6a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804d6f:	e9 b7 00 00 00       	jmp    804e2b <execute+0xf9>
    //
    char *p=path;
  804d74:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804d78:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  804d7c:	eb 05                	jmp    804d83 <execute+0x51>
  804d7e:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  804d83:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804d87:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804d8a:	84 c0                	test   al,al
  804d8c:	75 f0                	jne    804d7e <execute+0x4c>
    for(;*p!='/'&&p>path;p--);
  804d8e:	eb 05                	jmp    804d95 <execute+0x63>
  804d90:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  804d95:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804d99:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804d9c:	3c 2f                	cmp    al,0x2f
  804d9e:	74 0a                	je     804daa <execute+0x78>
  804da0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804da4:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804da8:	77 e6                	ja     804d90 <execute+0x5e>
    if(p>path)
  804daa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804dae:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804db2:	76 2f                	jbe    804de3 <execute+0xb1>
    {
        *p='\0';
  804db4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804db8:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, 1)) == -1)return -1;
  804dbb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804dbf:	be 01 00 00 00       	mov    esi,0x1
  804dc4:	48 89 c7             	mov    rdi,rax
  804dc7:	e8 ad cc ff ff       	call   801a79 <sys_open>
  804dcc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  804dcf:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  804dd3:	75 07                	jne    804ddc <execute+0xaa>
  804dd5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804dda:	eb 4f                	jmp    804e2b <execute+0xf9>
        *p='/';
  804ddc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804de0:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern vfs_dir_entry opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  804de3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804de6:	48 63 d0             	movsxd rdx,eax
  804de9:	48 89 d0             	mov    rax,rdx
  804dec:	48 01 c0             	add    rax,rax
  804def:	48 01 d0             	add    rax,rdx
  804df2:	48 c1 e0 05          	shl    rax,0x5
  804df6:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  804dfd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804e00:	48 63 c8             	movsxd rcx,eax
  804e03:	48 89 c8             	mov    rax,rcx
  804e06:	48 01 c0             	add    rax,rax
  804e09:	48 01 c8             	add    rax,rcx
  804e0c:	48 c1 e0 05          	shl    rax,0x5
  804e10:	48 05 60 06 40 00    	add    rax,0x400660
  804e16:	b9 95 4e 80 00       	mov    ecx,0x804e95
  804e1b:	48 89 c6             	mov    rsi,rax
  804e1e:	89 cf                	mov    edi,ecx
  804e20:	e8 bf f7 ff ff       	call   8045e4 <reg_proc>
  804e25:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  804e28:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  804e2b:	c9                   	leave  
  804e2c:	c3                   	ret    

0000000000804e2d <exec_call>:

int exec_call(char *path)
{
  804e2d:	f3 0f 1e fa          	endbr64 
  804e31:	55                   	push   rbp
  804e32:	48 89 e5             	mov    rbp,rsp
  804e35:	48 83 ec 20          	sub    rsp,0x20
  804e39:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi=execute(path);
  804e3d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804e41:	48 89 c7             	mov    rdi,rax
  804e44:	e8 e9 fe ff ff       	call   804d32 <execute>
  804e49:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  804e4c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804e4f:	01 c0                	add    eax,eax
  804e51:	83 c0 05             	add    eax,0x5
  804e54:	c1 e0 03             	shl    eax,0x3
  804e57:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  804e5a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804e5d:	89 c7                	mov    edi,eax
  804e5f:	e8 1e f0 ff ff       	call   803e82 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  804e64:	90                   	nop
  804e65:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804e68:	48 98                	cdqe   
  804e6a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804e71:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804e77:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804e7a:	83 f8 03             	cmp    eax,0x3
  804e7d:	75 e6                	jne    804e65 <exec_call+0x38>
    return task[pi].exit_code;
  804e7f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804e82:	48 98                	cdqe   
  804e84:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804e8b:	48 05 b0 84 40 00    	add    rax,0x4084b0
  804e91:	8b 00                	mov    eax,DWORD PTR [rax]
}
  804e93:	c9                   	leave  
  804e94:	c3                   	ret    

0000000000804e95 <proc_start>:
int proc_start()
{
  804e95:	f3 0f 1e fa          	endbr64 
  804e99:	55                   	push   rbp
  804e9a:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  804e9d:	8b 05 cd d1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d1cd]        # 412070 <cur_proc>
  804ea3:	48 98                	cdqe   
  804ea5:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804eac:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804eb2:	48 89 c7             	mov    rdi,rax
  804eb5:	e8 1a 00 00 00       	call   804ed4 <load_pe>
    //释放进程资源
    del_proc(cur_proc);
  804eba:	8b 05 b0 d1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d1b0]        # 412070 <cur_proc>
  804ec0:	89 c7                	mov    edi,eax
  804ec2:	e8 fa f4 ff ff       	call   8043c1 <del_proc>
    switch_proc_tss(0);
  804ec7:	bf 00 00 00 00       	mov    edi,0x0
  804ecc:	e8 b1 ef ff ff       	call   803e82 <switch_proc_tss>
}
  804ed1:	90                   	nop
  804ed2:	5d                   	pop    rbp
  804ed3:	c3                   	ret    

0000000000804ed4 <load_pe>:
//在cr3切换到目标进程下的加载程序(但进程还没调度到那里)。
int load_pe(struct process *proc)
{
  804ed4:	f3 0f 1e fa          	endbr64 
  804ed8:	55                   	push   rbp
  804ed9:	48 89 e5             	mov    rbp,rsp
  804edc:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  804ee3:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    vfs_dir_entry *f=proc->exef;
  804eea:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  804ef1:	48 8b 80 94 00 00 00 	mov    rax,QWORD PTR [rax+0x94]
  804ef8:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=f->fno;
  804efc:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  804f00:	8b 00                	mov    eax,DWORD PTR [rax]
  804f02:	89 45 94             	mov    DWORD PTR [rbp-0x6c],eax

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  804f05:	48 8d 8d 70 fe ff ff 	lea    rcx,[rbp-0x190]
  804f0c:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804f0f:	ba 44 00 00 00       	mov    edx,0x44
  804f14:	48 89 ce             	mov    rsi,rcx
  804f17:	89 c7                	mov    edi,eax
  804f19:	e8 3a d1 ff ff       	call   802058 <sys_read>
    sys_seek(exefno,tdh.e_lfanew,SEEK_SET);
  804f1e:	48 8b 85 ac fe ff ff 	mov    rax,QWORD PTR [rbp-0x154]
  804f25:	89 c1                	mov    ecx,eax
  804f27:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804f2a:	ba 00 00 00 00       	mov    edx,0x0
  804f2f:	89 ce                	mov    esi,ecx
  804f31:	89 c7                	mov    edi,eax
  804f33:	e8 b1 d1 ff ff       	call   8020e9 <sys_seek>
    sys_read(exefno, &tnth, sizeof(tnth));
  804f38:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  804f3f:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804f42:	ba f8 00 00 00       	mov    edx,0xf8
  804f47:	48 89 ce             	mov    rsi,rcx
  804f4a:	89 c7                	mov    edi,eax
  804f4c:	e8 07 d1 ff ff       	call   802058 <sys_read>

    //是否需要移动base(先不检查)
    unsigned int nbase=tnth.OptionalHeader.ImageBase;
  804f51:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  804f57:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  804f5a:	8b 85 c0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x240]
  804f60:	c1 e8 0c             	shr    eax,0xc
  804f63:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
    //use_pgm_ava检查在页表中这个范围是否可用，可用就使用
    while(1)
    {
        cont:
        ;
        int pdei=nbase/PAGE_INDEX_SIZE;
  804f66:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804f69:	c1 e8 16             	shr    eax,0x16
  804f6c:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
        int ptei=nbase%PAGE_INDEX_SIZE/PAGE_SIZE;
  804f6f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804f72:	25 ff ff 3f 00       	and    eax,0x3fffff
  804f77:	c1 e8 0c             	shr    eax,0xc
  804f7a:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
        int *pt=(proc->pdet[pdei]&0xfffff000);
  804f7d:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  804f84:	48 8b 90 84 00 00 00 	mov    rdx,QWORD PTR [rax+0x84]
  804f8b:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
  804f8e:	48 98                	cdqe   
  804f90:	48 c1 e0 02          	shl    rax,0x2
  804f94:	48 01 d0             	add    rax,rdx
  804f97:	8b 00                	mov    eax,DWORD PTR [rax]
  804f99:	89 c0                	mov    eax,eax
  804f9b:	25 00 f0 ff ff       	and    eax,0xfffff000
  804fa0:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
        for(int i=0;i<pgn;i++)
  804fa4:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  804fab:	eb 48                	jmp    804ff5 <load_pe+0x121>
        {
            if(pt[ptei+i%1024]&PAGE_PRESENT&&pt!=NULL)
  804fad:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804fb0:	99                   	cdq    
  804fb1:	c1 ea 16             	shr    edx,0x16
  804fb4:	01 d0                	add    eax,edx
  804fb6:	25 ff 03 00 00       	and    eax,0x3ff
  804fbb:	29 d0                	sub    eax,edx
  804fbd:	89 c2                	mov    edx,eax
  804fbf:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  804fc2:	01 d0                	add    eax,edx
  804fc4:	48 98                	cdqe   
  804fc6:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  804fcd:	00 
  804fce:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  804fd2:	48 01 d0             	add    rax,rdx
  804fd5:	8b 00                	mov    eax,DWORD PTR [rax]
  804fd7:	83 e0 01             	and    eax,0x1
  804fda:	85 c0                	test   eax,eax
  804fdc:	74 13                	je     804ff1 <load_pe+0x11d>
  804fde:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
  804fe3:	74 0c                	je     804ff1 <load_pe+0x11d>
            {
                //移动base
                nbase+=0x1000;
  804fe5:	81 45 fc 00 10 00 00 	add    DWORD PTR [rbp-0x4],0x1000
                goto cont;
  804fec:	e9 75 ff ff ff       	jmp    804f66 <load_pe+0x92>
        for(int i=0;i<pgn;i++)
  804ff1:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  804ff5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804ff8:	3b 45 90             	cmp    eax,DWORD PTR [rbp-0x70]
  804ffb:	7c b0                	jl     804fad <load_pe+0xd9>
            }
        }
        break;
  804ffd:	90                   	nop
    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_seek(exefno,0,SEEK_SET);
  804ffe:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805001:	ba 00 00 00 00       	mov    edx,0x0
  805006:	be 00 00 00 00       	mov    esi,0x0
  80500b:	89 c7                	mov    edi,eax
  80500d:	e8 d7 d0 ff ff       	call   8020e9 <sys_seek>
    sys_read(exefno, nbase, PAGE_SIZE);
  805012:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805015:	48 89 c1             	mov    rcx,rax
  805018:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  80501b:	ba 00 10 00 00       	mov    edx,0x1000
  805020:	48 89 ce             	mov    rsi,rcx
  805023:	89 c7                	mov    edi,eax
  805025:	e8 2e d0 ff ff       	call   802058 <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  80502a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80502d:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_NT_HEADERS32 nth=nbase+dosh->e_lfanew;
  805034:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  805037:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  80503e:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  805042:	48 01 d0             	add    rax,rdx
  805045:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  80504c:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805053:	48 83 c0 04          	add    rax,0x4
  805057:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  80505e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805065:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  805068:	89 85 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],eax
    int page_count=prog_size/4096;
  80506e:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  805074:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80507a:	85 c0                	test   eax,eax
  80507c:	0f 48 c2             	cmovs  eax,edx
  80507f:	c1 f8 0c             	sar    eax,0xc
  805082:	89 85 60 ff ff ff    	mov    DWORD PTR [rbp-0xa0],eax

    int shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  805088:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80508f:	8b 50 28             	mov    edx,DWORD PTR [rax+0x28]
  805092:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805095:	01 d0                	add    eax,edx
  805097:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  80509d:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  8050a3:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  8050a9:	85 c0                	test   eax,eax
  8050ab:	0f 48 c2             	cmovs  eax,edx
  8050ae:	c1 f8 0a             	sar    eax,0xa
  8050b1:	89 c1                	mov    ecx,eax
  8050b3:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  8050b9:	99                   	cdq    
  8050ba:	c1 ea 16             	shr    edx,0x16
  8050bd:	01 d0                	add    eax,edx
  8050bf:	25 ff 03 00 00       	and    eax,0x3ff
  8050c4:	29 d0                	sub    eax,edx
  8050c6:	01 c8                	add    eax,ecx
  8050c8:	85 c0                	test   eax,eax
  8050ca:	0f 95 c0             	setne  al
  8050cd:	0f b6 c0             	movzx  eax,al
  8050d0:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  8050d6:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8050dc:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  8050e2:	85 c0                	test   eax,eax
  8050e4:	0f 48 c2             	cmovs  eax,edx
  8050e7:	c1 f8 16             	sar    eax,0x16
  8050ea:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  8050f0:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8050f7:	89 c0                	mov    eax,eax
  8050f9:	48 05 f8 00 00 00    	add    rax,0xf8
  8050ff:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  805103:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80510a:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  80510e:	0f b7 d0             	movzx  edx,ax
  805111:	89 d0                	mov    eax,edx
  805113:	c1 e0 02             	shl    eax,0x2
  805116:	01 d0                	add    eax,edx
  805118:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  80511b:	05 3c 01 00 00       	add    eax,0x13c
  805120:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    int align=nth->OptionalHeader.FileAlignment;
  805126:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80512d:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  805130:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  805136:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  80513c:	99                   	cdq    
  80513d:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  805143:	89 d0                	mov    eax,edx
  805145:	85 c0                	test   eax,eax
  805147:	74 23                	je     80516c <load_pe+0x298>
  805149:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  80514f:	99                   	cdq    
  805150:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  805156:	89 d1                	mov    ecx,edx
  805158:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  80515e:	29 c8                	sub    eax,ecx
  805160:	89 c2                	mov    edx,eax
  805162:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
  805168:	01 d0                	add    eax,edx
  80516a:	eb 06                	jmp    805172 <load_pe+0x29e>
  80516c:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805172:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  805178:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80517f:	eb 68                	jmp    8051e9 <load_pe+0x315>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  805181:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805185:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  805188:	25 00 00 00 02       	and    eax,0x2000000
  80518d:	89 85 bc fe ff ff    	mov    DWORD PTR [rbp-0x144],eax
        if(disca)
  805193:	83 bd bc fe ff ff 00 	cmp    DWORD PTR [rbp-0x144],0x0
  80519a:	75 43                	jne    8051df <load_pe+0x30b>
            continue;
        //直接读，缺页内核解决
        sys_seek(exefno,psec->PointerToRawData,SEEK_SET);
  80519c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8051a0:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8051a3:	89 c1                	mov    ecx,eax
  8051a5:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8051a8:	ba 00 00 00 00       	mov    edx,0x0
  8051ad:	89 ce                	mov    esi,ecx
  8051af:	89 c7                	mov    edi,eax
  8051b1:	e8 33 cf ff ff       	call   8020e9 <sys_seek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  8051b6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8051ba:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8051bd:	89 c2                	mov    edx,eax
  8051bf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8051c3:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
  8051c6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8051c9:	01 c8                	add    eax,ecx
  8051cb:	89 c0                	mov    eax,eax
  8051cd:	48 89 c1             	mov    rcx,rax
  8051d0:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8051d3:	48 89 ce             	mov    rsi,rcx
  8051d6:	89 c7                	mov    edi,eax
  8051d8:	e8 7b ce ff ff       	call   802058 <sys_read>
  8051dd:	eb 01                	jmp    8051e0 <load_pe+0x30c>
            continue;
  8051df:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  8051e0:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8051e4:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  8051e9:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8051f0:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  8051f4:	0f b7 c0             	movzx  eax,ax
  8051f7:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8051fa:	7c 85                	jl     805181 <load_pe+0x2ad>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  8051fc:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805203:	48 83 e8 80          	sub    rax,0xffffffffffffff80
  805207:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    if(impd->Size>0)
  80520e:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  805215:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805218:	85 c0                	test   eax,eax
  80521a:	0f 84 71 02 00 00    	je     805491 <load_pe+0x5bd>
    {
        int tmpi=impd->VirtualAddress+nbase;
  805220:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  805227:	8b 10                	mov    edx,DWORD PTR [rax]
  805229:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80522c:	01 d0                	add    eax,edx
  80522e:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  805234:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  80523a:	48 98                	cdqe   
  80523c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  805240:	e9 3e 02 00 00       	jmp    805483 <load_pe+0x5af>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  805245:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805249:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  80524c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80524f:	01 d0                	add    eax,edx
  805251:	89 c0                	mov    eax,eax
  805253:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  80525a:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  805261:	be 38 19 81 00       	mov    esi,0x811938
  805266:	48 89 c7             	mov    rdi,rax
  805269:	e8 09 45 00 00       	call   809777 <strcmp>
  80526e:	85 c0                	test   eax,eax
  805270:	75 09                	jne    80527b <load_pe+0x3a7>
            {
                dllp=0x1c00000;
  805272:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  805279:	eb 25                	jmp    8052a0 <load_pe+0x3cc>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  80527b:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805282:	48 89 c7             	mov    rdi,rax
  805285:	e8 4a fc ff ff       	call   804ed4 <load_pe>
  80528a:	89 85 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  805290:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  805296:	89 c7                	mov    edi,eax
  805298:	e8 c9 03 00 00       	call   805666 <get_module_addr>
  80529d:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  8052a0:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8052a3:	48 98                	cdqe   
  8052a5:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  8052ac:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8052af:	48 63 d0             	movsxd rdx,eax
  8052b2:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  8052b9:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  8052bd:	48 01 d0             	add    rax,rdx
  8052c0:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  8052c7:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8052ce:	8b 50 78             	mov    edx,DWORD PTR [rax+0x78]
  8052d1:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8052d4:	01 d0                	add    eax,edx
  8052d6:	89 c0                	mov    eax,eax
  8052d8:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
            int funcn=dllexp->NumberOfNames;
  8052df:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8052e6:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8052e9:	89 85 0c ff ff ff    	mov    DWORD PTR [rbp-0xf4],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  8052ef:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8052f6:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  8052f9:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8052fc:	01 d0                	add    eax,edx
  8052fe:	89 c0                	mov    eax,eax
  805300:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  805307:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80530e:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  805311:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805314:	01 d0                	add    eax,edx
  805316:	89 c0                	mov    eax,eax
  805318:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  80531f:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805326:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  805329:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80532c:	01 d0                	add    eax,edx
  80532e:	89 c0                	mov    eax,eax
  805330:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  805337:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80533e:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805341:	89 85 ec fe ff ff    	mov    DWORD PTR [rbp-0x114],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  805347:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80534b:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  80534e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805351:	01 d0                	add    eax,edx
  805353:	89 c0                	mov    eax,eax
  805355:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  805359:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80535d:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  805360:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805363:	01 d0                	add    eax,edx
  805365:	89 c0                	mov    eax,eax
  805367:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  80536b:	e9 00 01 00 00       	jmp    805470 <load_pe+0x59c>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  805370:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805374:	8b 00                	mov    eax,DWORD PTR [rax]
  805376:	85 c0                	test   eax,eax
  805378:	79 43                	jns    8053bd <load_pe+0x4e9>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  80537a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80537e:	8b 00                	mov    eax,DWORD PTR [rax]
  805380:	25 ff ff ff 7f       	and    eax,0x7fffffff
  805385:	2b 85 ec fe ff ff    	sub    eax,DWORD PTR [rbp-0x114]
  80538b:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  805391:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  805397:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80539e:	00 
  80539f:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8053a6:	48 01 d0             	add    rax,rdx
  8053a9:	8b 10                	mov    edx,DWORD PTR [rax]
  8053ab:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8053ae:	01 d0                	add    eax,edx
  8053b0:	89 c2                	mov    edx,eax
  8053b2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8053b6:	89 10                	mov    DWORD PTR [rax],edx
  8053b8:	e9 a9 00 00 00       	jmp    805466 <load_pe+0x592>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  8053bd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8053c1:	8b 00                	mov    eax,DWORD PTR [rax]
  8053c3:	89 c0                	mov    eax,eax
  8053c5:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  8053cc:	48 83 85 e0 fe ff ff 	add    QWORD PTR [rbp-0x120],0x2
  8053d3:	02 
                    int i=0;
  8053d4:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  8053db:	eb 7a                	jmp    805457 <load_pe+0x583>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  8053dd:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8053e0:	48 98                	cdqe   
  8053e2:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8053e9:	00 
  8053ea:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  8053f1:	48 01 d0             	add    rax,rdx
  8053f4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8053f7:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
  8053fe:	48 89 d6             	mov    rsi,rdx
  805401:	48 89 c7             	mov    rdi,rax
  805404:	e8 6e 43 00 00       	call   809777 <strcmp>
  805409:	85 c0                	test   eax,eax
  80540b:	75 46                	jne    805453 <load_pe+0x57f>
                        {
                            int ordi=funcords[i];
  80540d:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  805410:	48 98                	cdqe   
  805412:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  805416:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80541d:	48 01 d0             	add    rax,rdx
  805420:	0f b7 00             	movzx  eax,WORD PTR [rax]
  805423:	98                   	cwde   
  805424:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  80542a:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
  805430:	48 98                	cdqe   
  805432:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805439:	00 
  80543a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  805441:	48 01 d0             	add    rax,rdx
  805444:	8b 10                	mov    edx,DWORD PTR [rax]
  805446:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805449:	01 d0                	add    eax,edx
  80544b:	89 c2                	mov    edx,eax
  80544d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805451:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  805453:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  805457:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80545a:	3b 85 0c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xf4]
  805460:	0f 8c 77 ff ff ff    	jl     8053dd <load_pe+0x509>
                        }
                    }
                }
                iataddrs++;
  805466:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  80546b:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  805470:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805474:	8b 00                	mov    eax,DWORD PTR [rax]
  805476:	85 c0                	test   eax,eax
  805478:	0f 85 f2 fe ff ff    	jne    805370 <load_pe+0x49c>
            }
            impdes++;
  80547e:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  805483:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805487:	8b 00                	mov    eax,DWORD PTR [rax]
  805489:	85 c0                	test   eax,eax
  80548b:	0f 85 b4 fd ff ff    	jne    805245 <load_pe+0x371>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  805491:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  805498:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  805499:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8054a0:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [rax+0xa4]
  8054a6:	85 c0                	test   eax,eax
  8054a8:	0f 84 e8 00 00 00    	je     805596 <load_pe+0x6c2>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  8054ae:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8054b5:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [rax+0xa0]
  8054bb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8054be:	01 d0                	add    eax,edx
  8054c0:	89 c0                	mov    eax,eax
  8054c2:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                                +(u32)nbase);
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  8054c6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8054ca:	48 83 c0 40          	add    rax,0x40
  8054ce:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  8054d2:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8054d6:	48 83 c0 02          	add    rax,0x2
  8054da:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  8054de:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8054e5:	8b 40 34             	mov    eax,DWORD PTR [rax+0x34]
  8054e8:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
        while(relp->VirtualAddress){
  8054ee:	e9 95 00 00 00       	jmp    805588 <load_pe+0x6b4>
            int pgva=relp->VirtualAddress+nbase;
  8054f3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8054f7:	8b 10                	mov    edx,DWORD PTR [rax]
  8054f9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8054fc:	01 d0                	add    eax,edx
  8054fe:	89 85 d0 fe ff ff    	mov    DWORD PTR [rbp-0x130],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  805504:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  80550b:	eb 59                	jmp    805566 <load_pe+0x692>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  80550d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805511:	0f b7 00             	movzx  eax,WORD PTR [rax]
  805514:	66 85 c0             	test   ax,ax
  805517:	74 48                	je     805561 <load_pe+0x68d>
                int *at=*reloc+pgva;//要重定位的数据的地址
  805519:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80551d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  805520:	0f b7 d0             	movzx  edx,ax
  805523:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  805529:	01 d0                	add    eax,edx
  80552b:	48 98                	cdqe   
  80552d:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
                *at=*at-old_base+nbase;
  805534:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  80553b:	8b 00                	mov    eax,DWORD PTR [rax]
  80553d:	2b 85 d4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x12c]
  805543:	89 c2                	mov    edx,eax
  805545:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805548:	01 d0                	add    eax,edx
  80554a:	89 c2                	mov    edx,eax
  80554c:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  805553:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  805555:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  80555a:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  80555f:	eb 01                	jmp    805562 <load_pe+0x68e>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  805561:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  805562:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  805566:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80556a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80556d:	c1 e8 02             	shr    eax,0x2
  805570:	89 c2                	mov    edx,eax
  805572:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  805575:	39 c2                	cmp    edx,eax
  805577:	77 94                	ja     80550d <load_pe+0x639>
            }
            relp=(int)relp+0x1000;
  805579:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80557d:	05 00 10 00 00       	add    eax,0x1000
  805582:	48 98                	cdqe   
  805584:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  805588:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80558c:	8b 00                	mov    eax,DWORD PTR [rax]
  80558e:	85 c0                	test   eax,eax
  805590:	0f 85 5d ff ff ff    	jne    8054f3 <load_pe+0x61f>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  805596:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  80559d:	00 00 00 
  8055a0:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  8055a7:	00 00 00 
  8055aa:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  8055b1:	00 00 00 00 
  8055b5:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  8055bc:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  8055c0:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  8055c7:	ba 18 00 00 00       	mov    edx,0x18
  8055cc:	48 89 c6             	mov    rsi,rax
  8055cf:	bf 00 00 00 01       	mov    edi,0x1000000
  8055d4:	e8 00 3f 00 00       	call   8094d9 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  8055d9:	8b 05 91 ca c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ca91]        # 412070 <cur_proc>
  8055df:	48 98                	cdqe   
  8055e1:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8055e8:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8055ee:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  8055f5:	8b 05 75 ca c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ca75]        # 412070 <cur_proc>
  8055fb:	48 98                	cdqe   
  8055fd:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  805604:	48 05 b0 84 40 00    	add    rax,0x4084b0
  80560a:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  805611:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  805617:	48 98                	cdqe   
  805619:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
    task[cur_proc].exit_code=main(0,NULL);
  805620:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
  805627:	be 00 00 00 00       	mov    esi,0x0
  80562c:	bf 00 00 00 00       	mov    edi,0x0
  805631:	ff d0                	call   rax
  805633:	8b 15 37 ca c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0ca37]        # 412070 <cur_proc>
  805639:	89 c1                	mov    ecx,eax
  80563b:	48 63 c2             	movsxd rax,edx
  80563e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  805645:	48 05 b0 84 40 00    	add    rax,0x4084b0
  80564b:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  80564d:	8b 05 1d ca c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ca1d]        # 412070 <cur_proc>
  805653:	48 98                	cdqe   
  805655:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80565c:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805662:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805664:	c9                   	leave  
  805665:	c3                   	ret    

0000000000805666 <get_module_addr>:

int get_module_addr(int mi)
{
  805666:	f3 0f 1e fa          	endbr64 
  80566a:	55                   	push   rbp
  80566b:	48 89 e5             	mov    rbp,rsp
  80566e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  805671:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805674:	48 98                	cdqe   
  805676:	8b 04 c5 80 4c 42 00 	mov    eax,DWORD PTR [rax*8+0x424c80]
}
  80567d:	5d                   	pop    rbp
  80567e:	c3                   	ret    

000000000080567f <dispose_library>:
int dispose_library(int dlln)
{
  80567f:	f3 0f 1e fa          	endbr64 
  805683:	55                   	push   rbp
  805684:	48 89 e5             	mov    rbp,rsp
  805687:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  80568a:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80568e:	78 09                	js     805699 <dispose_library+0x1a>
  805690:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  805697:	7e 07                	jle    8056a0 <dispose_library+0x21>
  805699:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80569e:	eb 1d                	jmp    8056bd <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  8056a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8056a3:	48 98                	cdqe   
  8056a5:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  8056ac:	48 05 88 20 41 00    	add    rax,0x412088
  8056b2:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  8056b8:	b8 00 00 00 00       	mov    eax,0x0
}
  8056bd:	5d                   	pop    rbp
  8056be:	c3                   	ret    

00000000008056bf <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  8056bf:	f3 0f 1e fa          	endbr64 
  8056c3:	55                   	push   rbp
  8056c4:	48 89 e5             	mov    rbp,rsp
  8056c7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  8056cb:	90                   	nop
  8056cc:	5d                   	pop    rbp
  8056cd:	c3                   	ret    

00000000008056ce <sys_rmmod>:
int sys_rmmod(char *name)
{
  8056ce:	f3 0f 1e fa          	endbr64 
  8056d2:	55                   	push   rbp
  8056d3:	48 89 e5             	mov    rbp,rsp
  8056d6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  8056da:	90                   	nop
  8056db:	5d                   	pop    rbp
  8056dc:	c3                   	ret    
  8056dd:	0f 1f 00             	nop    DWORD PTR [rax]

00000000008056e0 <_syscall>:
  8056e0:	57                   	push   rdi
  8056e1:	56                   	push   rsi
  8056e2:	52                   	push   rdx
  8056e3:	51                   	push   rcx
  8056e4:	53                   	push   rbx
  8056e5:	50                   	push   rax
  8056e6:	e8 3c ae ff ff       	call   800527 <syscall+0x4>
  8056eb:	83 c4 18             	add    esp,0x18
  8056ee:	cf                   	iret   

00000000008056ef <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  8056ef:	f3 0f 1e fa          	endbr64 
  8056f3:	55                   	push   rbp
  8056f4:	48 89 e5             	mov    rbp,rsp
  8056f7:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  8056fb:	8b 05 93 f9 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f993]        # 425094 <framebuffer+0x14>
  805701:	89 c0                	mov    eax,eax
  805703:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  805707:	8b 05 8b f9 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f98b]        # 425098 <framebuffer+0x18>
  80570d:	89 c0                	mov    eax,eax
  80570f:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  805713:	0f b6 05 82 f9 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f982]        # 42509c <framebuffer+0x1c>
  80571a:	c0 e8 03             	shr    al,0x3
  80571d:	0f b6 c0             	movzx  eax,al
  805720:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  805724:	8b 05 66 f9 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f966]        # 425090 <framebuffer+0x10>
  80572a:	89 c0                	mov    eax,eax
  80572c:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  805730:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805734:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  805739:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  80573d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805741:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  805746:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  80574a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80574e:	48 c1 e8 0c          	shr    rax,0xc
  805752:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  805755:	48 b8 00 00 00 00 40 	movabs rax,0x4000000000
  80575c:	00 00 00 
  80575f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t pp=framebuffer.common.framebuffer_addr;
  805763:	48 8b 05 1e f9 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f91e]        # 425088 <framebuffer+0x8>
  80576a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  80576e:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  805775:	00 
  805776:	eb 2d                	jmp    8057a5 <init_framebuffer+0xb6>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  805778:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  80577c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805780:	ba 07 00 00 00       	mov    edx,0x7
  805785:	48 89 ce             	mov    rsi,rcx
  805788:	48 89 c7             	mov    rdi,rax
  80578b:	e8 40 b7 ff ff       	call   800ed0 <mmap>
        pp+=PAGE_SIZE;
  805790:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  805797:	00 
        p+=PAGE_SIZE;
  805798:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  80579f:	00 
    for (size_t i = 0; i < pgc; i++)
  8057a0:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  8057a5:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8057a8:	48 98                	cdqe   
  8057aa:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  8057ae:	72 c8                	jb     805778 <init_framebuffer+0x89>
    }
    
    
}
  8057b0:	90                   	nop
  8057b1:	90                   	nop
  8057b2:	c9                   	leave  
  8057b3:	c3                   	ret    

00000000008057b4 <init_font>:
void init_font(){
  8057b4:	f3 0f 1e fa          	endbr64 
  8057b8:	55                   	push   rbp
  8057b9:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  8057bc:	48 c7 05 f9 f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f8f9],0x80a088        # 4250c0 <boot_font>
  8057c3:	88 a0 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  8057c7:	48 8b 05 f2 f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f8f2]        # 4250c0 <boot_font>
  8057ce:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  8057d1:	83 c0 07             	add    eax,0x7
  8057d4:	c1 e8 03             	shr    eax,0x3
  8057d7:	89 05 f3 f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f8f3],eax        # 4250d0 <font_width_bytes>
    font_width = font_width_bytes * 8;
  8057dd:	8b 05 ed f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f8ed]        # 4250d0 <font_width_bytes>
  8057e3:	c1 e0 03             	shl    eax,0x3
  8057e6:	89 05 dc f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f8dc],eax        # 4250c8 <font_width>
    font_height = boot_font->height;
  8057ec:	48 8b 05 cd f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f8cd]        # 4250c0 <boot_font>
  8057f3:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8057f6:	89 05 d0 f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f8d0],eax        # 4250cc <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  8057fc:	48 8b 05 bd f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f8bd]        # 4250c0 <boot_font>
  805803:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  805806:	89 c0                	mov    eax,eax
  805808:	48 05 88 a0 80 00    	add    rax,0x80a088
  80580e:	48 89 05 c3 f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f8c3],rax        # 4250d8 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  805815:	48 8b 05 a4 f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f8a4]        # 4250c0 <boot_font>
  80581c:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80581f:	89 05 bf f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f8bf],eax        # 4250e4 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  805825:	48 8b 05 94 f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f894]        # 4250c0 <boot_font>
  80582c:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  80582f:	89 05 ab f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f8ab],eax        # 4250e0 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  805835:	c7 05 71 f8 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f871],0x0        # 4250b0 <fb_cursor_y>
  80583c:	00 00 00 
  80583f:	8b 05 6b f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f86b]        # 4250b0 <fb_cursor_y>
  805845:	89 05 61 f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f861],eax        # 4250ac <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width *framebuffer.common.framebuffer_bpp/8 / font_width;
  80584b:	8b 15 43 f8 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f843]        # 425094 <framebuffer+0x14>
  805851:	0f b6 05 44 f8 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f844]        # 42509c <framebuffer+0x1c>
  805858:	0f b6 c0             	movzx  eax,al
  80585b:	0f af c2             	imul   eax,edx
  80585e:	c1 e8 03             	shr    eax,0x3
  805861:	8b 0d 61 f8 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f861]        # 4250c8 <font_width>
  805867:	ba 00 00 00 00       	mov    edx,0x0
  80586c:	f7 f1                	div    ecx
  80586e:	89 05 40 f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f840],eax        # 4250b4 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height *framebuffer.common.framebuffer_bpp/8 / font_height;
  805874:	8b 15 1e f8 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f81e]        # 425098 <framebuffer+0x18>
  80587a:	0f b6 05 1b f8 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f81b]        # 42509c <framebuffer+0x1c>
  805881:	0f b6 c0             	movzx  eax,al
  805884:	0f af c2             	imul   eax,edx
  805887:	c1 e8 03             	shr    eax,0x3
  80588a:	8b 35 3c f8 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1f83c]        # 4250cc <font_height>
  805890:	ba 00 00 00 00       	mov    edx,0x0
  805895:	f7 f6                	div    esi
  805897:	89 05 1b f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f81b],eax        # 4250b8 <max_ch_nr_y>
    font_size=1;
  80589d:	c7 05 21 46 00 00 01 	mov    DWORD PTR [rip+0x4621],0x1        # 809ec8 <font_size>
  8058a4:	00 00 00 
}
  8058a7:	90                   	nop
  8058a8:	5d                   	pop    rbp
  8058a9:	c3                   	ret    

00000000008058aa <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  8058aa:	f3 0f 1e fa          	endbr64 
  8058ae:	55                   	push   rbp
  8058af:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  8058b2:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  8058b6:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8058ba:	48 89 05 bf f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f7bf],rax        # 425080 <framebuffer>
  8058c1:	48 89 15 c0 f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f7c0],rdx        # 425088 <framebuffer+0x8>
  8058c8:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  8058cc:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  8058d0:	48 89 05 b9 f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f7b9],rax        # 425090 <framebuffer+0x10>
  8058d7:	48 89 15 ba f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f7ba],rdx        # 425098 <framebuffer+0x18>
  8058de:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  8058e2:	48 89 05 b7 f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f7b7],rax        # 4250a0 <framebuffer+0x20>
}
  8058e9:	90                   	nop
  8058ea:	5d                   	pop    rbp
  8058eb:	c3                   	ret    

00000000008058ec <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  8058ec:	f3 0f 1e fa          	endbr64 
  8058f0:	55                   	push   rbp
  8058f1:	48 89 e5             	mov    rbp,rsp
  8058f4:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8058f7:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8058fa:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8058fd:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  805900:	44 89 45 dc          	mov    DWORD PTR [rbp-0x24],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  805904:	48 b8 00 00 00 00 40 	movabs rax,0x4000000000
  80590b:	00 00 00 
  80590e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  805912:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805915:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805918:	eb 64                	jmp    80597e <fill_rect+0x92>
        for(int px=y;px<w+y;px++){
  80591a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80591d:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  805920:	eb 4b                	jmp    80596d <fill_rect+0x81>
            fb=(unsigned int*)(FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805922:	8b 15 68 f7 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f768]        # 425090 <framebuffer+0x10>
  805928:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80592b:	0f af c2             	imul   eax,edx
  80592e:	89 c1                	mov    ecx,eax
                    +px*framebuffer.common.framebuffer_bpp/8);
  805930:	0f b6 05 65 f7 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f765]        # 42509c <framebuffer+0x1c>
  805937:	0f b6 c0             	movzx  eax,al
  80593a:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  80593e:	8d 50 07             	lea    edx,[rax+0x7]
  805941:	85 c0                	test   eax,eax
  805943:	0f 48 c2             	cmovs  eax,edx
  805946:	c1 f8 03             	sar    eax,0x3
  805949:	48 98                	cdqe   
  80594b:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
  80594f:	48 b8 00 00 00 00 40 	movabs rax,0x4000000000
  805956:	00 00 00 
  805959:	48 01 d0             	add    rax,rdx
            fb=(unsigned int*)(FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  80595c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  805960:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805964:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  805967:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  805969:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80596d:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805970:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805973:	01 d0                	add    eax,edx
  805975:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  805978:	7c a8                	jl     805922 <fill_rect+0x36>
    for(int py=x;py<h+x;py++){
  80597a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80597e:	8b 55 e0             	mov    edx,DWORD PTR [rbp-0x20]
  805981:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805984:	01 d0                	add    eax,edx
  805986:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  805989:	7c 8f                	jl     80591a <fill_rect+0x2e>
        }
    }
}
  80598b:	90                   	nop
  80598c:	90                   	nop
  80598d:	5d                   	pop    rbp
  80598e:	c3                   	ret    

000000000080598f <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  80598f:	f3 0f 1e fa          	endbr64 
  805993:	55                   	push   rbp
  805994:	48 89 e5             	mov    rbp,rsp
  805997:	48 83 ec 30          	sub    rsp,0x30
  80599b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80599e:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8059a1:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8059a4:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  8059a8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8059ab:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  8059ae:	eb 5a                	jmp    805a0a <draw_text+0x7b>
    {
        if(*str=='\n')
  8059b0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8059b4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8059b7:	3c 0a                	cmp    al,0xa
  8059b9:	75 1c                	jne    8059d7 <draw_text+0x48>
        {
            y+=font_height*size;
  8059bb:	8b 15 0b f7 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f70b]        # 4250cc <font_height>
  8059c1:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8059c4:	0f af d0             	imul   edx,eax
  8059c7:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8059ca:	01 d0                	add    eax,edx
  8059cc:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  8059cf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8059d2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  8059d5:	eb 2e                	jmp    805a05 <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  8059d7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8059db:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8059de:	0f be c8             	movsx  ecx,al
  8059e1:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8059e4:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  8059e7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8059ea:	89 c7                	mov    edi,eax
  8059ec:	e8 28 00 00 00       	call   805a19 <draw_letter>
            tx+=size*font_width;
  8059f1:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8059f4:	8b 05 ce f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f6ce]        # 4250c8 <font_width>
  8059fa:	0f af d0             	imul   edx,eax
  8059fd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a00:	01 d0                	add    eax,edx
  805a02:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  805a05:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  805a0a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805a0e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a11:	84 c0                	test   al,al
  805a13:	75 9b                	jne    8059b0 <draw_text+0x21>
    }
}
  805a15:	90                   	nop
  805a16:	90                   	nop
  805a17:	c9                   	leave  
  805a18:	c3                   	ret    

0000000000805a19 <draw_letter>:
void draw_letter(int x, int y, int size, char c) {
  805a19:	f3 0f 1e fa          	endbr64 
  805a1d:	55                   	push   rbp
  805a1e:	48 89 e5             	mov    rbp,rsp
  805a21:	48 83 ec 30          	sub    rsp,0x30
  805a25:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  805a28:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805a2b:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805a2e:	89 c8                	mov    eax,ecx
  805a30:	88 45 d0             	mov    BYTE PTR [rbp-0x30],al
    u8 *glyph = glyph_table;
  805a33:	48 8b 05 9e f6 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f69e]        # 4250d8 <glyph_table>
  805a3a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  805a3e:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805a42:	8b 05 9c f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f69c]        # 4250e4 <glyph_nr>
  805a48:	39 c2                	cmp    edx,eax
  805a4a:	73 13                	jae    805a5f <draw_letter+0x46>
        glyph += c * bytes_per_glyph;
  805a4c:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805a50:	8b 05 8a f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f68a]        # 4250e0 <bytes_per_glyph>
  805a56:	0f af c2             	imul   eax,edx
  805a59:	89 c0                	mov    eax,eax
  805a5b:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805a5f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805a66:	e9 c9 00 00 00       	jmp    805b34 <draw_letter+0x11b>
        u8 mask = 1 << 7;
  805a6b:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805a6f:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805a76:	e9 9a 00 00 00       	jmp    805b15 <draw_letter+0xfc>
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  805a7b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805a7e:	c1 e8 03             	shr    eax,0x3
  805a81:	89 c2                	mov    edx,eax
  805a83:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805a87:	48 01 d0             	add    rax,rdx
  805a8a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a8d:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  805a90:	84 c0                	test   al,al
  805a92:	74 37                	je     805acb <draw_letter+0xb2>
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,-1);
  805a94:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805a97:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  805a9b:	89 c2                	mov    edx,eax
  805a9d:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805aa0:	01 d0                	add    eax,edx
  805aa2:	89 c6                	mov    esi,eax
  805aa4:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805aa7:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  805aab:	89 c2                	mov    edx,eax
  805aad:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805ab0:	01 d0                	add    eax,edx
  805ab2:	89 c7                	mov    edi,eax
  805ab4:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805ab7:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805aba:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
  805ac0:	89 d1                	mov    ecx,edx
  805ac2:	89 c2                	mov    edx,eax
  805ac4:	e8 23 fe ff ff       	call   8058ec <fill_rect>
  805ac9:	eb 35                	jmp    805b00 <draw_letter+0xe7>
            } else {
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,0);
  805acb:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805ace:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  805ad2:	89 c2                	mov    edx,eax
  805ad4:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805ad7:	01 d0                	add    eax,edx
  805ad9:	89 c6                	mov    esi,eax
  805adb:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805ade:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  805ae2:	89 c2                	mov    edx,eax
  805ae4:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805ae7:	01 d0                	add    eax,edx
  805ae9:	89 c7                	mov    edi,eax
  805aeb:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805aee:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805af1:	41 b8 00 00 00 00    	mov    r8d,0x0
  805af7:	89 d1                	mov    ecx,edx
  805af9:	89 c2                	mov    edx,eax
  805afb:	e8 ec fd ff ff       	call   8058ec <fill_rect>
            }

            mask >>= 1;
  805b00:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  805b03:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805b06:	83 e0 07             	and    eax,0x7
  805b09:	85 c0                	test   eax,eax
  805b0b:	75 04                	jne    805b11 <draw_letter+0xf8>
                mask = 1 << 7;
  805b0d:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805b11:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805b15:	8b 05 ad f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f5ad]        # 4250c8 <font_width>
  805b1b:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805b1e:	0f 82 57 ff ff ff    	jb     805a7b <draw_letter+0x62>
            }
        }

        glyph += font_width_bytes;
  805b24:	8b 05 a6 f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f5a6]        # 4250d0 <font_width_bytes>
  805b2a:	89 c0                	mov    eax,eax
  805b2c:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805b30:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805b34:	8b 05 92 f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f592]        # 4250cc <font_height>
  805b3a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  805b3d:	0f 82 28 ff ff ff    	jb     805a6b <draw_letter+0x52>
    }
}
  805b43:	90                   	nop
  805b44:	90                   	nop
  805b45:	c9                   	leave  
  805b46:	c3                   	ret    

0000000000805b47 <scr_up>:
//向上滚动一个像素
void scr_up(){
  805b47:	f3 0f 1e fa          	endbr64 
  805b4b:	55                   	push   rbp
  805b4c:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805b4f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805b56:	eb 74                	jmp    805bcc <scr_up+0x85>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805b58:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805b5f:	eb 5a                	jmp    805bbb <scr_up+0x74>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805b61:	8b 15 29 f5 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f529]        # 425090 <framebuffer+0x10>
  805b67:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b6a:	0f af c2             	imul   eax,edx
  805b6d:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  805b6f:	0f b6 05 26 f5 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f526]        # 42509c <framebuffer+0x1c>
  805b76:	0f b6 c0             	movzx  eax,al
  805b79:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805b7d:	8d 50 07             	lea    edx,[rax+0x7]
  805b80:	85 c0                	test   eax,eax
  805b82:	0f 48 c2             	cmovs  eax,edx
  805b85:	c1 f8 03             	sar    eax,0x3
  805b88:	48 98                	cdqe   
  805b8a:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
  805b8e:	48 b8 00 00 00 00 40 	movabs rax,0x4000000000
  805b95:	00 00 00 
  805b98:	48 01 d0             	add    rax,rdx
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805b9b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  805b9f:	8b 05 eb f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f4eb]        # 425090 <framebuffer+0x10>
  805ba5:	89 c2                	mov    edx,eax
  805ba7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805bab:	48 01 d0             	add    rax,rdx
  805bae:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  805bb1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805bb5:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805bb7:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805bbb:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805bbe:	8b 05 f0 f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f4f0]        # 4250b4 <max_ch_nr_x>
  805bc4:	39 c2                	cmp    edx,eax
  805bc6:	72 99                	jb     805b61 <scr_up+0x1a>
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805bc8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805bcc:	8b 05 e6 f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f4e6]        # 4250b8 <max_ch_nr_y>
  805bd2:	8d 50 ff             	lea    edx,[rax-0x1]
  805bd5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805bd8:	39 c2                	cmp    edx,eax
  805bda:	0f 87 78 ff ff ff    	ja     805b58 <scr_up+0x11>
        }

    }
}
  805be0:	90                   	nop
  805be1:	90                   	nop
  805be2:	5d                   	pop    rbp
  805be3:	c3                   	ret    

0000000000805be4 <print>:
void print(char* s){
  805be4:	f3 0f 1e fa          	endbr64 
  805be8:	55                   	push   rbp
  805be9:	48 89 e5             	mov    rbp,rsp
  805bec:	48 83 ec 18          	sub    rsp,0x18
  805bf0:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(;*s;s++){
  805bf4:	e9 e5 00 00 00       	jmp    805cde <print+0xfa>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  805bf9:	8b 15 ad f4 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f4ad]        # 4250ac <fb_cursor_x>
  805bff:	8b 05 af f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f4af]        # 4250b4 <max_ch_nr_x>
  805c05:	39 c2                	cmp    edx,eax
  805c07:	77 0b                	ja     805c14 <print+0x30>
  805c09:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805c0d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805c10:	3c 0a                	cmp    al,0xa
  805c12:	75 19                	jne    805c2d <print+0x49>
        {
            fb_cursor_y+=1;
  805c14:	8b 05 96 f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f496]        # 4250b0 <fb_cursor_y>
  805c1a:	83 c0 01             	add    eax,0x1
  805c1d:	89 05 8d f4 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f48d],eax        # 4250b0 <fb_cursor_y>
            fb_cursor_x=0;
  805c23:	c7 05 7f f4 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f47f],0x0        # 4250ac <fb_cursor_x>
  805c2a:	00 00 00 
        }
        if(fb_cursor_y>=max_ch_nr_y){
  805c2d:	8b 15 7d f4 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f47d]        # 4250b0 <fb_cursor_y>
  805c33:	8b 05 7f f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f47f]        # 4250b8 <max_ch_nr_y>
  805c39:	39 c2                	cmp    edx,eax
  805c3b:	72 3c                	jb     805c79 <print+0x95>
            for(int i=0;i<font_height*font_size;i++)
  805c3d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805c44:	eb 0e                	jmp    805c54 <print+0x70>
                scr_up();
  805c46:	b8 00 00 00 00       	mov    eax,0x0
  805c4b:	e8 f7 fe ff ff       	call   805b47 <scr_up>
            for(int i=0;i<font_height*font_size;i++)
  805c50:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805c54:	8b 05 72 f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f472]        # 4250cc <font_height>
  805c5a:	8b 15 68 42 00 00    	mov    edx,DWORD PTR [rip+0x4268]        # 809ec8 <font_size>
  805c60:	0f af d0             	imul   edx,eax
  805c63:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c66:	39 c2                	cmp    edx,eax
  805c68:	77 dc                	ja     805c46 <print+0x62>
            fb_cursor_y=max_ch_nr_y-1;
  805c6a:	8b 05 48 f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f448]        # 4250b8 <max_ch_nr_y>
  805c70:	83 e8 01             	sub    eax,0x1
  805c73:	89 05 37 f4 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f437],eax        # 4250b0 <fb_cursor_y>
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  805c79:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805c7d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805c80:	0f be d0             	movsx  edx,al
  805c83:	8b 05 3f 42 00 00    	mov    eax,DWORD PTR [rip+0x423f]        # 809ec8 <font_size>
  805c89:	8b 35 21 f4 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1f421]        # 4250b0 <fb_cursor_y>
  805c8f:	8b 0d 37 f4 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f437]        # 4250cc <font_height>
  805c95:	0f af ce             	imul   ecx,esi
  805c98:	8b 35 2a 42 00 00    	mov    esi,DWORD PTR [rip+0x422a]        # 809ec8 <font_size>
  805c9e:	0f af ce             	imul   ecx,esi
  805ca1:	41 89 c8             	mov    r8d,ecx
  805ca4:	8b 35 02 f4 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1f402]        # 4250ac <fb_cursor_x>
  805caa:	8b 0d 18 f4 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f418]        # 4250c8 <font_width>
  805cb0:	0f af ce             	imul   ecx,esi
  805cb3:	8b 35 0f 42 00 00    	mov    esi,DWORD PTR [rip+0x420f]        # 809ec8 <font_size>
  805cb9:	0f af ce             	imul   ecx,esi
  805cbc:	89 cf                	mov    edi,ecx
  805cbe:	89 d1                	mov    ecx,edx
  805cc0:	89 c2                	mov    edx,eax
  805cc2:	44 89 c6             	mov    esi,r8d
  805cc5:	e8 4f fd ff ff       	call   805a19 <draw_letter>
        fb_cursor_x+=1;
  805cca:	8b 05 dc f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f3dc]        # 4250ac <fb_cursor_x>
  805cd0:	83 c0 01             	add    eax,0x1
  805cd3:	89 05 d3 f3 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f3d3],eax        # 4250ac <fb_cursor_x>
    for(;*s;s++){
  805cd9:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  805cde:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805ce2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805ce5:	84 c0                	test   al,al
  805ce7:	0f 85 0c ff ff ff    	jne    805bf9 <print+0x15>
    }
}
  805ced:	90                   	nop
  805cee:	90                   	nop
  805cef:	c9                   	leave  
  805cf0:	c3                   	ret    

0000000000805cf1 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  805cf1:	f3 0f 1e fa          	endbr64 
  805cf5:	55                   	push   rbp
  805cf6:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  805cf9:	0f b6 05 0d fe c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fe0d]        # 425b0d <k_shift>
  805d00:	84 c0                	test   al,al
  805d02:	0f 94 c0             	sete   al
  805d05:	88 05 02 fe c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fe02],al        # 425b0d <k_shift>
}
  805d0b:	90                   	nop
  805d0c:	5d                   	pop    rbp
  805d0d:	c3                   	ret    

0000000000805d0e <ctrl>:
void ctrl()
{
  805d0e:	f3 0f 1e fa          	endbr64 
  805d12:	55                   	push   rbp
  805d13:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  805d16:	0f b6 05 f1 fd c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fdf1]        # 425b0e <k_ctrl>
  805d1d:	84 c0                	test   al,al
  805d1f:	0f 94 c0             	sete   al
  805d22:	88 05 e6 fd c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fde6],al        # 425b0e <k_ctrl>
}
  805d28:	90                   	nop
  805d29:	5d                   	pop    rbp
  805d2a:	c3                   	ret    

0000000000805d2b <capslock>:
void capslock()
{
  805d2b:	f3 0f 1e fa          	endbr64 
  805d2f:	55                   	push   rbp
  805d30:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  805d33:	0f b6 05 d5 fd c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fdd5]        # 425b0f <k_capslock>
  805d3a:	84 c0                	test   al,al
  805d3c:	0f 94 c0             	sete   al
  805d3f:	88 05 ca fd c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fdca],al        # 425b0f <k_capslock>
}
  805d45:	90                   	nop
  805d46:	5d                   	pop    rbp
  805d47:	c3                   	ret    

0000000000805d48 <to_ascii>:
char to_ascii(char scan_code)
{
  805d48:	f3 0f 1e fa          	endbr64 
  805d4c:	55                   	push   rbp
  805d4d:	48 89 e5             	mov    rbp,rsp
  805d50:	89 f8                	mov    eax,edi
  805d52:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  805d55:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805d5c:	e9 c7 00 00 00       	jmp    805e28 <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  805d61:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805d64:	48 63 d0             	movsxd rdx,eax
  805d67:	48 89 d0             	mov    rax,rdx
  805d6a:	48 c1 e0 02          	shl    rax,0x2
  805d6e:	48 01 d0             	add    rax,rdx
  805d71:	48 05 a2 1a 81 00    	add    rax,0x811aa2
  805d77:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d7a:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  805d7d:	0f 85 a1 00 00 00    	jne    805e24 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  805d83:	0f b6 05 85 fd c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fd85]        # 425b0f <k_capslock>
  805d8a:	84 c0                	test   al,al
  805d8c:	74 55                	je     805de3 <to_ascii+0x9b>
  805d8e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805d91:	48 63 d0             	movsxd rdx,eax
  805d94:	48 89 d0             	mov    rax,rdx
  805d97:	48 c1 e0 02          	shl    rax,0x2
  805d9b:	48 01 d0             	add    rax,rdx
  805d9e:	48 05 a0 1a 81 00    	add    rax,0x811aa0
  805da4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805da7:	3c 60                	cmp    al,0x60
  805da9:	7e 38                	jle    805de3 <to_ascii+0x9b>
  805dab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805dae:	48 63 d0             	movsxd rdx,eax
  805db1:	48 89 d0             	mov    rax,rdx
  805db4:	48 c1 e0 02          	shl    rax,0x2
  805db8:	48 01 d0             	add    rax,rdx
  805dbb:	48 05 a0 1a 81 00    	add    rax,0x811aa0
  805dc1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805dc4:	3c 7a                	cmp    al,0x7a
  805dc6:	7f 1b                	jg     805de3 <to_ascii+0x9b>
  805dc8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805dcb:	48 63 d0             	movsxd rdx,eax
  805dce:	48 89 d0             	mov    rax,rdx
  805dd1:	48 c1 e0 02          	shl    rax,0x2
  805dd5:	48 01 d0             	add    rax,rdx
  805dd8:	48 05 a1 1a 81 00    	add    rax,0x811aa1
  805dde:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805de1:	eb 54                	jmp    805e37 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  805de3:	0f b6 05 23 fd c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fd23]        # 425b0d <k_shift>
  805dea:	84 c0                	test   al,al
  805dec:	74 1b                	je     805e09 <to_ascii+0xc1>
  805dee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805df1:	48 63 d0             	movsxd rdx,eax
  805df4:	48 89 d0             	mov    rax,rdx
  805df7:	48 c1 e0 02          	shl    rax,0x2
  805dfb:	48 01 d0             	add    rax,rdx
  805dfe:	48 05 a1 1a 81 00    	add    rax,0x811aa1
  805e04:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805e07:	eb 2e                	jmp    805e37 <to_ascii+0xef>
            else return key_map[i].ascii;
  805e09:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805e0c:	48 63 d0             	movsxd rdx,eax
  805e0f:	48 89 d0             	mov    rax,rdx
  805e12:	48 c1 e0 02          	shl    rax,0x2
  805e16:	48 01 d0             	add    rax,rdx
  805e19:	48 05 a0 1a 81 00    	add    rax,0x811aa0
  805e1f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805e22:	eb 13                	jmp    805e37 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  805e24:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805e28:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  805e2c:	0f 8e 2f ff ff ff    	jle    805d61 <to_ascii+0x19>
        }

    return '\0';
  805e32:	b8 00 00 00 00       	mov    eax,0x0
}
  805e37:	5d                   	pop    rbp
  805e38:	c3                   	ret    

0000000000805e39 <init_kb>:
int init_kb()
{
  805e39:	f3 0f 1e fa          	endbr64 
  805e3d:	55                   	push   rbp
  805e3e:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  805e41:	bf e0 19 81 00       	mov    edi,0x8119e0
  805e46:	e8 9b cb ff ff       	call   8029e6 <reg_device>
    reg_driver(&drv_keyboard);
  805e4b:	bf 40 19 81 00       	mov    edi,0x811940
  805e50:	e8 79 ce ff ff       	call   802cce <reg_driver>
}
  805e55:	90                   	nop
  805e56:	5d                   	pop    rbp
  805e57:	c3                   	ret    

0000000000805e58 <key_proc>:
int key_proc()
{
  805e58:	f3 0f 1e fa          	endbr64 
  805e5c:	55                   	push   rbp
  805e5d:	48 89 e5             	mov    rbp,rsp
  805e60:	48 83 ec 10          	sub    rsp,0x10
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  805e64:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
  805e68:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  805e6c:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
    key_code tmpc;
    scan1=inb(0x60);
  805e70:	bf 60 00 00 00       	mov    edi,0x60
  805e75:	e8 86 eb ff ff       	call   804a00 <inb>
  805e7a:	88 45 fd             	mov    BYTE PTR [rbp-0x3],al
    ch= to_ascii(scan1);
  805e7d:	0f b6 45 fd          	movzx  eax,BYTE PTR [rbp-0x3]
  805e81:	0f be c0             	movsx  eax,al
  805e84:	89 c7                	mov    edi,eax
  805e86:	e8 bd fe ff ff       	call   805d48 <to_ascii>
  805e8b:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
    if(scan1 == 0xe0 || scan1 == 0xe1)
  805e8e:	80 7d fd e0          	cmp    BYTE PTR [rbp-0x3],0xe0
  805e92:	74 06                	je     805e9a <key_proc+0x42>
  805e94:	80 7d fd e1          	cmp    BYTE PTR [rbp-0x3],0xe1
  805e98:	75 1e                	jne    805eb8 <key_proc+0x60>
    {
        ch= to_ascii(scan2);
  805e9a:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  805e9e:	0f be c0             	movsx  eax,al
  805ea1:	89 c7                	mov    edi,eax
  805ea3:	e8 a0 fe ff ff       	call   805d48 <to_ascii>
  805ea8:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
        scan2=inb(0x60);
  805eab:	bf 60 00 00 00       	mov    edi,0x60
  805eb0:	e8 4b eb ff ff       	call   804a00 <inb>
  805eb5:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    }
    tmpc.scan_code=scan1;
  805eb8:	0f b6 45 fd          	movzx  eax,BYTE PTR [rbp-0x3]
  805ebc:	88 45 fa             	mov    BYTE PTR [rbp-0x6],al
    tmpc.scan_code2=scan2;
  805ebf:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  805ec3:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
    tmpc.ascii= ch;
  805ec6:	0f b6 45 fe          	movzx  eax,BYTE PTR [rbp-0x2]
  805eca:	88 45 f8             	mov    BYTE PTR [rbp-0x8],al

    if(QTAIL(key_bufq)!=QHEAD(key_bufq))
  805ecd:	8b 15 09 40 00 00    	mov    edx,DWORD PTR [rip+0x4009]        # 809edc <key_bufq+0xc>
  805ed3:	8b 05 ff 3f 00 00    	mov    eax,DWORD PTR [rip+0x3fff]        # 809ed8 <key_bufq+0x8>
  805ed9:	39 c2                	cmp    edx,eax
  805edb:	74 43                	je     805f20 <key_proc+0xc8>
    {
        ENQUEUE(key_bufq,tmpc)
  805edd:	48 8b 0d ec 3f 00 00 	mov    rcx,QWORD PTR [rip+0x3fec]        # 809ed0 <key_bufq>
  805ee4:	8b 05 f2 3f 00 00    	mov    eax,DWORD PTR [rip+0x3ff2]        # 809edc <key_bufq+0xc>
  805eea:	48 63 d0             	movsxd rdx,eax
  805eed:	48 89 d0             	mov    rax,rdx
  805ef0:	48 c1 e0 02          	shl    rax,0x2
  805ef4:	48 01 d0             	add    rax,rdx
  805ef7:	48 01 c8             	add    rax,rcx
  805efa:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805efd:	89 10                	mov    DWORD PTR [rax],edx
  805eff:	0f b6 55 fc          	movzx  edx,BYTE PTR [rbp-0x4]
  805f03:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
  805f06:	8b 05 d0 3f 00 00    	mov    eax,DWORD PTR [rip+0x3fd0]        # 809edc <key_bufq+0xc>
  805f0c:	83 c0 01             	add    eax,0x1
  805f0f:	8b 0d cb 3f 00 00    	mov    ecx,DWORD PTR [rip+0x3fcb]        # 809ee0 <key_bufq+0x10>
  805f15:	99                   	cdq    
  805f16:	f7 f9                	idiv   ecx
  805f18:	89 d0                	mov    eax,edx
  805f1a:	89 05 bc 3f 00 00    	mov    DWORD PTR [rip+0x3fbc],eax        # 809edc <key_bufq+0xc>
        //logf("%x\n",stdin.w_ptr);
        //print_stdin();
        //printchar(ch);
        //flush_screen(0);
    }*/
    eoi();
  805f20:	b8 00 00 00 00       	mov    eax,0x0
  805f25:	e8 ef ea ff ff       	call   804a19 <eoi>
    asm volatile("leave \r\n iret");
  805f2a:	c9                   	leave  
  805f2b:	cf                   	iret   
}
  805f2c:	90                   	nop
  805f2d:	c9                   	leave  
  805f2e:	c3                   	ret    

0000000000805f2f <sys_getkbc>:

char sys_getkbc()
{
  805f2f:	f3 0f 1e fa          	endbr64 
  805f33:	55                   	push   rbp
  805f34:	48 89 e5             	mov    rbp,rsp
    if(key_bufq.tail==key_bufq.head)return -1;
  805f37:	8b 15 9f 3f 00 00    	mov    edx,DWORD PTR [rip+0x3f9f]        # 809edc <key_bufq+0xc>
  805f3d:	8b 05 95 3f 00 00    	mov    eax,DWORD PTR [rip+0x3f95]        # 809ed8 <key_bufq+0x8>
  805f43:	39 c2                	cmp    edx,eax
  805f45:	75 07                	jne    805f4e <sys_getkbc+0x1f>
  805f47:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805f4c:	eb 43                	jmp    805f91 <sys_getkbc+0x62>
    key_code c=key_buf[key_bufq.tail];
  805f4e:	8b 05 88 3f 00 00    	mov    eax,DWORD PTR [rip+0x3f88]        # 809edc <key_bufq+0xc>
  805f54:	48 63 d0             	movsxd rdx,eax
  805f57:	48 89 d0             	mov    rax,rdx
  805f5a:	48 c1 e0 02          	shl    rax,0x2
  805f5e:	48 01 d0             	add    rax,rdx
  805f61:	48 05 00 51 42 00    	add    rax,0x425100
  805f67:	8b 10                	mov    edx,DWORD PTR [rax]
  805f69:	89 55 fb             	mov    DWORD PTR [rbp-0x5],edx
  805f6c:	0f b6 40 04          	movzx  eax,BYTE PTR [rax+0x4]
  805f70:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QTAIL(key_bufq)=(QTAIL(key_bufq)+1)%QSIZE(key_bufq);
  805f73:	8b 05 63 3f 00 00    	mov    eax,DWORD PTR [rip+0x3f63]        # 809edc <key_bufq+0xc>
  805f79:	83 c0 01             	add    eax,0x1
  805f7c:	8b 0d 5e 3f 00 00    	mov    ecx,DWORD PTR [rip+0x3f5e]        # 809ee0 <key_bufq+0x10>
  805f82:	99                   	cdq    
  805f83:	f7 f9                	idiv   ecx
  805f85:	89 d0                	mov    eax,edx
  805f87:	89 05 4f 3f 00 00    	mov    DWORD PTR [rip+0x3f4f],eax        # 809edc <key_bufq+0xc>
    return c.ascii;
  805f8d:	0f b6 45 fb          	movzx  eax,BYTE PTR [rbp-0x5]
  805f91:	5d                   	pop    rbp
  805f92:	c3                   	ret    

0000000000805f93 <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  805f93:	f3 0f 1e fa          	endbr64 
  805f97:	55                   	push   rbp
  805f98:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  805f9b:	b8 00 00 00 00       	mov    eax,0x0
  805fa0:	e8 8d 09 00 00       	call   806932 <hd_iterate>
    return 0;
  805fa5:	b8 00 00 00 00       	mov    eax,0x0
}
  805faa:	5d                   	pop    rbp
  805fab:	c3                   	ret    

0000000000805fac <disk_int_handler_c>:

int disk_int_handler_c()
{
  805fac:	f3 0f 1e fa          	endbr64 
  805fb0:	55                   	push   rbp
  805fb1:	48 89 e5             	mov    rbp,rsp
  805fb4:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  805fb8:	48 8b 05 61 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22861]        # 428820 <running_req>
  805fbf:	48 85 c0             	test   rax,rax
  805fc2:	75 0a                	jne    805fce <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  805fc4:	b8 01 00 00 00       	mov    eax,0x1
  805fc9:	e9 a3 01 00 00       	jmp    806171 <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  805fce:	48 8b 05 4b 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2284b]        # 428820 <running_req>
  805fd5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805fd9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  805fdd:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  805fe4:	48 8b 05 35 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22835]        # 428820 <running_req>
  805feb:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805fee:	83 f8 02             	cmp    eax,0x2
  805ff1:	74 0f                	je     806002 <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  805ff3:	48 8b 05 26 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22826]        # 428820 <running_req>
  805ffa:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  805ffd:	83 f8 03             	cmp    eax,0x3
  806000:	75 07                	jne    806009 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  806002:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  806009:	48 8b 05 10 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22810]        # 428820 <running_req>
  806010:	8b 00                	mov    eax,DWORD PTR [rax]
  806012:	85 c0                	test   eax,eax
  806014:	75 42                	jne    806058 <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  806016:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80601d:	eb 22                	jmp    806041 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  80601f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806022:	0f b7 c0             	movzx  eax,ax
  806025:	89 c7                	mov    edi,eax
  806027:	e8 e0 e9 ff ff       	call   804a0c <inw>
  80602c:	89 c2                	mov    edx,eax
  80602e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806032:	48 8d 48 02          	lea    rcx,[rax+0x2]
  806036:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80603a:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  80603d:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  806041:	48 8b 05 d8 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227d8]        # 428820 <running_req>
  806048:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80604b:	c1 e0 08             	shl    eax,0x8
  80604e:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  806051:	7c cc                	jl     80601f <disk_int_handler_c+0x73>
  806053:	e9 ca 00 00 00       	jmp    806122 <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  806058:	48 8b 05 c1 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227c1]        # 428820 <running_req>
  80605f:	8b 00                	mov    eax,DWORD PTR [rax]
  806061:	83 f8 01             	cmp    eax,0x1
  806064:	75 42                	jne    8060a8 <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  806066:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80606d:	eb 25                	jmp    806094 <disk_int_handler_c+0xe8>
            outw(port,*p++);
  80606f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806073:	48 8d 50 02          	lea    rdx,[rax+0x2]
  806077:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80607b:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80607e:	0f b7 d0             	movzx  edx,ax
  806081:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806084:	0f b7 c0             	movzx  eax,ax
  806087:	89 d6                	mov    esi,edx
  806089:	89 c7                	mov    edi,eax
  80608b:	e8 60 e9 ff ff       	call   8049f0 <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  806090:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806094:	48 8b 05 85 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22785]        # 428820 <running_req>
  80609b:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80609e:	c1 e0 08             	shl    eax,0x8
  8060a1:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8060a4:	7c c9                	jl     80606f <disk_int_handler_c+0xc3>
  8060a6:	eb 7a                	jmp    806122 <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  8060a8:	48 8b 05 71 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22771]        # 428820 <running_req>
  8060af:	8b 00                	mov    eax,DWORD PTR [rax]
  8060b1:	83 f8 02             	cmp    eax,0x2
  8060b4:	75 34                	jne    8060ea <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  8060b6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8060b9:	83 c0 07             	add    eax,0x7
  8060bc:	0f b6 c0             	movzx  eax,al
  8060bf:	89 c7                	mov    edi,eax
  8060c1:	e8 3a e9 ff ff       	call   804a00 <inb>
  8060c6:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  8060c9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8060cc:	0f b7 c0             	movzx  eax,ax
  8060cf:	89 c7                	mov    edi,eax
  8060d1:	e8 36 e9 ff ff       	call   804a0c <inw>
  8060d6:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  8060da:	48 8b 05 3f 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2273f]        # 428820 <running_req>
  8060e1:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  8060e8:	eb 38                	jmp    806122 <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  8060ea:	48 8b 05 2f 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2272f]        # 428820 <running_req>
  8060f1:	8b 00                	mov    eax,DWORD PTR [rax]
  8060f3:	83 f8 03             	cmp    eax,0x3
  8060f6:	75 2a                	jne    806122 <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  8060f8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8060fb:	83 c0 07             	add    eax,0x7
  8060fe:	0f b6 c0             	movzx  eax,al
  806101:	89 c7                	mov    edi,eax
  806103:	e8 f8 e8 ff ff       	call   804a00 <inb>
  806108:	0f b6 c0             	movzx  eax,al
  80610b:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  80610e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806111:	89 c6                	mov    esi,eax
  806113:	bf 76 1c 81 00       	mov    edi,0x811c76
  806118:	b8 00 00 00 00       	mov    eax,0x0
  80611d:	e8 cf ab ff ff       	call   800cf1 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  806122:	48 8b 05 f7 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226f7]        # 428820 <running_req>
  806129:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  806130:	48 8b 05 e9 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226e9]        # 428820 <running_req>
  806137:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  80613b:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  806142:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  806145:	48 8b 05 dc 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226dc]        # 428828 <running_devman_req>
  80614c:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  806153:	00 00 00 
    running_devman_req=NULL;
  806156:	48 c7 05 c7 26 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc226c7],0x0        # 428828 <running_devman_req>
  80615d:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806161:	48 c7 05 b4 26 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc226b4],0x0        # 428820 <running_req>
  806168:	00 00 00 00 
    return 0;
  80616c:	b8 00 00 00 00       	mov    eax,0x0
}
  806171:	c9                   	leave  
  806172:	c3                   	ret    

0000000000806173 <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  806173:	f3 0f 1e fa          	endbr64 
  806177:	55                   	push   rbp
  806178:	48 89 e5             	mov    rbp,rsp
  80617b:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  80617e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806181:	48 63 d0             	movsxd rdx,eax
  806184:	48 89 d0             	mov    rax,rdx
  806187:	48 01 c0             	add    rax,rax
  80618a:	48 01 d0             	add    rax,rdx
  80618d:	48 c1 e0 04          	shl    rax,0x4
  806191:	48 05 3c 5b 42 00    	add    rax,0x425b3c
  806197:	8b 00                	mov    eax,DWORD PTR [rax]
}
  806199:	5d                   	pop    rbp
  80619a:	c3                   	ret    

000000000080619b <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  80619b:	f3 0f 1e fa          	endbr64 
  80619f:	55                   	push   rbp
  8061a0:	48 89 e5             	mov    rbp,rsp
  8061a3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8061a6:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8061a9:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8061ac:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  8061af:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  8061b3:	8b 05 9b 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2269b]        # 428854 <tail>
  8061b9:	83 c0 01             	add    eax,0x1
  8061bc:	48 63 d0             	movsxd rdx,eax
  8061bf:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  8061c6:	48 c1 ea 20          	shr    rdx,0x20
  8061ca:	01 c2                	add    edx,eax
  8061cc:	c1 fa 07             	sar    edx,0x7
  8061cf:	89 c1                	mov    ecx,eax
  8061d1:	c1 f9 1f             	sar    ecx,0x1f
  8061d4:	29 ca                	sub    edx,ecx
  8061d6:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  8061dc:	29 c8                	sub    eax,ecx
  8061de:	89 c2                	mov    edx,eax
  8061e0:	8b 05 6a 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2266a]        # 428850 <head>
  8061e6:	39 c2                	cmp    edx,eax
  8061e8:	75 0a                	jne    8061f4 <request+0x59>
    {
        return -1;
  8061ea:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8061ef:	e9 0d 01 00 00       	jmp    806301 <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  8061f4:	8b 05 5a 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2265a]        # 428854 <tail>
  8061fa:	48 63 d0             	movsxd rdx,eax
  8061fd:	48 89 d0             	mov    rax,rdx
  806200:	48 01 c0             	add    rax,rax
  806203:	48 01 d0             	add    rax,rdx
  806206:	48 c1 e0 04          	shl    rax,0x4
  80620a:	48 8d 90 24 5b 42 00 	lea    rdx,[rax+0x425b24]
  806211:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806214:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  806216:	8b 05 38 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22638]        # 428854 <tail>
  80621c:	48 63 d0             	movsxd rdx,eax
  80621f:	48 89 d0             	mov    rax,rdx
  806222:	48 01 c0             	add    rax,rax
  806225:	48 01 d0             	add    rax,rdx
  806228:	48 c1 e0 04          	shl    rax,0x4
  80622c:	48 8d 90 20 5b 42 00 	lea    rdx,[rax+0x425b20]
  806233:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806236:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  806238:	8b 05 16 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22616]        # 428854 <tail>
  80623e:	48 63 d0             	movsxd rdx,eax
  806241:	48 89 d0             	mov    rax,rdx
  806244:	48 01 c0             	add    rax,rax
  806247:	48 01 d0             	add    rax,rdx
  80624a:	48 c1 e0 04          	shl    rax,0x4
  80624e:	48 8d 90 28 5b 42 00 	lea    rdx,[rax+0x425b28]
  806255:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806258:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  80625a:	8b 05 f4 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc225f4]        # 428854 <tail>
  806260:	48 63 d0             	movsxd rdx,eax
  806263:	48 89 d0             	mov    rax,rdx
  806266:	48 01 c0             	add    rax,rax
  806269:	48 01 d0             	add    rax,rdx
  80626c:	48 c1 e0 04          	shl    rax,0x4
  806270:	48 8d 90 2c 5b 42 00 	lea    rdx,[rax+0x425b2c]
  806277:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80627a:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  80627c:	8b 05 d2 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc225d2]        # 428854 <tail>
  806282:	48 63 d0             	movsxd rdx,eax
  806285:	48 89 d0             	mov    rax,rdx
  806288:	48 01 c0             	add    rax,rax
  80628b:	48 01 d0             	add    rax,rdx
  80628e:	48 c1 e0 04          	shl    rax,0x4
  806292:	48 05 3c 5b 42 00    	add    rax,0x425b3c
  806298:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  80629e:	8b 05 b0 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc225b0]        # 428854 <tail>
  8062a4:	48 63 d0             	movsxd rdx,eax
  8062a7:	48 89 d0             	mov    rax,rdx
  8062aa:	48 01 c0             	add    rax,rax
  8062ad:	48 01 d0             	add    rax,rdx
  8062b0:	48 c1 e0 04          	shl    rax,0x4
  8062b4:	48 8d 90 30 5b 42 00 	lea    rdx,[rax+0x425b30]
  8062bb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8062bf:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  8062c2:	8b 05 8c 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2258c]        # 428854 <tail>
  8062c8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  8062cb:	8b 05 83 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22583]        # 428854 <tail>
  8062d1:	8d 50 01             	lea    edx,[rax+0x1]
  8062d4:	48 63 c2             	movsxd rax,edx
  8062d7:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  8062de:	48 c1 e8 20          	shr    rax,0x20
  8062e2:	01 d0                	add    eax,edx
  8062e4:	c1 f8 07             	sar    eax,0x7
  8062e7:	89 d1                	mov    ecx,edx
  8062e9:	c1 f9 1f             	sar    ecx,0x1f
  8062ec:	29 c8                	sub    eax,ecx
  8062ee:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8062f4:	89 d0                	mov    eax,edx
  8062f6:	29 c8                	sub    eax,ecx
  8062f8:	89 05 56 25 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc22556],eax        # 428854 <tail>
    return r;
  8062fe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806301:	5d                   	pop    rbp
  806302:	c3                   	ret    

0000000000806303 <execute_request>:
int execute_request(){
  806303:	f3 0f 1e fa          	endbr64 
  806307:	55                   	push   rbp
  806308:	48 89 e5             	mov    rbp,rsp
  80630b:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  80630f:	48 8b 05 0a 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2250a]        # 428820 <running_req>
  806316:	48 85 c0             	test   rax,rax
  806319:	74 6a                	je     806385 <execute_request+0x82>
    {
        running_req->time++;
  80631b:	48 8b 05 fe 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224fe]        # 428820 <running_req>
  806322:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  806325:	83 c2 01             	add    edx,0x1
  806328:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  80632b:	48 8b 05 ee 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224ee]        # 428820 <running_req>
  806332:	8b 00                	mov    eax,DWORD PTR [rax]
  806334:	83 f8 02             	cmp    eax,0x2
  806337:	74 0a                	je     806343 <execute_request+0x40>
            return 2;
  806339:	b8 02 00 00 00       	mov    eax,0x2
  80633e:	e9 b4 01 00 00       	jmp    8064f7 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  806343:	48 8b 05 d6 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224d6]        # 428820 <running_req>
  80634a:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80634d:	83 f8 0a             	cmp    eax,0xa
  806350:	7e 29                	jle    80637b <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  806352:	48 8b 05 c7 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224c7]        # 428820 <running_req>
  806359:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  806360:	48 8b 05 b9 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224b9]        # 428820 <running_req>
  806367:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  80636e:	48 c7 05 a7 24 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc224a7],0x0        # 428820 <running_req>
  806375:	00 00 00 00 
  806379:	eb 0a                	jmp    806385 <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  80637b:	b8 02 00 00 00       	mov    eax,0x2
  806380:	e9 72 01 00 00       	jmp    8064f7 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  806385:	8b 15 c5 24 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc224c5]        # 428850 <head>
  80638b:	8b 05 c3 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc224c3]        # 428854 <tail>
  806391:	39 c2                	cmp    edx,eax
  806393:	75 0a                	jne    80639f <execute_request+0x9c>
  806395:	b8 01 00 00 00       	mov    eax,0x1
  80639a:	e9 58 01 00 00       	jmp    8064f7 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  80639f:	8b 05 ab 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc224ab]        # 428850 <head>
  8063a5:	48 63 d0             	movsxd rdx,eax
  8063a8:	48 89 d0             	mov    rax,rdx
  8063ab:	48 01 c0             	add    rax,rax
  8063ae:	48 01 d0             	add    rax,rdx
  8063b1:	48 c1 e0 04          	shl    rax,0x4
  8063b5:	48 05 20 5b 42 00    	add    rax,0x425b20
  8063bb:	48 89 05 5e 24 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2245e],rax        # 428820 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  8063c2:	8b 05 88 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22488]        # 428850 <head>
  8063c8:	8d 50 01             	lea    edx,[rax+0x1]
  8063cb:	48 63 c2             	movsxd rax,edx
  8063ce:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  8063d5:	48 c1 e8 20          	shr    rax,0x20
  8063d9:	01 d0                	add    eax,edx
  8063db:	c1 f8 07             	sar    eax,0x7
  8063de:	89 d1                	mov    ecx,edx
  8063e0:	c1 f9 1f             	sar    ecx,0x1f
  8063e3:	29 c8                	sub    eax,ecx
  8063e5:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8063eb:	89 d0                	mov    eax,edx
  8063ed:	29 c8                	sub    eax,ecx
  8063ef:	89 05 5b 24 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2245b],eax        # 428850 <head>
    running_req->stat=REQ_STAT_WORKING;
  8063f5:	48 8b 05 24 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22424]        # 428820 <running_req>
  8063fc:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  806403:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  80640a:	48 8b 05 0f 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2240f]        # 428820 <running_req>
  806411:	8b 00                	mov    eax,DWORD PTR [rax]
  806413:	83 f8 03             	cmp    eax,0x3
  806416:	0f 84 ad 00 00 00    	je     8064c9 <execute_request+0x1c6>
  80641c:	83 f8 03             	cmp    eax,0x3
  80641f:	0f 8f bf 00 00 00    	jg     8064e4 <execute_request+0x1e1>
  806425:	83 f8 02             	cmp    eax,0x2
  806428:	0f 84 85 00 00 00    	je     8064b3 <execute_request+0x1b0>
  80642e:	83 f8 02             	cmp    eax,0x2
  806431:	0f 8f ad 00 00 00    	jg     8064e4 <execute_request+0x1e1>
  806437:	85 c0                	test   eax,eax
  806439:	74 0a                	je     806445 <execute_request+0x142>
  80643b:	83 f8 01             	cmp    eax,0x1
  80643e:	74 3c                	je     80647c <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  806440:	e9 9f 00 00 00       	jmp    8064e4 <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  806445:	48 8b 05 d4 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc223d4]        # 428820 <running_req>
        r=async_read_disk(running_req->disk,\
  80644c:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  806450:	48 8b 05 c9 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc223c9]        # 428820 <running_req>
        r=async_read_disk(running_req->disk,\
  806457:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  80645a:	48 8b 05 bf 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc223bf]        # 428820 <running_req>
  806461:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  806464:	89 c6                	mov    esi,eax
  806466:	48 8b 05 b3 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc223b3]        # 428820 <running_req>
  80646d:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806470:	89 c7                	mov    edi,eax
  806472:	e8 a7 00 00 00       	call   80651e <async_read_disk>
  806477:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  80647a:	eb 69                	jmp    8064e5 <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  80647c:	48 8b 05 9d 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2239d]        # 428820 <running_req>
        r=async_write_disk(running_req->disk,\
  806483:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  806487:	48 8b 05 92 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22392]        # 428820 <running_req>
        r=async_write_disk(running_req->disk,\
  80648e:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  806491:	48 8b 05 88 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22388]        # 428820 <running_req>
  806498:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  80649b:	89 c6                	mov    esi,eax
  80649d:	48 8b 05 7c 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2237c]        # 428820 <running_req>
  8064a4:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8064a7:	89 c7                	mov    edi,eax
  8064a9:	e8 88 01 00 00       	call   806636 <async_write_disk>
  8064ae:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8064b1:	eb 32                	jmp    8064e5 <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  8064b3:	48 8b 05 66 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22366]        # 428820 <running_req>
  8064ba:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8064bd:	89 c7                	mov    edi,eax
  8064bf:	e8 77 06 00 00       	call   806b3b <async_check_disk>
  8064c4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8064c7:	eb 1c                	jmp    8064e5 <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  8064c9:	48 8b 05 50 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22350]        # 428820 <running_req>
  8064d0:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8064d3:	89 c7                	mov    edi,eax
  8064d5:	b8 00 00 00 00       	mov    eax,0x0
  8064da:	e8 1a 00 00 00       	call   8064f9 <async_reset_disk>
  8064df:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8064e2:	eb 01                	jmp    8064e5 <execute_request+0x1e2>
        break;
  8064e4:	90                   	nop
    }
    if(r==-1)return -1;
  8064e5:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8064e9:	75 07                	jne    8064f2 <execute_request+0x1ef>
  8064eb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8064f0:	eb 05                	jmp    8064f7 <execute_request+0x1f4>
    return 0;
  8064f2:	b8 00 00 00 00       	mov    eax,0x0
}
  8064f7:	c9                   	leave  
  8064f8:	c3                   	ret    

00000000008064f9 <async_reset_disk>:
int async_reset_disk(int disk)
{
  8064f9:	f3 0f 1e fa          	endbr64 
  8064fd:	55                   	push   rbp
  8064fe:	48 89 e5             	mov    rbp,rsp
  806501:	48 83 ec 10          	sub    rsp,0x10
  806505:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  806508:	be 0c 00 00 00       	mov    esi,0xc
  80650d:	bf f6 03 00 00       	mov    edi,0x3f6
  806512:	e8 c9 e4 ff ff       	call   8049e0 <outb>
    return 0;
  806517:	b8 00 00 00 00       	mov    eax,0x0
}
  80651c:	c9                   	leave  
  80651d:	c3                   	ret    

000000000080651e <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  80651e:	f3 0f 1e fa          	endbr64 
  806522:	55                   	push   rbp
  806523:	48 89 e5             	mov    rbp,rsp
  806526:	48 83 ec 30          	sub    rsp,0x30
  80652a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80652d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806530:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806533:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  806537:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  80653d:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806544:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806548:	74 06                	je     806550 <async_read_disk+0x32>
  80654a:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80654e:	75 06                	jne    806556 <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  806550:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806556:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80655a:	74 06                	je     806562 <async_read_disk+0x44>
  80655c:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806560:	75 07                	jne    806569 <async_read_disk+0x4b>
        slave_disk=1;
  806562:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  806569:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80656c:	0f b6 d0             	movzx  edx,al
  80656f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806573:	83 c0 02             	add    eax,0x2
  806576:	0f b7 c0             	movzx  eax,ax
  806579:	89 d6                	mov    esi,edx
  80657b:	89 c7                	mov    edi,eax
  80657d:	e8 5e e4 ff ff       	call   8049e0 <outb>
    outb(port+3,lba&0xff);
  806582:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806585:	0f b6 d0             	movzx  edx,al
  806588:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80658c:	83 c0 03             	add    eax,0x3
  80658f:	0f b7 c0             	movzx  eax,ax
  806592:	89 d6                	mov    esi,edx
  806594:	89 c7                	mov    edi,eax
  806596:	e8 45 e4 ff ff       	call   8049e0 <outb>
    outb(port+4,(lba>>8)&0xff);
  80659b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80659e:	c1 e8 08             	shr    eax,0x8
  8065a1:	0f b6 d0             	movzx  edx,al
  8065a4:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8065a8:	83 c0 04             	add    eax,0x4
  8065ab:	0f b7 c0             	movzx  eax,ax
  8065ae:	89 d6                	mov    esi,edx
  8065b0:	89 c7                	mov    edi,eax
  8065b2:	e8 29 e4 ff ff       	call   8049e0 <outb>
    outb(port+5,(lba>>16)&0xff);
  8065b7:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8065ba:	c1 e8 10             	shr    eax,0x10
  8065bd:	0f b6 d0             	movzx  edx,al
  8065c0:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8065c4:	83 c0 05             	add    eax,0x5
  8065c7:	0f b7 c0             	movzx  eax,ax
  8065ca:	89 d6                	mov    esi,edx
  8065cc:	89 c7                	mov    edi,eax
  8065ce:	e8 0d e4 ff ff       	call   8049e0 <outb>
    char drv=slave_disk?0x10:0;
  8065d3:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  8065d7:	74 07                	je     8065e0 <async_read_disk+0xc2>
  8065d9:	b8 10 00 00 00       	mov    eax,0x10
  8065de:	eb 05                	jmp    8065e5 <async_read_disk+0xc7>
  8065e0:	b8 00 00 00 00       	mov    eax,0x0
  8065e5:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  8065e8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8065eb:	c1 e8 18             	shr    eax,0x18
  8065ee:	83 e0 0f             	and    eax,0xf
  8065f1:	89 c2                	mov    edx,eax
  8065f3:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  8065f7:	09 d0                	or     eax,edx
  8065f9:	83 c8 e0             	or     eax,0xffffffe0
  8065fc:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  8065ff:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  806603:	0f b6 d0             	movzx  edx,al
  806606:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80660a:	83 c0 06             	add    eax,0x6
  80660d:	0f b7 c0             	movzx  eax,ax
  806610:	89 d6                	mov    esi,edx
  806612:	89 c7                	mov    edi,eax
  806614:	e8 c7 e3 ff ff       	call   8049e0 <outb>
    outb(port+7,DISK_CMD_READ);
  806619:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80661d:	83 c0 07             	add    eax,0x7
  806620:	0f b7 c0             	movzx  eax,ax
  806623:	be 20 00 00 00       	mov    esi,0x20
  806628:	89 c7                	mov    edi,eax
  80662a:	e8 b1 e3 ff ff       	call   8049e0 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  80662f:	b8 00 00 00 00       	mov    eax,0x0
}
  806634:	c9                   	leave  
  806635:	c3                   	ret    

0000000000806636 <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  806636:	f3 0f 1e fa          	endbr64 
  80663a:	55                   	push   rbp
  80663b:	48 89 e5             	mov    rbp,rsp
  80663e:	48 83 ec 30          	sub    rsp,0x30
  806642:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806645:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806648:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  80664b:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  80664f:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  806655:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80665c:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806660:	74 06                	je     806668 <async_write_disk+0x32>
  806662:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806666:	75 06                	jne    80666e <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  806668:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  80666e:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806672:	74 06                	je     80667a <async_write_disk+0x44>
  806674:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806678:	75 07                	jne    806681 <async_write_disk+0x4b>
        slave_disk=1;
  80667a:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  806681:	bf f7 00 00 00       	mov    edi,0xf7
  806686:	e8 75 e3 ff ff       	call   804a00 <inb>
  80668b:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  80668e:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  806692:	83 e0 01             	and    eax,0x1
  806695:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  806698:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  80669c:	74 0a                	je     8066a8 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  80669e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8066a3:	e9 d5 00 00 00       	jmp    80677d <async_write_disk+0x147>
        }
        t&=0x88;
  8066a8:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  8066ac:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  8066b0:	74 02                	je     8066b4 <async_write_disk+0x7e>
    {
  8066b2:	eb cd                	jmp    806681 <async_write_disk+0x4b>
        if(t==0x8)break;
  8066b4:	90                   	nop
    }
    outb(port+2,sec_n);
  8066b5:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8066b8:	0f b6 d0             	movzx  edx,al
  8066bb:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8066bf:	83 c0 02             	add    eax,0x2
  8066c2:	0f b7 c0             	movzx  eax,ax
  8066c5:	89 d6                	mov    esi,edx
  8066c7:	89 c7                	mov    edi,eax
  8066c9:	e8 12 e3 ff ff       	call   8049e0 <outb>
    outb(port+3,lba&0xff);
  8066ce:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8066d1:	0f b6 d0             	movzx  edx,al
  8066d4:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8066d8:	83 c0 03             	add    eax,0x3
  8066db:	0f b7 c0             	movzx  eax,ax
  8066de:	89 d6                	mov    esi,edx
  8066e0:	89 c7                	mov    edi,eax
  8066e2:	e8 f9 e2 ff ff       	call   8049e0 <outb>
    outb(port+4,(lba>>8)&0xff);
  8066e7:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8066ea:	c1 e8 08             	shr    eax,0x8
  8066ed:	0f b6 d0             	movzx  edx,al
  8066f0:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8066f4:	83 c0 04             	add    eax,0x4
  8066f7:	0f b7 c0             	movzx  eax,ax
  8066fa:	89 d6                	mov    esi,edx
  8066fc:	89 c7                	mov    edi,eax
  8066fe:	e8 dd e2 ff ff       	call   8049e0 <outb>
    outb(port+5,(lba>>16)&0xff);
  806703:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806706:	c1 e8 10             	shr    eax,0x10
  806709:	0f b6 d0             	movzx  edx,al
  80670c:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806710:	83 c0 05             	add    eax,0x5
  806713:	0f b7 c0             	movzx  eax,ax
  806716:	89 d6                	mov    esi,edx
  806718:	89 c7                	mov    edi,eax
  80671a:	e8 c1 e2 ff ff       	call   8049e0 <outb>
    char drv=slave_disk?0x10:0;
  80671f:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806723:	74 07                	je     80672c <async_write_disk+0xf6>
  806725:	b8 10 00 00 00       	mov    eax,0x10
  80672a:	eb 05                	jmp    806731 <async_write_disk+0xfb>
  80672c:	b8 00 00 00 00       	mov    eax,0x0
  806731:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  806734:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806737:	c1 e8 18             	shr    eax,0x18
  80673a:	83 e0 0f             	and    eax,0xf
  80673d:	89 c2                	mov    edx,eax
  80673f:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  806743:	09 d0                	or     eax,edx
  806745:	83 c8 e0             	or     eax,0xffffffe0
  806748:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  80674b:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80674f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806753:	83 c0 06             	add    eax,0x6
  806756:	0f b7 c0             	movzx  eax,ax
  806759:	89 d6                	mov    esi,edx
  80675b:	89 c7                	mov    edi,eax
  80675d:	e8 7e e2 ff ff       	call   8049e0 <outb>
    outb(port+7,DISK_CMD_WRITE);
  806762:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806766:	83 c0 07             	add    eax,0x7
  806769:	0f b7 c0             	movzx  eax,ax
  80676c:	be 30 00 00 00       	mov    esi,0x30
  806771:	89 c7                	mov    edi,eax
  806773:	e8 68 e2 ff ff       	call   8049e0 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  806778:	b8 00 00 00 00       	mov    eax,0x0
}
  80677d:	c9                   	leave  
  80677e:	c3                   	ret    

000000000080677f <read_disk>:
int read_disk(driver_args* args)
{
  80677f:	f3 0f 1e fa          	endbr64 
  806783:	55                   	push   rbp
  806784:	48 89 e5             	mov    rbp,rsp
  806787:	48 83 ec 20          	sub    rsp,0x20
  80678b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  80678f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806793:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806796:	48 98                	cdqe   
  806798:	48 89 c2             	mov    rdx,rax
  80679b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80679f:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8067a2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8067a6:	8b 00                	mov    eax,DWORD PTR [rax]
  8067a8:	89 ce                	mov    esi,ecx
  8067aa:	89 c7                	mov    edi,eax
  8067ac:	e8 7a 05 00 00       	call   806d2b <read_disk_asm>
  8067b1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  8067b4:	48 8b 05 65 20 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22065]        # 428820 <running_req>
  8067bb:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8067c2:	48 8b 05 57 20 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22057]        # 428820 <running_req>
  8067c9:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8067cd:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8067d4:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8067d7:	48 c7 05 3e 20 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2203e],0x0        # 428820 <running_req>
  8067de:	00 00 00 00 
    return ret;
  8067e2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8067e5:	c9                   	leave  
  8067e6:	c3                   	ret    

00000000008067e7 <write_disk>:
int write_disk(driver_args* args)
{
  8067e7:	f3 0f 1e fa          	endbr64 
  8067eb:	55                   	push   rbp
  8067ec:	48 89 e5             	mov    rbp,rsp
  8067ef:	48 83 ec 20          	sub    rsp,0x20
  8067f3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  8067f7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8067fb:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8067fe:	48 98                	cdqe   
  806800:	48 89 c2             	mov    rdx,rax
  806803:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806807:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80680a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80680e:	8b 00                	mov    eax,DWORD PTR [rax]
  806810:	89 ce                	mov    esi,ecx
  806812:	89 c7                	mov    edi,eax
  806814:	e8 8a 05 00 00       	call   806da3 <write_disk_asm>
  806819:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  80681c:	48 8b 05 fd 1f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21ffd]        # 428820 <running_req>
  806823:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  80682a:	48 8b 05 ef 1f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21fef]        # 428820 <running_req>
  806831:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806835:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  80683c:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  80683f:	48 c7 05 d6 1f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21fd6],0x0        # 428820 <running_req>
  806846:	00 00 00 00 
    return ret;
  80684a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80684d:	c9                   	leave  
  80684e:	c3                   	ret    

000000000080684f <chk_result>:
int chk_result(int r)
{
  80684f:	f3 0f 1e fa          	endbr64 
  806853:	55                   	push   rbp
  806854:	48 89 e5             	mov    rbp,rsp
  806857:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  80685a:	90                   	nop
  80685b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80685e:	48 63 d0             	movsxd rdx,eax
  806861:	48 89 d0             	mov    rax,rdx
  806864:	48 01 c0             	add    rax,rax
  806867:	48 01 d0             	add    rax,rdx
  80686a:	48 c1 e0 04          	shl    rax,0x4
  80686e:	48 05 3c 5b 42 00    	add    rax,0x425b3c
  806874:	8b 00                	mov    eax,DWORD PTR [rax]
  806876:	83 f8 03             	cmp    eax,0x3
  806879:	75 e0                	jne    80685b <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  80687b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80687e:	48 63 d0             	movsxd rdx,eax
  806881:	48 89 d0             	mov    rax,rdx
  806884:	48 01 c0             	add    rax,rax
  806887:	48 01 d0             	add    rax,rdx
  80688a:	48 c1 e0 04          	shl    rax,0x4
  80688e:	48 05 40 5b 42 00    	add    rax,0x425b40
  806894:	8b 00                	mov    eax,DWORD PTR [rax]
  806896:	83 f8 01             	cmp    eax,0x1
  806899:	0f 94 c0             	sete   al
  80689c:	0f b6 c0             	movzx  eax,al
}
  80689f:	5d                   	pop    rbp
  8068a0:	c3                   	ret    

00000000008068a1 <disk_existent>:
int disk_existent(int disk)
{
  8068a1:	f3 0f 1e fa          	endbr64 
  8068a5:	55                   	push   rbp
  8068a6:	48 89 e5             	mov    rbp,rsp
  8068a9:	48 83 ec 10          	sub    rsp,0x10
  8068ad:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  8068b0:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8068b4:	74 5f                	je     806915 <disk_existent+0x74>
  8068b6:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8068ba:	7f 6e                	jg     80692a <disk_existent+0x89>
  8068bc:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8068c0:	74 3e                	je     806900 <disk_existent+0x5f>
  8068c2:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8068c6:	7f 62                	jg     80692a <disk_existent+0x89>
  8068c8:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8068cc:	74 08                	je     8068d6 <disk_existent+0x35>
  8068ce:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  8068d2:	74 17                	je     8068eb <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  8068d4:	eb 54                	jmp    80692a <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  8068d6:	bf 94 1c 81 00       	mov    edi,0x811c94
  8068db:	e8 3e c5 ff ff       	call   802e1e <sys_find_dev>
  8068e0:	83 f8 ff             	cmp    eax,0xffffffff
  8068e3:	0f 95 c0             	setne  al
  8068e6:	0f b6 c0             	movzx  eax,al
  8068e9:	eb 45                	jmp    806930 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  8068eb:	bf 98 1c 81 00       	mov    edi,0x811c98
  8068f0:	e8 29 c5 ff ff       	call   802e1e <sys_find_dev>
  8068f5:	83 f8 ff             	cmp    eax,0xffffffff
  8068f8:	0f 95 c0             	setne  al
  8068fb:	0f b6 c0             	movzx  eax,al
  8068fe:	eb 30                	jmp    806930 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  806900:	bf 9c 1c 81 00       	mov    edi,0x811c9c
  806905:	e8 14 c5 ff ff       	call   802e1e <sys_find_dev>
  80690a:	83 f8 ff             	cmp    eax,0xffffffff
  80690d:	0f 95 c0             	setne  al
  806910:	0f b6 c0             	movzx  eax,al
  806913:	eb 1b                	jmp    806930 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  806915:	bf a0 1c 81 00       	mov    edi,0x811ca0
  80691a:	e8 ff c4 ff ff       	call   802e1e <sys_find_dev>
  80691f:	83 f8 ff             	cmp    eax,0xffffffff
  806922:	0f 95 c0             	setne  al
  806925:	0f b6 c0             	movzx  eax,al
  806928:	eb 06                	jmp    806930 <disk_existent+0x8f>
        break;
  80692a:	90                   	nop
    }
    return 0;
  80692b:	b8 00 00 00 00       	mov    eax,0x0
}
  806930:	c9                   	leave  
  806931:	c3                   	ret    

0000000000806932 <hd_iterate>:
int hd_iterate()
{
  806932:	f3 0f 1e fa          	endbr64 
  806936:	55                   	push   rbp
  806937:	48 89 e5             	mov    rbp,rsp
  80693a:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  806941:	41 b8 00 00 00 00    	mov    r8d,0x0
  806947:	b9 01 00 00 00       	mov    ecx,0x1
  80694c:	ba 00 00 00 00       	mov    edx,0x0
  806951:	be 02 00 00 00       	mov    esi,0x2
  806956:	bf 00 00 00 00       	mov    edi,0x0
  80695b:	e8 3b f8 ff ff       	call   80619b <request>
  806960:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  806963:	41 b8 00 00 00 00    	mov    r8d,0x0
  806969:	b9 01 00 00 00       	mov    ecx,0x1
  80696e:	ba 00 00 00 00       	mov    edx,0x0
  806973:	be 02 00 00 00       	mov    esi,0x2
  806978:	bf 01 00 00 00       	mov    edi,0x1
  80697d:	e8 19 f8 ff ff       	call   80619b <request>
  806982:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  806985:	41 b8 00 00 00 00    	mov    r8d,0x0
  80698b:	b9 01 00 00 00       	mov    ecx,0x1
  806990:	ba 00 00 00 00       	mov    edx,0x0
  806995:	be 02 00 00 00       	mov    esi,0x2
  80699a:	bf 02 00 00 00       	mov    edi,0x2
  80699f:	e8 f7 f7 ff ff       	call   80619b <request>
  8069a4:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  8069a7:	41 b8 00 00 00 00    	mov    r8d,0x0
  8069ad:	b9 01 00 00 00       	mov    ecx,0x1
  8069b2:	ba 00 00 00 00       	mov    edx,0x0
  8069b7:	be 02 00 00 00       	mov    esi,0x2
  8069bc:	bf 03 00 00 00       	mov    edi,0x3
  8069c1:	e8 d5 f7 ff ff       	call   80619b <request>
  8069c6:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<4;i++)
  8069c9:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8069d0:	e9 5a 01 00 00       	jmp    806b2f <hd_iterate+0x1fd>
    {
        int disk;
        switch (i)
  8069d5:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8069d9:	74 3b                	je     806a16 <hd_iterate+0xe4>
  8069db:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8069df:	7f 3e                	jg     806a1f <hd_iterate+0xed>
  8069e1:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8069e5:	74 26                	je     806a0d <hd_iterate+0xdb>
  8069e7:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8069eb:	7f 32                	jg     806a1f <hd_iterate+0xed>
  8069ed:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8069f1:	74 08                	je     8069fb <hd_iterate+0xc9>
  8069f3:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8069f7:	74 0b                	je     806a04 <hd_iterate+0xd2>
  8069f9:	eb 24                	jmp    806a1f <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  8069fb:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  806a02:	eb 25                	jmp    806a29 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  806a04:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  806a0b:	eb 1c                	jmp    806a29 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  806a0d:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  806a14:	eb 13                	jmp    806a29 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  806a16:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  806a1d:	eb 0a                	jmp    806a29 <hd_iterate+0xf7>
        default:
            return -1;
  806a1f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806a24:	e9 10 01 00 00       	jmp    806b39 <hd_iterate+0x207>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  806a29:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806a2c:	48 98                	cdqe   
  806a2e:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  806a32:	89 c7                	mov    edi,eax
  806a34:	e8 16 fe ff ff       	call   80684f <chk_result>
  806a39:	85 c0                	test   eax,eax
  806a3b:	74 6d                	je     806aaa <hd_iterate+0x178>
        {
            //新硬盘
            device hd={
  806a3d:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  806a44:	b8 00 00 00 00       	mov    eax,0x0
  806a49:	b9 15 00 00 00       	mov    ecx,0x15
  806a4e:	48 89 d7             	mov    rdi,rdx
  806a51:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  806a54:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806a57:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  806a5d:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  806a64:	00 00 00 
  806a67:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  806a6e:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  806a71:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  806a75:	7f 07                	jg     806a7e <hd_iterate+0x14c>
  806a77:	b8 f0 01 00 00       	mov    eax,0x1f0
  806a7c:	eb 05                	jmp    806a83 <hd_iterate+0x151>
  806a7e:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  806a83:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  806a89:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  806a90:	48 89 c7             	mov    rdi,rax
  806a93:	e8 4e bf ff ff       	call   8029e6 <reg_device>
  806a98:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  806a9b:	48 63 d2             	movsxd rdx,edx
  806a9e:	89 04 95 40 88 42 00 	mov    DWORD PTR [rdx*4+0x428840],eax
  806aa5:	e9 81 00 00 00       	jmp    806b2b <hd_iterate+0x1f9>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  806aaa:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806aad:	48 98                	cdqe   
  806aaf:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  806ab3:	89 c7                	mov    edi,eax
  806ab5:	e8 95 fd ff ff       	call   80684f <chk_result>
  806aba:	85 c0                	test   eax,eax
  806abc:	75 6d                	jne    806b2b <hd_iterate+0x1f9>
        {
            switch (i)
  806abe:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806ac2:	74 3e                	je     806b02 <hd_iterate+0x1d0>
  806ac4:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806ac8:	7f 41                	jg     806b0b <hd_iterate+0x1d9>
  806aca:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806ace:	74 28                	je     806af8 <hd_iterate+0x1c6>
  806ad0:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806ad4:	7f 35                	jg     806b0b <hd_iterate+0x1d9>
  806ad6:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  806ada:	74 08                	je     806ae4 <hd_iterate+0x1b2>
  806adc:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  806ae0:	74 0c                	je     806aee <hd_iterate+0x1bc>
  806ae2:	eb 27                	jmp    806b0b <hd_iterate+0x1d9>
            {
            case 0:name="hd0";break;
  806ae4:	48 c7 45 f8 94 1c 81 	mov    QWORD PTR [rbp-0x8],0x811c94
  806aeb:	00 
  806aec:	eb 1d                	jmp    806b0b <hd_iterate+0x1d9>
            case 1:name="hd1";break;
  806aee:	48 c7 45 f8 98 1c 81 	mov    QWORD PTR [rbp-0x8],0x811c98
  806af5:	00 
  806af6:	eb 13                	jmp    806b0b <hd_iterate+0x1d9>
            case 2:name="hd2";break;
  806af8:	48 c7 45 f8 9c 1c 81 	mov    QWORD PTR [rbp-0x8],0x811c9c
  806aff:	00 
  806b00:	eb 09                	jmp    806b0b <hd_iterate+0x1d9>
            case 3:name="hd3";break;
  806b02:	48 c7 45 f8 a0 1c 81 	mov    QWORD PTR [rbp-0x8],0x811ca0
  806b09:	00 
  806b0a:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  806b0b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806b0f:	48 89 c7             	mov    rdi,rax
  806b12:	e8 07 c3 ff ff       	call   802e1e <sys_find_dev>
  806b17:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  806b1a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806b1d:	89 c7                	mov    edi,eax
  806b1f:	e8 ce c9 ff ff       	call   8034f2 <get_dev>
  806b24:	89 c7                	mov    edi,eax
  806b26:	e8 1a c9 ff ff       	call   803445 <dispose_device>
    for(int i=0;i<4;i++)
  806b2b:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  806b2f:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806b33:	0f 8e 9c fe ff ff    	jle    8069d5 <hd_iterate+0xa3>
        }

    }
}
  806b39:	c9                   	leave  
  806b3a:	c3                   	ret    

0000000000806b3b <async_check_disk>:

int async_check_disk(int disk)
{
  806b3b:	f3 0f 1e fa          	endbr64 
  806b3f:	55                   	push   rbp
  806b40:	48 89 e5             	mov    rbp,rsp
  806b43:	48 83 ec 20          	sub    rsp,0x20
  806b47:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  806b4a:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  806b50:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806b56:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806b5a:	74 06                	je     806b62 <async_check_disk+0x27>
  806b5c:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806b60:	75 06                	jne    806b68 <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  806b62:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  806b68:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806b6c:	74 06                	je     806b74 <async_check_disk+0x39>
  806b6e:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806b72:	75 06                	jne    806b7a <async_check_disk+0x3f>
        chkcmd=0xf0;
  806b74:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  806b7a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806b7e:	83 c0 02             	add    eax,0x2
  806b81:	0f b7 c0             	movzx  eax,ax
  806b84:	be 01 00 00 00       	mov    esi,0x1
  806b89:	89 c7                	mov    edi,eax
  806b8b:	e8 50 de ff ff       	call   8049e0 <outb>
    outb(disknr+3,0);
  806b90:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806b94:	83 c0 03             	add    eax,0x3
  806b97:	0f b7 c0             	movzx  eax,ax
  806b9a:	be 00 00 00 00       	mov    esi,0x0
  806b9f:	89 c7                	mov    edi,eax
  806ba1:	e8 3a de ff ff       	call   8049e0 <outb>
    outb(disknr+4,0);
  806ba6:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806baa:	83 c0 04             	add    eax,0x4
  806bad:	0f b7 c0             	movzx  eax,ax
  806bb0:	be 00 00 00 00       	mov    esi,0x0
  806bb5:	89 c7                	mov    edi,eax
  806bb7:	e8 24 de ff ff       	call   8049e0 <outb>
    outb(disknr+5,0);
  806bbc:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806bc0:	83 c0 05             	add    eax,0x5
  806bc3:	0f b7 c0             	movzx  eax,ax
  806bc6:	be 00 00 00 00       	mov    esi,0x0
  806bcb:	89 c7                	mov    edi,eax
  806bcd:	e8 0e de ff ff       	call   8049e0 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  806bd2:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  806bd6:	0f b6 d0             	movzx  edx,al
  806bd9:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806bdd:	83 c0 06             	add    eax,0x6
  806be0:	0f b7 c0             	movzx  eax,ax
  806be3:	89 d6                	mov    esi,edx
  806be5:	89 c7                	mov    edi,eax
  806be7:	e8 f4 dd ff ff       	call   8049e0 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  806bec:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806bf0:	83 c0 07             	add    eax,0x7
  806bf3:	0f b7 c0             	movzx  eax,ax
  806bf6:	be 90 00 00 00       	mov    esi,0x90
  806bfb:	89 c7                	mov    edi,eax
  806bfd:	e8 de dd ff ff       	call   8049e0 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  806c02:	b8 00 00 00 00       	mov    eax,0x0
}
  806c07:	c9                   	leave  
  806c08:	c3                   	ret    

0000000000806c09 <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  806c09:	f3 0f 1e fa          	endbr64 
  806c0d:	55                   	push   rbp
  806c0e:	48 89 e5             	mov    rbp,rsp
  806c11:	48 83 ec 18          	sub    rsp,0x18
  806c15:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  806c19:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  806c20:	eb 04                	jmp    806c26 <hd_do_req+0x1d>
  806c22:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806c26:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806c29:	48 98                	cdqe   
  806c2b:	8b 14 85 40 88 42 00 	mov    edx,DWORD PTR [rax*4+0x428840]
  806c32:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806c36:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  806c3c:	39 c2                	cmp    edx,eax
  806c3e:	75 e2                	jne    806c22 <hd_do_req+0x19>
    switch (args->cmd)
  806c40:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806c44:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  806c4a:	83 f8 04             	cmp    eax,0x4
  806c4d:	74 72                	je     806cc1 <hd_do_req+0xb8>
  806c4f:	83 f8 04             	cmp    eax,0x4
  806c52:	0f 8f 96 00 00 00    	jg     806cee <hd_do_req+0xe5>
  806c58:	83 f8 02             	cmp    eax,0x2
  806c5b:	74 0a                	je     806c67 <hd_do_req+0x5e>
  806c5d:	83 f8 03             	cmp    eax,0x3
  806c60:	74 32                	je     806c94 <hd_do_req+0x8b>
  806c62:	e9 87 00 00 00       	jmp    806cee <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  806c67:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806c6b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806c6e:	48 98                	cdqe   
  806c70:	48 89 c6             	mov    rsi,rax
  806c73:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806c77:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806c7a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806c7e:	8b 10                	mov    edx,DWORD PTR [rax]
  806c80:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806c83:	49 89 f0             	mov    r8,rsi
  806c86:	be 00 00 00 00       	mov    esi,0x0
  806c8b:	89 c7                	mov    edi,eax
  806c8d:	e8 09 f5 ff ff       	call   80619b <request>
        break;
  806c92:	eb 61                	jmp    806cf5 <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  806c94:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806c98:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806c9b:	48 98                	cdqe   
  806c9d:	48 89 c6             	mov    rsi,rax
  806ca0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806ca4:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806ca7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806cab:	8b 10                	mov    edx,DWORD PTR [rax]
  806cad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806cb0:	49 89 f0             	mov    r8,rsi
  806cb3:	be 01 00 00 00       	mov    esi,0x1
  806cb8:	89 c7                	mov    edi,eax
  806cba:	e8 dc f4 ff ff       	call   80619b <request>
        break;
  806cbf:	eb 34                	jmp    806cf5 <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  806cc1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806cc5:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806cc8:	48 98                	cdqe   
  806cca:	48 89 c6             	mov    rsi,rax
  806ccd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806cd1:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806cd4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806cd8:	8b 10                	mov    edx,DWORD PTR [rax]
  806cda:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806cdd:	49 89 f0             	mov    r8,rsi
  806ce0:	be 02 00 00 00       	mov    esi,0x2
  806ce5:	89 c7                	mov    edi,eax
  806ce7:	e8 af f4 ff ff       	call   80619b <request>
        break;
  806cec:	eb 07                	jmp    806cf5 <hd_do_req+0xec>
    default:return -1;
  806cee:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806cf3:	eb 1e                	jmp    806d13 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  806cf5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806cf9:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  806d00:	00 00 00 
    running_devman_req=args;
  806d03:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d07:	48 89 05 1a 1b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21b1a],rax        # 428828 <running_devman_req>
    return 0;
  806d0e:	b8 00 00 00 00       	mov    eax,0x0
  806d13:	c9                   	leave  
  806d14:	c3                   	ret    
  806d15:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  806d1c:	00 00 00 
  806d1f:	90                   	nop

0000000000806d20 <disk_int_handler>:
  806d20:	e8 f8 dc ff ff       	call   804a1d <eoi+0x4>
  806d25:	e8 86 f2 ff ff       	call   805fb0 <disk_int_handler_c+0x4>
  806d2a:	cf                   	iret   

0000000000806d2b <read_disk_asm>:
  806d2b:	55                   	push   rbp
  806d2c:	89 e5                	mov    ebp,esp
  806d2e:	66 ba f7 01          	mov    dx,0x1f7
  806d32:	31 c9                	xor    ecx,ecx
  806d34:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
  806d38:	8b 4c 24 0c          	mov    ecx,DWORD PTR [rsp+0xc]
  806d3c:	8b 5c 24 10          	mov    ebx,DWORD PTR [rsp+0x10]
  806d40:	89 c6                	mov    esi,eax
  806d42:	66 ba f2 01          	mov    dx,0x1f2
  806d46:	88 c8                	mov    al,cl
  806d48:	ee                   	out    dx,al
  806d49:	66 ba f3 01          	mov    dx,0x1f3
  806d4d:	89 f0                	mov    eax,esi
  806d4f:	ee                   	out    dx,al
  806d50:	66 42 c1 e8 08       	rex.X shr ax,0x8
  806d55:	ee                   	out    dx,al
  806d56:	66 42 c1 e8 08       	rex.X shr ax,0x8
  806d5b:	ee                   	out    dx,al
  806d5c:	66 42                	data16 rex.X
  806d5e:	66 c1 e8 08          	shr    ax,0x8
  806d62:	24 0f                	and    al,0xf
  806d64:	0c e0                	or     al,0xe0
  806d66:	ee                   	out    dx,al
  806d67:	66 42 b0 20          	data16 rex.X mov al,0x20
  806d6b:	ee                   	out    dx,al

0000000000806d6c <read_disk_asm.wait>:
  806d6c:	90                   	nop
  806d6d:	ec                   	in     al,dx
  806d6e:	24 88                	and    al,0x88
  806d70:	3c 08                	cmp    al,0x8
  806d72:	75 f8                	jne    806d6c <read_disk_asm.wait>
  806d74:	66 89 d7             	mov    di,dx
  806d77:	89 c8                	mov    eax,ecx
  806d79:	66 b9 00 01          	mov    cx,0x100
  806d7d:	66 f7 e1             	mul    cx
  806d80:	89 c1                	mov    ecx,eax
  806d82:	66 ba f0 01          	mov    dx,0x1f0

0000000000806d86 <read_disk_asm.read>:
  806d86:	66 ed                	in     ax,dx
  806d88:	66 89 03             	mov    WORD PTR [rbx],ax
  806d8b:	83 c3 02             	add    ebx,0x2
  806d8e:	e2 f6                	loop   806d86 <read_disk_asm.read>
  806d90:	c9                   	leave  
  806d91:	b8 00 00 00 00       	mov    eax,0x0
  806d96:	c3                   	ret    

0000000000806d97 <read_disk_asm.err_disk_reading>:
  806d97:	66 ba f1 01          	mov    dx,0x1f1
  806d9b:	31 c0                	xor    eax,eax
  806d9d:	66 ed                	in     ax,dx
  806d9f:	89 ec                	mov    esp,ebp
  806da1:	5d                   	pop    rbp
  806da2:	c3                   	ret    

0000000000806da3 <write_disk_asm>:
  806da3:	55                   	push   rbp
  806da4:	89 e5                	mov    ebp,esp
  806da6:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
  806daa:	8b 4c 24 0c          	mov    ecx,DWORD PTR [rsp+0xc]
  806dae:	8b 5c 24 10          	mov    ebx,DWORD PTR [rsp+0x10]
  806db2:	50                   	push   rax
  806db3:	66 ba f2 01          	mov    dx,0x1f2
  806db7:	88 c8                	mov    al,cl
  806db9:	ee                   	out    dx,al
  806dba:	58                   	pop    rax
  806dbb:	66 ba f3 01          	mov    dx,0x1f3
  806dbf:	ee                   	out    dx,al
  806dc0:	c1 e8 08             	shr    eax,0x8
  806dc3:	66 ba f4 01          	mov    dx,0x1f4
  806dc7:	ee                   	out    dx,al
  806dc8:	c1 e8 08             	shr    eax,0x8
  806dcb:	66 ba f5 01          	mov    dx,0x1f5
  806dcf:	ee                   	out    dx,al
  806dd0:	c1 e8 08             	shr    eax,0x8
  806dd3:	24 0f                	and    al,0xf
  806dd5:	0c e0                	or     al,0xe0
  806dd7:	66 ba f6 01          	mov    dx,0x1f6
  806ddb:	ee                   	out    dx,al
  806ddc:	66 ba f7 01          	mov    dx,0x1f7
  806de0:	b0 30                	mov    al,0x30
  806de2:	ee                   	out    dx,al

0000000000806de3 <write_disk_asm.not_ready2>:
  806de3:	90                   	nop
  806de4:	ec                   	in     al,dx
  806de5:	24 88                	and    al,0x88
  806de7:	3c 08                	cmp    al,0x8
  806de9:	75 f8                	jne    806de3 <write_disk_asm.not_ready2>
  806deb:	89 c8                	mov    eax,ecx
  806ded:	66 b9 00 01          	mov    cx,0x100
  806df1:	66 f7 e1             	mul    cx
  806df4:	89 c1                	mov    ecx,eax
  806df6:	66 ba f0 01          	mov    dx,0x1f0

0000000000806dfa <write_disk_asm.go_on_write>:
  806dfa:	66 8b 03             	mov    ax,WORD PTR [rbx]
  806dfd:	66 ef                	out    dx,ax
  806dff:	83 c3 02             	add    ebx,0x2
  806e02:	e2 f6                	loop   806dfa <write_disk_asm.go_on_write>
  806e04:	89 ec                	mov    esp,ebp
  806e06:	5d                   	pop    rbp
  806e07:	c3                   	ret    

0000000000806e08 <init_fat16>:

int fat16_drvi;
extern driver drv_disk;
extern int disk_drvi;
int init_fat16()
{
  806e08:	f3 0f 1e fa          	endbr64 
  806e0c:	55                   	push   rbp
  806e0d:	48 89 e5             	mov    rbp,rsp
  806e10:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
    reg_device(&fat16_dev);
  806e17:	bf 60 1d 81 00       	mov    edi,0x811d60
  806e1c:	e8 c5 bb ff ff       	call   8029e6 <reg_device>
    fat16_drvi=reg_driver(&fat16_drv);
  806e21:	bf c0 1c 81 00       	mov    edi,0x811cc0
  806e26:	e8 a3 be ff ff       	call   802cce <reg_driver>
  806e2b:	89 05 93 9c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29c93],eax        # 430ac4 <fat16_drvi>
    driver_args arg;
    load(&arg);//syscall(SYSCALL_CALL_DRVFUNC,fat16_drvi,DRVF_OPEN,&arg,0,0);
  806e31:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  806e38:	48 89 c7             	mov    rdi,rax
  806e3b:	e8 26 00 00 00       	call   806e66 <load>
    reg_vol(disk_drvi,fat16_drvi,"a");
  806e40:	8b 0d 7e 9c c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc29c7e]        # 430ac4 <fat16_drvi>
  806e46:	8b 05 e4 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc219e4]        # 428830 <disk_drvi>
  806e4c:	ba 08 1e 81 00       	mov    edx,0x811e08
  806e51:	89 ce                	mov    esi,ecx
  806e53:	89 c7                	mov    edi,eax
  806e55:	b8 00 00 00 00       	mov    eax,0x0
  806e5a:	e8 0f ab ff ff       	call   80196e <reg_vol>
    return 0;
  806e5f:	b8 00 00 00 00       	mov    eax,0x0
}
  806e64:	c9                   	leave  
  806e65:	c3                   	ret    

0000000000806e66 <load>:
int load(driver_args *args)
{
  806e66:	f3 0f 1e fa          	endbr64 
  806e6a:	55                   	push   rbp
  806e6b:	48 89 e5             	mov    rbp,rsp
  806e6e:	48 83 ec 20          	sub    rsp,0x20
  806e72:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    //sys_read superblock
    int req_id=-1;
  806e76:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    read_sec(&superblock,0,1);
  806e7d:	ba 01 00 00 00       	mov    edx,0x1
  806e82:	be 00 00 00 00       	mov    esi,0x0
  806e87:	bf 60 88 42 00       	mov    edi,0x428860
  806e8c:	e8 61 0b 00 00       	call   8079f2 <read_sec>
    //只能一个一个读
    read_sec(fat,superblock.rsvdSec,superblock.secPerFAT);
  806e91:	0f b7 05 de 19 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc219de]        # 428876 <superblock+0x16>
  806e98:	0f b7 d0             	movzx  edx,ax
  806e9b:	0f b7 05 cc 19 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc219cc]        # 42886e <superblock+0xe>
  806ea2:	0f b7 c0             	movzx  eax,ax
  806ea5:	89 c6                	mov    esi,eax
  806ea7:	bf c0 ca 42 00       	mov    edi,0x42cac0
  806eac:	e8 41 0b 00 00       	call   8079f2 <read_sec>

    //sys_read root
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  806eb1:	0f b7 05 b6 19 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc219b6]        # 42886e <superblock+0xe>
  806eb8:	0f b7 c8             	movzx  ecx,ax
  806ebb:	0f b7 05 b4 19 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc219b4]        # 428876 <superblock+0x16>
  806ec2:	0f b7 d0             	movzx  edx,ax
    superblock.numOfFAT;
  806ec5:	0f b6 05 a4 19 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc219a4]        # 428870 <superblock+0x10>
  806ecc:	0f b6 c0             	movzx  eax,al
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  806ecf:	0f af c2             	imul   eax,edx
  806ed2:	01 c8                	add    eax,ecx
  806ed4:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //printf("root sec num:%d\n",root_sec_num);
    //usually a root dir has 32 secs
    int root_sec_c=((u32)superblock.rootEntries* sizeof(dir_entry))/(u32)superblock.bytesPerSec;
  806ed7:	0f b7 05 93 19 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21993]        # 428871 <superblock+0x11>
  806ede:	0f b7 c0             	movzx  eax,ax
  806ee1:	48 c1 e0 05          	shl    rax,0x5
  806ee5:	0f b7 15 7f 19 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc2197f]        # 42886b <superblock+0xb>
  806eec:	0f b7 ca             	movzx  ecx,dx
  806eef:	ba 00 00 00 00       	mov    edx,0x0
  806ef4:	48 f7 f1             	div    rcx
  806ef7:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    read_sec(root_dir,root_sec_num,root_sec_c);
  806efa:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  806efd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806f00:	89 c6                	mov    esi,eax
  806f02:	bf a0 88 42 00       	mov    edi,0x4288a0
  806f07:	e8 e6 0a 00 00       	call   8079f2 <read_sec>

    cur_dir.fistCluNum=0;
  806f0c:	66 c7 05 a5 59 c2 ff 	mov    WORD PTR [rip+0xffffffffffc259a5],0x0        # 42c8ba <cur_dir+0x1a>
  806f13:	00 00 

    //set some vars
    //why? because the .bss won't be packed into bin so any init
    //of global var in .c is meaningless.
    clu_sec_balance=superblock.rsvdSec+32+32-2;//63;
  806f15:	0f b7 05 52 19 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21952]        # 42886e <superblock+0xe>
  806f1c:	0f b7 c0             	movzx  eax,ax
  806f1f:	83 c0 3e             	add    eax,0x3e
  806f22:	89 05 38 31 00 00    	mov    DWORD PTR [rip+0x3138],eax        # 80a060 <clu_sec_balance>
    //printf("clu sec bal:%d\n",clu_sec_balance);
    dir_depth=0;
  806f28:	c7 05 8e 9b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29b8e],0x0        # 430ac0 <dir_depth>
  806f2f:	00 00 00 
    return 0;
  806f32:	b8 00 00 00 00       	mov    eax,0x0

}
  806f37:	c9                   	leave  
  806f38:	c3                   	ret    

0000000000806f39 <verify_name>:

//检查输入的文件名长度是否合法，以及是否出现非法字符（但是不检查大小写和.）
//返回值为布尔值。
int verify_name(char *str)
{
  806f39:	f3 0f 1e fa          	endbr64 
  806f3d:	55                   	push   rbp
  806f3e:	48 89 e5             	mov    rbp,rsp
  806f41:	48 83 ec 70          	sub    rsp,0x70
  806f45:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
    char valid_ch[]="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,/![]|+";
  806f49:	48 b8 61 62 63 64 65 	movabs rax,0x6867666564636261
  806f50:	66 67 68 
  806f53:	48 ba 69 6a 6b 6c 6d 	movabs rdx,0x706f6e6d6c6b6a69
  806f5a:	6e 6f 70 
  806f5d:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  806f61:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  806f65:	48 b8 71 72 73 74 75 	movabs rax,0x7877767574737271
  806f6c:	76 77 78 
  806f6f:	48 ba 79 7a 41 42 43 	movabs rdx,0x4645444342417a79
  806f76:	44 45 46 
  806f79:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  806f7d:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  806f81:	48 b8 47 48 49 4a 4b 	movabs rax,0x4e4d4c4b4a494847
  806f88:	4c 4d 4e 
  806f8b:	48 ba 4f 50 51 52 53 	movabs rdx,0x565554535251504f
  806f92:	54 55 56 
  806f95:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  806f99:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  806f9d:	48 b8 57 58 59 5a 30 	movabs rax,0x333231305a595857
  806fa4:	31 32 33 
  806fa7:	48 ba 34 35 36 37 38 	movabs rdx,0x2f2c393837363534
  806fae:	39 2c 2f 
  806fb1:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  806fb5:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  806fb9:	c7 45 e0 21 5b 5d 7c 	mov    DWORD PTR [rbp-0x20],0x7c5d5b21
  806fc0:	66 c7 45 e4 2b 00    	mov    WORD PTR [rbp-0x1c],0x2b
    if(strlen(str)>11||strlen(str)==0) {
  806fc6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806fca:	48 89 c7             	mov    rdi,rax
  806fcd:	e8 24 28 00 00       	call   8097f6 <strlen>
  806fd2:	83 f8 0b             	cmp    eax,0xb
  806fd5:	7f 10                	jg     806fe7 <verify_name+0xae>
  806fd7:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806fdb:	48 89 c7             	mov    rdi,rax
  806fde:	e8 13 28 00 00       	call   8097f6 <strlen>
  806fe3:	85 c0                	test   eax,eax
  806fe5:	75 0a                	jne    806ff1 <verify_name+0xb8>
        //printf("length not valid\n");
        return 0;
  806fe7:	b8 00 00 00 00       	mov    eax,0x0
  806fec:	e9 b3 01 00 00       	jmp    8071a4 <verify_name+0x26b>
    }
    int c=0,i=0,flag=0,vchf=1;
  806ff1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806ff8:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806fff:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  807006:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [rbp-0x18],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  80700d:	eb 6b                	jmp    80707a <verify_name+0x141>
    {
        int j=0;
  80700f:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        for(;j<sizeof(valid_ch);j++)
  807016:	eb 22                	jmp    80703a <verify_name+0x101>
            if(str[i]==valid_ch[j])break;
  807018:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80701b:	48 63 d0             	movsxd rdx,eax
  80701e:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807022:	48 01 d0             	add    rax,rdx
  807025:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  807028:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80702b:	48 98                	cdqe   
  80702d:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  807032:	38 c2                	cmp    dl,al
  807034:	74 0e                	je     807044 <verify_name+0x10b>
        for(;j<sizeof(valid_ch);j++)
  807036:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80703a:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80703d:	83 f8 45             	cmp    eax,0x45
  807040:	76 d6                	jbe    807018 <verify_name+0xdf>
  807042:	eb 01                	jmp    807045 <verify_name+0x10c>
            if(str[i]==valid_ch[j])break;
  807044:	90                   	nop
        if(j>=sizeof(valid_ch))
  807045:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  807048:	83 f8 45             	cmp    eax,0x45
  80704b:	76 0a                	jbe    807057 <verify_name+0x11e>
        {
            //printf("invalid char\n");
            return 0;//出现非法字符
  80704d:	b8 00 00 00 00       	mov    eax,0x0
  807052:	e9 4d 01 00 00       	jmp    8071a4 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  807057:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80705a:	48 63 d0             	movsxd rdx,eax
  80705d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807061:	48 01 d0             	add    rax,rdx
  807064:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807067:	3c 20                	cmp    al,0x20
  807069:	74 07                	je     807072 <verify_name+0x139>
  80706b:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        c++;
  807072:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  807076:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80707a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80707d:	48 63 d0             	movsxd rdx,eax
  807080:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807084:	48 01 d0             	add    rax,rdx
  807087:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80708a:	3c 2e                	cmp    al,0x2e
  80708c:	74 18                	je     8070a6 <verify_name+0x16d>
  80708e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807091:	48 63 d0             	movsxd rdx,eax
  807094:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807098:	48 01 d0             	add    rax,rdx
  80709b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80709e:	84 c0                	test   al,al
  8070a0:	0f 85 69 ff ff ff    	jne    80700f <verify_name+0xd6>
    }
    if(c>8||flag==0){
  8070a6:	83 7d fc 08          	cmp    DWORD PTR [rbp-0x4],0x8
  8070aa:	7f 06                	jg     8070b2 <verify_name+0x179>
  8070ac:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8070b0:	75 0a                	jne    8070bc <verify_name+0x183>
        //printf("file name blank\n");
        return 0;//不能全是空格
  8070b2:	b8 00 00 00 00       	mov    eax,0x0
  8070b7:	e9 e8 00 00 00       	jmp    8071a4 <verify_name+0x26b>
    }
    if(str[i]=='\0')//没有扩展名
  8070bc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8070bf:	48 63 d0             	movsxd rdx,eax
  8070c2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8070c6:	48 01 d0             	add    rax,rdx
  8070c9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070cc:	84 c0                	test   al,al
  8070ce:	75 0a                	jne    8070da <verify_name+0x1a1>
        return 1;
  8070d0:	b8 01 00 00 00       	mov    eax,0x1
  8070d5:	e9 ca 00 00 00       	jmp    8071a4 <verify_name+0x26b>
    c=0;
  8070da:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    flag=0;
  8070e1:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(i++;str[i]!='\0';i++)
  8070e8:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8070ec:	e9 83 00 00 00       	jmp    807174 <verify_name+0x23b>
    {
        int j=0;
  8070f1:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
        for(;j<sizeof(valid_ch);j++)
  8070f8:	eb 22                	jmp    80711c <verify_name+0x1e3>
            if(str[i]==valid_ch[j])break;
  8070fa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8070fd:	48 63 d0             	movsxd rdx,eax
  807100:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807104:	48 01 d0             	add    rax,rdx
  807107:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80710a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80710d:	48 98                	cdqe   
  80710f:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  807114:	38 c2                	cmp    dl,al
  807116:	74 0e                	je     807126 <verify_name+0x1ed>
        for(;j<sizeof(valid_ch);j++)
  807118:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80711c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80711f:	83 f8 45             	cmp    eax,0x45
  807122:	76 d6                	jbe    8070fa <verify_name+0x1c1>
  807124:	eb 01                	jmp    807127 <verify_name+0x1ee>
            if(str[i]==valid_ch[j])break;
  807126:	90                   	nop
        if(j>=sizeof(valid_ch)){
  807127:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80712a:	83 f8 45             	cmp    eax,0x45
  80712d:	76 07                	jbe    807136 <verify_name+0x1fd>
            //printf("invalid char:%x\n",str[i]);
            return 0;//出现非法字符
  80712f:	b8 00 00 00 00       	mov    eax,0x0
  807134:	eb 6e                	jmp    8071a4 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  807136:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807139:	48 63 d0             	movsxd rdx,eax
  80713c:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807140:	48 01 d0             	add    rax,rdx
  807143:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807146:	3c 20                	cmp    al,0x20
  807148:	74 07                	je     807151 <verify_name+0x218>
  80714a:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        if(str[i]=='.'){
  807151:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807154:	48 63 d0             	movsxd rdx,eax
  807157:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80715b:	48 01 d0             	add    rax,rdx
  80715e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807161:	3c 2e                	cmp    al,0x2e
  807163:	75 07                	jne    80716c <verify_name+0x233>
            //printf("multiple dots.");
            return 0;//不能多次出现.
  807165:	b8 00 00 00 00       	mov    eax,0x0
  80716a:	eb 38                	jmp    8071a4 <verify_name+0x26b>
        }
        c++;
  80716c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(i++;str[i]!='\0';i++)
  807170:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807174:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807177:	48 63 d0             	movsxd rdx,eax
  80717a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80717e:	48 01 d0             	add    rax,rdx
  807181:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807184:	84 c0                	test   al,al
  807186:	0f 85 65 ff ff ff    	jne    8070f1 <verify_name+0x1b8>
    }
    if(c>3||flag==0){
  80718c:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  807190:	7f 06                	jg     807198 <verify_name+0x25f>
  807192:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  807196:	75 07                	jne    80719f <verify_name+0x266>
        //printf("file name blank\n");
        return 0;//不能全是空格
  807198:	b8 00 00 00 00       	mov    eax,0x0
  80719d:	eb 05                	jmp    8071a4 <verify_name+0x26b>
    }
    return 1;
  80719f:	b8 01 00 00 00       	mov    eax,0x1
}
  8071a4:	c9                   	leave  
  8071a5:	c3                   	ret    

00000000008071a6 <format_name>:
//将“aaa.bb”的文件名形式转换为可以直接strcmp(,,11)的形式。
//默认文件名合法，请先检查文件名再使用。
void format_name(char *str)
{
  8071a6:	f3 0f 1e fa          	endbr64 
  8071aa:	55                   	push   rbp
  8071ab:	48 89 e5             	mov    rbp,rsp
  8071ae:	48 83 ec 30          	sub    rsp,0x30
  8071b2:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char v[12]="           ";
  8071b6:	48 b8 20 20 20 20 20 	movabs rax,0x2020202020202020
  8071bd:	20 20 20 
  8071c0:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8071c4:	c7 45 f0 20 20 20 00 	mov    DWORD PTR [rbp-0x10],0x202020
    int ptr=0;
  8071cb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    int namelen=0;
  8071d2:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    for(int i=0;str[i]!='\0';i++)
  8071d9:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8071e0:	e9 9b 00 00 00       	jmp    807280 <format_name+0xda>
    {
        if(str[i]>='a'&&str[i]<='z')
  8071e5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8071e8:	48 63 d0             	movsxd rdx,eax
  8071eb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8071ef:	48 01 d0             	add    rax,rdx
  8071f2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8071f5:	3c 60                	cmp    al,0x60
  8071f7:	7e 3e                	jle    807237 <format_name+0x91>
  8071f9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8071fc:	48 63 d0             	movsxd rdx,eax
  8071ff:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807203:	48 01 d0             	add    rax,rdx
  807206:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807209:	3c 7a                	cmp    al,0x7a
  80720b:	7f 2a                	jg     807237 <format_name+0x91>
        {
            v[ptr++]=str[i]-'a'+'A';
  80720d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807210:	48 63 d0             	movsxd rdx,eax
  807213:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807217:	48 01 d0             	add    rax,rdx
  80721a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80721d:	8d 48 e0             	lea    ecx,[rax-0x20]
  807220:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807223:	8d 50 01             	lea    edx,[rax+0x1]
  807226:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  807229:	89 ca                	mov    edx,ecx
  80722b:	48 98                	cdqe   
  80722d:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  807231:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807235:	eb 45                	jmp    80727c <format_name+0xd6>
        }
        else if(str[i]=='.')
  807237:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80723a:	48 63 d0             	movsxd rdx,eax
  80723d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807241:	48 01 d0             	add    rax,rdx
  807244:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807247:	3c 2e                	cmp    al,0x2e
  807249:	75 0d                	jne    807258 <format_name+0xb2>
        {
            ptr+=(8-namelen);
  80724b:	b8 08 00 00 00       	mov    eax,0x8
  807250:	2b 45 f8             	sub    eax,DWORD PTR [rbp-0x8]
  807253:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
  807256:	eb 24                	jmp    80727c <format_name+0xd6>
        }else
        {
            v[ptr++]=str[i];
  807258:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80725b:	48 63 d0             	movsxd rdx,eax
  80725e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807262:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807266:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807269:	8d 50 01             	lea    edx,[rax+0x1]
  80726c:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80726f:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
  807272:	48 98                	cdqe   
  807274:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  807278:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
    for(int i=0;str[i]!='\0';i++)
  80727c:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  807280:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807283:	48 63 d0             	movsxd rdx,eax
  807286:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80728a:	48 01 d0             	add    rax,rdx
  80728d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807290:	84 c0                	test   al,al
  807292:	0f 85 4d ff ff ff    	jne    8071e5 <format_name+0x3f>
        }
    }
    v[12]='\0';
  807298:	c6 45 f4 00          	mov    BYTE PTR [rbp-0xc],0x0
    strcpy(str,v);
  80729c:	48 8d 55 e8          	lea    rdx,[rbp-0x18]
  8072a0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8072a4:	48 89 d6             	mov    rsi,rdx
  8072a7:	48 89 c7             	mov    rdi,rax
  8072aa:	e8 28 23 00 00       	call   8095d7 <strcpy>
}
  8072af:	90                   	nop
  8072b0:	c9                   	leave  
  8072b1:	c3                   	ret    

00000000008072b2 <req_cluster>:
int req_cluster()
{
  8072b2:	f3 0f 1e fa          	endbr64 
  8072b6:	55                   	push   rbp
  8072b7:	48 89 e5             	mov    rbp,rsp
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  8072ba:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [rbp-0x4],0x3
  8072c1:	eb 2a                	jmp    8072ed <req_cluster+0x3b>
    {
        if(fat[i]==0)
  8072c3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8072c6:	48 98                	cdqe   
  8072c8:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8072cf:	00 
  8072d0:	66 85 c0             	test   ax,ax
  8072d3:	75 14                	jne    8072e9 <req_cluster+0x37>
        {
            fat[i]=0xffff;
  8072d5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8072d8:	48 98                	cdqe   
  8072da:	66 c7 84 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],0xffff
  8072e1:	00 ff ff 
            return i;
  8072e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8072e7:	eb 13                	jmp    8072fc <req_cluster+0x4a>
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  8072e9:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8072ed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8072f0:	3d ff 1f 00 00       	cmp    eax,0x1fff
  8072f5:	76 cc                	jbe    8072c3 <req_cluster+0x11>
        }
    }
    return -1;
  8072f7:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8072fc:	5d                   	pop    rbp
  8072fd:	c3                   	ret    

00000000008072fe <write_sec>:
int write_sec(char *src, int sec_num, int sec_c)
{
  8072fe:	f3 0f 1e fa          	endbr64 
  807302:	55                   	push   rbp
  807303:	48 89 e5             	mov    rbp,rsp
  807306:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
  80730d:	48 89 bd 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rdi
  807314:	89 b5 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],esi
  80731a:	89 95 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],edx
    driver_args arg={
  807320:	48 8d 95 40 ff ff ff 	lea    rdx,[rbp-0xc0]
  807327:	b8 00 00 00 00       	mov    eax,0x0
  80732c:	b9 18 00 00 00       	mov    ecx,0x18
  807331:	48 89 d7             	mov    rdi,rdx
  807334:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  807337:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  80733e:	89 85 48 ff ff ff    	mov    DWORD PTR [rbp-0xb8],eax
  807344:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  80734a:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
  807350:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  807356:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            .src_addr=src,
            .sec_n=sec_num,
            .sec_c=sec_c
    };
    return drv_disk.read(&arg);
  80735c:	48 8b 15 75 2c 00 00 	mov    rdx,QWORD PTR [rip+0x2c75]        # 809fd8 <drv_disk+0x18>
  807363:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  80736a:	48 89 c7             	mov    rdi,rax
  80736d:	ff d2                	call   rdx
}
  80736f:	c9                   	leave  
  807370:	c3                   	ret    

0000000000807371 <set_attr>:
void set_attr(dir_entry *f,char attr)
{
  807371:	f3 0f 1e fa          	endbr64 
  807375:	55                   	push   rbp
  807376:	48 89 e5             	mov    rbp,rsp
  807379:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80737d:	89 f0                	mov    eax,esi
  80737f:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    f->attr|=attr;
  807382:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807386:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80738a:	0a 45 f4             	or     al,BYTE PTR [rbp-0xc]
  80738d:	89 c2                	mov    edx,eax
  80738f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807393:	88 50 0b             	mov    BYTE PTR [rax+0xb],dl
}
  807396:	90                   	nop
  807397:	5d                   	pop    rbp
  807398:	c3                   	ret    

0000000000807399 <update_fat_and_root>:
mkdir
touch
rm
*/
void update_fat_and_root()
{
  807399:	f3 0f 1e fa          	endbr64 
  80739d:	55                   	push   rbp
  80739e:	48 89 e5             	mov    rbp,rsp
  8073a1:	48 83 ec 10          	sub    rsp,0x10
    int root_loc=superblock.rsvdSec+\
  8073a5:	0f b7 05 c2 14 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc214c2]        # 42886e <superblock+0xe>
  8073ac:	0f b7 c8             	movzx  ecx,ax
    superblock.secPerFAT*superblock.numOfFAT;
  8073af:	0f b7 05 c0 14 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc214c0]        # 428876 <superblock+0x16>
  8073b6:	0f b7 d0             	movzx  edx,ax
  8073b9:	0f b6 05 b0 14 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc214b0]        # 428870 <superblock+0x10>
  8073c0:	0f b6 c0             	movzx  eax,al
  8073c3:	0f af c2             	imul   eax,edx
    int root_loc=superblock.rsvdSec+\
  8073c6:	01 c8                	add    eax,ecx
  8073c8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("root_loc:0x%x\n",root_loc);
    write_sec(root_dir,root_loc,sizeof(root_dir));
  8073cb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8073ce:	ba 00 40 00 00       	mov    edx,0x4000
  8073d3:	89 c6                	mov    esi,eax
  8073d5:	bf a0 88 42 00       	mov    edi,0x4288a0
  8073da:	e8 1f ff ff ff       	call   8072fe <write_sec>
    //printf("updated root\n");
    write_sec(fat,superblock.rsvdSec,sizeof(fat));
  8073df:	0f b7 05 88 14 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21488]        # 42886e <superblock+0xe>
  8073e6:	0f b7 c0             	movzx  eax,ax
  8073e9:	ba 00 40 00 00       	mov    edx,0x4000
  8073ee:	89 c6                	mov    esi,eax
  8073f0:	bf c0 ca 42 00       	mov    edi,0x42cac0
  8073f5:	e8 04 ff ff ff       	call   8072fe <write_sec>
    //printf("updated fat\n");

}
  8073fa:	90                   	nop
  8073fb:	c9                   	leave  
  8073fc:	c3                   	ret    

00000000008073fd <add_dot_and_ddot_dir>:
void add_dot_and_ddot_dir(dir_entry dir)
{
  8073fd:	f3 0f 1e fa          	endbr64 
  807401:	55                   	push   rbp
  807402:	48 89 e5             	mov    rbp,rsp
  807405:	48 83 ec 10          	sub    rsp,0x10
    //it must be a regular dir to add. and ..
    //and this must be done when the dir is created
    //regular dir
    int cluster = dir.fistCluNum;
  807409:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  80740d:	0f b7 c0             	movzx  eax,ax
  807410:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
    superblock.secPerClu);
  807413:	0f b6 05 53 14 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21453]        # 42886d <superblock+0xd>
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  80741a:	0f b6 c0             	movzx  eax,al
  80741d:	8b 0d 3d 2c 00 00    	mov    ecx,DWORD PTR [rip+0x2c3d]        # 80a060 <clu_sec_balance>
  807423:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  807426:	01 d1                	add    ecx,edx
  807428:	89 c2                	mov    edx,eax
  80742a:	89 ce                	mov    esi,ecx
  80742c:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807431:	e8 bc 05 00 00       	call   8079f2 <read_sec>
    //.
    strcpy(a_clu_of_dir[0].name,".       ");
  807436:	be 0a 1e 81 00       	mov    esi,0x811e0a
  80743b:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807440:	e8 92 21 00 00       	call   8095d7 <strcpy>
    strcpy(a_clu_of_dir[0].extension,"   ");
  807445:	be 13 1e 81 00       	mov    esi,0x811e13
  80744a:	bf c8 c8 42 00       	mov    edi,0x42c8c8
  80744f:	e8 83 21 00 00       	call   8095d7 <strcpy>
    a_clu_of_dir[0].fistCluNum=dir.fistCluNum;
  807454:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  807458:	66 89 05 7b 54 c2 ff 	mov    WORD PTR [rip+0xffffffffffc2547b],ax        # 42c8da <a_clu_of_dir+0x1a>
    a_clu_of_dir[0].len=0;
  80745f:	c7 05 73 54 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc25473],0x0        # 42c8dc <a_clu_of_dir+0x1c>
  807466:	00 00 00 
    set_attr(&a_clu_of_dir[0],ATTR_DIR);
  807469:	be 10 00 00 00       	mov    esi,0x10
  80746e:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807473:	e8 f9 fe ff ff       	call   807371 <set_attr>
    //..
    strcpy(a_clu_of_dir[1].name,"..      ");
  807478:	be 17 1e 81 00       	mov    esi,0x811e17
  80747d:	bf e0 c8 42 00       	mov    edi,0x42c8e0
  807482:	e8 50 21 00 00       	call   8095d7 <strcpy>
    strcpy(a_clu_of_dir[1].extension,"   ");
  807487:	be 13 1e 81 00       	mov    esi,0x811e13
  80748c:	bf e8 c8 42 00       	mov    edi,0x42c8e8
  807491:	e8 41 21 00 00       	call   8095d7 <strcpy>
    a_clu_of_dir[1].fistCluNum=cur_dir.fistCluNum;
  807496:	0f b7 05 1d 54 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2541d]        # 42c8ba <cur_dir+0x1a>
  80749d:	66 89 05 56 54 c2 ff 	mov    WORD PTR [rip+0xffffffffffc25456],ax        # 42c8fa <a_clu_of_dir+0x3a>
    a_clu_of_dir[1].len=0;
  8074a4:	c7 05 4e 54 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2544e],0x0        # 42c8fc <a_clu_of_dir+0x3c>
  8074ab:	00 00 00 
    set_attr(&a_clu_of_dir[1],ATTR_DIR);
  8074ae:	be 10 00 00 00       	mov    esi,0x10
  8074b3:	bf e0 c8 42 00       	mov    edi,0x42c8e0
  8074b8:	e8 b4 fe ff ff       	call   807371 <set_attr>
    //update the dir
    int dir_loc=cluster+clu_sec_balance;
  8074bd:	8b 15 9d 2b 00 00    	mov    edx,DWORD PTR [rip+0x2b9d]        # 80a060 <clu_sec_balance>
  8074c3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8074c6:	01 d0                	add    eax,edx
  8074c8:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  8074cb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8074ce:	ba 00 02 00 00       	mov    edx,0x200
  8074d3:	89 c6                	mov    esi,eax
  8074d5:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  8074da:	e8 1f fe ff ff       	call   8072fe <write_sec>
    //no need to update fat and root
}
  8074df:	90                   	nop
  8074e0:	c9                   	leave  
  8074e1:	c3                   	ret    

00000000008074e2 <translate_attr>:
void translate_attr(char attr,char *attr_s)
{
  8074e2:	f3 0f 1e fa          	endbr64 
  8074e6:	55                   	push   rbp
  8074e7:	48 89 e5             	mov    rbp,rsp
  8074ea:	89 f8                	mov    eax,edi
  8074ec:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8074f0:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    //rwhds (s: system h:hidden)
    int v=attr&1;
  8074f3:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  8074f7:	83 e0 01             	and    eax,0x1
  8074fa:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//sys_read-only
  8074fd:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807501:	74 0b                	je     80750e <translate_attr+0x2c>
        attr_s[1]='-';
  807503:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807507:	48 83 c0 01          	add    rax,0x1
  80750b:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
    v=attr&2;
  80750e:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807512:	83 e0 02             	and    eax,0x2
  807515:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//hidden
  807518:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80751c:	74 0b                	je     807529 <translate_attr+0x47>
        attr_s[2]='h';
  80751e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807522:	48 83 c0 02          	add    rax,0x2
  807526:	c6 00 68             	mov    BYTE PTR [rax],0x68
    v=attr&4;
  807529:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  80752d:	83 e0 04             	and    eax,0x4
  807530:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//system
  807533:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807537:	74 0b                	je     807544 <translate_attr+0x62>
        attr_s[4]='s';
  807539:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80753d:	48 83 c0 04          	add    rax,0x4
  807541:	c6 00 73             	mov    BYTE PTR [rax],0x73
    v=attr&8;
  807544:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807548:	83 e0 08             	and    eax,0x8
  80754b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//volume label
  80754e:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807552:	74 0b                	je     80755f <translate_attr+0x7d>
        attr_s[3]='v';
  807554:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807558:	48 83 c0 03          	add    rax,0x3
  80755c:	c6 00 76             	mov    BYTE PTR [rax],0x76
    v=attr&16;
  80755f:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807563:	83 e0 10             	and    eax,0x10
  807566:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//dir
  807569:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80756d:	74 0b                	je     80757a <translate_attr+0x98>
        attr_s[3]='d';
  80756f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807573:	48 83 c0 03          	add    rax,0x3
  807577:	c6 00 64             	mov    BYTE PTR [rax],0x64
    //archive: do nothing
    attr_s[5]='\0';
  80757a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80757e:	48 83 c0 05          	add    rax,0x5
  807582:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  807585:	90                   	nop
  807586:	5d                   	pop    rbp
  807587:	c3                   	ret    

0000000000807588 <extend_cluster>:
int extend_cluster(short cluster)
{
  807588:	f3 0f 1e fa          	endbr64 
  80758c:	55                   	push   rbp
  80758d:	48 89 e5             	mov    rbp,rsp
  807590:	48 83 ec 18          	sub    rsp,0x18
  807594:	89 f8                	mov    eax,edi
  807596:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    int new_clu=req_cluster();
  80759a:	b8 00 00 00 00       	mov    eax,0x0
  80759f:	e8 0e fd ff ff       	call   8072b2 <req_cluster>
  8075a4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(new_clu==-1)
  8075a7:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8075ab:	75 07                	jne    8075b4 <extend_cluster+0x2c>
        return -1;
  8075ad:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8075b2:	eb 16                	jmp    8075ca <extend_cluster+0x42>
    fat[cluster]=new_clu;
  8075b4:	0f bf 45 ec          	movsx  eax,WORD PTR [rbp-0x14]
  8075b8:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8075bb:	48 98                	cdqe   
  8075bd:	66 89 94 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],dx
  8075c4:	00 
    return 0;
  8075c5:	b8 00 00 00 00       	mov    eax,0x0
}
  8075ca:	c9                   	leave  
  8075cb:	c3                   	ret    

00000000008075cc <touch>:
得出的结果换算成16进制填入即可。也就是：38H字节0~4位是日期数；38H字节5~7位和39H字节0位是月份；
39H字节的1~7位为年号，原定义中0~119分别代表1980~2099，目前高版本的Windows允许取0~127，
即年号最大可以到2107年。
*/
int touch(driver_args *arg)
{
  8075cc:	f3 0f 1e fa          	endbr64 
  8075d0:	55                   	push   rbp
  8075d1:	48 89 e5             	mov    rbp,rsp
  8075d4:	48 83 ec 60          	sub    rsp,0x60
  8075d8:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    char *name=arg->path;
  8075dc:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8075e0:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8075e4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  8075e8:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8075ec:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8075ef:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    //default set to 512
    int max_files=16;
  8075f3:	c7 45 ec 10 00 00 00 	mov    DWORD PTR [rbp-0x14],0x10
    dir_entry *dir_table=a_clu_of_dir;
  8075fa:	48 c7 45 e0 c0 c8 42 	mov    QWORD PTR [rbp-0x20],0x42c8c0
  807601:	00 
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  807602:	0f b6 05 64 12 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21264]        # 42886d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  807609:	0f b6 c0             	movzx  eax,al
  80760c:	0f b7 55 ca          	movzx  edx,WORD PTR [rbp-0x36]
  807610:	0f b7 ca             	movzx  ecx,dx
  807613:	8b 15 47 2a 00 00    	mov    edx,DWORD PTR [rip+0x2a47]        # 80a060 <clu_sec_balance>
  807619:	01 d1                	add    ecx,edx
  80761b:	89 c2                	mov    edx,eax
  80761d:	89 ce                	mov    esi,ecx
  80761f:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807624:	e8 c9 03 00 00       	call   8079f2 <read_sec>
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  807629:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  80762d:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do{
        for(int i=0;i<max_files;i++)
  807631:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807638:	e9 2e 01 00 00       	jmp    80776b <touch+0x19f>
        {
            //printf("%s\n",dir_table[i].name);
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  80763d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807640:	48 98                	cdqe   
  807642:	48 c1 e0 05          	shl    rax,0x5
  807646:	48 89 c2             	mov    rdx,rax
  807649:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80764d:	48 01 d0             	add    rax,rdx
  807650:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807653:	3c e5                	cmp    al,0xe5
  807655:	74 1e                	je     807675 <touch+0xa9>
            dir_table[i].name[0]==0)
  807657:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80765a:	48 98                	cdqe   
  80765c:	48 c1 e0 05          	shl    rax,0x5
  807660:	48 89 c2             	mov    rdx,rax
  807663:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807667:	48 01 d0             	add    rax,rdx
  80766a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  80766d:	84 c0                	test   al,al
  80766f:	0f 85 f2 00 00 00    	jne    807767 <touch+0x19b>
            {
                //available
                //put name
                format_name(name);
  807675:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807679:	48 89 c7             	mov    rdi,rax
  80767c:	e8 25 fb ff ff       	call   8071a6 <format_name>
                memcpy(dir_table[i].name,name,11);
  807681:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807684:	48 98                	cdqe   
  807686:	48 c1 e0 05          	shl    rax,0x5
  80768a:	48 89 c2             	mov    rdx,rax
  80768d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807691:	48 01 d0             	add    rax,rdx
  807694:	48 89 c1             	mov    rcx,rax
  807697:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80769b:	ba 0b 00 00 00       	mov    edx,0xb
  8076a0:	48 89 c6             	mov    rsi,rax
  8076a3:	48 89 cf             	mov    rdi,rcx
  8076a6:	e8 2e 1e 00 00       	call   8094d9 <memcpy>
                int clu=req_cluster();
  8076ab:	b8 00 00 00 00       	mov    eax,0x0
  8076b0:	e8 fd fb ff ff       	call   8072b2 <req_cluster>
  8076b5:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
                if(clu==-1)
  8076b8:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  8076bc:	75 0a                	jne    8076c8 <touch+0xfc>
                {
                    //puts("err: full disk");
                    return -1;
  8076be:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8076c3:	e9 fc 00 00 00       	jmp    8077c4 <touch+0x1f8>
                }
                dir_table[i].fistCluNum=clu;
  8076c8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8076cb:	48 98                	cdqe   
  8076cd:	48 c1 e0 05          	shl    rax,0x5
  8076d1:	48 89 c2             	mov    rdx,rax
  8076d4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8076d8:	48 01 d0             	add    rax,rdx
  8076db:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8076de:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
                set_attr(&dir_table[i],ATTR_ARCHIVE);
  8076e2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8076e5:	48 98                	cdqe   
  8076e7:	48 c1 e0 05          	shl    rax,0x5
  8076eb:	48 89 c2             	mov    rdx,rax
  8076ee:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8076f2:	48 01 d0             	add    rax,rdx
  8076f5:	be 20 00 00 00       	mov    esi,0x20
  8076fa:	48 89 c7             	mov    rdi,rax
  8076fd:	e8 6f fc ff ff       	call   807371 <set_attr>
                dir_table[i].len=superblock.bytesPerSec*superblock.secPerClu;
  807702:	0f b7 05 62 11 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21162]        # 42886b <superblock+0xb>
  807709:	0f b7 d0             	movzx  edx,ax
  80770c:	0f b6 05 5a 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2115a]        # 42886d <superblock+0xd>
  807713:	0f b6 c0             	movzx  eax,al
  807716:	0f af d0             	imul   edx,eax
  807719:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80771c:	48 98                	cdqe   
  80771e:	48 c1 e0 05          	shl    rax,0x5
  807722:	48 89 c1             	mov    rcx,rax
  807725:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807729:	48 01 c8             	add    rax,rcx
  80772c:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
                //date and time
                //dir_table[i].lastModfDate=get_date_stab();
                //dir_table[i].lastModfTime=get_time_stab();
                //update
                write_sec(dir_table,cluster+clu_sec_balance,\
                superblock.bytesPerSec*superblock.secPerClu);
  80772f:	0f b7 05 35 11 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21135]        # 42886b <superblock+0xb>
  807736:	0f b7 d0             	movzx  edx,ax
  807739:	0f b6 05 2d 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2112d]        # 42886d <superblock+0xd>
  807740:	0f b6 c0             	movzx  eax,al
                write_sec(dir_table,cluster+clu_sec_balance,\
  807743:	0f af d0             	imul   edx,eax
  807746:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  80774a:	8b 05 10 29 00 00    	mov    eax,DWORD PTR [rip+0x2910]        # 80a060 <clu_sec_balance>
  807750:	01 c1                	add    ecx,eax
  807752:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807756:	89 ce                	mov    esi,ecx
  807758:	48 89 c7             	mov    rdi,rax
  80775b:	e8 9e fb ff ff       	call   8072fe <write_sec>
                return -1;
  807760:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807765:	eb 5d                	jmp    8077c4 <touch+0x1f8>
        for(int i=0;i<max_files;i++)
  807767:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80776b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80776e:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
  807771:	0f 8c c6 fe ff ff    	jl     80763d <touch+0x71>
        if(fat[cluster]>=FAT_EOF&&extend_cluster(cluster)==-1)
        {
            //extend fail
            //puts("err:full disk");
            return -1;
        }else if(cluster<FAT_EOF)
  807777:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  80777c:	77 36                	ja     8077b4 <touch+0x1e8>
        {
            cluster=fat[cluster];
  80777e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807782:	48 98                	cdqe   
  807784:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  80778b:	00 
  80778c:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807790:	0f b6 05 d6 10 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc210d6]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807797:	0f b6 d0             	movzx  edx,al
  80779a:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  80779e:	8b 05 bc 28 00 00    	mov    eax,DWORD PTR [rip+0x28bc]        # 80a060 <clu_sec_balance>
  8077a4:	01 c1                	add    ecx,eax
  8077a6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8077aa:	89 ce                	mov    esi,ecx
  8077ac:	48 89 c7             	mov    rdi,rax
  8077af:	e8 3e 02 00 00       	call   8079f2 <read_sec>
        }
    }while(cluster<FAT_EOF);
  8077b4:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  8077b9:	0f 86 72 fe ff ff    	jbe    807631 <touch+0x65>
    return 0;
  8077bf:	b8 00 00 00 00       	mov    eax,0x0
}
  8077c4:	c9                   	leave  
  8077c5:	c3                   	ret    

00000000008077c6 <mkdir>:
//attention: the name must be char[12]
int mkdir(driver_args *arg)
{
  8077c6:	f3 0f 1e fa          	endbr64 
  8077ca:	55                   	push   rbp
  8077cb:	48 89 e5             	mov    rbp,rsp
  8077ce:	48 83 ec 50          	sub    rsp,0x50
  8077d2:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    char *name=arg->path;
  8077d6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8077da:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8077de:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  8077e2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8077e6:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8077e9:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    format_name(name);
  8077ed:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8077f1:	48 89 c7             	mov    rdi,rax
  8077f4:	e8 ad f9 ff ff       	call   8071a6 <format_name>
    //regular dir
    unsigned short cluster = dir.fistCluNum;
  8077f9:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  8077fd:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do
    {
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807801:	0f b6 05 65 10 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21065]        # 42886d <superblock+0xd>
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  807808:	0f b6 c0             	movzx  eax,al
  80780b:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  80780f:	8b 15 4b 28 00 00    	mov    edx,DWORD PTR [rip+0x284b]        # 80a060 <clu_sec_balance>
  807815:	01 d1                	add    ecx,edx
  807817:	89 c2                	mov    edx,eax
  807819:	89 ce                	mov    esi,ecx
  80781b:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807820:	e8 cd 01 00 00       	call   8079f2 <read_sec>
        for (int i = 0; i < 16; i++)
  807825:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80782c:	e9 8c 01 00 00       	jmp    8079bd <mkdir+0x1f7>
        {
            if(a_clu_of_dir[i].fistCluNum==0||\
  807831:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807834:	48 98                	cdqe   
  807836:	48 c1 e0 05          	shl    rax,0x5
  80783a:	48 05 da c8 42 00    	add    rax,0x42c8da
  807840:	0f b7 00             	movzx  eax,WORD PTR [rax]
  807843:	66 85 c0             	test   ax,ax
  807846:	74 30                	je     807878 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0xe5||\
  807848:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80784b:	48 98                	cdqe   
  80784d:	48 c1 e0 05          	shl    rax,0x5
  807851:	48 05 a0 88 42 00    	add    rax,0x4288a0
  807857:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if(a_clu_of_dir[i].fistCluNum==0||\
  80785a:	3c e5                	cmp    al,0xe5
  80785c:	74 1a                	je     807878 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0)
  80785e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807861:	48 98                	cdqe   
  807863:	48 c1 e0 05          	shl    rax,0x5
  807867:	48 05 a0 88 42 00    	add    rax,0x4288a0
  80786d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            (unsigned char)root_dir[i].name[0]==0xe5||\
  807870:	84 c0                	test   al,al
  807872:	0f 85 41 01 00 00    	jne    8079b9 <mkdir+0x1f3>
            {
                memset(&a_clu_of_dir[i],0,sizeof(dir_entry));
  807878:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80787b:	48 98                	cdqe   
  80787d:	48 c1 e0 05          	shl    rax,0x5
  807881:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  807887:	ba 20 00 00 00       	mov    edx,0x20
  80788c:	be 00 00 00 00       	mov    esi,0x0
  807891:	48 89 c7             	mov    rdi,rax
  807894:	e8 ef 1c 00 00       	call   809588 <memset>
                memset(a_clu_of_dir[i].name,' ',11);
  807899:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80789c:	48 98                	cdqe   
  80789e:	48 c1 e0 05          	shl    rax,0x5
  8078a2:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  8078a8:	ba 0b 00 00 00       	mov    edx,0xb
  8078ad:	be 20 00 00 00       	mov    esi,0x20
  8078b2:	48 89 c7             	mov    rdi,rax
  8078b5:	e8 ce 1c 00 00       	call   809588 <memset>
                strcpy(a_clu_of_dir[i].name,name);
  8078ba:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8078bd:	48 98                	cdqe   
  8078bf:	48 c1 e0 05          	shl    rax,0x5
  8078c3:	48 8d 90 c0 c8 42 00 	lea    rdx,[rax+0x42c8c0]
  8078ca:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8078ce:	48 89 c6             	mov    rsi,rax
  8078d1:	48 89 d7             	mov    rdi,rdx
  8078d4:	e8 fe 1c 00 00       	call   8095d7 <strcpy>
                a_clu_of_dir[i].name[strlen(name)]=' ';
  8078d9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8078dd:	48 89 c7             	mov    rdi,rax
  8078e0:	e8 11 1f 00 00       	call   8097f6 <strlen>
  8078e5:	48 63 d0             	movsxd rdx,eax
  8078e8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8078eb:	48 98                	cdqe   
  8078ed:	48 c1 e0 05          	shl    rax,0x5
  8078f1:	48 01 d0             	add    rax,rdx
  8078f4:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  8078fa:	c6 00 20             	mov    BYTE PTR [rax],0x20
                int clu=req_cluster();
  8078fd:	b8 00 00 00 00       	mov    eax,0x0
  807902:	e8 ab f9 ff ff       	call   8072b2 <req_cluster>
  807907:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
                if(clu==-1)//check
  80790a:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  80790e:	75 0a                	jne    80791a <mkdir+0x154>
                {
                    //puts("err:full dir");
                    return -1;
  807910:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807915:	e9 d6 00 00 00       	jmp    8079f0 <mkdir+0x22a>
                }
                a_clu_of_dir[i].fistCluNum=clu;
  80791a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80791d:	89 c2                	mov    edx,eax
  80791f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807922:	48 98                	cdqe   
  807924:	48 c1 e0 05          	shl    rax,0x5
  807928:	48 05 da c8 42 00    	add    rax,0x42c8da
  80792e:	66 89 10             	mov    WORD PTR [rax],dx
                //set attr
                set_attr(&a_clu_of_dir[i],ATTR_DIR);
  807931:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807934:	48 98                	cdqe   
  807936:	48 c1 e0 05          	shl    rax,0x5
  80793a:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  807940:	be 10 00 00 00       	mov    esi,0x10
  807945:	48 89 c7             	mov    rdi,rax
  807948:	e8 24 fa ff ff       	call   807371 <set_attr>
                //set length
                a_clu_of_dir[i].len=0;
  80794d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807950:	48 98                	cdqe   
  807952:	48 c1 e0 05          	shl    rax,0x5
  807956:	48 05 dc c8 42 00    	add    rax,0x42c8dc
  80795c:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
                //date and time
                /*a_clu_of_dir[i].lastModfDate=get_date_stab();
                a_clu_of_dir[i].lastModfTime=get_time_stab();*/
                //set date:temporarily none
                //add . and ..
                add_dot_and_ddot_dir(a_clu_of_dir[i]);
  807962:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807965:	48 98                	cdqe   
  807967:	48 c1 e0 05          	shl    rax,0x5
  80796b:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  807971:	ff 70 18             	push   QWORD PTR [rax+0x18]
  807974:	ff 70 10             	push   QWORD PTR [rax+0x10]
  807977:	ff 70 08             	push   QWORD PTR [rax+0x8]
  80797a:	ff 30                	push   QWORD PTR [rax]
  80797c:	e8 7c fa ff ff       	call   8073fd <add_dot_and_ddot_dir>
  807981:	48 83 c4 20          	add    rsp,0x20
                //update the dir
                int dir_loc=cluster+clu_sec_balance;
  807985:	0f b7 55 fe          	movzx  edx,WORD PTR [rbp-0x2]
  807989:	8b 05 d1 26 00 00    	mov    eax,DWORD PTR [rip+0x26d1]        # 80a060 <clu_sec_balance>
  80798f:	01 d0                	add    eax,edx
  807991:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
                write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  807994:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807997:	ba 00 02 00 00       	mov    edx,0x200
  80799c:	89 c6                	mov    esi,eax
  80799e:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  8079a3:	e8 56 f9 ff ff       	call   8072fe <write_sec>
                update_fat_and_root();
  8079a8:	b8 00 00 00 00       	mov    eax,0x0
  8079ad:	e8 e7 f9 ff ff       	call   807399 <update_fat_and_root>
                return 0;
  8079b2:	b8 00 00 00 00       	mov    eax,0x0
  8079b7:	eb 37                	jmp    8079f0 <mkdir+0x22a>
        for (int i = 0; i < 16; i++)
  8079b9:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8079bd:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  8079c1:	0f 8e 6a fe ff ff    	jle    807831 <mkdir+0x6b>
            }
        }

        if(cluster<FAT_EOF)
  8079c7:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  8079cc:	77 12                	ja     8079e0 <mkdir+0x21a>
            cluster=fat[cluster];
  8079ce:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8079d2:	48 98                	cdqe   
  8079d4:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8079db:	00 
  8079dc:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    } while (cluster<FAT_EOF);
  8079e0:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  8079e5:	0f 86 16 fe ff ff    	jbe    807801 <mkdir+0x3b>
    return -1;
  8079eb:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8079f0:	c9                   	leave  
  8079f1:	c3                   	ret    

00000000008079f2 <read_sec>:
    }
    
    
}*/
int read_sec(char *dist, int sec_num, int sec_count)
{
  8079f2:	f3 0f 1e fa          	endbr64 
  8079f6:	55                   	push   rbp
  8079f7:	48 89 e5             	mov    rbp,rsp
  8079fa:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  807a01:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
  807a08:	89 b5 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],esi
  807a0e:	89 95 20 ff ff ff    	mov    DWORD PTR [rbp-0xe0],edx
    driver_args arg={
  807a14:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  807a1b:	b8 00 00 00 00       	mov    eax,0x0
  807a20:	b9 18 00 00 00       	mov    ecx,0x18
  807a25:	48 89 d7             	mov    rdi,rdx
  807a28:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  807a2b:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
  807a31:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
  807a37:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  807a3e:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
  807a44:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  807a4b:	00 00 00 
            .dist_addr=dist,
            .lba=sec_num,
            .sec_c=1
    };
    for(int i=0;i<sec_count;i++)
  807a4e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807a55:	eb 3e                	jmp    807a95 <read_sec+0xa3>
    {
        drv_disk.read(&arg);
  807a57:	48 8b 15 7a 25 00 00 	mov    rdx,QWORD PTR [rip+0x257a]        # 809fd8 <drv_disk+0x18>
  807a5e:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  807a65:	48 89 c7             	mov    rdi,rax
  807a68:	ff d2                	call   rdx
        arg.dist_addr+=superblock.bytesPerSec;
  807a6a:	8b 95 34 ff ff ff    	mov    edx,DWORD PTR [rbp-0xcc]
  807a70:	0f b7 05 f4 0d c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20df4]        # 42886b <superblock+0xb>
  807a77:	0f b7 c0             	movzx  eax,ax
  807a7a:	01 d0                	add    eax,edx
  807a7c:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.lba++;
  807a82:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  807a88:	83 c0 01             	add    eax,0x1
  807a8b:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
    for(int i=0;i<sec_count;i++)
  807a91:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807a95:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807a98:	3b 85 20 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xe0]
  807a9e:	7c b7                	jl     807a57 <read_sec+0x65>
    }
    return 0;
  807aa0:	b8 00 00 00 00       	mov    eax,0x0
}
  807aa5:	c9                   	leave  
  807aa6:	c3                   	ret    

0000000000807aa7 <rm>:

int rm(driver_args* args)
{
  807aa7:	f3 0f 1e fa          	endbr64 
  807aab:	55                   	push   rbp
  807aac:	48 89 e5             	mov    rbp,rsp
  807aaf:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  807ab6:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
    char *name=args->path;
  807abd:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  807ac4:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807ac8:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    driver_args tmparg={
  807acc:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  807ad3:	b8 00 00 00 00       	mov    eax,0x0
  807ad8:	b9 18 00 00 00       	mov    ecx,0x18
  807add:	48 89 d7             	mov    rdi,rdx
  807ae0:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .path=args->dir_path,
  807ae3:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  807aea:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
    driver_args tmparg={
  807af1:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    if(get_entry(&tmparg)==-1)return -1;
  807af8:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  807aff:	48 89 c7             	mov    rdi,rax
  807b02:	e8 07 0a 00 00       	call   80850e <get_entry>
  807b07:	83 f8 ff             	cmp    eax,0xffffffff
  807b0a:	75 0a                	jne    807b16 <rm+0x6f>
  807b0c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807b11:	e9 a8 01 00 00       	jmp    807cbe <rm+0x217>
    dir.fistCluNum=tmparg.entry.id;
  807b16:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  807b1c:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    dir_entry *dir_table=a_clu_of_dir;
  807b20:	48 c7 45 e0 c0 c8 42 	mov    QWORD PTR [rbp-0x20],0x42c8c0
  807b27:	00 
    //regular dir
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
    superblock.secPerClu);
  807b28:	0f b6 05 3e 0d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20d3e]        # 42886d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  807b2f:	0f b6 c0             	movzx  eax,al
  807b32:	0f b7 55 da          	movzx  edx,WORD PTR [rbp-0x26]
  807b36:	0f b7 ca             	movzx  ecx,dx
  807b39:	8b 15 21 25 00 00    	mov    edx,DWORD PTR [rip+0x2521]        # 80a060 <clu_sec_balance>
  807b3f:	01 d1                	add    ecx,edx
  807b41:	89 c2                	mov    edx,eax
  807b43:	89 ce                	mov    esi,ecx
  807b45:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807b4a:	e8 a3 fe ff ff       	call   8079f2 <read_sec>
    dir_table=a_clu_of_dir;
  807b4f:	48 c7 45 e0 c0 c8 42 	mov    QWORD PTR [rbp-0x20],0x42c8c0
  807b56:	00 
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  807b57:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  807b5b:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    int i=0;
  807b5f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    while(cluster<FAT_EOF){
  807b66:	e9 89 00 00 00       	jmp    807bf4 <rm+0x14d>
        read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807b6b:	0f b6 05 fb 0c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20cfb]        # 42886d <superblock+0xd>
        read_sec(dir_table,cluster+clu_sec_balance,\
  807b72:	0f b6 d0             	movzx  edx,al
  807b75:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807b79:	8b 05 e1 24 00 00    	mov    eax,DWORD PTR [rip+0x24e1]        # 80a060 <clu_sec_balance>
  807b7f:	01 c1                	add    ecx,eax
  807b81:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807b85:	89 ce                	mov    esi,ecx
  807b87:	48 89 c7             	mov    rdi,rax
  807b8a:	e8 63 fe ff ff       	call   8079f2 <read_sec>
        for(;i<16;i++)
  807b8f:	eb 44                	jmp    807bd5 <rm+0x12e>
        {
            if(dir_table[i].fistCluNum==args->entry.id)
  807b91:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807b94:	48 98                	cdqe   
  807b96:	48 c1 e0 05          	shl    rax,0x5
  807b9a:	48 89 c2             	mov    rdx,rax
  807b9d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807ba1:	48 01 d0             	add    rax,rdx
  807ba4:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  807ba8:	0f b7 d0             	movzx  edx,ax
  807bab:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  807bb2:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  807bb5:	39 c2                	cmp    edx,eax
  807bb7:	75 18                	jne    807bd1 <rm+0x12a>
            {
                if(dir_table[i].attr&ATTR_DIR){
                    //要处理里面的文件
                }
                dir_table[i].name[0]=0xe5;
  807bb9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807bbc:	48 98                	cdqe   
  807bbe:	48 c1 e0 05          	shl    rax,0x5
  807bc2:	48 89 c2             	mov    rdx,rax
  807bc5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807bc9:	48 01 d0             	add    rax,rdx
  807bcc:	c6 00 e5             	mov    BYTE PTR [rax],0xe5
                goto del_entry_finish;
  807bcf:	eb 2f                	jmp    807c00 <rm+0x159>
        for(;i<16;i++)
  807bd1:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807bd5:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  807bd9:	7e b6                	jle    807b91 <rm+0xea>
            }
        }
        if(cluster<FAT_EOF)
  807bdb:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807be0:	77 12                	ja     807bf4 <rm+0x14d>
        {
            cluster=fat[cluster];
  807be2:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807be6:	48 98                	cdqe   
  807be8:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807bef:	00 
  807bf0:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    while(cluster<FAT_EOF){
  807bf4:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807bf9:	0f 86 6c ff ff ff    	jbe    807b6b <rm+0xc4>
            //update
            //if you can reach here it means it's a regular dir
        }

    }
del_entry_finish:
  807bff:	90                   	nop
    ;
    //del fat
    unsigned short del_clu=dir_table[i].fistCluNum;
  807c00:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c03:	48 98                	cdqe   
  807c05:	48 c1 e0 05          	shl    rax,0x5
  807c09:	48 89 c2             	mov    rdx,rax
  807c0c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c10:	48 01 d0             	add    rax,rdx
  807c13:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  807c17:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
    unsigned short pion=del_clu<FAT_EOF?fat[del_clu]:0xffff;
  807c1b:	66 83 7d f6 f6       	cmp    WORD PTR [rbp-0xa],0xfff6
  807c20:	77 10                	ja     807c32 <rm+0x18b>
  807c22:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807c26:	48 98                	cdqe   
  807c28:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807c2f:	00 
  807c30:	eb 05                	jmp    807c37 <rm+0x190>
  807c32:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807c37:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  807c3b:	eb 2a                	jmp    807c67 <rm+0x1c0>
    {
        fat[del_clu]=0;
  807c3d:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807c41:	48 98                	cdqe   
  807c43:	66 c7 84 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],0x0
  807c4a:	00 00 00 
        del_clu=pion;
  807c4d:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  807c51:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
        pion=fat[pion];
  807c55:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  807c59:	48 98                	cdqe   
  807c5b:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807c62:	00 
  807c63:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  807c67:	66 83 7d f4 f6       	cmp    WORD PTR [rbp-0xc],0xfff6
  807c6c:	76 cf                	jbe    807c3d <rm+0x196>
    }
    fat[del_clu]=0;
  807c6e:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807c72:	48 98                	cdqe   
  807c74:	66 c7 84 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],0x0
  807c7b:	00 00 00 
    //del dir entry
    write_sec(dir_table,cluster+clu_sec_balance,\
    superblock.secPerClu*superblock.bytesPerSec);
  807c7e:	0f b6 05 e8 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20be8]        # 42886d <superblock+0xd>
  807c85:	0f b6 d0             	movzx  edx,al
  807c88:	0f b7 05 dc 0b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20bdc]        # 42886b <superblock+0xb>
  807c8f:	0f b7 c0             	movzx  eax,ax
    write_sec(dir_table,cluster+clu_sec_balance,\
  807c92:	0f af d0             	imul   edx,eax
  807c95:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807c99:	8b 05 c1 23 00 00    	mov    eax,DWORD PTR [rip+0x23c1]        # 80a060 <clu_sec_balance>
  807c9f:	01 c1                	add    ecx,eax
  807ca1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807ca5:	89 ce                	mov    esi,ecx
  807ca7:	48 89 c7             	mov    rdi,rax
  807caa:	e8 4f f6 ff ff       	call   8072fe <write_sec>
    update_fat_and_root();
  807caf:	b8 00 00 00 00       	mov    eax,0x0
  807cb4:	e8 e0 f6 ff ff       	call   807399 <update_fat_and_root>
    return 0;
  807cb9:	b8 00 00 00 00       	mov    eax,0x0
}
  807cbe:	c9                   	leave  
  807cbf:	c3                   	ret    

0000000000807cc0 <find>:
int find_f=0;
int find(char *name)
{
  807cc0:	f3 0f 1e fa          	endbr64 
  807cc4:	55                   	push   rbp
  807cc5:	48 89 e5             	mov    rbp,rsp
  807cc8:	48 83 ec 30          	sub    rsp,0x30
  807ccc:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  807cd0:	c7 45 fc 00 02 00 00 	mov    DWORD PTR [rbp-0x4],0x200
    int index=0;
  807cd7:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    dir_entry *dir_table=a_clu_of_dir;
  807cde:	48 c7 45 f0 c0 c8 42 	mov    QWORD PTR [rbp-0x10],0x42c8c0
  807ce5:	00 
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  807ce6:	0f b7 05 cd 4b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24bcd]        # 42c8ba <cur_dir+0x1a>
  807ced:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
    if(cur_dir.fistCluNum==0)
  807cf1:	0f b7 05 c2 4b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24bc2]        # 42c8ba <cur_dir+0x1a>
  807cf8:	66 85 c0             	test   ax,ax
  807cfb:	75 0a                	jne    807d07 <find+0x47>
        dir_table=root_dir;
  807cfd:	48 c7 45 f0 a0 88 42 	mov    QWORD PTR [rbp-0x10],0x4288a0
  807d04:	00 
  807d05:	eb 2b                	jmp    807d32 <find+0x72>
    else {
        max_files=16;
  807d07:	c7 45 fc 10 00 00 00 	mov    DWORD PTR [rbp-0x4],0x10
        read_sec(dir_table, cluster + clu_sec_balance, \
            superblock.secPerClu);
  807d0e:	0f b6 05 58 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20b58]        # 42886d <superblock+0xd>
        read_sec(dir_table, cluster + clu_sec_balance, \
  807d15:	0f b6 d0             	movzx  edx,al
  807d18:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  807d1c:	8b 05 3e 23 00 00    	mov    eax,DWORD PTR [rip+0x233e]        # 80a060 <clu_sec_balance>
  807d22:	01 c1                	add    ecx,eax
  807d24:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807d28:	89 ce                	mov    esi,ecx
  807d2a:	48 89 c7             	mov    rdi,rax
  807d2d:	e8 c0 fc ff ff       	call   8079f2 <read_sec>
    }
    do{
        for(int i=0;i<max_files;i++)
  807d32:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  807d39:	eb 57                	jmp    807d92 <find+0xd2>
        {
            if(dir_table[i].name[0]==0||dir_table[i].name[0]==0xe5)
  807d3b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807d3e:	48 98                	cdqe   
  807d40:	48 c1 e0 05          	shl    rax,0x5
  807d44:	48 89 c2             	mov    rdx,rax
  807d47:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807d4b:	48 01 d0             	add    rax,rdx
  807d4e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807d51:	84 c0                	test   al,al
  807d53:	74 38                	je     807d8d <find+0xcd>
                continue;
            if(memcmp(dir_table[i].name,name,11)==0)
  807d55:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807d58:	48 98                	cdqe   
  807d5a:	48 c1 e0 05          	shl    rax,0x5
  807d5e:	48 89 c2             	mov    rdx,rax
  807d61:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807d65:	48 01 d0             	add    rax,rdx
  807d68:	48 89 c1             	mov    rcx,rax
  807d6b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807d6f:	ba 0b 00 00 00       	mov    edx,0xb
  807d74:	48 89 c6             	mov    rsi,rax
  807d77:	48 89 cf             	mov    rdi,rcx
  807d7a:	e8 a4 17 00 00       	call   809523 <memcmp>
  807d7f:	85 c0                	test   eax,eax
  807d81:	75 0b                	jne    807d8e <find+0xce>
            {
                return index+i;
  807d83:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  807d86:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807d89:	01 d0                	add    eax,edx
  807d8b:	eb 71                	jmp    807dfe <find+0x13e>
                continue;
  807d8d:	90                   	nop
        for(int i=0;i<max_files;i++)
  807d8e:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  807d92:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807d95:	3b 45 fc             	cmp    eax,DWORD PTR [rbp-0x4]
  807d98:	7c a1                	jl     807d3b <find+0x7b>
            }
        }
        if(cur_dir.fistCluNum==0)
  807d9a:	0f b7 05 19 4b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24b19]        # 42c8ba <cur_dir+0x1a>
  807da1:	66 85 c0             	test   ax,ax
  807da4:	75 07                	jne    807dad <find+0xed>
            return -1;
  807da6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807dab:	eb 51                	jmp    807dfe <find+0x13e>
        else if(cluster<FAT_EOF)
  807dad:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  807db2:	77 3a                	ja     807dee <find+0x12e>
        {
            index+=16;
  807db4:	83 45 f8 10          	add    DWORD PTR [rbp-0x8],0x10
            cluster=fat[cluster];
  807db8:	0f b7 45 ee          	movzx  eax,WORD PTR [rbp-0x12]
  807dbc:	48 98                	cdqe   
  807dbe:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807dc5:	00 
  807dc6:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807dca:	0f b6 05 9c 0a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20a9c]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807dd1:	0f b6 d0             	movzx  edx,al
  807dd4:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  807dd8:	8b 05 82 22 00 00    	mov    eax,DWORD PTR [rip+0x2282]        # 80a060 <clu_sec_balance>
  807dde:	01 c1                	add    ecx,eax
  807de0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807de4:	89 ce                	mov    esi,ecx
  807de6:	48 89 c7             	mov    rdi,rax
  807de9:	e8 04 fc ff ff       	call   8079f2 <read_sec>
        }
    }while(cluster<FAT_EOF);
  807dee:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  807df3:	0f 86 39 ff ff ff    	jbe    807d32 <find+0x72>
    return -1;
  807df9:	b8 ff ff ff ff       	mov    eax,0xffffffff

}
  807dfe:	c9                   	leave  
  807dff:	c3                   	ret    

0000000000807e00 <read_file_byname>:

int read_file_byname(char *full_name,char *dist,int pos,int len)
{
  807e00:	f3 0f 1e fa          	endbr64 
  807e04:	55                   	push   rbp
  807e05:	48 89 e5             	mov    rbp,rsp
  807e08:	41 57                	push   r15
  807e0a:	41 56                	push   r14
  807e0c:	41 55                	push   r13
  807e0e:	41 54                	push   r12
  807e10:	53                   	push   rbx
  807e11:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  807e18:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  807e1f:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  807e26:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  807e2c:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  807e32:	48 89 e0             	mov    rax,rsp
  807e35:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  807e38:	bf 00 00 00 00       	mov    edi,0x0
  807e3d:	e8 7e fe ff ff       	call   807cc0 <find>
  807e42:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  807e45:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  807e49:	74 09                	je     807e54 <read_file_byname+0x54>
  807e4b:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  807e52:	79 0a                	jns    807e5e <read_file_byname+0x5e>
        return -1;
  807e54:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807e59:	e9 ea 02 00 00       	jmp    808148 <read_file_byname+0x348>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  807e5e:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  807e65:	48 c7 45 c0 a0 88 42 	mov    QWORD PTR [rbp-0x40],0x4288a0
  807e6c:	00 
    int in_root=1;
  807e6d:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  807e74:	0f b7 05 3f 4a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24a3f]        # 42c8ba <cur_dir+0x1a>
  807e7b:	66 85 c0             	test   ax,ax
  807e7e:	74 40                	je     807ec0 <read_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  807e80:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  807e87:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  807e8e:	0f b6 05 d8 09 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc209d8]        # 42886d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  807e95:	0f b6 c0             	movzx  eax,al
  807e98:	0f b7 15 1b 4a c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc24a1b]        # 42c8ba <cur_dir+0x1a>
  807e9f:	0f b7 ca             	movzx  ecx,dx
  807ea2:	8b 15 b8 21 00 00    	mov    edx,DWORD PTR [rip+0x21b8]        # 80a060 <clu_sec_balance>
  807ea8:	01 d1                	add    ecx,edx
  807eaa:	89 c2                	mov    edx,eax
  807eac:	89 ce                	mov    esi,ecx
  807eae:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807eb3:	e8 3a fb ff ff       	call   8079f2 <read_sec>
        dir_table=a_clu_of_dir;
  807eb8:	48 c7 45 c0 c0 c8 42 	mov    QWORD PTR [rbp-0x40],0x42c8c0
  807ebf:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  807ec0:	0f b7 05 f3 49 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc249f3]        # 42c8ba <cur_dir+0x1a>
  807ec7:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  807ecb:	eb 41                	jmp    807f0e <read_file_byname+0x10e>
        index-=16;
  807ecd:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  807ed1:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  807ed6:	77 36                	ja     807f0e <read_file_byname+0x10e>
        {
            cluster=fat[cluster];
  807ed8:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  807edc:	48 98                	cdqe   
  807ede:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807ee5:	00 
  807ee6:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807eea:	0f b6 05 7c 09 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2097c]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807ef1:	0f b6 d0             	movzx  edx,al
  807ef4:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  807ef8:	8b 05 62 21 00 00    	mov    eax,DWORD PTR [rip+0x2162]        # 80a060 <clu_sec_balance>
  807efe:	01 c1                	add    ecx,eax
  807f00:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807f04:	89 ce                	mov    esi,ecx
  807f06:	48 89 c7             	mov    rdi,rax
  807f09:	e8 e4 fa ff ff       	call   8079f2 <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  807f0e:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  807f12:	75 0d                	jne    807f21 <read_file_byname+0x121>
  807f14:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  807f18:	7e 07                	jle    807f21 <read_file_byname+0x121>
  807f1a:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  807f1f:	76 ac                	jbe    807ecd <read_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  807f21:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  807f24:	48 98                	cdqe   
  807f26:	48 c1 e0 05          	shl    rax,0x5
  807f2a:	48 89 c2             	mov    rdx,rax
  807f2d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807f31:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807f35:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  807f38:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  807f3c:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  807f43:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  807f4a:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  807f4e:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  807f52:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  807f56:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  807f5a:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  807f5e:	0f b7 c0             	movzx  eax,ax
  807f61:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  807f64:	0f b7 05 00 09 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20900]        # 42886b <superblock+0xb>
  807f6b:	0f b7 d0             	movzx  edx,ax
  807f6e:	0f b6 05 f8 08 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc208f8]        # 42886d <superblock+0xd>
  807f75:	0f b6 c0             	movzx  eax,al
  807f78:	0f af c2             	imul   eax,edx
  807f7b:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  807f7e:	eb 25                	jmp    807fa5 <read_file_byname+0x1a5>
    {
        pos-=cluster_size;
  807f80:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807f83:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        f_cluster=fat[f_cluster];
  807f89:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807f8c:	48 98                	cdqe   
  807f8e:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807f95:	00 
  807f96:	98                   	cwde   
  807f97:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        if(pos<cluster_size)
  807f9a:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807fa0:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  807fa3:	7c 0d                	jl     807fb2 <read_file_byname+0x1b2>
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  807fa5:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807fab:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  807fae:	7d d0                	jge    807f80 <read_file_byname+0x180>
  807fb0:	eb 01                	jmp    807fb3 <read_file_byname+0x1b3>
            break;
  807fb2:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  807fb3:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  807fba:	7e 15                	jle    807fd1 <read_file_byname+0x1d1>
  807fbc:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807fc2:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  807fc5:	7c 0a                	jl     807fd1 <read_file_byname+0x1d1>
        return -1;//pos out of range
  807fc7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807fcc:	e9 77 01 00 00       	jmp    808148 <read_file_byname+0x348>
    //
    char temp[cluster_size];
  807fd1:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807fd4:	48 63 d0             	movsxd rdx,eax
  807fd7:	48 83 ea 01          	sub    rdx,0x1
  807fdb:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  807fdf:	48 63 d0             	movsxd rdx,eax
  807fe2:	49 89 d6             	mov    r14,rdx
  807fe5:	41 bf 00 00 00 00    	mov    r15d,0x0
  807feb:	48 63 d0             	movsxd rdx,eax
  807fee:	49 89 d4             	mov    r12,rdx
  807ff1:	41 bd 00 00 00 00    	mov    r13d,0x0
  807ff7:	48 98                	cdqe   
  807ff9:	ba 10 00 00 00       	mov    edx,0x10
  807ffe:	48 83 ea 01          	sub    rdx,0x1
  808002:	48 01 d0             	add    rax,rdx
  808005:	be 10 00 00 00       	mov    esi,0x10
  80800a:	ba 00 00 00 00       	mov    edx,0x0
  80800f:	48 f7 f6             	div    rsi
  808012:	48 6b c0 10          	imul   rax,rax,0x10
  808016:	48 89 c1             	mov    rcx,rax
  808019:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  808020:	48 89 e2             	mov    rdx,rsp
  808023:	48 29 ca             	sub    rdx,rcx
  808026:	48 39 d4             	cmp    rsp,rdx
  808029:	74 12                	je     80803d <read_file_byname+0x23d>
  80802b:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  808032:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  808039:	00 00 
  80803b:	eb e9                	jmp    808026 <read_file_byname+0x226>
  80803d:	48 89 c2             	mov    rdx,rax
  808040:	81 e2 ff 0f 00 00    	and    edx,0xfff
  808046:	48 29 d4             	sub    rsp,rdx
  808049:	48 89 c2             	mov    rdx,rax
  80804c:	81 e2 ff 0f 00 00    	and    edx,0xfff
  808052:	48 85 d2             	test   rdx,rdx
  808055:	74 10                	je     808067 <read_file_byname+0x267>
  808057:	25 ff 0f 00 00       	and    eax,0xfff
  80805c:	48 83 e8 08          	sub    rax,0x8
  808060:	48 01 e0             	add    rax,rsp
  808063:	48 83 08 00          	or     QWORD PTR [rax],0x0
  808067:	48 89 e0             	mov    rax,rsp
  80806a:	48 83 c0 00          	add    rax,0x0
  80806e:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of reading might be not aligned
    read_sec(temp,f_cluster+clu_sec_balance,superblock.secPerClu);
  808072:	0f b6 05 f4 07 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc207f4]        # 42886d <superblock+0xd>
  808079:	0f b6 d0             	movzx  edx,al
  80807c:	8b 0d de 1f 00 00    	mov    ecx,DWORD PTR [rip+0x1fde]        # 80a060 <clu_sec_balance>
  808082:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808085:	01 c1                	add    ecx,eax
  808087:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80808b:	89 ce                	mov    esi,ecx
  80808d:	48 89 c7             	mov    rdi,rax
  808090:	e8 5d f9 ff ff       	call   8079f2 <read_sec>
    memcpy(dist,temp+pos,cluster_size-pos);
  808095:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808098:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80809e:	89 c2                	mov    edx,eax
  8080a0:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8080a6:	48 63 c8             	movsxd rcx,eax
  8080a9:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8080ad:	48 01 c1             	add    rcx,rax
  8080b0:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8080b7:	48 89 ce             	mov    rsi,rcx
  8080ba:	48 89 c7             	mov    rdi,rax
  8080bd:	e8 17 14 00 00       	call   8094d9 <memcpy>
    dist+=cluster_size-pos;
  8080c2:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8080c5:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  8080cb:	48 98                	cdqe   
  8080cd:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
    len-=cluster_size-pos;
  8080d4:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8080d7:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  8080dd:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  8080e3:	eb 4c                	jmp    808131 <read_file_byname+0x331>
    {
        f_cluster=fat[f_cluster];
  8080e5:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8080e8:	48 98                	cdqe   
  8080ea:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8080f1:	00 
  8080f2:	98                   	cwde   
  8080f3:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        read_sec(dist,f_cluster+clu_sec_balance,superblock.secPerClu);
  8080f6:	0f b6 05 70 07 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20770]        # 42886d <superblock+0xd>
  8080fd:	0f b6 d0             	movzx  edx,al
  808100:	8b 0d 5a 1f 00 00    	mov    ecx,DWORD PTR [rip+0x1f5a]        # 80a060 <clu_sec_balance>
  808106:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808109:	01 c1                	add    ecx,eax
  80810b:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  808112:	89 ce                	mov    esi,ecx
  808114:	48 89 c7             	mov    rdi,rax
  808117:	e8 d6 f8 ff ff       	call   8079f2 <read_sec>
        dist+=cluster_size;
  80811c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80811f:	48 98                	cdqe   
  808121:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  808128:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80812b:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  808131:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808138:	7f 09                	jg     808143 <read_file_byname+0x343>
  80813a:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  808141:	7f a2                	jg     8080e5 <read_file_byname+0x2e5>
    }
    return 0;
  808143:	b8 00 00 00 00       	mov    eax,0x0
  808148:	48 89 dc             	mov    rsp,rbx
    
}
  80814b:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  80814f:	5b                   	pop    rbx
  808150:	41 5c                	pop    r12
  808152:	41 5d                	pop    r13
  808154:	41 5e                	pop    r14
  808156:	41 5f                	pop    r15
  808158:	5d                   	pop    rbp
  808159:	c3                   	ret    

000000000080815a <write_file_byname>:
int write_file_byname(char *full_name,char *src,int pos,int len)
{
  80815a:	f3 0f 1e fa          	endbr64 
  80815e:	55                   	push   rbp
  80815f:	48 89 e5             	mov    rbp,rsp
  808162:	41 57                	push   r15
  808164:	41 56                	push   r14
  808166:	41 55                	push   r13
  808168:	41 54                	push   r12
  80816a:	53                   	push   rbx
  80816b:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  808172:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  808179:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  808180:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  808186:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  80818c:	48 89 e0             	mov    rax,rsp
  80818f:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  808192:	bf 00 00 00 00       	mov    edi,0x0
  808197:	e8 24 fb ff ff       	call   807cc0 <find>
  80819c:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  80819f:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  8081a3:	74 09                	je     8081ae <write_file_byname+0x54>
  8081a5:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  8081ac:	79 0a                	jns    8081b8 <write_file_byname+0x5e>
        return -1;
  8081ae:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8081b3:	e9 1e 03 00 00       	jmp    8084d6 <write_file_byname+0x37c>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  8081b8:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  8081bf:	48 c7 45 c0 a0 88 42 	mov    QWORD PTR [rbp-0x40],0x4288a0
  8081c6:	00 
    int in_root=1;
  8081c7:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  8081ce:	0f b7 05 e5 46 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc246e5]        # 42c8ba <cur_dir+0x1a>
  8081d5:	66 85 c0             	test   ax,ax
  8081d8:	74 40                	je     80821a <write_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  8081da:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  8081e1:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  8081e8:	0f b6 05 7e 06 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2067e]        # 42886d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  8081ef:	0f b6 c0             	movzx  eax,al
  8081f2:	0f b7 15 c1 46 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc246c1]        # 42c8ba <cur_dir+0x1a>
  8081f9:	0f b7 ca             	movzx  ecx,dx
  8081fc:	8b 15 5e 1e 00 00    	mov    edx,DWORD PTR [rip+0x1e5e]        # 80a060 <clu_sec_balance>
  808202:	01 d1                	add    ecx,edx
  808204:	89 c2                	mov    edx,eax
  808206:	89 ce                	mov    esi,ecx
  808208:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  80820d:	e8 e0 f7 ff ff       	call   8079f2 <read_sec>
        dir_table=a_clu_of_dir;
  808212:	48 c7 45 c0 c0 c8 42 	mov    QWORD PTR [rbp-0x40],0x42c8c0
  808219:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  80821a:	0f b7 05 99 46 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24699]        # 42c8ba <cur_dir+0x1a>
  808221:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  808225:	eb 41                	jmp    808268 <write_file_byname+0x10e>
        index-=16;
  808227:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  80822b:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  808230:	77 36                	ja     808268 <write_file_byname+0x10e>
        {
            cluster=fat[cluster];
  808232:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  808236:	48 98                	cdqe   
  808238:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  80823f:	00 
  808240:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  808244:	0f b6 05 22 06 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20622]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  80824b:	0f b6 d0             	movzx  edx,al
  80824e:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  808252:	8b 05 08 1e 00 00    	mov    eax,DWORD PTR [rip+0x1e08]        # 80a060 <clu_sec_balance>
  808258:	01 c1                	add    ecx,eax
  80825a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80825e:	89 ce                	mov    esi,ecx
  808260:	48 89 c7             	mov    rdi,rax
  808263:	e8 8a f7 ff ff       	call   8079f2 <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  808268:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  80826c:	75 0d                	jne    80827b <write_file_byname+0x121>
  80826e:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  808272:	7e 07                	jle    80827b <write_file_byname+0x121>
  808274:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  808279:	76 ac                	jbe    808227 <write_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  80827b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80827e:	48 98                	cdqe   
  808280:	48 c1 e0 05          	shl    rax,0x5
  808284:	48 89 c2             	mov    rdx,rax
  808287:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80828b:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80828f:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808292:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808296:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  80829d:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  8082a4:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8082a8:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  8082ac:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  8082b0:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  8082b4:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  8082b8:	0f b7 c0             	movzx  eax,ax
  8082bb:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  8082be:	0f b7 05 a6 05 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc205a6]        # 42886b <superblock+0xb>
  8082c5:	0f b7 d0             	movzx  edx,ax
  8082c8:	0f b6 05 9e 05 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2059e]        # 42886d <superblock+0xd>
  8082cf:	0f b6 c0             	movzx  eax,al
  8082d2:	0f af c2             	imul   eax,edx
  8082d5:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  8082d8:	eb 25                	jmp    8082ff <write_file_byname+0x1a5>
    {
        pos-=cluster_size;
  8082da:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8082dd:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        if(pos<cluster_size)
  8082e3:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8082e9:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8082ec:	7c 1e                	jl     80830c <write_file_byname+0x1b2>
            break;
        f_cluster=fat[f_cluster];
  8082ee:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8082f1:	48 98                	cdqe   
  8082f3:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8082fa:	00 
  8082fb:	98                   	cwde   
  8082fc:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  8082ff:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808305:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808308:	7d d0                	jge    8082da <write_file_byname+0x180>
  80830a:	eb 01                	jmp    80830d <write_file_byname+0x1b3>
            break;
  80830c:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  80830d:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808314:	7e 15                	jle    80832b <write_file_byname+0x1d1>
  808316:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  80831c:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  80831f:	7c 0a                	jl     80832b <write_file_byname+0x1d1>
        return -1;//pos out of range
  808321:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808326:	e9 ab 01 00 00       	jmp    8084d6 <write_file_byname+0x37c>
    //
    char temp[cluster_size];
  80832b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80832e:	48 63 d0             	movsxd rdx,eax
  808331:	48 83 ea 01          	sub    rdx,0x1
  808335:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  808339:	48 63 d0             	movsxd rdx,eax
  80833c:	49 89 d6             	mov    r14,rdx
  80833f:	41 bf 00 00 00 00    	mov    r15d,0x0
  808345:	48 63 d0             	movsxd rdx,eax
  808348:	49 89 d4             	mov    r12,rdx
  80834b:	41 bd 00 00 00 00    	mov    r13d,0x0
  808351:	48 98                	cdqe   
  808353:	ba 10 00 00 00       	mov    edx,0x10
  808358:	48 83 ea 01          	sub    rdx,0x1
  80835c:	48 01 d0             	add    rax,rdx
  80835f:	be 10 00 00 00       	mov    esi,0x10
  808364:	ba 00 00 00 00       	mov    edx,0x0
  808369:	48 f7 f6             	div    rsi
  80836c:	48 6b c0 10          	imul   rax,rax,0x10
  808370:	48 89 c1             	mov    rcx,rax
  808373:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  80837a:	48 89 e2             	mov    rdx,rsp
  80837d:	48 29 ca             	sub    rdx,rcx
  808380:	48 39 d4             	cmp    rsp,rdx
  808383:	74 12                	je     808397 <write_file_byname+0x23d>
  808385:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  80838c:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  808393:	00 00 
  808395:	eb e9                	jmp    808380 <write_file_byname+0x226>
  808397:	48 89 c2             	mov    rdx,rax
  80839a:	81 e2 ff 0f 00 00    	and    edx,0xfff
  8083a0:	48 29 d4             	sub    rsp,rdx
  8083a3:	48 89 c2             	mov    rdx,rax
  8083a6:	81 e2 ff 0f 00 00    	and    edx,0xfff
  8083ac:	48 85 d2             	test   rdx,rdx
  8083af:	74 10                	je     8083c1 <write_file_byname+0x267>
  8083b1:	25 ff 0f 00 00       	and    eax,0xfff
  8083b6:	48 83 e8 08          	sub    rax,0x8
  8083ba:	48 01 e0             	add    rax,rsp
  8083bd:	48 83 08 00          	or     QWORD PTR [rax],0x0
  8083c1:	48 89 e0             	mov    rax,rsp
  8083c4:	48 83 c0 00          	add    rax,0x0
  8083c8:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of writing might not be aligned
    if(pos>0)
  8083cc:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  8083d3:	0f 8e a2 00 00 00    	jle    80847b <write_file_byname+0x321>
    {
        memcpy(temp+pos,src,cluster_size-pos);
  8083d9:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8083dc:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  8083e2:	89 c2                	mov    edx,eax
  8083e4:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8083ea:	48 63 c8             	movsxd rcx,eax
  8083ed:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8083f1:	48 01 c1             	add    rcx,rax
  8083f4:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8083fb:	48 89 c6             	mov    rsi,rax
  8083fe:	48 89 cf             	mov    rdi,rcx
  808401:	e8 d3 10 00 00       	call   8094d9 <memcpy>
        write_sec(temp,f_cluster,cluster_size-pos);
  808406:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808409:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80840f:	89 c2                	mov    edx,eax
  808411:	8b 4d b4             	mov    ecx,DWORD PTR [rbp-0x4c]
  808414:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808418:	89 ce                	mov    esi,ecx
  80841a:	48 89 c7             	mov    rdi,rax
  80841d:	e8 dc ee ff ff       	call   8072fe <write_sec>
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  808422:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808425:	48 98                	cdqe   
  808427:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  80842e:	00 
  80842f:	98                   	cwde   
  808430:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    }
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  808433:	eb 46                	jmp    80847b <write_file_byname+0x321>
    {
        write_sec(src,f_cluster+clu_sec_balance,cluster_size);
  808435:	8b 15 25 1c 00 00    	mov    edx,DWORD PTR [rip+0x1c25]        # 80a060 <clu_sec_balance>
  80843b:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80843e:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  808441:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  808444:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  80844b:	89 ce                	mov    esi,ecx
  80844d:	48 89 c7             	mov    rdi,rax
  808450:	e8 a9 ee ff ff       	call   8072fe <write_sec>
        src+=cluster_size;
  808455:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808458:	48 98                	cdqe   
  80845a:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  808461:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808464:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  80846a:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80846d:	48 98                	cdqe   
  80846f:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808476:	00 
  808477:	98                   	cwde   
  808478:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  80847b:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808482:	7f 0b                	jg     80848f <write_file_byname+0x335>
  808484:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa8]
  80848a:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  80848d:	7d a6                	jge    808435 <write_file_byname+0x2db>
    }
    if(len>0)
  80848f:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  808496:	7e 39                	jle    8084d1 <write_file_byname+0x377>
    {
        //there might be some leftover less than a cluster
        memcpy(temp,src,len);
  808498:	8b 95 58 ff ff ff    	mov    edx,DWORD PTR [rbp-0xa8]
  80849e:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  8084a5:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8084a9:	48 89 ce             	mov    rsi,rcx
  8084ac:	48 89 c7             	mov    rdi,rax
  8084af:	e8 25 10 00 00       	call   8094d9 <memcpy>
        write_sec(temp,f_cluster+clu_sec_balance,cluster_size);
  8084b4:	8b 15 a6 1b 00 00    	mov    edx,DWORD PTR [rip+0x1ba6]        # 80a060 <clu_sec_balance>
  8084ba:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8084bd:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  8084c0:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  8084c3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8084c7:	89 ce                	mov    esi,ecx
  8084c9:	48 89 c7             	mov    rdi,rax
  8084cc:	e8 2d ee ff ff       	call   8072fe <write_sec>
    }
    return 0;
  8084d1:	b8 00 00 00 00       	mov    eax,0x0
  8084d6:	48 89 dc             	mov    rsp,rbx

}
  8084d9:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  8084dd:	5b                   	pop    rbx
  8084de:	41 5c                	pop    r12
  8084e0:	41 5d                	pop    r13
  8084e2:	41 5e                	pop    r14
  8084e4:	41 5f                	pop    r15
  8084e6:	5d                   	pop    rbp
  8084e7:	c3                   	ret    

00000000008084e8 <file_exist>:


int file_exist(dir_entry entry)
{
  8084e8:	f3 0f 1e fa          	endbr64 
  8084ec:	55                   	push   rbp
  8084ed:	48 89 e5             	mov    rbp,rsp
    if((unsigned char)entry.name[0]==0xe5u||\
  8084f0:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
  8084f4:	3c e5                	cmp    al,0xe5
  8084f6:	74 08                	je     808500 <file_exist+0x18>
    (unsigned char)entry.name[0]==0u)
  8084f8:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
    if((unsigned char)entry.name[0]==0xe5u||\
  8084fc:	84 c0                	test   al,al
  8084fe:	75 07                	jne    808507 <file_exist+0x1f>
    {
        //printf("file not exist\n");
        return 0;
  808500:	b8 00 00 00 00       	mov    eax,0x0
  808505:	eb 05                	jmp    80850c <file_exist+0x24>

    }
    return 1;
  808507:	b8 01 00 00 00       	mov    eax,0x1
}
  80850c:	5d                   	pop    rbp
  80850d:	c3                   	ret    

000000000080850e <get_entry>:
int get_entry(driver_args* args)
{
  80850e:	f3 0f 1e fa          	endbr64 
  808512:	55                   	push   rbp
  808513:	48 89 e5             	mov    rbp,rsp
  808516:	53                   	push   rbx
  808517:	48 81 ec e8 00 00 00 	sub    rsp,0xe8
  80851e:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
    char *name=args->path;
  808525:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80852c:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  808530:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    dir.fistCluNum=((vfs_dir_entry*)args->cwd)->id;
  808534:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80853b:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  808542:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808545:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    dir_entry entry;
    vfs_dir_entry ret;
    entry.name[0]=0xe5;
  808549:	c6 45 90 e5          	mov    BYTE PTR [rbp-0x70],0xe5

    char *p=name;
  80854d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808551:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    char nametmp[12];
    int index=-1;
  808555:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [rbp-0x24],0xffffffff
    while(*name!='\0')
  80855c:	e9 2c 01 00 00       	jmp    80868d <get_entry+0x17f>
    {
        if(*name=='/')
  808561:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808565:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808568:	3c 2f                	cmp    al,0x2f
  80856a:	0f 85 18 01 00 00    	jne    808688 <get_entry+0x17a>
        {
            if(name-p>11)return -1;
  808570:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808574:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  808578:	48 83 f8 0b          	cmp    rax,0xb
  80857c:	7e 0a                	jle    808588 <get_entry+0x7a>
  80857e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808583:	e9 50 02 00 00       	jmp    8087d8 <get_entry+0x2ca>
            memcpy(nametmp,p,name-p);
  808588:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80858c:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  808590:	89 c2                	mov    edx,eax
  808592:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  808596:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  80859d:	48 89 ce             	mov    rsi,rcx
  8085a0:	48 89 c7             	mov    rdi,rax
  8085a3:	e8 31 0f 00 00       	call   8094d9 <memcpy>
            cur_dir=dir;
  8085a8:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8085ac:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8085b0:	48 89 05 e9 42 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc242e9],rax        # 42c8a0 <cur_dir>
  8085b7:	48 89 15 ea 42 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc242ea],rdx        # 42c8a8 <cur_dir+0x8>
  8085be:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8085c2:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8085c6:	48 89 05 e3 42 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc242e3],rax        # 42c8b0 <cur_dir+0x10>
  8085cd:	48 89 15 e4 42 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc242e4],rdx        # 42c8b8 <cur_dir+0x18>
            format_name(nametmp);
  8085d4:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  8085db:	48 89 c7             	mov    rdi,rax
  8085de:	e8 c3 eb ff ff       	call   8071a6 <format_name>
            index= find(nametmp);
  8085e3:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  8085ea:	48 89 c7             	mov    rdi,rax
  8085ed:	e8 ce f6 ff ff       	call   807cc0 <find>
  8085f2:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            if(index==-1)return -1;
  8085f5:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  8085f9:	75 0a                	jne    808605 <get_entry+0xf7>
  8085fb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808600:	e9 d3 01 00 00       	jmp    8087d8 <get_entry+0x2ca>
            if(cur_dir.fistCluNum==0)//在根目录
  808605:	0f b7 05 ae 42 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc242ae]        # 42c8ba <cur_dir+0x1a>
  80860c:	66 85 c0             	test   ax,ax
  80860f:	75 31                	jne    808642 <get_entry+0x134>
                dir=root_dir[index];
  808611:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808614:	48 98                	cdqe   
  808616:	48 c1 e0 05          	shl    rax,0x5
  80861a:	48 8d 88 a0 88 42 00 	lea    rcx,[rax+0x4288a0]
  808621:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808624:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808628:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  80862c:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  808630:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808634:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808638:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  80863c:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  808640:	eb 3a                	jmp    80867c <get_entry+0x16e>
            else//在子目录
                dir=a_clu_of_dir[index%16];
  808642:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808645:	99                   	cdq    
  808646:	c1 ea 1c             	shr    edx,0x1c
  808649:	01 d0                	add    eax,edx
  80864b:	83 e0 0f             	and    eax,0xf
  80864e:	29 d0                	sub    eax,edx
  808650:	48 98                	cdqe   
  808652:	48 c1 e0 05          	shl    rax,0x5
  808656:	48 8d 88 c0 c8 42 00 	lea    rcx,[rax+0x42c8c0]
  80865d:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808660:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808664:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  808668:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  80866c:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808670:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808674:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  808678:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
            p=name+1;
  80867c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808680:	48 83 c0 01          	add    rax,0x1
  808684:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        }
        name++;
  808688:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
    while(*name!='\0')
  80868d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808691:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808694:	84 c0                	test   al,al
  808696:	0f 85 c5 fe ff ff    	jne    808561 <get_entry+0x53>
    }

    //现在就可以开始找文件了
    format_name(p);
  80869c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8086a0:	48 89 c7             	mov    rdi,rax
  8086a3:	e8 fe ea ff ff       	call   8071a6 <format_name>
    index= find(p);
  8086a8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8086ac:	48 89 c7             	mov    rdi,rax
  8086af:	e8 0c f6 ff ff       	call   807cc0 <find>
  8086b4:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    if(index==-1)return -1;
  8086b7:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  8086bb:	75 0a                	jne    8086c7 <get_entry+0x1b9>
  8086bd:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8086c2:	e9 11 01 00 00       	jmp    8087d8 <get_entry+0x2ca>
    
    if(cur_dir.fistCluNum==0)//在根目录
  8086c7:	0f b7 05 ec 41 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc241ec]        # 42c8ba <cur_dir+0x1a>
  8086ce:	66 85 c0             	test   ax,ax
  8086d1:	75 31                	jne    808704 <get_entry+0x1f6>
        entry=root_dir[index];
  8086d3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8086d6:	48 98                	cdqe   
  8086d8:	48 c1 e0 05          	shl    rax,0x5
  8086dc:	48 8d 88 a0 88 42 00 	lea    rcx,[rax+0x4288a0]
  8086e3:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8086e6:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  8086ea:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  8086ee:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  8086f2:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8086f6:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  8086fa:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  8086fe:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  808702:	eb 3a                	jmp    80873e <get_entry+0x230>
    else//在子目录
        entry=a_clu_of_dir[index%16];
  808704:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808707:	99                   	cdq    
  808708:	c1 ea 1c             	shr    edx,0x1c
  80870b:	01 d0                	add    eax,edx
  80870d:	83 e0 0f             	and    eax,0xf
  808710:	29 d0                	sub    eax,edx
  808712:	48 98                	cdqe   
  808714:	48 c1 e0 05          	shl    rax,0x5
  808718:	48 8d 88 c0 c8 42 00 	lea    rcx,[rax+0x42c8c0]
  80871f:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808722:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808726:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  80872a:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  80872e:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808732:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808736:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  80873a:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
    ret.id=entry.fistCluNum;
  80873e:	0f b7 45 aa          	movzx  eax,WORD PTR [rbp-0x56]
  808742:	0f b7 c0             	movzx  eax,ax
  808745:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    args->entry=ret;
  80874b:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808752:	48 8b 8d 30 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd0]
  808759:	48 8b 9d 38 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xc8]
  808760:	48 89 48 28          	mov    QWORD PTR [rax+0x28],rcx
  808764:	48 89 58 30          	mov    QWORD PTR [rax+0x30],rbx
  808768:	48 8b 8d 40 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xc0]
  80876f:	48 8b 9d 48 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xb8]
  808776:	48 89 48 38          	mov    QWORD PTR [rax+0x38],rcx
  80877a:	48 89 58 40          	mov    QWORD PTR [rax+0x40],rbx
  80877e:	48 8b 8d 50 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb0]
  808785:	48 8b 9d 58 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xa8]
  80878c:	48 89 48 48          	mov    QWORD PTR [rax+0x48],rcx
  808790:	48 89 58 50          	mov    QWORD PTR [rax+0x50],rbx
  808794:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  80879b:	48 8b 9d 68 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x98]
  8087a2:	48 89 48 58          	mov    QWORD PTR [rax+0x58],rcx
  8087a6:	48 89 58 60          	mov    QWORD PTR [rax+0x60],rbx
  8087aa:	48 8b 8d 70 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x90]
  8087b1:	48 8b 9d 78 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x88]
  8087b8:	48 89 48 68          	mov    QWORD PTR [rax+0x68],rcx
  8087bc:	48 89 58 70          	mov    QWORD PTR [rax+0x70],rbx
  8087c0:	48 8b 4d 80          	mov    rcx,QWORD PTR [rbp-0x80]
  8087c4:	48 8b 5d 88          	mov    rbx,QWORD PTR [rbp-0x78]
  8087c8:	48 89 48 78          	mov    QWORD PTR [rax+0x78],rcx
  8087cc:	48 89 98 80 00 00 00 	mov    QWORD PTR [rax+0x80],rbx
    return 0;
  8087d3:	b8 00 00 00 00       	mov    eax,0x0
}
  8087d8:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8087dc:	c9                   	leave  
  8087dd:	c3                   	ret    

00000000008087de <get_fname>:
        dir=strtok(NULL,'/');
    }
    return 0;
}*/
void get_fname(char *path,char *name)
{
  8087de:	f3 0f 1e fa          	endbr64 
  8087e2:	55                   	push   rbp
  8087e3:	48 89 e5             	mov    rbp,rsp
  8087e6:	48 83 ec 20          	sub    rsp,0x20
  8087ea:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8087ee:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    char *prev,*ptr=strtok(path,'/');
  8087f2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8087f6:	be 2f 00 00 00       	mov    esi,0x2f
  8087fb:	48 89 c7             	mov    rdi,rax
  8087fe:	e8 18 0e 00 00       	call   80961b <strtok>
  808803:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  808807:	eb 1b                	jmp    808824 <get_fname+0x46>
    {
        prev=ptr;
  808809:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80880d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        ptr=strtok(NULL,'/');
  808811:	be 2f 00 00 00       	mov    esi,0x2f
  808816:	bf 00 00 00 00       	mov    edi,0x0
  80881b:	e8 fb 0d 00 00       	call   80961b <strtok>
  808820:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  808824:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  808829:	75 de                	jne    808809 <get_fname+0x2b>
    }
    strcpy(name,prev);
  80882b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80882f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808833:	48 89 d6             	mov    rsi,rdx
  808836:	48 89 c7             	mov    rdi,rax
  808839:	e8 99 0d 00 00       	call   8095d7 <strcpy>
}
  80883e:	90                   	nop
  80883f:	c9                   	leave  
  808840:	c3                   	ret    

0000000000808841 <read_file>:
char buf[1024];
int read_file(driver_args* args)
{
  808841:	f3 0f 1e fa          	endbr64 
  808845:	55                   	push   rbp
  808846:	48 89 e5             	mov    rbp,rsp
  808849:	48 83 ec 60          	sub    rsp,0x60
  80884d:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    int len=args->len;
  808851:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808855:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808858:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int pos=args->pos;
  80885b:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80885f:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808862:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  808865:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808869:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  80886c:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    char* dist=args->dist_addr;
  808870:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808874:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808877:	48 98                	cdqe   
  808879:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int c=len/superblock.bytesPerSec;
  80887d:	0f b7 05 e7 ff c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1ffe7]        # 42886b <superblock+0xb>
  808884:	0f b7 f0             	movzx  esi,ax
  808887:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80888a:	99                   	cdq    
  80888b:	f7 fe                	idiv   esi
  80888d:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    c+=len%superblock.bytesPerSec?1:0;
  808890:	0f b7 05 d4 ff c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1ffd4]        # 42886b <superblock+0xb>
  808897:	0f b7 c8             	movzx  ecx,ax
  80889a:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80889d:	99                   	cdq    
  80889e:	f7 f9                	idiv   ecx
  8088a0:	89 d0                	mov    eax,edx
  8088a2:	85 c0                	test   eax,eax
  8088a4:	0f 95 c0             	setne  al
  8088a7:	0f b6 c0             	movzx  eax,al
  8088aa:	01 45 dc             	add    DWORD PTR [rbp-0x24],eax
    //printf("[fs]%d secs to sys_read.\n",c);
    int n=0;
  8088ad:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  8088b4:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  8088b8:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    int mpos=pos/superblock.bytesPerSec;
  8088bc:	0f b7 05 a8 ff c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1ffa8]        # 42886b <superblock+0xb>
  8088c3:	0f b7 f8             	movzx  edi,ax
  8088c6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8088c9:	99                   	cdq    
  8088ca:	f7 ff                	idiv   edi
  8088cc:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  8088cf:	eb 16                	jmp    8088e7 <read_file+0xa6>
    {
         clu=fat[clu];
  8088d1:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  8088d5:	48 98                	cdqe   
  8088d7:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8088de:	00 
  8088df:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  8088e3:	83 6d e4 01          	sub    DWORD PTR [rbp-0x1c],0x1
  8088e7:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  8088ec:	77 06                	ja     8088f4 <read_file+0xb3>
  8088ee:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  8088f2:	7f dd                	jg     8088d1 <read_file+0x90>
    }
    if(mpos>0)return -1;//读取位置超出范围
  8088f4:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  8088f8:	7e 0a                	jle    808904 <read_file+0xc3>
  8088fa:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8088ff:	e9 cd 00 00 00       	jmp    8089d1 <read_file+0x190>
    pos%=superblock.bytesPerSec;
  808904:	0f b7 05 60 ff c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1ff60]        # 42886b <superblock+0xb>
  80890b:	0f b7 c8             	movzx  ecx,ax
  80890e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808911:	99                   	cdq    
  808912:	f7 f9                	idiv   ecx
  808914:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
    int block_size=superblock.secPerClu*superblock.bytesPerSec;
  808917:	0f b6 05 4f ff c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1ff4f]        # 42886d <superblock+0xd>
  80891e:	0f b6 d0             	movzx  edx,al
  808921:	0f b7 05 43 ff c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1ff43]        # 42886b <superblock+0xb>
  808928:	0f b7 c0             	movzx  eax,ax
  80892b:	0f af c2             	imul   eax,edx
  80892e:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    while(n<c)
  808931:	e9 89 00 00 00       	jmp    8089bf <read_file+0x17e>
    {
        read_sec(buf,clu+clu_sec_balance,superblock.secPerClu);
  808936:	0f b6 05 30 ff c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1ff30]        # 42886d <superblock+0xd>
  80893d:	0f b6 c0             	movzx  eax,al
  808940:	0f b7 4d ea          	movzx  ecx,WORD PTR [rbp-0x16]
  808944:	8b 15 16 17 00 00    	mov    edx,DWORD PTR [rip+0x1716]        # 80a060 <clu_sec_balance>
  80894a:	01 d1                	add    ecx,edx
  80894c:	89 c2                	mov    edx,eax
  80894e:	89 ce                	mov    esi,ecx
  808950:	bf e0 0a 43 00       	mov    edi,0x430ae0
  808955:	e8 98 f0 ff ff       	call   8079f2 <read_sec>
        //printf("%x+%x\n",buf,pos);
        int cplen=block_size-pos>len?len:block_size-pos;
  80895a:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  80895d:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  808960:	8b 55 e0             	mov    edx,DWORD PTR [rbp-0x20]
  808963:	39 c2                	cmp    edx,eax
  808965:	0f 4e c2             	cmovle eax,edx
  808968:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
        memcpy(dist,buf+pos,cplen);
  80896b:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80896e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808971:	48 98                	cdqe   
  808973:	48 8d 88 e0 0a 43 00 	lea    rcx,[rax+0x430ae0]
  80897a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80897e:	48 89 ce             	mov    rsi,rcx
  808981:	48 89 c7             	mov    rdi,rax
  808984:	e8 50 0b 00 00       	call   8094d9 <memcpy>
        n++;
  808989:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        dist+=block_size-pos;
  80898d:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  808990:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  808993:	48 98                	cdqe   
  808995:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        if(pos>0)pos=0;
  808999:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80899d:	7e 07                	jle    8089a6 <read_file+0x165>
  80899f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        clu=fat[clu];
  8089a6:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  8089aa:	48 98                	cdqe   
  8089ac:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8089b3:	00 
  8089b4:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  8089b8:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  8089bd:	77 0e                	ja     8089cd <read_file+0x18c>
    while(n<c)
  8089bf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8089c2:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  8089c5:	0f 8c 6b ff ff ff    	jl     808936 <read_file+0xf5>
  8089cb:	eb 01                	jmp    8089ce <read_file+0x18d>
        if(clu>=FAT_EOF)break;
  8089cd:	90                   	nop
    }
    return n;
  8089ce:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
}
  8089d1:	c9                   	leave  
  8089d2:	c3                   	ret    

00000000008089d3 <write_file>:
int write_file(driver_args* args)
{
  8089d3:	f3 0f 1e fa          	endbr64 
  8089d7:	55                   	push   rbp
  8089d8:	48 89 e5             	mov    rbp,rsp
  8089db:	48 83 ec 50          	sub    rsp,0x50
  8089df:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    int len=args->len;
  8089e3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8089e7:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8089ea:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    int pos=args->pos;
  8089ed:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8089f1:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8089f4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  8089f7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8089fb:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8089fe:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    char* src=args->src_addr;
  808a02:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808a06:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808a09:	48 98                	cdqe   
  808a0b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    pos/=superblock.bytesPerSec;
  808a0f:	0f b7 05 55 fe c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1fe55]        # 42886b <superblock+0xb>
  808a16:	0f b7 f0             	movzx  esi,ax
  808a19:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808a1c:	99                   	cdq    
  808a1d:	f7 fe                	idiv   esi
  808a1f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=len/512+len%512?1:0;
  808a22:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808a25:	8d 90 ff 01 00 00    	lea    edx,[rax+0x1ff]
  808a2b:	85 c0                	test   eax,eax
  808a2d:	0f 48 c2             	cmovs  eax,edx
  808a30:	c1 f8 09             	sar    eax,0x9
  808a33:	89 c1                	mov    ecx,eax
  808a35:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808a38:	99                   	cdq    
  808a39:	c1 ea 17             	shr    edx,0x17
  808a3c:	01 d0                	add    eax,edx
  808a3e:	25 ff 01 00 00       	and    eax,0x1ff
  808a43:	29 d0                	sub    eax,edx
  808a45:	01 c8                	add    eax,ecx
  808a47:	85 c0                	test   eax,eax
  808a49:	0f 95 c0             	setne  al
  808a4c:	0f b6 c0             	movzx  eax,al
  808a4f:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int n=0;
  808a52:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808a59:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  808a5d:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&pos>0;pos--,clu=fat[clu]);
  808a61:	eb 16                	jmp    808a79 <write_file+0xa6>
  808a63:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  808a67:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808a6b:	48 98                	cdqe   
  808a6d:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808a74:	00 
  808a75:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  808a79:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808a7e:	77 06                	ja     808a86 <write_file+0xb3>
  808a80:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808a84:	7f dd                	jg     808a63 <write_file+0x90>
    if(pos>0)return -1;//读取位置超出范围
  808a86:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808a8a:	7e 52                	jle    808ade <write_file+0x10b>
  808a8c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808a91:	eb 59                	jmp    808aec <write_file+0x119>
    while(n<c)
    {
        write_sec(src,clu+clu_sec_balance,1);
  808a93:	0f b7 55 ea          	movzx  edx,WORD PTR [rbp-0x16]
  808a97:	8b 05 c3 15 00 00    	mov    eax,DWORD PTR [rip+0x15c3]        # 80a060 <clu_sec_balance>
  808a9d:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  808aa0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808aa4:	ba 01 00 00 00       	mov    edx,0x1
  808aa9:	89 ce                	mov    esi,ecx
  808aab:	48 89 c7             	mov    rdi,rax
  808aae:	e8 4b e8 ff ff       	call   8072fe <write_sec>
        n++;
  808ab3:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        src+=superblock.bytesPerSec;
  808ab7:	0f b7 05 ad fd c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1fdad]        # 42886b <superblock+0xb>
  808abe:	0f b7 c0             	movzx  eax,ax
  808ac1:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        clu=fat[clu];
  808ac5:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808ac9:	48 98                	cdqe   
  808acb:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808ad2:	00 
  808ad3:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  808ad7:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808adc:	77 0a                	ja     808ae8 <write_file+0x115>
    while(n<c)
  808ade:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808ae1:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  808ae4:	7c ad                	jl     808a93 <write_file+0xc0>
  808ae6:	eb 01                	jmp    808ae9 <write_file+0x116>
        if(clu>=FAT_EOF)break;
  808ae8:	90                   	nop
    }
    return n;
  808ae9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    
  808aec:	c9                   	leave  
  808aed:	c3                   	ret    

0000000000808aee <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  808aee:	f3 0f 1e fa          	endbr64 
  808af2:	55                   	push   rbp
  808af3:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  808af6:	48 8b 05 f3 83 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc283f3]        # 430ef0 <vpage_base>
  808afd:	48 05 a0 00 00 00    	add    rax,0xa0
  808b03:	48 89 05 e6 83 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc283e6],rax        # 430ef0 <vpage_base>
    page_boffset+=SCREEN_W*2;
  808b0a:	8b 05 e8 83 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc283e8]        # 430ef8 <page_boffset>
  808b10:	05 a0 00 00 00       	add    eax,0xa0
  808b15:	89 05 dd 83 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc283dd],eax        # 430ef8 <page_boffset>
    if(vpage_base>=video_end)
  808b1b:	48 8b 15 ce 83 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc283ce]        # 430ef0 <vpage_base>
  808b22:	48 8b 05 bf 83 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc283bf]        # 430ee8 <video_end>
  808b29:	48 39 c2             	cmp    rdx,rax
  808b2c:	72 0e                	jb     808b3c <scrdown+0x4e>
        vpage_base=video_base;
  808b2e:	48 8b 05 ab 83 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc283ab]        # 430ee0 <video_base>
  808b35:	48 89 05 b4 83 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc283b4],rax        # 430ef0 <vpage_base>
    set_origin();
  808b3c:	b8 00 00 00 00       	mov    eax,0x0
  808b41:	e8 6a 00 00 00       	call   808bb0 <set_origin>
}
  808b46:	90                   	nop
  808b47:	5d                   	pop    rbp
  808b48:	c3                   	ret    

0000000000808b49 <scrup>:
void scrup()
{
  808b49:	f3 0f 1e fa          	endbr64 
  808b4d:	55                   	push   rbp
  808b4e:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  808b51:	8b 05 a1 83 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc283a1]        # 430ef8 <page_boffset>
  808b57:	85 c0                	test   eax,eax
  808b59:	75 24                	jne    808b7f <scrup+0x36>
    {
        page_boffset=0;
  808b5b:	c7 05 93 83 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28393],0x0        # 430ef8 <page_boffset>
  808b62:	00 00 00 
        vpage_base=video_base;
  808b65:	48 8b 05 74 83 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc28374]        # 430ee0 <video_base>
  808b6c:	48 89 05 7d 83 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2837d],rax        # 430ef0 <vpage_base>
        set_origin();
  808b73:	b8 00 00 00 00       	mov    eax,0x0
  808b78:	e8 33 00 00 00       	call   808bb0 <set_origin>
        return;
  808b7d:	eb 2f                	jmp    808bae <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  808b7f:	48 8b 05 6a 83 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2836a]        # 430ef0 <vpage_base>
  808b86:	48 2d a0 00 00 00    	sub    rax,0xa0
  808b8c:	48 89 05 5d 83 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2835d],rax        # 430ef0 <vpage_base>
    page_boffset-=SCREEN_W*2;
  808b93:	8b 05 5f 83 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2835f]        # 430ef8 <page_boffset>
  808b99:	2d a0 00 00 00       	sub    eax,0xa0
  808b9e:	89 05 54 83 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28354],eax        # 430ef8 <page_boffset>
    set_origin();
  808ba4:	b8 00 00 00 00       	mov    eax,0x0
  808ba9:	e8 02 00 00 00       	call   808bb0 <set_origin>
}
  808bae:	5d                   	pop    rbp
  808baf:	c3                   	ret    

0000000000808bb0 <set_origin>:
void set_origin(void)
{
  808bb0:	f3 0f 1e fa          	endbr64 
  808bb4:	55                   	push   rbp
  808bb5:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  808bb8:	fa                   	cli    
    outb(port_reg_index,12);
  808bb9:	8b 05 49 83 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28349]        # 430f08 <port_reg_index>
  808bbf:	0f b7 c0             	movzx  eax,ax
  808bc2:	be 0c 00 00 00       	mov    esi,0xc
  808bc7:	89 c7                	mov    edi,eax
  808bc9:	e8 12 be ff ff       	call   8049e0 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  808bce:	8b 05 24 83 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28324]        # 430ef8 <page_boffset>
  808bd4:	c1 e8 09             	shr    eax,0x9
  808bd7:	0f b6 d0             	movzx  edx,al
  808bda:	8b 05 2c 83 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2832c]        # 430f0c <port_reg_v>
  808be0:	0f b7 c0             	movzx  eax,ax
  808be3:	89 d6                	mov    esi,edx
  808be5:	89 c7                	mov    edi,eax
  808be7:	e8 f4 bd ff ff       	call   8049e0 <outb>
    outb(port_reg_index,13);
  808bec:	8b 05 16 83 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28316]        # 430f08 <port_reg_index>
  808bf2:	0f b7 c0             	movzx  eax,ax
  808bf5:	be 0d 00 00 00       	mov    esi,0xd
  808bfa:	89 c7                	mov    edi,eax
  808bfc:	e8 df bd ff ff       	call   8049e0 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  808c01:	8b 05 f1 82 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc282f1]        # 430ef8 <page_boffset>
  808c07:	d1 e8                	shr    eax,1
  808c09:	0f b6 d0             	movzx  edx,al
  808c0c:	8b 05 fa 82 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc282fa]        # 430f0c <port_reg_v>
  808c12:	0f b7 c0             	movzx  eax,ax
  808c15:	89 d6                	mov    esi,edx
  808c17:	89 c7                	mov    edi,eax
  808c19:	e8 c2 bd ff ff       	call   8049e0 <outb>
    asm volatile("sti");
  808c1e:	fb                   	sti    

}
  808c1f:	90                   	nop
  808c20:	5d                   	pop    rbp
  808c21:	c3                   	ret    

0000000000808c22 <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  808c22:	f3 0f 1e fa          	endbr64 
  808c26:	55                   	push   rbp
  808c27:	48 89 e5             	mov    rbp,rsp
  808c2a:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  808c2e:	be 28 20 81 00       	mov    esi,0x812028
  808c33:	bf d4 1e 81 00       	mov    edi,0x811ed4
  808c38:	e8 9a 09 00 00       	call   8095d7 <strcpy>
    strcpy(dev_stdout.name,"stdout");
  808c3d:	be 2d 20 81 00       	mov    esi,0x81202d
  808c42:	bf 94 1f 81 00       	mov    edi,0x811f94
  808c47:	e8 8b 09 00 00       	call   8095d7 <strcpy>
    reg_driver(&drv_tty);
  808c4c:	bf 20 1e 81 00       	mov    edi,0x811e20
  808c51:	e8 78 a0 ff ff       	call   802cce <reg_driver>
    reg_device(&dev_tty);
  808c56:	bf c0 1e 81 00       	mov    edi,0x811ec0
  808c5b:	e8 86 9d ff ff       	call   8029e6 <reg_device>
    reg_device(&dev_stdout);
  808c60:	bf 80 1f 81 00       	mov    edi,0x811f80
  808c65:	e8 7c 9d ff ff       	call   8029e6 <reg_device>
    unsigned char *vp=0x20000;
  808c6a:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  808c71:	00 
    if(*vp==0x7)
  808c72:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c76:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c79:	3c 07                	cmp    al,0x7
  808c7b:	75 36                	jne    808cb3 <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  808c7d:	c7 05 75 82 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28275],0x0        # 430efc <video_mode>
  808c84:	00 00 00 
        video_base=0xb0000;
  808c87:	48 c7 05 4e 82 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2824e],0xb0000        # 430ee0 <video_base>
  808c8e:	00 00 0b 00 
        video_end=0xb8000-1;
  808c92:	48 c7 05 4b 82 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2824b],0xb7fff        # 430ee8 <video_end>
  808c99:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  808c9d:	c7 05 61 82 c2 ff b4 	mov    DWORD PTR [rip+0xffffffffffc28261],0x3b4        # 430f08 <port_reg_index>
  808ca4:	03 00 00 
        port_reg_v=0x3b5;
  808ca7:	c7 05 5b 82 c2 ff b5 	mov    DWORD PTR [rip+0xffffffffffc2825b],0x3b5        # 430f0c <port_reg_v>
  808cae:	03 00 00 
  808cb1:	eb 61                	jmp    808d14 <init_tty+0xf2>
    }else if(*vp<=0x3)
  808cb3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808cb7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808cba:	3c 03                	cmp    al,0x3
  808cbc:	77 36                	ja     808cf4 <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  808cbe:	c7 05 34 82 c2 ff 01 	mov    DWORD PTR [rip+0xffffffffffc28234],0x1        # 430efc <video_mode>
  808cc5:	00 00 00 
        video_base=0xb8000;
  808cc8:	48 c7 05 0d 82 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2820d],0xb8000        # 430ee0 <video_base>
  808ccf:	00 80 0b 00 
        video_end=0xc0000-1;
  808cd3:	48 c7 05 0a 82 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2820a],0xbffff        # 430ee8 <video_end>
  808cda:	ff ff 0b 00 
        port_reg_index=0x3d4;
  808cde:	c7 05 20 82 c2 ff d4 	mov    DWORD PTR [rip+0xffffffffffc28220],0x3d4        # 430f08 <port_reg_index>
  808ce5:	03 00 00 
        port_reg_v=0x3d5;
  808ce8:	c7 05 1a 82 c2 ff d5 	mov    DWORD PTR [rip+0xffffffffffc2821a],0x3d5        # 430f0c <port_reg_v>
  808cef:	03 00 00 
  808cf2:	eb 20                	jmp    808d14 <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  808cf4:	c7 05 fe 81 c2 ff 02 	mov    DWORD PTR [rip+0xffffffffffc281fe],0x2        # 430efc <video_mode>
  808cfb:	00 00 00 
        video_base=0xa0000;
  808cfe:	48 c7 05 d7 81 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc281d7],0xa0000        # 430ee0 <video_base>
  808d05:	00 00 0a 00 
        video_end=0xb0000-1;
  808d09:	48 c7 05 d4 81 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc281d4],0xaffff        # 430ee8 <video_end>
  808d10:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  808d14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d18:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d1b:	3c 01                	cmp    al,0x1
  808d1d:	77 0f                	ja     808d2e <init_tty+0x10c>
  808d1f:	c7 05 db 81 c2 ff 28 	mov    DWORD PTR [rip+0xffffffffffc281db],0x28        # 430f04 <line_chs>
  808d26:	00 00 00 
  808d29:	e9 91 00 00 00       	jmp    808dbf <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  808d2e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d32:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d35:	3c 03                	cmp    al,0x3
  808d37:	76 0b                	jbe    808d44 <init_tty+0x122>
  808d39:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d3d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d40:	3c 07                	cmp    al,0x7
  808d42:	75 0c                	jne    808d50 <init_tty+0x12e>
  808d44:	c7 05 b6 81 c2 ff 50 	mov    DWORD PTR [rip+0xffffffffffc281b6],0x50        # 430f04 <line_chs>
  808d4b:	00 00 00 
  808d4e:	eb 6f                	jmp    808dbf <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  808d50:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d54:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d57:	3c 05                	cmp    al,0x5
  808d59:	76 16                	jbe    808d71 <init_tty+0x14f>
  808d5b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d5f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d62:	3c 09                	cmp    al,0x9
  808d64:	74 0b                	je     808d71 <init_tty+0x14f>
  808d66:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d6a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d6d:	3c 0d                	cmp    al,0xd
  808d6f:	75 0c                	jne    808d7d <init_tty+0x15b>
  808d71:	c7 05 89 81 c2 ff 40 	mov    DWORD PTR [rip+0xffffffffffc28189],0x140        # 430f04 <line_chs>
  808d78:	01 00 00 
  808d7b:	eb 42                	jmp    808dbf <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  808d7d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d81:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d84:	3c 06                	cmp    al,0x6
  808d86:	74 16                	je     808d9e <init_tty+0x17c>
  808d88:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d8c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d8f:	3c 0a                	cmp    al,0xa
  808d91:	74 0b                	je     808d9e <init_tty+0x17c>
  808d93:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d97:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d9a:	3c 0d                	cmp    al,0xd
  808d9c:	76 0c                	jbe    808daa <init_tty+0x188>
  808d9e:	c7 05 5c 81 c2 ff 80 	mov    DWORD PTR [rip+0xffffffffffc2815c],0x280        # 430f04 <line_chs>
  808da5:	02 00 00 
  808da8:	eb 15                	jmp    808dbf <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  808daa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808dae:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808db1:	3c 08                	cmp    al,0x8
  808db3:	75 0a                	jne    808dbf <init_tty+0x19d>
  808db5:	c7 05 45 81 c2 ff a0 	mov    DWORD PTR [rip+0xffffffffffc28145],0xa0        # 430f04 <line_chs>
  808dbc:	00 00 00 
    switch (*vp)
  808dbf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808dc3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808dc6:	0f b6 c0             	movzx  eax,al
  808dc9:	83 f8 14             	cmp    eax,0x14
  808dcc:	77 61                	ja     808e2f <init_tty+0x20d>
  808dce:	89 c0                	mov    eax,eax
  808dd0:	48 8b 04 c5 38 20 81 	mov    rax,QWORD PTR [rax*8+0x812038]
  808dd7:	00 
  808dd8:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  808ddb:	c7 05 2b 81 c2 ff e8 	mov    DWORD PTR [rip+0xffffffffffc2812b],0x3e8        # 430f10 <vpage_size>
  808de2:	03 00 00 
  808de5:	eb 49                	jmp    808e30 <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  808de7:	c7 05 1f 81 c2 ff d0 	mov    DWORD PTR [rip+0xffffffffffc2811f],0x7d0        # 430f10 <vpage_size>
  808dee:	07 00 00 
  808df1:	eb 3d                	jmp    808e30 <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  808df3:	c7 05 13 81 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28113],0xfa00        # 430f10 <vpage_size>
  808dfa:	fa 00 00 
  808dfd:	eb 31                	jmp    808e30 <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  808dff:	c7 05 07 81 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28107],0x1f400        # 430f10 <vpage_size>
  808e06:	f4 01 00 
  808e09:	eb 25                	jmp    808e30 <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  808e0b:	c7 05 fb 80 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc280fb],0x7d00        # 430f10 <vpage_size>
  808e12:	7d 00 00 
  808e15:	eb 19                	jmp    808e30 <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  808e17:	c7 05 ef 80 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc280ef],0x36b00        # 430f10 <vpage_size>
  808e1e:	6b 03 00 
  808e21:	eb 0d                	jmp    808e30 <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  808e23:	c7 05 e3 80 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc280e3],0x4b000        # 430f10 <vpage_size>
  808e2a:	b0 04 00 
  808e2d:	eb 01                	jmp    808e30 <init_tty+0x20e>
    default:
        break;
  808e2f:	90                   	nop
    }
    m_ptr=video_base;
  808e30:	48 8b 05 a9 80 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc280a9]        # 430ee0 <video_base>
  808e37:	48 89 05 2a 12 00 00 	mov    QWORD PTR [rip+0x122a],rax        # 80a068 <m_ptr>
    page_boffset=0;
  808e3e:	c7 05 b0 80 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc280b0],0x0        # 430ef8 <page_boffset>
  808e45:	00 00 00 
    vpage_base=video_base;
  808e48:	48 8b 05 91 80 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc28091]        # 430ee0 <video_base>
  808e4f:	48 89 05 9a 80 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2809a],rax        # 430ef0 <vpage_base>
    vp++;
  808e56:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  808e5b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e5f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e62:	0f b6 c0             	movzx  eax,al
  808e65:	89 05 95 80 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28095],eax        # 430f00 <vpage>
    vp++;
  808e6b:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  808e70:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e74:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808e78:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808e7c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e7f:	0f b6 c0             	movzx  eax,al
  808e82:	89 05 94 80 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28094],eax        # 430f1c <stline>
    endline=*vp++;
  808e88:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e8c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808e90:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808e94:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e97:	0f b6 c0             	movzx  eax,al
  808e9a:	89 05 80 80 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28080],eax        # 430f20 <endline>
    videoy=*vp++;
  808ea0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ea4:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808ea8:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808eac:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808eaf:	0f b6 c0             	movzx  eax,al
  808eb2:	89 05 60 80 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28060],eax        # 430f18 <videoy>
    videox=*vp;
  808eb8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ebc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808ebf:	0f b6 c0             	movzx  eax,al
  808ec2:	89 05 4c 80 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2804c],eax        # 430f14 <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  808ec8:	90                   	nop
  808ec9:	c9                   	leave  
  808eca:	c3                   	ret    

0000000000808ecb <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  808ecb:	f3 0f 1e fa          	endbr64 
  808ecf:	55                   	push   rbp
  808ed0:	48 89 e5             	mov    rbp,rsp
  808ed3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  808ed7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808edb:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808ede:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  808ee1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808ee4:	05 00 c0 05 00       	add    eax,0x5c000
  808ee9:	01 c0                	add    eax,eax
  808eeb:	48 98                	cdqe   
  808eed:	48 89 05 74 11 00 00 	mov    QWORD PTR [rip+0x1174],rax        # 80a068 <m_ptr>
}
  808ef4:	90                   	nop
  808ef5:	5d                   	pop    rbp
  808ef6:	c3                   	ret    

0000000000808ef7 <tell_monitor>:
int tell_monitor()
{
  808ef7:	f3 0f 1e fa          	endbr64 
  808efb:	55                   	push   rbp
  808efc:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  808eff:	48 8b 05 62 11 00 00 	mov    rax,QWORD PTR [rip+0x1162]        # 80a068 <m_ptr>
  808f06:	48 8b 15 d3 7f c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27fd3]        # 430ee0 <video_base>
  808f0d:	48 29 d0             	sub    rax,rdx
  808f10:	48 89 c2             	mov    rdx,rax
  808f13:	48 c1 ea 3f          	shr    rdx,0x3f
  808f17:	48 01 d0             	add    rax,rdx
  808f1a:	48 d1 f8             	sar    rax,1
}
  808f1d:	5d                   	pop    rbp
  808f1e:	c3                   	ret    

0000000000808f1f <del_ch>:
void del_ch()
{
  808f1f:	f3 0f 1e fa          	endbr64 
  808f23:	55                   	push   rbp
  808f24:	48 89 e5             	mov    rbp,rsp
  808f27:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  808f2e:	48 8b 05 33 11 00 00 	mov    rax,QWORD PTR [rip+0x1133]        # 80a068 <m_ptr>
  808f35:	48 83 e8 02          	sub    rax,0x2
  808f39:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  808f3d:	b8 00 00 00 00       	mov    eax,0x0
  808f42:	e8 b0 ff ff ff       	call   808ef7 <tell_monitor>
  808f47:	89 c2                	mov    edx,eax
  808f49:	48 63 c2             	movsxd rax,edx
  808f4c:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  808f53:	48 c1 e8 20          	shr    rax,0x20
  808f57:	c1 f8 05             	sar    eax,0x5
  808f5a:	89 d1                	mov    ecx,edx
  808f5c:	c1 f9 1f             	sar    ecx,0x1f
  808f5f:	29 c8                	sub    eax,ecx
  808f61:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  808f64:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  808f67:	89 c8                	mov    eax,ecx
  808f69:	c1 e0 02             	shl    eax,0x2
  808f6c:	01 c8                	add    eax,ecx
  808f6e:	c1 e0 04             	shl    eax,0x4
  808f71:	29 c2                	sub    edx,eax
  808f73:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  808f76:	eb 17                	jmp    808f8f <del_ch+0x70>
    {
        *p=*(p+2);
  808f78:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f7c:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  808f80:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f84:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  808f86:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  808f8b:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808f8f:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  808f93:	7e e3                	jle    808f78 <del_ch+0x59>
    }
    driver_args args= {
  808f95:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  808f9c:	b8 00 00 00 00       	mov    eax,0x0
  808fa1:	b9 18 00 00 00       	mov    ecx,0x18
  808fa6:	48 89 d7             	mov    rdi,rdx
  808fa9:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  808fac:	b8 00 00 00 00       	mov    eax,0x0
  808fb1:	e8 41 ff ff ff       	call   808ef7 <tell_monitor>
  808fb6:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  808fb9:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  808fbf:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  808fc6:	48 89 c7             	mov    rdi,rax
  808fc9:	e8 fd fe ff ff       	call   808ecb <seek_tty>
    set_cur();
  808fce:	b8 00 00 00 00       	mov    eax,0x0
  808fd3:	e8 03 00 00 00       	call   808fdb <set_cur>
}
  808fd8:	90                   	nop
  808fd9:	c9                   	leave  
  808fda:	c3                   	ret    

0000000000808fdb <set_cur>:
void set_cur()
{
  808fdb:	f3 0f 1e fa          	endbr64 
  808fdf:	55                   	push   rbp
  808fe0:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  808fe3:	fa                   	cli    
    outb(port_reg_index,14);
  808fe4:	8b 05 1e 7f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27f1e]        # 430f08 <port_reg_index>
  808fea:	0f b7 c0             	movzx  eax,ax
  808fed:	be 0e 00 00 00       	mov    esi,0xe
  808ff2:	89 c7                	mov    edi,eax
  808ff4:	e8 e7 b9 ff ff       	call   8049e0 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  808ff9:	48 8b 05 68 10 00 00 	mov    rax,QWORD PTR [rip+0x1068]        # 80a068 <m_ptr>
  809000:	48 8b 15 d9 7e c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27ed9]        # 430ee0 <video_base>
  809007:	48 29 d0             	sub    rax,rdx
  80900a:	48 c1 f8 09          	sar    rax,0x9
  80900e:	0f b6 d0             	movzx  edx,al
  809011:	8b 05 f5 7e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27ef5]        # 430f0c <port_reg_v>
  809017:	0f b7 c0             	movzx  eax,ax
  80901a:	89 d6                	mov    esi,edx
  80901c:	89 c7                	mov    edi,eax
  80901e:	e8 bd b9 ff ff       	call   8049e0 <outb>
    outb(port_reg_index,15);
  809023:	8b 05 df 7e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27edf]        # 430f08 <port_reg_index>
  809029:	0f b7 c0             	movzx  eax,ax
  80902c:	be 0f 00 00 00       	mov    esi,0xf
  809031:	89 c7                	mov    edi,eax
  809033:	e8 a8 b9 ff ff       	call   8049e0 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  809038:	48 8b 05 29 10 00 00 	mov    rax,QWORD PTR [rip+0x1029]        # 80a068 <m_ptr>
  80903f:	48 8b 15 9a 7e c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27e9a]        # 430ee0 <video_base>
  809046:	48 29 d0             	sub    rax,rdx
  809049:	48 d1 f8             	sar    rax,1
  80904c:	0f b6 d0             	movzx  edx,al
  80904f:	8b 05 b7 7e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27eb7]        # 430f0c <port_reg_v>
  809055:	0f b7 c0             	movzx  eax,ax
  809058:	89 d6                	mov    esi,edx
  80905a:	89 c7                	mov    edi,eax
  80905c:	e8 7f b9 ff ff       	call   8049e0 <outb>
    asm volatile("sti");
  809061:	fb                   	sti    
}
  809062:	90                   	nop
  809063:	5d                   	pop    rbp
  809064:	c3                   	ret    

0000000000809065 <read_tty>:

int read_tty(driver_args *args)
{
  809065:	f3 0f 1e fa          	endbr64 
  809069:	55                   	push   rbp
  80906a:	48 89 e5             	mov    rbp,rsp
  80906d:	48 83 ec 20          	sub    rsp,0x20
  809071:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  809075:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809079:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80907c:	48 98                	cdqe   
  80907e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  809082:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809086:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  809089:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80908c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809093:	eb 4a                	jmp    8090df <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  809095:	48 8b 15 cc 0f 00 00 	mov    rdx,QWORD PTR [rip+0xfcc]        # 80a068 <m_ptr>
  80909c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8090a0:	48 8d 48 01          	lea    rcx,[rax+0x1]
  8090a4:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  8090a8:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  8090ab:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  8090ad:	48 8b 05 b4 0f 00 00 	mov    rax,QWORD PTR [rip+0xfb4]        # 80a068 <m_ptr>
  8090b4:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  8090ba:	75 0d                	jne    8090c9 <read_tty+0x64>
  8090bc:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8090c0:	7e 07                	jle    8090c9 <read_tty+0x64>
        {
            return 1;//读到尾了
  8090c2:	b8 01 00 00 00       	mov    eax,0x1
  8090c7:	eb 2d                	jmp    8090f6 <read_tty+0x91>
        }
        m_ptr+=2;
  8090c9:	48 8b 05 98 0f 00 00 	mov    rax,QWORD PTR [rip+0xf98]        # 80a068 <m_ptr>
  8090d0:	48 83 c0 02          	add    rax,0x2
  8090d4:	48 89 05 8d 0f 00 00 	mov    QWORD PTR [rip+0xf8d],rax        # 80a068 <m_ptr>
    for(int i=0;i<len;i++)
  8090db:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8090df:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8090e2:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  8090e5:	7c ae                	jl     809095 <read_tty+0x30>
    }
    set_cur();
  8090e7:	b8 00 00 00 00       	mov    eax,0x0
  8090ec:	e8 ea fe ff ff       	call   808fdb <set_cur>
    return 0;
  8090f1:	b8 00 00 00 00       	mov    eax,0x0
}
  8090f6:	c9                   	leave  
  8090f7:	c3                   	ret    

00000000008090f8 <write_tty>:
int write_tty(driver_args *args)
{
  8090f8:	f3 0f 1e fa          	endbr64 
  8090fc:	55                   	push   rbp
  8090fd:	48 89 e5             	mov    rbp,rsp
  809100:	48 83 ec 30          	sub    rsp,0x30
  809104:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  809108:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80910c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80910f:	48 98                	cdqe   
  809111:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  809115:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809119:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80911c:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80911f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809126:	e9 0b 01 00 00       	jmp    809236 <write_tty+0x13e>
    {
        if(*src=='\n')
  80912b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80912f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809132:	3c 0a                	cmp    al,0xa
  809134:	75 50                	jne    809186 <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  809136:	48 8b 05 2b 0f 00 00 	mov    rax,QWORD PTR [rip+0xf2b]        # 80a068 <m_ptr>
  80913d:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  809143:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  809146:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809149:	89 c2                	mov    edx,eax
  80914b:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  809150:	48 0f af c2          	imul   rax,rdx
  809154:	48 c1 e8 20          	shr    rax,0x20
  809158:	c1 e8 07             	shr    eax,0x7
  80915b:	8d 50 01             	lea    edx,[rax+0x1]
  80915e:	89 d0                	mov    eax,edx
  809160:	c1 e0 02             	shl    eax,0x2
  809163:	01 d0                	add    eax,edx
  809165:	c1 e0 05             	shl    eax,0x5
  809168:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  80916b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80916e:	05 00 80 0b 00       	add    eax,0xb8000
  809173:	89 c0                	mov    eax,eax
  809175:	48 89 05 ec 0e 00 00 	mov    QWORD PTR [rip+0xeec],rax        # 80a068 <m_ptr>
            src++;
  80917c:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  809181:	e9 ac 00 00 00       	jmp    809232 <write_tty+0x13a>
        }else if(*src=='\0')
  809186:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80918a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80918d:	84 c0                	test   al,al
  80918f:	0f 84 af 00 00 00    	je     809244 <write_tty+0x14c>
            break;
        if(*src=='\b')
  809195:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809199:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80919c:	3c 08                	cmp    al,0x8
  80919e:	75 1e                	jne    8091be <write_tty+0xc6>
        {
            m_ptr-=2;
  8091a0:	48 8b 05 c1 0e 00 00 	mov    rax,QWORD PTR [rip+0xec1]        # 80a068 <m_ptr>
  8091a7:	48 83 e8 02          	sub    rax,0x2
  8091ab:	48 89 05 b6 0e 00 00 	mov    QWORD PTR [rip+0xeb6],rax        # 80a068 <m_ptr>
            *m_ptr=0;
  8091b2:	48 8b 05 af 0e 00 00 	mov    rax,QWORD PTR [rip+0xeaf]        # 80a068 <m_ptr>
  8091b9:	c6 00 00             	mov    BYTE PTR [rax],0x0
  8091bc:	eb 3e                	jmp    8091fc <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  8091be:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8091c2:	48 8d 42 01          	lea    rax,[rdx+0x1]
  8091c6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8091ca:	48 8b 05 97 0e 00 00 	mov    rax,QWORD PTR [rip+0xe97]        # 80a068 <m_ptr>
  8091d1:	48 8d 48 01          	lea    rcx,[rax+0x1]
  8091d5:	48 89 0d 8c 0e 00 00 	mov    QWORD PTR [rip+0xe8c],rcx        # 80a068 <m_ptr>
  8091dc:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  8091df:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  8091e1:	48 8b 05 80 0e 00 00 	mov    rax,QWORD PTR [rip+0xe80]        # 80a068 <m_ptr>
  8091e8:	48 8d 50 01          	lea    rdx,[rax+0x1]
  8091ec:	48 89 15 75 0e 00 00 	mov    QWORD PTR [rip+0xe75],rdx        # 80a068 <m_ptr>
  8091f3:	0f b6 15 76 0e 00 00 	movzx  edx,BYTE PTR [rip+0xe76]        # 80a070 <m_color>
  8091fa:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  8091fc:	48 8b 05 65 0e 00 00 	mov    rax,QWORD PTR [rip+0xe65]        # 80a068 <m_ptr>
  809203:	48 8b 0d e6 7c c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc27ce6]        # 430ef0 <vpage_base>
  80920a:	48 29 c8             	sub    rax,rcx
  80920d:	48 89 c2             	mov    rdx,rax
  809210:	8b 05 fa 7c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27cfa]        # 430f10 <vpage_size>
  809216:	8b 0d e8 7c c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc27ce8]        # 430f04 <line_chs>
  80921c:	29 c8                	sub    eax,ecx
  80921e:	01 c0                	add    eax,eax
  809220:	48 98                	cdqe   
  809222:	48 39 c2             	cmp    rdx,rax
  809225:	7c 0b                	jl     809232 <write_tty+0x13a>
  809227:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80922b:	7e 05                	jle    809232 <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  80922d:	e8 bc f8 ff ff       	call   808aee <scrdown>
    for(int i=0;i<len;i++)
  809232:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  809236:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809239:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80923c:	0f 8c e9 fe ff ff    	jl     80912b <write_tty+0x33>
  809242:	eb 01                	jmp    809245 <write_tty+0x14d>
            break;
  809244:	90                   	nop
        }
    }
    set_cur();
  809245:	b8 00 00 00 00       	mov    eax,0x0
  80924a:	e8 8c fd ff ff       	call   808fdb <set_cur>
    return 0;
  80924f:	b8 00 00 00 00       	mov    eax,0x0
}
  809254:	c9                   	leave  
  809255:	c3                   	ret    

0000000000809256 <cls>:

void cls(driver_args *args)
{
  809256:	f3 0f 1e fa          	endbr64 
  80925a:	55                   	push   rbp
  80925b:	48 89 e5             	mov    rbp,rsp
  80925e:	48 83 ec 20          	sub    rsp,0x20
  809262:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  809266:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80926d:	eb 16                	jmp    809285 <cls+0x2f>
    {
        vpage_base[i]=0;
  80926f:	48 8b 15 7a 7c c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27c7a]        # 430ef0 <vpage_base>
  809276:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809279:	48 98                	cdqe   
  80927b:	48 01 d0             	add    rax,rdx
  80927e:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  809281:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  809285:	8b 05 85 7c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27c85]        # 430f10 <vpage_size>
  80928b:	01 c0                	add    eax,eax
  80928d:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  809290:	7c dd                	jl     80926f <cls+0x19>
    }
    m_ptr=vpage_base;
  809292:	48 8b 05 57 7c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc27c57]        # 430ef0 <vpage_base>
  809299:	48 89 05 c8 0d 00 00 	mov    QWORD PTR [rip+0xdc8],rax        # 80a068 <m_ptr>
    set_cur();
  8092a0:	b8 00 00 00 00       	mov    eax,0x0
  8092a5:	e8 31 fd ff ff       	call   808fdb <set_cur>
}
  8092aa:	90                   	nop
  8092ab:	c9                   	leave  
  8092ac:	c3                   	ret    

00000000008092ad <set_color>:

void set_color(char color)
{
  8092ad:	f3 0f 1e fa          	endbr64 
  8092b1:	55                   	push   rbp
  8092b2:	48 89 e5             	mov    rbp,rsp
  8092b5:	89 f8                	mov    eax,edi
  8092b7:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  8092ba:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8092be:	88 05 ac 0d 00 00    	mov    BYTE PTR [rip+0xdac],al        # 80a070 <m_color>
}
  8092c4:	90                   	nop
  8092c5:	5d                   	pop    rbp
  8092c6:	c3                   	ret    

00000000008092c7 <tty_do_req>:

int tty_do_req(driver_args *args)
{
  8092c7:	f3 0f 1e fa          	endbr64 
  8092cb:	55                   	push   rbp
  8092cc:	48 89 e5             	mov    rbp,rsp
  8092cf:	48 83 ec 10          	sub    rsp,0x10
  8092d3:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  8092d7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092db:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  8092e1:	83 f8 0d             	cmp    eax,0xd
  8092e4:	74 45                	je     80932b <tty_do_req+0x64>
  8092e6:	83 f8 0d             	cmp    eax,0xd
  8092e9:	7f 53                	jg     80933e <tty_do_req+0x77>
  8092eb:	83 f8 0c             	cmp    eax,0xc
  8092ee:	74 2d                	je     80931d <tty_do_req+0x56>
  8092f0:	83 f8 0c             	cmp    eax,0xc
  8092f3:	7f 49                	jg     80933e <tty_do_req+0x77>
  8092f5:	83 f8 02             	cmp    eax,0x2
  8092f8:	74 07                	je     809301 <tty_do_req+0x3a>
  8092fa:	83 f8 03             	cmp    eax,0x3
  8092fd:	74 10                	je     80930f <tty_do_req+0x48>
  8092ff:	eb 3d                	jmp    80933e <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  809301:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809305:	48 89 c7             	mov    rdi,rax
  809308:	e8 58 fd ff ff       	call   809065 <read_tty>
        break;
  80930d:	eb 36                	jmp    809345 <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  80930f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809313:	48 89 c7             	mov    rdi,rax
  809316:	e8 dd fd ff ff       	call   8090f8 <write_tty>
        break;
  80931b:	eb 28                	jmp    809345 <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  80931d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809321:	48 89 c7             	mov    rdi,rax
  809324:	e8 a2 fb ff ff       	call   808ecb <seek_tty>
        break;
  809329:	eb 1a                	jmp    809345 <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  80932b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80932f:	48 89 c7             	mov    rdi,rax
  809332:	b8 00 00 00 00       	mov    eax,0x0
  809337:	e8 bb fb ff ff       	call   808ef7 <tell_monitor>
        break;
  80933c:	eb 07                	jmp    809345 <tty_do_req+0x7e>
    default:return -1;
  80933e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809343:	eb 05                	jmp    80934a <tty_do_req+0x83>
    }
    return 0;
  809345:	b8 00 00 00 00       	mov    eax,0x0
}
  80934a:	c9                   	leave  
  80934b:	c3                   	ret    

000000000080934c <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  80934c:	f3 0f 1e fa          	endbr64 
  809350:	55                   	push   rbp
  809351:	48 89 e5             	mov    rbp,rsp
  809354:	48 83 ec 10          	sub    rsp,0x10
  809358:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  80935b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80935e:	83 c0 01             	add    eax,0x1
  809361:	0f b7 c0             	movzx  eax,ax
  809364:	be 00 00 00 00       	mov    esi,0x0
  809369:	89 c7                	mov    edi,eax
  80936b:	e8 70 b6 ff ff       	call   8049e0 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  809370:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809373:	83 c0 03             	add    eax,0x3
  809376:	0f b7 c0             	movzx  eax,ax
  809379:	be 80 00 00 00       	mov    esi,0x80
  80937e:	89 c7                	mov    edi,eax
  809380:	e8 5b b6 ff ff       	call   8049e0 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  809385:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809388:	0f b7 c0             	movzx  eax,ax
  80938b:	be 03 00 00 00       	mov    esi,0x3
  809390:	89 c7                	mov    edi,eax
  809392:	e8 49 b6 ff ff       	call   8049e0 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  809397:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80939a:	83 c0 01             	add    eax,0x1
  80939d:	0f b7 c0             	movzx  eax,ax
  8093a0:	be 00 00 00 00       	mov    esi,0x0
  8093a5:	89 c7                	mov    edi,eax
  8093a7:	e8 34 b6 ff ff       	call   8049e0 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  8093ac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8093af:	83 c0 03             	add    eax,0x3
  8093b2:	0f b7 c0             	movzx  eax,ax
  8093b5:	be 03 00 00 00       	mov    esi,0x3
  8093ba:	89 c7                	mov    edi,eax
  8093bc:	e8 1f b6 ff ff       	call   8049e0 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  8093c1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8093c4:	83 c0 02             	add    eax,0x2
  8093c7:	0f b7 c0             	movzx  eax,ax
  8093ca:	be c7 00 00 00       	mov    esi,0xc7
  8093cf:	89 c7                	mov    edi,eax
  8093d1:	e8 0a b6 ff ff       	call   8049e0 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  8093d6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8093d9:	83 c0 04             	add    eax,0x4
  8093dc:	0f b7 c0             	movzx  eax,ax
  8093df:	be 0b 00 00 00       	mov    esi,0xb
  8093e4:	89 c7                	mov    edi,eax
  8093e6:	e8 f5 b5 ff ff       	call   8049e0 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  8093eb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8093ee:	83 c0 04             	add    eax,0x4
  8093f1:	0f b7 c0             	movzx  eax,ax
  8093f4:	be 1e 00 00 00       	mov    esi,0x1e
  8093f9:	89 c7                	mov    edi,eax
  8093fb:	e8 e0 b5 ff ff       	call   8049e0 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  809400:	b8 61 00 00 00       	mov    eax,0x61
  809405:	0f b6 d0             	movzx  edx,al
  809408:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80940b:	0f b7 c0             	movzx  eax,ax
  80940e:	89 d6                	mov    esi,edx
  809410:	89 c7                	mov    edi,eax
  809412:	e8 c9 b5 ff ff       	call   8049e0 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  809417:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80941a:	0f b6 c0             	movzx  eax,al
  80941d:	89 c7                	mov    edi,eax
  80941f:	e8 dc b5 ff ff       	call   804a00 <inb>
  809424:	0f b6 d0             	movzx  edx,al
  809427:	b8 61 00 00 00       	mov    eax,0x61
  80942c:	0f be c0             	movsx  eax,al
  80942f:	39 c2                	cmp    edx,eax
  809431:	75 17                	jne    80944a <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  809433:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809436:	83 c0 04             	add    eax,0x4
  809439:	0f b7 c0             	movzx  eax,ax
  80943c:	be 0f 00 00 00       	mov    esi,0xf
  809441:	89 c7                	mov    edi,eax
  809443:	e8 98 b5 ff ff       	call   8049e0 <outb>
  809448:	eb 01                	jmp    80944b <init_com+0xff>
        return;
  80944a:	90                   	nop
}
  80944b:	c9                   	leave  
  80944c:	c3                   	ret    

000000000080944d <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80944d:	f3 0f 1e fa          	endbr64 
  809451:	55                   	push   rbp
  809452:	48 89 e5             	mov    rbp,rsp
  809455:	48 83 ec 20          	sub    rsp,0x20
  809459:	89 f8                	mov    eax,edi
  80945b:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80945e:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  809462:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809465:	83 c0 05             	add    eax,0x5
  809468:	0f b6 c0             	movzx  eax,al
  80946b:	89 c7                	mov    edi,eax
  80946d:	e8 8e b5 ff ff       	call   804a00 <inb>
  809472:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  809475:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  809479:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80947d:	74 e3                	je     809462 <com_putchar+0x15>
    outb(com_base, ch);
  80947f:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  809483:	0f b6 d0             	movzx  edx,al
  809486:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809489:	0f b7 c0             	movzx  eax,ax
  80948c:	89 d6                	mov    esi,edx
  80948e:	89 c7                	mov    edi,eax
  809490:	e8 4b b5 ff ff       	call   8049e0 <outb>
}
  809495:	90                   	nop
  809496:	c9                   	leave  
  809497:	c3                   	ret    

0000000000809498 <com_puts>:

void com_puts(char* s,int com_port){
  809498:	f3 0f 1e fa          	endbr64 
  80949c:	55                   	push   rbp
  80949d:	48 89 e5             	mov    rbp,rsp
  8094a0:	48 83 ec 10          	sub    rsp,0x10
  8094a4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8094a8:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  8094ab:	eb 1d                	jmp    8094ca <com_puts+0x32>
        com_putchar(*s,com_port);
  8094ad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094b1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8094b4:	66 98                	cbw    
  8094b6:	0f b7 c0             	movzx  eax,ax
  8094b9:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8094bc:	89 d6                	mov    esi,edx
  8094be:	89 c7                	mov    edi,eax
  8094c0:	e8 88 ff ff ff       	call   80944d <com_putchar>
    for(;*s;s++){
  8094c5:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  8094ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094ce:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8094d1:	84 c0                	test   al,al
  8094d3:	75 d8                	jne    8094ad <com_puts+0x15>
    }
  8094d5:	90                   	nop
  8094d6:	90                   	nop
  8094d7:	c9                   	leave  
  8094d8:	c3                   	ret    

00000000008094d9 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  8094d9:	f3 0f 1e fa          	endbr64 
  8094dd:	55                   	push   rbp
  8094de:	48 89 e5             	mov    rbp,rsp
  8094e1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8094e5:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8094e9:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  8094ec:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8094f0:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  8094f3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8094fa:	eb 1b                	jmp    809517 <memcpy+0x3e>
        *(dest)=*(src);
  8094fc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809500:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809503:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809507:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  809509:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80950e:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  809513:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809517:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80951a:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80951d:	77 dd                	ja     8094fc <memcpy+0x23>
    }
}
  80951f:	90                   	nop
  809520:	90                   	nop
  809521:	5d                   	pop    rbp
  809522:	c3                   	ret    

0000000000809523 <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  809523:	f3 0f 1e fa          	endbr64 
  809527:	55                   	push   rbp
  809528:	48 89 e5             	mov    rbp,rsp
  80952b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80952f:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809533:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  809536:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80953d:	eb 3a                	jmp    809579 <memcmp+0x56>
    {
        if(*a!=*b)
  80953f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809543:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809546:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80954a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80954d:	38 c2                	cmp    dl,al
  80954f:	74 1a                	je     80956b <memcmp+0x48>
            return *a-*b;
  809551:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809555:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809558:	0f b6 d0             	movzx  edx,al
  80955b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80955f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809562:	0f b6 c8             	movzx  ecx,al
  809565:	89 d0                	mov    eax,edx
  809567:	29 c8                	sub    eax,ecx
  809569:	eb 1b                	jmp    809586 <memcmp+0x63>
        a++;
  80956b:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  809570:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  809575:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809579:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80957c:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80957f:	7c be                	jl     80953f <memcmp+0x1c>
    }
    return 0;
  809581:	b8 00 00 00 00       	mov    eax,0x0
}
  809586:	5d                   	pop    rbp
  809587:	c3                   	ret    

0000000000809588 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  809588:	f3 0f 1e fa          	endbr64 
  80958c:	55                   	push   rbp
  80958d:	48 89 e5             	mov    rbp,rsp
  809590:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809594:	89 f0                	mov    eax,esi
  809596:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  809599:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  80959c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8095a3:	eb 16                	jmp    8095bb <memset+0x33>
        *(buf++)=value;
  8095a5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095a9:	48 8d 50 01          	lea    rdx,[rax+0x1]
  8095ad:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8095b1:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  8095b5:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  8095b7:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8095bb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8095be:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  8095c1:	72 e2                	jb     8095a5 <memset+0x1d>
    }
}
  8095c3:	90                   	nop
  8095c4:	90                   	nop
  8095c5:	5d                   	pop    rbp
  8095c6:	c3                   	ret    

00000000008095c7 <get_mem_size>:

u32 get_mem_size(){
  8095c7:	f3 0f 1e fa          	endbr64 
  8095cb:	55                   	push   rbp
  8095cc:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  8095cf:	8b 05 4f 79 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2794f]        # 430f24 <mem_end>
}
  8095d5:	5d                   	pop    rbp
  8095d6:	c3                   	ret    

00000000008095d7 <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  8095d7:	f3 0f 1e fa          	endbr64 
  8095db:	55                   	push   rbp
  8095dc:	48 89 e5             	mov    rbp,rsp
  8095df:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8095e3:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  8095e7:	eb 1d                	jmp    809606 <strcpy+0x2f>
        *(dest++)=*(buf++);
  8095e9:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8095ed:	48 8d 42 01          	lea    rax,[rdx+0x1]
  8095f1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8095f5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8095f9:	48 8d 48 01          	lea    rcx,[rax+0x1]
  8095fd:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  809601:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  809604:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  809606:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80960a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80960d:	84 c0                	test   al,al
  80960f:	75 d8                	jne    8095e9 <strcpy+0x12>
    }
    *dest='\0';
  809611:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809615:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  809618:	90                   	nop
  809619:	5d                   	pop    rbp
  80961a:	c3                   	ret    

000000000080961b <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80961b:	f3 0f 1e fa          	endbr64 
  80961f:	55                   	push   rbp
  809620:	48 89 e5             	mov    rbp,rsp
  809623:	48 83 ec 30          	sub    rsp,0x30
  809627:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80962b:	89 f0                	mov    eax,esi
  80962d:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  809630:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  809635:	0f 84 9c 00 00 00    	je     8096d7 <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80963b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80963f:	48 89 c6             	mov    rsi,rax
  809642:	bf 40 0f 43 00       	mov    edi,0x430f40
  809647:	e8 8b ff ff ff       	call   8095d7 <strcpy>
        char* ptr=strtokkee;
  80964c:	48 c7 45 e8 40 0f 43 	mov    QWORD PTR [rbp-0x18],0x430f40
  809653:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  809654:	c7 05 e2 7a c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc27ae2],0x0        # 431140 <tokptr>
  80965b:	00 00 00 
  80965e:	eb 1c                	jmp    80967c <strtok+0x61>
  809660:	8b 05 da 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27ada]        # 431140 <tokptr>
  809666:	83 c0 01             	add    eax,0x1
  809669:	99                   	cdq    
  80966a:	c1 ea 17             	shr    edx,0x17
  80966d:	01 d0                	add    eax,edx
  80966f:	25 ff 01 00 00       	and    eax,0x1ff
  809674:	29 d0                	sub    eax,edx
  809676:	89 05 c4 7a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27ac4],eax        # 431140 <tokptr>
  80967c:	8b 05 be 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27abe]        # 431140 <tokptr>
  809682:	48 98                	cdqe   
  809684:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  80968b:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80968e:	74 13                	je     8096a3 <strtok+0x88>
  809690:	8b 05 aa 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27aaa]        # 431140 <tokptr>
  809696:	48 98                	cdqe   
  809698:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  80969f:	84 c0                	test   al,al
  8096a1:	75 bd                	jne    809660 <strtok+0x45>
        strtokkee[tokptr]='\0';
  8096a3:	8b 05 97 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27a97]        # 431140 <tokptr>
  8096a9:	48 98                	cdqe   
  8096ab:	c6 80 40 0f 43 00 00 	mov    BYTE PTR [rax+0x430f40],0x0
        tokptr=(tokptr+1)%512;
  8096b2:	8b 05 88 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27a88]        # 431140 <tokptr>
  8096b8:	83 c0 01             	add    eax,0x1
  8096bb:	99                   	cdq    
  8096bc:	c1 ea 17             	shr    edx,0x17
  8096bf:	01 d0                	add    eax,edx
  8096c1:	25 ff 01 00 00       	and    eax,0x1ff
  8096c6:	29 d0                	sub    eax,edx
  8096c8:	89 05 72 7a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27a72],eax        # 431140 <tokptr>
        return ptr;
  8096ce:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8096d2:	e9 9e 00 00 00       	jmp    809775 <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  8096d7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  8096de:	8b 05 5c 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27a5c]        # 431140 <tokptr>
  8096e4:	48 98                	cdqe   
  8096e6:	48 05 40 0f 43 00    	add    rax,0x430f40
  8096ec:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  8096f0:	eb 20                	jmp    809712 <strtok+0xf7>
  8096f2:	8b 05 48 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27a48]        # 431140 <tokptr>
  8096f8:	83 c0 01             	add    eax,0x1
  8096fb:	99                   	cdq    
  8096fc:	c1 ea 17             	shr    edx,0x17
  8096ff:	01 d0                	add    eax,edx
  809701:	25 ff 01 00 00       	and    eax,0x1ff
  809706:	29 d0                	sub    eax,edx
  809708:	89 05 32 7a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27a32],eax        # 431140 <tokptr>
  80970e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809712:	8b 05 28 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27a28]        # 431140 <tokptr>
  809718:	48 98                	cdqe   
  80971a:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  809721:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  809724:	74 13                	je     809739 <strtok+0x11e>
  809726:	8b 05 14 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27a14]        # 431140 <tokptr>
  80972c:	48 98                	cdqe   
  80972e:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  809735:	84 c0                	test   al,al
  809737:	75 b9                	jne    8096f2 <strtok+0xd7>
    strtokkee[tokptr]='\0';
  809739:	8b 05 01 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27a01]        # 431140 <tokptr>
  80973f:	48 98                	cdqe   
  809741:	c6 80 40 0f 43 00 00 	mov    BYTE PTR [rax+0x430f40],0x0
    tokptr=(tokptr+1)%512;
  809748:	8b 05 f2 79 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc279f2]        # 431140 <tokptr>
  80974e:	83 c0 01             	add    eax,0x1
  809751:	99                   	cdq    
  809752:	c1 ea 17             	shr    edx,0x17
  809755:	01 d0                	add    eax,edx
  809757:	25 ff 01 00 00       	and    eax,0x1ff
  80975c:	29 d0                	sub    eax,edx
  80975e:	89 05 dc 79 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc279dc],eax        # 431140 <tokptr>
    if(c)
  809764:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809768:	74 06                	je     809770 <strtok+0x155>
        return ptr;
  80976a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80976e:	eb 05                	jmp    809775 <strtok+0x15a>
    else
        return (void*)0;
  809770:	b8 00 00 00 00       	mov    eax,0x0
}
  809775:	c9                   	leave  
  809776:	c3                   	ret    

0000000000809777 <strcmp>:
int strcmp(char *s1,char *s2)
{
  809777:	f3 0f 1e fa          	endbr64 
  80977b:	55                   	push   rbp
  80977c:	48 89 e5             	mov    rbp,rsp
  80977f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809783:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  809787:	eb 3c                	jmp    8097c5 <strcmp+0x4e>
		if(*s1>*s2)
  809789:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80978d:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809790:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809794:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809797:	38 c2                	cmp    dl,al
  809799:	7e 07                	jle    8097a2 <strcmp+0x2b>
			return 1;
  80979b:	b8 01 00 00 00       	mov    eax,0x1
  8097a0:	eb 52                	jmp    8097f4 <strcmp+0x7d>
		else if(*s1<*s2)
  8097a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097a6:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8097a9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8097ad:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8097b0:	38 c2                	cmp    dl,al
  8097b2:	7d 07                	jge    8097bb <strcmp+0x44>
			return -1;
  8097b4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8097b9:	eb 39                	jmp    8097f4 <strcmp+0x7d>
		s1++;
  8097bb:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  8097c0:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  8097c5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097c9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8097cc:	84 c0                	test   al,al
  8097ce:	74 0b                	je     8097db <strcmp+0x64>
  8097d0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8097d4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8097d7:	84 c0                	test   al,al
  8097d9:	75 ae                	jne    809789 <strcmp+0x12>
	}
	if(*s1==*s2)
  8097db:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097df:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8097e2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8097e6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8097e9:	38 c2                	cmp    dl,al
  8097eb:	75 07                	jne    8097f4 <strcmp+0x7d>
		return 0;
  8097ed:	b8 00 00 00 00       	mov    eax,0x0
  8097f2:	eb 00                	jmp    8097f4 <strcmp+0x7d>
}
  8097f4:	5d                   	pop    rbp
  8097f5:	c3                   	ret    

00000000008097f6 <strlen>:

int strlen(char *str)
{
  8097f6:	f3 0f 1e fa          	endbr64 
  8097fa:	55                   	push   rbp
  8097fb:	48 89 e5             	mov    rbp,rsp
  8097fe:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  809802:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  809809:	eb 09                	jmp    809814 <strlen+0x1e>
  80980b:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  809810:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809814:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809818:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80981b:	84 c0                	test   al,al
  80981d:	75 ec                	jne    80980b <strlen+0x15>
    return l;
  80981f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  809822:	5d                   	pop    rbp
  809823:	c3                   	ret    

0000000000809824 <sprintf>:

void sprintf(char *dist, char *str,...)
{
  809824:	f3 0f 1e fa          	endbr64 
  809828:	55                   	push   rbp
  809829:	48 89 e5             	mov    rbp,rsp
  80982c:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  809833:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80983a:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  809841:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  809848:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80984f:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  809856:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80985d:	84 c0                	test   al,al
  80985f:	74 20                	je     809881 <sprintf+0x5d>
  809861:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  809865:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  809869:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80986d:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  809871:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  809875:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  809879:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80987d:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  809881:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809888:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80988f:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809896:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80989d:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  8098a4:	00 00 00 
    while (*pstr!='\n')
  8098a7:	eb 39                	jmp    8098e2 <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  8098a9:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8098b0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8098b3:	3c 25                	cmp    al,0x25
  8098b5:	75 15                	jne    8098cc <sprintf+0xa8>
  8098b7:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  8098be:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8098c1:	3c 25                	cmp    al,0x25
  8098c3:	74 07                	je     8098cc <sprintf+0xa8>
            argnum++;
  8098c5:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  8098cc:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8098d3:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  8098da:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  8098e1:	01 
    while (*pstr!='\n')
  8098e2:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8098e9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8098ec:	3c 0a                	cmp    al,0xa
  8098ee:	75 b9                	jne    8098a9 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  8098f0:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  8098f7:	00 00 00 
  8098fa:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  809901:	00 00 00 
  809904:	48 8d 45 10          	lea    rax,[rbp+0x10]
  809908:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80990f:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  809916:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80991d:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809924:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80992b:	e9 e2 01 00 00       	jmp    809b12 <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  809930:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809937:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80993a:	3c 25                	cmp    al,0x25
  80993c:	0f 85 aa 01 00 00    	jne    809aec <sprintf+0x2c8>
  809942:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809949:	48 83 c0 01          	add    rax,0x1
  80994d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809950:	84 c0                	test   al,al
  809952:	0f 84 94 01 00 00    	je     809aec <sprintf+0x2c8>
            pstr++;
  809958:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80995f:	01 
            if(*pstr=='x'){
  809960:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809967:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80996a:	3c 78                	cmp    al,0x78
  80996c:	75 64                	jne    8099d2 <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80996e:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809974:	83 f8 2f             	cmp    eax,0x2f
  809977:	77 23                	ja     80999c <sprintf+0x178>
  809979:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809980:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809986:	89 d2                	mov    edx,edx
  809988:	48 01 d0             	add    rax,rdx
  80998b:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809991:	83 c2 08             	add    edx,0x8
  809994:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80999a:	eb 12                	jmp    8099ae <sprintf+0x18a>
  80999c:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8099a3:	48 8d 50 08          	lea    rdx,[rax+0x8]
  8099a7:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  8099ae:	8b 00                	mov    eax,DWORD PTR [rax]
  8099b0:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  8099b6:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  8099bc:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8099c3:	89 d6                	mov    esi,edx
  8099c5:	48 89 c7             	mov    rdi,rax
  8099c8:	e8 4e 02 00 00       	call   809c1b <sprint_hex>
            if(*pstr=='x'){
  8099cd:	e9 38 01 00 00       	jmp    809b0a <sprintf+0x2e6>
            }else if(*pstr=='s'){
  8099d2:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8099d9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099dc:	3c 73                	cmp    al,0x73
  8099de:	75 68                	jne    809a48 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  8099e0:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  8099e6:	83 f8 2f             	cmp    eax,0x2f
  8099e9:	77 23                	ja     809a0e <sprintf+0x1ea>
  8099eb:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8099f2:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  8099f8:	89 d2                	mov    edx,edx
  8099fa:	48 01 d0             	add    rax,rdx
  8099fd:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809a03:	83 c2 08             	add    edx,0x8
  809a06:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809a0c:	eb 12                	jmp    809a20 <sprintf+0x1fc>
  809a0e:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809a15:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809a19:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809a20:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809a23:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  809a2a:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  809a31:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809a38:	48 89 d6             	mov    rsi,rdx
  809a3b:	48 89 c7             	mov    rdi,rax
  809a3e:	e8 5a 02 00 00       	call   809c9d <sprintn>
            if(*pstr=='x'){
  809a43:	e9 c2 00 00 00       	jmp    809b0a <sprintf+0x2e6>
            }else if(*pstr=='d'){
  809a48:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809a4f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a52:	3c 64                	cmp    al,0x64
  809a54:	75 66                	jne    809abc <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  809a56:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809a5c:	83 f8 2f             	cmp    eax,0x2f
  809a5f:	77 23                	ja     809a84 <sprintf+0x260>
  809a61:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809a68:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809a6e:	89 d2                	mov    edx,edx
  809a70:	48 01 d0             	add    rax,rdx
  809a73:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809a79:	83 c2 08             	add    edx,0x8
  809a7c:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809a82:	eb 12                	jmp    809a96 <sprintf+0x272>
  809a84:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809a8b:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809a8f:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809a96:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809a99:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  809aa0:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  809aa7:	89 c2                	mov    edx,eax
  809aa9:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809ab0:	89 d6                	mov    esi,edx
  809ab2:	48 89 c7             	mov    rdi,rax
  809ab5:	e8 ad 00 00 00       	call   809b67 <sprint_decimal>
            if(*pstr=='x'){
  809aba:	eb 4e                	jmp    809b0a <sprintf+0x2e6>
            }else if(*pstr=='c'){
  809abc:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809ac3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ac6:	3c 63                	cmp    al,0x63
  809ac8:	75 02                	jne    809acc <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  809aca:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  809acc:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809ad3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ad6:	0f be d0             	movsx  edx,al
  809ad9:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809ae0:	89 d6                	mov    esi,edx
  809ae2:	48 89 c7             	mov    rdi,rax
  809ae5:	e8 3e 00 00 00       	call   809b28 <sprintchar>
            if(*pstr=='x'){
  809aea:	eb 1e                	jmp    809b0a <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  809aec:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809af3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809af6:	0f be d0             	movsx  edx,al
  809af9:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809b00:	89 d6                	mov    esi,edx
  809b02:	48 89 c7             	mov    rdi,rax
  809b05:	e8 1e 00 00 00       	call   809b28 <sprintchar>
    for(;*pstr!='\0';pstr++){
  809b0a:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  809b11:	01 
  809b12:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809b19:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b1c:	84 c0                	test   al,al
  809b1e:	0f 85 0c fe ff ff    	jne    809930 <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  809b24:	90                   	nop
  809b25:	90                   	nop
  809b26:	c9                   	leave  
  809b27:	c3                   	ret    

0000000000809b28 <sprintchar>:
void sprintchar(char *dist,char c)
{
  809b28:	f3 0f 1e fa          	endbr64 
  809b2c:	55                   	push   rbp
  809b2d:	48 89 e5             	mov    rbp,rsp
  809b30:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809b34:	89 f0                	mov    eax,esi
  809b36:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  809b39:	eb 05                	jmp    809b40 <sprintchar+0x18>
        dist++;
  809b3b:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  809b40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b44:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b47:	84 c0                	test   al,al
  809b49:	75 f0                	jne    809b3b <sprintchar+0x13>
    *dist++=c;
  809b4b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b4f:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809b53:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809b57:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  809b5b:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  809b5d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b61:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  809b64:	90                   	nop
  809b65:	5d                   	pop    rbp
  809b66:	c3                   	ret    

0000000000809b67 <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  809b67:	f3 0f 1e fa          	endbr64 
  809b6b:	55                   	push   rbp
  809b6c:	48 89 e5             	mov    rbp,rsp
  809b6f:	48 83 ec 30          	sub    rsp,0x30
  809b73:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  809b77:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  809b7a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  809b81:	eb 65                	jmp    809be8 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  809b83:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  809b86:	48 63 c2             	movsxd rax,edx
  809b89:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  809b90:	48 c1 e8 20          	shr    rax,0x20
  809b94:	c1 f8 02             	sar    eax,0x2
  809b97:	89 d6                	mov    esi,edx
  809b99:	c1 fe 1f             	sar    esi,0x1f
  809b9c:	29 f0                	sub    eax,esi
  809b9e:	89 c1                	mov    ecx,eax
  809ba0:	89 c8                	mov    eax,ecx
  809ba2:	c1 e0 02             	shl    eax,0x2
  809ba5:	01 c8                	add    eax,ecx
  809ba7:	01 c0                	add    eax,eax
  809ba9:	89 d1                	mov    ecx,edx
  809bab:	29 c1                	sub    ecx,eax
  809bad:	89 c8                	mov    eax,ecx
  809baf:	83 c0 30             	add    eax,0x30
  809bb2:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  809bb5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809bb8:	8d 50 01             	lea    edx,[rax+0x1]
  809bbb:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  809bbe:	48 98                	cdqe   
  809bc0:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  809bc4:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  809bc8:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  809bcb:	48 63 d0             	movsxd rdx,eax
  809bce:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  809bd5:	48 c1 ea 20          	shr    rdx,0x20
  809bd9:	c1 fa 02             	sar    edx,0x2
  809bdc:	c1 f8 1f             	sar    eax,0x1f
  809bdf:	89 c1                	mov    ecx,eax
  809be1:	89 d0                	mov    eax,edx
  809be3:	29 c8                	sub    eax,ecx
  809be5:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  809be8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809beb:	83 f8 0f             	cmp    eax,0xf
  809bee:	76 93                	jbe    809b83 <sprint_decimal+0x1c>
    }
    while(p>0)
  809bf0:	eb 1f                	jmp    809c11 <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  809bf2:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  809bf6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809bf9:	48 98                	cdqe   
  809bfb:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  809c00:	0f be d0             	movsx  edx,al
  809c03:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809c07:	89 d6                	mov    esi,edx
  809c09:	48 89 c7             	mov    rdi,rax
  809c0c:	e8 17 ff ff ff       	call   809b28 <sprintchar>
    while(p>0)
  809c11:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809c15:	7f db                	jg     809bf2 <sprint_decimal+0x8b>
    }
}
  809c17:	90                   	nop
  809c18:	90                   	nop
  809c19:	c9                   	leave  
  809c1a:	c3                   	ret    

0000000000809c1b <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  809c1b:	f3 0f 1e fa          	endbr64 
  809c1f:	55                   	push   rbp
  809c20:	48 89 e5             	mov    rbp,rsp
  809c23:	48 83 ec 20          	sub    rsp,0x20
  809c27:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809c2b:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  809c2e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  809c35:	eb 35                	jmp    809c6c <sprint_hex+0x51>
        unsigned char a=c%16;
  809c37:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809c3a:	83 e0 0f             	and    eax,0xf
  809c3d:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  809c40:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  809c44:	76 06                	jbe    809c4c <sprint_hex+0x31>
  809c46:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  809c4a:	eb 04                	jmp    809c50 <sprint_hex+0x35>
        else a+='0';
  809c4c:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  809c50:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809c53:	8d 50 01             	lea    edx,[rax+0x1]
  809c56:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  809c59:	48 98                	cdqe   
  809c5b:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  809c5f:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  809c63:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809c66:	c1 e8 04             	shr    eax,0x4
  809c69:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  809c6c:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  809c70:	7e c5                	jle    809c37 <sprint_hex+0x1c>
    }
    while(p>0)
  809c72:	eb 1f                	jmp    809c93 <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  809c74:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  809c78:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809c7b:	48 98                	cdqe   
  809c7d:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  809c82:	0f be d0             	movsx  edx,al
  809c85:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809c89:	89 d6                	mov    esi,edx
  809c8b:	48 89 c7             	mov    rdi,rax
  809c8e:	e8 95 fe ff ff       	call   809b28 <sprintchar>
    while(p>0)
  809c93:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809c97:	7f db                	jg     809c74 <sprint_hex+0x59>
    }
}
  809c99:	90                   	nop
  809c9a:	90                   	nop
  809c9b:	c9                   	leave  
  809c9c:	c3                   	ret    

0000000000809c9d <sprintn>:
void sprintn(char *dist,char *str)
{
  809c9d:	f3 0f 1e fa          	endbr64 
  809ca1:	55                   	push   rbp
  809ca2:	48 89 e5             	mov    rbp,rsp
  809ca5:	48 83 ec 10          	sub    rsp,0x10
  809ca9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809cad:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  809cb1:	eb 20                	jmp    809cd3 <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  809cb3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809cb7:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809cbb:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  809cbf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809cc2:	0f be d0             	movsx  edx,al
  809cc5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809cc9:	89 d6                	mov    esi,edx
  809ccb:	48 89 c7             	mov    rdi,rax
  809cce:	e8 55 fe ff ff       	call   809b28 <sprintchar>
    while(*str!='\0')
  809cd3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809cd7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809cda:	84 c0                	test   al,al
  809cdc:	75 d5                	jne    809cb3 <sprintn+0x16>
    }
  809cde:	90                   	nop
  809cdf:	90                   	nop
  809ce0:	c9                   	leave  
  809ce1:	c3                   	ret    
  809ce2:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  809ce9:	00 00 00 
  809cec:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000809cf0 <create_zero>:
  809cf0:	e8 16 9d ff ff       	call   803a0b <req_proc+0x4>
  809cf5:	83 f8 ff             	cmp    eax,0xffffffff
  809cf8:	74 1d                	je     809d17 <create_zero.retu>
  809cfa:	50                   	push   rax
  809cfb:	53                   	push   rbx
  809cfc:	51                   	push   rcx
  809cfd:	52                   	push   rdx
  809cfe:	06                   	(bad)  
  809cff:	0e                   	(bad)  
  809d00:	16                   	(bad)  
  809d01:	1e                   	(bad)  
  809d02:	0f a0                	push   fs
  809d04:	0f a8                	push   gs
  809d06:	54                   	push   rsp
  809d07:	55                   	push   rbp
  809d08:	56                   	push   rsi
  809d09:	57                   	push   rdi
  809d0a:	9c                   	pushf  
  809d0b:	50                   	push   rax
  809d0c:	e8 c6 9d ff ff       	call   803ad7 <set_proc+0x4>
  809d11:	8b 04 24             	mov    eax,DWORD PTR [rsp]
  809d14:	83 c4 40             	add    esp,0x40

0000000000809d17 <create_zero.retu>:
  809d17:	c3                   	ret    

0000000000809d18 <fill_desc>:
  809d18:	55                   	push   rbp
  809d19:	89 e5                	mov    ebp,esp
  809d1b:	8b 45 14             	mov    eax,DWORD PTR [rbp+0x14]
  809d1e:	8b 5d 10             	mov    ebx,DWORD PTR [rbp+0x10]
  809d21:	8b 4d 0c             	mov    ecx,DWORD PTR [rbp+0xc]
  809d24:	8b 55 08             	mov    edx,DWORD PTR [rbp+0x8]
  809d27:	be f0 9c 80 00       	mov    esi,0x809cf0
  809d2c:	c7 05 f0 9c 80 00 00 	mov    DWORD PTR [rip+0x809cf0],0x0        # 1013a26 <dev_stdout+0x801aa6>
  809d33:	00 00 00 
  809d36:	c7 05 f0 9c 80 00 00 	mov    DWORD PTR [rip+0x809cf0],0x0        # 1013a30 <dev_stdout+0x801ab0>
  809d3d:	00 00 00 
  809d40:	66 89 0e             	mov    WORD PTR [rsi],cx
  809d43:	c1 e9 10             	shr    ecx,0x10
  809d46:	66 89 56 02          	mov    WORD PTR [rsi+0x2],dx
  809d4a:	c1 ea 10             	shr    edx,0x10
  809d4d:	88 56 04             	mov    BYTE PTR [rsi+0x4],dl
  809d50:	66 c1 ea 08          	shr    dx,0x8
  809d54:	88 56 07             	mov    BYTE PTR [rsi+0x7],dl
  809d57:	66 89 5e 05          	mov    WORD PTR [rsi+0x5],bx
  809d5b:	8b 7e 04             	mov    edi,DWORD PTR [rsi+0x4]
  809d5e:	c1 e1 08             	shl    ecx,0x8
  809d61:	09 cf                	or     edi,ecx
  809d63:	89 7e 04             	mov    DWORD PTR [rsi+0x4],edi
  809d66:	8b 15 f0 9c 80 00    	mov    edx,DWORD PTR [rip+0x809cf0]        # 1013a5c <dev_stdout+0x801adc>
  809d6c:	89 10                	mov    DWORD PTR [rax],edx
  809d6e:	8b 15 f0 9c 80 00    	mov    edx,DWORD PTR [rip+0x809cf0]        # 1013a64 <dev_stdout+0x801ae4>
  809d74:	89 50 04             	mov    DWORD PTR [rax+0x4],edx
  809d77:	89 ec                	mov    esp,ebp
  809d79:	5d                   	pop    rbp
  809d7a:	c3                   	ret    

0000000000809d7b <switch_proc_asm>:
  809d7b:	66 8b 44 24 04       	mov    ax,WORD PTR [rsp+0x4]
  809d80:	66 a3 f0 9c 80 00 c7 	movabs ds:0x9cf005c700809cf0,ax
  809d87:	05 f0 9c 
  809d8a:	80 00 00             	add    BYTE PTR [rax],0x0
  809d8d:	00 00                	add    BYTE PTR [rax],al
	...

0000000000809d90 <switch_proc_asm.ljmp>:
  809d90:	ea                   	(bad)  
  809d91:	00 00                	add    BYTE PTR [rax],al
  809d93:	00 00                	add    BYTE PTR [rax],al
  809d95:	00 00                	add    BYTE PTR [rax],al
  809d97:	c3                   	ret    

0000000000809d98 <switch_to>:
  809d98:	8b 74 24 04          	mov    esi,DWORD PTR [rsp+0x4]
  809d9c:	8b 5e 20             	mov    ebx,DWORD PTR [rsi+0x20]
  809d9f:	bf f0 9c 80 00       	mov    edi,0x809cf0
  809da4:	89 5f 01             	mov    DWORD PTR [rdi+0x1],ebx
  809da7:	8b 46 38             	mov    eax,DWORD PTR [rsi+0x38]
  809daa:	89 c1                	mov    ecx,eax
  809dac:	83 e9 04             	sub    ecx,0x4
  809daf:	89 19                	mov    DWORD PTR [rcx],ebx
  809db1:	50                   	push   rax
  809db2:	89 f5                	mov    ebp,esi
  809db4:	83 c5 28             	add    ebp,0x28
  809db7:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  809dba:	50                   	push   rax
  809dbb:	83 c5 04             	add    ebp,0x4
  809dbe:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  809dc1:	50                   	push   rax
  809dc2:	83 c5 04             	add    ebp,0x4
  809dc5:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  809dc8:	50                   	push   rax
  809dc9:	83 c5 04             	add    ebp,0x4
  809dcc:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  809dcf:	50                   	push   rax
  809dd0:	83 c5 04             	add    ebp,0x4
  809dd3:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  809dd6:	50                   	push   rax
  809dd7:	83 c5 04             	add    ebp,0x4
  809dda:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  809ddd:	50                   	push   rax
  809dde:	83 c5 04             	add    ebp,0x4
  809de1:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  809de4:	50                   	push   rax
  809de5:	83 c5 04             	add    ebp,0x4
  809de8:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  809deb:	50                   	push   rax
  809dec:	83 c5 04             	add    ebp,0x4
  809def:	8b 46 1c             	mov    eax,DWORD PTR [rsi+0x1c]
  809df2:	0f 22 d8             	mov    cr3,rax
  809df5:	8b 46 24             	mov    eax,DWORD PTR [rsi+0x24]
  809df8:	50                   	push   rax
  809df9:	9d                   	popf   
  809dfa:	61                   	(bad)  
  809dfb:	5c                   	pop    rsp

0000000000809dfc <switch_to.leap>:
  809dfc:	ea                   	(bad)  
  809dfd:	00 00                	add    BYTE PTR [rax],al
  809dff:	00 00                	add    BYTE PTR [rax],al
  809e01:	08 00                	or     BYTE PTR [rax],al

0000000000809e03 <save_context>:
  809e03:	60                   	(bad)  
  809e04:	8b 44 24 24          	mov    eax,DWORD PTR [rsp+0x24]
  809e08:	83 c0 44             	add    eax,0x44
  809e0b:	b9 08 00 00 00       	mov    ecx,0x8
  809e10:	89 e7                	mov    edi,esp

0000000000809e12 <save_context.loops>:
  809e12:	8b 17                	mov    edx,DWORD PTR [rdi]
  809e14:	89 10                	mov    DWORD PTR [rax],edx
  809e16:	83 c7 04             	add    edi,0x4
  809e19:	83 e8 04             	sub    eax,0x4
  809e1c:	e2 f4                	loop   809e12 <save_context.loops>
  809e1e:	61                   	(bad)  
  809e1f:	9c                   	pushf  
  809e20:	5b                   	pop    rbx
  809e21:	8b 44 24 04          	mov    eax,DWORD PTR [rsp+0x4]
  809e25:	89 58 24             	mov    DWORD PTR [rax+0x24],ebx
  809e28:	8b 1c 24             	mov    ebx,DWORD PTR [rsp]
  809e2b:	89 58 20             	mov    DWORD PTR [rax+0x20],ebx
  809e2e:	c3                   	ret    

0000000000809e2f <move_to_user_mode>:
  809e2f:	66 b8 20 00          	mov    ax,0x20
  809e33:	8e d8                	mov    ds,eax
  809e35:	8e c0                	mov    es,eax
  809e37:	8e e8                	mov    gs,eax
  809e39:	6a 20                	push   0x20
  809e3b:	54                   	push   rsp
  809e3c:	9c                   	pushf  
  809e3d:	6a 18                	push   0x18
  809e3f:	68 f0 9c 80 00       	push   0x809cf0
  809e44:	cf                   	iret   

0000000000809e45 <move_to_user_mode.done>:
  809e45:	c3                   	ret    

0000000000809e46 <desc>:
	...
