
bin/gmsknl.elf:     file format elf64-x86-64


Disassembly of section .entry:

0000000000100000 <_knl_start>:
  100000:	fa                   	cli    
  100001:	89 de                	mov    esi,ebx
  100003:	89 c7                	mov    edi,eax
  100005:	b8 00 50 10 00       	mov    eax,0x105000
  10000a:	83 c0 02             	add    eax,0x2
  10000d:	c7 00 00 40 10 00    	mov    DWORD PTR [rax],0x104000
  100013:	b8 00 50 10 00       	mov    eax,0x105000
  100018:	66 0f 01 10          	data16 lgdt [rax]

000000000010001c <set_paging>:
  10001c:	66 b8 10 00          	mov    ax,0x10
  100020:	8e d8                	mov    ds,eax
  100022:	8e d0                	mov    ss,eax
  100024:	8e c0                	mov    es,eax
  100026:	8e e8                	mov    gs,eax
  100028:	8e e0                	mov    fs,eax
  10002a:	0f 20 e0             	mov    rax,cr4
  10002d:	0f ba e8 05          	bts    eax,0x5
  100031:	0f 22 e0             	mov    cr4,rax
  100034:	0f 20 c0             	mov    rax,cr0
  100037:	bb 00 00 00 80       	mov    ebx,0x80000000
  10003c:	f7 d3                	not    ebx
  10003e:	21 d8                	and    eax,ebx
  100040:	0f 22 c0             	mov    cr0,rax
  100043:	b8 00 10 10 00       	mov    eax,0x101000
  100048:	c7 00 07 20 10 00    	mov    DWORD PTR [rax],0x102007
  10004e:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
  100055:	b8 00 20 10 00       	mov    eax,0x102000
  10005a:	c7 00 83 01 00 00    	mov    DWORD PTR [rax],0x183
  100060:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
  100067:	b8 00 10 10 00       	mov    eax,0x101000
  10006c:	0f 22 d8             	mov    cr3,rax

000000000010006f <switch_cs>:
  10006f:	bc 00 00 40 00       	mov    esp,0x400000
  100074:	b9 80 00 00 c0       	mov    ecx,0xc0000080
  100079:	0f 32                	rdmsr  
  10007b:	0f ba e8 08          	bts    eax,0x8
  10007f:	0f 30                	wrmsr  
  100081:	0f 20 c0             	mov    rax,cr0
  100084:	0f ba e8 00          	bts    eax,0x0
  100088:	0f ba e8 1f          	bts    eax,0x1f
  10008c:	0f 22 c0             	mov    cr0,rax
  10008f:	b8 b1 07 80 00       	mov    eax,0x8007b1
  100094:	ea                   	(bad)  
  100095:	b1 07                	mov    cl,0x7
  100097:	80 00 08             	add    BYTE PTR [rax],0x8
	...

bin/gmsknl.elf:     file format elf64-x86-64


Disassembly of section .text:

0000000000800000 <init_int>:
#include "kb.h"
#include "framebuffer.h"

gate *idt= (gate *) IDT_ADDR;
extern int disk_int_handler();
void init_int(){
  800000:	f3 0f 1e fa          	endbr64 
  800004:	55                   	push   rbp
  800005:	48 89 e5             	mov    rbp,rsp
  800008:	48 83 ec 10          	sub    rsp,0x10
    //asm volatile("sidt %0"::"m"(idt));
    set_gate(0,(addr_t)divide_err,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  80000c:	b8 d3 03 80 00       	mov    eax,0x8003d3
  800011:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800016:	ba 08 00 00 00       	mov    edx,0x8
  80001b:	48 89 c6             	mov    rsi,rax
  80001e:	bf 00 00 00 00       	mov    edi,0x0
  800023:	e8 e4 02 00 00       	call   80030c <set_gate>
    set_gate(1,(addr_t)debug,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800028:	b8 ed 03 80 00       	mov    eax,0x8003ed
  80002d:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800032:	ba 08 00 00 00       	mov    edx,0x8
  800037:	48 89 c6             	mov    rsi,rax
  80003a:	bf 01 00 00 00       	mov    edi,0x1
  80003f:	e8 c8 02 00 00       	call   80030c <set_gate>
    set_gate(2,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800044:	b8 07 04 80 00       	mov    eax,0x800407
  800049:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80004e:	ba 08 00 00 00       	mov    edx,0x8
  800053:	48 89 c6             	mov    rsi,rax
  800056:	bf 02 00 00 00       	mov    edi,0x2
  80005b:	e8 ac 02 00 00       	call   80030c <set_gate>
    set_gate(3,(addr_t)breakpoint,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800060:	b8 21 04 80 00       	mov    eax,0x800421
  800065:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80006a:	ba 08 00 00 00       	mov    edx,0x8
  80006f:	48 89 c6             	mov    rsi,rax
  800072:	bf 03 00 00 00       	mov    edi,0x3
  800077:	e8 90 02 00 00       	call   80030c <set_gate>
    set_gate(4,(addr_t)overflow,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  80007c:	b8 3b 04 80 00       	mov    eax,0x80043b
  800081:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800086:	ba 08 00 00 00       	mov    edx,0x8
  80008b:	48 89 c6             	mov    rsi,rax
  80008e:	bf 04 00 00 00       	mov    edi,0x4
  800093:	e8 74 02 00 00       	call   80030c <set_gate>
    set_gate(5,(addr_t)bounds,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800098:	b8 55 04 80 00       	mov    eax,0x800455
  80009d:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8000a2:	ba 08 00 00 00       	mov    edx,0x8
  8000a7:	48 89 c6             	mov    rsi,rax
  8000aa:	bf 05 00 00 00       	mov    edi,0x5
  8000af:	e8 58 02 00 00       	call   80030c <set_gate>
    set_gate(6,(addr_t)undefined_operator,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  8000b4:	b8 6f 04 80 00       	mov    eax,0x80046f
  8000b9:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8000be:	ba 08 00 00 00       	mov    edx,0x8
  8000c3:	48 89 c6             	mov    rsi,rax
  8000c6:	bf 06 00 00 00       	mov    edi,0x6
  8000cb:	e8 3c 02 00 00       	call   80030c <set_gate>
    set_gate(7,(addr_t)coprocessor_notexist,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  8000d0:	b8 93 04 80 00       	mov    eax,0x800493
  8000d5:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8000da:	ba 08 00 00 00       	mov    edx,0x8
  8000df:	48 89 c6             	mov    rsi,rax
  8000e2:	bf 07 00 00 00       	mov    edi,0x7
  8000e7:	e8 20 02 00 00       	call   80030c <set_gate>
    set_gate(8,(addr_t)double_ints,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);//double_ints
  8000ec:	b8 ad 04 80 00       	mov    eax,0x8004ad
  8000f1:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8000f6:	ba 08 00 00 00       	mov    edx,0x8
  8000fb:	48 89 c6             	mov    rsi,rax
  8000fe:	bf 08 00 00 00       	mov    edi,0x8
  800103:	e8 04 02 00 00       	call   80030c <set_gate>
    set_gate(9,(addr_t)coprocessor_seg_overbound,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800108:	b8 c7 04 80 00       	mov    eax,0x8004c7
  80010d:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800112:	ba 08 00 00 00       	mov    edx,0x8
  800117:	48 89 c6             	mov    rsi,rax
  80011a:	bf 09 00 00 00       	mov    edi,0x9
  80011f:	e8 e8 01 00 00       	call   80030c <set_gate>
    set_gate(10,(addr_t)invalid_tss,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800124:	b8 df 04 80 00       	mov    eax,0x8004df
  800129:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80012e:	ba 08 00 00 00       	mov    edx,0x8
  800133:	48 89 c6             	mov    rsi,rax
  800136:	bf 0a 00 00 00       	mov    edi,0xa
  80013b:	e8 cc 01 00 00       	call   80030c <set_gate>
    set_gate(11,(addr_t)segment_notexist,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800140:	b8 f9 04 80 00       	mov    eax,0x8004f9
  800145:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80014a:	ba 08 00 00 00       	mov    edx,0x8
  80014f:	48 89 c6             	mov    rsi,rax
  800152:	bf 0b 00 00 00       	mov    edi,0xb
  800157:	e8 b0 01 00 00       	call   80030c <set_gate>
    set_gate(12,(addr_t)stackseg_overbound,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);//
  80015c:	b8 13 05 80 00       	mov    eax,0x800513
  800161:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800166:	ba 08 00 00 00       	mov    edx,0x8
  80016b:	48 89 c6             	mov    rsi,rax
  80016e:	bf 0c 00 00 00       	mov    edi,0xc
  800173:	e8 94 01 00 00       	call   80030c <set_gate>
    set_gate(13,(addr_t)general_protect,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800178:	b8 2d 05 80 00       	mov    eax,0x80052d
  80017d:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800182:	ba 08 00 00 00       	mov    edx,0x8
  800187:	48 89 c6             	mov    rsi,rax
  80018a:	bf 0d 00 00 00       	mov    edi,0xd
  80018f:	e8 78 01 00 00       	call   80030c <set_gate>
    set_gate(14,(addr_t)page_err,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800194:	b8 53 11 80 00       	mov    eax,0x801153
  800199:	b9 00 8f 00 00       	mov    ecx,0x8f00
  80019e:	ba 08 00 00 00       	mov    edx,0x8
  8001a3:	48 89 c6             	mov    rsi,rax
  8001a6:	bf 0e 00 00 00       	mov    edi,0xe
  8001ab:	e8 5c 01 00 00       	call   80030c <set_gate>
    set_gate(15,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  8001b0:	b8 07 04 80 00       	mov    eax,0x800407
  8001b5:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8001ba:	ba 08 00 00 00       	mov    edx,0x8
  8001bf:	48 89 c6             	mov    rsi,rax
  8001c2:	bf 0f 00 00 00       	mov    edi,0xf
  8001c7:	e8 40 01 00 00       	call   80030c <set_gate>
    set_gate(16,(addr_t)coprocessor_err,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  8001cc:	b8 54 05 80 00       	mov    eax,0x800554
  8001d1:	b9 00 8f 00 00       	mov    ecx,0x8f00
  8001d6:	ba 08 00 00 00       	mov    edx,0x8
  8001db:	48 89 c6             	mov    rsi,rax
  8001de:	bf 10 00 00 00       	mov    edi,0x10
  8001e3:	e8 24 01 00 00       	call   80030c <set_gate>
    for (int i=17;i<48;i++)
  8001e8:	c7 45 fc 11 00 00 00 	mov    DWORD PTR [rbp-0x4],0x11
  8001ef:	eb 20                	jmp    800211 <init_int+0x211>
        set_gate(i,(addr_t)default_int_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  8001f1:	be 07 04 80 00       	mov    esi,0x800407
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
	set_gate(0x21,(addr_t)key_proc,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800217:	b8 77 5f 80 00       	mov    eax,0x805f77
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 d9 00 00 00       	call   80030c <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 b0 4d 80 00       	mov    eax,0x804db0
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 bd 00 00 00       	call   80030c <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 f0 6e 80 00       	mov    eax,0x806ef0
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 a1 00 00 00       	call   80030c <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 70 57 80 00       	mov    eax,0x805770
  800270:	b9 00 8e 00 00       	mov    ecx,0x8e00
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
  800291:	e8 3a 48 00 00       	call   804ad0 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 2b 48 00 00       	call   804ad0 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 1c 48 00 00       	call   804ad0 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 0d 48 00 00       	call   804ad0 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 fe 47 00 00       	call   804ad0 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 ef 47 00 00       	call   804ad0 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 e0 47 00 00       	call   804ad0 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 d1 47 00 00       	call   804ad0 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 01 48 00 00       	call   804b0a <turn_on_int>

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
    idt[index].offset_high=(offset>>16)&0xffffu;
    idt[index].attr=attr;
    idt[index].selector=selector;
#else
    idt[index].offset_low=offset&0xffff;
  800327:	48 8b 15 12 9d 00 00 	mov    rdx,QWORD PTR [rip+0x9d12]        # 80a040 <idt>
  80032e:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800332:	48 c1 e0 04          	shl    rax,0x4
  800336:	48 01 d0             	add    rax,rdx
  800339:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80033d:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800340:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800344:	48 c1 e8 10          	shr    rax,0x10
  800348:	48 89 c2             	mov    rdx,rax
  80034b:	48 8b 0d ee 9c 00 00 	mov    rcx,QWORD PTR [rip+0x9cee]        # 80a040 <idt>
  800352:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800356:	48 c1 e0 04          	shl    rax,0x4
  80035a:	48 01 c8             	add    rax,rcx
  80035d:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  800361:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800365:	48 c1 e8 20          	shr    rax,0x20
  800369:	89 c1                	mov    ecx,eax
  80036b:	48 8b 15 ce 9c 00 00 	mov    rdx,QWORD PTR [rip+0x9cce]        # 80a040 <idt>
  800372:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800376:	48 c1 e0 04          	shl    rax,0x4
  80037a:	48 01 c2             	add    rdx,rax
  80037d:	0f b7 c1             	movzx  eax,cx
  800380:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr;
  800383:	48 8b 15 b6 9c 00 00 	mov    rdx,QWORD PTR [rip+0x9cb6]        # 80a040 <idt>
  80038a:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80038e:	48 c1 e0 04          	shl    rax,0x4
  800392:	48 01 c2             	add    rdx,rax
  800395:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  800399:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
    idt[index].selector=selector;
  80039d:	48 8b 15 9c 9c 00 00 	mov    rdx,QWORD PTR [rip+0x9c9c]        # 80a040 <idt>
  8003a4:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003a8:	48 c1 e0 04          	shl    rax,0x4
  8003ac:	48 01 c2             	add    rdx,rax
  8003af:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003b3:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003b7:	48 8b 15 82 9c 00 00 	mov    rdx,QWORD PTR [rip+0x9c82]        # 80a040 <idt>
  8003be:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003c2:	48 c1 e0 04          	shl    rax,0x4
  8003c6:	48 01 d0             	add    rax,rdx
  8003c9:	c7 40 0c 00 00 00 00 	mov    DWORD PTR [rax+0xc],0x0
#endif
}
  8003d0:	90                   	nop
  8003d1:	5d                   	pop    rbp
  8003d2:	c3                   	ret    

00000000008003d3 <divide_err>:

void divide_err(){
  8003d3:	f3 0f 1e fa          	endbr64 
  8003d7:	55                   	push   rbp
  8003d8:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8003db:	fa                   	cli    
    //puts("divide err");
    eoi();
  8003dc:	b8 00 00 00 00       	mov    eax,0x0
  8003e1:	e8 18 47 00 00       	call   804afe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  8003e6:	fb                   	sti    
  8003e7:	c9                   	leave  
  8003e8:	48 cf                	iretq  
}
  8003ea:	90                   	nop
  8003eb:	5d                   	pop    rbp
  8003ec:	c3                   	ret    

00000000008003ed <debug>:

void debug(){
  8003ed:	f3 0f 1e fa          	endbr64 
  8003f1:	55                   	push   rbp
  8003f2:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8003f5:	fa                   	cli    
    //puts("debug");
    eoi();
  8003f6:	b8 00 00 00 00       	mov    eax,0x0
  8003fb:	e8 fe 46 00 00       	call   804afe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800400:	fb                   	sti    
  800401:	c9                   	leave  
  800402:	48 cf                	iretq  
}
  800404:	90                   	nop
  800405:	5d                   	pop    rbp
  800406:	c3                   	ret    

0000000000800407 <default_int_proc>:
void default_int_proc(){
  800407:	f3 0f 1e fa          	endbr64 
  80040b:	55                   	push   rbp
  80040c:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80040f:	fa                   	cli    
    //puts("default_int_proc");
    eoi();
  800410:	b8 00 00 00 00       	mov    eax,0x0
  800415:	e8 e4 46 00 00       	call   804afe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  80041a:	fb                   	sti    
  80041b:	c9                   	leave  
  80041c:	48 cf                	iretq  
}
  80041e:	90                   	nop
  80041f:	5d                   	pop    rbp
  800420:	c3                   	ret    

0000000000800421 <breakpoint>:
void breakpoint(){
  800421:	f3 0f 1e fa          	endbr64 
  800425:	55                   	push   rbp
  800426:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800429:	fa                   	cli    
    //puts("breakpoint");
    eoi();
  80042a:	b8 00 00 00 00       	mov    eax,0x0
  80042f:	e8 ca 46 00 00       	call   804afe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800434:	fb                   	sti    
  800435:	c9                   	leave  
  800436:	48 cf                	iretq  
}
  800438:	90                   	nop
  800439:	5d                   	pop    rbp
  80043a:	c3                   	ret    

000000000080043b <overflow>:
void overflow(){
  80043b:	f3 0f 1e fa          	endbr64 
  80043f:	55                   	push   rbp
  800440:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800443:	fa                   	cli    
    //puts("overflow");
    eoi();
  800444:	b8 00 00 00 00       	mov    eax,0x0
  800449:	e8 b0 46 00 00       	call   804afe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  80044e:	fb                   	sti    
  80044f:	c9                   	leave  
  800450:	48 cf                	iretq  
}
  800452:	90                   	nop
  800453:	5d                   	pop    rbp
  800454:	c3                   	ret    

0000000000800455 <bounds>:
void bounds(){
  800455:	f3 0f 1e fa          	endbr64 
  800459:	55                   	push   rbp
  80045a:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80045d:	fa                   	cli    
    //puts("bounds");
    eoi();
  80045e:	b8 00 00 00 00       	mov    eax,0x0
  800463:	e8 96 46 00 00       	call   804afe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800468:	fb                   	sti    
  800469:	c9                   	leave  
  80046a:	48 cf                	iretq  
}
  80046c:	90                   	nop
  80046d:	5d                   	pop    rbp
  80046e:	c3                   	ret    

000000000080046f <undefined_operator>:
void undefined_operator(){
  80046f:	f3 0f 1e fa          	endbr64 
  800473:	55                   	push   rbp
  800474:	48 89 e5             	mov    rbp,rsp
    //puts("undef operator");
    eoi();
  800477:	b8 00 00 00 00       	mov    eax,0x0
  80047c:	e8 7d 46 00 00       	call   804afe <eoi>
    report_back_trace_of_err();
  800481:	b8 00 00 00 00       	mov    eax,0x0
  800486:	e8 9f 46 00 00       	call   804b2a <report_back_trace_of_err>
    __asm__ volatile ("jmp .\r\n leave \r\n iretq");
  80048b:	eb fe                	jmp    80048b <undefined_operator+0x1c>
  80048d:	c9                   	leave  
  80048e:	48 cf                	iretq  
}
  800490:	90                   	nop
  800491:	5d                   	pop    rbp
  800492:	c3                   	ret    

0000000000800493 <coprocessor_notexist>:
void coprocessor_notexist(){
  800493:	f3 0f 1e fa          	endbr64 
  800497:	55                   	push   rbp
  800498:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80049b:	fa                   	cli    
    //puts("coprocessor doesnt exist");
    eoi();
  80049c:	b8 00 00 00 00       	mov    eax,0x0
  8004a1:	e8 58 46 00 00       	call   804afe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  8004a6:	fb                   	sti    
  8004a7:	c9                   	leave  
  8004a8:	48 cf                	iretq  
}
  8004aa:	90                   	nop
  8004ab:	5d                   	pop    rbp
  8004ac:	c3                   	ret    

00000000008004ad <double_ints>:
void double_ints(){
  8004ad:	f3 0f 1e fa          	endbr64 
  8004b1:	55                   	push   rbp
  8004b2:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8004b5:	fa                   	cli    
    //puts("double interrupts");
    eoi();
  8004b6:	b8 00 00 00 00       	mov    eax,0x0
  8004bb:	e8 3e 46 00 00       	call   804afe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  8004c0:	fb                   	sti    
  8004c1:	c9                   	leave  
  8004c2:	48 cf                	iretq  
}
  8004c4:	90                   	nop
  8004c5:	5d                   	pop    rbp
  8004c6:	c3                   	ret    

00000000008004c7 <coprocessor_seg_overbound>:
void coprocessor_seg_overbound(){
  8004c7:	f3 0f 1e fa          	endbr64 
  8004cb:	55                   	push   rbp
  8004cc:	48 89 e5             	mov    rbp,rsp
    //puts("coprocessfor seg overdound");
    eoi();
  8004cf:	b8 00 00 00 00       	mov    eax,0x0
  8004d4:	e8 25 46 00 00       	call   804afe <eoi>
    __asm__ volatile ("leave \r\n iretq");
  8004d9:	c9                   	leave  
  8004da:	48 cf                	iretq  
}
  8004dc:	90                   	nop
  8004dd:	5d                   	pop    rbp
  8004de:	c3                   	ret    

00000000008004df <invalid_tss>:
void invalid_tss(){
  8004df:	f3 0f 1e fa          	endbr64 
  8004e3:	55                   	push   rbp
  8004e4:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  8004e7:	fa                   	cli    
    //puts("invalid tss");
    eoi();
  8004e8:	b8 00 00 00 00       	mov    eax,0x0
  8004ed:	e8 0c 46 00 00       	call   804afe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  8004f2:	fb                   	sti    
  8004f3:	c9                   	leave  
  8004f4:	48 cf                	iretq  
}
  8004f6:	90                   	nop
  8004f7:	5d                   	pop    rbp
  8004f8:	c3                   	ret    

00000000008004f9 <segment_notexist>:
void segment_notexist(){
  8004f9:	f3 0f 1e fa          	endbr64 
  8004fd:	55                   	push   rbp
  8004fe:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  800501:	fa                   	cli    
    //puts("seg nonexistent");
    eoi();
  800502:	b8 00 00 00 00       	mov    eax,0x0
  800507:	e8 f2 45 00 00       	call   804afe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  80050c:	fb                   	sti    
  80050d:	c9                   	leave  
  80050e:	48 cf                	iretq  
}
  800510:	90                   	nop
  800511:	5d                   	pop    rbp
  800512:	c3                   	ret    

0000000000800513 <stackseg_overbound>:
void stackseg_overbound(){
  800513:	f3 0f 1e fa          	endbr64 
  800517:	55                   	push   rbp
  800518:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80051b:	fa                   	cli    
    //puts("stack seg overbound");
    eoi();
  80051c:	b8 00 00 00 00       	mov    eax,0x0
  800521:	e8 d8 45 00 00       	call   804afe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800526:	fb                   	sti    
  800527:	c9                   	leave  
  800528:	48 cf                	iretq  
}
  80052a:	90                   	nop
  80052b:	5d                   	pop    rbp
  80052c:	c3                   	ret    

000000000080052d <general_protect>:
void general_protect(){
  80052d:	f3 0f 1e fa          	endbr64 
  800531:	55                   	push   rbp
  800532:	48 89 e5             	mov    rbp,rsp
  800535:	48 83 ec 10          	sub    rsp,0x10
    //print("general protect.");
    int err_code=0;
  800539:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    //杀死问题进程
    del_proc(cur_proc);
    printf("killed the problem process.\n");
	printf("shell:>");
    switch_proc_tss(0); */
    eoi();
  800540:	b8 00 00 00 00       	mov    eax,0x0
  800545:	e8 b4 45 00 00       	call   804afe <eoi>
    __asm__ volatile ("leave\r\n add $8,%rsp \r\n iretq");
  80054a:	c9                   	leave  
  80054b:	48 83 c4 08          	add    rsp,0x8
  80054f:	48 cf                	iretq  
}
  800551:	90                   	nop
  800552:	c9                   	leave  
  800553:	c3                   	ret    

0000000000800554 <coprocessor_err>:

void coprocessor_err(){
  800554:	f3 0f 1e fa          	endbr64 
  800558:	55                   	push   rbp
  800559:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  80055c:	fa                   	cli    
    //puts("coprocessor err");
    eoi();
  80055d:	b8 00 00 00 00       	mov    eax,0x0
  800562:	e8 97 45 00 00       	call   804afe <eoi>
    __asm__ volatile ("sti \r\n leave \r\n iretq");
  800567:	fb                   	sti    
  800568:	c9                   	leave  
  800569:	48 cf                	iretq  
}
  80056b:	90                   	nop
  80056c:	5d                   	pop    rbp
  80056d:	c3                   	ret    

000000000080056e <syscall>:
int syscall(int func,int b,int c,int d,int e,int f)
{
  80056e:	f3 0f 1e fa          	endbr64 
  800572:	55                   	push   rbp
  800573:	48 89 e5             	mov    rbp,rsp
  800576:	48 83 ec 20          	sub    rsp,0x20
  80057a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  80057d:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  800580:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  800583:	89 4d f0             	mov    DWORD PTR [rbp-0x10],ecx
  800586:	44 89 45 ec          	mov    DWORD PTR [rbp-0x14],r8d
  80058a:	44 89 4d e8          	mov    DWORD PTR [rbp-0x18],r9d
    switch (func)
  80058e:	83 7d fc 64          	cmp    DWORD PTR [rbp-0x4],0x64
  800592:	0f 87 17 02 00 00    	ja     8007af <syscall+0x241>
  800598:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80059b:	48 8b 04 c5 a0 16 81 	mov    rax,QWORD PTR [rax*8+0x8116a0]
  8005a2:	00 
  8005a3:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(b);
  8005a6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005a9:	48 98                	cdqe   
  8005ab:	48 89 c7             	mov    rdi,rax
  8005ae:	e8 19 25 00 00       	call   802acc <reg_device>
  8005b3:	e9 f7 01 00 00       	jmp    8007af <syscall+0x241>
        case 1:return dispose_device(b);
  8005b8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005bb:	89 c7                	mov    edi,eax
  8005bd:	e8 69 2f 00 00       	call   80352b <dispose_device>
  8005c2:	e9 e8 01 00 00       	jmp    8007af <syscall+0x241>
        case 2:return reg_driver(b);
  8005c7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005ca:	48 98                	cdqe   
  8005cc:	48 89 c7             	mov    rdi,rax
  8005cf:	e8 e0 27 00 00       	call   802db4 <reg_driver>
  8005d4:	e9 d6 01 00 00       	jmp    8007af <syscall+0x241>
        case 3:return dispose_driver(b);
  8005d9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005dc:	48 98                	cdqe   
  8005de:	48 89 c7             	mov    rdi,rax
  8005e1:	e8 e3 2f 00 00       	call   8035c9 <dispose_driver>
  8005e6:	e9 c4 01 00 00       	jmp    8007af <syscall+0x241>
        case 4:return call_drv_func(b,c,d);
  8005eb:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8005ee:	48 98                	cdqe   
  8005f0:	48 89 c2             	mov    rdx,rax
  8005f3:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8005f6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005f9:	89 ce                	mov    esi,ecx
  8005fb:	89 c7                	mov    edi,eax
  8005fd:	e8 d2 2c 00 00       	call   8032d4 <call_drv_func>
  800602:	e9 a8 01 00 00       	jmp    8007af <syscall+0x241>
        case 5:return req_page_at(b,c);
  800607:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80060a:	48 98                	cdqe   
  80060c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80060f:	89 d6                	mov    esi,edx
  800611:	48 89 c7             	mov    rdi,rax
  800614:	e8 89 10 00 00       	call   8016a2 <req_page_at>
  800619:	e9 91 01 00 00       	jmp    8007af <syscall+0x241>
        case 6:return free_page(b);
  80061e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800621:	48 98                	cdqe   
  800623:	48 89 c7             	mov    rdi,rax
  800626:	e8 8b 0e 00 00       	call   8014b6 <free_page>
  80062b:	e9 7f 01 00 00       	jmp    8007af <syscall+0x241>
        case 7:return reg_proc(b, c, d);
  800630:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  800633:	48 98                	cdqe   
  800635:	48 89 c2             	mov    rdx,rax
  800638:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80063b:	48 98                	cdqe   
  80063d:	48 89 c1             	mov    rcx,rax
  800640:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800643:	48 89 ce             	mov    rsi,rcx
  800646:	89 c7                	mov    edi,eax
  800648:	e8 7d 40 00 00       	call   8046ca <reg_proc>
  80064d:	e9 5d 01 00 00       	jmp    8007af <syscall+0x241>
        case 8:del_proc(b);
  800652:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800655:	89 c7                	mov    edi,eax
  800657:	e8 4b 3e 00 00       	call   8044a7 <del_proc>
        case 10:chk_vm(b,c);
  80065c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80065f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800662:	89 d6                	mov    esi,edx
  800664:	89 c7                	mov    edi,eax
  800666:	e8 10 11 00 00       	call   80177b <chk_vm>
        case 11:return sys_open(b,c);
  80066b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80066e:	48 98                	cdqe   
  800670:	48 89 c2             	mov    rdx,rax
  800673:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800676:	89 c6                	mov    esi,eax
  800678:	48 89 d7             	mov    rdi,rdx
  80067b:	e8 df 14 00 00       	call   801b5f <sys_open>
  800680:	e9 2a 01 00 00       	jmp    8007af <syscall+0x241>
        case 12:return sys_close(b);
  800685:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800688:	89 c7                	mov    edi,eax
  80068a:	e8 99 19 00 00       	call   802028 <sys_close>
  80068f:	e9 1b 01 00 00       	jmp    8007af <syscall+0x241>
        case 13:return sys_read(b,c,d);
  800694:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800697:	48 98                	cdqe   
  800699:	48 89 c1             	mov    rcx,rax
  80069c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80069f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006a2:	48 89 ce             	mov    rsi,rcx
  8006a5:	89 c7                	mov    edi,eax
  8006a7:	e8 92 1a 00 00       	call   80213e <sys_read>
  8006ac:	e9 fe 00 00 00       	jmp    8007af <syscall+0x241>
        case 14:return sys_write(b,c,d);
  8006b1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006b4:	48 98                	cdqe   
  8006b6:	48 89 c1             	mov    rcx,rax
  8006b9:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006bc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006bf:	48 89 ce             	mov    rsi,rcx
  8006c2:	89 c7                	mov    edi,eax
  8006c4:	e8 e4 19 00 00       	call   8020ad <sys_write>
  8006c9:	e9 e1 00 00 00       	jmp    8007af <syscall+0x241>
        case 15:return sys_seek(b,c,d);
  8006ce:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006d1:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006d4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006d7:	89 ce                	mov    esi,ecx
  8006d9:	89 c7                	mov    edi,eax
  8006db:	e8 ef 1a 00 00       	call   8021cf <sys_seek>
  8006e0:	e9 ca 00 00 00       	jmp    8007af <syscall+0x241>
        case 16:return sys_tell(b);
  8006e5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006e8:	89 c7                	mov    edi,eax
  8006ea:	e8 27 1b 00 00       	call   802216 <sys_tell>
  8006ef:	e9 bb 00 00 00       	jmp    8007af <syscall+0x241>
        case 17:return reg_vol(b,c,d);
  8006f4:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006f7:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006fa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006fd:	89 ce                	mov    esi,ecx
  8006ff:	89 c7                	mov    edi,eax
  800701:	b8 00 00 00 00       	mov    eax,0x0
  800706:	e8 49 13 00 00       	call   801a54 <reg_vol>
  80070b:	e9 9f 00 00 00       	jmp    8007af <syscall+0x241>
        case 18:return free_vol(b);
  800710:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800713:	89 c7                	mov    edi,eax
  800715:	b8 00 00 00 00       	mov    eax,0x0
  80071a:	e8 19 13 00 00       	call   801a38 <free_vol>
  80071f:	e9 8b 00 00 00       	jmp    8007af <syscall+0x241>
        case 19:return execute(b);
  800724:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800727:	48 98                	cdqe   
  800729:	48 89 c7             	mov    rdi,rax
  80072c:	e8 8c 46 00 00       	call   804dbd <execute>
  800731:	eb 7c                	jmp    8007af <syscall+0x241>
        case SYSCALL_EXIT:return sys_exit(b);
  800733:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800736:	89 c7                	mov    edi,eax
  800738:	e8 6c 3f 00 00       	call   8046a9 <sys_exit>
  80073d:	eb 70                	jmp    8007af <syscall+0x241>
        case SYSCALL_CALL:return exec_call(b);
  80073f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800742:	48 98                	cdqe   
  800744:	48 89 c7             	mov    rdi,rax
  800747:	e8 6c 47 00 00       	call   804eb8 <exec_call>
  80074c:	eb 61                	jmp    8007af <syscall+0x241>
        case SYSCALL_MKFIFO:return sys_mkfifo(b);
  80074e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800751:	89 c7                	mov    edi,eax
  800753:	e8 81 11 00 00       	call   8018d9 <sys_mkfifo>
  800758:	eb 55                	jmp    8007af <syscall+0x241>
        case SYSCALL_MALLOC:return sys_malloc(b);
  80075a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80075d:	89 c7                	mov    edi,eax
  80075f:	e8 1c 41 00 00       	call   804880 <sys_malloc>
  800764:	eb 49                	jmp    8007af <syscall+0x241>
        case SYSCALL_FREE:return sys_free(b);
  800766:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800769:	89 c7                	mov    edi,eax
  80076b:	e8 9e 42 00 00       	call   804a0e <sys_free>
  800770:	eb 3d                	jmp    8007af <syscall+0x241>
        case SYSCALL_KB_READC:return sys_getkbc();
  800772:	b8 00 00 00 00       	mov    eax,0x0
  800777:	e8 6e 59 00 00       	call   8060ea <sys_getkbc>
  80077c:	0f be c0             	movsx  eax,al
  80077f:	eb 2e                	jmp    8007af <syscall+0x241>
        case SYSCALL_FIND_DEV:return sys_find_dev(b);
  800781:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800784:	48 98                	cdqe   
  800786:	48 89 c7             	mov    rdi,rax
  800789:	e8 76 27 00 00       	call   802f04 <sys_find_dev>
  80078e:	eb 1f                	jmp    8007af <syscall+0x241>
        case SYSCALL_OPERATE_DEV:return sys_operate_dev(b,c,d);
  800790:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  800793:	48 98                	cdqe   
  800795:	48 89 c2             	mov    rdx,rax
  800798:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80079b:	48 98                	cdqe   
  80079d:	48 89 c1             	mov    rcx,rax
  8007a0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8007a3:	89 c6                	mov    esi,eax
  8007a5:	48 89 cf             	mov    rdi,rcx
  8007a8:	e8 e9 27 00 00       	call   802f96 <sys_operate_dev>
  8007ad:	eb 00                	jmp    8007af <syscall+0x241>
    }
    // __asm__ volatile("mov %0,%%eax\r\n mov %1,%%ebx\r\n mov %2,%%ecx\r\n mov %3,%%edx\r\n mov %4,%%esi\r\n mov %5,%%edi"\
    // ::"m"(func),"m"(a),"m"(b),"m"(c),"m"(d),"m"(e));
    // __asm__ volatile("int $0x80\r\n leave\r\n ret");
  8007af:	c9                   	leave  
  8007b0:	c3                   	ret    

00000000008007b1 <main>:
#include <kb.h>
#include "com.h"

int manage_proc_lock=1;
void main(unsigned int magic,void* addr)
{
  8007b1:	f3 0f 1e fa          	endbr64 
  8007b5:	55                   	push   rbp
  8007b6:	48 89 e5             	mov    rbp,rsp
  8007b9:	48 83 ec 60          	sub    rsp,0x60
  8007bd:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  8007c0:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi

    struct multiboot_header* mbi=0ul;
  8007c4:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8007cb:	00 
    mbi=(struct multiboot_header*)addr;
  8007cc:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8007d0:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    init_logging();
  8007d4:	b8 00 00 00 00       	mov    eax,0x0
  8007d9:	e8 2b 03 00 00       	call   800b09 <init_logging>
    }
    //获取tags
    struct multiboot_tag *tag;

	unsigned size;
    size = *(unsigned long*)addr;
  8007de:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8007e2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8007e5:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
//    //printf("Announced mbi size 0x%x\n", size);
	for (tag = (struct multiboot_tag *)(addr + 8);
  8007e8:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8007ec:	48 83 c0 08          	add    rax,0x8
  8007f0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8007f4:	e9 5b 02 00 00       	jmp    800a54 <main+0x2a3>
		 tag->type != MULTIBOOT_TAG_TYPE_END;
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
	{
		//printf("Tag 0x%x, Size 0x%x\n", tag->type, tag->size);
		switch (tag->type)
  8007f9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8007fd:	8b 00                	mov    eax,DWORD PTR [rax]
  8007ff:	83 f8 08             	cmp    eax,0x8
  800802:	0f 87 39 02 00 00    	ja     800a41 <main+0x290>
  800808:	89 c0                	mov    eax,eax
  80080a:	48 8b 04 c5 08 1a 81 	mov    rax,QWORD PTR [rax*8+0x811a08]
  800811:	00 
  800812:	3e ff e0             	notrack jmp rax
			break;
		case MULTIBOOT_TAG_TYPE_BASIC_MEMINFO:
			//printf("mem_lower = %uKB, mem_upper = %uKB\n",
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_lower,
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_upper);
			set_high_mem_base(((struct multiboot_tag_basic_meminfo *)tag)->mem_lower);
  800815:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800819:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80081c:	89 c7                	mov    edi,eax
  80081e:	e8 98 07 00 00       	call   800fbb <set_high_mem_base>
			break;
  800823:	e9 19 02 00 00       	jmp    800a41 <main+0x290>

			break;
		case MULTIBOOT_TAG_TYPE_MMAP:
		{
			//printf("mmap\n");
            for (multiboot_memory_map_t * mmap = ((struct multiboot_tag_mmap *)tag)->entries;
  800828:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80082c:	48 83 c0 10          	add    rax,0x10
  800830:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  800834:	eb 37                	jmp    80086d <main+0xbc>
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
            {
                set_mem_area(mmap->addr,mmap->len,mmap->type);
  800836:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80083a:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80083d:	89 c2                	mov    edx,eax
  80083f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800843:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  800847:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80084b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80084e:	48 89 ce             	mov    rsi,rcx
  800851:	48 89 c7             	mov    rdi,rax
  800854:	e8 79 07 00 00       	call   800fd2 <set_mem_area>
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
  800859:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80085d:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  800860:	89 c2                	mov    edx,eax
  800862:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800866:	48 01 d0             	add    rax,rdx
  800869:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
  80086d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800871:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800874:	89 c2                	mov    edx,eax
  800876:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80087a:	48 01 d0             	add    rax,rdx
  80087d:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  800881:	72 b3                	jb     800836 <main+0x85>
            }

		}
		break;
  800883:	e9 b9 01 00 00       	jmp    800a41 <main+0x290>
		case MULTIBOOT_TAG_TYPE_FRAMEBUFFER:
		{
			multiboot_uint32_t color;
			unsigned i;
			struct multiboot_tag_framebuffer *tagfb = (struct multiboot_tag_framebuffer *)tag;
  800888:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80088c:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
			void *fb = (void *) FRAMEBUFFER_ADDR;
  800890:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x40000000
  800897:	40 
			set_framebuffer(*tagfb);
  800898:	48 83 ec 08          	sub    rsp,0x8
  80089c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8008a0:	ff 70 20             	push   QWORD PTR [rax+0x20]
  8008a3:	ff 70 18             	push   QWORD PTR [rax+0x18]
  8008a6:	ff 70 10             	push   QWORD PTR [rax+0x10]
  8008a9:	ff 70 08             	push   QWORD PTR [rax+0x8]
  8008ac:	ff 30                	push   QWORD PTR [rax]
  8008ae:	e8 82 50 00 00       	call   805935 <set_framebuffer>
  8008b3:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  8008b7:	b8 00 00 00 00       	mov    eax,0x0
  8008bc:	e8 bf 4e 00 00       	call   805780 <init_framebuffer>
			switch (tagfb->common.framebuffer_type)
  8008c1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8008c5:	0f b6 40 1d          	movzx  eax,BYTE PTR [rax+0x1d]
  8008c9:	0f b6 c0             	movzx  eax,al
  8008cc:	83 f8 02             	cmp    eax,0x2
  8008cf:	0f 84 5a 01 00 00    	je     800a2f <main+0x27e>
  8008d5:	83 f8 02             	cmp    eax,0x2
  8008d8:	0f 8f 5a 01 00 00    	jg     800a38 <main+0x287>
  8008de:	85 c0                	test   eax,eax
  8008e0:	74 0e                	je     8008f0 <main+0x13f>
  8008e2:	83 f8 01             	cmp    eax,0x1
  8008e5:	0f 84 15 01 00 00    	je     800a00 <main+0x24f>
  8008eb:	e9 48 01 00 00       	jmp    800a38 <main+0x287>
			case MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED:
			{
				unsigned best_distance, distance;
				struct multiboot_color *palette;

				palette = tagfb->framebuffer_palette;
  8008f0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8008f4:	48 83 c0 22          	add    rax,0x22
  8008f8:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

				color = 0;
  8008fc:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
				best_distance = 4 * 256 * 256;
  800903:	c7 45 e8 00 00 04 00 	mov    DWORD PTR [rbp-0x18],0x40000

				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  80090a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  800911:	e9 d4 00 00 00       	jmp    8009ea <main+0x239>
				{
					distance = (0xff - palette[i].blue) * (0xff - palette[i].blue) + palette[i].red * palette[i].red + palette[i].green * palette[i].green;
  800916:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800919:	48 89 d0             	mov    rax,rdx
  80091c:	48 01 c0             	add    rax,rax
  80091f:	48 01 c2             	add    rdx,rax
  800922:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800926:	48 01 d0             	add    rax,rdx
  800929:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  80092d:	0f b6 c0             	movzx  eax,al
  800930:	ba ff 00 00 00       	mov    edx,0xff
  800935:	89 d1                	mov    ecx,edx
  800937:	29 c1                	sub    ecx,eax
  800939:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80093c:	48 89 d0             	mov    rax,rdx
  80093f:	48 01 c0             	add    rax,rax
  800942:	48 01 c2             	add    rdx,rax
  800945:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800949:	48 01 d0             	add    rax,rdx
  80094c:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  800950:	0f b6 d0             	movzx  edx,al
  800953:	b8 ff 00 00 00       	mov    eax,0xff
  800958:	29 d0                	sub    eax,edx
  80095a:	89 ce                	mov    esi,ecx
  80095c:	0f af f0             	imul   esi,eax
  80095f:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800962:	48 89 d0             	mov    rax,rdx
  800965:	48 01 c0             	add    rax,rax
  800968:	48 01 c2             	add    rdx,rax
  80096b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80096f:	48 01 d0             	add    rax,rdx
  800972:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800975:	0f b6 c8             	movzx  ecx,al
  800978:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80097b:	48 89 d0             	mov    rax,rdx
  80097e:	48 01 c0             	add    rax,rax
  800981:	48 01 c2             	add    rdx,rax
  800984:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800988:	48 01 d0             	add    rax,rdx
  80098b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80098e:	0f b6 c0             	movzx  eax,al
  800991:	0f af c1             	imul   eax,ecx
  800994:	01 c6                	add    esi,eax
  800996:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800999:	48 89 d0             	mov    rax,rdx
  80099c:	48 01 c0             	add    rax,rax
  80099f:	48 01 c2             	add    rdx,rax
  8009a2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009a6:	48 01 d0             	add    rax,rdx
  8009a9:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  8009ad:	0f b6 c8             	movzx  ecx,al
  8009b0:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009b3:	48 89 d0             	mov    rax,rdx
  8009b6:	48 01 c0             	add    rax,rax
  8009b9:	48 01 c2             	add    rdx,rax
  8009bc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009c0:	48 01 d0             	add    rax,rdx
  8009c3:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  8009c7:	0f b6 c0             	movzx  eax,al
  8009ca:	0f af c1             	imul   eax,ecx
  8009cd:	01 f0                	add    eax,esi
  8009cf:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
					if (distance < best_distance)
  8009d2:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8009d5:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  8009d8:	73 0c                	jae    8009e6 <main+0x235>
					{
						color = i;
  8009da:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8009dd:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
						best_distance = distance;
  8009e0:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8009e3:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  8009e6:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8009ea:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8009ee:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
  8009f2:	0f b7 c0             	movzx  eax,ax
  8009f5:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8009f8:	0f 82 18 ff ff ff    	jb     800916 <main+0x165>
					}
				}
			}
			break;
  8009fe:	eb 40                	jmp    800a40 <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_RGB:
				color = ((1 << tagfb->framebuffer_blue_mask_size) - 1) << tagfb->framebuffer_blue_field_position;
  800a00:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a04:	0f b6 40 25          	movzx  eax,BYTE PTR [rax+0x25]
  800a08:	0f b6 c0             	movzx  eax,al
  800a0b:	ba 01 00 00 00       	mov    edx,0x1
  800a10:	89 c1                	mov    ecx,eax
  800a12:	d3 e2                	shl    edx,cl
  800a14:	89 d0                	mov    eax,edx
  800a16:	8d 50 ff             	lea    edx,[rax-0x1]
  800a19:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a1d:	0f b6 40 24          	movzx  eax,BYTE PTR [rax+0x24]
  800a21:	0f b6 c0             	movzx  eax,al
  800a24:	89 c1                	mov    ecx,eax
  800a26:	d3 e2                	shl    edx,cl
  800a28:	89 d0                	mov    eax,edx
  800a2a:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
				break;
  800a2d:	eb 11                	jmp    800a40 <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT:
				color = '\\' | 0x0100;
  800a2f:	c7 45 c4 5c 01 00 00 	mov    DWORD PTR [rbp-0x3c],0x15c
				break;
  800a36:	eb 08                	jmp    800a40 <main+0x28f>

			default:
				color = 0xffffffff;
  800a38:	c7 45 c4 ff ff ff ff 	mov    DWORD PTR [rbp-0x3c],0xffffffff
				break;
  800a3f:	90                   	nop
			}

			break;
  800a40:	90                   	nop
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
  800a41:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800a45:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800a48:	83 c0 07             	add    eax,0x7
  800a4b:	89 c0                	mov    eax,eax
  800a4d:	83 e0 f8             	and    eax,0xfffffff8
  800a50:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
		 tag->type != MULTIBOOT_TAG_TYPE_END;
  800a54:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800a58:	8b 00                	mov    eax,DWORD PTR [rax]
  800a5a:	85 c0                	test   eax,eax
  800a5c:	0f 85 97 fd ff ff    	jne    8007f9 <main+0x48>
		}
		}
	}
	tag = (struct multiboot_tag *)((multiboot_uint8_t *)tag + ((tag->size + 7) & ~7));
  800a62:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800a66:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800a69:	83 c0 07             	add    eax,0x7
  800a6c:	89 c0                	mov    eax,eax
  800a6e:	83 e0 f8             	and    eax,0xfffffff8
  800a71:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
	//printf("Total mbi size 0x%x\n", (unsigned)tag - addr);
	char disk_count=*(char*)0x475;
  800a75:	b8 75 04 00 00       	mov    eax,0x475
  800a7a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800a7d:	88 45 db             	mov    BYTE PTR [rbp-0x25],al
	//printf("disk count:%d\n",disk_count);
    init_font();
  800a80:	b8 00 00 00 00       	mov    eax,0x0
  800a85:	e8 b5 4d 00 00       	call   80583f <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800a8a:	bf c8 19 81 00       	mov    edi,0x8119c8
  800a8f:	e8 5d 52 00 00       	call   805cf1 <print>
    init_int();
  800a94:	b8 00 00 00 00       	mov    eax,0x0
  800a99:	e8 62 f5 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800a9e:	bf e5 19 81 00       	mov    edi,0x8119e5
  800aa3:	e8 49 52 00 00       	call   805cf1 <print>
    init_memory();
  800aa8:	b8 00 00 00 00       	mov    eax,0x0
  800aad:	e8 d0 07 00 00       	call   801282 <init_memory>
    init_com(PORT_COM1);
  800ab2:	bf f8 03 00 00       	mov    edi,0x3f8
  800ab7:	e8 6d 8a 00 00       	call   809529 <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800abc:	be f8 03 00 00       	mov    esi,0x3f8
  800ac1:	bf f2 19 81 00       	mov    edi,0x8119f2
  800ac6:	e8 aa 8b 00 00       	call   809675 <com_puts>
	init_paging();
  800acb:	b8 00 00 00 00       	mov    eax,0x0
  800ad0:	e8 db 04 00 00       	call   800fb0 <init_paging>
// 	init_gdt();
    init_drvdev_man();
  800ad5:	b8 00 00 00 00       	mov    eax,0x0
  800ada:	e8 d3 1f 00 00       	call   802ab2 <init_drvdev_man>
    init_proc();
  800adf:	b8 00 00 00 00       	mov    eax,0x0
  800ae4:	e8 b4 2e 00 00       	call   80399d <init_proc>
    //自带驱动
    //init_tty();
    init_kb();
  800ae9:	b8 00 00 00 00       	mov    eax,0x0
  800aee:	e8 65 54 00 00       	call   805f58 <init_kb>
    init_disk();
  800af3:	b8 00 00 00 00       	mov    eax,0x0
  800af8:	e8 51 56 00 00       	call   80614e <init_disk>

//	init_vfs();
    //init_fat16();
	manage_proc_lock=0;
  800afd:	c7 05 41 95 00 00 00 	mov    DWORD PTR [rip+0x9541],0x0        # 80a048 <manage_proc_lock>
  800b04:	00 00 00 
    while (1);
  800b07:	eb fe                	jmp    800b07 <main+0x356>

0000000000800b09 <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800b09:	f3 0f 1e fa          	endbr64 
  800b0d:	55                   	push   rbp
  800b0e:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800b11:	48 c7 05 e4 f4 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff4e4],0xb8000        # 400000 <video>
  800b18:	00 80 0b 00 
    xpos=0;
  800b1c:	c7 05 e2 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff4e2],0x0        # 400008 <xpos>
  800b23:	00 00 00 
    ypos=0;
  800b26:	c7 05 dc f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff4dc],0x0        # 40000c <ypos>
  800b2d:	00 00 00 
}
  800b30:	90                   	nop
  800b31:	5d                   	pop    rbp
  800b32:	c3                   	ret    

0000000000800b33 <itoa>:

static void itoa (char *buf, int base, int d)
{
  800b33:	f3 0f 1e fa          	endbr64 
  800b37:	55                   	push   rbp
  800b38:	48 89 e5             	mov    rbp,rsp
  800b3b:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800b3f:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800b42:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800b45:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800b49:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800b4d:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800b50:	48 98                	cdqe   
  800b52:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800b56:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800b5d:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800b61:	75 27                	jne    800b8a <itoa+0x57>
  800b63:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800b67:	79 21                	jns    800b8a <itoa+0x57>
    {
        *p++ = '-';
  800b69:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800b6d:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800b71:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800b75:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800b78:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800b7d:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800b80:	f7 d8                	neg    eax
  800b82:	48 98                	cdqe   
  800b84:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800b88:	eb 0d                	jmp    800b97 <itoa+0x64>
    }
    else if (base == 'x')
  800b8a:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800b8e:	75 07                	jne    800b97 <itoa+0x64>
        divisor = 16;
  800b90:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800b97:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800b9a:	48 63 c8             	movsxd rcx,eax
  800b9d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800ba1:	ba 00 00 00 00       	mov    edx,0x0
  800ba6:	48 f7 f1             	div    rcx
  800ba9:	48 89 d0             	mov    rax,rdx
  800bac:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800baf:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800bb3:	7f 0a                	jg     800bbf <itoa+0x8c>
  800bb5:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800bb8:	83 c0 30             	add    eax,0x30
  800bbb:	89 c1                	mov    ecx,eax
  800bbd:	eb 08                	jmp    800bc7 <itoa+0x94>
  800bbf:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800bc2:	83 c0 57             	add    eax,0x57
  800bc5:	89 c1                	mov    ecx,eax
  800bc7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800bcb:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800bcf:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800bd3:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800bd5:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800bd8:	48 63 f0             	movsxd rsi,eax
  800bdb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800bdf:	ba 00 00 00 00       	mov    edx,0x0
  800be4:	48 f7 f6             	div    rsi
  800be7:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800beb:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800bf0:	75 a5                	jne    800b97 <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800bf2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800bf6:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800bf9:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800bfd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800c01:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c05:	48 83 e8 01          	sub    rax,0x1
  800c09:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800c0d:	eb 2b                	jmp    800c3a <itoa+0x107>
    {
        char tmp = *p1;
  800c0f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c13:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800c16:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800c19:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c1d:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800c20:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c24:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800c26:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c2a:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800c2e:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800c30:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800c35:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800c3a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c3e:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800c42:	72 cb                	jb     800c0f <itoa+0xdc>
    }
}
  800c44:	90                   	nop
  800c45:	90                   	nop
  800c46:	5d                   	pop    rbp
  800c47:	c3                   	ret    

0000000000800c48 <putchar>:
 
/* 在屏幕上输出字符 C 。 */
static void putchar (char c)
{
  800c48:	f3 0f 1e fa          	endbr64 
  800c4c:	55                   	push   rbp
  800c4d:	48 89 e5             	mov    rbp,rsp
  800c50:	48 83 ec 20          	sub    rsp,0x20
  800c54:	89 f8                	mov    eax,edi
  800c56:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    char s[2]={c,'\0'};
  800c59:	0f b6 45 ec          	movzx  eax,BYTE PTR [rbp-0x14]
  800c5d:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  800c60:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
    print(s);
  800c64:	48 8d 45 fe          	lea    rax,[rbp-0x2]
  800c68:	48 89 c7             	mov    rdi,rax
  800c6b:	e8 81 50 00 00       	call   805cf1 <print>
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800c70:	c9                   	leave  
  800c71:	c3                   	ret    

0000000000800c72 <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800c72:	f3 0f 1e fa          	endbr64 
  800c76:	55                   	push   rbp
  800c77:	48 89 e5             	mov    rbp,rsp
  800c7a:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800c81:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800c88:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800c8f:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800c96:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800c9d:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800ca4:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800cab:	84 c0                	test   al,al
  800cad:	74 20                	je     800ccf <printf+0x5d>
  800caf:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800cb3:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800cb7:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800cbb:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800cbf:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800cc3:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800cc7:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800ccb:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800ccf:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800cd6:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char c;
    char buf[20];
 
    arg++;
  800cdd:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800ce4:	08 
 
    while ((c = *format++) != 0)
  800ce5:	e9 29 01 00 00       	jmp    800e13 <printf+0x1a1>
    {
        if (c != '%')
  800cea:	80 bd 3f ff ff ff 25 	cmp    BYTE PTR [rbp-0xc1],0x25
  800cf1:	74 13                	je     800d06 <printf+0x94>
            putchar (c);
  800cf3:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800cfa:	89 c7                	mov    edi,eax
  800cfc:	e8 47 ff ff ff       	call   800c48 <putchar>
  800d01:	e9 0d 01 00 00       	jmp    800e13 <printf+0x1a1>
        else
        {
            char *p;
 
            c = *format++;
  800d06:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800d0d:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800d11:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800d18:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800d1b:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
            switch (c)
  800d21:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800d28:	83 f8 78             	cmp    eax,0x78
  800d2b:	74 26                	je     800d53 <printf+0xe1>
  800d2d:	83 f8 78             	cmp    eax,0x78
  800d30:	0f 8f be 00 00 00    	jg     800df4 <printf+0x182>
  800d36:	83 f8 75             	cmp    eax,0x75
  800d39:	74 18                	je     800d53 <printf+0xe1>
  800d3b:	83 f8 75             	cmp    eax,0x75
  800d3e:	0f 8f b0 00 00 00    	jg     800df4 <printf+0x182>
  800d44:	83 f8 64             	cmp    eax,0x64
  800d47:	74 0a                	je     800d53 <printf+0xe1>
  800d49:	83 f8 73             	cmp    eax,0x73
  800d4c:	74 41                	je     800d8f <printf+0x11d>
  800d4e:	e9 a1 00 00 00       	jmp    800df4 <printf+0x182>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800d53:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800d5a:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800d5e:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800d65:	8b 10                	mov    edx,DWORD PTR [rax]
  800d67:	0f be 8d 3f ff ff ff 	movsx  ecx,BYTE PTR [rbp-0xc1]
  800d6e:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800d75:	89 ce                	mov    esi,ecx
  800d77:	48 89 c7             	mov    rdi,rax
  800d7a:	e8 b4 fd ff ff       	call   800b33 <itoa>
                p = buf;
  800d7f:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800d86:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800d8d:	eb 34                	jmp    800dc3 <printf+0x151>
                break;
 
            case 's':
                p = *arg++;
  800d8f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800d96:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800d9a:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800da1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800da4:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800dab:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800db2:	00 
  800db3:	75 0d                	jne    800dc2 <printf+0x150>
                    p = "(null)";
  800db5:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x811a50
  800dbc:	50 1a 81 00 
  800dc0:	eb 22                	jmp    800de4 <printf+0x172>
 
string:
  800dc2:	90                   	nop
                while (*p)
  800dc3:	eb 1f                	jmp    800de4 <printf+0x172>
                    putchar (*p++);
  800dc5:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800dcc:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800dd0:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800dd7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800dda:	0f be c0             	movsx  eax,al
  800ddd:	89 c7                	mov    edi,eax
  800ddf:	e8 64 fe ff ff       	call   800c48 <putchar>
                while (*p)
  800de4:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800deb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800dee:	84 c0                	test   al,al
  800df0:	75 d3                	jne    800dc5 <printf+0x153>
                break;
  800df2:	eb 1f                	jmp    800e13 <printf+0x1a1>
 
            default:
                putchar (*((int *) arg++));
  800df4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800dfb:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800dff:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e06:	8b 00                	mov    eax,DWORD PTR [rax]
  800e08:	0f be c0             	movsx  eax,al
  800e0b:	89 c7                	mov    edi,eax
  800e0d:	e8 36 fe ff ff       	call   800c48 <putchar>
                break;
  800e12:	90                   	nop
    while ((c = *format++) != 0)
  800e13:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800e1a:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e1e:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800e25:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e28:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
  800e2e:	80 bd 3f ff ff ff 00 	cmp    BYTE PTR [rbp-0xc1],0x0
  800e35:	0f 85 af fe ff ff    	jne    800cea <printf+0x78>
            }
        }
    }
}
  800e3b:	90                   	nop
  800e3c:	90                   	nop
  800e3d:	c9                   	leave  
  800e3e:	c3                   	ret    

0000000000800e3f <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800e3f:	f3 0f 1e fa          	endbr64 
  800e43:	55                   	push   rbp
  800e44:	48 89 e5             	mov    rbp,rsp
  800e47:	48 83 ec 40          	sub    rsp,0x40
  800e4b:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800e4f:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800e53:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800e56:	48 8b 15 03 92 00 00 	mov    rdx,QWORD PTR [rip+0x9203]        # 80a060 <pml4>
  800e5d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800e61:	48 c1 e8 27          	shr    rax,0x27
  800e65:	48 c1 e0 03          	shl    rax,0x3
  800e69:	48 01 d0             	add    rax,rdx
  800e6c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800e6f:	b0 00                	mov    al,0x0
  800e71:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800e75:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800e7c:	00 00 00 
  800e7f:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800e83:	48 c1 e8 1e          	shr    rax,0x1e
  800e87:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800e8a:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800e8d:	48 98                	cdqe   
  800e8f:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800e96:	00 
  800e97:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800e9b:	48 01 d0             	add    rax,rdx
  800e9e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800ea1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800ea5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ea9:	83 e0 01             	and    eax,0x1
  800eac:	48 85 c0             	test   rax,rax
  800eaf:	75 2f                	jne    800ee0 <mmap+0xa1>
    {
        pdp=(page_item*)vmalloc();
  800eb1:	b8 00 00 00 00       	mov    eax,0x0
  800eb6:	e8 a3 01 00 00       	call   80105e <vmalloc>
  800ebb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        pdptp[pdpti]=(addr_t)pdp|attr;
  800ebf:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800ec2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800ec6:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800ec9:	48 98                	cdqe   
  800ecb:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800ed2:	00 
  800ed3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800ed7:	48 01 f0             	add    rax,rsi
  800eda:	48 09 ca             	or     rdx,rcx
  800edd:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800ee0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ee4:	b0 00                	mov    al,0x0
  800ee6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800eea:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800eee:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800ef3:	48 c1 e8 15          	shr    rax,0x15
  800ef7:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800efe:	00 
  800eff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f03:	48 01 d0             	add    rax,rdx
  800f06:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f09:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800f0d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f11:	83 e0 01             	and    eax,0x1
  800f14:	48 85 c0             	test   rax,rax
  800f17:	75 37                	jne    800f50 <mmap+0x111>
    {
        pt=(page_item*)vmalloc();
  800f19:	b8 00 00 00 00       	mov    eax,0x0
  800f1e:	e8 3b 01 00 00       	call   80105e <vmalloc>
  800f23:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800f27:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f2a:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800f2e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f32:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f37:	48 c1 e8 15          	shr    rax,0x15
  800f3b:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f42:	00 
  800f43:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f47:	48 01 f0             	add    rax,rsi
  800f4a:	48 09 ca             	or     rdx,rcx
  800f4d:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  800f50:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f54:	b0 00                	mov    al,0x0
  800f56:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  800f5a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  800f5d:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  800f61:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  800f67:	48 c1 ea 0c          	shr    rdx,0xc
  800f6b:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  800f72:	00 
  800f73:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800f77:	48 01 ca             	add    rdx,rcx
  800f7a:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  800f7e:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  800f81:	b8 00 00 00 00       	mov    eax,0x0
}
  800f86:	c9                   	leave  
  800f87:	c3                   	ret    

0000000000800f88 <mdemap>:

stat_t mdemap(addr_t la)
{
  800f88:	f3 0f 1e fa          	endbr64 
  800f8c:	55                   	push   rbp
  800f8d:	48 89 e5             	mov    rbp,rsp
  800f90:	48 83 ec 10          	sub    rsp,0x10
  800f94:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  800f98:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f9c:	ba 00 00 00 00       	mov    edx,0x0
  800fa1:	48 89 c6             	mov    rsi,rax
  800fa4:	bf 00 00 00 00       	mov    edi,0x0
  800fa9:	e8 91 fe ff ff       	call   800e3f <mmap>
}
  800fae:	c9                   	leave  
  800faf:	c3                   	ret    

0000000000800fb0 <init_paging>:
int init_paging()
{
  800fb0:	f3 0f 1e fa          	endbr64 
  800fb4:	55                   	push   rbp
  800fb5:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  800fb8:	90                   	nop
  800fb9:	5d                   	pop    rbp
  800fba:	c3                   	ret    

0000000000800fbb <set_high_mem_base>:
void set_high_mem_base(int base)
{
  800fbb:	f3 0f 1e fa          	endbr64 
  800fbf:	55                   	push   rbp
  800fc0:	48 89 e5             	mov    rbp,rsp
  800fc3:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  800fc6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  800fc9:	89 05 a9 90 00 00    	mov    DWORD PTR [rip+0x90a9],eax        # 80a078 <high_mem_base>
}
  800fcf:	90                   	nop
  800fd0:	5d                   	pop    rbp
  800fd1:	c3                   	ret    

0000000000800fd2 <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  800fd2:	f3 0f 1e fa          	endbr64 
  800fd6:	55                   	push   rbp
  800fd7:	48 89 e5             	mov    rbp,rsp
  800fda:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  800fde:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  800fe2:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  800fe6:	8b 05 34 f2 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff234]        # 400220 <mmap_t_i>
  800fec:	48 63 d0             	movsxd rdx,eax
  800fef:	48 89 d0             	mov    rax,rdx
  800ff2:	48 01 c0             	add    rax,rax
  800ff5:	48 01 d0             	add    rax,rdx
  800ff8:	48 c1 e0 03          	shl    rax,0x3
  800ffc:	48 8d 90 40 00 40 00 	lea    rdx,[rax+0x400040]
  801003:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801007:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  80100a:	8b 05 10 f2 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff210]        # 400220 <mmap_t_i>
  801010:	48 63 d0             	movsxd rdx,eax
  801013:	48 89 d0             	mov    rax,rdx
  801016:	48 01 c0             	add    rax,rax
  801019:	48 01 d0             	add    rax,rdx
  80101c:	48 c1 e0 03          	shl    rax,0x3
  801020:	48 8d 90 48 00 40 00 	lea    rdx,[rax+0x400048]
  801027:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80102b:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  80102e:	8b 05 ec f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff1ec]        # 400220 <mmap_t_i>
  801034:	8d 50 01             	lea    edx,[rax+0x1]
  801037:	89 15 e3 f1 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff1e3],edx        # 400220 <mmap_t_i>
  80103d:	48 63 d0             	movsxd rdx,eax
  801040:	48 89 d0             	mov    rax,rdx
  801043:	48 01 c0             	add    rax,rax
  801046:	48 01 d0             	add    rax,rdx
  801049:	48 c1 e0 03          	shl    rax,0x3
  80104d:	48 8d 90 50 00 40 00 	lea    rdx,[rax+0x400050]
  801054:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801058:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  80105b:	90                   	nop
  80105c:	5d                   	pop    rbp
  80105d:	c3                   	ret    

000000000080105e <vmalloc>:
addr_t vmalloc()
{
  80105e:	f3 0f 1e fa          	endbr64 
  801062:	55                   	push   rbp
  801063:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  801066:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80106d:	eb 76                	jmp    8010e5 <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  80106f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801076:	eb 63                	jmp    8010db <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  801078:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80107b:	48 98                	cdqe   
  80107d:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801084:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801087:	be 01 00 00 00       	mov    esi,0x1
  80108c:	89 c1                	mov    ecx,eax
  80108e:	d3 e6                	shl    esi,cl
  801090:	89 f0                	mov    eax,esi
  801092:	21 d0                	and    eax,edx
  801094:	85 c0                	test   eax,eax
  801096:	75 3f                	jne    8010d7 <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  801098:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80109b:	48 98                	cdqe   
  80109d:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  8010a4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8010a7:	be 01 00 00 00       	mov    esi,0x1
  8010ac:	89 c1                	mov    ecx,eax
  8010ae:	d3 e6                	shl    esi,cl
  8010b0:	89 f0                	mov    eax,esi
  8010b2:	09 c2                	or     edx,eax
  8010b4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010b7:	48 98                	cdqe   
  8010b9:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  8010c0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010c3:	c1 e0 05             	shl    eax,0x5
  8010c6:	89 c2                	mov    edx,eax
  8010c8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8010cb:	01 d0                	add    eax,edx
  8010cd:	83 c0 20             	add    eax,0x20
  8010d0:	c1 e0 0c             	shl    eax,0xc
  8010d3:	48 98                	cdqe   
  8010d5:	eb 14                	jmp    8010eb <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  8010d7:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8010db:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8010df:	7e 97                	jle    801078 <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8010e1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8010e5:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8010e9:	7e 84                	jle    80106f <vmalloc+0x11>
            }
        }
    }
}
  8010eb:	5d                   	pop    rbp
  8010ec:	c3                   	ret    

00000000008010ed <vmfree>:

int vmfree(addr_t ptr)
{
  8010ed:	f3 0f 1e fa          	endbr64 
  8010f1:	55                   	push   rbp
  8010f2:	48 89 e5             	mov    rbp,rsp
  8010f5:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  8010f9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8010fd:	48 c1 e8 0c          	shr    rax,0xc
  801101:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  801104:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801107:	8d 50 1f             	lea    edx,[rax+0x1f]
  80110a:	85 c0                	test   eax,eax
  80110c:	0f 48 c2             	cmovs  eax,edx
  80110f:	c1 f8 05             	sar    eax,0x5
  801112:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  801115:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801118:	99                   	cdq    
  801119:	c1 ea 1b             	shr    edx,0x1b
  80111c:	01 d0                	add    eax,edx
  80111e:	83 e0 1f             	and    eax,0x1f
  801121:	29 d0                	sub    eax,edx
  801123:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  801126:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801129:	48 98                	cdqe   
  80112b:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801132:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801135:	be 01 00 00 00       	mov    esi,0x1
  80113a:	89 c1                	mov    ecx,eax
  80113c:	d3 e6                	shl    esi,cl
  80113e:	89 f0                	mov    eax,esi
  801140:	f7 d0                	not    eax
  801142:	21 c2                	and    edx,eax
  801144:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801147:	48 98                	cdqe   
  801149:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
}
  801150:	90                   	nop
  801151:	5d                   	pop    rbp
  801152:	c3                   	ret    

0000000000801153 <page_err>:
void page_err(){
  801153:	f3 0f 1e fa          	endbr64 
  801157:	55                   	push   rbp
  801158:	48 89 e5             	mov    rbp,rsp
  80115b:	53                   	push   rbx
  80115c:	48 83 ec 28          	sub    rsp,0x28
    asm("cli");
  801160:	fa                   	cli    
    print("page err\n");
  801161:	bf 58 1a 81 00       	mov    edi,0x811a58
  801166:	e8 86 4b 00 00       	call   805cf1 <print>
    unsigned long err_code=0,l_addr=0;
  80116b:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  801172:	00 
  801173:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  80117a:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  80117b:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  80117f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  801183:	0f 20 d0             	mov    rax,cr2
  801186:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  80118a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80118e:	83 e0 01             	and    eax,0x1
  801191:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  801194:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801198:	75 27                	jne    8011c1 <page_err+0x6e>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        mmap(vmalloc(),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  80119a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80119e:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  8011a4:	48 89 c3             	mov    rbx,rax
  8011a7:	b8 00 00 00 00       	mov    eax,0x0
  8011ac:	e8 ad fe ff ff       	call   80105e <vmalloc>
  8011b1:	ba 07 00 00 00       	mov    edx,0x7
  8011b6:	48 89 de             	mov    rsi,rbx
  8011b9:	48 89 c7             	mov    rdi,rax
  8011bc:	e8 7e fc ff ff       	call   800e3f <mmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  8011c1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8011c5:	83 e0 02             	and    eax,0x2
  8011c8:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("when writing\n");else //puts("when reading");
  8011cb:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8011cf:	74 0c                	je     8011dd <page_err+0x8a>
  8011d1:	bf 62 1a 81 00       	mov    edi,0x811a62
  8011d6:	e8 16 4b 00 00       	call   805cf1 <print>
  8011db:	eb 0a                	jmp    8011e7 <page_err+0x94>
    p=err_code&4;
  8011dd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8011e1:	83 e0 04             	and    eax,0x4
  8011e4:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  8011e7:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8011eb:	75 0c                	jne    8011f9 <page_err+0xa6>
  8011ed:	bf 70 1a 81 00       	mov    edi,0x811a70
  8011f2:	e8 fa 4a 00 00       	call   805cf1 <print>
  8011f7:	eb 0a                	jmp    801203 <page_err+0xb0>
    p=err_code&16;
  8011f9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8011fd:	83 e0 10             	and    eax,0x10
  801200:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  801203:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801207:	74 0a                	je     801213 <page_err+0xc0>
  801209:	bf 88 1a 81 00       	mov    edi,0x811a88
  80120e:	e8 de 4a 00 00       	call   805cf1 <print>
    unsigned int addr=0;
  801213:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%ebp),%0":"=r"(addr));
  80121a:	67 8b 45 08          	mov    eax,DWORD PTR [ebp+0x8]
  80121e:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  801221:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  801225:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  801228:	89 c6                	mov    esi,eax
  80122a:	bf a8 1a 81 00       	mov    edi,0x811aa8
  80122f:	b8 00 00 00 00       	mov    eax,0x0
  801234:	e8 39 fa ff ff       	call   800c72 <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  801239:	48 8b 15 60 72 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc07260]        # 4084a0 <task>
  801240:	8b 05 2a 0e c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10e2a]        # 412070 <cur_proc>
  801246:	48 98                	cdqe   
  801248:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80124f:	48 01 d0             	add    rax,rdx
  801252:	8b 00                	mov    eax,DWORD PTR [rax]
  801254:	83 f8 01             	cmp    eax,0x1
  801257:	75 11                	jne    80126a <page_err+0x117>
    {
        printf("sys died. please reboot.\n");
  801259:	bf ca 1a 81 00       	mov    edi,0x811aca
  80125e:	b8 00 00 00 00       	mov    eax,0x0
  801263:	e8 0a fa ff ff       	call   800c72 <printf>
        asm volatile("jmp .");
  801268:	eb fe                	jmp    801268 <page_err+0x115>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  80126a:	b8 00 00 00 00       	mov    eax,0x0
  80126f:	e8 8a 38 00 00       	call   804afe <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n leave\r\n add $8,%esp \r\n iretq");
  801274:	fb                   	sti    
  801275:	c9                   	leave  
  801276:	83 c4 08             	add    esp,0x8
  801279:	48 cf                	iretq  
}
  80127b:	90                   	nop
  80127c:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  801280:	c9                   	leave  
  801281:	c3                   	ret    

0000000000801282 <init_memory>:
void init_memory()
{
  801282:	f3 0f 1e fa          	endbr64 
  801286:	55                   	push   rbp
  801287:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  80128a:	8b 05 90 ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfef90]        # 400220 <mmap_t_i>
  801290:	83 e8 01             	sub    eax,0x1
  801293:	48 63 d0             	movsxd rdx,eax
  801296:	48 89 d0             	mov    rax,rdx
  801299:	48 01 c0             	add    rax,rax
  80129c:	48 01 d0             	add    rax,rdx
  80129f:	48 c1 e0 03          	shl    rax,0x3
  8012a3:	48 05 40 00 40 00    	add    rax,0x400040
  8012a9:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8012ac:	8b 05 6e ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfef6e]        # 400220 <mmap_t_i>
  8012b2:	83 e8 01             	sub    eax,0x1
  8012b5:	48 63 d0             	movsxd rdx,eax
  8012b8:	48 89 d0             	mov    rax,rdx
  8012bb:	48 01 c0             	add    rax,rax
  8012be:	48 01 d0             	add    rax,rdx
  8012c1:	48 c1 e0 03          	shl    rax,0x3
  8012c5:	48 05 48 00 40 00    	add    rax,0x400048
  8012cb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8012ce:	48 01 c8             	add    rax,rcx
  8012d1:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  8012d5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8012d9:	48 c1 e8 0c          	shr    rax,0xc
  8012dd:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  8012e0:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8012e3:	8d 50 1f             	lea    edx,[rax+0x1f]
  8012e6:	85 c0                	test   eax,eax
  8012e8:	0f 48 c2             	cmovs  eax,edx
  8012eb:	c1 f8 05             	sar    eax,0x5
  8012ee:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  8012f1:	48 c7 05 24 ed bf ff 	mov    QWORD PTR [rip+0xffffffffffbfed24],0xc00000        # 400020 <page_map>
  8012f8:	00 00 c0 00 
    addr_t curp=0;
  8012fc:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  801303:	00 
    for(int i=0;i<mmap_t_i;i++){
  801304:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80130b:	e9 97 00 00 00       	jmp    8013a7 <init_memory+0x125>
        int cont=0;
  801310:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  801317:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80131a:	48 63 d0             	movsxd rdx,eax
  80131d:	48 89 d0             	mov    rax,rdx
  801320:	48 01 c0             	add    rax,rax
  801323:	48 01 d0             	add    rax,rdx
  801326:	48 c1 e0 03          	shl    rax,0x3
  80132a:	48 05 50 00 40 00    	add    rax,0x400050
  801330:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801333:	48 83 f8 01          	cmp    rax,0x1
  801337:	74 07                	je     801340 <init_memory+0xbe>
            cont=-1;
  801339:	c7 45 f8 ff ff ff ff 	mov    DWORD PTR [rbp-0x8],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  801340:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  801347:	eb 1b                	jmp    801364 <init_memory+0xe2>
            *(page_map++)=cont;
  801349:	48 8b 05 d0 ec bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfecd0]        # 400020 <page_map>
  801350:	48 8d 50 04          	lea    rdx,[rax+0x4]
  801354:	48 89 15 c5 ec bf ff 	mov    QWORD PTR [rip+0xffffffffffbfecc5],rdx        # 400020 <page_map>
  80135b:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80135e:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  801360:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  801364:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801367:	48 63 c8             	movsxd rcx,eax
  80136a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80136d:	48 63 d0             	movsxd rdx,eax
  801370:	48 89 d0             	mov    rax,rdx
  801373:	48 01 c0             	add    rax,rax
  801376:	48 01 d0             	add    rax,rdx
  801379:	48 c1 e0 03          	shl    rax,0x3
  80137d:	48 05 48 00 40 00    	add    rax,0x400048
  801383:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801386:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  80138d:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  801394:	ff 00 00 
  801397:	48 21 d0             	and    rax,rdx
  80139a:	48 c1 e8 11          	shr    rax,0x11
  80139e:	48 39 c1             	cmp    rcx,rax
  8013a1:	72 a6                	jb     801349 <init_memory+0xc7>
    for(int i=0;i<mmap_t_i;i++){
  8013a3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8013a7:	8b 05 73 ee bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfee73]        # 400220 <mmap_t_i>
  8013ad:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8013b0:	0f 8c 5a ff ff ff    	jl     801310 <init_memory+0x8e>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  8013b6:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8013bd:	eb 1d                	jmp    8013dc <init_memory+0x15a>
        page_map[i]=0xffffffff;
  8013bf:	48 8b 15 5a ec bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfec5a]        # 400020 <page_map>
  8013c6:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8013c9:	48 98                	cdqe   
  8013cb:	48 c1 e0 02          	shl    rax,0x2
  8013cf:	48 01 d0             	add    rax,rdx
  8013d2:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  8013d8:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8013dc:	83 7d f0 7f          	cmp    DWORD PTR [rbp-0x10],0x7f
  8013e0:	7e dd                	jle    8013bf <init_memory+0x13d>
    }
}
  8013e2:	90                   	nop
  8013e3:	90                   	nop
  8013e4:	5d                   	pop    rbp
  8013e5:	c3                   	ret    

00000000008013e6 <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  8013e6:	f3 0f 1e fa          	endbr64 
  8013ea:	55                   	push   rbp
  8013eb:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  8013ee:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8013f5:	e9 b0 00 00 00       	jmp    8014aa <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  8013fa:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801401:	e9 96 00 00 00       	jmp    80149c <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  801406:	48 8b 15 13 ec bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfec13]        # 400020 <page_map>
  80140d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801410:	48 98                	cdqe   
  801412:	48 c1 e0 02          	shl    rax,0x2
  801416:	48 01 d0             	add    rax,rdx
  801419:	8b 10                	mov    edx,DWORD PTR [rax]
  80141b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80141e:	be 01 00 00 00       	mov    esi,0x1
  801423:	89 c1                	mov    ecx,eax
  801425:	d3 e6                	shl    esi,cl
  801427:	89 f0                	mov    eax,esi
  801429:	21 d0                	and    eax,edx
  80142b:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  80142e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801431:	c1 e0 05             	shl    eax,0x5
  801434:	89 c2                	mov    edx,eax
  801436:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801439:	01 d0                	add    eax,edx
  80143b:	c1 e0 0c             	shl    eax,0xc
  80143e:	3d ff ff 0f 00       	cmp    eax,0xfffff
  801443:	7e 53                	jle    801498 <req_a_page+0xb2>
  801445:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  801449:	75 4d                	jne    801498 <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  80144b:	48 8b 15 ce eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfebce]        # 400020 <page_map>
  801452:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801455:	48 98                	cdqe   
  801457:	48 c1 e0 02          	shl    rax,0x2
  80145b:	48 01 d0             	add    rax,rdx
  80145e:	8b 10                	mov    edx,DWORD PTR [rax]
  801460:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801463:	be 01 00 00 00       	mov    esi,0x1
  801468:	89 c1                	mov    ecx,eax
  80146a:	d3 e6                	shl    esi,cl
  80146c:	89 f0                	mov    eax,esi
  80146e:	89 c6                	mov    esi,eax
  801470:	48 8b 0d a9 eb bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfeba9]        # 400020 <page_map>
  801477:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80147a:	48 98                	cdqe   
  80147c:	48 c1 e0 02          	shl    rax,0x2
  801480:	48 01 c8             	add    rax,rcx
  801483:	09 f2                	or     edx,esi
  801485:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  801487:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80148a:	c1 e0 05             	shl    eax,0x5
  80148d:	89 c2                	mov    edx,eax
  80148f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801492:	01 d0                	add    eax,edx
  801494:	48 98                	cdqe   
  801496:	eb 1c                	jmp    8014b4 <req_a_page+0xce>
        for(int j=0;j<32;j++){
  801498:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80149c:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8014a0:	0f 8e 60 ff ff ff    	jle    801406 <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  8014a6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8014aa:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8014ae:	0f 8e 46 ff ff ff    	jle    8013fa <req_a_page+0x14>

            }
        }
    }
}
  8014b4:	5d                   	pop    rbp
  8014b5:	c3                   	ret    

00000000008014b6 <free_page>:

int free_page(char *paddr){
  8014b6:	f3 0f 1e fa          	endbr64 
  8014ba:	55                   	push   rbp
  8014bb:	48 89 e5             	mov    rbp,rsp
  8014be:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  8014c2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014c6:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8014cc:	85 c0                	test   eax,eax
  8014ce:	0f 48 c2             	cmovs  eax,edx
  8014d1:	c1 f8 0c             	sar    eax,0xc
  8014d4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8014d7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014da:	8d 50 1f             	lea    edx,[rax+0x1f]
  8014dd:	85 c0                	test   eax,eax
  8014df:	0f 48 c2             	cmovs  eax,edx
  8014e2:	c1 f8 05             	sar    eax,0x5
  8014e5:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8014e8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014eb:	99                   	cdq    
  8014ec:	c1 ea 1b             	shr    edx,0x1b
  8014ef:	01 d0                	add    eax,edx
  8014f1:	83 e0 1f             	and    eax,0x1f
  8014f4:	29 d0                	sub    eax,edx
  8014f6:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  8014f9:	48 8b 15 20 eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb20]        # 400020 <page_map>
  801500:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801503:	48 98                	cdqe   
  801505:	48 c1 e0 02          	shl    rax,0x2
  801509:	48 01 d0             	add    rax,rdx
  80150c:	8b 10                	mov    edx,DWORD PTR [rax]
  80150e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801511:	be 01 00 00 00       	mov    esi,0x1
  801516:	89 c1                	mov    ecx,eax
  801518:	d3 e6                	shl    esi,cl
  80151a:	89 f0                	mov    eax,esi
  80151c:	f7 d0                	not    eax
  80151e:	89 c6                	mov    esi,eax
  801520:	48 8b 0d f9 ea bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfeaf9]        # 400020 <page_map>
  801527:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80152a:	48 98                	cdqe   
  80152c:	48 c1 e0 02          	shl    rax,0x2
  801530:	48 01 c8             	add    rax,rcx
  801533:	21 f2                	and    edx,esi
  801535:	89 10                	mov    DWORD PTR [rax],edx
}
  801537:	90                   	nop
  801538:	5d                   	pop    rbp
  801539:	c3                   	ret    

000000000080153a <check_page>:
int check_page(int num){
  80153a:	f3 0f 1e fa          	endbr64 
  80153e:	55                   	push   rbp
  80153f:	48 89 e5             	mov    rbp,rsp
  801542:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  801545:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801548:	8d 50 1f             	lea    edx,[rax+0x1f]
  80154b:	85 c0                	test   eax,eax
  80154d:	0f 48 c2             	cmovs  eax,edx
  801550:	c1 f8 05             	sar    eax,0x5
  801553:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  801556:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801559:	99                   	cdq    
  80155a:	c1 ea 1b             	shr    edx,0x1b
  80155d:	01 d0                	add    eax,edx
  80155f:	83 e0 1f             	and    eax,0x1f
  801562:	29 d0                	sub    eax,edx
  801564:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  801567:	48 8b 15 b2 ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeab2]        # 400020 <page_map>
  80156e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801571:	48 98                	cdqe   
  801573:	48 c1 e0 02          	shl    rax,0x2
  801577:	48 01 d0             	add    rax,rdx
  80157a:	8b 10                	mov    edx,DWORD PTR [rax]
  80157c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80157f:	be 01 00 00 00       	mov    esi,0x1
  801584:	89 c1                	mov    ecx,eax
  801586:	d3 e6                	shl    esi,cl
  801588:	89 f0                	mov    eax,esi
  80158a:	21 d0                	and    eax,edx
  80158c:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  80158f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  801592:	5d                   	pop    rbp
  801593:	c3                   	ret    

0000000000801594 <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  801594:	f3 0f 1e fa          	endbr64 
  801598:	55                   	push   rbp
  801599:	48 89 e5             	mov    rbp,rsp
  80159c:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  80159f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015a2:	c1 e0 0c             	shl    eax,0xc
}
  8015a5:	5d                   	pop    rbp
  8015a6:	c3                   	ret    

00000000008015a7 <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  8015a7:	f3 0f 1e fa          	endbr64 
  8015ab:	55                   	push   rbp
  8015ac:	48 89 e5             	mov    rbp,rsp
  8015af:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8015b3:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  8015b6:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  8015b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8015bd:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  8015c4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8015c8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8015cb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8015ce:	89 c0                	mov    eax,eax
  8015d0:	25 00 f0 ff ff       	and    eax,0xfffff000
  8015d5:	48 09 c2             	or     rdx,rax
  8015d8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8015dc:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  8015df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8015e3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8015e6:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8015e9:	48 98                	cdqe   
  8015eb:	48 09 c2             	or     rdx,rax
  8015ee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8015f2:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8015f5:	90                   	nop
  8015f6:	5d                   	pop    rbp
  8015f7:	c3                   	ret    

00000000008015f8 <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  8015f8:	f3 0f 1e fa          	endbr64 
  8015fc:	55                   	push   rbp
  8015fd:	48 89 e5             	mov    rbp,rsp
  801600:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801604:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  801607:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  80160a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80160e:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  801615:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801619:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80161c:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80161f:	0c 81                	or     al,0x81
  801621:	89 c0                	mov    eax,eax
  801623:	48 09 c2             	or     rdx,rax
  801626:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80162a:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  80162d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801630:	25 00 00 00 c0       	and    eax,0xc0000000
  801635:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  801638:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80163c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80163f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801642:	48 09 c2             	or     rdx,rax
  801645:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801649:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80164c:	90                   	nop
  80164d:	5d                   	pop    rbp
  80164e:	c3                   	ret    

000000000080164f <set_2mb_pde>:
void set_2mb_pde(page_item* pde,int pa)
{
  80164f:	f3 0f 1e fa          	endbr64 
  801653:	55                   	push   rbp
  801654:	48 89 e5             	mov    rbp,rsp
  801657:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80165b:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    *pde=0;
  80165e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801662:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT;
  801669:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80166d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801670:	48 0d 81 10 00 00    	or     rax,0x1081
  801676:	48 89 c2             	mov    rdx,rax
  801679:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80167d:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  801680:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801683:	25 00 00 c0 ff       	and    eax,0xffc00000
  801688:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  80168b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80168f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801692:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801695:	48 09 c2             	or     rdx,rax
  801698:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80169c:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80169f:	90                   	nop
  8016a0:	5d                   	pop    rbp
  8016a1:	c3                   	ret    

00000000008016a2 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  8016a2:	f3 0f 1e fa          	endbr64 
  8016a6:	55                   	push   rbp
  8016a7:	48 89 e5             	mov    rbp,rsp
  8016aa:	48 83 ec 20          	sub    rsp,0x20
  8016ae:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8016b2:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  8016b5:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  8016ba:	75 18                	jne    8016d4 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  8016bc:	b8 00 00 00 00       	mov    eax,0x0
  8016c1:	e8 20 fd ff ff       	call   8013e6 <req_a_page>
  8016c6:	89 c7                	mov    edi,eax
  8016c8:	e8 c7 fe ff ff       	call   801594 <get_phyaddr>
  8016cd:	48 98                	cdqe   
  8016cf:	e9 a5 00 00 00       	jmp    801779 <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  8016d4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016d8:	89 c2                	mov    edx,eax
  8016da:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8016dd:	89 c6                	mov    esi,eax
  8016df:	89 d7                	mov    edi,edx
  8016e1:	e8 52 01 00 00       	call   801838 <is_pgs_ava>
  8016e6:	85 c0                	test   eax,eax
  8016e8:	75 0c                	jne    8016f6 <req_page_at+0x54>
  8016ea:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  8016f1:	e9 83 00 00 00       	jmp    801779 <req_page_at+0xd7>
    int pgni=base/4096;
  8016f6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016fa:	48 c1 e8 0c          	shr    rax,0xc
  8016fe:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  801701:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801704:	8d 50 1f             	lea    edx,[rax+0x1f]
  801707:	85 c0                	test   eax,eax
  801709:	0f 48 c2             	cmovs  eax,edx
  80170c:	c1 f8 05             	sar    eax,0x5
  80170f:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  801712:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801715:	99                   	cdq    
  801716:	c1 ea 1b             	shr    edx,0x1b
  801719:	01 d0                	add    eax,edx
  80171b:	83 e0 1f             	and    eax,0x1f
  80171e:	29 d0                	sub    eax,edx
  801720:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  801723:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80172a:	eb 40                	jmp    80176c <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  80172c:	48 8b 15 ed e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe8ed]        # 400020 <page_map>
  801733:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801736:	48 98                	cdqe   
  801738:	48 c1 e0 02          	shl    rax,0x2
  80173c:	48 01 d0             	add    rax,rdx
  80173f:	8b 10                	mov    edx,DWORD PTR [rax]
  801741:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801744:	be 01 00 00 00       	mov    esi,0x1
  801749:	89 c1                	mov    ecx,eax
  80174b:	d3 e6                	shl    esi,cl
  80174d:	89 f0                	mov    eax,esi
  80174f:	89 c6                	mov    esi,eax
  801751:	48 8b 0d c8 e8 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe8c8]        # 400020 <page_map>
  801758:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80175b:	48 98                	cdqe   
  80175d:	48 c1 e0 02          	shl    rax,0x2
  801761:	48 01 c8             	add    rax,rcx
  801764:	09 f2                	or     edx,esi
  801766:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  801768:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80176c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80176f:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  801772:	7c b8                	jl     80172c <req_page_at+0x8a>
    }
    return 0;
  801774:	b8 00 00 00 00       	mov    eax,0x0

}
  801779:	c9                   	leave  
  80177a:	c3                   	ret    

000000000080177b <chk_vm>:
int chk_vm(int base, int pgn)
{
  80177b:	f3 0f 1e fa          	endbr64 
  80177f:	55                   	push   rbp
  801780:	48 89 e5             	mov    rbp,rsp
  801783:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801786:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  801789:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  801790:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  801791:	0f 20 d8             	mov    rax,cr3
  801794:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  801798:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80179b:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  8017a1:	85 c0                	test   eax,eax
  8017a3:	0f 48 c2             	cmovs  eax,edx
  8017a6:	c1 f8 16             	sar    eax,0x16
  8017a9:	48 98                	cdqe   
  8017ab:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8017b2:	00 
  8017b3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8017b7:	48 01 d0             	add    rax,rdx
  8017ba:	8b 00                	mov    eax,DWORD PTR [rax]
  8017bc:	89 c0                	mov    eax,eax
  8017be:	25 00 f0 ff ff       	and    eax,0xfffff000
  8017c3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  8017c7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8017ca:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  8017d0:	85 c0                	test   eax,eax
  8017d2:	0f 48 c2             	cmovs  eax,edx
  8017d5:	c1 f8 16             	sar    eax,0x16
  8017d8:	48 98                	cdqe   
  8017da:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8017e1:	00 
  8017e2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8017e6:	48 01 d0             	add    rax,rdx
  8017e9:	8b 00                	mov    eax,DWORD PTR [rax]
  8017eb:	83 e0 01             	and    eax,0x1
  8017ee:	85 c0                	test   eax,eax
  8017f0:	74 38                	je     80182a <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  8017f2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8017f5:	99                   	cdq    
  8017f6:	c1 ea 0a             	shr    edx,0xa
  8017f9:	01 d0                	add    eax,edx
  8017fb:	25 ff ff 3f 00       	and    eax,0x3fffff
  801800:	29 d0                	sub    eax,edx
  801802:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801808:	85 c0                	test   eax,eax
  80180a:	0f 48 c2             	cmovs  eax,edx
  80180d:	c1 f8 0c             	sar    eax,0xc
  801810:	48 98                	cdqe   
  801812:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801819:	00 
  80181a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80181e:	48 01 d0             	add    rax,rdx
  801821:	8b 00                	mov    eax,DWORD PTR [rax]
  801823:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801826:	85 c0                	test   eax,eax
  801828:	75 07                	jne    801831 <chk_vm+0xb6>
    {
        return -1;
  80182a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80182f:	eb 05                	jmp    801836 <chk_vm+0xbb>
    }
    return 0;
  801831:	b8 00 00 00 00       	mov    eax,0x0
}
  801836:	5d                   	pop    rbp
  801837:	c3                   	ret    

0000000000801838 <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  801838:	f3 0f 1e fa          	endbr64 
  80183c:	55                   	push   rbp
  80183d:	48 89 e5             	mov    rbp,rsp
  801840:	48 83 ec 18          	sub    rsp,0x18
  801844:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801847:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  80184a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80184d:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801853:	85 c0                	test   eax,eax
  801855:	0f 48 c2             	cmovs  eax,edx
  801858:	c1 f8 0c             	sar    eax,0xc
  80185b:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  80185e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801865:	eb 1e                	jmp    801885 <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801867:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80186a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80186d:	01 d0                	add    eax,edx
  80186f:	89 c7                	mov    edi,eax
  801871:	e8 c4 fc ff ff       	call   80153a <check_page>
  801876:	85 c0                	test   eax,eax
  801878:	74 07                	je     801881 <is_pgs_ava+0x49>
  80187a:	b8 00 00 00 00       	mov    eax,0x0
  80187f:	eb 11                	jmp    801892 <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  801881:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801885:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801888:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  80188b:	7c da                	jl     801867 <is_pgs_ava+0x2f>
    }
    return 1;
  80188d:	b8 01 00 00 00       	mov    eax,0x1

}
  801892:	c9                   	leave  
  801893:	c3                   	ret    

0000000000801894 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  801894:	f3 0f 1e fa          	endbr64 
  801898:	55                   	push   rbp
  801899:	48 89 e5             	mov    rbp,rsp
  80189c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8018a0:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  8018a4:	c6 05 95 e9 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe995],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  8018ab:	c6 05 8f e9 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe98f],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  8018b2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8018b6:	48 89 05 8b e9 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe98b],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  8018bd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8018c1:	48 89 05 88 e9 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe988],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  8018c8:	c7 05 8e e9 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe98e],0x1        # 400260 <vols+0x20>
  8018cf:	00 00 00 
    return 0;
  8018d2:	b8 00 00 00 00       	mov    eax,0x0
}
  8018d7:	5d                   	pop    rbp
  8018d8:	c3                   	ret    

00000000008018d9 <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  8018d9:	f3 0f 1e fa          	endbr64 
  8018dd:	55                   	push   rbp
  8018de:	48 89 e5             	mov    rbp,rsp
  8018e1:	48 83 ec 20          	sub    rsp,0x20
  8018e5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  8018e8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8018ef:	eb 38                	jmp    801929 <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  8018f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018f4:	48 98                	cdqe   
  8018f6:	48 c1 e0 04          	shl    rax,0x4
  8018fa:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801900:	8b 00                	mov    eax,DWORD PTR [rax]
  801902:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801905:	75 1e                	jne    801925 <sys_mkfifo+0x4c>
  801907:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80190a:	48 98                	cdqe   
  80190c:	48 c1 e0 04          	shl    rax,0x4
  801910:	48 05 68 1e 40 00    	add    rax,0x401e68
  801916:	8b 00                	mov    eax,DWORD PTR [rax]
  801918:	83 f8 01             	cmp    eax,0x1
  80191b:	75 08                	jne    801925 <sys_mkfifo+0x4c>
            return i;
  80191d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801920:	e9 a6 00 00 00       	jmp    8019cb <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801925:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801929:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  80192d:	7e c2                	jle    8018f1 <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  80192f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801936:	e9 81 00 00 00       	jmp    8019bc <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  80193b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80193e:	48 98                	cdqe   
  801940:	48 c1 e0 04          	shl    rax,0x4
  801944:	48 05 68 1e 40 00    	add    rax,0x401e68
  80194a:	8b 00                	mov    eax,DWORD PTR [rax]
  80194c:	85 c0                	test   eax,eax
  80194e:	75 68                	jne    8019b8 <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  801950:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801953:	48 98                	cdqe   
  801955:	48 c1 e0 04          	shl    rax,0x4
  801959:	48 05 68 1e 40 00    	add    rax,0x401e68
  80195f:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  801965:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801968:	48 98                	cdqe   
  80196a:	48 c1 e0 04          	shl    rax,0x4
  80196e:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801975:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801978:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  80197a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80197d:	48 98                	cdqe   
  80197f:	48 c1 e0 04          	shl    rax,0x4
  801983:	48 05 64 1e 40 00    	add    rax,0x401e64
  801989:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  80198f:	b8 00 00 00 00       	mov    eax,0x0
  801994:	e8 4d fa ff ff       	call   8013e6 <req_a_page>
  801999:	89 c7                	mov    edi,eax
  80199b:	e8 f4 fb ff ff       	call   801594 <get_phyaddr>
  8019a0:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8019a3:	48 63 d2             	movsxd rdx,edx
  8019a6:	48 c1 e2 04          	shl    rdx,0x4
  8019aa:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  8019b1:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  8019b3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019b6:	eb 13                	jmp    8019cb <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  8019b8:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8019bc:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  8019c0:	0f 8e 75 ff ff ff    	jle    80193b <sys_mkfifo+0x62>
        }
    }
    return -1;
  8019c6:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8019cb:	c9                   	leave  
  8019cc:	c3                   	ret    

00000000008019cd <sys_rmfifo>:

int sys_rmfifo(int number)
{
  8019cd:	f3 0f 1e fa          	endbr64 
  8019d1:	55                   	push   rbp
  8019d2:	48 89 e5             	mov    rbp,rsp
  8019d5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  8019d8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8019df:	eb 4a                	jmp    801a2b <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  8019e1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019e4:	48 98                	cdqe   
  8019e6:	48 c1 e0 04          	shl    rax,0x4
  8019ea:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  8019f0:	8b 00                	mov    eax,DWORD PTR [rax]
  8019f2:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8019f5:	75 30                	jne    801a27 <sys_rmfifo+0x5a>
  8019f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019fa:	48 98                	cdqe   
  8019fc:	48 c1 e0 04          	shl    rax,0x4
  801a00:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a06:	8b 00                	mov    eax,DWORD PTR [rax]
  801a08:	83 f8 01             	cmp    eax,0x1
  801a0b:	75 1a                	jne    801a27 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801a0d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a10:	48 98                	cdqe   
  801a12:	48 c1 e0 04          	shl    rax,0x4
  801a16:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a1c:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801a22:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a25:	eb 0f                	jmp    801a36 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801a27:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801a2b:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801a2f:	7e b0                	jle    8019e1 <sys_rmfifo+0x14>
        }
    }
    return -1;
  801a31:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801a36:	5d                   	pop    rbp
  801a37:	c3                   	ret    

0000000000801a38 <free_vol>:
int free_vol(int voli)
{
  801a38:	f3 0f 1e fa          	endbr64 
  801a3c:	55                   	push   rbp
  801a3d:	48 89 e5             	mov    rbp,rsp
  801a40:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801a43:	c7 05 13 e8 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe813],0x0        # 400260 <vols+0x20>
  801a4a:	00 00 00 
    return 0;
  801a4d:	b8 00 00 00 00       	mov    eax,0x0
}
  801a52:	5d                   	pop    rbp
  801a53:	c3                   	ret    

0000000000801a54 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801a54:	f3 0f 1e fa          	endbr64 
  801a58:	55                   	push   rbp
  801a59:	48 89 e5             	mov    rbp,rsp
  801a5c:	48 83 ec 20          	sub    rsp,0x20
  801a60:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801a63:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801a66:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801a6a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801a71:	e9 d8 00 00 00       	jmp    801b4e <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801a76:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a79:	48 63 d0             	movsxd rdx,eax
  801a7c:	48 89 d0             	mov    rax,rdx
  801a7f:	48 c1 e0 02          	shl    rax,0x2
  801a83:	48 01 d0             	add    rax,rdx
  801a86:	48 c1 e0 03          	shl    rax,0x3
  801a8a:	48 05 60 02 40 00    	add    rax,0x400260
  801a90:	8b 00                	mov    eax,DWORD PTR [rax]
  801a92:	85 c0                	test   eax,eax
  801a94:	0f 85 b0 00 00 00    	jne    801b4a <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801a9a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a9d:	48 63 d0             	movsxd rdx,eax
  801aa0:	48 89 d0             	mov    rax,rdx
  801aa3:	48 c1 e0 02          	shl    rax,0x2
  801aa7:	48 01 d0             	add    rax,rdx
  801aaa:	48 c1 e0 03          	shl    rax,0x3
  801aae:	48 05 60 02 40 00    	add    rax,0x400260
  801ab4:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801aba:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801abd:	48 63 d0             	movsxd rdx,eax
  801ac0:	48 89 d0             	mov    rax,rdx
  801ac3:	48 01 c0             	add    rax,rax
  801ac6:	48 01 d0             	add    rax,rdx
  801ac9:	48 c1 e0 03          	shl    rax,0x3
  801acd:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801ad4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ad7:	48 63 d0             	movsxd rdx,eax
  801ada:	48 89 d0             	mov    rax,rdx
  801add:	48 c1 e0 02          	shl    rax,0x2
  801ae1:	48 01 d0             	add    rax,rdx
  801ae4:	48 c1 e0 03          	shl    rax,0x3
  801ae8:	48 05 58 02 40 00    	add    rax,0x400258
  801aee:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801af1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801af4:	89 c7                	mov    edi,eax
  801af6:	e8 0b 1b 00 00       	call   803606 <get_drv>
  801afb:	48 89 c2             	mov    rdx,rax
  801afe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b01:	48 63 c8             	movsxd rcx,eax
  801b04:	48 89 c8             	mov    rax,rcx
  801b07:	48 c1 e0 02          	shl    rax,0x2
  801b0b:	48 01 c8             	add    rax,rcx
  801b0e:	48 c1 e0 03          	shl    rax,0x3
  801b12:	48 05 48 02 40 00    	add    rax,0x400248
  801b18:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801b1b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b1e:	48 63 d0             	movsxd rdx,eax
  801b21:	48 89 d0             	mov    rax,rdx
  801b24:	48 c1 e0 02          	shl    rax,0x2
  801b28:	48 01 d0             	add    rax,rdx
  801b2b:	48 c1 e0 03          	shl    rax,0x3
  801b2f:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801b36:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801b3a:	48 89 c6             	mov    rsi,rax
  801b3d:	48 89 d7             	mov    rdi,rdx
  801b40:	e8 6f 7c 00 00       	call   8097b4 <strcpy>
            return i;
  801b45:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b48:	eb 13                	jmp    801b5d <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801b4a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801b4e:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801b52:	0f 8e 1e ff ff ff    	jle    801a76 <reg_vol+0x22>
        }
    }
    return -1;
  801b58:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801b5d:	c9                   	leave  
  801b5e:	c3                   	ret    

0000000000801b5f <sys_open>:
int sys_open(char *path, int mode)
{
  801b5f:	f3 0f 1e fa          	endbr64 
  801b63:	55                   	push   rbp
  801b64:	48 89 e5             	mov    rbp,rsp
  801b67:	53                   	push   rbx
  801b68:	48 81 ec 28 02 00 00 	sub    rsp,0x228
  801b6f:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
  801b76:	89 b5 d4 fd ff ff    	mov    DWORD PTR [rbp-0x22c],esi
    {

    }
    //根据文件路径找到相应的卷
    char volname[26];
    int i=0,rec=0;
  801b7c:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801b83:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
    for(;path[i]!='/'&&i<26;i++)
  801b8a:	eb 20                	jmp    801bac <sys_open+0x4d>
        volname[i]=path[i];
  801b8c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b8f:	48 63 d0             	movsxd rdx,eax
  801b92:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801b99:	48 01 d0             	add    rax,rdx
  801b9c:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  801b9f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ba2:	48 98                	cdqe   
  801ba4:	88 54 05 c0          	mov    BYTE PTR [rbp+rax*1-0x40],dl
    for(;path[i]!='/'&&i<26;i++)
  801ba8:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801bac:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801baf:	48 63 d0             	movsxd rdx,eax
  801bb2:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801bb9:	48 01 d0             	add    rax,rdx
  801bbc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801bbf:	3c 2f                	cmp    al,0x2f
  801bc1:	74 06                	je     801bc9 <sys_open+0x6a>
  801bc3:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801bc7:	7e c3                	jle    801b8c <sys_open+0x2d>
    volname[i]='\0';
  801bc9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801bcc:	48 98                	cdqe   
  801bce:	c6 44 05 c0 00       	mov    BYTE PTR [rbp+rax*1-0x40],0x0
    if(!path[i+1])
  801bd3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801bd6:	48 98                	cdqe   
  801bd8:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801bdc:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801be3:	48 01 d0             	add    rax,rdx
  801be6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801be9:	84 c0                	test   al,al
  801beb:	75 0a                	jne    801bf7 <sys_open+0x98>
        return -2;//是根目录
  801bed:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  801bf2:	e9 2b 04 00 00       	jmp    802022 <sys_open+0x4c3>
    rec=i;
  801bf7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801bfa:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(i=0;i<MAX_VOLUMES;i++)
  801bfd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801c04:	eb 52                	jmp    801c58 <sys_open+0xf9>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801c06:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c09:	48 63 d0             	movsxd rdx,eax
  801c0c:	48 89 d0             	mov    rax,rdx
  801c0f:	48 c1 e0 02          	shl    rax,0x2
  801c13:	48 01 d0             	add    rax,rdx
  801c16:	48 c1 e0 03          	shl    rax,0x3
  801c1a:	48 05 60 02 40 00    	add    rax,0x400260
  801c20:	8b 00                	mov    eax,DWORD PTR [rax]
  801c22:	85 c0                	test   eax,eax
  801c24:	74 2e                	je     801c54 <sys_open+0xf5>
        (strcmp(vols[i].name,volname)==0))
  801c26:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c29:	48 63 d0             	movsxd rdx,eax
  801c2c:	48 89 d0             	mov    rax,rdx
  801c2f:	48 c1 e0 02          	shl    rax,0x2
  801c33:	48 01 d0             	add    rax,rdx
  801c36:	48 c1 e0 03          	shl    rax,0x3
  801c3a:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801c41:	48 8d 45 c0          	lea    rax,[rbp-0x40]
  801c45:	48 89 c6             	mov    rsi,rax
  801c48:	48 89 d7             	mov    rdi,rdx
  801c4b:	e8 04 7d 00 00       	call   809954 <strcmp>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801c50:	85 c0                	test   eax,eax
  801c52:	74 0c                	je     801c60 <sys_open+0x101>
    for(i=0;i<MAX_VOLUMES;i++)
  801c54:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801c58:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801c5c:	7e a8                	jle    801c06 <sys_open+0xa7>
  801c5e:	eb 01                	jmp    801c61 <sys_open+0x102>
            break;
  801c60:	90                   	nop
    if(i==MAX_VOLUMES)return -1;
  801c61:	83 7d ec 1a          	cmp    DWORD PTR [rbp-0x14],0x1a
  801c65:	75 0a                	jne    801c71 <sys_open+0x112>
  801c67:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801c6c:	e9 b1 03 00 00       	jmp    802022 <sys_open+0x4c3>
    driver_args arg={
  801c71:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  801c78:	b8 00 00 00 00       	mov    eax,0x0
  801c7d:	b9 17 00 00 00       	mov    ecx,0x17
  801c82:	48 89 d7             	mov    rdi,rdx
  801c85:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  801c88:	48 89 fa             	mov    rdx,rdi
  801c8b:	89 02                	mov    DWORD PTR [rdx],eax
  801c8d:	48 83 c2 04          	add    rdx,0x4
            .path=path+rec+1
  801c91:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801c94:	48 98                	cdqe   
  801c96:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801c9a:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801ca1:	48 01 d0             	add    rax,rdx
    driver_args arg={
  801ca4:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    vfs_dir_entry dir;
    vfs_dir_entry res;
    int voln=i;
  801cab:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801cae:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    if(vols[i].fs->find(path+rec+1,dir,&res)==-1)//找不到文件 ((driver*)vols[i].fs_drv)->find(&arg)==-1
  801cb1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801cb4:	48 63 d0             	movsxd rdx,eax
  801cb7:	48 89 d0             	mov    rax,rdx
  801cba:	48 c1 e0 02          	shl    rax,0x2
  801cbe:	48 01 d0             	add    rax,rdx
  801cc1:	48 c1 e0 03          	shl    rax,0x3
  801cc5:	48 05 58 02 40 00    	add    rax,0x400258
  801ccb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801cce:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  801cd2:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801cd5:	48 98                	cdqe   
  801cd7:	48 8d 48 01          	lea    rcx,[rax+0x1]
  801cdb:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801ce2:	48 01 c1             	add    rcx,rax
  801ce5:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
  801cec:	ff b5 f8 fe ff ff    	push   QWORD PTR [rbp-0x108]
  801cf2:	ff b5 f0 fe ff ff    	push   QWORD PTR [rbp-0x110]
  801cf8:	ff b5 e8 fe ff ff    	push   QWORD PTR [rbp-0x118]
  801cfe:	ff b5 e0 fe ff ff    	push   QWORD PTR [rbp-0x120]
  801d04:	ff b5 d8 fe ff ff    	push   QWORD PTR [rbp-0x128]
  801d0a:	ff b5 d0 fe ff ff    	push   QWORD PTR [rbp-0x130]
  801d10:	ff b5 c8 fe ff ff    	push   QWORD PTR [rbp-0x138]
  801d16:	ff b5 c0 fe ff ff    	push   QWORD PTR [rbp-0x140]
  801d1c:	ff b5 b8 fe ff ff    	push   QWORD PTR [rbp-0x148]
  801d22:	ff b5 b0 fe ff ff    	push   QWORD PTR [rbp-0x150]
  801d28:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
  801d2e:	ff b5 a0 fe ff ff    	push   QWORD PTR [rbp-0x160]
  801d34:	48 89 c6             	mov    rsi,rax
  801d37:	48 89 cf             	mov    rdi,rcx
  801d3a:	ff d2                	call   rdx
  801d3c:	48 83 c4 60          	add    rsp,0x60
  801d40:	83 f8 ff             	cmp    eax,0xffffffff
  801d43:	75 49                	jne    801d8e <sys_open+0x22f>
    {
        if(mode&FILE_MODE_WRITE) {
  801d45:	8b 85 d4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x22c]
  801d4b:	83 e0 02             	and    eax,0x2
  801d4e:	85 c0                	test   eax,eax
  801d50:	74 32                	je     801d84 <sys_open+0x225>
            return ((driver *) vols[i].fs_drv)->touch(&arg);//这里之后要改
  801d52:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d55:	48 63 d0             	movsxd rdx,eax
  801d58:	48 89 d0             	mov    rax,rdx
  801d5b:	48 c1 e0 02          	shl    rax,0x2
  801d5f:	48 01 d0             	add    rax,rdx
  801d62:	48 c1 e0 03          	shl    rax,0x3
  801d66:	48 05 50 02 40 00    	add    rax,0x400250
  801d6c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801d6f:	48 8b 50 4c          	mov    rdx,QWORD PTR [rax+0x4c]
  801d73:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  801d7a:	48 89 c7             	mov    rdi,rax
  801d7d:	ff d2                	call   rdx
  801d7f:	e9 9e 02 00 00       	jmp    802022 <sys_open+0x4c3>
        }else
            return -1;
  801d84:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801d89:	e9 94 02 00 00       	jmp    802022 <sys_open+0x4c3>
    }
    vfs_dir_entry entry=res;//=arg.entry;
  801d8e:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
  801d95:	48 8b 95 48 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b8]
  801d9c:	48 89 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rax
  801da3:	48 89 95 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdx
  801daa:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
  801db1:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
  801db8:	48 89 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],rax
  801dbf:	48 89 95 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],rdx
  801dc6:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
  801dcd:	48 8b 95 68 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x198]
  801dd4:	48 89 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],rax
  801ddb:	48 89 95 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],rdx
  801de2:	48 8b 85 70 fe ff ff 	mov    rax,QWORD PTR [rbp-0x190]
  801de9:	48 8b 95 78 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x188]
  801df0:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
  801df7:	48 89 95 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdx
  801dfe:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
  801e05:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
  801e0c:	48 89 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rax
  801e13:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
  801e1a:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
  801e21:	48 8b 95 98 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x168]
  801e28:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
  801e2f:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
    int j=-1;
  801e36:	c7 45 e8 ff ff ff ff 	mov    DWORD PTR [rbp-0x18],0xffffffff
    for(i=0;i<MAX_OPEN_FILES;i++)
  801e3d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801e44:	eb 5c                	jmp    801ea2 <sys_open+0x343>
    {
        if(opened[i].voln==voln&&opened[i].id==entry.id)
  801e46:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801e49:	48 63 d0             	movsxd rdx,eax
  801e4c:	48 89 d0             	mov    rax,rdx
  801e4f:	48 01 c0             	add    rax,rax
  801e52:	48 01 d0             	add    rax,rdx
  801e55:	48 c1 e0 05          	shl    rax,0x5
  801e59:	48 05 68 06 40 00    	add    rax,0x400668
  801e5f:	8b 00                	mov    eax,DWORD PTR [rax]
  801e61:	39 45 e0             	cmp    DWORD PTR [rbp-0x20],eax
  801e64:	75 38                	jne    801e9e <sys_open+0x33f>
  801e66:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801e69:	48 63 d0             	movsxd rdx,eax
  801e6c:	48 89 d0             	mov    rax,rdx
  801e6f:	48 01 c0             	add    rax,rax
  801e72:	48 01 d0             	add    rax,rdx
  801e75:	48 c1 e0 05          	shl    rax,0x5
  801e79:	48 05 74 06 40 00    	add    rax,0x400674
  801e7f:	8b 10                	mov    edx,DWORD PTR [rax]
  801e81:	8b 85 f4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x20c]
  801e87:	39 c2                	cmp    edx,eax
  801e89:	75 13                	jne    801e9e <sys_open+0x33f>
        {
            if(mode==FILE_MODE_WRITE)
  801e8b:	83 bd d4 fd ff ff 02 	cmp    DWORD PTR [rbp-0x22c],0x2
  801e92:	75 0a                	jne    801e9e <sys_open+0x33f>
            {
                return -1;//读模式会重新给一个fno但是指向同一个文件
  801e94:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801e99:	e9 84 01 00 00       	jmp    802022 <sys_open+0x4c3>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801e9e:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801ea2:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801ea6:	7e 9e                	jle    801e46 <sys_open+0x2e7>
            }
        }
    }
    for(i=0;i<MAX_OPEN_FILES;i++)
  801ea8:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801eaf:	eb 2b                	jmp    801edc <sys_open+0x37d>
    {
        if(!opened[i].mode) {
  801eb1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801eb4:	48 63 d0             	movsxd rdx,eax
  801eb7:	48 89 d0             	mov    rax,rdx
  801eba:	48 01 c0             	add    rax,rax
  801ebd:	48 01 d0             	add    rax,rdx
  801ec0:	48 c1 e0 05          	shl    rax,0x5
  801ec4:	48 05 64 06 40 00    	add    rax,0x400664
  801eca:	8b 00                	mov    eax,DWORD PTR [rax]
  801ecc:	85 c0                	test   eax,eax
  801ece:	75 08                	jne    801ed8 <sys_open+0x379>
            j = i;
  801ed0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ed3:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            break;
  801ed6:	eb 0a                	jmp    801ee2 <sys_open+0x383>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801ed8:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801edc:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801ee0:	7e cf                	jle    801eb1 <sys_open+0x352>
        }
    }
    if(j==-1)return -1;
  801ee2:	83 7d e8 ff          	cmp    DWORD PTR [rbp-0x18],0xffffffff
  801ee6:	75 0a                	jne    801ef2 <sys_open+0x393>
  801ee8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801eed:	e9 30 01 00 00       	jmp    802022 <sys_open+0x4c3>
    opened[j]=entry;
  801ef2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801ef5:	48 63 d0             	movsxd rdx,eax
  801ef8:	48 89 d0             	mov    rax,rdx
  801efb:	48 01 c0             	add    rax,rax
  801efe:	48 01 d0             	add    rax,rdx
  801f01:	48 c1 e0 05          	shl    rax,0x5
  801f05:	48 05 60 06 40 00    	add    rax,0x400660
  801f0b:	48 8b 8d e0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x220]
  801f12:	48 8b 9d e8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x218]
  801f19:	48 89 08             	mov    QWORD PTR [rax],rcx
  801f1c:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
  801f20:	48 8b 8d f0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x210]
  801f27:	48 8b 9d f8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x208]
  801f2e:	48 89 48 10          	mov    QWORD PTR [rax+0x10],rcx
  801f32:	48 89 58 18          	mov    QWORD PTR [rax+0x18],rbx
  801f36:	48 8b 8d 00 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x200]
  801f3d:	48 8b 9d 08 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1f8]
  801f44:	48 89 48 20          	mov    QWORD PTR [rax+0x20],rcx
  801f48:	48 89 58 28          	mov    QWORD PTR [rax+0x28],rbx
  801f4c:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
  801f53:	48 8b 9d 18 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1e8]
  801f5a:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
  801f5e:	48 89 58 38          	mov    QWORD PTR [rax+0x38],rbx
  801f62:	48 8b 8d 20 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e0]
  801f69:	48 8b 9d 28 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1d8]
  801f70:	48 89 48 40          	mov    QWORD PTR [rax+0x40],rcx
  801f74:	48 89 58 48          	mov    QWORD PTR [rax+0x48],rbx
  801f78:	48 8b 8d 30 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1d0]
  801f7f:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
  801f86:	48 89 48 50          	mov    QWORD PTR [rax+0x50],rcx
  801f8a:	48 89 58 58          	mov    QWORD PTR [rax+0x58],rbx
    opened[j].fno=i;
  801f8e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801f91:	48 63 d0             	movsxd rdx,eax
  801f94:	48 89 d0             	mov    rax,rdx
  801f97:	48 01 c0             	add    rax,rax
  801f9a:	48 01 d0             	add    rax,rdx
  801f9d:	48 c1 e0 05          	shl    rax,0x5
  801fa1:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  801fa8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801fab:	89 02                	mov    DWORD PTR [rdx],eax
    opened[j].link_c++;
  801fad:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801fb0:	48 63 d0             	movsxd rdx,eax
  801fb3:	48 89 d0             	mov    rax,rdx
  801fb6:	48 01 c0             	add    rax,rax
  801fb9:	48 01 d0             	add    rax,rdx
  801fbc:	48 c1 e0 05          	shl    rax,0x5
  801fc0:	48 05 6c 06 40 00    	add    rax,0x40066c
  801fc6:	8b 00                	mov    eax,DWORD PTR [rax]
  801fc8:	8d 48 01             	lea    ecx,[rax+0x1]
  801fcb:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801fce:	48 63 d0             	movsxd rdx,eax
  801fd1:	48 89 d0             	mov    rax,rdx
  801fd4:	48 01 c0             	add    rax,rax
  801fd7:	48 01 d0             	add    rax,rdx
  801fda:	48 c1 e0 05          	shl    rax,0x5
  801fde:	48 05 6c 06 40 00    	add    rax,0x40066c
  801fe4:	89 08                	mov    DWORD PTR [rax],ecx
    add_proc_openf(&opened[j]);
  801fe6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801fe9:	48 63 d0             	movsxd rdx,eax
  801fec:	48 89 d0             	mov    rax,rdx
  801fef:	48 01 c0             	add    rax,rax
  801ff2:	48 01 d0             	add    rax,rdx
  801ff5:	48 c1 e0 05          	shl    rax,0x5
  801ff9:	48 05 60 06 40 00    	add    rax,0x400660
  801fff:	48 89 c7             	mov    rdi,rax
  802002:	e8 17 26 00 00       	call   80461e <add_proc_openf>
    return opened[j].fno;
  802007:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80200a:	48 63 d0             	movsxd rdx,eax
  80200d:	48 89 d0             	mov    rax,rdx
  802010:	48 01 c0             	add    rax,rax
  802013:	48 01 d0             	add    rax,rdx
  802016:	48 c1 e0 05          	shl    rax,0x5
  80201a:	48 05 60 06 40 00    	add    rax,0x400660
  802020:	8b 00                	mov    eax,DWORD PTR [rax]
}
  802022:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802026:	c9                   	leave  
  802027:	c3                   	ret    

0000000000802028 <sys_close>:
int sys_close(int fno)
{
  802028:	f3 0f 1e fa          	endbr64 
  80202c:	55                   	push   rbp
  80202d:	48 89 e5             	mov    rbp,rsp
  802030:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802033:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80203a:	eb 64                	jmp    8020a0 <sys_close+0x78>
    {
        if(opened[i].fno==fno)
  80203c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80203f:	48 63 d0             	movsxd rdx,eax
  802042:	48 89 d0             	mov    rax,rdx
  802045:	48 01 c0             	add    rax,rax
  802048:	48 01 d0             	add    rax,rdx
  80204b:	48 c1 e0 05          	shl    rax,0x5
  80204f:	48 05 60 06 40 00    	add    rax,0x400660
  802055:	8b 00                	mov    eax,DWORD PTR [rax]
  802057:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80205a:	75 40                	jne    80209c <sys_close+0x74>
        {
            opened[i].link_c--;
  80205c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80205f:	48 63 d0             	movsxd rdx,eax
  802062:	48 89 d0             	mov    rax,rdx
  802065:	48 01 c0             	add    rax,rax
  802068:	48 01 d0             	add    rax,rdx
  80206b:	48 c1 e0 05          	shl    rax,0x5
  80206f:	48 05 6c 06 40 00    	add    rax,0x40066c
  802075:	8b 00                	mov    eax,DWORD PTR [rax]
  802077:	8d 48 ff             	lea    ecx,[rax-0x1]
  80207a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80207d:	48 63 d0             	movsxd rdx,eax
  802080:	48 89 d0             	mov    rax,rdx
  802083:	48 01 c0             	add    rax,rax
  802086:	48 01 d0             	add    rax,rdx
  802089:	48 c1 e0 05          	shl    rax,0x5
  80208d:	48 05 6c 06 40 00    	add    rax,0x40066c
  802093:	89 08                	mov    DWORD PTR [rax],ecx
            return 0;
  802095:	b8 00 00 00 00       	mov    eax,0x0
  80209a:	eb 0f                	jmp    8020ab <sys_close+0x83>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  80209c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8020a0:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8020a4:	7e 96                	jle    80203c <sys_close+0x14>
        }
    }
    return -1;
  8020a6:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8020ab:	5d                   	pop    rbp
  8020ac:	c3                   	ret    

00000000008020ad <sys_write>:
int sys_write(int fno, char *src, int len)
{
  8020ad:	f3 0f 1e fa          	endbr64 
  8020b1:	55                   	push   rbp
  8020b2:	48 89 e5             	mov    rbp,rsp
  8020b5:	48 83 ec 20          	sub    rsp,0x20
  8020b9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8020bc:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8020c0:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  8020c3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8020c6:	89 c7                	mov    edi,eax
  8020c8:	e8 7d 01 00 00       	call   80224a <get_vfs_entry>
  8020cd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  8020d1:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8020d6:	75 07                	jne    8020df <sys_write+0x32>
  8020d8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8020dd:	eb 5d                	jmp    80213c <sys_write+0x8f>
    if(f->type==FTYPE_REG)
  8020df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020e3:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8020e6:	85 c0                	test   eax,eax
  8020e8:	75 18                	jne    802102 <sys_write+0x55>
    {
        return vfs_write_file(f,src,len);
  8020ea:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8020ed:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8020f1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020f5:	48 89 ce             	mov    rsi,rcx
  8020f8:	48 89 c7             	mov    rdi,rax
  8020fb:	e8 67 03 00 00       	call   802467 <vfs_write_file>
  802100:	eb 3a                	jmp    80213c <sys_write+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  802102:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802106:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802109:	83 f8 01             	cmp    eax,0x1
  80210c:	75 29                	jne    802137 <sys_write+0x8a>
    {
        int block=get_according_bnr(f);
  80210e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802112:	48 89 c7             	mov    rdi,rax
  802115:	e8 5b 04 00 00       	call   802575 <get_according_bnr>
  80211a:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return write_block(f->dev,block,src,len);
  80211d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802121:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802124:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  802127:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80212b:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  80212e:	89 c7                	mov    edi,eax
  802130:	e8 24 08 00 00       	call   802959 <write_block>
  802135:	eb 05                	jmp    80213c <sys_write+0x8f>
    }
    return -1;
  802137:	b8 ff ff ff ff       	mov    eax,0xffffffff
            .src_addr=src,
            .len=len,
            .pos=pos
    };
    return ((driver*)vols[f->voln].fs_drv)->write(&args); */
}
  80213c:	c9                   	leave  
  80213d:	c3                   	ret    

000000000080213e <sys_read>:
int sys_read(int fno, char *dist,  int len)
{
  80213e:	f3 0f 1e fa          	endbr64 
  802142:	55                   	push   rbp
  802143:	48 89 e5             	mov    rbp,rsp
  802146:	48 83 ec 20          	sub    rsp,0x20
  80214a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80214d:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802151:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  802154:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802157:	89 c7                	mov    edi,eax
  802159:	e8 ec 00 00 00       	call   80224a <get_vfs_entry>
  80215e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  802162:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802167:	75 07                	jne    802170 <sys_read+0x32>
  802169:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80216e:	eb 5d                	jmp    8021cd <sys_read+0x8f>
    if(f->type==FTYPE_REG)
  802170:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802174:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802177:	85 c0                	test   eax,eax
  802179:	75 18                	jne    802193 <sys_read+0x55>
    {
        return vfs_read_file(f,dist,len);
  80217b:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80217e:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  802182:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802186:	48 89 ce             	mov    rsi,rcx
  802189:	48 89 c7             	mov    rdi,rax
  80218c:	e8 37 02 00 00       	call   8023c8 <vfs_read_file>
  802191:	eb 3a                	jmp    8021cd <sys_read+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  802193:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802197:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80219a:	83 f8 01             	cmp    eax,0x1
  80219d:	75 29                	jne    8021c8 <sys_read+0x8a>
    {
        int block=get_according_bnr(f);
  80219f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021a3:	48 89 c7             	mov    rdi,rax
  8021a6:	e8 ca 03 00 00       	call   802575 <get_according_bnr>
  8021ab:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return read_block(f->dev,block,dist,len);
  8021ae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021b2:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8021b5:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  8021b8:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8021bc:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  8021bf:	89 c7                	mov    edi,eax
  8021c1:	e8 10 08 00 00       	call   8029d6 <read_block>
  8021c6:	eb 05                	jmp    8021cd <sys_read+0x8f>
    }
    return -1;
  8021c8:	b8 ff ff ff ff       	mov    eax,0xffffffff
    //         .len=len,
    //         .pos=pos,
    //         .entry=*f
    // };
    // return ((driver*)vols[f->voln].fs_drv)->read(&args);
}
  8021cd:	c9                   	leave  
  8021ce:	c3                   	ret    

00000000008021cf <sys_seek>:
int sys_seek(int fno, int offset, int origin)
{
  8021cf:	f3 0f 1e fa          	endbr64 
  8021d3:	55                   	push   rbp
  8021d4:	48 89 e5             	mov    rbp,rsp
  8021d7:	48 83 ec 20          	sub    rsp,0x20
  8021db:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8021de:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8021e1:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  8021e4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8021e7:	89 c7                	mov    edi,eax
  8021e9:	e8 5c 00 00 00       	call   80224a <get_vfs_entry>
  8021ee:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  8021f2:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8021f7:	75 07                	jne    802200 <sys_seek+0x31>
  8021f9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8021fe:	eb 14                	jmp    802214 <sys_seek+0x45>
    f->ptr=offset+origin;
  802200:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802203:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802206:	01 c2                	add    edx,eax
  802208:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80220c:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
    return 0;
  80220f:	b8 00 00 00 00       	mov    eax,0x0
}
  802214:	c9                   	leave  
  802215:	c3                   	ret    

0000000000802216 <sys_tell>:
int sys_tell(int fno)
{
  802216:	f3 0f 1e fa          	endbr64 
  80221a:	55                   	push   rbp
  80221b:	48 89 e5             	mov    rbp,rsp
  80221e:	48 83 ec 20          	sub    rsp,0x20
  802222:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    vfs_dir_entry *f= get_vfs_entry(fno);
  802225:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802228:	89 c7                	mov    edi,eax
  80222a:	e8 1b 00 00 00       	call   80224a <get_vfs_entry>
  80222f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  802233:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802238:	75 07                	jne    802241 <sys_tell+0x2b>
  80223a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80223f:	eb 07                	jmp    802248 <sys_tell+0x32>
    return f->ptr;
  802241:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802245:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802248:	c9                   	leave  
  802249:	c3                   	ret    

000000000080224a <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  80224a:	f3 0f 1e fa          	endbr64 
  80224e:	55                   	push   rbp
  80224f:	48 89 e5             	mov    rbp,rsp
  802252:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802255:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80225c:	eb 3f                	jmp    80229d <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  80225e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802261:	48 63 d0             	movsxd rdx,eax
  802264:	48 89 d0             	mov    rax,rdx
  802267:	48 01 c0             	add    rax,rax
  80226a:	48 01 d0             	add    rax,rdx
  80226d:	48 c1 e0 05          	shl    rax,0x5
  802271:	48 05 60 06 40 00    	add    rax,0x400660
  802277:	8b 00                	mov    eax,DWORD PTR [rax]
  802279:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80227c:	75 1b                	jne    802299 <get_vfs_entry+0x4f>
        {
            return &opened[i];
  80227e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802281:	48 63 d0             	movsxd rdx,eax
  802284:	48 89 d0             	mov    rax,rdx
  802287:	48 01 c0             	add    rax,rax
  80228a:	48 01 d0             	add    rax,rdx
  80228d:	48 c1 e0 05          	shl    rax,0x5
  802291:	48 05 60 06 40 00    	add    rax,0x400660
  802297:	eb 0f                	jmp    8022a8 <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802299:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80229d:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8022a1:	7e bb                	jle    80225e <get_vfs_entry+0x14>
        }
    }
    return NULL;
  8022a3:	b8 00 00 00 00       	mov    eax,0x0
}
  8022a8:	5d                   	pop    rbp
  8022a9:	c3                   	ret    

00000000008022aa <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  8022aa:	f3 0f 1e fa          	endbr64 
  8022ae:	55                   	push   rbp
  8022af:	48 89 e5             	mov    rbp,rsp
  8022b2:	48 83 ec 10          	sub    rsp,0x10
  8022b6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  8022ba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022be:	48 89 c7             	mov    rdi,rax
  8022c1:	e8 a0 04 00 00       	call   802766 <wait_on_buf>
    if(bh->b_count==0)return -1;
  8022c6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022ca:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  8022ce:	84 c0                	test   al,al
  8022d0:	75 07                	jne    8022d9 <brelse+0x2f>
  8022d2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8022d7:	eb 32                	jmp    80230b <brelse+0x61>
    bh->b_count--;
  8022d9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022dd:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  8022e1:	8d 50 ff             	lea    edx,[rax-0x1]
  8022e4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022e8:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  8022eb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022ef:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  8022f3:	84 c0                	test   al,al
  8022f5:	75 0f                	jne    802306 <brelse+0x5c>
        vmfree(bh->b_data);
  8022f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022fb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8022fe:	48 89 c7             	mov    rdi,rax
  802301:	e8 e7 ed ff ff       	call   8010ed <vmfree>
    return 0;
  802306:	b8 00 00 00 00       	mov    eax,0x0
}
  80230b:	c9                   	leave  
  80230c:	c3                   	ret    

000000000080230d <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  80230d:	f3 0f 1e fa          	endbr64 
  802311:	55                   	push   rbp
  802312:	48 89 e5             	mov    rbp,rsp
  802315:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  80231c:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  802322:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  802328:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  80232e:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  802334:	89 d6                	mov    esi,edx
  802336:	89 c7                	mov    edi,eax
  802338:	e8 78 02 00 00       	call   8025b5 <get_buf>
  80233d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  802341:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802346:	75 09                	jne    802351 <bread+0x44>
  802348:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80234f:	eb 75                	jmp    8023c6 <bread+0xb9>
    if(!bh->b_uptodate)
  802351:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802355:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  802359:	84 c0                	test   al,al
  80235b:	75 65                	jne    8023c2 <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  80235d:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  802363:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  802366:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  80236d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802371:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802374:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  80237a:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  802381:	02 00 00 
        arg.lba=bh->b_blocknr;
  802384:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802388:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80238c:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  802392:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  802399:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  80239c:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  8023a3:	48 89 c7             	mov    rdi,rax
  8023a6:	e8 82 12 00 00       	call   80362d <make_request>
  8023ab:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  8023ae:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8023b1:	89 c7                	mov    edi,eax
  8023b3:	e8 88 15 00 00       	call   803940 <wait_on_req>
        clear_req(reqi);
  8023b8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8023bb:	89 c7                	mov    edi,eax
  8023bd:	e8 ae 15 00 00       	call   803970 <clear_req>
    }
    return bh;
  8023c2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8023c6:	c9                   	leave  
  8023c7:	c3                   	ret    

00000000008023c8 <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  8023c8:	f3 0f 1e fa          	endbr64 
  8023cc:	55                   	push   rbp
  8023cd:	48 89 e5             	mov    rbp,rsp
  8023d0:	48 83 ec 40          	sub    rsp,0x40
  8023d4:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  8023d8:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  8023dc:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  8023df:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8023e3:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8023e6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  8023e9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8023ed:	48 89 c7             	mov    rdi,rax
  8023f0:	e8 80 01 00 00       	call   802575 <get_according_bnr>
  8023f5:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  8023f8:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8023fb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8023fe:	89 d6                	mov    esi,edx
  802400:	89 c7                	mov    edi,eax
  802402:	e8 06 ff ff ff       	call   80230d <bread>
  802407:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80240b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80240e:	ba 00 02 00 00       	mov    edx,0x200
  802413:	39 d0                	cmp    eax,edx
  802415:	0f 4f c2             	cmovg  eax,edx
  802418:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  80241b:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80241e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802422:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802425:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802429:	48 89 ce             	mov    rsi,rcx
  80242c:	48 89 c7             	mov    rdi,rax
  80242f:	e8 82 72 00 00       	call   8096b6 <memcpy>
        len-=BLOCK_SIZE;
  802434:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  80243b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80243f:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802442:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802445:	01 c2                	add    edx,eax
  802447:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80244b:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  80244e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802452:	48 89 c7             	mov    rdi,rax
  802455:	e8 50 fe ff ff       	call   8022aa <brelse>
    }while(len>0);
  80245a:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  80245e:	7f 89                	jg     8023e9 <vfs_read_file+0x21>
    return 0;
  802460:	b8 00 00 00 00       	mov    eax,0x0
}
  802465:	c9                   	leave  
  802466:	c3                   	ret    

0000000000802467 <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  802467:	f3 0f 1e fa          	endbr64 
  80246b:	55                   	push   rbp
  80246c:	48 89 e5             	mov    rbp,rsp
  80246f:	48 83 ec 40          	sub    rsp,0x40
  802473:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802477:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80247b:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  80247e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802482:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802485:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802488:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80248c:	48 89 c7             	mov    rdi,rax
  80248f:	e8 e1 00 00 00       	call   802575 <get_according_bnr>
  802494:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  802497:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80249a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80249d:	89 d6                	mov    esi,edx
  80249f:	89 c7                	mov    edi,eax
  8024a1:	e8 0f 01 00 00       	call   8025b5 <get_buf>
  8024a6:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8024aa:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8024ad:	ba 00 02 00 00       	mov    edx,0x200
  8024b2:	39 d0                	cmp    eax,edx
  8024b4:	0f 4f c2             	cmovg  eax,edx
  8024b7:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  8024ba:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8024bd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8024c1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8024c4:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  8024c8:	48 89 ce             	mov    rsi,rcx
  8024cb:	48 89 c7             	mov    rdi,rax
  8024ce:	e8 e3 71 00 00       	call   8096b6 <memcpy>
        len-=BLOCK_SIZE;
  8024d3:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  8024da:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024de:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8024e1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8024e4:	01 c2                	add    edx,eax
  8024e6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024ea:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  8024ed:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8024f1:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  8024f5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8024f9:	48 89 c7             	mov    rdi,rax
  8024fc:	e8 a9 fd ff ff       	call   8022aa <brelse>
    }while(len>0);
  802501:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  802505:	7f 81                	jg     802488 <vfs_write_file+0x21>
    return 0;
  802507:	b8 00 00 00 00       	mov    eax,0x0
}
  80250c:	c9                   	leave  
  80250d:	c3                   	ret    

000000000080250e <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  80250e:	f3 0f 1e fa          	endbr64 
  802512:	55                   	push   rbp
  802513:	48 89 e5             	mov    rbp,rsp
  802516:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80251a:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  80251d:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  802520:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  802524:	74 20                	je     802546 <vfs_seek_file+0x38>
  802526:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  80252a:	7f 3f                	jg     80256b <vfs_seek_file+0x5d>
  80252c:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  802530:	74 08                	je     80253a <vfs_seek_file+0x2c>
  802532:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  802536:	74 23                	je     80255b <vfs_seek_file+0x4d>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  802538:	eb 31                	jmp    80256b <vfs_seek_file+0x5d>
        f->ptr=offset;
  80253a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80253e:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802541:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802544:	eb 26                	jmp    80256c <vfs_seek_file+0x5e>
        f->ptr+=offset;
  802546:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80254a:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80254d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802550:	01 c2                	add    edx,eax
  802552:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802556:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802559:	eb 11                	jmp    80256c <vfs_seek_file+0x5e>
        f->ptr=f->size;
  80255b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80255f:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  802562:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802566:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802569:	eb 01                	jmp    80256c <vfs_seek_file+0x5e>
        break;
  80256b:	90                   	nop
    }
    return f->ptr;
  80256c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802570:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802573:	5d                   	pop    rbp
  802574:	c3                   	ret    

0000000000802575 <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  802575:	f3 0f 1e fa          	endbr64 
  802579:	55                   	push   rbp
  80257a:	48 89 e5             	mov    rbp,rsp
  80257d:	48 83 ec 10          	sub    rsp,0x10
  802581:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  802585:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802589:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80258c:	48 63 d0             	movsxd rdx,eax
  80258f:	48 89 d0             	mov    rax,rdx
  802592:	48 c1 e0 02          	shl    rax,0x2
  802596:	48 01 d0             	add    rax,rdx
  802599:	48 c1 e0 03          	shl    rax,0x3
  80259d:	48 05 58 02 40 00    	add    rax,0x400258
  8025a3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8025a6:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8025aa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025ae:	48 89 c7             	mov    rdi,rax
  8025b1:	ff d2                	call   rdx

}
  8025b3:	c9                   	leave  
  8025b4:	c3                   	ret    

00000000008025b5 <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  8025b5:	f3 0f 1e fa          	endbr64 
  8025b9:	55                   	push   rbp
  8025ba:	48 89 e5             	mov    rbp,rsp
  8025bd:	48 83 ec 20          	sub    rsp,0x20
  8025c1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8025c4:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8025c7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8025ce:	e9 b9 00 00 00       	jmp    80268c <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  8025d3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8025d6:	48 98                	cdqe   
  8025d8:	48 c1 e0 06          	shl    rax,0x6
  8025dc:	48 05 90 26 40 00    	add    rax,0x402690
  8025e2:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8025e5:	0f b7 c0             	movzx  eax,ax
  8025e8:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8025eb:	0f 85 97 00 00 00    	jne    802688 <get_buf+0xd3>
  8025f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8025f4:	48 98                	cdqe   
  8025f6:	48 c1 e0 06          	shl    rax,0x6
  8025fa:	48 05 88 26 40 00    	add    rax,0x402688
  802600:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802603:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802606:	48 98                	cdqe   
  802608:	48 39 c2             	cmp    rdx,rax
  80260b:	75 7b                	jne    802688 <get_buf+0xd3>
        {
            repeat:
  80260d:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  80260e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802611:	48 98                	cdqe   
  802613:	48 c1 e0 06          	shl    rax,0x6
  802617:	48 05 80 26 40 00    	add    rax,0x402680
  80261d:	48 89 c7             	mov    rdi,rax
  802620:	e8 41 01 00 00       	call   802766 <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  802625:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802628:	48 98                	cdqe   
  80262a:	48 c1 e0 06          	shl    rax,0x6
  80262e:	48 05 94 26 40 00    	add    rax,0x402694
  802634:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802637:	84 c0                	test   al,al
  802639:	74 02                	je     80263d <get_buf+0x88>
                goto repeat;
  80263b:	eb d1                	jmp    80260e <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  80263d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802640:	48 98                	cdqe   
  802642:	48 c1 e0 06          	shl    rax,0x6
  802646:	48 05 90 26 40 00    	add    rax,0x402690
  80264c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80264f:	0f b7 c0             	movzx  eax,ax
  802652:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802655:	75 30                	jne    802687 <get_buf+0xd2>
  802657:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80265a:	48 98                	cdqe   
  80265c:	48 c1 e0 06          	shl    rax,0x6
  802660:	48 05 88 26 40 00    	add    rax,0x402688
  802666:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802669:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80266c:	48 98                	cdqe   
  80266e:	48 39 c2             	cmp    rdx,rax
  802671:	75 14                	jne    802687 <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  802673:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802676:	48 98                	cdqe   
  802678:	48 c1 e0 06          	shl    rax,0x6
  80267c:	48 05 80 26 40 00    	add    rax,0x402680
  802682:	e9 dd 00 00 00       	jmp    802764 <get_buf+0x1af>
                continue;
  802687:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802688:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80268c:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  802690:	0f 8e 3d ff ff ff    	jle    8025d3 <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802696:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80269d:	e9 b8 00 00 00       	jmp    80275a <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  8026a2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8026a5:	48 98                	cdqe   
  8026a7:	48 c1 e0 06          	shl    rax,0x6
  8026ab:	48 05 94 26 40 00    	add    rax,0x402694
  8026b1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8026b4:	84 c0                	test   al,al
  8026b6:	0f 85 9a 00 00 00    	jne    802756 <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  8026bc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8026bf:	48 98                	cdqe   
  8026c1:	48 c1 e0 06          	shl    rax,0x6
  8026c5:	48 05 93 26 40 00    	add    rax,0x402693
  8026cb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8026ce:	84 c0                	test   al,al
  8026d0:	74 2e                	je     802700 <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  8026d2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8026d5:	48 98                	cdqe   
  8026d7:	48 c1 e0 06          	shl    rax,0x6
  8026db:	48 05 80 26 40 00    	add    rax,0x402680
  8026e1:	48 89 c7             	mov    rdi,rax
  8026e4:	e8 2c 02 00 00       	call   802915 <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  8026e9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8026ec:	48 98                	cdqe   
  8026ee:	48 c1 e0 06          	shl    rax,0x6
  8026f2:	48 05 80 26 40 00    	add    rax,0x402680
  8026f8:	48 89 c7             	mov    rdi,rax
  8026fb:	e8 66 00 00 00       	call   802766 <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  802700:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802703:	48 98                	cdqe   
  802705:	48 c1 e0 06          	shl    rax,0x6
  802709:	48 05 94 26 40 00    	add    rax,0x402694
  80270f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802712:	8d 50 01             	lea    edx,[rax+0x1]
  802715:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802718:	48 98                	cdqe   
  80271a:	48 c1 e0 06          	shl    rax,0x6
  80271e:	48 05 94 26 40 00    	add    rax,0x402694
  802724:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  802726:	b8 00 00 00 00       	mov    eax,0x0
  80272b:	e8 2e e9 ff ff       	call   80105e <vmalloc>
  802730:	48 89 c2             	mov    rdx,rax
  802733:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802736:	48 98                	cdqe   
  802738:	48 c1 e0 06          	shl    rax,0x6
  80273c:	48 05 80 26 40 00    	add    rax,0x402680
  802742:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  802745:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802748:	48 98                	cdqe   
  80274a:	48 c1 e0 06          	shl    rax,0x6
  80274e:	48 05 80 26 40 00    	add    rax,0x402680
  802754:	eb 0e                	jmp    802764 <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802756:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80275a:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80275e:	0f 8e 3e ff ff ff    	jle    8026a2 <get_buf+0xed>
        }
    }
}
  802764:	c9                   	leave  
  802765:	c3                   	ret    

0000000000802766 <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  802766:	f3 0f 1e fa          	endbr64 
  80276a:	55                   	push   rbp
  80276b:	48 89 e5             	mov    rbp,rsp
  80276e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  802772:	90                   	nop
  802773:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802777:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  80277b:	84 c0                	test   al,al
  80277d:	75 f4                	jne    802773 <wait_on_buf+0xd>
    
}
  80277f:	90                   	nop
  802780:	90                   	nop
  802781:	5d                   	pop    rbp
  802782:	c3                   	ret    

0000000000802783 <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  802783:	f3 0f 1e fa          	endbr64 
  802787:	55                   	push   rbp
  802788:	48 89 e5             	mov    rbp,rsp
  80278b:	48 83 ec 40          	sub    rsp,0x40
  80278f:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    device *blkdev=get_dev(dev);
  802792:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802795:	89 c7                	mov    edi,eax
  802797:	e8 3c 0e 00 00       	call   8035d8 <get_dev>
  80279c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    buffer_head* bh=bread(dev,0);
  8027a0:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8027a3:	be 00 00 00 00       	mov    esi,0x0
  8027a8:	89 c7                	mov    edi,eax
  8027aa:	e8 5e fb ff ff       	call   80230d <bread>
  8027af:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!bh)return -1;
  8027b3:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  8027b8:	75 0a                	jne    8027c4 <scan_dev+0x41>
  8027ba:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8027bf:	e9 4f 01 00 00       	jmp    802913 <scan_dev+0x190>
    dpt_t* dpte=bh->b_data+0x1be;
  8027c4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8027c8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8027cb:	48 05 be 01 00 00    	add    rax,0x1be
  8027d1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  8027d5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8027dc:	e9 17 01 00 00       	jmp    8028f8 <scan_dev+0x175>
    {
        blkdev->par[i].type=dpte->type;
  8027e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8027e5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8027e8:	0f b6 d0             	movzx  edx,al
  8027eb:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  8027ef:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8027f2:	48 63 c8             	movsxd rcx,eax
  8027f5:	48 89 c8             	mov    rax,rcx
  8027f8:	48 01 c0             	add    rax,rax
  8027fb:	48 01 c8             	add    rax,rcx
  8027fe:	48 c1 e0 02          	shl    rax,0x2
  802802:	48 01 f0             	add    rax,rsi
  802805:	48 83 c0 40          	add    rax,0x40
  802809:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
        int stlba=dpte->start_lba;
  80280c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802810:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802813:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
        blkdev->par[i].start_sec=stlba;
  802816:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80281a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80281d:	48 63 d0             	movsxd rdx,eax
  802820:	48 89 d0             	mov    rax,rdx
  802823:	48 01 c0             	add    rax,rax
  802826:	48 01 d0             	add    rax,rdx
  802829:	48 c1 e0 02          	shl    rax,0x2
  80282d:	48 01 c8             	add    rax,rcx
  802830:	48 8d 50 40          	lea    rdx,[rax+0x40]
  802834:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802837:	89 02                	mov    DWORD PTR [rdx],eax
        int i;
        for(i=0;i<MAX_FS;i++)
  802839:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  802840:	eb 68                	jmp    8028aa <scan_dev+0x127>
        {
            if(fs[i].read_superblock&&fs[i].read_superblock(dev,stlba)==0)
  802842:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  802845:	48 63 d0             	movsxd rdx,eax
  802848:	48 89 d0             	mov    rax,rdx
  80284b:	48 01 c0             	add    rax,rax
  80284e:	48 01 d0             	add    rax,rdx
  802851:	48 c1 e0 03          	shl    rax,0x3
  802855:	48 05 80 23 40 00    	add    rax,0x402380
  80285b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80285e:	48 85 c0             	test   rax,rax
  802861:	74 43                	je     8028a6 <scan_dev+0x123>
  802863:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  802866:	48 63 d0             	movsxd rdx,eax
  802869:	48 89 d0             	mov    rax,rdx
  80286c:	48 01 c0             	add    rax,rax
  80286f:	48 01 d0             	add    rax,rdx
  802872:	48 c1 e0 03          	shl    rax,0x3
  802876:	48 05 80 23 40 00    	add    rax,0x402380
  80287c:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80287f:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  802882:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802885:	89 d6                	mov    esi,edx
  802887:	89 c7                	mov    edi,eax
  802889:	ff d1                	call   rcx
  80288b:	85 c0                	test   eax,eax
  80288d:	75 17                	jne    8028a6 <scan_dev+0x123>
            {
                reg_vol(dev,i,blkdev->name);//识别成功，注册卷
  80288f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802893:	48 8d 50 14          	lea    rdx,[rax+0x14]
  802897:	8b 4d f0             	mov    ecx,DWORD PTR [rbp-0x10]
  80289a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80289d:	89 ce                	mov    esi,ecx
  80289f:	89 c7                	mov    edi,eax
  8028a1:	e8 ae f1 ff ff       	call   801a54 <reg_vol>
        for(i=0;i<MAX_FS;i++)
  8028a6:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8028aa:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  8028ae:	7e 92                	jle    802842 <scan_dev+0xbf>
            }
        }
        if(i==MAX_FS)
  8028b0:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  8028b4:	75 0f                	jne    8028c5 <scan_dev+0x142>
        {
            printf("err:unrecognised partition fs.\n");
  8028b6:	bf e8 1a 81 00       	mov    edi,0x811ae8
  8028bb:	b8 00 00 00 00       	mov    eax,0x0
  8028c0:	e8 ad e3 ff ff       	call   800c72 <printf>
        }

        blkdev->par[i].end_sec=dpte->end_lba;
  8028c5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028c9:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8028cc:	89 c1                	mov    ecx,eax
  8028ce:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  8028d2:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8028d5:	48 63 d0             	movsxd rdx,eax
  8028d8:	48 89 d0             	mov    rax,rdx
  8028db:	48 01 c0             	add    rax,rax
  8028de:	48 01 d0             	add    rax,rdx
  8028e1:	48 c1 e0 02          	shl    rax,0x2
  8028e5:	48 01 f0             	add    rax,rsi
  8028e8:	48 83 c0 40          	add    rax,0x40
  8028ec:	89 48 04             	mov    DWORD PTR [rax+0x4],ecx
        dpte++;
  8028ef:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  8028f4:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8028f8:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8028fc:	0f 8e df fe ff ff    	jle    8027e1 <scan_dev+0x5e>
    }
    brelse(bh);
  802902:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802906:	48 89 c7             	mov    rdi,rax
  802909:	e8 9c f9 ff ff       	call   8022aa <brelse>
    return 0;
  80290e:	b8 00 00 00 00       	mov    eax,0x0
}
  802913:	c9                   	leave  
  802914:	c3                   	ret    

0000000000802915 <sync_buf>:

int sync_buf(buffer_head* bh)
{
  802915:	f3 0f 1e fa          	endbr64 
  802919:	55                   	push   rbp
  80291a:	48 89 e5             	mov    rbp,rsp
  80291d:	48 83 ec 20          	sub    rsp,0x20
  802921:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  802925:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802929:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  80292d:	0f b7 c0             	movzx  eax,ax
  802930:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  802933:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802937:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80293b:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  80293e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802942:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802945:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  802948:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80294b:	b9 00 02 00 00       	mov    ecx,0x200
  802950:	89 c7                	mov    edi,eax
  802952:	e8 02 00 00 00       	call   802959 <write_block>

}
  802957:	c9                   	leave  
  802958:	c3                   	ret    

0000000000802959 <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  802959:	f3 0f 1e fa          	endbr64 
  80295d:	55                   	push   rbp
  80295e:	48 89 e5             	mov    rbp,rsp
  802961:	48 83 ec 30          	sub    rsp,0x30
  802965:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802968:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80296b:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  80296f:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  802972:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802975:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802978:	89 d6                	mov    esi,edx
  80297a:	89 c7                	mov    edi,eax
  80297c:	e8 34 fc ff ff       	call   8025b5 <get_buf>
  802981:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802985:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802988:	ba 00 02 00 00       	mov    edx,0x200
  80298d:	39 d0                	cmp    eax,edx
  80298f:	0f 4f c2             	cmovg  eax,edx
  802992:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  802995:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802998:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80299c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80299f:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8029a3:	48 89 ce             	mov    rsi,rcx
  8029a6:	48 89 c7             	mov    rdi,rax
  8029a9:	e8 08 6d 00 00       	call   8096b6 <memcpy>
        len-=BLOCK_SIZE;
  8029ae:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  8029b5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029b9:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  8029bd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029c1:	48 89 c7             	mov    rdi,rax
  8029c4:	e8 e1 f8 ff ff       	call   8022aa <brelse>
    }while(len>0);
  8029c9:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  8029cd:	7f a3                	jg     802972 <write_block+0x19>
    return 0;
  8029cf:	b8 00 00 00 00       	mov    eax,0x0
}
  8029d4:	c9                   	leave  
  8029d5:	c3                   	ret    

00000000008029d6 <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  8029d6:	f3 0f 1e fa          	endbr64 
  8029da:	55                   	push   rbp
  8029db:	48 89 e5             	mov    rbp,rsp
  8029de:	48 83 ec 30          	sub    rsp,0x30
  8029e2:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8029e5:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8029e8:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  8029ec:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  8029ef:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8029f2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8029f5:	89 d6                	mov    esi,edx
  8029f7:	89 c7                	mov    edi,eax
  8029f9:	e8 0f f9 ff ff       	call   80230d <bread>
  8029fe:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802a02:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802a05:	ba 00 02 00 00       	mov    edx,0x200
  802a0a:	39 d0                	cmp    eax,edx
  802a0c:	0f 4f c2             	cmovg  eax,edx
  802a0f:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  802a12:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802a15:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a19:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802a1c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802a20:	48 89 ce             	mov    rsi,rcx
  802a23:	48 89 c7             	mov    rdi,rax
  802a26:	e8 8b 6c 00 00       	call   8096b6 <memcpy>
        len-=BLOCK_SIZE;
  802a2b:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  802a32:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a36:	48 89 c7             	mov    rdi,rax
  802a39:	e8 6c f8 ff ff       	call   8022aa <brelse>
    }while(len>0);
  802a3e:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802a42:	7f ab                	jg     8029ef <read_block+0x19>
    return 0;
  802a44:	b8 00 00 00 00       	mov    eax,0x0
}
  802a49:	c9                   	leave  
  802a4a:	c3                   	ret    

0000000000802a4b <init_vfs>:

int init_vfs()
{
  802a4b:	f3 0f 1e fa          	endbr64 
  802a4f:	55                   	push   rbp
  802a50:	48 89 e5             	mov    rbp,rsp
  802a53:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  802a57:	48 8b 05 22 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a22]        # 408480 <dev_tree>
  802a5e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  802a62:	eb 40                	jmp    802aa4 <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  802a64:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a68:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  802a6e:	48 c1 f8 02          	sar    rax,0x2
  802a72:	48 89 c2             	mov    rdx,rax
  802a75:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  802a7c:	18 9c 8f 
  802a7f:	48 0f af c2          	imul   rax,rdx
  802a83:	89 c7                	mov    edi,eax
  802a85:	e8 f9 fc ff ff       	call   802783 <scan_dev>
  802a8a:	85 c0                	test   eax,eax
  802a8c:	74 07                	je     802a95 <init_vfs+0x4a>
  802a8e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802a93:	eb 1b                	jmp    802ab0 <init_vfs+0x65>
    for(;p;p=p->next)
  802a95:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a99:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802aa0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  802aa4:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802aa9:	75 b9                	jne    802a64 <init_vfs+0x19>
    }
    return 0;
  802aab:	b8 00 00 00 00       	mov    eax,0x0
  802ab0:	c9                   	leave  
  802ab1:	c3                   	ret    

0000000000802ab2 <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  802ab2:	f3 0f 1e fa          	endbr64 
  802ab6:	55                   	push   rbp
  802ab7:	48 89 e5             	mov    rbp,rsp
}
  802aba:	90                   	nop
  802abb:	5d                   	pop    rbp
  802abc:	c3                   	ret    

0000000000802abd <load_driver>:
int load_driver(char *path)
{
  802abd:	f3 0f 1e fa          	endbr64 
  802ac1:	55                   	push   rbp
  802ac2:	48 89 e5             	mov    rbp,rsp
  802ac5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  802ac9:	90                   	nop
  802aca:	5d                   	pop    rbp
  802acb:	c3                   	ret    

0000000000802acc <reg_device>:

int reg_device(device* dev)
{
  802acc:	f3 0f 1e fa          	endbr64 
  802ad0:	55                   	push   rbp
  802ad1:	48 89 e5             	mov    rbp,rsp
  802ad4:	53                   	push   rbx
  802ad5:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  802ad9:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  802ae0:	e9 42 01 00 00       	jmp    802c27 <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  802ae5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802ae8:	48 63 d0             	movsxd rdx,eax
  802aeb:	48 89 d0             	mov    rax,rdx
  802aee:	48 c1 e0 02          	shl    rax,0x2
  802af2:	48 01 d0             	add    rax,rdx
  802af5:	48 c1 e0 02          	shl    rax,0x2
  802af9:	48 01 d0             	add    rax,rdx
  802afc:	48 c1 e0 03          	shl    rax,0x3
  802b00:	48 05 90 2e 40 00    	add    rax,0x402e90
  802b06:	8b 00                	mov    eax,DWORD PTR [rax]
  802b08:	85 c0                	test   eax,eax
  802b0a:	0f 85 13 01 00 00    	jne    802c23 <reg_device+0x157>
        {
            devs[i]=*dev;
  802b10:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802b13:	48 63 d0             	movsxd rdx,eax
  802b16:	48 89 d0             	mov    rax,rdx
  802b19:	48 c1 e0 02          	shl    rax,0x2
  802b1d:	48 01 d0             	add    rax,rdx
  802b20:	48 c1 e0 02          	shl    rax,0x2
  802b24:	48 01 d0             	add    rax,rdx
  802b27:	48 c1 e0 03          	shl    rax,0x3
  802b2b:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  802b32:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802b36:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802b39:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802b3d:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802b40:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802b44:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802b48:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802b4c:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802b50:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802b54:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802b58:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802b5c:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802b60:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802b64:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802b68:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802b6c:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802b70:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802b74:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802b78:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802b7c:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802b80:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802b84:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802b88:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802b8c:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802b90:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802b94:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802b98:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802b9c:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802ba0:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802ba4:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802ba8:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802bac:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802bb0:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802bb4:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802bbb:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802bc2:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802bc9:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802bd0:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802bd7:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802bde:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802be5:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  802bec:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  802bf3:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  802bfa:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802bfd:	48 63 d0             	movsxd rdx,eax
  802c00:	48 89 d0             	mov    rax,rdx
  802c03:	48 c1 e0 02          	shl    rax,0x2
  802c07:	48 01 d0             	add    rax,rdx
  802c0a:	48 c1 e0 02          	shl    rax,0x2
  802c0e:	48 01 d0             	add    rax,rdx
  802c11:	48 c1 e0 03          	shl    rax,0x3
  802c15:	48 05 90 2e 40 00    	add    rax,0x402e90
  802c1b:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802c21:	eb 0e                	jmp    802c31 <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  802c23:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802c27:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  802c2b:	0f 8e b4 fe ff ff    	jle    802ae5 <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802c31:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  802c35:	75 0a                	jne    802c41 <reg_device+0x175>
        return -1;
  802c37:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802c3c:	e9 6d 01 00 00       	jmp    802dae <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802c41:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  802c48:	00 
  802c49:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802c4c:	48 63 d0             	movsxd rdx,eax
  802c4f:	48 89 d0             	mov    rax,rdx
  802c52:	48 c1 e0 02          	shl    rax,0x2
  802c56:	48 01 d0             	add    rax,rdx
  802c59:	48 c1 e0 02          	shl    rax,0x2
  802c5d:	48 01 d0             	add    rax,rdx
  802c60:	48 c1 e0 03          	shl    rax,0x3
  802c64:	48 05 80 2e 40 00    	add    rax,0x402e80
  802c6a:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  802c6e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802c72:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802c75:	83 f8 03             	cmp    eax,0x3
  802c78:	74 3b                	je     802cb5 <reg_device+0x1e9>
  802c7a:	83 f8 03             	cmp    eax,0x3
  802c7d:	7f 4b                	jg     802cca <reg_device+0x1fe>
  802c7f:	83 f8 01             	cmp    eax,0x1
  802c82:	74 07                	je     802c8b <reg_device+0x1bf>
  802c84:	83 f8 02             	cmp    eax,0x2
  802c87:	74 17                	je     802ca0 <reg_device+0x1d4>
  802c89:	eb 3f                	jmp    802cca <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  802c8b:	48 8b 05 ee 57 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc057ee]        # 408480 <dev_tree>
  802c92:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802c96:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  802c9d:	00 
        break;
  802c9e:	eb 34                	jmp    802cd4 <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  802ca0:	48 8b 05 e1 57 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc057e1]        # 408488 <dev_tree+0x8>
  802ca7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802cab:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  802cb2:	00 
        break;
  802cb3:	eb 1f                	jmp    802cd4 <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  802cb5:	48 8b 05 d4 57 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc057d4]        # 408490 <dev_tree+0x10>
  802cbc:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802cc0:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  802cc7:	00 
        break;
  802cc8:	eb 0a                	jmp    802cd4 <reg_device+0x208>
    default:return -1;//不可能有其他情况
  802cca:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802ccf:	e9 da 00 00 00       	jmp    802dae <reg_device+0x2e2>
    }
    if(!p){
  802cd4:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  802cd9:	75 2b                	jne    802d06 <reg_device+0x23a>
        *pp=neo;
  802cdb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802cdf:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802ce3:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  802ce6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802cea:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  802cf1:	00 00 00 00 
  802cf5:	eb 3d                	jmp    802d34 <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  802cf7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802cfb:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802d02:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802d06:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d0a:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802d11:	48 85 c0             	test   rax,rax
  802d14:	75 e1                	jne    802cf7 <reg_device+0x22b>
        p->next=neo;
  802d16:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d1a:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802d1e:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  802d25:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d29:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802d2d:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802d34:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d38:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802d3f:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802d43:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d47:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802d4a:	83 f8 04             	cmp    eax,0x4
  802d4d:	74 3b                	je     802d8a <reg_device+0x2be>
  802d4f:	83 f8 04             	cmp    eax,0x4
  802d52:	7f 56                	jg     802daa <reg_device+0x2de>
  802d54:	83 f8 03             	cmp    eax,0x3
  802d57:	74 21                	je     802d7a <reg_device+0x2ae>
  802d59:	83 f8 03             	cmp    eax,0x3
  802d5c:	7f 4c                	jg     802daa <reg_device+0x2de>
  802d5e:	83 f8 01             	cmp    eax,0x1
  802d61:	74 07                	je     802d6a <reg_device+0x29e>
  802d63:	83 f8 02             	cmp    eax,0x2
  802d66:	74 32                	je     802d9a <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802d68:	eb 40                	jmp    802daa <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  802d6a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d6e:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802d75:	00 00 00 
        break;
  802d78:	eb 31                	jmp    802dab <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  802d7a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d7e:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802d85:	00 00 00 
        break;
  802d88:	eb 21                	jmp    802dab <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  802d8a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d8e:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  802d95:	00 00 00 
        break;
  802d98:	eb 11                	jmp    802dab <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  802d9a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d9e:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  802da5:	00 00 00 
        break;
  802da8:	eb 01                	jmp    802dab <reg_device+0x2df>
        break;
  802daa:	90                   	nop
    }
    return i;
  802dab:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  802dae:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802db2:	c9                   	leave  
  802db3:	c3                   	ret    

0000000000802db4 <reg_driver>:


int reg_driver(driver *drv)
{
  802db4:	f3 0f 1e fa          	endbr64 
  802db8:	55                   	push   rbp
  802db9:	48 89 e5             	mov    rbp,rsp
  802dbc:	53                   	push   rbx
  802dbd:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  802dc1:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802dc8:	e9 22 01 00 00       	jmp    802eef <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  802dcd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802dd0:	48 63 d0             	movsxd rdx,eax
  802dd3:	48 89 d0             	mov    rax,rdx
  802dd6:	48 c1 e0 02          	shl    rax,0x2
  802dda:	48 01 d0             	add    rax,rdx
  802ddd:	48 c1 e0 05          	shl    rax,0x5
  802de1:	48 05 80 58 40 00    	add    rax,0x405880
  802de7:	8b 00                	mov    eax,DWORD PTR [rax]
  802de9:	85 c0                	test   eax,eax
  802deb:	0f 85 fa 00 00 00    	jne    802eeb <reg_driver+0x137>
        {
            drvs[i]=*drv;
  802df1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802df4:	48 63 d0             	movsxd rdx,eax
  802df7:	48 89 d0             	mov    rax,rdx
  802dfa:	48 c1 e0 02          	shl    rax,0x2
  802dfe:	48 01 d0             	add    rax,rdx
  802e01:	48 c1 e0 05          	shl    rax,0x5
  802e05:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  802e0c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802e10:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802e13:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802e17:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802e1a:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802e1e:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802e22:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802e26:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802e2a:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802e2e:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802e32:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802e36:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802e3a:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802e3e:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802e42:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802e46:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802e4a:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802e4e:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802e52:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802e56:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802e5a:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802e5e:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802e62:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802e66:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802e6a:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802e6e:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802e72:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802e76:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802e7a:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802e7e:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802e82:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802e86:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802e8a:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802e8e:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802e95:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802e9c:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802ea3:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802eaa:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802eb1:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802eb8:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802ebf:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  802ec6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802ec9:	48 63 d0             	movsxd rdx,eax
  802ecc:	48 89 d0             	mov    rax,rdx
  802ecf:	48 c1 e0 02          	shl    rax,0x2
  802ed3:	48 01 d0             	add    rax,rdx
  802ed6:	48 c1 e0 05          	shl    rax,0x5
  802eda:	48 05 80 58 40 00    	add    rax,0x405880
  802ee0:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  802ee6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802ee9:	eb 13                	jmp    802efe <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  802eeb:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802eef:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  802ef3:	0f 8e d4 fe ff ff    	jle    802dcd <reg_driver+0x19>
        }
    }
    return -1;
  802ef9:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802efe:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802f02:	c9                   	leave  
  802f03:	c3                   	ret    

0000000000802f04 <sys_find_dev>:

int sys_find_dev(char *name)
{
  802f04:	f3 0f 1e fa          	endbr64 
  802f08:	55                   	push   rbp
  802f09:	48 89 e5             	mov    rbp,rsp
  802f0c:	48 83 ec 20          	sub    rsp,0x20
  802f10:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802f14:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802f1b:	eb 6c                	jmp    802f89 <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802f1d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f20:	48 63 d0             	movsxd rdx,eax
  802f23:	48 89 d0             	mov    rax,rdx
  802f26:	48 c1 e0 02          	shl    rax,0x2
  802f2a:	48 01 d0             	add    rax,rdx
  802f2d:	48 c1 e0 02          	shl    rax,0x2
  802f31:	48 01 d0             	add    rax,rdx
  802f34:	48 c1 e0 03          	shl    rax,0x3
  802f38:	48 05 90 2e 40 00    	add    rax,0x402e90
  802f3e:	8b 00                	mov    eax,DWORD PTR [rax]
  802f40:	85 c0                	test   eax,eax
  802f42:	74 41                	je     802f85 <sys_find_dev+0x81>
  802f44:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f47:	48 63 d0             	movsxd rdx,eax
  802f4a:	48 89 d0             	mov    rax,rdx
  802f4d:	48 c1 e0 02          	shl    rax,0x2
  802f51:	48 01 d0             	add    rax,rdx
  802f54:	48 c1 e0 02          	shl    rax,0x2
  802f58:	48 01 d0             	add    rax,rdx
  802f5b:	48 c1 e0 03          	shl    rax,0x3
  802f5f:	48 83 c0 10          	add    rax,0x10
  802f63:	48 05 80 2e 40 00    	add    rax,0x402e80
  802f69:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802f6d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802f71:	48 89 d6             	mov    rsi,rdx
  802f74:	48 89 c7             	mov    rdi,rax
  802f77:	e8 d8 69 00 00       	call   809954 <strcmp>
  802f7c:	85 c0                	test   eax,eax
  802f7e:	75 05                	jne    802f85 <sys_find_dev+0x81>
            return i;
  802f80:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f83:	eb 0f                	jmp    802f94 <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802f85:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802f89:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802f8d:	7e 8e                	jle    802f1d <sys_find_dev+0x19>
    }
    return -1;
  802f8f:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802f94:	c9                   	leave  
  802f95:	c3                   	ret    

0000000000802f96 <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  802f96:	f3 0f 1e fa          	endbr64 
  802f9a:	55                   	push   rbp
  802f9b:	48 89 e5             	mov    rbp,rsp
  802f9e:	48 83 ec 30          	sub    rsp,0x30
  802fa2:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802fa6:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  802fa9:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  802fad:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  802fb4:	eb 67                	jmp    80301d <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802fb6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fb9:	48 63 d0             	movsxd rdx,eax
  802fbc:	48 89 d0             	mov    rax,rdx
  802fbf:	48 c1 e0 02          	shl    rax,0x2
  802fc3:	48 01 d0             	add    rax,rdx
  802fc6:	48 c1 e0 02          	shl    rax,0x2
  802fca:	48 01 d0             	add    rax,rdx
  802fcd:	48 c1 e0 03          	shl    rax,0x3
  802fd1:	48 05 90 2e 40 00    	add    rax,0x402e90
  802fd7:	8b 00                	mov    eax,DWORD PTR [rax]
  802fd9:	85 c0                	test   eax,eax
  802fdb:	74 3c                	je     803019 <sys_operate_dev+0x83>
  802fdd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fe0:	48 63 d0             	movsxd rdx,eax
  802fe3:	48 89 d0             	mov    rax,rdx
  802fe6:	48 c1 e0 02          	shl    rax,0x2
  802fea:	48 01 d0             	add    rax,rdx
  802fed:	48 c1 e0 02          	shl    rax,0x2
  802ff1:	48 01 d0             	add    rax,rdx
  802ff4:	48 c1 e0 03          	shl    rax,0x3
  802ff8:	48 83 c0 10          	add    rax,0x10
  802ffc:	48 05 80 2e 40 00    	add    rax,0x402e80
  803002:	48 8d 50 04          	lea    rdx,[rax+0x4]
  803006:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80300a:	48 89 d6             	mov    rsi,rdx
  80300d:	48 89 c7             	mov    rdi,rax
  803010:	e8 3f 69 00 00       	call   809954 <strcmp>
  803015:	85 c0                	test   eax,eax
  803017:	74 0c                	je     803025 <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  803019:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80301d:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803021:	7e 93                	jle    802fb6 <sys_operate_dev+0x20>
  803023:	eb 01                	jmp    803026 <sys_operate_dev+0x90>
            break;
  803025:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  803026:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  80302a:	75 0a                	jne    803036 <sys_operate_dev+0xa0>
  80302c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803031:	e9 9c 02 00 00       	jmp    8032d2 <sys_operate_dev+0x33c>
    switch (func) {
  803036:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  80303a:	0f 87 8d 02 00 00    	ja     8032cd <sys_operate_dev+0x337>
  803040:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  803043:	48 8b 04 c5 08 1b 81 	mov    rax,QWORD PTR [rax*8+0x811b08]
  80304a:	00 
  80304b:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  80304e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803051:	48 63 d0             	movsxd rdx,eax
  803054:	48 89 d0             	mov    rax,rdx
  803057:	48 c1 e0 02          	shl    rax,0x2
  80305b:	48 01 d0             	add    rax,rdx
  80305e:	48 c1 e0 02          	shl    rax,0x2
  803062:	48 01 d0             	add    rax,rdx
  803065:	48 c1 e0 03          	shl    rax,0x3
  803069:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80306f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803072:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  803076:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80307a:	48 89 c7             	mov    rdi,rax
  80307d:	ff d2                	call   rdx
  80307f:	e9 4e 02 00 00       	jmp    8032d2 <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  803084:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803087:	48 63 d0             	movsxd rdx,eax
  80308a:	48 89 d0             	mov    rax,rdx
  80308d:	48 c1 e0 02          	shl    rax,0x2
  803091:	48 01 d0             	add    rax,rdx
  803094:	48 c1 e0 02          	shl    rax,0x2
  803098:	48 01 d0             	add    rax,rdx
  80309b:	48 c1 e0 03          	shl    rax,0x3
  80309f:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030a5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030a8:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8030ac:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030b0:	48 89 c7             	mov    rdi,rax
  8030b3:	ff d2                	call   rdx
  8030b5:	e9 18 02 00 00       	jmp    8032d2 <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  8030ba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030bd:	48 63 d0             	movsxd rdx,eax
  8030c0:	48 89 d0             	mov    rax,rdx
  8030c3:	48 c1 e0 02          	shl    rax,0x2
  8030c7:	48 01 d0             	add    rax,rdx
  8030ca:	48 c1 e0 02          	shl    rax,0x2
  8030ce:	48 01 d0             	add    rax,rdx
  8030d1:	48 c1 e0 03          	shl    rax,0x3
  8030d5:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030db:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030de:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  8030e2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030e6:	48 89 c7             	mov    rdi,rax
  8030e9:	ff d2                	call   rdx
  8030eb:	e9 e2 01 00 00       	jmp    8032d2 <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  8030f0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030f3:	48 63 d0             	movsxd rdx,eax
  8030f6:	48 89 d0             	mov    rax,rdx
  8030f9:	48 c1 e0 02          	shl    rax,0x2
  8030fd:	48 01 d0             	add    rax,rdx
  803100:	48 c1 e0 02          	shl    rax,0x2
  803104:	48 01 d0             	add    rax,rdx
  803107:	48 c1 e0 03          	shl    rax,0x3
  80310b:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803111:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803114:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  803118:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80311c:	48 89 c7             	mov    rdi,rax
  80311f:	ff d2                	call   rdx
  803121:	e9 ac 01 00 00       	jmp    8032d2 <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  803126:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803129:	48 63 d0             	movsxd rdx,eax
  80312c:	48 89 d0             	mov    rax,rdx
  80312f:	48 c1 e0 02          	shl    rax,0x2
  803133:	48 01 d0             	add    rax,rdx
  803136:	48 c1 e0 02          	shl    rax,0x2
  80313a:	48 01 d0             	add    rax,rdx
  80313d:	48 c1 e0 03          	shl    rax,0x3
  803141:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803147:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80314a:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  80314e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803152:	48 89 c7             	mov    rdi,rax
  803155:	ff d2                	call   rdx
  803157:	e9 76 01 00 00       	jmp    8032d2 <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  80315c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80315f:	48 63 d0             	movsxd rdx,eax
  803162:	48 89 d0             	mov    rax,rdx
  803165:	48 c1 e0 02          	shl    rax,0x2
  803169:	48 01 d0             	add    rax,rdx
  80316c:	48 c1 e0 02          	shl    rax,0x2
  803170:	48 01 d0             	add    rax,rdx
  803173:	48 c1 e0 03          	shl    rax,0x3
  803177:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80317d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803180:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  803184:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803188:	48 89 c7             	mov    rdi,rax
  80318b:	ff d2                	call   rdx
  80318d:	e9 40 01 00 00       	jmp    8032d2 <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  803192:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803195:	48 63 d0             	movsxd rdx,eax
  803198:	48 89 d0             	mov    rax,rdx
  80319b:	48 c1 e0 02          	shl    rax,0x2
  80319f:	48 01 d0             	add    rax,rdx
  8031a2:	48 c1 e0 02          	shl    rax,0x2
  8031a6:	48 01 d0             	add    rax,rdx
  8031a9:	48 c1 e0 03          	shl    rax,0x3
  8031ad:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031b3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031b6:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  8031ba:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031be:	48 89 c7             	mov    rdi,rax
  8031c1:	ff d2                	call   rdx
  8031c3:	e9 0a 01 00 00       	jmp    8032d2 <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  8031c8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031cb:	48 63 d0             	movsxd rdx,eax
  8031ce:	48 89 d0             	mov    rax,rdx
  8031d1:	48 c1 e0 02          	shl    rax,0x2
  8031d5:	48 01 d0             	add    rax,rdx
  8031d8:	48 c1 e0 02          	shl    rax,0x2
  8031dc:	48 01 d0             	add    rax,rdx
  8031df:	48 c1 e0 03          	shl    rax,0x3
  8031e3:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031e9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031ec:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  8031f0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031f4:	48 89 c7             	mov    rdi,rax
  8031f7:	ff d2                	call   rdx
  8031f9:	e9 d4 00 00 00       	jmp    8032d2 <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  8031fe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803201:	48 63 d0             	movsxd rdx,eax
  803204:	48 89 d0             	mov    rax,rdx
  803207:	48 c1 e0 02          	shl    rax,0x2
  80320b:	48 01 d0             	add    rax,rdx
  80320e:	48 c1 e0 02          	shl    rax,0x2
  803212:	48 01 d0             	add    rax,rdx
  803215:	48 c1 e0 03          	shl    rax,0x3
  803219:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80321f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803222:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  803226:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80322a:	48 89 c7             	mov    rdi,rax
  80322d:	ff d2                	call   rdx
  80322f:	e9 9e 00 00 00       	jmp    8032d2 <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  803234:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803237:	48 63 d0             	movsxd rdx,eax
  80323a:	48 89 d0             	mov    rax,rdx
  80323d:	48 c1 e0 02          	shl    rax,0x2
  803241:	48 01 d0             	add    rax,rdx
  803244:	48 c1 e0 02          	shl    rax,0x2
  803248:	48 01 d0             	add    rax,rdx
  80324b:	48 c1 e0 03          	shl    rax,0x3
  80324f:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803255:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803258:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  80325c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803260:	48 89 c7             	mov    rdi,rax
  803263:	ff d2                	call   rdx
  803265:	eb 6b                	jmp    8032d2 <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  803267:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80326a:	48 63 d0             	movsxd rdx,eax
  80326d:	48 89 d0             	mov    rax,rdx
  803270:	48 c1 e0 02          	shl    rax,0x2
  803274:	48 01 d0             	add    rax,rdx
  803277:	48 c1 e0 02          	shl    rax,0x2
  80327b:	48 01 d0             	add    rax,rdx
  80327e:	48 c1 e0 03          	shl    rax,0x3
  803282:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803288:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80328b:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  80328f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803293:	48 89 c7             	mov    rdi,rax
  803296:	ff d2                	call   rdx
  803298:	eb 38                	jmp    8032d2 <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  80329a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80329d:	48 63 d0             	movsxd rdx,eax
  8032a0:	48 89 d0             	mov    rax,rdx
  8032a3:	48 c1 e0 02          	shl    rax,0x2
  8032a7:	48 01 d0             	add    rax,rdx
  8032aa:	48 c1 e0 02          	shl    rax,0x2
  8032ae:	48 01 d0             	add    rax,rdx
  8032b1:	48 c1 e0 03          	shl    rax,0x3
  8032b5:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8032bb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8032be:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  8032c2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8032c6:	48 89 c7             	mov    rdi,rax
  8032c9:	ff d2                	call   rdx
  8032cb:	eb 05                	jmp    8032d2 <sys_operate_dev+0x33c>
    }
    return -1;
  8032cd:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8032d2:	c9                   	leave  
  8032d3:	c3                   	ret    

00000000008032d4 <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  8032d4:	f3 0f 1e fa          	endbr64 
  8032d8:	55                   	push   rbp
  8032d9:	48 89 e5             	mov    rbp,rsp
  8032dc:	48 83 ec 10          	sub    rsp,0x10
  8032e0:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8032e3:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8032e6:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  8032ea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032ed:	48 63 d0             	movsxd rdx,eax
  8032f0:	48 89 d0             	mov    rax,rdx
  8032f3:	48 c1 e0 02          	shl    rax,0x2
  8032f7:	48 01 d0             	add    rax,rdx
  8032fa:	48 c1 e0 05          	shl    rax,0x5
  8032fe:	48 05 80 58 40 00    	add    rax,0x405880
  803304:	8b 00                	mov    eax,DWORD PTR [rax]
  803306:	85 c0                	test   eax,eax
  803308:	75 0a                	jne    803314 <call_drv_func+0x40>
  80330a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80330f:	e9 15 02 00 00       	jmp    803529 <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  803314:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  803318:	0f 87 06 02 00 00    	ja     803524 <call_drv_func+0x250>
  80331e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803321:	48 8b 04 c5 68 1b 81 	mov    rax,QWORD PTR [rax*8+0x811b68]
  803328:	00 
  803329:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  80332c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80332f:	48 63 d0             	movsxd rdx,eax
  803332:	48 89 d0             	mov    rax,rdx
  803335:	48 c1 e0 02          	shl    rax,0x2
  803339:	48 01 d0             	add    rax,rdx
  80333c:	48 c1 e0 05          	shl    rax,0x5
  803340:	48 05 88 58 40 00    	add    rax,0x405888
  803346:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803349:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80334d:	48 89 c7             	mov    rdi,rax
  803350:	ff d2                	call   rdx
  803352:	e9 d2 01 00 00       	jmp    803529 <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  803357:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80335a:	48 63 d0             	movsxd rdx,eax
  80335d:	48 89 d0             	mov    rax,rdx
  803360:	48 c1 e0 02          	shl    rax,0x2
  803364:	48 01 d0             	add    rax,rdx
  803367:	48 c1 e0 05          	shl    rax,0x5
  80336b:	48 05 90 58 40 00    	add    rax,0x405890
  803371:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803374:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803378:	48 89 c7             	mov    rdi,rax
  80337b:	ff d2                	call   rdx
  80337d:	e9 a7 01 00 00       	jmp    803529 <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  803382:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803385:	48 63 d0             	movsxd rdx,eax
  803388:	48 89 d0             	mov    rax,rdx
  80338b:	48 c1 e0 02          	shl    rax,0x2
  80338f:	48 01 d0             	add    rax,rdx
  803392:	48 c1 e0 05          	shl    rax,0x5
  803396:	48 05 98 58 40 00    	add    rax,0x405898
  80339c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80339f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033a3:	48 89 c7             	mov    rdi,rax
  8033a6:	ff d2                	call   rdx
  8033a8:	e9 7c 01 00 00       	jmp    803529 <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  8033ad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033b0:	48 63 d0             	movsxd rdx,eax
  8033b3:	48 89 d0             	mov    rax,rdx
  8033b6:	48 c1 e0 02          	shl    rax,0x2
  8033ba:	48 01 d0             	add    rax,rdx
  8033bd:	48 c1 e0 05          	shl    rax,0x5
  8033c1:	48 05 a0 58 40 00    	add    rax,0x4058a0
  8033c7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033ca:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033ce:	48 89 c7             	mov    rdi,rax
  8033d1:	ff d2                	call   rdx
  8033d3:	e9 51 01 00 00       	jmp    803529 <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  8033d8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033db:	48 63 d0             	movsxd rdx,eax
  8033de:	48 89 d0             	mov    rax,rdx
  8033e1:	48 c1 e0 02          	shl    rax,0x2
  8033e5:	48 01 d0             	add    rax,rdx
  8033e8:	48 c1 e0 05          	shl    rax,0x5
  8033ec:	48 05 a8 58 40 00    	add    rax,0x4058a8
  8033f2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033f5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033f9:	48 89 c7             	mov    rdi,rax
  8033fc:	ff d2                	call   rdx
  8033fe:	e9 26 01 00 00       	jmp    803529 <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  803403:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803406:	48 63 d0             	movsxd rdx,eax
  803409:	48 89 d0             	mov    rax,rdx
  80340c:	48 c1 e0 02          	shl    rax,0x2
  803410:	48 01 d0             	add    rax,rdx
  803413:	48 c1 e0 05          	shl    rax,0x5
  803417:	48 05 b0 58 40 00    	add    rax,0x4058b0
  80341d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803420:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803424:	48 89 c7             	mov    rdi,rax
  803427:	ff d2                	call   rdx
  803429:	e9 fb 00 00 00       	jmp    803529 <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  80342e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803431:	48 63 d0             	movsxd rdx,eax
  803434:	48 89 d0             	mov    rax,rdx
  803437:	48 c1 e0 02          	shl    rax,0x2
  80343b:	48 01 d0             	add    rax,rdx
  80343e:	48 c1 e0 05          	shl    rax,0x5
  803442:	48 05 b8 58 40 00    	add    rax,0x4058b8
  803448:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80344b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80344f:	48 89 c7             	mov    rdi,rax
  803452:	ff d2                	call   rdx
  803454:	e9 d0 00 00 00       	jmp    803529 <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  803459:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80345c:	48 63 d0             	movsxd rdx,eax
  80345f:	48 89 d0             	mov    rax,rdx
  803462:	48 c1 e0 02          	shl    rax,0x2
  803466:	48 01 d0             	add    rax,rdx
  803469:	48 c1 e0 05          	shl    rax,0x5
  80346d:	48 05 c0 58 40 00    	add    rax,0x4058c0
  803473:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803476:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80347a:	48 89 c7             	mov    rdi,rax
  80347d:	ff d2                	call   rdx
  80347f:	e9 a5 00 00 00       	jmp    803529 <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  803484:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803487:	48 63 d0             	movsxd rdx,eax
  80348a:	48 89 d0             	mov    rax,rdx
  80348d:	48 c1 e0 02          	shl    rax,0x2
  803491:	48 01 d0             	add    rax,rdx
  803494:	48 c1 e0 05          	shl    rax,0x5
  803498:	48 05 c8 58 40 00    	add    rax,0x4058c8
  80349e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8034a1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034a5:	48 89 c7             	mov    rdi,rax
  8034a8:	ff d2                	call   rdx
  8034aa:	eb 7d                	jmp    803529 <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  8034ac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034af:	48 63 d0             	movsxd rdx,eax
  8034b2:	48 89 d0             	mov    rax,rdx
  8034b5:	48 c1 e0 02          	shl    rax,0x2
  8034b9:	48 01 d0             	add    rax,rdx
  8034bc:	48 c1 e0 05          	shl    rax,0x5
  8034c0:	48 05 d0 58 40 00    	add    rax,0x4058d0
  8034c6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8034c9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034cd:	48 89 c7             	mov    rdi,rax
  8034d0:	ff d2                	call   rdx
  8034d2:	eb 55                	jmp    803529 <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  8034d4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034d7:	48 63 d0             	movsxd rdx,eax
  8034da:	48 89 d0             	mov    rax,rdx
  8034dd:	48 c1 e0 02          	shl    rax,0x2
  8034e1:	48 01 d0             	add    rax,rdx
  8034e4:	48 c1 e0 05          	shl    rax,0x5
  8034e8:	48 05 d8 58 40 00    	add    rax,0x4058d8
  8034ee:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8034f1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034f5:	48 89 c7             	mov    rdi,rax
  8034f8:	ff d2                	call   rdx
  8034fa:	eb 2d                	jmp    803529 <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  8034fc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034ff:	48 63 d0             	movsxd rdx,eax
  803502:	48 89 d0             	mov    rax,rdx
  803505:	48 c1 e0 02          	shl    rax,0x2
  803509:	48 01 d0             	add    rax,rdx
  80350c:	48 c1 e0 05          	shl    rax,0x5
  803510:	48 05 e0 58 40 00    	add    rax,0x4058e0
  803516:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803519:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80351d:	48 89 c7             	mov    rdi,rax
  803520:	ff d2                	call   rdx
  803522:	eb 05                	jmp    803529 <call_drv_func+0x255>
    }
    return -1;
  803524:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803529:	c9                   	leave  
  80352a:	c3                   	ret    

000000000080352b <dispose_device>:
int dispose_device(int dev){
  80352b:	f3 0f 1e fa          	endbr64 
  80352f:	55                   	push   rbp
  803530:	48 89 e5             	mov    rbp,rsp
  803533:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  803536:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803539:	48 63 d0             	movsxd rdx,eax
  80353c:	48 89 d0             	mov    rax,rdx
  80353f:	48 c1 e0 02          	shl    rax,0x2
  803543:	48 01 d0             	add    rax,rdx
  803546:	48 c1 e0 02          	shl    rax,0x2
  80354a:	48 01 d0             	add    rax,rdx
  80354d:	48 c1 e0 03          	shl    rax,0x3
  803551:	48 05 90 2e 40 00    	add    rax,0x402e90
  803557:	8b 00                	mov    eax,DWORD PTR [rax]
  803559:	83 f8 01             	cmp    eax,0x1
  80355c:	74 07                	je     803565 <dispose_device+0x3a>
  80355e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803563:	eb 62                	jmp    8035c7 <dispose_device+0x9c>
    device* p=&devs[dev];
  803565:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803568:	48 63 d0             	movsxd rdx,eax
  80356b:	48 89 d0             	mov    rax,rdx
  80356e:	48 c1 e0 02          	shl    rax,0x2
  803572:	48 01 d0             	add    rax,rdx
  803575:	48 c1 e0 02          	shl    rax,0x2
  803579:	48 01 d0             	add    rax,rdx
  80357c:	48 c1 e0 03          	shl    rax,0x3
  803580:	48 05 80 2e 40 00    	add    rax,0x402e80
  803586:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  80358a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80358e:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803595:	48 85 c0             	test   rax,rax
  803598:	74 1d                	je     8035b7 <dispose_device+0x8c>
  80359a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80359e:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  8035a5:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8035a9:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  8035b0:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  8035b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8035bb:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  8035c2:	b8 00 00 00 00       	mov    eax,0x0
}
  8035c7:	5d                   	pop    rbp
  8035c8:	c3                   	ret    

00000000008035c9 <dispose_driver>:
int dispose_driver(driver *drv){
  8035c9:	f3 0f 1e fa          	endbr64 
  8035cd:	55                   	push   rbp
  8035ce:	48 89 e5             	mov    rbp,rsp
  8035d1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  8035d5:	90                   	nop
  8035d6:	5d                   	pop    rbp
  8035d7:	c3                   	ret    

00000000008035d8 <get_dev>:

device *get_dev(int devi)
{
  8035d8:	f3 0f 1e fa          	endbr64 
  8035dc:	55                   	push   rbp
  8035dd:	48 89 e5             	mov    rbp,rsp
  8035e0:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  8035e3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8035e6:	48 63 d0             	movsxd rdx,eax
  8035e9:	48 89 d0             	mov    rax,rdx
  8035ec:	48 c1 e0 02          	shl    rax,0x2
  8035f0:	48 01 d0             	add    rax,rdx
  8035f3:	48 c1 e0 02          	shl    rax,0x2
  8035f7:	48 01 d0             	add    rax,rdx
  8035fa:	48 c1 e0 03          	shl    rax,0x3
  8035fe:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  803604:	5d                   	pop    rbp
  803605:	c3                   	ret    

0000000000803606 <get_drv>:
driver *get_drv(int drvi)
{
  803606:	f3 0f 1e fa          	endbr64 
  80360a:	55                   	push   rbp
  80360b:	48 89 e5             	mov    rbp,rsp
  80360e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  803611:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803614:	48 63 d0             	movsxd rdx,eax
  803617:	48 89 d0             	mov    rax,rdx
  80361a:	48 c1 e0 02          	shl    rax,0x2
  80361e:	48 01 d0             	add    rax,rdx
  803621:	48 c1 e0 05          	shl    rax,0x5
  803625:	48 05 80 58 40 00    	add    rax,0x405880
}
  80362b:	5d                   	pop    rbp
  80362c:	c3                   	ret    

000000000080362d <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  80362d:	f3 0f 1e fa          	endbr64 
  803631:	55                   	push   rbp
  803632:	48 89 e5             	mov    rbp,rsp
  803635:	53                   	push   rbx
  803636:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  80363a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  803641:	eb 23                	jmp    803666 <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803643:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803646:	48 63 d0             	movsxd rdx,eax
  803649:	48 89 d0             	mov    rax,rdx
  80364c:	48 01 c0             	add    rax,rax
  80364f:	48 01 d0             	add    rax,rdx
  803652:	48 c1 e0 06          	shl    rax,0x6
  803656:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  80365c:	8b 00                	mov    eax,DWORD PTR [rax]
  80365e:	85 c0                	test   eax,eax
  803660:	74 0c                	je     80366e <make_request+0x41>
    for(;i<NR_REQS;i++)
  803662:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  803666:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  80366a:	7e d7                	jle    803643 <make_request+0x16>
  80366c:	eb 01                	jmp    80366f <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  80366e:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  80366f:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  803673:	75 0a                	jne    80367f <make_request+0x52>
  803675:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80367a:	e9 e7 01 00 00       	jmp    803866 <make_request+0x239>
    reqs[i]=*args;//放入数组
  80367f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803682:	48 63 d0             	movsxd rdx,eax
  803685:	48 89 d0             	mov    rax,rdx
  803688:	48 01 c0             	add    rax,rax
  80368b:	48 01 d0             	add    rax,rdx
  80368e:	48 c1 e0 06          	shl    rax,0x6
  803692:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803699:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80369d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8036a0:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  8036a4:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  8036a7:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8036ab:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8036af:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8036b3:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  8036b7:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  8036bb:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  8036bf:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  8036c3:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  8036c7:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  8036cb:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  8036cf:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  8036d3:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  8036d7:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  8036db:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  8036df:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  8036e3:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  8036e7:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  8036eb:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  8036ef:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  8036f3:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  8036f7:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  8036fb:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  8036ff:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  803703:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  803707:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  80370b:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  80370f:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  803713:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  803717:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  80371b:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803722:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  803729:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  803730:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  803737:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  80373e:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  803745:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  80374c:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  803753:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  80375a:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  803761:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  803768:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  80376f:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  803776:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  80377d:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  803784:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  80378b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80378f:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  803795:	48 63 d0             	movsxd rdx,eax
  803798:	48 89 d0             	mov    rax,rdx
  80379b:	48 c1 e0 02          	shl    rax,0x2
  80379f:	48 01 d0             	add    rax,rdx
  8037a2:	48 c1 e0 02          	shl    rax,0x2
  8037a6:	48 01 d0             	add    rax,rdx
  8037a9:	48 c1 e0 03          	shl    rax,0x3
  8037ad:	48 05 80 2e 40 00    	add    rax,0x402e80
  8037b3:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  8037b7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8037bb:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8037c2:	48 85 c0             	test   rax,rax
  8037c5:	75 27                	jne    8037ee <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  8037c7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8037ca:	48 63 d0             	movsxd rdx,eax
  8037cd:	48 89 d0             	mov    rax,rdx
  8037d0:	48 01 c0             	add    rax,rax
  8037d3:	48 01 d0             	add    rax,rdx
  8037d6:	48 c1 e0 06          	shl    rax,0x6
  8037da:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8037e1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8037e5:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  8037ec:	eb 75                	jmp    803863 <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  8037ee:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8037f2:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8037f9:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  8037fd:	eb 0f                	jmp    80380e <make_request+0x1e1>
  8037ff:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803803:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  80380a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80380e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803812:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803819:	48 85 c0             	test   rax,rax
  80381c:	75 e1                	jne    8037ff <make_request+0x1d2>
        p->next=&reqs[i];
  80381e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803821:	48 63 d0             	movsxd rdx,eax
  803824:	48 89 d0             	mov    rax,rdx
  803827:	48 01 c0             	add    rax,rax
  80382a:	48 01 d0             	add    rax,rdx
  80382d:	48 c1 e0 06          	shl    rax,0x6
  803831:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803838:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80383c:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  803843:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803846:	48 63 d0             	movsxd rdx,eax
  803849:	48 89 d0             	mov    rax,rdx
  80384c:	48 01 c0             	add    rax,rax
  80384f:	48 01 d0             	add    rax,rdx
  803852:	48 c1 e0 06          	shl    rax,0x6
  803856:	48 05 38 6d 40 00    	add    rax,0x406d38
  80385c:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  803863:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803866:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80386a:	c9                   	leave  
  80386b:	c3                   	ret    

000000000080386c <do_req>:
//取出一个申请并且执行
int do_req()
{
  80386c:	f3 0f 1e fa          	endbr64 
  803870:	55                   	push   rbp
  803871:	48 89 e5             	mov    rbp,rsp
  803874:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  803878:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80387f:	e9 ab 00 00 00       	jmp    80392f <do_req+0xc3>
    {
        device* p=dev_tree[i];
  803884:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803887:	48 98                	cdqe   
  803889:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  803890:	00 
  803891:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  803895:	e9 86 00 00 00       	jmp    803920 <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  80389a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80389e:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  8038a5:	48 85 c0             	test   rax,rax
  8038a8:	75 67                	jne    803911 <do_req+0xa5>
  8038aa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038ae:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8038b5:	48 85 c0             	test   rax,rax
  8038b8:	74 57                	je     803911 <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  8038ba:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038be:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  8038c5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038c9:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  8038d0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038d4:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8038db:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  8038e2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038e6:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  8038ed:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038f1:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  8038f7:	48 98                	cdqe   
  8038f9:	48 8b 14 c5 80 a0 80 	mov    rdx,QWORD PTR [rax*8+0x80a080]
  803900:	00 
  803901:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803905:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  80390c:	48 89 c7             	mov    rdi,rax
  80390f:	ff d2                	call   rdx
        for(;p;p=p->next)
  803911:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803915:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  80391c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  803920:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  803925:	0f 85 6f ff ff ff    	jne    80389a <do_req+0x2e>
    for(int i=0;i<3;i++)
  80392b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80392f:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  803933:	0f 8e 4b ff ff ff    	jle    803884 <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  803939:	b8 00 00 00 00       	mov    eax,0x0
}
  80393e:	c9                   	leave  
  80393f:	c3                   	ret    

0000000000803940 <wait_on_req>:


void wait_on_req(int reqi)
{
  803940:	f3 0f 1e fa          	endbr64 
  803944:	55                   	push   rbp
  803945:	48 89 e5             	mov    rbp,rsp
  803948:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  80394b:	90                   	nop
  80394c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80394f:	48 63 d0             	movsxd rdx,eax
  803952:	48 89 d0             	mov    rax,rdx
  803955:	48 01 c0             	add    rax,rax
  803958:	48 01 d0             	add    rax,rdx
  80395b:	48 c1 e0 06          	shl    rax,0x6
  80395f:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803965:	8b 00                	mov    eax,DWORD PTR [rax]
  803967:	83 f8 03             	cmp    eax,0x3
  80396a:	75 e0                	jne    80394c <wait_on_req+0xc>
}
  80396c:	90                   	nop
  80396d:	90                   	nop
  80396e:	5d                   	pop    rbp
  80396f:	c3                   	ret    

0000000000803970 <clear_req>:
void clear_req(int reqi)
{
  803970:	f3 0f 1e fa          	endbr64 
  803974:	55                   	push   rbp
  803975:	48 89 e5             	mov    rbp,rsp
  803978:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  80397b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80397e:	48 63 d0             	movsxd rdx,eax
  803981:	48 89 d0             	mov    rax,rdx
  803984:	48 01 c0             	add    rax,rax
  803987:	48 01 d0             	add    rax,rdx
  80398a:	48 c1 e0 06          	shl    rax,0x6
  80398e:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803994:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  80399a:	90                   	nop
  80399b:	5d                   	pop    rbp
  80399c:	c3                   	ret    

000000000080399d <init_proc>:
struct process task[MAX_PROC_COUNT];
TSS scene_saver;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  80399d:	f3 0f 1e fa          	endbr64 
  8039a1:	55                   	push   rbp
  8039a2:	48 89 e5             	mov    rbp,rsp
  8039a5:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  8039a9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8039b0:	eb 4c                	jmp    8039fe <init_proc+0x61>
        task[i].pid=-1;
  8039b2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039b5:	48 98                	cdqe   
  8039b7:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8039be:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8039c4:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  8039ca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039cd:	48 98                	cdqe   
  8039cf:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8039d6:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8039dc:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  8039e2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039e5:	48 98                	cdqe   
  8039e7:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8039ee:	48 05 00 85 40 00    	add    rax,0x408500
  8039f4:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  8039fa:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8039fe:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803a02:	7e ae                	jle    8039b2 <init_proc+0x15>
    }
    cur_proc=0;//no proc
  803a04:	c7 05 62 e6 c0 ff 00 	mov    DWORD PTR [rip+0xffffffffffc0e662],0x0        # 412070 <cur_proc>
  803a0b:	00 00 00 
    pidd=1;
  803a0e:	c7 05 5c e6 c0 ff 01 	mov    DWORD PTR [rip+0xffffffffffc0e65c],0x1        # 412074 <pidd>
  803a15:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  803a18:	b8 00 00 00 00       	mov    eax,0x0
  803a1d:	e8 38 00 00 00       	call   803a5a <create_proc>
  803a22:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  803a25:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803a28:	48 98                	cdqe   
  803a2a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803a31:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803a37:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  803a3d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803a40:	83 c0 03             	add    eax,0x3
  803a43:	c1 e0 04             	shl    eax,0x4
  803a46:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  803a49:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803a4c:	01 c0                	add    eax,eax
  803a4e:	83 c0 05             	add    eax,0x5
  803a51:	c1 e0 03             	shl    eax,0x3
  803a54:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
}
  803a57:	90                   	nop
  803a58:	c9                   	leave  
  803a59:	c3                   	ret    

0000000000803a5a <create_proc>:

int create_proc()
{
  803a5a:	f3 0f 1e fa          	endbr64 
  803a5e:	55                   	push   rbp
  803a5f:	48 89 e5             	mov    rbp,rsp
  803a62:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  803a66:	b8 00 00 00 00       	mov    eax,0x0
  803a6b:	e8 7d 00 00 00       	call   803aed <req_proc>
  803a70:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  803a73:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  803a77:	75 07                	jne    803a80 <create_proc+0x26>
  803a79:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803a7e:	eb 6b                	jmp    803aeb <create_proc+0x91>
    int curesp=0x9fc00-1;
  803a80:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%esp,%0":"=m"(curesp));
  803a87:	89 65 f8             	mov    DWORD PTR [rbp-0x8],esp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0,0,0,0,0x17,0xf,0x17,0x17,0x17,0x17,curesp,0,0,0,0,index);
  803a8a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803a8d:	48 98                	cdqe   
  803a8f:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  803a92:	52                   	push   rdx
  803a93:	6a 00                	push   0x0
  803a95:	6a 00                	push   0x0
  803a97:	6a 00                	push   0x0
  803a99:	6a 00                	push   0x0
  803a9b:	50                   	push   rax
  803a9c:	6a 17                	push   0x17
  803a9e:	6a 17                	push   0x17
  803aa0:	6a 17                	push   0x17
  803aa2:	6a 17                	push   0x17
  803aa4:	41 b9 0f 00 00 00    	mov    r9d,0xf
  803aaa:	41 b8 17 00 00 00    	mov    r8d,0x17
  803ab0:	b9 00 00 00 00       	mov    ecx,0x0
  803ab5:	ba 00 00 00 00       	mov    edx,0x0
  803aba:	be 00 00 00 00       	mov    esi,0x0
  803abf:	bf 00 00 00 00       	mov    edi,0x0
  803ac4:	e8 f0 00 00 00       	call   803bb9 <set_proc>
  803ac9:	48 83 c4 50          	add    rsp,0x50
    task[index].tss.eip=(long)proc_zero;
  803acd:	ba 3d 3e 80 00       	mov    edx,0x803e3d
  803ad2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ad5:	48 98                	cdqe   
  803ad7:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803ade:	48 05 70 86 40 00    	add    rax,0x408670
  803ae4:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx

    return index;
  803ae8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803aeb:	c9                   	leave  
  803aec:	c3                   	ret    

0000000000803aed <req_proc>:
int req_proc(){
  803aed:	f3 0f 1e fa          	endbr64 
  803af1:	55                   	push   rbp
  803af2:	48 89 e5             	mov    rbp,rsp
    int num=0;
  803af5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803afc:	eb 04                	jmp    803b02 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  803afe:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803b02:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b05:	48 98                	cdqe   
  803b07:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803b0e:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803b14:	8b 00                	mov    eax,DWORD PTR [rax]
  803b16:	83 f8 ff             	cmp    eax,0xffffffff
  803b19:	74 1f                	je     803b3a <req_proc+0x4d>
  803b1b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b1e:	48 98                	cdqe   
  803b20:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803b27:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803b2d:	8b 00                	mov    eax,DWORD PTR [rax]
  803b2f:	83 f8 03             	cmp    eax,0x3
  803b32:	74 06                	je     803b3a <req_proc+0x4d>
  803b34:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803b38:	7e c4                	jle    803afe <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  803b3a:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803b3e:	7e 07                	jle    803b47 <req_proc+0x5a>
        return -1;
  803b40:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803b45:	eb 70                	jmp    803bb7 <req_proc+0xca>
    task[num].pid=pidd++;
  803b47:	8b 05 27 e5 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e527]        # 412074 <pidd>
  803b4d:	8d 50 01             	lea    edx,[rax+0x1]
  803b50:	89 15 1e e5 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e51e],edx        # 412074 <pidd>
  803b56:	89 c2                	mov    edx,eax
  803b58:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b5b:	48 98                	cdqe   
  803b5d:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803b64:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803b6a:	89 10                	mov    DWORD PTR [rax],edx
    task[num].stat=ENDED;
  803b6c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b6f:	48 98                	cdqe   
  803b71:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803b78:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803b7e:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  803b84:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b87:	48 98                	cdqe   
  803b89:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803b90:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803b96:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803b9c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b9f:	48 98                	cdqe   
  803ba1:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803ba8:	48 05 ac 84 40 00    	add    rax,0x4084ac
  803bae:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  803bb4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803bb7:	5d                   	pop    rbp
  803bb8:	c3                   	ret    

0000000000803bb9 <set_proc>:
void set_proc(long eax,long ebx,long ecx,long edx,long es,long cs,long ss,long ds,long fs,long gs\
,long esp,long ebp,long esi,long edi,long eflags,int proc_nr){
  803bb9:	f3 0f 1e fa          	endbr64 
  803bbd:	55                   	push   rbp
  803bbe:	48 89 e5             	mov    rbp,rsp
  803bc1:	48 83 ec 40          	sub    rsp,0x40
  803bc5:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803bc9:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803bcd:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803bd1:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803bd5:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  803bd9:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803bdd:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803be0:	48 98                	cdqe   
  803be2:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803be9:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803bef:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->tss.eax=eax;
  803bf3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bf7:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803bfb:	48 89 90 ec 01 00 00 	mov    QWORD PTR [rax+0x1ec],rdx
    proc->tss.ebx=ebx;
  803c02:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c06:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  803c0a:	48 89 90 04 02 00 00 	mov    QWORD PTR [rax+0x204],rdx
    proc->tss.ecx=ecx;
  803c11:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c15:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803c19:	48 89 90 f4 01 00 00 	mov    QWORD PTR [rax+0x1f4],rdx
    proc->tss.edx=edx;
  803c20:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c24:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  803c28:	48 89 90 fc 01 00 00 	mov    QWORD PTR [rax+0x1fc],rdx
    proc->tss.es=es;
  803c2f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c33:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803c37:	48 89 90 2c 02 00 00 	mov    QWORD PTR [rax+0x22c],rdx
    proc->tss.cs=cs;
  803c3e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c42:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803c46:	48 89 90 34 02 00 00 	mov    QWORD PTR [rax+0x234],rdx
    proc->tss.ss=ss;
  803c4d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c51:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803c55:	48 89 90 3c 02 00 00 	mov    QWORD PTR [rax+0x23c],rdx
    proc->tss.ss0=ss;
  803c5c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c60:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803c64:	48 89 90 ac 01 00 00 	mov    QWORD PTR [rax+0x1ac],rdx
    proc->tss.ss1=ss;
  803c6b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c6f:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803c73:	48 89 90 bc 01 00 00 	mov    QWORD PTR [rax+0x1bc],rdx
    proc->tss.ss2=ss;
  803c7a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c7e:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803c82:	48 89 90 cc 01 00 00 	mov    QWORD PTR [rax+0x1cc],rdx
    proc->tss.ds=ds;
  803c89:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c8d:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803c91:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    proc->tss.fs=fs;
  803c98:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c9c:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803ca0:	48 89 90 4c 02 00 00 	mov    QWORD PTR [rax+0x24c],rdx
    proc->tss.gs=gs;
  803ca7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803cab:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803caf:	48 89 90 54 02 00 00 	mov    QWORD PTR [rax+0x254],rdx
    proc->tss.esp=esp;
  803cb6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803cba:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803cbe:	48 89 90 0c 02 00 00 	mov    QWORD PTR [rax+0x20c],rdx
    proc->tss.esp0=esp;
  803cc5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803cc9:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803ccd:	48 89 90 a4 01 00 00 	mov    QWORD PTR [rax+0x1a4],rdx
    proc->tss.esp1=esp;
  803cd4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803cd8:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803cdc:	48 89 90 b4 01 00 00 	mov    QWORD PTR [rax+0x1b4],rdx
    proc->tss.esp2=esp;
  803ce3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ce7:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803ceb:	48 89 90 c4 01 00 00 	mov    QWORD PTR [rax+0x1c4],rdx
    proc->tss.ebp=ebp;
  803cf2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803cf6:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803cfa:	48 89 90 14 02 00 00 	mov    QWORD PTR [rax+0x214],rdx
    proc->tss.esi=esi;
  803d01:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d05:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803d09:	48 89 90 1c 02 00 00 	mov    QWORD PTR [rax+0x21c],rdx
    proc->tss.edi=edi;
  803d10:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d14:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803d18:	48 89 90 24 02 00 00 	mov    QWORD PTR [rax+0x224],rdx
    proc->tss.eflags=0x202;//设置为默认值:0b 0010 0000 0010
  803d1f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d23:	48 c7 80 e4 01 00 00 	mov    QWORD PTR [rax+0x1e4],0x202
  803d2a:	02 02 00 00 
    //能接受中断
    proc->tss.eip=(long)proc_zero;
  803d2e:	ba 3d 3e 80 00       	mov    edx,0x803e3d
  803d33:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d37:	48 89 90 dc 01 00 00 	mov    QWORD PTR [rax+0x1dc],rdx

    proc->tss.cs=cs;
  803d3e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d42:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803d46:	48 89 90 34 02 00 00 	mov    QWORD PTR [rax+0x234],rdx
    proc->tss.ds=ds;
  803d4d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d51:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803d55:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    proc->tss.es=es;
  803d5c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d60:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803d64:	48 89 90 2c 02 00 00 	mov    QWORD PTR [rax+0x22c],rdx
    proc->tss.cr3=PAGE_INDEX_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803d6b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d6f:	48 c7 80 d4 01 00 00 	mov    QWORD PTR [rax+0x1d4],0x1000
  803d76:	00 10 00 00 

    proc->tss.ldt= _LDT_IND(proc_nr)*8;
  803d7a:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803d7d:	83 c0 03             	add    eax,0x3
  803d80:	c1 e0 04             	shl    eax,0x4
  803d83:	48 63 d0             	movsxd rdx,eax
  803d86:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d8a:	48 89 90 5c 02 00 00 	mov    QWORD PTR [rax+0x25c],rdx
    //在gdt中添加tss
    fill_desc(&proc->tss,0xffff,SEG_SYS_TSS|SEG_PRESENT,_TSS_IND(proc_nr));
  803d91:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803d94:	01 c0                	add    eax,eax
  803d96:	83 c0 05             	add    eax,0x5
  803d99:	89 c2                	mov    edx,eax
  803d9b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803d9f:	48 05 9c 01 00 00    	add    rax,0x19c
  803da5:	89 d1                	mov    ecx,edx
  803da7:	ba 89 00 00 00       	mov    edx,0x89
  803dac:	be ff ff 00 00       	mov    esi,0xffff
  803db1:	89 c7                	mov    edi,eax
  803db3:	e8 da 0d 00 00       	call   804b92 <fill_desc>
    //添加ldt
    fill_desc(proc->ldt, sizeof(proc->ldt),SEG_SYS_LDT|SEG_PRESENT, _LDT_IND(proc_nr));
  803db8:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803dbb:	83 c0 03             	add    eax,0x3
  803dbe:	01 c0                	add    eax,eax
  803dc0:	89 c2                	mov    edx,eax
  803dc2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803dc6:	48 83 c0 34          	add    rax,0x34
  803dca:	89 d1                	mov    ecx,edx
  803dcc:	ba 82 00 00 00       	mov    edx,0x82
  803dd1:	be 28 00 00 00       	mov    esi,0x28
  803dd6:	89 c7                	mov    edi,eax
  803dd8:	e8 b5 0d 00 00       	call   804b92 <fill_desc>
    //设置ldt
    fill_ldt_desc(0,0xffffffff,\
  803ddd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803de1:	48 83 c0 34          	add    rax,0x34
  803de5:	48 89 c1             	mov    rcx,rax
  803de8:	ba fe cf 00 00       	mov    edx,0xcffe
  803ded:	be ff ff ff ff       	mov    esi,0xffffffff
  803df2:	bf 00 00 00 00       	mov    edi,0x0
  803df7:	e8 bd 0e 00 00       	call   804cb9 <fill_ldt_desc>
    SEG_CONFORMING_RW_CODE|SEG_DPL_3,&proc->ldt[0]);
    fill_ldt_desc(0,0xffffffff,\
  803dfc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e00:	48 83 c0 3c          	add    rax,0x3c
  803e04:	48 89 c1             	mov    rcx,rax
  803e07:	ba f2 cf 00 00       	mov    edx,0xcff2
  803e0c:	be ff ff ff ff       	mov    esi,0xffffffff
  803e11:	bf 00 00 00 00       	mov    edi,0x0
  803e16:	e8 9e 0e 00 00       	call   804cb9 <fill_ldt_desc>
    SEG_RW_DATA|SEG_DPL_3,&proc->ldt[1]);
    fill_ldt_desc(0x1c00000-0x1000,0x1000,\
  803e1b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e1f:	48 83 c0 44          	add    rax,0x44
  803e23:	48 89 c1             	mov    rcx,rax
  803e26:	ba f6 00 00 00       	mov    edx,0xf6
  803e2b:	be 00 10 00 00       	mov    esi,0x1000
  803e30:	bf 00 f0 bf 01       	mov    edi,0x1bff000
  803e35:	e8 7f 0e 00 00       	call   804cb9 <fill_ldt_desc>
    SEG_STACK|SEG_DPL_3,&proc->ldt[2]);

}
  803e3a:	90                   	nop
  803e3b:	c9                   	leave  
  803e3c:	c3                   	ret    

0000000000803e3d <proc_zero>:
void proc_zero()
{
  803e3d:	f3 0f 1e fa          	endbr64 
  803e41:	55                   	push   rbp
  803e42:	48 89 e5             	mov    rbp,rsp

    while(1);
  803e45:	eb fe                	jmp    803e45 <proc_zero+0x8>

0000000000803e47 <manage_proc>:
}
void manage_proc(){
  803e47:	f3 0f 1e fa          	endbr64 
  803e4b:	55                   	push   rbp
  803e4c:	48 89 e5             	mov    rbp,rsp
  803e4f:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803e53:	8b 05 17 e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e217]        # 412070 <cur_proc>
  803e59:	83 f8 ff             	cmp    eax,0xffffffff
  803e5c:	74 2d                	je     803e8b <manage_proc+0x44>
        task[cur_proc].utime++;
  803e5e:	8b 05 0c e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e20c]        # 412070 <cur_proc>
  803e64:	48 63 d0             	movsxd rdx,eax
  803e67:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  803e6e:	48 81 c2 a8 84 40 00 	add    rdx,0x4084a8
  803e75:	8b 12                	mov    edx,DWORD PTR [rdx]
  803e77:	83 c2 01             	add    edx,0x1
  803e7a:	48 98                	cdqe   
  803e7c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803e83:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803e89:	89 10                	mov    DWORD PTR [rax],edx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803e8b:	8b 05 df e1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e1df]        # 412070 <cur_proc>
  803e91:	83 f8 ff             	cmp    eax,0xffffffff
  803e94:	74 3c                	je     803ed2 <manage_proc+0x8b>
  803e96:	8b 05 d4 e1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e1d4]        # 412070 <cur_proc>
  803e9c:	48 98                	cdqe   
  803e9e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803ea5:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803eab:	8b 00                	mov    eax,DWORD PTR [rax]
  803ead:	83 f8 01             	cmp    eax,0x1
  803eb0:	77 20                	ja     803ed2 <manage_proc+0x8b>
    task[cur_proc].stat!=READY){
  803eb2:	8b 05 b8 e1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e1b8]        # 412070 <cur_proc>
  803eb8:	48 98                	cdqe   
  803eba:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803ec1:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803ec7:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803ec9:	83 f8 01             	cmp    eax,0x1
  803ecc:	0f 84 90 00 00 00    	je     803f62 <manage_proc+0x11b>
        if(cur_proc!=-1)
  803ed2:	8b 05 98 e1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e198]        # 412070 <cur_proc>
  803ed8:	83 f8 ff             	cmp    eax,0xffffffff
  803edb:	74 1b                	je     803ef8 <manage_proc+0xb1>
            task[cur_proc].utime=0;
  803edd:	8b 05 8d e1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e18d]        # 412070 <cur_proc>
  803ee3:	48 98                	cdqe   
  803ee5:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803eec:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803ef2:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=0;
  803ef8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  803eff:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803f06:	eb 41                	jmp    803f49 <manage_proc+0x102>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803f08:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803f0b:	48 98                	cdqe   
  803f0d:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803f14:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803f1a:	8b 00                	mov    eax,DWORD PTR [rax]
  803f1c:	83 f8 ff             	cmp    eax,0xffffffff
  803f1f:	74 24                	je     803f45 <manage_proc+0xfe>
  803f21:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803f24:	48 98                	cdqe   
  803f26:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803f2d:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803f33:	8b 00                	mov    eax,DWORD PTR [rax]
  803f35:	83 f8 01             	cmp    eax,0x1
  803f38:	75 0b                	jne    803f45 <manage_proc+0xfe>
  803f3a:	8b 05 30 e1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e130]        # 412070 <cur_proc>
  803f40:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  803f43:	75 0c                	jne    803f51 <manage_proc+0x10a>
        for(i=0;i<MAX_PROC_COUNT;i++){
  803f45:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803f49:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803f4d:	7e b9                	jle    803f08 <manage_proc+0xc1>
  803f4f:	eb 01                	jmp    803f52 <manage_proc+0x10b>
                break;
  803f51:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  803f52:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803f56:	7f 0d                	jg     803f65 <manage_proc+0x11e>
            return;
        //switch
        switch_proc_tss(i);
  803f58:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803f5b:	89 c7                	mov    edi,eax
  803f5d:	e8 06 00 00 00       	call   803f68 <switch_proc_tss>
    }
    return;
  803f62:	90                   	nop
  803f63:	eb 01                	jmp    803f66 <manage_proc+0x11f>
            return;
  803f65:	90                   	nop
}
  803f66:	c9                   	leave  
  803f67:	c3                   	ret    

0000000000803f68 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  803f68:	f3 0f 1e fa          	endbr64 
  803f6c:	55                   	push   rbp
  803f6d:	48 89 e5             	mov    rbp,rsp
  803f70:	48 83 ec 20          	sub    rsp,0x20
  803f74:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  803f77:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803f7a:	01 c0                	add    eax,eax
  803f7c:	83 c0 05             	add    eax,0x5
  803f7f:	c1 e0 03             	shl    eax,0x3
  803f82:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  803f85:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803f88:	89 05 e2 e0 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e0e2],eax        # 412070 <cur_proc>
    switch_proc_asm(sel);
  803f8e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803f91:	89 c7                	mov    edi,eax
  803f93:	e8 b2 5f 00 00       	call   809f4a <switch_proc_asm>
}
  803f98:	90                   	nop
  803f99:	c9                   	leave  
  803f9a:	c3                   	ret    

0000000000803f9b <switch_proc>:
void switch_proc(int pnr){
  803f9b:	f3 0f 1e fa          	endbr64 
  803f9f:	55                   	push   rbp
  803fa0:	48 89 e5             	mov    rbp,rsp
  803fa3:	48 81 ec 80 02 00 00 	sub    rsp,0x280
  803faa:	89 bd 8c fd ff ff    	mov    DWORD PTR [rbp-0x274],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  803fb0:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803fb6:	48 98                	cdqe   
  803fb8:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803fbf:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803fc6:	48 8d 85 90 fd ff ff 	lea    rax,[rbp-0x270]
  803fcd:	b9 4d 00 00 00       	mov    ecx,0x4d
  803fd2:	48 89 c7             	mov    rdi,rax
  803fd5:	48 89 d6             	mov    rsi,rdx
  803fd8:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
  803fdb:	48 89 f2             	mov    rdx,rsi
  803fde:	48 89 f8             	mov    rax,rdi
  803fe1:	8b 0a                	mov    ecx,DWORD PTR [rdx]
  803fe3:	89 08                	mov    DWORD PTR [rax],ecx
    save_context(&task[cur_proc].tss);
  803fe5:	8b 05 85 e0 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e085]        # 412070 <cur_proc>
  803feb:	48 98                	cdqe   
  803fed:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803ff4:	48 05 90 01 00 00    	add    rax,0x190
  803ffa:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804000:	48 83 c0 0c          	add    rax,0xc
  804004:	48 89 c7             	mov    rdi,rax
  804007:	e8 69 00 00 00       	call   804075 <save_context>
    //重新设置0号进程
    task[0].tss.eip=proc_zero;
  80400c:	b8 3d 3e 80 00       	mov    eax,0x803e3d
  804011:	48 89 05 64 46 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc04664],rax        # 40867c <task+0x1dc>
    task[0].tss.cr3=PAGE_INDEX_ADDR;
  804018:	48 c7 05 51 46 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc04651],0x1000        # 408674 <task+0x1d4>
  80401f:	00 10 00 00 
    task[0].tss.eflags=0x202;
  804023:	48 c7 05 56 46 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc04656],0x202        # 408684 <task+0x1e4>
  80402a:	02 02 00 00 
    cur_proc=pnr;
  80402e:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  804034:	89 05 36 e0 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e036],eax        # 412070 <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  80403a:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  804040:	01 c0                	add    eax,eax
  804042:	83 c0 05             	add    eax,0x5
  804045:	c1 e0 03             	shl    eax,0x3
  804048:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(&task[pnr].tss);
  80404b:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  804051:	48 98                	cdqe   
  804053:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80405a:	48 05 90 01 00 00    	add    rax,0x190
  804060:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804066:	48 83 c0 0c          	add    rax,0xc
  80406a:	48 89 c7             	mov    rdi,rax
  80406d:	e8 f9 5e 00 00       	call   809f6b <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  804072:	90                   	nop
  804073:	c9                   	leave  
  804074:	c3                   	ret    

0000000000804075 <save_context>:
void save_context(TSS *tss)
{
  804075:	f3 0f 1e fa          	endbr64 
  804079:	55                   	push   rbp
  80407a:	48 89 e5             	mov    rbp,rsp
  80407d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    tss->eip=scene_saver.eip;
  804081:	48 8b 15 58 df c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0df58]        # 411fe0 <scene_saver+0x40>
  804088:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80408c:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    tss->eax=scene_saver.eax;
  804090:	48 8b 15 59 df c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0df59]        # 411ff0 <scene_saver+0x50>
  804097:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80409b:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    tss->ebx=scene_saver.ebx;
  80409f:	48 8b 15 62 df c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0df62]        # 412008 <scene_saver+0x68>
  8040a6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8040aa:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    tss->ecx=scene_saver.ecx;
  8040ae:	48 8b 15 43 df c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0df43]        # 411ff8 <scene_saver+0x58>
  8040b5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8040b9:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
    tss->edx=scene_saver.edx;
  8040bd:	48 8b 15 3c df c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0df3c]        # 412000 <scene_saver+0x60>
  8040c4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8040c8:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    tss->esi=scene_saver.esi;
  8040cc:	48 8b 15 4d df c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0df4d]        # 412020 <scene_saver+0x80>
  8040d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8040d7:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    tss->edi=scene_saver.edi;
  8040de:	48 8b 15 43 df c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0df43]        # 412028 <scene_saver+0x88>
  8040e5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8040e9:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
    tss->eflags=scene_saver.eflags;
  8040f0:	48 8b 15 f1 de c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0def1]        # 411fe8 <scene_saver+0x48>
  8040f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8040fb:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    tss->esp=scene_saver.esp;
  8040ff:	48 8b 15 0a df c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0df0a]        # 412010 <scene_saver+0x70>
  804106:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80410a:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    tss->ebp=scene_saver.ebp;
  80410e:	48 8b 15 03 df c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0df03]        # 412018 <scene_saver+0x78>
  804115:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804119:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
}
  80411d:	90                   	nop
  80411e:	5d                   	pop    rbp
  80411f:	c3                   	ret    

0000000000804120 <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  804120:	f3 0f 1e fa          	endbr64 
  804124:	55                   	push   rbp
  804125:	48 89 e5             	mov    rbp,rsp
  804128:	48 83 ec 60          	sub    rsp,0x60
  80412c:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  80412f:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  804132:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  804135:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80413b:	85 c0                	test   eax,eax
  80413d:	0f 48 c2             	cmovs  eax,edx
  804140:	c1 f8 0c             	sar    eax,0xc
  804143:	89 c1                	mov    ecx,eax
  804145:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  804148:	99                   	cdq    
  804149:	c1 ea 14             	shr    edx,0x14
  80414c:	01 d0                	add    eax,edx
  80414e:	25 ff 0f 00 00       	and    eax,0xfff
  804153:	29 d0                	sub    eax,edx
  804155:	01 c8                	add    eax,ecx
  804157:	85 c0                	test   eax,eax
  804159:	0f 95 c0             	setne  al
  80415c:	0f b6 c0             	movzx  eax,al
  80415f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  804162:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  804169:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  804170:	00 
    page_item *pgind=task[proc_index].tss.cr3;
  804171:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804174:	48 98                	cdqe   
  804176:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80417d:	48 05 60 86 40 00    	add    rax,0x408660
  804183:	48 8b 40 14          	mov    rax,QWORD PTR [rax+0x14]
  804187:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    pgind++;
  80418b:	48 83 45 e8 08       	add    QWORD PTR [rbp-0x18],0x8
    for(int i=1;i<1024;i++)
  804190:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x1
  804197:	e9 39 02 00 00       	jmp    8043d5 <palloc+0x2b5>
    {
        page_item* tblp=*pgind&0xfffff000;
  80419c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8041a0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8041a3:	25 00 f0 ff ff       	and    eax,0xfffff000
  8041a8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        for(int j=0;j<1024;j++)
  8041ac:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
  8041b3:	e9 07 02 00 00       	jmp    8043bf <palloc+0x29f>
        {
            int v=*tblp&PAGE_PRESENT;
  8041b8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8041bc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8041bf:	83 e0 01             	and    eax,0x1
  8041c2:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
            if(!v)
  8041c5:	83 7d d0 00          	cmp    DWORD PTR [rbp-0x30],0x0
  8041c9:	0f 85 e7 01 00 00    	jne    8043b6 <palloc+0x296>
            {
                int new_pg=req_a_page();
  8041cf:	b8 00 00 00 00       	mov    eax,0x0
  8041d4:	e8 0d d2 ff ff       	call   8013e6 <req_a_page>
  8041d9:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
                if(new_pg==-1)
  8041dc:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  8041e0:	0f 85 b9 00 00 00    	jne    80429f <palloc+0x17f>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  8041e6:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8041e9:	48 98                	cdqe   
  8041eb:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8041f2:	48 05 e4 84 40 00    	add    rax,0x4084e4
  8041f8:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8041fb:	0f b7 c0             	movzx  eax,ax
  8041fe:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804201:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804204:	48 98                	cdqe   
  804206:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80420d:	48 05 e0 84 40 00    	add    rax,0x4084e0
  804213:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804217:	0f b7 c0             	movzx  eax,ax
  80421a:	c1 e0 10             	shl    eax,0x10
  80421d:	25 00 00 0f 00       	and    eax,0xf0000
  804222:	01 45 b8             	add    DWORD PTR [rbp-0x48],eax
                    size+=c;
  804225:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804228:	01 45 b8             	add    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  80422b:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  80422e:	89 c2                	mov    edx,eax
  804230:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804233:	48 98                	cdqe   
  804235:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80423c:	48 05 e4 84 40 00    	add    rax,0x4084e4
  804242:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  804245:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804248:	48 98                	cdqe   
  80424a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804251:	48 05 e0 84 40 00    	add    rax,0x4084e0
  804257:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80425b:	0f b7 c0             	movzx  eax,ax
  80425e:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    tmp_attr&=0xfff0;
  804261:	81 65 b4 f0 ff 00 00 	and    DWORD PTR [rbp-0x4c],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804268:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  80426b:	c1 e8 10             	shr    eax,0x10
  80426e:	83 e0 0f             	and    eax,0xf
  804271:	89 c2                	mov    edx,eax
  804273:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  804276:	01 d0                	add    eax,edx
  804278:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  80427b:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80427e:	89 c2                	mov    edx,eax
  804280:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804283:	48 98                	cdqe   
  804285:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80428c:	48 05 e0 84 40 00    	add    rax,0x4084e0
  804292:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  804296:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80429a:	e9 48 01 00 00       	jmp    8043e7 <palloc+0x2c7>
                }
                int addr=get_phyaddr(new_pg);
  80429f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8042a2:	89 c7                	mov    edi,eax
  8042a4:	e8 eb d2 ff ff       	call   801594 <get_phyaddr>
  8042a9:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  8042ac:	8b 4d c8             	mov    ecx,DWORD PTR [rbp-0x38]
  8042af:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8042b3:	ba 07 00 00 00       	mov    edx,0x7
  8042b8:	89 ce                	mov    esi,ecx
  8042ba:	48 89 c7             	mov    rdi,rax
  8042bd:	e8 e5 d2 ff ff       	call   8015a7 <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  8042c2:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8042c5:	c1 e0 0a             	shl    eax,0xa
  8042c8:	89 c2                	mov    edx,eax
  8042ca:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8042cd:	01 d0                	add    eax,edx
  8042cf:	c1 e0 0c             	shl    eax,0xc
  8042d2:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                if(ptr==NULL)
  8042d5:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8042da:	75 12                	jne    8042ee <palloc+0x1ce>
                {
                    ptr=laddr;
  8042dc:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8042df:	48 98                	cdqe   
  8042e1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
                    palloc_paddr=addr;
  8042e5:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  8042e8:	89 05 8a dd c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0dd8a],eax        # 412078 <palloc_paddr>
                }
                page_c--;
  8042ee:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  8042f2:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  8042f6:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8042fa:	0f 85 b6 00 00 00    	jne    8043b6 <palloc+0x296>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804300:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804303:	48 98                	cdqe   
  804305:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80430c:	48 05 e4 84 40 00    	add    rax,0x4084e4
  804312:	0f b7 00             	movzx  eax,WORD PTR [rax]
  804315:	0f b7 c0             	movzx  eax,ax
  804318:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  80431b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80431e:	48 98                	cdqe   
  804320:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804327:	48 05 e0 84 40 00    	add    rax,0x4084e0
  80432d:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804331:	0f b7 c0             	movzx  eax,ax
  804334:	c1 e0 10             	shl    eax,0x10
  804337:	25 00 00 0f 00       	and    eax,0xf0000
  80433c:	01 45 c0             	add    DWORD PTR [rbp-0x40],eax
                    size+=c;
  80433f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804342:	01 45 c0             	add    DWORD PTR [rbp-0x40],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  804345:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  804348:	89 c2                	mov    edx,eax
  80434a:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80434d:	48 98                	cdqe   
  80434f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804356:	48 05 e4 84 40 00    	add    rax,0x4084e4
  80435c:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  80435f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804362:	48 98                	cdqe   
  804364:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80436b:	48 05 e0 84 40 00    	add    rax,0x4084e0
  804371:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804375:	0f b7 c0             	movzx  eax,ax
  804378:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    tmp_attr&=0xfff0;
  80437b:	81 65 bc f0 ff 00 00 	and    DWORD PTR [rbp-0x44],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804382:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  804385:	c1 e8 10             	shr    eax,0x10
  804388:	83 e0 0f             	and    eax,0xf
  80438b:	89 c2                	mov    edx,eax
  80438d:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804390:	01 d0                	add    eax,edx
  804392:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  804395:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804398:	89 c2                	mov    edx,eax
  80439a:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80439d:	48 98                	cdqe   
  80439f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8043a6:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8043ac:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
                    return ptr;
  8043b0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8043b4:	eb 31                	jmp    8043e7 <palloc+0x2c7>
                }
            }
            tblp++;
  8043b6:	48 83 45 d8 08       	add    QWORD PTR [rbp-0x28],0x8
        for(int j=0;j<1024;j++)
  8043bb:	83 45 d4 01          	add    DWORD PTR [rbp-0x2c],0x1
  8043bf:	81 7d d4 ff 03 00 00 	cmp    DWORD PTR [rbp-0x2c],0x3ff
  8043c6:	0f 8e ec fd ff ff    	jle    8041b8 <palloc+0x98>
        }
        pgind++;
  8043cc:	48 83 45 e8 08       	add    QWORD PTR [rbp-0x18],0x8
    for(int i=1;i<1024;i++)
  8043d1:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
  8043d5:	81 7d e4 ff 03 00 00 	cmp    DWORD PTR [rbp-0x1c],0x3ff
  8043dc:	0f 8e ba fd ff ff    	jle    80419c <palloc+0x7c>
    }
    return NULL;
  8043e2:	b8 00 00 00 00       	mov    eax,0x0
}
  8043e7:	c9                   	leave  
  8043e8:	c3                   	ret    

00000000008043e9 <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  8043e9:	f3 0f 1e fa          	endbr64 
  8043ed:	55                   	push   rbp
  8043ee:	48 89 e5             	mov    rbp,rsp
  8043f1:	48 83 ec 10          	sub    rsp,0x10
  8043f5:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  8043f8:	8b 05 72 dc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dc72]        # 412070 <cur_proc>
  8043fe:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804401:	89 d6                	mov    esi,edx
  804403:	89 c7                	mov    edi,eax
  804405:	e8 16 fd ff ff       	call   804120 <palloc>
}
  80440a:	c9                   	leave  
  80440b:	c3                   	ret    

000000000080440c <proc_end>:
void proc_end()
{
  80440c:	f3 0f 1e fa          	endbr64 
  804410:	55                   	push   rbp
  804411:	48 89 e5             	mov    rbp,rsp
  804414:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  804418:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
  80441b:	48 8b 05 8a 42 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0428a]        # 4086ac <task+0x20c>
  804422:	48 89 c4             	mov    rsp,rax
    del_proc(cur_proc);
  804425:	8b 05 45 dc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dc45]        # 412070 <cur_proc>
  80442b:	89 c7                	mov    edi,eax
  80442d:	e8 75 00 00 00       	call   8044a7 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  804432:	8b 05 38 dc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dc38]        # 412070 <cur_proc>
  804438:	48 98                	cdqe   
  80443a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804441:	48 05 00 85 40 00    	add    rax,0x408500
  804447:	8b 00                	mov    eax,DWORD PTR [rax]
  804449:	83 f8 ff             	cmp    eax,0xffffffff
  80444c:	74 4c                	je     80449a <proc_end+0x8e>
        task[task[cur_proc].parent_pid].stat=READY;
  80444e:	8b 05 1c dc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dc1c]        # 412070 <cur_proc>
  804454:	48 98                	cdqe   
  804456:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80445d:	48 05 00 85 40 00    	add    rax,0x408500
  804463:	8b 00                	mov    eax,DWORD PTR [rax]
  804465:	89 c0                	mov    eax,eax
  804467:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80446e:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804474:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  80447a:	8b 05 f0 db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dbf0]        # 412070 <cur_proc>
  804480:	48 98                	cdqe   
  804482:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804489:	48 05 00 85 40 00    	add    rax,0x408500
  80448f:	8b 00                	mov    eax,DWORD PTR [rax]
  804491:	89 c7                	mov    edi,eax
  804493:	e8 d0 fa ff ff       	call   803f68 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  804498:	eb 0a                	jmp    8044a4 <proc_end+0x98>
        switch_proc_tss(0);
  80449a:	bf 00 00 00 00       	mov    edi,0x0
  80449f:	e8 c4 fa ff ff       	call   803f68 <switch_proc_tss>
}
  8044a4:	90                   	nop
  8044a5:	c9                   	leave  
  8044a6:	c3                   	ret    

00000000008044a7 <del_proc>:
void del_proc(int pnr)
{
  8044a7:	f3 0f 1e fa          	endbr64 
  8044ab:	55                   	push   rbp
  8044ac:	48 89 e5             	mov    rbp,rsp
  8044af:	48 83 ec 30          	sub    rsp,0x30
  8044b3:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  8044b6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8044b9:	48 98                	cdqe   
  8044bb:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8044c2:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8044c8:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  8044ce:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8044d1:	48 98                	cdqe   
  8044d3:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8044da:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8044e0:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p=task[pnr].tss.cr3;
  8044e6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8044e9:	48 98                	cdqe   
  8044eb:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8044f2:	48 05 60 86 40 00    	add    rax,0x408660
  8044f8:	48 8b 40 14          	mov    rax,QWORD PTR [rax+0x14]
  8044fc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    p++;
  804500:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804505:	eb 63                	jmp    80456a <del_proc+0xc3>
    {
        page_item *tp=*p&0xfffff000;
  804507:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80450b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80450e:	25 00 f0 ff ff       	and    eax,0xfffff000
  804513:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  804517:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80451e:	eb 30                	jmp    804550 <del_proc+0xa9>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  804520:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804524:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804527:	83 e0 01             	and    eax,0x1
  80452a:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  80452d:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  804531:	74 14                	je     804547 <del_proc+0xa0>
            {
                free_page(*tp&0xfffff000);
  804533:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804537:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80453a:	25 00 f0 ff ff       	and    eax,0xfffff000
  80453f:	48 89 c7             	mov    rdi,rax
  804542:	e8 6f cf ff ff       	call   8014b6 <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  804547:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  80454c:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804550:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804557:	7e c7                	jle    804520 <del_proc+0x79>
        }
        vmfree(tp);
  804559:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80455d:	48 89 c7             	mov    rdi,rax
  804560:	e8 88 cb ff ff       	call   8010ed <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804565:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  80456a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80456e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804571:	83 e0 01             	and    eax,0x1
  804574:	48 85 c0             	test   rax,rax
  804577:	75 8e                	jne    804507 <del_proc+0x60>
    }
    //释放存放页目录的页面
    vmfree(p);
  804579:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80457d:	48 89 c7             	mov    rdi,rax
  804580:	e8 68 cb ff ff       	call   8010ed <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  804585:	90                   	nop
  804586:	c9                   	leave  
  804587:	c3                   	ret    

0000000000804588 <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  804588:	f3 0f 1e fa          	endbr64 
  80458c:	55                   	push   rbp
  80458d:	48 89 e5             	mov    rbp,rsp
  804590:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804593:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  804596:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  80459a:	75 07                	jne    8045a3 <set_proc_stat+0x1b>
  80459c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8045a1:	eb 79                	jmp    80461c <set_proc_stat+0x94>
    int i=0;
  8045a3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  8045aa:	eb 04                	jmp    8045b0 <set_proc_stat+0x28>
  8045ac:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8045b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8045b3:	48 98                	cdqe   
  8045b5:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8045bc:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8045c2:	8b 10                	mov    edx,DWORD PTR [rax]
  8045c4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8045c7:	39 c2                	cmp    edx,eax
  8045c9:	75 e1                	jne    8045ac <set_proc_stat+0x24>
    if(i==MAX_PROC_COUNT)return -1;
  8045cb:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8045cf:	75 07                	jne    8045d8 <set_proc_stat+0x50>
  8045d1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8045d6:	eb 44                	jmp    80461c <set_proc_stat+0x94>
    task[i].stat=stat;
  8045d8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8045db:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8045de:	48 63 d2             	movsxd rdx,edx
  8045e1:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  8045e8:	48 81 c2 a4 84 40 00 	add    rdx,0x4084a4
  8045ef:	89 02                	mov    DWORD PTR [rdx],eax
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  8045f1:	8b 05 79 da c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0da79]        # 412070 <cur_proc>
  8045f7:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8045fa:	75 1b                	jne    804617 <set_proc_stat+0x8f>
        task[cur_proc].utime=MAX_UTIME;
  8045fc:	8b 05 6e da c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0da6e]        # 412070 <cur_proc>
  804602:	48 98                	cdqe   
  804604:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80460b:	48 05 a8 84 40 00    	add    rax,0x4084a8
  804611:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  804617:	b8 00 00 00 00       	mov    eax,0x0
}
  80461c:	5d                   	pop    rbp
  80461d:	c3                   	ret    

000000000080461e <add_proc_openf>:

    return 0;
} */

int add_proc_openf(vfs_dir_entry *entry)
{
  80461e:	f3 0f 1e fa          	endbr64 
  804622:	55                   	push   rbp
  804623:	48 89 e5             	mov    rbp,rsp
  804626:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  80462a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  804631:	eb 69                	jmp    80469c <add_proc_openf+0x7e>
        if(task[cur_proc].openf[i]==NULL)
  804633:	8b 05 37 da c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0da37]        # 412070 <cur_proc>
  804639:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80463c:	48 63 d2             	movsxd rdx,edx
  80463f:	48 83 c2 12          	add    rdx,0x12
  804643:	48 98                	cdqe   
  804645:	48 c1 e2 03          	shl    rdx,0x3
  804649:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804650:	48 01 d0             	add    rax,rdx
  804653:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804659:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80465d:	48 85 c0             	test   rax,rax
  804660:	75 36                	jne    804698 <add_proc_openf+0x7a>
        {
            task[cur_proc].openf[i]=entry;
  804662:	8b 05 08 da c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0da08]        # 412070 <cur_proc>
  804668:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80466b:	48 63 d2             	movsxd rdx,edx
  80466e:	48 83 c2 12          	add    rdx,0x12
  804672:	48 98                	cdqe   
  804674:	48 c1 e2 03          	shl    rdx,0x3
  804678:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80467f:	48 01 d0             	add    rax,rdx
  804682:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  804689:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80468d:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
            return 0;
  804691:	b8 00 00 00 00       	mov    eax,0x0
  804696:	eb 0f                	jmp    8046a7 <add_proc_openf+0x89>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804698:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80469c:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8046a0:	7e 91                	jle    804633 <add_proc_openf+0x15>
        }
    }
    return -1;//full
  8046a2:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8046a7:	5d                   	pop    rbp
  8046a8:	c3                   	ret    

00000000008046a9 <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  8046a9:	f3 0f 1e fa          	endbr64 
  8046ad:	55                   	push   rbp
  8046ae:	48 89 e5             	mov    rbp,rsp
  8046b1:	48 83 ec 10          	sub    rsp,0x10
  8046b5:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  8046b8:	8b 05 b2 d9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d9b2]        # 412070 <cur_proc>
  8046be:	89 c7                	mov    edi,eax
  8046c0:	e8 e2 fd ff ff       	call   8044a7 <del_proc>
    return code;
  8046c5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8046c8:	c9                   	leave  
  8046c9:	c3                   	ret    

00000000008046ca <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(int entry, vfs_dir_entry *cwd, vfs_dir_entry *exef)
{
  8046ca:	f3 0f 1e fa          	endbr64 
  8046ce:	55                   	push   rbp
  8046cf:	48 89 e5             	mov    rbp,rsp
  8046d2:	48 83 ec 40          	sub    rsp,0x40
  8046d6:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  8046d9:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  8046dd:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    
    int i=req_proc();
  8046e1:	b8 00 00 00 00       	mov    eax,0x0
  8046e6:	e8 02 f4 ff ff       	call   803aed <req_proc>
  8046eb:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(i==-1)return -1;
  8046ee:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8046f2:	75 0a                	jne    8046fe <reg_proc+0x34>
  8046f4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8046f9:	e9 80 01 00 00       	jmp    80487e <reg_proc+0x1b4>
    /*set_proc(0,0,0,0,SEL_LDT_DATA,SEL_LDT_CODE,SEL_LDT_STACK,SEL_LDT_DATA\
    ,SEL_LDT_DATA,SEL_LDT_DATA,0x1c00000-4,0,0,0,0,i);*/
    set_proc(0,0,0,0,0x10,0x8,0x10,0x10\
  8046fe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804701:	50                   	push   rax
  804702:	6a 00                	push   0x0
  804704:	6a 00                	push   0x0
  804706:	6a 00                	push   0x0
  804708:	6a 00                	push   0x0
  80470a:	68 fc ff bf 01       	push   0x1bffffc
  80470f:	6a 10                	push   0x10
  804711:	6a 10                	push   0x10
  804713:	6a 10                	push   0x10
  804715:	6a 10                	push   0x10
  804717:	41 b9 08 00 00 00    	mov    r9d,0x8
  80471d:	41 b8 10 00 00 00    	mov    r8d,0x10
  804723:	b9 00 00 00 00       	mov    ecx,0x0
  804728:	ba 00 00 00 00       	mov    edx,0x0
  80472d:	be 00 00 00 00       	mov    esi,0x0
  804732:	bf 00 00 00 00       	mov    edi,0x0
  804737:	e8 7d f4 ff ff       	call   803bb9 <set_proc>
  80473c:	48 83 c4 50          	add    rsp,0x50
    ,0x10,0x10,0x1c00000-4,0,0,0,0,i);
    task[i].pdet=vmalloc();
  804740:	b8 00 00 00 00       	mov    eax,0x0
  804745:	e8 14 c9 ff ff       	call   80105e <vmalloc>
  80474a:	48 89 c2             	mov    rdx,rax
  80474d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804750:	48 98                	cdqe   
  804752:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804759:	48 05 20 85 40 00    	add    rax,0x408520
  80475f:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    int *pt=vmalloc();
  804763:	b8 00 00 00 00       	mov    eax,0x0
  804768:	e8 f1 c8 ff ff       	call   80105e <vmalloc>
  80476d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    task[i].pdet[0]=PAGE_TABLE_ADDR|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;
  804771:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804774:	48 98                	cdqe   
  804776:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80477d:	48 05 20 85 40 00    	add    rax,0x408520
  804783:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804787:	c7 00 07 20 00 00    	mov    DWORD PTR [rax],0x2007
    /*for(int j=0;j<32;j++)
        pt[j]=(PAGE_TABLE_ADDR+j*0x1000)|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;//复制内核页表*/
    //PAGE_TABLE_ADDR|PAGE_PRESENT;//复制内核页表
    //task[i].pdet[7]=PAGE_TABLE_ADDR+7*0x1000|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//sys.dll
    int *stackb=vmalloc();
  80478d:	b8 00 00 00 00       	mov    eax,0x0
  804792:	e8 c7 c8 ff ff       	call   80105e <vmalloc>
  804797:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    task[i].pdet[6]=(int)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  80479b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80479f:	83 c8 07             	or     eax,0x7
  8047a2:	89 c2                	mov    edx,eax
  8047a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8047a7:	48 98                	cdqe   
  8047a9:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8047b0:	48 05 20 85 40 00    	add    rax,0x408520
  8047b6:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8047ba:	48 83 c0 18          	add    rax,0x18
  8047be:	89 10                	mov    DWORD PTR [rax],edx
    stackb[1023]=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  8047c0:	b8 00 00 00 00       	mov    eax,0x0
  8047c5:	e8 1c cc ff ff       	call   8013e6 <req_a_page>
  8047ca:	89 c7                	mov    edi,eax
  8047cc:	e8 c3 cd ff ff       	call   801594 <get_phyaddr>
  8047d1:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8047d5:	48 81 c2 fc 0f 00 00 	add    rdx,0xffc
  8047dc:	83 c8 07             	or     eax,0x7
  8047df:	89 02                	mov    DWORD PTR [rdx],eax
    task[i].tss.cr3=task[i].pdet;
  8047e1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8047e4:	48 98                	cdqe   
  8047e6:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8047ed:	48 05 20 85 40 00    	add    rax,0x408520
  8047f3:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8047f7:	48 89 c2             	mov    rdx,rax
  8047fa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8047fd:	48 98                	cdqe   
  8047ff:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804806:	48 05 60 86 40 00    	add    rax,0x408660
  80480c:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx

    task[i].stat=READY;
  804810:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804813:	48 98                	cdqe   
  804815:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80481c:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804822:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  804828:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80482b:	48 98                	cdqe   
  80482d:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804834:	48 8d 90 20 85 40 00 	lea    rdx,[rax+0x408520]
  80483b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80483f:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    task[i].exef=exef;
  804843:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804846:	48 98                	cdqe   
  804848:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80484f:	48 8d 90 30 85 40 00 	lea    rdx,[rax+0x408530]
  804856:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80485a:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].tss.ds=0x10;
    task[i].tss.ss=0x10;
    task[i].tss.gs=0x10;
    task[i].tss.fs=0x10;
    task[i].tss.cs=0x8;*/
    task[i].tss.eip=entry;
  80485e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804861:	48 98                	cdqe   
  804863:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804866:	48 63 d2             	movsxd rdx,edx
  804869:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  804870:	48 81 c2 70 86 40 00 	add    rdx,0x408670
  804877:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    return i;
  80487b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  80487e:	c9                   	leave  
  80487f:	c3                   	ret    

0000000000804880 <sys_malloc>:

void * sys_malloc(int size)
{
  804880:	f3 0f 1e fa          	endbr64 
  804884:	55                   	push   rbp
  804885:	48 89 e5             	mov    rbp,rsp
  804888:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  80488b:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80488e:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804894:	85 c0                	test   eax,eax
  804896:	0f 48 c2             	cmovs  eax,edx
  804899:	c1 f8 0c             	sar    eax,0xc
  80489c:	89 c1                	mov    ecx,eax
  80489e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8048a1:	99                   	cdq    
  8048a2:	c1 ea 14             	shr    edx,0x14
  8048a5:	01 d0                	add    eax,edx
  8048a7:	25 ff 0f 00 00       	and    eax,0xfff
  8048ac:	29 d0                	sub    eax,edx
  8048ae:	01 c8                	add    eax,ecx
  8048b0:	85 c0                	test   eax,eax
  8048b2:	0f 95 c0             	setne  al
  8048b5:	0f b6 c0             	movzx  eax,al
  8048b8:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  8048bb:	8b 05 af d7 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d7af]        # 412070 <cur_proc>
  8048c1:	48 98                	cdqe   
  8048c3:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8048ca:	48 05 b4 84 40 00    	add    rax,0x4084b4
  8048d0:	8b 00                	mov    eax,DWORD PTR [rax]
  8048d2:	48 98                	cdqe   
  8048d4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  8048d8:	eb 0c                	jmp    8048e6 <sys_malloc+0x66>
        hp=hp->next;
  8048da:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048de:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8048e2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  8048e6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048ea:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8048ee:	48 85 c0             	test   rax,rax
  8048f1:	74 16                	je     804909 <sys_malloc+0x89>
  8048f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048f7:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8048fa:	85 c0                	test   eax,eax
  8048fc:	75 0b                	jne    804909 <sys_malloc+0x89>
  8048fe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804902:	8b 00                	mov    eax,DWORD PTR [rax]
  804904:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804907:	7e d1                	jle    8048da <sys_malloc+0x5a>
    if(hp->pgn<n)
  804909:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80490d:	8b 00                	mov    eax,DWORD PTR [rax]
  80490f:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804912:	7e 7f                	jle    804993 <sys_malloc+0x113>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  804914:	8b 05 56 d7 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d756]        # 412070 <cur_proc>
  80491a:	48 98                	cdqe   
  80491c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804923:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804929:	8b 10                	mov    edx,DWORD PTR [rax]
  80492b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80492e:	c1 e0 0c             	shl    eax,0xc
  804931:	01 d0                	add    eax,edx
  804933:	3d ff ff ef 01       	cmp    eax,0x1efffff
  804938:	7e 0a                	jle    804944 <sys_malloc+0xc4>
        {
            //超过顶部
            return NULL;
  80493a:	b8 00 00 00 00       	mov    eax,0x0
  80493f:	e9 c8 00 00 00       	jmp    804a0c <sys_malloc+0x18c>
        }
        int needed=n-hp->pgn;
  804944:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804948:	8b 10                	mov    edx,DWORD PTR [rax]
  80494a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80494d:	29 d0                	sub    eax,edx
  80494f:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  804952:	8b 05 18 d7 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d718]        # 412070 <cur_proc>
  804958:	48 98                	cdqe   
  80495a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804961:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804967:	8b 00                	mov    eax,DWORD PTR [rax]
  804969:	48 98                	cdqe   
  80496b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  80496f:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804976:	eb 13                	jmp    80498b <sys_malloc+0x10b>
        {
            *p=0;//触发缺页中断
  804978:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80497c:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  80497f:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804986:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804987:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80498b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80498e:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  804991:	7c e5                	jl     804978 <sys_malloc+0xf8>
        }
    }
    if(hp->pgn>n)
  804993:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804997:	8b 00                	mov    eax,DWORD PTR [rax]
  804999:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  80499c:	7d 59                	jge    8049f7 <sys_malloc+0x177>
    {
        //在后面新建一个头
        char *p=hp;
  80499e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049a2:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  8049a6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8049a9:	83 c0 01             	add    eax,0x1
  8049ac:	c1 e0 0c             	shl    eax,0xc
  8049af:	48 98                	cdqe   
  8049b1:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  8049b5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8049b9:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  8049bd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049c1:	8b 00                	mov    eax,DWORD PTR [rax]
  8049c3:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  8049c6:	8d 50 ff             	lea    edx,[rax-0x1]
  8049c9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8049cd:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  8049cf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049d3:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8049d7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8049db:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  8049df:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8049e3:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8049e7:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  8049eb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049ef:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8049f3:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  8049f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049fb:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  804a02:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a06:	48 05 00 10 00 00    	add    rax,0x1000
}
  804a0c:	5d                   	pop    rbp
  804a0d:	c3                   	ret    

0000000000804a0e <sys_free>:
int sys_free(int ptr)
{
  804a0e:	f3 0f 1e fa          	endbr64 
  804a12:	55                   	push   rbp
  804a13:	48 89 e5             	mov    rbp,rsp
  804a16:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  804a19:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804a1c:	2d 00 10 00 00       	sub    eax,0x1000
  804a21:	48 98                	cdqe   
  804a23:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  804a27:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804a2b:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  804a32:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804a36:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804a3a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804a3e:	eb 2e                	jmp    804a6e <sys_free+0x60>
    {
        if(p->alloc==0)
  804a40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a44:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804a47:	85 c0                	test   eax,eax
  804a49:	75 2c                	jne    804a77 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  804a4b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804a4f:	8b 10                	mov    edx,DWORD PTR [rax]
  804a51:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a55:	8b 00                	mov    eax,DWORD PTR [rax]
  804a57:	83 c0 01             	add    eax,0x1
  804a5a:	01 c2                	add    edx,eax
  804a5c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804a60:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  804a62:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a66:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804a6a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804a6e:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804a73:	75 cb                	jne    804a40 <sys_free+0x32>
  804a75:	eb 01                	jmp    804a78 <sys_free+0x6a>
            break;
  804a77:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  804a78:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804a7c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804a80:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804a84:	eb 2e                	jmp    804ab4 <sys_free+0xa6>
    {
        if(p->alloc==0)
  804a86:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a8a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804a8d:	85 c0                	test   eax,eax
  804a8f:	75 2c                	jne    804abd <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  804a91:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a95:	8b 10                	mov    edx,DWORD PTR [rax]
  804a97:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804a9b:	8b 00                	mov    eax,DWORD PTR [rax]
  804a9d:	83 c0 01             	add    eax,0x1
  804aa0:	01 c2                	add    edx,eax
  804aa2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804aa6:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  804aa8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804aac:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804ab0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804ab4:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804ab9:	75 cb                	jne    804a86 <sys_free+0x78>
  804abb:	eb 01                	jmp    804abe <sys_free+0xb0>
            break;
  804abd:	90                   	nop
    }
    //合并完成
    return 0;
  804abe:	b8 00 00 00 00       	mov    eax,0x0
  804ac3:	5d                   	pop    rbp
  804ac4:	c3                   	ret    
  804ac5:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  804acc:	00 00 00 
  804acf:	90                   	nop

0000000000804ad0 <outb>:
  804ad0:	66 89 fa             	mov    dx,di
  804ad3:	66 89 f0             	mov    ax,si
  804ad6:	ee                   	out    dx,al
  804ad7:	e8 29 00 00 00       	call   804b05 <io_delay>
  804adc:	c3                   	ret    

0000000000804add <outw>:
  804add:	66 89 fa             	mov    dx,di
  804ae0:	66 89 f0             	mov    ax,si
  804ae3:	66 ef                	out    dx,ax
  804ae5:	90                   	nop
  804ae6:	90                   	nop
  804ae7:	90                   	nop
  804ae8:	c3                   	ret    

0000000000804ae9 <inb>:
  804ae9:	31 c0                	xor    eax,eax
  804aeb:	66 89 fa             	mov    dx,di
  804aee:	ec                   	in     al,dx
  804aef:	90                   	nop
  804af0:	90                   	nop
  804af1:	90                   	nop
  804af2:	c3                   	ret    

0000000000804af3 <inw>:
  804af3:	31 c0                	xor    eax,eax
  804af5:	66 89 fa             	mov    dx,di
  804af8:	66 ed                	in     ax,dx
  804afa:	90                   	nop
  804afb:	90                   	nop
  804afc:	90                   	nop
  804afd:	c3                   	ret    

0000000000804afe <eoi>:
  804afe:	b0 20                	mov    al,0x20
  804b00:	e6 a0                	out    0xa0,al
  804b02:	e6 20                	out    0x20,al
  804b04:	c3                   	ret    

0000000000804b05 <io_delay>:
  804b05:	90                   	nop
  804b06:	90                   	nop
  804b07:	90                   	nop
  804b08:	90                   	nop
  804b09:	c3                   	ret    

0000000000804b0a <turn_on_int>:
  804b0a:	b0 f8                	mov    al,0xf8
  804b0c:	e6 21                	out    0x21,al
  804b0e:	e8 f2 ff ff ff       	call   804b05 <io_delay>
  804b13:	b0 af                	mov    al,0xaf
  804b15:	e6 a1                	out    0xa1,al
  804b17:	e8 e9 ff ff ff       	call   804b05 <io_delay>
  804b1c:	b8 00 70 10 00       	mov    eax,0x107000
  804b21:	0f 01 18             	lidt   [rax]
  804b24:	90                   	nop
  804b25:	90                   	nop
  804b26:	90                   	nop
  804b27:	90                   	nop
  804b28:	fb                   	sti    
  804b29:	c3                   	ret    

0000000000804b2a <report_back_trace_of_err>:
  804b2a:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  804b2f:	50                   	push   rax
  804b30:	68 39 4b 80 00       	push   0x804b39
  804b35:	83 c4 08             	add    esp,0x8
  804b38:	c3                   	ret    

0000000000804b39 <bt_msg>:
  804b39:	65 72 72             	gs jb  804bae <fill_desc+0x1c>
  804b3c:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804b3d:	72 20                	jb     804b5f <init_gdt+0x11>
  804b3f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804b40:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  804b43:	72 73                	jb     804bb8 <fill_desc+0x26>
  804b45:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  804b48:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eea7c6 <_knl_end+0x2ea7c6>

0000000000804b4e <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  804b4e:	f3 0f 1e fa          	endbr64 
  804b52:	55                   	push   rbp
  804b53:	48 89 e5             	mov    rbp,rsp
    //asm volatile("sgdt %0"::"m"(gdt));
    fill_desc(0,0xffffffff,SEG_CONFORMING_RW_CODE,1);
  804b56:	b9 01 00 00 00       	mov    ecx,0x1
  804b5b:	ba 9e cf 00 00       	mov    edx,0xcf9e
  804b60:	be ff ff ff ff       	mov    esi,0xffffffff
  804b65:	bf 00 00 00 00       	mov    edi,0x0
  804b6a:	e8 23 00 00 00       	call   804b92 <fill_desc>
    fill_desc(0,0xffffffff,SEG_RW_DATA,2);
  804b6f:	b9 02 00 00 00       	mov    ecx,0x2
  804b74:	ba 92 cf 00 00       	mov    edx,0xcf92
  804b79:	be ff ff ff ff       	mov    esi,0xffffffff
  804b7e:	bf 00 00 00 00       	mov    edi,0x0
  804b83:	e8 0a 00 00 00       	call   804b92 <fill_desc>
    asm volatile("lgdt %0":"=m"(gdtptr));
  804b88:	0f 01 15 71 04 90 ff 	lgdt   [rip+0xffffffffff900471]        # 105000 <gdtptr>

}
  804b8f:	90                   	nop
  804b90:	5d                   	pop    rbp
  804b91:	c3                   	ret    

0000000000804b92 <fill_desc>:
void fill_desc(u32 base, u32 limit,u16 attr,u32 index)
{
  804b92:	f3 0f 1e fa          	endbr64 
  804b96:	55                   	push   rbp
  804b97:	48 89 e5             	mov    rbp,rsp
  804b9a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  804b9d:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  804ba0:	89 d0                	mov    eax,edx
  804ba2:	89 4d f0             	mov    DWORD PTR [rbp-0x10],ecx
  804ba5:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    gdt[index].base_lo16=base&0xffff;
  804ba9:	48 8b 15 f0 54 00 00 	mov    rdx,QWORD PTR [rip+0x54f0]        # 80a0a0 <gdt>
  804bb0:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804bb3:	48 c1 e0 03          	shl    rax,0x3
  804bb7:	48 01 d0             	add    rax,rdx
  804bba:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804bbd:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_mid8=(base>>16)&0xff;
  804bc1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804bc4:	c1 e8 10             	shr    eax,0x10
  804bc7:	89 c1                	mov    ecx,eax
  804bc9:	48 8b 15 d0 54 00 00 	mov    rdx,QWORD PTR [rip+0x54d0]        # 80a0a0 <gdt>
  804bd0:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804bd3:	48 c1 e0 03          	shl    rax,0x3
  804bd7:	48 01 d0             	add    rax,rdx
  804bda:	89 ca                	mov    edx,ecx
  804bdc:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_hi8=(base>>24)&0xff;
  804bdf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804be2:	c1 e8 18             	shr    eax,0x18
  804be5:	89 c1                	mov    ecx,eax
  804be7:	48 8b 15 b2 54 00 00 	mov    rdx,QWORD PTR [rip+0x54b2]        # 80a0a0 <gdt>
  804bee:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804bf1:	48 c1 e0 03          	shl    rax,0x3
  804bf5:	48 01 d0             	add    rax,rdx
  804bf8:	89 ca                	mov    edx,ecx
  804bfa:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].limit_lo16=limit&0xffff;
  804bfd:	48 8b 15 9c 54 00 00 	mov    rdx,QWORD PTR [rip+0x549c]        # 80a0a0 <gdt>
  804c04:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804c07:	48 c1 e0 03          	shl    rax,0x3
  804c0b:	48 01 d0             	add    rax,rdx
  804c0e:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  804c11:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr;
  804c14:	48 8b 15 85 54 00 00 	mov    rdx,QWORD PTR [rip+0x5485]        # 80a0a0 <gdt>
  804c1b:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804c1e:	48 c1 e0 03          	shl    rax,0x3
  804c22:	48 01 c2             	add    rdx,rax
  804c25:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  804c29:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  804c2d:	90                   	nop
  804c2e:	5d                   	pop    rbp
  804c2f:	c3                   	ret    

0000000000804c30 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  804c30:	f3 0f 1e fa          	endbr64 
  804c34:	55                   	push   rbp
  804c35:	48 89 e5             	mov    rbp,rsp
  804c38:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804c3b:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  804c3e:	89 c8                	mov    eax,ecx
  804c40:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  804c44:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  804c48:	48 8b 05 51 54 00 00 	mov    rax,QWORD PTR [rip+0x5451]        # 80a0a0 <gdt>
  804c4f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  804c53:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804c56:	48 c1 e0 04          	shl    rax,0x4
  804c5a:	48 89 c2             	mov    rdx,rax
  804c5d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c61:	48 01 d0             	add    rax,rdx
  804c64:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804c67:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  804c6a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804c6d:	48 c1 e0 04          	shl    rax,0x4
  804c71:	48 89 c2             	mov    rdx,rax
  804c74:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c78:	48 01 d0             	add    rax,rdx
  804c7b:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804c7e:	c1 ea 10             	shr    edx,0x10
  804c81:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  804c84:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804c87:	48 c1 e0 04          	shl    rax,0x4
  804c8b:	48 89 c2             	mov    rdx,rax
  804c8e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c92:	48 01 c2             	add    rdx,rax
  804c95:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  804c99:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  804c9d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804ca0:	48 c1 e0 04          	shl    rax,0x4
  804ca4:	48 89 c2             	mov    rdx,rax
  804ca7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804cab:	48 01 c2             	add    rdx,rax
  804cae:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  804cb2:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  804cb6:	90                   	nop
  804cb7:	5d                   	pop    rbp
  804cb8:	c3                   	ret    

0000000000804cb9 <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  804cb9:	f3 0f 1e fa          	endbr64 
  804cbd:	55                   	push   rbp
  804cbe:	48 89 e5             	mov    rbp,rsp
  804cc1:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  804cc4:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  804cc7:	89 d0                	mov    eax,edx
  804cc9:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  804ccd:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    desc->base_lo16=base&0xffff;
  804cd1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804cd4:	89 c2                	mov    edx,eax
  804cd6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804cda:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    desc->base_mid8=(base>>16)&0xff;
  804cde:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804ce1:	c1 e8 10             	shr    eax,0x10
  804ce4:	89 c2                	mov    edx,eax
  804ce6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804cea:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    desc->base_hi8=(base>>24)&0xff;
  804ced:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804cf0:	c1 e8 18             	shr    eax,0x18
  804cf3:	89 c2                	mov    edx,eax
  804cf5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804cf9:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    desc->limit_lo16=limit&0xffff;
  804cfc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804cff:	89 c2                	mov    edx,eax
  804d01:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804d05:	66 89 10             	mov    WORD PTR [rax],dx
    desc->attr=attr|(limit>>16&0xf)<<8;
  804d08:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804d0b:	c1 e8 10             	shr    eax,0x10
  804d0e:	c1 e0 08             	shl    eax,0x8
  804d11:	66 25 00 0f          	and    ax,0xf00
  804d15:	66 0b 45 f4          	or     ax,WORD PTR [rbp-0xc]
  804d19:	89 c2                	mov    edx,eax
  804d1b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804d1f:	66 89 50 05          	mov    WORD PTR [rax+0x5],dx
  804d23:	90                   	nop
  804d24:	5d                   	pop    rbp
  804d25:	c3                   	ret    
  804d26:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  804d2d:	00 00 00 

0000000000804d30 <fill_desc>:
  804d30:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  804d35:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  804d3a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  804d3f:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  804d44:	be 00 60 00 00       	mov    esi,0x6000
  804d49:	c1 e2 03             	shl    edx,0x3
  804d4c:	01 d6                	add    esi,edx
  804d4e:	66 67 89 1e          	mov    WORD PTR [esi],bx
  804d52:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  804d57:	c1 e8 10             	shr    eax,0x10
  804d5a:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  804d5e:	c1 eb 10             	shr    ebx,0x10
  804d61:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  804d65:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  804d69:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  804d6d:	c3                   	ret    

0000000000804d6e <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  804d6e:	f3 0f 1e fa          	endbr64 
  804d72:	55                   	push   rbp
  804d73:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  804d76:	b8 00 00 00 00       	mov    eax,0x0
  804d7b:	e8 3e 17 00 00       	call   8064be <execute_request>
    do_req();
  804d80:	b8 00 00 00 00       	mov    eax,0x0
  804d85:	e8 e2 ea ff ff       	call   80386c <do_req>
    if(!manage_proc_lock)
  804d8a:	8b 05 b8 52 00 00    	mov    eax,DWORD PTR [rip+0x52b8]        # 80a048 <manage_proc_lock>
  804d90:	85 c0                	test   eax,eax
  804d92:	75 0a                	jne    804d9e <clock_c+0x30>
    {
        manage_proc();
  804d94:	b8 00 00 00 00       	mov    eax,0x0
  804d99:	e8 a9 f0 ff ff       	call   803e47 <manage_proc>
    }
    //puts("1 disk req executed.");
  804d9e:	90                   	nop
  804d9f:	5d                   	pop    rbp
  804da0:	c3                   	ret    
  804da1:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  804da8:	00 00 00 
  804dab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000804db0 <clock>:
  804db0:	b0 20                	mov    al,0x20
  804db2:	e6 a0                	out    0xa0,al
  804db4:	e6 20                	out    0x20,al
  804db6:	e8 b3 ff ff ff       	call   804d6e <clock_c>
  804dbb:	48 cf                	iretq  

0000000000804dbd <execute>:
    return ind;
}
*/

int execute(char *path)
{
  804dbd:	f3 0f 1e fa          	endbr64 
  804dc1:	55                   	push   rbp
  804dc2:	48 89 e5             	mov    rbp,rsp
  804dc5:	48 83 ec 30          	sub    rsp,0x30
  804dc9:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  804dcd:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  804dd4:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, 1)) == -1)return -1;
  804ddb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804ddf:	be 01 00 00 00       	mov    esi,0x1
  804de4:	48 89 c7             	mov    rdi,rax
  804de7:	e8 73 cd ff ff       	call   801b5f <sys_open>
  804dec:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  804def:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804df3:	75 0a                	jne    804dff <execute+0x42>
  804df5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804dfa:	e9 b7 00 00 00       	jmp    804eb6 <execute+0xf9>
    //
    char *p=path;
  804dff:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804e03:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  804e07:	eb 05                	jmp    804e0e <execute+0x51>
  804e09:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  804e0e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804e12:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804e15:	84 c0                	test   al,al
  804e17:	75 f0                	jne    804e09 <execute+0x4c>
    for(;*p!='/'&&p>path;p--);
  804e19:	eb 05                	jmp    804e20 <execute+0x63>
  804e1b:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  804e20:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804e24:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804e27:	3c 2f                	cmp    al,0x2f
  804e29:	74 0a                	je     804e35 <execute+0x78>
  804e2b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804e2f:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804e33:	77 e6                	ja     804e1b <execute+0x5e>
    if(p>path)
  804e35:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804e39:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804e3d:	76 2f                	jbe    804e6e <execute+0xb1>
    {
        *p='\0';
  804e3f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804e43:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, 1)) == -1)return -1;
  804e46:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804e4a:	be 01 00 00 00       	mov    esi,0x1
  804e4f:	48 89 c7             	mov    rdi,rax
  804e52:	e8 08 cd ff ff       	call   801b5f <sys_open>
  804e57:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  804e5a:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  804e5e:	75 07                	jne    804e67 <execute+0xaa>
  804e60:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804e65:	eb 4f                	jmp    804eb6 <execute+0xf9>
        *p='/';
  804e67:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804e6b:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern vfs_dir_entry opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  804e6e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804e71:	48 63 d0             	movsxd rdx,eax
  804e74:	48 89 d0             	mov    rax,rdx
  804e77:	48 01 c0             	add    rax,rax
  804e7a:	48 01 d0             	add    rax,rdx
  804e7d:	48 c1 e0 05          	shl    rax,0x5
  804e81:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  804e88:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804e8b:	48 63 c8             	movsxd rcx,eax
  804e8e:	48 89 c8             	mov    rax,rcx
  804e91:	48 01 c0             	add    rax,rax
  804e94:	48 01 c8             	add    rax,rcx
  804e97:	48 c1 e0 05          	shl    rax,0x5
  804e9b:	48 05 60 06 40 00    	add    rax,0x400660
  804ea1:	b9 20 4f 80 00       	mov    ecx,0x804f20
  804ea6:	48 89 c6             	mov    rsi,rax
  804ea9:	89 cf                	mov    edi,ecx
  804eab:	e8 1a f8 ff ff       	call   8046ca <reg_proc>
  804eb0:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  804eb3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  804eb6:	c9                   	leave  
  804eb7:	c3                   	ret    

0000000000804eb8 <exec_call>:

int exec_call(char *path)
{
  804eb8:	f3 0f 1e fa          	endbr64 
  804ebc:	55                   	push   rbp
  804ebd:	48 89 e5             	mov    rbp,rsp
  804ec0:	48 83 ec 20          	sub    rsp,0x20
  804ec4:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi=execute(path);
  804ec8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804ecc:	48 89 c7             	mov    rdi,rax
  804ecf:	e8 e9 fe ff ff       	call   804dbd <execute>
  804ed4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  804ed7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804eda:	01 c0                	add    eax,eax
  804edc:	83 c0 05             	add    eax,0x5
  804edf:	c1 e0 03             	shl    eax,0x3
  804ee2:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  804ee5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804ee8:	89 c7                	mov    edi,eax
  804eea:	e8 79 f0 ff ff       	call   803f68 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  804eef:	90                   	nop
  804ef0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804ef3:	48 98                	cdqe   
  804ef5:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804efc:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804f02:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804f05:	83 f8 03             	cmp    eax,0x3
  804f08:	75 e6                	jne    804ef0 <exec_call+0x38>
    return task[pi].exit_code;
  804f0a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804f0d:	48 98                	cdqe   
  804f0f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804f16:	48 05 b0 84 40 00    	add    rax,0x4084b0
  804f1c:	8b 00                	mov    eax,DWORD PTR [rax]
}
  804f1e:	c9                   	leave  
  804f1f:	c3                   	ret    

0000000000804f20 <proc_start>:
int proc_start()
{
  804f20:	f3 0f 1e fa          	endbr64 
  804f24:	55                   	push   rbp
  804f25:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  804f28:	8b 05 42 d1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d142]        # 412070 <cur_proc>
  804f2e:	48 98                	cdqe   
  804f30:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804f37:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804f3d:	48 89 c7             	mov    rdi,rax
  804f40:	e8 1a 00 00 00       	call   804f5f <load_pe>
    //释放进程资源
    del_proc(cur_proc);
  804f45:	8b 05 25 d1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d125]        # 412070 <cur_proc>
  804f4b:	89 c7                	mov    edi,eax
  804f4d:	e8 55 f5 ff ff       	call   8044a7 <del_proc>
    switch_proc_tss(0);
  804f52:	bf 00 00 00 00       	mov    edi,0x0
  804f57:	e8 0c f0 ff ff       	call   803f68 <switch_proc_tss>
}
  804f5c:	90                   	nop
  804f5d:	5d                   	pop    rbp
  804f5e:	c3                   	ret    

0000000000804f5f <load_pe>:
//在cr3切换到目标进程下的加载程序(但进程还没调度到那里)。
int load_pe(struct process *proc)
{
  804f5f:	f3 0f 1e fa          	endbr64 
  804f63:	55                   	push   rbp
  804f64:	48 89 e5             	mov    rbp,rsp
  804f67:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  804f6e:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    vfs_dir_entry *f=proc->exef;
  804f75:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  804f7c:	48 8b 80 94 00 00 00 	mov    rax,QWORD PTR [rax+0x94]
  804f83:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=f->fno;
  804f87:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  804f8b:	8b 00                	mov    eax,DWORD PTR [rax]
  804f8d:	89 45 94             	mov    DWORD PTR [rbp-0x6c],eax

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  804f90:	48 8d 8d 70 fe ff ff 	lea    rcx,[rbp-0x190]
  804f97:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804f9a:	ba 44 00 00 00       	mov    edx,0x44
  804f9f:	48 89 ce             	mov    rsi,rcx
  804fa2:	89 c7                	mov    edi,eax
  804fa4:	e8 95 d1 ff ff       	call   80213e <sys_read>
    sys_seek(exefno,tdh.e_lfanew,SEEK_SET);
  804fa9:	48 8b 85 ac fe ff ff 	mov    rax,QWORD PTR [rbp-0x154]
  804fb0:	89 c1                	mov    ecx,eax
  804fb2:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804fb5:	ba 00 00 00 00       	mov    edx,0x0
  804fba:	89 ce                	mov    esi,ecx
  804fbc:	89 c7                	mov    edi,eax
  804fbe:	e8 0c d2 ff ff       	call   8021cf <sys_seek>
    sys_read(exefno, &tnth, sizeof(tnth));
  804fc3:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  804fca:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804fcd:	ba f8 00 00 00       	mov    edx,0xf8
  804fd2:	48 89 ce             	mov    rsi,rcx
  804fd5:	89 c7                	mov    edi,eax
  804fd7:	e8 62 d1 ff ff       	call   80213e <sys_read>

    //是否需要移动base(先不检查)
    unsigned int nbase=tnth.OptionalHeader.ImageBase;
  804fdc:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  804fe2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  804fe5:	8b 85 c0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x240]
  804feb:	c1 e8 0c             	shr    eax,0xc
  804fee:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
    //use_pgm_ava检查在页表中这个范围是否可用，可用就使用
    while(1)
    {
        cont:
        ;
        int pdei=nbase/PAGE_INDEX_SIZE;
  804ff1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804ff4:	c1 e8 16             	shr    eax,0x16
  804ff7:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
        int ptei=nbase%PAGE_INDEX_SIZE/PAGE_SIZE;
  804ffa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804ffd:	25 ff ff 3f 00       	and    eax,0x3fffff
  805002:	c1 e8 0c             	shr    eax,0xc
  805005:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
        int *pt=(proc->pdet[pdei]&0xfffff000);
  805008:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  80500f:	48 8b 90 84 00 00 00 	mov    rdx,QWORD PTR [rax+0x84]
  805016:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
  805019:	48 98                	cdqe   
  80501b:	48 c1 e0 02          	shl    rax,0x2
  80501f:	48 01 d0             	add    rax,rdx
  805022:	8b 00                	mov    eax,DWORD PTR [rax]
  805024:	89 c0                	mov    eax,eax
  805026:	25 00 f0 ff ff       	and    eax,0xfffff000
  80502b:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
        for(int i=0;i<pgn;i++)
  80502f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805036:	eb 48                	jmp    805080 <load_pe+0x121>
        {
            if(pt[ptei+i%1024]&PAGE_PRESENT&&pt!=NULL)
  805038:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80503b:	99                   	cdq    
  80503c:	c1 ea 16             	shr    edx,0x16
  80503f:	01 d0                	add    eax,edx
  805041:	25 ff 03 00 00       	and    eax,0x3ff
  805046:	29 d0                	sub    eax,edx
  805048:	89 c2                	mov    edx,eax
  80504a:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  80504d:	01 d0                	add    eax,edx
  80504f:	48 98                	cdqe   
  805051:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805058:	00 
  805059:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  80505d:	48 01 d0             	add    rax,rdx
  805060:	8b 00                	mov    eax,DWORD PTR [rax]
  805062:	83 e0 01             	and    eax,0x1
  805065:	85 c0                	test   eax,eax
  805067:	74 13                	je     80507c <load_pe+0x11d>
  805069:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
  80506e:	74 0c                	je     80507c <load_pe+0x11d>
            {
                //移动base
                nbase+=0x1000;
  805070:	81 45 fc 00 10 00 00 	add    DWORD PTR [rbp-0x4],0x1000
                goto cont;
  805077:	e9 75 ff ff ff       	jmp    804ff1 <load_pe+0x92>
        for(int i=0;i<pgn;i++)
  80507c:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805080:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805083:	3b 45 90             	cmp    eax,DWORD PTR [rbp-0x70]
  805086:	7c b0                	jl     805038 <load_pe+0xd9>
            }
        }
        break;
  805088:	90                   	nop
    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_seek(exefno,0,SEEK_SET);
  805089:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  80508c:	ba 00 00 00 00       	mov    edx,0x0
  805091:	be 00 00 00 00       	mov    esi,0x0
  805096:	89 c7                	mov    edi,eax
  805098:	e8 32 d1 ff ff       	call   8021cf <sys_seek>
    sys_read(exefno, nbase, PAGE_SIZE);
  80509d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8050a0:	48 89 c1             	mov    rcx,rax
  8050a3:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8050a6:	ba 00 10 00 00       	mov    edx,0x1000
  8050ab:	48 89 ce             	mov    rsi,rcx
  8050ae:	89 c7                	mov    edi,eax
  8050b0:	e8 89 d0 ff ff       	call   80213e <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  8050b5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8050b8:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_NT_HEADERS32 nth=nbase+dosh->e_lfanew;
  8050bf:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8050c2:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8050c9:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  8050cd:	48 01 d0             	add    rax,rdx
  8050d0:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  8050d7:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8050de:	48 83 c0 04          	add    rax,0x4
  8050e2:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  8050e9:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8050f0:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  8050f3:	89 85 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],eax
    int page_count=prog_size/4096;
  8050f9:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  8050ff:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  805105:	85 c0                	test   eax,eax
  805107:	0f 48 c2             	cmovs  eax,edx
  80510a:	c1 f8 0c             	sar    eax,0xc
  80510d:	89 85 60 ff ff ff    	mov    DWORD PTR [rbp-0xa0],eax

    int shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  805113:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80511a:	8b 50 28             	mov    edx,DWORD PTR [rax+0x28]
  80511d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805120:	01 d0                	add    eax,edx
  805122:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  805128:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  80512e:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  805134:	85 c0                	test   eax,eax
  805136:	0f 48 c2             	cmovs  eax,edx
  805139:	c1 f8 0a             	sar    eax,0xa
  80513c:	89 c1                	mov    ecx,eax
  80513e:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  805144:	99                   	cdq    
  805145:	c1 ea 16             	shr    edx,0x16
  805148:	01 d0                	add    eax,edx
  80514a:	25 ff 03 00 00       	and    eax,0x3ff
  80514f:	29 d0                	sub    eax,edx
  805151:	01 c8                	add    eax,ecx
  805153:	85 c0                	test   eax,eax
  805155:	0f 95 c0             	setne  al
  805158:	0f b6 c0             	movzx  eax,al
  80515b:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  805161:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  805167:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  80516d:	85 c0                	test   eax,eax
  80516f:	0f 48 c2             	cmovs  eax,edx
  805172:	c1 f8 16             	sar    eax,0x16
  805175:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  80517b:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805182:	89 c0                	mov    eax,eax
  805184:	48 05 f8 00 00 00    	add    rax,0xf8
  80518a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  80518e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805195:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  805199:	0f b7 d0             	movzx  edx,ax
  80519c:	89 d0                	mov    eax,edx
  80519e:	c1 e0 02             	shl    eax,0x2
  8051a1:	01 d0                	add    eax,edx
  8051a3:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  8051a6:	05 3c 01 00 00       	add    eax,0x13c
  8051ab:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    int align=nth->OptionalHeader.FileAlignment;
  8051b1:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8051b8:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8051bb:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  8051c1:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  8051c7:	99                   	cdq    
  8051c8:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  8051ce:	89 d0                	mov    eax,edx
  8051d0:	85 c0                	test   eax,eax
  8051d2:	74 23                	je     8051f7 <load_pe+0x298>
  8051d4:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  8051da:	99                   	cdq    
  8051db:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  8051e1:	89 d1                	mov    ecx,edx
  8051e3:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  8051e9:	29 c8                	sub    eax,ecx
  8051eb:	89 c2                	mov    edx,eax
  8051ed:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
  8051f3:	01 d0                	add    eax,edx
  8051f5:	eb 06                	jmp    8051fd <load_pe+0x29e>
  8051f7:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  8051fd:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  805203:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80520a:	eb 68                	jmp    805274 <load_pe+0x315>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  80520c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805210:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  805213:	25 00 00 00 02       	and    eax,0x2000000
  805218:	89 85 bc fe ff ff    	mov    DWORD PTR [rbp-0x144],eax
        if(disca)
  80521e:	83 bd bc fe ff ff 00 	cmp    DWORD PTR [rbp-0x144],0x0
  805225:	75 43                	jne    80526a <load_pe+0x30b>
            continue;
        //直接读，缺页内核解决
        sys_seek(exefno,psec->PointerToRawData,SEEK_SET);
  805227:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80522b:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  80522e:	89 c1                	mov    ecx,eax
  805230:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805233:	ba 00 00 00 00       	mov    edx,0x0
  805238:	89 ce                	mov    esi,ecx
  80523a:	89 c7                	mov    edi,eax
  80523c:	e8 8e cf ff ff       	call   8021cf <sys_seek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  805241:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805245:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805248:	89 c2                	mov    edx,eax
  80524a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80524e:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
  805251:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805254:	01 c8                	add    eax,ecx
  805256:	89 c0                	mov    eax,eax
  805258:	48 89 c1             	mov    rcx,rax
  80525b:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  80525e:	48 89 ce             	mov    rsi,rcx
  805261:	89 c7                	mov    edi,eax
  805263:	e8 d6 ce ff ff       	call   80213e <sys_read>
  805268:	eb 01                	jmp    80526b <load_pe+0x30c>
            continue;
  80526a:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  80526b:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80526f:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  805274:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80527b:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  80527f:	0f b7 c0             	movzx  eax,ax
  805282:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805285:	7c 85                	jl     80520c <load_pe+0x2ad>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  805287:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80528e:	48 83 e8 80          	sub    rax,0xffffffffffffff80
  805292:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    if(impd->Size>0)
  805299:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  8052a0:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8052a3:	85 c0                	test   eax,eax
  8052a5:	0f 84 71 02 00 00    	je     80551c <load_pe+0x5bd>
    {
        int tmpi=impd->VirtualAddress+nbase;
  8052ab:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  8052b2:	8b 10                	mov    edx,DWORD PTR [rax]
  8052b4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8052b7:	01 d0                	add    eax,edx
  8052b9:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  8052bf:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  8052c5:	48 98                	cdqe   
  8052c7:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  8052cb:	e9 3e 02 00 00       	jmp    80550e <load_pe+0x5af>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  8052d0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8052d4:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  8052d7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8052da:	01 d0                	add    eax,edx
  8052dc:	89 c0                	mov    eax,eax
  8052de:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  8052e5:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  8052ec:	be c8 1b 81 00       	mov    esi,0x811bc8
  8052f1:	48 89 c7             	mov    rdi,rax
  8052f4:	e8 5b 46 00 00       	call   809954 <strcmp>
  8052f9:	85 c0                	test   eax,eax
  8052fb:	75 09                	jne    805306 <load_pe+0x3a7>
            {
                dllp=0x1c00000;
  8052fd:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  805304:	eb 25                	jmp    80532b <load_pe+0x3cc>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  805306:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  80530d:	48 89 c7             	mov    rdi,rax
  805310:	e8 4a fc ff ff       	call   804f5f <load_pe>
  805315:	89 85 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  80531b:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  805321:	89 c7                	mov    edi,eax
  805323:	e8 c9 03 00 00       	call   8056f1 <get_module_addr>
  805328:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  80532b:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80532e:	48 98                	cdqe   
  805330:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  805337:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80533a:	48 63 d0             	movsxd rdx,eax
  80533d:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  805344:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  805348:	48 01 d0             	add    rax,rdx
  80534b:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  805352:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805359:	8b 50 78             	mov    edx,DWORD PTR [rax+0x78]
  80535c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80535f:	01 d0                	add    eax,edx
  805361:	89 c0                	mov    eax,eax
  805363:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
            int funcn=dllexp->NumberOfNames;
  80536a:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805371:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  805374:	89 85 0c ff ff ff    	mov    DWORD PTR [rbp-0xf4],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  80537a:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805381:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  805384:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805387:	01 d0                	add    eax,edx
  805389:	89 c0                	mov    eax,eax
  80538b:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  805392:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805399:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80539c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80539f:	01 d0                	add    eax,edx
  8053a1:	89 c0                	mov    eax,eax
  8053a3:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  8053aa:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8053b1:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8053b4:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8053b7:	01 d0                	add    eax,edx
  8053b9:	89 c0                	mov    eax,eax
  8053bb:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  8053c2:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8053c9:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8053cc:	89 85 ec fe ff ff    	mov    DWORD PTR [rbp-0x114],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  8053d2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8053d6:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  8053d9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053dc:	01 d0                	add    eax,edx
  8053de:	89 c0                	mov    eax,eax
  8053e0:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  8053e4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8053e8:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  8053eb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053ee:	01 d0                	add    eax,edx
  8053f0:	89 c0                	mov    eax,eax
  8053f2:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  8053f6:	e9 00 01 00 00       	jmp    8054fb <load_pe+0x59c>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  8053fb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8053ff:	8b 00                	mov    eax,DWORD PTR [rax]
  805401:	85 c0                	test   eax,eax
  805403:	79 43                	jns    805448 <load_pe+0x4e9>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  805405:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805409:	8b 00                	mov    eax,DWORD PTR [rax]
  80540b:	25 ff ff ff 7f       	and    eax,0x7fffffff
  805410:	2b 85 ec fe ff ff    	sub    eax,DWORD PTR [rbp-0x114]
  805416:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  80541c:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  805422:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805429:	00 
  80542a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  805431:	48 01 d0             	add    rax,rdx
  805434:	8b 10                	mov    edx,DWORD PTR [rax]
  805436:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805439:	01 d0                	add    eax,edx
  80543b:	89 c2                	mov    edx,eax
  80543d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805441:	89 10                	mov    DWORD PTR [rax],edx
  805443:	e9 a9 00 00 00       	jmp    8054f1 <load_pe+0x592>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  805448:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80544c:	8b 00                	mov    eax,DWORD PTR [rax]
  80544e:	89 c0                	mov    eax,eax
  805450:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  805457:	48 83 85 e0 fe ff ff 	add    QWORD PTR [rbp-0x120],0x2
  80545e:	02 
                    int i=0;
  80545f:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  805466:	eb 7a                	jmp    8054e2 <load_pe+0x583>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  805468:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80546b:	48 98                	cdqe   
  80546d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805474:	00 
  805475:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  80547c:	48 01 d0             	add    rax,rdx
  80547f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805482:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
  805489:	48 89 d6             	mov    rsi,rdx
  80548c:	48 89 c7             	mov    rdi,rax
  80548f:	e8 c0 44 00 00       	call   809954 <strcmp>
  805494:	85 c0                	test   eax,eax
  805496:	75 46                	jne    8054de <load_pe+0x57f>
                        {
                            int ordi=funcords[i];
  805498:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80549b:	48 98                	cdqe   
  80549d:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  8054a1:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  8054a8:	48 01 d0             	add    rax,rdx
  8054ab:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8054ae:	98                   	cwde   
  8054af:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  8054b5:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
  8054bb:	48 98                	cdqe   
  8054bd:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8054c4:	00 
  8054c5:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8054cc:	48 01 d0             	add    rax,rdx
  8054cf:	8b 10                	mov    edx,DWORD PTR [rax]
  8054d1:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8054d4:	01 d0                	add    eax,edx
  8054d6:	89 c2                	mov    edx,eax
  8054d8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8054dc:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  8054de:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  8054e2:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8054e5:	3b 85 0c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xf4]
  8054eb:	0f 8c 77 ff ff ff    	jl     805468 <load_pe+0x509>
                        }
                    }
                }
                iataddrs++;
  8054f1:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  8054f6:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  8054fb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8054ff:	8b 00                	mov    eax,DWORD PTR [rax]
  805501:	85 c0                	test   eax,eax
  805503:	0f 85 f2 fe ff ff    	jne    8053fb <load_pe+0x49c>
            }
            impdes++;
  805509:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  80550e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805512:	8b 00                	mov    eax,DWORD PTR [rax]
  805514:	85 c0                	test   eax,eax
  805516:	0f 85 b4 fd ff ff    	jne    8052d0 <load_pe+0x371>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  80551c:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  805523:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  805524:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80552b:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [rax+0xa4]
  805531:	85 c0                	test   eax,eax
  805533:	0f 84 e8 00 00 00    	je     805621 <load_pe+0x6c2>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  805539:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805540:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [rax+0xa0]
  805546:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805549:	01 d0                	add    eax,edx
  80554b:	89 c0                	mov    eax,eax
  80554d:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                                +(u32)nbase);
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  805551:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805555:	48 83 c0 40          	add    rax,0x40
  805559:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  80555d:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805561:	48 83 c0 02          	add    rax,0x2
  805565:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  805569:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805570:	8b 40 34             	mov    eax,DWORD PTR [rax+0x34]
  805573:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
        while(relp->VirtualAddress){
  805579:	e9 95 00 00 00       	jmp    805613 <load_pe+0x6b4>
            int pgva=relp->VirtualAddress+nbase;
  80557e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805582:	8b 10                	mov    edx,DWORD PTR [rax]
  805584:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805587:	01 d0                	add    eax,edx
  805589:	89 85 d0 fe ff ff    	mov    DWORD PTR [rbp-0x130],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  80558f:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  805596:	eb 59                	jmp    8055f1 <load_pe+0x692>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  805598:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80559c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80559f:	66 85 c0             	test   ax,ax
  8055a2:	74 48                	je     8055ec <load_pe+0x68d>
                int *at=*reloc+pgva;//要重定位的数据的地址
  8055a4:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8055a8:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8055ab:	0f b7 d0             	movzx  edx,ax
  8055ae:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  8055b4:	01 d0                	add    eax,edx
  8055b6:	48 98                	cdqe   
  8055b8:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
                *at=*at-old_base+nbase;
  8055bf:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  8055c6:	8b 00                	mov    eax,DWORD PTR [rax]
  8055c8:	2b 85 d4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x12c]
  8055ce:	89 c2                	mov    edx,eax
  8055d0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8055d3:	01 d0                	add    eax,edx
  8055d5:	89 c2                	mov    edx,eax
  8055d7:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  8055de:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  8055e0:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  8055e5:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  8055ea:	eb 01                	jmp    8055ed <load_pe+0x68e>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8055ec:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8055ed:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  8055f1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8055f5:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8055f8:	c1 e8 02             	shr    eax,0x2
  8055fb:	89 c2                	mov    edx,eax
  8055fd:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  805600:	39 c2                	cmp    edx,eax
  805602:	77 94                	ja     805598 <load_pe+0x639>
            }
            relp=(int)relp+0x1000;
  805604:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805608:	05 00 10 00 00       	add    eax,0x1000
  80560d:	48 98                	cdqe   
  80560f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  805613:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805617:	8b 00                	mov    eax,DWORD PTR [rax]
  805619:	85 c0                	test   eax,eax
  80561b:	0f 85 5d ff ff ff    	jne    80557e <load_pe+0x61f>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  805621:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  805628:	00 00 00 
  80562b:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  805632:	00 00 00 
  805635:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  80563c:	00 00 00 00 
  805640:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  805647:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  80564b:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  805652:	ba 18 00 00 00       	mov    edx,0x18
  805657:	48 89 c6             	mov    rsi,rax
  80565a:	bf 00 00 00 01       	mov    edi,0x1000000
  80565f:	e8 52 40 00 00       	call   8096b6 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  805664:	8b 05 06 ca c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ca06]        # 412070 <cur_proc>
  80566a:	48 98                	cdqe   
  80566c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  805673:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805679:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  805680:	8b 05 ea c9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0c9ea]        # 412070 <cur_proc>
  805686:	48 98                	cdqe   
  805688:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80568f:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805695:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  80569c:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8056a2:	48 98                	cdqe   
  8056a4:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
    task[cur_proc].exit_code=main(0,NULL);
  8056ab:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
  8056b2:	be 00 00 00 00       	mov    esi,0x0
  8056b7:	bf 00 00 00 00       	mov    edi,0x0
  8056bc:	ff d0                	call   rax
  8056be:	8b 15 ac c9 c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0c9ac]        # 412070 <cur_proc>
  8056c4:	89 c1                	mov    ecx,eax
  8056c6:	48 63 c2             	movsxd rax,edx
  8056c9:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8056d0:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8056d6:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  8056d8:	8b 05 92 c9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0c992]        # 412070 <cur_proc>
  8056de:	48 98                	cdqe   
  8056e0:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8056e7:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8056ed:	8b 00                	mov    eax,DWORD PTR [rax]
}
  8056ef:	c9                   	leave  
  8056f0:	c3                   	ret    

00000000008056f1 <get_module_addr>:

int get_module_addr(int mi)
{
  8056f1:	f3 0f 1e fa          	endbr64 
  8056f5:	55                   	push   rbp
  8056f6:	48 89 e5             	mov    rbp,rsp
  8056f9:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  8056fc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8056ff:	48 98                	cdqe   
  805701:	8b 04 c5 80 4c 42 00 	mov    eax,DWORD PTR [rax*8+0x424c80]
}
  805708:	5d                   	pop    rbp
  805709:	c3                   	ret    

000000000080570a <dispose_library>:
int dispose_library(int dlln)
{
  80570a:	f3 0f 1e fa          	endbr64 
  80570e:	55                   	push   rbp
  80570f:	48 89 e5             	mov    rbp,rsp
  805712:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  805715:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805719:	78 09                	js     805724 <dispose_library+0x1a>
  80571b:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  805722:	7e 07                	jle    80572b <dispose_library+0x21>
  805724:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805729:	eb 1d                	jmp    805748 <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  80572b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80572e:	48 98                	cdqe   
  805730:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  805737:	48 05 88 20 41 00    	add    rax,0x412088
  80573d:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  805743:	b8 00 00 00 00       	mov    eax,0x0
}
  805748:	5d                   	pop    rbp
  805749:	c3                   	ret    

000000000080574a <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  80574a:	f3 0f 1e fa          	endbr64 
  80574e:	55                   	push   rbp
  80574f:	48 89 e5             	mov    rbp,rsp
  805752:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  805756:	90                   	nop
  805757:	5d                   	pop    rbp
  805758:	c3                   	ret    

0000000000805759 <sys_rmmod>:
int sys_rmmod(char *name)
{
  805759:	f3 0f 1e fa          	endbr64 
  80575d:	55                   	push   rbp
  80575e:	48 89 e5             	mov    rbp,rsp
  805761:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  805765:	90                   	nop
  805766:	5d                   	pop    rbp
  805767:	c3                   	ret    
  805768:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  80576f:	00 

0000000000805770 <_syscall>:
  805770:	57                   	push   rdi
  805771:	56                   	push   rsi
  805772:	52                   	push   rdx
  805773:	51                   	push   rcx
  805774:	53                   	push   rbx
  805775:	50                   	push   rax
  805776:	e8 f3 ad ff ff       	call   80056e <syscall>
  80577b:	48 83 c4 18          	add    rsp,0x18
  80577f:	cf                   	iret   

0000000000805780 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  805780:	f3 0f 1e fa          	endbr64 
  805784:	55                   	push   rbp
  805785:	48 89 e5             	mov    rbp,rsp
  805788:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  80578c:	8b 05 02 f9 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f902]        # 425094 <framebuffer+0x14>
  805792:	89 c0                	mov    eax,eax
  805794:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  805798:	8b 05 fa f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f8fa]        # 425098 <framebuffer+0x18>
  80579e:	89 c0                	mov    eax,eax
  8057a0:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  8057a4:	0f b6 05 f1 f8 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f8f1]        # 42509c <framebuffer+0x1c>
  8057ab:	c0 e8 03             	shr    al,0x3
  8057ae:	0f b6 c0             	movzx  eax,al
  8057b1:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  8057b5:	8b 05 d5 f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f8d5]        # 425090 <framebuffer+0x10>
  8057bb:	89 c0                	mov    eax,eax
  8057bd:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  8057c1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8057c5:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  8057ca:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  8057ce:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8057d2:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  8057d7:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  8057db:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8057df:	48 c1 e8 0c          	shr    rax,0xc
  8057e3:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  8057e6:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  8057ed:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  8057ee:	48 8b 05 93 f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f893]        # 425088 <framebuffer+0x8>
  8057f5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  8057f9:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  805800:	00 
  805801:	eb 2d                	jmp    805830 <init_framebuffer+0xb0>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  805803:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  805807:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80580b:	ba 07 00 00 00       	mov    edx,0x7
  805810:	48 89 ce             	mov    rsi,rcx
  805813:	48 89 c7             	mov    rdi,rax
  805816:	e8 24 b6 ff ff       	call   800e3f <mmap>
        pp+=PAGE_SIZE;
  80581b:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  805822:	00 
        p+=PAGE_SIZE;
  805823:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  80582a:	00 
    for (size_t i = 0; i < pgc; i++)
  80582b:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  805830:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  805833:	48 98                	cdqe   
  805835:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  805839:	72 c8                	jb     805803 <init_framebuffer+0x83>
    }
    
    
}
  80583b:	90                   	nop
  80583c:	90                   	nop
  80583d:	c9                   	leave  
  80583e:	c3                   	ret    

000000000080583f <init_font>:
void init_font(){
  80583f:	f3 0f 1e fa          	endbr64 
  805843:	55                   	push   rbp
  805844:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  805847:	48 c7 05 6e f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f86e],0x80a268        # 4250c0 <boot_font>
  80584e:	68 a2 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  805852:	48 8b 05 67 f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f867]        # 4250c0 <boot_font>
  805859:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  80585c:	83 c0 07             	add    eax,0x7
  80585f:	c1 e8 03             	shr    eax,0x3
  805862:	89 05 68 f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f868],eax        # 4250d0 <font_width_bytes>
    font_width = font_width_bytes * 8;
  805868:	8b 05 62 f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f862]        # 4250d0 <font_width_bytes>
  80586e:	c1 e0 03             	shl    eax,0x3
  805871:	89 05 51 f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f851],eax        # 4250c8 <font_width>
    font_height = boot_font->height;
  805877:	48 8b 05 42 f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f842]        # 4250c0 <boot_font>
  80587e:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  805881:	89 05 45 f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f845],eax        # 4250cc <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  805887:	48 8b 05 32 f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f832]        # 4250c0 <boot_font>
  80588e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  805891:	89 c0                	mov    eax,eax
  805893:	48 05 68 a2 80 00    	add    rax,0x80a268
  805899:	48 89 05 38 f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f838],rax        # 4250d8 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  8058a0:	48 8b 05 19 f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f819]        # 4250c0 <boot_font>
  8058a7:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8058aa:	89 05 34 f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f834],eax        # 4250e4 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  8058b0:	48 8b 05 09 f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f809]        # 4250c0 <boot_font>
  8058b7:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8058ba:	89 05 20 f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f820],eax        # 4250e0 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  8058c0:	c7 05 e6 f7 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f7e6],0x0        # 4250b0 <fb_cursor_y>
  8058c7:	00 00 00 
  8058ca:	8b 05 e0 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7e0]        # 4250b0 <fb_cursor_y>
  8058d0:	89 05 d6 f7 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f7d6],eax        # 4250ac <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width *framebuffer.common.framebuffer_bpp/8 / font_width;
  8058d6:	8b 15 b8 f7 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f7b8]        # 425094 <framebuffer+0x14>
  8058dc:	0f b6 05 b9 f7 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f7b9]        # 42509c <framebuffer+0x1c>
  8058e3:	0f b6 c0             	movzx  eax,al
  8058e6:	0f af c2             	imul   eax,edx
  8058e9:	c1 e8 03             	shr    eax,0x3
  8058ec:	8b 0d d6 f7 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f7d6]        # 4250c8 <font_width>
  8058f2:	ba 00 00 00 00       	mov    edx,0x0
  8058f7:	f7 f1                	div    ecx
  8058f9:	89 05 b5 f7 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f7b5],eax        # 4250b4 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height *framebuffer.common.framebuffer_bpp/8 / font_height;
  8058ff:	8b 15 93 f7 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f793]        # 425098 <framebuffer+0x18>
  805905:	0f b6 05 90 f7 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f790]        # 42509c <framebuffer+0x1c>
  80590c:	0f b6 c0             	movzx  eax,al
  80590f:	0f af c2             	imul   eax,edx
  805912:	c1 e8 03             	shr    eax,0x3
  805915:	8b 35 b1 f7 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1f7b1]        # 4250cc <font_height>
  80591b:	ba 00 00 00 00       	mov    edx,0x0
  805920:	f7 f6                	div    esi
  805922:	89 05 90 f7 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f790],eax        # 4250b8 <max_ch_nr_y>
    font_size=1;
  805928:	c7 05 76 47 00 00 01 	mov    DWORD PTR [rip+0x4776],0x1        # 80a0a8 <font_size>
  80592f:	00 00 00 
}
  805932:	90                   	nop
  805933:	5d                   	pop    rbp
  805934:	c3                   	ret    

0000000000805935 <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  805935:	f3 0f 1e fa          	endbr64 
  805939:	55                   	push   rbp
  80593a:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  80593d:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  805941:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  805945:	48 89 05 34 f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f734],rax        # 425080 <framebuffer>
  80594c:	48 89 15 35 f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f735],rdx        # 425088 <framebuffer+0x8>
  805953:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  805957:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  80595b:	48 89 05 2e f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f72e],rax        # 425090 <framebuffer+0x10>
  805962:	48 89 15 2f f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f72f],rdx        # 425098 <framebuffer+0x18>
  805969:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  80596d:	48 89 05 2c f7 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f72c],rax        # 4250a0 <framebuffer+0x20>
}
  805974:	90                   	nop
  805975:	5d                   	pop    rbp
  805976:	c3                   	ret    

0000000000805977 <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  805977:	f3 0f 1e fa          	endbr64 
  80597b:	55                   	push   rbp
  80597c:	48 89 e5             	mov    rbp,rsp
  80597f:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  805982:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805985:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805988:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  80598b:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  80598f:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  805996:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  805997:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80599a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  80599d:	eb 64                	jmp    805a03 <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  80599f:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8059a2:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  8059a5:	eb 4b                	jmp    8059f2 <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  8059a7:	8b 15 e3 f6 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f6e3]        # 425090 <framebuffer+0x10>
  8059ad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8059b0:	0f af c2             	imul   eax,edx
  8059b3:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  8059b5:	0f b6 05 e0 f6 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f6e0]        # 42509c <framebuffer+0x1c>
  8059bc:	0f b6 c0             	movzx  eax,al
  8059bf:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  8059c3:	8d 50 07             	lea    edx,[rax+0x7]
  8059c6:	85 c0                	test   eax,eax
  8059c8:	0f 48 c2             	cmovs  eax,edx
  8059cb:	c1 f8 03             	sar    eax,0x3
  8059ce:	48 98                	cdqe   
  8059d0:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  8059d3:	48 05 00 00 00 40    	add    rax,0x40000000
  8059d9:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  8059dd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8059e1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  8059e5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8059e9:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  8059ec:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  8059ee:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8059f2:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  8059f5:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8059f8:	01 d0                	add    eax,edx
  8059fa:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  8059fd:	7c a8                	jl     8059a7 <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  8059ff:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805a03:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  805a06:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805a09:	01 d0                	add    eax,edx
  805a0b:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  805a0e:	7c 8f                	jl     80599f <fill_rect+0x28>
        }
    }
}
  805a10:	90                   	nop
  805a11:	90                   	nop
  805a12:	5d                   	pop    rbp
  805a13:	c3                   	ret    

0000000000805a14 <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  805a14:	f3 0f 1e fa          	endbr64 
  805a18:	55                   	push   rbp
  805a19:	48 89 e5             	mov    rbp,rsp
  805a1c:	48 83 ec 30          	sub    rsp,0x30
  805a20:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  805a23:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805a26:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  805a29:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  805a2d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805a30:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  805a33:	eb 5a                	jmp    805a8f <draw_text+0x7b>
    {
        if(*str=='\n')
  805a35:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805a39:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a3c:	3c 0a                	cmp    al,0xa
  805a3e:	75 1c                	jne    805a5c <draw_text+0x48>
        {
            y+=font_height*size;
  805a40:	8b 15 86 f6 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f686]        # 4250cc <font_height>
  805a46:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  805a49:	0f af d0             	imul   edx,eax
  805a4c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805a4f:	01 d0                	add    eax,edx
  805a51:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  805a54:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805a57:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805a5a:	eb 2e                	jmp    805a8a <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  805a5c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805a60:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a63:	0f be c8             	movsx  ecx,al
  805a66:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805a69:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  805a6c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a6f:	89 c7                	mov    edi,eax
  805a71:	e8 28 00 00 00       	call   805a9e <draw_letter>
            tx+=size*font_width;
  805a76:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805a79:	8b 05 49 f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f649]        # 4250c8 <font_width>
  805a7f:	0f af d0             	imul   edx,eax
  805a82:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a85:	01 d0                	add    eax,edx
  805a87:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  805a8a:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  805a8f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805a93:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a96:	84 c0                	test   al,al
  805a98:	75 9b                	jne    805a35 <draw_text+0x21>
    }
}
  805a9a:	90                   	nop
  805a9b:	90                   	nop
  805a9c:	c9                   	leave  
  805a9d:	c3                   	ret    

0000000000805a9e <draw_letter>:
void draw_letter(int x, int y, int size, char c) {
  805a9e:	f3 0f 1e fa          	endbr64 
  805aa2:	55                   	push   rbp
  805aa3:	48 89 e5             	mov    rbp,rsp
  805aa6:	48 83 ec 30          	sub    rsp,0x30
  805aaa:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  805aad:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805ab0:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805ab3:	89 c8                	mov    eax,ecx
  805ab5:	88 45 d0             	mov    BYTE PTR [rbp-0x30],al
    u8 *glyph = glyph_table;
  805ab8:	48 8b 05 19 f6 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f619]        # 4250d8 <glyph_table>
  805abf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  805ac3:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805ac7:	8b 05 17 f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f617]        # 4250e4 <glyph_nr>
  805acd:	39 c2                	cmp    edx,eax
  805acf:	73 13                	jae    805ae4 <draw_letter+0x46>
        glyph += c * bytes_per_glyph;
  805ad1:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805ad5:	8b 05 05 f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f605]        # 4250e0 <bytes_per_glyph>
  805adb:	0f af c2             	imul   eax,edx
  805ade:	89 c0                	mov    eax,eax
  805ae0:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805ae4:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805aeb:	e9 c9 00 00 00       	jmp    805bb9 <draw_letter+0x11b>
        u8 mask = 1 << 7;
  805af0:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805af4:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805afb:	e9 9a 00 00 00       	jmp    805b9a <draw_letter+0xfc>
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  805b00:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805b03:	c1 e8 03             	shr    eax,0x3
  805b06:	89 c2                	mov    edx,eax
  805b08:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805b0c:	48 01 d0             	add    rax,rdx
  805b0f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805b12:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  805b15:	84 c0                	test   al,al
  805b17:	74 37                	je     805b50 <draw_letter+0xb2>
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,-1);
  805b19:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805b1c:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  805b20:	89 c2                	mov    edx,eax
  805b22:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805b25:	01 d0                	add    eax,edx
  805b27:	89 c6                	mov    esi,eax
  805b29:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805b2c:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  805b30:	89 c2                	mov    edx,eax
  805b32:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805b35:	01 d0                	add    eax,edx
  805b37:	89 c7                	mov    edi,eax
  805b39:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805b3c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805b3f:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
  805b45:	89 d1                	mov    ecx,edx
  805b47:	89 c2                	mov    edx,eax
  805b49:	e8 29 fe ff ff       	call   805977 <fill_rect>
  805b4e:	eb 35                	jmp    805b85 <draw_letter+0xe7>
            } else {
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,0);
  805b50:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805b53:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  805b57:	89 c2                	mov    edx,eax
  805b59:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805b5c:	01 d0                	add    eax,edx
  805b5e:	89 c6                	mov    esi,eax
  805b60:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805b63:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  805b67:	89 c2                	mov    edx,eax
  805b69:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805b6c:	01 d0                	add    eax,edx
  805b6e:	89 c7                	mov    edi,eax
  805b70:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805b73:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805b76:	41 b8 00 00 00 00    	mov    r8d,0x0
  805b7c:	89 d1                	mov    ecx,edx
  805b7e:	89 c2                	mov    edx,eax
  805b80:	e8 f2 fd ff ff       	call   805977 <fill_rect>
            }

            mask >>= 1;
  805b85:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  805b88:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805b8b:	83 e0 07             	and    eax,0x7
  805b8e:	85 c0                	test   eax,eax
  805b90:	75 04                	jne    805b96 <draw_letter+0xf8>
                mask = 1 << 7;
  805b92:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805b96:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805b9a:	8b 05 28 f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f528]        # 4250c8 <font_width>
  805ba0:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805ba3:	0f 82 57 ff ff ff    	jb     805b00 <draw_letter+0x62>
            }
        }

        glyph += font_width_bytes;
  805ba9:	8b 05 21 f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f521]        # 4250d0 <font_width_bytes>
  805baf:	89 c0                	mov    eax,eax
  805bb1:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805bb5:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805bb9:	8b 05 0d f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f50d]        # 4250cc <font_height>
  805bbf:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  805bc2:	0f 82 28 ff ff ff    	jb     805af0 <draw_letter+0x52>
    }
}
  805bc8:	90                   	nop
  805bc9:	90                   	nop
  805bca:	c9                   	leave  
  805bcb:	c3                   	ret    

0000000000805bcc <scr_up>:
//向上滚动一个像素
void scr_up(){
  805bcc:	f3 0f 1e fa          	endbr64 
  805bd0:	55                   	push   rbp
  805bd1:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805bd4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805bdb:	eb 6c                	jmp    805c49 <scr_up+0x7d>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805bdd:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805be4:	eb 52                	jmp    805c38 <scr_up+0x6c>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805be6:	8b 15 a4 f4 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f4a4]        # 425090 <framebuffer+0x10>
  805bec:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805bef:	0f af c2             	imul   eax,edx
  805bf2:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  805bf4:	0f b6 05 a1 f4 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f4a1]        # 42509c <framebuffer+0x1c>
  805bfb:	0f b6 c0             	movzx  eax,al
  805bfe:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805c02:	8d 50 07             	lea    edx,[rax+0x7]
  805c05:	85 c0                	test   eax,eax
  805c07:	0f 48 c2             	cmovs  eax,edx
  805c0a:	c1 f8 03             	sar    eax,0x3
  805c0d:	48 98                	cdqe   
  805c0f:	48 01 c8             	add    rax,rcx
  805c12:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805c18:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  805c1c:	8b 05 6e f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f46e]        # 425090 <framebuffer+0x10>
  805c22:	89 c2                	mov    edx,eax
  805c24:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805c28:	48 01 d0             	add    rax,rdx
  805c2b:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  805c2e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805c32:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805c34:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805c38:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805c3b:	8b 05 73 f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f473]        # 4250b4 <max_ch_nr_x>
  805c41:	39 c2                	cmp    edx,eax
  805c43:	72 a1                	jb     805be6 <scr_up+0x1a>
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805c45:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805c49:	8b 05 69 f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f469]        # 4250b8 <max_ch_nr_y>
  805c4f:	8d 50 ff             	lea    edx,[rax-0x1]
  805c52:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c55:	39 c2                	cmp    edx,eax
  805c57:	77 84                	ja     805bdd <scr_up+0x11>
        }

    }
}
  805c59:	90                   	nop
  805c5a:	90                   	nop
  805c5b:	5d                   	pop    rbp
  805c5c:	c3                   	ret    

0000000000805c5d <scr_down>:
void scr_down(){
  805c5d:	f3 0f 1e fa          	endbr64 
  805c61:	55                   	push   rbp
  805c62:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  805c65:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  805c6c:	eb 72                	jmp    805ce0 <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805c6e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805c75:	eb 58                	jmp    805ccf <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805c77:	8b 15 13 f4 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f413]        # 425090 <framebuffer+0x10>
  805c7d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c80:	0f af c2             	imul   eax,edx
  805c83:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  805c85:	0f b6 05 10 f4 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f410]        # 42509c <framebuffer+0x1c>
  805c8c:	0f b6 c0             	movzx  eax,al
  805c8f:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805c93:	8d 50 07             	lea    edx,[rax+0x7]
  805c96:	85 c0                	test   eax,eax
  805c98:	0f 48 c2             	cmovs  eax,edx
  805c9b:	c1 f8 03             	sar    eax,0x3
  805c9e:	48 98                	cdqe   
  805ca0:	48 01 c8             	add    rax,rcx
  805ca3:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805ca9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  805cad:	8b 05 dd f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f3dd]        # 425090 <framebuffer+0x10>
  805cb3:	89 c0                	mov    eax,eax
  805cb5:	48 f7 d8             	neg    rax
  805cb8:	48 89 c2             	mov    rdx,rax
  805cbb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805cbf:	48 01 d0             	add    rax,rdx
  805cc2:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  805cc5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805cc9:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805ccb:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805ccf:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805cd2:	8b 05 dc f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f3dc]        # 4250b4 <max_ch_nr_x>
  805cd8:	39 c2                	cmp    edx,eax
  805cda:	72 9b                	jb     805c77 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  805cdc:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805ce0:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  805ce3:	8b 05 cf f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f3cf]        # 4250b8 <max_ch_nr_y>
  805ce9:	39 c2                	cmp    edx,eax
  805ceb:	72 81                	jb     805c6e <scr_down+0x11>
        }

    }
}
  805ced:	90                   	nop
  805cee:	90                   	nop
  805cef:	5d                   	pop    rbp
  805cf0:	c3                   	ret    

0000000000805cf1 <print>:
void print(char* s){
  805cf1:	f3 0f 1e fa          	endbr64 
  805cf5:	55                   	push   rbp
  805cf6:	48 89 e5             	mov    rbp,rsp
  805cf9:	48 83 ec 18          	sub    rsp,0x18
  805cfd:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(;*s;s++){
  805d01:	e9 f7 00 00 00       	jmp    805dfd <print+0x10c>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  805d06:	8b 15 a0 f3 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f3a0]        # 4250ac <fb_cursor_x>
  805d0c:	8b 05 a2 f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f3a2]        # 4250b4 <max_ch_nr_x>
  805d12:	39 c2                	cmp    edx,eax
  805d14:	77 0b                	ja     805d21 <print+0x30>
  805d16:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805d1a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d1d:	3c 0a                	cmp    al,0xa
  805d1f:	75 19                	jne    805d3a <print+0x49>
        {
            fb_cursor_y+=1;
  805d21:	8b 05 89 f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f389]        # 4250b0 <fb_cursor_y>
  805d27:	83 c0 01             	add    eax,0x1
  805d2a:	89 05 80 f3 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f380],eax        # 4250b0 <fb_cursor_y>
            fb_cursor_x=0;
  805d30:	c7 05 72 f3 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f372],0x0        # 4250ac <fb_cursor_x>
  805d37:	00 00 00 
        }
        if(*s=='\n')continue;
  805d3a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805d3e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d41:	3c 0a                	cmp    al,0xa
  805d43:	0f 84 ae 00 00 00    	je     805df7 <print+0x106>
        if(fb_cursor_y>=max_ch_nr_y){
  805d49:	8b 15 61 f3 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f361]        # 4250b0 <fb_cursor_y>
  805d4f:	8b 05 63 f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f363]        # 4250b8 <max_ch_nr_y>
  805d55:	39 c2                	cmp    edx,eax
  805d57:	72 3c                	jb     805d95 <print+0xa4>
            for(int i=0;i<font_height*font_size;i++)
  805d59:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805d60:	eb 0e                	jmp    805d70 <print+0x7f>
                scr_up();
  805d62:	b8 00 00 00 00       	mov    eax,0x0
  805d67:	e8 60 fe ff ff       	call   805bcc <scr_up>
            for(int i=0;i<font_height*font_size;i++)
  805d6c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805d70:	8b 05 56 f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f356]        # 4250cc <font_height>
  805d76:	8b 15 2c 43 00 00    	mov    edx,DWORD PTR [rip+0x432c]        # 80a0a8 <font_size>
  805d7c:	0f af d0             	imul   edx,eax
  805d7f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805d82:	39 c2                	cmp    edx,eax
  805d84:	77 dc                	ja     805d62 <print+0x71>
            fb_cursor_y=max_ch_nr_y-1;
  805d86:	8b 05 2c f3 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f32c]        # 4250b8 <max_ch_nr_y>
  805d8c:	83 e8 01             	sub    eax,0x1
  805d8f:	89 05 1b f3 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f31b],eax        # 4250b0 <fb_cursor_y>
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  805d95:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805d99:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d9c:	0f be d0             	movsx  edx,al
  805d9f:	8b 05 03 43 00 00    	mov    eax,DWORD PTR [rip+0x4303]        # 80a0a8 <font_size>
  805da5:	8b 35 05 f3 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1f305]        # 4250b0 <fb_cursor_y>
  805dab:	8b 0d 1b f3 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f31b]        # 4250cc <font_height>
  805db1:	0f af ce             	imul   ecx,esi
  805db4:	8b 35 ee 42 00 00    	mov    esi,DWORD PTR [rip+0x42ee]        # 80a0a8 <font_size>
  805dba:	0f af ce             	imul   ecx,esi
  805dbd:	41 89 c8             	mov    r8d,ecx
  805dc0:	8b 35 e6 f2 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1f2e6]        # 4250ac <fb_cursor_x>
  805dc6:	8b 0d fc f2 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f2fc]        # 4250c8 <font_width>
  805dcc:	0f af ce             	imul   ecx,esi
  805dcf:	8b 35 d3 42 00 00    	mov    esi,DWORD PTR [rip+0x42d3]        # 80a0a8 <font_size>
  805dd5:	0f af ce             	imul   ecx,esi
  805dd8:	89 cf                	mov    edi,ecx
  805dda:	89 d1                	mov    ecx,edx
  805ddc:	89 c2                	mov    edx,eax
  805dde:	44 89 c6             	mov    esi,r8d
  805de1:	e8 b8 fc ff ff       	call   805a9e <draw_letter>
        fb_cursor_x+=1;
  805de6:	8b 05 c0 f2 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f2c0]        # 4250ac <fb_cursor_x>
  805dec:	83 c0 01             	add    eax,0x1
  805def:	89 05 b7 f2 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f2b7],eax        # 4250ac <fb_cursor_x>
  805df5:	eb 01                	jmp    805df8 <print+0x107>
        if(*s=='\n')continue;
  805df7:	90                   	nop
    for(;*s;s++){
  805df8:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  805dfd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805e01:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805e04:	84 c0                	test   al,al
  805e06:	0f 85 fa fe ff ff    	jne    805d06 <print+0x15>
    }
}
  805e0c:	90                   	nop
  805e0d:	90                   	nop
  805e0e:	c9                   	leave  
  805e0f:	c3                   	ret    

0000000000805e10 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  805e10:	f3 0f 1e fa          	endbr64 
  805e14:	55                   	push   rbp
  805e15:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  805e18:	0f b6 05 ee fc c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fcee]        # 425b0d <k_shift>
  805e1f:	84 c0                	test   al,al
  805e21:	0f 94 c0             	sete   al
  805e24:	88 05 e3 fc c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fce3],al        # 425b0d <k_shift>
}
  805e2a:	90                   	nop
  805e2b:	5d                   	pop    rbp
  805e2c:	c3                   	ret    

0000000000805e2d <ctrl>:
void ctrl()
{
  805e2d:	f3 0f 1e fa          	endbr64 
  805e31:	55                   	push   rbp
  805e32:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  805e35:	0f b6 05 d2 fc c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fcd2]        # 425b0e <k_ctrl>
  805e3c:	84 c0                	test   al,al
  805e3e:	0f 94 c0             	sete   al
  805e41:	88 05 c7 fc c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fcc7],al        # 425b0e <k_ctrl>
}
  805e47:	90                   	nop
  805e48:	5d                   	pop    rbp
  805e49:	c3                   	ret    

0000000000805e4a <capslock>:
void capslock()
{
  805e4a:	f3 0f 1e fa          	endbr64 
  805e4e:	55                   	push   rbp
  805e4f:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  805e52:	0f b6 05 b6 fc c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fcb6]        # 425b0f <k_capslock>
  805e59:	84 c0                	test   al,al
  805e5b:	0f 94 c0             	sete   al
  805e5e:	88 05 ab fc c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fcab],al        # 425b0f <k_capslock>
}
  805e64:	90                   	nop
  805e65:	5d                   	pop    rbp
  805e66:	c3                   	ret    

0000000000805e67 <to_ascii>:
char to_ascii(char scan_code)
{
  805e67:	f3 0f 1e fa          	endbr64 
  805e6b:	55                   	push   rbp
  805e6c:	48 89 e5             	mov    rbp,rsp
  805e6f:	89 f8                	mov    eax,edi
  805e71:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  805e74:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805e7b:	e9 c7 00 00 00       	jmp    805f47 <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  805e80:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805e83:	48 63 d0             	movsxd rdx,eax
  805e86:	48 89 d0             	mov    rax,rdx
  805e89:	48 c1 e0 02          	shl    rax,0x2
  805e8d:	48 01 d0             	add    rax,rdx
  805e90:	48 05 42 1d 81 00    	add    rax,0x811d42
  805e96:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805e99:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  805e9c:	0f 85 a1 00 00 00    	jne    805f43 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  805ea2:	0f b6 05 66 fc c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fc66]        # 425b0f <k_capslock>
  805ea9:	84 c0                	test   al,al
  805eab:	74 55                	je     805f02 <to_ascii+0x9b>
  805ead:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805eb0:	48 63 d0             	movsxd rdx,eax
  805eb3:	48 89 d0             	mov    rax,rdx
  805eb6:	48 c1 e0 02          	shl    rax,0x2
  805eba:	48 01 d0             	add    rax,rdx
  805ebd:	48 05 40 1d 81 00    	add    rax,0x811d40
  805ec3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805ec6:	3c 60                	cmp    al,0x60
  805ec8:	7e 38                	jle    805f02 <to_ascii+0x9b>
  805eca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805ecd:	48 63 d0             	movsxd rdx,eax
  805ed0:	48 89 d0             	mov    rax,rdx
  805ed3:	48 c1 e0 02          	shl    rax,0x2
  805ed7:	48 01 d0             	add    rax,rdx
  805eda:	48 05 40 1d 81 00    	add    rax,0x811d40
  805ee0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805ee3:	3c 7a                	cmp    al,0x7a
  805ee5:	7f 1b                	jg     805f02 <to_ascii+0x9b>
  805ee7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805eea:	48 63 d0             	movsxd rdx,eax
  805eed:	48 89 d0             	mov    rax,rdx
  805ef0:	48 c1 e0 02          	shl    rax,0x2
  805ef4:	48 01 d0             	add    rax,rdx
  805ef7:	48 05 41 1d 81 00    	add    rax,0x811d41
  805efd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805f00:	eb 54                	jmp    805f56 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  805f02:	0f b6 05 04 fc c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fc04]        # 425b0d <k_shift>
  805f09:	84 c0                	test   al,al
  805f0b:	74 1b                	je     805f28 <to_ascii+0xc1>
  805f0d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f10:	48 63 d0             	movsxd rdx,eax
  805f13:	48 89 d0             	mov    rax,rdx
  805f16:	48 c1 e0 02          	shl    rax,0x2
  805f1a:	48 01 d0             	add    rax,rdx
  805f1d:	48 05 41 1d 81 00    	add    rax,0x811d41
  805f23:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805f26:	eb 2e                	jmp    805f56 <to_ascii+0xef>
            else return key_map[i].ascii;
  805f28:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f2b:	48 63 d0             	movsxd rdx,eax
  805f2e:	48 89 d0             	mov    rax,rdx
  805f31:	48 c1 e0 02          	shl    rax,0x2
  805f35:	48 01 d0             	add    rax,rdx
  805f38:	48 05 40 1d 81 00    	add    rax,0x811d40
  805f3e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805f41:	eb 13                	jmp    805f56 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  805f43:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805f47:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  805f4b:	0f 8e 2f ff ff ff    	jle    805e80 <to_ascii+0x19>
        }

    return '\0';
  805f51:	b8 00 00 00 00       	mov    eax,0x0
}
  805f56:	5d                   	pop    rbp
  805f57:	c3                   	ret    

0000000000805f58 <init_kb>:
int init_kb()
{
  805f58:	f3 0f 1e fa          	endbr64 
  805f5c:	55                   	push   rbp
  805f5d:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  805f60:	bf 80 1c 81 00       	mov    edi,0x811c80
  805f65:	e8 62 cb ff ff       	call   802acc <reg_device>
    reg_driver(&drv_keyboard);
  805f6a:	bf e0 1b 81 00       	mov    edi,0x811be0
  805f6f:	e8 40 ce ff ff       	call   802db4 <reg_driver>
}
  805f74:	90                   	nop
  805f75:	5d                   	pop    rbp
  805f76:	c3                   	ret    

0000000000805f77 <key_proc>:
int key_proc()
{
  805f77:	f3 0f 1e fa          	endbr64 
  805f7b:	55                   	push   rbp
  805f7c:	48 89 e5             	mov    rbp,rsp
  805f7f:	48 83 ec 10          	sub    rsp,0x10
    //TODO:改成简单的插入键盘缓冲区，不需要翻译功能，翻译可以之后让别的模块调用
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  805f83:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  805f87:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  805f8b:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  805f8f:	bf 60 00 00 00       	mov    edi,0x60
  805f94:	e8 50 eb ff ff       	call   804ae9 <inb>
  805f99:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
    ch= to_ascii(scan1);
  805f9c:	0f b6 45 fe          	movzx  eax,BYTE PTR [rbp-0x2]
  805fa0:	0f be c0             	movsx  eax,al
  805fa3:	89 c7                	mov    edi,eax
  805fa5:	e8 bd fe ff ff       	call   805e67 <to_ascii>
  805faa:	88 45 fd             	mov    BYTE PTR [rbp-0x3],al
    if(scan1 == 0xe0 || scan1 == 0xe1)
  805fad:	80 7d fe e0          	cmp    BYTE PTR [rbp-0x2],0xe0
  805fb1:	74 06                	je     805fb9 <key_proc+0x42>
  805fb3:	80 7d fe e1          	cmp    BYTE PTR [rbp-0x2],0xe1
  805fb7:	75 1e                	jne    805fd7 <key_proc+0x60>
    {
        ch= to_ascii(scan2);
  805fb9:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  805fbd:	0f be c0             	movsx  eax,al
  805fc0:	89 c7                	mov    edi,eax
  805fc2:	e8 a0 fe ff ff       	call   805e67 <to_ascii>
  805fc7:	88 45 fd             	mov    BYTE PTR [rbp-0x3],al
        scan2=inb(0x60);
  805fca:	bf 60 00 00 00       	mov    edi,0x60
  805fcf:	e8 15 eb ff ff       	call   804ae9 <inb>
  805fd4:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    }
    tmpc.scan_code=scan1;
  805fd7:	0f b6 45 fe          	movzx  eax,BYTE PTR [rbp-0x2]
  805fdb:	88 45 fa             	mov    BYTE PTR [rbp-0x6],al
    tmpc.scan_code2=scan2;
  805fde:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  805fe2:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
    tmpc.ascii= ch;
  805fe5:	0f b6 45 fd          	movzx  eax,BYTE PTR [rbp-0x3]
  805fe9:	88 45 f8             	mov    BYTE PTR [rbp-0x8],al


    ENQUEUE(key_bufq,tmpc)
  805fec:	48 8b 0d bd 40 00 00 	mov    rcx,QWORD PTR [rip+0x40bd]        # 80a0b0 <key_bufq>
  805ff3:	8b 05 c3 40 00 00    	mov    eax,DWORD PTR [rip+0x40c3]        # 80a0bc <key_bufq+0xc>
  805ff9:	48 63 d0             	movsxd rdx,eax
  805ffc:	48 89 d0             	mov    rax,rdx
  805fff:	48 c1 e0 02          	shl    rax,0x2
  806003:	48 01 d0             	add    rax,rdx
  806006:	48 01 c8             	add    rax,rcx
  806009:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80600c:	89 10                	mov    DWORD PTR [rax],edx
  80600e:	0f b6 55 fc          	movzx  edx,BYTE PTR [rbp-0x4]
  806012:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
  806015:	8b 05 a1 40 00 00    	mov    eax,DWORD PTR [rip+0x40a1]        # 80a0bc <key_bufq+0xc>
  80601b:	83 c0 01             	add    eax,0x1
  80601e:	8b 0d 9c 40 00 00    	mov    ecx,DWORD PTR [rip+0x409c]        # 80a0c0 <key_bufq+0x10>
  806024:	99                   	cdq    
  806025:	f7 f9                	idiv   ecx
  806027:	89 d0                	mov    eax,edx
  806029:	89 05 8d 40 00 00    	mov    DWORD PTR [rip+0x408d],eax        # 80a0bc <key_bufq+0xc>


    if(scan1==0x48)
  80602f:	80 7d fe 48          	cmp    BYTE PTR [rbp-0x2],0x48
  806033:	75 0a                	jne    80603f <key_proc+0xc8>
        scr_up();
  806035:	b8 00 00 00 00       	mov    eax,0x0
  80603a:	e8 8d fb ff ff       	call   805bcc <scr_up>
    if(scan1==0x50)
  80603f:	80 7d fe 50          	cmp    BYTE PTR [rbp-0x2],0x50
  806043:	75 0a                	jne    80604f <key_proc+0xd8>
        scr_down();
  806045:	b8 00 00 00 00       	mov    eax,0x0
  80604a:	e8 0e fc ff ff       	call   805c5d <scr_down>
    switch (scan1)
  80604f:	0f b6 45 fe          	movzx  eax,BYTE PTR [rbp-0x2]
  806053:	3d b6 00 00 00       	cmp    eax,0xb6
  806058:	74 41                	je     80609b <key_proc+0x124>
  80605a:	3d b6 00 00 00       	cmp    eax,0xb6
  80605f:	7f 5e                	jg     8060bf <key_proc+0x148>
  806061:	3d aa 00 00 00       	cmp    eax,0xaa
  806066:	74 33                	je     80609b <key_proc+0x124>
  806068:	3d aa 00 00 00       	cmp    eax,0xaa
  80606d:	7f 50                	jg     8060bf <key_proc+0x148>
  80606f:	3d 9d 00 00 00       	cmp    eax,0x9d
  806074:	74 31                	je     8060a7 <key_proc+0x130>
  806076:	3d 9d 00 00 00       	cmp    eax,0x9d
  80607b:	7f 42                	jg     8060bf <key_proc+0x148>
  80607d:	83 f8 3a             	cmp    eax,0x3a
  806080:	74 31                	je     8060b3 <key_proc+0x13c>
  806082:	83 f8 3a             	cmp    eax,0x3a
  806085:	7f 38                	jg     8060bf <key_proc+0x148>
  806087:	83 f8 36             	cmp    eax,0x36
  80608a:	74 0f                	je     80609b <key_proc+0x124>
  80608c:	83 f8 36             	cmp    eax,0x36
  80608f:	7f 2e                	jg     8060bf <key_proc+0x148>
  806091:	83 f8 1d             	cmp    eax,0x1d
  806094:	74 11                	je     8060a7 <key_proc+0x130>
  806096:	83 f8 2a             	cmp    eax,0x2a
  806099:	75 24                	jne    8060bf <key_proc+0x148>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  80609b:	b8 00 00 00 00       	mov    eax,0x0
  8060a0:	e8 6b fd ff ff       	call   805e10 <shift>
            break;
  8060a5:	eb 19                	jmp    8060c0 <key_proc+0x149>
        case 0x1d:
        case 0x9d:
            ctrl();
  8060a7:	b8 00 00 00 00       	mov    eax,0x0
  8060ac:	e8 7c fd ff ff       	call   805e2d <ctrl>
            break;
  8060b1:	eb 0d                	jmp    8060c0 <key_proc+0x149>
        case 0x3a:
            capslock();
  8060b3:	b8 00 00 00 00       	mov    eax,0x0
  8060b8:	e8 8d fd ff ff       	call   805e4a <capslock>
            break;
  8060bd:	eb 01                	jmp    8060c0 <key_proc+0x149>
        default:
            break;
  8060bf:	90                   	nop
    }
    if(scan1<=0x80&&ch!=0)
  8060c0:	80 7d fe 80          	cmp    BYTE PTR [rbp-0x2],0x80
  8060c4:	77 14                	ja     8060da <key_proc+0x163>
  8060c6:	0f b6 45 fd          	movzx  eax,BYTE PTR [rbp-0x3]
  8060ca:	84 c0                	test   al,al
  8060cc:	74 0c                	je     8060da <key_proc+0x163>
    {
        print(&ch);
  8060ce:	48 8d 45 fd          	lea    rax,[rbp-0x3]
  8060d2:	48 89 c7             	mov    rdi,rax
  8060d5:	e8 17 fc ff ff       	call   805cf1 <print>
        //logf("%x\n",stdin.w_ptr);
        //print_stdin();
        //printchar(ch);
        //flush_screen(0);*/
    }
    eoi();
  8060da:	b8 00 00 00 00       	mov    eax,0x0
  8060df:	e8 1a ea ff ff       	call   804afe <eoi>
    asm volatile("leave \r\n iretq");
  8060e4:	c9                   	leave  
  8060e5:	48 cf                	iretq  
}
  8060e7:	90                   	nop
  8060e8:	c9                   	leave  
  8060e9:	c3                   	ret    

00000000008060ea <sys_getkbc>:

char sys_getkbc()
{
  8060ea:	f3 0f 1e fa          	endbr64 
  8060ee:	55                   	push   rbp
  8060ef:	48 89 e5             	mov    rbp,rsp
    if(key_bufq.tail==key_bufq.head)return -1;
  8060f2:	8b 15 c4 3f 00 00    	mov    edx,DWORD PTR [rip+0x3fc4]        # 80a0bc <key_bufq+0xc>
  8060f8:	8b 05 ba 3f 00 00    	mov    eax,DWORD PTR [rip+0x3fba]        # 80a0b8 <key_bufq+0x8>
  8060fe:	39 c2                	cmp    edx,eax
  806100:	75 07                	jne    806109 <sys_getkbc+0x1f>
  806102:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806107:	eb 43                	jmp    80614c <sys_getkbc+0x62>
    key_code c=key_buf[key_bufq.tail];
  806109:	8b 05 ad 3f 00 00    	mov    eax,DWORD PTR [rip+0x3fad]        # 80a0bc <key_bufq+0xc>
  80610f:	48 63 d0             	movsxd rdx,eax
  806112:	48 89 d0             	mov    rax,rdx
  806115:	48 c1 e0 02          	shl    rax,0x2
  806119:	48 01 d0             	add    rax,rdx
  80611c:	48 05 00 51 42 00    	add    rax,0x425100
  806122:	8b 10                	mov    edx,DWORD PTR [rax]
  806124:	89 55 fb             	mov    DWORD PTR [rbp-0x5],edx
  806127:	0f b6 40 04          	movzx  eax,BYTE PTR [rax+0x4]
  80612b:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QTAIL(key_bufq)=(QTAIL(key_bufq)+1)%QSIZE(key_bufq);
  80612e:	8b 05 88 3f 00 00    	mov    eax,DWORD PTR [rip+0x3f88]        # 80a0bc <key_bufq+0xc>
  806134:	83 c0 01             	add    eax,0x1
  806137:	8b 0d 83 3f 00 00    	mov    ecx,DWORD PTR [rip+0x3f83]        # 80a0c0 <key_bufq+0x10>
  80613d:	99                   	cdq    
  80613e:	f7 f9                	idiv   ecx
  806140:	89 d0                	mov    eax,edx
  806142:	89 05 74 3f 00 00    	mov    DWORD PTR [rip+0x3f74],eax        # 80a0bc <key_bufq+0xc>
    return c.ascii;
  806148:	0f b6 45 fb          	movzx  eax,BYTE PTR [rbp-0x5]
  80614c:	5d                   	pop    rbp
  80614d:	c3                   	ret    

000000000080614e <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  80614e:	f3 0f 1e fa          	endbr64 
  806152:	55                   	push   rbp
  806153:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  806156:	b8 00 00 00 00       	mov    eax,0x0
  80615b:	e8 8d 09 00 00       	call   806aed <hd_iterate>
    return 0;
  806160:	b8 00 00 00 00       	mov    eax,0x0
}
  806165:	5d                   	pop    rbp
  806166:	c3                   	ret    

0000000000806167 <disk_int_handler_c>:

int disk_int_handler_c()
{
  806167:	f3 0f 1e fa          	endbr64 
  80616b:	55                   	push   rbp
  80616c:	48 89 e5             	mov    rbp,rsp
  80616f:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  806173:	48 8b 05 a6 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226a6]        # 428820 <running_req>
  80617a:	48 85 c0             	test   rax,rax
  80617d:	75 0a                	jne    806189 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  80617f:	b8 01 00 00 00       	mov    eax,0x1
  806184:	e9 a3 01 00 00       	jmp    80632c <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  806189:	48 8b 05 90 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22690]        # 428820 <running_req>
  806190:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806194:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  806198:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  80619f:	48 8b 05 7a 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2267a]        # 428820 <running_req>
  8061a6:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8061a9:	83 f8 02             	cmp    eax,0x2
  8061ac:	74 0f                	je     8061bd <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  8061ae:	48 8b 05 6b 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2266b]        # 428820 <running_req>
  8061b5:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  8061b8:	83 f8 03             	cmp    eax,0x3
  8061bb:	75 07                	jne    8061c4 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  8061bd:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  8061c4:	48 8b 05 55 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22655]        # 428820 <running_req>
  8061cb:	8b 00                	mov    eax,DWORD PTR [rax]
  8061cd:	85 c0                	test   eax,eax
  8061cf:	75 42                	jne    806213 <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  8061d1:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8061d8:	eb 22                	jmp    8061fc <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  8061da:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8061dd:	0f b7 c0             	movzx  eax,ax
  8061e0:	89 c7                	mov    edi,eax
  8061e2:	e8 0c e9 ff ff       	call   804af3 <inw>
  8061e7:	89 c2                	mov    edx,eax
  8061e9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8061ed:	48 8d 48 02          	lea    rcx,[rax+0x2]
  8061f1:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  8061f5:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  8061f8:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8061fc:	48 8b 05 1d 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2261d]        # 428820 <running_req>
  806203:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806206:	c1 e0 08             	shl    eax,0x8
  806209:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  80620c:	7c cc                	jl     8061da <disk_int_handler_c+0x73>
  80620e:	e9 ca 00 00 00       	jmp    8062dd <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  806213:	48 8b 05 06 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22606]        # 428820 <running_req>
  80621a:	8b 00                	mov    eax,DWORD PTR [rax]
  80621c:	83 f8 01             	cmp    eax,0x1
  80621f:	75 42                	jne    806263 <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  806221:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  806228:	eb 25                	jmp    80624f <disk_int_handler_c+0xe8>
            outw(port,*p++);
  80622a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80622e:	48 8d 50 02          	lea    rdx,[rax+0x2]
  806232:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  806236:	0f b7 00             	movzx  eax,WORD PTR [rax]
  806239:	0f b7 d0             	movzx  edx,ax
  80623c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80623f:	0f b7 c0             	movzx  eax,ax
  806242:	89 d6                	mov    esi,edx
  806244:	89 c7                	mov    edi,eax
  806246:	e8 92 e8 ff ff       	call   804add <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  80624b:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80624f:	48 8b 05 ca 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225ca]        # 428820 <running_req>
  806256:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806259:	c1 e0 08             	shl    eax,0x8
  80625c:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80625f:	7c c9                	jl     80622a <disk_int_handler_c+0xc3>
  806261:	eb 7a                	jmp    8062dd <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  806263:	48 8b 05 b6 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225b6]        # 428820 <running_req>
  80626a:	8b 00                	mov    eax,DWORD PTR [rax]
  80626c:	83 f8 02             	cmp    eax,0x2
  80626f:	75 34                	jne    8062a5 <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  806271:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806274:	83 c0 07             	add    eax,0x7
  806277:	0f b6 c0             	movzx  eax,al
  80627a:	89 c7                	mov    edi,eax
  80627c:	e8 68 e8 ff ff       	call   804ae9 <inb>
  806281:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  806284:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806287:	0f b7 c0             	movzx  eax,ax
  80628a:	89 c7                	mov    edi,eax
  80628c:	e8 62 e8 ff ff       	call   804af3 <inw>
  806291:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  806295:	48 8b 05 84 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22584]        # 428820 <running_req>
  80629c:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  8062a3:	eb 38                	jmp    8062dd <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  8062a5:	48 8b 05 74 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22574]        # 428820 <running_req>
  8062ac:	8b 00                	mov    eax,DWORD PTR [rax]
  8062ae:	83 f8 03             	cmp    eax,0x3
  8062b1:	75 2a                	jne    8062dd <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  8062b3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8062b6:	83 c0 07             	add    eax,0x7
  8062b9:	0f b6 c0             	movzx  eax,al
  8062bc:	89 c7                	mov    edi,eax
  8062be:	e8 26 e8 ff ff       	call   804ae9 <inb>
  8062c3:	0f b6 c0             	movzx  eax,al
  8062c6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  8062c9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8062cc:	89 c6                	mov    esi,eax
  8062ce:	bf 16 1f 81 00       	mov    edi,0x811f16
  8062d3:	b8 00 00 00 00       	mov    eax,0x0
  8062d8:	e8 95 a9 ff ff       	call   800c72 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  8062dd:	48 8b 05 3c 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2253c]        # 428820 <running_req>
  8062e4:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8062eb:	48 8b 05 2e 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2252e]        # 428820 <running_req>
  8062f2:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8062f6:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8062fd:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  806300:	48 8b 05 21 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22521]        # 428828 <running_devman_req>
  806307:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  80630e:	00 00 00 
    running_devman_req=NULL;
  806311:	48 c7 05 0c 25 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2250c],0x0        # 428828 <running_devman_req>
  806318:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  80631c:	48 c7 05 f9 24 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc224f9],0x0        # 428820 <running_req>
  806323:	00 00 00 00 
    return 0;
  806327:	b8 00 00 00 00       	mov    eax,0x0
}
  80632c:	c9                   	leave  
  80632d:	c3                   	ret    

000000000080632e <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  80632e:	f3 0f 1e fa          	endbr64 
  806332:	55                   	push   rbp
  806333:	48 89 e5             	mov    rbp,rsp
  806336:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  806339:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80633c:	48 63 d0             	movsxd rdx,eax
  80633f:	48 89 d0             	mov    rax,rdx
  806342:	48 01 c0             	add    rax,rax
  806345:	48 01 d0             	add    rax,rdx
  806348:	48 c1 e0 04          	shl    rax,0x4
  80634c:	48 05 3c 5b 42 00    	add    rax,0x425b3c
  806352:	8b 00                	mov    eax,DWORD PTR [rax]
}
  806354:	5d                   	pop    rbp
  806355:	c3                   	ret    

0000000000806356 <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  806356:	f3 0f 1e fa          	endbr64 
  80635a:	55                   	push   rbp
  80635b:	48 89 e5             	mov    rbp,rsp
  80635e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806361:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806364:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806367:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  80636a:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  80636e:	8b 05 e0 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc224e0]        # 428854 <tail>
  806374:	83 c0 01             	add    eax,0x1
  806377:	48 63 d0             	movsxd rdx,eax
  80637a:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  806381:	48 c1 ea 20          	shr    rdx,0x20
  806385:	01 c2                	add    edx,eax
  806387:	c1 fa 07             	sar    edx,0x7
  80638a:	89 c1                	mov    ecx,eax
  80638c:	c1 f9 1f             	sar    ecx,0x1f
  80638f:	29 ca                	sub    edx,ecx
  806391:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  806397:	29 c8                	sub    eax,ecx
  806399:	89 c2                	mov    edx,eax
  80639b:	8b 05 af 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc224af]        # 428850 <head>
  8063a1:	39 c2                	cmp    edx,eax
  8063a3:	75 0a                	jne    8063af <request+0x59>
    {
        return -1;
  8063a5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8063aa:	e9 0d 01 00 00       	jmp    8064bc <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  8063af:	8b 05 9f 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2249f]        # 428854 <tail>
  8063b5:	48 63 d0             	movsxd rdx,eax
  8063b8:	48 89 d0             	mov    rax,rdx
  8063bb:	48 01 c0             	add    rax,rax
  8063be:	48 01 d0             	add    rax,rdx
  8063c1:	48 c1 e0 04          	shl    rax,0x4
  8063c5:	48 8d 90 24 5b 42 00 	lea    rdx,[rax+0x425b24]
  8063cc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8063cf:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  8063d1:	8b 05 7d 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2247d]        # 428854 <tail>
  8063d7:	48 63 d0             	movsxd rdx,eax
  8063da:	48 89 d0             	mov    rax,rdx
  8063dd:	48 01 c0             	add    rax,rax
  8063e0:	48 01 d0             	add    rax,rdx
  8063e3:	48 c1 e0 04          	shl    rax,0x4
  8063e7:	48 8d 90 20 5b 42 00 	lea    rdx,[rax+0x425b20]
  8063ee:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8063f1:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  8063f3:	8b 05 5b 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2245b]        # 428854 <tail>
  8063f9:	48 63 d0             	movsxd rdx,eax
  8063fc:	48 89 d0             	mov    rax,rdx
  8063ff:	48 01 c0             	add    rax,rax
  806402:	48 01 d0             	add    rax,rdx
  806405:	48 c1 e0 04          	shl    rax,0x4
  806409:	48 8d 90 28 5b 42 00 	lea    rdx,[rax+0x425b28]
  806410:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806413:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  806415:	8b 05 39 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22439]        # 428854 <tail>
  80641b:	48 63 d0             	movsxd rdx,eax
  80641e:	48 89 d0             	mov    rax,rdx
  806421:	48 01 c0             	add    rax,rax
  806424:	48 01 d0             	add    rax,rdx
  806427:	48 c1 e0 04          	shl    rax,0x4
  80642b:	48 8d 90 2c 5b 42 00 	lea    rdx,[rax+0x425b2c]
  806432:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  806435:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  806437:	8b 05 17 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22417]        # 428854 <tail>
  80643d:	48 63 d0             	movsxd rdx,eax
  806440:	48 89 d0             	mov    rax,rdx
  806443:	48 01 c0             	add    rax,rax
  806446:	48 01 d0             	add    rax,rdx
  806449:	48 c1 e0 04          	shl    rax,0x4
  80644d:	48 05 3c 5b 42 00    	add    rax,0x425b3c
  806453:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  806459:	8b 05 f5 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc223f5]        # 428854 <tail>
  80645f:	48 63 d0             	movsxd rdx,eax
  806462:	48 89 d0             	mov    rax,rdx
  806465:	48 01 c0             	add    rax,rax
  806468:	48 01 d0             	add    rax,rdx
  80646b:	48 c1 e0 04          	shl    rax,0x4
  80646f:	48 8d 90 30 5b 42 00 	lea    rdx,[rax+0x425b30]
  806476:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80647a:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  80647d:	8b 05 d1 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc223d1]        # 428854 <tail>
  806483:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  806486:	8b 05 c8 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc223c8]        # 428854 <tail>
  80648c:	8d 50 01             	lea    edx,[rax+0x1]
  80648f:	48 63 c2             	movsxd rax,edx
  806492:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806499:	48 c1 e8 20          	shr    rax,0x20
  80649d:	01 d0                	add    eax,edx
  80649f:	c1 f8 07             	sar    eax,0x7
  8064a2:	89 d1                	mov    ecx,edx
  8064a4:	c1 f9 1f             	sar    ecx,0x1f
  8064a7:	29 c8                	sub    eax,ecx
  8064a9:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8064af:	89 d0                	mov    eax,edx
  8064b1:	29 c8                	sub    eax,ecx
  8064b3:	89 05 9b 23 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2239b],eax        # 428854 <tail>
    return r;
  8064b9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8064bc:	5d                   	pop    rbp
  8064bd:	c3                   	ret    

00000000008064be <execute_request>:
int execute_request(){
  8064be:	f3 0f 1e fa          	endbr64 
  8064c2:	55                   	push   rbp
  8064c3:	48 89 e5             	mov    rbp,rsp
  8064c6:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  8064ca:	48 8b 05 4f 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2234f]        # 428820 <running_req>
  8064d1:	48 85 c0             	test   rax,rax
  8064d4:	74 6a                	je     806540 <execute_request+0x82>
    {
        running_req->time++;
  8064d6:	48 8b 05 43 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22343]        # 428820 <running_req>
  8064dd:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8064e0:	83 c2 01             	add    edx,0x1
  8064e3:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  8064e6:	48 8b 05 33 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22333]        # 428820 <running_req>
  8064ed:	8b 00                	mov    eax,DWORD PTR [rax]
  8064ef:	83 f8 02             	cmp    eax,0x2
  8064f2:	74 0a                	je     8064fe <execute_request+0x40>
            return 2;
  8064f4:	b8 02 00 00 00       	mov    eax,0x2
  8064f9:	e9 b4 01 00 00       	jmp    8066b2 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  8064fe:	48 8b 05 1b 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2231b]        # 428820 <running_req>
  806505:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  806508:	83 f8 0a             	cmp    eax,0xa
  80650b:	7e 29                	jle    806536 <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  80650d:	48 8b 05 0c 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2230c]        # 428820 <running_req>
  806514:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  80651b:	48 8b 05 fe 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc222fe]        # 428820 <running_req>
  806522:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  806529:	48 c7 05 ec 22 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc222ec],0x0        # 428820 <running_req>
  806530:	00 00 00 00 
  806534:	eb 0a                	jmp    806540 <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  806536:	b8 02 00 00 00       	mov    eax,0x2
  80653b:	e9 72 01 00 00       	jmp    8066b2 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  806540:	8b 15 0a 23 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc2230a]        # 428850 <head>
  806546:	8b 05 08 23 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22308]        # 428854 <tail>
  80654c:	39 c2                	cmp    edx,eax
  80654e:	75 0a                	jne    80655a <execute_request+0x9c>
  806550:	b8 01 00 00 00       	mov    eax,0x1
  806555:	e9 58 01 00 00       	jmp    8066b2 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  80655a:	8b 05 f0 22 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc222f0]        # 428850 <head>
  806560:	48 63 d0             	movsxd rdx,eax
  806563:	48 89 d0             	mov    rax,rdx
  806566:	48 01 c0             	add    rax,rax
  806569:	48 01 d0             	add    rax,rdx
  80656c:	48 c1 e0 04          	shl    rax,0x4
  806570:	48 05 20 5b 42 00    	add    rax,0x425b20
  806576:	48 89 05 a3 22 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc222a3],rax        # 428820 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  80657d:	8b 05 cd 22 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc222cd]        # 428850 <head>
  806583:	8d 50 01             	lea    edx,[rax+0x1]
  806586:	48 63 c2             	movsxd rax,edx
  806589:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806590:	48 c1 e8 20          	shr    rax,0x20
  806594:	01 d0                	add    eax,edx
  806596:	c1 f8 07             	sar    eax,0x7
  806599:	89 d1                	mov    ecx,edx
  80659b:	c1 f9 1f             	sar    ecx,0x1f
  80659e:	29 c8                	sub    eax,ecx
  8065a0:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8065a6:	89 d0                	mov    eax,edx
  8065a8:	29 c8                	sub    eax,ecx
  8065aa:	89 05 a0 22 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc222a0],eax        # 428850 <head>
    running_req->stat=REQ_STAT_WORKING;
  8065b0:	48 8b 05 69 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22269]        # 428820 <running_req>
  8065b7:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  8065be:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  8065c5:	48 8b 05 54 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22254]        # 428820 <running_req>
  8065cc:	8b 00                	mov    eax,DWORD PTR [rax]
  8065ce:	83 f8 03             	cmp    eax,0x3
  8065d1:	0f 84 ad 00 00 00    	je     806684 <execute_request+0x1c6>
  8065d7:	83 f8 03             	cmp    eax,0x3
  8065da:	0f 8f bf 00 00 00    	jg     80669f <execute_request+0x1e1>
  8065e0:	83 f8 02             	cmp    eax,0x2
  8065e3:	0f 84 85 00 00 00    	je     80666e <execute_request+0x1b0>
  8065e9:	83 f8 02             	cmp    eax,0x2
  8065ec:	0f 8f ad 00 00 00    	jg     80669f <execute_request+0x1e1>
  8065f2:	85 c0                	test   eax,eax
  8065f4:	74 0a                	je     806600 <execute_request+0x142>
  8065f6:	83 f8 01             	cmp    eax,0x1
  8065f9:	74 3c                	je     806637 <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  8065fb:	e9 9f 00 00 00       	jmp    80669f <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  806600:	48 8b 05 19 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22219]        # 428820 <running_req>
        r=async_read_disk(running_req->disk,\
  806607:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  80660b:	48 8b 05 0e 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2220e]        # 428820 <running_req>
        r=async_read_disk(running_req->disk,\
  806612:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  806615:	48 8b 05 04 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22204]        # 428820 <running_req>
  80661c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  80661f:	89 c6                	mov    esi,eax
  806621:	48 8b 05 f8 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221f8]        # 428820 <running_req>
  806628:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80662b:	89 c7                	mov    edi,eax
  80662d:	e8 a7 00 00 00       	call   8066d9 <async_read_disk>
  806632:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806635:	eb 69                	jmp    8066a0 <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  806637:	48 8b 05 e2 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221e2]        # 428820 <running_req>
        r=async_write_disk(running_req->disk,\
  80663e:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  806642:	48 8b 05 d7 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221d7]        # 428820 <running_req>
        r=async_write_disk(running_req->disk,\
  806649:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  80664c:	48 8b 05 cd 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221cd]        # 428820 <running_req>
  806653:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  806656:	89 c6                	mov    esi,eax
  806658:	48 8b 05 c1 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221c1]        # 428820 <running_req>
  80665f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806662:	89 c7                	mov    edi,eax
  806664:	e8 88 01 00 00       	call   8067f1 <async_write_disk>
  806669:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  80666c:	eb 32                	jmp    8066a0 <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  80666e:	48 8b 05 ab 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221ab]        # 428820 <running_req>
  806675:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806678:	89 c7                	mov    edi,eax
  80667a:	e8 8f 06 00 00       	call   806d0e <async_check_disk>
  80667f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806682:	eb 1c                	jmp    8066a0 <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  806684:	48 8b 05 95 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22195]        # 428820 <running_req>
  80668b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80668e:	89 c7                	mov    edi,eax
  806690:	b8 00 00 00 00       	mov    eax,0x0
  806695:	e8 1a 00 00 00       	call   8066b4 <async_reset_disk>
  80669a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  80669d:	eb 01                	jmp    8066a0 <execute_request+0x1e2>
        break;
  80669f:	90                   	nop
    }
    if(r==-1)return -1;
  8066a0:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8066a4:	75 07                	jne    8066ad <execute_request+0x1ef>
  8066a6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8066ab:	eb 05                	jmp    8066b2 <execute_request+0x1f4>
    return 0;
  8066ad:	b8 00 00 00 00       	mov    eax,0x0
}
  8066b2:	c9                   	leave  
  8066b3:	c3                   	ret    

00000000008066b4 <async_reset_disk>:
int async_reset_disk(int disk)
{
  8066b4:	f3 0f 1e fa          	endbr64 
  8066b8:	55                   	push   rbp
  8066b9:	48 89 e5             	mov    rbp,rsp
  8066bc:	48 83 ec 10          	sub    rsp,0x10
  8066c0:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  8066c3:	be 0c 00 00 00       	mov    esi,0xc
  8066c8:	bf f6 03 00 00       	mov    edi,0x3f6
  8066cd:	e8 fe e3 ff ff       	call   804ad0 <outb>
    return 0;
  8066d2:	b8 00 00 00 00       	mov    eax,0x0
}
  8066d7:	c9                   	leave  
  8066d8:	c3                   	ret    

00000000008066d9 <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  8066d9:	f3 0f 1e fa          	endbr64 
  8066dd:	55                   	push   rbp
  8066de:	48 89 e5             	mov    rbp,rsp
  8066e1:	48 83 ec 30          	sub    rsp,0x30
  8066e5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8066e8:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8066eb:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8066ee:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  8066f2:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  8066f8:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  8066ff:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806703:	74 06                	je     80670b <async_read_disk+0x32>
  806705:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806709:	75 06                	jne    806711 <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  80670b:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806711:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806715:	74 06                	je     80671d <async_read_disk+0x44>
  806717:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  80671b:	75 07                	jne    806724 <async_read_disk+0x4b>
        slave_disk=1;
  80671d:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  806724:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806727:	0f b6 d0             	movzx  edx,al
  80672a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80672e:	83 c0 02             	add    eax,0x2
  806731:	0f b7 c0             	movzx  eax,ax
  806734:	89 d6                	mov    esi,edx
  806736:	89 c7                	mov    edi,eax
  806738:	e8 93 e3 ff ff       	call   804ad0 <outb>
    outb(port+3,lba&0xff);
  80673d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806740:	0f b6 d0             	movzx  edx,al
  806743:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806747:	83 c0 03             	add    eax,0x3
  80674a:	0f b7 c0             	movzx  eax,ax
  80674d:	89 d6                	mov    esi,edx
  80674f:	89 c7                	mov    edi,eax
  806751:	e8 7a e3 ff ff       	call   804ad0 <outb>
    outb(port+4,(lba>>8)&0xff);
  806756:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806759:	c1 e8 08             	shr    eax,0x8
  80675c:	0f b6 d0             	movzx  edx,al
  80675f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806763:	83 c0 04             	add    eax,0x4
  806766:	0f b7 c0             	movzx  eax,ax
  806769:	89 d6                	mov    esi,edx
  80676b:	89 c7                	mov    edi,eax
  80676d:	e8 5e e3 ff ff       	call   804ad0 <outb>
    outb(port+5,(lba>>16)&0xff);
  806772:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806775:	c1 e8 10             	shr    eax,0x10
  806778:	0f b6 d0             	movzx  edx,al
  80677b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80677f:	83 c0 05             	add    eax,0x5
  806782:	0f b7 c0             	movzx  eax,ax
  806785:	89 d6                	mov    esi,edx
  806787:	89 c7                	mov    edi,eax
  806789:	e8 42 e3 ff ff       	call   804ad0 <outb>
    char drv=slave_disk?0x10:0;
  80678e:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806792:	74 07                	je     80679b <async_read_disk+0xc2>
  806794:	b8 10 00 00 00       	mov    eax,0x10
  806799:	eb 05                	jmp    8067a0 <async_read_disk+0xc7>
  80679b:	b8 00 00 00 00       	mov    eax,0x0
  8067a0:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  8067a3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8067a6:	c1 e8 18             	shr    eax,0x18
  8067a9:	83 e0 0f             	and    eax,0xf
  8067ac:	89 c2                	mov    edx,eax
  8067ae:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  8067b2:	09 d0                	or     eax,edx
  8067b4:	83 c8 e0             	or     eax,0xffffffe0
  8067b7:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  8067ba:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  8067be:	0f b6 d0             	movzx  edx,al
  8067c1:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8067c5:	83 c0 06             	add    eax,0x6
  8067c8:	0f b7 c0             	movzx  eax,ax
  8067cb:	89 d6                	mov    esi,edx
  8067cd:	89 c7                	mov    edi,eax
  8067cf:	e8 fc e2 ff ff       	call   804ad0 <outb>
    outb(port+7,DISK_CMD_READ);
  8067d4:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8067d8:	83 c0 07             	add    eax,0x7
  8067db:	0f b7 c0             	movzx  eax,ax
  8067de:	be 20 00 00 00       	mov    esi,0x20
  8067e3:	89 c7                	mov    edi,eax
  8067e5:	e8 e6 e2 ff ff       	call   804ad0 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  8067ea:	b8 00 00 00 00       	mov    eax,0x0
}
  8067ef:	c9                   	leave  
  8067f0:	c3                   	ret    

00000000008067f1 <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  8067f1:	f3 0f 1e fa          	endbr64 
  8067f5:	55                   	push   rbp
  8067f6:	48 89 e5             	mov    rbp,rsp
  8067f9:	48 83 ec 30          	sub    rsp,0x30
  8067fd:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806800:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806803:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806806:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  80680a:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  806810:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806817:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  80681b:	74 06                	je     806823 <async_write_disk+0x32>
  80681d:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806821:	75 06                	jne    806829 <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  806823:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806829:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80682d:	74 06                	je     806835 <async_write_disk+0x44>
  80682f:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806833:	75 07                	jne    80683c <async_write_disk+0x4b>
        slave_disk=1;
  806835:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  80683c:	bf f7 00 00 00       	mov    edi,0xf7
  806841:	e8 a3 e2 ff ff       	call   804ae9 <inb>
  806846:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  806849:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  80684d:	83 e0 01             	and    eax,0x1
  806850:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  806853:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  806857:	74 0a                	je     806863 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  806859:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80685e:	e9 d5 00 00 00       	jmp    806938 <async_write_disk+0x147>
        }
        t&=0x88;
  806863:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  806867:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  80686b:	74 02                	je     80686f <async_write_disk+0x7e>
    {
  80686d:	eb cd                	jmp    80683c <async_write_disk+0x4b>
        if(t==0x8)break;
  80686f:	90                   	nop
    }
    outb(port+2,sec_n);
  806870:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806873:	0f b6 d0             	movzx  edx,al
  806876:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80687a:	83 c0 02             	add    eax,0x2
  80687d:	0f b7 c0             	movzx  eax,ax
  806880:	89 d6                	mov    esi,edx
  806882:	89 c7                	mov    edi,eax
  806884:	e8 47 e2 ff ff       	call   804ad0 <outb>
    outb(port+3,lba&0xff);
  806889:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80688c:	0f b6 d0             	movzx  edx,al
  80688f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806893:	83 c0 03             	add    eax,0x3
  806896:	0f b7 c0             	movzx  eax,ax
  806899:	89 d6                	mov    esi,edx
  80689b:	89 c7                	mov    edi,eax
  80689d:	e8 2e e2 ff ff       	call   804ad0 <outb>
    outb(port+4,(lba>>8)&0xff);
  8068a2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8068a5:	c1 e8 08             	shr    eax,0x8
  8068a8:	0f b6 d0             	movzx  edx,al
  8068ab:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8068af:	83 c0 04             	add    eax,0x4
  8068b2:	0f b7 c0             	movzx  eax,ax
  8068b5:	89 d6                	mov    esi,edx
  8068b7:	89 c7                	mov    edi,eax
  8068b9:	e8 12 e2 ff ff       	call   804ad0 <outb>
    outb(port+5,(lba>>16)&0xff);
  8068be:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8068c1:	c1 e8 10             	shr    eax,0x10
  8068c4:	0f b6 d0             	movzx  edx,al
  8068c7:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8068cb:	83 c0 05             	add    eax,0x5
  8068ce:	0f b7 c0             	movzx  eax,ax
  8068d1:	89 d6                	mov    esi,edx
  8068d3:	89 c7                	mov    edi,eax
  8068d5:	e8 f6 e1 ff ff       	call   804ad0 <outb>
    char drv=slave_disk?0x10:0;
  8068da:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  8068de:	74 07                	je     8068e7 <async_write_disk+0xf6>
  8068e0:	b8 10 00 00 00       	mov    eax,0x10
  8068e5:	eb 05                	jmp    8068ec <async_write_disk+0xfb>
  8068e7:	b8 00 00 00 00       	mov    eax,0x0
  8068ec:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  8068ef:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8068f2:	c1 e8 18             	shr    eax,0x18
  8068f5:	83 e0 0f             	and    eax,0xf
  8068f8:	89 c2                	mov    edx,eax
  8068fa:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  8068fe:	09 d0                	or     eax,edx
  806900:	83 c8 e0             	or     eax,0xffffffe0
  806903:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  806906:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80690a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80690e:	83 c0 06             	add    eax,0x6
  806911:	0f b7 c0             	movzx  eax,ax
  806914:	89 d6                	mov    esi,edx
  806916:	89 c7                	mov    edi,eax
  806918:	e8 b3 e1 ff ff       	call   804ad0 <outb>
    outb(port+7,DISK_CMD_WRITE);
  80691d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806921:	83 c0 07             	add    eax,0x7
  806924:	0f b7 c0             	movzx  eax,ax
  806927:	be 30 00 00 00       	mov    esi,0x30
  80692c:	89 c7                	mov    edi,eax
  80692e:	e8 9d e1 ff ff       	call   804ad0 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  806933:	b8 00 00 00 00       	mov    eax,0x0
}
  806938:	c9                   	leave  
  806939:	c3                   	ret    

000000000080693a <read_disk>:
int read_disk(driver_args* args)
{
  80693a:	f3 0f 1e fa          	endbr64 
  80693e:	55                   	push   rbp
  80693f:	48 89 e5             	mov    rbp,rsp
  806942:	48 83 ec 20          	sub    rsp,0x20
  806946:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  80694a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80694e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806951:	48 98                	cdqe   
  806953:	48 89 c2             	mov    rdx,rax
  806956:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80695a:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80695d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806961:	8b 00                	mov    eax,DWORD PTR [rax]
  806963:	89 ce                	mov    esi,ecx
  806965:	89 c7                	mov    edi,eax
  806967:	e8 90 05 00 00       	call   806efc <read_disk_asm>
  80696c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  80696f:	48 8b 05 aa 1e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21eaa]        # 428820 <running_req>
  806976:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  80697d:	48 8b 05 9c 1e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21e9c]        # 428820 <running_req>
  806984:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806988:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  80698f:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806992:	48 c7 05 83 1e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21e83],0x0        # 428820 <running_req>
  806999:	00 00 00 00 
    return ret;
  80699d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8069a0:	c9                   	leave  
  8069a1:	c3                   	ret    

00000000008069a2 <write_disk>:
int write_disk(driver_args* args)
{
  8069a2:	f3 0f 1e fa          	endbr64 
  8069a6:	55                   	push   rbp
  8069a7:	48 89 e5             	mov    rbp,rsp
  8069aa:	48 83 ec 20          	sub    rsp,0x20
  8069ae:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  8069b2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8069b6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8069b9:	48 98                	cdqe   
  8069bb:	48 89 c2             	mov    rdx,rax
  8069be:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8069c2:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8069c5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8069c9:	8b 00                	mov    eax,DWORD PTR [rax]
  8069cb:	89 ce                	mov    esi,ecx
  8069cd:	89 c7                	mov    edi,eax
  8069cf:	e8 a8 05 00 00       	call   806f7c <write_disk_asm>
  8069d4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  8069d7:	48 8b 05 42 1e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21e42]        # 428820 <running_req>
  8069de:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8069e5:	48 8b 05 34 1e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21e34]        # 428820 <running_req>
  8069ec:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8069f0:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8069f7:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8069fa:	48 c7 05 1b 1e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21e1b],0x0        # 428820 <running_req>
  806a01:	00 00 00 00 
    return ret;
  806a05:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806a08:	c9                   	leave  
  806a09:	c3                   	ret    

0000000000806a0a <chk_result>:
int chk_result(int r)
{
  806a0a:	f3 0f 1e fa          	endbr64 
  806a0e:	55                   	push   rbp
  806a0f:	48 89 e5             	mov    rbp,rsp
  806a12:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  806a15:	90                   	nop
  806a16:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806a19:	48 63 d0             	movsxd rdx,eax
  806a1c:	48 89 d0             	mov    rax,rdx
  806a1f:	48 01 c0             	add    rax,rax
  806a22:	48 01 d0             	add    rax,rdx
  806a25:	48 c1 e0 04          	shl    rax,0x4
  806a29:	48 05 3c 5b 42 00    	add    rax,0x425b3c
  806a2f:	8b 00                	mov    eax,DWORD PTR [rax]
  806a31:	83 f8 03             	cmp    eax,0x3
  806a34:	75 e0                	jne    806a16 <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  806a36:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806a39:	48 63 d0             	movsxd rdx,eax
  806a3c:	48 89 d0             	mov    rax,rdx
  806a3f:	48 01 c0             	add    rax,rax
  806a42:	48 01 d0             	add    rax,rdx
  806a45:	48 c1 e0 04          	shl    rax,0x4
  806a49:	48 05 40 5b 42 00    	add    rax,0x425b40
  806a4f:	8b 00                	mov    eax,DWORD PTR [rax]
  806a51:	83 f8 01             	cmp    eax,0x1
  806a54:	0f 94 c0             	sete   al
  806a57:	0f b6 c0             	movzx  eax,al
}
  806a5a:	5d                   	pop    rbp
  806a5b:	c3                   	ret    

0000000000806a5c <disk_existent>:
int disk_existent(int disk)
{
  806a5c:	f3 0f 1e fa          	endbr64 
  806a60:	55                   	push   rbp
  806a61:	48 89 e5             	mov    rbp,rsp
  806a64:	48 83 ec 10          	sub    rsp,0x10
  806a68:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  806a6b:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  806a6f:	74 5f                	je     806ad0 <disk_existent+0x74>
  806a71:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  806a75:	7f 6e                	jg     806ae5 <disk_existent+0x89>
  806a77:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  806a7b:	74 3e                	je     806abb <disk_existent+0x5f>
  806a7d:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  806a81:	7f 62                	jg     806ae5 <disk_existent+0x89>
  806a83:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  806a87:	74 08                	je     806a91 <disk_existent+0x35>
  806a89:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  806a8d:	74 17                	je     806aa6 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  806a8f:	eb 54                	jmp    806ae5 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  806a91:	bf 34 1f 81 00       	mov    edi,0x811f34
  806a96:	e8 69 c4 ff ff       	call   802f04 <sys_find_dev>
  806a9b:	83 f8 ff             	cmp    eax,0xffffffff
  806a9e:	0f 95 c0             	setne  al
  806aa1:	0f b6 c0             	movzx  eax,al
  806aa4:	eb 45                	jmp    806aeb <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  806aa6:	bf 38 1f 81 00       	mov    edi,0x811f38
  806aab:	e8 54 c4 ff ff       	call   802f04 <sys_find_dev>
  806ab0:	83 f8 ff             	cmp    eax,0xffffffff
  806ab3:	0f 95 c0             	setne  al
  806ab6:	0f b6 c0             	movzx  eax,al
  806ab9:	eb 30                	jmp    806aeb <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  806abb:	bf 3c 1f 81 00       	mov    edi,0x811f3c
  806ac0:	e8 3f c4 ff ff       	call   802f04 <sys_find_dev>
  806ac5:	83 f8 ff             	cmp    eax,0xffffffff
  806ac8:	0f 95 c0             	setne  al
  806acb:	0f b6 c0             	movzx  eax,al
  806ace:	eb 1b                	jmp    806aeb <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  806ad0:	bf 40 1f 81 00       	mov    edi,0x811f40
  806ad5:	e8 2a c4 ff ff       	call   802f04 <sys_find_dev>
  806ada:	83 f8 ff             	cmp    eax,0xffffffff
  806add:	0f 95 c0             	setne  al
  806ae0:	0f b6 c0             	movzx  eax,al
  806ae3:	eb 06                	jmp    806aeb <disk_existent+0x8f>
        break;
  806ae5:	90                   	nop
    }
    return 0;
  806ae6:	b8 00 00 00 00       	mov    eax,0x0
}
  806aeb:	c9                   	leave  
  806aec:	c3                   	ret    

0000000000806aed <hd_iterate>:
int hd_iterate()
{
  806aed:	f3 0f 1e fa          	endbr64 
  806af1:	55                   	push   rbp
  806af2:	48 89 e5             	mov    rbp,rsp
  806af5:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  806afc:	41 b8 00 00 00 00    	mov    r8d,0x0
  806b02:	b9 01 00 00 00       	mov    ecx,0x1
  806b07:	ba 00 00 00 00       	mov    edx,0x0
  806b0c:	be 02 00 00 00       	mov    esi,0x2
  806b11:	bf 00 00 00 00       	mov    edi,0x0
  806b16:	e8 3b f8 ff ff       	call   806356 <request>
  806b1b:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  806b1e:	41 b8 00 00 00 00    	mov    r8d,0x0
  806b24:	b9 01 00 00 00       	mov    ecx,0x1
  806b29:	ba 00 00 00 00       	mov    edx,0x0
  806b2e:	be 02 00 00 00       	mov    esi,0x2
  806b33:	bf 01 00 00 00       	mov    edi,0x1
  806b38:	e8 19 f8 ff ff       	call   806356 <request>
  806b3d:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  806b40:	41 b8 00 00 00 00    	mov    r8d,0x0
  806b46:	b9 01 00 00 00       	mov    ecx,0x1
  806b4b:	ba 00 00 00 00       	mov    edx,0x0
  806b50:	be 02 00 00 00       	mov    esi,0x2
  806b55:	bf 02 00 00 00       	mov    edi,0x2
  806b5a:	e8 f7 f7 ff ff       	call   806356 <request>
  806b5f:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  806b62:	41 b8 00 00 00 00    	mov    r8d,0x0
  806b68:	b9 01 00 00 00       	mov    ecx,0x1
  806b6d:	ba 00 00 00 00       	mov    edx,0x0
  806b72:	be 02 00 00 00       	mov    esi,0x2
  806b77:	bf 03 00 00 00       	mov    edi,0x3
  806b7c:	e8 d5 f7 ff ff       	call   806356 <request>
  806b81:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<4;i++)
  806b84:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806b8b:	e9 72 01 00 00       	jmp    806d02 <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  806b90:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806b94:	74 3b                	je     806bd1 <hd_iterate+0xe4>
  806b96:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806b9a:	7f 3e                	jg     806bda <hd_iterate+0xed>
  806b9c:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806ba0:	74 26                	je     806bc8 <hd_iterate+0xdb>
  806ba2:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806ba6:	7f 32                	jg     806bda <hd_iterate+0xed>
  806ba8:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  806bac:	74 08                	je     806bb6 <hd_iterate+0xc9>
  806bae:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  806bb2:	74 0b                	je     806bbf <hd_iterate+0xd2>
  806bb4:	eb 24                	jmp    806bda <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  806bb6:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  806bbd:	eb 25                	jmp    806be4 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  806bbf:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  806bc6:	eb 1c                	jmp    806be4 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  806bc8:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  806bcf:	eb 13                	jmp    806be4 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  806bd1:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  806bd8:	eb 0a                	jmp    806be4 <hd_iterate+0xf7>
        default:
            return -1;
  806bda:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806bdf:	e9 28 01 00 00       	jmp    806d0c <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  806be4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806be7:	48 98                	cdqe   
  806be9:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  806bed:	89 c7                	mov    edi,eax
  806bef:	e8 16 fe ff ff       	call   806a0a <chk_result>
  806bf4:	85 c0                	test   eax,eax
  806bf6:	0f 84 81 00 00 00    	je     806c7d <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  806bfc:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806bff:	89 c6                	mov    esi,eax
  806c01:	bf 44 1f 81 00       	mov    edi,0x811f44
  806c06:	b8 00 00 00 00       	mov    eax,0x0
  806c0b:	e8 62 a0 ff ff       	call   800c72 <printf>
            //新硬盘
            device hd={
  806c10:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  806c17:	b8 00 00 00 00       	mov    eax,0x0
  806c1c:	b9 15 00 00 00       	mov    ecx,0x15
  806c21:	48 89 d7             	mov    rdi,rdx
  806c24:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  806c27:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806c2a:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  806c30:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  806c37:	00 00 00 
  806c3a:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  806c41:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  806c44:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  806c48:	7f 07                	jg     806c51 <hd_iterate+0x164>
  806c4a:	b8 f0 01 00 00       	mov    eax,0x1f0
  806c4f:	eb 05                	jmp    806c56 <hd_iterate+0x169>
  806c51:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  806c56:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  806c5c:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  806c63:	48 89 c7             	mov    rdi,rax
  806c66:	e8 61 be ff ff       	call   802acc <reg_device>
  806c6b:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  806c6e:	48 63 d2             	movsxd rdx,edx
  806c71:	89 04 95 40 88 42 00 	mov    DWORD PTR [rdx*4+0x428840],eax
  806c78:	e9 81 00 00 00       	jmp    806cfe <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  806c7d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806c80:	48 98                	cdqe   
  806c82:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  806c86:	89 c7                	mov    edi,eax
  806c88:	e8 7d fd ff ff       	call   806a0a <chk_result>
  806c8d:	85 c0                	test   eax,eax
  806c8f:	75 6d                	jne    806cfe <hd_iterate+0x211>
        {
            switch (i)
  806c91:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806c95:	74 3e                	je     806cd5 <hd_iterate+0x1e8>
  806c97:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806c9b:	7f 41                	jg     806cde <hd_iterate+0x1f1>
  806c9d:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806ca1:	74 28                	je     806ccb <hd_iterate+0x1de>
  806ca3:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806ca7:	7f 35                	jg     806cde <hd_iterate+0x1f1>
  806ca9:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  806cad:	74 08                	je     806cb7 <hd_iterate+0x1ca>
  806caf:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  806cb3:	74 0c                	je     806cc1 <hd_iterate+0x1d4>
  806cb5:	eb 27                	jmp    806cde <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  806cb7:	48 c7 45 f8 34 1f 81 	mov    QWORD PTR [rbp-0x8],0x811f34
  806cbe:	00 
  806cbf:	eb 1d                	jmp    806cde <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  806cc1:	48 c7 45 f8 38 1f 81 	mov    QWORD PTR [rbp-0x8],0x811f38
  806cc8:	00 
  806cc9:	eb 13                	jmp    806cde <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  806ccb:	48 c7 45 f8 3c 1f 81 	mov    QWORD PTR [rbp-0x8],0x811f3c
  806cd2:	00 
  806cd3:	eb 09                	jmp    806cde <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  806cd5:	48 c7 45 f8 40 1f 81 	mov    QWORD PTR [rbp-0x8],0x811f40
  806cdc:	00 
  806cdd:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  806cde:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806ce2:	48 89 c7             	mov    rdi,rax
  806ce5:	e8 1a c2 ff ff       	call   802f04 <sys_find_dev>
  806cea:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  806ced:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806cf0:	89 c7                	mov    edi,eax
  806cf2:	e8 e1 c8 ff ff       	call   8035d8 <get_dev>
  806cf7:	89 c7                	mov    edi,eax
  806cf9:	e8 2d c8 ff ff       	call   80352b <dispose_device>
    for(int i=0;i<4;i++)
  806cfe:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  806d02:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806d06:	0f 8e 84 fe ff ff    	jle    806b90 <hd_iterate+0xa3>
        }

    }
}
  806d0c:	c9                   	leave  
  806d0d:	c3                   	ret    

0000000000806d0e <async_check_disk>:

int async_check_disk(int disk)
{
  806d0e:	f3 0f 1e fa          	endbr64 
  806d12:	55                   	push   rbp
  806d13:	48 89 e5             	mov    rbp,rsp
  806d16:	48 83 ec 20          	sub    rsp,0x20
  806d1a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  806d1d:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  806d23:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806d29:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806d2d:	74 06                	je     806d35 <async_check_disk+0x27>
  806d2f:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806d33:	75 06                	jne    806d3b <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  806d35:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  806d3b:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806d3f:	74 06                	je     806d47 <async_check_disk+0x39>
  806d41:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806d45:	75 06                	jne    806d4d <async_check_disk+0x3f>
        chkcmd=0xf0;
  806d47:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  806d4d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806d51:	83 c0 02             	add    eax,0x2
  806d54:	0f b7 c0             	movzx  eax,ax
  806d57:	be 01 00 00 00       	mov    esi,0x1
  806d5c:	89 c7                	mov    edi,eax
  806d5e:	e8 6d dd ff ff       	call   804ad0 <outb>
    outb(disknr+3,0);
  806d63:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806d67:	83 c0 03             	add    eax,0x3
  806d6a:	0f b7 c0             	movzx  eax,ax
  806d6d:	be 00 00 00 00       	mov    esi,0x0
  806d72:	89 c7                	mov    edi,eax
  806d74:	e8 57 dd ff ff       	call   804ad0 <outb>
    outb(disknr+4,0);
  806d79:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806d7d:	83 c0 04             	add    eax,0x4
  806d80:	0f b7 c0             	movzx  eax,ax
  806d83:	be 00 00 00 00       	mov    esi,0x0
  806d88:	89 c7                	mov    edi,eax
  806d8a:	e8 41 dd ff ff       	call   804ad0 <outb>
    outb(disknr+5,0);
  806d8f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806d93:	83 c0 05             	add    eax,0x5
  806d96:	0f b7 c0             	movzx  eax,ax
  806d99:	be 00 00 00 00       	mov    esi,0x0
  806d9e:	89 c7                	mov    edi,eax
  806da0:	e8 2b dd ff ff       	call   804ad0 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  806da5:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  806da9:	0f b6 d0             	movzx  edx,al
  806dac:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806db0:	83 c0 06             	add    eax,0x6
  806db3:	0f b7 c0             	movzx  eax,ax
  806db6:	89 d6                	mov    esi,edx
  806db8:	89 c7                	mov    edi,eax
  806dba:	e8 11 dd ff ff       	call   804ad0 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  806dbf:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806dc3:	83 c0 07             	add    eax,0x7
  806dc6:	0f b7 c0             	movzx  eax,ax
  806dc9:	be 90 00 00 00       	mov    esi,0x90
  806dce:	89 c7                	mov    edi,eax
  806dd0:	e8 fb dc ff ff       	call   804ad0 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  806dd5:	b8 00 00 00 00       	mov    eax,0x0
}
  806dda:	c9                   	leave  
  806ddb:	c3                   	ret    

0000000000806ddc <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  806ddc:	f3 0f 1e fa          	endbr64 
  806de0:	55                   	push   rbp
  806de1:	48 89 e5             	mov    rbp,rsp
  806de4:	48 83 ec 18          	sub    rsp,0x18
  806de8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  806dec:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  806df3:	eb 04                	jmp    806df9 <hd_do_req+0x1d>
  806df5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806df9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806dfc:	48 98                	cdqe   
  806dfe:	8b 14 85 40 88 42 00 	mov    edx,DWORD PTR [rax*4+0x428840]
  806e05:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806e09:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  806e0f:	39 c2                	cmp    edx,eax
  806e11:	75 e2                	jne    806df5 <hd_do_req+0x19>
    switch (args->cmd)
  806e13:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806e17:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  806e1d:	83 f8 04             	cmp    eax,0x4
  806e20:	74 72                	je     806e94 <hd_do_req+0xb8>
  806e22:	83 f8 04             	cmp    eax,0x4
  806e25:	0f 8f 96 00 00 00    	jg     806ec1 <hd_do_req+0xe5>
  806e2b:	83 f8 02             	cmp    eax,0x2
  806e2e:	74 0a                	je     806e3a <hd_do_req+0x5e>
  806e30:	83 f8 03             	cmp    eax,0x3
  806e33:	74 32                	je     806e67 <hd_do_req+0x8b>
  806e35:	e9 87 00 00 00       	jmp    806ec1 <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  806e3a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806e3e:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806e41:	48 98                	cdqe   
  806e43:	48 89 c6             	mov    rsi,rax
  806e46:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806e4a:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806e4d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806e51:	8b 10                	mov    edx,DWORD PTR [rax]
  806e53:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806e56:	49 89 f0             	mov    r8,rsi
  806e59:	be 00 00 00 00       	mov    esi,0x0
  806e5e:	89 c7                	mov    edi,eax
  806e60:	e8 f1 f4 ff ff       	call   806356 <request>
        break;
  806e65:	eb 61                	jmp    806ec8 <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  806e67:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806e6b:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806e6e:	48 98                	cdqe   
  806e70:	48 89 c6             	mov    rsi,rax
  806e73:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806e77:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806e7a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806e7e:	8b 10                	mov    edx,DWORD PTR [rax]
  806e80:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806e83:	49 89 f0             	mov    r8,rsi
  806e86:	be 01 00 00 00       	mov    esi,0x1
  806e8b:	89 c7                	mov    edi,eax
  806e8d:	e8 c4 f4 ff ff       	call   806356 <request>
        break;
  806e92:	eb 34                	jmp    806ec8 <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  806e94:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806e98:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806e9b:	48 98                	cdqe   
  806e9d:	48 89 c6             	mov    rsi,rax
  806ea0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806ea4:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806ea7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806eab:	8b 10                	mov    edx,DWORD PTR [rax]
  806ead:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806eb0:	49 89 f0             	mov    r8,rsi
  806eb3:	be 02 00 00 00       	mov    esi,0x2
  806eb8:	89 c7                	mov    edi,eax
  806eba:	e8 97 f4 ff ff       	call   806356 <request>
        break;
  806ebf:	eb 07                	jmp    806ec8 <hd_do_req+0xec>
    default:return -1;
  806ec1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806ec6:	eb 1e                	jmp    806ee6 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  806ec8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806ecc:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  806ed3:	00 00 00 
    running_devman_req=args;
  806ed6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806eda:	48 89 05 47 19 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21947],rax        # 428828 <running_devman_req>
    return 0;
  806ee1:	b8 00 00 00 00       	mov    eax,0x0
  806ee6:	c9                   	leave  
  806ee7:	c3                   	ret    
  806ee8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  806eef:	00 

0000000000806ef0 <disk_int_handler>:
  806ef0:	e8 09 dc ff ff       	call   804afe <eoi>
  806ef5:	e8 6d f2 ff ff       	call   806167 <disk_int_handler_c>
  806efa:	48 cf                	iretq  

0000000000806efc <read_disk_asm>:
  806efc:	55                   	push   rbp
  806efd:	89 e5                	mov    ebp,esp
  806eff:	66 ba f7 01          	mov    dx,0x1f7
  806f03:	31 c9                	xor    ecx,ecx
  806f05:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  806f0a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  806f0f:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  806f14:	89 c6                	mov    esi,eax
  806f16:	66 ba f2 01          	mov    dx,0x1f2
  806f1a:	88 c8                	mov    al,cl
  806f1c:	ee                   	out    dx,al
  806f1d:	66 ba f3 01          	mov    dx,0x1f3
  806f21:	89 f0                	mov    eax,esi
  806f23:	ee                   	out    dx,al
  806f24:	66 ff c2             	inc    dx
  806f27:	c1 e8 08             	shr    eax,0x8
  806f2a:	ee                   	out    dx,al
  806f2b:	66 ff c2             	inc    dx
  806f2e:	c1 e8 08             	shr    eax,0x8
  806f31:	ee                   	out    dx,al
  806f32:	66 ff c2             	inc    dx
  806f35:	66 c1 e8 08          	shr    ax,0x8
  806f39:	24 0f                	and    al,0xf
  806f3b:	0c e0                	or     al,0xe0
  806f3d:	ee                   	out    dx,al
  806f3e:	66 ff c2             	inc    dx
  806f41:	b0 20                	mov    al,0x20
  806f43:	ee                   	out    dx,al

0000000000806f44 <read_disk_asm.wait>:
  806f44:	90                   	nop
  806f45:	ec                   	in     al,dx
  806f46:	24 88                	and    al,0x88
  806f48:	3c 08                	cmp    al,0x8
  806f4a:	75 f8                	jne    806f44 <read_disk_asm.wait>
  806f4c:	66 89 d7             	mov    di,dx
  806f4f:	89 c8                	mov    eax,ecx
  806f51:	66 b9 00 01          	mov    cx,0x100
  806f55:	66 f7 e1             	mul    cx
  806f58:	89 c1                	mov    ecx,eax
  806f5a:	66 ba f0 01          	mov    dx,0x1f0

0000000000806f5e <read_disk_asm.read>:
  806f5e:	66 ed                	in     ax,dx
  806f60:	66 67 89 03          	mov    WORD PTR [ebx],ax
  806f64:	83 c3 02             	add    ebx,0x2
  806f67:	e2 f5                	loop   806f5e <read_disk_asm.read>
  806f69:	c9                   	leave  
  806f6a:	b8 00 00 00 00       	mov    eax,0x0
  806f6f:	c3                   	ret    

0000000000806f70 <read_disk_asm.err_disk_reading>:
  806f70:	66 ba f1 01          	mov    dx,0x1f1
  806f74:	31 c0                	xor    eax,eax
  806f76:	66 ed                	in     ax,dx
  806f78:	89 ec                	mov    esp,ebp
  806f7a:	5d                   	pop    rbp
  806f7b:	c3                   	ret    

0000000000806f7c <write_disk_asm>:
  806f7c:	55                   	push   rbp
  806f7d:	89 e5                	mov    ebp,esp
  806f7f:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  806f84:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  806f89:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  806f8e:	50                   	push   rax
  806f8f:	66 ba f2 01          	mov    dx,0x1f2
  806f93:	88 c8                	mov    al,cl
  806f95:	ee                   	out    dx,al
  806f96:	58                   	pop    rax
  806f97:	66 ba f3 01          	mov    dx,0x1f3
  806f9b:	ee                   	out    dx,al
  806f9c:	c1 e8 08             	shr    eax,0x8
  806f9f:	66 ba f4 01          	mov    dx,0x1f4
  806fa3:	ee                   	out    dx,al
  806fa4:	c1 e8 08             	shr    eax,0x8
  806fa7:	66 ba f5 01          	mov    dx,0x1f5
  806fab:	ee                   	out    dx,al
  806fac:	c1 e8 08             	shr    eax,0x8
  806faf:	24 0f                	and    al,0xf
  806fb1:	0c e0                	or     al,0xe0
  806fb3:	66 ba f6 01          	mov    dx,0x1f6
  806fb7:	ee                   	out    dx,al
  806fb8:	66 ba f7 01          	mov    dx,0x1f7
  806fbc:	b0 30                	mov    al,0x30
  806fbe:	ee                   	out    dx,al

0000000000806fbf <write_disk_asm.not_ready2>:
  806fbf:	90                   	nop
  806fc0:	ec                   	in     al,dx
  806fc1:	24 88                	and    al,0x88
  806fc3:	3c 08                	cmp    al,0x8
  806fc5:	75 f8                	jne    806fbf <write_disk_asm.not_ready2>
  806fc7:	89 c8                	mov    eax,ecx
  806fc9:	66 b9 00 01          	mov    cx,0x100
  806fcd:	66 f7 e1             	mul    cx
  806fd0:	89 c1                	mov    ecx,eax
  806fd2:	66 ba f0 01          	mov    dx,0x1f0

0000000000806fd6 <write_disk_asm.go_on_write>:
  806fd6:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  806fda:	66 ef                	out    dx,ax
  806fdc:	83 c3 02             	add    ebx,0x2
  806fdf:	e2 f5                	loop   806fd6 <write_disk_asm.go_on_write>
  806fe1:	89 ec                	mov    esp,ebp
  806fe3:	5d                   	pop    rbp
  806fe4:	c3                   	ret    

0000000000806fe5 <init_fat16>:

int fat16_drvi;
extern driver drv_disk;
extern int disk_drvi;
int init_fat16()
{
  806fe5:	f3 0f 1e fa          	endbr64 
  806fe9:	55                   	push   rbp
  806fea:	48 89 e5             	mov    rbp,rsp
  806fed:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
    reg_device(&fat16_dev);
  806ff4:	bf 00 20 81 00       	mov    edi,0x812000
  806ff9:	e8 ce ba ff ff       	call   802acc <reg_device>
    fat16_drvi=reg_driver(&fat16_drv);
  806ffe:	bf 60 1f 81 00       	mov    edi,0x811f60
  807003:	e8 ac bd ff ff       	call   802db4 <reg_driver>
  807008:	89 05 b6 9a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29ab6],eax        # 430ac4 <fat16_drvi>
    driver_args arg;
    load(&arg);//syscall(SYSCALL_CALL_DRVFUNC,fat16_drvi,DRVF_OPEN,&arg,0,0);
  80700e:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  807015:	48 89 c7             	mov    rdi,rax
  807018:	e8 26 00 00 00       	call   807043 <load>
    reg_vol(disk_drvi,fat16_drvi,"a");
  80701d:	8b 0d a1 9a c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc29aa1]        # 430ac4 <fat16_drvi>
  807023:	8b 05 07 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21807]        # 428830 <disk_drvi>
  807029:	ba a8 20 81 00       	mov    edx,0x8120a8
  80702e:	89 ce                	mov    esi,ecx
  807030:	89 c7                	mov    edi,eax
  807032:	b8 00 00 00 00       	mov    eax,0x0
  807037:	e8 18 aa ff ff       	call   801a54 <reg_vol>
    return 0;
  80703c:	b8 00 00 00 00       	mov    eax,0x0
}
  807041:	c9                   	leave  
  807042:	c3                   	ret    

0000000000807043 <load>:
int load(driver_args *args)
{
  807043:	f3 0f 1e fa          	endbr64 
  807047:	55                   	push   rbp
  807048:	48 89 e5             	mov    rbp,rsp
  80704b:	48 83 ec 20          	sub    rsp,0x20
  80704f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    //sys_read superblock
    int req_id=-1;
  807053:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    read_sec(&superblock,0,1);
  80705a:	ba 01 00 00 00       	mov    edx,0x1
  80705f:	be 00 00 00 00       	mov    esi,0x0
  807064:	bf 60 88 42 00       	mov    edi,0x428860
  807069:	e8 61 0b 00 00       	call   807bcf <read_sec>
    //只能一个一个读
    read_sec(fat,superblock.rsvdSec,superblock.secPerFAT);
  80706e:	0f b7 05 01 18 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21801]        # 428876 <superblock+0x16>
  807075:	0f b7 d0             	movzx  edx,ax
  807078:	0f b7 05 ef 17 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc217ef]        # 42886e <superblock+0xe>
  80707f:	0f b7 c0             	movzx  eax,ax
  807082:	89 c6                	mov    esi,eax
  807084:	bf c0 ca 42 00       	mov    edi,0x42cac0
  807089:	e8 41 0b 00 00       	call   807bcf <read_sec>

    //sys_read root
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  80708e:	0f b7 05 d9 17 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc217d9]        # 42886e <superblock+0xe>
  807095:	0f b7 c8             	movzx  ecx,ax
  807098:	0f b7 05 d7 17 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc217d7]        # 428876 <superblock+0x16>
  80709f:	0f b7 d0             	movzx  edx,ax
    superblock.numOfFAT;
  8070a2:	0f b6 05 c7 17 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc217c7]        # 428870 <superblock+0x10>
  8070a9:	0f b6 c0             	movzx  eax,al
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  8070ac:	0f af c2             	imul   eax,edx
  8070af:	01 c8                	add    eax,ecx
  8070b1:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //printf("root sec num:%d\n",root_sec_num);
    //usually a root dir has 32 secs
    int root_sec_c=((u32)superblock.rootEntries* sizeof(dir_entry))/(u32)superblock.bytesPerSec;
  8070b4:	0f b7 05 b6 17 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc217b6]        # 428871 <superblock+0x11>
  8070bb:	0f b7 c0             	movzx  eax,ax
  8070be:	48 c1 e0 05          	shl    rax,0x5
  8070c2:	0f b7 15 a2 17 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc217a2]        # 42886b <superblock+0xb>
  8070c9:	0f b7 ca             	movzx  ecx,dx
  8070cc:	ba 00 00 00 00       	mov    edx,0x0
  8070d1:	48 f7 f1             	div    rcx
  8070d4:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    read_sec(root_dir,root_sec_num,root_sec_c);
  8070d7:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8070da:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8070dd:	89 c6                	mov    esi,eax
  8070df:	bf a0 88 42 00       	mov    edi,0x4288a0
  8070e4:	e8 e6 0a 00 00       	call   807bcf <read_sec>

    cur_dir.fistCluNum=0;
  8070e9:	66 c7 05 c8 57 c2 ff 	mov    WORD PTR [rip+0xffffffffffc257c8],0x0        # 42c8ba <cur_dir+0x1a>
  8070f0:	00 00 

    //set some vars
    //why? because the .bss won't be packed into bin so any init
    //of global var in .c is meaningless.
    clu_sec_balance=superblock.rsvdSec+32+32-2;//63;
  8070f2:	0f b7 05 75 17 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21775]        # 42886e <superblock+0xe>
  8070f9:	0f b7 c0             	movzx  eax,ax
  8070fc:	83 c0 3e             	add    eax,0x3e
  8070ff:	89 05 3b 31 00 00    	mov    DWORD PTR [rip+0x313b],eax        # 80a240 <clu_sec_balance>
    //printf("clu sec bal:%d\n",clu_sec_balance);
    dir_depth=0;
  807105:	c7 05 b1 99 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc299b1],0x0        # 430ac0 <dir_depth>
  80710c:	00 00 00 
    return 0;
  80710f:	b8 00 00 00 00       	mov    eax,0x0

}
  807114:	c9                   	leave  
  807115:	c3                   	ret    

0000000000807116 <verify_name>:

//检查输入的文件名长度是否合法，以及是否出现非法字符（但是不检查大小写和.）
//返回值为布尔值。
int verify_name(char *str)
{
  807116:	f3 0f 1e fa          	endbr64 
  80711a:	55                   	push   rbp
  80711b:	48 89 e5             	mov    rbp,rsp
  80711e:	48 83 ec 70          	sub    rsp,0x70
  807122:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
    char valid_ch[]="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,/![]|+";
  807126:	48 b8 61 62 63 64 65 	movabs rax,0x6867666564636261
  80712d:	66 67 68 
  807130:	48 ba 69 6a 6b 6c 6d 	movabs rdx,0x706f6e6d6c6b6a69
  807137:	6e 6f 70 
  80713a:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  80713e:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  807142:	48 b8 71 72 73 74 75 	movabs rax,0x7877767574737271
  807149:	76 77 78 
  80714c:	48 ba 79 7a 41 42 43 	movabs rdx,0x4645444342417a79
  807153:	44 45 46 
  807156:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  80715a:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  80715e:	48 b8 47 48 49 4a 4b 	movabs rax,0x4e4d4c4b4a494847
  807165:	4c 4d 4e 
  807168:	48 ba 4f 50 51 52 53 	movabs rdx,0x565554535251504f
  80716f:	54 55 56 
  807172:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  807176:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  80717a:	48 b8 57 58 59 5a 30 	movabs rax,0x333231305a595857
  807181:	31 32 33 
  807184:	48 ba 34 35 36 37 38 	movabs rdx,0x2f2c393837363534
  80718b:	39 2c 2f 
  80718e:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  807192:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  807196:	c7 45 e0 21 5b 5d 7c 	mov    DWORD PTR [rbp-0x20],0x7c5d5b21
  80719d:	66 c7 45 e4 2b 00    	mov    WORD PTR [rbp-0x1c],0x2b
    if(strlen(str)>11||strlen(str)==0) {
  8071a3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8071a7:	48 89 c7             	mov    rdi,rax
  8071aa:	e8 24 28 00 00       	call   8099d3 <strlen>
  8071af:	83 f8 0b             	cmp    eax,0xb
  8071b2:	7f 10                	jg     8071c4 <verify_name+0xae>
  8071b4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8071b8:	48 89 c7             	mov    rdi,rax
  8071bb:	e8 13 28 00 00       	call   8099d3 <strlen>
  8071c0:	85 c0                	test   eax,eax
  8071c2:	75 0a                	jne    8071ce <verify_name+0xb8>
        //printf("length not valid\n");
        return 0;
  8071c4:	b8 00 00 00 00       	mov    eax,0x0
  8071c9:	e9 b3 01 00 00       	jmp    807381 <verify_name+0x26b>
    }
    int c=0,i=0,flag=0,vchf=1;
  8071ce:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8071d5:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8071dc:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8071e3:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [rbp-0x18],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  8071ea:	eb 6b                	jmp    807257 <verify_name+0x141>
    {
        int j=0;
  8071ec:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        for(;j<sizeof(valid_ch);j++)
  8071f3:	eb 22                	jmp    807217 <verify_name+0x101>
            if(str[i]==valid_ch[j])break;
  8071f5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8071f8:	48 63 d0             	movsxd rdx,eax
  8071fb:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8071ff:	48 01 d0             	add    rax,rdx
  807202:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  807205:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  807208:	48 98                	cdqe   
  80720a:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  80720f:	38 c2                	cmp    dl,al
  807211:	74 0e                	je     807221 <verify_name+0x10b>
        for(;j<sizeof(valid_ch);j++)
  807213:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  807217:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80721a:	83 f8 45             	cmp    eax,0x45
  80721d:	76 d6                	jbe    8071f5 <verify_name+0xdf>
  80721f:	eb 01                	jmp    807222 <verify_name+0x10c>
            if(str[i]==valid_ch[j])break;
  807221:	90                   	nop
        if(j>=sizeof(valid_ch))
  807222:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  807225:	83 f8 45             	cmp    eax,0x45
  807228:	76 0a                	jbe    807234 <verify_name+0x11e>
        {
            //printf("invalid char\n");
            return 0;//出现非法字符
  80722a:	b8 00 00 00 00       	mov    eax,0x0
  80722f:	e9 4d 01 00 00       	jmp    807381 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  807234:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807237:	48 63 d0             	movsxd rdx,eax
  80723a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80723e:	48 01 d0             	add    rax,rdx
  807241:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807244:	3c 20                	cmp    al,0x20
  807246:	74 07                	je     80724f <verify_name+0x139>
  807248:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        c++;
  80724f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  807253:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807257:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80725a:	48 63 d0             	movsxd rdx,eax
  80725d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807261:	48 01 d0             	add    rax,rdx
  807264:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807267:	3c 2e                	cmp    al,0x2e
  807269:	74 18                	je     807283 <verify_name+0x16d>
  80726b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80726e:	48 63 d0             	movsxd rdx,eax
  807271:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807275:	48 01 d0             	add    rax,rdx
  807278:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80727b:	84 c0                	test   al,al
  80727d:	0f 85 69 ff ff ff    	jne    8071ec <verify_name+0xd6>
    }
    if(c>8||flag==0){
  807283:	83 7d fc 08          	cmp    DWORD PTR [rbp-0x4],0x8
  807287:	7f 06                	jg     80728f <verify_name+0x179>
  807289:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80728d:	75 0a                	jne    807299 <verify_name+0x183>
        //printf("file name blank\n");
        return 0;//不能全是空格
  80728f:	b8 00 00 00 00       	mov    eax,0x0
  807294:	e9 e8 00 00 00       	jmp    807381 <verify_name+0x26b>
    }
    if(str[i]=='\0')//没有扩展名
  807299:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80729c:	48 63 d0             	movsxd rdx,eax
  80729f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8072a3:	48 01 d0             	add    rax,rdx
  8072a6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8072a9:	84 c0                	test   al,al
  8072ab:	75 0a                	jne    8072b7 <verify_name+0x1a1>
        return 1;
  8072ad:	b8 01 00 00 00       	mov    eax,0x1
  8072b2:	e9 ca 00 00 00       	jmp    807381 <verify_name+0x26b>
    c=0;
  8072b7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    flag=0;
  8072be:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(i++;str[i]!='\0';i++)
  8072c5:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8072c9:	e9 83 00 00 00       	jmp    807351 <verify_name+0x23b>
    {
        int j=0;
  8072ce:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
        for(;j<sizeof(valid_ch);j++)
  8072d5:	eb 22                	jmp    8072f9 <verify_name+0x1e3>
            if(str[i]==valid_ch[j])break;
  8072d7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8072da:	48 63 d0             	movsxd rdx,eax
  8072dd:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8072e1:	48 01 d0             	add    rax,rdx
  8072e4:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8072e7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8072ea:	48 98                	cdqe   
  8072ec:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  8072f1:	38 c2                	cmp    dl,al
  8072f3:	74 0e                	je     807303 <verify_name+0x1ed>
        for(;j<sizeof(valid_ch);j++)
  8072f5:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8072f9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8072fc:	83 f8 45             	cmp    eax,0x45
  8072ff:	76 d6                	jbe    8072d7 <verify_name+0x1c1>
  807301:	eb 01                	jmp    807304 <verify_name+0x1ee>
            if(str[i]==valid_ch[j])break;
  807303:	90                   	nop
        if(j>=sizeof(valid_ch)){
  807304:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807307:	83 f8 45             	cmp    eax,0x45
  80730a:	76 07                	jbe    807313 <verify_name+0x1fd>
            //printf("invalid char:%x\n",str[i]);
            return 0;//出现非法字符
  80730c:	b8 00 00 00 00       	mov    eax,0x0
  807311:	eb 6e                	jmp    807381 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  807313:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807316:	48 63 d0             	movsxd rdx,eax
  807319:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80731d:	48 01 d0             	add    rax,rdx
  807320:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807323:	3c 20                	cmp    al,0x20
  807325:	74 07                	je     80732e <verify_name+0x218>
  807327:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        if(str[i]=='.'){
  80732e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807331:	48 63 d0             	movsxd rdx,eax
  807334:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807338:	48 01 d0             	add    rax,rdx
  80733b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80733e:	3c 2e                	cmp    al,0x2e
  807340:	75 07                	jne    807349 <verify_name+0x233>
            //printf("multiple dots.");
            return 0;//不能多次出现.
  807342:	b8 00 00 00 00       	mov    eax,0x0
  807347:	eb 38                	jmp    807381 <verify_name+0x26b>
        }
        c++;
  807349:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(i++;str[i]!='\0';i++)
  80734d:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807351:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807354:	48 63 d0             	movsxd rdx,eax
  807357:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80735b:	48 01 d0             	add    rax,rdx
  80735e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807361:	84 c0                	test   al,al
  807363:	0f 85 65 ff ff ff    	jne    8072ce <verify_name+0x1b8>
    }
    if(c>3||flag==0){
  807369:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  80736d:	7f 06                	jg     807375 <verify_name+0x25f>
  80736f:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  807373:	75 07                	jne    80737c <verify_name+0x266>
        //printf("file name blank\n");
        return 0;//不能全是空格
  807375:	b8 00 00 00 00       	mov    eax,0x0
  80737a:	eb 05                	jmp    807381 <verify_name+0x26b>
    }
    return 1;
  80737c:	b8 01 00 00 00       	mov    eax,0x1
}
  807381:	c9                   	leave  
  807382:	c3                   	ret    

0000000000807383 <format_name>:
//将“aaa.bb”的文件名形式转换为可以直接strcmp(,,11)的形式。
//默认文件名合法，请先检查文件名再使用。
void format_name(char *str)
{
  807383:	f3 0f 1e fa          	endbr64 
  807387:	55                   	push   rbp
  807388:	48 89 e5             	mov    rbp,rsp
  80738b:	48 83 ec 30          	sub    rsp,0x30
  80738f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char v[12]="           ";
  807393:	48 b8 20 20 20 20 20 	movabs rax,0x2020202020202020
  80739a:	20 20 20 
  80739d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8073a1:	c7 45 f0 20 20 20 00 	mov    DWORD PTR [rbp-0x10],0x202020
    int ptr=0;
  8073a8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    int namelen=0;
  8073af:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    for(int i=0;str[i]!='\0';i++)
  8073b6:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8073bd:	e9 9b 00 00 00       	jmp    80745d <format_name+0xda>
    {
        if(str[i]>='a'&&str[i]<='z')
  8073c2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8073c5:	48 63 d0             	movsxd rdx,eax
  8073c8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8073cc:	48 01 d0             	add    rax,rdx
  8073cf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8073d2:	3c 60                	cmp    al,0x60
  8073d4:	7e 3e                	jle    807414 <format_name+0x91>
  8073d6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8073d9:	48 63 d0             	movsxd rdx,eax
  8073dc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8073e0:	48 01 d0             	add    rax,rdx
  8073e3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8073e6:	3c 7a                	cmp    al,0x7a
  8073e8:	7f 2a                	jg     807414 <format_name+0x91>
        {
            v[ptr++]=str[i]-'a'+'A';
  8073ea:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8073ed:	48 63 d0             	movsxd rdx,eax
  8073f0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8073f4:	48 01 d0             	add    rax,rdx
  8073f7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8073fa:	8d 48 e0             	lea    ecx,[rax-0x20]
  8073fd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807400:	8d 50 01             	lea    edx,[rax+0x1]
  807403:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  807406:	89 ca                	mov    edx,ecx
  807408:	48 98                	cdqe   
  80740a:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  80740e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807412:	eb 45                	jmp    807459 <format_name+0xd6>
        }
        else if(str[i]=='.')
  807414:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807417:	48 63 d0             	movsxd rdx,eax
  80741a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80741e:	48 01 d0             	add    rax,rdx
  807421:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807424:	3c 2e                	cmp    al,0x2e
  807426:	75 0d                	jne    807435 <format_name+0xb2>
        {
            ptr+=(8-namelen);
  807428:	b8 08 00 00 00       	mov    eax,0x8
  80742d:	2b 45 f8             	sub    eax,DWORD PTR [rbp-0x8]
  807430:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
  807433:	eb 24                	jmp    807459 <format_name+0xd6>
        }else
        {
            v[ptr++]=str[i];
  807435:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807438:	48 63 d0             	movsxd rdx,eax
  80743b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80743f:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807443:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807446:	8d 50 01             	lea    edx,[rax+0x1]
  807449:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80744c:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
  80744f:	48 98                	cdqe   
  807451:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  807455:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
    for(int i=0;str[i]!='\0';i++)
  807459:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80745d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807460:	48 63 d0             	movsxd rdx,eax
  807463:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807467:	48 01 d0             	add    rax,rdx
  80746a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80746d:	84 c0                	test   al,al
  80746f:	0f 85 4d ff ff ff    	jne    8073c2 <format_name+0x3f>
        }
    }
    v[12]='\0';
  807475:	c6 45 f4 00          	mov    BYTE PTR [rbp-0xc],0x0
    strcpy(str,v);
  807479:	48 8d 55 e8          	lea    rdx,[rbp-0x18]
  80747d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807481:	48 89 d6             	mov    rsi,rdx
  807484:	48 89 c7             	mov    rdi,rax
  807487:	e8 28 23 00 00       	call   8097b4 <strcpy>
}
  80748c:	90                   	nop
  80748d:	c9                   	leave  
  80748e:	c3                   	ret    

000000000080748f <req_cluster>:
int req_cluster()
{
  80748f:	f3 0f 1e fa          	endbr64 
  807493:	55                   	push   rbp
  807494:	48 89 e5             	mov    rbp,rsp
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  807497:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [rbp-0x4],0x3
  80749e:	eb 2a                	jmp    8074ca <req_cluster+0x3b>
    {
        if(fat[i]==0)
  8074a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8074a3:	48 98                	cdqe   
  8074a5:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8074ac:	00 
  8074ad:	66 85 c0             	test   ax,ax
  8074b0:	75 14                	jne    8074c6 <req_cluster+0x37>
        {
            fat[i]=0xffff;
  8074b2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8074b5:	48 98                	cdqe   
  8074b7:	66 c7 84 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],0xffff
  8074be:	00 ff ff 
            return i;
  8074c1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8074c4:	eb 13                	jmp    8074d9 <req_cluster+0x4a>
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  8074c6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8074ca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8074cd:	3d ff 1f 00 00       	cmp    eax,0x1fff
  8074d2:	76 cc                	jbe    8074a0 <req_cluster+0x11>
        }
    }
    return -1;
  8074d4:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8074d9:	5d                   	pop    rbp
  8074da:	c3                   	ret    

00000000008074db <write_sec>:
int write_sec(char *src, int sec_num, int sec_c)
{
  8074db:	f3 0f 1e fa          	endbr64 
  8074df:	55                   	push   rbp
  8074e0:	48 89 e5             	mov    rbp,rsp
  8074e3:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
  8074ea:	48 89 bd 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rdi
  8074f1:	89 b5 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],esi
  8074f7:	89 95 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],edx
    driver_args arg={
  8074fd:	48 8d 95 40 ff ff ff 	lea    rdx,[rbp-0xc0]
  807504:	b8 00 00 00 00       	mov    eax,0x0
  807509:	b9 18 00 00 00       	mov    ecx,0x18
  80750e:	48 89 d7             	mov    rdi,rdx
  807511:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  807514:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  80751b:	89 85 48 ff ff ff    	mov    DWORD PTR [rbp-0xb8],eax
  807521:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  807527:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
  80752d:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  807533:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            .src_addr=src,
            .sec_n=sec_num,
            .sec_c=sec_c
    };
    return drv_disk.read(&arg);
  807539:	48 8b 15 78 2c 00 00 	mov    rdx,QWORD PTR [rip+0x2c78]        # 80a1b8 <drv_disk+0x18>
  807540:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  807547:	48 89 c7             	mov    rdi,rax
  80754a:	ff d2                	call   rdx
}
  80754c:	c9                   	leave  
  80754d:	c3                   	ret    

000000000080754e <set_attr>:
void set_attr(dir_entry *f,char attr)
{
  80754e:	f3 0f 1e fa          	endbr64 
  807552:	55                   	push   rbp
  807553:	48 89 e5             	mov    rbp,rsp
  807556:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80755a:	89 f0                	mov    eax,esi
  80755c:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    f->attr|=attr;
  80755f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807563:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  807567:	0a 45 f4             	or     al,BYTE PTR [rbp-0xc]
  80756a:	89 c2                	mov    edx,eax
  80756c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807570:	88 50 0b             	mov    BYTE PTR [rax+0xb],dl
}
  807573:	90                   	nop
  807574:	5d                   	pop    rbp
  807575:	c3                   	ret    

0000000000807576 <update_fat_and_root>:
mkdir
touch
rm
*/
void update_fat_and_root()
{
  807576:	f3 0f 1e fa          	endbr64 
  80757a:	55                   	push   rbp
  80757b:	48 89 e5             	mov    rbp,rsp
  80757e:	48 83 ec 10          	sub    rsp,0x10
    int root_loc=superblock.rsvdSec+\
  807582:	0f b7 05 e5 12 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc212e5]        # 42886e <superblock+0xe>
  807589:	0f b7 c8             	movzx  ecx,ax
    superblock.secPerFAT*superblock.numOfFAT;
  80758c:	0f b7 05 e3 12 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc212e3]        # 428876 <superblock+0x16>
  807593:	0f b7 d0             	movzx  edx,ax
  807596:	0f b6 05 d3 12 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc212d3]        # 428870 <superblock+0x10>
  80759d:	0f b6 c0             	movzx  eax,al
  8075a0:	0f af c2             	imul   eax,edx
    int root_loc=superblock.rsvdSec+\
  8075a3:	01 c8                	add    eax,ecx
  8075a5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("root_loc:0x%x\n",root_loc);
    write_sec(root_dir,root_loc,sizeof(root_dir));
  8075a8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8075ab:	ba 00 40 00 00       	mov    edx,0x4000
  8075b0:	89 c6                	mov    esi,eax
  8075b2:	bf a0 88 42 00       	mov    edi,0x4288a0
  8075b7:	e8 1f ff ff ff       	call   8074db <write_sec>
    //printf("updated root\n");
    write_sec(fat,superblock.rsvdSec,sizeof(fat));
  8075bc:	0f b7 05 ab 12 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc212ab]        # 42886e <superblock+0xe>
  8075c3:	0f b7 c0             	movzx  eax,ax
  8075c6:	ba 00 40 00 00       	mov    edx,0x4000
  8075cb:	89 c6                	mov    esi,eax
  8075cd:	bf c0 ca 42 00       	mov    edi,0x42cac0
  8075d2:	e8 04 ff ff ff       	call   8074db <write_sec>
    //printf("updated fat\n");

}
  8075d7:	90                   	nop
  8075d8:	c9                   	leave  
  8075d9:	c3                   	ret    

00000000008075da <add_dot_and_ddot_dir>:
void add_dot_and_ddot_dir(dir_entry dir)
{
  8075da:	f3 0f 1e fa          	endbr64 
  8075de:	55                   	push   rbp
  8075df:	48 89 e5             	mov    rbp,rsp
  8075e2:	48 83 ec 10          	sub    rsp,0x10
    //it must be a regular dir to add. and ..
    //and this must be done when the dir is created
    //regular dir
    int cluster = dir.fistCluNum;
  8075e6:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  8075ea:	0f b7 c0             	movzx  eax,ax
  8075ed:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
    superblock.secPerClu);
  8075f0:	0f b6 05 76 12 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21276]        # 42886d <superblock+0xd>
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  8075f7:	0f b6 c0             	movzx  eax,al
  8075fa:	8b 0d 40 2c 00 00    	mov    ecx,DWORD PTR [rip+0x2c40]        # 80a240 <clu_sec_balance>
  807600:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  807603:	01 d1                	add    ecx,edx
  807605:	89 c2                	mov    edx,eax
  807607:	89 ce                	mov    esi,ecx
  807609:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  80760e:	e8 bc 05 00 00       	call   807bcf <read_sec>
    //.
    strcpy(a_clu_of_dir[0].name,".       ");
  807613:	be aa 20 81 00       	mov    esi,0x8120aa
  807618:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  80761d:	e8 92 21 00 00       	call   8097b4 <strcpy>
    strcpy(a_clu_of_dir[0].extension,"   ");
  807622:	be b3 20 81 00       	mov    esi,0x8120b3
  807627:	bf c8 c8 42 00       	mov    edi,0x42c8c8
  80762c:	e8 83 21 00 00       	call   8097b4 <strcpy>
    a_clu_of_dir[0].fistCluNum=dir.fistCluNum;
  807631:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  807635:	66 89 05 9e 52 c2 ff 	mov    WORD PTR [rip+0xffffffffffc2529e],ax        # 42c8da <a_clu_of_dir+0x1a>
    a_clu_of_dir[0].len=0;
  80763c:	c7 05 96 52 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc25296],0x0        # 42c8dc <a_clu_of_dir+0x1c>
  807643:	00 00 00 
    set_attr(&a_clu_of_dir[0],ATTR_DIR);
  807646:	be 10 00 00 00       	mov    esi,0x10
  80764b:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807650:	e8 f9 fe ff ff       	call   80754e <set_attr>
    //..
    strcpy(a_clu_of_dir[1].name,"..      ");
  807655:	be b7 20 81 00       	mov    esi,0x8120b7
  80765a:	bf e0 c8 42 00       	mov    edi,0x42c8e0
  80765f:	e8 50 21 00 00       	call   8097b4 <strcpy>
    strcpy(a_clu_of_dir[1].extension,"   ");
  807664:	be b3 20 81 00       	mov    esi,0x8120b3
  807669:	bf e8 c8 42 00       	mov    edi,0x42c8e8
  80766e:	e8 41 21 00 00       	call   8097b4 <strcpy>
    a_clu_of_dir[1].fistCluNum=cur_dir.fistCluNum;
  807673:	0f b7 05 40 52 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc25240]        # 42c8ba <cur_dir+0x1a>
  80767a:	66 89 05 79 52 c2 ff 	mov    WORD PTR [rip+0xffffffffffc25279],ax        # 42c8fa <a_clu_of_dir+0x3a>
    a_clu_of_dir[1].len=0;
  807681:	c7 05 71 52 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc25271],0x0        # 42c8fc <a_clu_of_dir+0x3c>
  807688:	00 00 00 
    set_attr(&a_clu_of_dir[1],ATTR_DIR);
  80768b:	be 10 00 00 00       	mov    esi,0x10
  807690:	bf e0 c8 42 00       	mov    edi,0x42c8e0
  807695:	e8 b4 fe ff ff       	call   80754e <set_attr>
    //update the dir
    int dir_loc=cluster+clu_sec_balance;
  80769a:	8b 15 a0 2b 00 00    	mov    edx,DWORD PTR [rip+0x2ba0]        # 80a240 <clu_sec_balance>
  8076a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8076a3:	01 d0                	add    eax,edx
  8076a5:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  8076a8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8076ab:	ba 00 02 00 00       	mov    edx,0x200
  8076b0:	89 c6                	mov    esi,eax
  8076b2:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  8076b7:	e8 1f fe ff ff       	call   8074db <write_sec>
    //no need to update fat and root
}
  8076bc:	90                   	nop
  8076bd:	c9                   	leave  
  8076be:	c3                   	ret    

00000000008076bf <translate_attr>:
void translate_attr(char attr,char *attr_s)
{
  8076bf:	f3 0f 1e fa          	endbr64 
  8076c3:	55                   	push   rbp
  8076c4:	48 89 e5             	mov    rbp,rsp
  8076c7:	89 f8                	mov    eax,edi
  8076c9:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8076cd:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    //rwhds (s: system h:hidden)
    int v=attr&1;
  8076d0:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  8076d4:	83 e0 01             	and    eax,0x1
  8076d7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//sys_read-only
  8076da:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8076de:	74 0b                	je     8076eb <translate_attr+0x2c>
        attr_s[1]='-';
  8076e0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8076e4:	48 83 c0 01          	add    rax,0x1
  8076e8:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
    v=attr&2;
  8076eb:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  8076ef:	83 e0 02             	and    eax,0x2
  8076f2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//hidden
  8076f5:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8076f9:	74 0b                	je     807706 <translate_attr+0x47>
        attr_s[2]='h';
  8076fb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8076ff:	48 83 c0 02          	add    rax,0x2
  807703:	c6 00 68             	mov    BYTE PTR [rax],0x68
    v=attr&4;
  807706:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  80770a:	83 e0 04             	and    eax,0x4
  80770d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//system
  807710:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807714:	74 0b                	je     807721 <translate_attr+0x62>
        attr_s[4]='s';
  807716:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80771a:	48 83 c0 04          	add    rax,0x4
  80771e:	c6 00 73             	mov    BYTE PTR [rax],0x73
    v=attr&8;
  807721:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807725:	83 e0 08             	and    eax,0x8
  807728:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//volume label
  80772b:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80772f:	74 0b                	je     80773c <translate_attr+0x7d>
        attr_s[3]='v';
  807731:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807735:	48 83 c0 03          	add    rax,0x3
  807739:	c6 00 76             	mov    BYTE PTR [rax],0x76
    v=attr&16;
  80773c:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807740:	83 e0 10             	and    eax,0x10
  807743:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//dir
  807746:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80774a:	74 0b                	je     807757 <translate_attr+0x98>
        attr_s[3]='d';
  80774c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807750:	48 83 c0 03          	add    rax,0x3
  807754:	c6 00 64             	mov    BYTE PTR [rax],0x64
    //archive: do nothing
    attr_s[5]='\0';
  807757:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80775b:	48 83 c0 05          	add    rax,0x5
  80775f:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  807762:	90                   	nop
  807763:	5d                   	pop    rbp
  807764:	c3                   	ret    

0000000000807765 <extend_cluster>:
int extend_cluster(short cluster)
{
  807765:	f3 0f 1e fa          	endbr64 
  807769:	55                   	push   rbp
  80776a:	48 89 e5             	mov    rbp,rsp
  80776d:	48 83 ec 18          	sub    rsp,0x18
  807771:	89 f8                	mov    eax,edi
  807773:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    int new_clu=req_cluster();
  807777:	b8 00 00 00 00       	mov    eax,0x0
  80777c:	e8 0e fd ff ff       	call   80748f <req_cluster>
  807781:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(new_clu==-1)
  807784:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  807788:	75 07                	jne    807791 <extend_cluster+0x2c>
        return -1;
  80778a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80778f:	eb 16                	jmp    8077a7 <extend_cluster+0x42>
    fat[cluster]=new_clu;
  807791:	0f bf 45 ec          	movsx  eax,WORD PTR [rbp-0x14]
  807795:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  807798:	48 98                	cdqe   
  80779a:	66 89 94 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],dx
  8077a1:	00 
    return 0;
  8077a2:	b8 00 00 00 00       	mov    eax,0x0
}
  8077a7:	c9                   	leave  
  8077a8:	c3                   	ret    

00000000008077a9 <touch>:
得出的结果换算成16进制填入即可。也就是：38H字节0~4位是日期数；38H字节5~7位和39H字节0位是月份；
39H字节的1~7位为年号，原定义中0~119分别代表1980~2099，目前高版本的Windows允许取0~127，
即年号最大可以到2107年。
*/
int touch(driver_args *arg)
{
  8077a9:	f3 0f 1e fa          	endbr64 
  8077ad:	55                   	push   rbp
  8077ae:	48 89 e5             	mov    rbp,rsp
  8077b1:	48 83 ec 60          	sub    rsp,0x60
  8077b5:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    char *name=arg->path;
  8077b9:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8077bd:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8077c1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  8077c5:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8077c9:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8077cc:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    //default set to 512
    int max_files=16;
  8077d0:	c7 45 ec 10 00 00 00 	mov    DWORD PTR [rbp-0x14],0x10
    dir_entry *dir_table=a_clu_of_dir;
  8077d7:	48 c7 45 e0 c0 c8 42 	mov    QWORD PTR [rbp-0x20],0x42c8c0
  8077de:	00 
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  8077df:	0f b6 05 87 10 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21087]        # 42886d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  8077e6:	0f b6 c0             	movzx  eax,al
  8077e9:	0f b7 55 ca          	movzx  edx,WORD PTR [rbp-0x36]
  8077ed:	0f b7 ca             	movzx  ecx,dx
  8077f0:	8b 15 4a 2a 00 00    	mov    edx,DWORD PTR [rip+0x2a4a]        # 80a240 <clu_sec_balance>
  8077f6:	01 d1                	add    ecx,edx
  8077f8:	89 c2                	mov    edx,eax
  8077fa:	89 ce                	mov    esi,ecx
  8077fc:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807801:	e8 c9 03 00 00       	call   807bcf <read_sec>
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  807806:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  80780a:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do{
        for(int i=0;i<max_files;i++)
  80780e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807815:	e9 2e 01 00 00       	jmp    807948 <touch+0x19f>
        {
            //printf("%s\n",dir_table[i].name);
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  80781a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80781d:	48 98                	cdqe   
  80781f:	48 c1 e0 05          	shl    rax,0x5
  807823:	48 89 c2             	mov    rdx,rax
  807826:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80782a:	48 01 d0             	add    rax,rdx
  80782d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807830:	3c e5                	cmp    al,0xe5
  807832:	74 1e                	je     807852 <touch+0xa9>
            dir_table[i].name[0]==0)
  807834:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807837:	48 98                	cdqe   
  807839:	48 c1 e0 05          	shl    rax,0x5
  80783d:	48 89 c2             	mov    rdx,rax
  807840:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807844:	48 01 d0             	add    rax,rdx
  807847:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  80784a:	84 c0                	test   al,al
  80784c:	0f 85 f2 00 00 00    	jne    807944 <touch+0x19b>
            {
                //available
                //put name
                format_name(name);
  807852:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807856:	48 89 c7             	mov    rdi,rax
  807859:	e8 25 fb ff ff       	call   807383 <format_name>
                memcpy(dir_table[i].name,name,11);
  80785e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807861:	48 98                	cdqe   
  807863:	48 c1 e0 05          	shl    rax,0x5
  807867:	48 89 c2             	mov    rdx,rax
  80786a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80786e:	48 01 d0             	add    rax,rdx
  807871:	48 89 c1             	mov    rcx,rax
  807874:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807878:	ba 0b 00 00 00       	mov    edx,0xb
  80787d:	48 89 c6             	mov    rsi,rax
  807880:	48 89 cf             	mov    rdi,rcx
  807883:	e8 2e 1e 00 00       	call   8096b6 <memcpy>
                int clu=req_cluster();
  807888:	b8 00 00 00 00       	mov    eax,0x0
  80788d:	e8 fd fb ff ff       	call   80748f <req_cluster>
  807892:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
                if(clu==-1)
  807895:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  807899:	75 0a                	jne    8078a5 <touch+0xfc>
                {
                    //puts("err: full disk");
                    return -1;
  80789b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8078a0:	e9 fc 00 00 00       	jmp    8079a1 <touch+0x1f8>
                }
                dir_table[i].fistCluNum=clu;
  8078a5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8078a8:	48 98                	cdqe   
  8078aa:	48 c1 e0 05          	shl    rax,0x5
  8078ae:	48 89 c2             	mov    rdx,rax
  8078b1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8078b5:	48 01 d0             	add    rax,rdx
  8078b8:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8078bb:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
                set_attr(&dir_table[i],ATTR_ARCHIVE);
  8078bf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8078c2:	48 98                	cdqe   
  8078c4:	48 c1 e0 05          	shl    rax,0x5
  8078c8:	48 89 c2             	mov    rdx,rax
  8078cb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8078cf:	48 01 d0             	add    rax,rdx
  8078d2:	be 20 00 00 00       	mov    esi,0x20
  8078d7:	48 89 c7             	mov    rdi,rax
  8078da:	e8 6f fc ff ff       	call   80754e <set_attr>
                dir_table[i].len=superblock.bytesPerSec*superblock.secPerClu;
  8078df:	0f b7 05 85 0f c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20f85]        # 42886b <superblock+0xb>
  8078e6:	0f b7 d0             	movzx  edx,ax
  8078e9:	0f b6 05 7d 0f c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20f7d]        # 42886d <superblock+0xd>
  8078f0:	0f b6 c0             	movzx  eax,al
  8078f3:	0f af d0             	imul   edx,eax
  8078f6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8078f9:	48 98                	cdqe   
  8078fb:	48 c1 e0 05          	shl    rax,0x5
  8078ff:	48 89 c1             	mov    rcx,rax
  807902:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807906:	48 01 c8             	add    rax,rcx
  807909:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
                //date and time
                //dir_table[i].lastModfDate=get_date_stab();
                //dir_table[i].lastModfTime=get_time_stab();
                //update
                write_sec(dir_table,cluster+clu_sec_balance,\
                superblock.bytesPerSec*superblock.secPerClu);
  80790c:	0f b7 05 58 0f c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20f58]        # 42886b <superblock+0xb>
  807913:	0f b7 d0             	movzx  edx,ax
  807916:	0f b6 05 50 0f c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20f50]        # 42886d <superblock+0xd>
  80791d:	0f b6 c0             	movzx  eax,al
                write_sec(dir_table,cluster+clu_sec_balance,\
  807920:	0f af d0             	imul   edx,eax
  807923:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807927:	8b 05 13 29 00 00    	mov    eax,DWORD PTR [rip+0x2913]        # 80a240 <clu_sec_balance>
  80792d:	01 c1                	add    ecx,eax
  80792f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807933:	89 ce                	mov    esi,ecx
  807935:	48 89 c7             	mov    rdi,rax
  807938:	e8 9e fb ff ff       	call   8074db <write_sec>
                return -1;
  80793d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807942:	eb 5d                	jmp    8079a1 <touch+0x1f8>
        for(int i=0;i<max_files;i++)
  807944:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807948:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80794b:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
  80794e:	0f 8c c6 fe ff ff    	jl     80781a <touch+0x71>
        if(fat[cluster]>=FAT_EOF&&extend_cluster(cluster)==-1)
        {
            //extend fail
            //puts("err:full disk");
            return -1;
        }else if(cluster<FAT_EOF)
  807954:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807959:	77 36                	ja     807991 <touch+0x1e8>
        {
            cluster=fat[cluster];
  80795b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80795f:	48 98                	cdqe   
  807961:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807968:	00 
  807969:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  80796d:	0f b6 05 f9 0e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20ef9]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807974:	0f b6 d0             	movzx  edx,al
  807977:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  80797b:	8b 05 bf 28 00 00    	mov    eax,DWORD PTR [rip+0x28bf]        # 80a240 <clu_sec_balance>
  807981:	01 c1                	add    ecx,eax
  807983:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807987:	89 ce                	mov    esi,ecx
  807989:	48 89 c7             	mov    rdi,rax
  80798c:	e8 3e 02 00 00       	call   807bcf <read_sec>
        }
    }while(cluster<FAT_EOF);
  807991:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807996:	0f 86 72 fe ff ff    	jbe    80780e <touch+0x65>
    return 0;
  80799c:	b8 00 00 00 00       	mov    eax,0x0
}
  8079a1:	c9                   	leave  
  8079a2:	c3                   	ret    

00000000008079a3 <mkdir>:
//attention: the name must be char[12]
int mkdir(driver_args *arg)
{
  8079a3:	f3 0f 1e fa          	endbr64 
  8079a7:	55                   	push   rbp
  8079a8:	48 89 e5             	mov    rbp,rsp
  8079ab:	48 83 ec 50          	sub    rsp,0x50
  8079af:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    char *name=arg->path;
  8079b3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8079b7:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8079bb:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  8079bf:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8079c3:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8079c6:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    format_name(name);
  8079ca:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8079ce:	48 89 c7             	mov    rdi,rax
  8079d1:	e8 ad f9 ff ff       	call   807383 <format_name>
    //regular dir
    unsigned short cluster = dir.fistCluNum;
  8079d6:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  8079da:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do
    {
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
            superblock.secPerClu);
  8079de:	0f b6 05 88 0e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20e88]        # 42886d <superblock+0xd>
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  8079e5:	0f b6 c0             	movzx  eax,al
  8079e8:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  8079ec:	8b 15 4e 28 00 00    	mov    edx,DWORD PTR [rip+0x284e]        # 80a240 <clu_sec_balance>
  8079f2:	01 d1                	add    ecx,edx
  8079f4:	89 c2                	mov    edx,eax
  8079f6:	89 ce                	mov    esi,ecx
  8079f8:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  8079fd:	e8 cd 01 00 00       	call   807bcf <read_sec>
        for (int i = 0; i < 16; i++)
  807a02:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807a09:	e9 8c 01 00 00       	jmp    807b9a <mkdir+0x1f7>
        {
            if(a_clu_of_dir[i].fistCluNum==0||\
  807a0e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807a11:	48 98                	cdqe   
  807a13:	48 c1 e0 05          	shl    rax,0x5
  807a17:	48 05 da c8 42 00    	add    rax,0x42c8da
  807a1d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  807a20:	66 85 c0             	test   ax,ax
  807a23:	74 30                	je     807a55 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0xe5||\
  807a25:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807a28:	48 98                	cdqe   
  807a2a:	48 c1 e0 05          	shl    rax,0x5
  807a2e:	48 05 a0 88 42 00    	add    rax,0x4288a0
  807a34:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if(a_clu_of_dir[i].fistCluNum==0||\
  807a37:	3c e5                	cmp    al,0xe5
  807a39:	74 1a                	je     807a55 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0)
  807a3b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807a3e:	48 98                	cdqe   
  807a40:	48 c1 e0 05          	shl    rax,0x5
  807a44:	48 05 a0 88 42 00    	add    rax,0x4288a0
  807a4a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            (unsigned char)root_dir[i].name[0]==0xe5||\
  807a4d:	84 c0                	test   al,al
  807a4f:	0f 85 41 01 00 00    	jne    807b96 <mkdir+0x1f3>
            {
                memset(&a_clu_of_dir[i],0,sizeof(dir_entry));
  807a55:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807a58:	48 98                	cdqe   
  807a5a:	48 c1 e0 05          	shl    rax,0x5
  807a5e:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  807a64:	ba 20 00 00 00       	mov    edx,0x20
  807a69:	be 00 00 00 00       	mov    esi,0x0
  807a6e:	48 89 c7             	mov    rdi,rax
  807a71:	e8 ef 1c 00 00       	call   809765 <memset>
                memset(a_clu_of_dir[i].name,' ',11);
  807a76:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807a79:	48 98                	cdqe   
  807a7b:	48 c1 e0 05          	shl    rax,0x5
  807a7f:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  807a85:	ba 0b 00 00 00       	mov    edx,0xb
  807a8a:	be 20 00 00 00       	mov    esi,0x20
  807a8f:	48 89 c7             	mov    rdi,rax
  807a92:	e8 ce 1c 00 00       	call   809765 <memset>
                strcpy(a_clu_of_dir[i].name,name);
  807a97:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807a9a:	48 98                	cdqe   
  807a9c:	48 c1 e0 05          	shl    rax,0x5
  807aa0:	48 8d 90 c0 c8 42 00 	lea    rdx,[rax+0x42c8c0]
  807aa7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807aab:	48 89 c6             	mov    rsi,rax
  807aae:	48 89 d7             	mov    rdi,rdx
  807ab1:	e8 fe 1c 00 00       	call   8097b4 <strcpy>
                a_clu_of_dir[i].name[strlen(name)]=' ';
  807ab6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807aba:	48 89 c7             	mov    rdi,rax
  807abd:	e8 11 1f 00 00       	call   8099d3 <strlen>
  807ac2:	48 63 d0             	movsxd rdx,eax
  807ac5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807ac8:	48 98                	cdqe   
  807aca:	48 c1 e0 05          	shl    rax,0x5
  807ace:	48 01 d0             	add    rax,rdx
  807ad1:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  807ad7:	c6 00 20             	mov    BYTE PTR [rax],0x20
                int clu=req_cluster();
  807ada:	b8 00 00 00 00       	mov    eax,0x0
  807adf:	e8 ab f9 ff ff       	call   80748f <req_cluster>
  807ae4:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
                if(clu==-1)//check
  807ae7:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  807aeb:	75 0a                	jne    807af7 <mkdir+0x154>
                {
                    //puts("err:full dir");
                    return -1;
  807aed:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807af2:	e9 d6 00 00 00       	jmp    807bcd <mkdir+0x22a>
                }
                a_clu_of_dir[i].fistCluNum=clu;
  807af7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807afa:	89 c2                	mov    edx,eax
  807afc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807aff:	48 98                	cdqe   
  807b01:	48 c1 e0 05          	shl    rax,0x5
  807b05:	48 05 da c8 42 00    	add    rax,0x42c8da
  807b0b:	66 89 10             	mov    WORD PTR [rax],dx
                //set attr
                set_attr(&a_clu_of_dir[i],ATTR_DIR);
  807b0e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807b11:	48 98                	cdqe   
  807b13:	48 c1 e0 05          	shl    rax,0x5
  807b17:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  807b1d:	be 10 00 00 00       	mov    esi,0x10
  807b22:	48 89 c7             	mov    rdi,rax
  807b25:	e8 24 fa ff ff       	call   80754e <set_attr>
                //set length
                a_clu_of_dir[i].len=0;
  807b2a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807b2d:	48 98                	cdqe   
  807b2f:	48 c1 e0 05          	shl    rax,0x5
  807b33:	48 05 dc c8 42 00    	add    rax,0x42c8dc
  807b39:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
                //date and time
                /*a_clu_of_dir[i].lastModfDate=get_date_stab();
                a_clu_of_dir[i].lastModfTime=get_time_stab();*/
                //set date:temporarily none
                //add . and ..
                add_dot_and_ddot_dir(a_clu_of_dir[i]);
  807b3f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807b42:	48 98                	cdqe   
  807b44:	48 c1 e0 05          	shl    rax,0x5
  807b48:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  807b4e:	ff 70 18             	push   QWORD PTR [rax+0x18]
  807b51:	ff 70 10             	push   QWORD PTR [rax+0x10]
  807b54:	ff 70 08             	push   QWORD PTR [rax+0x8]
  807b57:	ff 30                	push   QWORD PTR [rax]
  807b59:	e8 7c fa ff ff       	call   8075da <add_dot_and_ddot_dir>
  807b5e:	48 83 c4 20          	add    rsp,0x20
                //update the dir
                int dir_loc=cluster+clu_sec_balance;
  807b62:	0f b7 55 fe          	movzx  edx,WORD PTR [rbp-0x2]
  807b66:	8b 05 d4 26 00 00    	mov    eax,DWORD PTR [rip+0x26d4]        # 80a240 <clu_sec_balance>
  807b6c:	01 d0                	add    eax,edx
  807b6e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
                write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  807b71:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807b74:	ba 00 02 00 00       	mov    edx,0x200
  807b79:	89 c6                	mov    esi,eax
  807b7b:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807b80:	e8 56 f9 ff ff       	call   8074db <write_sec>
                update_fat_and_root();
  807b85:	b8 00 00 00 00       	mov    eax,0x0
  807b8a:	e8 e7 f9 ff ff       	call   807576 <update_fat_and_root>
                return 0;
  807b8f:	b8 00 00 00 00       	mov    eax,0x0
  807b94:	eb 37                	jmp    807bcd <mkdir+0x22a>
        for (int i = 0; i < 16; i++)
  807b96:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807b9a:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  807b9e:	0f 8e 6a fe ff ff    	jle    807a0e <mkdir+0x6b>
            }
        }

        if(cluster<FAT_EOF)
  807ba4:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807ba9:	77 12                	ja     807bbd <mkdir+0x21a>
            cluster=fat[cluster];
  807bab:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807baf:	48 98                	cdqe   
  807bb1:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807bb8:	00 
  807bb9:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    } while (cluster<FAT_EOF);
  807bbd:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807bc2:	0f 86 16 fe ff ff    	jbe    8079de <mkdir+0x3b>
    return -1;
  807bc8:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  807bcd:	c9                   	leave  
  807bce:	c3                   	ret    

0000000000807bcf <read_sec>:
    }
    
    
}*/
int read_sec(char *dist, int sec_num, int sec_count)
{
  807bcf:	f3 0f 1e fa          	endbr64 
  807bd3:	55                   	push   rbp
  807bd4:	48 89 e5             	mov    rbp,rsp
  807bd7:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  807bde:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
  807be5:	89 b5 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],esi
  807beb:	89 95 20 ff ff ff    	mov    DWORD PTR [rbp-0xe0],edx
    driver_args arg={
  807bf1:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  807bf8:	b8 00 00 00 00       	mov    eax,0x0
  807bfd:	b9 18 00 00 00       	mov    ecx,0x18
  807c02:	48 89 d7             	mov    rdi,rdx
  807c05:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  807c08:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
  807c0e:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
  807c14:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  807c1b:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
  807c21:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  807c28:	00 00 00 
            .dist_addr=dist,
            .lba=sec_num,
            .sec_c=1
    };
    for(int i=0;i<sec_count;i++)
  807c2b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807c32:	eb 3e                	jmp    807c72 <read_sec+0xa3>
    {
        drv_disk.read(&arg);
  807c34:	48 8b 15 7d 25 00 00 	mov    rdx,QWORD PTR [rip+0x257d]        # 80a1b8 <drv_disk+0x18>
  807c3b:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  807c42:	48 89 c7             	mov    rdi,rax
  807c45:	ff d2                	call   rdx
        arg.dist_addr+=superblock.bytesPerSec;
  807c47:	8b 95 34 ff ff ff    	mov    edx,DWORD PTR [rbp-0xcc]
  807c4d:	0f b7 05 17 0c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20c17]        # 42886b <superblock+0xb>
  807c54:	0f b7 c0             	movzx  eax,ax
  807c57:	01 d0                	add    eax,edx
  807c59:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.lba++;
  807c5f:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  807c65:	83 c0 01             	add    eax,0x1
  807c68:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
    for(int i=0;i<sec_count;i++)
  807c6e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807c72:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807c75:	3b 85 20 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xe0]
  807c7b:	7c b7                	jl     807c34 <read_sec+0x65>
    }
    return 0;
  807c7d:	b8 00 00 00 00       	mov    eax,0x0
}
  807c82:	c9                   	leave  
  807c83:	c3                   	ret    

0000000000807c84 <rm>:

int rm(driver_args* args)
{
  807c84:	f3 0f 1e fa          	endbr64 
  807c88:	55                   	push   rbp
  807c89:	48 89 e5             	mov    rbp,rsp
  807c8c:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  807c93:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
    char *name=args->path;
  807c9a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  807ca1:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807ca5:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    driver_args tmparg={
  807ca9:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  807cb0:	b8 00 00 00 00       	mov    eax,0x0
  807cb5:	b9 18 00 00 00       	mov    ecx,0x18
  807cba:	48 89 d7             	mov    rdi,rdx
  807cbd:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .path=args->dir_path,
  807cc0:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  807cc7:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
    driver_args tmparg={
  807cce:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    if(get_entry(&tmparg)==-1)return -1;
  807cd5:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  807cdc:	48 89 c7             	mov    rdi,rax
  807cdf:	e8 07 0a 00 00       	call   8086eb <get_entry>
  807ce4:	83 f8 ff             	cmp    eax,0xffffffff
  807ce7:	75 0a                	jne    807cf3 <rm+0x6f>
  807ce9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807cee:	e9 a8 01 00 00       	jmp    807e9b <rm+0x217>
    dir.fistCluNum=tmparg.entry.id;
  807cf3:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  807cf9:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    dir_entry *dir_table=a_clu_of_dir;
  807cfd:	48 c7 45 e0 c0 c8 42 	mov    QWORD PTR [rbp-0x20],0x42c8c0
  807d04:	00 
    //regular dir
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
    superblock.secPerClu);
  807d05:	0f b6 05 61 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20b61]        # 42886d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  807d0c:	0f b6 c0             	movzx  eax,al
  807d0f:	0f b7 55 da          	movzx  edx,WORD PTR [rbp-0x26]
  807d13:	0f b7 ca             	movzx  ecx,dx
  807d16:	8b 15 24 25 00 00    	mov    edx,DWORD PTR [rip+0x2524]        # 80a240 <clu_sec_balance>
  807d1c:	01 d1                	add    ecx,edx
  807d1e:	89 c2                	mov    edx,eax
  807d20:	89 ce                	mov    esi,ecx
  807d22:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807d27:	e8 a3 fe ff ff       	call   807bcf <read_sec>
    dir_table=a_clu_of_dir;
  807d2c:	48 c7 45 e0 c0 c8 42 	mov    QWORD PTR [rbp-0x20],0x42c8c0
  807d33:	00 
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  807d34:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  807d38:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    int i=0;
  807d3c:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    while(cluster<FAT_EOF){
  807d43:	e9 89 00 00 00       	jmp    807dd1 <rm+0x14d>
        read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807d48:	0f b6 05 1e 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20b1e]        # 42886d <superblock+0xd>
        read_sec(dir_table,cluster+clu_sec_balance,\
  807d4f:	0f b6 d0             	movzx  edx,al
  807d52:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807d56:	8b 05 e4 24 00 00    	mov    eax,DWORD PTR [rip+0x24e4]        # 80a240 <clu_sec_balance>
  807d5c:	01 c1                	add    ecx,eax
  807d5e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807d62:	89 ce                	mov    esi,ecx
  807d64:	48 89 c7             	mov    rdi,rax
  807d67:	e8 63 fe ff ff       	call   807bcf <read_sec>
        for(;i<16;i++)
  807d6c:	eb 44                	jmp    807db2 <rm+0x12e>
        {
            if(dir_table[i].fistCluNum==args->entry.id)
  807d6e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807d71:	48 98                	cdqe   
  807d73:	48 c1 e0 05          	shl    rax,0x5
  807d77:	48 89 c2             	mov    rdx,rax
  807d7a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807d7e:	48 01 d0             	add    rax,rdx
  807d81:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  807d85:	0f b7 d0             	movzx  edx,ax
  807d88:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  807d8f:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  807d92:	39 c2                	cmp    edx,eax
  807d94:	75 18                	jne    807dae <rm+0x12a>
            {
                if(dir_table[i].attr&ATTR_DIR){
                    //要处理里面的文件
                }
                dir_table[i].name[0]=0xe5;
  807d96:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807d99:	48 98                	cdqe   
  807d9b:	48 c1 e0 05          	shl    rax,0x5
  807d9f:	48 89 c2             	mov    rdx,rax
  807da2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807da6:	48 01 d0             	add    rax,rdx
  807da9:	c6 00 e5             	mov    BYTE PTR [rax],0xe5
                goto del_entry_finish;
  807dac:	eb 2f                	jmp    807ddd <rm+0x159>
        for(;i<16;i++)
  807dae:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807db2:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  807db6:	7e b6                	jle    807d6e <rm+0xea>
            }
        }
        if(cluster<FAT_EOF)
  807db8:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807dbd:	77 12                	ja     807dd1 <rm+0x14d>
        {
            cluster=fat[cluster];
  807dbf:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807dc3:	48 98                	cdqe   
  807dc5:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807dcc:	00 
  807dcd:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    while(cluster<FAT_EOF){
  807dd1:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807dd6:	0f 86 6c ff ff ff    	jbe    807d48 <rm+0xc4>
            //update
            //if you can reach here it means it's a regular dir
        }

    }
del_entry_finish:
  807ddc:	90                   	nop
    ;
    //del fat
    unsigned short del_clu=dir_table[i].fistCluNum;
  807ddd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807de0:	48 98                	cdqe   
  807de2:	48 c1 e0 05          	shl    rax,0x5
  807de6:	48 89 c2             	mov    rdx,rax
  807de9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807ded:	48 01 d0             	add    rax,rdx
  807df0:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  807df4:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
    unsigned short pion=del_clu<FAT_EOF?fat[del_clu]:0xffff;
  807df8:	66 83 7d f6 f6       	cmp    WORD PTR [rbp-0xa],0xfff6
  807dfd:	77 10                	ja     807e0f <rm+0x18b>
  807dff:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807e03:	48 98                	cdqe   
  807e05:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807e0c:	00 
  807e0d:	eb 05                	jmp    807e14 <rm+0x190>
  807e0f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807e14:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  807e18:	eb 2a                	jmp    807e44 <rm+0x1c0>
    {
        fat[del_clu]=0;
  807e1a:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807e1e:	48 98                	cdqe   
  807e20:	66 c7 84 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],0x0
  807e27:	00 00 00 
        del_clu=pion;
  807e2a:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  807e2e:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
        pion=fat[pion];
  807e32:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  807e36:	48 98                	cdqe   
  807e38:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807e3f:	00 
  807e40:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  807e44:	66 83 7d f4 f6       	cmp    WORD PTR [rbp-0xc],0xfff6
  807e49:	76 cf                	jbe    807e1a <rm+0x196>
    }
    fat[del_clu]=0;
  807e4b:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807e4f:	48 98                	cdqe   
  807e51:	66 c7 84 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],0x0
  807e58:	00 00 00 
    //del dir entry
    write_sec(dir_table,cluster+clu_sec_balance,\
    superblock.secPerClu*superblock.bytesPerSec);
  807e5b:	0f b6 05 0b 0a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20a0b]        # 42886d <superblock+0xd>
  807e62:	0f b6 d0             	movzx  edx,al
  807e65:	0f b7 05 ff 09 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc209ff]        # 42886b <superblock+0xb>
  807e6c:	0f b7 c0             	movzx  eax,ax
    write_sec(dir_table,cluster+clu_sec_balance,\
  807e6f:	0f af d0             	imul   edx,eax
  807e72:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807e76:	8b 05 c4 23 00 00    	mov    eax,DWORD PTR [rip+0x23c4]        # 80a240 <clu_sec_balance>
  807e7c:	01 c1                	add    ecx,eax
  807e7e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807e82:	89 ce                	mov    esi,ecx
  807e84:	48 89 c7             	mov    rdi,rax
  807e87:	e8 4f f6 ff ff       	call   8074db <write_sec>
    update_fat_and_root();
  807e8c:	b8 00 00 00 00       	mov    eax,0x0
  807e91:	e8 e0 f6 ff ff       	call   807576 <update_fat_and_root>
    return 0;
  807e96:	b8 00 00 00 00       	mov    eax,0x0
}
  807e9b:	c9                   	leave  
  807e9c:	c3                   	ret    

0000000000807e9d <find>:
int find_f=0;
int find(char *name)
{
  807e9d:	f3 0f 1e fa          	endbr64 
  807ea1:	55                   	push   rbp
  807ea2:	48 89 e5             	mov    rbp,rsp
  807ea5:	48 83 ec 30          	sub    rsp,0x30
  807ea9:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  807ead:	c7 45 fc 00 02 00 00 	mov    DWORD PTR [rbp-0x4],0x200
    int index=0;
  807eb4:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    dir_entry *dir_table=a_clu_of_dir;
  807ebb:	48 c7 45 f0 c0 c8 42 	mov    QWORD PTR [rbp-0x10],0x42c8c0
  807ec2:	00 
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  807ec3:	0f b7 05 f0 49 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc249f0]        # 42c8ba <cur_dir+0x1a>
  807eca:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
    if(cur_dir.fistCluNum==0)
  807ece:	0f b7 05 e5 49 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc249e5]        # 42c8ba <cur_dir+0x1a>
  807ed5:	66 85 c0             	test   ax,ax
  807ed8:	75 0a                	jne    807ee4 <find+0x47>
        dir_table=root_dir;
  807eda:	48 c7 45 f0 a0 88 42 	mov    QWORD PTR [rbp-0x10],0x4288a0
  807ee1:	00 
  807ee2:	eb 2b                	jmp    807f0f <find+0x72>
    else {
        max_files=16;
  807ee4:	c7 45 fc 10 00 00 00 	mov    DWORD PTR [rbp-0x4],0x10
        read_sec(dir_table, cluster + clu_sec_balance, \
            superblock.secPerClu);
  807eeb:	0f b6 05 7b 09 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2097b]        # 42886d <superblock+0xd>
        read_sec(dir_table, cluster + clu_sec_balance, \
  807ef2:	0f b6 d0             	movzx  edx,al
  807ef5:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  807ef9:	8b 05 41 23 00 00    	mov    eax,DWORD PTR [rip+0x2341]        # 80a240 <clu_sec_balance>
  807eff:	01 c1                	add    ecx,eax
  807f01:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807f05:	89 ce                	mov    esi,ecx
  807f07:	48 89 c7             	mov    rdi,rax
  807f0a:	e8 c0 fc ff ff       	call   807bcf <read_sec>
    }
    do{
        for(int i=0;i<max_files;i++)
  807f0f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  807f16:	eb 57                	jmp    807f6f <find+0xd2>
        {
            if(dir_table[i].name[0]==0||dir_table[i].name[0]==0xe5)
  807f18:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807f1b:	48 98                	cdqe   
  807f1d:	48 c1 e0 05          	shl    rax,0x5
  807f21:	48 89 c2             	mov    rdx,rax
  807f24:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807f28:	48 01 d0             	add    rax,rdx
  807f2b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807f2e:	84 c0                	test   al,al
  807f30:	74 38                	je     807f6a <find+0xcd>
                continue;
            if(memcmp(dir_table[i].name,name,11)==0)
  807f32:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807f35:	48 98                	cdqe   
  807f37:	48 c1 e0 05          	shl    rax,0x5
  807f3b:	48 89 c2             	mov    rdx,rax
  807f3e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807f42:	48 01 d0             	add    rax,rdx
  807f45:	48 89 c1             	mov    rcx,rax
  807f48:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807f4c:	ba 0b 00 00 00       	mov    edx,0xb
  807f51:	48 89 c6             	mov    rsi,rax
  807f54:	48 89 cf             	mov    rdi,rcx
  807f57:	e8 a4 17 00 00       	call   809700 <memcmp>
  807f5c:	85 c0                	test   eax,eax
  807f5e:	75 0b                	jne    807f6b <find+0xce>
            {
                return index+i;
  807f60:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  807f63:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807f66:	01 d0                	add    eax,edx
  807f68:	eb 71                	jmp    807fdb <find+0x13e>
                continue;
  807f6a:	90                   	nop
        for(int i=0;i<max_files;i++)
  807f6b:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  807f6f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807f72:	3b 45 fc             	cmp    eax,DWORD PTR [rbp-0x4]
  807f75:	7c a1                	jl     807f18 <find+0x7b>
            }
        }
        if(cur_dir.fistCluNum==0)
  807f77:	0f b7 05 3c 49 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2493c]        # 42c8ba <cur_dir+0x1a>
  807f7e:	66 85 c0             	test   ax,ax
  807f81:	75 07                	jne    807f8a <find+0xed>
            return -1;
  807f83:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807f88:	eb 51                	jmp    807fdb <find+0x13e>
        else if(cluster<FAT_EOF)
  807f8a:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  807f8f:	77 3a                	ja     807fcb <find+0x12e>
        {
            index+=16;
  807f91:	83 45 f8 10          	add    DWORD PTR [rbp-0x8],0x10
            cluster=fat[cluster];
  807f95:	0f b7 45 ee          	movzx  eax,WORD PTR [rbp-0x12]
  807f99:	48 98                	cdqe   
  807f9b:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807fa2:	00 
  807fa3:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807fa7:	0f b6 05 bf 08 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc208bf]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807fae:	0f b6 d0             	movzx  edx,al
  807fb1:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  807fb5:	8b 05 85 22 00 00    	mov    eax,DWORD PTR [rip+0x2285]        # 80a240 <clu_sec_balance>
  807fbb:	01 c1                	add    ecx,eax
  807fbd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807fc1:	89 ce                	mov    esi,ecx
  807fc3:	48 89 c7             	mov    rdi,rax
  807fc6:	e8 04 fc ff ff       	call   807bcf <read_sec>
        }
    }while(cluster<FAT_EOF);
  807fcb:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  807fd0:	0f 86 39 ff ff ff    	jbe    807f0f <find+0x72>
    return -1;
  807fd6:	b8 ff ff ff ff       	mov    eax,0xffffffff

}
  807fdb:	c9                   	leave  
  807fdc:	c3                   	ret    

0000000000807fdd <read_file_byname>:

int read_file_byname(char *full_name,char *dist,int pos,int len)
{
  807fdd:	f3 0f 1e fa          	endbr64 
  807fe1:	55                   	push   rbp
  807fe2:	48 89 e5             	mov    rbp,rsp
  807fe5:	41 57                	push   r15
  807fe7:	41 56                	push   r14
  807fe9:	41 55                	push   r13
  807feb:	41 54                	push   r12
  807fed:	53                   	push   rbx
  807fee:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  807ff5:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  807ffc:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  808003:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  808009:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  80800f:	48 89 e0             	mov    rax,rsp
  808012:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  808015:	bf 00 00 00 00       	mov    edi,0x0
  80801a:	e8 7e fe ff ff       	call   807e9d <find>
  80801f:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  808022:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  808026:	74 09                	je     808031 <read_file_byname+0x54>
  808028:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  80802f:	79 0a                	jns    80803b <read_file_byname+0x5e>
        return -1;
  808031:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808036:	e9 ea 02 00 00       	jmp    808325 <read_file_byname+0x348>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  80803b:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  808042:	48 c7 45 c0 a0 88 42 	mov    QWORD PTR [rbp-0x40],0x4288a0
  808049:	00 
    int in_root=1;
  80804a:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  808051:	0f b7 05 62 48 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24862]        # 42c8ba <cur_dir+0x1a>
  808058:	66 85 c0             	test   ax,ax
  80805b:	74 40                	je     80809d <read_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  80805d:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  808064:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  80806b:	0f b6 05 fb 07 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc207fb]        # 42886d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  808072:	0f b6 c0             	movzx  eax,al
  808075:	0f b7 15 3e 48 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc2483e]        # 42c8ba <cur_dir+0x1a>
  80807c:	0f b7 ca             	movzx  ecx,dx
  80807f:	8b 15 bb 21 00 00    	mov    edx,DWORD PTR [rip+0x21bb]        # 80a240 <clu_sec_balance>
  808085:	01 d1                	add    ecx,edx
  808087:	89 c2                	mov    edx,eax
  808089:	89 ce                	mov    esi,ecx
  80808b:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  808090:	e8 3a fb ff ff       	call   807bcf <read_sec>
        dir_table=a_clu_of_dir;
  808095:	48 c7 45 c0 c0 c8 42 	mov    QWORD PTR [rbp-0x40],0x42c8c0
  80809c:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  80809d:	0f b7 05 16 48 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24816]        # 42c8ba <cur_dir+0x1a>
  8080a4:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  8080a8:	eb 41                	jmp    8080eb <read_file_byname+0x10e>
        index-=16;
  8080aa:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  8080ae:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  8080b3:	77 36                	ja     8080eb <read_file_byname+0x10e>
        {
            cluster=fat[cluster];
  8080b5:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  8080b9:	48 98                	cdqe   
  8080bb:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8080c2:	00 
  8080c3:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  8080c7:	0f b6 05 9f 07 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2079f]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  8080ce:	0f b6 d0             	movzx  edx,al
  8080d1:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  8080d5:	8b 05 65 21 00 00    	mov    eax,DWORD PTR [rip+0x2165]        # 80a240 <clu_sec_balance>
  8080db:	01 c1                	add    ecx,eax
  8080dd:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8080e1:	89 ce                	mov    esi,ecx
  8080e3:	48 89 c7             	mov    rdi,rax
  8080e6:	e8 e4 fa ff ff       	call   807bcf <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  8080eb:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  8080ef:	75 0d                	jne    8080fe <read_file_byname+0x121>
  8080f1:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  8080f5:	7e 07                	jle    8080fe <read_file_byname+0x121>
  8080f7:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  8080fc:	76 ac                	jbe    8080aa <read_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  8080fe:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  808101:	48 98                	cdqe   
  808103:	48 c1 e0 05          	shl    rax,0x5
  808107:	48 89 c2             	mov    rdx,rax
  80810a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80810e:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  808112:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808115:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808119:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  808120:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  808127:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  80812b:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  80812f:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  808133:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  808137:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  80813b:	0f b7 c0             	movzx  eax,ax
  80813e:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  808141:	0f b7 05 23 07 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20723]        # 42886b <superblock+0xb>
  808148:	0f b7 d0             	movzx  edx,ax
  80814b:	0f b6 05 1b 07 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2071b]        # 42886d <superblock+0xd>
  808152:	0f b6 c0             	movzx  eax,al
  808155:	0f af c2             	imul   eax,edx
  808158:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  80815b:	eb 25                	jmp    808182 <read_file_byname+0x1a5>
    {
        pos-=cluster_size;
  80815d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808160:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        f_cluster=fat[f_cluster];
  808166:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808169:	48 98                	cdqe   
  80816b:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808172:	00 
  808173:	98                   	cwde   
  808174:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        if(pos<cluster_size)
  808177:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  80817d:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808180:	7c 0d                	jl     80818f <read_file_byname+0x1b2>
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  808182:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808188:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  80818b:	7d d0                	jge    80815d <read_file_byname+0x180>
  80818d:	eb 01                	jmp    808190 <read_file_byname+0x1b3>
            break;
  80818f:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  808190:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808197:	7e 15                	jle    8081ae <read_file_byname+0x1d1>
  808199:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  80819f:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8081a2:	7c 0a                	jl     8081ae <read_file_byname+0x1d1>
        return -1;//pos out of range
  8081a4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8081a9:	e9 77 01 00 00       	jmp    808325 <read_file_byname+0x348>
    //
    char temp[cluster_size];
  8081ae:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8081b1:	48 63 d0             	movsxd rdx,eax
  8081b4:	48 83 ea 01          	sub    rdx,0x1
  8081b8:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  8081bc:	48 63 d0             	movsxd rdx,eax
  8081bf:	49 89 d6             	mov    r14,rdx
  8081c2:	41 bf 00 00 00 00    	mov    r15d,0x0
  8081c8:	48 63 d0             	movsxd rdx,eax
  8081cb:	49 89 d4             	mov    r12,rdx
  8081ce:	41 bd 00 00 00 00    	mov    r13d,0x0
  8081d4:	48 98                	cdqe   
  8081d6:	ba 10 00 00 00       	mov    edx,0x10
  8081db:	48 83 ea 01          	sub    rdx,0x1
  8081df:	48 01 d0             	add    rax,rdx
  8081e2:	be 10 00 00 00       	mov    esi,0x10
  8081e7:	ba 00 00 00 00       	mov    edx,0x0
  8081ec:	48 f7 f6             	div    rsi
  8081ef:	48 6b c0 10          	imul   rax,rax,0x10
  8081f3:	48 89 c1             	mov    rcx,rax
  8081f6:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  8081fd:	48 89 e2             	mov    rdx,rsp
  808200:	48 29 ca             	sub    rdx,rcx
  808203:	48 39 d4             	cmp    rsp,rdx
  808206:	74 12                	je     80821a <read_file_byname+0x23d>
  808208:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  80820f:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  808216:	00 00 
  808218:	eb e9                	jmp    808203 <read_file_byname+0x226>
  80821a:	48 89 c2             	mov    rdx,rax
  80821d:	81 e2 ff 0f 00 00    	and    edx,0xfff
  808223:	48 29 d4             	sub    rsp,rdx
  808226:	48 89 c2             	mov    rdx,rax
  808229:	81 e2 ff 0f 00 00    	and    edx,0xfff
  80822f:	48 85 d2             	test   rdx,rdx
  808232:	74 10                	je     808244 <read_file_byname+0x267>
  808234:	25 ff 0f 00 00       	and    eax,0xfff
  808239:	48 83 e8 08          	sub    rax,0x8
  80823d:	48 01 e0             	add    rax,rsp
  808240:	48 83 08 00          	or     QWORD PTR [rax],0x0
  808244:	48 89 e0             	mov    rax,rsp
  808247:	48 83 c0 00          	add    rax,0x0
  80824b:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of reading might be not aligned
    read_sec(temp,f_cluster+clu_sec_balance,superblock.secPerClu);
  80824f:	0f b6 05 17 06 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20617]        # 42886d <superblock+0xd>
  808256:	0f b6 d0             	movzx  edx,al
  808259:	8b 0d e1 1f 00 00    	mov    ecx,DWORD PTR [rip+0x1fe1]        # 80a240 <clu_sec_balance>
  80825f:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808262:	01 c1                	add    ecx,eax
  808264:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808268:	89 ce                	mov    esi,ecx
  80826a:	48 89 c7             	mov    rdi,rax
  80826d:	e8 5d f9 ff ff       	call   807bcf <read_sec>
    memcpy(dist,temp+pos,cluster_size-pos);
  808272:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808275:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80827b:	89 c2                	mov    edx,eax
  80827d:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808283:	48 63 c8             	movsxd rcx,eax
  808286:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80828a:	48 01 c1             	add    rcx,rax
  80828d:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  808294:	48 89 ce             	mov    rsi,rcx
  808297:	48 89 c7             	mov    rdi,rax
  80829a:	e8 17 14 00 00       	call   8096b6 <memcpy>
    dist+=cluster_size-pos;
  80829f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8082a2:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  8082a8:	48 98                	cdqe   
  8082aa:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
    len-=cluster_size-pos;
  8082b1:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8082b4:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  8082ba:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  8082c0:	eb 4c                	jmp    80830e <read_file_byname+0x331>
    {
        f_cluster=fat[f_cluster];
  8082c2:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8082c5:	48 98                	cdqe   
  8082c7:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8082ce:	00 
  8082cf:	98                   	cwde   
  8082d0:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        read_sec(dist,f_cluster+clu_sec_balance,superblock.secPerClu);
  8082d3:	0f b6 05 93 05 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20593]        # 42886d <superblock+0xd>
  8082da:	0f b6 d0             	movzx  edx,al
  8082dd:	8b 0d 5d 1f 00 00    	mov    ecx,DWORD PTR [rip+0x1f5d]        # 80a240 <clu_sec_balance>
  8082e3:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8082e6:	01 c1                	add    ecx,eax
  8082e8:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8082ef:	89 ce                	mov    esi,ecx
  8082f1:	48 89 c7             	mov    rdi,rax
  8082f4:	e8 d6 f8 ff ff       	call   807bcf <read_sec>
        dist+=cluster_size;
  8082f9:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8082fc:	48 98                	cdqe   
  8082fe:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  808305:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808308:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  80830e:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808315:	7f 09                	jg     808320 <read_file_byname+0x343>
  808317:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  80831e:	7f a2                	jg     8082c2 <read_file_byname+0x2e5>
    }
    return 0;
  808320:	b8 00 00 00 00       	mov    eax,0x0
  808325:	48 89 dc             	mov    rsp,rbx
    
}
  808328:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  80832c:	5b                   	pop    rbx
  80832d:	41 5c                	pop    r12
  80832f:	41 5d                	pop    r13
  808331:	41 5e                	pop    r14
  808333:	41 5f                	pop    r15
  808335:	5d                   	pop    rbp
  808336:	c3                   	ret    

0000000000808337 <write_file_byname>:
int write_file_byname(char *full_name,char *src,int pos,int len)
{
  808337:	f3 0f 1e fa          	endbr64 
  80833b:	55                   	push   rbp
  80833c:	48 89 e5             	mov    rbp,rsp
  80833f:	41 57                	push   r15
  808341:	41 56                	push   r14
  808343:	41 55                	push   r13
  808345:	41 54                	push   r12
  808347:	53                   	push   rbx
  808348:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  80834f:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  808356:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  80835d:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  808363:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  808369:	48 89 e0             	mov    rax,rsp
  80836c:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  80836f:	bf 00 00 00 00       	mov    edi,0x0
  808374:	e8 24 fb ff ff       	call   807e9d <find>
  808379:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  80837c:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  808380:	74 09                	je     80838b <write_file_byname+0x54>
  808382:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  808389:	79 0a                	jns    808395 <write_file_byname+0x5e>
        return -1;
  80838b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808390:	e9 1e 03 00 00       	jmp    8086b3 <write_file_byname+0x37c>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  808395:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  80839c:	48 c7 45 c0 a0 88 42 	mov    QWORD PTR [rbp-0x40],0x4288a0
  8083a3:	00 
    int in_root=1;
  8083a4:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  8083ab:	0f b7 05 08 45 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24508]        # 42c8ba <cur_dir+0x1a>
  8083b2:	66 85 c0             	test   ax,ax
  8083b5:	74 40                	je     8083f7 <write_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  8083b7:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  8083be:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  8083c5:	0f b6 05 a1 04 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc204a1]        # 42886d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  8083cc:	0f b6 c0             	movzx  eax,al
  8083cf:	0f b7 15 e4 44 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc244e4]        # 42c8ba <cur_dir+0x1a>
  8083d6:	0f b7 ca             	movzx  ecx,dx
  8083d9:	8b 15 61 1e 00 00    	mov    edx,DWORD PTR [rip+0x1e61]        # 80a240 <clu_sec_balance>
  8083df:	01 d1                	add    ecx,edx
  8083e1:	89 c2                	mov    edx,eax
  8083e3:	89 ce                	mov    esi,ecx
  8083e5:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  8083ea:	e8 e0 f7 ff ff       	call   807bcf <read_sec>
        dir_table=a_clu_of_dir;
  8083ef:	48 c7 45 c0 c0 c8 42 	mov    QWORD PTR [rbp-0x40],0x42c8c0
  8083f6:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  8083f7:	0f b7 05 bc 44 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc244bc]        # 42c8ba <cur_dir+0x1a>
  8083fe:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  808402:	eb 41                	jmp    808445 <write_file_byname+0x10e>
        index-=16;
  808404:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  808408:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  80840d:	77 36                	ja     808445 <write_file_byname+0x10e>
        {
            cluster=fat[cluster];
  80840f:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  808413:	48 98                	cdqe   
  808415:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  80841c:	00 
  80841d:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  808421:	0f b6 05 45 04 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20445]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  808428:	0f b6 d0             	movzx  edx,al
  80842b:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  80842f:	8b 05 0b 1e 00 00    	mov    eax,DWORD PTR [rip+0x1e0b]        # 80a240 <clu_sec_balance>
  808435:	01 c1                	add    ecx,eax
  808437:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80843b:	89 ce                	mov    esi,ecx
  80843d:	48 89 c7             	mov    rdi,rax
  808440:	e8 8a f7 ff ff       	call   807bcf <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  808445:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  808449:	75 0d                	jne    808458 <write_file_byname+0x121>
  80844b:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  80844f:	7e 07                	jle    808458 <write_file_byname+0x121>
  808451:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  808456:	76 ac                	jbe    808404 <write_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  808458:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80845b:	48 98                	cdqe   
  80845d:	48 c1 e0 05          	shl    rax,0x5
  808461:	48 89 c2             	mov    rdx,rax
  808464:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808468:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80846c:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  80846f:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808473:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  80847a:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  808481:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808485:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808489:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  80848d:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  808491:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  808495:	0f b7 c0             	movzx  eax,ax
  808498:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  80849b:	0f b7 05 c9 03 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc203c9]        # 42886b <superblock+0xb>
  8084a2:	0f b7 d0             	movzx  edx,ax
  8084a5:	0f b6 05 c1 03 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc203c1]        # 42886d <superblock+0xd>
  8084ac:	0f b6 c0             	movzx  eax,al
  8084af:	0f af c2             	imul   eax,edx
  8084b2:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  8084b5:	eb 25                	jmp    8084dc <write_file_byname+0x1a5>
    {
        pos-=cluster_size;
  8084b7:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8084ba:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        if(pos<cluster_size)
  8084c0:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8084c6:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8084c9:	7c 1e                	jl     8084e9 <write_file_byname+0x1b2>
            break;
        f_cluster=fat[f_cluster];
  8084cb:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8084ce:	48 98                	cdqe   
  8084d0:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8084d7:	00 
  8084d8:	98                   	cwde   
  8084d9:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  8084dc:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8084e2:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8084e5:	7d d0                	jge    8084b7 <write_file_byname+0x180>
  8084e7:	eb 01                	jmp    8084ea <write_file_byname+0x1b3>
            break;
  8084e9:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  8084ea:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  8084f1:	7e 15                	jle    808508 <write_file_byname+0x1d1>
  8084f3:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8084f9:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8084fc:	7c 0a                	jl     808508 <write_file_byname+0x1d1>
        return -1;//pos out of range
  8084fe:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808503:	e9 ab 01 00 00       	jmp    8086b3 <write_file_byname+0x37c>
    //
    char temp[cluster_size];
  808508:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80850b:	48 63 d0             	movsxd rdx,eax
  80850e:	48 83 ea 01          	sub    rdx,0x1
  808512:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  808516:	48 63 d0             	movsxd rdx,eax
  808519:	49 89 d6             	mov    r14,rdx
  80851c:	41 bf 00 00 00 00    	mov    r15d,0x0
  808522:	48 63 d0             	movsxd rdx,eax
  808525:	49 89 d4             	mov    r12,rdx
  808528:	41 bd 00 00 00 00    	mov    r13d,0x0
  80852e:	48 98                	cdqe   
  808530:	ba 10 00 00 00       	mov    edx,0x10
  808535:	48 83 ea 01          	sub    rdx,0x1
  808539:	48 01 d0             	add    rax,rdx
  80853c:	be 10 00 00 00       	mov    esi,0x10
  808541:	ba 00 00 00 00       	mov    edx,0x0
  808546:	48 f7 f6             	div    rsi
  808549:	48 6b c0 10          	imul   rax,rax,0x10
  80854d:	48 89 c1             	mov    rcx,rax
  808550:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  808557:	48 89 e2             	mov    rdx,rsp
  80855a:	48 29 ca             	sub    rdx,rcx
  80855d:	48 39 d4             	cmp    rsp,rdx
  808560:	74 12                	je     808574 <write_file_byname+0x23d>
  808562:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  808569:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  808570:	00 00 
  808572:	eb e9                	jmp    80855d <write_file_byname+0x226>
  808574:	48 89 c2             	mov    rdx,rax
  808577:	81 e2 ff 0f 00 00    	and    edx,0xfff
  80857d:	48 29 d4             	sub    rsp,rdx
  808580:	48 89 c2             	mov    rdx,rax
  808583:	81 e2 ff 0f 00 00    	and    edx,0xfff
  808589:	48 85 d2             	test   rdx,rdx
  80858c:	74 10                	je     80859e <write_file_byname+0x267>
  80858e:	25 ff 0f 00 00       	and    eax,0xfff
  808593:	48 83 e8 08          	sub    rax,0x8
  808597:	48 01 e0             	add    rax,rsp
  80859a:	48 83 08 00          	or     QWORD PTR [rax],0x0
  80859e:	48 89 e0             	mov    rax,rsp
  8085a1:	48 83 c0 00          	add    rax,0x0
  8085a5:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of writing might not be aligned
    if(pos>0)
  8085a9:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  8085b0:	0f 8e a2 00 00 00    	jle    808658 <write_file_byname+0x321>
    {
        memcpy(temp+pos,src,cluster_size-pos);
  8085b6:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8085b9:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  8085bf:	89 c2                	mov    edx,eax
  8085c1:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8085c7:	48 63 c8             	movsxd rcx,eax
  8085ca:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8085ce:	48 01 c1             	add    rcx,rax
  8085d1:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8085d8:	48 89 c6             	mov    rsi,rax
  8085db:	48 89 cf             	mov    rdi,rcx
  8085de:	e8 d3 10 00 00       	call   8096b6 <memcpy>
        write_sec(temp,f_cluster,cluster_size-pos);
  8085e3:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8085e6:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  8085ec:	89 c2                	mov    edx,eax
  8085ee:	8b 4d b4             	mov    ecx,DWORD PTR [rbp-0x4c]
  8085f1:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8085f5:	89 ce                	mov    esi,ecx
  8085f7:	48 89 c7             	mov    rdi,rax
  8085fa:	e8 dc ee ff ff       	call   8074db <write_sec>
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  8085ff:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808602:	48 98                	cdqe   
  808604:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  80860b:	00 
  80860c:	98                   	cwde   
  80860d:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    }
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  808610:	eb 46                	jmp    808658 <write_file_byname+0x321>
    {
        write_sec(src,f_cluster+clu_sec_balance,cluster_size);
  808612:	8b 15 28 1c 00 00    	mov    edx,DWORD PTR [rip+0x1c28]        # 80a240 <clu_sec_balance>
  808618:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80861b:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80861e:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  808621:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  808628:	89 ce                	mov    esi,ecx
  80862a:	48 89 c7             	mov    rdi,rax
  80862d:	e8 a9 ee ff ff       	call   8074db <write_sec>
        src+=cluster_size;
  808632:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808635:	48 98                	cdqe   
  808637:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  80863e:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808641:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  808647:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80864a:	48 98                	cdqe   
  80864c:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808653:	00 
  808654:	98                   	cwde   
  808655:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  808658:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  80865f:	7f 0b                	jg     80866c <write_file_byname+0x335>
  808661:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa8]
  808667:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  80866a:	7d a6                	jge    808612 <write_file_byname+0x2db>
    }
    if(len>0)
  80866c:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  808673:	7e 39                	jle    8086ae <write_file_byname+0x377>
    {
        //there might be some leftover less than a cluster
        memcpy(temp,src,len);
  808675:	8b 95 58 ff ff ff    	mov    edx,DWORD PTR [rbp-0xa8]
  80867b:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  808682:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808686:	48 89 ce             	mov    rsi,rcx
  808689:	48 89 c7             	mov    rdi,rax
  80868c:	e8 25 10 00 00       	call   8096b6 <memcpy>
        write_sec(temp,f_cluster+clu_sec_balance,cluster_size);
  808691:	8b 15 a9 1b 00 00    	mov    edx,DWORD PTR [rip+0x1ba9]        # 80a240 <clu_sec_balance>
  808697:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80869a:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80869d:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  8086a0:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8086a4:	89 ce                	mov    esi,ecx
  8086a6:	48 89 c7             	mov    rdi,rax
  8086a9:	e8 2d ee ff ff       	call   8074db <write_sec>
    }
    return 0;
  8086ae:	b8 00 00 00 00       	mov    eax,0x0
  8086b3:	48 89 dc             	mov    rsp,rbx

}
  8086b6:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  8086ba:	5b                   	pop    rbx
  8086bb:	41 5c                	pop    r12
  8086bd:	41 5d                	pop    r13
  8086bf:	41 5e                	pop    r14
  8086c1:	41 5f                	pop    r15
  8086c3:	5d                   	pop    rbp
  8086c4:	c3                   	ret    

00000000008086c5 <file_exist>:


int file_exist(dir_entry entry)
{
  8086c5:	f3 0f 1e fa          	endbr64 
  8086c9:	55                   	push   rbp
  8086ca:	48 89 e5             	mov    rbp,rsp
    if((unsigned char)entry.name[0]==0xe5u||\
  8086cd:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
  8086d1:	3c e5                	cmp    al,0xe5
  8086d3:	74 08                	je     8086dd <file_exist+0x18>
    (unsigned char)entry.name[0]==0u)
  8086d5:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
    if((unsigned char)entry.name[0]==0xe5u||\
  8086d9:	84 c0                	test   al,al
  8086db:	75 07                	jne    8086e4 <file_exist+0x1f>
    {
        //printf("file not exist\n");
        return 0;
  8086dd:	b8 00 00 00 00       	mov    eax,0x0
  8086e2:	eb 05                	jmp    8086e9 <file_exist+0x24>

    }
    return 1;
  8086e4:	b8 01 00 00 00       	mov    eax,0x1
}
  8086e9:	5d                   	pop    rbp
  8086ea:	c3                   	ret    

00000000008086eb <get_entry>:
int get_entry(driver_args* args)
{
  8086eb:	f3 0f 1e fa          	endbr64 
  8086ef:	55                   	push   rbp
  8086f0:	48 89 e5             	mov    rbp,rsp
  8086f3:	53                   	push   rbx
  8086f4:	48 81 ec e8 00 00 00 	sub    rsp,0xe8
  8086fb:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
    char *name=args->path;
  808702:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808709:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80870d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    dir.fistCluNum=((vfs_dir_entry*)args->cwd)->id;
  808711:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808718:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  80871f:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808722:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    dir_entry entry;
    vfs_dir_entry ret;
    entry.name[0]=0xe5;
  808726:	c6 45 90 e5          	mov    BYTE PTR [rbp-0x70],0xe5

    char *p=name;
  80872a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80872e:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    char nametmp[12];
    int index=-1;
  808732:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [rbp-0x24],0xffffffff
    while(*name!='\0')
  808739:	e9 2c 01 00 00       	jmp    80886a <get_entry+0x17f>
    {
        if(*name=='/')
  80873e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808742:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808745:	3c 2f                	cmp    al,0x2f
  808747:	0f 85 18 01 00 00    	jne    808865 <get_entry+0x17a>
        {
            if(name-p>11)return -1;
  80874d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808751:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  808755:	48 83 f8 0b          	cmp    rax,0xb
  808759:	7e 0a                	jle    808765 <get_entry+0x7a>
  80875b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808760:	e9 50 02 00 00       	jmp    8089b5 <get_entry+0x2ca>
            memcpy(nametmp,p,name-p);
  808765:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808769:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  80876d:	89 c2                	mov    edx,eax
  80876f:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  808773:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  80877a:	48 89 ce             	mov    rsi,rcx
  80877d:	48 89 c7             	mov    rdi,rax
  808780:	e8 31 0f 00 00       	call   8096b6 <memcpy>
            cur_dir=dir;
  808785:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808789:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80878d:	48 89 05 0c 41 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2410c],rax        # 42c8a0 <cur_dir>
  808794:	48 89 15 0d 41 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2410d],rdx        # 42c8a8 <cur_dir+0x8>
  80879b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80879f:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8087a3:	48 89 05 06 41 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc24106],rax        # 42c8b0 <cur_dir+0x10>
  8087aa:	48 89 15 07 41 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc24107],rdx        # 42c8b8 <cur_dir+0x18>
            format_name(nametmp);
  8087b1:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  8087b8:	48 89 c7             	mov    rdi,rax
  8087bb:	e8 c3 eb ff ff       	call   807383 <format_name>
            index= find(nametmp);
  8087c0:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  8087c7:	48 89 c7             	mov    rdi,rax
  8087ca:	e8 ce f6 ff ff       	call   807e9d <find>
  8087cf:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            if(index==-1)return -1;
  8087d2:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  8087d6:	75 0a                	jne    8087e2 <get_entry+0xf7>
  8087d8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8087dd:	e9 d3 01 00 00       	jmp    8089b5 <get_entry+0x2ca>
            if(cur_dir.fistCluNum==0)//在根目录
  8087e2:	0f b7 05 d1 40 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc240d1]        # 42c8ba <cur_dir+0x1a>
  8087e9:	66 85 c0             	test   ax,ax
  8087ec:	75 31                	jne    80881f <get_entry+0x134>
                dir=root_dir[index];
  8087ee:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8087f1:	48 98                	cdqe   
  8087f3:	48 c1 e0 05          	shl    rax,0x5
  8087f7:	48 8d 88 a0 88 42 00 	lea    rcx,[rax+0x4288a0]
  8087fe:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808801:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808805:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  808809:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  80880d:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808811:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808815:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  808819:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  80881d:	eb 3a                	jmp    808859 <get_entry+0x16e>
            else//在子目录
                dir=a_clu_of_dir[index%16];
  80881f:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808822:	99                   	cdq    
  808823:	c1 ea 1c             	shr    edx,0x1c
  808826:	01 d0                	add    eax,edx
  808828:	83 e0 0f             	and    eax,0xf
  80882b:	29 d0                	sub    eax,edx
  80882d:	48 98                	cdqe   
  80882f:	48 c1 e0 05          	shl    rax,0x5
  808833:	48 8d 88 c0 c8 42 00 	lea    rcx,[rax+0x42c8c0]
  80883a:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  80883d:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808841:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  808845:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  808849:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  80884d:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808851:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  808855:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
            p=name+1;
  808859:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80885d:	48 83 c0 01          	add    rax,0x1
  808861:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        }
        name++;
  808865:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
    while(*name!='\0')
  80886a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80886e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808871:	84 c0                	test   al,al
  808873:	0f 85 c5 fe ff ff    	jne    80873e <get_entry+0x53>
    }

    //现在就可以开始找文件了
    format_name(p);
  808879:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80887d:	48 89 c7             	mov    rdi,rax
  808880:	e8 fe ea ff ff       	call   807383 <format_name>
    index= find(p);
  808885:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808889:	48 89 c7             	mov    rdi,rax
  80888c:	e8 0c f6 ff ff       	call   807e9d <find>
  808891:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    if(index==-1)return -1;
  808894:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  808898:	75 0a                	jne    8088a4 <get_entry+0x1b9>
  80889a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80889f:	e9 11 01 00 00       	jmp    8089b5 <get_entry+0x2ca>
    
    if(cur_dir.fistCluNum==0)//在根目录
  8088a4:	0f b7 05 0f 40 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2400f]        # 42c8ba <cur_dir+0x1a>
  8088ab:	66 85 c0             	test   ax,ax
  8088ae:	75 31                	jne    8088e1 <get_entry+0x1f6>
        entry=root_dir[index];
  8088b0:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8088b3:	48 98                	cdqe   
  8088b5:	48 c1 e0 05          	shl    rax,0x5
  8088b9:	48 8d 88 a0 88 42 00 	lea    rcx,[rax+0x4288a0]
  8088c0:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8088c3:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  8088c7:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  8088cb:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  8088cf:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8088d3:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  8088d7:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  8088db:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  8088df:	eb 3a                	jmp    80891b <get_entry+0x230>
    else//在子目录
        entry=a_clu_of_dir[index%16];
  8088e1:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8088e4:	99                   	cdq    
  8088e5:	c1 ea 1c             	shr    edx,0x1c
  8088e8:	01 d0                	add    eax,edx
  8088ea:	83 e0 0f             	and    eax,0xf
  8088ed:	29 d0                	sub    eax,edx
  8088ef:	48 98                	cdqe   
  8088f1:	48 c1 e0 05          	shl    rax,0x5
  8088f5:	48 8d 88 c0 c8 42 00 	lea    rcx,[rax+0x42c8c0]
  8088fc:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8088ff:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808903:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  808907:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  80890b:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  80890f:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808913:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  808917:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
    ret.id=entry.fistCluNum;
  80891b:	0f b7 45 aa          	movzx  eax,WORD PTR [rbp-0x56]
  80891f:	0f b7 c0             	movzx  eax,ax
  808922:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    args->entry=ret;
  808928:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80892f:	48 8b 8d 30 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd0]
  808936:	48 8b 9d 38 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xc8]
  80893d:	48 89 48 28          	mov    QWORD PTR [rax+0x28],rcx
  808941:	48 89 58 30          	mov    QWORD PTR [rax+0x30],rbx
  808945:	48 8b 8d 40 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xc0]
  80894c:	48 8b 9d 48 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xb8]
  808953:	48 89 48 38          	mov    QWORD PTR [rax+0x38],rcx
  808957:	48 89 58 40          	mov    QWORD PTR [rax+0x40],rbx
  80895b:	48 8b 8d 50 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb0]
  808962:	48 8b 9d 58 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xa8]
  808969:	48 89 48 48          	mov    QWORD PTR [rax+0x48],rcx
  80896d:	48 89 58 50          	mov    QWORD PTR [rax+0x50],rbx
  808971:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  808978:	48 8b 9d 68 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x98]
  80897f:	48 89 48 58          	mov    QWORD PTR [rax+0x58],rcx
  808983:	48 89 58 60          	mov    QWORD PTR [rax+0x60],rbx
  808987:	48 8b 8d 70 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x90]
  80898e:	48 8b 9d 78 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x88]
  808995:	48 89 48 68          	mov    QWORD PTR [rax+0x68],rcx
  808999:	48 89 58 70          	mov    QWORD PTR [rax+0x70],rbx
  80899d:	48 8b 4d 80          	mov    rcx,QWORD PTR [rbp-0x80]
  8089a1:	48 8b 5d 88          	mov    rbx,QWORD PTR [rbp-0x78]
  8089a5:	48 89 48 78          	mov    QWORD PTR [rax+0x78],rcx
  8089a9:	48 89 98 80 00 00 00 	mov    QWORD PTR [rax+0x80],rbx
    return 0;
  8089b0:	b8 00 00 00 00       	mov    eax,0x0
}
  8089b5:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8089b9:	c9                   	leave  
  8089ba:	c3                   	ret    

00000000008089bb <get_fname>:
        dir=strtok(NULL,'/');
    }
    return 0;
}*/
void get_fname(char *path,char *name)
{
  8089bb:	f3 0f 1e fa          	endbr64 
  8089bf:	55                   	push   rbp
  8089c0:	48 89 e5             	mov    rbp,rsp
  8089c3:	48 83 ec 20          	sub    rsp,0x20
  8089c7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8089cb:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    char *prev,*ptr=strtok(path,'/');
  8089cf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8089d3:	be 2f 00 00 00       	mov    esi,0x2f
  8089d8:	48 89 c7             	mov    rdi,rax
  8089db:	e8 18 0e 00 00       	call   8097f8 <strtok>
  8089e0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  8089e4:	eb 1b                	jmp    808a01 <get_fname+0x46>
    {
        prev=ptr;
  8089e6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8089ea:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        ptr=strtok(NULL,'/');
  8089ee:	be 2f 00 00 00       	mov    esi,0x2f
  8089f3:	bf 00 00 00 00       	mov    edi,0x0
  8089f8:	e8 fb 0d 00 00       	call   8097f8 <strtok>
  8089fd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  808a01:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  808a06:	75 de                	jne    8089e6 <get_fname+0x2b>
    }
    strcpy(name,prev);
  808a08:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808a0c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808a10:	48 89 d6             	mov    rsi,rdx
  808a13:	48 89 c7             	mov    rdi,rax
  808a16:	e8 99 0d 00 00       	call   8097b4 <strcpy>
}
  808a1b:	90                   	nop
  808a1c:	c9                   	leave  
  808a1d:	c3                   	ret    

0000000000808a1e <read_file>:
char buf[1024];
int read_file(driver_args* args)
{
  808a1e:	f3 0f 1e fa          	endbr64 
  808a22:	55                   	push   rbp
  808a23:	48 89 e5             	mov    rbp,rsp
  808a26:	48 83 ec 60          	sub    rsp,0x60
  808a2a:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    int len=args->len;
  808a2e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808a32:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808a35:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int pos=args->pos;
  808a38:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808a3c:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808a3f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  808a42:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808a46:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  808a49:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    char* dist=args->dist_addr;
  808a4d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808a51:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808a54:	48 98                	cdqe   
  808a56:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int c=len/superblock.bytesPerSec;
  808a5a:	0f b7 05 0a fe c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1fe0a]        # 42886b <superblock+0xb>
  808a61:	0f b7 f0             	movzx  esi,ax
  808a64:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808a67:	99                   	cdq    
  808a68:	f7 fe                	idiv   esi
  808a6a:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    c+=len%superblock.bytesPerSec?1:0;
  808a6d:	0f b7 05 f7 fd c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1fdf7]        # 42886b <superblock+0xb>
  808a74:	0f b7 c8             	movzx  ecx,ax
  808a77:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808a7a:	99                   	cdq    
  808a7b:	f7 f9                	idiv   ecx
  808a7d:	89 d0                	mov    eax,edx
  808a7f:	85 c0                	test   eax,eax
  808a81:	0f 95 c0             	setne  al
  808a84:	0f b6 c0             	movzx  eax,al
  808a87:	01 45 dc             	add    DWORD PTR [rbp-0x24],eax
    //printf("[fs]%d secs to sys_read.\n",c);
    int n=0;
  808a8a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808a91:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  808a95:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    int mpos=pos/superblock.bytesPerSec;
  808a99:	0f b7 05 cb fd c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1fdcb]        # 42886b <superblock+0xb>
  808aa0:	0f b7 f8             	movzx  edi,ax
  808aa3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808aa6:	99                   	cdq    
  808aa7:	f7 ff                	idiv   edi
  808aa9:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  808aac:	eb 16                	jmp    808ac4 <read_file+0xa6>
    {
         clu=fat[clu];
  808aae:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808ab2:	48 98                	cdqe   
  808ab4:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808abb:	00 
  808abc:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  808ac0:	83 6d e4 01          	sub    DWORD PTR [rbp-0x1c],0x1
  808ac4:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808ac9:	77 06                	ja     808ad1 <read_file+0xb3>
  808acb:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  808acf:	7f dd                	jg     808aae <read_file+0x90>
    }
    if(mpos>0)return -1;//读取位置超出范围
  808ad1:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  808ad5:	7e 0a                	jle    808ae1 <read_file+0xc3>
  808ad7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808adc:	e9 cd 00 00 00       	jmp    808bae <read_file+0x190>
    pos%=superblock.bytesPerSec;
  808ae1:	0f b7 05 83 fd c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1fd83]        # 42886b <superblock+0xb>
  808ae8:	0f b7 c8             	movzx  ecx,ax
  808aeb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808aee:	99                   	cdq    
  808aef:	f7 f9                	idiv   ecx
  808af1:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
    int block_size=superblock.secPerClu*superblock.bytesPerSec;
  808af4:	0f b6 05 72 fd c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fd72]        # 42886d <superblock+0xd>
  808afb:	0f b6 d0             	movzx  edx,al
  808afe:	0f b7 05 66 fd c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1fd66]        # 42886b <superblock+0xb>
  808b05:	0f b7 c0             	movzx  eax,ax
  808b08:	0f af c2             	imul   eax,edx
  808b0b:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    while(n<c)
  808b0e:	e9 89 00 00 00       	jmp    808b9c <read_file+0x17e>
    {
        read_sec(buf,clu+clu_sec_balance,superblock.secPerClu);
  808b13:	0f b6 05 53 fd c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fd53]        # 42886d <superblock+0xd>
  808b1a:	0f b6 c0             	movzx  eax,al
  808b1d:	0f b7 4d ea          	movzx  ecx,WORD PTR [rbp-0x16]
  808b21:	8b 15 19 17 00 00    	mov    edx,DWORD PTR [rip+0x1719]        # 80a240 <clu_sec_balance>
  808b27:	01 d1                	add    ecx,edx
  808b29:	89 c2                	mov    edx,eax
  808b2b:	89 ce                	mov    esi,ecx
  808b2d:	bf e0 0a 43 00       	mov    edi,0x430ae0
  808b32:	e8 98 f0 ff ff       	call   807bcf <read_sec>
        //printf("%x+%x\n",buf,pos);
        int cplen=block_size-pos>len?len:block_size-pos;
  808b37:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  808b3a:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  808b3d:	8b 55 e0             	mov    edx,DWORD PTR [rbp-0x20]
  808b40:	39 c2                	cmp    edx,eax
  808b42:	0f 4e c2             	cmovle eax,edx
  808b45:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
        memcpy(dist,buf+pos,cplen);
  808b48:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  808b4b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808b4e:	48 98                	cdqe   
  808b50:	48 8d 88 e0 0a 43 00 	lea    rcx,[rax+0x430ae0]
  808b57:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808b5b:	48 89 ce             	mov    rsi,rcx
  808b5e:	48 89 c7             	mov    rdi,rax
  808b61:	e8 50 0b 00 00       	call   8096b6 <memcpy>
        n++;
  808b66:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        dist+=block_size-pos;
  808b6a:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  808b6d:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  808b70:	48 98                	cdqe   
  808b72:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        if(pos>0)pos=0;
  808b76:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808b7a:	7e 07                	jle    808b83 <read_file+0x165>
  808b7c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        clu=fat[clu];
  808b83:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808b87:	48 98                	cdqe   
  808b89:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808b90:	00 
  808b91:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  808b95:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808b9a:	77 0e                	ja     808baa <read_file+0x18c>
    while(n<c)
  808b9c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808b9f:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  808ba2:	0f 8c 6b ff ff ff    	jl     808b13 <read_file+0xf5>
  808ba8:	eb 01                	jmp    808bab <read_file+0x18d>
        if(clu>=FAT_EOF)break;
  808baa:	90                   	nop
    }
    return n;
  808bab:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
}
  808bae:	c9                   	leave  
  808baf:	c3                   	ret    

0000000000808bb0 <write_file>:
int write_file(driver_args* args)
{
  808bb0:	f3 0f 1e fa          	endbr64 
  808bb4:	55                   	push   rbp
  808bb5:	48 89 e5             	mov    rbp,rsp
  808bb8:	48 83 ec 50          	sub    rsp,0x50
  808bbc:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    int len=args->len;
  808bc0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808bc4:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808bc7:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    int pos=args->pos;
  808bca:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808bce:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808bd1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  808bd4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808bd8:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  808bdb:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    char* src=args->src_addr;
  808bdf:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808be3:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808be6:	48 98                	cdqe   
  808be8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    pos/=superblock.bytesPerSec;
  808bec:	0f b7 05 78 fc c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1fc78]        # 42886b <superblock+0xb>
  808bf3:	0f b7 f0             	movzx  esi,ax
  808bf6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808bf9:	99                   	cdq    
  808bfa:	f7 fe                	idiv   esi
  808bfc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=len/512+len%512?1:0;
  808bff:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808c02:	8d 90 ff 01 00 00    	lea    edx,[rax+0x1ff]
  808c08:	85 c0                	test   eax,eax
  808c0a:	0f 48 c2             	cmovs  eax,edx
  808c0d:	c1 f8 09             	sar    eax,0x9
  808c10:	89 c1                	mov    ecx,eax
  808c12:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808c15:	99                   	cdq    
  808c16:	c1 ea 17             	shr    edx,0x17
  808c19:	01 d0                	add    eax,edx
  808c1b:	25 ff 01 00 00       	and    eax,0x1ff
  808c20:	29 d0                	sub    eax,edx
  808c22:	01 c8                	add    eax,ecx
  808c24:	85 c0                	test   eax,eax
  808c26:	0f 95 c0             	setne  al
  808c29:	0f b6 c0             	movzx  eax,al
  808c2c:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int n=0;
  808c2f:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808c36:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  808c3a:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&pos>0;pos--,clu=fat[clu]);
  808c3e:	eb 16                	jmp    808c56 <write_file+0xa6>
  808c40:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  808c44:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808c48:	48 98                	cdqe   
  808c4a:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808c51:	00 
  808c52:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  808c56:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808c5b:	77 06                	ja     808c63 <write_file+0xb3>
  808c5d:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808c61:	7f dd                	jg     808c40 <write_file+0x90>
    if(pos>0)return -1;//读取位置超出范围
  808c63:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808c67:	7e 52                	jle    808cbb <write_file+0x10b>
  808c69:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808c6e:	eb 59                	jmp    808cc9 <write_file+0x119>
    while(n<c)
    {
        write_sec(src,clu+clu_sec_balance,1);
  808c70:	0f b7 55 ea          	movzx  edx,WORD PTR [rbp-0x16]
  808c74:	8b 05 c6 15 00 00    	mov    eax,DWORD PTR [rip+0x15c6]        # 80a240 <clu_sec_balance>
  808c7a:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  808c7d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808c81:	ba 01 00 00 00       	mov    edx,0x1
  808c86:	89 ce                	mov    esi,ecx
  808c88:	48 89 c7             	mov    rdi,rax
  808c8b:	e8 4b e8 ff ff       	call   8074db <write_sec>
        n++;
  808c90:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        src+=superblock.bytesPerSec;
  808c94:	0f b7 05 d0 fb c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1fbd0]        # 42886b <superblock+0xb>
  808c9b:	0f b7 c0             	movzx  eax,ax
  808c9e:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        clu=fat[clu];
  808ca2:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808ca6:	48 98                	cdqe   
  808ca8:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808caf:	00 
  808cb0:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  808cb4:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808cb9:	77 0a                	ja     808cc5 <write_file+0x115>
    while(n<c)
  808cbb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808cbe:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  808cc1:	7c ad                	jl     808c70 <write_file+0xc0>
  808cc3:	eb 01                	jmp    808cc6 <write_file+0x116>
        if(clu>=FAT_EOF)break;
  808cc5:	90                   	nop
    }
    return n;
  808cc6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    
  808cc9:	c9                   	leave  
  808cca:	c3                   	ret    

0000000000808ccb <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  808ccb:	f3 0f 1e fa          	endbr64 
  808ccf:	55                   	push   rbp
  808cd0:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  808cd3:	48 8b 05 16 82 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc28216]        # 430ef0 <vpage_base>
  808cda:	48 05 a0 00 00 00    	add    rax,0xa0
  808ce0:	48 89 05 09 82 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28209],rax        # 430ef0 <vpage_base>
    page_boffset+=SCREEN_W*2;
  808ce7:	8b 05 0b 82 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2820b]        # 430ef8 <page_boffset>
  808ced:	05 a0 00 00 00       	add    eax,0xa0
  808cf2:	89 05 00 82 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28200],eax        # 430ef8 <page_boffset>
    if(vpage_base>=video_end)
  808cf8:	48 8b 15 f1 81 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc281f1]        # 430ef0 <vpage_base>
  808cff:	48 8b 05 e2 81 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc281e2]        # 430ee8 <video_end>
  808d06:	48 39 c2             	cmp    rdx,rax
  808d09:	72 0e                	jb     808d19 <scrdown+0x4e>
        vpage_base=video_base;
  808d0b:	48 8b 05 ce 81 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc281ce]        # 430ee0 <video_base>
  808d12:	48 89 05 d7 81 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc281d7],rax        # 430ef0 <vpage_base>
    set_origin();
  808d19:	b8 00 00 00 00       	mov    eax,0x0
  808d1e:	e8 6a 00 00 00       	call   808d8d <set_origin>
}
  808d23:	90                   	nop
  808d24:	5d                   	pop    rbp
  808d25:	c3                   	ret    

0000000000808d26 <scrup>:
void scrup()
{
  808d26:	f3 0f 1e fa          	endbr64 
  808d2a:	55                   	push   rbp
  808d2b:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  808d2e:	8b 05 c4 81 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc281c4]        # 430ef8 <page_boffset>
  808d34:	85 c0                	test   eax,eax
  808d36:	75 24                	jne    808d5c <scrup+0x36>
    {
        page_boffset=0;
  808d38:	c7 05 b6 81 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc281b6],0x0        # 430ef8 <page_boffset>
  808d3f:	00 00 00 
        vpage_base=video_base;
  808d42:	48 8b 05 97 81 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc28197]        # 430ee0 <video_base>
  808d49:	48 89 05 a0 81 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc281a0],rax        # 430ef0 <vpage_base>
        set_origin();
  808d50:	b8 00 00 00 00       	mov    eax,0x0
  808d55:	e8 33 00 00 00       	call   808d8d <set_origin>
        return;
  808d5a:	eb 2f                	jmp    808d8b <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  808d5c:	48 8b 05 8d 81 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2818d]        # 430ef0 <vpage_base>
  808d63:	48 2d a0 00 00 00    	sub    rax,0xa0
  808d69:	48 89 05 80 81 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28180],rax        # 430ef0 <vpage_base>
    page_boffset-=SCREEN_W*2;
  808d70:	8b 05 82 81 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28182]        # 430ef8 <page_boffset>
  808d76:	2d a0 00 00 00       	sub    eax,0xa0
  808d7b:	89 05 77 81 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28177],eax        # 430ef8 <page_boffset>
    set_origin();
  808d81:	b8 00 00 00 00       	mov    eax,0x0
  808d86:	e8 02 00 00 00       	call   808d8d <set_origin>
}
  808d8b:	5d                   	pop    rbp
  808d8c:	c3                   	ret    

0000000000808d8d <set_origin>:
void set_origin(void)
{
  808d8d:	f3 0f 1e fa          	endbr64 
  808d91:	55                   	push   rbp
  808d92:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  808d95:	fa                   	cli    
    outb(port_reg_index,12);
  808d96:	8b 05 6c 81 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2816c]        # 430f08 <port_reg_index>
  808d9c:	0f b7 c0             	movzx  eax,ax
  808d9f:	be 0c 00 00 00       	mov    esi,0xc
  808da4:	89 c7                	mov    edi,eax
  808da6:	e8 25 bd ff ff       	call   804ad0 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  808dab:	8b 05 47 81 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28147]        # 430ef8 <page_boffset>
  808db1:	c1 e8 09             	shr    eax,0x9
  808db4:	0f b6 d0             	movzx  edx,al
  808db7:	8b 05 4f 81 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2814f]        # 430f0c <port_reg_v>
  808dbd:	0f b7 c0             	movzx  eax,ax
  808dc0:	89 d6                	mov    esi,edx
  808dc2:	89 c7                	mov    edi,eax
  808dc4:	e8 07 bd ff ff       	call   804ad0 <outb>
    outb(port_reg_index,13);
  808dc9:	8b 05 39 81 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28139]        # 430f08 <port_reg_index>
  808dcf:	0f b7 c0             	movzx  eax,ax
  808dd2:	be 0d 00 00 00       	mov    esi,0xd
  808dd7:	89 c7                	mov    edi,eax
  808dd9:	e8 f2 bc ff ff       	call   804ad0 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  808dde:	8b 05 14 81 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28114]        # 430ef8 <page_boffset>
  808de4:	d1 e8                	shr    eax,1
  808de6:	0f b6 d0             	movzx  edx,al
  808de9:	8b 05 1d 81 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2811d]        # 430f0c <port_reg_v>
  808def:	0f b7 c0             	movzx  eax,ax
  808df2:	89 d6                	mov    esi,edx
  808df4:	89 c7                	mov    edi,eax
  808df6:	e8 d5 bc ff ff       	call   804ad0 <outb>
    asm volatile("sti");
  808dfb:	fb                   	sti    

}
  808dfc:	90                   	nop
  808dfd:	5d                   	pop    rbp
  808dfe:	c3                   	ret    

0000000000808dff <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  808dff:	f3 0f 1e fa          	endbr64 
  808e03:	55                   	push   rbp
  808e04:	48 89 e5             	mov    rbp,rsp
  808e07:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  808e0b:	be c8 22 81 00       	mov    esi,0x8122c8
  808e10:	bf 74 21 81 00       	mov    edi,0x812174
  808e15:	e8 9a 09 00 00       	call   8097b4 <strcpy>
    strcpy(dev_stdout.name,"stdout");
  808e1a:	be cd 22 81 00       	mov    esi,0x8122cd
  808e1f:	bf 34 22 81 00       	mov    edi,0x812234
  808e24:	e8 8b 09 00 00       	call   8097b4 <strcpy>
    reg_driver(&drv_tty);
  808e29:	bf c0 20 81 00       	mov    edi,0x8120c0
  808e2e:	e8 81 9f ff ff       	call   802db4 <reg_driver>
    reg_device(&dev_tty);
  808e33:	bf 60 21 81 00       	mov    edi,0x812160
  808e38:	e8 8f 9c ff ff       	call   802acc <reg_device>
    reg_device(&dev_stdout);
  808e3d:	bf 20 22 81 00       	mov    edi,0x812220
  808e42:	e8 85 9c ff ff       	call   802acc <reg_device>
    unsigned char *vp=0x20000;
  808e47:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  808e4e:	00 
    if(*vp==0x7)
  808e4f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e53:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e56:	3c 07                	cmp    al,0x7
  808e58:	75 36                	jne    808e90 <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  808e5a:	c7 05 98 80 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28098],0x0        # 430efc <video_mode>
  808e61:	00 00 00 
        video_base=0xb0000;
  808e64:	48 c7 05 71 80 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28071],0xb0000        # 430ee0 <video_base>
  808e6b:	00 00 0b 00 
        video_end=0xb8000-1;
  808e6f:	48 c7 05 6e 80 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2806e],0xb7fff        # 430ee8 <video_end>
  808e76:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  808e7a:	c7 05 84 80 c2 ff b4 	mov    DWORD PTR [rip+0xffffffffffc28084],0x3b4        # 430f08 <port_reg_index>
  808e81:	03 00 00 
        port_reg_v=0x3b5;
  808e84:	c7 05 7e 80 c2 ff b5 	mov    DWORD PTR [rip+0xffffffffffc2807e],0x3b5        # 430f0c <port_reg_v>
  808e8b:	03 00 00 
  808e8e:	eb 61                	jmp    808ef1 <init_tty+0xf2>
    }else if(*vp<=0x3)
  808e90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e94:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e97:	3c 03                	cmp    al,0x3
  808e99:	77 36                	ja     808ed1 <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  808e9b:	c7 05 57 80 c2 ff 01 	mov    DWORD PTR [rip+0xffffffffffc28057],0x1        # 430efc <video_mode>
  808ea2:	00 00 00 
        video_base=0xb8000;
  808ea5:	48 c7 05 30 80 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28030],0xb8000        # 430ee0 <video_base>
  808eac:	00 80 0b 00 
        video_end=0xc0000-1;
  808eb0:	48 c7 05 2d 80 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2802d],0xbffff        # 430ee8 <video_end>
  808eb7:	ff ff 0b 00 
        port_reg_index=0x3d4;
  808ebb:	c7 05 43 80 c2 ff d4 	mov    DWORD PTR [rip+0xffffffffffc28043],0x3d4        # 430f08 <port_reg_index>
  808ec2:	03 00 00 
        port_reg_v=0x3d5;
  808ec5:	c7 05 3d 80 c2 ff d5 	mov    DWORD PTR [rip+0xffffffffffc2803d],0x3d5        # 430f0c <port_reg_v>
  808ecc:	03 00 00 
  808ecf:	eb 20                	jmp    808ef1 <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  808ed1:	c7 05 21 80 c2 ff 02 	mov    DWORD PTR [rip+0xffffffffffc28021],0x2        # 430efc <video_mode>
  808ed8:	00 00 00 
        video_base=0xa0000;
  808edb:	48 c7 05 fa 7f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc27ffa],0xa0000        # 430ee0 <video_base>
  808ee2:	00 00 0a 00 
        video_end=0xb0000-1;
  808ee6:	48 c7 05 f7 7f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc27ff7],0xaffff        # 430ee8 <video_end>
  808eed:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  808ef1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ef5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808ef8:	3c 01                	cmp    al,0x1
  808efa:	77 0f                	ja     808f0b <init_tty+0x10c>
  808efc:	c7 05 fe 7f c2 ff 28 	mov    DWORD PTR [rip+0xffffffffffc27ffe],0x28        # 430f04 <line_chs>
  808f03:	00 00 00 
  808f06:	e9 91 00 00 00       	jmp    808f9c <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  808f0b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f0f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f12:	3c 03                	cmp    al,0x3
  808f14:	76 0b                	jbe    808f21 <init_tty+0x122>
  808f16:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f1a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f1d:	3c 07                	cmp    al,0x7
  808f1f:	75 0c                	jne    808f2d <init_tty+0x12e>
  808f21:	c7 05 d9 7f c2 ff 50 	mov    DWORD PTR [rip+0xffffffffffc27fd9],0x50        # 430f04 <line_chs>
  808f28:	00 00 00 
  808f2b:	eb 6f                	jmp    808f9c <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  808f2d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f31:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f34:	3c 05                	cmp    al,0x5
  808f36:	76 16                	jbe    808f4e <init_tty+0x14f>
  808f38:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f3c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f3f:	3c 09                	cmp    al,0x9
  808f41:	74 0b                	je     808f4e <init_tty+0x14f>
  808f43:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f47:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f4a:	3c 0d                	cmp    al,0xd
  808f4c:	75 0c                	jne    808f5a <init_tty+0x15b>
  808f4e:	c7 05 ac 7f c2 ff 40 	mov    DWORD PTR [rip+0xffffffffffc27fac],0x140        # 430f04 <line_chs>
  808f55:	01 00 00 
  808f58:	eb 42                	jmp    808f9c <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  808f5a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f5e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f61:	3c 06                	cmp    al,0x6
  808f63:	74 16                	je     808f7b <init_tty+0x17c>
  808f65:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f69:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f6c:	3c 0a                	cmp    al,0xa
  808f6e:	74 0b                	je     808f7b <init_tty+0x17c>
  808f70:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f74:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f77:	3c 0d                	cmp    al,0xd
  808f79:	76 0c                	jbe    808f87 <init_tty+0x188>
  808f7b:	c7 05 7f 7f c2 ff 80 	mov    DWORD PTR [rip+0xffffffffffc27f7f],0x280        # 430f04 <line_chs>
  808f82:	02 00 00 
  808f85:	eb 15                	jmp    808f9c <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  808f87:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f8b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f8e:	3c 08                	cmp    al,0x8
  808f90:	75 0a                	jne    808f9c <init_tty+0x19d>
  808f92:	c7 05 68 7f c2 ff a0 	mov    DWORD PTR [rip+0xffffffffffc27f68],0xa0        # 430f04 <line_chs>
  808f99:	00 00 00 
    switch (*vp)
  808f9c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808fa0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808fa3:	0f b6 c0             	movzx  eax,al
  808fa6:	83 f8 14             	cmp    eax,0x14
  808fa9:	77 61                	ja     80900c <init_tty+0x20d>
  808fab:	89 c0                	mov    eax,eax
  808fad:	48 8b 04 c5 d8 22 81 	mov    rax,QWORD PTR [rax*8+0x8122d8]
  808fb4:	00 
  808fb5:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  808fb8:	c7 05 4e 7f c2 ff e8 	mov    DWORD PTR [rip+0xffffffffffc27f4e],0x3e8        # 430f10 <vpage_size>
  808fbf:	03 00 00 
  808fc2:	eb 49                	jmp    80900d <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  808fc4:	c7 05 42 7f c2 ff d0 	mov    DWORD PTR [rip+0xffffffffffc27f42],0x7d0        # 430f10 <vpage_size>
  808fcb:	07 00 00 
  808fce:	eb 3d                	jmp    80900d <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  808fd0:	c7 05 36 7f c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc27f36],0xfa00        # 430f10 <vpage_size>
  808fd7:	fa 00 00 
  808fda:	eb 31                	jmp    80900d <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  808fdc:	c7 05 2a 7f c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc27f2a],0x1f400        # 430f10 <vpage_size>
  808fe3:	f4 01 00 
  808fe6:	eb 25                	jmp    80900d <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  808fe8:	c7 05 1e 7f c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc27f1e],0x7d00        # 430f10 <vpage_size>
  808fef:	7d 00 00 
  808ff2:	eb 19                	jmp    80900d <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  808ff4:	c7 05 12 7f c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc27f12],0x36b00        # 430f10 <vpage_size>
  808ffb:	6b 03 00 
  808ffe:	eb 0d                	jmp    80900d <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  809000:	c7 05 06 7f c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc27f06],0x4b000        # 430f10 <vpage_size>
  809007:	b0 04 00 
  80900a:	eb 01                	jmp    80900d <init_tty+0x20e>
    default:
        break;
  80900c:	90                   	nop
    }
    m_ptr=video_base;
  80900d:	48 8b 05 cc 7e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc27ecc]        # 430ee0 <video_base>
  809014:	48 89 05 2d 12 00 00 	mov    QWORD PTR [rip+0x122d],rax        # 80a248 <m_ptr>
    page_boffset=0;
  80901b:	c7 05 d3 7e c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc27ed3],0x0        # 430ef8 <page_boffset>
  809022:	00 00 00 
    vpage_base=video_base;
  809025:	48 8b 05 b4 7e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc27eb4]        # 430ee0 <video_base>
  80902c:	48 89 05 bd 7e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc27ebd],rax        # 430ef0 <vpage_base>
    vp++;
  809033:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  809038:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80903c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80903f:	0f b6 c0             	movzx  eax,al
  809042:	89 05 b8 7e c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27eb8],eax        # 430f00 <vpage>
    vp++;
  809048:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  80904d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809051:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809055:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809059:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80905c:	0f b6 c0             	movzx  eax,al
  80905f:	89 05 b7 7e c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27eb7],eax        # 430f1c <stline>
    endline=*vp++;
  809065:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809069:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80906d:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809071:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809074:	0f b6 c0             	movzx  eax,al
  809077:	89 05 a3 7e c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27ea3],eax        # 430f20 <endline>
    videoy=*vp++;
  80907d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809081:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809085:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809089:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80908c:	0f b6 c0             	movzx  eax,al
  80908f:	89 05 83 7e c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27e83],eax        # 430f18 <videoy>
    videox=*vp;
  809095:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809099:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80909c:	0f b6 c0             	movzx  eax,al
  80909f:	89 05 6f 7e c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27e6f],eax        # 430f14 <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  8090a5:	90                   	nop
  8090a6:	c9                   	leave  
  8090a7:	c3                   	ret    

00000000008090a8 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  8090a8:	f3 0f 1e fa          	endbr64 
  8090ac:	55                   	push   rbp
  8090ad:	48 89 e5             	mov    rbp,rsp
  8090b0:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  8090b4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8090b8:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8090bb:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  8090be:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8090c1:	05 00 c0 05 00       	add    eax,0x5c000
  8090c6:	01 c0                	add    eax,eax
  8090c8:	48 98                	cdqe   
  8090ca:	48 89 05 77 11 00 00 	mov    QWORD PTR [rip+0x1177],rax        # 80a248 <m_ptr>
}
  8090d1:	90                   	nop
  8090d2:	5d                   	pop    rbp
  8090d3:	c3                   	ret    

00000000008090d4 <tell_monitor>:
int tell_monitor()
{
  8090d4:	f3 0f 1e fa          	endbr64 
  8090d8:	55                   	push   rbp
  8090d9:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  8090dc:	48 8b 05 65 11 00 00 	mov    rax,QWORD PTR [rip+0x1165]        # 80a248 <m_ptr>
  8090e3:	48 8b 15 f6 7d c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27df6]        # 430ee0 <video_base>
  8090ea:	48 29 d0             	sub    rax,rdx
  8090ed:	48 89 c2             	mov    rdx,rax
  8090f0:	48 c1 ea 3f          	shr    rdx,0x3f
  8090f4:	48 01 d0             	add    rax,rdx
  8090f7:	48 d1 f8             	sar    rax,1
}
  8090fa:	5d                   	pop    rbp
  8090fb:	c3                   	ret    

00000000008090fc <del_ch>:
void del_ch()
{
  8090fc:	f3 0f 1e fa          	endbr64 
  809100:	55                   	push   rbp
  809101:	48 89 e5             	mov    rbp,rsp
  809104:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  80910b:	48 8b 05 36 11 00 00 	mov    rax,QWORD PTR [rip+0x1136]        # 80a248 <m_ptr>
  809112:	48 83 e8 02          	sub    rax,0x2
  809116:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  80911a:	b8 00 00 00 00       	mov    eax,0x0
  80911f:	e8 b0 ff ff ff       	call   8090d4 <tell_monitor>
  809124:	89 c2                	mov    edx,eax
  809126:	48 63 c2             	movsxd rax,edx
  809129:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  809130:	48 c1 e8 20          	shr    rax,0x20
  809134:	c1 f8 05             	sar    eax,0x5
  809137:	89 d1                	mov    ecx,edx
  809139:	c1 f9 1f             	sar    ecx,0x1f
  80913c:	29 c8                	sub    eax,ecx
  80913e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  809141:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  809144:	89 c8                	mov    eax,ecx
  809146:	c1 e0 02             	shl    eax,0x2
  809149:	01 c8                	add    eax,ecx
  80914b:	c1 e0 04             	shl    eax,0x4
  80914e:	29 c2                	sub    edx,eax
  809150:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  809153:	eb 17                	jmp    80916c <del_ch+0x70>
    {
        *p=*(p+2);
  809155:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809159:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  80915d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809161:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  809163:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  809168:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80916c:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  809170:	7e e3                	jle    809155 <del_ch+0x59>
    }
    driver_args args= {
  809172:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  809179:	b8 00 00 00 00       	mov    eax,0x0
  80917e:	b9 18 00 00 00       	mov    ecx,0x18
  809183:	48 89 d7             	mov    rdi,rdx
  809186:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  809189:	b8 00 00 00 00       	mov    eax,0x0
  80918e:	e8 41 ff ff ff       	call   8090d4 <tell_monitor>
  809193:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  809196:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  80919c:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  8091a3:	48 89 c7             	mov    rdi,rax
  8091a6:	e8 fd fe ff ff       	call   8090a8 <seek_tty>
    set_cur();
  8091ab:	b8 00 00 00 00       	mov    eax,0x0
  8091b0:	e8 03 00 00 00       	call   8091b8 <set_cur>
}
  8091b5:	90                   	nop
  8091b6:	c9                   	leave  
  8091b7:	c3                   	ret    

00000000008091b8 <set_cur>:
void set_cur()
{
  8091b8:	f3 0f 1e fa          	endbr64 
  8091bc:	55                   	push   rbp
  8091bd:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  8091c0:	fa                   	cli    
    outb(port_reg_index,14);
  8091c1:	8b 05 41 7d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27d41]        # 430f08 <port_reg_index>
  8091c7:	0f b7 c0             	movzx  eax,ax
  8091ca:	be 0e 00 00 00       	mov    esi,0xe
  8091cf:	89 c7                	mov    edi,eax
  8091d1:	e8 fa b8 ff ff       	call   804ad0 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  8091d6:	48 8b 05 6b 10 00 00 	mov    rax,QWORD PTR [rip+0x106b]        # 80a248 <m_ptr>
  8091dd:	48 8b 15 fc 7c c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27cfc]        # 430ee0 <video_base>
  8091e4:	48 29 d0             	sub    rax,rdx
  8091e7:	48 c1 f8 09          	sar    rax,0x9
  8091eb:	0f b6 d0             	movzx  edx,al
  8091ee:	8b 05 18 7d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27d18]        # 430f0c <port_reg_v>
  8091f4:	0f b7 c0             	movzx  eax,ax
  8091f7:	89 d6                	mov    esi,edx
  8091f9:	89 c7                	mov    edi,eax
  8091fb:	e8 d0 b8 ff ff       	call   804ad0 <outb>
    outb(port_reg_index,15);
  809200:	8b 05 02 7d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27d02]        # 430f08 <port_reg_index>
  809206:	0f b7 c0             	movzx  eax,ax
  809209:	be 0f 00 00 00       	mov    esi,0xf
  80920e:	89 c7                	mov    edi,eax
  809210:	e8 bb b8 ff ff       	call   804ad0 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  809215:	48 8b 05 2c 10 00 00 	mov    rax,QWORD PTR [rip+0x102c]        # 80a248 <m_ptr>
  80921c:	48 8b 15 bd 7c c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27cbd]        # 430ee0 <video_base>
  809223:	48 29 d0             	sub    rax,rdx
  809226:	48 d1 f8             	sar    rax,1
  809229:	0f b6 d0             	movzx  edx,al
  80922c:	8b 05 da 7c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27cda]        # 430f0c <port_reg_v>
  809232:	0f b7 c0             	movzx  eax,ax
  809235:	89 d6                	mov    esi,edx
  809237:	89 c7                	mov    edi,eax
  809239:	e8 92 b8 ff ff       	call   804ad0 <outb>
    asm volatile("sti");
  80923e:	fb                   	sti    
}
  80923f:	90                   	nop
  809240:	5d                   	pop    rbp
  809241:	c3                   	ret    

0000000000809242 <read_tty>:

int read_tty(driver_args *args)
{
  809242:	f3 0f 1e fa          	endbr64 
  809246:	55                   	push   rbp
  809247:	48 89 e5             	mov    rbp,rsp
  80924a:	48 83 ec 20          	sub    rsp,0x20
  80924e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  809252:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809256:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809259:	48 98                	cdqe   
  80925b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80925f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809263:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  809266:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  809269:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809270:	eb 4a                	jmp    8092bc <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  809272:	48 8b 15 cf 0f 00 00 	mov    rdx,QWORD PTR [rip+0xfcf]        # 80a248 <m_ptr>
  809279:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80927d:	48 8d 48 01          	lea    rcx,[rax+0x1]
  809281:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  809285:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  809288:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  80928a:	48 8b 05 b7 0f 00 00 	mov    rax,QWORD PTR [rip+0xfb7]        # 80a248 <m_ptr>
  809291:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  809297:	75 0d                	jne    8092a6 <read_tty+0x64>
  809299:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80929d:	7e 07                	jle    8092a6 <read_tty+0x64>
        {
            return 1;//读到尾了
  80929f:	b8 01 00 00 00       	mov    eax,0x1
  8092a4:	eb 2d                	jmp    8092d3 <read_tty+0x91>
        }
        m_ptr+=2;
  8092a6:	48 8b 05 9b 0f 00 00 	mov    rax,QWORD PTR [rip+0xf9b]        # 80a248 <m_ptr>
  8092ad:	48 83 c0 02          	add    rax,0x2
  8092b1:	48 89 05 90 0f 00 00 	mov    QWORD PTR [rip+0xf90],rax        # 80a248 <m_ptr>
    for(int i=0;i<len;i++)
  8092b8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8092bc:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8092bf:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  8092c2:	7c ae                	jl     809272 <read_tty+0x30>
    }
    set_cur();
  8092c4:	b8 00 00 00 00       	mov    eax,0x0
  8092c9:	e8 ea fe ff ff       	call   8091b8 <set_cur>
    return 0;
  8092ce:	b8 00 00 00 00       	mov    eax,0x0
}
  8092d3:	c9                   	leave  
  8092d4:	c3                   	ret    

00000000008092d5 <write_tty>:
int write_tty(driver_args *args)
{
  8092d5:	f3 0f 1e fa          	endbr64 
  8092d9:	55                   	push   rbp
  8092da:	48 89 e5             	mov    rbp,rsp
  8092dd:	48 83 ec 30          	sub    rsp,0x30
  8092e1:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  8092e5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8092e9:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8092ec:	48 98                	cdqe   
  8092ee:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  8092f2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8092f6:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8092f9:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  8092fc:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809303:	e9 0b 01 00 00       	jmp    809413 <write_tty+0x13e>
    {
        if(*src=='\n')
  809308:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80930c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80930f:	3c 0a                	cmp    al,0xa
  809311:	75 50                	jne    809363 <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  809313:	48 8b 05 2e 0f 00 00 	mov    rax,QWORD PTR [rip+0xf2e]        # 80a248 <m_ptr>
  80931a:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  809320:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  809323:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809326:	89 c2                	mov    edx,eax
  809328:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  80932d:	48 0f af c2          	imul   rax,rdx
  809331:	48 c1 e8 20          	shr    rax,0x20
  809335:	c1 e8 07             	shr    eax,0x7
  809338:	8d 50 01             	lea    edx,[rax+0x1]
  80933b:	89 d0                	mov    eax,edx
  80933d:	c1 e0 02             	shl    eax,0x2
  809340:	01 d0                	add    eax,edx
  809342:	c1 e0 05             	shl    eax,0x5
  809345:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  809348:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80934b:	05 00 80 0b 00       	add    eax,0xb8000
  809350:	89 c0                	mov    eax,eax
  809352:	48 89 05 ef 0e 00 00 	mov    QWORD PTR [rip+0xeef],rax        # 80a248 <m_ptr>
            src++;
  809359:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  80935e:	e9 ac 00 00 00       	jmp    80940f <write_tty+0x13a>
        }else if(*src=='\0')
  809363:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809367:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80936a:	84 c0                	test   al,al
  80936c:	0f 84 af 00 00 00    	je     809421 <write_tty+0x14c>
            break;
        if(*src=='\b')
  809372:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809376:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809379:	3c 08                	cmp    al,0x8
  80937b:	75 1e                	jne    80939b <write_tty+0xc6>
        {
            m_ptr-=2;
  80937d:	48 8b 05 c4 0e 00 00 	mov    rax,QWORD PTR [rip+0xec4]        # 80a248 <m_ptr>
  809384:	48 83 e8 02          	sub    rax,0x2
  809388:	48 89 05 b9 0e 00 00 	mov    QWORD PTR [rip+0xeb9],rax        # 80a248 <m_ptr>
            *m_ptr=0;
  80938f:	48 8b 05 b2 0e 00 00 	mov    rax,QWORD PTR [rip+0xeb2]        # 80a248 <m_ptr>
  809396:	c6 00 00             	mov    BYTE PTR [rax],0x0
  809399:	eb 3e                	jmp    8093d9 <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  80939b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80939f:	48 8d 42 01          	lea    rax,[rdx+0x1]
  8093a3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8093a7:	48 8b 05 9a 0e 00 00 	mov    rax,QWORD PTR [rip+0xe9a]        # 80a248 <m_ptr>
  8093ae:	48 8d 48 01          	lea    rcx,[rax+0x1]
  8093b2:	48 89 0d 8f 0e 00 00 	mov    QWORD PTR [rip+0xe8f],rcx        # 80a248 <m_ptr>
  8093b9:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  8093bc:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  8093be:	48 8b 05 83 0e 00 00 	mov    rax,QWORD PTR [rip+0xe83]        # 80a248 <m_ptr>
  8093c5:	48 8d 50 01          	lea    rdx,[rax+0x1]
  8093c9:	48 89 15 78 0e 00 00 	mov    QWORD PTR [rip+0xe78],rdx        # 80a248 <m_ptr>
  8093d0:	0f b6 15 79 0e 00 00 	movzx  edx,BYTE PTR [rip+0xe79]        # 80a250 <m_color>
  8093d7:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  8093d9:	48 8b 05 68 0e 00 00 	mov    rax,QWORD PTR [rip+0xe68]        # 80a248 <m_ptr>
  8093e0:	48 8b 0d 09 7b c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc27b09]        # 430ef0 <vpage_base>
  8093e7:	48 29 c8             	sub    rax,rcx
  8093ea:	48 89 c2             	mov    rdx,rax
  8093ed:	8b 05 1d 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b1d]        # 430f10 <vpage_size>
  8093f3:	8b 0d 0b 7b c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc27b0b]        # 430f04 <line_chs>
  8093f9:	29 c8                	sub    eax,ecx
  8093fb:	01 c0                	add    eax,eax
  8093fd:	48 98                	cdqe   
  8093ff:	48 39 c2             	cmp    rdx,rax
  809402:	7c 0b                	jl     80940f <write_tty+0x13a>
  809404:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  809408:	7e 05                	jle    80940f <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  80940a:	e8 bc f8 ff ff       	call   808ccb <scrdown>
    for(int i=0;i<len;i++)
  80940f:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  809413:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809416:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  809419:	0f 8c e9 fe ff ff    	jl     809308 <write_tty+0x33>
  80941f:	eb 01                	jmp    809422 <write_tty+0x14d>
            break;
  809421:	90                   	nop
        }
    }
    set_cur();
  809422:	b8 00 00 00 00       	mov    eax,0x0
  809427:	e8 8c fd ff ff       	call   8091b8 <set_cur>
    return 0;
  80942c:	b8 00 00 00 00       	mov    eax,0x0
}
  809431:	c9                   	leave  
  809432:	c3                   	ret    

0000000000809433 <cls>:

void cls(driver_args *args)
{
  809433:	f3 0f 1e fa          	endbr64 
  809437:	55                   	push   rbp
  809438:	48 89 e5             	mov    rbp,rsp
  80943b:	48 83 ec 20          	sub    rsp,0x20
  80943f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  809443:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80944a:	eb 16                	jmp    809462 <cls+0x2f>
    {
        vpage_base[i]=0;
  80944c:	48 8b 15 9d 7a c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27a9d]        # 430ef0 <vpage_base>
  809453:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809456:	48 98                	cdqe   
  809458:	48 01 d0             	add    rax,rdx
  80945b:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  80945e:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  809462:	8b 05 a8 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27aa8]        # 430f10 <vpage_size>
  809468:	01 c0                	add    eax,eax
  80946a:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80946d:	7c dd                	jl     80944c <cls+0x19>
    }
    m_ptr=vpage_base;
  80946f:	48 8b 05 7a 7a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc27a7a]        # 430ef0 <vpage_base>
  809476:	48 89 05 cb 0d 00 00 	mov    QWORD PTR [rip+0xdcb],rax        # 80a248 <m_ptr>
    set_cur();
  80947d:	b8 00 00 00 00       	mov    eax,0x0
  809482:	e8 31 fd ff ff       	call   8091b8 <set_cur>
}
  809487:	90                   	nop
  809488:	c9                   	leave  
  809489:	c3                   	ret    

000000000080948a <set_color>:

void set_color(char color)
{
  80948a:	f3 0f 1e fa          	endbr64 
  80948e:	55                   	push   rbp
  80948f:	48 89 e5             	mov    rbp,rsp
  809492:	89 f8                	mov    eax,edi
  809494:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  809497:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80949b:	88 05 af 0d 00 00    	mov    BYTE PTR [rip+0xdaf],al        # 80a250 <m_color>
}
  8094a1:	90                   	nop
  8094a2:	5d                   	pop    rbp
  8094a3:	c3                   	ret    

00000000008094a4 <tty_do_req>:

int tty_do_req(driver_args *args)
{
  8094a4:	f3 0f 1e fa          	endbr64 
  8094a8:	55                   	push   rbp
  8094a9:	48 89 e5             	mov    rbp,rsp
  8094ac:	48 83 ec 10          	sub    rsp,0x10
  8094b0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  8094b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094b8:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  8094be:	83 f8 0d             	cmp    eax,0xd
  8094c1:	74 45                	je     809508 <tty_do_req+0x64>
  8094c3:	83 f8 0d             	cmp    eax,0xd
  8094c6:	7f 53                	jg     80951b <tty_do_req+0x77>
  8094c8:	83 f8 0c             	cmp    eax,0xc
  8094cb:	74 2d                	je     8094fa <tty_do_req+0x56>
  8094cd:	83 f8 0c             	cmp    eax,0xc
  8094d0:	7f 49                	jg     80951b <tty_do_req+0x77>
  8094d2:	83 f8 02             	cmp    eax,0x2
  8094d5:	74 07                	je     8094de <tty_do_req+0x3a>
  8094d7:	83 f8 03             	cmp    eax,0x3
  8094da:	74 10                	je     8094ec <tty_do_req+0x48>
  8094dc:	eb 3d                	jmp    80951b <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  8094de:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094e2:	48 89 c7             	mov    rdi,rax
  8094e5:	e8 58 fd ff ff       	call   809242 <read_tty>
        break;
  8094ea:	eb 36                	jmp    809522 <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  8094ec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094f0:	48 89 c7             	mov    rdi,rax
  8094f3:	e8 dd fd ff ff       	call   8092d5 <write_tty>
        break;
  8094f8:	eb 28                	jmp    809522 <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  8094fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094fe:	48 89 c7             	mov    rdi,rax
  809501:	e8 a2 fb ff ff       	call   8090a8 <seek_tty>
        break;
  809506:	eb 1a                	jmp    809522 <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  809508:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80950c:	48 89 c7             	mov    rdi,rax
  80950f:	b8 00 00 00 00       	mov    eax,0x0
  809514:	e8 bb fb ff ff       	call   8090d4 <tell_monitor>
        break;
  809519:	eb 07                	jmp    809522 <tty_do_req+0x7e>
    default:return -1;
  80951b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809520:	eb 05                	jmp    809527 <tty_do_req+0x83>
    }
    return 0;
  809522:	b8 00 00 00 00       	mov    eax,0x0
}
  809527:	c9                   	leave  
  809528:	c3                   	ret    

0000000000809529 <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  809529:	f3 0f 1e fa          	endbr64 
  80952d:	55                   	push   rbp
  80952e:	48 89 e5             	mov    rbp,rsp
  809531:	48 83 ec 10          	sub    rsp,0x10
  809535:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  809538:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80953b:	83 c0 01             	add    eax,0x1
  80953e:	0f b7 c0             	movzx  eax,ax
  809541:	be 00 00 00 00       	mov    esi,0x0
  809546:	89 c7                	mov    edi,eax
  809548:	e8 83 b5 ff ff       	call   804ad0 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80954d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809550:	83 c0 03             	add    eax,0x3
  809553:	0f b7 c0             	movzx  eax,ax
  809556:	be 80 00 00 00       	mov    esi,0x80
  80955b:	89 c7                	mov    edi,eax
  80955d:	e8 6e b5 ff ff       	call   804ad0 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  809562:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809565:	0f b7 c0             	movzx  eax,ax
  809568:	be 03 00 00 00       	mov    esi,0x3
  80956d:	89 c7                	mov    edi,eax
  80956f:	e8 5c b5 ff ff       	call   804ad0 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  809574:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809577:	83 c0 01             	add    eax,0x1
  80957a:	0f b7 c0             	movzx  eax,ax
  80957d:	be 00 00 00 00       	mov    esi,0x0
  809582:	89 c7                	mov    edi,eax
  809584:	e8 47 b5 ff ff       	call   804ad0 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  809589:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80958c:	83 c0 03             	add    eax,0x3
  80958f:	0f b7 c0             	movzx  eax,ax
  809592:	be 03 00 00 00       	mov    esi,0x3
  809597:	89 c7                	mov    edi,eax
  809599:	e8 32 b5 ff ff       	call   804ad0 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  80959e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8095a1:	83 c0 02             	add    eax,0x2
  8095a4:	0f b7 c0             	movzx  eax,ax
  8095a7:	be c7 00 00 00       	mov    esi,0xc7
  8095ac:	89 c7                	mov    edi,eax
  8095ae:	e8 1d b5 ff ff       	call   804ad0 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  8095b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8095b6:	83 c0 04             	add    eax,0x4
  8095b9:	0f b7 c0             	movzx  eax,ax
  8095bc:	be 0b 00 00 00       	mov    esi,0xb
  8095c1:	89 c7                	mov    edi,eax
  8095c3:	e8 08 b5 ff ff       	call   804ad0 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  8095c8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8095cb:	83 c0 04             	add    eax,0x4
  8095ce:	0f b7 c0             	movzx  eax,ax
  8095d1:	be 1e 00 00 00       	mov    esi,0x1e
  8095d6:	89 c7                	mov    edi,eax
  8095d8:	e8 f3 b4 ff ff       	call   804ad0 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  8095dd:	b8 61 00 00 00       	mov    eax,0x61
  8095e2:	0f b6 d0             	movzx  edx,al
  8095e5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8095e8:	0f b7 c0             	movzx  eax,ax
  8095eb:	89 d6                	mov    esi,edx
  8095ed:	89 c7                	mov    edi,eax
  8095ef:	e8 dc b4 ff ff       	call   804ad0 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  8095f4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8095f7:	0f b6 c0             	movzx  eax,al
  8095fa:	89 c7                	mov    edi,eax
  8095fc:	e8 e8 b4 ff ff       	call   804ae9 <inb>
  809601:	0f b6 d0             	movzx  edx,al
  809604:	b8 61 00 00 00       	mov    eax,0x61
  809609:	0f be c0             	movsx  eax,al
  80960c:	39 c2                	cmp    edx,eax
  80960e:	75 17                	jne    809627 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  809610:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809613:	83 c0 04             	add    eax,0x4
  809616:	0f b7 c0             	movzx  eax,ax
  809619:	be 0f 00 00 00       	mov    esi,0xf
  80961e:	89 c7                	mov    edi,eax
  809620:	e8 ab b4 ff ff       	call   804ad0 <outb>
  809625:	eb 01                	jmp    809628 <init_com+0xff>
        return;
  809627:	90                   	nop
}
  809628:	c9                   	leave  
  809629:	c3                   	ret    

000000000080962a <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80962a:	f3 0f 1e fa          	endbr64 
  80962e:	55                   	push   rbp
  80962f:	48 89 e5             	mov    rbp,rsp
  809632:	48 83 ec 20          	sub    rsp,0x20
  809636:	89 f8                	mov    eax,edi
  809638:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80963b:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80963f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809642:	83 c0 05             	add    eax,0x5
  809645:	0f b6 c0             	movzx  eax,al
  809648:	89 c7                	mov    edi,eax
  80964a:	e8 9a b4 ff ff       	call   804ae9 <inb>
  80964f:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  809652:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  809656:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80965a:	74 e3                	je     80963f <com_putchar+0x15>
    outb(com_base, ch);
  80965c:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  809660:	0f b6 d0             	movzx  edx,al
  809663:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809666:	0f b7 c0             	movzx  eax,ax
  809669:	89 d6                	mov    esi,edx
  80966b:	89 c7                	mov    edi,eax
  80966d:	e8 5e b4 ff ff       	call   804ad0 <outb>
}
  809672:	90                   	nop
  809673:	c9                   	leave  
  809674:	c3                   	ret    

0000000000809675 <com_puts>:

void com_puts(char* s,int com_port){
  809675:	f3 0f 1e fa          	endbr64 
  809679:	55                   	push   rbp
  80967a:	48 89 e5             	mov    rbp,rsp
  80967d:	48 83 ec 10          	sub    rsp,0x10
  809681:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809685:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  809688:	eb 1d                	jmp    8096a7 <com_puts+0x32>
        com_putchar(*s,com_port);
  80968a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80968e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809691:	66 98                	cbw    
  809693:	0f b7 c0             	movzx  eax,ax
  809696:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  809699:	89 d6                	mov    esi,edx
  80969b:	89 c7                	mov    edi,eax
  80969d:	e8 88 ff ff ff       	call   80962a <com_putchar>
    for(;*s;s++){
  8096a2:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  8096a7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8096ab:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8096ae:	84 c0                	test   al,al
  8096b0:	75 d8                	jne    80968a <com_puts+0x15>
    }
  8096b2:	90                   	nop
  8096b3:	90                   	nop
  8096b4:	c9                   	leave  
  8096b5:	c3                   	ret    

00000000008096b6 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  8096b6:	f3 0f 1e fa          	endbr64 
  8096ba:	55                   	push   rbp
  8096bb:	48 89 e5             	mov    rbp,rsp
  8096be:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8096c2:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8096c6:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  8096c9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8096cd:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  8096d0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8096d7:	eb 1b                	jmp    8096f4 <memcpy+0x3e>
        *(dest)=*(src);
  8096d9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8096dd:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8096e0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8096e4:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  8096e6:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  8096eb:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  8096f0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8096f4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8096f7:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  8096fa:	77 dd                	ja     8096d9 <memcpy+0x23>
    }
}
  8096fc:	90                   	nop
  8096fd:	90                   	nop
  8096fe:	5d                   	pop    rbp
  8096ff:	c3                   	ret    

0000000000809700 <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  809700:	f3 0f 1e fa          	endbr64 
  809704:	55                   	push   rbp
  809705:	48 89 e5             	mov    rbp,rsp
  809708:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80970c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809710:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  809713:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80971a:	eb 3a                	jmp    809756 <memcmp+0x56>
    {
        if(*a!=*b)
  80971c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809720:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809723:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809727:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80972a:	38 c2                	cmp    dl,al
  80972c:	74 1a                	je     809748 <memcmp+0x48>
            return *a-*b;
  80972e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809732:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809735:	0f b6 d0             	movzx  edx,al
  809738:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80973c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80973f:	0f b6 c8             	movzx  ecx,al
  809742:	89 d0                	mov    eax,edx
  809744:	29 c8                	sub    eax,ecx
  809746:	eb 1b                	jmp    809763 <memcmp+0x63>
        a++;
  809748:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80974d:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  809752:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809756:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809759:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80975c:	7c be                	jl     80971c <memcmp+0x1c>
    }
    return 0;
  80975e:	b8 00 00 00 00       	mov    eax,0x0
}
  809763:	5d                   	pop    rbp
  809764:	c3                   	ret    

0000000000809765 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  809765:	f3 0f 1e fa          	endbr64 
  809769:	55                   	push   rbp
  80976a:	48 89 e5             	mov    rbp,rsp
  80976d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809771:	89 f0                	mov    eax,esi
  809773:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  809776:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  809779:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809780:	eb 16                	jmp    809798 <memset+0x33>
        *(buf++)=value;
  809782:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809786:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80978a:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80978e:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  809792:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  809794:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809798:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80979b:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80979e:	72 e2                	jb     809782 <memset+0x1d>
    }
}
  8097a0:	90                   	nop
  8097a1:	90                   	nop
  8097a2:	5d                   	pop    rbp
  8097a3:	c3                   	ret    

00000000008097a4 <get_mem_size>:

u32 get_mem_size(){
  8097a4:	f3 0f 1e fa          	endbr64 
  8097a8:	55                   	push   rbp
  8097a9:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  8097ac:	8b 05 72 77 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27772]        # 430f24 <mem_end>
}
  8097b2:	5d                   	pop    rbp
  8097b3:	c3                   	ret    

00000000008097b4 <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  8097b4:	f3 0f 1e fa          	endbr64 
  8097b8:	55                   	push   rbp
  8097b9:	48 89 e5             	mov    rbp,rsp
  8097bc:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8097c0:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  8097c4:	eb 1d                	jmp    8097e3 <strcpy+0x2f>
        *(dest++)=*(buf++);
  8097c6:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8097ca:	48 8d 42 01          	lea    rax,[rdx+0x1]
  8097ce:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8097d2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097d6:	48 8d 48 01          	lea    rcx,[rax+0x1]
  8097da:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  8097de:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  8097e1:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  8097e3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8097e7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8097ea:	84 c0                	test   al,al
  8097ec:	75 d8                	jne    8097c6 <strcpy+0x12>
    }
    *dest='\0';
  8097ee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097f2:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  8097f5:	90                   	nop
  8097f6:	5d                   	pop    rbp
  8097f7:	c3                   	ret    

00000000008097f8 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  8097f8:	f3 0f 1e fa          	endbr64 
  8097fc:	55                   	push   rbp
  8097fd:	48 89 e5             	mov    rbp,rsp
  809800:	48 83 ec 30          	sub    rsp,0x30
  809804:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  809808:	89 f0                	mov    eax,esi
  80980a:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80980d:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  809812:	0f 84 9c 00 00 00    	je     8098b4 <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  809818:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80981c:	48 89 c6             	mov    rsi,rax
  80981f:	bf 40 0f 43 00       	mov    edi,0x430f40
  809824:	e8 8b ff ff ff       	call   8097b4 <strcpy>
        char* ptr=strtokkee;
  809829:	48 c7 45 e8 40 0f 43 	mov    QWORD PTR [rbp-0x18],0x430f40
  809830:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  809831:	c7 05 05 79 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc27905],0x0        # 431140 <tokptr>
  809838:	00 00 00 
  80983b:	eb 1c                	jmp    809859 <strtok+0x61>
  80983d:	8b 05 fd 78 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc278fd]        # 431140 <tokptr>
  809843:	83 c0 01             	add    eax,0x1
  809846:	99                   	cdq    
  809847:	c1 ea 17             	shr    edx,0x17
  80984a:	01 d0                	add    eax,edx
  80984c:	25 ff 01 00 00       	and    eax,0x1ff
  809851:	29 d0                	sub    eax,edx
  809853:	89 05 e7 78 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc278e7],eax        # 431140 <tokptr>
  809859:	8b 05 e1 78 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc278e1]        # 431140 <tokptr>
  80985f:	48 98                	cdqe   
  809861:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  809868:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80986b:	74 13                	je     809880 <strtok+0x88>
  80986d:	8b 05 cd 78 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc278cd]        # 431140 <tokptr>
  809873:	48 98                	cdqe   
  809875:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  80987c:	84 c0                	test   al,al
  80987e:	75 bd                	jne    80983d <strtok+0x45>
        strtokkee[tokptr]='\0';
  809880:	8b 05 ba 78 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc278ba]        # 431140 <tokptr>
  809886:	48 98                	cdqe   
  809888:	c6 80 40 0f 43 00 00 	mov    BYTE PTR [rax+0x430f40],0x0
        tokptr=(tokptr+1)%512;
  80988f:	8b 05 ab 78 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc278ab]        # 431140 <tokptr>
  809895:	83 c0 01             	add    eax,0x1
  809898:	99                   	cdq    
  809899:	c1 ea 17             	shr    edx,0x17
  80989c:	01 d0                	add    eax,edx
  80989e:	25 ff 01 00 00       	and    eax,0x1ff
  8098a3:	29 d0                	sub    eax,edx
  8098a5:	89 05 95 78 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27895],eax        # 431140 <tokptr>
        return ptr;
  8098ab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8098af:	e9 9e 00 00 00       	jmp    809952 <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  8098b4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  8098bb:	8b 05 7f 78 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2787f]        # 431140 <tokptr>
  8098c1:	48 98                	cdqe   
  8098c3:	48 05 40 0f 43 00    	add    rax,0x430f40
  8098c9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  8098cd:	eb 20                	jmp    8098ef <strtok+0xf7>
  8098cf:	8b 05 6b 78 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2786b]        # 431140 <tokptr>
  8098d5:	83 c0 01             	add    eax,0x1
  8098d8:	99                   	cdq    
  8098d9:	c1 ea 17             	shr    edx,0x17
  8098dc:	01 d0                	add    eax,edx
  8098de:	25 ff 01 00 00       	and    eax,0x1ff
  8098e3:	29 d0                	sub    eax,edx
  8098e5:	89 05 55 78 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27855],eax        # 431140 <tokptr>
  8098eb:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8098ef:	8b 05 4b 78 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2784b]        # 431140 <tokptr>
  8098f5:	48 98                	cdqe   
  8098f7:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  8098fe:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  809901:	74 13                	je     809916 <strtok+0x11e>
  809903:	8b 05 37 78 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27837]        # 431140 <tokptr>
  809909:	48 98                	cdqe   
  80990b:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  809912:	84 c0                	test   al,al
  809914:	75 b9                	jne    8098cf <strtok+0xd7>
    strtokkee[tokptr]='\0';
  809916:	8b 05 24 78 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27824]        # 431140 <tokptr>
  80991c:	48 98                	cdqe   
  80991e:	c6 80 40 0f 43 00 00 	mov    BYTE PTR [rax+0x430f40],0x0
    tokptr=(tokptr+1)%512;
  809925:	8b 05 15 78 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27815]        # 431140 <tokptr>
  80992b:	83 c0 01             	add    eax,0x1
  80992e:	99                   	cdq    
  80992f:	c1 ea 17             	shr    edx,0x17
  809932:	01 d0                	add    eax,edx
  809934:	25 ff 01 00 00       	and    eax,0x1ff
  809939:	29 d0                	sub    eax,edx
  80993b:	89 05 ff 77 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc277ff],eax        # 431140 <tokptr>
    if(c)
  809941:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809945:	74 06                	je     80994d <strtok+0x155>
        return ptr;
  809947:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80994b:	eb 05                	jmp    809952 <strtok+0x15a>
    else
        return (void*)0;
  80994d:	b8 00 00 00 00       	mov    eax,0x0
}
  809952:	c9                   	leave  
  809953:	c3                   	ret    

0000000000809954 <strcmp>:
int strcmp(char *s1,char *s2)
{
  809954:	f3 0f 1e fa          	endbr64 
  809958:	55                   	push   rbp
  809959:	48 89 e5             	mov    rbp,rsp
  80995c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809960:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  809964:	eb 3c                	jmp    8099a2 <strcmp+0x4e>
		if(*s1>*s2)
  809966:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80996a:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80996d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809971:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809974:	38 c2                	cmp    dl,al
  809976:	7e 07                	jle    80997f <strcmp+0x2b>
			return 1;
  809978:	b8 01 00 00 00       	mov    eax,0x1
  80997d:	eb 52                	jmp    8099d1 <strcmp+0x7d>
		else if(*s1<*s2)
  80997f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809983:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809986:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80998a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80998d:	38 c2                	cmp    dl,al
  80998f:	7d 07                	jge    809998 <strcmp+0x44>
			return -1;
  809991:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809996:	eb 39                	jmp    8099d1 <strcmp+0x7d>
		s1++;
  809998:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80999d:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  8099a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8099a6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099a9:	84 c0                	test   al,al
  8099ab:	74 0b                	je     8099b8 <strcmp+0x64>
  8099ad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8099b1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099b4:	84 c0                	test   al,al
  8099b6:	75 ae                	jne    809966 <strcmp+0x12>
	}
	if(*s1==*s2)
  8099b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8099bc:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8099bf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8099c3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099c6:	38 c2                	cmp    dl,al
  8099c8:	75 07                	jne    8099d1 <strcmp+0x7d>
		return 0;
  8099ca:	b8 00 00 00 00       	mov    eax,0x0
  8099cf:	eb 00                	jmp    8099d1 <strcmp+0x7d>
}
  8099d1:	5d                   	pop    rbp
  8099d2:	c3                   	ret    

00000000008099d3 <strlen>:

int strlen(char *str)
{
  8099d3:	f3 0f 1e fa          	endbr64 
  8099d7:	55                   	push   rbp
  8099d8:	48 89 e5             	mov    rbp,rsp
  8099db:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  8099df:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  8099e6:	eb 09                	jmp    8099f1 <strlen+0x1e>
  8099e8:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  8099ed:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8099f1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8099f5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099f8:	84 c0                	test   al,al
  8099fa:	75 ec                	jne    8099e8 <strlen+0x15>
    return l;
  8099fc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8099ff:	5d                   	pop    rbp
  809a00:	c3                   	ret    

0000000000809a01 <sprintf>:

void sprintf(char *dist, char *str,...)
{
  809a01:	f3 0f 1e fa          	endbr64 
  809a05:	55                   	push   rbp
  809a06:	48 89 e5             	mov    rbp,rsp
  809a09:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  809a10:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  809a17:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  809a1e:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  809a25:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  809a2c:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  809a33:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  809a3a:	84 c0                	test   al,al
  809a3c:	74 20                	je     809a5e <sprintf+0x5d>
  809a3e:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  809a42:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  809a46:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  809a4a:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  809a4e:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  809a52:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  809a56:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  809a5a:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  809a5e:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809a65:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  809a6c:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809a73:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  809a7a:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  809a81:	00 00 00 
    while (*pstr!='\n')
  809a84:	eb 39                	jmp    809abf <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  809a86:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809a8d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a90:	3c 25                	cmp    al,0x25
  809a92:	75 15                	jne    809aa9 <sprintf+0xa8>
  809a94:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  809a9b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a9e:	3c 25                	cmp    al,0x25
  809aa0:	74 07                	je     809aa9 <sprintf+0xa8>
            argnum++;
  809aa2:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  809aa9:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809ab0:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  809ab7:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  809abe:	01 
    while (*pstr!='\n')
  809abf:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809ac6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ac9:	3c 0a                	cmp    al,0xa
  809acb:	75 b9                	jne    809a86 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  809acd:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  809ad4:	00 00 00 
  809ad7:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  809ade:	00 00 00 
  809ae1:	48 8d 45 10          	lea    rax,[rbp+0x10]
  809ae5:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  809aec:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  809af3:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  809afa:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809b01:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  809b08:	e9 e2 01 00 00       	jmp    809cef <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  809b0d:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809b14:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b17:	3c 25                	cmp    al,0x25
  809b19:	0f 85 aa 01 00 00    	jne    809cc9 <sprintf+0x2c8>
  809b1f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809b26:	48 83 c0 01          	add    rax,0x1
  809b2a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b2d:	84 c0                	test   al,al
  809b2f:	0f 84 94 01 00 00    	je     809cc9 <sprintf+0x2c8>
            pstr++;
  809b35:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  809b3c:	01 
            if(*pstr=='x'){
  809b3d:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809b44:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b47:	3c 78                	cmp    al,0x78
  809b49:	75 64                	jne    809baf <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  809b4b:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809b51:	83 f8 2f             	cmp    eax,0x2f
  809b54:	77 23                	ja     809b79 <sprintf+0x178>
  809b56:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809b5d:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809b63:	89 d2                	mov    edx,edx
  809b65:	48 01 d0             	add    rax,rdx
  809b68:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809b6e:	83 c2 08             	add    edx,0x8
  809b71:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809b77:	eb 12                	jmp    809b8b <sprintf+0x18a>
  809b79:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809b80:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809b84:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809b8b:	8b 00                	mov    eax,DWORD PTR [rax]
  809b8d:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  809b93:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  809b99:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809ba0:	89 d6                	mov    esi,edx
  809ba2:	48 89 c7             	mov    rdi,rax
  809ba5:	e8 4e 02 00 00       	call   809df8 <sprint_hex>
            if(*pstr=='x'){
  809baa:	e9 38 01 00 00       	jmp    809ce7 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  809baf:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809bb6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809bb9:	3c 73                	cmp    al,0x73
  809bbb:	75 68                	jne    809c25 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  809bbd:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809bc3:	83 f8 2f             	cmp    eax,0x2f
  809bc6:	77 23                	ja     809beb <sprintf+0x1ea>
  809bc8:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809bcf:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809bd5:	89 d2                	mov    edx,edx
  809bd7:	48 01 d0             	add    rax,rdx
  809bda:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809be0:	83 c2 08             	add    edx,0x8
  809be3:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809be9:	eb 12                	jmp    809bfd <sprintf+0x1fc>
  809beb:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809bf2:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809bf6:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809bfd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809c00:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  809c07:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  809c0e:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809c15:	48 89 d6             	mov    rsi,rdx
  809c18:	48 89 c7             	mov    rdi,rax
  809c1b:	e8 5a 02 00 00       	call   809e7a <sprintn>
            if(*pstr=='x'){
  809c20:	e9 c2 00 00 00       	jmp    809ce7 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  809c25:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809c2c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c2f:	3c 64                	cmp    al,0x64
  809c31:	75 66                	jne    809c99 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  809c33:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809c39:	83 f8 2f             	cmp    eax,0x2f
  809c3c:	77 23                	ja     809c61 <sprintf+0x260>
  809c3e:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809c45:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809c4b:	89 d2                	mov    edx,edx
  809c4d:	48 01 d0             	add    rax,rdx
  809c50:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809c56:	83 c2 08             	add    edx,0x8
  809c59:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809c5f:	eb 12                	jmp    809c73 <sprintf+0x272>
  809c61:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809c68:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809c6c:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809c73:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809c76:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  809c7d:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  809c84:	89 c2                	mov    edx,eax
  809c86:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809c8d:	89 d6                	mov    esi,edx
  809c8f:	48 89 c7             	mov    rdi,rax
  809c92:	e8 ad 00 00 00       	call   809d44 <sprint_decimal>
            if(*pstr=='x'){
  809c97:	eb 4e                	jmp    809ce7 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  809c99:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809ca0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ca3:	3c 63                	cmp    al,0x63
  809ca5:	75 02                	jne    809ca9 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  809ca7:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  809ca9:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809cb0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809cb3:	0f be d0             	movsx  edx,al
  809cb6:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809cbd:	89 d6                	mov    esi,edx
  809cbf:	48 89 c7             	mov    rdi,rax
  809cc2:	e8 3e 00 00 00       	call   809d05 <sprintchar>
            if(*pstr=='x'){
  809cc7:	eb 1e                	jmp    809ce7 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  809cc9:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809cd0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809cd3:	0f be d0             	movsx  edx,al
  809cd6:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809cdd:	89 d6                	mov    esi,edx
  809cdf:	48 89 c7             	mov    rdi,rax
  809ce2:	e8 1e 00 00 00       	call   809d05 <sprintchar>
    for(;*pstr!='\0';pstr++){
  809ce7:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  809cee:	01 
  809cef:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809cf6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809cf9:	84 c0                	test   al,al
  809cfb:	0f 85 0c fe ff ff    	jne    809b0d <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  809d01:	90                   	nop
  809d02:	90                   	nop
  809d03:	c9                   	leave  
  809d04:	c3                   	ret    

0000000000809d05 <sprintchar>:
void sprintchar(char *dist,char c)
{
  809d05:	f3 0f 1e fa          	endbr64 
  809d09:	55                   	push   rbp
  809d0a:	48 89 e5             	mov    rbp,rsp
  809d0d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809d11:	89 f0                	mov    eax,esi
  809d13:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  809d16:	eb 05                	jmp    809d1d <sprintchar+0x18>
        dist++;
  809d18:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  809d1d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d21:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d24:	84 c0                	test   al,al
  809d26:	75 f0                	jne    809d18 <sprintchar+0x13>
    *dist++=c;
  809d28:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d2c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809d30:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809d34:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  809d38:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  809d3a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d3e:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  809d41:	90                   	nop
  809d42:	5d                   	pop    rbp
  809d43:	c3                   	ret    

0000000000809d44 <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  809d44:	f3 0f 1e fa          	endbr64 
  809d48:	55                   	push   rbp
  809d49:	48 89 e5             	mov    rbp,rsp
  809d4c:	48 83 ec 30          	sub    rsp,0x30
  809d50:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  809d54:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  809d57:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  809d5e:	eb 65                	jmp    809dc5 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  809d60:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  809d63:	48 63 c2             	movsxd rax,edx
  809d66:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  809d6d:	48 c1 e8 20          	shr    rax,0x20
  809d71:	c1 f8 02             	sar    eax,0x2
  809d74:	89 d6                	mov    esi,edx
  809d76:	c1 fe 1f             	sar    esi,0x1f
  809d79:	29 f0                	sub    eax,esi
  809d7b:	89 c1                	mov    ecx,eax
  809d7d:	89 c8                	mov    eax,ecx
  809d7f:	c1 e0 02             	shl    eax,0x2
  809d82:	01 c8                	add    eax,ecx
  809d84:	01 c0                	add    eax,eax
  809d86:	89 d1                	mov    ecx,edx
  809d88:	29 c1                	sub    ecx,eax
  809d8a:	89 c8                	mov    eax,ecx
  809d8c:	83 c0 30             	add    eax,0x30
  809d8f:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  809d92:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809d95:	8d 50 01             	lea    edx,[rax+0x1]
  809d98:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  809d9b:	48 98                	cdqe   
  809d9d:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  809da1:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  809da5:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  809da8:	48 63 d0             	movsxd rdx,eax
  809dab:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  809db2:	48 c1 ea 20          	shr    rdx,0x20
  809db6:	c1 fa 02             	sar    edx,0x2
  809db9:	c1 f8 1f             	sar    eax,0x1f
  809dbc:	89 c1                	mov    ecx,eax
  809dbe:	89 d0                	mov    eax,edx
  809dc0:	29 c8                	sub    eax,ecx
  809dc2:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  809dc5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809dc8:	83 f8 0f             	cmp    eax,0xf
  809dcb:	76 93                	jbe    809d60 <sprint_decimal+0x1c>
    }
    while(p>0)
  809dcd:	eb 1f                	jmp    809dee <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  809dcf:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  809dd3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809dd6:	48 98                	cdqe   
  809dd8:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  809ddd:	0f be d0             	movsx  edx,al
  809de0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809de4:	89 d6                	mov    esi,edx
  809de6:	48 89 c7             	mov    rdi,rax
  809de9:	e8 17 ff ff ff       	call   809d05 <sprintchar>
    while(p>0)
  809dee:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809df2:	7f db                	jg     809dcf <sprint_decimal+0x8b>
    }
}
  809df4:	90                   	nop
  809df5:	90                   	nop
  809df6:	c9                   	leave  
  809df7:	c3                   	ret    

0000000000809df8 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  809df8:	f3 0f 1e fa          	endbr64 
  809dfc:	55                   	push   rbp
  809dfd:	48 89 e5             	mov    rbp,rsp
  809e00:	48 83 ec 20          	sub    rsp,0x20
  809e04:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809e08:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  809e0b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  809e12:	eb 35                	jmp    809e49 <sprint_hex+0x51>
        unsigned char a=c%16;
  809e14:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809e17:	83 e0 0f             	and    eax,0xf
  809e1a:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  809e1d:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  809e21:	76 06                	jbe    809e29 <sprint_hex+0x31>
  809e23:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  809e27:	eb 04                	jmp    809e2d <sprint_hex+0x35>
        else a+='0';
  809e29:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  809e2d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809e30:	8d 50 01             	lea    edx,[rax+0x1]
  809e33:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  809e36:	48 98                	cdqe   
  809e38:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  809e3c:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  809e40:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809e43:	c1 e8 04             	shr    eax,0x4
  809e46:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  809e49:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  809e4d:	7e c5                	jle    809e14 <sprint_hex+0x1c>
    }
    while(p>0)
  809e4f:	eb 1f                	jmp    809e70 <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  809e51:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  809e55:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809e58:	48 98                	cdqe   
  809e5a:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  809e5f:	0f be d0             	movsx  edx,al
  809e62:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809e66:	89 d6                	mov    esi,edx
  809e68:	48 89 c7             	mov    rdi,rax
  809e6b:	e8 95 fe ff ff       	call   809d05 <sprintchar>
    while(p>0)
  809e70:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809e74:	7f db                	jg     809e51 <sprint_hex+0x59>
    }
}
  809e76:	90                   	nop
  809e77:	90                   	nop
  809e78:	c9                   	leave  
  809e79:	c3                   	ret    

0000000000809e7a <sprintn>:
void sprintn(char *dist,char *str)
{
  809e7a:	f3 0f 1e fa          	endbr64 
  809e7e:	55                   	push   rbp
  809e7f:	48 89 e5             	mov    rbp,rsp
  809e82:	48 83 ec 10          	sub    rsp,0x10
  809e86:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809e8a:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  809e8e:	eb 20                	jmp    809eb0 <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  809e90:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809e94:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809e98:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  809e9c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e9f:	0f be d0             	movsx  edx,al
  809ea2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809ea6:	89 d6                	mov    esi,edx
  809ea8:	48 89 c7             	mov    rdi,rax
  809eab:	e8 55 fe ff ff       	call   809d05 <sprintchar>
    while(*str!='\0')
  809eb0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809eb4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809eb7:	84 c0                	test   al,al
  809eb9:	75 d5                	jne    809e90 <sprintn+0x16>
    }
  809ebb:	90                   	nop
  809ebc:	90                   	nop
  809ebd:	c9                   	leave  
  809ebe:	c3                   	ret    
  809ebf:	90                   	nop

0000000000809ec0 <create_zero>:
  809ec0:	e8 28 9c ff ff       	call   803aed <req_proc>
  809ec5:	83 f8 ff             	cmp    eax,0xffffffff
  809ec8:	74 0c                	je     809ed6 <create_zero.retu>
  809eca:	e8 ea 9c ff ff       	call   803bb9 <set_proc>
  809ecf:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  809ed3:	83 c4 40             	add    esp,0x40

0000000000809ed6 <create_zero.retu>:
  809ed6:	c3                   	ret    

0000000000809ed7 <fill_desc>:
  809ed7:	55                   	push   rbp
  809ed8:	48 89 e5             	mov    rbp,rsp
  809edb:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  809edf:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  809ee3:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  809ee7:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  809eeb:	be 2a a0 80 00       	mov    esi,0x80a02a
  809ef0:	c7 04 25 2a a0 80 00 	mov    DWORD PTR ds:0x80a02a,0x0
  809ef7:	00 00 00 00 
  809efb:	c7 04 25 2e a0 80 00 	mov    DWORD PTR ds:0x80a02e,0x0
  809f02:	00 00 00 00 
  809f06:	66 67 89 0e          	mov    WORD PTR [esi],cx
  809f0a:	c1 e9 10             	shr    ecx,0x10
  809f0d:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  809f12:	c1 ea 10             	shr    edx,0x10
  809f15:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  809f19:	66 c1 ea 08          	shr    dx,0x8
  809f1d:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  809f21:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  809f26:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  809f2a:	c1 e1 08             	shl    ecx,0x8
  809f2d:	09 cf                	or     edi,ecx
  809f2f:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  809f33:	8b 14 25 2a a0 80 00 	mov    edx,DWORD PTR ds:0x80a02a
  809f3a:	67 89 10             	mov    DWORD PTR [eax],edx
  809f3d:	8b 14 25 2e a0 80 00 	mov    edx,DWORD PTR ds:0x80a02e
  809f44:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  809f48:	c9                   	leave  
  809f49:	c3                   	ret    

0000000000809f4a <switch_proc_asm>:
  809f4a:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  809f50:	66 89 04 25 68 9f 80 	mov    WORD PTR ds:0x809f68,ax
  809f57:	00 
  809f58:	c7 04 25 64 9f 80 00 	mov    DWORD PTR ds:0x809f64,0x0
  809f5f:	00 00 00 00 

0000000000809f63 <switch_proc_asm.ljmp>:
  809f63:	ea                   	(bad)  
  809f64:	00 00                	add    BYTE PTR [rax],al
  809f66:	00 00                	add    BYTE PTR [rax],al
  809f68:	00 00                	add    BYTE PTR [rax],al
  809f6a:	c3                   	ret    

0000000000809f6b <switch_to>:
  809f6b:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  809f70:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  809f74:	bf dc 9f 80 00       	mov    edi,0x809fdc
  809f79:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  809f7d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  809f81:	89 c1                	mov    ecx,eax
  809f83:	83 e9 04             	sub    ecx,0x4
  809f86:	67 89 19             	mov    DWORD PTR [ecx],ebx
  809f89:	50                   	push   rax
  809f8a:	89 f5                	mov    ebp,esi
  809f8c:	83 c5 28             	add    ebp,0x28
  809f8f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809f93:	50                   	push   rax
  809f94:	83 c5 04             	add    ebp,0x4
  809f97:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809f9b:	50                   	push   rax
  809f9c:	83 c5 04             	add    ebp,0x4
  809f9f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809fa3:	50                   	push   rax
  809fa4:	83 c5 04             	add    ebp,0x4
  809fa7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809fab:	50                   	push   rax
  809fac:	83 c5 04             	add    ebp,0x4
  809faf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809fb3:	50                   	push   rax
  809fb4:	83 c5 04             	add    ebp,0x4
  809fb7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809fbb:	50                   	push   rax
  809fbc:	83 c5 04             	add    ebp,0x4
  809fbf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809fc3:	50                   	push   rax
  809fc4:	83 c5 04             	add    ebp,0x4
  809fc7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809fcb:	50                   	push   rax
  809fcc:	83 c5 04             	add    ebp,0x4
  809fcf:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  809fd3:	0f 22 d8             	mov    cr3,rax
  809fd6:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  809fda:	50                   	push   rax
  809fdb:	5c                   	pop    rsp

0000000000809fdc <switch_to.leap>:
  809fdc:	ea                   	(bad)  
  809fdd:	00 00                	add    BYTE PTR [rax],al
  809fdf:	00 00                	add    BYTE PTR [rax],al
  809fe1:	08 00                	or     BYTE PTR [rax],al

0000000000809fe3 <save_context>:
  809fe3:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  809fe8:	83 c0 44             	add    eax,0x44
  809feb:	b9 08 00 00 00       	mov    ecx,0x8
  809ff0:	89 e7                	mov    edi,esp

0000000000809ff2 <save_context.loops>:
  809ff2:	67 8b 17             	mov    edx,DWORD PTR [edi]
  809ff5:	67 89 10             	mov    DWORD PTR [eax],edx
  809ff8:	83 c7 04             	add    edi,0x4
  809ffb:	83 e8 04             	sub    eax,0x4
  809ffe:	e2 f2                	loop   809ff2 <save_context.loops>
  80a000:	5b                   	pop    rbx
  80a001:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80a006:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80a00a:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80a00f:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80a013:	c3                   	ret    

000000000080a014 <move_to_user_mode>:
  80a014:	66 b8 20 00          	mov    ax,0x20
  80a018:	8e d8                	mov    ds,eax
  80a01a:	8e c0                	mov    es,eax
  80a01c:	8e e8                	mov    gs,eax
  80a01e:	6a 20                	push   0x20
  80a020:	54                   	push   rsp
  80a021:	6a 18                	push   0x18
  80a023:	68 29 a0 80 00       	push   0x80a029
  80a028:	cf                   	iret   

000000000080a029 <move_to_user_mode.done>:
  80a029:	c3                   	ret    

000000000080a02a <desc>:
	...
