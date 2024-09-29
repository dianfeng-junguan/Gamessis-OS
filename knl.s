
bin/gmsknl.elf:     file format elf64-x86-64


Disassembly of section .entry:

0000000000100000 <init32>:
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
  800194:	b8 2f 12 80 00       	mov    eax,0x80122f
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
	set_gate(0x21,(addr_t)key_proc,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);
  800217:	b8 18 5d 80 00       	mov    eax,0x805d18
  80021c:	b9 00 8f 00 00       	mov    ecx,0x8f00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 d9 00 00 00       	call   80030c <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 f0 4b 80 00       	mov    eax,0x804bf0
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 bd 00 00 00       	call   80030c <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 e0 6b 80 00       	mov    eax,0x806be0
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 a1 00 00 00       	call   80030c <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|TRAP_GATE);//
  80026b:	b8 b0 55 80 00       	mov    eax,0x8055b0
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
  800291:	e8 6a 46 00 00       	call   804900 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 5b 46 00 00       	call   804900 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 4c 46 00 00       	call   804900 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 3d 46 00 00       	call   804900 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 2e 46 00 00       	call   804900 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 1f 46 00 00       	call   804900 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 10 46 00 00       	call   804900 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 01 46 00 00       	call   804900 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 42 46 00 00       	call   80494b <turn_on_int>

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
  800327:	48 8b 15 12 9a 00 00 	mov    rdx,QWORD PTR [rip+0x9a12]        # 809d40 <idt>
  80032e:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800332:	48 c1 e0 04          	shl    rax,0x4
  800336:	48 01 d0             	add    rax,rdx
  800339:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80033d:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800340:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800344:	48 c1 e8 10          	shr    rax,0x10
  800348:	48 89 c2             	mov    rdx,rax
  80034b:	48 8b 0d ee 99 00 00 	mov    rcx,QWORD PTR [rip+0x99ee]        # 809d40 <idt>
  800352:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800356:	48 c1 e0 04          	shl    rax,0x4
  80035a:	48 01 c8             	add    rax,rcx
  80035d:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  800361:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800365:	48 c1 e8 20          	shr    rax,0x20
  800369:	89 c1                	mov    ecx,eax
  80036b:	48 8b 15 ce 99 00 00 	mov    rdx,QWORD PTR [rip+0x99ce]        # 809d40 <idt>
  800372:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800376:	48 c1 e0 04          	shl    rax,0x4
  80037a:	48 01 c2             	add    rdx,rax
  80037d:	0f b7 c1             	movzx  eax,cx
  800380:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr;
  800383:	48 8b 15 b6 99 00 00 	mov    rdx,QWORD PTR [rip+0x99b6]        # 809d40 <idt>
  80038a:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80038e:	48 c1 e0 04          	shl    rax,0x4
  800392:	48 01 c2             	add    rdx,rax
  800395:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  800399:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
    idt[index].selector=selector;
  80039d:	48 8b 15 9c 99 00 00 	mov    rdx,QWORD PTR [rip+0x999c]        # 809d40 <idt>
  8003a4:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003a8:	48 c1 e0 04          	shl    rax,0x4
  8003ac:	48 01 c2             	add    rdx,rax
  8003af:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003b3:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003b7:	48 8b 15 82 99 00 00 	mov    rdx,QWORD PTR [rip+0x9982]        # 809d40 <idt>
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
  8003e1:	e8 59 45 00 00       	call   80493f <eoi>
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
  8003fb:	e8 3f 45 00 00       	call   80493f <eoi>
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
  800415:	e8 25 45 00 00       	call   80493f <eoi>
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
  80042f:	e8 0b 45 00 00       	call   80493f <eoi>
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
  800449:	e8 f1 44 00 00       	call   80493f <eoi>
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
  800463:	e8 d7 44 00 00       	call   80493f <eoi>
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
  80047c:	e8 be 44 00 00       	call   80493f <eoi>
    report_back_trace_of_err();
  800481:	b8 00 00 00 00       	mov    eax,0x0
  800486:	e8 e0 44 00 00       	call   80496b <report_back_trace_of_err>
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
  8004a1:	e8 99 44 00 00       	call   80493f <eoi>
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
  8004bb:	e8 7f 44 00 00       	call   80493f <eoi>
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
  8004d4:	e8 66 44 00 00       	call   80493f <eoi>
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
  8004ed:	e8 4d 44 00 00       	call   80493f <eoi>
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
  800507:	e8 33 44 00 00       	call   80493f <eoi>
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
  800521:	e8 19 44 00 00       	call   80493f <eoi>
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
  800545:	e8 f5 43 00 00       	call   80493f <eoi>
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
  800562:	e8 d8 43 00 00       	call   80493f <eoi>
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
  80059b:	48 8b 04 c5 a0 13 81 	mov    rax,QWORD PTR [rax*8+0x8113a0]
  8005a2:	00 
  8005a3:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(b);
  8005a6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005a9:	48 98                	cdqe   
  8005ab:	48 89 c7             	mov    rdi,rax
  8005ae:	e8 4e 23 00 00       	call   802901 <reg_device>
  8005b3:	e9 f7 01 00 00       	jmp    8007af <syscall+0x241>
        case 1:return dispose_device(b);
  8005b8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005bb:	89 c7                	mov    edi,eax
  8005bd:	e8 9e 2d 00 00       	call   803360 <dispose_device>
  8005c2:	e9 e8 01 00 00       	jmp    8007af <syscall+0x241>
        case 2:return reg_driver(b);
  8005c7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005ca:	48 98                	cdqe   
  8005cc:	48 89 c7             	mov    rdi,rax
  8005cf:	e8 15 26 00 00       	call   802be9 <reg_driver>
  8005d4:	e9 d6 01 00 00       	jmp    8007af <syscall+0x241>
        case 3:return dispose_driver(b);
  8005d9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005dc:	48 98                	cdqe   
  8005de:	48 89 c7             	mov    rdi,rax
  8005e1:	e8 18 2e 00 00       	call   8033fe <dispose_driver>
  8005e6:	e9 c4 01 00 00       	jmp    8007af <syscall+0x241>
        case 4:return call_drv_func(b,c,d);
  8005eb:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8005ee:	48 98                	cdqe   
  8005f0:	48 89 c2             	mov    rdx,rax
  8005f3:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8005f6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005f9:	89 ce                	mov    esi,ecx
  8005fb:	89 c7                	mov    edi,eax
  8005fd:	e8 07 2b 00 00       	call   803109 <call_drv_func>
  800602:	e9 a8 01 00 00       	jmp    8007af <syscall+0x241>
        case 5:return req_page_at(b,c);
  800607:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80060a:	48 98                	cdqe   
  80060c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80060f:	89 d6                	mov    esi,edx
  800611:	48 89 c7             	mov    rdi,rax
  800614:	e8 d5 0e 00 00       	call   8014ee <req_page_at>
  800619:	e9 91 01 00 00       	jmp    8007af <syscall+0x241>
        case 6:return free_page(b);
  80061e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800621:	48 98                	cdqe   
  800623:	48 89 c7             	mov    rdi,rax
  800626:	e8 f4 0c 00 00       	call   80131f <free_page>
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
  800648:	e8 b2 3e 00 00       	call   8044ff <reg_proc>
  80064d:	e9 5d 01 00 00       	jmp    8007af <syscall+0x241>
        case 8:del_proc(b);
  800652:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800655:	89 c7                	mov    edi,eax
  800657:	e8 80 3c 00 00       	call   8042dc <del_proc>
        case 10:chk_vm(b,c);
  80065c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80065f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800662:	89 d6                	mov    esi,edx
  800664:	89 c7                	mov    edi,eax
  800666:	e8 45 0f 00 00       	call   8015b0 <chk_vm>
        case 11:return sys_open(b,c);
  80066b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80066e:	48 98                	cdqe   
  800670:	48 89 c2             	mov    rdx,rax
  800673:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800676:	89 c6                	mov    esi,eax
  800678:	48 89 d7             	mov    rdi,rdx
  80067b:	e8 14 13 00 00       	call   801994 <sys_open>
  800680:	e9 2a 01 00 00       	jmp    8007af <syscall+0x241>
        case 12:return sys_close(b);
  800685:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800688:	89 c7                	mov    edi,eax
  80068a:	e8 ce 17 00 00       	call   801e5d <sys_close>
  80068f:	e9 1b 01 00 00       	jmp    8007af <syscall+0x241>
        case 13:return sys_read(b,c,d);
  800694:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800697:	48 98                	cdqe   
  800699:	48 89 c1             	mov    rcx,rax
  80069c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80069f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006a2:	48 89 ce             	mov    rsi,rcx
  8006a5:	89 c7                	mov    edi,eax
  8006a7:	e8 c7 18 00 00       	call   801f73 <sys_read>
  8006ac:	e9 fe 00 00 00       	jmp    8007af <syscall+0x241>
        case 14:return sys_write(b,c,d);
  8006b1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006b4:	48 98                	cdqe   
  8006b6:	48 89 c1             	mov    rcx,rax
  8006b9:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006bc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006bf:	48 89 ce             	mov    rsi,rcx
  8006c2:	89 c7                	mov    edi,eax
  8006c4:	e8 19 18 00 00       	call   801ee2 <sys_write>
  8006c9:	e9 e1 00 00 00       	jmp    8007af <syscall+0x241>
        case 15:return sys_seek(b,c,d);
  8006ce:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006d1:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006d4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006d7:	89 ce                	mov    esi,ecx
  8006d9:	89 c7                	mov    edi,eax
  8006db:	e8 24 19 00 00       	call   802004 <sys_seek>
  8006e0:	e9 ca 00 00 00       	jmp    8007af <syscall+0x241>
        case 16:return sys_tell(b);
  8006e5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006e8:	89 c7                	mov    edi,eax
  8006ea:	e8 5c 19 00 00       	call   80204b <sys_tell>
  8006ef:	e9 bb 00 00 00       	jmp    8007af <syscall+0x241>
        case 17:return reg_vol(b,c,d);
  8006f4:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006f7:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006fa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006fd:	89 ce                	mov    esi,ecx
  8006ff:	89 c7                	mov    edi,eax
  800701:	b8 00 00 00 00       	mov    eax,0x0
  800706:	e8 7e 11 00 00       	call   801889 <reg_vol>
  80070b:	e9 9f 00 00 00       	jmp    8007af <syscall+0x241>
        case 18:return free_vol(b);
  800710:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800713:	89 c7                	mov    edi,eax
  800715:	b8 00 00 00 00       	mov    eax,0x0
  80071a:	e8 4e 11 00 00       	call   80186d <free_vol>
  80071f:	e9 8b 00 00 00       	jmp    8007af <syscall+0x241>
        case 19:return execute(b);
  800724:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800727:	48 98                	cdqe   
  800729:	48 89 c7             	mov    rdi,rax
  80072c:	e8 c7 44 00 00       	call   804bf8 <execute>
  800731:	eb 7c                	jmp    8007af <syscall+0x241>
        case SYSCALL_EXIT:return sys_exit(b);
  800733:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800736:	89 c7                	mov    edi,eax
  800738:	e8 a1 3d 00 00       	call   8044de <sys_exit>
  80073d:	eb 70                	jmp    8007af <syscall+0x241>
        case SYSCALL_CALL:return exec_call(b);
  80073f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800742:	48 98                	cdqe   
  800744:	48 89 c7             	mov    rdi,rax
  800747:	e8 a7 45 00 00       	call   804cf3 <exec_call>
  80074c:	eb 61                	jmp    8007af <syscall+0x241>
        case SYSCALL_MKFIFO:return sys_mkfifo(b);
  80074e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800751:	89 c7                	mov    edi,eax
  800753:	e8 b6 0f 00 00       	call   80170e <sys_mkfifo>
  800758:	eb 55                	jmp    8007af <syscall+0x241>
        case SYSCALL_MALLOC:return sys_malloc(b);
  80075a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80075d:	89 c7                	mov    edi,eax
  80075f:	e8 51 3f 00 00       	call   8046b5 <sys_malloc>
  800764:	eb 49                	jmp    8007af <syscall+0x241>
        case SYSCALL_FREE:return sys_free(b);
  800766:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800769:	89 c7                	mov    edi,eax
  80076b:	e8 d3 40 00 00       	call   804843 <sys_free>
  800770:	eb 3d                	jmp    8007af <syscall+0x241>
        case SYSCALL_KB_READC:return sys_getkbc();
  800772:	b8 00 00 00 00       	mov    eax,0x0
  800777:	e8 73 56 00 00       	call   805def <sys_getkbc>
  80077c:	0f be c0             	movsx  eax,al
  80077f:	eb 2e                	jmp    8007af <syscall+0x241>
        case SYSCALL_FIND_DEV:return sys_find_dev(b);
  800781:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800784:	48 98                	cdqe   
  800786:	48 89 c7             	mov    rdi,rax
  800789:	e8 ab 25 00 00       	call   802d39 <sys_find_dev>
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
  8007a8:	e8 1e 26 00 00       	call   802dcb <sys_operate_dev>
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
  8007d9:	e8 41 03 00 00       	call   800b1f <init_logging>
        
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
  8007f4:	e9 8a 02 00 00       	jmp    800a83 <main+0x2d2>
		 tag->type != MULTIBOOT_TAG_TYPE_END;
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
	{
		//printf("Tag 0x%x, Size 0x%x\n", tag->type, tag->size);
		switch (tag->type)
  8007f9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8007fd:	8b 00                	mov    eax,DWORD PTR [rax]
  8007ff:	83 f8 08             	cmp    eax,0x8
  800802:	0f 87 68 02 00 00    	ja     800a70 <main+0x2bf>
  800808:	89 c0                	mov    eax,eax
  80080a:	48 8b 04 c5 f8 16 81 	mov    rax,QWORD PTR [rax*8+0x8116f8]
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
  80081e:	e8 7d 08 00 00       	call   8010a0 <set_high_mem_base>
			break;
  800823:	e9 48 02 00 00       	jmp    800a70 <main+0x2bf>
		{
			multiboot_memory_map_t *mmap;

			//printf("mmap\n");

			for (mmap = ((struct multiboot_tag_mmap *)tag)->entries;
  800828:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80082c:	48 83 c0 10          	add    rax,0x10
  800830:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  800834:	eb 66                	jmp    80089c <main+0xeb>
//					   (unsigned)(mmap->addr >> 32),
//					   (unsigned)(mmap->addr & 0xffffffff),
//					   (unsigned)(mmap->len >> 32),
//					   (unsigned)(mmap->len & 0xffffffff),
//					   (unsigned)mmap->type);
					set_mem_area(mmap->addr,mmap->len,mmap->type);
  800836:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80083a:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
					   " length = 0x%x%x, type = 0x%x,",
  80083d:	89 c2                	mov    edx,eax
					set_mem_area(mmap->addr,mmap->len,mmap->type);
  80083f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800843:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
					   " length = 0x%x%x, type = 0x%x,",
  800847:	89 c1                	mov    ecx,eax
					set_mem_area(mmap->addr,mmap->len,mmap->type);
  800849:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80084d:	48 8b 00             	mov    rax,QWORD PTR [rax]
					   " length = 0x%x%x, type = 0x%x,",
  800850:	89 ce                	mov    esi,ecx
  800852:	89 c7                	mov    edi,eax
  800854:	e8 5e 08 00 00       	call   8010b7 <set_mem_area>
					switch (mmap->type)
  800859:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80085d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  800860:	83 f8 05             	cmp    eax,0x5
  800863:	74 19                	je     80087e <main+0xcd>
  800865:	83 f8 05             	cmp    eax,0x5
  800868:	77 17                	ja     800881 <main+0xd0>
  80086a:	83 f8 04             	cmp    eax,0x4
  80086d:	74 15                	je     800884 <main+0xd3>
  80086f:	83 f8 04             	cmp    eax,0x4
  800872:	77 0d                	ja     800881 <main+0xd0>
  800874:	83 f8 01             	cmp    eax,0x1
  800877:	74 0e                	je     800887 <main+0xd6>
  800879:	83 f8 03             	cmp    eax,0x3
						//printf("available RAM\n");
						break;
					
					case 3:
						//printf("ACPI info\n");
						break;
  80087c:	eb 0a                	jmp    800888 <main+0xd7>
					case 4:
						//printf("reserved mem needed to preserve on hibernation\n");
						break;
					case 5:
						//printf("defected mem\n");
						break;
  80087e:	90                   	nop
  80087f:	eb 07                	jmp    800888 <main+0xd7>
					default:
						//printf("reserved mem\n");
						break;
  800881:	90                   	nop
  800882:	eb 04                	jmp    800888 <main+0xd7>
						break;
  800884:	90                   	nop
  800885:	eb 01                	jmp    800888 <main+0xd7>
						break;
  800887:	90                   	nop
				 mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
  800888:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80088c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80088f:	89 c2                	mov    edx,eax
  800891:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800895:	48 01 d0             	add    rax,rdx
  800898:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
				 (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
  80089c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008a0:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8008a3:	89 c2                	mov    edx,eax
  8008a5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008a9:	48 01 d0             	add    rax,rdx
  8008ac:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  8008b0:	72 84                	jb     800836 <main+0x85>
					}

				}
		}
		break;
  8008b2:	e9 b9 01 00 00       	jmp    800a70 <main+0x2bf>
		case MULTIBOOT_TAG_TYPE_FRAMEBUFFER:
		{
			multiboot_uint32_t color;
			unsigned i;
			struct multiboot_tag_framebuffer *tagfb = (struct multiboot_tag_framebuffer *)tag;
  8008b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008bb:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
			void *fb = (void *) FRAMEBUFFER_ADDR;
  8008bf:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x40000000
  8008c6:	40 
			set_framebuffer(*tagfb);
  8008c7:	48 83 ec 08          	sub    rsp,0x8
  8008cb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8008cf:	ff 70 20             	push   QWORD PTR [rax+0x20]
  8008d2:	ff 70 18             	push   QWORD PTR [rax+0x18]
  8008d5:	ff 70 10             	push   QWORD PTR [rax+0x10]
  8008d8:	ff 70 08             	push   QWORD PTR [rax+0x8]
  8008db:	ff 30                	push   QWORD PTR [rax]
  8008dd:	e8 93 4e 00 00       	call   805775 <set_framebuffer>
  8008e2:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  8008e6:	b8 00 00 00 00       	mov    eax,0x0
  8008eb:	e8 d0 4c 00 00       	call   8055c0 <init_framebuffer>
			switch (tagfb->common.framebuffer_type)
  8008f0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8008f4:	0f b6 40 1d          	movzx  eax,BYTE PTR [rax+0x1d]
  8008f8:	0f b6 c0             	movzx  eax,al
  8008fb:	83 f8 02             	cmp    eax,0x2
  8008fe:	0f 84 5a 01 00 00    	je     800a5e <main+0x2ad>
  800904:	83 f8 02             	cmp    eax,0x2
  800907:	0f 8f 5a 01 00 00    	jg     800a67 <main+0x2b6>
  80090d:	85 c0                	test   eax,eax
  80090f:	74 0e                	je     80091f <main+0x16e>
  800911:	83 f8 01             	cmp    eax,0x1
  800914:	0f 84 15 01 00 00    	je     800a2f <main+0x27e>
  80091a:	e9 48 01 00 00       	jmp    800a67 <main+0x2b6>
			case MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED:
			{
				unsigned best_distance, distance;
				struct multiboot_color *palette;

				palette = tagfb->framebuffer_palette;
  80091f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800923:	48 83 c0 22          	add    rax,0x22
  800927:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

				color = 0;
  80092b:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
				best_distance = 4 * 256 * 256;
  800932:	c7 45 e8 00 00 04 00 	mov    DWORD PTR [rbp-0x18],0x40000

				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800939:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  800940:	e9 d4 00 00 00       	jmp    800a19 <main+0x268>
				{
					distance = (0xff - palette[i].blue) * (0xff - palette[i].blue) + palette[i].red * palette[i].red + palette[i].green * palette[i].green;
  800945:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800948:	48 89 d0             	mov    rax,rdx
  80094b:	48 01 c0             	add    rax,rax
  80094e:	48 01 c2             	add    rdx,rax
  800951:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800955:	48 01 d0             	add    rax,rdx
  800958:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  80095c:	0f b6 c0             	movzx  eax,al
  80095f:	ba ff 00 00 00       	mov    edx,0xff
  800964:	89 d1                	mov    ecx,edx
  800966:	29 c1                	sub    ecx,eax
  800968:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80096b:	48 89 d0             	mov    rax,rdx
  80096e:	48 01 c0             	add    rax,rax
  800971:	48 01 c2             	add    rdx,rax
  800974:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800978:	48 01 d0             	add    rax,rdx
  80097b:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  80097f:	0f b6 d0             	movzx  edx,al
  800982:	b8 ff 00 00 00       	mov    eax,0xff
  800987:	29 d0                	sub    eax,edx
  800989:	89 ce                	mov    esi,ecx
  80098b:	0f af f0             	imul   esi,eax
  80098e:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800991:	48 89 d0             	mov    rax,rdx
  800994:	48 01 c0             	add    rax,rax
  800997:	48 01 c2             	add    rdx,rax
  80099a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80099e:	48 01 d0             	add    rax,rdx
  8009a1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8009a4:	0f b6 c8             	movzx  ecx,al
  8009a7:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009aa:	48 89 d0             	mov    rax,rdx
  8009ad:	48 01 c0             	add    rax,rax
  8009b0:	48 01 c2             	add    rdx,rax
  8009b3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009b7:	48 01 d0             	add    rax,rdx
  8009ba:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8009bd:	0f b6 c0             	movzx  eax,al
  8009c0:	0f af c1             	imul   eax,ecx
  8009c3:	01 c6                	add    esi,eax
  8009c5:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009c8:	48 89 d0             	mov    rax,rdx
  8009cb:	48 01 c0             	add    rax,rax
  8009ce:	48 01 c2             	add    rdx,rax
  8009d1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009d5:	48 01 d0             	add    rax,rdx
  8009d8:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  8009dc:	0f b6 c8             	movzx  ecx,al
  8009df:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009e2:	48 89 d0             	mov    rax,rdx
  8009e5:	48 01 c0             	add    rax,rax
  8009e8:	48 01 c2             	add    rdx,rax
  8009eb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009ef:	48 01 d0             	add    rax,rdx
  8009f2:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  8009f6:	0f b6 c0             	movzx  eax,al
  8009f9:	0f af c1             	imul   eax,ecx
  8009fc:	01 f0                	add    eax,esi
  8009fe:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
					if (distance < best_distance)
  800a01:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a04:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  800a07:	73 0c                	jae    800a15 <main+0x264>
					{
						color = i;
  800a09:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800a0c:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
						best_distance = distance;
  800a0f:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a12:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800a15:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  800a19:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a1d:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
  800a21:	0f b7 c0             	movzx  eax,ax
  800a24:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  800a27:	0f 82 18 ff ff ff    	jb     800945 <main+0x194>
					}
				}
			}
			break;
  800a2d:	eb 40                	jmp    800a6f <main+0x2be>

			case MULTIBOOT_FRAMEBUFFER_TYPE_RGB:
				color = ((1 << tagfb->framebuffer_blue_mask_size) - 1) << tagfb->framebuffer_blue_field_position;
  800a2f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a33:	0f b6 40 25          	movzx  eax,BYTE PTR [rax+0x25]
  800a37:	0f b6 c0             	movzx  eax,al
  800a3a:	ba 01 00 00 00       	mov    edx,0x1
  800a3f:	89 c1                	mov    ecx,eax
  800a41:	d3 e2                	shl    edx,cl
  800a43:	89 d0                	mov    eax,edx
  800a45:	8d 50 ff             	lea    edx,[rax-0x1]
  800a48:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a4c:	0f b6 40 24          	movzx  eax,BYTE PTR [rax+0x24]
  800a50:	0f b6 c0             	movzx  eax,al
  800a53:	89 c1                	mov    ecx,eax
  800a55:	d3 e2                	shl    edx,cl
  800a57:	89 d0                	mov    eax,edx
  800a59:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
				break;
  800a5c:	eb 11                	jmp    800a6f <main+0x2be>

			case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT:
				color = '\\' | 0x0100;
  800a5e:	c7 45 c4 5c 01 00 00 	mov    DWORD PTR [rbp-0x3c],0x15c
				break;
  800a65:	eb 08                	jmp    800a6f <main+0x2be>

			default:
				color = 0xffffffff;
  800a67:	c7 45 c4 ff ff ff ff 	mov    DWORD PTR [rbp-0x3c],0xffffffff
				break;
  800a6e:	90                   	nop
			}

			break;
  800a6f:	90                   	nop
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
  800a70:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800a74:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800a77:	83 c0 07             	add    eax,0x7
  800a7a:	89 c0                	mov    eax,eax
  800a7c:	83 e0 f8             	and    eax,0xfffffff8
  800a7f:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
		 tag->type != MULTIBOOT_TAG_TYPE_END;
  800a83:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800a87:	8b 00                	mov    eax,DWORD PTR [rax]
  800a89:	85 c0                	test   eax,eax
  800a8b:	0f 85 68 fd ff ff    	jne    8007f9 <main+0x48>
		}
		}
	}
	tag = (struct multiboot_tag *)((multiboot_uint8_t *)tag + ((tag->size + 7) & ~7));
  800a91:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800a95:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800a98:	83 c0 07             	add    eax,0x7
  800a9b:	89 c0                	mov    eax,eax
  800a9d:	83 e0 f8             	and    eax,0xfffffff8
  800aa0:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
	//printf("Total mbi size 0x%x\n", (unsigned)tag - addr);
	char disk_count=*(char*)0x475;
  800aa4:	b8 75 04 00 00       	mov    eax,0x475
  800aa9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800aac:	88 45 db             	mov    BYTE PTR [rbp-0x25],al
	//printf("disk count:%d\n",disk_count);
    init_font();
  800aaf:	b8 00 00 00 00       	mov    eax,0x0
  800ab4:	e8 c6 4b 00 00       	call   80567f <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800ab9:	bf c8 16 81 00       	mov    edi,0x8116c8
  800abe:	e8 da 4f 00 00       	call   805a9d <print>
//    init_com(PORT_COM1);
//    com_puts("gamessis os loaded.",PORT_COM1);
	init_paging();
  800ac3:	b8 00 00 00 00       	mov    eax,0x0
  800ac8:	e8 af 05 00 00       	call   80107c <init_paging>
// 	init_gdt();
    init_memory();
  800acd:	b8 00 00 00 00       	mov    eax,0x0
  800ad2:	e8 6d 07 00 00       	call   801244 <init_memory>
    init_drvdev_man();
  800ad7:	b8 00 00 00 00       	mov    eax,0x0
  800adc:	e8 06 1e 00 00       	call   8028e7 <init_drvdev_man>
    init_proc();
  800ae1:	b8 00 00 00 00       	mov    eax,0x0
  800ae6:	e8 e7 2c 00 00       	call   8037d2 <init_proc>
	init_int();
  800aeb:	b8 00 00 00 00       	mov    eax,0x0
  800af0:	e8 0b f5 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800af5:	bf e5 16 81 00       	mov    edi,0x8116e5
  800afa:	e8 9e 4f 00 00       	call   805a9d <print>
    //自带驱动
    //init_tty();
    init_kb();
  800aff:	b8 00 00 00 00       	mov    eax,0x0
  800b04:	e8 f0 51 00 00       	call   805cf9 <init_kb>
    init_disk();
  800b09:	b8 00 00 00 00       	mov    eax,0x0
  800b0e:	e8 40 53 00 00       	call   805e53 <init_disk>

	//init_vfs();
    //init_fat16();
	manage_proc_lock=0;
  800b13:	c7 05 2b 92 00 00 00 	mov    DWORD PTR [rip+0x922b],0x0        # 809d48 <manage_proc_lock>
  800b1a:	00 00 00 
    while (1);
  800b1d:	eb fe                	jmp    800b1d <main+0x36c>

0000000000800b1f <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800b1f:	f3 0f 1e fa          	endbr64 
  800b23:	55                   	push   rbp
  800b24:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800b27:	48 c7 05 ce f4 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff4ce],0xb8000        # 400000 <video>
  800b2e:	00 80 0b 00 
    xpos=0;
  800b32:	c7 05 cc f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff4cc],0x0        # 400008 <xpos>
  800b39:	00 00 00 
    ypos=0;
  800b3c:	c7 05 c6 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff4c6],0x0        # 40000c <ypos>
  800b43:	00 00 00 
}
  800b46:	90                   	nop
  800b47:	5d                   	pop    rbp
  800b48:	c3                   	ret    

0000000000800b49 <itoa>:

static void itoa (char *buf, int base, int d)
{
  800b49:	f3 0f 1e fa          	endbr64 
  800b4d:	55                   	push   rbp
  800b4e:	48 89 e5             	mov    rbp,rsp
  800b51:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800b55:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800b58:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800b5b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800b5f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800b63:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800b66:	48 98                	cdqe   
  800b68:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800b6c:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800b73:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800b77:	75 27                	jne    800ba0 <itoa+0x57>
  800b79:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800b7d:	79 21                	jns    800ba0 <itoa+0x57>
    {
        *p++ = '-';
  800b7f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800b83:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800b87:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800b8b:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800b8e:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800b93:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800b96:	f7 d8                	neg    eax
  800b98:	48 98                	cdqe   
  800b9a:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800b9e:	eb 0d                	jmp    800bad <itoa+0x64>
    }
    else if (base == 'x')
  800ba0:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800ba4:	75 07                	jne    800bad <itoa+0x64>
        divisor = 16;
  800ba6:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800bad:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800bb0:	48 63 c8             	movsxd rcx,eax
  800bb3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800bb7:	ba 00 00 00 00       	mov    edx,0x0
  800bbc:	48 f7 f1             	div    rcx
  800bbf:	48 89 d0             	mov    rax,rdx
  800bc2:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800bc5:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800bc9:	7f 0a                	jg     800bd5 <itoa+0x8c>
  800bcb:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800bce:	83 c0 30             	add    eax,0x30
  800bd1:	89 c1                	mov    ecx,eax
  800bd3:	eb 08                	jmp    800bdd <itoa+0x94>
  800bd5:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800bd8:	83 c0 57             	add    eax,0x57
  800bdb:	89 c1                	mov    ecx,eax
  800bdd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800be1:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800be5:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800be9:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800beb:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800bee:	48 63 f0             	movsxd rsi,eax
  800bf1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800bf5:	ba 00 00 00 00       	mov    edx,0x0
  800bfa:	48 f7 f6             	div    rsi
  800bfd:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c01:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800c06:	75 a5                	jne    800bad <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800c08:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c0c:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800c0f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800c13:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800c17:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c1b:	48 83 e8 01          	sub    rax,0x1
  800c1f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800c23:	eb 2b                	jmp    800c50 <itoa+0x107>
    {
        char tmp = *p1;
  800c25:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c29:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800c2c:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800c2f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c33:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800c36:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c3a:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800c3c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c40:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800c44:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800c46:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800c4b:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800c50:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c54:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800c58:	72 cb                	jb     800c25 <itoa+0xdc>
    }
}
  800c5a:	90                   	nop
  800c5b:	90                   	nop
  800c5c:	5d                   	pop    rbp
  800c5d:	c3                   	ret    

0000000000800c5e <putchar>:
 
/* 在屏幕上输出字符 C 。 */
static void putchar (int c)
{
  800c5e:	f3 0f 1e fa          	endbr64 
  800c62:	55                   	push   rbp
  800c63:	48 89 e5             	mov    rbp,rsp
  800c66:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if (c == '\n' || c == '\r')
  800c69:	83 7d fc 0a          	cmp    DWORD PTR [rbp-0x4],0xa
  800c6d:	74 06                	je     800c75 <putchar+0x17>
  800c6f:	83 7d fc 0d          	cmp    DWORD PTR [rbp-0x4],0xd
  800c73:	75 38                	jne    800cad <putchar+0x4f>
    {
newline:
  800c75:	90                   	nop
  800c76:	eb 01                	jmp    800c79 <putchar+0x1b>
    *(video + (xpos + ypos * COLUMNS) * 2) = c & 0xFF;
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
  800c78:	90                   	nop
        xpos = 0;
  800c79:	c7 05 85 f3 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff385],0x0        # 400008 <xpos>
  800c80:	00 00 00 
        ypos++;
  800c83:	8b 05 83 f3 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff383]        # 40000c <ypos>
  800c89:	83 c0 01             	add    eax,0x1
  800c8c:	89 05 7a f3 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff37a],eax        # 40000c <ypos>
        if (ypos >= LINES)
  800c92:	8b 05 74 f3 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff374]        # 40000c <ypos>
  800c98:	83 f8 17             	cmp    eax,0x17
  800c9b:	0f 8e 88 00 00 00    	jle    800d29 <putchar+0xcb>
            ypos = 0;
  800ca1:	c7 05 61 f3 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff361],0x0        # 40000c <ypos>
  800ca8:	00 00 00 
        return;
  800cab:	eb 7c                	jmp    800d29 <putchar+0xcb>
    *(video + (xpos + ypos * COLUMNS) * 2) = c & 0xFF;
  800cad:	48 8b 0d 4c f3 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbff34c]        # 400000 <video>
  800cb4:	8b 15 52 f3 bf ff    	mov    edx,DWORD PTR [rip+0xffffffffffbff352]        # 40000c <ypos>
  800cba:	89 d0                	mov    eax,edx
  800cbc:	c1 e0 02             	shl    eax,0x2
  800cbf:	01 d0                	add    eax,edx
  800cc1:	c1 e0 04             	shl    eax,0x4
  800cc4:	89 c2                	mov    edx,eax
  800cc6:	8b 05 3c f3 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff33c]        # 400008 <xpos>
  800ccc:	01 d0                	add    eax,edx
  800cce:	01 c0                	add    eax,eax
  800cd0:	48 98                	cdqe   
  800cd2:	48 01 c8             	add    rax,rcx
  800cd5:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  800cd8:	88 10                	mov    BYTE PTR [rax],dl
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
  800cda:	48 8b 0d 1f f3 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbff31f]        # 400000 <video>
  800ce1:	8b 15 25 f3 bf ff    	mov    edx,DWORD PTR [rip+0xffffffffffbff325]        # 40000c <ypos>
  800ce7:	89 d0                	mov    eax,edx
  800ce9:	c1 e0 02             	shl    eax,0x2
  800cec:	01 d0                	add    eax,edx
  800cee:	c1 e0 04             	shl    eax,0x4
  800cf1:	89 c2                	mov    edx,eax
  800cf3:	8b 05 0f f3 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff30f]        # 400008 <xpos>
  800cf9:	01 d0                	add    eax,edx
  800cfb:	01 c0                	add    eax,eax
  800cfd:	48 98                	cdqe   
  800cff:	48 83 c0 01          	add    rax,0x1
  800d03:	48 01 c8             	add    rax,rcx
  800d06:	c6 00 07             	mov    BYTE PTR [rax],0x7
    xpos++;
  800d09:	8b 05 f9 f2 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff2f9]        # 400008 <xpos>
  800d0f:	83 c0 01             	add    eax,0x1
  800d12:	89 05 f0 f2 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff2f0],eax        # 400008 <xpos>
    if (xpos >= COLUMNS)
  800d18:	8b 05 ea f2 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff2ea]        # 400008 <xpos>
  800d1e:	83 f8 4f             	cmp    eax,0x4f
  800d21:	0f 8f 51 ff ff ff    	jg     800c78 <putchar+0x1a>
  800d27:	eb 01                	jmp    800d2a <putchar+0xcc>
        return;
  800d29:	90                   	nop
}
  800d2a:	5d                   	pop    rbp
  800d2b:	c3                   	ret    

0000000000800d2c <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800d2c:	f3 0f 1e fa          	endbr64 
  800d30:	55                   	push   rbp
  800d31:	48 89 e5             	mov    rbp,rsp
  800d34:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800d3b:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800d42:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800d49:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800d50:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800d57:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800d5e:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800d65:	84 c0                	test   al,al
  800d67:	74 20                	je     800d89 <printf+0x5d>
  800d69:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800d6d:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800d71:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800d75:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800d79:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800d7d:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800d81:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800d85:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800d89:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800d90:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    int c;
    char buf[20];
 
    arg++;
  800d97:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800d9e:	08 
 
    while ((c = *format++) != 0)
  800d9f:	e9 38 01 00 00       	jmp    800edc <printf+0x1b0>
    {
        if (c != '%')
  800da4:	83 bd 3c ff ff ff 25 	cmp    DWORD PTR [rbp-0xc4],0x25
  800dab:	74 12                	je     800dbf <printf+0x93>
            putchar (c);
  800dad:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  800db3:	89 c7                	mov    edi,eax
  800db5:	e8 a4 fe ff ff       	call   800c5e <putchar>
  800dba:	e9 1d 01 00 00       	jmp    800edc <printf+0x1b0>
        else
        {
            char *p;
 
            c = *format++;
  800dbf:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800dc6:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800dca:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800dd1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800dd4:	0f be c0             	movsx  eax,al
  800dd7:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
            switch (c)
  800ddd:	83 bd 3c ff ff ff 78 	cmp    DWORD PTR [rbp-0xc4],0x78
  800de4:	74 3a                	je     800e20 <printf+0xf4>
  800de6:	83 bd 3c ff ff ff 78 	cmp    DWORD PTR [rbp-0xc4],0x78
  800ded:	0f 8f cd 00 00 00    	jg     800ec0 <printf+0x194>
  800df3:	83 bd 3c ff ff ff 75 	cmp    DWORD PTR [rbp-0xc4],0x75
  800dfa:	74 24                	je     800e20 <printf+0xf4>
  800dfc:	83 bd 3c ff ff ff 75 	cmp    DWORD PTR [rbp-0xc4],0x75
  800e03:	0f 8f b7 00 00 00    	jg     800ec0 <printf+0x194>
  800e09:	83 bd 3c ff ff ff 64 	cmp    DWORD PTR [rbp-0xc4],0x64
  800e10:	74 0e                	je     800e20 <printf+0xf4>
  800e12:	83 bd 3c ff ff ff 73 	cmp    DWORD PTR [rbp-0xc4],0x73
  800e19:	74 40                	je     800e5b <printf+0x12f>
  800e1b:	e9 a0 00 00 00       	jmp    800ec0 <printf+0x194>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800e20:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e27:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e2b:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e32:	8b 10                	mov    edx,DWORD PTR [rax]
  800e34:	8b 8d 3c ff ff ff    	mov    ecx,DWORD PTR [rbp-0xc4]
  800e3a:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800e41:	89 ce                	mov    esi,ecx
  800e43:	48 89 c7             	mov    rdi,rax
  800e46:	e8 fe fc ff ff       	call   800b49 <itoa>
                p = buf;
  800e4b:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800e52:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800e59:	eb 34                	jmp    800e8f <printf+0x163>
                break;
 
            case 's':
                p = *arg++;
  800e5b:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e62:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e66:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e6d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800e70:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800e77:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800e7e:	00 
  800e7f:	75 0d                	jne    800e8e <printf+0x162>
                    p = "(null)";
  800e81:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x811740
  800e88:	40 17 81 00 
  800e8c:	eb 22                	jmp    800eb0 <printf+0x184>
 
string:
  800e8e:	90                   	nop
                while (*p)
  800e8f:	eb 1f                	jmp    800eb0 <printf+0x184>
                    putchar (*p++);
  800e91:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e98:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e9c:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800ea3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800ea6:	0f be c0             	movsx  eax,al
  800ea9:	89 c7                	mov    edi,eax
  800eab:	e8 ae fd ff ff       	call   800c5e <putchar>
                while (*p)
  800eb0:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800eb7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800eba:	84 c0                	test   al,al
  800ebc:	75 d3                	jne    800e91 <printf+0x165>
                break;
  800ebe:	eb 1c                	jmp    800edc <printf+0x1b0>
 
            default:
                putchar (*((int *) arg++));
  800ec0:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800ec7:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800ecb:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800ed2:	8b 00                	mov    eax,DWORD PTR [rax]
  800ed4:	89 c7                	mov    edi,eax
  800ed6:	e8 83 fd ff ff       	call   800c5e <putchar>
                break;
  800edb:	90                   	nop
    while ((c = *format++) != 0)
  800edc:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800ee3:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800ee7:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800eee:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800ef1:	0f be c0             	movsx  eax,al
  800ef4:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
  800efa:	83 bd 3c ff ff ff 00 	cmp    DWORD PTR [rbp-0xc4],0x0
  800f01:	0f 85 9d fe ff ff    	jne    800da4 <printf+0x78>
            }
        }
    }
}
  800f07:	90                   	nop
  800f08:	90                   	nop
  800f09:	c9                   	leave  
  800f0a:	c3                   	ret    

0000000000800f0b <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800f0b:	f3 0f 1e fa          	endbr64 
  800f0f:	55                   	push   rbp
  800f10:	48 89 e5             	mov    rbp,rsp
  800f13:	48 83 ec 40          	sub    rsp,0x40
  800f17:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800f1b:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800f1f:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800f22:	48 8b 15 37 8e 00 00 	mov    rdx,QWORD PTR [rip+0x8e37]        # 809d60 <pml4>
  800f29:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f2d:	48 c1 e8 27          	shr    rax,0x27
  800f31:	48 c1 e0 03          	shl    rax,0x3
  800f35:	48 01 d0             	add    rax,rdx
  800f38:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f3b:	b0 00                	mov    al,0x0
  800f3d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800f41:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800f48:	00 00 00 
  800f4b:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800f4f:	48 c1 e8 1e          	shr    rax,0x1e
  800f53:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800f56:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f59:	48 98                	cdqe   
  800f5b:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f62:	00 
  800f63:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f67:	48 01 d0             	add    rax,rdx
  800f6a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f6d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800f71:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f75:	83 e0 01             	and    eax,0x1
  800f78:	48 85 c0             	test   rax,rax
  800f7b:	75 2f                	jne    800fac <mmap+0xa1>
    {
        pdp=(page_item*)vmalloc();
  800f7d:	b8 00 00 00 00       	mov    eax,0x0
  800f82:	e8 b3 01 00 00       	call   80113a <vmalloc>
  800f87:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        pdptp[pdpti]=(addr_t)pdp|attr;
  800f8b:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f8e:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800f92:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f95:	48 98                	cdqe   
  800f97:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f9e:	00 
  800f9f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800fa3:	48 01 f0             	add    rax,rsi
  800fa6:	48 09 ca             	or     rdx,rcx
  800fa9:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800fac:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fb0:	b0 00                	mov    al,0x0
  800fb2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800fb6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800fba:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800fbf:	48 c1 e8 15          	shr    rax,0x15
  800fc3:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800fca:	00 
  800fcb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fcf:	48 01 d0             	add    rax,rdx
  800fd2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800fd5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800fd9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fdd:	83 e0 01             	and    eax,0x1
  800fe0:	48 85 c0             	test   rax,rax
  800fe3:	75 37                	jne    80101c <mmap+0x111>
    {
        pt=(page_item*)vmalloc();
  800fe5:	b8 00 00 00 00       	mov    eax,0x0
  800fea:	e8 4b 01 00 00       	call   80113a <vmalloc>
  800fef:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800ff3:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800ff6:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800ffa:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800ffe:	25 ff ff ff 3f       	and    eax,0x3fffffff
  801003:	48 c1 e8 15          	shr    rax,0x15
  801007:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  80100e:	00 
  80100f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801013:	48 01 f0             	add    rax,rsi
  801016:	48 09 ca             	or     rdx,rcx
  801019:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  80101c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801020:	b0 00                	mov    al,0x0
  801022:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  801026:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  801029:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80102d:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  801033:	48 c1 ea 0c          	shr    rdx,0xc
  801037:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  80103e:	00 
  80103f:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  801043:	48 01 ca             	add    rdx,rcx
  801046:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  80104a:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  80104d:	b8 00 00 00 00       	mov    eax,0x0
}
  801052:	c9                   	leave  
  801053:	c3                   	ret    

0000000000801054 <mdemap>:

stat_t mdemap(addr_t la)
{
  801054:	f3 0f 1e fa          	endbr64 
  801058:	55                   	push   rbp
  801059:	48 89 e5             	mov    rbp,rsp
  80105c:	48 83 ec 10          	sub    rsp,0x10
  801060:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  801064:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801068:	ba 00 00 00 00       	mov    edx,0x0
  80106d:	48 89 c6             	mov    rsi,rax
  801070:	bf 00 00 00 00       	mov    edi,0x0
  801075:	e8 91 fe ff ff       	call   800f0b <mmap>
}
  80107a:	c9                   	leave  
  80107b:	c3                   	ret    

000000000080107c <init_paging>:
int init_paging()
{
  80107c:	f3 0f 1e fa          	endbr64 
  801080:	55                   	push   rbp
  801081:	48 89 e5             	mov    rbp,rsp
                    "mov %%rax,%%cr0":"=m"(page_index));
    #else
    //设置PML4
//    set_page_item(pml4,PDPT_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);
    //设置第一项pdpte，也就是内核空间
    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
  801084:	48 8b 05 dd 8c 00 00 	mov    rax,QWORD PTR [rip+0x8cdd]        # 809d68 <pdpt>
  80108b:	ba 02 00 00 00       	mov    edx,0x2
  801090:	be 00 00 00 00       	mov    esi,0x0
  801095:	48 89 c7             	mov    rdi,rax
  801098:	e8 a7 03 00 00       	call   801444 <set_1gb_pdpt>
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  80109d:	90                   	nop
  80109e:	5d                   	pop    rbp
  80109f:	c3                   	ret    

00000000008010a0 <set_high_mem_base>:
void set_high_mem_base(int base)
{
  8010a0:	f3 0f 1e fa          	endbr64 
  8010a4:	55                   	push   rbp
  8010a5:	48 89 e5             	mov    rbp,rsp
  8010a8:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  8010ab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010ae:	89 05 c4 8c 00 00    	mov    DWORD PTR [rip+0x8cc4],eax        # 809d78 <high_mem_base>
}
  8010b4:	90                   	nop
  8010b5:	5d                   	pop    rbp
  8010b6:	c3                   	ret    

00000000008010b7 <set_mem_area>:
void set_mem_area(int base,int len,int type)
{
  8010b7:	f3 0f 1e fa          	endbr64 
  8010bb:	55                   	push   rbp
  8010bc:	48 89 e5             	mov    rbp,rsp
  8010bf:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8010c2:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8010c5:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    mmap_struct[mmap_t_i].base=base;
  8010c8:	8b 05 62 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff162]        # 400230 <mmap_t_i>
  8010ce:	48 63 d0             	movsxd rdx,eax
  8010d1:	48 89 d0             	mov    rax,rdx
  8010d4:	48 01 c0             	add    rax,rax
  8010d7:	48 01 d0             	add    rax,rdx
  8010da:	48 c1 e0 02          	shl    rax,0x2
  8010de:	48 8d 90 40 01 40 00 	lea    rdx,[rax+0x400140]
  8010e5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010e8:	89 02                	mov    DWORD PTR [rdx],eax
    mmap_struct[mmap_t_i].len=len;
  8010ea:	8b 05 40 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff140]        # 400230 <mmap_t_i>
  8010f0:	48 63 d0             	movsxd rdx,eax
  8010f3:	48 89 d0             	mov    rax,rdx
  8010f6:	48 01 c0             	add    rax,rax
  8010f9:	48 01 d0             	add    rax,rdx
  8010fc:	48 c1 e0 02          	shl    rax,0x2
  801100:	48 8d 90 44 01 40 00 	lea    rdx,[rax+0x400144]
  801107:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80110a:	89 02                	mov    DWORD PTR [rdx],eax
    mmap_struct[mmap_t_i++].type=type;
  80110c:	8b 05 1e f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff11e]        # 400230 <mmap_t_i>
  801112:	8d 50 01             	lea    edx,[rax+0x1]
  801115:	89 15 15 f1 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff115],edx        # 400230 <mmap_t_i>
  80111b:	48 63 d0             	movsxd rdx,eax
  80111e:	48 89 d0             	mov    rax,rdx
  801121:	48 01 c0             	add    rax,rax
  801124:	48 01 d0             	add    rax,rdx
  801127:	48 c1 e0 02          	shl    rax,0x2
  80112b:	48 8d 90 48 01 40 00 	lea    rdx,[rax+0x400148]
  801132:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801135:	89 02                	mov    DWORD PTR [rdx],eax
}
  801137:	90                   	nop
  801138:	5d                   	pop    rbp
  801139:	c3                   	ret    

000000000080113a <vmalloc>:
addr_t vmalloc()
{
  80113a:	f3 0f 1e fa          	endbr64 
  80113e:	55                   	push   rbp
  80113f:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  801142:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801149:	eb 76                	jmp    8011c1 <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  80114b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801152:	eb 63                	jmp    8011b7 <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  801154:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801157:	48 98                	cdqe   
  801159:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [rax*4+0x400120]
  801160:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801163:	be 01 00 00 00       	mov    esi,0x1
  801168:	89 c1                	mov    ecx,eax
  80116a:	d3 e6                	shl    esi,cl
  80116c:	89 f0                	mov    eax,esi
  80116e:	21 d0                	and    eax,edx
  801170:	85 c0                	test   eax,eax
  801172:	75 3f                	jne    8011b3 <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  801174:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801177:	48 98                	cdqe   
  801179:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [rax*4+0x400120]
  801180:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801183:	be 01 00 00 00       	mov    esi,0x1
  801188:	89 c1                	mov    ecx,eax
  80118a:	d3 e6                	shl    esi,cl
  80118c:	89 f0                	mov    eax,esi
  80118e:	09 c2                	or     edx,eax
  801190:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801193:	48 98                	cdqe   
  801195:	89 14 85 20 01 40 00 	mov    DWORD PTR [rax*4+0x400120],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  80119c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80119f:	c1 e0 05             	shl    eax,0x5
  8011a2:	89 c2                	mov    edx,eax
  8011a4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8011a7:	01 d0                	add    eax,edx
  8011a9:	83 c0 20             	add    eax,0x20
  8011ac:	c1 e0 0c             	shl    eax,0xc
  8011af:	48 98                	cdqe   
  8011b1:	eb 14                	jmp    8011c7 <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  8011b3:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8011b7:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8011bb:	7e 97                	jle    801154 <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8011bd:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8011c1:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8011c5:	7e 84                	jle    80114b <vmalloc+0x11>
            }
        }
    }
}
  8011c7:	5d                   	pop    rbp
  8011c8:	c3                   	ret    

00000000008011c9 <vmfree>:

int vmfree(addr_t ptr)
{
  8011c9:	f3 0f 1e fa          	endbr64 
  8011cd:	55                   	push   rbp
  8011ce:	48 89 e5             	mov    rbp,rsp
  8011d1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  8011d5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8011d9:	48 c1 e8 0c          	shr    rax,0xc
  8011dd:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8011e0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011e3:	8d 50 1f             	lea    edx,[rax+0x1f]
  8011e6:	85 c0                	test   eax,eax
  8011e8:	0f 48 c2             	cmovs  eax,edx
  8011eb:	c1 f8 05             	sar    eax,0x5
  8011ee:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8011f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011f4:	99                   	cdq    
  8011f5:	c1 ea 1b             	shr    edx,0x1b
  8011f8:	01 d0                	add    eax,edx
  8011fa:	83 e0 1f             	and    eax,0x1f
  8011fd:	29 d0                	sub    eax,edx
  8011ff:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  801202:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801205:	48 98                	cdqe   
  801207:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [rax*4+0x400120]
  80120e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801211:	be 01 00 00 00       	mov    esi,0x1
  801216:	89 c1                	mov    ecx,eax
  801218:	d3 e6                	shl    esi,cl
  80121a:	89 f0                	mov    eax,esi
  80121c:	f7 d0                	not    eax
  80121e:	21 c2                	and    edx,eax
  801220:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801223:	48 98                	cdqe   
  801225:	89 14 85 20 01 40 00 	mov    DWORD PTR [rax*4+0x400120],edx
}
  80122c:	90                   	nop
  80122d:	5d                   	pop    rbp
  80122e:	c3                   	ret    

000000000080122f <page_err>:
void page_err(){
  80122f:	f3 0f 1e fa          	endbr64 
  801233:	55                   	push   rbp
  801234:	48 89 e5             	mov    rbp,rsp
    asm("cli");
  801237:	fa                   	cli    
    print("page err");
  801238:	bf 47 17 81 00       	mov    edi,0x811747
  80123d:	e8 5b 48 00 00       	call   805a9d <print>
    while(1);
  801242:	eb fe                	jmp    801242 <page_err+0x13>

0000000000801244 <init_memory>:
    eoi();
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n leave\r\n add $8,%esp \r\n iretq");
}
void init_memory()
{
  801244:	f3 0f 1e fa          	endbr64 
  801248:	55                   	push   rbp
  801249:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<8;i++){
  80124c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801253:	eb 14                	jmp    801269 <init_memory+0x25>
        page_map[i]=0xffffffff;
  801255:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801258:	48 98                	cdqe   
  80125a:	c7 04 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],0xffffffff
  801261:	ff ff ff ff 
    for(int i=0;i<8;i++){
  801265:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801269:	83 7d fc 07          	cmp    DWORD PTR [rbp-0x4],0x7
  80126d:	7e e6                	jle    801255 <init_memory+0x11>
    剩下正常。
    asm volatile("mov ")
     */
    //page_index[768]=page_index[7];
    //page_index[7]=0;
}
  80126f:	90                   	nop
  801270:	90                   	nop
  801271:	5d                   	pop    rbp
  801272:	c3                   	ret    

0000000000801273 <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  801273:	f3 0f 1e fa          	endbr64 
  801277:	55                   	push   rbp
  801278:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  80127b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801282:	e9 8c 00 00 00       	jmp    801313 <req_a_page+0xa0>
        for(int j=0;j<32;j++){
  801287:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80128e:	eb 79                	jmp    801309 <req_a_page+0x96>
            unsigned int bit=page_map[i]&(1<<j);
  801290:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801293:	48 98                	cdqe   
  801295:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  80129c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80129f:	be 01 00 00 00       	mov    esi,0x1
  8012a4:	89 c1                	mov    ecx,eax
  8012a6:	d3 e6                	shl    esi,cl
  8012a8:	89 f0                	mov    eax,esi
  8012aa:	21 d0                	and    eax,edx
  8012ac:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  8012af:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012b2:	c1 e0 05             	shl    eax,0x5
  8012b5:	89 c2                	mov    edx,eax
  8012b7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8012ba:	01 d0                	add    eax,edx
  8012bc:	c1 e0 0c             	shl    eax,0xc
  8012bf:	3d ff ff 0f 00       	cmp    eax,0xfffff
  8012c4:	7e 3f                	jle    801305 <req_a_page+0x92>
  8012c6:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8012ca:	75 39                	jne    801305 <req_a_page+0x92>
            {
                page_map[i]=page_map[i]|(1<<j);
  8012cc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012cf:	48 98                	cdqe   
  8012d1:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  8012d8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8012db:	be 01 00 00 00       	mov    esi,0x1
  8012e0:	89 c1                	mov    ecx,eax
  8012e2:	d3 e6                	shl    esi,cl
  8012e4:	89 f0                	mov    eax,esi
  8012e6:	09 c2                	or     edx,eax
  8012e8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012eb:	48 98                	cdqe   
  8012ed:	89 14 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],edx
                return i*32+j;//num of page
  8012f4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012f7:	c1 e0 05             	shl    eax,0x5
  8012fa:	89 c2                	mov    edx,eax
  8012fc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8012ff:	01 d0                	add    eax,edx
  801301:	48 98                	cdqe   
  801303:	eb 18                	jmp    80131d <req_a_page+0xaa>
        for(int j=0;j<32;j++){
  801305:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801309:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80130d:	7e 81                	jle    801290 <req_a_page+0x1d>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  80130f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801313:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801317:	0f 8e 6a ff ff ff    	jle    801287 <req_a_page+0x14>

            }
        }
    }
}
  80131d:	5d                   	pop    rbp
  80131e:	c3                   	ret    

000000000080131f <free_page>:

int free_page(char *paddr){
  80131f:	f3 0f 1e fa          	endbr64 
  801323:	55                   	push   rbp
  801324:	48 89 e5             	mov    rbp,rsp
  801327:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  80132b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80132f:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801335:	85 c0                	test   eax,eax
  801337:	0f 48 c2             	cmovs  eax,edx
  80133a:	c1 f8 0c             	sar    eax,0xc
  80133d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  801340:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801343:	8d 50 1f             	lea    edx,[rax+0x1f]
  801346:	85 c0                	test   eax,eax
  801348:	0f 48 c2             	cmovs  eax,edx
  80134b:	c1 f8 05             	sar    eax,0x5
  80134e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  801351:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801354:	99                   	cdq    
  801355:	c1 ea 1b             	shr    edx,0x1b
  801358:	01 d0                	add    eax,edx
  80135a:	83 e0 1f             	and    eax,0x1f
  80135d:	29 d0                	sub    eax,edx
  80135f:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  801362:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801365:	48 98                	cdqe   
  801367:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  80136e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801371:	be 01 00 00 00       	mov    esi,0x1
  801376:	89 c1                	mov    ecx,eax
  801378:	d3 e6                	shl    esi,cl
  80137a:	89 f0                	mov    eax,esi
  80137c:	f7 d0                	not    eax
  80137e:	21 c2                	and    edx,eax
  801380:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801383:	48 98                	cdqe   
  801385:	89 14 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],edx
}
  80138c:	90                   	nop
  80138d:	5d                   	pop    rbp
  80138e:	c3                   	ret    

000000000080138f <check_page>:
int check_page(int num){
  80138f:	f3 0f 1e fa          	endbr64 
  801393:	55                   	push   rbp
  801394:	48 89 e5             	mov    rbp,rsp
  801397:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  80139a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80139d:	8d 50 1f             	lea    edx,[rax+0x1f]
  8013a0:	85 c0                	test   eax,eax
  8013a2:	0f 48 c2             	cmovs  eax,edx
  8013a5:	c1 f8 05             	sar    eax,0x5
  8013a8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  8013ab:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8013ae:	99                   	cdq    
  8013af:	c1 ea 1b             	shr    edx,0x1b
  8013b2:	01 d0                	add    eax,edx
  8013b4:	83 e0 1f             	and    eax,0x1f
  8013b7:	29 d0                	sub    eax,edx
  8013b9:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  8013bc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8013bf:	48 98                	cdqe   
  8013c1:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  8013c8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8013cb:	be 01 00 00 00       	mov    esi,0x1
  8013d0:	89 c1                	mov    ecx,eax
  8013d2:	d3 e6                	shl    esi,cl
  8013d4:	89 f0                	mov    eax,esi
  8013d6:	21 d0                	and    eax,edx
  8013d8:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  8013db:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  8013de:	5d                   	pop    rbp
  8013df:	c3                   	ret    

00000000008013e0 <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  8013e0:	f3 0f 1e fa          	endbr64 
  8013e4:	55                   	push   rbp
  8013e5:	48 89 e5             	mov    rbp,rsp
  8013e8:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  8013eb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8013ee:	c1 e0 0c             	shl    eax,0xc
}
  8013f1:	5d                   	pop    rbp
  8013f2:	c3                   	ret    

00000000008013f3 <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  8013f3:	f3 0f 1e fa          	endbr64 
  8013f7:	55                   	push   rbp
  8013f8:	48 89 e5             	mov    rbp,rsp
  8013fb:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8013ff:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  801402:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  801405:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801409:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  801410:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801414:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801417:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80141a:	89 c0                	mov    eax,eax
  80141c:	25 00 f0 ff ff       	and    eax,0xfffff000
  801421:	48 09 c2             	or     rdx,rax
  801424:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801428:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  80142b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80142f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801432:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801435:	48 98                	cdqe   
  801437:	48 09 c2             	or     rdx,rax
  80143a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80143e:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801441:	90                   	nop
  801442:	5d                   	pop    rbp
  801443:	c3                   	ret    

0000000000801444 <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  801444:	f3 0f 1e fa          	endbr64 
  801448:	55                   	push   rbp
  801449:	48 89 e5             	mov    rbp,rsp
  80144c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801450:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  801453:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  801456:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80145a:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  801461:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801465:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801468:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80146b:	0c 81                	or     al,0x81
  80146d:	89 c0                	mov    eax,eax
  80146f:	48 09 c2             	or     rdx,rax
  801472:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801476:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  801479:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80147c:	25 00 00 00 c0       	and    eax,0xc0000000
  801481:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  801484:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801488:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80148b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80148e:	48 09 c2             	or     rdx,rax
  801491:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801495:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801498:	90                   	nop
  801499:	5d                   	pop    rbp
  80149a:	c3                   	ret    

000000000080149b <set_2mb_pde>:
void set_2mb_pde(page_item* pde,int pa)
{
  80149b:	f3 0f 1e fa          	endbr64 
  80149f:	55                   	push   rbp
  8014a0:	48 89 e5             	mov    rbp,rsp
  8014a3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8014a7:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    *pde=0;
  8014aa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014ae:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT;
  8014b5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014b9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8014bc:	48 0d 81 10 00 00    	or     rax,0x1081
  8014c2:	48 89 c2             	mov    rdx,rax
  8014c5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014c9:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  8014cc:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8014cf:	25 00 00 c0 ff       	and    eax,0xffc00000
  8014d4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  8014d7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014db:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8014de:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014e1:	48 09 c2             	or     rdx,rax
  8014e4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014e8:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8014eb:	90                   	nop
  8014ec:	5d                   	pop    rbp
  8014ed:	c3                   	ret    

00000000008014ee <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  8014ee:	f3 0f 1e fa          	endbr64 
  8014f2:	55                   	push   rbp
  8014f3:	48 89 e5             	mov    rbp,rsp
  8014f6:	48 83 ec 20          	sub    rsp,0x20
  8014fa:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8014fe:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  801501:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  801506:	75 18                	jne    801520 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  801508:	b8 00 00 00 00       	mov    eax,0x0
  80150d:	e8 61 fd ff ff       	call   801273 <req_a_page>
  801512:	89 c7                	mov    edi,eax
  801514:	e8 c7 fe ff ff       	call   8013e0 <get_phyaddr>
  801519:	48 98                	cdqe   
  80151b:	e9 8e 00 00 00       	jmp    8015ae <req_page_at+0xc0>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  801520:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801524:	89 c2                	mov    edx,eax
  801526:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801529:	89 c6                	mov    esi,eax
  80152b:	89 d7                	mov    edi,edx
  80152d:	e8 3b 01 00 00       	call   80166d <is_pgs_ava>
  801532:	85 c0                	test   eax,eax
  801534:	75 09                	jne    80153f <req_page_at+0x51>
  801536:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80153d:	eb 6f                	jmp    8015ae <req_page_at+0xc0>
    int pgni=base/4096;
  80153f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801543:	48 c1 e8 0c          	shr    rax,0xc
  801547:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  80154a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80154d:	8d 50 1f             	lea    edx,[rax+0x1f]
  801550:	85 c0                	test   eax,eax
  801552:	0f 48 c2             	cmovs  eax,edx
  801555:	c1 f8 05             	sar    eax,0x5
  801558:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  80155b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80155e:	99                   	cdq    
  80155f:	c1 ea 1b             	shr    edx,0x1b
  801562:	01 d0                	add    eax,edx
  801564:	83 e0 1f             	and    eax,0x1f
  801567:	29 d0                	sub    eax,edx
  801569:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  80156c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801573:	eb 2c                	jmp    8015a1 <req_page_at+0xb3>
    {
        page_map[i]|=(1<<pgj);
  801575:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801578:	48 98                	cdqe   
  80157a:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  801581:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801584:	be 01 00 00 00       	mov    esi,0x1
  801589:	89 c1                	mov    ecx,eax
  80158b:	d3 e6                	shl    esi,cl
  80158d:	89 f0                	mov    eax,esi
  80158f:	09 c2                	or     edx,eax
  801591:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801594:	48 98                	cdqe   
  801596:	89 14 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],edx
    for(int i=0;i<pgn;i++)
  80159d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8015a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015a4:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8015a7:	7c cc                	jl     801575 <req_page_at+0x87>
    }
    return 0;
  8015a9:	b8 00 00 00 00       	mov    eax,0x0

}
  8015ae:	c9                   	leave  
  8015af:	c3                   	ret    

00000000008015b0 <chk_vm>:
int chk_vm(int base, int pgn)
{
  8015b0:	f3 0f 1e fa          	endbr64 
  8015b4:	55                   	push   rbp
  8015b5:	48 89 e5             	mov    rbp,rsp
  8015b8:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8015bb:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  8015be:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8015c5:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  8015c6:	0f 20 d8             	mov    rax,cr3
  8015c9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  8015cd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8015d0:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  8015d6:	85 c0                	test   eax,eax
  8015d8:	0f 48 c2             	cmovs  eax,edx
  8015db:	c1 f8 16             	sar    eax,0x16
  8015de:	48 98                	cdqe   
  8015e0:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8015e7:	00 
  8015e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8015ec:	48 01 d0             	add    rax,rdx
  8015ef:	8b 00                	mov    eax,DWORD PTR [rax]
  8015f1:	89 c0                	mov    eax,eax
  8015f3:	25 00 f0 ff ff       	and    eax,0xfffff000
  8015f8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  8015fc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8015ff:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  801605:	85 c0                	test   eax,eax
  801607:	0f 48 c2             	cmovs  eax,edx
  80160a:	c1 f8 16             	sar    eax,0x16
  80160d:	48 98                	cdqe   
  80160f:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801616:	00 
  801617:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80161b:	48 01 d0             	add    rax,rdx
  80161e:	8b 00                	mov    eax,DWORD PTR [rax]
  801620:	83 e0 01             	and    eax,0x1
  801623:	85 c0                	test   eax,eax
  801625:	74 38                	je     80165f <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  801627:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80162a:	99                   	cdq    
  80162b:	c1 ea 0a             	shr    edx,0xa
  80162e:	01 d0                	add    eax,edx
  801630:	25 ff ff 3f 00       	and    eax,0x3fffff
  801635:	29 d0                	sub    eax,edx
  801637:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80163d:	85 c0                	test   eax,eax
  80163f:	0f 48 c2             	cmovs  eax,edx
  801642:	c1 f8 0c             	sar    eax,0xc
  801645:	48 98                	cdqe   
  801647:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80164e:	00 
  80164f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801653:	48 01 d0             	add    rax,rdx
  801656:	8b 00                	mov    eax,DWORD PTR [rax]
  801658:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  80165b:	85 c0                	test   eax,eax
  80165d:	75 07                	jne    801666 <chk_vm+0xb6>
    {
        return -1;
  80165f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801664:	eb 05                	jmp    80166b <chk_vm+0xbb>
    }
    return 0;
  801666:	b8 00 00 00 00       	mov    eax,0x0
}
  80166b:	5d                   	pop    rbp
  80166c:	c3                   	ret    

000000000080166d <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  80166d:	f3 0f 1e fa          	endbr64 
  801671:	55                   	push   rbp
  801672:	48 89 e5             	mov    rbp,rsp
  801675:	48 83 ec 18          	sub    rsp,0x18
  801679:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80167c:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  80167f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801682:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801688:	85 c0                	test   eax,eax
  80168a:	0f 48 c2             	cmovs  eax,edx
  80168d:	c1 f8 0c             	sar    eax,0xc
  801690:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  801693:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80169a:	eb 1e                	jmp    8016ba <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  80169c:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80169f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016a2:	01 d0                	add    eax,edx
  8016a4:	89 c7                	mov    edi,eax
  8016a6:	e8 e4 fc ff ff       	call   80138f <check_page>
  8016ab:	85 c0                	test   eax,eax
  8016ad:	74 07                	je     8016b6 <is_pgs_ava+0x49>
  8016af:	b8 00 00 00 00       	mov    eax,0x0
  8016b4:	eb 11                	jmp    8016c7 <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  8016b6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8016ba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016bd:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  8016c0:	7c da                	jl     80169c <is_pgs_ava+0x2f>
    }
    return 1;
  8016c2:	b8 01 00 00 00       	mov    eax,0x1

}
  8016c7:	c9                   	leave  
  8016c8:	c3                   	ret    

00000000008016c9 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  8016c9:	f3 0f 1e fa          	endbr64 
  8016cd:	55                   	push   rbp
  8016ce:	48 89 e5             	mov    rbp,rsp
  8016d1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8016d5:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  8016d9:	c6 05 60 eb bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfeb60],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  8016e0:	c6 05 5a eb bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfeb5a],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  8016e7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8016eb:	48 89 05 56 eb bf ff 	mov    QWORD PTR [rip+0xffffffffffbfeb56],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  8016f2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8016f6:	48 89 05 53 eb bf ff 	mov    QWORD PTR [rip+0xffffffffffbfeb53],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  8016fd:	c7 05 59 eb bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfeb59],0x1        # 400260 <vols+0x20>
  801704:	00 00 00 
    return 0;
  801707:	b8 00 00 00 00       	mov    eax,0x0
}
  80170c:	5d                   	pop    rbp
  80170d:	c3                   	ret    

000000000080170e <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  80170e:	f3 0f 1e fa          	endbr64 
  801712:	55                   	push   rbp
  801713:	48 89 e5             	mov    rbp,rsp
  801716:	48 83 ec 20          	sub    rsp,0x20
  80171a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  80171d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801724:	eb 38                	jmp    80175e <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801726:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801729:	48 98                	cdqe   
  80172b:	48 c1 e0 04          	shl    rax,0x4
  80172f:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801735:	8b 00                	mov    eax,DWORD PTR [rax]
  801737:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80173a:	75 1e                	jne    80175a <sys_mkfifo+0x4c>
  80173c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80173f:	48 98                	cdqe   
  801741:	48 c1 e0 04          	shl    rax,0x4
  801745:	48 05 68 1e 40 00    	add    rax,0x401e68
  80174b:	8b 00                	mov    eax,DWORD PTR [rax]
  80174d:	83 f8 01             	cmp    eax,0x1
  801750:	75 08                	jne    80175a <sys_mkfifo+0x4c>
            return i;
  801752:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801755:	e9 a6 00 00 00       	jmp    801800 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  80175a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80175e:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801762:	7e c2                	jle    801726 <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  801764:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80176b:	e9 81 00 00 00       	jmp    8017f1 <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  801770:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801773:	48 98                	cdqe   
  801775:	48 c1 e0 04          	shl    rax,0x4
  801779:	48 05 68 1e 40 00    	add    rax,0x401e68
  80177f:	8b 00                	mov    eax,DWORD PTR [rax]
  801781:	85 c0                	test   eax,eax
  801783:	75 68                	jne    8017ed <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  801785:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801788:	48 98                	cdqe   
  80178a:	48 c1 e0 04          	shl    rax,0x4
  80178e:	48 05 68 1e 40 00    	add    rax,0x401e68
  801794:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  80179a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80179d:	48 98                	cdqe   
  80179f:	48 c1 e0 04          	shl    rax,0x4
  8017a3:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  8017aa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8017ad:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  8017af:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017b2:	48 98                	cdqe   
  8017b4:	48 c1 e0 04          	shl    rax,0x4
  8017b8:	48 05 64 1e 40 00    	add    rax,0x401e64
  8017be:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  8017c4:	b8 00 00 00 00       	mov    eax,0x0
  8017c9:	e8 a5 fa ff ff       	call   801273 <req_a_page>
  8017ce:	89 c7                	mov    edi,eax
  8017d0:	e8 0b fc ff ff       	call   8013e0 <get_phyaddr>
  8017d5:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8017d8:	48 63 d2             	movsxd rdx,edx
  8017db:	48 c1 e2 04          	shl    rdx,0x4
  8017df:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  8017e6:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  8017e8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017eb:	eb 13                	jmp    801800 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  8017ed:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8017f1:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  8017f5:	0f 8e 75 ff ff ff    	jle    801770 <sys_mkfifo+0x62>
        }
    }
    return -1;
  8017fb:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801800:	c9                   	leave  
  801801:	c3                   	ret    

0000000000801802 <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801802:	f3 0f 1e fa          	endbr64 
  801806:	55                   	push   rbp
  801807:	48 89 e5             	mov    rbp,rsp
  80180a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  80180d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801814:	eb 4a                	jmp    801860 <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801816:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801819:	48 98                	cdqe   
  80181b:	48 c1 e0 04          	shl    rax,0x4
  80181f:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801825:	8b 00                	mov    eax,DWORD PTR [rax]
  801827:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80182a:	75 30                	jne    80185c <sys_rmfifo+0x5a>
  80182c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80182f:	48 98                	cdqe   
  801831:	48 c1 e0 04          	shl    rax,0x4
  801835:	48 05 68 1e 40 00    	add    rax,0x401e68
  80183b:	8b 00                	mov    eax,DWORD PTR [rax]
  80183d:	83 f8 01             	cmp    eax,0x1
  801840:	75 1a                	jne    80185c <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801842:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801845:	48 98                	cdqe   
  801847:	48 c1 e0 04          	shl    rax,0x4
  80184b:	48 05 68 1e 40 00    	add    rax,0x401e68
  801851:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801857:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80185a:	eb 0f                	jmp    80186b <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  80185c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801860:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801864:	7e b0                	jle    801816 <sys_rmfifo+0x14>
        }
    }
    return -1;
  801866:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80186b:	5d                   	pop    rbp
  80186c:	c3                   	ret    

000000000080186d <free_vol>:
int free_vol(int voli)
{
  80186d:	f3 0f 1e fa          	endbr64 
  801871:	55                   	push   rbp
  801872:	48 89 e5             	mov    rbp,rsp
  801875:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801878:	c7 05 de e9 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe9de],0x0        # 400260 <vols+0x20>
  80187f:	00 00 00 
    return 0;
  801882:	b8 00 00 00 00       	mov    eax,0x0
}
  801887:	5d                   	pop    rbp
  801888:	c3                   	ret    

0000000000801889 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801889:	f3 0f 1e fa          	endbr64 
  80188d:	55                   	push   rbp
  80188e:	48 89 e5             	mov    rbp,rsp
  801891:	48 83 ec 20          	sub    rsp,0x20
  801895:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801898:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80189b:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  80189f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8018a6:	e9 d8 00 00 00       	jmp    801983 <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  8018ab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018ae:	48 63 d0             	movsxd rdx,eax
  8018b1:	48 89 d0             	mov    rax,rdx
  8018b4:	48 c1 e0 02          	shl    rax,0x2
  8018b8:	48 01 d0             	add    rax,rdx
  8018bb:	48 c1 e0 03          	shl    rax,0x3
  8018bf:	48 05 60 02 40 00    	add    rax,0x400260
  8018c5:	8b 00                	mov    eax,DWORD PTR [rax]
  8018c7:	85 c0                	test   eax,eax
  8018c9:	0f 85 b0 00 00 00    	jne    80197f <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  8018cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018d2:	48 63 d0             	movsxd rdx,eax
  8018d5:	48 89 d0             	mov    rax,rdx
  8018d8:	48 c1 e0 02          	shl    rax,0x2
  8018dc:	48 01 d0             	add    rax,rdx
  8018df:	48 c1 e0 03          	shl    rax,0x3
  8018e3:	48 05 60 02 40 00    	add    rax,0x400260
  8018e9:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  8018ef:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8018f2:	48 63 d0             	movsxd rdx,eax
  8018f5:	48 89 d0             	mov    rax,rdx
  8018f8:	48 01 c0             	add    rax,rax
  8018fb:	48 01 d0             	add    rax,rdx
  8018fe:	48 c1 e0 03          	shl    rax,0x3
  801902:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801909:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80190c:	48 63 d0             	movsxd rdx,eax
  80190f:	48 89 d0             	mov    rax,rdx
  801912:	48 c1 e0 02          	shl    rax,0x2
  801916:	48 01 d0             	add    rax,rdx
  801919:	48 c1 e0 03          	shl    rax,0x3
  80191d:	48 05 58 02 40 00    	add    rax,0x400258
  801923:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801926:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801929:	89 c7                	mov    edi,eax
  80192b:	e8 0b 1b 00 00       	call   80343b <get_drv>
  801930:	48 89 c2             	mov    rdx,rax
  801933:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801936:	48 63 c8             	movsxd rcx,eax
  801939:	48 89 c8             	mov    rax,rcx
  80193c:	48 c1 e0 02          	shl    rax,0x2
  801940:	48 01 c8             	add    rax,rcx
  801943:	48 c1 e0 03          	shl    rax,0x3
  801947:	48 05 48 02 40 00    	add    rax,0x400248
  80194d:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801950:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801953:	48 63 d0             	movsxd rdx,eax
  801956:	48 89 d0             	mov    rax,rdx
  801959:	48 c1 e0 02          	shl    rax,0x2
  80195d:	48 01 d0             	add    rax,rdx
  801960:	48 c1 e0 03          	shl    rax,0x3
  801964:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  80196b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80196f:	48 89 c6             	mov    rsi,rax
  801972:	48 89 d7             	mov    rdi,rdx
  801975:	e8 29 7b 00 00       	call   8094a3 <strcpy>
            return i;
  80197a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80197d:	eb 13                	jmp    801992 <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  80197f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801983:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801987:	0f 8e 1e ff ff ff    	jle    8018ab <reg_vol+0x22>
        }
    }
    return -1;
  80198d:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801992:	c9                   	leave  
  801993:	c3                   	ret    

0000000000801994 <sys_open>:
int sys_open(char *path, int mode)
{
  801994:	f3 0f 1e fa          	endbr64 
  801998:	55                   	push   rbp
  801999:	48 89 e5             	mov    rbp,rsp
  80199c:	53                   	push   rbx
  80199d:	48 81 ec 28 02 00 00 	sub    rsp,0x228
  8019a4:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
  8019ab:	89 b5 d4 fd ff ff    	mov    DWORD PTR [rbp-0x22c],esi
    {

    }
    //根据文件路径找到相应的卷
    char volname[26];
    int i=0,rec=0;
  8019b1:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8019b8:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
    for(;path[i]!='/'&&i<26;i++)
  8019bf:	eb 20                	jmp    8019e1 <sys_open+0x4d>
        volname[i]=path[i];
  8019c1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8019c4:	48 63 d0             	movsxd rdx,eax
  8019c7:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  8019ce:	48 01 d0             	add    rax,rdx
  8019d1:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8019d4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8019d7:	48 98                	cdqe   
  8019d9:	88 54 05 c0          	mov    BYTE PTR [rbp+rax*1-0x40],dl
    for(;path[i]!='/'&&i<26;i++)
  8019dd:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8019e1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8019e4:	48 63 d0             	movsxd rdx,eax
  8019e7:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  8019ee:	48 01 d0             	add    rax,rdx
  8019f1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8019f4:	3c 2f                	cmp    al,0x2f
  8019f6:	74 06                	je     8019fe <sys_open+0x6a>
  8019f8:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  8019fc:	7e c3                	jle    8019c1 <sys_open+0x2d>
    volname[i]='\0';
  8019fe:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a01:	48 98                	cdqe   
  801a03:	c6 44 05 c0 00       	mov    BYTE PTR [rbp+rax*1-0x40],0x0
    if(!path[i+1])
  801a08:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a0b:	48 98                	cdqe   
  801a0d:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801a11:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801a18:	48 01 d0             	add    rax,rdx
  801a1b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801a1e:	84 c0                	test   al,al
  801a20:	75 0a                	jne    801a2c <sys_open+0x98>
        return -2;//是根目录
  801a22:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  801a27:	e9 2b 04 00 00       	jmp    801e57 <sys_open+0x4c3>
    rec=i;
  801a2c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a2f:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(i=0;i<MAX_VOLUMES;i++)
  801a32:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801a39:	eb 52                	jmp    801a8d <sys_open+0xf9>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801a3b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a3e:	48 63 d0             	movsxd rdx,eax
  801a41:	48 89 d0             	mov    rax,rdx
  801a44:	48 c1 e0 02          	shl    rax,0x2
  801a48:	48 01 d0             	add    rax,rdx
  801a4b:	48 c1 e0 03          	shl    rax,0x3
  801a4f:	48 05 60 02 40 00    	add    rax,0x400260
  801a55:	8b 00                	mov    eax,DWORD PTR [rax]
  801a57:	85 c0                	test   eax,eax
  801a59:	74 2e                	je     801a89 <sys_open+0xf5>
        (strcmp(vols[i].name,volname)==0))
  801a5b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a5e:	48 63 d0             	movsxd rdx,eax
  801a61:	48 89 d0             	mov    rax,rdx
  801a64:	48 c1 e0 02          	shl    rax,0x2
  801a68:	48 01 d0             	add    rax,rdx
  801a6b:	48 c1 e0 03          	shl    rax,0x3
  801a6f:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801a76:	48 8d 45 c0          	lea    rax,[rbp-0x40]
  801a7a:	48 89 c6             	mov    rsi,rax
  801a7d:	48 89 d7             	mov    rdi,rdx
  801a80:	e8 be 7b 00 00       	call   809643 <strcmp>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801a85:	85 c0                	test   eax,eax
  801a87:	74 0c                	je     801a95 <sys_open+0x101>
    for(i=0;i<MAX_VOLUMES;i++)
  801a89:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801a8d:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801a91:	7e a8                	jle    801a3b <sys_open+0xa7>
  801a93:	eb 01                	jmp    801a96 <sys_open+0x102>
            break;
  801a95:	90                   	nop
    if(i==MAX_VOLUMES)return -1;
  801a96:	83 7d ec 1a          	cmp    DWORD PTR [rbp-0x14],0x1a
  801a9a:	75 0a                	jne    801aa6 <sys_open+0x112>
  801a9c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801aa1:	e9 b1 03 00 00       	jmp    801e57 <sys_open+0x4c3>
    driver_args arg={
  801aa6:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  801aad:	b8 00 00 00 00       	mov    eax,0x0
  801ab2:	b9 17 00 00 00       	mov    ecx,0x17
  801ab7:	48 89 d7             	mov    rdi,rdx
  801aba:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  801abd:	48 89 fa             	mov    rdx,rdi
  801ac0:	89 02                	mov    DWORD PTR [rdx],eax
  801ac2:	48 83 c2 04          	add    rdx,0x4
            .path=path+rec+1
  801ac6:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801ac9:	48 98                	cdqe   
  801acb:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801acf:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801ad6:	48 01 d0             	add    rax,rdx
    driver_args arg={
  801ad9:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    vfs_dir_entry dir;
    vfs_dir_entry res;
    int voln=i;
  801ae0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ae3:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    if(vols[i].fs->find(path+rec+1,dir,&res)==-1)//找不到文件 ((driver*)vols[i].fs_drv)->find(&arg)==-1
  801ae6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ae9:	48 63 d0             	movsxd rdx,eax
  801aec:	48 89 d0             	mov    rax,rdx
  801aef:	48 c1 e0 02          	shl    rax,0x2
  801af3:	48 01 d0             	add    rax,rdx
  801af6:	48 c1 e0 03          	shl    rax,0x3
  801afa:	48 05 58 02 40 00    	add    rax,0x400258
  801b00:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801b03:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  801b07:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801b0a:	48 98                	cdqe   
  801b0c:	48 8d 48 01          	lea    rcx,[rax+0x1]
  801b10:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801b17:	48 01 c1             	add    rcx,rax
  801b1a:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
  801b21:	ff b5 f8 fe ff ff    	push   QWORD PTR [rbp-0x108]
  801b27:	ff b5 f0 fe ff ff    	push   QWORD PTR [rbp-0x110]
  801b2d:	ff b5 e8 fe ff ff    	push   QWORD PTR [rbp-0x118]
  801b33:	ff b5 e0 fe ff ff    	push   QWORD PTR [rbp-0x120]
  801b39:	ff b5 d8 fe ff ff    	push   QWORD PTR [rbp-0x128]
  801b3f:	ff b5 d0 fe ff ff    	push   QWORD PTR [rbp-0x130]
  801b45:	ff b5 c8 fe ff ff    	push   QWORD PTR [rbp-0x138]
  801b4b:	ff b5 c0 fe ff ff    	push   QWORD PTR [rbp-0x140]
  801b51:	ff b5 b8 fe ff ff    	push   QWORD PTR [rbp-0x148]
  801b57:	ff b5 b0 fe ff ff    	push   QWORD PTR [rbp-0x150]
  801b5d:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
  801b63:	ff b5 a0 fe ff ff    	push   QWORD PTR [rbp-0x160]
  801b69:	48 89 c6             	mov    rsi,rax
  801b6c:	48 89 cf             	mov    rdi,rcx
  801b6f:	ff d2                	call   rdx
  801b71:	48 83 c4 60          	add    rsp,0x60
  801b75:	83 f8 ff             	cmp    eax,0xffffffff
  801b78:	75 49                	jne    801bc3 <sys_open+0x22f>
    {
        if(mode&FILE_MODE_WRITE) {
  801b7a:	8b 85 d4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x22c]
  801b80:	83 e0 02             	and    eax,0x2
  801b83:	85 c0                	test   eax,eax
  801b85:	74 32                	je     801bb9 <sys_open+0x225>
            return ((driver *) vols[i].fs_drv)->touch(&arg);//这里之后要改
  801b87:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b8a:	48 63 d0             	movsxd rdx,eax
  801b8d:	48 89 d0             	mov    rax,rdx
  801b90:	48 c1 e0 02          	shl    rax,0x2
  801b94:	48 01 d0             	add    rax,rdx
  801b97:	48 c1 e0 03          	shl    rax,0x3
  801b9b:	48 05 50 02 40 00    	add    rax,0x400250
  801ba1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801ba4:	48 8b 50 4c          	mov    rdx,QWORD PTR [rax+0x4c]
  801ba8:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  801baf:	48 89 c7             	mov    rdi,rax
  801bb2:	ff d2                	call   rdx
  801bb4:	e9 9e 02 00 00       	jmp    801e57 <sys_open+0x4c3>
        }else
            return -1;
  801bb9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801bbe:	e9 94 02 00 00       	jmp    801e57 <sys_open+0x4c3>
    }
    vfs_dir_entry entry=res;//=arg.entry;
  801bc3:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
  801bca:	48 8b 95 48 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b8]
  801bd1:	48 89 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rax
  801bd8:	48 89 95 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdx
  801bdf:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
  801be6:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
  801bed:	48 89 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],rax
  801bf4:	48 89 95 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],rdx
  801bfb:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
  801c02:	48 8b 95 68 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x198]
  801c09:	48 89 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],rax
  801c10:	48 89 95 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],rdx
  801c17:	48 8b 85 70 fe ff ff 	mov    rax,QWORD PTR [rbp-0x190]
  801c1e:	48 8b 95 78 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x188]
  801c25:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
  801c2c:	48 89 95 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdx
  801c33:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
  801c3a:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
  801c41:	48 89 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rax
  801c48:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
  801c4f:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
  801c56:	48 8b 95 98 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x168]
  801c5d:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
  801c64:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
    int j=-1;
  801c6b:	c7 45 e8 ff ff ff ff 	mov    DWORD PTR [rbp-0x18],0xffffffff
    for(i=0;i<MAX_OPEN_FILES;i++)
  801c72:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801c79:	eb 5c                	jmp    801cd7 <sys_open+0x343>
    {
        if(opened[i].voln==voln&&opened[i].id==entry.id)
  801c7b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c7e:	48 63 d0             	movsxd rdx,eax
  801c81:	48 89 d0             	mov    rax,rdx
  801c84:	48 01 c0             	add    rax,rax
  801c87:	48 01 d0             	add    rax,rdx
  801c8a:	48 c1 e0 05          	shl    rax,0x5
  801c8e:	48 05 68 06 40 00    	add    rax,0x400668
  801c94:	8b 00                	mov    eax,DWORD PTR [rax]
  801c96:	39 45 e0             	cmp    DWORD PTR [rbp-0x20],eax
  801c99:	75 38                	jne    801cd3 <sys_open+0x33f>
  801c9b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c9e:	48 63 d0             	movsxd rdx,eax
  801ca1:	48 89 d0             	mov    rax,rdx
  801ca4:	48 01 c0             	add    rax,rax
  801ca7:	48 01 d0             	add    rax,rdx
  801caa:	48 c1 e0 05          	shl    rax,0x5
  801cae:	48 05 74 06 40 00    	add    rax,0x400674
  801cb4:	8b 10                	mov    edx,DWORD PTR [rax]
  801cb6:	8b 85 f4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x20c]
  801cbc:	39 c2                	cmp    edx,eax
  801cbe:	75 13                	jne    801cd3 <sys_open+0x33f>
        {
            if(mode==FILE_MODE_WRITE)
  801cc0:	83 bd d4 fd ff ff 02 	cmp    DWORD PTR [rbp-0x22c],0x2
  801cc7:	75 0a                	jne    801cd3 <sys_open+0x33f>
            {
                return -1;//读模式会重新给一个fno但是指向同一个文件
  801cc9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801cce:	e9 84 01 00 00       	jmp    801e57 <sys_open+0x4c3>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801cd3:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801cd7:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801cdb:	7e 9e                	jle    801c7b <sys_open+0x2e7>
            }
        }
    }
    for(i=0;i<MAX_OPEN_FILES;i++)
  801cdd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801ce4:	eb 2b                	jmp    801d11 <sys_open+0x37d>
    {
        if(!opened[i].mode) {
  801ce6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ce9:	48 63 d0             	movsxd rdx,eax
  801cec:	48 89 d0             	mov    rax,rdx
  801cef:	48 01 c0             	add    rax,rax
  801cf2:	48 01 d0             	add    rax,rdx
  801cf5:	48 c1 e0 05          	shl    rax,0x5
  801cf9:	48 05 64 06 40 00    	add    rax,0x400664
  801cff:	8b 00                	mov    eax,DWORD PTR [rax]
  801d01:	85 c0                	test   eax,eax
  801d03:	75 08                	jne    801d0d <sys_open+0x379>
            j = i;
  801d05:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d08:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            break;
  801d0b:	eb 0a                	jmp    801d17 <sys_open+0x383>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801d0d:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801d11:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801d15:	7e cf                	jle    801ce6 <sys_open+0x352>
        }
    }
    if(j==-1)return -1;
  801d17:	83 7d e8 ff          	cmp    DWORD PTR [rbp-0x18],0xffffffff
  801d1b:	75 0a                	jne    801d27 <sys_open+0x393>
  801d1d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801d22:	e9 30 01 00 00       	jmp    801e57 <sys_open+0x4c3>
    opened[j]=entry;
  801d27:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801d2a:	48 63 d0             	movsxd rdx,eax
  801d2d:	48 89 d0             	mov    rax,rdx
  801d30:	48 01 c0             	add    rax,rax
  801d33:	48 01 d0             	add    rax,rdx
  801d36:	48 c1 e0 05          	shl    rax,0x5
  801d3a:	48 05 60 06 40 00    	add    rax,0x400660
  801d40:	48 8b 8d e0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x220]
  801d47:	48 8b 9d e8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x218]
  801d4e:	48 89 08             	mov    QWORD PTR [rax],rcx
  801d51:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
  801d55:	48 8b 8d f0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x210]
  801d5c:	48 8b 9d f8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x208]
  801d63:	48 89 48 10          	mov    QWORD PTR [rax+0x10],rcx
  801d67:	48 89 58 18          	mov    QWORD PTR [rax+0x18],rbx
  801d6b:	48 8b 8d 00 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x200]
  801d72:	48 8b 9d 08 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1f8]
  801d79:	48 89 48 20          	mov    QWORD PTR [rax+0x20],rcx
  801d7d:	48 89 58 28          	mov    QWORD PTR [rax+0x28],rbx
  801d81:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
  801d88:	48 8b 9d 18 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1e8]
  801d8f:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
  801d93:	48 89 58 38          	mov    QWORD PTR [rax+0x38],rbx
  801d97:	48 8b 8d 20 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e0]
  801d9e:	48 8b 9d 28 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1d8]
  801da5:	48 89 48 40          	mov    QWORD PTR [rax+0x40],rcx
  801da9:	48 89 58 48          	mov    QWORD PTR [rax+0x48],rbx
  801dad:	48 8b 8d 30 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1d0]
  801db4:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
  801dbb:	48 89 48 50          	mov    QWORD PTR [rax+0x50],rcx
  801dbf:	48 89 58 58          	mov    QWORD PTR [rax+0x58],rbx
    opened[j].fno=i;
  801dc3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801dc6:	48 63 d0             	movsxd rdx,eax
  801dc9:	48 89 d0             	mov    rax,rdx
  801dcc:	48 01 c0             	add    rax,rax
  801dcf:	48 01 d0             	add    rax,rdx
  801dd2:	48 c1 e0 05          	shl    rax,0x5
  801dd6:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  801ddd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801de0:	89 02                	mov    DWORD PTR [rdx],eax
    opened[j].link_c++;
  801de2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801de5:	48 63 d0             	movsxd rdx,eax
  801de8:	48 89 d0             	mov    rax,rdx
  801deb:	48 01 c0             	add    rax,rax
  801dee:	48 01 d0             	add    rax,rdx
  801df1:	48 c1 e0 05          	shl    rax,0x5
  801df5:	48 05 6c 06 40 00    	add    rax,0x40066c
  801dfb:	8b 00                	mov    eax,DWORD PTR [rax]
  801dfd:	8d 48 01             	lea    ecx,[rax+0x1]
  801e00:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801e03:	48 63 d0             	movsxd rdx,eax
  801e06:	48 89 d0             	mov    rax,rdx
  801e09:	48 01 c0             	add    rax,rax
  801e0c:	48 01 d0             	add    rax,rdx
  801e0f:	48 c1 e0 05          	shl    rax,0x5
  801e13:	48 05 6c 06 40 00    	add    rax,0x40066c
  801e19:	89 08                	mov    DWORD PTR [rax],ecx
    add_proc_openf(&opened[j]);
  801e1b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801e1e:	48 63 d0             	movsxd rdx,eax
  801e21:	48 89 d0             	mov    rax,rdx
  801e24:	48 01 c0             	add    rax,rax
  801e27:	48 01 d0             	add    rax,rdx
  801e2a:	48 c1 e0 05          	shl    rax,0x5
  801e2e:	48 05 60 06 40 00    	add    rax,0x400660
  801e34:	48 89 c7             	mov    rdi,rax
  801e37:	e8 17 26 00 00       	call   804453 <add_proc_openf>
    return opened[j].fno;
  801e3c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801e3f:	48 63 d0             	movsxd rdx,eax
  801e42:	48 89 d0             	mov    rax,rdx
  801e45:	48 01 c0             	add    rax,rax
  801e48:	48 01 d0             	add    rax,rdx
  801e4b:	48 c1 e0 05          	shl    rax,0x5
  801e4f:	48 05 60 06 40 00    	add    rax,0x400660
  801e55:	8b 00                	mov    eax,DWORD PTR [rax]
}
  801e57:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  801e5b:	c9                   	leave  
  801e5c:	c3                   	ret    

0000000000801e5d <sys_close>:
int sys_close(int fno)
{
  801e5d:	f3 0f 1e fa          	endbr64 
  801e61:	55                   	push   rbp
  801e62:	48 89 e5             	mov    rbp,rsp
  801e65:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801e68:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801e6f:	eb 64                	jmp    801ed5 <sys_close+0x78>
    {
        if(opened[i].fno==fno)
  801e71:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e74:	48 63 d0             	movsxd rdx,eax
  801e77:	48 89 d0             	mov    rax,rdx
  801e7a:	48 01 c0             	add    rax,rax
  801e7d:	48 01 d0             	add    rax,rdx
  801e80:	48 c1 e0 05          	shl    rax,0x5
  801e84:	48 05 60 06 40 00    	add    rax,0x400660
  801e8a:	8b 00                	mov    eax,DWORD PTR [rax]
  801e8c:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801e8f:	75 40                	jne    801ed1 <sys_close+0x74>
        {
            opened[i].link_c--;
  801e91:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801e94:	48 63 d0             	movsxd rdx,eax
  801e97:	48 89 d0             	mov    rax,rdx
  801e9a:	48 01 c0             	add    rax,rax
  801e9d:	48 01 d0             	add    rax,rdx
  801ea0:	48 c1 e0 05          	shl    rax,0x5
  801ea4:	48 05 6c 06 40 00    	add    rax,0x40066c
  801eaa:	8b 00                	mov    eax,DWORD PTR [rax]
  801eac:	8d 48 ff             	lea    ecx,[rax-0x1]
  801eaf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801eb2:	48 63 d0             	movsxd rdx,eax
  801eb5:	48 89 d0             	mov    rax,rdx
  801eb8:	48 01 c0             	add    rax,rax
  801ebb:	48 01 d0             	add    rax,rdx
  801ebe:	48 c1 e0 05          	shl    rax,0x5
  801ec2:	48 05 6c 06 40 00    	add    rax,0x40066c
  801ec8:	89 08                	mov    DWORD PTR [rax],ecx
            return 0;
  801eca:	b8 00 00 00 00       	mov    eax,0x0
  801ecf:	eb 0f                	jmp    801ee0 <sys_close+0x83>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801ed1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801ed5:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801ed9:	7e 96                	jle    801e71 <sys_close+0x14>
        }
    }
    return -1;
  801edb:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801ee0:	5d                   	pop    rbp
  801ee1:	c3                   	ret    

0000000000801ee2 <sys_write>:
int sys_write(int fno, char *src, int len)
{
  801ee2:	f3 0f 1e fa          	endbr64 
  801ee6:	55                   	push   rbp
  801ee7:	48 89 e5             	mov    rbp,rsp
  801eea:	48 83 ec 20          	sub    rsp,0x20
  801eee:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801ef1:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  801ef5:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  801ef8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801efb:	89 c7                	mov    edi,eax
  801efd:	e8 7d 01 00 00       	call   80207f <get_vfs_entry>
  801f02:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  801f06:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  801f0b:	75 07                	jne    801f14 <sys_write+0x32>
  801f0d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801f12:	eb 5d                	jmp    801f71 <sys_write+0x8f>
    if(f->type==FTYPE_REG)
  801f14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f18:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  801f1b:	85 c0                	test   eax,eax
  801f1d:	75 18                	jne    801f37 <sys_write+0x55>
    {
        return vfs_write_file(f,src,len);
  801f1f:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  801f22:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  801f26:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f2a:	48 89 ce             	mov    rsi,rcx
  801f2d:	48 89 c7             	mov    rdi,rax
  801f30:	e8 67 03 00 00       	call   80229c <vfs_write_file>
  801f35:	eb 3a                	jmp    801f71 <sys_write+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  801f37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f3b:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  801f3e:	83 f8 01             	cmp    eax,0x1
  801f41:	75 29                	jne    801f6c <sys_write+0x8a>
    {
        int block=get_according_bnr(f);
  801f43:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f47:	48 89 c7             	mov    rdi,rax
  801f4a:	e8 5b 04 00 00       	call   8023aa <get_according_bnr>
  801f4f:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return write_block(f->dev,block,src,len);
  801f52:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f56:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801f59:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  801f5c:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  801f60:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  801f63:	89 c7                	mov    edi,eax
  801f65:	e8 24 08 00 00       	call   80278e <write_block>
  801f6a:	eb 05                	jmp    801f71 <sys_write+0x8f>
    }
    return -1;
  801f6c:	b8 ff ff ff ff       	mov    eax,0xffffffff
            .src_addr=src,
            .len=len,
            .pos=pos
    };
    return ((driver*)vols[f->voln].fs_drv)->write(&args); */
}
  801f71:	c9                   	leave  
  801f72:	c3                   	ret    

0000000000801f73 <sys_read>:
int sys_read(int fno, char *dist,  int len)
{
  801f73:	f3 0f 1e fa          	endbr64 
  801f77:	55                   	push   rbp
  801f78:	48 89 e5             	mov    rbp,rsp
  801f7b:	48 83 ec 20          	sub    rsp,0x20
  801f7f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801f82:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  801f86:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  801f89:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f8c:	89 c7                	mov    edi,eax
  801f8e:	e8 ec 00 00 00       	call   80207f <get_vfs_entry>
  801f93:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  801f97:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  801f9c:	75 07                	jne    801fa5 <sys_read+0x32>
  801f9e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801fa3:	eb 5d                	jmp    802002 <sys_read+0x8f>
    if(f->type==FTYPE_REG)
  801fa5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fa9:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  801fac:	85 c0                	test   eax,eax
  801fae:	75 18                	jne    801fc8 <sys_read+0x55>
    {
        return vfs_read_file(f,dist,len);
  801fb0:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  801fb3:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  801fb7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fbb:	48 89 ce             	mov    rsi,rcx
  801fbe:	48 89 c7             	mov    rdi,rax
  801fc1:	e8 37 02 00 00       	call   8021fd <vfs_read_file>
  801fc6:	eb 3a                	jmp    802002 <sys_read+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  801fc8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fcc:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  801fcf:	83 f8 01             	cmp    eax,0x1
  801fd2:	75 29                	jne    801ffd <sys_read+0x8a>
    {
        int block=get_according_bnr(f);
  801fd4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fd8:	48 89 c7             	mov    rdi,rax
  801fdb:	e8 ca 03 00 00       	call   8023aa <get_according_bnr>
  801fe0:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return read_block(f->dev,block,dist,len);
  801fe3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fe7:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801fea:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  801fed:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  801ff1:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  801ff4:	89 c7                	mov    edi,eax
  801ff6:	e8 10 08 00 00       	call   80280b <read_block>
  801ffb:	eb 05                	jmp    802002 <sys_read+0x8f>
    }
    return -1;
  801ffd:	b8 ff ff ff ff       	mov    eax,0xffffffff
    //         .len=len,
    //         .pos=pos,
    //         .entry=*f
    // };
    // return ((driver*)vols[f->voln].fs_drv)->read(&args);
}
  802002:	c9                   	leave  
  802003:	c3                   	ret    

0000000000802004 <sys_seek>:
int sys_seek(int fno, int offset, int origin)
{
  802004:	f3 0f 1e fa          	endbr64 
  802008:	55                   	push   rbp
  802009:	48 89 e5             	mov    rbp,rsp
  80200c:	48 83 ec 20          	sub    rsp,0x20
  802010:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802013:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802016:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  802019:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80201c:	89 c7                	mov    edi,eax
  80201e:	e8 5c 00 00 00       	call   80207f <get_vfs_entry>
  802023:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  802027:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80202c:	75 07                	jne    802035 <sys_seek+0x31>
  80202e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802033:	eb 14                	jmp    802049 <sys_seek+0x45>
    f->ptr=offset+origin;
  802035:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802038:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80203b:	01 c2                	add    edx,eax
  80203d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802041:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
    return 0;
  802044:	b8 00 00 00 00       	mov    eax,0x0
}
  802049:	c9                   	leave  
  80204a:	c3                   	ret    

000000000080204b <sys_tell>:
int sys_tell(int fno)
{
  80204b:	f3 0f 1e fa          	endbr64 
  80204f:	55                   	push   rbp
  802050:	48 89 e5             	mov    rbp,rsp
  802053:	48 83 ec 20          	sub    rsp,0x20
  802057:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    vfs_dir_entry *f= get_vfs_entry(fno);
  80205a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80205d:	89 c7                	mov    edi,eax
  80205f:	e8 1b 00 00 00       	call   80207f <get_vfs_entry>
  802064:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  802068:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80206d:	75 07                	jne    802076 <sys_tell+0x2b>
  80206f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802074:	eb 07                	jmp    80207d <sys_tell+0x32>
    return f->ptr;
  802076:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80207a:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  80207d:	c9                   	leave  
  80207e:	c3                   	ret    

000000000080207f <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  80207f:	f3 0f 1e fa          	endbr64 
  802083:	55                   	push   rbp
  802084:	48 89 e5             	mov    rbp,rsp
  802087:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  80208a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802091:	eb 3f                	jmp    8020d2 <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  802093:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802096:	48 63 d0             	movsxd rdx,eax
  802099:	48 89 d0             	mov    rax,rdx
  80209c:	48 01 c0             	add    rax,rax
  80209f:	48 01 d0             	add    rax,rdx
  8020a2:	48 c1 e0 05          	shl    rax,0x5
  8020a6:	48 05 60 06 40 00    	add    rax,0x400660
  8020ac:	8b 00                	mov    eax,DWORD PTR [rax]
  8020ae:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8020b1:	75 1b                	jne    8020ce <get_vfs_entry+0x4f>
        {
            return &opened[i];
  8020b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020b6:	48 63 d0             	movsxd rdx,eax
  8020b9:	48 89 d0             	mov    rax,rdx
  8020bc:	48 01 c0             	add    rax,rax
  8020bf:	48 01 d0             	add    rax,rdx
  8020c2:	48 c1 e0 05          	shl    rax,0x5
  8020c6:	48 05 60 06 40 00    	add    rax,0x400660
  8020cc:	eb 0f                	jmp    8020dd <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  8020ce:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8020d2:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8020d6:	7e bb                	jle    802093 <get_vfs_entry+0x14>
        }
    }
    return NULL;
  8020d8:	b8 00 00 00 00       	mov    eax,0x0
}
  8020dd:	5d                   	pop    rbp
  8020de:	c3                   	ret    

00000000008020df <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  8020df:	f3 0f 1e fa          	endbr64 
  8020e3:	55                   	push   rbp
  8020e4:	48 89 e5             	mov    rbp,rsp
  8020e7:	48 83 ec 10          	sub    rsp,0x10
  8020eb:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  8020ef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020f3:	48 89 c7             	mov    rdi,rax
  8020f6:	e8 a0 04 00 00       	call   80259b <wait_on_buf>
    if(bh->b_count==0)return -1;
  8020fb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020ff:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  802103:	84 c0                	test   al,al
  802105:	75 07                	jne    80210e <brelse+0x2f>
  802107:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80210c:	eb 32                	jmp    802140 <brelse+0x61>
    bh->b_count--;
  80210e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802112:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  802116:	8d 50 ff             	lea    edx,[rax-0x1]
  802119:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80211d:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  802120:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802124:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  802128:	84 c0                	test   al,al
  80212a:	75 0f                	jne    80213b <brelse+0x5c>
        vmfree(bh->b_data);
  80212c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802130:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802133:	48 89 c7             	mov    rdi,rax
  802136:	e8 8e f0 ff ff       	call   8011c9 <vmfree>
    return 0;
  80213b:	b8 00 00 00 00       	mov    eax,0x0
}
  802140:	c9                   	leave  
  802141:	c3                   	ret    

0000000000802142 <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  802142:	f3 0f 1e fa          	endbr64 
  802146:	55                   	push   rbp
  802147:	48 89 e5             	mov    rbp,rsp
  80214a:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  802151:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  802157:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  80215d:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  802163:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  802169:	89 d6                	mov    esi,edx
  80216b:	89 c7                	mov    edi,eax
  80216d:	e8 78 02 00 00       	call   8023ea <get_buf>
  802172:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  802176:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80217b:	75 09                	jne    802186 <bread+0x44>
  80217d:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  802184:	eb 75                	jmp    8021fb <bread+0xb9>
    if(!bh->b_uptodate)
  802186:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80218a:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  80218e:	84 c0                	test   al,al
  802190:	75 65                	jne    8021f7 <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  802192:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  802198:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  80219b:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  8021a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021a6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8021a9:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  8021af:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  8021b6:	02 00 00 
        arg.lba=bh->b_blocknr;
  8021b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021bd:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8021c1:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  8021c7:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  8021ce:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  8021d1:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  8021d8:	48 89 c7             	mov    rdi,rax
  8021db:	e8 82 12 00 00       	call   803462 <make_request>
  8021e0:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  8021e3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8021e6:	89 c7                	mov    edi,eax
  8021e8:	e8 88 15 00 00       	call   803775 <wait_on_req>
        clear_req(reqi);
  8021ed:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8021f0:	89 c7                	mov    edi,eax
  8021f2:	e8 ae 15 00 00       	call   8037a5 <clear_req>
    }
    return bh;
  8021f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8021fb:	c9                   	leave  
  8021fc:	c3                   	ret    

00000000008021fd <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  8021fd:	f3 0f 1e fa          	endbr64 
  802201:	55                   	push   rbp
  802202:	48 89 e5             	mov    rbp,rsp
  802205:	48 83 ec 40          	sub    rsp,0x40
  802209:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80220d:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  802211:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  802214:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802218:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  80221b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  80221e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802222:	48 89 c7             	mov    rdi,rax
  802225:	e8 80 01 00 00       	call   8023aa <get_according_bnr>
  80222a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  80222d:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  802230:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802233:	89 d6                	mov    esi,edx
  802235:	89 c7                	mov    edi,eax
  802237:	e8 06 ff ff ff       	call   802142 <bread>
  80223c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802240:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802243:	ba 00 02 00 00       	mov    edx,0x200
  802248:	39 d0                	cmp    eax,edx
  80224a:	0f 4f c2             	cmovg  eax,edx
  80224d:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  802250:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  802253:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802257:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80225a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80225e:	48 89 ce             	mov    rsi,rcx
  802261:	48 89 c7             	mov    rdi,rax
  802264:	e8 3c 71 00 00       	call   8093a5 <memcpy>
        len-=BLOCK_SIZE;
  802269:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  802270:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802274:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802277:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80227a:	01 c2                	add    edx,eax
  80227c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802280:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  802283:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802287:	48 89 c7             	mov    rdi,rax
  80228a:	e8 50 fe ff ff       	call   8020df <brelse>
    }while(len>0);
  80228f:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  802293:	7f 89                	jg     80221e <vfs_read_file+0x21>
    return 0;
  802295:	b8 00 00 00 00       	mov    eax,0x0
}
  80229a:	c9                   	leave  
  80229b:	c3                   	ret    

000000000080229c <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  80229c:	f3 0f 1e fa          	endbr64 
  8022a0:	55                   	push   rbp
  8022a1:	48 89 e5             	mov    rbp,rsp
  8022a4:	48 83 ec 40          	sub    rsp,0x40
  8022a8:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  8022ac:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  8022b0:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  8022b3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8022b7:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8022ba:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  8022bd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8022c1:	48 89 c7             	mov    rdi,rax
  8022c4:	e8 e1 00 00 00       	call   8023aa <get_according_bnr>
  8022c9:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  8022cc:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8022cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8022d2:	89 d6                	mov    esi,edx
  8022d4:	89 c7                	mov    edi,eax
  8022d6:	e8 0f 01 00 00       	call   8023ea <get_buf>
  8022db:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8022df:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8022e2:	ba 00 02 00 00       	mov    edx,0x200
  8022e7:	39 d0                	cmp    eax,edx
  8022e9:	0f 4f c2             	cmovg  eax,edx
  8022ec:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  8022ef:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8022f2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8022f6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8022f9:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  8022fd:	48 89 ce             	mov    rsi,rcx
  802300:	48 89 c7             	mov    rdi,rax
  802303:	e8 9d 70 00 00       	call   8093a5 <memcpy>
        len-=BLOCK_SIZE;
  802308:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  80230f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802313:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802316:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802319:	01 c2                	add    edx,eax
  80231b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80231f:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  802322:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802326:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  80232a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80232e:	48 89 c7             	mov    rdi,rax
  802331:	e8 a9 fd ff ff       	call   8020df <brelse>
    }while(len>0);
  802336:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  80233a:	7f 81                	jg     8022bd <vfs_write_file+0x21>
    return 0;
  80233c:	b8 00 00 00 00       	mov    eax,0x0
}
  802341:	c9                   	leave  
  802342:	c3                   	ret    

0000000000802343 <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  802343:	f3 0f 1e fa          	endbr64 
  802347:	55                   	push   rbp
  802348:	48 89 e5             	mov    rbp,rsp
  80234b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80234f:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  802352:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  802355:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  802359:	74 20                	je     80237b <vfs_seek_file+0x38>
  80235b:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  80235f:	7f 3f                	jg     8023a0 <vfs_seek_file+0x5d>
  802361:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  802365:	74 08                	je     80236f <vfs_seek_file+0x2c>
  802367:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  80236b:	74 23                	je     802390 <vfs_seek_file+0x4d>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  80236d:	eb 31                	jmp    8023a0 <vfs_seek_file+0x5d>
        f->ptr=offset;
  80236f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802373:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802376:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802379:	eb 26                	jmp    8023a1 <vfs_seek_file+0x5e>
        f->ptr+=offset;
  80237b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80237f:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802382:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802385:	01 c2                	add    edx,eax
  802387:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80238b:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  80238e:	eb 11                	jmp    8023a1 <vfs_seek_file+0x5e>
        f->ptr=f->size;
  802390:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802394:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  802397:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80239b:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  80239e:	eb 01                	jmp    8023a1 <vfs_seek_file+0x5e>
        break;
  8023a0:	90                   	nop
    }
    return f->ptr;
  8023a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023a5:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  8023a8:	5d                   	pop    rbp
  8023a9:	c3                   	ret    

00000000008023aa <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  8023aa:	f3 0f 1e fa          	endbr64 
  8023ae:	55                   	push   rbp
  8023af:	48 89 e5             	mov    rbp,rsp
  8023b2:	48 83 ec 10          	sub    rsp,0x10
  8023b6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  8023ba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023be:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8023c1:	48 63 d0             	movsxd rdx,eax
  8023c4:	48 89 d0             	mov    rax,rdx
  8023c7:	48 c1 e0 02          	shl    rax,0x2
  8023cb:	48 01 d0             	add    rax,rdx
  8023ce:	48 c1 e0 03          	shl    rax,0x3
  8023d2:	48 05 58 02 40 00    	add    rax,0x400258
  8023d8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8023db:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8023df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023e3:	48 89 c7             	mov    rdi,rax
  8023e6:	ff d2                	call   rdx

}
  8023e8:	c9                   	leave  
  8023e9:	c3                   	ret    

00000000008023ea <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  8023ea:	f3 0f 1e fa          	endbr64 
  8023ee:	55                   	push   rbp
  8023ef:	48 89 e5             	mov    rbp,rsp
  8023f2:	48 83 ec 20          	sub    rsp,0x20
  8023f6:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8023f9:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8023fc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802403:	e9 b9 00 00 00       	jmp    8024c1 <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  802408:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80240b:	48 98                	cdqe   
  80240d:	48 c1 e0 06          	shl    rax,0x6
  802411:	48 05 90 26 40 00    	add    rax,0x402690
  802417:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80241a:	0f b7 c0             	movzx  eax,ax
  80241d:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802420:	0f 85 97 00 00 00    	jne    8024bd <get_buf+0xd3>
  802426:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802429:	48 98                	cdqe   
  80242b:	48 c1 e0 06          	shl    rax,0x6
  80242f:	48 05 88 26 40 00    	add    rax,0x402688
  802435:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802438:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80243b:	48 98                	cdqe   
  80243d:	48 39 c2             	cmp    rdx,rax
  802440:	75 7b                	jne    8024bd <get_buf+0xd3>
        {
            repeat:
  802442:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  802443:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802446:	48 98                	cdqe   
  802448:	48 c1 e0 06          	shl    rax,0x6
  80244c:	48 05 80 26 40 00    	add    rax,0x402680
  802452:	48 89 c7             	mov    rdi,rax
  802455:	e8 41 01 00 00       	call   80259b <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  80245a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80245d:	48 98                	cdqe   
  80245f:	48 c1 e0 06          	shl    rax,0x6
  802463:	48 05 94 26 40 00    	add    rax,0x402694
  802469:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80246c:	84 c0                	test   al,al
  80246e:	74 02                	je     802472 <get_buf+0x88>
                goto repeat;
  802470:	eb d1                	jmp    802443 <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  802472:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802475:	48 98                	cdqe   
  802477:	48 c1 e0 06          	shl    rax,0x6
  80247b:	48 05 90 26 40 00    	add    rax,0x402690
  802481:	0f b7 00             	movzx  eax,WORD PTR [rax]
  802484:	0f b7 c0             	movzx  eax,ax
  802487:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80248a:	75 30                	jne    8024bc <get_buf+0xd2>
  80248c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80248f:	48 98                	cdqe   
  802491:	48 c1 e0 06          	shl    rax,0x6
  802495:	48 05 88 26 40 00    	add    rax,0x402688
  80249b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80249e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8024a1:	48 98                	cdqe   
  8024a3:	48 39 c2             	cmp    rdx,rax
  8024a6:	75 14                	jne    8024bc <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  8024a8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8024ab:	48 98                	cdqe   
  8024ad:	48 c1 e0 06          	shl    rax,0x6
  8024b1:	48 05 80 26 40 00    	add    rax,0x402680
  8024b7:	e9 dd 00 00 00       	jmp    802599 <get_buf+0x1af>
                continue;
  8024bc:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8024bd:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8024c1:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8024c5:	0f 8e 3d ff ff ff    	jle    802408 <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8024cb:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8024d2:	e9 b8 00 00 00       	jmp    80258f <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  8024d7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8024da:	48 98                	cdqe   
  8024dc:	48 c1 e0 06          	shl    rax,0x6
  8024e0:	48 05 94 26 40 00    	add    rax,0x402694
  8024e6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8024e9:	84 c0                	test   al,al
  8024eb:	0f 85 9a 00 00 00    	jne    80258b <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  8024f1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8024f4:	48 98                	cdqe   
  8024f6:	48 c1 e0 06          	shl    rax,0x6
  8024fa:	48 05 93 26 40 00    	add    rax,0x402693
  802500:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802503:	84 c0                	test   al,al
  802505:	74 2e                	je     802535 <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  802507:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80250a:	48 98                	cdqe   
  80250c:	48 c1 e0 06          	shl    rax,0x6
  802510:	48 05 80 26 40 00    	add    rax,0x402680
  802516:	48 89 c7             	mov    rdi,rax
  802519:	e8 2c 02 00 00       	call   80274a <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  80251e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802521:	48 98                	cdqe   
  802523:	48 c1 e0 06          	shl    rax,0x6
  802527:	48 05 80 26 40 00    	add    rax,0x402680
  80252d:	48 89 c7             	mov    rdi,rax
  802530:	e8 66 00 00 00       	call   80259b <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  802535:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802538:	48 98                	cdqe   
  80253a:	48 c1 e0 06          	shl    rax,0x6
  80253e:	48 05 94 26 40 00    	add    rax,0x402694
  802544:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802547:	8d 50 01             	lea    edx,[rax+0x1]
  80254a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80254d:	48 98                	cdqe   
  80254f:	48 c1 e0 06          	shl    rax,0x6
  802553:	48 05 94 26 40 00    	add    rax,0x402694
  802559:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  80255b:	b8 00 00 00 00       	mov    eax,0x0
  802560:	e8 d5 eb ff ff       	call   80113a <vmalloc>
  802565:	48 89 c2             	mov    rdx,rax
  802568:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80256b:	48 98                	cdqe   
  80256d:	48 c1 e0 06          	shl    rax,0x6
  802571:	48 05 80 26 40 00    	add    rax,0x402680
  802577:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  80257a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80257d:	48 98                	cdqe   
  80257f:	48 c1 e0 06          	shl    rax,0x6
  802583:	48 05 80 26 40 00    	add    rax,0x402680
  802589:	eb 0e                	jmp    802599 <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80258b:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80258f:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  802593:	0f 8e 3e ff ff ff    	jle    8024d7 <get_buf+0xed>
        }
    }
}
  802599:	c9                   	leave  
  80259a:	c3                   	ret    

000000000080259b <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  80259b:	f3 0f 1e fa          	endbr64 
  80259f:	55                   	push   rbp
  8025a0:	48 89 e5             	mov    rbp,rsp
  8025a3:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  8025a7:	90                   	nop
  8025a8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025ac:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  8025b0:	84 c0                	test   al,al
  8025b2:	75 f4                	jne    8025a8 <wait_on_buf+0xd>
    
}
  8025b4:	90                   	nop
  8025b5:	90                   	nop
  8025b6:	5d                   	pop    rbp
  8025b7:	c3                   	ret    

00000000008025b8 <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  8025b8:	f3 0f 1e fa          	endbr64 
  8025bc:	55                   	push   rbp
  8025bd:	48 89 e5             	mov    rbp,rsp
  8025c0:	48 83 ec 40          	sub    rsp,0x40
  8025c4:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    device *blkdev=get_dev(dev);
  8025c7:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8025ca:	89 c7                	mov    edi,eax
  8025cc:	e8 3c 0e 00 00       	call   80340d <get_dev>
  8025d1:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    buffer_head* bh=bread(dev,0);
  8025d5:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8025d8:	be 00 00 00 00       	mov    esi,0x0
  8025dd:	89 c7                	mov    edi,eax
  8025df:	e8 5e fb ff ff       	call   802142 <bread>
  8025e4:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!bh)return -1;
  8025e8:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  8025ed:	75 0a                	jne    8025f9 <scan_dev+0x41>
  8025ef:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8025f4:	e9 4f 01 00 00       	jmp    802748 <scan_dev+0x190>
    dpt_t* dpte=bh->b_data+0x1be;
  8025f9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8025fd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802600:	48 05 be 01 00 00    	add    rax,0x1be
  802606:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  80260a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802611:	e9 17 01 00 00       	jmp    80272d <scan_dev+0x175>
    {
        blkdev->par[i].type=dpte->type;
  802616:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80261a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80261d:	0f b6 d0             	movzx  edx,al
  802620:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  802624:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802627:	48 63 c8             	movsxd rcx,eax
  80262a:	48 89 c8             	mov    rax,rcx
  80262d:	48 01 c0             	add    rax,rax
  802630:	48 01 c8             	add    rax,rcx
  802633:	48 c1 e0 02          	shl    rax,0x2
  802637:	48 01 f0             	add    rax,rsi
  80263a:	48 83 c0 40          	add    rax,0x40
  80263e:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
        int stlba=dpte->start_lba;
  802641:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802645:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802648:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
        blkdev->par[i].start_sec=stlba;
  80264b:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  80264f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802652:	48 63 d0             	movsxd rdx,eax
  802655:	48 89 d0             	mov    rax,rdx
  802658:	48 01 c0             	add    rax,rax
  80265b:	48 01 d0             	add    rax,rdx
  80265e:	48 c1 e0 02          	shl    rax,0x2
  802662:	48 01 c8             	add    rax,rcx
  802665:	48 8d 50 40          	lea    rdx,[rax+0x40]
  802669:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80266c:	89 02                	mov    DWORD PTR [rdx],eax
        int i;
        for(i=0;i<MAX_FS;i++)
  80266e:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  802675:	eb 68                	jmp    8026df <scan_dev+0x127>
        {
            if(fs[i].read_superblock&&fs[i].read_superblock(dev,stlba)==0)
  802677:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80267a:	48 63 d0             	movsxd rdx,eax
  80267d:	48 89 d0             	mov    rax,rdx
  802680:	48 01 c0             	add    rax,rax
  802683:	48 01 d0             	add    rax,rdx
  802686:	48 c1 e0 03          	shl    rax,0x3
  80268a:	48 05 80 23 40 00    	add    rax,0x402380
  802690:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802693:	48 85 c0             	test   rax,rax
  802696:	74 43                	je     8026db <scan_dev+0x123>
  802698:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80269b:	48 63 d0             	movsxd rdx,eax
  80269e:	48 89 d0             	mov    rax,rdx
  8026a1:	48 01 c0             	add    rax,rax
  8026a4:	48 01 d0             	add    rax,rdx
  8026a7:	48 c1 e0 03          	shl    rax,0x3
  8026ab:	48 05 80 23 40 00    	add    rax,0x402380
  8026b1:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8026b4:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8026b7:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8026ba:	89 d6                	mov    esi,edx
  8026bc:	89 c7                	mov    edi,eax
  8026be:	ff d1                	call   rcx
  8026c0:	85 c0                	test   eax,eax
  8026c2:	75 17                	jne    8026db <scan_dev+0x123>
            {
                reg_vol(dev,i,blkdev->name);//识别成功，注册卷
  8026c4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8026c8:	48 8d 50 14          	lea    rdx,[rax+0x14]
  8026cc:	8b 4d f0             	mov    ecx,DWORD PTR [rbp-0x10]
  8026cf:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8026d2:	89 ce                	mov    esi,ecx
  8026d4:	89 c7                	mov    edi,eax
  8026d6:	e8 ae f1 ff ff       	call   801889 <reg_vol>
        for(i=0;i<MAX_FS;i++)
  8026db:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8026df:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  8026e3:	7e 92                	jle    802677 <scan_dev+0xbf>
            }
        }
        if(i==MAX_FS)
  8026e5:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  8026e9:	75 0f                	jne    8026fa <scan_dev+0x142>
        {
            printf("err:unrecognised partition fs.\n");
  8026eb:	bf 50 17 81 00       	mov    edi,0x811750
  8026f0:	b8 00 00 00 00       	mov    eax,0x0
  8026f5:	e8 32 e6 ff ff       	call   800d2c <printf>
        }

        blkdev->par[i].end_sec=dpte->end_lba;
  8026fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8026fe:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802701:	89 c1                	mov    ecx,eax
  802703:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  802707:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80270a:	48 63 d0             	movsxd rdx,eax
  80270d:	48 89 d0             	mov    rax,rdx
  802710:	48 01 c0             	add    rax,rax
  802713:	48 01 d0             	add    rax,rdx
  802716:	48 c1 e0 02          	shl    rax,0x2
  80271a:	48 01 f0             	add    rax,rsi
  80271d:	48 83 c0 40          	add    rax,0x40
  802721:	89 48 04             	mov    DWORD PTR [rax+0x4],ecx
        dpte++;
  802724:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  802729:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80272d:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  802731:	0f 8e df fe ff ff    	jle    802616 <scan_dev+0x5e>
    }
    brelse(bh);
  802737:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80273b:	48 89 c7             	mov    rdi,rax
  80273e:	e8 9c f9 ff ff       	call   8020df <brelse>
    return 0;
  802743:	b8 00 00 00 00       	mov    eax,0x0
}
  802748:	c9                   	leave  
  802749:	c3                   	ret    

000000000080274a <sync_buf>:

int sync_buf(buffer_head* bh)
{
  80274a:	f3 0f 1e fa          	endbr64 
  80274e:	55                   	push   rbp
  80274f:	48 89 e5             	mov    rbp,rsp
  802752:	48 83 ec 20          	sub    rsp,0x20
  802756:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  80275a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80275e:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  802762:	0f b7 c0             	movzx  eax,ax
  802765:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  802768:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80276c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  802770:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  802773:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802777:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80277a:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  80277d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802780:	b9 00 02 00 00       	mov    ecx,0x200
  802785:	89 c7                	mov    edi,eax
  802787:	e8 02 00 00 00       	call   80278e <write_block>

}
  80278c:	c9                   	leave  
  80278d:	c3                   	ret    

000000000080278e <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  80278e:	f3 0f 1e fa          	endbr64 
  802792:	55                   	push   rbp
  802793:	48 89 e5             	mov    rbp,rsp
  802796:	48 83 ec 30          	sub    rsp,0x30
  80279a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80279d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8027a0:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  8027a4:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  8027a7:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8027aa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8027ad:	89 d6                	mov    esi,edx
  8027af:	89 c7                	mov    edi,eax
  8027b1:	e8 34 fc ff ff       	call   8023ea <get_buf>
  8027b6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8027ba:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8027bd:	ba 00 02 00 00       	mov    edx,0x200
  8027c2:	39 d0                	cmp    eax,edx
  8027c4:	0f 4f c2             	cmovg  eax,edx
  8027c7:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  8027ca:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8027cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8027d1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8027d4:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8027d8:	48 89 ce             	mov    rsi,rcx
  8027db:	48 89 c7             	mov    rdi,rax
  8027de:	e8 c2 6b 00 00       	call   8093a5 <memcpy>
        len-=BLOCK_SIZE;
  8027e3:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  8027ea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8027ee:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  8027f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8027f6:	48 89 c7             	mov    rdi,rax
  8027f9:	e8 e1 f8 ff ff       	call   8020df <brelse>
    }while(len>0);
  8027fe:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802802:	7f a3                	jg     8027a7 <write_block+0x19>
    return 0;
  802804:	b8 00 00 00 00       	mov    eax,0x0
}
  802809:	c9                   	leave  
  80280a:	c3                   	ret    

000000000080280b <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  80280b:	f3 0f 1e fa          	endbr64 
  80280f:	55                   	push   rbp
  802810:	48 89 e5             	mov    rbp,rsp
  802813:	48 83 ec 30          	sub    rsp,0x30
  802817:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80281a:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80281d:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802821:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  802824:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802827:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80282a:	89 d6                	mov    esi,edx
  80282c:	89 c7                	mov    edi,eax
  80282e:	e8 0f f9 ff ff       	call   802142 <bread>
  802833:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802837:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80283a:	ba 00 02 00 00       	mov    edx,0x200
  80283f:	39 d0                	cmp    eax,edx
  802841:	0f 4f c2             	cmovg  eax,edx
  802844:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  802847:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80284a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80284e:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802851:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802855:	48 89 ce             	mov    rsi,rcx
  802858:	48 89 c7             	mov    rdi,rax
  80285b:	e8 45 6b 00 00       	call   8093a5 <memcpy>
        len-=BLOCK_SIZE;
  802860:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  802867:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80286b:	48 89 c7             	mov    rdi,rax
  80286e:	e8 6c f8 ff ff       	call   8020df <brelse>
    }while(len>0);
  802873:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802877:	7f ab                	jg     802824 <read_block+0x19>
    return 0;
  802879:	b8 00 00 00 00       	mov    eax,0x0
}
  80287e:	c9                   	leave  
  80287f:	c3                   	ret    

0000000000802880 <init_vfs>:

int init_vfs()
{
  802880:	f3 0f 1e fa          	endbr64 
  802884:	55                   	push   rbp
  802885:	48 89 e5             	mov    rbp,rsp
  802888:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  80288c:	48 8b 05 ed 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05bed]        # 408480 <dev_tree>
  802893:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  802897:	eb 40                	jmp    8028d9 <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  802899:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80289d:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  8028a3:	48 c1 f8 02          	sar    rax,0x2
  8028a7:	48 89 c2             	mov    rdx,rax
  8028aa:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  8028b1:	18 9c 8f 
  8028b4:	48 0f af c2          	imul   rax,rdx
  8028b8:	89 c7                	mov    edi,eax
  8028ba:	e8 f9 fc ff ff       	call   8025b8 <scan_dev>
  8028bf:	85 c0                	test   eax,eax
  8028c1:	74 07                	je     8028ca <init_vfs+0x4a>
  8028c3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8028c8:	eb 1b                	jmp    8028e5 <init_vfs+0x65>
    for(;p;p=p->next)
  8028ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028ce:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8028d5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8028d9:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8028de:	75 b9                	jne    802899 <init_vfs+0x19>
    }
    return 0;
  8028e0:	b8 00 00 00 00       	mov    eax,0x0
  8028e5:	c9                   	leave  
  8028e6:	c3                   	ret    

00000000008028e7 <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  8028e7:	f3 0f 1e fa          	endbr64 
  8028eb:	55                   	push   rbp
  8028ec:	48 89 e5             	mov    rbp,rsp
}
  8028ef:	90                   	nop
  8028f0:	5d                   	pop    rbp
  8028f1:	c3                   	ret    

00000000008028f2 <load_driver>:
int load_driver(char *path)
{
  8028f2:	f3 0f 1e fa          	endbr64 
  8028f6:	55                   	push   rbp
  8028f7:	48 89 e5             	mov    rbp,rsp
  8028fa:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  8028fe:	90                   	nop
  8028ff:	5d                   	pop    rbp
  802900:	c3                   	ret    

0000000000802901 <reg_device>:

int reg_device(device* dev)
{
  802901:	f3 0f 1e fa          	endbr64 
  802905:	55                   	push   rbp
  802906:	48 89 e5             	mov    rbp,rsp
  802909:	53                   	push   rbx
  80290a:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  80290e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  802915:	e9 42 01 00 00       	jmp    802a5c <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  80291a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80291d:	48 63 d0             	movsxd rdx,eax
  802920:	48 89 d0             	mov    rax,rdx
  802923:	48 c1 e0 02          	shl    rax,0x2
  802927:	48 01 d0             	add    rax,rdx
  80292a:	48 c1 e0 02          	shl    rax,0x2
  80292e:	48 01 d0             	add    rax,rdx
  802931:	48 c1 e0 03          	shl    rax,0x3
  802935:	48 05 90 2e 40 00    	add    rax,0x402e90
  80293b:	8b 00                	mov    eax,DWORD PTR [rax]
  80293d:	85 c0                	test   eax,eax
  80293f:	0f 85 13 01 00 00    	jne    802a58 <reg_device+0x157>
        {
            devs[i]=*dev;
  802945:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802948:	48 63 d0             	movsxd rdx,eax
  80294b:	48 89 d0             	mov    rax,rdx
  80294e:	48 c1 e0 02          	shl    rax,0x2
  802952:	48 01 d0             	add    rax,rdx
  802955:	48 c1 e0 02          	shl    rax,0x2
  802959:	48 01 d0             	add    rax,rdx
  80295c:	48 c1 e0 03          	shl    rax,0x3
  802960:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  802967:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80296b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80296e:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802972:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802975:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802979:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  80297d:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802981:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802985:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802989:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  80298d:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802991:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802995:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802999:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  80299d:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  8029a1:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  8029a5:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  8029a9:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  8029ad:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  8029b1:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  8029b5:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  8029b9:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  8029bd:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  8029c1:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  8029c5:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  8029c9:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  8029cd:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  8029d1:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  8029d5:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  8029d9:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  8029dd:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  8029e1:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  8029e5:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  8029e9:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  8029f0:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  8029f7:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  8029fe:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802a05:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802a0c:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802a13:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802a1a:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  802a21:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  802a28:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  802a2f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802a32:	48 63 d0             	movsxd rdx,eax
  802a35:	48 89 d0             	mov    rax,rdx
  802a38:	48 c1 e0 02          	shl    rax,0x2
  802a3c:	48 01 d0             	add    rax,rdx
  802a3f:	48 c1 e0 02          	shl    rax,0x2
  802a43:	48 01 d0             	add    rax,rdx
  802a46:	48 c1 e0 03          	shl    rax,0x3
  802a4a:	48 05 90 2e 40 00    	add    rax,0x402e90
  802a50:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802a56:	eb 0e                	jmp    802a66 <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  802a58:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802a5c:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  802a60:	0f 8e b4 fe ff ff    	jle    80291a <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802a66:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  802a6a:	75 0a                	jne    802a76 <reg_device+0x175>
        return -1;
  802a6c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802a71:	e9 6d 01 00 00       	jmp    802be3 <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802a76:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  802a7d:	00 
  802a7e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802a81:	48 63 d0             	movsxd rdx,eax
  802a84:	48 89 d0             	mov    rax,rdx
  802a87:	48 c1 e0 02          	shl    rax,0x2
  802a8b:	48 01 d0             	add    rax,rdx
  802a8e:	48 c1 e0 02          	shl    rax,0x2
  802a92:	48 01 d0             	add    rax,rdx
  802a95:	48 c1 e0 03          	shl    rax,0x3
  802a99:	48 05 80 2e 40 00    	add    rax,0x402e80
  802a9f:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  802aa3:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802aa7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802aaa:	83 f8 03             	cmp    eax,0x3
  802aad:	74 3b                	je     802aea <reg_device+0x1e9>
  802aaf:	83 f8 03             	cmp    eax,0x3
  802ab2:	7f 4b                	jg     802aff <reg_device+0x1fe>
  802ab4:	83 f8 01             	cmp    eax,0x1
  802ab7:	74 07                	je     802ac0 <reg_device+0x1bf>
  802ab9:	83 f8 02             	cmp    eax,0x2
  802abc:	74 17                	je     802ad5 <reg_device+0x1d4>
  802abe:	eb 3f                	jmp    802aff <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  802ac0:	48 8b 05 b9 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc059b9]        # 408480 <dev_tree>
  802ac7:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802acb:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  802ad2:	00 
        break;
  802ad3:	eb 34                	jmp    802b09 <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  802ad5:	48 8b 05 ac 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc059ac]        # 408488 <dev_tree+0x8>
  802adc:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802ae0:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  802ae7:	00 
        break;
  802ae8:	eb 1f                	jmp    802b09 <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  802aea:	48 8b 05 9f 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0599f]        # 408490 <dev_tree+0x10>
  802af1:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802af5:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  802afc:	00 
        break;
  802afd:	eb 0a                	jmp    802b09 <reg_device+0x208>
    default:return -1;//不可能有其他情况
  802aff:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802b04:	e9 da 00 00 00       	jmp    802be3 <reg_device+0x2e2>
    }
    if(!p){
  802b09:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  802b0e:	75 2b                	jne    802b3b <reg_device+0x23a>
        *pp=neo;
  802b10:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802b14:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802b18:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  802b1b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b1f:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  802b26:	00 00 00 00 
  802b2a:	eb 3d                	jmp    802b69 <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  802b2c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802b30:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802b37:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802b3b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802b3f:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802b46:	48 85 c0             	test   rax,rax
  802b49:	75 e1                	jne    802b2c <reg_device+0x22b>
        p->next=neo;
  802b4b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802b4f:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802b53:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  802b5a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b5e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802b62:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802b69:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b6d:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802b74:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802b78:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b7c:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802b7f:	83 f8 04             	cmp    eax,0x4
  802b82:	74 3b                	je     802bbf <reg_device+0x2be>
  802b84:	83 f8 04             	cmp    eax,0x4
  802b87:	7f 56                	jg     802bdf <reg_device+0x2de>
  802b89:	83 f8 03             	cmp    eax,0x3
  802b8c:	74 21                	je     802baf <reg_device+0x2ae>
  802b8e:	83 f8 03             	cmp    eax,0x3
  802b91:	7f 4c                	jg     802bdf <reg_device+0x2de>
  802b93:	83 f8 01             	cmp    eax,0x1
  802b96:	74 07                	je     802b9f <reg_device+0x29e>
  802b98:	83 f8 02             	cmp    eax,0x2
  802b9b:	74 32                	je     802bcf <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802b9d:	eb 40                	jmp    802bdf <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  802b9f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802ba3:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802baa:	00 00 00 
        break;
  802bad:	eb 31                	jmp    802be0 <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  802baf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bb3:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802bba:	00 00 00 
        break;
  802bbd:	eb 21                	jmp    802be0 <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  802bbf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bc3:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  802bca:	00 00 00 
        break;
  802bcd:	eb 11                	jmp    802be0 <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  802bcf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bd3:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  802bda:	00 00 00 
        break;
  802bdd:	eb 01                	jmp    802be0 <reg_device+0x2df>
        break;
  802bdf:	90                   	nop
    }
    return i;
  802be0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  802be3:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802be7:	c9                   	leave  
  802be8:	c3                   	ret    

0000000000802be9 <reg_driver>:


int reg_driver(driver *drv)
{
  802be9:	f3 0f 1e fa          	endbr64 
  802bed:	55                   	push   rbp
  802bee:	48 89 e5             	mov    rbp,rsp
  802bf1:	53                   	push   rbx
  802bf2:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  802bf6:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802bfd:	e9 22 01 00 00       	jmp    802d24 <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  802c02:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802c05:	48 63 d0             	movsxd rdx,eax
  802c08:	48 89 d0             	mov    rax,rdx
  802c0b:	48 c1 e0 02          	shl    rax,0x2
  802c0f:	48 01 d0             	add    rax,rdx
  802c12:	48 c1 e0 05          	shl    rax,0x5
  802c16:	48 05 80 58 40 00    	add    rax,0x405880
  802c1c:	8b 00                	mov    eax,DWORD PTR [rax]
  802c1e:	85 c0                	test   eax,eax
  802c20:	0f 85 fa 00 00 00    	jne    802d20 <reg_driver+0x137>
        {
            drvs[i]=*drv;
  802c26:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802c29:	48 63 d0             	movsxd rdx,eax
  802c2c:	48 89 d0             	mov    rax,rdx
  802c2f:	48 c1 e0 02          	shl    rax,0x2
  802c33:	48 01 d0             	add    rax,rdx
  802c36:	48 c1 e0 05          	shl    rax,0x5
  802c3a:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  802c41:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802c45:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802c48:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802c4c:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802c4f:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802c53:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802c57:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802c5b:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802c5f:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802c63:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802c67:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802c6b:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802c6f:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802c73:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802c77:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802c7b:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802c7f:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802c83:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802c87:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802c8b:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802c8f:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802c93:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802c97:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802c9b:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802c9f:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802ca3:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802ca7:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802cab:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802caf:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802cb3:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802cb7:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802cbb:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802cbf:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802cc3:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802cca:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802cd1:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802cd8:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802cdf:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802ce6:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802ced:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802cf4:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  802cfb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802cfe:	48 63 d0             	movsxd rdx,eax
  802d01:	48 89 d0             	mov    rax,rdx
  802d04:	48 c1 e0 02          	shl    rax,0x2
  802d08:	48 01 d0             	add    rax,rdx
  802d0b:	48 c1 e0 05          	shl    rax,0x5
  802d0f:	48 05 80 58 40 00    	add    rax,0x405880
  802d15:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  802d1b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802d1e:	eb 13                	jmp    802d33 <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  802d20:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802d24:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  802d28:	0f 8e d4 fe ff ff    	jle    802c02 <reg_driver+0x19>
        }
    }
    return -1;
  802d2e:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802d33:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802d37:	c9                   	leave  
  802d38:	c3                   	ret    

0000000000802d39 <sys_find_dev>:

int sys_find_dev(char *name)
{
  802d39:	f3 0f 1e fa          	endbr64 
  802d3d:	55                   	push   rbp
  802d3e:	48 89 e5             	mov    rbp,rsp
  802d41:	48 83 ec 20          	sub    rsp,0x20
  802d45:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802d49:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802d50:	eb 6c                	jmp    802dbe <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802d52:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d55:	48 63 d0             	movsxd rdx,eax
  802d58:	48 89 d0             	mov    rax,rdx
  802d5b:	48 c1 e0 02          	shl    rax,0x2
  802d5f:	48 01 d0             	add    rax,rdx
  802d62:	48 c1 e0 02          	shl    rax,0x2
  802d66:	48 01 d0             	add    rax,rdx
  802d69:	48 c1 e0 03          	shl    rax,0x3
  802d6d:	48 05 90 2e 40 00    	add    rax,0x402e90
  802d73:	8b 00                	mov    eax,DWORD PTR [rax]
  802d75:	85 c0                	test   eax,eax
  802d77:	74 41                	je     802dba <sys_find_dev+0x81>
  802d79:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802d7c:	48 63 d0             	movsxd rdx,eax
  802d7f:	48 89 d0             	mov    rax,rdx
  802d82:	48 c1 e0 02          	shl    rax,0x2
  802d86:	48 01 d0             	add    rax,rdx
  802d89:	48 c1 e0 02          	shl    rax,0x2
  802d8d:	48 01 d0             	add    rax,rdx
  802d90:	48 c1 e0 03          	shl    rax,0x3
  802d94:	48 83 c0 10          	add    rax,0x10
  802d98:	48 05 80 2e 40 00    	add    rax,0x402e80
  802d9e:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802da2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802da6:	48 89 d6             	mov    rsi,rdx
  802da9:	48 89 c7             	mov    rdi,rax
  802dac:	e8 92 68 00 00       	call   809643 <strcmp>
  802db1:	85 c0                	test   eax,eax
  802db3:	75 05                	jne    802dba <sys_find_dev+0x81>
            return i;
  802db5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802db8:	eb 0f                	jmp    802dc9 <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802dba:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802dbe:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802dc2:	7e 8e                	jle    802d52 <sys_find_dev+0x19>
    }
    return -1;
  802dc4:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802dc9:	c9                   	leave  
  802dca:	c3                   	ret    

0000000000802dcb <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  802dcb:	f3 0f 1e fa          	endbr64 
  802dcf:	55                   	push   rbp
  802dd0:	48 89 e5             	mov    rbp,rsp
  802dd3:	48 83 ec 30          	sub    rsp,0x30
  802dd7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802ddb:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  802dde:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  802de2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  802de9:	eb 67                	jmp    802e52 <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802deb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802dee:	48 63 d0             	movsxd rdx,eax
  802df1:	48 89 d0             	mov    rax,rdx
  802df4:	48 c1 e0 02          	shl    rax,0x2
  802df8:	48 01 d0             	add    rax,rdx
  802dfb:	48 c1 e0 02          	shl    rax,0x2
  802dff:	48 01 d0             	add    rax,rdx
  802e02:	48 c1 e0 03          	shl    rax,0x3
  802e06:	48 05 90 2e 40 00    	add    rax,0x402e90
  802e0c:	8b 00                	mov    eax,DWORD PTR [rax]
  802e0e:	85 c0                	test   eax,eax
  802e10:	74 3c                	je     802e4e <sys_operate_dev+0x83>
  802e12:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e15:	48 63 d0             	movsxd rdx,eax
  802e18:	48 89 d0             	mov    rax,rdx
  802e1b:	48 c1 e0 02          	shl    rax,0x2
  802e1f:	48 01 d0             	add    rax,rdx
  802e22:	48 c1 e0 02          	shl    rax,0x2
  802e26:	48 01 d0             	add    rax,rdx
  802e29:	48 c1 e0 03          	shl    rax,0x3
  802e2d:	48 83 c0 10          	add    rax,0x10
  802e31:	48 05 80 2e 40 00    	add    rax,0x402e80
  802e37:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802e3b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802e3f:	48 89 d6             	mov    rsi,rdx
  802e42:	48 89 c7             	mov    rdi,rax
  802e45:	e8 f9 67 00 00       	call   809643 <strcmp>
  802e4a:	85 c0                	test   eax,eax
  802e4c:	74 0c                	je     802e5a <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  802e4e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802e52:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802e56:	7e 93                	jle    802deb <sys_operate_dev+0x20>
  802e58:	eb 01                	jmp    802e5b <sys_operate_dev+0x90>
            break;
  802e5a:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  802e5b:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  802e5f:	75 0a                	jne    802e6b <sys_operate_dev+0xa0>
  802e61:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802e66:	e9 9c 02 00 00       	jmp    803107 <sys_operate_dev+0x33c>
    switch (func) {
  802e6b:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  802e6f:	0f 87 8d 02 00 00    	ja     803102 <sys_operate_dev+0x337>
  802e75:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802e78:	48 8b 04 c5 70 17 81 	mov    rax,QWORD PTR [rax*8+0x811770]
  802e7f:	00 
  802e80:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  802e83:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e86:	48 63 d0             	movsxd rdx,eax
  802e89:	48 89 d0             	mov    rax,rdx
  802e8c:	48 c1 e0 02          	shl    rax,0x2
  802e90:	48 01 d0             	add    rax,rdx
  802e93:	48 c1 e0 02          	shl    rax,0x2
  802e97:	48 01 d0             	add    rax,rdx
  802e9a:	48 c1 e0 03          	shl    rax,0x3
  802e9e:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802ea4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802ea7:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802eab:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802eaf:	48 89 c7             	mov    rdi,rax
  802eb2:	ff d2                	call   rdx
  802eb4:	e9 4e 02 00 00       	jmp    803107 <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  802eb9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ebc:	48 63 d0             	movsxd rdx,eax
  802ebf:	48 89 d0             	mov    rax,rdx
  802ec2:	48 c1 e0 02          	shl    rax,0x2
  802ec6:	48 01 d0             	add    rax,rdx
  802ec9:	48 c1 e0 02          	shl    rax,0x2
  802ecd:	48 01 d0             	add    rax,rdx
  802ed0:	48 c1 e0 03          	shl    rax,0x3
  802ed4:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802eda:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802edd:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  802ee1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802ee5:	48 89 c7             	mov    rdi,rax
  802ee8:	ff d2                	call   rdx
  802eea:	e9 18 02 00 00       	jmp    803107 <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  802eef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ef2:	48 63 d0             	movsxd rdx,eax
  802ef5:	48 89 d0             	mov    rax,rdx
  802ef8:	48 c1 e0 02          	shl    rax,0x2
  802efc:	48 01 d0             	add    rax,rdx
  802eff:	48 c1 e0 02          	shl    rax,0x2
  802f03:	48 01 d0             	add    rax,rdx
  802f06:	48 c1 e0 03          	shl    rax,0x3
  802f0a:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802f10:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802f13:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  802f17:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802f1b:	48 89 c7             	mov    rdi,rax
  802f1e:	ff d2                	call   rdx
  802f20:	e9 e2 01 00 00       	jmp    803107 <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  802f25:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f28:	48 63 d0             	movsxd rdx,eax
  802f2b:	48 89 d0             	mov    rax,rdx
  802f2e:	48 c1 e0 02          	shl    rax,0x2
  802f32:	48 01 d0             	add    rax,rdx
  802f35:	48 c1 e0 02          	shl    rax,0x2
  802f39:	48 01 d0             	add    rax,rdx
  802f3c:	48 c1 e0 03          	shl    rax,0x3
  802f40:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802f46:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802f49:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  802f4d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802f51:	48 89 c7             	mov    rdi,rax
  802f54:	ff d2                	call   rdx
  802f56:	e9 ac 01 00 00       	jmp    803107 <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  802f5b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f5e:	48 63 d0             	movsxd rdx,eax
  802f61:	48 89 d0             	mov    rax,rdx
  802f64:	48 c1 e0 02          	shl    rax,0x2
  802f68:	48 01 d0             	add    rax,rdx
  802f6b:	48 c1 e0 02          	shl    rax,0x2
  802f6f:	48 01 d0             	add    rax,rdx
  802f72:	48 c1 e0 03          	shl    rax,0x3
  802f76:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802f7c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802f7f:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  802f83:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802f87:	48 89 c7             	mov    rdi,rax
  802f8a:	ff d2                	call   rdx
  802f8c:	e9 76 01 00 00       	jmp    803107 <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  802f91:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f94:	48 63 d0             	movsxd rdx,eax
  802f97:	48 89 d0             	mov    rax,rdx
  802f9a:	48 c1 e0 02          	shl    rax,0x2
  802f9e:	48 01 d0             	add    rax,rdx
  802fa1:	48 c1 e0 02          	shl    rax,0x2
  802fa5:	48 01 d0             	add    rax,rdx
  802fa8:	48 c1 e0 03          	shl    rax,0x3
  802fac:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802fb2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802fb5:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  802fb9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802fbd:	48 89 c7             	mov    rdi,rax
  802fc0:	ff d2                	call   rdx
  802fc2:	e9 40 01 00 00       	jmp    803107 <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  802fc7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fca:	48 63 d0             	movsxd rdx,eax
  802fcd:	48 89 d0             	mov    rax,rdx
  802fd0:	48 c1 e0 02          	shl    rax,0x2
  802fd4:	48 01 d0             	add    rax,rdx
  802fd7:	48 c1 e0 02          	shl    rax,0x2
  802fdb:	48 01 d0             	add    rax,rdx
  802fde:	48 c1 e0 03          	shl    rax,0x3
  802fe2:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802fe8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802feb:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  802fef:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802ff3:	48 89 c7             	mov    rdi,rax
  802ff6:	ff d2                	call   rdx
  802ff8:	e9 0a 01 00 00       	jmp    803107 <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  802ffd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803000:	48 63 d0             	movsxd rdx,eax
  803003:	48 89 d0             	mov    rax,rdx
  803006:	48 c1 e0 02          	shl    rax,0x2
  80300a:	48 01 d0             	add    rax,rdx
  80300d:	48 c1 e0 02          	shl    rax,0x2
  803011:	48 01 d0             	add    rax,rdx
  803014:	48 c1 e0 03          	shl    rax,0x3
  803018:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80301e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803021:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  803025:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803029:	48 89 c7             	mov    rdi,rax
  80302c:	ff d2                	call   rdx
  80302e:	e9 d4 00 00 00       	jmp    803107 <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  803033:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803036:	48 63 d0             	movsxd rdx,eax
  803039:	48 89 d0             	mov    rax,rdx
  80303c:	48 c1 e0 02          	shl    rax,0x2
  803040:	48 01 d0             	add    rax,rdx
  803043:	48 c1 e0 02          	shl    rax,0x2
  803047:	48 01 d0             	add    rax,rdx
  80304a:	48 c1 e0 03          	shl    rax,0x3
  80304e:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803054:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803057:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  80305b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80305f:	48 89 c7             	mov    rdi,rax
  803062:	ff d2                	call   rdx
  803064:	e9 9e 00 00 00       	jmp    803107 <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  803069:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80306c:	48 63 d0             	movsxd rdx,eax
  80306f:	48 89 d0             	mov    rax,rdx
  803072:	48 c1 e0 02          	shl    rax,0x2
  803076:	48 01 d0             	add    rax,rdx
  803079:	48 c1 e0 02          	shl    rax,0x2
  80307d:	48 01 d0             	add    rax,rdx
  803080:	48 c1 e0 03          	shl    rax,0x3
  803084:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80308a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80308d:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  803091:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803095:	48 89 c7             	mov    rdi,rax
  803098:	ff d2                	call   rdx
  80309a:	eb 6b                	jmp    803107 <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  80309c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80309f:	48 63 d0             	movsxd rdx,eax
  8030a2:	48 89 d0             	mov    rax,rdx
  8030a5:	48 c1 e0 02          	shl    rax,0x2
  8030a9:	48 01 d0             	add    rax,rdx
  8030ac:	48 c1 e0 02          	shl    rax,0x2
  8030b0:	48 01 d0             	add    rax,rdx
  8030b3:	48 c1 e0 03          	shl    rax,0x3
  8030b7:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030bd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030c0:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  8030c4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030c8:	48 89 c7             	mov    rdi,rax
  8030cb:	ff d2                	call   rdx
  8030cd:	eb 38                	jmp    803107 <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  8030cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030d2:	48 63 d0             	movsxd rdx,eax
  8030d5:	48 89 d0             	mov    rax,rdx
  8030d8:	48 c1 e0 02          	shl    rax,0x2
  8030dc:	48 01 d0             	add    rax,rdx
  8030df:	48 c1 e0 02          	shl    rax,0x2
  8030e3:	48 01 d0             	add    rax,rdx
  8030e6:	48 c1 e0 03          	shl    rax,0x3
  8030ea:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030f0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030f3:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  8030f7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030fb:	48 89 c7             	mov    rdi,rax
  8030fe:	ff d2                	call   rdx
  803100:	eb 05                	jmp    803107 <sys_operate_dev+0x33c>
    }
    return -1;
  803102:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803107:	c9                   	leave  
  803108:	c3                   	ret    

0000000000803109 <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  803109:	f3 0f 1e fa          	endbr64 
  80310d:	55                   	push   rbp
  80310e:	48 89 e5             	mov    rbp,rsp
  803111:	48 83 ec 10          	sub    rsp,0x10
  803115:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  803118:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  80311b:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  80311f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803122:	48 63 d0             	movsxd rdx,eax
  803125:	48 89 d0             	mov    rax,rdx
  803128:	48 c1 e0 02          	shl    rax,0x2
  80312c:	48 01 d0             	add    rax,rdx
  80312f:	48 c1 e0 05          	shl    rax,0x5
  803133:	48 05 80 58 40 00    	add    rax,0x405880
  803139:	8b 00                	mov    eax,DWORD PTR [rax]
  80313b:	85 c0                	test   eax,eax
  80313d:	75 0a                	jne    803149 <call_drv_func+0x40>
  80313f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803144:	e9 15 02 00 00       	jmp    80335e <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  803149:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  80314d:	0f 87 06 02 00 00    	ja     803359 <call_drv_func+0x250>
  803153:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803156:	48 8b 04 c5 d0 17 81 	mov    rax,QWORD PTR [rax*8+0x8117d0]
  80315d:	00 
  80315e:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  803161:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803164:	48 63 d0             	movsxd rdx,eax
  803167:	48 89 d0             	mov    rax,rdx
  80316a:	48 c1 e0 02          	shl    rax,0x2
  80316e:	48 01 d0             	add    rax,rdx
  803171:	48 c1 e0 05          	shl    rax,0x5
  803175:	48 05 88 58 40 00    	add    rax,0x405888
  80317b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80317e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803182:	48 89 c7             	mov    rdi,rax
  803185:	ff d2                	call   rdx
  803187:	e9 d2 01 00 00       	jmp    80335e <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  80318c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80318f:	48 63 d0             	movsxd rdx,eax
  803192:	48 89 d0             	mov    rax,rdx
  803195:	48 c1 e0 02          	shl    rax,0x2
  803199:	48 01 d0             	add    rax,rdx
  80319c:	48 c1 e0 05          	shl    rax,0x5
  8031a0:	48 05 90 58 40 00    	add    rax,0x405890
  8031a6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8031a9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8031ad:	48 89 c7             	mov    rdi,rax
  8031b0:	ff d2                	call   rdx
  8031b2:	e9 a7 01 00 00       	jmp    80335e <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  8031b7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031ba:	48 63 d0             	movsxd rdx,eax
  8031bd:	48 89 d0             	mov    rax,rdx
  8031c0:	48 c1 e0 02          	shl    rax,0x2
  8031c4:	48 01 d0             	add    rax,rdx
  8031c7:	48 c1 e0 05          	shl    rax,0x5
  8031cb:	48 05 98 58 40 00    	add    rax,0x405898
  8031d1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8031d4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8031d8:	48 89 c7             	mov    rdi,rax
  8031db:	ff d2                	call   rdx
  8031dd:	e9 7c 01 00 00       	jmp    80335e <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  8031e2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031e5:	48 63 d0             	movsxd rdx,eax
  8031e8:	48 89 d0             	mov    rax,rdx
  8031eb:	48 c1 e0 02          	shl    rax,0x2
  8031ef:	48 01 d0             	add    rax,rdx
  8031f2:	48 c1 e0 05          	shl    rax,0x5
  8031f6:	48 05 a0 58 40 00    	add    rax,0x4058a0
  8031fc:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8031ff:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803203:	48 89 c7             	mov    rdi,rax
  803206:	ff d2                	call   rdx
  803208:	e9 51 01 00 00       	jmp    80335e <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  80320d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803210:	48 63 d0             	movsxd rdx,eax
  803213:	48 89 d0             	mov    rax,rdx
  803216:	48 c1 e0 02          	shl    rax,0x2
  80321a:	48 01 d0             	add    rax,rdx
  80321d:	48 c1 e0 05          	shl    rax,0x5
  803221:	48 05 a8 58 40 00    	add    rax,0x4058a8
  803227:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80322a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80322e:	48 89 c7             	mov    rdi,rax
  803231:	ff d2                	call   rdx
  803233:	e9 26 01 00 00       	jmp    80335e <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  803238:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80323b:	48 63 d0             	movsxd rdx,eax
  80323e:	48 89 d0             	mov    rax,rdx
  803241:	48 c1 e0 02          	shl    rax,0x2
  803245:	48 01 d0             	add    rax,rdx
  803248:	48 c1 e0 05          	shl    rax,0x5
  80324c:	48 05 b0 58 40 00    	add    rax,0x4058b0
  803252:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803255:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803259:	48 89 c7             	mov    rdi,rax
  80325c:	ff d2                	call   rdx
  80325e:	e9 fb 00 00 00       	jmp    80335e <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  803263:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803266:	48 63 d0             	movsxd rdx,eax
  803269:	48 89 d0             	mov    rax,rdx
  80326c:	48 c1 e0 02          	shl    rax,0x2
  803270:	48 01 d0             	add    rax,rdx
  803273:	48 c1 e0 05          	shl    rax,0x5
  803277:	48 05 b8 58 40 00    	add    rax,0x4058b8
  80327d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803280:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803284:	48 89 c7             	mov    rdi,rax
  803287:	ff d2                	call   rdx
  803289:	e9 d0 00 00 00       	jmp    80335e <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  80328e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803291:	48 63 d0             	movsxd rdx,eax
  803294:	48 89 d0             	mov    rax,rdx
  803297:	48 c1 e0 02          	shl    rax,0x2
  80329b:	48 01 d0             	add    rax,rdx
  80329e:	48 c1 e0 05          	shl    rax,0x5
  8032a2:	48 05 c0 58 40 00    	add    rax,0x4058c0
  8032a8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8032ab:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8032af:	48 89 c7             	mov    rdi,rax
  8032b2:	ff d2                	call   rdx
  8032b4:	e9 a5 00 00 00       	jmp    80335e <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  8032b9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032bc:	48 63 d0             	movsxd rdx,eax
  8032bf:	48 89 d0             	mov    rax,rdx
  8032c2:	48 c1 e0 02          	shl    rax,0x2
  8032c6:	48 01 d0             	add    rax,rdx
  8032c9:	48 c1 e0 05          	shl    rax,0x5
  8032cd:	48 05 c8 58 40 00    	add    rax,0x4058c8
  8032d3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8032d6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8032da:	48 89 c7             	mov    rdi,rax
  8032dd:	ff d2                	call   rdx
  8032df:	eb 7d                	jmp    80335e <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  8032e1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032e4:	48 63 d0             	movsxd rdx,eax
  8032e7:	48 89 d0             	mov    rax,rdx
  8032ea:	48 c1 e0 02          	shl    rax,0x2
  8032ee:	48 01 d0             	add    rax,rdx
  8032f1:	48 c1 e0 05          	shl    rax,0x5
  8032f5:	48 05 d0 58 40 00    	add    rax,0x4058d0
  8032fb:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8032fe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803302:	48 89 c7             	mov    rdi,rax
  803305:	ff d2                	call   rdx
  803307:	eb 55                	jmp    80335e <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  803309:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80330c:	48 63 d0             	movsxd rdx,eax
  80330f:	48 89 d0             	mov    rax,rdx
  803312:	48 c1 e0 02          	shl    rax,0x2
  803316:	48 01 d0             	add    rax,rdx
  803319:	48 c1 e0 05          	shl    rax,0x5
  80331d:	48 05 d8 58 40 00    	add    rax,0x4058d8
  803323:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803326:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80332a:	48 89 c7             	mov    rdi,rax
  80332d:	ff d2                	call   rdx
  80332f:	eb 2d                	jmp    80335e <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  803331:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803334:	48 63 d0             	movsxd rdx,eax
  803337:	48 89 d0             	mov    rax,rdx
  80333a:	48 c1 e0 02          	shl    rax,0x2
  80333e:	48 01 d0             	add    rax,rdx
  803341:	48 c1 e0 05          	shl    rax,0x5
  803345:	48 05 e0 58 40 00    	add    rax,0x4058e0
  80334b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80334e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803352:	48 89 c7             	mov    rdi,rax
  803355:	ff d2                	call   rdx
  803357:	eb 05                	jmp    80335e <call_drv_func+0x255>
    }
    return -1;
  803359:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80335e:	c9                   	leave  
  80335f:	c3                   	ret    

0000000000803360 <dispose_device>:
int dispose_device(int dev){
  803360:	f3 0f 1e fa          	endbr64 
  803364:	55                   	push   rbp
  803365:	48 89 e5             	mov    rbp,rsp
  803368:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  80336b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80336e:	48 63 d0             	movsxd rdx,eax
  803371:	48 89 d0             	mov    rax,rdx
  803374:	48 c1 e0 02          	shl    rax,0x2
  803378:	48 01 d0             	add    rax,rdx
  80337b:	48 c1 e0 02          	shl    rax,0x2
  80337f:	48 01 d0             	add    rax,rdx
  803382:	48 c1 e0 03          	shl    rax,0x3
  803386:	48 05 90 2e 40 00    	add    rax,0x402e90
  80338c:	8b 00                	mov    eax,DWORD PTR [rax]
  80338e:	83 f8 01             	cmp    eax,0x1
  803391:	74 07                	je     80339a <dispose_device+0x3a>
  803393:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803398:	eb 62                	jmp    8033fc <dispose_device+0x9c>
    device* p=&devs[dev];
  80339a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80339d:	48 63 d0             	movsxd rdx,eax
  8033a0:	48 89 d0             	mov    rax,rdx
  8033a3:	48 c1 e0 02          	shl    rax,0x2
  8033a7:	48 01 d0             	add    rax,rdx
  8033aa:	48 c1 e0 02          	shl    rax,0x2
  8033ae:	48 01 d0             	add    rax,rdx
  8033b1:	48 c1 e0 03          	shl    rax,0x3
  8033b5:	48 05 80 2e 40 00    	add    rax,0x402e80
  8033bb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  8033bf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8033c3:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  8033ca:	48 85 c0             	test   rax,rax
  8033cd:	74 1d                	je     8033ec <dispose_device+0x8c>
  8033cf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8033d3:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  8033da:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8033de:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  8033e5:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  8033ec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8033f0:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  8033f7:	b8 00 00 00 00       	mov    eax,0x0
}
  8033fc:	5d                   	pop    rbp
  8033fd:	c3                   	ret    

00000000008033fe <dispose_driver>:
int dispose_driver(driver *drv){
  8033fe:	f3 0f 1e fa          	endbr64 
  803402:	55                   	push   rbp
  803403:	48 89 e5             	mov    rbp,rsp
  803406:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  80340a:	90                   	nop
  80340b:	5d                   	pop    rbp
  80340c:	c3                   	ret    

000000000080340d <get_dev>:

device *get_dev(int devi)
{
  80340d:	f3 0f 1e fa          	endbr64 
  803411:	55                   	push   rbp
  803412:	48 89 e5             	mov    rbp,rsp
  803415:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  803418:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80341b:	48 63 d0             	movsxd rdx,eax
  80341e:	48 89 d0             	mov    rax,rdx
  803421:	48 c1 e0 02          	shl    rax,0x2
  803425:	48 01 d0             	add    rax,rdx
  803428:	48 c1 e0 02          	shl    rax,0x2
  80342c:	48 01 d0             	add    rax,rdx
  80342f:	48 c1 e0 03          	shl    rax,0x3
  803433:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  803439:	5d                   	pop    rbp
  80343a:	c3                   	ret    

000000000080343b <get_drv>:
driver *get_drv(int drvi)
{
  80343b:	f3 0f 1e fa          	endbr64 
  80343f:	55                   	push   rbp
  803440:	48 89 e5             	mov    rbp,rsp
  803443:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  803446:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803449:	48 63 d0             	movsxd rdx,eax
  80344c:	48 89 d0             	mov    rax,rdx
  80344f:	48 c1 e0 02          	shl    rax,0x2
  803453:	48 01 d0             	add    rax,rdx
  803456:	48 c1 e0 05          	shl    rax,0x5
  80345a:	48 05 80 58 40 00    	add    rax,0x405880
}
  803460:	5d                   	pop    rbp
  803461:	c3                   	ret    

0000000000803462 <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  803462:	f3 0f 1e fa          	endbr64 
  803466:	55                   	push   rbp
  803467:	48 89 e5             	mov    rbp,rsp
  80346a:	53                   	push   rbx
  80346b:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  80346f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  803476:	eb 23                	jmp    80349b <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803478:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80347b:	48 63 d0             	movsxd rdx,eax
  80347e:	48 89 d0             	mov    rax,rdx
  803481:	48 01 c0             	add    rax,rax
  803484:	48 01 d0             	add    rax,rdx
  803487:	48 c1 e0 06          	shl    rax,0x6
  80348b:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803491:	8b 00                	mov    eax,DWORD PTR [rax]
  803493:	85 c0                	test   eax,eax
  803495:	74 0c                	je     8034a3 <make_request+0x41>
    for(;i<NR_REQS;i++)
  803497:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80349b:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  80349f:	7e d7                	jle    803478 <make_request+0x16>
  8034a1:	eb 01                	jmp    8034a4 <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  8034a3:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  8034a4:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  8034a8:	75 0a                	jne    8034b4 <make_request+0x52>
  8034aa:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8034af:	e9 e7 01 00 00       	jmp    80369b <make_request+0x239>
    reqs[i]=*args;//放入数组
  8034b4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8034b7:	48 63 d0             	movsxd rdx,eax
  8034ba:	48 89 d0             	mov    rax,rdx
  8034bd:	48 01 c0             	add    rax,rax
  8034c0:	48 01 d0             	add    rax,rdx
  8034c3:	48 c1 e0 06          	shl    rax,0x6
  8034c7:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8034ce:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8034d2:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8034d5:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  8034d9:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  8034dc:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8034e0:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8034e4:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8034e8:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  8034ec:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  8034f0:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  8034f4:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  8034f8:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  8034fc:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  803500:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  803504:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  803508:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  80350c:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  803510:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  803514:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  803518:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  80351c:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  803520:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  803524:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  803528:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  80352c:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  803530:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  803534:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  803538:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  80353c:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  803540:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  803544:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  803548:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  80354c:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  803550:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803557:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  80355e:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  803565:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  80356c:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  803573:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  80357a:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  803581:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  803588:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  80358f:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  803596:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  80359d:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  8035a4:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  8035ab:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  8035b2:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  8035b9:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  8035c0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8035c4:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  8035ca:	48 63 d0             	movsxd rdx,eax
  8035cd:	48 89 d0             	mov    rax,rdx
  8035d0:	48 c1 e0 02          	shl    rax,0x2
  8035d4:	48 01 d0             	add    rax,rdx
  8035d7:	48 c1 e0 02          	shl    rax,0x2
  8035db:	48 01 d0             	add    rax,rdx
  8035de:	48 c1 e0 03          	shl    rax,0x3
  8035e2:	48 05 80 2e 40 00    	add    rax,0x402e80
  8035e8:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  8035ec:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8035f0:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8035f7:	48 85 c0             	test   rax,rax
  8035fa:	75 27                	jne    803623 <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  8035fc:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8035ff:	48 63 d0             	movsxd rdx,eax
  803602:	48 89 d0             	mov    rax,rdx
  803605:	48 01 c0             	add    rax,rax
  803608:	48 01 d0             	add    rax,rdx
  80360b:	48 c1 e0 06          	shl    rax,0x6
  80360f:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803616:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80361a:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  803621:	eb 75                	jmp    803698 <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  803623:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803627:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  80362e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  803632:	eb 0f                	jmp    803643 <make_request+0x1e1>
  803634:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803638:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  80363f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803643:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803647:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  80364e:	48 85 c0             	test   rax,rax
  803651:	75 e1                	jne    803634 <make_request+0x1d2>
        p->next=&reqs[i];
  803653:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803656:	48 63 d0             	movsxd rdx,eax
  803659:	48 89 d0             	mov    rax,rdx
  80365c:	48 01 c0             	add    rax,rax
  80365f:	48 01 d0             	add    rax,rdx
  803662:	48 c1 e0 06          	shl    rax,0x6
  803666:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  80366d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803671:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  803678:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80367b:	48 63 d0             	movsxd rdx,eax
  80367e:	48 89 d0             	mov    rax,rdx
  803681:	48 01 c0             	add    rax,rax
  803684:	48 01 d0             	add    rax,rdx
  803687:	48 c1 e0 06          	shl    rax,0x6
  80368b:	48 05 38 6d 40 00    	add    rax,0x406d38
  803691:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  803698:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  80369b:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80369f:	c9                   	leave  
  8036a0:	c3                   	ret    

00000000008036a1 <do_req>:
//取出一个申请并且执行
int do_req()
{
  8036a1:	f3 0f 1e fa          	endbr64 
  8036a5:	55                   	push   rbp
  8036a6:	48 89 e5             	mov    rbp,rsp
  8036a9:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  8036ad:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8036b4:	e9 ab 00 00 00       	jmp    803764 <do_req+0xc3>
    {
        device* p=dev_tree[i];
  8036b9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8036bc:	48 98                	cdqe   
  8036be:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  8036c5:	00 
  8036c6:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  8036ca:	e9 86 00 00 00       	jmp    803755 <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  8036cf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8036d3:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  8036da:	48 85 c0             	test   rax,rax
  8036dd:	75 67                	jne    803746 <do_req+0xa5>
  8036df:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8036e3:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8036ea:	48 85 c0             	test   rax,rax
  8036ed:	74 57                	je     803746 <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  8036ef:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8036f3:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  8036fa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8036fe:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  803705:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803709:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803710:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  803717:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80371b:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  803722:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803726:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  80372c:	48 98                	cdqe   
  80372e:	48 8b 14 c5 80 9d 80 	mov    rdx,QWORD PTR [rax*8+0x809d80]
  803735:	00 
  803736:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80373a:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803741:	48 89 c7             	mov    rdi,rax
  803744:	ff d2                	call   rdx
        for(;p;p=p->next)
  803746:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80374a:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  803751:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  803755:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  80375a:	0f 85 6f ff ff ff    	jne    8036cf <do_req+0x2e>
    for(int i=0;i<3;i++)
  803760:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803764:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  803768:	0f 8e 4b ff ff ff    	jle    8036b9 <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  80376e:	b8 00 00 00 00       	mov    eax,0x0
}
  803773:	c9                   	leave  
  803774:	c3                   	ret    

0000000000803775 <wait_on_req>:


void wait_on_req(int reqi)
{
  803775:	f3 0f 1e fa          	endbr64 
  803779:	55                   	push   rbp
  80377a:	48 89 e5             	mov    rbp,rsp
  80377d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  803780:	90                   	nop
  803781:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803784:	48 63 d0             	movsxd rdx,eax
  803787:	48 89 d0             	mov    rax,rdx
  80378a:	48 01 c0             	add    rax,rax
  80378d:	48 01 d0             	add    rax,rdx
  803790:	48 c1 e0 06          	shl    rax,0x6
  803794:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  80379a:	8b 00                	mov    eax,DWORD PTR [rax]
  80379c:	83 f8 03             	cmp    eax,0x3
  80379f:	75 e0                	jne    803781 <wait_on_req+0xc>
}
  8037a1:	90                   	nop
  8037a2:	90                   	nop
  8037a3:	5d                   	pop    rbp
  8037a4:	c3                   	ret    

00000000008037a5 <clear_req>:
void clear_req(int reqi)
{
  8037a5:	f3 0f 1e fa          	endbr64 
  8037a9:	55                   	push   rbp
  8037aa:	48 89 e5             	mov    rbp,rsp
  8037ad:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  8037b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8037b3:	48 63 d0             	movsxd rdx,eax
  8037b6:	48 89 d0             	mov    rax,rdx
  8037b9:	48 01 c0             	add    rax,rax
  8037bc:	48 01 d0             	add    rax,rdx
  8037bf:	48 c1 e0 06          	shl    rax,0x6
  8037c3:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  8037c9:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  8037cf:	90                   	nop
  8037d0:	5d                   	pop    rbp
  8037d1:	c3                   	ret    

00000000008037d2 <init_proc>:
struct process task[MAX_PROC_COUNT];
TSS scene_saver;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  8037d2:	f3 0f 1e fa          	endbr64 
  8037d6:	55                   	push   rbp
  8037d7:	48 89 e5             	mov    rbp,rsp
  8037da:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  8037de:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8037e5:	eb 4c                	jmp    803833 <init_proc+0x61>
        task[i].pid=-1;
  8037e7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8037ea:	48 98                	cdqe   
  8037ec:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8037f3:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8037f9:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  8037ff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803802:	48 98                	cdqe   
  803804:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80380b:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803811:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  803817:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80381a:	48 98                	cdqe   
  80381c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803823:	48 05 00 85 40 00    	add    rax,0x408500
  803829:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  80382f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803833:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803837:	7e ae                	jle    8037e7 <init_proc+0x15>
    }
    cur_proc=0;//no proc
  803839:	c7 05 2d e8 c0 ff 00 	mov    DWORD PTR [rip+0xffffffffffc0e82d],0x0        # 412070 <cur_proc>
  803840:	00 00 00 
    pidd=1;
  803843:	c7 05 27 e8 c0 ff 01 	mov    DWORD PTR [rip+0xffffffffffc0e827],0x1        # 412074 <pidd>
  80384a:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  80384d:	b8 00 00 00 00       	mov    eax,0x0
  803852:	e8 38 00 00 00       	call   80388f <create_proc>
  803857:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  80385a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80385d:	48 98                	cdqe   
  80385f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803866:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80386c:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  803872:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803875:	83 c0 03             	add    eax,0x3
  803878:	c1 e0 04             	shl    eax,0x4
  80387b:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  80387e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803881:	01 c0                	add    eax,eax
  803883:	83 c0 05             	add    eax,0x5
  803886:	c1 e0 03             	shl    eax,0x3
  803889:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
}
  80388c:	90                   	nop
  80388d:	c9                   	leave  
  80388e:	c3                   	ret    

000000000080388f <create_proc>:

int create_proc()
{
  80388f:	f3 0f 1e fa          	endbr64 
  803893:	55                   	push   rbp
  803894:	48 89 e5             	mov    rbp,rsp
  803897:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  80389b:	b8 00 00 00 00       	mov    eax,0x0
  8038a0:	e8 7d 00 00 00       	call   803922 <req_proc>
  8038a5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  8038a8:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8038ac:	75 07                	jne    8038b5 <create_proc+0x26>
  8038ae:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8038b3:	eb 6b                	jmp    803920 <create_proc+0x91>
    int curesp=0x9fc00-1;
  8038b5:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%esp,%0":"=m"(curesp));
  8038bc:	89 65 f8             	mov    DWORD PTR [rbp-0x8],esp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0,0,0,0,0x17,0xf,0x17,0x17,0x17,0x17,curesp,0,0,0,0,index);
  8038bf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8038c2:	48 98                	cdqe   
  8038c4:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8038c7:	52                   	push   rdx
  8038c8:	6a 00                	push   0x0
  8038ca:	6a 00                	push   0x0
  8038cc:	6a 00                	push   0x0
  8038ce:	6a 00                	push   0x0
  8038d0:	50                   	push   rax
  8038d1:	6a 17                	push   0x17
  8038d3:	6a 17                	push   0x17
  8038d5:	6a 17                	push   0x17
  8038d7:	6a 17                	push   0x17
  8038d9:	41 b9 0f 00 00 00    	mov    r9d,0xf
  8038df:	41 b8 17 00 00 00    	mov    r8d,0x17
  8038e5:	b9 00 00 00 00       	mov    ecx,0x0
  8038ea:	ba 00 00 00 00       	mov    edx,0x0
  8038ef:	be 00 00 00 00       	mov    esi,0x0
  8038f4:	bf 00 00 00 00       	mov    edi,0x0
  8038f9:	e8 f0 00 00 00       	call   8039ee <set_proc>
  8038fe:	48 83 c4 50          	add    rsp,0x50
    task[index].tss.eip=(long)proc_zero;
  803902:	ba 72 3c 80 00       	mov    edx,0x803c72
  803907:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80390a:	48 98                	cdqe   
  80390c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803913:	48 05 70 86 40 00    	add    rax,0x408670
  803919:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx

    return index;
  80391d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803920:	c9                   	leave  
  803921:	c3                   	ret    

0000000000803922 <req_proc>:
int req_proc(){
  803922:	f3 0f 1e fa          	endbr64 
  803926:	55                   	push   rbp
  803927:	48 89 e5             	mov    rbp,rsp
    int num=0;
  80392a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803931:	eb 04                	jmp    803937 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  803933:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803937:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80393a:	48 98                	cdqe   
  80393c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803943:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803949:	8b 00                	mov    eax,DWORD PTR [rax]
  80394b:	83 f8 ff             	cmp    eax,0xffffffff
  80394e:	74 1f                	je     80396f <req_proc+0x4d>
  803950:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803953:	48 98                	cdqe   
  803955:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80395c:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803962:	8b 00                	mov    eax,DWORD PTR [rax]
  803964:	83 f8 03             	cmp    eax,0x3
  803967:	74 06                	je     80396f <req_proc+0x4d>
  803969:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  80396d:	7e c4                	jle    803933 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  80396f:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803973:	7e 07                	jle    80397c <req_proc+0x5a>
        return -1;
  803975:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80397a:	eb 70                	jmp    8039ec <req_proc+0xca>
    task[num].pid=pidd++;
  80397c:	8b 05 f2 e6 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e6f2]        # 412074 <pidd>
  803982:	8d 50 01             	lea    edx,[rax+0x1]
  803985:	89 15 e9 e6 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e6e9],edx        # 412074 <pidd>
  80398b:	89 c2                	mov    edx,eax
  80398d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803990:	48 98                	cdqe   
  803992:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803999:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80399f:	89 10                	mov    DWORD PTR [rax],edx
    task[num].stat=ENDED;
  8039a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039a4:	48 98                	cdqe   
  8039a6:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8039ad:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8039b3:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  8039b9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039bc:	48 98                	cdqe   
  8039be:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8039c5:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8039cb:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  8039d1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039d4:	48 98                	cdqe   
  8039d6:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8039dd:	48 05 ac 84 40 00    	add    rax,0x4084ac
  8039e3:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  8039e9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8039ec:	5d                   	pop    rbp
  8039ed:	c3                   	ret    

00000000008039ee <set_proc>:
void set_proc(long eax,long ebx,long ecx,long edx,long es,long cs,long ss,long ds,long fs,long gs\
,long esp,long ebp,long esi,long edi,long eflags,int proc_nr){
  8039ee:	f3 0f 1e fa          	endbr64 
  8039f2:	55                   	push   rbp
  8039f3:	48 89 e5             	mov    rbp,rsp
  8039f6:	48 83 ec 40          	sub    rsp,0x40
  8039fa:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8039fe:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803a02:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803a06:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803a0a:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  803a0e:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803a12:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803a15:	48 98                	cdqe   
  803a17:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803a1e:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803a24:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->tss.eax=eax;
  803a28:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a2c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803a30:	48 89 90 ec 01 00 00 	mov    QWORD PTR [rax+0x1ec],rdx
    proc->tss.ebx=ebx;
  803a37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a3b:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  803a3f:	48 89 90 04 02 00 00 	mov    QWORD PTR [rax+0x204],rdx
    proc->tss.ecx=ecx;
  803a46:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a4a:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803a4e:	48 89 90 f4 01 00 00 	mov    QWORD PTR [rax+0x1f4],rdx
    proc->tss.edx=edx;
  803a55:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a59:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  803a5d:	48 89 90 fc 01 00 00 	mov    QWORD PTR [rax+0x1fc],rdx
    proc->tss.es=es;
  803a64:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a68:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803a6c:	48 89 90 2c 02 00 00 	mov    QWORD PTR [rax+0x22c],rdx
    proc->tss.cs=cs;
  803a73:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a77:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803a7b:	48 89 90 34 02 00 00 	mov    QWORD PTR [rax+0x234],rdx
    proc->tss.ss=ss;
  803a82:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a86:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803a8a:	48 89 90 3c 02 00 00 	mov    QWORD PTR [rax+0x23c],rdx
    proc->tss.ss0=ss;
  803a91:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a95:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803a99:	48 89 90 ac 01 00 00 	mov    QWORD PTR [rax+0x1ac],rdx
    proc->tss.ss1=ss;
  803aa0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803aa4:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803aa8:	48 89 90 bc 01 00 00 	mov    QWORD PTR [rax+0x1bc],rdx
    proc->tss.ss2=ss;
  803aaf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ab3:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803ab7:	48 89 90 cc 01 00 00 	mov    QWORD PTR [rax+0x1cc],rdx
    proc->tss.ds=ds;
  803abe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ac2:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803ac6:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    proc->tss.fs=fs;
  803acd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ad1:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803ad5:	48 89 90 4c 02 00 00 	mov    QWORD PTR [rax+0x24c],rdx
    proc->tss.gs=gs;
  803adc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ae0:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803ae4:	48 89 90 54 02 00 00 	mov    QWORD PTR [rax+0x254],rdx
    proc->tss.esp=esp;
  803aeb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803aef:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803af3:	48 89 90 0c 02 00 00 	mov    QWORD PTR [rax+0x20c],rdx
    proc->tss.esp0=esp;
  803afa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803afe:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803b02:	48 89 90 a4 01 00 00 	mov    QWORD PTR [rax+0x1a4],rdx
    proc->tss.esp1=esp;
  803b09:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b0d:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803b11:	48 89 90 b4 01 00 00 	mov    QWORD PTR [rax+0x1b4],rdx
    proc->tss.esp2=esp;
  803b18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b1c:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803b20:	48 89 90 c4 01 00 00 	mov    QWORD PTR [rax+0x1c4],rdx
    proc->tss.ebp=ebp;
  803b27:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b2b:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803b2f:	48 89 90 14 02 00 00 	mov    QWORD PTR [rax+0x214],rdx
    proc->tss.esi=esi;
  803b36:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b3a:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803b3e:	48 89 90 1c 02 00 00 	mov    QWORD PTR [rax+0x21c],rdx
    proc->tss.edi=edi;
  803b45:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b49:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803b4d:	48 89 90 24 02 00 00 	mov    QWORD PTR [rax+0x224],rdx
    proc->tss.eflags=0x202;//设置为默认值:0b 0010 0000 0010
  803b54:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b58:	48 c7 80 e4 01 00 00 	mov    QWORD PTR [rax+0x1e4],0x202
  803b5f:	02 02 00 00 
    //能接受中断
    proc->tss.eip=(long)proc_zero;
  803b63:	ba 72 3c 80 00       	mov    edx,0x803c72
  803b68:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b6c:	48 89 90 dc 01 00 00 	mov    QWORD PTR [rax+0x1dc],rdx

    proc->tss.cs=cs;
  803b73:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b77:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803b7b:	48 89 90 34 02 00 00 	mov    QWORD PTR [rax+0x234],rdx
    proc->tss.ds=ds;
  803b82:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b86:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803b8a:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    proc->tss.es=es;
  803b91:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b95:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803b99:	48 89 90 2c 02 00 00 	mov    QWORD PTR [rax+0x22c],rdx
    proc->tss.cr3=PAGE_INDEX_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803ba0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ba4:	48 c7 80 d4 01 00 00 	mov    QWORD PTR [rax+0x1d4],0x1000
  803bab:	00 10 00 00 

    proc->tss.ldt= _LDT_IND(proc_nr)*8;
  803baf:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803bb2:	83 c0 03             	add    eax,0x3
  803bb5:	c1 e0 04             	shl    eax,0x4
  803bb8:	48 63 d0             	movsxd rdx,eax
  803bbb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bbf:	48 89 90 5c 02 00 00 	mov    QWORD PTR [rax+0x25c],rdx
    //在gdt中添加tss
    fill_desc(&proc->tss,0xffff,SEG_SYS_TSS|SEG_PRESENT,_TSS_IND(proc_nr));
  803bc6:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803bc9:	01 c0                	add    eax,eax
  803bcb:	83 c0 05             	add    eax,0x5
  803bce:	89 c2                	mov    edx,eax
  803bd0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bd4:	48 05 9c 01 00 00    	add    rax,0x19c
  803bda:	89 d1                	mov    ecx,edx
  803bdc:	ba 89 00 00 00       	mov    edx,0x89
  803be1:	be ff ff 00 00       	mov    esi,0xffff
  803be6:	89 c7                	mov    edi,eax
  803be8:	e8 e6 0d 00 00       	call   8049d3 <fill_desc>
    //添加ldt
    fill_desc(proc->ldt, sizeof(proc->ldt),SEG_SYS_LDT|SEG_PRESENT, _LDT_IND(proc_nr));
  803bed:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803bf0:	83 c0 03             	add    eax,0x3
  803bf3:	01 c0                	add    eax,eax
  803bf5:	89 c2                	mov    edx,eax
  803bf7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bfb:	48 83 c0 34          	add    rax,0x34
  803bff:	89 d1                	mov    ecx,edx
  803c01:	ba 82 00 00 00       	mov    edx,0x82
  803c06:	be 28 00 00 00       	mov    esi,0x28
  803c0b:	89 c7                	mov    edi,eax
  803c0d:	e8 c1 0d 00 00       	call   8049d3 <fill_desc>
    //设置ldt
    fill_ldt_desc(0,0xffffffff,\
  803c12:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c16:	48 83 c0 34          	add    rax,0x34
  803c1a:	48 89 c1             	mov    rcx,rax
  803c1d:	ba fe cf 00 00       	mov    edx,0xcffe
  803c22:	be ff ff ff ff       	mov    esi,0xffffffff
  803c27:	bf 00 00 00 00       	mov    edi,0x0
  803c2c:	e8 c9 0e 00 00       	call   804afa <fill_ldt_desc>
    SEG_CONFORMING_RW_CODE|SEG_DPL_3,&proc->ldt[0]);
    fill_ldt_desc(0,0xffffffff,\
  803c31:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c35:	48 83 c0 3c          	add    rax,0x3c
  803c39:	48 89 c1             	mov    rcx,rax
  803c3c:	ba f2 cf 00 00       	mov    edx,0xcff2
  803c41:	be ff ff ff ff       	mov    esi,0xffffffff
  803c46:	bf 00 00 00 00       	mov    edi,0x0
  803c4b:	e8 aa 0e 00 00       	call   804afa <fill_ldt_desc>
    SEG_RW_DATA|SEG_DPL_3,&proc->ldt[1]);
    fill_ldt_desc(0x1c00000-0x1000,0x1000,\
  803c50:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c54:	48 83 c0 44          	add    rax,0x44
  803c58:	48 89 c1             	mov    rcx,rax
  803c5b:	ba f6 00 00 00       	mov    edx,0xf6
  803c60:	be 00 10 00 00       	mov    esi,0x1000
  803c65:	bf 00 f0 bf 01       	mov    edi,0x1bff000
  803c6a:	e8 8b 0e 00 00       	call   804afa <fill_ldt_desc>
    SEG_STACK|SEG_DPL_3,&proc->ldt[2]);

}
  803c6f:	90                   	nop
  803c70:	c9                   	leave  
  803c71:	c3                   	ret    

0000000000803c72 <proc_zero>:
void proc_zero()
{
  803c72:	f3 0f 1e fa          	endbr64 
  803c76:	55                   	push   rbp
  803c77:	48 89 e5             	mov    rbp,rsp

    while(1);
  803c7a:	eb fe                	jmp    803c7a <proc_zero+0x8>

0000000000803c7c <manage_proc>:
}
void manage_proc(){
  803c7c:	f3 0f 1e fa          	endbr64 
  803c80:	55                   	push   rbp
  803c81:	48 89 e5             	mov    rbp,rsp
  803c84:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803c88:	8b 05 e2 e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e3e2]        # 412070 <cur_proc>
  803c8e:	83 f8 ff             	cmp    eax,0xffffffff
  803c91:	74 2d                	je     803cc0 <manage_proc+0x44>
        task[cur_proc].utime++;
  803c93:	8b 05 d7 e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e3d7]        # 412070 <cur_proc>
  803c99:	48 63 d0             	movsxd rdx,eax
  803c9c:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  803ca3:	48 81 c2 a8 84 40 00 	add    rdx,0x4084a8
  803caa:	8b 12                	mov    edx,DWORD PTR [rdx]
  803cac:	83 c2 01             	add    edx,0x1
  803caf:	48 98                	cdqe   
  803cb1:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803cb8:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803cbe:	89 10                	mov    DWORD PTR [rax],edx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803cc0:	8b 05 aa e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e3aa]        # 412070 <cur_proc>
  803cc6:	83 f8 ff             	cmp    eax,0xffffffff
  803cc9:	74 3c                	je     803d07 <manage_proc+0x8b>
  803ccb:	8b 05 9f e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e39f]        # 412070 <cur_proc>
  803cd1:	48 98                	cdqe   
  803cd3:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803cda:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803ce0:	8b 00                	mov    eax,DWORD PTR [rax]
  803ce2:	83 f8 01             	cmp    eax,0x1
  803ce5:	77 20                	ja     803d07 <manage_proc+0x8b>
    task[cur_proc].stat!=READY){
  803ce7:	8b 05 83 e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e383]        # 412070 <cur_proc>
  803ced:	48 98                	cdqe   
  803cef:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803cf6:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803cfc:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803cfe:	83 f8 01             	cmp    eax,0x1
  803d01:	0f 84 90 00 00 00    	je     803d97 <manage_proc+0x11b>
        if(cur_proc!=-1)
  803d07:	8b 05 63 e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e363]        # 412070 <cur_proc>
  803d0d:	83 f8 ff             	cmp    eax,0xffffffff
  803d10:	74 1b                	je     803d2d <manage_proc+0xb1>
            task[cur_proc].utime=0;
  803d12:	8b 05 58 e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e358]        # 412070 <cur_proc>
  803d18:	48 98                	cdqe   
  803d1a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803d21:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803d27:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=0;
  803d2d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  803d34:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803d3b:	eb 41                	jmp    803d7e <manage_proc+0x102>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803d3d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d40:	48 98                	cdqe   
  803d42:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803d49:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d4f:	8b 00                	mov    eax,DWORD PTR [rax]
  803d51:	83 f8 ff             	cmp    eax,0xffffffff
  803d54:	74 24                	je     803d7a <manage_proc+0xfe>
  803d56:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d59:	48 98                	cdqe   
  803d5b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803d62:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803d68:	8b 00                	mov    eax,DWORD PTR [rax]
  803d6a:	83 f8 01             	cmp    eax,0x1
  803d6d:	75 0b                	jne    803d7a <manage_proc+0xfe>
  803d6f:	8b 05 fb e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e2fb]        # 412070 <cur_proc>
  803d75:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  803d78:	75 0c                	jne    803d86 <manage_proc+0x10a>
        for(i=0;i<MAX_PROC_COUNT;i++){
  803d7a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803d7e:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803d82:	7e b9                	jle    803d3d <manage_proc+0xc1>
  803d84:	eb 01                	jmp    803d87 <manage_proc+0x10b>
                break;
  803d86:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  803d87:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803d8b:	7f 0d                	jg     803d9a <manage_proc+0x11e>
            return;
        //switch
        switch_proc_tss(i);
  803d8d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d90:	89 c7                	mov    edi,eax
  803d92:	e8 06 00 00 00       	call   803d9d <switch_proc_tss>
    }
    return;
  803d97:	90                   	nop
  803d98:	eb 01                	jmp    803d9b <manage_proc+0x11f>
            return;
  803d9a:	90                   	nop
}
  803d9b:	c9                   	leave  
  803d9c:	c3                   	ret    

0000000000803d9d <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  803d9d:	f3 0f 1e fa          	endbr64 
  803da1:	55                   	push   rbp
  803da2:	48 89 e5             	mov    rbp,rsp
  803da5:	48 83 ec 20          	sub    rsp,0x20
  803da9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  803dac:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803daf:	01 c0                	add    eax,eax
  803db1:	83 c0 05             	add    eax,0x5
  803db4:	c1 e0 03             	shl    eax,0x3
  803db7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  803dba:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803dbd:	89 05 ad e2 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e2ad],eax        # 412070 <cur_proc>
    switch_proc_asm(sel);
  803dc3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803dc6:	89 c7                	mov    edi,eax
  803dc8:	e8 6d 5e 00 00       	call   809c3a <switch_proc_asm>
}
  803dcd:	90                   	nop
  803dce:	c9                   	leave  
  803dcf:	c3                   	ret    

0000000000803dd0 <switch_proc>:
void switch_proc(int pnr){
  803dd0:	f3 0f 1e fa          	endbr64 
  803dd4:	55                   	push   rbp
  803dd5:	48 89 e5             	mov    rbp,rsp
  803dd8:	48 81 ec 80 02 00 00 	sub    rsp,0x280
  803ddf:	89 bd 8c fd ff ff    	mov    DWORD PTR [rbp-0x274],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  803de5:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803deb:	48 98                	cdqe   
  803ded:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803df4:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803dfb:	48 8d 85 90 fd ff ff 	lea    rax,[rbp-0x270]
  803e02:	b9 4d 00 00 00       	mov    ecx,0x4d
  803e07:	48 89 c7             	mov    rdi,rax
  803e0a:	48 89 d6             	mov    rsi,rdx
  803e0d:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
  803e10:	48 89 f2             	mov    rdx,rsi
  803e13:	48 89 f8             	mov    rax,rdi
  803e16:	8b 0a                	mov    ecx,DWORD PTR [rdx]
  803e18:	89 08                	mov    DWORD PTR [rax],ecx
    save_context(&task[cur_proc].tss);
  803e1a:	8b 05 50 e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e250]        # 412070 <cur_proc>
  803e20:	48 98                	cdqe   
  803e22:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803e29:	48 05 90 01 00 00    	add    rax,0x190
  803e2f:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803e35:	48 83 c0 0c          	add    rax,0xc
  803e39:	48 89 c7             	mov    rdi,rax
  803e3c:	e8 69 00 00 00       	call   803eaa <save_context>
    //重新设置0号进程
    task[0].tss.eip=proc_zero;
  803e41:	b8 72 3c 80 00       	mov    eax,0x803c72
  803e46:	48 89 05 2f 48 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc0482f],rax        # 40867c <task+0x1dc>
    task[0].tss.cr3=PAGE_INDEX_ADDR;
  803e4d:	48 c7 05 1c 48 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc0481c],0x1000        # 408674 <task+0x1d4>
  803e54:	00 10 00 00 
    task[0].tss.eflags=0x202;
  803e58:	48 c7 05 21 48 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc04821],0x202        # 408684 <task+0x1e4>
  803e5f:	02 02 00 00 
    cur_proc=pnr;
  803e63:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803e69:	89 05 01 e2 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e201],eax        # 412070 <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  803e6f:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803e75:	01 c0                	add    eax,eax
  803e77:	83 c0 05             	add    eax,0x5
  803e7a:	c1 e0 03             	shl    eax,0x3
  803e7d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(&task[pnr].tss);
  803e80:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803e86:	48 98                	cdqe   
  803e88:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803e8f:	48 05 90 01 00 00    	add    rax,0x190
  803e95:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803e9b:	48 83 c0 0c          	add    rax,0xc
  803e9f:	48 89 c7             	mov    rdi,rax
  803ea2:	e8 b4 5d 00 00       	call   809c5b <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  803ea7:	90                   	nop
  803ea8:	c9                   	leave  
  803ea9:	c3                   	ret    

0000000000803eaa <save_context>:
void save_context(TSS *tss)
{
  803eaa:	f3 0f 1e fa          	endbr64 
  803eae:	55                   	push   rbp
  803eaf:	48 89 e5             	mov    rbp,rsp
  803eb2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    tss->eip=scene_saver.eip;
  803eb6:	48 8b 15 23 e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e123]        # 411fe0 <scene_saver+0x40>
  803ebd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ec1:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    tss->eax=scene_saver.eax;
  803ec5:	48 8b 15 24 e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e124]        # 411ff0 <scene_saver+0x50>
  803ecc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ed0:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    tss->ebx=scene_saver.ebx;
  803ed4:	48 8b 15 2d e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e12d]        # 412008 <scene_saver+0x68>
  803edb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803edf:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    tss->ecx=scene_saver.ecx;
  803ee3:	48 8b 15 0e e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e10e]        # 411ff8 <scene_saver+0x58>
  803eea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803eee:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
    tss->edx=scene_saver.edx;
  803ef2:	48 8b 15 07 e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e107]        # 412000 <scene_saver+0x60>
  803ef9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803efd:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    tss->esi=scene_saver.esi;
  803f01:	48 8b 15 18 e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e118]        # 412020 <scene_saver+0x80>
  803f08:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f0c:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    tss->edi=scene_saver.edi;
  803f13:	48 8b 15 0e e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e10e]        # 412028 <scene_saver+0x88>
  803f1a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f1e:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
    tss->eflags=scene_saver.eflags;
  803f25:	48 8b 15 bc e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e0bc]        # 411fe8 <scene_saver+0x48>
  803f2c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f30:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    tss->esp=scene_saver.esp;
  803f34:	48 8b 15 d5 e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e0d5]        # 412010 <scene_saver+0x70>
  803f3b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f3f:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    tss->ebp=scene_saver.ebp;
  803f43:	48 8b 15 ce e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e0ce]        # 412018 <scene_saver+0x78>
  803f4a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f4e:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
}
  803f52:	90                   	nop
  803f53:	5d                   	pop    rbp
  803f54:	c3                   	ret    

0000000000803f55 <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  803f55:	f3 0f 1e fa          	endbr64 
  803f59:	55                   	push   rbp
  803f5a:	48 89 e5             	mov    rbp,rsp
  803f5d:	48 83 ec 60          	sub    rsp,0x60
  803f61:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  803f64:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  803f67:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803f6a:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  803f70:	85 c0                	test   eax,eax
  803f72:	0f 48 c2             	cmovs  eax,edx
  803f75:	c1 f8 0c             	sar    eax,0xc
  803f78:	89 c1                	mov    ecx,eax
  803f7a:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803f7d:	99                   	cdq    
  803f7e:	c1 ea 14             	shr    edx,0x14
  803f81:	01 d0                	add    eax,edx
  803f83:	25 ff 0f 00 00       	and    eax,0xfff
  803f88:	29 d0                	sub    eax,edx
  803f8a:	01 c8                	add    eax,ecx
  803f8c:	85 c0                	test   eax,eax
  803f8e:	0f 95 c0             	setne  al
  803f91:	0f b6 c0             	movzx  eax,al
  803f94:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  803f97:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  803f9e:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  803fa5:	00 
    page_item *pgind=task[proc_index].tss.cr3;
  803fa6:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803fa9:	48 98                	cdqe   
  803fab:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803fb2:	48 05 60 86 40 00    	add    rax,0x408660
  803fb8:	48 8b 40 14          	mov    rax,QWORD PTR [rax+0x14]
  803fbc:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    pgind++;
  803fc0:	48 83 45 e8 08       	add    QWORD PTR [rbp-0x18],0x8
    for(int i=1;i<1024;i++)
  803fc5:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x1
  803fcc:	e9 39 02 00 00       	jmp    80420a <palloc+0x2b5>
    {
        page_item* tblp=*pgind&0xfffff000;
  803fd1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803fd5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803fd8:	25 00 f0 ff ff       	and    eax,0xfffff000
  803fdd:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        for(int j=0;j<1024;j++)
  803fe1:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
  803fe8:	e9 07 02 00 00       	jmp    8041f4 <palloc+0x29f>
        {
            int v=*tblp&PAGE_PRESENT;
  803fed:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803ff1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803ff4:	83 e0 01             	and    eax,0x1
  803ff7:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
            if(!v)
  803ffa:	83 7d d0 00          	cmp    DWORD PTR [rbp-0x30],0x0
  803ffe:	0f 85 e7 01 00 00    	jne    8041eb <palloc+0x296>
            {
                int new_pg=req_a_page();
  804004:	b8 00 00 00 00       	mov    eax,0x0
  804009:	e8 65 d2 ff ff       	call   801273 <req_a_page>
  80400e:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
                if(new_pg==-1)
  804011:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  804015:	0f 85 b9 00 00 00    	jne    8040d4 <palloc+0x17f>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  80401b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80401e:	48 98                	cdqe   
  804020:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804027:	48 05 e4 84 40 00    	add    rax,0x4084e4
  80402d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  804030:	0f b7 c0             	movzx  eax,ax
  804033:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804036:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804039:	48 98                	cdqe   
  80403b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804042:	48 05 e0 84 40 00    	add    rax,0x4084e0
  804048:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80404c:	0f b7 c0             	movzx  eax,ax
  80404f:	c1 e0 10             	shl    eax,0x10
  804052:	25 00 00 0f 00       	and    eax,0xf0000
  804057:	01 45 b8             	add    DWORD PTR [rbp-0x48],eax
                    size+=c;
  80405a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80405d:	01 45 b8             	add    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  804060:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804063:	89 c2                	mov    edx,eax
  804065:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804068:	48 98                	cdqe   
  80406a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804071:	48 05 e4 84 40 00    	add    rax,0x4084e4
  804077:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  80407a:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80407d:	48 98                	cdqe   
  80407f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804086:	48 05 e0 84 40 00    	add    rax,0x4084e0
  80408c:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804090:	0f b7 c0             	movzx  eax,ax
  804093:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    tmp_attr&=0xfff0;
  804096:	81 65 b4 f0 ff 00 00 	and    DWORD PTR [rbp-0x4c],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  80409d:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8040a0:	c1 e8 10             	shr    eax,0x10
  8040a3:	83 e0 0f             	and    eax,0xf
  8040a6:	89 c2                	mov    edx,eax
  8040a8:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8040ab:	01 d0                	add    eax,edx
  8040ad:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  8040b0:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8040b3:	89 c2                	mov    edx,eax
  8040b5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8040b8:	48 98                	cdqe   
  8040ba:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8040c1:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8040c7:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  8040cb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8040cf:	e9 48 01 00 00       	jmp    80421c <palloc+0x2c7>
                }
                int addr=get_phyaddr(new_pg);
  8040d4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8040d7:	89 c7                	mov    edi,eax
  8040d9:	e8 02 d3 ff ff       	call   8013e0 <get_phyaddr>
  8040de:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  8040e1:	8b 4d c8             	mov    ecx,DWORD PTR [rbp-0x38]
  8040e4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8040e8:	ba 07 00 00 00       	mov    edx,0x7
  8040ed:	89 ce                	mov    esi,ecx
  8040ef:	48 89 c7             	mov    rdi,rax
  8040f2:	e8 fc d2 ff ff       	call   8013f3 <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  8040f7:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8040fa:	c1 e0 0a             	shl    eax,0xa
  8040fd:	89 c2                	mov    edx,eax
  8040ff:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  804102:	01 d0                	add    eax,edx
  804104:	c1 e0 0c             	shl    eax,0xc
  804107:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                if(ptr==NULL)
  80410a:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  80410f:	75 12                	jne    804123 <palloc+0x1ce>
                {
                    ptr=laddr;
  804111:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  804114:	48 98                	cdqe   
  804116:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
                    palloc_paddr=addr;
  80411a:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  80411d:	89 05 55 df c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0df55],eax        # 412078 <palloc_paddr>
                }
                page_c--;
  804123:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  804127:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  80412b:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80412f:	0f 85 b6 00 00 00    	jne    8041eb <palloc+0x296>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804135:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804138:	48 98                	cdqe   
  80413a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804141:	48 05 e4 84 40 00    	add    rax,0x4084e4
  804147:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80414a:	0f b7 c0             	movzx  eax,ax
  80414d:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804150:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804153:	48 98                	cdqe   
  804155:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80415c:	48 05 e0 84 40 00    	add    rax,0x4084e0
  804162:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804166:	0f b7 c0             	movzx  eax,ax
  804169:	c1 e0 10             	shl    eax,0x10
  80416c:	25 00 00 0f 00       	and    eax,0xf0000
  804171:	01 45 c0             	add    DWORD PTR [rbp-0x40],eax
                    size+=c;
  804174:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804177:	01 45 c0             	add    DWORD PTR [rbp-0x40],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  80417a:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  80417d:	89 c2                	mov    edx,eax
  80417f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804182:	48 98                	cdqe   
  804184:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80418b:	48 05 e4 84 40 00    	add    rax,0x4084e4
  804191:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  804194:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804197:	48 98                	cdqe   
  804199:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8041a0:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8041a6:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8041aa:	0f b7 c0             	movzx  eax,ax
  8041ad:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    tmp_attr&=0xfff0;
  8041b0:	81 65 bc f0 ff 00 00 	and    DWORD PTR [rbp-0x44],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  8041b7:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  8041ba:	c1 e8 10             	shr    eax,0x10
  8041bd:	83 e0 0f             	and    eax,0xf
  8041c0:	89 c2                	mov    edx,eax
  8041c2:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8041c5:	01 d0                	add    eax,edx
  8041c7:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  8041ca:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8041cd:	89 c2                	mov    edx,eax
  8041cf:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8041d2:	48 98                	cdqe   
  8041d4:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8041db:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8041e1:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
                    return ptr;
  8041e5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8041e9:	eb 31                	jmp    80421c <palloc+0x2c7>
                }
            }
            tblp++;
  8041eb:	48 83 45 d8 08       	add    QWORD PTR [rbp-0x28],0x8
        for(int j=0;j<1024;j++)
  8041f0:	83 45 d4 01          	add    DWORD PTR [rbp-0x2c],0x1
  8041f4:	81 7d d4 ff 03 00 00 	cmp    DWORD PTR [rbp-0x2c],0x3ff
  8041fb:	0f 8e ec fd ff ff    	jle    803fed <palloc+0x98>
        }
        pgind++;
  804201:	48 83 45 e8 08       	add    QWORD PTR [rbp-0x18],0x8
    for(int i=1;i<1024;i++)
  804206:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
  80420a:	81 7d e4 ff 03 00 00 	cmp    DWORD PTR [rbp-0x1c],0x3ff
  804211:	0f 8e ba fd ff ff    	jle    803fd1 <palloc+0x7c>
    }
    return NULL;
  804217:	b8 00 00 00 00       	mov    eax,0x0
}
  80421c:	c9                   	leave  
  80421d:	c3                   	ret    

000000000080421e <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  80421e:	f3 0f 1e fa          	endbr64 
  804222:	55                   	push   rbp
  804223:	48 89 e5             	mov    rbp,rsp
  804226:	48 83 ec 10          	sub    rsp,0x10
  80422a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  80422d:	8b 05 3d de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0de3d]        # 412070 <cur_proc>
  804233:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804236:	89 d6                	mov    esi,edx
  804238:	89 c7                	mov    edi,eax
  80423a:	e8 16 fd ff ff       	call   803f55 <palloc>
}
  80423f:	c9                   	leave  
  804240:	c3                   	ret    

0000000000804241 <proc_end>:
void proc_end()
{
  804241:	f3 0f 1e fa          	endbr64 
  804245:	55                   	push   rbp
  804246:	48 89 e5             	mov    rbp,rsp
  804249:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  80424d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
  804250:	48 8b 05 55 44 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc04455]        # 4086ac <task+0x20c>
  804257:	48 89 c4             	mov    rsp,rax
    del_proc(cur_proc);
  80425a:	8b 05 10 de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0de10]        # 412070 <cur_proc>
  804260:	89 c7                	mov    edi,eax
  804262:	e8 75 00 00 00       	call   8042dc <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  804267:	8b 05 03 de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0de03]        # 412070 <cur_proc>
  80426d:	48 98                	cdqe   
  80426f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804276:	48 05 00 85 40 00    	add    rax,0x408500
  80427c:	8b 00                	mov    eax,DWORD PTR [rax]
  80427e:	83 f8 ff             	cmp    eax,0xffffffff
  804281:	74 4c                	je     8042cf <proc_end+0x8e>
        task[task[cur_proc].parent_pid].stat=READY;
  804283:	8b 05 e7 dd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dde7]        # 412070 <cur_proc>
  804289:	48 98                	cdqe   
  80428b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804292:	48 05 00 85 40 00    	add    rax,0x408500
  804298:	8b 00                	mov    eax,DWORD PTR [rax]
  80429a:	89 c0                	mov    eax,eax
  80429c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8042a3:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8042a9:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  8042af:	8b 05 bb dd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ddbb]        # 412070 <cur_proc>
  8042b5:	48 98                	cdqe   
  8042b7:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8042be:	48 05 00 85 40 00    	add    rax,0x408500
  8042c4:	8b 00                	mov    eax,DWORD PTR [rax]
  8042c6:	89 c7                	mov    edi,eax
  8042c8:	e8 d0 fa ff ff       	call   803d9d <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  8042cd:	eb 0a                	jmp    8042d9 <proc_end+0x98>
        switch_proc_tss(0);
  8042cf:	bf 00 00 00 00       	mov    edi,0x0
  8042d4:	e8 c4 fa ff ff       	call   803d9d <switch_proc_tss>
}
  8042d9:	90                   	nop
  8042da:	c9                   	leave  
  8042db:	c3                   	ret    

00000000008042dc <del_proc>:
void del_proc(int pnr)
{
  8042dc:	f3 0f 1e fa          	endbr64 
  8042e0:	55                   	push   rbp
  8042e1:	48 89 e5             	mov    rbp,rsp
  8042e4:	48 83 ec 30          	sub    rsp,0x30
  8042e8:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  8042eb:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8042ee:	48 98                	cdqe   
  8042f0:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8042f7:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8042fd:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  804303:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804306:	48 98                	cdqe   
  804308:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80430f:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804315:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p=task[pnr].tss.cr3;
  80431b:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80431e:	48 98                	cdqe   
  804320:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804327:	48 05 60 86 40 00    	add    rax,0x408660
  80432d:	48 8b 40 14          	mov    rax,QWORD PTR [rax+0x14]
  804331:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    p++;
  804335:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  80433a:	eb 63                	jmp    80439f <del_proc+0xc3>
    {
        page_item *tp=*p&0xfffff000;
  80433c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804340:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804343:	25 00 f0 ff ff       	and    eax,0xfffff000
  804348:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  80434c:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804353:	eb 30                	jmp    804385 <del_proc+0xa9>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  804355:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804359:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80435c:	83 e0 01             	and    eax,0x1
  80435f:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  804362:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  804366:	74 14                	je     80437c <del_proc+0xa0>
            {
                free_page(*tp&0xfffff000);
  804368:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80436c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80436f:	25 00 f0 ff ff       	and    eax,0xfffff000
  804374:	48 89 c7             	mov    rdi,rax
  804377:	e8 a3 cf ff ff       	call   80131f <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  80437c:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  804381:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804385:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  80438c:	7e c7                	jle    804355 <del_proc+0x79>
        }
        vmfree(tp);
  80438e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804392:	48 89 c7             	mov    rdi,rax
  804395:	e8 2f ce ff ff       	call   8011c9 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  80439a:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  80439f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043a3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8043a6:	83 e0 01             	and    eax,0x1
  8043a9:	48 85 c0             	test   rax,rax
  8043ac:	75 8e                	jne    80433c <del_proc+0x60>
    }
    //释放存放页目录的页面
    vmfree(p);
  8043ae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043b2:	48 89 c7             	mov    rdi,rax
  8043b5:	e8 0f ce ff ff       	call   8011c9 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  8043ba:	90                   	nop
  8043bb:	c9                   	leave  
  8043bc:	c3                   	ret    

00000000008043bd <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  8043bd:	f3 0f 1e fa          	endbr64 
  8043c1:	55                   	push   rbp
  8043c2:	48 89 e5             	mov    rbp,rsp
  8043c5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8043c8:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  8043cb:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8043cf:	75 07                	jne    8043d8 <set_proc_stat+0x1b>
  8043d1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8043d6:	eb 79                	jmp    804451 <set_proc_stat+0x94>
    int i=0;
  8043d8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  8043df:	eb 04                	jmp    8043e5 <set_proc_stat+0x28>
  8043e1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8043e5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8043e8:	48 98                	cdqe   
  8043ea:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8043f1:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8043f7:	8b 10                	mov    edx,DWORD PTR [rax]
  8043f9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8043fc:	39 c2                	cmp    edx,eax
  8043fe:	75 e1                	jne    8043e1 <set_proc_stat+0x24>
    if(i==MAX_PROC_COUNT)return -1;
  804400:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  804404:	75 07                	jne    80440d <set_proc_stat+0x50>
  804406:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80440b:	eb 44                	jmp    804451 <set_proc_stat+0x94>
    task[i].stat=stat;
  80440d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804410:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804413:	48 63 d2             	movsxd rdx,edx
  804416:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  80441d:	48 81 c2 a4 84 40 00 	add    rdx,0x4084a4
  804424:	89 02                	mov    DWORD PTR [rdx],eax
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  804426:	8b 05 44 dc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dc44]        # 412070 <cur_proc>
  80442c:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80442f:	75 1b                	jne    80444c <set_proc_stat+0x8f>
        task[cur_proc].utime=MAX_UTIME;
  804431:	8b 05 39 dc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dc39]        # 412070 <cur_proc>
  804437:	48 98                	cdqe   
  804439:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804440:	48 05 a8 84 40 00    	add    rax,0x4084a8
  804446:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  80444c:	b8 00 00 00 00       	mov    eax,0x0
}
  804451:	5d                   	pop    rbp
  804452:	c3                   	ret    

0000000000804453 <add_proc_openf>:

    return 0;
} */

int add_proc_openf(vfs_dir_entry *entry)
{
  804453:	f3 0f 1e fa          	endbr64 
  804457:	55                   	push   rbp
  804458:	48 89 e5             	mov    rbp,rsp
  80445b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  80445f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  804466:	eb 69                	jmp    8044d1 <add_proc_openf+0x7e>
        if(task[cur_proc].openf[i]==NULL)
  804468:	8b 05 02 dc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dc02]        # 412070 <cur_proc>
  80446e:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804471:	48 63 d2             	movsxd rdx,edx
  804474:	48 83 c2 12          	add    rdx,0x12
  804478:	48 98                	cdqe   
  80447a:	48 c1 e2 03          	shl    rdx,0x3
  80447e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804485:	48 01 d0             	add    rax,rdx
  804488:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80448e:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804492:	48 85 c0             	test   rax,rax
  804495:	75 36                	jne    8044cd <add_proc_openf+0x7a>
        {
            task[cur_proc].openf[i]=entry;
  804497:	8b 05 d3 db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dbd3]        # 412070 <cur_proc>
  80449d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8044a0:	48 63 d2             	movsxd rdx,edx
  8044a3:	48 83 c2 12          	add    rdx,0x12
  8044a7:	48 98                	cdqe   
  8044a9:	48 c1 e2 03          	shl    rdx,0x3
  8044ad:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8044b4:	48 01 d0             	add    rax,rdx
  8044b7:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  8044be:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8044c2:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
            return 0;
  8044c6:	b8 00 00 00 00       	mov    eax,0x0
  8044cb:	eb 0f                	jmp    8044dc <add_proc_openf+0x89>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8044cd:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8044d1:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8044d5:	7e 91                	jle    804468 <add_proc_openf+0x15>
        }
    }
    return -1;//full
  8044d7:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8044dc:	5d                   	pop    rbp
  8044dd:	c3                   	ret    

00000000008044de <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  8044de:	f3 0f 1e fa          	endbr64 
  8044e2:	55                   	push   rbp
  8044e3:	48 89 e5             	mov    rbp,rsp
  8044e6:	48 83 ec 10          	sub    rsp,0x10
  8044ea:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  8044ed:	8b 05 7d db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0db7d]        # 412070 <cur_proc>
  8044f3:	89 c7                	mov    edi,eax
  8044f5:	e8 e2 fd ff ff       	call   8042dc <del_proc>
    return code;
  8044fa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8044fd:	c9                   	leave  
  8044fe:	c3                   	ret    

00000000008044ff <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(int entry, vfs_dir_entry *cwd, vfs_dir_entry *exef)
{
  8044ff:	f3 0f 1e fa          	endbr64 
  804503:	55                   	push   rbp
  804504:	48 89 e5             	mov    rbp,rsp
  804507:	48 83 ec 40          	sub    rsp,0x40
  80450b:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  80450e:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  804512:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    
    int i=req_proc();
  804516:	b8 00 00 00 00       	mov    eax,0x0
  80451b:	e8 02 f4 ff ff       	call   803922 <req_proc>
  804520:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(i==-1)return -1;
  804523:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  804527:	75 0a                	jne    804533 <reg_proc+0x34>
  804529:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80452e:	e9 80 01 00 00       	jmp    8046b3 <reg_proc+0x1b4>
    /*set_proc(0,0,0,0,SEL_LDT_DATA,SEL_LDT_CODE,SEL_LDT_STACK,SEL_LDT_DATA\
    ,SEL_LDT_DATA,SEL_LDT_DATA,0x1c00000-4,0,0,0,0,i);*/
    set_proc(0,0,0,0,0x10,0x8,0x10,0x10\
  804533:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804536:	50                   	push   rax
  804537:	6a 00                	push   0x0
  804539:	6a 00                	push   0x0
  80453b:	6a 00                	push   0x0
  80453d:	6a 00                	push   0x0
  80453f:	68 fc ff bf 01       	push   0x1bffffc
  804544:	6a 10                	push   0x10
  804546:	6a 10                	push   0x10
  804548:	6a 10                	push   0x10
  80454a:	6a 10                	push   0x10
  80454c:	41 b9 08 00 00 00    	mov    r9d,0x8
  804552:	41 b8 10 00 00 00    	mov    r8d,0x10
  804558:	b9 00 00 00 00       	mov    ecx,0x0
  80455d:	ba 00 00 00 00       	mov    edx,0x0
  804562:	be 00 00 00 00       	mov    esi,0x0
  804567:	bf 00 00 00 00       	mov    edi,0x0
  80456c:	e8 7d f4 ff ff       	call   8039ee <set_proc>
  804571:	48 83 c4 50          	add    rsp,0x50
    ,0x10,0x10,0x1c00000-4,0,0,0,0,i);
    task[i].pdet=vmalloc();
  804575:	b8 00 00 00 00       	mov    eax,0x0
  80457a:	e8 bb cb ff ff       	call   80113a <vmalloc>
  80457f:	48 89 c2             	mov    rdx,rax
  804582:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804585:	48 98                	cdqe   
  804587:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80458e:	48 05 20 85 40 00    	add    rax,0x408520
  804594:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    int *pt=vmalloc();
  804598:	b8 00 00 00 00       	mov    eax,0x0
  80459d:	e8 98 cb ff ff       	call   80113a <vmalloc>
  8045a2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    task[i].pdet[0]=PAGE_TABLE_ADDR|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;
  8045a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8045a9:	48 98                	cdqe   
  8045ab:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8045b2:	48 05 20 85 40 00    	add    rax,0x408520
  8045b8:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8045bc:	c7 00 07 20 00 00    	mov    DWORD PTR [rax],0x2007
    /*for(int j=0;j<32;j++)
        pt[j]=(PAGE_TABLE_ADDR+j*0x1000)|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;//复制内核页表*/
    //PAGE_TABLE_ADDR|PAGE_PRESENT;//复制内核页表
    //task[i].pdet[7]=PAGE_TABLE_ADDR+7*0x1000|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//sys.dll
    int *stackb=vmalloc();
  8045c2:	b8 00 00 00 00       	mov    eax,0x0
  8045c7:	e8 6e cb ff ff       	call   80113a <vmalloc>
  8045cc:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    task[i].pdet[6]=(int)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  8045d0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8045d4:	83 c8 07             	or     eax,0x7
  8045d7:	89 c2                	mov    edx,eax
  8045d9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8045dc:	48 98                	cdqe   
  8045de:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8045e5:	48 05 20 85 40 00    	add    rax,0x408520
  8045eb:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  8045ef:	48 83 c0 18          	add    rax,0x18
  8045f3:	89 10                	mov    DWORD PTR [rax],edx
    stackb[1023]=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  8045f5:	b8 00 00 00 00       	mov    eax,0x0
  8045fa:	e8 74 cc ff ff       	call   801273 <req_a_page>
  8045ff:	89 c7                	mov    edi,eax
  804601:	e8 da cd ff ff       	call   8013e0 <get_phyaddr>
  804606:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80460a:	48 81 c2 fc 0f 00 00 	add    rdx,0xffc
  804611:	83 c8 07             	or     eax,0x7
  804614:	89 02                	mov    DWORD PTR [rdx],eax
    task[i].tss.cr3=task[i].pdet;
  804616:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804619:	48 98                	cdqe   
  80461b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804622:	48 05 20 85 40 00    	add    rax,0x408520
  804628:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  80462c:	48 89 c2             	mov    rdx,rax
  80462f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804632:	48 98                	cdqe   
  804634:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80463b:	48 05 60 86 40 00    	add    rax,0x408660
  804641:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx

    task[i].stat=READY;
  804645:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804648:	48 98                	cdqe   
  80464a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804651:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804657:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  80465d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804660:	48 98                	cdqe   
  804662:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804669:	48 8d 90 20 85 40 00 	lea    rdx,[rax+0x408520]
  804670:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804674:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    task[i].exef=exef;
  804678:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80467b:	48 98                	cdqe   
  80467d:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804684:	48 8d 90 30 85 40 00 	lea    rdx,[rax+0x408530]
  80468b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80468f:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].tss.ds=0x10;
    task[i].tss.ss=0x10;
    task[i].tss.gs=0x10;
    task[i].tss.fs=0x10;
    task[i].tss.cs=0x8;*/
    task[i].tss.eip=entry;
  804693:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804696:	48 98                	cdqe   
  804698:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80469b:	48 63 d2             	movsxd rdx,edx
  80469e:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  8046a5:	48 81 c2 70 86 40 00 	add    rdx,0x408670
  8046ac:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    return i;
  8046b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  8046b3:	c9                   	leave  
  8046b4:	c3                   	ret    

00000000008046b5 <sys_malloc>:

void * sys_malloc(int size)
{
  8046b5:	f3 0f 1e fa          	endbr64 
  8046b9:	55                   	push   rbp
  8046ba:	48 89 e5             	mov    rbp,rsp
  8046bd:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  8046c0:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8046c3:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8046c9:	85 c0                	test   eax,eax
  8046cb:	0f 48 c2             	cmovs  eax,edx
  8046ce:	c1 f8 0c             	sar    eax,0xc
  8046d1:	89 c1                	mov    ecx,eax
  8046d3:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8046d6:	99                   	cdq    
  8046d7:	c1 ea 14             	shr    edx,0x14
  8046da:	01 d0                	add    eax,edx
  8046dc:	25 ff 0f 00 00       	and    eax,0xfff
  8046e1:	29 d0                	sub    eax,edx
  8046e3:	01 c8                	add    eax,ecx
  8046e5:	85 c0                	test   eax,eax
  8046e7:	0f 95 c0             	setne  al
  8046ea:	0f b6 c0             	movzx  eax,al
  8046ed:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  8046f0:	8b 05 7a d9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d97a]        # 412070 <cur_proc>
  8046f6:	48 98                	cdqe   
  8046f8:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8046ff:	48 05 b4 84 40 00    	add    rax,0x4084b4
  804705:	8b 00                	mov    eax,DWORD PTR [rax]
  804707:	48 98                	cdqe   
  804709:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  80470d:	eb 0c                	jmp    80471b <sys_malloc+0x66>
        hp=hp->next;
  80470f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804713:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804717:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  80471b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80471f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804723:	48 85 c0             	test   rax,rax
  804726:	74 16                	je     80473e <sys_malloc+0x89>
  804728:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80472c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80472f:	85 c0                	test   eax,eax
  804731:	75 0b                	jne    80473e <sys_malloc+0x89>
  804733:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804737:	8b 00                	mov    eax,DWORD PTR [rax]
  804739:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  80473c:	7e d1                	jle    80470f <sys_malloc+0x5a>
    if(hp->pgn<n)
  80473e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804742:	8b 00                	mov    eax,DWORD PTR [rax]
  804744:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804747:	7e 7f                	jle    8047c8 <sys_malloc+0x113>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  804749:	8b 05 21 d9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d921]        # 412070 <cur_proc>
  80474f:	48 98                	cdqe   
  804751:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804758:	48 05 b8 84 40 00    	add    rax,0x4084b8
  80475e:	8b 10                	mov    edx,DWORD PTR [rax]
  804760:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804763:	c1 e0 0c             	shl    eax,0xc
  804766:	01 d0                	add    eax,edx
  804768:	3d ff ff ef 01       	cmp    eax,0x1efffff
  80476d:	7e 0a                	jle    804779 <sys_malloc+0xc4>
        {
            //超过顶部
            return NULL;
  80476f:	b8 00 00 00 00       	mov    eax,0x0
  804774:	e9 c8 00 00 00       	jmp    804841 <sys_malloc+0x18c>
        }
        int needed=n-hp->pgn;
  804779:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80477d:	8b 10                	mov    edx,DWORD PTR [rax]
  80477f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804782:	29 d0                	sub    eax,edx
  804784:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  804787:	8b 05 e3 d8 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d8e3]        # 412070 <cur_proc>
  80478d:	48 98                	cdqe   
  80478f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804796:	48 05 b8 84 40 00    	add    rax,0x4084b8
  80479c:	8b 00                	mov    eax,DWORD PTR [rax]
  80479e:	48 98                	cdqe   
  8047a0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  8047a4:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8047ab:	eb 13                	jmp    8047c0 <sys_malloc+0x10b>
        {
            *p=0;//触发缺页中断
  8047ad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8047b1:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  8047b4:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  8047bb:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  8047bc:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8047c0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8047c3:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8047c6:	7c e5                	jl     8047ad <sys_malloc+0xf8>
        }
    }
    if(hp->pgn>n)
  8047c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047cc:	8b 00                	mov    eax,DWORD PTR [rax]
  8047ce:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8047d1:	7d 59                	jge    80482c <sys_malloc+0x177>
    {
        //在后面新建一个头
        char *p=hp;
  8047d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047d7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  8047db:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8047de:	83 c0 01             	add    eax,0x1
  8047e1:	c1 e0 0c             	shl    eax,0xc
  8047e4:	48 98                	cdqe   
  8047e6:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  8047ea:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8047ee:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  8047f2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047f6:	8b 00                	mov    eax,DWORD PTR [rax]
  8047f8:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  8047fb:	8d 50 ff             	lea    edx,[rax-0x1]
  8047fe:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804802:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  804804:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804808:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  80480c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804810:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  804814:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804818:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80481c:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804820:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804824:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804828:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  80482c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804830:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  804837:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80483b:	48 05 00 10 00 00    	add    rax,0x1000
}
  804841:	5d                   	pop    rbp
  804842:	c3                   	ret    

0000000000804843 <sys_free>:
int sys_free(int ptr)
{
  804843:	f3 0f 1e fa          	endbr64 
  804847:	55                   	push   rbp
  804848:	48 89 e5             	mov    rbp,rsp
  80484b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  80484e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804851:	2d 00 10 00 00       	sub    eax,0x1000
  804856:	48 98                	cdqe   
  804858:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  80485c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804860:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  804867:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80486b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80486f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804873:	eb 2e                	jmp    8048a3 <sys_free+0x60>
    {
        if(p->alloc==0)
  804875:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804879:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80487c:	85 c0                	test   eax,eax
  80487e:	75 2c                	jne    8048ac <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  804880:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804884:	8b 10                	mov    edx,DWORD PTR [rax]
  804886:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80488a:	8b 00                	mov    eax,DWORD PTR [rax]
  80488c:	83 c0 01             	add    eax,0x1
  80488f:	01 c2                	add    edx,eax
  804891:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804895:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  804897:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80489b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80489f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8048a3:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8048a8:	75 cb                	jne    804875 <sys_free+0x32>
  8048aa:	eb 01                	jmp    8048ad <sys_free+0x6a>
            break;
  8048ac:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  8048ad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048b1:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8048b5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8048b9:	eb 2e                	jmp    8048e9 <sys_free+0xa6>
    {
        if(p->alloc==0)
  8048bb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048bf:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8048c2:	85 c0                	test   eax,eax
  8048c4:	75 2c                	jne    8048f2 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  8048c6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048ca:	8b 10                	mov    edx,DWORD PTR [rax]
  8048cc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048d0:	8b 00                	mov    eax,DWORD PTR [rax]
  8048d2:	83 c0 01             	add    eax,0x1
  8048d5:	01 c2                	add    edx,eax
  8048d7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048db:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  8048dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048e1:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8048e5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8048e9:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8048ee:	75 cb                	jne    8048bb <sys_free+0x78>
  8048f0:	eb 01                	jmp    8048f3 <sys_free+0xb0>
            break;
  8048f2:	90                   	nop
    }
    //合并完成
    return 0;
  8048f3:	b8 00 00 00 00       	mov    eax,0x0
  8048f8:	5d                   	pop    rbp
  8048f9:	c3                   	ret    
  8048fa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]

0000000000804900 <outb>:
  804900:	66 67 8b 54 24 04    	mov    dx,WORD PTR [esp+0x4]
  804906:	67 8a 44 24 08       	mov    al,BYTE PTR [esp+0x8]
  80490b:	ee                   	out    dx,al
  80490c:	e8 35 00 00 00       	call   804946 <io_delay>
  804911:	c3                   	ret    

0000000000804912 <outw>:
  804912:	66 67 8b 54 24 04    	mov    dx,WORD PTR [esp+0x4]
  804918:	66 67 8b 44 24 08    	mov    ax,WORD PTR [esp+0x8]
  80491e:	66 ef                	out    dx,ax
  804920:	90                   	nop
  804921:	90                   	nop
  804922:	90                   	nop
  804923:	c3                   	ret    

0000000000804924 <inb>:
  804924:	31 c0                	xor    eax,eax
  804926:	66 67 8b 54 24 04    	mov    dx,WORD PTR [esp+0x4]
  80492c:	ec                   	in     al,dx
  80492d:	90                   	nop
  80492e:	90                   	nop
  80492f:	90                   	nop
  804930:	c3                   	ret    

0000000000804931 <inw>:
  804931:	31 c0                	xor    eax,eax
  804933:	66 67 8b 54 24 04    	mov    dx,WORD PTR [esp+0x4]
  804939:	66 ed                	in     ax,dx
  80493b:	90                   	nop
  80493c:	90                   	nop
  80493d:	90                   	nop
  80493e:	c3                   	ret    

000000000080493f <eoi>:
  80493f:	b0 20                	mov    al,0x20
  804941:	e6 a0                	out    0xa0,al
  804943:	e6 20                	out    0x20,al
  804945:	c3                   	ret    

0000000000804946 <io_delay>:
  804946:	90                   	nop
  804947:	90                   	nop
  804948:	90                   	nop
  804949:	90                   	nop
  80494a:	c3                   	ret    

000000000080494b <turn_on_int>:
  80494b:	b0 f8                	mov    al,0xf8
  80494d:	e6 21                	out    0x21,al
  80494f:	e8 f2 ff ff ff       	call   804946 <io_delay>
  804954:	b0 af                	mov    al,0xaf
  804956:	e6 a1                	out    0xa1,al
  804958:	e8 e9 ff ff ff       	call   804946 <io_delay>
  80495d:	b8 00 70 10 00       	mov    eax,0x107000
  804962:	0f 01 18             	lidt   [rax]
  804965:	90                   	nop
  804966:	90                   	nop
  804967:	90                   	nop
  804968:	90                   	nop
  804969:	fb                   	sti    
  80496a:	c3                   	ret    

000000000080496b <report_back_trace_of_err>:
  80496b:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  804970:	50                   	push   rax
  804971:	68 7a 49 80 00       	push   0x80497a
  804976:	83 c4 08             	add    esp,0x8
  804979:	c3                   	ret    

000000000080497a <bt_msg>:
  80497a:	65 72 72             	gs jb  8049ef <fill_desc+0x1c>
  80497d:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  80497e:	72 20                	jb     8049a0 <init_gdt+0x11>
  804980:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804981:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  804984:	72 73                	jb     8049f9 <fill_desc+0x26>
  804986:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  804989:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eea607 <dev_stdout+0x6d8787>

000000000080498f <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  80498f:	f3 0f 1e fa          	endbr64 
  804993:	55                   	push   rbp
  804994:	48 89 e5             	mov    rbp,rsp
    //asm volatile("sgdt %0"::"m"(gdt));
    fill_desc(0,0xffffffff,SEG_CONFORMING_RW_CODE,1);
  804997:	b9 01 00 00 00       	mov    ecx,0x1
  80499c:	ba 9e cf 00 00       	mov    edx,0xcf9e
  8049a1:	be ff ff ff ff       	mov    esi,0xffffffff
  8049a6:	bf 00 00 00 00       	mov    edi,0x0
  8049ab:	e8 23 00 00 00       	call   8049d3 <fill_desc>
    fill_desc(0,0xffffffff,SEG_RW_DATA,2);
  8049b0:	b9 02 00 00 00       	mov    ecx,0x2
  8049b5:	ba 92 cf 00 00       	mov    edx,0xcf92
  8049ba:	be ff ff ff ff       	mov    esi,0xffffffff
  8049bf:	bf 00 00 00 00       	mov    edi,0x0
  8049c4:	e8 0a 00 00 00       	call   8049d3 <fill_desc>
    asm volatile("lgdt %0":"=m"(gdtptr));
  8049c9:	0f 01 15 30 06 90 ff 	lgdt   [rip+0xffffffffff900630]        # 105000 <gdtptr>

}
  8049d0:	90                   	nop
  8049d1:	5d                   	pop    rbp
  8049d2:	c3                   	ret    

00000000008049d3 <fill_desc>:
void fill_desc(u32 base, u32 limit,u16 attr,u32 index)
{
  8049d3:	f3 0f 1e fa          	endbr64 
  8049d7:	55                   	push   rbp
  8049d8:	48 89 e5             	mov    rbp,rsp
  8049db:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8049de:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8049e1:	89 d0                	mov    eax,edx
  8049e3:	89 4d f0             	mov    DWORD PTR [rbp-0x10],ecx
  8049e6:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    gdt[index].base_lo16=base&0xffff;
  8049ea:	48 8b 15 af 53 00 00 	mov    rdx,QWORD PTR [rip+0x53af]        # 809da0 <gdt>
  8049f1:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8049f4:	48 c1 e0 03          	shl    rax,0x3
  8049f8:	48 01 d0             	add    rax,rdx
  8049fb:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8049fe:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_mid8=(base>>16)&0xff;
  804a02:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804a05:	c1 e8 10             	shr    eax,0x10
  804a08:	89 c1                	mov    ecx,eax
  804a0a:	48 8b 15 8f 53 00 00 	mov    rdx,QWORD PTR [rip+0x538f]        # 809da0 <gdt>
  804a11:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804a14:	48 c1 e0 03          	shl    rax,0x3
  804a18:	48 01 d0             	add    rax,rdx
  804a1b:	89 ca                	mov    edx,ecx
  804a1d:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_hi8=(base>>24)&0xff;
  804a20:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804a23:	c1 e8 18             	shr    eax,0x18
  804a26:	89 c1                	mov    ecx,eax
  804a28:	48 8b 15 71 53 00 00 	mov    rdx,QWORD PTR [rip+0x5371]        # 809da0 <gdt>
  804a2f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804a32:	48 c1 e0 03          	shl    rax,0x3
  804a36:	48 01 d0             	add    rax,rdx
  804a39:	89 ca                	mov    edx,ecx
  804a3b:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].limit_lo16=limit&0xffff;
  804a3e:	48 8b 15 5b 53 00 00 	mov    rdx,QWORD PTR [rip+0x535b]        # 809da0 <gdt>
  804a45:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804a48:	48 c1 e0 03          	shl    rax,0x3
  804a4c:	48 01 d0             	add    rax,rdx
  804a4f:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  804a52:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr;
  804a55:	48 8b 15 44 53 00 00 	mov    rdx,QWORD PTR [rip+0x5344]        # 809da0 <gdt>
  804a5c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804a5f:	48 c1 e0 03          	shl    rax,0x3
  804a63:	48 01 c2             	add    rdx,rax
  804a66:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  804a6a:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  804a6e:	90                   	nop
  804a6f:	5d                   	pop    rbp
  804a70:	c3                   	ret    

0000000000804a71 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  804a71:	f3 0f 1e fa          	endbr64 
  804a75:	55                   	push   rbp
  804a76:	48 89 e5             	mov    rbp,rsp
  804a79:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804a7c:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  804a7f:	89 c8                	mov    eax,ecx
  804a81:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  804a85:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  804a89:	48 8b 05 10 53 00 00 	mov    rax,QWORD PTR [rip+0x5310]        # 809da0 <gdt>
  804a90:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  804a94:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804a97:	48 c1 e0 04          	shl    rax,0x4
  804a9b:	48 89 c2             	mov    rdx,rax
  804a9e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804aa2:	48 01 d0             	add    rax,rdx
  804aa5:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804aa8:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  804aab:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804aae:	48 c1 e0 04          	shl    rax,0x4
  804ab2:	48 89 c2             	mov    rdx,rax
  804ab5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ab9:	48 01 d0             	add    rax,rdx
  804abc:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804abf:	c1 ea 10             	shr    edx,0x10
  804ac2:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  804ac5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804ac8:	48 c1 e0 04          	shl    rax,0x4
  804acc:	48 89 c2             	mov    rdx,rax
  804acf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ad3:	48 01 c2             	add    rdx,rax
  804ad6:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  804ada:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  804ade:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804ae1:	48 c1 e0 04          	shl    rax,0x4
  804ae5:	48 89 c2             	mov    rdx,rax
  804ae8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804aec:	48 01 c2             	add    rdx,rax
  804aef:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  804af3:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  804af7:	90                   	nop
  804af8:	5d                   	pop    rbp
  804af9:	c3                   	ret    

0000000000804afa <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  804afa:	f3 0f 1e fa          	endbr64 
  804afe:	55                   	push   rbp
  804aff:	48 89 e5             	mov    rbp,rsp
  804b02:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  804b05:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  804b08:	89 d0                	mov    eax,edx
  804b0a:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  804b0e:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    desc->base_lo16=base&0xffff;
  804b12:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b15:	89 c2                	mov    edx,eax
  804b17:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b1b:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    desc->base_mid8=(base>>16)&0xff;
  804b1f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b22:	c1 e8 10             	shr    eax,0x10
  804b25:	89 c2                	mov    edx,eax
  804b27:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b2b:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    desc->base_hi8=(base>>24)&0xff;
  804b2e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b31:	c1 e8 18             	shr    eax,0x18
  804b34:	89 c2                	mov    edx,eax
  804b36:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b3a:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    desc->limit_lo16=limit&0xffff;
  804b3d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804b40:	89 c2                	mov    edx,eax
  804b42:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b46:	66 89 10             	mov    WORD PTR [rax],dx
    desc->attr=attr|(limit>>16&0xf)<<8;
  804b49:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804b4c:	c1 e8 10             	shr    eax,0x10
  804b4f:	c1 e0 08             	shl    eax,0x8
  804b52:	66 25 00 0f          	and    ax,0xf00
  804b56:	66 0b 45 f4          	or     ax,WORD PTR [rbp-0xc]
  804b5a:	89 c2                	mov    edx,eax
  804b5c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b60:	66 89 50 05          	mov    WORD PTR [rax+0x5],dx
  804b64:	90                   	nop
  804b65:	5d                   	pop    rbp
  804b66:	c3                   	ret    
  804b67:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  804b6e:	00 00 

0000000000804b70 <fill_desc>:
  804b70:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  804b75:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  804b7a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  804b7f:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  804b84:	be 00 60 00 00       	mov    esi,0x6000
  804b89:	c1 e2 03             	shl    edx,0x3
  804b8c:	01 d6                	add    esi,edx
  804b8e:	66 67 89 1e          	mov    WORD PTR [esi],bx
  804b92:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  804b97:	c1 e8 10             	shr    eax,0x10
  804b9a:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  804b9e:	c1 eb 10             	shr    ebx,0x10
  804ba1:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  804ba5:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  804ba9:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  804bad:	c3                   	ret    

0000000000804bae <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  804bae:	f3 0f 1e fa          	endbr64 
  804bb2:	55                   	push   rbp
  804bb3:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  804bb6:	b8 00 00 00 00       	mov    eax,0x0
  804bbb:	e8 03 16 00 00       	call   8061c3 <execute_request>
    do_req();
  804bc0:	b8 00 00 00 00       	mov    eax,0x0
  804bc5:	e8 d7 ea ff ff       	call   8036a1 <do_req>
    if(!manage_proc_lock)
  804bca:	8b 05 78 51 00 00    	mov    eax,DWORD PTR [rip+0x5178]        # 809d48 <manage_proc_lock>
  804bd0:	85 c0                	test   eax,eax
  804bd2:	75 0a                	jne    804bde <clock_c+0x30>
    {
        manage_proc();
  804bd4:	b8 00 00 00 00       	mov    eax,0x0
  804bd9:	e8 9e f0 ff ff       	call   803c7c <manage_proc>
    }
    //puts("1 disk req executed.");
  804bde:	90                   	nop
  804bdf:	5d                   	pop    rbp
  804be0:	c3                   	ret    
  804be1:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  804be8:	00 00 00 
  804beb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000804bf0 <clock>:
  804bf0:	b0 20                	mov    al,0x20
  804bf2:	e6 a0                	out    0xa0,al
  804bf4:	e6 20                	out    0x20,al
  804bf6:	48 cf                	iretq  

0000000000804bf8 <execute>:
    return ind;
}
*/

int execute(char *path)
{
  804bf8:	f3 0f 1e fa          	endbr64 
  804bfc:	55                   	push   rbp
  804bfd:	48 89 e5             	mov    rbp,rsp
  804c00:	48 83 ec 30          	sub    rsp,0x30
  804c04:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  804c08:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  804c0f:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, 1)) == -1)return -1;
  804c16:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804c1a:	be 01 00 00 00       	mov    esi,0x1
  804c1f:	48 89 c7             	mov    rdi,rax
  804c22:	e8 6d cd ff ff       	call   801994 <sys_open>
  804c27:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  804c2a:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804c2e:	75 0a                	jne    804c3a <execute+0x42>
  804c30:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804c35:	e9 b7 00 00 00       	jmp    804cf1 <execute+0xf9>
    //
    char *p=path;
  804c3a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804c3e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  804c42:	eb 05                	jmp    804c49 <execute+0x51>
  804c44:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  804c49:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c4d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804c50:	84 c0                	test   al,al
  804c52:	75 f0                	jne    804c44 <execute+0x4c>
    for(;*p!='/'&&p>path;p--);
  804c54:	eb 05                	jmp    804c5b <execute+0x63>
  804c56:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  804c5b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c5f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804c62:	3c 2f                	cmp    al,0x2f
  804c64:	74 0a                	je     804c70 <execute+0x78>
  804c66:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c6a:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804c6e:	77 e6                	ja     804c56 <execute+0x5e>
    if(p>path)
  804c70:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c74:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804c78:	76 2f                	jbe    804ca9 <execute+0xb1>
    {
        *p='\0';
  804c7a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c7e:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, 1)) == -1)return -1;
  804c81:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804c85:	be 01 00 00 00       	mov    esi,0x1
  804c8a:	48 89 c7             	mov    rdi,rax
  804c8d:	e8 02 cd ff ff       	call   801994 <sys_open>
  804c92:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  804c95:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  804c99:	75 07                	jne    804ca2 <execute+0xaa>
  804c9b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804ca0:	eb 4f                	jmp    804cf1 <execute+0xf9>
        *p='/';
  804ca2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ca6:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern vfs_dir_entry opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  804ca9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804cac:	48 63 d0             	movsxd rdx,eax
  804caf:	48 89 d0             	mov    rax,rdx
  804cb2:	48 01 c0             	add    rax,rax
  804cb5:	48 01 d0             	add    rax,rdx
  804cb8:	48 c1 e0 05          	shl    rax,0x5
  804cbc:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  804cc3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804cc6:	48 63 c8             	movsxd rcx,eax
  804cc9:	48 89 c8             	mov    rax,rcx
  804ccc:	48 01 c0             	add    rax,rax
  804ccf:	48 01 c8             	add    rax,rcx
  804cd2:	48 c1 e0 05          	shl    rax,0x5
  804cd6:	48 05 60 06 40 00    	add    rax,0x400660
  804cdc:	b9 5b 4d 80 00       	mov    ecx,0x804d5b
  804ce1:	48 89 c6             	mov    rsi,rax
  804ce4:	89 cf                	mov    edi,ecx
  804ce6:	e8 14 f8 ff ff       	call   8044ff <reg_proc>
  804ceb:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  804cee:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  804cf1:	c9                   	leave  
  804cf2:	c3                   	ret    

0000000000804cf3 <exec_call>:

int exec_call(char *path)
{
  804cf3:	f3 0f 1e fa          	endbr64 
  804cf7:	55                   	push   rbp
  804cf8:	48 89 e5             	mov    rbp,rsp
  804cfb:	48 83 ec 20          	sub    rsp,0x20
  804cff:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi=execute(path);
  804d03:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804d07:	48 89 c7             	mov    rdi,rax
  804d0a:	e8 e9 fe ff ff       	call   804bf8 <execute>
  804d0f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  804d12:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d15:	01 c0                	add    eax,eax
  804d17:	83 c0 05             	add    eax,0x5
  804d1a:	c1 e0 03             	shl    eax,0x3
  804d1d:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  804d20:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d23:	89 c7                	mov    edi,eax
  804d25:	e8 73 f0 ff ff       	call   803d9d <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  804d2a:	90                   	nop
  804d2b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d2e:	48 98                	cdqe   
  804d30:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804d37:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804d3d:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804d40:	83 f8 03             	cmp    eax,0x3
  804d43:	75 e6                	jne    804d2b <exec_call+0x38>
    return task[pi].exit_code;
  804d45:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d48:	48 98                	cdqe   
  804d4a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804d51:	48 05 b0 84 40 00    	add    rax,0x4084b0
  804d57:	8b 00                	mov    eax,DWORD PTR [rax]
}
  804d59:	c9                   	leave  
  804d5a:	c3                   	ret    

0000000000804d5b <proc_start>:
int proc_start()
{
  804d5b:	f3 0f 1e fa          	endbr64 
  804d5f:	55                   	push   rbp
  804d60:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  804d63:	8b 05 07 d3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d307]        # 412070 <cur_proc>
  804d69:	48 98                	cdqe   
  804d6b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804d72:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804d78:	48 89 c7             	mov    rdi,rax
  804d7b:	e8 1a 00 00 00       	call   804d9a <load_pe>
    //释放进程资源
    del_proc(cur_proc);
  804d80:	8b 05 ea d2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d2ea]        # 412070 <cur_proc>
  804d86:	89 c7                	mov    edi,eax
  804d88:	e8 4f f5 ff ff       	call   8042dc <del_proc>
    switch_proc_tss(0);
  804d8d:	bf 00 00 00 00       	mov    edi,0x0
  804d92:	e8 06 f0 ff ff       	call   803d9d <switch_proc_tss>
}
  804d97:	90                   	nop
  804d98:	5d                   	pop    rbp
  804d99:	c3                   	ret    

0000000000804d9a <load_pe>:
//在cr3切换到目标进程下的加载程序(但进程还没调度到那里)。
int load_pe(struct process *proc)
{
  804d9a:	f3 0f 1e fa          	endbr64 
  804d9e:	55                   	push   rbp
  804d9f:	48 89 e5             	mov    rbp,rsp
  804da2:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  804da9:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    vfs_dir_entry *f=proc->exef;
  804db0:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  804db7:	48 8b 80 94 00 00 00 	mov    rax,QWORD PTR [rax+0x94]
  804dbe:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=f->fno;
  804dc2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  804dc6:	8b 00                	mov    eax,DWORD PTR [rax]
  804dc8:	89 45 94             	mov    DWORD PTR [rbp-0x6c],eax

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  804dcb:	48 8d 8d 70 fe ff ff 	lea    rcx,[rbp-0x190]
  804dd2:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804dd5:	ba 44 00 00 00       	mov    edx,0x44
  804dda:	48 89 ce             	mov    rsi,rcx
  804ddd:	89 c7                	mov    edi,eax
  804ddf:	e8 8f d1 ff ff       	call   801f73 <sys_read>
    sys_seek(exefno,tdh.e_lfanew,SEEK_SET);
  804de4:	48 8b 85 ac fe ff ff 	mov    rax,QWORD PTR [rbp-0x154]
  804deb:	89 c1                	mov    ecx,eax
  804ded:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804df0:	ba 00 00 00 00       	mov    edx,0x0
  804df5:	89 ce                	mov    esi,ecx
  804df7:	89 c7                	mov    edi,eax
  804df9:	e8 06 d2 ff ff       	call   802004 <sys_seek>
    sys_read(exefno, &tnth, sizeof(tnth));
  804dfe:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  804e05:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804e08:	ba f8 00 00 00       	mov    edx,0xf8
  804e0d:	48 89 ce             	mov    rsi,rcx
  804e10:	89 c7                	mov    edi,eax
  804e12:	e8 5c d1 ff ff       	call   801f73 <sys_read>

    //是否需要移动base(先不检查)
    unsigned int nbase=tnth.OptionalHeader.ImageBase;
  804e17:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  804e1d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  804e20:	8b 85 c0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x240]
  804e26:	c1 e8 0c             	shr    eax,0xc
  804e29:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
    //use_pgm_ava检查在页表中这个范围是否可用，可用就使用
    while(1)
    {
        cont:
        ;
        int pdei=nbase/PAGE_INDEX_SIZE;
  804e2c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804e2f:	c1 e8 16             	shr    eax,0x16
  804e32:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
        int ptei=nbase%PAGE_INDEX_SIZE/PAGE_SIZE;
  804e35:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804e38:	25 ff ff 3f 00       	and    eax,0x3fffff
  804e3d:	c1 e8 0c             	shr    eax,0xc
  804e40:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
        int *pt=(proc->pdet[pdei]&0xfffff000);
  804e43:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  804e4a:	48 8b 90 84 00 00 00 	mov    rdx,QWORD PTR [rax+0x84]
  804e51:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
  804e54:	48 98                	cdqe   
  804e56:	48 c1 e0 02          	shl    rax,0x2
  804e5a:	48 01 d0             	add    rax,rdx
  804e5d:	8b 00                	mov    eax,DWORD PTR [rax]
  804e5f:	89 c0                	mov    eax,eax
  804e61:	25 00 f0 ff ff       	and    eax,0xfffff000
  804e66:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
        for(int i=0;i<pgn;i++)
  804e6a:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  804e71:	eb 48                	jmp    804ebb <load_pe+0x121>
        {
            if(pt[ptei+i%1024]&PAGE_PRESENT&&pt!=NULL)
  804e73:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804e76:	99                   	cdq    
  804e77:	c1 ea 16             	shr    edx,0x16
  804e7a:	01 d0                	add    eax,edx
  804e7c:	25 ff 03 00 00       	and    eax,0x3ff
  804e81:	29 d0                	sub    eax,edx
  804e83:	89 c2                	mov    edx,eax
  804e85:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  804e88:	01 d0                	add    eax,edx
  804e8a:	48 98                	cdqe   
  804e8c:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  804e93:	00 
  804e94:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  804e98:	48 01 d0             	add    rax,rdx
  804e9b:	8b 00                	mov    eax,DWORD PTR [rax]
  804e9d:	83 e0 01             	and    eax,0x1
  804ea0:	85 c0                	test   eax,eax
  804ea2:	74 13                	je     804eb7 <load_pe+0x11d>
  804ea4:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
  804ea9:	74 0c                	je     804eb7 <load_pe+0x11d>
            {
                //移动base
                nbase+=0x1000;
  804eab:	81 45 fc 00 10 00 00 	add    DWORD PTR [rbp-0x4],0x1000
                goto cont;
  804eb2:	e9 75 ff ff ff       	jmp    804e2c <load_pe+0x92>
        for(int i=0;i<pgn;i++)
  804eb7:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  804ebb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804ebe:	3b 45 90             	cmp    eax,DWORD PTR [rbp-0x70]
  804ec1:	7c b0                	jl     804e73 <load_pe+0xd9>
            }
        }
        break;
  804ec3:	90                   	nop
    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_seek(exefno,0,SEEK_SET);
  804ec4:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804ec7:	ba 00 00 00 00       	mov    edx,0x0
  804ecc:	be 00 00 00 00       	mov    esi,0x0
  804ed1:	89 c7                	mov    edi,eax
  804ed3:	e8 2c d1 ff ff       	call   802004 <sys_seek>
    sys_read(exefno, nbase, PAGE_SIZE);
  804ed8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804edb:	48 89 c1             	mov    rcx,rax
  804ede:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804ee1:	ba 00 10 00 00       	mov    edx,0x1000
  804ee6:	48 89 ce             	mov    rsi,rcx
  804ee9:	89 c7                	mov    edi,eax
  804eeb:	e8 83 d0 ff ff       	call   801f73 <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  804ef0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804ef3:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_NT_HEADERS32 nth=nbase+dosh->e_lfanew;
  804efa:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804efd:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  804f04:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  804f08:	48 01 d0             	add    rax,rdx
  804f0b:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  804f12:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804f19:	48 83 c0 04          	add    rax,0x4
  804f1d:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  804f24:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804f2b:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  804f2e:	89 85 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],eax
    int page_count=prog_size/4096;
  804f34:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  804f3a:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804f40:	85 c0                	test   eax,eax
  804f42:	0f 48 c2             	cmovs  eax,edx
  804f45:	c1 f8 0c             	sar    eax,0xc
  804f48:	89 85 60 ff ff ff    	mov    DWORD PTR [rbp-0xa0],eax

    int shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  804f4e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804f55:	8b 50 28             	mov    edx,DWORD PTR [rax+0x28]
  804f58:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804f5b:	01 d0                	add    eax,edx
  804f5d:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  804f63:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  804f69:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  804f6f:	85 c0                	test   eax,eax
  804f71:	0f 48 c2             	cmovs  eax,edx
  804f74:	c1 f8 0a             	sar    eax,0xa
  804f77:	89 c1                	mov    ecx,eax
  804f79:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  804f7f:	99                   	cdq    
  804f80:	c1 ea 16             	shr    edx,0x16
  804f83:	01 d0                	add    eax,edx
  804f85:	25 ff 03 00 00       	and    eax,0x3ff
  804f8a:	29 d0                	sub    eax,edx
  804f8c:	01 c8                	add    eax,ecx
  804f8e:	85 c0                	test   eax,eax
  804f90:	0f 95 c0             	setne  al
  804f93:	0f b6 c0             	movzx  eax,al
  804f96:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  804f9c:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  804fa2:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  804fa8:	85 c0                	test   eax,eax
  804faa:	0f 48 c2             	cmovs  eax,edx
  804fad:	c1 f8 16             	sar    eax,0x16
  804fb0:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  804fb6:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804fbd:	89 c0                	mov    eax,eax
  804fbf:	48 05 f8 00 00 00    	add    rax,0xf8
  804fc5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  804fc9:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804fd0:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  804fd4:	0f b7 d0             	movzx  edx,ax
  804fd7:	89 d0                	mov    eax,edx
  804fd9:	c1 e0 02             	shl    eax,0x2
  804fdc:	01 d0                	add    eax,edx
  804fde:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  804fe1:	05 3c 01 00 00       	add    eax,0x13c
  804fe6:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    int align=nth->OptionalHeader.FileAlignment;
  804fec:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804ff3:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  804ff6:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  804ffc:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805002:	99                   	cdq    
  805003:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  805009:	89 d0                	mov    eax,edx
  80500b:	85 c0                	test   eax,eax
  80500d:	74 23                	je     805032 <load_pe+0x298>
  80500f:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805015:	99                   	cdq    
  805016:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  80501c:	89 d1                	mov    ecx,edx
  80501e:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805024:	29 c8                	sub    eax,ecx
  805026:	89 c2                	mov    edx,eax
  805028:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
  80502e:	01 d0                	add    eax,edx
  805030:	eb 06                	jmp    805038 <load_pe+0x29e>
  805032:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805038:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  80503e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805045:	eb 68                	jmp    8050af <load_pe+0x315>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  805047:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80504b:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80504e:	25 00 00 00 02       	and    eax,0x2000000
  805053:	89 85 bc fe ff ff    	mov    DWORD PTR [rbp-0x144],eax
        if(disca)
  805059:	83 bd bc fe ff ff 00 	cmp    DWORD PTR [rbp-0x144],0x0
  805060:	75 43                	jne    8050a5 <load_pe+0x30b>
            continue;
        //直接读，缺页内核解决
        sys_seek(exefno,psec->PointerToRawData,SEEK_SET);
  805062:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805066:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805069:	89 c1                	mov    ecx,eax
  80506b:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  80506e:	ba 00 00 00 00       	mov    edx,0x0
  805073:	89 ce                	mov    esi,ecx
  805075:	89 c7                	mov    edi,eax
  805077:	e8 88 cf ff ff       	call   802004 <sys_seek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  80507c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805080:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805083:	89 c2                	mov    edx,eax
  805085:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805089:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
  80508c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80508f:	01 c8                	add    eax,ecx
  805091:	89 c0                	mov    eax,eax
  805093:	48 89 c1             	mov    rcx,rax
  805096:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805099:	48 89 ce             	mov    rsi,rcx
  80509c:	89 c7                	mov    edi,eax
  80509e:	e8 d0 ce ff ff       	call   801f73 <sys_read>
  8050a3:	eb 01                	jmp    8050a6 <load_pe+0x30c>
            continue;
  8050a5:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  8050a6:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8050aa:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  8050af:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8050b6:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  8050ba:	0f b7 c0             	movzx  eax,ax
  8050bd:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8050c0:	7c 85                	jl     805047 <load_pe+0x2ad>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  8050c2:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8050c9:	48 83 e8 80          	sub    rax,0xffffffffffffff80
  8050cd:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    if(impd->Size>0)
  8050d4:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  8050db:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8050de:	85 c0                	test   eax,eax
  8050e0:	0f 84 71 02 00 00    	je     805357 <load_pe+0x5bd>
    {
        int tmpi=impd->VirtualAddress+nbase;
  8050e6:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  8050ed:	8b 10                	mov    edx,DWORD PTR [rax]
  8050ef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8050f2:	01 d0                	add    eax,edx
  8050f4:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  8050fa:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  805100:	48 98                	cdqe   
  805102:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  805106:	e9 3e 02 00 00       	jmp    805349 <load_pe+0x5af>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  80510b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80510f:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  805112:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805115:	01 d0                	add    eax,edx
  805117:	89 c0                	mov    eax,eax
  805119:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  805120:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  805127:	be 30 18 81 00       	mov    esi,0x811830
  80512c:	48 89 c7             	mov    rdi,rax
  80512f:	e8 0f 45 00 00       	call   809643 <strcmp>
  805134:	85 c0                	test   eax,eax
  805136:	75 09                	jne    805141 <load_pe+0x3a7>
            {
                dllp=0x1c00000;
  805138:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  80513f:	eb 25                	jmp    805166 <load_pe+0x3cc>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  805141:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805148:	48 89 c7             	mov    rdi,rax
  80514b:	e8 4a fc ff ff       	call   804d9a <load_pe>
  805150:	89 85 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  805156:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  80515c:	89 c7                	mov    edi,eax
  80515e:	e8 c9 03 00 00       	call   80552c <get_module_addr>
  805163:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  805166:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805169:	48 98                	cdqe   
  80516b:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  805172:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805175:	48 63 d0             	movsxd rdx,eax
  805178:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  80517f:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  805183:	48 01 d0             	add    rax,rdx
  805186:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  80518d:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805194:	8b 50 78             	mov    edx,DWORD PTR [rax+0x78]
  805197:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80519a:	01 d0                	add    eax,edx
  80519c:	89 c0                	mov    eax,eax
  80519e:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
            int funcn=dllexp->NumberOfNames;
  8051a5:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8051ac:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8051af:	89 85 0c ff ff ff    	mov    DWORD PTR [rbp-0xf4],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  8051b5:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8051bc:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  8051bf:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8051c2:	01 d0                	add    eax,edx
  8051c4:	89 c0                	mov    eax,eax
  8051c6:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  8051cd:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8051d4:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8051d7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8051da:	01 d0                	add    eax,edx
  8051dc:	89 c0                	mov    eax,eax
  8051de:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  8051e5:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8051ec:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8051ef:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8051f2:	01 d0                	add    eax,edx
  8051f4:	89 c0                	mov    eax,eax
  8051f6:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  8051fd:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805204:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805207:	89 85 ec fe ff ff    	mov    DWORD PTR [rbp-0x114],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  80520d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805211:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  805214:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805217:	01 d0                	add    eax,edx
  805219:	89 c0                	mov    eax,eax
  80521b:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  80521f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805223:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  805226:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805229:	01 d0                	add    eax,edx
  80522b:	89 c0                	mov    eax,eax
  80522d:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  805231:	e9 00 01 00 00       	jmp    805336 <load_pe+0x59c>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  805236:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80523a:	8b 00                	mov    eax,DWORD PTR [rax]
  80523c:	85 c0                	test   eax,eax
  80523e:	79 43                	jns    805283 <load_pe+0x4e9>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  805240:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805244:	8b 00                	mov    eax,DWORD PTR [rax]
  805246:	25 ff ff ff 7f       	and    eax,0x7fffffff
  80524b:	2b 85 ec fe ff ff    	sub    eax,DWORD PTR [rbp-0x114]
  805251:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  805257:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  80525d:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805264:	00 
  805265:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80526c:	48 01 d0             	add    rax,rdx
  80526f:	8b 10                	mov    edx,DWORD PTR [rax]
  805271:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805274:	01 d0                	add    eax,edx
  805276:	89 c2                	mov    edx,eax
  805278:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80527c:	89 10                	mov    DWORD PTR [rax],edx
  80527e:	e9 a9 00 00 00       	jmp    80532c <load_pe+0x592>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  805283:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805287:	8b 00                	mov    eax,DWORD PTR [rax]
  805289:	89 c0                	mov    eax,eax
  80528b:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  805292:	48 83 85 e0 fe ff ff 	add    QWORD PTR [rbp-0x120],0x2
  805299:	02 
                    int i=0;
  80529a:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  8052a1:	eb 7a                	jmp    80531d <load_pe+0x583>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  8052a3:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8052a6:	48 98                	cdqe   
  8052a8:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8052af:	00 
  8052b0:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  8052b7:	48 01 d0             	add    rax,rdx
  8052ba:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8052bd:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
  8052c4:	48 89 d6             	mov    rsi,rdx
  8052c7:	48 89 c7             	mov    rdi,rax
  8052ca:	e8 74 43 00 00       	call   809643 <strcmp>
  8052cf:	85 c0                	test   eax,eax
  8052d1:	75 46                	jne    805319 <load_pe+0x57f>
                        {
                            int ordi=funcords[i];
  8052d3:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8052d6:	48 98                	cdqe   
  8052d8:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  8052dc:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  8052e3:	48 01 d0             	add    rax,rdx
  8052e6:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8052e9:	98                   	cwde   
  8052ea:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  8052f0:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
  8052f6:	48 98                	cdqe   
  8052f8:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8052ff:	00 
  805300:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  805307:	48 01 d0             	add    rax,rdx
  80530a:	8b 10                	mov    edx,DWORD PTR [rax]
  80530c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80530f:	01 d0                	add    eax,edx
  805311:	89 c2                	mov    edx,eax
  805313:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805317:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  805319:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  80531d:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  805320:	3b 85 0c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xf4]
  805326:	0f 8c 77 ff ff ff    	jl     8052a3 <load_pe+0x509>
                        }
                    }
                }
                iataddrs++;
  80532c:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  805331:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  805336:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80533a:	8b 00                	mov    eax,DWORD PTR [rax]
  80533c:	85 c0                	test   eax,eax
  80533e:	0f 85 f2 fe ff ff    	jne    805236 <load_pe+0x49c>
            }
            impdes++;
  805344:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  805349:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80534d:	8b 00                	mov    eax,DWORD PTR [rax]
  80534f:	85 c0                	test   eax,eax
  805351:	0f 85 b4 fd ff ff    	jne    80510b <load_pe+0x371>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  805357:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  80535e:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  80535f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805366:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [rax+0xa4]
  80536c:	85 c0                	test   eax,eax
  80536e:	0f 84 e8 00 00 00    	je     80545c <load_pe+0x6c2>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  805374:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80537b:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [rax+0xa0]
  805381:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805384:	01 d0                	add    eax,edx
  805386:	89 c0                	mov    eax,eax
  805388:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                                +(u32)nbase);
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  80538c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805390:	48 83 c0 40          	add    rax,0x40
  805394:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  805398:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80539c:	48 83 c0 02          	add    rax,0x2
  8053a0:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  8053a4:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8053ab:	8b 40 34             	mov    eax,DWORD PTR [rax+0x34]
  8053ae:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
        while(relp->VirtualAddress){
  8053b4:	e9 95 00 00 00       	jmp    80544e <load_pe+0x6b4>
            int pgva=relp->VirtualAddress+nbase;
  8053b9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8053bd:	8b 10                	mov    edx,DWORD PTR [rax]
  8053bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053c2:	01 d0                	add    eax,edx
  8053c4:	89 85 d0 fe ff ff    	mov    DWORD PTR [rbp-0x130],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8053ca:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  8053d1:	eb 59                	jmp    80542c <load_pe+0x692>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8053d3:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8053d7:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8053da:	66 85 c0             	test   ax,ax
  8053dd:	74 48                	je     805427 <load_pe+0x68d>
                int *at=*reloc+pgva;//要重定位的数据的地址
  8053df:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8053e3:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8053e6:	0f b7 d0             	movzx  edx,ax
  8053e9:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  8053ef:	01 d0                	add    eax,edx
  8053f1:	48 98                	cdqe   
  8053f3:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
                *at=*at-old_base+nbase;
  8053fa:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  805401:	8b 00                	mov    eax,DWORD PTR [rax]
  805403:	2b 85 d4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x12c]
  805409:	89 c2                	mov    edx,eax
  80540b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80540e:	01 d0                	add    eax,edx
  805410:	89 c2                	mov    edx,eax
  805412:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  805419:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  80541b:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  805420:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  805425:	eb 01                	jmp    805428 <load_pe+0x68e>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  805427:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  805428:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  80542c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805430:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805433:	c1 e8 02             	shr    eax,0x2
  805436:	89 c2                	mov    edx,eax
  805438:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  80543b:	39 c2                	cmp    edx,eax
  80543d:	77 94                	ja     8053d3 <load_pe+0x639>
            }
            relp=(int)relp+0x1000;
  80543f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805443:	05 00 10 00 00       	add    eax,0x1000
  805448:	48 98                	cdqe   
  80544a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  80544e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805452:	8b 00                	mov    eax,DWORD PTR [rax]
  805454:	85 c0                	test   eax,eax
  805456:	0f 85 5d ff ff ff    	jne    8053b9 <load_pe+0x61f>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  80545c:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  805463:	00 00 00 
  805466:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  80546d:	00 00 00 
  805470:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  805477:	00 00 00 00 
  80547b:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  805482:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  805486:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  80548d:	ba 18 00 00 00       	mov    edx,0x18
  805492:	48 89 c6             	mov    rsi,rax
  805495:	bf 00 00 00 01       	mov    edi,0x1000000
  80549a:	e8 06 3f 00 00       	call   8093a5 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  80549f:	8b 05 cb cb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cbcb]        # 412070 <cur_proc>
  8054a5:	48 98                	cdqe   
  8054a7:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8054ae:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8054b4:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  8054bb:	8b 05 af cb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cbaf]        # 412070 <cur_proc>
  8054c1:	48 98                	cdqe   
  8054c3:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8054ca:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8054d0:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  8054d7:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8054dd:	48 98                	cdqe   
  8054df:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
    task[cur_proc].exit_code=main(0,NULL);
  8054e6:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
  8054ed:	be 00 00 00 00       	mov    esi,0x0
  8054f2:	bf 00 00 00 00       	mov    edi,0x0
  8054f7:	ff d0                	call   rax
  8054f9:	8b 15 71 cb c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0cb71]        # 412070 <cur_proc>
  8054ff:	89 c1                	mov    ecx,eax
  805501:	48 63 c2             	movsxd rax,edx
  805504:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80550b:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805511:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  805513:	8b 05 57 cb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cb57]        # 412070 <cur_proc>
  805519:	48 98                	cdqe   
  80551b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  805522:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805528:	8b 00                	mov    eax,DWORD PTR [rax]
}
  80552a:	c9                   	leave  
  80552b:	c3                   	ret    

000000000080552c <get_module_addr>:

int get_module_addr(int mi)
{
  80552c:	f3 0f 1e fa          	endbr64 
  805530:	55                   	push   rbp
  805531:	48 89 e5             	mov    rbp,rsp
  805534:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  805537:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80553a:	48 98                	cdqe   
  80553c:	8b 04 c5 80 4c 42 00 	mov    eax,DWORD PTR [rax*8+0x424c80]
}
  805543:	5d                   	pop    rbp
  805544:	c3                   	ret    

0000000000805545 <dispose_library>:
int dispose_library(int dlln)
{
  805545:	f3 0f 1e fa          	endbr64 
  805549:	55                   	push   rbp
  80554a:	48 89 e5             	mov    rbp,rsp
  80554d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  805550:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805554:	78 09                	js     80555f <dispose_library+0x1a>
  805556:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  80555d:	7e 07                	jle    805566 <dispose_library+0x21>
  80555f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805564:	eb 1d                	jmp    805583 <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  805566:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805569:	48 98                	cdqe   
  80556b:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  805572:	48 05 88 20 41 00    	add    rax,0x412088
  805578:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  80557e:	b8 00 00 00 00       	mov    eax,0x0
}
  805583:	5d                   	pop    rbp
  805584:	c3                   	ret    

0000000000805585 <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  805585:	f3 0f 1e fa          	endbr64 
  805589:	55                   	push   rbp
  80558a:	48 89 e5             	mov    rbp,rsp
  80558d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  805591:	90                   	nop
  805592:	5d                   	pop    rbp
  805593:	c3                   	ret    

0000000000805594 <sys_rmmod>:
int sys_rmmod(char *name)
{
  805594:	f3 0f 1e fa          	endbr64 
  805598:	55                   	push   rbp
  805599:	48 89 e5             	mov    rbp,rsp
  80559c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  8055a0:	90                   	nop
  8055a1:	5d                   	pop    rbp
  8055a2:	c3                   	ret    
  8055a3:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  8055aa:	00 00 00 
  8055ad:	0f 1f 00             	nop    DWORD PTR [rax]

00000000008055b0 <_syscall>:
  8055b0:	57                   	push   rdi
  8055b1:	56                   	push   rsi
  8055b2:	52                   	push   rdx
  8055b3:	51                   	push   rcx
  8055b4:	53                   	push   rbx
  8055b5:	50                   	push   rax
  8055b6:	e8 b3 af ff ff       	call   80056e <syscall>
  8055bb:	48 83 c4 18          	add    rsp,0x18
  8055bf:	cf                   	iret   

00000000008055c0 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  8055c0:	f3 0f 1e fa          	endbr64 
  8055c4:	55                   	push   rbp
  8055c5:	48 89 e5             	mov    rbp,rsp
  8055c8:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  8055cc:	8b 05 c2 fa c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fac2]        # 425094 <framebuffer+0x14>
  8055d2:	89 c0                	mov    eax,eax
  8055d4:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  8055d8:	8b 05 ba fa c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1faba]        # 425098 <framebuffer+0x18>
  8055de:	89 c0                	mov    eax,eax
  8055e0:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  8055e4:	0f b6 05 b1 fa c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fab1]        # 42509c <framebuffer+0x1c>
  8055eb:	c0 e8 03             	shr    al,0x3
  8055ee:	0f b6 c0             	movzx  eax,al
  8055f1:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  8055f5:	8b 05 95 fa c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fa95]        # 425090 <framebuffer+0x10>
  8055fb:	89 c0                	mov    eax,eax
  8055fd:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  805601:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805605:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  80560a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  80560e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805612:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  805617:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  80561b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80561f:	48 c1 e8 0c          	shr    rax,0xc
  805623:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  805626:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  80562d:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  80562e:	48 8b 05 53 fa c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1fa53]        # 425088 <framebuffer+0x8>
  805635:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  805639:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  805640:	00 
  805641:	eb 2d                	jmp    805670 <init_framebuffer+0xb0>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  805643:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  805647:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80564b:	ba 07 00 00 00       	mov    edx,0x7
  805650:	48 89 ce             	mov    rsi,rcx
  805653:	48 89 c7             	mov    rdi,rax
  805656:	e8 b0 b8 ff ff       	call   800f0b <mmap>
        pp+=PAGE_SIZE;
  80565b:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  805662:	00 
        p+=PAGE_SIZE;
  805663:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  80566a:	00 
    for (size_t i = 0; i < pgc; i++)
  80566b:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  805670:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  805673:	48 98                	cdqe   
  805675:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  805679:	72 c8                	jb     805643 <init_framebuffer+0x83>
    }
    
    
}
  80567b:	90                   	nop
  80567c:	90                   	nop
  80567d:	c9                   	leave  
  80567e:	c3                   	ret    

000000000080567f <init_font>:
void init_font(){
  80567f:	f3 0f 1e fa          	endbr64 
  805683:	55                   	push   rbp
  805684:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  805687:	48 c7 05 2e fa c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1fa2e],0x809f68        # 4250c0 <boot_font>
  80568e:	68 9f 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  805692:	48 8b 05 27 fa c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1fa27]        # 4250c0 <boot_font>
  805699:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  80569c:	83 c0 07             	add    eax,0x7
  80569f:	c1 e8 03             	shr    eax,0x3
  8056a2:	89 05 28 fa c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fa28],eax        # 4250d0 <font_width_bytes>
    font_width = font_width_bytes * 8;
  8056a8:	8b 05 22 fa c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fa22]        # 4250d0 <font_width_bytes>
  8056ae:	c1 e0 03             	shl    eax,0x3
  8056b1:	89 05 11 fa c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fa11],eax        # 4250c8 <font_width>
    font_height = boot_font->height;
  8056b7:	48 8b 05 02 fa c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1fa02]        # 4250c0 <boot_font>
  8056be:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8056c1:	89 05 05 fa c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fa05],eax        # 4250cc <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  8056c7:	48 8b 05 f2 f9 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f9f2]        # 4250c0 <boot_font>
  8056ce:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8056d1:	89 c0                	mov    eax,eax
  8056d3:	48 05 68 9f 80 00    	add    rax,0x809f68
  8056d9:	48 89 05 f8 f9 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f9f8],rax        # 4250d8 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  8056e0:	48 8b 05 d9 f9 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f9d9]        # 4250c0 <boot_font>
  8056e7:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8056ea:	89 05 f4 f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f9f4],eax        # 4250e4 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  8056f0:	48 8b 05 c9 f9 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f9c9]        # 4250c0 <boot_font>
  8056f7:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8056fa:	89 05 e0 f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f9e0],eax        # 4250e0 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  805700:	c7 05 a6 f9 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f9a6],0x0        # 4250b0 <fb_cursor_y>
  805707:	00 00 00 
  80570a:	8b 05 a0 f9 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f9a0]        # 4250b0 <fb_cursor_y>
  805710:	89 05 96 f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f996],eax        # 4250ac <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width *framebuffer.common.framebuffer_bpp/8 / font_width;
  805716:	8b 15 78 f9 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f978]        # 425094 <framebuffer+0x14>
  80571c:	0f b6 05 79 f9 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f979]        # 42509c <framebuffer+0x1c>
  805723:	0f b6 c0             	movzx  eax,al
  805726:	0f af c2             	imul   eax,edx
  805729:	c1 e8 03             	shr    eax,0x3
  80572c:	8b 0d 96 f9 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f996]        # 4250c8 <font_width>
  805732:	ba 00 00 00 00       	mov    edx,0x0
  805737:	f7 f1                	div    ecx
  805739:	89 05 75 f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f975],eax        # 4250b4 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height *framebuffer.common.framebuffer_bpp/8 / font_height;
  80573f:	8b 15 53 f9 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f953]        # 425098 <framebuffer+0x18>
  805745:	0f b6 05 50 f9 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f950]        # 42509c <framebuffer+0x1c>
  80574c:	0f b6 c0             	movzx  eax,al
  80574f:	0f af c2             	imul   eax,edx
  805752:	c1 e8 03             	shr    eax,0x3
  805755:	8b 35 71 f9 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1f971]        # 4250cc <font_height>
  80575b:	ba 00 00 00 00       	mov    edx,0x0
  805760:	f7 f6                	div    esi
  805762:	89 05 50 f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f950],eax        # 4250b8 <max_ch_nr_y>
    font_size=1;
  805768:	c7 05 36 46 00 00 01 	mov    DWORD PTR [rip+0x4636],0x1        # 809da8 <font_size>
  80576f:	00 00 00 
}
  805772:	90                   	nop
  805773:	5d                   	pop    rbp
  805774:	c3                   	ret    

0000000000805775 <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  805775:	f3 0f 1e fa          	endbr64 
  805779:	55                   	push   rbp
  80577a:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  80577d:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  805781:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  805785:	48 89 05 f4 f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f8f4],rax        # 425080 <framebuffer>
  80578c:	48 89 15 f5 f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f8f5],rdx        # 425088 <framebuffer+0x8>
  805793:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  805797:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  80579b:	48 89 05 ee f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f8ee],rax        # 425090 <framebuffer+0x10>
  8057a2:	48 89 15 ef f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f8ef],rdx        # 425098 <framebuffer+0x18>
  8057a9:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  8057ad:	48 89 05 ec f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f8ec],rax        # 4250a0 <framebuffer+0x20>
}
  8057b4:	90                   	nop
  8057b5:	5d                   	pop    rbp
  8057b6:	c3                   	ret    

00000000008057b7 <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  8057b7:	f3 0f 1e fa          	endbr64 
  8057bb:	55                   	push   rbp
  8057bc:	48 89 e5             	mov    rbp,rsp
  8057bf:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  8057c2:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  8057c5:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  8057c8:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  8057cb:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  8057cf:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  8057d6:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  8057d7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8057da:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  8057dd:	eb 64                	jmp    805843 <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  8057df:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8057e2:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  8057e5:	eb 4b                	jmp    805832 <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  8057e7:	8b 15 a3 f8 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f8a3]        # 425090 <framebuffer+0x10>
  8057ed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8057f0:	0f af c2             	imul   eax,edx
  8057f3:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  8057f5:	0f b6 05 a0 f8 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f8a0]        # 42509c <framebuffer+0x1c>
  8057fc:	0f b6 c0             	movzx  eax,al
  8057ff:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805803:	8d 50 07             	lea    edx,[rax+0x7]
  805806:	85 c0                	test   eax,eax
  805808:	0f 48 c2             	cmovs  eax,edx
  80580b:	c1 f8 03             	sar    eax,0x3
  80580e:	48 98                	cdqe   
  805810:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805813:	48 05 00 00 00 40    	add    rax,0x40000000
  805819:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  80581d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805821:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  805825:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805829:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  80582c:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  80582e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805832:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805835:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805838:	01 d0                	add    eax,edx
  80583a:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  80583d:	7c a8                	jl     8057e7 <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  80583f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805843:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  805846:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805849:	01 d0                	add    eax,edx
  80584b:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80584e:	7c 8f                	jl     8057df <fill_rect+0x28>
        }
    }
}
  805850:	90                   	nop
  805851:	90                   	nop
  805852:	5d                   	pop    rbp
  805853:	c3                   	ret    

0000000000805854 <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  805854:	f3 0f 1e fa          	endbr64 
  805858:	55                   	push   rbp
  805859:	48 89 e5             	mov    rbp,rsp
  80585c:	48 83 ec 30          	sub    rsp,0x30
  805860:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  805863:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805866:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  805869:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  80586d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805870:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  805873:	eb 5a                	jmp    8058cf <draw_text+0x7b>
    {
        if(*str=='\n')
  805875:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805879:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80587c:	3c 0a                	cmp    al,0xa
  80587e:	75 1c                	jne    80589c <draw_text+0x48>
        {
            y+=font_height*size;
  805880:	8b 15 46 f8 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f846]        # 4250cc <font_height>
  805886:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  805889:	0f af d0             	imul   edx,eax
  80588c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80588f:	01 d0                	add    eax,edx
  805891:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  805894:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805897:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  80589a:	eb 2e                	jmp    8058ca <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  80589c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8058a0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8058a3:	0f be c8             	movsx  ecx,al
  8058a6:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8058a9:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  8058ac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058af:	89 c7                	mov    edi,eax
  8058b1:	e8 28 00 00 00       	call   8058de <draw_letter>
            tx+=size*font_width;
  8058b6:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8058b9:	8b 05 09 f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f809]        # 4250c8 <font_width>
  8058bf:	0f af d0             	imul   edx,eax
  8058c2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058c5:	01 d0                	add    eax,edx
  8058c7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  8058ca:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  8058cf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8058d3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8058d6:	84 c0                	test   al,al
  8058d8:	75 9b                	jne    805875 <draw_text+0x21>
    }
}
  8058da:	90                   	nop
  8058db:	90                   	nop
  8058dc:	c9                   	leave  
  8058dd:	c3                   	ret    

00000000008058de <draw_letter>:
void draw_letter(int x, int y, int size, char c) {
  8058de:	f3 0f 1e fa          	endbr64 
  8058e2:	55                   	push   rbp
  8058e3:	48 89 e5             	mov    rbp,rsp
  8058e6:	48 83 ec 30          	sub    rsp,0x30
  8058ea:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  8058ed:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  8058f0:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  8058f3:	89 c8                	mov    eax,ecx
  8058f5:	88 45 d0             	mov    BYTE PTR [rbp-0x30],al
    u8 *glyph = glyph_table;
  8058f8:	48 8b 05 d9 f7 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f7d9]        # 4250d8 <glyph_table>
  8058ff:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  805903:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805907:	8b 05 d7 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7d7]        # 4250e4 <glyph_nr>
  80590d:	39 c2                	cmp    edx,eax
  80590f:	73 13                	jae    805924 <draw_letter+0x46>
        glyph += c * bytes_per_glyph;
  805911:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805915:	8b 05 c5 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7c5]        # 4250e0 <bytes_per_glyph>
  80591b:	0f af c2             	imul   eax,edx
  80591e:	89 c0                	mov    eax,eax
  805920:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805924:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80592b:	e9 c9 00 00 00       	jmp    8059f9 <draw_letter+0x11b>
        u8 mask = 1 << 7;
  805930:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805934:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80593b:	e9 9a 00 00 00       	jmp    8059da <draw_letter+0xfc>
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  805940:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805943:	c1 e8 03             	shr    eax,0x3
  805946:	89 c2                	mov    edx,eax
  805948:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80594c:	48 01 d0             	add    rax,rdx
  80594f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805952:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  805955:	84 c0                	test   al,al
  805957:	74 37                	je     805990 <draw_letter+0xb2>
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,-1);
  805959:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80595c:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  805960:	89 c2                	mov    edx,eax
  805962:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805965:	01 d0                	add    eax,edx
  805967:	89 c6                	mov    esi,eax
  805969:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80596c:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  805970:	89 c2                	mov    edx,eax
  805972:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805975:	01 d0                	add    eax,edx
  805977:	89 c7                	mov    edi,eax
  805979:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80597c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80597f:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
  805985:	89 d1                	mov    ecx,edx
  805987:	89 c2                	mov    edx,eax
  805989:	e8 29 fe ff ff       	call   8057b7 <fill_rect>
  80598e:	eb 35                	jmp    8059c5 <draw_letter+0xe7>
            } else {
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,0);
  805990:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805993:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  805997:	89 c2                	mov    edx,eax
  805999:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80599c:	01 d0                	add    eax,edx
  80599e:	89 c6                	mov    esi,eax
  8059a0:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8059a3:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  8059a7:	89 c2                	mov    edx,eax
  8059a9:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8059ac:	01 d0                	add    eax,edx
  8059ae:	89 c7                	mov    edi,eax
  8059b0:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  8059b3:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8059b6:	41 b8 00 00 00 00    	mov    r8d,0x0
  8059bc:	89 d1                	mov    ecx,edx
  8059be:	89 c2                	mov    edx,eax
  8059c0:	e8 f2 fd ff ff       	call   8057b7 <fill_rect>
            }

            mask >>= 1;
  8059c5:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  8059c8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8059cb:	83 e0 07             	and    eax,0x7
  8059ce:	85 c0                	test   eax,eax
  8059d0:	75 04                	jne    8059d6 <draw_letter+0xf8>
                mask = 1 << 7;
  8059d2:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  8059d6:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8059da:	8b 05 e8 f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f6e8]        # 4250c8 <font_width>
  8059e0:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8059e3:	0f 82 57 ff ff ff    	jb     805940 <draw_letter+0x62>
            }
        }

        glyph += font_width_bytes;
  8059e9:	8b 05 e1 f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f6e1]        # 4250d0 <font_width_bytes>
  8059ef:	89 c0                	mov    eax,eax
  8059f1:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  8059f5:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8059f9:	8b 05 cd f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f6cd]        # 4250cc <font_height>
  8059ff:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  805a02:	0f 82 28 ff ff ff    	jb     805930 <draw_letter+0x52>
    }
}
  805a08:	90                   	nop
  805a09:	90                   	nop
  805a0a:	c9                   	leave  
  805a0b:	c3                   	ret    

0000000000805a0c <scr_up>:
//向上滚动一个像素
void scr_up(){
  805a0c:	f3 0f 1e fa          	endbr64 
  805a10:	55                   	push   rbp
  805a11:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805a14:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805a1b:	eb 6c                	jmp    805a89 <scr_up+0x7d>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805a1d:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805a24:	eb 52                	jmp    805a78 <scr_up+0x6c>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805a26:	8b 15 64 f6 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f664]        # 425090 <framebuffer+0x10>
  805a2c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a2f:	0f af c2             	imul   eax,edx
  805a32:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  805a34:	0f b6 05 61 f6 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f661]        # 42509c <framebuffer+0x1c>
  805a3b:	0f b6 c0             	movzx  eax,al
  805a3e:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805a42:	8d 50 07             	lea    edx,[rax+0x7]
  805a45:	85 c0                	test   eax,eax
  805a47:	0f 48 c2             	cmovs  eax,edx
  805a4a:	c1 f8 03             	sar    eax,0x3
  805a4d:	48 98                	cdqe   
  805a4f:	48 01 c8             	add    rax,rcx
  805a52:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805a58:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  805a5c:	8b 05 2e f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f62e]        # 425090 <framebuffer+0x10>
  805a62:	89 c2                	mov    edx,eax
  805a64:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805a68:	48 01 d0             	add    rax,rdx
  805a6b:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  805a6e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805a72:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805a74:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805a78:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805a7b:	8b 05 33 f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f633]        # 4250b4 <max_ch_nr_x>
  805a81:	39 c2                	cmp    edx,eax
  805a83:	72 a1                	jb     805a26 <scr_up+0x1a>
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805a85:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805a89:	8b 05 29 f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f629]        # 4250b8 <max_ch_nr_y>
  805a8f:	8d 50 ff             	lea    edx,[rax-0x1]
  805a92:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a95:	39 c2                	cmp    edx,eax
  805a97:	77 84                	ja     805a1d <scr_up+0x11>
        }

    }
}
  805a99:	90                   	nop
  805a9a:	90                   	nop
  805a9b:	5d                   	pop    rbp
  805a9c:	c3                   	ret    

0000000000805a9d <print>:
void print(char* s){
  805a9d:	f3 0f 1e fa          	endbr64 
  805aa1:	55                   	push   rbp
  805aa2:	48 89 e5             	mov    rbp,rsp
  805aa5:	48 83 ec 18          	sub    rsp,0x18
  805aa9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(;*s;s++){
  805aad:	e9 ec 00 00 00       	jmp    805b9e <print+0x101>
        if(fb_cursor_x>max_ch_nr_x)
  805ab2:	8b 15 f4 f5 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f5f4]        # 4250ac <fb_cursor_x>
  805ab8:	8b 05 f6 f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f5f6]        # 4250b4 <max_ch_nr_x>
  805abe:	39 c2                	cmp    edx,eax
  805ac0:	76 19                	jbe    805adb <print+0x3e>
        {
            fb_cursor_y+=1;
  805ac2:	8b 05 e8 f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f5e8]        # 4250b0 <fb_cursor_y>
  805ac8:	83 c0 01             	add    eax,0x1
  805acb:	89 05 df f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f5df],eax        # 4250b0 <fb_cursor_y>
            fb_cursor_x=0;
  805ad1:	c7 05 d1 f5 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f5d1],0x0        # 4250ac <fb_cursor_x>
  805ad8:	00 00 00 
        }
        if(*s=='\n')continue;
  805adb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805adf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805ae2:	3c 0a                	cmp    al,0xa
  805ae4:	0f 84 ae 00 00 00    	je     805b98 <print+0xfb>
        if(fb_cursor_y>=max_ch_nr_y){
  805aea:	8b 15 c0 f5 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f5c0]        # 4250b0 <fb_cursor_y>
  805af0:	8b 05 c2 f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f5c2]        # 4250b8 <max_ch_nr_y>
  805af6:	39 c2                	cmp    edx,eax
  805af8:	72 3c                	jb     805b36 <print+0x99>
            for(int i=0;i<font_height*font_size;i++)
  805afa:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805b01:	eb 0e                	jmp    805b11 <print+0x74>
                scr_up();
  805b03:	b8 00 00 00 00       	mov    eax,0x0
  805b08:	e8 ff fe ff ff       	call   805a0c <scr_up>
            for(int i=0;i<font_height*font_size;i++)
  805b0d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805b11:	8b 05 b5 f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f5b5]        # 4250cc <font_height>
  805b17:	8b 15 8b 42 00 00    	mov    edx,DWORD PTR [rip+0x428b]        # 809da8 <font_size>
  805b1d:	0f af d0             	imul   edx,eax
  805b20:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b23:	39 c2                	cmp    edx,eax
  805b25:	77 dc                	ja     805b03 <print+0x66>
            fb_cursor_y=max_ch_nr_y-1;
  805b27:	8b 05 8b f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f58b]        # 4250b8 <max_ch_nr_y>
  805b2d:	83 e8 01             	sub    eax,0x1
  805b30:	89 05 7a f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f57a],eax        # 4250b0 <fb_cursor_y>
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  805b36:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805b3a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805b3d:	0f be d0             	movsx  edx,al
  805b40:	8b 05 62 42 00 00    	mov    eax,DWORD PTR [rip+0x4262]        # 809da8 <font_size>
  805b46:	8b 35 64 f5 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1f564]        # 4250b0 <fb_cursor_y>
  805b4c:	8b 0d 7a f5 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f57a]        # 4250cc <font_height>
  805b52:	0f af ce             	imul   ecx,esi
  805b55:	8b 35 4d 42 00 00    	mov    esi,DWORD PTR [rip+0x424d]        # 809da8 <font_size>
  805b5b:	0f af ce             	imul   ecx,esi
  805b5e:	41 89 c8             	mov    r8d,ecx
  805b61:	8b 35 45 f5 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1f545]        # 4250ac <fb_cursor_x>
  805b67:	8b 0d 5b f5 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f55b]        # 4250c8 <font_width>
  805b6d:	0f af ce             	imul   ecx,esi
  805b70:	8b 35 32 42 00 00    	mov    esi,DWORD PTR [rip+0x4232]        # 809da8 <font_size>
  805b76:	0f af ce             	imul   ecx,esi
  805b79:	89 cf                	mov    edi,ecx
  805b7b:	89 d1                	mov    ecx,edx
  805b7d:	89 c2                	mov    edx,eax
  805b7f:	44 89 c6             	mov    esi,r8d
  805b82:	e8 57 fd ff ff       	call   8058de <draw_letter>
        fb_cursor_x+=1;
  805b87:	8b 05 1f f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f51f]        # 4250ac <fb_cursor_x>
  805b8d:	83 c0 01             	add    eax,0x1
  805b90:	89 05 16 f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f516],eax        # 4250ac <fb_cursor_x>
  805b96:	eb 01                	jmp    805b99 <print+0xfc>
        if(*s=='\n')continue;
  805b98:	90                   	nop
    for(;*s;s++){
  805b99:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  805b9e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805ba2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805ba5:	84 c0                	test   al,al
  805ba7:	0f 85 05 ff ff ff    	jne    805ab2 <print+0x15>
    }
}
  805bad:	90                   	nop
  805bae:	90                   	nop
  805baf:	c9                   	leave  
  805bb0:	c3                   	ret    

0000000000805bb1 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  805bb1:	f3 0f 1e fa          	endbr64 
  805bb5:	55                   	push   rbp
  805bb6:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  805bb9:	0f b6 05 4d ff c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1ff4d]        # 425b0d <k_shift>
  805bc0:	84 c0                	test   al,al
  805bc2:	0f 94 c0             	sete   al
  805bc5:	88 05 42 ff c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1ff42],al        # 425b0d <k_shift>
}
  805bcb:	90                   	nop
  805bcc:	5d                   	pop    rbp
  805bcd:	c3                   	ret    

0000000000805bce <ctrl>:
void ctrl()
{
  805bce:	f3 0f 1e fa          	endbr64 
  805bd2:	55                   	push   rbp
  805bd3:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  805bd6:	0f b6 05 31 ff c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1ff31]        # 425b0e <k_ctrl>
  805bdd:	84 c0                	test   al,al
  805bdf:	0f 94 c0             	sete   al
  805be2:	88 05 26 ff c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1ff26],al        # 425b0e <k_ctrl>
}
  805be8:	90                   	nop
  805be9:	5d                   	pop    rbp
  805bea:	c3                   	ret    

0000000000805beb <capslock>:
void capslock()
{
  805beb:	f3 0f 1e fa          	endbr64 
  805bef:	55                   	push   rbp
  805bf0:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  805bf3:	0f b6 05 15 ff c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1ff15]        # 425b0f <k_capslock>
  805bfa:	84 c0                	test   al,al
  805bfc:	0f 94 c0             	sete   al
  805bff:	88 05 0a ff c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1ff0a],al        # 425b0f <k_capslock>
}
  805c05:	90                   	nop
  805c06:	5d                   	pop    rbp
  805c07:	c3                   	ret    

0000000000805c08 <to_ascii>:
char to_ascii(char scan_code)
{
  805c08:	f3 0f 1e fa          	endbr64 
  805c0c:	55                   	push   rbp
  805c0d:	48 89 e5             	mov    rbp,rsp
  805c10:	89 f8                	mov    eax,edi
  805c12:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  805c15:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805c1c:	e9 c7 00 00 00       	jmp    805ce8 <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  805c21:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c24:	48 63 d0             	movsxd rdx,eax
  805c27:	48 89 d0             	mov    rax,rdx
  805c2a:	48 c1 e0 02          	shl    rax,0x2
  805c2e:	48 01 d0             	add    rax,rdx
  805c31:	48 05 a2 19 81 00    	add    rax,0x8119a2
  805c37:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805c3a:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  805c3d:	0f 85 a1 00 00 00    	jne    805ce4 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  805c43:	0f b6 05 c5 fe c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fec5]        # 425b0f <k_capslock>
  805c4a:	84 c0                	test   al,al
  805c4c:	74 55                	je     805ca3 <to_ascii+0x9b>
  805c4e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c51:	48 63 d0             	movsxd rdx,eax
  805c54:	48 89 d0             	mov    rax,rdx
  805c57:	48 c1 e0 02          	shl    rax,0x2
  805c5b:	48 01 d0             	add    rax,rdx
  805c5e:	48 05 a0 19 81 00    	add    rax,0x8119a0
  805c64:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805c67:	3c 60                	cmp    al,0x60
  805c69:	7e 38                	jle    805ca3 <to_ascii+0x9b>
  805c6b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c6e:	48 63 d0             	movsxd rdx,eax
  805c71:	48 89 d0             	mov    rax,rdx
  805c74:	48 c1 e0 02          	shl    rax,0x2
  805c78:	48 01 d0             	add    rax,rdx
  805c7b:	48 05 a0 19 81 00    	add    rax,0x8119a0
  805c81:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805c84:	3c 7a                	cmp    al,0x7a
  805c86:	7f 1b                	jg     805ca3 <to_ascii+0x9b>
  805c88:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c8b:	48 63 d0             	movsxd rdx,eax
  805c8e:	48 89 d0             	mov    rax,rdx
  805c91:	48 c1 e0 02          	shl    rax,0x2
  805c95:	48 01 d0             	add    rax,rdx
  805c98:	48 05 a1 19 81 00    	add    rax,0x8119a1
  805c9e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805ca1:	eb 54                	jmp    805cf7 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  805ca3:	0f b6 05 63 fe c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fe63]        # 425b0d <k_shift>
  805caa:	84 c0                	test   al,al
  805cac:	74 1b                	je     805cc9 <to_ascii+0xc1>
  805cae:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805cb1:	48 63 d0             	movsxd rdx,eax
  805cb4:	48 89 d0             	mov    rax,rdx
  805cb7:	48 c1 e0 02          	shl    rax,0x2
  805cbb:	48 01 d0             	add    rax,rdx
  805cbe:	48 05 a1 19 81 00    	add    rax,0x8119a1
  805cc4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805cc7:	eb 2e                	jmp    805cf7 <to_ascii+0xef>
            else return key_map[i].ascii;
  805cc9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805ccc:	48 63 d0             	movsxd rdx,eax
  805ccf:	48 89 d0             	mov    rax,rdx
  805cd2:	48 c1 e0 02          	shl    rax,0x2
  805cd6:	48 01 d0             	add    rax,rdx
  805cd9:	48 05 a0 19 81 00    	add    rax,0x8119a0
  805cdf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805ce2:	eb 13                	jmp    805cf7 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  805ce4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805ce8:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  805cec:	0f 8e 2f ff ff ff    	jle    805c21 <to_ascii+0x19>
        }

    return '\0';
  805cf2:	b8 00 00 00 00       	mov    eax,0x0
}
  805cf7:	5d                   	pop    rbp
  805cf8:	c3                   	ret    

0000000000805cf9 <init_kb>:
int init_kb()
{
  805cf9:	f3 0f 1e fa          	endbr64 
  805cfd:	55                   	push   rbp
  805cfe:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  805d01:	bf e0 18 81 00       	mov    edi,0x8118e0
  805d06:	e8 f6 cb ff ff       	call   802901 <reg_device>
    reg_driver(&drv_keyboard);
  805d0b:	bf 40 18 81 00       	mov    edi,0x811840
  805d10:	e8 d4 ce ff ff       	call   802be9 <reg_driver>
}
  805d15:	90                   	nop
  805d16:	5d                   	pop    rbp
  805d17:	c3                   	ret    

0000000000805d18 <key_proc>:
int key_proc()
{
  805d18:	f3 0f 1e fa          	endbr64 
  805d1c:	55                   	push   rbp
  805d1d:	48 89 e5             	mov    rbp,rsp
  805d20:	48 83 ec 10          	sub    rsp,0x10
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  805d24:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
  805d28:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  805d2c:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
    key_code tmpc;
    scan1=inb(0x60);
  805d30:	bf 60 00 00 00       	mov    edi,0x60
  805d35:	e8 ea eb ff ff       	call   804924 <inb>
  805d3a:	88 45 fd             	mov    BYTE PTR [rbp-0x3],al
    ch= to_ascii(scan1);
  805d3d:	0f b6 45 fd          	movzx  eax,BYTE PTR [rbp-0x3]
  805d41:	0f be c0             	movsx  eax,al
  805d44:	89 c7                	mov    edi,eax
  805d46:	e8 bd fe ff ff       	call   805c08 <to_ascii>
  805d4b:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
    if(scan1 == 0xe0 || scan1 == 0xe1)
  805d4e:	80 7d fd e0          	cmp    BYTE PTR [rbp-0x3],0xe0
  805d52:	74 06                	je     805d5a <key_proc+0x42>
  805d54:	80 7d fd e1          	cmp    BYTE PTR [rbp-0x3],0xe1
  805d58:	75 1e                	jne    805d78 <key_proc+0x60>
    {
        ch= to_ascii(scan2);
  805d5a:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  805d5e:	0f be c0             	movsx  eax,al
  805d61:	89 c7                	mov    edi,eax
  805d63:	e8 a0 fe ff ff       	call   805c08 <to_ascii>
  805d68:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
        scan2=inb(0x60);
  805d6b:	bf 60 00 00 00       	mov    edi,0x60
  805d70:	e8 af eb ff ff       	call   804924 <inb>
  805d75:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    }
    tmpc.scan_code=scan1;
  805d78:	0f b6 45 fd          	movzx  eax,BYTE PTR [rbp-0x3]
  805d7c:	88 45 fa             	mov    BYTE PTR [rbp-0x6],al
    tmpc.scan_code2=scan2;
  805d7f:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  805d83:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
    tmpc.ascii= ch;
  805d86:	0f b6 45 fe          	movzx  eax,BYTE PTR [rbp-0x2]
  805d8a:	88 45 f8             	mov    BYTE PTR [rbp-0x8],al

    if(QTAIL(key_bufq)!=QHEAD(key_bufq))
  805d8d:	8b 15 29 40 00 00    	mov    edx,DWORD PTR [rip+0x4029]        # 809dbc <key_bufq+0xc>
  805d93:	8b 05 1f 40 00 00    	mov    eax,DWORD PTR [rip+0x401f]        # 809db8 <key_bufq+0x8>
  805d99:	39 c2                	cmp    edx,eax
  805d9b:	74 43                	je     805de0 <key_proc+0xc8>
    {
        ENQUEUE(key_bufq,tmpc)
  805d9d:	48 8b 0d 0c 40 00 00 	mov    rcx,QWORD PTR [rip+0x400c]        # 809db0 <key_bufq>
  805da4:	8b 05 12 40 00 00    	mov    eax,DWORD PTR [rip+0x4012]        # 809dbc <key_bufq+0xc>
  805daa:	48 63 d0             	movsxd rdx,eax
  805dad:	48 89 d0             	mov    rax,rdx
  805db0:	48 c1 e0 02          	shl    rax,0x2
  805db4:	48 01 d0             	add    rax,rdx
  805db7:	48 01 c8             	add    rax,rcx
  805dba:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805dbd:	89 10                	mov    DWORD PTR [rax],edx
  805dbf:	0f b6 55 fc          	movzx  edx,BYTE PTR [rbp-0x4]
  805dc3:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
  805dc6:	8b 05 f0 3f 00 00    	mov    eax,DWORD PTR [rip+0x3ff0]        # 809dbc <key_bufq+0xc>
  805dcc:	83 c0 01             	add    eax,0x1
  805dcf:	8b 0d eb 3f 00 00    	mov    ecx,DWORD PTR [rip+0x3feb]        # 809dc0 <key_bufq+0x10>
  805dd5:	99                   	cdq    
  805dd6:	f7 f9                	idiv   ecx
  805dd8:	89 d0                	mov    eax,edx
  805dda:	89 05 dc 3f 00 00    	mov    DWORD PTR [rip+0x3fdc],eax        # 809dbc <key_bufq+0xc>
        //logf("%x\n",stdin.w_ptr);
        //print_stdin();
        //printchar(ch);
        //flush_screen(0);
    }*/
    eoi();
  805de0:	b8 00 00 00 00       	mov    eax,0x0
  805de5:	e8 55 eb ff ff       	call   80493f <eoi>
    asm volatile("leave \r\n iret");
  805dea:	c9                   	leave  
  805deb:	cf                   	iret   
}
  805dec:	90                   	nop
  805ded:	c9                   	leave  
  805dee:	c3                   	ret    

0000000000805def <sys_getkbc>:

char sys_getkbc()
{
  805def:	f3 0f 1e fa          	endbr64 
  805df3:	55                   	push   rbp
  805df4:	48 89 e5             	mov    rbp,rsp
    if(key_bufq.tail==key_bufq.head)return -1;
  805df7:	8b 15 bf 3f 00 00    	mov    edx,DWORD PTR [rip+0x3fbf]        # 809dbc <key_bufq+0xc>
  805dfd:	8b 05 b5 3f 00 00    	mov    eax,DWORD PTR [rip+0x3fb5]        # 809db8 <key_bufq+0x8>
  805e03:	39 c2                	cmp    edx,eax
  805e05:	75 07                	jne    805e0e <sys_getkbc+0x1f>
  805e07:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805e0c:	eb 43                	jmp    805e51 <sys_getkbc+0x62>
    key_code c=key_buf[key_bufq.tail];
  805e0e:	8b 05 a8 3f 00 00    	mov    eax,DWORD PTR [rip+0x3fa8]        # 809dbc <key_bufq+0xc>
  805e14:	48 63 d0             	movsxd rdx,eax
  805e17:	48 89 d0             	mov    rax,rdx
  805e1a:	48 c1 e0 02          	shl    rax,0x2
  805e1e:	48 01 d0             	add    rax,rdx
  805e21:	48 05 00 51 42 00    	add    rax,0x425100
  805e27:	8b 10                	mov    edx,DWORD PTR [rax]
  805e29:	89 55 fb             	mov    DWORD PTR [rbp-0x5],edx
  805e2c:	0f b6 40 04          	movzx  eax,BYTE PTR [rax+0x4]
  805e30:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QTAIL(key_bufq)=(QTAIL(key_bufq)+1)%QSIZE(key_bufq);
  805e33:	8b 05 83 3f 00 00    	mov    eax,DWORD PTR [rip+0x3f83]        # 809dbc <key_bufq+0xc>
  805e39:	83 c0 01             	add    eax,0x1
  805e3c:	8b 0d 7e 3f 00 00    	mov    ecx,DWORD PTR [rip+0x3f7e]        # 809dc0 <key_bufq+0x10>
  805e42:	99                   	cdq    
  805e43:	f7 f9                	idiv   ecx
  805e45:	89 d0                	mov    eax,edx
  805e47:	89 05 6f 3f 00 00    	mov    DWORD PTR [rip+0x3f6f],eax        # 809dbc <key_bufq+0xc>
    return c.ascii;
  805e4d:	0f b6 45 fb          	movzx  eax,BYTE PTR [rbp-0x5]
  805e51:	5d                   	pop    rbp
  805e52:	c3                   	ret    

0000000000805e53 <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  805e53:	f3 0f 1e fa          	endbr64 
  805e57:	55                   	push   rbp
  805e58:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  805e5b:	b8 00 00 00 00       	mov    eax,0x0
  805e60:	e8 8d 09 00 00       	call   8067f2 <hd_iterate>
    return 0;
  805e65:	b8 00 00 00 00       	mov    eax,0x0
}
  805e6a:	5d                   	pop    rbp
  805e6b:	c3                   	ret    

0000000000805e6c <disk_int_handler_c>:

int disk_int_handler_c()
{
  805e6c:	f3 0f 1e fa          	endbr64 
  805e70:	55                   	push   rbp
  805e71:	48 89 e5             	mov    rbp,rsp
  805e74:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  805e78:	48 8b 05 a1 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc229a1]        # 428820 <running_req>
  805e7f:	48 85 c0             	test   rax,rax
  805e82:	75 0a                	jne    805e8e <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  805e84:	b8 01 00 00 00       	mov    eax,0x1
  805e89:	e9 a3 01 00 00       	jmp    806031 <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  805e8e:	48 8b 05 8b 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2298b]        # 428820 <running_req>
  805e95:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805e99:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  805e9d:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  805ea4:	48 8b 05 75 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22975]        # 428820 <running_req>
  805eab:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805eae:	83 f8 02             	cmp    eax,0x2
  805eb1:	74 0f                	je     805ec2 <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  805eb3:	48 8b 05 66 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22966]        # 428820 <running_req>
  805eba:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  805ebd:	83 f8 03             	cmp    eax,0x3
  805ec0:	75 07                	jne    805ec9 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  805ec2:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  805ec9:	48 8b 05 50 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22950]        # 428820 <running_req>
  805ed0:	8b 00                	mov    eax,DWORD PTR [rax]
  805ed2:	85 c0                	test   eax,eax
  805ed4:	75 42                	jne    805f18 <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  805ed6:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  805edd:	eb 22                	jmp    805f01 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  805edf:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805ee2:	0f b7 c0             	movzx  eax,ax
  805ee5:	89 c7                	mov    edi,eax
  805ee7:	e8 45 ea ff ff       	call   804931 <inw>
  805eec:	89 c2                	mov    edx,eax
  805eee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805ef2:	48 8d 48 02          	lea    rcx,[rax+0x2]
  805ef6:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  805efa:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  805efd:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  805f01:	48 8b 05 18 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22918]        # 428820 <running_req>
  805f08:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  805f0b:	c1 e0 08             	shl    eax,0x8
  805f0e:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  805f11:	7c cc                	jl     805edf <disk_int_handler_c+0x73>
  805f13:	e9 ca 00 00 00       	jmp    805fe2 <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  805f18:	48 8b 05 01 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22901]        # 428820 <running_req>
  805f1f:	8b 00                	mov    eax,DWORD PTR [rax]
  805f21:	83 f8 01             	cmp    eax,0x1
  805f24:	75 42                	jne    805f68 <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  805f26:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805f2d:	eb 25                	jmp    805f54 <disk_int_handler_c+0xe8>
            outw(port,*p++);
  805f2f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805f33:	48 8d 50 02          	lea    rdx,[rax+0x2]
  805f37:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  805f3b:	0f b7 00             	movzx  eax,WORD PTR [rax]
  805f3e:	0f b7 d0             	movzx  edx,ax
  805f41:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805f44:	0f b7 c0             	movzx  eax,ax
  805f47:	89 d6                	mov    esi,edx
  805f49:	89 c7                	mov    edi,eax
  805f4b:	e8 c2 e9 ff ff       	call   804912 <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  805f50:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805f54:	48 8b 05 c5 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc228c5]        # 428820 <running_req>
  805f5b:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  805f5e:	c1 e0 08             	shl    eax,0x8
  805f61:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805f64:	7c c9                	jl     805f2f <disk_int_handler_c+0xc3>
  805f66:	eb 7a                	jmp    805fe2 <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  805f68:	48 8b 05 b1 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc228b1]        # 428820 <running_req>
  805f6f:	8b 00                	mov    eax,DWORD PTR [rax]
  805f71:	83 f8 02             	cmp    eax,0x2
  805f74:	75 34                	jne    805faa <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  805f76:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805f79:	83 c0 07             	add    eax,0x7
  805f7c:	0f b6 c0             	movzx  eax,al
  805f7f:	89 c7                	mov    edi,eax
  805f81:	e8 9e e9 ff ff       	call   804924 <inb>
  805f86:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  805f89:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805f8c:	0f b7 c0             	movzx  eax,ax
  805f8f:	89 c7                	mov    edi,eax
  805f91:	e8 9b e9 ff ff       	call   804931 <inw>
  805f96:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  805f9a:	48 8b 05 7f 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2287f]        # 428820 <running_req>
  805fa1:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  805fa8:	eb 38                	jmp    805fe2 <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  805faa:	48 8b 05 6f 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2286f]        # 428820 <running_req>
  805fb1:	8b 00                	mov    eax,DWORD PTR [rax]
  805fb3:	83 f8 03             	cmp    eax,0x3
  805fb6:	75 2a                	jne    805fe2 <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  805fb8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805fbb:	83 c0 07             	add    eax,0x7
  805fbe:	0f b6 c0             	movzx  eax,al
  805fc1:	89 c7                	mov    edi,eax
  805fc3:	e8 5c e9 ff ff       	call   804924 <inb>
  805fc8:	0f b6 c0             	movzx  eax,al
  805fcb:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  805fce:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805fd1:	89 c6                	mov    esi,eax
  805fd3:	bf 76 1b 81 00       	mov    edi,0x811b76
  805fd8:	b8 00 00 00 00       	mov    eax,0x0
  805fdd:	e8 4a ad ff ff       	call   800d2c <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  805fe2:	48 8b 05 37 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22837]        # 428820 <running_req>
  805fe9:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  805ff0:	48 8b 05 29 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22829]        # 428820 <running_req>
  805ff7:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  805ffb:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  806002:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  806005:	48 8b 05 1c 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2281c]        # 428828 <running_devman_req>
  80600c:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  806013:	00 00 00 
    running_devman_req=NULL;
  806016:	48 c7 05 07 28 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22807],0x0        # 428828 <running_devman_req>
  80601d:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806021:	48 c7 05 f4 27 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc227f4],0x0        # 428820 <running_req>
  806028:	00 00 00 00 
    return 0;
  80602c:	b8 00 00 00 00       	mov    eax,0x0
}
  806031:	c9                   	leave  
  806032:	c3                   	ret    

0000000000806033 <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  806033:	f3 0f 1e fa          	endbr64 
  806037:	55                   	push   rbp
  806038:	48 89 e5             	mov    rbp,rsp
  80603b:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  80603e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806041:	48 63 d0             	movsxd rdx,eax
  806044:	48 89 d0             	mov    rax,rdx
  806047:	48 01 c0             	add    rax,rax
  80604a:	48 01 d0             	add    rax,rdx
  80604d:	48 c1 e0 04          	shl    rax,0x4
  806051:	48 05 3c 5b 42 00    	add    rax,0x425b3c
  806057:	8b 00                	mov    eax,DWORD PTR [rax]
}
  806059:	5d                   	pop    rbp
  80605a:	c3                   	ret    

000000000080605b <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  80605b:	f3 0f 1e fa          	endbr64 
  80605f:	55                   	push   rbp
  806060:	48 89 e5             	mov    rbp,rsp
  806063:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806066:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806069:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  80606c:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  80606f:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  806073:	8b 05 db 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc227db]        # 428854 <tail>
  806079:	83 c0 01             	add    eax,0x1
  80607c:	48 63 d0             	movsxd rdx,eax
  80607f:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  806086:	48 c1 ea 20          	shr    rdx,0x20
  80608a:	01 c2                	add    edx,eax
  80608c:	c1 fa 07             	sar    edx,0x7
  80608f:	89 c1                	mov    ecx,eax
  806091:	c1 f9 1f             	sar    ecx,0x1f
  806094:	29 ca                	sub    edx,ecx
  806096:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  80609c:	29 c8                	sub    eax,ecx
  80609e:	89 c2                	mov    edx,eax
  8060a0:	8b 05 aa 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc227aa]        # 428850 <head>
  8060a6:	39 c2                	cmp    edx,eax
  8060a8:	75 0a                	jne    8060b4 <request+0x59>
    {
        return -1;
  8060aa:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8060af:	e9 0d 01 00 00       	jmp    8061c1 <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  8060b4:	8b 05 9a 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2279a]        # 428854 <tail>
  8060ba:	48 63 d0             	movsxd rdx,eax
  8060bd:	48 89 d0             	mov    rax,rdx
  8060c0:	48 01 c0             	add    rax,rax
  8060c3:	48 01 d0             	add    rax,rdx
  8060c6:	48 c1 e0 04          	shl    rax,0x4
  8060ca:	48 8d 90 24 5b 42 00 	lea    rdx,[rax+0x425b24]
  8060d1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8060d4:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  8060d6:	8b 05 78 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22778]        # 428854 <tail>
  8060dc:	48 63 d0             	movsxd rdx,eax
  8060df:	48 89 d0             	mov    rax,rdx
  8060e2:	48 01 c0             	add    rax,rax
  8060e5:	48 01 d0             	add    rax,rdx
  8060e8:	48 c1 e0 04          	shl    rax,0x4
  8060ec:	48 8d 90 20 5b 42 00 	lea    rdx,[rax+0x425b20]
  8060f3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8060f6:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  8060f8:	8b 05 56 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22756]        # 428854 <tail>
  8060fe:	48 63 d0             	movsxd rdx,eax
  806101:	48 89 d0             	mov    rax,rdx
  806104:	48 01 c0             	add    rax,rax
  806107:	48 01 d0             	add    rax,rdx
  80610a:	48 c1 e0 04          	shl    rax,0x4
  80610e:	48 8d 90 28 5b 42 00 	lea    rdx,[rax+0x425b28]
  806115:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806118:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  80611a:	8b 05 34 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22734]        # 428854 <tail>
  806120:	48 63 d0             	movsxd rdx,eax
  806123:	48 89 d0             	mov    rax,rdx
  806126:	48 01 c0             	add    rax,rax
  806129:	48 01 d0             	add    rax,rdx
  80612c:	48 c1 e0 04          	shl    rax,0x4
  806130:	48 8d 90 2c 5b 42 00 	lea    rdx,[rax+0x425b2c]
  806137:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80613a:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  80613c:	8b 05 12 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22712]        # 428854 <tail>
  806142:	48 63 d0             	movsxd rdx,eax
  806145:	48 89 d0             	mov    rax,rdx
  806148:	48 01 c0             	add    rax,rax
  80614b:	48 01 d0             	add    rax,rdx
  80614e:	48 c1 e0 04          	shl    rax,0x4
  806152:	48 05 3c 5b 42 00    	add    rax,0x425b3c
  806158:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  80615e:	8b 05 f0 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc226f0]        # 428854 <tail>
  806164:	48 63 d0             	movsxd rdx,eax
  806167:	48 89 d0             	mov    rax,rdx
  80616a:	48 01 c0             	add    rax,rax
  80616d:	48 01 d0             	add    rax,rdx
  806170:	48 c1 e0 04          	shl    rax,0x4
  806174:	48 8d 90 30 5b 42 00 	lea    rdx,[rax+0x425b30]
  80617b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80617f:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  806182:	8b 05 cc 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc226cc]        # 428854 <tail>
  806188:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  80618b:	8b 05 c3 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc226c3]        # 428854 <tail>
  806191:	8d 50 01             	lea    edx,[rax+0x1]
  806194:	48 63 c2             	movsxd rax,edx
  806197:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  80619e:	48 c1 e8 20          	shr    rax,0x20
  8061a2:	01 d0                	add    eax,edx
  8061a4:	c1 f8 07             	sar    eax,0x7
  8061a7:	89 d1                	mov    ecx,edx
  8061a9:	c1 f9 1f             	sar    ecx,0x1f
  8061ac:	29 c8                	sub    eax,ecx
  8061ae:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8061b4:	89 d0                	mov    eax,edx
  8061b6:	29 c8                	sub    eax,ecx
  8061b8:	89 05 96 26 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc22696],eax        # 428854 <tail>
    return r;
  8061be:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8061c1:	5d                   	pop    rbp
  8061c2:	c3                   	ret    

00000000008061c3 <execute_request>:
int execute_request(){
  8061c3:	f3 0f 1e fa          	endbr64 
  8061c7:	55                   	push   rbp
  8061c8:	48 89 e5             	mov    rbp,rsp
  8061cb:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  8061cf:	48 8b 05 4a 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2264a]        # 428820 <running_req>
  8061d6:	48 85 c0             	test   rax,rax
  8061d9:	74 6a                	je     806245 <execute_request+0x82>
    {
        running_req->time++;
  8061db:	48 8b 05 3e 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2263e]        # 428820 <running_req>
  8061e2:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8061e5:	83 c2 01             	add    edx,0x1
  8061e8:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  8061eb:	48 8b 05 2e 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2262e]        # 428820 <running_req>
  8061f2:	8b 00                	mov    eax,DWORD PTR [rax]
  8061f4:	83 f8 02             	cmp    eax,0x2
  8061f7:	74 0a                	je     806203 <execute_request+0x40>
            return 2;
  8061f9:	b8 02 00 00 00       	mov    eax,0x2
  8061fe:	e9 b4 01 00 00       	jmp    8063b7 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  806203:	48 8b 05 16 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22616]        # 428820 <running_req>
  80620a:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80620d:	83 f8 0a             	cmp    eax,0xa
  806210:	7e 29                	jle    80623b <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  806212:	48 8b 05 07 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22607]        # 428820 <running_req>
  806219:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  806220:	48 8b 05 f9 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225f9]        # 428820 <running_req>
  806227:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  80622e:	48 c7 05 e7 25 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc225e7],0x0        # 428820 <running_req>
  806235:	00 00 00 00 
  806239:	eb 0a                	jmp    806245 <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  80623b:	b8 02 00 00 00       	mov    eax,0x2
  806240:	e9 72 01 00 00       	jmp    8063b7 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  806245:	8b 15 05 26 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc22605]        # 428850 <head>
  80624b:	8b 05 03 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22603]        # 428854 <tail>
  806251:	39 c2                	cmp    edx,eax
  806253:	75 0a                	jne    80625f <execute_request+0x9c>
  806255:	b8 01 00 00 00       	mov    eax,0x1
  80625a:	e9 58 01 00 00       	jmp    8063b7 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  80625f:	8b 05 eb 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc225eb]        # 428850 <head>
  806265:	48 63 d0             	movsxd rdx,eax
  806268:	48 89 d0             	mov    rax,rdx
  80626b:	48 01 c0             	add    rax,rax
  80626e:	48 01 d0             	add    rax,rdx
  806271:	48 c1 e0 04          	shl    rax,0x4
  806275:	48 05 20 5b 42 00    	add    rax,0x425b20
  80627b:	48 89 05 9e 25 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2259e],rax        # 428820 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  806282:	8b 05 c8 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc225c8]        # 428850 <head>
  806288:	8d 50 01             	lea    edx,[rax+0x1]
  80628b:	48 63 c2             	movsxd rax,edx
  80628e:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806295:	48 c1 e8 20          	shr    rax,0x20
  806299:	01 d0                	add    eax,edx
  80629b:	c1 f8 07             	sar    eax,0x7
  80629e:	89 d1                	mov    ecx,edx
  8062a0:	c1 f9 1f             	sar    ecx,0x1f
  8062a3:	29 c8                	sub    eax,ecx
  8062a5:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8062ab:	89 d0                	mov    eax,edx
  8062ad:	29 c8                	sub    eax,ecx
  8062af:	89 05 9b 25 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2259b],eax        # 428850 <head>
    running_req->stat=REQ_STAT_WORKING;
  8062b5:	48 8b 05 64 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22564]        # 428820 <running_req>
  8062bc:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  8062c3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  8062ca:	48 8b 05 4f 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2254f]        # 428820 <running_req>
  8062d1:	8b 00                	mov    eax,DWORD PTR [rax]
  8062d3:	83 f8 03             	cmp    eax,0x3
  8062d6:	0f 84 ad 00 00 00    	je     806389 <execute_request+0x1c6>
  8062dc:	83 f8 03             	cmp    eax,0x3
  8062df:	0f 8f bf 00 00 00    	jg     8063a4 <execute_request+0x1e1>
  8062e5:	83 f8 02             	cmp    eax,0x2
  8062e8:	0f 84 85 00 00 00    	je     806373 <execute_request+0x1b0>
  8062ee:	83 f8 02             	cmp    eax,0x2
  8062f1:	0f 8f ad 00 00 00    	jg     8063a4 <execute_request+0x1e1>
  8062f7:	85 c0                	test   eax,eax
  8062f9:	74 0a                	je     806305 <execute_request+0x142>
  8062fb:	83 f8 01             	cmp    eax,0x1
  8062fe:	74 3c                	je     80633c <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  806300:	e9 9f 00 00 00       	jmp    8063a4 <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  806305:	48 8b 05 14 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22514]        # 428820 <running_req>
        r=async_read_disk(running_req->disk,\
  80630c:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  806310:	48 8b 05 09 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22509]        # 428820 <running_req>
        r=async_read_disk(running_req->disk,\
  806317:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  80631a:	48 8b 05 ff 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224ff]        # 428820 <running_req>
  806321:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  806324:	89 c6                	mov    esi,eax
  806326:	48 8b 05 f3 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224f3]        # 428820 <running_req>
  80632d:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806330:	89 c7                	mov    edi,eax
  806332:	e8 a7 00 00 00       	call   8063de <async_read_disk>
  806337:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  80633a:	eb 69                	jmp    8063a5 <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  80633c:	48 8b 05 dd 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224dd]        # 428820 <running_req>
        r=async_write_disk(running_req->disk,\
  806343:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  806347:	48 8b 05 d2 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224d2]        # 428820 <running_req>
        r=async_write_disk(running_req->disk,\
  80634e:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  806351:	48 8b 05 c8 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224c8]        # 428820 <running_req>
  806358:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  80635b:	89 c6                	mov    esi,eax
  80635d:	48 8b 05 bc 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224bc]        # 428820 <running_req>
  806364:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806367:	89 c7                	mov    edi,eax
  806369:	e8 88 01 00 00       	call   8064f6 <async_write_disk>
  80636e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806371:	eb 32                	jmp    8063a5 <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  806373:	48 8b 05 a6 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224a6]        # 428820 <running_req>
  80637a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80637d:	89 c7                	mov    edi,eax
  80637f:	e8 77 06 00 00       	call   8069fb <async_check_disk>
  806384:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806387:	eb 1c                	jmp    8063a5 <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  806389:	48 8b 05 90 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22490]        # 428820 <running_req>
  806390:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806393:	89 c7                	mov    edi,eax
  806395:	b8 00 00 00 00       	mov    eax,0x0
  80639a:	e8 1a 00 00 00       	call   8063b9 <async_reset_disk>
  80639f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8063a2:	eb 01                	jmp    8063a5 <execute_request+0x1e2>
        break;
  8063a4:	90                   	nop
    }
    if(r==-1)return -1;
  8063a5:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8063a9:	75 07                	jne    8063b2 <execute_request+0x1ef>
  8063ab:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8063b0:	eb 05                	jmp    8063b7 <execute_request+0x1f4>
    return 0;
  8063b2:	b8 00 00 00 00       	mov    eax,0x0
}
  8063b7:	c9                   	leave  
  8063b8:	c3                   	ret    

00000000008063b9 <async_reset_disk>:
int async_reset_disk(int disk)
{
  8063b9:	f3 0f 1e fa          	endbr64 
  8063bd:	55                   	push   rbp
  8063be:	48 89 e5             	mov    rbp,rsp
  8063c1:	48 83 ec 10          	sub    rsp,0x10
  8063c5:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  8063c8:	be 0c 00 00 00       	mov    esi,0xc
  8063cd:	bf f6 03 00 00       	mov    edi,0x3f6
  8063d2:	e8 29 e5 ff ff       	call   804900 <outb>
    return 0;
  8063d7:	b8 00 00 00 00       	mov    eax,0x0
}
  8063dc:	c9                   	leave  
  8063dd:	c3                   	ret    

00000000008063de <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  8063de:	f3 0f 1e fa          	endbr64 
  8063e2:	55                   	push   rbp
  8063e3:	48 89 e5             	mov    rbp,rsp
  8063e6:	48 83 ec 30          	sub    rsp,0x30
  8063ea:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8063ed:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8063f0:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8063f3:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  8063f7:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  8063fd:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806404:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806408:	74 06                	je     806410 <async_read_disk+0x32>
  80640a:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80640e:	75 06                	jne    806416 <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  806410:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806416:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80641a:	74 06                	je     806422 <async_read_disk+0x44>
  80641c:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806420:	75 07                	jne    806429 <async_read_disk+0x4b>
        slave_disk=1;
  806422:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  806429:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80642c:	0f b6 d0             	movzx  edx,al
  80642f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806433:	83 c0 02             	add    eax,0x2
  806436:	0f b7 c0             	movzx  eax,ax
  806439:	89 d6                	mov    esi,edx
  80643b:	89 c7                	mov    edi,eax
  80643d:	e8 be e4 ff ff       	call   804900 <outb>
    outb(port+3,lba&0xff);
  806442:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806445:	0f b6 d0             	movzx  edx,al
  806448:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80644c:	83 c0 03             	add    eax,0x3
  80644f:	0f b7 c0             	movzx  eax,ax
  806452:	89 d6                	mov    esi,edx
  806454:	89 c7                	mov    edi,eax
  806456:	e8 a5 e4 ff ff       	call   804900 <outb>
    outb(port+4,(lba>>8)&0xff);
  80645b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80645e:	c1 e8 08             	shr    eax,0x8
  806461:	0f b6 d0             	movzx  edx,al
  806464:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806468:	83 c0 04             	add    eax,0x4
  80646b:	0f b7 c0             	movzx  eax,ax
  80646e:	89 d6                	mov    esi,edx
  806470:	89 c7                	mov    edi,eax
  806472:	e8 89 e4 ff ff       	call   804900 <outb>
    outb(port+5,(lba>>16)&0xff);
  806477:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80647a:	c1 e8 10             	shr    eax,0x10
  80647d:	0f b6 d0             	movzx  edx,al
  806480:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806484:	83 c0 05             	add    eax,0x5
  806487:	0f b7 c0             	movzx  eax,ax
  80648a:	89 d6                	mov    esi,edx
  80648c:	89 c7                	mov    edi,eax
  80648e:	e8 6d e4 ff ff       	call   804900 <outb>
    char drv=slave_disk?0x10:0;
  806493:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806497:	74 07                	je     8064a0 <async_read_disk+0xc2>
  806499:	b8 10 00 00 00       	mov    eax,0x10
  80649e:	eb 05                	jmp    8064a5 <async_read_disk+0xc7>
  8064a0:	b8 00 00 00 00       	mov    eax,0x0
  8064a5:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  8064a8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8064ab:	c1 e8 18             	shr    eax,0x18
  8064ae:	83 e0 0f             	and    eax,0xf
  8064b1:	89 c2                	mov    edx,eax
  8064b3:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  8064b7:	09 d0                	or     eax,edx
  8064b9:	83 c8 e0             	or     eax,0xffffffe0
  8064bc:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  8064bf:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  8064c3:	0f b6 d0             	movzx  edx,al
  8064c6:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8064ca:	83 c0 06             	add    eax,0x6
  8064cd:	0f b7 c0             	movzx  eax,ax
  8064d0:	89 d6                	mov    esi,edx
  8064d2:	89 c7                	mov    edi,eax
  8064d4:	e8 27 e4 ff ff       	call   804900 <outb>
    outb(port+7,DISK_CMD_READ);
  8064d9:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8064dd:	83 c0 07             	add    eax,0x7
  8064e0:	0f b7 c0             	movzx  eax,ax
  8064e3:	be 20 00 00 00       	mov    esi,0x20
  8064e8:	89 c7                	mov    edi,eax
  8064ea:	e8 11 e4 ff ff       	call   804900 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  8064ef:	b8 00 00 00 00       	mov    eax,0x0
}
  8064f4:	c9                   	leave  
  8064f5:	c3                   	ret    

00000000008064f6 <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  8064f6:	f3 0f 1e fa          	endbr64 
  8064fa:	55                   	push   rbp
  8064fb:	48 89 e5             	mov    rbp,rsp
  8064fe:	48 83 ec 30          	sub    rsp,0x30
  806502:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806505:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806508:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  80650b:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  80650f:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  806515:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80651c:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806520:	74 06                	je     806528 <async_write_disk+0x32>
  806522:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806526:	75 06                	jne    80652e <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  806528:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  80652e:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806532:	74 06                	je     80653a <async_write_disk+0x44>
  806534:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806538:	75 07                	jne    806541 <async_write_disk+0x4b>
        slave_disk=1;
  80653a:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  806541:	bf f7 00 00 00       	mov    edi,0xf7
  806546:	e8 d9 e3 ff ff       	call   804924 <inb>
  80654b:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  80654e:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  806552:	83 e0 01             	and    eax,0x1
  806555:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  806558:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  80655c:	74 0a                	je     806568 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  80655e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806563:	e9 d5 00 00 00       	jmp    80663d <async_write_disk+0x147>
        }
        t&=0x88;
  806568:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  80656c:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  806570:	74 02                	je     806574 <async_write_disk+0x7e>
    {
  806572:	eb cd                	jmp    806541 <async_write_disk+0x4b>
        if(t==0x8)break;
  806574:	90                   	nop
    }
    outb(port+2,sec_n);
  806575:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806578:	0f b6 d0             	movzx  edx,al
  80657b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80657f:	83 c0 02             	add    eax,0x2
  806582:	0f b7 c0             	movzx  eax,ax
  806585:	89 d6                	mov    esi,edx
  806587:	89 c7                	mov    edi,eax
  806589:	e8 72 e3 ff ff       	call   804900 <outb>
    outb(port+3,lba&0xff);
  80658e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806591:	0f b6 d0             	movzx  edx,al
  806594:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806598:	83 c0 03             	add    eax,0x3
  80659b:	0f b7 c0             	movzx  eax,ax
  80659e:	89 d6                	mov    esi,edx
  8065a0:	89 c7                	mov    edi,eax
  8065a2:	e8 59 e3 ff ff       	call   804900 <outb>
    outb(port+4,(lba>>8)&0xff);
  8065a7:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8065aa:	c1 e8 08             	shr    eax,0x8
  8065ad:	0f b6 d0             	movzx  edx,al
  8065b0:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8065b4:	83 c0 04             	add    eax,0x4
  8065b7:	0f b7 c0             	movzx  eax,ax
  8065ba:	89 d6                	mov    esi,edx
  8065bc:	89 c7                	mov    edi,eax
  8065be:	e8 3d e3 ff ff       	call   804900 <outb>
    outb(port+5,(lba>>16)&0xff);
  8065c3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8065c6:	c1 e8 10             	shr    eax,0x10
  8065c9:	0f b6 d0             	movzx  edx,al
  8065cc:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8065d0:	83 c0 05             	add    eax,0x5
  8065d3:	0f b7 c0             	movzx  eax,ax
  8065d6:	89 d6                	mov    esi,edx
  8065d8:	89 c7                	mov    edi,eax
  8065da:	e8 21 e3 ff ff       	call   804900 <outb>
    char drv=slave_disk?0x10:0;
  8065df:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  8065e3:	74 07                	je     8065ec <async_write_disk+0xf6>
  8065e5:	b8 10 00 00 00       	mov    eax,0x10
  8065ea:	eb 05                	jmp    8065f1 <async_write_disk+0xfb>
  8065ec:	b8 00 00 00 00       	mov    eax,0x0
  8065f1:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  8065f4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8065f7:	c1 e8 18             	shr    eax,0x18
  8065fa:	83 e0 0f             	and    eax,0xf
  8065fd:	89 c2                	mov    edx,eax
  8065ff:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  806603:	09 d0                	or     eax,edx
  806605:	83 c8 e0             	or     eax,0xffffffe0
  806608:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  80660b:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80660f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806613:	83 c0 06             	add    eax,0x6
  806616:	0f b7 c0             	movzx  eax,ax
  806619:	89 d6                	mov    esi,edx
  80661b:	89 c7                	mov    edi,eax
  80661d:	e8 de e2 ff ff       	call   804900 <outb>
    outb(port+7,DISK_CMD_WRITE);
  806622:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806626:	83 c0 07             	add    eax,0x7
  806629:	0f b7 c0             	movzx  eax,ax
  80662c:	be 30 00 00 00       	mov    esi,0x30
  806631:	89 c7                	mov    edi,eax
  806633:	e8 c8 e2 ff ff       	call   804900 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  806638:	b8 00 00 00 00       	mov    eax,0x0
}
  80663d:	c9                   	leave  
  80663e:	c3                   	ret    

000000000080663f <read_disk>:
int read_disk(driver_args* args)
{
  80663f:	f3 0f 1e fa          	endbr64 
  806643:	55                   	push   rbp
  806644:	48 89 e5             	mov    rbp,rsp
  806647:	48 83 ec 20          	sub    rsp,0x20
  80664b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  80664f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806653:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806656:	48 98                	cdqe   
  806658:	48 89 c2             	mov    rdx,rax
  80665b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80665f:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806662:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806666:	8b 00                	mov    eax,DWORD PTR [rax]
  806668:	89 ce                	mov    esi,ecx
  80666a:	89 c7                	mov    edi,eax
  80666c:	e8 7a 05 00 00       	call   806beb <read_disk_asm>
  806671:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  806674:	48 8b 05 a5 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc221a5]        # 428820 <running_req>
  80667b:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  806682:	48 8b 05 97 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22197]        # 428820 <running_req>
  806689:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  80668d:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  806694:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806697:	48 c7 05 7e 21 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2217e],0x0        # 428820 <running_req>
  80669e:	00 00 00 00 
    return ret;
  8066a2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8066a5:	c9                   	leave  
  8066a6:	c3                   	ret    

00000000008066a7 <write_disk>:
int write_disk(driver_args* args)
{
  8066a7:	f3 0f 1e fa          	endbr64 
  8066ab:	55                   	push   rbp
  8066ac:	48 89 e5             	mov    rbp,rsp
  8066af:	48 83 ec 20          	sub    rsp,0x20
  8066b3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  8066b7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8066bb:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8066be:	48 98                	cdqe   
  8066c0:	48 89 c2             	mov    rdx,rax
  8066c3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8066c7:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8066ca:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8066ce:	8b 00                	mov    eax,DWORD PTR [rax]
  8066d0:	89 ce                	mov    esi,ecx
  8066d2:	89 c7                	mov    edi,eax
  8066d4:	e8 92 05 00 00       	call   806c6b <write_disk_asm>
  8066d9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  8066dc:	48 8b 05 3d 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2213d]        # 428820 <running_req>
  8066e3:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8066ea:	48 8b 05 2f 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2212f]        # 428820 <running_req>
  8066f1:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8066f5:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8066fc:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8066ff:	48 c7 05 16 21 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22116],0x0        # 428820 <running_req>
  806706:	00 00 00 00 
    return ret;
  80670a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80670d:	c9                   	leave  
  80670e:	c3                   	ret    

000000000080670f <chk_result>:
int chk_result(int r)
{
  80670f:	f3 0f 1e fa          	endbr64 
  806713:	55                   	push   rbp
  806714:	48 89 e5             	mov    rbp,rsp
  806717:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  80671a:	90                   	nop
  80671b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80671e:	48 63 d0             	movsxd rdx,eax
  806721:	48 89 d0             	mov    rax,rdx
  806724:	48 01 c0             	add    rax,rax
  806727:	48 01 d0             	add    rax,rdx
  80672a:	48 c1 e0 04          	shl    rax,0x4
  80672e:	48 05 3c 5b 42 00    	add    rax,0x425b3c
  806734:	8b 00                	mov    eax,DWORD PTR [rax]
  806736:	83 f8 03             	cmp    eax,0x3
  806739:	75 e0                	jne    80671b <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  80673b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80673e:	48 63 d0             	movsxd rdx,eax
  806741:	48 89 d0             	mov    rax,rdx
  806744:	48 01 c0             	add    rax,rax
  806747:	48 01 d0             	add    rax,rdx
  80674a:	48 c1 e0 04          	shl    rax,0x4
  80674e:	48 05 40 5b 42 00    	add    rax,0x425b40
  806754:	8b 00                	mov    eax,DWORD PTR [rax]
  806756:	83 f8 01             	cmp    eax,0x1
  806759:	0f 94 c0             	sete   al
  80675c:	0f b6 c0             	movzx  eax,al
}
  80675f:	5d                   	pop    rbp
  806760:	c3                   	ret    

0000000000806761 <disk_existent>:
int disk_existent(int disk)
{
  806761:	f3 0f 1e fa          	endbr64 
  806765:	55                   	push   rbp
  806766:	48 89 e5             	mov    rbp,rsp
  806769:	48 83 ec 10          	sub    rsp,0x10
  80676d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  806770:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  806774:	74 5f                	je     8067d5 <disk_existent+0x74>
  806776:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  80677a:	7f 6e                	jg     8067ea <disk_existent+0x89>
  80677c:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  806780:	74 3e                	je     8067c0 <disk_existent+0x5f>
  806782:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  806786:	7f 62                	jg     8067ea <disk_existent+0x89>
  806788:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80678c:	74 08                	je     806796 <disk_existent+0x35>
  80678e:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  806792:	74 17                	je     8067ab <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  806794:	eb 54                	jmp    8067ea <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  806796:	bf 94 1b 81 00       	mov    edi,0x811b94
  80679b:	e8 99 c5 ff ff       	call   802d39 <sys_find_dev>
  8067a0:	83 f8 ff             	cmp    eax,0xffffffff
  8067a3:	0f 95 c0             	setne  al
  8067a6:	0f b6 c0             	movzx  eax,al
  8067a9:	eb 45                	jmp    8067f0 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  8067ab:	bf 98 1b 81 00       	mov    edi,0x811b98
  8067b0:	e8 84 c5 ff ff       	call   802d39 <sys_find_dev>
  8067b5:	83 f8 ff             	cmp    eax,0xffffffff
  8067b8:	0f 95 c0             	setne  al
  8067bb:	0f b6 c0             	movzx  eax,al
  8067be:	eb 30                	jmp    8067f0 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  8067c0:	bf 9c 1b 81 00       	mov    edi,0x811b9c
  8067c5:	e8 6f c5 ff ff       	call   802d39 <sys_find_dev>
  8067ca:	83 f8 ff             	cmp    eax,0xffffffff
  8067cd:	0f 95 c0             	setne  al
  8067d0:	0f b6 c0             	movzx  eax,al
  8067d3:	eb 1b                	jmp    8067f0 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  8067d5:	bf a0 1b 81 00       	mov    edi,0x811ba0
  8067da:	e8 5a c5 ff ff       	call   802d39 <sys_find_dev>
  8067df:	83 f8 ff             	cmp    eax,0xffffffff
  8067e2:	0f 95 c0             	setne  al
  8067e5:	0f b6 c0             	movzx  eax,al
  8067e8:	eb 06                	jmp    8067f0 <disk_existent+0x8f>
        break;
  8067ea:	90                   	nop
    }
    return 0;
  8067eb:	b8 00 00 00 00       	mov    eax,0x0
}
  8067f0:	c9                   	leave  
  8067f1:	c3                   	ret    

00000000008067f2 <hd_iterate>:
int hd_iterate()
{
  8067f2:	f3 0f 1e fa          	endbr64 
  8067f6:	55                   	push   rbp
  8067f7:	48 89 e5             	mov    rbp,rsp
  8067fa:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  806801:	41 b8 00 00 00 00    	mov    r8d,0x0
  806807:	b9 01 00 00 00       	mov    ecx,0x1
  80680c:	ba 00 00 00 00       	mov    edx,0x0
  806811:	be 02 00 00 00       	mov    esi,0x2
  806816:	bf 00 00 00 00       	mov    edi,0x0
  80681b:	e8 3b f8 ff ff       	call   80605b <request>
  806820:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  806823:	41 b8 00 00 00 00    	mov    r8d,0x0
  806829:	b9 01 00 00 00       	mov    ecx,0x1
  80682e:	ba 00 00 00 00       	mov    edx,0x0
  806833:	be 02 00 00 00       	mov    esi,0x2
  806838:	bf 01 00 00 00       	mov    edi,0x1
  80683d:	e8 19 f8 ff ff       	call   80605b <request>
  806842:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  806845:	41 b8 00 00 00 00    	mov    r8d,0x0
  80684b:	b9 01 00 00 00       	mov    ecx,0x1
  806850:	ba 00 00 00 00       	mov    edx,0x0
  806855:	be 02 00 00 00       	mov    esi,0x2
  80685a:	bf 02 00 00 00       	mov    edi,0x2
  80685f:	e8 f7 f7 ff ff       	call   80605b <request>
  806864:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  806867:	41 b8 00 00 00 00    	mov    r8d,0x0
  80686d:	b9 01 00 00 00       	mov    ecx,0x1
  806872:	ba 00 00 00 00       	mov    edx,0x0
  806877:	be 02 00 00 00       	mov    esi,0x2
  80687c:	bf 03 00 00 00       	mov    edi,0x3
  806881:	e8 d5 f7 ff ff       	call   80605b <request>
  806886:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<4;i++)
  806889:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806890:	e9 5a 01 00 00       	jmp    8069ef <hd_iterate+0x1fd>
    {
        int disk;
        switch (i)
  806895:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806899:	74 3b                	je     8068d6 <hd_iterate+0xe4>
  80689b:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80689f:	7f 3e                	jg     8068df <hd_iterate+0xed>
  8068a1:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8068a5:	74 26                	je     8068cd <hd_iterate+0xdb>
  8068a7:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8068ab:	7f 32                	jg     8068df <hd_iterate+0xed>
  8068ad:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8068b1:	74 08                	je     8068bb <hd_iterate+0xc9>
  8068b3:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8068b7:	74 0b                	je     8068c4 <hd_iterate+0xd2>
  8068b9:	eb 24                	jmp    8068df <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  8068bb:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8068c2:	eb 25                	jmp    8068e9 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  8068c4:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  8068cb:	eb 1c                	jmp    8068e9 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  8068cd:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  8068d4:	eb 13                	jmp    8068e9 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  8068d6:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  8068dd:	eb 0a                	jmp    8068e9 <hd_iterate+0xf7>
        default:
            return -1;
  8068df:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8068e4:	e9 10 01 00 00       	jmp    8069f9 <hd_iterate+0x207>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  8068e9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8068ec:	48 98                	cdqe   
  8068ee:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  8068f2:	89 c7                	mov    edi,eax
  8068f4:	e8 16 fe ff ff       	call   80670f <chk_result>
  8068f9:	85 c0                	test   eax,eax
  8068fb:	74 6d                	je     80696a <hd_iterate+0x178>
        {
            //新硬盘
            device hd={
  8068fd:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  806904:	b8 00 00 00 00       	mov    eax,0x0
  806909:	b9 15 00 00 00       	mov    ecx,0x15
  80690e:	48 89 d7             	mov    rdi,rdx
  806911:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  806914:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806917:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  80691d:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  806924:	00 00 00 
  806927:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  80692e:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  806931:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  806935:	7f 07                	jg     80693e <hd_iterate+0x14c>
  806937:	b8 f0 01 00 00       	mov    eax,0x1f0
  80693c:	eb 05                	jmp    806943 <hd_iterate+0x151>
  80693e:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  806943:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  806949:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  806950:	48 89 c7             	mov    rdi,rax
  806953:	e8 a9 bf ff ff       	call   802901 <reg_device>
  806958:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80695b:	48 63 d2             	movsxd rdx,edx
  80695e:	89 04 95 40 88 42 00 	mov    DWORD PTR [rdx*4+0x428840],eax
  806965:	e9 81 00 00 00       	jmp    8069eb <hd_iterate+0x1f9>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  80696a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80696d:	48 98                	cdqe   
  80696f:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  806973:	89 c7                	mov    edi,eax
  806975:	e8 95 fd ff ff       	call   80670f <chk_result>
  80697a:	85 c0                	test   eax,eax
  80697c:	75 6d                	jne    8069eb <hd_iterate+0x1f9>
        {
            switch (i)
  80697e:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806982:	74 3e                	je     8069c2 <hd_iterate+0x1d0>
  806984:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806988:	7f 41                	jg     8069cb <hd_iterate+0x1d9>
  80698a:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80698e:	74 28                	je     8069b8 <hd_iterate+0x1c6>
  806990:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806994:	7f 35                	jg     8069cb <hd_iterate+0x1d9>
  806996:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80699a:	74 08                	je     8069a4 <hd_iterate+0x1b2>
  80699c:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8069a0:	74 0c                	je     8069ae <hd_iterate+0x1bc>
  8069a2:	eb 27                	jmp    8069cb <hd_iterate+0x1d9>
            {
            case 0:name="hd0";break;
  8069a4:	48 c7 45 f8 94 1b 81 	mov    QWORD PTR [rbp-0x8],0x811b94
  8069ab:	00 
  8069ac:	eb 1d                	jmp    8069cb <hd_iterate+0x1d9>
            case 1:name="hd1";break;
  8069ae:	48 c7 45 f8 98 1b 81 	mov    QWORD PTR [rbp-0x8],0x811b98
  8069b5:	00 
  8069b6:	eb 13                	jmp    8069cb <hd_iterate+0x1d9>
            case 2:name="hd2";break;
  8069b8:	48 c7 45 f8 9c 1b 81 	mov    QWORD PTR [rbp-0x8],0x811b9c
  8069bf:	00 
  8069c0:	eb 09                	jmp    8069cb <hd_iterate+0x1d9>
            case 3:name="hd3";break;
  8069c2:	48 c7 45 f8 a0 1b 81 	mov    QWORD PTR [rbp-0x8],0x811ba0
  8069c9:	00 
  8069ca:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  8069cb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8069cf:	48 89 c7             	mov    rdi,rax
  8069d2:	e8 62 c3 ff ff       	call   802d39 <sys_find_dev>
  8069d7:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  8069da:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8069dd:	89 c7                	mov    edi,eax
  8069df:	e8 29 ca ff ff       	call   80340d <get_dev>
  8069e4:	89 c7                	mov    edi,eax
  8069e6:	e8 75 c9 ff ff       	call   803360 <dispose_device>
    for(int i=0;i<4;i++)
  8069eb:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8069ef:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8069f3:	0f 8e 9c fe ff ff    	jle    806895 <hd_iterate+0xa3>
        }

    }
}
  8069f9:	c9                   	leave  
  8069fa:	c3                   	ret    

00000000008069fb <async_check_disk>:

int async_check_disk(int disk)
{
  8069fb:	f3 0f 1e fa          	endbr64 
  8069ff:	55                   	push   rbp
  806a00:	48 89 e5             	mov    rbp,rsp
  806a03:	48 83 ec 20          	sub    rsp,0x20
  806a07:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  806a0a:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  806a10:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806a16:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806a1a:	74 06                	je     806a22 <async_check_disk+0x27>
  806a1c:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806a20:	75 06                	jne    806a28 <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  806a22:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  806a28:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806a2c:	74 06                	je     806a34 <async_check_disk+0x39>
  806a2e:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806a32:	75 06                	jne    806a3a <async_check_disk+0x3f>
        chkcmd=0xf0;
  806a34:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  806a3a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806a3e:	83 c0 02             	add    eax,0x2
  806a41:	0f b7 c0             	movzx  eax,ax
  806a44:	be 01 00 00 00       	mov    esi,0x1
  806a49:	89 c7                	mov    edi,eax
  806a4b:	e8 b0 de ff ff       	call   804900 <outb>
    outb(disknr+3,0);
  806a50:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806a54:	83 c0 03             	add    eax,0x3
  806a57:	0f b7 c0             	movzx  eax,ax
  806a5a:	be 00 00 00 00       	mov    esi,0x0
  806a5f:	89 c7                	mov    edi,eax
  806a61:	e8 9a de ff ff       	call   804900 <outb>
    outb(disknr+4,0);
  806a66:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806a6a:	83 c0 04             	add    eax,0x4
  806a6d:	0f b7 c0             	movzx  eax,ax
  806a70:	be 00 00 00 00       	mov    esi,0x0
  806a75:	89 c7                	mov    edi,eax
  806a77:	e8 84 de ff ff       	call   804900 <outb>
    outb(disknr+5,0);
  806a7c:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806a80:	83 c0 05             	add    eax,0x5
  806a83:	0f b7 c0             	movzx  eax,ax
  806a86:	be 00 00 00 00       	mov    esi,0x0
  806a8b:	89 c7                	mov    edi,eax
  806a8d:	e8 6e de ff ff       	call   804900 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  806a92:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  806a96:	0f b6 d0             	movzx  edx,al
  806a99:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806a9d:	83 c0 06             	add    eax,0x6
  806aa0:	0f b7 c0             	movzx  eax,ax
  806aa3:	89 d6                	mov    esi,edx
  806aa5:	89 c7                	mov    edi,eax
  806aa7:	e8 54 de ff ff       	call   804900 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  806aac:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806ab0:	83 c0 07             	add    eax,0x7
  806ab3:	0f b7 c0             	movzx  eax,ax
  806ab6:	be 90 00 00 00       	mov    esi,0x90
  806abb:	89 c7                	mov    edi,eax
  806abd:	e8 3e de ff ff       	call   804900 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  806ac2:	b8 00 00 00 00       	mov    eax,0x0
}
  806ac7:	c9                   	leave  
  806ac8:	c3                   	ret    

0000000000806ac9 <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  806ac9:	f3 0f 1e fa          	endbr64 
  806acd:	55                   	push   rbp
  806ace:	48 89 e5             	mov    rbp,rsp
  806ad1:	48 83 ec 18          	sub    rsp,0x18
  806ad5:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  806ad9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  806ae0:	eb 04                	jmp    806ae6 <hd_do_req+0x1d>
  806ae2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806ae6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806ae9:	48 98                	cdqe   
  806aeb:	8b 14 85 40 88 42 00 	mov    edx,DWORD PTR [rax*4+0x428840]
  806af2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806af6:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  806afc:	39 c2                	cmp    edx,eax
  806afe:	75 e2                	jne    806ae2 <hd_do_req+0x19>
    switch (args->cmd)
  806b00:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b04:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  806b0a:	83 f8 04             	cmp    eax,0x4
  806b0d:	74 72                	je     806b81 <hd_do_req+0xb8>
  806b0f:	83 f8 04             	cmp    eax,0x4
  806b12:	0f 8f 96 00 00 00    	jg     806bae <hd_do_req+0xe5>
  806b18:	83 f8 02             	cmp    eax,0x2
  806b1b:	74 0a                	je     806b27 <hd_do_req+0x5e>
  806b1d:	83 f8 03             	cmp    eax,0x3
  806b20:	74 32                	je     806b54 <hd_do_req+0x8b>
  806b22:	e9 87 00 00 00       	jmp    806bae <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  806b27:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b2b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806b2e:	48 98                	cdqe   
  806b30:	48 89 c6             	mov    rsi,rax
  806b33:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b37:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806b3a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b3e:	8b 10                	mov    edx,DWORD PTR [rax]
  806b40:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806b43:	49 89 f0             	mov    r8,rsi
  806b46:	be 00 00 00 00       	mov    esi,0x0
  806b4b:	89 c7                	mov    edi,eax
  806b4d:	e8 09 f5 ff ff       	call   80605b <request>
        break;
  806b52:	eb 61                	jmp    806bb5 <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  806b54:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b58:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806b5b:	48 98                	cdqe   
  806b5d:	48 89 c6             	mov    rsi,rax
  806b60:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b64:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806b67:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b6b:	8b 10                	mov    edx,DWORD PTR [rax]
  806b6d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806b70:	49 89 f0             	mov    r8,rsi
  806b73:	be 01 00 00 00       	mov    esi,0x1
  806b78:	89 c7                	mov    edi,eax
  806b7a:	e8 dc f4 ff ff       	call   80605b <request>
        break;
  806b7f:	eb 34                	jmp    806bb5 <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  806b81:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b85:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806b88:	48 98                	cdqe   
  806b8a:	48 89 c6             	mov    rsi,rax
  806b8d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b91:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806b94:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806b98:	8b 10                	mov    edx,DWORD PTR [rax]
  806b9a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806b9d:	49 89 f0             	mov    r8,rsi
  806ba0:	be 02 00 00 00       	mov    esi,0x2
  806ba5:	89 c7                	mov    edi,eax
  806ba7:	e8 af f4 ff ff       	call   80605b <request>
        break;
  806bac:	eb 07                	jmp    806bb5 <hd_do_req+0xec>
    default:return -1;
  806bae:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806bb3:	eb 1e                	jmp    806bd3 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  806bb5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806bb9:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  806bc0:	00 00 00 
    running_devman_req=args;
  806bc3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806bc7:	48 89 05 5a 1c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21c5a],rax        # 428828 <running_devman_req>
    return 0;
  806bce:	b8 00 00 00 00       	mov    eax,0x0
  806bd3:	c9                   	leave  
  806bd4:	c3                   	ret    
  806bd5:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  806bdc:	00 00 00 
  806bdf:	90                   	nop

0000000000806be0 <disk_int_handler>:
  806be0:	e8 5a dd ff ff       	call   80493f <eoi>
  806be5:	e8 82 f2 ff ff       	call   805e6c <disk_int_handler_c>
  806bea:	cf                   	iret   

0000000000806beb <read_disk_asm>:
  806beb:	55                   	push   rbp
  806bec:	89 e5                	mov    ebp,esp
  806bee:	66 ba f7 01          	mov    dx,0x1f7
  806bf2:	31 c9                	xor    ecx,ecx
  806bf4:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  806bf9:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  806bfe:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  806c03:	89 c6                	mov    esi,eax
  806c05:	66 ba f2 01          	mov    dx,0x1f2
  806c09:	88 c8                	mov    al,cl
  806c0b:	ee                   	out    dx,al
  806c0c:	66 ba f3 01          	mov    dx,0x1f3
  806c10:	89 f0                	mov    eax,esi
  806c12:	ee                   	out    dx,al
  806c13:	66 ff c2             	inc    dx
  806c16:	c1 e8 08             	shr    eax,0x8
  806c19:	ee                   	out    dx,al
  806c1a:	66 ff c2             	inc    dx
  806c1d:	c1 e8 08             	shr    eax,0x8
  806c20:	ee                   	out    dx,al
  806c21:	66 ff c2             	inc    dx
  806c24:	66 c1 e8 08          	shr    ax,0x8
  806c28:	24 0f                	and    al,0xf
  806c2a:	0c e0                	or     al,0xe0
  806c2c:	ee                   	out    dx,al
  806c2d:	66 ff c2             	inc    dx
  806c30:	b0 20                	mov    al,0x20
  806c32:	ee                   	out    dx,al

0000000000806c33 <read_disk_asm.wait>:
  806c33:	90                   	nop
  806c34:	ec                   	in     al,dx
  806c35:	24 88                	and    al,0x88
  806c37:	3c 08                	cmp    al,0x8
  806c39:	75 f8                	jne    806c33 <read_disk_asm.wait>
  806c3b:	66 89 d7             	mov    di,dx
  806c3e:	89 c8                	mov    eax,ecx
  806c40:	66 b9 00 01          	mov    cx,0x100
  806c44:	66 f7 e1             	mul    cx
  806c47:	89 c1                	mov    ecx,eax
  806c49:	66 ba f0 01          	mov    dx,0x1f0

0000000000806c4d <read_disk_asm.read>:
  806c4d:	66 ed                	in     ax,dx
  806c4f:	66 67 89 03          	mov    WORD PTR [ebx],ax
  806c53:	83 c3 02             	add    ebx,0x2
  806c56:	e2 f5                	loop   806c4d <read_disk_asm.read>
  806c58:	c9                   	leave  
  806c59:	b8 00 00 00 00       	mov    eax,0x0
  806c5e:	c3                   	ret    

0000000000806c5f <read_disk_asm.err_disk_reading>:
  806c5f:	66 ba f1 01          	mov    dx,0x1f1
  806c63:	31 c0                	xor    eax,eax
  806c65:	66 ed                	in     ax,dx
  806c67:	89 ec                	mov    esp,ebp
  806c69:	5d                   	pop    rbp
  806c6a:	c3                   	ret    

0000000000806c6b <write_disk_asm>:
  806c6b:	55                   	push   rbp
  806c6c:	89 e5                	mov    ebp,esp
  806c6e:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  806c73:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  806c78:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  806c7d:	50                   	push   rax
  806c7e:	66 ba f2 01          	mov    dx,0x1f2
  806c82:	88 c8                	mov    al,cl
  806c84:	ee                   	out    dx,al
  806c85:	58                   	pop    rax
  806c86:	66 ba f3 01          	mov    dx,0x1f3
  806c8a:	ee                   	out    dx,al
  806c8b:	c1 e8 08             	shr    eax,0x8
  806c8e:	66 ba f4 01          	mov    dx,0x1f4
  806c92:	ee                   	out    dx,al
  806c93:	c1 e8 08             	shr    eax,0x8
  806c96:	66 ba f5 01          	mov    dx,0x1f5
  806c9a:	ee                   	out    dx,al
  806c9b:	c1 e8 08             	shr    eax,0x8
  806c9e:	24 0f                	and    al,0xf
  806ca0:	0c e0                	or     al,0xe0
  806ca2:	66 ba f6 01          	mov    dx,0x1f6
  806ca6:	ee                   	out    dx,al
  806ca7:	66 ba f7 01          	mov    dx,0x1f7
  806cab:	b0 30                	mov    al,0x30
  806cad:	ee                   	out    dx,al

0000000000806cae <write_disk_asm.not_ready2>:
  806cae:	90                   	nop
  806caf:	ec                   	in     al,dx
  806cb0:	24 88                	and    al,0x88
  806cb2:	3c 08                	cmp    al,0x8
  806cb4:	75 f8                	jne    806cae <write_disk_asm.not_ready2>
  806cb6:	89 c8                	mov    eax,ecx
  806cb8:	66 b9 00 01          	mov    cx,0x100
  806cbc:	66 f7 e1             	mul    cx
  806cbf:	89 c1                	mov    ecx,eax
  806cc1:	66 ba f0 01          	mov    dx,0x1f0

0000000000806cc5 <write_disk_asm.go_on_write>:
  806cc5:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  806cc9:	66 ef                	out    dx,ax
  806ccb:	83 c3 02             	add    ebx,0x2
  806cce:	e2 f5                	loop   806cc5 <write_disk_asm.go_on_write>
  806cd0:	89 ec                	mov    esp,ebp
  806cd2:	5d                   	pop    rbp
  806cd3:	c3                   	ret    

0000000000806cd4 <init_fat16>:

int fat16_drvi;
extern driver drv_disk;
extern int disk_drvi;
int init_fat16()
{
  806cd4:	f3 0f 1e fa          	endbr64 
  806cd8:	55                   	push   rbp
  806cd9:	48 89 e5             	mov    rbp,rsp
  806cdc:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
    reg_device(&fat16_dev);
  806ce3:	bf 60 1c 81 00       	mov    edi,0x811c60
  806ce8:	e8 14 bc ff ff       	call   802901 <reg_device>
    fat16_drvi=reg_driver(&fat16_drv);
  806ced:	bf c0 1b 81 00       	mov    edi,0x811bc0
  806cf2:	e8 f2 be ff ff       	call   802be9 <reg_driver>
  806cf7:	89 05 c7 9d c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29dc7],eax        # 430ac4 <fat16_drvi>
    driver_args arg;
    load(&arg);//syscall(SYSCALL_CALL_DRVFUNC,fat16_drvi,DRVF_OPEN,&arg,0,0);
  806cfd:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  806d04:	48 89 c7             	mov    rdi,rax
  806d07:	e8 26 00 00 00       	call   806d32 <load>
    reg_vol(disk_drvi,fat16_drvi,"a");
  806d0c:	8b 0d b2 9d c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc29db2]        # 430ac4 <fat16_drvi>
  806d12:	8b 05 18 1b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21b18]        # 428830 <disk_drvi>
  806d18:	ba 08 1d 81 00       	mov    edx,0x811d08
  806d1d:	89 ce                	mov    esi,ecx
  806d1f:	89 c7                	mov    edi,eax
  806d21:	b8 00 00 00 00       	mov    eax,0x0
  806d26:	e8 5e ab ff ff       	call   801889 <reg_vol>
    return 0;
  806d2b:	b8 00 00 00 00       	mov    eax,0x0
}
  806d30:	c9                   	leave  
  806d31:	c3                   	ret    

0000000000806d32 <load>:
int load(driver_args *args)
{
  806d32:	f3 0f 1e fa          	endbr64 
  806d36:	55                   	push   rbp
  806d37:	48 89 e5             	mov    rbp,rsp
  806d3a:	48 83 ec 20          	sub    rsp,0x20
  806d3e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    //sys_read superblock
    int req_id=-1;
  806d42:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    read_sec(&superblock,0,1);
  806d49:	ba 01 00 00 00       	mov    edx,0x1
  806d4e:	be 00 00 00 00       	mov    esi,0x0
  806d53:	bf 60 88 42 00       	mov    edi,0x428860
  806d58:	e8 61 0b 00 00       	call   8078be <read_sec>
    //只能一个一个读
    read_sec(fat,superblock.rsvdSec,superblock.secPerFAT);
  806d5d:	0f b7 05 12 1b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21b12]        # 428876 <superblock+0x16>
  806d64:	0f b7 d0             	movzx  edx,ax
  806d67:	0f b7 05 00 1b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21b00]        # 42886e <superblock+0xe>
  806d6e:	0f b7 c0             	movzx  eax,ax
  806d71:	89 c6                	mov    esi,eax
  806d73:	bf c0 ca 42 00       	mov    edi,0x42cac0
  806d78:	e8 41 0b 00 00       	call   8078be <read_sec>

    //sys_read root
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  806d7d:	0f b7 05 ea 1a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21aea]        # 42886e <superblock+0xe>
  806d84:	0f b7 c8             	movzx  ecx,ax
  806d87:	0f b7 05 e8 1a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21ae8]        # 428876 <superblock+0x16>
  806d8e:	0f b7 d0             	movzx  edx,ax
    superblock.numOfFAT;
  806d91:	0f b6 05 d8 1a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21ad8]        # 428870 <superblock+0x10>
  806d98:	0f b6 c0             	movzx  eax,al
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  806d9b:	0f af c2             	imul   eax,edx
  806d9e:	01 c8                	add    eax,ecx
  806da0:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //printf("root sec num:%d\n",root_sec_num);
    //usually a root dir has 32 secs
    int root_sec_c=((u32)superblock.rootEntries* sizeof(dir_entry))/(u32)superblock.bytesPerSec;
  806da3:	0f b7 05 c7 1a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21ac7]        # 428871 <superblock+0x11>
  806daa:	0f b7 c0             	movzx  eax,ax
  806dad:	48 c1 e0 05          	shl    rax,0x5
  806db1:	0f b7 15 b3 1a c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc21ab3]        # 42886b <superblock+0xb>
  806db8:	0f b7 ca             	movzx  ecx,dx
  806dbb:	ba 00 00 00 00       	mov    edx,0x0
  806dc0:	48 f7 f1             	div    rcx
  806dc3:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    read_sec(root_dir,root_sec_num,root_sec_c);
  806dc6:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  806dc9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806dcc:	89 c6                	mov    esi,eax
  806dce:	bf a0 88 42 00       	mov    edi,0x4288a0
  806dd3:	e8 e6 0a 00 00       	call   8078be <read_sec>

    cur_dir.fistCluNum=0;
  806dd8:	66 c7 05 d9 5a c2 ff 	mov    WORD PTR [rip+0xffffffffffc25ad9],0x0        # 42c8ba <cur_dir+0x1a>
  806ddf:	00 00 

    //set some vars
    //why? because the .bss won't be packed into bin so any init
    //of global var in .c is meaningless.
    clu_sec_balance=superblock.rsvdSec+32+32-2;//63;
  806de1:	0f b7 05 86 1a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21a86]        # 42886e <superblock+0xe>
  806de8:	0f b7 c0             	movzx  eax,ax
  806deb:	83 c0 3e             	add    eax,0x3e
  806dee:	89 05 4c 31 00 00    	mov    DWORD PTR [rip+0x314c],eax        # 809f40 <clu_sec_balance>
    //printf("clu sec bal:%d\n",clu_sec_balance);
    dir_depth=0;
  806df4:	c7 05 c2 9c c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29cc2],0x0        # 430ac0 <dir_depth>
  806dfb:	00 00 00 
    return 0;
  806dfe:	b8 00 00 00 00       	mov    eax,0x0

}
  806e03:	c9                   	leave  
  806e04:	c3                   	ret    

0000000000806e05 <verify_name>:

//检查输入的文件名长度是否合法，以及是否出现非法字符（但是不检查大小写和.）
//返回值为布尔值。
int verify_name(char *str)
{
  806e05:	f3 0f 1e fa          	endbr64 
  806e09:	55                   	push   rbp
  806e0a:	48 89 e5             	mov    rbp,rsp
  806e0d:	48 83 ec 70          	sub    rsp,0x70
  806e11:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
    char valid_ch[]="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,/![]|+";
  806e15:	48 b8 61 62 63 64 65 	movabs rax,0x6867666564636261
  806e1c:	66 67 68 
  806e1f:	48 ba 69 6a 6b 6c 6d 	movabs rdx,0x706f6e6d6c6b6a69
  806e26:	6e 6f 70 
  806e29:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  806e2d:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  806e31:	48 b8 71 72 73 74 75 	movabs rax,0x7877767574737271
  806e38:	76 77 78 
  806e3b:	48 ba 79 7a 41 42 43 	movabs rdx,0x4645444342417a79
  806e42:	44 45 46 
  806e45:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  806e49:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  806e4d:	48 b8 47 48 49 4a 4b 	movabs rax,0x4e4d4c4b4a494847
  806e54:	4c 4d 4e 
  806e57:	48 ba 4f 50 51 52 53 	movabs rdx,0x565554535251504f
  806e5e:	54 55 56 
  806e61:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  806e65:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  806e69:	48 b8 57 58 59 5a 30 	movabs rax,0x333231305a595857
  806e70:	31 32 33 
  806e73:	48 ba 34 35 36 37 38 	movabs rdx,0x2f2c393837363534
  806e7a:	39 2c 2f 
  806e7d:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  806e81:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  806e85:	c7 45 e0 21 5b 5d 7c 	mov    DWORD PTR [rbp-0x20],0x7c5d5b21
  806e8c:	66 c7 45 e4 2b 00    	mov    WORD PTR [rbp-0x1c],0x2b
    if(strlen(str)>11||strlen(str)==0) {
  806e92:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806e96:	48 89 c7             	mov    rdi,rax
  806e99:	e8 24 28 00 00       	call   8096c2 <strlen>
  806e9e:	83 f8 0b             	cmp    eax,0xb
  806ea1:	7f 10                	jg     806eb3 <verify_name+0xae>
  806ea3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806ea7:	48 89 c7             	mov    rdi,rax
  806eaa:	e8 13 28 00 00       	call   8096c2 <strlen>
  806eaf:	85 c0                	test   eax,eax
  806eb1:	75 0a                	jne    806ebd <verify_name+0xb8>
        //printf("length not valid\n");
        return 0;
  806eb3:	b8 00 00 00 00       	mov    eax,0x0
  806eb8:	e9 b3 01 00 00       	jmp    807070 <verify_name+0x26b>
    }
    int c=0,i=0,flag=0,vchf=1;
  806ebd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806ec4:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806ecb:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806ed2:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [rbp-0x18],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  806ed9:	eb 6b                	jmp    806f46 <verify_name+0x141>
    {
        int j=0;
  806edb:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        for(;j<sizeof(valid_ch);j++)
  806ee2:	eb 22                	jmp    806f06 <verify_name+0x101>
            if(str[i]==valid_ch[j])break;
  806ee4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806ee7:	48 63 d0             	movsxd rdx,eax
  806eea:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806eee:	48 01 d0             	add    rax,rdx
  806ef1:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806ef4:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806ef7:	48 98                	cdqe   
  806ef9:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  806efe:	38 c2                	cmp    dl,al
  806f00:	74 0e                	je     806f10 <verify_name+0x10b>
        for(;j<sizeof(valid_ch);j++)
  806f02:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  806f06:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806f09:	83 f8 45             	cmp    eax,0x45
  806f0c:	76 d6                	jbe    806ee4 <verify_name+0xdf>
  806f0e:	eb 01                	jmp    806f11 <verify_name+0x10c>
            if(str[i]==valid_ch[j])break;
  806f10:	90                   	nop
        if(j>=sizeof(valid_ch))
  806f11:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806f14:	83 f8 45             	cmp    eax,0x45
  806f17:	76 0a                	jbe    806f23 <verify_name+0x11e>
        {
            //printf("invalid char\n");
            return 0;//出现非法字符
  806f19:	b8 00 00 00 00       	mov    eax,0x0
  806f1e:	e9 4d 01 00 00       	jmp    807070 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  806f23:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806f26:	48 63 d0             	movsxd rdx,eax
  806f29:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806f2d:	48 01 d0             	add    rax,rdx
  806f30:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806f33:	3c 20                	cmp    al,0x20
  806f35:	74 07                	je     806f3e <verify_name+0x139>
  806f37:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        c++;
  806f3e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  806f42:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806f46:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806f49:	48 63 d0             	movsxd rdx,eax
  806f4c:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806f50:	48 01 d0             	add    rax,rdx
  806f53:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806f56:	3c 2e                	cmp    al,0x2e
  806f58:	74 18                	je     806f72 <verify_name+0x16d>
  806f5a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806f5d:	48 63 d0             	movsxd rdx,eax
  806f60:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806f64:	48 01 d0             	add    rax,rdx
  806f67:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806f6a:	84 c0                	test   al,al
  806f6c:	0f 85 69 ff ff ff    	jne    806edb <verify_name+0xd6>
    }
    if(c>8||flag==0){
  806f72:	83 7d fc 08          	cmp    DWORD PTR [rbp-0x4],0x8
  806f76:	7f 06                	jg     806f7e <verify_name+0x179>
  806f78:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  806f7c:	75 0a                	jne    806f88 <verify_name+0x183>
        //printf("file name blank\n");
        return 0;//不能全是空格
  806f7e:	b8 00 00 00 00       	mov    eax,0x0
  806f83:	e9 e8 00 00 00       	jmp    807070 <verify_name+0x26b>
    }
    if(str[i]=='\0')//没有扩展名
  806f88:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806f8b:	48 63 d0             	movsxd rdx,eax
  806f8e:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806f92:	48 01 d0             	add    rax,rdx
  806f95:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806f98:	84 c0                	test   al,al
  806f9a:	75 0a                	jne    806fa6 <verify_name+0x1a1>
        return 1;
  806f9c:	b8 01 00 00 00       	mov    eax,0x1
  806fa1:	e9 ca 00 00 00       	jmp    807070 <verify_name+0x26b>
    c=0;
  806fa6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    flag=0;
  806fad:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(i++;str[i]!='\0';i++)
  806fb4:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806fb8:	e9 83 00 00 00       	jmp    807040 <verify_name+0x23b>
    {
        int j=0;
  806fbd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
        for(;j<sizeof(valid_ch);j++)
  806fc4:	eb 22                	jmp    806fe8 <verify_name+0x1e3>
            if(str[i]==valid_ch[j])break;
  806fc6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806fc9:	48 63 d0             	movsxd rdx,eax
  806fcc:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806fd0:	48 01 d0             	add    rax,rdx
  806fd3:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806fd6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806fd9:	48 98                	cdqe   
  806fdb:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  806fe0:	38 c2                	cmp    dl,al
  806fe2:	74 0e                	je     806ff2 <verify_name+0x1ed>
        for(;j<sizeof(valid_ch);j++)
  806fe4:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806fe8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806feb:	83 f8 45             	cmp    eax,0x45
  806fee:	76 d6                	jbe    806fc6 <verify_name+0x1c1>
  806ff0:	eb 01                	jmp    806ff3 <verify_name+0x1ee>
            if(str[i]==valid_ch[j])break;
  806ff2:	90                   	nop
        if(j>=sizeof(valid_ch)){
  806ff3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806ff6:	83 f8 45             	cmp    eax,0x45
  806ff9:	76 07                	jbe    807002 <verify_name+0x1fd>
            //printf("invalid char:%x\n",str[i]);
            return 0;//出现非法字符
  806ffb:	b8 00 00 00 00       	mov    eax,0x0
  807000:	eb 6e                	jmp    807070 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  807002:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807005:	48 63 d0             	movsxd rdx,eax
  807008:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80700c:	48 01 d0             	add    rax,rdx
  80700f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807012:	3c 20                	cmp    al,0x20
  807014:	74 07                	je     80701d <verify_name+0x218>
  807016:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        if(str[i]=='.'){
  80701d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807020:	48 63 d0             	movsxd rdx,eax
  807023:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807027:	48 01 d0             	add    rax,rdx
  80702a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80702d:	3c 2e                	cmp    al,0x2e
  80702f:	75 07                	jne    807038 <verify_name+0x233>
            //printf("multiple dots.");
            return 0;//不能多次出现.
  807031:	b8 00 00 00 00       	mov    eax,0x0
  807036:	eb 38                	jmp    807070 <verify_name+0x26b>
        }
        c++;
  807038:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(i++;str[i]!='\0';i++)
  80703c:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807040:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807043:	48 63 d0             	movsxd rdx,eax
  807046:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80704a:	48 01 d0             	add    rax,rdx
  80704d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807050:	84 c0                	test   al,al
  807052:	0f 85 65 ff ff ff    	jne    806fbd <verify_name+0x1b8>
    }
    if(c>3||flag==0){
  807058:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  80705c:	7f 06                	jg     807064 <verify_name+0x25f>
  80705e:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  807062:	75 07                	jne    80706b <verify_name+0x266>
        //printf("file name blank\n");
        return 0;//不能全是空格
  807064:	b8 00 00 00 00       	mov    eax,0x0
  807069:	eb 05                	jmp    807070 <verify_name+0x26b>
    }
    return 1;
  80706b:	b8 01 00 00 00       	mov    eax,0x1
}
  807070:	c9                   	leave  
  807071:	c3                   	ret    

0000000000807072 <format_name>:
//将“aaa.bb”的文件名形式转换为可以直接strcmp(,,11)的形式。
//默认文件名合法，请先检查文件名再使用。
void format_name(char *str)
{
  807072:	f3 0f 1e fa          	endbr64 
  807076:	55                   	push   rbp
  807077:	48 89 e5             	mov    rbp,rsp
  80707a:	48 83 ec 30          	sub    rsp,0x30
  80707e:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char v[12]="           ";
  807082:	48 b8 20 20 20 20 20 	movabs rax,0x2020202020202020
  807089:	20 20 20 
  80708c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  807090:	c7 45 f0 20 20 20 00 	mov    DWORD PTR [rbp-0x10],0x202020
    int ptr=0;
  807097:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    int namelen=0;
  80709e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    for(int i=0;str[i]!='\0';i++)
  8070a5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8070ac:	e9 9b 00 00 00       	jmp    80714c <format_name+0xda>
    {
        if(str[i]>='a'&&str[i]<='z')
  8070b1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8070b4:	48 63 d0             	movsxd rdx,eax
  8070b7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8070bb:	48 01 d0             	add    rax,rdx
  8070be:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070c1:	3c 60                	cmp    al,0x60
  8070c3:	7e 3e                	jle    807103 <format_name+0x91>
  8070c5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8070c8:	48 63 d0             	movsxd rdx,eax
  8070cb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8070cf:	48 01 d0             	add    rax,rdx
  8070d2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070d5:	3c 7a                	cmp    al,0x7a
  8070d7:	7f 2a                	jg     807103 <format_name+0x91>
        {
            v[ptr++]=str[i]-'a'+'A';
  8070d9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8070dc:	48 63 d0             	movsxd rdx,eax
  8070df:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8070e3:	48 01 d0             	add    rax,rdx
  8070e6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070e9:	8d 48 e0             	lea    ecx,[rax-0x20]
  8070ec:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8070ef:	8d 50 01             	lea    edx,[rax+0x1]
  8070f2:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  8070f5:	89 ca                	mov    edx,ecx
  8070f7:	48 98                	cdqe   
  8070f9:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  8070fd:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807101:	eb 45                	jmp    807148 <format_name+0xd6>
        }
        else if(str[i]=='.')
  807103:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807106:	48 63 d0             	movsxd rdx,eax
  807109:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80710d:	48 01 d0             	add    rax,rdx
  807110:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807113:	3c 2e                	cmp    al,0x2e
  807115:	75 0d                	jne    807124 <format_name+0xb2>
        {
            ptr+=(8-namelen);
  807117:	b8 08 00 00 00       	mov    eax,0x8
  80711c:	2b 45 f8             	sub    eax,DWORD PTR [rbp-0x8]
  80711f:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
  807122:	eb 24                	jmp    807148 <format_name+0xd6>
        }else
        {
            v[ptr++]=str[i];
  807124:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807127:	48 63 d0             	movsxd rdx,eax
  80712a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80712e:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807132:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807135:	8d 50 01             	lea    edx,[rax+0x1]
  807138:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80713b:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
  80713e:	48 98                	cdqe   
  807140:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  807144:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
    for(int i=0;str[i]!='\0';i++)
  807148:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80714c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80714f:	48 63 d0             	movsxd rdx,eax
  807152:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807156:	48 01 d0             	add    rax,rdx
  807159:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80715c:	84 c0                	test   al,al
  80715e:	0f 85 4d ff ff ff    	jne    8070b1 <format_name+0x3f>
        }
    }
    v[12]='\0';
  807164:	c6 45 f4 00          	mov    BYTE PTR [rbp-0xc],0x0
    strcpy(str,v);
  807168:	48 8d 55 e8          	lea    rdx,[rbp-0x18]
  80716c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807170:	48 89 d6             	mov    rsi,rdx
  807173:	48 89 c7             	mov    rdi,rax
  807176:	e8 28 23 00 00       	call   8094a3 <strcpy>
}
  80717b:	90                   	nop
  80717c:	c9                   	leave  
  80717d:	c3                   	ret    

000000000080717e <req_cluster>:
int req_cluster()
{
  80717e:	f3 0f 1e fa          	endbr64 
  807182:	55                   	push   rbp
  807183:	48 89 e5             	mov    rbp,rsp
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  807186:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [rbp-0x4],0x3
  80718d:	eb 2a                	jmp    8071b9 <req_cluster+0x3b>
    {
        if(fat[i]==0)
  80718f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807192:	48 98                	cdqe   
  807194:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  80719b:	00 
  80719c:	66 85 c0             	test   ax,ax
  80719f:	75 14                	jne    8071b5 <req_cluster+0x37>
        {
            fat[i]=0xffff;
  8071a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8071a4:	48 98                	cdqe   
  8071a6:	66 c7 84 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],0xffff
  8071ad:	00 ff ff 
            return i;
  8071b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8071b3:	eb 13                	jmp    8071c8 <req_cluster+0x4a>
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  8071b5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8071b9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8071bc:	3d ff 1f 00 00       	cmp    eax,0x1fff
  8071c1:	76 cc                	jbe    80718f <req_cluster+0x11>
        }
    }
    return -1;
  8071c3:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8071c8:	5d                   	pop    rbp
  8071c9:	c3                   	ret    

00000000008071ca <write_sec>:
int write_sec(char *src, int sec_num, int sec_c)
{
  8071ca:	f3 0f 1e fa          	endbr64 
  8071ce:	55                   	push   rbp
  8071cf:	48 89 e5             	mov    rbp,rsp
  8071d2:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
  8071d9:	48 89 bd 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rdi
  8071e0:	89 b5 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],esi
  8071e6:	89 95 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],edx
    driver_args arg={
  8071ec:	48 8d 95 40 ff ff ff 	lea    rdx,[rbp-0xc0]
  8071f3:	b8 00 00 00 00       	mov    eax,0x0
  8071f8:	b9 18 00 00 00       	mov    ecx,0x18
  8071fd:	48 89 d7             	mov    rdi,rdx
  807200:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  807203:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  80720a:	89 85 48 ff ff ff    	mov    DWORD PTR [rbp-0xb8],eax
  807210:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  807216:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
  80721c:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  807222:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            .src_addr=src,
            .sec_n=sec_num,
            .sec_c=sec_c
    };
    return drv_disk.read(&arg);
  807228:	48 8b 15 89 2c 00 00 	mov    rdx,QWORD PTR [rip+0x2c89]        # 809eb8 <drv_disk+0x18>
  80722f:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  807236:	48 89 c7             	mov    rdi,rax
  807239:	ff d2                	call   rdx
}
  80723b:	c9                   	leave  
  80723c:	c3                   	ret    

000000000080723d <set_attr>:
void set_attr(dir_entry *f,char attr)
{
  80723d:	f3 0f 1e fa          	endbr64 
  807241:	55                   	push   rbp
  807242:	48 89 e5             	mov    rbp,rsp
  807245:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  807249:	89 f0                	mov    eax,esi
  80724b:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    f->attr|=attr;
  80724e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807252:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  807256:	0a 45 f4             	or     al,BYTE PTR [rbp-0xc]
  807259:	89 c2                	mov    edx,eax
  80725b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80725f:	88 50 0b             	mov    BYTE PTR [rax+0xb],dl
}
  807262:	90                   	nop
  807263:	5d                   	pop    rbp
  807264:	c3                   	ret    

0000000000807265 <update_fat_and_root>:
mkdir
touch
rm
*/
void update_fat_and_root()
{
  807265:	f3 0f 1e fa          	endbr64 
  807269:	55                   	push   rbp
  80726a:	48 89 e5             	mov    rbp,rsp
  80726d:	48 83 ec 10          	sub    rsp,0x10
    int root_loc=superblock.rsvdSec+\
  807271:	0f b7 05 f6 15 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc215f6]        # 42886e <superblock+0xe>
  807278:	0f b7 c8             	movzx  ecx,ax
    superblock.secPerFAT*superblock.numOfFAT;
  80727b:	0f b7 05 f4 15 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc215f4]        # 428876 <superblock+0x16>
  807282:	0f b7 d0             	movzx  edx,ax
  807285:	0f b6 05 e4 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc215e4]        # 428870 <superblock+0x10>
  80728c:	0f b6 c0             	movzx  eax,al
  80728f:	0f af c2             	imul   eax,edx
    int root_loc=superblock.rsvdSec+\
  807292:	01 c8                	add    eax,ecx
  807294:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("root_loc:0x%x\n",root_loc);
    write_sec(root_dir,root_loc,sizeof(root_dir));
  807297:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80729a:	ba 00 40 00 00       	mov    edx,0x4000
  80729f:	89 c6                	mov    esi,eax
  8072a1:	bf a0 88 42 00       	mov    edi,0x4288a0
  8072a6:	e8 1f ff ff ff       	call   8071ca <write_sec>
    //printf("updated root\n");
    write_sec(fat,superblock.rsvdSec,sizeof(fat));
  8072ab:	0f b7 05 bc 15 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc215bc]        # 42886e <superblock+0xe>
  8072b2:	0f b7 c0             	movzx  eax,ax
  8072b5:	ba 00 40 00 00       	mov    edx,0x4000
  8072ba:	89 c6                	mov    esi,eax
  8072bc:	bf c0 ca 42 00       	mov    edi,0x42cac0
  8072c1:	e8 04 ff ff ff       	call   8071ca <write_sec>
    //printf("updated fat\n");

}
  8072c6:	90                   	nop
  8072c7:	c9                   	leave  
  8072c8:	c3                   	ret    

00000000008072c9 <add_dot_and_ddot_dir>:
void add_dot_and_ddot_dir(dir_entry dir)
{
  8072c9:	f3 0f 1e fa          	endbr64 
  8072cd:	55                   	push   rbp
  8072ce:	48 89 e5             	mov    rbp,rsp
  8072d1:	48 83 ec 10          	sub    rsp,0x10
    //it must be a regular dir to add. and ..
    //and this must be done when the dir is created
    //regular dir
    int cluster = dir.fistCluNum;
  8072d5:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  8072d9:	0f b7 c0             	movzx  eax,ax
  8072dc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
    superblock.secPerClu);
  8072df:	0f b6 05 87 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21587]        # 42886d <superblock+0xd>
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  8072e6:	0f b6 c0             	movzx  eax,al
  8072e9:	8b 0d 51 2c 00 00    	mov    ecx,DWORD PTR [rip+0x2c51]        # 809f40 <clu_sec_balance>
  8072ef:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8072f2:	01 d1                	add    ecx,edx
  8072f4:	89 c2                	mov    edx,eax
  8072f6:	89 ce                	mov    esi,ecx
  8072f8:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  8072fd:	e8 bc 05 00 00       	call   8078be <read_sec>
    //.
    strcpy(a_clu_of_dir[0].name,".       ");
  807302:	be 0a 1d 81 00       	mov    esi,0x811d0a
  807307:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  80730c:	e8 92 21 00 00       	call   8094a3 <strcpy>
    strcpy(a_clu_of_dir[0].extension,"   ");
  807311:	be 13 1d 81 00       	mov    esi,0x811d13
  807316:	bf c8 c8 42 00       	mov    edi,0x42c8c8
  80731b:	e8 83 21 00 00       	call   8094a3 <strcpy>
    a_clu_of_dir[0].fistCluNum=dir.fistCluNum;
  807320:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  807324:	66 89 05 af 55 c2 ff 	mov    WORD PTR [rip+0xffffffffffc255af],ax        # 42c8da <a_clu_of_dir+0x1a>
    a_clu_of_dir[0].len=0;
  80732b:	c7 05 a7 55 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc255a7],0x0        # 42c8dc <a_clu_of_dir+0x1c>
  807332:	00 00 00 
    set_attr(&a_clu_of_dir[0],ATTR_DIR);
  807335:	be 10 00 00 00       	mov    esi,0x10
  80733a:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  80733f:	e8 f9 fe ff ff       	call   80723d <set_attr>
    //..
    strcpy(a_clu_of_dir[1].name,"..      ");
  807344:	be 17 1d 81 00       	mov    esi,0x811d17
  807349:	bf e0 c8 42 00       	mov    edi,0x42c8e0
  80734e:	e8 50 21 00 00       	call   8094a3 <strcpy>
    strcpy(a_clu_of_dir[1].extension,"   ");
  807353:	be 13 1d 81 00       	mov    esi,0x811d13
  807358:	bf e8 c8 42 00       	mov    edi,0x42c8e8
  80735d:	e8 41 21 00 00       	call   8094a3 <strcpy>
    a_clu_of_dir[1].fistCluNum=cur_dir.fistCluNum;
  807362:	0f b7 05 51 55 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc25551]        # 42c8ba <cur_dir+0x1a>
  807369:	66 89 05 8a 55 c2 ff 	mov    WORD PTR [rip+0xffffffffffc2558a],ax        # 42c8fa <a_clu_of_dir+0x3a>
    a_clu_of_dir[1].len=0;
  807370:	c7 05 82 55 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc25582],0x0        # 42c8fc <a_clu_of_dir+0x3c>
  807377:	00 00 00 
    set_attr(&a_clu_of_dir[1],ATTR_DIR);
  80737a:	be 10 00 00 00       	mov    esi,0x10
  80737f:	bf e0 c8 42 00       	mov    edi,0x42c8e0
  807384:	e8 b4 fe ff ff       	call   80723d <set_attr>
    //update the dir
    int dir_loc=cluster+clu_sec_balance;
  807389:	8b 15 b1 2b 00 00    	mov    edx,DWORD PTR [rip+0x2bb1]        # 809f40 <clu_sec_balance>
  80738f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807392:	01 d0                	add    eax,edx
  807394:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  807397:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80739a:	ba 00 02 00 00       	mov    edx,0x200
  80739f:	89 c6                	mov    esi,eax
  8073a1:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  8073a6:	e8 1f fe ff ff       	call   8071ca <write_sec>
    //no need to update fat and root
}
  8073ab:	90                   	nop
  8073ac:	c9                   	leave  
  8073ad:	c3                   	ret    

00000000008073ae <translate_attr>:
void translate_attr(char attr,char *attr_s)
{
  8073ae:	f3 0f 1e fa          	endbr64 
  8073b2:	55                   	push   rbp
  8073b3:	48 89 e5             	mov    rbp,rsp
  8073b6:	89 f8                	mov    eax,edi
  8073b8:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8073bc:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    //rwhds (s: system h:hidden)
    int v=attr&1;
  8073bf:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  8073c3:	83 e0 01             	and    eax,0x1
  8073c6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//sys_read-only
  8073c9:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8073cd:	74 0b                	je     8073da <translate_attr+0x2c>
        attr_s[1]='-';
  8073cf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8073d3:	48 83 c0 01          	add    rax,0x1
  8073d7:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
    v=attr&2;
  8073da:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  8073de:	83 e0 02             	and    eax,0x2
  8073e1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//hidden
  8073e4:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8073e8:	74 0b                	je     8073f5 <translate_attr+0x47>
        attr_s[2]='h';
  8073ea:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8073ee:	48 83 c0 02          	add    rax,0x2
  8073f2:	c6 00 68             	mov    BYTE PTR [rax],0x68
    v=attr&4;
  8073f5:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  8073f9:	83 e0 04             	and    eax,0x4
  8073fc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//system
  8073ff:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807403:	74 0b                	je     807410 <translate_attr+0x62>
        attr_s[4]='s';
  807405:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807409:	48 83 c0 04          	add    rax,0x4
  80740d:	c6 00 73             	mov    BYTE PTR [rax],0x73
    v=attr&8;
  807410:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807414:	83 e0 08             	and    eax,0x8
  807417:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//volume label
  80741a:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80741e:	74 0b                	je     80742b <translate_attr+0x7d>
        attr_s[3]='v';
  807420:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807424:	48 83 c0 03          	add    rax,0x3
  807428:	c6 00 76             	mov    BYTE PTR [rax],0x76
    v=attr&16;
  80742b:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  80742f:	83 e0 10             	and    eax,0x10
  807432:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//dir
  807435:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807439:	74 0b                	je     807446 <translate_attr+0x98>
        attr_s[3]='d';
  80743b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80743f:	48 83 c0 03          	add    rax,0x3
  807443:	c6 00 64             	mov    BYTE PTR [rax],0x64
    //archive: do nothing
    attr_s[5]='\0';
  807446:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80744a:	48 83 c0 05          	add    rax,0x5
  80744e:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  807451:	90                   	nop
  807452:	5d                   	pop    rbp
  807453:	c3                   	ret    

0000000000807454 <extend_cluster>:
int extend_cluster(short cluster)
{
  807454:	f3 0f 1e fa          	endbr64 
  807458:	55                   	push   rbp
  807459:	48 89 e5             	mov    rbp,rsp
  80745c:	48 83 ec 18          	sub    rsp,0x18
  807460:	89 f8                	mov    eax,edi
  807462:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    int new_clu=req_cluster();
  807466:	b8 00 00 00 00       	mov    eax,0x0
  80746b:	e8 0e fd ff ff       	call   80717e <req_cluster>
  807470:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(new_clu==-1)
  807473:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  807477:	75 07                	jne    807480 <extend_cluster+0x2c>
        return -1;
  807479:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80747e:	eb 16                	jmp    807496 <extend_cluster+0x42>
    fat[cluster]=new_clu;
  807480:	0f bf 45 ec          	movsx  eax,WORD PTR [rbp-0x14]
  807484:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  807487:	48 98                	cdqe   
  807489:	66 89 94 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],dx
  807490:	00 
    return 0;
  807491:	b8 00 00 00 00       	mov    eax,0x0
}
  807496:	c9                   	leave  
  807497:	c3                   	ret    

0000000000807498 <touch>:
得出的结果换算成16进制填入即可。也就是：38H字节0~4位是日期数；38H字节5~7位和39H字节0位是月份；
39H字节的1~7位为年号，原定义中0~119分别代表1980~2099，目前高版本的Windows允许取0~127，
即年号最大可以到2107年。
*/
int touch(driver_args *arg)
{
  807498:	f3 0f 1e fa          	endbr64 
  80749c:	55                   	push   rbp
  80749d:	48 89 e5             	mov    rbp,rsp
  8074a0:	48 83 ec 60          	sub    rsp,0x60
  8074a4:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    char *name=arg->path;
  8074a8:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8074ac:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8074b0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  8074b4:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8074b8:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8074bb:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    //default set to 512
    int max_files=16;
  8074bf:	c7 45 ec 10 00 00 00 	mov    DWORD PTR [rbp-0x14],0x10
    dir_entry *dir_table=a_clu_of_dir;
  8074c6:	48 c7 45 e0 c0 c8 42 	mov    QWORD PTR [rbp-0x20],0x42c8c0
  8074cd:	00 
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  8074ce:	0f b6 05 98 13 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21398]        # 42886d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  8074d5:	0f b6 c0             	movzx  eax,al
  8074d8:	0f b7 55 ca          	movzx  edx,WORD PTR [rbp-0x36]
  8074dc:	0f b7 ca             	movzx  ecx,dx
  8074df:	8b 15 5b 2a 00 00    	mov    edx,DWORD PTR [rip+0x2a5b]        # 809f40 <clu_sec_balance>
  8074e5:	01 d1                	add    ecx,edx
  8074e7:	89 c2                	mov    edx,eax
  8074e9:	89 ce                	mov    esi,ecx
  8074eb:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  8074f0:	e8 c9 03 00 00       	call   8078be <read_sec>
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  8074f5:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  8074f9:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do{
        for(int i=0;i<max_files;i++)
  8074fd:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807504:	e9 2e 01 00 00       	jmp    807637 <touch+0x19f>
        {
            //printf("%s\n",dir_table[i].name);
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  807509:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80750c:	48 98                	cdqe   
  80750e:	48 c1 e0 05          	shl    rax,0x5
  807512:	48 89 c2             	mov    rdx,rax
  807515:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807519:	48 01 d0             	add    rax,rdx
  80751c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80751f:	3c e5                	cmp    al,0xe5
  807521:	74 1e                	je     807541 <touch+0xa9>
            dir_table[i].name[0]==0)
  807523:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807526:	48 98                	cdqe   
  807528:	48 c1 e0 05          	shl    rax,0x5
  80752c:	48 89 c2             	mov    rdx,rax
  80752f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807533:	48 01 d0             	add    rax,rdx
  807536:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  807539:	84 c0                	test   al,al
  80753b:	0f 85 f2 00 00 00    	jne    807633 <touch+0x19b>
            {
                //available
                //put name
                format_name(name);
  807541:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807545:	48 89 c7             	mov    rdi,rax
  807548:	e8 25 fb ff ff       	call   807072 <format_name>
                memcpy(dir_table[i].name,name,11);
  80754d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807550:	48 98                	cdqe   
  807552:	48 c1 e0 05          	shl    rax,0x5
  807556:	48 89 c2             	mov    rdx,rax
  807559:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80755d:	48 01 d0             	add    rax,rdx
  807560:	48 89 c1             	mov    rcx,rax
  807563:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807567:	ba 0b 00 00 00       	mov    edx,0xb
  80756c:	48 89 c6             	mov    rsi,rax
  80756f:	48 89 cf             	mov    rdi,rcx
  807572:	e8 2e 1e 00 00       	call   8093a5 <memcpy>
                int clu=req_cluster();
  807577:	b8 00 00 00 00       	mov    eax,0x0
  80757c:	e8 fd fb ff ff       	call   80717e <req_cluster>
  807581:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
                if(clu==-1)
  807584:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  807588:	75 0a                	jne    807594 <touch+0xfc>
                {
                    //puts("err: full disk");
                    return -1;
  80758a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80758f:	e9 fc 00 00 00       	jmp    807690 <touch+0x1f8>
                }
                dir_table[i].fistCluNum=clu;
  807594:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807597:	48 98                	cdqe   
  807599:	48 c1 e0 05          	shl    rax,0x5
  80759d:	48 89 c2             	mov    rdx,rax
  8075a0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8075a4:	48 01 d0             	add    rax,rdx
  8075a7:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8075aa:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
                set_attr(&dir_table[i],ATTR_ARCHIVE);
  8075ae:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8075b1:	48 98                	cdqe   
  8075b3:	48 c1 e0 05          	shl    rax,0x5
  8075b7:	48 89 c2             	mov    rdx,rax
  8075ba:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8075be:	48 01 d0             	add    rax,rdx
  8075c1:	be 20 00 00 00       	mov    esi,0x20
  8075c6:	48 89 c7             	mov    rdi,rax
  8075c9:	e8 6f fc ff ff       	call   80723d <set_attr>
                dir_table[i].len=superblock.bytesPerSec*superblock.secPerClu;
  8075ce:	0f b7 05 96 12 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21296]        # 42886b <superblock+0xb>
  8075d5:	0f b7 d0             	movzx  edx,ax
  8075d8:	0f b6 05 8e 12 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2128e]        # 42886d <superblock+0xd>
  8075df:	0f b6 c0             	movzx  eax,al
  8075e2:	0f af d0             	imul   edx,eax
  8075e5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8075e8:	48 98                	cdqe   
  8075ea:	48 c1 e0 05          	shl    rax,0x5
  8075ee:	48 89 c1             	mov    rcx,rax
  8075f1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8075f5:	48 01 c8             	add    rax,rcx
  8075f8:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
                //date and time
                //dir_table[i].lastModfDate=get_date_stab();
                //dir_table[i].lastModfTime=get_time_stab();
                //update
                write_sec(dir_table,cluster+clu_sec_balance,\
                superblock.bytesPerSec*superblock.secPerClu);
  8075fb:	0f b7 05 69 12 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21269]        # 42886b <superblock+0xb>
  807602:	0f b7 d0             	movzx  edx,ax
  807605:	0f b6 05 61 12 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21261]        # 42886d <superblock+0xd>
  80760c:	0f b6 c0             	movzx  eax,al
                write_sec(dir_table,cluster+clu_sec_balance,\
  80760f:	0f af d0             	imul   edx,eax
  807612:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807616:	8b 05 24 29 00 00    	mov    eax,DWORD PTR [rip+0x2924]        # 809f40 <clu_sec_balance>
  80761c:	01 c1                	add    ecx,eax
  80761e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807622:	89 ce                	mov    esi,ecx
  807624:	48 89 c7             	mov    rdi,rax
  807627:	e8 9e fb ff ff       	call   8071ca <write_sec>
                return -1;
  80762c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807631:	eb 5d                	jmp    807690 <touch+0x1f8>
        for(int i=0;i<max_files;i++)
  807633:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807637:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80763a:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
  80763d:	0f 8c c6 fe ff ff    	jl     807509 <touch+0x71>
        if(fat[cluster]>=FAT_EOF&&extend_cluster(cluster)==-1)
        {
            //extend fail
            //puts("err:full disk");
            return -1;
        }else if(cluster<FAT_EOF)
  807643:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807648:	77 36                	ja     807680 <touch+0x1e8>
        {
            cluster=fat[cluster];
  80764a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80764e:	48 98                	cdqe   
  807650:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807657:	00 
  807658:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  80765c:	0f b6 05 0a 12 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2120a]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807663:	0f b6 d0             	movzx  edx,al
  807666:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  80766a:	8b 05 d0 28 00 00    	mov    eax,DWORD PTR [rip+0x28d0]        # 809f40 <clu_sec_balance>
  807670:	01 c1                	add    ecx,eax
  807672:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807676:	89 ce                	mov    esi,ecx
  807678:	48 89 c7             	mov    rdi,rax
  80767b:	e8 3e 02 00 00       	call   8078be <read_sec>
        }
    }while(cluster<FAT_EOF);
  807680:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807685:	0f 86 72 fe ff ff    	jbe    8074fd <touch+0x65>
    return 0;
  80768b:	b8 00 00 00 00       	mov    eax,0x0
}
  807690:	c9                   	leave  
  807691:	c3                   	ret    

0000000000807692 <mkdir>:
//attention: the name must be char[12]
int mkdir(driver_args *arg)
{
  807692:	f3 0f 1e fa          	endbr64 
  807696:	55                   	push   rbp
  807697:	48 89 e5             	mov    rbp,rsp
  80769a:	48 83 ec 50          	sub    rsp,0x50
  80769e:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    char *name=arg->path;
  8076a2:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8076a6:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8076aa:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  8076ae:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8076b2:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8076b5:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    format_name(name);
  8076b9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8076bd:	48 89 c7             	mov    rdi,rax
  8076c0:	e8 ad f9 ff ff       	call   807072 <format_name>
    //regular dir
    unsigned short cluster = dir.fistCluNum;
  8076c5:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  8076c9:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do
    {
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
            superblock.secPerClu);
  8076cd:	0f b6 05 99 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21199]        # 42886d <superblock+0xd>
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  8076d4:	0f b6 c0             	movzx  eax,al
  8076d7:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  8076db:	8b 15 5f 28 00 00    	mov    edx,DWORD PTR [rip+0x285f]        # 809f40 <clu_sec_balance>
  8076e1:	01 d1                	add    ecx,edx
  8076e3:	89 c2                	mov    edx,eax
  8076e5:	89 ce                	mov    esi,ecx
  8076e7:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  8076ec:	e8 cd 01 00 00       	call   8078be <read_sec>
        for (int i = 0; i < 16; i++)
  8076f1:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8076f8:	e9 8c 01 00 00       	jmp    807889 <mkdir+0x1f7>
        {
            if(a_clu_of_dir[i].fistCluNum==0||\
  8076fd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807700:	48 98                	cdqe   
  807702:	48 c1 e0 05          	shl    rax,0x5
  807706:	48 05 da c8 42 00    	add    rax,0x42c8da
  80770c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80770f:	66 85 c0             	test   ax,ax
  807712:	74 30                	je     807744 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0xe5||\
  807714:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807717:	48 98                	cdqe   
  807719:	48 c1 e0 05          	shl    rax,0x5
  80771d:	48 05 a0 88 42 00    	add    rax,0x4288a0
  807723:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if(a_clu_of_dir[i].fistCluNum==0||\
  807726:	3c e5                	cmp    al,0xe5
  807728:	74 1a                	je     807744 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0)
  80772a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80772d:	48 98                	cdqe   
  80772f:	48 c1 e0 05          	shl    rax,0x5
  807733:	48 05 a0 88 42 00    	add    rax,0x4288a0
  807739:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            (unsigned char)root_dir[i].name[0]==0xe5||\
  80773c:	84 c0                	test   al,al
  80773e:	0f 85 41 01 00 00    	jne    807885 <mkdir+0x1f3>
            {
                memset(&a_clu_of_dir[i],0,sizeof(dir_entry));
  807744:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807747:	48 98                	cdqe   
  807749:	48 c1 e0 05          	shl    rax,0x5
  80774d:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  807753:	ba 20 00 00 00       	mov    edx,0x20
  807758:	be 00 00 00 00       	mov    esi,0x0
  80775d:	48 89 c7             	mov    rdi,rax
  807760:	e8 ef 1c 00 00       	call   809454 <memset>
                memset(a_clu_of_dir[i].name,' ',11);
  807765:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807768:	48 98                	cdqe   
  80776a:	48 c1 e0 05          	shl    rax,0x5
  80776e:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  807774:	ba 0b 00 00 00       	mov    edx,0xb
  807779:	be 20 00 00 00       	mov    esi,0x20
  80777e:	48 89 c7             	mov    rdi,rax
  807781:	e8 ce 1c 00 00       	call   809454 <memset>
                strcpy(a_clu_of_dir[i].name,name);
  807786:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807789:	48 98                	cdqe   
  80778b:	48 c1 e0 05          	shl    rax,0x5
  80778f:	48 8d 90 c0 c8 42 00 	lea    rdx,[rax+0x42c8c0]
  807796:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80779a:	48 89 c6             	mov    rsi,rax
  80779d:	48 89 d7             	mov    rdi,rdx
  8077a0:	e8 fe 1c 00 00       	call   8094a3 <strcpy>
                a_clu_of_dir[i].name[strlen(name)]=' ';
  8077a5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8077a9:	48 89 c7             	mov    rdi,rax
  8077ac:	e8 11 1f 00 00       	call   8096c2 <strlen>
  8077b1:	48 63 d0             	movsxd rdx,eax
  8077b4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8077b7:	48 98                	cdqe   
  8077b9:	48 c1 e0 05          	shl    rax,0x5
  8077bd:	48 01 d0             	add    rax,rdx
  8077c0:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  8077c6:	c6 00 20             	mov    BYTE PTR [rax],0x20
                int clu=req_cluster();
  8077c9:	b8 00 00 00 00       	mov    eax,0x0
  8077ce:	e8 ab f9 ff ff       	call   80717e <req_cluster>
  8077d3:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
                if(clu==-1)//check
  8077d6:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8077da:	75 0a                	jne    8077e6 <mkdir+0x154>
                {
                    //puts("err:full dir");
                    return -1;
  8077dc:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8077e1:	e9 d6 00 00 00       	jmp    8078bc <mkdir+0x22a>
                }
                a_clu_of_dir[i].fistCluNum=clu;
  8077e6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8077e9:	89 c2                	mov    edx,eax
  8077eb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8077ee:	48 98                	cdqe   
  8077f0:	48 c1 e0 05          	shl    rax,0x5
  8077f4:	48 05 da c8 42 00    	add    rax,0x42c8da
  8077fa:	66 89 10             	mov    WORD PTR [rax],dx
                //set attr
                set_attr(&a_clu_of_dir[i],ATTR_DIR);
  8077fd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807800:	48 98                	cdqe   
  807802:	48 c1 e0 05          	shl    rax,0x5
  807806:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  80780c:	be 10 00 00 00       	mov    esi,0x10
  807811:	48 89 c7             	mov    rdi,rax
  807814:	e8 24 fa ff ff       	call   80723d <set_attr>
                //set length
                a_clu_of_dir[i].len=0;
  807819:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80781c:	48 98                	cdqe   
  80781e:	48 c1 e0 05          	shl    rax,0x5
  807822:	48 05 dc c8 42 00    	add    rax,0x42c8dc
  807828:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
                //date and time
                /*a_clu_of_dir[i].lastModfDate=get_date_stab();
                a_clu_of_dir[i].lastModfTime=get_time_stab();*/
                //set date:temporarily none
                //add . and ..
                add_dot_and_ddot_dir(a_clu_of_dir[i]);
  80782e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807831:	48 98                	cdqe   
  807833:	48 c1 e0 05          	shl    rax,0x5
  807837:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  80783d:	ff 70 18             	push   QWORD PTR [rax+0x18]
  807840:	ff 70 10             	push   QWORD PTR [rax+0x10]
  807843:	ff 70 08             	push   QWORD PTR [rax+0x8]
  807846:	ff 30                	push   QWORD PTR [rax]
  807848:	e8 7c fa ff ff       	call   8072c9 <add_dot_and_ddot_dir>
  80784d:	48 83 c4 20          	add    rsp,0x20
                //update the dir
                int dir_loc=cluster+clu_sec_balance;
  807851:	0f b7 55 fe          	movzx  edx,WORD PTR [rbp-0x2]
  807855:	8b 05 e5 26 00 00    	mov    eax,DWORD PTR [rip+0x26e5]        # 809f40 <clu_sec_balance>
  80785b:	01 d0                	add    eax,edx
  80785d:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
                write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  807860:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807863:	ba 00 02 00 00       	mov    edx,0x200
  807868:	89 c6                	mov    esi,eax
  80786a:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  80786f:	e8 56 f9 ff ff       	call   8071ca <write_sec>
                update_fat_and_root();
  807874:	b8 00 00 00 00       	mov    eax,0x0
  807879:	e8 e7 f9 ff ff       	call   807265 <update_fat_and_root>
                return 0;
  80787e:	b8 00 00 00 00       	mov    eax,0x0
  807883:	eb 37                	jmp    8078bc <mkdir+0x22a>
        for (int i = 0; i < 16; i++)
  807885:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807889:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  80788d:	0f 8e 6a fe ff ff    	jle    8076fd <mkdir+0x6b>
            }
        }

        if(cluster<FAT_EOF)
  807893:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807898:	77 12                	ja     8078ac <mkdir+0x21a>
            cluster=fat[cluster];
  80789a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80789e:	48 98                	cdqe   
  8078a0:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8078a7:	00 
  8078a8:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    } while (cluster<FAT_EOF);
  8078ac:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  8078b1:	0f 86 16 fe ff ff    	jbe    8076cd <mkdir+0x3b>
    return -1;
  8078b7:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8078bc:	c9                   	leave  
  8078bd:	c3                   	ret    

00000000008078be <read_sec>:
    }
    
    
}*/
int read_sec(char *dist, int sec_num, int sec_count)
{
  8078be:	f3 0f 1e fa          	endbr64 
  8078c2:	55                   	push   rbp
  8078c3:	48 89 e5             	mov    rbp,rsp
  8078c6:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  8078cd:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
  8078d4:	89 b5 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],esi
  8078da:	89 95 20 ff ff ff    	mov    DWORD PTR [rbp-0xe0],edx
    driver_args arg={
  8078e0:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  8078e7:	b8 00 00 00 00       	mov    eax,0x0
  8078ec:	b9 18 00 00 00       	mov    ecx,0x18
  8078f1:	48 89 d7             	mov    rdi,rdx
  8078f4:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  8078f7:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
  8078fd:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
  807903:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  80790a:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
  807910:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  807917:	00 00 00 
            .dist_addr=dist,
            .lba=sec_num,
            .sec_c=1
    };
    for(int i=0;i<sec_count;i++)
  80791a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807921:	eb 3e                	jmp    807961 <read_sec+0xa3>
    {
        drv_disk.read(&arg);
  807923:	48 8b 15 8e 25 00 00 	mov    rdx,QWORD PTR [rip+0x258e]        # 809eb8 <drv_disk+0x18>
  80792a:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  807931:	48 89 c7             	mov    rdi,rax
  807934:	ff d2                	call   rdx
        arg.dist_addr+=superblock.bytesPerSec;
  807936:	8b 95 34 ff ff ff    	mov    edx,DWORD PTR [rbp-0xcc]
  80793c:	0f b7 05 28 0f c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20f28]        # 42886b <superblock+0xb>
  807943:	0f b7 c0             	movzx  eax,ax
  807946:	01 d0                	add    eax,edx
  807948:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.lba++;
  80794e:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  807954:	83 c0 01             	add    eax,0x1
  807957:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
    for(int i=0;i<sec_count;i++)
  80795d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807961:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807964:	3b 85 20 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xe0]
  80796a:	7c b7                	jl     807923 <read_sec+0x65>
    }
    return 0;
  80796c:	b8 00 00 00 00       	mov    eax,0x0
}
  807971:	c9                   	leave  
  807972:	c3                   	ret    

0000000000807973 <rm>:

int rm(driver_args* args)
{
  807973:	f3 0f 1e fa          	endbr64 
  807977:	55                   	push   rbp
  807978:	48 89 e5             	mov    rbp,rsp
  80797b:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  807982:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
    char *name=args->path;
  807989:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  807990:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807994:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    driver_args tmparg={
  807998:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  80799f:	b8 00 00 00 00       	mov    eax,0x0
  8079a4:	b9 18 00 00 00       	mov    ecx,0x18
  8079a9:	48 89 d7             	mov    rdi,rdx
  8079ac:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .path=args->dir_path,
  8079af:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8079b6:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
    driver_args tmparg={
  8079bd:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    if(get_entry(&tmparg)==-1)return -1;
  8079c4:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  8079cb:	48 89 c7             	mov    rdi,rax
  8079ce:	e8 07 0a 00 00       	call   8083da <get_entry>
  8079d3:	83 f8 ff             	cmp    eax,0xffffffff
  8079d6:	75 0a                	jne    8079e2 <rm+0x6f>
  8079d8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8079dd:	e9 a8 01 00 00       	jmp    807b8a <rm+0x217>
    dir.fistCluNum=tmparg.entry.id;
  8079e2:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  8079e8:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    dir_entry *dir_table=a_clu_of_dir;
  8079ec:	48 c7 45 e0 c0 c8 42 	mov    QWORD PTR [rbp-0x20],0x42c8c0
  8079f3:	00 
    //regular dir
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
    superblock.secPerClu);
  8079f4:	0f b6 05 72 0e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20e72]        # 42886d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  8079fb:	0f b6 c0             	movzx  eax,al
  8079fe:	0f b7 55 da          	movzx  edx,WORD PTR [rbp-0x26]
  807a02:	0f b7 ca             	movzx  ecx,dx
  807a05:	8b 15 35 25 00 00    	mov    edx,DWORD PTR [rip+0x2535]        # 809f40 <clu_sec_balance>
  807a0b:	01 d1                	add    ecx,edx
  807a0d:	89 c2                	mov    edx,eax
  807a0f:	89 ce                	mov    esi,ecx
  807a11:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807a16:	e8 a3 fe ff ff       	call   8078be <read_sec>
    dir_table=a_clu_of_dir;
  807a1b:	48 c7 45 e0 c0 c8 42 	mov    QWORD PTR [rbp-0x20],0x42c8c0
  807a22:	00 
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  807a23:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  807a27:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    int i=0;
  807a2b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    while(cluster<FAT_EOF){
  807a32:	e9 89 00 00 00       	jmp    807ac0 <rm+0x14d>
        read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807a37:	0f b6 05 2f 0e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20e2f]        # 42886d <superblock+0xd>
        read_sec(dir_table,cluster+clu_sec_balance,\
  807a3e:	0f b6 d0             	movzx  edx,al
  807a41:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807a45:	8b 05 f5 24 00 00    	mov    eax,DWORD PTR [rip+0x24f5]        # 809f40 <clu_sec_balance>
  807a4b:	01 c1                	add    ecx,eax
  807a4d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807a51:	89 ce                	mov    esi,ecx
  807a53:	48 89 c7             	mov    rdi,rax
  807a56:	e8 63 fe ff ff       	call   8078be <read_sec>
        for(;i<16;i++)
  807a5b:	eb 44                	jmp    807aa1 <rm+0x12e>
        {
            if(dir_table[i].fistCluNum==args->entry.id)
  807a5d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807a60:	48 98                	cdqe   
  807a62:	48 c1 e0 05          	shl    rax,0x5
  807a66:	48 89 c2             	mov    rdx,rax
  807a69:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807a6d:	48 01 d0             	add    rax,rdx
  807a70:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  807a74:	0f b7 d0             	movzx  edx,ax
  807a77:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  807a7e:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  807a81:	39 c2                	cmp    edx,eax
  807a83:	75 18                	jne    807a9d <rm+0x12a>
            {
                if(dir_table[i].attr&ATTR_DIR){
                    //要处理里面的文件
                }
                dir_table[i].name[0]=0xe5;
  807a85:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807a88:	48 98                	cdqe   
  807a8a:	48 c1 e0 05          	shl    rax,0x5
  807a8e:	48 89 c2             	mov    rdx,rax
  807a91:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807a95:	48 01 d0             	add    rax,rdx
  807a98:	c6 00 e5             	mov    BYTE PTR [rax],0xe5
                goto del_entry_finish;
  807a9b:	eb 2f                	jmp    807acc <rm+0x159>
        for(;i<16;i++)
  807a9d:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807aa1:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  807aa5:	7e b6                	jle    807a5d <rm+0xea>
            }
        }
        if(cluster<FAT_EOF)
  807aa7:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807aac:	77 12                	ja     807ac0 <rm+0x14d>
        {
            cluster=fat[cluster];
  807aae:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807ab2:	48 98                	cdqe   
  807ab4:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807abb:	00 
  807abc:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    while(cluster<FAT_EOF){
  807ac0:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807ac5:	0f 86 6c ff ff ff    	jbe    807a37 <rm+0xc4>
            //update
            //if you can reach here it means it's a regular dir
        }

    }
del_entry_finish:
  807acb:	90                   	nop
    ;
    //del fat
    unsigned short del_clu=dir_table[i].fistCluNum;
  807acc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807acf:	48 98                	cdqe   
  807ad1:	48 c1 e0 05          	shl    rax,0x5
  807ad5:	48 89 c2             	mov    rdx,rax
  807ad8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807adc:	48 01 d0             	add    rax,rdx
  807adf:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  807ae3:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
    unsigned short pion=del_clu<FAT_EOF?fat[del_clu]:0xffff;
  807ae7:	66 83 7d f6 f6       	cmp    WORD PTR [rbp-0xa],0xfff6
  807aec:	77 10                	ja     807afe <rm+0x18b>
  807aee:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807af2:	48 98                	cdqe   
  807af4:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807afb:	00 
  807afc:	eb 05                	jmp    807b03 <rm+0x190>
  807afe:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807b03:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  807b07:	eb 2a                	jmp    807b33 <rm+0x1c0>
    {
        fat[del_clu]=0;
  807b09:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807b0d:	48 98                	cdqe   
  807b0f:	66 c7 84 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],0x0
  807b16:	00 00 00 
        del_clu=pion;
  807b19:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  807b1d:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
        pion=fat[pion];
  807b21:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  807b25:	48 98                	cdqe   
  807b27:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807b2e:	00 
  807b2f:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  807b33:	66 83 7d f4 f6       	cmp    WORD PTR [rbp-0xc],0xfff6
  807b38:	76 cf                	jbe    807b09 <rm+0x196>
    }
    fat[del_clu]=0;
  807b3a:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807b3e:	48 98                	cdqe   
  807b40:	66 c7 84 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],0x0
  807b47:	00 00 00 
    //del dir entry
    write_sec(dir_table,cluster+clu_sec_balance,\
    superblock.secPerClu*superblock.bytesPerSec);
  807b4a:	0f b6 05 1c 0d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20d1c]        # 42886d <superblock+0xd>
  807b51:	0f b6 d0             	movzx  edx,al
  807b54:	0f b7 05 10 0d c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20d10]        # 42886b <superblock+0xb>
  807b5b:	0f b7 c0             	movzx  eax,ax
    write_sec(dir_table,cluster+clu_sec_balance,\
  807b5e:	0f af d0             	imul   edx,eax
  807b61:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807b65:	8b 05 d5 23 00 00    	mov    eax,DWORD PTR [rip+0x23d5]        # 809f40 <clu_sec_balance>
  807b6b:	01 c1                	add    ecx,eax
  807b6d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807b71:	89 ce                	mov    esi,ecx
  807b73:	48 89 c7             	mov    rdi,rax
  807b76:	e8 4f f6 ff ff       	call   8071ca <write_sec>
    update_fat_and_root();
  807b7b:	b8 00 00 00 00       	mov    eax,0x0
  807b80:	e8 e0 f6 ff ff       	call   807265 <update_fat_and_root>
    return 0;
  807b85:	b8 00 00 00 00       	mov    eax,0x0
}
  807b8a:	c9                   	leave  
  807b8b:	c3                   	ret    

0000000000807b8c <find>:
int find_f=0;
int find(char *name)
{
  807b8c:	f3 0f 1e fa          	endbr64 
  807b90:	55                   	push   rbp
  807b91:	48 89 e5             	mov    rbp,rsp
  807b94:	48 83 ec 30          	sub    rsp,0x30
  807b98:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  807b9c:	c7 45 fc 00 02 00 00 	mov    DWORD PTR [rbp-0x4],0x200
    int index=0;
  807ba3:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    dir_entry *dir_table=a_clu_of_dir;
  807baa:	48 c7 45 f0 c0 c8 42 	mov    QWORD PTR [rbp-0x10],0x42c8c0
  807bb1:	00 
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  807bb2:	0f b7 05 01 4d c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24d01]        # 42c8ba <cur_dir+0x1a>
  807bb9:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
    if(cur_dir.fistCluNum==0)
  807bbd:	0f b7 05 f6 4c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24cf6]        # 42c8ba <cur_dir+0x1a>
  807bc4:	66 85 c0             	test   ax,ax
  807bc7:	75 0a                	jne    807bd3 <find+0x47>
        dir_table=root_dir;
  807bc9:	48 c7 45 f0 a0 88 42 	mov    QWORD PTR [rbp-0x10],0x4288a0
  807bd0:	00 
  807bd1:	eb 2b                	jmp    807bfe <find+0x72>
    else {
        max_files=16;
  807bd3:	c7 45 fc 10 00 00 00 	mov    DWORD PTR [rbp-0x4],0x10
        read_sec(dir_table, cluster + clu_sec_balance, \
            superblock.secPerClu);
  807bda:	0f b6 05 8c 0c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20c8c]        # 42886d <superblock+0xd>
        read_sec(dir_table, cluster + clu_sec_balance, \
  807be1:	0f b6 d0             	movzx  edx,al
  807be4:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  807be8:	8b 05 52 23 00 00    	mov    eax,DWORD PTR [rip+0x2352]        # 809f40 <clu_sec_balance>
  807bee:	01 c1                	add    ecx,eax
  807bf0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807bf4:	89 ce                	mov    esi,ecx
  807bf6:	48 89 c7             	mov    rdi,rax
  807bf9:	e8 c0 fc ff ff       	call   8078be <read_sec>
    }
    do{
        for(int i=0;i<max_files;i++)
  807bfe:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  807c05:	eb 57                	jmp    807c5e <find+0xd2>
        {
            if(dir_table[i].name[0]==0||dir_table[i].name[0]==0xe5)
  807c07:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807c0a:	48 98                	cdqe   
  807c0c:	48 c1 e0 05          	shl    rax,0x5
  807c10:	48 89 c2             	mov    rdx,rax
  807c13:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807c17:	48 01 d0             	add    rax,rdx
  807c1a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807c1d:	84 c0                	test   al,al
  807c1f:	74 38                	je     807c59 <find+0xcd>
                continue;
            if(memcmp(dir_table[i].name,name,11)==0)
  807c21:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807c24:	48 98                	cdqe   
  807c26:	48 c1 e0 05          	shl    rax,0x5
  807c2a:	48 89 c2             	mov    rdx,rax
  807c2d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807c31:	48 01 d0             	add    rax,rdx
  807c34:	48 89 c1             	mov    rcx,rax
  807c37:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807c3b:	ba 0b 00 00 00       	mov    edx,0xb
  807c40:	48 89 c6             	mov    rsi,rax
  807c43:	48 89 cf             	mov    rdi,rcx
  807c46:	e8 a4 17 00 00       	call   8093ef <memcmp>
  807c4b:	85 c0                	test   eax,eax
  807c4d:	75 0b                	jne    807c5a <find+0xce>
            {
                return index+i;
  807c4f:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  807c52:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807c55:	01 d0                	add    eax,edx
  807c57:	eb 71                	jmp    807cca <find+0x13e>
                continue;
  807c59:	90                   	nop
        for(int i=0;i<max_files;i++)
  807c5a:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  807c5e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807c61:	3b 45 fc             	cmp    eax,DWORD PTR [rbp-0x4]
  807c64:	7c a1                	jl     807c07 <find+0x7b>
            }
        }
        if(cur_dir.fistCluNum==0)
  807c66:	0f b7 05 4d 4c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24c4d]        # 42c8ba <cur_dir+0x1a>
  807c6d:	66 85 c0             	test   ax,ax
  807c70:	75 07                	jne    807c79 <find+0xed>
            return -1;
  807c72:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807c77:	eb 51                	jmp    807cca <find+0x13e>
        else if(cluster<FAT_EOF)
  807c79:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  807c7e:	77 3a                	ja     807cba <find+0x12e>
        {
            index+=16;
  807c80:	83 45 f8 10          	add    DWORD PTR [rbp-0x8],0x10
            cluster=fat[cluster];
  807c84:	0f b7 45 ee          	movzx  eax,WORD PTR [rbp-0x12]
  807c88:	48 98                	cdqe   
  807c8a:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807c91:	00 
  807c92:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807c96:	0f b6 05 d0 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20bd0]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807c9d:	0f b6 d0             	movzx  edx,al
  807ca0:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  807ca4:	8b 05 96 22 00 00    	mov    eax,DWORD PTR [rip+0x2296]        # 809f40 <clu_sec_balance>
  807caa:	01 c1                	add    ecx,eax
  807cac:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807cb0:	89 ce                	mov    esi,ecx
  807cb2:	48 89 c7             	mov    rdi,rax
  807cb5:	e8 04 fc ff ff       	call   8078be <read_sec>
        }
    }while(cluster<FAT_EOF);
  807cba:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  807cbf:	0f 86 39 ff ff ff    	jbe    807bfe <find+0x72>
    return -1;
  807cc5:	b8 ff ff ff ff       	mov    eax,0xffffffff

}
  807cca:	c9                   	leave  
  807ccb:	c3                   	ret    

0000000000807ccc <read_file_byname>:

int read_file_byname(char *full_name,char *dist,int pos,int len)
{
  807ccc:	f3 0f 1e fa          	endbr64 
  807cd0:	55                   	push   rbp
  807cd1:	48 89 e5             	mov    rbp,rsp
  807cd4:	41 57                	push   r15
  807cd6:	41 56                	push   r14
  807cd8:	41 55                	push   r13
  807cda:	41 54                	push   r12
  807cdc:	53                   	push   rbx
  807cdd:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  807ce4:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  807ceb:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  807cf2:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  807cf8:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  807cfe:	48 89 e0             	mov    rax,rsp
  807d01:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  807d04:	bf 00 00 00 00       	mov    edi,0x0
  807d09:	e8 7e fe ff ff       	call   807b8c <find>
  807d0e:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  807d11:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  807d15:	74 09                	je     807d20 <read_file_byname+0x54>
  807d17:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  807d1e:	79 0a                	jns    807d2a <read_file_byname+0x5e>
        return -1;
  807d20:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807d25:	e9 ea 02 00 00       	jmp    808014 <read_file_byname+0x348>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  807d2a:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  807d31:	48 c7 45 c0 a0 88 42 	mov    QWORD PTR [rbp-0x40],0x4288a0
  807d38:	00 
    int in_root=1;
  807d39:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  807d40:	0f b7 05 73 4b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24b73]        # 42c8ba <cur_dir+0x1a>
  807d47:	66 85 c0             	test   ax,ax
  807d4a:	74 40                	je     807d8c <read_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  807d4c:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  807d53:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  807d5a:	0f b6 05 0c 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20b0c]        # 42886d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  807d61:	0f b6 c0             	movzx  eax,al
  807d64:	0f b7 15 4f 4b c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc24b4f]        # 42c8ba <cur_dir+0x1a>
  807d6b:	0f b7 ca             	movzx  ecx,dx
  807d6e:	8b 15 cc 21 00 00    	mov    edx,DWORD PTR [rip+0x21cc]        # 809f40 <clu_sec_balance>
  807d74:	01 d1                	add    ecx,edx
  807d76:	89 c2                	mov    edx,eax
  807d78:	89 ce                	mov    esi,ecx
  807d7a:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807d7f:	e8 3a fb ff ff       	call   8078be <read_sec>
        dir_table=a_clu_of_dir;
  807d84:	48 c7 45 c0 c0 c8 42 	mov    QWORD PTR [rbp-0x40],0x42c8c0
  807d8b:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  807d8c:	0f b7 05 27 4b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24b27]        # 42c8ba <cur_dir+0x1a>
  807d93:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  807d97:	eb 41                	jmp    807dda <read_file_byname+0x10e>
        index-=16;
  807d99:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  807d9d:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  807da2:	77 36                	ja     807dda <read_file_byname+0x10e>
        {
            cluster=fat[cluster];
  807da4:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  807da8:	48 98                	cdqe   
  807daa:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807db1:	00 
  807db2:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807db6:	0f b6 05 b0 0a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20ab0]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807dbd:	0f b6 d0             	movzx  edx,al
  807dc0:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  807dc4:	8b 05 76 21 00 00    	mov    eax,DWORD PTR [rip+0x2176]        # 809f40 <clu_sec_balance>
  807dca:	01 c1                	add    ecx,eax
  807dcc:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807dd0:	89 ce                	mov    esi,ecx
  807dd2:	48 89 c7             	mov    rdi,rax
  807dd5:	e8 e4 fa ff ff       	call   8078be <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  807dda:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  807dde:	75 0d                	jne    807ded <read_file_byname+0x121>
  807de0:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  807de4:	7e 07                	jle    807ded <read_file_byname+0x121>
  807de6:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  807deb:	76 ac                	jbe    807d99 <read_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  807ded:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  807df0:	48 98                	cdqe   
  807df2:	48 c1 e0 05          	shl    rax,0x5
  807df6:	48 89 c2             	mov    rdx,rax
  807df9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807dfd:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807e01:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  807e04:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  807e08:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  807e0f:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  807e16:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  807e1a:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  807e1e:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  807e22:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  807e26:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  807e2a:	0f b7 c0             	movzx  eax,ax
  807e2d:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  807e30:	0f b7 05 34 0a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20a34]        # 42886b <superblock+0xb>
  807e37:	0f b7 d0             	movzx  edx,ax
  807e3a:	0f b6 05 2c 0a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20a2c]        # 42886d <superblock+0xd>
  807e41:	0f b6 c0             	movzx  eax,al
  807e44:	0f af c2             	imul   eax,edx
  807e47:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  807e4a:	eb 25                	jmp    807e71 <read_file_byname+0x1a5>
    {
        pos-=cluster_size;
  807e4c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807e4f:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        f_cluster=fat[f_cluster];
  807e55:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807e58:	48 98                	cdqe   
  807e5a:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807e61:	00 
  807e62:	98                   	cwde   
  807e63:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        if(pos<cluster_size)
  807e66:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807e6c:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  807e6f:	7c 0d                	jl     807e7e <read_file_byname+0x1b2>
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  807e71:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807e77:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  807e7a:	7d d0                	jge    807e4c <read_file_byname+0x180>
  807e7c:	eb 01                	jmp    807e7f <read_file_byname+0x1b3>
            break;
  807e7e:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  807e7f:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  807e86:	7e 15                	jle    807e9d <read_file_byname+0x1d1>
  807e88:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807e8e:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  807e91:	7c 0a                	jl     807e9d <read_file_byname+0x1d1>
        return -1;//pos out of range
  807e93:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807e98:	e9 77 01 00 00       	jmp    808014 <read_file_byname+0x348>
    //
    char temp[cluster_size];
  807e9d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807ea0:	48 63 d0             	movsxd rdx,eax
  807ea3:	48 83 ea 01          	sub    rdx,0x1
  807ea7:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  807eab:	48 63 d0             	movsxd rdx,eax
  807eae:	49 89 d6             	mov    r14,rdx
  807eb1:	41 bf 00 00 00 00    	mov    r15d,0x0
  807eb7:	48 63 d0             	movsxd rdx,eax
  807eba:	49 89 d4             	mov    r12,rdx
  807ebd:	41 bd 00 00 00 00    	mov    r13d,0x0
  807ec3:	48 98                	cdqe   
  807ec5:	ba 10 00 00 00       	mov    edx,0x10
  807eca:	48 83 ea 01          	sub    rdx,0x1
  807ece:	48 01 d0             	add    rax,rdx
  807ed1:	be 10 00 00 00       	mov    esi,0x10
  807ed6:	ba 00 00 00 00       	mov    edx,0x0
  807edb:	48 f7 f6             	div    rsi
  807ede:	48 6b c0 10          	imul   rax,rax,0x10
  807ee2:	48 89 c1             	mov    rcx,rax
  807ee5:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  807eec:	48 89 e2             	mov    rdx,rsp
  807eef:	48 29 ca             	sub    rdx,rcx
  807ef2:	48 39 d4             	cmp    rsp,rdx
  807ef5:	74 12                	je     807f09 <read_file_byname+0x23d>
  807ef7:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  807efe:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  807f05:	00 00 
  807f07:	eb e9                	jmp    807ef2 <read_file_byname+0x226>
  807f09:	48 89 c2             	mov    rdx,rax
  807f0c:	81 e2 ff 0f 00 00    	and    edx,0xfff
  807f12:	48 29 d4             	sub    rsp,rdx
  807f15:	48 89 c2             	mov    rdx,rax
  807f18:	81 e2 ff 0f 00 00    	and    edx,0xfff
  807f1e:	48 85 d2             	test   rdx,rdx
  807f21:	74 10                	je     807f33 <read_file_byname+0x267>
  807f23:	25 ff 0f 00 00       	and    eax,0xfff
  807f28:	48 83 e8 08          	sub    rax,0x8
  807f2c:	48 01 e0             	add    rax,rsp
  807f2f:	48 83 08 00          	or     QWORD PTR [rax],0x0
  807f33:	48 89 e0             	mov    rax,rsp
  807f36:	48 83 c0 00          	add    rax,0x0
  807f3a:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of reading might be not aligned
    read_sec(temp,f_cluster+clu_sec_balance,superblock.secPerClu);
  807f3e:	0f b6 05 28 09 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20928]        # 42886d <superblock+0xd>
  807f45:	0f b6 d0             	movzx  edx,al
  807f48:	8b 0d f2 1f 00 00    	mov    ecx,DWORD PTR [rip+0x1ff2]        # 809f40 <clu_sec_balance>
  807f4e:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807f51:	01 c1                	add    ecx,eax
  807f53:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807f57:	89 ce                	mov    esi,ecx
  807f59:	48 89 c7             	mov    rdi,rax
  807f5c:	e8 5d f9 ff ff       	call   8078be <read_sec>
    memcpy(dist,temp+pos,cluster_size-pos);
  807f61:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807f64:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  807f6a:	89 c2                	mov    edx,eax
  807f6c:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807f72:	48 63 c8             	movsxd rcx,eax
  807f75:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807f79:	48 01 c1             	add    rcx,rax
  807f7c:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  807f83:	48 89 ce             	mov    rsi,rcx
  807f86:	48 89 c7             	mov    rdi,rax
  807f89:	e8 17 14 00 00       	call   8093a5 <memcpy>
    dist+=cluster_size-pos;
  807f8e:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807f91:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  807f97:	48 98                	cdqe   
  807f99:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
    len-=cluster_size-pos;
  807fa0:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807fa3:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  807fa9:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  807faf:	eb 4c                	jmp    807ffd <read_file_byname+0x331>
    {
        f_cluster=fat[f_cluster];
  807fb1:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807fb4:	48 98                	cdqe   
  807fb6:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807fbd:	00 
  807fbe:	98                   	cwde   
  807fbf:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        read_sec(dist,f_cluster+clu_sec_balance,superblock.secPerClu);
  807fc2:	0f b6 05 a4 08 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc208a4]        # 42886d <superblock+0xd>
  807fc9:	0f b6 d0             	movzx  edx,al
  807fcc:	8b 0d 6e 1f 00 00    	mov    ecx,DWORD PTR [rip+0x1f6e]        # 809f40 <clu_sec_balance>
  807fd2:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807fd5:	01 c1                	add    ecx,eax
  807fd7:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  807fde:	89 ce                	mov    esi,ecx
  807fe0:	48 89 c7             	mov    rdi,rax
  807fe3:	e8 d6 f8 ff ff       	call   8078be <read_sec>
        dist+=cluster_size;
  807fe8:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807feb:	48 98                	cdqe   
  807fed:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  807ff4:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807ff7:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  807ffd:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808004:	7f 09                	jg     80800f <read_file_byname+0x343>
  808006:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  80800d:	7f a2                	jg     807fb1 <read_file_byname+0x2e5>
    }
    return 0;
  80800f:	b8 00 00 00 00       	mov    eax,0x0
  808014:	48 89 dc             	mov    rsp,rbx
    
}
  808017:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  80801b:	5b                   	pop    rbx
  80801c:	41 5c                	pop    r12
  80801e:	41 5d                	pop    r13
  808020:	41 5e                	pop    r14
  808022:	41 5f                	pop    r15
  808024:	5d                   	pop    rbp
  808025:	c3                   	ret    

0000000000808026 <write_file_byname>:
int write_file_byname(char *full_name,char *src,int pos,int len)
{
  808026:	f3 0f 1e fa          	endbr64 
  80802a:	55                   	push   rbp
  80802b:	48 89 e5             	mov    rbp,rsp
  80802e:	41 57                	push   r15
  808030:	41 56                	push   r14
  808032:	41 55                	push   r13
  808034:	41 54                	push   r12
  808036:	53                   	push   rbx
  808037:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  80803e:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  808045:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  80804c:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  808052:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  808058:	48 89 e0             	mov    rax,rsp
  80805b:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  80805e:	bf 00 00 00 00       	mov    edi,0x0
  808063:	e8 24 fb ff ff       	call   807b8c <find>
  808068:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  80806b:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  80806f:	74 09                	je     80807a <write_file_byname+0x54>
  808071:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  808078:	79 0a                	jns    808084 <write_file_byname+0x5e>
        return -1;
  80807a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80807f:	e9 1e 03 00 00       	jmp    8083a2 <write_file_byname+0x37c>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  808084:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  80808b:	48 c7 45 c0 a0 88 42 	mov    QWORD PTR [rbp-0x40],0x4288a0
  808092:	00 
    int in_root=1;
  808093:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  80809a:	0f b7 05 19 48 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24819]        # 42c8ba <cur_dir+0x1a>
  8080a1:	66 85 c0             	test   ax,ax
  8080a4:	74 40                	je     8080e6 <write_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  8080a6:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  8080ad:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  8080b4:	0f b6 05 b2 07 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc207b2]        # 42886d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  8080bb:	0f b6 c0             	movzx  eax,al
  8080be:	0f b7 15 f5 47 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc247f5]        # 42c8ba <cur_dir+0x1a>
  8080c5:	0f b7 ca             	movzx  ecx,dx
  8080c8:	8b 15 72 1e 00 00    	mov    edx,DWORD PTR [rip+0x1e72]        # 809f40 <clu_sec_balance>
  8080ce:	01 d1                	add    ecx,edx
  8080d0:	89 c2                	mov    edx,eax
  8080d2:	89 ce                	mov    esi,ecx
  8080d4:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  8080d9:	e8 e0 f7 ff ff       	call   8078be <read_sec>
        dir_table=a_clu_of_dir;
  8080de:	48 c7 45 c0 c0 c8 42 	mov    QWORD PTR [rbp-0x40],0x42c8c0
  8080e5:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  8080e6:	0f b7 05 cd 47 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc247cd]        # 42c8ba <cur_dir+0x1a>
  8080ed:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  8080f1:	eb 41                	jmp    808134 <write_file_byname+0x10e>
        index-=16;
  8080f3:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  8080f7:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  8080fc:	77 36                	ja     808134 <write_file_byname+0x10e>
        {
            cluster=fat[cluster];
  8080fe:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  808102:	48 98                	cdqe   
  808104:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  80810b:	00 
  80810c:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  808110:	0f b6 05 56 07 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20756]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  808117:	0f b6 d0             	movzx  edx,al
  80811a:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  80811e:	8b 05 1c 1e 00 00    	mov    eax,DWORD PTR [rip+0x1e1c]        # 809f40 <clu_sec_balance>
  808124:	01 c1                	add    ecx,eax
  808126:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80812a:	89 ce                	mov    esi,ecx
  80812c:	48 89 c7             	mov    rdi,rax
  80812f:	e8 8a f7 ff ff       	call   8078be <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  808134:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  808138:	75 0d                	jne    808147 <write_file_byname+0x121>
  80813a:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  80813e:	7e 07                	jle    808147 <write_file_byname+0x121>
  808140:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  808145:	76 ac                	jbe    8080f3 <write_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  808147:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80814a:	48 98                	cdqe   
  80814c:	48 c1 e0 05          	shl    rax,0x5
  808150:	48 89 c2             	mov    rdx,rax
  808153:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808157:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80815b:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  80815e:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808162:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  808169:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  808170:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808174:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808178:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  80817c:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  808180:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  808184:	0f b7 c0             	movzx  eax,ax
  808187:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  80818a:	0f b7 05 da 06 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc206da]        # 42886b <superblock+0xb>
  808191:	0f b7 d0             	movzx  edx,ax
  808194:	0f b6 05 d2 06 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc206d2]        # 42886d <superblock+0xd>
  80819b:	0f b6 c0             	movzx  eax,al
  80819e:	0f af c2             	imul   eax,edx
  8081a1:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  8081a4:	eb 25                	jmp    8081cb <write_file_byname+0x1a5>
    {
        pos-=cluster_size;
  8081a6:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8081a9:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        if(pos<cluster_size)
  8081af:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8081b5:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8081b8:	7c 1e                	jl     8081d8 <write_file_byname+0x1b2>
            break;
        f_cluster=fat[f_cluster];
  8081ba:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8081bd:	48 98                	cdqe   
  8081bf:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8081c6:	00 
  8081c7:	98                   	cwde   
  8081c8:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  8081cb:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8081d1:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8081d4:	7d d0                	jge    8081a6 <write_file_byname+0x180>
  8081d6:	eb 01                	jmp    8081d9 <write_file_byname+0x1b3>
            break;
  8081d8:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  8081d9:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  8081e0:	7e 15                	jle    8081f7 <write_file_byname+0x1d1>
  8081e2:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8081e8:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8081eb:	7c 0a                	jl     8081f7 <write_file_byname+0x1d1>
        return -1;//pos out of range
  8081ed:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8081f2:	e9 ab 01 00 00       	jmp    8083a2 <write_file_byname+0x37c>
    //
    char temp[cluster_size];
  8081f7:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8081fa:	48 63 d0             	movsxd rdx,eax
  8081fd:	48 83 ea 01          	sub    rdx,0x1
  808201:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  808205:	48 63 d0             	movsxd rdx,eax
  808208:	49 89 d6             	mov    r14,rdx
  80820b:	41 bf 00 00 00 00    	mov    r15d,0x0
  808211:	48 63 d0             	movsxd rdx,eax
  808214:	49 89 d4             	mov    r12,rdx
  808217:	41 bd 00 00 00 00    	mov    r13d,0x0
  80821d:	48 98                	cdqe   
  80821f:	ba 10 00 00 00       	mov    edx,0x10
  808224:	48 83 ea 01          	sub    rdx,0x1
  808228:	48 01 d0             	add    rax,rdx
  80822b:	be 10 00 00 00       	mov    esi,0x10
  808230:	ba 00 00 00 00       	mov    edx,0x0
  808235:	48 f7 f6             	div    rsi
  808238:	48 6b c0 10          	imul   rax,rax,0x10
  80823c:	48 89 c1             	mov    rcx,rax
  80823f:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  808246:	48 89 e2             	mov    rdx,rsp
  808249:	48 29 ca             	sub    rdx,rcx
  80824c:	48 39 d4             	cmp    rsp,rdx
  80824f:	74 12                	je     808263 <write_file_byname+0x23d>
  808251:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  808258:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  80825f:	00 00 
  808261:	eb e9                	jmp    80824c <write_file_byname+0x226>
  808263:	48 89 c2             	mov    rdx,rax
  808266:	81 e2 ff 0f 00 00    	and    edx,0xfff
  80826c:	48 29 d4             	sub    rsp,rdx
  80826f:	48 89 c2             	mov    rdx,rax
  808272:	81 e2 ff 0f 00 00    	and    edx,0xfff
  808278:	48 85 d2             	test   rdx,rdx
  80827b:	74 10                	je     80828d <write_file_byname+0x267>
  80827d:	25 ff 0f 00 00       	and    eax,0xfff
  808282:	48 83 e8 08          	sub    rax,0x8
  808286:	48 01 e0             	add    rax,rsp
  808289:	48 83 08 00          	or     QWORD PTR [rax],0x0
  80828d:	48 89 e0             	mov    rax,rsp
  808290:	48 83 c0 00          	add    rax,0x0
  808294:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of writing might not be aligned
    if(pos>0)
  808298:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  80829f:	0f 8e a2 00 00 00    	jle    808347 <write_file_byname+0x321>
    {
        memcpy(temp+pos,src,cluster_size-pos);
  8082a5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8082a8:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  8082ae:	89 c2                	mov    edx,eax
  8082b0:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8082b6:	48 63 c8             	movsxd rcx,eax
  8082b9:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8082bd:	48 01 c1             	add    rcx,rax
  8082c0:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8082c7:	48 89 c6             	mov    rsi,rax
  8082ca:	48 89 cf             	mov    rdi,rcx
  8082cd:	e8 d3 10 00 00       	call   8093a5 <memcpy>
        write_sec(temp,f_cluster,cluster_size-pos);
  8082d2:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8082d5:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  8082db:	89 c2                	mov    edx,eax
  8082dd:	8b 4d b4             	mov    ecx,DWORD PTR [rbp-0x4c]
  8082e0:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8082e4:	89 ce                	mov    esi,ecx
  8082e6:	48 89 c7             	mov    rdi,rax
  8082e9:	e8 dc ee ff ff       	call   8071ca <write_sec>
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  8082ee:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8082f1:	48 98                	cdqe   
  8082f3:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8082fa:	00 
  8082fb:	98                   	cwde   
  8082fc:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    }
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  8082ff:	eb 46                	jmp    808347 <write_file_byname+0x321>
    {
        write_sec(src,f_cluster+clu_sec_balance,cluster_size);
  808301:	8b 15 39 1c 00 00    	mov    edx,DWORD PTR [rip+0x1c39]        # 809f40 <clu_sec_balance>
  808307:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80830a:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80830d:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  808310:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  808317:	89 ce                	mov    esi,ecx
  808319:	48 89 c7             	mov    rdi,rax
  80831c:	e8 a9 ee ff ff       	call   8071ca <write_sec>
        src+=cluster_size;
  808321:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808324:	48 98                	cdqe   
  808326:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  80832d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808330:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  808336:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808339:	48 98                	cdqe   
  80833b:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808342:	00 
  808343:	98                   	cwde   
  808344:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  808347:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  80834e:	7f 0b                	jg     80835b <write_file_byname+0x335>
  808350:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa8]
  808356:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808359:	7d a6                	jge    808301 <write_file_byname+0x2db>
    }
    if(len>0)
  80835b:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  808362:	7e 39                	jle    80839d <write_file_byname+0x377>
    {
        //there might be some leftover less than a cluster
        memcpy(temp,src,len);
  808364:	8b 95 58 ff ff ff    	mov    edx,DWORD PTR [rbp-0xa8]
  80836a:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  808371:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808375:	48 89 ce             	mov    rsi,rcx
  808378:	48 89 c7             	mov    rdi,rax
  80837b:	e8 25 10 00 00       	call   8093a5 <memcpy>
        write_sec(temp,f_cluster+clu_sec_balance,cluster_size);
  808380:	8b 15 ba 1b 00 00    	mov    edx,DWORD PTR [rip+0x1bba]        # 809f40 <clu_sec_balance>
  808386:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808389:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80838c:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  80838f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808393:	89 ce                	mov    esi,ecx
  808395:	48 89 c7             	mov    rdi,rax
  808398:	e8 2d ee ff ff       	call   8071ca <write_sec>
    }
    return 0;
  80839d:	b8 00 00 00 00       	mov    eax,0x0
  8083a2:	48 89 dc             	mov    rsp,rbx

}
  8083a5:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  8083a9:	5b                   	pop    rbx
  8083aa:	41 5c                	pop    r12
  8083ac:	41 5d                	pop    r13
  8083ae:	41 5e                	pop    r14
  8083b0:	41 5f                	pop    r15
  8083b2:	5d                   	pop    rbp
  8083b3:	c3                   	ret    

00000000008083b4 <file_exist>:


int file_exist(dir_entry entry)
{
  8083b4:	f3 0f 1e fa          	endbr64 
  8083b8:	55                   	push   rbp
  8083b9:	48 89 e5             	mov    rbp,rsp
    if((unsigned char)entry.name[0]==0xe5u||\
  8083bc:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
  8083c0:	3c e5                	cmp    al,0xe5
  8083c2:	74 08                	je     8083cc <file_exist+0x18>
    (unsigned char)entry.name[0]==0u)
  8083c4:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
    if((unsigned char)entry.name[0]==0xe5u||\
  8083c8:	84 c0                	test   al,al
  8083ca:	75 07                	jne    8083d3 <file_exist+0x1f>
    {
        //printf("file not exist\n");
        return 0;
  8083cc:	b8 00 00 00 00       	mov    eax,0x0
  8083d1:	eb 05                	jmp    8083d8 <file_exist+0x24>

    }
    return 1;
  8083d3:	b8 01 00 00 00       	mov    eax,0x1
}
  8083d8:	5d                   	pop    rbp
  8083d9:	c3                   	ret    

00000000008083da <get_entry>:
int get_entry(driver_args* args)
{
  8083da:	f3 0f 1e fa          	endbr64 
  8083de:	55                   	push   rbp
  8083df:	48 89 e5             	mov    rbp,rsp
  8083e2:	53                   	push   rbx
  8083e3:	48 81 ec e8 00 00 00 	sub    rsp,0xe8
  8083ea:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
    char *name=args->path;
  8083f1:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8083f8:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8083fc:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    dir.fistCluNum=((vfs_dir_entry*)args->cwd)->id;
  808400:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808407:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  80840e:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808411:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    dir_entry entry;
    vfs_dir_entry ret;
    entry.name[0]=0xe5;
  808415:	c6 45 90 e5          	mov    BYTE PTR [rbp-0x70],0xe5

    char *p=name;
  808419:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80841d:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    char nametmp[12];
    int index=-1;
  808421:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [rbp-0x24],0xffffffff
    while(*name!='\0')
  808428:	e9 2c 01 00 00       	jmp    808559 <get_entry+0x17f>
    {
        if(*name=='/')
  80842d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808431:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808434:	3c 2f                	cmp    al,0x2f
  808436:	0f 85 18 01 00 00    	jne    808554 <get_entry+0x17a>
        {
            if(name-p>11)return -1;
  80843c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808440:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  808444:	48 83 f8 0b          	cmp    rax,0xb
  808448:	7e 0a                	jle    808454 <get_entry+0x7a>
  80844a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80844f:	e9 50 02 00 00       	jmp    8086a4 <get_entry+0x2ca>
            memcpy(nametmp,p,name-p);
  808454:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808458:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  80845c:	89 c2                	mov    edx,eax
  80845e:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  808462:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  808469:	48 89 ce             	mov    rsi,rcx
  80846c:	48 89 c7             	mov    rdi,rax
  80846f:	e8 31 0f 00 00       	call   8093a5 <memcpy>
            cur_dir=dir;
  808474:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808478:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80847c:	48 89 05 1d 44 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2441d],rax        # 42c8a0 <cur_dir>
  808483:	48 89 15 1e 44 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2441e],rdx        # 42c8a8 <cur_dir+0x8>
  80848a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80848e:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808492:	48 89 05 17 44 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc24417],rax        # 42c8b0 <cur_dir+0x10>
  808499:	48 89 15 18 44 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc24418],rdx        # 42c8b8 <cur_dir+0x18>
            format_name(nametmp);
  8084a0:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  8084a7:	48 89 c7             	mov    rdi,rax
  8084aa:	e8 c3 eb ff ff       	call   807072 <format_name>
            index= find(nametmp);
  8084af:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  8084b6:	48 89 c7             	mov    rdi,rax
  8084b9:	e8 ce f6 ff ff       	call   807b8c <find>
  8084be:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            if(index==-1)return -1;
  8084c1:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  8084c5:	75 0a                	jne    8084d1 <get_entry+0xf7>
  8084c7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8084cc:	e9 d3 01 00 00       	jmp    8086a4 <get_entry+0x2ca>
            if(cur_dir.fistCluNum==0)//在根目录
  8084d1:	0f b7 05 e2 43 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc243e2]        # 42c8ba <cur_dir+0x1a>
  8084d8:	66 85 c0             	test   ax,ax
  8084db:	75 31                	jne    80850e <get_entry+0x134>
                dir=root_dir[index];
  8084dd:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8084e0:	48 98                	cdqe   
  8084e2:	48 c1 e0 05          	shl    rax,0x5
  8084e6:	48 8d 88 a0 88 42 00 	lea    rcx,[rax+0x4288a0]
  8084ed:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8084f0:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  8084f4:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  8084f8:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  8084fc:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808500:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808504:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  808508:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  80850c:	eb 3a                	jmp    808548 <get_entry+0x16e>
            else//在子目录
                dir=a_clu_of_dir[index%16];
  80850e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808511:	99                   	cdq    
  808512:	c1 ea 1c             	shr    edx,0x1c
  808515:	01 d0                	add    eax,edx
  808517:	83 e0 0f             	and    eax,0xf
  80851a:	29 d0                	sub    eax,edx
  80851c:	48 98                	cdqe   
  80851e:	48 c1 e0 05          	shl    rax,0x5
  808522:	48 8d 88 c0 c8 42 00 	lea    rcx,[rax+0x42c8c0]
  808529:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  80852c:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808530:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  808534:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  808538:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  80853c:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808540:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  808544:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
            p=name+1;
  808548:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80854c:	48 83 c0 01          	add    rax,0x1
  808550:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        }
        name++;
  808554:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
    while(*name!='\0')
  808559:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80855d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808560:	84 c0                	test   al,al
  808562:	0f 85 c5 fe ff ff    	jne    80842d <get_entry+0x53>
    }

    //现在就可以开始找文件了
    format_name(p);
  808568:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80856c:	48 89 c7             	mov    rdi,rax
  80856f:	e8 fe ea ff ff       	call   807072 <format_name>
    index= find(p);
  808574:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808578:	48 89 c7             	mov    rdi,rax
  80857b:	e8 0c f6 ff ff       	call   807b8c <find>
  808580:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    if(index==-1)return -1;
  808583:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  808587:	75 0a                	jne    808593 <get_entry+0x1b9>
  808589:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80858e:	e9 11 01 00 00       	jmp    8086a4 <get_entry+0x2ca>
    
    if(cur_dir.fistCluNum==0)//在根目录
  808593:	0f b7 05 20 43 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24320]        # 42c8ba <cur_dir+0x1a>
  80859a:	66 85 c0             	test   ax,ax
  80859d:	75 31                	jne    8085d0 <get_entry+0x1f6>
        entry=root_dir[index];
  80859f:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8085a2:	48 98                	cdqe   
  8085a4:	48 c1 e0 05          	shl    rax,0x5
  8085a8:	48 8d 88 a0 88 42 00 	lea    rcx,[rax+0x4288a0]
  8085af:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8085b2:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  8085b6:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  8085ba:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  8085be:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8085c2:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  8085c6:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  8085ca:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  8085ce:	eb 3a                	jmp    80860a <get_entry+0x230>
    else//在子目录
        entry=a_clu_of_dir[index%16];
  8085d0:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8085d3:	99                   	cdq    
  8085d4:	c1 ea 1c             	shr    edx,0x1c
  8085d7:	01 d0                	add    eax,edx
  8085d9:	83 e0 0f             	and    eax,0xf
  8085dc:	29 d0                	sub    eax,edx
  8085de:	48 98                	cdqe   
  8085e0:	48 c1 e0 05          	shl    rax,0x5
  8085e4:	48 8d 88 c0 c8 42 00 	lea    rcx,[rax+0x42c8c0]
  8085eb:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8085ee:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  8085f2:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  8085f6:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  8085fa:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8085fe:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808602:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  808606:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
    ret.id=entry.fistCluNum;
  80860a:	0f b7 45 aa          	movzx  eax,WORD PTR [rbp-0x56]
  80860e:	0f b7 c0             	movzx  eax,ax
  808611:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    args->entry=ret;
  808617:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80861e:	48 8b 8d 30 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd0]
  808625:	48 8b 9d 38 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xc8]
  80862c:	48 89 48 28          	mov    QWORD PTR [rax+0x28],rcx
  808630:	48 89 58 30          	mov    QWORD PTR [rax+0x30],rbx
  808634:	48 8b 8d 40 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xc0]
  80863b:	48 8b 9d 48 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xb8]
  808642:	48 89 48 38          	mov    QWORD PTR [rax+0x38],rcx
  808646:	48 89 58 40          	mov    QWORD PTR [rax+0x40],rbx
  80864a:	48 8b 8d 50 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb0]
  808651:	48 8b 9d 58 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xa8]
  808658:	48 89 48 48          	mov    QWORD PTR [rax+0x48],rcx
  80865c:	48 89 58 50          	mov    QWORD PTR [rax+0x50],rbx
  808660:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  808667:	48 8b 9d 68 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x98]
  80866e:	48 89 48 58          	mov    QWORD PTR [rax+0x58],rcx
  808672:	48 89 58 60          	mov    QWORD PTR [rax+0x60],rbx
  808676:	48 8b 8d 70 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x90]
  80867d:	48 8b 9d 78 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x88]
  808684:	48 89 48 68          	mov    QWORD PTR [rax+0x68],rcx
  808688:	48 89 58 70          	mov    QWORD PTR [rax+0x70],rbx
  80868c:	48 8b 4d 80          	mov    rcx,QWORD PTR [rbp-0x80]
  808690:	48 8b 5d 88          	mov    rbx,QWORD PTR [rbp-0x78]
  808694:	48 89 48 78          	mov    QWORD PTR [rax+0x78],rcx
  808698:	48 89 98 80 00 00 00 	mov    QWORD PTR [rax+0x80],rbx
    return 0;
  80869f:	b8 00 00 00 00       	mov    eax,0x0
}
  8086a4:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8086a8:	c9                   	leave  
  8086a9:	c3                   	ret    

00000000008086aa <get_fname>:
        dir=strtok(NULL,'/');
    }
    return 0;
}*/
void get_fname(char *path,char *name)
{
  8086aa:	f3 0f 1e fa          	endbr64 
  8086ae:	55                   	push   rbp
  8086af:	48 89 e5             	mov    rbp,rsp
  8086b2:	48 83 ec 20          	sub    rsp,0x20
  8086b6:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8086ba:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    char *prev,*ptr=strtok(path,'/');
  8086be:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086c2:	be 2f 00 00 00       	mov    esi,0x2f
  8086c7:	48 89 c7             	mov    rdi,rax
  8086ca:	e8 18 0e 00 00       	call   8094e7 <strtok>
  8086cf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  8086d3:	eb 1b                	jmp    8086f0 <get_fname+0x46>
    {
        prev=ptr;
  8086d5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8086d9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        ptr=strtok(NULL,'/');
  8086dd:	be 2f 00 00 00       	mov    esi,0x2f
  8086e2:	bf 00 00 00 00       	mov    edi,0x0
  8086e7:	e8 fb 0d 00 00       	call   8094e7 <strtok>
  8086ec:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  8086f0:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8086f5:	75 de                	jne    8086d5 <get_fname+0x2b>
    }
    strcpy(name,prev);
  8086f7:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8086fb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8086ff:	48 89 d6             	mov    rsi,rdx
  808702:	48 89 c7             	mov    rdi,rax
  808705:	e8 99 0d 00 00       	call   8094a3 <strcpy>
}
  80870a:	90                   	nop
  80870b:	c9                   	leave  
  80870c:	c3                   	ret    

000000000080870d <read_file>:
char buf[1024];
int read_file(driver_args* args)
{
  80870d:	f3 0f 1e fa          	endbr64 
  808711:	55                   	push   rbp
  808712:	48 89 e5             	mov    rbp,rsp
  808715:	48 83 ec 60          	sub    rsp,0x60
  808719:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    int len=args->len;
  80871d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808721:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808724:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int pos=args->pos;
  808727:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80872b:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  80872e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  808731:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808735:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  808738:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    char* dist=args->dist_addr;
  80873c:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808740:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808743:	48 98                	cdqe   
  808745:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int c=len/superblock.bytesPerSec;
  808749:	0f b7 05 1b 01 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2011b]        # 42886b <superblock+0xb>
  808750:	0f b7 f0             	movzx  esi,ax
  808753:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808756:	99                   	cdq    
  808757:	f7 fe                	idiv   esi
  808759:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    c+=len%superblock.bytesPerSec?1:0;
  80875c:	0f b7 05 08 01 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20108]        # 42886b <superblock+0xb>
  808763:	0f b7 c8             	movzx  ecx,ax
  808766:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808769:	99                   	cdq    
  80876a:	f7 f9                	idiv   ecx
  80876c:	89 d0                	mov    eax,edx
  80876e:	85 c0                	test   eax,eax
  808770:	0f 95 c0             	setne  al
  808773:	0f b6 c0             	movzx  eax,al
  808776:	01 45 dc             	add    DWORD PTR [rbp-0x24],eax
    //printf("[fs]%d secs to sys_read.\n",c);
    int n=0;
  808779:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808780:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  808784:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    int mpos=pos/superblock.bytesPerSec;
  808788:	0f b7 05 dc 00 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc200dc]        # 42886b <superblock+0xb>
  80878f:	0f b7 f8             	movzx  edi,ax
  808792:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808795:	99                   	cdq    
  808796:	f7 ff                	idiv   edi
  808798:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  80879b:	eb 16                	jmp    8087b3 <read_file+0xa6>
    {
         clu=fat[clu];
  80879d:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  8087a1:	48 98                	cdqe   
  8087a3:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8087aa:	00 
  8087ab:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  8087af:	83 6d e4 01          	sub    DWORD PTR [rbp-0x1c],0x1
  8087b3:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  8087b8:	77 06                	ja     8087c0 <read_file+0xb3>
  8087ba:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  8087be:	7f dd                	jg     80879d <read_file+0x90>
    }
    if(mpos>0)return -1;//读取位置超出范围
  8087c0:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  8087c4:	7e 0a                	jle    8087d0 <read_file+0xc3>
  8087c6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8087cb:	e9 cd 00 00 00       	jmp    80889d <read_file+0x190>
    pos%=superblock.bytesPerSec;
  8087d0:	0f b7 05 94 00 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20094]        # 42886b <superblock+0xb>
  8087d7:	0f b7 c8             	movzx  ecx,ax
  8087da:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8087dd:	99                   	cdq    
  8087de:	f7 f9                	idiv   ecx
  8087e0:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
    int block_size=superblock.secPerClu*superblock.bytesPerSec;
  8087e3:	0f b6 05 83 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20083]        # 42886d <superblock+0xd>
  8087ea:	0f b6 d0             	movzx  edx,al
  8087ed:	0f b7 05 77 00 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20077]        # 42886b <superblock+0xb>
  8087f4:	0f b7 c0             	movzx  eax,ax
  8087f7:	0f af c2             	imul   eax,edx
  8087fa:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    while(n<c)
  8087fd:	e9 89 00 00 00       	jmp    80888b <read_file+0x17e>
    {
        read_sec(buf,clu+clu_sec_balance,superblock.secPerClu);
  808802:	0f b6 05 64 00 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20064]        # 42886d <superblock+0xd>
  808809:	0f b6 c0             	movzx  eax,al
  80880c:	0f b7 4d ea          	movzx  ecx,WORD PTR [rbp-0x16]
  808810:	8b 15 2a 17 00 00    	mov    edx,DWORD PTR [rip+0x172a]        # 809f40 <clu_sec_balance>
  808816:	01 d1                	add    ecx,edx
  808818:	89 c2                	mov    edx,eax
  80881a:	89 ce                	mov    esi,ecx
  80881c:	bf e0 0a 43 00       	mov    edi,0x430ae0
  808821:	e8 98 f0 ff ff       	call   8078be <read_sec>
        //printf("%x+%x\n",buf,pos);
        int cplen=block_size-pos>len?len:block_size-pos;
  808826:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  808829:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  80882c:	8b 55 e0             	mov    edx,DWORD PTR [rbp-0x20]
  80882f:	39 c2                	cmp    edx,eax
  808831:	0f 4e c2             	cmovle eax,edx
  808834:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
        memcpy(dist,buf+pos,cplen);
  808837:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80883a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80883d:	48 98                	cdqe   
  80883f:	48 8d 88 e0 0a 43 00 	lea    rcx,[rax+0x430ae0]
  808846:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80884a:	48 89 ce             	mov    rsi,rcx
  80884d:	48 89 c7             	mov    rdi,rax
  808850:	e8 50 0b 00 00       	call   8093a5 <memcpy>
        n++;
  808855:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        dist+=block_size-pos;
  808859:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  80885c:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  80885f:	48 98                	cdqe   
  808861:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        if(pos>0)pos=0;
  808865:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808869:	7e 07                	jle    808872 <read_file+0x165>
  80886b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        clu=fat[clu];
  808872:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808876:	48 98                	cdqe   
  808878:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  80887f:	00 
  808880:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  808884:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808889:	77 0e                	ja     808899 <read_file+0x18c>
    while(n<c)
  80888b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80888e:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  808891:	0f 8c 6b ff ff ff    	jl     808802 <read_file+0xf5>
  808897:	eb 01                	jmp    80889a <read_file+0x18d>
        if(clu>=FAT_EOF)break;
  808899:	90                   	nop
    }
    return n;
  80889a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
}
  80889d:	c9                   	leave  
  80889e:	c3                   	ret    

000000000080889f <write_file>:
int write_file(driver_args* args)
{
  80889f:	f3 0f 1e fa          	endbr64 
  8088a3:	55                   	push   rbp
  8088a4:	48 89 e5             	mov    rbp,rsp
  8088a7:	48 83 ec 50          	sub    rsp,0x50
  8088ab:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    int len=args->len;
  8088af:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8088b3:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8088b6:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    int pos=args->pos;
  8088b9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8088bd:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8088c0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  8088c3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8088c7:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8088ca:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    char* src=args->src_addr;
  8088ce:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8088d2:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8088d5:	48 98                	cdqe   
  8088d7:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    pos/=superblock.bytesPerSec;
  8088db:	0f b7 05 89 ff c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1ff89]        # 42886b <superblock+0xb>
  8088e2:	0f b7 f0             	movzx  esi,ax
  8088e5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8088e8:	99                   	cdq    
  8088e9:	f7 fe                	idiv   esi
  8088eb:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=len/512+len%512?1:0;
  8088ee:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8088f1:	8d 90 ff 01 00 00    	lea    edx,[rax+0x1ff]
  8088f7:	85 c0                	test   eax,eax
  8088f9:	0f 48 c2             	cmovs  eax,edx
  8088fc:	c1 f8 09             	sar    eax,0x9
  8088ff:	89 c1                	mov    ecx,eax
  808901:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808904:	99                   	cdq    
  808905:	c1 ea 17             	shr    edx,0x17
  808908:	01 d0                	add    eax,edx
  80890a:	25 ff 01 00 00       	and    eax,0x1ff
  80890f:	29 d0                	sub    eax,edx
  808911:	01 c8                	add    eax,ecx
  808913:	85 c0                	test   eax,eax
  808915:	0f 95 c0             	setne  al
  808918:	0f b6 c0             	movzx  eax,al
  80891b:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int n=0;
  80891e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808925:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  808929:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&pos>0;pos--,clu=fat[clu]);
  80892d:	eb 16                	jmp    808945 <write_file+0xa6>
  80892f:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  808933:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808937:	48 98                	cdqe   
  808939:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808940:	00 
  808941:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  808945:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  80894a:	77 06                	ja     808952 <write_file+0xb3>
  80894c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808950:	7f dd                	jg     80892f <write_file+0x90>
    if(pos>0)return -1;//读取位置超出范围
  808952:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808956:	7e 52                	jle    8089aa <write_file+0x10b>
  808958:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80895d:	eb 59                	jmp    8089b8 <write_file+0x119>
    while(n<c)
    {
        write_sec(src,clu+clu_sec_balance,1);
  80895f:	0f b7 55 ea          	movzx  edx,WORD PTR [rbp-0x16]
  808963:	8b 05 d7 15 00 00    	mov    eax,DWORD PTR [rip+0x15d7]        # 809f40 <clu_sec_balance>
  808969:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80896c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808970:	ba 01 00 00 00       	mov    edx,0x1
  808975:	89 ce                	mov    esi,ecx
  808977:	48 89 c7             	mov    rdi,rax
  80897a:	e8 4b e8 ff ff       	call   8071ca <write_sec>
        n++;
  80897f:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        src+=superblock.bytesPerSec;
  808983:	0f b7 05 e1 fe c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1fee1]        # 42886b <superblock+0xb>
  80898a:	0f b7 c0             	movzx  eax,ax
  80898d:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        clu=fat[clu];
  808991:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808995:	48 98                	cdqe   
  808997:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  80899e:	00 
  80899f:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  8089a3:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  8089a8:	77 0a                	ja     8089b4 <write_file+0x115>
    while(n<c)
  8089aa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8089ad:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  8089b0:	7c ad                	jl     80895f <write_file+0xc0>
  8089b2:	eb 01                	jmp    8089b5 <write_file+0x116>
        if(clu>=FAT_EOF)break;
  8089b4:	90                   	nop
    }
    return n;
  8089b5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    
  8089b8:	c9                   	leave  
  8089b9:	c3                   	ret    

00000000008089ba <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  8089ba:	f3 0f 1e fa          	endbr64 
  8089be:	55                   	push   rbp
  8089bf:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  8089c2:	48 8b 05 27 85 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc28527]        # 430ef0 <vpage_base>
  8089c9:	48 05 a0 00 00 00    	add    rax,0xa0
  8089cf:	48 89 05 1a 85 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2851a],rax        # 430ef0 <vpage_base>
    page_boffset+=SCREEN_W*2;
  8089d6:	8b 05 1c 85 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2851c]        # 430ef8 <page_boffset>
  8089dc:	05 a0 00 00 00       	add    eax,0xa0
  8089e1:	89 05 11 85 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28511],eax        # 430ef8 <page_boffset>
    if(vpage_base>=video_end)
  8089e7:	48 8b 15 02 85 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc28502]        # 430ef0 <vpage_base>
  8089ee:	48 8b 05 f3 84 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc284f3]        # 430ee8 <video_end>
  8089f5:	48 39 c2             	cmp    rdx,rax
  8089f8:	72 0e                	jb     808a08 <scrdown+0x4e>
        vpage_base=video_base;
  8089fa:	48 8b 05 df 84 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc284df]        # 430ee0 <video_base>
  808a01:	48 89 05 e8 84 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc284e8],rax        # 430ef0 <vpage_base>
    set_origin();
  808a08:	b8 00 00 00 00       	mov    eax,0x0
  808a0d:	e8 6a 00 00 00       	call   808a7c <set_origin>
}
  808a12:	90                   	nop
  808a13:	5d                   	pop    rbp
  808a14:	c3                   	ret    

0000000000808a15 <scrup>:
void scrup()
{
  808a15:	f3 0f 1e fa          	endbr64 
  808a19:	55                   	push   rbp
  808a1a:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  808a1d:	8b 05 d5 84 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc284d5]        # 430ef8 <page_boffset>
  808a23:	85 c0                	test   eax,eax
  808a25:	75 24                	jne    808a4b <scrup+0x36>
    {
        page_boffset=0;
  808a27:	c7 05 c7 84 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc284c7],0x0        # 430ef8 <page_boffset>
  808a2e:	00 00 00 
        vpage_base=video_base;
  808a31:	48 8b 05 a8 84 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc284a8]        # 430ee0 <video_base>
  808a38:	48 89 05 b1 84 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc284b1],rax        # 430ef0 <vpage_base>
        set_origin();
  808a3f:	b8 00 00 00 00       	mov    eax,0x0
  808a44:	e8 33 00 00 00       	call   808a7c <set_origin>
        return;
  808a49:	eb 2f                	jmp    808a7a <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  808a4b:	48 8b 05 9e 84 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2849e]        # 430ef0 <vpage_base>
  808a52:	48 2d a0 00 00 00    	sub    rax,0xa0
  808a58:	48 89 05 91 84 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28491],rax        # 430ef0 <vpage_base>
    page_boffset-=SCREEN_W*2;
  808a5f:	8b 05 93 84 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28493]        # 430ef8 <page_boffset>
  808a65:	2d a0 00 00 00       	sub    eax,0xa0
  808a6a:	89 05 88 84 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28488],eax        # 430ef8 <page_boffset>
    set_origin();
  808a70:	b8 00 00 00 00       	mov    eax,0x0
  808a75:	e8 02 00 00 00       	call   808a7c <set_origin>
}
  808a7a:	5d                   	pop    rbp
  808a7b:	c3                   	ret    

0000000000808a7c <set_origin>:
void set_origin(void)
{
  808a7c:	f3 0f 1e fa          	endbr64 
  808a80:	55                   	push   rbp
  808a81:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  808a84:	fa                   	cli    
    outb(port_reg_index,12);
  808a85:	8b 05 7d 84 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2847d]        # 430f08 <port_reg_index>
  808a8b:	0f b7 c0             	movzx  eax,ax
  808a8e:	be 0c 00 00 00       	mov    esi,0xc
  808a93:	89 c7                	mov    edi,eax
  808a95:	e8 66 be ff ff       	call   804900 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  808a9a:	8b 05 58 84 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28458]        # 430ef8 <page_boffset>
  808aa0:	c1 e8 09             	shr    eax,0x9
  808aa3:	0f b6 d0             	movzx  edx,al
  808aa6:	8b 05 60 84 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28460]        # 430f0c <port_reg_v>
  808aac:	0f b7 c0             	movzx  eax,ax
  808aaf:	89 d6                	mov    esi,edx
  808ab1:	89 c7                	mov    edi,eax
  808ab3:	e8 48 be ff ff       	call   804900 <outb>
    outb(port_reg_index,13);
  808ab8:	8b 05 4a 84 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2844a]        # 430f08 <port_reg_index>
  808abe:	0f b7 c0             	movzx  eax,ax
  808ac1:	be 0d 00 00 00       	mov    esi,0xd
  808ac6:	89 c7                	mov    edi,eax
  808ac8:	e8 33 be ff ff       	call   804900 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  808acd:	8b 05 25 84 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28425]        # 430ef8 <page_boffset>
  808ad3:	d1 e8                	shr    eax,1
  808ad5:	0f b6 d0             	movzx  edx,al
  808ad8:	8b 05 2e 84 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2842e]        # 430f0c <port_reg_v>
  808ade:	0f b7 c0             	movzx  eax,ax
  808ae1:	89 d6                	mov    esi,edx
  808ae3:	89 c7                	mov    edi,eax
  808ae5:	e8 16 be ff ff       	call   804900 <outb>
    asm volatile("sti");
  808aea:	fb                   	sti    

}
  808aeb:	90                   	nop
  808aec:	5d                   	pop    rbp
  808aed:	c3                   	ret    

0000000000808aee <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  808aee:	f3 0f 1e fa          	endbr64 
  808af2:	55                   	push   rbp
  808af3:	48 89 e5             	mov    rbp,rsp
  808af6:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  808afa:	be 28 1f 81 00       	mov    esi,0x811f28
  808aff:	bf d4 1d 81 00       	mov    edi,0x811dd4
  808b04:	e8 9a 09 00 00       	call   8094a3 <strcpy>
    strcpy(dev_stdout.name,"stdout");
  808b09:	be 2d 1f 81 00       	mov    esi,0x811f2d
  808b0e:	bf 94 1e 81 00       	mov    edi,0x811e94
  808b13:	e8 8b 09 00 00       	call   8094a3 <strcpy>
    reg_driver(&drv_tty);
  808b18:	bf 20 1d 81 00       	mov    edi,0x811d20
  808b1d:	e8 c7 a0 ff ff       	call   802be9 <reg_driver>
    reg_device(&dev_tty);
  808b22:	bf c0 1d 81 00       	mov    edi,0x811dc0
  808b27:	e8 d5 9d ff ff       	call   802901 <reg_device>
    reg_device(&dev_stdout);
  808b2c:	bf 80 1e 81 00       	mov    edi,0x811e80
  808b31:	e8 cb 9d ff ff       	call   802901 <reg_device>
    unsigned char *vp=0x20000;
  808b36:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  808b3d:	00 
    if(*vp==0x7)
  808b3e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b42:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b45:	3c 07                	cmp    al,0x7
  808b47:	75 36                	jne    808b7f <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  808b49:	c7 05 a9 83 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc283a9],0x0        # 430efc <video_mode>
  808b50:	00 00 00 
        video_base=0xb0000;
  808b53:	48 c7 05 82 83 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28382],0xb0000        # 430ee0 <video_base>
  808b5a:	00 00 0b 00 
        video_end=0xb8000-1;
  808b5e:	48 c7 05 7f 83 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2837f],0xb7fff        # 430ee8 <video_end>
  808b65:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  808b69:	c7 05 95 83 c2 ff b4 	mov    DWORD PTR [rip+0xffffffffffc28395],0x3b4        # 430f08 <port_reg_index>
  808b70:	03 00 00 
        port_reg_v=0x3b5;
  808b73:	c7 05 8f 83 c2 ff b5 	mov    DWORD PTR [rip+0xffffffffffc2838f],0x3b5        # 430f0c <port_reg_v>
  808b7a:	03 00 00 
  808b7d:	eb 61                	jmp    808be0 <init_tty+0xf2>
    }else if(*vp<=0x3)
  808b7f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b83:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b86:	3c 03                	cmp    al,0x3
  808b88:	77 36                	ja     808bc0 <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  808b8a:	c7 05 68 83 c2 ff 01 	mov    DWORD PTR [rip+0xffffffffffc28368],0x1        # 430efc <video_mode>
  808b91:	00 00 00 
        video_base=0xb8000;
  808b94:	48 c7 05 41 83 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28341],0xb8000        # 430ee0 <video_base>
  808b9b:	00 80 0b 00 
        video_end=0xc0000-1;
  808b9f:	48 c7 05 3e 83 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2833e],0xbffff        # 430ee8 <video_end>
  808ba6:	ff ff 0b 00 
        port_reg_index=0x3d4;
  808baa:	c7 05 54 83 c2 ff d4 	mov    DWORD PTR [rip+0xffffffffffc28354],0x3d4        # 430f08 <port_reg_index>
  808bb1:	03 00 00 
        port_reg_v=0x3d5;
  808bb4:	c7 05 4e 83 c2 ff d5 	mov    DWORD PTR [rip+0xffffffffffc2834e],0x3d5        # 430f0c <port_reg_v>
  808bbb:	03 00 00 
  808bbe:	eb 20                	jmp    808be0 <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  808bc0:	c7 05 32 83 c2 ff 02 	mov    DWORD PTR [rip+0xffffffffffc28332],0x2        # 430efc <video_mode>
  808bc7:	00 00 00 
        video_base=0xa0000;
  808bca:	48 c7 05 0b 83 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2830b],0xa0000        # 430ee0 <video_base>
  808bd1:	00 00 0a 00 
        video_end=0xb0000-1;
  808bd5:	48 c7 05 08 83 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28308],0xaffff        # 430ee8 <video_end>
  808bdc:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  808be0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808be4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808be7:	3c 01                	cmp    al,0x1
  808be9:	77 0f                	ja     808bfa <init_tty+0x10c>
  808beb:	c7 05 0f 83 c2 ff 28 	mov    DWORD PTR [rip+0xffffffffffc2830f],0x28        # 430f04 <line_chs>
  808bf2:	00 00 00 
  808bf5:	e9 91 00 00 00       	jmp    808c8b <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  808bfa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808bfe:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c01:	3c 03                	cmp    al,0x3
  808c03:	76 0b                	jbe    808c10 <init_tty+0x122>
  808c05:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c09:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c0c:	3c 07                	cmp    al,0x7
  808c0e:	75 0c                	jne    808c1c <init_tty+0x12e>
  808c10:	c7 05 ea 82 c2 ff 50 	mov    DWORD PTR [rip+0xffffffffffc282ea],0x50        # 430f04 <line_chs>
  808c17:	00 00 00 
  808c1a:	eb 6f                	jmp    808c8b <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  808c1c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c20:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c23:	3c 05                	cmp    al,0x5
  808c25:	76 16                	jbe    808c3d <init_tty+0x14f>
  808c27:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c2b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c2e:	3c 09                	cmp    al,0x9
  808c30:	74 0b                	je     808c3d <init_tty+0x14f>
  808c32:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c36:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c39:	3c 0d                	cmp    al,0xd
  808c3b:	75 0c                	jne    808c49 <init_tty+0x15b>
  808c3d:	c7 05 bd 82 c2 ff 40 	mov    DWORD PTR [rip+0xffffffffffc282bd],0x140        # 430f04 <line_chs>
  808c44:	01 00 00 
  808c47:	eb 42                	jmp    808c8b <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  808c49:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c4d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c50:	3c 06                	cmp    al,0x6
  808c52:	74 16                	je     808c6a <init_tty+0x17c>
  808c54:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c58:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c5b:	3c 0a                	cmp    al,0xa
  808c5d:	74 0b                	je     808c6a <init_tty+0x17c>
  808c5f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c63:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c66:	3c 0d                	cmp    al,0xd
  808c68:	76 0c                	jbe    808c76 <init_tty+0x188>
  808c6a:	c7 05 90 82 c2 ff 80 	mov    DWORD PTR [rip+0xffffffffffc28290],0x280        # 430f04 <line_chs>
  808c71:	02 00 00 
  808c74:	eb 15                	jmp    808c8b <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  808c76:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c7a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c7d:	3c 08                	cmp    al,0x8
  808c7f:	75 0a                	jne    808c8b <init_tty+0x19d>
  808c81:	c7 05 79 82 c2 ff a0 	mov    DWORD PTR [rip+0xffffffffffc28279],0xa0        # 430f04 <line_chs>
  808c88:	00 00 00 
    switch (*vp)
  808c8b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c8f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c92:	0f b6 c0             	movzx  eax,al
  808c95:	83 f8 14             	cmp    eax,0x14
  808c98:	77 61                	ja     808cfb <init_tty+0x20d>
  808c9a:	89 c0                	mov    eax,eax
  808c9c:	48 8b 04 c5 38 1f 81 	mov    rax,QWORD PTR [rax*8+0x811f38]
  808ca3:	00 
  808ca4:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  808ca7:	c7 05 5f 82 c2 ff e8 	mov    DWORD PTR [rip+0xffffffffffc2825f],0x3e8        # 430f10 <vpage_size>
  808cae:	03 00 00 
  808cb1:	eb 49                	jmp    808cfc <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  808cb3:	c7 05 53 82 c2 ff d0 	mov    DWORD PTR [rip+0xffffffffffc28253],0x7d0        # 430f10 <vpage_size>
  808cba:	07 00 00 
  808cbd:	eb 3d                	jmp    808cfc <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  808cbf:	c7 05 47 82 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28247],0xfa00        # 430f10 <vpage_size>
  808cc6:	fa 00 00 
  808cc9:	eb 31                	jmp    808cfc <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  808ccb:	c7 05 3b 82 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2823b],0x1f400        # 430f10 <vpage_size>
  808cd2:	f4 01 00 
  808cd5:	eb 25                	jmp    808cfc <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  808cd7:	c7 05 2f 82 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2822f],0x7d00        # 430f10 <vpage_size>
  808cde:	7d 00 00 
  808ce1:	eb 19                	jmp    808cfc <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  808ce3:	c7 05 23 82 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28223],0x36b00        # 430f10 <vpage_size>
  808cea:	6b 03 00 
  808ced:	eb 0d                	jmp    808cfc <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  808cef:	c7 05 17 82 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28217],0x4b000        # 430f10 <vpage_size>
  808cf6:	b0 04 00 
  808cf9:	eb 01                	jmp    808cfc <init_tty+0x20e>
    default:
        break;
  808cfb:	90                   	nop
    }
    m_ptr=video_base;
  808cfc:	48 8b 05 dd 81 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc281dd]        # 430ee0 <video_base>
  808d03:	48 89 05 3e 12 00 00 	mov    QWORD PTR [rip+0x123e],rax        # 809f48 <m_ptr>
    page_boffset=0;
  808d0a:	c7 05 e4 81 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc281e4],0x0        # 430ef8 <page_boffset>
  808d11:	00 00 00 
    vpage_base=video_base;
  808d14:	48 8b 05 c5 81 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc281c5]        # 430ee0 <video_base>
  808d1b:	48 89 05 ce 81 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc281ce],rax        # 430ef0 <vpage_base>
    vp++;
  808d22:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  808d27:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d2b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d2e:	0f b6 c0             	movzx  eax,al
  808d31:	89 05 c9 81 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc281c9],eax        # 430f00 <vpage>
    vp++;
  808d37:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  808d3c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d40:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808d44:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808d48:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d4b:	0f b6 c0             	movzx  eax,al
  808d4e:	89 05 c8 81 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc281c8],eax        # 430f1c <stline>
    endline=*vp++;
  808d54:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d58:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808d5c:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808d60:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d63:	0f b6 c0             	movzx  eax,al
  808d66:	89 05 b4 81 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc281b4],eax        # 430f20 <endline>
    videoy=*vp++;
  808d6c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d70:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808d74:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808d78:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d7b:	0f b6 c0             	movzx  eax,al
  808d7e:	89 05 94 81 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28194],eax        # 430f18 <videoy>
    videox=*vp;
  808d84:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d88:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d8b:	0f b6 c0             	movzx  eax,al
  808d8e:	89 05 80 81 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28180],eax        # 430f14 <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  808d94:	90                   	nop
  808d95:	c9                   	leave  
  808d96:	c3                   	ret    

0000000000808d97 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  808d97:	f3 0f 1e fa          	endbr64 
  808d9b:	55                   	push   rbp
  808d9c:	48 89 e5             	mov    rbp,rsp
  808d9f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  808da3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808da7:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808daa:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  808dad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808db0:	05 00 c0 05 00       	add    eax,0x5c000
  808db5:	01 c0                	add    eax,eax
  808db7:	48 98                	cdqe   
  808db9:	48 89 05 88 11 00 00 	mov    QWORD PTR [rip+0x1188],rax        # 809f48 <m_ptr>
}
  808dc0:	90                   	nop
  808dc1:	5d                   	pop    rbp
  808dc2:	c3                   	ret    

0000000000808dc3 <tell_monitor>:
int tell_monitor()
{
  808dc3:	f3 0f 1e fa          	endbr64 
  808dc7:	55                   	push   rbp
  808dc8:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  808dcb:	48 8b 05 76 11 00 00 	mov    rax,QWORD PTR [rip+0x1176]        # 809f48 <m_ptr>
  808dd2:	48 8b 15 07 81 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc28107]        # 430ee0 <video_base>
  808dd9:	48 29 d0             	sub    rax,rdx
  808ddc:	48 89 c2             	mov    rdx,rax
  808ddf:	48 c1 ea 3f          	shr    rdx,0x3f
  808de3:	48 01 d0             	add    rax,rdx
  808de6:	48 d1 f8             	sar    rax,1
}
  808de9:	5d                   	pop    rbp
  808dea:	c3                   	ret    

0000000000808deb <del_ch>:
void del_ch()
{
  808deb:	f3 0f 1e fa          	endbr64 
  808def:	55                   	push   rbp
  808df0:	48 89 e5             	mov    rbp,rsp
  808df3:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  808dfa:	48 8b 05 47 11 00 00 	mov    rax,QWORD PTR [rip+0x1147]        # 809f48 <m_ptr>
  808e01:	48 83 e8 02          	sub    rax,0x2
  808e05:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  808e09:	b8 00 00 00 00       	mov    eax,0x0
  808e0e:	e8 b0 ff ff ff       	call   808dc3 <tell_monitor>
  808e13:	89 c2                	mov    edx,eax
  808e15:	48 63 c2             	movsxd rax,edx
  808e18:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  808e1f:	48 c1 e8 20          	shr    rax,0x20
  808e23:	c1 f8 05             	sar    eax,0x5
  808e26:	89 d1                	mov    ecx,edx
  808e28:	c1 f9 1f             	sar    ecx,0x1f
  808e2b:	29 c8                	sub    eax,ecx
  808e2d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  808e30:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  808e33:	89 c8                	mov    eax,ecx
  808e35:	c1 e0 02             	shl    eax,0x2
  808e38:	01 c8                	add    eax,ecx
  808e3a:	c1 e0 04             	shl    eax,0x4
  808e3d:	29 c2                	sub    edx,eax
  808e3f:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  808e42:	eb 17                	jmp    808e5b <del_ch+0x70>
    {
        *p=*(p+2);
  808e44:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e48:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  808e4c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e50:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  808e52:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  808e57:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808e5b:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  808e5f:	7e e3                	jle    808e44 <del_ch+0x59>
    }
    driver_args args= {
  808e61:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  808e68:	b8 00 00 00 00       	mov    eax,0x0
  808e6d:	b9 18 00 00 00       	mov    ecx,0x18
  808e72:	48 89 d7             	mov    rdi,rdx
  808e75:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  808e78:	b8 00 00 00 00       	mov    eax,0x0
  808e7d:	e8 41 ff ff ff       	call   808dc3 <tell_monitor>
  808e82:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  808e85:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  808e8b:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  808e92:	48 89 c7             	mov    rdi,rax
  808e95:	e8 fd fe ff ff       	call   808d97 <seek_tty>
    set_cur();
  808e9a:	b8 00 00 00 00       	mov    eax,0x0
  808e9f:	e8 03 00 00 00       	call   808ea7 <set_cur>
}
  808ea4:	90                   	nop
  808ea5:	c9                   	leave  
  808ea6:	c3                   	ret    

0000000000808ea7 <set_cur>:
void set_cur()
{
  808ea7:	f3 0f 1e fa          	endbr64 
  808eab:	55                   	push   rbp
  808eac:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  808eaf:	fa                   	cli    
    outb(port_reg_index,14);
  808eb0:	8b 05 52 80 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28052]        # 430f08 <port_reg_index>
  808eb6:	0f b7 c0             	movzx  eax,ax
  808eb9:	be 0e 00 00 00       	mov    esi,0xe
  808ebe:	89 c7                	mov    edi,eax
  808ec0:	e8 3b ba ff ff       	call   804900 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  808ec5:	48 8b 05 7c 10 00 00 	mov    rax,QWORD PTR [rip+0x107c]        # 809f48 <m_ptr>
  808ecc:	48 8b 15 0d 80 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc2800d]        # 430ee0 <video_base>
  808ed3:	48 29 d0             	sub    rax,rdx
  808ed6:	48 c1 f8 09          	sar    rax,0x9
  808eda:	0f b6 d0             	movzx  edx,al
  808edd:	8b 05 29 80 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28029]        # 430f0c <port_reg_v>
  808ee3:	0f b7 c0             	movzx  eax,ax
  808ee6:	89 d6                	mov    esi,edx
  808ee8:	89 c7                	mov    edi,eax
  808eea:	e8 11 ba ff ff       	call   804900 <outb>
    outb(port_reg_index,15);
  808eef:	8b 05 13 80 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28013]        # 430f08 <port_reg_index>
  808ef5:	0f b7 c0             	movzx  eax,ax
  808ef8:	be 0f 00 00 00       	mov    esi,0xf
  808efd:	89 c7                	mov    edi,eax
  808eff:	e8 fc b9 ff ff       	call   804900 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  808f04:	48 8b 05 3d 10 00 00 	mov    rax,QWORD PTR [rip+0x103d]        # 809f48 <m_ptr>
  808f0b:	48 8b 15 ce 7f c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27fce]        # 430ee0 <video_base>
  808f12:	48 29 d0             	sub    rax,rdx
  808f15:	48 d1 f8             	sar    rax,1
  808f18:	0f b6 d0             	movzx  edx,al
  808f1b:	8b 05 eb 7f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27feb]        # 430f0c <port_reg_v>
  808f21:	0f b7 c0             	movzx  eax,ax
  808f24:	89 d6                	mov    esi,edx
  808f26:	89 c7                	mov    edi,eax
  808f28:	e8 d3 b9 ff ff       	call   804900 <outb>
    asm volatile("sti");
  808f2d:	fb                   	sti    
}
  808f2e:	90                   	nop
  808f2f:	5d                   	pop    rbp
  808f30:	c3                   	ret    

0000000000808f31 <read_tty>:

int read_tty(driver_args *args)
{
  808f31:	f3 0f 1e fa          	endbr64 
  808f35:	55                   	push   rbp
  808f36:	48 89 e5             	mov    rbp,rsp
  808f39:	48 83 ec 20          	sub    rsp,0x20
  808f3d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  808f41:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808f45:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808f48:	48 98                	cdqe   
  808f4a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  808f4e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808f52:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808f55:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  808f58:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  808f5f:	eb 4a                	jmp    808fab <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  808f61:	48 8b 15 e0 0f 00 00 	mov    rdx,QWORD PTR [rip+0xfe0]        # 809f48 <m_ptr>
  808f68:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f6c:	48 8d 48 01          	lea    rcx,[rax+0x1]
  808f70:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  808f74:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  808f77:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  808f79:	48 8b 05 c8 0f 00 00 	mov    rax,QWORD PTR [rip+0xfc8]        # 809f48 <m_ptr>
  808f80:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  808f86:	75 0d                	jne    808f95 <read_tty+0x64>
  808f88:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808f8c:	7e 07                	jle    808f95 <read_tty+0x64>
        {
            return 1;//读到尾了
  808f8e:	b8 01 00 00 00       	mov    eax,0x1
  808f93:	eb 2d                	jmp    808fc2 <read_tty+0x91>
        }
        m_ptr+=2;
  808f95:	48 8b 05 ac 0f 00 00 	mov    rax,QWORD PTR [rip+0xfac]        # 809f48 <m_ptr>
  808f9c:	48 83 c0 02          	add    rax,0x2
  808fa0:	48 89 05 a1 0f 00 00 	mov    QWORD PTR [rip+0xfa1],rax        # 809f48 <m_ptr>
    for(int i=0;i<len;i++)
  808fa7:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808fab:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808fae:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  808fb1:	7c ae                	jl     808f61 <read_tty+0x30>
    }
    set_cur();
  808fb3:	b8 00 00 00 00       	mov    eax,0x0
  808fb8:	e8 ea fe ff ff       	call   808ea7 <set_cur>
    return 0;
  808fbd:	b8 00 00 00 00       	mov    eax,0x0
}
  808fc2:	c9                   	leave  
  808fc3:	c3                   	ret    

0000000000808fc4 <write_tty>:
int write_tty(driver_args *args)
{
  808fc4:	f3 0f 1e fa          	endbr64 
  808fc8:	55                   	push   rbp
  808fc9:	48 89 e5             	mov    rbp,rsp
  808fcc:	48 83 ec 30          	sub    rsp,0x30
  808fd0:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  808fd4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808fd8:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808fdb:	48 98                	cdqe   
  808fdd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  808fe1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808fe5:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808fe8:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  808feb:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  808ff2:	e9 0b 01 00 00       	jmp    809102 <write_tty+0x13e>
    {
        if(*src=='\n')
  808ff7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ffb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808ffe:	3c 0a                	cmp    al,0xa
  809000:	75 50                	jne    809052 <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  809002:	48 8b 05 3f 0f 00 00 	mov    rax,QWORD PTR [rip+0xf3f]        # 809f48 <m_ptr>
  809009:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  80900f:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  809012:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809015:	89 c2                	mov    edx,eax
  809017:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  80901c:	48 0f af c2          	imul   rax,rdx
  809020:	48 c1 e8 20          	shr    rax,0x20
  809024:	c1 e8 07             	shr    eax,0x7
  809027:	8d 50 01             	lea    edx,[rax+0x1]
  80902a:	89 d0                	mov    eax,edx
  80902c:	c1 e0 02             	shl    eax,0x2
  80902f:	01 d0                	add    eax,edx
  809031:	c1 e0 05             	shl    eax,0x5
  809034:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  809037:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80903a:	05 00 80 0b 00       	add    eax,0xb8000
  80903f:	89 c0                	mov    eax,eax
  809041:	48 89 05 00 0f 00 00 	mov    QWORD PTR [rip+0xf00],rax        # 809f48 <m_ptr>
            src++;
  809048:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  80904d:	e9 ac 00 00 00       	jmp    8090fe <write_tty+0x13a>
        }else if(*src=='\0')
  809052:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809056:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809059:	84 c0                	test   al,al
  80905b:	0f 84 af 00 00 00    	je     809110 <write_tty+0x14c>
            break;
        if(*src=='\b')
  809061:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809065:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809068:	3c 08                	cmp    al,0x8
  80906a:	75 1e                	jne    80908a <write_tty+0xc6>
        {
            m_ptr-=2;
  80906c:	48 8b 05 d5 0e 00 00 	mov    rax,QWORD PTR [rip+0xed5]        # 809f48 <m_ptr>
  809073:	48 83 e8 02          	sub    rax,0x2
  809077:	48 89 05 ca 0e 00 00 	mov    QWORD PTR [rip+0xeca],rax        # 809f48 <m_ptr>
            *m_ptr=0;
  80907e:	48 8b 05 c3 0e 00 00 	mov    rax,QWORD PTR [rip+0xec3]        # 809f48 <m_ptr>
  809085:	c6 00 00             	mov    BYTE PTR [rax],0x0
  809088:	eb 3e                	jmp    8090c8 <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  80908a:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80908e:	48 8d 42 01          	lea    rax,[rdx+0x1]
  809092:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  809096:	48 8b 05 ab 0e 00 00 	mov    rax,QWORD PTR [rip+0xeab]        # 809f48 <m_ptr>
  80909d:	48 8d 48 01          	lea    rcx,[rax+0x1]
  8090a1:	48 89 0d a0 0e 00 00 	mov    QWORD PTR [rip+0xea0],rcx        # 809f48 <m_ptr>
  8090a8:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  8090ab:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  8090ad:	48 8b 05 94 0e 00 00 	mov    rax,QWORD PTR [rip+0xe94]        # 809f48 <m_ptr>
  8090b4:	48 8d 50 01          	lea    rdx,[rax+0x1]
  8090b8:	48 89 15 89 0e 00 00 	mov    QWORD PTR [rip+0xe89],rdx        # 809f48 <m_ptr>
  8090bf:	0f b6 15 8a 0e 00 00 	movzx  edx,BYTE PTR [rip+0xe8a]        # 809f50 <m_color>
  8090c6:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  8090c8:	48 8b 05 79 0e 00 00 	mov    rax,QWORD PTR [rip+0xe79]        # 809f48 <m_ptr>
  8090cf:	48 8b 0d 1a 7e c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc27e1a]        # 430ef0 <vpage_base>
  8090d6:	48 29 c8             	sub    rax,rcx
  8090d9:	48 89 c2             	mov    rdx,rax
  8090dc:	8b 05 2e 7e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27e2e]        # 430f10 <vpage_size>
  8090e2:	8b 0d 1c 7e c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc27e1c]        # 430f04 <line_chs>
  8090e8:	29 c8                	sub    eax,ecx
  8090ea:	01 c0                	add    eax,eax
  8090ec:	48 98                	cdqe   
  8090ee:	48 39 c2             	cmp    rdx,rax
  8090f1:	7c 0b                	jl     8090fe <write_tty+0x13a>
  8090f3:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8090f7:	7e 05                	jle    8090fe <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  8090f9:	e8 bc f8 ff ff       	call   8089ba <scrdown>
    for(int i=0;i<len;i++)
  8090fe:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  809102:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809105:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  809108:	0f 8c e9 fe ff ff    	jl     808ff7 <write_tty+0x33>
  80910e:	eb 01                	jmp    809111 <write_tty+0x14d>
            break;
  809110:	90                   	nop
        }
    }
    set_cur();
  809111:	b8 00 00 00 00       	mov    eax,0x0
  809116:	e8 8c fd ff ff       	call   808ea7 <set_cur>
    return 0;
  80911b:	b8 00 00 00 00       	mov    eax,0x0
}
  809120:	c9                   	leave  
  809121:	c3                   	ret    

0000000000809122 <cls>:

void cls(driver_args *args)
{
  809122:	f3 0f 1e fa          	endbr64 
  809126:	55                   	push   rbp
  809127:	48 89 e5             	mov    rbp,rsp
  80912a:	48 83 ec 20          	sub    rsp,0x20
  80912e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  809132:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809139:	eb 16                	jmp    809151 <cls+0x2f>
    {
        vpage_base[i]=0;
  80913b:	48 8b 15 ae 7d c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27dae]        # 430ef0 <vpage_base>
  809142:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809145:	48 98                	cdqe   
  809147:	48 01 d0             	add    rax,rdx
  80914a:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  80914d:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  809151:	8b 05 b9 7d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27db9]        # 430f10 <vpage_size>
  809157:	01 c0                	add    eax,eax
  809159:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80915c:	7c dd                	jl     80913b <cls+0x19>
    }
    m_ptr=vpage_base;
  80915e:	48 8b 05 8b 7d c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc27d8b]        # 430ef0 <vpage_base>
  809165:	48 89 05 dc 0d 00 00 	mov    QWORD PTR [rip+0xddc],rax        # 809f48 <m_ptr>
    set_cur();
  80916c:	b8 00 00 00 00       	mov    eax,0x0
  809171:	e8 31 fd ff ff       	call   808ea7 <set_cur>
}
  809176:	90                   	nop
  809177:	c9                   	leave  
  809178:	c3                   	ret    

0000000000809179 <set_color>:

void set_color(char color)
{
  809179:	f3 0f 1e fa          	endbr64 
  80917d:	55                   	push   rbp
  80917e:	48 89 e5             	mov    rbp,rsp
  809181:	89 f8                	mov    eax,edi
  809183:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  809186:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80918a:	88 05 c0 0d 00 00    	mov    BYTE PTR [rip+0xdc0],al        # 809f50 <m_color>
}
  809190:	90                   	nop
  809191:	5d                   	pop    rbp
  809192:	c3                   	ret    

0000000000809193 <tty_do_req>:

int tty_do_req(driver_args *args)
{
  809193:	f3 0f 1e fa          	endbr64 
  809197:	55                   	push   rbp
  809198:	48 89 e5             	mov    rbp,rsp
  80919b:	48 83 ec 10          	sub    rsp,0x10
  80919f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  8091a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8091a7:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  8091ad:	83 f8 0d             	cmp    eax,0xd
  8091b0:	74 45                	je     8091f7 <tty_do_req+0x64>
  8091b2:	83 f8 0d             	cmp    eax,0xd
  8091b5:	7f 53                	jg     80920a <tty_do_req+0x77>
  8091b7:	83 f8 0c             	cmp    eax,0xc
  8091ba:	74 2d                	je     8091e9 <tty_do_req+0x56>
  8091bc:	83 f8 0c             	cmp    eax,0xc
  8091bf:	7f 49                	jg     80920a <tty_do_req+0x77>
  8091c1:	83 f8 02             	cmp    eax,0x2
  8091c4:	74 07                	je     8091cd <tty_do_req+0x3a>
  8091c6:	83 f8 03             	cmp    eax,0x3
  8091c9:	74 10                	je     8091db <tty_do_req+0x48>
  8091cb:	eb 3d                	jmp    80920a <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  8091cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8091d1:	48 89 c7             	mov    rdi,rax
  8091d4:	e8 58 fd ff ff       	call   808f31 <read_tty>
        break;
  8091d9:	eb 36                	jmp    809211 <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  8091db:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8091df:	48 89 c7             	mov    rdi,rax
  8091e2:	e8 dd fd ff ff       	call   808fc4 <write_tty>
        break;
  8091e7:	eb 28                	jmp    809211 <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  8091e9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8091ed:	48 89 c7             	mov    rdi,rax
  8091f0:	e8 a2 fb ff ff       	call   808d97 <seek_tty>
        break;
  8091f5:	eb 1a                	jmp    809211 <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  8091f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8091fb:	48 89 c7             	mov    rdi,rax
  8091fe:	b8 00 00 00 00       	mov    eax,0x0
  809203:	e8 bb fb ff ff       	call   808dc3 <tell_monitor>
        break;
  809208:	eb 07                	jmp    809211 <tty_do_req+0x7e>
    default:return -1;
  80920a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80920f:	eb 05                	jmp    809216 <tty_do_req+0x83>
    }
    return 0;
  809211:	b8 00 00 00 00       	mov    eax,0x0
}
  809216:	c9                   	leave  
  809217:	c3                   	ret    

0000000000809218 <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  809218:	f3 0f 1e fa          	endbr64 
  80921c:	55                   	push   rbp
  80921d:	48 89 e5             	mov    rbp,rsp
  809220:	48 83 ec 10          	sub    rsp,0x10
  809224:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  809227:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80922a:	83 c0 01             	add    eax,0x1
  80922d:	0f b7 c0             	movzx  eax,ax
  809230:	be 00 00 00 00       	mov    esi,0x0
  809235:	89 c7                	mov    edi,eax
  809237:	e8 c4 b6 ff ff       	call   804900 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80923c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80923f:	83 c0 03             	add    eax,0x3
  809242:	0f b7 c0             	movzx  eax,ax
  809245:	be 80 00 00 00       	mov    esi,0x80
  80924a:	89 c7                	mov    edi,eax
  80924c:	e8 af b6 ff ff       	call   804900 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  809251:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809254:	0f b7 c0             	movzx  eax,ax
  809257:	be 03 00 00 00       	mov    esi,0x3
  80925c:	89 c7                	mov    edi,eax
  80925e:	e8 9d b6 ff ff       	call   804900 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  809263:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809266:	83 c0 01             	add    eax,0x1
  809269:	0f b7 c0             	movzx  eax,ax
  80926c:	be 00 00 00 00       	mov    esi,0x0
  809271:	89 c7                	mov    edi,eax
  809273:	e8 88 b6 ff ff       	call   804900 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  809278:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80927b:	83 c0 03             	add    eax,0x3
  80927e:	0f b7 c0             	movzx  eax,ax
  809281:	be 03 00 00 00       	mov    esi,0x3
  809286:	89 c7                	mov    edi,eax
  809288:	e8 73 b6 ff ff       	call   804900 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  80928d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809290:	83 c0 02             	add    eax,0x2
  809293:	0f b7 c0             	movzx  eax,ax
  809296:	be c7 00 00 00       	mov    esi,0xc7
  80929b:	89 c7                	mov    edi,eax
  80929d:	e8 5e b6 ff ff       	call   804900 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  8092a2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8092a5:	83 c0 04             	add    eax,0x4
  8092a8:	0f b7 c0             	movzx  eax,ax
  8092ab:	be 0b 00 00 00       	mov    esi,0xb
  8092b0:	89 c7                	mov    edi,eax
  8092b2:	e8 49 b6 ff ff       	call   804900 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  8092b7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8092ba:	83 c0 04             	add    eax,0x4
  8092bd:	0f b7 c0             	movzx  eax,ax
  8092c0:	be 1e 00 00 00       	mov    esi,0x1e
  8092c5:	89 c7                	mov    edi,eax
  8092c7:	e8 34 b6 ff ff       	call   804900 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  8092cc:	b8 61 00 00 00       	mov    eax,0x61
  8092d1:	0f b6 d0             	movzx  edx,al
  8092d4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8092d7:	0f b7 c0             	movzx  eax,ax
  8092da:	89 d6                	mov    esi,edx
  8092dc:	89 c7                	mov    edi,eax
  8092de:	e8 1d b6 ff ff       	call   804900 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  8092e3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8092e6:	0f b6 c0             	movzx  eax,al
  8092e9:	89 c7                	mov    edi,eax
  8092eb:	e8 34 b6 ff ff       	call   804924 <inb>
  8092f0:	0f b6 d0             	movzx  edx,al
  8092f3:	b8 61 00 00 00       	mov    eax,0x61
  8092f8:	0f be c0             	movsx  eax,al
  8092fb:	39 c2                	cmp    edx,eax
  8092fd:	75 17                	jne    809316 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  8092ff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809302:	83 c0 04             	add    eax,0x4
  809305:	0f b7 c0             	movzx  eax,ax
  809308:	be 0f 00 00 00       	mov    esi,0xf
  80930d:	89 c7                	mov    edi,eax
  80930f:	e8 ec b5 ff ff       	call   804900 <outb>
  809314:	eb 01                	jmp    809317 <init_com+0xff>
        return;
  809316:	90                   	nop
}
  809317:	c9                   	leave  
  809318:	c3                   	ret    

0000000000809319 <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  809319:	f3 0f 1e fa          	endbr64 
  80931d:	55                   	push   rbp
  80931e:	48 89 e5             	mov    rbp,rsp
  809321:	48 83 ec 20          	sub    rsp,0x20
  809325:	89 f8                	mov    eax,edi
  809327:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80932a:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80932e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809331:	83 c0 05             	add    eax,0x5
  809334:	0f b6 c0             	movzx  eax,al
  809337:	89 c7                	mov    edi,eax
  809339:	e8 e6 b5 ff ff       	call   804924 <inb>
  80933e:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  809341:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  809345:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  809349:	74 e3                	je     80932e <com_putchar+0x15>
    outb(com_base, ch);
  80934b:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80934f:	0f b6 d0             	movzx  edx,al
  809352:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809355:	0f b7 c0             	movzx  eax,ax
  809358:	89 d6                	mov    esi,edx
  80935a:	89 c7                	mov    edi,eax
  80935c:	e8 9f b5 ff ff       	call   804900 <outb>
}
  809361:	90                   	nop
  809362:	c9                   	leave  
  809363:	c3                   	ret    

0000000000809364 <com_puts>:

void com_puts(char* s,int com_port){
  809364:	f3 0f 1e fa          	endbr64 
  809368:	55                   	push   rbp
  809369:	48 89 e5             	mov    rbp,rsp
  80936c:	48 83 ec 10          	sub    rsp,0x10
  809370:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809374:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  809377:	eb 1d                	jmp    809396 <com_puts+0x32>
        com_putchar(*s,com_port);
  809379:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80937d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809380:	66 98                	cbw    
  809382:	0f b7 c0             	movzx  eax,ax
  809385:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  809388:	89 d6                	mov    esi,edx
  80938a:	89 c7                	mov    edi,eax
  80938c:	e8 88 ff ff ff       	call   809319 <com_putchar>
    for(;*s;s++){
  809391:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  809396:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80939a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80939d:	84 c0                	test   al,al
  80939f:	75 d8                	jne    809379 <com_puts+0x15>
    }
  8093a1:	90                   	nop
  8093a2:	90                   	nop
  8093a3:	c9                   	leave  
  8093a4:	c3                   	ret    

00000000008093a5 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  8093a5:	f3 0f 1e fa          	endbr64 
  8093a9:	55                   	push   rbp
  8093aa:	48 89 e5             	mov    rbp,rsp
  8093ad:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8093b1:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8093b5:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  8093b8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8093bc:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  8093bf:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8093c6:	eb 1b                	jmp    8093e3 <memcpy+0x3e>
        *(dest)=*(src);
  8093c8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8093cc:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8093cf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8093d3:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  8093d5:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  8093da:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  8093df:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8093e3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8093e6:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  8093e9:	77 dd                	ja     8093c8 <memcpy+0x23>
    }
}
  8093eb:	90                   	nop
  8093ec:	90                   	nop
  8093ed:	5d                   	pop    rbp
  8093ee:	c3                   	ret    

00000000008093ef <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  8093ef:	f3 0f 1e fa          	endbr64 
  8093f3:	55                   	push   rbp
  8093f4:	48 89 e5             	mov    rbp,rsp
  8093f7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8093fb:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8093ff:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  809402:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809409:	eb 3a                	jmp    809445 <memcmp+0x56>
    {
        if(*a!=*b)
  80940b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80940f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809412:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809416:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809419:	38 c2                	cmp    dl,al
  80941b:	74 1a                	je     809437 <memcmp+0x48>
            return *a-*b;
  80941d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809421:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809424:	0f b6 d0             	movzx  edx,al
  809427:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80942b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80942e:	0f b6 c8             	movzx  ecx,al
  809431:	89 d0                	mov    eax,edx
  809433:	29 c8                	sub    eax,ecx
  809435:	eb 1b                	jmp    809452 <memcmp+0x63>
        a++;
  809437:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80943c:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  809441:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809445:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809448:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80944b:	7c be                	jl     80940b <memcmp+0x1c>
    }
    return 0;
  80944d:	b8 00 00 00 00       	mov    eax,0x0
}
  809452:	5d                   	pop    rbp
  809453:	c3                   	ret    

0000000000809454 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  809454:	f3 0f 1e fa          	endbr64 
  809458:	55                   	push   rbp
  809459:	48 89 e5             	mov    rbp,rsp
  80945c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809460:	89 f0                	mov    eax,esi
  809462:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  809465:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  809468:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80946f:	eb 16                	jmp    809487 <memset+0x33>
        *(buf++)=value;
  809471:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809475:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809479:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80947d:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  809481:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  809483:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809487:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80948a:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80948d:	72 e2                	jb     809471 <memset+0x1d>
    }
}
  80948f:	90                   	nop
  809490:	90                   	nop
  809491:	5d                   	pop    rbp
  809492:	c3                   	ret    

0000000000809493 <get_mem_size>:

u32 get_mem_size(){
  809493:	f3 0f 1e fa          	endbr64 
  809497:	55                   	push   rbp
  809498:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80949b:	8b 05 83 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27a83]        # 430f24 <mem_end>
}
  8094a1:	5d                   	pop    rbp
  8094a2:	c3                   	ret    

00000000008094a3 <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  8094a3:	f3 0f 1e fa          	endbr64 
  8094a7:	55                   	push   rbp
  8094a8:	48 89 e5             	mov    rbp,rsp
  8094ab:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8094af:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  8094b3:	eb 1d                	jmp    8094d2 <strcpy+0x2f>
        *(dest++)=*(buf++);
  8094b5:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8094b9:	48 8d 42 01          	lea    rax,[rdx+0x1]
  8094bd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8094c1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094c5:	48 8d 48 01          	lea    rcx,[rax+0x1]
  8094c9:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  8094cd:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  8094d0:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  8094d2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8094d6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8094d9:	84 c0                	test   al,al
  8094db:	75 d8                	jne    8094b5 <strcpy+0x12>
    }
    *dest='\0';
  8094dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094e1:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  8094e4:	90                   	nop
  8094e5:	5d                   	pop    rbp
  8094e6:	c3                   	ret    

00000000008094e7 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  8094e7:	f3 0f 1e fa          	endbr64 
  8094eb:	55                   	push   rbp
  8094ec:	48 89 e5             	mov    rbp,rsp
  8094ef:	48 83 ec 30          	sub    rsp,0x30
  8094f3:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  8094f7:	89 f0                	mov    eax,esi
  8094f9:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  8094fc:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  809501:	0f 84 9c 00 00 00    	je     8095a3 <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  809507:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80950b:	48 89 c6             	mov    rsi,rax
  80950e:	bf 40 0f 43 00       	mov    edi,0x430f40
  809513:	e8 8b ff ff ff       	call   8094a3 <strcpy>
        char* ptr=strtokkee;
  809518:	48 c7 45 e8 40 0f 43 	mov    QWORD PTR [rbp-0x18],0x430f40
  80951f:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  809520:	c7 05 16 7c c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc27c16],0x0        # 431140 <tokptr>
  809527:	00 00 00 
  80952a:	eb 1c                	jmp    809548 <strtok+0x61>
  80952c:	8b 05 0e 7c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27c0e]        # 431140 <tokptr>
  809532:	83 c0 01             	add    eax,0x1
  809535:	99                   	cdq    
  809536:	c1 ea 17             	shr    edx,0x17
  809539:	01 d0                	add    eax,edx
  80953b:	25 ff 01 00 00       	and    eax,0x1ff
  809540:	29 d0                	sub    eax,edx
  809542:	89 05 f8 7b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27bf8],eax        # 431140 <tokptr>
  809548:	8b 05 f2 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27bf2]        # 431140 <tokptr>
  80954e:	48 98                	cdqe   
  809550:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  809557:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80955a:	74 13                	je     80956f <strtok+0x88>
  80955c:	8b 05 de 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27bde]        # 431140 <tokptr>
  809562:	48 98                	cdqe   
  809564:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  80956b:	84 c0                	test   al,al
  80956d:	75 bd                	jne    80952c <strtok+0x45>
        strtokkee[tokptr]='\0';
  80956f:	8b 05 cb 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27bcb]        # 431140 <tokptr>
  809575:	48 98                	cdqe   
  809577:	c6 80 40 0f 43 00 00 	mov    BYTE PTR [rax+0x430f40],0x0
        tokptr=(tokptr+1)%512;
  80957e:	8b 05 bc 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27bbc]        # 431140 <tokptr>
  809584:	83 c0 01             	add    eax,0x1
  809587:	99                   	cdq    
  809588:	c1 ea 17             	shr    edx,0x17
  80958b:	01 d0                	add    eax,edx
  80958d:	25 ff 01 00 00       	and    eax,0x1ff
  809592:	29 d0                	sub    eax,edx
  809594:	89 05 a6 7b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27ba6],eax        # 431140 <tokptr>
        return ptr;
  80959a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80959e:	e9 9e 00 00 00       	jmp    809641 <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  8095a3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  8095aa:	8b 05 90 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b90]        # 431140 <tokptr>
  8095b0:	48 98                	cdqe   
  8095b2:	48 05 40 0f 43 00    	add    rax,0x430f40
  8095b8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  8095bc:	eb 20                	jmp    8095de <strtok+0xf7>
  8095be:	8b 05 7c 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b7c]        # 431140 <tokptr>
  8095c4:	83 c0 01             	add    eax,0x1
  8095c7:	99                   	cdq    
  8095c8:	c1 ea 17             	shr    edx,0x17
  8095cb:	01 d0                	add    eax,edx
  8095cd:	25 ff 01 00 00       	and    eax,0x1ff
  8095d2:	29 d0                	sub    eax,edx
  8095d4:	89 05 66 7b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27b66],eax        # 431140 <tokptr>
  8095da:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8095de:	8b 05 5c 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b5c]        # 431140 <tokptr>
  8095e4:	48 98                	cdqe   
  8095e6:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  8095ed:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  8095f0:	74 13                	je     809605 <strtok+0x11e>
  8095f2:	8b 05 48 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b48]        # 431140 <tokptr>
  8095f8:	48 98                	cdqe   
  8095fa:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  809601:	84 c0                	test   al,al
  809603:	75 b9                	jne    8095be <strtok+0xd7>
    strtokkee[tokptr]='\0';
  809605:	8b 05 35 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b35]        # 431140 <tokptr>
  80960b:	48 98                	cdqe   
  80960d:	c6 80 40 0f 43 00 00 	mov    BYTE PTR [rax+0x430f40],0x0
    tokptr=(tokptr+1)%512;
  809614:	8b 05 26 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b26]        # 431140 <tokptr>
  80961a:	83 c0 01             	add    eax,0x1
  80961d:	99                   	cdq    
  80961e:	c1 ea 17             	shr    edx,0x17
  809621:	01 d0                	add    eax,edx
  809623:	25 ff 01 00 00       	and    eax,0x1ff
  809628:	29 d0                	sub    eax,edx
  80962a:	89 05 10 7b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27b10],eax        # 431140 <tokptr>
    if(c)
  809630:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809634:	74 06                	je     80963c <strtok+0x155>
        return ptr;
  809636:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80963a:	eb 05                	jmp    809641 <strtok+0x15a>
    else
        return (void*)0;
  80963c:	b8 00 00 00 00       	mov    eax,0x0
}
  809641:	c9                   	leave  
  809642:	c3                   	ret    

0000000000809643 <strcmp>:
int strcmp(char *s1,char *s2)
{
  809643:	f3 0f 1e fa          	endbr64 
  809647:	55                   	push   rbp
  809648:	48 89 e5             	mov    rbp,rsp
  80964b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80964f:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  809653:	eb 3c                	jmp    809691 <strcmp+0x4e>
		if(*s1>*s2)
  809655:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809659:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80965c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809660:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809663:	38 c2                	cmp    dl,al
  809665:	7e 07                	jle    80966e <strcmp+0x2b>
			return 1;
  809667:	b8 01 00 00 00       	mov    eax,0x1
  80966c:	eb 52                	jmp    8096c0 <strcmp+0x7d>
		else if(*s1<*s2)
  80966e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809672:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809675:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809679:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80967c:	38 c2                	cmp    dl,al
  80967e:	7d 07                	jge    809687 <strcmp+0x44>
			return -1;
  809680:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809685:	eb 39                	jmp    8096c0 <strcmp+0x7d>
		s1++;
  809687:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80968c:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  809691:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809695:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809698:	84 c0                	test   al,al
  80969a:	74 0b                	je     8096a7 <strcmp+0x64>
  80969c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8096a0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8096a3:	84 c0                	test   al,al
  8096a5:	75 ae                	jne    809655 <strcmp+0x12>
	}
	if(*s1==*s2)
  8096a7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8096ab:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8096ae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8096b2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8096b5:	38 c2                	cmp    dl,al
  8096b7:	75 07                	jne    8096c0 <strcmp+0x7d>
		return 0;
  8096b9:	b8 00 00 00 00       	mov    eax,0x0
  8096be:	eb 00                	jmp    8096c0 <strcmp+0x7d>
}
  8096c0:	5d                   	pop    rbp
  8096c1:	c3                   	ret    

00000000008096c2 <strlen>:

int strlen(char *str)
{
  8096c2:	f3 0f 1e fa          	endbr64 
  8096c6:	55                   	push   rbp
  8096c7:	48 89 e5             	mov    rbp,rsp
  8096ca:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  8096ce:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  8096d5:	eb 09                	jmp    8096e0 <strlen+0x1e>
  8096d7:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  8096dc:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8096e0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8096e4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8096e7:	84 c0                	test   al,al
  8096e9:	75 ec                	jne    8096d7 <strlen+0x15>
    return l;
  8096eb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8096ee:	5d                   	pop    rbp
  8096ef:	c3                   	ret    

00000000008096f0 <sprintf>:

void sprintf(char *dist, char *str,...)
{
  8096f0:	f3 0f 1e fa          	endbr64 
  8096f4:	55                   	push   rbp
  8096f5:	48 89 e5             	mov    rbp,rsp
  8096f8:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  8096ff:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  809706:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80970d:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  809714:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80971b:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  809722:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  809729:	84 c0                	test   al,al
  80972b:	74 20                	je     80974d <sprintf+0x5d>
  80972d:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  809731:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  809735:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  809739:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80973d:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  809741:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  809745:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  809749:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80974d:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809754:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80975b:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809762:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  809769:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  809770:	00 00 00 
    while (*pstr!='\n')
  809773:	eb 39                	jmp    8097ae <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  809775:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80977c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80977f:	3c 25                	cmp    al,0x25
  809781:	75 15                	jne    809798 <sprintf+0xa8>
  809783:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80978a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80978d:	3c 25                	cmp    al,0x25
  80978f:	74 07                	je     809798 <sprintf+0xa8>
            argnum++;
  809791:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  809798:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80979f:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  8097a6:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  8097ad:	01 
    while (*pstr!='\n')
  8097ae:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8097b5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8097b8:	3c 0a                	cmp    al,0xa
  8097ba:	75 b9                	jne    809775 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  8097bc:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  8097c3:	00 00 00 
  8097c6:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  8097cd:	00 00 00 
  8097d0:	48 8d 45 10          	lea    rax,[rbp+0x10]
  8097d4:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  8097db:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  8097e2:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  8097e9:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  8097f0:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  8097f7:	e9 e2 01 00 00       	jmp    8099de <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  8097fc:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809803:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809806:	3c 25                	cmp    al,0x25
  809808:	0f 85 aa 01 00 00    	jne    8099b8 <sprintf+0x2c8>
  80980e:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809815:	48 83 c0 01          	add    rax,0x1
  809819:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80981c:	84 c0                	test   al,al
  80981e:	0f 84 94 01 00 00    	je     8099b8 <sprintf+0x2c8>
            pstr++;
  809824:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80982b:	01 
            if(*pstr=='x'){
  80982c:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809833:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809836:	3c 78                	cmp    al,0x78
  809838:	75 64                	jne    80989e <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80983a:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809840:	83 f8 2f             	cmp    eax,0x2f
  809843:	77 23                	ja     809868 <sprintf+0x178>
  809845:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80984c:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809852:	89 d2                	mov    edx,edx
  809854:	48 01 d0             	add    rax,rdx
  809857:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80985d:	83 c2 08             	add    edx,0x8
  809860:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809866:	eb 12                	jmp    80987a <sprintf+0x18a>
  809868:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80986f:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809873:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80987a:	8b 00                	mov    eax,DWORD PTR [rax]
  80987c:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  809882:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  809888:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80988f:	89 d6                	mov    esi,edx
  809891:	48 89 c7             	mov    rdi,rax
  809894:	e8 4e 02 00 00       	call   809ae7 <sprint_hex>
            if(*pstr=='x'){
  809899:	e9 38 01 00 00       	jmp    8099d6 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  80989e:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8098a5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8098a8:	3c 73                	cmp    al,0x73
  8098aa:	75 68                	jne    809914 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  8098ac:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  8098b2:	83 f8 2f             	cmp    eax,0x2f
  8098b5:	77 23                	ja     8098da <sprintf+0x1ea>
  8098b7:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8098be:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  8098c4:	89 d2                	mov    edx,edx
  8098c6:	48 01 d0             	add    rax,rdx
  8098c9:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  8098cf:	83 c2 08             	add    edx,0x8
  8098d2:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  8098d8:	eb 12                	jmp    8098ec <sprintf+0x1fc>
  8098da:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8098e1:	48 8d 50 08          	lea    rdx,[rax+0x8]
  8098e5:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  8098ec:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098ef:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  8098f6:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  8098fd:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809904:	48 89 d6             	mov    rsi,rdx
  809907:	48 89 c7             	mov    rdi,rax
  80990a:	e8 5a 02 00 00       	call   809b69 <sprintn>
            if(*pstr=='x'){
  80990f:	e9 c2 00 00 00       	jmp    8099d6 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  809914:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80991b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80991e:	3c 64                	cmp    al,0x64
  809920:	75 66                	jne    809988 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  809922:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809928:	83 f8 2f             	cmp    eax,0x2f
  80992b:	77 23                	ja     809950 <sprintf+0x260>
  80992d:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809934:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80993a:	89 d2                	mov    edx,edx
  80993c:	48 01 d0             	add    rax,rdx
  80993f:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809945:	83 c2 08             	add    edx,0x8
  809948:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80994e:	eb 12                	jmp    809962 <sprintf+0x272>
  809950:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809957:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80995b:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809962:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809965:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80996c:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  809973:	89 c2                	mov    edx,eax
  809975:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80997c:	89 d6                	mov    esi,edx
  80997e:	48 89 c7             	mov    rdi,rax
  809981:	e8 ad 00 00 00       	call   809a33 <sprint_decimal>
            if(*pstr=='x'){
  809986:	eb 4e                	jmp    8099d6 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  809988:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80998f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809992:	3c 63                	cmp    al,0x63
  809994:	75 02                	jne    809998 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  809996:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  809998:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80999f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099a2:	0f be d0             	movsx  edx,al
  8099a5:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8099ac:	89 d6                	mov    esi,edx
  8099ae:	48 89 c7             	mov    rdi,rax
  8099b1:	e8 3e 00 00 00       	call   8099f4 <sprintchar>
            if(*pstr=='x'){
  8099b6:	eb 1e                	jmp    8099d6 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  8099b8:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8099bf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099c2:	0f be d0             	movsx  edx,al
  8099c5:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8099cc:	89 d6                	mov    esi,edx
  8099ce:	48 89 c7             	mov    rdi,rax
  8099d1:	e8 1e 00 00 00       	call   8099f4 <sprintchar>
    for(;*pstr!='\0';pstr++){
  8099d6:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  8099dd:	01 
  8099de:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8099e5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099e8:	84 c0                	test   al,al
  8099ea:	0f 85 0c fe ff ff    	jne    8097fc <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  8099f0:	90                   	nop
  8099f1:	90                   	nop
  8099f2:	c9                   	leave  
  8099f3:	c3                   	ret    

00000000008099f4 <sprintchar>:
void sprintchar(char *dist,char c)
{
  8099f4:	f3 0f 1e fa          	endbr64 
  8099f8:	55                   	push   rbp
  8099f9:	48 89 e5             	mov    rbp,rsp
  8099fc:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809a00:	89 f0                	mov    eax,esi
  809a02:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  809a05:	eb 05                	jmp    809a0c <sprintchar+0x18>
        dist++;
  809a07:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  809a0c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809a10:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a13:	84 c0                	test   al,al
  809a15:	75 f0                	jne    809a07 <sprintchar+0x13>
    *dist++=c;
  809a17:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809a1b:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809a1f:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809a23:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  809a27:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  809a29:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809a2d:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  809a30:	90                   	nop
  809a31:	5d                   	pop    rbp
  809a32:	c3                   	ret    

0000000000809a33 <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  809a33:	f3 0f 1e fa          	endbr64 
  809a37:	55                   	push   rbp
  809a38:	48 89 e5             	mov    rbp,rsp
  809a3b:	48 83 ec 30          	sub    rsp,0x30
  809a3f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  809a43:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  809a46:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  809a4d:	eb 65                	jmp    809ab4 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  809a4f:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  809a52:	48 63 c2             	movsxd rax,edx
  809a55:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  809a5c:	48 c1 e8 20          	shr    rax,0x20
  809a60:	c1 f8 02             	sar    eax,0x2
  809a63:	89 d6                	mov    esi,edx
  809a65:	c1 fe 1f             	sar    esi,0x1f
  809a68:	29 f0                	sub    eax,esi
  809a6a:	89 c1                	mov    ecx,eax
  809a6c:	89 c8                	mov    eax,ecx
  809a6e:	c1 e0 02             	shl    eax,0x2
  809a71:	01 c8                	add    eax,ecx
  809a73:	01 c0                	add    eax,eax
  809a75:	89 d1                	mov    ecx,edx
  809a77:	29 c1                	sub    ecx,eax
  809a79:	89 c8                	mov    eax,ecx
  809a7b:	83 c0 30             	add    eax,0x30
  809a7e:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  809a81:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809a84:	8d 50 01             	lea    edx,[rax+0x1]
  809a87:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  809a8a:	48 98                	cdqe   
  809a8c:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  809a90:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  809a94:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  809a97:	48 63 d0             	movsxd rdx,eax
  809a9a:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  809aa1:	48 c1 ea 20          	shr    rdx,0x20
  809aa5:	c1 fa 02             	sar    edx,0x2
  809aa8:	c1 f8 1f             	sar    eax,0x1f
  809aab:	89 c1                	mov    ecx,eax
  809aad:	89 d0                	mov    eax,edx
  809aaf:	29 c8                	sub    eax,ecx
  809ab1:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  809ab4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809ab7:	83 f8 0f             	cmp    eax,0xf
  809aba:	76 93                	jbe    809a4f <sprint_decimal+0x1c>
    }
    while(p>0)
  809abc:	eb 1f                	jmp    809add <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  809abe:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  809ac2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809ac5:	48 98                	cdqe   
  809ac7:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  809acc:	0f be d0             	movsx  edx,al
  809acf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809ad3:	89 d6                	mov    esi,edx
  809ad5:	48 89 c7             	mov    rdi,rax
  809ad8:	e8 17 ff ff ff       	call   8099f4 <sprintchar>
    while(p>0)
  809add:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809ae1:	7f db                	jg     809abe <sprint_decimal+0x8b>
    }
}
  809ae3:	90                   	nop
  809ae4:	90                   	nop
  809ae5:	c9                   	leave  
  809ae6:	c3                   	ret    

0000000000809ae7 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  809ae7:	f3 0f 1e fa          	endbr64 
  809aeb:	55                   	push   rbp
  809aec:	48 89 e5             	mov    rbp,rsp
  809aef:	48 83 ec 20          	sub    rsp,0x20
  809af3:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809af7:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  809afa:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  809b01:	eb 35                	jmp    809b38 <sprint_hex+0x51>
        unsigned char a=c%16;
  809b03:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809b06:	83 e0 0f             	and    eax,0xf
  809b09:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  809b0c:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  809b10:	76 06                	jbe    809b18 <sprint_hex+0x31>
  809b12:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  809b16:	eb 04                	jmp    809b1c <sprint_hex+0x35>
        else a+='0';
  809b18:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  809b1c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809b1f:	8d 50 01             	lea    edx,[rax+0x1]
  809b22:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  809b25:	48 98                	cdqe   
  809b27:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  809b2b:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  809b2f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809b32:	c1 e8 04             	shr    eax,0x4
  809b35:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  809b38:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  809b3c:	7e c5                	jle    809b03 <sprint_hex+0x1c>
    }
    while(p>0)
  809b3e:	eb 1f                	jmp    809b5f <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  809b40:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  809b44:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809b47:	48 98                	cdqe   
  809b49:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  809b4e:	0f be d0             	movsx  edx,al
  809b51:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809b55:	89 d6                	mov    esi,edx
  809b57:	48 89 c7             	mov    rdi,rax
  809b5a:	e8 95 fe ff ff       	call   8099f4 <sprintchar>
    while(p>0)
  809b5f:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809b63:	7f db                	jg     809b40 <sprint_hex+0x59>
    }
}
  809b65:	90                   	nop
  809b66:	90                   	nop
  809b67:	c9                   	leave  
  809b68:	c3                   	ret    

0000000000809b69 <sprintn>:
void sprintn(char *dist,char *str)
{
  809b69:	f3 0f 1e fa          	endbr64 
  809b6d:	55                   	push   rbp
  809b6e:	48 89 e5             	mov    rbp,rsp
  809b71:	48 83 ec 10          	sub    rsp,0x10
  809b75:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809b79:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  809b7d:	eb 20                	jmp    809b9f <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  809b7f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809b83:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809b87:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  809b8b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b8e:	0f be d0             	movsx  edx,al
  809b91:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b95:	89 d6                	mov    esi,edx
  809b97:	48 89 c7             	mov    rdi,rax
  809b9a:	e8 55 fe ff ff       	call   8099f4 <sprintchar>
    while(*str!='\0')
  809b9f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809ba3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ba6:	84 c0                	test   al,al
  809ba8:	75 d5                	jne    809b7f <sprintn+0x16>
    }
  809baa:	90                   	nop
  809bab:	90                   	nop
  809bac:	c9                   	leave  
  809bad:	c3                   	ret    
  809bae:	66 90                	xchg   ax,ax

0000000000809bb0 <create_zero>:
  809bb0:	e8 6d 9d ff ff       	call   803922 <req_proc>
  809bb5:	83 f8 ff             	cmp    eax,0xffffffff
  809bb8:	74 0c                	je     809bc6 <create_zero.retu>
  809bba:	e8 2f 9e ff ff       	call   8039ee <set_proc>
  809bbf:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  809bc3:	83 c4 40             	add    esp,0x40

0000000000809bc6 <create_zero.retu>:
  809bc6:	c3                   	ret    

0000000000809bc7 <fill_desc>:
  809bc7:	55                   	push   rbp
  809bc8:	48 89 e5             	mov    rbp,rsp
  809bcb:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  809bcf:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  809bd3:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  809bd7:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  809bdb:	be 1a 9d 80 00       	mov    esi,0x809d1a
  809be0:	c7 04 25 1a 9d 80 00 	mov    DWORD PTR ds:0x809d1a,0x0
  809be7:	00 00 00 00 
  809beb:	c7 04 25 1e 9d 80 00 	mov    DWORD PTR ds:0x809d1e,0x0
  809bf2:	00 00 00 00 
  809bf6:	66 67 89 0e          	mov    WORD PTR [esi],cx
  809bfa:	c1 e9 10             	shr    ecx,0x10
  809bfd:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  809c02:	c1 ea 10             	shr    edx,0x10
  809c05:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  809c09:	66 c1 ea 08          	shr    dx,0x8
  809c0d:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  809c11:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  809c16:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  809c1a:	c1 e1 08             	shl    ecx,0x8
  809c1d:	09 cf                	or     edi,ecx
  809c1f:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  809c23:	8b 14 25 1a 9d 80 00 	mov    edx,DWORD PTR ds:0x809d1a
  809c2a:	67 89 10             	mov    DWORD PTR [eax],edx
  809c2d:	8b 14 25 1e 9d 80 00 	mov    edx,DWORD PTR ds:0x809d1e
  809c34:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  809c38:	c9                   	leave  
  809c39:	c3                   	ret    

0000000000809c3a <switch_proc_asm>:
  809c3a:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  809c40:	66 89 04 25 58 9c 80 	mov    WORD PTR ds:0x809c58,ax
  809c47:	00 
  809c48:	c7 04 25 54 9c 80 00 	mov    DWORD PTR ds:0x809c54,0x0
  809c4f:	00 00 00 00 

0000000000809c53 <switch_proc_asm.ljmp>:
  809c53:	ea                   	(bad)  
  809c54:	00 00                	add    BYTE PTR [rax],al
  809c56:	00 00                	add    BYTE PTR [rax],al
  809c58:	00 00                	add    BYTE PTR [rax],al
  809c5a:	c3                   	ret    

0000000000809c5b <switch_to>:
  809c5b:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  809c60:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  809c64:	bf cc 9c 80 00       	mov    edi,0x809ccc
  809c69:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  809c6d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  809c71:	89 c1                	mov    ecx,eax
  809c73:	83 e9 04             	sub    ecx,0x4
  809c76:	67 89 19             	mov    DWORD PTR [ecx],ebx
  809c79:	50                   	push   rax
  809c7a:	89 f5                	mov    ebp,esi
  809c7c:	83 c5 28             	add    ebp,0x28
  809c7f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809c83:	50                   	push   rax
  809c84:	83 c5 04             	add    ebp,0x4
  809c87:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809c8b:	50                   	push   rax
  809c8c:	83 c5 04             	add    ebp,0x4
  809c8f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809c93:	50                   	push   rax
  809c94:	83 c5 04             	add    ebp,0x4
  809c97:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809c9b:	50                   	push   rax
  809c9c:	83 c5 04             	add    ebp,0x4
  809c9f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809ca3:	50                   	push   rax
  809ca4:	83 c5 04             	add    ebp,0x4
  809ca7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809cab:	50                   	push   rax
  809cac:	83 c5 04             	add    ebp,0x4
  809caf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809cb3:	50                   	push   rax
  809cb4:	83 c5 04             	add    ebp,0x4
  809cb7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809cbb:	50                   	push   rax
  809cbc:	83 c5 04             	add    ebp,0x4
  809cbf:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  809cc3:	0f 22 d8             	mov    cr3,rax
  809cc6:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  809cca:	50                   	push   rax
  809ccb:	5c                   	pop    rsp

0000000000809ccc <switch_to.leap>:
  809ccc:	ea                   	(bad)  
  809ccd:	00 00                	add    BYTE PTR [rax],al
  809ccf:	00 00                	add    BYTE PTR [rax],al
  809cd1:	08 00                	or     BYTE PTR [rax],al

0000000000809cd3 <save_context>:
  809cd3:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  809cd8:	83 c0 44             	add    eax,0x44
  809cdb:	b9 08 00 00 00       	mov    ecx,0x8
  809ce0:	89 e7                	mov    edi,esp

0000000000809ce2 <save_context.loops>:
  809ce2:	67 8b 17             	mov    edx,DWORD PTR [edi]
  809ce5:	67 89 10             	mov    DWORD PTR [eax],edx
  809ce8:	83 c7 04             	add    edi,0x4
  809ceb:	83 e8 04             	sub    eax,0x4
  809cee:	e2 f2                	loop   809ce2 <save_context.loops>
  809cf0:	5b                   	pop    rbx
  809cf1:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  809cf6:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  809cfa:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  809cff:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  809d03:	c3                   	ret    

0000000000809d04 <move_to_user_mode>:
  809d04:	66 b8 20 00          	mov    ax,0x20
  809d08:	8e d8                	mov    ds,eax
  809d0a:	8e c0                	mov    es,eax
  809d0c:	8e e8                	mov    gs,eax
  809d0e:	6a 20                	push   0x20
  809d10:	54                   	push   rsp
  809d11:	6a 18                	push   0x18
  809d13:	68 19 9d 80 00       	push   0x809d19
  809d18:	cf                   	iret   

0000000000809d19 <move_to_user_mode.done>:
  809d19:	c3                   	ret    

0000000000809d1a <desc>:
	...
