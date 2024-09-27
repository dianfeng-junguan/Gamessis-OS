
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
  800194:	b8 96 13 80 00       	mov    eax,0x801396
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
  800217:	b8 20 5b 80 00       	mov    eax,0x805b20
  80021c:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 d9 00 00 00       	call   80030c <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 70 4e 80 00       	mov    eax,0x804e70
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 bd 00 00 00       	call   80030c <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 e0 69 80 00       	mov    eax,0x8069e0
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 a1 00 00 00       	call   80030c <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);//
  80026b:	b8 90 58 80 00       	mov    eax,0x805890
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
  800291:	e8 fa 48 00 00       	call   804b90 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 eb 48 00 00       	call   804b90 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 dc 48 00 00       	call   804b90 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 cd 48 00 00       	call   804b90 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 be 48 00 00       	call   804b90 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 af 48 00 00       	call   804b90 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 a0 48 00 00       	call   804b90 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 91 48 00 00       	call   804b90 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 cc 48 00 00       	call   804bd5 <turn_on_int>

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
  8003a6:	e8 1e 48 00 00       	call   804bc9 <eoi>
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
  8003bf:	e8 05 48 00 00       	call   804bc9 <eoi>
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
  8003d8:	e8 ec 47 00 00       	call   804bc9 <eoi>
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
  8003f1:	e8 d3 47 00 00       	call   804bc9 <eoi>
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
  80040a:	e8 ba 47 00 00       	call   804bc9 <eoi>
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
  800423:	e8 a1 47 00 00       	call   804bc9 <eoi>
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
  80043b:	e8 89 47 00 00       	call   804bc9 <eoi>
    report_back_trace_of_err();
  800440:	b8 00 00 00 00       	mov    eax,0x0
  800445:	e8 aa 47 00 00       	call   804bf4 <report_back_trace_of_err>
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
  80045f:	e8 65 47 00 00       	call   804bc9 <eoi>
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
  800478:	e8 4c 47 00 00       	call   804bc9 <eoi>
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
  800490:	e8 34 47 00 00       	call   804bc9 <eoi>
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
  8004a8:	e8 1c 47 00 00       	call   804bc9 <eoi>
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
  8004c1:	e8 03 47 00 00       	call   804bc9 <eoi>
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
  8004da:	e8 ea 46 00 00       	call   804bc9 <eoi>
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
  8004fe:	e8 c6 46 00 00       	call   804bc9 <eoi>
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
  800518:	e8 ac 46 00 00       	call   804bc9 <eoi>
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
  800550:	48 8b 04 c5 c0 9b 80 	mov    rax,QWORD PTR [rax*8+0x809bc0]
  800557:	00 
  800558:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(b);
  80055b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80055e:	48 98                	cdqe   
  800560:	48 89 c7             	mov    rdi,rax
  800563:	e8 20 26 00 00       	call   802b88 <reg_device>
  800568:	e9 f7 01 00 00       	jmp    800764 <syscall+0x241>
        case 1:return dispose_device(b);
  80056d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800570:	89 c7                	mov    edi,eax
  800572:	e8 70 30 00 00       	call   8035e7 <dispose_device>
  800577:	e9 e8 01 00 00       	jmp    800764 <syscall+0x241>
        case 2:return reg_driver(b);
  80057c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80057f:	48 98                	cdqe   
  800581:	48 89 c7             	mov    rdi,rax
  800584:	e8 e7 28 00 00       	call   802e70 <reg_driver>
  800589:	e9 d6 01 00 00       	jmp    800764 <syscall+0x241>
        case 3:return dispose_driver(b);
  80058e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800591:	48 98                	cdqe   
  800593:	48 89 c7             	mov    rdi,rax
  800596:	e8 ea 30 00 00       	call   803685 <dispose_driver>
  80059b:	e9 c4 01 00 00       	jmp    800764 <syscall+0x241>
        case 4:return call_drv_func(b,c,d);
  8005a0:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8005a3:	48 98                	cdqe   
  8005a5:	48 89 c2             	mov    rdx,rax
  8005a8:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8005ab:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005ae:	89 ce                	mov    esi,ecx
  8005b0:	89 c7                	mov    edi,eax
  8005b2:	e8 d9 2d 00 00       	call   803390 <call_drv_func>
  8005b7:	e9 a8 01 00 00       	jmp    800764 <syscall+0x241>
        case 5:return req_page_at(b,c);
  8005bc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005bf:	48 98                	cdqe   
  8005c1:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8005c4:	89 d6                	mov    esi,edx
  8005c6:	48 89 c7             	mov    rdi,rax
  8005c9:	e8 a7 11 00 00       	call   801775 <req_page_at>
  8005ce:	e9 91 01 00 00       	jmp    800764 <syscall+0x241>
        case 6:return free_page(b);
  8005d3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005d6:	48 98                	cdqe   
  8005d8:	48 89 c7             	mov    rdi,rax
  8005db:	e8 c6 0f 00 00       	call   8015a6 <free_page>
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
  8005fd:	e8 84 41 00 00       	call   804786 <reg_proc>
  800602:	e9 5d 01 00 00       	jmp    800764 <syscall+0x241>
        case 8:del_proc(b);
  800607:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80060a:	89 c7                	mov    edi,eax
  80060c:	e8 52 3f 00 00       	call   804563 <del_proc>
        case 10:chk_vm(b,c);
  800611:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  800614:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800617:	89 d6                	mov    esi,edx
  800619:	89 c7                	mov    edi,eax
  80061b:	e8 17 12 00 00       	call   801837 <chk_vm>
        case 11:return sys_open(b,c);
  800620:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800623:	48 98                	cdqe   
  800625:	48 89 c2             	mov    rdx,rax
  800628:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80062b:	89 c6                	mov    esi,eax
  80062d:	48 89 d7             	mov    rdi,rdx
  800630:	e8 e6 15 00 00       	call   801c1b <sys_open>
  800635:	e9 2a 01 00 00       	jmp    800764 <syscall+0x241>
        case 12:return sys_close(b);
  80063a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80063d:	89 c7                	mov    edi,eax
  80063f:	e8 a0 1a 00 00       	call   8020e4 <sys_close>
  800644:	e9 1b 01 00 00       	jmp    800764 <syscall+0x241>
        case 13:return sys_read(b,c,d);
  800649:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80064c:	48 98                	cdqe   
  80064e:	48 89 c1             	mov    rcx,rax
  800651:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  800654:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800657:	48 89 ce             	mov    rsi,rcx
  80065a:	89 c7                	mov    edi,eax
  80065c:	e8 99 1b 00 00       	call   8021fa <sys_read>
  800661:	e9 fe 00 00 00       	jmp    800764 <syscall+0x241>
        case 14:return sys_write(b,c,d);
  800666:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800669:	48 98                	cdqe   
  80066b:	48 89 c1             	mov    rcx,rax
  80066e:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  800671:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800674:	48 89 ce             	mov    rsi,rcx
  800677:	89 c7                	mov    edi,eax
  800679:	e8 eb 1a 00 00       	call   802169 <sys_write>
  80067e:	e9 e1 00 00 00       	jmp    800764 <syscall+0x241>
        case 15:return sys_seek(b,c,d);
  800683:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  800686:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  800689:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80068c:	89 ce                	mov    esi,ecx
  80068e:	89 c7                	mov    edi,eax
  800690:	e8 f6 1b 00 00       	call   80228b <sys_seek>
  800695:	e9 ca 00 00 00       	jmp    800764 <syscall+0x241>
        case 16:return sys_tell(b);
  80069a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80069d:	89 c7                	mov    edi,eax
  80069f:	e8 2e 1c 00 00       	call   8022d2 <sys_tell>
  8006a4:	e9 bb 00 00 00       	jmp    800764 <syscall+0x241>
        case 17:return reg_vol(b,c,d);
  8006a9:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006ac:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006af:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006b2:	89 ce                	mov    esi,ecx
  8006b4:	89 c7                	mov    edi,eax
  8006b6:	b8 00 00 00 00       	mov    eax,0x0
  8006bb:	e8 50 14 00 00       	call   801b10 <reg_vol>
  8006c0:	e9 9f 00 00 00       	jmp    800764 <syscall+0x241>
        case 18:return free_vol(b);
  8006c5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006c8:	89 c7                	mov    edi,eax
  8006ca:	b8 00 00 00 00       	mov    eax,0x0
  8006cf:	e8 20 14 00 00       	call   801af4 <free_vol>
  8006d4:	e9 8b 00 00 00       	jmp    800764 <syscall+0x241>
        case 19:return execute(b);
  8006d9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006dc:	48 98                	cdqe   
  8006de:	48 89 c7             	mov    rdi,rax
  8006e1:	e8 fc 47 00 00       	call   804ee2 <execute>
  8006e6:	eb 7c                	jmp    800764 <syscall+0x241>
        case SYSCALL_EXIT:return sys_exit(b);
  8006e8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006eb:	89 c7                	mov    edi,eax
  8006ed:	e8 73 40 00 00       	call   804765 <sys_exit>
  8006f2:	eb 70                	jmp    800764 <syscall+0x241>
        case SYSCALL_CALL:return exec_call(b);
  8006f4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006f7:	48 98                	cdqe   
  8006f9:	48 89 c7             	mov    rdi,rax
  8006fc:	e8 dc 48 00 00       	call   804fdd <exec_call>
  800701:	eb 61                	jmp    800764 <syscall+0x241>
        case SYSCALL_MKFIFO:return sys_mkfifo(b);
  800703:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800706:	89 c7                	mov    edi,eax
  800708:	e8 88 12 00 00       	call   801995 <sys_mkfifo>
  80070d:	eb 55                	jmp    800764 <syscall+0x241>
        case SYSCALL_MALLOC:return sys_malloc(b);
  80070f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800712:	89 c7                	mov    edi,eax
  800714:	e8 23 42 00 00       	call   80493c <sys_malloc>
  800719:	eb 49                	jmp    800764 <syscall+0x241>
        case SYSCALL_FREE:return sys_free(b);
  80071b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80071e:	89 c7                	mov    edi,eax
  800720:	e8 a5 43 00 00       	call   804aca <sys_free>
  800725:	eb 3d                	jmp    800764 <syscall+0x241>
        case SYSCALL_KB_READC:return sys_getkbc();
  800727:	b8 00 00 00 00       	mov    eax,0x0
  80072c:	e8 c6 54 00 00       	call   805bf7 <sys_getkbc>
  800731:	0f be c0             	movsx  eax,al
  800734:	eb 2e                	jmp    800764 <syscall+0x241>
        case SYSCALL_FIND_DEV:return sys_find_dev(b);
  800736:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800739:	48 98                	cdqe   
  80073b:	48 89 c7             	mov    rdi,rax
  80073e:	e8 7d 28 00 00       	call   802fc0 <sys_find_dev>
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
  80075d:	e8 f0 28 00 00       	call   803052 <sys_operate_dev>
  800762:	eb 00                	jmp    800764 <syscall+0x241>
    }
    // __asm__ volatile("mov %0,%%eax\r\n mov %1,%%ebx\r\n mov %2,%%ecx\r\n mov %3,%%edx\r\n mov %4,%%esi\r\n mov %5,%%edi"\
    // ::"m"(func),"m"(a),"m"(b),"m"(c),"m"(d),"m"(e));
    // __asm__ volatile("int $0x80\r\n leave\r\n ret");
  800764:	c9                   	leave  
  800765:	c3                   	ret    

0000000000800766 <main>:
#include <fat16.h>
#include <kb.h>

int manage_proc_lock=1;
void main(unsigned int magic,void* addr)
{
  800766:	f3 0f 1e fa          	endbr64 
  80076a:	55                   	push   rbp
  80076b:	48 89 e5             	mov    rbp,rsp
  80076e:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  800772:	89 7d 8c             	mov    DWORD PTR [rbp-0x74],edi
  800775:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi

    struct multiboot_header* mbi=0ul;
  800779:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  800780:	00 
    mbi=(struct multiboot_header*)addr;
  800781:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  800785:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    init_logging();
  800789:	b8 00 00 00 00       	mov    eax,0x0
  80078e:	e8 8d 04 00 00       	call   800c20 <init_logging>
        
    }
    //获取tags
    struct multiboot_tag *tag;
	unsigned size;
    size = *(unsigned long*)addr;
  800793:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  800797:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80079a:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
//    //printf("Announced mbi size 0x%x\n", size);
	for (tag = (struct multiboot_tag *)(addr + 8);
  80079d:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8007a1:	48 83 c0 08          	add    rax,0x8
  8007a5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8007a9:	e9 d6 03 00 00       	jmp    800b84 <main+0x41e>
		 tag->type != MULTIBOOT_TAG_TYPE_END;
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
	{
		//printf("Tag 0x%x, Size 0x%x\n", tag->type, tag->size);
		switch (tag->type)
  8007ae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8007b2:	8b 00                	mov    eax,DWORD PTR [rax]
  8007b4:	83 f8 08             	cmp    eax,0x8
  8007b7:	0f 87 b4 03 00 00    	ja     800b71 <main+0x40b>
  8007bd:	89 c0                	mov    eax,eax
  8007bf:	48 8b 04 c5 e8 9e 80 	mov    rax,QWORD PTR [rax*8+0x809ee8]
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
  8007d3:	e8 2f 0a 00 00       	call   801207 <set_high_mem_base>
			break;
  8007d8:	e9 94 03 00 00       	jmp    800b71 <main+0x40b>
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
  800809:	e8 10 0a 00 00       	call   80121e <set_mem_area>
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
  800867:	e9 05 03 00 00       	jmp    800b71 <main+0x40b>
		case MULTIBOOT_TAG_TYPE_FRAMEBUFFER:
		{
			multiboot_uint32_t color;
			unsigned i;
			struct multiboot_tag_framebuffer *tagfb = (struct multiboot_tag_framebuffer *)tag;
  80086c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800870:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
			void *fb = (void *)(unsigned long)tagfb->common.framebuffer_addr;
  800874:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800878:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80087c:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
			set_framebuffer(*tagfb);
  800880:	48 83 ec 08          	sub    rsp,0x8
  800884:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800888:	ff 70 20             	push   QWORD PTR [rax+0x20]
  80088b:	ff 70 18             	push   QWORD PTR [rax+0x18]
  80088e:	ff 70 10             	push   QWORD PTR [rax+0x10]
  800891:	ff 70 08             	push   QWORD PTR [rax+0x8]
  800894:	ff 30                	push   QWORD PTR [rax]
  800896:	e8 dc 50 00 00       	call   805977 <set_framebuffer>
  80089b:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  80089f:	b8 00 00 00 00       	mov    eax,0x0
  8008a4:	e8 f6 4f 00 00       	call   80589f <init_framebuffer>
			switch (tagfb->common.framebuffer_type)
  8008a9:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8008ad:	0f b6 40 1d          	movzx  eax,BYTE PTR [rax+0x1d]
  8008b1:	0f b6 c0             	movzx  eax,al
  8008b4:	83 f8 02             	cmp    eax,0x2
  8008b7:	0f 84 5a 01 00 00    	je     800a17 <main+0x2b1>
  8008bd:	83 f8 02             	cmp    eax,0x2
  8008c0:	0f 8f 5a 01 00 00    	jg     800a20 <main+0x2ba>
  8008c6:	85 c0                	test   eax,eax
  8008c8:	74 0e                	je     8008d8 <main+0x172>
  8008ca:	83 f8 01             	cmp    eax,0x1
  8008cd:	0f 84 15 01 00 00    	je     8009e8 <main+0x282>
  8008d3:	e9 48 01 00 00       	jmp    800a20 <main+0x2ba>
			case MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED:
			{
				unsigned best_distance, distance;
				struct multiboot_color *palette;

				palette = tagfb->framebuffer_palette;
  8008d8:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8008dc:	48 83 c0 22          	add    rax,0x22
  8008e0:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

				color = 0;
  8008e4:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
				best_distance = 4 * 256 * 256;
  8008eb:	c7 45 e4 00 00 04 00 	mov    DWORD PTR [rbp-0x1c],0x40000

				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  8008f2:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8008f9:	e9 d4 00 00 00       	jmp    8009d2 <main+0x26c>
				{
					distance = (0xff - palette[i].blue) * (0xff - palette[i].blue) + palette[i].red * palette[i].red + palette[i].green * palette[i].green;
  8008fe:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800901:	48 89 d0             	mov    rax,rdx
  800904:	48 01 c0             	add    rax,rax
  800907:	48 01 c2             	add    rdx,rax
  80090a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80090e:	48 01 d0             	add    rax,rdx
  800911:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  800915:	0f b6 c0             	movzx  eax,al
  800918:	ba ff 00 00 00       	mov    edx,0xff
  80091d:	89 d1                	mov    ecx,edx
  80091f:	29 c1                	sub    ecx,eax
  800921:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800924:	48 89 d0             	mov    rax,rdx
  800927:	48 01 c0             	add    rax,rax
  80092a:	48 01 c2             	add    rdx,rax
  80092d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800931:	48 01 d0             	add    rax,rdx
  800934:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  800938:	0f b6 d0             	movzx  edx,al
  80093b:	b8 ff 00 00 00       	mov    eax,0xff
  800940:	29 d0                	sub    eax,edx
  800942:	89 ce                	mov    esi,ecx
  800944:	0f af f0             	imul   esi,eax
  800947:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80094a:	48 89 d0             	mov    rax,rdx
  80094d:	48 01 c0             	add    rax,rax
  800950:	48 01 c2             	add    rdx,rax
  800953:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800957:	48 01 d0             	add    rax,rdx
  80095a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80095d:	0f b6 c8             	movzx  ecx,al
  800960:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800963:	48 89 d0             	mov    rax,rdx
  800966:	48 01 c0             	add    rax,rax
  800969:	48 01 c2             	add    rdx,rax
  80096c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800970:	48 01 d0             	add    rax,rdx
  800973:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800976:	0f b6 c0             	movzx  eax,al
  800979:	0f af c1             	imul   eax,ecx
  80097c:	01 c6                	add    esi,eax
  80097e:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800981:	48 89 d0             	mov    rax,rdx
  800984:	48 01 c0             	add    rax,rax
  800987:	48 01 c2             	add    rdx,rax
  80098a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80098e:	48 01 d0             	add    rax,rdx
  800991:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  800995:	0f b6 c8             	movzx  ecx,al
  800998:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80099b:	48 89 d0             	mov    rax,rdx
  80099e:	48 01 c0             	add    rax,rax
  8009a1:	48 01 c2             	add    rdx,rax
  8009a4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009a8:	48 01 d0             	add    rax,rdx
  8009ab:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  8009af:	0f b6 c0             	movzx  eax,al
  8009b2:	0f af c1             	imul   eax,ecx
  8009b5:	01 f0                	add    eax,esi
  8009b7:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
					if (distance < best_distance)
  8009ba:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8009bd:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8009c0:	73 0c                	jae    8009ce <main+0x268>
					{
						color = i;
  8009c2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8009c5:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
						best_distance = distance;
  8009c8:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8009cb:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  8009ce:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  8009d2:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8009d6:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
  8009da:	0f b7 c0             	movzx  eax,ax
  8009dd:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8009e0:	0f 82 18 ff ff ff    	jb     8008fe <main+0x198>
					}
				}
			}
			break;
  8009e6:	eb 40                	jmp    800a28 <main+0x2c2>

			case MULTIBOOT_FRAMEBUFFER_TYPE_RGB:
				color = ((1 << tagfb->framebuffer_blue_mask_size) - 1) << tagfb->framebuffer_blue_field_position;
  8009e8:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8009ec:	0f b6 40 25          	movzx  eax,BYTE PTR [rax+0x25]
  8009f0:	0f b6 c0             	movzx  eax,al
  8009f3:	ba 01 00 00 00       	mov    edx,0x1
  8009f8:	89 c1                	mov    ecx,eax
  8009fa:	d3 e2                	shl    edx,cl
  8009fc:	89 d0                	mov    eax,edx
  8009fe:	8d 50 ff             	lea    edx,[rax-0x1]
  800a01:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800a05:	0f b6 40 24          	movzx  eax,BYTE PTR [rax+0x24]
  800a09:	0f b6 c0             	movzx  eax,al
  800a0c:	89 c1                	mov    ecx,eax
  800a0e:	d3 e2                	shl    edx,cl
  800a10:	89 d0                	mov    eax,edx
  800a12:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
				break;
  800a15:	eb 11                	jmp    800a28 <main+0x2c2>

			case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT:
				color = '\\' | 0x0100;
  800a17:	c7 45 ec 5c 01 00 00 	mov    DWORD PTR [rbp-0x14],0x15c
				break;
  800a1e:	eb 08                	jmp    800a28 <main+0x2c2>

			default:
				color = 0xffffffff;
  800a20:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
				break;
  800a27:	90                   	nop
			}

			for (i = 0; i < tagfb->common.framebuffer_width && i < tagfb->common.framebuffer_height; i++)
  800a28:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  800a2f:	e9 20 01 00 00       	jmp    800b54 <main+0x3ee>
			{
				switch (tagfb->common.framebuffer_bpp)
  800a34:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800a38:	0f b6 40 1c          	movzx  eax,BYTE PTR [rax+0x1c]
  800a3c:	0f b6 c0             	movzx  eax,al
  800a3f:	83 f8 20             	cmp    eax,0x20
  800a42:	0f 84 db 00 00 00    	je     800b23 <main+0x3bd>
  800a48:	83 f8 20             	cmp    eax,0x20
  800a4b:	0f 8f ff 00 00 00    	jg     800b50 <main+0x3ea>
  800a51:	83 f8 18             	cmp    eax,0x18
  800a54:	0f 84 83 00 00 00    	je     800add <main+0x377>
  800a5a:	83 f8 18             	cmp    eax,0x18
  800a5d:	0f 8f ed 00 00 00    	jg     800b50 <main+0x3ea>
  800a63:	83 f8 08             	cmp    eax,0x8
  800a66:	74 17                	je     800a7f <main+0x319>
  800a68:	83 f8 08             	cmp    eax,0x8
  800a6b:	0f 8c df 00 00 00    	jl     800b50 <main+0x3ea>
  800a71:	83 e8 0f             	sub    eax,0xf
  800a74:	83 f8 01             	cmp    eax,0x1
  800a77:	0f 87 d3 00 00 00    	ja     800b50 <main+0x3ea>
  800a7d:	eb 2e                	jmp    800aad <main+0x347>
				{
				case 8:
				{
					multiboot_uint8_t *pixel = fb + tagfb->common.framebuffer_pitch * i + i;
  800a7f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800a83:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  800a86:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  800a8a:	89 c2                	mov    edx,eax
  800a8c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800a8f:	48 01 c2             	add    rdx,rax
  800a92:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  800a96:	48 01 d0             	add    rax,rdx
  800a99:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
					*pixel = color;
  800a9d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800aa0:	89 c2                	mov    edx,eax
  800aa2:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  800aa6:	88 10                	mov    BYTE PTR [rax],dl
				}
				break;
  800aa8:	e9 a3 00 00 00       	jmp    800b50 <main+0x3ea>
				case 15:
				case 16:
				{
					multiboot_uint16_t *pixel = fb + tagfb->common.framebuffer_pitch * i + 2 * i;
  800aad:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800ab1:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  800ab4:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  800ab8:	89 c2                	mov    edx,eax
  800aba:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800abd:	01 c0                	add    eax,eax
  800abf:	89 c0                	mov    eax,eax
  800ac1:	48 01 c2             	add    rdx,rax
  800ac4:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  800ac8:	48 01 d0             	add    rax,rdx
  800acb:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
					*pixel = color;
  800acf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800ad2:	89 c2                	mov    edx,eax
  800ad4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  800ad8:	66 89 10             	mov    WORD PTR [rax],dx
				}
				break;
  800adb:	eb 73                	jmp    800b50 <main+0x3ea>
				case 24:
				{
					multiboot_uint32_t *pixel = fb + tagfb->common.framebuffer_pitch * i + 3 * i;
  800add:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800ae1:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  800ae4:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  800ae8:	89 c1                	mov    ecx,eax
  800aea:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  800aed:	89 d0                	mov    eax,edx
  800aef:	01 c0                	add    eax,eax
  800af1:	01 d0                	add    eax,edx
  800af3:	89 c0                	mov    eax,eax
  800af5:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
  800af9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  800afd:	48 01 d0             	add    rax,rdx
  800b00:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
					*pixel = (color & 0xffffff) | (*pixel & 0xff000000);
  800b04:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800b07:	25 ff ff ff 00       	and    eax,0xffffff
  800b0c:	89 c2                	mov    edx,eax
  800b0e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  800b12:	8b 00                	mov    eax,DWORD PTR [rax]
  800b14:	25 00 00 00 ff       	and    eax,0xff000000
  800b19:	09 c2                	or     edx,eax
  800b1b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  800b1f:	89 10                	mov    DWORD PTR [rax],edx
				}
				break;
  800b21:	eb 2d                	jmp    800b50 <main+0x3ea>
				case 32:
				{
					multiboot_uint32_t *pixel = fb + tagfb->common.framebuffer_pitch * i + 4 * i;
  800b23:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800b27:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  800b2a:	0f af 45 e8          	imul   eax,DWORD PTR [rbp-0x18]
  800b2e:	89 c2                	mov    edx,eax
  800b30:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  800b33:	c1 e0 02             	shl    eax,0x2
  800b36:	89 c0                	mov    eax,eax
  800b38:	48 01 c2             	add    rdx,rax
  800b3b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  800b3f:	48 01 d0             	add    rax,rdx
  800b42:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
					*pixel = color;
  800b46:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  800b4a:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800b4d:	89 10                	mov    DWORD PTR [rax],edx
				}
				break;
  800b4f:	90                   	nop
			for (i = 0; i < tagfb->common.framebuffer_width && i < tagfb->common.framebuffer_height; i++)
  800b50:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  800b54:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800b58:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  800b5b:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  800b5e:	73 10                	jae    800b70 <main+0x40a>
  800b60:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800b64:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  800b67:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  800b6a:	0f 82 c4 fe ff ff    	jb     800a34 <main+0x2ce>
				}
			}
			break;
  800b70:	90                   	nop
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
  800b71:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800b75:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800b78:	83 c0 07             	add    eax,0x7
  800b7b:	89 c0                	mov    eax,eax
  800b7d:	83 e0 f8             	and    eax,0xfffffff8
  800b80:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
		 tag->type != MULTIBOOT_TAG_TYPE_END;
  800b84:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800b88:	8b 00                	mov    eax,DWORD PTR [rax]
  800b8a:	85 c0                	test   eax,eax
  800b8c:	0f 85 1c fc ff ff    	jne    8007ae <main+0x48>
		}
		}
	}
	tag = (struct multiboot_tag *)((multiboot_uint8_t *)tag + ((tag->size + 7) & ~7));
  800b92:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800b96:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800b99:	83 c0 07             	add    eax,0x7
  800b9c:	89 c0                	mov    eax,eax
  800b9e:	83 e0 f8             	and    eax,0xfffffff8
  800ba1:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
	//printf("Total mbi size 0x%x\n", (unsigned)tag - addr);
	char disk_count=*(char*)0x475;
  800ba5:	b8 75 04 00 00       	mov    eax,0x475
  800baa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800bad:	88 45 d3             	mov    BYTE PTR [rbp-0x2d],al
	//printf("disk count:%d\n",disk_count);
    //初始化区域
	init_paging();
  800bb0:	b8 00 00 00 00       	mov    eax,0x0
  800bb5:	e8 d4 05 00 00       	call   80118e <init_paging>
 	init_gdt();
  800bba:	b8 00 00 00 00       	mov    eax,0x0
  800bbf:	e8 59 40 00 00       	call   804c1d <init_gdt>
	init_int();
  800bc4:	b8 00 00 00 00       	mov    eax,0x0
  800bc9:	e8 32 f4 ff ff       	call   800000 <init_int>
	init_memory();
  800bce:	b8 00 00 00 00       	mov    eax,0x0
  800bd3:	e8 f3 08 00 00       	call   8014cb <init_memory>
	init_drvdev_man();
  800bd8:	b8 00 00 00 00       	mov    eax,0x0
  800bdd:	e8 8c 1f 00 00       	call   802b6e <init_drvdev_man>
	init_proc();
  800be2:	b8 00 00 00 00       	mov    eax,0x0
  800be7:	e8 6d 2e 00 00       	call   803a59 <init_proc>
    //自带驱动
    init_tty();
  800bec:	b8 00 00 00 00       	mov    eax,0x0
  800bf1:	e8 ec 7c 00 00       	call   8088e2 <init_tty>
    init_kb();
  800bf6:	b8 00 00 00 00       	mov    eax,0x0
  800bfb:	e8 01 4f 00 00       	call   805b01 <init_kb>
    init_disk();
  800c00:	b8 00 00 00 00       	mov    eax,0x0
  800c05:	e8 51 50 00 00       	call   805c5b <init_disk>

	init_vfs();
  800c0a:	b8 00 00 00 00       	mov    eax,0x0
  800c0f:	e8 f3 1e 00 00       	call   802b07 <init_vfs>
    //init_fat16();
	manage_proc_lock=0;
  800c14:	c7 05 62 8d 00 00 00 	mov    DWORD PTR [rip+0x8d62],0x0        # 809980 <manage_proc_lock>
  800c1b:	00 00 00 
    while (1);
  800c1e:	eb fe                	jmp    800c1e <main+0x4b8>

0000000000800c20 <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800c20:	f3 0f 1e fa          	endbr64 
  800c24:	55                   	push   rbp
  800c25:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800c28:	48 c7 05 d5 f3 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff3d5],0xb8000        # 400008 <video>
  800c2f:	00 80 0b 00 
    xpos=0;
  800c33:	c7 05 d3 f3 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff3d3],0x0        # 400010 <xpos>
  800c3a:	00 00 00 
    ypos=0;
  800c3d:	c7 05 cd f3 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff3cd],0x0        # 400014 <ypos>
  800c44:	00 00 00 
}
  800c47:	90                   	nop
  800c48:	5d                   	pop    rbp
  800c49:	c3                   	ret    

0000000000800c4a <itoa>:

static void itoa (char *buf, int base, int d)
{
  800c4a:	f3 0f 1e fa          	endbr64 
  800c4e:	55                   	push   rbp
  800c4f:	48 89 e5             	mov    rbp,rsp
  800c52:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800c56:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800c59:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800c5c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800c60:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800c64:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800c67:	48 98                	cdqe   
  800c69:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800c6d:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800c74:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800c78:	75 27                	jne    800ca1 <itoa+0x57>
  800c7a:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800c7e:	79 21                	jns    800ca1 <itoa+0x57>
    {
        *p++ = '-';
  800c80:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c84:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c88:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c8c:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800c8f:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800c94:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800c97:	f7 d8                	neg    eax
  800c99:	48 98                	cdqe   
  800c9b:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c9f:	eb 0d                	jmp    800cae <itoa+0x64>
    }
    else if (base == 'x')
  800ca1:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800ca5:	75 07                	jne    800cae <itoa+0x64>
        divisor = 16;
  800ca7:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800cae:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800cb1:	48 63 c8             	movsxd rcx,eax
  800cb4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800cb8:	ba 00 00 00 00       	mov    edx,0x0
  800cbd:	48 f7 f1             	div    rcx
  800cc0:	48 89 d0             	mov    rax,rdx
  800cc3:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800cc6:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800cca:	7f 0a                	jg     800cd6 <itoa+0x8c>
  800ccc:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800ccf:	83 c0 30             	add    eax,0x30
  800cd2:	89 c1                	mov    ecx,eax
  800cd4:	eb 08                	jmp    800cde <itoa+0x94>
  800cd6:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800cd9:	83 c0 57             	add    eax,0x57
  800cdc:	89 c1                	mov    ecx,eax
  800cde:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ce2:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800ce6:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800cea:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800cec:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800cef:	48 63 f0             	movsxd rsi,eax
  800cf2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800cf6:	ba 00 00 00 00       	mov    edx,0x0
  800cfb:	48 f7 f6             	div    rsi
  800cfe:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800d02:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800d07:	75 a5                	jne    800cae <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800d09:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800d0d:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800d10:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800d14:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800d18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800d1c:	48 83 e8 01          	sub    rax,0x1
  800d20:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800d24:	eb 2b                	jmp    800d51 <itoa+0x107>
    {
        char tmp = *p1;
  800d26:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800d2a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800d2d:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800d30:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800d34:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800d37:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800d3b:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800d3d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800d41:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800d45:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800d47:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800d4c:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800d51:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800d55:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800d59:	72 cb                	jb     800d26 <itoa+0xdc>
    }
}
  800d5b:	90                   	nop
  800d5c:	90                   	nop
  800d5d:	5d                   	pop    rbp
  800d5e:	c3                   	ret    

0000000000800d5f <putchar>:
 
/* 在屏幕上输出字符 C 。 */
static void putchar (int c)
{
  800d5f:	f3 0f 1e fa          	endbr64 
  800d63:	55                   	push   rbp
  800d64:	48 89 e5             	mov    rbp,rsp
  800d67:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if (c == '\n' || c == '\r')
  800d6a:	83 7d fc 0a          	cmp    DWORD PTR [rbp-0x4],0xa
  800d6e:	74 06                	je     800d76 <putchar+0x17>
  800d70:	83 7d fc 0d          	cmp    DWORD PTR [rbp-0x4],0xd
  800d74:	75 38                	jne    800dae <putchar+0x4f>
    {
newline:
  800d76:	90                   	nop
  800d77:	eb 01                	jmp    800d7a <putchar+0x1b>
    *(video + (xpos + ypos * COLUMNS) * 2) = c & 0xFF;
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
  800d79:	90                   	nop
        xpos = 0;
  800d7a:	c7 05 8c f2 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff28c],0x0        # 400010 <xpos>
  800d81:	00 00 00 
        ypos++;
  800d84:	8b 05 8a f2 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff28a]        # 400014 <ypos>
  800d8a:	83 c0 01             	add    eax,0x1
  800d8d:	89 05 81 f2 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff281],eax        # 400014 <ypos>
        if (ypos >= LINES)
  800d93:	8b 05 7b f2 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff27b]        # 400014 <ypos>
  800d99:	83 f8 17             	cmp    eax,0x17
  800d9c:	0f 8e 88 00 00 00    	jle    800e2a <putchar+0xcb>
            ypos = 0;
  800da2:	c7 05 68 f2 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff268],0x0        # 400014 <ypos>
  800da9:	00 00 00 
        return;
  800dac:	eb 7c                	jmp    800e2a <putchar+0xcb>
    *(video + (xpos + ypos * COLUMNS) * 2) = c & 0xFF;
  800dae:	48 8b 0d 53 f2 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbff253]        # 400008 <video>
  800db5:	8b 15 59 f2 bf ff    	mov    edx,DWORD PTR [rip+0xffffffffffbff259]        # 400014 <ypos>
  800dbb:	89 d0                	mov    eax,edx
  800dbd:	c1 e0 02             	shl    eax,0x2
  800dc0:	01 d0                	add    eax,edx
  800dc2:	c1 e0 04             	shl    eax,0x4
  800dc5:	89 c2                	mov    edx,eax
  800dc7:	8b 05 43 f2 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff243]        # 400010 <xpos>
  800dcd:	01 d0                	add    eax,edx
  800dcf:	01 c0                	add    eax,eax
  800dd1:	48 98                	cdqe   
  800dd3:	48 01 c8             	add    rax,rcx
  800dd6:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  800dd9:	88 10                	mov    BYTE PTR [rax],dl
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
  800ddb:	48 8b 0d 26 f2 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbff226]        # 400008 <video>
  800de2:	8b 15 2c f2 bf ff    	mov    edx,DWORD PTR [rip+0xffffffffffbff22c]        # 400014 <ypos>
  800de8:	89 d0                	mov    eax,edx
  800dea:	c1 e0 02             	shl    eax,0x2
  800ded:	01 d0                	add    eax,edx
  800def:	c1 e0 04             	shl    eax,0x4
  800df2:	89 c2                	mov    edx,eax
  800df4:	8b 05 16 f2 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff216]        # 400010 <xpos>
  800dfa:	01 d0                	add    eax,edx
  800dfc:	01 c0                	add    eax,eax
  800dfe:	48 98                	cdqe   
  800e00:	48 83 c0 01          	add    rax,0x1
  800e04:	48 01 c8             	add    rax,rcx
  800e07:	c6 00 07             	mov    BYTE PTR [rax],0x7
    xpos++;
  800e0a:	8b 05 00 f2 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff200]        # 400010 <xpos>
  800e10:	83 c0 01             	add    eax,0x1
  800e13:	89 05 f7 f1 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff1f7],eax        # 400010 <xpos>
    if (xpos >= COLUMNS)
  800e19:	8b 05 f1 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff1f1]        # 400010 <xpos>
  800e1f:	83 f8 4f             	cmp    eax,0x4f
  800e22:	0f 8f 51 ff ff ff    	jg     800d79 <putchar+0x1a>
  800e28:	eb 01                	jmp    800e2b <putchar+0xcc>
        return;
  800e2a:	90                   	nop
}
  800e2b:	5d                   	pop    rbp
  800e2c:	c3                   	ret    

0000000000800e2d <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800e2d:	f3 0f 1e fa          	endbr64 
  800e31:	55                   	push   rbp
  800e32:	48 89 e5             	mov    rbp,rsp
  800e35:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800e3c:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800e43:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800e4a:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800e51:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800e58:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800e5f:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800e66:	84 c0                	test   al,al
  800e68:	74 20                	je     800e8a <printf+0x5d>
  800e6a:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800e6e:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800e72:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800e76:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800e7a:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800e7e:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800e82:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800e86:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800e8a:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800e91:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    int c;
    char buf[20];
 
    arg++;
  800e98:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800e9f:	08 
 
    while ((c = *format++) != 0)
  800ea0:	e9 38 01 00 00       	jmp    800fdd <printf+0x1b0>
    {
        if (c != '%')
  800ea5:	83 bd 3c ff ff ff 25 	cmp    DWORD PTR [rbp-0xc4],0x25
  800eac:	74 12                	je     800ec0 <printf+0x93>
            putchar (c);
  800eae:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  800eb4:	89 c7                	mov    edi,eax
  800eb6:	e8 a4 fe ff ff       	call   800d5f <putchar>
  800ebb:	e9 1d 01 00 00       	jmp    800fdd <printf+0x1b0>
        else
        {
            char *p;
 
            c = *format++;
  800ec0:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800ec7:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800ecb:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800ed2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800ed5:	0f be c0             	movsx  eax,al
  800ed8:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
            switch (c)
  800ede:	83 bd 3c ff ff ff 78 	cmp    DWORD PTR [rbp-0xc4],0x78
  800ee5:	74 3a                	je     800f21 <printf+0xf4>
  800ee7:	83 bd 3c ff ff ff 78 	cmp    DWORD PTR [rbp-0xc4],0x78
  800eee:	0f 8f cd 00 00 00    	jg     800fc1 <printf+0x194>
  800ef4:	83 bd 3c ff ff ff 75 	cmp    DWORD PTR [rbp-0xc4],0x75
  800efb:	74 24                	je     800f21 <printf+0xf4>
  800efd:	83 bd 3c ff ff ff 75 	cmp    DWORD PTR [rbp-0xc4],0x75
  800f04:	0f 8f b7 00 00 00    	jg     800fc1 <printf+0x194>
  800f0a:	83 bd 3c ff ff ff 64 	cmp    DWORD PTR [rbp-0xc4],0x64
  800f11:	74 0e                	je     800f21 <printf+0xf4>
  800f13:	83 bd 3c ff ff ff 73 	cmp    DWORD PTR [rbp-0xc4],0x73
  800f1a:	74 40                	je     800f5c <printf+0x12f>
  800f1c:	e9 a0 00 00 00       	jmp    800fc1 <printf+0x194>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800f21:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800f28:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800f2c:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800f33:	8b 10                	mov    edx,DWORD PTR [rax]
  800f35:	8b 8d 3c ff ff ff    	mov    ecx,DWORD PTR [rbp-0xc4]
  800f3b:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800f42:	89 ce                	mov    esi,ecx
  800f44:	48 89 c7             	mov    rdi,rax
  800f47:	e8 fe fc ff ff       	call   800c4a <itoa>
                p = buf;
  800f4c:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800f53:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800f5a:	eb 34                	jmp    800f90 <printf+0x163>
                break;
 
            case 's':
                p = *arg++;
  800f5c:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800f63:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800f67:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800f6e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f71:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800f78:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800f7f:	00 
  800f80:	75 0d                	jne    800f8f <printf+0x162>
                    p = "(null)";
  800f82:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x809f30
  800f89:	30 9f 80 00 
  800f8d:	eb 22                	jmp    800fb1 <printf+0x184>
 
string:
  800f8f:	90                   	nop
                while (*p)
  800f90:	eb 1f                	jmp    800fb1 <printf+0x184>
                    putchar (*p++);
  800f92:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800f99:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800f9d:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800fa4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800fa7:	0f be c0             	movsx  eax,al
  800faa:	89 c7                	mov    edi,eax
  800fac:	e8 ae fd ff ff       	call   800d5f <putchar>
                while (*p)
  800fb1:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800fb8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800fbb:	84 c0                	test   al,al
  800fbd:	75 d3                	jne    800f92 <printf+0x165>
                break;
  800fbf:	eb 1c                	jmp    800fdd <printf+0x1b0>
 
            default:
                putchar (*((int *) arg++));
  800fc1:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800fc8:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800fcc:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800fd3:	8b 00                	mov    eax,DWORD PTR [rax]
  800fd5:	89 c7                	mov    edi,eax
  800fd7:	e8 83 fd ff ff       	call   800d5f <putchar>
                break;
  800fdc:	90                   	nop
    while ((c = *format++) != 0)
  800fdd:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800fe4:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800fe8:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800fef:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800ff2:	0f be c0             	movsx  eax,al
  800ff5:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
  800ffb:	83 bd 3c ff ff ff 00 	cmp    DWORD PTR [rbp-0xc4],0x0
  801002:	0f 85 9d fe ff ff    	jne    800ea5 <printf+0x78>
            }
        }
    }
}
  801008:	90                   	nop
  801009:	90                   	nop
  80100a:	c9                   	leave  
  80100b:	c3                   	ret    

000000000080100c <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  80100c:	f3 0f 1e fa          	endbr64 
  801010:	55                   	push   rbp
  801011:	48 89 e5             	mov    rbp,rsp
  801014:	48 83 ec 60          	sub    rsp,0x60
  801018:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  80101c:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
  801020:	89 55 ac             	mov    DWORD PTR [rbp-0x54],edx
    //内核空间映射不能更改
    if(la/PML4E_SIZE==0)return ERR;
  801023:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  80102a:	00 00 00 
  80102d:	48 39 45 b0          	cmp    QWORD PTR [rbp-0x50],rax
  801031:	77 0a                	ja     80103d <mmap+0x31>
  801033:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801038:	e9 27 01 00 00       	jmp    801164 <mmap+0x158>
    page_item *pdptp=pml4[la/PML4E_SIZE];//指向的pdpt表
  80103d:	48 8b 15 54 89 00 00 	mov    rdx,QWORD PTR [rip+0x8954]        # 809998 <pml4>
  801044:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  801048:	48 c1 e8 27          	shr    rax,0x27
  80104c:	48 c1 e0 03          	shl    rax,0x3
  801050:	48 01 d0             	add    rax,rdx
  801053:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801056:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  80105a:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  801061:	00 00 00 
  801064:	48 23 45 b0          	and    rax,QWORD PTR [rbp-0x50]
  801068:	48 c1 e8 1e          	shr    rax,0x1e
  80106c:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_item* pdp=pdptp[pdpti];//指向的pd
  80106f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801072:	48 98                	cdqe   
  801074:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80107b:	00 
  80107c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801080:	48 01 d0             	add    rax,rdx
  801083:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801086:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    if(*pdp&PAGE_PRESENT)return ALREADY_USED;//已分配pd
  80108a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80108e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801091:	83 e0 01             	and    eax,0x1
  801094:	48 85 c0             	test   rax,rax
  801097:	74 0a                	je     8010a3 <mmap+0x97>
  801099:	b8 fd ff ff ff       	mov    eax,0xfffffffd
  80109e:	e9 c1 00 00 00       	jmp    801164 <mmap+0x158>
    //分配pd
    addr_t pdaddr=vmalloc();
  8010a3:	b8 00 00 00 00       	mov    eax,0x0
  8010a8:	e8 f4 01 00 00       	call   8012a1 <vmalloc>
  8010ad:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    *pdp=pdaddr&PAGE_MASK|attr;
  8010b1:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  8010b8:	ff 00 00 
  8010bb:	48 23 45 e0          	and    rax,QWORD PTR [rbp-0x20]
  8010bf:	48 89 c2             	mov    rdx,rax
  8010c2:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8010c5:	48 09 c2             	or     rdx,rax
  8010c8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8010cc:	48 89 10             	mov    QWORD PTR [rax],rdx
    page_item* ptp=pdp[la%PDPTE_SIZE/PDE_SIZE];
  8010cf:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8010d3:	25 ff ff ff 3f       	and    eax,0x3fffffff
  8010d8:	48 c1 e8 15          	shr    rax,0x15
  8010dc:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8010e3:	00 
  8010e4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8010e8:	48 01 d0             	add    rax,rdx
  8010eb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8010ee:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    //新分配的pd里面肯定没有已经被占用的项
    //if(*ptp&PAGE_PRESENT)return -1;//已分配pt
    //分配pt
    addr_t ptaddr=vmalloc();
  8010f2:	b8 00 00 00 00       	mov    eax,0x0
  8010f7:	e8 a5 01 00 00       	call   8012a1 <vmalloc>
  8010fc:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    *ptp=ptaddr&PAGE_MASK|attr;
  801100:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  801107:	ff 00 00 
  80110a:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  80110e:	48 89 c2             	mov    rdx,rax
  801111:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  801114:	48 09 c2             	or     rdx,rax
  801117:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80111b:	48 89 10             	mov    QWORD PTR [rax],rdx
    page_item* pte=ptp[la%PDE_SIZE/PAGE_SIZE];
  80111e:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  801122:	25 ff ff 1f 00       	and    eax,0x1fffff
  801127:	48 c1 e8 0c          	shr    rax,0xc
  80112b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  801132:	00 
  801133:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801137:	48 01 d0             	add    rax,rdx
  80113a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80113d:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    *pte=pa&PAGE_MASK|attr;//映射
  801141:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  801148:	ff 00 00 
  80114b:	48 23 45 b8          	and    rax,QWORD PTR [rbp-0x48]
  80114f:	48 89 c2             	mov    rdx,rax
  801152:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  801155:	48 09 c2             	or     rdx,rax
  801158:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80115c:	48 89 10             	mov    QWORD PTR [rax],rdx
    return NORMAL;
  80115f:	b8 00 00 00 00       	mov    eax,0x0
}
  801164:	c9                   	leave  
  801165:	c3                   	ret    

0000000000801166 <mdemap>:

stat_t mdemap(addr_t la)
{
  801166:	f3 0f 1e fa          	endbr64 
  80116a:	55                   	push   rbp
  80116b:	48 89 e5             	mov    rbp,rsp
  80116e:	48 83 ec 10          	sub    rsp,0x10
  801172:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  801176:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80117a:	ba 00 00 00 00       	mov    edx,0x0
  80117f:	48 89 c6             	mov    rsi,rax
  801182:	bf 00 00 00 00       	mov    edi,0x0
  801187:	e8 80 fe ff ff       	call   80100c <mmap>
}
  80118c:	c9                   	leave  
  80118d:	c3                   	ret    

000000000080118e <init_paging>:
int init_paging()
{
  80118e:	f3 0f 1e fa          	endbr64 
  801192:	55                   	push   rbp
  801193:	48 89 e5             	mov    rbp,rsp
                    "mov %%cr0,%%rax\r\n"
                    "or $0x80000000,%%eax\r\n"
                    "mov %%rax,%%cr0":"=m"(page_index));
    #else
    //设置PML4
    set_page_item(pml4,PDPT_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);
  801196:	48 8b 05 fb 87 00 00 	mov    rax,QWORD PTR [rip+0x87fb]        # 809998 <pml4>
  80119d:	ba 07 00 00 00       	mov    edx,0x7
  8011a2:	be 00 10 10 00       	mov    esi,0x101000
  8011a7:	48 89 c7             	mov    rdi,rax
  8011aa:	e8 cb 04 00 00       	call   80167a <set_page_item>
    set_1gb_pdpt(pdpt,0x40000000ul,PAGE_RWX);//设置PDPT
  8011af:	48 8b 05 ea 87 00 00 	mov    rax,QWORD PTR [rip+0x87ea]        # 8099a0 <pdpt>
  8011b6:	ba 02 00 00 00       	mov    edx,0x2
  8011bb:	be 00 00 00 40       	mov    esi,0x40000000
  8011c0:	48 89 c7             	mov    rdi,rax
  8011c3:	e8 03 05 00 00       	call   8016cb <set_1gb_pdpt>
    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);
  8011c8:	48 8b 05 d1 87 00 00 	mov    rax,QWORD PTR [rip+0x87d1]        # 8099a0 <pdpt>
  8011cf:	48 83 c0 08          	add    rax,0x8
  8011d3:	ba 07 00 00 00       	mov    edx,0x7
  8011d8:	be 00 20 10 00       	mov    esi,0x102000
  8011dd:	48 89 c7             	mov    rdi,rax
  8011e0:	e8 95 04 00 00       	call   80167a <set_page_item>
    //打开PAE(physical address extension)
    asm volatile("mov %cr4,%rax\r\n or $5,%rax\r\n mov %rax,%cr4");
  8011e5:	0f 20 e0             	mov    rax,cr4
  8011e8:	48 83 c8 05          	or     rax,0x5
  8011ec:	0f 22 e0             	mov    cr4,rax
    //加载PML4
    asm volatile("mov %0,%%rax\r\n mov %%rax,%%cr4":"=m"(pml4));
  8011ef:	48 8b 05 a2 87 00 00 	mov    rax,QWORD PTR [rip+0x87a2]        # 809998 <pml4>
  8011f6:	0f 22 e0             	mov    cr4,rax
    //打开分页机制
    asm volatile("mov %cr0,%rax\r\n"
  8011f9:	0f 20 c0             	mov    rax,cr0
  8011fc:	0d 00 00 00 80       	or     eax,0x80000000
  801201:	0f 22 c0             	mov    cr0,rax
                    "or $0x80000000,%eax\r\n"
                    "mov %rax,%cr0");
    #endif
}
  801204:	90                   	nop
  801205:	5d                   	pop    rbp
  801206:	c3                   	ret    

0000000000801207 <set_high_mem_base>:
void set_high_mem_base(int base)
{
  801207:	f3 0f 1e fa          	endbr64 
  80120b:	55                   	push   rbp
  80120c:	48 89 e5             	mov    rbp,rsp
  80120f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  801212:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801215:	89 05 95 87 00 00    	mov    DWORD PTR [rip+0x8795],eax        # 8099b0 <high_mem_base>
}
  80121b:	90                   	nop
  80121c:	5d                   	pop    rbp
  80121d:	c3                   	ret    

000000000080121e <set_mem_area>:
void set_mem_area(int base,int len,int type)
{
  80121e:	f3 0f 1e fa          	endbr64 
  801222:	55                   	push   rbp
  801223:	48 89 e5             	mov    rbp,rsp
  801226:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  801229:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  80122c:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    mmap_struct[mmap_t_i].base=base;
  80122f:	8b 05 fb ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfeffb]        # 400230 <mmap_t_i>
  801235:	48 63 d0             	movsxd rdx,eax
  801238:	48 89 d0             	mov    rax,rdx
  80123b:	48 01 c0             	add    rax,rax
  80123e:	48 01 d0             	add    rax,rdx
  801241:	48 c1 e0 02          	shl    rax,0x2
  801245:	48 8d 90 40 01 40 00 	lea    rdx,[rax+0x400140]
  80124c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80124f:	89 02                	mov    DWORD PTR [rdx],eax
    mmap_struct[mmap_t_i].len=len;
  801251:	8b 05 d9 ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfefd9]        # 400230 <mmap_t_i>
  801257:	48 63 d0             	movsxd rdx,eax
  80125a:	48 89 d0             	mov    rax,rdx
  80125d:	48 01 c0             	add    rax,rax
  801260:	48 01 d0             	add    rax,rdx
  801263:	48 c1 e0 02          	shl    rax,0x2
  801267:	48 8d 90 44 01 40 00 	lea    rdx,[rax+0x400144]
  80126e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801271:	89 02                	mov    DWORD PTR [rdx],eax
    mmap_struct[mmap_t_i++].type=type;
  801273:	8b 05 b7 ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfefb7]        # 400230 <mmap_t_i>
  801279:	8d 50 01             	lea    edx,[rax+0x1]
  80127c:	89 15 ae ef bf ff    	mov    DWORD PTR [rip+0xffffffffffbfefae],edx        # 400230 <mmap_t_i>
  801282:	48 63 d0             	movsxd rdx,eax
  801285:	48 89 d0             	mov    rax,rdx
  801288:	48 01 c0             	add    rax,rax
  80128b:	48 01 d0             	add    rax,rdx
  80128e:	48 c1 e0 02          	shl    rax,0x2
  801292:	48 8d 90 48 01 40 00 	lea    rdx,[rax+0x400148]
  801299:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80129c:	89 02                	mov    DWORD PTR [rdx],eax
}
  80129e:	90                   	nop
  80129f:	5d                   	pop    rbp
  8012a0:	c3                   	ret    

00000000008012a1 <vmalloc>:
addr_t vmalloc()
{
  8012a1:	f3 0f 1e fa          	endbr64 
  8012a5:	55                   	push   rbp
  8012a6:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8012a9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8012b0:	eb 76                	jmp    801328 <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  8012b2:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8012b9:	eb 63                	jmp    80131e <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  8012bb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012be:	48 98                	cdqe   
  8012c0:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [rax*4+0x400120]
  8012c7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8012ca:	be 01 00 00 00       	mov    esi,0x1
  8012cf:	89 c1                	mov    ecx,eax
  8012d1:	d3 e6                	shl    esi,cl
  8012d3:	89 f0                	mov    eax,esi
  8012d5:	21 d0                	and    eax,edx
  8012d7:	85 c0                	test   eax,eax
  8012d9:	75 3f                	jne    80131a <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  8012db:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012de:	48 98                	cdqe   
  8012e0:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [rax*4+0x400120]
  8012e7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8012ea:	be 01 00 00 00       	mov    esi,0x1
  8012ef:	89 c1                	mov    ecx,eax
  8012f1:	d3 e6                	shl    esi,cl
  8012f3:	89 f0                	mov    eax,esi
  8012f5:	09 c2                	or     edx,eax
  8012f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012fa:	48 98                	cdqe   
  8012fc:	89 14 85 20 01 40 00 	mov    DWORD PTR [rax*4+0x400120],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  801303:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801306:	c1 e0 05             	shl    eax,0x5
  801309:	89 c2                	mov    edx,eax
  80130b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80130e:	01 d0                	add    eax,edx
  801310:	83 c0 20             	add    eax,0x20
  801313:	c1 e0 0c             	shl    eax,0xc
  801316:	48 98                	cdqe   
  801318:	eb 14                	jmp    80132e <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  80131a:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80131e:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801322:	7e 97                	jle    8012bb <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  801324:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801328:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  80132c:	7e 84                	jle    8012b2 <vmalloc+0x11>
            }
        }
    }
}
  80132e:	5d                   	pop    rbp
  80132f:	c3                   	ret    

0000000000801330 <vmfree>:

int vmfree(addr_t ptr)
{
  801330:	f3 0f 1e fa          	endbr64 
  801334:	55                   	push   rbp
  801335:	48 89 e5             	mov    rbp,rsp
  801338:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  80133c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801340:	48 c1 e8 0c          	shr    rax,0xc
  801344:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  801347:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80134a:	8d 50 1f             	lea    edx,[rax+0x1f]
  80134d:	85 c0                	test   eax,eax
  80134f:	0f 48 c2             	cmovs  eax,edx
  801352:	c1 f8 05             	sar    eax,0x5
  801355:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  801358:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80135b:	99                   	cdq    
  80135c:	c1 ea 1b             	shr    edx,0x1b
  80135f:	01 d0                	add    eax,edx
  801361:	83 e0 1f             	and    eax,0x1f
  801364:	29 d0                	sub    eax,edx
  801366:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  801369:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80136c:	48 98                	cdqe   
  80136e:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [rax*4+0x400120]
  801375:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801378:	be 01 00 00 00       	mov    esi,0x1
  80137d:	89 c1                	mov    ecx,eax
  80137f:	d3 e6                	shl    esi,cl
  801381:	89 f0                	mov    eax,esi
  801383:	f7 d0                	not    eax
  801385:	21 c2                	and    edx,eax
  801387:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80138a:	48 98                	cdqe   
  80138c:	89 14 85 20 01 40 00 	mov    DWORD PTR [rax*4+0x400120],edx
}
  801393:	90                   	nop
  801394:	5d                   	pop    rbp
  801395:	c3                   	ret    

0000000000801396 <page_err>:
void page_err(){
  801396:	f3 0f 1e fa          	endbr64 
  80139a:	55                   	push   rbp
  80139b:	48 89 e5             	mov    rbp,rsp
  80139e:	48 83 ec 30          	sub    rsp,0x30
    asm("cli");
  8013a2:	fa                   	cli    
    //puts("page err");
    unsigned long err_code=0,l_addr=0;
  8013a3:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8013aa:	00 
  8013ab:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8013b2:	00 
    asm volatile("mov 4(%%ebp),%0":"=r"(err_code));
  8013b3:	67 48 8b 45 04       	mov    rax,QWORD PTR [ebp+0x4]
  8013b8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  8013bc:	0f 20 d0             	mov    rax,cr2
  8013bf:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int p=err_code&1;
  8013c3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8013c7:	83 e0 01             	and    eax,0x1
  8013ca:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

    if(!p)
  8013cd:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  8013d1:	0f 85 e1 00 00 00    	jne    8014b8 <page_err+0x122>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        int *pdet=0,*pt=0;
  8013d7:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  8013de:	00 
  8013df:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8013e6:	00 
        asm volatile("mov %%cr3,%0":"=r"(pdet));
  8013e7:	0f 20 d8             	mov    rax,cr3
  8013ea:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        if(!(pdet[l_addr/PAGE_INDEX_SIZE]&PAGE_PRESENT))
  8013ee:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8013f2:	48 c1 e8 16          	shr    rax,0x16
  8013f6:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8013fd:	00 
  8013fe:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801402:	48 01 d0             	add    rax,rdx
  801405:	8b 00                	mov    eax,DWORD PTR [rax]
  801407:	83 e0 01             	and    eax,0x1
  80140a:	85 c0                	test   eax,eax
  80140c:	75 32                	jne    801440 <page_err+0xaa>
        {
            //PDE没分配
            pt=(int *)vmalloc();
  80140e:	b8 00 00 00 00       	mov    eax,0x0
  801413:	e8 89 fe ff ff       	call   8012a1 <vmalloc>
  801418:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
            pdet[l_addr/PAGE_INDEX_SIZE]=(int)pt|PAGE_PRESENT|PAGE_FOR_ALL;
  80141c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801420:	89 c2                	mov    edx,eax
  801422:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801426:	48 c1 e8 16          	shr    rax,0x16
  80142a:	48 8d 0c 85 00 00 00 	lea    rcx,[rax*4+0x0]
  801431:	00 
  801432:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801436:	48 01 c8             	add    rax,rcx
  801439:	83 ca 05             	or     edx,0x5
  80143c:	89 10                	mov    DWORD PTR [rax],edx
  80143e:	eb 24                	jmp    801464 <page_err+0xce>
        }else
            pt=pdet[l_addr/PAGE_INDEX_SIZE]&0xfffff000;
  801440:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801444:	48 c1 e8 16          	shr    rax,0x16
  801448:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80144f:	00 
  801450:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  801454:	48 01 d0             	add    rax,rdx
  801457:	8b 00                	mov    eax,DWORD PTR [rax]
  801459:	89 c0                	mov    eax,eax
  80145b:	25 00 f0 ff ff       	and    eax,0xfffff000
  801460:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        //分配PTE
        int ptei=l_addr%PAGE_INDEX_SIZE/PAGE_SIZE;
  801464:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801468:	25 ff ff 3f 00       	and    eax,0x3fffff
  80146d:	48 c1 e8 0c          	shr    rax,0xc
  801471:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
        pt[ptei]|=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL;
  801474:	b8 00 00 00 00       	mov    eax,0x0
  801479:	e8 7c 00 00 00       	call   8014fa <req_a_page>
  80147e:	89 c7                	mov    edi,eax
  801480:	e8 e2 01 00 00       	call   801667 <get_phyaddr>
  801485:	83 c8 05             	or     eax,0x5
  801488:	89 c1                	mov    ecx,eax
  80148a:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80148d:	48 98                	cdqe   
  80148f:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801496:	00 
  801497:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80149b:	48 01 d0             	add    rax,rdx
  80149e:	8b 10                	mov    edx,DWORD PTR [rax]
  8014a0:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8014a3:	48 98                	cdqe   
  8014a5:	48 8d 34 85 00 00 00 	lea    rsi,[rax*4+0x0]
  8014ac:	00 
  8014ad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8014b1:	48 01 f0             	add    rax,rsi
  8014b4:	09 ca                	or     edx,ecx
  8014b6:	89 10                	mov    DWORD PTR [rax],edx
    }
    //杀死问题进程
    del_proc(cur_proc);*/
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  8014b8:	b8 00 00 00 00       	mov    eax,0x0
  8014bd:	e8 07 37 00 00       	call   804bc9 <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n leave\r\n add $4,%esp \r\n iret");
  8014c2:	fb                   	sti    
  8014c3:	c9                   	leave  
  8014c4:	83 c4 04             	add    esp,0x4
  8014c7:	cf                   	iret   
}
  8014c8:	90                   	nop
  8014c9:	c9                   	leave  
  8014ca:	c3                   	ret    

00000000008014cb <init_memory>:
void init_memory()
{
  8014cb:	f3 0f 1e fa          	endbr64 
  8014cf:	55                   	push   rbp
  8014d0:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<8;i++){
  8014d3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8014da:	eb 14                	jmp    8014f0 <init_memory+0x25>
        page_map[i]=0xffffffff;
  8014dc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014df:	48 98                	cdqe   
  8014e1:	c7 04 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],0xffffffff
  8014e8:	ff ff ff ff 
    for(int i=0;i<8;i++){
  8014ec:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8014f0:	83 7d fc 07          	cmp    DWORD PTR [rbp-0x4],0x7
  8014f4:	7e e6                	jle    8014dc <init_memory+0x11>
    剩下正常。
    asm volatile("mov ")
     */
    //page_index[768]=page_index[7];
    //page_index[7]=0;
}
  8014f6:	90                   	nop
  8014f7:	90                   	nop
  8014f8:	5d                   	pop    rbp
  8014f9:	c3                   	ret    

00000000008014fa <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  8014fa:	f3 0f 1e fa          	endbr64 
  8014fe:	55                   	push   rbp
  8014ff:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801502:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801509:	e9 8c 00 00 00       	jmp    80159a <req_a_page+0xa0>
        for(int j=0;j<32;j++){
  80150e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801515:	eb 79                	jmp    801590 <req_a_page+0x96>
            unsigned int bit=page_map[i]&(1<<j);
  801517:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80151a:	48 98                	cdqe   
  80151c:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  801523:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801526:	be 01 00 00 00       	mov    esi,0x1
  80152b:	89 c1                	mov    ecx,eax
  80152d:	d3 e6                	shl    esi,cl
  80152f:	89 f0                	mov    eax,esi
  801531:	21 d0                	and    eax,edx
  801533:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  801536:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801539:	c1 e0 05             	shl    eax,0x5
  80153c:	89 c2                	mov    edx,eax
  80153e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801541:	01 d0                	add    eax,edx
  801543:	c1 e0 0c             	shl    eax,0xc
  801546:	3d ff ff 0f 00       	cmp    eax,0xfffff
  80154b:	7e 3f                	jle    80158c <req_a_page+0x92>
  80154d:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  801551:	75 39                	jne    80158c <req_a_page+0x92>
            {
                page_map[i]=page_map[i]|(1<<j);
  801553:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801556:	48 98                	cdqe   
  801558:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  80155f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801562:	be 01 00 00 00       	mov    esi,0x1
  801567:	89 c1                	mov    ecx,eax
  801569:	d3 e6                	shl    esi,cl
  80156b:	89 f0                	mov    eax,esi
  80156d:	09 c2                	or     edx,eax
  80156f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801572:	48 98                	cdqe   
  801574:	89 14 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],edx
                return i*32+j;//num of page
  80157b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80157e:	c1 e0 05             	shl    eax,0x5
  801581:	89 c2                	mov    edx,eax
  801583:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801586:	01 d0                	add    eax,edx
  801588:	48 98                	cdqe   
  80158a:	eb 18                	jmp    8015a4 <req_a_page+0xaa>
        for(int j=0;j<32;j++){
  80158c:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801590:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801594:	7e 81                	jle    801517 <req_a_page+0x1d>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801596:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80159a:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80159e:	0f 8e 6a ff ff ff    	jle    80150e <req_a_page+0x14>

            }
        }
    }
}
  8015a4:	5d                   	pop    rbp
  8015a5:	c3                   	ret    

00000000008015a6 <free_page>:

int free_page(char *paddr){
  8015a6:	f3 0f 1e fa          	endbr64 
  8015aa:	55                   	push   rbp
  8015ab:	48 89 e5             	mov    rbp,rsp
  8015ae:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  8015b2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8015b6:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8015bc:	85 c0                	test   eax,eax
  8015be:	0f 48 c2             	cmovs  eax,edx
  8015c1:	c1 f8 0c             	sar    eax,0xc
  8015c4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8015c7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015ca:	8d 50 1f             	lea    edx,[rax+0x1f]
  8015cd:	85 c0                	test   eax,eax
  8015cf:	0f 48 c2             	cmovs  eax,edx
  8015d2:	c1 f8 05             	sar    eax,0x5
  8015d5:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8015d8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015db:	99                   	cdq    
  8015dc:	c1 ea 1b             	shr    edx,0x1b
  8015df:	01 d0                	add    eax,edx
  8015e1:	83 e0 1f             	and    eax,0x1f
  8015e4:	29 d0                	sub    eax,edx
  8015e6:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  8015e9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8015ec:	48 98                	cdqe   
  8015ee:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  8015f5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8015f8:	be 01 00 00 00       	mov    esi,0x1
  8015fd:	89 c1                	mov    ecx,eax
  8015ff:	d3 e6                	shl    esi,cl
  801601:	89 f0                	mov    eax,esi
  801603:	f7 d0                	not    eax
  801605:	21 c2                	and    edx,eax
  801607:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80160a:	48 98                	cdqe   
  80160c:	89 14 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],edx
}
  801613:	90                   	nop
  801614:	5d                   	pop    rbp
  801615:	c3                   	ret    

0000000000801616 <check_page>:
int check_page(int num){
  801616:	f3 0f 1e fa          	endbr64 
  80161a:	55                   	push   rbp
  80161b:	48 89 e5             	mov    rbp,rsp
  80161e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  801621:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801624:	8d 50 1f             	lea    edx,[rax+0x1f]
  801627:	85 c0                	test   eax,eax
  801629:	0f 48 c2             	cmovs  eax,edx
  80162c:	c1 f8 05             	sar    eax,0x5
  80162f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  801632:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801635:	99                   	cdq    
  801636:	c1 ea 1b             	shr    edx,0x1b
  801639:	01 d0                	add    eax,edx
  80163b:	83 e0 1f             	and    eax,0x1f
  80163e:	29 d0                	sub    eax,edx
  801640:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  801643:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801646:	48 98                	cdqe   
  801648:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  80164f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801652:	be 01 00 00 00       	mov    esi,0x1
  801657:	89 c1                	mov    ecx,eax
  801659:	d3 e6                	shl    esi,cl
  80165b:	89 f0                	mov    eax,esi
  80165d:	21 d0                	and    eax,edx
  80165f:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  801662:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  801665:	5d                   	pop    rbp
  801666:	c3                   	ret    

0000000000801667 <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  801667:	f3 0f 1e fa          	endbr64 
  80166b:	55                   	push   rbp
  80166c:	48 89 e5             	mov    rbp,rsp
  80166f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  801672:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801675:	c1 e0 0c             	shl    eax,0xc
}
  801678:	5d                   	pop    rbp
  801679:	c3                   	ret    

000000000080167a <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  80167a:	f3 0f 1e fa          	endbr64 
  80167e:	55                   	push   rbp
  80167f:	48 89 e5             	mov    rbp,rsp
  801682:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801686:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  801689:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  80168c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801690:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  801697:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80169b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80169e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8016a1:	89 c0                	mov    eax,eax
  8016a3:	25 00 f0 ff ff       	and    eax,0xfffff000
  8016a8:	48 09 c2             	or     rdx,rax
  8016ab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8016af:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  8016b2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8016b6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8016b9:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8016bc:	48 98                	cdqe   
  8016be:	48 09 c2             	or     rdx,rax
  8016c1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8016c5:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8016c8:	90                   	nop
  8016c9:	5d                   	pop    rbp
  8016ca:	c3                   	ret    

00000000008016cb <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  8016cb:	f3 0f 1e fa          	endbr64 
  8016cf:	55                   	push   rbp
  8016d0:	48 89 e5             	mov    rbp,rsp
  8016d3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8016d7:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  8016da:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  8016dd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016e1:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  8016e8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016ec:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8016ef:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8016f2:	0c 81                	or     al,0x81
  8016f4:	89 c0                	mov    eax,eax
  8016f6:	48 09 c2             	or     rdx,rax
  8016f9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016fd:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  801700:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801703:	25 00 00 00 c0       	and    eax,0xc0000000
  801708:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  80170b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80170f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801712:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801715:	48 09 c2             	or     rdx,rax
  801718:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80171c:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80171f:	90                   	nop
  801720:	5d                   	pop    rbp
  801721:	c3                   	ret    

0000000000801722 <set_2mb_pde>:
void set_2mb_pde(page_item* pde,int pa)
{
  801722:	f3 0f 1e fa          	endbr64 
  801726:	55                   	push   rbp
  801727:	48 89 e5             	mov    rbp,rsp
  80172a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80172e:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    *pde=0;
  801731:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801735:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT;
  80173c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801740:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801743:	48 0d 81 10 00 00    	or     rax,0x1081
  801749:	48 89 c2             	mov    rdx,rax
  80174c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801750:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  801753:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801756:	25 00 00 c0 ff       	and    eax,0xffc00000
  80175b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  80175e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801762:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801765:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801768:	48 09 c2             	or     rdx,rax
  80176b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80176f:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801772:	90                   	nop
  801773:	5d                   	pop    rbp
  801774:	c3                   	ret    

0000000000801775 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  801775:	f3 0f 1e fa          	endbr64 
  801779:	55                   	push   rbp
  80177a:	48 89 e5             	mov    rbp,rsp
  80177d:	48 83 ec 20          	sub    rsp,0x20
  801781:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801785:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  801788:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  80178d:	75 18                	jne    8017a7 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  80178f:	b8 00 00 00 00       	mov    eax,0x0
  801794:	e8 61 fd ff ff       	call   8014fa <req_a_page>
  801799:	89 c7                	mov    edi,eax
  80179b:	e8 c7 fe ff ff       	call   801667 <get_phyaddr>
  8017a0:	48 98                	cdqe   
  8017a2:	e9 8e 00 00 00       	jmp    801835 <req_page_at+0xc0>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  8017a7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8017ab:	89 c2                	mov    edx,eax
  8017ad:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8017b0:	89 c6                	mov    esi,eax
  8017b2:	89 d7                	mov    edi,edx
  8017b4:	e8 3b 01 00 00       	call   8018f4 <is_pgs_ava>
  8017b9:	85 c0                	test   eax,eax
  8017bb:	75 09                	jne    8017c6 <req_page_at+0x51>
  8017bd:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  8017c4:	eb 6f                	jmp    801835 <req_page_at+0xc0>
    int pgni=base/4096;
  8017c6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8017ca:	48 c1 e8 0c          	shr    rax,0xc
  8017ce:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  8017d1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017d4:	8d 50 1f             	lea    edx,[rax+0x1f]
  8017d7:	85 c0                	test   eax,eax
  8017d9:	0f 48 c2             	cmovs  eax,edx
  8017dc:	c1 f8 05             	sar    eax,0x5
  8017df:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  8017e2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017e5:	99                   	cdq    
  8017e6:	c1 ea 1b             	shr    edx,0x1b
  8017e9:	01 d0                	add    eax,edx
  8017eb:	83 e0 1f             	and    eax,0x1f
  8017ee:	29 d0                	sub    eax,edx
  8017f0:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  8017f3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8017fa:	eb 2c                	jmp    801828 <req_page_at+0xb3>
    {
        page_map[i]|=(1<<pgj);
  8017fc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017ff:	48 98                	cdqe   
  801801:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  801808:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80180b:	be 01 00 00 00       	mov    esi,0x1
  801810:	89 c1                	mov    ecx,eax
  801812:	d3 e6                	shl    esi,cl
  801814:	89 f0                	mov    eax,esi
  801816:	09 c2                	or     edx,eax
  801818:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80181b:	48 98                	cdqe   
  80181d:	89 14 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],edx
    for(int i=0;i<pgn;i++)
  801824:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801828:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80182b:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80182e:	7c cc                	jl     8017fc <req_page_at+0x87>
    }
    return 0;
  801830:	b8 00 00 00 00       	mov    eax,0x0

}
  801835:	c9                   	leave  
  801836:	c3                   	ret    

0000000000801837 <chk_vm>:
int chk_vm(int base, int pgn)
{
  801837:	f3 0f 1e fa          	endbr64 
  80183b:	55                   	push   rbp
  80183c:	48 89 e5             	mov    rbp,rsp
  80183f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801842:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  801845:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80184c:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  80184d:	0f 20 d8             	mov    rax,cr3
  801850:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  801854:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801857:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  80185d:	85 c0                	test   eax,eax
  80185f:	0f 48 c2             	cmovs  eax,edx
  801862:	c1 f8 16             	sar    eax,0x16
  801865:	48 98                	cdqe   
  801867:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80186e:	00 
  80186f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801873:	48 01 d0             	add    rax,rdx
  801876:	8b 00                	mov    eax,DWORD PTR [rax]
  801878:	89 c0                	mov    eax,eax
  80187a:	25 00 f0 ff ff       	and    eax,0xfffff000
  80187f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801883:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801886:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  80188c:	85 c0                	test   eax,eax
  80188e:	0f 48 c2             	cmovs  eax,edx
  801891:	c1 f8 16             	sar    eax,0x16
  801894:	48 98                	cdqe   
  801896:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80189d:	00 
  80189e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8018a2:	48 01 d0             	add    rax,rdx
  8018a5:	8b 00                	mov    eax,DWORD PTR [rax]
  8018a7:	83 e0 01             	and    eax,0x1
  8018aa:	85 c0                	test   eax,eax
  8018ac:	74 38                	je     8018e6 <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  8018ae:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8018b1:	99                   	cdq    
  8018b2:	c1 ea 0a             	shr    edx,0xa
  8018b5:	01 d0                	add    eax,edx
  8018b7:	25 ff ff 3f 00       	and    eax,0x3fffff
  8018bc:	29 d0                	sub    eax,edx
  8018be:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8018c4:	85 c0                	test   eax,eax
  8018c6:	0f 48 c2             	cmovs  eax,edx
  8018c9:	c1 f8 0c             	sar    eax,0xc
  8018cc:	48 98                	cdqe   
  8018ce:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8018d5:	00 
  8018d6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8018da:	48 01 d0             	add    rax,rdx
  8018dd:	8b 00                	mov    eax,DWORD PTR [rax]
  8018df:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  8018e2:	85 c0                	test   eax,eax
  8018e4:	75 07                	jne    8018ed <chk_vm+0xb6>
    {
        return -1;
  8018e6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8018eb:	eb 05                	jmp    8018f2 <chk_vm+0xbb>
    }
    return 0;
  8018ed:	b8 00 00 00 00       	mov    eax,0x0
}
  8018f2:	5d                   	pop    rbp
  8018f3:	c3                   	ret    

00000000008018f4 <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  8018f4:	f3 0f 1e fa          	endbr64 
  8018f8:	55                   	push   rbp
  8018f9:	48 89 e5             	mov    rbp,rsp
  8018fc:	48 83 ec 18          	sub    rsp,0x18
  801900:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801903:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  801906:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801909:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80190f:	85 c0                	test   eax,eax
  801911:	0f 48 c2             	cmovs  eax,edx
  801914:	c1 f8 0c             	sar    eax,0xc
  801917:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  80191a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801921:	eb 1e                	jmp    801941 <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801923:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801926:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801929:	01 d0                	add    eax,edx
  80192b:	89 c7                	mov    edi,eax
  80192d:	e8 e4 fc ff ff       	call   801616 <check_page>
  801932:	85 c0                	test   eax,eax
  801934:	74 07                	je     80193d <is_pgs_ava+0x49>
  801936:	b8 00 00 00 00       	mov    eax,0x0
  80193b:	eb 11                	jmp    80194e <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  80193d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801941:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801944:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  801947:	7c da                	jl     801923 <is_pgs_ava+0x2f>
    }
    return 1;
  801949:	b8 01 00 00 00       	mov    eax,0x1

}
  80194e:	c9                   	leave  
  80194f:	c3                   	ret    

0000000000801950 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  801950:	f3 0f 1e fa          	endbr64 
  801954:	55                   	push   rbp
  801955:	48 89 e5             	mov    rbp,rsp
  801958:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80195c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  801960:	c6 05 d9 e8 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe8d9],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  801967:	c6 05 d3 e8 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe8d3],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  80196e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801972:	48 89 05 cf e8 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe8cf],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  801979:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80197d:	48 89 05 cc e8 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe8cc],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  801984:	c7 05 d2 e8 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe8d2],0x1        # 400260 <vols+0x20>
  80198b:	00 00 00 
    return 0;
  80198e:	b8 00 00 00 00       	mov    eax,0x0
}
  801993:	5d                   	pop    rbp
  801994:	c3                   	ret    

0000000000801995 <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  801995:	f3 0f 1e fa          	endbr64 
  801999:	55                   	push   rbp
  80199a:	48 89 e5             	mov    rbp,rsp
  80199d:	48 83 ec 20          	sub    rsp,0x20
  8019a1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  8019a4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8019ab:	eb 38                	jmp    8019e5 <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  8019ad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019b0:	48 98                	cdqe   
  8019b2:	48 c1 e0 04          	shl    rax,0x4
  8019b6:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  8019bc:	8b 00                	mov    eax,DWORD PTR [rax]
  8019be:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8019c1:	75 1e                	jne    8019e1 <sys_mkfifo+0x4c>
  8019c3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019c6:	48 98                	cdqe   
  8019c8:	48 c1 e0 04          	shl    rax,0x4
  8019cc:	48 05 68 1e 40 00    	add    rax,0x401e68
  8019d2:	8b 00                	mov    eax,DWORD PTR [rax]
  8019d4:	83 f8 01             	cmp    eax,0x1
  8019d7:	75 08                	jne    8019e1 <sys_mkfifo+0x4c>
            return i;
  8019d9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019dc:	e9 a6 00 00 00       	jmp    801a87 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  8019e1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8019e5:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  8019e9:	7e c2                	jle    8019ad <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  8019eb:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8019f2:	e9 81 00 00 00       	jmp    801a78 <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  8019f7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019fa:	48 98                	cdqe   
  8019fc:	48 c1 e0 04          	shl    rax,0x4
  801a00:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a06:	8b 00                	mov    eax,DWORD PTR [rax]
  801a08:	85 c0                	test   eax,eax
  801a0a:	75 68                	jne    801a74 <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  801a0c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a0f:	48 98                	cdqe   
  801a11:	48 c1 e0 04          	shl    rax,0x4
  801a15:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a1b:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  801a21:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a24:	48 98                	cdqe   
  801a26:	48 c1 e0 04          	shl    rax,0x4
  801a2a:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801a31:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a34:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801a36:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a39:	48 98                	cdqe   
  801a3b:	48 c1 e0 04          	shl    rax,0x4
  801a3f:	48 05 64 1e 40 00    	add    rax,0x401e64
  801a45:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  801a4b:	b8 00 00 00 00       	mov    eax,0x0
  801a50:	e8 a5 fa ff ff       	call   8014fa <req_a_page>
  801a55:	89 c7                	mov    edi,eax
  801a57:	e8 0b fc ff ff       	call   801667 <get_phyaddr>
  801a5c:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801a5f:	48 63 d2             	movsxd rdx,edx
  801a62:	48 c1 e2 04          	shl    rdx,0x4
  801a66:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  801a6d:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  801a6f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a72:	eb 13                	jmp    801a87 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801a74:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801a78:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  801a7c:	0f 8e 75 ff ff ff    	jle    8019f7 <sys_mkfifo+0x62>
        }
    }
    return -1;
  801a82:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801a87:	c9                   	leave  
  801a88:	c3                   	ret    

0000000000801a89 <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801a89:	f3 0f 1e fa          	endbr64 
  801a8d:	55                   	push   rbp
  801a8e:	48 89 e5             	mov    rbp,rsp
  801a91:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801a94:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801a9b:	eb 4a                	jmp    801ae7 <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801a9d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801aa0:	48 98                	cdqe   
  801aa2:	48 c1 e0 04          	shl    rax,0x4
  801aa6:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801aac:	8b 00                	mov    eax,DWORD PTR [rax]
  801aae:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801ab1:	75 30                	jne    801ae3 <sys_rmfifo+0x5a>
  801ab3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ab6:	48 98                	cdqe   
  801ab8:	48 c1 e0 04          	shl    rax,0x4
  801abc:	48 05 68 1e 40 00    	add    rax,0x401e68
  801ac2:	8b 00                	mov    eax,DWORD PTR [rax]
  801ac4:	83 f8 01             	cmp    eax,0x1
  801ac7:	75 1a                	jne    801ae3 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801ac9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801acc:	48 98                	cdqe   
  801ace:	48 c1 e0 04          	shl    rax,0x4
  801ad2:	48 05 68 1e 40 00    	add    rax,0x401e68
  801ad8:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801ade:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ae1:	eb 0f                	jmp    801af2 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801ae3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801ae7:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801aeb:	7e b0                	jle    801a9d <sys_rmfifo+0x14>
        }
    }
    return -1;
  801aed:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801af2:	5d                   	pop    rbp
  801af3:	c3                   	ret    

0000000000801af4 <free_vol>:
int free_vol(int voli)
{
  801af4:	f3 0f 1e fa          	endbr64 
  801af8:	55                   	push   rbp
  801af9:	48 89 e5             	mov    rbp,rsp
  801afc:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801aff:	c7 05 57 e7 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe757],0x0        # 400260 <vols+0x20>
  801b06:	00 00 00 
    return 0;
  801b09:	b8 00 00 00 00       	mov    eax,0x0
}
  801b0e:	5d                   	pop    rbp
  801b0f:	c3                   	ret    

0000000000801b10 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801b10:	f3 0f 1e fa          	endbr64 
  801b14:	55                   	push   rbp
  801b15:	48 89 e5             	mov    rbp,rsp
  801b18:	48 83 ec 20          	sub    rsp,0x20
  801b1c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801b1f:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801b22:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801b26:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801b2d:	e9 d8 00 00 00       	jmp    801c0a <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801b32:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b35:	48 63 d0             	movsxd rdx,eax
  801b38:	48 89 d0             	mov    rax,rdx
  801b3b:	48 c1 e0 02          	shl    rax,0x2
  801b3f:	48 01 d0             	add    rax,rdx
  801b42:	48 c1 e0 03          	shl    rax,0x3
  801b46:	48 05 60 02 40 00    	add    rax,0x400260
  801b4c:	8b 00                	mov    eax,DWORD PTR [rax]
  801b4e:	85 c0                	test   eax,eax
  801b50:	0f 85 b0 00 00 00    	jne    801c06 <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801b56:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b59:	48 63 d0             	movsxd rdx,eax
  801b5c:	48 89 d0             	mov    rax,rdx
  801b5f:	48 c1 e0 02          	shl    rax,0x2
  801b63:	48 01 d0             	add    rax,rdx
  801b66:	48 c1 e0 03          	shl    rax,0x3
  801b6a:	48 05 60 02 40 00    	add    rax,0x400260
  801b70:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801b76:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801b79:	48 63 d0             	movsxd rdx,eax
  801b7c:	48 89 d0             	mov    rax,rdx
  801b7f:	48 01 c0             	add    rax,rax
  801b82:	48 01 d0             	add    rax,rdx
  801b85:	48 c1 e0 03          	shl    rax,0x3
  801b89:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801b90:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b93:	48 63 d0             	movsxd rdx,eax
  801b96:	48 89 d0             	mov    rax,rdx
  801b99:	48 c1 e0 02          	shl    rax,0x2
  801b9d:	48 01 d0             	add    rax,rdx
  801ba0:	48 c1 e0 03          	shl    rax,0x3
  801ba4:	48 05 58 02 40 00    	add    rax,0x400258
  801baa:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801bad:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801bb0:	89 c7                	mov    edi,eax
  801bb2:	e8 0b 1b 00 00       	call   8036c2 <get_drv>
  801bb7:	48 89 c2             	mov    rdx,rax
  801bba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bbd:	48 63 c8             	movsxd rcx,eax
  801bc0:	48 89 c8             	mov    rax,rcx
  801bc3:	48 c1 e0 02          	shl    rax,0x2
  801bc7:	48 01 c8             	add    rax,rcx
  801bca:	48 c1 e0 03          	shl    rax,0x3
  801bce:	48 05 48 02 40 00    	add    rax,0x400248
  801bd4:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801bd7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bda:	48 63 d0             	movsxd rdx,eax
  801bdd:	48 89 d0             	mov    rax,rdx
  801be0:	48 c1 e0 02          	shl    rax,0x2
  801be4:	48 01 d0             	add    rax,rdx
  801be7:	48 c1 e0 03          	shl    rax,0x3
  801beb:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801bf2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801bf6:	48 89 c6             	mov    rsi,rax
  801bf9:	48 89 d7             	mov    rdi,rdx
  801bfc:	e8 09 75 00 00       	call   80910a <strcpy>
            return i;
  801c01:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801c04:	eb 13                	jmp    801c19 <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801c06:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801c0a:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801c0e:	0f 8e 1e ff ff ff    	jle    801b32 <reg_vol+0x22>
        }
    }
    return -1;
  801c14:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801c19:	c9                   	leave  
  801c1a:	c3                   	ret    

0000000000801c1b <sys_open>:
int sys_open(char *path, int mode)
{
  801c1b:	f3 0f 1e fa          	endbr64 
  801c1f:	55                   	push   rbp
  801c20:	48 89 e5             	mov    rbp,rsp
  801c23:	53                   	push   rbx
  801c24:	48 81 ec 28 02 00 00 	sub    rsp,0x228
  801c2b:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
  801c32:	89 b5 d4 fd ff ff    	mov    DWORD PTR [rbp-0x22c],esi
    {

    }
    //根据文件路径找到相应的卷
    char volname[26];
    int i=0,rec=0;
  801c38:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801c3f:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
    for(;path[i]!='/'&&i<26;i++)
  801c46:	eb 20                	jmp    801c68 <sys_open+0x4d>
        volname[i]=path[i];
  801c48:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c4b:	48 63 d0             	movsxd rdx,eax
  801c4e:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801c55:	48 01 d0             	add    rax,rdx
  801c58:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  801c5b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c5e:	48 98                	cdqe   
  801c60:	88 54 05 c0          	mov    BYTE PTR [rbp+rax*1-0x40],dl
    for(;path[i]!='/'&&i<26;i++)
  801c64:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801c68:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c6b:	48 63 d0             	movsxd rdx,eax
  801c6e:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801c75:	48 01 d0             	add    rax,rdx
  801c78:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801c7b:	3c 2f                	cmp    al,0x2f
  801c7d:	74 06                	je     801c85 <sys_open+0x6a>
  801c7f:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801c83:	7e c3                	jle    801c48 <sys_open+0x2d>
    volname[i]='\0';
  801c85:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c88:	48 98                	cdqe   
  801c8a:	c6 44 05 c0 00       	mov    BYTE PTR [rbp+rax*1-0x40],0x0
    if(!path[i+1])
  801c8f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c92:	48 98                	cdqe   
  801c94:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801c98:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801c9f:	48 01 d0             	add    rax,rdx
  801ca2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801ca5:	84 c0                	test   al,al
  801ca7:	75 0a                	jne    801cb3 <sys_open+0x98>
        return -2;//是根目录
  801ca9:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  801cae:	e9 2b 04 00 00       	jmp    8020de <sys_open+0x4c3>
    rec=i;
  801cb3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801cb6:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(i=0;i<MAX_VOLUMES;i++)
  801cb9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801cc0:	eb 52                	jmp    801d14 <sys_open+0xf9>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801cc2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801cc5:	48 63 d0             	movsxd rdx,eax
  801cc8:	48 89 d0             	mov    rax,rdx
  801ccb:	48 c1 e0 02          	shl    rax,0x2
  801ccf:	48 01 d0             	add    rax,rdx
  801cd2:	48 c1 e0 03          	shl    rax,0x3
  801cd6:	48 05 60 02 40 00    	add    rax,0x400260
  801cdc:	8b 00                	mov    eax,DWORD PTR [rax]
  801cde:	85 c0                	test   eax,eax
  801ce0:	74 2e                	je     801d10 <sys_open+0xf5>
        (strcmp(vols[i].name,volname)==0))
  801ce2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ce5:	48 63 d0             	movsxd rdx,eax
  801ce8:	48 89 d0             	mov    rax,rdx
  801ceb:	48 c1 e0 02          	shl    rax,0x2
  801cef:	48 01 d0             	add    rax,rdx
  801cf2:	48 c1 e0 03          	shl    rax,0x3
  801cf6:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801cfd:	48 8d 45 c0          	lea    rax,[rbp-0x40]
  801d01:	48 89 c6             	mov    rsi,rax
  801d04:	48 89 d7             	mov    rdi,rdx
  801d07:	e8 9e 75 00 00       	call   8092aa <strcmp>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801d0c:	85 c0                	test   eax,eax
  801d0e:	74 0c                	je     801d1c <sys_open+0x101>
    for(i=0;i<MAX_VOLUMES;i++)
  801d10:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801d14:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801d18:	7e a8                	jle    801cc2 <sys_open+0xa7>
  801d1a:	eb 01                	jmp    801d1d <sys_open+0x102>
            break;
  801d1c:	90                   	nop
    if(i==MAX_VOLUMES)return -1;
  801d1d:	83 7d ec 1a          	cmp    DWORD PTR [rbp-0x14],0x1a
  801d21:	75 0a                	jne    801d2d <sys_open+0x112>
  801d23:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801d28:	e9 b1 03 00 00       	jmp    8020de <sys_open+0x4c3>
    driver_args arg={
  801d2d:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  801d34:	b8 00 00 00 00       	mov    eax,0x0
  801d39:	b9 17 00 00 00       	mov    ecx,0x17
  801d3e:	48 89 d7             	mov    rdi,rdx
  801d41:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  801d44:	48 89 fa             	mov    rdx,rdi
  801d47:	89 02                	mov    DWORD PTR [rdx],eax
  801d49:	48 83 c2 04          	add    rdx,0x4
            .path=path+rec+1
  801d4d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801d50:	48 98                	cdqe   
  801d52:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801d56:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801d5d:	48 01 d0             	add    rax,rdx
    driver_args arg={
  801d60:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    vfs_dir_entry dir;
    vfs_dir_entry res;
    int voln=i;
  801d67:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d6a:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    if(vols[i].fs->find(path+rec+1,dir,&res)==-1)//找不到文件 ((driver*)vols[i].fs_drv)->find(&arg)==-1
  801d6d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d70:	48 63 d0             	movsxd rdx,eax
  801d73:	48 89 d0             	mov    rax,rdx
  801d76:	48 c1 e0 02          	shl    rax,0x2
  801d7a:	48 01 d0             	add    rax,rdx
  801d7d:	48 c1 e0 03          	shl    rax,0x3
  801d81:	48 05 58 02 40 00    	add    rax,0x400258
  801d87:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801d8a:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  801d8e:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801d91:	48 98                	cdqe   
  801d93:	48 8d 48 01          	lea    rcx,[rax+0x1]
  801d97:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801d9e:	48 01 c1             	add    rcx,rax
  801da1:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
  801da8:	ff b5 f8 fe ff ff    	push   QWORD PTR [rbp-0x108]
  801dae:	ff b5 f0 fe ff ff    	push   QWORD PTR [rbp-0x110]
  801db4:	ff b5 e8 fe ff ff    	push   QWORD PTR [rbp-0x118]
  801dba:	ff b5 e0 fe ff ff    	push   QWORD PTR [rbp-0x120]
  801dc0:	ff b5 d8 fe ff ff    	push   QWORD PTR [rbp-0x128]
  801dc6:	ff b5 d0 fe ff ff    	push   QWORD PTR [rbp-0x130]
  801dcc:	ff b5 c8 fe ff ff    	push   QWORD PTR [rbp-0x138]
  801dd2:	ff b5 c0 fe ff ff    	push   QWORD PTR [rbp-0x140]
  801dd8:	ff b5 b8 fe ff ff    	push   QWORD PTR [rbp-0x148]
  801dde:	ff b5 b0 fe ff ff    	push   QWORD PTR [rbp-0x150]
  801de4:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
  801dea:	ff b5 a0 fe ff ff    	push   QWORD PTR [rbp-0x160]
  801df0:	48 89 c6             	mov    rsi,rax
  801df3:	48 89 cf             	mov    rdi,rcx
  801df6:	ff d2                	call   rdx
  801df8:	48 83 c4 60          	add    rsp,0x60
  801dfc:	83 f8 ff             	cmp    eax,0xffffffff
  801dff:	75 49                	jne    801e4a <sys_open+0x22f>
    {
        if(mode&FILE_MODE_WRITE) {
  801e01:	8b 85 d4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x22c]
  801e07:	83 e0 02             	and    eax,0x2
  801e0a:	85 c0                	test   eax,eax
  801e0c:	74 32                	je     801e40 <sys_open+0x225>
            return ((driver *) vols[i].fs_drv)->touch(&arg);//这里之后要改
  801e0e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801e11:	48 63 d0             	movsxd rdx,eax
  801e14:	48 89 d0             	mov    rax,rdx
  801e17:	48 c1 e0 02          	shl    rax,0x2
  801e1b:	48 01 d0             	add    rax,rdx
  801e1e:	48 c1 e0 03          	shl    rax,0x3
  801e22:	48 05 50 02 40 00    	add    rax,0x400250
  801e28:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801e2b:	48 8b 50 4c          	mov    rdx,QWORD PTR [rax+0x4c]
  801e2f:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  801e36:	48 89 c7             	mov    rdi,rax
  801e39:	ff d2                	call   rdx
  801e3b:	e9 9e 02 00 00       	jmp    8020de <sys_open+0x4c3>
        }else
            return -1;
  801e40:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801e45:	e9 94 02 00 00       	jmp    8020de <sys_open+0x4c3>
    }
    vfs_dir_entry entry=res;//=arg.entry;
  801e4a:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
  801e51:	48 8b 95 48 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b8]
  801e58:	48 89 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rax
  801e5f:	48 89 95 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdx
  801e66:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
  801e6d:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
  801e74:	48 89 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],rax
  801e7b:	48 89 95 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],rdx
  801e82:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
  801e89:	48 8b 95 68 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x198]
  801e90:	48 89 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],rax
  801e97:	48 89 95 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],rdx
  801e9e:	48 8b 85 70 fe ff ff 	mov    rax,QWORD PTR [rbp-0x190]
  801ea5:	48 8b 95 78 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x188]
  801eac:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
  801eb3:	48 89 95 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdx
  801eba:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
  801ec1:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
  801ec8:	48 89 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rax
  801ecf:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
  801ed6:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
  801edd:	48 8b 95 98 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x168]
  801ee4:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
  801eeb:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
    int j=-1;
  801ef2:	c7 45 e8 ff ff ff ff 	mov    DWORD PTR [rbp-0x18],0xffffffff
    for(i=0;i<MAX_OPEN_FILES;i++)
  801ef9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801f00:	eb 5c                	jmp    801f5e <sys_open+0x343>
    {
        if(opened[i].voln==voln&&opened[i].id==entry.id)
  801f02:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f05:	48 63 d0             	movsxd rdx,eax
  801f08:	48 89 d0             	mov    rax,rdx
  801f0b:	48 01 c0             	add    rax,rax
  801f0e:	48 01 d0             	add    rax,rdx
  801f11:	48 c1 e0 05          	shl    rax,0x5
  801f15:	48 05 68 06 40 00    	add    rax,0x400668
  801f1b:	8b 00                	mov    eax,DWORD PTR [rax]
  801f1d:	39 45 e0             	cmp    DWORD PTR [rbp-0x20],eax
  801f20:	75 38                	jne    801f5a <sys_open+0x33f>
  801f22:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f25:	48 63 d0             	movsxd rdx,eax
  801f28:	48 89 d0             	mov    rax,rdx
  801f2b:	48 01 c0             	add    rax,rax
  801f2e:	48 01 d0             	add    rax,rdx
  801f31:	48 c1 e0 05          	shl    rax,0x5
  801f35:	48 05 74 06 40 00    	add    rax,0x400674
  801f3b:	8b 10                	mov    edx,DWORD PTR [rax]
  801f3d:	8b 85 f4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x20c]
  801f43:	39 c2                	cmp    edx,eax
  801f45:	75 13                	jne    801f5a <sys_open+0x33f>
        {
            if(mode==FILE_MODE_WRITE)
  801f47:	83 bd d4 fd ff ff 02 	cmp    DWORD PTR [rbp-0x22c],0x2
  801f4e:	75 0a                	jne    801f5a <sys_open+0x33f>
            {
                return -1;//读模式会重新给一个fno但是指向同一个文件
  801f50:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801f55:	e9 84 01 00 00       	jmp    8020de <sys_open+0x4c3>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f5a:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801f5e:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801f62:	7e 9e                	jle    801f02 <sys_open+0x2e7>
            }
        }
    }
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f64:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801f6b:	eb 2b                	jmp    801f98 <sys_open+0x37d>
    {
        if(!opened[i].mode) {
  801f6d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f70:	48 63 d0             	movsxd rdx,eax
  801f73:	48 89 d0             	mov    rax,rdx
  801f76:	48 01 c0             	add    rax,rax
  801f79:	48 01 d0             	add    rax,rdx
  801f7c:	48 c1 e0 05          	shl    rax,0x5
  801f80:	48 05 64 06 40 00    	add    rax,0x400664
  801f86:	8b 00                	mov    eax,DWORD PTR [rax]
  801f88:	85 c0                	test   eax,eax
  801f8a:	75 08                	jne    801f94 <sys_open+0x379>
            j = i;
  801f8c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f8f:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            break;
  801f92:	eb 0a                	jmp    801f9e <sys_open+0x383>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f94:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801f98:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801f9c:	7e cf                	jle    801f6d <sys_open+0x352>
        }
    }
    if(j==-1)return -1;
  801f9e:	83 7d e8 ff          	cmp    DWORD PTR [rbp-0x18],0xffffffff
  801fa2:	75 0a                	jne    801fae <sys_open+0x393>
  801fa4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801fa9:	e9 30 01 00 00       	jmp    8020de <sys_open+0x4c3>
    opened[j]=entry;
  801fae:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801fb1:	48 63 d0             	movsxd rdx,eax
  801fb4:	48 89 d0             	mov    rax,rdx
  801fb7:	48 01 c0             	add    rax,rax
  801fba:	48 01 d0             	add    rax,rdx
  801fbd:	48 c1 e0 05          	shl    rax,0x5
  801fc1:	48 05 60 06 40 00    	add    rax,0x400660
  801fc7:	48 8b 8d e0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x220]
  801fce:	48 8b 9d e8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x218]
  801fd5:	48 89 08             	mov    QWORD PTR [rax],rcx
  801fd8:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
  801fdc:	48 8b 8d f0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x210]
  801fe3:	48 8b 9d f8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x208]
  801fea:	48 89 48 10          	mov    QWORD PTR [rax+0x10],rcx
  801fee:	48 89 58 18          	mov    QWORD PTR [rax+0x18],rbx
  801ff2:	48 8b 8d 00 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x200]
  801ff9:	48 8b 9d 08 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1f8]
  802000:	48 89 48 20          	mov    QWORD PTR [rax+0x20],rcx
  802004:	48 89 58 28          	mov    QWORD PTR [rax+0x28],rbx
  802008:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
  80200f:	48 8b 9d 18 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1e8]
  802016:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
  80201a:	48 89 58 38          	mov    QWORD PTR [rax+0x38],rbx
  80201e:	48 8b 8d 20 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e0]
  802025:	48 8b 9d 28 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1d8]
  80202c:	48 89 48 40          	mov    QWORD PTR [rax+0x40],rcx
  802030:	48 89 58 48          	mov    QWORD PTR [rax+0x48],rbx
  802034:	48 8b 8d 30 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1d0]
  80203b:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
  802042:	48 89 48 50          	mov    QWORD PTR [rax+0x50],rcx
  802046:	48 89 58 58          	mov    QWORD PTR [rax+0x58],rbx
    opened[j].fno=i;
  80204a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80204d:	48 63 d0             	movsxd rdx,eax
  802050:	48 89 d0             	mov    rax,rdx
  802053:	48 01 c0             	add    rax,rax
  802056:	48 01 d0             	add    rax,rdx
  802059:	48 c1 e0 05          	shl    rax,0x5
  80205d:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  802064:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802067:	89 02                	mov    DWORD PTR [rdx],eax
    opened[j].link_c++;
  802069:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80206c:	48 63 d0             	movsxd rdx,eax
  80206f:	48 89 d0             	mov    rax,rdx
  802072:	48 01 c0             	add    rax,rax
  802075:	48 01 d0             	add    rax,rdx
  802078:	48 c1 e0 05          	shl    rax,0x5
  80207c:	48 05 6c 06 40 00    	add    rax,0x40066c
  802082:	8b 00                	mov    eax,DWORD PTR [rax]
  802084:	8d 48 01             	lea    ecx,[rax+0x1]
  802087:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80208a:	48 63 d0             	movsxd rdx,eax
  80208d:	48 89 d0             	mov    rax,rdx
  802090:	48 01 c0             	add    rax,rax
  802093:	48 01 d0             	add    rax,rdx
  802096:	48 c1 e0 05          	shl    rax,0x5
  80209a:	48 05 6c 06 40 00    	add    rax,0x40066c
  8020a0:	89 08                	mov    DWORD PTR [rax],ecx
    add_proc_openf(&opened[j]);
  8020a2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8020a5:	48 63 d0             	movsxd rdx,eax
  8020a8:	48 89 d0             	mov    rax,rdx
  8020ab:	48 01 c0             	add    rax,rax
  8020ae:	48 01 d0             	add    rax,rdx
  8020b1:	48 c1 e0 05          	shl    rax,0x5
  8020b5:	48 05 60 06 40 00    	add    rax,0x400660
  8020bb:	48 89 c7             	mov    rdi,rax
  8020be:	e8 17 26 00 00       	call   8046da <add_proc_openf>
    return opened[j].fno;
  8020c3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8020c6:	48 63 d0             	movsxd rdx,eax
  8020c9:	48 89 d0             	mov    rax,rdx
  8020cc:	48 01 c0             	add    rax,rax
  8020cf:	48 01 d0             	add    rax,rdx
  8020d2:	48 c1 e0 05          	shl    rax,0x5
  8020d6:	48 05 60 06 40 00    	add    rax,0x400660
  8020dc:	8b 00                	mov    eax,DWORD PTR [rax]
}
  8020de:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8020e2:	c9                   	leave  
  8020e3:	c3                   	ret    

00000000008020e4 <sys_close>:
int sys_close(int fno)
{
  8020e4:	f3 0f 1e fa          	endbr64 
  8020e8:	55                   	push   rbp
  8020e9:	48 89 e5             	mov    rbp,rsp
  8020ec:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  8020ef:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8020f6:	eb 64                	jmp    80215c <sys_close+0x78>
    {
        if(opened[i].fno==fno)
  8020f8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020fb:	48 63 d0             	movsxd rdx,eax
  8020fe:	48 89 d0             	mov    rax,rdx
  802101:	48 01 c0             	add    rax,rax
  802104:	48 01 d0             	add    rax,rdx
  802107:	48 c1 e0 05          	shl    rax,0x5
  80210b:	48 05 60 06 40 00    	add    rax,0x400660
  802111:	8b 00                	mov    eax,DWORD PTR [rax]
  802113:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802116:	75 40                	jne    802158 <sys_close+0x74>
        {
            opened[i].link_c--;
  802118:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80211b:	48 63 d0             	movsxd rdx,eax
  80211e:	48 89 d0             	mov    rax,rdx
  802121:	48 01 c0             	add    rax,rax
  802124:	48 01 d0             	add    rax,rdx
  802127:	48 c1 e0 05          	shl    rax,0x5
  80212b:	48 05 6c 06 40 00    	add    rax,0x40066c
  802131:	8b 00                	mov    eax,DWORD PTR [rax]
  802133:	8d 48 ff             	lea    ecx,[rax-0x1]
  802136:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802139:	48 63 d0             	movsxd rdx,eax
  80213c:	48 89 d0             	mov    rax,rdx
  80213f:	48 01 c0             	add    rax,rax
  802142:	48 01 d0             	add    rax,rdx
  802145:	48 c1 e0 05          	shl    rax,0x5
  802149:	48 05 6c 06 40 00    	add    rax,0x40066c
  80214f:	89 08                	mov    DWORD PTR [rax],ecx
            return 0;
  802151:	b8 00 00 00 00       	mov    eax,0x0
  802156:	eb 0f                	jmp    802167 <sys_close+0x83>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802158:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80215c:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802160:	7e 96                	jle    8020f8 <sys_close+0x14>
        }
    }
    return -1;
  802162:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802167:	5d                   	pop    rbp
  802168:	c3                   	ret    

0000000000802169 <sys_write>:
int sys_write(int fno, char *src, int len)
{
  802169:	f3 0f 1e fa          	endbr64 
  80216d:	55                   	push   rbp
  80216e:	48 89 e5             	mov    rbp,rsp
  802171:	48 83 ec 20          	sub    rsp,0x20
  802175:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802178:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80217c:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  80217f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802182:	89 c7                	mov    edi,eax
  802184:	e8 7d 01 00 00       	call   802306 <get_vfs_entry>
  802189:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  80218d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802192:	75 07                	jne    80219b <sys_write+0x32>
  802194:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802199:	eb 5d                	jmp    8021f8 <sys_write+0x8f>
    if(f->type==FTYPE_REG)
  80219b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80219f:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8021a2:	85 c0                	test   eax,eax
  8021a4:	75 18                	jne    8021be <sys_write+0x55>
    {
        return vfs_write_file(f,src,len);
  8021a6:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8021a9:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8021ad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021b1:	48 89 ce             	mov    rsi,rcx
  8021b4:	48 89 c7             	mov    rdi,rax
  8021b7:	e8 67 03 00 00       	call   802523 <vfs_write_file>
  8021bc:	eb 3a                	jmp    8021f8 <sys_write+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  8021be:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021c2:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8021c5:	83 f8 01             	cmp    eax,0x1
  8021c8:	75 29                	jne    8021f3 <sys_write+0x8a>
    {
        int block=get_according_bnr(f);
  8021ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021ce:	48 89 c7             	mov    rdi,rax
  8021d1:	e8 5b 04 00 00       	call   802631 <get_according_bnr>
  8021d6:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return write_block(f->dev,block,src,len);
  8021d9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021dd:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8021e0:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  8021e3:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8021e7:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  8021ea:	89 c7                	mov    edi,eax
  8021ec:	e8 24 08 00 00       	call   802a15 <write_block>
  8021f1:	eb 05                	jmp    8021f8 <sys_write+0x8f>
    }
    return -1;
  8021f3:	b8 ff ff ff ff       	mov    eax,0xffffffff
            .src_addr=src,
            .len=len,
            .pos=pos
    };
    return ((driver*)vols[f->voln].fs_drv)->write(&args); */
}
  8021f8:	c9                   	leave  
  8021f9:	c3                   	ret    

00000000008021fa <sys_read>:
int sys_read(int fno, char *dist,  int len)
{
  8021fa:	f3 0f 1e fa          	endbr64 
  8021fe:	55                   	push   rbp
  8021ff:	48 89 e5             	mov    rbp,rsp
  802202:	48 83 ec 20          	sub    rsp,0x20
  802206:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802209:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80220d:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  802210:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802213:	89 c7                	mov    edi,eax
  802215:	e8 ec 00 00 00       	call   802306 <get_vfs_entry>
  80221a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  80221e:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802223:	75 07                	jne    80222c <sys_read+0x32>
  802225:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80222a:	eb 5d                	jmp    802289 <sys_read+0x8f>
    if(f->type==FTYPE_REG)
  80222c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802230:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802233:	85 c0                	test   eax,eax
  802235:	75 18                	jne    80224f <sys_read+0x55>
    {
        return vfs_read_file(f,dist,len);
  802237:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80223a:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  80223e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802242:	48 89 ce             	mov    rsi,rcx
  802245:	48 89 c7             	mov    rdi,rax
  802248:	e8 37 02 00 00       	call   802484 <vfs_read_file>
  80224d:	eb 3a                	jmp    802289 <sys_read+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  80224f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802253:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802256:	83 f8 01             	cmp    eax,0x1
  802259:	75 29                	jne    802284 <sys_read+0x8a>
    {
        int block=get_according_bnr(f);
  80225b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80225f:	48 89 c7             	mov    rdi,rax
  802262:	e8 ca 03 00 00       	call   802631 <get_according_bnr>
  802267:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return read_block(f->dev,block,dist,len);
  80226a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80226e:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802271:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  802274:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802278:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  80227b:	89 c7                	mov    edi,eax
  80227d:	e8 10 08 00 00       	call   802a92 <read_block>
  802282:	eb 05                	jmp    802289 <sys_read+0x8f>
    }
    return -1;
  802284:	b8 ff ff ff ff       	mov    eax,0xffffffff
    //         .len=len,
    //         .pos=pos,
    //         .entry=*f
    // };
    // return ((driver*)vols[f->voln].fs_drv)->read(&args);
}
  802289:	c9                   	leave  
  80228a:	c3                   	ret    

000000000080228b <sys_seek>:
int sys_seek(int fno, int offset, int origin)
{
  80228b:	f3 0f 1e fa          	endbr64 
  80228f:	55                   	push   rbp
  802290:	48 89 e5             	mov    rbp,rsp
  802293:	48 83 ec 20          	sub    rsp,0x20
  802297:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80229a:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80229d:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  8022a0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8022a3:	89 c7                	mov    edi,eax
  8022a5:	e8 5c 00 00 00       	call   802306 <get_vfs_entry>
  8022aa:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  8022ae:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8022b3:	75 07                	jne    8022bc <sys_seek+0x31>
  8022b5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8022ba:	eb 14                	jmp    8022d0 <sys_seek+0x45>
    f->ptr=offset+origin;
  8022bc:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8022bf:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8022c2:	01 c2                	add    edx,eax
  8022c4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022c8:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
    return 0;
  8022cb:	b8 00 00 00 00       	mov    eax,0x0
}
  8022d0:	c9                   	leave  
  8022d1:	c3                   	ret    

00000000008022d2 <sys_tell>:
int sys_tell(int fno)
{
  8022d2:	f3 0f 1e fa          	endbr64 
  8022d6:	55                   	push   rbp
  8022d7:	48 89 e5             	mov    rbp,rsp
  8022da:	48 83 ec 20          	sub    rsp,0x20
  8022de:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    vfs_dir_entry *f= get_vfs_entry(fno);
  8022e1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8022e4:	89 c7                	mov    edi,eax
  8022e6:	e8 1b 00 00 00       	call   802306 <get_vfs_entry>
  8022eb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  8022ef:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8022f4:	75 07                	jne    8022fd <sys_tell+0x2b>
  8022f6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8022fb:	eb 07                	jmp    802304 <sys_tell+0x32>
    return f->ptr;
  8022fd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802301:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802304:	c9                   	leave  
  802305:	c3                   	ret    

0000000000802306 <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  802306:	f3 0f 1e fa          	endbr64 
  80230a:	55                   	push   rbp
  80230b:	48 89 e5             	mov    rbp,rsp
  80230e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802311:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802318:	eb 3f                	jmp    802359 <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  80231a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80231d:	48 63 d0             	movsxd rdx,eax
  802320:	48 89 d0             	mov    rax,rdx
  802323:	48 01 c0             	add    rax,rax
  802326:	48 01 d0             	add    rax,rdx
  802329:	48 c1 e0 05          	shl    rax,0x5
  80232d:	48 05 60 06 40 00    	add    rax,0x400660
  802333:	8b 00                	mov    eax,DWORD PTR [rax]
  802335:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802338:	75 1b                	jne    802355 <get_vfs_entry+0x4f>
        {
            return &opened[i];
  80233a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80233d:	48 63 d0             	movsxd rdx,eax
  802340:	48 89 d0             	mov    rax,rdx
  802343:	48 01 c0             	add    rax,rax
  802346:	48 01 d0             	add    rax,rdx
  802349:	48 c1 e0 05          	shl    rax,0x5
  80234d:	48 05 60 06 40 00    	add    rax,0x400660
  802353:	eb 0f                	jmp    802364 <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802355:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802359:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80235d:	7e bb                	jle    80231a <get_vfs_entry+0x14>
        }
    }
    return NULL;
  80235f:	b8 00 00 00 00       	mov    eax,0x0
}
  802364:	5d                   	pop    rbp
  802365:	c3                   	ret    

0000000000802366 <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  802366:	f3 0f 1e fa          	endbr64 
  80236a:	55                   	push   rbp
  80236b:	48 89 e5             	mov    rbp,rsp
  80236e:	48 83 ec 10          	sub    rsp,0x10
  802372:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  802376:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80237a:	48 89 c7             	mov    rdi,rax
  80237d:	e8 a0 04 00 00       	call   802822 <wait_on_buf>
    if(bh->b_count==0)return -1;
  802382:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802386:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  80238a:	84 c0                	test   al,al
  80238c:	75 07                	jne    802395 <brelse+0x2f>
  80238e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802393:	eb 32                	jmp    8023c7 <brelse+0x61>
    bh->b_count--;
  802395:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802399:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  80239d:	8d 50 ff             	lea    edx,[rax-0x1]
  8023a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023a4:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  8023a7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023ab:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  8023af:	84 c0                	test   al,al
  8023b1:	75 0f                	jne    8023c2 <brelse+0x5c>
        vmfree(bh->b_data);
  8023b3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023b7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8023ba:	48 89 c7             	mov    rdi,rax
  8023bd:	e8 6e ef ff ff       	call   801330 <vmfree>
    return 0;
  8023c2:	b8 00 00 00 00       	mov    eax,0x0
}
  8023c7:	c9                   	leave  
  8023c8:	c3                   	ret    

00000000008023c9 <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  8023c9:	f3 0f 1e fa          	endbr64 
  8023cd:	55                   	push   rbp
  8023ce:	48 89 e5             	mov    rbp,rsp
  8023d1:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  8023d8:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  8023de:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  8023e4:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  8023ea:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  8023f0:	89 d6                	mov    esi,edx
  8023f2:	89 c7                	mov    edi,eax
  8023f4:	e8 78 02 00 00       	call   802671 <get_buf>
  8023f9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  8023fd:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802402:	75 09                	jne    80240d <bread+0x44>
  802404:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80240b:	eb 75                	jmp    802482 <bread+0xb9>
    if(!bh->b_uptodate)
  80240d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802411:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  802415:	84 c0                	test   al,al
  802417:	75 65                	jne    80247e <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  802419:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  80241f:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  802422:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  802429:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80242d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802430:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  802436:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  80243d:	02 00 00 
        arg.lba=bh->b_blocknr;
  802440:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802444:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  802448:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  80244e:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  802455:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  802458:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  80245f:	48 89 c7             	mov    rdi,rax
  802462:	e8 82 12 00 00       	call   8036e9 <make_request>
  802467:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  80246a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80246d:	89 c7                	mov    edi,eax
  80246f:	e8 88 15 00 00       	call   8039fc <wait_on_req>
        clear_req(reqi);
  802474:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802477:	89 c7                	mov    edi,eax
  802479:	e8 ae 15 00 00       	call   803a2c <clear_req>
    }
    return bh;
  80247e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  802482:	c9                   	leave  
  802483:	c3                   	ret    

0000000000802484 <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  802484:	f3 0f 1e fa          	endbr64 
  802488:	55                   	push   rbp
  802489:	48 89 e5             	mov    rbp,rsp
  80248c:	48 83 ec 40          	sub    rsp,0x40
  802490:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802494:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  802498:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  80249b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80249f:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8024a2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  8024a5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024a9:	48 89 c7             	mov    rdi,rax
  8024ac:	e8 80 01 00 00       	call   802631 <get_according_bnr>
  8024b1:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  8024b4:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8024b7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8024ba:	89 d6                	mov    esi,edx
  8024bc:	89 c7                	mov    edi,eax
  8024be:	e8 06 ff ff ff       	call   8023c9 <bread>
  8024c3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8024c7:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8024ca:	ba 00 02 00 00       	mov    edx,0x200
  8024cf:	39 d0                	cmp    eax,edx
  8024d1:	0f 4f c2             	cmovg  eax,edx
  8024d4:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  8024d7:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8024da:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8024de:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8024e1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8024e5:	48 89 ce             	mov    rsi,rcx
  8024e8:	48 89 c7             	mov    rdi,rax
  8024eb:	e8 1c 6b 00 00       	call   80900c <memcpy>
        len-=BLOCK_SIZE;
  8024f0:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  8024f7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024fb:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8024fe:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802501:	01 c2                	add    edx,eax
  802503:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802507:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  80250a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80250e:	48 89 c7             	mov    rdi,rax
  802511:	e8 50 fe ff ff       	call   802366 <brelse>
    }while(len>0);
  802516:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  80251a:	7f 89                	jg     8024a5 <vfs_read_file+0x21>
    return 0;
  80251c:	b8 00 00 00 00       	mov    eax,0x0
}
  802521:	c9                   	leave  
  802522:	c3                   	ret    

0000000000802523 <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  802523:	f3 0f 1e fa          	endbr64 
  802527:	55                   	push   rbp
  802528:	48 89 e5             	mov    rbp,rsp
  80252b:	48 83 ec 40          	sub    rsp,0x40
  80252f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802533:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  802537:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  80253a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80253e:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802541:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802544:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802548:	48 89 c7             	mov    rdi,rax
  80254b:	e8 e1 00 00 00       	call   802631 <get_according_bnr>
  802550:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  802553:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  802556:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802559:	89 d6                	mov    esi,edx
  80255b:	89 c7                	mov    edi,eax
  80255d:	e8 0f 01 00 00       	call   802671 <get_buf>
  802562:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802566:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802569:	ba 00 02 00 00       	mov    edx,0x200
  80256e:	39 d0                	cmp    eax,edx
  802570:	0f 4f c2             	cmovg  eax,edx
  802573:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  802576:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  802579:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80257d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802580:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802584:	48 89 ce             	mov    rsi,rcx
  802587:	48 89 c7             	mov    rdi,rax
  80258a:	e8 7d 6a 00 00       	call   80900c <memcpy>
        len-=BLOCK_SIZE;
  80258f:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  802596:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80259a:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80259d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8025a0:	01 c2                	add    edx,eax
  8025a2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8025a6:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  8025a9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8025ad:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  8025b1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8025b5:	48 89 c7             	mov    rdi,rax
  8025b8:	e8 a9 fd ff ff       	call   802366 <brelse>
    }while(len>0);
  8025bd:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  8025c1:	7f 81                	jg     802544 <vfs_write_file+0x21>
    return 0;
  8025c3:	b8 00 00 00 00       	mov    eax,0x0
}
  8025c8:	c9                   	leave  
  8025c9:	c3                   	ret    

00000000008025ca <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  8025ca:	f3 0f 1e fa          	endbr64 
  8025ce:	55                   	push   rbp
  8025cf:	48 89 e5             	mov    rbp,rsp
  8025d2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8025d6:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  8025d9:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  8025dc:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8025e0:	74 20                	je     802602 <vfs_seek_file+0x38>
  8025e2:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8025e6:	7f 3f                	jg     802627 <vfs_seek_file+0x5d>
  8025e8:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  8025ec:	74 08                	je     8025f6 <vfs_seek_file+0x2c>
  8025ee:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  8025f2:	74 23                	je     802617 <vfs_seek_file+0x4d>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  8025f4:	eb 31                	jmp    802627 <vfs_seek_file+0x5d>
        f->ptr=offset;
  8025f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025fa:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8025fd:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802600:	eb 26                	jmp    802628 <vfs_seek_file+0x5e>
        f->ptr+=offset;
  802602:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802606:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802609:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80260c:	01 c2                	add    edx,eax
  80260e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802612:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802615:	eb 11                	jmp    802628 <vfs_seek_file+0x5e>
        f->ptr=f->size;
  802617:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80261b:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  80261e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802622:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802625:	eb 01                	jmp    802628 <vfs_seek_file+0x5e>
        break;
  802627:	90                   	nop
    }
    return f->ptr;
  802628:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80262c:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  80262f:	5d                   	pop    rbp
  802630:	c3                   	ret    

0000000000802631 <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  802631:	f3 0f 1e fa          	endbr64 
  802635:	55                   	push   rbp
  802636:	48 89 e5             	mov    rbp,rsp
  802639:	48 83 ec 10          	sub    rsp,0x10
  80263d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  802641:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802645:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802648:	48 63 d0             	movsxd rdx,eax
  80264b:	48 89 d0             	mov    rax,rdx
  80264e:	48 c1 e0 02          	shl    rax,0x2
  802652:	48 01 d0             	add    rax,rdx
  802655:	48 c1 e0 03          	shl    rax,0x3
  802659:	48 05 58 02 40 00    	add    rax,0x400258
  80265f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802662:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802666:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80266a:	48 89 c7             	mov    rdi,rax
  80266d:	ff d2                	call   rdx

}
  80266f:	c9                   	leave  
  802670:	c3                   	ret    

0000000000802671 <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  802671:	f3 0f 1e fa          	endbr64 
  802675:	55                   	push   rbp
  802676:	48 89 e5             	mov    rbp,rsp
  802679:	48 83 ec 20          	sub    rsp,0x20
  80267d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802680:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802683:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80268a:	e9 b9 00 00 00       	jmp    802748 <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  80268f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802692:	48 98                	cdqe   
  802694:	48 c1 e0 06          	shl    rax,0x6
  802698:	48 05 90 26 40 00    	add    rax,0x402690
  80269e:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8026a1:	0f b7 c0             	movzx  eax,ax
  8026a4:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8026a7:	0f 85 97 00 00 00    	jne    802744 <get_buf+0xd3>
  8026ad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026b0:	48 98                	cdqe   
  8026b2:	48 c1 e0 06          	shl    rax,0x6
  8026b6:	48 05 88 26 40 00    	add    rax,0x402688
  8026bc:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8026bf:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8026c2:	48 98                	cdqe   
  8026c4:	48 39 c2             	cmp    rdx,rax
  8026c7:	75 7b                	jne    802744 <get_buf+0xd3>
        {
            repeat:
  8026c9:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  8026ca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026cd:	48 98                	cdqe   
  8026cf:	48 c1 e0 06          	shl    rax,0x6
  8026d3:	48 05 80 26 40 00    	add    rax,0x402680
  8026d9:	48 89 c7             	mov    rdi,rax
  8026dc:	e8 41 01 00 00       	call   802822 <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  8026e1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026e4:	48 98                	cdqe   
  8026e6:	48 c1 e0 06          	shl    rax,0x6
  8026ea:	48 05 94 26 40 00    	add    rax,0x402694
  8026f0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8026f3:	84 c0                	test   al,al
  8026f5:	74 02                	je     8026f9 <get_buf+0x88>
                goto repeat;
  8026f7:	eb d1                	jmp    8026ca <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  8026f9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026fc:	48 98                	cdqe   
  8026fe:	48 c1 e0 06          	shl    rax,0x6
  802702:	48 05 90 26 40 00    	add    rax,0x402690
  802708:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80270b:	0f b7 c0             	movzx  eax,ax
  80270e:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802711:	75 30                	jne    802743 <get_buf+0xd2>
  802713:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802716:	48 98                	cdqe   
  802718:	48 c1 e0 06          	shl    rax,0x6
  80271c:	48 05 88 26 40 00    	add    rax,0x402688
  802722:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802725:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802728:	48 98                	cdqe   
  80272a:	48 39 c2             	cmp    rdx,rax
  80272d:	75 14                	jne    802743 <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  80272f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802732:	48 98                	cdqe   
  802734:	48 c1 e0 06          	shl    rax,0x6
  802738:	48 05 80 26 40 00    	add    rax,0x402680
  80273e:	e9 dd 00 00 00       	jmp    802820 <get_buf+0x1af>
                continue;
  802743:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802744:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802748:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  80274c:	0f 8e 3d ff ff ff    	jle    80268f <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802752:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  802759:	e9 b8 00 00 00       	jmp    802816 <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  80275e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802761:	48 98                	cdqe   
  802763:	48 c1 e0 06          	shl    rax,0x6
  802767:	48 05 94 26 40 00    	add    rax,0x402694
  80276d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802770:	84 c0                	test   al,al
  802772:	0f 85 9a 00 00 00    	jne    802812 <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  802778:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80277b:	48 98                	cdqe   
  80277d:	48 c1 e0 06          	shl    rax,0x6
  802781:	48 05 93 26 40 00    	add    rax,0x402693
  802787:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80278a:	84 c0                	test   al,al
  80278c:	74 2e                	je     8027bc <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  80278e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802791:	48 98                	cdqe   
  802793:	48 c1 e0 06          	shl    rax,0x6
  802797:	48 05 80 26 40 00    	add    rax,0x402680
  80279d:	48 89 c7             	mov    rdi,rax
  8027a0:	e8 2c 02 00 00       	call   8029d1 <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  8027a5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027a8:	48 98                	cdqe   
  8027aa:	48 c1 e0 06          	shl    rax,0x6
  8027ae:	48 05 80 26 40 00    	add    rax,0x402680
  8027b4:	48 89 c7             	mov    rdi,rax
  8027b7:	e8 66 00 00 00       	call   802822 <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  8027bc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027bf:	48 98                	cdqe   
  8027c1:	48 c1 e0 06          	shl    rax,0x6
  8027c5:	48 05 94 26 40 00    	add    rax,0x402694
  8027cb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8027ce:	8d 50 01             	lea    edx,[rax+0x1]
  8027d1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027d4:	48 98                	cdqe   
  8027d6:	48 c1 e0 06          	shl    rax,0x6
  8027da:	48 05 94 26 40 00    	add    rax,0x402694
  8027e0:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  8027e2:	b8 00 00 00 00       	mov    eax,0x0
  8027e7:	e8 b5 ea ff ff       	call   8012a1 <vmalloc>
  8027ec:	48 89 c2             	mov    rdx,rax
  8027ef:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027f2:	48 98                	cdqe   
  8027f4:	48 c1 e0 06          	shl    rax,0x6
  8027f8:	48 05 80 26 40 00    	add    rax,0x402680
  8027fe:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  802801:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802804:	48 98                	cdqe   
  802806:	48 c1 e0 06          	shl    rax,0x6
  80280a:	48 05 80 26 40 00    	add    rax,0x402680
  802810:	eb 0e                	jmp    802820 <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802812:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  802816:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80281a:	0f 8e 3e ff ff ff    	jle    80275e <get_buf+0xed>
        }
    }
}
  802820:	c9                   	leave  
  802821:	c3                   	ret    

0000000000802822 <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  802822:	f3 0f 1e fa          	endbr64 
  802826:	55                   	push   rbp
  802827:	48 89 e5             	mov    rbp,rsp
  80282a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  80282e:	90                   	nop
  80282f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802833:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  802837:	84 c0                	test   al,al
  802839:	75 f4                	jne    80282f <wait_on_buf+0xd>
    
}
  80283b:	90                   	nop
  80283c:	90                   	nop
  80283d:	5d                   	pop    rbp
  80283e:	c3                   	ret    

000000000080283f <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  80283f:	f3 0f 1e fa          	endbr64 
  802843:	55                   	push   rbp
  802844:	48 89 e5             	mov    rbp,rsp
  802847:	48 83 ec 40          	sub    rsp,0x40
  80284b:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    device *blkdev=get_dev(dev);
  80284e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802851:	89 c7                	mov    edi,eax
  802853:	e8 3c 0e 00 00       	call   803694 <get_dev>
  802858:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    buffer_head* bh=bread(dev,0);
  80285c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80285f:	be 00 00 00 00       	mov    esi,0x0
  802864:	89 c7                	mov    edi,eax
  802866:	e8 5e fb ff ff       	call   8023c9 <bread>
  80286b:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!bh)return -1;
  80286f:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  802874:	75 0a                	jne    802880 <scan_dev+0x41>
  802876:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80287b:	e9 4f 01 00 00       	jmp    8029cf <scan_dev+0x190>
    dpt_t* dpte=bh->b_data+0x1be;
  802880:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802884:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802887:	48 05 be 01 00 00    	add    rax,0x1be
  80288d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  802891:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802898:	e9 17 01 00 00       	jmp    8029b4 <scan_dev+0x175>
    {
        blkdev->par[i].type=dpte->type;
  80289d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028a1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8028a4:	0f b6 d0             	movzx  edx,al
  8028a7:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  8028ab:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8028ae:	48 63 c8             	movsxd rcx,eax
  8028b1:	48 89 c8             	mov    rax,rcx
  8028b4:	48 01 c0             	add    rax,rax
  8028b7:	48 01 c8             	add    rax,rcx
  8028ba:	48 c1 e0 02          	shl    rax,0x2
  8028be:	48 01 f0             	add    rax,rsi
  8028c1:	48 83 c0 40          	add    rax,0x40
  8028c5:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
        int stlba=dpte->start_lba;
  8028c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028cc:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8028cf:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
        blkdev->par[i].start_sec=stlba;
  8028d2:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  8028d6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8028d9:	48 63 d0             	movsxd rdx,eax
  8028dc:	48 89 d0             	mov    rax,rdx
  8028df:	48 01 c0             	add    rax,rax
  8028e2:	48 01 d0             	add    rax,rdx
  8028e5:	48 c1 e0 02          	shl    rax,0x2
  8028e9:	48 01 c8             	add    rax,rcx
  8028ec:	48 8d 50 40          	lea    rdx,[rax+0x40]
  8028f0:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8028f3:	89 02                	mov    DWORD PTR [rdx],eax
        int i;
        for(i=0;i<MAX_FS;i++)
  8028f5:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8028fc:	eb 68                	jmp    802966 <scan_dev+0x127>
        {
            if(fs[i].read_superblock&&fs[i].read_superblock(dev,stlba)==0)
  8028fe:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  802901:	48 63 d0             	movsxd rdx,eax
  802904:	48 89 d0             	mov    rax,rdx
  802907:	48 01 c0             	add    rax,rax
  80290a:	48 01 d0             	add    rax,rdx
  80290d:	48 c1 e0 03          	shl    rax,0x3
  802911:	48 05 80 23 40 00    	add    rax,0x402380
  802917:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80291a:	48 85 c0             	test   rax,rax
  80291d:	74 43                	je     802962 <scan_dev+0x123>
  80291f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  802922:	48 63 d0             	movsxd rdx,eax
  802925:	48 89 d0             	mov    rax,rdx
  802928:	48 01 c0             	add    rax,rax
  80292b:	48 01 d0             	add    rax,rdx
  80292e:	48 c1 e0 03          	shl    rax,0x3
  802932:	48 05 80 23 40 00    	add    rax,0x402380
  802938:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80293b:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80293e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802941:	89 d6                	mov    esi,edx
  802943:	89 c7                	mov    edi,eax
  802945:	ff d1                	call   rcx
  802947:	85 c0                	test   eax,eax
  802949:	75 17                	jne    802962 <scan_dev+0x123>
            {
                reg_vol(dev,i,blkdev->name);//识别成功，注册卷
  80294b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80294f:	48 8d 50 14          	lea    rdx,[rax+0x14]
  802953:	8b 4d f0             	mov    ecx,DWORD PTR [rbp-0x10]
  802956:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802959:	89 ce                	mov    esi,ecx
  80295b:	89 c7                	mov    edi,eax
  80295d:	e8 ae f1 ff ff       	call   801b10 <reg_vol>
        for(i=0;i<MAX_FS;i++)
  802962:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  802966:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  80296a:	7e 92                	jle    8028fe <scan_dev+0xbf>
            }
        }
        if(i==MAX_FS)
  80296c:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  802970:	75 0f                	jne    802981 <scan_dev+0x142>
        {
            printf("err:unrecognised partition fs.\n");
  802972:	bf 38 9f 80 00       	mov    edi,0x809f38
  802977:	b8 00 00 00 00       	mov    eax,0x0
  80297c:	e8 ac e4 ff ff       	call   800e2d <printf>
        }

        blkdev->par[i].end_sec=dpte->end_lba;
  802981:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802985:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802988:	89 c1                	mov    ecx,eax
  80298a:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  80298e:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  802991:	48 63 d0             	movsxd rdx,eax
  802994:	48 89 d0             	mov    rax,rdx
  802997:	48 01 c0             	add    rax,rax
  80299a:	48 01 d0             	add    rax,rdx
  80299d:	48 c1 e0 02          	shl    rax,0x2
  8029a1:	48 01 f0             	add    rax,rsi
  8029a4:	48 83 c0 40          	add    rax,0x40
  8029a8:	89 48 04             	mov    DWORD PTR [rax+0x4],ecx
        dpte++;
  8029ab:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  8029b0:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8029b4:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8029b8:	0f 8e df fe ff ff    	jle    80289d <scan_dev+0x5e>
    }
    brelse(bh);
  8029be:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8029c2:	48 89 c7             	mov    rdi,rax
  8029c5:	e8 9c f9 ff ff       	call   802366 <brelse>
    return 0;
  8029ca:	b8 00 00 00 00       	mov    eax,0x0
}
  8029cf:	c9                   	leave  
  8029d0:	c3                   	ret    

00000000008029d1 <sync_buf>:

int sync_buf(buffer_head* bh)
{
  8029d1:	f3 0f 1e fa          	endbr64 
  8029d5:	55                   	push   rbp
  8029d6:	48 89 e5             	mov    rbp,rsp
  8029d9:	48 83 ec 20          	sub    rsp,0x20
  8029dd:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  8029e1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8029e5:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  8029e9:	0f b7 c0             	movzx  eax,ax
  8029ec:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  8029ef:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8029f3:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8029f7:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  8029fa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8029fe:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802a01:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  802a04:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802a07:	b9 00 02 00 00       	mov    ecx,0x200
  802a0c:	89 c7                	mov    edi,eax
  802a0e:	e8 02 00 00 00       	call   802a15 <write_block>

}
  802a13:	c9                   	leave  
  802a14:	c3                   	ret    

0000000000802a15 <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  802a15:	f3 0f 1e fa          	endbr64 
  802a19:	55                   	push   rbp
  802a1a:	48 89 e5             	mov    rbp,rsp
  802a1d:	48 83 ec 30          	sub    rsp,0x30
  802a21:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802a24:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802a27:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802a2b:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  802a2e:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802a31:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802a34:	89 d6                	mov    esi,edx
  802a36:	89 c7                	mov    edi,eax
  802a38:	e8 34 fc ff ff       	call   802671 <get_buf>
  802a3d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802a41:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802a44:	ba 00 02 00 00       	mov    edx,0x200
  802a49:	39 d0                	cmp    eax,edx
  802a4b:	0f 4f c2             	cmovg  eax,edx
  802a4e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  802a51:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802a54:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a58:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802a5b:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  802a5f:	48 89 ce             	mov    rsi,rcx
  802a62:	48 89 c7             	mov    rdi,rax
  802a65:	e8 a2 65 00 00       	call   80900c <memcpy>
        len-=BLOCK_SIZE;
  802a6a:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  802a71:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a75:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802a79:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a7d:	48 89 c7             	mov    rdi,rax
  802a80:	e8 e1 f8 ff ff       	call   802366 <brelse>
    }while(len>0);
  802a85:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802a89:	7f a3                	jg     802a2e <write_block+0x19>
    return 0;
  802a8b:	b8 00 00 00 00       	mov    eax,0x0
}
  802a90:	c9                   	leave  
  802a91:	c3                   	ret    

0000000000802a92 <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  802a92:	f3 0f 1e fa          	endbr64 
  802a96:	55                   	push   rbp
  802a97:	48 89 e5             	mov    rbp,rsp
  802a9a:	48 83 ec 30          	sub    rsp,0x30
  802a9e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802aa1:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802aa4:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802aa8:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  802aab:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802aae:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802ab1:	89 d6                	mov    esi,edx
  802ab3:	89 c7                	mov    edi,eax
  802ab5:	e8 0f f9 ff ff       	call   8023c9 <bread>
  802aba:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802abe:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802ac1:	ba 00 02 00 00       	mov    edx,0x200
  802ac6:	39 d0                	cmp    eax,edx
  802ac8:	0f 4f c2             	cmovg  eax,edx
  802acb:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  802ace:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802ad1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802ad5:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802ad8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802adc:	48 89 ce             	mov    rsi,rcx
  802adf:	48 89 c7             	mov    rdi,rax
  802ae2:	e8 25 65 00 00       	call   80900c <memcpy>
        len-=BLOCK_SIZE;
  802ae7:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  802aee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802af2:	48 89 c7             	mov    rdi,rax
  802af5:	e8 6c f8 ff ff       	call   802366 <brelse>
    }while(len>0);
  802afa:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802afe:	7f ab                	jg     802aab <read_block+0x19>
    return 0;
  802b00:	b8 00 00 00 00       	mov    eax,0x0
}
  802b05:	c9                   	leave  
  802b06:	c3                   	ret    

0000000000802b07 <init_vfs>:

int init_vfs()
{
  802b07:	f3 0f 1e fa          	endbr64 
  802b0b:	55                   	push   rbp
  802b0c:	48 89 e5             	mov    rbp,rsp
  802b0f:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  802b13:	48 8b 05 66 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05966]        # 408480 <dev_tree>
  802b1a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  802b1e:	eb 40                	jmp    802b60 <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  802b20:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802b24:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  802b2a:	48 c1 f8 02          	sar    rax,0x2
  802b2e:	48 89 c2             	mov    rdx,rax
  802b31:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  802b38:	18 9c 8f 
  802b3b:	48 0f af c2          	imul   rax,rdx
  802b3f:	89 c7                	mov    edi,eax
  802b41:	e8 f9 fc ff ff       	call   80283f <scan_dev>
  802b46:	85 c0                	test   eax,eax
  802b48:	74 07                	je     802b51 <init_vfs+0x4a>
  802b4a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802b4f:	eb 1b                	jmp    802b6c <init_vfs+0x65>
    for(;p;p=p->next)
  802b51:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802b55:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802b5c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  802b60:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802b65:	75 b9                	jne    802b20 <init_vfs+0x19>
    }
    return 0;
  802b67:	b8 00 00 00 00       	mov    eax,0x0
  802b6c:	c9                   	leave  
  802b6d:	c3                   	ret    

0000000000802b6e <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  802b6e:	f3 0f 1e fa          	endbr64 
  802b72:	55                   	push   rbp
  802b73:	48 89 e5             	mov    rbp,rsp
}
  802b76:	90                   	nop
  802b77:	5d                   	pop    rbp
  802b78:	c3                   	ret    

0000000000802b79 <load_driver>:
int load_driver(char *path)
{
  802b79:	f3 0f 1e fa          	endbr64 
  802b7d:	55                   	push   rbp
  802b7e:	48 89 e5             	mov    rbp,rsp
  802b81:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  802b85:	90                   	nop
  802b86:	5d                   	pop    rbp
  802b87:	c3                   	ret    

0000000000802b88 <reg_device>:

int reg_device(device* dev)
{
  802b88:	f3 0f 1e fa          	endbr64 
  802b8c:	55                   	push   rbp
  802b8d:	48 89 e5             	mov    rbp,rsp
  802b90:	53                   	push   rbx
  802b91:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  802b95:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  802b9c:	e9 42 01 00 00       	jmp    802ce3 <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  802ba1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802ba4:	48 63 d0             	movsxd rdx,eax
  802ba7:	48 89 d0             	mov    rax,rdx
  802baa:	48 c1 e0 02          	shl    rax,0x2
  802bae:	48 01 d0             	add    rax,rdx
  802bb1:	48 c1 e0 02          	shl    rax,0x2
  802bb5:	48 01 d0             	add    rax,rdx
  802bb8:	48 c1 e0 03          	shl    rax,0x3
  802bbc:	48 05 90 2e 40 00    	add    rax,0x402e90
  802bc2:	8b 00                	mov    eax,DWORD PTR [rax]
  802bc4:	85 c0                	test   eax,eax
  802bc6:	0f 85 13 01 00 00    	jne    802cdf <reg_device+0x157>
        {
            devs[i]=*dev;
  802bcc:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802bcf:	48 63 d0             	movsxd rdx,eax
  802bd2:	48 89 d0             	mov    rax,rdx
  802bd5:	48 c1 e0 02          	shl    rax,0x2
  802bd9:	48 01 d0             	add    rax,rdx
  802bdc:	48 c1 e0 02          	shl    rax,0x2
  802be0:	48 01 d0             	add    rax,rdx
  802be3:	48 c1 e0 03          	shl    rax,0x3
  802be7:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  802bee:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802bf2:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802bf5:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802bf9:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802bfc:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802c00:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802c04:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802c08:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802c0c:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802c10:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802c14:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802c18:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802c1c:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802c20:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802c24:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802c28:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802c2c:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802c30:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802c34:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802c38:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802c3c:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802c40:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802c44:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802c48:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802c4c:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802c50:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802c54:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802c58:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802c5c:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802c60:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802c64:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802c68:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802c6c:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802c70:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802c77:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802c7e:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802c85:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802c8c:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802c93:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802c9a:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802ca1:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  802ca8:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  802caf:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  802cb6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802cb9:	48 63 d0             	movsxd rdx,eax
  802cbc:	48 89 d0             	mov    rax,rdx
  802cbf:	48 c1 e0 02          	shl    rax,0x2
  802cc3:	48 01 d0             	add    rax,rdx
  802cc6:	48 c1 e0 02          	shl    rax,0x2
  802cca:	48 01 d0             	add    rax,rdx
  802ccd:	48 c1 e0 03          	shl    rax,0x3
  802cd1:	48 05 90 2e 40 00    	add    rax,0x402e90
  802cd7:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802cdd:	eb 0e                	jmp    802ced <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  802cdf:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802ce3:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  802ce7:	0f 8e b4 fe ff ff    	jle    802ba1 <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802ced:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  802cf1:	75 0a                	jne    802cfd <reg_device+0x175>
        return -1;
  802cf3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802cf8:	e9 6d 01 00 00       	jmp    802e6a <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802cfd:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  802d04:	00 
  802d05:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802d08:	48 63 d0             	movsxd rdx,eax
  802d0b:	48 89 d0             	mov    rax,rdx
  802d0e:	48 c1 e0 02          	shl    rax,0x2
  802d12:	48 01 d0             	add    rax,rdx
  802d15:	48 c1 e0 02          	shl    rax,0x2
  802d19:	48 01 d0             	add    rax,rdx
  802d1c:	48 c1 e0 03          	shl    rax,0x3
  802d20:	48 05 80 2e 40 00    	add    rax,0x402e80
  802d26:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  802d2a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802d2e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802d31:	83 f8 03             	cmp    eax,0x3
  802d34:	74 3b                	je     802d71 <reg_device+0x1e9>
  802d36:	83 f8 03             	cmp    eax,0x3
  802d39:	7f 4b                	jg     802d86 <reg_device+0x1fe>
  802d3b:	83 f8 01             	cmp    eax,0x1
  802d3e:	74 07                	je     802d47 <reg_device+0x1bf>
  802d40:	83 f8 02             	cmp    eax,0x2
  802d43:	74 17                	je     802d5c <reg_device+0x1d4>
  802d45:	eb 3f                	jmp    802d86 <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  802d47:	48 8b 05 32 57 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05732]        # 408480 <dev_tree>
  802d4e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802d52:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  802d59:	00 
        break;
  802d5a:	eb 34                	jmp    802d90 <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  802d5c:	48 8b 05 25 57 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05725]        # 408488 <dev_tree+0x8>
  802d63:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802d67:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  802d6e:	00 
        break;
  802d6f:	eb 1f                	jmp    802d90 <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  802d71:	48 8b 05 18 57 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05718]        # 408490 <dev_tree+0x10>
  802d78:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802d7c:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  802d83:	00 
        break;
  802d84:	eb 0a                	jmp    802d90 <reg_device+0x208>
    default:return -1;//不可能有其他情况
  802d86:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802d8b:	e9 da 00 00 00       	jmp    802e6a <reg_device+0x2e2>
    }
    if(!p){
  802d90:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  802d95:	75 2b                	jne    802dc2 <reg_device+0x23a>
        *pp=neo;
  802d97:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802d9b:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802d9f:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  802da2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802da6:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  802dad:	00 00 00 00 
  802db1:	eb 3d                	jmp    802df0 <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  802db3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802db7:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802dbe:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802dc2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802dc6:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802dcd:	48 85 c0             	test   rax,rax
  802dd0:	75 e1                	jne    802db3 <reg_device+0x22b>
        p->next=neo;
  802dd2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802dd6:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802dda:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  802de1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802de5:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802de9:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802df0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802df4:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802dfb:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802dff:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802e03:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802e06:	83 f8 04             	cmp    eax,0x4
  802e09:	74 3b                	je     802e46 <reg_device+0x2be>
  802e0b:	83 f8 04             	cmp    eax,0x4
  802e0e:	7f 56                	jg     802e66 <reg_device+0x2de>
  802e10:	83 f8 03             	cmp    eax,0x3
  802e13:	74 21                	je     802e36 <reg_device+0x2ae>
  802e15:	83 f8 03             	cmp    eax,0x3
  802e18:	7f 4c                	jg     802e66 <reg_device+0x2de>
  802e1a:	83 f8 01             	cmp    eax,0x1
  802e1d:	74 07                	je     802e26 <reg_device+0x29e>
  802e1f:	83 f8 02             	cmp    eax,0x2
  802e22:	74 32                	je     802e56 <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802e24:	eb 40                	jmp    802e66 <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  802e26:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802e2a:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802e31:	00 00 00 
        break;
  802e34:	eb 31                	jmp    802e67 <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  802e36:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802e3a:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802e41:	00 00 00 
        break;
  802e44:	eb 21                	jmp    802e67 <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  802e46:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802e4a:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  802e51:	00 00 00 
        break;
  802e54:	eb 11                	jmp    802e67 <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  802e56:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802e5a:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  802e61:	00 00 00 
        break;
  802e64:	eb 01                	jmp    802e67 <reg_device+0x2df>
        break;
  802e66:	90                   	nop
    }
    return i;
  802e67:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  802e6a:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802e6e:	c9                   	leave  
  802e6f:	c3                   	ret    

0000000000802e70 <reg_driver>:


int reg_driver(driver *drv)
{
  802e70:	f3 0f 1e fa          	endbr64 
  802e74:	55                   	push   rbp
  802e75:	48 89 e5             	mov    rbp,rsp
  802e78:	53                   	push   rbx
  802e79:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  802e7d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802e84:	e9 22 01 00 00       	jmp    802fab <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  802e89:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802e8c:	48 63 d0             	movsxd rdx,eax
  802e8f:	48 89 d0             	mov    rax,rdx
  802e92:	48 c1 e0 02          	shl    rax,0x2
  802e96:	48 01 d0             	add    rax,rdx
  802e99:	48 c1 e0 05          	shl    rax,0x5
  802e9d:	48 05 80 58 40 00    	add    rax,0x405880
  802ea3:	8b 00                	mov    eax,DWORD PTR [rax]
  802ea5:	85 c0                	test   eax,eax
  802ea7:	0f 85 fa 00 00 00    	jne    802fa7 <reg_driver+0x137>
        {
            drvs[i]=*drv;
  802ead:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802eb0:	48 63 d0             	movsxd rdx,eax
  802eb3:	48 89 d0             	mov    rax,rdx
  802eb6:	48 c1 e0 02          	shl    rax,0x2
  802eba:	48 01 d0             	add    rax,rdx
  802ebd:	48 c1 e0 05          	shl    rax,0x5
  802ec1:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  802ec8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802ecc:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802ecf:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802ed3:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802ed6:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802eda:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802ede:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802ee2:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802ee6:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802eea:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802eee:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802ef2:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802ef6:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802efa:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802efe:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802f02:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802f06:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802f0a:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802f0e:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802f12:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802f16:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802f1a:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802f1e:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802f22:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802f26:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802f2a:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802f2e:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802f32:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802f36:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802f3a:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802f3e:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802f42:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802f46:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802f4a:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802f51:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802f58:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802f5f:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802f66:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802f6d:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802f74:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802f7b:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  802f82:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802f85:	48 63 d0             	movsxd rdx,eax
  802f88:	48 89 d0             	mov    rax,rdx
  802f8b:	48 c1 e0 02          	shl    rax,0x2
  802f8f:	48 01 d0             	add    rax,rdx
  802f92:	48 c1 e0 05          	shl    rax,0x5
  802f96:	48 05 80 58 40 00    	add    rax,0x405880
  802f9c:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  802fa2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802fa5:	eb 13                	jmp    802fba <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  802fa7:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802fab:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  802faf:	0f 8e d4 fe ff ff    	jle    802e89 <reg_driver+0x19>
        }
    }
    return -1;
  802fb5:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802fba:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802fbe:	c9                   	leave  
  802fbf:	c3                   	ret    

0000000000802fc0 <sys_find_dev>:

int sys_find_dev(char *name)
{
  802fc0:	f3 0f 1e fa          	endbr64 
  802fc4:	55                   	push   rbp
  802fc5:	48 89 e5             	mov    rbp,rsp
  802fc8:	48 83 ec 20          	sub    rsp,0x20
  802fcc:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802fd0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802fd7:	eb 6c                	jmp    803045 <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802fd9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fdc:	48 63 d0             	movsxd rdx,eax
  802fdf:	48 89 d0             	mov    rax,rdx
  802fe2:	48 c1 e0 02          	shl    rax,0x2
  802fe6:	48 01 d0             	add    rax,rdx
  802fe9:	48 c1 e0 02          	shl    rax,0x2
  802fed:	48 01 d0             	add    rax,rdx
  802ff0:	48 c1 e0 03          	shl    rax,0x3
  802ff4:	48 05 90 2e 40 00    	add    rax,0x402e90
  802ffa:	8b 00                	mov    eax,DWORD PTR [rax]
  802ffc:	85 c0                	test   eax,eax
  802ffe:	74 41                	je     803041 <sys_find_dev+0x81>
  803000:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803003:	48 63 d0             	movsxd rdx,eax
  803006:	48 89 d0             	mov    rax,rdx
  803009:	48 c1 e0 02          	shl    rax,0x2
  80300d:	48 01 d0             	add    rax,rdx
  803010:	48 c1 e0 02          	shl    rax,0x2
  803014:	48 01 d0             	add    rax,rdx
  803017:	48 c1 e0 03          	shl    rax,0x3
  80301b:	48 83 c0 10          	add    rax,0x10
  80301f:	48 05 80 2e 40 00    	add    rax,0x402e80
  803025:	48 8d 50 04          	lea    rdx,[rax+0x4]
  803029:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80302d:	48 89 d6             	mov    rsi,rdx
  803030:	48 89 c7             	mov    rdi,rax
  803033:	e8 72 62 00 00       	call   8092aa <strcmp>
  803038:	85 c0                	test   eax,eax
  80303a:	75 05                	jne    803041 <sys_find_dev+0x81>
            return i;
  80303c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80303f:	eb 0f                	jmp    803050 <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  803041:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803045:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803049:	7e 8e                	jle    802fd9 <sys_find_dev+0x19>
    }
    return -1;
  80304b:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803050:	c9                   	leave  
  803051:	c3                   	ret    

0000000000803052 <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  803052:	f3 0f 1e fa          	endbr64 
  803056:	55                   	push   rbp
  803057:	48 89 e5             	mov    rbp,rsp
  80305a:	48 83 ec 30          	sub    rsp,0x30
  80305e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803062:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  803065:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  803069:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  803070:	eb 67                	jmp    8030d9 <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  803072:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803075:	48 63 d0             	movsxd rdx,eax
  803078:	48 89 d0             	mov    rax,rdx
  80307b:	48 c1 e0 02          	shl    rax,0x2
  80307f:	48 01 d0             	add    rax,rdx
  803082:	48 c1 e0 02          	shl    rax,0x2
  803086:	48 01 d0             	add    rax,rdx
  803089:	48 c1 e0 03          	shl    rax,0x3
  80308d:	48 05 90 2e 40 00    	add    rax,0x402e90
  803093:	8b 00                	mov    eax,DWORD PTR [rax]
  803095:	85 c0                	test   eax,eax
  803097:	74 3c                	je     8030d5 <sys_operate_dev+0x83>
  803099:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80309c:	48 63 d0             	movsxd rdx,eax
  80309f:	48 89 d0             	mov    rax,rdx
  8030a2:	48 c1 e0 02          	shl    rax,0x2
  8030a6:	48 01 d0             	add    rax,rdx
  8030a9:	48 c1 e0 02          	shl    rax,0x2
  8030ad:	48 01 d0             	add    rax,rdx
  8030b0:	48 c1 e0 03          	shl    rax,0x3
  8030b4:	48 83 c0 10          	add    rax,0x10
  8030b8:	48 05 80 2e 40 00    	add    rax,0x402e80
  8030be:	48 8d 50 04          	lea    rdx,[rax+0x4]
  8030c2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8030c6:	48 89 d6             	mov    rsi,rdx
  8030c9:	48 89 c7             	mov    rdi,rax
  8030cc:	e8 d9 61 00 00       	call   8092aa <strcmp>
  8030d1:	85 c0                	test   eax,eax
  8030d3:	74 0c                	je     8030e1 <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  8030d5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8030d9:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8030dd:	7e 93                	jle    803072 <sys_operate_dev+0x20>
  8030df:	eb 01                	jmp    8030e2 <sys_operate_dev+0x90>
            break;
  8030e1:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  8030e2:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8030e6:	75 0a                	jne    8030f2 <sys_operate_dev+0xa0>
  8030e8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8030ed:	e9 9c 02 00 00       	jmp    80338e <sys_operate_dev+0x33c>
    switch (func) {
  8030f2:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  8030f6:	0f 87 8d 02 00 00    	ja     803389 <sys_operate_dev+0x337>
  8030fc:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8030ff:	48 8b 04 c5 58 9f 80 	mov    rax,QWORD PTR [rax*8+0x809f58]
  803106:	00 
  803107:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  80310a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80310d:	48 63 d0             	movsxd rdx,eax
  803110:	48 89 d0             	mov    rax,rdx
  803113:	48 c1 e0 02          	shl    rax,0x2
  803117:	48 01 d0             	add    rax,rdx
  80311a:	48 c1 e0 02          	shl    rax,0x2
  80311e:	48 01 d0             	add    rax,rdx
  803121:	48 c1 e0 03          	shl    rax,0x3
  803125:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80312b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80312e:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  803132:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803136:	48 89 c7             	mov    rdi,rax
  803139:	ff d2                	call   rdx
  80313b:	e9 4e 02 00 00       	jmp    80338e <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  803140:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803143:	48 63 d0             	movsxd rdx,eax
  803146:	48 89 d0             	mov    rax,rdx
  803149:	48 c1 e0 02          	shl    rax,0x2
  80314d:	48 01 d0             	add    rax,rdx
  803150:	48 c1 e0 02          	shl    rax,0x2
  803154:	48 01 d0             	add    rax,rdx
  803157:	48 c1 e0 03          	shl    rax,0x3
  80315b:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803161:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803164:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  803168:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80316c:	48 89 c7             	mov    rdi,rax
  80316f:	ff d2                	call   rdx
  803171:	e9 18 02 00 00       	jmp    80338e <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  803176:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803179:	48 63 d0             	movsxd rdx,eax
  80317c:	48 89 d0             	mov    rax,rdx
  80317f:	48 c1 e0 02          	shl    rax,0x2
  803183:	48 01 d0             	add    rax,rdx
  803186:	48 c1 e0 02          	shl    rax,0x2
  80318a:	48 01 d0             	add    rax,rdx
  80318d:	48 c1 e0 03          	shl    rax,0x3
  803191:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803197:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80319a:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80319e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031a2:	48 89 c7             	mov    rdi,rax
  8031a5:	ff d2                	call   rdx
  8031a7:	e9 e2 01 00 00       	jmp    80338e <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  8031ac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031af:	48 63 d0             	movsxd rdx,eax
  8031b2:	48 89 d0             	mov    rax,rdx
  8031b5:	48 c1 e0 02          	shl    rax,0x2
  8031b9:	48 01 d0             	add    rax,rdx
  8031bc:	48 c1 e0 02          	shl    rax,0x2
  8031c0:	48 01 d0             	add    rax,rdx
  8031c3:	48 c1 e0 03          	shl    rax,0x3
  8031c7:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031cd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031d0:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  8031d4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031d8:	48 89 c7             	mov    rdi,rax
  8031db:	ff d2                	call   rdx
  8031dd:	e9 ac 01 00 00       	jmp    80338e <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  8031e2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031e5:	48 63 d0             	movsxd rdx,eax
  8031e8:	48 89 d0             	mov    rax,rdx
  8031eb:	48 c1 e0 02          	shl    rax,0x2
  8031ef:	48 01 d0             	add    rax,rdx
  8031f2:	48 c1 e0 02          	shl    rax,0x2
  8031f6:	48 01 d0             	add    rax,rdx
  8031f9:	48 c1 e0 03          	shl    rax,0x3
  8031fd:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803203:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803206:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  80320a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80320e:	48 89 c7             	mov    rdi,rax
  803211:	ff d2                	call   rdx
  803213:	e9 76 01 00 00       	jmp    80338e <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  803218:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80321b:	48 63 d0             	movsxd rdx,eax
  80321e:	48 89 d0             	mov    rax,rdx
  803221:	48 c1 e0 02          	shl    rax,0x2
  803225:	48 01 d0             	add    rax,rdx
  803228:	48 c1 e0 02          	shl    rax,0x2
  80322c:	48 01 d0             	add    rax,rdx
  80322f:	48 c1 e0 03          	shl    rax,0x3
  803233:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803239:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80323c:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  803240:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803244:	48 89 c7             	mov    rdi,rax
  803247:	ff d2                	call   rdx
  803249:	e9 40 01 00 00       	jmp    80338e <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  80324e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803251:	48 63 d0             	movsxd rdx,eax
  803254:	48 89 d0             	mov    rax,rdx
  803257:	48 c1 e0 02          	shl    rax,0x2
  80325b:	48 01 d0             	add    rax,rdx
  80325e:	48 c1 e0 02          	shl    rax,0x2
  803262:	48 01 d0             	add    rax,rdx
  803265:	48 c1 e0 03          	shl    rax,0x3
  803269:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80326f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803272:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  803276:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80327a:	48 89 c7             	mov    rdi,rax
  80327d:	ff d2                	call   rdx
  80327f:	e9 0a 01 00 00       	jmp    80338e <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  803284:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803287:	48 63 d0             	movsxd rdx,eax
  80328a:	48 89 d0             	mov    rax,rdx
  80328d:	48 c1 e0 02          	shl    rax,0x2
  803291:	48 01 d0             	add    rax,rdx
  803294:	48 c1 e0 02          	shl    rax,0x2
  803298:	48 01 d0             	add    rax,rdx
  80329b:	48 c1 e0 03          	shl    rax,0x3
  80329f:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8032a5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8032a8:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  8032ac:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8032b0:	48 89 c7             	mov    rdi,rax
  8032b3:	ff d2                	call   rdx
  8032b5:	e9 d4 00 00 00       	jmp    80338e <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  8032ba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032bd:	48 63 d0             	movsxd rdx,eax
  8032c0:	48 89 d0             	mov    rax,rdx
  8032c3:	48 c1 e0 02          	shl    rax,0x2
  8032c7:	48 01 d0             	add    rax,rdx
  8032ca:	48 c1 e0 02          	shl    rax,0x2
  8032ce:	48 01 d0             	add    rax,rdx
  8032d1:	48 c1 e0 03          	shl    rax,0x3
  8032d5:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8032db:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8032de:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  8032e2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8032e6:	48 89 c7             	mov    rdi,rax
  8032e9:	ff d2                	call   rdx
  8032eb:	e9 9e 00 00 00       	jmp    80338e <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  8032f0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032f3:	48 63 d0             	movsxd rdx,eax
  8032f6:	48 89 d0             	mov    rax,rdx
  8032f9:	48 c1 e0 02          	shl    rax,0x2
  8032fd:	48 01 d0             	add    rax,rdx
  803300:	48 c1 e0 02          	shl    rax,0x2
  803304:	48 01 d0             	add    rax,rdx
  803307:	48 c1 e0 03          	shl    rax,0x3
  80330b:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803311:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803314:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  803318:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80331c:	48 89 c7             	mov    rdi,rax
  80331f:	ff d2                	call   rdx
  803321:	eb 6b                	jmp    80338e <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  803323:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803326:	48 63 d0             	movsxd rdx,eax
  803329:	48 89 d0             	mov    rax,rdx
  80332c:	48 c1 e0 02          	shl    rax,0x2
  803330:	48 01 d0             	add    rax,rdx
  803333:	48 c1 e0 02          	shl    rax,0x2
  803337:	48 01 d0             	add    rax,rdx
  80333a:	48 c1 e0 03          	shl    rax,0x3
  80333e:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803344:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803347:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  80334b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80334f:	48 89 c7             	mov    rdi,rax
  803352:	ff d2                	call   rdx
  803354:	eb 38                	jmp    80338e <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  803356:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803359:	48 63 d0             	movsxd rdx,eax
  80335c:	48 89 d0             	mov    rax,rdx
  80335f:	48 c1 e0 02          	shl    rax,0x2
  803363:	48 01 d0             	add    rax,rdx
  803366:	48 c1 e0 02          	shl    rax,0x2
  80336a:	48 01 d0             	add    rax,rdx
  80336d:	48 c1 e0 03          	shl    rax,0x3
  803371:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803377:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80337a:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  80337e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803382:	48 89 c7             	mov    rdi,rax
  803385:	ff d2                	call   rdx
  803387:	eb 05                	jmp    80338e <sys_operate_dev+0x33c>
    }
    return -1;
  803389:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80338e:	c9                   	leave  
  80338f:	c3                   	ret    

0000000000803390 <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  803390:	f3 0f 1e fa          	endbr64 
  803394:	55                   	push   rbp
  803395:	48 89 e5             	mov    rbp,rsp
  803398:	48 83 ec 10          	sub    rsp,0x10
  80339c:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  80339f:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8033a2:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  8033a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033a9:	48 63 d0             	movsxd rdx,eax
  8033ac:	48 89 d0             	mov    rax,rdx
  8033af:	48 c1 e0 02          	shl    rax,0x2
  8033b3:	48 01 d0             	add    rax,rdx
  8033b6:	48 c1 e0 05          	shl    rax,0x5
  8033ba:	48 05 80 58 40 00    	add    rax,0x405880
  8033c0:	8b 00                	mov    eax,DWORD PTR [rax]
  8033c2:	85 c0                	test   eax,eax
  8033c4:	75 0a                	jne    8033d0 <call_drv_func+0x40>
  8033c6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8033cb:	e9 15 02 00 00       	jmp    8035e5 <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  8033d0:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  8033d4:	0f 87 06 02 00 00    	ja     8035e0 <call_drv_func+0x250>
  8033da:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8033dd:	48 8b 04 c5 b8 9f 80 	mov    rax,QWORD PTR [rax*8+0x809fb8]
  8033e4:	00 
  8033e5:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  8033e8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033eb:	48 63 d0             	movsxd rdx,eax
  8033ee:	48 89 d0             	mov    rax,rdx
  8033f1:	48 c1 e0 02          	shl    rax,0x2
  8033f5:	48 01 d0             	add    rax,rdx
  8033f8:	48 c1 e0 05          	shl    rax,0x5
  8033fc:	48 05 88 58 40 00    	add    rax,0x405888
  803402:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803405:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803409:	48 89 c7             	mov    rdi,rax
  80340c:	ff d2                	call   rdx
  80340e:	e9 d2 01 00 00       	jmp    8035e5 <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  803413:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803416:	48 63 d0             	movsxd rdx,eax
  803419:	48 89 d0             	mov    rax,rdx
  80341c:	48 c1 e0 02          	shl    rax,0x2
  803420:	48 01 d0             	add    rax,rdx
  803423:	48 c1 e0 05          	shl    rax,0x5
  803427:	48 05 90 58 40 00    	add    rax,0x405890
  80342d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803430:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803434:	48 89 c7             	mov    rdi,rax
  803437:	ff d2                	call   rdx
  803439:	e9 a7 01 00 00       	jmp    8035e5 <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  80343e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803441:	48 63 d0             	movsxd rdx,eax
  803444:	48 89 d0             	mov    rax,rdx
  803447:	48 c1 e0 02          	shl    rax,0x2
  80344b:	48 01 d0             	add    rax,rdx
  80344e:	48 c1 e0 05          	shl    rax,0x5
  803452:	48 05 98 58 40 00    	add    rax,0x405898
  803458:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80345b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80345f:	48 89 c7             	mov    rdi,rax
  803462:	ff d2                	call   rdx
  803464:	e9 7c 01 00 00       	jmp    8035e5 <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  803469:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80346c:	48 63 d0             	movsxd rdx,eax
  80346f:	48 89 d0             	mov    rax,rdx
  803472:	48 c1 e0 02          	shl    rax,0x2
  803476:	48 01 d0             	add    rax,rdx
  803479:	48 c1 e0 05          	shl    rax,0x5
  80347d:	48 05 a0 58 40 00    	add    rax,0x4058a0
  803483:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803486:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80348a:	48 89 c7             	mov    rdi,rax
  80348d:	ff d2                	call   rdx
  80348f:	e9 51 01 00 00       	jmp    8035e5 <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  803494:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803497:	48 63 d0             	movsxd rdx,eax
  80349a:	48 89 d0             	mov    rax,rdx
  80349d:	48 c1 e0 02          	shl    rax,0x2
  8034a1:	48 01 d0             	add    rax,rdx
  8034a4:	48 c1 e0 05          	shl    rax,0x5
  8034a8:	48 05 a8 58 40 00    	add    rax,0x4058a8
  8034ae:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8034b1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034b5:	48 89 c7             	mov    rdi,rax
  8034b8:	ff d2                	call   rdx
  8034ba:	e9 26 01 00 00       	jmp    8035e5 <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  8034bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034c2:	48 63 d0             	movsxd rdx,eax
  8034c5:	48 89 d0             	mov    rax,rdx
  8034c8:	48 c1 e0 02          	shl    rax,0x2
  8034cc:	48 01 d0             	add    rax,rdx
  8034cf:	48 c1 e0 05          	shl    rax,0x5
  8034d3:	48 05 b0 58 40 00    	add    rax,0x4058b0
  8034d9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8034dc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034e0:	48 89 c7             	mov    rdi,rax
  8034e3:	ff d2                	call   rdx
  8034e5:	e9 fb 00 00 00       	jmp    8035e5 <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  8034ea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034ed:	48 63 d0             	movsxd rdx,eax
  8034f0:	48 89 d0             	mov    rax,rdx
  8034f3:	48 c1 e0 02          	shl    rax,0x2
  8034f7:	48 01 d0             	add    rax,rdx
  8034fa:	48 c1 e0 05          	shl    rax,0x5
  8034fe:	48 05 b8 58 40 00    	add    rax,0x4058b8
  803504:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803507:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80350b:	48 89 c7             	mov    rdi,rax
  80350e:	ff d2                	call   rdx
  803510:	e9 d0 00 00 00       	jmp    8035e5 <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  803515:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803518:	48 63 d0             	movsxd rdx,eax
  80351b:	48 89 d0             	mov    rax,rdx
  80351e:	48 c1 e0 02          	shl    rax,0x2
  803522:	48 01 d0             	add    rax,rdx
  803525:	48 c1 e0 05          	shl    rax,0x5
  803529:	48 05 c0 58 40 00    	add    rax,0x4058c0
  80352f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803532:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803536:	48 89 c7             	mov    rdi,rax
  803539:	ff d2                	call   rdx
  80353b:	e9 a5 00 00 00       	jmp    8035e5 <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  803540:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803543:	48 63 d0             	movsxd rdx,eax
  803546:	48 89 d0             	mov    rax,rdx
  803549:	48 c1 e0 02          	shl    rax,0x2
  80354d:	48 01 d0             	add    rax,rdx
  803550:	48 c1 e0 05          	shl    rax,0x5
  803554:	48 05 c8 58 40 00    	add    rax,0x4058c8
  80355a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80355d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803561:	48 89 c7             	mov    rdi,rax
  803564:	ff d2                	call   rdx
  803566:	eb 7d                	jmp    8035e5 <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  803568:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80356b:	48 63 d0             	movsxd rdx,eax
  80356e:	48 89 d0             	mov    rax,rdx
  803571:	48 c1 e0 02          	shl    rax,0x2
  803575:	48 01 d0             	add    rax,rdx
  803578:	48 c1 e0 05          	shl    rax,0x5
  80357c:	48 05 d0 58 40 00    	add    rax,0x4058d0
  803582:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803585:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803589:	48 89 c7             	mov    rdi,rax
  80358c:	ff d2                	call   rdx
  80358e:	eb 55                	jmp    8035e5 <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  803590:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803593:	48 63 d0             	movsxd rdx,eax
  803596:	48 89 d0             	mov    rax,rdx
  803599:	48 c1 e0 02          	shl    rax,0x2
  80359d:	48 01 d0             	add    rax,rdx
  8035a0:	48 c1 e0 05          	shl    rax,0x5
  8035a4:	48 05 d8 58 40 00    	add    rax,0x4058d8
  8035aa:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8035ad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8035b1:	48 89 c7             	mov    rdi,rax
  8035b4:	ff d2                	call   rdx
  8035b6:	eb 2d                	jmp    8035e5 <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  8035b8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8035bb:	48 63 d0             	movsxd rdx,eax
  8035be:	48 89 d0             	mov    rax,rdx
  8035c1:	48 c1 e0 02          	shl    rax,0x2
  8035c5:	48 01 d0             	add    rax,rdx
  8035c8:	48 c1 e0 05          	shl    rax,0x5
  8035cc:	48 05 e0 58 40 00    	add    rax,0x4058e0
  8035d2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8035d5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8035d9:	48 89 c7             	mov    rdi,rax
  8035dc:	ff d2                	call   rdx
  8035de:	eb 05                	jmp    8035e5 <call_drv_func+0x255>
    }
    return -1;
  8035e0:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8035e5:	c9                   	leave  
  8035e6:	c3                   	ret    

00000000008035e7 <dispose_device>:
int dispose_device(int dev){
  8035e7:	f3 0f 1e fa          	endbr64 
  8035eb:	55                   	push   rbp
  8035ec:	48 89 e5             	mov    rbp,rsp
  8035ef:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  8035f2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8035f5:	48 63 d0             	movsxd rdx,eax
  8035f8:	48 89 d0             	mov    rax,rdx
  8035fb:	48 c1 e0 02          	shl    rax,0x2
  8035ff:	48 01 d0             	add    rax,rdx
  803602:	48 c1 e0 02          	shl    rax,0x2
  803606:	48 01 d0             	add    rax,rdx
  803609:	48 c1 e0 03          	shl    rax,0x3
  80360d:	48 05 90 2e 40 00    	add    rax,0x402e90
  803613:	8b 00                	mov    eax,DWORD PTR [rax]
  803615:	83 f8 01             	cmp    eax,0x1
  803618:	74 07                	je     803621 <dispose_device+0x3a>
  80361a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80361f:	eb 62                	jmp    803683 <dispose_device+0x9c>
    device* p=&devs[dev];
  803621:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803624:	48 63 d0             	movsxd rdx,eax
  803627:	48 89 d0             	mov    rax,rdx
  80362a:	48 c1 e0 02          	shl    rax,0x2
  80362e:	48 01 d0             	add    rax,rdx
  803631:	48 c1 e0 02          	shl    rax,0x2
  803635:	48 01 d0             	add    rax,rdx
  803638:	48 c1 e0 03          	shl    rax,0x3
  80363c:	48 05 80 2e 40 00    	add    rax,0x402e80
  803642:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  803646:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80364a:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803651:	48 85 c0             	test   rax,rax
  803654:	74 1d                	je     803673 <dispose_device+0x8c>
  803656:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80365a:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803661:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  803665:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  80366c:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  803673:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803677:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  80367e:	b8 00 00 00 00       	mov    eax,0x0
}
  803683:	5d                   	pop    rbp
  803684:	c3                   	ret    

0000000000803685 <dispose_driver>:
int dispose_driver(driver *drv){
  803685:	f3 0f 1e fa          	endbr64 
  803689:	55                   	push   rbp
  80368a:	48 89 e5             	mov    rbp,rsp
  80368d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  803691:	90                   	nop
  803692:	5d                   	pop    rbp
  803693:	c3                   	ret    

0000000000803694 <get_dev>:

device *get_dev(int devi)
{
  803694:	f3 0f 1e fa          	endbr64 
  803698:	55                   	push   rbp
  803699:	48 89 e5             	mov    rbp,rsp
  80369c:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  80369f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036a2:	48 63 d0             	movsxd rdx,eax
  8036a5:	48 89 d0             	mov    rax,rdx
  8036a8:	48 c1 e0 02          	shl    rax,0x2
  8036ac:	48 01 d0             	add    rax,rdx
  8036af:	48 c1 e0 02          	shl    rax,0x2
  8036b3:	48 01 d0             	add    rax,rdx
  8036b6:	48 c1 e0 03          	shl    rax,0x3
  8036ba:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  8036c0:	5d                   	pop    rbp
  8036c1:	c3                   	ret    

00000000008036c2 <get_drv>:
driver *get_drv(int drvi)
{
  8036c2:	f3 0f 1e fa          	endbr64 
  8036c6:	55                   	push   rbp
  8036c7:	48 89 e5             	mov    rbp,rsp
  8036ca:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  8036cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036d0:	48 63 d0             	movsxd rdx,eax
  8036d3:	48 89 d0             	mov    rax,rdx
  8036d6:	48 c1 e0 02          	shl    rax,0x2
  8036da:	48 01 d0             	add    rax,rdx
  8036dd:	48 c1 e0 05          	shl    rax,0x5
  8036e1:	48 05 80 58 40 00    	add    rax,0x405880
}
  8036e7:	5d                   	pop    rbp
  8036e8:	c3                   	ret    

00000000008036e9 <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  8036e9:	f3 0f 1e fa          	endbr64 
  8036ed:	55                   	push   rbp
  8036ee:	48 89 e5             	mov    rbp,rsp
  8036f1:	53                   	push   rbx
  8036f2:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  8036f6:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  8036fd:	eb 23                	jmp    803722 <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  8036ff:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803702:	48 63 d0             	movsxd rdx,eax
  803705:	48 89 d0             	mov    rax,rdx
  803708:	48 01 c0             	add    rax,rax
  80370b:	48 01 d0             	add    rax,rdx
  80370e:	48 c1 e0 06          	shl    rax,0x6
  803712:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803718:	8b 00                	mov    eax,DWORD PTR [rax]
  80371a:	85 c0                	test   eax,eax
  80371c:	74 0c                	je     80372a <make_request+0x41>
    for(;i<NR_REQS;i++)
  80371e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  803722:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  803726:	7e d7                	jle    8036ff <make_request+0x16>
  803728:	eb 01                	jmp    80372b <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  80372a:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  80372b:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  80372f:	75 0a                	jne    80373b <make_request+0x52>
  803731:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803736:	e9 e7 01 00 00       	jmp    803922 <make_request+0x239>
    reqs[i]=*args;//放入数组
  80373b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80373e:	48 63 d0             	movsxd rdx,eax
  803741:	48 89 d0             	mov    rax,rdx
  803744:	48 01 c0             	add    rax,rax
  803747:	48 01 d0             	add    rax,rdx
  80374a:	48 c1 e0 06          	shl    rax,0x6
  80374e:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803755:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803759:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80375c:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  803760:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  803763:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  803767:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  80376b:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  80376f:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  803773:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  803777:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  80377b:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  80377f:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  803783:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  803787:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  80378b:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  80378f:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  803793:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  803797:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  80379b:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  80379f:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  8037a3:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  8037a7:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  8037ab:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  8037af:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  8037b3:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  8037b7:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  8037bb:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  8037bf:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  8037c3:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  8037c7:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  8037cb:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  8037cf:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  8037d3:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  8037d7:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  8037de:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  8037e5:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  8037ec:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  8037f3:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  8037fa:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  803801:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  803808:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  80380f:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  803816:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  80381d:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  803824:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  80382b:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  803832:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  803839:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  803840:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  803847:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80384b:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  803851:	48 63 d0             	movsxd rdx,eax
  803854:	48 89 d0             	mov    rax,rdx
  803857:	48 c1 e0 02          	shl    rax,0x2
  80385b:	48 01 d0             	add    rax,rdx
  80385e:	48 c1 e0 02          	shl    rax,0x2
  803862:	48 01 d0             	add    rax,rdx
  803865:	48 c1 e0 03          	shl    rax,0x3
  803869:	48 05 80 2e 40 00    	add    rax,0x402e80
  80386f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  803873:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803877:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  80387e:	48 85 c0             	test   rax,rax
  803881:	75 27                	jne    8038aa <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  803883:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803886:	48 63 d0             	movsxd rdx,eax
  803889:	48 89 d0             	mov    rax,rdx
  80388c:	48 01 c0             	add    rax,rax
  80388f:	48 01 d0             	add    rax,rdx
  803892:	48 c1 e0 06          	shl    rax,0x6
  803896:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  80389d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8038a1:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  8038a8:	eb 75                	jmp    80391f <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  8038aa:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8038ae:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8038b5:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  8038b9:	eb 0f                	jmp    8038ca <make_request+0x1e1>
  8038bb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8038bf:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  8038c6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8038ca:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8038ce:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  8038d5:	48 85 c0             	test   rax,rax
  8038d8:	75 e1                	jne    8038bb <make_request+0x1d2>
        p->next=&reqs[i];
  8038da:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8038dd:	48 63 d0             	movsxd rdx,eax
  8038e0:	48 89 d0             	mov    rax,rdx
  8038e3:	48 01 c0             	add    rax,rax
  8038e6:	48 01 d0             	add    rax,rdx
  8038e9:	48 c1 e0 06          	shl    rax,0x6
  8038ed:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8038f4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8038f8:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  8038ff:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803902:	48 63 d0             	movsxd rdx,eax
  803905:	48 89 d0             	mov    rax,rdx
  803908:	48 01 c0             	add    rax,rax
  80390b:	48 01 d0             	add    rax,rdx
  80390e:	48 c1 e0 06          	shl    rax,0x6
  803912:	48 05 38 6d 40 00    	add    rax,0x406d38
  803918:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  80391f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803922:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  803926:	c9                   	leave  
  803927:	c3                   	ret    

0000000000803928 <do_req>:
//取出一个申请并且执行
int do_req()
{
  803928:	f3 0f 1e fa          	endbr64 
  80392c:	55                   	push   rbp
  80392d:	48 89 e5             	mov    rbp,rsp
  803930:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  803934:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80393b:	e9 ab 00 00 00       	jmp    8039eb <do_req+0xc3>
    {
        device* p=dev_tree[i];
  803940:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803943:	48 98                	cdqe   
  803945:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  80394c:	00 
  80394d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  803951:	e9 86 00 00 00       	jmp    8039dc <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  803956:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80395a:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803961:	48 85 c0             	test   rax,rax
  803964:	75 67                	jne    8039cd <do_req+0xa5>
  803966:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80396a:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803971:	48 85 c0             	test   rax,rax
  803974:	74 57                	je     8039cd <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  803976:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80397a:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  803981:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803985:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  80398c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803990:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803997:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  80399e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8039a2:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  8039a9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8039ad:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  8039b3:	48 98                	cdqe   
  8039b5:	48 8b 14 c5 c0 99 80 	mov    rdx,QWORD PTR [rax*8+0x8099c0]
  8039bc:	00 
  8039bd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8039c1:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  8039c8:	48 89 c7             	mov    rdi,rax
  8039cb:	ff d2                	call   rdx
        for(;p;p=p->next)
  8039cd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8039d1:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8039d8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8039dc:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8039e1:	0f 85 6f ff ff ff    	jne    803956 <do_req+0x2e>
    for(int i=0;i<3;i++)
  8039e7:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8039eb:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8039ef:	0f 8e 4b ff ff ff    	jle    803940 <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  8039f5:	b8 00 00 00 00       	mov    eax,0x0
}
  8039fa:	c9                   	leave  
  8039fb:	c3                   	ret    

00000000008039fc <wait_on_req>:


void wait_on_req(int reqi)
{
  8039fc:	f3 0f 1e fa          	endbr64 
  803a00:	55                   	push   rbp
  803a01:	48 89 e5             	mov    rbp,rsp
  803a04:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  803a07:	90                   	nop
  803a08:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a0b:	48 63 d0             	movsxd rdx,eax
  803a0e:	48 89 d0             	mov    rax,rdx
  803a11:	48 01 c0             	add    rax,rax
  803a14:	48 01 d0             	add    rax,rdx
  803a17:	48 c1 e0 06          	shl    rax,0x6
  803a1b:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803a21:	8b 00                	mov    eax,DWORD PTR [rax]
  803a23:	83 f8 03             	cmp    eax,0x3
  803a26:	75 e0                	jne    803a08 <wait_on_req+0xc>
}
  803a28:	90                   	nop
  803a29:	90                   	nop
  803a2a:	5d                   	pop    rbp
  803a2b:	c3                   	ret    

0000000000803a2c <clear_req>:
void clear_req(int reqi)
{
  803a2c:	f3 0f 1e fa          	endbr64 
  803a30:	55                   	push   rbp
  803a31:	48 89 e5             	mov    rbp,rsp
  803a34:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  803a37:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a3a:	48 63 d0             	movsxd rdx,eax
  803a3d:	48 89 d0             	mov    rax,rdx
  803a40:	48 01 c0             	add    rax,rax
  803a43:	48 01 d0             	add    rax,rdx
  803a46:	48 c1 e0 06          	shl    rax,0x6
  803a4a:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803a50:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  803a56:	90                   	nop
  803a57:	5d                   	pop    rbp
  803a58:	c3                   	ret    

0000000000803a59 <init_proc>:
struct process task[MAX_PROC_COUNT];
TSS scene_saver;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  803a59:	f3 0f 1e fa          	endbr64 
  803a5d:	55                   	push   rbp
  803a5e:	48 89 e5             	mov    rbp,rsp
  803a61:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803a65:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803a6c:	eb 4c                	jmp    803aba <init_proc+0x61>
        task[i].pid=-1;
  803a6e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a71:	48 98                	cdqe   
  803a73:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803a7a:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803a80:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  803a86:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a89:	48 98                	cdqe   
  803a8b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803a92:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803a98:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  803a9e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803aa1:	48 98                	cdqe   
  803aa3:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803aaa:	48 05 00 85 40 00    	add    rax,0x408500
  803ab0:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803ab6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803aba:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803abe:	7e ae                	jle    803a6e <init_proc+0x15>
    }
    cur_proc=0;//no proc
  803ac0:	c7 05 a6 e5 c0 ff 00 	mov    DWORD PTR [rip+0xffffffffffc0e5a6],0x0        # 412070 <cur_proc>
  803ac7:	00 00 00 
    pidd=1;
  803aca:	c7 05 a0 e5 c0 ff 01 	mov    DWORD PTR [rip+0xffffffffffc0e5a0],0x1        # 412074 <pidd>
  803ad1:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  803ad4:	b8 00 00 00 00       	mov    eax,0x0
  803ad9:	e8 38 00 00 00       	call   803b16 <create_proc>
  803ade:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  803ae1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803ae4:	48 98                	cdqe   
  803ae6:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803aed:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803af3:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  803af9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803afc:	83 c0 03             	add    eax,0x3
  803aff:	c1 e0 04             	shl    eax,0x4
  803b02:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  803b05:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803b08:	01 c0                	add    eax,eax
  803b0a:	83 c0 05             	add    eax,0x5
  803b0d:	c1 e0 03             	shl    eax,0x3
  803b10:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
}
  803b13:	90                   	nop
  803b14:	c9                   	leave  
  803b15:	c3                   	ret    

0000000000803b16 <create_proc>:

int create_proc()
{
  803b16:	f3 0f 1e fa          	endbr64 
  803b1a:	55                   	push   rbp
  803b1b:	48 89 e5             	mov    rbp,rsp
  803b1e:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  803b22:	b8 00 00 00 00       	mov    eax,0x0
  803b27:	e8 7d 00 00 00       	call   803ba9 <req_proc>
  803b2c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  803b2f:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  803b33:	75 07                	jne    803b3c <create_proc+0x26>
  803b35:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803b3a:	eb 6b                	jmp    803ba7 <create_proc+0x91>
    int curesp=0x9fc00-1;
  803b3c:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%esp,%0":"=m"(curesp));
  803b43:	89 65 f8             	mov    DWORD PTR [rbp-0x8],esp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0,0,0,0,0x17,0xf,0x17,0x17,0x17,0x17,curesp,0,0,0,0,index);
  803b46:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803b49:	48 98                	cdqe   
  803b4b:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  803b4e:	52                   	push   rdx
  803b4f:	6a 00                	push   0x0
  803b51:	6a 00                	push   0x0
  803b53:	6a 00                	push   0x0
  803b55:	6a 00                	push   0x0
  803b57:	50                   	push   rax
  803b58:	6a 17                	push   0x17
  803b5a:	6a 17                	push   0x17
  803b5c:	6a 17                	push   0x17
  803b5e:	6a 17                	push   0x17
  803b60:	41 b9 0f 00 00 00    	mov    r9d,0xf
  803b66:	41 b8 17 00 00 00    	mov    r8d,0x17
  803b6c:	b9 00 00 00 00       	mov    ecx,0x0
  803b71:	ba 00 00 00 00       	mov    edx,0x0
  803b76:	be 00 00 00 00       	mov    esi,0x0
  803b7b:	bf 00 00 00 00       	mov    edi,0x0
  803b80:	e8 f0 00 00 00       	call   803c75 <set_proc>
  803b85:	48 83 c4 50          	add    rsp,0x50
    task[index].tss.eip=(long)proc_zero;
  803b89:	ba f9 3e 80 00       	mov    edx,0x803ef9
  803b8e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b91:	48 98                	cdqe   
  803b93:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803b9a:	48 05 70 86 40 00    	add    rax,0x408670
  803ba0:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx

    return index;
  803ba4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803ba7:	c9                   	leave  
  803ba8:	c3                   	ret    

0000000000803ba9 <req_proc>:
int req_proc(){
  803ba9:	f3 0f 1e fa          	endbr64 
  803bad:	55                   	push   rbp
  803bae:	48 89 e5             	mov    rbp,rsp
    int num=0;
  803bb1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803bb8:	eb 04                	jmp    803bbe <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  803bba:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803bbe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803bc1:	48 98                	cdqe   
  803bc3:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803bca:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803bd0:	8b 00                	mov    eax,DWORD PTR [rax]
  803bd2:	83 f8 ff             	cmp    eax,0xffffffff
  803bd5:	74 1f                	je     803bf6 <req_proc+0x4d>
  803bd7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803bda:	48 98                	cdqe   
  803bdc:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803be3:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803be9:	8b 00                	mov    eax,DWORD PTR [rax]
  803beb:	83 f8 03             	cmp    eax,0x3
  803bee:	74 06                	je     803bf6 <req_proc+0x4d>
  803bf0:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803bf4:	7e c4                	jle    803bba <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  803bf6:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803bfa:	7e 07                	jle    803c03 <req_proc+0x5a>
        return -1;
  803bfc:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803c01:	eb 70                	jmp    803c73 <req_proc+0xca>
    task[num].pid=pidd++;
  803c03:	8b 05 6b e4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e46b]        # 412074 <pidd>
  803c09:	8d 50 01             	lea    edx,[rax+0x1]
  803c0c:	89 15 62 e4 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e462],edx        # 412074 <pidd>
  803c12:	89 c2                	mov    edx,eax
  803c14:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c17:	48 98                	cdqe   
  803c19:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803c20:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803c26:	89 10                	mov    DWORD PTR [rax],edx
    task[num].stat=ENDED;
  803c28:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c2b:	48 98                	cdqe   
  803c2d:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803c34:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803c3a:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  803c40:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c43:	48 98                	cdqe   
  803c45:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803c4c:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803c52:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803c58:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803c5b:	48 98                	cdqe   
  803c5d:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803c64:	48 05 ac 84 40 00    	add    rax,0x4084ac
  803c6a:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  803c70:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803c73:	5d                   	pop    rbp
  803c74:	c3                   	ret    

0000000000803c75 <set_proc>:
void set_proc(long eax,long ebx,long ecx,long edx,long es,long cs,long ss,long ds,long fs,long gs\
,long esp,long ebp,long esi,long edi,long eflags,int proc_nr){
  803c75:	f3 0f 1e fa          	endbr64 
  803c79:	55                   	push   rbp
  803c7a:	48 89 e5             	mov    rbp,rsp
  803c7d:	48 83 ec 40          	sub    rsp,0x40
  803c81:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803c85:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803c89:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803c8d:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803c91:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  803c95:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803c99:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803c9c:	48 98                	cdqe   
  803c9e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803ca5:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803cab:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->tss.eax=eax;
  803caf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803cb3:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803cb7:	48 89 90 ec 01 00 00 	mov    QWORD PTR [rax+0x1ec],rdx
    proc->tss.ebx=ebx;
  803cbe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803cc2:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  803cc6:	48 89 90 04 02 00 00 	mov    QWORD PTR [rax+0x204],rdx
    proc->tss.ecx=ecx;
  803ccd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803cd1:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803cd5:	48 89 90 f4 01 00 00 	mov    QWORD PTR [rax+0x1f4],rdx
    proc->tss.edx=edx;
  803cdc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ce0:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  803ce4:	48 89 90 fc 01 00 00 	mov    QWORD PTR [rax+0x1fc],rdx
    proc->tss.es=es;
  803ceb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803cef:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803cf3:	48 89 90 2c 02 00 00 	mov    QWORD PTR [rax+0x22c],rdx
    proc->tss.cs=cs;
  803cfa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803cfe:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803d02:	48 89 90 34 02 00 00 	mov    QWORD PTR [rax+0x234],rdx
    proc->tss.ss=ss;
  803d09:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d0d:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803d11:	48 89 90 3c 02 00 00 	mov    QWORD PTR [rax+0x23c],rdx
    proc->tss.ss0=ss;
  803d18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d1c:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803d20:	48 89 90 ac 01 00 00 	mov    QWORD PTR [rax+0x1ac],rdx
    proc->tss.ss1=ss;
  803d27:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d2b:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803d2f:	48 89 90 bc 01 00 00 	mov    QWORD PTR [rax+0x1bc],rdx
    proc->tss.ss2=ss;
  803d36:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d3a:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803d3e:	48 89 90 cc 01 00 00 	mov    QWORD PTR [rax+0x1cc],rdx
    proc->tss.ds=ds;
  803d45:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d49:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803d4d:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    proc->tss.fs=fs;
  803d54:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d58:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803d5c:	48 89 90 4c 02 00 00 	mov    QWORD PTR [rax+0x24c],rdx
    proc->tss.gs=gs;
  803d63:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d67:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803d6b:	48 89 90 54 02 00 00 	mov    QWORD PTR [rax+0x254],rdx
    proc->tss.esp=esp;
  803d72:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d76:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803d7a:	48 89 90 0c 02 00 00 	mov    QWORD PTR [rax+0x20c],rdx
    proc->tss.esp0=esp;
  803d81:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d85:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803d89:	48 89 90 a4 01 00 00 	mov    QWORD PTR [rax+0x1a4],rdx
    proc->tss.esp1=esp;
  803d90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d94:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803d98:	48 89 90 b4 01 00 00 	mov    QWORD PTR [rax+0x1b4],rdx
    proc->tss.esp2=esp;
  803d9f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803da3:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803da7:	48 89 90 c4 01 00 00 	mov    QWORD PTR [rax+0x1c4],rdx
    proc->tss.ebp=ebp;
  803dae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803db2:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803db6:	48 89 90 14 02 00 00 	mov    QWORD PTR [rax+0x214],rdx
    proc->tss.esi=esi;
  803dbd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803dc1:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803dc5:	48 89 90 1c 02 00 00 	mov    QWORD PTR [rax+0x21c],rdx
    proc->tss.edi=edi;
  803dcc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803dd0:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803dd4:	48 89 90 24 02 00 00 	mov    QWORD PTR [rax+0x224],rdx
    proc->tss.eflags=0x202;//设置为默认值:0b 0010 0000 0010
  803ddb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ddf:	48 c7 80 e4 01 00 00 	mov    QWORD PTR [rax+0x1e4],0x202
  803de6:	02 02 00 00 
    //能接受中断
    proc->tss.eip=(long)proc_zero;
  803dea:	ba f9 3e 80 00       	mov    edx,0x803ef9
  803def:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803df3:	48 89 90 dc 01 00 00 	mov    QWORD PTR [rax+0x1dc],rdx

    proc->tss.cs=cs;
  803dfa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803dfe:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803e02:	48 89 90 34 02 00 00 	mov    QWORD PTR [rax+0x234],rdx
    proc->tss.ds=ds;
  803e09:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e0d:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803e11:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    proc->tss.es=es;
  803e18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e1c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803e20:	48 89 90 2c 02 00 00 	mov    QWORD PTR [rax+0x22c],rdx
    proc->tss.cr3=PAGE_INDEX_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803e27:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e2b:	48 c7 80 d4 01 00 00 	mov    QWORD PTR [rax+0x1d4],0x1000
  803e32:	00 10 00 00 

    proc->tss.ldt= _LDT_IND(proc_nr)*8;
  803e36:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803e39:	83 c0 03             	add    eax,0x3
  803e3c:	c1 e0 04             	shl    eax,0x4
  803e3f:	48 63 d0             	movsxd rdx,eax
  803e42:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e46:	48 89 90 5c 02 00 00 	mov    QWORD PTR [rax+0x25c],rdx
    //在gdt中添加tss
    fill_desc(&proc->tss,0xffff,SEG_SYS_TSS|SEG_PRESENT,_TSS_IND(proc_nr));
  803e4d:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803e50:	01 c0                	add    eax,eax
  803e52:	83 c0 05             	add    eax,0x5
  803e55:	89 c2                	mov    edx,eax
  803e57:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e5b:	48 05 9c 01 00 00    	add    rax,0x19c
  803e61:	89 d1                	mov    ecx,edx
  803e63:	ba 89 00 00 00       	mov    edx,0x89
  803e68:	be ff ff 00 00       	mov    esi,0xffff
  803e6d:	89 c7                	mov    edi,eax
  803e6f:	e8 ed 0d 00 00       	call   804c61 <fill_desc>
    //添加ldt
    fill_desc(proc->ldt, sizeof(proc->ldt),SEG_SYS_LDT|SEG_PRESENT, _LDT_IND(proc_nr));
  803e74:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803e77:	83 c0 03             	add    eax,0x3
  803e7a:	01 c0                	add    eax,eax
  803e7c:	89 c2                	mov    edx,eax
  803e7e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e82:	48 83 c0 34          	add    rax,0x34
  803e86:	89 d1                	mov    ecx,edx
  803e88:	ba 82 00 00 00       	mov    edx,0x82
  803e8d:	be 28 00 00 00       	mov    esi,0x28
  803e92:	89 c7                	mov    edi,eax
  803e94:	e8 c8 0d 00 00       	call   804c61 <fill_desc>
    //设置ldt
    fill_ldt_desc(0,0xffffffff,\
  803e99:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e9d:	48 83 c0 34          	add    rax,0x34
  803ea1:	48 89 c1             	mov    rcx,rax
  803ea4:	ba fe cf 00 00       	mov    edx,0xcffe
  803ea9:	be ff ff ff ff       	mov    esi,0xffffffff
  803eae:	bf 00 00 00 00       	mov    edi,0x0
  803eb3:	e8 d7 0e 00 00       	call   804d8f <fill_ldt_desc>
    SEG_CONFORMING_RW_CODE|SEG_DPL_3,&proc->ldt[0]);
    fill_ldt_desc(0,0xffffffff,\
  803eb8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ebc:	48 83 c0 3c          	add    rax,0x3c
  803ec0:	48 89 c1             	mov    rcx,rax
  803ec3:	ba f2 cf 00 00       	mov    edx,0xcff2
  803ec8:	be ff ff ff ff       	mov    esi,0xffffffff
  803ecd:	bf 00 00 00 00       	mov    edi,0x0
  803ed2:	e8 b8 0e 00 00       	call   804d8f <fill_ldt_desc>
    SEG_RW_DATA|SEG_DPL_3,&proc->ldt[1]);
    fill_ldt_desc(0x1c00000-0x1000,0x1000,\
  803ed7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803edb:	48 83 c0 44          	add    rax,0x44
  803edf:	48 89 c1             	mov    rcx,rax
  803ee2:	ba f6 00 00 00       	mov    edx,0xf6
  803ee7:	be 00 10 00 00       	mov    esi,0x1000
  803eec:	bf 00 f0 bf 01       	mov    edi,0x1bff000
  803ef1:	e8 99 0e 00 00       	call   804d8f <fill_ldt_desc>
    SEG_STACK|SEG_DPL_3,&proc->ldt[2]);

}
  803ef6:	90                   	nop
  803ef7:	c9                   	leave  
  803ef8:	c3                   	ret    

0000000000803ef9 <proc_zero>:
void proc_zero()
{
  803ef9:	f3 0f 1e fa          	endbr64 
  803efd:	55                   	push   rbp
  803efe:	48 89 e5             	mov    rbp,rsp

    while(1);
  803f01:	eb fe                	jmp    803f01 <proc_zero+0x8>

0000000000803f03 <manage_proc>:
}
void manage_proc(){
  803f03:	f3 0f 1e fa          	endbr64 
  803f07:	55                   	push   rbp
  803f08:	48 89 e5             	mov    rbp,rsp
  803f0b:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803f0f:	8b 05 5b e1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e15b]        # 412070 <cur_proc>
  803f15:	83 f8 ff             	cmp    eax,0xffffffff
  803f18:	74 2d                	je     803f47 <manage_proc+0x44>
        task[cur_proc].utime++;
  803f1a:	8b 05 50 e1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e150]        # 412070 <cur_proc>
  803f20:	48 63 d0             	movsxd rdx,eax
  803f23:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  803f2a:	48 81 c2 a8 84 40 00 	add    rdx,0x4084a8
  803f31:	8b 12                	mov    edx,DWORD PTR [rdx]
  803f33:	83 c2 01             	add    edx,0x1
  803f36:	48 98                	cdqe   
  803f38:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803f3f:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803f45:	89 10                	mov    DWORD PTR [rax],edx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803f47:	8b 05 23 e1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e123]        # 412070 <cur_proc>
  803f4d:	83 f8 ff             	cmp    eax,0xffffffff
  803f50:	74 3c                	je     803f8e <manage_proc+0x8b>
  803f52:	8b 05 18 e1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e118]        # 412070 <cur_proc>
  803f58:	48 98                	cdqe   
  803f5a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803f61:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803f67:	8b 00                	mov    eax,DWORD PTR [rax]
  803f69:	83 f8 01             	cmp    eax,0x1
  803f6c:	77 20                	ja     803f8e <manage_proc+0x8b>
    task[cur_proc].stat!=READY){
  803f6e:	8b 05 fc e0 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e0fc]        # 412070 <cur_proc>
  803f74:	48 98                	cdqe   
  803f76:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803f7d:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803f83:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803f85:	83 f8 01             	cmp    eax,0x1
  803f88:	0f 84 90 00 00 00    	je     80401e <manage_proc+0x11b>
        if(cur_proc!=-1)
  803f8e:	8b 05 dc e0 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e0dc]        # 412070 <cur_proc>
  803f94:	83 f8 ff             	cmp    eax,0xffffffff
  803f97:	74 1b                	je     803fb4 <manage_proc+0xb1>
            task[cur_proc].utime=0;
  803f99:	8b 05 d1 e0 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e0d1]        # 412070 <cur_proc>
  803f9f:	48 98                	cdqe   
  803fa1:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803fa8:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803fae:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=0;
  803fb4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  803fbb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803fc2:	eb 41                	jmp    804005 <manage_proc+0x102>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803fc4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803fc7:	48 98                	cdqe   
  803fc9:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803fd0:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803fd6:	8b 00                	mov    eax,DWORD PTR [rax]
  803fd8:	83 f8 ff             	cmp    eax,0xffffffff
  803fdb:	74 24                	je     804001 <manage_proc+0xfe>
  803fdd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803fe0:	48 98                	cdqe   
  803fe2:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803fe9:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803fef:	8b 00                	mov    eax,DWORD PTR [rax]
  803ff1:	83 f8 01             	cmp    eax,0x1
  803ff4:	75 0b                	jne    804001 <manage_proc+0xfe>
  803ff6:	8b 05 74 e0 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e074]        # 412070 <cur_proc>
  803ffc:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  803fff:	75 0c                	jne    80400d <manage_proc+0x10a>
        for(i=0;i<MAX_PROC_COUNT;i++){
  804001:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804005:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  804009:	7e b9                	jle    803fc4 <manage_proc+0xc1>
  80400b:	eb 01                	jmp    80400e <manage_proc+0x10b>
                break;
  80400d:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  80400e:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  804012:	7f 0d                	jg     804021 <manage_proc+0x11e>
            return;
        //switch
        switch_proc_tss(i);
  804014:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804017:	89 c7                	mov    edi,eax
  804019:	e8 06 00 00 00       	call   804024 <switch_proc_tss>
    }
    return;
  80401e:	90                   	nop
  80401f:	eb 01                	jmp    804022 <manage_proc+0x11f>
            return;
  804021:	90                   	nop
}
  804022:	c9                   	leave  
  804023:	c3                   	ret    

0000000000804024 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  804024:	f3 0f 1e fa          	endbr64 
  804028:	55                   	push   rbp
  804029:	48 89 e5             	mov    rbp,rsp
  80402c:	48 83 ec 20          	sub    rsp,0x20
  804030:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  804033:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804036:	01 c0                	add    eax,eax
  804038:	83 c0 05             	add    eax,0x5
  80403b:	c1 e0 03             	shl    eax,0x3
  80403e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  804041:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804044:	89 05 26 e0 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e026],eax        # 412070 <cur_proc>
    switch_proc_asm(sel);
  80404a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80404d:	89 c7                	mov    edi,eax
  80404f:	e8 57 58 00 00       	call   8098ab <switch_proc_asm>
}
  804054:	90                   	nop
  804055:	c9                   	leave  
  804056:	c3                   	ret    

0000000000804057 <switch_proc>:
void switch_proc(int pnr){
  804057:	f3 0f 1e fa          	endbr64 
  80405b:	55                   	push   rbp
  80405c:	48 89 e5             	mov    rbp,rsp
  80405f:	48 81 ec 80 02 00 00 	sub    rsp,0x280
  804066:	89 bd 8c fd ff ff    	mov    DWORD PTR [rbp-0x274],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  80406c:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  804072:	48 98                	cdqe   
  804074:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80407b:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  804082:	48 8d 85 90 fd ff ff 	lea    rax,[rbp-0x270]
  804089:	b9 4d 00 00 00       	mov    ecx,0x4d
  80408e:	48 89 c7             	mov    rdi,rax
  804091:	48 89 d6             	mov    rsi,rdx
  804094:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
  804097:	48 89 f2             	mov    rdx,rsi
  80409a:	48 89 f8             	mov    rax,rdi
  80409d:	8b 0a                	mov    ecx,DWORD PTR [rdx]
  80409f:	89 08                	mov    DWORD PTR [rax],ecx
    save_context(&task[cur_proc].tss);
  8040a1:	8b 05 c9 df c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dfc9]        # 412070 <cur_proc>
  8040a7:	48 98                	cdqe   
  8040a9:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8040b0:	48 05 90 01 00 00    	add    rax,0x190
  8040b6:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8040bc:	48 83 c0 0c          	add    rax,0xc
  8040c0:	48 89 c7             	mov    rdi,rax
  8040c3:	e8 69 00 00 00       	call   804131 <save_context>
    //重新设置0号进程
    task[0].tss.eip=proc_zero;
  8040c8:	b8 f9 3e 80 00       	mov    eax,0x803ef9
  8040cd:	48 89 05 a8 45 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc045a8],rax        # 40867c <task+0x1dc>
    task[0].tss.cr3=PAGE_INDEX_ADDR;
  8040d4:	48 c7 05 95 45 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc04595],0x1000        # 408674 <task+0x1d4>
  8040db:	00 10 00 00 
    task[0].tss.eflags=0x202;
  8040df:	48 c7 05 9a 45 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc0459a],0x202        # 408684 <task+0x1e4>
  8040e6:	02 02 00 00 
    cur_proc=pnr;
  8040ea:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  8040f0:	89 05 7a df c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0df7a],eax        # 412070 <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  8040f6:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  8040fc:	01 c0                	add    eax,eax
  8040fe:	83 c0 05             	add    eax,0x5
  804101:	c1 e0 03             	shl    eax,0x3
  804104:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(&task[pnr].tss);
  804107:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  80410d:	48 98                	cdqe   
  80410f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804116:	48 05 90 01 00 00    	add    rax,0x190
  80411c:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804122:	48 83 c0 0c          	add    rax,0xc
  804126:	48 89 c7             	mov    rdi,rax
  804129:	e8 9a 57 00 00       	call   8098c8 <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  80412e:	90                   	nop
  80412f:	c9                   	leave  
  804130:	c3                   	ret    

0000000000804131 <save_context>:
void save_context(TSS *tss)
{
  804131:	f3 0f 1e fa          	endbr64 
  804135:	55                   	push   rbp
  804136:	48 89 e5             	mov    rbp,rsp
  804139:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    tss->eip=scene_saver.eip;
  80413d:	48 8b 15 9c de c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0de9c]        # 411fe0 <scene_saver+0x40>
  804144:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804148:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    tss->eax=scene_saver.eax;
  80414c:	48 8b 15 9d de c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0de9d]        # 411ff0 <scene_saver+0x50>
  804153:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804157:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    tss->ebx=scene_saver.ebx;
  80415b:	48 8b 15 a6 de c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0dea6]        # 412008 <scene_saver+0x68>
  804162:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804166:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    tss->ecx=scene_saver.ecx;
  80416a:	48 8b 15 87 de c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0de87]        # 411ff8 <scene_saver+0x58>
  804171:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804175:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
    tss->edx=scene_saver.edx;
  804179:	48 8b 15 80 de c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0de80]        # 412000 <scene_saver+0x60>
  804180:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804184:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    tss->esi=scene_saver.esi;
  804188:	48 8b 15 91 de c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0de91]        # 412020 <scene_saver+0x80>
  80418f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804193:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    tss->edi=scene_saver.edi;
  80419a:	48 8b 15 87 de c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0de87]        # 412028 <scene_saver+0x88>
  8041a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8041a5:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
    tss->eflags=scene_saver.eflags;
  8041ac:	48 8b 15 35 de c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0de35]        # 411fe8 <scene_saver+0x48>
  8041b3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8041b7:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    tss->esp=scene_saver.esp;
  8041bb:	48 8b 15 4e de c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0de4e]        # 412010 <scene_saver+0x70>
  8041c2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8041c6:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    tss->ebp=scene_saver.ebp;
  8041ca:	48 8b 15 47 de c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0de47]        # 412018 <scene_saver+0x78>
  8041d1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8041d5:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
}
  8041d9:	90                   	nop
  8041da:	5d                   	pop    rbp
  8041db:	c3                   	ret    

00000000008041dc <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  8041dc:	f3 0f 1e fa          	endbr64 
  8041e0:	55                   	push   rbp
  8041e1:	48 89 e5             	mov    rbp,rsp
  8041e4:	48 83 ec 60          	sub    rsp,0x60
  8041e8:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  8041eb:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  8041ee:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  8041f1:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8041f7:	85 c0                	test   eax,eax
  8041f9:	0f 48 c2             	cmovs  eax,edx
  8041fc:	c1 f8 0c             	sar    eax,0xc
  8041ff:	89 c1                	mov    ecx,eax
  804201:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  804204:	99                   	cdq    
  804205:	c1 ea 14             	shr    edx,0x14
  804208:	01 d0                	add    eax,edx
  80420a:	25 ff 0f 00 00       	and    eax,0xfff
  80420f:	29 d0                	sub    eax,edx
  804211:	01 c8                	add    eax,ecx
  804213:	85 c0                	test   eax,eax
  804215:	0f 95 c0             	setne  al
  804218:	0f b6 c0             	movzx  eax,al
  80421b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  80421e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  804225:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80422c:	00 
    page_item *pgind=task[proc_index].tss.cr3;
  80422d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804230:	48 98                	cdqe   
  804232:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804239:	48 05 60 86 40 00    	add    rax,0x408660
  80423f:	48 8b 40 14          	mov    rax,QWORD PTR [rax+0x14]
  804243:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    pgind++;
  804247:	48 83 45 e8 08       	add    QWORD PTR [rbp-0x18],0x8
    for(int i=1;i<1024;i++)
  80424c:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x1
  804253:	e9 39 02 00 00       	jmp    804491 <palloc+0x2b5>
    {
        page_item* tblp=*pgind&0xfffff000;
  804258:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80425c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80425f:	25 00 f0 ff ff       	and    eax,0xfffff000
  804264:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        for(int j=0;j<1024;j++)
  804268:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
  80426f:	e9 07 02 00 00       	jmp    80447b <palloc+0x29f>
        {
            int v=*tblp&PAGE_PRESENT;
  804274:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804278:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80427b:	83 e0 01             	and    eax,0x1
  80427e:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
            if(!v)
  804281:	83 7d d0 00          	cmp    DWORD PTR [rbp-0x30],0x0
  804285:	0f 85 e7 01 00 00    	jne    804472 <palloc+0x296>
            {
                int new_pg=req_a_page();
  80428b:	b8 00 00 00 00       	mov    eax,0x0
  804290:	e8 65 d2 ff ff       	call   8014fa <req_a_page>
  804295:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
                if(new_pg==-1)
  804298:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  80429c:	0f 85 b9 00 00 00    	jne    80435b <palloc+0x17f>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  8042a2:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8042a5:	48 98                	cdqe   
  8042a7:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8042ae:	48 05 e4 84 40 00    	add    rax,0x4084e4
  8042b4:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8042b7:	0f b7 c0             	movzx  eax,ax
  8042ba:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  8042bd:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8042c0:	48 98                	cdqe   
  8042c2:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8042c9:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8042cf:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8042d3:	0f b7 c0             	movzx  eax,ax
  8042d6:	c1 e0 10             	shl    eax,0x10
  8042d9:	25 00 00 0f 00       	and    eax,0xf0000
  8042de:	01 45 b8             	add    DWORD PTR [rbp-0x48],eax
                    size+=c;
  8042e1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8042e4:	01 45 b8             	add    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  8042e7:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8042ea:	89 c2                	mov    edx,eax
  8042ec:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8042ef:	48 98                	cdqe   
  8042f1:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8042f8:	48 05 e4 84 40 00    	add    rax,0x4084e4
  8042fe:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  804301:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804304:	48 98                	cdqe   
  804306:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80430d:	48 05 e0 84 40 00    	add    rax,0x4084e0
  804313:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804317:	0f b7 c0             	movzx  eax,ax
  80431a:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    tmp_attr&=0xfff0;
  80431d:	81 65 b4 f0 ff 00 00 	and    DWORD PTR [rbp-0x4c],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804324:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804327:	c1 e8 10             	shr    eax,0x10
  80432a:	83 e0 0f             	and    eax,0xf
  80432d:	89 c2                	mov    edx,eax
  80432f:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  804332:	01 d0                	add    eax,edx
  804334:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  804337:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80433a:	89 c2                	mov    edx,eax
  80433c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80433f:	48 98                	cdqe   
  804341:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804348:	48 05 e0 84 40 00    	add    rax,0x4084e0
  80434e:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  804352:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804356:	e9 48 01 00 00       	jmp    8044a3 <palloc+0x2c7>
                }
                int addr=get_phyaddr(new_pg);
  80435b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80435e:	89 c7                	mov    edi,eax
  804360:	e8 02 d3 ff ff       	call   801667 <get_phyaddr>
  804365:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  804368:	8b 4d c8             	mov    ecx,DWORD PTR [rbp-0x38]
  80436b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80436f:	ba 07 00 00 00       	mov    edx,0x7
  804374:	89 ce                	mov    esi,ecx
  804376:	48 89 c7             	mov    rdi,rax
  804379:	e8 fc d2 ff ff       	call   80167a <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  80437e:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  804381:	c1 e0 0a             	shl    eax,0xa
  804384:	89 c2                	mov    edx,eax
  804386:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  804389:	01 d0                	add    eax,edx
  80438b:	c1 e0 0c             	shl    eax,0xc
  80438e:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                if(ptr==NULL)
  804391:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  804396:	75 12                	jne    8043aa <palloc+0x1ce>
                {
                    ptr=laddr;
  804398:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80439b:	48 98                	cdqe   
  80439d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
                    palloc_paddr=addr;
  8043a1:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  8043a4:	89 05 ce dc c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0dcce],eax        # 412078 <palloc_paddr>
                }
                page_c--;
  8043aa:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  8043ae:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  8043b2:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8043b6:	0f 85 b6 00 00 00    	jne    804472 <palloc+0x296>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  8043bc:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8043bf:	48 98                	cdqe   
  8043c1:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8043c8:	48 05 e4 84 40 00    	add    rax,0x4084e4
  8043ce:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8043d1:	0f b7 c0             	movzx  eax,ax
  8043d4:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  8043d7:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8043da:	48 98                	cdqe   
  8043dc:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8043e3:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8043e9:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8043ed:	0f b7 c0             	movzx  eax,ax
  8043f0:	c1 e0 10             	shl    eax,0x10
  8043f3:	25 00 00 0f 00       	and    eax,0xf0000
  8043f8:	01 45 c0             	add    DWORD PTR [rbp-0x40],eax
                    size+=c;
  8043fb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8043fe:	01 45 c0             	add    DWORD PTR [rbp-0x40],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  804401:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  804404:	89 c2                	mov    edx,eax
  804406:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804409:	48 98                	cdqe   
  80440b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804412:	48 05 e4 84 40 00    	add    rax,0x4084e4
  804418:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  80441b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80441e:	48 98                	cdqe   
  804420:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804427:	48 05 e0 84 40 00    	add    rax,0x4084e0
  80442d:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804431:	0f b7 c0             	movzx  eax,ax
  804434:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    tmp_attr&=0xfff0;
  804437:	81 65 bc f0 ff 00 00 	and    DWORD PTR [rbp-0x44],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  80443e:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  804441:	c1 e8 10             	shr    eax,0x10
  804444:	83 e0 0f             	and    eax,0xf
  804447:	89 c2                	mov    edx,eax
  804449:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80444c:	01 d0                	add    eax,edx
  80444e:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  804451:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804454:	89 c2                	mov    edx,eax
  804456:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804459:	48 98                	cdqe   
  80445b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804462:	48 05 e0 84 40 00    	add    rax,0x4084e0
  804468:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
                    return ptr;
  80446c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804470:	eb 31                	jmp    8044a3 <palloc+0x2c7>
                }
            }
            tblp++;
  804472:	48 83 45 d8 08       	add    QWORD PTR [rbp-0x28],0x8
        for(int j=0;j<1024;j++)
  804477:	83 45 d4 01          	add    DWORD PTR [rbp-0x2c],0x1
  80447b:	81 7d d4 ff 03 00 00 	cmp    DWORD PTR [rbp-0x2c],0x3ff
  804482:	0f 8e ec fd ff ff    	jle    804274 <palloc+0x98>
        }
        pgind++;
  804488:	48 83 45 e8 08       	add    QWORD PTR [rbp-0x18],0x8
    for(int i=1;i<1024;i++)
  80448d:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
  804491:	81 7d e4 ff 03 00 00 	cmp    DWORD PTR [rbp-0x1c],0x3ff
  804498:	0f 8e ba fd ff ff    	jle    804258 <palloc+0x7c>
    }
    return NULL;
  80449e:	b8 00 00 00 00       	mov    eax,0x0
}
  8044a3:	c9                   	leave  
  8044a4:	c3                   	ret    

00000000008044a5 <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  8044a5:	f3 0f 1e fa          	endbr64 
  8044a9:	55                   	push   rbp
  8044aa:	48 89 e5             	mov    rbp,rsp
  8044ad:	48 83 ec 10          	sub    rsp,0x10
  8044b1:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  8044b4:	8b 05 b6 db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dbb6]        # 412070 <cur_proc>
  8044ba:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8044bd:	89 d6                	mov    esi,edx
  8044bf:	89 c7                	mov    edi,eax
  8044c1:	e8 16 fd ff ff       	call   8041dc <palloc>
}
  8044c6:	c9                   	leave  
  8044c7:	c3                   	ret    

00000000008044c8 <proc_end>:
void proc_end()
{
  8044c8:	f3 0f 1e fa          	endbr64 
  8044cc:	55                   	push   rbp
  8044cd:	48 89 e5             	mov    rbp,rsp
  8044d0:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  8044d4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
  8044d7:	48 8b 05 ce 41 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc041ce]        # 4086ac <task+0x20c>
  8044de:	48 89 c4             	mov    rsp,rax
    del_proc(cur_proc);
  8044e1:	8b 05 89 db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0db89]        # 412070 <cur_proc>
  8044e7:	89 c7                	mov    edi,eax
  8044e9:	e8 75 00 00 00       	call   804563 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  8044ee:	8b 05 7c db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0db7c]        # 412070 <cur_proc>
  8044f4:	48 98                	cdqe   
  8044f6:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8044fd:	48 05 00 85 40 00    	add    rax,0x408500
  804503:	8b 00                	mov    eax,DWORD PTR [rax]
  804505:	83 f8 ff             	cmp    eax,0xffffffff
  804508:	74 4c                	je     804556 <proc_end+0x8e>
        task[task[cur_proc].parent_pid].stat=READY;
  80450a:	8b 05 60 db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0db60]        # 412070 <cur_proc>
  804510:	48 98                	cdqe   
  804512:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804519:	48 05 00 85 40 00    	add    rax,0x408500
  80451f:	8b 00                	mov    eax,DWORD PTR [rax]
  804521:	89 c0                	mov    eax,eax
  804523:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80452a:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804530:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  804536:	8b 05 34 db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0db34]        # 412070 <cur_proc>
  80453c:	48 98                	cdqe   
  80453e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804545:	48 05 00 85 40 00    	add    rax,0x408500
  80454b:	8b 00                	mov    eax,DWORD PTR [rax]
  80454d:	89 c7                	mov    edi,eax
  80454f:	e8 d0 fa ff ff       	call   804024 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  804554:	eb 0a                	jmp    804560 <proc_end+0x98>
        switch_proc_tss(0);
  804556:	bf 00 00 00 00       	mov    edi,0x0
  80455b:	e8 c4 fa ff ff       	call   804024 <switch_proc_tss>
}
  804560:	90                   	nop
  804561:	c9                   	leave  
  804562:	c3                   	ret    

0000000000804563 <del_proc>:
void del_proc(int pnr)
{
  804563:	f3 0f 1e fa          	endbr64 
  804567:	55                   	push   rbp
  804568:	48 89 e5             	mov    rbp,rsp
  80456b:	48 83 ec 30          	sub    rsp,0x30
  80456f:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  804572:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804575:	48 98                	cdqe   
  804577:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80457e:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804584:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  80458a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80458d:	48 98                	cdqe   
  80458f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804596:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80459c:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p=task[pnr].tss.cr3;
  8045a2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8045a5:	48 98                	cdqe   
  8045a7:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8045ae:	48 05 60 86 40 00    	add    rax,0x408660
  8045b4:	48 8b 40 14          	mov    rax,QWORD PTR [rax+0x14]
  8045b8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    p++;
  8045bc:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  8045c1:	eb 63                	jmp    804626 <del_proc+0xc3>
    {
        page_item *tp=*p&0xfffff000;
  8045c3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8045c7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8045ca:	25 00 f0 ff ff       	and    eax,0xfffff000
  8045cf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  8045d3:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8045da:	eb 30                	jmp    80460c <del_proc+0xa9>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  8045dc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8045e0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8045e3:	83 e0 01             	and    eax,0x1
  8045e6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  8045e9:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  8045ed:	74 14                	je     804603 <del_proc+0xa0>
            {
                free_page(*tp&0xfffff000);
  8045ef:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8045f3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8045f6:	25 00 f0 ff ff       	and    eax,0xfffff000
  8045fb:	48 89 c7             	mov    rdi,rax
  8045fe:	e8 a3 cf ff ff       	call   8015a6 <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  804603:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  804608:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80460c:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804613:	7e c7                	jle    8045dc <del_proc+0x79>
        }
        vmfree(tp);
  804615:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804619:	48 89 c7             	mov    rdi,rax
  80461c:	e8 0f cd ff ff       	call   801330 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804621:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  804626:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80462a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80462d:	83 e0 01             	and    eax,0x1
  804630:	48 85 c0             	test   rax,rax
  804633:	75 8e                	jne    8045c3 <del_proc+0x60>
    }
    //释放存放页目录的页面
    vmfree(p);
  804635:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804639:	48 89 c7             	mov    rdi,rax
  80463c:	e8 ef cc ff ff       	call   801330 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  804641:	90                   	nop
  804642:	c9                   	leave  
  804643:	c3                   	ret    

0000000000804644 <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  804644:	f3 0f 1e fa          	endbr64 
  804648:	55                   	push   rbp
  804649:	48 89 e5             	mov    rbp,rsp
  80464c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80464f:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  804652:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804656:	75 07                	jne    80465f <set_proc_stat+0x1b>
  804658:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80465d:	eb 79                	jmp    8046d8 <set_proc_stat+0x94>
    int i=0;
  80465f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  804666:	eb 04                	jmp    80466c <set_proc_stat+0x28>
  804668:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80466c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80466f:	48 98                	cdqe   
  804671:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804678:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80467e:	8b 10                	mov    edx,DWORD PTR [rax]
  804680:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804683:	39 c2                	cmp    edx,eax
  804685:	75 e1                	jne    804668 <set_proc_stat+0x24>
    if(i==MAX_PROC_COUNT)return -1;
  804687:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  80468b:	75 07                	jne    804694 <set_proc_stat+0x50>
  80468d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804692:	eb 44                	jmp    8046d8 <set_proc_stat+0x94>
    task[i].stat=stat;
  804694:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804697:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80469a:	48 63 d2             	movsxd rdx,edx
  80469d:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  8046a4:	48 81 c2 a4 84 40 00 	add    rdx,0x4084a4
  8046ab:	89 02                	mov    DWORD PTR [rdx],eax
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  8046ad:	8b 05 bd d9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d9bd]        # 412070 <cur_proc>
  8046b3:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8046b6:	75 1b                	jne    8046d3 <set_proc_stat+0x8f>
        task[cur_proc].utime=MAX_UTIME;
  8046b8:	8b 05 b2 d9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d9b2]        # 412070 <cur_proc>
  8046be:	48 98                	cdqe   
  8046c0:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8046c7:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8046cd:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  8046d3:	b8 00 00 00 00       	mov    eax,0x0
}
  8046d8:	5d                   	pop    rbp
  8046d9:	c3                   	ret    

00000000008046da <add_proc_openf>:

    return 0;
} */

int add_proc_openf(vfs_dir_entry *entry)
{
  8046da:	f3 0f 1e fa          	endbr64 
  8046de:	55                   	push   rbp
  8046df:	48 89 e5             	mov    rbp,rsp
  8046e2:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8046e6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8046ed:	eb 69                	jmp    804758 <add_proc_openf+0x7e>
        if(task[cur_proc].openf[i]==NULL)
  8046ef:	8b 05 7b d9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d97b]        # 412070 <cur_proc>
  8046f5:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8046f8:	48 63 d2             	movsxd rdx,edx
  8046fb:	48 83 c2 12          	add    rdx,0x12
  8046ff:	48 98                	cdqe   
  804701:	48 c1 e2 03          	shl    rdx,0x3
  804705:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80470c:	48 01 d0             	add    rax,rdx
  80470f:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804715:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804719:	48 85 c0             	test   rax,rax
  80471c:	75 36                	jne    804754 <add_proc_openf+0x7a>
        {
            task[cur_proc].openf[i]=entry;
  80471e:	8b 05 4c d9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d94c]        # 412070 <cur_proc>
  804724:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804727:	48 63 d2             	movsxd rdx,edx
  80472a:	48 83 c2 12          	add    rdx,0x12
  80472e:	48 98                	cdqe   
  804730:	48 c1 e2 03          	shl    rdx,0x3
  804734:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80473b:	48 01 d0             	add    rax,rdx
  80473e:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  804745:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804749:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
            return 0;
  80474d:	b8 00 00 00 00       	mov    eax,0x0
  804752:	eb 0f                	jmp    804763 <add_proc_openf+0x89>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804754:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804758:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  80475c:	7e 91                	jle    8046ef <add_proc_openf+0x15>
        }
    }
    return -1;//full
  80475e:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  804763:	5d                   	pop    rbp
  804764:	c3                   	ret    

0000000000804765 <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  804765:	f3 0f 1e fa          	endbr64 
  804769:	55                   	push   rbp
  80476a:	48 89 e5             	mov    rbp,rsp
  80476d:	48 83 ec 10          	sub    rsp,0x10
  804771:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  804774:	8b 05 f6 d8 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d8f6]        # 412070 <cur_proc>
  80477a:	89 c7                	mov    edi,eax
  80477c:	e8 e2 fd ff ff       	call   804563 <del_proc>
    return code;
  804781:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  804784:	c9                   	leave  
  804785:	c3                   	ret    

0000000000804786 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(int entry, vfs_dir_entry *cwd, vfs_dir_entry *exef)
{
  804786:	f3 0f 1e fa          	endbr64 
  80478a:	55                   	push   rbp
  80478b:	48 89 e5             	mov    rbp,rsp
  80478e:	48 83 ec 40          	sub    rsp,0x40
  804792:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  804795:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  804799:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    
    int i=req_proc();
  80479d:	b8 00 00 00 00       	mov    eax,0x0
  8047a2:	e8 02 f4 ff ff       	call   803ba9 <req_proc>
  8047a7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(i==-1)return -1;
  8047aa:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8047ae:	75 0a                	jne    8047ba <reg_proc+0x34>
  8047b0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8047b5:	e9 80 01 00 00       	jmp    80493a <reg_proc+0x1b4>
    /*set_proc(0,0,0,0,SEL_LDT_DATA,SEL_LDT_CODE,SEL_LDT_STACK,SEL_LDT_DATA\
    ,SEL_LDT_DATA,SEL_LDT_DATA,0x1c00000-4,0,0,0,0,i);*/
    set_proc(0,0,0,0,0x10,0x8,0x10,0x10\
  8047ba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8047bd:	50                   	push   rax
  8047be:	6a 00                	push   0x0
  8047c0:	6a 00                	push   0x0
  8047c2:	6a 00                	push   0x0
  8047c4:	6a 00                	push   0x0
  8047c6:	68 fc ff bf 01       	push   0x1bffffc
  8047cb:	6a 10                	push   0x10
  8047cd:	6a 10                	push   0x10
  8047cf:	6a 10                	push   0x10
  8047d1:	6a 10                	push   0x10
  8047d3:	41 b9 08 00 00 00    	mov    r9d,0x8
  8047d9:	41 b8 10 00 00 00    	mov    r8d,0x10
  8047df:	b9 00 00 00 00       	mov    ecx,0x0
  8047e4:	ba 00 00 00 00       	mov    edx,0x0
  8047e9:	be 00 00 00 00       	mov    esi,0x0
  8047ee:	bf 00 00 00 00       	mov    edi,0x0
  8047f3:	e8 7d f4 ff ff       	call   803c75 <set_proc>
  8047f8:	48 83 c4 50          	add    rsp,0x50
    ,0x10,0x10,0x1c00000-4,0,0,0,0,i);
    task[i].pdet=vmalloc();
  8047fc:	b8 00 00 00 00       	mov    eax,0x0
  804801:	e8 9b ca ff ff       	call   8012a1 <vmalloc>
  804806:	48 89 c2             	mov    rdx,rax
  804809:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80480c:	48 98                	cdqe   
  80480e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804815:	48 05 20 85 40 00    	add    rax,0x408520
  80481b:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    int *pt=vmalloc();
  80481f:	b8 00 00 00 00       	mov    eax,0x0
  804824:	e8 78 ca ff ff       	call   8012a1 <vmalloc>
  804829:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    task[i].pdet[0]=PAGE_TABLE_ADDR|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;
  80482d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804830:	48 98                	cdqe   
  804832:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804839:	48 05 20 85 40 00    	add    rax,0x408520
  80483f:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804843:	c7 00 07 20 00 00    	mov    DWORD PTR [rax],0x2007
    /*for(int j=0;j<32;j++)
        pt[j]=(PAGE_TABLE_ADDR+j*0x1000)|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;//复制内核页表*/
    //PAGE_TABLE_ADDR|PAGE_PRESENT;//复制内核页表
    //task[i].pdet[7]=PAGE_TABLE_ADDR+7*0x1000|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//sys.dll
    int *stackb=vmalloc();
  804849:	b8 00 00 00 00       	mov    eax,0x0
  80484e:	e8 4e ca ff ff       	call   8012a1 <vmalloc>
  804853:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    task[i].pdet[6]=(int)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  804857:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80485b:	83 c8 07             	or     eax,0x7
  80485e:	89 c2                	mov    edx,eax
  804860:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804863:	48 98                	cdqe   
  804865:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80486c:	48 05 20 85 40 00    	add    rax,0x408520
  804872:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804876:	48 83 c0 18          	add    rax,0x18
  80487a:	89 10                	mov    DWORD PTR [rax],edx
    stackb[1023]=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  80487c:	b8 00 00 00 00       	mov    eax,0x0
  804881:	e8 74 cc ff ff       	call   8014fa <req_a_page>
  804886:	89 c7                	mov    edi,eax
  804888:	e8 da cd ff ff       	call   801667 <get_phyaddr>
  80488d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804891:	48 81 c2 fc 0f 00 00 	add    rdx,0xffc
  804898:	83 c8 07             	or     eax,0x7
  80489b:	89 02                	mov    DWORD PTR [rdx],eax
    task[i].tss.cr3=task[i].pdet;
  80489d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8048a0:	48 98                	cdqe   
  8048a2:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8048a9:	48 05 20 85 40 00    	add    rax,0x408520
  8048af:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8048b3:	48 89 c2             	mov    rdx,rax
  8048b6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8048b9:	48 98                	cdqe   
  8048bb:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8048c2:	48 05 60 86 40 00    	add    rax,0x408660
  8048c8:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx

    task[i].stat=READY;
  8048cc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8048cf:	48 98                	cdqe   
  8048d1:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8048d8:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8048de:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  8048e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8048e7:	48 98                	cdqe   
  8048e9:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8048f0:	48 8d 90 20 85 40 00 	lea    rdx,[rax+0x408520]
  8048f7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8048fb:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    task[i].exef=exef;
  8048ff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804902:	48 98                	cdqe   
  804904:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80490b:	48 8d 90 30 85 40 00 	lea    rdx,[rax+0x408530]
  804912:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  804916:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].tss.ds=0x10;
    task[i].tss.ss=0x10;
    task[i].tss.gs=0x10;
    task[i].tss.fs=0x10;
    task[i].tss.cs=0x8;*/
    task[i].tss.eip=entry;
  80491a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80491d:	48 98                	cdqe   
  80491f:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804922:	48 63 d2             	movsxd rdx,edx
  804925:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  80492c:	48 81 c2 70 86 40 00 	add    rdx,0x408670
  804933:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    return i;
  804937:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  80493a:	c9                   	leave  
  80493b:	c3                   	ret    

000000000080493c <sys_malloc>:

void * sys_malloc(int size)
{
  80493c:	f3 0f 1e fa          	endbr64 
  804940:	55                   	push   rbp
  804941:	48 89 e5             	mov    rbp,rsp
  804944:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  804947:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80494a:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804950:	85 c0                	test   eax,eax
  804952:	0f 48 c2             	cmovs  eax,edx
  804955:	c1 f8 0c             	sar    eax,0xc
  804958:	89 c1                	mov    ecx,eax
  80495a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80495d:	99                   	cdq    
  80495e:	c1 ea 14             	shr    edx,0x14
  804961:	01 d0                	add    eax,edx
  804963:	25 ff 0f 00 00       	and    eax,0xfff
  804968:	29 d0                	sub    eax,edx
  80496a:	01 c8                	add    eax,ecx
  80496c:	85 c0                	test   eax,eax
  80496e:	0f 95 c0             	setne  al
  804971:	0f b6 c0             	movzx  eax,al
  804974:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  804977:	8b 05 f3 d6 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d6f3]        # 412070 <cur_proc>
  80497d:	48 98                	cdqe   
  80497f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804986:	48 05 b4 84 40 00    	add    rax,0x4084b4
  80498c:	8b 00                	mov    eax,DWORD PTR [rax]
  80498e:	48 98                	cdqe   
  804990:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804994:	eb 0c                	jmp    8049a2 <sys_malloc+0x66>
        hp=hp->next;
  804996:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80499a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80499e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  8049a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049a6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8049aa:	48 85 c0             	test   rax,rax
  8049ad:	74 16                	je     8049c5 <sys_malloc+0x89>
  8049af:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049b3:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8049b6:	85 c0                	test   eax,eax
  8049b8:	75 0b                	jne    8049c5 <sys_malloc+0x89>
  8049ba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049be:	8b 00                	mov    eax,DWORD PTR [rax]
  8049c0:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8049c3:	7e d1                	jle    804996 <sys_malloc+0x5a>
    if(hp->pgn<n)
  8049c5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049c9:	8b 00                	mov    eax,DWORD PTR [rax]
  8049cb:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8049ce:	7e 7f                	jle    804a4f <sys_malloc+0x113>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  8049d0:	8b 05 9a d6 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d69a]        # 412070 <cur_proc>
  8049d6:	48 98                	cdqe   
  8049d8:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8049df:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8049e5:	8b 10                	mov    edx,DWORD PTR [rax]
  8049e7:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8049ea:	c1 e0 0c             	shl    eax,0xc
  8049ed:	01 d0                	add    eax,edx
  8049ef:	3d ff ff ef 01       	cmp    eax,0x1efffff
  8049f4:	7e 0a                	jle    804a00 <sys_malloc+0xc4>
        {
            //超过顶部
            return NULL;
  8049f6:	b8 00 00 00 00       	mov    eax,0x0
  8049fb:	e9 c8 00 00 00       	jmp    804ac8 <sys_malloc+0x18c>
        }
        int needed=n-hp->pgn;
  804a00:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a04:	8b 10                	mov    edx,DWORD PTR [rax]
  804a06:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804a09:	29 d0                	sub    eax,edx
  804a0b:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  804a0e:	8b 05 5c d6 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d65c]        # 412070 <cur_proc>
  804a14:	48 98                	cdqe   
  804a16:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804a1d:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804a23:	8b 00                	mov    eax,DWORD PTR [rax]
  804a25:	48 98                	cdqe   
  804a27:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804a2b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804a32:	eb 13                	jmp    804a47 <sys_malloc+0x10b>
        {
            *p=0;//触发缺页中断
  804a34:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804a38:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  804a3b:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804a42:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804a43:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804a47:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804a4a:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  804a4d:	7c e5                	jl     804a34 <sys_malloc+0xf8>
        }
    }
    if(hp->pgn>n)
  804a4f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a53:	8b 00                	mov    eax,DWORD PTR [rax]
  804a55:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804a58:	7d 59                	jge    804ab3 <sys_malloc+0x177>
    {
        //在后面新建一个头
        char *p=hp;
  804a5a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a5e:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804a62:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804a65:	83 c0 01             	add    eax,0x1
  804a68:	c1 e0 0c             	shl    eax,0xc
  804a6b:	48 98                	cdqe   
  804a6d:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804a71:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804a75:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  804a79:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a7d:	8b 00                	mov    eax,DWORD PTR [rax]
  804a7f:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  804a82:	8d 50 ff             	lea    edx,[rax-0x1]
  804a85:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804a89:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  804a8b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a8f:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804a93:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804a97:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  804a9b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804a9f:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804aa3:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804aa7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804aab:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804aaf:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804ab3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ab7:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  804abe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ac2:	48 05 00 10 00 00    	add    rax,0x1000
}
  804ac8:	5d                   	pop    rbp
  804ac9:	c3                   	ret    

0000000000804aca <sys_free>:
int sys_free(int ptr)
{
  804aca:	f3 0f 1e fa          	endbr64 
  804ace:	55                   	push   rbp
  804acf:	48 89 e5             	mov    rbp,rsp
  804ad2:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  804ad5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804ad8:	2d 00 10 00 00       	sub    eax,0x1000
  804add:	48 98                	cdqe   
  804adf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  804ae3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ae7:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  804aee:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804af2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804af6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804afa:	eb 2e                	jmp    804b2a <sys_free+0x60>
    {
        if(p->alloc==0)
  804afc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b00:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804b03:	85 c0                	test   eax,eax
  804b05:	75 2c                	jne    804b33 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  804b07:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b0b:	8b 10                	mov    edx,DWORD PTR [rax]
  804b0d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b11:	8b 00                	mov    eax,DWORD PTR [rax]
  804b13:	83 c0 01             	add    eax,0x1
  804b16:	01 c2                	add    edx,eax
  804b18:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b1c:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  804b1e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b22:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804b26:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804b2a:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804b2f:	75 cb                	jne    804afc <sys_free+0x32>
  804b31:	eb 01                	jmp    804b34 <sys_free+0x6a>
            break;
  804b33:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  804b34:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b38:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804b3c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804b40:	eb 2e                	jmp    804b70 <sys_free+0xa6>
    {
        if(p->alloc==0)
  804b42:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b46:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804b49:	85 c0                	test   eax,eax
  804b4b:	75 2c                	jne    804b79 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  804b4d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b51:	8b 10                	mov    edx,DWORD PTR [rax]
  804b53:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b57:	8b 00                	mov    eax,DWORD PTR [rax]
  804b59:	83 c0 01             	add    eax,0x1
  804b5c:	01 c2                	add    edx,eax
  804b5e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b62:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  804b64:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b68:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804b6c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804b70:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804b75:	75 cb                	jne    804b42 <sys_free+0x78>
  804b77:	eb 01                	jmp    804b7a <sys_free+0xb0>
            break;
  804b79:	90                   	nop
    }
    //合并完成
    return 0;
  804b7a:	b8 00 00 00 00       	mov    eax,0x0
  804b7f:	5d                   	pop    rbp
  804b80:	c3                   	ret    
  804b81:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  804b88:	00 00 00 
  804b8b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000804b90 <outb>:
  804b90:	66 8b 54 24 04       	mov    dx,WORD PTR [rsp+0x4]
  804b95:	8a 44 24 08          	mov    al,BYTE PTR [rsp+0x8]
  804b99:	ee                   	out    dx,al
  804b9a:	e8 31 00 00 00       	call   804bd0 <io_delay>
  804b9f:	c3                   	ret    

0000000000804ba0 <outw>:
  804ba0:	66 8b 54 24 04       	mov    dx,WORD PTR [rsp+0x4]
  804ba5:	66 8b 44 24 08       	mov    ax,WORD PTR [rsp+0x8]
  804baa:	66 ef                	out    dx,ax
  804bac:	90                   	nop
  804bad:	90                   	nop
  804bae:	90                   	nop
  804baf:	c3                   	ret    

0000000000804bb0 <inb>:
  804bb0:	31 c0                	xor    eax,eax
  804bb2:	66 8b 54 24 04       	mov    dx,WORD PTR [rsp+0x4]
  804bb7:	ec                   	in     al,dx
  804bb8:	90                   	nop
  804bb9:	90                   	nop
  804bba:	90                   	nop
  804bbb:	c3                   	ret    

0000000000804bbc <inw>:
  804bbc:	31 c0                	xor    eax,eax
  804bbe:	66 8b 54 24 04       	mov    dx,WORD PTR [rsp+0x4]
  804bc3:	66 ed                	in     ax,dx
  804bc5:	90                   	nop
  804bc6:	90                   	nop
  804bc7:	90                   	nop
  804bc8:	c3                   	ret    

0000000000804bc9 <eoi>:
  804bc9:	b0 20                	mov    al,0x20
  804bcb:	e6 a0                	out    0xa0,al
  804bcd:	e6 20                	out    0x20,al
  804bcf:	c3                   	ret    

0000000000804bd0 <io_delay>:
  804bd0:	90                   	nop
  804bd1:	90                   	nop
  804bd2:	90                   	nop
  804bd3:	90                   	nop
  804bd4:	c3                   	ret    

0000000000804bd5 <turn_on_int>:
  804bd5:	b0 f8                	mov    al,0xf8
  804bd7:	e6 21                	out    0x21,al
  804bd9:	e8 f2 ff ff ff       	call   804bd0 <io_delay>
  804bde:	b0 af                	mov    al,0xaf
  804be0:	e6 a1                	out    0xa1,al
  804be2:	e8 e9 ff ff ff       	call   804bd0 <io_delay>
  804be7:	0f 01 1d 90 4b 80 00 	lidt   [rip+0x804b90]        # 100977e <dev_stdout+0x7ff11e>
  804bee:	90                   	nop
  804bef:	90                   	nop
  804bf0:	90                   	nop
  804bf1:	90                   	nop
  804bf2:	fb                   	sti    
  804bf3:	c3                   	ret    

0000000000804bf4 <report_back_trace_of_err>:
  804bf4:	8b 44 24 04          	mov    eax,DWORD PTR [rsp+0x4]
  804bf8:	50                   	push   rax
  804bf9:	68 90 4b 80 00       	push   0x804b90
  804bfe:	83 c4 08             	add    esp,0x8
  804c01:	c3                   	ret    

0000000000804c02 <bt_msg>:
  804c02:	65 72 72             	gs jb  804c77 <fill_desc+0x16>
  804c05:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804c06:	72 20                	jb     804c28 <init_gdt+0xb>
  804c08:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804c09:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  804c0c:	72 73                	jb     804c81 <fill_desc+0x20>
  804c0e:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  804c11:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eea88f <dev_stdout+0x6e022f>

0000000000804c17 <idtptr>:
  804c17:	f8                   	clc    
  804c18:	07                   	(bad)  
  804c19:	00 00                	add    BYTE PTR [rax],al
	...

0000000000804c1d <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  804c1d:	f3 0f 1e fa          	endbr64 
  804c21:	55                   	push   rbp
  804c22:	48 89 e5             	mov    rbp,rsp
    //asm volatile("sgdt %0"::"m"(gdt));
    fill_desc(0,0xffffffff,SEG_CONFORMING_RW_CODE,1);
  804c25:	b9 01 00 00 00       	mov    ecx,0x1
  804c2a:	ba 9e cf 00 00       	mov    edx,0xcf9e
  804c2f:	be ff ff ff ff       	mov    esi,0xffffffff
  804c34:	bf 00 00 00 00       	mov    edi,0x0
  804c39:	e8 23 00 00 00       	call   804c61 <fill_desc>
    fill_desc(0,0xffffffff,SEG_RW_DATA,2);
  804c3e:	b9 02 00 00 00       	mov    ecx,0x2
  804c43:	ba 92 cf 00 00       	mov    edx,0xcf92
  804c48:	be ff ff ff ff       	mov    esi,0xffffffff
  804c4d:	bf 00 00 00 00       	mov    edi,0x0
  804c52:	e8 0a 00 00 00       	call   804c61 <fill_desc>
    asm volatile("lgdt %0":"=m"(gdtptr));
  804c57:	0f 01 15 cc e3 8f ff 	lgdt   [rip+0xffffffffff8fe3cc]        # 10302a <gdtptr>

}
  804c5e:	90                   	nop
  804c5f:	5d                   	pop    rbp
  804c60:	c3                   	ret    

0000000000804c61 <fill_desc>:
void fill_desc(u32 base, u32 limit,u16 attr,u32 index)
{
  804c61:	f3 0f 1e fa          	endbr64 
  804c65:	55                   	push   rbp
  804c66:	48 89 e5             	mov    rbp,rsp
  804c69:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  804c6c:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  804c6f:	89 d0                	mov    eax,edx
  804c71:	89 4d f0             	mov    DWORD PTR [rbp-0x10],ecx
  804c74:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    gdt[index].base_lo16=base&0xffff;
  804c78:	48 8b 15 61 4d 00 00 	mov    rdx,QWORD PTR [rip+0x4d61]        # 8099e0 <gdt>
  804c7f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804c82:	48 c1 e0 03          	shl    rax,0x3
  804c86:	48 01 d0             	add    rax,rdx
  804c89:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804c8c:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_mid8=(base>>16)&0xff;
  804c90:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804c93:	c1 e8 10             	shr    eax,0x10
  804c96:	89 c1                	mov    ecx,eax
  804c98:	48 8b 15 41 4d 00 00 	mov    rdx,QWORD PTR [rip+0x4d41]        # 8099e0 <gdt>
  804c9f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804ca2:	48 c1 e0 03          	shl    rax,0x3
  804ca6:	48 01 d0             	add    rax,rdx
  804ca9:	89 ca                	mov    edx,ecx
  804cab:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_hi8=(base>>24)&0xff;
  804cae:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804cb1:	c1 e8 18             	shr    eax,0x18
  804cb4:	89 c1                	mov    ecx,eax
  804cb6:	48 8b 15 23 4d 00 00 	mov    rdx,QWORD PTR [rip+0x4d23]        # 8099e0 <gdt>
  804cbd:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804cc0:	48 c1 e0 03          	shl    rax,0x3
  804cc4:	48 01 d0             	add    rax,rdx
  804cc7:	89 ca                	mov    edx,ecx
  804cc9:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].limit_lo16=limit&0xffff;
  804ccc:	48 8b 15 0d 4d 00 00 	mov    rdx,QWORD PTR [rip+0x4d0d]        # 8099e0 <gdt>
  804cd3:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804cd6:	48 c1 e0 03          	shl    rax,0x3
  804cda:	48 01 d0             	add    rax,rdx
  804cdd:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  804ce0:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr;
  804ce3:	48 8b 15 f6 4c 00 00 	mov    rdx,QWORD PTR [rip+0x4cf6]        # 8099e0 <gdt>
  804cea:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804ced:	48 c1 e0 03          	shl    rax,0x3
  804cf1:	48 01 c2             	add    rdx,rax
  804cf4:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  804cf8:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  804cfc:	90                   	nop
  804cfd:	5d                   	pop    rbp
  804cfe:	c3                   	ret    

0000000000804cff <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  804cff:	f3 0f 1e fa          	endbr64 
  804d03:	55                   	push   rbp
  804d04:	48 89 e5             	mov    rbp,rsp
  804d07:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804d0a:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  804d0d:	89 c8                	mov    eax,ecx
  804d0f:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  804d13:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  804d17:	48 8b 05 c2 4c 00 00 	mov    rax,QWORD PTR [rip+0x4cc2]        # 8099e0 <gdt>
  804d1e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  804d22:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804d25:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  804d2c:	00 
  804d2d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804d31:	48 01 d0             	add    rax,rdx
  804d34:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804d37:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  804d3a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804d3d:	c1 e8 10             	shr    eax,0x10
  804d40:	89 c2                	mov    edx,eax
  804d42:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804d45:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
  804d4c:	00 
  804d4d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804d51:	48 01 c8             	add    rax,rcx
  804d54:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    ptr[index].selector=selector;
  804d58:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804d5b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  804d62:	00 
  804d63:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804d67:	48 01 c2             	add    rdx,rax
  804d6a:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  804d6e:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  804d72:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804d75:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  804d7c:	00 
  804d7d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804d81:	48 01 c2             	add    rdx,rax
  804d84:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  804d88:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  804d8c:	90                   	nop
  804d8d:	5d                   	pop    rbp
  804d8e:	c3                   	ret    

0000000000804d8f <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  804d8f:	f3 0f 1e fa          	endbr64 
  804d93:	55                   	push   rbp
  804d94:	48 89 e5             	mov    rbp,rsp
  804d97:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  804d9a:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  804d9d:	89 d0                	mov    eax,edx
  804d9f:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  804da3:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    desc->base_lo16=base&0xffff;
  804da7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804daa:	89 c2                	mov    edx,eax
  804dac:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804db0:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    desc->base_mid8=(base>>16)&0xff;
  804db4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804db7:	c1 e8 10             	shr    eax,0x10
  804dba:	89 c2                	mov    edx,eax
  804dbc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804dc0:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    desc->base_hi8=(base>>24)&0xff;
  804dc3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804dc6:	c1 e8 18             	shr    eax,0x18
  804dc9:	89 c2                	mov    edx,eax
  804dcb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804dcf:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    desc->limit_lo16=limit&0xffff;
  804dd2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804dd5:	89 c2                	mov    edx,eax
  804dd7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804ddb:	66 89 10             	mov    WORD PTR [rax],dx
    desc->attr=attr|(limit>>16&0xf)<<8;
  804dde:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804de1:	c1 e8 10             	shr    eax,0x10
  804de4:	c1 e0 08             	shl    eax,0x8
  804de7:	66 25 00 0f          	and    ax,0xf00
  804deb:	66 0b 45 f4          	or     ax,WORD PTR [rbp-0xc]
  804def:	89 c2                	mov    edx,eax
  804df1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804df5:	66 89 50 05          	mov    WORD PTR [rax+0x5],dx
  804df9:	90                   	nop
  804dfa:	5d                   	pop    rbp
  804dfb:	c3                   	ret    
  804dfc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000804e00 <fill_desc>:
  804e00:	8b 44 24 04          	mov    eax,DWORD PTR [rsp+0x4]
  804e04:	8b 5c 24 08          	mov    ebx,DWORD PTR [rsp+0x8]
  804e08:	8b 4c 24 0c          	mov    ecx,DWORD PTR [rsp+0xc]
  804e0c:	8b 54 24 10          	mov    edx,DWORD PTR [rsp+0x10]
  804e10:	be 00 60 00 00       	mov    esi,0x6000
  804e15:	c1 e2 03             	shl    edx,0x3
  804e18:	01 d6                	add    esi,edx
  804e1a:	66 89 1e             	mov    WORD PTR [rsi],bx
  804e1d:	66 89 46 02          	mov    WORD PTR [rsi+0x2],ax
  804e21:	c1 e8 10             	shr    eax,0x10
  804e24:	88 46 04             	mov    BYTE PTR [rsi+0x4],al
  804e27:	c1 eb 10             	shr    ebx,0x10
  804e2a:	88 5e 06             	mov    BYTE PTR [rsi+0x6],bl
  804e2d:	88 66 07             	mov    BYTE PTR [rsi+0x7],ah
  804e30:	09 4e 05             	or     DWORD PTR [rsi+0x5],ecx
  804e33:	c3                   	ret    

0000000000804e34 <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  804e34:	f3 0f 1e fa          	endbr64 
  804e38:	55                   	push   rbp
  804e39:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  804e3c:	b8 00 00 00 00       	mov    eax,0x0
  804e41:	e8 85 11 00 00       	call   805fcb <execute_request>
    do_req();
  804e46:	b8 00 00 00 00       	mov    eax,0x0
  804e4b:	e8 d8 ea ff ff       	call   803928 <do_req>
    if(!manage_proc_lock)
  804e50:	8b 05 2a 4b 00 00    	mov    eax,DWORD PTR [rip+0x4b2a]        # 809980 <manage_proc_lock>
  804e56:	85 c0                	test   eax,eax
  804e58:	75 0a                	jne    804e64 <clock_c+0x30>
    {
        manage_proc();
  804e5a:	b8 00 00 00 00       	mov    eax,0x0
  804e5f:	e8 9f f0 ff ff       	call   803f03 <manage_proc>
    }
    //puts("1 disk req executed.");
  804e64:	90                   	nop
  804e65:	5d                   	pop    rbp
  804e66:	c3                   	ret    
  804e67:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  804e6e:	00 00 

0000000000804e70 <clock>:
  804e70:	83 3d 80 99 80 00 00 	cmp    DWORD PTR [rip+0x809980],0x0        # 100e7f7 <dev_stdout+0x804197>
  804e77:	75 5d                	jne    804ed6 <clock.normal_part>
  804e79:	60                   	(bad)  
  804e7a:	b9 08 00 00 00       	mov    ecx,0x8
  804e7f:	89 e6                	mov    esi,esp
  804e81:	bf a0 1f 41 00       	mov    edi,0x411fa0
  804e86:	83 c7 44             	add    edi,0x44

0000000000804e89 <clock.saver_loop>:
  804e89:	8b 1e                	mov    ebx,DWORD PTR [rsi]
  804e8b:	89 1f                	mov    DWORD PTR [rdi],ebx
  804e8d:	83 c6 04             	add    esi,0x4
  804e90:	83 ef 04             	sub    edi,0x4
  804e93:	e2 f4                	loop   804e89 <clock.saver_loop>
  804e95:	61                   	(bad)  
  804e96:	bf a0 1f 41 00       	mov    edi,0x411fa0
  804e9b:	8b 04 24             	mov    eax,DWORD PTR [rsp]
  804e9e:	89 47 20             	mov    DWORD PTR [rdi+0x20],eax
  804ea1:	9c                   	pushf  
  804ea2:	5b                   	pop    rbx
  804ea3:	81 cb 00 02 00 00    	or     ebx,0x200
  804ea9:	89 5f 24             	mov    DWORD PTR [rdi+0x24],ebx
  804eac:	66 8c c0             	mov    ax,es
  804eaf:	66 89 47 48          	mov    WORD PTR [rdi+0x48],ax
  804eb3:	66 8c c8             	mov    ax,cs
  804eb6:	66 89 47 4c          	mov    WORD PTR [rdi+0x4c],ax
  804eba:	66 8c d0             	mov    ax,ss
  804ebd:	66 89 47 50          	mov    WORD PTR [rdi+0x50],ax
  804ec1:	66 8c d8             	mov    ax,ds
  804ec4:	66 89 47 54          	mov    WORD PTR [rdi+0x54],ax
  804ec8:	66 8c e0             	mov    ax,fs
  804ecb:	66 89 47 58          	mov    WORD PTR [rdi+0x58],ax
  804ecf:	66 8c e8             	mov    ax,gs
  804ed2:	66 89 47 5c          	mov    WORD PTR [rdi+0x5c],ax

0000000000804ed6 <clock.normal_part>:
  804ed6:	b0 20                	mov    al,0x20
  804ed8:	e6 a0                	out    0xa0,al
  804eda:	e6 20                	out    0x20,al
  804edc:	e8 57 ff ff ff       	call   804e38 <clock_c+0x4>
  804ee1:	cf                   	iret   

0000000000804ee2 <execute>:
    return ind;
}
*/

int execute(char *path)
{
  804ee2:	f3 0f 1e fa          	endbr64 
  804ee6:	55                   	push   rbp
  804ee7:	48 89 e5             	mov    rbp,rsp
  804eea:	48 83 ec 30          	sub    rsp,0x30
  804eee:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  804ef2:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  804ef9:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, 1)) == -1)return -1;
  804f00:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804f04:	be 01 00 00 00       	mov    esi,0x1
  804f09:	48 89 c7             	mov    rdi,rax
  804f0c:	e8 0a cd ff ff       	call   801c1b <sys_open>
  804f11:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  804f14:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804f18:	75 0a                	jne    804f24 <execute+0x42>
  804f1a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804f1f:	e9 b7 00 00 00       	jmp    804fdb <execute+0xf9>
    //
    char *p=path;
  804f24:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804f28:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  804f2c:	eb 05                	jmp    804f33 <execute+0x51>
  804f2e:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  804f33:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804f37:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804f3a:	84 c0                	test   al,al
  804f3c:	75 f0                	jne    804f2e <execute+0x4c>
    for(;*p!='/'&&p>path;p--);
  804f3e:	eb 05                	jmp    804f45 <execute+0x63>
  804f40:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  804f45:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804f49:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804f4c:	3c 2f                	cmp    al,0x2f
  804f4e:	74 0a                	je     804f5a <execute+0x78>
  804f50:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804f54:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804f58:	77 e6                	ja     804f40 <execute+0x5e>
    if(p>path)
  804f5a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804f5e:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804f62:	76 2f                	jbe    804f93 <execute+0xb1>
    {
        *p='\0';
  804f64:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804f68:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, 1)) == -1)return -1;
  804f6b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804f6f:	be 01 00 00 00       	mov    esi,0x1
  804f74:	48 89 c7             	mov    rdi,rax
  804f77:	e8 9f cc ff ff       	call   801c1b <sys_open>
  804f7c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  804f7f:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  804f83:	75 07                	jne    804f8c <execute+0xaa>
  804f85:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804f8a:	eb 4f                	jmp    804fdb <execute+0xf9>
        *p='/';
  804f8c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804f90:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern vfs_dir_entry opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  804f93:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804f96:	48 63 d0             	movsxd rdx,eax
  804f99:	48 89 d0             	mov    rax,rdx
  804f9c:	48 01 c0             	add    rax,rax
  804f9f:	48 01 d0             	add    rax,rdx
  804fa2:	48 c1 e0 05          	shl    rax,0x5
  804fa6:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  804fad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804fb0:	48 63 c8             	movsxd rcx,eax
  804fb3:	48 89 c8             	mov    rax,rcx
  804fb6:	48 01 c0             	add    rax,rax
  804fb9:	48 01 c8             	add    rax,rcx
  804fbc:	48 c1 e0 05          	shl    rax,0x5
  804fc0:	48 05 60 06 40 00    	add    rax,0x400660
  804fc6:	b9 45 50 80 00       	mov    ecx,0x805045
  804fcb:	48 89 c6             	mov    rsi,rax
  804fce:	89 cf                	mov    edi,ecx
  804fd0:	e8 b1 f7 ff ff       	call   804786 <reg_proc>
  804fd5:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  804fd8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  804fdb:	c9                   	leave  
  804fdc:	c3                   	ret    

0000000000804fdd <exec_call>:

int exec_call(char *path)
{
  804fdd:	f3 0f 1e fa          	endbr64 
  804fe1:	55                   	push   rbp
  804fe2:	48 89 e5             	mov    rbp,rsp
  804fe5:	48 83 ec 20          	sub    rsp,0x20
  804fe9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi=execute(path);
  804fed:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804ff1:	48 89 c7             	mov    rdi,rax
  804ff4:	e8 e9 fe ff ff       	call   804ee2 <execute>
  804ff9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  804ffc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804fff:	01 c0                	add    eax,eax
  805001:	83 c0 05             	add    eax,0x5
  805004:	c1 e0 03             	shl    eax,0x3
  805007:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  80500a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80500d:	89 c7                	mov    edi,eax
  80500f:	e8 10 f0 ff ff       	call   804024 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  805014:	90                   	nop
  805015:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805018:	48 98                	cdqe   
  80501a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  805021:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805027:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80502a:	83 f8 03             	cmp    eax,0x3
  80502d:	75 e6                	jne    805015 <exec_call+0x38>
    return task[pi].exit_code;
  80502f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805032:	48 98                	cdqe   
  805034:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80503b:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805041:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805043:	c9                   	leave  
  805044:	c3                   	ret    

0000000000805045 <proc_start>:
int proc_start()
{
  805045:	f3 0f 1e fa          	endbr64 
  805049:	55                   	push   rbp
  80504a:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  80504d:	8b 05 1d d0 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d01d]        # 412070 <cur_proc>
  805053:	48 98                	cdqe   
  805055:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80505c:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805062:	48 89 c7             	mov    rdi,rax
  805065:	e8 1a 00 00 00       	call   805084 <load_pe>
    //释放进程资源
    del_proc(cur_proc);
  80506a:	8b 05 00 d0 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d000]        # 412070 <cur_proc>
  805070:	89 c7                	mov    edi,eax
  805072:	e8 ec f4 ff ff       	call   804563 <del_proc>
    switch_proc_tss(0);
  805077:	bf 00 00 00 00       	mov    edi,0x0
  80507c:	e8 a3 ef ff ff       	call   804024 <switch_proc_tss>
}
  805081:	90                   	nop
  805082:	5d                   	pop    rbp
  805083:	c3                   	ret    

0000000000805084 <load_pe>:
//在cr3切换到目标进程下的加载程序(但进程还没调度到那里)。
int load_pe(struct process *proc)
{
  805084:	f3 0f 1e fa          	endbr64 
  805088:	55                   	push   rbp
  805089:	48 89 e5             	mov    rbp,rsp
  80508c:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  805093:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    vfs_dir_entry *f=proc->exef;
  80509a:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  8050a1:	48 8b 80 94 00 00 00 	mov    rax,QWORD PTR [rax+0x94]
  8050a8:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=f->fno;
  8050ac:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8050b0:	8b 00                	mov    eax,DWORD PTR [rax]
  8050b2:	89 45 94             	mov    DWORD PTR [rbp-0x6c],eax

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  8050b5:	48 8d 8d 70 fe ff ff 	lea    rcx,[rbp-0x190]
  8050bc:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8050bf:	ba 44 00 00 00       	mov    edx,0x44
  8050c4:	48 89 ce             	mov    rsi,rcx
  8050c7:	89 c7                	mov    edi,eax
  8050c9:	e8 2c d1 ff ff       	call   8021fa <sys_read>
    sys_seek(exefno,tdh.e_lfanew,SEEK_SET);
  8050ce:	48 8b 85 ac fe ff ff 	mov    rax,QWORD PTR [rbp-0x154]
  8050d5:	89 c1                	mov    ecx,eax
  8050d7:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8050da:	ba 00 00 00 00       	mov    edx,0x0
  8050df:	89 ce                	mov    esi,ecx
  8050e1:	89 c7                	mov    edi,eax
  8050e3:	e8 a3 d1 ff ff       	call   80228b <sys_seek>
    sys_read(exefno, &tnth, sizeof(tnth));
  8050e8:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  8050ef:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8050f2:	ba f8 00 00 00       	mov    edx,0xf8
  8050f7:	48 89 ce             	mov    rsi,rcx
  8050fa:	89 c7                	mov    edi,eax
  8050fc:	e8 f9 d0 ff ff       	call   8021fa <sys_read>

    //是否需要移动base(先不检查)
    unsigned int nbase=tnth.OptionalHeader.ImageBase;
  805101:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  805107:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  80510a:	8b 85 c0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x240]
  805110:	c1 e8 0c             	shr    eax,0xc
  805113:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
    //use_pgm_ava检查在页表中这个范围是否可用，可用就使用
    while(1)
    {
        cont:
        ;
        int pdei=nbase/PAGE_INDEX_SIZE;
  805116:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805119:	c1 e8 16             	shr    eax,0x16
  80511c:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
        int ptei=nbase%PAGE_INDEX_SIZE/PAGE_SIZE;
  80511f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805122:	25 ff ff 3f 00       	and    eax,0x3fffff
  805127:	c1 e8 0c             	shr    eax,0xc
  80512a:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
        int *pt=(proc->pdet[pdei]&0xfffff000);
  80512d:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805134:	48 8b 90 84 00 00 00 	mov    rdx,QWORD PTR [rax+0x84]
  80513b:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
  80513e:	48 98                	cdqe   
  805140:	48 c1 e0 02          	shl    rax,0x2
  805144:	48 01 d0             	add    rax,rdx
  805147:	8b 00                	mov    eax,DWORD PTR [rax]
  805149:	89 c0                	mov    eax,eax
  80514b:	25 00 f0 ff ff       	and    eax,0xfffff000
  805150:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
        for(int i=0;i<pgn;i++)
  805154:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80515b:	eb 48                	jmp    8051a5 <load_pe+0x121>
        {
            if(pt[ptei+i%1024]&PAGE_PRESENT&&pt!=NULL)
  80515d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805160:	99                   	cdq    
  805161:	c1 ea 16             	shr    edx,0x16
  805164:	01 d0                	add    eax,edx
  805166:	25 ff 03 00 00       	and    eax,0x3ff
  80516b:	29 d0                	sub    eax,edx
  80516d:	89 c2                	mov    edx,eax
  80516f:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  805172:	01 d0                	add    eax,edx
  805174:	48 98                	cdqe   
  805176:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80517d:	00 
  80517e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  805182:	48 01 d0             	add    rax,rdx
  805185:	8b 00                	mov    eax,DWORD PTR [rax]
  805187:	83 e0 01             	and    eax,0x1
  80518a:	85 c0                	test   eax,eax
  80518c:	74 13                	je     8051a1 <load_pe+0x11d>
  80518e:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
  805193:	74 0c                	je     8051a1 <load_pe+0x11d>
            {
                //移动base
                nbase+=0x1000;
  805195:	81 45 fc 00 10 00 00 	add    DWORD PTR [rbp-0x4],0x1000
                goto cont;
  80519c:	e9 75 ff ff ff       	jmp    805116 <load_pe+0x92>
        for(int i=0;i<pgn;i++)
  8051a1:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8051a5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8051a8:	3b 45 90             	cmp    eax,DWORD PTR [rbp-0x70]
  8051ab:	7c b0                	jl     80515d <load_pe+0xd9>
            }
        }
        break;
  8051ad:	90                   	nop
    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_seek(exefno,0,SEEK_SET);
  8051ae:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8051b1:	ba 00 00 00 00       	mov    edx,0x0
  8051b6:	be 00 00 00 00       	mov    esi,0x0
  8051bb:	89 c7                	mov    edi,eax
  8051bd:	e8 c9 d0 ff ff       	call   80228b <sys_seek>
    sys_read(exefno, nbase, PAGE_SIZE);
  8051c2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8051c5:	48 89 c1             	mov    rcx,rax
  8051c8:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8051cb:	ba 00 10 00 00       	mov    edx,0x1000
  8051d0:	48 89 ce             	mov    rsi,rcx
  8051d3:	89 c7                	mov    edi,eax
  8051d5:	e8 20 d0 ff ff       	call   8021fa <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  8051da:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8051dd:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_NT_HEADERS32 nth=nbase+dosh->e_lfanew;
  8051e4:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8051e7:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8051ee:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  8051f2:	48 01 d0             	add    rax,rdx
  8051f5:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  8051fc:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805203:	48 83 c0 04          	add    rax,0x4
  805207:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  80520e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805215:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  805218:	89 85 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],eax
    int page_count=prog_size/4096;
  80521e:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  805224:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80522a:	85 c0                	test   eax,eax
  80522c:	0f 48 c2             	cmovs  eax,edx
  80522f:	c1 f8 0c             	sar    eax,0xc
  805232:	89 85 60 ff ff ff    	mov    DWORD PTR [rbp-0xa0],eax

    int shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  805238:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80523f:	8b 50 28             	mov    edx,DWORD PTR [rax+0x28]
  805242:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805245:	01 d0                	add    eax,edx
  805247:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  80524d:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  805253:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  805259:	85 c0                	test   eax,eax
  80525b:	0f 48 c2             	cmovs  eax,edx
  80525e:	c1 f8 0a             	sar    eax,0xa
  805261:	89 c1                	mov    ecx,eax
  805263:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  805269:	99                   	cdq    
  80526a:	c1 ea 16             	shr    edx,0x16
  80526d:	01 d0                	add    eax,edx
  80526f:	25 ff 03 00 00       	and    eax,0x3ff
  805274:	29 d0                	sub    eax,edx
  805276:	01 c8                	add    eax,ecx
  805278:	85 c0                	test   eax,eax
  80527a:	0f 95 c0             	setne  al
  80527d:	0f b6 c0             	movzx  eax,al
  805280:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  805286:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  80528c:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  805292:	85 c0                	test   eax,eax
  805294:	0f 48 c2             	cmovs  eax,edx
  805297:	c1 f8 16             	sar    eax,0x16
  80529a:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  8052a0:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8052a7:	89 c0                	mov    eax,eax
  8052a9:	48 05 f8 00 00 00    	add    rax,0xf8
  8052af:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  8052b3:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8052ba:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  8052be:	0f b7 d0             	movzx  edx,ax
  8052c1:	89 d0                	mov    eax,edx
  8052c3:	c1 e0 02             	shl    eax,0x2
  8052c6:	01 d0                	add    eax,edx
  8052c8:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  8052cb:	05 3c 01 00 00       	add    eax,0x13c
  8052d0:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    int align=nth->OptionalHeader.FileAlignment;
  8052d6:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8052dd:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8052e0:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  8052e6:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  8052ec:	99                   	cdq    
  8052ed:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  8052f3:	89 d0                	mov    eax,edx
  8052f5:	85 c0                	test   eax,eax
  8052f7:	74 23                	je     80531c <load_pe+0x298>
  8052f9:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  8052ff:	99                   	cdq    
  805300:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  805306:	89 d1                	mov    ecx,edx
  805308:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  80530e:	29 c8                	sub    eax,ecx
  805310:	89 c2                	mov    edx,eax
  805312:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
  805318:	01 d0                	add    eax,edx
  80531a:	eb 06                	jmp    805322 <load_pe+0x29e>
  80531c:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805322:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  805328:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80532f:	eb 68                	jmp    805399 <load_pe+0x315>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  805331:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805335:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  805338:	25 00 00 00 02       	and    eax,0x2000000
  80533d:	89 85 bc fe ff ff    	mov    DWORD PTR [rbp-0x144],eax
        if(disca)
  805343:	83 bd bc fe ff ff 00 	cmp    DWORD PTR [rbp-0x144],0x0
  80534a:	75 43                	jne    80538f <load_pe+0x30b>
            continue;
        //直接读，缺页内核解决
        sys_seek(exefno,psec->PointerToRawData,SEEK_SET);
  80534c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805350:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805353:	89 c1                	mov    ecx,eax
  805355:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805358:	ba 00 00 00 00       	mov    edx,0x0
  80535d:	89 ce                	mov    esi,ecx
  80535f:	89 c7                	mov    edi,eax
  805361:	e8 25 cf ff ff       	call   80228b <sys_seek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  805366:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80536a:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80536d:	89 c2                	mov    edx,eax
  80536f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805373:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
  805376:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805379:	01 c8                	add    eax,ecx
  80537b:	89 c0                	mov    eax,eax
  80537d:	48 89 c1             	mov    rcx,rax
  805380:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805383:	48 89 ce             	mov    rsi,rcx
  805386:	89 c7                	mov    edi,eax
  805388:	e8 6d ce ff ff       	call   8021fa <sys_read>
  80538d:	eb 01                	jmp    805390 <load_pe+0x30c>
            continue;
  80538f:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  805390:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805394:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  805399:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8053a0:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  8053a4:	0f b7 c0             	movzx  eax,ax
  8053a7:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8053aa:	7c 85                	jl     805331 <load_pe+0x2ad>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  8053ac:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8053b3:	48 83 e8 80          	sub    rax,0xffffffffffffff80
  8053b7:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    if(impd->Size>0)
  8053be:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  8053c5:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8053c8:	85 c0                	test   eax,eax
  8053ca:	0f 84 71 02 00 00    	je     805641 <load_pe+0x5bd>
    {
        int tmpi=impd->VirtualAddress+nbase;
  8053d0:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  8053d7:	8b 10                	mov    edx,DWORD PTR [rax]
  8053d9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053dc:	01 d0                	add    eax,edx
  8053de:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  8053e4:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  8053ea:	48 98                	cdqe   
  8053ec:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  8053f0:	e9 3e 02 00 00       	jmp    805633 <load_pe+0x5af>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  8053f5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8053f9:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  8053fc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053ff:	01 d0                	add    eax,edx
  805401:	89 c0                	mov    eax,eax
  805403:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  80540a:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  805411:	be 18 a0 80 00       	mov    esi,0x80a018
  805416:	48 89 c7             	mov    rdi,rax
  805419:	e8 8c 3e 00 00       	call   8092aa <strcmp>
  80541e:	85 c0                	test   eax,eax
  805420:	75 09                	jne    80542b <load_pe+0x3a7>
            {
                dllp=0x1c00000;
  805422:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  805429:	eb 25                	jmp    805450 <load_pe+0x3cc>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  80542b:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805432:	48 89 c7             	mov    rdi,rax
  805435:	e8 4a fc ff ff       	call   805084 <load_pe>
  80543a:	89 85 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  805440:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  805446:	89 c7                	mov    edi,eax
  805448:	e8 c9 03 00 00       	call   805816 <get_module_addr>
  80544d:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  805450:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805453:	48 98                	cdqe   
  805455:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  80545c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80545f:	48 63 d0             	movsxd rdx,eax
  805462:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  805469:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  80546d:	48 01 d0             	add    rax,rdx
  805470:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  805477:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80547e:	8b 50 78             	mov    edx,DWORD PTR [rax+0x78]
  805481:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805484:	01 d0                	add    eax,edx
  805486:	89 c0                	mov    eax,eax
  805488:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
            int funcn=dllexp->NumberOfNames;
  80548f:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805496:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  805499:	89 85 0c ff ff ff    	mov    DWORD PTR [rbp-0xf4],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  80549f:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8054a6:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  8054a9:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8054ac:	01 d0                	add    eax,edx
  8054ae:	89 c0                	mov    eax,eax
  8054b0:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  8054b7:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8054be:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8054c1:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8054c4:	01 d0                	add    eax,edx
  8054c6:	89 c0                	mov    eax,eax
  8054c8:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  8054cf:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8054d6:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8054d9:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8054dc:	01 d0                	add    eax,edx
  8054de:	89 c0                	mov    eax,eax
  8054e0:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  8054e7:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8054ee:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8054f1:	89 85 ec fe ff ff    	mov    DWORD PTR [rbp-0x114],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  8054f7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8054fb:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  8054fe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805501:	01 d0                	add    eax,edx
  805503:	89 c0                	mov    eax,eax
  805505:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  805509:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80550d:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  805510:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805513:	01 d0                	add    eax,edx
  805515:	89 c0                	mov    eax,eax
  805517:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  80551b:	e9 00 01 00 00       	jmp    805620 <load_pe+0x59c>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  805520:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805524:	8b 00                	mov    eax,DWORD PTR [rax]
  805526:	85 c0                	test   eax,eax
  805528:	79 43                	jns    80556d <load_pe+0x4e9>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  80552a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80552e:	8b 00                	mov    eax,DWORD PTR [rax]
  805530:	25 ff ff ff 7f       	and    eax,0x7fffffff
  805535:	2b 85 ec fe ff ff    	sub    eax,DWORD PTR [rbp-0x114]
  80553b:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  805541:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  805547:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80554e:	00 
  80554f:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  805556:	48 01 d0             	add    rax,rdx
  805559:	8b 10                	mov    edx,DWORD PTR [rax]
  80555b:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80555e:	01 d0                	add    eax,edx
  805560:	89 c2                	mov    edx,eax
  805562:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805566:	89 10                	mov    DWORD PTR [rax],edx
  805568:	e9 a9 00 00 00       	jmp    805616 <load_pe+0x592>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  80556d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805571:	8b 00                	mov    eax,DWORD PTR [rax]
  805573:	89 c0                	mov    eax,eax
  805575:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  80557c:	48 83 85 e0 fe ff ff 	add    QWORD PTR [rbp-0x120],0x2
  805583:	02 
                    int i=0;
  805584:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  80558b:	eb 7a                	jmp    805607 <load_pe+0x583>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  80558d:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  805590:	48 98                	cdqe   
  805592:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805599:	00 
  80559a:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  8055a1:	48 01 d0             	add    rax,rdx
  8055a4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8055a7:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
  8055ae:	48 89 d6             	mov    rsi,rdx
  8055b1:	48 89 c7             	mov    rdi,rax
  8055b4:	e8 f1 3c 00 00       	call   8092aa <strcmp>
  8055b9:	85 c0                	test   eax,eax
  8055bb:	75 46                	jne    805603 <load_pe+0x57f>
                        {
                            int ordi=funcords[i];
  8055bd:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8055c0:	48 98                	cdqe   
  8055c2:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  8055c6:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  8055cd:	48 01 d0             	add    rax,rdx
  8055d0:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8055d3:	98                   	cwde   
  8055d4:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  8055da:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
  8055e0:	48 98                	cdqe   
  8055e2:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8055e9:	00 
  8055ea:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8055f1:	48 01 d0             	add    rax,rdx
  8055f4:	8b 10                	mov    edx,DWORD PTR [rax]
  8055f6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8055f9:	01 d0                	add    eax,edx
  8055fb:	89 c2                	mov    edx,eax
  8055fd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805601:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  805603:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  805607:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80560a:	3b 85 0c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xf4]
  805610:	0f 8c 77 ff ff ff    	jl     80558d <load_pe+0x509>
                        }
                    }
                }
                iataddrs++;
  805616:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  80561b:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  805620:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805624:	8b 00                	mov    eax,DWORD PTR [rax]
  805626:	85 c0                	test   eax,eax
  805628:	0f 85 f2 fe ff ff    	jne    805520 <load_pe+0x49c>
            }
            impdes++;
  80562e:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  805633:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805637:	8b 00                	mov    eax,DWORD PTR [rax]
  805639:	85 c0                	test   eax,eax
  80563b:	0f 85 b4 fd ff ff    	jne    8053f5 <load_pe+0x371>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  805641:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  805648:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  805649:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805650:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [rax+0xa4]
  805656:	85 c0                	test   eax,eax
  805658:	0f 84 e8 00 00 00    	je     805746 <load_pe+0x6c2>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  80565e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805665:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [rax+0xa0]
  80566b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80566e:	01 d0                	add    eax,edx
  805670:	89 c0                	mov    eax,eax
  805672:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                                +(u32)nbase);
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  805676:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80567a:	48 83 c0 40          	add    rax,0x40
  80567e:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  805682:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805686:	48 83 c0 02          	add    rax,0x2
  80568a:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  80568e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805695:	8b 40 34             	mov    eax,DWORD PTR [rax+0x34]
  805698:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
        while(relp->VirtualAddress){
  80569e:	e9 95 00 00 00       	jmp    805738 <load_pe+0x6b4>
            int pgva=relp->VirtualAddress+nbase;
  8056a3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8056a7:	8b 10                	mov    edx,DWORD PTR [rax]
  8056a9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8056ac:	01 d0                	add    eax,edx
  8056ae:	89 85 d0 fe ff ff    	mov    DWORD PTR [rbp-0x130],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8056b4:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  8056bb:	eb 59                	jmp    805716 <load_pe+0x692>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8056bd:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8056c1:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8056c4:	66 85 c0             	test   ax,ax
  8056c7:	74 48                	je     805711 <load_pe+0x68d>
                int *at=*reloc+pgva;//要重定位的数据的地址
  8056c9:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8056cd:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8056d0:	0f b7 d0             	movzx  edx,ax
  8056d3:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  8056d9:	01 d0                	add    eax,edx
  8056db:	48 98                	cdqe   
  8056dd:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
                *at=*at-old_base+nbase;
  8056e4:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  8056eb:	8b 00                	mov    eax,DWORD PTR [rax]
  8056ed:	2b 85 d4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x12c]
  8056f3:	89 c2                	mov    edx,eax
  8056f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8056f8:	01 d0                	add    eax,edx
  8056fa:	89 c2                	mov    edx,eax
  8056fc:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  805703:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  805705:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  80570a:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  80570f:	eb 01                	jmp    805712 <load_pe+0x68e>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  805711:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  805712:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  805716:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80571a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80571d:	c1 e8 02             	shr    eax,0x2
  805720:	89 c2                	mov    edx,eax
  805722:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  805725:	39 c2                	cmp    edx,eax
  805727:	77 94                	ja     8056bd <load_pe+0x639>
            }
            relp=(int)relp+0x1000;
  805729:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80572d:	05 00 10 00 00       	add    eax,0x1000
  805732:	48 98                	cdqe   
  805734:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  805738:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80573c:	8b 00                	mov    eax,DWORD PTR [rax]
  80573e:	85 c0                	test   eax,eax
  805740:	0f 85 5d ff ff ff    	jne    8056a3 <load_pe+0x61f>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  805746:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  80574d:	00 00 00 
  805750:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  805757:	00 00 00 
  80575a:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  805761:	00 00 00 00 
  805765:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  80576c:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  805770:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  805777:	ba 18 00 00 00       	mov    edx,0x18
  80577c:	48 89 c6             	mov    rsi,rax
  80577f:	bf 00 00 00 01       	mov    edi,0x1000000
  805784:	e8 83 38 00 00       	call   80900c <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  805789:	8b 05 e1 c8 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0c8e1]        # 412070 <cur_proc>
  80578f:	48 98                	cdqe   
  805791:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  805798:	48 05 b0 84 40 00    	add    rax,0x4084b0
  80579e:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  8057a5:	8b 05 c5 c8 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0c8c5]        # 412070 <cur_proc>
  8057ab:	48 98                	cdqe   
  8057ad:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8057b4:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8057ba:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  8057c1:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8057c7:	48 98                	cdqe   
  8057c9:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
    task[cur_proc].exit_code=main(0,NULL);
  8057d0:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
  8057d7:	be 00 00 00 00       	mov    esi,0x0
  8057dc:	bf 00 00 00 00       	mov    edi,0x0
  8057e1:	ff d0                	call   rax
  8057e3:	8b 15 87 c8 c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0c887]        # 412070 <cur_proc>
  8057e9:	89 c1                	mov    ecx,eax
  8057eb:	48 63 c2             	movsxd rax,edx
  8057ee:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8057f5:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8057fb:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  8057fd:	8b 05 6d c8 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0c86d]        # 412070 <cur_proc>
  805803:	48 98                	cdqe   
  805805:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80580c:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805812:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805814:	c9                   	leave  
  805815:	c3                   	ret    

0000000000805816 <get_module_addr>:

int get_module_addr(int mi)
{
  805816:	f3 0f 1e fa          	endbr64 
  80581a:	55                   	push   rbp
  80581b:	48 89 e5             	mov    rbp,rsp
  80581e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  805821:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805824:	48 98                	cdqe   
  805826:	8b 04 c5 80 4c 42 00 	mov    eax,DWORD PTR [rax*8+0x424c80]
}
  80582d:	5d                   	pop    rbp
  80582e:	c3                   	ret    

000000000080582f <dispose_library>:
int dispose_library(int dlln)
{
  80582f:	f3 0f 1e fa          	endbr64 
  805833:	55                   	push   rbp
  805834:	48 89 e5             	mov    rbp,rsp
  805837:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  80583a:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80583e:	78 09                	js     805849 <dispose_library+0x1a>
  805840:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  805847:	7e 07                	jle    805850 <dispose_library+0x21>
  805849:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80584e:	eb 1d                	jmp    80586d <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  805850:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805853:	48 98                	cdqe   
  805855:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  80585c:	48 05 88 20 41 00    	add    rax,0x412088
  805862:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  805868:	b8 00 00 00 00       	mov    eax,0x0
}
  80586d:	5d                   	pop    rbp
  80586e:	c3                   	ret    

000000000080586f <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  80586f:	f3 0f 1e fa          	endbr64 
  805873:	55                   	push   rbp
  805874:	48 89 e5             	mov    rbp,rsp
  805877:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  80587b:	90                   	nop
  80587c:	5d                   	pop    rbp
  80587d:	c3                   	ret    

000000000080587e <sys_rmmod>:
int sys_rmmod(char *name)
{
  80587e:	f3 0f 1e fa          	endbr64 
  805882:	55                   	push   rbp
  805883:	48 89 e5             	mov    rbp,rsp
  805886:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  80588a:	90                   	nop
  80588b:	5d                   	pop    rbp
  80588c:	c3                   	ret    
  80588d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000805890 <_syscall>:
  805890:	57                   	push   rdi
  805891:	56                   	push   rsi
  805892:	52                   	push   rdx
  805893:	51                   	push   rcx
  805894:	53                   	push   rbx
  805895:	50                   	push   rax
  805896:	e8 8c ac ff ff       	call   800527 <syscall+0x4>
  80589b:	83 c4 18             	add    esp,0x18
  80589e:	cf                   	iret   

000000000080589f <init_framebuffer>:
#include <framebuffer.h>
#include <memory.h>
#include <typename.h>
struct multiboot_tag_framebuffer framebuffer;
void init_framebuffer()
{
  80589f:	f3 0f 1e fa          	endbr64 
  8058a3:	55                   	push   rbp
  8058a4:	48 89 e5             	mov    rbp,rsp
  8058a7:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  8058ab:	8b 05 e3 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7e3]        # 425094 <framebuffer+0x14>
  8058b1:	89 c0                	mov    eax,eax
  8058b3:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  8058b7:	8b 05 db f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7db]        # 425098 <framebuffer+0x18>
  8058bd:	89 c0                	mov    eax,eax
  8058bf:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  8058c3:	0f b6 05 d2 f7 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f7d2]        # 42509c <framebuffer+0x1c>
  8058ca:	c0 e8 03             	shr    al,0x3
  8058cd:	0f b6 c0             	movzx  eax,al
  8058d0:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  8058d4:	8b 05 b6 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7b6]        # 425090 <framebuffer+0x10>
  8058da:	89 c0                	mov    eax,eax
  8058dc:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  8058e0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8058e4:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  8058e9:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=pc*bypp+(pc-1)*inter;
  8058ed:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8058f1:	48 0f af 45 d0       	imul   rax,QWORD PTR [rbp-0x30]
  8058f6:	48 89 c2             	mov    rdx,rax
  8058f9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8058fd:	48 83 e8 01          	sub    rax,0x1
  805901:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  805906:	48 01 d0             	add    rax,rdx
  805909:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  80590d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805911:	48 c1 e8 0c          	shr    rax,0xc
  805915:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  805918:	48 b8 00 00 00 00 40 	movabs rax,0x4000000000
  80591f:	00 00 00 
  805922:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t pp=framebuffer.common.framebuffer_addr;
  805926:	48 8b 05 5b f7 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f75b]        # 425088 <framebuffer+0x8>
  80592d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  805931:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  805938:	00 
  805939:	eb 2d                	jmp    805968 <init_framebuffer+0xc9>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  80593b:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  80593f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805943:	ba 07 00 00 00       	mov    edx,0x7
  805948:	48 89 ce             	mov    rsi,rcx
  80594b:	48 89 c7             	mov    rdi,rax
  80594e:	e8 b9 b6 ff ff       	call   80100c <mmap>
        pp+=PAGE_SIZE;
  805953:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  80595a:	00 
        p+=PAGE_SIZE;
  80595b:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  805962:	00 
    for (size_t i = 0; i < pgc; i++)
  805963:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  805968:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80596b:	48 98                	cdqe   
  80596d:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  805971:	72 c8                	jb     80593b <init_framebuffer+0x9c>
    }
    
    
}
  805973:	90                   	nop
  805974:	90                   	nop
  805975:	c9                   	leave  
  805976:	c3                   	ret    

0000000000805977 <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  805977:	f3 0f 1e fa          	endbr64 
  80597b:	55                   	push   rbp
  80597c:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  80597f:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  805983:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  805987:	48 89 05 f2 f6 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f6f2],rax        # 425080 <framebuffer>
  80598e:	48 89 15 f3 f6 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f6f3],rdx        # 425088 <framebuffer+0x8>
  805995:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  805999:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  80599d:	48 89 05 ec f6 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f6ec],rax        # 425090 <framebuffer+0x10>
  8059a4:	48 89 15 ed f6 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f6ed],rdx        # 425098 <framebuffer+0x18>
  8059ab:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  8059af:	48 89 05 ea f6 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f6ea],rax        # 4250a0 <framebuffer+0x20>
  8059b6:	90                   	nop
  8059b7:	5d                   	pop    rbp
  8059b8:	c3                   	ret    

00000000008059b9 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  8059b9:	f3 0f 1e fa          	endbr64 
  8059bd:	55                   	push   rbp
  8059be:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  8059c1:	0f b6 05 05 01 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20105]        # 425acd <k_shift>
  8059c8:	84 c0                	test   al,al
  8059ca:	0f 94 c0             	sete   al
  8059cd:	88 05 fa 00 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc200fa],al        # 425acd <k_shift>
}
  8059d3:	90                   	nop
  8059d4:	5d                   	pop    rbp
  8059d5:	c3                   	ret    

00000000008059d6 <ctrl>:
void ctrl()
{
  8059d6:	f3 0f 1e fa          	endbr64 
  8059da:	55                   	push   rbp
  8059db:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  8059de:	0f b6 05 e9 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc200e9]        # 425ace <k_ctrl>
  8059e5:	84 c0                	test   al,al
  8059e7:	0f 94 c0             	sete   al
  8059ea:	88 05 de 00 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc200de],al        # 425ace <k_ctrl>
}
  8059f0:	90                   	nop
  8059f1:	5d                   	pop    rbp
  8059f2:	c3                   	ret    

00000000008059f3 <capslock>:
void capslock()
{
  8059f3:	f3 0f 1e fa          	endbr64 
  8059f7:	55                   	push   rbp
  8059f8:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  8059fb:	0f b6 05 cd 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc200cd]        # 425acf <k_capslock>
  805a02:	84 c0                	test   al,al
  805a04:	0f 94 c0             	sete   al
  805a07:	88 05 c2 00 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc200c2],al        # 425acf <k_capslock>
}
  805a0d:	90                   	nop
  805a0e:	5d                   	pop    rbp
  805a0f:	c3                   	ret    

0000000000805a10 <to_ascii>:
char to_ascii(char scan_code)
{
  805a10:	f3 0f 1e fa          	endbr64 
  805a14:	55                   	push   rbp
  805a15:	48 89 e5             	mov    rbp,rsp
  805a18:	89 f8                	mov    eax,edi
  805a1a:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  805a1d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805a24:	e9 c7 00 00 00       	jmp    805af0 <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  805a29:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a2c:	48 63 d0             	movsxd rdx,eax
  805a2f:	48 89 d0             	mov    rax,rdx
  805a32:	48 c1 e0 02          	shl    rax,0x2
  805a36:	48 01 d0             	add    rax,rdx
  805a39:	48 05 82 a1 80 00    	add    rax,0x80a182
  805a3f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a42:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  805a45:	0f 85 a1 00 00 00    	jne    805aec <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  805a4b:	0f b6 05 7d 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2007d]        # 425acf <k_capslock>
  805a52:	84 c0                	test   al,al
  805a54:	74 55                	je     805aab <to_ascii+0x9b>
  805a56:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a59:	48 63 d0             	movsxd rdx,eax
  805a5c:	48 89 d0             	mov    rax,rdx
  805a5f:	48 c1 e0 02          	shl    rax,0x2
  805a63:	48 01 d0             	add    rax,rdx
  805a66:	48 05 80 a1 80 00    	add    rax,0x80a180
  805a6c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a6f:	3c 60                	cmp    al,0x60
  805a71:	7e 38                	jle    805aab <to_ascii+0x9b>
  805a73:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a76:	48 63 d0             	movsxd rdx,eax
  805a79:	48 89 d0             	mov    rax,rdx
  805a7c:	48 c1 e0 02          	shl    rax,0x2
  805a80:	48 01 d0             	add    rax,rdx
  805a83:	48 05 80 a1 80 00    	add    rax,0x80a180
  805a89:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a8c:	3c 7a                	cmp    al,0x7a
  805a8e:	7f 1b                	jg     805aab <to_ascii+0x9b>
  805a90:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a93:	48 63 d0             	movsxd rdx,eax
  805a96:	48 89 d0             	mov    rax,rdx
  805a99:	48 c1 e0 02          	shl    rax,0x2
  805a9d:	48 01 d0             	add    rax,rdx
  805aa0:	48 05 81 a1 80 00    	add    rax,0x80a181
  805aa6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805aa9:	eb 54                	jmp    805aff <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  805aab:	0f b6 05 1b 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2001b]        # 425acd <k_shift>
  805ab2:	84 c0                	test   al,al
  805ab4:	74 1b                	je     805ad1 <to_ascii+0xc1>
  805ab6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805ab9:	48 63 d0             	movsxd rdx,eax
  805abc:	48 89 d0             	mov    rax,rdx
  805abf:	48 c1 e0 02          	shl    rax,0x2
  805ac3:	48 01 d0             	add    rax,rdx
  805ac6:	48 05 81 a1 80 00    	add    rax,0x80a181
  805acc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805acf:	eb 2e                	jmp    805aff <to_ascii+0xef>
            else return key_map[i].ascii;
  805ad1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805ad4:	48 63 d0             	movsxd rdx,eax
  805ad7:	48 89 d0             	mov    rax,rdx
  805ada:	48 c1 e0 02          	shl    rax,0x2
  805ade:	48 01 d0             	add    rax,rdx
  805ae1:	48 05 80 a1 80 00    	add    rax,0x80a180
  805ae7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805aea:	eb 13                	jmp    805aff <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  805aec:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805af0:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  805af4:	0f 8e 2f ff ff ff    	jle    805a29 <to_ascii+0x19>
        }

    return '\0';
  805afa:	b8 00 00 00 00       	mov    eax,0x0
}
  805aff:	5d                   	pop    rbp
  805b00:	c3                   	ret    

0000000000805b01 <init_kb>:
int init_kb()
{
  805b01:	f3 0f 1e fa          	endbr64 
  805b05:	55                   	push   rbp
  805b06:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  805b09:	bf c0 a0 80 00       	mov    edi,0x80a0c0
  805b0e:	e8 75 d0 ff ff       	call   802b88 <reg_device>
    reg_driver(&drv_keyboard);
  805b13:	bf 20 a0 80 00       	mov    edi,0x80a020
  805b18:	e8 53 d3 ff ff       	call   802e70 <reg_driver>
}
  805b1d:	90                   	nop
  805b1e:	5d                   	pop    rbp
  805b1f:	c3                   	ret    

0000000000805b20 <key_proc>:
int key_proc()
{
  805b20:	f3 0f 1e fa          	endbr64 
  805b24:	55                   	push   rbp
  805b25:	48 89 e5             	mov    rbp,rsp
  805b28:	48 83 ec 10          	sub    rsp,0x10
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  805b2c:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
  805b30:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  805b34:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
    key_code tmpc;
    scan1=inb(0x60);
  805b38:	bf 60 00 00 00       	mov    edi,0x60
  805b3d:	e8 6e f0 ff ff       	call   804bb0 <inb>
  805b42:	88 45 fd             	mov    BYTE PTR [rbp-0x3],al
    ch= to_ascii(scan1);
  805b45:	0f b6 45 fd          	movzx  eax,BYTE PTR [rbp-0x3]
  805b49:	0f be c0             	movsx  eax,al
  805b4c:	89 c7                	mov    edi,eax
  805b4e:	e8 bd fe ff ff       	call   805a10 <to_ascii>
  805b53:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
    if(scan1 == 0xe0 || scan1 == 0xe1)
  805b56:	80 7d fd e0          	cmp    BYTE PTR [rbp-0x3],0xe0
  805b5a:	74 06                	je     805b62 <key_proc+0x42>
  805b5c:	80 7d fd e1          	cmp    BYTE PTR [rbp-0x3],0xe1
  805b60:	75 1e                	jne    805b80 <key_proc+0x60>
    {
        ch= to_ascii(scan2);
  805b62:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  805b66:	0f be c0             	movsx  eax,al
  805b69:	89 c7                	mov    edi,eax
  805b6b:	e8 a0 fe ff ff       	call   805a10 <to_ascii>
  805b70:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
        scan2=inb(0x60);
  805b73:	bf 60 00 00 00       	mov    edi,0x60
  805b78:	e8 33 f0 ff ff       	call   804bb0 <inb>
  805b7d:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    }
    tmpc.scan_code=scan1;
  805b80:	0f b6 45 fd          	movzx  eax,BYTE PTR [rbp-0x3]
  805b84:	88 45 fa             	mov    BYTE PTR [rbp-0x6],al
    tmpc.scan_code2=scan2;
  805b87:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  805b8b:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
    tmpc.ascii= ch;
  805b8e:	0f b6 45 fe          	movzx  eax,BYTE PTR [rbp-0x2]
  805b92:	88 45 f8             	mov    BYTE PTR [rbp-0x8],al

    if(QTAIL(key_bufq)!=QHEAD(key_bufq))
  805b95:	8b 15 61 3e 00 00    	mov    edx,DWORD PTR [rip+0x3e61]        # 8099fc <key_bufq+0xc>
  805b9b:	8b 05 57 3e 00 00    	mov    eax,DWORD PTR [rip+0x3e57]        # 8099f8 <key_bufq+0x8>
  805ba1:	39 c2                	cmp    edx,eax
  805ba3:	74 43                	je     805be8 <key_proc+0xc8>
    {
        ENQUEUE(key_bufq,tmpc)
  805ba5:	48 8b 0d 44 3e 00 00 	mov    rcx,QWORD PTR [rip+0x3e44]        # 8099f0 <key_bufq>
  805bac:	8b 05 4a 3e 00 00    	mov    eax,DWORD PTR [rip+0x3e4a]        # 8099fc <key_bufq+0xc>
  805bb2:	48 63 d0             	movsxd rdx,eax
  805bb5:	48 89 d0             	mov    rax,rdx
  805bb8:	48 c1 e0 02          	shl    rax,0x2
  805bbc:	48 01 d0             	add    rax,rdx
  805bbf:	48 01 c8             	add    rax,rcx
  805bc2:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805bc5:	89 10                	mov    DWORD PTR [rax],edx
  805bc7:	0f b6 55 fc          	movzx  edx,BYTE PTR [rbp-0x4]
  805bcb:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
  805bce:	8b 05 28 3e 00 00    	mov    eax,DWORD PTR [rip+0x3e28]        # 8099fc <key_bufq+0xc>
  805bd4:	83 c0 01             	add    eax,0x1
  805bd7:	8b 0d 23 3e 00 00    	mov    ecx,DWORD PTR [rip+0x3e23]        # 809a00 <key_bufq+0x10>
  805bdd:	99                   	cdq    
  805bde:	f7 f9                	idiv   ecx
  805be0:	89 d0                	mov    eax,edx
  805be2:	89 05 14 3e 00 00    	mov    DWORD PTR [rip+0x3e14],eax        # 8099fc <key_bufq+0xc>
        //logf("%x\n",stdin.w_ptr);
        //print_stdin();
        //printchar(ch);
        //flush_screen(0);
    }*/
    eoi();
  805be8:	b8 00 00 00 00       	mov    eax,0x0
  805bed:	e8 d7 ef ff ff       	call   804bc9 <eoi>
    asm volatile("leave \r\n iret");
  805bf2:	c9                   	leave  
  805bf3:	cf                   	iret   
}
  805bf4:	90                   	nop
  805bf5:	c9                   	leave  
  805bf6:	c3                   	ret    

0000000000805bf7 <sys_getkbc>:

char sys_getkbc()
{
  805bf7:	f3 0f 1e fa          	endbr64 
  805bfb:	55                   	push   rbp
  805bfc:	48 89 e5             	mov    rbp,rsp
    if(key_bufq.tail==key_bufq.head)return -1;
  805bff:	8b 15 f7 3d 00 00    	mov    edx,DWORD PTR [rip+0x3df7]        # 8099fc <key_bufq+0xc>
  805c05:	8b 05 ed 3d 00 00    	mov    eax,DWORD PTR [rip+0x3ded]        # 8099f8 <key_bufq+0x8>
  805c0b:	39 c2                	cmp    edx,eax
  805c0d:	75 07                	jne    805c16 <sys_getkbc+0x1f>
  805c0f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805c14:	eb 43                	jmp    805c59 <sys_getkbc+0x62>
    key_code c=key_buf[key_bufq.tail];
  805c16:	8b 05 e0 3d 00 00    	mov    eax,DWORD PTR [rip+0x3de0]        # 8099fc <key_bufq+0xc>
  805c1c:	48 63 d0             	movsxd rdx,eax
  805c1f:	48 89 d0             	mov    rax,rdx
  805c22:	48 c1 e0 02          	shl    rax,0x2
  805c26:	48 01 d0             	add    rax,rdx
  805c29:	48 05 c0 50 42 00    	add    rax,0x4250c0
  805c2f:	8b 10                	mov    edx,DWORD PTR [rax]
  805c31:	89 55 fb             	mov    DWORD PTR [rbp-0x5],edx
  805c34:	0f b6 40 04          	movzx  eax,BYTE PTR [rax+0x4]
  805c38:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QTAIL(key_bufq)=(QTAIL(key_bufq)+1)%QSIZE(key_bufq);
  805c3b:	8b 05 bb 3d 00 00    	mov    eax,DWORD PTR [rip+0x3dbb]        # 8099fc <key_bufq+0xc>
  805c41:	83 c0 01             	add    eax,0x1
  805c44:	8b 0d b6 3d 00 00    	mov    ecx,DWORD PTR [rip+0x3db6]        # 809a00 <key_bufq+0x10>
  805c4a:	99                   	cdq    
  805c4b:	f7 f9                	idiv   ecx
  805c4d:	89 d0                	mov    eax,edx
  805c4f:	89 05 a7 3d 00 00    	mov    DWORD PTR [rip+0x3da7],eax        # 8099fc <key_bufq+0xc>
    return c.ascii;
  805c55:	0f b6 45 fb          	movzx  eax,BYTE PTR [rbp-0x5]
  805c59:	5d                   	pop    rbp
  805c5a:	c3                   	ret    

0000000000805c5b <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  805c5b:	f3 0f 1e fa          	endbr64 
  805c5f:	55                   	push   rbp
  805c60:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  805c63:	b8 00 00 00 00       	mov    eax,0x0
  805c68:	e8 8d 09 00 00       	call   8065fa <hd_iterate>
    return 0;
  805c6d:	b8 00 00 00 00       	mov    eax,0x0
}
  805c72:	5d                   	pop    rbp
  805c73:	c3                   	ret    

0000000000805c74 <disk_int_handler_c>:

int disk_int_handler_c()
{
  805c74:	f3 0f 1e fa          	endbr64 
  805c78:	55                   	push   rbp
  805c79:	48 89 e5             	mov    rbp,rsp
  805c7c:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  805c80:	48 8b 05 59 2b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22b59]        # 4287e0 <running_req>
  805c87:	48 85 c0             	test   rax,rax
  805c8a:	75 0a                	jne    805c96 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  805c8c:	b8 01 00 00 00       	mov    eax,0x1
  805c91:	e9 a3 01 00 00       	jmp    805e39 <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  805c96:	48 8b 05 43 2b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22b43]        # 4287e0 <running_req>
  805c9d:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805ca1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  805ca5:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  805cac:	48 8b 05 2d 2b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22b2d]        # 4287e0 <running_req>
  805cb3:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805cb6:	83 f8 02             	cmp    eax,0x2
  805cb9:	74 0f                	je     805cca <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  805cbb:	48 8b 05 1e 2b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22b1e]        # 4287e0 <running_req>
  805cc2:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  805cc5:	83 f8 03             	cmp    eax,0x3
  805cc8:	75 07                	jne    805cd1 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  805cca:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  805cd1:	48 8b 05 08 2b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22b08]        # 4287e0 <running_req>
  805cd8:	8b 00                	mov    eax,DWORD PTR [rax]
  805cda:	85 c0                	test   eax,eax
  805cdc:	75 42                	jne    805d20 <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  805cde:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  805ce5:	eb 22                	jmp    805d09 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  805ce7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805cea:	0f b7 c0             	movzx  eax,ax
  805ced:	89 c7                	mov    edi,eax
  805cef:	e8 c8 ee ff ff       	call   804bbc <inw>
  805cf4:	89 c2                	mov    edx,eax
  805cf6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805cfa:	48 8d 48 02          	lea    rcx,[rax+0x2]
  805cfe:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  805d02:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  805d05:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  805d09:	48 8b 05 d0 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22ad0]        # 4287e0 <running_req>
  805d10:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  805d13:	c1 e0 08             	shl    eax,0x8
  805d16:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  805d19:	7c cc                	jl     805ce7 <disk_int_handler_c+0x73>
  805d1b:	e9 ca 00 00 00       	jmp    805dea <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  805d20:	48 8b 05 b9 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22ab9]        # 4287e0 <running_req>
  805d27:	8b 00                	mov    eax,DWORD PTR [rax]
  805d29:	83 f8 01             	cmp    eax,0x1
  805d2c:	75 42                	jne    805d70 <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  805d2e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805d35:	eb 25                	jmp    805d5c <disk_int_handler_c+0xe8>
            outw(port,*p++);
  805d37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805d3b:	48 8d 50 02          	lea    rdx,[rax+0x2]
  805d3f:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  805d43:	0f b7 00             	movzx  eax,WORD PTR [rax]
  805d46:	0f b7 d0             	movzx  edx,ax
  805d49:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805d4c:	0f b7 c0             	movzx  eax,ax
  805d4f:	89 d6                	mov    esi,edx
  805d51:	89 c7                	mov    edi,eax
  805d53:	e8 48 ee ff ff       	call   804ba0 <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  805d58:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805d5c:	48 8b 05 7d 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a7d]        # 4287e0 <running_req>
  805d63:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  805d66:	c1 e0 08             	shl    eax,0x8
  805d69:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805d6c:	7c c9                	jl     805d37 <disk_int_handler_c+0xc3>
  805d6e:	eb 7a                	jmp    805dea <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  805d70:	48 8b 05 69 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a69]        # 4287e0 <running_req>
  805d77:	8b 00                	mov    eax,DWORD PTR [rax]
  805d79:	83 f8 02             	cmp    eax,0x2
  805d7c:	75 34                	jne    805db2 <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  805d7e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805d81:	83 c0 07             	add    eax,0x7
  805d84:	0f b6 c0             	movzx  eax,al
  805d87:	89 c7                	mov    edi,eax
  805d89:	e8 22 ee ff ff       	call   804bb0 <inb>
  805d8e:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  805d91:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805d94:	0f b7 c0             	movzx  eax,ax
  805d97:	89 c7                	mov    edi,eax
  805d99:	e8 1e ee ff ff       	call   804bbc <inw>
  805d9e:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  805da2:	48 8b 05 37 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a37]        # 4287e0 <running_req>
  805da9:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  805db0:	eb 38                	jmp    805dea <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  805db2:	48 8b 05 27 2a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22a27]        # 4287e0 <running_req>
  805db9:	8b 00                	mov    eax,DWORD PTR [rax]
  805dbb:	83 f8 03             	cmp    eax,0x3
  805dbe:	75 2a                	jne    805dea <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  805dc0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805dc3:	83 c0 07             	add    eax,0x7
  805dc6:	0f b6 c0             	movzx  eax,al
  805dc9:	89 c7                	mov    edi,eax
  805dcb:	e8 e0 ed ff ff       	call   804bb0 <inb>
  805dd0:	0f b6 c0             	movzx  eax,al
  805dd3:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  805dd6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805dd9:	89 c6                	mov    esi,eax
  805ddb:	bf 56 a3 80 00       	mov    edi,0x80a356
  805de0:	b8 00 00 00 00       	mov    eax,0x0
  805de5:	e8 43 b0 ff ff       	call   800e2d <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  805dea:	48 8b 05 ef 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc229ef]        # 4287e0 <running_req>
  805df1:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  805df8:	48 8b 05 e1 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc229e1]        # 4287e0 <running_req>
  805dff:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  805e03:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  805e0a:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  805e0d:	48 8b 05 d4 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc229d4]        # 4287e8 <running_devman_req>
  805e14:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  805e1b:	00 00 00 
    running_devman_req=NULL;
  805e1e:	48 c7 05 bf 29 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc229bf],0x0        # 4287e8 <running_devman_req>
  805e25:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  805e29:	48 c7 05 ac 29 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc229ac],0x0        # 4287e0 <running_req>
  805e30:	00 00 00 00 
    return 0;
  805e34:	b8 00 00 00 00       	mov    eax,0x0
}
  805e39:	c9                   	leave  
  805e3a:	c3                   	ret    

0000000000805e3b <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  805e3b:	f3 0f 1e fa          	endbr64 
  805e3f:	55                   	push   rbp
  805e40:	48 89 e5             	mov    rbp,rsp
  805e43:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  805e46:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805e49:	48 63 d0             	movsxd rdx,eax
  805e4c:	48 89 d0             	mov    rax,rdx
  805e4f:	48 01 c0             	add    rax,rax
  805e52:	48 01 d0             	add    rax,rdx
  805e55:	48 c1 e0 04          	shl    rax,0x4
  805e59:	48 05 fc 5a 42 00    	add    rax,0x425afc
  805e5f:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805e61:	5d                   	pop    rbp
  805e62:	c3                   	ret    

0000000000805e63 <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  805e63:	f3 0f 1e fa          	endbr64 
  805e67:	55                   	push   rbp
  805e68:	48 89 e5             	mov    rbp,rsp
  805e6b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  805e6e:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805e71:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  805e74:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  805e77:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  805e7b:	8b 05 93 29 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22993]        # 428814 <tail>
  805e81:	83 c0 01             	add    eax,0x1
  805e84:	48 63 d0             	movsxd rdx,eax
  805e87:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  805e8e:	48 c1 ea 20          	shr    rdx,0x20
  805e92:	01 c2                	add    edx,eax
  805e94:	c1 fa 07             	sar    edx,0x7
  805e97:	89 c1                	mov    ecx,eax
  805e99:	c1 f9 1f             	sar    ecx,0x1f
  805e9c:	29 ca                	sub    edx,ecx
  805e9e:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  805ea4:	29 c8                	sub    eax,ecx
  805ea6:	89 c2                	mov    edx,eax
  805ea8:	8b 05 62 29 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22962]        # 428810 <head>
  805eae:	39 c2                	cmp    edx,eax
  805eb0:	75 0a                	jne    805ebc <request+0x59>
    {
        return -1;
  805eb2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805eb7:	e9 0d 01 00 00       	jmp    805fc9 <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  805ebc:	8b 05 52 29 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22952]        # 428814 <tail>
  805ec2:	48 63 d0             	movsxd rdx,eax
  805ec5:	48 89 d0             	mov    rax,rdx
  805ec8:	48 01 c0             	add    rax,rax
  805ecb:	48 01 d0             	add    rax,rdx
  805ece:	48 c1 e0 04          	shl    rax,0x4
  805ed2:	48 8d 90 e4 5a 42 00 	lea    rdx,[rax+0x425ae4]
  805ed9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805edc:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  805ede:	8b 05 30 29 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22930]        # 428814 <tail>
  805ee4:	48 63 d0             	movsxd rdx,eax
  805ee7:	48 89 d0             	mov    rax,rdx
  805eea:	48 01 c0             	add    rax,rax
  805eed:	48 01 d0             	add    rax,rdx
  805ef0:	48 c1 e0 04          	shl    rax,0x4
  805ef4:	48 8d 90 e0 5a 42 00 	lea    rdx,[rax+0x425ae0]
  805efb:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805efe:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  805f00:	8b 05 0e 29 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2290e]        # 428814 <tail>
  805f06:	48 63 d0             	movsxd rdx,eax
  805f09:	48 89 d0             	mov    rax,rdx
  805f0c:	48 01 c0             	add    rax,rax
  805f0f:	48 01 d0             	add    rax,rdx
  805f12:	48 c1 e0 04          	shl    rax,0x4
  805f16:	48 8d 90 e8 5a 42 00 	lea    rdx,[rax+0x425ae8]
  805f1d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  805f20:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  805f22:	8b 05 ec 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc228ec]        # 428814 <tail>
  805f28:	48 63 d0             	movsxd rdx,eax
  805f2b:	48 89 d0             	mov    rax,rdx
  805f2e:	48 01 c0             	add    rax,rax
  805f31:	48 01 d0             	add    rax,rdx
  805f34:	48 c1 e0 04          	shl    rax,0x4
  805f38:	48 8d 90 ec 5a 42 00 	lea    rdx,[rax+0x425aec]
  805f3f:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  805f42:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  805f44:	8b 05 ca 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc228ca]        # 428814 <tail>
  805f4a:	48 63 d0             	movsxd rdx,eax
  805f4d:	48 89 d0             	mov    rax,rdx
  805f50:	48 01 c0             	add    rax,rax
  805f53:	48 01 d0             	add    rax,rdx
  805f56:	48 c1 e0 04          	shl    rax,0x4
  805f5a:	48 05 fc 5a 42 00    	add    rax,0x425afc
  805f60:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  805f66:	8b 05 a8 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc228a8]        # 428814 <tail>
  805f6c:	48 63 d0             	movsxd rdx,eax
  805f6f:	48 89 d0             	mov    rax,rdx
  805f72:	48 01 c0             	add    rax,rax
  805f75:	48 01 d0             	add    rax,rdx
  805f78:	48 c1 e0 04          	shl    rax,0x4
  805f7c:	48 8d 90 f0 5a 42 00 	lea    rdx,[rax+0x425af0]
  805f83:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805f87:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  805f8a:	8b 05 84 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22884]        # 428814 <tail>
  805f90:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  805f93:	8b 05 7b 28 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2287b]        # 428814 <tail>
  805f99:	8d 50 01             	lea    edx,[rax+0x1]
  805f9c:	48 63 c2             	movsxd rax,edx
  805f9f:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  805fa6:	48 c1 e8 20          	shr    rax,0x20
  805faa:	01 d0                	add    eax,edx
  805fac:	c1 f8 07             	sar    eax,0x7
  805faf:	89 d1                	mov    ecx,edx
  805fb1:	c1 f9 1f             	sar    ecx,0x1f
  805fb4:	29 c8                	sub    eax,ecx
  805fb6:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  805fbc:	89 d0                	mov    eax,edx
  805fbe:	29 c8                	sub    eax,ecx
  805fc0:	89 05 4e 28 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2284e],eax        # 428814 <tail>
    return r;
  805fc6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  805fc9:	5d                   	pop    rbp
  805fca:	c3                   	ret    

0000000000805fcb <execute_request>:
int execute_request(){
  805fcb:	f3 0f 1e fa          	endbr64 
  805fcf:	55                   	push   rbp
  805fd0:	48 89 e5             	mov    rbp,rsp
  805fd3:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  805fd7:	48 8b 05 02 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22802]        # 4287e0 <running_req>
  805fde:	48 85 c0             	test   rax,rax
  805fe1:	74 6a                	je     80604d <execute_request+0x82>
    {
        running_req->time++;
  805fe3:	48 8b 05 f6 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227f6]        # 4287e0 <running_req>
  805fea:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  805fed:	83 c2 01             	add    edx,0x1
  805ff0:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  805ff3:	48 8b 05 e6 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227e6]        # 4287e0 <running_req>
  805ffa:	8b 00                	mov    eax,DWORD PTR [rax]
  805ffc:	83 f8 02             	cmp    eax,0x2
  805fff:	74 0a                	je     80600b <execute_request+0x40>
            return 2;
  806001:	b8 02 00 00 00       	mov    eax,0x2
  806006:	e9 b4 01 00 00       	jmp    8061bf <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  80600b:	48 8b 05 ce 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227ce]        # 4287e0 <running_req>
  806012:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  806015:	83 f8 0a             	cmp    eax,0xa
  806018:	7e 29                	jle    806043 <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  80601a:	48 8b 05 bf 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227bf]        # 4287e0 <running_req>
  806021:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  806028:	48 8b 05 b1 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227b1]        # 4287e0 <running_req>
  80602f:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  806036:	48 c7 05 9f 27 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2279f],0x0        # 4287e0 <running_req>
  80603d:	00 00 00 00 
  806041:	eb 0a                	jmp    80604d <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  806043:	b8 02 00 00 00       	mov    eax,0x2
  806048:	e9 72 01 00 00       	jmp    8061bf <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  80604d:	8b 15 bd 27 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc227bd]        # 428810 <head>
  806053:	8b 05 bb 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc227bb]        # 428814 <tail>
  806059:	39 c2                	cmp    edx,eax
  80605b:	75 0a                	jne    806067 <execute_request+0x9c>
  80605d:	b8 01 00 00 00       	mov    eax,0x1
  806062:	e9 58 01 00 00       	jmp    8061bf <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  806067:	8b 05 a3 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc227a3]        # 428810 <head>
  80606d:	48 63 d0             	movsxd rdx,eax
  806070:	48 89 d0             	mov    rax,rdx
  806073:	48 01 c0             	add    rax,rax
  806076:	48 01 d0             	add    rax,rdx
  806079:	48 c1 e0 04          	shl    rax,0x4
  80607d:	48 05 e0 5a 42 00    	add    rax,0x425ae0
  806083:	48 89 05 56 27 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22756],rax        # 4287e0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  80608a:	8b 05 80 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22780]        # 428810 <head>
  806090:	8d 50 01             	lea    edx,[rax+0x1]
  806093:	48 63 c2             	movsxd rax,edx
  806096:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  80609d:	48 c1 e8 20          	shr    rax,0x20
  8060a1:	01 d0                	add    eax,edx
  8060a3:	c1 f8 07             	sar    eax,0x7
  8060a6:	89 d1                	mov    ecx,edx
  8060a8:	c1 f9 1f             	sar    ecx,0x1f
  8060ab:	29 c8                	sub    eax,ecx
  8060ad:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8060b3:	89 d0                	mov    eax,edx
  8060b5:	29 c8                	sub    eax,ecx
  8060b7:	89 05 53 27 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc22753],eax        # 428810 <head>
    running_req->stat=REQ_STAT_WORKING;
  8060bd:	48 8b 05 1c 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2271c]        # 4287e0 <running_req>
  8060c4:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  8060cb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  8060d2:	48 8b 05 07 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22707]        # 4287e0 <running_req>
  8060d9:	8b 00                	mov    eax,DWORD PTR [rax]
  8060db:	83 f8 03             	cmp    eax,0x3
  8060de:	0f 84 ad 00 00 00    	je     806191 <execute_request+0x1c6>
  8060e4:	83 f8 03             	cmp    eax,0x3
  8060e7:	0f 8f bf 00 00 00    	jg     8061ac <execute_request+0x1e1>
  8060ed:	83 f8 02             	cmp    eax,0x2
  8060f0:	0f 84 85 00 00 00    	je     80617b <execute_request+0x1b0>
  8060f6:	83 f8 02             	cmp    eax,0x2
  8060f9:	0f 8f ad 00 00 00    	jg     8061ac <execute_request+0x1e1>
  8060ff:	85 c0                	test   eax,eax
  806101:	74 0a                	je     80610d <execute_request+0x142>
  806103:	83 f8 01             	cmp    eax,0x1
  806106:	74 3c                	je     806144 <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  806108:	e9 9f 00 00 00       	jmp    8061ac <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  80610d:	48 8b 05 cc 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226cc]        # 4287e0 <running_req>
        r=async_read_disk(running_req->disk,\
  806114:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  806118:	48 8b 05 c1 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226c1]        # 4287e0 <running_req>
        r=async_read_disk(running_req->disk,\
  80611f:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  806122:	48 8b 05 b7 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226b7]        # 4287e0 <running_req>
  806129:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  80612c:	89 c6                	mov    esi,eax
  80612e:	48 8b 05 ab 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226ab]        # 4287e0 <running_req>
  806135:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806138:	89 c7                	mov    edi,eax
  80613a:	e8 a7 00 00 00       	call   8061e6 <async_read_disk>
  80613f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806142:	eb 69                	jmp    8061ad <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  806144:	48 8b 05 95 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22695]        # 4287e0 <running_req>
        r=async_write_disk(running_req->disk,\
  80614b:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  80614f:	48 8b 05 8a 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2268a]        # 4287e0 <running_req>
        r=async_write_disk(running_req->disk,\
  806156:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  806159:	48 8b 05 80 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22680]        # 4287e0 <running_req>
  806160:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  806163:	89 c6                	mov    esi,eax
  806165:	48 8b 05 74 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22674]        # 4287e0 <running_req>
  80616c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80616f:	89 c7                	mov    edi,eax
  806171:	e8 88 01 00 00       	call   8062fe <async_write_disk>
  806176:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806179:	eb 32                	jmp    8061ad <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  80617b:	48 8b 05 5e 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2265e]        # 4287e0 <running_req>
  806182:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806185:	89 c7                	mov    edi,eax
  806187:	e8 77 06 00 00       	call   806803 <async_check_disk>
  80618c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  80618f:	eb 1c                	jmp    8061ad <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  806191:	48 8b 05 48 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22648]        # 4287e0 <running_req>
  806198:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80619b:	89 c7                	mov    edi,eax
  80619d:	b8 00 00 00 00       	mov    eax,0x0
  8061a2:	e8 1a 00 00 00       	call   8061c1 <async_reset_disk>
  8061a7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8061aa:	eb 01                	jmp    8061ad <execute_request+0x1e2>
        break;
  8061ac:	90                   	nop
    }
    if(r==-1)return -1;
  8061ad:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8061b1:	75 07                	jne    8061ba <execute_request+0x1ef>
  8061b3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8061b8:	eb 05                	jmp    8061bf <execute_request+0x1f4>
    return 0;
  8061ba:	b8 00 00 00 00       	mov    eax,0x0
}
  8061bf:	c9                   	leave  
  8061c0:	c3                   	ret    

00000000008061c1 <async_reset_disk>:
int async_reset_disk(int disk)
{
  8061c1:	f3 0f 1e fa          	endbr64 
  8061c5:	55                   	push   rbp
  8061c6:	48 89 e5             	mov    rbp,rsp
  8061c9:	48 83 ec 10          	sub    rsp,0x10
  8061cd:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  8061d0:	be 0c 00 00 00       	mov    esi,0xc
  8061d5:	bf f6 03 00 00       	mov    edi,0x3f6
  8061da:	e8 b1 e9 ff ff       	call   804b90 <outb>
    return 0;
  8061df:	b8 00 00 00 00       	mov    eax,0x0
}
  8061e4:	c9                   	leave  
  8061e5:	c3                   	ret    

00000000008061e6 <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  8061e6:	f3 0f 1e fa          	endbr64 
  8061ea:	55                   	push   rbp
  8061eb:	48 89 e5             	mov    rbp,rsp
  8061ee:	48 83 ec 30          	sub    rsp,0x30
  8061f2:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8061f5:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8061f8:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8061fb:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  8061ff:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  806205:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80620c:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806210:	74 06                	je     806218 <async_read_disk+0x32>
  806212:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806216:	75 06                	jne    80621e <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  806218:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  80621e:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806222:	74 06                	je     80622a <async_read_disk+0x44>
  806224:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806228:	75 07                	jne    806231 <async_read_disk+0x4b>
        slave_disk=1;
  80622a:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  806231:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806234:	0f b6 d0             	movzx  edx,al
  806237:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80623b:	83 c0 02             	add    eax,0x2
  80623e:	0f b7 c0             	movzx  eax,ax
  806241:	89 d6                	mov    esi,edx
  806243:	89 c7                	mov    edi,eax
  806245:	e8 46 e9 ff ff       	call   804b90 <outb>
    outb(port+3,lba&0xff);
  80624a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80624d:	0f b6 d0             	movzx  edx,al
  806250:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806254:	83 c0 03             	add    eax,0x3
  806257:	0f b7 c0             	movzx  eax,ax
  80625a:	89 d6                	mov    esi,edx
  80625c:	89 c7                	mov    edi,eax
  80625e:	e8 2d e9 ff ff       	call   804b90 <outb>
    outb(port+4,(lba>>8)&0xff);
  806263:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806266:	c1 e8 08             	shr    eax,0x8
  806269:	0f b6 d0             	movzx  edx,al
  80626c:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806270:	83 c0 04             	add    eax,0x4
  806273:	0f b7 c0             	movzx  eax,ax
  806276:	89 d6                	mov    esi,edx
  806278:	89 c7                	mov    edi,eax
  80627a:	e8 11 e9 ff ff       	call   804b90 <outb>
    outb(port+5,(lba>>16)&0xff);
  80627f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806282:	c1 e8 10             	shr    eax,0x10
  806285:	0f b6 d0             	movzx  edx,al
  806288:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80628c:	83 c0 05             	add    eax,0x5
  80628f:	0f b7 c0             	movzx  eax,ax
  806292:	89 d6                	mov    esi,edx
  806294:	89 c7                	mov    edi,eax
  806296:	e8 f5 e8 ff ff       	call   804b90 <outb>
    char drv=slave_disk?0x10:0;
  80629b:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  80629f:	74 07                	je     8062a8 <async_read_disk+0xc2>
  8062a1:	b8 10 00 00 00       	mov    eax,0x10
  8062a6:	eb 05                	jmp    8062ad <async_read_disk+0xc7>
  8062a8:	b8 00 00 00 00       	mov    eax,0x0
  8062ad:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  8062b0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8062b3:	c1 e8 18             	shr    eax,0x18
  8062b6:	83 e0 0f             	and    eax,0xf
  8062b9:	89 c2                	mov    edx,eax
  8062bb:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  8062bf:	09 d0                	or     eax,edx
  8062c1:	83 c8 e0             	or     eax,0xffffffe0
  8062c4:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  8062c7:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  8062cb:	0f b6 d0             	movzx  edx,al
  8062ce:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8062d2:	83 c0 06             	add    eax,0x6
  8062d5:	0f b7 c0             	movzx  eax,ax
  8062d8:	89 d6                	mov    esi,edx
  8062da:	89 c7                	mov    edi,eax
  8062dc:	e8 af e8 ff ff       	call   804b90 <outb>
    outb(port+7,DISK_CMD_READ);
  8062e1:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8062e5:	83 c0 07             	add    eax,0x7
  8062e8:	0f b7 c0             	movzx  eax,ax
  8062eb:	be 20 00 00 00       	mov    esi,0x20
  8062f0:	89 c7                	mov    edi,eax
  8062f2:	e8 99 e8 ff ff       	call   804b90 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  8062f7:	b8 00 00 00 00       	mov    eax,0x0
}
  8062fc:	c9                   	leave  
  8062fd:	c3                   	ret    

00000000008062fe <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  8062fe:	f3 0f 1e fa          	endbr64 
  806302:	55                   	push   rbp
  806303:	48 89 e5             	mov    rbp,rsp
  806306:	48 83 ec 30          	sub    rsp,0x30
  80630a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80630d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806310:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806313:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  806317:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  80631d:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806324:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806328:	74 06                	je     806330 <async_write_disk+0x32>
  80632a:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80632e:	75 06                	jne    806336 <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  806330:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806336:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80633a:	74 06                	je     806342 <async_write_disk+0x44>
  80633c:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806340:	75 07                	jne    806349 <async_write_disk+0x4b>
        slave_disk=1;
  806342:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  806349:	bf f7 00 00 00       	mov    edi,0xf7
  80634e:	e8 5d e8 ff ff       	call   804bb0 <inb>
  806353:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  806356:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  80635a:	83 e0 01             	and    eax,0x1
  80635d:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  806360:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  806364:	74 0a                	je     806370 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  806366:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80636b:	e9 d5 00 00 00       	jmp    806445 <async_write_disk+0x147>
        }
        t&=0x88;
  806370:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  806374:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  806378:	74 02                	je     80637c <async_write_disk+0x7e>
    {
  80637a:	eb cd                	jmp    806349 <async_write_disk+0x4b>
        if(t==0x8)break;
  80637c:	90                   	nop
    }
    outb(port+2,sec_n);
  80637d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806380:	0f b6 d0             	movzx  edx,al
  806383:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806387:	83 c0 02             	add    eax,0x2
  80638a:	0f b7 c0             	movzx  eax,ax
  80638d:	89 d6                	mov    esi,edx
  80638f:	89 c7                	mov    edi,eax
  806391:	e8 fa e7 ff ff       	call   804b90 <outb>
    outb(port+3,lba&0xff);
  806396:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806399:	0f b6 d0             	movzx  edx,al
  80639c:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8063a0:	83 c0 03             	add    eax,0x3
  8063a3:	0f b7 c0             	movzx  eax,ax
  8063a6:	89 d6                	mov    esi,edx
  8063a8:	89 c7                	mov    edi,eax
  8063aa:	e8 e1 e7 ff ff       	call   804b90 <outb>
    outb(port+4,(lba>>8)&0xff);
  8063af:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8063b2:	c1 e8 08             	shr    eax,0x8
  8063b5:	0f b6 d0             	movzx  edx,al
  8063b8:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8063bc:	83 c0 04             	add    eax,0x4
  8063bf:	0f b7 c0             	movzx  eax,ax
  8063c2:	89 d6                	mov    esi,edx
  8063c4:	89 c7                	mov    edi,eax
  8063c6:	e8 c5 e7 ff ff       	call   804b90 <outb>
    outb(port+5,(lba>>16)&0xff);
  8063cb:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8063ce:	c1 e8 10             	shr    eax,0x10
  8063d1:	0f b6 d0             	movzx  edx,al
  8063d4:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8063d8:	83 c0 05             	add    eax,0x5
  8063db:	0f b7 c0             	movzx  eax,ax
  8063de:	89 d6                	mov    esi,edx
  8063e0:	89 c7                	mov    edi,eax
  8063e2:	e8 a9 e7 ff ff       	call   804b90 <outb>
    char drv=slave_disk?0x10:0;
  8063e7:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  8063eb:	74 07                	je     8063f4 <async_write_disk+0xf6>
  8063ed:	b8 10 00 00 00       	mov    eax,0x10
  8063f2:	eb 05                	jmp    8063f9 <async_write_disk+0xfb>
  8063f4:	b8 00 00 00 00       	mov    eax,0x0
  8063f9:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  8063fc:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8063ff:	c1 e8 18             	shr    eax,0x18
  806402:	83 e0 0f             	and    eax,0xf
  806405:	89 c2                	mov    edx,eax
  806407:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  80640b:	09 d0                	or     eax,edx
  80640d:	83 c8 e0             	or     eax,0xffffffe0
  806410:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  806413:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  806417:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80641b:	83 c0 06             	add    eax,0x6
  80641e:	0f b7 c0             	movzx  eax,ax
  806421:	89 d6                	mov    esi,edx
  806423:	89 c7                	mov    edi,eax
  806425:	e8 66 e7 ff ff       	call   804b90 <outb>
    outb(port+7,DISK_CMD_WRITE);
  80642a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80642e:	83 c0 07             	add    eax,0x7
  806431:	0f b7 c0             	movzx  eax,ax
  806434:	be 30 00 00 00       	mov    esi,0x30
  806439:	89 c7                	mov    edi,eax
  80643b:	e8 50 e7 ff ff       	call   804b90 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  806440:	b8 00 00 00 00       	mov    eax,0x0
}
  806445:	c9                   	leave  
  806446:	c3                   	ret    

0000000000806447 <read_disk>:
int read_disk(driver_args* args)
{
  806447:	f3 0f 1e fa          	endbr64 
  80644b:	55                   	push   rbp
  80644c:	48 89 e5             	mov    rbp,rsp
  80644f:	48 83 ec 20          	sub    rsp,0x20
  806453:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  806457:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80645b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80645e:	48 98                	cdqe   
  806460:	48 89 c2             	mov    rdx,rax
  806463:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806467:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80646a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80646e:	8b 00                	mov    eax,DWORD PTR [rax]
  806470:	89 ce                	mov    esi,ecx
  806472:	89 c7                	mov    edi,eax
  806474:	e8 72 05 00 00       	call   8069eb <read_disk_asm>
  806479:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  80647c:	48 8b 05 5d 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2235d]        # 4287e0 <running_req>
  806483:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  80648a:	48 8b 05 4f 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2234f]        # 4287e0 <running_req>
  806491:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806495:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  80649c:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  80649f:	48 c7 05 36 23 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22336],0x0        # 4287e0 <running_req>
  8064a6:	00 00 00 00 
    return ret;
  8064aa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8064ad:	c9                   	leave  
  8064ae:	c3                   	ret    

00000000008064af <write_disk>:
int write_disk(driver_args* args)
{
  8064af:	f3 0f 1e fa          	endbr64 
  8064b3:	55                   	push   rbp
  8064b4:	48 89 e5             	mov    rbp,rsp
  8064b7:	48 83 ec 20          	sub    rsp,0x20
  8064bb:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  8064bf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8064c3:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8064c6:	48 98                	cdqe   
  8064c8:	48 89 c2             	mov    rdx,rax
  8064cb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8064cf:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8064d2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8064d6:	8b 00                	mov    eax,DWORD PTR [rax]
  8064d8:	89 ce                	mov    esi,ecx
  8064da:	89 c7                	mov    edi,eax
  8064dc:	e8 82 05 00 00       	call   806a63 <write_disk_asm>
  8064e1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  8064e4:	48 8b 05 f5 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc222f5]        # 4287e0 <running_req>
  8064eb:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8064f2:	48 8b 05 e7 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc222e7]        # 4287e0 <running_req>
  8064f9:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8064fd:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  806504:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806507:	48 c7 05 ce 22 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc222ce],0x0        # 4287e0 <running_req>
  80650e:	00 00 00 00 
    return ret;
  806512:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806515:	c9                   	leave  
  806516:	c3                   	ret    

0000000000806517 <chk_result>:
int chk_result(int r)
{
  806517:	f3 0f 1e fa          	endbr64 
  80651b:	55                   	push   rbp
  80651c:	48 89 e5             	mov    rbp,rsp
  80651f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  806522:	90                   	nop
  806523:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806526:	48 63 d0             	movsxd rdx,eax
  806529:	48 89 d0             	mov    rax,rdx
  80652c:	48 01 c0             	add    rax,rax
  80652f:	48 01 d0             	add    rax,rdx
  806532:	48 c1 e0 04          	shl    rax,0x4
  806536:	48 05 fc 5a 42 00    	add    rax,0x425afc
  80653c:	8b 00                	mov    eax,DWORD PTR [rax]
  80653e:	83 f8 03             	cmp    eax,0x3
  806541:	75 e0                	jne    806523 <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  806543:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806546:	48 63 d0             	movsxd rdx,eax
  806549:	48 89 d0             	mov    rax,rdx
  80654c:	48 01 c0             	add    rax,rax
  80654f:	48 01 d0             	add    rax,rdx
  806552:	48 c1 e0 04          	shl    rax,0x4
  806556:	48 05 00 5b 42 00    	add    rax,0x425b00
  80655c:	8b 00                	mov    eax,DWORD PTR [rax]
  80655e:	83 f8 01             	cmp    eax,0x1
  806561:	0f 94 c0             	sete   al
  806564:	0f b6 c0             	movzx  eax,al
}
  806567:	5d                   	pop    rbp
  806568:	c3                   	ret    

0000000000806569 <disk_existent>:
int disk_existent(int disk)
{
  806569:	f3 0f 1e fa          	endbr64 
  80656d:	55                   	push   rbp
  80656e:	48 89 e5             	mov    rbp,rsp
  806571:	48 83 ec 10          	sub    rsp,0x10
  806575:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  806578:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  80657c:	74 5f                	je     8065dd <disk_existent+0x74>
  80657e:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  806582:	7f 6e                	jg     8065f2 <disk_existent+0x89>
  806584:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  806588:	74 3e                	je     8065c8 <disk_existent+0x5f>
  80658a:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  80658e:	7f 62                	jg     8065f2 <disk_existent+0x89>
  806590:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  806594:	74 08                	je     80659e <disk_existent+0x35>
  806596:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  80659a:	74 17                	je     8065b3 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  80659c:	eb 54                	jmp    8065f2 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  80659e:	bf 74 a3 80 00       	mov    edi,0x80a374
  8065a3:	e8 18 ca ff ff       	call   802fc0 <sys_find_dev>
  8065a8:	83 f8 ff             	cmp    eax,0xffffffff
  8065ab:	0f 95 c0             	setne  al
  8065ae:	0f b6 c0             	movzx  eax,al
  8065b1:	eb 45                	jmp    8065f8 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  8065b3:	bf 78 a3 80 00       	mov    edi,0x80a378
  8065b8:	e8 03 ca ff ff       	call   802fc0 <sys_find_dev>
  8065bd:	83 f8 ff             	cmp    eax,0xffffffff
  8065c0:	0f 95 c0             	setne  al
  8065c3:	0f b6 c0             	movzx  eax,al
  8065c6:	eb 30                	jmp    8065f8 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  8065c8:	bf 7c a3 80 00       	mov    edi,0x80a37c
  8065cd:	e8 ee c9 ff ff       	call   802fc0 <sys_find_dev>
  8065d2:	83 f8 ff             	cmp    eax,0xffffffff
  8065d5:	0f 95 c0             	setne  al
  8065d8:	0f b6 c0             	movzx  eax,al
  8065db:	eb 1b                	jmp    8065f8 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  8065dd:	bf 80 a3 80 00       	mov    edi,0x80a380
  8065e2:	e8 d9 c9 ff ff       	call   802fc0 <sys_find_dev>
  8065e7:	83 f8 ff             	cmp    eax,0xffffffff
  8065ea:	0f 95 c0             	setne  al
  8065ed:	0f b6 c0             	movzx  eax,al
  8065f0:	eb 06                	jmp    8065f8 <disk_existent+0x8f>
        break;
  8065f2:	90                   	nop
    }
    return 0;
  8065f3:	b8 00 00 00 00       	mov    eax,0x0
}
  8065f8:	c9                   	leave  
  8065f9:	c3                   	ret    

00000000008065fa <hd_iterate>:
int hd_iterate()
{
  8065fa:	f3 0f 1e fa          	endbr64 
  8065fe:	55                   	push   rbp
  8065ff:	48 89 e5             	mov    rbp,rsp
  806602:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  806609:	41 b8 00 00 00 00    	mov    r8d,0x0
  80660f:	b9 01 00 00 00       	mov    ecx,0x1
  806614:	ba 00 00 00 00       	mov    edx,0x0
  806619:	be 02 00 00 00       	mov    esi,0x2
  80661e:	bf 00 00 00 00       	mov    edi,0x0
  806623:	e8 3b f8 ff ff       	call   805e63 <request>
  806628:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  80662b:	41 b8 00 00 00 00    	mov    r8d,0x0
  806631:	b9 01 00 00 00       	mov    ecx,0x1
  806636:	ba 00 00 00 00       	mov    edx,0x0
  80663b:	be 02 00 00 00       	mov    esi,0x2
  806640:	bf 01 00 00 00       	mov    edi,0x1
  806645:	e8 19 f8 ff ff       	call   805e63 <request>
  80664a:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  80664d:	41 b8 00 00 00 00    	mov    r8d,0x0
  806653:	b9 01 00 00 00       	mov    ecx,0x1
  806658:	ba 00 00 00 00       	mov    edx,0x0
  80665d:	be 02 00 00 00       	mov    esi,0x2
  806662:	bf 02 00 00 00       	mov    edi,0x2
  806667:	e8 f7 f7 ff ff       	call   805e63 <request>
  80666c:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  80666f:	41 b8 00 00 00 00    	mov    r8d,0x0
  806675:	b9 01 00 00 00       	mov    ecx,0x1
  80667a:	ba 00 00 00 00       	mov    edx,0x0
  80667f:	be 02 00 00 00       	mov    esi,0x2
  806684:	bf 03 00 00 00       	mov    edi,0x3
  806689:	e8 d5 f7 ff ff       	call   805e63 <request>
  80668e:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<4;i++)
  806691:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806698:	e9 5a 01 00 00       	jmp    8067f7 <hd_iterate+0x1fd>
    {
        int disk;
        switch (i)
  80669d:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8066a1:	74 3b                	je     8066de <hd_iterate+0xe4>
  8066a3:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8066a7:	7f 3e                	jg     8066e7 <hd_iterate+0xed>
  8066a9:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8066ad:	74 26                	je     8066d5 <hd_iterate+0xdb>
  8066af:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8066b3:	7f 32                	jg     8066e7 <hd_iterate+0xed>
  8066b5:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8066b9:	74 08                	je     8066c3 <hd_iterate+0xc9>
  8066bb:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8066bf:	74 0b                	je     8066cc <hd_iterate+0xd2>
  8066c1:	eb 24                	jmp    8066e7 <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  8066c3:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8066ca:	eb 25                	jmp    8066f1 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  8066cc:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  8066d3:	eb 1c                	jmp    8066f1 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  8066d5:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  8066dc:	eb 13                	jmp    8066f1 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  8066de:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  8066e5:	eb 0a                	jmp    8066f1 <hd_iterate+0xf7>
        default:
            return -1;
  8066e7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8066ec:	e9 10 01 00 00       	jmp    806801 <hd_iterate+0x207>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  8066f1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8066f4:	48 98                	cdqe   
  8066f6:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  8066fa:	89 c7                	mov    edi,eax
  8066fc:	e8 16 fe ff ff       	call   806517 <chk_result>
  806701:	85 c0                	test   eax,eax
  806703:	74 6d                	je     806772 <hd_iterate+0x178>
        {
            //新硬盘
            device hd={
  806705:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  80670c:	b8 00 00 00 00       	mov    eax,0x0
  806711:	b9 15 00 00 00       	mov    ecx,0x15
  806716:	48 89 d7             	mov    rdi,rdx
  806719:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  80671c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80671f:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  806725:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  80672c:	00 00 00 
  80672f:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  806736:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  806739:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  80673d:	7f 07                	jg     806746 <hd_iterate+0x14c>
  80673f:	b8 f0 01 00 00       	mov    eax,0x1f0
  806744:	eb 05                	jmp    80674b <hd_iterate+0x151>
  806746:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  80674b:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  806751:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  806758:	48 89 c7             	mov    rdi,rax
  80675b:	e8 28 c4 ff ff       	call   802b88 <reg_device>
  806760:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  806763:	48 63 d2             	movsxd rdx,edx
  806766:	89 04 95 00 88 42 00 	mov    DWORD PTR [rdx*4+0x428800],eax
  80676d:	e9 81 00 00 00       	jmp    8067f3 <hd_iterate+0x1f9>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  806772:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806775:	48 98                	cdqe   
  806777:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  80677b:	89 c7                	mov    edi,eax
  80677d:	e8 95 fd ff ff       	call   806517 <chk_result>
  806782:	85 c0                	test   eax,eax
  806784:	75 6d                	jne    8067f3 <hd_iterate+0x1f9>
        {
            switch (i)
  806786:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80678a:	74 3e                	je     8067ca <hd_iterate+0x1d0>
  80678c:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806790:	7f 41                	jg     8067d3 <hd_iterate+0x1d9>
  806792:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806796:	74 28                	je     8067c0 <hd_iterate+0x1c6>
  806798:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80679c:	7f 35                	jg     8067d3 <hd_iterate+0x1d9>
  80679e:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8067a2:	74 08                	je     8067ac <hd_iterate+0x1b2>
  8067a4:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8067a8:	74 0c                	je     8067b6 <hd_iterate+0x1bc>
  8067aa:	eb 27                	jmp    8067d3 <hd_iterate+0x1d9>
            {
            case 0:name="hd0";break;
  8067ac:	48 c7 45 f8 74 a3 80 	mov    QWORD PTR [rbp-0x8],0x80a374
  8067b3:	00 
  8067b4:	eb 1d                	jmp    8067d3 <hd_iterate+0x1d9>
            case 1:name="hd1";break;
  8067b6:	48 c7 45 f8 78 a3 80 	mov    QWORD PTR [rbp-0x8],0x80a378
  8067bd:	00 
  8067be:	eb 13                	jmp    8067d3 <hd_iterate+0x1d9>
            case 2:name="hd2";break;
  8067c0:	48 c7 45 f8 7c a3 80 	mov    QWORD PTR [rbp-0x8],0x80a37c
  8067c7:	00 
  8067c8:	eb 09                	jmp    8067d3 <hd_iterate+0x1d9>
            case 3:name="hd3";break;
  8067ca:	48 c7 45 f8 80 a3 80 	mov    QWORD PTR [rbp-0x8],0x80a380
  8067d1:	00 
  8067d2:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  8067d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8067d7:	48 89 c7             	mov    rdi,rax
  8067da:	e8 e1 c7 ff ff       	call   802fc0 <sys_find_dev>
  8067df:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  8067e2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8067e5:	89 c7                	mov    edi,eax
  8067e7:	e8 a8 ce ff ff       	call   803694 <get_dev>
  8067ec:	89 c7                	mov    edi,eax
  8067ee:	e8 f4 cd ff ff       	call   8035e7 <dispose_device>
    for(int i=0;i<4;i++)
  8067f3:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8067f7:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8067fb:	0f 8e 9c fe ff ff    	jle    80669d <hd_iterate+0xa3>
        }

    }
}
  806801:	c9                   	leave  
  806802:	c3                   	ret    

0000000000806803 <async_check_disk>:

int async_check_disk(int disk)
{
  806803:	f3 0f 1e fa          	endbr64 
  806807:	55                   	push   rbp
  806808:	48 89 e5             	mov    rbp,rsp
  80680b:	48 83 ec 20          	sub    rsp,0x20
  80680f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  806812:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  806818:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80681e:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806822:	74 06                	je     80682a <async_check_disk+0x27>
  806824:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806828:	75 06                	jne    806830 <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  80682a:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  806830:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806834:	74 06                	je     80683c <async_check_disk+0x39>
  806836:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80683a:	75 06                	jne    806842 <async_check_disk+0x3f>
        chkcmd=0xf0;
  80683c:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  806842:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806846:	83 c0 02             	add    eax,0x2
  806849:	0f b7 c0             	movzx  eax,ax
  80684c:	be 01 00 00 00       	mov    esi,0x1
  806851:	89 c7                	mov    edi,eax
  806853:	e8 38 e3 ff ff       	call   804b90 <outb>
    outb(disknr+3,0);
  806858:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80685c:	83 c0 03             	add    eax,0x3
  80685f:	0f b7 c0             	movzx  eax,ax
  806862:	be 00 00 00 00       	mov    esi,0x0
  806867:	89 c7                	mov    edi,eax
  806869:	e8 22 e3 ff ff       	call   804b90 <outb>
    outb(disknr+4,0);
  80686e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806872:	83 c0 04             	add    eax,0x4
  806875:	0f b7 c0             	movzx  eax,ax
  806878:	be 00 00 00 00       	mov    esi,0x0
  80687d:	89 c7                	mov    edi,eax
  80687f:	e8 0c e3 ff ff       	call   804b90 <outb>
    outb(disknr+5,0);
  806884:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806888:	83 c0 05             	add    eax,0x5
  80688b:	0f b7 c0             	movzx  eax,ax
  80688e:	be 00 00 00 00       	mov    esi,0x0
  806893:	89 c7                	mov    edi,eax
  806895:	e8 f6 e2 ff ff       	call   804b90 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  80689a:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  80689e:	0f b6 d0             	movzx  edx,al
  8068a1:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8068a5:	83 c0 06             	add    eax,0x6
  8068a8:	0f b7 c0             	movzx  eax,ax
  8068ab:	89 d6                	mov    esi,edx
  8068ad:	89 c7                	mov    edi,eax
  8068af:	e8 dc e2 ff ff       	call   804b90 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  8068b4:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8068b8:	83 c0 07             	add    eax,0x7
  8068bb:	0f b7 c0             	movzx  eax,ax
  8068be:	be 90 00 00 00       	mov    esi,0x90
  8068c3:	89 c7                	mov    edi,eax
  8068c5:	e8 c6 e2 ff ff       	call   804b90 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  8068ca:	b8 00 00 00 00       	mov    eax,0x0
}
  8068cf:	c9                   	leave  
  8068d0:	c3                   	ret    

00000000008068d1 <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  8068d1:	f3 0f 1e fa          	endbr64 
  8068d5:	55                   	push   rbp
  8068d6:	48 89 e5             	mov    rbp,rsp
  8068d9:	48 83 ec 18          	sub    rsp,0x18
  8068dd:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  8068e1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  8068e8:	eb 04                	jmp    8068ee <hd_do_req+0x1d>
  8068ea:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8068ee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8068f1:	48 98                	cdqe   
  8068f3:	8b 14 85 00 88 42 00 	mov    edx,DWORD PTR [rax*4+0x428800]
  8068fa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8068fe:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  806904:	39 c2                	cmp    edx,eax
  806906:	75 e2                	jne    8068ea <hd_do_req+0x19>
    switch (args->cmd)
  806908:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80690c:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  806912:	83 f8 04             	cmp    eax,0x4
  806915:	74 72                	je     806989 <hd_do_req+0xb8>
  806917:	83 f8 04             	cmp    eax,0x4
  80691a:	0f 8f 96 00 00 00    	jg     8069b6 <hd_do_req+0xe5>
  806920:	83 f8 02             	cmp    eax,0x2
  806923:	74 0a                	je     80692f <hd_do_req+0x5e>
  806925:	83 f8 03             	cmp    eax,0x3
  806928:	74 32                	je     80695c <hd_do_req+0x8b>
  80692a:	e9 87 00 00 00       	jmp    8069b6 <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  80692f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806933:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806936:	48 98                	cdqe   
  806938:	48 89 c6             	mov    rsi,rax
  80693b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80693f:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806942:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806946:	8b 10                	mov    edx,DWORD PTR [rax]
  806948:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80694b:	49 89 f0             	mov    r8,rsi
  80694e:	be 00 00 00 00       	mov    esi,0x0
  806953:	89 c7                	mov    edi,eax
  806955:	e8 09 f5 ff ff       	call   805e63 <request>
        break;
  80695a:	eb 61                	jmp    8069bd <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  80695c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806960:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806963:	48 98                	cdqe   
  806965:	48 89 c6             	mov    rsi,rax
  806968:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80696c:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80696f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806973:	8b 10                	mov    edx,DWORD PTR [rax]
  806975:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806978:	49 89 f0             	mov    r8,rsi
  80697b:	be 01 00 00 00       	mov    esi,0x1
  806980:	89 c7                	mov    edi,eax
  806982:	e8 dc f4 ff ff       	call   805e63 <request>
        break;
  806987:	eb 34                	jmp    8069bd <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  806989:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80698d:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806990:	48 98                	cdqe   
  806992:	48 89 c6             	mov    rsi,rax
  806995:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806999:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80699c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8069a0:	8b 10                	mov    edx,DWORD PTR [rax]
  8069a2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8069a5:	49 89 f0             	mov    r8,rsi
  8069a8:	be 02 00 00 00       	mov    esi,0x2
  8069ad:	89 c7                	mov    edi,eax
  8069af:	e8 af f4 ff ff       	call   805e63 <request>
        break;
  8069b4:	eb 07                	jmp    8069bd <hd_do_req+0xec>
    default:return -1;
  8069b6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8069bb:	eb 1e                	jmp    8069db <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  8069bd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8069c1:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  8069c8:	00 00 00 
    running_devman_req=args;
  8069cb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8069cf:	48 89 05 12 1e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21e12],rax        # 4287e8 <running_devman_req>
    return 0;
  8069d6:	b8 00 00 00 00       	mov    eax,0x0
  8069db:	c9                   	leave  
  8069dc:	c3                   	ret    
  8069dd:	0f 1f 00             	nop    DWORD PTR [rax]

00000000008069e0 <disk_int_handler>:
  8069e0:	e8 e8 e1 ff ff       	call   804bcd <eoi+0x4>
  8069e5:	e8 8e f2 ff ff       	call   805c78 <disk_int_handler_c+0x4>
  8069ea:	cf                   	iret   

00000000008069eb <read_disk_asm>:
  8069eb:	55                   	push   rbp
  8069ec:	89 e5                	mov    ebp,esp
  8069ee:	66 ba f7 01          	mov    dx,0x1f7
  8069f2:	31 c9                	xor    ecx,ecx
  8069f4:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
  8069f8:	8b 4c 24 0c          	mov    ecx,DWORD PTR [rsp+0xc]
  8069fc:	8b 5c 24 10          	mov    ebx,DWORD PTR [rsp+0x10]
  806a00:	89 c6                	mov    esi,eax
  806a02:	66 ba f2 01          	mov    dx,0x1f2
  806a06:	88 c8                	mov    al,cl
  806a08:	ee                   	out    dx,al
  806a09:	66 ba f3 01          	mov    dx,0x1f3
  806a0d:	89 f0                	mov    eax,esi
  806a0f:	ee                   	out    dx,al
  806a10:	66 42 c1 e8 08       	rex.X shr ax,0x8
  806a15:	ee                   	out    dx,al
  806a16:	66 42 c1 e8 08       	rex.X shr ax,0x8
  806a1b:	ee                   	out    dx,al
  806a1c:	66 42                	data16 rex.X
  806a1e:	66 c1 e8 08          	shr    ax,0x8
  806a22:	24 0f                	and    al,0xf
  806a24:	0c e0                	or     al,0xe0
  806a26:	ee                   	out    dx,al
  806a27:	66 42 b0 20          	data16 rex.X mov al,0x20
  806a2b:	ee                   	out    dx,al

0000000000806a2c <read_disk_asm.wait>:
  806a2c:	90                   	nop
  806a2d:	ec                   	in     al,dx
  806a2e:	24 88                	and    al,0x88
  806a30:	3c 08                	cmp    al,0x8
  806a32:	75 f8                	jne    806a2c <read_disk_asm.wait>
  806a34:	66 89 d7             	mov    di,dx
  806a37:	89 c8                	mov    eax,ecx
  806a39:	66 b9 00 01          	mov    cx,0x100
  806a3d:	66 f7 e1             	mul    cx
  806a40:	89 c1                	mov    ecx,eax
  806a42:	66 ba f0 01          	mov    dx,0x1f0

0000000000806a46 <read_disk_asm.read>:
  806a46:	66 ed                	in     ax,dx
  806a48:	66 89 03             	mov    WORD PTR [rbx],ax
  806a4b:	83 c3 02             	add    ebx,0x2
  806a4e:	e2 f6                	loop   806a46 <read_disk_asm.read>
  806a50:	c9                   	leave  
  806a51:	b8 00 00 00 00       	mov    eax,0x0
  806a56:	c3                   	ret    

0000000000806a57 <read_disk_asm.err_disk_reading>:
  806a57:	66 ba f1 01          	mov    dx,0x1f1
  806a5b:	31 c0                	xor    eax,eax
  806a5d:	66 ed                	in     ax,dx
  806a5f:	89 ec                	mov    esp,ebp
  806a61:	5d                   	pop    rbp
  806a62:	c3                   	ret    

0000000000806a63 <write_disk_asm>:
  806a63:	55                   	push   rbp
  806a64:	89 e5                	mov    ebp,esp
  806a66:	8b 44 24 08          	mov    eax,DWORD PTR [rsp+0x8]
  806a6a:	8b 4c 24 0c          	mov    ecx,DWORD PTR [rsp+0xc]
  806a6e:	8b 5c 24 10          	mov    ebx,DWORD PTR [rsp+0x10]
  806a72:	50                   	push   rax
  806a73:	66 ba f2 01          	mov    dx,0x1f2
  806a77:	88 c8                	mov    al,cl
  806a79:	ee                   	out    dx,al
  806a7a:	58                   	pop    rax
  806a7b:	66 ba f3 01          	mov    dx,0x1f3
  806a7f:	ee                   	out    dx,al
  806a80:	c1 e8 08             	shr    eax,0x8
  806a83:	66 ba f4 01          	mov    dx,0x1f4
  806a87:	ee                   	out    dx,al
  806a88:	c1 e8 08             	shr    eax,0x8
  806a8b:	66 ba f5 01          	mov    dx,0x1f5
  806a8f:	ee                   	out    dx,al
  806a90:	c1 e8 08             	shr    eax,0x8
  806a93:	24 0f                	and    al,0xf
  806a95:	0c e0                	or     al,0xe0
  806a97:	66 ba f6 01          	mov    dx,0x1f6
  806a9b:	ee                   	out    dx,al
  806a9c:	66 ba f7 01          	mov    dx,0x1f7
  806aa0:	b0 30                	mov    al,0x30
  806aa2:	ee                   	out    dx,al

0000000000806aa3 <write_disk_asm.not_ready2>:
  806aa3:	90                   	nop
  806aa4:	ec                   	in     al,dx
  806aa5:	24 88                	and    al,0x88
  806aa7:	3c 08                	cmp    al,0x8
  806aa9:	75 f8                	jne    806aa3 <write_disk_asm.not_ready2>
  806aab:	89 c8                	mov    eax,ecx
  806aad:	66 b9 00 01          	mov    cx,0x100
  806ab1:	66 f7 e1             	mul    cx
  806ab4:	89 c1                	mov    ecx,eax
  806ab6:	66 ba f0 01          	mov    dx,0x1f0

0000000000806aba <write_disk_asm.go_on_write>:
  806aba:	66 8b 03             	mov    ax,WORD PTR [rbx]
  806abd:	66 ef                	out    dx,ax
  806abf:	83 c3 02             	add    ebx,0x2
  806ac2:	e2 f6                	loop   806aba <write_disk_asm.go_on_write>
  806ac4:	89 ec                	mov    esp,ebp
  806ac6:	5d                   	pop    rbp
  806ac7:	c3                   	ret    

0000000000806ac8 <init_fat16>:

int fat16_drvi;
extern driver drv_disk;
extern int disk_drvi;
int init_fat16()
{
  806ac8:	f3 0f 1e fa          	endbr64 
  806acc:	55                   	push   rbp
  806acd:	48 89 e5             	mov    rbp,rsp
  806ad0:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
    reg_device(&fat16_dev);
  806ad7:	bf 40 a4 80 00       	mov    edi,0x80a440
  806adc:	e8 a7 c0 ff ff       	call   802b88 <reg_device>
    fat16_drvi=reg_driver(&fat16_drv);
  806ae1:	bf a0 a3 80 00       	mov    edi,0x80a3a0
  806ae6:	e8 85 c3 ff ff       	call   802e70 <reg_driver>
  806aeb:	89 05 93 9f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29f93],eax        # 430a84 <fat16_drvi>
    driver_args arg;
    load(&arg);//syscall(SYSCALL_CALL_DRVFUNC,fat16_drvi,DRVF_OPEN,&arg,0,0);
  806af1:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  806af8:	48 89 c7             	mov    rdi,rax
  806afb:	e8 26 00 00 00       	call   806b26 <load>
    reg_vol(disk_drvi,fat16_drvi,"a");
  806b00:	8b 0d 7e 9f c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc29f7e]        # 430a84 <fat16_drvi>
  806b06:	8b 05 e4 1c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21ce4]        # 4287f0 <disk_drvi>
  806b0c:	ba e8 a4 80 00       	mov    edx,0x80a4e8
  806b11:	89 ce                	mov    esi,ecx
  806b13:	89 c7                	mov    edi,eax
  806b15:	b8 00 00 00 00       	mov    eax,0x0
  806b1a:	e8 f1 af ff ff       	call   801b10 <reg_vol>
    return 0;
  806b1f:	b8 00 00 00 00       	mov    eax,0x0
}
  806b24:	c9                   	leave  
  806b25:	c3                   	ret    

0000000000806b26 <load>:
int load(driver_args *args)
{
  806b26:	f3 0f 1e fa          	endbr64 
  806b2a:	55                   	push   rbp
  806b2b:	48 89 e5             	mov    rbp,rsp
  806b2e:	48 83 ec 20          	sub    rsp,0x20
  806b32:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    //sys_read superblock
    int req_id=-1;
  806b36:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    read_sec(&superblock,0,1);
  806b3d:	ba 01 00 00 00       	mov    edx,0x1
  806b42:	be 00 00 00 00       	mov    esi,0x0
  806b47:	bf 20 88 42 00       	mov    edi,0x428820
  806b4c:	e8 61 0b 00 00       	call   8076b2 <read_sec>
    //只能一个一个读
    read_sec(fat,superblock.rsvdSec,superblock.secPerFAT);
  806b51:	0f b7 05 de 1c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21cde]        # 428836 <superblock+0x16>
  806b58:	0f b7 d0             	movzx  edx,ax
  806b5b:	0f b7 05 cc 1c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21ccc]        # 42882e <superblock+0xe>
  806b62:	0f b7 c0             	movzx  eax,ax
  806b65:	89 c6                	mov    esi,eax
  806b67:	bf 80 ca 42 00       	mov    edi,0x42ca80
  806b6c:	e8 41 0b 00 00       	call   8076b2 <read_sec>

    //sys_read root
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  806b71:	0f b7 05 b6 1c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21cb6]        # 42882e <superblock+0xe>
  806b78:	0f b7 c8             	movzx  ecx,ax
  806b7b:	0f b7 05 b4 1c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21cb4]        # 428836 <superblock+0x16>
  806b82:	0f b7 d0             	movzx  edx,ax
    superblock.numOfFAT;
  806b85:	0f b6 05 a4 1c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21ca4]        # 428830 <superblock+0x10>
  806b8c:	0f b6 c0             	movzx  eax,al
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  806b8f:	0f af c2             	imul   eax,edx
  806b92:	01 c8                	add    eax,ecx
  806b94:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //printf("root sec num:%d\n",root_sec_num);
    //usually a root dir has 32 secs
    int root_sec_c=((u32)superblock.rootEntries* sizeof(dir_entry))/(u32)superblock.bytesPerSec;
  806b97:	0f b7 05 93 1c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21c93]        # 428831 <superblock+0x11>
  806b9e:	0f b7 c0             	movzx  eax,ax
  806ba1:	48 c1 e0 05          	shl    rax,0x5
  806ba5:	0f b7 15 7f 1c c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc21c7f]        # 42882b <superblock+0xb>
  806bac:	0f b7 ca             	movzx  ecx,dx
  806baf:	ba 00 00 00 00       	mov    edx,0x0
  806bb4:	48 f7 f1             	div    rcx
  806bb7:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    read_sec(root_dir,root_sec_num,root_sec_c);
  806bba:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  806bbd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806bc0:	89 c6                	mov    esi,eax
  806bc2:	bf 60 88 42 00       	mov    edi,0x428860
  806bc7:	e8 e6 0a 00 00       	call   8076b2 <read_sec>

    cur_dir.fistCluNum=0;
  806bcc:	66 c7 05 a5 5c c2 ff 	mov    WORD PTR [rip+0xffffffffffc25ca5],0x0        # 42c87a <cur_dir+0x1a>
  806bd3:	00 00 

    //set some vars
    //why? because the .bss won't be packed into bin so any init
    //of global var in .c is meaningless.
    clu_sec_balance=superblock.rsvdSec+32+32-2;//63;
  806bd5:	0f b7 05 52 1c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21c52]        # 42882e <superblock+0xe>
  806bdc:	0f b7 c0             	movzx  eax,ax
  806bdf:	83 c0 3e             	add    eax,0x3e
  806be2:	89 05 98 2f 00 00    	mov    DWORD PTR [rip+0x2f98],eax        # 809b80 <clu_sec_balance>
    //printf("clu sec bal:%d\n",clu_sec_balance);
    dir_depth=0;
  806be8:	c7 05 8e 9e c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29e8e],0x0        # 430a80 <dir_depth>
  806bef:	00 00 00 
    return 0;
  806bf2:	b8 00 00 00 00       	mov    eax,0x0

}
  806bf7:	c9                   	leave  
  806bf8:	c3                   	ret    

0000000000806bf9 <verify_name>:

//检查输入的文件名长度是否合法，以及是否出现非法字符（但是不检查大小写和.）
//返回值为布尔值。
int verify_name(char *str)
{
  806bf9:	f3 0f 1e fa          	endbr64 
  806bfd:	55                   	push   rbp
  806bfe:	48 89 e5             	mov    rbp,rsp
  806c01:	48 83 ec 70          	sub    rsp,0x70
  806c05:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
    char valid_ch[]="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,/![]|+";
  806c09:	48 b8 61 62 63 64 65 	movabs rax,0x6867666564636261
  806c10:	66 67 68 
  806c13:	48 ba 69 6a 6b 6c 6d 	movabs rdx,0x706f6e6d6c6b6a69
  806c1a:	6e 6f 70 
  806c1d:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  806c21:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  806c25:	48 b8 71 72 73 74 75 	movabs rax,0x7877767574737271
  806c2c:	76 77 78 
  806c2f:	48 ba 79 7a 41 42 43 	movabs rdx,0x4645444342417a79
  806c36:	44 45 46 
  806c39:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  806c3d:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  806c41:	48 b8 47 48 49 4a 4b 	movabs rax,0x4e4d4c4b4a494847
  806c48:	4c 4d 4e 
  806c4b:	48 ba 4f 50 51 52 53 	movabs rdx,0x565554535251504f
  806c52:	54 55 56 
  806c55:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  806c59:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  806c5d:	48 b8 57 58 59 5a 30 	movabs rax,0x333231305a595857
  806c64:	31 32 33 
  806c67:	48 ba 34 35 36 37 38 	movabs rdx,0x2f2c393837363534
  806c6e:	39 2c 2f 
  806c71:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  806c75:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  806c79:	c7 45 e0 21 5b 5d 7c 	mov    DWORD PTR [rbp-0x20],0x7c5d5b21
  806c80:	66 c7 45 e4 2b 00    	mov    WORD PTR [rbp-0x1c],0x2b
    if(strlen(str)>11||strlen(str)==0) {
  806c86:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806c8a:	48 89 c7             	mov    rdi,rax
  806c8d:	e8 97 26 00 00       	call   809329 <strlen>
  806c92:	83 f8 0b             	cmp    eax,0xb
  806c95:	7f 10                	jg     806ca7 <verify_name+0xae>
  806c97:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806c9b:	48 89 c7             	mov    rdi,rax
  806c9e:	e8 86 26 00 00       	call   809329 <strlen>
  806ca3:	85 c0                	test   eax,eax
  806ca5:	75 0a                	jne    806cb1 <verify_name+0xb8>
        //printf("length not valid\n");
        return 0;
  806ca7:	b8 00 00 00 00       	mov    eax,0x0
  806cac:	e9 b3 01 00 00       	jmp    806e64 <verify_name+0x26b>
    }
    int c=0,i=0,flag=0,vchf=1;
  806cb1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806cb8:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806cbf:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806cc6:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [rbp-0x18],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  806ccd:	eb 6b                	jmp    806d3a <verify_name+0x141>
    {
        int j=0;
  806ccf:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        for(;j<sizeof(valid_ch);j++)
  806cd6:	eb 22                	jmp    806cfa <verify_name+0x101>
            if(str[i]==valid_ch[j])break;
  806cd8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806cdb:	48 63 d0             	movsxd rdx,eax
  806cde:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806ce2:	48 01 d0             	add    rax,rdx
  806ce5:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806ce8:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806ceb:	48 98                	cdqe   
  806ced:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  806cf2:	38 c2                	cmp    dl,al
  806cf4:	74 0e                	je     806d04 <verify_name+0x10b>
        for(;j<sizeof(valid_ch);j++)
  806cf6:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  806cfa:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806cfd:	83 f8 45             	cmp    eax,0x45
  806d00:	76 d6                	jbe    806cd8 <verify_name+0xdf>
  806d02:	eb 01                	jmp    806d05 <verify_name+0x10c>
            if(str[i]==valid_ch[j])break;
  806d04:	90                   	nop
        if(j>=sizeof(valid_ch))
  806d05:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806d08:	83 f8 45             	cmp    eax,0x45
  806d0b:	76 0a                	jbe    806d17 <verify_name+0x11e>
        {
            //printf("invalid char\n");
            return 0;//出现非法字符
  806d0d:	b8 00 00 00 00       	mov    eax,0x0
  806d12:	e9 4d 01 00 00       	jmp    806e64 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  806d17:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806d1a:	48 63 d0             	movsxd rdx,eax
  806d1d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806d21:	48 01 d0             	add    rax,rdx
  806d24:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806d27:	3c 20                	cmp    al,0x20
  806d29:	74 07                	je     806d32 <verify_name+0x139>
  806d2b:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        c++;
  806d32:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  806d36:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806d3a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806d3d:	48 63 d0             	movsxd rdx,eax
  806d40:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806d44:	48 01 d0             	add    rax,rdx
  806d47:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806d4a:	3c 2e                	cmp    al,0x2e
  806d4c:	74 18                	je     806d66 <verify_name+0x16d>
  806d4e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806d51:	48 63 d0             	movsxd rdx,eax
  806d54:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806d58:	48 01 d0             	add    rax,rdx
  806d5b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806d5e:	84 c0                	test   al,al
  806d60:	0f 85 69 ff ff ff    	jne    806ccf <verify_name+0xd6>
    }
    if(c>8||flag==0){
  806d66:	83 7d fc 08          	cmp    DWORD PTR [rbp-0x4],0x8
  806d6a:	7f 06                	jg     806d72 <verify_name+0x179>
  806d6c:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  806d70:	75 0a                	jne    806d7c <verify_name+0x183>
        //printf("file name blank\n");
        return 0;//不能全是空格
  806d72:	b8 00 00 00 00       	mov    eax,0x0
  806d77:	e9 e8 00 00 00       	jmp    806e64 <verify_name+0x26b>
    }
    if(str[i]=='\0')//没有扩展名
  806d7c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806d7f:	48 63 d0             	movsxd rdx,eax
  806d82:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806d86:	48 01 d0             	add    rax,rdx
  806d89:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806d8c:	84 c0                	test   al,al
  806d8e:	75 0a                	jne    806d9a <verify_name+0x1a1>
        return 1;
  806d90:	b8 01 00 00 00       	mov    eax,0x1
  806d95:	e9 ca 00 00 00       	jmp    806e64 <verify_name+0x26b>
    c=0;
  806d9a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    flag=0;
  806da1:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(i++;str[i]!='\0';i++)
  806da8:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806dac:	e9 83 00 00 00       	jmp    806e34 <verify_name+0x23b>
    {
        int j=0;
  806db1:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
        for(;j<sizeof(valid_ch);j++)
  806db8:	eb 22                	jmp    806ddc <verify_name+0x1e3>
            if(str[i]==valid_ch[j])break;
  806dba:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806dbd:	48 63 d0             	movsxd rdx,eax
  806dc0:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806dc4:	48 01 d0             	add    rax,rdx
  806dc7:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806dca:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806dcd:	48 98                	cdqe   
  806dcf:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  806dd4:	38 c2                	cmp    dl,al
  806dd6:	74 0e                	je     806de6 <verify_name+0x1ed>
        for(;j<sizeof(valid_ch);j++)
  806dd8:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806ddc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806ddf:	83 f8 45             	cmp    eax,0x45
  806de2:	76 d6                	jbe    806dba <verify_name+0x1c1>
  806de4:	eb 01                	jmp    806de7 <verify_name+0x1ee>
            if(str[i]==valid_ch[j])break;
  806de6:	90                   	nop
        if(j>=sizeof(valid_ch)){
  806de7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806dea:	83 f8 45             	cmp    eax,0x45
  806ded:	76 07                	jbe    806df6 <verify_name+0x1fd>
            //printf("invalid char:%x\n",str[i]);
            return 0;//出现非法字符
  806def:	b8 00 00 00 00       	mov    eax,0x0
  806df4:	eb 6e                	jmp    806e64 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  806df6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806df9:	48 63 d0             	movsxd rdx,eax
  806dfc:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806e00:	48 01 d0             	add    rax,rdx
  806e03:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806e06:	3c 20                	cmp    al,0x20
  806e08:	74 07                	je     806e11 <verify_name+0x218>
  806e0a:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        if(str[i]=='.'){
  806e11:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806e14:	48 63 d0             	movsxd rdx,eax
  806e17:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806e1b:	48 01 d0             	add    rax,rdx
  806e1e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806e21:	3c 2e                	cmp    al,0x2e
  806e23:	75 07                	jne    806e2c <verify_name+0x233>
            //printf("multiple dots.");
            return 0;//不能多次出现.
  806e25:	b8 00 00 00 00       	mov    eax,0x0
  806e2a:	eb 38                	jmp    806e64 <verify_name+0x26b>
        }
        c++;
  806e2c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(i++;str[i]!='\0';i++)
  806e30:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806e34:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806e37:	48 63 d0             	movsxd rdx,eax
  806e3a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806e3e:	48 01 d0             	add    rax,rdx
  806e41:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806e44:	84 c0                	test   al,al
  806e46:	0f 85 65 ff ff ff    	jne    806db1 <verify_name+0x1b8>
    }
    if(c>3||flag==0){
  806e4c:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  806e50:	7f 06                	jg     806e58 <verify_name+0x25f>
  806e52:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  806e56:	75 07                	jne    806e5f <verify_name+0x266>
        //printf("file name blank\n");
        return 0;//不能全是空格
  806e58:	b8 00 00 00 00       	mov    eax,0x0
  806e5d:	eb 05                	jmp    806e64 <verify_name+0x26b>
    }
    return 1;
  806e5f:	b8 01 00 00 00       	mov    eax,0x1
}
  806e64:	c9                   	leave  
  806e65:	c3                   	ret    

0000000000806e66 <format_name>:
//将“aaa.bb”的文件名形式转换为可以直接strcmp(,,11)的形式。
//默认文件名合法，请先检查文件名再使用。
void format_name(char *str)
{
  806e66:	f3 0f 1e fa          	endbr64 
  806e6a:	55                   	push   rbp
  806e6b:	48 89 e5             	mov    rbp,rsp
  806e6e:	48 83 ec 30          	sub    rsp,0x30
  806e72:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char v[12]="           ";
  806e76:	48 b8 20 20 20 20 20 	movabs rax,0x2020202020202020
  806e7d:	20 20 20 
  806e80:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  806e84:	c7 45 f0 20 20 20 00 	mov    DWORD PTR [rbp-0x10],0x202020
    int ptr=0;
  806e8b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    int namelen=0;
  806e92:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    for(int i=0;str[i]!='\0';i++)
  806e99:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806ea0:	e9 9b 00 00 00       	jmp    806f40 <format_name+0xda>
    {
        if(str[i]>='a'&&str[i]<='z')
  806ea5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806ea8:	48 63 d0             	movsxd rdx,eax
  806eab:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806eaf:	48 01 d0             	add    rax,rdx
  806eb2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806eb5:	3c 60                	cmp    al,0x60
  806eb7:	7e 3e                	jle    806ef7 <format_name+0x91>
  806eb9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806ebc:	48 63 d0             	movsxd rdx,eax
  806ebf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806ec3:	48 01 d0             	add    rax,rdx
  806ec6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806ec9:	3c 7a                	cmp    al,0x7a
  806ecb:	7f 2a                	jg     806ef7 <format_name+0x91>
        {
            v[ptr++]=str[i]-'a'+'A';
  806ecd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806ed0:	48 63 d0             	movsxd rdx,eax
  806ed3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806ed7:	48 01 d0             	add    rax,rdx
  806eda:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806edd:	8d 48 e0             	lea    ecx,[rax-0x20]
  806ee0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806ee3:	8d 50 01             	lea    edx,[rax+0x1]
  806ee6:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  806ee9:	89 ca                	mov    edx,ecx
  806eeb:	48 98                	cdqe   
  806eed:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  806ef1:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806ef5:	eb 45                	jmp    806f3c <format_name+0xd6>
        }
        else if(str[i]=='.')
  806ef7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806efa:	48 63 d0             	movsxd rdx,eax
  806efd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806f01:	48 01 d0             	add    rax,rdx
  806f04:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806f07:	3c 2e                	cmp    al,0x2e
  806f09:	75 0d                	jne    806f18 <format_name+0xb2>
        {
            ptr+=(8-namelen);
  806f0b:	b8 08 00 00 00       	mov    eax,0x8
  806f10:	2b 45 f8             	sub    eax,DWORD PTR [rbp-0x8]
  806f13:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
  806f16:	eb 24                	jmp    806f3c <format_name+0xd6>
        }else
        {
            v[ptr++]=str[i];
  806f18:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806f1b:	48 63 d0             	movsxd rdx,eax
  806f1e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806f22:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  806f26:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806f29:	8d 50 01             	lea    edx,[rax+0x1]
  806f2c:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  806f2f:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
  806f32:	48 98                	cdqe   
  806f34:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  806f38:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
    for(int i=0;str[i]!='\0';i++)
  806f3c:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  806f40:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806f43:	48 63 d0             	movsxd rdx,eax
  806f46:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806f4a:	48 01 d0             	add    rax,rdx
  806f4d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806f50:	84 c0                	test   al,al
  806f52:	0f 85 4d ff ff ff    	jne    806ea5 <format_name+0x3f>
        }
    }
    v[12]='\0';
  806f58:	c6 45 f4 00          	mov    BYTE PTR [rbp-0xc],0x0
    strcpy(str,v);
  806f5c:	48 8d 55 e8          	lea    rdx,[rbp-0x18]
  806f60:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806f64:	48 89 d6             	mov    rsi,rdx
  806f67:	48 89 c7             	mov    rdi,rax
  806f6a:	e8 9b 21 00 00       	call   80910a <strcpy>
}
  806f6f:	90                   	nop
  806f70:	c9                   	leave  
  806f71:	c3                   	ret    

0000000000806f72 <req_cluster>:
int req_cluster()
{
  806f72:	f3 0f 1e fa          	endbr64 
  806f76:	55                   	push   rbp
  806f77:	48 89 e5             	mov    rbp,rsp
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  806f7a:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [rbp-0x4],0x3
  806f81:	eb 2a                	jmp    806fad <req_cluster+0x3b>
    {
        if(fat[i]==0)
  806f83:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806f86:	48 98                	cdqe   
  806f88:	0f b7 84 00 80 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42ca80]
  806f8f:	00 
  806f90:	66 85 c0             	test   ax,ax
  806f93:	75 14                	jne    806fa9 <req_cluster+0x37>
        {
            fat[i]=0xffff;
  806f95:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806f98:	48 98                	cdqe   
  806f9a:	66 c7 84 00 80 ca 42 	mov    WORD PTR [rax+rax*1+0x42ca80],0xffff
  806fa1:	00 ff ff 
            return i;
  806fa4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806fa7:	eb 13                	jmp    806fbc <req_cluster+0x4a>
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  806fa9:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806fad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806fb0:	3d ff 1f 00 00       	cmp    eax,0x1fff
  806fb5:	76 cc                	jbe    806f83 <req_cluster+0x11>
        }
    }
    return -1;
  806fb7:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  806fbc:	5d                   	pop    rbp
  806fbd:	c3                   	ret    

0000000000806fbe <write_sec>:
int write_sec(char *src, int sec_num, int sec_c)
{
  806fbe:	f3 0f 1e fa          	endbr64 
  806fc2:	55                   	push   rbp
  806fc3:	48 89 e5             	mov    rbp,rsp
  806fc6:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
  806fcd:	48 89 bd 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rdi
  806fd4:	89 b5 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],esi
  806fda:	89 95 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],edx
    driver_args arg={
  806fe0:	48 8d 95 40 ff ff ff 	lea    rdx,[rbp-0xc0]
  806fe7:	b8 00 00 00 00       	mov    eax,0x0
  806fec:	b9 18 00 00 00       	mov    ecx,0x18
  806ff1:	48 89 d7             	mov    rdi,rdx
  806ff4:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  806ff7:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  806ffe:	89 85 48 ff ff ff    	mov    DWORD PTR [rbp-0xb8],eax
  807004:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  80700a:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
  807010:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  807016:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            .src_addr=src,
            .sec_n=sec_num,
            .sec_c=sec_c
    };
    return drv_disk.read(&arg);
  80701c:	48 8b 15 d5 2a 00 00 	mov    rdx,QWORD PTR [rip+0x2ad5]        # 809af8 <drv_disk+0x18>
  807023:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  80702a:	48 89 c7             	mov    rdi,rax
  80702d:	ff d2                	call   rdx
}
  80702f:	c9                   	leave  
  807030:	c3                   	ret    

0000000000807031 <set_attr>:
void set_attr(dir_entry *f,char attr)
{
  807031:	f3 0f 1e fa          	endbr64 
  807035:	55                   	push   rbp
  807036:	48 89 e5             	mov    rbp,rsp
  807039:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80703d:	89 f0                	mov    eax,esi
  80703f:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    f->attr|=attr;
  807042:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807046:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  80704a:	0a 45 f4             	or     al,BYTE PTR [rbp-0xc]
  80704d:	89 c2                	mov    edx,eax
  80704f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807053:	88 50 0b             	mov    BYTE PTR [rax+0xb],dl
}
  807056:	90                   	nop
  807057:	5d                   	pop    rbp
  807058:	c3                   	ret    

0000000000807059 <update_fat_and_root>:
mkdir
touch
rm
*/
void update_fat_and_root()
{
  807059:	f3 0f 1e fa          	endbr64 
  80705d:	55                   	push   rbp
  80705e:	48 89 e5             	mov    rbp,rsp
  807061:	48 83 ec 10          	sub    rsp,0x10
    int root_loc=superblock.rsvdSec+\
  807065:	0f b7 05 c2 17 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc217c2]        # 42882e <superblock+0xe>
  80706c:	0f b7 c8             	movzx  ecx,ax
    superblock.secPerFAT*superblock.numOfFAT;
  80706f:	0f b7 05 c0 17 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc217c0]        # 428836 <superblock+0x16>
  807076:	0f b7 d0             	movzx  edx,ax
  807079:	0f b6 05 b0 17 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc217b0]        # 428830 <superblock+0x10>
  807080:	0f b6 c0             	movzx  eax,al
  807083:	0f af c2             	imul   eax,edx
    int root_loc=superblock.rsvdSec+\
  807086:	01 c8                	add    eax,ecx
  807088:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("root_loc:0x%x\n",root_loc);
    write_sec(root_dir,root_loc,sizeof(root_dir));
  80708b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80708e:	ba 00 40 00 00       	mov    edx,0x4000
  807093:	89 c6                	mov    esi,eax
  807095:	bf 60 88 42 00       	mov    edi,0x428860
  80709a:	e8 1f ff ff ff       	call   806fbe <write_sec>
    //printf("updated root\n");
    write_sec(fat,superblock.rsvdSec,sizeof(fat));
  80709f:	0f b7 05 88 17 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21788]        # 42882e <superblock+0xe>
  8070a6:	0f b7 c0             	movzx  eax,ax
  8070a9:	ba 00 40 00 00       	mov    edx,0x4000
  8070ae:	89 c6                	mov    esi,eax
  8070b0:	bf 80 ca 42 00       	mov    edi,0x42ca80
  8070b5:	e8 04 ff ff ff       	call   806fbe <write_sec>
    //printf("updated fat\n");

}
  8070ba:	90                   	nop
  8070bb:	c9                   	leave  
  8070bc:	c3                   	ret    

00000000008070bd <add_dot_and_ddot_dir>:
void add_dot_and_ddot_dir(dir_entry dir)
{
  8070bd:	f3 0f 1e fa          	endbr64 
  8070c1:	55                   	push   rbp
  8070c2:	48 89 e5             	mov    rbp,rsp
  8070c5:	48 83 ec 10          	sub    rsp,0x10
    //it must be a regular dir to add. and ..
    //and this must be done when the dir is created
    //regular dir
    int cluster = dir.fistCluNum;
  8070c9:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  8070cd:	0f b7 c0             	movzx  eax,ax
  8070d0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
    superblock.secPerClu);
  8070d3:	0f b6 05 53 17 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21753]        # 42882d <superblock+0xd>
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  8070da:	0f b6 c0             	movzx  eax,al
  8070dd:	8b 0d 9d 2a 00 00    	mov    ecx,DWORD PTR [rip+0x2a9d]        # 809b80 <clu_sec_balance>
  8070e3:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8070e6:	01 d1                	add    ecx,edx
  8070e8:	89 c2                	mov    edx,eax
  8070ea:	89 ce                	mov    esi,ecx
  8070ec:	bf 80 c8 42 00       	mov    edi,0x42c880
  8070f1:	e8 bc 05 00 00       	call   8076b2 <read_sec>
    //.
    strcpy(a_clu_of_dir[0].name,".       ");
  8070f6:	be ea a4 80 00       	mov    esi,0x80a4ea
  8070fb:	bf 80 c8 42 00       	mov    edi,0x42c880
  807100:	e8 05 20 00 00       	call   80910a <strcpy>
    strcpy(a_clu_of_dir[0].extension,"   ");
  807105:	be f3 a4 80 00       	mov    esi,0x80a4f3
  80710a:	bf 88 c8 42 00       	mov    edi,0x42c888
  80710f:	e8 f6 1f 00 00       	call   80910a <strcpy>
    a_clu_of_dir[0].fistCluNum=dir.fistCluNum;
  807114:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  807118:	66 89 05 7b 57 c2 ff 	mov    WORD PTR [rip+0xffffffffffc2577b],ax        # 42c89a <a_clu_of_dir+0x1a>
    a_clu_of_dir[0].len=0;
  80711f:	c7 05 73 57 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc25773],0x0        # 42c89c <a_clu_of_dir+0x1c>
  807126:	00 00 00 
    set_attr(&a_clu_of_dir[0],ATTR_DIR);
  807129:	be 10 00 00 00       	mov    esi,0x10
  80712e:	bf 80 c8 42 00       	mov    edi,0x42c880
  807133:	e8 f9 fe ff ff       	call   807031 <set_attr>
    //..
    strcpy(a_clu_of_dir[1].name,"..      ");
  807138:	be f7 a4 80 00       	mov    esi,0x80a4f7
  80713d:	bf a0 c8 42 00       	mov    edi,0x42c8a0
  807142:	e8 c3 1f 00 00       	call   80910a <strcpy>
    strcpy(a_clu_of_dir[1].extension,"   ");
  807147:	be f3 a4 80 00       	mov    esi,0x80a4f3
  80714c:	bf a8 c8 42 00       	mov    edi,0x42c8a8
  807151:	e8 b4 1f 00 00       	call   80910a <strcpy>
    a_clu_of_dir[1].fistCluNum=cur_dir.fistCluNum;
  807156:	0f b7 05 1d 57 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2571d]        # 42c87a <cur_dir+0x1a>
  80715d:	66 89 05 56 57 c2 ff 	mov    WORD PTR [rip+0xffffffffffc25756],ax        # 42c8ba <a_clu_of_dir+0x3a>
    a_clu_of_dir[1].len=0;
  807164:	c7 05 4e 57 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2574e],0x0        # 42c8bc <a_clu_of_dir+0x3c>
  80716b:	00 00 00 
    set_attr(&a_clu_of_dir[1],ATTR_DIR);
  80716e:	be 10 00 00 00       	mov    esi,0x10
  807173:	bf a0 c8 42 00       	mov    edi,0x42c8a0
  807178:	e8 b4 fe ff ff       	call   807031 <set_attr>
    //update the dir
    int dir_loc=cluster+clu_sec_balance;
  80717d:	8b 15 fd 29 00 00    	mov    edx,DWORD PTR [rip+0x29fd]        # 809b80 <clu_sec_balance>
  807183:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807186:	01 d0                	add    eax,edx
  807188:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  80718b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80718e:	ba 00 02 00 00       	mov    edx,0x200
  807193:	89 c6                	mov    esi,eax
  807195:	bf 80 c8 42 00       	mov    edi,0x42c880
  80719a:	e8 1f fe ff ff       	call   806fbe <write_sec>
    //no need to update fat and root
}
  80719f:	90                   	nop
  8071a0:	c9                   	leave  
  8071a1:	c3                   	ret    

00000000008071a2 <translate_attr>:
void translate_attr(char attr,char *attr_s)
{
  8071a2:	f3 0f 1e fa          	endbr64 
  8071a6:	55                   	push   rbp
  8071a7:	48 89 e5             	mov    rbp,rsp
  8071aa:	89 f8                	mov    eax,edi
  8071ac:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8071b0:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    //rwhds (s: system h:hidden)
    int v=attr&1;
  8071b3:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  8071b7:	83 e0 01             	and    eax,0x1
  8071ba:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//sys_read-only
  8071bd:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8071c1:	74 0b                	je     8071ce <translate_attr+0x2c>
        attr_s[1]='-';
  8071c3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8071c7:	48 83 c0 01          	add    rax,0x1
  8071cb:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
    v=attr&2;
  8071ce:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  8071d2:	83 e0 02             	and    eax,0x2
  8071d5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//hidden
  8071d8:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8071dc:	74 0b                	je     8071e9 <translate_attr+0x47>
        attr_s[2]='h';
  8071de:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8071e2:	48 83 c0 02          	add    rax,0x2
  8071e6:	c6 00 68             	mov    BYTE PTR [rax],0x68
    v=attr&4;
  8071e9:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  8071ed:	83 e0 04             	and    eax,0x4
  8071f0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//system
  8071f3:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8071f7:	74 0b                	je     807204 <translate_attr+0x62>
        attr_s[4]='s';
  8071f9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8071fd:	48 83 c0 04          	add    rax,0x4
  807201:	c6 00 73             	mov    BYTE PTR [rax],0x73
    v=attr&8;
  807204:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807208:	83 e0 08             	and    eax,0x8
  80720b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//volume label
  80720e:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807212:	74 0b                	je     80721f <translate_attr+0x7d>
        attr_s[3]='v';
  807214:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807218:	48 83 c0 03          	add    rax,0x3
  80721c:	c6 00 76             	mov    BYTE PTR [rax],0x76
    v=attr&16;
  80721f:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807223:	83 e0 10             	and    eax,0x10
  807226:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//dir
  807229:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80722d:	74 0b                	je     80723a <translate_attr+0x98>
        attr_s[3]='d';
  80722f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807233:	48 83 c0 03          	add    rax,0x3
  807237:	c6 00 64             	mov    BYTE PTR [rax],0x64
    //archive: do nothing
    attr_s[5]='\0';
  80723a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80723e:	48 83 c0 05          	add    rax,0x5
  807242:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  807245:	90                   	nop
  807246:	5d                   	pop    rbp
  807247:	c3                   	ret    

0000000000807248 <extend_cluster>:
int extend_cluster(short cluster)
{
  807248:	f3 0f 1e fa          	endbr64 
  80724c:	55                   	push   rbp
  80724d:	48 89 e5             	mov    rbp,rsp
  807250:	48 83 ec 18          	sub    rsp,0x18
  807254:	89 f8                	mov    eax,edi
  807256:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    int new_clu=req_cluster();
  80725a:	b8 00 00 00 00       	mov    eax,0x0
  80725f:	e8 0e fd ff ff       	call   806f72 <req_cluster>
  807264:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(new_clu==-1)
  807267:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  80726b:	75 07                	jne    807274 <extend_cluster+0x2c>
        return -1;
  80726d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807272:	eb 16                	jmp    80728a <extend_cluster+0x42>
    fat[cluster]=new_clu;
  807274:	0f bf 45 ec          	movsx  eax,WORD PTR [rbp-0x14]
  807278:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80727b:	48 98                	cdqe   
  80727d:	66 89 94 00 80 ca 42 	mov    WORD PTR [rax+rax*1+0x42ca80],dx
  807284:	00 
    return 0;
  807285:	b8 00 00 00 00       	mov    eax,0x0
}
  80728a:	c9                   	leave  
  80728b:	c3                   	ret    

000000000080728c <touch>:
得出的结果换算成16进制填入即可。也就是：38H字节0~4位是日期数；38H字节5~7位和39H字节0位是月份；
39H字节的1~7位为年号，原定义中0~119分别代表1980~2099，目前高版本的Windows允许取0~127，
即年号最大可以到2107年。
*/
int touch(driver_args *arg)
{
  80728c:	f3 0f 1e fa          	endbr64 
  807290:	55                   	push   rbp
  807291:	48 89 e5             	mov    rbp,rsp
  807294:	48 83 ec 60          	sub    rsp,0x60
  807298:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    char *name=arg->path;
  80729c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8072a0:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8072a4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  8072a8:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8072ac:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8072af:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    //default set to 512
    int max_files=16;
  8072b3:	c7 45 ec 10 00 00 00 	mov    DWORD PTR [rbp-0x14],0x10
    dir_entry *dir_table=a_clu_of_dir;
  8072ba:	48 c7 45 e0 80 c8 42 	mov    QWORD PTR [rbp-0x20],0x42c880
  8072c1:	00 
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  8072c2:	0f b6 05 64 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21564]        # 42882d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  8072c9:	0f b6 c0             	movzx  eax,al
  8072cc:	0f b7 55 ca          	movzx  edx,WORD PTR [rbp-0x36]
  8072d0:	0f b7 ca             	movzx  ecx,dx
  8072d3:	8b 15 a7 28 00 00    	mov    edx,DWORD PTR [rip+0x28a7]        # 809b80 <clu_sec_balance>
  8072d9:	01 d1                	add    ecx,edx
  8072db:	89 c2                	mov    edx,eax
  8072dd:	89 ce                	mov    esi,ecx
  8072df:	bf 80 c8 42 00       	mov    edi,0x42c880
  8072e4:	e8 c9 03 00 00       	call   8076b2 <read_sec>
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  8072e9:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  8072ed:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do{
        for(int i=0;i<max_files;i++)
  8072f1:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8072f8:	e9 2e 01 00 00       	jmp    80742b <touch+0x19f>
        {
            //printf("%s\n",dir_table[i].name);
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  8072fd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807300:	48 98                	cdqe   
  807302:	48 c1 e0 05          	shl    rax,0x5
  807306:	48 89 c2             	mov    rdx,rax
  807309:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80730d:	48 01 d0             	add    rax,rdx
  807310:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807313:	3c e5                	cmp    al,0xe5
  807315:	74 1e                	je     807335 <touch+0xa9>
            dir_table[i].name[0]==0)
  807317:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80731a:	48 98                	cdqe   
  80731c:	48 c1 e0 05          	shl    rax,0x5
  807320:	48 89 c2             	mov    rdx,rax
  807323:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807327:	48 01 d0             	add    rax,rdx
  80732a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  80732d:	84 c0                	test   al,al
  80732f:	0f 85 f2 00 00 00    	jne    807427 <touch+0x19b>
            {
                //available
                //put name
                format_name(name);
  807335:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807339:	48 89 c7             	mov    rdi,rax
  80733c:	e8 25 fb ff ff       	call   806e66 <format_name>
                memcpy(dir_table[i].name,name,11);
  807341:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807344:	48 98                	cdqe   
  807346:	48 c1 e0 05          	shl    rax,0x5
  80734a:	48 89 c2             	mov    rdx,rax
  80734d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807351:	48 01 d0             	add    rax,rdx
  807354:	48 89 c1             	mov    rcx,rax
  807357:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80735b:	ba 0b 00 00 00       	mov    edx,0xb
  807360:	48 89 c6             	mov    rsi,rax
  807363:	48 89 cf             	mov    rdi,rcx
  807366:	e8 a1 1c 00 00       	call   80900c <memcpy>
                int clu=req_cluster();
  80736b:	b8 00 00 00 00       	mov    eax,0x0
  807370:	e8 fd fb ff ff       	call   806f72 <req_cluster>
  807375:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
                if(clu==-1)
  807378:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  80737c:	75 0a                	jne    807388 <touch+0xfc>
                {
                    //puts("err: full disk");
                    return -1;
  80737e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807383:	e9 fc 00 00 00       	jmp    807484 <touch+0x1f8>
                }
                dir_table[i].fistCluNum=clu;
  807388:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80738b:	48 98                	cdqe   
  80738d:	48 c1 e0 05          	shl    rax,0x5
  807391:	48 89 c2             	mov    rdx,rax
  807394:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807398:	48 01 d0             	add    rax,rdx
  80739b:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80739e:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
                set_attr(&dir_table[i],ATTR_ARCHIVE);
  8073a2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8073a5:	48 98                	cdqe   
  8073a7:	48 c1 e0 05          	shl    rax,0x5
  8073ab:	48 89 c2             	mov    rdx,rax
  8073ae:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8073b2:	48 01 d0             	add    rax,rdx
  8073b5:	be 20 00 00 00       	mov    esi,0x20
  8073ba:	48 89 c7             	mov    rdi,rax
  8073bd:	e8 6f fc ff ff       	call   807031 <set_attr>
                dir_table[i].len=superblock.bytesPerSec*superblock.secPerClu;
  8073c2:	0f b7 05 62 14 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21462]        # 42882b <superblock+0xb>
  8073c9:	0f b7 d0             	movzx  edx,ax
  8073cc:	0f b6 05 5a 14 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2145a]        # 42882d <superblock+0xd>
  8073d3:	0f b6 c0             	movzx  eax,al
  8073d6:	0f af d0             	imul   edx,eax
  8073d9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8073dc:	48 98                	cdqe   
  8073de:	48 c1 e0 05          	shl    rax,0x5
  8073e2:	48 89 c1             	mov    rcx,rax
  8073e5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8073e9:	48 01 c8             	add    rax,rcx
  8073ec:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
                //date and time
                //dir_table[i].lastModfDate=get_date_stab();
                //dir_table[i].lastModfTime=get_time_stab();
                //update
                write_sec(dir_table,cluster+clu_sec_balance,\
                superblock.bytesPerSec*superblock.secPerClu);
  8073ef:	0f b7 05 35 14 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21435]        # 42882b <superblock+0xb>
  8073f6:	0f b7 d0             	movzx  edx,ax
  8073f9:	0f b6 05 2d 14 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2142d]        # 42882d <superblock+0xd>
  807400:	0f b6 c0             	movzx  eax,al
                write_sec(dir_table,cluster+clu_sec_balance,\
  807403:	0f af d0             	imul   edx,eax
  807406:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  80740a:	8b 05 70 27 00 00    	mov    eax,DWORD PTR [rip+0x2770]        # 809b80 <clu_sec_balance>
  807410:	01 c1                	add    ecx,eax
  807412:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807416:	89 ce                	mov    esi,ecx
  807418:	48 89 c7             	mov    rdi,rax
  80741b:	e8 9e fb ff ff       	call   806fbe <write_sec>
                return -1;
  807420:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807425:	eb 5d                	jmp    807484 <touch+0x1f8>
        for(int i=0;i<max_files;i++)
  807427:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80742b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80742e:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
  807431:	0f 8c c6 fe ff ff    	jl     8072fd <touch+0x71>
        if(fat[cluster]>=FAT_EOF&&extend_cluster(cluster)==-1)
        {
            //extend fail
            //puts("err:full disk");
            return -1;
        }else if(cluster<FAT_EOF)
  807437:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  80743c:	77 36                	ja     807474 <touch+0x1e8>
        {
            cluster=fat[cluster];
  80743e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807442:	48 98                	cdqe   
  807444:	0f b7 84 00 80 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42ca80]
  80744b:	00 
  80744c:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807450:	0f b6 05 d6 13 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc213d6]        # 42882d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807457:	0f b6 d0             	movzx  edx,al
  80745a:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  80745e:	8b 05 1c 27 00 00    	mov    eax,DWORD PTR [rip+0x271c]        # 809b80 <clu_sec_balance>
  807464:	01 c1                	add    ecx,eax
  807466:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80746a:	89 ce                	mov    esi,ecx
  80746c:	48 89 c7             	mov    rdi,rax
  80746f:	e8 3e 02 00 00       	call   8076b2 <read_sec>
        }
    }while(cluster<FAT_EOF);
  807474:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807479:	0f 86 72 fe ff ff    	jbe    8072f1 <touch+0x65>
    return 0;
  80747f:	b8 00 00 00 00       	mov    eax,0x0
}
  807484:	c9                   	leave  
  807485:	c3                   	ret    

0000000000807486 <mkdir>:
//attention: the name must be char[12]
int mkdir(driver_args *arg)
{
  807486:	f3 0f 1e fa          	endbr64 
  80748a:	55                   	push   rbp
  80748b:	48 89 e5             	mov    rbp,rsp
  80748e:	48 83 ec 50          	sub    rsp,0x50
  807492:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    char *name=arg->path;
  807496:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80749a:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80749e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  8074a2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8074a6:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8074a9:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    format_name(name);
  8074ad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8074b1:	48 89 c7             	mov    rdi,rax
  8074b4:	e8 ad f9 ff ff       	call   806e66 <format_name>
    //regular dir
    unsigned short cluster = dir.fistCluNum;
  8074b9:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  8074bd:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do
    {
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
            superblock.secPerClu);
  8074c1:	0f b6 05 65 13 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21365]        # 42882d <superblock+0xd>
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  8074c8:	0f b6 c0             	movzx  eax,al
  8074cb:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  8074cf:	8b 15 ab 26 00 00    	mov    edx,DWORD PTR [rip+0x26ab]        # 809b80 <clu_sec_balance>
  8074d5:	01 d1                	add    ecx,edx
  8074d7:	89 c2                	mov    edx,eax
  8074d9:	89 ce                	mov    esi,ecx
  8074db:	bf 80 c8 42 00       	mov    edi,0x42c880
  8074e0:	e8 cd 01 00 00       	call   8076b2 <read_sec>
        for (int i = 0; i < 16; i++)
  8074e5:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8074ec:	e9 8c 01 00 00       	jmp    80767d <mkdir+0x1f7>
        {
            if(a_clu_of_dir[i].fistCluNum==0||\
  8074f1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8074f4:	48 98                	cdqe   
  8074f6:	48 c1 e0 05          	shl    rax,0x5
  8074fa:	48 05 9a c8 42 00    	add    rax,0x42c89a
  807500:	0f b7 00             	movzx  eax,WORD PTR [rax]
  807503:	66 85 c0             	test   ax,ax
  807506:	74 30                	je     807538 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0xe5||\
  807508:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80750b:	48 98                	cdqe   
  80750d:	48 c1 e0 05          	shl    rax,0x5
  807511:	48 05 60 88 42 00    	add    rax,0x428860
  807517:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if(a_clu_of_dir[i].fistCluNum==0||\
  80751a:	3c e5                	cmp    al,0xe5
  80751c:	74 1a                	je     807538 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0)
  80751e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807521:	48 98                	cdqe   
  807523:	48 c1 e0 05          	shl    rax,0x5
  807527:	48 05 60 88 42 00    	add    rax,0x428860
  80752d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            (unsigned char)root_dir[i].name[0]==0xe5||\
  807530:	84 c0                	test   al,al
  807532:	0f 85 41 01 00 00    	jne    807679 <mkdir+0x1f3>
            {
                memset(&a_clu_of_dir[i],0,sizeof(dir_entry));
  807538:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80753b:	48 98                	cdqe   
  80753d:	48 c1 e0 05          	shl    rax,0x5
  807541:	48 05 80 c8 42 00    	add    rax,0x42c880
  807547:	ba 20 00 00 00       	mov    edx,0x20
  80754c:	be 00 00 00 00       	mov    esi,0x0
  807551:	48 89 c7             	mov    rdi,rax
  807554:	e8 62 1b 00 00       	call   8090bb <memset>
                memset(a_clu_of_dir[i].name,' ',11);
  807559:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80755c:	48 98                	cdqe   
  80755e:	48 c1 e0 05          	shl    rax,0x5
  807562:	48 05 80 c8 42 00    	add    rax,0x42c880
  807568:	ba 0b 00 00 00       	mov    edx,0xb
  80756d:	be 20 00 00 00       	mov    esi,0x20
  807572:	48 89 c7             	mov    rdi,rax
  807575:	e8 41 1b 00 00       	call   8090bb <memset>
                strcpy(a_clu_of_dir[i].name,name);
  80757a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80757d:	48 98                	cdqe   
  80757f:	48 c1 e0 05          	shl    rax,0x5
  807583:	48 8d 90 80 c8 42 00 	lea    rdx,[rax+0x42c880]
  80758a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80758e:	48 89 c6             	mov    rsi,rax
  807591:	48 89 d7             	mov    rdi,rdx
  807594:	e8 71 1b 00 00       	call   80910a <strcpy>
                a_clu_of_dir[i].name[strlen(name)]=' ';
  807599:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80759d:	48 89 c7             	mov    rdi,rax
  8075a0:	e8 84 1d 00 00       	call   809329 <strlen>
  8075a5:	48 63 d0             	movsxd rdx,eax
  8075a8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8075ab:	48 98                	cdqe   
  8075ad:	48 c1 e0 05          	shl    rax,0x5
  8075b1:	48 01 d0             	add    rax,rdx
  8075b4:	48 05 80 c8 42 00    	add    rax,0x42c880
  8075ba:	c6 00 20             	mov    BYTE PTR [rax],0x20
                int clu=req_cluster();
  8075bd:	b8 00 00 00 00       	mov    eax,0x0
  8075c2:	e8 ab f9 ff ff       	call   806f72 <req_cluster>
  8075c7:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
                if(clu==-1)//check
  8075ca:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8075ce:	75 0a                	jne    8075da <mkdir+0x154>
                {
                    //puts("err:full dir");
                    return -1;
  8075d0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8075d5:	e9 d6 00 00 00       	jmp    8076b0 <mkdir+0x22a>
                }
                a_clu_of_dir[i].fistCluNum=clu;
  8075da:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8075dd:	89 c2                	mov    edx,eax
  8075df:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8075e2:	48 98                	cdqe   
  8075e4:	48 c1 e0 05          	shl    rax,0x5
  8075e8:	48 05 9a c8 42 00    	add    rax,0x42c89a
  8075ee:	66 89 10             	mov    WORD PTR [rax],dx
                //set attr
                set_attr(&a_clu_of_dir[i],ATTR_DIR);
  8075f1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8075f4:	48 98                	cdqe   
  8075f6:	48 c1 e0 05          	shl    rax,0x5
  8075fa:	48 05 80 c8 42 00    	add    rax,0x42c880
  807600:	be 10 00 00 00       	mov    esi,0x10
  807605:	48 89 c7             	mov    rdi,rax
  807608:	e8 24 fa ff ff       	call   807031 <set_attr>
                //set length
                a_clu_of_dir[i].len=0;
  80760d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807610:	48 98                	cdqe   
  807612:	48 c1 e0 05          	shl    rax,0x5
  807616:	48 05 9c c8 42 00    	add    rax,0x42c89c
  80761c:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
                //date and time
                /*a_clu_of_dir[i].lastModfDate=get_date_stab();
                a_clu_of_dir[i].lastModfTime=get_time_stab();*/
                //set date:temporarily none
                //add . and ..
                add_dot_and_ddot_dir(a_clu_of_dir[i]);
  807622:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807625:	48 98                	cdqe   
  807627:	48 c1 e0 05          	shl    rax,0x5
  80762b:	48 05 80 c8 42 00    	add    rax,0x42c880
  807631:	ff 70 18             	push   QWORD PTR [rax+0x18]
  807634:	ff 70 10             	push   QWORD PTR [rax+0x10]
  807637:	ff 70 08             	push   QWORD PTR [rax+0x8]
  80763a:	ff 30                	push   QWORD PTR [rax]
  80763c:	e8 7c fa ff ff       	call   8070bd <add_dot_and_ddot_dir>
  807641:	48 83 c4 20          	add    rsp,0x20
                //update the dir
                int dir_loc=cluster+clu_sec_balance;
  807645:	0f b7 55 fe          	movzx  edx,WORD PTR [rbp-0x2]
  807649:	8b 05 31 25 00 00    	mov    eax,DWORD PTR [rip+0x2531]        # 809b80 <clu_sec_balance>
  80764f:	01 d0                	add    eax,edx
  807651:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
                write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  807654:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807657:	ba 00 02 00 00       	mov    edx,0x200
  80765c:	89 c6                	mov    esi,eax
  80765e:	bf 80 c8 42 00       	mov    edi,0x42c880
  807663:	e8 56 f9 ff ff       	call   806fbe <write_sec>
                update_fat_and_root();
  807668:	b8 00 00 00 00       	mov    eax,0x0
  80766d:	e8 e7 f9 ff ff       	call   807059 <update_fat_and_root>
                return 0;
  807672:	b8 00 00 00 00       	mov    eax,0x0
  807677:	eb 37                	jmp    8076b0 <mkdir+0x22a>
        for (int i = 0; i < 16; i++)
  807679:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80767d:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  807681:	0f 8e 6a fe ff ff    	jle    8074f1 <mkdir+0x6b>
            }
        }

        if(cluster<FAT_EOF)
  807687:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  80768c:	77 12                	ja     8076a0 <mkdir+0x21a>
            cluster=fat[cluster];
  80768e:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807692:	48 98                	cdqe   
  807694:	0f b7 84 00 80 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42ca80]
  80769b:	00 
  80769c:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    } while (cluster<FAT_EOF);
  8076a0:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  8076a5:	0f 86 16 fe ff ff    	jbe    8074c1 <mkdir+0x3b>
    return -1;
  8076ab:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8076b0:	c9                   	leave  
  8076b1:	c3                   	ret    

00000000008076b2 <read_sec>:
    }
    
    
}*/
int read_sec(char *dist, int sec_num, int sec_count)
{
  8076b2:	f3 0f 1e fa          	endbr64 
  8076b6:	55                   	push   rbp
  8076b7:	48 89 e5             	mov    rbp,rsp
  8076ba:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  8076c1:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
  8076c8:	89 b5 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],esi
  8076ce:	89 95 20 ff ff ff    	mov    DWORD PTR [rbp-0xe0],edx
    driver_args arg={
  8076d4:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  8076db:	b8 00 00 00 00       	mov    eax,0x0
  8076e0:	b9 18 00 00 00       	mov    ecx,0x18
  8076e5:	48 89 d7             	mov    rdi,rdx
  8076e8:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  8076eb:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
  8076f1:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
  8076f7:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  8076fe:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
  807704:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  80770b:	00 00 00 
            .dist_addr=dist,
            .lba=sec_num,
            .sec_c=1
    };
    for(int i=0;i<sec_count;i++)
  80770e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807715:	eb 3e                	jmp    807755 <read_sec+0xa3>
    {
        drv_disk.read(&arg);
  807717:	48 8b 15 da 23 00 00 	mov    rdx,QWORD PTR [rip+0x23da]        # 809af8 <drv_disk+0x18>
  80771e:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  807725:	48 89 c7             	mov    rdi,rax
  807728:	ff d2                	call   rdx
        arg.dist_addr+=superblock.bytesPerSec;
  80772a:	8b 95 34 ff ff ff    	mov    edx,DWORD PTR [rbp-0xcc]
  807730:	0f b7 05 f4 10 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc210f4]        # 42882b <superblock+0xb>
  807737:	0f b7 c0             	movzx  eax,ax
  80773a:	01 d0                	add    eax,edx
  80773c:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.lba++;
  807742:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  807748:	83 c0 01             	add    eax,0x1
  80774b:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
    for(int i=0;i<sec_count;i++)
  807751:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807755:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807758:	3b 85 20 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xe0]
  80775e:	7c b7                	jl     807717 <read_sec+0x65>
    }
    return 0;
  807760:	b8 00 00 00 00       	mov    eax,0x0
}
  807765:	c9                   	leave  
  807766:	c3                   	ret    

0000000000807767 <rm>:

int rm(driver_args* args)
{
  807767:	f3 0f 1e fa          	endbr64 
  80776b:	55                   	push   rbp
  80776c:	48 89 e5             	mov    rbp,rsp
  80776f:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  807776:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
    char *name=args->path;
  80777d:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  807784:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807788:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    driver_args tmparg={
  80778c:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  807793:	b8 00 00 00 00       	mov    eax,0x0
  807798:	b9 18 00 00 00       	mov    ecx,0x18
  80779d:	48 89 d7             	mov    rdi,rdx
  8077a0:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .path=args->dir_path,
  8077a3:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8077aa:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
    driver_args tmparg={
  8077b1:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    if(get_entry(&tmparg)==-1)return -1;
  8077b8:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  8077bf:	48 89 c7             	mov    rdi,rax
  8077c2:	e8 07 0a 00 00       	call   8081ce <get_entry>
  8077c7:	83 f8 ff             	cmp    eax,0xffffffff
  8077ca:	75 0a                	jne    8077d6 <rm+0x6f>
  8077cc:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8077d1:	e9 a8 01 00 00       	jmp    80797e <rm+0x217>
    dir.fistCluNum=tmparg.entry.id;
  8077d6:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  8077dc:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    dir_entry *dir_table=a_clu_of_dir;
  8077e0:	48 c7 45 e0 80 c8 42 	mov    QWORD PTR [rbp-0x20],0x42c880
  8077e7:	00 
    //regular dir
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
    superblock.secPerClu);
  8077e8:	0f b6 05 3e 10 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2103e]        # 42882d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  8077ef:	0f b6 c0             	movzx  eax,al
  8077f2:	0f b7 55 da          	movzx  edx,WORD PTR [rbp-0x26]
  8077f6:	0f b7 ca             	movzx  ecx,dx
  8077f9:	8b 15 81 23 00 00    	mov    edx,DWORD PTR [rip+0x2381]        # 809b80 <clu_sec_balance>
  8077ff:	01 d1                	add    ecx,edx
  807801:	89 c2                	mov    edx,eax
  807803:	89 ce                	mov    esi,ecx
  807805:	bf 80 c8 42 00       	mov    edi,0x42c880
  80780a:	e8 a3 fe ff ff       	call   8076b2 <read_sec>
    dir_table=a_clu_of_dir;
  80780f:	48 c7 45 e0 80 c8 42 	mov    QWORD PTR [rbp-0x20],0x42c880
  807816:	00 
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  807817:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  80781b:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    int i=0;
  80781f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    while(cluster<FAT_EOF){
  807826:	e9 89 00 00 00       	jmp    8078b4 <rm+0x14d>
        read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  80782b:	0f b6 05 fb 0f c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20ffb]        # 42882d <superblock+0xd>
        read_sec(dir_table,cluster+clu_sec_balance,\
  807832:	0f b6 d0             	movzx  edx,al
  807835:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807839:	8b 05 41 23 00 00    	mov    eax,DWORD PTR [rip+0x2341]        # 809b80 <clu_sec_balance>
  80783f:	01 c1                	add    ecx,eax
  807841:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807845:	89 ce                	mov    esi,ecx
  807847:	48 89 c7             	mov    rdi,rax
  80784a:	e8 63 fe ff ff       	call   8076b2 <read_sec>
        for(;i<16;i++)
  80784f:	eb 44                	jmp    807895 <rm+0x12e>
        {
            if(dir_table[i].fistCluNum==args->entry.id)
  807851:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807854:	48 98                	cdqe   
  807856:	48 c1 e0 05          	shl    rax,0x5
  80785a:	48 89 c2             	mov    rdx,rax
  80785d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807861:	48 01 d0             	add    rax,rdx
  807864:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  807868:	0f b7 d0             	movzx  edx,ax
  80786b:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  807872:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  807875:	39 c2                	cmp    edx,eax
  807877:	75 18                	jne    807891 <rm+0x12a>
            {
                if(dir_table[i].attr&ATTR_DIR){
                    //要处理里面的文件
                }
                dir_table[i].name[0]=0xe5;
  807879:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80787c:	48 98                	cdqe   
  80787e:	48 c1 e0 05          	shl    rax,0x5
  807882:	48 89 c2             	mov    rdx,rax
  807885:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807889:	48 01 d0             	add    rax,rdx
  80788c:	c6 00 e5             	mov    BYTE PTR [rax],0xe5
                goto del_entry_finish;
  80788f:	eb 2f                	jmp    8078c0 <rm+0x159>
        for(;i<16;i++)
  807891:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807895:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  807899:	7e b6                	jle    807851 <rm+0xea>
            }
        }
        if(cluster<FAT_EOF)
  80789b:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  8078a0:	77 12                	ja     8078b4 <rm+0x14d>
        {
            cluster=fat[cluster];
  8078a2:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8078a6:	48 98                	cdqe   
  8078a8:	0f b7 84 00 80 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42ca80]
  8078af:	00 
  8078b0:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    while(cluster<FAT_EOF){
  8078b4:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  8078b9:	0f 86 6c ff ff ff    	jbe    80782b <rm+0xc4>
            //update
            //if you can reach here it means it's a regular dir
        }

    }
del_entry_finish:
  8078bf:	90                   	nop
    ;
    //del fat
    unsigned short del_clu=dir_table[i].fistCluNum;
  8078c0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8078c3:	48 98                	cdqe   
  8078c5:	48 c1 e0 05          	shl    rax,0x5
  8078c9:	48 89 c2             	mov    rdx,rax
  8078cc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8078d0:	48 01 d0             	add    rax,rdx
  8078d3:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  8078d7:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
    unsigned short pion=del_clu<FAT_EOF?fat[del_clu]:0xffff;
  8078db:	66 83 7d f6 f6       	cmp    WORD PTR [rbp-0xa],0xfff6
  8078e0:	77 10                	ja     8078f2 <rm+0x18b>
  8078e2:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  8078e6:	48 98                	cdqe   
  8078e8:	0f b7 84 00 80 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42ca80]
  8078ef:	00 
  8078f0:	eb 05                	jmp    8078f7 <rm+0x190>
  8078f2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8078f7:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  8078fb:	eb 2a                	jmp    807927 <rm+0x1c0>
    {
        fat[del_clu]=0;
  8078fd:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807901:	48 98                	cdqe   
  807903:	66 c7 84 00 80 ca 42 	mov    WORD PTR [rax+rax*1+0x42ca80],0x0
  80790a:	00 00 00 
        del_clu=pion;
  80790d:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  807911:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
        pion=fat[pion];
  807915:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  807919:	48 98                	cdqe   
  80791b:	0f b7 84 00 80 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42ca80]
  807922:	00 
  807923:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  807927:	66 83 7d f4 f6       	cmp    WORD PTR [rbp-0xc],0xfff6
  80792c:	76 cf                	jbe    8078fd <rm+0x196>
    }
    fat[del_clu]=0;
  80792e:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807932:	48 98                	cdqe   
  807934:	66 c7 84 00 80 ca 42 	mov    WORD PTR [rax+rax*1+0x42ca80],0x0
  80793b:	00 00 00 
    //del dir entry
    write_sec(dir_table,cluster+clu_sec_balance,\
    superblock.secPerClu*superblock.bytesPerSec);
  80793e:	0f b6 05 e8 0e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20ee8]        # 42882d <superblock+0xd>
  807945:	0f b6 d0             	movzx  edx,al
  807948:	0f b7 05 dc 0e c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20edc]        # 42882b <superblock+0xb>
  80794f:	0f b7 c0             	movzx  eax,ax
    write_sec(dir_table,cluster+clu_sec_balance,\
  807952:	0f af d0             	imul   edx,eax
  807955:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807959:	8b 05 21 22 00 00    	mov    eax,DWORD PTR [rip+0x2221]        # 809b80 <clu_sec_balance>
  80795f:	01 c1                	add    ecx,eax
  807961:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807965:	89 ce                	mov    esi,ecx
  807967:	48 89 c7             	mov    rdi,rax
  80796a:	e8 4f f6 ff ff       	call   806fbe <write_sec>
    update_fat_and_root();
  80796f:	b8 00 00 00 00       	mov    eax,0x0
  807974:	e8 e0 f6 ff ff       	call   807059 <update_fat_and_root>
    return 0;
  807979:	b8 00 00 00 00       	mov    eax,0x0
}
  80797e:	c9                   	leave  
  80797f:	c3                   	ret    

0000000000807980 <find>:
int find_f=0;
int find(char *name)
{
  807980:	f3 0f 1e fa          	endbr64 
  807984:	55                   	push   rbp
  807985:	48 89 e5             	mov    rbp,rsp
  807988:	48 83 ec 30          	sub    rsp,0x30
  80798c:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  807990:	c7 45 fc 00 02 00 00 	mov    DWORD PTR [rbp-0x4],0x200
    int index=0;
  807997:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    dir_entry *dir_table=a_clu_of_dir;
  80799e:	48 c7 45 f0 80 c8 42 	mov    QWORD PTR [rbp-0x10],0x42c880
  8079a5:	00 
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  8079a6:	0f b7 05 cd 4e c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24ecd]        # 42c87a <cur_dir+0x1a>
  8079ad:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
    if(cur_dir.fistCluNum==0)
  8079b1:	0f b7 05 c2 4e c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24ec2]        # 42c87a <cur_dir+0x1a>
  8079b8:	66 85 c0             	test   ax,ax
  8079bb:	75 0a                	jne    8079c7 <find+0x47>
        dir_table=root_dir;
  8079bd:	48 c7 45 f0 60 88 42 	mov    QWORD PTR [rbp-0x10],0x428860
  8079c4:	00 
  8079c5:	eb 2b                	jmp    8079f2 <find+0x72>
    else {
        max_files=16;
  8079c7:	c7 45 fc 10 00 00 00 	mov    DWORD PTR [rbp-0x4],0x10
        read_sec(dir_table, cluster + clu_sec_balance, \
            superblock.secPerClu);
  8079ce:	0f b6 05 58 0e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20e58]        # 42882d <superblock+0xd>
        read_sec(dir_table, cluster + clu_sec_balance, \
  8079d5:	0f b6 d0             	movzx  edx,al
  8079d8:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  8079dc:	8b 05 9e 21 00 00    	mov    eax,DWORD PTR [rip+0x219e]        # 809b80 <clu_sec_balance>
  8079e2:	01 c1                	add    ecx,eax
  8079e4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8079e8:	89 ce                	mov    esi,ecx
  8079ea:	48 89 c7             	mov    rdi,rax
  8079ed:	e8 c0 fc ff ff       	call   8076b2 <read_sec>
    }
    do{
        for(int i=0;i<max_files;i++)
  8079f2:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8079f9:	eb 57                	jmp    807a52 <find+0xd2>
        {
            if(dir_table[i].name[0]==0||dir_table[i].name[0]==0xe5)
  8079fb:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8079fe:	48 98                	cdqe   
  807a00:	48 c1 e0 05          	shl    rax,0x5
  807a04:	48 89 c2             	mov    rdx,rax
  807a07:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807a0b:	48 01 d0             	add    rax,rdx
  807a0e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807a11:	84 c0                	test   al,al
  807a13:	74 38                	je     807a4d <find+0xcd>
                continue;
            if(memcmp(dir_table[i].name,name,11)==0)
  807a15:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807a18:	48 98                	cdqe   
  807a1a:	48 c1 e0 05          	shl    rax,0x5
  807a1e:	48 89 c2             	mov    rdx,rax
  807a21:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807a25:	48 01 d0             	add    rax,rdx
  807a28:	48 89 c1             	mov    rcx,rax
  807a2b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807a2f:	ba 0b 00 00 00       	mov    edx,0xb
  807a34:	48 89 c6             	mov    rsi,rax
  807a37:	48 89 cf             	mov    rdi,rcx
  807a3a:	e8 17 16 00 00       	call   809056 <memcmp>
  807a3f:	85 c0                	test   eax,eax
  807a41:	75 0b                	jne    807a4e <find+0xce>
            {
                return index+i;
  807a43:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  807a46:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807a49:	01 d0                	add    eax,edx
  807a4b:	eb 71                	jmp    807abe <find+0x13e>
                continue;
  807a4d:	90                   	nop
        for(int i=0;i<max_files;i++)
  807a4e:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  807a52:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807a55:	3b 45 fc             	cmp    eax,DWORD PTR [rbp-0x4]
  807a58:	7c a1                	jl     8079fb <find+0x7b>
            }
        }
        if(cur_dir.fistCluNum==0)
  807a5a:	0f b7 05 19 4e c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24e19]        # 42c87a <cur_dir+0x1a>
  807a61:	66 85 c0             	test   ax,ax
  807a64:	75 07                	jne    807a6d <find+0xed>
            return -1;
  807a66:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807a6b:	eb 51                	jmp    807abe <find+0x13e>
        else if(cluster<FAT_EOF)
  807a6d:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  807a72:	77 3a                	ja     807aae <find+0x12e>
        {
            index+=16;
  807a74:	83 45 f8 10          	add    DWORD PTR [rbp-0x8],0x10
            cluster=fat[cluster];
  807a78:	0f b7 45 ee          	movzx  eax,WORD PTR [rbp-0x12]
  807a7c:	48 98                	cdqe   
  807a7e:	0f b7 84 00 80 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42ca80]
  807a85:	00 
  807a86:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807a8a:	0f b6 05 9c 0d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20d9c]        # 42882d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807a91:	0f b6 d0             	movzx  edx,al
  807a94:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  807a98:	8b 05 e2 20 00 00    	mov    eax,DWORD PTR [rip+0x20e2]        # 809b80 <clu_sec_balance>
  807a9e:	01 c1                	add    ecx,eax
  807aa0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807aa4:	89 ce                	mov    esi,ecx
  807aa6:	48 89 c7             	mov    rdi,rax
  807aa9:	e8 04 fc ff ff       	call   8076b2 <read_sec>
        }
    }while(cluster<FAT_EOF);
  807aae:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  807ab3:	0f 86 39 ff ff ff    	jbe    8079f2 <find+0x72>
    return -1;
  807ab9:	b8 ff ff ff ff       	mov    eax,0xffffffff

}
  807abe:	c9                   	leave  
  807abf:	c3                   	ret    

0000000000807ac0 <read_file_byname>:

int read_file_byname(char *full_name,char *dist,int pos,int len)
{
  807ac0:	f3 0f 1e fa          	endbr64 
  807ac4:	55                   	push   rbp
  807ac5:	48 89 e5             	mov    rbp,rsp
  807ac8:	41 57                	push   r15
  807aca:	41 56                	push   r14
  807acc:	41 55                	push   r13
  807ace:	41 54                	push   r12
  807ad0:	53                   	push   rbx
  807ad1:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  807ad8:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  807adf:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  807ae6:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  807aec:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  807af2:	48 89 e0             	mov    rax,rsp
  807af5:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  807af8:	bf 00 00 00 00       	mov    edi,0x0
  807afd:	e8 7e fe ff ff       	call   807980 <find>
  807b02:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  807b05:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  807b09:	74 09                	je     807b14 <read_file_byname+0x54>
  807b0b:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  807b12:	79 0a                	jns    807b1e <read_file_byname+0x5e>
        return -1;
  807b14:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807b19:	e9 ea 02 00 00       	jmp    807e08 <read_file_byname+0x348>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  807b1e:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  807b25:	48 c7 45 c0 60 88 42 	mov    QWORD PTR [rbp-0x40],0x428860
  807b2c:	00 
    int in_root=1;
  807b2d:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  807b34:	0f b7 05 3f 4d c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24d3f]        # 42c87a <cur_dir+0x1a>
  807b3b:	66 85 c0             	test   ax,ax
  807b3e:	74 40                	je     807b80 <read_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  807b40:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  807b47:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  807b4e:	0f b6 05 d8 0c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20cd8]        # 42882d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  807b55:	0f b6 c0             	movzx  eax,al
  807b58:	0f b7 15 1b 4d c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc24d1b]        # 42c87a <cur_dir+0x1a>
  807b5f:	0f b7 ca             	movzx  ecx,dx
  807b62:	8b 15 18 20 00 00    	mov    edx,DWORD PTR [rip+0x2018]        # 809b80 <clu_sec_balance>
  807b68:	01 d1                	add    ecx,edx
  807b6a:	89 c2                	mov    edx,eax
  807b6c:	89 ce                	mov    esi,ecx
  807b6e:	bf 80 c8 42 00       	mov    edi,0x42c880
  807b73:	e8 3a fb ff ff       	call   8076b2 <read_sec>
        dir_table=a_clu_of_dir;
  807b78:	48 c7 45 c0 80 c8 42 	mov    QWORD PTR [rbp-0x40],0x42c880
  807b7f:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  807b80:	0f b7 05 f3 4c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24cf3]        # 42c87a <cur_dir+0x1a>
  807b87:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  807b8b:	eb 41                	jmp    807bce <read_file_byname+0x10e>
        index-=16;
  807b8d:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  807b91:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  807b96:	77 36                	ja     807bce <read_file_byname+0x10e>
        {
            cluster=fat[cluster];
  807b98:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  807b9c:	48 98                	cdqe   
  807b9e:	0f b7 84 00 80 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42ca80]
  807ba5:	00 
  807ba6:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807baa:	0f b6 05 7c 0c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20c7c]        # 42882d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807bb1:	0f b6 d0             	movzx  edx,al
  807bb4:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  807bb8:	8b 05 c2 1f 00 00    	mov    eax,DWORD PTR [rip+0x1fc2]        # 809b80 <clu_sec_balance>
  807bbe:	01 c1                	add    ecx,eax
  807bc0:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807bc4:	89 ce                	mov    esi,ecx
  807bc6:	48 89 c7             	mov    rdi,rax
  807bc9:	e8 e4 fa ff ff       	call   8076b2 <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  807bce:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  807bd2:	75 0d                	jne    807be1 <read_file_byname+0x121>
  807bd4:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  807bd8:	7e 07                	jle    807be1 <read_file_byname+0x121>
  807bda:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  807bdf:	76 ac                	jbe    807b8d <read_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  807be1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  807be4:	48 98                	cdqe   
  807be6:	48 c1 e0 05          	shl    rax,0x5
  807bea:	48 89 c2             	mov    rdx,rax
  807bed:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807bf1:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807bf5:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  807bf8:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  807bfc:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  807c03:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  807c0a:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  807c0e:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  807c12:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  807c16:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  807c1a:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  807c1e:	0f b7 c0             	movzx  eax,ax
  807c21:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  807c24:	0f b7 05 00 0c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20c00]        # 42882b <superblock+0xb>
  807c2b:	0f b7 d0             	movzx  edx,ax
  807c2e:	0f b6 05 f8 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20bf8]        # 42882d <superblock+0xd>
  807c35:	0f b6 c0             	movzx  eax,al
  807c38:	0f af c2             	imul   eax,edx
  807c3b:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  807c3e:	eb 25                	jmp    807c65 <read_file_byname+0x1a5>
    {
        pos-=cluster_size;
  807c40:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807c43:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        f_cluster=fat[f_cluster];
  807c49:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807c4c:	48 98                	cdqe   
  807c4e:	0f b7 84 00 80 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42ca80]
  807c55:	00 
  807c56:	98                   	cwde   
  807c57:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        if(pos<cluster_size)
  807c5a:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807c60:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  807c63:	7c 0d                	jl     807c72 <read_file_byname+0x1b2>
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  807c65:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807c6b:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  807c6e:	7d d0                	jge    807c40 <read_file_byname+0x180>
  807c70:	eb 01                	jmp    807c73 <read_file_byname+0x1b3>
            break;
  807c72:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  807c73:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  807c7a:	7e 15                	jle    807c91 <read_file_byname+0x1d1>
  807c7c:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807c82:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  807c85:	7c 0a                	jl     807c91 <read_file_byname+0x1d1>
        return -1;//pos out of range
  807c87:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807c8c:	e9 77 01 00 00       	jmp    807e08 <read_file_byname+0x348>
    //
    char temp[cluster_size];
  807c91:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807c94:	48 63 d0             	movsxd rdx,eax
  807c97:	48 83 ea 01          	sub    rdx,0x1
  807c9b:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  807c9f:	48 63 d0             	movsxd rdx,eax
  807ca2:	49 89 d6             	mov    r14,rdx
  807ca5:	41 bf 00 00 00 00    	mov    r15d,0x0
  807cab:	48 63 d0             	movsxd rdx,eax
  807cae:	49 89 d4             	mov    r12,rdx
  807cb1:	41 bd 00 00 00 00    	mov    r13d,0x0
  807cb7:	48 98                	cdqe   
  807cb9:	ba 10 00 00 00       	mov    edx,0x10
  807cbe:	48 83 ea 01          	sub    rdx,0x1
  807cc2:	48 01 d0             	add    rax,rdx
  807cc5:	be 10 00 00 00       	mov    esi,0x10
  807cca:	ba 00 00 00 00       	mov    edx,0x0
  807ccf:	48 f7 f6             	div    rsi
  807cd2:	48 6b c0 10          	imul   rax,rax,0x10
  807cd6:	48 89 c1             	mov    rcx,rax
  807cd9:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  807ce0:	48 89 e2             	mov    rdx,rsp
  807ce3:	48 29 ca             	sub    rdx,rcx
  807ce6:	48 39 d4             	cmp    rsp,rdx
  807ce9:	74 12                	je     807cfd <read_file_byname+0x23d>
  807ceb:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  807cf2:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  807cf9:	00 00 
  807cfb:	eb e9                	jmp    807ce6 <read_file_byname+0x226>
  807cfd:	48 89 c2             	mov    rdx,rax
  807d00:	81 e2 ff 0f 00 00    	and    edx,0xfff
  807d06:	48 29 d4             	sub    rsp,rdx
  807d09:	48 89 c2             	mov    rdx,rax
  807d0c:	81 e2 ff 0f 00 00    	and    edx,0xfff
  807d12:	48 85 d2             	test   rdx,rdx
  807d15:	74 10                	je     807d27 <read_file_byname+0x267>
  807d17:	25 ff 0f 00 00       	and    eax,0xfff
  807d1c:	48 83 e8 08          	sub    rax,0x8
  807d20:	48 01 e0             	add    rax,rsp
  807d23:	48 83 08 00          	or     QWORD PTR [rax],0x0
  807d27:	48 89 e0             	mov    rax,rsp
  807d2a:	48 83 c0 00          	add    rax,0x0
  807d2e:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of reading might be not aligned
    read_sec(temp,f_cluster+clu_sec_balance,superblock.secPerClu);
  807d32:	0f b6 05 f4 0a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20af4]        # 42882d <superblock+0xd>
  807d39:	0f b6 d0             	movzx  edx,al
  807d3c:	8b 0d 3e 1e 00 00    	mov    ecx,DWORD PTR [rip+0x1e3e]        # 809b80 <clu_sec_balance>
  807d42:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807d45:	01 c1                	add    ecx,eax
  807d47:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807d4b:	89 ce                	mov    esi,ecx
  807d4d:	48 89 c7             	mov    rdi,rax
  807d50:	e8 5d f9 ff ff       	call   8076b2 <read_sec>
    memcpy(dist,temp+pos,cluster_size-pos);
  807d55:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807d58:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  807d5e:	89 c2                	mov    edx,eax
  807d60:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807d66:	48 63 c8             	movsxd rcx,eax
  807d69:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807d6d:	48 01 c1             	add    rcx,rax
  807d70:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  807d77:	48 89 ce             	mov    rsi,rcx
  807d7a:	48 89 c7             	mov    rdi,rax
  807d7d:	e8 8a 12 00 00       	call   80900c <memcpy>
    dist+=cluster_size-pos;
  807d82:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807d85:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  807d8b:	48 98                	cdqe   
  807d8d:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
    len-=cluster_size-pos;
  807d94:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807d97:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  807d9d:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  807da3:	eb 4c                	jmp    807df1 <read_file_byname+0x331>
    {
        f_cluster=fat[f_cluster];
  807da5:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807da8:	48 98                	cdqe   
  807daa:	0f b7 84 00 80 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42ca80]
  807db1:	00 
  807db2:	98                   	cwde   
  807db3:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        read_sec(dist,f_cluster+clu_sec_balance,superblock.secPerClu);
  807db6:	0f b6 05 70 0a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20a70]        # 42882d <superblock+0xd>
  807dbd:	0f b6 d0             	movzx  edx,al
  807dc0:	8b 0d ba 1d 00 00    	mov    ecx,DWORD PTR [rip+0x1dba]        # 809b80 <clu_sec_balance>
  807dc6:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807dc9:	01 c1                	add    ecx,eax
  807dcb:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  807dd2:	89 ce                	mov    esi,ecx
  807dd4:	48 89 c7             	mov    rdi,rax
  807dd7:	e8 d6 f8 ff ff       	call   8076b2 <read_sec>
        dist+=cluster_size;
  807ddc:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807ddf:	48 98                	cdqe   
  807de1:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  807de8:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807deb:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  807df1:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  807df8:	7f 09                	jg     807e03 <read_file_byname+0x343>
  807dfa:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  807e01:	7f a2                	jg     807da5 <read_file_byname+0x2e5>
    }
    return 0;
  807e03:	b8 00 00 00 00       	mov    eax,0x0
  807e08:	48 89 dc             	mov    rsp,rbx
    
}
  807e0b:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  807e0f:	5b                   	pop    rbx
  807e10:	41 5c                	pop    r12
  807e12:	41 5d                	pop    r13
  807e14:	41 5e                	pop    r14
  807e16:	41 5f                	pop    r15
  807e18:	5d                   	pop    rbp
  807e19:	c3                   	ret    

0000000000807e1a <write_file_byname>:
int write_file_byname(char *full_name,char *src,int pos,int len)
{
  807e1a:	f3 0f 1e fa          	endbr64 
  807e1e:	55                   	push   rbp
  807e1f:	48 89 e5             	mov    rbp,rsp
  807e22:	41 57                	push   r15
  807e24:	41 56                	push   r14
  807e26:	41 55                	push   r13
  807e28:	41 54                	push   r12
  807e2a:	53                   	push   rbx
  807e2b:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  807e32:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  807e39:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  807e40:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  807e46:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  807e4c:	48 89 e0             	mov    rax,rsp
  807e4f:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  807e52:	bf 00 00 00 00       	mov    edi,0x0
  807e57:	e8 24 fb ff ff       	call   807980 <find>
  807e5c:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  807e5f:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  807e63:	74 09                	je     807e6e <write_file_byname+0x54>
  807e65:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  807e6c:	79 0a                	jns    807e78 <write_file_byname+0x5e>
        return -1;
  807e6e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807e73:	e9 1e 03 00 00       	jmp    808196 <write_file_byname+0x37c>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  807e78:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  807e7f:	48 c7 45 c0 60 88 42 	mov    QWORD PTR [rbp-0x40],0x428860
  807e86:	00 
    int in_root=1;
  807e87:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  807e8e:	0f b7 05 e5 49 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc249e5]        # 42c87a <cur_dir+0x1a>
  807e95:	66 85 c0             	test   ax,ax
  807e98:	74 40                	je     807eda <write_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  807e9a:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  807ea1:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  807ea8:	0f b6 05 7e 09 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2097e]        # 42882d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  807eaf:	0f b6 c0             	movzx  eax,al
  807eb2:	0f b7 15 c1 49 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc249c1]        # 42c87a <cur_dir+0x1a>
  807eb9:	0f b7 ca             	movzx  ecx,dx
  807ebc:	8b 15 be 1c 00 00    	mov    edx,DWORD PTR [rip+0x1cbe]        # 809b80 <clu_sec_balance>
  807ec2:	01 d1                	add    ecx,edx
  807ec4:	89 c2                	mov    edx,eax
  807ec6:	89 ce                	mov    esi,ecx
  807ec8:	bf 80 c8 42 00       	mov    edi,0x42c880
  807ecd:	e8 e0 f7 ff ff       	call   8076b2 <read_sec>
        dir_table=a_clu_of_dir;
  807ed2:	48 c7 45 c0 80 c8 42 	mov    QWORD PTR [rbp-0x40],0x42c880
  807ed9:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  807eda:	0f b7 05 99 49 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24999]        # 42c87a <cur_dir+0x1a>
  807ee1:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  807ee5:	eb 41                	jmp    807f28 <write_file_byname+0x10e>
        index-=16;
  807ee7:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  807eeb:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  807ef0:	77 36                	ja     807f28 <write_file_byname+0x10e>
        {
            cluster=fat[cluster];
  807ef2:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  807ef6:	48 98                	cdqe   
  807ef8:	0f b7 84 00 80 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42ca80]
  807eff:	00 
  807f00:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807f04:	0f b6 05 22 09 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20922]        # 42882d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807f0b:	0f b6 d0             	movzx  edx,al
  807f0e:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  807f12:	8b 05 68 1c 00 00    	mov    eax,DWORD PTR [rip+0x1c68]        # 809b80 <clu_sec_balance>
  807f18:	01 c1                	add    ecx,eax
  807f1a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807f1e:	89 ce                	mov    esi,ecx
  807f20:	48 89 c7             	mov    rdi,rax
  807f23:	e8 8a f7 ff ff       	call   8076b2 <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  807f28:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  807f2c:	75 0d                	jne    807f3b <write_file_byname+0x121>
  807f2e:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  807f32:	7e 07                	jle    807f3b <write_file_byname+0x121>
  807f34:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  807f39:	76 ac                	jbe    807ee7 <write_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  807f3b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  807f3e:	48 98                	cdqe   
  807f40:	48 c1 e0 05          	shl    rax,0x5
  807f44:	48 89 c2             	mov    rdx,rax
  807f47:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807f4b:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807f4f:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  807f52:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  807f56:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  807f5d:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  807f64:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  807f68:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  807f6c:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  807f70:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  807f74:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  807f78:	0f b7 c0             	movzx  eax,ax
  807f7b:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  807f7e:	0f b7 05 a6 08 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc208a6]        # 42882b <superblock+0xb>
  807f85:	0f b7 d0             	movzx  edx,ax
  807f88:	0f b6 05 9e 08 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2089e]        # 42882d <superblock+0xd>
  807f8f:	0f b6 c0             	movzx  eax,al
  807f92:	0f af c2             	imul   eax,edx
  807f95:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  807f98:	eb 25                	jmp    807fbf <write_file_byname+0x1a5>
    {
        pos-=cluster_size;
  807f9a:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807f9d:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        if(pos<cluster_size)
  807fa3:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807fa9:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  807fac:	7c 1e                	jl     807fcc <write_file_byname+0x1b2>
            break;
        f_cluster=fat[f_cluster];
  807fae:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807fb1:	48 98                	cdqe   
  807fb3:	0f b7 84 00 80 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42ca80]
  807fba:	00 
  807fbb:	98                   	cwde   
  807fbc:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  807fbf:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807fc5:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  807fc8:	7d d0                	jge    807f9a <write_file_byname+0x180>
  807fca:	eb 01                	jmp    807fcd <write_file_byname+0x1b3>
            break;
  807fcc:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  807fcd:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  807fd4:	7e 15                	jle    807feb <write_file_byname+0x1d1>
  807fd6:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807fdc:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  807fdf:	7c 0a                	jl     807feb <write_file_byname+0x1d1>
        return -1;//pos out of range
  807fe1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807fe6:	e9 ab 01 00 00       	jmp    808196 <write_file_byname+0x37c>
    //
    char temp[cluster_size];
  807feb:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807fee:	48 63 d0             	movsxd rdx,eax
  807ff1:	48 83 ea 01          	sub    rdx,0x1
  807ff5:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  807ff9:	48 63 d0             	movsxd rdx,eax
  807ffc:	49 89 d6             	mov    r14,rdx
  807fff:	41 bf 00 00 00 00    	mov    r15d,0x0
  808005:	48 63 d0             	movsxd rdx,eax
  808008:	49 89 d4             	mov    r12,rdx
  80800b:	41 bd 00 00 00 00    	mov    r13d,0x0
  808011:	48 98                	cdqe   
  808013:	ba 10 00 00 00       	mov    edx,0x10
  808018:	48 83 ea 01          	sub    rdx,0x1
  80801c:	48 01 d0             	add    rax,rdx
  80801f:	be 10 00 00 00       	mov    esi,0x10
  808024:	ba 00 00 00 00       	mov    edx,0x0
  808029:	48 f7 f6             	div    rsi
  80802c:	48 6b c0 10          	imul   rax,rax,0x10
  808030:	48 89 c1             	mov    rcx,rax
  808033:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  80803a:	48 89 e2             	mov    rdx,rsp
  80803d:	48 29 ca             	sub    rdx,rcx
  808040:	48 39 d4             	cmp    rsp,rdx
  808043:	74 12                	je     808057 <write_file_byname+0x23d>
  808045:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  80804c:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  808053:	00 00 
  808055:	eb e9                	jmp    808040 <write_file_byname+0x226>
  808057:	48 89 c2             	mov    rdx,rax
  80805a:	81 e2 ff 0f 00 00    	and    edx,0xfff
  808060:	48 29 d4             	sub    rsp,rdx
  808063:	48 89 c2             	mov    rdx,rax
  808066:	81 e2 ff 0f 00 00    	and    edx,0xfff
  80806c:	48 85 d2             	test   rdx,rdx
  80806f:	74 10                	je     808081 <write_file_byname+0x267>
  808071:	25 ff 0f 00 00       	and    eax,0xfff
  808076:	48 83 e8 08          	sub    rax,0x8
  80807a:	48 01 e0             	add    rax,rsp
  80807d:	48 83 08 00          	or     QWORD PTR [rax],0x0
  808081:	48 89 e0             	mov    rax,rsp
  808084:	48 83 c0 00          	add    rax,0x0
  808088:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of writing might not be aligned
    if(pos>0)
  80808c:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  808093:	0f 8e a2 00 00 00    	jle    80813b <write_file_byname+0x321>
    {
        memcpy(temp+pos,src,cluster_size-pos);
  808099:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80809c:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  8080a2:	89 c2                	mov    edx,eax
  8080a4:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8080aa:	48 63 c8             	movsxd rcx,eax
  8080ad:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8080b1:	48 01 c1             	add    rcx,rax
  8080b4:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8080bb:	48 89 c6             	mov    rsi,rax
  8080be:	48 89 cf             	mov    rdi,rcx
  8080c1:	e8 46 0f 00 00       	call   80900c <memcpy>
        write_sec(temp,f_cluster,cluster_size-pos);
  8080c6:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8080c9:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  8080cf:	89 c2                	mov    edx,eax
  8080d1:	8b 4d b4             	mov    ecx,DWORD PTR [rbp-0x4c]
  8080d4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8080d8:	89 ce                	mov    esi,ecx
  8080da:	48 89 c7             	mov    rdi,rax
  8080dd:	e8 dc ee ff ff       	call   806fbe <write_sec>
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  8080e2:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8080e5:	48 98                	cdqe   
  8080e7:	0f b7 84 00 80 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42ca80]
  8080ee:	00 
  8080ef:	98                   	cwde   
  8080f0:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    }
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  8080f3:	eb 46                	jmp    80813b <write_file_byname+0x321>
    {
        write_sec(src,f_cluster+clu_sec_balance,cluster_size);
  8080f5:	8b 15 85 1a 00 00    	mov    edx,DWORD PTR [rip+0x1a85]        # 809b80 <clu_sec_balance>
  8080fb:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8080fe:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  808101:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  808104:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  80810b:	89 ce                	mov    esi,ecx
  80810d:	48 89 c7             	mov    rdi,rax
  808110:	e8 a9 ee ff ff       	call   806fbe <write_sec>
        src+=cluster_size;
  808115:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808118:	48 98                	cdqe   
  80811a:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  808121:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808124:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  80812a:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80812d:	48 98                	cdqe   
  80812f:	0f b7 84 00 80 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42ca80]
  808136:	00 
  808137:	98                   	cwde   
  808138:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  80813b:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808142:	7f 0b                	jg     80814f <write_file_byname+0x335>
  808144:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa8]
  80814a:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  80814d:	7d a6                	jge    8080f5 <write_file_byname+0x2db>
    }
    if(len>0)
  80814f:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  808156:	7e 39                	jle    808191 <write_file_byname+0x377>
    {
        //there might be some leftover less than a cluster
        memcpy(temp,src,len);
  808158:	8b 95 58 ff ff ff    	mov    edx,DWORD PTR [rbp-0xa8]
  80815e:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  808165:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808169:	48 89 ce             	mov    rsi,rcx
  80816c:	48 89 c7             	mov    rdi,rax
  80816f:	e8 98 0e 00 00       	call   80900c <memcpy>
        write_sec(temp,f_cluster+clu_sec_balance,cluster_size);
  808174:	8b 15 06 1a 00 00    	mov    edx,DWORD PTR [rip+0x1a06]        # 809b80 <clu_sec_balance>
  80817a:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80817d:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  808180:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  808183:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808187:	89 ce                	mov    esi,ecx
  808189:	48 89 c7             	mov    rdi,rax
  80818c:	e8 2d ee ff ff       	call   806fbe <write_sec>
    }
    return 0;
  808191:	b8 00 00 00 00       	mov    eax,0x0
  808196:	48 89 dc             	mov    rsp,rbx

}
  808199:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  80819d:	5b                   	pop    rbx
  80819e:	41 5c                	pop    r12
  8081a0:	41 5d                	pop    r13
  8081a2:	41 5e                	pop    r14
  8081a4:	41 5f                	pop    r15
  8081a6:	5d                   	pop    rbp
  8081a7:	c3                   	ret    

00000000008081a8 <file_exist>:


int file_exist(dir_entry entry)
{
  8081a8:	f3 0f 1e fa          	endbr64 
  8081ac:	55                   	push   rbp
  8081ad:	48 89 e5             	mov    rbp,rsp
    if((unsigned char)entry.name[0]==0xe5u||\
  8081b0:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
  8081b4:	3c e5                	cmp    al,0xe5
  8081b6:	74 08                	je     8081c0 <file_exist+0x18>
    (unsigned char)entry.name[0]==0u)
  8081b8:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
    if((unsigned char)entry.name[0]==0xe5u||\
  8081bc:	84 c0                	test   al,al
  8081be:	75 07                	jne    8081c7 <file_exist+0x1f>
    {
        //printf("file not exist\n");
        return 0;
  8081c0:	b8 00 00 00 00       	mov    eax,0x0
  8081c5:	eb 05                	jmp    8081cc <file_exist+0x24>

    }
    return 1;
  8081c7:	b8 01 00 00 00       	mov    eax,0x1
}
  8081cc:	5d                   	pop    rbp
  8081cd:	c3                   	ret    

00000000008081ce <get_entry>:
int get_entry(driver_args* args)
{
  8081ce:	f3 0f 1e fa          	endbr64 
  8081d2:	55                   	push   rbp
  8081d3:	48 89 e5             	mov    rbp,rsp
  8081d6:	53                   	push   rbx
  8081d7:	48 81 ec e8 00 00 00 	sub    rsp,0xe8
  8081de:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
    char *name=args->path;
  8081e5:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8081ec:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8081f0:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    dir.fistCluNum=((vfs_dir_entry*)args->cwd)->id;
  8081f4:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8081fb:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  808202:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808205:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    dir_entry entry;
    vfs_dir_entry ret;
    entry.name[0]=0xe5;
  808209:	c6 45 90 e5          	mov    BYTE PTR [rbp-0x70],0xe5

    char *p=name;
  80820d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808211:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    char nametmp[12];
    int index=-1;
  808215:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [rbp-0x24],0xffffffff
    while(*name!='\0')
  80821c:	e9 2c 01 00 00       	jmp    80834d <get_entry+0x17f>
    {
        if(*name=='/')
  808221:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808225:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808228:	3c 2f                	cmp    al,0x2f
  80822a:	0f 85 18 01 00 00    	jne    808348 <get_entry+0x17a>
        {
            if(name-p>11)return -1;
  808230:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808234:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  808238:	48 83 f8 0b          	cmp    rax,0xb
  80823c:	7e 0a                	jle    808248 <get_entry+0x7a>
  80823e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808243:	e9 50 02 00 00       	jmp    808498 <get_entry+0x2ca>
            memcpy(nametmp,p,name-p);
  808248:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80824c:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  808250:	89 c2                	mov    edx,eax
  808252:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  808256:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  80825d:	48 89 ce             	mov    rsi,rcx
  808260:	48 89 c7             	mov    rdi,rax
  808263:	e8 a4 0d 00 00       	call   80900c <memcpy>
            cur_dir=dir;
  808268:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80826c:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808270:	48 89 05 e9 45 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc245e9],rax        # 42c860 <cur_dir>
  808277:	48 89 15 ea 45 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc245ea],rdx        # 42c868 <cur_dir+0x8>
  80827e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808282:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808286:	48 89 05 e3 45 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc245e3],rax        # 42c870 <cur_dir+0x10>
  80828d:	48 89 15 e4 45 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc245e4],rdx        # 42c878 <cur_dir+0x18>
            format_name(nametmp);
  808294:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  80829b:	48 89 c7             	mov    rdi,rax
  80829e:	e8 c3 eb ff ff       	call   806e66 <format_name>
            index= find(nametmp);
  8082a3:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  8082aa:	48 89 c7             	mov    rdi,rax
  8082ad:	e8 ce f6 ff ff       	call   807980 <find>
  8082b2:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            if(index==-1)return -1;
  8082b5:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  8082b9:	75 0a                	jne    8082c5 <get_entry+0xf7>
  8082bb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8082c0:	e9 d3 01 00 00       	jmp    808498 <get_entry+0x2ca>
            if(cur_dir.fistCluNum==0)//在根目录
  8082c5:	0f b7 05 ae 45 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc245ae]        # 42c87a <cur_dir+0x1a>
  8082cc:	66 85 c0             	test   ax,ax
  8082cf:	75 31                	jne    808302 <get_entry+0x134>
                dir=root_dir[index];
  8082d1:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8082d4:	48 98                	cdqe   
  8082d6:	48 c1 e0 05          	shl    rax,0x5
  8082da:	48 8d 88 60 88 42 00 	lea    rcx,[rax+0x428860]
  8082e1:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8082e4:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  8082e8:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  8082ec:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  8082f0:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8082f4:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  8082f8:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  8082fc:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  808300:	eb 3a                	jmp    80833c <get_entry+0x16e>
            else//在子目录
                dir=a_clu_of_dir[index%16];
  808302:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808305:	99                   	cdq    
  808306:	c1 ea 1c             	shr    edx,0x1c
  808309:	01 d0                	add    eax,edx
  80830b:	83 e0 0f             	and    eax,0xf
  80830e:	29 d0                	sub    eax,edx
  808310:	48 98                	cdqe   
  808312:	48 c1 e0 05          	shl    rax,0x5
  808316:	48 8d 88 80 c8 42 00 	lea    rcx,[rax+0x42c880]
  80831d:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808320:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808324:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  808328:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  80832c:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808330:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808334:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  808338:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
            p=name+1;
  80833c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808340:	48 83 c0 01          	add    rax,0x1
  808344:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        }
        name++;
  808348:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
    while(*name!='\0')
  80834d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808351:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808354:	84 c0                	test   al,al
  808356:	0f 85 c5 fe ff ff    	jne    808221 <get_entry+0x53>
    }

    //现在就可以开始找文件了
    format_name(p);
  80835c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808360:	48 89 c7             	mov    rdi,rax
  808363:	e8 fe ea ff ff       	call   806e66 <format_name>
    index= find(p);
  808368:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80836c:	48 89 c7             	mov    rdi,rax
  80836f:	e8 0c f6 ff ff       	call   807980 <find>
  808374:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    if(index==-1)return -1;
  808377:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  80837b:	75 0a                	jne    808387 <get_entry+0x1b9>
  80837d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808382:	e9 11 01 00 00       	jmp    808498 <get_entry+0x2ca>
    
    if(cur_dir.fistCluNum==0)//在根目录
  808387:	0f b7 05 ec 44 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc244ec]        # 42c87a <cur_dir+0x1a>
  80838e:	66 85 c0             	test   ax,ax
  808391:	75 31                	jne    8083c4 <get_entry+0x1f6>
        entry=root_dir[index];
  808393:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808396:	48 98                	cdqe   
  808398:	48 c1 e0 05          	shl    rax,0x5
  80839c:	48 8d 88 60 88 42 00 	lea    rcx,[rax+0x428860]
  8083a3:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8083a6:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  8083aa:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  8083ae:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  8083b2:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8083b6:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  8083ba:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  8083be:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  8083c2:	eb 3a                	jmp    8083fe <get_entry+0x230>
    else//在子目录
        entry=a_clu_of_dir[index%16];
  8083c4:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8083c7:	99                   	cdq    
  8083c8:	c1 ea 1c             	shr    edx,0x1c
  8083cb:	01 d0                	add    eax,edx
  8083cd:	83 e0 0f             	and    eax,0xf
  8083d0:	29 d0                	sub    eax,edx
  8083d2:	48 98                	cdqe   
  8083d4:	48 c1 e0 05          	shl    rax,0x5
  8083d8:	48 8d 88 80 c8 42 00 	lea    rcx,[rax+0x42c880]
  8083df:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8083e2:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  8083e6:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  8083ea:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  8083ee:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8083f2:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  8083f6:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  8083fa:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
    ret.id=entry.fistCluNum;
  8083fe:	0f b7 45 aa          	movzx  eax,WORD PTR [rbp-0x56]
  808402:	0f b7 c0             	movzx  eax,ax
  808405:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    args->entry=ret;
  80840b:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808412:	48 8b 8d 30 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd0]
  808419:	48 8b 9d 38 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xc8]
  808420:	48 89 48 28          	mov    QWORD PTR [rax+0x28],rcx
  808424:	48 89 58 30          	mov    QWORD PTR [rax+0x30],rbx
  808428:	48 8b 8d 40 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xc0]
  80842f:	48 8b 9d 48 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xb8]
  808436:	48 89 48 38          	mov    QWORD PTR [rax+0x38],rcx
  80843a:	48 89 58 40          	mov    QWORD PTR [rax+0x40],rbx
  80843e:	48 8b 8d 50 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb0]
  808445:	48 8b 9d 58 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xa8]
  80844c:	48 89 48 48          	mov    QWORD PTR [rax+0x48],rcx
  808450:	48 89 58 50          	mov    QWORD PTR [rax+0x50],rbx
  808454:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  80845b:	48 8b 9d 68 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x98]
  808462:	48 89 48 58          	mov    QWORD PTR [rax+0x58],rcx
  808466:	48 89 58 60          	mov    QWORD PTR [rax+0x60],rbx
  80846a:	48 8b 8d 70 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x90]
  808471:	48 8b 9d 78 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x88]
  808478:	48 89 48 68          	mov    QWORD PTR [rax+0x68],rcx
  80847c:	48 89 58 70          	mov    QWORD PTR [rax+0x70],rbx
  808480:	48 8b 4d 80          	mov    rcx,QWORD PTR [rbp-0x80]
  808484:	48 8b 5d 88          	mov    rbx,QWORD PTR [rbp-0x78]
  808488:	48 89 48 78          	mov    QWORD PTR [rax+0x78],rcx
  80848c:	48 89 98 80 00 00 00 	mov    QWORD PTR [rax+0x80],rbx
    return 0;
  808493:	b8 00 00 00 00       	mov    eax,0x0
}
  808498:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80849c:	c9                   	leave  
  80849d:	c3                   	ret    

000000000080849e <get_fname>:
        dir=strtok(NULL,'/');
    }
    return 0;
}*/
void get_fname(char *path,char *name)
{
  80849e:	f3 0f 1e fa          	endbr64 
  8084a2:	55                   	push   rbp
  8084a3:	48 89 e5             	mov    rbp,rsp
  8084a6:	48 83 ec 20          	sub    rsp,0x20
  8084aa:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8084ae:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    char *prev,*ptr=strtok(path,'/');
  8084b2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8084b6:	be 2f 00 00 00       	mov    esi,0x2f
  8084bb:	48 89 c7             	mov    rdi,rax
  8084be:	e8 8b 0c 00 00       	call   80914e <strtok>
  8084c3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  8084c7:	eb 1b                	jmp    8084e4 <get_fname+0x46>
    {
        prev=ptr;
  8084c9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8084cd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        ptr=strtok(NULL,'/');
  8084d1:	be 2f 00 00 00       	mov    esi,0x2f
  8084d6:	bf 00 00 00 00       	mov    edi,0x0
  8084db:	e8 6e 0c 00 00       	call   80914e <strtok>
  8084e0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  8084e4:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8084e9:	75 de                	jne    8084c9 <get_fname+0x2b>
    }
    strcpy(name,prev);
  8084eb:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8084ef:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8084f3:	48 89 d6             	mov    rsi,rdx
  8084f6:	48 89 c7             	mov    rdi,rax
  8084f9:	e8 0c 0c 00 00       	call   80910a <strcpy>
}
  8084fe:	90                   	nop
  8084ff:	c9                   	leave  
  808500:	c3                   	ret    

0000000000808501 <read_file>:
char buf[1024];
int read_file(driver_args* args)
{
  808501:	f3 0f 1e fa          	endbr64 
  808505:	55                   	push   rbp
  808506:	48 89 e5             	mov    rbp,rsp
  808509:	48 83 ec 60          	sub    rsp,0x60
  80850d:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    int len=args->len;
  808511:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808515:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808518:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int pos=args->pos;
  80851b:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80851f:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808522:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  808525:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808529:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  80852c:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    char* dist=args->dist_addr;
  808530:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808534:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808537:	48 98                	cdqe   
  808539:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int c=len/superblock.bytesPerSec;
  80853d:	0f b7 05 e7 02 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc202e7]        # 42882b <superblock+0xb>
  808544:	0f b7 f0             	movzx  esi,ax
  808547:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80854a:	99                   	cdq    
  80854b:	f7 fe                	idiv   esi
  80854d:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    c+=len%superblock.bytesPerSec?1:0;
  808550:	0f b7 05 d4 02 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc202d4]        # 42882b <superblock+0xb>
  808557:	0f b7 c8             	movzx  ecx,ax
  80855a:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80855d:	99                   	cdq    
  80855e:	f7 f9                	idiv   ecx
  808560:	89 d0                	mov    eax,edx
  808562:	85 c0                	test   eax,eax
  808564:	0f 95 c0             	setne  al
  808567:	0f b6 c0             	movzx  eax,al
  80856a:	01 45 dc             	add    DWORD PTR [rbp-0x24],eax
    //printf("[fs]%d secs to sys_read.\n",c);
    int n=0;
  80856d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808574:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  808578:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    int mpos=pos/superblock.bytesPerSec;
  80857c:	0f b7 05 a8 02 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc202a8]        # 42882b <superblock+0xb>
  808583:	0f b7 f8             	movzx  edi,ax
  808586:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808589:	99                   	cdq    
  80858a:	f7 ff                	idiv   edi
  80858c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  80858f:	eb 16                	jmp    8085a7 <read_file+0xa6>
    {
         clu=fat[clu];
  808591:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808595:	48 98                	cdqe   
  808597:	0f b7 84 00 80 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42ca80]
  80859e:	00 
  80859f:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  8085a3:	83 6d e4 01          	sub    DWORD PTR [rbp-0x1c],0x1
  8085a7:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  8085ac:	77 06                	ja     8085b4 <read_file+0xb3>
  8085ae:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  8085b2:	7f dd                	jg     808591 <read_file+0x90>
    }
    if(mpos>0)return -1;//读取位置超出范围
  8085b4:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  8085b8:	7e 0a                	jle    8085c4 <read_file+0xc3>
  8085ba:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8085bf:	e9 cd 00 00 00       	jmp    808691 <read_file+0x190>
    pos%=superblock.bytesPerSec;
  8085c4:	0f b7 05 60 02 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20260]        # 42882b <superblock+0xb>
  8085cb:	0f b7 c8             	movzx  ecx,ax
  8085ce:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8085d1:	99                   	cdq    
  8085d2:	f7 f9                	idiv   ecx
  8085d4:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
    int block_size=superblock.secPerClu*superblock.bytesPerSec;
  8085d7:	0f b6 05 4f 02 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2024f]        # 42882d <superblock+0xd>
  8085de:	0f b6 d0             	movzx  edx,al
  8085e1:	0f b7 05 43 02 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20243]        # 42882b <superblock+0xb>
  8085e8:	0f b7 c0             	movzx  eax,ax
  8085eb:	0f af c2             	imul   eax,edx
  8085ee:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    while(n<c)
  8085f1:	e9 89 00 00 00       	jmp    80867f <read_file+0x17e>
    {
        read_sec(buf,clu+clu_sec_balance,superblock.secPerClu);
  8085f6:	0f b6 05 30 02 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20230]        # 42882d <superblock+0xd>
  8085fd:	0f b6 c0             	movzx  eax,al
  808600:	0f b7 4d ea          	movzx  ecx,WORD PTR [rbp-0x16]
  808604:	8b 15 76 15 00 00    	mov    edx,DWORD PTR [rip+0x1576]        # 809b80 <clu_sec_balance>
  80860a:	01 d1                	add    ecx,edx
  80860c:	89 c2                	mov    edx,eax
  80860e:	89 ce                	mov    esi,ecx
  808610:	bf a0 0a 43 00       	mov    edi,0x430aa0
  808615:	e8 98 f0 ff ff       	call   8076b2 <read_sec>
        //printf("%x+%x\n",buf,pos);
        int cplen=block_size-pos>len?len:block_size-pos;
  80861a:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  80861d:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  808620:	8b 55 e0             	mov    edx,DWORD PTR [rbp-0x20]
  808623:	39 c2                	cmp    edx,eax
  808625:	0f 4e c2             	cmovle eax,edx
  808628:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
        memcpy(dist,buf+pos,cplen);
  80862b:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80862e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808631:	48 98                	cdqe   
  808633:	48 8d 88 a0 0a 43 00 	lea    rcx,[rax+0x430aa0]
  80863a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80863e:	48 89 ce             	mov    rsi,rcx
  808641:	48 89 c7             	mov    rdi,rax
  808644:	e8 c3 09 00 00       	call   80900c <memcpy>
        n++;
  808649:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        dist+=block_size-pos;
  80864d:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  808650:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  808653:	48 98                	cdqe   
  808655:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        if(pos>0)pos=0;
  808659:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80865d:	7e 07                	jle    808666 <read_file+0x165>
  80865f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        clu=fat[clu];
  808666:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  80866a:	48 98                	cdqe   
  80866c:	0f b7 84 00 80 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42ca80]
  808673:	00 
  808674:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  808678:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  80867d:	77 0e                	ja     80868d <read_file+0x18c>
    while(n<c)
  80867f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808682:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  808685:	0f 8c 6b ff ff ff    	jl     8085f6 <read_file+0xf5>
  80868b:	eb 01                	jmp    80868e <read_file+0x18d>
        if(clu>=FAT_EOF)break;
  80868d:	90                   	nop
    }
    return n;
  80868e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
}
  808691:	c9                   	leave  
  808692:	c3                   	ret    

0000000000808693 <write_file>:
int write_file(driver_args* args)
{
  808693:	f3 0f 1e fa          	endbr64 
  808697:	55                   	push   rbp
  808698:	48 89 e5             	mov    rbp,rsp
  80869b:	48 83 ec 50          	sub    rsp,0x50
  80869f:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    int len=args->len;
  8086a3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8086a7:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8086aa:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    int pos=args->pos;
  8086ad:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8086b1:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8086b4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  8086b7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8086bb:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8086be:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    char* src=args->src_addr;
  8086c2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8086c6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8086c9:	48 98                	cdqe   
  8086cb:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    pos/=superblock.bytesPerSec;
  8086cf:	0f b7 05 55 01 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20155]        # 42882b <superblock+0xb>
  8086d6:	0f b7 f0             	movzx  esi,ax
  8086d9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8086dc:	99                   	cdq    
  8086dd:	f7 fe                	idiv   esi
  8086df:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=len/512+len%512?1:0;
  8086e2:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8086e5:	8d 90 ff 01 00 00    	lea    edx,[rax+0x1ff]
  8086eb:	85 c0                	test   eax,eax
  8086ed:	0f 48 c2             	cmovs  eax,edx
  8086f0:	c1 f8 09             	sar    eax,0x9
  8086f3:	89 c1                	mov    ecx,eax
  8086f5:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8086f8:	99                   	cdq    
  8086f9:	c1 ea 17             	shr    edx,0x17
  8086fc:	01 d0                	add    eax,edx
  8086fe:	25 ff 01 00 00       	and    eax,0x1ff
  808703:	29 d0                	sub    eax,edx
  808705:	01 c8                	add    eax,ecx
  808707:	85 c0                	test   eax,eax
  808709:	0f 95 c0             	setne  al
  80870c:	0f b6 c0             	movzx  eax,al
  80870f:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int n=0;
  808712:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808719:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  80871d:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&pos>0;pos--,clu=fat[clu]);
  808721:	eb 16                	jmp    808739 <write_file+0xa6>
  808723:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  808727:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  80872b:	48 98                	cdqe   
  80872d:	0f b7 84 00 80 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42ca80]
  808734:	00 
  808735:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  808739:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  80873e:	77 06                	ja     808746 <write_file+0xb3>
  808740:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808744:	7f dd                	jg     808723 <write_file+0x90>
    if(pos>0)return -1;//读取位置超出范围
  808746:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80874a:	7e 52                	jle    80879e <write_file+0x10b>
  80874c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808751:	eb 59                	jmp    8087ac <write_file+0x119>
    while(n<c)
    {
        write_sec(src,clu+clu_sec_balance,1);
  808753:	0f b7 55 ea          	movzx  edx,WORD PTR [rbp-0x16]
  808757:	8b 05 23 14 00 00    	mov    eax,DWORD PTR [rip+0x1423]        # 809b80 <clu_sec_balance>
  80875d:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  808760:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808764:	ba 01 00 00 00       	mov    edx,0x1
  808769:	89 ce                	mov    esi,ecx
  80876b:	48 89 c7             	mov    rdi,rax
  80876e:	e8 4b e8 ff ff       	call   806fbe <write_sec>
        n++;
  808773:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        src+=superblock.bytesPerSec;
  808777:	0f b7 05 ad 00 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc200ad]        # 42882b <superblock+0xb>
  80877e:	0f b7 c0             	movzx  eax,ax
  808781:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        clu=fat[clu];
  808785:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808789:	48 98                	cdqe   
  80878b:	0f b7 84 00 80 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42ca80]
  808792:	00 
  808793:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  808797:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  80879c:	77 0a                	ja     8087a8 <write_file+0x115>
    while(n<c)
  80879e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8087a1:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  8087a4:	7c ad                	jl     808753 <write_file+0xc0>
  8087a6:	eb 01                	jmp    8087a9 <write_file+0x116>
        if(clu>=FAT_EOF)break;
  8087a8:	90                   	nop
    }
    return n;
  8087a9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    
  8087ac:	c9                   	leave  
  8087ad:	c3                   	ret    

00000000008087ae <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  8087ae:	f3 0f 1e fa          	endbr64 
  8087b2:	55                   	push   rbp
  8087b3:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  8087b6:	48 8b 05 f3 86 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc286f3]        # 430eb0 <vpage_base>
  8087bd:	48 05 a0 00 00 00    	add    rax,0xa0
  8087c3:	48 89 05 e6 86 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc286e6],rax        # 430eb0 <vpage_base>
    page_boffset+=SCREEN_W*2;
  8087ca:	8b 05 e8 86 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc286e8]        # 430eb8 <page_boffset>
  8087d0:	05 a0 00 00 00       	add    eax,0xa0
  8087d5:	89 05 dd 86 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc286dd],eax        # 430eb8 <page_boffset>
    if(vpage_base>=video_end)
  8087db:	48 8b 15 ce 86 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc286ce]        # 430eb0 <vpage_base>
  8087e2:	48 8b 05 bf 86 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc286bf]        # 430ea8 <video_end>
  8087e9:	48 39 c2             	cmp    rdx,rax
  8087ec:	72 0e                	jb     8087fc <scrdown+0x4e>
        vpage_base=video_base;
  8087ee:	48 8b 05 ab 86 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc286ab]        # 430ea0 <video_base>
  8087f5:	48 89 05 b4 86 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc286b4],rax        # 430eb0 <vpage_base>
    set_origin();
  8087fc:	b8 00 00 00 00       	mov    eax,0x0
  808801:	e8 6a 00 00 00       	call   808870 <set_origin>
}
  808806:	90                   	nop
  808807:	5d                   	pop    rbp
  808808:	c3                   	ret    

0000000000808809 <scrup>:
void scrup()
{
  808809:	f3 0f 1e fa          	endbr64 
  80880d:	55                   	push   rbp
  80880e:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  808811:	8b 05 a1 86 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc286a1]        # 430eb8 <page_boffset>
  808817:	85 c0                	test   eax,eax
  808819:	75 24                	jne    80883f <scrup+0x36>
    {
        page_boffset=0;
  80881b:	c7 05 93 86 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28693],0x0        # 430eb8 <page_boffset>
  808822:	00 00 00 
        vpage_base=video_base;
  808825:	48 8b 05 74 86 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc28674]        # 430ea0 <video_base>
  80882c:	48 89 05 7d 86 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2867d],rax        # 430eb0 <vpage_base>
        set_origin();
  808833:	b8 00 00 00 00       	mov    eax,0x0
  808838:	e8 33 00 00 00       	call   808870 <set_origin>
        return;
  80883d:	eb 2f                	jmp    80886e <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  80883f:	48 8b 05 6a 86 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2866a]        # 430eb0 <vpage_base>
  808846:	48 2d a0 00 00 00    	sub    rax,0xa0
  80884c:	48 89 05 5d 86 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2865d],rax        # 430eb0 <vpage_base>
    page_boffset-=SCREEN_W*2;
  808853:	8b 05 5f 86 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2865f]        # 430eb8 <page_boffset>
  808859:	2d a0 00 00 00       	sub    eax,0xa0
  80885e:	89 05 54 86 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28654],eax        # 430eb8 <page_boffset>
    set_origin();
  808864:	b8 00 00 00 00       	mov    eax,0x0
  808869:	e8 02 00 00 00       	call   808870 <set_origin>
}
  80886e:	5d                   	pop    rbp
  80886f:	c3                   	ret    

0000000000808870 <set_origin>:
void set_origin(void)
{
  808870:	f3 0f 1e fa          	endbr64 
  808874:	55                   	push   rbp
  808875:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  808878:	fa                   	cli    
    outb(port_reg_index,12);
  808879:	8b 05 49 86 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28649]        # 430ec8 <port_reg_index>
  80887f:	0f b7 c0             	movzx  eax,ax
  808882:	be 0c 00 00 00       	mov    esi,0xc
  808887:	89 c7                	mov    edi,eax
  808889:	e8 02 c3 ff ff       	call   804b90 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  80888e:	8b 05 24 86 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28624]        # 430eb8 <page_boffset>
  808894:	c1 e8 09             	shr    eax,0x9
  808897:	0f b6 d0             	movzx  edx,al
  80889a:	8b 05 2c 86 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2862c]        # 430ecc <port_reg_v>
  8088a0:	0f b7 c0             	movzx  eax,ax
  8088a3:	89 d6                	mov    esi,edx
  8088a5:	89 c7                	mov    edi,eax
  8088a7:	e8 e4 c2 ff ff       	call   804b90 <outb>
    outb(port_reg_index,13);
  8088ac:	8b 05 16 86 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28616]        # 430ec8 <port_reg_index>
  8088b2:	0f b7 c0             	movzx  eax,ax
  8088b5:	be 0d 00 00 00       	mov    esi,0xd
  8088ba:	89 c7                	mov    edi,eax
  8088bc:	e8 cf c2 ff ff       	call   804b90 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  8088c1:	8b 05 f1 85 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc285f1]        # 430eb8 <page_boffset>
  8088c7:	d1 e8                	shr    eax,1
  8088c9:	0f b6 d0             	movzx  edx,al
  8088cc:	8b 05 fa 85 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc285fa]        # 430ecc <port_reg_v>
  8088d2:	0f b7 c0             	movzx  eax,ax
  8088d5:	89 d6                	mov    esi,edx
  8088d7:	89 c7                	mov    edi,eax
  8088d9:	e8 b2 c2 ff ff       	call   804b90 <outb>
    asm volatile("sti");
  8088de:	fb                   	sti    

}
  8088df:	90                   	nop
  8088e0:	5d                   	pop    rbp
  8088e1:	c3                   	ret    

00000000008088e2 <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  8088e2:	f3 0f 1e fa          	endbr64 
  8088e6:	55                   	push   rbp
  8088e7:	48 89 e5             	mov    rbp,rsp
  8088ea:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  8088ee:	be 08 a7 80 00       	mov    esi,0x80a708
  8088f3:	bf b4 a5 80 00       	mov    edi,0x80a5b4
  8088f8:	e8 0d 08 00 00       	call   80910a <strcpy>
    strcpy(dev_stdout.name,"stdout");
  8088fd:	be 0d a7 80 00       	mov    esi,0x80a70d
  808902:	bf 74 a6 80 00       	mov    edi,0x80a674
  808907:	e8 fe 07 00 00       	call   80910a <strcpy>
    reg_driver(&drv_tty);
  80890c:	bf 00 a5 80 00       	mov    edi,0x80a500
  808911:	e8 5a a5 ff ff       	call   802e70 <reg_driver>
    reg_device(&dev_tty);
  808916:	bf a0 a5 80 00       	mov    edi,0x80a5a0
  80891b:	e8 68 a2 ff ff       	call   802b88 <reg_device>
    reg_device(&dev_stdout);
  808920:	bf 60 a6 80 00       	mov    edi,0x80a660
  808925:	e8 5e a2 ff ff       	call   802b88 <reg_device>
    unsigned char *vp=0x20000;
  80892a:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  808931:	00 
    if(*vp==0x7)
  808932:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808936:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808939:	3c 07                	cmp    al,0x7
  80893b:	75 36                	jne    808973 <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  80893d:	c7 05 75 85 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28575],0x0        # 430ebc <video_mode>
  808944:	00 00 00 
        video_base=0xb0000;
  808947:	48 c7 05 4e 85 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2854e],0xb0000        # 430ea0 <video_base>
  80894e:	00 00 0b 00 
        video_end=0xb8000-1;
  808952:	48 c7 05 4b 85 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2854b],0xb7fff        # 430ea8 <video_end>
  808959:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  80895d:	c7 05 61 85 c2 ff b4 	mov    DWORD PTR [rip+0xffffffffffc28561],0x3b4        # 430ec8 <port_reg_index>
  808964:	03 00 00 
        port_reg_v=0x3b5;
  808967:	c7 05 5b 85 c2 ff b5 	mov    DWORD PTR [rip+0xffffffffffc2855b],0x3b5        # 430ecc <port_reg_v>
  80896e:	03 00 00 
  808971:	eb 61                	jmp    8089d4 <init_tty+0xf2>
    }else if(*vp<=0x3)
  808973:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808977:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80897a:	3c 03                	cmp    al,0x3
  80897c:	77 36                	ja     8089b4 <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  80897e:	c7 05 34 85 c2 ff 01 	mov    DWORD PTR [rip+0xffffffffffc28534],0x1        # 430ebc <video_mode>
  808985:	00 00 00 
        video_base=0xb8000;
  808988:	48 c7 05 0d 85 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2850d],0xb8000        # 430ea0 <video_base>
  80898f:	00 80 0b 00 
        video_end=0xc0000-1;
  808993:	48 c7 05 0a 85 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2850a],0xbffff        # 430ea8 <video_end>
  80899a:	ff ff 0b 00 
        port_reg_index=0x3d4;
  80899e:	c7 05 20 85 c2 ff d4 	mov    DWORD PTR [rip+0xffffffffffc28520],0x3d4        # 430ec8 <port_reg_index>
  8089a5:	03 00 00 
        port_reg_v=0x3d5;
  8089a8:	c7 05 1a 85 c2 ff d5 	mov    DWORD PTR [rip+0xffffffffffc2851a],0x3d5        # 430ecc <port_reg_v>
  8089af:	03 00 00 
  8089b2:	eb 20                	jmp    8089d4 <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  8089b4:	c7 05 fe 84 c2 ff 02 	mov    DWORD PTR [rip+0xffffffffffc284fe],0x2        # 430ebc <video_mode>
  8089bb:	00 00 00 
        video_base=0xa0000;
  8089be:	48 c7 05 d7 84 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc284d7],0xa0000        # 430ea0 <video_base>
  8089c5:	00 00 0a 00 
        video_end=0xb0000-1;
  8089c9:	48 c7 05 d4 84 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc284d4],0xaffff        # 430ea8 <video_end>
  8089d0:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  8089d4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8089d8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8089db:	3c 01                	cmp    al,0x1
  8089dd:	77 0f                	ja     8089ee <init_tty+0x10c>
  8089df:	c7 05 db 84 c2 ff 28 	mov    DWORD PTR [rip+0xffffffffffc284db],0x28        # 430ec4 <line_chs>
  8089e6:	00 00 00 
  8089e9:	e9 91 00 00 00       	jmp    808a7f <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  8089ee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8089f2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8089f5:	3c 03                	cmp    al,0x3
  8089f7:	76 0b                	jbe    808a04 <init_tty+0x122>
  8089f9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8089fd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808a00:	3c 07                	cmp    al,0x7
  808a02:	75 0c                	jne    808a10 <init_tty+0x12e>
  808a04:	c7 05 b6 84 c2 ff 50 	mov    DWORD PTR [rip+0xffffffffffc284b6],0x50        # 430ec4 <line_chs>
  808a0b:	00 00 00 
  808a0e:	eb 6f                	jmp    808a7f <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  808a10:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808a14:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808a17:	3c 05                	cmp    al,0x5
  808a19:	76 16                	jbe    808a31 <init_tty+0x14f>
  808a1b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808a1f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808a22:	3c 09                	cmp    al,0x9
  808a24:	74 0b                	je     808a31 <init_tty+0x14f>
  808a26:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808a2a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808a2d:	3c 0d                	cmp    al,0xd
  808a2f:	75 0c                	jne    808a3d <init_tty+0x15b>
  808a31:	c7 05 89 84 c2 ff 40 	mov    DWORD PTR [rip+0xffffffffffc28489],0x140        # 430ec4 <line_chs>
  808a38:	01 00 00 
  808a3b:	eb 42                	jmp    808a7f <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  808a3d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808a41:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808a44:	3c 06                	cmp    al,0x6
  808a46:	74 16                	je     808a5e <init_tty+0x17c>
  808a48:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808a4c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808a4f:	3c 0a                	cmp    al,0xa
  808a51:	74 0b                	je     808a5e <init_tty+0x17c>
  808a53:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808a57:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808a5a:	3c 0d                	cmp    al,0xd
  808a5c:	76 0c                	jbe    808a6a <init_tty+0x188>
  808a5e:	c7 05 5c 84 c2 ff 80 	mov    DWORD PTR [rip+0xffffffffffc2845c],0x280        # 430ec4 <line_chs>
  808a65:	02 00 00 
  808a68:	eb 15                	jmp    808a7f <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  808a6a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808a6e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808a71:	3c 08                	cmp    al,0x8
  808a73:	75 0a                	jne    808a7f <init_tty+0x19d>
  808a75:	c7 05 45 84 c2 ff a0 	mov    DWORD PTR [rip+0xffffffffffc28445],0xa0        # 430ec4 <line_chs>
  808a7c:	00 00 00 
    switch (*vp)
  808a7f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808a83:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808a86:	0f b6 c0             	movzx  eax,al
  808a89:	83 f8 14             	cmp    eax,0x14
  808a8c:	77 61                	ja     808aef <init_tty+0x20d>
  808a8e:	89 c0                	mov    eax,eax
  808a90:	48 8b 04 c5 18 a7 80 	mov    rax,QWORD PTR [rax*8+0x80a718]
  808a97:	00 
  808a98:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  808a9b:	c7 05 2b 84 c2 ff e8 	mov    DWORD PTR [rip+0xffffffffffc2842b],0x3e8        # 430ed0 <vpage_size>
  808aa2:	03 00 00 
  808aa5:	eb 49                	jmp    808af0 <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  808aa7:	c7 05 1f 84 c2 ff d0 	mov    DWORD PTR [rip+0xffffffffffc2841f],0x7d0        # 430ed0 <vpage_size>
  808aae:	07 00 00 
  808ab1:	eb 3d                	jmp    808af0 <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  808ab3:	c7 05 13 84 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28413],0xfa00        # 430ed0 <vpage_size>
  808aba:	fa 00 00 
  808abd:	eb 31                	jmp    808af0 <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  808abf:	c7 05 07 84 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28407],0x1f400        # 430ed0 <vpage_size>
  808ac6:	f4 01 00 
  808ac9:	eb 25                	jmp    808af0 <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  808acb:	c7 05 fb 83 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc283fb],0x7d00        # 430ed0 <vpage_size>
  808ad2:	7d 00 00 
  808ad5:	eb 19                	jmp    808af0 <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  808ad7:	c7 05 ef 83 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc283ef],0x36b00        # 430ed0 <vpage_size>
  808ade:	6b 03 00 
  808ae1:	eb 0d                	jmp    808af0 <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  808ae3:	c7 05 e3 83 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc283e3],0x4b000        # 430ed0 <vpage_size>
  808aea:	b0 04 00 
  808aed:	eb 01                	jmp    808af0 <init_tty+0x20e>
    default:
        break;
  808aef:	90                   	nop
    }
    m_ptr=video_base;
  808af0:	48 8b 05 a9 83 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc283a9]        # 430ea0 <video_base>
  808af7:	48 89 05 8a 10 00 00 	mov    QWORD PTR [rip+0x108a],rax        # 809b88 <m_ptr>
    page_boffset=0;
  808afe:	c7 05 b0 83 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc283b0],0x0        # 430eb8 <page_boffset>
  808b05:	00 00 00 
    vpage_base=video_base;
  808b08:	48 8b 05 91 83 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc28391]        # 430ea0 <video_base>
  808b0f:	48 89 05 9a 83 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2839a],rax        # 430eb0 <vpage_base>
    vp++;
  808b16:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  808b1b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b1f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b22:	0f b6 c0             	movzx  eax,al
  808b25:	89 05 95 83 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28395],eax        # 430ec0 <vpage>
    vp++;
  808b2b:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  808b30:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b34:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808b38:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808b3c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b3f:	0f b6 c0             	movzx  eax,al
  808b42:	89 05 94 83 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28394],eax        # 430edc <stline>
    endline=*vp++;
  808b48:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b4c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808b50:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808b54:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b57:	0f b6 c0             	movzx  eax,al
  808b5a:	89 05 80 83 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28380],eax        # 430ee0 <endline>
    videoy=*vp++;
  808b60:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b64:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808b68:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808b6c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b6f:	0f b6 c0             	movzx  eax,al
  808b72:	89 05 60 83 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28360],eax        # 430ed8 <videoy>
    videox=*vp;
  808b78:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b7c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b7f:	0f b6 c0             	movzx  eax,al
  808b82:	89 05 4c 83 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2834c],eax        # 430ed4 <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  808b88:	90                   	nop
  808b89:	c9                   	leave  
  808b8a:	c3                   	ret    

0000000000808b8b <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  808b8b:	f3 0f 1e fa          	endbr64 
  808b8f:	55                   	push   rbp
  808b90:	48 89 e5             	mov    rbp,rsp
  808b93:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  808b97:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808b9b:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808b9e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  808ba1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808ba4:	05 00 c0 05 00       	add    eax,0x5c000
  808ba9:	01 c0                	add    eax,eax
  808bab:	48 98                	cdqe   
  808bad:	48 89 05 d4 0f 00 00 	mov    QWORD PTR [rip+0xfd4],rax        # 809b88 <m_ptr>
}
  808bb4:	90                   	nop
  808bb5:	5d                   	pop    rbp
  808bb6:	c3                   	ret    

0000000000808bb7 <tell_monitor>:
int tell_monitor()
{
  808bb7:	f3 0f 1e fa          	endbr64 
  808bbb:	55                   	push   rbp
  808bbc:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  808bbf:	48 8b 05 c2 0f 00 00 	mov    rax,QWORD PTR [rip+0xfc2]        # 809b88 <m_ptr>
  808bc6:	48 8b 15 d3 82 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc282d3]        # 430ea0 <video_base>
  808bcd:	48 29 d0             	sub    rax,rdx
  808bd0:	48 89 c2             	mov    rdx,rax
  808bd3:	48 c1 ea 3f          	shr    rdx,0x3f
  808bd7:	48 01 d0             	add    rax,rdx
  808bda:	48 d1 f8             	sar    rax,1
}
  808bdd:	5d                   	pop    rbp
  808bde:	c3                   	ret    

0000000000808bdf <del_ch>:
void del_ch()
{
  808bdf:	f3 0f 1e fa          	endbr64 
  808be3:	55                   	push   rbp
  808be4:	48 89 e5             	mov    rbp,rsp
  808be7:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  808bee:	48 8b 05 93 0f 00 00 	mov    rax,QWORD PTR [rip+0xf93]        # 809b88 <m_ptr>
  808bf5:	48 83 e8 02          	sub    rax,0x2
  808bf9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  808bfd:	b8 00 00 00 00       	mov    eax,0x0
  808c02:	e8 b0 ff ff ff       	call   808bb7 <tell_monitor>
  808c07:	89 c2                	mov    edx,eax
  808c09:	48 63 c2             	movsxd rax,edx
  808c0c:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  808c13:	48 c1 e8 20          	shr    rax,0x20
  808c17:	c1 f8 05             	sar    eax,0x5
  808c1a:	89 d1                	mov    ecx,edx
  808c1c:	c1 f9 1f             	sar    ecx,0x1f
  808c1f:	29 c8                	sub    eax,ecx
  808c21:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  808c24:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  808c27:	89 c8                	mov    eax,ecx
  808c29:	c1 e0 02             	shl    eax,0x2
  808c2c:	01 c8                	add    eax,ecx
  808c2e:	c1 e0 04             	shl    eax,0x4
  808c31:	29 c2                	sub    edx,eax
  808c33:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  808c36:	eb 17                	jmp    808c4f <del_ch+0x70>
    {
        *p=*(p+2);
  808c38:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c3c:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  808c40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c44:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  808c46:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  808c4b:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808c4f:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  808c53:	7e e3                	jle    808c38 <del_ch+0x59>
    }
    driver_args args= {
  808c55:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  808c5c:	b8 00 00 00 00       	mov    eax,0x0
  808c61:	b9 18 00 00 00       	mov    ecx,0x18
  808c66:	48 89 d7             	mov    rdi,rdx
  808c69:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  808c6c:	b8 00 00 00 00       	mov    eax,0x0
  808c71:	e8 41 ff ff ff       	call   808bb7 <tell_monitor>
  808c76:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  808c79:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  808c7f:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  808c86:	48 89 c7             	mov    rdi,rax
  808c89:	e8 fd fe ff ff       	call   808b8b <seek_tty>
    set_cur();
  808c8e:	b8 00 00 00 00       	mov    eax,0x0
  808c93:	e8 03 00 00 00       	call   808c9b <set_cur>
}
  808c98:	90                   	nop
  808c99:	c9                   	leave  
  808c9a:	c3                   	ret    

0000000000808c9b <set_cur>:
void set_cur()
{
  808c9b:	f3 0f 1e fa          	endbr64 
  808c9f:	55                   	push   rbp
  808ca0:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  808ca3:	fa                   	cli    
    outb(port_reg_index,14);
  808ca4:	8b 05 1e 82 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2821e]        # 430ec8 <port_reg_index>
  808caa:	0f b7 c0             	movzx  eax,ax
  808cad:	be 0e 00 00 00       	mov    esi,0xe
  808cb2:	89 c7                	mov    edi,eax
  808cb4:	e8 d7 be ff ff       	call   804b90 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  808cb9:	48 8b 05 c8 0e 00 00 	mov    rax,QWORD PTR [rip+0xec8]        # 809b88 <m_ptr>
  808cc0:	48 8b 15 d9 81 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc281d9]        # 430ea0 <video_base>
  808cc7:	48 29 d0             	sub    rax,rdx
  808cca:	48 c1 f8 09          	sar    rax,0x9
  808cce:	0f b6 d0             	movzx  edx,al
  808cd1:	8b 05 f5 81 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc281f5]        # 430ecc <port_reg_v>
  808cd7:	0f b7 c0             	movzx  eax,ax
  808cda:	89 d6                	mov    esi,edx
  808cdc:	89 c7                	mov    edi,eax
  808cde:	e8 ad be ff ff       	call   804b90 <outb>
    outb(port_reg_index,15);
  808ce3:	8b 05 df 81 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc281df]        # 430ec8 <port_reg_index>
  808ce9:	0f b7 c0             	movzx  eax,ax
  808cec:	be 0f 00 00 00       	mov    esi,0xf
  808cf1:	89 c7                	mov    edi,eax
  808cf3:	e8 98 be ff ff       	call   804b90 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  808cf8:	48 8b 05 89 0e 00 00 	mov    rax,QWORD PTR [rip+0xe89]        # 809b88 <m_ptr>
  808cff:	48 8b 15 9a 81 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc2819a]        # 430ea0 <video_base>
  808d06:	48 29 d0             	sub    rax,rdx
  808d09:	48 d1 f8             	sar    rax,1
  808d0c:	0f b6 d0             	movzx  edx,al
  808d0f:	8b 05 b7 81 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc281b7]        # 430ecc <port_reg_v>
  808d15:	0f b7 c0             	movzx  eax,ax
  808d18:	89 d6                	mov    esi,edx
  808d1a:	89 c7                	mov    edi,eax
  808d1c:	e8 6f be ff ff       	call   804b90 <outb>
    asm volatile("sti");
  808d21:	fb                   	sti    
}
  808d22:	90                   	nop
  808d23:	5d                   	pop    rbp
  808d24:	c3                   	ret    

0000000000808d25 <read_tty>:

int read_tty(driver_args *args)
{
  808d25:	f3 0f 1e fa          	endbr64 
  808d29:	55                   	push   rbp
  808d2a:	48 89 e5             	mov    rbp,rsp
  808d2d:	48 83 ec 20          	sub    rsp,0x20
  808d31:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  808d35:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d39:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808d3c:	48 98                	cdqe   
  808d3e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  808d42:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d46:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808d49:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  808d4c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  808d53:	eb 4a                	jmp    808d9f <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  808d55:	48 8b 15 2c 0e 00 00 	mov    rdx,QWORD PTR [rip+0xe2c]        # 809b88 <m_ptr>
  808d5c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d60:	48 8d 48 01          	lea    rcx,[rax+0x1]
  808d64:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  808d68:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  808d6b:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  808d6d:	48 8b 05 14 0e 00 00 	mov    rax,QWORD PTR [rip+0xe14]        # 809b88 <m_ptr>
  808d74:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  808d7a:	75 0d                	jne    808d89 <read_tty+0x64>
  808d7c:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808d80:	7e 07                	jle    808d89 <read_tty+0x64>
        {
            return 1;//读到尾了
  808d82:	b8 01 00 00 00       	mov    eax,0x1
  808d87:	eb 2d                	jmp    808db6 <read_tty+0x91>
        }
        m_ptr+=2;
  808d89:	48 8b 05 f8 0d 00 00 	mov    rax,QWORD PTR [rip+0xdf8]        # 809b88 <m_ptr>
  808d90:	48 83 c0 02          	add    rax,0x2
  808d94:	48 89 05 ed 0d 00 00 	mov    QWORD PTR [rip+0xded],rax        # 809b88 <m_ptr>
    for(int i=0;i<len;i++)
  808d9b:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808d9f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808da2:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  808da5:	7c ae                	jl     808d55 <read_tty+0x30>
    }
    set_cur();
  808da7:	b8 00 00 00 00       	mov    eax,0x0
  808dac:	e8 ea fe ff ff       	call   808c9b <set_cur>
    return 0;
  808db1:	b8 00 00 00 00       	mov    eax,0x0
}
  808db6:	c9                   	leave  
  808db7:	c3                   	ret    

0000000000808db8 <write_tty>:
int write_tty(driver_args *args)
{
  808db8:	f3 0f 1e fa          	endbr64 
  808dbc:	55                   	push   rbp
  808dbd:	48 89 e5             	mov    rbp,rsp
  808dc0:	48 83 ec 30          	sub    rsp,0x30
  808dc4:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  808dc8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808dcc:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808dcf:	48 98                	cdqe   
  808dd1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  808dd5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808dd9:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808ddc:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  808ddf:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  808de6:	e9 0b 01 00 00       	jmp    808ef6 <write_tty+0x13e>
    {
        if(*src=='\n')
  808deb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808def:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808df2:	3c 0a                	cmp    al,0xa
  808df4:	75 50                	jne    808e46 <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  808df6:	48 8b 05 8b 0d 00 00 	mov    rax,QWORD PTR [rip+0xd8b]        # 809b88 <m_ptr>
  808dfd:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  808e03:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  808e06:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808e09:	89 c2                	mov    edx,eax
  808e0b:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  808e10:	48 0f af c2          	imul   rax,rdx
  808e14:	48 c1 e8 20          	shr    rax,0x20
  808e18:	c1 e8 07             	shr    eax,0x7
  808e1b:	8d 50 01             	lea    edx,[rax+0x1]
  808e1e:	89 d0                	mov    eax,edx
  808e20:	c1 e0 02             	shl    eax,0x2
  808e23:	01 d0                	add    eax,edx
  808e25:	c1 e0 05             	shl    eax,0x5
  808e28:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  808e2b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808e2e:	05 00 80 0b 00       	add    eax,0xb8000
  808e33:	89 c0                	mov    eax,eax
  808e35:	48 89 05 4c 0d 00 00 	mov    QWORD PTR [rip+0xd4c],rax        # 809b88 <m_ptr>
            src++;
  808e3c:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  808e41:	e9 ac 00 00 00       	jmp    808ef2 <write_tty+0x13a>
        }else if(*src=='\0')
  808e46:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e4a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e4d:	84 c0                	test   al,al
  808e4f:	0f 84 af 00 00 00    	je     808f04 <write_tty+0x14c>
            break;
        if(*src=='\b')
  808e55:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e59:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e5c:	3c 08                	cmp    al,0x8
  808e5e:	75 1e                	jne    808e7e <write_tty+0xc6>
        {
            m_ptr-=2;
  808e60:	48 8b 05 21 0d 00 00 	mov    rax,QWORD PTR [rip+0xd21]        # 809b88 <m_ptr>
  808e67:	48 83 e8 02          	sub    rax,0x2
  808e6b:	48 89 05 16 0d 00 00 	mov    QWORD PTR [rip+0xd16],rax        # 809b88 <m_ptr>
            *m_ptr=0;
  808e72:	48 8b 05 0f 0d 00 00 	mov    rax,QWORD PTR [rip+0xd0f]        # 809b88 <m_ptr>
  808e79:	c6 00 00             	mov    BYTE PTR [rax],0x0
  808e7c:	eb 3e                	jmp    808ebc <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  808e7e:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808e82:	48 8d 42 01          	lea    rax,[rdx+0x1]
  808e86:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  808e8a:	48 8b 05 f7 0c 00 00 	mov    rax,QWORD PTR [rip+0xcf7]        # 809b88 <m_ptr>
  808e91:	48 8d 48 01          	lea    rcx,[rax+0x1]
  808e95:	48 89 0d ec 0c 00 00 	mov    QWORD PTR [rip+0xcec],rcx        # 809b88 <m_ptr>
  808e9c:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  808e9f:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  808ea1:	48 8b 05 e0 0c 00 00 	mov    rax,QWORD PTR [rip+0xce0]        # 809b88 <m_ptr>
  808ea8:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808eac:	48 89 15 d5 0c 00 00 	mov    QWORD PTR [rip+0xcd5],rdx        # 809b88 <m_ptr>
  808eb3:	0f b6 15 d6 0c 00 00 	movzx  edx,BYTE PTR [rip+0xcd6]        # 809b90 <m_color>
  808eba:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  808ebc:	48 8b 05 c5 0c 00 00 	mov    rax,QWORD PTR [rip+0xcc5]        # 809b88 <m_ptr>
  808ec3:	48 8b 0d e6 7f c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc27fe6]        # 430eb0 <vpage_base>
  808eca:	48 29 c8             	sub    rax,rcx
  808ecd:	48 89 c2             	mov    rdx,rax
  808ed0:	8b 05 fa 7f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27ffa]        # 430ed0 <vpage_size>
  808ed6:	8b 0d e8 7f c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc27fe8]        # 430ec4 <line_chs>
  808edc:	29 c8                	sub    eax,ecx
  808ede:	01 c0                	add    eax,eax
  808ee0:	48 98                	cdqe   
  808ee2:	48 39 c2             	cmp    rdx,rax
  808ee5:	7c 0b                	jl     808ef2 <write_tty+0x13a>
  808ee7:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808eeb:	7e 05                	jle    808ef2 <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  808eed:	e8 bc f8 ff ff       	call   8087ae <scrdown>
    for(int i=0;i<len;i++)
  808ef2:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808ef6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808ef9:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  808efc:	0f 8c e9 fe ff ff    	jl     808deb <write_tty+0x33>
  808f02:	eb 01                	jmp    808f05 <write_tty+0x14d>
            break;
  808f04:	90                   	nop
        }
    }
    set_cur();
  808f05:	b8 00 00 00 00       	mov    eax,0x0
  808f0a:	e8 8c fd ff ff       	call   808c9b <set_cur>
    return 0;
  808f0f:	b8 00 00 00 00       	mov    eax,0x0
}
  808f14:	c9                   	leave  
  808f15:	c3                   	ret    

0000000000808f16 <cls>:

void cls(driver_args *args)
{
  808f16:	f3 0f 1e fa          	endbr64 
  808f1a:	55                   	push   rbp
  808f1b:	48 89 e5             	mov    rbp,rsp
  808f1e:	48 83 ec 20          	sub    rsp,0x20
  808f22:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  808f26:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  808f2d:	eb 16                	jmp    808f45 <cls+0x2f>
    {
        vpage_base[i]=0;
  808f2f:	48 8b 15 7a 7f c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27f7a]        # 430eb0 <vpage_base>
  808f36:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808f39:	48 98                	cdqe   
  808f3b:	48 01 d0             	add    rax,rdx
  808f3e:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  808f41:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  808f45:	8b 05 85 7f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27f85]        # 430ed0 <vpage_size>
  808f4b:	01 c0                	add    eax,eax
  808f4d:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  808f50:	7c dd                	jl     808f2f <cls+0x19>
    }
    m_ptr=vpage_base;
  808f52:	48 8b 05 57 7f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc27f57]        # 430eb0 <vpage_base>
  808f59:	48 89 05 28 0c 00 00 	mov    QWORD PTR [rip+0xc28],rax        # 809b88 <m_ptr>
    set_cur();
  808f60:	b8 00 00 00 00       	mov    eax,0x0
  808f65:	e8 31 fd ff ff       	call   808c9b <set_cur>
}
  808f6a:	90                   	nop
  808f6b:	c9                   	leave  
  808f6c:	c3                   	ret    

0000000000808f6d <set_color>:

void set_color(char color)
{
  808f6d:	f3 0f 1e fa          	endbr64 
  808f71:	55                   	push   rbp
  808f72:	48 89 e5             	mov    rbp,rsp
  808f75:	89 f8                	mov    eax,edi
  808f77:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  808f7a:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  808f7e:	88 05 0c 0c 00 00    	mov    BYTE PTR [rip+0xc0c],al        # 809b90 <m_color>
}
  808f84:	90                   	nop
  808f85:	5d                   	pop    rbp
  808f86:	c3                   	ret    

0000000000808f87 <tty_do_req>:

int tty_do_req(driver_args *args)
{
  808f87:	f3 0f 1e fa          	endbr64 
  808f8b:	55                   	push   rbp
  808f8c:	48 89 e5             	mov    rbp,rsp
  808f8f:	48 83 ec 10          	sub    rsp,0x10
  808f93:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  808f97:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f9b:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  808fa1:	83 f8 0d             	cmp    eax,0xd
  808fa4:	74 45                	je     808feb <tty_do_req+0x64>
  808fa6:	83 f8 0d             	cmp    eax,0xd
  808fa9:	7f 53                	jg     808ffe <tty_do_req+0x77>
  808fab:	83 f8 0c             	cmp    eax,0xc
  808fae:	74 2d                	je     808fdd <tty_do_req+0x56>
  808fb0:	83 f8 0c             	cmp    eax,0xc
  808fb3:	7f 49                	jg     808ffe <tty_do_req+0x77>
  808fb5:	83 f8 02             	cmp    eax,0x2
  808fb8:	74 07                	je     808fc1 <tty_do_req+0x3a>
  808fba:	83 f8 03             	cmp    eax,0x3
  808fbd:	74 10                	je     808fcf <tty_do_req+0x48>
  808fbf:	eb 3d                	jmp    808ffe <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  808fc1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808fc5:	48 89 c7             	mov    rdi,rax
  808fc8:	e8 58 fd ff ff       	call   808d25 <read_tty>
        break;
  808fcd:	eb 36                	jmp    809005 <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  808fcf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808fd3:	48 89 c7             	mov    rdi,rax
  808fd6:	e8 dd fd ff ff       	call   808db8 <write_tty>
        break;
  808fdb:	eb 28                	jmp    809005 <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  808fdd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808fe1:	48 89 c7             	mov    rdi,rax
  808fe4:	e8 a2 fb ff ff       	call   808b8b <seek_tty>
        break;
  808fe9:	eb 1a                	jmp    809005 <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  808feb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808fef:	48 89 c7             	mov    rdi,rax
  808ff2:	b8 00 00 00 00       	mov    eax,0x0
  808ff7:	e8 bb fb ff ff       	call   808bb7 <tell_monitor>
        break;
  808ffc:	eb 07                	jmp    809005 <tty_do_req+0x7e>
    default:return -1;
  808ffe:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809003:	eb 05                	jmp    80900a <tty_do_req+0x83>
    }
    return 0;
  809005:	b8 00 00 00 00       	mov    eax,0x0
}
  80900a:	c9                   	leave  
  80900b:	c3                   	ret    

000000000080900c <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  80900c:	f3 0f 1e fa          	endbr64 
  809010:	55                   	push   rbp
  809011:	48 89 e5             	mov    rbp,rsp
  809014:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809018:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80901c:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  80901f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809023:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  809026:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80902d:	eb 1b                	jmp    80904a <memcpy+0x3e>
        *(dest)=*(src);
  80902f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809033:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809036:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80903a:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  80903c:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  809041:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  809046:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80904a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80904d:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  809050:	77 dd                	ja     80902f <memcpy+0x23>
    }
}
  809052:	90                   	nop
  809053:	90                   	nop
  809054:	5d                   	pop    rbp
  809055:	c3                   	ret    

0000000000809056 <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  809056:	f3 0f 1e fa          	endbr64 
  80905a:	55                   	push   rbp
  80905b:	48 89 e5             	mov    rbp,rsp
  80905e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809062:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809066:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  809069:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809070:	eb 3a                	jmp    8090ac <memcmp+0x56>
    {
        if(*a!=*b)
  809072:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809076:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809079:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80907d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809080:	38 c2                	cmp    dl,al
  809082:	74 1a                	je     80909e <memcmp+0x48>
            return *a-*b;
  809084:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809088:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80908b:	0f b6 d0             	movzx  edx,al
  80908e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809092:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809095:	0f b6 c8             	movzx  ecx,al
  809098:	89 d0                	mov    eax,edx
  80909a:	29 c8                	sub    eax,ecx
  80909c:	eb 1b                	jmp    8090b9 <memcmp+0x63>
        a++;
  80909e:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  8090a3:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  8090a8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8090ac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8090af:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  8090b2:	7c be                	jl     809072 <memcmp+0x1c>
    }
    return 0;
  8090b4:	b8 00 00 00 00       	mov    eax,0x0
}
  8090b9:	5d                   	pop    rbp
  8090ba:	c3                   	ret    

00000000008090bb <memset>:
void memset(u8 *buf,u8 value,u32 size){
  8090bb:	f3 0f 1e fa          	endbr64 
  8090bf:	55                   	push   rbp
  8090c0:	48 89 e5             	mov    rbp,rsp
  8090c3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8090c7:	89 f0                	mov    eax,esi
  8090c9:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  8090cc:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  8090cf:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8090d6:	eb 16                	jmp    8090ee <memset+0x33>
        *(buf++)=value;
  8090d8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8090dc:	48 8d 50 01          	lea    rdx,[rax+0x1]
  8090e0:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8090e4:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  8090e8:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  8090ea:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8090ee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8090f1:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  8090f4:	72 e2                	jb     8090d8 <memset+0x1d>
    }
}
  8090f6:	90                   	nop
  8090f7:	90                   	nop
  8090f8:	5d                   	pop    rbp
  8090f9:	c3                   	ret    

00000000008090fa <get_mem_size>:

u32 get_mem_size(){
  8090fa:	f3 0f 1e fa          	endbr64 
  8090fe:	55                   	push   rbp
  8090ff:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  809102:	8b 05 dc 7d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27ddc]        # 430ee4 <mem_end>
}
  809108:	5d                   	pop    rbp
  809109:	c3                   	ret    

000000000080910a <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  80910a:	f3 0f 1e fa          	endbr64 
  80910e:	55                   	push   rbp
  80910f:	48 89 e5             	mov    rbp,rsp
  809112:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809116:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  80911a:	eb 1d                	jmp    809139 <strcpy+0x2f>
        *(dest++)=*(buf++);
  80911c:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  809120:	48 8d 42 01          	lea    rax,[rdx+0x1]
  809124:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  809128:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80912c:	48 8d 48 01          	lea    rcx,[rax+0x1]
  809130:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  809134:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  809137:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  809139:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80913d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809140:	84 c0                	test   al,al
  809142:	75 d8                	jne    80911c <strcpy+0x12>
    }
    *dest='\0';
  809144:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809148:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80914b:	90                   	nop
  80914c:	5d                   	pop    rbp
  80914d:	c3                   	ret    

000000000080914e <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80914e:	f3 0f 1e fa          	endbr64 
  809152:	55                   	push   rbp
  809153:	48 89 e5             	mov    rbp,rsp
  809156:	48 83 ec 30          	sub    rsp,0x30
  80915a:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80915e:	89 f0                	mov    eax,esi
  809160:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  809163:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  809168:	0f 84 9c 00 00 00    	je     80920a <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80916e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809172:	48 89 c6             	mov    rsi,rax
  809175:	bf 00 0f 43 00       	mov    edi,0x430f00
  80917a:	e8 8b ff ff ff       	call   80910a <strcpy>
        char* ptr=strtokkee;
  80917f:	48 c7 45 e8 00 0f 43 	mov    QWORD PTR [rbp-0x18],0x430f00
  809186:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  809187:	c7 05 6f 7f c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc27f6f],0x0        # 431100 <tokptr>
  80918e:	00 00 00 
  809191:	eb 1c                	jmp    8091af <strtok+0x61>
  809193:	8b 05 67 7f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27f67]        # 431100 <tokptr>
  809199:	83 c0 01             	add    eax,0x1
  80919c:	99                   	cdq    
  80919d:	c1 ea 17             	shr    edx,0x17
  8091a0:	01 d0                	add    eax,edx
  8091a2:	25 ff 01 00 00       	and    eax,0x1ff
  8091a7:	29 d0                	sub    eax,edx
  8091a9:	89 05 51 7f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27f51],eax        # 431100 <tokptr>
  8091af:	8b 05 4b 7f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27f4b]        # 431100 <tokptr>
  8091b5:	48 98                	cdqe   
  8091b7:	0f b6 80 00 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f00]
  8091be:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  8091c1:	74 13                	je     8091d6 <strtok+0x88>
  8091c3:	8b 05 37 7f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27f37]        # 431100 <tokptr>
  8091c9:	48 98                	cdqe   
  8091cb:	0f b6 80 00 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f00]
  8091d2:	84 c0                	test   al,al
  8091d4:	75 bd                	jne    809193 <strtok+0x45>
        strtokkee[tokptr]='\0';
  8091d6:	8b 05 24 7f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27f24]        # 431100 <tokptr>
  8091dc:	48 98                	cdqe   
  8091de:	c6 80 00 0f 43 00 00 	mov    BYTE PTR [rax+0x430f00],0x0
        tokptr=(tokptr+1)%512;
  8091e5:	8b 05 15 7f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27f15]        # 431100 <tokptr>
  8091eb:	83 c0 01             	add    eax,0x1
  8091ee:	99                   	cdq    
  8091ef:	c1 ea 17             	shr    edx,0x17
  8091f2:	01 d0                	add    eax,edx
  8091f4:	25 ff 01 00 00       	and    eax,0x1ff
  8091f9:	29 d0                	sub    eax,edx
  8091fb:	89 05 ff 7e c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27eff],eax        # 431100 <tokptr>
        return ptr;
  809201:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809205:	e9 9e 00 00 00       	jmp    8092a8 <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  80920a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  809211:	8b 05 e9 7e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27ee9]        # 431100 <tokptr>
  809217:	48 98                	cdqe   
  809219:	48 05 00 0f 43 00    	add    rax,0x430f00
  80921f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  809223:	eb 20                	jmp    809245 <strtok+0xf7>
  809225:	8b 05 d5 7e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27ed5]        # 431100 <tokptr>
  80922b:	83 c0 01             	add    eax,0x1
  80922e:	99                   	cdq    
  80922f:	c1 ea 17             	shr    edx,0x17
  809232:	01 d0                	add    eax,edx
  809234:	25 ff 01 00 00       	and    eax,0x1ff
  809239:	29 d0                	sub    eax,edx
  80923b:	89 05 bf 7e c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27ebf],eax        # 431100 <tokptr>
  809241:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809245:	8b 05 b5 7e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27eb5]        # 431100 <tokptr>
  80924b:	48 98                	cdqe   
  80924d:	0f b6 80 00 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f00]
  809254:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  809257:	74 13                	je     80926c <strtok+0x11e>
  809259:	8b 05 a1 7e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27ea1]        # 431100 <tokptr>
  80925f:	48 98                	cdqe   
  809261:	0f b6 80 00 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f00]
  809268:	84 c0                	test   al,al
  80926a:	75 b9                	jne    809225 <strtok+0xd7>
    strtokkee[tokptr]='\0';
  80926c:	8b 05 8e 7e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27e8e]        # 431100 <tokptr>
  809272:	48 98                	cdqe   
  809274:	c6 80 00 0f 43 00 00 	mov    BYTE PTR [rax+0x430f00],0x0
    tokptr=(tokptr+1)%512;
  80927b:	8b 05 7f 7e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27e7f]        # 431100 <tokptr>
  809281:	83 c0 01             	add    eax,0x1
  809284:	99                   	cdq    
  809285:	c1 ea 17             	shr    edx,0x17
  809288:	01 d0                	add    eax,edx
  80928a:	25 ff 01 00 00       	and    eax,0x1ff
  80928f:	29 d0                	sub    eax,edx
  809291:	89 05 69 7e c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27e69],eax        # 431100 <tokptr>
    if(c)
  809297:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80929b:	74 06                	je     8092a3 <strtok+0x155>
        return ptr;
  80929d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8092a1:	eb 05                	jmp    8092a8 <strtok+0x15a>
    else
        return (void*)0;
  8092a3:	b8 00 00 00 00       	mov    eax,0x0
}
  8092a8:	c9                   	leave  
  8092a9:	c3                   	ret    

00000000008092aa <strcmp>:
int strcmp(char *s1,char *s2)
{
  8092aa:	f3 0f 1e fa          	endbr64 
  8092ae:	55                   	push   rbp
  8092af:	48 89 e5             	mov    rbp,rsp
  8092b2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8092b6:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  8092ba:	eb 3c                	jmp    8092f8 <strcmp+0x4e>
		if(*s1>*s2)
  8092bc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092c0:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8092c3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8092c7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092ca:	38 c2                	cmp    dl,al
  8092cc:	7e 07                	jle    8092d5 <strcmp+0x2b>
			return 1;
  8092ce:	b8 01 00 00 00       	mov    eax,0x1
  8092d3:	eb 52                	jmp    809327 <strcmp+0x7d>
		else if(*s1<*s2)
  8092d5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092d9:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8092dc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8092e0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092e3:	38 c2                	cmp    dl,al
  8092e5:	7d 07                	jge    8092ee <strcmp+0x44>
			return -1;
  8092e7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8092ec:	eb 39                	jmp    809327 <strcmp+0x7d>
		s1++;
  8092ee:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  8092f3:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  8092f8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092fc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092ff:	84 c0                	test   al,al
  809301:	74 0b                	je     80930e <strcmp+0x64>
  809303:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809307:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80930a:	84 c0                	test   al,al
  80930c:	75 ae                	jne    8092bc <strcmp+0x12>
	}
	if(*s1==*s2)
  80930e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809312:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809315:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809319:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80931c:	38 c2                	cmp    dl,al
  80931e:	75 07                	jne    809327 <strcmp+0x7d>
		return 0;
  809320:	b8 00 00 00 00       	mov    eax,0x0
  809325:	eb 00                	jmp    809327 <strcmp+0x7d>
}
  809327:	5d                   	pop    rbp
  809328:	c3                   	ret    

0000000000809329 <strlen>:

int strlen(char *str)
{
  809329:	f3 0f 1e fa          	endbr64 
  80932d:	55                   	push   rbp
  80932e:	48 89 e5             	mov    rbp,rsp
  809331:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  809335:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  80933c:	eb 09                	jmp    809347 <strlen+0x1e>
  80933e:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  809343:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809347:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80934b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80934e:	84 c0                	test   al,al
  809350:	75 ec                	jne    80933e <strlen+0x15>
    return l;
  809352:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  809355:	5d                   	pop    rbp
  809356:	c3                   	ret    

0000000000809357 <sprintf>:

void sprintf(char *dist, char *str,...)
{
  809357:	f3 0f 1e fa          	endbr64 
  80935b:	55                   	push   rbp
  80935c:	48 89 e5             	mov    rbp,rsp
  80935f:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  809366:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80936d:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  809374:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  80937b:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  809382:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  809389:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  809390:	84 c0                	test   al,al
  809392:	74 20                	je     8093b4 <sprintf+0x5d>
  809394:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  809398:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  80939c:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  8093a0:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  8093a4:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  8093a8:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  8093ac:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  8093b0:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  8093b4:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  8093bb:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  8093c2:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  8093c9:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  8093d0:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  8093d7:	00 00 00 
    while (*pstr!='\n')
  8093da:	eb 39                	jmp    809415 <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  8093dc:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8093e3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8093e6:	3c 25                	cmp    al,0x25
  8093e8:	75 15                	jne    8093ff <sprintf+0xa8>
  8093ea:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  8093f1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8093f4:	3c 25                	cmp    al,0x25
  8093f6:	74 07                	je     8093ff <sprintf+0xa8>
            argnum++;
  8093f8:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  8093ff:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809406:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  80940d:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  809414:	01 
    while (*pstr!='\n')
  809415:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80941c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80941f:	3c 0a                	cmp    al,0xa
  809421:	75 b9                	jne    8093dc <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  809423:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  80942a:	00 00 00 
  80942d:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  809434:	00 00 00 
  809437:	48 8d 45 10          	lea    rax,[rbp+0x10]
  80943b:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  809442:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  809449:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  809450:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809457:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80945e:	e9 e2 01 00 00       	jmp    809645 <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  809463:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80946a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80946d:	3c 25                	cmp    al,0x25
  80946f:	0f 85 aa 01 00 00    	jne    80961f <sprintf+0x2c8>
  809475:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80947c:	48 83 c0 01          	add    rax,0x1
  809480:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809483:	84 c0                	test   al,al
  809485:	0f 84 94 01 00 00    	je     80961f <sprintf+0x2c8>
            pstr++;
  80948b:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  809492:	01 
            if(*pstr=='x'){
  809493:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80949a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80949d:	3c 78                	cmp    al,0x78
  80949f:	75 64                	jne    809505 <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  8094a1:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  8094a7:	83 f8 2f             	cmp    eax,0x2f
  8094aa:	77 23                	ja     8094cf <sprintf+0x178>
  8094ac:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8094b3:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  8094b9:	89 d2                	mov    edx,edx
  8094bb:	48 01 d0             	add    rax,rdx
  8094be:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  8094c4:	83 c2 08             	add    edx,0x8
  8094c7:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  8094cd:	eb 12                	jmp    8094e1 <sprintf+0x18a>
  8094cf:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8094d6:	48 8d 50 08          	lea    rdx,[rax+0x8]
  8094da:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  8094e1:	8b 00                	mov    eax,DWORD PTR [rax]
  8094e3:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  8094e9:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  8094ef:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8094f6:	89 d6                	mov    esi,edx
  8094f8:	48 89 c7             	mov    rdi,rax
  8094fb:	e8 4e 02 00 00       	call   80974e <sprint_hex>
            if(*pstr=='x'){
  809500:	e9 38 01 00 00       	jmp    80963d <sprintf+0x2e6>
            }else if(*pstr=='s'){
  809505:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80950c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80950f:	3c 73                	cmp    al,0x73
  809511:	75 68                	jne    80957b <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  809513:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809519:	83 f8 2f             	cmp    eax,0x2f
  80951c:	77 23                	ja     809541 <sprintf+0x1ea>
  80951e:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809525:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80952b:	89 d2                	mov    edx,edx
  80952d:	48 01 d0             	add    rax,rdx
  809530:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809536:	83 c2 08             	add    edx,0x8
  809539:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80953f:	eb 12                	jmp    809553 <sprintf+0x1fc>
  809541:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809548:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80954c:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809553:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809556:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  80955d:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  809564:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80956b:	48 89 d6             	mov    rsi,rdx
  80956e:	48 89 c7             	mov    rdi,rax
  809571:	e8 5a 02 00 00       	call   8097d0 <sprintn>
            if(*pstr=='x'){
  809576:	e9 c2 00 00 00       	jmp    80963d <sprintf+0x2e6>
            }else if(*pstr=='d'){
  80957b:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809582:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809585:	3c 64                	cmp    al,0x64
  809587:	75 66                	jne    8095ef <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  809589:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80958f:	83 f8 2f             	cmp    eax,0x2f
  809592:	77 23                	ja     8095b7 <sprintf+0x260>
  809594:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80959b:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  8095a1:	89 d2                	mov    edx,edx
  8095a3:	48 01 d0             	add    rax,rdx
  8095a6:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  8095ac:	83 c2 08             	add    edx,0x8
  8095af:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  8095b5:	eb 12                	jmp    8095c9 <sprintf+0x272>
  8095b7:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8095be:	48 8d 50 08          	lea    rdx,[rax+0x8]
  8095c2:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  8095c9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8095cc:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  8095d3:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  8095da:	89 c2                	mov    edx,eax
  8095dc:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8095e3:	89 d6                	mov    esi,edx
  8095e5:	48 89 c7             	mov    rdi,rax
  8095e8:	e8 ad 00 00 00       	call   80969a <sprint_decimal>
            if(*pstr=='x'){
  8095ed:	eb 4e                	jmp    80963d <sprintf+0x2e6>
            }else if(*pstr=='c'){
  8095ef:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8095f6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095f9:	3c 63                	cmp    al,0x63
  8095fb:	75 02                	jne    8095ff <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  8095fd:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  8095ff:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809606:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809609:	0f be d0             	movsx  edx,al
  80960c:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809613:	89 d6                	mov    esi,edx
  809615:	48 89 c7             	mov    rdi,rax
  809618:	e8 3e 00 00 00       	call   80965b <sprintchar>
            if(*pstr=='x'){
  80961d:	eb 1e                	jmp    80963d <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80961f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809626:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809629:	0f be d0             	movsx  edx,al
  80962c:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809633:	89 d6                	mov    esi,edx
  809635:	48 89 c7             	mov    rdi,rax
  809638:	e8 1e 00 00 00       	call   80965b <sprintchar>
    for(;*pstr!='\0';pstr++){
  80963d:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  809644:	01 
  809645:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80964c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80964f:	84 c0                	test   al,al
  809651:	0f 85 0c fe ff ff    	jne    809463 <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  809657:	90                   	nop
  809658:	90                   	nop
  809659:	c9                   	leave  
  80965a:	c3                   	ret    

000000000080965b <sprintchar>:
void sprintchar(char *dist,char c)
{
  80965b:	f3 0f 1e fa          	endbr64 
  80965f:	55                   	push   rbp
  809660:	48 89 e5             	mov    rbp,rsp
  809663:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809667:	89 f0                	mov    eax,esi
  809669:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80966c:	eb 05                	jmp    809673 <sprintchar+0x18>
        dist++;
  80966e:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  809673:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809677:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80967a:	84 c0                	test   al,al
  80967c:	75 f0                	jne    80966e <sprintchar+0x13>
    *dist++=c;
  80967e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809682:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809686:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80968a:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80968e:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  809690:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809694:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  809697:	90                   	nop
  809698:	5d                   	pop    rbp
  809699:	c3                   	ret    

000000000080969a <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80969a:	f3 0f 1e fa          	endbr64 
  80969e:	55                   	push   rbp
  80969f:	48 89 e5             	mov    rbp,rsp
  8096a2:	48 83 ec 30          	sub    rsp,0x30
  8096a6:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  8096aa:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  8096ad:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  8096b4:	eb 65                	jmp    80971b <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  8096b6:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  8096b9:	48 63 c2             	movsxd rax,edx
  8096bc:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  8096c3:	48 c1 e8 20          	shr    rax,0x20
  8096c7:	c1 f8 02             	sar    eax,0x2
  8096ca:	89 d6                	mov    esi,edx
  8096cc:	c1 fe 1f             	sar    esi,0x1f
  8096cf:	29 f0                	sub    eax,esi
  8096d1:	89 c1                	mov    ecx,eax
  8096d3:	89 c8                	mov    eax,ecx
  8096d5:	c1 e0 02             	shl    eax,0x2
  8096d8:	01 c8                	add    eax,ecx
  8096da:	01 c0                	add    eax,eax
  8096dc:	89 d1                	mov    ecx,edx
  8096de:	29 c1                	sub    ecx,eax
  8096e0:	89 c8                	mov    eax,ecx
  8096e2:	83 c0 30             	add    eax,0x30
  8096e5:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  8096e8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8096eb:	8d 50 01             	lea    edx,[rax+0x1]
  8096ee:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  8096f1:	48 98                	cdqe   
  8096f3:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  8096f7:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  8096fb:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8096fe:	48 63 d0             	movsxd rdx,eax
  809701:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  809708:	48 c1 ea 20          	shr    rdx,0x20
  80970c:	c1 fa 02             	sar    edx,0x2
  80970f:	c1 f8 1f             	sar    eax,0x1f
  809712:	89 c1                	mov    ecx,eax
  809714:	89 d0                	mov    eax,edx
  809716:	29 c8                	sub    eax,ecx
  809718:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80971b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80971e:	83 f8 0f             	cmp    eax,0xf
  809721:	76 93                	jbe    8096b6 <sprint_decimal+0x1c>
    }
    while(p>0)
  809723:	eb 1f                	jmp    809744 <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  809725:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  809729:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80972c:	48 98                	cdqe   
  80972e:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  809733:	0f be d0             	movsx  edx,al
  809736:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80973a:	89 d6                	mov    esi,edx
  80973c:	48 89 c7             	mov    rdi,rax
  80973f:	e8 17 ff ff ff       	call   80965b <sprintchar>
    while(p>0)
  809744:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809748:	7f db                	jg     809725 <sprint_decimal+0x8b>
    }
}
  80974a:	90                   	nop
  80974b:	90                   	nop
  80974c:	c9                   	leave  
  80974d:	c3                   	ret    

000000000080974e <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80974e:	f3 0f 1e fa          	endbr64 
  809752:	55                   	push   rbp
  809753:	48 89 e5             	mov    rbp,rsp
  809756:	48 83 ec 20          	sub    rsp,0x20
  80975a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80975e:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  809761:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  809768:	eb 35                	jmp    80979f <sprint_hex+0x51>
        unsigned char a=c%16;
  80976a:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80976d:	83 e0 0f             	and    eax,0xf
  809770:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  809773:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  809777:	76 06                	jbe    80977f <sprint_hex+0x31>
  809779:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80977d:	eb 04                	jmp    809783 <sprint_hex+0x35>
        else a+='0';
  80977f:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  809783:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809786:	8d 50 01             	lea    edx,[rax+0x1]
  809789:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80978c:	48 98                	cdqe   
  80978e:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  809792:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  809796:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809799:	c1 e8 04             	shr    eax,0x4
  80979c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80979f:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  8097a3:	7e c5                	jle    80976a <sprint_hex+0x1c>
    }
    while(p>0)
  8097a5:	eb 1f                	jmp    8097c6 <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  8097a7:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  8097ab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8097ae:	48 98                	cdqe   
  8097b0:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  8097b5:	0f be d0             	movsx  edx,al
  8097b8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8097bc:	89 d6                	mov    esi,edx
  8097be:	48 89 c7             	mov    rdi,rax
  8097c1:	e8 95 fe ff ff       	call   80965b <sprintchar>
    while(p>0)
  8097c6:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8097ca:	7f db                	jg     8097a7 <sprint_hex+0x59>
    }
}
  8097cc:	90                   	nop
  8097cd:	90                   	nop
  8097ce:	c9                   	leave  
  8097cf:	c3                   	ret    

00000000008097d0 <sprintn>:
void sprintn(char *dist,char *str)
{
  8097d0:	f3 0f 1e fa          	endbr64 
  8097d4:	55                   	push   rbp
  8097d5:	48 89 e5             	mov    rbp,rsp
  8097d8:	48 83 ec 10          	sub    rsp,0x10
  8097dc:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8097e0:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  8097e4:	eb 20                	jmp    809806 <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  8097e6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8097ea:	48 8d 50 01          	lea    rdx,[rax+0x1]
  8097ee:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  8097f2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8097f5:	0f be d0             	movsx  edx,al
  8097f8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097fc:	89 d6                	mov    esi,edx
  8097fe:	48 89 c7             	mov    rdi,rax
  809801:	e8 55 fe ff ff       	call   80965b <sprintchar>
    while(*str!='\0')
  809806:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80980a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80980d:	84 c0                	test   al,al
  80980f:	75 d5                	jne    8097e6 <sprintn+0x16>
    }
  809811:	90                   	nop
  809812:	90                   	nop
  809813:	c9                   	leave  
  809814:	c3                   	ret    
  809815:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  80981c:	00 00 00 
  80981f:	90                   	nop

0000000000809820 <create_zero>:
  809820:	e8 88 a3 ff ff       	call   803bad <req_proc+0x4>
  809825:	83 f8 ff             	cmp    eax,0xffffffff
  809828:	74 1d                	je     809847 <create_zero.retu>
  80982a:	50                   	push   rax
  80982b:	53                   	push   rbx
  80982c:	51                   	push   rcx
  80982d:	52                   	push   rdx
  80982e:	06                   	(bad)  
  80982f:	0e                   	(bad)  
  809830:	16                   	(bad)  
  809831:	1e                   	(bad)  
  809832:	0f a0                	push   fs
  809834:	0f a8                	push   gs
  809836:	54                   	push   rsp
  809837:	55                   	push   rbp
  809838:	56                   	push   rsi
  809839:	57                   	push   rdi
  80983a:	9c                   	pushf  
  80983b:	50                   	push   rax
  80983c:	e8 38 a4 ff ff       	call   803c79 <set_proc+0x4>
  809841:	8b 04 24             	mov    eax,DWORD PTR [rsp]
  809844:	83 c4 40             	add    esp,0x40

0000000000809847 <create_zero.retu>:
  809847:	c3                   	ret    

0000000000809848 <fill_desc>:
  809848:	55                   	push   rbp
  809849:	89 e5                	mov    ebp,esp
  80984b:	8b 45 14             	mov    eax,DWORD PTR [rbp+0x14]
  80984e:	8b 5d 10             	mov    ebx,DWORD PTR [rbp+0x10]
  809851:	8b 4d 0c             	mov    ecx,DWORD PTR [rbp+0xc]
  809854:	8b 55 08             	mov    edx,DWORD PTR [rbp+0x8]
  809857:	be 20 98 80 00       	mov    esi,0x809820
  80985c:	c7 05 20 98 80 00 00 	mov    DWORD PTR [rip+0x809820],0x0        # 1013086 <dev_stdout+0x808a26>
  809863:	00 00 00 
  809866:	c7 05 20 98 80 00 00 	mov    DWORD PTR [rip+0x809820],0x0        # 1013090 <dev_stdout+0x808a30>
  80986d:	00 00 00 
  809870:	66 89 0e             	mov    WORD PTR [rsi],cx
  809873:	c1 e9 10             	shr    ecx,0x10
  809876:	66 89 56 02          	mov    WORD PTR [rsi+0x2],dx
  80987a:	c1 ea 10             	shr    edx,0x10
  80987d:	88 56 04             	mov    BYTE PTR [rsi+0x4],dl
  809880:	66 c1 ea 08          	shr    dx,0x8
  809884:	88 56 07             	mov    BYTE PTR [rsi+0x7],dl
  809887:	66 89 5e 05          	mov    WORD PTR [rsi+0x5],bx
  80988b:	8b 7e 04             	mov    edi,DWORD PTR [rsi+0x4]
  80988e:	c1 e1 08             	shl    ecx,0x8
  809891:	09 cf                	or     edi,ecx
  809893:	89 7e 04             	mov    DWORD PTR [rsi+0x4],edi
  809896:	8b 15 20 98 80 00    	mov    edx,DWORD PTR [rip+0x809820]        # 10130bc <dev_stdout+0x808a5c>
  80989c:	89 10                	mov    DWORD PTR [rax],edx
  80989e:	8b 15 20 98 80 00    	mov    edx,DWORD PTR [rip+0x809820]        # 10130c4 <dev_stdout+0x808a64>
  8098a4:	89 50 04             	mov    DWORD PTR [rax+0x4],edx
  8098a7:	89 ec                	mov    esp,ebp
  8098a9:	5d                   	pop    rbp
  8098aa:	c3                   	ret    

00000000008098ab <switch_proc_asm>:
  8098ab:	66 8b 44 24 04       	mov    ax,WORD PTR [rsp+0x4]
  8098b0:	66 a3 20 98 80 00 c7 	movabs ds:0x982005c700809820,ax
  8098b7:	05 20 98 
  8098ba:	80 00 00             	add    BYTE PTR [rax],0x0
  8098bd:	00 00                	add    BYTE PTR [rax],al
	...

00000000008098c0 <switch_proc_asm.ljmp>:
  8098c0:	ea                   	(bad)  
  8098c1:	00 00                	add    BYTE PTR [rax],al
  8098c3:	00 00                	add    BYTE PTR [rax],al
  8098c5:	00 00                	add    BYTE PTR [rax],al
  8098c7:	c3                   	ret    

00000000008098c8 <switch_to>:
  8098c8:	8b 74 24 04          	mov    esi,DWORD PTR [rsp+0x4]
  8098cc:	8b 5e 20             	mov    ebx,DWORD PTR [rsi+0x20]
  8098cf:	bf 20 98 80 00       	mov    edi,0x809820
  8098d4:	89 5f 01             	mov    DWORD PTR [rdi+0x1],ebx
  8098d7:	8b 46 38             	mov    eax,DWORD PTR [rsi+0x38]
  8098da:	89 c1                	mov    ecx,eax
  8098dc:	83 e9 04             	sub    ecx,0x4
  8098df:	89 19                	mov    DWORD PTR [rcx],ebx
  8098e1:	50                   	push   rax
  8098e2:	89 f5                	mov    ebp,esi
  8098e4:	83 c5 28             	add    ebp,0x28
  8098e7:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  8098ea:	50                   	push   rax
  8098eb:	83 c5 04             	add    ebp,0x4
  8098ee:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  8098f1:	50                   	push   rax
  8098f2:	83 c5 04             	add    ebp,0x4
  8098f5:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  8098f8:	50                   	push   rax
  8098f9:	83 c5 04             	add    ebp,0x4
  8098fc:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  8098ff:	50                   	push   rax
  809900:	83 c5 04             	add    ebp,0x4
  809903:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  809906:	50                   	push   rax
  809907:	83 c5 04             	add    ebp,0x4
  80990a:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  80990d:	50                   	push   rax
  80990e:	83 c5 04             	add    ebp,0x4
  809911:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  809914:	50                   	push   rax
  809915:	83 c5 04             	add    ebp,0x4
  809918:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
  80991b:	50                   	push   rax
  80991c:	83 c5 04             	add    ebp,0x4
  80991f:	8b 46 1c             	mov    eax,DWORD PTR [rsi+0x1c]
  809922:	0f 22 d8             	mov    cr3,rax
  809925:	8b 46 24             	mov    eax,DWORD PTR [rsi+0x24]
  809928:	50                   	push   rax
  809929:	9d                   	popf   
  80992a:	61                   	(bad)  
  80992b:	5c                   	pop    rsp

000000000080992c <switch_to.leap>:
  80992c:	ea                   	(bad)  
  80992d:	00 00                	add    BYTE PTR [rax],al
  80992f:	00 00                	add    BYTE PTR [rax],al
  809931:	08 00                	or     BYTE PTR [rax],al

0000000000809933 <save_context>:
  809933:	60                   	(bad)  
  809934:	8b 44 24 24          	mov    eax,DWORD PTR [rsp+0x24]
  809938:	83 c0 44             	add    eax,0x44
  80993b:	b9 08 00 00 00       	mov    ecx,0x8
  809940:	89 e7                	mov    edi,esp

0000000000809942 <save_context.loops>:
  809942:	8b 17                	mov    edx,DWORD PTR [rdi]
  809944:	89 10                	mov    DWORD PTR [rax],edx
  809946:	83 c7 04             	add    edi,0x4
  809949:	83 e8 04             	sub    eax,0x4
  80994c:	e2 f4                	loop   809942 <save_context.loops>
  80994e:	61                   	(bad)  
  80994f:	9c                   	pushf  
  809950:	5b                   	pop    rbx
  809951:	8b 44 24 04          	mov    eax,DWORD PTR [rsp+0x4]
  809955:	89 58 24             	mov    DWORD PTR [rax+0x24],ebx
  809958:	8b 1c 24             	mov    ebx,DWORD PTR [rsp]
  80995b:	89 58 20             	mov    DWORD PTR [rax+0x20],ebx
  80995e:	c3                   	ret    

000000000080995f <move_to_user_mode>:
  80995f:	66 b8 20 00          	mov    ax,0x20
  809963:	8e d8                	mov    ds,eax
  809965:	8e c0                	mov    es,eax
  809967:	8e e8                	mov    gs,eax
  809969:	6a 20                	push   0x20
  80996b:	54                   	push   rsp
  80996c:	9c                   	pushf  
  80996d:	6a 18                	push   0x18
  80996f:	68 20 98 80 00       	push   0x809820
  809974:	cf                   	iret   

0000000000809975 <move_to_user_mode.done>:
  809975:	c3                   	ret    

0000000000809976 <desc>:
	...
