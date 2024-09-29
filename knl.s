
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
  800194:	b8 7f 11 80 00       	mov    eax,0x80117f
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
  800217:	b8 17 5e 80 00       	mov    eax,0x805e17
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 d9 00 00 00       	call   80030c <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 50 4c 80 00       	mov    eax,0x804c50
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 bd 00 00 00       	call   80030c <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 a0 6d 80 00       	mov    eax,0x806da0
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 a1 00 00 00       	call   80030c <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 10 56 80 00       	mov    eax,0x805610
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
  800291:	e8 da 46 00 00       	call   804970 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 cb 46 00 00       	call   804970 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 bc 46 00 00       	call   804970 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 ad 46 00 00       	call   804970 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 9e 46 00 00       	call   804970 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 8f 46 00 00       	call   804970 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 80 46 00 00       	call   804970 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 71 46 00 00       	call   804970 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 a1 46 00 00       	call   8049aa <turn_on_int>

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
  800327:	48 8b 15 d2 9b 00 00 	mov    rdx,QWORD PTR [rip+0x9bd2]        # 809f00 <idt>
  80032e:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800332:	48 c1 e0 04          	shl    rax,0x4
  800336:	48 01 d0             	add    rax,rdx
  800339:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80033d:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800340:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800344:	48 c1 e8 10          	shr    rax,0x10
  800348:	48 89 c2             	mov    rdx,rax
  80034b:	48 8b 0d ae 9b 00 00 	mov    rcx,QWORD PTR [rip+0x9bae]        # 809f00 <idt>
  800352:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800356:	48 c1 e0 04          	shl    rax,0x4
  80035a:	48 01 c8             	add    rax,rcx
  80035d:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  800361:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800365:	48 c1 e8 20          	shr    rax,0x20
  800369:	89 c1                	mov    ecx,eax
  80036b:	48 8b 15 8e 9b 00 00 	mov    rdx,QWORD PTR [rip+0x9b8e]        # 809f00 <idt>
  800372:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800376:	48 c1 e0 04          	shl    rax,0x4
  80037a:	48 01 c2             	add    rdx,rax
  80037d:	0f b7 c1             	movzx  eax,cx
  800380:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr;
  800383:	48 8b 15 76 9b 00 00 	mov    rdx,QWORD PTR [rip+0x9b76]        # 809f00 <idt>
  80038a:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80038e:	48 c1 e0 04          	shl    rax,0x4
  800392:	48 01 c2             	add    rdx,rax
  800395:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  800399:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
    idt[index].selector=selector;
  80039d:	48 8b 15 5c 9b 00 00 	mov    rdx,QWORD PTR [rip+0x9b5c]        # 809f00 <idt>
  8003a4:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003a8:	48 c1 e0 04          	shl    rax,0x4
  8003ac:	48 01 c2             	add    rdx,rax
  8003af:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003b3:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003b7:	48 8b 15 42 9b 00 00 	mov    rdx,QWORD PTR [rip+0x9b42]        # 809f00 <idt>
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
  8003e1:	e8 b8 45 00 00       	call   80499e <eoi>
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
  8003fb:	e8 9e 45 00 00       	call   80499e <eoi>
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
  800415:	e8 84 45 00 00       	call   80499e <eoi>
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
  80042f:	e8 6a 45 00 00       	call   80499e <eoi>
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
  800449:	e8 50 45 00 00       	call   80499e <eoi>
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
  800463:	e8 36 45 00 00       	call   80499e <eoi>
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
  80047c:	e8 1d 45 00 00       	call   80499e <eoi>
    report_back_trace_of_err();
  800481:	b8 00 00 00 00       	mov    eax,0x0
  800486:	e8 3f 45 00 00       	call   8049ca <report_back_trace_of_err>
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
  8004a1:	e8 f8 44 00 00       	call   80499e <eoi>
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
  8004bb:	e8 de 44 00 00       	call   80499e <eoi>
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
  8004d4:	e8 c5 44 00 00       	call   80499e <eoi>
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
  8004ed:	e8 ac 44 00 00       	call   80499e <eoi>
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
  800507:	e8 92 44 00 00       	call   80499e <eoi>
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
  800521:	e8 78 44 00 00       	call   80499e <eoi>
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
  800545:	e8 54 44 00 00       	call   80499e <eoi>
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
  800562:	e8 37 44 00 00       	call   80499e <eoi>
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
  80059b:	48 8b 04 c5 60 15 81 	mov    rax,QWORD PTR [rax*8+0x811560]
  8005a2:	00 
  8005a3:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(b);
  8005a6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005a9:	48 98                	cdqe   
  8005ab:	48 89 c7             	mov    rdi,rax
  8005ae:	e8 b8 23 00 00       	call   80296b <reg_device>
  8005b3:	e9 f7 01 00 00       	jmp    8007af <syscall+0x241>
        case 1:return dispose_device(b);
  8005b8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005bb:	89 c7                	mov    edi,eax
  8005bd:	e8 08 2e 00 00       	call   8033ca <dispose_device>
  8005c2:	e9 e8 01 00 00       	jmp    8007af <syscall+0x241>
        case 2:return reg_driver(b);
  8005c7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005ca:	48 98                	cdqe   
  8005cc:	48 89 c7             	mov    rdi,rax
  8005cf:	e8 7f 26 00 00       	call   802c53 <reg_driver>
  8005d4:	e9 d6 01 00 00       	jmp    8007af <syscall+0x241>
        case 3:return dispose_driver(b);
  8005d9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005dc:	48 98                	cdqe   
  8005de:	48 89 c7             	mov    rdi,rax
  8005e1:	e8 82 2e 00 00       	call   803468 <dispose_driver>
  8005e6:	e9 c4 01 00 00       	jmp    8007af <syscall+0x241>
        case 4:return call_drv_func(b,c,d);
  8005eb:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8005ee:	48 98                	cdqe   
  8005f0:	48 89 c2             	mov    rdx,rax
  8005f3:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8005f6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005f9:	89 ce                	mov    esi,ecx
  8005fb:	89 c7                	mov    edi,eax
  8005fd:	e8 71 2b 00 00       	call   803173 <call_drv_func>
  800602:	e9 a8 01 00 00       	jmp    8007af <syscall+0x241>
        case 5:return req_page_at(b,c);
  800607:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80060a:	48 98                	cdqe   
  80060c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80060f:	89 d6                	mov    esi,edx
  800611:	48 89 c7             	mov    rdi,rax
  800614:	e8 3f 0f 00 00       	call   801558 <req_page_at>
  800619:	e9 91 01 00 00       	jmp    8007af <syscall+0x241>
        case 6:return free_page(b);
  80061e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800621:	48 98                	cdqe   
  800623:	48 89 c7             	mov    rdi,rax
  800626:	e8 5e 0d 00 00       	call   801389 <free_page>
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
  800648:	e8 1c 3f 00 00       	call   804569 <reg_proc>
  80064d:	e9 5d 01 00 00       	jmp    8007af <syscall+0x241>
        case 8:del_proc(b);
  800652:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800655:	89 c7                	mov    edi,eax
  800657:	e8 ea 3c 00 00       	call   804346 <del_proc>
        case 10:chk_vm(b,c);
  80065c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80065f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800662:	89 d6                	mov    esi,edx
  800664:	89 c7                	mov    edi,eax
  800666:	e8 af 0f 00 00       	call   80161a <chk_vm>
        case 11:return sys_open(b,c);
  80066b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80066e:	48 98                	cdqe   
  800670:	48 89 c2             	mov    rdx,rax
  800673:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800676:	89 c6                	mov    esi,eax
  800678:	48 89 d7             	mov    rdi,rdx
  80067b:	e8 7e 13 00 00       	call   8019fe <sys_open>
  800680:	e9 2a 01 00 00       	jmp    8007af <syscall+0x241>
        case 12:return sys_close(b);
  800685:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800688:	89 c7                	mov    edi,eax
  80068a:	e8 38 18 00 00       	call   801ec7 <sys_close>
  80068f:	e9 1b 01 00 00       	jmp    8007af <syscall+0x241>
        case 13:return sys_read(b,c,d);
  800694:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800697:	48 98                	cdqe   
  800699:	48 89 c1             	mov    rcx,rax
  80069c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80069f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006a2:	48 89 ce             	mov    rsi,rcx
  8006a5:	89 c7                	mov    edi,eax
  8006a7:	e8 31 19 00 00       	call   801fdd <sys_read>
  8006ac:	e9 fe 00 00 00       	jmp    8007af <syscall+0x241>
        case 14:return sys_write(b,c,d);
  8006b1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006b4:	48 98                	cdqe   
  8006b6:	48 89 c1             	mov    rcx,rax
  8006b9:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006bc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006bf:	48 89 ce             	mov    rsi,rcx
  8006c2:	89 c7                	mov    edi,eax
  8006c4:	e8 83 18 00 00       	call   801f4c <sys_write>
  8006c9:	e9 e1 00 00 00       	jmp    8007af <syscall+0x241>
        case 15:return sys_seek(b,c,d);
  8006ce:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006d1:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006d4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006d7:	89 ce                	mov    esi,ecx
  8006d9:	89 c7                	mov    edi,eax
  8006db:	e8 8e 19 00 00       	call   80206e <sys_seek>
  8006e0:	e9 ca 00 00 00       	jmp    8007af <syscall+0x241>
        case 16:return sys_tell(b);
  8006e5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006e8:	89 c7                	mov    edi,eax
  8006ea:	e8 c6 19 00 00       	call   8020b5 <sys_tell>
  8006ef:	e9 bb 00 00 00       	jmp    8007af <syscall+0x241>
        case 17:return reg_vol(b,c,d);
  8006f4:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006f7:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006fa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006fd:	89 ce                	mov    esi,ecx
  8006ff:	89 c7                	mov    edi,eax
  800701:	b8 00 00 00 00       	mov    eax,0x0
  800706:	e8 e8 11 00 00       	call   8018f3 <reg_vol>
  80070b:	e9 9f 00 00 00       	jmp    8007af <syscall+0x241>
        case 18:return free_vol(b);
  800710:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800713:	89 c7                	mov    edi,eax
  800715:	b8 00 00 00 00       	mov    eax,0x0
  80071a:	e8 b8 11 00 00       	call   8018d7 <free_vol>
  80071f:	e9 8b 00 00 00       	jmp    8007af <syscall+0x241>
        case 19:return execute(b);
  800724:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800727:	48 98                	cdqe   
  800729:	48 89 c7             	mov    rdi,rax
  80072c:	e8 2c 45 00 00       	call   804c5d <execute>
  800731:	eb 7c                	jmp    8007af <syscall+0x241>
        case SYSCALL_EXIT:return sys_exit(b);
  800733:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800736:	89 c7                	mov    edi,eax
  800738:	e8 0b 3e 00 00       	call   804548 <sys_exit>
  80073d:	eb 70                	jmp    8007af <syscall+0x241>
        case SYSCALL_CALL:return exec_call(b);
  80073f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800742:	48 98                	cdqe   
  800744:	48 89 c7             	mov    rdi,rax
  800747:	e8 0c 46 00 00       	call   804d58 <exec_call>
  80074c:	eb 61                	jmp    8007af <syscall+0x241>
        case SYSCALL_MKFIFO:return sys_mkfifo(b);
  80074e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800751:	89 c7                	mov    edi,eax
  800753:	e8 20 10 00 00       	call   801778 <sys_mkfifo>
  800758:	eb 55                	jmp    8007af <syscall+0x241>
        case SYSCALL_MALLOC:return sys_malloc(b);
  80075a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80075d:	89 c7                	mov    edi,eax
  80075f:	e8 bb 3f 00 00       	call   80471f <sys_malloc>
  800764:	eb 49                	jmp    8007af <syscall+0x241>
        case SYSCALL_FREE:return sys_free(b);
  800766:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800769:	89 c7                	mov    edi,eax
  80076b:	e8 3d 41 00 00       	call   8048ad <sys_free>
  800770:	eb 3d                	jmp    8007af <syscall+0x241>
        case SYSCALL_KB_READC:return sys_getkbc();
  800772:	b8 00 00 00 00       	mov    eax,0x0
  800777:	e8 22 58 00 00       	call   805f9e <sys_getkbc>
  80077c:	0f be c0             	movsx  eax,al
  80077f:	eb 2e                	jmp    8007af <syscall+0x241>
        case SYSCALL_FIND_DEV:return sys_find_dev(b);
  800781:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800784:	48 98                	cdqe   
  800786:	48 89 c7             	mov    rdi,rax
  800789:	e8 15 26 00 00       	call   802da3 <sys_find_dev>
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
  8007a8:	e8 88 26 00 00       	call   802e35 <sys_operate_dev>
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
  8007d9:	e8 5a 03 00 00       	call   800b38 <init_logging>
        
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
  80080a:	48 8b 04 c5 c8 18 81 	mov    rax,QWORD PTR [rax*8+0x8118c8]
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
  80081e:	e8 cd 07 00 00       	call   800ff0 <set_high_mem_base>
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
  800854:	e8 ae 07 00 00       	call   801007 <set_mem_area>
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
  8008dd:	e8 f3 4e 00 00       	call   8057d5 <set_framebuffer>
  8008e2:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  8008e6:	b8 00 00 00 00       	mov    eax,0x0
  8008eb:	e8 30 4d 00 00       	call   805620 <init_framebuffer>
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
  800ab4:	e8 26 4c 00 00       	call   8056df <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800ab9:	bf 88 18 81 00       	mov    edi,0x811888
  800abe:	e8 ce 50 00 00       	call   805b91 <print>
    init_int();
  800ac3:	b8 00 00 00 00       	mov    eax,0x0
  800ac8:	e8 33 f5 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800acd:	bf a5 18 81 00       	mov    edi,0x8118a5
  800ad2:	e8 ba 50 00 00       	call   805b91 <print>
    init_com(PORT_COM1);
  800ad7:	bf f8 03 00 00       	mov    edi,0x3f8
  800adc:	e8 f8 88 00 00       	call   8093d9 <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800ae1:	be f8 03 00 00       	mov    esi,0x3f8
  800ae6:	bf b2 18 81 00       	mov    edi,0x8118b2
  800aeb:	e8 35 8a 00 00       	call   809525 <com_puts>
	init_paging();
  800af0:	b8 00 00 00 00       	mov    eax,0x0
  800af5:	e8 eb 04 00 00       	call   800fe5 <init_paging>
// 	init_gdt();
    init_memory();
  800afa:	b8 00 00 00 00       	mov    eax,0x0
  800aff:	e8 aa 07 00 00       	call   8012ae <init_memory>
    init_drvdev_man();
  800b04:	b8 00 00 00 00       	mov    eax,0x0
  800b09:	e8 43 1e 00 00       	call   802951 <init_drvdev_man>
    init_proc();
  800b0e:	b8 00 00 00 00       	mov    eax,0x0
  800b13:	e8 24 2d 00 00       	call   80383c <init_proc>
    //自带驱动
    //init_tty();
    init_kb();
  800b18:	b8 00 00 00 00       	mov    eax,0x0
  800b1d:	e8 d6 52 00 00       	call   805df8 <init_kb>
    init_disk();
  800b22:	b8 00 00 00 00       	mov    eax,0x0
  800b27:	e8 d6 54 00 00       	call   806002 <init_disk>

	//init_vfs();
    //init_fat16();
	manage_proc_lock=0;
  800b2c:	c7 05 d2 93 00 00 00 	mov    DWORD PTR [rip+0x93d2],0x0        # 809f08 <manage_proc_lock>
  800b33:	00 00 00 
    while (1);
  800b36:	eb fe                	jmp    800b36 <main+0x385>

0000000000800b38 <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800b38:	f3 0f 1e fa          	endbr64 
  800b3c:	55                   	push   rbp
  800b3d:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800b40:	48 c7 05 b5 f4 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff4b5],0xb8000        # 400000 <video>
  800b47:	00 80 0b 00 
    xpos=0;
  800b4b:	c7 05 b3 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff4b3],0x0        # 400008 <xpos>
  800b52:	00 00 00 
    ypos=0;
  800b55:	c7 05 ad f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff4ad],0x0        # 40000c <ypos>
  800b5c:	00 00 00 
}
  800b5f:	90                   	nop
  800b60:	5d                   	pop    rbp
  800b61:	c3                   	ret    

0000000000800b62 <itoa>:

static void itoa (char *buf, int base, int d)
{
  800b62:	f3 0f 1e fa          	endbr64 
  800b66:	55                   	push   rbp
  800b67:	48 89 e5             	mov    rbp,rsp
  800b6a:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800b6e:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800b71:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800b74:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800b78:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800b7c:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800b7f:	48 98                	cdqe   
  800b81:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800b85:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800b8c:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800b90:	75 27                	jne    800bb9 <itoa+0x57>
  800b92:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800b96:	79 21                	jns    800bb9 <itoa+0x57>
    {
        *p++ = '-';
  800b98:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800b9c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800ba0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800ba4:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800ba7:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800bac:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800baf:	f7 d8                	neg    eax
  800bb1:	48 98                	cdqe   
  800bb3:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800bb7:	eb 0d                	jmp    800bc6 <itoa+0x64>
    }
    else if (base == 'x')
  800bb9:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800bbd:	75 07                	jne    800bc6 <itoa+0x64>
        divisor = 16;
  800bbf:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800bc6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800bc9:	48 63 c8             	movsxd rcx,eax
  800bcc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800bd0:	ba 00 00 00 00       	mov    edx,0x0
  800bd5:	48 f7 f1             	div    rcx
  800bd8:	48 89 d0             	mov    rax,rdx
  800bdb:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800bde:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800be2:	7f 0a                	jg     800bee <itoa+0x8c>
  800be4:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800be7:	83 c0 30             	add    eax,0x30
  800bea:	89 c1                	mov    ecx,eax
  800bec:	eb 08                	jmp    800bf6 <itoa+0x94>
  800bee:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800bf1:	83 c0 57             	add    eax,0x57
  800bf4:	89 c1                	mov    ecx,eax
  800bf6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800bfa:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800bfe:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c02:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800c04:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c07:	48 63 f0             	movsxd rsi,eax
  800c0a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c0e:	ba 00 00 00 00       	mov    edx,0x0
  800c13:	48 f7 f6             	div    rsi
  800c16:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c1a:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800c1f:	75 a5                	jne    800bc6 <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800c21:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c25:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800c28:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800c2c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800c30:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c34:	48 83 e8 01          	sub    rax,0x1
  800c38:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800c3c:	eb 2b                	jmp    800c69 <itoa+0x107>
    {
        char tmp = *p1;
  800c3e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c42:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800c45:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800c48:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c4c:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800c4f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c53:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800c55:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c59:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800c5d:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800c5f:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800c64:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800c69:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c6d:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800c71:	72 cb                	jb     800c3e <itoa+0xdc>
    }
}
  800c73:	90                   	nop
  800c74:	90                   	nop
  800c75:	5d                   	pop    rbp
  800c76:	c3                   	ret    

0000000000800c77 <putchar>:
 
/* 在屏幕上输出字符 C 。 */
static void putchar (int c)
{
  800c77:	f3 0f 1e fa          	endbr64 
  800c7b:	55                   	push   rbp
  800c7c:	48 89 e5             	mov    rbp,rsp
  800c7f:	48 83 ec 10          	sub    rsp,0x10
  800c83:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    print(&c);
  800c86:	48 8d 45 fc          	lea    rax,[rbp-0x4]
  800c8a:	48 89 c7             	mov    rdi,rax
  800c8d:	e8 ff 4e 00 00       	call   805b91 <print>
    return;
  800c92:	90                   	nop
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800c93:	c9                   	leave  
  800c94:	c3                   	ret    

0000000000800c95 <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800c95:	f3 0f 1e fa          	endbr64 
  800c99:	55                   	push   rbp
  800c9a:	48 89 e5             	mov    rbp,rsp
  800c9d:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800ca4:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800cab:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800cb2:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800cb9:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800cc0:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800cc7:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800cce:	84 c0                	test   al,al
  800cd0:	74 20                	je     800cf2 <printf+0x5d>
  800cd2:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800cd6:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800cda:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800cde:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800ce2:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800ce6:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800cea:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800cee:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800cf2:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800cf9:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    int c;
    char buf[20];
 
    arg++;
  800d00:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800d07:	08 
 
    while ((c = *format++) != 0)
  800d08:	e9 38 01 00 00       	jmp    800e45 <printf+0x1b0>
    {
        if (c != '%')
  800d0d:	83 bd 3c ff ff ff 25 	cmp    DWORD PTR [rbp-0xc4],0x25
  800d14:	74 12                	je     800d28 <printf+0x93>
            putchar (c);
  800d16:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  800d1c:	89 c7                	mov    edi,eax
  800d1e:	e8 54 ff ff ff       	call   800c77 <putchar>
  800d23:	e9 1d 01 00 00       	jmp    800e45 <printf+0x1b0>
        else
        {
            char *p;
 
            c = *format++;
  800d28:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800d2f:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800d33:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800d3a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800d3d:	0f be c0             	movsx  eax,al
  800d40:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
            switch (c)
  800d46:	83 bd 3c ff ff ff 78 	cmp    DWORD PTR [rbp-0xc4],0x78
  800d4d:	74 3a                	je     800d89 <printf+0xf4>
  800d4f:	83 bd 3c ff ff ff 78 	cmp    DWORD PTR [rbp-0xc4],0x78
  800d56:	0f 8f cd 00 00 00    	jg     800e29 <printf+0x194>
  800d5c:	83 bd 3c ff ff ff 75 	cmp    DWORD PTR [rbp-0xc4],0x75
  800d63:	74 24                	je     800d89 <printf+0xf4>
  800d65:	83 bd 3c ff ff ff 75 	cmp    DWORD PTR [rbp-0xc4],0x75
  800d6c:	0f 8f b7 00 00 00    	jg     800e29 <printf+0x194>
  800d72:	83 bd 3c ff ff ff 64 	cmp    DWORD PTR [rbp-0xc4],0x64
  800d79:	74 0e                	je     800d89 <printf+0xf4>
  800d7b:	83 bd 3c ff ff ff 73 	cmp    DWORD PTR [rbp-0xc4],0x73
  800d82:	74 40                	je     800dc4 <printf+0x12f>
  800d84:	e9 a0 00 00 00       	jmp    800e29 <printf+0x194>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800d89:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800d90:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800d94:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800d9b:	8b 10                	mov    edx,DWORD PTR [rax]
  800d9d:	8b 8d 3c ff ff ff    	mov    ecx,DWORD PTR [rbp-0xc4]
  800da3:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800daa:	89 ce                	mov    esi,ecx
  800dac:	48 89 c7             	mov    rdi,rax
  800daf:	e8 ae fd ff ff       	call   800b62 <itoa>
                p = buf;
  800db4:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800dbb:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800dc2:	eb 34                	jmp    800df8 <printf+0x163>
                break;
 
            case 's':
                p = *arg++;
  800dc4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800dcb:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800dcf:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800dd6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800dd9:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800de0:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800de7:	00 
  800de8:	75 0d                	jne    800df7 <printf+0x162>
                    p = "(null)";
  800dea:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x811910
  800df1:	10 19 81 00 
  800df5:	eb 22                	jmp    800e19 <printf+0x184>
 
string:
  800df7:	90                   	nop
                while (*p)
  800df8:	eb 1f                	jmp    800e19 <printf+0x184>
                    putchar (*p++);
  800dfa:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e01:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e05:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800e0c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e0f:	0f be c0             	movsx  eax,al
  800e12:	89 c7                	mov    edi,eax
  800e14:	e8 5e fe ff ff       	call   800c77 <putchar>
                while (*p)
  800e19:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e20:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e23:	84 c0                	test   al,al
  800e25:	75 d3                	jne    800dfa <printf+0x165>
                break;
  800e27:	eb 1c                	jmp    800e45 <printf+0x1b0>
 
            default:
                putchar (*((int *) arg++));
  800e29:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e30:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e34:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e3b:	8b 00                	mov    eax,DWORD PTR [rax]
  800e3d:	89 c7                	mov    edi,eax
  800e3f:	e8 33 fe ff ff       	call   800c77 <putchar>
                break;
  800e44:	90                   	nop
    while ((c = *format++) != 0)
  800e45:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800e4c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e50:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800e57:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e5a:	0f be c0             	movsx  eax,al
  800e5d:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
  800e63:	83 bd 3c ff ff ff 00 	cmp    DWORD PTR [rbp-0xc4],0x0
  800e6a:	0f 85 9d fe ff ff    	jne    800d0d <printf+0x78>
            }
        }
    }
}
  800e70:	90                   	nop
  800e71:	90                   	nop
  800e72:	c9                   	leave  
  800e73:	c3                   	ret    

0000000000800e74 <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800e74:	f3 0f 1e fa          	endbr64 
  800e78:	55                   	push   rbp
  800e79:	48 89 e5             	mov    rbp,rsp
  800e7c:	48 83 ec 40          	sub    rsp,0x40
  800e80:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800e84:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800e88:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800e8b:	48 8b 15 8e 90 00 00 	mov    rdx,QWORD PTR [rip+0x908e]        # 809f20 <pml4>
  800e92:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800e96:	48 c1 e8 27          	shr    rax,0x27
  800e9a:	48 c1 e0 03          	shl    rax,0x3
  800e9e:	48 01 d0             	add    rax,rdx
  800ea1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800ea4:	b0 00                	mov    al,0x0
  800ea6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800eaa:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800eb1:	00 00 00 
  800eb4:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800eb8:	48 c1 e8 1e          	shr    rax,0x1e
  800ebc:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800ebf:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800ec2:	48 98                	cdqe   
  800ec4:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800ecb:	00 
  800ecc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800ed0:	48 01 d0             	add    rax,rdx
  800ed3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800ed6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800eda:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ede:	83 e0 01             	and    eax,0x1
  800ee1:	48 85 c0             	test   rax,rax
  800ee4:	75 2f                	jne    800f15 <mmap+0xa1>
    {
        pdp=(page_item*)vmalloc();
  800ee6:	b8 00 00 00 00       	mov    eax,0x0
  800eeb:	e8 9a 01 00 00       	call   80108a <vmalloc>
  800ef0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        pdptp[pdpti]=(addr_t)pdp|attr;
  800ef4:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800ef7:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800efb:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800efe:	48 98                	cdqe   
  800f00:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f07:	00 
  800f08:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f0c:	48 01 f0             	add    rax,rsi
  800f0f:	48 09 ca             	or     rdx,rcx
  800f12:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800f15:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f19:	b0 00                	mov    al,0x0
  800f1b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800f1f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f23:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f28:	48 c1 e8 15          	shr    rax,0x15
  800f2c:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f33:	00 
  800f34:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f38:	48 01 d0             	add    rax,rdx
  800f3b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f3e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800f42:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f46:	83 e0 01             	and    eax,0x1
  800f49:	48 85 c0             	test   rax,rax
  800f4c:	75 37                	jne    800f85 <mmap+0x111>
    {
        pt=(page_item*)vmalloc();
  800f4e:	b8 00 00 00 00       	mov    eax,0x0
  800f53:	e8 32 01 00 00       	call   80108a <vmalloc>
  800f58:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800f5c:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f5f:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800f63:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f67:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f6c:	48 c1 e8 15          	shr    rax,0x15
  800f70:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f77:	00 
  800f78:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f7c:	48 01 f0             	add    rax,rsi
  800f7f:	48 09 ca             	or     rdx,rcx
  800f82:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  800f85:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f89:	b0 00                	mov    al,0x0
  800f8b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  800f8f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  800f92:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  800f96:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  800f9c:	48 c1 ea 0c          	shr    rdx,0xc
  800fa0:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  800fa7:	00 
  800fa8:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800fac:	48 01 ca             	add    rdx,rcx
  800faf:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  800fb3:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  800fb6:	b8 00 00 00 00       	mov    eax,0x0
}
  800fbb:	c9                   	leave  
  800fbc:	c3                   	ret    

0000000000800fbd <mdemap>:

stat_t mdemap(addr_t la)
{
  800fbd:	f3 0f 1e fa          	endbr64 
  800fc1:	55                   	push   rbp
  800fc2:	48 89 e5             	mov    rbp,rsp
  800fc5:	48 83 ec 10          	sub    rsp,0x10
  800fc9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  800fcd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fd1:	ba 00 00 00 00       	mov    edx,0x0
  800fd6:	48 89 c6             	mov    rsi,rax
  800fd9:	bf 00 00 00 00       	mov    edi,0x0
  800fde:	e8 91 fe ff ff       	call   800e74 <mmap>
}
  800fe3:	c9                   	leave  
  800fe4:	c3                   	ret    

0000000000800fe5 <init_paging>:
int init_paging()
{
  800fe5:	f3 0f 1e fa          	endbr64 
  800fe9:	55                   	push   rbp
  800fea:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  800fed:	90                   	nop
  800fee:	5d                   	pop    rbp
  800fef:	c3                   	ret    

0000000000800ff0 <set_high_mem_base>:
void set_high_mem_base(int base)
{
  800ff0:	f3 0f 1e fa          	endbr64 
  800ff4:	55                   	push   rbp
  800ff5:	48 89 e5             	mov    rbp,rsp
  800ff8:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  800ffb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  800ffe:	89 05 34 8f 00 00    	mov    DWORD PTR [rip+0x8f34],eax        # 809f38 <high_mem_base>
}
  801004:	90                   	nop
  801005:	5d                   	pop    rbp
  801006:	c3                   	ret    

0000000000801007 <set_mem_area>:
void set_mem_area(int base,int len,int type)
{
  801007:	f3 0f 1e fa          	endbr64 
  80100b:	55                   	push   rbp
  80100c:	48 89 e5             	mov    rbp,rsp
  80100f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  801012:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  801015:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    mmap_struct[mmap_t_i].base=base;
  801018:	8b 05 12 f2 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff212]        # 400230 <mmap_t_i>
  80101e:	48 63 d0             	movsxd rdx,eax
  801021:	48 89 d0             	mov    rax,rdx
  801024:	48 01 c0             	add    rax,rax
  801027:	48 01 d0             	add    rax,rdx
  80102a:	48 c1 e0 02          	shl    rax,0x2
  80102e:	48 8d 90 40 01 40 00 	lea    rdx,[rax+0x400140]
  801035:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801038:	89 02                	mov    DWORD PTR [rdx],eax
    mmap_struct[mmap_t_i].len=len;
  80103a:	8b 05 f0 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff1f0]        # 400230 <mmap_t_i>
  801040:	48 63 d0             	movsxd rdx,eax
  801043:	48 89 d0             	mov    rax,rdx
  801046:	48 01 c0             	add    rax,rax
  801049:	48 01 d0             	add    rax,rdx
  80104c:	48 c1 e0 02          	shl    rax,0x2
  801050:	48 8d 90 44 01 40 00 	lea    rdx,[rax+0x400144]
  801057:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80105a:	89 02                	mov    DWORD PTR [rdx],eax
    mmap_struct[mmap_t_i++].type=type;
  80105c:	8b 05 ce f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff1ce]        # 400230 <mmap_t_i>
  801062:	8d 50 01             	lea    edx,[rax+0x1]
  801065:	89 15 c5 f1 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff1c5],edx        # 400230 <mmap_t_i>
  80106b:	48 63 d0             	movsxd rdx,eax
  80106e:	48 89 d0             	mov    rax,rdx
  801071:	48 01 c0             	add    rax,rax
  801074:	48 01 d0             	add    rax,rdx
  801077:	48 c1 e0 02          	shl    rax,0x2
  80107b:	48 8d 90 48 01 40 00 	lea    rdx,[rax+0x400148]
  801082:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801085:	89 02                	mov    DWORD PTR [rdx],eax
}
  801087:	90                   	nop
  801088:	5d                   	pop    rbp
  801089:	c3                   	ret    

000000000080108a <vmalloc>:
addr_t vmalloc()
{
  80108a:	f3 0f 1e fa          	endbr64 
  80108e:	55                   	push   rbp
  80108f:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  801092:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801099:	eb 76                	jmp    801111 <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  80109b:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8010a2:	eb 63                	jmp    801107 <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  8010a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010a7:	48 98                	cdqe   
  8010a9:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [rax*4+0x400120]
  8010b0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8010b3:	be 01 00 00 00       	mov    esi,0x1
  8010b8:	89 c1                	mov    ecx,eax
  8010ba:	d3 e6                	shl    esi,cl
  8010bc:	89 f0                	mov    eax,esi
  8010be:	21 d0                	and    eax,edx
  8010c0:	85 c0                	test   eax,eax
  8010c2:	75 3f                	jne    801103 <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  8010c4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010c7:	48 98                	cdqe   
  8010c9:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [rax*4+0x400120]
  8010d0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8010d3:	be 01 00 00 00       	mov    esi,0x1
  8010d8:	89 c1                	mov    ecx,eax
  8010da:	d3 e6                	shl    esi,cl
  8010dc:	89 f0                	mov    eax,esi
  8010de:	09 c2                	or     edx,eax
  8010e0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010e3:	48 98                	cdqe   
  8010e5:	89 14 85 20 01 40 00 	mov    DWORD PTR [rax*4+0x400120],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  8010ec:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010ef:	c1 e0 05             	shl    eax,0x5
  8010f2:	89 c2                	mov    edx,eax
  8010f4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8010f7:	01 d0                	add    eax,edx
  8010f9:	83 c0 20             	add    eax,0x20
  8010fc:	c1 e0 0c             	shl    eax,0xc
  8010ff:	48 98                	cdqe   
  801101:	eb 14                	jmp    801117 <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  801103:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801107:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80110b:	7e 97                	jle    8010a4 <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  80110d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801111:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  801115:	7e 84                	jle    80109b <vmalloc+0x11>
            }
        }
    }
}
  801117:	5d                   	pop    rbp
  801118:	c3                   	ret    

0000000000801119 <vmfree>:

int vmfree(addr_t ptr)
{
  801119:	f3 0f 1e fa          	endbr64 
  80111d:	55                   	push   rbp
  80111e:	48 89 e5             	mov    rbp,rsp
  801121:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  801125:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801129:	48 c1 e8 0c          	shr    rax,0xc
  80112d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  801130:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801133:	8d 50 1f             	lea    edx,[rax+0x1f]
  801136:	85 c0                	test   eax,eax
  801138:	0f 48 c2             	cmovs  eax,edx
  80113b:	c1 f8 05             	sar    eax,0x5
  80113e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  801141:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801144:	99                   	cdq    
  801145:	c1 ea 1b             	shr    edx,0x1b
  801148:	01 d0                	add    eax,edx
  80114a:	83 e0 1f             	and    eax,0x1f
  80114d:	29 d0                	sub    eax,edx
  80114f:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  801152:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801155:	48 98                	cdqe   
  801157:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [rax*4+0x400120]
  80115e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801161:	be 01 00 00 00       	mov    esi,0x1
  801166:	89 c1                	mov    ecx,eax
  801168:	d3 e6                	shl    esi,cl
  80116a:	89 f0                	mov    eax,esi
  80116c:	f7 d0                	not    eax
  80116e:	21 c2                	and    edx,eax
  801170:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801173:	48 98                	cdqe   
  801175:	89 14 85 20 01 40 00 	mov    DWORD PTR [rax*4+0x400120],edx
}
  80117c:	90                   	nop
  80117d:	5d                   	pop    rbp
  80117e:	c3                   	ret    

000000000080117f <page_err>:
void page_err(){
  80117f:	f3 0f 1e fa          	endbr64 
  801183:	55                   	push   rbp
  801184:	48 89 e5             	mov    rbp,rsp
  801187:	53                   	push   rbx
  801188:	48 83 ec 28          	sub    rsp,0x28
    asm("cli");
  80118c:	fa                   	cli    
    print("page err\n");
  80118d:	bf 18 19 81 00       	mov    edi,0x811918
  801192:	e8 fa 49 00 00       	call   805b91 <print>
    unsigned long err_code=0,l_addr=0;
  801197:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80119e:	00 
  80119f:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  8011a6:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  8011a7:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  8011ab:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  8011af:	0f 20 d0             	mov    rax,cr2
  8011b2:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  8011b6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8011ba:	83 e0 01             	and    eax,0x1
  8011bd:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  8011c0:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8011c4:	75 27                	jne    8011ed <page_err+0x6e>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        mmap(vmalloc(),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  8011c6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8011ca:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  8011d0:	48 89 c3             	mov    rbx,rax
  8011d3:	b8 00 00 00 00       	mov    eax,0x0
  8011d8:	e8 ad fe ff ff       	call   80108a <vmalloc>
  8011dd:	ba 07 00 00 00       	mov    edx,0x7
  8011e2:	48 89 de             	mov    rsi,rbx
  8011e5:	48 89 c7             	mov    rdi,rax
  8011e8:	e8 87 fc ff ff       	call   800e74 <mmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  8011ed:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8011f1:	83 e0 02             	and    eax,0x2
  8011f4:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("when writing\n");else //puts("when reading");
  8011f7:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8011fb:	74 0c                	je     801209 <page_err+0x8a>
  8011fd:	bf 22 19 81 00       	mov    edi,0x811922
  801202:	e8 8a 49 00 00       	call   805b91 <print>
  801207:	eb 0a                	jmp    801213 <page_err+0x94>
    p=err_code&4;
  801209:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80120d:	83 e0 04             	and    eax,0x4
  801210:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  801213:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801217:	75 0c                	jne    801225 <page_err+0xa6>
  801219:	bf 30 19 81 00       	mov    edi,0x811930
  80121e:	e8 6e 49 00 00       	call   805b91 <print>
  801223:	eb 0a                	jmp    80122f <page_err+0xb0>
    p=err_code&16;
  801225:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801229:	83 e0 10             	and    eax,0x10
  80122c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  80122f:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801233:	74 0a                	je     80123f <page_err+0xc0>
  801235:	bf 48 19 81 00       	mov    edi,0x811948
  80123a:	e8 52 49 00 00       	call   805b91 <print>
    unsigned int addr=0;
  80123f:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%ebp),%0":"=r"(addr));
  801246:	67 8b 45 08          	mov    eax,DWORD PTR [ebp+0x8]
  80124a:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  80124d:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  801251:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  801254:	89 c6                	mov    esi,eax
  801256:	bf 68 19 81 00       	mov    edi,0x811968
  80125b:	b8 00 00 00 00       	mov    eax,0x0
  801260:	e8 30 fa ff ff       	call   800c95 <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  801265:	48 8b 15 34 72 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc07234]        # 4084a0 <task>
  80126c:	8b 05 fe 0d c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10dfe]        # 412070 <cur_proc>
  801272:	48 98                	cdqe   
  801274:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80127b:	48 01 d0             	add    rax,rdx
  80127e:	8b 00                	mov    eax,DWORD PTR [rax]
  801280:	83 f8 01             	cmp    eax,0x1
  801283:	75 11                	jne    801296 <page_err+0x117>
    {
        printf("sys died. please reboot.\n");
  801285:	bf 8a 19 81 00       	mov    edi,0x81198a
  80128a:	b8 00 00 00 00       	mov    eax,0x0
  80128f:	e8 01 fa ff ff       	call   800c95 <printf>
        asm volatile("jmp .");
  801294:	eb fe                	jmp    801294 <page_err+0x115>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  801296:	b8 00 00 00 00       	mov    eax,0x0
  80129b:	e8 fe 36 00 00       	call   80499e <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n leave\r\n add $8,%esp \r\n iretq");
  8012a0:	fb                   	sti    
  8012a1:	c9                   	leave  
  8012a2:	83 c4 08             	add    esp,0x8
  8012a5:	48 cf                	iretq  
}
  8012a7:	90                   	nop
  8012a8:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8012ac:	c9                   	leave  
  8012ad:	c3                   	ret    

00000000008012ae <init_memory>:
void init_memory()
{
  8012ae:	f3 0f 1e fa          	endbr64 
  8012b2:	55                   	push   rbp
  8012b3:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<8;i++){
  8012b6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8012bd:	eb 14                	jmp    8012d3 <init_memory+0x25>
        page_map[i]=0xffffffff;
  8012bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012c2:	48 98                	cdqe   
  8012c4:	c7 04 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],0xffffffff
  8012cb:	ff ff ff ff 
    for(int i=0;i<8;i++){
  8012cf:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8012d3:	83 7d fc 07          	cmp    DWORD PTR [rbp-0x4],0x7
  8012d7:	7e e6                	jle    8012bf <init_memory+0x11>
    剩下正常。
    asm volatile("mov ")
     */
    //page_index[768]=page_index[7];
    //page_index[7]=0;
}
  8012d9:	90                   	nop
  8012da:	90                   	nop
  8012db:	5d                   	pop    rbp
  8012dc:	c3                   	ret    

00000000008012dd <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  8012dd:	f3 0f 1e fa          	endbr64 
  8012e1:	55                   	push   rbp
  8012e2:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  8012e5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8012ec:	e9 8c 00 00 00       	jmp    80137d <req_a_page+0xa0>
        for(int j=0;j<32;j++){
  8012f1:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8012f8:	eb 79                	jmp    801373 <req_a_page+0x96>
            unsigned int bit=page_map[i]&(1<<j);
  8012fa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012fd:	48 98                	cdqe   
  8012ff:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  801306:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801309:	be 01 00 00 00       	mov    esi,0x1
  80130e:	89 c1                	mov    ecx,eax
  801310:	d3 e6                	shl    esi,cl
  801312:	89 f0                	mov    eax,esi
  801314:	21 d0                	and    eax,edx
  801316:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  801319:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80131c:	c1 e0 05             	shl    eax,0x5
  80131f:	89 c2                	mov    edx,eax
  801321:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801324:	01 d0                	add    eax,edx
  801326:	c1 e0 0c             	shl    eax,0xc
  801329:	3d ff ff 0f 00       	cmp    eax,0xfffff
  80132e:	7e 3f                	jle    80136f <req_a_page+0x92>
  801330:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  801334:	75 39                	jne    80136f <req_a_page+0x92>
            {
                page_map[i]=page_map[i]|(1<<j);
  801336:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801339:	48 98                	cdqe   
  80133b:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  801342:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801345:	be 01 00 00 00       	mov    esi,0x1
  80134a:	89 c1                	mov    ecx,eax
  80134c:	d3 e6                	shl    esi,cl
  80134e:	89 f0                	mov    eax,esi
  801350:	09 c2                	or     edx,eax
  801352:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801355:	48 98                	cdqe   
  801357:	89 14 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],edx
                return i*32+j;//num of page
  80135e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801361:	c1 e0 05             	shl    eax,0x5
  801364:	89 c2                	mov    edx,eax
  801366:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801369:	01 d0                	add    eax,edx
  80136b:	48 98                	cdqe   
  80136d:	eb 18                	jmp    801387 <req_a_page+0xaa>
        for(int j=0;j<32;j++){
  80136f:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801373:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801377:	7e 81                	jle    8012fa <req_a_page+0x1d>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801379:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80137d:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801381:	0f 8e 6a ff ff ff    	jle    8012f1 <req_a_page+0x14>

            }
        }
    }
}
  801387:	5d                   	pop    rbp
  801388:	c3                   	ret    

0000000000801389 <free_page>:

int free_page(char *paddr){
  801389:	f3 0f 1e fa          	endbr64 
  80138d:	55                   	push   rbp
  80138e:	48 89 e5             	mov    rbp,rsp
  801391:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  801395:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801399:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80139f:	85 c0                	test   eax,eax
  8013a1:	0f 48 c2             	cmovs  eax,edx
  8013a4:	c1 f8 0c             	sar    eax,0xc
  8013a7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8013aa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8013ad:	8d 50 1f             	lea    edx,[rax+0x1f]
  8013b0:	85 c0                	test   eax,eax
  8013b2:	0f 48 c2             	cmovs  eax,edx
  8013b5:	c1 f8 05             	sar    eax,0x5
  8013b8:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8013bb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8013be:	99                   	cdq    
  8013bf:	c1 ea 1b             	shr    edx,0x1b
  8013c2:	01 d0                	add    eax,edx
  8013c4:	83 e0 1f             	and    eax,0x1f
  8013c7:	29 d0                	sub    eax,edx
  8013c9:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  8013cc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8013cf:	48 98                	cdqe   
  8013d1:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  8013d8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8013db:	be 01 00 00 00       	mov    esi,0x1
  8013e0:	89 c1                	mov    ecx,eax
  8013e2:	d3 e6                	shl    esi,cl
  8013e4:	89 f0                	mov    eax,esi
  8013e6:	f7 d0                	not    eax
  8013e8:	21 c2                	and    edx,eax
  8013ea:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8013ed:	48 98                	cdqe   
  8013ef:	89 14 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],edx
}
  8013f6:	90                   	nop
  8013f7:	5d                   	pop    rbp
  8013f8:	c3                   	ret    

00000000008013f9 <check_page>:
int check_page(int num){
  8013f9:	f3 0f 1e fa          	endbr64 
  8013fd:	55                   	push   rbp
  8013fe:	48 89 e5             	mov    rbp,rsp
  801401:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  801404:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801407:	8d 50 1f             	lea    edx,[rax+0x1f]
  80140a:	85 c0                	test   eax,eax
  80140c:	0f 48 c2             	cmovs  eax,edx
  80140f:	c1 f8 05             	sar    eax,0x5
  801412:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  801415:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801418:	99                   	cdq    
  801419:	c1 ea 1b             	shr    edx,0x1b
  80141c:	01 d0                	add    eax,edx
  80141e:	83 e0 1f             	and    eax,0x1f
  801421:	29 d0                	sub    eax,edx
  801423:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  801426:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801429:	48 98                	cdqe   
  80142b:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  801432:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801435:	be 01 00 00 00       	mov    esi,0x1
  80143a:	89 c1                	mov    ecx,eax
  80143c:	d3 e6                	shl    esi,cl
  80143e:	89 f0                	mov    eax,esi
  801440:	21 d0                	and    eax,edx
  801442:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  801445:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  801448:	5d                   	pop    rbp
  801449:	c3                   	ret    

000000000080144a <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  80144a:	f3 0f 1e fa          	endbr64 
  80144e:	55                   	push   rbp
  80144f:	48 89 e5             	mov    rbp,rsp
  801452:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  801455:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801458:	c1 e0 0c             	shl    eax,0xc
}
  80145b:	5d                   	pop    rbp
  80145c:	c3                   	ret    

000000000080145d <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  80145d:	f3 0f 1e fa          	endbr64 
  801461:	55                   	push   rbp
  801462:	48 89 e5             	mov    rbp,rsp
  801465:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801469:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  80146c:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  80146f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801473:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  80147a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80147e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801481:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801484:	89 c0                	mov    eax,eax
  801486:	25 00 f0 ff ff       	and    eax,0xfffff000
  80148b:	48 09 c2             	or     rdx,rax
  80148e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801492:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  801495:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801499:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80149c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80149f:	48 98                	cdqe   
  8014a1:	48 09 c2             	or     rdx,rax
  8014a4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8014a8:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8014ab:	90                   	nop
  8014ac:	5d                   	pop    rbp
  8014ad:	c3                   	ret    

00000000008014ae <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  8014ae:	f3 0f 1e fa          	endbr64 
  8014b2:	55                   	push   rbp
  8014b3:	48 89 e5             	mov    rbp,rsp
  8014b6:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8014ba:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  8014bd:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  8014c0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014c4:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  8014cb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014cf:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8014d2:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8014d5:	0c 81                	or     al,0x81
  8014d7:	89 c0                	mov    eax,eax
  8014d9:	48 09 c2             	or     rdx,rax
  8014dc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014e0:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  8014e3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8014e6:	25 00 00 00 c0       	and    eax,0xc0000000
  8014eb:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  8014ee:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014f2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8014f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014f8:	48 09 c2             	or     rdx,rax
  8014fb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014ff:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801502:	90                   	nop
  801503:	5d                   	pop    rbp
  801504:	c3                   	ret    

0000000000801505 <set_2mb_pde>:
void set_2mb_pde(page_item* pde,int pa)
{
  801505:	f3 0f 1e fa          	endbr64 
  801509:	55                   	push   rbp
  80150a:	48 89 e5             	mov    rbp,rsp
  80150d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801511:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    *pde=0;
  801514:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801518:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT;
  80151f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801523:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801526:	48 0d 81 10 00 00    	or     rax,0x1081
  80152c:	48 89 c2             	mov    rdx,rax
  80152f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801533:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  801536:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801539:	25 00 00 c0 ff       	and    eax,0xffc00000
  80153e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  801541:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801545:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801548:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80154b:	48 09 c2             	or     rdx,rax
  80154e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801552:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801555:	90                   	nop
  801556:	5d                   	pop    rbp
  801557:	c3                   	ret    

0000000000801558 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  801558:	f3 0f 1e fa          	endbr64 
  80155c:	55                   	push   rbp
  80155d:	48 89 e5             	mov    rbp,rsp
  801560:	48 83 ec 20          	sub    rsp,0x20
  801564:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801568:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  80156b:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  801570:	75 18                	jne    80158a <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  801572:	b8 00 00 00 00       	mov    eax,0x0
  801577:	e8 61 fd ff ff       	call   8012dd <req_a_page>
  80157c:	89 c7                	mov    edi,eax
  80157e:	e8 c7 fe ff ff       	call   80144a <get_phyaddr>
  801583:	48 98                	cdqe   
  801585:	e9 8e 00 00 00       	jmp    801618 <req_page_at+0xc0>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  80158a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80158e:	89 c2                	mov    edx,eax
  801590:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801593:	89 c6                	mov    esi,eax
  801595:	89 d7                	mov    edi,edx
  801597:	e8 3b 01 00 00       	call   8016d7 <is_pgs_ava>
  80159c:	85 c0                	test   eax,eax
  80159e:	75 09                	jne    8015a9 <req_page_at+0x51>
  8015a0:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  8015a7:	eb 6f                	jmp    801618 <req_page_at+0xc0>
    int pgni=base/4096;
  8015a9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8015ad:	48 c1 e8 0c          	shr    rax,0xc
  8015b1:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  8015b4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8015b7:	8d 50 1f             	lea    edx,[rax+0x1f]
  8015ba:	85 c0                	test   eax,eax
  8015bc:	0f 48 c2             	cmovs  eax,edx
  8015bf:	c1 f8 05             	sar    eax,0x5
  8015c2:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  8015c5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8015c8:	99                   	cdq    
  8015c9:	c1 ea 1b             	shr    edx,0x1b
  8015cc:	01 d0                	add    eax,edx
  8015ce:	83 e0 1f             	and    eax,0x1f
  8015d1:	29 d0                	sub    eax,edx
  8015d3:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  8015d6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8015dd:	eb 2c                	jmp    80160b <req_page_at+0xb3>
    {
        page_map[i]|=(1<<pgj);
  8015df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015e2:	48 98                	cdqe   
  8015e4:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  8015eb:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8015ee:	be 01 00 00 00       	mov    esi,0x1
  8015f3:	89 c1                	mov    ecx,eax
  8015f5:	d3 e6                	shl    esi,cl
  8015f7:	89 f0                	mov    eax,esi
  8015f9:	09 c2                	or     edx,eax
  8015fb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015fe:	48 98                	cdqe   
  801600:	89 14 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],edx
    for(int i=0;i<pgn;i++)
  801607:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80160b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80160e:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  801611:	7c cc                	jl     8015df <req_page_at+0x87>
    }
    return 0;
  801613:	b8 00 00 00 00       	mov    eax,0x0

}
  801618:	c9                   	leave  
  801619:	c3                   	ret    

000000000080161a <chk_vm>:
int chk_vm(int base, int pgn)
{
  80161a:	f3 0f 1e fa          	endbr64 
  80161e:	55                   	push   rbp
  80161f:	48 89 e5             	mov    rbp,rsp
  801622:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801625:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  801628:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80162f:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  801630:	0f 20 d8             	mov    rax,cr3
  801633:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  801637:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80163a:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  801640:	85 c0                	test   eax,eax
  801642:	0f 48 c2             	cmovs  eax,edx
  801645:	c1 f8 16             	sar    eax,0x16
  801648:	48 98                	cdqe   
  80164a:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801651:	00 
  801652:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801656:	48 01 d0             	add    rax,rdx
  801659:	8b 00                	mov    eax,DWORD PTR [rax]
  80165b:	89 c0                	mov    eax,eax
  80165d:	25 00 f0 ff ff       	and    eax,0xfffff000
  801662:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801666:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801669:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  80166f:	85 c0                	test   eax,eax
  801671:	0f 48 c2             	cmovs  eax,edx
  801674:	c1 f8 16             	sar    eax,0x16
  801677:	48 98                	cdqe   
  801679:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801680:	00 
  801681:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801685:	48 01 d0             	add    rax,rdx
  801688:	8b 00                	mov    eax,DWORD PTR [rax]
  80168a:	83 e0 01             	and    eax,0x1
  80168d:	85 c0                	test   eax,eax
  80168f:	74 38                	je     8016c9 <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  801691:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801694:	99                   	cdq    
  801695:	c1 ea 0a             	shr    edx,0xa
  801698:	01 d0                	add    eax,edx
  80169a:	25 ff ff 3f 00       	and    eax,0x3fffff
  80169f:	29 d0                	sub    eax,edx
  8016a1:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8016a7:	85 c0                	test   eax,eax
  8016a9:	0f 48 c2             	cmovs  eax,edx
  8016ac:	c1 f8 0c             	sar    eax,0xc
  8016af:	48 98                	cdqe   
  8016b1:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8016b8:	00 
  8016b9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8016bd:	48 01 d0             	add    rax,rdx
  8016c0:	8b 00                	mov    eax,DWORD PTR [rax]
  8016c2:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  8016c5:	85 c0                	test   eax,eax
  8016c7:	75 07                	jne    8016d0 <chk_vm+0xb6>
    {
        return -1;
  8016c9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8016ce:	eb 05                	jmp    8016d5 <chk_vm+0xbb>
    }
    return 0;
  8016d0:	b8 00 00 00 00       	mov    eax,0x0
}
  8016d5:	5d                   	pop    rbp
  8016d6:	c3                   	ret    

00000000008016d7 <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  8016d7:	f3 0f 1e fa          	endbr64 
  8016db:	55                   	push   rbp
  8016dc:	48 89 e5             	mov    rbp,rsp
  8016df:	48 83 ec 18          	sub    rsp,0x18
  8016e3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8016e6:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  8016e9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8016ec:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8016f2:	85 c0                	test   eax,eax
  8016f4:	0f 48 c2             	cmovs  eax,edx
  8016f7:	c1 f8 0c             	sar    eax,0xc
  8016fa:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  8016fd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801704:	eb 1e                	jmp    801724 <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801706:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801709:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80170c:	01 d0                	add    eax,edx
  80170e:	89 c7                	mov    edi,eax
  801710:	e8 e4 fc ff ff       	call   8013f9 <check_page>
  801715:	85 c0                	test   eax,eax
  801717:	74 07                	je     801720 <is_pgs_ava+0x49>
  801719:	b8 00 00 00 00       	mov    eax,0x0
  80171e:	eb 11                	jmp    801731 <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  801720:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801724:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801727:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  80172a:	7c da                	jl     801706 <is_pgs_ava+0x2f>
    }
    return 1;
  80172c:	b8 01 00 00 00       	mov    eax,0x1

}
  801731:	c9                   	leave  
  801732:	c3                   	ret    

0000000000801733 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  801733:	f3 0f 1e fa          	endbr64 
  801737:	55                   	push   rbp
  801738:	48 89 e5             	mov    rbp,rsp
  80173b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80173f:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  801743:	c6 05 f6 ea bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfeaf6],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  80174a:	c6 05 f0 ea bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfeaf0],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  801751:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801755:	48 89 05 ec ea bf ff 	mov    QWORD PTR [rip+0xffffffffffbfeaec],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  80175c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801760:	48 89 05 e9 ea bf ff 	mov    QWORD PTR [rip+0xffffffffffbfeae9],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  801767:	c7 05 ef ea bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfeaef],0x1        # 400260 <vols+0x20>
  80176e:	00 00 00 
    return 0;
  801771:	b8 00 00 00 00       	mov    eax,0x0
}
  801776:	5d                   	pop    rbp
  801777:	c3                   	ret    

0000000000801778 <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  801778:	f3 0f 1e fa          	endbr64 
  80177c:	55                   	push   rbp
  80177d:	48 89 e5             	mov    rbp,rsp
  801780:	48 83 ec 20          	sub    rsp,0x20
  801784:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  801787:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80178e:	eb 38                	jmp    8017c8 <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801790:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801793:	48 98                	cdqe   
  801795:	48 c1 e0 04          	shl    rax,0x4
  801799:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  80179f:	8b 00                	mov    eax,DWORD PTR [rax]
  8017a1:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8017a4:	75 1e                	jne    8017c4 <sys_mkfifo+0x4c>
  8017a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017a9:	48 98                	cdqe   
  8017ab:	48 c1 e0 04          	shl    rax,0x4
  8017af:	48 05 68 1e 40 00    	add    rax,0x401e68
  8017b5:	8b 00                	mov    eax,DWORD PTR [rax]
  8017b7:	83 f8 01             	cmp    eax,0x1
  8017ba:	75 08                	jne    8017c4 <sys_mkfifo+0x4c>
            return i;
  8017bc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017bf:	e9 a6 00 00 00       	jmp    80186a <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  8017c4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8017c8:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  8017cc:	7e c2                	jle    801790 <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  8017ce:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8017d5:	e9 81 00 00 00       	jmp    80185b <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  8017da:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017dd:	48 98                	cdqe   
  8017df:	48 c1 e0 04          	shl    rax,0x4
  8017e3:	48 05 68 1e 40 00    	add    rax,0x401e68
  8017e9:	8b 00                	mov    eax,DWORD PTR [rax]
  8017eb:	85 c0                	test   eax,eax
  8017ed:	75 68                	jne    801857 <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  8017ef:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017f2:	48 98                	cdqe   
  8017f4:	48 c1 e0 04          	shl    rax,0x4
  8017f8:	48 05 68 1e 40 00    	add    rax,0x401e68
  8017fe:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  801804:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801807:	48 98                	cdqe   
  801809:	48 c1 e0 04          	shl    rax,0x4
  80180d:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801814:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801817:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801819:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80181c:	48 98                	cdqe   
  80181e:	48 c1 e0 04          	shl    rax,0x4
  801822:	48 05 64 1e 40 00    	add    rax,0x401e64
  801828:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  80182e:	b8 00 00 00 00       	mov    eax,0x0
  801833:	e8 a5 fa ff ff       	call   8012dd <req_a_page>
  801838:	89 c7                	mov    edi,eax
  80183a:	e8 0b fc ff ff       	call   80144a <get_phyaddr>
  80183f:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801842:	48 63 d2             	movsxd rdx,edx
  801845:	48 c1 e2 04          	shl    rdx,0x4
  801849:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  801850:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  801852:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801855:	eb 13                	jmp    80186a <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801857:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80185b:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  80185f:	0f 8e 75 ff ff ff    	jle    8017da <sys_mkfifo+0x62>
        }
    }
    return -1;
  801865:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80186a:	c9                   	leave  
  80186b:	c3                   	ret    

000000000080186c <sys_rmfifo>:

int sys_rmfifo(int number)
{
  80186c:	f3 0f 1e fa          	endbr64 
  801870:	55                   	push   rbp
  801871:	48 89 e5             	mov    rbp,rsp
  801874:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801877:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80187e:	eb 4a                	jmp    8018ca <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801880:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801883:	48 98                	cdqe   
  801885:	48 c1 e0 04          	shl    rax,0x4
  801889:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  80188f:	8b 00                	mov    eax,DWORD PTR [rax]
  801891:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801894:	75 30                	jne    8018c6 <sys_rmfifo+0x5a>
  801896:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801899:	48 98                	cdqe   
  80189b:	48 c1 e0 04          	shl    rax,0x4
  80189f:	48 05 68 1e 40 00    	add    rax,0x401e68
  8018a5:	8b 00                	mov    eax,DWORD PTR [rax]
  8018a7:	83 f8 01             	cmp    eax,0x1
  8018aa:	75 1a                	jne    8018c6 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  8018ac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018af:	48 98                	cdqe   
  8018b1:	48 c1 e0 04          	shl    rax,0x4
  8018b5:	48 05 68 1e 40 00    	add    rax,0x401e68
  8018bb:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  8018c1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018c4:	eb 0f                	jmp    8018d5 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  8018c6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8018ca:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  8018ce:	7e b0                	jle    801880 <sys_rmfifo+0x14>
        }
    }
    return -1;
  8018d0:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8018d5:	5d                   	pop    rbp
  8018d6:	c3                   	ret    

00000000008018d7 <free_vol>:
int free_vol(int voli)
{
  8018d7:	f3 0f 1e fa          	endbr64 
  8018db:	55                   	push   rbp
  8018dc:	48 89 e5             	mov    rbp,rsp
  8018df:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  8018e2:	c7 05 74 e9 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe974],0x0        # 400260 <vols+0x20>
  8018e9:	00 00 00 
    return 0;
  8018ec:	b8 00 00 00 00       	mov    eax,0x0
}
  8018f1:	5d                   	pop    rbp
  8018f2:	c3                   	ret    

00000000008018f3 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  8018f3:	f3 0f 1e fa          	endbr64 
  8018f7:	55                   	push   rbp
  8018f8:	48 89 e5             	mov    rbp,rsp
  8018fb:	48 83 ec 20          	sub    rsp,0x20
  8018ff:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801902:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801905:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801909:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801910:	e9 d8 00 00 00       	jmp    8019ed <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801915:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801918:	48 63 d0             	movsxd rdx,eax
  80191b:	48 89 d0             	mov    rax,rdx
  80191e:	48 c1 e0 02          	shl    rax,0x2
  801922:	48 01 d0             	add    rax,rdx
  801925:	48 c1 e0 03          	shl    rax,0x3
  801929:	48 05 60 02 40 00    	add    rax,0x400260
  80192f:	8b 00                	mov    eax,DWORD PTR [rax]
  801931:	85 c0                	test   eax,eax
  801933:	0f 85 b0 00 00 00    	jne    8019e9 <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801939:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80193c:	48 63 d0             	movsxd rdx,eax
  80193f:	48 89 d0             	mov    rax,rdx
  801942:	48 c1 e0 02          	shl    rax,0x2
  801946:	48 01 d0             	add    rax,rdx
  801949:	48 c1 e0 03          	shl    rax,0x3
  80194d:	48 05 60 02 40 00    	add    rax,0x400260
  801953:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801959:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80195c:	48 63 d0             	movsxd rdx,eax
  80195f:	48 89 d0             	mov    rax,rdx
  801962:	48 01 c0             	add    rax,rax
  801965:	48 01 d0             	add    rax,rdx
  801968:	48 c1 e0 03          	shl    rax,0x3
  80196c:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801973:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801976:	48 63 d0             	movsxd rdx,eax
  801979:	48 89 d0             	mov    rax,rdx
  80197c:	48 c1 e0 02          	shl    rax,0x2
  801980:	48 01 d0             	add    rax,rdx
  801983:	48 c1 e0 03          	shl    rax,0x3
  801987:	48 05 58 02 40 00    	add    rax,0x400258
  80198d:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801990:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801993:	89 c7                	mov    edi,eax
  801995:	e8 0b 1b 00 00       	call   8034a5 <get_drv>
  80199a:	48 89 c2             	mov    rdx,rax
  80199d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019a0:	48 63 c8             	movsxd rcx,eax
  8019a3:	48 89 c8             	mov    rax,rcx
  8019a6:	48 c1 e0 02          	shl    rax,0x2
  8019aa:	48 01 c8             	add    rax,rcx
  8019ad:	48 c1 e0 03          	shl    rax,0x3
  8019b1:	48 05 48 02 40 00    	add    rax,0x400248
  8019b7:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  8019ba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019bd:	48 63 d0             	movsxd rdx,eax
  8019c0:	48 89 d0             	mov    rax,rdx
  8019c3:	48 c1 e0 02          	shl    rax,0x2
  8019c7:	48 01 d0             	add    rax,rdx
  8019ca:	48 c1 e0 03          	shl    rax,0x3
  8019ce:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  8019d5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8019d9:	48 89 c6             	mov    rsi,rax
  8019dc:	48 89 d7             	mov    rdi,rdx
  8019df:	e8 80 7c 00 00       	call   809664 <strcpy>
            return i;
  8019e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019e7:	eb 13                	jmp    8019fc <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  8019e9:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8019ed:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  8019f1:	0f 8e 1e ff ff ff    	jle    801915 <reg_vol+0x22>
        }
    }
    return -1;
  8019f7:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8019fc:	c9                   	leave  
  8019fd:	c3                   	ret    

00000000008019fe <sys_open>:
int sys_open(char *path, int mode)
{
  8019fe:	f3 0f 1e fa          	endbr64 
  801a02:	55                   	push   rbp
  801a03:	48 89 e5             	mov    rbp,rsp
  801a06:	53                   	push   rbx
  801a07:	48 81 ec 28 02 00 00 	sub    rsp,0x228
  801a0e:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
  801a15:	89 b5 d4 fd ff ff    	mov    DWORD PTR [rbp-0x22c],esi
    {

    }
    //根据文件路径找到相应的卷
    char volname[26];
    int i=0,rec=0;
  801a1b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801a22:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
    for(;path[i]!='/'&&i<26;i++)
  801a29:	eb 20                	jmp    801a4b <sys_open+0x4d>
        volname[i]=path[i];
  801a2b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a2e:	48 63 d0             	movsxd rdx,eax
  801a31:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801a38:	48 01 d0             	add    rax,rdx
  801a3b:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  801a3e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a41:	48 98                	cdqe   
  801a43:	88 54 05 c0          	mov    BYTE PTR [rbp+rax*1-0x40],dl
    for(;path[i]!='/'&&i<26;i++)
  801a47:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801a4b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a4e:	48 63 d0             	movsxd rdx,eax
  801a51:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801a58:	48 01 d0             	add    rax,rdx
  801a5b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801a5e:	3c 2f                	cmp    al,0x2f
  801a60:	74 06                	je     801a68 <sys_open+0x6a>
  801a62:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801a66:	7e c3                	jle    801a2b <sys_open+0x2d>
    volname[i]='\0';
  801a68:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a6b:	48 98                	cdqe   
  801a6d:	c6 44 05 c0 00       	mov    BYTE PTR [rbp+rax*1-0x40],0x0
    if(!path[i+1])
  801a72:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a75:	48 98                	cdqe   
  801a77:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801a7b:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801a82:	48 01 d0             	add    rax,rdx
  801a85:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801a88:	84 c0                	test   al,al
  801a8a:	75 0a                	jne    801a96 <sys_open+0x98>
        return -2;//是根目录
  801a8c:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  801a91:	e9 2b 04 00 00       	jmp    801ec1 <sys_open+0x4c3>
    rec=i;
  801a96:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a99:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(i=0;i<MAX_VOLUMES;i++)
  801a9c:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801aa3:	eb 52                	jmp    801af7 <sys_open+0xf9>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801aa5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801aa8:	48 63 d0             	movsxd rdx,eax
  801aab:	48 89 d0             	mov    rax,rdx
  801aae:	48 c1 e0 02          	shl    rax,0x2
  801ab2:	48 01 d0             	add    rax,rdx
  801ab5:	48 c1 e0 03          	shl    rax,0x3
  801ab9:	48 05 60 02 40 00    	add    rax,0x400260
  801abf:	8b 00                	mov    eax,DWORD PTR [rax]
  801ac1:	85 c0                	test   eax,eax
  801ac3:	74 2e                	je     801af3 <sys_open+0xf5>
        (strcmp(vols[i].name,volname)==0))
  801ac5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ac8:	48 63 d0             	movsxd rdx,eax
  801acb:	48 89 d0             	mov    rax,rdx
  801ace:	48 c1 e0 02          	shl    rax,0x2
  801ad2:	48 01 d0             	add    rax,rdx
  801ad5:	48 c1 e0 03          	shl    rax,0x3
  801ad9:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801ae0:	48 8d 45 c0          	lea    rax,[rbp-0x40]
  801ae4:	48 89 c6             	mov    rsi,rax
  801ae7:	48 89 d7             	mov    rdi,rdx
  801aea:	e8 15 7d 00 00       	call   809804 <strcmp>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801aef:	85 c0                	test   eax,eax
  801af1:	74 0c                	je     801aff <sys_open+0x101>
    for(i=0;i<MAX_VOLUMES;i++)
  801af3:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801af7:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801afb:	7e a8                	jle    801aa5 <sys_open+0xa7>
  801afd:	eb 01                	jmp    801b00 <sys_open+0x102>
            break;
  801aff:	90                   	nop
    if(i==MAX_VOLUMES)return -1;
  801b00:	83 7d ec 1a          	cmp    DWORD PTR [rbp-0x14],0x1a
  801b04:	75 0a                	jne    801b10 <sys_open+0x112>
  801b06:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801b0b:	e9 b1 03 00 00       	jmp    801ec1 <sys_open+0x4c3>
    driver_args arg={
  801b10:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  801b17:	b8 00 00 00 00       	mov    eax,0x0
  801b1c:	b9 17 00 00 00       	mov    ecx,0x17
  801b21:	48 89 d7             	mov    rdi,rdx
  801b24:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  801b27:	48 89 fa             	mov    rdx,rdi
  801b2a:	89 02                	mov    DWORD PTR [rdx],eax
  801b2c:	48 83 c2 04          	add    rdx,0x4
            .path=path+rec+1
  801b30:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801b33:	48 98                	cdqe   
  801b35:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801b39:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801b40:	48 01 d0             	add    rax,rdx
    driver_args arg={
  801b43:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    vfs_dir_entry dir;
    vfs_dir_entry res;
    int voln=i;
  801b4a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b4d:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    if(vols[i].fs->find(path+rec+1,dir,&res)==-1)//找不到文件 ((driver*)vols[i].fs_drv)->find(&arg)==-1
  801b50:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b53:	48 63 d0             	movsxd rdx,eax
  801b56:	48 89 d0             	mov    rax,rdx
  801b59:	48 c1 e0 02          	shl    rax,0x2
  801b5d:	48 01 d0             	add    rax,rdx
  801b60:	48 c1 e0 03          	shl    rax,0x3
  801b64:	48 05 58 02 40 00    	add    rax,0x400258
  801b6a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801b6d:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  801b71:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801b74:	48 98                	cdqe   
  801b76:	48 8d 48 01          	lea    rcx,[rax+0x1]
  801b7a:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801b81:	48 01 c1             	add    rcx,rax
  801b84:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
  801b8b:	ff b5 f8 fe ff ff    	push   QWORD PTR [rbp-0x108]
  801b91:	ff b5 f0 fe ff ff    	push   QWORD PTR [rbp-0x110]
  801b97:	ff b5 e8 fe ff ff    	push   QWORD PTR [rbp-0x118]
  801b9d:	ff b5 e0 fe ff ff    	push   QWORD PTR [rbp-0x120]
  801ba3:	ff b5 d8 fe ff ff    	push   QWORD PTR [rbp-0x128]
  801ba9:	ff b5 d0 fe ff ff    	push   QWORD PTR [rbp-0x130]
  801baf:	ff b5 c8 fe ff ff    	push   QWORD PTR [rbp-0x138]
  801bb5:	ff b5 c0 fe ff ff    	push   QWORD PTR [rbp-0x140]
  801bbb:	ff b5 b8 fe ff ff    	push   QWORD PTR [rbp-0x148]
  801bc1:	ff b5 b0 fe ff ff    	push   QWORD PTR [rbp-0x150]
  801bc7:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
  801bcd:	ff b5 a0 fe ff ff    	push   QWORD PTR [rbp-0x160]
  801bd3:	48 89 c6             	mov    rsi,rax
  801bd6:	48 89 cf             	mov    rdi,rcx
  801bd9:	ff d2                	call   rdx
  801bdb:	48 83 c4 60          	add    rsp,0x60
  801bdf:	83 f8 ff             	cmp    eax,0xffffffff
  801be2:	75 49                	jne    801c2d <sys_open+0x22f>
    {
        if(mode&FILE_MODE_WRITE) {
  801be4:	8b 85 d4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x22c]
  801bea:	83 e0 02             	and    eax,0x2
  801bed:	85 c0                	test   eax,eax
  801bef:	74 32                	je     801c23 <sys_open+0x225>
            return ((driver *) vols[i].fs_drv)->touch(&arg);//这里之后要改
  801bf1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801bf4:	48 63 d0             	movsxd rdx,eax
  801bf7:	48 89 d0             	mov    rax,rdx
  801bfa:	48 c1 e0 02          	shl    rax,0x2
  801bfe:	48 01 d0             	add    rax,rdx
  801c01:	48 c1 e0 03          	shl    rax,0x3
  801c05:	48 05 50 02 40 00    	add    rax,0x400250
  801c0b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801c0e:	48 8b 50 4c          	mov    rdx,QWORD PTR [rax+0x4c]
  801c12:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  801c19:	48 89 c7             	mov    rdi,rax
  801c1c:	ff d2                	call   rdx
  801c1e:	e9 9e 02 00 00       	jmp    801ec1 <sys_open+0x4c3>
        }else
            return -1;
  801c23:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801c28:	e9 94 02 00 00       	jmp    801ec1 <sys_open+0x4c3>
    }
    vfs_dir_entry entry=res;//=arg.entry;
  801c2d:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
  801c34:	48 8b 95 48 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b8]
  801c3b:	48 89 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rax
  801c42:	48 89 95 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdx
  801c49:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
  801c50:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
  801c57:	48 89 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],rax
  801c5e:	48 89 95 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],rdx
  801c65:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
  801c6c:	48 8b 95 68 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x198]
  801c73:	48 89 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],rax
  801c7a:	48 89 95 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],rdx
  801c81:	48 8b 85 70 fe ff ff 	mov    rax,QWORD PTR [rbp-0x190]
  801c88:	48 8b 95 78 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x188]
  801c8f:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
  801c96:	48 89 95 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdx
  801c9d:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
  801ca4:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
  801cab:	48 89 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rax
  801cb2:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
  801cb9:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
  801cc0:	48 8b 95 98 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x168]
  801cc7:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
  801cce:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
    int j=-1;
  801cd5:	c7 45 e8 ff ff ff ff 	mov    DWORD PTR [rbp-0x18],0xffffffff
    for(i=0;i<MAX_OPEN_FILES;i++)
  801cdc:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801ce3:	eb 5c                	jmp    801d41 <sys_open+0x343>
    {
        if(opened[i].voln==voln&&opened[i].id==entry.id)
  801ce5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ce8:	48 63 d0             	movsxd rdx,eax
  801ceb:	48 89 d0             	mov    rax,rdx
  801cee:	48 01 c0             	add    rax,rax
  801cf1:	48 01 d0             	add    rax,rdx
  801cf4:	48 c1 e0 05          	shl    rax,0x5
  801cf8:	48 05 68 06 40 00    	add    rax,0x400668
  801cfe:	8b 00                	mov    eax,DWORD PTR [rax]
  801d00:	39 45 e0             	cmp    DWORD PTR [rbp-0x20],eax
  801d03:	75 38                	jne    801d3d <sys_open+0x33f>
  801d05:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d08:	48 63 d0             	movsxd rdx,eax
  801d0b:	48 89 d0             	mov    rax,rdx
  801d0e:	48 01 c0             	add    rax,rax
  801d11:	48 01 d0             	add    rax,rdx
  801d14:	48 c1 e0 05          	shl    rax,0x5
  801d18:	48 05 74 06 40 00    	add    rax,0x400674
  801d1e:	8b 10                	mov    edx,DWORD PTR [rax]
  801d20:	8b 85 f4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x20c]
  801d26:	39 c2                	cmp    edx,eax
  801d28:	75 13                	jne    801d3d <sys_open+0x33f>
        {
            if(mode==FILE_MODE_WRITE)
  801d2a:	83 bd d4 fd ff ff 02 	cmp    DWORD PTR [rbp-0x22c],0x2
  801d31:	75 0a                	jne    801d3d <sys_open+0x33f>
            {
                return -1;//读模式会重新给一个fno但是指向同一个文件
  801d33:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801d38:	e9 84 01 00 00       	jmp    801ec1 <sys_open+0x4c3>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801d3d:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801d41:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801d45:	7e 9e                	jle    801ce5 <sys_open+0x2e7>
            }
        }
    }
    for(i=0;i<MAX_OPEN_FILES;i++)
  801d47:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801d4e:	eb 2b                	jmp    801d7b <sys_open+0x37d>
    {
        if(!opened[i].mode) {
  801d50:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d53:	48 63 d0             	movsxd rdx,eax
  801d56:	48 89 d0             	mov    rax,rdx
  801d59:	48 01 c0             	add    rax,rax
  801d5c:	48 01 d0             	add    rax,rdx
  801d5f:	48 c1 e0 05          	shl    rax,0x5
  801d63:	48 05 64 06 40 00    	add    rax,0x400664
  801d69:	8b 00                	mov    eax,DWORD PTR [rax]
  801d6b:	85 c0                	test   eax,eax
  801d6d:	75 08                	jne    801d77 <sys_open+0x379>
            j = i;
  801d6f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d72:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            break;
  801d75:	eb 0a                	jmp    801d81 <sys_open+0x383>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801d77:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801d7b:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801d7f:	7e cf                	jle    801d50 <sys_open+0x352>
        }
    }
    if(j==-1)return -1;
  801d81:	83 7d e8 ff          	cmp    DWORD PTR [rbp-0x18],0xffffffff
  801d85:	75 0a                	jne    801d91 <sys_open+0x393>
  801d87:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801d8c:	e9 30 01 00 00       	jmp    801ec1 <sys_open+0x4c3>
    opened[j]=entry;
  801d91:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801d94:	48 63 d0             	movsxd rdx,eax
  801d97:	48 89 d0             	mov    rax,rdx
  801d9a:	48 01 c0             	add    rax,rax
  801d9d:	48 01 d0             	add    rax,rdx
  801da0:	48 c1 e0 05          	shl    rax,0x5
  801da4:	48 05 60 06 40 00    	add    rax,0x400660
  801daa:	48 8b 8d e0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x220]
  801db1:	48 8b 9d e8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x218]
  801db8:	48 89 08             	mov    QWORD PTR [rax],rcx
  801dbb:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
  801dbf:	48 8b 8d f0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x210]
  801dc6:	48 8b 9d f8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x208]
  801dcd:	48 89 48 10          	mov    QWORD PTR [rax+0x10],rcx
  801dd1:	48 89 58 18          	mov    QWORD PTR [rax+0x18],rbx
  801dd5:	48 8b 8d 00 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x200]
  801ddc:	48 8b 9d 08 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1f8]
  801de3:	48 89 48 20          	mov    QWORD PTR [rax+0x20],rcx
  801de7:	48 89 58 28          	mov    QWORD PTR [rax+0x28],rbx
  801deb:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
  801df2:	48 8b 9d 18 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1e8]
  801df9:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
  801dfd:	48 89 58 38          	mov    QWORD PTR [rax+0x38],rbx
  801e01:	48 8b 8d 20 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e0]
  801e08:	48 8b 9d 28 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1d8]
  801e0f:	48 89 48 40          	mov    QWORD PTR [rax+0x40],rcx
  801e13:	48 89 58 48          	mov    QWORD PTR [rax+0x48],rbx
  801e17:	48 8b 8d 30 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1d0]
  801e1e:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
  801e25:	48 89 48 50          	mov    QWORD PTR [rax+0x50],rcx
  801e29:	48 89 58 58          	mov    QWORD PTR [rax+0x58],rbx
    opened[j].fno=i;
  801e2d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801e30:	48 63 d0             	movsxd rdx,eax
  801e33:	48 89 d0             	mov    rax,rdx
  801e36:	48 01 c0             	add    rax,rax
  801e39:	48 01 d0             	add    rax,rdx
  801e3c:	48 c1 e0 05          	shl    rax,0x5
  801e40:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  801e47:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801e4a:	89 02                	mov    DWORD PTR [rdx],eax
    opened[j].link_c++;
  801e4c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801e4f:	48 63 d0             	movsxd rdx,eax
  801e52:	48 89 d0             	mov    rax,rdx
  801e55:	48 01 c0             	add    rax,rax
  801e58:	48 01 d0             	add    rax,rdx
  801e5b:	48 c1 e0 05          	shl    rax,0x5
  801e5f:	48 05 6c 06 40 00    	add    rax,0x40066c
  801e65:	8b 00                	mov    eax,DWORD PTR [rax]
  801e67:	8d 48 01             	lea    ecx,[rax+0x1]
  801e6a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801e6d:	48 63 d0             	movsxd rdx,eax
  801e70:	48 89 d0             	mov    rax,rdx
  801e73:	48 01 c0             	add    rax,rax
  801e76:	48 01 d0             	add    rax,rdx
  801e79:	48 c1 e0 05          	shl    rax,0x5
  801e7d:	48 05 6c 06 40 00    	add    rax,0x40066c
  801e83:	89 08                	mov    DWORD PTR [rax],ecx
    add_proc_openf(&opened[j]);
  801e85:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801e88:	48 63 d0             	movsxd rdx,eax
  801e8b:	48 89 d0             	mov    rax,rdx
  801e8e:	48 01 c0             	add    rax,rax
  801e91:	48 01 d0             	add    rax,rdx
  801e94:	48 c1 e0 05          	shl    rax,0x5
  801e98:	48 05 60 06 40 00    	add    rax,0x400660
  801e9e:	48 89 c7             	mov    rdi,rax
  801ea1:	e8 17 26 00 00       	call   8044bd <add_proc_openf>
    return opened[j].fno;
  801ea6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801ea9:	48 63 d0             	movsxd rdx,eax
  801eac:	48 89 d0             	mov    rax,rdx
  801eaf:	48 01 c0             	add    rax,rax
  801eb2:	48 01 d0             	add    rax,rdx
  801eb5:	48 c1 e0 05          	shl    rax,0x5
  801eb9:	48 05 60 06 40 00    	add    rax,0x400660
  801ebf:	8b 00                	mov    eax,DWORD PTR [rax]
}
  801ec1:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  801ec5:	c9                   	leave  
  801ec6:	c3                   	ret    

0000000000801ec7 <sys_close>:
int sys_close(int fno)
{
  801ec7:	f3 0f 1e fa          	endbr64 
  801ecb:	55                   	push   rbp
  801ecc:	48 89 e5             	mov    rbp,rsp
  801ecf:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801ed2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801ed9:	eb 64                	jmp    801f3f <sys_close+0x78>
    {
        if(opened[i].fno==fno)
  801edb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ede:	48 63 d0             	movsxd rdx,eax
  801ee1:	48 89 d0             	mov    rax,rdx
  801ee4:	48 01 c0             	add    rax,rax
  801ee7:	48 01 d0             	add    rax,rdx
  801eea:	48 c1 e0 05          	shl    rax,0x5
  801eee:	48 05 60 06 40 00    	add    rax,0x400660
  801ef4:	8b 00                	mov    eax,DWORD PTR [rax]
  801ef6:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801ef9:	75 40                	jne    801f3b <sys_close+0x74>
        {
            opened[i].link_c--;
  801efb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801efe:	48 63 d0             	movsxd rdx,eax
  801f01:	48 89 d0             	mov    rax,rdx
  801f04:	48 01 c0             	add    rax,rax
  801f07:	48 01 d0             	add    rax,rdx
  801f0a:	48 c1 e0 05          	shl    rax,0x5
  801f0e:	48 05 6c 06 40 00    	add    rax,0x40066c
  801f14:	8b 00                	mov    eax,DWORD PTR [rax]
  801f16:	8d 48 ff             	lea    ecx,[rax-0x1]
  801f19:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801f1c:	48 63 d0             	movsxd rdx,eax
  801f1f:	48 89 d0             	mov    rax,rdx
  801f22:	48 01 c0             	add    rax,rax
  801f25:	48 01 d0             	add    rax,rdx
  801f28:	48 c1 e0 05          	shl    rax,0x5
  801f2c:	48 05 6c 06 40 00    	add    rax,0x40066c
  801f32:	89 08                	mov    DWORD PTR [rax],ecx
            return 0;
  801f34:	b8 00 00 00 00       	mov    eax,0x0
  801f39:	eb 0f                	jmp    801f4a <sys_close+0x83>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801f3b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801f3f:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801f43:	7e 96                	jle    801edb <sys_close+0x14>
        }
    }
    return -1;
  801f45:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801f4a:	5d                   	pop    rbp
  801f4b:	c3                   	ret    

0000000000801f4c <sys_write>:
int sys_write(int fno, char *src, int len)
{
  801f4c:	f3 0f 1e fa          	endbr64 
  801f50:	55                   	push   rbp
  801f51:	48 89 e5             	mov    rbp,rsp
  801f54:	48 83 ec 20          	sub    rsp,0x20
  801f58:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801f5b:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  801f5f:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  801f62:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f65:	89 c7                	mov    edi,eax
  801f67:	e8 7d 01 00 00       	call   8020e9 <get_vfs_entry>
  801f6c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  801f70:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  801f75:	75 07                	jne    801f7e <sys_write+0x32>
  801f77:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801f7c:	eb 5d                	jmp    801fdb <sys_write+0x8f>
    if(f->type==FTYPE_REG)
  801f7e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f82:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  801f85:	85 c0                	test   eax,eax
  801f87:	75 18                	jne    801fa1 <sys_write+0x55>
    {
        return vfs_write_file(f,src,len);
  801f89:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  801f8c:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  801f90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f94:	48 89 ce             	mov    rsi,rcx
  801f97:	48 89 c7             	mov    rdi,rax
  801f9a:	e8 67 03 00 00       	call   802306 <vfs_write_file>
  801f9f:	eb 3a                	jmp    801fdb <sys_write+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  801fa1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fa5:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  801fa8:	83 f8 01             	cmp    eax,0x1
  801fab:	75 29                	jne    801fd6 <sys_write+0x8a>
    {
        int block=get_according_bnr(f);
  801fad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fb1:	48 89 c7             	mov    rdi,rax
  801fb4:	e8 5b 04 00 00       	call   802414 <get_according_bnr>
  801fb9:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return write_block(f->dev,block,src,len);
  801fbc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fc0:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801fc3:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  801fc6:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  801fca:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  801fcd:	89 c7                	mov    edi,eax
  801fcf:	e8 24 08 00 00       	call   8027f8 <write_block>
  801fd4:	eb 05                	jmp    801fdb <sys_write+0x8f>
    }
    return -1;
  801fd6:	b8 ff ff ff ff       	mov    eax,0xffffffff
            .src_addr=src,
            .len=len,
            .pos=pos
    };
    return ((driver*)vols[f->voln].fs_drv)->write(&args); */
}
  801fdb:	c9                   	leave  
  801fdc:	c3                   	ret    

0000000000801fdd <sys_read>:
int sys_read(int fno, char *dist,  int len)
{
  801fdd:	f3 0f 1e fa          	endbr64 
  801fe1:	55                   	push   rbp
  801fe2:	48 89 e5             	mov    rbp,rsp
  801fe5:	48 83 ec 20          	sub    rsp,0x20
  801fe9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801fec:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  801ff0:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  801ff3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ff6:	89 c7                	mov    edi,eax
  801ff8:	e8 ec 00 00 00       	call   8020e9 <get_vfs_entry>
  801ffd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  802001:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802006:	75 07                	jne    80200f <sys_read+0x32>
  802008:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80200d:	eb 5d                	jmp    80206c <sys_read+0x8f>
    if(f->type==FTYPE_REG)
  80200f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802013:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802016:	85 c0                	test   eax,eax
  802018:	75 18                	jne    802032 <sys_read+0x55>
    {
        return vfs_read_file(f,dist,len);
  80201a:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80201d:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  802021:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802025:	48 89 ce             	mov    rsi,rcx
  802028:	48 89 c7             	mov    rdi,rax
  80202b:	e8 37 02 00 00       	call   802267 <vfs_read_file>
  802030:	eb 3a                	jmp    80206c <sys_read+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  802032:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802036:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802039:	83 f8 01             	cmp    eax,0x1
  80203c:	75 29                	jne    802067 <sys_read+0x8a>
    {
        int block=get_according_bnr(f);
  80203e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802042:	48 89 c7             	mov    rdi,rax
  802045:	e8 ca 03 00 00       	call   802414 <get_according_bnr>
  80204a:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return read_block(f->dev,block,dist,len);
  80204d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802051:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802054:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  802057:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80205b:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  80205e:	89 c7                	mov    edi,eax
  802060:	e8 10 08 00 00       	call   802875 <read_block>
  802065:	eb 05                	jmp    80206c <sys_read+0x8f>
    }
    return -1;
  802067:	b8 ff ff ff ff       	mov    eax,0xffffffff
    //         .len=len,
    //         .pos=pos,
    //         .entry=*f
    // };
    // return ((driver*)vols[f->voln].fs_drv)->read(&args);
}
  80206c:	c9                   	leave  
  80206d:	c3                   	ret    

000000000080206e <sys_seek>:
int sys_seek(int fno, int offset, int origin)
{
  80206e:	f3 0f 1e fa          	endbr64 
  802072:	55                   	push   rbp
  802073:	48 89 e5             	mov    rbp,rsp
  802076:	48 83 ec 20          	sub    rsp,0x20
  80207a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80207d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802080:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  802083:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802086:	89 c7                	mov    edi,eax
  802088:	e8 5c 00 00 00       	call   8020e9 <get_vfs_entry>
  80208d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  802091:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802096:	75 07                	jne    80209f <sys_seek+0x31>
  802098:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80209d:	eb 14                	jmp    8020b3 <sys_seek+0x45>
    f->ptr=offset+origin;
  80209f:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8020a2:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8020a5:	01 c2                	add    edx,eax
  8020a7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020ab:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
    return 0;
  8020ae:	b8 00 00 00 00       	mov    eax,0x0
}
  8020b3:	c9                   	leave  
  8020b4:	c3                   	ret    

00000000008020b5 <sys_tell>:
int sys_tell(int fno)
{
  8020b5:	f3 0f 1e fa          	endbr64 
  8020b9:	55                   	push   rbp
  8020ba:	48 89 e5             	mov    rbp,rsp
  8020bd:	48 83 ec 20          	sub    rsp,0x20
  8020c1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    vfs_dir_entry *f= get_vfs_entry(fno);
  8020c4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8020c7:	89 c7                	mov    edi,eax
  8020c9:	e8 1b 00 00 00       	call   8020e9 <get_vfs_entry>
  8020ce:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  8020d2:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8020d7:	75 07                	jne    8020e0 <sys_tell+0x2b>
  8020d9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8020de:	eb 07                	jmp    8020e7 <sys_tell+0x32>
    return f->ptr;
  8020e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020e4:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  8020e7:	c9                   	leave  
  8020e8:	c3                   	ret    

00000000008020e9 <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  8020e9:	f3 0f 1e fa          	endbr64 
  8020ed:	55                   	push   rbp
  8020ee:	48 89 e5             	mov    rbp,rsp
  8020f1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  8020f4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8020fb:	eb 3f                	jmp    80213c <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  8020fd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802100:	48 63 d0             	movsxd rdx,eax
  802103:	48 89 d0             	mov    rax,rdx
  802106:	48 01 c0             	add    rax,rax
  802109:	48 01 d0             	add    rax,rdx
  80210c:	48 c1 e0 05          	shl    rax,0x5
  802110:	48 05 60 06 40 00    	add    rax,0x400660
  802116:	8b 00                	mov    eax,DWORD PTR [rax]
  802118:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80211b:	75 1b                	jne    802138 <get_vfs_entry+0x4f>
        {
            return &opened[i];
  80211d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802120:	48 63 d0             	movsxd rdx,eax
  802123:	48 89 d0             	mov    rax,rdx
  802126:	48 01 c0             	add    rax,rax
  802129:	48 01 d0             	add    rax,rdx
  80212c:	48 c1 e0 05          	shl    rax,0x5
  802130:	48 05 60 06 40 00    	add    rax,0x400660
  802136:	eb 0f                	jmp    802147 <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802138:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80213c:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802140:	7e bb                	jle    8020fd <get_vfs_entry+0x14>
        }
    }
    return NULL;
  802142:	b8 00 00 00 00       	mov    eax,0x0
}
  802147:	5d                   	pop    rbp
  802148:	c3                   	ret    

0000000000802149 <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  802149:	f3 0f 1e fa          	endbr64 
  80214d:	55                   	push   rbp
  80214e:	48 89 e5             	mov    rbp,rsp
  802151:	48 83 ec 10          	sub    rsp,0x10
  802155:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  802159:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80215d:	48 89 c7             	mov    rdi,rax
  802160:	e8 a0 04 00 00       	call   802605 <wait_on_buf>
    if(bh->b_count==0)return -1;
  802165:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802169:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  80216d:	84 c0                	test   al,al
  80216f:	75 07                	jne    802178 <brelse+0x2f>
  802171:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802176:	eb 32                	jmp    8021aa <brelse+0x61>
    bh->b_count--;
  802178:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80217c:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  802180:	8d 50 ff             	lea    edx,[rax-0x1]
  802183:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802187:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  80218a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80218e:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  802192:	84 c0                	test   al,al
  802194:	75 0f                	jne    8021a5 <brelse+0x5c>
        vmfree(bh->b_data);
  802196:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80219a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80219d:	48 89 c7             	mov    rdi,rax
  8021a0:	e8 74 ef ff ff       	call   801119 <vmfree>
    return 0;
  8021a5:	b8 00 00 00 00       	mov    eax,0x0
}
  8021aa:	c9                   	leave  
  8021ab:	c3                   	ret    

00000000008021ac <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  8021ac:	f3 0f 1e fa          	endbr64 
  8021b0:	55                   	push   rbp
  8021b1:	48 89 e5             	mov    rbp,rsp
  8021b4:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  8021bb:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  8021c1:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  8021c7:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  8021cd:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  8021d3:	89 d6                	mov    esi,edx
  8021d5:	89 c7                	mov    edi,eax
  8021d7:	e8 78 02 00 00       	call   802454 <get_buf>
  8021dc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  8021e0:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8021e5:	75 09                	jne    8021f0 <bread+0x44>
  8021e7:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  8021ee:	eb 75                	jmp    802265 <bread+0xb9>
    if(!bh->b_uptodate)
  8021f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021f4:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  8021f8:	84 c0                	test   al,al
  8021fa:	75 65                	jne    802261 <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  8021fc:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  802202:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  802205:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  80220c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802210:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802213:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  802219:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  802220:	02 00 00 
        arg.lba=bh->b_blocknr;
  802223:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802227:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80222b:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  802231:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  802238:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  80223b:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  802242:	48 89 c7             	mov    rdi,rax
  802245:	e8 82 12 00 00       	call   8034cc <make_request>
  80224a:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  80224d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802250:	89 c7                	mov    edi,eax
  802252:	e8 88 15 00 00       	call   8037df <wait_on_req>
        clear_req(reqi);
  802257:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80225a:	89 c7                	mov    edi,eax
  80225c:	e8 ae 15 00 00       	call   80380f <clear_req>
    }
    return bh;
  802261:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  802265:	c9                   	leave  
  802266:	c3                   	ret    

0000000000802267 <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  802267:	f3 0f 1e fa          	endbr64 
  80226b:	55                   	push   rbp
  80226c:	48 89 e5             	mov    rbp,rsp
  80226f:	48 83 ec 40          	sub    rsp,0x40
  802273:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802277:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80227b:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  80227e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802282:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802285:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802288:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80228c:	48 89 c7             	mov    rdi,rax
  80228f:	e8 80 01 00 00       	call   802414 <get_according_bnr>
  802294:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  802297:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80229a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80229d:	89 d6                	mov    esi,edx
  80229f:	89 c7                	mov    edi,eax
  8022a1:	e8 06 ff ff ff       	call   8021ac <bread>
  8022a6:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8022aa:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8022ad:	ba 00 02 00 00       	mov    edx,0x200
  8022b2:	39 d0                	cmp    eax,edx
  8022b4:	0f 4f c2             	cmovg  eax,edx
  8022b7:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  8022ba:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8022bd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8022c1:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8022c4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8022c8:	48 89 ce             	mov    rsi,rcx
  8022cb:	48 89 c7             	mov    rdi,rax
  8022ce:	e8 93 72 00 00       	call   809566 <memcpy>
        len-=BLOCK_SIZE;
  8022d3:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  8022da:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8022de:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8022e1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8022e4:	01 c2                	add    edx,eax
  8022e6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8022ea:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  8022ed:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8022f1:	48 89 c7             	mov    rdi,rax
  8022f4:	e8 50 fe ff ff       	call   802149 <brelse>
    }while(len>0);
  8022f9:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  8022fd:	7f 89                	jg     802288 <vfs_read_file+0x21>
    return 0;
  8022ff:	b8 00 00 00 00       	mov    eax,0x0
}
  802304:	c9                   	leave  
  802305:	c3                   	ret    

0000000000802306 <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  802306:	f3 0f 1e fa          	endbr64 
  80230a:	55                   	push   rbp
  80230b:	48 89 e5             	mov    rbp,rsp
  80230e:	48 83 ec 40          	sub    rsp,0x40
  802312:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802316:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80231a:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  80231d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802321:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802324:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802327:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80232b:	48 89 c7             	mov    rdi,rax
  80232e:	e8 e1 00 00 00       	call   802414 <get_according_bnr>
  802333:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  802336:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  802339:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80233c:	89 d6                	mov    esi,edx
  80233e:	89 c7                	mov    edi,eax
  802340:	e8 0f 01 00 00       	call   802454 <get_buf>
  802345:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802349:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80234c:	ba 00 02 00 00       	mov    edx,0x200
  802351:	39 d0                	cmp    eax,edx
  802353:	0f 4f c2             	cmovg  eax,edx
  802356:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  802359:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80235c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802360:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802363:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802367:	48 89 ce             	mov    rsi,rcx
  80236a:	48 89 c7             	mov    rdi,rax
  80236d:	e8 f4 71 00 00       	call   809566 <memcpy>
        len-=BLOCK_SIZE;
  802372:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  802379:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80237d:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802380:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802383:	01 c2                	add    edx,eax
  802385:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802389:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  80238c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802390:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802394:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802398:	48 89 c7             	mov    rdi,rax
  80239b:	e8 a9 fd ff ff       	call   802149 <brelse>
    }while(len>0);
  8023a0:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  8023a4:	7f 81                	jg     802327 <vfs_write_file+0x21>
    return 0;
  8023a6:	b8 00 00 00 00       	mov    eax,0x0
}
  8023ab:	c9                   	leave  
  8023ac:	c3                   	ret    

00000000008023ad <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  8023ad:	f3 0f 1e fa          	endbr64 
  8023b1:	55                   	push   rbp
  8023b2:	48 89 e5             	mov    rbp,rsp
  8023b5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8023b9:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  8023bc:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  8023bf:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8023c3:	74 20                	je     8023e5 <vfs_seek_file+0x38>
  8023c5:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8023c9:	7f 3f                	jg     80240a <vfs_seek_file+0x5d>
  8023cb:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  8023cf:	74 08                	je     8023d9 <vfs_seek_file+0x2c>
  8023d1:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  8023d5:	74 23                	je     8023fa <vfs_seek_file+0x4d>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  8023d7:	eb 31                	jmp    80240a <vfs_seek_file+0x5d>
        f->ptr=offset;
  8023d9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023dd:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8023e0:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8023e3:	eb 26                	jmp    80240b <vfs_seek_file+0x5e>
        f->ptr+=offset;
  8023e5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023e9:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8023ec:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8023ef:	01 c2                	add    edx,eax
  8023f1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023f5:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8023f8:	eb 11                	jmp    80240b <vfs_seek_file+0x5e>
        f->ptr=f->size;
  8023fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023fe:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  802401:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802405:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802408:	eb 01                	jmp    80240b <vfs_seek_file+0x5e>
        break;
  80240a:	90                   	nop
    }
    return f->ptr;
  80240b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80240f:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802412:	5d                   	pop    rbp
  802413:	c3                   	ret    

0000000000802414 <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  802414:	f3 0f 1e fa          	endbr64 
  802418:	55                   	push   rbp
  802419:	48 89 e5             	mov    rbp,rsp
  80241c:	48 83 ec 10          	sub    rsp,0x10
  802420:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  802424:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802428:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80242b:	48 63 d0             	movsxd rdx,eax
  80242e:	48 89 d0             	mov    rax,rdx
  802431:	48 c1 e0 02          	shl    rax,0x2
  802435:	48 01 d0             	add    rax,rdx
  802438:	48 c1 e0 03          	shl    rax,0x3
  80243c:	48 05 58 02 40 00    	add    rax,0x400258
  802442:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802445:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802449:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80244d:	48 89 c7             	mov    rdi,rax
  802450:	ff d2                	call   rdx

}
  802452:	c9                   	leave  
  802453:	c3                   	ret    

0000000000802454 <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  802454:	f3 0f 1e fa          	endbr64 
  802458:	55                   	push   rbp
  802459:	48 89 e5             	mov    rbp,rsp
  80245c:	48 83 ec 20          	sub    rsp,0x20
  802460:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802463:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802466:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80246d:	e9 b9 00 00 00       	jmp    80252b <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  802472:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802475:	48 98                	cdqe   
  802477:	48 c1 e0 06          	shl    rax,0x6
  80247b:	48 05 90 26 40 00    	add    rax,0x402690
  802481:	0f b7 00             	movzx  eax,WORD PTR [rax]
  802484:	0f b7 c0             	movzx  eax,ax
  802487:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80248a:	0f 85 97 00 00 00    	jne    802527 <get_buf+0xd3>
  802490:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802493:	48 98                	cdqe   
  802495:	48 c1 e0 06          	shl    rax,0x6
  802499:	48 05 88 26 40 00    	add    rax,0x402688
  80249f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8024a2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8024a5:	48 98                	cdqe   
  8024a7:	48 39 c2             	cmp    rdx,rax
  8024aa:	75 7b                	jne    802527 <get_buf+0xd3>
        {
            repeat:
  8024ac:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  8024ad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8024b0:	48 98                	cdqe   
  8024b2:	48 c1 e0 06          	shl    rax,0x6
  8024b6:	48 05 80 26 40 00    	add    rax,0x402680
  8024bc:	48 89 c7             	mov    rdi,rax
  8024bf:	e8 41 01 00 00       	call   802605 <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  8024c4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8024c7:	48 98                	cdqe   
  8024c9:	48 c1 e0 06          	shl    rax,0x6
  8024cd:	48 05 94 26 40 00    	add    rax,0x402694
  8024d3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8024d6:	84 c0                	test   al,al
  8024d8:	74 02                	je     8024dc <get_buf+0x88>
                goto repeat;
  8024da:	eb d1                	jmp    8024ad <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  8024dc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8024df:	48 98                	cdqe   
  8024e1:	48 c1 e0 06          	shl    rax,0x6
  8024e5:	48 05 90 26 40 00    	add    rax,0x402690
  8024eb:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8024ee:	0f b7 c0             	movzx  eax,ax
  8024f1:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8024f4:	75 30                	jne    802526 <get_buf+0xd2>
  8024f6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8024f9:	48 98                	cdqe   
  8024fb:	48 c1 e0 06          	shl    rax,0x6
  8024ff:	48 05 88 26 40 00    	add    rax,0x402688
  802505:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802508:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80250b:	48 98                	cdqe   
  80250d:	48 39 c2             	cmp    rdx,rax
  802510:	75 14                	jne    802526 <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  802512:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802515:	48 98                	cdqe   
  802517:	48 c1 e0 06          	shl    rax,0x6
  80251b:	48 05 80 26 40 00    	add    rax,0x402680
  802521:	e9 dd 00 00 00       	jmp    802603 <get_buf+0x1af>
                continue;
  802526:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802527:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80252b:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  80252f:	0f 8e 3d ff ff ff    	jle    802472 <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802535:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80253c:	e9 b8 00 00 00       	jmp    8025f9 <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  802541:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802544:	48 98                	cdqe   
  802546:	48 c1 e0 06          	shl    rax,0x6
  80254a:	48 05 94 26 40 00    	add    rax,0x402694
  802550:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802553:	84 c0                	test   al,al
  802555:	0f 85 9a 00 00 00    	jne    8025f5 <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  80255b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80255e:	48 98                	cdqe   
  802560:	48 c1 e0 06          	shl    rax,0x6
  802564:	48 05 93 26 40 00    	add    rax,0x402693
  80256a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80256d:	84 c0                	test   al,al
  80256f:	74 2e                	je     80259f <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  802571:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802574:	48 98                	cdqe   
  802576:	48 c1 e0 06          	shl    rax,0x6
  80257a:	48 05 80 26 40 00    	add    rax,0x402680
  802580:	48 89 c7             	mov    rdi,rax
  802583:	e8 2c 02 00 00       	call   8027b4 <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  802588:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80258b:	48 98                	cdqe   
  80258d:	48 c1 e0 06          	shl    rax,0x6
  802591:	48 05 80 26 40 00    	add    rax,0x402680
  802597:	48 89 c7             	mov    rdi,rax
  80259a:	e8 66 00 00 00       	call   802605 <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  80259f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8025a2:	48 98                	cdqe   
  8025a4:	48 c1 e0 06          	shl    rax,0x6
  8025a8:	48 05 94 26 40 00    	add    rax,0x402694
  8025ae:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8025b1:	8d 50 01             	lea    edx,[rax+0x1]
  8025b4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8025b7:	48 98                	cdqe   
  8025b9:	48 c1 e0 06          	shl    rax,0x6
  8025bd:	48 05 94 26 40 00    	add    rax,0x402694
  8025c3:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  8025c5:	b8 00 00 00 00       	mov    eax,0x0
  8025ca:	e8 bb ea ff ff       	call   80108a <vmalloc>
  8025cf:	48 89 c2             	mov    rdx,rax
  8025d2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8025d5:	48 98                	cdqe   
  8025d7:	48 c1 e0 06          	shl    rax,0x6
  8025db:	48 05 80 26 40 00    	add    rax,0x402680
  8025e1:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  8025e4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8025e7:	48 98                	cdqe   
  8025e9:	48 c1 e0 06          	shl    rax,0x6
  8025ed:	48 05 80 26 40 00    	add    rax,0x402680
  8025f3:	eb 0e                	jmp    802603 <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8025f5:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8025f9:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8025fd:	0f 8e 3e ff ff ff    	jle    802541 <get_buf+0xed>
        }
    }
}
  802603:	c9                   	leave  
  802604:	c3                   	ret    

0000000000802605 <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  802605:	f3 0f 1e fa          	endbr64 
  802609:	55                   	push   rbp
  80260a:	48 89 e5             	mov    rbp,rsp
  80260d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  802611:	90                   	nop
  802612:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802616:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  80261a:	84 c0                	test   al,al
  80261c:	75 f4                	jne    802612 <wait_on_buf+0xd>
    
}
  80261e:	90                   	nop
  80261f:	90                   	nop
  802620:	5d                   	pop    rbp
  802621:	c3                   	ret    

0000000000802622 <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  802622:	f3 0f 1e fa          	endbr64 
  802626:	55                   	push   rbp
  802627:	48 89 e5             	mov    rbp,rsp
  80262a:	48 83 ec 40          	sub    rsp,0x40
  80262e:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    device *blkdev=get_dev(dev);
  802631:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802634:	89 c7                	mov    edi,eax
  802636:	e8 3c 0e 00 00       	call   803477 <get_dev>
  80263b:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    buffer_head* bh=bread(dev,0);
  80263f:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802642:	be 00 00 00 00       	mov    esi,0x0
  802647:	89 c7                	mov    edi,eax
  802649:	e8 5e fb ff ff       	call   8021ac <bread>
  80264e:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!bh)return -1;
  802652:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  802657:	75 0a                	jne    802663 <scan_dev+0x41>
  802659:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80265e:	e9 4f 01 00 00       	jmp    8027b2 <scan_dev+0x190>
    dpt_t* dpte=bh->b_data+0x1be;
  802663:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802667:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80266a:	48 05 be 01 00 00    	add    rax,0x1be
  802670:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  802674:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80267b:	e9 17 01 00 00       	jmp    802797 <scan_dev+0x175>
    {
        blkdev->par[i].type=dpte->type;
  802680:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802684:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802687:	0f b6 d0             	movzx  edx,al
  80268a:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  80268e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802691:	48 63 c8             	movsxd rcx,eax
  802694:	48 89 c8             	mov    rax,rcx
  802697:	48 01 c0             	add    rax,rax
  80269a:	48 01 c8             	add    rax,rcx
  80269d:	48 c1 e0 02          	shl    rax,0x2
  8026a1:	48 01 f0             	add    rax,rsi
  8026a4:	48 83 c0 40          	add    rax,0x40
  8026a8:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
        int stlba=dpte->start_lba;
  8026ab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8026af:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8026b2:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
        blkdev->par[i].start_sec=stlba;
  8026b5:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  8026b9:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8026bc:	48 63 d0             	movsxd rdx,eax
  8026bf:	48 89 d0             	mov    rax,rdx
  8026c2:	48 01 c0             	add    rax,rax
  8026c5:	48 01 d0             	add    rax,rdx
  8026c8:	48 c1 e0 02          	shl    rax,0x2
  8026cc:	48 01 c8             	add    rax,rcx
  8026cf:	48 8d 50 40          	lea    rdx,[rax+0x40]
  8026d3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8026d6:	89 02                	mov    DWORD PTR [rdx],eax
        int i;
        for(i=0;i<MAX_FS;i++)
  8026d8:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8026df:	eb 68                	jmp    802749 <scan_dev+0x127>
        {
            if(fs[i].read_superblock&&fs[i].read_superblock(dev,stlba)==0)
  8026e1:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8026e4:	48 63 d0             	movsxd rdx,eax
  8026e7:	48 89 d0             	mov    rax,rdx
  8026ea:	48 01 c0             	add    rax,rax
  8026ed:	48 01 d0             	add    rax,rdx
  8026f0:	48 c1 e0 03          	shl    rax,0x3
  8026f4:	48 05 80 23 40 00    	add    rax,0x402380
  8026fa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8026fd:	48 85 c0             	test   rax,rax
  802700:	74 43                	je     802745 <scan_dev+0x123>
  802702:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  802705:	48 63 d0             	movsxd rdx,eax
  802708:	48 89 d0             	mov    rax,rdx
  80270b:	48 01 c0             	add    rax,rax
  80270e:	48 01 d0             	add    rax,rdx
  802711:	48 c1 e0 03          	shl    rax,0x3
  802715:	48 05 80 23 40 00    	add    rax,0x402380
  80271b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80271e:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  802721:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802724:	89 d6                	mov    esi,edx
  802726:	89 c7                	mov    edi,eax
  802728:	ff d1                	call   rcx
  80272a:	85 c0                	test   eax,eax
  80272c:	75 17                	jne    802745 <scan_dev+0x123>
            {
                reg_vol(dev,i,blkdev->name);//识别成功，注册卷
  80272e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802732:	48 8d 50 14          	lea    rdx,[rax+0x14]
  802736:	8b 4d f0             	mov    ecx,DWORD PTR [rbp-0x10]
  802739:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80273c:	89 ce                	mov    esi,ecx
  80273e:	89 c7                	mov    edi,eax
  802740:	e8 ae f1 ff ff       	call   8018f3 <reg_vol>
        for(i=0;i<MAX_FS;i++)
  802745:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  802749:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  80274d:	7e 92                	jle    8026e1 <scan_dev+0xbf>
            }
        }
        if(i==MAX_FS)
  80274f:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  802753:	75 0f                	jne    802764 <scan_dev+0x142>
        {
            printf("err:unrecognised partition fs.\n");
  802755:	bf a8 19 81 00       	mov    edi,0x8119a8
  80275a:	b8 00 00 00 00       	mov    eax,0x0
  80275f:	e8 31 e5 ff ff       	call   800c95 <printf>
        }

        blkdev->par[i].end_sec=dpte->end_lba;
  802764:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802768:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80276b:	89 c1                	mov    ecx,eax
  80276d:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  802771:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  802774:	48 63 d0             	movsxd rdx,eax
  802777:	48 89 d0             	mov    rax,rdx
  80277a:	48 01 c0             	add    rax,rax
  80277d:	48 01 d0             	add    rax,rdx
  802780:	48 c1 e0 02          	shl    rax,0x2
  802784:	48 01 f0             	add    rax,rsi
  802787:	48 83 c0 40          	add    rax,0x40
  80278b:	89 48 04             	mov    DWORD PTR [rax+0x4],ecx
        dpte++;
  80278e:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  802793:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802797:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80279b:	0f 8e df fe ff ff    	jle    802680 <scan_dev+0x5e>
    }
    brelse(bh);
  8027a1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8027a5:	48 89 c7             	mov    rdi,rax
  8027a8:	e8 9c f9 ff ff       	call   802149 <brelse>
    return 0;
  8027ad:	b8 00 00 00 00       	mov    eax,0x0
}
  8027b2:	c9                   	leave  
  8027b3:	c3                   	ret    

00000000008027b4 <sync_buf>:

int sync_buf(buffer_head* bh)
{
  8027b4:	f3 0f 1e fa          	endbr64 
  8027b8:	55                   	push   rbp
  8027b9:	48 89 e5             	mov    rbp,rsp
  8027bc:	48 83 ec 20          	sub    rsp,0x20
  8027c0:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  8027c4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8027c8:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  8027cc:	0f b7 c0             	movzx  eax,ax
  8027cf:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  8027d2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8027d6:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8027da:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  8027dd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8027e1:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8027e4:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  8027e7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8027ea:	b9 00 02 00 00       	mov    ecx,0x200
  8027ef:	89 c7                	mov    edi,eax
  8027f1:	e8 02 00 00 00       	call   8027f8 <write_block>

}
  8027f6:	c9                   	leave  
  8027f7:	c3                   	ret    

00000000008027f8 <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  8027f8:	f3 0f 1e fa          	endbr64 
  8027fc:	55                   	push   rbp
  8027fd:	48 89 e5             	mov    rbp,rsp
  802800:	48 83 ec 30          	sub    rsp,0x30
  802804:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802807:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80280a:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  80280e:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  802811:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802814:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802817:	89 d6                	mov    esi,edx
  802819:	89 c7                	mov    edi,eax
  80281b:	e8 34 fc ff ff       	call   802454 <get_buf>
  802820:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802824:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802827:	ba 00 02 00 00       	mov    edx,0x200
  80282c:	39 d0                	cmp    eax,edx
  80282e:	0f 4f c2             	cmovg  eax,edx
  802831:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  802834:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802837:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80283b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80283e:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  802842:	48 89 ce             	mov    rsi,rcx
  802845:	48 89 c7             	mov    rdi,rax
  802848:	e8 19 6d 00 00       	call   809566 <memcpy>
        len-=BLOCK_SIZE;
  80284d:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  802854:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802858:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  80285c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802860:	48 89 c7             	mov    rdi,rax
  802863:	e8 e1 f8 ff ff       	call   802149 <brelse>
    }while(len>0);
  802868:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  80286c:	7f a3                	jg     802811 <write_block+0x19>
    return 0;
  80286e:	b8 00 00 00 00       	mov    eax,0x0
}
  802873:	c9                   	leave  
  802874:	c3                   	ret    

0000000000802875 <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  802875:	f3 0f 1e fa          	endbr64 
  802879:	55                   	push   rbp
  80287a:	48 89 e5             	mov    rbp,rsp
  80287d:	48 83 ec 30          	sub    rsp,0x30
  802881:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802884:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802887:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  80288b:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  80288e:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802891:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802894:	89 d6                	mov    esi,edx
  802896:	89 c7                	mov    edi,eax
  802898:	e8 0f f9 ff ff       	call   8021ac <bread>
  80289d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8028a1:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8028a4:	ba 00 02 00 00       	mov    edx,0x200
  8028a9:	39 d0                	cmp    eax,edx
  8028ab:	0f 4f c2             	cmovg  eax,edx
  8028ae:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  8028b1:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8028b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028b8:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8028bb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8028bf:	48 89 ce             	mov    rsi,rcx
  8028c2:	48 89 c7             	mov    rdi,rax
  8028c5:	e8 9c 6c 00 00       	call   809566 <memcpy>
        len-=BLOCK_SIZE;
  8028ca:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  8028d1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028d5:	48 89 c7             	mov    rdi,rax
  8028d8:	e8 6c f8 ff ff       	call   802149 <brelse>
    }while(len>0);
  8028dd:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  8028e1:	7f ab                	jg     80288e <read_block+0x19>
    return 0;
  8028e3:	b8 00 00 00 00       	mov    eax,0x0
}
  8028e8:	c9                   	leave  
  8028e9:	c3                   	ret    

00000000008028ea <init_vfs>:

int init_vfs()
{
  8028ea:	f3 0f 1e fa          	endbr64 
  8028ee:	55                   	push   rbp
  8028ef:	48 89 e5             	mov    rbp,rsp
  8028f2:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  8028f6:	48 8b 05 83 5b c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05b83]        # 408480 <dev_tree>
  8028fd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  802901:	eb 40                	jmp    802943 <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  802903:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802907:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  80290d:	48 c1 f8 02          	sar    rax,0x2
  802911:	48 89 c2             	mov    rdx,rax
  802914:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  80291b:	18 9c 8f 
  80291e:	48 0f af c2          	imul   rax,rdx
  802922:	89 c7                	mov    edi,eax
  802924:	e8 f9 fc ff ff       	call   802622 <scan_dev>
  802929:	85 c0                	test   eax,eax
  80292b:	74 07                	je     802934 <init_vfs+0x4a>
  80292d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802932:	eb 1b                	jmp    80294f <init_vfs+0x65>
    for(;p;p=p->next)
  802934:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802938:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  80293f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  802943:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802948:	75 b9                	jne    802903 <init_vfs+0x19>
    }
    return 0;
  80294a:	b8 00 00 00 00       	mov    eax,0x0
  80294f:	c9                   	leave  
  802950:	c3                   	ret    

0000000000802951 <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  802951:	f3 0f 1e fa          	endbr64 
  802955:	55                   	push   rbp
  802956:	48 89 e5             	mov    rbp,rsp
}
  802959:	90                   	nop
  80295a:	5d                   	pop    rbp
  80295b:	c3                   	ret    

000000000080295c <load_driver>:
int load_driver(char *path)
{
  80295c:	f3 0f 1e fa          	endbr64 
  802960:	55                   	push   rbp
  802961:	48 89 e5             	mov    rbp,rsp
  802964:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  802968:	90                   	nop
  802969:	5d                   	pop    rbp
  80296a:	c3                   	ret    

000000000080296b <reg_device>:

int reg_device(device* dev)
{
  80296b:	f3 0f 1e fa          	endbr64 
  80296f:	55                   	push   rbp
  802970:	48 89 e5             	mov    rbp,rsp
  802973:	53                   	push   rbx
  802974:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  802978:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  80297f:	e9 42 01 00 00       	jmp    802ac6 <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  802984:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802987:	48 63 d0             	movsxd rdx,eax
  80298a:	48 89 d0             	mov    rax,rdx
  80298d:	48 c1 e0 02          	shl    rax,0x2
  802991:	48 01 d0             	add    rax,rdx
  802994:	48 c1 e0 02          	shl    rax,0x2
  802998:	48 01 d0             	add    rax,rdx
  80299b:	48 c1 e0 03          	shl    rax,0x3
  80299f:	48 05 90 2e 40 00    	add    rax,0x402e90
  8029a5:	8b 00                	mov    eax,DWORD PTR [rax]
  8029a7:	85 c0                	test   eax,eax
  8029a9:	0f 85 13 01 00 00    	jne    802ac2 <reg_device+0x157>
        {
            devs[i]=*dev;
  8029af:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8029b2:	48 63 d0             	movsxd rdx,eax
  8029b5:	48 89 d0             	mov    rax,rdx
  8029b8:	48 c1 e0 02          	shl    rax,0x2
  8029bc:	48 01 d0             	add    rax,rdx
  8029bf:	48 c1 e0 02          	shl    rax,0x2
  8029c3:	48 01 d0             	add    rax,rdx
  8029c6:	48 c1 e0 03          	shl    rax,0x3
  8029ca:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  8029d1:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8029d5:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8029d8:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  8029dc:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  8029df:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8029e3:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8029e7:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8029eb:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  8029ef:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  8029f3:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  8029f7:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  8029fb:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  8029ff:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802a03:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802a07:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802a0b:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802a0f:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802a13:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802a17:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802a1b:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802a1f:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802a23:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802a27:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802a2b:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802a2f:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802a33:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802a37:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802a3b:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802a3f:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802a43:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802a47:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802a4b:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802a4f:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802a53:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802a5a:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802a61:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802a68:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802a6f:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802a76:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802a7d:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802a84:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  802a8b:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  802a92:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  802a99:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802a9c:	48 63 d0             	movsxd rdx,eax
  802a9f:	48 89 d0             	mov    rax,rdx
  802aa2:	48 c1 e0 02          	shl    rax,0x2
  802aa6:	48 01 d0             	add    rax,rdx
  802aa9:	48 c1 e0 02          	shl    rax,0x2
  802aad:	48 01 d0             	add    rax,rdx
  802ab0:	48 c1 e0 03          	shl    rax,0x3
  802ab4:	48 05 90 2e 40 00    	add    rax,0x402e90
  802aba:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802ac0:	eb 0e                	jmp    802ad0 <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  802ac2:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802ac6:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  802aca:	0f 8e b4 fe ff ff    	jle    802984 <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802ad0:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  802ad4:	75 0a                	jne    802ae0 <reg_device+0x175>
        return -1;
  802ad6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802adb:	e9 6d 01 00 00       	jmp    802c4d <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802ae0:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  802ae7:	00 
  802ae8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802aeb:	48 63 d0             	movsxd rdx,eax
  802aee:	48 89 d0             	mov    rax,rdx
  802af1:	48 c1 e0 02          	shl    rax,0x2
  802af5:	48 01 d0             	add    rax,rdx
  802af8:	48 c1 e0 02          	shl    rax,0x2
  802afc:	48 01 d0             	add    rax,rdx
  802aff:	48 c1 e0 03          	shl    rax,0x3
  802b03:	48 05 80 2e 40 00    	add    rax,0x402e80
  802b09:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  802b0d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802b11:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802b14:	83 f8 03             	cmp    eax,0x3
  802b17:	74 3b                	je     802b54 <reg_device+0x1e9>
  802b19:	83 f8 03             	cmp    eax,0x3
  802b1c:	7f 4b                	jg     802b69 <reg_device+0x1fe>
  802b1e:	83 f8 01             	cmp    eax,0x1
  802b21:	74 07                	je     802b2a <reg_device+0x1bf>
  802b23:	83 f8 02             	cmp    eax,0x2
  802b26:	74 17                	je     802b3f <reg_device+0x1d4>
  802b28:	eb 3f                	jmp    802b69 <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  802b2a:	48 8b 05 4f 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0594f]        # 408480 <dev_tree>
  802b31:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802b35:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  802b3c:	00 
        break;
  802b3d:	eb 34                	jmp    802b73 <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  802b3f:	48 8b 05 42 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05942]        # 408488 <dev_tree+0x8>
  802b46:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802b4a:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  802b51:	00 
        break;
  802b52:	eb 1f                	jmp    802b73 <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  802b54:	48 8b 05 35 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05935]        # 408490 <dev_tree+0x10>
  802b5b:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802b5f:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  802b66:	00 
        break;
  802b67:	eb 0a                	jmp    802b73 <reg_device+0x208>
    default:return -1;//不可能有其他情况
  802b69:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802b6e:	e9 da 00 00 00       	jmp    802c4d <reg_device+0x2e2>
    }
    if(!p){
  802b73:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  802b78:	75 2b                	jne    802ba5 <reg_device+0x23a>
        *pp=neo;
  802b7a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802b7e:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802b82:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  802b85:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b89:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  802b90:	00 00 00 00 
  802b94:	eb 3d                	jmp    802bd3 <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  802b96:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802b9a:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802ba1:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802ba5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802ba9:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802bb0:	48 85 c0             	test   rax,rax
  802bb3:	75 e1                	jne    802b96 <reg_device+0x22b>
        p->next=neo;
  802bb5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802bb9:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802bbd:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  802bc4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bc8:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802bcc:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802bd3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bd7:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802bde:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802be2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802be6:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802be9:	83 f8 04             	cmp    eax,0x4
  802bec:	74 3b                	je     802c29 <reg_device+0x2be>
  802bee:	83 f8 04             	cmp    eax,0x4
  802bf1:	7f 56                	jg     802c49 <reg_device+0x2de>
  802bf3:	83 f8 03             	cmp    eax,0x3
  802bf6:	74 21                	je     802c19 <reg_device+0x2ae>
  802bf8:	83 f8 03             	cmp    eax,0x3
  802bfb:	7f 4c                	jg     802c49 <reg_device+0x2de>
  802bfd:	83 f8 01             	cmp    eax,0x1
  802c00:	74 07                	je     802c09 <reg_device+0x29e>
  802c02:	83 f8 02             	cmp    eax,0x2
  802c05:	74 32                	je     802c39 <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802c07:	eb 40                	jmp    802c49 <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  802c09:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c0d:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802c14:	00 00 00 
        break;
  802c17:	eb 31                	jmp    802c4a <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  802c19:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c1d:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802c24:	00 00 00 
        break;
  802c27:	eb 21                	jmp    802c4a <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  802c29:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c2d:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  802c34:	00 00 00 
        break;
  802c37:	eb 11                	jmp    802c4a <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  802c39:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c3d:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  802c44:	00 00 00 
        break;
  802c47:	eb 01                	jmp    802c4a <reg_device+0x2df>
        break;
  802c49:	90                   	nop
    }
    return i;
  802c4a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  802c4d:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802c51:	c9                   	leave  
  802c52:	c3                   	ret    

0000000000802c53 <reg_driver>:


int reg_driver(driver *drv)
{
  802c53:	f3 0f 1e fa          	endbr64 
  802c57:	55                   	push   rbp
  802c58:	48 89 e5             	mov    rbp,rsp
  802c5b:	53                   	push   rbx
  802c5c:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  802c60:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802c67:	e9 22 01 00 00       	jmp    802d8e <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  802c6c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802c6f:	48 63 d0             	movsxd rdx,eax
  802c72:	48 89 d0             	mov    rax,rdx
  802c75:	48 c1 e0 02          	shl    rax,0x2
  802c79:	48 01 d0             	add    rax,rdx
  802c7c:	48 c1 e0 05          	shl    rax,0x5
  802c80:	48 05 80 58 40 00    	add    rax,0x405880
  802c86:	8b 00                	mov    eax,DWORD PTR [rax]
  802c88:	85 c0                	test   eax,eax
  802c8a:	0f 85 fa 00 00 00    	jne    802d8a <reg_driver+0x137>
        {
            drvs[i]=*drv;
  802c90:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802c93:	48 63 d0             	movsxd rdx,eax
  802c96:	48 89 d0             	mov    rax,rdx
  802c99:	48 c1 e0 02          	shl    rax,0x2
  802c9d:	48 01 d0             	add    rax,rdx
  802ca0:	48 c1 e0 05          	shl    rax,0x5
  802ca4:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  802cab:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802caf:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802cb2:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802cb6:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802cb9:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802cbd:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802cc1:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802cc5:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802cc9:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802ccd:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802cd1:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802cd5:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802cd9:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802cdd:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802ce1:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802ce5:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802ce9:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802ced:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802cf1:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802cf5:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802cf9:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802cfd:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802d01:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802d05:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802d09:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802d0d:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802d11:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802d15:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802d19:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802d1d:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802d21:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802d25:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802d29:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802d2d:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802d34:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802d3b:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802d42:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802d49:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802d50:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802d57:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802d5e:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  802d65:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802d68:	48 63 d0             	movsxd rdx,eax
  802d6b:	48 89 d0             	mov    rax,rdx
  802d6e:	48 c1 e0 02          	shl    rax,0x2
  802d72:	48 01 d0             	add    rax,rdx
  802d75:	48 c1 e0 05          	shl    rax,0x5
  802d79:	48 05 80 58 40 00    	add    rax,0x405880
  802d7f:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  802d85:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802d88:	eb 13                	jmp    802d9d <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  802d8a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802d8e:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  802d92:	0f 8e d4 fe ff ff    	jle    802c6c <reg_driver+0x19>
        }
    }
    return -1;
  802d98:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802d9d:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802da1:	c9                   	leave  
  802da2:	c3                   	ret    

0000000000802da3 <sys_find_dev>:

int sys_find_dev(char *name)
{
  802da3:	f3 0f 1e fa          	endbr64 
  802da7:	55                   	push   rbp
  802da8:	48 89 e5             	mov    rbp,rsp
  802dab:	48 83 ec 20          	sub    rsp,0x20
  802daf:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802db3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802dba:	eb 6c                	jmp    802e28 <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802dbc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802dbf:	48 63 d0             	movsxd rdx,eax
  802dc2:	48 89 d0             	mov    rax,rdx
  802dc5:	48 c1 e0 02          	shl    rax,0x2
  802dc9:	48 01 d0             	add    rax,rdx
  802dcc:	48 c1 e0 02          	shl    rax,0x2
  802dd0:	48 01 d0             	add    rax,rdx
  802dd3:	48 c1 e0 03          	shl    rax,0x3
  802dd7:	48 05 90 2e 40 00    	add    rax,0x402e90
  802ddd:	8b 00                	mov    eax,DWORD PTR [rax]
  802ddf:	85 c0                	test   eax,eax
  802de1:	74 41                	je     802e24 <sys_find_dev+0x81>
  802de3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802de6:	48 63 d0             	movsxd rdx,eax
  802de9:	48 89 d0             	mov    rax,rdx
  802dec:	48 c1 e0 02          	shl    rax,0x2
  802df0:	48 01 d0             	add    rax,rdx
  802df3:	48 c1 e0 02          	shl    rax,0x2
  802df7:	48 01 d0             	add    rax,rdx
  802dfa:	48 c1 e0 03          	shl    rax,0x3
  802dfe:	48 83 c0 10          	add    rax,0x10
  802e02:	48 05 80 2e 40 00    	add    rax,0x402e80
  802e08:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802e0c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802e10:	48 89 d6             	mov    rsi,rdx
  802e13:	48 89 c7             	mov    rdi,rax
  802e16:	e8 e9 69 00 00       	call   809804 <strcmp>
  802e1b:	85 c0                	test   eax,eax
  802e1d:	75 05                	jne    802e24 <sys_find_dev+0x81>
            return i;
  802e1f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e22:	eb 0f                	jmp    802e33 <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802e24:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802e28:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802e2c:	7e 8e                	jle    802dbc <sys_find_dev+0x19>
    }
    return -1;
  802e2e:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802e33:	c9                   	leave  
  802e34:	c3                   	ret    

0000000000802e35 <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  802e35:	f3 0f 1e fa          	endbr64 
  802e39:	55                   	push   rbp
  802e3a:	48 89 e5             	mov    rbp,rsp
  802e3d:	48 83 ec 30          	sub    rsp,0x30
  802e41:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802e45:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  802e48:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  802e4c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  802e53:	eb 67                	jmp    802ebc <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802e55:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e58:	48 63 d0             	movsxd rdx,eax
  802e5b:	48 89 d0             	mov    rax,rdx
  802e5e:	48 c1 e0 02          	shl    rax,0x2
  802e62:	48 01 d0             	add    rax,rdx
  802e65:	48 c1 e0 02          	shl    rax,0x2
  802e69:	48 01 d0             	add    rax,rdx
  802e6c:	48 c1 e0 03          	shl    rax,0x3
  802e70:	48 05 90 2e 40 00    	add    rax,0x402e90
  802e76:	8b 00                	mov    eax,DWORD PTR [rax]
  802e78:	85 c0                	test   eax,eax
  802e7a:	74 3c                	je     802eb8 <sys_operate_dev+0x83>
  802e7c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e7f:	48 63 d0             	movsxd rdx,eax
  802e82:	48 89 d0             	mov    rax,rdx
  802e85:	48 c1 e0 02          	shl    rax,0x2
  802e89:	48 01 d0             	add    rax,rdx
  802e8c:	48 c1 e0 02          	shl    rax,0x2
  802e90:	48 01 d0             	add    rax,rdx
  802e93:	48 c1 e0 03          	shl    rax,0x3
  802e97:	48 83 c0 10          	add    rax,0x10
  802e9b:	48 05 80 2e 40 00    	add    rax,0x402e80
  802ea1:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802ea5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802ea9:	48 89 d6             	mov    rsi,rdx
  802eac:	48 89 c7             	mov    rdi,rax
  802eaf:	e8 50 69 00 00       	call   809804 <strcmp>
  802eb4:	85 c0                	test   eax,eax
  802eb6:	74 0c                	je     802ec4 <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  802eb8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802ebc:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802ec0:	7e 93                	jle    802e55 <sys_operate_dev+0x20>
  802ec2:	eb 01                	jmp    802ec5 <sys_operate_dev+0x90>
            break;
  802ec4:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  802ec5:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  802ec9:	75 0a                	jne    802ed5 <sys_operate_dev+0xa0>
  802ecb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802ed0:	e9 9c 02 00 00       	jmp    803171 <sys_operate_dev+0x33c>
    switch (func) {
  802ed5:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  802ed9:	0f 87 8d 02 00 00    	ja     80316c <sys_operate_dev+0x337>
  802edf:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802ee2:	48 8b 04 c5 c8 19 81 	mov    rax,QWORD PTR [rax*8+0x8119c8]
  802ee9:	00 
  802eea:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  802eed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ef0:	48 63 d0             	movsxd rdx,eax
  802ef3:	48 89 d0             	mov    rax,rdx
  802ef6:	48 c1 e0 02          	shl    rax,0x2
  802efa:	48 01 d0             	add    rax,rdx
  802efd:	48 c1 e0 02          	shl    rax,0x2
  802f01:	48 01 d0             	add    rax,rdx
  802f04:	48 c1 e0 03          	shl    rax,0x3
  802f08:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802f0e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802f11:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802f15:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802f19:	48 89 c7             	mov    rdi,rax
  802f1c:	ff d2                	call   rdx
  802f1e:	e9 4e 02 00 00       	jmp    803171 <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  802f23:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f26:	48 63 d0             	movsxd rdx,eax
  802f29:	48 89 d0             	mov    rax,rdx
  802f2c:	48 c1 e0 02          	shl    rax,0x2
  802f30:	48 01 d0             	add    rax,rdx
  802f33:	48 c1 e0 02          	shl    rax,0x2
  802f37:	48 01 d0             	add    rax,rdx
  802f3a:	48 c1 e0 03          	shl    rax,0x3
  802f3e:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802f44:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802f47:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  802f4b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802f4f:	48 89 c7             	mov    rdi,rax
  802f52:	ff d2                	call   rdx
  802f54:	e9 18 02 00 00       	jmp    803171 <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  802f59:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f5c:	48 63 d0             	movsxd rdx,eax
  802f5f:	48 89 d0             	mov    rax,rdx
  802f62:	48 c1 e0 02          	shl    rax,0x2
  802f66:	48 01 d0             	add    rax,rdx
  802f69:	48 c1 e0 02          	shl    rax,0x2
  802f6d:	48 01 d0             	add    rax,rdx
  802f70:	48 c1 e0 03          	shl    rax,0x3
  802f74:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802f7a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802f7d:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  802f81:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802f85:	48 89 c7             	mov    rdi,rax
  802f88:	ff d2                	call   rdx
  802f8a:	e9 e2 01 00 00       	jmp    803171 <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  802f8f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f92:	48 63 d0             	movsxd rdx,eax
  802f95:	48 89 d0             	mov    rax,rdx
  802f98:	48 c1 e0 02          	shl    rax,0x2
  802f9c:	48 01 d0             	add    rax,rdx
  802f9f:	48 c1 e0 02          	shl    rax,0x2
  802fa3:	48 01 d0             	add    rax,rdx
  802fa6:	48 c1 e0 03          	shl    rax,0x3
  802faa:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802fb0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802fb3:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  802fb7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802fbb:	48 89 c7             	mov    rdi,rax
  802fbe:	ff d2                	call   rdx
  802fc0:	e9 ac 01 00 00       	jmp    803171 <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  802fc5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fc8:	48 63 d0             	movsxd rdx,eax
  802fcb:	48 89 d0             	mov    rax,rdx
  802fce:	48 c1 e0 02          	shl    rax,0x2
  802fd2:	48 01 d0             	add    rax,rdx
  802fd5:	48 c1 e0 02          	shl    rax,0x2
  802fd9:	48 01 d0             	add    rax,rdx
  802fdc:	48 c1 e0 03          	shl    rax,0x3
  802fe0:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  802fe6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802fe9:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  802fed:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802ff1:	48 89 c7             	mov    rdi,rax
  802ff4:	ff d2                	call   rdx
  802ff6:	e9 76 01 00 00       	jmp    803171 <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  802ffb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ffe:	48 63 d0             	movsxd rdx,eax
  803001:	48 89 d0             	mov    rax,rdx
  803004:	48 c1 e0 02          	shl    rax,0x2
  803008:	48 01 d0             	add    rax,rdx
  80300b:	48 c1 e0 02          	shl    rax,0x2
  80300f:	48 01 d0             	add    rax,rdx
  803012:	48 c1 e0 03          	shl    rax,0x3
  803016:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80301c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80301f:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  803023:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803027:	48 89 c7             	mov    rdi,rax
  80302a:	ff d2                	call   rdx
  80302c:	e9 40 01 00 00       	jmp    803171 <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  803031:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803034:	48 63 d0             	movsxd rdx,eax
  803037:	48 89 d0             	mov    rax,rdx
  80303a:	48 c1 e0 02          	shl    rax,0x2
  80303e:	48 01 d0             	add    rax,rdx
  803041:	48 c1 e0 02          	shl    rax,0x2
  803045:	48 01 d0             	add    rax,rdx
  803048:	48 c1 e0 03          	shl    rax,0x3
  80304c:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803052:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803055:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  803059:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80305d:	48 89 c7             	mov    rdi,rax
  803060:	ff d2                	call   rdx
  803062:	e9 0a 01 00 00       	jmp    803171 <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  803067:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80306a:	48 63 d0             	movsxd rdx,eax
  80306d:	48 89 d0             	mov    rax,rdx
  803070:	48 c1 e0 02          	shl    rax,0x2
  803074:	48 01 d0             	add    rax,rdx
  803077:	48 c1 e0 02          	shl    rax,0x2
  80307b:	48 01 d0             	add    rax,rdx
  80307e:	48 c1 e0 03          	shl    rax,0x3
  803082:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803088:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80308b:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  80308f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803093:	48 89 c7             	mov    rdi,rax
  803096:	ff d2                	call   rdx
  803098:	e9 d4 00 00 00       	jmp    803171 <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  80309d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030a0:	48 63 d0             	movsxd rdx,eax
  8030a3:	48 89 d0             	mov    rax,rdx
  8030a6:	48 c1 e0 02          	shl    rax,0x2
  8030aa:	48 01 d0             	add    rax,rdx
  8030ad:	48 c1 e0 02          	shl    rax,0x2
  8030b1:	48 01 d0             	add    rax,rdx
  8030b4:	48 c1 e0 03          	shl    rax,0x3
  8030b8:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030be:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030c1:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  8030c5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030c9:	48 89 c7             	mov    rdi,rax
  8030cc:	ff d2                	call   rdx
  8030ce:	e9 9e 00 00 00       	jmp    803171 <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  8030d3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030d6:	48 63 d0             	movsxd rdx,eax
  8030d9:	48 89 d0             	mov    rax,rdx
  8030dc:	48 c1 e0 02          	shl    rax,0x2
  8030e0:	48 01 d0             	add    rax,rdx
  8030e3:	48 c1 e0 02          	shl    rax,0x2
  8030e7:	48 01 d0             	add    rax,rdx
  8030ea:	48 c1 e0 03          	shl    rax,0x3
  8030ee:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030f4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030f7:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  8030fb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030ff:	48 89 c7             	mov    rdi,rax
  803102:	ff d2                	call   rdx
  803104:	eb 6b                	jmp    803171 <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  803106:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803109:	48 63 d0             	movsxd rdx,eax
  80310c:	48 89 d0             	mov    rax,rdx
  80310f:	48 c1 e0 02          	shl    rax,0x2
  803113:	48 01 d0             	add    rax,rdx
  803116:	48 c1 e0 02          	shl    rax,0x2
  80311a:	48 01 d0             	add    rax,rdx
  80311d:	48 c1 e0 03          	shl    rax,0x3
  803121:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803127:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80312a:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  80312e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803132:	48 89 c7             	mov    rdi,rax
  803135:	ff d2                	call   rdx
  803137:	eb 38                	jmp    803171 <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  803139:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80313c:	48 63 d0             	movsxd rdx,eax
  80313f:	48 89 d0             	mov    rax,rdx
  803142:	48 c1 e0 02          	shl    rax,0x2
  803146:	48 01 d0             	add    rax,rdx
  803149:	48 c1 e0 02          	shl    rax,0x2
  80314d:	48 01 d0             	add    rax,rdx
  803150:	48 c1 e0 03          	shl    rax,0x3
  803154:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80315a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80315d:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  803161:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803165:	48 89 c7             	mov    rdi,rax
  803168:	ff d2                	call   rdx
  80316a:	eb 05                	jmp    803171 <sys_operate_dev+0x33c>
    }
    return -1;
  80316c:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803171:	c9                   	leave  
  803172:	c3                   	ret    

0000000000803173 <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  803173:	f3 0f 1e fa          	endbr64 
  803177:	55                   	push   rbp
  803178:	48 89 e5             	mov    rbp,rsp
  80317b:	48 83 ec 10          	sub    rsp,0x10
  80317f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  803182:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  803185:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  803189:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80318c:	48 63 d0             	movsxd rdx,eax
  80318f:	48 89 d0             	mov    rax,rdx
  803192:	48 c1 e0 02          	shl    rax,0x2
  803196:	48 01 d0             	add    rax,rdx
  803199:	48 c1 e0 05          	shl    rax,0x5
  80319d:	48 05 80 58 40 00    	add    rax,0x405880
  8031a3:	8b 00                	mov    eax,DWORD PTR [rax]
  8031a5:	85 c0                	test   eax,eax
  8031a7:	75 0a                	jne    8031b3 <call_drv_func+0x40>
  8031a9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8031ae:	e9 15 02 00 00       	jmp    8033c8 <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  8031b3:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  8031b7:	0f 87 06 02 00 00    	ja     8033c3 <call_drv_func+0x250>
  8031bd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8031c0:	48 8b 04 c5 28 1a 81 	mov    rax,QWORD PTR [rax*8+0x811a28]
  8031c7:	00 
  8031c8:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  8031cb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031ce:	48 63 d0             	movsxd rdx,eax
  8031d1:	48 89 d0             	mov    rax,rdx
  8031d4:	48 c1 e0 02          	shl    rax,0x2
  8031d8:	48 01 d0             	add    rax,rdx
  8031db:	48 c1 e0 05          	shl    rax,0x5
  8031df:	48 05 88 58 40 00    	add    rax,0x405888
  8031e5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8031e8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8031ec:	48 89 c7             	mov    rdi,rax
  8031ef:	ff d2                	call   rdx
  8031f1:	e9 d2 01 00 00       	jmp    8033c8 <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  8031f6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031f9:	48 63 d0             	movsxd rdx,eax
  8031fc:	48 89 d0             	mov    rax,rdx
  8031ff:	48 c1 e0 02          	shl    rax,0x2
  803203:	48 01 d0             	add    rax,rdx
  803206:	48 c1 e0 05          	shl    rax,0x5
  80320a:	48 05 90 58 40 00    	add    rax,0x405890
  803210:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803213:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803217:	48 89 c7             	mov    rdi,rax
  80321a:	ff d2                	call   rdx
  80321c:	e9 a7 01 00 00       	jmp    8033c8 <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  803221:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803224:	48 63 d0             	movsxd rdx,eax
  803227:	48 89 d0             	mov    rax,rdx
  80322a:	48 c1 e0 02          	shl    rax,0x2
  80322e:	48 01 d0             	add    rax,rdx
  803231:	48 c1 e0 05          	shl    rax,0x5
  803235:	48 05 98 58 40 00    	add    rax,0x405898
  80323b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80323e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803242:	48 89 c7             	mov    rdi,rax
  803245:	ff d2                	call   rdx
  803247:	e9 7c 01 00 00       	jmp    8033c8 <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  80324c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80324f:	48 63 d0             	movsxd rdx,eax
  803252:	48 89 d0             	mov    rax,rdx
  803255:	48 c1 e0 02          	shl    rax,0x2
  803259:	48 01 d0             	add    rax,rdx
  80325c:	48 c1 e0 05          	shl    rax,0x5
  803260:	48 05 a0 58 40 00    	add    rax,0x4058a0
  803266:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803269:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80326d:	48 89 c7             	mov    rdi,rax
  803270:	ff d2                	call   rdx
  803272:	e9 51 01 00 00       	jmp    8033c8 <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  803277:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80327a:	48 63 d0             	movsxd rdx,eax
  80327d:	48 89 d0             	mov    rax,rdx
  803280:	48 c1 e0 02          	shl    rax,0x2
  803284:	48 01 d0             	add    rax,rdx
  803287:	48 c1 e0 05          	shl    rax,0x5
  80328b:	48 05 a8 58 40 00    	add    rax,0x4058a8
  803291:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803294:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803298:	48 89 c7             	mov    rdi,rax
  80329b:	ff d2                	call   rdx
  80329d:	e9 26 01 00 00       	jmp    8033c8 <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  8032a2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032a5:	48 63 d0             	movsxd rdx,eax
  8032a8:	48 89 d0             	mov    rax,rdx
  8032ab:	48 c1 e0 02          	shl    rax,0x2
  8032af:	48 01 d0             	add    rax,rdx
  8032b2:	48 c1 e0 05          	shl    rax,0x5
  8032b6:	48 05 b0 58 40 00    	add    rax,0x4058b0
  8032bc:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8032bf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8032c3:	48 89 c7             	mov    rdi,rax
  8032c6:	ff d2                	call   rdx
  8032c8:	e9 fb 00 00 00       	jmp    8033c8 <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  8032cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032d0:	48 63 d0             	movsxd rdx,eax
  8032d3:	48 89 d0             	mov    rax,rdx
  8032d6:	48 c1 e0 02          	shl    rax,0x2
  8032da:	48 01 d0             	add    rax,rdx
  8032dd:	48 c1 e0 05          	shl    rax,0x5
  8032e1:	48 05 b8 58 40 00    	add    rax,0x4058b8
  8032e7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8032ea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8032ee:	48 89 c7             	mov    rdi,rax
  8032f1:	ff d2                	call   rdx
  8032f3:	e9 d0 00 00 00       	jmp    8033c8 <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  8032f8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032fb:	48 63 d0             	movsxd rdx,eax
  8032fe:	48 89 d0             	mov    rax,rdx
  803301:	48 c1 e0 02          	shl    rax,0x2
  803305:	48 01 d0             	add    rax,rdx
  803308:	48 c1 e0 05          	shl    rax,0x5
  80330c:	48 05 c0 58 40 00    	add    rax,0x4058c0
  803312:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803315:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803319:	48 89 c7             	mov    rdi,rax
  80331c:	ff d2                	call   rdx
  80331e:	e9 a5 00 00 00       	jmp    8033c8 <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  803323:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803326:	48 63 d0             	movsxd rdx,eax
  803329:	48 89 d0             	mov    rax,rdx
  80332c:	48 c1 e0 02          	shl    rax,0x2
  803330:	48 01 d0             	add    rax,rdx
  803333:	48 c1 e0 05          	shl    rax,0x5
  803337:	48 05 c8 58 40 00    	add    rax,0x4058c8
  80333d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803340:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803344:	48 89 c7             	mov    rdi,rax
  803347:	ff d2                	call   rdx
  803349:	eb 7d                	jmp    8033c8 <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  80334b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80334e:	48 63 d0             	movsxd rdx,eax
  803351:	48 89 d0             	mov    rax,rdx
  803354:	48 c1 e0 02          	shl    rax,0x2
  803358:	48 01 d0             	add    rax,rdx
  80335b:	48 c1 e0 05          	shl    rax,0x5
  80335f:	48 05 d0 58 40 00    	add    rax,0x4058d0
  803365:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803368:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80336c:	48 89 c7             	mov    rdi,rax
  80336f:	ff d2                	call   rdx
  803371:	eb 55                	jmp    8033c8 <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  803373:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803376:	48 63 d0             	movsxd rdx,eax
  803379:	48 89 d0             	mov    rax,rdx
  80337c:	48 c1 e0 02          	shl    rax,0x2
  803380:	48 01 d0             	add    rax,rdx
  803383:	48 c1 e0 05          	shl    rax,0x5
  803387:	48 05 d8 58 40 00    	add    rax,0x4058d8
  80338d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803390:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803394:	48 89 c7             	mov    rdi,rax
  803397:	ff d2                	call   rdx
  803399:	eb 2d                	jmp    8033c8 <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  80339b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80339e:	48 63 d0             	movsxd rdx,eax
  8033a1:	48 89 d0             	mov    rax,rdx
  8033a4:	48 c1 e0 02          	shl    rax,0x2
  8033a8:	48 01 d0             	add    rax,rdx
  8033ab:	48 c1 e0 05          	shl    rax,0x5
  8033af:	48 05 e0 58 40 00    	add    rax,0x4058e0
  8033b5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033b8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033bc:	48 89 c7             	mov    rdi,rax
  8033bf:	ff d2                	call   rdx
  8033c1:	eb 05                	jmp    8033c8 <call_drv_func+0x255>
    }
    return -1;
  8033c3:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8033c8:	c9                   	leave  
  8033c9:	c3                   	ret    

00000000008033ca <dispose_device>:
int dispose_device(int dev){
  8033ca:	f3 0f 1e fa          	endbr64 
  8033ce:	55                   	push   rbp
  8033cf:	48 89 e5             	mov    rbp,rsp
  8033d2:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  8033d5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8033d8:	48 63 d0             	movsxd rdx,eax
  8033db:	48 89 d0             	mov    rax,rdx
  8033de:	48 c1 e0 02          	shl    rax,0x2
  8033e2:	48 01 d0             	add    rax,rdx
  8033e5:	48 c1 e0 02          	shl    rax,0x2
  8033e9:	48 01 d0             	add    rax,rdx
  8033ec:	48 c1 e0 03          	shl    rax,0x3
  8033f0:	48 05 90 2e 40 00    	add    rax,0x402e90
  8033f6:	8b 00                	mov    eax,DWORD PTR [rax]
  8033f8:	83 f8 01             	cmp    eax,0x1
  8033fb:	74 07                	je     803404 <dispose_device+0x3a>
  8033fd:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803402:	eb 62                	jmp    803466 <dispose_device+0x9c>
    device* p=&devs[dev];
  803404:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803407:	48 63 d0             	movsxd rdx,eax
  80340a:	48 89 d0             	mov    rax,rdx
  80340d:	48 c1 e0 02          	shl    rax,0x2
  803411:	48 01 d0             	add    rax,rdx
  803414:	48 c1 e0 02          	shl    rax,0x2
  803418:	48 01 d0             	add    rax,rdx
  80341b:	48 c1 e0 03          	shl    rax,0x3
  80341f:	48 05 80 2e 40 00    	add    rax,0x402e80
  803425:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  803429:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80342d:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803434:	48 85 c0             	test   rax,rax
  803437:	74 1d                	je     803456 <dispose_device+0x8c>
  803439:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80343d:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  803444:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  803448:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  80344f:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  803456:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80345a:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  803461:	b8 00 00 00 00       	mov    eax,0x0
}
  803466:	5d                   	pop    rbp
  803467:	c3                   	ret    

0000000000803468 <dispose_driver>:
int dispose_driver(driver *drv){
  803468:	f3 0f 1e fa          	endbr64 
  80346c:	55                   	push   rbp
  80346d:	48 89 e5             	mov    rbp,rsp
  803470:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  803474:	90                   	nop
  803475:	5d                   	pop    rbp
  803476:	c3                   	ret    

0000000000803477 <get_dev>:

device *get_dev(int devi)
{
  803477:	f3 0f 1e fa          	endbr64 
  80347b:	55                   	push   rbp
  80347c:	48 89 e5             	mov    rbp,rsp
  80347f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  803482:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803485:	48 63 d0             	movsxd rdx,eax
  803488:	48 89 d0             	mov    rax,rdx
  80348b:	48 c1 e0 02          	shl    rax,0x2
  80348f:	48 01 d0             	add    rax,rdx
  803492:	48 c1 e0 02          	shl    rax,0x2
  803496:	48 01 d0             	add    rax,rdx
  803499:	48 c1 e0 03          	shl    rax,0x3
  80349d:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  8034a3:	5d                   	pop    rbp
  8034a4:	c3                   	ret    

00000000008034a5 <get_drv>:
driver *get_drv(int drvi)
{
  8034a5:	f3 0f 1e fa          	endbr64 
  8034a9:	55                   	push   rbp
  8034aa:	48 89 e5             	mov    rbp,rsp
  8034ad:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  8034b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034b3:	48 63 d0             	movsxd rdx,eax
  8034b6:	48 89 d0             	mov    rax,rdx
  8034b9:	48 c1 e0 02          	shl    rax,0x2
  8034bd:	48 01 d0             	add    rax,rdx
  8034c0:	48 c1 e0 05          	shl    rax,0x5
  8034c4:	48 05 80 58 40 00    	add    rax,0x405880
}
  8034ca:	5d                   	pop    rbp
  8034cb:	c3                   	ret    

00000000008034cc <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  8034cc:	f3 0f 1e fa          	endbr64 
  8034d0:	55                   	push   rbp
  8034d1:	48 89 e5             	mov    rbp,rsp
  8034d4:	53                   	push   rbx
  8034d5:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  8034d9:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  8034e0:	eb 23                	jmp    803505 <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  8034e2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8034e5:	48 63 d0             	movsxd rdx,eax
  8034e8:	48 89 d0             	mov    rax,rdx
  8034eb:	48 01 c0             	add    rax,rax
  8034ee:	48 01 d0             	add    rax,rdx
  8034f1:	48 c1 e0 06          	shl    rax,0x6
  8034f5:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  8034fb:	8b 00                	mov    eax,DWORD PTR [rax]
  8034fd:	85 c0                	test   eax,eax
  8034ff:	74 0c                	je     80350d <make_request+0x41>
    for(;i<NR_REQS;i++)
  803501:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  803505:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  803509:	7e d7                	jle    8034e2 <make_request+0x16>
  80350b:	eb 01                	jmp    80350e <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  80350d:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  80350e:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  803512:	75 0a                	jne    80351e <make_request+0x52>
  803514:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803519:	e9 e7 01 00 00       	jmp    803705 <make_request+0x239>
    reqs[i]=*args;//放入数组
  80351e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803521:	48 63 d0             	movsxd rdx,eax
  803524:	48 89 d0             	mov    rax,rdx
  803527:	48 01 c0             	add    rax,rax
  80352a:	48 01 d0             	add    rax,rdx
  80352d:	48 c1 e0 06          	shl    rax,0x6
  803531:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803538:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80353c:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80353f:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  803543:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  803546:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  80354a:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  80354e:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  803552:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  803556:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  80355a:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  80355e:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  803562:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  803566:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  80356a:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  80356e:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  803572:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  803576:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  80357a:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  80357e:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  803582:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  803586:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  80358a:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  80358e:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  803592:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  803596:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  80359a:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  80359e:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  8035a2:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  8035a6:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  8035aa:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  8035ae:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  8035b2:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  8035b6:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  8035ba:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  8035c1:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  8035c8:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  8035cf:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  8035d6:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  8035dd:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  8035e4:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  8035eb:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  8035f2:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  8035f9:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  803600:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  803607:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  80360e:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  803615:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  80361c:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  803623:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  80362a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80362e:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  803634:	48 63 d0             	movsxd rdx,eax
  803637:	48 89 d0             	mov    rax,rdx
  80363a:	48 c1 e0 02          	shl    rax,0x2
  80363e:	48 01 d0             	add    rax,rdx
  803641:	48 c1 e0 02          	shl    rax,0x2
  803645:	48 01 d0             	add    rax,rdx
  803648:	48 c1 e0 03          	shl    rax,0x3
  80364c:	48 05 80 2e 40 00    	add    rax,0x402e80
  803652:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  803656:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80365a:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803661:	48 85 c0             	test   rax,rax
  803664:	75 27                	jne    80368d <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  803666:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803669:	48 63 d0             	movsxd rdx,eax
  80366c:	48 89 d0             	mov    rax,rdx
  80366f:	48 01 c0             	add    rax,rax
  803672:	48 01 d0             	add    rax,rdx
  803675:	48 c1 e0 06          	shl    rax,0x6
  803679:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803680:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803684:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  80368b:	eb 75                	jmp    803702 <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  80368d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803691:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803698:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  80369c:	eb 0f                	jmp    8036ad <make_request+0x1e1>
  80369e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8036a2:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  8036a9:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8036ad:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8036b1:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  8036b8:	48 85 c0             	test   rax,rax
  8036bb:	75 e1                	jne    80369e <make_request+0x1d2>
        p->next=&reqs[i];
  8036bd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8036c0:	48 63 d0             	movsxd rdx,eax
  8036c3:	48 89 d0             	mov    rax,rdx
  8036c6:	48 01 c0             	add    rax,rax
  8036c9:	48 01 d0             	add    rax,rdx
  8036cc:	48 c1 e0 06          	shl    rax,0x6
  8036d0:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8036d7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8036db:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  8036e2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8036e5:	48 63 d0             	movsxd rdx,eax
  8036e8:	48 89 d0             	mov    rax,rdx
  8036eb:	48 01 c0             	add    rax,rax
  8036ee:	48 01 d0             	add    rax,rdx
  8036f1:	48 c1 e0 06          	shl    rax,0x6
  8036f5:	48 05 38 6d 40 00    	add    rax,0x406d38
  8036fb:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  803702:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803705:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  803709:	c9                   	leave  
  80370a:	c3                   	ret    

000000000080370b <do_req>:
//取出一个申请并且执行
int do_req()
{
  80370b:	f3 0f 1e fa          	endbr64 
  80370f:	55                   	push   rbp
  803710:	48 89 e5             	mov    rbp,rsp
  803713:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  803717:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80371e:	e9 ab 00 00 00       	jmp    8037ce <do_req+0xc3>
    {
        device* p=dev_tree[i];
  803723:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803726:	48 98                	cdqe   
  803728:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  80372f:	00 
  803730:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  803734:	e9 86 00 00 00       	jmp    8037bf <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  803739:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80373d:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803744:	48 85 c0             	test   rax,rax
  803747:	75 67                	jne    8037b0 <do_req+0xa5>
  803749:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80374d:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803754:	48 85 c0             	test   rax,rax
  803757:	74 57                	je     8037b0 <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  803759:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80375d:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  803764:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803768:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  80376f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803773:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  80377a:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  803781:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803785:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  80378c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803790:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  803796:	48 98                	cdqe   
  803798:	48 8b 14 c5 40 9f 80 	mov    rdx,QWORD PTR [rax*8+0x809f40]
  80379f:	00 
  8037a0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037a4:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  8037ab:	48 89 c7             	mov    rdi,rax
  8037ae:	ff d2                	call   rdx
        for(;p;p=p->next)
  8037b0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037b4:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8037bb:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8037bf:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8037c4:	0f 85 6f ff ff ff    	jne    803739 <do_req+0x2e>
    for(int i=0;i<3;i++)
  8037ca:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8037ce:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8037d2:	0f 8e 4b ff ff ff    	jle    803723 <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  8037d8:	b8 00 00 00 00       	mov    eax,0x0
}
  8037dd:	c9                   	leave  
  8037de:	c3                   	ret    

00000000008037df <wait_on_req>:


void wait_on_req(int reqi)
{
  8037df:	f3 0f 1e fa          	endbr64 
  8037e3:	55                   	push   rbp
  8037e4:	48 89 e5             	mov    rbp,rsp
  8037e7:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  8037ea:	90                   	nop
  8037eb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8037ee:	48 63 d0             	movsxd rdx,eax
  8037f1:	48 89 d0             	mov    rax,rdx
  8037f4:	48 01 c0             	add    rax,rax
  8037f7:	48 01 d0             	add    rax,rdx
  8037fa:	48 c1 e0 06          	shl    rax,0x6
  8037fe:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803804:	8b 00                	mov    eax,DWORD PTR [rax]
  803806:	83 f8 03             	cmp    eax,0x3
  803809:	75 e0                	jne    8037eb <wait_on_req+0xc>
}
  80380b:	90                   	nop
  80380c:	90                   	nop
  80380d:	5d                   	pop    rbp
  80380e:	c3                   	ret    

000000000080380f <clear_req>:
void clear_req(int reqi)
{
  80380f:	f3 0f 1e fa          	endbr64 
  803813:	55                   	push   rbp
  803814:	48 89 e5             	mov    rbp,rsp
  803817:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  80381a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80381d:	48 63 d0             	movsxd rdx,eax
  803820:	48 89 d0             	mov    rax,rdx
  803823:	48 01 c0             	add    rax,rax
  803826:	48 01 d0             	add    rax,rdx
  803829:	48 c1 e0 06          	shl    rax,0x6
  80382d:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803833:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  803839:	90                   	nop
  80383a:	5d                   	pop    rbp
  80383b:	c3                   	ret    

000000000080383c <init_proc>:
struct process task[MAX_PROC_COUNT];
TSS scene_saver;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  80383c:	f3 0f 1e fa          	endbr64 
  803840:	55                   	push   rbp
  803841:	48 89 e5             	mov    rbp,rsp
  803844:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803848:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80384f:	eb 4c                	jmp    80389d <init_proc+0x61>
        task[i].pid=-1;
  803851:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803854:	48 98                	cdqe   
  803856:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80385d:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803863:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  803869:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80386c:	48 98                	cdqe   
  80386e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803875:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80387b:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  803881:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803884:	48 98                	cdqe   
  803886:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80388d:	48 05 00 85 40 00    	add    rax,0x408500
  803893:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803899:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80389d:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8038a1:	7e ae                	jle    803851 <init_proc+0x15>
    }
    cur_proc=0;//no proc
  8038a3:	c7 05 c3 e7 c0 ff 00 	mov    DWORD PTR [rip+0xffffffffffc0e7c3],0x0        # 412070 <cur_proc>
  8038aa:	00 00 00 
    pidd=1;
  8038ad:	c7 05 bd e7 c0 ff 01 	mov    DWORD PTR [rip+0xffffffffffc0e7bd],0x1        # 412074 <pidd>
  8038b4:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  8038b7:	b8 00 00 00 00       	mov    eax,0x0
  8038bc:	e8 38 00 00 00       	call   8038f9 <create_proc>
  8038c1:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  8038c4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8038c7:	48 98                	cdqe   
  8038c9:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8038d0:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8038d6:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  8038dc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8038df:	83 c0 03             	add    eax,0x3
  8038e2:	c1 e0 04             	shl    eax,0x4
  8038e5:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  8038e8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8038eb:	01 c0                	add    eax,eax
  8038ed:	83 c0 05             	add    eax,0x5
  8038f0:	c1 e0 03             	shl    eax,0x3
  8038f3:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
}
  8038f6:	90                   	nop
  8038f7:	c9                   	leave  
  8038f8:	c3                   	ret    

00000000008038f9 <create_proc>:

int create_proc()
{
  8038f9:	f3 0f 1e fa          	endbr64 
  8038fd:	55                   	push   rbp
  8038fe:	48 89 e5             	mov    rbp,rsp
  803901:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  803905:	b8 00 00 00 00       	mov    eax,0x0
  80390a:	e8 7d 00 00 00       	call   80398c <req_proc>
  80390f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  803912:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  803916:	75 07                	jne    80391f <create_proc+0x26>
  803918:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80391d:	eb 6b                	jmp    80398a <create_proc+0x91>
    int curesp=0x9fc00-1;
  80391f:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%esp,%0":"=m"(curesp));
  803926:	89 65 f8             	mov    DWORD PTR [rbp-0x8],esp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0,0,0,0,0x17,0xf,0x17,0x17,0x17,0x17,curesp,0,0,0,0,index);
  803929:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80392c:	48 98                	cdqe   
  80392e:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  803931:	52                   	push   rdx
  803932:	6a 00                	push   0x0
  803934:	6a 00                	push   0x0
  803936:	6a 00                	push   0x0
  803938:	6a 00                	push   0x0
  80393a:	50                   	push   rax
  80393b:	6a 17                	push   0x17
  80393d:	6a 17                	push   0x17
  80393f:	6a 17                	push   0x17
  803941:	6a 17                	push   0x17
  803943:	41 b9 0f 00 00 00    	mov    r9d,0xf
  803949:	41 b8 17 00 00 00    	mov    r8d,0x17
  80394f:	b9 00 00 00 00       	mov    ecx,0x0
  803954:	ba 00 00 00 00       	mov    edx,0x0
  803959:	be 00 00 00 00       	mov    esi,0x0
  80395e:	bf 00 00 00 00       	mov    edi,0x0
  803963:	e8 f0 00 00 00       	call   803a58 <set_proc>
  803968:	48 83 c4 50          	add    rsp,0x50
    task[index].tss.eip=(long)proc_zero;
  80396c:	ba dc 3c 80 00       	mov    edx,0x803cdc
  803971:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803974:	48 98                	cdqe   
  803976:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80397d:	48 05 70 86 40 00    	add    rax,0x408670
  803983:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx

    return index;
  803987:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80398a:	c9                   	leave  
  80398b:	c3                   	ret    

000000000080398c <req_proc>:
int req_proc(){
  80398c:	f3 0f 1e fa          	endbr64 
  803990:	55                   	push   rbp
  803991:	48 89 e5             	mov    rbp,rsp
    int num=0;
  803994:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  80399b:	eb 04                	jmp    8039a1 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  80399d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  8039a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039a4:	48 98                	cdqe   
  8039a6:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8039ad:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8039b3:	8b 00                	mov    eax,DWORD PTR [rax]
  8039b5:	83 f8 ff             	cmp    eax,0xffffffff
  8039b8:	74 1f                	je     8039d9 <req_proc+0x4d>
  8039ba:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039bd:	48 98                	cdqe   
  8039bf:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8039c6:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8039cc:	8b 00                	mov    eax,DWORD PTR [rax]
  8039ce:	83 f8 03             	cmp    eax,0x3
  8039d1:	74 06                	je     8039d9 <req_proc+0x4d>
  8039d3:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8039d7:	7e c4                	jle    80399d <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  8039d9:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8039dd:	7e 07                	jle    8039e6 <req_proc+0x5a>
        return -1;
  8039df:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8039e4:	eb 70                	jmp    803a56 <req_proc+0xca>
    task[num].pid=pidd++;
  8039e6:	8b 05 88 e6 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e688]        # 412074 <pidd>
  8039ec:	8d 50 01             	lea    edx,[rax+0x1]
  8039ef:	89 15 7f e6 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e67f],edx        # 412074 <pidd>
  8039f5:	89 c2                	mov    edx,eax
  8039f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039fa:	48 98                	cdqe   
  8039fc:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803a03:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803a09:	89 10                	mov    DWORD PTR [rax],edx
    task[num].stat=ENDED;
  803a0b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a0e:	48 98                	cdqe   
  803a10:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803a17:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803a1d:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  803a23:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a26:	48 98                	cdqe   
  803a28:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803a2f:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803a35:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803a3b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a3e:	48 98                	cdqe   
  803a40:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803a47:	48 05 ac 84 40 00    	add    rax,0x4084ac
  803a4d:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  803a53:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803a56:	5d                   	pop    rbp
  803a57:	c3                   	ret    

0000000000803a58 <set_proc>:
void set_proc(long eax,long ebx,long ecx,long edx,long es,long cs,long ss,long ds,long fs,long gs\
,long esp,long ebp,long esi,long edi,long eflags,int proc_nr){
  803a58:	f3 0f 1e fa          	endbr64 
  803a5c:	55                   	push   rbp
  803a5d:	48 89 e5             	mov    rbp,rsp
  803a60:	48 83 ec 40          	sub    rsp,0x40
  803a64:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803a68:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803a6c:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803a70:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803a74:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  803a78:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803a7c:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803a7f:	48 98                	cdqe   
  803a81:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803a88:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803a8e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->tss.eax=eax;
  803a92:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a96:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803a9a:	48 89 90 ec 01 00 00 	mov    QWORD PTR [rax+0x1ec],rdx
    proc->tss.ebx=ebx;
  803aa1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803aa5:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  803aa9:	48 89 90 04 02 00 00 	mov    QWORD PTR [rax+0x204],rdx
    proc->tss.ecx=ecx;
  803ab0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ab4:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803ab8:	48 89 90 f4 01 00 00 	mov    QWORD PTR [rax+0x1f4],rdx
    proc->tss.edx=edx;
  803abf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ac3:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  803ac7:	48 89 90 fc 01 00 00 	mov    QWORD PTR [rax+0x1fc],rdx
    proc->tss.es=es;
  803ace:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ad2:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803ad6:	48 89 90 2c 02 00 00 	mov    QWORD PTR [rax+0x22c],rdx
    proc->tss.cs=cs;
  803add:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ae1:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803ae5:	48 89 90 34 02 00 00 	mov    QWORD PTR [rax+0x234],rdx
    proc->tss.ss=ss;
  803aec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803af0:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803af4:	48 89 90 3c 02 00 00 	mov    QWORD PTR [rax+0x23c],rdx
    proc->tss.ss0=ss;
  803afb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803aff:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803b03:	48 89 90 ac 01 00 00 	mov    QWORD PTR [rax+0x1ac],rdx
    proc->tss.ss1=ss;
  803b0a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b0e:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803b12:	48 89 90 bc 01 00 00 	mov    QWORD PTR [rax+0x1bc],rdx
    proc->tss.ss2=ss;
  803b19:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b1d:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803b21:	48 89 90 cc 01 00 00 	mov    QWORD PTR [rax+0x1cc],rdx
    proc->tss.ds=ds;
  803b28:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b2c:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803b30:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    proc->tss.fs=fs;
  803b37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b3b:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803b3f:	48 89 90 4c 02 00 00 	mov    QWORD PTR [rax+0x24c],rdx
    proc->tss.gs=gs;
  803b46:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b4a:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803b4e:	48 89 90 54 02 00 00 	mov    QWORD PTR [rax+0x254],rdx
    proc->tss.esp=esp;
  803b55:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b59:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803b5d:	48 89 90 0c 02 00 00 	mov    QWORD PTR [rax+0x20c],rdx
    proc->tss.esp0=esp;
  803b64:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b68:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803b6c:	48 89 90 a4 01 00 00 	mov    QWORD PTR [rax+0x1a4],rdx
    proc->tss.esp1=esp;
  803b73:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b77:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803b7b:	48 89 90 b4 01 00 00 	mov    QWORD PTR [rax+0x1b4],rdx
    proc->tss.esp2=esp;
  803b82:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b86:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803b8a:	48 89 90 c4 01 00 00 	mov    QWORD PTR [rax+0x1c4],rdx
    proc->tss.ebp=ebp;
  803b91:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b95:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803b99:	48 89 90 14 02 00 00 	mov    QWORD PTR [rax+0x214],rdx
    proc->tss.esi=esi;
  803ba0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ba4:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803ba8:	48 89 90 1c 02 00 00 	mov    QWORD PTR [rax+0x21c],rdx
    proc->tss.edi=edi;
  803baf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bb3:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803bb7:	48 89 90 24 02 00 00 	mov    QWORD PTR [rax+0x224],rdx
    proc->tss.eflags=0x202;//设置为默认值:0b 0010 0000 0010
  803bbe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bc2:	48 c7 80 e4 01 00 00 	mov    QWORD PTR [rax+0x1e4],0x202
  803bc9:	02 02 00 00 
    //能接受中断
    proc->tss.eip=(long)proc_zero;
  803bcd:	ba dc 3c 80 00       	mov    edx,0x803cdc
  803bd2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bd6:	48 89 90 dc 01 00 00 	mov    QWORD PTR [rax+0x1dc],rdx

    proc->tss.cs=cs;
  803bdd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803be1:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803be5:	48 89 90 34 02 00 00 	mov    QWORD PTR [rax+0x234],rdx
    proc->tss.ds=ds;
  803bec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bf0:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803bf4:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    proc->tss.es=es;
  803bfb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bff:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803c03:	48 89 90 2c 02 00 00 	mov    QWORD PTR [rax+0x22c],rdx
    proc->tss.cr3=PAGE_INDEX_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803c0a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c0e:	48 c7 80 d4 01 00 00 	mov    QWORD PTR [rax+0x1d4],0x1000
  803c15:	00 10 00 00 

    proc->tss.ldt= _LDT_IND(proc_nr)*8;
  803c19:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803c1c:	83 c0 03             	add    eax,0x3
  803c1f:	c1 e0 04             	shl    eax,0x4
  803c22:	48 63 d0             	movsxd rdx,eax
  803c25:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c29:	48 89 90 5c 02 00 00 	mov    QWORD PTR [rax+0x25c],rdx
    //在gdt中添加tss
    fill_desc(&proc->tss,0xffff,SEG_SYS_TSS|SEG_PRESENT,_TSS_IND(proc_nr));
  803c30:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803c33:	01 c0                	add    eax,eax
  803c35:	83 c0 05             	add    eax,0x5
  803c38:	89 c2                	mov    edx,eax
  803c3a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c3e:	48 05 9c 01 00 00    	add    rax,0x19c
  803c44:	89 d1                	mov    ecx,edx
  803c46:	ba 89 00 00 00       	mov    edx,0x89
  803c4b:	be ff ff 00 00       	mov    esi,0xffff
  803c50:	89 c7                	mov    edi,eax
  803c52:	e8 db 0d 00 00       	call   804a32 <fill_desc>
    //添加ldt
    fill_desc(proc->ldt, sizeof(proc->ldt),SEG_SYS_LDT|SEG_PRESENT, _LDT_IND(proc_nr));
  803c57:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803c5a:	83 c0 03             	add    eax,0x3
  803c5d:	01 c0                	add    eax,eax
  803c5f:	89 c2                	mov    edx,eax
  803c61:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c65:	48 83 c0 34          	add    rax,0x34
  803c69:	89 d1                	mov    ecx,edx
  803c6b:	ba 82 00 00 00       	mov    edx,0x82
  803c70:	be 28 00 00 00       	mov    esi,0x28
  803c75:	89 c7                	mov    edi,eax
  803c77:	e8 b6 0d 00 00       	call   804a32 <fill_desc>
    //设置ldt
    fill_ldt_desc(0,0xffffffff,\
  803c7c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c80:	48 83 c0 34          	add    rax,0x34
  803c84:	48 89 c1             	mov    rcx,rax
  803c87:	ba fe cf 00 00       	mov    edx,0xcffe
  803c8c:	be ff ff ff ff       	mov    esi,0xffffffff
  803c91:	bf 00 00 00 00       	mov    edi,0x0
  803c96:	e8 be 0e 00 00       	call   804b59 <fill_ldt_desc>
    SEG_CONFORMING_RW_CODE|SEG_DPL_3,&proc->ldt[0]);
    fill_ldt_desc(0,0xffffffff,\
  803c9b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c9f:	48 83 c0 3c          	add    rax,0x3c
  803ca3:	48 89 c1             	mov    rcx,rax
  803ca6:	ba f2 cf 00 00       	mov    edx,0xcff2
  803cab:	be ff ff ff ff       	mov    esi,0xffffffff
  803cb0:	bf 00 00 00 00       	mov    edi,0x0
  803cb5:	e8 9f 0e 00 00       	call   804b59 <fill_ldt_desc>
    SEG_RW_DATA|SEG_DPL_3,&proc->ldt[1]);
    fill_ldt_desc(0x1c00000-0x1000,0x1000,\
  803cba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803cbe:	48 83 c0 44          	add    rax,0x44
  803cc2:	48 89 c1             	mov    rcx,rax
  803cc5:	ba f6 00 00 00       	mov    edx,0xf6
  803cca:	be 00 10 00 00       	mov    esi,0x1000
  803ccf:	bf 00 f0 bf 01       	mov    edi,0x1bff000
  803cd4:	e8 80 0e 00 00       	call   804b59 <fill_ldt_desc>
    SEG_STACK|SEG_DPL_3,&proc->ldt[2]);

}
  803cd9:	90                   	nop
  803cda:	c9                   	leave  
  803cdb:	c3                   	ret    

0000000000803cdc <proc_zero>:
void proc_zero()
{
  803cdc:	f3 0f 1e fa          	endbr64 
  803ce0:	55                   	push   rbp
  803ce1:	48 89 e5             	mov    rbp,rsp

    while(1);
  803ce4:	eb fe                	jmp    803ce4 <proc_zero+0x8>

0000000000803ce6 <manage_proc>:
}
void manage_proc(){
  803ce6:	f3 0f 1e fa          	endbr64 
  803cea:	55                   	push   rbp
  803ceb:	48 89 e5             	mov    rbp,rsp
  803cee:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803cf2:	8b 05 78 e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e378]        # 412070 <cur_proc>
  803cf8:	83 f8 ff             	cmp    eax,0xffffffff
  803cfb:	74 2d                	je     803d2a <manage_proc+0x44>
        task[cur_proc].utime++;
  803cfd:	8b 05 6d e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e36d]        # 412070 <cur_proc>
  803d03:	48 63 d0             	movsxd rdx,eax
  803d06:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  803d0d:	48 81 c2 a8 84 40 00 	add    rdx,0x4084a8
  803d14:	8b 12                	mov    edx,DWORD PTR [rdx]
  803d16:	83 c2 01             	add    edx,0x1
  803d19:	48 98                	cdqe   
  803d1b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803d22:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803d28:	89 10                	mov    DWORD PTR [rax],edx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803d2a:	8b 05 40 e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e340]        # 412070 <cur_proc>
  803d30:	83 f8 ff             	cmp    eax,0xffffffff
  803d33:	74 3c                	je     803d71 <manage_proc+0x8b>
  803d35:	8b 05 35 e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e335]        # 412070 <cur_proc>
  803d3b:	48 98                	cdqe   
  803d3d:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803d44:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803d4a:	8b 00                	mov    eax,DWORD PTR [rax]
  803d4c:	83 f8 01             	cmp    eax,0x1
  803d4f:	77 20                	ja     803d71 <manage_proc+0x8b>
    task[cur_proc].stat!=READY){
  803d51:	8b 05 19 e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e319]        # 412070 <cur_proc>
  803d57:	48 98                	cdqe   
  803d59:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803d60:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803d66:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803d68:	83 f8 01             	cmp    eax,0x1
  803d6b:	0f 84 90 00 00 00    	je     803e01 <manage_proc+0x11b>
        if(cur_proc!=-1)
  803d71:	8b 05 f9 e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e2f9]        # 412070 <cur_proc>
  803d77:	83 f8 ff             	cmp    eax,0xffffffff
  803d7a:	74 1b                	je     803d97 <manage_proc+0xb1>
            task[cur_proc].utime=0;
  803d7c:	8b 05 ee e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e2ee]        # 412070 <cur_proc>
  803d82:	48 98                	cdqe   
  803d84:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803d8b:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803d91:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=0;
  803d97:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  803d9e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803da5:	eb 41                	jmp    803de8 <manage_proc+0x102>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803da7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803daa:	48 98                	cdqe   
  803dac:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803db3:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803db9:	8b 00                	mov    eax,DWORD PTR [rax]
  803dbb:	83 f8 ff             	cmp    eax,0xffffffff
  803dbe:	74 24                	je     803de4 <manage_proc+0xfe>
  803dc0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803dc3:	48 98                	cdqe   
  803dc5:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803dcc:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803dd2:	8b 00                	mov    eax,DWORD PTR [rax]
  803dd4:	83 f8 01             	cmp    eax,0x1
  803dd7:	75 0b                	jne    803de4 <manage_proc+0xfe>
  803dd9:	8b 05 91 e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e291]        # 412070 <cur_proc>
  803ddf:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  803de2:	75 0c                	jne    803df0 <manage_proc+0x10a>
        for(i=0;i<MAX_PROC_COUNT;i++){
  803de4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803de8:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803dec:	7e b9                	jle    803da7 <manage_proc+0xc1>
  803dee:	eb 01                	jmp    803df1 <manage_proc+0x10b>
                break;
  803df0:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  803df1:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803df5:	7f 0d                	jg     803e04 <manage_proc+0x11e>
            return;
        //switch
        switch_proc_tss(i);
  803df7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803dfa:	89 c7                	mov    edi,eax
  803dfc:	e8 06 00 00 00       	call   803e07 <switch_proc_tss>
    }
    return;
  803e01:	90                   	nop
  803e02:	eb 01                	jmp    803e05 <manage_proc+0x11f>
            return;
  803e04:	90                   	nop
}
  803e05:	c9                   	leave  
  803e06:	c3                   	ret    

0000000000803e07 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  803e07:	f3 0f 1e fa          	endbr64 
  803e0b:	55                   	push   rbp
  803e0c:	48 89 e5             	mov    rbp,rsp
  803e0f:	48 83 ec 20          	sub    rsp,0x20
  803e13:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  803e16:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803e19:	01 c0                	add    eax,eax
  803e1b:	83 c0 05             	add    eax,0x5
  803e1e:	c1 e0 03             	shl    eax,0x3
  803e21:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  803e24:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803e27:	89 05 43 e2 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e243],eax        # 412070 <cur_proc>
    switch_proc_asm(sel);
  803e2d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803e30:	89 c7                	mov    edi,eax
  803e32:	e8 c3 5f 00 00       	call   809dfa <switch_proc_asm>
}
  803e37:	90                   	nop
  803e38:	c9                   	leave  
  803e39:	c3                   	ret    

0000000000803e3a <switch_proc>:
void switch_proc(int pnr){
  803e3a:	f3 0f 1e fa          	endbr64 
  803e3e:	55                   	push   rbp
  803e3f:	48 89 e5             	mov    rbp,rsp
  803e42:	48 81 ec 80 02 00 00 	sub    rsp,0x280
  803e49:	89 bd 8c fd ff ff    	mov    DWORD PTR [rbp-0x274],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  803e4f:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803e55:	48 98                	cdqe   
  803e57:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803e5e:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803e65:	48 8d 85 90 fd ff ff 	lea    rax,[rbp-0x270]
  803e6c:	b9 4d 00 00 00       	mov    ecx,0x4d
  803e71:	48 89 c7             	mov    rdi,rax
  803e74:	48 89 d6             	mov    rsi,rdx
  803e77:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
  803e7a:	48 89 f2             	mov    rdx,rsi
  803e7d:	48 89 f8             	mov    rax,rdi
  803e80:	8b 0a                	mov    ecx,DWORD PTR [rdx]
  803e82:	89 08                	mov    DWORD PTR [rax],ecx
    save_context(&task[cur_proc].tss);
  803e84:	8b 05 e6 e1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e1e6]        # 412070 <cur_proc>
  803e8a:	48 98                	cdqe   
  803e8c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803e93:	48 05 90 01 00 00    	add    rax,0x190
  803e99:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803e9f:	48 83 c0 0c          	add    rax,0xc
  803ea3:	48 89 c7             	mov    rdi,rax
  803ea6:	e8 69 00 00 00       	call   803f14 <save_context>
    //重新设置0号进程
    task[0].tss.eip=proc_zero;
  803eab:	b8 dc 3c 80 00       	mov    eax,0x803cdc
  803eb0:	48 89 05 c5 47 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc047c5],rax        # 40867c <task+0x1dc>
    task[0].tss.cr3=PAGE_INDEX_ADDR;
  803eb7:	48 c7 05 b2 47 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc047b2],0x1000        # 408674 <task+0x1d4>
  803ebe:	00 10 00 00 
    task[0].tss.eflags=0x202;
  803ec2:	48 c7 05 b7 47 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc047b7],0x202        # 408684 <task+0x1e4>
  803ec9:	02 02 00 00 
    cur_proc=pnr;
  803ecd:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803ed3:	89 05 97 e1 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e197],eax        # 412070 <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  803ed9:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803edf:	01 c0                	add    eax,eax
  803ee1:	83 c0 05             	add    eax,0x5
  803ee4:	c1 e0 03             	shl    eax,0x3
  803ee7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(&task[pnr].tss);
  803eea:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803ef0:	48 98                	cdqe   
  803ef2:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803ef9:	48 05 90 01 00 00    	add    rax,0x190
  803eff:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803f05:	48 83 c0 0c          	add    rax,0xc
  803f09:	48 89 c7             	mov    rdi,rax
  803f0c:	e8 0a 5f 00 00       	call   809e1b <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  803f11:	90                   	nop
  803f12:	c9                   	leave  
  803f13:	c3                   	ret    

0000000000803f14 <save_context>:
void save_context(TSS *tss)
{
  803f14:	f3 0f 1e fa          	endbr64 
  803f18:	55                   	push   rbp
  803f19:	48 89 e5             	mov    rbp,rsp
  803f1c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    tss->eip=scene_saver.eip;
  803f20:	48 8b 15 b9 e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e0b9]        # 411fe0 <scene_saver+0x40>
  803f27:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f2b:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    tss->eax=scene_saver.eax;
  803f2f:	48 8b 15 ba e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e0ba]        # 411ff0 <scene_saver+0x50>
  803f36:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f3a:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    tss->ebx=scene_saver.ebx;
  803f3e:	48 8b 15 c3 e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e0c3]        # 412008 <scene_saver+0x68>
  803f45:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f49:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    tss->ecx=scene_saver.ecx;
  803f4d:	48 8b 15 a4 e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e0a4]        # 411ff8 <scene_saver+0x58>
  803f54:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f58:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
    tss->edx=scene_saver.edx;
  803f5c:	48 8b 15 9d e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e09d]        # 412000 <scene_saver+0x60>
  803f63:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f67:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    tss->esi=scene_saver.esi;
  803f6b:	48 8b 15 ae e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e0ae]        # 412020 <scene_saver+0x80>
  803f72:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f76:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    tss->edi=scene_saver.edi;
  803f7d:	48 8b 15 a4 e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e0a4]        # 412028 <scene_saver+0x88>
  803f84:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f88:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
    tss->eflags=scene_saver.eflags;
  803f8f:	48 8b 15 52 e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e052]        # 411fe8 <scene_saver+0x48>
  803f96:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f9a:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    tss->esp=scene_saver.esp;
  803f9e:	48 8b 15 6b e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e06b]        # 412010 <scene_saver+0x70>
  803fa5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803fa9:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    tss->ebp=scene_saver.ebp;
  803fad:	48 8b 15 64 e0 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e064]        # 412018 <scene_saver+0x78>
  803fb4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803fb8:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
}
  803fbc:	90                   	nop
  803fbd:	5d                   	pop    rbp
  803fbe:	c3                   	ret    

0000000000803fbf <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  803fbf:	f3 0f 1e fa          	endbr64 
  803fc3:	55                   	push   rbp
  803fc4:	48 89 e5             	mov    rbp,rsp
  803fc7:	48 83 ec 60          	sub    rsp,0x60
  803fcb:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  803fce:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  803fd1:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803fd4:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  803fda:	85 c0                	test   eax,eax
  803fdc:	0f 48 c2             	cmovs  eax,edx
  803fdf:	c1 f8 0c             	sar    eax,0xc
  803fe2:	89 c1                	mov    ecx,eax
  803fe4:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803fe7:	99                   	cdq    
  803fe8:	c1 ea 14             	shr    edx,0x14
  803feb:	01 d0                	add    eax,edx
  803fed:	25 ff 0f 00 00       	and    eax,0xfff
  803ff2:	29 d0                	sub    eax,edx
  803ff4:	01 c8                	add    eax,ecx
  803ff6:	85 c0                	test   eax,eax
  803ff8:	0f 95 c0             	setne  al
  803ffb:	0f b6 c0             	movzx  eax,al
  803ffe:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  804001:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  804008:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80400f:	00 
    page_item *pgind=task[proc_index].tss.cr3;
  804010:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804013:	48 98                	cdqe   
  804015:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80401c:	48 05 60 86 40 00    	add    rax,0x408660
  804022:	48 8b 40 14          	mov    rax,QWORD PTR [rax+0x14]
  804026:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    pgind++;
  80402a:	48 83 45 e8 08       	add    QWORD PTR [rbp-0x18],0x8
    for(int i=1;i<1024;i++)
  80402f:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x1
  804036:	e9 39 02 00 00       	jmp    804274 <palloc+0x2b5>
    {
        page_item* tblp=*pgind&0xfffff000;
  80403b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80403f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804042:	25 00 f0 ff ff       	and    eax,0xfffff000
  804047:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        for(int j=0;j<1024;j++)
  80404b:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
  804052:	e9 07 02 00 00       	jmp    80425e <palloc+0x29f>
        {
            int v=*tblp&PAGE_PRESENT;
  804057:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80405b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80405e:	83 e0 01             	and    eax,0x1
  804061:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
            if(!v)
  804064:	83 7d d0 00          	cmp    DWORD PTR [rbp-0x30],0x0
  804068:	0f 85 e7 01 00 00    	jne    804255 <palloc+0x296>
            {
                int new_pg=req_a_page();
  80406e:	b8 00 00 00 00       	mov    eax,0x0
  804073:	e8 65 d2 ff ff       	call   8012dd <req_a_page>
  804078:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
                if(new_pg==-1)
  80407b:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  80407f:	0f 85 b9 00 00 00    	jne    80413e <palloc+0x17f>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804085:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804088:	48 98                	cdqe   
  80408a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804091:	48 05 e4 84 40 00    	add    rax,0x4084e4
  804097:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80409a:	0f b7 c0             	movzx  eax,ax
  80409d:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  8040a0:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8040a3:	48 98                	cdqe   
  8040a5:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8040ac:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8040b2:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8040b6:	0f b7 c0             	movzx  eax,ax
  8040b9:	c1 e0 10             	shl    eax,0x10
  8040bc:	25 00 00 0f 00       	and    eax,0xf0000
  8040c1:	01 45 b8             	add    DWORD PTR [rbp-0x48],eax
                    size+=c;
  8040c4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8040c7:	01 45 b8             	add    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  8040ca:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8040cd:	89 c2                	mov    edx,eax
  8040cf:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8040d2:	48 98                	cdqe   
  8040d4:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8040db:	48 05 e4 84 40 00    	add    rax,0x4084e4
  8040e1:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  8040e4:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8040e7:	48 98                	cdqe   
  8040e9:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8040f0:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8040f6:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8040fa:	0f b7 c0             	movzx  eax,ax
  8040fd:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    tmp_attr&=0xfff0;
  804100:	81 65 b4 f0 ff 00 00 	and    DWORD PTR [rbp-0x4c],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804107:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  80410a:	c1 e8 10             	shr    eax,0x10
  80410d:	83 e0 0f             	and    eax,0xf
  804110:	89 c2                	mov    edx,eax
  804112:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  804115:	01 d0                	add    eax,edx
  804117:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  80411a:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80411d:	89 c2                	mov    edx,eax
  80411f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804122:	48 98                	cdqe   
  804124:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80412b:	48 05 e0 84 40 00    	add    rax,0x4084e0
  804131:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  804135:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804139:	e9 48 01 00 00       	jmp    804286 <palloc+0x2c7>
                }
                int addr=get_phyaddr(new_pg);
  80413e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804141:	89 c7                	mov    edi,eax
  804143:	e8 02 d3 ff ff       	call   80144a <get_phyaddr>
  804148:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  80414b:	8b 4d c8             	mov    ecx,DWORD PTR [rbp-0x38]
  80414e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804152:	ba 07 00 00 00       	mov    edx,0x7
  804157:	89 ce                	mov    esi,ecx
  804159:	48 89 c7             	mov    rdi,rax
  80415c:	e8 fc d2 ff ff       	call   80145d <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  804161:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  804164:	c1 e0 0a             	shl    eax,0xa
  804167:	89 c2                	mov    edx,eax
  804169:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80416c:	01 d0                	add    eax,edx
  80416e:	c1 e0 0c             	shl    eax,0xc
  804171:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                if(ptr==NULL)
  804174:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  804179:	75 12                	jne    80418d <palloc+0x1ce>
                {
                    ptr=laddr;
  80417b:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80417e:	48 98                	cdqe   
  804180:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
                    palloc_paddr=addr;
  804184:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  804187:	89 05 eb de c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0deeb],eax        # 412078 <palloc_paddr>
                }
                page_c--;
  80418d:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  804191:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  804195:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  804199:	0f 85 b6 00 00 00    	jne    804255 <palloc+0x296>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  80419f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8041a2:	48 98                	cdqe   
  8041a4:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8041ab:	48 05 e4 84 40 00    	add    rax,0x4084e4
  8041b1:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8041b4:	0f b7 c0             	movzx  eax,ax
  8041b7:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  8041ba:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8041bd:	48 98                	cdqe   
  8041bf:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8041c6:	48 05 e0 84 40 00    	add    rax,0x4084e0
  8041cc:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8041d0:	0f b7 c0             	movzx  eax,ax
  8041d3:	c1 e0 10             	shl    eax,0x10
  8041d6:	25 00 00 0f 00       	and    eax,0xf0000
  8041db:	01 45 c0             	add    DWORD PTR [rbp-0x40],eax
                    size+=c;
  8041de:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8041e1:	01 45 c0             	add    DWORD PTR [rbp-0x40],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  8041e4:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  8041e7:	89 c2                	mov    edx,eax
  8041e9:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8041ec:	48 98                	cdqe   
  8041ee:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8041f5:	48 05 e4 84 40 00    	add    rax,0x4084e4
  8041fb:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  8041fe:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804201:	48 98                	cdqe   
  804203:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80420a:	48 05 e0 84 40 00    	add    rax,0x4084e0
  804210:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804214:	0f b7 c0             	movzx  eax,ax
  804217:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    tmp_attr&=0xfff0;
  80421a:	81 65 bc f0 ff 00 00 	and    DWORD PTR [rbp-0x44],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804221:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  804224:	c1 e8 10             	shr    eax,0x10
  804227:	83 e0 0f             	and    eax,0xf
  80422a:	89 c2                	mov    edx,eax
  80422c:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80422f:	01 d0                	add    eax,edx
  804231:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  804234:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804237:	89 c2                	mov    edx,eax
  804239:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80423c:	48 98                	cdqe   
  80423e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804245:	48 05 e0 84 40 00    	add    rax,0x4084e0
  80424b:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
                    return ptr;
  80424f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804253:	eb 31                	jmp    804286 <palloc+0x2c7>
                }
            }
            tblp++;
  804255:	48 83 45 d8 08       	add    QWORD PTR [rbp-0x28],0x8
        for(int j=0;j<1024;j++)
  80425a:	83 45 d4 01          	add    DWORD PTR [rbp-0x2c],0x1
  80425e:	81 7d d4 ff 03 00 00 	cmp    DWORD PTR [rbp-0x2c],0x3ff
  804265:	0f 8e ec fd ff ff    	jle    804057 <palloc+0x98>
        }
        pgind++;
  80426b:	48 83 45 e8 08       	add    QWORD PTR [rbp-0x18],0x8
    for(int i=1;i<1024;i++)
  804270:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
  804274:	81 7d e4 ff 03 00 00 	cmp    DWORD PTR [rbp-0x1c],0x3ff
  80427b:	0f 8e ba fd ff ff    	jle    80403b <palloc+0x7c>
    }
    return NULL;
  804281:	b8 00 00 00 00       	mov    eax,0x0
}
  804286:	c9                   	leave  
  804287:	c3                   	ret    

0000000000804288 <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  804288:	f3 0f 1e fa          	endbr64 
  80428c:	55                   	push   rbp
  80428d:	48 89 e5             	mov    rbp,rsp
  804290:	48 83 ec 10          	sub    rsp,0x10
  804294:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  804297:	8b 05 d3 dd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ddd3]        # 412070 <cur_proc>
  80429d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8042a0:	89 d6                	mov    esi,edx
  8042a2:	89 c7                	mov    edi,eax
  8042a4:	e8 16 fd ff ff       	call   803fbf <palloc>
}
  8042a9:	c9                   	leave  
  8042aa:	c3                   	ret    

00000000008042ab <proc_end>:
void proc_end()
{
  8042ab:	f3 0f 1e fa          	endbr64 
  8042af:	55                   	push   rbp
  8042b0:	48 89 e5             	mov    rbp,rsp
  8042b3:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  8042b7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
  8042ba:	48 8b 05 eb 43 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc043eb]        # 4086ac <task+0x20c>
  8042c1:	48 89 c4             	mov    rsp,rax
    del_proc(cur_proc);
  8042c4:	8b 05 a6 dd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dda6]        # 412070 <cur_proc>
  8042ca:	89 c7                	mov    edi,eax
  8042cc:	e8 75 00 00 00       	call   804346 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  8042d1:	8b 05 99 dd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dd99]        # 412070 <cur_proc>
  8042d7:	48 98                	cdqe   
  8042d9:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8042e0:	48 05 00 85 40 00    	add    rax,0x408500
  8042e6:	8b 00                	mov    eax,DWORD PTR [rax]
  8042e8:	83 f8 ff             	cmp    eax,0xffffffff
  8042eb:	74 4c                	je     804339 <proc_end+0x8e>
        task[task[cur_proc].parent_pid].stat=READY;
  8042ed:	8b 05 7d dd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dd7d]        # 412070 <cur_proc>
  8042f3:	48 98                	cdqe   
  8042f5:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8042fc:	48 05 00 85 40 00    	add    rax,0x408500
  804302:	8b 00                	mov    eax,DWORD PTR [rax]
  804304:	89 c0                	mov    eax,eax
  804306:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80430d:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804313:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  804319:	8b 05 51 dd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dd51]        # 412070 <cur_proc>
  80431f:	48 98                	cdqe   
  804321:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804328:	48 05 00 85 40 00    	add    rax,0x408500
  80432e:	8b 00                	mov    eax,DWORD PTR [rax]
  804330:	89 c7                	mov    edi,eax
  804332:	e8 d0 fa ff ff       	call   803e07 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  804337:	eb 0a                	jmp    804343 <proc_end+0x98>
        switch_proc_tss(0);
  804339:	bf 00 00 00 00       	mov    edi,0x0
  80433e:	e8 c4 fa ff ff       	call   803e07 <switch_proc_tss>
}
  804343:	90                   	nop
  804344:	c9                   	leave  
  804345:	c3                   	ret    

0000000000804346 <del_proc>:
void del_proc(int pnr)
{
  804346:	f3 0f 1e fa          	endbr64 
  80434a:	55                   	push   rbp
  80434b:	48 89 e5             	mov    rbp,rsp
  80434e:	48 83 ec 30          	sub    rsp,0x30
  804352:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  804355:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804358:	48 98                	cdqe   
  80435a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804361:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804367:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  80436d:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804370:	48 98                	cdqe   
  804372:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804379:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80437f:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p=task[pnr].tss.cr3;
  804385:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804388:	48 98                	cdqe   
  80438a:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804391:	48 05 60 86 40 00    	add    rax,0x408660
  804397:	48 8b 40 14          	mov    rax,QWORD PTR [rax+0x14]
  80439b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    p++;
  80439f:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  8043a4:	eb 63                	jmp    804409 <del_proc+0xc3>
    {
        page_item *tp=*p&0xfffff000;
  8043a6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043aa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8043ad:	25 00 f0 ff ff       	and    eax,0xfffff000
  8043b2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  8043b6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8043bd:	eb 30                	jmp    8043ef <del_proc+0xa9>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  8043bf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8043c3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8043c6:	83 e0 01             	and    eax,0x1
  8043c9:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  8043cc:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  8043d0:	74 14                	je     8043e6 <del_proc+0xa0>
            {
                free_page(*tp&0xfffff000);
  8043d2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8043d6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8043d9:	25 00 f0 ff ff       	and    eax,0xfffff000
  8043de:	48 89 c7             	mov    rdi,rax
  8043e1:	e8 a3 cf ff ff       	call   801389 <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  8043e6:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  8043eb:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8043ef:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  8043f6:	7e c7                	jle    8043bf <del_proc+0x79>
        }
        vmfree(tp);
  8043f8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8043fc:	48 89 c7             	mov    rdi,rax
  8043ff:	e8 15 cd ff ff       	call   801119 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804404:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  804409:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80440d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804410:	83 e0 01             	and    eax,0x1
  804413:	48 85 c0             	test   rax,rax
  804416:	75 8e                	jne    8043a6 <del_proc+0x60>
    }
    //释放存放页目录的页面
    vmfree(p);
  804418:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80441c:	48 89 c7             	mov    rdi,rax
  80441f:	e8 f5 cc ff ff       	call   801119 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  804424:	90                   	nop
  804425:	c9                   	leave  
  804426:	c3                   	ret    

0000000000804427 <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  804427:	f3 0f 1e fa          	endbr64 
  80442b:	55                   	push   rbp
  80442c:	48 89 e5             	mov    rbp,rsp
  80442f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804432:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  804435:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804439:	75 07                	jne    804442 <set_proc_stat+0x1b>
  80443b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804440:	eb 79                	jmp    8044bb <set_proc_stat+0x94>
    int i=0;
  804442:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  804449:	eb 04                	jmp    80444f <set_proc_stat+0x28>
  80444b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80444f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804452:	48 98                	cdqe   
  804454:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80445b:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804461:	8b 10                	mov    edx,DWORD PTR [rax]
  804463:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804466:	39 c2                	cmp    edx,eax
  804468:	75 e1                	jne    80444b <set_proc_stat+0x24>
    if(i==MAX_PROC_COUNT)return -1;
  80446a:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  80446e:	75 07                	jne    804477 <set_proc_stat+0x50>
  804470:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804475:	eb 44                	jmp    8044bb <set_proc_stat+0x94>
    task[i].stat=stat;
  804477:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80447a:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80447d:	48 63 d2             	movsxd rdx,edx
  804480:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  804487:	48 81 c2 a4 84 40 00 	add    rdx,0x4084a4
  80448e:	89 02                	mov    DWORD PTR [rdx],eax
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  804490:	8b 05 da db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dbda]        # 412070 <cur_proc>
  804496:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804499:	75 1b                	jne    8044b6 <set_proc_stat+0x8f>
        task[cur_proc].utime=MAX_UTIME;
  80449b:	8b 05 cf db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dbcf]        # 412070 <cur_proc>
  8044a1:	48 98                	cdqe   
  8044a3:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8044aa:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8044b0:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  8044b6:	b8 00 00 00 00       	mov    eax,0x0
}
  8044bb:	5d                   	pop    rbp
  8044bc:	c3                   	ret    

00000000008044bd <add_proc_openf>:

    return 0;
} */

int add_proc_openf(vfs_dir_entry *entry)
{
  8044bd:	f3 0f 1e fa          	endbr64 
  8044c1:	55                   	push   rbp
  8044c2:	48 89 e5             	mov    rbp,rsp
  8044c5:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8044c9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8044d0:	eb 69                	jmp    80453b <add_proc_openf+0x7e>
        if(task[cur_proc].openf[i]==NULL)
  8044d2:	8b 05 98 db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0db98]        # 412070 <cur_proc>
  8044d8:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8044db:	48 63 d2             	movsxd rdx,edx
  8044de:	48 83 c2 12          	add    rdx,0x12
  8044e2:	48 98                	cdqe   
  8044e4:	48 c1 e2 03          	shl    rdx,0x3
  8044e8:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8044ef:	48 01 d0             	add    rax,rdx
  8044f2:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8044f8:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8044fc:	48 85 c0             	test   rax,rax
  8044ff:	75 36                	jne    804537 <add_proc_openf+0x7a>
        {
            task[cur_proc].openf[i]=entry;
  804501:	8b 05 69 db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0db69]        # 412070 <cur_proc>
  804507:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80450a:	48 63 d2             	movsxd rdx,edx
  80450d:	48 83 c2 12          	add    rdx,0x12
  804511:	48 98                	cdqe   
  804513:	48 c1 e2 03          	shl    rdx,0x3
  804517:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80451e:	48 01 d0             	add    rax,rdx
  804521:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  804528:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80452c:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
            return 0;
  804530:	b8 00 00 00 00       	mov    eax,0x0
  804535:	eb 0f                	jmp    804546 <add_proc_openf+0x89>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804537:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80453b:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  80453f:	7e 91                	jle    8044d2 <add_proc_openf+0x15>
        }
    }
    return -1;//full
  804541:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  804546:	5d                   	pop    rbp
  804547:	c3                   	ret    

0000000000804548 <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  804548:	f3 0f 1e fa          	endbr64 
  80454c:	55                   	push   rbp
  80454d:	48 89 e5             	mov    rbp,rsp
  804550:	48 83 ec 10          	sub    rsp,0x10
  804554:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  804557:	8b 05 13 db c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0db13]        # 412070 <cur_proc>
  80455d:	89 c7                	mov    edi,eax
  80455f:	e8 e2 fd ff ff       	call   804346 <del_proc>
    return code;
  804564:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  804567:	c9                   	leave  
  804568:	c3                   	ret    

0000000000804569 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(int entry, vfs_dir_entry *cwd, vfs_dir_entry *exef)
{
  804569:	f3 0f 1e fa          	endbr64 
  80456d:	55                   	push   rbp
  80456e:	48 89 e5             	mov    rbp,rsp
  804571:	48 83 ec 40          	sub    rsp,0x40
  804575:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  804578:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80457c:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    
    int i=req_proc();
  804580:	b8 00 00 00 00       	mov    eax,0x0
  804585:	e8 02 f4 ff ff       	call   80398c <req_proc>
  80458a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(i==-1)return -1;
  80458d:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  804591:	75 0a                	jne    80459d <reg_proc+0x34>
  804593:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804598:	e9 80 01 00 00       	jmp    80471d <reg_proc+0x1b4>
    /*set_proc(0,0,0,0,SEL_LDT_DATA,SEL_LDT_CODE,SEL_LDT_STACK,SEL_LDT_DATA\
    ,SEL_LDT_DATA,SEL_LDT_DATA,0x1c00000-4,0,0,0,0,i);*/
    set_proc(0,0,0,0,0x10,0x8,0x10,0x10\
  80459d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8045a0:	50                   	push   rax
  8045a1:	6a 00                	push   0x0
  8045a3:	6a 00                	push   0x0
  8045a5:	6a 00                	push   0x0
  8045a7:	6a 00                	push   0x0
  8045a9:	68 fc ff bf 01       	push   0x1bffffc
  8045ae:	6a 10                	push   0x10
  8045b0:	6a 10                	push   0x10
  8045b2:	6a 10                	push   0x10
  8045b4:	6a 10                	push   0x10
  8045b6:	41 b9 08 00 00 00    	mov    r9d,0x8
  8045bc:	41 b8 10 00 00 00    	mov    r8d,0x10
  8045c2:	b9 00 00 00 00       	mov    ecx,0x0
  8045c7:	ba 00 00 00 00       	mov    edx,0x0
  8045cc:	be 00 00 00 00       	mov    esi,0x0
  8045d1:	bf 00 00 00 00       	mov    edi,0x0
  8045d6:	e8 7d f4 ff ff       	call   803a58 <set_proc>
  8045db:	48 83 c4 50          	add    rsp,0x50
    ,0x10,0x10,0x1c00000-4,0,0,0,0,i);
    task[i].pdet=vmalloc();
  8045df:	b8 00 00 00 00       	mov    eax,0x0
  8045e4:	e8 a1 ca ff ff       	call   80108a <vmalloc>
  8045e9:	48 89 c2             	mov    rdx,rax
  8045ec:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8045ef:	48 98                	cdqe   
  8045f1:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8045f8:	48 05 20 85 40 00    	add    rax,0x408520
  8045fe:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    int *pt=vmalloc();
  804602:	b8 00 00 00 00       	mov    eax,0x0
  804607:	e8 7e ca ff ff       	call   80108a <vmalloc>
  80460c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    task[i].pdet[0]=PAGE_TABLE_ADDR|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;
  804610:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804613:	48 98                	cdqe   
  804615:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80461c:	48 05 20 85 40 00    	add    rax,0x408520
  804622:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804626:	c7 00 07 20 00 00    	mov    DWORD PTR [rax],0x2007
    /*for(int j=0;j<32;j++)
        pt[j]=(PAGE_TABLE_ADDR+j*0x1000)|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;//复制内核页表*/
    //PAGE_TABLE_ADDR|PAGE_PRESENT;//复制内核页表
    //task[i].pdet[7]=PAGE_TABLE_ADDR+7*0x1000|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//sys.dll
    int *stackb=vmalloc();
  80462c:	b8 00 00 00 00       	mov    eax,0x0
  804631:	e8 54 ca ff ff       	call   80108a <vmalloc>
  804636:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    task[i].pdet[6]=(int)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  80463a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80463e:	83 c8 07             	or     eax,0x7
  804641:	89 c2                	mov    edx,eax
  804643:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804646:	48 98                	cdqe   
  804648:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80464f:	48 05 20 85 40 00    	add    rax,0x408520
  804655:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804659:	48 83 c0 18          	add    rax,0x18
  80465d:	89 10                	mov    DWORD PTR [rax],edx
    stackb[1023]=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  80465f:	b8 00 00 00 00       	mov    eax,0x0
  804664:	e8 74 cc ff ff       	call   8012dd <req_a_page>
  804669:	89 c7                	mov    edi,eax
  80466b:	e8 da cd ff ff       	call   80144a <get_phyaddr>
  804670:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804674:	48 81 c2 fc 0f 00 00 	add    rdx,0xffc
  80467b:	83 c8 07             	or     eax,0x7
  80467e:	89 02                	mov    DWORD PTR [rdx],eax
    task[i].tss.cr3=task[i].pdet;
  804680:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804683:	48 98                	cdqe   
  804685:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80468c:	48 05 20 85 40 00    	add    rax,0x408520
  804692:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804696:	48 89 c2             	mov    rdx,rax
  804699:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80469c:	48 98                	cdqe   
  80469e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8046a5:	48 05 60 86 40 00    	add    rax,0x408660
  8046ab:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx

    task[i].stat=READY;
  8046af:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046b2:	48 98                	cdqe   
  8046b4:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8046bb:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8046c1:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  8046c7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046ca:	48 98                	cdqe   
  8046cc:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8046d3:	48 8d 90 20 85 40 00 	lea    rdx,[rax+0x408520]
  8046da:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8046de:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    task[i].exef=exef;
  8046e2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046e5:	48 98                	cdqe   
  8046e7:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8046ee:	48 8d 90 30 85 40 00 	lea    rdx,[rax+0x408530]
  8046f5:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8046f9:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].tss.ds=0x10;
    task[i].tss.ss=0x10;
    task[i].tss.gs=0x10;
    task[i].tss.fs=0x10;
    task[i].tss.cs=0x8;*/
    task[i].tss.eip=entry;
  8046fd:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804700:	48 98                	cdqe   
  804702:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804705:	48 63 d2             	movsxd rdx,edx
  804708:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  80470f:	48 81 c2 70 86 40 00 	add    rdx,0x408670
  804716:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    return i;
  80471a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  80471d:	c9                   	leave  
  80471e:	c3                   	ret    

000000000080471f <sys_malloc>:

void * sys_malloc(int size)
{
  80471f:	f3 0f 1e fa          	endbr64 
  804723:	55                   	push   rbp
  804724:	48 89 e5             	mov    rbp,rsp
  804727:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  80472a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80472d:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804733:	85 c0                	test   eax,eax
  804735:	0f 48 c2             	cmovs  eax,edx
  804738:	c1 f8 0c             	sar    eax,0xc
  80473b:	89 c1                	mov    ecx,eax
  80473d:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804740:	99                   	cdq    
  804741:	c1 ea 14             	shr    edx,0x14
  804744:	01 d0                	add    eax,edx
  804746:	25 ff 0f 00 00       	and    eax,0xfff
  80474b:	29 d0                	sub    eax,edx
  80474d:	01 c8                	add    eax,ecx
  80474f:	85 c0                	test   eax,eax
  804751:	0f 95 c0             	setne  al
  804754:	0f b6 c0             	movzx  eax,al
  804757:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  80475a:	8b 05 10 d9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d910]        # 412070 <cur_proc>
  804760:	48 98                	cdqe   
  804762:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804769:	48 05 b4 84 40 00    	add    rax,0x4084b4
  80476f:	8b 00                	mov    eax,DWORD PTR [rax]
  804771:	48 98                	cdqe   
  804773:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804777:	eb 0c                	jmp    804785 <sys_malloc+0x66>
        hp=hp->next;
  804779:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80477d:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804781:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804785:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804789:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80478d:	48 85 c0             	test   rax,rax
  804790:	74 16                	je     8047a8 <sys_malloc+0x89>
  804792:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804796:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804799:	85 c0                	test   eax,eax
  80479b:	75 0b                	jne    8047a8 <sys_malloc+0x89>
  80479d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047a1:	8b 00                	mov    eax,DWORD PTR [rax]
  8047a3:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8047a6:	7e d1                	jle    804779 <sys_malloc+0x5a>
    if(hp->pgn<n)
  8047a8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047ac:	8b 00                	mov    eax,DWORD PTR [rax]
  8047ae:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8047b1:	7e 7f                	jle    804832 <sys_malloc+0x113>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  8047b3:	8b 05 b7 d8 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d8b7]        # 412070 <cur_proc>
  8047b9:	48 98                	cdqe   
  8047bb:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8047c2:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8047c8:	8b 10                	mov    edx,DWORD PTR [rax]
  8047ca:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8047cd:	c1 e0 0c             	shl    eax,0xc
  8047d0:	01 d0                	add    eax,edx
  8047d2:	3d ff ff ef 01       	cmp    eax,0x1efffff
  8047d7:	7e 0a                	jle    8047e3 <sys_malloc+0xc4>
        {
            //超过顶部
            return NULL;
  8047d9:	b8 00 00 00 00       	mov    eax,0x0
  8047de:	e9 c8 00 00 00       	jmp    8048ab <sys_malloc+0x18c>
        }
        int needed=n-hp->pgn;
  8047e3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047e7:	8b 10                	mov    edx,DWORD PTR [rax]
  8047e9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8047ec:	29 d0                	sub    eax,edx
  8047ee:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  8047f1:	8b 05 79 d8 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d879]        # 412070 <cur_proc>
  8047f7:	48 98                	cdqe   
  8047f9:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804800:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804806:	8b 00                	mov    eax,DWORD PTR [rax]
  804808:	48 98                	cdqe   
  80480a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  80480e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804815:	eb 13                	jmp    80482a <sys_malloc+0x10b>
        {
            *p=0;//触发缺页中断
  804817:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80481b:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  80481e:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804825:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804826:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80482a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80482d:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  804830:	7c e5                	jl     804817 <sys_malloc+0xf8>
        }
    }
    if(hp->pgn>n)
  804832:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804836:	8b 00                	mov    eax,DWORD PTR [rax]
  804838:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  80483b:	7d 59                	jge    804896 <sys_malloc+0x177>
    {
        //在后面新建一个头
        char *p=hp;
  80483d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804841:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804845:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804848:	83 c0 01             	add    eax,0x1
  80484b:	c1 e0 0c             	shl    eax,0xc
  80484e:	48 98                	cdqe   
  804850:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804854:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804858:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  80485c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804860:	8b 00                	mov    eax,DWORD PTR [rax]
  804862:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  804865:	8d 50 ff             	lea    edx,[rax-0x1]
  804868:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80486c:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  80486e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804872:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804876:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80487a:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  80487e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804882:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804886:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  80488a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80488e:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804892:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804896:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80489a:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  8048a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048a5:	48 05 00 10 00 00    	add    rax,0x1000
}
  8048ab:	5d                   	pop    rbp
  8048ac:	c3                   	ret    

00000000008048ad <sys_free>:
int sys_free(int ptr)
{
  8048ad:	f3 0f 1e fa          	endbr64 
  8048b1:	55                   	push   rbp
  8048b2:	48 89 e5             	mov    rbp,rsp
  8048b5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  8048b8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8048bb:	2d 00 10 00 00       	sub    eax,0x1000
  8048c0:	48 98                	cdqe   
  8048c2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  8048c6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048ca:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  8048d1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048d5:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8048d9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8048dd:	eb 2e                	jmp    80490d <sys_free+0x60>
    {
        if(p->alloc==0)
  8048df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048e3:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8048e6:	85 c0                	test   eax,eax
  8048e8:	75 2c                	jne    804916 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  8048ea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048ee:	8b 10                	mov    edx,DWORD PTR [rax]
  8048f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048f4:	8b 00                	mov    eax,DWORD PTR [rax]
  8048f6:	83 c0 01             	add    eax,0x1
  8048f9:	01 c2                	add    edx,eax
  8048fb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048ff:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  804901:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804905:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804909:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80490d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804912:	75 cb                	jne    8048df <sys_free+0x32>
  804914:	eb 01                	jmp    804917 <sys_free+0x6a>
            break;
  804916:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  804917:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80491b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80491f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804923:	eb 2e                	jmp    804953 <sys_free+0xa6>
    {
        if(p->alloc==0)
  804925:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804929:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80492c:	85 c0                	test   eax,eax
  80492e:	75 2c                	jne    80495c <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  804930:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804934:	8b 10                	mov    edx,DWORD PTR [rax]
  804936:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80493a:	8b 00                	mov    eax,DWORD PTR [rax]
  80493c:	83 c0 01             	add    eax,0x1
  80493f:	01 c2                	add    edx,eax
  804941:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804945:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  804947:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80494b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80494f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804953:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804958:	75 cb                	jne    804925 <sys_free+0x78>
  80495a:	eb 01                	jmp    80495d <sys_free+0xb0>
            break;
  80495c:	90                   	nop
    }
    //合并完成
    return 0;
  80495d:	b8 00 00 00 00       	mov    eax,0x0
  804962:	5d                   	pop    rbp
  804963:	c3                   	ret    
  804964:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  80496b:	00 00 00 
  80496e:	66 90                	xchg   ax,ax

0000000000804970 <outb>:
  804970:	66 89 fa             	mov    dx,di
  804973:	66 89 f0             	mov    ax,si
  804976:	ee                   	out    dx,al
  804977:	e8 29 00 00 00       	call   8049a5 <io_delay>
  80497c:	c3                   	ret    

000000000080497d <outw>:
  80497d:	66 89 fa             	mov    dx,di
  804980:	66 89 f0             	mov    ax,si
  804983:	66 ef                	out    dx,ax
  804985:	90                   	nop
  804986:	90                   	nop
  804987:	90                   	nop
  804988:	c3                   	ret    

0000000000804989 <inb>:
  804989:	31 c0                	xor    eax,eax
  80498b:	66 89 fa             	mov    dx,di
  80498e:	ec                   	in     al,dx
  80498f:	90                   	nop
  804990:	90                   	nop
  804991:	90                   	nop
  804992:	c3                   	ret    

0000000000804993 <inw>:
  804993:	31 c0                	xor    eax,eax
  804995:	66 89 fa             	mov    dx,di
  804998:	66 ed                	in     ax,dx
  80499a:	90                   	nop
  80499b:	90                   	nop
  80499c:	90                   	nop
  80499d:	c3                   	ret    

000000000080499e <eoi>:
  80499e:	b0 20                	mov    al,0x20
  8049a0:	e6 a0                	out    0xa0,al
  8049a2:	e6 20                	out    0x20,al
  8049a4:	c3                   	ret    

00000000008049a5 <io_delay>:
  8049a5:	90                   	nop
  8049a6:	90                   	nop
  8049a7:	90                   	nop
  8049a8:	90                   	nop
  8049a9:	c3                   	ret    

00000000008049aa <turn_on_int>:
  8049aa:	b0 f8                	mov    al,0xf8
  8049ac:	e6 21                	out    0x21,al
  8049ae:	e8 f2 ff ff ff       	call   8049a5 <io_delay>
  8049b3:	b0 af                	mov    al,0xaf
  8049b5:	e6 a1                	out    0xa1,al
  8049b7:	e8 e9 ff ff ff       	call   8049a5 <io_delay>
  8049bc:	b8 00 70 10 00       	mov    eax,0x107000
  8049c1:	0f 01 18             	lidt   [rax]
  8049c4:	90                   	nop
  8049c5:	90                   	nop
  8049c6:	90                   	nop
  8049c7:	90                   	nop
  8049c8:	fb                   	sti    
  8049c9:	c3                   	ret    

00000000008049ca <report_back_trace_of_err>:
  8049ca:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  8049cf:	50                   	push   rax
  8049d0:	68 d9 49 80 00       	push   0x8049d9
  8049d5:	83 c4 08             	add    esp,0x8
  8049d8:	c3                   	ret    

00000000008049d9 <bt_msg>:
  8049d9:	65 72 72             	gs jb  804a4e <fill_desc+0x1c>
  8049dc:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  8049dd:	72 20                	jb     8049ff <init_gdt+0x11>
  8049df:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  8049e0:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  8049e3:	72 73                	jb     804a58 <fill_desc+0x26>
  8049e5:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  8049e8:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eea666 <dev_stdout+0x6d8586>

00000000008049ee <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  8049ee:	f3 0f 1e fa          	endbr64 
  8049f2:	55                   	push   rbp
  8049f3:	48 89 e5             	mov    rbp,rsp
    //asm volatile("sgdt %0"::"m"(gdt));
    fill_desc(0,0xffffffff,SEG_CONFORMING_RW_CODE,1);
  8049f6:	b9 01 00 00 00       	mov    ecx,0x1
  8049fb:	ba 9e cf 00 00       	mov    edx,0xcf9e
  804a00:	be ff ff ff ff       	mov    esi,0xffffffff
  804a05:	bf 00 00 00 00       	mov    edi,0x0
  804a0a:	e8 23 00 00 00       	call   804a32 <fill_desc>
    fill_desc(0,0xffffffff,SEG_RW_DATA,2);
  804a0f:	b9 02 00 00 00       	mov    ecx,0x2
  804a14:	ba 92 cf 00 00       	mov    edx,0xcf92
  804a19:	be ff ff ff ff       	mov    esi,0xffffffff
  804a1e:	bf 00 00 00 00       	mov    edi,0x0
  804a23:	e8 0a 00 00 00       	call   804a32 <fill_desc>
    asm volatile("lgdt %0":"=m"(gdtptr));
  804a28:	0f 01 15 d1 05 90 ff 	lgdt   [rip+0xffffffffff9005d1]        # 105000 <gdtptr>

}
  804a2f:	90                   	nop
  804a30:	5d                   	pop    rbp
  804a31:	c3                   	ret    

0000000000804a32 <fill_desc>:
void fill_desc(u32 base, u32 limit,u16 attr,u32 index)
{
  804a32:	f3 0f 1e fa          	endbr64 
  804a36:	55                   	push   rbp
  804a37:	48 89 e5             	mov    rbp,rsp
  804a3a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  804a3d:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  804a40:	89 d0                	mov    eax,edx
  804a42:	89 4d f0             	mov    DWORD PTR [rbp-0x10],ecx
  804a45:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    gdt[index].base_lo16=base&0xffff;
  804a49:	48 8b 15 10 55 00 00 	mov    rdx,QWORD PTR [rip+0x5510]        # 809f60 <gdt>
  804a50:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804a53:	48 c1 e0 03          	shl    rax,0x3
  804a57:	48 01 d0             	add    rax,rdx
  804a5a:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804a5d:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_mid8=(base>>16)&0xff;
  804a61:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804a64:	c1 e8 10             	shr    eax,0x10
  804a67:	89 c1                	mov    ecx,eax
  804a69:	48 8b 15 f0 54 00 00 	mov    rdx,QWORD PTR [rip+0x54f0]        # 809f60 <gdt>
  804a70:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804a73:	48 c1 e0 03          	shl    rax,0x3
  804a77:	48 01 d0             	add    rax,rdx
  804a7a:	89 ca                	mov    edx,ecx
  804a7c:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_hi8=(base>>24)&0xff;
  804a7f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804a82:	c1 e8 18             	shr    eax,0x18
  804a85:	89 c1                	mov    ecx,eax
  804a87:	48 8b 15 d2 54 00 00 	mov    rdx,QWORD PTR [rip+0x54d2]        # 809f60 <gdt>
  804a8e:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804a91:	48 c1 e0 03          	shl    rax,0x3
  804a95:	48 01 d0             	add    rax,rdx
  804a98:	89 ca                	mov    edx,ecx
  804a9a:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].limit_lo16=limit&0xffff;
  804a9d:	48 8b 15 bc 54 00 00 	mov    rdx,QWORD PTR [rip+0x54bc]        # 809f60 <gdt>
  804aa4:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804aa7:	48 c1 e0 03          	shl    rax,0x3
  804aab:	48 01 d0             	add    rax,rdx
  804aae:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  804ab1:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr;
  804ab4:	48 8b 15 a5 54 00 00 	mov    rdx,QWORD PTR [rip+0x54a5]        # 809f60 <gdt>
  804abb:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804abe:	48 c1 e0 03          	shl    rax,0x3
  804ac2:	48 01 c2             	add    rdx,rax
  804ac5:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  804ac9:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  804acd:	90                   	nop
  804ace:	5d                   	pop    rbp
  804acf:	c3                   	ret    

0000000000804ad0 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  804ad0:	f3 0f 1e fa          	endbr64 
  804ad4:	55                   	push   rbp
  804ad5:	48 89 e5             	mov    rbp,rsp
  804ad8:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804adb:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  804ade:	89 c8                	mov    eax,ecx
  804ae0:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  804ae4:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  804ae8:	48 8b 05 71 54 00 00 	mov    rax,QWORD PTR [rip+0x5471]        # 809f60 <gdt>
  804aef:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  804af3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804af6:	48 c1 e0 04          	shl    rax,0x4
  804afa:	48 89 c2             	mov    rdx,rax
  804afd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b01:	48 01 d0             	add    rax,rdx
  804b04:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804b07:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  804b0a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b0d:	48 c1 e0 04          	shl    rax,0x4
  804b11:	48 89 c2             	mov    rdx,rax
  804b14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b18:	48 01 d0             	add    rax,rdx
  804b1b:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804b1e:	c1 ea 10             	shr    edx,0x10
  804b21:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  804b24:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b27:	48 c1 e0 04          	shl    rax,0x4
  804b2b:	48 89 c2             	mov    rdx,rax
  804b2e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b32:	48 01 c2             	add    rdx,rax
  804b35:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  804b39:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  804b3d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b40:	48 c1 e0 04          	shl    rax,0x4
  804b44:	48 89 c2             	mov    rdx,rax
  804b47:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b4b:	48 01 c2             	add    rdx,rax
  804b4e:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  804b52:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  804b56:	90                   	nop
  804b57:	5d                   	pop    rbp
  804b58:	c3                   	ret    

0000000000804b59 <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  804b59:	f3 0f 1e fa          	endbr64 
  804b5d:	55                   	push   rbp
  804b5e:	48 89 e5             	mov    rbp,rsp
  804b61:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  804b64:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  804b67:	89 d0                	mov    eax,edx
  804b69:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  804b6d:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    desc->base_lo16=base&0xffff;
  804b71:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b74:	89 c2                	mov    edx,eax
  804b76:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b7a:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    desc->base_mid8=(base>>16)&0xff;
  804b7e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b81:	c1 e8 10             	shr    eax,0x10
  804b84:	89 c2                	mov    edx,eax
  804b86:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b8a:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    desc->base_hi8=(base>>24)&0xff;
  804b8d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b90:	c1 e8 18             	shr    eax,0x18
  804b93:	89 c2                	mov    edx,eax
  804b95:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b99:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    desc->limit_lo16=limit&0xffff;
  804b9c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804b9f:	89 c2                	mov    edx,eax
  804ba1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804ba5:	66 89 10             	mov    WORD PTR [rax],dx
    desc->attr=attr|(limit>>16&0xf)<<8;
  804ba8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804bab:	c1 e8 10             	shr    eax,0x10
  804bae:	c1 e0 08             	shl    eax,0x8
  804bb1:	66 25 00 0f          	and    ax,0xf00
  804bb5:	66 0b 45 f4          	or     ax,WORD PTR [rbp-0xc]
  804bb9:	89 c2                	mov    edx,eax
  804bbb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804bbf:	66 89 50 05          	mov    WORD PTR [rax+0x5],dx
  804bc3:	90                   	nop
  804bc4:	5d                   	pop    rbp
  804bc5:	c3                   	ret    
  804bc6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  804bcd:	00 00 00 

0000000000804bd0 <fill_desc>:
  804bd0:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  804bd5:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  804bda:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  804bdf:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  804be4:	be 00 60 00 00       	mov    esi,0x6000
  804be9:	c1 e2 03             	shl    edx,0x3
  804bec:	01 d6                	add    esi,edx
  804bee:	66 67 89 1e          	mov    WORD PTR [esi],bx
  804bf2:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  804bf7:	c1 e8 10             	shr    eax,0x10
  804bfa:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  804bfe:	c1 eb 10             	shr    ebx,0x10
  804c01:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  804c05:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  804c09:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  804c0d:	c3                   	ret    

0000000000804c0e <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  804c0e:	f3 0f 1e fa          	endbr64 
  804c12:	55                   	push   rbp
  804c13:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  804c16:	b8 00 00 00 00       	mov    eax,0x0
  804c1b:	e8 52 17 00 00       	call   806372 <execute_request>
    do_req();
  804c20:	b8 00 00 00 00       	mov    eax,0x0
  804c25:	e8 e1 ea ff ff       	call   80370b <do_req>
    if(!manage_proc_lock)
  804c2a:	8b 05 d8 52 00 00    	mov    eax,DWORD PTR [rip+0x52d8]        # 809f08 <manage_proc_lock>
  804c30:	85 c0                	test   eax,eax
  804c32:	75 0a                	jne    804c3e <clock_c+0x30>
    {
        manage_proc();
  804c34:	b8 00 00 00 00       	mov    eax,0x0
  804c39:	e8 a8 f0 ff ff       	call   803ce6 <manage_proc>
    }
    //puts("1 disk req executed.");
  804c3e:	90                   	nop
  804c3f:	5d                   	pop    rbp
  804c40:	c3                   	ret    
  804c41:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  804c48:	00 00 00 
  804c4b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000804c50 <clock>:
  804c50:	b0 20                	mov    al,0x20
  804c52:	e6 a0                	out    0xa0,al
  804c54:	e6 20                	out    0x20,al
  804c56:	e8 b3 ff ff ff       	call   804c0e <clock_c>
  804c5b:	48 cf                	iretq  

0000000000804c5d <execute>:
    return ind;
}
*/

int execute(char *path)
{
  804c5d:	f3 0f 1e fa          	endbr64 
  804c61:	55                   	push   rbp
  804c62:	48 89 e5             	mov    rbp,rsp
  804c65:	48 83 ec 30          	sub    rsp,0x30
  804c69:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  804c6d:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  804c74:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, 1)) == -1)return -1;
  804c7b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804c7f:	be 01 00 00 00       	mov    esi,0x1
  804c84:	48 89 c7             	mov    rdi,rax
  804c87:	e8 72 cd ff ff       	call   8019fe <sys_open>
  804c8c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  804c8f:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804c93:	75 0a                	jne    804c9f <execute+0x42>
  804c95:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804c9a:	e9 b7 00 00 00       	jmp    804d56 <execute+0xf9>
    //
    char *p=path;
  804c9f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804ca3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  804ca7:	eb 05                	jmp    804cae <execute+0x51>
  804ca9:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  804cae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804cb2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804cb5:	84 c0                	test   al,al
  804cb7:	75 f0                	jne    804ca9 <execute+0x4c>
    for(;*p!='/'&&p>path;p--);
  804cb9:	eb 05                	jmp    804cc0 <execute+0x63>
  804cbb:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  804cc0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804cc4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804cc7:	3c 2f                	cmp    al,0x2f
  804cc9:	74 0a                	je     804cd5 <execute+0x78>
  804ccb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ccf:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804cd3:	77 e6                	ja     804cbb <execute+0x5e>
    if(p>path)
  804cd5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804cd9:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804cdd:	76 2f                	jbe    804d0e <execute+0xb1>
    {
        *p='\0';
  804cdf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ce3:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, 1)) == -1)return -1;
  804ce6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804cea:	be 01 00 00 00       	mov    esi,0x1
  804cef:	48 89 c7             	mov    rdi,rax
  804cf2:	e8 07 cd ff ff       	call   8019fe <sys_open>
  804cf7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  804cfa:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  804cfe:	75 07                	jne    804d07 <execute+0xaa>
  804d00:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804d05:	eb 4f                	jmp    804d56 <execute+0xf9>
        *p='/';
  804d07:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804d0b:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern vfs_dir_entry opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  804d0e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804d11:	48 63 d0             	movsxd rdx,eax
  804d14:	48 89 d0             	mov    rax,rdx
  804d17:	48 01 c0             	add    rax,rax
  804d1a:	48 01 d0             	add    rax,rdx
  804d1d:	48 c1 e0 05          	shl    rax,0x5
  804d21:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  804d28:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d2b:	48 63 c8             	movsxd rcx,eax
  804d2e:	48 89 c8             	mov    rax,rcx
  804d31:	48 01 c0             	add    rax,rax
  804d34:	48 01 c8             	add    rax,rcx
  804d37:	48 c1 e0 05          	shl    rax,0x5
  804d3b:	48 05 60 06 40 00    	add    rax,0x400660
  804d41:	b9 c0 4d 80 00       	mov    ecx,0x804dc0
  804d46:	48 89 c6             	mov    rsi,rax
  804d49:	89 cf                	mov    edi,ecx
  804d4b:	e8 19 f8 ff ff       	call   804569 <reg_proc>
  804d50:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  804d53:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  804d56:	c9                   	leave  
  804d57:	c3                   	ret    

0000000000804d58 <exec_call>:

int exec_call(char *path)
{
  804d58:	f3 0f 1e fa          	endbr64 
  804d5c:	55                   	push   rbp
  804d5d:	48 89 e5             	mov    rbp,rsp
  804d60:	48 83 ec 20          	sub    rsp,0x20
  804d64:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi=execute(path);
  804d68:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804d6c:	48 89 c7             	mov    rdi,rax
  804d6f:	e8 e9 fe ff ff       	call   804c5d <execute>
  804d74:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  804d77:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d7a:	01 c0                	add    eax,eax
  804d7c:	83 c0 05             	add    eax,0x5
  804d7f:	c1 e0 03             	shl    eax,0x3
  804d82:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  804d85:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d88:	89 c7                	mov    edi,eax
  804d8a:	e8 78 f0 ff ff       	call   803e07 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  804d8f:	90                   	nop
  804d90:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d93:	48 98                	cdqe   
  804d95:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804d9c:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804da2:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804da5:	83 f8 03             	cmp    eax,0x3
  804da8:	75 e6                	jne    804d90 <exec_call+0x38>
    return task[pi].exit_code;
  804daa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804dad:	48 98                	cdqe   
  804daf:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804db6:	48 05 b0 84 40 00    	add    rax,0x4084b0
  804dbc:	8b 00                	mov    eax,DWORD PTR [rax]
}
  804dbe:	c9                   	leave  
  804dbf:	c3                   	ret    

0000000000804dc0 <proc_start>:
int proc_start()
{
  804dc0:	f3 0f 1e fa          	endbr64 
  804dc4:	55                   	push   rbp
  804dc5:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  804dc8:	8b 05 a2 d2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d2a2]        # 412070 <cur_proc>
  804dce:	48 98                	cdqe   
  804dd0:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804dd7:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804ddd:	48 89 c7             	mov    rdi,rax
  804de0:	e8 1a 00 00 00       	call   804dff <load_pe>
    //释放进程资源
    del_proc(cur_proc);
  804de5:	8b 05 85 d2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d285]        # 412070 <cur_proc>
  804deb:	89 c7                	mov    edi,eax
  804ded:	e8 54 f5 ff ff       	call   804346 <del_proc>
    switch_proc_tss(0);
  804df2:	bf 00 00 00 00       	mov    edi,0x0
  804df7:	e8 0b f0 ff ff       	call   803e07 <switch_proc_tss>
}
  804dfc:	90                   	nop
  804dfd:	5d                   	pop    rbp
  804dfe:	c3                   	ret    

0000000000804dff <load_pe>:
//在cr3切换到目标进程下的加载程序(但进程还没调度到那里)。
int load_pe(struct process *proc)
{
  804dff:	f3 0f 1e fa          	endbr64 
  804e03:	55                   	push   rbp
  804e04:	48 89 e5             	mov    rbp,rsp
  804e07:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  804e0e:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    vfs_dir_entry *f=proc->exef;
  804e15:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  804e1c:	48 8b 80 94 00 00 00 	mov    rax,QWORD PTR [rax+0x94]
  804e23:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=f->fno;
  804e27:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  804e2b:	8b 00                	mov    eax,DWORD PTR [rax]
  804e2d:	89 45 94             	mov    DWORD PTR [rbp-0x6c],eax

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  804e30:	48 8d 8d 70 fe ff ff 	lea    rcx,[rbp-0x190]
  804e37:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804e3a:	ba 44 00 00 00       	mov    edx,0x44
  804e3f:	48 89 ce             	mov    rsi,rcx
  804e42:	89 c7                	mov    edi,eax
  804e44:	e8 94 d1 ff ff       	call   801fdd <sys_read>
    sys_seek(exefno,tdh.e_lfanew,SEEK_SET);
  804e49:	48 8b 85 ac fe ff ff 	mov    rax,QWORD PTR [rbp-0x154]
  804e50:	89 c1                	mov    ecx,eax
  804e52:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804e55:	ba 00 00 00 00       	mov    edx,0x0
  804e5a:	89 ce                	mov    esi,ecx
  804e5c:	89 c7                	mov    edi,eax
  804e5e:	e8 0b d2 ff ff       	call   80206e <sys_seek>
    sys_read(exefno, &tnth, sizeof(tnth));
  804e63:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  804e6a:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804e6d:	ba f8 00 00 00       	mov    edx,0xf8
  804e72:	48 89 ce             	mov    rsi,rcx
  804e75:	89 c7                	mov    edi,eax
  804e77:	e8 61 d1 ff ff       	call   801fdd <sys_read>

    //是否需要移动base(先不检查)
    unsigned int nbase=tnth.OptionalHeader.ImageBase;
  804e7c:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  804e82:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  804e85:	8b 85 c0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x240]
  804e8b:	c1 e8 0c             	shr    eax,0xc
  804e8e:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
    //use_pgm_ava检查在页表中这个范围是否可用，可用就使用
    while(1)
    {
        cont:
        ;
        int pdei=nbase/PAGE_INDEX_SIZE;
  804e91:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804e94:	c1 e8 16             	shr    eax,0x16
  804e97:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
        int ptei=nbase%PAGE_INDEX_SIZE/PAGE_SIZE;
  804e9a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804e9d:	25 ff ff 3f 00       	and    eax,0x3fffff
  804ea2:	c1 e8 0c             	shr    eax,0xc
  804ea5:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
        int *pt=(proc->pdet[pdei]&0xfffff000);
  804ea8:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  804eaf:	48 8b 90 84 00 00 00 	mov    rdx,QWORD PTR [rax+0x84]
  804eb6:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
  804eb9:	48 98                	cdqe   
  804ebb:	48 c1 e0 02          	shl    rax,0x2
  804ebf:	48 01 d0             	add    rax,rdx
  804ec2:	8b 00                	mov    eax,DWORD PTR [rax]
  804ec4:	89 c0                	mov    eax,eax
  804ec6:	25 00 f0 ff ff       	and    eax,0xfffff000
  804ecb:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
        for(int i=0;i<pgn;i++)
  804ecf:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  804ed6:	eb 48                	jmp    804f20 <load_pe+0x121>
        {
            if(pt[ptei+i%1024]&PAGE_PRESENT&&pt!=NULL)
  804ed8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804edb:	99                   	cdq    
  804edc:	c1 ea 16             	shr    edx,0x16
  804edf:	01 d0                	add    eax,edx
  804ee1:	25 ff 03 00 00       	and    eax,0x3ff
  804ee6:	29 d0                	sub    eax,edx
  804ee8:	89 c2                	mov    edx,eax
  804eea:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  804eed:	01 d0                	add    eax,edx
  804eef:	48 98                	cdqe   
  804ef1:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  804ef8:	00 
  804ef9:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  804efd:	48 01 d0             	add    rax,rdx
  804f00:	8b 00                	mov    eax,DWORD PTR [rax]
  804f02:	83 e0 01             	and    eax,0x1
  804f05:	85 c0                	test   eax,eax
  804f07:	74 13                	je     804f1c <load_pe+0x11d>
  804f09:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
  804f0e:	74 0c                	je     804f1c <load_pe+0x11d>
            {
                //移动base
                nbase+=0x1000;
  804f10:	81 45 fc 00 10 00 00 	add    DWORD PTR [rbp-0x4],0x1000
                goto cont;
  804f17:	e9 75 ff ff ff       	jmp    804e91 <load_pe+0x92>
        for(int i=0;i<pgn;i++)
  804f1c:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  804f20:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804f23:	3b 45 90             	cmp    eax,DWORD PTR [rbp-0x70]
  804f26:	7c b0                	jl     804ed8 <load_pe+0xd9>
            }
        }
        break;
  804f28:	90                   	nop
    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_seek(exefno,0,SEEK_SET);
  804f29:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804f2c:	ba 00 00 00 00       	mov    edx,0x0
  804f31:	be 00 00 00 00       	mov    esi,0x0
  804f36:	89 c7                	mov    edi,eax
  804f38:	e8 31 d1 ff ff       	call   80206e <sys_seek>
    sys_read(exefno, nbase, PAGE_SIZE);
  804f3d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804f40:	48 89 c1             	mov    rcx,rax
  804f43:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804f46:	ba 00 10 00 00       	mov    edx,0x1000
  804f4b:	48 89 ce             	mov    rsi,rcx
  804f4e:	89 c7                	mov    edi,eax
  804f50:	e8 88 d0 ff ff       	call   801fdd <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  804f55:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804f58:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_NT_HEADERS32 nth=nbase+dosh->e_lfanew;
  804f5f:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804f62:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  804f69:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  804f6d:	48 01 d0             	add    rax,rdx
  804f70:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  804f77:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804f7e:	48 83 c0 04          	add    rax,0x4
  804f82:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  804f89:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804f90:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  804f93:	89 85 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],eax
    int page_count=prog_size/4096;
  804f99:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  804f9f:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804fa5:	85 c0                	test   eax,eax
  804fa7:	0f 48 c2             	cmovs  eax,edx
  804faa:	c1 f8 0c             	sar    eax,0xc
  804fad:	89 85 60 ff ff ff    	mov    DWORD PTR [rbp-0xa0],eax

    int shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  804fb3:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804fba:	8b 50 28             	mov    edx,DWORD PTR [rax+0x28]
  804fbd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804fc0:	01 d0                	add    eax,edx
  804fc2:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  804fc8:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  804fce:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  804fd4:	85 c0                	test   eax,eax
  804fd6:	0f 48 c2             	cmovs  eax,edx
  804fd9:	c1 f8 0a             	sar    eax,0xa
  804fdc:	89 c1                	mov    ecx,eax
  804fde:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  804fe4:	99                   	cdq    
  804fe5:	c1 ea 16             	shr    edx,0x16
  804fe8:	01 d0                	add    eax,edx
  804fea:	25 ff 03 00 00       	and    eax,0x3ff
  804fef:	29 d0                	sub    eax,edx
  804ff1:	01 c8                	add    eax,ecx
  804ff3:	85 c0                	test   eax,eax
  804ff5:	0f 95 c0             	setne  al
  804ff8:	0f b6 c0             	movzx  eax,al
  804ffb:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  805001:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  805007:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  80500d:	85 c0                	test   eax,eax
  80500f:	0f 48 c2             	cmovs  eax,edx
  805012:	c1 f8 16             	sar    eax,0x16
  805015:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  80501b:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805022:	89 c0                	mov    eax,eax
  805024:	48 05 f8 00 00 00    	add    rax,0xf8
  80502a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  80502e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805035:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  805039:	0f b7 d0             	movzx  edx,ax
  80503c:	89 d0                	mov    eax,edx
  80503e:	c1 e0 02             	shl    eax,0x2
  805041:	01 d0                	add    eax,edx
  805043:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  805046:	05 3c 01 00 00       	add    eax,0x13c
  80504b:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    int align=nth->OptionalHeader.FileAlignment;
  805051:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805058:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  80505b:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  805061:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805067:	99                   	cdq    
  805068:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  80506e:	89 d0                	mov    eax,edx
  805070:	85 c0                	test   eax,eax
  805072:	74 23                	je     805097 <load_pe+0x298>
  805074:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  80507a:	99                   	cdq    
  80507b:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  805081:	89 d1                	mov    ecx,edx
  805083:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805089:	29 c8                	sub    eax,ecx
  80508b:	89 c2                	mov    edx,eax
  80508d:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
  805093:	01 d0                	add    eax,edx
  805095:	eb 06                	jmp    80509d <load_pe+0x29e>
  805097:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  80509d:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  8050a3:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8050aa:	eb 68                	jmp    805114 <load_pe+0x315>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  8050ac:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8050b0:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  8050b3:	25 00 00 00 02       	and    eax,0x2000000
  8050b8:	89 85 bc fe ff ff    	mov    DWORD PTR [rbp-0x144],eax
        if(disca)
  8050be:	83 bd bc fe ff ff 00 	cmp    DWORD PTR [rbp-0x144],0x0
  8050c5:	75 43                	jne    80510a <load_pe+0x30b>
            continue;
        //直接读，缺页内核解决
        sys_seek(exefno,psec->PointerToRawData,SEEK_SET);
  8050c7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8050cb:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8050ce:	89 c1                	mov    ecx,eax
  8050d0:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8050d3:	ba 00 00 00 00       	mov    edx,0x0
  8050d8:	89 ce                	mov    esi,ecx
  8050da:	89 c7                	mov    edi,eax
  8050dc:	e8 8d cf ff ff       	call   80206e <sys_seek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  8050e1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8050e5:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8050e8:	89 c2                	mov    edx,eax
  8050ea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8050ee:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
  8050f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8050f4:	01 c8                	add    eax,ecx
  8050f6:	89 c0                	mov    eax,eax
  8050f8:	48 89 c1             	mov    rcx,rax
  8050fb:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8050fe:	48 89 ce             	mov    rsi,rcx
  805101:	89 c7                	mov    edi,eax
  805103:	e8 d5 ce ff ff       	call   801fdd <sys_read>
  805108:	eb 01                	jmp    80510b <load_pe+0x30c>
            continue;
  80510a:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  80510b:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80510f:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  805114:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80511b:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  80511f:	0f b7 c0             	movzx  eax,ax
  805122:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805125:	7c 85                	jl     8050ac <load_pe+0x2ad>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  805127:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80512e:	48 83 e8 80          	sub    rax,0xffffffffffffff80
  805132:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    if(impd->Size>0)
  805139:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  805140:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805143:	85 c0                	test   eax,eax
  805145:	0f 84 71 02 00 00    	je     8053bc <load_pe+0x5bd>
    {
        int tmpi=impd->VirtualAddress+nbase;
  80514b:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  805152:	8b 10                	mov    edx,DWORD PTR [rax]
  805154:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805157:	01 d0                	add    eax,edx
  805159:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  80515f:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  805165:	48 98                	cdqe   
  805167:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  80516b:	e9 3e 02 00 00       	jmp    8053ae <load_pe+0x5af>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  805170:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805174:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  805177:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80517a:	01 d0                	add    eax,edx
  80517c:	89 c0                	mov    eax,eax
  80517e:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  805185:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80518c:	be 88 1a 81 00       	mov    esi,0x811a88
  805191:	48 89 c7             	mov    rdi,rax
  805194:	e8 6b 46 00 00       	call   809804 <strcmp>
  805199:	85 c0                	test   eax,eax
  80519b:	75 09                	jne    8051a6 <load_pe+0x3a7>
            {
                dllp=0x1c00000;
  80519d:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  8051a4:	eb 25                	jmp    8051cb <load_pe+0x3cc>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  8051a6:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  8051ad:	48 89 c7             	mov    rdi,rax
  8051b0:	e8 4a fc ff ff       	call   804dff <load_pe>
  8051b5:	89 85 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  8051bb:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  8051c1:	89 c7                	mov    edi,eax
  8051c3:	e8 c9 03 00 00       	call   805591 <get_module_addr>
  8051c8:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  8051cb:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8051ce:	48 98                	cdqe   
  8051d0:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  8051d7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8051da:	48 63 d0             	movsxd rdx,eax
  8051dd:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  8051e4:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  8051e8:	48 01 d0             	add    rax,rdx
  8051eb:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  8051f2:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8051f9:	8b 50 78             	mov    edx,DWORD PTR [rax+0x78]
  8051fc:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8051ff:	01 d0                	add    eax,edx
  805201:	89 c0                	mov    eax,eax
  805203:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
            int funcn=dllexp->NumberOfNames;
  80520a:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805211:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  805214:	89 85 0c ff ff ff    	mov    DWORD PTR [rbp-0xf4],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  80521a:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805221:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  805224:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805227:	01 d0                	add    eax,edx
  805229:	89 c0                	mov    eax,eax
  80522b:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  805232:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805239:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80523c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80523f:	01 d0                	add    eax,edx
  805241:	89 c0                	mov    eax,eax
  805243:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  80524a:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805251:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  805254:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805257:	01 d0                	add    eax,edx
  805259:	89 c0                	mov    eax,eax
  80525b:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  805262:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805269:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80526c:	89 85 ec fe ff ff    	mov    DWORD PTR [rbp-0x114],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  805272:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805276:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  805279:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80527c:	01 d0                	add    eax,edx
  80527e:	89 c0                	mov    eax,eax
  805280:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  805284:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805288:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  80528b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80528e:	01 d0                	add    eax,edx
  805290:	89 c0                	mov    eax,eax
  805292:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  805296:	e9 00 01 00 00       	jmp    80539b <load_pe+0x59c>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  80529b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80529f:	8b 00                	mov    eax,DWORD PTR [rax]
  8052a1:	85 c0                	test   eax,eax
  8052a3:	79 43                	jns    8052e8 <load_pe+0x4e9>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  8052a5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8052a9:	8b 00                	mov    eax,DWORD PTR [rax]
  8052ab:	25 ff ff ff 7f       	and    eax,0x7fffffff
  8052b0:	2b 85 ec fe ff ff    	sub    eax,DWORD PTR [rbp-0x114]
  8052b6:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  8052bc:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  8052c2:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8052c9:	00 
  8052ca:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8052d1:	48 01 d0             	add    rax,rdx
  8052d4:	8b 10                	mov    edx,DWORD PTR [rax]
  8052d6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8052d9:	01 d0                	add    eax,edx
  8052db:	89 c2                	mov    edx,eax
  8052dd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8052e1:	89 10                	mov    DWORD PTR [rax],edx
  8052e3:	e9 a9 00 00 00       	jmp    805391 <load_pe+0x592>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  8052e8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8052ec:	8b 00                	mov    eax,DWORD PTR [rax]
  8052ee:	89 c0                	mov    eax,eax
  8052f0:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  8052f7:	48 83 85 e0 fe ff ff 	add    QWORD PTR [rbp-0x120],0x2
  8052fe:	02 
                    int i=0;
  8052ff:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  805306:	eb 7a                	jmp    805382 <load_pe+0x583>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  805308:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80530b:	48 98                	cdqe   
  80530d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805314:	00 
  805315:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  80531c:	48 01 d0             	add    rax,rdx
  80531f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805322:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
  805329:	48 89 d6             	mov    rsi,rdx
  80532c:	48 89 c7             	mov    rdi,rax
  80532f:	e8 d0 44 00 00       	call   809804 <strcmp>
  805334:	85 c0                	test   eax,eax
  805336:	75 46                	jne    80537e <load_pe+0x57f>
                        {
                            int ordi=funcords[i];
  805338:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80533b:	48 98                	cdqe   
  80533d:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  805341:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  805348:	48 01 d0             	add    rax,rdx
  80534b:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80534e:	98                   	cwde   
  80534f:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  805355:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
  80535b:	48 98                	cdqe   
  80535d:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805364:	00 
  805365:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80536c:	48 01 d0             	add    rax,rdx
  80536f:	8b 10                	mov    edx,DWORD PTR [rax]
  805371:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805374:	01 d0                	add    eax,edx
  805376:	89 c2                	mov    edx,eax
  805378:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80537c:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  80537e:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  805382:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  805385:	3b 85 0c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xf4]
  80538b:	0f 8c 77 ff ff ff    	jl     805308 <load_pe+0x509>
                        }
                    }
                }
                iataddrs++;
  805391:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  805396:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  80539b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80539f:	8b 00                	mov    eax,DWORD PTR [rax]
  8053a1:	85 c0                	test   eax,eax
  8053a3:	0f 85 f2 fe ff ff    	jne    80529b <load_pe+0x49c>
            }
            impdes++;
  8053a9:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  8053ae:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8053b2:	8b 00                	mov    eax,DWORD PTR [rax]
  8053b4:	85 c0                	test   eax,eax
  8053b6:	0f 85 b4 fd ff ff    	jne    805170 <load_pe+0x371>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  8053bc:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  8053c3:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  8053c4:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8053cb:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [rax+0xa4]
  8053d1:	85 c0                	test   eax,eax
  8053d3:	0f 84 e8 00 00 00    	je     8054c1 <load_pe+0x6c2>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  8053d9:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8053e0:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [rax+0xa0]
  8053e6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053e9:	01 d0                	add    eax,edx
  8053eb:	89 c0                	mov    eax,eax
  8053ed:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                                +(u32)nbase);
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  8053f1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8053f5:	48 83 c0 40          	add    rax,0x40
  8053f9:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  8053fd:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805401:	48 83 c0 02          	add    rax,0x2
  805405:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  805409:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805410:	8b 40 34             	mov    eax,DWORD PTR [rax+0x34]
  805413:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
        while(relp->VirtualAddress){
  805419:	e9 95 00 00 00       	jmp    8054b3 <load_pe+0x6b4>
            int pgva=relp->VirtualAddress+nbase;
  80541e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805422:	8b 10                	mov    edx,DWORD PTR [rax]
  805424:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805427:	01 d0                	add    eax,edx
  805429:	89 85 d0 fe ff ff    	mov    DWORD PTR [rbp-0x130],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  80542f:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  805436:	eb 59                	jmp    805491 <load_pe+0x692>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  805438:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80543c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80543f:	66 85 c0             	test   ax,ax
  805442:	74 48                	je     80548c <load_pe+0x68d>
                int *at=*reloc+pgva;//要重定位的数据的地址
  805444:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805448:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80544b:	0f b7 d0             	movzx  edx,ax
  80544e:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  805454:	01 d0                	add    eax,edx
  805456:	48 98                	cdqe   
  805458:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
                *at=*at-old_base+nbase;
  80545f:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  805466:	8b 00                	mov    eax,DWORD PTR [rax]
  805468:	2b 85 d4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x12c]
  80546e:	89 c2                	mov    edx,eax
  805470:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805473:	01 d0                	add    eax,edx
  805475:	89 c2                	mov    edx,eax
  805477:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  80547e:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  805480:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  805485:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  80548a:	eb 01                	jmp    80548d <load_pe+0x68e>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  80548c:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  80548d:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  805491:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805495:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805498:	c1 e8 02             	shr    eax,0x2
  80549b:	89 c2                	mov    edx,eax
  80549d:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  8054a0:	39 c2                	cmp    edx,eax
  8054a2:	77 94                	ja     805438 <load_pe+0x639>
            }
            relp=(int)relp+0x1000;
  8054a4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8054a8:	05 00 10 00 00       	add    eax,0x1000
  8054ad:	48 98                	cdqe   
  8054af:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  8054b3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8054b7:	8b 00                	mov    eax,DWORD PTR [rax]
  8054b9:	85 c0                	test   eax,eax
  8054bb:	0f 85 5d ff ff ff    	jne    80541e <load_pe+0x61f>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  8054c1:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  8054c8:	00 00 00 
  8054cb:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  8054d2:	00 00 00 
  8054d5:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  8054dc:	00 00 00 00 
  8054e0:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  8054e7:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  8054eb:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  8054f2:	ba 18 00 00 00       	mov    edx,0x18
  8054f7:	48 89 c6             	mov    rsi,rax
  8054fa:	bf 00 00 00 01       	mov    edi,0x1000000
  8054ff:	e8 62 40 00 00       	call   809566 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  805504:	8b 05 66 cb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cb66]        # 412070 <cur_proc>
  80550a:	48 98                	cdqe   
  80550c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  805513:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805519:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  805520:	8b 05 4a cb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cb4a]        # 412070 <cur_proc>
  805526:	48 98                	cdqe   
  805528:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80552f:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805535:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  80553c:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  805542:	48 98                	cdqe   
  805544:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
    task[cur_proc].exit_code=main(0,NULL);
  80554b:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
  805552:	be 00 00 00 00       	mov    esi,0x0
  805557:	bf 00 00 00 00       	mov    edi,0x0
  80555c:	ff d0                	call   rax
  80555e:	8b 15 0c cb c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0cb0c]        # 412070 <cur_proc>
  805564:	89 c1                	mov    ecx,eax
  805566:	48 63 c2             	movsxd rax,edx
  805569:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  805570:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805576:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  805578:	8b 05 f2 ca c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0caf2]        # 412070 <cur_proc>
  80557e:	48 98                	cdqe   
  805580:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  805587:	48 05 b0 84 40 00    	add    rax,0x4084b0
  80558d:	8b 00                	mov    eax,DWORD PTR [rax]
}
  80558f:	c9                   	leave  
  805590:	c3                   	ret    

0000000000805591 <get_module_addr>:

int get_module_addr(int mi)
{
  805591:	f3 0f 1e fa          	endbr64 
  805595:	55                   	push   rbp
  805596:	48 89 e5             	mov    rbp,rsp
  805599:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  80559c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80559f:	48 98                	cdqe   
  8055a1:	8b 04 c5 80 4c 42 00 	mov    eax,DWORD PTR [rax*8+0x424c80]
}
  8055a8:	5d                   	pop    rbp
  8055a9:	c3                   	ret    

00000000008055aa <dispose_library>:
int dispose_library(int dlln)
{
  8055aa:	f3 0f 1e fa          	endbr64 
  8055ae:	55                   	push   rbp
  8055af:	48 89 e5             	mov    rbp,rsp
  8055b2:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  8055b5:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8055b9:	78 09                	js     8055c4 <dispose_library+0x1a>
  8055bb:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  8055c2:	7e 07                	jle    8055cb <dispose_library+0x21>
  8055c4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8055c9:	eb 1d                	jmp    8055e8 <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  8055cb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8055ce:	48 98                	cdqe   
  8055d0:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  8055d7:	48 05 88 20 41 00    	add    rax,0x412088
  8055dd:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  8055e3:	b8 00 00 00 00       	mov    eax,0x0
}
  8055e8:	5d                   	pop    rbp
  8055e9:	c3                   	ret    

00000000008055ea <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  8055ea:	f3 0f 1e fa          	endbr64 
  8055ee:	55                   	push   rbp
  8055ef:	48 89 e5             	mov    rbp,rsp
  8055f2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  8055f6:	90                   	nop
  8055f7:	5d                   	pop    rbp
  8055f8:	c3                   	ret    

00000000008055f9 <sys_rmmod>:
int sys_rmmod(char *name)
{
  8055f9:	f3 0f 1e fa          	endbr64 
  8055fd:	55                   	push   rbp
  8055fe:	48 89 e5             	mov    rbp,rsp
  805601:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  805605:	90                   	nop
  805606:	5d                   	pop    rbp
  805607:	c3                   	ret    
  805608:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  80560f:	00 

0000000000805610 <_syscall>:
  805610:	57                   	push   rdi
  805611:	56                   	push   rsi
  805612:	52                   	push   rdx
  805613:	51                   	push   rcx
  805614:	53                   	push   rbx
  805615:	50                   	push   rax
  805616:	e8 53 af ff ff       	call   80056e <syscall>
  80561b:	48 83 c4 18          	add    rsp,0x18
  80561f:	cf                   	iret   

0000000000805620 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  805620:	f3 0f 1e fa          	endbr64 
  805624:	55                   	push   rbp
  805625:	48 89 e5             	mov    rbp,rsp
  805628:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  80562c:	8b 05 62 fa c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fa62]        # 425094 <framebuffer+0x14>
  805632:	89 c0                	mov    eax,eax
  805634:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  805638:	8b 05 5a fa c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fa5a]        # 425098 <framebuffer+0x18>
  80563e:	89 c0                	mov    eax,eax
  805640:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  805644:	0f b6 05 51 fa c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fa51]        # 42509c <framebuffer+0x1c>
  80564b:	c0 e8 03             	shr    al,0x3
  80564e:	0f b6 c0             	movzx  eax,al
  805651:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  805655:	8b 05 35 fa c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fa35]        # 425090 <framebuffer+0x10>
  80565b:	89 c0                	mov    eax,eax
  80565d:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  805661:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805665:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  80566a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  80566e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805672:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  805677:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  80567b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80567f:	48 c1 e8 0c          	shr    rax,0xc
  805683:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  805686:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  80568d:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  80568e:	48 8b 05 f3 f9 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f9f3]        # 425088 <framebuffer+0x8>
  805695:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  805699:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8056a0:	00 
  8056a1:	eb 2d                	jmp    8056d0 <init_framebuffer+0xb0>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  8056a3:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  8056a7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8056ab:	ba 07 00 00 00       	mov    edx,0x7
  8056b0:	48 89 ce             	mov    rsi,rcx
  8056b3:	48 89 c7             	mov    rdi,rax
  8056b6:	e8 b9 b7 ff ff       	call   800e74 <mmap>
        pp+=PAGE_SIZE;
  8056bb:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  8056c2:	00 
        p+=PAGE_SIZE;
  8056c3:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  8056ca:	00 
    for (size_t i = 0; i < pgc; i++)
  8056cb:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  8056d0:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8056d3:	48 98                	cdqe   
  8056d5:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  8056d9:	72 c8                	jb     8056a3 <init_framebuffer+0x83>
    }
    
    
}
  8056db:	90                   	nop
  8056dc:	90                   	nop
  8056dd:	c9                   	leave  
  8056de:	c3                   	ret    

00000000008056df <init_font>:
void init_font(){
  8056df:	f3 0f 1e fa          	endbr64 
  8056e3:	55                   	push   rbp
  8056e4:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  8056e7:	48 c7 05 ce f9 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f9ce],0x80a128        # 4250c0 <boot_font>
  8056ee:	28 a1 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  8056f2:	48 8b 05 c7 f9 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f9c7]        # 4250c0 <boot_font>
  8056f9:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  8056fc:	83 c0 07             	add    eax,0x7
  8056ff:	c1 e8 03             	shr    eax,0x3
  805702:	89 05 c8 f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f9c8],eax        # 4250d0 <font_width_bytes>
    font_width = font_width_bytes * 8;
  805708:	8b 05 c2 f9 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f9c2]        # 4250d0 <font_width_bytes>
  80570e:	c1 e0 03             	shl    eax,0x3
  805711:	89 05 b1 f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f9b1],eax        # 4250c8 <font_width>
    font_height = boot_font->height;
  805717:	48 8b 05 a2 f9 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f9a2]        # 4250c0 <boot_font>
  80571e:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  805721:	89 05 a5 f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f9a5],eax        # 4250cc <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  805727:	48 8b 05 92 f9 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f992]        # 4250c0 <boot_font>
  80572e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  805731:	89 c0                	mov    eax,eax
  805733:	48 05 28 a1 80 00    	add    rax,0x80a128
  805739:	48 89 05 98 f9 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f998],rax        # 4250d8 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  805740:	48 8b 05 79 f9 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f979]        # 4250c0 <boot_font>
  805747:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80574a:	89 05 94 f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f994],eax        # 4250e4 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  805750:	48 8b 05 69 f9 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f969]        # 4250c0 <boot_font>
  805757:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  80575a:	89 05 80 f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f980],eax        # 4250e0 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  805760:	c7 05 46 f9 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f946],0x0        # 4250b0 <fb_cursor_y>
  805767:	00 00 00 
  80576a:	8b 05 40 f9 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f940]        # 4250b0 <fb_cursor_y>
  805770:	89 05 36 f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f936],eax        # 4250ac <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width *framebuffer.common.framebuffer_bpp/8 / font_width;
  805776:	8b 15 18 f9 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f918]        # 425094 <framebuffer+0x14>
  80577c:	0f b6 05 19 f9 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f919]        # 42509c <framebuffer+0x1c>
  805783:	0f b6 c0             	movzx  eax,al
  805786:	0f af c2             	imul   eax,edx
  805789:	c1 e8 03             	shr    eax,0x3
  80578c:	8b 0d 36 f9 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f936]        # 4250c8 <font_width>
  805792:	ba 00 00 00 00       	mov    edx,0x0
  805797:	f7 f1                	div    ecx
  805799:	89 05 15 f9 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f915],eax        # 4250b4 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height *framebuffer.common.framebuffer_bpp/8 / font_height;
  80579f:	8b 15 f3 f8 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f8f3]        # 425098 <framebuffer+0x18>
  8057a5:	0f b6 05 f0 f8 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f8f0]        # 42509c <framebuffer+0x1c>
  8057ac:	0f b6 c0             	movzx  eax,al
  8057af:	0f af c2             	imul   eax,edx
  8057b2:	c1 e8 03             	shr    eax,0x3
  8057b5:	8b 35 11 f9 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1f911]        # 4250cc <font_height>
  8057bb:	ba 00 00 00 00       	mov    edx,0x0
  8057c0:	f7 f6                	div    esi
  8057c2:	89 05 f0 f8 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f8f0],eax        # 4250b8 <max_ch_nr_y>
    font_size=1;
  8057c8:	c7 05 96 47 00 00 01 	mov    DWORD PTR [rip+0x4796],0x1        # 809f68 <font_size>
  8057cf:	00 00 00 
}
  8057d2:	90                   	nop
  8057d3:	5d                   	pop    rbp
  8057d4:	c3                   	ret    

00000000008057d5 <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  8057d5:	f3 0f 1e fa          	endbr64 
  8057d9:	55                   	push   rbp
  8057da:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  8057dd:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  8057e1:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8057e5:	48 89 05 94 f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f894],rax        # 425080 <framebuffer>
  8057ec:	48 89 15 95 f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f895],rdx        # 425088 <framebuffer+0x8>
  8057f3:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  8057f7:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  8057fb:	48 89 05 8e f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f88e],rax        # 425090 <framebuffer+0x10>
  805802:	48 89 15 8f f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f88f],rdx        # 425098 <framebuffer+0x18>
  805809:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  80580d:	48 89 05 8c f8 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f88c],rax        # 4250a0 <framebuffer+0x20>
}
  805814:	90                   	nop
  805815:	5d                   	pop    rbp
  805816:	c3                   	ret    

0000000000805817 <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  805817:	f3 0f 1e fa          	endbr64 
  80581b:	55                   	push   rbp
  80581c:	48 89 e5             	mov    rbp,rsp
  80581f:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  805822:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805825:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805828:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  80582b:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  80582f:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  805836:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  805837:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80583a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  80583d:	eb 64                	jmp    8058a3 <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  80583f:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805842:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  805845:	eb 4b                	jmp    805892 <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805847:	8b 15 43 f8 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f843]        # 425090 <framebuffer+0x10>
  80584d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805850:	0f af c2             	imul   eax,edx
  805853:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  805855:	0f b6 05 40 f8 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f840]        # 42509c <framebuffer+0x1c>
  80585c:	0f b6 c0             	movzx  eax,al
  80585f:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805863:	8d 50 07             	lea    edx,[rax+0x7]
  805866:	85 c0                	test   eax,eax
  805868:	0f 48 c2             	cmovs  eax,edx
  80586b:	c1 f8 03             	sar    eax,0x3
  80586e:	48 98                	cdqe   
  805870:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805873:	48 05 00 00 00 40    	add    rax,0x40000000
  805879:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  80587d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805881:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  805885:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805889:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  80588c:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  80588e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805892:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805895:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805898:	01 d0                	add    eax,edx
  80589a:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  80589d:	7c a8                	jl     805847 <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  80589f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8058a3:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  8058a6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8058a9:	01 d0                	add    eax,edx
  8058ab:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8058ae:	7c 8f                	jl     80583f <fill_rect+0x28>
        }
    }
}
  8058b0:	90                   	nop
  8058b1:	90                   	nop
  8058b2:	5d                   	pop    rbp
  8058b3:	c3                   	ret    

00000000008058b4 <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  8058b4:	f3 0f 1e fa          	endbr64 
  8058b8:	55                   	push   rbp
  8058b9:	48 89 e5             	mov    rbp,rsp
  8058bc:	48 83 ec 30          	sub    rsp,0x30
  8058c0:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8058c3:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8058c6:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8058c9:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  8058cd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8058d0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  8058d3:	eb 5a                	jmp    80592f <draw_text+0x7b>
    {
        if(*str=='\n')
  8058d5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8058d9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8058dc:	3c 0a                	cmp    al,0xa
  8058de:	75 1c                	jne    8058fc <draw_text+0x48>
        {
            y+=font_height*size;
  8058e0:	8b 15 e6 f7 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f7e6]        # 4250cc <font_height>
  8058e6:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8058e9:	0f af d0             	imul   edx,eax
  8058ec:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8058ef:	01 d0                	add    eax,edx
  8058f1:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  8058f4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8058f7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  8058fa:	eb 2e                	jmp    80592a <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  8058fc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805900:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805903:	0f be c8             	movsx  ecx,al
  805906:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805909:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  80590c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80590f:	89 c7                	mov    edi,eax
  805911:	e8 28 00 00 00       	call   80593e <draw_letter>
            tx+=size*font_width;
  805916:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805919:	8b 05 a9 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f7a9]        # 4250c8 <font_width>
  80591f:	0f af d0             	imul   edx,eax
  805922:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805925:	01 d0                	add    eax,edx
  805927:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  80592a:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  80592f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805933:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805936:	84 c0                	test   al,al
  805938:	75 9b                	jne    8058d5 <draw_text+0x21>
    }
}
  80593a:	90                   	nop
  80593b:	90                   	nop
  80593c:	c9                   	leave  
  80593d:	c3                   	ret    

000000000080593e <draw_letter>:
void draw_letter(int x, int y, int size, char c) {
  80593e:	f3 0f 1e fa          	endbr64 
  805942:	55                   	push   rbp
  805943:	48 89 e5             	mov    rbp,rsp
  805946:	48 83 ec 30          	sub    rsp,0x30
  80594a:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  80594d:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805950:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805953:	89 c8                	mov    eax,ecx
  805955:	88 45 d0             	mov    BYTE PTR [rbp-0x30],al
    u8 *glyph = glyph_table;
  805958:	48 8b 05 79 f7 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f779]        # 4250d8 <glyph_table>
  80595f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  805963:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805967:	8b 05 77 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f777]        # 4250e4 <glyph_nr>
  80596d:	39 c2                	cmp    edx,eax
  80596f:	73 13                	jae    805984 <draw_letter+0x46>
        glyph += c * bytes_per_glyph;
  805971:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805975:	8b 05 65 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f765]        # 4250e0 <bytes_per_glyph>
  80597b:	0f af c2             	imul   eax,edx
  80597e:	89 c0                	mov    eax,eax
  805980:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805984:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80598b:	e9 c9 00 00 00       	jmp    805a59 <draw_letter+0x11b>
        u8 mask = 1 << 7;
  805990:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805994:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80599b:	e9 9a 00 00 00       	jmp    805a3a <draw_letter+0xfc>
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  8059a0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8059a3:	c1 e8 03             	shr    eax,0x3
  8059a6:	89 c2                	mov    edx,eax
  8059a8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8059ac:	48 01 d0             	add    rax,rdx
  8059af:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8059b2:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  8059b5:	84 c0                	test   al,al
  8059b7:	74 37                	je     8059f0 <draw_letter+0xb2>
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,-1);
  8059b9:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8059bc:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  8059c0:	89 c2                	mov    edx,eax
  8059c2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8059c5:	01 d0                	add    eax,edx
  8059c7:	89 c6                	mov    esi,eax
  8059c9:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8059cc:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  8059d0:	89 c2                	mov    edx,eax
  8059d2:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8059d5:	01 d0                	add    eax,edx
  8059d7:	89 c7                	mov    edi,eax
  8059d9:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  8059dc:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8059df:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
  8059e5:	89 d1                	mov    ecx,edx
  8059e7:	89 c2                	mov    edx,eax
  8059e9:	e8 29 fe ff ff       	call   805817 <fill_rect>
  8059ee:	eb 35                	jmp    805a25 <draw_letter+0xe7>
            } else {
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,0);
  8059f0:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8059f3:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  8059f7:	89 c2                	mov    edx,eax
  8059f9:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8059fc:	01 d0                	add    eax,edx
  8059fe:	89 c6                	mov    esi,eax
  805a00:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805a03:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  805a07:	89 c2                	mov    edx,eax
  805a09:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805a0c:	01 d0                	add    eax,edx
  805a0e:	89 c7                	mov    edi,eax
  805a10:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805a13:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805a16:	41 b8 00 00 00 00    	mov    r8d,0x0
  805a1c:	89 d1                	mov    ecx,edx
  805a1e:	89 c2                	mov    edx,eax
  805a20:	e8 f2 fd ff ff       	call   805817 <fill_rect>
            }

            mask >>= 1;
  805a25:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  805a28:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805a2b:	83 e0 07             	and    eax,0x7
  805a2e:	85 c0                	test   eax,eax
  805a30:	75 04                	jne    805a36 <draw_letter+0xf8>
                mask = 1 << 7;
  805a32:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805a36:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805a3a:	8b 05 88 f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f688]        # 4250c8 <font_width>
  805a40:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805a43:	0f 82 57 ff ff ff    	jb     8059a0 <draw_letter+0x62>
            }
        }

        glyph += font_width_bytes;
  805a49:	8b 05 81 f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f681]        # 4250d0 <font_width_bytes>
  805a4f:	89 c0                	mov    eax,eax
  805a51:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805a55:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805a59:	8b 05 6d f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f66d]        # 4250cc <font_height>
  805a5f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  805a62:	0f 82 28 ff ff ff    	jb     805990 <draw_letter+0x52>
    }
}
  805a68:	90                   	nop
  805a69:	90                   	nop
  805a6a:	c9                   	leave  
  805a6b:	c3                   	ret    

0000000000805a6c <scr_up>:
//向上滚动一个像素
void scr_up(){
  805a6c:	f3 0f 1e fa          	endbr64 
  805a70:	55                   	push   rbp
  805a71:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805a74:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805a7b:	eb 6c                	jmp    805ae9 <scr_up+0x7d>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805a7d:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805a84:	eb 52                	jmp    805ad8 <scr_up+0x6c>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805a86:	8b 15 04 f6 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f604]        # 425090 <framebuffer+0x10>
  805a8c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a8f:	0f af c2             	imul   eax,edx
  805a92:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  805a94:	0f b6 05 01 f6 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f601]        # 42509c <framebuffer+0x1c>
  805a9b:	0f b6 c0             	movzx  eax,al
  805a9e:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805aa2:	8d 50 07             	lea    edx,[rax+0x7]
  805aa5:	85 c0                	test   eax,eax
  805aa7:	0f 48 c2             	cmovs  eax,edx
  805aaa:	c1 f8 03             	sar    eax,0x3
  805aad:	48 98                	cdqe   
  805aaf:	48 01 c8             	add    rax,rcx
  805ab2:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805ab8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  805abc:	8b 05 ce f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f5ce]        # 425090 <framebuffer+0x10>
  805ac2:	89 c2                	mov    edx,eax
  805ac4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805ac8:	48 01 d0             	add    rax,rdx
  805acb:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  805ace:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805ad2:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805ad4:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805ad8:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805adb:	8b 05 d3 f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f5d3]        # 4250b4 <max_ch_nr_x>
  805ae1:	39 c2                	cmp    edx,eax
  805ae3:	72 a1                	jb     805a86 <scr_up+0x1a>
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805ae5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805ae9:	8b 05 c9 f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f5c9]        # 4250b8 <max_ch_nr_y>
  805aef:	8d 50 ff             	lea    edx,[rax-0x1]
  805af2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805af5:	39 c2                	cmp    edx,eax
  805af7:	77 84                	ja     805a7d <scr_up+0x11>
        }

    }
}
  805af9:	90                   	nop
  805afa:	90                   	nop
  805afb:	5d                   	pop    rbp
  805afc:	c3                   	ret    

0000000000805afd <scr_down>:
void scr_down(){
  805afd:	f3 0f 1e fa          	endbr64 
  805b01:	55                   	push   rbp
  805b02:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  805b05:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  805b0c:	eb 72                	jmp    805b80 <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805b0e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805b15:	eb 58                	jmp    805b6f <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805b17:	8b 15 73 f5 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f573]        # 425090 <framebuffer+0x10>
  805b1d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b20:	0f af c2             	imul   eax,edx
  805b23:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  805b25:	0f b6 05 70 f5 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f570]        # 42509c <framebuffer+0x1c>
  805b2c:	0f b6 c0             	movzx  eax,al
  805b2f:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805b33:	8d 50 07             	lea    edx,[rax+0x7]
  805b36:	85 c0                	test   eax,eax
  805b38:	0f 48 c2             	cmovs  eax,edx
  805b3b:	c1 f8 03             	sar    eax,0x3
  805b3e:	48 98                	cdqe   
  805b40:	48 01 c8             	add    rax,rcx
  805b43:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805b49:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  805b4d:	8b 05 3d f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f53d]        # 425090 <framebuffer+0x10>
  805b53:	89 c0                	mov    eax,eax
  805b55:	48 f7 d8             	neg    rax
  805b58:	48 89 c2             	mov    rdx,rax
  805b5b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805b5f:	48 01 d0             	add    rax,rdx
  805b62:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  805b65:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805b69:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805b6b:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805b6f:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805b72:	8b 05 3c f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f53c]        # 4250b4 <max_ch_nr_x>
  805b78:	39 c2                	cmp    edx,eax
  805b7a:	72 9b                	jb     805b17 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  805b7c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805b80:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  805b83:	8b 05 2f f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f52f]        # 4250b8 <max_ch_nr_y>
  805b89:	39 c2                	cmp    edx,eax
  805b8b:	72 81                	jb     805b0e <scr_down+0x11>
        }

    }
}
  805b8d:	90                   	nop
  805b8e:	90                   	nop
  805b8f:	5d                   	pop    rbp
  805b90:	c3                   	ret    

0000000000805b91 <print>:
void print(char* s){
  805b91:	f3 0f 1e fa          	endbr64 
  805b95:	55                   	push   rbp
  805b96:	48 89 e5             	mov    rbp,rsp
  805b99:	48 83 ec 18          	sub    rsp,0x18
  805b9d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(;*s;s++){
  805ba1:	e9 f7 00 00 00       	jmp    805c9d <print+0x10c>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  805ba6:	8b 15 00 f5 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f500]        # 4250ac <fb_cursor_x>
  805bac:	8b 05 02 f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f502]        # 4250b4 <max_ch_nr_x>
  805bb2:	39 c2                	cmp    edx,eax
  805bb4:	77 0b                	ja     805bc1 <print+0x30>
  805bb6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805bba:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805bbd:	3c 0a                	cmp    al,0xa
  805bbf:	75 19                	jne    805bda <print+0x49>
        {
            fb_cursor_y+=1;
  805bc1:	8b 05 e9 f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f4e9]        # 4250b0 <fb_cursor_y>
  805bc7:	83 c0 01             	add    eax,0x1
  805bca:	89 05 e0 f4 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f4e0],eax        # 4250b0 <fb_cursor_y>
            fb_cursor_x=0;
  805bd0:	c7 05 d2 f4 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f4d2],0x0        # 4250ac <fb_cursor_x>
  805bd7:	00 00 00 
        }
        if(*s=='\n')continue;
  805bda:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805bde:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805be1:	3c 0a                	cmp    al,0xa
  805be3:	0f 84 ae 00 00 00    	je     805c97 <print+0x106>
        if(fb_cursor_y>=max_ch_nr_y){
  805be9:	8b 15 c1 f4 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f4c1]        # 4250b0 <fb_cursor_y>
  805bef:	8b 05 c3 f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f4c3]        # 4250b8 <max_ch_nr_y>
  805bf5:	39 c2                	cmp    edx,eax
  805bf7:	72 3c                	jb     805c35 <print+0xa4>
            for(int i=0;i<font_height*font_size;i++)
  805bf9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805c00:	eb 0e                	jmp    805c10 <print+0x7f>
                scr_up();
  805c02:	b8 00 00 00 00       	mov    eax,0x0
  805c07:	e8 60 fe ff ff       	call   805a6c <scr_up>
            for(int i=0;i<font_height*font_size;i++)
  805c0c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805c10:	8b 05 b6 f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f4b6]        # 4250cc <font_height>
  805c16:	8b 15 4c 43 00 00    	mov    edx,DWORD PTR [rip+0x434c]        # 809f68 <font_size>
  805c1c:	0f af d0             	imul   edx,eax
  805c1f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c22:	39 c2                	cmp    edx,eax
  805c24:	77 dc                	ja     805c02 <print+0x71>
            fb_cursor_y=max_ch_nr_y-1;
  805c26:	8b 05 8c f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f48c]        # 4250b8 <max_ch_nr_y>
  805c2c:	83 e8 01             	sub    eax,0x1
  805c2f:	89 05 7b f4 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f47b],eax        # 4250b0 <fb_cursor_y>
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  805c35:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805c39:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805c3c:	0f be d0             	movsx  edx,al
  805c3f:	8b 05 23 43 00 00    	mov    eax,DWORD PTR [rip+0x4323]        # 809f68 <font_size>
  805c45:	8b 35 65 f4 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1f465]        # 4250b0 <fb_cursor_y>
  805c4b:	8b 0d 7b f4 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f47b]        # 4250cc <font_height>
  805c51:	0f af ce             	imul   ecx,esi
  805c54:	8b 35 0e 43 00 00    	mov    esi,DWORD PTR [rip+0x430e]        # 809f68 <font_size>
  805c5a:	0f af ce             	imul   ecx,esi
  805c5d:	41 89 c8             	mov    r8d,ecx
  805c60:	8b 35 46 f4 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1f446]        # 4250ac <fb_cursor_x>
  805c66:	8b 0d 5c f4 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f45c]        # 4250c8 <font_width>
  805c6c:	0f af ce             	imul   ecx,esi
  805c6f:	8b 35 f3 42 00 00    	mov    esi,DWORD PTR [rip+0x42f3]        # 809f68 <font_size>
  805c75:	0f af ce             	imul   ecx,esi
  805c78:	89 cf                	mov    edi,ecx
  805c7a:	89 d1                	mov    ecx,edx
  805c7c:	89 c2                	mov    edx,eax
  805c7e:	44 89 c6             	mov    esi,r8d
  805c81:	e8 b8 fc ff ff       	call   80593e <draw_letter>
        fb_cursor_x+=1;
  805c86:	8b 05 20 f4 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f420]        # 4250ac <fb_cursor_x>
  805c8c:	83 c0 01             	add    eax,0x1
  805c8f:	89 05 17 f4 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f417],eax        # 4250ac <fb_cursor_x>
  805c95:	eb 01                	jmp    805c98 <print+0x107>
        if(*s=='\n')continue;
  805c97:	90                   	nop
    for(;*s;s++){
  805c98:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  805c9d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805ca1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805ca4:	84 c0                	test   al,al
  805ca6:	0f 85 fa fe ff ff    	jne    805ba6 <print+0x15>
    }
}
  805cac:	90                   	nop
  805cad:	90                   	nop
  805cae:	c9                   	leave  
  805caf:	c3                   	ret    

0000000000805cb0 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  805cb0:	f3 0f 1e fa          	endbr64 
  805cb4:	55                   	push   rbp
  805cb5:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  805cb8:	0f b6 05 4e fe c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fe4e]        # 425b0d <k_shift>
  805cbf:	84 c0                	test   al,al
  805cc1:	0f 94 c0             	sete   al
  805cc4:	88 05 43 fe c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fe43],al        # 425b0d <k_shift>
}
  805cca:	90                   	nop
  805ccb:	5d                   	pop    rbp
  805ccc:	c3                   	ret    

0000000000805ccd <ctrl>:
void ctrl()
{
  805ccd:	f3 0f 1e fa          	endbr64 
  805cd1:	55                   	push   rbp
  805cd2:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  805cd5:	0f b6 05 32 fe c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fe32]        # 425b0e <k_ctrl>
  805cdc:	84 c0                	test   al,al
  805cde:	0f 94 c0             	sete   al
  805ce1:	88 05 27 fe c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fe27],al        # 425b0e <k_ctrl>
}
  805ce7:	90                   	nop
  805ce8:	5d                   	pop    rbp
  805ce9:	c3                   	ret    

0000000000805cea <capslock>:
void capslock()
{
  805cea:	f3 0f 1e fa          	endbr64 
  805cee:	55                   	push   rbp
  805cef:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  805cf2:	0f b6 05 16 fe c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fe16]        # 425b0f <k_capslock>
  805cf9:	84 c0                	test   al,al
  805cfb:	0f 94 c0             	sete   al
  805cfe:	88 05 0b fe c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1fe0b],al        # 425b0f <k_capslock>
}
  805d04:	90                   	nop
  805d05:	5d                   	pop    rbp
  805d06:	c3                   	ret    

0000000000805d07 <to_ascii>:
char to_ascii(char scan_code)
{
  805d07:	f3 0f 1e fa          	endbr64 
  805d0b:	55                   	push   rbp
  805d0c:	48 89 e5             	mov    rbp,rsp
  805d0f:	89 f8                	mov    eax,edi
  805d11:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  805d14:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805d1b:	e9 c7 00 00 00       	jmp    805de7 <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  805d20:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805d23:	48 63 d0             	movsxd rdx,eax
  805d26:	48 89 d0             	mov    rax,rdx
  805d29:	48 c1 e0 02          	shl    rax,0x2
  805d2d:	48 01 d0             	add    rax,rdx
  805d30:	48 05 02 1c 81 00    	add    rax,0x811c02
  805d36:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d39:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  805d3c:	0f 85 a1 00 00 00    	jne    805de3 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  805d42:	0f b6 05 c6 fd c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fdc6]        # 425b0f <k_capslock>
  805d49:	84 c0                	test   al,al
  805d4b:	74 55                	je     805da2 <to_ascii+0x9b>
  805d4d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805d50:	48 63 d0             	movsxd rdx,eax
  805d53:	48 89 d0             	mov    rax,rdx
  805d56:	48 c1 e0 02          	shl    rax,0x2
  805d5a:	48 01 d0             	add    rax,rdx
  805d5d:	48 05 00 1c 81 00    	add    rax,0x811c00
  805d63:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d66:	3c 60                	cmp    al,0x60
  805d68:	7e 38                	jle    805da2 <to_ascii+0x9b>
  805d6a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805d6d:	48 63 d0             	movsxd rdx,eax
  805d70:	48 89 d0             	mov    rax,rdx
  805d73:	48 c1 e0 02          	shl    rax,0x2
  805d77:	48 01 d0             	add    rax,rdx
  805d7a:	48 05 00 1c 81 00    	add    rax,0x811c00
  805d80:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d83:	3c 7a                	cmp    al,0x7a
  805d85:	7f 1b                	jg     805da2 <to_ascii+0x9b>
  805d87:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805d8a:	48 63 d0             	movsxd rdx,eax
  805d8d:	48 89 d0             	mov    rax,rdx
  805d90:	48 c1 e0 02          	shl    rax,0x2
  805d94:	48 01 d0             	add    rax,rdx
  805d97:	48 05 01 1c 81 00    	add    rax,0x811c01
  805d9d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805da0:	eb 54                	jmp    805df6 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  805da2:	0f b6 05 64 fd c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fd64]        # 425b0d <k_shift>
  805da9:	84 c0                	test   al,al
  805dab:	74 1b                	je     805dc8 <to_ascii+0xc1>
  805dad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805db0:	48 63 d0             	movsxd rdx,eax
  805db3:	48 89 d0             	mov    rax,rdx
  805db6:	48 c1 e0 02          	shl    rax,0x2
  805dba:	48 01 d0             	add    rax,rdx
  805dbd:	48 05 01 1c 81 00    	add    rax,0x811c01
  805dc3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805dc6:	eb 2e                	jmp    805df6 <to_ascii+0xef>
            else return key_map[i].ascii;
  805dc8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805dcb:	48 63 d0             	movsxd rdx,eax
  805dce:	48 89 d0             	mov    rax,rdx
  805dd1:	48 c1 e0 02          	shl    rax,0x2
  805dd5:	48 01 d0             	add    rax,rdx
  805dd8:	48 05 00 1c 81 00    	add    rax,0x811c00
  805dde:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805de1:	eb 13                	jmp    805df6 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  805de3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805de7:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  805deb:	0f 8e 2f ff ff ff    	jle    805d20 <to_ascii+0x19>
        }

    return '\0';
  805df1:	b8 00 00 00 00       	mov    eax,0x0
}
  805df6:	5d                   	pop    rbp
  805df7:	c3                   	ret    

0000000000805df8 <init_kb>:
int init_kb()
{
  805df8:	f3 0f 1e fa          	endbr64 
  805dfc:	55                   	push   rbp
  805dfd:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  805e00:	bf 40 1b 81 00       	mov    edi,0x811b40
  805e05:	e8 61 cb ff ff       	call   80296b <reg_device>
    reg_driver(&drv_keyboard);
  805e0a:	bf a0 1a 81 00       	mov    edi,0x811aa0
  805e0f:	e8 3f ce ff ff       	call   802c53 <reg_driver>
}
  805e14:	90                   	nop
  805e15:	5d                   	pop    rbp
  805e16:	c3                   	ret    

0000000000805e17 <key_proc>:
int key_proc()
{
  805e17:	f3 0f 1e fa          	endbr64 
  805e1b:	55                   	push   rbp
  805e1c:	48 89 e5             	mov    rbp,rsp
  805e1f:	48 83 ec 10          	sub    rsp,0x10
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  805e23:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  805e27:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  805e2b:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  805e2f:	bf 60 00 00 00       	mov    edi,0x60
  805e34:	e8 50 eb ff ff       	call   804989 <inb>
  805e39:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
    ch= to_ascii(scan1);
  805e3c:	0f b6 45 fe          	movzx  eax,BYTE PTR [rbp-0x2]
  805e40:	0f be c0             	movsx  eax,al
  805e43:	89 c7                	mov    edi,eax
  805e45:	e8 bd fe ff ff       	call   805d07 <to_ascii>
  805e4a:	88 45 fd             	mov    BYTE PTR [rbp-0x3],al
    if(scan1 == 0xe0 || scan1 == 0xe1)
  805e4d:	80 7d fe e0          	cmp    BYTE PTR [rbp-0x2],0xe0
  805e51:	74 06                	je     805e59 <key_proc+0x42>
  805e53:	80 7d fe e1          	cmp    BYTE PTR [rbp-0x2],0xe1
  805e57:	75 1e                	jne    805e77 <key_proc+0x60>
    {
        ch= to_ascii(scan2);
  805e59:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  805e5d:	0f be c0             	movsx  eax,al
  805e60:	89 c7                	mov    edi,eax
  805e62:	e8 a0 fe ff ff       	call   805d07 <to_ascii>
  805e67:	88 45 fd             	mov    BYTE PTR [rbp-0x3],al
        scan2=inb(0x60);
  805e6a:	bf 60 00 00 00       	mov    edi,0x60
  805e6f:	e8 15 eb ff ff       	call   804989 <inb>
  805e74:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    }
    tmpc.scan_code=scan1;
  805e77:	0f b6 45 fe          	movzx  eax,BYTE PTR [rbp-0x2]
  805e7b:	88 45 fa             	mov    BYTE PTR [rbp-0x6],al
    tmpc.scan_code2=scan2;
  805e7e:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  805e82:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
    tmpc.ascii= ch;
  805e85:	0f b6 45 fd          	movzx  eax,BYTE PTR [rbp-0x3]
  805e89:	88 45 f8             	mov    BYTE PTR [rbp-0x8],al

    if(QTAIL(key_bufq)!=QHEAD(key_bufq))
  805e8c:	8b 15 ea 40 00 00    	mov    edx,DWORD PTR [rip+0x40ea]        # 809f7c <key_bufq+0xc>
  805e92:	8b 05 e0 40 00 00    	mov    eax,DWORD PTR [rip+0x40e0]        # 809f78 <key_bufq+0x8>
  805e98:	39 c2                	cmp    edx,eax
  805e9a:	74 45                	je     805ee1 <key_proc+0xca>
    {
        ENQUEUE(key_bufq,tmpc)
  805e9c:	48 8b 0d cd 40 00 00 	mov    rcx,QWORD PTR [rip+0x40cd]        # 809f70 <key_bufq>
  805ea3:	8b 05 d3 40 00 00    	mov    eax,DWORD PTR [rip+0x40d3]        # 809f7c <key_bufq+0xc>
  805ea9:	48 63 d0             	movsxd rdx,eax
  805eac:	48 89 d0             	mov    rax,rdx
  805eaf:	48 c1 e0 02          	shl    rax,0x2
  805eb3:	48 01 d0             	add    rax,rdx
  805eb6:	48 01 c8             	add    rax,rcx
  805eb9:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805ebc:	89 10                	mov    DWORD PTR [rax],edx
  805ebe:	0f b6 55 fc          	movzx  edx,BYTE PTR [rbp-0x4]
  805ec2:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
  805ec5:	8b 05 b1 40 00 00    	mov    eax,DWORD PTR [rip+0x40b1]        # 809f7c <key_bufq+0xc>
  805ecb:	83 c0 01             	add    eax,0x1
  805ece:	8b 0d ac 40 00 00    	mov    ecx,DWORD PTR [rip+0x40ac]        # 809f80 <key_bufq+0x10>
  805ed4:	99                   	cdq    
  805ed5:	f7 f9                	idiv   ecx
  805ed7:	89 d0                	mov    eax,edx
  805ed9:	89 05 9d 40 00 00    	mov    DWORD PTR [rip+0x409d],eax        # 809f7c <key_bufq+0xc>
  805edf:	eb 22                	jmp    805f03 <key_proc+0xec>
    }

    else if(scan1==0x48)
  805ee1:	80 7d fe 48          	cmp    BYTE PTR [rbp-0x2],0x48
  805ee5:	75 0c                	jne    805ef3 <key_proc+0xdc>
        scr_up();
  805ee7:	b8 00 00 00 00       	mov    eax,0x0
  805eec:	e8 7b fb ff ff       	call   805a6c <scr_up>
  805ef1:	eb 10                	jmp    805f03 <key_proc+0xec>
    else if(scan1==0x50)
  805ef3:	80 7d fe 50          	cmp    BYTE PTR [rbp-0x2],0x50
  805ef7:	75 0a                	jne    805f03 <key_proc+0xec>
        scr_down();
  805ef9:	b8 00 00 00 00       	mov    eax,0x0
  805efe:	e8 fa fb ff ff       	call   805afd <scr_down>
    switch (scan1)
  805f03:	0f b6 45 fe          	movzx  eax,BYTE PTR [rbp-0x2]
  805f07:	3d b6 00 00 00       	cmp    eax,0xb6
  805f0c:	74 41                	je     805f4f <key_proc+0x138>
  805f0e:	3d b6 00 00 00       	cmp    eax,0xb6
  805f13:	7f 5e                	jg     805f73 <key_proc+0x15c>
  805f15:	3d aa 00 00 00       	cmp    eax,0xaa
  805f1a:	74 33                	je     805f4f <key_proc+0x138>
  805f1c:	3d aa 00 00 00       	cmp    eax,0xaa
  805f21:	7f 50                	jg     805f73 <key_proc+0x15c>
  805f23:	3d 9d 00 00 00       	cmp    eax,0x9d
  805f28:	74 31                	je     805f5b <key_proc+0x144>
  805f2a:	3d 9d 00 00 00       	cmp    eax,0x9d
  805f2f:	7f 42                	jg     805f73 <key_proc+0x15c>
  805f31:	83 f8 3a             	cmp    eax,0x3a
  805f34:	74 31                	je     805f67 <key_proc+0x150>
  805f36:	83 f8 3a             	cmp    eax,0x3a
  805f39:	7f 38                	jg     805f73 <key_proc+0x15c>
  805f3b:	83 f8 36             	cmp    eax,0x36
  805f3e:	74 0f                	je     805f4f <key_proc+0x138>
  805f40:	83 f8 36             	cmp    eax,0x36
  805f43:	7f 2e                	jg     805f73 <key_proc+0x15c>
  805f45:	83 f8 1d             	cmp    eax,0x1d
  805f48:	74 11                	je     805f5b <key_proc+0x144>
  805f4a:	83 f8 2a             	cmp    eax,0x2a
  805f4d:	75 24                	jne    805f73 <key_proc+0x15c>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  805f4f:	b8 00 00 00 00       	mov    eax,0x0
  805f54:	e8 57 fd ff ff       	call   805cb0 <shift>
            break;
  805f59:	eb 19                	jmp    805f74 <key_proc+0x15d>
        case 0x1d:
        case 0x9d:
            ctrl();
  805f5b:	b8 00 00 00 00       	mov    eax,0x0
  805f60:	e8 68 fd ff ff       	call   805ccd <ctrl>
            break;
  805f65:	eb 0d                	jmp    805f74 <key_proc+0x15d>
        case 0x3a:
            capslock();
  805f67:	b8 00 00 00 00       	mov    eax,0x0
  805f6c:	e8 79 fd ff ff       	call   805cea <capslock>
            break;
  805f71:	eb 01                	jmp    805f74 <key_proc+0x15d>
        default:
            break;
  805f73:	90                   	nop
    }
    if(scan1<=0x80&&ch!=0)
  805f74:	80 7d fe 80          	cmp    BYTE PTR [rbp-0x2],0x80
  805f78:	77 14                	ja     805f8e <key_proc+0x177>
  805f7a:	0f b6 45 fd          	movzx  eax,BYTE PTR [rbp-0x3]
  805f7e:	84 c0                	test   al,al
  805f80:	74 0c                	je     805f8e <key_proc+0x177>
    {
        print(&ch);
  805f82:	48 8d 45 fd          	lea    rax,[rbp-0x3]
  805f86:	48 89 c7             	mov    rdi,rax
  805f89:	e8 03 fc ff ff       	call   805b91 <print>
        //logf("%x\n",stdin.w_ptr);
        //print_stdin();
        //printchar(ch);
        //flush_screen(0);*/
    }
    eoi();
  805f8e:	b8 00 00 00 00       	mov    eax,0x0
  805f93:	e8 06 ea ff ff       	call   80499e <eoi>
    asm volatile("leave \r\n iretq");
  805f98:	c9                   	leave  
  805f99:	48 cf                	iretq  
}
  805f9b:	90                   	nop
  805f9c:	c9                   	leave  
  805f9d:	c3                   	ret    

0000000000805f9e <sys_getkbc>:

char sys_getkbc()
{
  805f9e:	f3 0f 1e fa          	endbr64 
  805fa2:	55                   	push   rbp
  805fa3:	48 89 e5             	mov    rbp,rsp
    if(key_bufq.tail==key_bufq.head)return -1;
  805fa6:	8b 15 d0 3f 00 00    	mov    edx,DWORD PTR [rip+0x3fd0]        # 809f7c <key_bufq+0xc>
  805fac:	8b 05 c6 3f 00 00    	mov    eax,DWORD PTR [rip+0x3fc6]        # 809f78 <key_bufq+0x8>
  805fb2:	39 c2                	cmp    edx,eax
  805fb4:	75 07                	jne    805fbd <sys_getkbc+0x1f>
  805fb6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805fbb:	eb 43                	jmp    806000 <sys_getkbc+0x62>
    key_code c=key_buf[key_bufq.tail];
  805fbd:	8b 05 b9 3f 00 00    	mov    eax,DWORD PTR [rip+0x3fb9]        # 809f7c <key_bufq+0xc>
  805fc3:	48 63 d0             	movsxd rdx,eax
  805fc6:	48 89 d0             	mov    rax,rdx
  805fc9:	48 c1 e0 02          	shl    rax,0x2
  805fcd:	48 01 d0             	add    rax,rdx
  805fd0:	48 05 00 51 42 00    	add    rax,0x425100
  805fd6:	8b 10                	mov    edx,DWORD PTR [rax]
  805fd8:	89 55 fb             	mov    DWORD PTR [rbp-0x5],edx
  805fdb:	0f b6 40 04          	movzx  eax,BYTE PTR [rax+0x4]
  805fdf:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QTAIL(key_bufq)=(QTAIL(key_bufq)+1)%QSIZE(key_bufq);
  805fe2:	8b 05 94 3f 00 00    	mov    eax,DWORD PTR [rip+0x3f94]        # 809f7c <key_bufq+0xc>
  805fe8:	83 c0 01             	add    eax,0x1
  805feb:	8b 0d 8f 3f 00 00    	mov    ecx,DWORD PTR [rip+0x3f8f]        # 809f80 <key_bufq+0x10>
  805ff1:	99                   	cdq    
  805ff2:	f7 f9                	idiv   ecx
  805ff4:	89 d0                	mov    eax,edx
  805ff6:	89 05 80 3f 00 00    	mov    DWORD PTR [rip+0x3f80],eax        # 809f7c <key_bufq+0xc>
    return c.ascii;
  805ffc:	0f b6 45 fb          	movzx  eax,BYTE PTR [rbp-0x5]
  806000:	5d                   	pop    rbp
  806001:	c3                   	ret    

0000000000806002 <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  806002:	f3 0f 1e fa          	endbr64 
  806006:	55                   	push   rbp
  806007:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  80600a:	b8 00 00 00 00       	mov    eax,0x0
  80600f:	e8 8d 09 00 00       	call   8069a1 <hd_iterate>
    return 0;
  806014:	b8 00 00 00 00       	mov    eax,0x0
}
  806019:	5d                   	pop    rbp
  80601a:	c3                   	ret    

000000000080601b <disk_int_handler_c>:

int disk_int_handler_c()
{
  80601b:	f3 0f 1e fa          	endbr64 
  80601f:	55                   	push   rbp
  806020:	48 89 e5             	mov    rbp,rsp
  806023:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  806027:	48 8b 05 f2 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227f2]        # 428820 <running_req>
  80602e:	48 85 c0             	test   rax,rax
  806031:	75 0a                	jne    80603d <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  806033:	b8 01 00 00 00       	mov    eax,0x1
  806038:	e9 a3 01 00 00       	jmp    8061e0 <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  80603d:	48 8b 05 dc 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227dc]        # 428820 <running_req>
  806044:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806048:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  80604c:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  806053:	48 8b 05 c6 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227c6]        # 428820 <running_req>
  80605a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80605d:	83 f8 02             	cmp    eax,0x2
  806060:	74 0f                	je     806071 <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  806062:	48 8b 05 b7 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227b7]        # 428820 <running_req>
  806069:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  80606c:	83 f8 03             	cmp    eax,0x3
  80606f:	75 07                	jne    806078 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  806071:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  806078:	48 8b 05 a1 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227a1]        # 428820 <running_req>
  80607f:	8b 00                	mov    eax,DWORD PTR [rax]
  806081:	85 c0                	test   eax,eax
  806083:	75 42                	jne    8060c7 <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  806085:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80608c:	eb 22                	jmp    8060b0 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  80608e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806091:	0f b7 c0             	movzx  eax,ax
  806094:	89 c7                	mov    edi,eax
  806096:	e8 f8 e8 ff ff       	call   804993 <inw>
  80609b:	89 c2                	mov    edx,eax
  80609d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8060a1:	48 8d 48 02          	lea    rcx,[rax+0x2]
  8060a5:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  8060a9:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  8060ac:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8060b0:	48 8b 05 69 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22769]        # 428820 <running_req>
  8060b7:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8060ba:	c1 e0 08             	shl    eax,0x8
  8060bd:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  8060c0:	7c cc                	jl     80608e <disk_int_handler_c+0x73>
  8060c2:	e9 ca 00 00 00       	jmp    806191 <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  8060c7:	48 8b 05 52 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22752]        # 428820 <running_req>
  8060ce:	8b 00                	mov    eax,DWORD PTR [rax]
  8060d0:	83 f8 01             	cmp    eax,0x1
  8060d3:	75 42                	jne    806117 <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  8060d5:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8060dc:	eb 25                	jmp    806103 <disk_int_handler_c+0xe8>
            outw(port,*p++);
  8060de:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8060e2:	48 8d 50 02          	lea    rdx,[rax+0x2]
  8060e6:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8060ea:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8060ed:	0f b7 d0             	movzx  edx,ax
  8060f0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8060f3:	0f b7 c0             	movzx  eax,ax
  8060f6:	89 d6                	mov    esi,edx
  8060f8:	89 c7                	mov    edi,eax
  8060fa:	e8 7e e8 ff ff       	call   80497d <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  8060ff:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806103:	48 8b 05 16 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22716]        # 428820 <running_req>
  80610a:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  80610d:	c1 e0 08             	shl    eax,0x8
  806110:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  806113:	7c c9                	jl     8060de <disk_int_handler_c+0xc3>
  806115:	eb 7a                	jmp    806191 <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  806117:	48 8b 05 02 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22702]        # 428820 <running_req>
  80611e:	8b 00                	mov    eax,DWORD PTR [rax]
  806120:	83 f8 02             	cmp    eax,0x2
  806123:	75 34                	jne    806159 <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  806125:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806128:	83 c0 07             	add    eax,0x7
  80612b:	0f b6 c0             	movzx  eax,al
  80612e:	89 c7                	mov    edi,eax
  806130:	e8 54 e8 ff ff       	call   804989 <inb>
  806135:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  806138:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80613b:	0f b7 c0             	movzx  eax,ax
  80613e:	89 c7                	mov    edi,eax
  806140:	e8 4e e8 ff ff       	call   804993 <inw>
  806145:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  806149:	48 8b 05 d0 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226d0]        # 428820 <running_req>
  806150:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  806157:	eb 38                	jmp    806191 <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  806159:	48 8b 05 c0 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc226c0]        # 428820 <running_req>
  806160:	8b 00                	mov    eax,DWORD PTR [rax]
  806162:	83 f8 03             	cmp    eax,0x3
  806165:	75 2a                	jne    806191 <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  806167:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80616a:	83 c0 07             	add    eax,0x7
  80616d:	0f b6 c0             	movzx  eax,al
  806170:	89 c7                	mov    edi,eax
  806172:	e8 12 e8 ff ff       	call   804989 <inb>
  806177:	0f b6 c0             	movzx  eax,al
  80617a:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  80617d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806180:	89 c6                	mov    esi,eax
  806182:	bf d6 1d 81 00       	mov    edi,0x811dd6
  806187:	b8 00 00 00 00       	mov    eax,0x0
  80618c:	e8 04 ab ff ff       	call   800c95 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  806191:	48 8b 05 88 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22688]        # 428820 <running_req>
  806198:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  80619f:	48 8b 05 7a 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2267a]        # 428820 <running_req>
  8061a6:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8061aa:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8061b1:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  8061b4:	48 8b 05 6d 26 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2266d]        # 428828 <running_devman_req>
  8061bb:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  8061c2:	00 00 00 
    running_devman_req=NULL;
  8061c5:	48 c7 05 58 26 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22658],0x0        # 428828 <running_devman_req>
  8061cc:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8061d0:	48 c7 05 45 26 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22645],0x0        # 428820 <running_req>
  8061d7:	00 00 00 00 
    return 0;
  8061db:	b8 00 00 00 00       	mov    eax,0x0
}
  8061e0:	c9                   	leave  
  8061e1:	c3                   	ret    

00000000008061e2 <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  8061e2:	f3 0f 1e fa          	endbr64 
  8061e6:	55                   	push   rbp
  8061e7:	48 89 e5             	mov    rbp,rsp
  8061ea:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  8061ed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8061f0:	48 63 d0             	movsxd rdx,eax
  8061f3:	48 89 d0             	mov    rax,rdx
  8061f6:	48 01 c0             	add    rax,rax
  8061f9:	48 01 d0             	add    rax,rdx
  8061fc:	48 c1 e0 04          	shl    rax,0x4
  806200:	48 05 3c 5b 42 00    	add    rax,0x425b3c
  806206:	8b 00                	mov    eax,DWORD PTR [rax]
}
  806208:	5d                   	pop    rbp
  806209:	c3                   	ret    

000000000080620a <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  80620a:	f3 0f 1e fa          	endbr64 
  80620e:	55                   	push   rbp
  80620f:	48 89 e5             	mov    rbp,rsp
  806212:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806215:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806218:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  80621b:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  80621e:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  806222:	8b 05 2c 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2262c]        # 428854 <tail>
  806228:	83 c0 01             	add    eax,0x1
  80622b:	48 63 d0             	movsxd rdx,eax
  80622e:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  806235:	48 c1 ea 20          	shr    rdx,0x20
  806239:	01 c2                	add    edx,eax
  80623b:	c1 fa 07             	sar    edx,0x7
  80623e:	89 c1                	mov    ecx,eax
  806240:	c1 f9 1f             	sar    ecx,0x1f
  806243:	29 ca                	sub    edx,ecx
  806245:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  80624b:	29 c8                	sub    eax,ecx
  80624d:	89 c2                	mov    edx,eax
  80624f:	8b 05 fb 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc225fb]        # 428850 <head>
  806255:	39 c2                	cmp    edx,eax
  806257:	75 0a                	jne    806263 <request+0x59>
    {
        return -1;
  806259:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80625e:	e9 0d 01 00 00       	jmp    806370 <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  806263:	8b 05 eb 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc225eb]        # 428854 <tail>
  806269:	48 63 d0             	movsxd rdx,eax
  80626c:	48 89 d0             	mov    rax,rdx
  80626f:	48 01 c0             	add    rax,rax
  806272:	48 01 d0             	add    rax,rdx
  806275:	48 c1 e0 04          	shl    rax,0x4
  806279:	48 8d 90 24 5b 42 00 	lea    rdx,[rax+0x425b24]
  806280:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806283:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  806285:	8b 05 c9 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc225c9]        # 428854 <tail>
  80628b:	48 63 d0             	movsxd rdx,eax
  80628e:	48 89 d0             	mov    rax,rdx
  806291:	48 01 c0             	add    rax,rax
  806294:	48 01 d0             	add    rax,rdx
  806297:	48 c1 e0 04          	shl    rax,0x4
  80629b:	48 8d 90 20 5b 42 00 	lea    rdx,[rax+0x425b20]
  8062a2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8062a5:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  8062a7:	8b 05 a7 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc225a7]        # 428854 <tail>
  8062ad:	48 63 d0             	movsxd rdx,eax
  8062b0:	48 89 d0             	mov    rax,rdx
  8062b3:	48 01 c0             	add    rax,rax
  8062b6:	48 01 d0             	add    rax,rdx
  8062b9:	48 c1 e0 04          	shl    rax,0x4
  8062bd:	48 8d 90 28 5b 42 00 	lea    rdx,[rax+0x425b28]
  8062c4:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8062c7:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  8062c9:	8b 05 85 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22585]        # 428854 <tail>
  8062cf:	48 63 d0             	movsxd rdx,eax
  8062d2:	48 89 d0             	mov    rax,rdx
  8062d5:	48 01 c0             	add    rax,rax
  8062d8:	48 01 d0             	add    rax,rdx
  8062db:	48 c1 e0 04          	shl    rax,0x4
  8062df:	48 8d 90 2c 5b 42 00 	lea    rdx,[rax+0x425b2c]
  8062e6:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8062e9:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  8062eb:	8b 05 63 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22563]        # 428854 <tail>
  8062f1:	48 63 d0             	movsxd rdx,eax
  8062f4:	48 89 d0             	mov    rax,rdx
  8062f7:	48 01 c0             	add    rax,rax
  8062fa:	48 01 d0             	add    rax,rdx
  8062fd:	48 c1 e0 04          	shl    rax,0x4
  806301:	48 05 3c 5b 42 00    	add    rax,0x425b3c
  806307:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  80630d:	8b 05 41 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22541]        # 428854 <tail>
  806313:	48 63 d0             	movsxd rdx,eax
  806316:	48 89 d0             	mov    rax,rdx
  806319:	48 01 c0             	add    rax,rax
  80631c:	48 01 d0             	add    rax,rdx
  80631f:	48 c1 e0 04          	shl    rax,0x4
  806323:	48 8d 90 30 5b 42 00 	lea    rdx,[rax+0x425b30]
  80632a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80632e:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  806331:	8b 05 1d 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2251d]        # 428854 <tail>
  806337:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  80633a:	8b 05 14 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22514]        # 428854 <tail>
  806340:	8d 50 01             	lea    edx,[rax+0x1]
  806343:	48 63 c2             	movsxd rax,edx
  806346:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  80634d:	48 c1 e8 20          	shr    rax,0x20
  806351:	01 d0                	add    eax,edx
  806353:	c1 f8 07             	sar    eax,0x7
  806356:	89 d1                	mov    ecx,edx
  806358:	c1 f9 1f             	sar    ecx,0x1f
  80635b:	29 c8                	sub    eax,ecx
  80635d:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  806363:	89 d0                	mov    eax,edx
  806365:	29 c8                	sub    eax,ecx
  806367:	89 05 e7 24 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc224e7],eax        # 428854 <tail>
    return r;
  80636d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806370:	5d                   	pop    rbp
  806371:	c3                   	ret    

0000000000806372 <execute_request>:
int execute_request(){
  806372:	f3 0f 1e fa          	endbr64 
  806376:	55                   	push   rbp
  806377:	48 89 e5             	mov    rbp,rsp
  80637a:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  80637e:	48 8b 05 9b 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2249b]        # 428820 <running_req>
  806385:	48 85 c0             	test   rax,rax
  806388:	74 6a                	je     8063f4 <execute_request+0x82>
    {
        running_req->time++;
  80638a:	48 8b 05 8f 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2248f]        # 428820 <running_req>
  806391:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  806394:	83 c2 01             	add    edx,0x1
  806397:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  80639a:	48 8b 05 7f 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2247f]        # 428820 <running_req>
  8063a1:	8b 00                	mov    eax,DWORD PTR [rax]
  8063a3:	83 f8 02             	cmp    eax,0x2
  8063a6:	74 0a                	je     8063b2 <execute_request+0x40>
            return 2;
  8063a8:	b8 02 00 00 00       	mov    eax,0x2
  8063ad:	e9 b4 01 00 00       	jmp    806566 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  8063b2:	48 8b 05 67 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22467]        # 428820 <running_req>
  8063b9:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  8063bc:	83 f8 0a             	cmp    eax,0xa
  8063bf:	7e 29                	jle    8063ea <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  8063c1:	48 8b 05 58 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22458]        # 428820 <running_req>
  8063c8:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  8063cf:	48 8b 05 4a 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2244a]        # 428820 <running_req>
  8063d6:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  8063dd:	48 c7 05 38 24 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22438],0x0        # 428820 <running_req>
  8063e4:	00 00 00 00 
  8063e8:	eb 0a                	jmp    8063f4 <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  8063ea:	b8 02 00 00 00       	mov    eax,0x2
  8063ef:	e9 72 01 00 00       	jmp    806566 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  8063f4:	8b 15 56 24 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc22456]        # 428850 <head>
  8063fa:	8b 05 54 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22454]        # 428854 <tail>
  806400:	39 c2                	cmp    edx,eax
  806402:	75 0a                	jne    80640e <execute_request+0x9c>
  806404:	b8 01 00 00 00       	mov    eax,0x1
  806409:	e9 58 01 00 00       	jmp    806566 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  80640e:	8b 05 3c 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2243c]        # 428850 <head>
  806414:	48 63 d0             	movsxd rdx,eax
  806417:	48 89 d0             	mov    rax,rdx
  80641a:	48 01 c0             	add    rax,rax
  80641d:	48 01 d0             	add    rax,rdx
  806420:	48 c1 e0 04          	shl    rax,0x4
  806424:	48 05 20 5b 42 00    	add    rax,0x425b20
  80642a:	48 89 05 ef 23 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc223ef],rax        # 428820 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  806431:	8b 05 19 24 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22419]        # 428850 <head>
  806437:	8d 50 01             	lea    edx,[rax+0x1]
  80643a:	48 63 c2             	movsxd rax,edx
  80643d:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806444:	48 c1 e8 20          	shr    rax,0x20
  806448:	01 d0                	add    eax,edx
  80644a:	c1 f8 07             	sar    eax,0x7
  80644d:	89 d1                	mov    ecx,edx
  80644f:	c1 f9 1f             	sar    ecx,0x1f
  806452:	29 c8                	sub    eax,ecx
  806454:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  80645a:	89 d0                	mov    eax,edx
  80645c:	29 c8                	sub    eax,ecx
  80645e:	89 05 ec 23 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc223ec],eax        # 428850 <head>
    running_req->stat=REQ_STAT_WORKING;
  806464:	48 8b 05 b5 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc223b5]        # 428820 <running_req>
  80646b:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  806472:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  806479:	48 8b 05 a0 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc223a0]        # 428820 <running_req>
  806480:	8b 00                	mov    eax,DWORD PTR [rax]
  806482:	83 f8 03             	cmp    eax,0x3
  806485:	0f 84 ad 00 00 00    	je     806538 <execute_request+0x1c6>
  80648b:	83 f8 03             	cmp    eax,0x3
  80648e:	0f 8f bf 00 00 00    	jg     806553 <execute_request+0x1e1>
  806494:	83 f8 02             	cmp    eax,0x2
  806497:	0f 84 85 00 00 00    	je     806522 <execute_request+0x1b0>
  80649d:	83 f8 02             	cmp    eax,0x2
  8064a0:	0f 8f ad 00 00 00    	jg     806553 <execute_request+0x1e1>
  8064a6:	85 c0                	test   eax,eax
  8064a8:	74 0a                	je     8064b4 <execute_request+0x142>
  8064aa:	83 f8 01             	cmp    eax,0x1
  8064ad:	74 3c                	je     8064eb <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  8064af:	e9 9f 00 00 00       	jmp    806553 <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  8064b4:	48 8b 05 65 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22365]        # 428820 <running_req>
        r=async_read_disk(running_req->disk,\
  8064bb:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  8064bf:	48 8b 05 5a 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2235a]        # 428820 <running_req>
        r=async_read_disk(running_req->disk,\
  8064c6:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  8064c9:	48 8b 05 50 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22350]        # 428820 <running_req>
  8064d0:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  8064d3:	89 c6                	mov    esi,eax
  8064d5:	48 8b 05 44 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22344]        # 428820 <running_req>
  8064dc:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8064df:	89 c7                	mov    edi,eax
  8064e1:	e8 a7 00 00 00       	call   80658d <async_read_disk>
  8064e6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8064e9:	eb 69                	jmp    806554 <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  8064eb:	48 8b 05 2e 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2232e]        # 428820 <running_req>
        r=async_write_disk(running_req->disk,\
  8064f2:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  8064f6:	48 8b 05 23 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22323]        # 428820 <running_req>
        r=async_write_disk(running_req->disk,\
  8064fd:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  806500:	48 8b 05 19 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22319]        # 428820 <running_req>
  806507:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  80650a:	89 c6                	mov    esi,eax
  80650c:	48 8b 05 0d 23 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2230d]        # 428820 <running_req>
  806513:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806516:	89 c7                	mov    edi,eax
  806518:	e8 88 01 00 00       	call   8066a5 <async_write_disk>
  80651d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806520:	eb 32                	jmp    806554 <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  806522:	48 8b 05 f7 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc222f7]        # 428820 <running_req>
  806529:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80652c:	89 c7                	mov    edi,eax
  80652e:	e8 8f 06 00 00       	call   806bc2 <async_check_disk>
  806533:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806536:	eb 1c                	jmp    806554 <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  806538:	48 8b 05 e1 22 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc222e1]        # 428820 <running_req>
  80653f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806542:	89 c7                	mov    edi,eax
  806544:	b8 00 00 00 00       	mov    eax,0x0
  806549:	e8 1a 00 00 00       	call   806568 <async_reset_disk>
  80654e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806551:	eb 01                	jmp    806554 <execute_request+0x1e2>
        break;
  806553:	90                   	nop
    }
    if(r==-1)return -1;
  806554:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  806558:	75 07                	jne    806561 <execute_request+0x1ef>
  80655a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80655f:	eb 05                	jmp    806566 <execute_request+0x1f4>
    return 0;
  806561:	b8 00 00 00 00       	mov    eax,0x0
}
  806566:	c9                   	leave  
  806567:	c3                   	ret    

0000000000806568 <async_reset_disk>:
int async_reset_disk(int disk)
{
  806568:	f3 0f 1e fa          	endbr64 
  80656c:	55                   	push   rbp
  80656d:	48 89 e5             	mov    rbp,rsp
  806570:	48 83 ec 10          	sub    rsp,0x10
  806574:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  806577:	be 0c 00 00 00       	mov    esi,0xc
  80657c:	bf f6 03 00 00       	mov    edi,0x3f6
  806581:	e8 ea e3 ff ff       	call   804970 <outb>
    return 0;
  806586:	b8 00 00 00 00       	mov    eax,0x0
}
  80658b:	c9                   	leave  
  80658c:	c3                   	ret    

000000000080658d <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  80658d:	f3 0f 1e fa          	endbr64 
  806591:	55                   	push   rbp
  806592:	48 89 e5             	mov    rbp,rsp
  806595:	48 83 ec 30          	sub    rsp,0x30
  806599:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80659c:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80659f:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8065a2:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  8065a6:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  8065ac:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  8065b3:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  8065b7:	74 06                	je     8065bf <async_read_disk+0x32>
  8065b9:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8065bd:	75 06                	jne    8065c5 <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  8065bf:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  8065c5:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8065c9:	74 06                	je     8065d1 <async_read_disk+0x44>
  8065cb:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  8065cf:	75 07                	jne    8065d8 <async_read_disk+0x4b>
        slave_disk=1;
  8065d1:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  8065d8:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8065db:	0f b6 d0             	movzx  edx,al
  8065de:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8065e2:	83 c0 02             	add    eax,0x2
  8065e5:	0f b7 c0             	movzx  eax,ax
  8065e8:	89 d6                	mov    esi,edx
  8065ea:	89 c7                	mov    edi,eax
  8065ec:	e8 7f e3 ff ff       	call   804970 <outb>
    outb(port+3,lba&0xff);
  8065f1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8065f4:	0f b6 d0             	movzx  edx,al
  8065f7:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8065fb:	83 c0 03             	add    eax,0x3
  8065fe:	0f b7 c0             	movzx  eax,ax
  806601:	89 d6                	mov    esi,edx
  806603:	89 c7                	mov    edi,eax
  806605:	e8 66 e3 ff ff       	call   804970 <outb>
    outb(port+4,(lba>>8)&0xff);
  80660a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80660d:	c1 e8 08             	shr    eax,0x8
  806610:	0f b6 d0             	movzx  edx,al
  806613:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806617:	83 c0 04             	add    eax,0x4
  80661a:	0f b7 c0             	movzx  eax,ax
  80661d:	89 d6                	mov    esi,edx
  80661f:	89 c7                	mov    edi,eax
  806621:	e8 4a e3 ff ff       	call   804970 <outb>
    outb(port+5,(lba>>16)&0xff);
  806626:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806629:	c1 e8 10             	shr    eax,0x10
  80662c:	0f b6 d0             	movzx  edx,al
  80662f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806633:	83 c0 05             	add    eax,0x5
  806636:	0f b7 c0             	movzx  eax,ax
  806639:	89 d6                	mov    esi,edx
  80663b:	89 c7                	mov    edi,eax
  80663d:	e8 2e e3 ff ff       	call   804970 <outb>
    char drv=slave_disk?0x10:0;
  806642:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806646:	74 07                	je     80664f <async_read_disk+0xc2>
  806648:	b8 10 00 00 00       	mov    eax,0x10
  80664d:	eb 05                	jmp    806654 <async_read_disk+0xc7>
  80664f:	b8 00 00 00 00       	mov    eax,0x0
  806654:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  806657:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80665a:	c1 e8 18             	shr    eax,0x18
  80665d:	83 e0 0f             	and    eax,0xf
  806660:	89 c2                	mov    edx,eax
  806662:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  806666:	09 d0                	or     eax,edx
  806668:	83 c8 e0             	or     eax,0xffffffe0
  80666b:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  80666e:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  806672:	0f b6 d0             	movzx  edx,al
  806675:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806679:	83 c0 06             	add    eax,0x6
  80667c:	0f b7 c0             	movzx  eax,ax
  80667f:	89 d6                	mov    esi,edx
  806681:	89 c7                	mov    edi,eax
  806683:	e8 e8 e2 ff ff       	call   804970 <outb>
    outb(port+7,DISK_CMD_READ);
  806688:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80668c:	83 c0 07             	add    eax,0x7
  80668f:	0f b7 c0             	movzx  eax,ax
  806692:	be 20 00 00 00       	mov    esi,0x20
  806697:	89 c7                	mov    edi,eax
  806699:	e8 d2 e2 ff ff       	call   804970 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  80669e:	b8 00 00 00 00       	mov    eax,0x0
}
  8066a3:	c9                   	leave  
  8066a4:	c3                   	ret    

00000000008066a5 <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  8066a5:	f3 0f 1e fa          	endbr64 
  8066a9:	55                   	push   rbp
  8066aa:	48 89 e5             	mov    rbp,rsp
  8066ad:	48 83 ec 30          	sub    rsp,0x30
  8066b1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8066b4:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8066b7:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8066ba:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  8066be:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  8066c4:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  8066cb:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  8066cf:	74 06                	je     8066d7 <async_write_disk+0x32>
  8066d1:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8066d5:	75 06                	jne    8066dd <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  8066d7:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  8066dd:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8066e1:	74 06                	je     8066e9 <async_write_disk+0x44>
  8066e3:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  8066e7:	75 07                	jne    8066f0 <async_write_disk+0x4b>
        slave_disk=1;
  8066e9:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  8066f0:	bf f7 00 00 00       	mov    edi,0xf7
  8066f5:	e8 8f e2 ff ff       	call   804989 <inb>
  8066fa:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  8066fd:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  806701:	83 e0 01             	and    eax,0x1
  806704:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  806707:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  80670b:	74 0a                	je     806717 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  80670d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806712:	e9 d5 00 00 00       	jmp    8067ec <async_write_disk+0x147>
        }
        t&=0x88;
  806717:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  80671b:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  80671f:	74 02                	je     806723 <async_write_disk+0x7e>
    {
  806721:	eb cd                	jmp    8066f0 <async_write_disk+0x4b>
        if(t==0x8)break;
  806723:	90                   	nop
    }
    outb(port+2,sec_n);
  806724:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806727:	0f b6 d0             	movzx  edx,al
  80672a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80672e:	83 c0 02             	add    eax,0x2
  806731:	0f b7 c0             	movzx  eax,ax
  806734:	89 d6                	mov    esi,edx
  806736:	89 c7                	mov    edi,eax
  806738:	e8 33 e2 ff ff       	call   804970 <outb>
    outb(port+3,lba&0xff);
  80673d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806740:	0f b6 d0             	movzx  edx,al
  806743:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806747:	83 c0 03             	add    eax,0x3
  80674a:	0f b7 c0             	movzx  eax,ax
  80674d:	89 d6                	mov    esi,edx
  80674f:	89 c7                	mov    edi,eax
  806751:	e8 1a e2 ff ff       	call   804970 <outb>
    outb(port+4,(lba>>8)&0xff);
  806756:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806759:	c1 e8 08             	shr    eax,0x8
  80675c:	0f b6 d0             	movzx  edx,al
  80675f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806763:	83 c0 04             	add    eax,0x4
  806766:	0f b7 c0             	movzx  eax,ax
  806769:	89 d6                	mov    esi,edx
  80676b:	89 c7                	mov    edi,eax
  80676d:	e8 fe e1 ff ff       	call   804970 <outb>
    outb(port+5,(lba>>16)&0xff);
  806772:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806775:	c1 e8 10             	shr    eax,0x10
  806778:	0f b6 d0             	movzx  edx,al
  80677b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80677f:	83 c0 05             	add    eax,0x5
  806782:	0f b7 c0             	movzx  eax,ax
  806785:	89 d6                	mov    esi,edx
  806787:	89 c7                	mov    edi,eax
  806789:	e8 e2 e1 ff ff       	call   804970 <outb>
    char drv=slave_disk?0x10:0;
  80678e:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806792:	74 07                	je     80679b <async_write_disk+0xf6>
  806794:	b8 10 00 00 00       	mov    eax,0x10
  806799:	eb 05                	jmp    8067a0 <async_write_disk+0xfb>
  80679b:	b8 00 00 00 00       	mov    eax,0x0
  8067a0:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  8067a3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8067a6:	c1 e8 18             	shr    eax,0x18
  8067a9:	83 e0 0f             	and    eax,0xf
  8067ac:	89 c2                	mov    edx,eax
  8067ae:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  8067b2:	09 d0                	or     eax,edx
  8067b4:	83 c8 e0             	or     eax,0xffffffe0
  8067b7:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  8067ba:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  8067be:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8067c2:	83 c0 06             	add    eax,0x6
  8067c5:	0f b7 c0             	movzx  eax,ax
  8067c8:	89 d6                	mov    esi,edx
  8067ca:	89 c7                	mov    edi,eax
  8067cc:	e8 9f e1 ff ff       	call   804970 <outb>
    outb(port+7,DISK_CMD_WRITE);
  8067d1:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8067d5:	83 c0 07             	add    eax,0x7
  8067d8:	0f b7 c0             	movzx  eax,ax
  8067db:	be 30 00 00 00       	mov    esi,0x30
  8067e0:	89 c7                	mov    edi,eax
  8067e2:	e8 89 e1 ff ff       	call   804970 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  8067e7:	b8 00 00 00 00       	mov    eax,0x0
}
  8067ec:	c9                   	leave  
  8067ed:	c3                   	ret    

00000000008067ee <read_disk>:
int read_disk(driver_args* args)
{
  8067ee:	f3 0f 1e fa          	endbr64 
  8067f2:	55                   	push   rbp
  8067f3:	48 89 e5             	mov    rbp,rsp
  8067f6:	48 83 ec 20          	sub    rsp,0x20
  8067fa:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  8067fe:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806802:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806805:	48 98                	cdqe   
  806807:	48 89 c2             	mov    rdx,rax
  80680a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80680e:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806811:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806815:	8b 00                	mov    eax,DWORD PTR [rax]
  806817:	89 ce                	mov    esi,ecx
  806819:	89 c7                	mov    edi,eax
  80681b:	e8 8c 05 00 00       	call   806dac <read_disk_asm>
  806820:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  806823:	48 8b 05 f6 1f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21ff6]        # 428820 <running_req>
  80682a:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  806831:	48 8b 05 e8 1f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21fe8]        # 428820 <running_req>
  806838:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  80683c:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  806843:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806846:	48 c7 05 cf 1f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21fcf],0x0        # 428820 <running_req>
  80684d:	00 00 00 00 
    return ret;
  806851:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806854:	c9                   	leave  
  806855:	c3                   	ret    

0000000000806856 <write_disk>:
int write_disk(driver_args* args)
{
  806856:	f3 0f 1e fa          	endbr64 
  80685a:	55                   	push   rbp
  80685b:	48 89 e5             	mov    rbp,rsp
  80685e:	48 83 ec 20          	sub    rsp,0x20
  806862:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  806866:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80686a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80686d:	48 98                	cdqe   
  80686f:	48 89 c2             	mov    rdx,rax
  806872:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806876:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806879:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80687d:	8b 00                	mov    eax,DWORD PTR [rax]
  80687f:	89 ce                	mov    esi,ecx
  806881:	89 c7                	mov    edi,eax
  806883:	e8 a4 05 00 00       	call   806e2c <write_disk_asm>
  806888:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  80688b:	48 8b 05 8e 1f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21f8e]        # 428820 <running_req>
  806892:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  806899:	48 8b 05 80 1f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21f80]        # 428820 <running_req>
  8068a0:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8068a4:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8068ab:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8068ae:	48 c7 05 67 1f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21f67],0x0        # 428820 <running_req>
  8068b5:	00 00 00 00 
    return ret;
  8068b9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8068bc:	c9                   	leave  
  8068bd:	c3                   	ret    

00000000008068be <chk_result>:
int chk_result(int r)
{
  8068be:	f3 0f 1e fa          	endbr64 
  8068c2:	55                   	push   rbp
  8068c3:	48 89 e5             	mov    rbp,rsp
  8068c6:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  8068c9:	90                   	nop
  8068ca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8068cd:	48 63 d0             	movsxd rdx,eax
  8068d0:	48 89 d0             	mov    rax,rdx
  8068d3:	48 01 c0             	add    rax,rax
  8068d6:	48 01 d0             	add    rax,rdx
  8068d9:	48 c1 e0 04          	shl    rax,0x4
  8068dd:	48 05 3c 5b 42 00    	add    rax,0x425b3c
  8068e3:	8b 00                	mov    eax,DWORD PTR [rax]
  8068e5:	83 f8 03             	cmp    eax,0x3
  8068e8:	75 e0                	jne    8068ca <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  8068ea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8068ed:	48 63 d0             	movsxd rdx,eax
  8068f0:	48 89 d0             	mov    rax,rdx
  8068f3:	48 01 c0             	add    rax,rax
  8068f6:	48 01 d0             	add    rax,rdx
  8068f9:	48 c1 e0 04          	shl    rax,0x4
  8068fd:	48 05 40 5b 42 00    	add    rax,0x425b40
  806903:	8b 00                	mov    eax,DWORD PTR [rax]
  806905:	83 f8 01             	cmp    eax,0x1
  806908:	0f 94 c0             	sete   al
  80690b:	0f b6 c0             	movzx  eax,al
}
  80690e:	5d                   	pop    rbp
  80690f:	c3                   	ret    

0000000000806910 <disk_existent>:
int disk_existent(int disk)
{
  806910:	f3 0f 1e fa          	endbr64 
  806914:	55                   	push   rbp
  806915:	48 89 e5             	mov    rbp,rsp
  806918:	48 83 ec 10          	sub    rsp,0x10
  80691c:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  80691f:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  806923:	74 5f                	je     806984 <disk_existent+0x74>
  806925:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  806929:	7f 6e                	jg     806999 <disk_existent+0x89>
  80692b:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  80692f:	74 3e                	je     80696f <disk_existent+0x5f>
  806931:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  806935:	7f 62                	jg     806999 <disk_existent+0x89>
  806937:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80693b:	74 08                	je     806945 <disk_existent+0x35>
  80693d:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  806941:	74 17                	je     80695a <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  806943:	eb 54                	jmp    806999 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  806945:	bf f4 1d 81 00       	mov    edi,0x811df4
  80694a:	e8 54 c4 ff ff       	call   802da3 <sys_find_dev>
  80694f:	83 f8 ff             	cmp    eax,0xffffffff
  806952:	0f 95 c0             	setne  al
  806955:	0f b6 c0             	movzx  eax,al
  806958:	eb 45                	jmp    80699f <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  80695a:	bf f8 1d 81 00       	mov    edi,0x811df8
  80695f:	e8 3f c4 ff ff       	call   802da3 <sys_find_dev>
  806964:	83 f8 ff             	cmp    eax,0xffffffff
  806967:	0f 95 c0             	setne  al
  80696a:	0f b6 c0             	movzx  eax,al
  80696d:	eb 30                	jmp    80699f <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  80696f:	bf fc 1d 81 00       	mov    edi,0x811dfc
  806974:	e8 2a c4 ff ff       	call   802da3 <sys_find_dev>
  806979:	83 f8 ff             	cmp    eax,0xffffffff
  80697c:	0f 95 c0             	setne  al
  80697f:	0f b6 c0             	movzx  eax,al
  806982:	eb 1b                	jmp    80699f <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  806984:	bf 00 1e 81 00       	mov    edi,0x811e00
  806989:	e8 15 c4 ff ff       	call   802da3 <sys_find_dev>
  80698e:	83 f8 ff             	cmp    eax,0xffffffff
  806991:	0f 95 c0             	setne  al
  806994:	0f b6 c0             	movzx  eax,al
  806997:	eb 06                	jmp    80699f <disk_existent+0x8f>
        break;
  806999:	90                   	nop
    }
    return 0;
  80699a:	b8 00 00 00 00       	mov    eax,0x0
}
  80699f:	c9                   	leave  
  8069a0:	c3                   	ret    

00000000008069a1 <hd_iterate>:
int hd_iterate()
{
  8069a1:	f3 0f 1e fa          	endbr64 
  8069a5:	55                   	push   rbp
  8069a6:	48 89 e5             	mov    rbp,rsp
  8069a9:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  8069b0:	41 b8 00 00 00 00    	mov    r8d,0x0
  8069b6:	b9 01 00 00 00       	mov    ecx,0x1
  8069bb:	ba 00 00 00 00       	mov    edx,0x0
  8069c0:	be 02 00 00 00       	mov    esi,0x2
  8069c5:	bf 00 00 00 00       	mov    edi,0x0
  8069ca:	e8 3b f8 ff ff       	call   80620a <request>
  8069cf:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  8069d2:	41 b8 00 00 00 00    	mov    r8d,0x0
  8069d8:	b9 01 00 00 00       	mov    ecx,0x1
  8069dd:	ba 00 00 00 00       	mov    edx,0x0
  8069e2:	be 02 00 00 00       	mov    esi,0x2
  8069e7:	bf 01 00 00 00       	mov    edi,0x1
  8069ec:	e8 19 f8 ff ff       	call   80620a <request>
  8069f1:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  8069f4:	41 b8 00 00 00 00    	mov    r8d,0x0
  8069fa:	b9 01 00 00 00       	mov    ecx,0x1
  8069ff:	ba 00 00 00 00       	mov    edx,0x0
  806a04:	be 02 00 00 00       	mov    esi,0x2
  806a09:	bf 02 00 00 00       	mov    edi,0x2
  806a0e:	e8 f7 f7 ff ff       	call   80620a <request>
  806a13:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  806a16:	41 b8 00 00 00 00    	mov    r8d,0x0
  806a1c:	b9 01 00 00 00       	mov    ecx,0x1
  806a21:	ba 00 00 00 00       	mov    edx,0x0
  806a26:	be 02 00 00 00       	mov    esi,0x2
  806a2b:	bf 03 00 00 00       	mov    edi,0x3
  806a30:	e8 d5 f7 ff ff       	call   80620a <request>
  806a35:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<4;i++)
  806a38:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806a3f:	e9 72 01 00 00       	jmp    806bb6 <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  806a44:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806a48:	74 3b                	je     806a85 <hd_iterate+0xe4>
  806a4a:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806a4e:	7f 3e                	jg     806a8e <hd_iterate+0xed>
  806a50:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806a54:	74 26                	je     806a7c <hd_iterate+0xdb>
  806a56:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806a5a:	7f 32                	jg     806a8e <hd_iterate+0xed>
  806a5c:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  806a60:	74 08                	je     806a6a <hd_iterate+0xc9>
  806a62:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  806a66:	74 0b                	je     806a73 <hd_iterate+0xd2>
  806a68:	eb 24                	jmp    806a8e <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  806a6a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  806a71:	eb 25                	jmp    806a98 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  806a73:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  806a7a:	eb 1c                	jmp    806a98 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  806a7c:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  806a83:	eb 13                	jmp    806a98 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  806a85:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  806a8c:	eb 0a                	jmp    806a98 <hd_iterate+0xf7>
        default:
            return -1;
  806a8e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806a93:	e9 28 01 00 00       	jmp    806bc0 <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  806a98:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806a9b:	48 98                	cdqe   
  806a9d:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  806aa1:	89 c7                	mov    edi,eax
  806aa3:	e8 16 fe ff ff       	call   8068be <chk_result>
  806aa8:	85 c0                	test   eax,eax
  806aaa:	0f 84 81 00 00 00    	je     806b31 <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  806ab0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806ab3:	89 c6                	mov    esi,eax
  806ab5:	bf 04 1e 81 00       	mov    edi,0x811e04
  806aba:	b8 00 00 00 00       	mov    eax,0x0
  806abf:	e8 d1 a1 ff ff       	call   800c95 <printf>
            //新硬盘
            device hd={
  806ac4:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  806acb:	b8 00 00 00 00       	mov    eax,0x0
  806ad0:	b9 15 00 00 00       	mov    ecx,0x15
  806ad5:	48 89 d7             	mov    rdi,rdx
  806ad8:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  806adb:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806ade:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  806ae4:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  806aeb:	00 00 00 
  806aee:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  806af5:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  806af8:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  806afc:	7f 07                	jg     806b05 <hd_iterate+0x164>
  806afe:	b8 f0 01 00 00       	mov    eax,0x1f0
  806b03:	eb 05                	jmp    806b0a <hd_iterate+0x169>
  806b05:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  806b0a:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  806b10:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  806b17:	48 89 c7             	mov    rdi,rax
  806b1a:	e8 4c be ff ff       	call   80296b <reg_device>
  806b1f:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  806b22:	48 63 d2             	movsxd rdx,edx
  806b25:	89 04 95 40 88 42 00 	mov    DWORD PTR [rdx*4+0x428840],eax
  806b2c:	e9 81 00 00 00       	jmp    806bb2 <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  806b31:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806b34:	48 98                	cdqe   
  806b36:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  806b3a:	89 c7                	mov    edi,eax
  806b3c:	e8 7d fd ff ff       	call   8068be <chk_result>
  806b41:	85 c0                	test   eax,eax
  806b43:	75 6d                	jne    806bb2 <hd_iterate+0x211>
        {
            switch (i)
  806b45:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806b49:	74 3e                	je     806b89 <hd_iterate+0x1e8>
  806b4b:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806b4f:	7f 41                	jg     806b92 <hd_iterate+0x1f1>
  806b51:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806b55:	74 28                	je     806b7f <hd_iterate+0x1de>
  806b57:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806b5b:	7f 35                	jg     806b92 <hd_iterate+0x1f1>
  806b5d:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  806b61:	74 08                	je     806b6b <hd_iterate+0x1ca>
  806b63:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  806b67:	74 0c                	je     806b75 <hd_iterate+0x1d4>
  806b69:	eb 27                	jmp    806b92 <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  806b6b:	48 c7 45 f8 f4 1d 81 	mov    QWORD PTR [rbp-0x8],0x811df4
  806b72:	00 
  806b73:	eb 1d                	jmp    806b92 <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  806b75:	48 c7 45 f8 f8 1d 81 	mov    QWORD PTR [rbp-0x8],0x811df8
  806b7c:	00 
  806b7d:	eb 13                	jmp    806b92 <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  806b7f:	48 c7 45 f8 fc 1d 81 	mov    QWORD PTR [rbp-0x8],0x811dfc
  806b86:	00 
  806b87:	eb 09                	jmp    806b92 <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  806b89:	48 c7 45 f8 00 1e 81 	mov    QWORD PTR [rbp-0x8],0x811e00
  806b90:	00 
  806b91:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  806b92:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806b96:	48 89 c7             	mov    rdi,rax
  806b99:	e8 05 c2 ff ff       	call   802da3 <sys_find_dev>
  806b9e:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  806ba1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806ba4:	89 c7                	mov    edi,eax
  806ba6:	e8 cc c8 ff ff       	call   803477 <get_dev>
  806bab:	89 c7                	mov    edi,eax
  806bad:	e8 18 c8 ff ff       	call   8033ca <dispose_device>
    for(int i=0;i<4;i++)
  806bb2:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  806bb6:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806bba:	0f 8e 84 fe ff ff    	jle    806a44 <hd_iterate+0xa3>
        }

    }
}
  806bc0:	c9                   	leave  
  806bc1:	c3                   	ret    

0000000000806bc2 <async_check_disk>:

int async_check_disk(int disk)
{
  806bc2:	f3 0f 1e fa          	endbr64 
  806bc6:	55                   	push   rbp
  806bc7:	48 89 e5             	mov    rbp,rsp
  806bca:	48 83 ec 20          	sub    rsp,0x20
  806bce:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  806bd1:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  806bd7:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806bdd:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806be1:	74 06                	je     806be9 <async_check_disk+0x27>
  806be3:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806be7:	75 06                	jne    806bef <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  806be9:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  806bef:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806bf3:	74 06                	je     806bfb <async_check_disk+0x39>
  806bf5:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806bf9:	75 06                	jne    806c01 <async_check_disk+0x3f>
        chkcmd=0xf0;
  806bfb:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  806c01:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c05:	83 c0 02             	add    eax,0x2
  806c08:	0f b7 c0             	movzx  eax,ax
  806c0b:	be 01 00 00 00       	mov    esi,0x1
  806c10:	89 c7                	mov    edi,eax
  806c12:	e8 59 dd ff ff       	call   804970 <outb>
    outb(disknr+3,0);
  806c17:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c1b:	83 c0 03             	add    eax,0x3
  806c1e:	0f b7 c0             	movzx  eax,ax
  806c21:	be 00 00 00 00       	mov    esi,0x0
  806c26:	89 c7                	mov    edi,eax
  806c28:	e8 43 dd ff ff       	call   804970 <outb>
    outb(disknr+4,0);
  806c2d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c31:	83 c0 04             	add    eax,0x4
  806c34:	0f b7 c0             	movzx  eax,ax
  806c37:	be 00 00 00 00       	mov    esi,0x0
  806c3c:	89 c7                	mov    edi,eax
  806c3e:	e8 2d dd ff ff       	call   804970 <outb>
    outb(disknr+5,0);
  806c43:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c47:	83 c0 05             	add    eax,0x5
  806c4a:	0f b7 c0             	movzx  eax,ax
  806c4d:	be 00 00 00 00       	mov    esi,0x0
  806c52:	89 c7                	mov    edi,eax
  806c54:	e8 17 dd ff ff       	call   804970 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  806c59:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  806c5d:	0f b6 d0             	movzx  edx,al
  806c60:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c64:	83 c0 06             	add    eax,0x6
  806c67:	0f b7 c0             	movzx  eax,ax
  806c6a:	89 d6                	mov    esi,edx
  806c6c:	89 c7                	mov    edi,eax
  806c6e:	e8 fd dc ff ff       	call   804970 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  806c73:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c77:	83 c0 07             	add    eax,0x7
  806c7a:	0f b7 c0             	movzx  eax,ax
  806c7d:	be 90 00 00 00       	mov    esi,0x90
  806c82:	89 c7                	mov    edi,eax
  806c84:	e8 e7 dc ff ff       	call   804970 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  806c89:	b8 00 00 00 00       	mov    eax,0x0
}
  806c8e:	c9                   	leave  
  806c8f:	c3                   	ret    

0000000000806c90 <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  806c90:	f3 0f 1e fa          	endbr64 
  806c94:	55                   	push   rbp
  806c95:	48 89 e5             	mov    rbp,rsp
  806c98:	48 83 ec 18          	sub    rsp,0x18
  806c9c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  806ca0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  806ca7:	eb 04                	jmp    806cad <hd_do_req+0x1d>
  806ca9:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806cad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806cb0:	48 98                	cdqe   
  806cb2:	8b 14 85 40 88 42 00 	mov    edx,DWORD PTR [rax*4+0x428840]
  806cb9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806cbd:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  806cc3:	39 c2                	cmp    edx,eax
  806cc5:	75 e2                	jne    806ca9 <hd_do_req+0x19>
    switch (args->cmd)
  806cc7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806ccb:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  806cd1:	83 f8 04             	cmp    eax,0x4
  806cd4:	74 72                	je     806d48 <hd_do_req+0xb8>
  806cd6:	83 f8 04             	cmp    eax,0x4
  806cd9:	0f 8f 96 00 00 00    	jg     806d75 <hd_do_req+0xe5>
  806cdf:	83 f8 02             	cmp    eax,0x2
  806ce2:	74 0a                	je     806cee <hd_do_req+0x5e>
  806ce4:	83 f8 03             	cmp    eax,0x3
  806ce7:	74 32                	je     806d1b <hd_do_req+0x8b>
  806ce9:	e9 87 00 00 00       	jmp    806d75 <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  806cee:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806cf2:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806cf5:	48 98                	cdqe   
  806cf7:	48 89 c6             	mov    rsi,rax
  806cfa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806cfe:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806d01:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d05:	8b 10                	mov    edx,DWORD PTR [rax]
  806d07:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d0a:	49 89 f0             	mov    r8,rsi
  806d0d:	be 00 00 00 00       	mov    esi,0x0
  806d12:	89 c7                	mov    edi,eax
  806d14:	e8 f1 f4 ff ff       	call   80620a <request>
        break;
  806d19:	eb 61                	jmp    806d7c <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  806d1b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d1f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806d22:	48 98                	cdqe   
  806d24:	48 89 c6             	mov    rsi,rax
  806d27:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d2b:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806d2e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d32:	8b 10                	mov    edx,DWORD PTR [rax]
  806d34:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d37:	49 89 f0             	mov    r8,rsi
  806d3a:	be 01 00 00 00       	mov    esi,0x1
  806d3f:	89 c7                	mov    edi,eax
  806d41:	e8 c4 f4 ff ff       	call   80620a <request>
        break;
  806d46:	eb 34                	jmp    806d7c <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  806d48:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d4c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806d4f:	48 98                	cdqe   
  806d51:	48 89 c6             	mov    rsi,rax
  806d54:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d58:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806d5b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d5f:	8b 10                	mov    edx,DWORD PTR [rax]
  806d61:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d64:	49 89 f0             	mov    r8,rsi
  806d67:	be 02 00 00 00       	mov    esi,0x2
  806d6c:	89 c7                	mov    edi,eax
  806d6e:	e8 97 f4 ff ff       	call   80620a <request>
        break;
  806d73:	eb 07                	jmp    806d7c <hd_do_req+0xec>
    default:return -1;
  806d75:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806d7a:	eb 1e                	jmp    806d9a <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  806d7c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d80:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  806d87:	00 00 00 
    running_devman_req=args;
  806d8a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d8e:	48 89 05 93 1a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21a93],rax        # 428828 <running_devman_req>
    return 0;
  806d95:	b8 00 00 00 00       	mov    eax,0x0
  806d9a:	c9                   	leave  
  806d9b:	c3                   	ret    
  806d9c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]

0000000000806da0 <disk_int_handler>:
  806da0:	e8 f9 db ff ff       	call   80499e <eoi>
  806da5:	e8 71 f2 ff ff       	call   80601b <disk_int_handler_c>
  806daa:	48 cf                	iretq  

0000000000806dac <read_disk_asm>:
  806dac:	55                   	push   rbp
  806dad:	89 e5                	mov    ebp,esp
  806daf:	66 ba f7 01          	mov    dx,0x1f7
  806db3:	31 c9                	xor    ecx,ecx
  806db5:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  806dba:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  806dbf:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  806dc4:	89 c6                	mov    esi,eax
  806dc6:	66 ba f2 01          	mov    dx,0x1f2
  806dca:	88 c8                	mov    al,cl
  806dcc:	ee                   	out    dx,al
  806dcd:	66 ba f3 01          	mov    dx,0x1f3
  806dd1:	89 f0                	mov    eax,esi
  806dd3:	ee                   	out    dx,al
  806dd4:	66 ff c2             	inc    dx
  806dd7:	c1 e8 08             	shr    eax,0x8
  806dda:	ee                   	out    dx,al
  806ddb:	66 ff c2             	inc    dx
  806dde:	c1 e8 08             	shr    eax,0x8
  806de1:	ee                   	out    dx,al
  806de2:	66 ff c2             	inc    dx
  806de5:	66 c1 e8 08          	shr    ax,0x8
  806de9:	24 0f                	and    al,0xf
  806deb:	0c e0                	or     al,0xe0
  806ded:	ee                   	out    dx,al
  806dee:	66 ff c2             	inc    dx
  806df1:	b0 20                	mov    al,0x20
  806df3:	ee                   	out    dx,al

0000000000806df4 <read_disk_asm.wait>:
  806df4:	90                   	nop
  806df5:	ec                   	in     al,dx
  806df6:	24 88                	and    al,0x88
  806df8:	3c 08                	cmp    al,0x8
  806dfa:	75 f8                	jne    806df4 <read_disk_asm.wait>
  806dfc:	66 89 d7             	mov    di,dx
  806dff:	89 c8                	mov    eax,ecx
  806e01:	66 b9 00 01          	mov    cx,0x100
  806e05:	66 f7 e1             	mul    cx
  806e08:	89 c1                	mov    ecx,eax
  806e0a:	66 ba f0 01          	mov    dx,0x1f0

0000000000806e0e <read_disk_asm.read>:
  806e0e:	66 ed                	in     ax,dx
  806e10:	66 67 89 03          	mov    WORD PTR [ebx],ax
  806e14:	83 c3 02             	add    ebx,0x2
  806e17:	e2 f5                	loop   806e0e <read_disk_asm.read>
  806e19:	c9                   	leave  
  806e1a:	b8 00 00 00 00       	mov    eax,0x0
  806e1f:	c3                   	ret    

0000000000806e20 <read_disk_asm.err_disk_reading>:
  806e20:	66 ba f1 01          	mov    dx,0x1f1
  806e24:	31 c0                	xor    eax,eax
  806e26:	66 ed                	in     ax,dx
  806e28:	89 ec                	mov    esp,ebp
  806e2a:	5d                   	pop    rbp
  806e2b:	c3                   	ret    

0000000000806e2c <write_disk_asm>:
  806e2c:	55                   	push   rbp
  806e2d:	89 e5                	mov    ebp,esp
  806e2f:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  806e34:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  806e39:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  806e3e:	50                   	push   rax
  806e3f:	66 ba f2 01          	mov    dx,0x1f2
  806e43:	88 c8                	mov    al,cl
  806e45:	ee                   	out    dx,al
  806e46:	58                   	pop    rax
  806e47:	66 ba f3 01          	mov    dx,0x1f3
  806e4b:	ee                   	out    dx,al
  806e4c:	c1 e8 08             	shr    eax,0x8
  806e4f:	66 ba f4 01          	mov    dx,0x1f4
  806e53:	ee                   	out    dx,al
  806e54:	c1 e8 08             	shr    eax,0x8
  806e57:	66 ba f5 01          	mov    dx,0x1f5
  806e5b:	ee                   	out    dx,al
  806e5c:	c1 e8 08             	shr    eax,0x8
  806e5f:	24 0f                	and    al,0xf
  806e61:	0c e0                	or     al,0xe0
  806e63:	66 ba f6 01          	mov    dx,0x1f6
  806e67:	ee                   	out    dx,al
  806e68:	66 ba f7 01          	mov    dx,0x1f7
  806e6c:	b0 30                	mov    al,0x30
  806e6e:	ee                   	out    dx,al

0000000000806e6f <write_disk_asm.not_ready2>:
  806e6f:	90                   	nop
  806e70:	ec                   	in     al,dx
  806e71:	24 88                	and    al,0x88
  806e73:	3c 08                	cmp    al,0x8
  806e75:	75 f8                	jne    806e6f <write_disk_asm.not_ready2>
  806e77:	89 c8                	mov    eax,ecx
  806e79:	66 b9 00 01          	mov    cx,0x100
  806e7d:	66 f7 e1             	mul    cx
  806e80:	89 c1                	mov    ecx,eax
  806e82:	66 ba f0 01          	mov    dx,0x1f0

0000000000806e86 <write_disk_asm.go_on_write>:
  806e86:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  806e8a:	66 ef                	out    dx,ax
  806e8c:	83 c3 02             	add    ebx,0x2
  806e8f:	e2 f5                	loop   806e86 <write_disk_asm.go_on_write>
  806e91:	89 ec                	mov    esp,ebp
  806e93:	5d                   	pop    rbp
  806e94:	c3                   	ret    

0000000000806e95 <init_fat16>:

int fat16_drvi;
extern driver drv_disk;
extern int disk_drvi;
int init_fat16()
{
  806e95:	f3 0f 1e fa          	endbr64 
  806e99:	55                   	push   rbp
  806e9a:	48 89 e5             	mov    rbp,rsp
  806e9d:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
    reg_device(&fat16_dev);
  806ea4:	bf c0 1e 81 00       	mov    edi,0x811ec0
  806ea9:	e8 bd ba ff ff       	call   80296b <reg_device>
    fat16_drvi=reg_driver(&fat16_drv);
  806eae:	bf 20 1e 81 00       	mov    edi,0x811e20
  806eb3:	e8 9b bd ff ff       	call   802c53 <reg_driver>
  806eb8:	89 05 06 9c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29c06],eax        # 430ac4 <fat16_drvi>
    driver_args arg;
    load(&arg);//syscall(SYSCALL_CALL_DRVFUNC,fat16_drvi,DRVF_OPEN,&arg,0,0);
  806ebe:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  806ec5:	48 89 c7             	mov    rdi,rax
  806ec8:	e8 26 00 00 00       	call   806ef3 <load>
    reg_vol(disk_drvi,fat16_drvi,"a");
  806ecd:	8b 0d f1 9b c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc29bf1]        # 430ac4 <fat16_drvi>
  806ed3:	8b 05 57 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21957]        # 428830 <disk_drvi>
  806ed9:	ba 68 1f 81 00       	mov    edx,0x811f68
  806ede:	89 ce                	mov    esi,ecx
  806ee0:	89 c7                	mov    edi,eax
  806ee2:	b8 00 00 00 00       	mov    eax,0x0
  806ee7:	e8 07 aa ff ff       	call   8018f3 <reg_vol>
    return 0;
  806eec:	b8 00 00 00 00       	mov    eax,0x0
}
  806ef1:	c9                   	leave  
  806ef2:	c3                   	ret    

0000000000806ef3 <load>:
int load(driver_args *args)
{
  806ef3:	f3 0f 1e fa          	endbr64 
  806ef7:	55                   	push   rbp
  806ef8:	48 89 e5             	mov    rbp,rsp
  806efb:	48 83 ec 20          	sub    rsp,0x20
  806eff:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    //sys_read superblock
    int req_id=-1;
  806f03:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    read_sec(&superblock,0,1);
  806f0a:	ba 01 00 00 00       	mov    edx,0x1
  806f0f:	be 00 00 00 00       	mov    esi,0x0
  806f14:	bf 60 88 42 00       	mov    edi,0x428860
  806f19:	e8 61 0b 00 00       	call   807a7f <read_sec>
    //只能一个一个读
    read_sec(fat,superblock.rsvdSec,superblock.secPerFAT);
  806f1e:	0f b7 05 51 19 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21951]        # 428876 <superblock+0x16>
  806f25:	0f b7 d0             	movzx  edx,ax
  806f28:	0f b7 05 3f 19 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2193f]        # 42886e <superblock+0xe>
  806f2f:	0f b7 c0             	movzx  eax,ax
  806f32:	89 c6                	mov    esi,eax
  806f34:	bf c0 ca 42 00       	mov    edi,0x42cac0
  806f39:	e8 41 0b 00 00       	call   807a7f <read_sec>

    //sys_read root
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  806f3e:	0f b7 05 29 19 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21929]        # 42886e <superblock+0xe>
  806f45:	0f b7 c8             	movzx  ecx,ax
  806f48:	0f b7 05 27 19 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21927]        # 428876 <superblock+0x16>
  806f4f:	0f b7 d0             	movzx  edx,ax
    superblock.numOfFAT;
  806f52:	0f b6 05 17 19 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21917]        # 428870 <superblock+0x10>
  806f59:	0f b6 c0             	movzx  eax,al
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  806f5c:	0f af c2             	imul   eax,edx
  806f5f:	01 c8                	add    eax,ecx
  806f61:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //printf("root sec num:%d\n",root_sec_num);
    //usually a root dir has 32 secs
    int root_sec_c=((u32)superblock.rootEntries* sizeof(dir_entry))/(u32)superblock.bytesPerSec;
  806f64:	0f b7 05 06 19 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21906]        # 428871 <superblock+0x11>
  806f6b:	0f b7 c0             	movzx  eax,ax
  806f6e:	48 c1 e0 05          	shl    rax,0x5
  806f72:	0f b7 15 f2 18 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc218f2]        # 42886b <superblock+0xb>
  806f79:	0f b7 ca             	movzx  ecx,dx
  806f7c:	ba 00 00 00 00       	mov    edx,0x0
  806f81:	48 f7 f1             	div    rcx
  806f84:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    read_sec(root_dir,root_sec_num,root_sec_c);
  806f87:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  806f8a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806f8d:	89 c6                	mov    esi,eax
  806f8f:	bf a0 88 42 00       	mov    edi,0x4288a0
  806f94:	e8 e6 0a 00 00       	call   807a7f <read_sec>

    cur_dir.fistCluNum=0;
  806f99:	66 c7 05 18 59 c2 ff 	mov    WORD PTR [rip+0xffffffffffc25918],0x0        # 42c8ba <cur_dir+0x1a>
  806fa0:	00 00 

    //set some vars
    //why? because the .bss won't be packed into bin so any init
    //of global var in .c is meaningless.
    clu_sec_balance=superblock.rsvdSec+32+32-2;//63;
  806fa2:	0f b7 05 c5 18 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc218c5]        # 42886e <superblock+0xe>
  806fa9:	0f b7 c0             	movzx  eax,ax
  806fac:	83 c0 3e             	add    eax,0x3e
  806faf:	89 05 4b 31 00 00    	mov    DWORD PTR [rip+0x314b],eax        # 80a100 <clu_sec_balance>
    //printf("clu sec bal:%d\n",clu_sec_balance);
    dir_depth=0;
  806fb5:	c7 05 01 9b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29b01],0x0        # 430ac0 <dir_depth>
  806fbc:	00 00 00 
    return 0;
  806fbf:	b8 00 00 00 00       	mov    eax,0x0

}
  806fc4:	c9                   	leave  
  806fc5:	c3                   	ret    

0000000000806fc6 <verify_name>:

//检查输入的文件名长度是否合法，以及是否出现非法字符（但是不检查大小写和.）
//返回值为布尔值。
int verify_name(char *str)
{
  806fc6:	f3 0f 1e fa          	endbr64 
  806fca:	55                   	push   rbp
  806fcb:	48 89 e5             	mov    rbp,rsp
  806fce:	48 83 ec 70          	sub    rsp,0x70
  806fd2:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
    char valid_ch[]="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,/![]|+";
  806fd6:	48 b8 61 62 63 64 65 	movabs rax,0x6867666564636261
  806fdd:	66 67 68 
  806fe0:	48 ba 69 6a 6b 6c 6d 	movabs rdx,0x706f6e6d6c6b6a69
  806fe7:	6e 6f 70 
  806fea:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  806fee:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  806ff2:	48 b8 71 72 73 74 75 	movabs rax,0x7877767574737271
  806ff9:	76 77 78 
  806ffc:	48 ba 79 7a 41 42 43 	movabs rdx,0x4645444342417a79
  807003:	44 45 46 
  807006:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  80700a:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  80700e:	48 b8 47 48 49 4a 4b 	movabs rax,0x4e4d4c4b4a494847
  807015:	4c 4d 4e 
  807018:	48 ba 4f 50 51 52 53 	movabs rdx,0x565554535251504f
  80701f:	54 55 56 
  807022:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  807026:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  80702a:	48 b8 57 58 59 5a 30 	movabs rax,0x333231305a595857
  807031:	31 32 33 
  807034:	48 ba 34 35 36 37 38 	movabs rdx,0x2f2c393837363534
  80703b:	39 2c 2f 
  80703e:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  807042:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  807046:	c7 45 e0 21 5b 5d 7c 	mov    DWORD PTR [rbp-0x20],0x7c5d5b21
  80704d:	66 c7 45 e4 2b 00    	mov    WORD PTR [rbp-0x1c],0x2b
    if(strlen(str)>11||strlen(str)==0) {
  807053:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807057:	48 89 c7             	mov    rdi,rax
  80705a:	e8 24 28 00 00       	call   809883 <strlen>
  80705f:	83 f8 0b             	cmp    eax,0xb
  807062:	7f 10                	jg     807074 <verify_name+0xae>
  807064:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807068:	48 89 c7             	mov    rdi,rax
  80706b:	e8 13 28 00 00       	call   809883 <strlen>
  807070:	85 c0                	test   eax,eax
  807072:	75 0a                	jne    80707e <verify_name+0xb8>
        //printf("length not valid\n");
        return 0;
  807074:	b8 00 00 00 00       	mov    eax,0x0
  807079:	e9 b3 01 00 00       	jmp    807231 <verify_name+0x26b>
    }
    int c=0,i=0,flag=0,vchf=1;
  80707e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807085:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80708c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  807093:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [rbp-0x18],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  80709a:	eb 6b                	jmp    807107 <verify_name+0x141>
    {
        int j=0;
  80709c:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        for(;j<sizeof(valid_ch);j++)
  8070a3:	eb 22                	jmp    8070c7 <verify_name+0x101>
            if(str[i]==valid_ch[j])break;
  8070a5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8070a8:	48 63 d0             	movsxd rdx,eax
  8070ab:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8070af:	48 01 d0             	add    rax,rdx
  8070b2:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8070b5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8070b8:	48 98                	cdqe   
  8070ba:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  8070bf:	38 c2                	cmp    dl,al
  8070c1:	74 0e                	je     8070d1 <verify_name+0x10b>
        for(;j<sizeof(valid_ch);j++)
  8070c3:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8070c7:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8070ca:	83 f8 45             	cmp    eax,0x45
  8070cd:	76 d6                	jbe    8070a5 <verify_name+0xdf>
  8070cf:	eb 01                	jmp    8070d2 <verify_name+0x10c>
            if(str[i]==valid_ch[j])break;
  8070d1:	90                   	nop
        if(j>=sizeof(valid_ch))
  8070d2:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8070d5:	83 f8 45             	cmp    eax,0x45
  8070d8:	76 0a                	jbe    8070e4 <verify_name+0x11e>
        {
            //printf("invalid char\n");
            return 0;//出现非法字符
  8070da:	b8 00 00 00 00       	mov    eax,0x0
  8070df:	e9 4d 01 00 00       	jmp    807231 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  8070e4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8070e7:	48 63 d0             	movsxd rdx,eax
  8070ea:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8070ee:	48 01 d0             	add    rax,rdx
  8070f1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070f4:	3c 20                	cmp    al,0x20
  8070f6:	74 07                	je     8070ff <verify_name+0x139>
  8070f8:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        c++;
  8070ff:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  807103:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807107:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80710a:	48 63 d0             	movsxd rdx,eax
  80710d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807111:	48 01 d0             	add    rax,rdx
  807114:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807117:	3c 2e                	cmp    al,0x2e
  807119:	74 18                	je     807133 <verify_name+0x16d>
  80711b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80711e:	48 63 d0             	movsxd rdx,eax
  807121:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807125:	48 01 d0             	add    rax,rdx
  807128:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80712b:	84 c0                	test   al,al
  80712d:	0f 85 69 ff ff ff    	jne    80709c <verify_name+0xd6>
    }
    if(c>8||flag==0){
  807133:	83 7d fc 08          	cmp    DWORD PTR [rbp-0x4],0x8
  807137:	7f 06                	jg     80713f <verify_name+0x179>
  807139:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80713d:	75 0a                	jne    807149 <verify_name+0x183>
        //printf("file name blank\n");
        return 0;//不能全是空格
  80713f:	b8 00 00 00 00       	mov    eax,0x0
  807144:	e9 e8 00 00 00       	jmp    807231 <verify_name+0x26b>
    }
    if(str[i]=='\0')//没有扩展名
  807149:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80714c:	48 63 d0             	movsxd rdx,eax
  80714f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807153:	48 01 d0             	add    rax,rdx
  807156:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807159:	84 c0                	test   al,al
  80715b:	75 0a                	jne    807167 <verify_name+0x1a1>
        return 1;
  80715d:	b8 01 00 00 00       	mov    eax,0x1
  807162:	e9 ca 00 00 00       	jmp    807231 <verify_name+0x26b>
    c=0;
  807167:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    flag=0;
  80716e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(i++;str[i]!='\0';i++)
  807175:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807179:	e9 83 00 00 00       	jmp    807201 <verify_name+0x23b>
    {
        int j=0;
  80717e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
        for(;j<sizeof(valid_ch);j++)
  807185:	eb 22                	jmp    8071a9 <verify_name+0x1e3>
            if(str[i]==valid_ch[j])break;
  807187:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80718a:	48 63 d0             	movsxd rdx,eax
  80718d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807191:	48 01 d0             	add    rax,rdx
  807194:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  807197:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80719a:	48 98                	cdqe   
  80719c:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  8071a1:	38 c2                	cmp    dl,al
  8071a3:	74 0e                	je     8071b3 <verify_name+0x1ed>
        for(;j<sizeof(valid_ch);j++)
  8071a5:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8071a9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8071ac:	83 f8 45             	cmp    eax,0x45
  8071af:	76 d6                	jbe    807187 <verify_name+0x1c1>
  8071b1:	eb 01                	jmp    8071b4 <verify_name+0x1ee>
            if(str[i]==valid_ch[j])break;
  8071b3:	90                   	nop
        if(j>=sizeof(valid_ch)){
  8071b4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8071b7:	83 f8 45             	cmp    eax,0x45
  8071ba:	76 07                	jbe    8071c3 <verify_name+0x1fd>
            //printf("invalid char:%x\n",str[i]);
            return 0;//出现非法字符
  8071bc:	b8 00 00 00 00       	mov    eax,0x0
  8071c1:	eb 6e                	jmp    807231 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  8071c3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8071c6:	48 63 d0             	movsxd rdx,eax
  8071c9:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8071cd:	48 01 d0             	add    rax,rdx
  8071d0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8071d3:	3c 20                	cmp    al,0x20
  8071d5:	74 07                	je     8071de <verify_name+0x218>
  8071d7:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        if(str[i]=='.'){
  8071de:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8071e1:	48 63 d0             	movsxd rdx,eax
  8071e4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8071e8:	48 01 d0             	add    rax,rdx
  8071eb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8071ee:	3c 2e                	cmp    al,0x2e
  8071f0:	75 07                	jne    8071f9 <verify_name+0x233>
            //printf("multiple dots.");
            return 0;//不能多次出现.
  8071f2:	b8 00 00 00 00       	mov    eax,0x0
  8071f7:	eb 38                	jmp    807231 <verify_name+0x26b>
        }
        c++;
  8071f9:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(i++;str[i]!='\0';i++)
  8071fd:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807201:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807204:	48 63 d0             	movsxd rdx,eax
  807207:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80720b:	48 01 d0             	add    rax,rdx
  80720e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807211:	84 c0                	test   al,al
  807213:	0f 85 65 ff ff ff    	jne    80717e <verify_name+0x1b8>
    }
    if(c>3||flag==0){
  807219:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  80721d:	7f 06                	jg     807225 <verify_name+0x25f>
  80721f:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  807223:	75 07                	jne    80722c <verify_name+0x266>
        //printf("file name blank\n");
        return 0;//不能全是空格
  807225:	b8 00 00 00 00       	mov    eax,0x0
  80722a:	eb 05                	jmp    807231 <verify_name+0x26b>
    }
    return 1;
  80722c:	b8 01 00 00 00       	mov    eax,0x1
}
  807231:	c9                   	leave  
  807232:	c3                   	ret    

0000000000807233 <format_name>:
//将“aaa.bb”的文件名形式转换为可以直接strcmp(,,11)的形式。
//默认文件名合法，请先检查文件名再使用。
void format_name(char *str)
{
  807233:	f3 0f 1e fa          	endbr64 
  807237:	55                   	push   rbp
  807238:	48 89 e5             	mov    rbp,rsp
  80723b:	48 83 ec 30          	sub    rsp,0x30
  80723f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char v[12]="           ";
  807243:	48 b8 20 20 20 20 20 	movabs rax,0x2020202020202020
  80724a:	20 20 20 
  80724d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  807251:	c7 45 f0 20 20 20 00 	mov    DWORD PTR [rbp-0x10],0x202020
    int ptr=0;
  807258:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    int namelen=0;
  80725f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    for(int i=0;str[i]!='\0';i++)
  807266:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80726d:	e9 9b 00 00 00       	jmp    80730d <format_name+0xda>
    {
        if(str[i]>='a'&&str[i]<='z')
  807272:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807275:	48 63 d0             	movsxd rdx,eax
  807278:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80727c:	48 01 d0             	add    rax,rdx
  80727f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807282:	3c 60                	cmp    al,0x60
  807284:	7e 3e                	jle    8072c4 <format_name+0x91>
  807286:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807289:	48 63 d0             	movsxd rdx,eax
  80728c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807290:	48 01 d0             	add    rax,rdx
  807293:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807296:	3c 7a                	cmp    al,0x7a
  807298:	7f 2a                	jg     8072c4 <format_name+0x91>
        {
            v[ptr++]=str[i]-'a'+'A';
  80729a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80729d:	48 63 d0             	movsxd rdx,eax
  8072a0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8072a4:	48 01 d0             	add    rax,rdx
  8072a7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8072aa:	8d 48 e0             	lea    ecx,[rax-0x20]
  8072ad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8072b0:	8d 50 01             	lea    edx,[rax+0x1]
  8072b3:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  8072b6:	89 ca                	mov    edx,ecx
  8072b8:	48 98                	cdqe   
  8072ba:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  8072be:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8072c2:	eb 45                	jmp    807309 <format_name+0xd6>
        }
        else if(str[i]=='.')
  8072c4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8072c7:	48 63 d0             	movsxd rdx,eax
  8072ca:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8072ce:	48 01 d0             	add    rax,rdx
  8072d1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8072d4:	3c 2e                	cmp    al,0x2e
  8072d6:	75 0d                	jne    8072e5 <format_name+0xb2>
        {
            ptr+=(8-namelen);
  8072d8:	b8 08 00 00 00       	mov    eax,0x8
  8072dd:	2b 45 f8             	sub    eax,DWORD PTR [rbp-0x8]
  8072e0:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
  8072e3:	eb 24                	jmp    807309 <format_name+0xd6>
        }else
        {
            v[ptr++]=str[i];
  8072e5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8072e8:	48 63 d0             	movsxd rdx,eax
  8072eb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8072ef:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  8072f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8072f6:	8d 50 01             	lea    edx,[rax+0x1]
  8072f9:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  8072fc:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
  8072ff:	48 98                	cdqe   
  807301:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  807305:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
    for(int i=0;str[i]!='\0';i++)
  807309:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80730d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807310:	48 63 d0             	movsxd rdx,eax
  807313:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807317:	48 01 d0             	add    rax,rdx
  80731a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80731d:	84 c0                	test   al,al
  80731f:	0f 85 4d ff ff ff    	jne    807272 <format_name+0x3f>
        }
    }
    v[12]='\0';
  807325:	c6 45 f4 00          	mov    BYTE PTR [rbp-0xc],0x0
    strcpy(str,v);
  807329:	48 8d 55 e8          	lea    rdx,[rbp-0x18]
  80732d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807331:	48 89 d6             	mov    rsi,rdx
  807334:	48 89 c7             	mov    rdi,rax
  807337:	e8 28 23 00 00       	call   809664 <strcpy>
}
  80733c:	90                   	nop
  80733d:	c9                   	leave  
  80733e:	c3                   	ret    

000000000080733f <req_cluster>:
int req_cluster()
{
  80733f:	f3 0f 1e fa          	endbr64 
  807343:	55                   	push   rbp
  807344:	48 89 e5             	mov    rbp,rsp
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  807347:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [rbp-0x4],0x3
  80734e:	eb 2a                	jmp    80737a <req_cluster+0x3b>
    {
        if(fat[i]==0)
  807350:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807353:	48 98                	cdqe   
  807355:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  80735c:	00 
  80735d:	66 85 c0             	test   ax,ax
  807360:	75 14                	jne    807376 <req_cluster+0x37>
        {
            fat[i]=0xffff;
  807362:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807365:	48 98                	cdqe   
  807367:	66 c7 84 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],0xffff
  80736e:	00 ff ff 
            return i;
  807371:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807374:	eb 13                	jmp    807389 <req_cluster+0x4a>
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  807376:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80737a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80737d:	3d ff 1f 00 00       	cmp    eax,0x1fff
  807382:	76 cc                	jbe    807350 <req_cluster+0x11>
        }
    }
    return -1;
  807384:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  807389:	5d                   	pop    rbp
  80738a:	c3                   	ret    

000000000080738b <write_sec>:
int write_sec(char *src, int sec_num, int sec_c)
{
  80738b:	f3 0f 1e fa          	endbr64 
  80738f:	55                   	push   rbp
  807390:	48 89 e5             	mov    rbp,rsp
  807393:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
  80739a:	48 89 bd 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rdi
  8073a1:	89 b5 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],esi
  8073a7:	89 95 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],edx
    driver_args arg={
  8073ad:	48 8d 95 40 ff ff ff 	lea    rdx,[rbp-0xc0]
  8073b4:	b8 00 00 00 00       	mov    eax,0x0
  8073b9:	b9 18 00 00 00       	mov    ecx,0x18
  8073be:	48 89 d7             	mov    rdi,rdx
  8073c1:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  8073c4:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  8073cb:	89 85 48 ff ff ff    	mov    DWORD PTR [rbp-0xb8],eax
  8073d1:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  8073d7:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
  8073dd:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  8073e3:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            .src_addr=src,
            .sec_n=sec_num,
            .sec_c=sec_c
    };
    return drv_disk.read(&arg);
  8073e9:	48 8b 15 88 2c 00 00 	mov    rdx,QWORD PTR [rip+0x2c88]        # 80a078 <drv_disk+0x18>
  8073f0:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  8073f7:	48 89 c7             	mov    rdi,rax
  8073fa:	ff d2                	call   rdx
}
  8073fc:	c9                   	leave  
  8073fd:	c3                   	ret    

00000000008073fe <set_attr>:
void set_attr(dir_entry *f,char attr)
{
  8073fe:	f3 0f 1e fa          	endbr64 
  807402:	55                   	push   rbp
  807403:	48 89 e5             	mov    rbp,rsp
  807406:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80740a:	89 f0                	mov    eax,esi
  80740c:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    f->attr|=attr;
  80740f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807413:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  807417:	0a 45 f4             	or     al,BYTE PTR [rbp-0xc]
  80741a:	89 c2                	mov    edx,eax
  80741c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807420:	88 50 0b             	mov    BYTE PTR [rax+0xb],dl
}
  807423:	90                   	nop
  807424:	5d                   	pop    rbp
  807425:	c3                   	ret    

0000000000807426 <update_fat_and_root>:
mkdir
touch
rm
*/
void update_fat_and_root()
{
  807426:	f3 0f 1e fa          	endbr64 
  80742a:	55                   	push   rbp
  80742b:	48 89 e5             	mov    rbp,rsp
  80742e:	48 83 ec 10          	sub    rsp,0x10
    int root_loc=superblock.rsvdSec+\
  807432:	0f b7 05 35 14 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21435]        # 42886e <superblock+0xe>
  807439:	0f b7 c8             	movzx  ecx,ax
    superblock.secPerFAT*superblock.numOfFAT;
  80743c:	0f b7 05 33 14 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21433]        # 428876 <superblock+0x16>
  807443:	0f b7 d0             	movzx  edx,ax
  807446:	0f b6 05 23 14 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21423]        # 428870 <superblock+0x10>
  80744d:	0f b6 c0             	movzx  eax,al
  807450:	0f af c2             	imul   eax,edx
    int root_loc=superblock.rsvdSec+\
  807453:	01 c8                	add    eax,ecx
  807455:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("root_loc:0x%x\n",root_loc);
    write_sec(root_dir,root_loc,sizeof(root_dir));
  807458:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80745b:	ba 00 40 00 00       	mov    edx,0x4000
  807460:	89 c6                	mov    esi,eax
  807462:	bf a0 88 42 00       	mov    edi,0x4288a0
  807467:	e8 1f ff ff ff       	call   80738b <write_sec>
    //printf("updated root\n");
    write_sec(fat,superblock.rsvdSec,sizeof(fat));
  80746c:	0f b7 05 fb 13 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc213fb]        # 42886e <superblock+0xe>
  807473:	0f b7 c0             	movzx  eax,ax
  807476:	ba 00 40 00 00       	mov    edx,0x4000
  80747b:	89 c6                	mov    esi,eax
  80747d:	bf c0 ca 42 00       	mov    edi,0x42cac0
  807482:	e8 04 ff ff ff       	call   80738b <write_sec>
    //printf("updated fat\n");

}
  807487:	90                   	nop
  807488:	c9                   	leave  
  807489:	c3                   	ret    

000000000080748a <add_dot_and_ddot_dir>:
void add_dot_and_ddot_dir(dir_entry dir)
{
  80748a:	f3 0f 1e fa          	endbr64 
  80748e:	55                   	push   rbp
  80748f:	48 89 e5             	mov    rbp,rsp
  807492:	48 83 ec 10          	sub    rsp,0x10
    //it must be a regular dir to add. and ..
    //and this must be done when the dir is created
    //regular dir
    int cluster = dir.fistCluNum;
  807496:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  80749a:	0f b7 c0             	movzx  eax,ax
  80749d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
    superblock.secPerClu);
  8074a0:	0f b6 05 c6 13 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc213c6]        # 42886d <superblock+0xd>
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  8074a7:	0f b6 c0             	movzx  eax,al
  8074aa:	8b 0d 50 2c 00 00    	mov    ecx,DWORD PTR [rip+0x2c50]        # 80a100 <clu_sec_balance>
  8074b0:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8074b3:	01 d1                	add    ecx,edx
  8074b5:	89 c2                	mov    edx,eax
  8074b7:	89 ce                	mov    esi,ecx
  8074b9:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  8074be:	e8 bc 05 00 00       	call   807a7f <read_sec>
    //.
    strcpy(a_clu_of_dir[0].name,".       ");
  8074c3:	be 6a 1f 81 00       	mov    esi,0x811f6a
  8074c8:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  8074cd:	e8 92 21 00 00       	call   809664 <strcpy>
    strcpy(a_clu_of_dir[0].extension,"   ");
  8074d2:	be 73 1f 81 00       	mov    esi,0x811f73
  8074d7:	bf c8 c8 42 00       	mov    edi,0x42c8c8
  8074dc:	e8 83 21 00 00       	call   809664 <strcpy>
    a_clu_of_dir[0].fistCluNum=dir.fistCluNum;
  8074e1:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  8074e5:	66 89 05 ee 53 c2 ff 	mov    WORD PTR [rip+0xffffffffffc253ee],ax        # 42c8da <a_clu_of_dir+0x1a>
    a_clu_of_dir[0].len=0;
  8074ec:	c7 05 e6 53 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc253e6],0x0        # 42c8dc <a_clu_of_dir+0x1c>
  8074f3:	00 00 00 
    set_attr(&a_clu_of_dir[0],ATTR_DIR);
  8074f6:	be 10 00 00 00       	mov    esi,0x10
  8074fb:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807500:	e8 f9 fe ff ff       	call   8073fe <set_attr>
    //..
    strcpy(a_clu_of_dir[1].name,"..      ");
  807505:	be 77 1f 81 00       	mov    esi,0x811f77
  80750a:	bf e0 c8 42 00       	mov    edi,0x42c8e0
  80750f:	e8 50 21 00 00       	call   809664 <strcpy>
    strcpy(a_clu_of_dir[1].extension,"   ");
  807514:	be 73 1f 81 00       	mov    esi,0x811f73
  807519:	bf e8 c8 42 00       	mov    edi,0x42c8e8
  80751e:	e8 41 21 00 00       	call   809664 <strcpy>
    a_clu_of_dir[1].fistCluNum=cur_dir.fistCluNum;
  807523:	0f b7 05 90 53 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc25390]        # 42c8ba <cur_dir+0x1a>
  80752a:	66 89 05 c9 53 c2 ff 	mov    WORD PTR [rip+0xffffffffffc253c9],ax        # 42c8fa <a_clu_of_dir+0x3a>
    a_clu_of_dir[1].len=0;
  807531:	c7 05 c1 53 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc253c1],0x0        # 42c8fc <a_clu_of_dir+0x3c>
  807538:	00 00 00 
    set_attr(&a_clu_of_dir[1],ATTR_DIR);
  80753b:	be 10 00 00 00       	mov    esi,0x10
  807540:	bf e0 c8 42 00       	mov    edi,0x42c8e0
  807545:	e8 b4 fe ff ff       	call   8073fe <set_attr>
    //update the dir
    int dir_loc=cluster+clu_sec_balance;
  80754a:	8b 15 b0 2b 00 00    	mov    edx,DWORD PTR [rip+0x2bb0]        # 80a100 <clu_sec_balance>
  807550:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807553:	01 d0                	add    eax,edx
  807555:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  807558:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80755b:	ba 00 02 00 00       	mov    edx,0x200
  807560:	89 c6                	mov    esi,eax
  807562:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807567:	e8 1f fe ff ff       	call   80738b <write_sec>
    //no need to update fat and root
}
  80756c:	90                   	nop
  80756d:	c9                   	leave  
  80756e:	c3                   	ret    

000000000080756f <translate_attr>:
void translate_attr(char attr,char *attr_s)
{
  80756f:	f3 0f 1e fa          	endbr64 
  807573:	55                   	push   rbp
  807574:	48 89 e5             	mov    rbp,rsp
  807577:	89 f8                	mov    eax,edi
  807579:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80757d:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    //rwhds (s: system h:hidden)
    int v=attr&1;
  807580:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807584:	83 e0 01             	and    eax,0x1
  807587:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//sys_read-only
  80758a:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80758e:	74 0b                	je     80759b <translate_attr+0x2c>
        attr_s[1]='-';
  807590:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807594:	48 83 c0 01          	add    rax,0x1
  807598:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
    v=attr&2;
  80759b:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  80759f:	83 e0 02             	and    eax,0x2
  8075a2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//hidden
  8075a5:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8075a9:	74 0b                	je     8075b6 <translate_attr+0x47>
        attr_s[2]='h';
  8075ab:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8075af:	48 83 c0 02          	add    rax,0x2
  8075b3:	c6 00 68             	mov    BYTE PTR [rax],0x68
    v=attr&4;
  8075b6:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  8075ba:	83 e0 04             	and    eax,0x4
  8075bd:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//system
  8075c0:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8075c4:	74 0b                	je     8075d1 <translate_attr+0x62>
        attr_s[4]='s';
  8075c6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8075ca:	48 83 c0 04          	add    rax,0x4
  8075ce:	c6 00 73             	mov    BYTE PTR [rax],0x73
    v=attr&8;
  8075d1:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  8075d5:	83 e0 08             	and    eax,0x8
  8075d8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//volume label
  8075db:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8075df:	74 0b                	je     8075ec <translate_attr+0x7d>
        attr_s[3]='v';
  8075e1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8075e5:	48 83 c0 03          	add    rax,0x3
  8075e9:	c6 00 76             	mov    BYTE PTR [rax],0x76
    v=attr&16;
  8075ec:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  8075f0:	83 e0 10             	and    eax,0x10
  8075f3:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//dir
  8075f6:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8075fa:	74 0b                	je     807607 <translate_attr+0x98>
        attr_s[3]='d';
  8075fc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807600:	48 83 c0 03          	add    rax,0x3
  807604:	c6 00 64             	mov    BYTE PTR [rax],0x64
    //archive: do nothing
    attr_s[5]='\0';
  807607:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80760b:	48 83 c0 05          	add    rax,0x5
  80760f:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  807612:	90                   	nop
  807613:	5d                   	pop    rbp
  807614:	c3                   	ret    

0000000000807615 <extend_cluster>:
int extend_cluster(short cluster)
{
  807615:	f3 0f 1e fa          	endbr64 
  807619:	55                   	push   rbp
  80761a:	48 89 e5             	mov    rbp,rsp
  80761d:	48 83 ec 18          	sub    rsp,0x18
  807621:	89 f8                	mov    eax,edi
  807623:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    int new_clu=req_cluster();
  807627:	b8 00 00 00 00       	mov    eax,0x0
  80762c:	e8 0e fd ff ff       	call   80733f <req_cluster>
  807631:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(new_clu==-1)
  807634:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  807638:	75 07                	jne    807641 <extend_cluster+0x2c>
        return -1;
  80763a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80763f:	eb 16                	jmp    807657 <extend_cluster+0x42>
    fat[cluster]=new_clu;
  807641:	0f bf 45 ec          	movsx  eax,WORD PTR [rbp-0x14]
  807645:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  807648:	48 98                	cdqe   
  80764a:	66 89 94 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],dx
  807651:	00 
    return 0;
  807652:	b8 00 00 00 00       	mov    eax,0x0
}
  807657:	c9                   	leave  
  807658:	c3                   	ret    

0000000000807659 <touch>:
得出的结果换算成16进制填入即可。也就是：38H字节0~4位是日期数；38H字节5~7位和39H字节0位是月份；
39H字节的1~7位为年号，原定义中0~119分别代表1980~2099，目前高版本的Windows允许取0~127，
即年号最大可以到2107年。
*/
int touch(driver_args *arg)
{
  807659:	f3 0f 1e fa          	endbr64 
  80765d:	55                   	push   rbp
  80765e:	48 89 e5             	mov    rbp,rsp
  807661:	48 83 ec 60          	sub    rsp,0x60
  807665:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    char *name=arg->path;
  807669:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80766d:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807671:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  807675:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807679:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  80767c:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    //default set to 512
    int max_files=16;
  807680:	c7 45 ec 10 00 00 00 	mov    DWORD PTR [rbp-0x14],0x10
    dir_entry *dir_table=a_clu_of_dir;
  807687:	48 c7 45 e0 c0 c8 42 	mov    QWORD PTR [rbp-0x20],0x42c8c0
  80768e:	00 
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  80768f:	0f b6 05 d7 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc211d7]        # 42886d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  807696:	0f b6 c0             	movzx  eax,al
  807699:	0f b7 55 ca          	movzx  edx,WORD PTR [rbp-0x36]
  80769d:	0f b7 ca             	movzx  ecx,dx
  8076a0:	8b 15 5a 2a 00 00    	mov    edx,DWORD PTR [rip+0x2a5a]        # 80a100 <clu_sec_balance>
  8076a6:	01 d1                	add    ecx,edx
  8076a8:	89 c2                	mov    edx,eax
  8076aa:	89 ce                	mov    esi,ecx
  8076ac:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  8076b1:	e8 c9 03 00 00       	call   807a7f <read_sec>
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  8076b6:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  8076ba:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do{
        for(int i=0;i<max_files;i++)
  8076be:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8076c5:	e9 2e 01 00 00       	jmp    8077f8 <touch+0x19f>
        {
            //printf("%s\n",dir_table[i].name);
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  8076ca:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8076cd:	48 98                	cdqe   
  8076cf:	48 c1 e0 05          	shl    rax,0x5
  8076d3:	48 89 c2             	mov    rdx,rax
  8076d6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8076da:	48 01 d0             	add    rax,rdx
  8076dd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8076e0:	3c e5                	cmp    al,0xe5
  8076e2:	74 1e                	je     807702 <touch+0xa9>
            dir_table[i].name[0]==0)
  8076e4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8076e7:	48 98                	cdqe   
  8076e9:	48 c1 e0 05          	shl    rax,0x5
  8076ed:	48 89 c2             	mov    rdx,rax
  8076f0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8076f4:	48 01 d0             	add    rax,rdx
  8076f7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  8076fa:	84 c0                	test   al,al
  8076fc:	0f 85 f2 00 00 00    	jne    8077f4 <touch+0x19b>
            {
                //available
                //put name
                format_name(name);
  807702:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807706:	48 89 c7             	mov    rdi,rax
  807709:	e8 25 fb ff ff       	call   807233 <format_name>
                memcpy(dir_table[i].name,name,11);
  80770e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807711:	48 98                	cdqe   
  807713:	48 c1 e0 05          	shl    rax,0x5
  807717:	48 89 c2             	mov    rdx,rax
  80771a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80771e:	48 01 d0             	add    rax,rdx
  807721:	48 89 c1             	mov    rcx,rax
  807724:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807728:	ba 0b 00 00 00       	mov    edx,0xb
  80772d:	48 89 c6             	mov    rsi,rax
  807730:	48 89 cf             	mov    rdi,rcx
  807733:	e8 2e 1e 00 00       	call   809566 <memcpy>
                int clu=req_cluster();
  807738:	b8 00 00 00 00       	mov    eax,0x0
  80773d:	e8 fd fb ff ff       	call   80733f <req_cluster>
  807742:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
                if(clu==-1)
  807745:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  807749:	75 0a                	jne    807755 <touch+0xfc>
                {
                    //puts("err: full disk");
                    return -1;
  80774b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807750:	e9 fc 00 00 00       	jmp    807851 <touch+0x1f8>
                }
                dir_table[i].fistCluNum=clu;
  807755:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807758:	48 98                	cdqe   
  80775a:	48 c1 e0 05          	shl    rax,0x5
  80775e:	48 89 c2             	mov    rdx,rax
  807761:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807765:	48 01 d0             	add    rax,rdx
  807768:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80776b:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
                set_attr(&dir_table[i],ATTR_ARCHIVE);
  80776f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807772:	48 98                	cdqe   
  807774:	48 c1 e0 05          	shl    rax,0x5
  807778:	48 89 c2             	mov    rdx,rax
  80777b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80777f:	48 01 d0             	add    rax,rdx
  807782:	be 20 00 00 00       	mov    esi,0x20
  807787:	48 89 c7             	mov    rdi,rax
  80778a:	e8 6f fc ff ff       	call   8073fe <set_attr>
                dir_table[i].len=superblock.bytesPerSec*superblock.secPerClu;
  80778f:	0f b7 05 d5 10 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc210d5]        # 42886b <superblock+0xb>
  807796:	0f b7 d0             	movzx  edx,ax
  807799:	0f b6 05 cd 10 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc210cd]        # 42886d <superblock+0xd>
  8077a0:	0f b6 c0             	movzx  eax,al
  8077a3:	0f af d0             	imul   edx,eax
  8077a6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8077a9:	48 98                	cdqe   
  8077ab:	48 c1 e0 05          	shl    rax,0x5
  8077af:	48 89 c1             	mov    rcx,rax
  8077b2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8077b6:	48 01 c8             	add    rax,rcx
  8077b9:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
                //date and time
                //dir_table[i].lastModfDate=get_date_stab();
                //dir_table[i].lastModfTime=get_time_stab();
                //update
                write_sec(dir_table,cluster+clu_sec_balance,\
                superblock.bytesPerSec*superblock.secPerClu);
  8077bc:	0f b7 05 a8 10 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc210a8]        # 42886b <superblock+0xb>
  8077c3:	0f b7 d0             	movzx  edx,ax
  8077c6:	0f b6 05 a0 10 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc210a0]        # 42886d <superblock+0xd>
  8077cd:	0f b6 c0             	movzx  eax,al
                write_sec(dir_table,cluster+clu_sec_balance,\
  8077d0:	0f af d0             	imul   edx,eax
  8077d3:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  8077d7:	8b 05 23 29 00 00    	mov    eax,DWORD PTR [rip+0x2923]        # 80a100 <clu_sec_balance>
  8077dd:	01 c1                	add    ecx,eax
  8077df:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8077e3:	89 ce                	mov    esi,ecx
  8077e5:	48 89 c7             	mov    rdi,rax
  8077e8:	e8 9e fb ff ff       	call   80738b <write_sec>
                return -1;
  8077ed:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8077f2:	eb 5d                	jmp    807851 <touch+0x1f8>
        for(int i=0;i<max_files;i++)
  8077f4:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8077f8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8077fb:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
  8077fe:	0f 8c c6 fe ff ff    	jl     8076ca <touch+0x71>
        if(fat[cluster]>=FAT_EOF&&extend_cluster(cluster)==-1)
        {
            //extend fail
            //puts("err:full disk");
            return -1;
        }else if(cluster<FAT_EOF)
  807804:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807809:	77 36                	ja     807841 <touch+0x1e8>
        {
            cluster=fat[cluster];
  80780b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80780f:	48 98                	cdqe   
  807811:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807818:	00 
  807819:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  80781d:	0f b6 05 49 10 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21049]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807824:	0f b6 d0             	movzx  edx,al
  807827:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  80782b:	8b 05 cf 28 00 00    	mov    eax,DWORD PTR [rip+0x28cf]        # 80a100 <clu_sec_balance>
  807831:	01 c1                	add    ecx,eax
  807833:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807837:	89 ce                	mov    esi,ecx
  807839:	48 89 c7             	mov    rdi,rax
  80783c:	e8 3e 02 00 00       	call   807a7f <read_sec>
        }
    }while(cluster<FAT_EOF);
  807841:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807846:	0f 86 72 fe ff ff    	jbe    8076be <touch+0x65>
    return 0;
  80784c:	b8 00 00 00 00       	mov    eax,0x0
}
  807851:	c9                   	leave  
  807852:	c3                   	ret    

0000000000807853 <mkdir>:
//attention: the name must be char[12]
int mkdir(driver_args *arg)
{
  807853:	f3 0f 1e fa          	endbr64 
  807857:	55                   	push   rbp
  807858:	48 89 e5             	mov    rbp,rsp
  80785b:	48 83 ec 50          	sub    rsp,0x50
  80785f:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    char *name=arg->path;
  807863:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807867:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80786b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  80786f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807873:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  807876:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    format_name(name);
  80787a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80787e:	48 89 c7             	mov    rdi,rax
  807881:	e8 ad f9 ff ff       	call   807233 <format_name>
    //regular dir
    unsigned short cluster = dir.fistCluNum;
  807886:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  80788a:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do
    {
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
            superblock.secPerClu);
  80788e:	0f b6 05 d8 0f c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20fd8]        # 42886d <superblock+0xd>
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  807895:	0f b6 c0             	movzx  eax,al
  807898:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  80789c:	8b 15 5e 28 00 00    	mov    edx,DWORD PTR [rip+0x285e]        # 80a100 <clu_sec_balance>
  8078a2:	01 d1                	add    ecx,edx
  8078a4:	89 c2                	mov    edx,eax
  8078a6:	89 ce                	mov    esi,ecx
  8078a8:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  8078ad:	e8 cd 01 00 00       	call   807a7f <read_sec>
        for (int i = 0; i < 16; i++)
  8078b2:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8078b9:	e9 8c 01 00 00       	jmp    807a4a <mkdir+0x1f7>
        {
            if(a_clu_of_dir[i].fistCluNum==0||\
  8078be:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8078c1:	48 98                	cdqe   
  8078c3:	48 c1 e0 05          	shl    rax,0x5
  8078c7:	48 05 da c8 42 00    	add    rax,0x42c8da
  8078cd:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8078d0:	66 85 c0             	test   ax,ax
  8078d3:	74 30                	je     807905 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0xe5||\
  8078d5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8078d8:	48 98                	cdqe   
  8078da:	48 c1 e0 05          	shl    rax,0x5
  8078de:	48 05 a0 88 42 00    	add    rax,0x4288a0
  8078e4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if(a_clu_of_dir[i].fistCluNum==0||\
  8078e7:	3c e5                	cmp    al,0xe5
  8078e9:	74 1a                	je     807905 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0)
  8078eb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8078ee:	48 98                	cdqe   
  8078f0:	48 c1 e0 05          	shl    rax,0x5
  8078f4:	48 05 a0 88 42 00    	add    rax,0x4288a0
  8078fa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            (unsigned char)root_dir[i].name[0]==0xe5||\
  8078fd:	84 c0                	test   al,al
  8078ff:	0f 85 41 01 00 00    	jne    807a46 <mkdir+0x1f3>
            {
                memset(&a_clu_of_dir[i],0,sizeof(dir_entry));
  807905:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807908:	48 98                	cdqe   
  80790a:	48 c1 e0 05          	shl    rax,0x5
  80790e:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  807914:	ba 20 00 00 00       	mov    edx,0x20
  807919:	be 00 00 00 00       	mov    esi,0x0
  80791e:	48 89 c7             	mov    rdi,rax
  807921:	e8 ef 1c 00 00       	call   809615 <memset>
                memset(a_clu_of_dir[i].name,' ',11);
  807926:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807929:	48 98                	cdqe   
  80792b:	48 c1 e0 05          	shl    rax,0x5
  80792f:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  807935:	ba 0b 00 00 00       	mov    edx,0xb
  80793a:	be 20 00 00 00       	mov    esi,0x20
  80793f:	48 89 c7             	mov    rdi,rax
  807942:	e8 ce 1c 00 00       	call   809615 <memset>
                strcpy(a_clu_of_dir[i].name,name);
  807947:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80794a:	48 98                	cdqe   
  80794c:	48 c1 e0 05          	shl    rax,0x5
  807950:	48 8d 90 c0 c8 42 00 	lea    rdx,[rax+0x42c8c0]
  807957:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80795b:	48 89 c6             	mov    rsi,rax
  80795e:	48 89 d7             	mov    rdi,rdx
  807961:	e8 fe 1c 00 00       	call   809664 <strcpy>
                a_clu_of_dir[i].name[strlen(name)]=' ';
  807966:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80796a:	48 89 c7             	mov    rdi,rax
  80796d:	e8 11 1f 00 00       	call   809883 <strlen>
  807972:	48 63 d0             	movsxd rdx,eax
  807975:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807978:	48 98                	cdqe   
  80797a:	48 c1 e0 05          	shl    rax,0x5
  80797e:	48 01 d0             	add    rax,rdx
  807981:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  807987:	c6 00 20             	mov    BYTE PTR [rax],0x20
                int clu=req_cluster();
  80798a:	b8 00 00 00 00       	mov    eax,0x0
  80798f:	e8 ab f9 ff ff       	call   80733f <req_cluster>
  807994:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
                if(clu==-1)//check
  807997:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  80799b:	75 0a                	jne    8079a7 <mkdir+0x154>
                {
                    //puts("err:full dir");
                    return -1;
  80799d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8079a2:	e9 d6 00 00 00       	jmp    807a7d <mkdir+0x22a>
                }
                a_clu_of_dir[i].fistCluNum=clu;
  8079a7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8079aa:	89 c2                	mov    edx,eax
  8079ac:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8079af:	48 98                	cdqe   
  8079b1:	48 c1 e0 05          	shl    rax,0x5
  8079b5:	48 05 da c8 42 00    	add    rax,0x42c8da
  8079bb:	66 89 10             	mov    WORD PTR [rax],dx
                //set attr
                set_attr(&a_clu_of_dir[i],ATTR_DIR);
  8079be:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8079c1:	48 98                	cdqe   
  8079c3:	48 c1 e0 05          	shl    rax,0x5
  8079c7:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  8079cd:	be 10 00 00 00       	mov    esi,0x10
  8079d2:	48 89 c7             	mov    rdi,rax
  8079d5:	e8 24 fa ff ff       	call   8073fe <set_attr>
                //set length
                a_clu_of_dir[i].len=0;
  8079da:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8079dd:	48 98                	cdqe   
  8079df:	48 c1 e0 05          	shl    rax,0x5
  8079e3:	48 05 dc c8 42 00    	add    rax,0x42c8dc
  8079e9:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
                //date and time
                /*a_clu_of_dir[i].lastModfDate=get_date_stab();
                a_clu_of_dir[i].lastModfTime=get_time_stab();*/
                //set date:temporarily none
                //add . and ..
                add_dot_and_ddot_dir(a_clu_of_dir[i]);
  8079ef:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8079f2:	48 98                	cdqe   
  8079f4:	48 c1 e0 05          	shl    rax,0x5
  8079f8:	48 05 c0 c8 42 00    	add    rax,0x42c8c0
  8079fe:	ff 70 18             	push   QWORD PTR [rax+0x18]
  807a01:	ff 70 10             	push   QWORD PTR [rax+0x10]
  807a04:	ff 70 08             	push   QWORD PTR [rax+0x8]
  807a07:	ff 30                	push   QWORD PTR [rax]
  807a09:	e8 7c fa ff ff       	call   80748a <add_dot_and_ddot_dir>
  807a0e:	48 83 c4 20          	add    rsp,0x20
                //update the dir
                int dir_loc=cluster+clu_sec_balance;
  807a12:	0f b7 55 fe          	movzx  edx,WORD PTR [rbp-0x2]
  807a16:	8b 05 e4 26 00 00    	mov    eax,DWORD PTR [rip+0x26e4]        # 80a100 <clu_sec_balance>
  807a1c:	01 d0                	add    eax,edx
  807a1e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
                write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  807a21:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807a24:	ba 00 02 00 00       	mov    edx,0x200
  807a29:	89 c6                	mov    esi,eax
  807a2b:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807a30:	e8 56 f9 ff ff       	call   80738b <write_sec>
                update_fat_and_root();
  807a35:	b8 00 00 00 00       	mov    eax,0x0
  807a3a:	e8 e7 f9 ff ff       	call   807426 <update_fat_and_root>
                return 0;
  807a3f:	b8 00 00 00 00       	mov    eax,0x0
  807a44:	eb 37                	jmp    807a7d <mkdir+0x22a>
        for (int i = 0; i < 16; i++)
  807a46:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807a4a:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  807a4e:	0f 8e 6a fe ff ff    	jle    8078be <mkdir+0x6b>
            }
        }

        if(cluster<FAT_EOF)
  807a54:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807a59:	77 12                	ja     807a6d <mkdir+0x21a>
            cluster=fat[cluster];
  807a5b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807a5f:	48 98                	cdqe   
  807a61:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807a68:	00 
  807a69:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    } while (cluster<FAT_EOF);
  807a6d:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807a72:	0f 86 16 fe ff ff    	jbe    80788e <mkdir+0x3b>
    return -1;
  807a78:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  807a7d:	c9                   	leave  
  807a7e:	c3                   	ret    

0000000000807a7f <read_sec>:
    }
    
    
}*/
int read_sec(char *dist, int sec_num, int sec_count)
{
  807a7f:	f3 0f 1e fa          	endbr64 
  807a83:	55                   	push   rbp
  807a84:	48 89 e5             	mov    rbp,rsp
  807a87:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  807a8e:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
  807a95:	89 b5 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],esi
  807a9b:	89 95 20 ff ff ff    	mov    DWORD PTR [rbp-0xe0],edx
    driver_args arg={
  807aa1:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  807aa8:	b8 00 00 00 00       	mov    eax,0x0
  807aad:	b9 18 00 00 00       	mov    ecx,0x18
  807ab2:	48 89 d7             	mov    rdi,rdx
  807ab5:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  807ab8:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
  807abe:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
  807ac4:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  807acb:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
  807ad1:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  807ad8:	00 00 00 
            .dist_addr=dist,
            .lba=sec_num,
            .sec_c=1
    };
    for(int i=0;i<sec_count;i++)
  807adb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807ae2:	eb 3e                	jmp    807b22 <read_sec+0xa3>
    {
        drv_disk.read(&arg);
  807ae4:	48 8b 15 8d 25 00 00 	mov    rdx,QWORD PTR [rip+0x258d]        # 80a078 <drv_disk+0x18>
  807aeb:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  807af2:	48 89 c7             	mov    rdi,rax
  807af5:	ff d2                	call   rdx
        arg.dist_addr+=superblock.bytesPerSec;
  807af7:	8b 95 34 ff ff ff    	mov    edx,DWORD PTR [rbp-0xcc]
  807afd:	0f b7 05 67 0d c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20d67]        # 42886b <superblock+0xb>
  807b04:	0f b7 c0             	movzx  eax,ax
  807b07:	01 d0                	add    eax,edx
  807b09:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.lba++;
  807b0f:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  807b15:	83 c0 01             	add    eax,0x1
  807b18:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
    for(int i=0;i<sec_count;i++)
  807b1e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807b22:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807b25:	3b 85 20 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xe0]
  807b2b:	7c b7                	jl     807ae4 <read_sec+0x65>
    }
    return 0;
  807b2d:	b8 00 00 00 00       	mov    eax,0x0
}
  807b32:	c9                   	leave  
  807b33:	c3                   	ret    

0000000000807b34 <rm>:

int rm(driver_args* args)
{
  807b34:	f3 0f 1e fa          	endbr64 
  807b38:	55                   	push   rbp
  807b39:	48 89 e5             	mov    rbp,rsp
  807b3c:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  807b43:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
    char *name=args->path;
  807b4a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  807b51:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807b55:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    driver_args tmparg={
  807b59:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  807b60:	b8 00 00 00 00       	mov    eax,0x0
  807b65:	b9 18 00 00 00       	mov    ecx,0x18
  807b6a:	48 89 d7             	mov    rdi,rdx
  807b6d:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .path=args->dir_path,
  807b70:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  807b77:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
    driver_args tmparg={
  807b7e:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    if(get_entry(&tmparg)==-1)return -1;
  807b85:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  807b8c:	48 89 c7             	mov    rdi,rax
  807b8f:	e8 07 0a 00 00       	call   80859b <get_entry>
  807b94:	83 f8 ff             	cmp    eax,0xffffffff
  807b97:	75 0a                	jne    807ba3 <rm+0x6f>
  807b99:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807b9e:	e9 a8 01 00 00       	jmp    807d4b <rm+0x217>
    dir.fistCluNum=tmparg.entry.id;
  807ba3:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  807ba9:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    dir_entry *dir_table=a_clu_of_dir;
  807bad:	48 c7 45 e0 c0 c8 42 	mov    QWORD PTR [rbp-0x20],0x42c8c0
  807bb4:	00 
    //regular dir
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
    superblock.secPerClu);
  807bb5:	0f b6 05 b1 0c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20cb1]        # 42886d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  807bbc:	0f b6 c0             	movzx  eax,al
  807bbf:	0f b7 55 da          	movzx  edx,WORD PTR [rbp-0x26]
  807bc3:	0f b7 ca             	movzx  ecx,dx
  807bc6:	8b 15 34 25 00 00    	mov    edx,DWORD PTR [rip+0x2534]        # 80a100 <clu_sec_balance>
  807bcc:	01 d1                	add    ecx,edx
  807bce:	89 c2                	mov    edx,eax
  807bd0:	89 ce                	mov    esi,ecx
  807bd2:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807bd7:	e8 a3 fe ff ff       	call   807a7f <read_sec>
    dir_table=a_clu_of_dir;
  807bdc:	48 c7 45 e0 c0 c8 42 	mov    QWORD PTR [rbp-0x20],0x42c8c0
  807be3:	00 
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  807be4:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  807be8:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    int i=0;
  807bec:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    while(cluster<FAT_EOF){
  807bf3:	e9 89 00 00 00       	jmp    807c81 <rm+0x14d>
        read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807bf8:	0f b6 05 6e 0c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20c6e]        # 42886d <superblock+0xd>
        read_sec(dir_table,cluster+clu_sec_balance,\
  807bff:	0f b6 d0             	movzx  edx,al
  807c02:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807c06:	8b 05 f4 24 00 00    	mov    eax,DWORD PTR [rip+0x24f4]        # 80a100 <clu_sec_balance>
  807c0c:	01 c1                	add    ecx,eax
  807c0e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c12:	89 ce                	mov    esi,ecx
  807c14:	48 89 c7             	mov    rdi,rax
  807c17:	e8 63 fe ff ff       	call   807a7f <read_sec>
        for(;i<16;i++)
  807c1c:	eb 44                	jmp    807c62 <rm+0x12e>
        {
            if(dir_table[i].fistCluNum==args->entry.id)
  807c1e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c21:	48 98                	cdqe   
  807c23:	48 c1 e0 05          	shl    rax,0x5
  807c27:	48 89 c2             	mov    rdx,rax
  807c2a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c2e:	48 01 d0             	add    rax,rdx
  807c31:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  807c35:	0f b7 d0             	movzx  edx,ax
  807c38:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  807c3f:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  807c42:	39 c2                	cmp    edx,eax
  807c44:	75 18                	jne    807c5e <rm+0x12a>
            {
                if(dir_table[i].attr&ATTR_DIR){
                    //要处理里面的文件
                }
                dir_table[i].name[0]=0xe5;
  807c46:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c49:	48 98                	cdqe   
  807c4b:	48 c1 e0 05          	shl    rax,0x5
  807c4f:	48 89 c2             	mov    rdx,rax
  807c52:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c56:	48 01 d0             	add    rax,rdx
  807c59:	c6 00 e5             	mov    BYTE PTR [rax],0xe5
                goto del_entry_finish;
  807c5c:	eb 2f                	jmp    807c8d <rm+0x159>
        for(;i<16;i++)
  807c5e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807c62:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  807c66:	7e b6                	jle    807c1e <rm+0xea>
            }
        }
        if(cluster<FAT_EOF)
  807c68:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807c6d:	77 12                	ja     807c81 <rm+0x14d>
        {
            cluster=fat[cluster];
  807c6f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807c73:	48 98                	cdqe   
  807c75:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807c7c:	00 
  807c7d:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    while(cluster<FAT_EOF){
  807c81:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807c86:	0f 86 6c ff ff ff    	jbe    807bf8 <rm+0xc4>
            //update
            //if you can reach here it means it's a regular dir
        }

    }
del_entry_finish:
  807c8c:	90                   	nop
    ;
    //del fat
    unsigned short del_clu=dir_table[i].fistCluNum;
  807c8d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c90:	48 98                	cdqe   
  807c92:	48 c1 e0 05          	shl    rax,0x5
  807c96:	48 89 c2             	mov    rdx,rax
  807c99:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c9d:	48 01 d0             	add    rax,rdx
  807ca0:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  807ca4:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
    unsigned short pion=del_clu<FAT_EOF?fat[del_clu]:0xffff;
  807ca8:	66 83 7d f6 f6       	cmp    WORD PTR [rbp-0xa],0xfff6
  807cad:	77 10                	ja     807cbf <rm+0x18b>
  807caf:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807cb3:	48 98                	cdqe   
  807cb5:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807cbc:	00 
  807cbd:	eb 05                	jmp    807cc4 <rm+0x190>
  807cbf:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807cc4:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  807cc8:	eb 2a                	jmp    807cf4 <rm+0x1c0>
    {
        fat[del_clu]=0;
  807cca:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807cce:	48 98                	cdqe   
  807cd0:	66 c7 84 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],0x0
  807cd7:	00 00 00 
        del_clu=pion;
  807cda:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  807cde:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
        pion=fat[pion];
  807ce2:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  807ce6:	48 98                	cdqe   
  807ce8:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807cef:	00 
  807cf0:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  807cf4:	66 83 7d f4 f6       	cmp    WORD PTR [rbp-0xc],0xfff6
  807cf9:	76 cf                	jbe    807cca <rm+0x196>
    }
    fat[del_clu]=0;
  807cfb:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807cff:	48 98                	cdqe   
  807d01:	66 c7 84 00 c0 ca 42 	mov    WORD PTR [rax+rax*1+0x42cac0],0x0
  807d08:	00 00 00 
    //del dir entry
    write_sec(dir_table,cluster+clu_sec_balance,\
    superblock.secPerClu*superblock.bytesPerSec);
  807d0b:	0f b6 05 5b 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20b5b]        # 42886d <superblock+0xd>
  807d12:	0f b6 d0             	movzx  edx,al
  807d15:	0f b7 05 4f 0b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20b4f]        # 42886b <superblock+0xb>
  807d1c:	0f b7 c0             	movzx  eax,ax
    write_sec(dir_table,cluster+clu_sec_balance,\
  807d1f:	0f af d0             	imul   edx,eax
  807d22:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807d26:	8b 05 d4 23 00 00    	mov    eax,DWORD PTR [rip+0x23d4]        # 80a100 <clu_sec_balance>
  807d2c:	01 c1                	add    ecx,eax
  807d2e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807d32:	89 ce                	mov    esi,ecx
  807d34:	48 89 c7             	mov    rdi,rax
  807d37:	e8 4f f6 ff ff       	call   80738b <write_sec>
    update_fat_and_root();
  807d3c:	b8 00 00 00 00       	mov    eax,0x0
  807d41:	e8 e0 f6 ff ff       	call   807426 <update_fat_and_root>
    return 0;
  807d46:	b8 00 00 00 00       	mov    eax,0x0
}
  807d4b:	c9                   	leave  
  807d4c:	c3                   	ret    

0000000000807d4d <find>:
int find_f=0;
int find(char *name)
{
  807d4d:	f3 0f 1e fa          	endbr64 
  807d51:	55                   	push   rbp
  807d52:	48 89 e5             	mov    rbp,rsp
  807d55:	48 83 ec 30          	sub    rsp,0x30
  807d59:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  807d5d:	c7 45 fc 00 02 00 00 	mov    DWORD PTR [rbp-0x4],0x200
    int index=0;
  807d64:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    dir_entry *dir_table=a_clu_of_dir;
  807d6b:	48 c7 45 f0 c0 c8 42 	mov    QWORD PTR [rbp-0x10],0x42c8c0
  807d72:	00 
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  807d73:	0f b7 05 40 4b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24b40]        # 42c8ba <cur_dir+0x1a>
  807d7a:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
    if(cur_dir.fistCluNum==0)
  807d7e:	0f b7 05 35 4b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24b35]        # 42c8ba <cur_dir+0x1a>
  807d85:	66 85 c0             	test   ax,ax
  807d88:	75 0a                	jne    807d94 <find+0x47>
        dir_table=root_dir;
  807d8a:	48 c7 45 f0 a0 88 42 	mov    QWORD PTR [rbp-0x10],0x4288a0
  807d91:	00 
  807d92:	eb 2b                	jmp    807dbf <find+0x72>
    else {
        max_files=16;
  807d94:	c7 45 fc 10 00 00 00 	mov    DWORD PTR [rbp-0x4],0x10
        read_sec(dir_table, cluster + clu_sec_balance, \
            superblock.secPerClu);
  807d9b:	0f b6 05 cb 0a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20acb]        # 42886d <superblock+0xd>
        read_sec(dir_table, cluster + clu_sec_balance, \
  807da2:	0f b6 d0             	movzx  edx,al
  807da5:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  807da9:	8b 05 51 23 00 00    	mov    eax,DWORD PTR [rip+0x2351]        # 80a100 <clu_sec_balance>
  807daf:	01 c1                	add    ecx,eax
  807db1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807db5:	89 ce                	mov    esi,ecx
  807db7:	48 89 c7             	mov    rdi,rax
  807dba:	e8 c0 fc ff ff       	call   807a7f <read_sec>
    }
    do{
        for(int i=0;i<max_files;i++)
  807dbf:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  807dc6:	eb 57                	jmp    807e1f <find+0xd2>
        {
            if(dir_table[i].name[0]==0||dir_table[i].name[0]==0xe5)
  807dc8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807dcb:	48 98                	cdqe   
  807dcd:	48 c1 e0 05          	shl    rax,0x5
  807dd1:	48 89 c2             	mov    rdx,rax
  807dd4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807dd8:	48 01 d0             	add    rax,rdx
  807ddb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807dde:	84 c0                	test   al,al
  807de0:	74 38                	je     807e1a <find+0xcd>
                continue;
            if(memcmp(dir_table[i].name,name,11)==0)
  807de2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807de5:	48 98                	cdqe   
  807de7:	48 c1 e0 05          	shl    rax,0x5
  807deb:	48 89 c2             	mov    rdx,rax
  807dee:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807df2:	48 01 d0             	add    rax,rdx
  807df5:	48 89 c1             	mov    rcx,rax
  807df8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807dfc:	ba 0b 00 00 00       	mov    edx,0xb
  807e01:	48 89 c6             	mov    rsi,rax
  807e04:	48 89 cf             	mov    rdi,rcx
  807e07:	e8 a4 17 00 00       	call   8095b0 <memcmp>
  807e0c:	85 c0                	test   eax,eax
  807e0e:	75 0b                	jne    807e1b <find+0xce>
            {
                return index+i;
  807e10:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  807e13:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807e16:	01 d0                	add    eax,edx
  807e18:	eb 71                	jmp    807e8b <find+0x13e>
                continue;
  807e1a:	90                   	nop
        for(int i=0;i<max_files;i++)
  807e1b:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  807e1f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807e22:	3b 45 fc             	cmp    eax,DWORD PTR [rbp-0x4]
  807e25:	7c a1                	jl     807dc8 <find+0x7b>
            }
        }
        if(cur_dir.fistCluNum==0)
  807e27:	0f b7 05 8c 4a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24a8c]        # 42c8ba <cur_dir+0x1a>
  807e2e:	66 85 c0             	test   ax,ax
  807e31:	75 07                	jne    807e3a <find+0xed>
            return -1;
  807e33:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807e38:	eb 51                	jmp    807e8b <find+0x13e>
        else if(cluster<FAT_EOF)
  807e3a:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  807e3f:	77 3a                	ja     807e7b <find+0x12e>
        {
            index+=16;
  807e41:	83 45 f8 10          	add    DWORD PTR [rbp-0x8],0x10
            cluster=fat[cluster];
  807e45:	0f b7 45 ee          	movzx  eax,WORD PTR [rbp-0x12]
  807e49:	48 98                	cdqe   
  807e4b:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807e52:	00 
  807e53:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807e57:	0f b6 05 0f 0a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20a0f]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807e5e:	0f b6 d0             	movzx  edx,al
  807e61:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  807e65:	8b 05 95 22 00 00    	mov    eax,DWORD PTR [rip+0x2295]        # 80a100 <clu_sec_balance>
  807e6b:	01 c1                	add    ecx,eax
  807e6d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807e71:	89 ce                	mov    esi,ecx
  807e73:	48 89 c7             	mov    rdi,rax
  807e76:	e8 04 fc ff ff       	call   807a7f <read_sec>
        }
    }while(cluster<FAT_EOF);
  807e7b:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  807e80:	0f 86 39 ff ff ff    	jbe    807dbf <find+0x72>
    return -1;
  807e86:	b8 ff ff ff ff       	mov    eax,0xffffffff

}
  807e8b:	c9                   	leave  
  807e8c:	c3                   	ret    

0000000000807e8d <read_file_byname>:

int read_file_byname(char *full_name,char *dist,int pos,int len)
{
  807e8d:	f3 0f 1e fa          	endbr64 
  807e91:	55                   	push   rbp
  807e92:	48 89 e5             	mov    rbp,rsp
  807e95:	41 57                	push   r15
  807e97:	41 56                	push   r14
  807e99:	41 55                	push   r13
  807e9b:	41 54                	push   r12
  807e9d:	53                   	push   rbx
  807e9e:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  807ea5:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  807eac:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  807eb3:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  807eb9:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  807ebf:	48 89 e0             	mov    rax,rsp
  807ec2:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  807ec5:	bf 00 00 00 00       	mov    edi,0x0
  807eca:	e8 7e fe ff ff       	call   807d4d <find>
  807ecf:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  807ed2:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  807ed6:	74 09                	je     807ee1 <read_file_byname+0x54>
  807ed8:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  807edf:	79 0a                	jns    807eeb <read_file_byname+0x5e>
        return -1;
  807ee1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807ee6:	e9 ea 02 00 00       	jmp    8081d5 <read_file_byname+0x348>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  807eeb:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  807ef2:	48 c7 45 c0 a0 88 42 	mov    QWORD PTR [rbp-0x40],0x4288a0
  807ef9:	00 
    int in_root=1;
  807efa:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  807f01:	0f b7 05 b2 49 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc249b2]        # 42c8ba <cur_dir+0x1a>
  807f08:	66 85 c0             	test   ax,ax
  807f0b:	74 40                	je     807f4d <read_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  807f0d:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  807f14:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  807f1b:	0f b6 05 4b 09 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2094b]        # 42886d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  807f22:	0f b6 c0             	movzx  eax,al
  807f25:	0f b7 15 8e 49 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc2498e]        # 42c8ba <cur_dir+0x1a>
  807f2c:	0f b7 ca             	movzx  ecx,dx
  807f2f:	8b 15 cb 21 00 00    	mov    edx,DWORD PTR [rip+0x21cb]        # 80a100 <clu_sec_balance>
  807f35:	01 d1                	add    ecx,edx
  807f37:	89 c2                	mov    edx,eax
  807f39:	89 ce                	mov    esi,ecx
  807f3b:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  807f40:	e8 3a fb ff ff       	call   807a7f <read_sec>
        dir_table=a_clu_of_dir;
  807f45:	48 c7 45 c0 c0 c8 42 	mov    QWORD PTR [rbp-0x40],0x42c8c0
  807f4c:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  807f4d:	0f b7 05 66 49 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24966]        # 42c8ba <cur_dir+0x1a>
  807f54:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  807f58:	eb 41                	jmp    807f9b <read_file_byname+0x10e>
        index-=16;
  807f5a:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  807f5e:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  807f63:	77 36                	ja     807f9b <read_file_byname+0x10e>
        {
            cluster=fat[cluster];
  807f65:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  807f69:	48 98                	cdqe   
  807f6b:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  807f72:	00 
  807f73:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807f77:	0f b6 05 ef 08 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc208ef]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807f7e:	0f b6 d0             	movzx  edx,al
  807f81:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  807f85:	8b 05 75 21 00 00    	mov    eax,DWORD PTR [rip+0x2175]        # 80a100 <clu_sec_balance>
  807f8b:	01 c1                	add    ecx,eax
  807f8d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807f91:	89 ce                	mov    esi,ecx
  807f93:	48 89 c7             	mov    rdi,rax
  807f96:	e8 e4 fa ff ff       	call   807a7f <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  807f9b:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  807f9f:	75 0d                	jne    807fae <read_file_byname+0x121>
  807fa1:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  807fa5:	7e 07                	jle    807fae <read_file_byname+0x121>
  807fa7:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  807fac:	76 ac                	jbe    807f5a <read_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  807fae:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  807fb1:	48 98                	cdqe   
  807fb3:	48 c1 e0 05          	shl    rax,0x5
  807fb7:	48 89 c2             	mov    rdx,rax
  807fba:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807fbe:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807fc2:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  807fc5:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  807fc9:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  807fd0:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  807fd7:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  807fdb:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  807fdf:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  807fe3:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  807fe7:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  807feb:	0f b7 c0             	movzx  eax,ax
  807fee:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  807ff1:	0f b7 05 73 08 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20873]        # 42886b <superblock+0xb>
  807ff8:	0f b7 d0             	movzx  edx,ax
  807ffb:	0f b6 05 6b 08 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2086b]        # 42886d <superblock+0xd>
  808002:	0f b6 c0             	movzx  eax,al
  808005:	0f af c2             	imul   eax,edx
  808008:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  80800b:	eb 25                	jmp    808032 <read_file_byname+0x1a5>
    {
        pos-=cluster_size;
  80800d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808010:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        f_cluster=fat[f_cluster];
  808016:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808019:	48 98                	cdqe   
  80801b:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808022:	00 
  808023:	98                   	cwde   
  808024:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        if(pos<cluster_size)
  808027:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  80802d:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808030:	7c 0d                	jl     80803f <read_file_byname+0x1b2>
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  808032:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808038:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  80803b:	7d d0                	jge    80800d <read_file_byname+0x180>
  80803d:	eb 01                	jmp    808040 <read_file_byname+0x1b3>
            break;
  80803f:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  808040:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808047:	7e 15                	jle    80805e <read_file_byname+0x1d1>
  808049:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  80804f:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808052:	7c 0a                	jl     80805e <read_file_byname+0x1d1>
        return -1;//pos out of range
  808054:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808059:	e9 77 01 00 00       	jmp    8081d5 <read_file_byname+0x348>
    //
    char temp[cluster_size];
  80805e:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808061:	48 63 d0             	movsxd rdx,eax
  808064:	48 83 ea 01          	sub    rdx,0x1
  808068:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  80806c:	48 63 d0             	movsxd rdx,eax
  80806f:	49 89 d6             	mov    r14,rdx
  808072:	41 bf 00 00 00 00    	mov    r15d,0x0
  808078:	48 63 d0             	movsxd rdx,eax
  80807b:	49 89 d4             	mov    r12,rdx
  80807e:	41 bd 00 00 00 00    	mov    r13d,0x0
  808084:	48 98                	cdqe   
  808086:	ba 10 00 00 00       	mov    edx,0x10
  80808b:	48 83 ea 01          	sub    rdx,0x1
  80808f:	48 01 d0             	add    rax,rdx
  808092:	be 10 00 00 00       	mov    esi,0x10
  808097:	ba 00 00 00 00       	mov    edx,0x0
  80809c:	48 f7 f6             	div    rsi
  80809f:	48 6b c0 10          	imul   rax,rax,0x10
  8080a3:	48 89 c1             	mov    rcx,rax
  8080a6:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  8080ad:	48 89 e2             	mov    rdx,rsp
  8080b0:	48 29 ca             	sub    rdx,rcx
  8080b3:	48 39 d4             	cmp    rsp,rdx
  8080b6:	74 12                	je     8080ca <read_file_byname+0x23d>
  8080b8:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  8080bf:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  8080c6:	00 00 
  8080c8:	eb e9                	jmp    8080b3 <read_file_byname+0x226>
  8080ca:	48 89 c2             	mov    rdx,rax
  8080cd:	81 e2 ff 0f 00 00    	and    edx,0xfff
  8080d3:	48 29 d4             	sub    rsp,rdx
  8080d6:	48 89 c2             	mov    rdx,rax
  8080d9:	81 e2 ff 0f 00 00    	and    edx,0xfff
  8080df:	48 85 d2             	test   rdx,rdx
  8080e2:	74 10                	je     8080f4 <read_file_byname+0x267>
  8080e4:	25 ff 0f 00 00       	and    eax,0xfff
  8080e9:	48 83 e8 08          	sub    rax,0x8
  8080ed:	48 01 e0             	add    rax,rsp
  8080f0:	48 83 08 00          	or     QWORD PTR [rax],0x0
  8080f4:	48 89 e0             	mov    rax,rsp
  8080f7:	48 83 c0 00          	add    rax,0x0
  8080fb:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of reading might be not aligned
    read_sec(temp,f_cluster+clu_sec_balance,superblock.secPerClu);
  8080ff:	0f b6 05 67 07 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20767]        # 42886d <superblock+0xd>
  808106:	0f b6 d0             	movzx  edx,al
  808109:	8b 0d f1 1f 00 00    	mov    ecx,DWORD PTR [rip+0x1ff1]        # 80a100 <clu_sec_balance>
  80810f:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808112:	01 c1                	add    ecx,eax
  808114:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808118:	89 ce                	mov    esi,ecx
  80811a:	48 89 c7             	mov    rdi,rax
  80811d:	e8 5d f9 ff ff       	call   807a7f <read_sec>
    memcpy(dist,temp+pos,cluster_size-pos);
  808122:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808125:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80812b:	89 c2                	mov    edx,eax
  80812d:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808133:	48 63 c8             	movsxd rcx,eax
  808136:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80813a:	48 01 c1             	add    rcx,rax
  80813d:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  808144:	48 89 ce             	mov    rsi,rcx
  808147:	48 89 c7             	mov    rdi,rax
  80814a:	e8 17 14 00 00       	call   809566 <memcpy>
    dist+=cluster_size-pos;
  80814f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808152:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  808158:	48 98                	cdqe   
  80815a:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
    len-=cluster_size-pos;
  808161:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808164:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80816a:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  808170:	eb 4c                	jmp    8081be <read_file_byname+0x331>
    {
        f_cluster=fat[f_cluster];
  808172:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808175:	48 98                	cdqe   
  808177:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  80817e:	00 
  80817f:	98                   	cwde   
  808180:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        read_sec(dist,f_cluster+clu_sec_balance,superblock.secPerClu);
  808183:	0f b6 05 e3 06 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc206e3]        # 42886d <superblock+0xd>
  80818a:	0f b6 d0             	movzx  edx,al
  80818d:	8b 0d 6d 1f 00 00    	mov    ecx,DWORD PTR [rip+0x1f6d]        # 80a100 <clu_sec_balance>
  808193:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808196:	01 c1                	add    ecx,eax
  808198:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  80819f:	89 ce                	mov    esi,ecx
  8081a1:	48 89 c7             	mov    rdi,rax
  8081a4:	e8 d6 f8 ff ff       	call   807a7f <read_sec>
        dist+=cluster_size;
  8081a9:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8081ac:	48 98                	cdqe   
  8081ae:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  8081b5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8081b8:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  8081be:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  8081c5:	7f 09                	jg     8081d0 <read_file_byname+0x343>
  8081c7:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  8081ce:	7f a2                	jg     808172 <read_file_byname+0x2e5>
    }
    return 0;
  8081d0:	b8 00 00 00 00       	mov    eax,0x0
  8081d5:	48 89 dc             	mov    rsp,rbx
    
}
  8081d8:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  8081dc:	5b                   	pop    rbx
  8081dd:	41 5c                	pop    r12
  8081df:	41 5d                	pop    r13
  8081e1:	41 5e                	pop    r14
  8081e3:	41 5f                	pop    r15
  8081e5:	5d                   	pop    rbp
  8081e6:	c3                   	ret    

00000000008081e7 <write_file_byname>:
int write_file_byname(char *full_name,char *src,int pos,int len)
{
  8081e7:	f3 0f 1e fa          	endbr64 
  8081eb:	55                   	push   rbp
  8081ec:	48 89 e5             	mov    rbp,rsp
  8081ef:	41 57                	push   r15
  8081f1:	41 56                	push   r14
  8081f3:	41 55                	push   r13
  8081f5:	41 54                	push   r12
  8081f7:	53                   	push   rbx
  8081f8:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  8081ff:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  808206:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  80820d:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  808213:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  808219:	48 89 e0             	mov    rax,rsp
  80821c:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  80821f:	bf 00 00 00 00       	mov    edi,0x0
  808224:	e8 24 fb ff ff       	call   807d4d <find>
  808229:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  80822c:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  808230:	74 09                	je     80823b <write_file_byname+0x54>
  808232:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  808239:	79 0a                	jns    808245 <write_file_byname+0x5e>
        return -1;
  80823b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808240:	e9 1e 03 00 00       	jmp    808563 <write_file_byname+0x37c>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  808245:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  80824c:	48 c7 45 c0 a0 88 42 	mov    QWORD PTR [rbp-0x40],0x4288a0
  808253:	00 
    int in_root=1;
  808254:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  80825b:	0f b7 05 58 46 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24658]        # 42c8ba <cur_dir+0x1a>
  808262:	66 85 c0             	test   ax,ax
  808265:	74 40                	je     8082a7 <write_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  808267:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  80826e:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  808275:	0f b6 05 f1 05 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc205f1]        # 42886d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  80827c:	0f b6 c0             	movzx  eax,al
  80827f:	0f b7 15 34 46 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc24634]        # 42c8ba <cur_dir+0x1a>
  808286:	0f b7 ca             	movzx  ecx,dx
  808289:	8b 15 71 1e 00 00    	mov    edx,DWORD PTR [rip+0x1e71]        # 80a100 <clu_sec_balance>
  80828f:	01 d1                	add    ecx,edx
  808291:	89 c2                	mov    edx,eax
  808293:	89 ce                	mov    esi,ecx
  808295:	bf c0 c8 42 00       	mov    edi,0x42c8c0
  80829a:	e8 e0 f7 ff ff       	call   807a7f <read_sec>
        dir_table=a_clu_of_dir;
  80829f:	48 c7 45 c0 c0 c8 42 	mov    QWORD PTR [rbp-0x40],0x42c8c0
  8082a6:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  8082a7:	0f b7 05 0c 46 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2460c]        # 42c8ba <cur_dir+0x1a>
  8082ae:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  8082b2:	eb 41                	jmp    8082f5 <write_file_byname+0x10e>
        index-=16;
  8082b4:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  8082b8:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  8082bd:	77 36                	ja     8082f5 <write_file_byname+0x10e>
        {
            cluster=fat[cluster];
  8082bf:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  8082c3:	48 98                	cdqe   
  8082c5:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8082cc:	00 
  8082cd:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  8082d1:	0f b6 05 95 05 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20595]        # 42886d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  8082d8:	0f b6 d0             	movzx  edx,al
  8082db:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  8082df:	8b 05 1b 1e 00 00    	mov    eax,DWORD PTR [rip+0x1e1b]        # 80a100 <clu_sec_balance>
  8082e5:	01 c1                	add    ecx,eax
  8082e7:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8082eb:	89 ce                	mov    esi,ecx
  8082ed:	48 89 c7             	mov    rdi,rax
  8082f0:	e8 8a f7 ff ff       	call   807a7f <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  8082f5:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  8082f9:	75 0d                	jne    808308 <write_file_byname+0x121>
  8082fb:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  8082ff:	7e 07                	jle    808308 <write_file_byname+0x121>
  808301:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  808306:	76 ac                	jbe    8082b4 <write_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  808308:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80830b:	48 98                	cdqe   
  80830d:	48 c1 e0 05          	shl    rax,0x5
  808311:	48 89 c2             	mov    rdx,rax
  808314:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808318:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80831c:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  80831f:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808323:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  80832a:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  808331:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808335:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808339:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  80833d:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  808341:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  808345:	0f b7 c0             	movzx  eax,ax
  808348:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  80834b:	0f b7 05 19 05 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20519]        # 42886b <superblock+0xb>
  808352:	0f b7 d0             	movzx  edx,ax
  808355:	0f b6 05 11 05 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20511]        # 42886d <superblock+0xd>
  80835c:	0f b6 c0             	movzx  eax,al
  80835f:	0f af c2             	imul   eax,edx
  808362:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  808365:	eb 25                	jmp    80838c <write_file_byname+0x1a5>
    {
        pos-=cluster_size;
  808367:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80836a:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        if(pos<cluster_size)
  808370:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808376:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808379:	7c 1e                	jl     808399 <write_file_byname+0x1b2>
            break;
        f_cluster=fat[f_cluster];
  80837b:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80837e:	48 98                	cdqe   
  808380:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808387:	00 
  808388:	98                   	cwde   
  808389:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  80838c:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808392:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808395:	7d d0                	jge    808367 <write_file_byname+0x180>
  808397:	eb 01                	jmp    80839a <write_file_byname+0x1b3>
            break;
  808399:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  80839a:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  8083a1:	7e 15                	jle    8083b8 <write_file_byname+0x1d1>
  8083a3:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8083a9:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8083ac:	7c 0a                	jl     8083b8 <write_file_byname+0x1d1>
        return -1;//pos out of range
  8083ae:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8083b3:	e9 ab 01 00 00       	jmp    808563 <write_file_byname+0x37c>
    //
    char temp[cluster_size];
  8083b8:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8083bb:	48 63 d0             	movsxd rdx,eax
  8083be:	48 83 ea 01          	sub    rdx,0x1
  8083c2:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  8083c6:	48 63 d0             	movsxd rdx,eax
  8083c9:	49 89 d6             	mov    r14,rdx
  8083cc:	41 bf 00 00 00 00    	mov    r15d,0x0
  8083d2:	48 63 d0             	movsxd rdx,eax
  8083d5:	49 89 d4             	mov    r12,rdx
  8083d8:	41 bd 00 00 00 00    	mov    r13d,0x0
  8083de:	48 98                	cdqe   
  8083e0:	ba 10 00 00 00       	mov    edx,0x10
  8083e5:	48 83 ea 01          	sub    rdx,0x1
  8083e9:	48 01 d0             	add    rax,rdx
  8083ec:	be 10 00 00 00       	mov    esi,0x10
  8083f1:	ba 00 00 00 00       	mov    edx,0x0
  8083f6:	48 f7 f6             	div    rsi
  8083f9:	48 6b c0 10          	imul   rax,rax,0x10
  8083fd:	48 89 c1             	mov    rcx,rax
  808400:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  808407:	48 89 e2             	mov    rdx,rsp
  80840a:	48 29 ca             	sub    rdx,rcx
  80840d:	48 39 d4             	cmp    rsp,rdx
  808410:	74 12                	je     808424 <write_file_byname+0x23d>
  808412:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  808419:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  808420:	00 00 
  808422:	eb e9                	jmp    80840d <write_file_byname+0x226>
  808424:	48 89 c2             	mov    rdx,rax
  808427:	81 e2 ff 0f 00 00    	and    edx,0xfff
  80842d:	48 29 d4             	sub    rsp,rdx
  808430:	48 89 c2             	mov    rdx,rax
  808433:	81 e2 ff 0f 00 00    	and    edx,0xfff
  808439:	48 85 d2             	test   rdx,rdx
  80843c:	74 10                	je     80844e <write_file_byname+0x267>
  80843e:	25 ff 0f 00 00       	and    eax,0xfff
  808443:	48 83 e8 08          	sub    rax,0x8
  808447:	48 01 e0             	add    rax,rsp
  80844a:	48 83 08 00          	or     QWORD PTR [rax],0x0
  80844e:	48 89 e0             	mov    rax,rsp
  808451:	48 83 c0 00          	add    rax,0x0
  808455:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of writing might not be aligned
    if(pos>0)
  808459:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  808460:	0f 8e a2 00 00 00    	jle    808508 <write_file_byname+0x321>
    {
        memcpy(temp+pos,src,cluster_size-pos);
  808466:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808469:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80846f:	89 c2                	mov    edx,eax
  808471:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808477:	48 63 c8             	movsxd rcx,eax
  80847a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80847e:	48 01 c1             	add    rcx,rax
  808481:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  808488:	48 89 c6             	mov    rsi,rax
  80848b:	48 89 cf             	mov    rdi,rcx
  80848e:	e8 d3 10 00 00       	call   809566 <memcpy>
        write_sec(temp,f_cluster,cluster_size-pos);
  808493:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808496:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80849c:	89 c2                	mov    edx,eax
  80849e:	8b 4d b4             	mov    ecx,DWORD PTR [rbp-0x4c]
  8084a1:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8084a5:	89 ce                	mov    esi,ecx
  8084a7:	48 89 c7             	mov    rdi,rax
  8084aa:	e8 dc ee ff ff       	call   80738b <write_sec>
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  8084af:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8084b2:	48 98                	cdqe   
  8084b4:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  8084bb:	00 
  8084bc:	98                   	cwde   
  8084bd:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    }
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  8084c0:	eb 46                	jmp    808508 <write_file_byname+0x321>
    {
        write_sec(src,f_cluster+clu_sec_balance,cluster_size);
  8084c2:	8b 15 38 1c 00 00    	mov    edx,DWORD PTR [rip+0x1c38]        # 80a100 <clu_sec_balance>
  8084c8:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8084cb:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  8084ce:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  8084d1:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8084d8:	89 ce                	mov    esi,ecx
  8084da:	48 89 c7             	mov    rdi,rax
  8084dd:	e8 a9 ee ff ff       	call   80738b <write_sec>
        src+=cluster_size;
  8084e2:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8084e5:	48 98                	cdqe   
  8084e7:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  8084ee:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8084f1:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  8084f7:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8084fa:	48 98                	cdqe   
  8084fc:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808503:	00 
  808504:	98                   	cwde   
  808505:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  808508:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  80850f:	7f 0b                	jg     80851c <write_file_byname+0x335>
  808511:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa8]
  808517:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  80851a:	7d a6                	jge    8084c2 <write_file_byname+0x2db>
    }
    if(len>0)
  80851c:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  808523:	7e 39                	jle    80855e <write_file_byname+0x377>
    {
        //there might be some leftover less than a cluster
        memcpy(temp,src,len);
  808525:	8b 95 58 ff ff ff    	mov    edx,DWORD PTR [rbp-0xa8]
  80852b:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  808532:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808536:	48 89 ce             	mov    rsi,rcx
  808539:	48 89 c7             	mov    rdi,rax
  80853c:	e8 25 10 00 00       	call   809566 <memcpy>
        write_sec(temp,f_cluster+clu_sec_balance,cluster_size);
  808541:	8b 15 b9 1b 00 00    	mov    edx,DWORD PTR [rip+0x1bb9]        # 80a100 <clu_sec_balance>
  808547:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80854a:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80854d:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  808550:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808554:	89 ce                	mov    esi,ecx
  808556:	48 89 c7             	mov    rdi,rax
  808559:	e8 2d ee ff ff       	call   80738b <write_sec>
    }
    return 0;
  80855e:	b8 00 00 00 00       	mov    eax,0x0
  808563:	48 89 dc             	mov    rsp,rbx

}
  808566:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  80856a:	5b                   	pop    rbx
  80856b:	41 5c                	pop    r12
  80856d:	41 5d                	pop    r13
  80856f:	41 5e                	pop    r14
  808571:	41 5f                	pop    r15
  808573:	5d                   	pop    rbp
  808574:	c3                   	ret    

0000000000808575 <file_exist>:


int file_exist(dir_entry entry)
{
  808575:	f3 0f 1e fa          	endbr64 
  808579:	55                   	push   rbp
  80857a:	48 89 e5             	mov    rbp,rsp
    if((unsigned char)entry.name[0]==0xe5u||\
  80857d:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
  808581:	3c e5                	cmp    al,0xe5
  808583:	74 08                	je     80858d <file_exist+0x18>
    (unsigned char)entry.name[0]==0u)
  808585:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
    if((unsigned char)entry.name[0]==0xe5u||\
  808589:	84 c0                	test   al,al
  80858b:	75 07                	jne    808594 <file_exist+0x1f>
    {
        //printf("file not exist\n");
        return 0;
  80858d:	b8 00 00 00 00       	mov    eax,0x0
  808592:	eb 05                	jmp    808599 <file_exist+0x24>

    }
    return 1;
  808594:	b8 01 00 00 00       	mov    eax,0x1
}
  808599:	5d                   	pop    rbp
  80859a:	c3                   	ret    

000000000080859b <get_entry>:
int get_entry(driver_args* args)
{
  80859b:	f3 0f 1e fa          	endbr64 
  80859f:	55                   	push   rbp
  8085a0:	48 89 e5             	mov    rbp,rsp
  8085a3:	53                   	push   rbx
  8085a4:	48 81 ec e8 00 00 00 	sub    rsp,0xe8
  8085ab:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
    char *name=args->path;
  8085b2:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8085b9:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8085bd:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    dir.fistCluNum=((vfs_dir_entry*)args->cwd)->id;
  8085c1:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8085c8:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  8085cf:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8085d2:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    dir_entry entry;
    vfs_dir_entry ret;
    entry.name[0]=0xe5;
  8085d6:	c6 45 90 e5          	mov    BYTE PTR [rbp-0x70],0xe5

    char *p=name;
  8085da:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8085de:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    char nametmp[12];
    int index=-1;
  8085e2:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [rbp-0x24],0xffffffff
    while(*name!='\0')
  8085e9:	e9 2c 01 00 00       	jmp    80871a <get_entry+0x17f>
    {
        if(*name=='/')
  8085ee:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8085f2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8085f5:	3c 2f                	cmp    al,0x2f
  8085f7:	0f 85 18 01 00 00    	jne    808715 <get_entry+0x17a>
        {
            if(name-p>11)return -1;
  8085fd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808601:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  808605:	48 83 f8 0b          	cmp    rax,0xb
  808609:	7e 0a                	jle    808615 <get_entry+0x7a>
  80860b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808610:	e9 50 02 00 00       	jmp    808865 <get_entry+0x2ca>
            memcpy(nametmp,p,name-p);
  808615:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808619:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  80861d:	89 c2                	mov    edx,eax
  80861f:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  808623:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  80862a:	48 89 ce             	mov    rsi,rcx
  80862d:	48 89 c7             	mov    rdi,rax
  808630:	e8 31 0f 00 00       	call   809566 <memcpy>
            cur_dir=dir;
  808635:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808639:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80863d:	48 89 05 5c 42 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2425c],rax        # 42c8a0 <cur_dir>
  808644:	48 89 15 5d 42 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2425d],rdx        # 42c8a8 <cur_dir+0x8>
  80864b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80864f:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808653:	48 89 05 56 42 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc24256],rax        # 42c8b0 <cur_dir+0x10>
  80865a:	48 89 15 57 42 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc24257],rdx        # 42c8b8 <cur_dir+0x18>
            format_name(nametmp);
  808661:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  808668:	48 89 c7             	mov    rdi,rax
  80866b:	e8 c3 eb ff ff       	call   807233 <format_name>
            index= find(nametmp);
  808670:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  808677:	48 89 c7             	mov    rdi,rax
  80867a:	e8 ce f6 ff ff       	call   807d4d <find>
  80867f:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            if(index==-1)return -1;
  808682:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  808686:	75 0a                	jne    808692 <get_entry+0xf7>
  808688:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80868d:	e9 d3 01 00 00       	jmp    808865 <get_entry+0x2ca>
            if(cur_dir.fistCluNum==0)//在根目录
  808692:	0f b7 05 21 42 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24221]        # 42c8ba <cur_dir+0x1a>
  808699:	66 85 c0             	test   ax,ax
  80869c:	75 31                	jne    8086cf <get_entry+0x134>
                dir=root_dir[index];
  80869e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8086a1:	48 98                	cdqe   
  8086a3:	48 c1 e0 05          	shl    rax,0x5
  8086a7:	48 8d 88 a0 88 42 00 	lea    rcx,[rax+0x4288a0]
  8086ae:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8086b1:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  8086b5:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  8086b9:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  8086bd:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8086c1:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  8086c5:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  8086c9:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  8086cd:	eb 3a                	jmp    808709 <get_entry+0x16e>
            else//在子目录
                dir=a_clu_of_dir[index%16];
  8086cf:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8086d2:	99                   	cdq    
  8086d3:	c1 ea 1c             	shr    edx,0x1c
  8086d6:	01 d0                	add    eax,edx
  8086d8:	83 e0 0f             	and    eax,0xf
  8086db:	29 d0                	sub    eax,edx
  8086dd:	48 98                	cdqe   
  8086df:	48 c1 e0 05          	shl    rax,0x5
  8086e3:	48 8d 88 c0 c8 42 00 	lea    rcx,[rax+0x42c8c0]
  8086ea:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8086ed:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  8086f1:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  8086f5:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  8086f9:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8086fd:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808701:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  808705:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
            p=name+1;
  808709:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80870d:	48 83 c0 01          	add    rax,0x1
  808711:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        }
        name++;
  808715:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
    while(*name!='\0')
  80871a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80871e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808721:	84 c0                	test   al,al
  808723:	0f 85 c5 fe ff ff    	jne    8085ee <get_entry+0x53>
    }

    //现在就可以开始找文件了
    format_name(p);
  808729:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80872d:	48 89 c7             	mov    rdi,rax
  808730:	e8 fe ea ff ff       	call   807233 <format_name>
    index= find(p);
  808735:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808739:	48 89 c7             	mov    rdi,rax
  80873c:	e8 0c f6 ff ff       	call   807d4d <find>
  808741:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    if(index==-1)return -1;
  808744:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  808748:	75 0a                	jne    808754 <get_entry+0x1b9>
  80874a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80874f:	e9 11 01 00 00       	jmp    808865 <get_entry+0x2ca>
    
    if(cur_dir.fistCluNum==0)//在根目录
  808754:	0f b7 05 5f 41 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2415f]        # 42c8ba <cur_dir+0x1a>
  80875b:	66 85 c0             	test   ax,ax
  80875e:	75 31                	jne    808791 <get_entry+0x1f6>
        entry=root_dir[index];
  808760:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808763:	48 98                	cdqe   
  808765:	48 c1 e0 05          	shl    rax,0x5
  808769:	48 8d 88 a0 88 42 00 	lea    rcx,[rax+0x4288a0]
  808770:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808773:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808777:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  80877b:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  80877f:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808783:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808787:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  80878b:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  80878f:	eb 3a                	jmp    8087cb <get_entry+0x230>
    else//在子目录
        entry=a_clu_of_dir[index%16];
  808791:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808794:	99                   	cdq    
  808795:	c1 ea 1c             	shr    edx,0x1c
  808798:	01 d0                	add    eax,edx
  80879a:	83 e0 0f             	and    eax,0xf
  80879d:	29 d0                	sub    eax,edx
  80879f:	48 98                	cdqe   
  8087a1:	48 c1 e0 05          	shl    rax,0x5
  8087a5:	48 8d 88 c0 c8 42 00 	lea    rcx,[rax+0x42c8c0]
  8087ac:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8087af:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  8087b3:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  8087b7:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  8087bb:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8087bf:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  8087c3:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  8087c7:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
    ret.id=entry.fistCluNum;
  8087cb:	0f b7 45 aa          	movzx  eax,WORD PTR [rbp-0x56]
  8087cf:	0f b7 c0             	movzx  eax,ax
  8087d2:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    args->entry=ret;
  8087d8:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8087df:	48 8b 8d 30 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd0]
  8087e6:	48 8b 9d 38 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xc8]
  8087ed:	48 89 48 28          	mov    QWORD PTR [rax+0x28],rcx
  8087f1:	48 89 58 30          	mov    QWORD PTR [rax+0x30],rbx
  8087f5:	48 8b 8d 40 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xc0]
  8087fc:	48 8b 9d 48 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xb8]
  808803:	48 89 48 38          	mov    QWORD PTR [rax+0x38],rcx
  808807:	48 89 58 40          	mov    QWORD PTR [rax+0x40],rbx
  80880b:	48 8b 8d 50 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb0]
  808812:	48 8b 9d 58 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xa8]
  808819:	48 89 48 48          	mov    QWORD PTR [rax+0x48],rcx
  80881d:	48 89 58 50          	mov    QWORD PTR [rax+0x50],rbx
  808821:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  808828:	48 8b 9d 68 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x98]
  80882f:	48 89 48 58          	mov    QWORD PTR [rax+0x58],rcx
  808833:	48 89 58 60          	mov    QWORD PTR [rax+0x60],rbx
  808837:	48 8b 8d 70 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x90]
  80883e:	48 8b 9d 78 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x88]
  808845:	48 89 48 68          	mov    QWORD PTR [rax+0x68],rcx
  808849:	48 89 58 70          	mov    QWORD PTR [rax+0x70],rbx
  80884d:	48 8b 4d 80          	mov    rcx,QWORD PTR [rbp-0x80]
  808851:	48 8b 5d 88          	mov    rbx,QWORD PTR [rbp-0x78]
  808855:	48 89 48 78          	mov    QWORD PTR [rax+0x78],rcx
  808859:	48 89 98 80 00 00 00 	mov    QWORD PTR [rax+0x80],rbx
    return 0;
  808860:	b8 00 00 00 00       	mov    eax,0x0
}
  808865:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  808869:	c9                   	leave  
  80886a:	c3                   	ret    

000000000080886b <get_fname>:
        dir=strtok(NULL,'/');
    }
    return 0;
}*/
void get_fname(char *path,char *name)
{
  80886b:	f3 0f 1e fa          	endbr64 
  80886f:	55                   	push   rbp
  808870:	48 89 e5             	mov    rbp,rsp
  808873:	48 83 ec 20          	sub    rsp,0x20
  808877:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80887b:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    char *prev,*ptr=strtok(path,'/');
  80887f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808883:	be 2f 00 00 00       	mov    esi,0x2f
  808888:	48 89 c7             	mov    rdi,rax
  80888b:	e8 18 0e 00 00       	call   8096a8 <strtok>
  808890:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  808894:	eb 1b                	jmp    8088b1 <get_fname+0x46>
    {
        prev=ptr;
  808896:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80889a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        ptr=strtok(NULL,'/');
  80889e:	be 2f 00 00 00       	mov    esi,0x2f
  8088a3:	bf 00 00 00 00       	mov    edi,0x0
  8088a8:	e8 fb 0d 00 00       	call   8096a8 <strtok>
  8088ad:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  8088b1:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8088b6:	75 de                	jne    808896 <get_fname+0x2b>
    }
    strcpy(name,prev);
  8088b8:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8088bc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8088c0:	48 89 d6             	mov    rsi,rdx
  8088c3:	48 89 c7             	mov    rdi,rax
  8088c6:	e8 99 0d 00 00       	call   809664 <strcpy>
}
  8088cb:	90                   	nop
  8088cc:	c9                   	leave  
  8088cd:	c3                   	ret    

00000000008088ce <read_file>:
char buf[1024];
int read_file(driver_args* args)
{
  8088ce:	f3 0f 1e fa          	endbr64 
  8088d2:	55                   	push   rbp
  8088d3:	48 89 e5             	mov    rbp,rsp
  8088d6:	48 83 ec 60          	sub    rsp,0x60
  8088da:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    int len=args->len;
  8088de:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8088e2:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8088e5:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int pos=args->pos;
  8088e8:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8088ec:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8088ef:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  8088f2:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8088f6:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8088f9:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    char* dist=args->dist_addr;
  8088fd:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808901:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808904:	48 98                	cdqe   
  808906:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int c=len/superblock.bytesPerSec;
  80890a:	0f b7 05 5a ff c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1ff5a]        # 42886b <superblock+0xb>
  808911:	0f b7 f0             	movzx  esi,ax
  808914:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808917:	99                   	cdq    
  808918:	f7 fe                	idiv   esi
  80891a:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    c+=len%superblock.bytesPerSec?1:0;
  80891d:	0f b7 05 47 ff c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1ff47]        # 42886b <superblock+0xb>
  808924:	0f b7 c8             	movzx  ecx,ax
  808927:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80892a:	99                   	cdq    
  80892b:	f7 f9                	idiv   ecx
  80892d:	89 d0                	mov    eax,edx
  80892f:	85 c0                	test   eax,eax
  808931:	0f 95 c0             	setne  al
  808934:	0f b6 c0             	movzx  eax,al
  808937:	01 45 dc             	add    DWORD PTR [rbp-0x24],eax
    //printf("[fs]%d secs to sys_read.\n",c);
    int n=0;
  80893a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808941:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  808945:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    int mpos=pos/superblock.bytesPerSec;
  808949:	0f b7 05 1b ff c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1ff1b]        # 42886b <superblock+0xb>
  808950:	0f b7 f8             	movzx  edi,ax
  808953:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808956:	99                   	cdq    
  808957:	f7 ff                	idiv   edi
  808959:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  80895c:	eb 16                	jmp    808974 <read_file+0xa6>
    {
         clu=fat[clu];
  80895e:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808962:	48 98                	cdqe   
  808964:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  80896b:	00 
  80896c:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  808970:	83 6d e4 01          	sub    DWORD PTR [rbp-0x1c],0x1
  808974:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808979:	77 06                	ja     808981 <read_file+0xb3>
  80897b:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  80897f:	7f dd                	jg     80895e <read_file+0x90>
    }
    if(mpos>0)return -1;//读取位置超出范围
  808981:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  808985:	7e 0a                	jle    808991 <read_file+0xc3>
  808987:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80898c:	e9 cd 00 00 00       	jmp    808a5e <read_file+0x190>
    pos%=superblock.bytesPerSec;
  808991:	0f b7 05 d3 fe c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1fed3]        # 42886b <superblock+0xb>
  808998:	0f b7 c8             	movzx  ecx,ax
  80899b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80899e:	99                   	cdq    
  80899f:	f7 f9                	idiv   ecx
  8089a1:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
    int block_size=superblock.secPerClu*superblock.bytesPerSec;
  8089a4:	0f b6 05 c2 fe c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fec2]        # 42886d <superblock+0xd>
  8089ab:	0f b6 d0             	movzx  edx,al
  8089ae:	0f b7 05 b6 fe c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1feb6]        # 42886b <superblock+0xb>
  8089b5:	0f b7 c0             	movzx  eax,ax
  8089b8:	0f af c2             	imul   eax,edx
  8089bb:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    while(n<c)
  8089be:	e9 89 00 00 00       	jmp    808a4c <read_file+0x17e>
    {
        read_sec(buf,clu+clu_sec_balance,superblock.secPerClu);
  8089c3:	0f b6 05 a3 fe c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fea3]        # 42886d <superblock+0xd>
  8089ca:	0f b6 c0             	movzx  eax,al
  8089cd:	0f b7 4d ea          	movzx  ecx,WORD PTR [rbp-0x16]
  8089d1:	8b 15 29 17 00 00    	mov    edx,DWORD PTR [rip+0x1729]        # 80a100 <clu_sec_balance>
  8089d7:	01 d1                	add    ecx,edx
  8089d9:	89 c2                	mov    edx,eax
  8089db:	89 ce                	mov    esi,ecx
  8089dd:	bf e0 0a 43 00       	mov    edi,0x430ae0
  8089e2:	e8 98 f0 ff ff       	call   807a7f <read_sec>
        //printf("%x+%x\n",buf,pos);
        int cplen=block_size-pos>len?len:block_size-pos;
  8089e7:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8089ea:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  8089ed:	8b 55 e0             	mov    edx,DWORD PTR [rbp-0x20]
  8089f0:	39 c2                	cmp    edx,eax
  8089f2:	0f 4e c2             	cmovle eax,edx
  8089f5:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
        memcpy(dist,buf+pos,cplen);
  8089f8:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  8089fb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8089fe:	48 98                	cdqe   
  808a00:	48 8d 88 e0 0a 43 00 	lea    rcx,[rax+0x430ae0]
  808a07:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808a0b:	48 89 ce             	mov    rsi,rcx
  808a0e:	48 89 c7             	mov    rdi,rax
  808a11:	e8 50 0b 00 00       	call   809566 <memcpy>
        n++;
  808a16:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        dist+=block_size-pos;
  808a1a:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  808a1d:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  808a20:	48 98                	cdqe   
  808a22:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        if(pos>0)pos=0;
  808a26:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808a2a:	7e 07                	jle    808a33 <read_file+0x165>
  808a2c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        clu=fat[clu];
  808a33:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808a37:	48 98                	cdqe   
  808a39:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808a40:	00 
  808a41:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  808a45:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808a4a:	77 0e                	ja     808a5a <read_file+0x18c>
    while(n<c)
  808a4c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808a4f:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  808a52:	0f 8c 6b ff ff ff    	jl     8089c3 <read_file+0xf5>
  808a58:	eb 01                	jmp    808a5b <read_file+0x18d>
        if(clu>=FAT_EOF)break;
  808a5a:	90                   	nop
    }
    return n;
  808a5b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
}
  808a5e:	c9                   	leave  
  808a5f:	c3                   	ret    

0000000000808a60 <write_file>:
int write_file(driver_args* args)
{
  808a60:	f3 0f 1e fa          	endbr64 
  808a64:	55                   	push   rbp
  808a65:	48 89 e5             	mov    rbp,rsp
  808a68:	48 83 ec 50          	sub    rsp,0x50
  808a6c:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    int len=args->len;
  808a70:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808a74:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808a77:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    int pos=args->pos;
  808a7a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808a7e:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808a81:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  808a84:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808a88:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  808a8b:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    char* src=args->src_addr;
  808a8f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808a93:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808a96:	48 98                	cdqe   
  808a98:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    pos/=superblock.bytesPerSec;
  808a9c:	0f b7 05 c8 fd c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1fdc8]        # 42886b <superblock+0xb>
  808aa3:	0f b7 f0             	movzx  esi,ax
  808aa6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808aa9:	99                   	cdq    
  808aaa:	f7 fe                	idiv   esi
  808aac:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=len/512+len%512?1:0;
  808aaf:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808ab2:	8d 90 ff 01 00 00    	lea    edx,[rax+0x1ff]
  808ab8:	85 c0                	test   eax,eax
  808aba:	0f 48 c2             	cmovs  eax,edx
  808abd:	c1 f8 09             	sar    eax,0x9
  808ac0:	89 c1                	mov    ecx,eax
  808ac2:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808ac5:	99                   	cdq    
  808ac6:	c1 ea 17             	shr    edx,0x17
  808ac9:	01 d0                	add    eax,edx
  808acb:	25 ff 01 00 00       	and    eax,0x1ff
  808ad0:	29 d0                	sub    eax,edx
  808ad2:	01 c8                	add    eax,ecx
  808ad4:	85 c0                	test   eax,eax
  808ad6:	0f 95 c0             	setne  al
  808ad9:	0f b6 c0             	movzx  eax,al
  808adc:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int n=0;
  808adf:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808ae6:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  808aea:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&pos>0;pos--,clu=fat[clu]);
  808aee:	eb 16                	jmp    808b06 <write_file+0xa6>
  808af0:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  808af4:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808af8:	48 98                	cdqe   
  808afa:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808b01:	00 
  808b02:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  808b06:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808b0b:	77 06                	ja     808b13 <write_file+0xb3>
  808b0d:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808b11:	7f dd                	jg     808af0 <write_file+0x90>
    if(pos>0)return -1;//读取位置超出范围
  808b13:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808b17:	7e 52                	jle    808b6b <write_file+0x10b>
  808b19:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808b1e:	eb 59                	jmp    808b79 <write_file+0x119>
    while(n<c)
    {
        write_sec(src,clu+clu_sec_balance,1);
  808b20:	0f b7 55 ea          	movzx  edx,WORD PTR [rbp-0x16]
  808b24:	8b 05 d6 15 00 00    	mov    eax,DWORD PTR [rip+0x15d6]        # 80a100 <clu_sec_balance>
  808b2a:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  808b2d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808b31:	ba 01 00 00 00       	mov    edx,0x1
  808b36:	89 ce                	mov    esi,ecx
  808b38:	48 89 c7             	mov    rdi,rax
  808b3b:	e8 4b e8 ff ff       	call   80738b <write_sec>
        n++;
  808b40:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        src+=superblock.bytesPerSec;
  808b44:	0f b7 05 20 fd c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1fd20]        # 42886b <superblock+0xb>
  808b4b:	0f b7 c0             	movzx  eax,ax
  808b4e:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        clu=fat[clu];
  808b52:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808b56:	48 98                	cdqe   
  808b58:	0f b7 84 00 c0 ca 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cac0]
  808b5f:	00 
  808b60:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  808b64:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808b69:	77 0a                	ja     808b75 <write_file+0x115>
    while(n<c)
  808b6b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808b6e:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  808b71:	7c ad                	jl     808b20 <write_file+0xc0>
  808b73:	eb 01                	jmp    808b76 <write_file+0x116>
        if(clu>=FAT_EOF)break;
  808b75:	90                   	nop
    }
    return n;
  808b76:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    
  808b79:	c9                   	leave  
  808b7a:	c3                   	ret    

0000000000808b7b <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  808b7b:	f3 0f 1e fa          	endbr64 
  808b7f:	55                   	push   rbp
  808b80:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  808b83:	48 8b 05 66 83 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc28366]        # 430ef0 <vpage_base>
  808b8a:	48 05 a0 00 00 00    	add    rax,0xa0
  808b90:	48 89 05 59 83 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28359],rax        # 430ef0 <vpage_base>
    page_boffset+=SCREEN_W*2;
  808b97:	8b 05 5b 83 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2835b]        # 430ef8 <page_boffset>
  808b9d:	05 a0 00 00 00       	add    eax,0xa0
  808ba2:	89 05 50 83 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28350],eax        # 430ef8 <page_boffset>
    if(vpage_base>=video_end)
  808ba8:	48 8b 15 41 83 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc28341]        # 430ef0 <vpage_base>
  808baf:	48 8b 05 32 83 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc28332]        # 430ee8 <video_end>
  808bb6:	48 39 c2             	cmp    rdx,rax
  808bb9:	72 0e                	jb     808bc9 <scrdown+0x4e>
        vpage_base=video_base;
  808bbb:	48 8b 05 1e 83 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2831e]        # 430ee0 <video_base>
  808bc2:	48 89 05 27 83 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28327],rax        # 430ef0 <vpage_base>
    set_origin();
  808bc9:	b8 00 00 00 00       	mov    eax,0x0
  808bce:	e8 6a 00 00 00       	call   808c3d <set_origin>
}
  808bd3:	90                   	nop
  808bd4:	5d                   	pop    rbp
  808bd5:	c3                   	ret    

0000000000808bd6 <scrup>:
void scrup()
{
  808bd6:	f3 0f 1e fa          	endbr64 
  808bda:	55                   	push   rbp
  808bdb:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  808bde:	8b 05 14 83 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28314]        # 430ef8 <page_boffset>
  808be4:	85 c0                	test   eax,eax
  808be6:	75 24                	jne    808c0c <scrup+0x36>
    {
        page_boffset=0;
  808be8:	c7 05 06 83 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28306],0x0        # 430ef8 <page_boffset>
  808bef:	00 00 00 
        vpage_base=video_base;
  808bf2:	48 8b 05 e7 82 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc282e7]        # 430ee0 <video_base>
  808bf9:	48 89 05 f0 82 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc282f0],rax        # 430ef0 <vpage_base>
        set_origin();
  808c00:	b8 00 00 00 00       	mov    eax,0x0
  808c05:	e8 33 00 00 00       	call   808c3d <set_origin>
        return;
  808c0a:	eb 2f                	jmp    808c3b <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  808c0c:	48 8b 05 dd 82 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc282dd]        # 430ef0 <vpage_base>
  808c13:	48 2d a0 00 00 00    	sub    rax,0xa0
  808c19:	48 89 05 d0 82 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc282d0],rax        # 430ef0 <vpage_base>
    page_boffset-=SCREEN_W*2;
  808c20:	8b 05 d2 82 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc282d2]        # 430ef8 <page_boffset>
  808c26:	2d a0 00 00 00       	sub    eax,0xa0
  808c2b:	89 05 c7 82 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc282c7],eax        # 430ef8 <page_boffset>
    set_origin();
  808c31:	b8 00 00 00 00       	mov    eax,0x0
  808c36:	e8 02 00 00 00       	call   808c3d <set_origin>
}
  808c3b:	5d                   	pop    rbp
  808c3c:	c3                   	ret    

0000000000808c3d <set_origin>:
void set_origin(void)
{
  808c3d:	f3 0f 1e fa          	endbr64 
  808c41:	55                   	push   rbp
  808c42:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  808c45:	fa                   	cli    
    outb(port_reg_index,12);
  808c46:	8b 05 bc 82 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc282bc]        # 430f08 <port_reg_index>
  808c4c:	0f b7 c0             	movzx  eax,ax
  808c4f:	be 0c 00 00 00       	mov    esi,0xc
  808c54:	89 c7                	mov    edi,eax
  808c56:	e8 15 bd ff ff       	call   804970 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  808c5b:	8b 05 97 82 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28297]        # 430ef8 <page_boffset>
  808c61:	c1 e8 09             	shr    eax,0x9
  808c64:	0f b6 d0             	movzx  edx,al
  808c67:	8b 05 9f 82 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2829f]        # 430f0c <port_reg_v>
  808c6d:	0f b7 c0             	movzx  eax,ax
  808c70:	89 d6                	mov    esi,edx
  808c72:	89 c7                	mov    edi,eax
  808c74:	e8 f7 bc ff ff       	call   804970 <outb>
    outb(port_reg_index,13);
  808c79:	8b 05 89 82 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28289]        # 430f08 <port_reg_index>
  808c7f:	0f b7 c0             	movzx  eax,ax
  808c82:	be 0d 00 00 00       	mov    esi,0xd
  808c87:	89 c7                	mov    edi,eax
  808c89:	e8 e2 bc ff ff       	call   804970 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  808c8e:	8b 05 64 82 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28264]        # 430ef8 <page_boffset>
  808c94:	d1 e8                	shr    eax,1
  808c96:	0f b6 d0             	movzx  edx,al
  808c99:	8b 05 6d 82 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2826d]        # 430f0c <port_reg_v>
  808c9f:	0f b7 c0             	movzx  eax,ax
  808ca2:	89 d6                	mov    esi,edx
  808ca4:	89 c7                	mov    edi,eax
  808ca6:	e8 c5 bc ff ff       	call   804970 <outb>
    asm volatile("sti");
  808cab:	fb                   	sti    

}
  808cac:	90                   	nop
  808cad:	5d                   	pop    rbp
  808cae:	c3                   	ret    

0000000000808caf <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  808caf:	f3 0f 1e fa          	endbr64 
  808cb3:	55                   	push   rbp
  808cb4:	48 89 e5             	mov    rbp,rsp
  808cb7:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  808cbb:	be 88 21 81 00       	mov    esi,0x812188
  808cc0:	bf 34 20 81 00       	mov    edi,0x812034
  808cc5:	e8 9a 09 00 00       	call   809664 <strcpy>
    strcpy(dev_stdout.name,"stdout");
  808cca:	be 8d 21 81 00       	mov    esi,0x81218d
  808ccf:	bf f4 20 81 00       	mov    edi,0x8120f4
  808cd4:	e8 8b 09 00 00       	call   809664 <strcpy>
    reg_driver(&drv_tty);
  808cd9:	bf 80 1f 81 00       	mov    edi,0x811f80
  808cde:	e8 70 9f ff ff       	call   802c53 <reg_driver>
    reg_device(&dev_tty);
  808ce3:	bf 20 20 81 00       	mov    edi,0x812020
  808ce8:	e8 7e 9c ff ff       	call   80296b <reg_device>
    reg_device(&dev_stdout);
  808ced:	bf e0 20 81 00       	mov    edi,0x8120e0
  808cf2:	e8 74 9c ff ff       	call   80296b <reg_device>
    unsigned char *vp=0x20000;
  808cf7:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  808cfe:	00 
    if(*vp==0x7)
  808cff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d03:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d06:	3c 07                	cmp    al,0x7
  808d08:	75 36                	jne    808d40 <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  808d0a:	c7 05 e8 81 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc281e8],0x0        # 430efc <video_mode>
  808d11:	00 00 00 
        video_base=0xb0000;
  808d14:	48 c7 05 c1 81 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc281c1],0xb0000        # 430ee0 <video_base>
  808d1b:	00 00 0b 00 
        video_end=0xb8000-1;
  808d1f:	48 c7 05 be 81 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc281be],0xb7fff        # 430ee8 <video_end>
  808d26:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  808d2a:	c7 05 d4 81 c2 ff b4 	mov    DWORD PTR [rip+0xffffffffffc281d4],0x3b4        # 430f08 <port_reg_index>
  808d31:	03 00 00 
        port_reg_v=0x3b5;
  808d34:	c7 05 ce 81 c2 ff b5 	mov    DWORD PTR [rip+0xffffffffffc281ce],0x3b5        # 430f0c <port_reg_v>
  808d3b:	03 00 00 
  808d3e:	eb 61                	jmp    808da1 <init_tty+0xf2>
    }else if(*vp<=0x3)
  808d40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d44:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d47:	3c 03                	cmp    al,0x3
  808d49:	77 36                	ja     808d81 <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  808d4b:	c7 05 a7 81 c2 ff 01 	mov    DWORD PTR [rip+0xffffffffffc281a7],0x1        # 430efc <video_mode>
  808d52:	00 00 00 
        video_base=0xb8000;
  808d55:	48 c7 05 80 81 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28180],0xb8000        # 430ee0 <video_base>
  808d5c:	00 80 0b 00 
        video_end=0xc0000-1;
  808d60:	48 c7 05 7d 81 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2817d],0xbffff        # 430ee8 <video_end>
  808d67:	ff ff 0b 00 
        port_reg_index=0x3d4;
  808d6b:	c7 05 93 81 c2 ff d4 	mov    DWORD PTR [rip+0xffffffffffc28193],0x3d4        # 430f08 <port_reg_index>
  808d72:	03 00 00 
        port_reg_v=0x3d5;
  808d75:	c7 05 8d 81 c2 ff d5 	mov    DWORD PTR [rip+0xffffffffffc2818d],0x3d5        # 430f0c <port_reg_v>
  808d7c:	03 00 00 
  808d7f:	eb 20                	jmp    808da1 <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  808d81:	c7 05 71 81 c2 ff 02 	mov    DWORD PTR [rip+0xffffffffffc28171],0x2        # 430efc <video_mode>
  808d88:	00 00 00 
        video_base=0xa0000;
  808d8b:	48 c7 05 4a 81 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2814a],0xa0000        # 430ee0 <video_base>
  808d92:	00 00 0a 00 
        video_end=0xb0000-1;
  808d96:	48 c7 05 47 81 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28147],0xaffff        # 430ee8 <video_end>
  808d9d:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  808da1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808da5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808da8:	3c 01                	cmp    al,0x1
  808daa:	77 0f                	ja     808dbb <init_tty+0x10c>
  808dac:	c7 05 4e 81 c2 ff 28 	mov    DWORD PTR [rip+0xffffffffffc2814e],0x28        # 430f04 <line_chs>
  808db3:	00 00 00 
  808db6:	e9 91 00 00 00       	jmp    808e4c <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  808dbb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808dbf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808dc2:	3c 03                	cmp    al,0x3
  808dc4:	76 0b                	jbe    808dd1 <init_tty+0x122>
  808dc6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808dca:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808dcd:	3c 07                	cmp    al,0x7
  808dcf:	75 0c                	jne    808ddd <init_tty+0x12e>
  808dd1:	c7 05 29 81 c2 ff 50 	mov    DWORD PTR [rip+0xffffffffffc28129],0x50        # 430f04 <line_chs>
  808dd8:	00 00 00 
  808ddb:	eb 6f                	jmp    808e4c <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  808ddd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808de1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808de4:	3c 05                	cmp    al,0x5
  808de6:	76 16                	jbe    808dfe <init_tty+0x14f>
  808de8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808dec:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808def:	3c 09                	cmp    al,0x9
  808df1:	74 0b                	je     808dfe <init_tty+0x14f>
  808df3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808df7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808dfa:	3c 0d                	cmp    al,0xd
  808dfc:	75 0c                	jne    808e0a <init_tty+0x15b>
  808dfe:	c7 05 fc 80 c2 ff 40 	mov    DWORD PTR [rip+0xffffffffffc280fc],0x140        # 430f04 <line_chs>
  808e05:	01 00 00 
  808e08:	eb 42                	jmp    808e4c <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  808e0a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e0e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e11:	3c 06                	cmp    al,0x6
  808e13:	74 16                	je     808e2b <init_tty+0x17c>
  808e15:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e19:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e1c:	3c 0a                	cmp    al,0xa
  808e1e:	74 0b                	je     808e2b <init_tty+0x17c>
  808e20:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e24:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e27:	3c 0d                	cmp    al,0xd
  808e29:	76 0c                	jbe    808e37 <init_tty+0x188>
  808e2b:	c7 05 cf 80 c2 ff 80 	mov    DWORD PTR [rip+0xffffffffffc280cf],0x280        # 430f04 <line_chs>
  808e32:	02 00 00 
  808e35:	eb 15                	jmp    808e4c <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  808e37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e3b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e3e:	3c 08                	cmp    al,0x8
  808e40:	75 0a                	jne    808e4c <init_tty+0x19d>
  808e42:	c7 05 b8 80 c2 ff a0 	mov    DWORD PTR [rip+0xffffffffffc280b8],0xa0        # 430f04 <line_chs>
  808e49:	00 00 00 
    switch (*vp)
  808e4c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e50:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e53:	0f b6 c0             	movzx  eax,al
  808e56:	83 f8 14             	cmp    eax,0x14
  808e59:	77 61                	ja     808ebc <init_tty+0x20d>
  808e5b:	89 c0                	mov    eax,eax
  808e5d:	48 8b 04 c5 98 21 81 	mov    rax,QWORD PTR [rax*8+0x812198]
  808e64:	00 
  808e65:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  808e68:	c7 05 9e 80 c2 ff e8 	mov    DWORD PTR [rip+0xffffffffffc2809e],0x3e8        # 430f10 <vpage_size>
  808e6f:	03 00 00 
  808e72:	eb 49                	jmp    808ebd <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  808e74:	c7 05 92 80 c2 ff d0 	mov    DWORD PTR [rip+0xffffffffffc28092],0x7d0        # 430f10 <vpage_size>
  808e7b:	07 00 00 
  808e7e:	eb 3d                	jmp    808ebd <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  808e80:	c7 05 86 80 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28086],0xfa00        # 430f10 <vpage_size>
  808e87:	fa 00 00 
  808e8a:	eb 31                	jmp    808ebd <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  808e8c:	c7 05 7a 80 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2807a],0x1f400        # 430f10 <vpage_size>
  808e93:	f4 01 00 
  808e96:	eb 25                	jmp    808ebd <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  808e98:	c7 05 6e 80 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2806e],0x7d00        # 430f10 <vpage_size>
  808e9f:	7d 00 00 
  808ea2:	eb 19                	jmp    808ebd <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  808ea4:	c7 05 62 80 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28062],0x36b00        # 430f10 <vpage_size>
  808eab:	6b 03 00 
  808eae:	eb 0d                	jmp    808ebd <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  808eb0:	c7 05 56 80 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28056],0x4b000        # 430f10 <vpage_size>
  808eb7:	b0 04 00 
  808eba:	eb 01                	jmp    808ebd <init_tty+0x20e>
    default:
        break;
  808ebc:	90                   	nop
    }
    m_ptr=video_base;
  808ebd:	48 8b 05 1c 80 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2801c]        # 430ee0 <video_base>
  808ec4:	48 89 05 3d 12 00 00 	mov    QWORD PTR [rip+0x123d],rax        # 80a108 <m_ptr>
    page_boffset=0;
  808ecb:	c7 05 23 80 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28023],0x0        # 430ef8 <page_boffset>
  808ed2:	00 00 00 
    vpage_base=video_base;
  808ed5:	48 8b 05 04 80 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc28004]        # 430ee0 <video_base>
  808edc:	48 89 05 0d 80 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2800d],rax        # 430ef0 <vpage_base>
    vp++;
  808ee3:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  808ee8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808eec:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808eef:	0f b6 c0             	movzx  eax,al
  808ef2:	89 05 08 80 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28008],eax        # 430f00 <vpage>
    vp++;
  808ef8:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  808efd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f01:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808f05:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808f09:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f0c:	0f b6 c0             	movzx  eax,al
  808f0f:	89 05 07 80 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28007],eax        # 430f1c <stline>
    endline=*vp++;
  808f15:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f19:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808f1d:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808f21:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f24:	0f b6 c0             	movzx  eax,al
  808f27:	89 05 f3 7f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27ff3],eax        # 430f20 <endline>
    videoy=*vp++;
  808f2d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f31:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808f35:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808f39:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f3c:	0f b6 c0             	movzx  eax,al
  808f3f:	89 05 d3 7f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27fd3],eax        # 430f18 <videoy>
    videox=*vp;
  808f45:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f49:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f4c:	0f b6 c0             	movzx  eax,al
  808f4f:	89 05 bf 7f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27fbf],eax        # 430f14 <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  808f55:	90                   	nop
  808f56:	c9                   	leave  
  808f57:	c3                   	ret    

0000000000808f58 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  808f58:	f3 0f 1e fa          	endbr64 
  808f5c:	55                   	push   rbp
  808f5d:	48 89 e5             	mov    rbp,rsp
  808f60:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  808f64:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808f68:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808f6b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  808f6e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808f71:	05 00 c0 05 00       	add    eax,0x5c000
  808f76:	01 c0                	add    eax,eax
  808f78:	48 98                	cdqe   
  808f7a:	48 89 05 87 11 00 00 	mov    QWORD PTR [rip+0x1187],rax        # 80a108 <m_ptr>
}
  808f81:	90                   	nop
  808f82:	5d                   	pop    rbp
  808f83:	c3                   	ret    

0000000000808f84 <tell_monitor>:
int tell_monitor()
{
  808f84:	f3 0f 1e fa          	endbr64 
  808f88:	55                   	push   rbp
  808f89:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  808f8c:	48 8b 05 75 11 00 00 	mov    rax,QWORD PTR [rip+0x1175]        # 80a108 <m_ptr>
  808f93:	48 8b 15 46 7f c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27f46]        # 430ee0 <video_base>
  808f9a:	48 29 d0             	sub    rax,rdx
  808f9d:	48 89 c2             	mov    rdx,rax
  808fa0:	48 c1 ea 3f          	shr    rdx,0x3f
  808fa4:	48 01 d0             	add    rax,rdx
  808fa7:	48 d1 f8             	sar    rax,1
}
  808faa:	5d                   	pop    rbp
  808fab:	c3                   	ret    

0000000000808fac <del_ch>:
void del_ch()
{
  808fac:	f3 0f 1e fa          	endbr64 
  808fb0:	55                   	push   rbp
  808fb1:	48 89 e5             	mov    rbp,rsp
  808fb4:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  808fbb:	48 8b 05 46 11 00 00 	mov    rax,QWORD PTR [rip+0x1146]        # 80a108 <m_ptr>
  808fc2:	48 83 e8 02          	sub    rax,0x2
  808fc6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  808fca:	b8 00 00 00 00       	mov    eax,0x0
  808fcf:	e8 b0 ff ff ff       	call   808f84 <tell_monitor>
  808fd4:	89 c2                	mov    edx,eax
  808fd6:	48 63 c2             	movsxd rax,edx
  808fd9:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  808fe0:	48 c1 e8 20          	shr    rax,0x20
  808fe4:	c1 f8 05             	sar    eax,0x5
  808fe7:	89 d1                	mov    ecx,edx
  808fe9:	c1 f9 1f             	sar    ecx,0x1f
  808fec:	29 c8                	sub    eax,ecx
  808fee:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  808ff1:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  808ff4:	89 c8                	mov    eax,ecx
  808ff6:	c1 e0 02             	shl    eax,0x2
  808ff9:	01 c8                	add    eax,ecx
  808ffb:	c1 e0 04             	shl    eax,0x4
  808ffe:	29 c2                	sub    edx,eax
  809000:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  809003:	eb 17                	jmp    80901c <del_ch+0x70>
    {
        *p=*(p+2);
  809005:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809009:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  80900d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809011:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  809013:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  809018:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80901c:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  809020:	7e e3                	jle    809005 <del_ch+0x59>
    }
    driver_args args= {
  809022:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  809029:	b8 00 00 00 00       	mov    eax,0x0
  80902e:	b9 18 00 00 00       	mov    ecx,0x18
  809033:	48 89 d7             	mov    rdi,rdx
  809036:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  809039:	b8 00 00 00 00       	mov    eax,0x0
  80903e:	e8 41 ff ff ff       	call   808f84 <tell_monitor>
  809043:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  809046:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  80904c:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  809053:	48 89 c7             	mov    rdi,rax
  809056:	e8 fd fe ff ff       	call   808f58 <seek_tty>
    set_cur();
  80905b:	b8 00 00 00 00       	mov    eax,0x0
  809060:	e8 03 00 00 00       	call   809068 <set_cur>
}
  809065:	90                   	nop
  809066:	c9                   	leave  
  809067:	c3                   	ret    

0000000000809068 <set_cur>:
void set_cur()
{
  809068:	f3 0f 1e fa          	endbr64 
  80906c:	55                   	push   rbp
  80906d:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  809070:	fa                   	cli    
    outb(port_reg_index,14);
  809071:	8b 05 91 7e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27e91]        # 430f08 <port_reg_index>
  809077:	0f b7 c0             	movzx  eax,ax
  80907a:	be 0e 00 00 00       	mov    esi,0xe
  80907f:	89 c7                	mov    edi,eax
  809081:	e8 ea b8 ff ff       	call   804970 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  809086:	48 8b 05 7b 10 00 00 	mov    rax,QWORD PTR [rip+0x107b]        # 80a108 <m_ptr>
  80908d:	48 8b 15 4c 7e c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27e4c]        # 430ee0 <video_base>
  809094:	48 29 d0             	sub    rax,rdx
  809097:	48 c1 f8 09          	sar    rax,0x9
  80909b:	0f b6 d0             	movzx  edx,al
  80909e:	8b 05 68 7e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27e68]        # 430f0c <port_reg_v>
  8090a4:	0f b7 c0             	movzx  eax,ax
  8090a7:	89 d6                	mov    esi,edx
  8090a9:	89 c7                	mov    edi,eax
  8090ab:	e8 c0 b8 ff ff       	call   804970 <outb>
    outb(port_reg_index,15);
  8090b0:	8b 05 52 7e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27e52]        # 430f08 <port_reg_index>
  8090b6:	0f b7 c0             	movzx  eax,ax
  8090b9:	be 0f 00 00 00       	mov    esi,0xf
  8090be:	89 c7                	mov    edi,eax
  8090c0:	e8 ab b8 ff ff       	call   804970 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  8090c5:	48 8b 05 3c 10 00 00 	mov    rax,QWORD PTR [rip+0x103c]        # 80a108 <m_ptr>
  8090cc:	48 8b 15 0d 7e c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27e0d]        # 430ee0 <video_base>
  8090d3:	48 29 d0             	sub    rax,rdx
  8090d6:	48 d1 f8             	sar    rax,1
  8090d9:	0f b6 d0             	movzx  edx,al
  8090dc:	8b 05 2a 7e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27e2a]        # 430f0c <port_reg_v>
  8090e2:	0f b7 c0             	movzx  eax,ax
  8090e5:	89 d6                	mov    esi,edx
  8090e7:	89 c7                	mov    edi,eax
  8090e9:	e8 82 b8 ff ff       	call   804970 <outb>
    asm volatile("sti");
  8090ee:	fb                   	sti    
}
  8090ef:	90                   	nop
  8090f0:	5d                   	pop    rbp
  8090f1:	c3                   	ret    

00000000008090f2 <read_tty>:

int read_tty(driver_args *args)
{
  8090f2:	f3 0f 1e fa          	endbr64 
  8090f6:	55                   	push   rbp
  8090f7:	48 89 e5             	mov    rbp,rsp
  8090fa:	48 83 ec 20          	sub    rsp,0x20
  8090fe:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  809102:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809106:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  809109:	48 98                	cdqe   
  80910b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80910f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809113:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  809116:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  809119:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809120:	eb 4a                	jmp    80916c <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  809122:	48 8b 15 df 0f 00 00 	mov    rdx,QWORD PTR [rip+0xfdf]        # 80a108 <m_ptr>
  809129:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80912d:	48 8d 48 01          	lea    rcx,[rax+0x1]
  809131:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  809135:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  809138:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  80913a:	48 8b 05 c7 0f 00 00 	mov    rax,QWORD PTR [rip+0xfc7]        # 80a108 <m_ptr>
  809141:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  809147:	75 0d                	jne    809156 <read_tty+0x64>
  809149:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80914d:	7e 07                	jle    809156 <read_tty+0x64>
        {
            return 1;//读到尾了
  80914f:	b8 01 00 00 00       	mov    eax,0x1
  809154:	eb 2d                	jmp    809183 <read_tty+0x91>
        }
        m_ptr+=2;
  809156:	48 8b 05 ab 0f 00 00 	mov    rax,QWORD PTR [rip+0xfab]        # 80a108 <m_ptr>
  80915d:	48 83 c0 02          	add    rax,0x2
  809161:	48 89 05 a0 0f 00 00 	mov    QWORD PTR [rip+0xfa0],rax        # 80a108 <m_ptr>
    for(int i=0;i<len;i++)
  809168:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80916c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80916f:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  809172:	7c ae                	jl     809122 <read_tty+0x30>
    }
    set_cur();
  809174:	b8 00 00 00 00       	mov    eax,0x0
  809179:	e8 ea fe ff ff       	call   809068 <set_cur>
    return 0;
  80917e:	b8 00 00 00 00       	mov    eax,0x0
}
  809183:	c9                   	leave  
  809184:	c3                   	ret    

0000000000809185 <write_tty>:
int write_tty(driver_args *args)
{
  809185:	f3 0f 1e fa          	endbr64 
  809189:	55                   	push   rbp
  80918a:	48 89 e5             	mov    rbp,rsp
  80918d:	48 83 ec 30          	sub    rsp,0x30
  809191:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  809195:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809199:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80919c:	48 98                	cdqe   
  80919e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  8091a2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8091a6:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8091a9:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  8091ac:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8091b3:	e9 0b 01 00 00       	jmp    8092c3 <write_tty+0x13e>
    {
        if(*src=='\n')
  8091b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8091bc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8091bf:	3c 0a                	cmp    al,0xa
  8091c1:	75 50                	jne    809213 <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  8091c3:	48 8b 05 3e 0f 00 00 	mov    rax,QWORD PTR [rip+0xf3e]        # 80a108 <m_ptr>
  8091ca:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  8091d0:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  8091d3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8091d6:	89 c2                	mov    edx,eax
  8091d8:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  8091dd:	48 0f af c2          	imul   rax,rdx
  8091e1:	48 c1 e8 20          	shr    rax,0x20
  8091e5:	c1 e8 07             	shr    eax,0x7
  8091e8:	8d 50 01             	lea    edx,[rax+0x1]
  8091eb:	89 d0                	mov    eax,edx
  8091ed:	c1 e0 02             	shl    eax,0x2
  8091f0:	01 d0                	add    eax,edx
  8091f2:	c1 e0 05             	shl    eax,0x5
  8091f5:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  8091f8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8091fb:	05 00 80 0b 00       	add    eax,0xb8000
  809200:	89 c0                	mov    eax,eax
  809202:	48 89 05 ff 0e 00 00 	mov    QWORD PTR [rip+0xeff],rax        # 80a108 <m_ptr>
            src++;
  809209:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  80920e:	e9 ac 00 00 00       	jmp    8092bf <write_tty+0x13a>
        }else if(*src=='\0')
  809213:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809217:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80921a:	84 c0                	test   al,al
  80921c:	0f 84 af 00 00 00    	je     8092d1 <write_tty+0x14c>
            break;
        if(*src=='\b')
  809222:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809226:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809229:	3c 08                	cmp    al,0x8
  80922b:	75 1e                	jne    80924b <write_tty+0xc6>
        {
            m_ptr-=2;
  80922d:	48 8b 05 d4 0e 00 00 	mov    rax,QWORD PTR [rip+0xed4]        # 80a108 <m_ptr>
  809234:	48 83 e8 02          	sub    rax,0x2
  809238:	48 89 05 c9 0e 00 00 	mov    QWORD PTR [rip+0xec9],rax        # 80a108 <m_ptr>
            *m_ptr=0;
  80923f:	48 8b 05 c2 0e 00 00 	mov    rax,QWORD PTR [rip+0xec2]        # 80a108 <m_ptr>
  809246:	c6 00 00             	mov    BYTE PTR [rax],0x0
  809249:	eb 3e                	jmp    809289 <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  80924b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80924f:	48 8d 42 01          	lea    rax,[rdx+0x1]
  809253:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  809257:	48 8b 05 aa 0e 00 00 	mov    rax,QWORD PTR [rip+0xeaa]        # 80a108 <m_ptr>
  80925e:	48 8d 48 01          	lea    rcx,[rax+0x1]
  809262:	48 89 0d 9f 0e 00 00 	mov    QWORD PTR [rip+0xe9f],rcx        # 80a108 <m_ptr>
  809269:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80926c:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  80926e:	48 8b 05 93 0e 00 00 	mov    rax,QWORD PTR [rip+0xe93]        # 80a108 <m_ptr>
  809275:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809279:	48 89 15 88 0e 00 00 	mov    QWORD PTR [rip+0xe88],rdx        # 80a108 <m_ptr>
  809280:	0f b6 15 89 0e 00 00 	movzx  edx,BYTE PTR [rip+0xe89]        # 80a110 <m_color>
  809287:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  809289:	48 8b 05 78 0e 00 00 	mov    rax,QWORD PTR [rip+0xe78]        # 80a108 <m_ptr>
  809290:	48 8b 0d 59 7c c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc27c59]        # 430ef0 <vpage_base>
  809297:	48 29 c8             	sub    rax,rcx
  80929a:	48 89 c2             	mov    rdx,rax
  80929d:	8b 05 6d 7c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27c6d]        # 430f10 <vpage_size>
  8092a3:	8b 0d 5b 7c c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc27c5b]        # 430f04 <line_chs>
  8092a9:	29 c8                	sub    eax,ecx
  8092ab:	01 c0                	add    eax,eax
  8092ad:	48 98                	cdqe   
  8092af:	48 39 c2             	cmp    rdx,rax
  8092b2:	7c 0b                	jl     8092bf <write_tty+0x13a>
  8092b4:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8092b8:	7e 05                	jle    8092bf <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  8092ba:	e8 bc f8 ff ff       	call   808b7b <scrdown>
    for(int i=0;i<len;i++)
  8092bf:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8092c3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8092c6:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  8092c9:	0f 8c e9 fe ff ff    	jl     8091b8 <write_tty+0x33>
  8092cf:	eb 01                	jmp    8092d2 <write_tty+0x14d>
            break;
  8092d1:	90                   	nop
        }
    }
    set_cur();
  8092d2:	b8 00 00 00 00       	mov    eax,0x0
  8092d7:	e8 8c fd ff ff       	call   809068 <set_cur>
    return 0;
  8092dc:	b8 00 00 00 00       	mov    eax,0x0
}
  8092e1:	c9                   	leave  
  8092e2:	c3                   	ret    

00000000008092e3 <cls>:

void cls(driver_args *args)
{
  8092e3:	f3 0f 1e fa          	endbr64 
  8092e7:	55                   	push   rbp
  8092e8:	48 89 e5             	mov    rbp,rsp
  8092eb:	48 83 ec 20          	sub    rsp,0x20
  8092ef:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  8092f3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8092fa:	eb 16                	jmp    809312 <cls+0x2f>
    {
        vpage_base[i]=0;
  8092fc:	48 8b 15 ed 7b c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27bed]        # 430ef0 <vpage_base>
  809303:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809306:	48 98                	cdqe   
  809308:	48 01 d0             	add    rax,rdx
  80930b:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  80930e:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  809312:	8b 05 f8 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27bf8]        # 430f10 <vpage_size>
  809318:	01 c0                	add    eax,eax
  80931a:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80931d:	7c dd                	jl     8092fc <cls+0x19>
    }
    m_ptr=vpage_base;
  80931f:	48 8b 05 ca 7b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc27bca]        # 430ef0 <vpage_base>
  809326:	48 89 05 db 0d 00 00 	mov    QWORD PTR [rip+0xddb],rax        # 80a108 <m_ptr>
    set_cur();
  80932d:	b8 00 00 00 00       	mov    eax,0x0
  809332:	e8 31 fd ff ff       	call   809068 <set_cur>
}
  809337:	90                   	nop
  809338:	c9                   	leave  
  809339:	c3                   	ret    

000000000080933a <set_color>:

void set_color(char color)
{
  80933a:	f3 0f 1e fa          	endbr64 
  80933e:	55                   	push   rbp
  80933f:	48 89 e5             	mov    rbp,rsp
  809342:	89 f8                	mov    eax,edi
  809344:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  809347:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80934b:	88 05 bf 0d 00 00    	mov    BYTE PTR [rip+0xdbf],al        # 80a110 <m_color>
}
  809351:	90                   	nop
  809352:	5d                   	pop    rbp
  809353:	c3                   	ret    

0000000000809354 <tty_do_req>:

int tty_do_req(driver_args *args)
{
  809354:	f3 0f 1e fa          	endbr64 
  809358:	55                   	push   rbp
  809359:	48 89 e5             	mov    rbp,rsp
  80935c:	48 83 ec 10          	sub    rsp,0x10
  809360:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  809364:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809368:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80936e:	83 f8 0d             	cmp    eax,0xd
  809371:	74 45                	je     8093b8 <tty_do_req+0x64>
  809373:	83 f8 0d             	cmp    eax,0xd
  809376:	7f 53                	jg     8093cb <tty_do_req+0x77>
  809378:	83 f8 0c             	cmp    eax,0xc
  80937b:	74 2d                	je     8093aa <tty_do_req+0x56>
  80937d:	83 f8 0c             	cmp    eax,0xc
  809380:	7f 49                	jg     8093cb <tty_do_req+0x77>
  809382:	83 f8 02             	cmp    eax,0x2
  809385:	74 07                	je     80938e <tty_do_req+0x3a>
  809387:	83 f8 03             	cmp    eax,0x3
  80938a:	74 10                	je     80939c <tty_do_req+0x48>
  80938c:	eb 3d                	jmp    8093cb <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  80938e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809392:	48 89 c7             	mov    rdi,rax
  809395:	e8 58 fd ff ff       	call   8090f2 <read_tty>
        break;
  80939a:	eb 36                	jmp    8093d2 <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  80939c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8093a0:	48 89 c7             	mov    rdi,rax
  8093a3:	e8 dd fd ff ff       	call   809185 <write_tty>
        break;
  8093a8:	eb 28                	jmp    8093d2 <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  8093aa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8093ae:	48 89 c7             	mov    rdi,rax
  8093b1:	e8 a2 fb ff ff       	call   808f58 <seek_tty>
        break;
  8093b6:	eb 1a                	jmp    8093d2 <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  8093b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8093bc:	48 89 c7             	mov    rdi,rax
  8093bf:	b8 00 00 00 00       	mov    eax,0x0
  8093c4:	e8 bb fb ff ff       	call   808f84 <tell_monitor>
        break;
  8093c9:	eb 07                	jmp    8093d2 <tty_do_req+0x7e>
    default:return -1;
  8093cb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8093d0:	eb 05                	jmp    8093d7 <tty_do_req+0x83>
    }
    return 0;
  8093d2:	b8 00 00 00 00       	mov    eax,0x0
}
  8093d7:	c9                   	leave  
  8093d8:	c3                   	ret    

00000000008093d9 <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  8093d9:	f3 0f 1e fa          	endbr64 
  8093dd:	55                   	push   rbp
  8093de:	48 89 e5             	mov    rbp,rsp
  8093e1:	48 83 ec 10          	sub    rsp,0x10
  8093e5:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  8093e8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8093eb:	83 c0 01             	add    eax,0x1
  8093ee:	0f b7 c0             	movzx  eax,ax
  8093f1:	be 00 00 00 00       	mov    esi,0x0
  8093f6:	89 c7                	mov    edi,eax
  8093f8:	e8 73 b5 ff ff       	call   804970 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  8093fd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809400:	83 c0 03             	add    eax,0x3
  809403:	0f b7 c0             	movzx  eax,ax
  809406:	be 80 00 00 00       	mov    esi,0x80
  80940b:	89 c7                	mov    edi,eax
  80940d:	e8 5e b5 ff ff       	call   804970 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  809412:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809415:	0f b7 c0             	movzx  eax,ax
  809418:	be 03 00 00 00       	mov    esi,0x3
  80941d:	89 c7                	mov    edi,eax
  80941f:	e8 4c b5 ff ff       	call   804970 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  809424:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809427:	83 c0 01             	add    eax,0x1
  80942a:	0f b7 c0             	movzx  eax,ax
  80942d:	be 00 00 00 00       	mov    esi,0x0
  809432:	89 c7                	mov    edi,eax
  809434:	e8 37 b5 ff ff       	call   804970 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  809439:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80943c:	83 c0 03             	add    eax,0x3
  80943f:	0f b7 c0             	movzx  eax,ax
  809442:	be 03 00 00 00       	mov    esi,0x3
  809447:	89 c7                	mov    edi,eax
  809449:	e8 22 b5 ff ff       	call   804970 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  80944e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809451:	83 c0 02             	add    eax,0x2
  809454:	0f b7 c0             	movzx  eax,ax
  809457:	be c7 00 00 00       	mov    esi,0xc7
  80945c:	89 c7                	mov    edi,eax
  80945e:	e8 0d b5 ff ff       	call   804970 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  809463:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809466:	83 c0 04             	add    eax,0x4
  809469:	0f b7 c0             	movzx  eax,ax
  80946c:	be 0b 00 00 00       	mov    esi,0xb
  809471:	89 c7                	mov    edi,eax
  809473:	e8 f8 b4 ff ff       	call   804970 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  809478:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80947b:	83 c0 04             	add    eax,0x4
  80947e:	0f b7 c0             	movzx  eax,ax
  809481:	be 1e 00 00 00       	mov    esi,0x1e
  809486:	89 c7                	mov    edi,eax
  809488:	e8 e3 b4 ff ff       	call   804970 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  80948d:	b8 61 00 00 00       	mov    eax,0x61
  809492:	0f b6 d0             	movzx  edx,al
  809495:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809498:	0f b7 c0             	movzx  eax,ax
  80949b:	89 d6                	mov    esi,edx
  80949d:	89 c7                	mov    edi,eax
  80949f:	e8 cc b4 ff ff       	call   804970 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  8094a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8094a7:	0f b6 c0             	movzx  eax,al
  8094aa:	89 c7                	mov    edi,eax
  8094ac:	e8 d8 b4 ff ff       	call   804989 <inb>
  8094b1:	0f b6 d0             	movzx  edx,al
  8094b4:	b8 61 00 00 00       	mov    eax,0x61
  8094b9:	0f be c0             	movsx  eax,al
  8094bc:	39 c2                	cmp    edx,eax
  8094be:	75 17                	jne    8094d7 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  8094c0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8094c3:	83 c0 04             	add    eax,0x4
  8094c6:	0f b7 c0             	movzx  eax,ax
  8094c9:	be 0f 00 00 00       	mov    esi,0xf
  8094ce:	89 c7                	mov    edi,eax
  8094d0:	e8 9b b4 ff ff       	call   804970 <outb>
  8094d5:	eb 01                	jmp    8094d8 <init_com+0xff>
        return;
  8094d7:	90                   	nop
}
  8094d8:	c9                   	leave  
  8094d9:	c3                   	ret    

00000000008094da <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  8094da:	f3 0f 1e fa          	endbr64 
  8094de:	55                   	push   rbp
  8094df:	48 89 e5             	mov    rbp,rsp
  8094e2:	48 83 ec 20          	sub    rsp,0x20
  8094e6:	89 f8                	mov    eax,edi
  8094e8:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8094eb:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  8094ef:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8094f2:	83 c0 05             	add    eax,0x5
  8094f5:	0f b6 c0             	movzx  eax,al
  8094f8:	89 c7                	mov    edi,eax
  8094fa:	e8 8a b4 ff ff       	call   804989 <inb>
  8094ff:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  809502:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  809506:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80950a:	74 e3                	je     8094ef <com_putchar+0x15>
    outb(com_base, ch);
  80950c:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  809510:	0f b6 d0             	movzx  edx,al
  809513:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809516:	0f b7 c0             	movzx  eax,ax
  809519:	89 d6                	mov    esi,edx
  80951b:	89 c7                	mov    edi,eax
  80951d:	e8 4e b4 ff ff       	call   804970 <outb>
}
  809522:	90                   	nop
  809523:	c9                   	leave  
  809524:	c3                   	ret    

0000000000809525 <com_puts>:

void com_puts(char* s,int com_port){
  809525:	f3 0f 1e fa          	endbr64 
  809529:	55                   	push   rbp
  80952a:	48 89 e5             	mov    rbp,rsp
  80952d:	48 83 ec 10          	sub    rsp,0x10
  809531:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809535:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  809538:	eb 1d                	jmp    809557 <com_puts+0x32>
        com_putchar(*s,com_port);
  80953a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80953e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809541:	66 98                	cbw    
  809543:	0f b7 c0             	movzx  eax,ax
  809546:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  809549:	89 d6                	mov    esi,edx
  80954b:	89 c7                	mov    edi,eax
  80954d:	e8 88 ff ff ff       	call   8094da <com_putchar>
    for(;*s;s++){
  809552:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  809557:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80955b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80955e:	84 c0                	test   al,al
  809560:	75 d8                	jne    80953a <com_puts+0x15>
    }
  809562:	90                   	nop
  809563:	90                   	nop
  809564:	c9                   	leave  
  809565:	c3                   	ret    

0000000000809566 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  809566:	f3 0f 1e fa          	endbr64 
  80956a:	55                   	push   rbp
  80956b:	48 89 e5             	mov    rbp,rsp
  80956e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809572:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809576:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  809579:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80957d:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  809580:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809587:	eb 1b                	jmp    8095a4 <memcpy+0x3e>
        *(dest)=*(src);
  809589:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80958d:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809590:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809594:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  809596:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80959b:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  8095a0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8095a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8095a7:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  8095aa:	77 dd                	ja     809589 <memcpy+0x23>
    }
}
  8095ac:	90                   	nop
  8095ad:	90                   	nop
  8095ae:	5d                   	pop    rbp
  8095af:	c3                   	ret    

00000000008095b0 <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  8095b0:	f3 0f 1e fa          	endbr64 
  8095b4:	55                   	push   rbp
  8095b5:	48 89 e5             	mov    rbp,rsp
  8095b8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8095bc:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8095c0:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  8095c3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8095ca:	eb 3a                	jmp    809606 <memcmp+0x56>
    {
        if(*a!=*b)
  8095cc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095d0:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8095d3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8095d7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095da:	38 c2                	cmp    dl,al
  8095dc:	74 1a                	je     8095f8 <memcmp+0x48>
            return *a-*b;
  8095de:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095e2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095e5:	0f b6 d0             	movzx  edx,al
  8095e8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8095ec:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095ef:	0f b6 c8             	movzx  ecx,al
  8095f2:	89 d0                	mov    eax,edx
  8095f4:	29 c8                	sub    eax,ecx
  8095f6:	eb 1b                	jmp    809613 <memcmp+0x63>
        a++;
  8095f8:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  8095fd:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  809602:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809606:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809609:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80960c:	7c be                	jl     8095cc <memcmp+0x1c>
    }
    return 0;
  80960e:	b8 00 00 00 00       	mov    eax,0x0
}
  809613:	5d                   	pop    rbp
  809614:	c3                   	ret    

0000000000809615 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  809615:	f3 0f 1e fa          	endbr64 
  809619:	55                   	push   rbp
  80961a:	48 89 e5             	mov    rbp,rsp
  80961d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809621:	89 f0                	mov    eax,esi
  809623:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  809626:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  809629:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809630:	eb 16                	jmp    809648 <memset+0x33>
        *(buf++)=value;
  809632:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809636:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80963a:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80963e:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  809642:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  809644:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809648:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80964b:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80964e:	72 e2                	jb     809632 <memset+0x1d>
    }
}
  809650:	90                   	nop
  809651:	90                   	nop
  809652:	5d                   	pop    rbp
  809653:	c3                   	ret    

0000000000809654 <get_mem_size>:

u32 get_mem_size(){
  809654:	f3 0f 1e fa          	endbr64 
  809658:	55                   	push   rbp
  809659:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80965c:	8b 05 c2 78 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc278c2]        # 430f24 <mem_end>
}
  809662:	5d                   	pop    rbp
  809663:	c3                   	ret    

0000000000809664 <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  809664:	f3 0f 1e fa          	endbr64 
  809668:	55                   	push   rbp
  809669:	48 89 e5             	mov    rbp,rsp
  80966c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809670:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  809674:	eb 1d                	jmp    809693 <strcpy+0x2f>
        *(dest++)=*(buf++);
  809676:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80967a:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80967e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  809682:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809686:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80968a:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80968e:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  809691:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  809693:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809697:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80969a:	84 c0                	test   al,al
  80969c:	75 d8                	jne    809676 <strcpy+0x12>
    }
    *dest='\0';
  80969e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8096a2:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  8096a5:	90                   	nop
  8096a6:	5d                   	pop    rbp
  8096a7:	c3                   	ret    

00000000008096a8 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  8096a8:	f3 0f 1e fa          	endbr64 
  8096ac:	55                   	push   rbp
  8096ad:	48 89 e5             	mov    rbp,rsp
  8096b0:	48 83 ec 30          	sub    rsp,0x30
  8096b4:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  8096b8:	89 f0                	mov    eax,esi
  8096ba:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  8096bd:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  8096c2:	0f 84 9c 00 00 00    	je     809764 <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  8096c8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8096cc:	48 89 c6             	mov    rsi,rax
  8096cf:	bf 40 0f 43 00       	mov    edi,0x430f40
  8096d4:	e8 8b ff ff ff       	call   809664 <strcpy>
        char* ptr=strtokkee;
  8096d9:	48 c7 45 e8 40 0f 43 	mov    QWORD PTR [rbp-0x18],0x430f40
  8096e0:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  8096e1:	c7 05 55 7a c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc27a55],0x0        # 431140 <tokptr>
  8096e8:	00 00 00 
  8096eb:	eb 1c                	jmp    809709 <strtok+0x61>
  8096ed:	8b 05 4d 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27a4d]        # 431140 <tokptr>
  8096f3:	83 c0 01             	add    eax,0x1
  8096f6:	99                   	cdq    
  8096f7:	c1 ea 17             	shr    edx,0x17
  8096fa:	01 d0                	add    eax,edx
  8096fc:	25 ff 01 00 00       	and    eax,0x1ff
  809701:	29 d0                	sub    eax,edx
  809703:	89 05 37 7a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27a37],eax        # 431140 <tokptr>
  809709:	8b 05 31 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27a31]        # 431140 <tokptr>
  80970f:	48 98                	cdqe   
  809711:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  809718:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80971b:	74 13                	je     809730 <strtok+0x88>
  80971d:	8b 05 1d 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27a1d]        # 431140 <tokptr>
  809723:	48 98                	cdqe   
  809725:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  80972c:	84 c0                	test   al,al
  80972e:	75 bd                	jne    8096ed <strtok+0x45>
        strtokkee[tokptr]='\0';
  809730:	8b 05 0a 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27a0a]        # 431140 <tokptr>
  809736:	48 98                	cdqe   
  809738:	c6 80 40 0f 43 00 00 	mov    BYTE PTR [rax+0x430f40],0x0
        tokptr=(tokptr+1)%512;
  80973f:	8b 05 fb 79 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc279fb]        # 431140 <tokptr>
  809745:	83 c0 01             	add    eax,0x1
  809748:	99                   	cdq    
  809749:	c1 ea 17             	shr    edx,0x17
  80974c:	01 d0                	add    eax,edx
  80974e:	25 ff 01 00 00       	and    eax,0x1ff
  809753:	29 d0                	sub    eax,edx
  809755:	89 05 e5 79 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc279e5],eax        # 431140 <tokptr>
        return ptr;
  80975b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80975f:	e9 9e 00 00 00       	jmp    809802 <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  809764:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80976b:	8b 05 cf 79 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc279cf]        # 431140 <tokptr>
  809771:	48 98                	cdqe   
  809773:	48 05 40 0f 43 00    	add    rax,0x430f40
  809779:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80977d:	eb 20                	jmp    80979f <strtok+0xf7>
  80977f:	8b 05 bb 79 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc279bb]        # 431140 <tokptr>
  809785:	83 c0 01             	add    eax,0x1
  809788:	99                   	cdq    
  809789:	c1 ea 17             	shr    edx,0x17
  80978c:	01 d0                	add    eax,edx
  80978e:	25 ff 01 00 00       	and    eax,0x1ff
  809793:	29 d0                	sub    eax,edx
  809795:	89 05 a5 79 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc279a5],eax        # 431140 <tokptr>
  80979b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80979f:	8b 05 9b 79 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2799b]        # 431140 <tokptr>
  8097a5:	48 98                	cdqe   
  8097a7:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  8097ae:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  8097b1:	74 13                	je     8097c6 <strtok+0x11e>
  8097b3:	8b 05 87 79 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27987]        # 431140 <tokptr>
  8097b9:	48 98                	cdqe   
  8097bb:	0f b6 80 40 0f 43 00 	movzx  eax,BYTE PTR [rax+0x430f40]
  8097c2:	84 c0                	test   al,al
  8097c4:	75 b9                	jne    80977f <strtok+0xd7>
    strtokkee[tokptr]='\0';
  8097c6:	8b 05 74 79 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27974]        # 431140 <tokptr>
  8097cc:	48 98                	cdqe   
  8097ce:	c6 80 40 0f 43 00 00 	mov    BYTE PTR [rax+0x430f40],0x0
    tokptr=(tokptr+1)%512;
  8097d5:	8b 05 65 79 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27965]        # 431140 <tokptr>
  8097db:	83 c0 01             	add    eax,0x1
  8097de:	99                   	cdq    
  8097df:	c1 ea 17             	shr    edx,0x17
  8097e2:	01 d0                	add    eax,edx
  8097e4:	25 ff 01 00 00       	and    eax,0x1ff
  8097e9:	29 d0                	sub    eax,edx
  8097eb:	89 05 4f 79 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2794f],eax        # 431140 <tokptr>
    if(c)
  8097f1:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8097f5:	74 06                	je     8097fd <strtok+0x155>
        return ptr;
  8097f7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8097fb:	eb 05                	jmp    809802 <strtok+0x15a>
    else
        return (void*)0;
  8097fd:	b8 00 00 00 00       	mov    eax,0x0
}
  809802:	c9                   	leave  
  809803:	c3                   	ret    

0000000000809804 <strcmp>:
int strcmp(char *s1,char *s2)
{
  809804:	f3 0f 1e fa          	endbr64 
  809808:	55                   	push   rbp
  809809:	48 89 e5             	mov    rbp,rsp
  80980c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809810:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  809814:	eb 3c                	jmp    809852 <strcmp+0x4e>
		if(*s1>*s2)
  809816:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80981a:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80981d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809821:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809824:	38 c2                	cmp    dl,al
  809826:	7e 07                	jle    80982f <strcmp+0x2b>
			return 1;
  809828:	b8 01 00 00 00       	mov    eax,0x1
  80982d:	eb 52                	jmp    809881 <strcmp+0x7d>
		else if(*s1<*s2)
  80982f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809833:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809836:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80983a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80983d:	38 c2                	cmp    dl,al
  80983f:	7d 07                	jge    809848 <strcmp+0x44>
			return -1;
  809841:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809846:	eb 39                	jmp    809881 <strcmp+0x7d>
		s1++;
  809848:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80984d:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  809852:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809856:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809859:	84 c0                	test   al,al
  80985b:	74 0b                	je     809868 <strcmp+0x64>
  80985d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809861:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809864:	84 c0                	test   al,al
  809866:	75 ae                	jne    809816 <strcmp+0x12>
	}
	if(*s1==*s2)
  809868:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80986c:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80986f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809873:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809876:	38 c2                	cmp    dl,al
  809878:	75 07                	jne    809881 <strcmp+0x7d>
		return 0;
  80987a:	b8 00 00 00 00       	mov    eax,0x0
  80987f:	eb 00                	jmp    809881 <strcmp+0x7d>
}
  809881:	5d                   	pop    rbp
  809882:	c3                   	ret    

0000000000809883 <strlen>:

int strlen(char *str)
{
  809883:	f3 0f 1e fa          	endbr64 
  809887:	55                   	push   rbp
  809888:	48 89 e5             	mov    rbp,rsp
  80988b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80988f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  809896:	eb 09                	jmp    8098a1 <strlen+0x1e>
  809898:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80989d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8098a1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8098a5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8098a8:	84 c0                	test   al,al
  8098aa:	75 ec                	jne    809898 <strlen+0x15>
    return l;
  8098ac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8098af:	5d                   	pop    rbp
  8098b0:	c3                   	ret    

00000000008098b1 <sprintf>:

void sprintf(char *dist, char *str,...)
{
  8098b1:	f3 0f 1e fa          	endbr64 
  8098b5:	55                   	push   rbp
  8098b6:	48 89 e5             	mov    rbp,rsp
  8098b9:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  8098c0:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  8098c7:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  8098ce:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  8098d5:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  8098dc:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  8098e3:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  8098ea:	84 c0                	test   al,al
  8098ec:	74 20                	je     80990e <sprintf+0x5d>
  8098ee:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  8098f2:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  8098f6:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  8098fa:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  8098fe:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  809902:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  809906:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80990a:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80990e:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809915:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80991c:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809923:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80992a:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  809931:	00 00 00 
    while (*pstr!='\n')
  809934:	eb 39                	jmp    80996f <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  809936:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80993d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809940:	3c 25                	cmp    al,0x25
  809942:	75 15                	jne    809959 <sprintf+0xa8>
  809944:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80994b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80994e:	3c 25                	cmp    al,0x25
  809950:	74 07                	je     809959 <sprintf+0xa8>
            argnum++;
  809952:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  809959:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809960:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  809967:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80996e:	01 
    while (*pstr!='\n')
  80996f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809976:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809979:	3c 0a                	cmp    al,0xa
  80997b:	75 b9                	jne    809936 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80997d:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  809984:	00 00 00 
  809987:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80998e:	00 00 00 
  809991:	48 8d 45 10          	lea    rax,[rbp+0x10]
  809995:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80999c:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  8099a3:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  8099aa:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  8099b1:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  8099b8:	e9 e2 01 00 00       	jmp    809b9f <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  8099bd:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8099c4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099c7:	3c 25                	cmp    al,0x25
  8099c9:	0f 85 aa 01 00 00    	jne    809b79 <sprintf+0x2c8>
  8099cf:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8099d6:	48 83 c0 01          	add    rax,0x1
  8099da:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099dd:	84 c0                	test   al,al
  8099df:	0f 84 94 01 00 00    	je     809b79 <sprintf+0x2c8>
            pstr++;
  8099e5:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  8099ec:	01 
            if(*pstr=='x'){
  8099ed:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8099f4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099f7:	3c 78                	cmp    al,0x78
  8099f9:	75 64                	jne    809a5f <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  8099fb:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809a01:	83 f8 2f             	cmp    eax,0x2f
  809a04:	77 23                	ja     809a29 <sprintf+0x178>
  809a06:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809a0d:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809a13:	89 d2                	mov    edx,edx
  809a15:	48 01 d0             	add    rax,rdx
  809a18:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809a1e:	83 c2 08             	add    edx,0x8
  809a21:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809a27:	eb 12                	jmp    809a3b <sprintf+0x18a>
  809a29:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809a30:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809a34:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809a3b:	8b 00                	mov    eax,DWORD PTR [rax]
  809a3d:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  809a43:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  809a49:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809a50:	89 d6                	mov    esi,edx
  809a52:	48 89 c7             	mov    rdi,rax
  809a55:	e8 4e 02 00 00       	call   809ca8 <sprint_hex>
            if(*pstr=='x'){
  809a5a:	e9 38 01 00 00       	jmp    809b97 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  809a5f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809a66:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a69:	3c 73                	cmp    al,0x73
  809a6b:	75 68                	jne    809ad5 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  809a6d:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809a73:	83 f8 2f             	cmp    eax,0x2f
  809a76:	77 23                	ja     809a9b <sprintf+0x1ea>
  809a78:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809a7f:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809a85:	89 d2                	mov    edx,edx
  809a87:	48 01 d0             	add    rax,rdx
  809a8a:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809a90:	83 c2 08             	add    edx,0x8
  809a93:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809a99:	eb 12                	jmp    809aad <sprintf+0x1fc>
  809a9b:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809aa2:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809aa6:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809aad:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809ab0:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  809ab7:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  809abe:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809ac5:	48 89 d6             	mov    rsi,rdx
  809ac8:	48 89 c7             	mov    rdi,rax
  809acb:	e8 5a 02 00 00       	call   809d2a <sprintn>
            if(*pstr=='x'){
  809ad0:	e9 c2 00 00 00       	jmp    809b97 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  809ad5:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809adc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809adf:	3c 64                	cmp    al,0x64
  809ae1:	75 66                	jne    809b49 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  809ae3:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809ae9:	83 f8 2f             	cmp    eax,0x2f
  809aec:	77 23                	ja     809b11 <sprintf+0x260>
  809aee:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809af5:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809afb:	89 d2                	mov    edx,edx
  809afd:	48 01 d0             	add    rax,rdx
  809b00:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809b06:	83 c2 08             	add    edx,0x8
  809b09:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809b0f:	eb 12                	jmp    809b23 <sprintf+0x272>
  809b11:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809b18:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809b1c:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809b23:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b26:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  809b2d:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  809b34:	89 c2                	mov    edx,eax
  809b36:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809b3d:	89 d6                	mov    esi,edx
  809b3f:	48 89 c7             	mov    rdi,rax
  809b42:	e8 ad 00 00 00       	call   809bf4 <sprint_decimal>
            if(*pstr=='x'){
  809b47:	eb 4e                	jmp    809b97 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  809b49:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809b50:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b53:	3c 63                	cmp    al,0x63
  809b55:	75 02                	jne    809b59 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  809b57:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  809b59:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809b60:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b63:	0f be d0             	movsx  edx,al
  809b66:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809b6d:	89 d6                	mov    esi,edx
  809b6f:	48 89 c7             	mov    rdi,rax
  809b72:	e8 3e 00 00 00       	call   809bb5 <sprintchar>
            if(*pstr=='x'){
  809b77:	eb 1e                	jmp    809b97 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  809b79:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809b80:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b83:	0f be d0             	movsx  edx,al
  809b86:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809b8d:	89 d6                	mov    esi,edx
  809b8f:	48 89 c7             	mov    rdi,rax
  809b92:	e8 1e 00 00 00       	call   809bb5 <sprintchar>
    for(;*pstr!='\0';pstr++){
  809b97:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  809b9e:	01 
  809b9f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809ba6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ba9:	84 c0                	test   al,al
  809bab:	0f 85 0c fe ff ff    	jne    8099bd <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  809bb1:	90                   	nop
  809bb2:	90                   	nop
  809bb3:	c9                   	leave  
  809bb4:	c3                   	ret    

0000000000809bb5 <sprintchar>:
void sprintchar(char *dist,char c)
{
  809bb5:	f3 0f 1e fa          	endbr64 
  809bb9:	55                   	push   rbp
  809bba:	48 89 e5             	mov    rbp,rsp
  809bbd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809bc1:	89 f0                	mov    eax,esi
  809bc3:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  809bc6:	eb 05                	jmp    809bcd <sprintchar+0x18>
        dist++;
  809bc8:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  809bcd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809bd1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809bd4:	84 c0                	test   al,al
  809bd6:	75 f0                	jne    809bc8 <sprintchar+0x13>
    *dist++=c;
  809bd8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809bdc:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809be0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809be4:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  809be8:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  809bea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809bee:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  809bf1:	90                   	nop
  809bf2:	5d                   	pop    rbp
  809bf3:	c3                   	ret    

0000000000809bf4 <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  809bf4:	f3 0f 1e fa          	endbr64 
  809bf8:	55                   	push   rbp
  809bf9:	48 89 e5             	mov    rbp,rsp
  809bfc:	48 83 ec 30          	sub    rsp,0x30
  809c00:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  809c04:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  809c07:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  809c0e:	eb 65                	jmp    809c75 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  809c10:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  809c13:	48 63 c2             	movsxd rax,edx
  809c16:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  809c1d:	48 c1 e8 20          	shr    rax,0x20
  809c21:	c1 f8 02             	sar    eax,0x2
  809c24:	89 d6                	mov    esi,edx
  809c26:	c1 fe 1f             	sar    esi,0x1f
  809c29:	29 f0                	sub    eax,esi
  809c2b:	89 c1                	mov    ecx,eax
  809c2d:	89 c8                	mov    eax,ecx
  809c2f:	c1 e0 02             	shl    eax,0x2
  809c32:	01 c8                	add    eax,ecx
  809c34:	01 c0                	add    eax,eax
  809c36:	89 d1                	mov    ecx,edx
  809c38:	29 c1                	sub    ecx,eax
  809c3a:	89 c8                	mov    eax,ecx
  809c3c:	83 c0 30             	add    eax,0x30
  809c3f:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  809c42:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809c45:	8d 50 01             	lea    edx,[rax+0x1]
  809c48:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  809c4b:	48 98                	cdqe   
  809c4d:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  809c51:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  809c55:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  809c58:	48 63 d0             	movsxd rdx,eax
  809c5b:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  809c62:	48 c1 ea 20          	shr    rdx,0x20
  809c66:	c1 fa 02             	sar    edx,0x2
  809c69:	c1 f8 1f             	sar    eax,0x1f
  809c6c:	89 c1                	mov    ecx,eax
  809c6e:	89 d0                	mov    eax,edx
  809c70:	29 c8                	sub    eax,ecx
  809c72:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  809c75:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809c78:	83 f8 0f             	cmp    eax,0xf
  809c7b:	76 93                	jbe    809c10 <sprint_decimal+0x1c>
    }
    while(p>0)
  809c7d:	eb 1f                	jmp    809c9e <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  809c7f:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  809c83:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809c86:	48 98                	cdqe   
  809c88:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  809c8d:	0f be d0             	movsx  edx,al
  809c90:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809c94:	89 d6                	mov    esi,edx
  809c96:	48 89 c7             	mov    rdi,rax
  809c99:	e8 17 ff ff ff       	call   809bb5 <sprintchar>
    while(p>0)
  809c9e:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809ca2:	7f db                	jg     809c7f <sprint_decimal+0x8b>
    }
}
  809ca4:	90                   	nop
  809ca5:	90                   	nop
  809ca6:	c9                   	leave  
  809ca7:	c3                   	ret    

0000000000809ca8 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  809ca8:	f3 0f 1e fa          	endbr64 
  809cac:	55                   	push   rbp
  809cad:	48 89 e5             	mov    rbp,rsp
  809cb0:	48 83 ec 20          	sub    rsp,0x20
  809cb4:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809cb8:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  809cbb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  809cc2:	eb 35                	jmp    809cf9 <sprint_hex+0x51>
        unsigned char a=c%16;
  809cc4:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809cc7:	83 e0 0f             	and    eax,0xf
  809cca:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  809ccd:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  809cd1:	76 06                	jbe    809cd9 <sprint_hex+0x31>
  809cd3:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  809cd7:	eb 04                	jmp    809cdd <sprint_hex+0x35>
        else a+='0';
  809cd9:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  809cdd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809ce0:	8d 50 01             	lea    edx,[rax+0x1]
  809ce3:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  809ce6:	48 98                	cdqe   
  809ce8:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  809cec:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  809cf0:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809cf3:	c1 e8 04             	shr    eax,0x4
  809cf6:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  809cf9:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  809cfd:	7e c5                	jle    809cc4 <sprint_hex+0x1c>
    }
    while(p>0)
  809cff:	eb 1f                	jmp    809d20 <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  809d01:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  809d05:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809d08:	48 98                	cdqe   
  809d0a:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  809d0f:	0f be d0             	movsx  edx,al
  809d12:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809d16:	89 d6                	mov    esi,edx
  809d18:	48 89 c7             	mov    rdi,rax
  809d1b:	e8 95 fe ff ff       	call   809bb5 <sprintchar>
    while(p>0)
  809d20:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809d24:	7f db                	jg     809d01 <sprint_hex+0x59>
    }
}
  809d26:	90                   	nop
  809d27:	90                   	nop
  809d28:	c9                   	leave  
  809d29:	c3                   	ret    

0000000000809d2a <sprintn>:
void sprintn(char *dist,char *str)
{
  809d2a:	f3 0f 1e fa          	endbr64 
  809d2e:	55                   	push   rbp
  809d2f:	48 89 e5             	mov    rbp,rsp
  809d32:	48 83 ec 10          	sub    rsp,0x10
  809d36:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809d3a:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  809d3e:	eb 20                	jmp    809d60 <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  809d40:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d44:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809d48:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  809d4c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d4f:	0f be d0             	movsx  edx,al
  809d52:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d56:	89 d6                	mov    esi,edx
  809d58:	48 89 c7             	mov    rdi,rax
  809d5b:	e8 55 fe ff ff       	call   809bb5 <sprintchar>
    while(*str!='\0')
  809d60:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d64:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d67:	84 c0                	test   al,al
  809d69:	75 d5                	jne    809d40 <sprintn+0x16>
    }
  809d6b:	90                   	nop
  809d6c:	90                   	nop
  809d6d:	c9                   	leave  
  809d6e:	c3                   	ret    
  809d6f:	90                   	nop

0000000000809d70 <create_zero>:
  809d70:	e8 17 9c ff ff       	call   80398c <req_proc>
  809d75:	83 f8 ff             	cmp    eax,0xffffffff
  809d78:	74 0c                	je     809d86 <create_zero.retu>
  809d7a:	e8 d9 9c ff ff       	call   803a58 <set_proc>
  809d7f:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  809d83:	83 c4 40             	add    esp,0x40

0000000000809d86 <create_zero.retu>:
  809d86:	c3                   	ret    

0000000000809d87 <fill_desc>:
  809d87:	55                   	push   rbp
  809d88:	48 89 e5             	mov    rbp,rsp
  809d8b:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  809d8f:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  809d93:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  809d97:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  809d9b:	be da 9e 80 00       	mov    esi,0x809eda
  809da0:	c7 04 25 da 9e 80 00 	mov    DWORD PTR ds:0x809eda,0x0
  809da7:	00 00 00 00 
  809dab:	c7 04 25 de 9e 80 00 	mov    DWORD PTR ds:0x809ede,0x0
  809db2:	00 00 00 00 
  809db6:	66 67 89 0e          	mov    WORD PTR [esi],cx
  809dba:	c1 e9 10             	shr    ecx,0x10
  809dbd:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  809dc2:	c1 ea 10             	shr    edx,0x10
  809dc5:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  809dc9:	66 c1 ea 08          	shr    dx,0x8
  809dcd:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  809dd1:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  809dd6:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  809dda:	c1 e1 08             	shl    ecx,0x8
  809ddd:	09 cf                	or     edi,ecx
  809ddf:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  809de3:	8b 14 25 da 9e 80 00 	mov    edx,DWORD PTR ds:0x809eda
  809dea:	67 89 10             	mov    DWORD PTR [eax],edx
  809ded:	8b 14 25 de 9e 80 00 	mov    edx,DWORD PTR ds:0x809ede
  809df4:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  809df8:	c9                   	leave  
  809df9:	c3                   	ret    

0000000000809dfa <switch_proc_asm>:
  809dfa:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  809e00:	66 89 04 25 18 9e 80 	mov    WORD PTR ds:0x809e18,ax
  809e07:	00 
  809e08:	c7 04 25 14 9e 80 00 	mov    DWORD PTR ds:0x809e14,0x0
  809e0f:	00 00 00 00 

0000000000809e13 <switch_proc_asm.ljmp>:
  809e13:	ea                   	(bad)  
  809e14:	00 00                	add    BYTE PTR [rax],al
  809e16:	00 00                	add    BYTE PTR [rax],al
  809e18:	00 00                	add    BYTE PTR [rax],al
  809e1a:	c3                   	ret    

0000000000809e1b <switch_to>:
  809e1b:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  809e20:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  809e24:	bf 8c 9e 80 00       	mov    edi,0x809e8c
  809e29:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  809e2d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  809e31:	89 c1                	mov    ecx,eax
  809e33:	83 e9 04             	sub    ecx,0x4
  809e36:	67 89 19             	mov    DWORD PTR [ecx],ebx
  809e39:	50                   	push   rax
  809e3a:	89 f5                	mov    ebp,esi
  809e3c:	83 c5 28             	add    ebp,0x28
  809e3f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809e43:	50                   	push   rax
  809e44:	83 c5 04             	add    ebp,0x4
  809e47:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809e4b:	50                   	push   rax
  809e4c:	83 c5 04             	add    ebp,0x4
  809e4f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809e53:	50                   	push   rax
  809e54:	83 c5 04             	add    ebp,0x4
  809e57:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809e5b:	50                   	push   rax
  809e5c:	83 c5 04             	add    ebp,0x4
  809e5f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809e63:	50                   	push   rax
  809e64:	83 c5 04             	add    ebp,0x4
  809e67:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809e6b:	50                   	push   rax
  809e6c:	83 c5 04             	add    ebp,0x4
  809e6f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809e73:	50                   	push   rax
  809e74:	83 c5 04             	add    ebp,0x4
  809e77:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809e7b:	50                   	push   rax
  809e7c:	83 c5 04             	add    ebp,0x4
  809e7f:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  809e83:	0f 22 d8             	mov    cr3,rax
  809e86:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  809e8a:	50                   	push   rax
  809e8b:	5c                   	pop    rsp

0000000000809e8c <switch_to.leap>:
  809e8c:	ea                   	(bad)  
  809e8d:	00 00                	add    BYTE PTR [rax],al
  809e8f:	00 00                	add    BYTE PTR [rax],al
  809e91:	08 00                	or     BYTE PTR [rax],al

0000000000809e93 <save_context>:
  809e93:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  809e98:	83 c0 44             	add    eax,0x44
  809e9b:	b9 08 00 00 00       	mov    ecx,0x8
  809ea0:	89 e7                	mov    edi,esp

0000000000809ea2 <save_context.loops>:
  809ea2:	67 8b 17             	mov    edx,DWORD PTR [edi]
  809ea5:	67 89 10             	mov    DWORD PTR [eax],edx
  809ea8:	83 c7 04             	add    edi,0x4
  809eab:	83 e8 04             	sub    eax,0x4
  809eae:	e2 f2                	loop   809ea2 <save_context.loops>
  809eb0:	5b                   	pop    rbx
  809eb1:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  809eb6:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  809eba:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  809ebf:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  809ec3:	c3                   	ret    

0000000000809ec4 <move_to_user_mode>:
  809ec4:	66 b8 20 00          	mov    ax,0x20
  809ec8:	8e d8                	mov    ds,eax
  809eca:	8e c0                	mov    es,eax
  809ecc:	8e e8                	mov    gs,eax
  809ece:	6a 20                	push   0x20
  809ed0:	54                   	push   rsp
  809ed1:	6a 18                	push   0x18
  809ed3:	68 d9 9e 80 00       	push   0x809ed9
  809ed8:	cf                   	iret   

0000000000809ed9 <move_to_user_mode.done>:
  809ed9:	c3                   	ret    

0000000000809eda <desc>:
	...
