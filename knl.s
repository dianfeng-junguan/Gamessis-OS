
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
  800194:	b8 62 11 80 00       	mov    eax,0x801162
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
  800217:	b8 07 5e 80 00       	mov    eax,0x805e07
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 d9 00 00 00       	call   80030c <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 40 4c 80 00       	mov    eax,0x804c40
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 bd 00 00 00       	call   80030c <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 80 6d 80 00       	mov    eax,0x806d80
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 a1 00 00 00       	call   80030c <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 00 56 80 00       	mov    eax,0x805600
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
  800291:	e8 ca 46 00 00       	call   804960 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 bb 46 00 00       	call   804960 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 ac 46 00 00       	call   804960 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 9d 46 00 00       	call   804960 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 8e 46 00 00       	call   804960 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 7f 46 00 00       	call   804960 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 70 46 00 00       	call   804960 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 61 46 00 00       	call   804960 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 91 46 00 00       	call   80499a <turn_on_int>

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
  800327:	48 8b 15 b2 9b 00 00 	mov    rdx,QWORD PTR [rip+0x9bb2]        # 809ee0 <idt>
  80032e:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800332:	48 c1 e0 04          	shl    rax,0x4
  800336:	48 01 d0             	add    rax,rdx
  800339:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80033d:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800340:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800344:	48 c1 e8 10          	shr    rax,0x10
  800348:	48 89 c2             	mov    rdx,rax
  80034b:	48 8b 0d 8e 9b 00 00 	mov    rcx,QWORD PTR [rip+0x9b8e]        # 809ee0 <idt>
  800352:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800356:	48 c1 e0 04          	shl    rax,0x4
  80035a:	48 01 c8             	add    rax,rcx
  80035d:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  800361:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800365:	48 c1 e8 20          	shr    rax,0x20
  800369:	89 c1                	mov    ecx,eax
  80036b:	48 8b 15 6e 9b 00 00 	mov    rdx,QWORD PTR [rip+0x9b6e]        # 809ee0 <idt>
  800372:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800376:	48 c1 e0 04          	shl    rax,0x4
  80037a:	48 01 c2             	add    rdx,rax
  80037d:	0f b7 c1             	movzx  eax,cx
  800380:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr;
  800383:	48 8b 15 56 9b 00 00 	mov    rdx,QWORD PTR [rip+0x9b56]        # 809ee0 <idt>
  80038a:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80038e:	48 c1 e0 04          	shl    rax,0x4
  800392:	48 01 c2             	add    rdx,rax
  800395:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  800399:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
    idt[index].selector=selector;
  80039d:	48 8b 15 3c 9b 00 00 	mov    rdx,QWORD PTR [rip+0x9b3c]        # 809ee0 <idt>
  8003a4:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003a8:	48 c1 e0 04          	shl    rax,0x4
  8003ac:	48 01 c2             	add    rdx,rax
  8003af:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003b3:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003b7:	48 8b 15 22 9b 00 00 	mov    rdx,QWORD PTR [rip+0x9b22]        # 809ee0 <idt>
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
  8003e1:	e8 a8 45 00 00       	call   80498e <eoi>
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
  8003fb:	e8 8e 45 00 00       	call   80498e <eoi>
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
  800415:	e8 74 45 00 00       	call   80498e <eoi>
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
  80042f:	e8 5a 45 00 00       	call   80498e <eoi>
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
  800449:	e8 40 45 00 00       	call   80498e <eoi>
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
  800463:	e8 26 45 00 00       	call   80498e <eoi>
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
  80047c:	e8 0d 45 00 00       	call   80498e <eoi>
    report_back_trace_of_err();
  800481:	b8 00 00 00 00       	mov    eax,0x0
  800486:	e8 2f 45 00 00       	call   8049ba <report_back_trace_of_err>
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
  8004a1:	e8 e8 44 00 00       	call   80498e <eoi>
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
  8004bb:	e8 ce 44 00 00       	call   80498e <eoi>
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
  8004d4:	e8 b5 44 00 00       	call   80498e <eoi>
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
  8004ed:	e8 9c 44 00 00       	call   80498e <eoi>
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
  800507:	e8 82 44 00 00       	call   80498e <eoi>
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
  800521:	e8 68 44 00 00       	call   80498e <eoi>
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
  800545:	e8 44 44 00 00       	call   80498e <eoi>
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
  800562:	e8 27 44 00 00       	call   80498e <eoi>
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
  80059b:	48 8b 04 c5 40 15 81 	mov    rax,QWORD PTR [rax*8+0x811540]
  8005a2:	00 
  8005a3:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(b);
  8005a6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005a9:	48 98                	cdqe   
  8005ab:	48 89 c7             	mov    rdi,rax
  8005ae:	e8 b3 23 00 00       	call   802966 <reg_device>
  8005b3:	e9 f7 01 00 00       	jmp    8007af <syscall+0x241>
        case 1:return dispose_device(b);
  8005b8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005bb:	89 c7                	mov    edi,eax
  8005bd:	e8 03 2e 00 00       	call   8033c5 <dispose_device>
  8005c2:	e9 e8 01 00 00       	jmp    8007af <syscall+0x241>
        case 2:return reg_driver(b);
  8005c7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005ca:	48 98                	cdqe   
  8005cc:	48 89 c7             	mov    rdi,rax
  8005cf:	e8 7a 26 00 00       	call   802c4e <reg_driver>
  8005d4:	e9 d6 01 00 00       	jmp    8007af <syscall+0x241>
        case 3:return dispose_driver(b);
  8005d9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005dc:	48 98                	cdqe   
  8005de:	48 89 c7             	mov    rdi,rax
  8005e1:	e8 7d 2e 00 00       	call   803463 <dispose_driver>
  8005e6:	e9 c4 01 00 00       	jmp    8007af <syscall+0x241>
        case 4:return call_drv_func(b,c,d);
  8005eb:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8005ee:	48 98                	cdqe   
  8005f0:	48 89 c2             	mov    rdx,rax
  8005f3:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8005f6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005f9:	89 ce                	mov    esi,ecx
  8005fb:	89 c7                	mov    edi,eax
  8005fd:	e8 6c 2b 00 00       	call   80316e <call_drv_func>
  800602:	e9 a8 01 00 00       	jmp    8007af <syscall+0x241>
        case 5:return req_page_at(b,c);
  800607:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80060a:	48 98                	cdqe   
  80060c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80060f:	89 d6                	mov    esi,edx
  800611:	48 89 c7             	mov    rdi,rax
  800614:	e8 3a 0f 00 00       	call   801553 <req_page_at>
  800619:	e9 91 01 00 00       	jmp    8007af <syscall+0x241>
        case 6:return free_page(b);
  80061e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800621:	48 98                	cdqe   
  800623:	48 89 c7             	mov    rdi,rax
  800626:	e8 59 0d 00 00       	call   801384 <free_page>
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
  800648:	e8 17 3f 00 00       	call   804564 <reg_proc>
  80064d:	e9 5d 01 00 00       	jmp    8007af <syscall+0x241>
        case 8:del_proc(b);
  800652:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800655:	89 c7                	mov    edi,eax
  800657:	e8 e5 3c 00 00       	call   804341 <del_proc>
        case 10:chk_vm(b,c);
  80065c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80065f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800662:	89 d6                	mov    esi,edx
  800664:	89 c7                	mov    edi,eax
  800666:	e8 aa 0f 00 00       	call   801615 <chk_vm>
        case 11:return sys_open(b,c);
  80066b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80066e:	48 98                	cdqe   
  800670:	48 89 c2             	mov    rdx,rax
  800673:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800676:	89 c6                	mov    esi,eax
  800678:	48 89 d7             	mov    rdi,rdx
  80067b:	e8 79 13 00 00       	call   8019f9 <sys_open>
  800680:	e9 2a 01 00 00       	jmp    8007af <syscall+0x241>
        case 12:return sys_close(b);
  800685:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800688:	89 c7                	mov    edi,eax
  80068a:	e8 33 18 00 00       	call   801ec2 <sys_close>
  80068f:	e9 1b 01 00 00       	jmp    8007af <syscall+0x241>
        case 13:return sys_read(b,c,d);
  800694:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800697:	48 98                	cdqe   
  800699:	48 89 c1             	mov    rcx,rax
  80069c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80069f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006a2:	48 89 ce             	mov    rsi,rcx
  8006a5:	89 c7                	mov    edi,eax
  8006a7:	e8 2c 19 00 00       	call   801fd8 <sys_read>
  8006ac:	e9 fe 00 00 00       	jmp    8007af <syscall+0x241>
        case 14:return sys_write(b,c,d);
  8006b1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006b4:	48 98                	cdqe   
  8006b6:	48 89 c1             	mov    rcx,rax
  8006b9:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006bc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006bf:	48 89 ce             	mov    rsi,rcx
  8006c2:	89 c7                	mov    edi,eax
  8006c4:	e8 7e 18 00 00       	call   801f47 <sys_write>
  8006c9:	e9 e1 00 00 00       	jmp    8007af <syscall+0x241>
        case 15:return sys_seek(b,c,d);
  8006ce:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006d1:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006d4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006d7:	89 ce                	mov    esi,ecx
  8006d9:	89 c7                	mov    edi,eax
  8006db:	e8 89 19 00 00       	call   802069 <sys_seek>
  8006e0:	e9 ca 00 00 00       	jmp    8007af <syscall+0x241>
        case 16:return sys_tell(b);
  8006e5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006e8:	89 c7                	mov    edi,eax
  8006ea:	e8 c1 19 00 00       	call   8020b0 <sys_tell>
  8006ef:	e9 bb 00 00 00       	jmp    8007af <syscall+0x241>
        case 17:return reg_vol(b,c,d);
  8006f4:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006f7:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006fa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006fd:	89 ce                	mov    esi,ecx
  8006ff:	89 c7                	mov    edi,eax
  800701:	b8 00 00 00 00       	mov    eax,0x0
  800706:	e8 e3 11 00 00       	call   8018ee <reg_vol>
  80070b:	e9 9f 00 00 00       	jmp    8007af <syscall+0x241>
        case 18:return free_vol(b);
  800710:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800713:	89 c7                	mov    edi,eax
  800715:	b8 00 00 00 00       	mov    eax,0x0
  80071a:	e8 b3 11 00 00       	call   8018d2 <free_vol>
  80071f:	e9 8b 00 00 00       	jmp    8007af <syscall+0x241>
        case 19:return execute(b);
  800724:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800727:	48 98                	cdqe   
  800729:	48 89 c7             	mov    rdi,rax
  80072c:	e8 1c 45 00 00       	call   804c4d <execute>
  800731:	eb 7c                	jmp    8007af <syscall+0x241>
        case SYSCALL_EXIT:return sys_exit(b);
  800733:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800736:	89 c7                	mov    edi,eax
  800738:	e8 06 3e 00 00       	call   804543 <sys_exit>
  80073d:	eb 70                	jmp    8007af <syscall+0x241>
        case SYSCALL_CALL:return exec_call(b);
  80073f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800742:	48 98                	cdqe   
  800744:	48 89 c7             	mov    rdi,rax
  800747:	e8 fc 45 00 00       	call   804d48 <exec_call>
  80074c:	eb 61                	jmp    8007af <syscall+0x241>
        case SYSCALL_MKFIFO:return sys_mkfifo(b);
  80074e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800751:	89 c7                	mov    edi,eax
  800753:	e8 1b 10 00 00       	call   801773 <sys_mkfifo>
  800758:	eb 55                	jmp    8007af <syscall+0x241>
        case SYSCALL_MALLOC:return sys_malloc(b);
  80075a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80075d:	89 c7                	mov    edi,eax
  80075f:	e8 b6 3f 00 00       	call   80471a <sys_malloc>
  800764:	eb 49                	jmp    8007af <syscall+0x241>
        case SYSCALL_FREE:return sys_free(b);
  800766:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800769:	89 c7                	mov    edi,eax
  80076b:	e8 38 41 00 00       	call   8048a8 <sys_free>
  800770:	eb 3d                	jmp    8007af <syscall+0x241>
        case SYSCALL_KB_READC:return sys_getkbc();
  800772:	b8 00 00 00 00       	mov    eax,0x0
  800777:	e8 fe 57 00 00       	call   805f7a <sys_getkbc>
  80077c:	0f be c0             	movsx  eax,al
  80077f:	eb 2e                	jmp    8007af <syscall+0x241>
        case SYSCALL_FIND_DEV:return sys_find_dev(b);
  800781:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800784:	48 98                	cdqe   
  800786:	48 89 c7             	mov    rdi,rax
  800789:	e8 10 26 00 00       	call   802d9e <sys_find_dev>
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
  8007a8:	e8 83 26 00 00       	call   802e30 <sys_operate_dev>
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
  80080a:	48 8b 04 c5 a8 18 81 	mov    rax,QWORD PTR [rax*8+0x8118a8]
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
  80081e:	e8 a7 07 00 00       	call   800fca <set_high_mem_base>
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
  800854:	e8 88 07 00 00       	call   800fe1 <set_mem_area>
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
  8008ae:	e8 12 4f 00 00       	call   8057c5 <set_framebuffer>
  8008b3:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  8008b7:	b8 00 00 00 00       	mov    eax,0x0
  8008bc:	e8 4f 4d 00 00       	call   805610 <init_framebuffer>
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
  800a85:	e8 45 4c 00 00       	call   8056cf <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800a8a:	bf 68 18 81 00       	mov    edi,0x811868
  800a8f:	e8 ed 50 00 00       	call   805b81 <print>
    init_int();
  800a94:	b8 00 00 00 00       	mov    eax,0x0
  800a99:	e8 62 f5 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800a9e:	bf 85 18 81 00       	mov    edi,0x811885
  800aa3:	e8 d9 50 00 00       	call   805b81 <print>
    init_memory();
  800aa8:	b8 00 00 00 00       	mov    eax,0x0
  800aad:	e8 df 07 00 00       	call   801291 <init_memory>
    init_com(PORT_COM1);
  800ab2:	bf f8 03 00 00       	mov    edi,0x3f8
  800ab7:	e8 fd 88 00 00       	call   8093b9 <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800abc:	be f8 03 00 00       	mov    esi,0x3f8
  800ac1:	bf 92 18 81 00       	mov    edi,0x811892
  800ac6:	e8 3a 8a 00 00       	call   809505 <com_puts>
	init_paging();
  800acb:	b8 00 00 00 00       	mov    eax,0x0
  800ad0:	e8 ea 04 00 00       	call   800fbf <init_paging>
// 	init_gdt();
    init_drvdev_man();
  800ad5:	b8 00 00 00 00       	mov    eax,0x0
  800ada:	e8 6d 1e 00 00       	call   80294c <init_drvdev_man>
    init_proc();
  800adf:	b8 00 00 00 00       	mov    eax,0x0
  800ae4:	e8 4e 2d 00 00       	call   803837 <init_proc>
    //自带驱动
    //init_tty();
    init_kb();
  800ae9:	b8 00 00 00 00       	mov    eax,0x0
  800aee:	e8 f5 52 00 00       	call   805de8 <init_kb>
    init_disk();
  800af3:	b8 00 00 00 00       	mov    eax,0x0
  800af8:	e8 e1 54 00 00       	call   805fde <init_disk>

//	init_vfs();
    //init_fat16();
	manage_proc_lock=0;
  800afd:	c7 05 e1 93 00 00 00 	mov    DWORD PTR [rip+0x93e1],0x0        # 809ee8 <manage_proc_lock>
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
static void putchar (int c)
{
  800c48:	f3 0f 1e fa          	endbr64 
  800c4c:	55                   	push   rbp
  800c4d:	48 89 e5             	mov    rbp,rsp
  800c50:	48 83 ec 20          	sub    rsp,0x20
  800c54:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    char s[2]={c,'\0'};
  800c57:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800c5a:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  800c5d:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
    print(s);
  800c61:	48 8d 45 fe          	lea    rax,[rbp-0x2]
  800c65:	48 89 c7             	mov    rdi,rax
  800c68:	e8 14 4f 00 00       	call   805b81 <print>
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800c6d:	c9                   	leave  
  800c6e:	c3                   	ret    

0000000000800c6f <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800c6f:	f3 0f 1e fa          	endbr64 
  800c73:	55                   	push   rbp
  800c74:	48 89 e5             	mov    rbp,rsp
  800c77:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800c7e:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800c85:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800c8c:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800c93:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800c9a:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800ca1:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800ca8:	84 c0                	test   al,al
  800caa:	74 20                	je     800ccc <printf+0x5d>
  800cac:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800cb0:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800cb4:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800cb8:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800cbc:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800cc0:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800cc4:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800cc8:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800ccc:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800cd3:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    int c;
    char buf[20];
 
    arg++;
  800cda:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800ce1:	08 
 
    while ((c = *format++) != 0)
  800ce2:	e9 38 01 00 00       	jmp    800e1f <printf+0x1b0>
    {
        if (c != '%')
  800ce7:	83 bd 3c ff ff ff 25 	cmp    DWORD PTR [rbp-0xc4],0x25
  800cee:	74 12                	je     800d02 <printf+0x93>
            putchar (c);
  800cf0:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  800cf6:	89 c7                	mov    edi,eax
  800cf8:	e8 4b ff ff ff       	call   800c48 <putchar>
  800cfd:	e9 1d 01 00 00       	jmp    800e1f <printf+0x1b0>
        else
        {
            char *p;
 
            c = *format++;
  800d02:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800d09:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800d0d:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800d14:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800d17:	0f be c0             	movsx  eax,al
  800d1a:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
            switch (c)
  800d20:	83 bd 3c ff ff ff 78 	cmp    DWORD PTR [rbp-0xc4],0x78
  800d27:	74 3a                	je     800d63 <printf+0xf4>
  800d29:	83 bd 3c ff ff ff 78 	cmp    DWORD PTR [rbp-0xc4],0x78
  800d30:	0f 8f cd 00 00 00    	jg     800e03 <printf+0x194>
  800d36:	83 bd 3c ff ff ff 75 	cmp    DWORD PTR [rbp-0xc4],0x75
  800d3d:	74 24                	je     800d63 <printf+0xf4>
  800d3f:	83 bd 3c ff ff ff 75 	cmp    DWORD PTR [rbp-0xc4],0x75
  800d46:	0f 8f b7 00 00 00    	jg     800e03 <printf+0x194>
  800d4c:	83 bd 3c ff ff ff 64 	cmp    DWORD PTR [rbp-0xc4],0x64
  800d53:	74 0e                	je     800d63 <printf+0xf4>
  800d55:	83 bd 3c ff ff ff 73 	cmp    DWORD PTR [rbp-0xc4],0x73
  800d5c:	74 40                	je     800d9e <printf+0x12f>
  800d5e:	e9 a0 00 00 00       	jmp    800e03 <printf+0x194>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800d63:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800d6a:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800d6e:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800d75:	8b 10                	mov    edx,DWORD PTR [rax]
  800d77:	8b 8d 3c ff ff ff    	mov    ecx,DWORD PTR [rbp-0xc4]
  800d7d:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800d84:	89 ce                	mov    esi,ecx
  800d86:	48 89 c7             	mov    rdi,rax
  800d89:	e8 a5 fd ff ff       	call   800b33 <itoa>
                p = buf;
  800d8e:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800d95:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800d9c:	eb 34                	jmp    800dd2 <printf+0x163>
                break;
 
            case 's':
                p = *arg++;
  800d9e:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800da5:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800da9:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800db0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800db3:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800dba:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800dc1:	00 
  800dc2:	75 0d                	jne    800dd1 <printf+0x162>
                    p = "(null)";
  800dc4:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x8118f0
  800dcb:	f0 18 81 00 
  800dcf:	eb 22                	jmp    800df3 <printf+0x184>
 
string:
  800dd1:	90                   	nop
                while (*p)
  800dd2:	eb 1f                	jmp    800df3 <printf+0x184>
                    putchar (*p++);
  800dd4:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800ddb:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800ddf:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800de6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800de9:	0f be c0             	movsx  eax,al
  800dec:	89 c7                	mov    edi,eax
  800dee:	e8 55 fe ff ff       	call   800c48 <putchar>
                while (*p)
  800df3:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800dfa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800dfd:	84 c0                	test   al,al
  800dff:	75 d3                	jne    800dd4 <printf+0x165>
                break;
  800e01:	eb 1c                	jmp    800e1f <printf+0x1b0>
 
            default:
                putchar (*((int *) arg++));
  800e03:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e0a:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e0e:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e15:	8b 00                	mov    eax,DWORD PTR [rax]
  800e17:	89 c7                	mov    edi,eax
  800e19:	e8 2a fe ff ff       	call   800c48 <putchar>
                break;
  800e1e:	90                   	nop
    while ((c = *format++) != 0)
  800e1f:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800e26:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e2a:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800e31:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e34:	0f be c0             	movsx  eax,al
  800e37:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
  800e3d:	83 bd 3c ff ff ff 00 	cmp    DWORD PTR [rbp-0xc4],0x0
  800e44:	0f 85 9d fe ff ff    	jne    800ce7 <printf+0x78>
            }
        }
    }
}
  800e4a:	90                   	nop
  800e4b:	90                   	nop
  800e4c:	c9                   	leave  
  800e4d:	c3                   	ret    

0000000000800e4e <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800e4e:	f3 0f 1e fa          	endbr64 
  800e52:	55                   	push   rbp
  800e53:	48 89 e5             	mov    rbp,rsp
  800e56:	48 83 ec 40          	sub    rsp,0x40
  800e5a:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800e5e:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800e62:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800e65:	48 8b 15 94 90 00 00 	mov    rdx,QWORD PTR [rip+0x9094]        # 809f00 <pml4>
  800e6c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800e70:	48 c1 e8 27          	shr    rax,0x27
  800e74:	48 c1 e0 03          	shl    rax,0x3
  800e78:	48 01 d0             	add    rax,rdx
  800e7b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800e7e:	b0 00                	mov    al,0x0
  800e80:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800e84:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800e8b:	00 00 00 
  800e8e:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800e92:	48 c1 e8 1e          	shr    rax,0x1e
  800e96:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800e99:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800e9c:	48 98                	cdqe   
  800e9e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800ea5:	00 
  800ea6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800eaa:	48 01 d0             	add    rax,rdx
  800ead:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800eb0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800eb4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800eb8:	83 e0 01             	and    eax,0x1
  800ebb:	48 85 c0             	test   rax,rax
  800ebe:	75 2f                	jne    800eef <mmap+0xa1>
    {
        pdp=(page_item*)vmalloc();
  800ec0:	b8 00 00 00 00       	mov    eax,0x0
  800ec5:	e8 a3 01 00 00       	call   80106d <vmalloc>
  800eca:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        pdptp[pdpti]=(addr_t)pdp|attr;
  800ece:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800ed1:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800ed5:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800ed8:	48 98                	cdqe   
  800eda:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800ee1:	00 
  800ee2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800ee6:	48 01 f0             	add    rax,rsi
  800ee9:	48 09 ca             	or     rdx,rcx
  800eec:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800eef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ef3:	b0 00                	mov    al,0x0
  800ef5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800ef9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800efd:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f02:	48 c1 e8 15          	shr    rax,0x15
  800f06:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f0d:	00 
  800f0e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f12:	48 01 d0             	add    rax,rdx
  800f15:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f18:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800f1c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f20:	83 e0 01             	and    eax,0x1
  800f23:	48 85 c0             	test   rax,rax
  800f26:	75 37                	jne    800f5f <mmap+0x111>
    {
        pt=(page_item*)vmalloc();
  800f28:	b8 00 00 00 00       	mov    eax,0x0
  800f2d:	e8 3b 01 00 00       	call   80106d <vmalloc>
  800f32:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800f36:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f39:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800f3d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f41:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f46:	48 c1 e8 15          	shr    rax,0x15
  800f4a:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f51:	00 
  800f52:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f56:	48 01 f0             	add    rax,rsi
  800f59:	48 09 ca             	or     rdx,rcx
  800f5c:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  800f5f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f63:	b0 00                	mov    al,0x0
  800f65:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  800f69:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  800f6c:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  800f70:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  800f76:	48 c1 ea 0c          	shr    rdx,0xc
  800f7a:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  800f81:	00 
  800f82:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800f86:	48 01 ca             	add    rdx,rcx
  800f89:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  800f8d:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  800f90:	b8 00 00 00 00       	mov    eax,0x0
}
  800f95:	c9                   	leave  
  800f96:	c3                   	ret    

0000000000800f97 <mdemap>:

stat_t mdemap(addr_t la)
{
  800f97:	f3 0f 1e fa          	endbr64 
  800f9b:	55                   	push   rbp
  800f9c:	48 89 e5             	mov    rbp,rsp
  800f9f:	48 83 ec 10          	sub    rsp,0x10
  800fa3:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  800fa7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fab:	ba 00 00 00 00       	mov    edx,0x0
  800fb0:	48 89 c6             	mov    rsi,rax
  800fb3:	bf 00 00 00 00       	mov    edi,0x0
  800fb8:	e8 91 fe ff ff       	call   800e4e <mmap>
}
  800fbd:	c9                   	leave  
  800fbe:	c3                   	ret    

0000000000800fbf <init_paging>:
int init_paging()
{
  800fbf:	f3 0f 1e fa          	endbr64 
  800fc3:	55                   	push   rbp
  800fc4:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  800fc7:	90                   	nop
  800fc8:	5d                   	pop    rbp
  800fc9:	c3                   	ret    

0000000000800fca <set_high_mem_base>:
void set_high_mem_base(int base)
{
  800fca:	f3 0f 1e fa          	endbr64 
  800fce:	55                   	push   rbp
  800fcf:	48 89 e5             	mov    rbp,rsp
  800fd2:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  800fd5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  800fd8:	89 05 3a 8f 00 00    	mov    DWORD PTR [rip+0x8f3a],eax        # 809f18 <high_mem_base>
}
  800fde:	90                   	nop
  800fdf:	5d                   	pop    rbp
  800fe0:	c3                   	ret    

0000000000800fe1 <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  800fe1:	f3 0f 1e fa          	endbr64 
  800fe5:	55                   	push   rbp
  800fe6:	48 89 e5             	mov    rbp,rsp
  800fe9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  800fed:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  800ff1:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  800ff5:	8b 05 25 f3 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff325]        # 400320 <mmap_t_i>
  800ffb:	48 63 d0             	movsxd rdx,eax
  800ffe:	48 89 d0             	mov    rax,rdx
  801001:	48 01 c0             	add    rax,rax
  801004:	48 01 d0             	add    rax,rdx
  801007:	48 c1 e0 03          	shl    rax,0x3
  80100b:	48 8d 90 40 01 40 00 	lea    rdx,[rax+0x400140]
  801012:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801016:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  801019:	8b 05 01 f3 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff301]        # 400320 <mmap_t_i>
  80101f:	48 63 d0             	movsxd rdx,eax
  801022:	48 89 d0             	mov    rax,rdx
  801025:	48 01 c0             	add    rax,rax
  801028:	48 01 d0             	add    rax,rdx
  80102b:	48 c1 e0 03          	shl    rax,0x3
  80102f:	48 8d 90 48 01 40 00 	lea    rdx,[rax+0x400148]
  801036:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80103a:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  80103d:	8b 05 dd f2 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff2dd]        # 400320 <mmap_t_i>
  801043:	8d 50 01             	lea    edx,[rax+0x1]
  801046:	89 15 d4 f2 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff2d4],edx        # 400320 <mmap_t_i>
  80104c:	48 63 d0             	movsxd rdx,eax
  80104f:	48 89 d0             	mov    rax,rdx
  801052:	48 01 c0             	add    rax,rax
  801055:	48 01 d0             	add    rax,rdx
  801058:	48 c1 e0 03          	shl    rax,0x3
  80105c:	48 8d 90 50 01 40 00 	lea    rdx,[rax+0x400150]
  801063:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801067:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  80106a:	90                   	nop
  80106b:	5d                   	pop    rbp
  80106c:	c3                   	ret    

000000000080106d <vmalloc>:
addr_t vmalloc()
{
  80106d:	f3 0f 1e fa          	endbr64 
  801071:	55                   	push   rbp
  801072:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  801075:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80107c:	eb 76                	jmp    8010f4 <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  80107e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801085:	eb 63                	jmp    8010ea <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  801087:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80108a:	48 98                	cdqe   
  80108c:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [rax*4+0x400120]
  801093:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801096:	be 01 00 00 00       	mov    esi,0x1
  80109b:	89 c1                	mov    ecx,eax
  80109d:	d3 e6                	shl    esi,cl
  80109f:	89 f0                	mov    eax,esi
  8010a1:	21 d0                	and    eax,edx
  8010a3:	85 c0                	test   eax,eax
  8010a5:	75 3f                	jne    8010e6 <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  8010a7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010aa:	48 98                	cdqe   
  8010ac:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [rax*4+0x400120]
  8010b3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8010b6:	be 01 00 00 00       	mov    esi,0x1
  8010bb:	89 c1                	mov    ecx,eax
  8010bd:	d3 e6                	shl    esi,cl
  8010bf:	89 f0                	mov    eax,esi
  8010c1:	09 c2                	or     edx,eax
  8010c3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010c6:	48 98                	cdqe   
  8010c8:	89 14 85 20 01 40 00 	mov    DWORD PTR [rax*4+0x400120],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  8010cf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010d2:	c1 e0 05             	shl    eax,0x5
  8010d5:	89 c2                	mov    edx,eax
  8010d7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8010da:	01 d0                	add    eax,edx
  8010dc:	83 c0 20             	add    eax,0x20
  8010df:	c1 e0 0c             	shl    eax,0xc
  8010e2:	48 98                	cdqe   
  8010e4:	eb 14                	jmp    8010fa <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  8010e6:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8010ea:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8010ee:	7e 97                	jle    801087 <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8010f0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8010f4:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8010f8:	7e 84                	jle    80107e <vmalloc+0x11>
            }
        }
    }
}
  8010fa:	5d                   	pop    rbp
  8010fb:	c3                   	ret    

00000000008010fc <vmfree>:

int vmfree(addr_t ptr)
{
  8010fc:	f3 0f 1e fa          	endbr64 
  801100:	55                   	push   rbp
  801101:	48 89 e5             	mov    rbp,rsp
  801104:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  801108:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80110c:	48 c1 e8 0c          	shr    rax,0xc
  801110:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  801113:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801116:	8d 50 1f             	lea    edx,[rax+0x1f]
  801119:	85 c0                	test   eax,eax
  80111b:	0f 48 c2             	cmovs  eax,edx
  80111e:	c1 f8 05             	sar    eax,0x5
  801121:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  801124:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801127:	99                   	cdq    
  801128:	c1 ea 1b             	shr    edx,0x1b
  80112b:	01 d0                	add    eax,edx
  80112d:	83 e0 1f             	and    eax,0x1f
  801130:	29 d0                	sub    eax,edx
  801132:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  801135:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801138:	48 98                	cdqe   
  80113a:	8b 14 85 20 01 40 00 	mov    edx,DWORD PTR [rax*4+0x400120]
  801141:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801144:	be 01 00 00 00       	mov    esi,0x1
  801149:	89 c1                	mov    ecx,eax
  80114b:	d3 e6                	shl    esi,cl
  80114d:	89 f0                	mov    eax,esi
  80114f:	f7 d0                	not    eax
  801151:	21 c2                	and    edx,eax
  801153:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801156:	48 98                	cdqe   
  801158:	89 14 85 20 01 40 00 	mov    DWORD PTR [rax*4+0x400120],edx
}
  80115f:	90                   	nop
  801160:	5d                   	pop    rbp
  801161:	c3                   	ret    

0000000000801162 <page_err>:
void page_err(){
  801162:	f3 0f 1e fa          	endbr64 
  801166:	55                   	push   rbp
  801167:	48 89 e5             	mov    rbp,rsp
  80116a:	53                   	push   rbx
  80116b:	48 83 ec 28          	sub    rsp,0x28
    asm("cli");
  80116f:	fa                   	cli    
    print("page err\n");
  801170:	bf f8 18 81 00       	mov    edi,0x8118f8
  801175:	e8 07 4a 00 00       	call   805b81 <print>
    unsigned long err_code=0,l_addr=0;
  80117a:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  801181:	00 
  801182:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  801189:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  80118a:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  80118e:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  801192:	0f 20 d0             	mov    rax,cr2
  801195:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  801199:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80119d:	83 e0 01             	and    eax,0x1
  8011a0:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  8011a3:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8011a7:	75 27                	jne    8011d0 <page_err+0x6e>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        mmap(vmalloc(),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  8011a9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8011ad:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  8011b3:	48 89 c3             	mov    rbx,rax
  8011b6:	b8 00 00 00 00       	mov    eax,0x0
  8011bb:	e8 ad fe ff ff       	call   80106d <vmalloc>
  8011c0:	ba 07 00 00 00       	mov    edx,0x7
  8011c5:	48 89 de             	mov    rsi,rbx
  8011c8:	48 89 c7             	mov    rdi,rax
  8011cb:	e8 7e fc ff ff       	call   800e4e <mmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  8011d0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8011d4:	83 e0 02             	and    eax,0x2
  8011d7:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("when writing\n");else //puts("when reading");
  8011da:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8011de:	74 0c                	je     8011ec <page_err+0x8a>
  8011e0:	bf 02 19 81 00       	mov    edi,0x811902
  8011e5:	e8 97 49 00 00       	call   805b81 <print>
  8011ea:	eb 0a                	jmp    8011f6 <page_err+0x94>
    p=err_code&4;
  8011ec:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8011f0:	83 e0 04             	and    eax,0x4
  8011f3:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  8011f6:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8011fa:	75 0c                	jne    801208 <page_err+0xa6>
  8011fc:	bf 10 19 81 00       	mov    edi,0x811910
  801201:	e8 7b 49 00 00       	call   805b81 <print>
  801206:	eb 0a                	jmp    801212 <page_err+0xb0>
    p=err_code&16;
  801208:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80120c:	83 e0 10             	and    eax,0x10
  80120f:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  801212:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801216:	74 0a                	je     801222 <page_err+0xc0>
  801218:	bf 28 19 81 00       	mov    edi,0x811928
  80121d:	e8 5f 49 00 00       	call   805b81 <print>
    unsigned int addr=0;
  801222:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%ebp),%0":"=r"(addr));
  801229:	67 8b 45 08          	mov    eax,DWORD PTR [ebp+0x8]
  80122d:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  801230:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  801234:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  801237:	89 c6                	mov    esi,eax
  801239:	bf 48 19 81 00       	mov    edi,0x811948
  80123e:	b8 00 00 00 00       	mov    eax,0x0
  801243:	e8 27 fa ff ff       	call   800c6f <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  801248:	48 8b 15 51 73 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc07351]        # 4085a0 <task>
  80124f:	8b 05 1b 0f c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10f1b]        # 412170 <cur_proc>
  801255:	48 98                	cdqe   
  801257:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80125e:	48 01 d0             	add    rax,rdx
  801261:	8b 00                	mov    eax,DWORD PTR [rax]
  801263:	83 f8 01             	cmp    eax,0x1
  801266:	75 11                	jne    801279 <page_err+0x117>
    {
        printf("sys died. please reboot.\n");
  801268:	bf 6a 19 81 00       	mov    edi,0x81196a
  80126d:	b8 00 00 00 00       	mov    eax,0x0
  801272:	e8 f8 f9 ff ff       	call   800c6f <printf>
        asm volatile("jmp .");
  801277:	eb fe                	jmp    801277 <page_err+0x115>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  801279:	b8 00 00 00 00       	mov    eax,0x0
  80127e:	e8 0b 37 00 00       	call   80498e <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n leave\r\n add $8,%esp \r\n iretq");
  801283:	fb                   	sti    
  801284:	c9                   	leave  
  801285:	83 c4 08             	add    esp,0x8
  801288:	48 cf                	iretq  
}
  80128a:	90                   	nop
  80128b:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80128f:	c9                   	leave  
  801290:	c3                   	ret    

0000000000801291 <init_memory>:
void init_memory()
{
  801291:	f3 0f 1e fa          	endbr64 
  801295:	55                   	push   rbp
  801296:	48 89 e5             	mov    rbp,rsp
    for (int i=0;i<mmap_t_i;i++)
  801299:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8012a0:	eb 04                	jmp    8012a6 <init_memory+0x15>
  8012a2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8012a6:	8b 05 74 f0 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff074]        # 400320 <mmap_t_i>
  8012ac:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8012af:	7c f1                	jl     8012a2 <init_memory+0x11>
//                printf("reserved mem\n");
//                break;
//        }

    }
    for(int i=0;i<8;i++){
  8012b1:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8012b8:	eb 14                	jmp    8012ce <init_memory+0x3d>
        page_map[i]=0xffffffff;
  8012ba:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8012bd:	48 98                	cdqe   
  8012bf:	c7 04 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],0xffffffff
  8012c6:	ff ff ff ff 
    for(int i=0;i<8;i++){
  8012ca:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8012ce:	83 7d f8 07          	cmp    DWORD PTR [rbp-0x8],0x7
  8012d2:	7e e6                	jle    8012ba <init_memory+0x29>
    剩下正常。
    asm volatile("mov ")
     */
    //page_index[768]=page_index[7];
    //page_index[7]=0;
}
  8012d4:	90                   	nop
  8012d5:	90                   	nop
  8012d6:	5d                   	pop    rbp
  8012d7:	c3                   	ret    

00000000008012d8 <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  8012d8:	f3 0f 1e fa          	endbr64 
  8012dc:	55                   	push   rbp
  8012dd:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  8012e0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8012e7:	e9 8c 00 00 00       	jmp    801378 <req_a_page+0xa0>
        for(int j=0;j<32;j++){
  8012ec:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8012f3:	eb 79                	jmp    80136e <req_a_page+0x96>
            unsigned int bit=page_map[i]&(1<<j);
  8012f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8012f8:	48 98                	cdqe   
  8012fa:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  801301:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801304:	be 01 00 00 00       	mov    esi,0x1
  801309:	89 c1                	mov    ecx,eax
  80130b:	d3 e6                	shl    esi,cl
  80130d:	89 f0                	mov    eax,esi
  80130f:	21 d0                	and    eax,edx
  801311:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  801314:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801317:	c1 e0 05             	shl    eax,0x5
  80131a:	89 c2                	mov    edx,eax
  80131c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80131f:	01 d0                	add    eax,edx
  801321:	c1 e0 0c             	shl    eax,0xc
  801324:	3d ff ff 0f 00       	cmp    eax,0xfffff
  801329:	7e 3f                	jle    80136a <req_a_page+0x92>
  80132b:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80132f:	75 39                	jne    80136a <req_a_page+0x92>
            {
                page_map[i]=page_map[i]|(1<<j);
  801331:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801334:	48 98                	cdqe   
  801336:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  80133d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801340:	be 01 00 00 00       	mov    esi,0x1
  801345:	89 c1                	mov    ecx,eax
  801347:	d3 e6                	shl    esi,cl
  801349:	89 f0                	mov    eax,esi
  80134b:	09 c2                	or     edx,eax
  80134d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801350:	48 98                	cdqe   
  801352:	89 14 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],edx
                return i*32+j;//num of page
  801359:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80135c:	c1 e0 05             	shl    eax,0x5
  80135f:	89 c2                	mov    edx,eax
  801361:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801364:	01 d0                	add    eax,edx
  801366:	48 98                	cdqe   
  801368:	eb 18                	jmp    801382 <req_a_page+0xaa>
        for(int j=0;j<32;j++){
  80136a:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80136e:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801372:	7e 81                	jle    8012f5 <req_a_page+0x1d>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801374:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801378:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80137c:	0f 8e 6a ff ff ff    	jle    8012ec <req_a_page+0x14>

            }
        }
    }
}
  801382:	5d                   	pop    rbp
  801383:	c3                   	ret    

0000000000801384 <free_page>:

int free_page(char *paddr){
  801384:	f3 0f 1e fa          	endbr64 
  801388:	55                   	push   rbp
  801389:	48 89 e5             	mov    rbp,rsp
  80138c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  801390:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801394:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80139a:	85 c0                	test   eax,eax
  80139c:	0f 48 c2             	cmovs  eax,edx
  80139f:	c1 f8 0c             	sar    eax,0xc
  8013a2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8013a5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8013a8:	8d 50 1f             	lea    edx,[rax+0x1f]
  8013ab:	85 c0                	test   eax,eax
  8013ad:	0f 48 c2             	cmovs  eax,edx
  8013b0:	c1 f8 05             	sar    eax,0x5
  8013b3:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8013b6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8013b9:	99                   	cdq    
  8013ba:	c1 ea 1b             	shr    edx,0x1b
  8013bd:	01 d0                	add    eax,edx
  8013bf:	83 e0 1f             	and    eax,0x1f
  8013c2:	29 d0                	sub    eax,edx
  8013c4:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  8013c7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8013ca:	48 98                	cdqe   
  8013cc:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  8013d3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8013d6:	be 01 00 00 00       	mov    esi,0x1
  8013db:	89 c1                	mov    ecx,eax
  8013dd:	d3 e6                	shl    esi,cl
  8013df:	89 f0                	mov    eax,esi
  8013e1:	f7 d0                	not    eax
  8013e3:	21 c2                	and    edx,eax
  8013e5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8013e8:	48 98                	cdqe   
  8013ea:	89 14 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],edx
}
  8013f1:	90                   	nop
  8013f2:	5d                   	pop    rbp
  8013f3:	c3                   	ret    

00000000008013f4 <check_page>:
int check_page(int num){
  8013f4:	f3 0f 1e fa          	endbr64 
  8013f8:	55                   	push   rbp
  8013f9:	48 89 e5             	mov    rbp,rsp
  8013fc:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  8013ff:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801402:	8d 50 1f             	lea    edx,[rax+0x1f]
  801405:	85 c0                	test   eax,eax
  801407:	0f 48 c2             	cmovs  eax,edx
  80140a:	c1 f8 05             	sar    eax,0x5
  80140d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  801410:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801413:	99                   	cdq    
  801414:	c1 ea 1b             	shr    edx,0x1b
  801417:	01 d0                	add    eax,edx
  801419:	83 e0 1f             	and    eax,0x1f
  80141c:	29 d0                	sub    eax,edx
  80141e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  801421:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801424:	48 98                	cdqe   
  801426:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  80142d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801430:	be 01 00 00 00       	mov    esi,0x1
  801435:	89 c1                	mov    ecx,eax
  801437:	d3 e6                	shl    esi,cl
  801439:	89 f0                	mov    eax,esi
  80143b:	21 d0                	and    eax,edx
  80143d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  801440:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  801443:	5d                   	pop    rbp
  801444:	c3                   	ret    

0000000000801445 <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  801445:	f3 0f 1e fa          	endbr64 
  801449:	55                   	push   rbp
  80144a:	48 89 e5             	mov    rbp,rsp
  80144d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  801450:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801453:	c1 e0 0c             	shl    eax,0xc
}
  801456:	5d                   	pop    rbp
  801457:	c3                   	ret    

0000000000801458 <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  801458:	f3 0f 1e fa          	endbr64 
  80145c:	55                   	push   rbp
  80145d:	48 89 e5             	mov    rbp,rsp
  801460:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801464:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  801467:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  80146a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80146e:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  801475:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801479:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80147c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80147f:	89 c0                	mov    eax,eax
  801481:	25 00 f0 ff ff       	and    eax,0xfffff000
  801486:	48 09 c2             	or     rdx,rax
  801489:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80148d:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  801490:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801494:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801497:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80149a:	48 98                	cdqe   
  80149c:	48 09 c2             	or     rdx,rax
  80149f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8014a3:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8014a6:	90                   	nop
  8014a7:	5d                   	pop    rbp
  8014a8:	c3                   	ret    

00000000008014a9 <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  8014a9:	f3 0f 1e fa          	endbr64 
  8014ad:	55                   	push   rbp
  8014ae:	48 89 e5             	mov    rbp,rsp
  8014b1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8014b5:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  8014b8:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  8014bb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014bf:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  8014c6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014ca:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8014cd:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8014d0:	0c 81                	or     al,0x81
  8014d2:	89 c0                	mov    eax,eax
  8014d4:	48 09 c2             	or     rdx,rax
  8014d7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014db:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  8014de:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8014e1:	25 00 00 00 c0       	and    eax,0xc0000000
  8014e6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  8014e9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014ed:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8014f0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014f3:	48 09 c2             	or     rdx,rax
  8014f6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014fa:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8014fd:	90                   	nop
  8014fe:	5d                   	pop    rbp
  8014ff:	c3                   	ret    

0000000000801500 <set_2mb_pde>:
void set_2mb_pde(page_item* pde,int pa)
{
  801500:	f3 0f 1e fa          	endbr64 
  801504:	55                   	push   rbp
  801505:	48 89 e5             	mov    rbp,rsp
  801508:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80150c:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    *pde=0;
  80150f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801513:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT;
  80151a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80151e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801521:	48 0d 81 10 00 00    	or     rax,0x1081
  801527:	48 89 c2             	mov    rdx,rax
  80152a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80152e:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  801531:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801534:	25 00 00 c0 ff       	and    eax,0xffc00000
  801539:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  80153c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801540:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801543:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801546:	48 09 c2             	or     rdx,rax
  801549:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80154d:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801550:	90                   	nop
  801551:	5d                   	pop    rbp
  801552:	c3                   	ret    

0000000000801553 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  801553:	f3 0f 1e fa          	endbr64 
  801557:	55                   	push   rbp
  801558:	48 89 e5             	mov    rbp,rsp
  80155b:	48 83 ec 20          	sub    rsp,0x20
  80155f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801563:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  801566:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  80156b:	75 18                	jne    801585 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  80156d:	b8 00 00 00 00       	mov    eax,0x0
  801572:	e8 61 fd ff ff       	call   8012d8 <req_a_page>
  801577:	89 c7                	mov    edi,eax
  801579:	e8 c7 fe ff ff       	call   801445 <get_phyaddr>
  80157e:	48 98                	cdqe   
  801580:	e9 8e 00 00 00       	jmp    801613 <req_page_at+0xc0>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  801585:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801589:	89 c2                	mov    edx,eax
  80158b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80158e:	89 c6                	mov    esi,eax
  801590:	89 d7                	mov    edi,edx
  801592:	e8 3b 01 00 00       	call   8016d2 <is_pgs_ava>
  801597:	85 c0                	test   eax,eax
  801599:	75 09                	jne    8015a4 <req_page_at+0x51>
  80159b:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  8015a2:	eb 6f                	jmp    801613 <req_page_at+0xc0>
    int pgni=base/4096;
  8015a4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8015a8:	48 c1 e8 0c          	shr    rax,0xc
  8015ac:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  8015af:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8015b2:	8d 50 1f             	lea    edx,[rax+0x1f]
  8015b5:	85 c0                	test   eax,eax
  8015b7:	0f 48 c2             	cmovs  eax,edx
  8015ba:	c1 f8 05             	sar    eax,0x5
  8015bd:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  8015c0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8015c3:	99                   	cdq    
  8015c4:	c1 ea 1b             	shr    edx,0x1b
  8015c7:	01 d0                	add    eax,edx
  8015c9:	83 e0 1f             	and    eax,0x1f
  8015cc:	29 d0                	sub    eax,edx
  8015ce:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  8015d1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8015d8:	eb 2c                	jmp    801606 <req_page_at+0xb3>
    {
        page_map[i]|=(1<<pgj);
  8015da:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015dd:	48 98                	cdqe   
  8015df:	8b 14 85 20 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400020]
  8015e6:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8015e9:	be 01 00 00 00       	mov    esi,0x1
  8015ee:	89 c1                	mov    ecx,eax
  8015f0:	d3 e6                	shl    esi,cl
  8015f2:	89 f0                	mov    eax,esi
  8015f4:	09 c2                	or     edx,eax
  8015f6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015f9:	48 98                	cdqe   
  8015fb:	89 14 85 20 00 40 00 	mov    DWORD PTR [rax*4+0x400020],edx
    for(int i=0;i<pgn;i++)
  801602:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801606:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801609:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80160c:	7c cc                	jl     8015da <req_page_at+0x87>
    }
    return 0;
  80160e:	b8 00 00 00 00       	mov    eax,0x0

}
  801613:	c9                   	leave  
  801614:	c3                   	ret    

0000000000801615 <chk_vm>:
int chk_vm(int base, int pgn)
{
  801615:	f3 0f 1e fa          	endbr64 
  801619:	55                   	push   rbp
  80161a:	48 89 e5             	mov    rbp,rsp
  80161d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801620:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  801623:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80162a:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  80162b:	0f 20 d8             	mov    rax,cr3
  80162e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  801632:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801635:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  80163b:	85 c0                	test   eax,eax
  80163d:	0f 48 c2             	cmovs  eax,edx
  801640:	c1 f8 16             	sar    eax,0x16
  801643:	48 98                	cdqe   
  801645:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80164c:	00 
  80164d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801651:	48 01 d0             	add    rax,rdx
  801654:	8b 00                	mov    eax,DWORD PTR [rax]
  801656:	89 c0                	mov    eax,eax
  801658:	25 00 f0 ff ff       	and    eax,0xfffff000
  80165d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801661:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801664:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  80166a:	85 c0                	test   eax,eax
  80166c:	0f 48 c2             	cmovs  eax,edx
  80166f:	c1 f8 16             	sar    eax,0x16
  801672:	48 98                	cdqe   
  801674:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80167b:	00 
  80167c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801680:	48 01 d0             	add    rax,rdx
  801683:	8b 00                	mov    eax,DWORD PTR [rax]
  801685:	83 e0 01             	and    eax,0x1
  801688:	85 c0                	test   eax,eax
  80168a:	74 38                	je     8016c4 <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  80168c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80168f:	99                   	cdq    
  801690:	c1 ea 0a             	shr    edx,0xa
  801693:	01 d0                	add    eax,edx
  801695:	25 ff ff 3f 00       	and    eax,0x3fffff
  80169a:	29 d0                	sub    eax,edx
  80169c:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8016a2:	85 c0                	test   eax,eax
  8016a4:	0f 48 c2             	cmovs  eax,edx
  8016a7:	c1 f8 0c             	sar    eax,0xc
  8016aa:	48 98                	cdqe   
  8016ac:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8016b3:	00 
  8016b4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8016b8:	48 01 d0             	add    rax,rdx
  8016bb:	8b 00                	mov    eax,DWORD PTR [rax]
  8016bd:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  8016c0:	85 c0                	test   eax,eax
  8016c2:	75 07                	jne    8016cb <chk_vm+0xb6>
    {
        return -1;
  8016c4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8016c9:	eb 05                	jmp    8016d0 <chk_vm+0xbb>
    }
    return 0;
  8016cb:	b8 00 00 00 00       	mov    eax,0x0
}
  8016d0:	5d                   	pop    rbp
  8016d1:	c3                   	ret    

00000000008016d2 <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  8016d2:	f3 0f 1e fa          	endbr64 
  8016d6:	55                   	push   rbp
  8016d7:	48 89 e5             	mov    rbp,rsp
  8016da:	48 83 ec 18          	sub    rsp,0x18
  8016de:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8016e1:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  8016e4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8016e7:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8016ed:	85 c0                	test   eax,eax
  8016ef:	0f 48 c2             	cmovs  eax,edx
  8016f2:	c1 f8 0c             	sar    eax,0xc
  8016f5:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  8016f8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8016ff:	eb 1e                	jmp    80171f <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801701:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801704:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801707:	01 d0                	add    eax,edx
  801709:	89 c7                	mov    edi,eax
  80170b:	e8 e4 fc ff ff       	call   8013f4 <check_page>
  801710:	85 c0                	test   eax,eax
  801712:	74 07                	je     80171b <is_pgs_ava+0x49>
  801714:	b8 00 00 00 00       	mov    eax,0x0
  801719:	eb 11                	jmp    80172c <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  80171b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80171f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801722:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  801725:	7c da                	jl     801701 <is_pgs_ava+0x2f>
    }
    return 1;
  801727:	b8 01 00 00 00       	mov    eax,0x1

}
  80172c:	c9                   	leave  
  80172d:	c3                   	ret    

000000000080172e <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  80172e:	f3 0f 1e fa          	endbr64 
  801732:	55                   	push   rbp
  801733:	48 89 e5             	mov    rbp,rsp
  801736:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80173a:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  80173e:	c6 05 fb eb bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfebfb],0x43        # 400340 <vols>
    vols[0].name[1]='\0';
  801745:	c6 05 f5 eb bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfebf5],0x0        # 400341 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  80174c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801750:	48 89 05 f1 eb bf ff 	mov    QWORD PTR [rip+0xffffffffffbfebf1],rax        # 400348 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  801757:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80175b:	48 89 05 ee eb bf ff 	mov    QWORD PTR [rip+0xffffffffffbfebee],rax        # 400350 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  801762:	c7 05 f4 eb bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfebf4],0x1        # 400360 <vols+0x20>
  801769:	00 00 00 
    return 0;
  80176c:	b8 00 00 00 00       	mov    eax,0x0
}
  801771:	5d                   	pop    rbp
  801772:	c3                   	ret    

0000000000801773 <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  801773:	f3 0f 1e fa          	endbr64 
  801777:	55                   	push   rbp
  801778:	48 89 e5             	mov    rbp,rsp
  80177b:	48 83 ec 20          	sub    rsp,0x20
  80177f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  801782:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801789:	eb 38                	jmp    8017c3 <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  80178b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80178e:	48 98                	cdqe   
  801790:	48 c1 e0 04          	shl    rax,0x4
  801794:	48 05 6c 1f 40 00    	add    rax,0x401f6c
  80179a:	8b 00                	mov    eax,DWORD PTR [rax]
  80179c:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80179f:	75 1e                	jne    8017bf <sys_mkfifo+0x4c>
  8017a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017a4:	48 98                	cdqe   
  8017a6:	48 c1 e0 04          	shl    rax,0x4
  8017aa:	48 05 68 1f 40 00    	add    rax,0x401f68
  8017b0:	8b 00                	mov    eax,DWORD PTR [rax]
  8017b2:	83 f8 01             	cmp    eax,0x1
  8017b5:	75 08                	jne    8017bf <sys_mkfifo+0x4c>
            return i;
  8017b7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017ba:	e9 a6 00 00 00       	jmp    801865 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  8017bf:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8017c3:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  8017c7:	7e c2                	jle    80178b <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  8017c9:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8017d0:	e9 81 00 00 00       	jmp    801856 <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  8017d5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017d8:	48 98                	cdqe   
  8017da:	48 c1 e0 04          	shl    rax,0x4
  8017de:	48 05 68 1f 40 00    	add    rax,0x401f68
  8017e4:	8b 00                	mov    eax,DWORD PTR [rax]
  8017e6:	85 c0                	test   eax,eax
  8017e8:	75 68                	jne    801852 <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  8017ea:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017ed:	48 98                	cdqe   
  8017ef:	48 c1 e0 04          	shl    rax,0x4
  8017f3:	48 05 68 1f 40 00    	add    rax,0x401f68
  8017f9:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  8017ff:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801802:	48 98                	cdqe   
  801804:	48 c1 e0 04          	shl    rax,0x4
  801808:	48 8d 90 6c 1f 40 00 	lea    rdx,[rax+0x401f6c]
  80180f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801812:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801814:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801817:	48 98                	cdqe   
  801819:	48 c1 e0 04          	shl    rax,0x4
  80181d:	48 05 64 1f 40 00    	add    rax,0x401f64
  801823:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  801829:	b8 00 00 00 00       	mov    eax,0x0
  80182e:	e8 a5 fa ff ff       	call   8012d8 <req_a_page>
  801833:	89 c7                	mov    edi,eax
  801835:	e8 0b fc ff ff       	call   801445 <get_phyaddr>
  80183a:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80183d:	48 63 d2             	movsxd rdx,edx
  801840:	48 c1 e2 04          	shl    rdx,0x4
  801844:	48 81 c2 60 1f 40 00 	add    rdx,0x401f60
  80184b:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  80184d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801850:	eb 13                	jmp    801865 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801852:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801856:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  80185a:	0f 8e 75 ff ff ff    	jle    8017d5 <sys_mkfifo+0x62>
        }
    }
    return -1;
  801860:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801865:	c9                   	leave  
  801866:	c3                   	ret    

0000000000801867 <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801867:	f3 0f 1e fa          	endbr64 
  80186b:	55                   	push   rbp
  80186c:	48 89 e5             	mov    rbp,rsp
  80186f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801872:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801879:	eb 4a                	jmp    8018c5 <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  80187b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80187e:	48 98                	cdqe   
  801880:	48 c1 e0 04          	shl    rax,0x4
  801884:	48 05 6c 1f 40 00    	add    rax,0x401f6c
  80188a:	8b 00                	mov    eax,DWORD PTR [rax]
  80188c:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80188f:	75 30                	jne    8018c1 <sys_rmfifo+0x5a>
  801891:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801894:	48 98                	cdqe   
  801896:	48 c1 e0 04          	shl    rax,0x4
  80189a:	48 05 68 1f 40 00    	add    rax,0x401f68
  8018a0:	8b 00                	mov    eax,DWORD PTR [rax]
  8018a2:	83 f8 01             	cmp    eax,0x1
  8018a5:	75 1a                	jne    8018c1 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  8018a7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018aa:	48 98                	cdqe   
  8018ac:	48 c1 e0 04          	shl    rax,0x4
  8018b0:	48 05 68 1f 40 00    	add    rax,0x401f68
  8018b6:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  8018bc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018bf:	eb 0f                	jmp    8018d0 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  8018c1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8018c5:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  8018c9:	7e b0                	jle    80187b <sys_rmfifo+0x14>
        }
    }
    return -1;
  8018cb:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8018d0:	5d                   	pop    rbp
  8018d1:	c3                   	ret    

00000000008018d2 <free_vol>:
int free_vol(int voli)
{
  8018d2:	f3 0f 1e fa          	endbr64 
  8018d6:	55                   	push   rbp
  8018d7:	48 89 e5             	mov    rbp,rsp
  8018da:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  8018dd:	c7 05 79 ea bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfea79],0x0        # 400360 <vols+0x20>
  8018e4:	00 00 00 
    return 0;
  8018e7:	b8 00 00 00 00       	mov    eax,0x0
}
  8018ec:	5d                   	pop    rbp
  8018ed:	c3                   	ret    

00000000008018ee <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  8018ee:	f3 0f 1e fa          	endbr64 
  8018f2:	55                   	push   rbp
  8018f3:	48 89 e5             	mov    rbp,rsp
  8018f6:	48 83 ec 20          	sub    rsp,0x20
  8018fa:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8018fd:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801900:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801904:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80190b:	e9 d8 00 00 00       	jmp    8019e8 <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801910:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801913:	48 63 d0             	movsxd rdx,eax
  801916:	48 89 d0             	mov    rax,rdx
  801919:	48 c1 e0 02          	shl    rax,0x2
  80191d:	48 01 d0             	add    rax,rdx
  801920:	48 c1 e0 03          	shl    rax,0x3
  801924:	48 05 60 03 40 00    	add    rax,0x400360
  80192a:	8b 00                	mov    eax,DWORD PTR [rax]
  80192c:	85 c0                	test   eax,eax
  80192e:	0f 85 b0 00 00 00    	jne    8019e4 <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801934:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801937:	48 63 d0             	movsxd rdx,eax
  80193a:	48 89 d0             	mov    rax,rdx
  80193d:	48 c1 e0 02          	shl    rax,0x2
  801941:	48 01 d0             	add    rax,rdx
  801944:	48 c1 e0 03          	shl    rax,0x3
  801948:	48 05 60 03 40 00    	add    rax,0x400360
  80194e:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801954:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801957:	48 63 d0             	movsxd rdx,eax
  80195a:	48 89 d0             	mov    rax,rdx
  80195d:	48 01 c0             	add    rax,rax
  801960:	48 01 d0             	add    rax,rdx
  801963:	48 c1 e0 03          	shl    rax,0x3
  801967:	48 8d 88 80 24 40 00 	lea    rcx,[rax+0x402480]
  80196e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801971:	48 63 d0             	movsxd rdx,eax
  801974:	48 89 d0             	mov    rax,rdx
  801977:	48 c1 e0 02          	shl    rax,0x2
  80197b:	48 01 d0             	add    rax,rdx
  80197e:	48 c1 e0 03          	shl    rax,0x3
  801982:	48 05 58 03 40 00    	add    rax,0x400358
  801988:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  80198b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80198e:	89 c7                	mov    edi,eax
  801990:	e8 0b 1b 00 00       	call   8034a0 <get_drv>
  801995:	48 89 c2             	mov    rdx,rax
  801998:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80199b:	48 63 c8             	movsxd rcx,eax
  80199e:	48 89 c8             	mov    rax,rcx
  8019a1:	48 c1 e0 02          	shl    rax,0x2
  8019a5:	48 01 c8             	add    rax,rcx
  8019a8:	48 c1 e0 03          	shl    rax,0x3
  8019ac:	48 05 48 03 40 00    	add    rax,0x400348
  8019b2:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  8019b5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019b8:	48 63 d0             	movsxd rdx,eax
  8019bb:	48 89 d0             	mov    rax,rdx
  8019be:	48 c1 e0 02          	shl    rax,0x2
  8019c2:	48 01 d0             	add    rax,rdx
  8019c5:	48 c1 e0 03          	shl    rax,0x3
  8019c9:	48 8d 90 40 03 40 00 	lea    rdx,[rax+0x400340]
  8019d0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8019d4:	48 89 c6             	mov    rsi,rax
  8019d7:	48 89 d7             	mov    rdi,rdx
  8019da:	e8 65 7c 00 00       	call   809644 <strcpy>
            return i;
  8019df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019e2:	eb 13                	jmp    8019f7 <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  8019e4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8019e8:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  8019ec:	0f 8e 1e ff ff ff    	jle    801910 <reg_vol+0x22>
        }
    }
    return -1;
  8019f2:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8019f7:	c9                   	leave  
  8019f8:	c3                   	ret    

00000000008019f9 <sys_open>:
int sys_open(char *path, int mode)
{
  8019f9:	f3 0f 1e fa          	endbr64 
  8019fd:	55                   	push   rbp
  8019fe:	48 89 e5             	mov    rbp,rsp
  801a01:	53                   	push   rbx
  801a02:	48 81 ec 28 02 00 00 	sub    rsp,0x228
  801a09:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
  801a10:	89 b5 d4 fd ff ff    	mov    DWORD PTR [rbp-0x22c],esi
    {

    }
    //根据文件路径找到相应的卷
    char volname[26];
    int i=0,rec=0;
  801a16:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801a1d:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
    for(;path[i]!='/'&&i<26;i++)
  801a24:	eb 20                	jmp    801a46 <sys_open+0x4d>
        volname[i]=path[i];
  801a26:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a29:	48 63 d0             	movsxd rdx,eax
  801a2c:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801a33:	48 01 d0             	add    rax,rdx
  801a36:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  801a39:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a3c:	48 98                	cdqe   
  801a3e:	88 54 05 c0          	mov    BYTE PTR [rbp+rax*1-0x40],dl
    for(;path[i]!='/'&&i<26;i++)
  801a42:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801a46:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a49:	48 63 d0             	movsxd rdx,eax
  801a4c:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801a53:	48 01 d0             	add    rax,rdx
  801a56:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801a59:	3c 2f                	cmp    al,0x2f
  801a5b:	74 06                	je     801a63 <sys_open+0x6a>
  801a5d:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801a61:	7e c3                	jle    801a26 <sys_open+0x2d>
    volname[i]='\0';
  801a63:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a66:	48 98                	cdqe   
  801a68:	c6 44 05 c0 00       	mov    BYTE PTR [rbp+rax*1-0x40],0x0
    if(!path[i+1])
  801a6d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a70:	48 98                	cdqe   
  801a72:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801a76:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801a7d:	48 01 d0             	add    rax,rdx
  801a80:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801a83:	84 c0                	test   al,al
  801a85:	75 0a                	jne    801a91 <sys_open+0x98>
        return -2;//是根目录
  801a87:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  801a8c:	e9 2b 04 00 00       	jmp    801ebc <sys_open+0x4c3>
    rec=i;
  801a91:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a94:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(i=0;i<MAX_VOLUMES;i++)
  801a97:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801a9e:	eb 52                	jmp    801af2 <sys_open+0xf9>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801aa0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801aa3:	48 63 d0             	movsxd rdx,eax
  801aa6:	48 89 d0             	mov    rax,rdx
  801aa9:	48 c1 e0 02          	shl    rax,0x2
  801aad:	48 01 d0             	add    rax,rdx
  801ab0:	48 c1 e0 03          	shl    rax,0x3
  801ab4:	48 05 60 03 40 00    	add    rax,0x400360
  801aba:	8b 00                	mov    eax,DWORD PTR [rax]
  801abc:	85 c0                	test   eax,eax
  801abe:	74 2e                	je     801aee <sys_open+0xf5>
        (strcmp(vols[i].name,volname)==0))
  801ac0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ac3:	48 63 d0             	movsxd rdx,eax
  801ac6:	48 89 d0             	mov    rax,rdx
  801ac9:	48 c1 e0 02          	shl    rax,0x2
  801acd:	48 01 d0             	add    rax,rdx
  801ad0:	48 c1 e0 03          	shl    rax,0x3
  801ad4:	48 8d 90 40 03 40 00 	lea    rdx,[rax+0x400340]
  801adb:	48 8d 45 c0          	lea    rax,[rbp-0x40]
  801adf:	48 89 c6             	mov    rsi,rax
  801ae2:	48 89 d7             	mov    rdi,rdx
  801ae5:	e8 fa 7c 00 00       	call   8097e4 <strcmp>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801aea:	85 c0                	test   eax,eax
  801aec:	74 0c                	je     801afa <sys_open+0x101>
    for(i=0;i<MAX_VOLUMES;i++)
  801aee:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801af2:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801af6:	7e a8                	jle    801aa0 <sys_open+0xa7>
  801af8:	eb 01                	jmp    801afb <sys_open+0x102>
            break;
  801afa:	90                   	nop
    if(i==MAX_VOLUMES)return -1;
  801afb:	83 7d ec 1a          	cmp    DWORD PTR [rbp-0x14],0x1a
  801aff:	75 0a                	jne    801b0b <sys_open+0x112>
  801b01:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801b06:	e9 b1 03 00 00       	jmp    801ebc <sys_open+0x4c3>
    driver_args arg={
  801b0b:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  801b12:	b8 00 00 00 00       	mov    eax,0x0
  801b17:	b9 17 00 00 00       	mov    ecx,0x17
  801b1c:	48 89 d7             	mov    rdi,rdx
  801b1f:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  801b22:	48 89 fa             	mov    rdx,rdi
  801b25:	89 02                	mov    DWORD PTR [rdx],eax
  801b27:	48 83 c2 04          	add    rdx,0x4
            .path=path+rec+1
  801b2b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801b2e:	48 98                	cdqe   
  801b30:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801b34:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801b3b:	48 01 d0             	add    rax,rdx
    driver_args arg={
  801b3e:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    vfs_dir_entry dir;
    vfs_dir_entry res;
    int voln=i;
  801b45:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b48:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    if(vols[i].fs->find(path+rec+1,dir,&res)==-1)//找不到文件 ((driver*)vols[i].fs_drv)->find(&arg)==-1
  801b4b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b4e:	48 63 d0             	movsxd rdx,eax
  801b51:	48 89 d0             	mov    rax,rdx
  801b54:	48 c1 e0 02          	shl    rax,0x2
  801b58:	48 01 d0             	add    rax,rdx
  801b5b:	48 c1 e0 03          	shl    rax,0x3
  801b5f:	48 05 58 03 40 00    	add    rax,0x400358
  801b65:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801b68:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  801b6c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801b6f:	48 98                	cdqe   
  801b71:	48 8d 48 01          	lea    rcx,[rax+0x1]
  801b75:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801b7c:	48 01 c1             	add    rcx,rax
  801b7f:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
  801b86:	ff b5 f8 fe ff ff    	push   QWORD PTR [rbp-0x108]
  801b8c:	ff b5 f0 fe ff ff    	push   QWORD PTR [rbp-0x110]
  801b92:	ff b5 e8 fe ff ff    	push   QWORD PTR [rbp-0x118]
  801b98:	ff b5 e0 fe ff ff    	push   QWORD PTR [rbp-0x120]
  801b9e:	ff b5 d8 fe ff ff    	push   QWORD PTR [rbp-0x128]
  801ba4:	ff b5 d0 fe ff ff    	push   QWORD PTR [rbp-0x130]
  801baa:	ff b5 c8 fe ff ff    	push   QWORD PTR [rbp-0x138]
  801bb0:	ff b5 c0 fe ff ff    	push   QWORD PTR [rbp-0x140]
  801bb6:	ff b5 b8 fe ff ff    	push   QWORD PTR [rbp-0x148]
  801bbc:	ff b5 b0 fe ff ff    	push   QWORD PTR [rbp-0x150]
  801bc2:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
  801bc8:	ff b5 a0 fe ff ff    	push   QWORD PTR [rbp-0x160]
  801bce:	48 89 c6             	mov    rsi,rax
  801bd1:	48 89 cf             	mov    rdi,rcx
  801bd4:	ff d2                	call   rdx
  801bd6:	48 83 c4 60          	add    rsp,0x60
  801bda:	83 f8 ff             	cmp    eax,0xffffffff
  801bdd:	75 49                	jne    801c28 <sys_open+0x22f>
    {
        if(mode&FILE_MODE_WRITE) {
  801bdf:	8b 85 d4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x22c]
  801be5:	83 e0 02             	and    eax,0x2
  801be8:	85 c0                	test   eax,eax
  801bea:	74 32                	je     801c1e <sys_open+0x225>
            return ((driver *) vols[i].fs_drv)->touch(&arg);//这里之后要改
  801bec:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801bef:	48 63 d0             	movsxd rdx,eax
  801bf2:	48 89 d0             	mov    rax,rdx
  801bf5:	48 c1 e0 02          	shl    rax,0x2
  801bf9:	48 01 d0             	add    rax,rdx
  801bfc:	48 c1 e0 03          	shl    rax,0x3
  801c00:	48 05 50 03 40 00    	add    rax,0x400350
  801c06:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801c09:	48 8b 50 4c          	mov    rdx,QWORD PTR [rax+0x4c]
  801c0d:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  801c14:	48 89 c7             	mov    rdi,rax
  801c17:	ff d2                	call   rdx
  801c19:	e9 9e 02 00 00       	jmp    801ebc <sys_open+0x4c3>
        }else
            return -1;
  801c1e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801c23:	e9 94 02 00 00       	jmp    801ebc <sys_open+0x4c3>
    }
    vfs_dir_entry entry=res;//=arg.entry;
  801c28:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
  801c2f:	48 8b 95 48 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b8]
  801c36:	48 89 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rax
  801c3d:	48 89 95 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdx
  801c44:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
  801c4b:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
  801c52:	48 89 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],rax
  801c59:	48 89 95 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],rdx
  801c60:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
  801c67:	48 8b 95 68 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x198]
  801c6e:	48 89 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],rax
  801c75:	48 89 95 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],rdx
  801c7c:	48 8b 85 70 fe ff ff 	mov    rax,QWORD PTR [rbp-0x190]
  801c83:	48 8b 95 78 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x188]
  801c8a:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
  801c91:	48 89 95 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdx
  801c98:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
  801c9f:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
  801ca6:	48 89 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rax
  801cad:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
  801cb4:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
  801cbb:	48 8b 95 98 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x168]
  801cc2:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
  801cc9:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
    int j=-1;
  801cd0:	c7 45 e8 ff ff ff ff 	mov    DWORD PTR [rbp-0x18],0xffffffff
    for(i=0;i<MAX_OPEN_FILES;i++)
  801cd7:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801cde:	eb 5c                	jmp    801d3c <sys_open+0x343>
    {
        if(opened[i].voln==voln&&opened[i].id==entry.id)
  801ce0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ce3:	48 63 d0             	movsxd rdx,eax
  801ce6:	48 89 d0             	mov    rax,rdx
  801ce9:	48 01 c0             	add    rax,rax
  801cec:	48 01 d0             	add    rax,rdx
  801cef:	48 c1 e0 05          	shl    rax,0x5
  801cf3:	48 05 68 07 40 00    	add    rax,0x400768
  801cf9:	8b 00                	mov    eax,DWORD PTR [rax]
  801cfb:	39 45 e0             	cmp    DWORD PTR [rbp-0x20],eax
  801cfe:	75 38                	jne    801d38 <sys_open+0x33f>
  801d00:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d03:	48 63 d0             	movsxd rdx,eax
  801d06:	48 89 d0             	mov    rax,rdx
  801d09:	48 01 c0             	add    rax,rax
  801d0c:	48 01 d0             	add    rax,rdx
  801d0f:	48 c1 e0 05          	shl    rax,0x5
  801d13:	48 05 74 07 40 00    	add    rax,0x400774
  801d19:	8b 10                	mov    edx,DWORD PTR [rax]
  801d1b:	8b 85 f4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x20c]
  801d21:	39 c2                	cmp    edx,eax
  801d23:	75 13                	jne    801d38 <sys_open+0x33f>
        {
            if(mode==FILE_MODE_WRITE)
  801d25:	83 bd d4 fd ff ff 02 	cmp    DWORD PTR [rbp-0x22c],0x2
  801d2c:	75 0a                	jne    801d38 <sys_open+0x33f>
            {
                return -1;//读模式会重新给一个fno但是指向同一个文件
  801d2e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801d33:	e9 84 01 00 00       	jmp    801ebc <sys_open+0x4c3>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801d38:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801d3c:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801d40:	7e 9e                	jle    801ce0 <sys_open+0x2e7>
            }
        }
    }
    for(i=0;i<MAX_OPEN_FILES;i++)
  801d42:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801d49:	eb 2b                	jmp    801d76 <sys_open+0x37d>
    {
        if(!opened[i].mode) {
  801d4b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d4e:	48 63 d0             	movsxd rdx,eax
  801d51:	48 89 d0             	mov    rax,rdx
  801d54:	48 01 c0             	add    rax,rax
  801d57:	48 01 d0             	add    rax,rdx
  801d5a:	48 c1 e0 05          	shl    rax,0x5
  801d5e:	48 05 64 07 40 00    	add    rax,0x400764
  801d64:	8b 00                	mov    eax,DWORD PTR [rax]
  801d66:	85 c0                	test   eax,eax
  801d68:	75 08                	jne    801d72 <sys_open+0x379>
            j = i;
  801d6a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d6d:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            break;
  801d70:	eb 0a                	jmp    801d7c <sys_open+0x383>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801d72:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801d76:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801d7a:	7e cf                	jle    801d4b <sys_open+0x352>
        }
    }
    if(j==-1)return -1;
  801d7c:	83 7d e8 ff          	cmp    DWORD PTR [rbp-0x18],0xffffffff
  801d80:	75 0a                	jne    801d8c <sys_open+0x393>
  801d82:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801d87:	e9 30 01 00 00       	jmp    801ebc <sys_open+0x4c3>
    opened[j]=entry;
  801d8c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801d8f:	48 63 d0             	movsxd rdx,eax
  801d92:	48 89 d0             	mov    rax,rdx
  801d95:	48 01 c0             	add    rax,rax
  801d98:	48 01 d0             	add    rax,rdx
  801d9b:	48 c1 e0 05          	shl    rax,0x5
  801d9f:	48 05 60 07 40 00    	add    rax,0x400760
  801da5:	48 8b 8d e0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x220]
  801dac:	48 8b 9d e8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x218]
  801db3:	48 89 08             	mov    QWORD PTR [rax],rcx
  801db6:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
  801dba:	48 8b 8d f0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x210]
  801dc1:	48 8b 9d f8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x208]
  801dc8:	48 89 48 10          	mov    QWORD PTR [rax+0x10],rcx
  801dcc:	48 89 58 18          	mov    QWORD PTR [rax+0x18],rbx
  801dd0:	48 8b 8d 00 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x200]
  801dd7:	48 8b 9d 08 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1f8]
  801dde:	48 89 48 20          	mov    QWORD PTR [rax+0x20],rcx
  801de2:	48 89 58 28          	mov    QWORD PTR [rax+0x28],rbx
  801de6:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
  801ded:	48 8b 9d 18 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1e8]
  801df4:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
  801df8:	48 89 58 38          	mov    QWORD PTR [rax+0x38],rbx
  801dfc:	48 8b 8d 20 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e0]
  801e03:	48 8b 9d 28 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1d8]
  801e0a:	48 89 48 40          	mov    QWORD PTR [rax+0x40],rcx
  801e0e:	48 89 58 48          	mov    QWORD PTR [rax+0x48],rbx
  801e12:	48 8b 8d 30 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1d0]
  801e19:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
  801e20:	48 89 48 50          	mov    QWORD PTR [rax+0x50],rcx
  801e24:	48 89 58 58          	mov    QWORD PTR [rax+0x58],rbx
    opened[j].fno=i;
  801e28:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801e2b:	48 63 d0             	movsxd rdx,eax
  801e2e:	48 89 d0             	mov    rax,rdx
  801e31:	48 01 c0             	add    rax,rax
  801e34:	48 01 d0             	add    rax,rdx
  801e37:	48 c1 e0 05          	shl    rax,0x5
  801e3b:	48 8d 90 60 07 40 00 	lea    rdx,[rax+0x400760]
  801e42:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801e45:	89 02                	mov    DWORD PTR [rdx],eax
    opened[j].link_c++;
  801e47:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801e4a:	48 63 d0             	movsxd rdx,eax
  801e4d:	48 89 d0             	mov    rax,rdx
  801e50:	48 01 c0             	add    rax,rax
  801e53:	48 01 d0             	add    rax,rdx
  801e56:	48 c1 e0 05          	shl    rax,0x5
  801e5a:	48 05 6c 07 40 00    	add    rax,0x40076c
  801e60:	8b 00                	mov    eax,DWORD PTR [rax]
  801e62:	8d 48 01             	lea    ecx,[rax+0x1]
  801e65:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801e68:	48 63 d0             	movsxd rdx,eax
  801e6b:	48 89 d0             	mov    rax,rdx
  801e6e:	48 01 c0             	add    rax,rax
  801e71:	48 01 d0             	add    rax,rdx
  801e74:	48 c1 e0 05          	shl    rax,0x5
  801e78:	48 05 6c 07 40 00    	add    rax,0x40076c
  801e7e:	89 08                	mov    DWORD PTR [rax],ecx
    add_proc_openf(&opened[j]);
  801e80:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801e83:	48 63 d0             	movsxd rdx,eax
  801e86:	48 89 d0             	mov    rax,rdx
  801e89:	48 01 c0             	add    rax,rax
  801e8c:	48 01 d0             	add    rax,rdx
  801e8f:	48 c1 e0 05          	shl    rax,0x5
  801e93:	48 05 60 07 40 00    	add    rax,0x400760
  801e99:	48 89 c7             	mov    rdi,rax
  801e9c:	e8 17 26 00 00       	call   8044b8 <add_proc_openf>
    return opened[j].fno;
  801ea1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801ea4:	48 63 d0             	movsxd rdx,eax
  801ea7:	48 89 d0             	mov    rax,rdx
  801eaa:	48 01 c0             	add    rax,rax
  801ead:	48 01 d0             	add    rax,rdx
  801eb0:	48 c1 e0 05          	shl    rax,0x5
  801eb4:	48 05 60 07 40 00    	add    rax,0x400760
  801eba:	8b 00                	mov    eax,DWORD PTR [rax]
}
  801ebc:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  801ec0:	c9                   	leave  
  801ec1:	c3                   	ret    

0000000000801ec2 <sys_close>:
int sys_close(int fno)
{
  801ec2:	f3 0f 1e fa          	endbr64 
  801ec6:	55                   	push   rbp
  801ec7:	48 89 e5             	mov    rbp,rsp
  801eca:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801ecd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801ed4:	eb 64                	jmp    801f3a <sys_close+0x78>
    {
        if(opened[i].fno==fno)
  801ed6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ed9:	48 63 d0             	movsxd rdx,eax
  801edc:	48 89 d0             	mov    rax,rdx
  801edf:	48 01 c0             	add    rax,rax
  801ee2:	48 01 d0             	add    rax,rdx
  801ee5:	48 c1 e0 05          	shl    rax,0x5
  801ee9:	48 05 60 07 40 00    	add    rax,0x400760
  801eef:	8b 00                	mov    eax,DWORD PTR [rax]
  801ef1:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801ef4:	75 40                	jne    801f36 <sys_close+0x74>
        {
            opened[i].link_c--;
  801ef6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ef9:	48 63 d0             	movsxd rdx,eax
  801efc:	48 89 d0             	mov    rax,rdx
  801eff:	48 01 c0             	add    rax,rax
  801f02:	48 01 d0             	add    rax,rdx
  801f05:	48 c1 e0 05          	shl    rax,0x5
  801f09:	48 05 6c 07 40 00    	add    rax,0x40076c
  801f0f:	8b 00                	mov    eax,DWORD PTR [rax]
  801f11:	8d 48 ff             	lea    ecx,[rax-0x1]
  801f14:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801f17:	48 63 d0             	movsxd rdx,eax
  801f1a:	48 89 d0             	mov    rax,rdx
  801f1d:	48 01 c0             	add    rax,rax
  801f20:	48 01 d0             	add    rax,rdx
  801f23:	48 c1 e0 05          	shl    rax,0x5
  801f27:	48 05 6c 07 40 00    	add    rax,0x40076c
  801f2d:	89 08                	mov    DWORD PTR [rax],ecx
            return 0;
  801f2f:	b8 00 00 00 00       	mov    eax,0x0
  801f34:	eb 0f                	jmp    801f45 <sys_close+0x83>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  801f36:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801f3a:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801f3e:	7e 96                	jle    801ed6 <sys_close+0x14>
        }
    }
    return -1;
  801f40:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801f45:	5d                   	pop    rbp
  801f46:	c3                   	ret    

0000000000801f47 <sys_write>:
int sys_write(int fno, char *src, int len)
{
  801f47:	f3 0f 1e fa          	endbr64 
  801f4b:	55                   	push   rbp
  801f4c:	48 89 e5             	mov    rbp,rsp
  801f4f:	48 83 ec 20          	sub    rsp,0x20
  801f53:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801f56:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  801f5a:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  801f5d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f60:	89 c7                	mov    edi,eax
  801f62:	e8 7d 01 00 00       	call   8020e4 <get_vfs_entry>
  801f67:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  801f6b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  801f70:	75 07                	jne    801f79 <sys_write+0x32>
  801f72:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801f77:	eb 5d                	jmp    801fd6 <sys_write+0x8f>
    if(f->type==FTYPE_REG)
  801f79:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f7d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  801f80:	85 c0                	test   eax,eax
  801f82:	75 18                	jne    801f9c <sys_write+0x55>
    {
        return vfs_write_file(f,src,len);
  801f84:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  801f87:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  801f8b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801f8f:	48 89 ce             	mov    rsi,rcx
  801f92:	48 89 c7             	mov    rdi,rax
  801f95:	e8 67 03 00 00       	call   802301 <vfs_write_file>
  801f9a:	eb 3a                	jmp    801fd6 <sys_write+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  801f9c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fa0:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  801fa3:	83 f8 01             	cmp    eax,0x1
  801fa6:	75 29                	jne    801fd1 <sys_write+0x8a>
    {
        int block=get_according_bnr(f);
  801fa8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fac:	48 89 c7             	mov    rdi,rax
  801faf:	e8 5b 04 00 00       	call   80240f <get_according_bnr>
  801fb4:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return write_block(f->dev,block,src,len);
  801fb7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801fbb:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  801fbe:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  801fc1:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  801fc5:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  801fc8:	89 c7                	mov    edi,eax
  801fca:	e8 24 08 00 00       	call   8027f3 <write_block>
  801fcf:	eb 05                	jmp    801fd6 <sys_write+0x8f>
    }
    return -1;
  801fd1:	b8 ff ff ff ff       	mov    eax,0xffffffff
            .src_addr=src,
            .len=len,
            .pos=pos
    };
    return ((driver*)vols[f->voln].fs_drv)->write(&args); */
}
  801fd6:	c9                   	leave  
  801fd7:	c3                   	ret    

0000000000801fd8 <sys_read>:
int sys_read(int fno, char *dist,  int len)
{
  801fd8:	f3 0f 1e fa          	endbr64 
  801fdc:	55                   	push   rbp
  801fdd:	48 89 e5             	mov    rbp,rsp
  801fe0:	48 83 ec 20          	sub    rsp,0x20
  801fe4:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801fe7:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  801feb:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  801fee:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ff1:	89 c7                	mov    edi,eax
  801ff3:	e8 ec 00 00 00       	call   8020e4 <get_vfs_entry>
  801ff8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  801ffc:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802001:	75 07                	jne    80200a <sys_read+0x32>
  802003:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802008:	eb 5d                	jmp    802067 <sys_read+0x8f>
    if(f->type==FTYPE_REG)
  80200a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80200e:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802011:	85 c0                	test   eax,eax
  802013:	75 18                	jne    80202d <sys_read+0x55>
    {
        return vfs_read_file(f,dist,len);
  802015:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802018:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  80201c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802020:	48 89 ce             	mov    rsi,rcx
  802023:	48 89 c7             	mov    rdi,rax
  802026:	e8 37 02 00 00       	call   802262 <vfs_read_file>
  80202b:	eb 3a                	jmp    802067 <sys_read+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  80202d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802031:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802034:	83 f8 01             	cmp    eax,0x1
  802037:	75 29                	jne    802062 <sys_read+0x8a>
    {
        int block=get_according_bnr(f);
  802039:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80203d:	48 89 c7             	mov    rdi,rax
  802040:	e8 ca 03 00 00       	call   80240f <get_according_bnr>
  802045:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return read_block(f->dev,block,dist,len);
  802048:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80204c:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  80204f:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  802052:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802056:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  802059:	89 c7                	mov    edi,eax
  80205b:	e8 10 08 00 00       	call   802870 <read_block>
  802060:	eb 05                	jmp    802067 <sys_read+0x8f>
    }
    return -1;
  802062:	b8 ff ff ff ff       	mov    eax,0xffffffff
    //         .len=len,
    //         .pos=pos,
    //         .entry=*f
    // };
    // return ((driver*)vols[f->voln].fs_drv)->read(&args);
}
  802067:	c9                   	leave  
  802068:	c3                   	ret    

0000000000802069 <sys_seek>:
int sys_seek(int fno, int offset, int origin)
{
  802069:	f3 0f 1e fa          	endbr64 
  80206d:	55                   	push   rbp
  80206e:	48 89 e5             	mov    rbp,rsp
  802071:	48 83 ec 20          	sub    rsp,0x20
  802075:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802078:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80207b:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  80207e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802081:	89 c7                	mov    edi,eax
  802083:	e8 5c 00 00 00       	call   8020e4 <get_vfs_entry>
  802088:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  80208c:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802091:	75 07                	jne    80209a <sys_seek+0x31>
  802093:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802098:	eb 14                	jmp    8020ae <sys_seek+0x45>
    f->ptr=offset+origin;
  80209a:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80209d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8020a0:	01 c2                	add    edx,eax
  8020a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020a6:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
    return 0;
  8020a9:	b8 00 00 00 00       	mov    eax,0x0
}
  8020ae:	c9                   	leave  
  8020af:	c3                   	ret    

00000000008020b0 <sys_tell>:
int sys_tell(int fno)
{
  8020b0:	f3 0f 1e fa          	endbr64 
  8020b4:	55                   	push   rbp
  8020b5:	48 89 e5             	mov    rbp,rsp
  8020b8:	48 83 ec 20          	sub    rsp,0x20
  8020bc:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    vfs_dir_entry *f= get_vfs_entry(fno);
  8020bf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8020c2:	89 c7                	mov    edi,eax
  8020c4:	e8 1b 00 00 00       	call   8020e4 <get_vfs_entry>
  8020c9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  8020cd:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8020d2:	75 07                	jne    8020db <sys_tell+0x2b>
  8020d4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8020d9:	eb 07                	jmp    8020e2 <sys_tell+0x32>
    return f->ptr;
  8020db:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020df:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  8020e2:	c9                   	leave  
  8020e3:	c3                   	ret    

00000000008020e4 <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  8020e4:	f3 0f 1e fa          	endbr64 
  8020e8:	55                   	push   rbp
  8020e9:	48 89 e5             	mov    rbp,rsp
  8020ec:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  8020ef:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8020f6:	eb 3f                	jmp    802137 <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  8020f8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020fb:	48 63 d0             	movsxd rdx,eax
  8020fe:	48 89 d0             	mov    rax,rdx
  802101:	48 01 c0             	add    rax,rax
  802104:	48 01 d0             	add    rax,rdx
  802107:	48 c1 e0 05          	shl    rax,0x5
  80210b:	48 05 60 07 40 00    	add    rax,0x400760
  802111:	8b 00                	mov    eax,DWORD PTR [rax]
  802113:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802116:	75 1b                	jne    802133 <get_vfs_entry+0x4f>
        {
            return &opened[i];
  802118:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80211b:	48 63 d0             	movsxd rdx,eax
  80211e:	48 89 d0             	mov    rax,rdx
  802121:	48 01 c0             	add    rax,rax
  802124:	48 01 d0             	add    rax,rdx
  802127:	48 c1 e0 05          	shl    rax,0x5
  80212b:	48 05 60 07 40 00    	add    rax,0x400760
  802131:	eb 0f                	jmp    802142 <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802133:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802137:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80213b:	7e bb                	jle    8020f8 <get_vfs_entry+0x14>
        }
    }
    return NULL;
  80213d:	b8 00 00 00 00       	mov    eax,0x0
}
  802142:	5d                   	pop    rbp
  802143:	c3                   	ret    

0000000000802144 <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  802144:	f3 0f 1e fa          	endbr64 
  802148:	55                   	push   rbp
  802149:	48 89 e5             	mov    rbp,rsp
  80214c:	48 83 ec 10          	sub    rsp,0x10
  802150:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  802154:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802158:	48 89 c7             	mov    rdi,rax
  80215b:	e8 a0 04 00 00       	call   802600 <wait_on_buf>
    if(bh->b_count==0)return -1;
  802160:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802164:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  802168:	84 c0                	test   al,al
  80216a:	75 07                	jne    802173 <brelse+0x2f>
  80216c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802171:	eb 32                	jmp    8021a5 <brelse+0x61>
    bh->b_count--;
  802173:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802177:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  80217b:	8d 50 ff             	lea    edx,[rax-0x1]
  80217e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802182:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  802185:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802189:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  80218d:	84 c0                	test   al,al
  80218f:	75 0f                	jne    8021a0 <brelse+0x5c>
        vmfree(bh->b_data);
  802191:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802195:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802198:	48 89 c7             	mov    rdi,rax
  80219b:	e8 5c ef ff ff       	call   8010fc <vmfree>
    return 0;
  8021a0:	b8 00 00 00 00       	mov    eax,0x0
}
  8021a5:	c9                   	leave  
  8021a6:	c3                   	ret    

00000000008021a7 <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  8021a7:	f3 0f 1e fa          	endbr64 
  8021ab:	55                   	push   rbp
  8021ac:	48 89 e5             	mov    rbp,rsp
  8021af:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  8021b6:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  8021bc:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  8021c2:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  8021c8:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  8021ce:	89 d6                	mov    esi,edx
  8021d0:	89 c7                	mov    edi,eax
  8021d2:	e8 78 02 00 00       	call   80244f <get_buf>
  8021d7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  8021db:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8021e0:	75 09                	jne    8021eb <bread+0x44>
  8021e2:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  8021e9:	eb 75                	jmp    802260 <bread+0xb9>
    if(!bh->b_uptodate)
  8021eb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021ef:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  8021f3:	84 c0                	test   al,al
  8021f5:	75 65                	jne    80225c <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  8021f7:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  8021fd:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  802200:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  802207:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80220b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80220e:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  802214:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  80221b:	02 00 00 
        arg.lba=bh->b_blocknr;
  80221e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802222:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  802226:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  80222c:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  802233:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  802236:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  80223d:	48 89 c7             	mov    rdi,rax
  802240:	e8 82 12 00 00       	call   8034c7 <make_request>
  802245:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  802248:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80224b:	89 c7                	mov    edi,eax
  80224d:	e8 88 15 00 00       	call   8037da <wait_on_req>
        clear_req(reqi);
  802252:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802255:	89 c7                	mov    edi,eax
  802257:	e8 ae 15 00 00       	call   80380a <clear_req>
    }
    return bh;
  80225c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  802260:	c9                   	leave  
  802261:	c3                   	ret    

0000000000802262 <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  802262:	f3 0f 1e fa          	endbr64 
  802266:	55                   	push   rbp
  802267:	48 89 e5             	mov    rbp,rsp
  80226a:	48 83 ec 40          	sub    rsp,0x40
  80226e:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802272:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  802276:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  802279:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80227d:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802280:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802283:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802287:	48 89 c7             	mov    rdi,rax
  80228a:	e8 80 01 00 00       	call   80240f <get_according_bnr>
  80228f:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  802292:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  802295:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802298:	89 d6                	mov    esi,edx
  80229a:	89 c7                	mov    edi,eax
  80229c:	e8 06 ff ff ff       	call   8021a7 <bread>
  8022a1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8022a5:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8022a8:	ba 00 02 00 00       	mov    edx,0x200
  8022ad:	39 d0                	cmp    eax,edx
  8022af:	0f 4f c2             	cmovg  eax,edx
  8022b2:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  8022b5:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8022b8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8022bc:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8022bf:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8022c3:	48 89 ce             	mov    rsi,rcx
  8022c6:	48 89 c7             	mov    rdi,rax
  8022c9:	e8 78 72 00 00       	call   809546 <memcpy>
        len-=BLOCK_SIZE;
  8022ce:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  8022d5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8022d9:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8022dc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8022df:	01 c2                	add    edx,eax
  8022e1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8022e5:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  8022e8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8022ec:	48 89 c7             	mov    rdi,rax
  8022ef:	e8 50 fe ff ff       	call   802144 <brelse>
    }while(len>0);
  8022f4:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  8022f8:	7f 89                	jg     802283 <vfs_read_file+0x21>
    return 0;
  8022fa:	b8 00 00 00 00       	mov    eax,0x0
}
  8022ff:	c9                   	leave  
  802300:	c3                   	ret    

0000000000802301 <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  802301:	f3 0f 1e fa          	endbr64 
  802305:	55                   	push   rbp
  802306:	48 89 e5             	mov    rbp,rsp
  802309:	48 83 ec 40          	sub    rsp,0x40
  80230d:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802311:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  802315:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  802318:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80231c:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  80231f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802322:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802326:	48 89 c7             	mov    rdi,rax
  802329:	e8 e1 00 00 00       	call   80240f <get_according_bnr>
  80232e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  802331:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  802334:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802337:	89 d6                	mov    esi,edx
  802339:	89 c7                	mov    edi,eax
  80233b:	e8 0f 01 00 00       	call   80244f <get_buf>
  802340:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802344:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802347:	ba 00 02 00 00       	mov    edx,0x200
  80234c:	39 d0                	cmp    eax,edx
  80234e:	0f 4f c2             	cmovg  eax,edx
  802351:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  802354:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  802357:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80235b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80235e:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802362:	48 89 ce             	mov    rsi,rcx
  802365:	48 89 c7             	mov    rdi,rax
  802368:	e8 d9 71 00 00       	call   809546 <memcpy>
        len-=BLOCK_SIZE;
  80236d:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  802374:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802378:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80237b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80237e:	01 c2                	add    edx,eax
  802380:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802384:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  802387:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80238b:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  80238f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802393:	48 89 c7             	mov    rdi,rax
  802396:	e8 a9 fd ff ff       	call   802144 <brelse>
    }while(len>0);
  80239b:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  80239f:	7f 81                	jg     802322 <vfs_write_file+0x21>
    return 0;
  8023a1:	b8 00 00 00 00       	mov    eax,0x0
}
  8023a6:	c9                   	leave  
  8023a7:	c3                   	ret    

00000000008023a8 <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  8023a8:	f3 0f 1e fa          	endbr64 
  8023ac:	55                   	push   rbp
  8023ad:	48 89 e5             	mov    rbp,rsp
  8023b0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8023b4:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  8023b7:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  8023ba:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8023be:	74 20                	je     8023e0 <vfs_seek_file+0x38>
  8023c0:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8023c4:	7f 3f                	jg     802405 <vfs_seek_file+0x5d>
  8023c6:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  8023ca:	74 08                	je     8023d4 <vfs_seek_file+0x2c>
  8023cc:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  8023d0:	74 23                	je     8023f5 <vfs_seek_file+0x4d>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  8023d2:	eb 31                	jmp    802405 <vfs_seek_file+0x5d>
        f->ptr=offset;
  8023d4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023d8:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8023db:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8023de:	eb 26                	jmp    802406 <vfs_seek_file+0x5e>
        f->ptr+=offset;
  8023e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023e4:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8023e7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8023ea:	01 c2                	add    edx,eax
  8023ec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023f0:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8023f3:	eb 11                	jmp    802406 <vfs_seek_file+0x5e>
        f->ptr=f->size;
  8023f5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023f9:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  8023fc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802400:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802403:	eb 01                	jmp    802406 <vfs_seek_file+0x5e>
        break;
  802405:	90                   	nop
    }
    return f->ptr;
  802406:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80240a:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  80240d:	5d                   	pop    rbp
  80240e:	c3                   	ret    

000000000080240f <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  80240f:	f3 0f 1e fa          	endbr64 
  802413:	55                   	push   rbp
  802414:	48 89 e5             	mov    rbp,rsp
  802417:	48 83 ec 10          	sub    rsp,0x10
  80241b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  80241f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802423:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802426:	48 63 d0             	movsxd rdx,eax
  802429:	48 89 d0             	mov    rax,rdx
  80242c:	48 c1 e0 02          	shl    rax,0x2
  802430:	48 01 d0             	add    rax,rdx
  802433:	48 c1 e0 03          	shl    rax,0x3
  802437:	48 05 58 03 40 00    	add    rax,0x400358
  80243d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802440:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802444:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802448:	48 89 c7             	mov    rdi,rax
  80244b:	ff d2                	call   rdx

}
  80244d:	c9                   	leave  
  80244e:	c3                   	ret    

000000000080244f <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  80244f:	f3 0f 1e fa          	endbr64 
  802453:	55                   	push   rbp
  802454:	48 89 e5             	mov    rbp,rsp
  802457:	48 83 ec 20          	sub    rsp,0x20
  80245b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80245e:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802461:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802468:	e9 b9 00 00 00       	jmp    802526 <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  80246d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802470:	48 98                	cdqe   
  802472:	48 c1 e0 06          	shl    rax,0x6
  802476:	48 05 90 27 40 00    	add    rax,0x402790
  80247c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80247f:	0f b7 c0             	movzx  eax,ax
  802482:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802485:	0f 85 97 00 00 00    	jne    802522 <get_buf+0xd3>
  80248b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80248e:	48 98                	cdqe   
  802490:	48 c1 e0 06          	shl    rax,0x6
  802494:	48 05 88 27 40 00    	add    rax,0x402788
  80249a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80249d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8024a0:	48 98                	cdqe   
  8024a2:	48 39 c2             	cmp    rdx,rax
  8024a5:	75 7b                	jne    802522 <get_buf+0xd3>
        {
            repeat:
  8024a7:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  8024a8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8024ab:	48 98                	cdqe   
  8024ad:	48 c1 e0 06          	shl    rax,0x6
  8024b1:	48 05 80 27 40 00    	add    rax,0x402780
  8024b7:	48 89 c7             	mov    rdi,rax
  8024ba:	e8 41 01 00 00       	call   802600 <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  8024bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8024c2:	48 98                	cdqe   
  8024c4:	48 c1 e0 06          	shl    rax,0x6
  8024c8:	48 05 94 27 40 00    	add    rax,0x402794
  8024ce:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8024d1:	84 c0                	test   al,al
  8024d3:	74 02                	je     8024d7 <get_buf+0x88>
                goto repeat;
  8024d5:	eb d1                	jmp    8024a8 <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  8024d7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8024da:	48 98                	cdqe   
  8024dc:	48 c1 e0 06          	shl    rax,0x6
  8024e0:	48 05 90 27 40 00    	add    rax,0x402790
  8024e6:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8024e9:	0f b7 c0             	movzx  eax,ax
  8024ec:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8024ef:	75 30                	jne    802521 <get_buf+0xd2>
  8024f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8024f4:	48 98                	cdqe   
  8024f6:	48 c1 e0 06          	shl    rax,0x6
  8024fa:	48 05 88 27 40 00    	add    rax,0x402788
  802500:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802503:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802506:	48 98                	cdqe   
  802508:	48 39 c2             	cmp    rdx,rax
  80250b:	75 14                	jne    802521 <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  80250d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802510:	48 98                	cdqe   
  802512:	48 c1 e0 06          	shl    rax,0x6
  802516:	48 05 80 27 40 00    	add    rax,0x402780
  80251c:	e9 dd 00 00 00       	jmp    8025fe <get_buf+0x1af>
                continue;
  802521:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802522:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802526:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  80252a:	0f 8e 3d ff ff ff    	jle    80246d <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802530:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  802537:	e9 b8 00 00 00       	jmp    8025f4 <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  80253c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80253f:	48 98                	cdqe   
  802541:	48 c1 e0 06          	shl    rax,0x6
  802545:	48 05 94 27 40 00    	add    rax,0x402794
  80254b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80254e:	84 c0                	test   al,al
  802550:	0f 85 9a 00 00 00    	jne    8025f0 <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  802556:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802559:	48 98                	cdqe   
  80255b:	48 c1 e0 06          	shl    rax,0x6
  80255f:	48 05 93 27 40 00    	add    rax,0x402793
  802565:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802568:	84 c0                	test   al,al
  80256a:	74 2e                	je     80259a <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  80256c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80256f:	48 98                	cdqe   
  802571:	48 c1 e0 06          	shl    rax,0x6
  802575:	48 05 80 27 40 00    	add    rax,0x402780
  80257b:	48 89 c7             	mov    rdi,rax
  80257e:	e8 2c 02 00 00       	call   8027af <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  802583:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802586:	48 98                	cdqe   
  802588:	48 c1 e0 06          	shl    rax,0x6
  80258c:	48 05 80 27 40 00    	add    rax,0x402780
  802592:	48 89 c7             	mov    rdi,rax
  802595:	e8 66 00 00 00       	call   802600 <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  80259a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80259d:	48 98                	cdqe   
  80259f:	48 c1 e0 06          	shl    rax,0x6
  8025a3:	48 05 94 27 40 00    	add    rax,0x402794
  8025a9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8025ac:	8d 50 01             	lea    edx,[rax+0x1]
  8025af:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8025b2:	48 98                	cdqe   
  8025b4:	48 c1 e0 06          	shl    rax,0x6
  8025b8:	48 05 94 27 40 00    	add    rax,0x402794
  8025be:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  8025c0:	b8 00 00 00 00       	mov    eax,0x0
  8025c5:	e8 a3 ea ff ff       	call   80106d <vmalloc>
  8025ca:	48 89 c2             	mov    rdx,rax
  8025cd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8025d0:	48 98                	cdqe   
  8025d2:	48 c1 e0 06          	shl    rax,0x6
  8025d6:	48 05 80 27 40 00    	add    rax,0x402780
  8025dc:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  8025df:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8025e2:	48 98                	cdqe   
  8025e4:	48 c1 e0 06          	shl    rax,0x6
  8025e8:	48 05 80 27 40 00    	add    rax,0x402780
  8025ee:	eb 0e                	jmp    8025fe <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8025f0:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8025f4:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8025f8:	0f 8e 3e ff ff ff    	jle    80253c <get_buf+0xed>
        }
    }
}
  8025fe:	c9                   	leave  
  8025ff:	c3                   	ret    

0000000000802600 <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  802600:	f3 0f 1e fa          	endbr64 
  802604:	55                   	push   rbp
  802605:	48 89 e5             	mov    rbp,rsp
  802608:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  80260c:	90                   	nop
  80260d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802611:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  802615:	84 c0                	test   al,al
  802617:	75 f4                	jne    80260d <wait_on_buf+0xd>
    
}
  802619:	90                   	nop
  80261a:	90                   	nop
  80261b:	5d                   	pop    rbp
  80261c:	c3                   	ret    

000000000080261d <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  80261d:	f3 0f 1e fa          	endbr64 
  802621:	55                   	push   rbp
  802622:	48 89 e5             	mov    rbp,rsp
  802625:	48 83 ec 40          	sub    rsp,0x40
  802629:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    device *blkdev=get_dev(dev);
  80262c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80262f:	89 c7                	mov    edi,eax
  802631:	e8 3c 0e 00 00       	call   803472 <get_dev>
  802636:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    buffer_head* bh=bread(dev,0);
  80263a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80263d:	be 00 00 00 00       	mov    esi,0x0
  802642:	89 c7                	mov    edi,eax
  802644:	e8 5e fb ff ff       	call   8021a7 <bread>
  802649:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!bh)return -1;
  80264d:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  802652:	75 0a                	jne    80265e <scan_dev+0x41>
  802654:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802659:	e9 4f 01 00 00       	jmp    8027ad <scan_dev+0x190>
    dpt_t* dpte=bh->b_data+0x1be;
  80265e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802662:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802665:	48 05 be 01 00 00    	add    rax,0x1be
  80266b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  80266f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802676:	e9 17 01 00 00       	jmp    802792 <scan_dev+0x175>
    {
        blkdev->par[i].type=dpte->type;
  80267b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80267f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802682:	0f b6 d0             	movzx  edx,al
  802685:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  802689:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80268c:	48 63 c8             	movsxd rcx,eax
  80268f:	48 89 c8             	mov    rax,rcx
  802692:	48 01 c0             	add    rax,rax
  802695:	48 01 c8             	add    rax,rcx
  802698:	48 c1 e0 02          	shl    rax,0x2
  80269c:	48 01 f0             	add    rax,rsi
  80269f:	48 83 c0 40          	add    rax,0x40
  8026a3:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
        int stlba=dpte->start_lba;
  8026a6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8026aa:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8026ad:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
        blkdev->par[i].start_sec=stlba;
  8026b0:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  8026b4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8026b7:	48 63 d0             	movsxd rdx,eax
  8026ba:	48 89 d0             	mov    rax,rdx
  8026bd:	48 01 c0             	add    rax,rax
  8026c0:	48 01 d0             	add    rax,rdx
  8026c3:	48 c1 e0 02          	shl    rax,0x2
  8026c7:	48 01 c8             	add    rax,rcx
  8026ca:	48 8d 50 40          	lea    rdx,[rax+0x40]
  8026ce:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8026d1:	89 02                	mov    DWORD PTR [rdx],eax
        int i;
        for(i=0;i<MAX_FS;i++)
  8026d3:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8026da:	eb 68                	jmp    802744 <scan_dev+0x127>
        {
            if(fs[i].read_superblock&&fs[i].read_superblock(dev,stlba)==0)
  8026dc:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8026df:	48 63 d0             	movsxd rdx,eax
  8026e2:	48 89 d0             	mov    rax,rdx
  8026e5:	48 01 c0             	add    rax,rax
  8026e8:	48 01 d0             	add    rax,rdx
  8026eb:	48 c1 e0 03          	shl    rax,0x3
  8026ef:	48 05 80 24 40 00    	add    rax,0x402480
  8026f5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8026f8:	48 85 c0             	test   rax,rax
  8026fb:	74 43                	je     802740 <scan_dev+0x123>
  8026fd:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  802700:	48 63 d0             	movsxd rdx,eax
  802703:	48 89 d0             	mov    rax,rdx
  802706:	48 01 c0             	add    rax,rax
  802709:	48 01 d0             	add    rax,rdx
  80270c:	48 c1 e0 03          	shl    rax,0x3
  802710:	48 05 80 24 40 00    	add    rax,0x402480
  802716:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802719:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80271c:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80271f:	89 d6                	mov    esi,edx
  802721:	89 c7                	mov    edi,eax
  802723:	ff d1                	call   rcx
  802725:	85 c0                	test   eax,eax
  802727:	75 17                	jne    802740 <scan_dev+0x123>
            {
                reg_vol(dev,i,blkdev->name);//识别成功，注册卷
  802729:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80272d:	48 8d 50 14          	lea    rdx,[rax+0x14]
  802731:	8b 4d f0             	mov    ecx,DWORD PTR [rbp-0x10]
  802734:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802737:	89 ce                	mov    esi,ecx
  802739:	89 c7                	mov    edi,eax
  80273b:	e8 ae f1 ff ff       	call   8018ee <reg_vol>
        for(i=0;i<MAX_FS;i++)
  802740:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  802744:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  802748:	7e 92                	jle    8026dc <scan_dev+0xbf>
            }
        }
        if(i==MAX_FS)
  80274a:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  80274e:	75 0f                	jne    80275f <scan_dev+0x142>
        {
            printf("err:unrecognised partition fs.\n");
  802750:	bf 88 19 81 00       	mov    edi,0x811988
  802755:	b8 00 00 00 00       	mov    eax,0x0
  80275a:	e8 10 e5 ff ff       	call   800c6f <printf>
        }

        blkdev->par[i].end_sec=dpte->end_lba;
  80275f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802763:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802766:	89 c1                	mov    ecx,eax
  802768:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  80276c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80276f:	48 63 d0             	movsxd rdx,eax
  802772:	48 89 d0             	mov    rax,rdx
  802775:	48 01 c0             	add    rax,rax
  802778:	48 01 d0             	add    rax,rdx
  80277b:	48 c1 e0 02          	shl    rax,0x2
  80277f:	48 01 f0             	add    rax,rsi
  802782:	48 83 c0 40          	add    rax,0x40
  802786:	89 48 04             	mov    DWORD PTR [rax+0x4],ecx
        dpte++;
  802789:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  80278e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802792:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  802796:	0f 8e df fe ff ff    	jle    80267b <scan_dev+0x5e>
    }
    brelse(bh);
  80279c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8027a0:	48 89 c7             	mov    rdi,rax
  8027a3:	e8 9c f9 ff ff       	call   802144 <brelse>
    return 0;
  8027a8:	b8 00 00 00 00       	mov    eax,0x0
}
  8027ad:	c9                   	leave  
  8027ae:	c3                   	ret    

00000000008027af <sync_buf>:

int sync_buf(buffer_head* bh)
{
  8027af:	f3 0f 1e fa          	endbr64 
  8027b3:	55                   	push   rbp
  8027b4:	48 89 e5             	mov    rbp,rsp
  8027b7:	48 83 ec 20          	sub    rsp,0x20
  8027bb:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  8027bf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8027c3:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  8027c7:	0f b7 c0             	movzx  eax,ax
  8027ca:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  8027cd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8027d1:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8027d5:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  8027d8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8027dc:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8027df:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  8027e2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8027e5:	b9 00 02 00 00       	mov    ecx,0x200
  8027ea:	89 c7                	mov    edi,eax
  8027ec:	e8 02 00 00 00       	call   8027f3 <write_block>

}
  8027f1:	c9                   	leave  
  8027f2:	c3                   	ret    

00000000008027f3 <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  8027f3:	f3 0f 1e fa          	endbr64 
  8027f7:	55                   	push   rbp
  8027f8:	48 89 e5             	mov    rbp,rsp
  8027fb:	48 83 ec 30          	sub    rsp,0x30
  8027ff:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802802:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802805:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802809:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  80280c:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80280f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802812:	89 d6                	mov    esi,edx
  802814:	89 c7                	mov    edi,eax
  802816:	e8 34 fc ff ff       	call   80244f <get_buf>
  80281b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80281f:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802822:	ba 00 02 00 00       	mov    edx,0x200
  802827:	39 d0                	cmp    eax,edx
  802829:	0f 4f c2             	cmovg  eax,edx
  80282c:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  80282f:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802832:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802836:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802839:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  80283d:	48 89 ce             	mov    rsi,rcx
  802840:	48 89 c7             	mov    rdi,rax
  802843:	e8 fe 6c 00 00       	call   809546 <memcpy>
        len-=BLOCK_SIZE;
  802848:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  80284f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802853:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802857:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80285b:	48 89 c7             	mov    rdi,rax
  80285e:	e8 e1 f8 ff ff       	call   802144 <brelse>
    }while(len>0);
  802863:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802867:	7f a3                	jg     80280c <write_block+0x19>
    return 0;
  802869:	b8 00 00 00 00       	mov    eax,0x0
}
  80286e:	c9                   	leave  
  80286f:	c3                   	ret    

0000000000802870 <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  802870:	f3 0f 1e fa          	endbr64 
  802874:	55                   	push   rbp
  802875:	48 89 e5             	mov    rbp,rsp
  802878:	48 83 ec 30          	sub    rsp,0x30
  80287c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80287f:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802882:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802886:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  802889:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80288c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80288f:	89 d6                	mov    esi,edx
  802891:	89 c7                	mov    edi,eax
  802893:	e8 0f f9 ff ff       	call   8021a7 <bread>
  802898:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80289c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80289f:	ba 00 02 00 00       	mov    edx,0x200
  8028a4:	39 d0                	cmp    eax,edx
  8028a6:	0f 4f c2             	cmovg  eax,edx
  8028a9:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  8028ac:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8028af:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028b3:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8028b6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8028ba:	48 89 ce             	mov    rsi,rcx
  8028bd:	48 89 c7             	mov    rdi,rax
  8028c0:	e8 81 6c 00 00       	call   809546 <memcpy>
        len-=BLOCK_SIZE;
  8028c5:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  8028cc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028d0:	48 89 c7             	mov    rdi,rax
  8028d3:	e8 6c f8 ff ff       	call   802144 <brelse>
    }while(len>0);
  8028d8:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  8028dc:	7f ab                	jg     802889 <read_block+0x19>
    return 0;
  8028de:	b8 00 00 00 00       	mov    eax,0x0
}
  8028e3:	c9                   	leave  
  8028e4:	c3                   	ret    

00000000008028e5 <init_vfs>:

int init_vfs()
{
  8028e5:	f3 0f 1e fa          	endbr64 
  8028e9:	55                   	push   rbp
  8028ea:	48 89 e5             	mov    rbp,rsp
  8028ed:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  8028f1:	48 8b 05 88 5c c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05c88]        # 408580 <dev_tree>
  8028f8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  8028fc:	eb 40                	jmp    80293e <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  8028fe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802902:	48 2d 80 2f 40 00    	sub    rax,0x402f80
  802908:	48 c1 f8 02          	sar    rax,0x2
  80290c:	48 89 c2             	mov    rdx,rax
  80290f:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  802916:	18 9c 8f 
  802919:	48 0f af c2          	imul   rax,rdx
  80291d:	89 c7                	mov    edi,eax
  80291f:	e8 f9 fc ff ff       	call   80261d <scan_dev>
  802924:	85 c0                	test   eax,eax
  802926:	74 07                	je     80292f <init_vfs+0x4a>
  802928:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80292d:	eb 1b                	jmp    80294a <init_vfs+0x65>
    for(;p;p=p->next)
  80292f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802933:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  80293a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80293e:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802943:	75 b9                	jne    8028fe <init_vfs+0x19>
    }
    return 0;
  802945:	b8 00 00 00 00       	mov    eax,0x0
  80294a:	c9                   	leave  
  80294b:	c3                   	ret    

000000000080294c <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  80294c:	f3 0f 1e fa          	endbr64 
  802950:	55                   	push   rbp
  802951:	48 89 e5             	mov    rbp,rsp
}
  802954:	90                   	nop
  802955:	5d                   	pop    rbp
  802956:	c3                   	ret    

0000000000802957 <load_driver>:
int load_driver(char *path)
{
  802957:	f3 0f 1e fa          	endbr64 
  80295b:	55                   	push   rbp
  80295c:	48 89 e5             	mov    rbp,rsp
  80295f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  802963:	90                   	nop
  802964:	5d                   	pop    rbp
  802965:	c3                   	ret    

0000000000802966 <reg_device>:

int reg_device(device* dev)
{
  802966:	f3 0f 1e fa          	endbr64 
  80296a:	55                   	push   rbp
  80296b:	48 89 e5             	mov    rbp,rsp
  80296e:	53                   	push   rbx
  80296f:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  802973:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  80297a:	e9 42 01 00 00       	jmp    802ac1 <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  80297f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802982:	48 63 d0             	movsxd rdx,eax
  802985:	48 89 d0             	mov    rax,rdx
  802988:	48 c1 e0 02          	shl    rax,0x2
  80298c:	48 01 d0             	add    rax,rdx
  80298f:	48 c1 e0 02          	shl    rax,0x2
  802993:	48 01 d0             	add    rax,rdx
  802996:	48 c1 e0 03          	shl    rax,0x3
  80299a:	48 05 90 2f 40 00    	add    rax,0x402f90
  8029a0:	8b 00                	mov    eax,DWORD PTR [rax]
  8029a2:	85 c0                	test   eax,eax
  8029a4:	0f 85 13 01 00 00    	jne    802abd <reg_device+0x157>
        {
            devs[i]=*dev;
  8029aa:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8029ad:	48 63 d0             	movsxd rdx,eax
  8029b0:	48 89 d0             	mov    rax,rdx
  8029b3:	48 c1 e0 02          	shl    rax,0x2
  8029b7:	48 01 d0             	add    rax,rdx
  8029ba:	48 c1 e0 02          	shl    rax,0x2
  8029be:	48 01 d0             	add    rax,rdx
  8029c1:	48 c1 e0 03          	shl    rax,0x3
  8029c5:	48 8d 90 80 2f 40 00 	lea    rdx,[rax+0x402f80]
  8029cc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8029d0:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8029d3:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  8029d7:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  8029da:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8029de:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8029e2:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8029e6:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  8029ea:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  8029ee:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  8029f2:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  8029f6:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  8029fa:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  8029fe:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802a02:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802a06:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802a0a:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802a0e:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802a12:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802a16:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802a1a:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802a1e:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802a22:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802a26:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802a2a:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802a2e:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802a32:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802a36:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802a3a:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802a3e:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802a42:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802a46:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802a4a:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802a4e:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802a55:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802a5c:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802a63:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802a6a:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802a71:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802a78:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802a7f:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  802a86:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  802a8d:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  802a94:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802a97:	48 63 d0             	movsxd rdx,eax
  802a9a:	48 89 d0             	mov    rax,rdx
  802a9d:	48 c1 e0 02          	shl    rax,0x2
  802aa1:	48 01 d0             	add    rax,rdx
  802aa4:	48 c1 e0 02          	shl    rax,0x2
  802aa8:	48 01 d0             	add    rax,rdx
  802aab:	48 c1 e0 03          	shl    rax,0x3
  802aaf:	48 05 90 2f 40 00    	add    rax,0x402f90
  802ab5:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802abb:	eb 0e                	jmp    802acb <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  802abd:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802ac1:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  802ac5:	0f 8e b4 fe ff ff    	jle    80297f <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802acb:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  802acf:	75 0a                	jne    802adb <reg_device+0x175>
        return -1;
  802ad1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802ad6:	e9 6d 01 00 00       	jmp    802c48 <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802adb:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  802ae2:	00 
  802ae3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802ae6:	48 63 d0             	movsxd rdx,eax
  802ae9:	48 89 d0             	mov    rax,rdx
  802aec:	48 c1 e0 02          	shl    rax,0x2
  802af0:	48 01 d0             	add    rax,rdx
  802af3:	48 c1 e0 02          	shl    rax,0x2
  802af7:	48 01 d0             	add    rax,rdx
  802afa:	48 c1 e0 03          	shl    rax,0x3
  802afe:	48 05 80 2f 40 00    	add    rax,0x402f80
  802b04:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  802b08:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802b0c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802b0f:	83 f8 03             	cmp    eax,0x3
  802b12:	74 3b                	je     802b4f <reg_device+0x1e9>
  802b14:	83 f8 03             	cmp    eax,0x3
  802b17:	7f 4b                	jg     802b64 <reg_device+0x1fe>
  802b19:	83 f8 01             	cmp    eax,0x1
  802b1c:	74 07                	je     802b25 <reg_device+0x1bf>
  802b1e:	83 f8 02             	cmp    eax,0x2
  802b21:	74 17                	je     802b3a <reg_device+0x1d4>
  802b23:	eb 3f                	jmp    802b64 <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  802b25:	48 8b 05 54 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a54]        # 408580 <dev_tree>
  802b2c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802b30:	48 c7 45 e0 80 85 40 	mov    QWORD PTR [rbp-0x20],0x408580
  802b37:	00 
        break;
  802b38:	eb 34                	jmp    802b6e <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  802b3a:	48 8b 05 47 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a47]        # 408588 <dev_tree+0x8>
  802b41:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802b45:	48 c7 45 e0 88 85 40 	mov    QWORD PTR [rbp-0x20],0x408588
  802b4c:	00 
        break;
  802b4d:	eb 1f                	jmp    802b6e <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  802b4f:	48 8b 05 3a 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a3a]        # 408590 <dev_tree+0x10>
  802b56:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802b5a:	48 c7 45 e0 90 85 40 	mov    QWORD PTR [rbp-0x20],0x408590
  802b61:	00 
        break;
  802b62:	eb 0a                	jmp    802b6e <reg_device+0x208>
    default:return -1;//不可能有其他情况
  802b64:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802b69:	e9 da 00 00 00       	jmp    802c48 <reg_device+0x2e2>
    }
    if(!p){
  802b6e:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  802b73:	75 2b                	jne    802ba0 <reg_device+0x23a>
        *pp=neo;
  802b75:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802b79:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802b7d:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  802b80:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802b84:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  802b8b:	00 00 00 00 
  802b8f:	eb 3d                	jmp    802bce <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  802b91:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802b95:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802b9c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802ba0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802ba4:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802bab:	48 85 c0             	test   rax,rax
  802bae:	75 e1                	jne    802b91 <reg_device+0x22b>
        p->next=neo;
  802bb0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802bb4:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802bb8:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  802bbf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bc3:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802bc7:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802bce:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802bd2:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802bd9:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802bdd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802be1:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802be4:	83 f8 04             	cmp    eax,0x4
  802be7:	74 3b                	je     802c24 <reg_device+0x2be>
  802be9:	83 f8 04             	cmp    eax,0x4
  802bec:	7f 56                	jg     802c44 <reg_device+0x2de>
  802bee:	83 f8 03             	cmp    eax,0x3
  802bf1:	74 21                	je     802c14 <reg_device+0x2ae>
  802bf3:	83 f8 03             	cmp    eax,0x3
  802bf6:	7f 4c                	jg     802c44 <reg_device+0x2de>
  802bf8:	83 f8 01             	cmp    eax,0x1
  802bfb:	74 07                	je     802c04 <reg_device+0x29e>
  802bfd:	83 f8 02             	cmp    eax,0x2
  802c00:	74 32                	je     802c34 <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802c02:	eb 40                	jmp    802c44 <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  802c04:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c08:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802c0f:	00 00 00 
        break;
  802c12:	eb 31                	jmp    802c45 <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  802c14:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c18:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802c1f:	00 00 00 
        break;
  802c22:	eb 21                	jmp    802c45 <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  802c24:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c28:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  802c2f:	00 00 00 
        break;
  802c32:	eb 11                	jmp    802c45 <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  802c34:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c38:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  802c3f:	00 00 00 
        break;
  802c42:	eb 01                	jmp    802c45 <reg_device+0x2df>
        break;
  802c44:	90                   	nop
    }
    return i;
  802c45:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  802c48:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802c4c:	c9                   	leave  
  802c4d:	c3                   	ret    

0000000000802c4e <reg_driver>:


int reg_driver(driver *drv)
{
  802c4e:	f3 0f 1e fa          	endbr64 
  802c52:	55                   	push   rbp
  802c53:	48 89 e5             	mov    rbp,rsp
  802c56:	53                   	push   rbx
  802c57:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  802c5b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802c62:	e9 22 01 00 00       	jmp    802d89 <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  802c67:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802c6a:	48 63 d0             	movsxd rdx,eax
  802c6d:	48 89 d0             	mov    rax,rdx
  802c70:	48 c1 e0 02          	shl    rax,0x2
  802c74:	48 01 d0             	add    rax,rdx
  802c77:	48 c1 e0 05          	shl    rax,0x5
  802c7b:	48 05 80 59 40 00    	add    rax,0x405980
  802c81:	8b 00                	mov    eax,DWORD PTR [rax]
  802c83:	85 c0                	test   eax,eax
  802c85:	0f 85 fa 00 00 00    	jne    802d85 <reg_driver+0x137>
        {
            drvs[i]=*drv;
  802c8b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802c8e:	48 63 d0             	movsxd rdx,eax
  802c91:	48 89 d0             	mov    rax,rdx
  802c94:	48 c1 e0 02          	shl    rax,0x2
  802c98:	48 01 d0             	add    rax,rdx
  802c9b:	48 c1 e0 05          	shl    rax,0x5
  802c9f:	48 8d 90 80 59 40 00 	lea    rdx,[rax+0x405980]
  802ca6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802caa:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802cad:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802cb1:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802cb4:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802cb8:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802cbc:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802cc0:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802cc4:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802cc8:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802ccc:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802cd0:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802cd4:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802cd8:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802cdc:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802ce0:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802ce4:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802ce8:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802cec:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802cf0:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802cf4:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802cf8:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802cfc:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802d00:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802d04:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802d08:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802d0c:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802d10:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802d14:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802d18:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802d1c:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802d20:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802d24:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802d28:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802d2f:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802d36:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802d3d:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802d44:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802d4b:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802d52:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802d59:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  802d60:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802d63:	48 63 d0             	movsxd rdx,eax
  802d66:	48 89 d0             	mov    rax,rdx
  802d69:	48 c1 e0 02          	shl    rax,0x2
  802d6d:	48 01 d0             	add    rax,rdx
  802d70:	48 c1 e0 05          	shl    rax,0x5
  802d74:	48 05 80 59 40 00    	add    rax,0x405980
  802d7a:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  802d80:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802d83:	eb 13                	jmp    802d98 <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  802d85:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802d89:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  802d8d:	0f 8e d4 fe ff ff    	jle    802c67 <reg_driver+0x19>
        }
    }
    return -1;
  802d93:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802d98:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802d9c:	c9                   	leave  
  802d9d:	c3                   	ret    

0000000000802d9e <sys_find_dev>:

int sys_find_dev(char *name)
{
  802d9e:	f3 0f 1e fa          	endbr64 
  802da2:	55                   	push   rbp
  802da3:	48 89 e5             	mov    rbp,rsp
  802da6:	48 83 ec 20          	sub    rsp,0x20
  802daa:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802dae:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802db5:	eb 6c                	jmp    802e23 <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802db7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802dba:	48 63 d0             	movsxd rdx,eax
  802dbd:	48 89 d0             	mov    rax,rdx
  802dc0:	48 c1 e0 02          	shl    rax,0x2
  802dc4:	48 01 d0             	add    rax,rdx
  802dc7:	48 c1 e0 02          	shl    rax,0x2
  802dcb:	48 01 d0             	add    rax,rdx
  802dce:	48 c1 e0 03          	shl    rax,0x3
  802dd2:	48 05 90 2f 40 00    	add    rax,0x402f90
  802dd8:	8b 00                	mov    eax,DWORD PTR [rax]
  802dda:	85 c0                	test   eax,eax
  802ddc:	74 41                	je     802e1f <sys_find_dev+0x81>
  802dde:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802de1:	48 63 d0             	movsxd rdx,eax
  802de4:	48 89 d0             	mov    rax,rdx
  802de7:	48 c1 e0 02          	shl    rax,0x2
  802deb:	48 01 d0             	add    rax,rdx
  802dee:	48 c1 e0 02          	shl    rax,0x2
  802df2:	48 01 d0             	add    rax,rdx
  802df5:	48 c1 e0 03          	shl    rax,0x3
  802df9:	48 83 c0 10          	add    rax,0x10
  802dfd:	48 05 80 2f 40 00    	add    rax,0x402f80
  802e03:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802e07:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802e0b:	48 89 d6             	mov    rsi,rdx
  802e0e:	48 89 c7             	mov    rdi,rax
  802e11:	e8 ce 69 00 00       	call   8097e4 <strcmp>
  802e16:	85 c0                	test   eax,eax
  802e18:	75 05                	jne    802e1f <sys_find_dev+0x81>
            return i;
  802e1a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e1d:	eb 0f                	jmp    802e2e <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802e1f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802e23:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802e27:	7e 8e                	jle    802db7 <sys_find_dev+0x19>
    }
    return -1;
  802e29:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802e2e:	c9                   	leave  
  802e2f:	c3                   	ret    

0000000000802e30 <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  802e30:	f3 0f 1e fa          	endbr64 
  802e34:	55                   	push   rbp
  802e35:	48 89 e5             	mov    rbp,rsp
  802e38:	48 83 ec 30          	sub    rsp,0x30
  802e3c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802e40:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  802e43:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  802e47:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  802e4e:	eb 67                	jmp    802eb7 <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802e50:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e53:	48 63 d0             	movsxd rdx,eax
  802e56:	48 89 d0             	mov    rax,rdx
  802e59:	48 c1 e0 02          	shl    rax,0x2
  802e5d:	48 01 d0             	add    rax,rdx
  802e60:	48 c1 e0 02          	shl    rax,0x2
  802e64:	48 01 d0             	add    rax,rdx
  802e67:	48 c1 e0 03          	shl    rax,0x3
  802e6b:	48 05 90 2f 40 00    	add    rax,0x402f90
  802e71:	8b 00                	mov    eax,DWORD PTR [rax]
  802e73:	85 c0                	test   eax,eax
  802e75:	74 3c                	je     802eb3 <sys_operate_dev+0x83>
  802e77:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802e7a:	48 63 d0             	movsxd rdx,eax
  802e7d:	48 89 d0             	mov    rax,rdx
  802e80:	48 c1 e0 02          	shl    rax,0x2
  802e84:	48 01 d0             	add    rax,rdx
  802e87:	48 c1 e0 02          	shl    rax,0x2
  802e8b:	48 01 d0             	add    rax,rdx
  802e8e:	48 c1 e0 03          	shl    rax,0x3
  802e92:	48 83 c0 10          	add    rax,0x10
  802e96:	48 05 80 2f 40 00    	add    rax,0x402f80
  802e9c:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802ea0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802ea4:	48 89 d6             	mov    rsi,rdx
  802ea7:	48 89 c7             	mov    rdi,rax
  802eaa:	e8 35 69 00 00       	call   8097e4 <strcmp>
  802eaf:	85 c0                	test   eax,eax
  802eb1:	74 0c                	je     802ebf <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  802eb3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802eb7:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802ebb:	7e 93                	jle    802e50 <sys_operate_dev+0x20>
  802ebd:	eb 01                	jmp    802ec0 <sys_operate_dev+0x90>
            break;
  802ebf:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  802ec0:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  802ec4:	75 0a                	jne    802ed0 <sys_operate_dev+0xa0>
  802ec6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802ecb:	e9 9c 02 00 00       	jmp    80316c <sys_operate_dev+0x33c>
    switch (func) {
  802ed0:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  802ed4:	0f 87 8d 02 00 00    	ja     803167 <sys_operate_dev+0x337>
  802eda:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802edd:	48 8b 04 c5 a8 19 81 	mov    rax,QWORD PTR [rax*8+0x8119a8]
  802ee4:	00 
  802ee5:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  802ee8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802eeb:	48 63 d0             	movsxd rdx,eax
  802eee:	48 89 d0             	mov    rax,rdx
  802ef1:	48 c1 e0 02          	shl    rax,0x2
  802ef5:	48 01 d0             	add    rax,rdx
  802ef8:	48 c1 e0 02          	shl    rax,0x2
  802efc:	48 01 d0             	add    rax,rdx
  802eff:	48 c1 e0 03          	shl    rax,0x3
  802f03:	48 05 f8 2f 40 00    	add    rax,0x402ff8
  802f09:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802f0c:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802f10:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802f14:	48 89 c7             	mov    rdi,rax
  802f17:	ff d2                	call   rdx
  802f19:	e9 4e 02 00 00       	jmp    80316c <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  802f1e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f21:	48 63 d0             	movsxd rdx,eax
  802f24:	48 89 d0             	mov    rax,rdx
  802f27:	48 c1 e0 02          	shl    rax,0x2
  802f2b:	48 01 d0             	add    rax,rdx
  802f2e:	48 c1 e0 02          	shl    rax,0x2
  802f32:	48 01 d0             	add    rax,rdx
  802f35:	48 c1 e0 03          	shl    rax,0x3
  802f39:	48 05 f8 2f 40 00    	add    rax,0x402ff8
  802f3f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802f42:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  802f46:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802f4a:	48 89 c7             	mov    rdi,rax
  802f4d:	ff d2                	call   rdx
  802f4f:	e9 18 02 00 00       	jmp    80316c <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  802f54:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f57:	48 63 d0             	movsxd rdx,eax
  802f5a:	48 89 d0             	mov    rax,rdx
  802f5d:	48 c1 e0 02          	shl    rax,0x2
  802f61:	48 01 d0             	add    rax,rdx
  802f64:	48 c1 e0 02          	shl    rax,0x2
  802f68:	48 01 d0             	add    rax,rdx
  802f6b:	48 c1 e0 03          	shl    rax,0x3
  802f6f:	48 05 f8 2f 40 00    	add    rax,0x402ff8
  802f75:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802f78:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  802f7c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802f80:	48 89 c7             	mov    rdi,rax
  802f83:	ff d2                	call   rdx
  802f85:	e9 e2 01 00 00       	jmp    80316c <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  802f8a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f8d:	48 63 d0             	movsxd rdx,eax
  802f90:	48 89 d0             	mov    rax,rdx
  802f93:	48 c1 e0 02          	shl    rax,0x2
  802f97:	48 01 d0             	add    rax,rdx
  802f9a:	48 c1 e0 02          	shl    rax,0x2
  802f9e:	48 01 d0             	add    rax,rdx
  802fa1:	48 c1 e0 03          	shl    rax,0x3
  802fa5:	48 05 f8 2f 40 00    	add    rax,0x402ff8
  802fab:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802fae:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  802fb2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802fb6:	48 89 c7             	mov    rdi,rax
  802fb9:	ff d2                	call   rdx
  802fbb:	e9 ac 01 00 00       	jmp    80316c <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  802fc0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fc3:	48 63 d0             	movsxd rdx,eax
  802fc6:	48 89 d0             	mov    rax,rdx
  802fc9:	48 c1 e0 02          	shl    rax,0x2
  802fcd:	48 01 d0             	add    rax,rdx
  802fd0:	48 c1 e0 02          	shl    rax,0x2
  802fd4:	48 01 d0             	add    rax,rdx
  802fd7:	48 c1 e0 03          	shl    rax,0x3
  802fdb:	48 05 f8 2f 40 00    	add    rax,0x402ff8
  802fe1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802fe4:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  802fe8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802fec:	48 89 c7             	mov    rdi,rax
  802fef:	ff d2                	call   rdx
  802ff1:	e9 76 01 00 00       	jmp    80316c <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  802ff6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802ff9:	48 63 d0             	movsxd rdx,eax
  802ffc:	48 89 d0             	mov    rax,rdx
  802fff:	48 c1 e0 02          	shl    rax,0x2
  803003:	48 01 d0             	add    rax,rdx
  803006:	48 c1 e0 02          	shl    rax,0x2
  80300a:	48 01 d0             	add    rax,rdx
  80300d:	48 c1 e0 03          	shl    rax,0x3
  803011:	48 05 f8 2f 40 00    	add    rax,0x402ff8
  803017:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80301a:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  80301e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803022:	48 89 c7             	mov    rdi,rax
  803025:	ff d2                	call   rdx
  803027:	e9 40 01 00 00       	jmp    80316c <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  80302c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80302f:	48 63 d0             	movsxd rdx,eax
  803032:	48 89 d0             	mov    rax,rdx
  803035:	48 c1 e0 02          	shl    rax,0x2
  803039:	48 01 d0             	add    rax,rdx
  80303c:	48 c1 e0 02          	shl    rax,0x2
  803040:	48 01 d0             	add    rax,rdx
  803043:	48 c1 e0 03          	shl    rax,0x3
  803047:	48 05 f8 2f 40 00    	add    rax,0x402ff8
  80304d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803050:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  803054:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803058:	48 89 c7             	mov    rdi,rax
  80305b:	ff d2                	call   rdx
  80305d:	e9 0a 01 00 00       	jmp    80316c <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  803062:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803065:	48 63 d0             	movsxd rdx,eax
  803068:	48 89 d0             	mov    rax,rdx
  80306b:	48 c1 e0 02          	shl    rax,0x2
  80306f:	48 01 d0             	add    rax,rdx
  803072:	48 c1 e0 02          	shl    rax,0x2
  803076:	48 01 d0             	add    rax,rdx
  803079:	48 c1 e0 03          	shl    rax,0x3
  80307d:	48 05 f8 2f 40 00    	add    rax,0x402ff8
  803083:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803086:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  80308a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80308e:	48 89 c7             	mov    rdi,rax
  803091:	ff d2                	call   rdx
  803093:	e9 d4 00 00 00       	jmp    80316c <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  803098:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80309b:	48 63 d0             	movsxd rdx,eax
  80309e:	48 89 d0             	mov    rax,rdx
  8030a1:	48 c1 e0 02          	shl    rax,0x2
  8030a5:	48 01 d0             	add    rax,rdx
  8030a8:	48 c1 e0 02          	shl    rax,0x2
  8030ac:	48 01 d0             	add    rax,rdx
  8030af:	48 c1 e0 03          	shl    rax,0x3
  8030b3:	48 05 f8 2f 40 00    	add    rax,0x402ff8
  8030b9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030bc:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  8030c0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030c4:	48 89 c7             	mov    rdi,rax
  8030c7:	ff d2                	call   rdx
  8030c9:	e9 9e 00 00 00       	jmp    80316c <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  8030ce:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030d1:	48 63 d0             	movsxd rdx,eax
  8030d4:	48 89 d0             	mov    rax,rdx
  8030d7:	48 c1 e0 02          	shl    rax,0x2
  8030db:	48 01 d0             	add    rax,rdx
  8030de:	48 c1 e0 02          	shl    rax,0x2
  8030e2:	48 01 d0             	add    rax,rdx
  8030e5:	48 c1 e0 03          	shl    rax,0x3
  8030e9:	48 05 f8 2f 40 00    	add    rax,0x402ff8
  8030ef:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030f2:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  8030f6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030fa:	48 89 c7             	mov    rdi,rax
  8030fd:	ff d2                	call   rdx
  8030ff:	eb 6b                	jmp    80316c <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  803101:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803104:	48 63 d0             	movsxd rdx,eax
  803107:	48 89 d0             	mov    rax,rdx
  80310a:	48 c1 e0 02          	shl    rax,0x2
  80310e:	48 01 d0             	add    rax,rdx
  803111:	48 c1 e0 02          	shl    rax,0x2
  803115:	48 01 d0             	add    rax,rdx
  803118:	48 c1 e0 03          	shl    rax,0x3
  80311c:	48 05 f8 2f 40 00    	add    rax,0x402ff8
  803122:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803125:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  803129:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80312d:	48 89 c7             	mov    rdi,rax
  803130:	ff d2                	call   rdx
  803132:	eb 38                	jmp    80316c <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  803134:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803137:	48 63 d0             	movsxd rdx,eax
  80313a:	48 89 d0             	mov    rax,rdx
  80313d:	48 c1 e0 02          	shl    rax,0x2
  803141:	48 01 d0             	add    rax,rdx
  803144:	48 c1 e0 02          	shl    rax,0x2
  803148:	48 01 d0             	add    rax,rdx
  80314b:	48 c1 e0 03          	shl    rax,0x3
  80314f:	48 05 f8 2f 40 00    	add    rax,0x402ff8
  803155:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803158:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  80315c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803160:	48 89 c7             	mov    rdi,rax
  803163:	ff d2                	call   rdx
  803165:	eb 05                	jmp    80316c <sys_operate_dev+0x33c>
    }
    return -1;
  803167:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80316c:	c9                   	leave  
  80316d:	c3                   	ret    

000000000080316e <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  80316e:	f3 0f 1e fa          	endbr64 
  803172:	55                   	push   rbp
  803173:	48 89 e5             	mov    rbp,rsp
  803176:	48 83 ec 10          	sub    rsp,0x10
  80317a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  80317d:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  803180:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  803184:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803187:	48 63 d0             	movsxd rdx,eax
  80318a:	48 89 d0             	mov    rax,rdx
  80318d:	48 c1 e0 02          	shl    rax,0x2
  803191:	48 01 d0             	add    rax,rdx
  803194:	48 c1 e0 05          	shl    rax,0x5
  803198:	48 05 80 59 40 00    	add    rax,0x405980
  80319e:	8b 00                	mov    eax,DWORD PTR [rax]
  8031a0:	85 c0                	test   eax,eax
  8031a2:	75 0a                	jne    8031ae <call_drv_func+0x40>
  8031a4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8031a9:	e9 15 02 00 00       	jmp    8033c3 <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  8031ae:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  8031b2:	0f 87 06 02 00 00    	ja     8033be <call_drv_func+0x250>
  8031b8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8031bb:	48 8b 04 c5 08 1a 81 	mov    rax,QWORD PTR [rax*8+0x811a08]
  8031c2:	00 
  8031c3:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  8031c6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031c9:	48 63 d0             	movsxd rdx,eax
  8031cc:	48 89 d0             	mov    rax,rdx
  8031cf:	48 c1 e0 02          	shl    rax,0x2
  8031d3:	48 01 d0             	add    rax,rdx
  8031d6:	48 c1 e0 05          	shl    rax,0x5
  8031da:	48 05 88 59 40 00    	add    rax,0x405988
  8031e0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8031e3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8031e7:	48 89 c7             	mov    rdi,rax
  8031ea:	ff d2                	call   rdx
  8031ec:	e9 d2 01 00 00       	jmp    8033c3 <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  8031f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031f4:	48 63 d0             	movsxd rdx,eax
  8031f7:	48 89 d0             	mov    rax,rdx
  8031fa:	48 c1 e0 02          	shl    rax,0x2
  8031fe:	48 01 d0             	add    rax,rdx
  803201:	48 c1 e0 05          	shl    rax,0x5
  803205:	48 05 90 59 40 00    	add    rax,0x405990
  80320b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80320e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803212:	48 89 c7             	mov    rdi,rax
  803215:	ff d2                	call   rdx
  803217:	e9 a7 01 00 00       	jmp    8033c3 <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  80321c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80321f:	48 63 d0             	movsxd rdx,eax
  803222:	48 89 d0             	mov    rax,rdx
  803225:	48 c1 e0 02          	shl    rax,0x2
  803229:	48 01 d0             	add    rax,rdx
  80322c:	48 c1 e0 05          	shl    rax,0x5
  803230:	48 05 98 59 40 00    	add    rax,0x405998
  803236:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803239:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80323d:	48 89 c7             	mov    rdi,rax
  803240:	ff d2                	call   rdx
  803242:	e9 7c 01 00 00       	jmp    8033c3 <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  803247:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80324a:	48 63 d0             	movsxd rdx,eax
  80324d:	48 89 d0             	mov    rax,rdx
  803250:	48 c1 e0 02          	shl    rax,0x2
  803254:	48 01 d0             	add    rax,rdx
  803257:	48 c1 e0 05          	shl    rax,0x5
  80325b:	48 05 a0 59 40 00    	add    rax,0x4059a0
  803261:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803264:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803268:	48 89 c7             	mov    rdi,rax
  80326b:	ff d2                	call   rdx
  80326d:	e9 51 01 00 00       	jmp    8033c3 <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  803272:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803275:	48 63 d0             	movsxd rdx,eax
  803278:	48 89 d0             	mov    rax,rdx
  80327b:	48 c1 e0 02          	shl    rax,0x2
  80327f:	48 01 d0             	add    rax,rdx
  803282:	48 c1 e0 05          	shl    rax,0x5
  803286:	48 05 a8 59 40 00    	add    rax,0x4059a8
  80328c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80328f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803293:	48 89 c7             	mov    rdi,rax
  803296:	ff d2                	call   rdx
  803298:	e9 26 01 00 00       	jmp    8033c3 <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  80329d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032a0:	48 63 d0             	movsxd rdx,eax
  8032a3:	48 89 d0             	mov    rax,rdx
  8032a6:	48 c1 e0 02          	shl    rax,0x2
  8032aa:	48 01 d0             	add    rax,rdx
  8032ad:	48 c1 e0 05          	shl    rax,0x5
  8032b1:	48 05 b0 59 40 00    	add    rax,0x4059b0
  8032b7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8032ba:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8032be:	48 89 c7             	mov    rdi,rax
  8032c1:	ff d2                	call   rdx
  8032c3:	e9 fb 00 00 00       	jmp    8033c3 <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  8032c8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032cb:	48 63 d0             	movsxd rdx,eax
  8032ce:	48 89 d0             	mov    rax,rdx
  8032d1:	48 c1 e0 02          	shl    rax,0x2
  8032d5:	48 01 d0             	add    rax,rdx
  8032d8:	48 c1 e0 05          	shl    rax,0x5
  8032dc:	48 05 b8 59 40 00    	add    rax,0x4059b8
  8032e2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8032e5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8032e9:	48 89 c7             	mov    rdi,rax
  8032ec:	ff d2                	call   rdx
  8032ee:	e9 d0 00 00 00       	jmp    8033c3 <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  8032f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032f6:	48 63 d0             	movsxd rdx,eax
  8032f9:	48 89 d0             	mov    rax,rdx
  8032fc:	48 c1 e0 02          	shl    rax,0x2
  803300:	48 01 d0             	add    rax,rdx
  803303:	48 c1 e0 05          	shl    rax,0x5
  803307:	48 05 c0 59 40 00    	add    rax,0x4059c0
  80330d:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803310:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803314:	48 89 c7             	mov    rdi,rax
  803317:	ff d2                	call   rdx
  803319:	e9 a5 00 00 00       	jmp    8033c3 <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  80331e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803321:	48 63 d0             	movsxd rdx,eax
  803324:	48 89 d0             	mov    rax,rdx
  803327:	48 c1 e0 02          	shl    rax,0x2
  80332b:	48 01 d0             	add    rax,rdx
  80332e:	48 c1 e0 05          	shl    rax,0x5
  803332:	48 05 c8 59 40 00    	add    rax,0x4059c8
  803338:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80333b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80333f:	48 89 c7             	mov    rdi,rax
  803342:	ff d2                	call   rdx
  803344:	eb 7d                	jmp    8033c3 <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  803346:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803349:	48 63 d0             	movsxd rdx,eax
  80334c:	48 89 d0             	mov    rax,rdx
  80334f:	48 c1 e0 02          	shl    rax,0x2
  803353:	48 01 d0             	add    rax,rdx
  803356:	48 c1 e0 05          	shl    rax,0x5
  80335a:	48 05 d0 59 40 00    	add    rax,0x4059d0
  803360:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803363:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803367:	48 89 c7             	mov    rdi,rax
  80336a:	ff d2                	call   rdx
  80336c:	eb 55                	jmp    8033c3 <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  80336e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803371:	48 63 d0             	movsxd rdx,eax
  803374:	48 89 d0             	mov    rax,rdx
  803377:	48 c1 e0 02          	shl    rax,0x2
  80337b:	48 01 d0             	add    rax,rdx
  80337e:	48 c1 e0 05          	shl    rax,0x5
  803382:	48 05 d8 59 40 00    	add    rax,0x4059d8
  803388:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80338b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80338f:	48 89 c7             	mov    rdi,rax
  803392:	ff d2                	call   rdx
  803394:	eb 2d                	jmp    8033c3 <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  803396:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803399:	48 63 d0             	movsxd rdx,eax
  80339c:	48 89 d0             	mov    rax,rdx
  80339f:	48 c1 e0 02          	shl    rax,0x2
  8033a3:	48 01 d0             	add    rax,rdx
  8033a6:	48 c1 e0 05          	shl    rax,0x5
  8033aa:	48 05 e0 59 40 00    	add    rax,0x4059e0
  8033b0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033b3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033b7:	48 89 c7             	mov    rdi,rax
  8033ba:	ff d2                	call   rdx
  8033bc:	eb 05                	jmp    8033c3 <call_drv_func+0x255>
    }
    return -1;
  8033be:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8033c3:	c9                   	leave  
  8033c4:	c3                   	ret    

00000000008033c5 <dispose_device>:
int dispose_device(int dev){
  8033c5:	f3 0f 1e fa          	endbr64 
  8033c9:	55                   	push   rbp
  8033ca:	48 89 e5             	mov    rbp,rsp
  8033cd:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  8033d0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8033d3:	48 63 d0             	movsxd rdx,eax
  8033d6:	48 89 d0             	mov    rax,rdx
  8033d9:	48 c1 e0 02          	shl    rax,0x2
  8033dd:	48 01 d0             	add    rax,rdx
  8033e0:	48 c1 e0 02          	shl    rax,0x2
  8033e4:	48 01 d0             	add    rax,rdx
  8033e7:	48 c1 e0 03          	shl    rax,0x3
  8033eb:	48 05 90 2f 40 00    	add    rax,0x402f90
  8033f1:	8b 00                	mov    eax,DWORD PTR [rax]
  8033f3:	83 f8 01             	cmp    eax,0x1
  8033f6:	74 07                	je     8033ff <dispose_device+0x3a>
  8033f8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8033fd:	eb 62                	jmp    803461 <dispose_device+0x9c>
    device* p=&devs[dev];
  8033ff:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803402:	48 63 d0             	movsxd rdx,eax
  803405:	48 89 d0             	mov    rax,rdx
  803408:	48 c1 e0 02          	shl    rax,0x2
  80340c:	48 01 d0             	add    rax,rdx
  80340f:	48 c1 e0 02          	shl    rax,0x2
  803413:	48 01 d0             	add    rax,rdx
  803416:	48 c1 e0 03          	shl    rax,0x3
  80341a:	48 05 80 2f 40 00    	add    rax,0x402f80
  803420:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  803424:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803428:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  80342f:	48 85 c0             	test   rax,rax
  803432:	74 1d                	je     803451 <dispose_device+0x8c>
  803434:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803438:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  80343f:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  803443:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  80344a:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  803451:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803455:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  80345c:	b8 00 00 00 00       	mov    eax,0x0
}
  803461:	5d                   	pop    rbp
  803462:	c3                   	ret    

0000000000803463 <dispose_driver>:
int dispose_driver(driver *drv){
  803463:	f3 0f 1e fa          	endbr64 
  803467:	55                   	push   rbp
  803468:	48 89 e5             	mov    rbp,rsp
  80346b:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  80346f:	90                   	nop
  803470:	5d                   	pop    rbp
  803471:	c3                   	ret    

0000000000803472 <get_dev>:

device *get_dev(int devi)
{
  803472:	f3 0f 1e fa          	endbr64 
  803476:	55                   	push   rbp
  803477:	48 89 e5             	mov    rbp,rsp
  80347a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  80347d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803480:	48 63 d0             	movsxd rdx,eax
  803483:	48 89 d0             	mov    rax,rdx
  803486:	48 c1 e0 02          	shl    rax,0x2
  80348a:	48 01 d0             	add    rax,rdx
  80348d:	48 c1 e0 02          	shl    rax,0x2
  803491:	48 01 d0             	add    rax,rdx
  803494:	48 c1 e0 03          	shl    rax,0x3
  803498:	48 05 80 2f 40 00    	add    rax,0x402f80
}
  80349e:	5d                   	pop    rbp
  80349f:	c3                   	ret    

00000000008034a0 <get_drv>:
driver *get_drv(int drvi)
{
  8034a0:	f3 0f 1e fa          	endbr64 
  8034a4:	55                   	push   rbp
  8034a5:	48 89 e5             	mov    rbp,rsp
  8034a8:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  8034ab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034ae:	48 63 d0             	movsxd rdx,eax
  8034b1:	48 89 d0             	mov    rax,rdx
  8034b4:	48 c1 e0 02          	shl    rax,0x2
  8034b8:	48 01 d0             	add    rax,rdx
  8034bb:	48 c1 e0 05          	shl    rax,0x5
  8034bf:	48 05 80 59 40 00    	add    rax,0x405980
}
  8034c5:	5d                   	pop    rbp
  8034c6:	c3                   	ret    

00000000008034c7 <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  8034c7:	f3 0f 1e fa          	endbr64 
  8034cb:	55                   	push   rbp
  8034cc:	48 89 e5             	mov    rbp,rsp
  8034cf:	53                   	push   rbx
  8034d0:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  8034d4:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  8034db:	eb 23                	jmp    803500 <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  8034dd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8034e0:	48 63 d0             	movsxd rdx,eax
  8034e3:	48 89 d0             	mov    rax,rdx
  8034e6:	48 01 c0             	add    rax,rax
  8034e9:	48 01 d0             	add    rax,rdx
  8034ec:	48 c1 e0 06          	shl    rax,0x6
  8034f0:	48 05 2c 6e 40 00    	add    rax,0x406e2c
  8034f6:	8b 00                	mov    eax,DWORD PTR [rax]
  8034f8:	85 c0                	test   eax,eax
  8034fa:	74 0c                	je     803508 <make_request+0x41>
    for(;i<NR_REQS;i++)
  8034fc:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  803500:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  803504:	7e d7                	jle    8034dd <make_request+0x16>
  803506:	eb 01                	jmp    803509 <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803508:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  803509:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  80350d:	75 0a                	jne    803519 <make_request+0x52>
  80350f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803514:	e9 e7 01 00 00       	jmp    803700 <make_request+0x239>
    reqs[i]=*args;//放入数组
  803519:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80351c:	48 63 d0             	movsxd rdx,eax
  80351f:	48 89 d0             	mov    rax,rdx
  803522:	48 01 c0             	add    rax,rax
  803525:	48 01 d0             	add    rax,rdx
  803528:	48 c1 e0 06          	shl    rax,0x6
  80352c:	48 8d 90 80 6d 40 00 	lea    rdx,[rax+0x406d80]
  803533:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803537:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80353a:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  80353e:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  803541:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  803545:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  803549:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  80354d:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  803551:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  803555:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  803559:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  80355d:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  803561:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  803565:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  803569:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  80356d:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  803571:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  803575:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  803579:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  80357d:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  803581:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  803585:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  803589:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  80358d:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  803591:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  803595:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  803599:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  80359d:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  8035a1:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  8035a5:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  8035a9:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  8035ad:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  8035b1:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  8035b5:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  8035bc:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  8035c3:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  8035ca:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  8035d1:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  8035d8:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  8035df:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  8035e6:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  8035ed:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  8035f4:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  8035fb:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  803602:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  803609:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  803610:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  803617:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  80361e:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  803625:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803629:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  80362f:	48 63 d0             	movsxd rdx,eax
  803632:	48 89 d0             	mov    rax,rdx
  803635:	48 c1 e0 02          	shl    rax,0x2
  803639:	48 01 d0             	add    rax,rdx
  80363c:	48 c1 e0 02          	shl    rax,0x2
  803640:	48 01 d0             	add    rax,rdx
  803643:	48 c1 e0 03          	shl    rax,0x3
  803647:	48 05 80 2f 40 00    	add    rax,0x402f80
  80364d:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  803651:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803655:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  80365c:	48 85 c0             	test   rax,rax
  80365f:	75 27                	jne    803688 <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  803661:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803664:	48 63 d0             	movsxd rdx,eax
  803667:	48 89 d0             	mov    rax,rdx
  80366a:	48 01 c0             	add    rax,rax
  80366d:	48 01 d0             	add    rax,rdx
  803670:	48 c1 e0 06          	shl    rax,0x6
  803674:	48 8d 90 80 6d 40 00 	lea    rdx,[rax+0x406d80]
  80367b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80367f:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  803686:	eb 75                	jmp    8036fd <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  803688:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80368c:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803693:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  803697:	eb 0f                	jmp    8036a8 <make_request+0x1e1>
  803699:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80369d:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  8036a4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8036a8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8036ac:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  8036b3:	48 85 c0             	test   rax,rax
  8036b6:	75 e1                	jne    803699 <make_request+0x1d2>
        p->next=&reqs[i];
  8036b8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8036bb:	48 63 d0             	movsxd rdx,eax
  8036be:	48 89 d0             	mov    rax,rdx
  8036c1:	48 01 c0             	add    rax,rax
  8036c4:	48 01 d0             	add    rax,rdx
  8036c7:	48 c1 e0 06          	shl    rax,0x6
  8036cb:	48 8d 90 80 6d 40 00 	lea    rdx,[rax+0x406d80]
  8036d2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8036d6:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  8036dd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8036e0:	48 63 d0             	movsxd rdx,eax
  8036e3:	48 89 d0             	mov    rax,rdx
  8036e6:	48 01 c0             	add    rax,rax
  8036e9:	48 01 d0             	add    rax,rdx
  8036ec:	48 c1 e0 06          	shl    rax,0x6
  8036f0:	48 05 38 6e 40 00    	add    rax,0x406e38
  8036f6:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  8036fd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803700:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  803704:	c9                   	leave  
  803705:	c3                   	ret    

0000000000803706 <do_req>:
//取出一个申请并且执行
int do_req()
{
  803706:	f3 0f 1e fa          	endbr64 
  80370a:	55                   	push   rbp
  80370b:	48 89 e5             	mov    rbp,rsp
  80370e:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  803712:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803719:	e9 ab 00 00 00       	jmp    8037c9 <do_req+0xc3>
    {
        device* p=dev_tree[i];
  80371e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803721:	48 98                	cdqe   
  803723:	48 8b 04 c5 80 85 40 	mov    rax,QWORD PTR [rax*8+0x408580]
  80372a:	00 
  80372b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  80372f:	e9 86 00 00 00       	jmp    8037ba <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  803734:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803738:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  80373f:	48 85 c0             	test   rax,rax
  803742:	75 67                	jne    8037ab <do_req+0xa5>
  803744:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803748:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  80374f:	48 85 c0             	test   rax,rax
  803752:	74 57                	je     8037ab <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  803754:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803758:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  80375f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803763:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  80376a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80376e:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803775:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  80377c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803780:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  803787:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80378b:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  803791:	48 98                	cdqe   
  803793:	48 8b 14 c5 20 9f 80 	mov    rdx,QWORD PTR [rax*8+0x809f20]
  80379a:	00 
  80379b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80379f:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  8037a6:	48 89 c7             	mov    rdi,rax
  8037a9:	ff d2                	call   rdx
        for(;p;p=p->next)
  8037ab:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8037af:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8037b6:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8037ba:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8037bf:	0f 85 6f ff ff ff    	jne    803734 <do_req+0x2e>
    for(int i=0;i<3;i++)
  8037c5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8037c9:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8037cd:	0f 8e 4b ff ff ff    	jle    80371e <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  8037d3:	b8 00 00 00 00       	mov    eax,0x0
}
  8037d8:	c9                   	leave  
  8037d9:	c3                   	ret    

00000000008037da <wait_on_req>:


void wait_on_req(int reqi)
{
  8037da:	f3 0f 1e fa          	endbr64 
  8037de:	55                   	push   rbp
  8037df:	48 89 e5             	mov    rbp,rsp
  8037e2:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  8037e5:	90                   	nop
  8037e6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8037e9:	48 63 d0             	movsxd rdx,eax
  8037ec:	48 89 d0             	mov    rax,rdx
  8037ef:	48 01 c0             	add    rax,rax
  8037f2:	48 01 d0             	add    rax,rdx
  8037f5:	48 c1 e0 06          	shl    rax,0x6
  8037f9:	48 05 2c 6e 40 00    	add    rax,0x406e2c
  8037ff:	8b 00                	mov    eax,DWORD PTR [rax]
  803801:	83 f8 03             	cmp    eax,0x3
  803804:	75 e0                	jne    8037e6 <wait_on_req+0xc>
}
  803806:	90                   	nop
  803807:	90                   	nop
  803808:	5d                   	pop    rbp
  803809:	c3                   	ret    

000000000080380a <clear_req>:
void clear_req(int reqi)
{
  80380a:	f3 0f 1e fa          	endbr64 
  80380e:	55                   	push   rbp
  80380f:	48 89 e5             	mov    rbp,rsp
  803812:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  803815:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803818:	48 63 d0             	movsxd rdx,eax
  80381b:	48 89 d0             	mov    rax,rdx
  80381e:	48 01 c0             	add    rax,rax
  803821:	48 01 d0             	add    rax,rdx
  803824:	48 c1 e0 06          	shl    rax,0x6
  803828:	48 05 2c 6e 40 00    	add    rax,0x406e2c
  80382e:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  803834:	90                   	nop
  803835:	5d                   	pop    rbp
  803836:	c3                   	ret    

0000000000803837 <init_proc>:
struct process task[MAX_PROC_COUNT];
TSS scene_saver;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  803837:	f3 0f 1e fa          	endbr64 
  80383b:	55                   	push   rbp
  80383c:	48 89 e5             	mov    rbp,rsp
  80383f:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803843:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80384a:	eb 4c                	jmp    803898 <init_proc+0x61>
        task[i].pid=-1;
  80384c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80384f:	48 98                	cdqe   
  803851:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803858:	48 05 a0 85 40 00    	add    rax,0x4085a0
  80385e:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  803864:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803867:	48 98                	cdqe   
  803869:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803870:	48 05 a4 85 40 00    	add    rax,0x4085a4
  803876:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  80387c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80387f:	48 98                	cdqe   
  803881:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803888:	48 05 00 86 40 00    	add    rax,0x408600
  80388e:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803894:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803898:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80389c:	7e ae                	jle    80384c <init_proc+0x15>
    }
    cur_proc=0;//no proc
  80389e:	c7 05 c8 e8 c0 ff 00 	mov    DWORD PTR [rip+0xffffffffffc0e8c8],0x0        # 412170 <cur_proc>
  8038a5:	00 00 00 
    pidd=1;
  8038a8:	c7 05 c2 e8 c0 ff 01 	mov    DWORD PTR [rip+0xffffffffffc0e8c2],0x1        # 412174 <pidd>
  8038af:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  8038b2:	b8 00 00 00 00       	mov    eax,0x0
  8038b7:	e8 38 00 00 00       	call   8038f4 <create_proc>
  8038bc:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  8038bf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8038c2:	48 98                	cdqe   
  8038c4:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8038cb:	48 05 a4 85 40 00    	add    rax,0x4085a4
  8038d1:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  8038d7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8038da:	83 c0 03             	add    eax,0x3
  8038dd:	c1 e0 04             	shl    eax,0x4
  8038e0:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  8038e3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8038e6:	01 c0                	add    eax,eax
  8038e8:	83 c0 05             	add    eax,0x5
  8038eb:	c1 e0 03             	shl    eax,0x3
  8038ee:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
}
  8038f1:	90                   	nop
  8038f2:	c9                   	leave  
  8038f3:	c3                   	ret    

00000000008038f4 <create_proc>:

int create_proc()
{
  8038f4:	f3 0f 1e fa          	endbr64 
  8038f8:	55                   	push   rbp
  8038f9:	48 89 e5             	mov    rbp,rsp
  8038fc:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  803900:	b8 00 00 00 00       	mov    eax,0x0
  803905:	e8 7d 00 00 00       	call   803987 <req_proc>
  80390a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  80390d:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  803911:	75 07                	jne    80391a <create_proc+0x26>
  803913:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803918:	eb 6b                	jmp    803985 <create_proc+0x91>
    int curesp=0x9fc00-1;
  80391a:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%esp,%0":"=m"(curesp));
  803921:	89 65 f8             	mov    DWORD PTR [rbp-0x8],esp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0,0,0,0,0x17,0xf,0x17,0x17,0x17,0x17,curesp,0,0,0,0,index);
  803924:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803927:	48 98                	cdqe   
  803929:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80392c:	52                   	push   rdx
  80392d:	6a 00                	push   0x0
  80392f:	6a 00                	push   0x0
  803931:	6a 00                	push   0x0
  803933:	6a 00                	push   0x0
  803935:	50                   	push   rax
  803936:	6a 17                	push   0x17
  803938:	6a 17                	push   0x17
  80393a:	6a 17                	push   0x17
  80393c:	6a 17                	push   0x17
  80393e:	41 b9 0f 00 00 00    	mov    r9d,0xf
  803944:	41 b8 17 00 00 00    	mov    r8d,0x17
  80394a:	b9 00 00 00 00       	mov    ecx,0x0
  80394f:	ba 00 00 00 00       	mov    edx,0x0
  803954:	be 00 00 00 00       	mov    esi,0x0
  803959:	bf 00 00 00 00       	mov    edi,0x0
  80395e:	e8 f0 00 00 00       	call   803a53 <set_proc>
  803963:	48 83 c4 50          	add    rsp,0x50
    task[index].tss.eip=(long)proc_zero;
  803967:	ba d7 3c 80 00       	mov    edx,0x803cd7
  80396c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80396f:	48 98                	cdqe   
  803971:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803978:	48 05 70 87 40 00    	add    rax,0x408770
  80397e:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx

    return index;
  803982:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803985:	c9                   	leave  
  803986:	c3                   	ret    

0000000000803987 <req_proc>:
int req_proc(){
  803987:	f3 0f 1e fa          	endbr64 
  80398b:	55                   	push   rbp
  80398c:	48 89 e5             	mov    rbp,rsp
    int num=0;
  80398f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803996:	eb 04                	jmp    80399c <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  803998:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  80399c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80399f:	48 98                	cdqe   
  8039a1:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8039a8:	48 05 a0 85 40 00    	add    rax,0x4085a0
  8039ae:	8b 00                	mov    eax,DWORD PTR [rax]
  8039b0:	83 f8 ff             	cmp    eax,0xffffffff
  8039b3:	74 1f                	je     8039d4 <req_proc+0x4d>
  8039b5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039b8:	48 98                	cdqe   
  8039ba:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8039c1:	48 05 a4 85 40 00    	add    rax,0x4085a4
  8039c7:	8b 00                	mov    eax,DWORD PTR [rax]
  8039c9:	83 f8 03             	cmp    eax,0x3
  8039cc:	74 06                	je     8039d4 <req_proc+0x4d>
  8039ce:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8039d2:	7e c4                	jle    803998 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  8039d4:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8039d8:	7e 07                	jle    8039e1 <req_proc+0x5a>
        return -1;
  8039da:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8039df:	eb 70                	jmp    803a51 <req_proc+0xca>
    task[num].pid=pidd++;
  8039e1:	8b 05 8d e7 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e78d]        # 412174 <pidd>
  8039e7:	8d 50 01             	lea    edx,[rax+0x1]
  8039ea:	89 15 84 e7 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e784],edx        # 412174 <pidd>
  8039f0:	89 c2                	mov    edx,eax
  8039f2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039f5:	48 98                	cdqe   
  8039f7:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8039fe:	48 05 a0 85 40 00    	add    rax,0x4085a0
  803a04:	89 10                	mov    DWORD PTR [rax],edx
    task[num].stat=ENDED;
  803a06:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a09:	48 98                	cdqe   
  803a0b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803a12:	48 05 a4 85 40 00    	add    rax,0x4085a4
  803a18:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  803a1e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a21:	48 98                	cdqe   
  803a23:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803a2a:	48 05 a8 85 40 00    	add    rax,0x4085a8
  803a30:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803a36:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a39:	48 98                	cdqe   
  803a3b:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803a42:	48 05 ac 85 40 00    	add    rax,0x4085ac
  803a48:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  803a4e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803a51:	5d                   	pop    rbp
  803a52:	c3                   	ret    

0000000000803a53 <set_proc>:
void set_proc(long eax,long ebx,long ecx,long edx,long es,long cs,long ss,long ds,long fs,long gs\
,long esp,long ebp,long esi,long edi,long eflags,int proc_nr){
  803a53:	f3 0f 1e fa          	endbr64 
  803a57:	55                   	push   rbp
  803a58:	48 89 e5             	mov    rbp,rsp
  803a5b:	48 83 ec 40          	sub    rsp,0x40
  803a5f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803a63:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803a67:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803a6b:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803a6f:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  803a73:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803a77:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803a7a:	48 98                	cdqe   
  803a7c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803a83:	48 05 a0 85 40 00    	add    rax,0x4085a0
  803a89:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->tss.eax=eax;
  803a8d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803a91:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803a95:	48 89 90 ec 01 00 00 	mov    QWORD PTR [rax+0x1ec],rdx
    proc->tss.ebx=ebx;
  803a9c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803aa0:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  803aa4:	48 89 90 04 02 00 00 	mov    QWORD PTR [rax+0x204],rdx
    proc->tss.ecx=ecx;
  803aab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803aaf:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803ab3:	48 89 90 f4 01 00 00 	mov    QWORD PTR [rax+0x1f4],rdx
    proc->tss.edx=edx;
  803aba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803abe:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  803ac2:	48 89 90 fc 01 00 00 	mov    QWORD PTR [rax+0x1fc],rdx
    proc->tss.es=es;
  803ac9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803acd:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803ad1:	48 89 90 2c 02 00 00 	mov    QWORD PTR [rax+0x22c],rdx
    proc->tss.cs=cs;
  803ad8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803adc:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803ae0:	48 89 90 34 02 00 00 	mov    QWORD PTR [rax+0x234],rdx
    proc->tss.ss=ss;
  803ae7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803aeb:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803aef:	48 89 90 3c 02 00 00 	mov    QWORD PTR [rax+0x23c],rdx
    proc->tss.ss0=ss;
  803af6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803afa:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803afe:	48 89 90 ac 01 00 00 	mov    QWORD PTR [rax+0x1ac],rdx
    proc->tss.ss1=ss;
  803b05:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b09:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803b0d:	48 89 90 bc 01 00 00 	mov    QWORD PTR [rax+0x1bc],rdx
    proc->tss.ss2=ss;
  803b14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b18:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803b1c:	48 89 90 cc 01 00 00 	mov    QWORD PTR [rax+0x1cc],rdx
    proc->tss.ds=ds;
  803b23:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b27:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803b2b:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    proc->tss.fs=fs;
  803b32:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b36:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803b3a:	48 89 90 4c 02 00 00 	mov    QWORD PTR [rax+0x24c],rdx
    proc->tss.gs=gs;
  803b41:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b45:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803b49:	48 89 90 54 02 00 00 	mov    QWORD PTR [rax+0x254],rdx
    proc->tss.esp=esp;
  803b50:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b54:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803b58:	48 89 90 0c 02 00 00 	mov    QWORD PTR [rax+0x20c],rdx
    proc->tss.esp0=esp;
  803b5f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b63:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803b67:	48 89 90 a4 01 00 00 	mov    QWORD PTR [rax+0x1a4],rdx
    proc->tss.esp1=esp;
  803b6e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b72:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803b76:	48 89 90 b4 01 00 00 	mov    QWORD PTR [rax+0x1b4],rdx
    proc->tss.esp2=esp;
  803b7d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b81:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803b85:	48 89 90 c4 01 00 00 	mov    QWORD PTR [rax+0x1c4],rdx
    proc->tss.ebp=ebp;
  803b8c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b90:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803b94:	48 89 90 14 02 00 00 	mov    QWORD PTR [rax+0x214],rdx
    proc->tss.esi=esi;
  803b9b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803b9f:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803ba3:	48 89 90 1c 02 00 00 	mov    QWORD PTR [rax+0x21c],rdx
    proc->tss.edi=edi;
  803baa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bae:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803bb2:	48 89 90 24 02 00 00 	mov    QWORD PTR [rax+0x224],rdx
    proc->tss.eflags=0x202;//设置为默认值:0b 0010 0000 0010
  803bb9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bbd:	48 c7 80 e4 01 00 00 	mov    QWORD PTR [rax+0x1e4],0x202
  803bc4:	02 02 00 00 
    //能接受中断
    proc->tss.eip=(long)proc_zero;
  803bc8:	ba d7 3c 80 00       	mov    edx,0x803cd7
  803bcd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bd1:	48 89 90 dc 01 00 00 	mov    QWORD PTR [rax+0x1dc],rdx

    proc->tss.cs=cs;
  803bd8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bdc:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803be0:	48 89 90 34 02 00 00 	mov    QWORD PTR [rax+0x234],rdx
    proc->tss.ds=ds;
  803be7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803beb:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803bef:	48 89 90 44 02 00 00 	mov    QWORD PTR [rax+0x244],rdx
    proc->tss.es=es;
  803bf6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803bfa:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803bfe:	48 89 90 2c 02 00 00 	mov    QWORD PTR [rax+0x22c],rdx
    proc->tss.cr3=PAGE_INDEX_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803c05:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c09:	48 c7 80 d4 01 00 00 	mov    QWORD PTR [rax+0x1d4],0x1000
  803c10:	00 10 00 00 

    proc->tss.ldt= _LDT_IND(proc_nr)*8;
  803c14:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803c17:	83 c0 03             	add    eax,0x3
  803c1a:	c1 e0 04             	shl    eax,0x4
  803c1d:	48 63 d0             	movsxd rdx,eax
  803c20:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c24:	48 89 90 5c 02 00 00 	mov    QWORD PTR [rax+0x25c],rdx
    //在gdt中添加tss
    fill_desc(&proc->tss,0xffff,SEG_SYS_TSS|SEG_PRESENT,_TSS_IND(proc_nr));
  803c2b:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803c2e:	01 c0                	add    eax,eax
  803c30:	83 c0 05             	add    eax,0x5
  803c33:	89 c2                	mov    edx,eax
  803c35:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c39:	48 05 9c 01 00 00    	add    rax,0x19c
  803c3f:	89 d1                	mov    ecx,edx
  803c41:	ba 89 00 00 00       	mov    edx,0x89
  803c46:	be ff ff 00 00       	mov    esi,0xffff
  803c4b:	89 c7                	mov    edi,eax
  803c4d:	e8 d0 0d 00 00       	call   804a22 <fill_desc>
    //添加ldt
    fill_desc(proc->ldt, sizeof(proc->ldt),SEG_SYS_LDT|SEG_PRESENT, _LDT_IND(proc_nr));
  803c52:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803c55:	83 c0 03             	add    eax,0x3
  803c58:	01 c0                	add    eax,eax
  803c5a:	89 c2                	mov    edx,eax
  803c5c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c60:	48 83 c0 34          	add    rax,0x34
  803c64:	89 d1                	mov    ecx,edx
  803c66:	ba 82 00 00 00       	mov    edx,0x82
  803c6b:	be 28 00 00 00       	mov    esi,0x28
  803c70:	89 c7                	mov    edi,eax
  803c72:	e8 ab 0d 00 00       	call   804a22 <fill_desc>
    //设置ldt
    fill_ldt_desc(0,0xffffffff,\
  803c77:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c7b:	48 83 c0 34          	add    rax,0x34
  803c7f:	48 89 c1             	mov    rcx,rax
  803c82:	ba fe cf 00 00       	mov    edx,0xcffe
  803c87:	be ff ff ff ff       	mov    esi,0xffffffff
  803c8c:	bf 00 00 00 00       	mov    edi,0x0
  803c91:	e8 b3 0e 00 00       	call   804b49 <fill_ldt_desc>
    SEG_CONFORMING_RW_CODE|SEG_DPL_3,&proc->ldt[0]);
    fill_ldt_desc(0,0xffffffff,\
  803c96:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c9a:	48 83 c0 3c          	add    rax,0x3c
  803c9e:	48 89 c1             	mov    rcx,rax
  803ca1:	ba f2 cf 00 00       	mov    edx,0xcff2
  803ca6:	be ff ff ff ff       	mov    esi,0xffffffff
  803cab:	bf 00 00 00 00       	mov    edi,0x0
  803cb0:	e8 94 0e 00 00       	call   804b49 <fill_ldt_desc>
    SEG_RW_DATA|SEG_DPL_3,&proc->ldt[1]);
    fill_ldt_desc(0x1c00000-0x1000,0x1000,\
  803cb5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803cb9:	48 83 c0 44          	add    rax,0x44
  803cbd:	48 89 c1             	mov    rcx,rax
  803cc0:	ba f6 00 00 00       	mov    edx,0xf6
  803cc5:	be 00 10 00 00       	mov    esi,0x1000
  803cca:	bf 00 f0 bf 01       	mov    edi,0x1bff000
  803ccf:	e8 75 0e 00 00       	call   804b49 <fill_ldt_desc>
    SEG_STACK|SEG_DPL_3,&proc->ldt[2]);

}
  803cd4:	90                   	nop
  803cd5:	c9                   	leave  
  803cd6:	c3                   	ret    

0000000000803cd7 <proc_zero>:
void proc_zero()
{
  803cd7:	f3 0f 1e fa          	endbr64 
  803cdb:	55                   	push   rbp
  803cdc:	48 89 e5             	mov    rbp,rsp

    while(1);
  803cdf:	eb fe                	jmp    803cdf <proc_zero+0x8>

0000000000803ce1 <manage_proc>:
}
void manage_proc(){
  803ce1:	f3 0f 1e fa          	endbr64 
  803ce5:	55                   	push   rbp
  803ce6:	48 89 e5             	mov    rbp,rsp
  803ce9:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803ced:	8b 05 7d e4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e47d]        # 412170 <cur_proc>
  803cf3:	83 f8 ff             	cmp    eax,0xffffffff
  803cf6:	74 2d                	je     803d25 <manage_proc+0x44>
        task[cur_proc].utime++;
  803cf8:	8b 05 72 e4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e472]        # 412170 <cur_proc>
  803cfe:	48 63 d0             	movsxd rdx,eax
  803d01:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  803d08:	48 81 c2 a8 85 40 00 	add    rdx,0x4085a8
  803d0f:	8b 12                	mov    edx,DWORD PTR [rdx]
  803d11:	83 c2 01             	add    edx,0x1
  803d14:	48 98                	cdqe   
  803d16:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803d1d:	48 05 a8 85 40 00    	add    rax,0x4085a8
  803d23:	89 10                	mov    DWORD PTR [rax],edx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803d25:	8b 05 45 e4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e445]        # 412170 <cur_proc>
  803d2b:	83 f8 ff             	cmp    eax,0xffffffff
  803d2e:	74 3c                	je     803d6c <manage_proc+0x8b>
  803d30:	8b 05 3a e4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e43a]        # 412170 <cur_proc>
  803d36:	48 98                	cdqe   
  803d38:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803d3f:	48 05 a8 85 40 00    	add    rax,0x4085a8
  803d45:	8b 00                	mov    eax,DWORD PTR [rax]
  803d47:	83 f8 01             	cmp    eax,0x1
  803d4a:	77 20                	ja     803d6c <manage_proc+0x8b>
    task[cur_proc].stat!=READY){
  803d4c:	8b 05 1e e4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e41e]        # 412170 <cur_proc>
  803d52:	48 98                	cdqe   
  803d54:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803d5b:	48 05 a4 85 40 00    	add    rax,0x4085a4
  803d61:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803d63:	83 f8 01             	cmp    eax,0x1
  803d66:	0f 84 90 00 00 00    	je     803dfc <manage_proc+0x11b>
        if(cur_proc!=-1)
  803d6c:	8b 05 fe e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e3fe]        # 412170 <cur_proc>
  803d72:	83 f8 ff             	cmp    eax,0xffffffff
  803d75:	74 1b                	je     803d92 <manage_proc+0xb1>
            task[cur_proc].utime=0;
  803d77:	8b 05 f3 e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e3f3]        # 412170 <cur_proc>
  803d7d:	48 98                	cdqe   
  803d7f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803d86:	48 05 a8 85 40 00    	add    rax,0x4085a8
  803d8c:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=0;
  803d92:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  803d99:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803da0:	eb 41                	jmp    803de3 <manage_proc+0x102>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803da2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803da5:	48 98                	cdqe   
  803da7:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803dae:	48 05 a0 85 40 00    	add    rax,0x4085a0
  803db4:	8b 00                	mov    eax,DWORD PTR [rax]
  803db6:	83 f8 ff             	cmp    eax,0xffffffff
  803db9:	74 24                	je     803ddf <manage_proc+0xfe>
  803dbb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803dbe:	48 98                	cdqe   
  803dc0:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803dc7:	48 05 a4 85 40 00    	add    rax,0x4085a4
  803dcd:	8b 00                	mov    eax,DWORD PTR [rax]
  803dcf:	83 f8 01             	cmp    eax,0x1
  803dd2:	75 0b                	jne    803ddf <manage_proc+0xfe>
  803dd4:	8b 05 96 e3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e396]        # 412170 <cur_proc>
  803dda:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  803ddd:	75 0c                	jne    803deb <manage_proc+0x10a>
        for(i=0;i<MAX_PROC_COUNT;i++){
  803ddf:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803de3:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803de7:	7e b9                	jle    803da2 <manage_proc+0xc1>
  803de9:	eb 01                	jmp    803dec <manage_proc+0x10b>
                break;
  803deb:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  803dec:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803df0:	7f 0d                	jg     803dff <manage_proc+0x11e>
            return;
        //switch
        switch_proc_tss(i);
  803df2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803df5:	89 c7                	mov    edi,eax
  803df7:	e8 06 00 00 00       	call   803e02 <switch_proc_tss>
    }
    return;
  803dfc:	90                   	nop
  803dfd:	eb 01                	jmp    803e00 <manage_proc+0x11f>
            return;
  803dff:	90                   	nop
}
  803e00:	c9                   	leave  
  803e01:	c3                   	ret    

0000000000803e02 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  803e02:	f3 0f 1e fa          	endbr64 
  803e06:	55                   	push   rbp
  803e07:	48 89 e5             	mov    rbp,rsp
  803e0a:	48 83 ec 20          	sub    rsp,0x20
  803e0e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  803e11:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803e14:	01 c0                	add    eax,eax
  803e16:	83 c0 05             	add    eax,0x5
  803e19:	c1 e0 03             	shl    eax,0x3
  803e1c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  803e1f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803e22:	89 05 48 e3 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e348],eax        # 412170 <cur_proc>
    switch_proc_asm(sel);
  803e28:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803e2b:	89 c7                	mov    edi,eax
  803e2d:	e8 a8 5f 00 00       	call   809dda <switch_proc_asm>
}
  803e32:	90                   	nop
  803e33:	c9                   	leave  
  803e34:	c3                   	ret    

0000000000803e35 <switch_proc>:
void switch_proc(int pnr){
  803e35:	f3 0f 1e fa          	endbr64 
  803e39:	55                   	push   rbp
  803e3a:	48 89 e5             	mov    rbp,rsp
  803e3d:	48 81 ec 80 02 00 00 	sub    rsp,0x280
  803e44:	89 bd 8c fd ff ff    	mov    DWORD PTR [rbp-0x274],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  803e4a:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803e50:	48 98                	cdqe   
  803e52:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803e59:	48 8d 90 a0 85 40 00 	lea    rdx,[rax+0x4085a0]
  803e60:	48 8d 85 90 fd ff ff 	lea    rax,[rbp-0x270]
  803e67:	b9 4d 00 00 00       	mov    ecx,0x4d
  803e6c:	48 89 c7             	mov    rdi,rax
  803e6f:	48 89 d6             	mov    rsi,rdx
  803e72:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
  803e75:	48 89 f2             	mov    rdx,rsi
  803e78:	48 89 f8             	mov    rax,rdi
  803e7b:	8b 0a                	mov    ecx,DWORD PTR [rdx]
  803e7d:	89 08                	mov    DWORD PTR [rax],ecx
    save_context(&task[cur_proc].tss);
  803e7f:	8b 05 eb e2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0e2eb]        # 412170 <cur_proc>
  803e85:	48 98                	cdqe   
  803e87:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803e8e:	48 05 90 01 00 00    	add    rax,0x190
  803e94:	48 05 a0 85 40 00    	add    rax,0x4085a0
  803e9a:	48 83 c0 0c          	add    rax,0xc
  803e9e:	48 89 c7             	mov    rdi,rax
  803ea1:	e8 69 00 00 00       	call   803f0f <save_context>
    //重新设置0号进程
    task[0].tss.eip=proc_zero;
  803ea6:	b8 d7 3c 80 00       	mov    eax,0x803cd7
  803eab:	48 89 05 ca 48 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc048ca],rax        # 40877c <task+0x1dc>
    task[0].tss.cr3=PAGE_INDEX_ADDR;
  803eb2:	48 c7 05 b7 48 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc048b7],0x1000        # 408774 <task+0x1d4>
  803eb9:	00 10 00 00 
    task[0].tss.eflags=0x202;
  803ebd:	48 c7 05 bc 48 c0 ff 	mov    QWORD PTR [rip+0xffffffffffc048bc],0x202        # 408784 <task+0x1e4>
  803ec4:	02 02 00 00 
    cur_proc=pnr;
  803ec8:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803ece:	89 05 9c e2 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0e29c],eax        # 412170 <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  803ed4:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803eda:	01 c0                	add    eax,eax
  803edc:	83 c0 05             	add    eax,0x5
  803edf:	c1 e0 03             	shl    eax,0x3
  803ee2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(&task[pnr].tss);
  803ee5:	8b 85 8c fd ff ff    	mov    eax,DWORD PTR [rbp-0x274]
  803eeb:	48 98                	cdqe   
  803eed:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  803ef4:	48 05 90 01 00 00    	add    rax,0x190
  803efa:	48 05 a0 85 40 00    	add    rax,0x4085a0
  803f00:	48 83 c0 0c          	add    rax,0xc
  803f04:	48 89 c7             	mov    rdi,rax
  803f07:	e8 ef 5e 00 00       	call   809dfb <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  803f0c:	90                   	nop
  803f0d:	c9                   	leave  
  803f0e:	c3                   	ret    

0000000000803f0f <save_context>:
void save_context(TSS *tss)
{
  803f0f:	f3 0f 1e fa          	endbr64 
  803f13:	55                   	push   rbp
  803f14:	48 89 e5             	mov    rbp,rsp
  803f17:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    tss->eip=scene_saver.eip;
  803f1b:	48 8b 15 be e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e1be]        # 4120e0 <scene_saver+0x40>
  803f22:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f26:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
    tss->eax=scene_saver.eax;
  803f2a:	48 8b 15 bf e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e1bf]        # 4120f0 <scene_saver+0x50>
  803f31:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f35:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
    tss->ebx=scene_saver.ebx;
  803f39:	48 8b 15 c8 e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e1c8]        # 412108 <scene_saver+0x68>
  803f40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f44:	48 89 50 68          	mov    QWORD PTR [rax+0x68],rdx
    tss->ecx=scene_saver.ecx;
  803f48:	48 8b 15 a9 e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e1a9]        # 4120f8 <scene_saver+0x58>
  803f4f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f53:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
    tss->edx=scene_saver.edx;
  803f57:	48 8b 15 a2 e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e1a2]        # 412100 <scene_saver+0x60>
  803f5e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f62:	48 89 50 60          	mov    QWORD PTR [rax+0x60],rdx
    tss->esi=scene_saver.esi;
  803f66:	48 8b 15 b3 e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e1b3]        # 412120 <scene_saver+0x80>
  803f6d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f71:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    tss->edi=scene_saver.edi;
  803f78:	48 8b 15 a9 e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e1a9]        # 412128 <scene_saver+0x88>
  803f7f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f83:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
    tss->eflags=scene_saver.eflags;
  803f8a:	48 8b 15 57 e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e157]        # 4120e8 <scene_saver+0x48>
  803f91:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f95:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
    tss->esp=scene_saver.esp;
  803f99:	48 8b 15 70 e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e170]        # 412110 <scene_saver+0x70>
  803fa0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803fa4:	48 89 50 70          	mov    QWORD PTR [rax+0x70],rdx
    tss->ebp=scene_saver.ebp;
  803fa8:	48 8b 15 69 e1 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc0e169]        # 412118 <scene_saver+0x78>
  803faf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803fb3:	48 89 50 78          	mov    QWORD PTR [rax+0x78],rdx
}
  803fb7:	90                   	nop
  803fb8:	5d                   	pop    rbp
  803fb9:	c3                   	ret    

0000000000803fba <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  803fba:	f3 0f 1e fa          	endbr64 
  803fbe:	55                   	push   rbp
  803fbf:	48 89 e5             	mov    rbp,rsp
  803fc2:	48 83 ec 60          	sub    rsp,0x60
  803fc6:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  803fc9:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  803fcc:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803fcf:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  803fd5:	85 c0                	test   eax,eax
  803fd7:	0f 48 c2             	cmovs  eax,edx
  803fda:	c1 f8 0c             	sar    eax,0xc
  803fdd:	89 c1                	mov    ecx,eax
  803fdf:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803fe2:	99                   	cdq    
  803fe3:	c1 ea 14             	shr    edx,0x14
  803fe6:	01 d0                	add    eax,edx
  803fe8:	25 ff 0f 00 00       	and    eax,0xfff
  803fed:	29 d0                	sub    eax,edx
  803fef:	01 c8                	add    eax,ecx
  803ff1:	85 c0                	test   eax,eax
  803ff3:	0f 95 c0             	setne  al
  803ff6:	0f b6 c0             	movzx  eax,al
  803ff9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  803ffc:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  804003:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80400a:	00 
    page_item *pgind=task[proc_index].tss.cr3;
  80400b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80400e:	48 98                	cdqe   
  804010:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804017:	48 05 60 87 40 00    	add    rax,0x408760
  80401d:	48 8b 40 14          	mov    rax,QWORD PTR [rax+0x14]
  804021:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    pgind++;
  804025:	48 83 45 e8 08       	add    QWORD PTR [rbp-0x18],0x8
    for(int i=1;i<1024;i++)
  80402a:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x1
  804031:	e9 39 02 00 00       	jmp    80426f <palloc+0x2b5>
    {
        page_item* tblp=*pgind&0xfffff000;
  804036:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80403a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80403d:	25 00 f0 ff ff       	and    eax,0xfffff000
  804042:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        for(int j=0;j<1024;j++)
  804046:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
  80404d:	e9 07 02 00 00       	jmp    804259 <palloc+0x29f>
        {
            int v=*tblp&PAGE_PRESENT;
  804052:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804056:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804059:	83 e0 01             	and    eax,0x1
  80405c:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
            if(!v)
  80405f:	83 7d d0 00          	cmp    DWORD PTR [rbp-0x30],0x0
  804063:	0f 85 e7 01 00 00    	jne    804250 <palloc+0x296>
            {
                int new_pg=req_a_page();
  804069:	b8 00 00 00 00       	mov    eax,0x0
  80406e:	e8 65 d2 ff ff       	call   8012d8 <req_a_page>
  804073:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
                if(new_pg==-1)
  804076:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  80407a:	0f 85 b9 00 00 00    	jne    804139 <palloc+0x17f>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804080:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804083:	48 98                	cdqe   
  804085:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80408c:	48 05 e4 85 40 00    	add    rax,0x4085e4
  804092:	0f b7 00             	movzx  eax,WORD PTR [rax]
  804095:	0f b7 c0             	movzx  eax,ax
  804098:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  80409b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80409e:	48 98                	cdqe   
  8040a0:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8040a7:	48 05 e0 85 40 00    	add    rax,0x4085e0
  8040ad:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8040b1:	0f b7 c0             	movzx  eax,ax
  8040b4:	c1 e0 10             	shl    eax,0x10
  8040b7:	25 00 00 0f 00       	and    eax,0xf0000
  8040bc:	01 45 b8             	add    DWORD PTR [rbp-0x48],eax
                    size+=c;
  8040bf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8040c2:	01 45 b8             	add    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  8040c5:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8040c8:	89 c2                	mov    edx,eax
  8040ca:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8040cd:	48 98                	cdqe   
  8040cf:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8040d6:	48 05 e4 85 40 00    	add    rax,0x4085e4
  8040dc:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  8040df:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8040e2:	48 98                	cdqe   
  8040e4:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8040eb:	48 05 e0 85 40 00    	add    rax,0x4085e0
  8040f1:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8040f5:	0f b7 c0             	movzx  eax,ax
  8040f8:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    tmp_attr&=0xfff0;
  8040fb:	81 65 b4 f0 ff 00 00 	and    DWORD PTR [rbp-0x4c],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804102:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804105:	c1 e8 10             	shr    eax,0x10
  804108:	83 e0 0f             	and    eax,0xf
  80410b:	89 c2                	mov    edx,eax
  80410d:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  804110:	01 d0                	add    eax,edx
  804112:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  804115:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  804118:	89 c2                	mov    edx,eax
  80411a:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80411d:	48 98                	cdqe   
  80411f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804126:	48 05 e0 85 40 00    	add    rax,0x4085e0
  80412c:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  804130:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804134:	e9 48 01 00 00       	jmp    804281 <palloc+0x2c7>
                }
                int addr=get_phyaddr(new_pg);
  804139:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80413c:	89 c7                	mov    edi,eax
  80413e:	e8 02 d3 ff ff       	call   801445 <get_phyaddr>
  804143:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  804146:	8b 4d c8             	mov    ecx,DWORD PTR [rbp-0x38]
  804149:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80414d:	ba 07 00 00 00       	mov    edx,0x7
  804152:	89 ce                	mov    esi,ecx
  804154:	48 89 c7             	mov    rdi,rax
  804157:	e8 fc d2 ff ff       	call   801458 <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  80415c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80415f:	c1 e0 0a             	shl    eax,0xa
  804162:	89 c2                	mov    edx,eax
  804164:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  804167:	01 d0                	add    eax,edx
  804169:	c1 e0 0c             	shl    eax,0xc
  80416c:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                if(ptr==NULL)
  80416f:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  804174:	75 12                	jne    804188 <palloc+0x1ce>
                {
                    ptr=laddr;
  804176:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  804179:	48 98                	cdqe   
  80417b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
                    palloc_paddr=addr;
  80417f:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  804182:	89 05 f0 df c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0dff0],eax        # 412178 <palloc_paddr>
                }
                page_c--;
  804188:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  80418c:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  804190:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  804194:	0f 85 b6 00 00 00    	jne    804250 <palloc+0x296>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  80419a:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80419d:	48 98                	cdqe   
  80419f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8041a6:	48 05 e4 85 40 00    	add    rax,0x4085e4
  8041ac:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8041af:	0f b7 c0             	movzx  eax,ax
  8041b2:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  8041b5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8041b8:	48 98                	cdqe   
  8041ba:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8041c1:	48 05 e0 85 40 00    	add    rax,0x4085e0
  8041c7:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8041cb:	0f b7 c0             	movzx  eax,ax
  8041ce:	c1 e0 10             	shl    eax,0x10
  8041d1:	25 00 00 0f 00       	and    eax,0xf0000
  8041d6:	01 45 c0             	add    DWORD PTR [rbp-0x40],eax
                    size+=c;
  8041d9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8041dc:	01 45 c0             	add    DWORD PTR [rbp-0x40],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  8041df:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  8041e2:	89 c2                	mov    edx,eax
  8041e4:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8041e7:	48 98                	cdqe   
  8041e9:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8041f0:	48 05 e4 85 40 00    	add    rax,0x4085e4
  8041f6:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  8041f9:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8041fc:	48 98                	cdqe   
  8041fe:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804205:	48 05 e0 85 40 00    	add    rax,0x4085e0
  80420b:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80420f:	0f b7 c0             	movzx  eax,ax
  804212:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    tmp_attr&=0xfff0;
  804215:	81 65 bc f0 ff 00 00 	and    DWORD PTR [rbp-0x44],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  80421c:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  80421f:	c1 e8 10             	shr    eax,0x10
  804222:	83 e0 0f             	and    eax,0xf
  804225:	89 c2                	mov    edx,eax
  804227:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80422a:	01 d0                	add    eax,edx
  80422c:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  80422f:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804232:	89 c2                	mov    edx,eax
  804234:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804237:	48 98                	cdqe   
  804239:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804240:	48 05 e0 85 40 00    	add    rax,0x4085e0
  804246:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
                    return ptr;
  80424a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80424e:	eb 31                	jmp    804281 <palloc+0x2c7>
                }
            }
            tblp++;
  804250:	48 83 45 d8 08       	add    QWORD PTR [rbp-0x28],0x8
        for(int j=0;j<1024;j++)
  804255:	83 45 d4 01          	add    DWORD PTR [rbp-0x2c],0x1
  804259:	81 7d d4 ff 03 00 00 	cmp    DWORD PTR [rbp-0x2c],0x3ff
  804260:	0f 8e ec fd ff ff    	jle    804052 <palloc+0x98>
        }
        pgind++;
  804266:	48 83 45 e8 08       	add    QWORD PTR [rbp-0x18],0x8
    for(int i=1;i<1024;i++)
  80426b:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
  80426f:	81 7d e4 ff 03 00 00 	cmp    DWORD PTR [rbp-0x1c],0x3ff
  804276:	0f 8e ba fd ff ff    	jle    804036 <palloc+0x7c>
    }
    return NULL;
  80427c:	b8 00 00 00 00       	mov    eax,0x0
}
  804281:	c9                   	leave  
  804282:	c3                   	ret    

0000000000804283 <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  804283:	f3 0f 1e fa          	endbr64 
  804287:	55                   	push   rbp
  804288:	48 89 e5             	mov    rbp,rsp
  80428b:	48 83 ec 10          	sub    rsp,0x10
  80428f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  804292:	8b 05 d8 de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ded8]        # 412170 <cur_proc>
  804298:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80429b:	89 d6                	mov    esi,edx
  80429d:	89 c7                	mov    edi,eax
  80429f:	e8 16 fd ff ff       	call   803fba <palloc>
}
  8042a4:	c9                   	leave  
  8042a5:	c3                   	ret    

00000000008042a6 <proc_end>:
void proc_end()
{
  8042a6:	f3 0f 1e fa          	endbr64 
  8042aa:	55                   	push   rbp
  8042ab:	48 89 e5             	mov    rbp,rsp
  8042ae:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  8042b2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
  8042b5:	48 8b 05 f0 44 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc044f0]        # 4087ac <task+0x20c>
  8042bc:	48 89 c4             	mov    rsp,rax
    del_proc(cur_proc);
  8042bf:	8b 05 ab de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0deab]        # 412170 <cur_proc>
  8042c5:	89 c7                	mov    edi,eax
  8042c7:	e8 75 00 00 00       	call   804341 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  8042cc:	8b 05 9e de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0de9e]        # 412170 <cur_proc>
  8042d2:	48 98                	cdqe   
  8042d4:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8042db:	48 05 00 86 40 00    	add    rax,0x408600
  8042e1:	8b 00                	mov    eax,DWORD PTR [rax]
  8042e3:	83 f8 ff             	cmp    eax,0xffffffff
  8042e6:	74 4c                	je     804334 <proc_end+0x8e>
        task[task[cur_proc].parent_pid].stat=READY;
  8042e8:	8b 05 82 de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0de82]        # 412170 <cur_proc>
  8042ee:	48 98                	cdqe   
  8042f0:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8042f7:	48 05 00 86 40 00    	add    rax,0x408600
  8042fd:	8b 00                	mov    eax,DWORD PTR [rax]
  8042ff:	89 c0                	mov    eax,eax
  804301:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804308:	48 05 a4 85 40 00    	add    rax,0x4085a4
  80430e:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  804314:	8b 05 56 de c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0de56]        # 412170 <cur_proc>
  80431a:	48 98                	cdqe   
  80431c:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804323:	48 05 00 86 40 00    	add    rax,0x408600
  804329:	8b 00                	mov    eax,DWORD PTR [rax]
  80432b:	89 c7                	mov    edi,eax
  80432d:	e8 d0 fa ff ff       	call   803e02 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  804332:	eb 0a                	jmp    80433e <proc_end+0x98>
        switch_proc_tss(0);
  804334:	bf 00 00 00 00       	mov    edi,0x0
  804339:	e8 c4 fa ff ff       	call   803e02 <switch_proc_tss>
}
  80433e:	90                   	nop
  80433f:	c9                   	leave  
  804340:	c3                   	ret    

0000000000804341 <del_proc>:
void del_proc(int pnr)
{
  804341:	f3 0f 1e fa          	endbr64 
  804345:	55                   	push   rbp
  804346:	48 89 e5             	mov    rbp,rsp
  804349:	48 83 ec 30          	sub    rsp,0x30
  80434d:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  804350:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804353:	48 98                	cdqe   
  804355:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80435c:	48 05 a4 85 40 00    	add    rax,0x4085a4
  804362:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  804368:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80436b:	48 98                	cdqe   
  80436d:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804374:	48 05 a0 85 40 00    	add    rax,0x4085a0
  80437a:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p=task[pnr].tss.cr3;
  804380:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804383:	48 98                	cdqe   
  804385:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80438c:	48 05 60 87 40 00    	add    rax,0x408760
  804392:	48 8b 40 14          	mov    rax,QWORD PTR [rax+0x14]
  804396:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    p++;
  80439a:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  80439f:	eb 63                	jmp    804404 <del_proc+0xc3>
    {
        page_item *tp=*p&0xfffff000;
  8043a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8043a5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8043a8:	25 00 f0 ff ff       	and    eax,0xfffff000
  8043ad:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  8043b1:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8043b8:	eb 30                	jmp    8043ea <del_proc+0xa9>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  8043ba:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8043be:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8043c1:	83 e0 01             	and    eax,0x1
  8043c4:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  8043c7:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  8043cb:	74 14                	je     8043e1 <del_proc+0xa0>
            {
                free_page(*tp&0xfffff000);
  8043cd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8043d1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8043d4:	25 00 f0 ff ff       	and    eax,0xfffff000
  8043d9:	48 89 c7             	mov    rdi,rax
  8043dc:	e8 a3 cf ff ff       	call   801384 <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  8043e1:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  8043e6:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8043ea:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  8043f1:	7e c7                	jle    8043ba <del_proc+0x79>
        }
        vmfree(tp);
  8043f3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8043f7:	48 89 c7             	mov    rdi,rax
  8043fa:	e8 fd cc ff ff       	call   8010fc <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  8043ff:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  804404:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804408:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80440b:	83 e0 01             	and    eax,0x1
  80440e:	48 85 c0             	test   rax,rax
  804411:	75 8e                	jne    8043a1 <del_proc+0x60>
    }
    //释放存放页目录的页面
    vmfree(p);
  804413:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804417:	48 89 c7             	mov    rdi,rax
  80441a:	e8 dd cc ff ff       	call   8010fc <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  80441f:	90                   	nop
  804420:	c9                   	leave  
  804421:	c3                   	ret    

0000000000804422 <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  804422:	f3 0f 1e fa          	endbr64 
  804426:	55                   	push   rbp
  804427:	48 89 e5             	mov    rbp,rsp
  80442a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80442d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  804430:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804434:	75 07                	jne    80443d <set_proc_stat+0x1b>
  804436:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80443b:	eb 79                	jmp    8044b6 <set_proc_stat+0x94>
    int i=0;
  80443d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  804444:	eb 04                	jmp    80444a <set_proc_stat+0x28>
  804446:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80444a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80444d:	48 98                	cdqe   
  80444f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804456:	48 05 a0 85 40 00    	add    rax,0x4085a0
  80445c:	8b 10                	mov    edx,DWORD PTR [rax]
  80445e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804461:	39 c2                	cmp    edx,eax
  804463:	75 e1                	jne    804446 <set_proc_stat+0x24>
    if(i==MAX_PROC_COUNT)return -1;
  804465:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  804469:	75 07                	jne    804472 <set_proc_stat+0x50>
  80446b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804470:	eb 44                	jmp    8044b6 <set_proc_stat+0x94>
    task[i].stat=stat;
  804472:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804475:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804478:	48 63 d2             	movsxd rdx,edx
  80447b:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  804482:	48 81 c2 a4 85 40 00 	add    rdx,0x4085a4
  804489:	89 02                	mov    DWORD PTR [rdx],eax
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  80448b:	8b 05 df dc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dcdf]        # 412170 <cur_proc>
  804491:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804494:	75 1b                	jne    8044b1 <set_proc_stat+0x8f>
        task[cur_proc].utime=MAX_UTIME;
  804496:	8b 05 d4 dc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dcd4]        # 412170 <cur_proc>
  80449c:	48 98                	cdqe   
  80449e:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8044a5:	48 05 a8 85 40 00    	add    rax,0x4085a8
  8044ab:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  8044b1:	b8 00 00 00 00       	mov    eax,0x0
}
  8044b6:	5d                   	pop    rbp
  8044b7:	c3                   	ret    

00000000008044b8 <add_proc_openf>:

    return 0;
} */

int add_proc_openf(vfs_dir_entry *entry)
{
  8044b8:	f3 0f 1e fa          	endbr64 
  8044bc:	55                   	push   rbp
  8044bd:	48 89 e5             	mov    rbp,rsp
  8044c0:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8044c4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8044cb:	eb 69                	jmp    804536 <add_proc_openf+0x7e>
        if(task[cur_proc].openf[i]==NULL)
  8044cd:	8b 05 9d dc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dc9d]        # 412170 <cur_proc>
  8044d3:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8044d6:	48 63 d2             	movsxd rdx,edx
  8044d9:	48 83 c2 12          	add    rdx,0x12
  8044dd:	48 98                	cdqe   
  8044df:	48 c1 e2 03          	shl    rdx,0x3
  8044e3:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8044ea:	48 01 d0             	add    rax,rdx
  8044ed:	48 05 a0 85 40 00    	add    rax,0x4085a0
  8044f3:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8044f7:	48 85 c0             	test   rax,rax
  8044fa:	75 36                	jne    804532 <add_proc_openf+0x7a>
        {
            task[cur_proc].openf[i]=entry;
  8044fc:	8b 05 6e dc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dc6e]        # 412170 <cur_proc>
  804502:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804505:	48 63 d2             	movsxd rdx,edx
  804508:	48 83 c2 12          	add    rdx,0x12
  80450c:	48 98                	cdqe   
  80450e:	48 c1 e2 03          	shl    rdx,0x3
  804512:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804519:	48 01 d0             	add    rax,rdx
  80451c:	48 8d 90 a0 85 40 00 	lea    rdx,[rax+0x4085a0]
  804523:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804527:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
            return 0;
  80452b:	b8 00 00 00 00       	mov    eax,0x0
  804530:	eb 0f                	jmp    804541 <add_proc_openf+0x89>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804532:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804536:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  80453a:	7e 91                	jle    8044cd <add_proc_openf+0x15>
        }
    }
    return -1;//full
  80453c:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  804541:	5d                   	pop    rbp
  804542:	c3                   	ret    

0000000000804543 <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  804543:	f3 0f 1e fa          	endbr64 
  804547:	55                   	push   rbp
  804548:	48 89 e5             	mov    rbp,rsp
  80454b:	48 83 ec 10          	sub    rsp,0x10
  80454f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  804552:	8b 05 18 dc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0dc18]        # 412170 <cur_proc>
  804558:	89 c7                	mov    edi,eax
  80455a:	e8 e2 fd ff ff       	call   804341 <del_proc>
    return code;
  80455f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  804562:	c9                   	leave  
  804563:	c3                   	ret    

0000000000804564 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(int entry, vfs_dir_entry *cwd, vfs_dir_entry *exef)
{
  804564:	f3 0f 1e fa          	endbr64 
  804568:	55                   	push   rbp
  804569:	48 89 e5             	mov    rbp,rsp
  80456c:	48 83 ec 40          	sub    rsp,0x40
  804570:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  804573:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  804577:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    
    int i=req_proc();
  80457b:	b8 00 00 00 00       	mov    eax,0x0
  804580:	e8 02 f4 ff ff       	call   803987 <req_proc>
  804585:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(i==-1)return -1;
  804588:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  80458c:	75 0a                	jne    804598 <reg_proc+0x34>
  80458e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804593:	e9 80 01 00 00       	jmp    804718 <reg_proc+0x1b4>
    /*set_proc(0,0,0,0,SEL_LDT_DATA,SEL_LDT_CODE,SEL_LDT_STACK,SEL_LDT_DATA\
    ,SEL_LDT_DATA,SEL_LDT_DATA,0x1c00000-4,0,0,0,0,i);*/
    set_proc(0,0,0,0,0x10,0x8,0x10,0x10\
  804598:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80459b:	50                   	push   rax
  80459c:	6a 00                	push   0x0
  80459e:	6a 00                	push   0x0
  8045a0:	6a 00                	push   0x0
  8045a2:	6a 00                	push   0x0
  8045a4:	68 fc ff bf 01       	push   0x1bffffc
  8045a9:	6a 10                	push   0x10
  8045ab:	6a 10                	push   0x10
  8045ad:	6a 10                	push   0x10
  8045af:	6a 10                	push   0x10
  8045b1:	41 b9 08 00 00 00    	mov    r9d,0x8
  8045b7:	41 b8 10 00 00 00    	mov    r8d,0x10
  8045bd:	b9 00 00 00 00       	mov    ecx,0x0
  8045c2:	ba 00 00 00 00       	mov    edx,0x0
  8045c7:	be 00 00 00 00       	mov    esi,0x0
  8045cc:	bf 00 00 00 00       	mov    edi,0x0
  8045d1:	e8 7d f4 ff ff       	call   803a53 <set_proc>
  8045d6:	48 83 c4 50          	add    rsp,0x50
    ,0x10,0x10,0x1c00000-4,0,0,0,0,i);
    task[i].pdet=vmalloc();
  8045da:	b8 00 00 00 00       	mov    eax,0x0
  8045df:	e8 89 ca ff ff       	call   80106d <vmalloc>
  8045e4:	48 89 c2             	mov    rdx,rax
  8045e7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8045ea:	48 98                	cdqe   
  8045ec:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8045f3:	48 05 20 86 40 00    	add    rax,0x408620
  8045f9:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    int *pt=vmalloc();
  8045fd:	b8 00 00 00 00       	mov    eax,0x0
  804602:	e8 66 ca ff ff       	call   80106d <vmalloc>
  804607:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    task[i].pdet[0]=PAGE_TABLE_ADDR|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;
  80460b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80460e:	48 98                	cdqe   
  804610:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804617:	48 05 20 86 40 00    	add    rax,0x408620
  80461d:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804621:	c7 00 07 20 00 00    	mov    DWORD PTR [rax],0x2007
    /*for(int j=0;j<32;j++)
        pt[j]=(PAGE_TABLE_ADDR+j*0x1000)|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;//复制内核页表*/
    //PAGE_TABLE_ADDR|PAGE_PRESENT;//复制内核页表
    //task[i].pdet[7]=PAGE_TABLE_ADDR+7*0x1000|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//sys.dll
    int *stackb=vmalloc();
  804627:	b8 00 00 00 00       	mov    eax,0x0
  80462c:	e8 3c ca ff ff       	call   80106d <vmalloc>
  804631:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    task[i].pdet[6]=(int)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  804635:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804639:	83 c8 07             	or     eax,0x7
  80463c:	89 c2                	mov    edx,eax
  80463e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804641:	48 98                	cdqe   
  804643:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80464a:	48 05 20 86 40 00    	add    rax,0x408620
  804650:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804654:	48 83 c0 18          	add    rax,0x18
  804658:	89 10                	mov    DWORD PTR [rax],edx
    stackb[1023]=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  80465a:	b8 00 00 00 00       	mov    eax,0x0
  80465f:	e8 74 cc ff ff       	call   8012d8 <req_a_page>
  804664:	89 c7                	mov    edi,eax
  804666:	e8 da cd ff ff       	call   801445 <get_phyaddr>
  80466b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  80466f:	48 81 c2 fc 0f 00 00 	add    rdx,0xffc
  804676:	83 c8 07             	or     eax,0x7
  804679:	89 02                	mov    DWORD PTR [rdx],eax
    task[i].tss.cr3=task[i].pdet;
  80467b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80467e:	48 98                	cdqe   
  804680:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804687:	48 05 20 86 40 00    	add    rax,0x408620
  80468d:	48 8b 40 04          	mov    rax,QWORD PTR [rax+0x4]
  804691:	48 89 c2             	mov    rdx,rax
  804694:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804697:	48 98                	cdqe   
  804699:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8046a0:	48 05 60 87 40 00    	add    rax,0x408760
  8046a6:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx

    task[i].stat=READY;
  8046aa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046ad:	48 98                	cdqe   
  8046af:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8046b6:	48 05 a4 85 40 00    	add    rax,0x4085a4
  8046bc:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  8046c2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046c5:	48 98                	cdqe   
  8046c7:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8046ce:	48 8d 90 20 86 40 00 	lea    rdx,[rax+0x408620]
  8046d5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8046d9:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    task[i].exef=exef;
  8046dd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046e0:	48 98                	cdqe   
  8046e2:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8046e9:	48 8d 90 30 86 40 00 	lea    rdx,[rax+0x408630]
  8046f0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8046f4:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].tss.ds=0x10;
    task[i].tss.ss=0x10;
    task[i].tss.gs=0x10;
    task[i].tss.fs=0x10;
    task[i].tss.cs=0x8;*/
    task[i].tss.eip=entry;
  8046f8:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8046fb:	48 98                	cdqe   
  8046fd:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804700:	48 63 d2             	movsxd rdx,edx
  804703:	48 69 d2 6c 02 00 00 	imul   rdx,rdx,0x26c
  80470a:	48 81 c2 70 87 40 00 	add    rdx,0x408770
  804711:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    return i;
  804715:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  804718:	c9                   	leave  
  804719:	c3                   	ret    

000000000080471a <sys_malloc>:

void * sys_malloc(int size)
{
  80471a:	f3 0f 1e fa          	endbr64 
  80471e:	55                   	push   rbp
  80471f:	48 89 e5             	mov    rbp,rsp
  804722:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  804725:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804728:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80472e:	85 c0                	test   eax,eax
  804730:	0f 48 c2             	cmovs  eax,edx
  804733:	c1 f8 0c             	sar    eax,0xc
  804736:	89 c1                	mov    ecx,eax
  804738:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80473b:	99                   	cdq    
  80473c:	c1 ea 14             	shr    edx,0x14
  80473f:	01 d0                	add    eax,edx
  804741:	25 ff 0f 00 00       	and    eax,0xfff
  804746:	29 d0                	sub    eax,edx
  804748:	01 c8                	add    eax,ecx
  80474a:	85 c0                	test   eax,eax
  80474c:	0f 95 c0             	setne  al
  80474f:	0f b6 c0             	movzx  eax,al
  804752:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  804755:	8b 05 15 da c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0da15]        # 412170 <cur_proc>
  80475b:	48 98                	cdqe   
  80475d:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804764:	48 05 b4 85 40 00    	add    rax,0x4085b4
  80476a:	8b 00                	mov    eax,DWORD PTR [rax]
  80476c:	48 98                	cdqe   
  80476e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804772:	eb 0c                	jmp    804780 <sys_malloc+0x66>
        hp=hp->next;
  804774:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804778:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80477c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804780:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804784:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804788:	48 85 c0             	test   rax,rax
  80478b:	74 16                	je     8047a3 <sys_malloc+0x89>
  80478d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804791:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804794:	85 c0                	test   eax,eax
  804796:	75 0b                	jne    8047a3 <sys_malloc+0x89>
  804798:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80479c:	8b 00                	mov    eax,DWORD PTR [rax]
  80479e:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8047a1:	7e d1                	jle    804774 <sys_malloc+0x5a>
    if(hp->pgn<n)
  8047a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047a7:	8b 00                	mov    eax,DWORD PTR [rax]
  8047a9:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8047ac:	7e 7f                	jle    80482d <sys_malloc+0x113>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  8047ae:	8b 05 bc d9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d9bc]        # 412170 <cur_proc>
  8047b4:	48 98                	cdqe   
  8047b6:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8047bd:	48 05 b8 85 40 00    	add    rax,0x4085b8
  8047c3:	8b 10                	mov    edx,DWORD PTR [rax]
  8047c5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8047c8:	c1 e0 0c             	shl    eax,0xc
  8047cb:	01 d0                	add    eax,edx
  8047cd:	3d ff ff ef 01       	cmp    eax,0x1efffff
  8047d2:	7e 0a                	jle    8047de <sys_malloc+0xc4>
        {
            //超过顶部
            return NULL;
  8047d4:	b8 00 00 00 00       	mov    eax,0x0
  8047d9:	e9 c8 00 00 00       	jmp    8048a6 <sys_malloc+0x18c>
        }
        int needed=n-hp->pgn;
  8047de:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8047e2:	8b 10                	mov    edx,DWORD PTR [rax]
  8047e4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8047e7:	29 d0                	sub    eax,edx
  8047e9:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  8047ec:	8b 05 7e d9 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d97e]        # 412170 <cur_proc>
  8047f2:	48 98                	cdqe   
  8047f4:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  8047fb:	48 05 b8 85 40 00    	add    rax,0x4085b8
  804801:	8b 00                	mov    eax,DWORD PTR [rax]
  804803:	48 98                	cdqe   
  804805:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804809:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804810:	eb 13                	jmp    804825 <sys_malloc+0x10b>
        {
            *p=0;//触发缺页中断
  804812:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804816:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  804819:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804820:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804821:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804825:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804828:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80482b:	7c e5                	jl     804812 <sys_malloc+0xf8>
        }
    }
    if(hp->pgn>n)
  80482d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804831:	8b 00                	mov    eax,DWORD PTR [rax]
  804833:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804836:	7d 59                	jge    804891 <sys_malloc+0x177>
    {
        //在后面新建一个头
        char *p=hp;
  804838:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80483c:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804840:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804843:	83 c0 01             	add    eax,0x1
  804846:	c1 e0 0c             	shl    eax,0xc
  804849:	48 98                	cdqe   
  80484b:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  80484f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804853:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  804857:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80485b:	8b 00                	mov    eax,DWORD PTR [rax]
  80485d:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  804860:	8d 50 ff             	lea    edx,[rax-0x1]
  804863:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804867:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  804869:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80486d:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804871:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804875:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  804879:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80487d:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804881:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804885:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804889:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80488d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804891:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804895:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  80489c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048a0:	48 05 00 10 00 00    	add    rax,0x1000
}
  8048a6:	5d                   	pop    rbp
  8048a7:	c3                   	ret    

00000000008048a8 <sys_free>:
int sys_free(int ptr)
{
  8048a8:	f3 0f 1e fa          	endbr64 
  8048ac:	55                   	push   rbp
  8048ad:	48 89 e5             	mov    rbp,rsp
  8048b0:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  8048b3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8048b6:	2d 00 10 00 00       	sub    eax,0x1000
  8048bb:	48 98                	cdqe   
  8048bd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  8048c1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048c5:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  8048cc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048d0:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8048d4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8048d8:	eb 2e                	jmp    804908 <sys_free+0x60>
    {
        if(p->alloc==0)
  8048da:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048de:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8048e1:	85 c0                	test   eax,eax
  8048e3:	75 2c                	jne    804911 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  8048e5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048e9:	8b 10                	mov    edx,DWORD PTR [rax]
  8048eb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8048ef:	8b 00                	mov    eax,DWORD PTR [rax]
  8048f1:	83 c0 01             	add    eax,0x1
  8048f4:	01 c2                	add    edx,eax
  8048f6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048fa:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  8048fc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804900:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804904:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804908:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80490d:	75 cb                	jne    8048da <sys_free+0x32>
  80490f:	eb 01                	jmp    804912 <sys_free+0x6a>
            break;
  804911:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  804912:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804916:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80491a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80491e:	eb 2e                	jmp    80494e <sys_free+0xa6>
    {
        if(p->alloc==0)
  804920:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804924:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804927:	85 c0                	test   eax,eax
  804929:	75 2c                	jne    804957 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  80492b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80492f:	8b 10                	mov    edx,DWORD PTR [rax]
  804931:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804935:	8b 00                	mov    eax,DWORD PTR [rax]
  804937:	83 c0 01             	add    eax,0x1
  80493a:	01 c2                	add    edx,eax
  80493c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804940:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  804942:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804946:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80494a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80494e:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804953:	75 cb                	jne    804920 <sys_free+0x78>
  804955:	eb 01                	jmp    804958 <sys_free+0xb0>
            break;
  804957:	90                   	nop
    }
    //合并完成
    return 0;
  804958:	b8 00 00 00 00       	mov    eax,0x0
  80495d:	5d                   	pop    rbp
  80495e:	c3                   	ret    
  80495f:	90                   	nop

0000000000804960 <outb>:
  804960:	66 89 fa             	mov    dx,di
  804963:	66 89 f0             	mov    ax,si
  804966:	ee                   	out    dx,al
  804967:	e8 29 00 00 00       	call   804995 <io_delay>
  80496c:	c3                   	ret    

000000000080496d <outw>:
  80496d:	66 89 fa             	mov    dx,di
  804970:	66 89 f0             	mov    ax,si
  804973:	66 ef                	out    dx,ax
  804975:	90                   	nop
  804976:	90                   	nop
  804977:	90                   	nop
  804978:	c3                   	ret    

0000000000804979 <inb>:
  804979:	31 c0                	xor    eax,eax
  80497b:	66 89 fa             	mov    dx,di
  80497e:	ec                   	in     al,dx
  80497f:	90                   	nop
  804980:	90                   	nop
  804981:	90                   	nop
  804982:	c3                   	ret    

0000000000804983 <inw>:
  804983:	31 c0                	xor    eax,eax
  804985:	66 89 fa             	mov    dx,di
  804988:	66 ed                	in     ax,dx
  80498a:	90                   	nop
  80498b:	90                   	nop
  80498c:	90                   	nop
  80498d:	c3                   	ret    

000000000080498e <eoi>:
  80498e:	b0 20                	mov    al,0x20
  804990:	e6 a0                	out    0xa0,al
  804992:	e6 20                	out    0x20,al
  804994:	c3                   	ret    

0000000000804995 <io_delay>:
  804995:	90                   	nop
  804996:	90                   	nop
  804997:	90                   	nop
  804998:	90                   	nop
  804999:	c3                   	ret    

000000000080499a <turn_on_int>:
  80499a:	b0 f8                	mov    al,0xf8
  80499c:	e6 21                	out    0x21,al
  80499e:	e8 f2 ff ff ff       	call   804995 <io_delay>
  8049a3:	b0 af                	mov    al,0xaf
  8049a5:	e6 a1                	out    0xa1,al
  8049a7:	e8 e9 ff ff ff       	call   804995 <io_delay>
  8049ac:	b8 00 70 10 00       	mov    eax,0x107000
  8049b1:	0f 01 18             	lidt   [rax]
  8049b4:	90                   	nop
  8049b5:	90                   	nop
  8049b6:	90                   	nop
  8049b7:	90                   	nop
  8049b8:	fb                   	sti    
  8049b9:	c3                   	ret    

00000000008049ba <report_back_trace_of_err>:
  8049ba:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  8049bf:	50                   	push   rax
  8049c0:	68 c9 49 80 00       	push   0x8049c9
  8049c5:	83 c4 08             	add    esp,0x8
  8049c8:	c3                   	ret    

00000000008049c9 <bt_msg>:
  8049c9:	65 72 72             	gs jb  804a3e <fill_desc+0x1c>
  8049cc:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  8049cd:	72 20                	jb     8049ef <init_gdt+0x11>
  8049cf:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  8049d0:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  8049d3:	72 73                	jb     804a48 <fill_desc+0x26>
  8049d5:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  8049d8:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eea656 <dev_stdout+0x6d8596>

00000000008049de <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  8049de:	f3 0f 1e fa          	endbr64 
  8049e2:	55                   	push   rbp
  8049e3:	48 89 e5             	mov    rbp,rsp
    //asm volatile("sgdt %0"::"m"(gdt));
    fill_desc(0,0xffffffff,SEG_CONFORMING_RW_CODE,1);
  8049e6:	b9 01 00 00 00       	mov    ecx,0x1
  8049eb:	ba 9e cf 00 00       	mov    edx,0xcf9e
  8049f0:	be ff ff ff ff       	mov    esi,0xffffffff
  8049f5:	bf 00 00 00 00       	mov    edi,0x0
  8049fa:	e8 23 00 00 00       	call   804a22 <fill_desc>
    fill_desc(0,0xffffffff,SEG_RW_DATA,2);
  8049ff:	b9 02 00 00 00       	mov    ecx,0x2
  804a04:	ba 92 cf 00 00       	mov    edx,0xcf92
  804a09:	be ff ff ff ff       	mov    esi,0xffffffff
  804a0e:	bf 00 00 00 00       	mov    edi,0x0
  804a13:	e8 0a 00 00 00       	call   804a22 <fill_desc>
    asm volatile("lgdt %0":"=m"(gdtptr));
  804a18:	0f 01 15 e1 05 90 ff 	lgdt   [rip+0xffffffffff9005e1]        # 105000 <gdtptr>

}
  804a1f:	90                   	nop
  804a20:	5d                   	pop    rbp
  804a21:	c3                   	ret    

0000000000804a22 <fill_desc>:
void fill_desc(u32 base, u32 limit,u16 attr,u32 index)
{
  804a22:	f3 0f 1e fa          	endbr64 
  804a26:	55                   	push   rbp
  804a27:	48 89 e5             	mov    rbp,rsp
  804a2a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  804a2d:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  804a30:	89 d0                	mov    eax,edx
  804a32:	89 4d f0             	mov    DWORD PTR [rbp-0x10],ecx
  804a35:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    gdt[index].base_lo16=base&0xffff;
  804a39:	48 8b 15 00 55 00 00 	mov    rdx,QWORD PTR [rip+0x5500]        # 809f40 <gdt>
  804a40:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804a43:	48 c1 e0 03          	shl    rax,0x3
  804a47:	48 01 d0             	add    rax,rdx
  804a4a:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804a4d:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_mid8=(base>>16)&0xff;
  804a51:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804a54:	c1 e8 10             	shr    eax,0x10
  804a57:	89 c1                	mov    ecx,eax
  804a59:	48 8b 15 e0 54 00 00 	mov    rdx,QWORD PTR [rip+0x54e0]        # 809f40 <gdt>
  804a60:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804a63:	48 c1 e0 03          	shl    rax,0x3
  804a67:	48 01 d0             	add    rax,rdx
  804a6a:	89 ca                	mov    edx,ecx
  804a6c:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_hi8=(base>>24)&0xff;
  804a6f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804a72:	c1 e8 18             	shr    eax,0x18
  804a75:	89 c1                	mov    ecx,eax
  804a77:	48 8b 15 c2 54 00 00 	mov    rdx,QWORD PTR [rip+0x54c2]        # 809f40 <gdt>
  804a7e:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804a81:	48 c1 e0 03          	shl    rax,0x3
  804a85:	48 01 d0             	add    rax,rdx
  804a88:	89 ca                	mov    edx,ecx
  804a8a:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].limit_lo16=limit&0xffff;
  804a8d:	48 8b 15 ac 54 00 00 	mov    rdx,QWORD PTR [rip+0x54ac]        # 809f40 <gdt>
  804a94:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804a97:	48 c1 e0 03          	shl    rax,0x3
  804a9b:	48 01 d0             	add    rax,rdx
  804a9e:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  804aa1:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr;
  804aa4:	48 8b 15 95 54 00 00 	mov    rdx,QWORD PTR [rip+0x5495]        # 809f40 <gdt>
  804aab:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  804aae:	48 c1 e0 03          	shl    rax,0x3
  804ab2:	48 01 c2             	add    rdx,rax
  804ab5:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  804ab9:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  804abd:	90                   	nop
  804abe:	5d                   	pop    rbp
  804abf:	c3                   	ret    

0000000000804ac0 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  804ac0:	f3 0f 1e fa          	endbr64 
  804ac4:	55                   	push   rbp
  804ac5:	48 89 e5             	mov    rbp,rsp
  804ac8:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804acb:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  804ace:	89 c8                	mov    eax,ecx
  804ad0:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  804ad4:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  804ad8:	48 8b 05 61 54 00 00 	mov    rax,QWORD PTR [rip+0x5461]        # 809f40 <gdt>
  804adf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  804ae3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804ae6:	48 c1 e0 04          	shl    rax,0x4
  804aea:	48 89 c2             	mov    rdx,rax
  804aed:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804af1:	48 01 d0             	add    rax,rdx
  804af4:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804af7:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  804afa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804afd:	48 c1 e0 04          	shl    rax,0x4
  804b01:	48 89 c2             	mov    rdx,rax
  804b04:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b08:	48 01 d0             	add    rax,rdx
  804b0b:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804b0e:	c1 ea 10             	shr    edx,0x10
  804b11:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  804b14:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b17:	48 c1 e0 04          	shl    rax,0x4
  804b1b:	48 89 c2             	mov    rdx,rax
  804b1e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b22:	48 01 c2             	add    rdx,rax
  804b25:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  804b29:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  804b2d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b30:	48 c1 e0 04          	shl    rax,0x4
  804b34:	48 89 c2             	mov    rdx,rax
  804b37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b3b:	48 01 c2             	add    rdx,rax
  804b3e:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  804b42:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  804b46:	90                   	nop
  804b47:	5d                   	pop    rbp
  804b48:	c3                   	ret    

0000000000804b49 <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  804b49:	f3 0f 1e fa          	endbr64 
  804b4d:	55                   	push   rbp
  804b4e:	48 89 e5             	mov    rbp,rsp
  804b51:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  804b54:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  804b57:	89 d0                	mov    eax,edx
  804b59:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  804b5d:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    desc->base_lo16=base&0xffff;
  804b61:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b64:	89 c2                	mov    edx,eax
  804b66:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b6a:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    desc->base_mid8=(base>>16)&0xff;
  804b6e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b71:	c1 e8 10             	shr    eax,0x10
  804b74:	89 c2                	mov    edx,eax
  804b76:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b7a:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    desc->base_hi8=(base>>24)&0xff;
  804b7d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b80:	c1 e8 18             	shr    eax,0x18
  804b83:	89 c2                	mov    edx,eax
  804b85:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b89:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    desc->limit_lo16=limit&0xffff;
  804b8c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804b8f:	89 c2                	mov    edx,eax
  804b91:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b95:	66 89 10             	mov    WORD PTR [rax],dx
    desc->attr=attr|(limit>>16&0xf)<<8;
  804b98:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804b9b:	c1 e8 10             	shr    eax,0x10
  804b9e:	c1 e0 08             	shl    eax,0x8
  804ba1:	66 25 00 0f          	and    ax,0xf00
  804ba5:	66 0b 45 f4          	or     ax,WORD PTR [rbp-0xc]
  804ba9:	89 c2                	mov    edx,eax
  804bab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804baf:	66 89 50 05          	mov    WORD PTR [rax+0x5],dx
  804bb3:	90                   	nop
  804bb4:	5d                   	pop    rbp
  804bb5:	c3                   	ret    
  804bb6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  804bbd:	00 00 00 

0000000000804bc0 <fill_desc>:
  804bc0:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  804bc5:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  804bca:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  804bcf:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  804bd4:	be 00 60 00 00       	mov    esi,0x6000
  804bd9:	c1 e2 03             	shl    edx,0x3
  804bdc:	01 d6                	add    esi,edx
  804bde:	66 67 89 1e          	mov    WORD PTR [esi],bx
  804be2:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  804be7:	c1 e8 10             	shr    eax,0x10
  804bea:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  804bee:	c1 eb 10             	shr    ebx,0x10
  804bf1:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  804bf5:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  804bf9:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  804bfd:	c3                   	ret    

0000000000804bfe <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  804bfe:	f3 0f 1e fa          	endbr64 
  804c02:	55                   	push   rbp
  804c03:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  804c06:	b8 00 00 00 00       	mov    eax,0x0
  804c0b:	e8 3e 17 00 00       	call   80634e <execute_request>
    do_req();
  804c10:	b8 00 00 00 00       	mov    eax,0x0
  804c15:	e8 ec ea ff ff       	call   803706 <do_req>
    if(!manage_proc_lock)
  804c1a:	8b 05 c8 52 00 00    	mov    eax,DWORD PTR [rip+0x52c8]        # 809ee8 <manage_proc_lock>
  804c20:	85 c0                	test   eax,eax
  804c22:	75 0a                	jne    804c2e <clock_c+0x30>
    {
        manage_proc();
  804c24:	b8 00 00 00 00       	mov    eax,0x0
  804c29:	e8 b3 f0 ff ff       	call   803ce1 <manage_proc>
    }
    //puts("1 disk req executed.");
  804c2e:	90                   	nop
  804c2f:	5d                   	pop    rbp
  804c30:	c3                   	ret    
  804c31:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  804c38:	00 00 00 
  804c3b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000804c40 <clock>:
  804c40:	b0 20                	mov    al,0x20
  804c42:	e6 a0                	out    0xa0,al
  804c44:	e6 20                	out    0x20,al
  804c46:	e8 b3 ff ff ff       	call   804bfe <clock_c>
  804c4b:	48 cf                	iretq  

0000000000804c4d <execute>:
    return ind;
}
*/

int execute(char *path)
{
  804c4d:	f3 0f 1e fa          	endbr64 
  804c51:	55                   	push   rbp
  804c52:	48 89 e5             	mov    rbp,rsp
  804c55:	48 83 ec 30          	sub    rsp,0x30
  804c59:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  804c5d:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  804c64:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, 1)) == -1)return -1;
  804c6b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804c6f:	be 01 00 00 00       	mov    esi,0x1
  804c74:	48 89 c7             	mov    rdi,rax
  804c77:	e8 7d cd ff ff       	call   8019f9 <sys_open>
  804c7c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  804c7f:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804c83:	75 0a                	jne    804c8f <execute+0x42>
  804c85:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804c8a:	e9 b7 00 00 00       	jmp    804d46 <execute+0xf9>
    //
    char *p=path;
  804c8f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804c93:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  804c97:	eb 05                	jmp    804c9e <execute+0x51>
  804c99:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  804c9e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ca2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804ca5:	84 c0                	test   al,al
  804ca7:	75 f0                	jne    804c99 <execute+0x4c>
    for(;*p!='/'&&p>path;p--);
  804ca9:	eb 05                	jmp    804cb0 <execute+0x63>
  804cab:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  804cb0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804cb4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804cb7:	3c 2f                	cmp    al,0x2f
  804cb9:	74 0a                	je     804cc5 <execute+0x78>
  804cbb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804cbf:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804cc3:	77 e6                	ja     804cab <execute+0x5e>
    if(p>path)
  804cc5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804cc9:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804ccd:	76 2f                	jbe    804cfe <execute+0xb1>
    {
        *p='\0';
  804ccf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804cd3:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, 1)) == -1)return -1;
  804cd6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804cda:	be 01 00 00 00       	mov    esi,0x1
  804cdf:	48 89 c7             	mov    rdi,rax
  804ce2:	e8 12 cd ff ff       	call   8019f9 <sys_open>
  804ce7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  804cea:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  804cee:	75 07                	jne    804cf7 <execute+0xaa>
  804cf0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804cf5:	eb 4f                	jmp    804d46 <execute+0xf9>
        *p='/';
  804cf7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804cfb:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern vfs_dir_entry opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  804cfe:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804d01:	48 63 d0             	movsxd rdx,eax
  804d04:	48 89 d0             	mov    rax,rdx
  804d07:	48 01 c0             	add    rax,rax
  804d0a:	48 01 d0             	add    rax,rdx
  804d0d:	48 c1 e0 05          	shl    rax,0x5
  804d11:	48 8d 90 60 07 40 00 	lea    rdx,[rax+0x400760]
  804d18:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d1b:	48 63 c8             	movsxd rcx,eax
  804d1e:	48 89 c8             	mov    rax,rcx
  804d21:	48 01 c0             	add    rax,rax
  804d24:	48 01 c8             	add    rax,rcx
  804d27:	48 c1 e0 05          	shl    rax,0x5
  804d2b:	48 05 60 07 40 00    	add    rax,0x400760
  804d31:	b9 b0 4d 80 00       	mov    ecx,0x804db0
  804d36:	48 89 c6             	mov    rsi,rax
  804d39:	89 cf                	mov    edi,ecx
  804d3b:	e8 24 f8 ff ff       	call   804564 <reg_proc>
  804d40:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  804d43:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  804d46:	c9                   	leave  
  804d47:	c3                   	ret    

0000000000804d48 <exec_call>:

int exec_call(char *path)
{
  804d48:	f3 0f 1e fa          	endbr64 
  804d4c:	55                   	push   rbp
  804d4d:	48 89 e5             	mov    rbp,rsp
  804d50:	48 83 ec 20          	sub    rsp,0x20
  804d54:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi=execute(path);
  804d58:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804d5c:	48 89 c7             	mov    rdi,rax
  804d5f:	e8 e9 fe ff ff       	call   804c4d <execute>
  804d64:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  804d67:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d6a:	01 c0                	add    eax,eax
  804d6c:	83 c0 05             	add    eax,0x5
  804d6f:	c1 e0 03             	shl    eax,0x3
  804d72:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  804d75:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d78:	89 c7                	mov    edi,eax
  804d7a:	e8 83 f0 ff ff       	call   803e02 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  804d7f:	90                   	nop
  804d80:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d83:	48 98                	cdqe   
  804d85:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804d8c:	48 05 a0 85 40 00    	add    rax,0x4085a0
  804d92:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804d95:	83 f8 03             	cmp    eax,0x3
  804d98:	75 e6                	jne    804d80 <exec_call+0x38>
    return task[pi].exit_code;
  804d9a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d9d:	48 98                	cdqe   
  804d9f:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804da6:	48 05 b0 85 40 00    	add    rax,0x4085b0
  804dac:	8b 00                	mov    eax,DWORD PTR [rax]
}
  804dae:	c9                   	leave  
  804daf:	c3                   	ret    

0000000000804db0 <proc_start>:
int proc_start()
{
  804db0:	f3 0f 1e fa          	endbr64 
  804db4:	55                   	push   rbp
  804db5:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  804db8:	8b 05 b2 d3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d3b2]        # 412170 <cur_proc>
  804dbe:	48 98                	cdqe   
  804dc0:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  804dc7:	48 05 a0 85 40 00    	add    rax,0x4085a0
  804dcd:	48 89 c7             	mov    rdi,rax
  804dd0:	e8 1a 00 00 00       	call   804def <load_pe>
    //释放进程资源
    del_proc(cur_proc);
  804dd5:	8b 05 95 d3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d395]        # 412170 <cur_proc>
  804ddb:	89 c7                	mov    edi,eax
  804ddd:	e8 5f f5 ff ff       	call   804341 <del_proc>
    switch_proc_tss(0);
  804de2:	bf 00 00 00 00       	mov    edi,0x0
  804de7:	e8 16 f0 ff ff       	call   803e02 <switch_proc_tss>
}
  804dec:	90                   	nop
  804ded:	5d                   	pop    rbp
  804dee:	c3                   	ret    

0000000000804def <load_pe>:
//在cr3切换到目标进程下的加载程序(但进程还没调度到那里)。
int load_pe(struct process *proc)
{
  804def:	f3 0f 1e fa          	endbr64 
  804df3:	55                   	push   rbp
  804df4:	48 89 e5             	mov    rbp,rsp
  804df7:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  804dfe:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    vfs_dir_entry *f=proc->exef;
  804e05:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  804e0c:	48 8b 80 94 00 00 00 	mov    rax,QWORD PTR [rax+0x94]
  804e13:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=f->fno;
  804e17:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  804e1b:	8b 00                	mov    eax,DWORD PTR [rax]
  804e1d:	89 45 94             	mov    DWORD PTR [rbp-0x6c],eax

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  804e20:	48 8d 8d 70 fe ff ff 	lea    rcx,[rbp-0x190]
  804e27:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804e2a:	ba 44 00 00 00       	mov    edx,0x44
  804e2f:	48 89 ce             	mov    rsi,rcx
  804e32:	89 c7                	mov    edi,eax
  804e34:	e8 9f d1 ff ff       	call   801fd8 <sys_read>
    sys_seek(exefno,tdh.e_lfanew,SEEK_SET);
  804e39:	48 8b 85 ac fe ff ff 	mov    rax,QWORD PTR [rbp-0x154]
  804e40:	89 c1                	mov    ecx,eax
  804e42:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804e45:	ba 00 00 00 00       	mov    edx,0x0
  804e4a:	89 ce                	mov    esi,ecx
  804e4c:	89 c7                	mov    edi,eax
  804e4e:	e8 16 d2 ff ff       	call   802069 <sys_seek>
    sys_read(exefno, &tnth, sizeof(tnth));
  804e53:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  804e5a:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804e5d:	ba f8 00 00 00       	mov    edx,0xf8
  804e62:	48 89 ce             	mov    rsi,rcx
  804e65:	89 c7                	mov    edi,eax
  804e67:	e8 6c d1 ff ff       	call   801fd8 <sys_read>

    //是否需要移动base(先不检查)
    unsigned int nbase=tnth.OptionalHeader.ImageBase;
  804e6c:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  804e72:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  804e75:	8b 85 c0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x240]
  804e7b:	c1 e8 0c             	shr    eax,0xc
  804e7e:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
    //use_pgm_ava检查在页表中这个范围是否可用，可用就使用
    while(1)
    {
        cont:
        ;
        int pdei=nbase/PAGE_INDEX_SIZE;
  804e81:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804e84:	c1 e8 16             	shr    eax,0x16
  804e87:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
        int ptei=nbase%PAGE_INDEX_SIZE/PAGE_SIZE;
  804e8a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804e8d:	25 ff ff 3f 00       	and    eax,0x3fffff
  804e92:	c1 e8 0c             	shr    eax,0xc
  804e95:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
        int *pt=(proc->pdet[pdei]&0xfffff000);
  804e98:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  804e9f:	48 8b 90 84 00 00 00 	mov    rdx,QWORD PTR [rax+0x84]
  804ea6:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
  804ea9:	48 98                	cdqe   
  804eab:	48 c1 e0 02          	shl    rax,0x2
  804eaf:	48 01 d0             	add    rax,rdx
  804eb2:	8b 00                	mov    eax,DWORD PTR [rax]
  804eb4:	89 c0                	mov    eax,eax
  804eb6:	25 00 f0 ff ff       	and    eax,0xfffff000
  804ebb:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
        for(int i=0;i<pgn;i++)
  804ebf:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  804ec6:	eb 48                	jmp    804f10 <load_pe+0x121>
        {
            if(pt[ptei+i%1024]&PAGE_PRESENT&&pt!=NULL)
  804ec8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804ecb:	99                   	cdq    
  804ecc:	c1 ea 16             	shr    edx,0x16
  804ecf:	01 d0                	add    eax,edx
  804ed1:	25 ff 03 00 00       	and    eax,0x3ff
  804ed6:	29 d0                	sub    eax,edx
  804ed8:	89 c2                	mov    edx,eax
  804eda:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  804edd:	01 d0                	add    eax,edx
  804edf:	48 98                	cdqe   
  804ee1:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  804ee8:	00 
  804ee9:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  804eed:	48 01 d0             	add    rax,rdx
  804ef0:	8b 00                	mov    eax,DWORD PTR [rax]
  804ef2:	83 e0 01             	and    eax,0x1
  804ef5:	85 c0                	test   eax,eax
  804ef7:	74 13                	je     804f0c <load_pe+0x11d>
  804ef9:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
  804efe:	74 0c                	je     804f0c <load_pe+0x11d>
            {
                //移动base
                nbase+=0x1000;
  804f00:	81 45 fc 00 10 00 00 	add    DWORD PTR [rbp-0x4],0x1000
                goto cont;
  804f07:	e9 75 ff ff ff       	jmp    804e81 <load_pe+0x92>
        for(int i=0;i<pgn;i++)
  804f0c:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  804f10:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804f13:	3b 45 90             	cmp    eax,DWORD PTR [rbp-0x70]
  804f16:	7c b0                	jl     804ec8 <load_pe+0xd9>
            }
        }
        break;
  804f18:	90                   	nop
    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_seek(exefno,0,SEEK_SET);
  804f19:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804f1c:	ba 00 00 00 00       	mov    edx,0x0
  804f21:	be 00 00 00 00       	mov    esi,0x0
  804f26:	89 c7                	mov    edi,eax
  804f28:	e8 3c d1 ff ff       	call   802069 <sys_seek>
    sys_read(exefno, nbase, PAGE_SIZE);
  804f2d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804f30:	48 89 c1             	mov    rcx,rax
  804f33:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804f36:	ba 00 10 00 00       	mov    edx,0x1000
  804f3b:	48 89 ce             	mov    rsi,rcx
  804f3e:	89 c7                	mov    edi,eax
  804f40:	e8 93 d0 ff ff       	call   801fd8 <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  804f45:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804f48:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_NT_HEADERS32 nth=nbase+dosh->e_lfanew;
  804f4f:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804f52:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  804f59:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  804f5d:	48 01 d0             	add    rax,rdx
  804f60:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  804f67:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804f6e:	48 83 c0 04          	add    rax,0x4
  804f72:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  804f79:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804f80:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  804f83:	89 85 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],eax
    int page_count=prog_size/4096;
  804f89:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  804f8f:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804f95:	85 c0                	test   eax,eax
  804f97:	0f 48 c2             	cmovs  eax,edx
  804f9a:	c1 f8 0c             	sar    eax,0xc
  804f9d:	89 85 60 ff ff ff    	mov    DWORD PTR [rbp-0xa0],eax

    int shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  804fa3:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804faa:	8b 50 28             	mov    edx,DWORD PTR [rax+0x28]
  804fad:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804fb0:	01 d0                	add    eax,edx
  804fb2:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  804fb8:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  804fbe:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  804fc4:	85 c0                	test   eax,eax
  804fc6:	0f 48 c2             	cmovs  eax,edx
  804fc9:	c1 f8 0a             	sar    eax,0xa
  804fcc:	89 c1                	mov    ecx,eax
  804fce:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  804fd4:	99                   	cdq    
  804fd5:	c1 ea 16             	shr    edx,0x16
  804fd8:	01 d0                	add    eax,edx
  804fda:	25 ff 03 00 00       	and    eax,0x3ff
  804fdf:	29 d0                	sub    eax,edx
  804fe1:	01 c8                	add    eax,ecx
  804fe3:	85 c0                	test   eax,eax
  804fe5:	0f 95 c0             	setne  al
  804fe8:	0f b6 c0             	movzx  eax,al
  804feb:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  804ff1:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  804ff7:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  804ffd:	85 c0                	test   eax,eax
  804fff:	0f 48 c2             	cmovs  eax,edx
  805002:	c1 f8 16             	sar    eax,0x16
  805005:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  80500b:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805012:	89 c0                	mov    eax,eax
  805014:	48 05 f8 00 00 00    	add    rax,0xf8
  80501a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  80501e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805025:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  805029:	0f b7 d0             	movzx  edx,ax
  80502c:	89 d0                	mov    eax,edx
  80502e:	c1 e0 02             	shl    eax,0x2
  805031:	01 d0                	add    eax,edx
  805033:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  805036:	05 3c 01 00 00       	add    eax,0x13c
  80503b:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    int align=nth->OptionalHeader.FileAlignment;
  805041:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805048:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  80504b:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  805051:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805057:	99                   	cdq    
  805058:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  80505e:	89 d0                	mov    eax,edx
  805060:	85 c0                	test   eax,eax
  805062:	74 23                	je     805087 <load_pe+0x298>
  805064:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  80506a:	99                   	cdq    
  80506b:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  805071:	89 d1                	mov    ecx,edx
  805073:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805079:	29 c8                	sub    eax,ecx
  80507b:	89 c2                	mov    edx,eax
  80507d:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
  805083:	01 d0                	add    eax,edx
  805085:	eb 06                	jmp    80508d <load_pe+0x29e>
  805087:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  80508d:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  805093:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80509a:	eb 68                	jmp    805104 <load_pe+0x315>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  80509c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8050a0:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  8050a3:	25 00 00 00 02       	and    eax,0x2000000
  8050a8:	89 85 bc fe ff ff    	mov    DWORD PTR [rbp-0x144],eax
        if(disca)
  8050ae:	83 bd bc fe ff ff 00 	cmp    DWORD PTR [rbp-0x144],0x0
  8050b5:	75 43                	jne    8050fa <load_pe+0x30b>
            continue;
        //直接读，缺页内核解决
        sys_seek(exefno,psec->PointerToRawData,SEEK_SET);
  8050b7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8050bb:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8050be:	89 c1                	mov    ecx,eax
  8050c0:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8050c3:	ba 00 00 00 00       	mov    edx,0x0
  8050c8:	89 ce                	mov    esi,ecx
  8050ca:	89 c7                	mov    edi,eax
  8050cc:	e8 98 cf ff ff       	call   802069 <sys_seek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  8050d1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8050d5:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8050d8:	89 c2                	mov    edx,eax
  8050da:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8050de:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
  8050e1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8050e4:	01 c8                	add    eax,ecx
  8050e6:	89 c0                	mov    eax,eax
  8050e8:	48 89 c1             	mov    rcx,rax
  8050eb:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8050ee:	48 89 ce             	mov    rsi,rcx
  8050f1:	89 c7                	mov    edi,eax
  8050f3:	e8 e0 ce ff ff       	call   801fd8 <sys_read>
  8050f8:	eb 01                	jmp    8050fb <load_pe+0x30c>
            continue;
  8050fa:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  8050fb:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8050ff:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  805104:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80510b:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  80510f:	0f b7 c0             	movzx  eax,ax
  805112:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805115:	7c 85                	jl     80509c <load_pe+0x2ad>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  805117:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80511e:	48 83 e8 80          	sub    rax,0xffffffffffffff80
  805122:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    if(impd->Size>0)
  805129:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  805130:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805133:	85 c0                	test   eax,eax
  805135:	0f 84 71 02 00 00    	je     8053ac <load_pe+0x5bd>
    {
        int tmpi=impd->VirtualAddress+nbase;
  80513b:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  805142:	8b 10                	mov    edx,DWORD PTR [rax]
  805144:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805147:	01 d0                	add    eax,edx
  805149:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  80514f:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  805155:	48 98                	cdqe   
  805157:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  80515b:	e9 3e 02 00 00       	jmp    80539e <load_pe+0x5af>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  805160:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805164:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  805167:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80516a:	01 d0                	add    eax,edx
  80516c:	89 c0                	mov    eax,eax
  80516e:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  805175:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80517c:	be 68 1a 81 00       	mov    esi,0x811a68
  805181:	48 89 c7             	mov    rdi,rax
  805184:	e8 5b 46 00 00       	call   8097e4 <strcmp>
  805189:	85 c0                	test   eax,eax
  80518b:	75 09                	jne    805196 <load_pe+0x3a7>
            {
                dllp=0x1c00000;
  80518d:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  805194:	eb 25                	jmp    8051bb <load_pe+0x3cc>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  805196:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  80519d:	48 89 c7             	mov    rdi,rax
  8051a0:	e8 4a fc ff ff       	call   804def <load_pe>
  8051a5:	89 85 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  8051ab:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  8051b1:	89 c7                	mov    edi,eax
  8051b3:	e8 c9 03 00 00       	call   805581 <get_module_addr>
  8051b8:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  8051bb:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8051be:	48 98                	cdqe   
  8051c0:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  8051c7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8051ca:	48 63 d0             	movsxd rdx,eax
  8051cd:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  8051d4:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  8051d8:	48 01 d0             	add    rax,rdx
  8051db:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  8051e2:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8051e9:	8b 50 78             	mov    edx,DWORD PTR [rax+0x78]
  8051ec:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8051ef:	01 d0                	add    eax,edx
  8051f1:	89 c0                	mov    eax,eax
  8051f3:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
            int funcn=dllexp->NumberOfNames;
  8051fa:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805201:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  805204:	89 85 0c ff ff ff    	mov    DWORD PTR [rbp-0xf4],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  80520a:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805211:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  805214:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805217:	01 d0                	add    eax,edx
  805219:	89 c0                	mov    eax,eax
  80521b:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  805222:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805229:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80522c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80522f:	01 d0                	add    eax,edx
  805231:	89 c0                	mov    eax,eax
  805233:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  80523a:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805241:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  805244:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805247:	01 d0                	add    eax,edx
  805249:	89 c0                	mov    eax,eax
  80524b:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  805252:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805259:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80525c:	89 85 ec fe ff ff    	mov    DWORD PTR [rbp-0x114],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  805262:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805266:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  805269:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80526c:	01 d0                	add    eax,edx
  80526e:	89 c0                	mov    eax,eax
  805270:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  805274:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805278:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  80527b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80527e:	01 d0                	add    eax,edx
  805280:	89 c0                	mov    eax,eax
  805282:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  805286:	e9 00 01 00 00       	jmp    80538b <load_pe+0x59c>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  80528b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80528f:	8b 00                	mov    eax,DWORD PTR [rax]
  805291:	85 c0                	test   eax,eax
  805293:	79 43                	jns    8052d8 <load_pe+0x4e9>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  805295:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805299:	8b 00                	mov    eax,DWORD PTR [rax]
  80529b:	25 ff ff ff 7f       	and    eax,0x7fffffff
  8052a0:	2b 85 ec fe ff ff    	sub    eax,DWORD PTR [rbp-0x114]
  8052a6:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  8052ac:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  8052b2:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8052b9:	00 
  8052ba:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8052c1:	48 01 d0             	add    rax,rdx
  8052c4:	8b 10                	mov    edx,DWORD PTR [rax]
  8052c6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8052c9:	01 d0                	add    eax,edx
  8052cb:	89 c2                	mov    edx,eax
  8052cd:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8052d1:	89 10                	mov    DWORD PTR [rax],edx
  8052d3:	e9 a9 00 00 00       	jmp    805381 <load_pe+0x592>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  8052d8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8052dc:	8b 00                	mov    eax,DWORD PTR [rax]
  8052de:	89 c0                	mov    eax,eax
  8052e0:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  8052e7:	48 83 85 e0 fe ff ff 	add    QWORD PTR [rbp-0x120],0x2
  8052ee:	02 
                    int i=0;
  8052ef:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  8052f6:	eb 7a                	jmp    805372 <load_pe+0x583>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  8052f8:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8052fb:	48 98                	cdqe   
  8052fd:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  805304:	00 
  805305:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  80530c:	48 01 d0             	add    rax,rdx
  80530f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  805312:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
  805319:	48 89 d6             	mov    rsi,rdx
  80531c:	48 89 c7             	mov    rdi,rax
  80531f:	e8 c0 44 00 00       	call   8097e4 <strcmp>
  805324:	85 c0                	test   eax,eax
  805326:	75 46                	jne    80536e <load_pe+0x57f>
                        {
                            int ordi=funcords[i];
  805328:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80532b:	48 98                	cdqe   
  80532d:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  805331:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  805338:	48 01 d0             	add    rax,rdx
  80533b:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80533e:	98                   	cwde   
  80533f:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  805345:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
  80534b:	48 98                	cdqe   
  80534d:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805354:	00 
  805355:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80535c:	48 01 d0             	add    rax,rdx
  80535f:	8b 10                	mov    edx,DWORD PTR [rax]
  805361:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805364:	01 d0                	add    eax,edx
  805366:	89 c2                	mov    edx,eax
  805368:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80536c:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  80536e:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  805372:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  805375:	3b 85 0c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xf4]
  80537b:	0f 8c 77 ff ff ff    	jl     8052f8 <load_pe+0x509>
                        }
                    }
                }
                iataddrs++;
  805381:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  805386:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  80538b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80538f:	8b 00                	mov    eax,DWORD PTR [rax]
  805391:	85 c0                	test   eax,eax
  805393:	0f 85 f2 fe ff ff    	jne    80528b <load_pe+0x49c>
            }
            impdes++;
  805399:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  80539e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8053a2:	8b 00                	mov    eax,DWORD PTR [rax]
  8053a4:	85 c0                	test   eax,eax
  8053a6:	0f 85 b4 fd ff ff    	jne    805160 <load_pe+0x371>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  8053ac:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  8053b3:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  8053b4:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8053bb:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [rax+0xa4]
  8053c1:	85 c0                	test   eax,eax
  8053c3:	0f 84 e8 00 00 00    	je     8054b1 <load_pe+0x6c2>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  8053c9:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8053d0:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [rax+0xa0]
  8053d6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053d9:	01 d0                	add    eax,edx
  8053db:	89 c0                	mov    eax,eax
  8053dd:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                                +(u32)nbase);
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  8053e1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8053e5:	48 83 c0 40          	add    rax,0x40
  8053e9:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  8053ed:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8053f1:	48 83 c0 02          	add    rax,0x2
  8053f5:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  8053f9:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805400:	8b 40 34             	mov    eax,DWORD PTR [rax+0x34]
  805403:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
        while(relp->VirtualAddress){
  805409:	e9 95 00 00 00       	jmp    8054a3 <load_pe+0x6b4>
            int pgva=relp->VirtualAddress+nbase;
  80540e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805412:	8b 10                	mov    edx,DWORD PTR [rax]
  805414:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805417:	01 d0                	add    eax,edx
  805419:	89 85 d0 fe ff ff    	mov    DWORD PTR [rbp-0x130],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  80541f:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  805426:	eb 59                	jmp    805481 <load_pe+0x692>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  805428:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80542c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80542f:	66 85 c0             	test   ax,ax
  805432:	74 48                	je     80547c <load_pe+0x68d>
                int *at=*reloc+pgva;//要重定位的数据的地址
  805434:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805438:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80543b:	0f b7 d0             	movzx  edx,ax
  80543e:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  805444:	01 d0                	add    eax,edx
  805446:	48 98                	cdqe   
  805448:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
                *at=*at-old_base+nbase;
  80544f:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  805456:	8b 00                	mov    eax,DWORD PTR [rax]
  805458:	2b 85 d4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x12c]
  80545e:	89 c2                	mov    edx,eax
  805460:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805463:	01 d0                	add    eax,edx
  805465:	89 c2                	mov    edx,eax
  805467:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  80546e:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  805470:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  805475:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  80547a:	eb 01                	jmp    80547d <load_pe+0x68e>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  80547c:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  80547d:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  805481:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805485:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805488:	c1 e8 02             	shr    eax,0x2
  80548b:	89 c2                	mov    edx,eax
  80548d:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  805490:	39 c2                	cmp    edx,eax
  805492:	77 94                	ja     805428 <load_pe+0x639>
            }
            relp=(int)relp+0x1000;
  805494:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805498:	05 00 10 00 00       	add    eax,0x1000
  80549d:	48 98                	cdqe   
  80549f:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  8054a3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8054a7:	8b 00                	mov    eax,DWORD PTR [rax]
  8054a9:	85 c0                	test   eax,eax
  8054ab:	0f 85 5d ff ff ff    	jne    80540e <load_pe+0x61f>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  8054b1:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  8054b8:	00 00 00 
  8054bb:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  8054c2:	00 00 00 
  8054c5:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  8054cc:	00 00 00 00 
  8054d0:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  8054d7:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  8054db:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  8054e2:	ba 18 00 00 00       	mov    edx,0x18
  8054e7:	48 89 c6             	mov    rsi,rax
  8054ea:	bf 00 00 00 01       	mov    edi,0x1000000
  8054ef:	e8 52 40 00 00       	call   809546 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  8054f4:	8b 05 76 cc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cc76]        # 412170 <cur_proc>
  8054fa:	48 98                	cdqe   
  8054fc:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  805503:	48 05 b0 85 40 00    	add    rax,0x4085b0
  805509:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  805510:	8b 05 5a cc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cc5a]        # 412170 <cur_proc>
  805516:	48 98                	cdqe   
  805518:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  80551f:	48 05 b0 85 40 00    	add    rax,0x4085b0
  805525:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  80552c:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  805532:	48 98                	cdqe   
  805534:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
    task[cur_proc].exit_code=main(0,NULL);
  80553b:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
  805542:	be 00 00 00 00       	mov    esi,0x0
  805547:	bf 00 00 00 00       	mov    edi,0x0
  80554c:	ff d0                	call   rax
  80554e:	8b 15 1c cc c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0cc1c]        # 412170 <cur_proc>
  805554:	89 c1                	mov    ecx,eax
  805556:	48 63 c2             	movsxd rax,edx
  805559:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  805560:	48 05 b0 85 40 00    	add    rax,0x4085b0
  805566:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  805568:	8b 05 02 cc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cc02]        # 412170 <cur_proc>
  80556e:	48 98                	cdqe   
  805570:	48 69 c0 6c 02 00 00 	imul   rax,rax,0x26c
  805577:	48 05 b0 85 40 00    	add    rax,0x4085b0
  80557d:	8b 00                	mov    eax,DWORD PTR [rax]
}
  80557f:	c9                   	leave  
  805580:	c3                   	ret    

0000000000805581 <get_module_addr>:

int get_module_addr(int mi)
{
  805581:	f3 0f 1e fa          	endbr64 
  805585:	55                   	push   rbp
  805586:	48 89 e5             	mov    rbp,rsp
  805589:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  80558c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80558f:	48 98                	cdqe   
  805591:	8b 04 c5 80 4d 42 00 	mov    eax,DWORD PTR [rax*8+0x424d80]
}
  805598:	5d                   	pop    rbp
  805599:	c3                   	ret    

000000000080559a <dispose_library>:
int dispose_library(int dlln)
{
  80559a:	f3 0f 1e fa          	endbr64 
  80559e:	55                   	push   rbp
  80559f:	48 89 e5             	mov    rbp,rsp
  8055a2:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  8055a5:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8055a9:	78 09                	js     8055b4 <dispose_library+0x1a>
  8055ab:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  8055b2:	7e 07                	jle    8055bb <dispose_library+0x21>
  8055b4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8055b9:	eb 1d                	jmp    8055d8 <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  8055bb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8055be:	48 98                	cdqe   
  8055c0:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  8055c7:	48 05 88 21 41 00    	add    rax,0x412188
  8055cd:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  8055d3:	b8 00 00 00 00       	mov    eax,0x0
}
  8055d8:	5d                   	pop    rbp
  8055d9:	c3                   	ret    

00000000008055da <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  8055da:	f3 0f 1e fa          	endbr64 
  8055de:	55                   	push   rbp
  8055df:	48 89 e5             	mov    rbp,rsp
  8055e2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  8055e6:	90                   	nop
  8055e7:	5d                   	pop    rbp
  8055e8:	c3                   	ret    

00000000008055e9 <sys_rmmod>:
int sys_rmmod(char *name)
{
  8055e9:	f3 0f 1e fa          	endbr64 
  8055ed:	55                   	push   rbp
  8055ee:	48 89 e5             	mov    rbp,rsp
  8055f1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  8055f5:	90                   	nop
  8055f6:	5d                   	pop    rbp
  8055f7:	c3                   	ret    
  8055f8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  8055ff:	00 

0000000000805600 <_syscall>:
  805600:	57                   	push   rdi
  805601:	56                   	push   rsi
  805602:	52                   	push   rdx
  805603:	51                   	push   rcx
  805604:	53                   	push   rbx
  805605:	50                   	push   rax
  805606:	e8 63 af ff ff       	call   80056e <syscall>
  80560b:	48 83 c4 18          	add    rsp,0x18
  80560f:	cf                   	iret   

0000000000805610 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  805610:	f3 0f 1e fa          	endbr64 
  805614:	55                   	push   rbp
  805615:	48 89 e5             	mov    rbp,rsp
  805618:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  80561c:	8b 05 72 fb c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fb72]        # 425194 <framebuffer+0x14>
  805622:	89 c0                	mov    eax,eax
  805624:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  805628:	8b 05 6a fb c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fb6a]        # 425198 <framebuffer+0x18>
  80562e:	89 c0                	mov    eax,eax
  805630:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  805634:	0f b6 05 61 fb c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fb61]        # 42519c <framebuffer+0x1c>
  80563b:	c0 e8 03             	shr    al,0x3
  80563e:	0f b6 c0             	movzx  eax,al
  805641:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  805645:	8b 05 45 fb c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fb45]        # 425190 <framebuffer+0x10>
  80564b:	89 c0                	mov    eax,eax
  80564d:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  805651:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805655:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  80565a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  80565e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805662:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  805667:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  80566b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80566f:	48 c1 e8 0c          	shr    rax,0xc
  805673:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  805676:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  80567d:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  80567e:	48 8b 05 03 fb c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1fb03]        # 425188 <framebuffer+0x8>
  805685:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  805689:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  805690:	00 
  805691:	eb 2d                	jmp    8056c0 <init_framebuffer+0xb0>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  805693:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  805697:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80569b:	ba 07 00 00 00       	mov    edx,0x7
  8056a0:	48 89 ce             	mov    rsi,rcx
  8056a3:	48 89 c7             	mov    rdi,rax
  8056a6:	e8 a3 b7 ff ff       	call   800e4e <mmap>
        pp+=PAGE_SIZE;
  8056ab:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  8056b2:	00 
        p+=PAGE_SIZE;
  8056b3:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  8056ba:	00 
    for (size_t i = 0; i < pgc; i++)
  8056bb:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  8056c0:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8056c3:	48 98                	cdqe   
  8056c5:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  8056c9:	72 c8                	jb     805693 <init_framebuffer+0x83>
    }
    
    
}
  8056cb:	90                   	nop
  8056cc:	90                   	nop
  8056cd:	c9                   	leave  
  8056ce:	c3                   	ret    

00000000008056cf <init_font>:
void init_font(){
  8056cf:	f3 0f 1e fa          	endbr64 
  8056d3:	55                   	push   rbp
  8056d4:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  8056d7:	48 c7 05 de fa c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1fade],0x80a108        # 4251c0 <boot_font>
  8056de:	08 a1 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  8056e2:	48 8b 05 d7 fa c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1fad7]        # 4251c0 <boot_font>
  8056e9:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  8056ec:	83 c0 07             	add    eax,0x7
  8056ef:	c1 e8 03             	shr    eax,0x3
  8056f2:	89 05 d8 fa c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fad8],eax        # 4251d0 <font_width_bytes>
    font_width = font_width_bytes * 8;
  8056f8:	8b 05 d2 fa c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fad2]        # 4251d0 <font_width_bytes>
  8056fe:	c1 e0 03             	shl    eax,0x3
  805701:	89 05 c1 fa c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fac1],eax        # 4251c8 <font_width>
    font_height = boot_font->height;
  805707:	48 8b 05 b2 fa c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1fab2]        # 4251c0 <boot_font>
  80570e:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  805711:	89 05 b5 fa c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fab5],eax        # 4251cc <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  805717:	48 8b 05 a2 fa c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1faa2]        # 4251c0 <boot_font>
  80571e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  805721:	89 c0                	mov    eax,eax
  805723:	48 05 08 a1 80 00    	add    rax,0x80a108
  805729:	48 89 05 a8 fa c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1faa8],rax        # 4251d8 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  805730:	48 8b 05 89 fa c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1fa89]        # 4251c0 <boot_font>
  805737:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80573a:	89 05 a4 fa c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1faa4],eax        # 4251e4 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  805740:	48 8b 05 79 fa c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1fa79]        # 4251c0 <boot_font>
  805747:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  80574a:	89 05 90 fa c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fa90],eax        # 4251e0 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  805750:	c7 05 56 fa c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1fa56],0x0        # 4251b0 <fb_cursor_y>
  805757:	00 00 00 
  80575a:	8b 05 50 fa c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1fa50]        # 4251b0 <fb_cursor_y>
  805760:	89 05 46 fa c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fa46],eax        # 4251ac <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width *framebuffer.common.framebuffer_bpp/8 / font_width;
  805766:	8b 15 28 fa c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1fa28]        # 425194 <framebuffer+0x14>
  80576c:	0f b6 05 29 fa c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fa29]        # 42519c <framebuffer+0x1c>
  805773:	0f b6 c0             	movzx  eax,al
  805776:	0f af c2             	imul   eax,edx
  805779:	c1 e8 03             	shr    eax,0x3
  80577c:	8b 0d 46 fa c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1fa46]        # 4251c8 <font_width>
  805782:	ba 00 00 00 00       	mov    edx,0x0
  805787:	f7 f1                	div    ecx
  805789:	89 05 25 fa c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fa25],eax        # 4251b4 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height *framebuffer.common.framebuffer_bpp/8 / font_height;
  80578f:	8b 15 03 fa c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1fa03]        # 425198 <framebuffer+0x18>
  805795:	0f b6 05 00 fa c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fa00]        # 42519c <framebuffer+0x1c>
  80579c:	0f b6 c0             	movzx  eax,al
  80579f:	0f af c2             	imul   eax,edx
  8057a2:	c1 e8 03             	shr    eax,0x3
  8057a5:	8b 35 21 fa c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1fa21]        # 4251cc <font_height>
  8057ab:	ba 00 00 00 00       	mov    edx,0x0
  8057b0:	f7 f6                	div    esi
  8057b2:	89 05 00 fa c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1fa00],eax        # 4251b8 <max_ch_nr_y>
    font_size=1;
  8057b8:	c7 05 86 47 00 00 01 	mov    DWORD PTR [rip+0x4786],0x1        # 809f48 <font_size>
  8057bf:	00 00 00 
}
  8057c2:	90                   	nop
  8057c3:	5d                   	pop    rbp
  8057c4:	c3                   	ret    

00000000008057c5 <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  8057c5:	f3 0f 1e fa          	endbr64 
  8057c9:	55                   	push   rbp
  8057ca:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  8057cd:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  8057d1:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8057d5:	48 89 05 a4 f9 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f9a4],rax        # 425180 <framebuffer>
  8057dc:	48 89 15 a5 f9 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f9a5],rdx        # 425188 <framebuffer+0x8>
  8057e3:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  8057e7:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  8057eb:	48 89 05 9e f9 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f99e],rax        # 425190 <framebuffer+0x10>
  8057f2:	48 89 15 9f f9 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f99f],rdx        # 425198 <framebuffer+0x18>
  8057f9:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  8057fd:	48 89 05 9c f9 c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1f99c],rax        # 4251a0 <framebuffer+0x20>
}
  805804:	90                   	nop
  805805:	5d                   	pop    rbp
  805806:	c3                   	ret    

0000000000805807 <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  805807:	f3 0f 1e fa          	endbr64 
  80580b:	55                   	push   rbp
  80580c:	48 89 e5             	mov    rbp,rsp
  80580f:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  805812:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805815:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805818:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  80581b:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  80581f:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  805826:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  805827:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80582a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  80582d:	eb 64                	jmp    805893 <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  80582f:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805832:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  805835:	eb 4b                	jmp    805882 <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805837:	8b 15 53 f9 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f953]        # 425190 <framebuffer+0x10>
  80583d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805840:	0f af c2             	imul   eax,edx
  805843:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  805845:	0f b6 05 50 f9 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f950]        # 42519c <framebuffer+0x1c>
  80584c:	0f b6 c0             	movzx  eax,al
  80584f:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805853:	8d 50 07             	lea    edx,[rax+0x7]
  805856:	85 c0                	test   eax,eax
  805858:	0f 48 c2             	cmovs  eax,edx
  80585b:	c1 f8 03             	sar    eax,0x3
  80585e:	48 98                	cdqe   
  805860:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805863:	48 05 00 00 00 40    	add    rax,0x40000000
  805869:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  80586d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805871:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  805875:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805879:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  80587c:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  80587e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805882:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805885:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805888:	01 d0                	add    eax,edx
  80588a:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  80588d:	7c a8                	jl     805837 <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  80588f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805893:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  805896:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805899:	01 d0                	add    eax,edx
  80589b:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80589e:	7c 8f                	jl     80582f <fill_rect+0x28>
        }
    }
}
  8058a0:	90                   	nop
  8058a1:	90                   	nop
  8058a2:	5d                   	pop    rbp
  8058a3:	c3                   	ret    

00000000008058a4 <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  8058a4:	f3 0f 1e fa          	endbr64 
  8058a8:	55                   	push   rbp
  8058a9:	48 89 e5             	mov    rbp,rsp
  8058ac:	48 83 ec 30          	sub    rsp,0x30
  8058b0:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8058b3:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8058b6:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8058b9:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  8058bd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8058c0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  8058c3:	eb 5a                	jmp    80591f <draw_text+0x7b>
    {
        if(*str=='\n')
  8058c5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8058c9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8058cc:	3c 0a                	cmp    al,0xa
  8058ce:	75 1c                	jne    8058ec <draw_text+0x48>
        {
            y+=font_height*size;
  8058d0:	8b 15 f6 f8 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f8f6]        # 4251cc <font_height>
  8058d6:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8058d9:	0f af d0             	imul   edx,eax
  8058dc:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8058df:	01 d0                	add    eax,edx
  8058e1:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  8058e4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8058e7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  8058ea:	eb 2e                	jmp    80591a <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  8058ec:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8058f0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8058f3:	0f be c8             	movsx  ecx,al
  8058f6:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8058f9:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  8058fc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058ff:	89 c7                	mov    edi,eax
  805901:	e8 28 00 00 00       	call   80592e <draw_letter>
            tx+=size*font_width;
  805906:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805909:	8b 05 b9 f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f8b9]        # 4251c8 <font_width>
  80590f:	0f af d0             	imul   edx,eax
  805912:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805915:	01 d0                	add    eax,edx
  805917:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  80591a:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  80591f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805923:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805926:	84 c0                	test   al,al
  805928:	75 9b                	jne    8058c5 <draw_text+0x21>
    }
}
  80592a:	90                   	nop
  80592b:	90                   	nop
  80592c:	c9                   	leave  
  80592d:	c3                   	ret    

000000000080592e <draw_letter>:
void draw_letter(int x, int y, int size, char c) {
  80592e:	f3 0f 1e fa          	endbr64 
  805932:	55                   	push   rbp
  805933:	48 89 e5             	mov    rbp,rsp
  805936:	48 83 ec 30          	sub    rsp,0x30
  80593a:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  80593d:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805940:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805943:	89 c8                	mov    eax,ecx
  805945:	88 45 d0             	mov    BYTE PTR [rbp-0x30],al
    u8 *glyph = glyph_table;
  805948:	48 8b 05 89 f8 c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1f889]        # 4251d8 <glyph_table>
  80594f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  805953:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805957:	8b 05 87 f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f887]        # 4251e4 <glyph_nr>
  80595d:	39 c2                	cmp    edx,eax
  80595f:	73 13                	jae    805974 <draw_letter+0x46>
        glyph += c * bytes_per_glyph;
  805961:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805965:	8b 05 75 f8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f875]        # 4251e0 <bytes_per_glyph>
  80596b:	0f af c2             	imul   eax,edx
  80596e:	89 c0                	mov    eax,eax
  805970:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805974:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80597b:	e9 c9 00 00 00       	jmp    805a49 <draw_letter+0x11b>
        u8 mask = 1 << 7;
  805980:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805984:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80598b:	e9 9a 00 00 00       	jmp    805a2a <draw_letter+0xfc>
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  805990:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805993:	c1 e8 03             	shr    eax,0x3
  805996:	89 c2                	mov    edx,eax
  805998:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80599c:	48 01 d0             	add    rax,rdx
  80599f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8059a2:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  8059a5:	84 c0                	test   al,al
  8059a7:	74 37                	je     8059e0 <draw_letter+0xb2>
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,-1);
  8059a9:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8059ac:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  8059b0:	89 c2                	mov    edx,eax
  8059b2:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8059b5:	01 d0                	add    eax,edx
  8059b7:	89 c6                	mov    esi,eax
  8059b9:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8059bc:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  8059c0:	89 c2                	mov    edx,eax
  8059c2:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8059c5:	01 d0                	add    eax,edx
  8059c7:	89 c7                	mov    edi,eax
  8059c9:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  8059cc:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8059cf:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
  8059d5:	89 d1                	mov    ecx,edx
  8059d7:	89 c2                	mov    edx,eax
  8059d9:	e8 29 fe ff ff       	call   805807 <fill_rect>
  8059de:	eb 35                	jmp    805a15 <draw_letter+0xe7>
            } else {
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,0);
  8059e0:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8059e3:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  8059e7:	89 c2                	mov    edx,eax
  8059e9:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8059ec:	01 d0                	add    eax,edx
  8059ee:	89 c6                	mov    esi,eax
  8059f0:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8059f3:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  8059f7:	89 c2                	mov    edx,eax
  8059f9:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8059fc:	01 d0                	add    eax,edx
  8059fe:	89 c7                	mov    edi,eax
  805a00:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805a03:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805a06:	41 b8 00 00 00 00    	mov    r8d,0x0
  805a0c:	89 d1                	mov    ecx,edx
  805a0e:	89 c2                	mov    edx,eax
  805a10:	e8 f2 fd ff ff       	call   805807 <fill_rect>
            }

            mask >>= 1;
  805a15:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  805a18:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805a1b:	83 e0 07             	and    eax,0x7
  805a1e:	85 c0                	test   eax,eax
  805a20:	75 04                	jne    805a26 <draw_letter+0xf8>
                mask = 1 << 7;
  805a22:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805a26:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805a2a:	8b 05 98 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f798]        # 4251c8 <font_width>
  805a30:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805a33:	0f 82 57 ff ff ff    	jb     805990 <draw_letter+0x62>
            }
        }

        glyph += font_width_bytes;
  805a39:	8b 05 91 f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f791]        # 4251d0 <font_width_bytes>
  805a3f:	89 c0                	mov    eax,eax
  805a41:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805a45:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805a49:	8b 05 7d f7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f77d]        # 4251cc <font_height>
  805a4f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  805a52:	0f 82 28 ff ff ff    	jb     805980 <draw_letter+0x52>
    }
}
  805a58:	90                   	nop
  805a59:	90                   	nop
  805a5a:	c9                   	leave  
  805a5b:	c3                   	ret    

0000000000805a5c <scr_up>:
//向上滚动一个像素
void scr_up(){
  805a5c:	f3 0f 1e fa          	endbr64 
  805a60:	55                   	push   rbp
  805a61:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805a64:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805a6b:	eb 6c                	jmp    805ad9 <scr_up+0x7d>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805a6d:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805a74:	eb 52                	jmp    805ac8 <scr_up+0x6c>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805a76:	8b 15 14 f7 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f714]        # 425190 <framebuffer+0x10>
  805a7c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a7f:	0f af c2             	imul   eax,edx
  805a82:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  805a84:	0f b6 05 11 f7 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f711]        # 42519c <framebuffer+0x1c>
  805a8b:	0f b6 c0             	movzx  eax,al
  805a8e:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805a92:	8d 50 07             	lea    edx,[rax+0x7]
  805a95:	85 c0                	test   eax,eax
  805a97:	0f 48 c2             	cmovs  eax,edx
  805a9a:	c1 f8 03             	sar    eax,0x3
  805a9d:	48 98                	cdqe   
  805a9f:	48 01 c8             	add    rax,rcx
  805aa2:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805aa8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  805aac:	8b 05 de f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f6de]        # 425190 <framebuffer+0x10>
  805ab2:	89 c2                	mov    edx,eax
  805ab4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805ab8:	48 01 d0             	add    rax,rdx
  805abb:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  805abe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805ac2:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805ac4:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805ac8:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805acb:	8b 05 e3 f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f6e3]        # 4251b4 <max_ch_nr_x>
  805ad1:	39 c2                	cmp    edx,eax
  805ad3:	72 a1                	jb     805a76 <scr_up+0x1a>
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805ad5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805ad9:	8b 05 d9 f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f6d9]        # 4251b8 <max_ch_nr_y>
  805adf:	8d 50 ff             	lea    edx,[rax-0x1]
  805ae2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805ae5:	39 c2                	cmp    edx,eax
  805ae7:	77 84                	ja     805a6d <scr_up+0x11>
        }

    }
}
  805ae9:	90                   	nop
  805aea:	90                   	nop
  805aeb:	5d                   	pop    rbp
  805aec:	c3                   	ret    

0000000000805aed <scr_down>:
void scr_down(){
  805aed:	f3 0f 1e fa          	endbr64 
  805af1:	55                   	push   rbp
  805af2:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  805af5:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  805afc:	eb 72                	jmp    805b70 <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805afe:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805b05:	eb 58                	jmp    805b5f <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805b07:	8b 15 83 f6 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f683]        # 425190 <framebuffer+0x10>
  805b0d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b10:	0f af c2             	imul   eax,edx
  805b13:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  805b15:	0f b6 05 80 f6 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f680]        # 42519c <framebuffer+0x1c>
  805b1c:	0f b6 c0             	movzx  eax,al
  805b1f:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805b23:	8d 50 07             	lea    edx,[rax+0x7]
  805b26:	85 c0                	test   eax,eax
  805b28:	0f 48 c2             	cmovs  eax,edx
  805b2b:	c1 f8 03             	sar    eax,0x3
  805b2e:	48 98                	cdqe   
  805b30:	48 01 c8             	add    rax,rcx
  805b33:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805b39:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  805b3d:	8b 05 4d f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f64d]        # 425190 <framebuffer+0x10>
  805b43:	89 c0                	mov    eax,eax
  805b45:	48 f7 d8             	neg    rax
  805b48:	48 89 c2             	mov    rdx,rax
  805b4b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805b4f:	48 01 d0             	add    rax,rdx
  805b52:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  805b55:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805b59:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805b5b:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805b5f:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805b62:	8b 05 4c f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f64c]        # 4251b4 <max_ch_nr_x>
  805b68:	39 c2                	cmp    edx,eax
  805b6a:	72 9b                	jb     805b07 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  805b6c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805b70:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  805b73:	8b 05 3f f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f63f]        # 4251b8 <max_ch_nr_y>
  805b79:	39 c2                	cmp    edx,eax
  805b7b:	72 81                	jb     805afe <scr_down+0x11>
        }

    }
}
  805b7d:	90                   	nop
  805b7e:	90                   	nop
  805b7f:	5d                   	pop    rbp
  805b80:	c3                   	ret    

0000000000805b81 <print>:
void print(char* s){
  805b81:	f3 0f 1e fa          	endbr64 
  805b85:	55                   	push   rbp
  805b86:	48 89 e5             	mov    rbp,rsp
  805b89:	48 83 ec 18          	sub    rsp,0x18
  805b8d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(;*s;s++){
  805b91:	e9 f7 00 00 00       	jmp    805c8d <print+0x10c>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  805b96:	8b 15 10 f6 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f610]        # 4251ac <fb_cursor_x>
  805b9c:	8b 05 12 f6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f612]        # 4251b4 <max_ch_nr_x>
  805ba2:	39 c2                	cmp    edx,eax
  805ba4:	77 0b                	ja     805bb1 <print+0x30>
  805ba6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805baa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805bad:	3c 0a                	cmp    al,0xa
  805baf:	75 19                	jne    805bca <print+0x49>
        {
            fb_cursor_y+=1;
  805bb1:	8b 05 f9 f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f5f9]        # 4251b0 <fb_cursor_y>
  805bb7:	83 c0 01             	add    eax,0x1
  805bba:	89 05 f0 f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f5f0],eax        # 4251b0 <fb_cursor_y>
            fb_cursor_x=0;
  805bc0:	c7 05 e2 f5 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1f5e2],0x0        # 4251ac <fb_cursor_x>
  805bc7:	00 00 00 
        }
        if(*s=='\n')continue;
  805bca:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805bce:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805bd1:	3c 0a                	cmp    al,0xa
  805bd3:	0f 84 ae 00 00 00    	je     805c87 <print+0x106>
        if(fb_cursor_y>=max_ch_nr_y){
  805bd9:	8b 15 d1 f5 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1f5d1]        # 4251b0 <fb_cursor_y>
  805bdf:	8b 05 d3 f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f5d3]        # 4251b8 <max_ch_nr_y>
  805be5:	39 c2                	cmp    edx,eax
  805be7:	72 3c                	jb     805c25 <print+0xa4>
            for(int i=0;i<font_height*font_size;i++)
  805be9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805bf0:	eb 0e                	jmp    805c00 <print+0x7f>
                scr_up();
  805bf2:	b8 00 00 00 00       	mov    eax,0x0
  805bf7:	e8 60 fe ff ff       	call   805a5c <scr_up>
            for(int i=0;i<font_height*font_size;i++)
  805bfc:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805c00:	8b 05 c6 f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f5c6]        # 4251cc <font_height>
  805c06:	8b 15 3c 43 00 00    	mov    edx,DWORD PTR [rip+0x433c]        # 809f48 <font_size>
  805c0c:	0f af d0             	imul   edx,eax
  805c0f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805c12:	39 c2                	cmp    edx,eax
  805c14:	77 dc                	ja     805bf2 <print+0x71>
            fb_cursor_y=max_ch_nr_y-1;
  805c16:	8b 05 9c f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f59c]        # 4251b8 <max_ch_nr_y>
  805c1c:	83 e8 01             	sub    eax,0x1
  805c1f:	89 05 8b f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f58b],eax        # 4251b0 <fb_cursor_y>
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  805c25:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805c29:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805c2c:	0f be d0             	movsx  edx,al
  805c2f:	8b 05 13 43 00 00    	mov    eax,DWORD PTR [rip+0x4313]        # 809f48 <font_size>
  805c35:	8b 35 75 f5 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1f575]        # 4251b0 <fb_cursor_y>
  805c3b:	8b 0d 8b f5 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f58b]        # 4251cc <font_height>
  805c41:	0f af ce             	imul   ecx,esi
  805c44:	8b 35 fe 42 00 00    	mov    esi,DWORD PTR [rip+0x42fe]        # 809f48 <font_size>
  805c4a:	0f af ce             	imul   ecx,esi
  805c4d:	41 89 c8             	mov    r8d,ecx
  805c50:	8b 35 56 f5 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1f556]        # 4251ac <fb_cursor_x>
  805c56:	8b 0d 6c f5 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1f56c]        # 4251c8 <font_width>
  805c5c:	0f af ce             	imul   ecx,esi
  805c5f:	8b 35 e3 42 00 00    	mov    esi,DWORD PTR [rip+0x42e3]        # 809f48 <font_size>
  805c65:	0f af ce             	imul   ecx,esi
  805c68:	89 cf                	mov    edi,ecx
  805c6a:	89 d1                	mov    ecx,edx
  805c6c:	89 c2                	mov    edx,eax
  805c6e:	44 89 c6             	mov    esi,r8d
  805c71:	e8 b8 fc ff ff       	call   80592e <draw_letter>
        fb_cursor_x+=1;
  805c76:	8b 05 30 f5 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1f530]        # 4251ac <fb_cursor_x>
  805c7c:	83 c0 01             	add    eax,0x1
  805c7f:	89 05 27 f5 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1f527],eax        # 4251ac <fb_cursor_x>
  805c85:	eb 01                	jmp    805c88 <print+0x107>
        if(*s=='\n')continue;
  805c87:	90                   	nop
    for(;*s;s++){
  805c88:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  805c8d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805c91:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805c94:	84 c0                	test   al,al
  805c96:	0f 85 fa fe ff ff    	jne    805b96 <print+0x15>
    }
}
  805c9c:	90                   	nop
  805c9d:	90                   	nop
  805c9e:	c9                   	leave  
  805c9f:	c3                   	ret    

0000000000805ca0 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  805ca0:	f3 0f 1e fa          	endbr64 
  805ca4:	55                   	push   rbp
  805ca5:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  805ca8:	0f b6 05 5e ff c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1ff5e]        # 425c0d <k_shift>
  805caf:	84 c0                	test   al,al
  805cb1:	0f 94 c0             	sete   al
  805cb4:	88 05 53 ff c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1ff53],al        # 425c0d <k_shift>
}
  805cba:	90                   	nop
  805cbb:	5d                   	pop    rbp
  805cbc:	c3                   	ret    

0000000000805cbd <ctrl>:
void ctrl()
{
  805cbd:	f3 0f 1e fa          	endbr64 
  805cc1:	55                   	push   rbp
  805cc2:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  805cc5:	0f b6 05 42 ff c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1ff42]        # 425c0e <k_ctrl>
  805ccc:	84 c0                	test   al,al
  805cce:	0f 94 c0             	sete   al
  805cd1:	88 05 37 ff c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1ff37],al        # 425c0e <k_ctrl>
}
  805cd7:	90                   	nop
  805cd8:	5d                   	pop    rbp
  805cd9:	c3                   	ret    

0000000000805cda <capslock>:
void capslock()
{
  805cda:	f3 0f 1e fa          	endbr64 
  805cde:	55                   	push   rbp
  805cdf:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  805ce2:	0f b6 05 26 ff c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1ff26]        # 425c0f <k_capslock>
  805ce9:	84 c0                	test   al,al
  805ceb:	0f 94 c0             	sete   al
  805cee:	88 05 1b ff c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1ff1b],al        # 425c0f <k_capslock>
}
  805cf4:	90                   	nop
  805cf5:	5d                   	pop    rbp
  805cf6:	c3                   	ret    

0000000000805cf7 <to_ascii>:
char to_ascii(char scan_code)
{
  805cf7:	f3 0f 1e fa          	endbr64 
  805cfb:	55                   	push   rbp
  805cfc:	48 89 e5             	mov    rbp,rsp
  805cff:	89 f8                	mov    eax,edi
  805d01:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  805d04:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805d0b:	e9 c7 00 00 00       	jmp    805dd7 <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  805d10:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805d13:	48 63 d0             	movsxd rdx,eax
  805d16:	48 89 d0             	mov    rax,rdx
  805d19:	48 c1 e0 02          	shl    rax,0x2
  805d1d:	48 01 d0             	add    rax,rdx
  805d20:	48 05 e2 1b 81 00    	add    rax,0x811be2
  805d26:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d29:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  805d2c:	0f 85 a1 00 00 00    	jne    805dd3 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  805d32:	0f b6 05 d6 fe c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fed6]        # 425c0f <k_capslock>
  805d39:	84 c0                	test   al,al
  805d3b:	74 55                	je     805d92 <to_ascii+0x9b>
  805d3d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805d40:	48 63 d0             	movsxd rdx,eax
  805d43:	48 89 d0             	mov    rax,rdx
  805d46:	48 c1 e0 02          	shl    rax,0x2
  805d4a:	48 01 d0             	add    rax,rdx
  805d4d:	48 05 e0 1b 81 00    	add    rax,0x811be0
  805d53:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d56:	3c 60                	cmp    al,0x60
  805d58:	7e 38                	jle    805d92 <to_ascii+0x9b>
  805d5a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805d5d:	48 63 d0             	movsxd rdx,eax
  805d60:	48 89 d0             	mov    rax,rdx
  805d63:	48 c1 e0 02          	shl    rax,0x2
  805d67:	48 01 d0             	add    rax,rdx
  805d6a:	48 05 e0 1b 81 00    	add    rax,0x811be0
  805d70:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d73:	3c 7a                	cmp    al,0x7a
  805d75:	7f 1b                	jg     805d92 <to_ascii+0x9b>
  805d77:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805d7a:	48 63 d0             	movsxd rdx,eax
  805d7d:	48 89 d0             	mov    rax,rdx
  805d80:	48 c1 e0 02          	shl    rax,0x2
  805d84:	48 01 d0             	add    rax,rdx
  805d87:	48 05 e1 1b 81 00    	add    rax,0x811be1
  805d8d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d90:	eb 54                	jmp    805de6 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  805d92:	0f b6 05 74 fe c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fe74]        # 425c0d <k_shift>
  805d99:	84 c0                	test   al,al
  805d9b:	74 1b                	je     805db8 <to_ascii+0xc1>
  805d9d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805da0:	48 63 d0             	movsxd rdx,eax
  805da3:	48 89 d0             	mov    rax,rdx
  805da6:	48 c1 e0 02          	shl    rax,0x2
  805daa:	48 01 d0             	add    rax,rdx
  805dad:	48 05 e1 1b 81 00    	add    rax,0x811be1
  805db3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805db6:	eb 2e                	jmp    805de6 <to_ascii+0xef>
            else return key_map[i].ascii;
  805db8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805dbb:	48 63 d0             	movsxd rdx,eax
  805dbe:	48 89 d0             	mov    rax,rdx
  805dc1:	48 c1 e0 02          	shl    rax,0x2
  805dc5:	48 01 d0             	add    rax,rdx
  805dc8:	48 05 e0 1b 81 00    	add    rax,0x811be0
  805dce:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805dd1:	eb 13                	jmp    805de6 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  805dd3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805dd7:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  805ddb:	0f 8e 2f ff ff ff    	jle    805d10 <to_ascii+0x19>
        }

    return '\0';
  805de1:	b8 00 00 00 00       	mov    eax,0x0
}
  805de6:	5d                   	pop    rbp
  805de7:	c3                   	ret    

0000000000805de8 <init_kb>:
int init_kb()
{
  805de8:	f3 0f 1e fa          	endbr64 
  805dec:	55                   	push   rbp
  805ded:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  805df0:	bf 20 1b 81 00       	mov    edi,0x811b20
  805df5:	e8 6c cb ff ff       	call   802966 <reg_device>
    reg_driver(&drv_keyboard);
  805dfa:	bf 80 1a 81 00       	mov    edi,0x811a80
  805dff:	e8 4a ce ff ff       	call   802c4e <reg_driver>
}
  805e04:	90                   	nop
  805e05:	5d                   	pop    rbp
  805e06:	c3                   	ret    

0000000000805e07 <key_proc>:
int key_proc()
{
  805e07:	f3 0f 1e fa          	endbr64 
  805e0b:	55                   	push   rbp
  805e0c:	48 89 e5             	mov    rbp,rsp
  805e0f:	48 83 ec 10          	sub    rsp,0x10
    //TODO:改成简单的插入键盘缓冲区，不需要翻译功能，翻译可以之后让别的模块调用
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  805e13:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  805e17:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  805e1b:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  805e1f:	bf 60 00 00 00       	mov    edi,0x60
  805e24:	e8 50 eb ff ff       	call   804979 <inb>
  805e29:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
    ch= to_ascii(scan1);
  805e2c:	0f b6 45 fe          	movzx  eax,BYTE PTR [rbp-0x2]
  805e30:	0f be c0             	movsx  eax,al
  805e33:	89 c7                	mov    edi,eax
  805e35:	e8 bd fe ff ff       	call   805cf7 <to_ascii>
  805e3a:	88 45 fd             	mov    BYTE PTR [rbp-0x3],al
    if(scan1 == 0xe0 || scan1 == 0xe1)
  805e3d:	80 7d fe e0          	cmp    BYTE PTR [rbp-0x2],0xe0
  805e41:	74 06                	je     805e49 <key_proc+0x42>
  805e43:	80 7d fe e1          	cmp    BYTE PTR [rbp-0x2],0xe1
  805e47:	75 1e                	jne    805e67 <key_proc+0x60>
    {
        ch= to_ascii(scan2);
  805e49:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  805e4d:	0f be c0             	movsx  eax,al
  805e50:	89 c7                	mov    edi,eax
  805e52:	e8 a0 fe ff ff       	call   805cf7 <to_ascii>
  805e57:	88 45 fd             	mov    BYTE PTR [rbp-0x3],al
        scan2=inb(0x60);
  805e5a:	bf 60 00 00 00       	mov    edi,0x60
  805e5f:	e8 15 eb ff ff       	call   804979 <inb>
  805e64:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    }
    tmpc.scan_code=scan1;
  805e67:	0f b6 45 fe          	movzx  eax,BYTE PTR [rbp-0x2]
  805e6b:	88 45 fa             	mov    BYTE PTR [rbp-0x6],al
    tmpc.scan_code2=scan2;
  805e6e:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  805e72:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
    tmpc.ascii= ch;
  805e75:	0f b6 45 fd          	movzx  eax,BYTE PTR [rbp-0x3]
  805e79:	88 45 f8             	mov    BYTE PTR [rbp-0x8],al


    ENQUEUE(key_bufq,tmpc)
  805e7c:	48 8b 0d cd 40 00 00 	mov    rcx,QWORD PTR [rip+0x40cd]        # 809f50 <key_bufq>
  805e83:	8b 05 d3 40 00 00    	mov    eax,DWORD PTR [rip+0x40d3]        # 809f5c <key_bufq+0xc>
  805e89:	48 63 d0             	movsxd rdx,eax
  805e8c:	48 89 d0             	mov    rax,rdx
  805e8f:	48 c1 e0 02          	shl    rax,0x2
  805e93:	48 01 d0             	add    rax,rdx
  805e96:	48 01 c8             	add    rax,rcx
  805e99:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805e9c:	89 10                	mov    DWORD PTR [rax],edx
  805e9e:	0f b6 55 fc          	movzx  edx,BYTE PTR [rbp-0x4]
  805ea2:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
  805ea5:	8b 05 b1 40 00 00    	mov    eax,DWORD PTR [rip+0x40b1]        # 809f5c <key_bufq+0xc>
  805eab:	83 c0 01             	add    eax,0x1
  805eae:	8b 0d ac 40 00 00    	mov    ecx,DWORD PTR [rip+0x40ac]        # 809f60 <key_bufq+0x10>
  805eb4:	99                   	cdq    
  805eb5:	f7 f9                	idiv   ecx
  805eb7:	89 d0                	mov    eax,edx
  805eb9:	89 05 9d 40 00 00    	mov    DWORD PTR [rip+0x409d],eax        # 809f5c <key_bufq+0xc>


    if(scan1==0x48)
  805ebf:	80 7d fe 48          	cmp    BYTE PTR [rbp-0x2],0x48
  805ec3:	75 0a                	jne    805ecf <key_proc+0xc8>
        scr_up();
  805ec5:	b8 00 00 00 00       	mov    eax,0x0
  805eca:	e8 8d fb ff ff       	call   805a5c <scr_up>
    if(scan1==0x50)
  805ecf:	80 7d fe 50          	cmp    BYTE PTR [rbp-0x2],0x50
  805ed3:	75 0a                	jne    805edf <key_proc+0xd8>
        scr_down();
  805ed5:	b8 00 00 00 00       	mov    eax,0x0
  805eda:	e8 0e fc ff ff       	call   805aed <scr_down>
    switch (scan1)
  805edf:	0f b6 45 fe          	movzx  eax,BYTE PTR [rbp-0x2]
  805ee3:	3d b6 00 00 00       	cmp    eax,0xb6
  805ee8:	74 41                	je     805f2b <key_proc+0x124>
  805eea:	3d b6 00 00 00       	cmp    eax,0xb6
  805eef:	7f 5e                	jg     805f4f <key_proc+0x148>
  805ef1:	3d aa 00 00 00       	cmp    eax,0xaa
  805ef6:	74 33                	je     805f2b <key_proc+0x124>
  805ef8:	3d aa 00 00 00       	cmp    eax,0xaa
  805efd:	7f 50                	jg     805f4f <key_proc+0x148>
  805eff:	3d 9d 00 00 00       	cmp    eax,0x9d
  805f04:	74 31                	je     805f37 <key_proc+0x130>
  805f06:	3d 9d 00 00 00       	cmp    eax,0x9d
  805f0b:	7f 42                	jg     805f4f <key_proc+0x148>
  805f0d:	83 f8 3a             	cmp    eax,0x3a
  805f10:	74 31                	je     805f43 <key_proc+0x13c>
  805f12:	83 f8 3a             	cmp    eax,0x3a
  805f15:	7f 38                	jg     805f4f <key_proc+0x148>
  805f17:	83 f8 36             	cmp    eax,0x36
  805f1a:	74 0f                	je     805f2b <key_proc+0x124>
  805f1c:	83 f8 36             	cmp    eax,0x36
  805f1f:	7f 2e                	jg     805f4f <key_proc+0x148>
  805f21:	83 f8 1d             	cmp    eax,0x1d
  805f24:	74 11                	je     805f37 <key_proc+0x130>
  805f26:	83 f8 2a             	cmp    eax,0x2a
  805f29:	75 24                	jne    805f4f <key_proc+0x148>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  805f2b:	b8 00 00 00 00       	mov    eax,0x0
  805f30:	e8 6b fd ff ff       	call   805ca0 <shift>
            break;
  805f35:	eb 19                	jmp    805f50 <key_proc+0x149>
        case 0x1d:
        case 0x9d:
            ctrl();
  805f37:	b8 00 00 00 00       	mov    eax,0x0
  805f3c:	e8 7c fd ff ff       	call   805cbd <ctrl>
            break;
  805f41:	eb 0d                	jmp    805f50 <key_proc+0x149>
        case 0x3a:
            capslock();
  805f43:	b8 00 00 00 00       	mov    eax,0x0
  805f48:	e8 8d fd ff ff       	call   805cda <capslock>
            break;
  805f4d:	eb 01                	jmp    805f50 <key_proc+0x149>
        default:
            break;
  805f4f:	90                   	nop
    }
    if(scan1<=0x80&&ch!=0)
  805f50:	80 7d fe 80          	cmp    BYTE PTR [rbp-0x2],0x80
  805f54:	77 14                	ja     805f6a <key_proc+0x163>
  805f56:	0f b6 45 fd          	movzx  eax,BYTE PTR [rbp-0x3]
  805f5a:	84 c0                	test   al,al
  805f5c:	74 0c                	je     805f6a <key_proc+0x163>
    {
        print(&ch);
  805f5e:	48 8d 45 fd          	lea    rax,[rbp-0x3]
  805f62:	48 89 c7             	mov    rdi,rax
  805f65:	e8 17 fc ff ff       	call   805b81 <print>
        //logf("%x\n",stdin.w_ptr);
        //print_stdin();
        //printchar(ch);
        //flush_screen(0);*/
    }
    eoi();
  805f6a:	b8 00 00 00 00       	mov    eax,0x0
  805f6f:	e8 1a ea ff ff       	call   80498e <eoi>
    asm volatile("leave \r\n iretq");
  805f74:	c9                   	leave  
  805f75:	48 cf                	iretq  
}
  805f77:	90                   	nop
  805f78:	c9                   	leave  
  805f79:	c3                   	ret    

0000000000805f7a <sys_getkbc>:

char sys_getkbc()
{
  805f7a:	f3 0f 1e fa          	endbr64 
  805f7e:	55                   	push   rbp
  805f7f:	48 89 e5             	mov    rbp,rsp
    if(key_bufq.tail==key_bufq.head)return -1;
  805f82:	8b 15 d4 3f 00 00    	mov    edx,DWORD PTR [rip+0x3fd4]        # 809f5c <key_bufq+0xc>
  805f88:	8b 05 ca 3f 00 00    	mov    eax,DWORD PTR [rip+0x3fca]        # 809f58 <key_bufq+0x8>
  805f8e:	39 c2                	cmp    edx,eax
  805f90:	75 07                	jne    805f99 <sys_getkbc+0x1f>
  805f92:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805f97:	eb 43                	jmp    805fdc <sys_getkbc+0x62>
    key_code c=key_buf[key_bufq.tail];
  805f99:	8b 05 bd 3f 00 00    	mov    eax,DWORD PTR [rip+0x3fbd]        # 809f5c <key_bufq+0xc>
  805f9f:	48 63 d0             	movsxd rdx,eax
  805fa2:	48 89 d0             	mov    rax,rdx
  805fa5:	48 c1 e0 02          	shl    rax,0x2
  805fa9:	48 01 d0             	add    rax,rdx
  805fac:	48 05 00 52 42 00    	add    rax,0x425200
  805fb2:	8b 10                	mov    edx,DWORD PTR [rax]
  805fb4:	89 55 fb             	mov    DWORD PTR [rbp-0x5],edx
  805fb7:	0f b6 40 04          	movzx  eax,BYTE PTR [rax+0x4]
  805fbb:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QTAIL(key_bufq)=(QTAIL(key_bufq)+1)%QSIZE(key_bufq);
  805fbe:	8b 05 98 3f 00 00    	mov    eax,DWORD PTR [rip+0x3f98]        # 809f5c <key_bufq+0xc>
  805fc4:	83 c0 01             	add    eax,0x1
  805fc7:	8b 0d 93 3f 00 00    	mov    ecx,DWORD PTR [rip+0x3f93]        # 809f60 <key_bufq+0x10>
  805fcd:	99                   	cdq    
  805fce:	f7 f9                	idiv   ecx
  805fd0:	89 d0                	mov    eax,edx
  805fd2:	89 05 84 3f 00 00    	mov    DWORD PTR [rip+0x3f84],eax        # 809f5c <key_bufq+0xc>
    return c.ascii;
  805fd8:	0f b6 45 fb          	movzx  eax,BYTE PTR [rbp-0x5]
  805fdc:	5d                   	pop    rbp
  805fdd:	c3                   	ret    

0000000000805fde <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  805fde:	f3 0f 1e fa          	endbr64 
  805fe2:	55                   	push   rbp
  805fe3:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  805fe6:	b8 00 00 00 00       	mov    eax,0x0
  805feb:	e8 8d 09 00 00       	call   80697d <hd_iterate>
    return 0;
  805ff0:	b8 00 00 00 00       	mov    eax,0x0
}
  805ff5:	5d                   	pop    rbp
  805ff6:	c3                   	ret    

0000000000805ff7 <disk_int_handler_c>:

int disk_int_handler_c()
{
  805ff7:	f3 0f 1e fa          	endbr64 
  805ffb:	55                   	push   rbp
  805ffc:	48 89 e5             	mov    rbp,rsp
  805fff:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  806003:	48 8b 05 16 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22916]        # 428920 <running_req>
  80600a:	48 85 c0             	test   rax,rax
  80600d:	75 0a                	jne    806019 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  80600f:	b8 01 00 00 00       	mov    eax,0x1
  806014:	e9 a3 01 00 00       	jmp    8061bc <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  806019:	48 8b 05 00 29 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22900]        # 428920 <running_req>
  806020:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806024:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  806028:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  80602f:	48 8b 05 ea 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc228ea]        # 428920 <running_req>
  806036:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806039:	83 f8 02             	cmp    eax,0x2
  80603c:	74 0f                	je     80604d <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  80603e:	48 8b 05 db 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc228db]        # 428920 <running_req>
  806045:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  806048:	83 f8 03             	cmp    eax,0x3
  80604b:	75 07                	jne    806054 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  80604d:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  806054:	48 8b 05 c5 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc228c5]        # 428920 <running_req>
  80605b:	8b 00                	mov    eax,DWORD PTR [rax]
  80605d:	85 c0                	test   eax,eax
  80605f:	75 42                	jne    8060a3 <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  806061:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  806068:	eb 22                	jmp    80608c <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  80606a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80606d:	0f b7 c0             	movzx  eax,ax
  806070:	89 c7                	mov    edi,eax
  806072:	e8 0c e9 ff ff       	call   804983 <inw>
  806077:	89 c2                	mov    edx,eax
  806079:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80607d:	48 8d 48 02          	lea    rcx,[rax+0x2]
  806081:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  806085:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  806088:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80608c:	48 8b 05 8d 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2288d]        # 428920 <running_req>
  806093:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806096:	c1 e0 08             	shl    eax,0x8
  806099:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  80609c:	7c cc                	jl     80606a <disk_int_handler_c+0x73>
  80609e:	e9 ca 00 00 00       	jmp    80616d <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  8060a3:	48 8b 05 76 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22876]        # 428920 <running_req>
  8060aa:	8b 00                	mov    eax,DWORD PTR [rax]
  8060ac:	83 f8 01             	cmp    eax,0x1
  8060af:	75 42                	jne    8060f3 <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  8060b1:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8060b8:	eb 25                	jmp    8060df <disk_int_handler_c+0xe8>
            outw(port,*p++);
  8060ba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8060be:	48 8d 50 02          	lea    rdx,[rax+0x2]
  8060c2:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8060c6:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8060c9:	0f b7 d0             	movzx  edx,ax
  8060cc:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8060cf:	0f b7 c0             	movzx  eax,ax
  8060d2:	89 d6                	mov    esi,edx
  8060d4:	89 c7                	mov    edi,eax
  8060d6:	e8 92 e8 ff ff       	call   80496d <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  8060db:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8060df:	48 8b 05 3a 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2283a]        # 428920 <running_req>
  8060e6:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8060e9:	c1 e0 08             	shl    eax,0x8
  8060ec:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8060ef:	7c c9                	jl     8060ba <disk_int_handler_c+0xc3>
  8060f1:	eb 7a                	jmp    80616d <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  8060f3:	48 8b 05 26 28 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22826]        # 428920 <running_req>
  8060fa:	8b 00                	mov    eax,DWORD PTR [rax]
  8060fc:	83 f8 02             	cmp    eax,0x2
  8060ff:	75 34                	jne    806135 <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  806101:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806104:	83 c0 07             	add    eax,0x7
  806107:	0f b6 c0             	movzx  eax,al
  80610a:	89 c7                	mov    edi,eax
  80610c:	e8 68 e8 ff ff       	call   804979 <inb>
  806111:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  806114:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806117:	0f b7 c0             	movzx  eax,ax
  80611a:	89 c7                	mov    edi,eax
  80611c:	e8 62 e8 ff ff       	call   804983 <inw>
  806121:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  806125:	48 8b 05 f4 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227f4]        # 428920 <running_req>
  80612c:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  806133:	eb 38                	jmp    80616d <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  806135:	48 8b 05 e4 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227e4]        # 428920 <running_req>
  80613c:	8b 00                	mov    eax,DWORD PTR [rax]
  80613e:	83 f8 03             	cmp    eax,0x3
  806141:	75 2a                	jne    80616d <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  806143:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806146:	83 c0 07             	add    eax,0x7
  806149:	0f b6 c0             	movzx  eax,al
  80614c:	89 c7                	mov    edi,eax
  80614e:	e8 26 e8 ff ff       	call   804979 <inb>
  806153:	0f b6 c0             	movzx  eax,al
  806156:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  806159:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80615c:	89 c6                	mov    esi,eax
  80615e:	bf b6 1d 81 00       	mov    edi,0x811db6
  806163:	b8 00 00 00 00       	mov    eax,0x0
  806168:	e8 02 ab ff ff       	call   800c6f <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  80616d:	48 8b 05 ac 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc227ac]        # 428920 <running_req>
  806174:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  80617b:	48 8b 05 9e 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2279e]        # 428920 <running_req>
  806182:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806186:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  80618d:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  806190:	48 8b 05 91 27 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22791]        # 428928 <running_devman_req>
  806197:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  80619e:	00 00 00 
    running_devman_req=NULL;
  8061a1:	48 c7 05 7c 27 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2277c],0x0        # 428928 <running_devman_req>
  8061a8:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8061ac:	48 c7 05 69 27 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22769],0x0        # 428920 <running_req>
  8061b3:	00 00 00 00 
    return 0;
  8061b7:	b8 00 00 00 00       	mov    eax,0x0
}
  8061bc:	c9                   	leave  
  8061bd:	c3                   	ret    

00000000008061be <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  8061be:	f3 0f 1e fa          	endbr64 
  8061c2:	55                   	push   rbp
  8061c3:	48 89 e5             	mov    rbp,rsp
  8061c6:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  8061c9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8061cc:	48 63 d0             	movsxd rdx,eax
  8061cf:	48 89 d0             	mov    rax,rdx
  8061d2:	48 01 c0             	add    rax,rax
  8061d5:	48 01 d0             	add    rax,rdx
  8061d8:	48 c1 e0 04          	shl    rax,0x4
  8061dc:	48 05 3c 5c 42 00    	add    rax,0x425c3c
  8061e2:	8b 00                	mov    eax,DWORD PTR [rax]
}
  8061e4:	5d                   	pop    rbp
  8061e5:	c3                   	ret    

00000000008061e6 <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  8061e6:	f3 0f 1e fa          	endbr64 
  8061ea:	55                   	push   rbp
  8061eb:	48 89 e5             	mov    rbp,rsp
  8061ee:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8061f1:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8061f4:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8061f7:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  8061fa:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  8061fe:	8b 05 50 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22750]        # 428954 <tail>
  806204:	83 c0 01             	add    eax,0x1
  806207:	48 63 d0             	movsxd rdx,eax
  80620a:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  806211:	48 c1 ea 20          	shr    rdx,0x20
  806215:	01 c2                	add    edx,eax
  806217:	c1 fa 07             	sar    edx,0x7
  80621a:	89 c1                	mov    ecx,eax
  80621c:	c1 f9 1f             	sar    ecx,0x1f
  80621f:	29 ca                	sub    edx,ecx
  806221:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  806227:	29 c8                	sub    eax,ecx
  806229:	89 c2                	mov    edx,eax
  80622b:	8b 05 1f 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2271f]        # 428950 <head>
  806231:	39 c2                	cmp    edx,eax
  806233:	75 0a                	jne    80623f <request+0x59>
    {
        return -1;
  806235:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80623a:	e9 0d 01 00 00       	jmp    80634c <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  80623f:	8b 05 0f 27 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2270f]        # 428954 <tail>
  806245:	48 63 d0             	movsxd rdx,eax
  806248:	48 89 d0             	mov    rax,rdx
  80624b:	48 01 c0             	add    rax,rax
  80624e:	48 01 d0             	add    rax,rdx
  806251:	48 c1 e0 04          	shl    rax,0x4
  806255:	48 8d 90 24 5c 42 00 	lea    rdx,[rax+0x425c24]
  80625c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80625f:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  806261:	8b 05 ed 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc226ed]        # 428954 <tail>
  806267:	48 63 d0             	movsxd rdx,eax
  80626a:	48 89 d0             	mov    rax,rdx
  80626d:	48 01 c0             	add    rax,rax
  806270:	48 01 d0             	add    rax,rdx
  806273:	48 c1 e0 04          	shl    rax,0x4
  806277:	48 8d 90 20 5c 42 00 	lea    rdx,[rax+0x425c20]
  80627e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806281:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  806283:	8b 05 cb 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc226cb]        # 428954 <tail>
  806289:	48 63 d0             	movsxd rdx,eax
  80628c:	48 89 d0             	mov    rax,rdx
  80628f:	48 01 c0             	add    rax,rax
  806292:	48 01 d0             	add    rax,rdx
  806295:	48 c1 e0 04          	shl    rax,0x4
  806299:	48 8d 90 28 5c 42 00 	lea    rdx,[rax+0x425c28]
  8062a0:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8062a3:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  8062a5:	8b 05 a9 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc226a9]        # 428954 <tail>
  8062ab:	48 63 d0             	movsxd rdx,eax
  8062ae:	48 89 d0             	mov    rax,rdx
  8062b1:	48 01 c0             	add    rax,rax
  8062b4:	48 01 d0             	add    rax,rdx
  8062b7:	48 c1 e0 04          	shl    rax,0x4
  8062bb:	48 8d 90 2c 5c 42 00 	lea    rdx,[rax+0x425c2c]
  8062c2:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8062c5:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  8062c7:	8b 05 87 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22687]        # 428954 <tail>
  8062cd:	48 63 d0             	movsxd rdx,eax
  8062d0:	48 89 d0             	mov    rax,rdx
  8062d3:	48 01 c0             	add    rax,rax
  8062d6:	48 01 d0             	add    rax,rdx
  8062d9:	48 c1 e0 04          	shl    rax,0x4
  8062dd:	48 05 3c 5c 42 00    	add    rax,0x425c3c
  8062e3:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  8062e9:	8b 05 65 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22665]        # 428954 <tail>
  8062ef:	48 63 d0             	movsxd rdx,eax
  8062f2:	48 89 d0             	mov    rax,rdx
  8062f5:	48 01 c0             	add    rax,rax
  8062f8:	48 01 d0             	add    rax,rdx
  8062fb:	48 c1 e0 04          	shl    rax,0x4
  8062ff:	48 8d 90 30 5c 42 00 	lea    rdx,[rax+0x425c30]
  806306:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80630a:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  80630d:	8b 05 41 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22641]        # 428954 <tail>
  806313:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  806316:	8b 05 38 26 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22638]        # 428954 <tail>
  80631c:	8d 50 01             	lea    edx,[rax+0x1]
  80631f:	48 63 c2             	movsxd rax,edx
  806322:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806329:	48 c1 e8 20          	shr    rax,0x20
  80632d:	01 d0                	add    eax,edx
  80632f:	c1 f8 07             	sar    eax,0x7
  806332:	89 d1                	mov    ecx,edx
  806334:	c1 f9 1f             	sar    ecx,0x1f
  806337:	29 c8                	sub    eax,ecx
  806339:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  80633f:	89 d0                	mov    eax,edx
  806341:	29 c8                	sub    eax,ecx
  806343:	89 05 0b 26 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2260b],eax        # 428954 <tail>
    return r;
  806349:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80634c:	5d                   	pop    rbp
  80634d:	c3                   	ret    

000000000080634e <execute_request>:
int execute_request(){
  80634e:	f3 0f 1e fa          	endbr64 
  806352:	55                   	push   rbp
  806353:	48 89 e5             	mov    rbp,rsp
  806356:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  80635a:	48 8b 05 bf 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225bf]        # 428920 <running_req>
  806361:	48 85 c0             	test   rax,rax
  806364:	74 6a                	je     8063d0 <execute_request+0x82>
    {
        running_req->time++;
  806366:	48 8b 05 b3 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225b3]        # 428920 <running_req>
  80636d:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  806370:	83 c2 01             	add    edx,0x1
  806373:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  806376:	48 8b 05 a3 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc225a3]        # 428920 <running_req>
  80637d:	8b 00                	mov    eax,DWORD PTR [rax]
  80637f:	83 f8 02             	cmp    eax,0x2
  806382:	74 0a                	je     80638e <execute_request+0x40>
            return 2;
  806384:	b8 02 00 00 00       	mov    eax,0x2
  806389:	e9 b4 01 00 00       	jmp    806542 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  80638e:	48 8b 05 8b 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2258b]        # 428920 <running_req>
  806395:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  806398:	83 f8 0a             	cmp    eax,0xa
  80639b:	7e 29                	jle    8063c6 <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  80639d:	48 8b 05 7c 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2257c]        # 428920 <running_req>
  8063a4:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  8063ab:	48 8b 05 6e 25 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2256e]        # 428920 <running_req>
  8063b2:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  8063b9:	48 c7 05 5c 25 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2255c],0x0        # 428920 <running_req>
  8063c0:	00 00 00 00 
  8063c4:	eb 0a                	jmp    8063d0 <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  8063c6:	b8 02 00 00 00       	mov    eax,0x2
  8063cb:	e9 72 01 00 00       	jmp    806542 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  8063d0:	8b 15 7a 25 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc2257a]        # 428950 <head>
  8063d6:	8b 05 78 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22578]        # 428954 <tail>
  8063dc:	39 c2                	cmp    edx,eax
  8063de:	75 0a                	jne    8063ea <execute_request+0x9c>
  8063e0:	b8 01 00 00 00       	mov    eax,0x1
  8063e5:	e9 58 01 00 00       	jmp    806542 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  8063ea:	8b 05 60 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc22560]        # 428950 <head>
  8063f0:	48 63 d0             	movsxd rdx,eax
  8063f3:	48 89 d0             	mov    rax,rdx
  8063f6:	48 01 c0             	add    rax,rax
  8063f9:	48 01 d0             	add    rax,rdx
  8063fc:	48 c1 e0 04          	shl    rax,0x4
  806400:	48 05 20 5c 42 00    	add    rax,0x425c20
  806406:	48 89 05 13 25 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22513],rax        # 428920 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  80640d:	8b 05 3d 25 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2253d]        # 428950 <head>
  806413:	8d 50 01             	lea    edx,[rax+0x1]
  806416:	48 63 c2             	movsxd rax,edx
  806419:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806420:	48 c1 e8 20          	shr    rax,0x20
  806424:	01 d0                	add    eax,edx
  806426:	c1 f8 07             	sar    eax,0x7
  806429:	89 d1                	mov    ecx,edx
  80642b:	c1 f9 1f             	sar    ecx,0x1f
  80642e:	29 c8                	sub    eax,ecx
  806430:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  806436:	89 d0                	mov    eax,edx
  806438:	29 c8                	sub    eax,ecx
  80643a:	89 05 10 25 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc22510],eax        # 428950 <head>
    running_req->stat=REQ_STAT_WORKING;
  806440:	48 8b 05 d9 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224d9]        # 428920 <running_req>
  806447:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  80644e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  806455:	48 8b 05 c4 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc224c4]        # 428920 <running_req>
  80645c:	8b 00                	mov    eax,DWORD PTR [rax]
  80645e:	83 f8 03             	cmp    eax,0x3
  806461:	0f 84 ad 00 00 00    	je     806514 <execute_request+0x1c6>
  806467:	83 f8 03             	cmp    eax,0x3
  80646a:	0f 8f bf 00 00 00    	jg     80652f <execute_request+0x1e1>
  806470:	83 f8 02             	cmp    eax,0x2
  806473:	0f 84 85 00 00 00    	je     8064fe <execute_request+0x1b0>
  806479:	83 f8 02             	cmp    eax,0x2
  80647c:	0f 8f ad 00 00 00    	jg     80652f <execute_request+0x1e1>
  806482:	85 c0                	test   eax,eax
  806484:	74 0a                	je     806490 <execute_request+0x142>
  806486:	83 f8 01             	cmp    eax,0x1
  806489:	74 3c                	je     8064c7 <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  80648b:	e9 9f 00 00 00       	jmp    80652f <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  806490:	48 8b 05 89 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22489]        # 428920 <running_req>
        r=async_read_disk(running_req->disk,\
  806497:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  80649b:	48 8b 05 7e 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2247e]        # 428920 <running_req>
        r=async_read_disk(running_req->disk,\
  8064a2:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  8064a5:	48 8b 05 74 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22474]        # 428920 <running_req>
  8064ac:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  8064af:	89 c6                	mov    esi,eax
  8064b1:	48 8b 05 68 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22468]        # 428920 <running_req>
  8064b8:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8064bb:	89 c7                	mov    edi,eax
  8064bd:	e8 a7 00 00 00       	call   806569 <async_read_disk>
  8064c2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8064c5:	eb 69                	jmp    806530 <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  8064c7:	48 8b 05 52 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22452]        # 428920 <running_req>
        r=async_write_disk(running_req->disk,\
  8064ce:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  8064d2:	48 8b 05 47 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22447]        # 428920 <running_req>
        r=async_write_disk(running_req->disk,\
  8064d9:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  8064dc:	48 8b 05 3d 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2243d]        # 428920 <running_req>
  8064e3:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  8064e6:	89 c6                	mov    esi,eax
  8064e8:	48 8b 05 31 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22431]        # 428920 <running_req>
  8064ef:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8064f2:	89 c7                	mov    edi,eax
  8064f4:	e8 88 01 00 00       	call   806681 <async_write_disk>
  8064f9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8064fc:	eb 32                	jmp    806530 <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  8064fe:	48 8b 05 1b 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2241b]        # 428920 <running_req>
  806505:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806508:	89 c7                	mov    edi,eax
  80650a:	e8 8f 06 00 00       	call   806b9e <async_check_disk>
  80650f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806512:	eb 1c                	jmp    806530 <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  806514:	48 8b 05 05 24 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc22405]        # 428920 <running_req>
  80651b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80651e:	89 c7                	mov    edi,eax
  806520:	b8 00 00 00 00       	mov    eax,0x0
  806525:	e8 1a 00 00 00       	call   806544 <async_reset_disk>
  80652a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  80652d:	eb 01                	jmp    806530 <execute_request+0x1e2>
        break;
  80652f:	90                   	nop
    }
    if(r==-1)return -1;
  806530:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  806534:	75 07                	jne    80653d <execute_request+0x1ef>
  806536:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80653b:	eb 05                	jmp    806542 <execute_request+0x1f4>
    return 0;
  80653d:	b8 00 00 00 00       	mov    eax,0x0
}
  806542:	c9                   	leave  
  806543:	c3                   	ret    

0000000000806544 <async_reset_disk>:
int async_reset_disk(int disk)
{
  806544:	f3 0f 1e fa          	endbr64 
  806548:	55                   	push   rbp
  806549:	48 89 e5             	mov    rbp,rsp
  80654c:	48 83 ec 10          	sub    rsp,0x10
  806550:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  806553:	be 0c 00 00 00       	mov    esi,0xc
  806558:	bf f6 03 00 00       	mov    edi,0x3f6
  80655d:	e8 fe e3 ff ff       	call   804960 <outb>
    return 0;
  806562:	b8 00 00 00 00       	mov    eax,0x0
}
  806567:	c9                   	leave  
  806568:	c3                   	ret    

0000000000806569 <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  806569:	f3 0f 1e fa          	endbr64 
  80656d:	55                   	push   rbp
  80656e:	48 89 e5             	mov    rbp,rsp
  806571:	48 83 ec 30          	sub    rsp,0x30
  806575:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806578:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80657b:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  80657e:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  806582:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  806588:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  80658f:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806593:	74 06                	je     80659b <async_read_disk+0x32>
  806595:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806599:	75 06                	jne    8065a1 <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  80659b:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  8065a1:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8065a5:	74 06                	je     8065ad <async_read_disk+0x44>
  8065a7:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  8065ab:	75 07                	jne    8065b4 <async_read_disk+0x4b>
        slave_disk=1;
  8065ad:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  8065b4:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8065b7:	0f b6 d0             	movzx  edx,al
  8065ba:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8065be:	83 c0 02             	add    eax,0x2
  8065c1:	0f b7 c0             	movzx  eax,ax
  8065c4:	89 d6                	mov    esi,edx
  8065c6:	89 c7                	mov    edi,eax
  8065c8:	e8 93 e3 ff ff       	call   804960 <outb>
    outb(port+3,lba&0xff);
  8065cd:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8065d0:	0f b6 d0             	movzx  edx,al
  8065d3:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8065d7:	83 c0 03             	add    eax,0x3
  8065da:	0f b7 c0             	movzx  eax,ax
  8065dd:	89 d6                	mov    esi,edx
  8065df:	89 c7                	mov    edi,eax
  8065e1:	e8 7a e3 ff ff       	call   804960 <outb>
    outb(port+4,(lba>>8)&0xff);
  8065e6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8065e9:	c1 e8 08             	shr    eax,0x8
  8065ec:	0f b6 d0             	movzx  edx,al
  8065ef:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8065f3:	83 c0 04             	add    eax,0x4
  8065f6:	0f b7 c0             	movzx  eax,ax
  8065f9:	89 d6                	mov    esi,edx
  8065fb:	89 c7                	mov    edi,eax
  8065fd:	e8 5e e3 ff ff       	call   804960 <outb>
    outb(port+5,(lba>>16)&0xff);
  806602:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806605:	c1 e8 10             	shr    eax,0x10
  806608:	0f b6 d0             	movzx  edx,al
  80660b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80660f:	83 c0 05             	add    eax,0x5
  806612:	0f b7 c0             	movzx  eax,ax
  806615:	89 d6                	mov    esi,edx
  806617:	89 c7                	mov    edi,eax
  806619:	e8 42 e3 ff ff       	call   804960 <outb>
    char drv=slave_disk?0x10:0;
  80661e:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806622:	74 07                	je     80662b <async_read_disk+0xc2>
  806624:	b8 10 00 00 00       	mov    eax,0x10
  806629:	eb 05                	jmp    806630 <async_read_disk+0xc7>
  80662b:	b8 00 00 00 00       	mov    eax,0x0
  806630:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  806633:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806636:	c1 e8 18             	shr    eax,0x18
  806639:	83 e0 0f             	and    eax,0xf
  80663c:	89 c2                	mov    edx,eax
  80663e:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  806642:	09 d0                	or     eax,edx
  806644:	83 c8 e0             	or     eax,0xffffffe0
  806647:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  80664a:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  80664e:	0f b6 d0             	movzx  edx,al
  806651:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806655:	83 c0 06             	add    eax,0x6
  806658:	0f b7 c0             	movzx  eax,ax
  80665b:	89 d6                	mov    esi,edx
  80665d:	89 c7                	mov    edi,eax
  80665f:	e8 fc e2 ff ff       	call   804960 <outb>
    outb(port+7,DISK_CMD_READ);
  806664:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806668:	83 c0 07             	add    eax,0x7
  80666b:	0f b7 c0             	movzx  eax,ax
  80666e:	be 20 00 00 00       	mov    esi,0x20
  806673:	89 c7                	mov    edi,eax
  806675:	e8 e6 e2 ff ff       	call   804960 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  80667a:	b8 00 00 00 00       	mov    eax,0x0
}
  80667f:	c9                   	leave  
  806680:	c3                   	ret    

0000000000806681 <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  806681:	f3 0f 1e fa          	endbr64 
  806685:	55                   	push   rbp
  806686:	48 89 e5             	mov    rbp,rsp
  806689:	48 83 ec 30          	sub    rsp,0x30
  80668d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806690:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806693:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806696:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  80669a:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  8066a0:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  8066a7:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  8066ab:	74 06                	je     8066b3 <async_write_disk+0x32>
  8066ad:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8066b1:	75 06                	jne    8066b9 <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  8066b3:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  8066b9:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8066bd:	74 06                	je     8066c5 <async_write_disk+0x44>
  8066bf:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  8066c3:	75 07                	jne    8066cc <async_write_disk+0x4b>
        slave_disk=1;
  8066c5:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  8066cc:	bf f7 00 00 00       	mov    edi,0xf7
  8066d1:	e8 a3 e2 ff ff       	call   804979 <inb>
  8066d6:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  8066d9:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  8066dd:	83 e0 01             	and    eax,0x1
  8066e0:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  8066e3:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  8066e7:	74 0a                	je     8066f3 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  8066e9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8066ee:	e9 d5 00 00 00       	jmp    8067c8 <async_write_disk+0x147>
        }
        t&=0x88;
  8066f3:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  8066f7:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  8066fb:	74 02                	je     8066ff <async_write_disk+0x7e>
    {
  8066fd:	eb cd                	jmp    8066cc <async_write_disk+0x4b>
        if(t==0x8)break;
  8066ff:	90                   	nop
    }
    outb(port+2,sec_n);
  806700:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806703:	0f b6 d0             	movzx  edx,al
  806706:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80670a:	83 c0 02             	add    eax,0x2
  80670d:	0f b7 c0             	movzx  eax,ax
  806710:	89 d6                	mov    esi,edx
  806712:	89 c7                	mov    edi,eax
  806714:	e8 47 e2 ff ff       	call   804960 <outb>
    outb(port+3,lba&0xff);
  806719:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80671c:	0f b6 d0             	movzx  edx,al
  80671f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806723:	83 c0 03             	add    eax,0x3
  806726:	0f b7 c0             	movzx  eax,ax
  806729:	89 d6                	mov    esi,edx
  80672b:	89 c7                	mov    edi,eax
  80672d:	e8 2e e2 ff ff       	call   804960 <outb>
    outb(port+4,(lba>>8)&0xff);
  806732:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806735:	c1 e8 08             	shr    eax,0x8
  806738:	0f b6 d0             	movzx  edx,al
  80673b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80673f:	83 c0 04             	add    eax,0x4
  806742:	0f b7 c0             	movzx  eax,ax
  806745:	89 d6                	mov    esi,edx
  806747:	89 c7                	mov    edi,eax
  806749:	e8 12 e2 ff ff       	call   804960 <outb>
    outb(port+5,(lba>>16)&0xff);
  80674e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806751:	c1 e8 10             	shr    eax,0x10
  806754:	0f b6 d0             	movzx  edx,al
  806757:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80675b:	83 c0 05             	add    eax,0x5
  80675e:	0f b7 c0             	movzx  eax,ax
  806761:	89 d6                	mov    esi,edx
  806763:	89 c7                	mov    edi,eax
  806765:	e8 f6 e1 ff ff       	call   804960 <outb>
    char drv=slave_disk?0x10:0;
  80676a:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  80676e:	74 07                	je     806777 <async_write_disk+0xf6>
  806770:	b8 10 00 00 00       	mov    eax,0x10
  806775:	eb 05                	jmp    80677c <async_write_disk+0xfb>
  806777:	b8 00 00 00 00       	mov    eax,0x0
  80677c:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  80677f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806782:	c1 e8 18             	shr    eax,0x18
  806785:	83 e0 0f             	and    eax,0xf
  806788:	89 c2                	mov    edx,eax
  80678a:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  80678e:	09 d0                	or     eax,edx
  806790:	83 c8 e0             	or     eax,0xffffffe0
  806793:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  806796:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80679a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80679e:	83 c0 06             	add    eax,0x6
  8067a1:	0f b7 c0             	movzx  eax,ax
  8067a4:	89 d6                	mov    esi,edx
  8067a6:	89 c7                	mov    edi,eax
  8067a8:	e8 b3 e1 ff ff       	call   804960 <outb>
    outb(port+7,DISK_CMD_WRITE);
  8067ad:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8067b1:	83 c0 07             	add    eax,0x7
  8067b4:	0f b7 c0             	movzx  eax,ax
  8067b7:	be 30 00 00 00       	mov    esi,0x30
  8067bc:	89 c7                	mov    edi,eax
  8067be:	e8 9d e1 ff ff       	call   804960 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  8067c3:	b8 00 00 00 00       	mov    eax,0x0
}
  8067c8:	c9                   	leave  
  8067c9:	c3                   	ret    

00000000008067ca <read_disk>:
int read_disk(driver_args* args)
{
  8067ca:	f3 0f 1e fa          	endbr64 
  8067ce:	55                   	push   rbp
  8067cf:	48 89 e5             	mov    rbp,rsp
  8067d2:	48 83 ec 20          	sub    rsp,0x20
  8067d6:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  8067da:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8067de:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8067e1:	48 98                	cdqe   
  8067e3:	48 89 c2             	mov    rdx,rax
  8067e6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8067ea:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8067ed:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8067f1:	8b 00                	mov    eax,DWORD PTR [rax]
  8067f3:	89 ce                	mov    esi,ecx
  8067f5:	89 c7                	mov    edi,eax
  8067f7:	e8 90 05 00 00       	call   806d8c <read_disk_asm>
  8067fc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  8067ff:	48 8b 05 1a 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2211a]        # 428920 <running_req>
  806806:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  80680d:	48 8b 05 0c 21 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2210c]        # 428920 <running_req>
  806814:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806818:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  80681f:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806822:	48 c7 05 f3 20 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc220f3],0x0        # 428920 <running_req>
  806829:	00 00 00 00 
    return ret;
  80682d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806830:	c9                   	leave  
  806831:	c3                   	ret    

0000000000806832 <write_disk>:
int write_disk(driver_args* args)
{
  806832:	f3 0f 1e fa          	endbr64 
  806836:	55                   	push   rbp
  806837:	48 89 e5             	mov    rbp,rsp
  80683a:	48 83 ec 20          	sub    rsp,0x20
  80683e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  806842:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806846:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806849:	48 98                	cdqe   
  80684b:	48 89 c2             	mov    rdx,rax
  80684e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806852:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806855:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806859:	8b 00                	mov    eax,DWORD PTR [rax]
  80685b:	89 ce                	mov    esi,ecx
  80685d:	89 c7                	mov    edi,eax
  80685f:	e8 a8 05 00 00       	call   806e0c <write_disk_asm>
  806864:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  806867:	48 8b 05 b2 20 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc220b2]        # 428920 <running_req>
  80686e:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  806875:	48 8b 05 a4 20 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc220a4]        # 428920 <running_req>
  80687c:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806880:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  806887:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  80688a:	48 c7 05 8b 20 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2208b],0x0        # 428920 <running_req>
  806891:	00 00 00 00 
    return ret;
  806895:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806898:	c9                   	leave  
  806899:	c3                   	ret    

000000000080689a <chk_result>:
int chk_result(int r)
{
  80689a:	f3 0f 1e fa          	endbr64 
  80689e:	55                   	push   rbp
  80689f:	48 89 e5             	mov    rbp,rsp
  8068a2:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  8068a5:	90                   	nop
  8068a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8068a9:	48 63 d0             	movsxd rdx,eax
  8068ac:	48 89 d0             	mov    rax,rdx
  8068af:	48 01 c0             	add    rax,rax
  8068b2:	48 01 d0             	add    rax,rdx
  8068b5:	48 c1 e0 04          	shl    rax,0x4
  8068b9:	48 05 3c 5c 42 00    	add    rax,0x425c3c
  8068bf:	8b 00                	mov    eax,DWORD PTR [rax]
  8068c1:	83 f8 03             	cmp    eax,0x3
  8068c4:	75 e0                	jne    8068a6 <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  8068c6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8068c9:	48 63 d0             	movsxd rdx,eax
  8068cc:	48 89 d0             	mov    rax,rdx
  8068cf:	48 01 c0             	add    rax,rax
  8068d2:	48 01 d0             	add    rax,rdx
  8068d5:	48 c1 e0 04          	shl    rax,0x4
  8068d9:	48 05 40 5c 42 00    	add    rax,0x425c40
  8068df:	8b 00                	mov    eax,DWORD PTR [rax]
  8068e1:	83 f8 01             	cmp    eax,0x1
  8068e4:	0f 94 c0             	sete   al
  8068e7:	0f b6 c0             	movzx  eax,al
}
  8068ea:	5d                   	pop    rbp
  8068eb:	c3                   	ret    

00000000008068ec <disk_existent>:
int disk_existent(int disk)
{
  8068ec:	f3 0f 1e fa          	endbr64 
  8068f0:	55                   	push   rbp
  8068f1:	48 89 e5             	mov    rbp,rsp
  8068f4:	48 83 ec 10          	sub    rsp,0x10
  8068f8:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  8068fb:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8068ff:	74 5f                	je     806960 <disk_existent+0x74>
  806901:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  806905:	7f 6e                	jg     806975 <disk_existent+0x89>
  806907:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  80690b:	74 3e                	je     80694b <disk_existent+0x5f>
  80690d:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  806911:	7f 62                	jg     806975 <disk_existent+0x89>
  806913:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  806917:	74 08                	je     806921 <disk_existent+0x35>
  806919:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  80691d:	74 17                	je     806936 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  80691f:	eb 54                	jmp    806975 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  806921:	bf d4 1d 81 00       	mov    edi,0x811dd4
  806926:	e8 73 c4 ff ff       	call   802d9e <sys_find_dev>
  80692b:	83 f8 ff             	cmp    eax,0xffffffff
  80692e:	0f 95 c0             	setne  al
  806931:	0f b6 c0             	movzx  eax,al
  806934:	eb 45                	jmp    80697b <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  806936:	bf d8 1d 81 00       	mov    edi,0x811dd8
  80693b:	e8 5e c4 ff ff       	call   802d9e <sys_find_dev>
  806940:	83 f8 ff             	cmp    eax,0xffffffff
  806943:	0f 95 c0             	setne  al
  806946:	0f b6 c0             	movzx  eax,al
  806949:	eb 30                	jmp    80697b <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  80694b:	bf dc 1d 81 00       	mov    edi,0x811ddc
  806950:	e8 49 c4 ff ff       	call   802d9e <sys_find_dev>
  806955:	83 f8 ff             	cmp    eax,0xffffffff
  806958:	0f 95 c0             	setne  al
  80695b:	0f b6 c0             	movzx  eax,al
  80695e:	eb 1b                	jmp    80697b <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  806960:	bf e0 1d 81 00       	mov    edi,0x811de0
  806965:	e8 34 c4 ff ff       	call   802d9e <sys_find_dev>
  80696a:	83 f8 ff             	cmp    eax,0xffffffff
  80696d:	0f 95 c0             	setne  al
  806970:	0f b6 c0             	movzx  eax,al
  806973:	eb 06                	jmp    80697b <disk_existent+0x8f>
        break;
  806975:	90                   	nop
    }
    return 0;
  806976:	b8 00 00 00 00       	mov    eax,0x0
}
  80697b:	c9                   	leave  
  80697c:	c3                   	ret    

000000000080697d <hd_iterate>:
int hd_iterate()
{
  80697d:	f3 0f 1e fa          	endbr64 
  806981:	55                   	push   rbp
  806982:	48 89 e5             	mov    rbp,rsp
  806985:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  80698c:	41 b8 00 00 00 00    	mov    r8d,0x0
  806992:	b9 01 00 00 00       	mov    ecx,0x1
  806997:	ba 00 00 00 00       	mov    edx,0x0
  80699c:	be 02 00 00 00       	mov    esi,0x2
  8069a1:	bf 00 00 00 00       	mov    edi,0x0
  8069a6:	e8 3b f8 ff ff       	call   8061e6 <request>
  8069ab:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  8069ae:	41 b8 00 00 00 00    	mov    r8d,0x0
  8069b4:	b9 01 00 00 00       	mov    ecx,0x1
  8069b9:	ba 00 00 00 00       	mov    edx,0x0
  8069be:	be 02 00 00 00       	mov    esi,0x2
  8069c3:	bf 01 00 00 00       	mov    edi,0x1
  8069c8:	e8 19 f8 ff ff       	call   8061e6 <request>
  8069cd:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  8069d0:	41 b8 00 00 00 00    	mov    r8d,0x0
  8069d6:	b9 01 00 00 00       	mov    ecx,0x1
  8069db:	ba 00 00 00 00       	mov    edx,0x0
  8069e0:	be 02 00 00 00       	mov    esi,0x2
  8069e5:	bf 02 00 00 00       	mov    edi,0x2
  8069ea:	e8 f7 f7 ff ff       	call   8061e6 <request>
  8069ef:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  8069f2:	41 b8 00 00 00 00    	mov    r8d,0x0
  8069f8:	b9 01 00 00 00       	mov    ecx,0x1
  8069fd:	ba 00 00 00 00       	mov    edx,0x0
  806a02:	be 02 00 00 00       	mov    esi,0x2
  806a07:	bf 03 00 00 00       	mov    edi,0x3
  806a0c:	e8 d5 f7 ff ff       	call   8061e6 <request>
  806a11:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<4;i++)
  806a14:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806a1b:	e9 72 01 00 00       	jmp    806b92 <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  806a20:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806a24:	74 3b                	je     806a61 <hd_iterate+0xe4>
  806a26:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806a2a:	7f 3e                	jg     806a6a <hd_iterate+0xed>
  806a2c:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806a30:	74 26                	je     806a58 <hd_iterate+0xdb>
  806a32:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806a36:	7f 32                	jg     806a6a <hd_iterate+0xed>
  806a38:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  806a3c:	74 08                	je     806a46 <hd_iterate+0xc9>
  806a3e:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  806a42:	74 0b                	je     806a4f <hd_iterate+0xd2>
  806a44:	eb 24                	jmp    806a6a <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  806a46:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  806a4d:	eb 25                	jmp    806a74 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  806a4f:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  806a56:	eb 1c                	jmp    806a74 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  806a58:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  806a5f:	eb 13                	jmp    806a74 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  806a61:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  806a68:	eb 0a                	jmp    806a74 <hd_iterate+0xf7>
        default:
            return -1;
  806a6a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806a6f:	e9 28 01 00 00       	jmp    806b9c <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  806a74:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806a77:	48 98                	cdqe   
  806a79:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  806a7d:	89 c7                	mov    edi,eax
  806a7f:	e8 16 fe ff ff       	call   80689a <chk_result>
  806a84:	85 c0                	test   eax,eax
  806a86:	0f 84 81 00 00 00    	je     806b0d <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  806a8c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806a8f:	89 c6                	mov    esi,eax
  806a91:	bf e4 1d 81 00       	mov    edi,0x811de4
  806a96:	b8 00 00 00 00       	mov    eax,0x0
  806a9b:	e8 cf a1 ff ff       	call   800c6f <printf>
            //新硬盘
            device hd={
  806aa0:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  806aa7:	b8 00 00 00 00       	mov    eax,0x0
  806aac:	b9 15 00 00 00       	mov    ecx,0x15
  806ab1:	48 89 d7             	mov    rdi,rdx
  806ab4:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  806ab7:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806aba:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  806ac0:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  806ac7:	00 00 00 
  806aca:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  806ad1:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  806ad4:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  806ad8:	7f 07                	jg     806ae1 <hd_iterate+0x164>
  806ada:	b8 f0 01 00 00       	mov    eax,0x1f0
  806adf:	eb 05                	jmp    806ae6 <hd_iterate+0x169>
  806ae1:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  806ae6:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  806aec:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  806af3:	48 89 c7             	mov    rdi,rax
  806af6:	e8 6b be ff ff       	call   802966 <reg_device>
  806afb:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  806afe:	48 63 d2             	movsxd rdx,edx
  806b01:	89 04 95 40 89 42 00 	mov    DWORD PTR [rdx*4+0x428940],eax
  806b08:	e9 81 00 00 00       	jmp    806b8e <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  806b0d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806b10:	48 98                	cdqe   
  806b12:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  806b16:	89 c7                	mov    edi,eax
  806b18:	e8 7d fd ff ff       	call   80689a <chk_result>
  806b1d:	85 c0                	test   eax,eax
  806b1f:	75 6d                	jne    806b8e <hd_iterate+0x211>
        {
            switch (i)
  806b21:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806b25:	74 3e                	je     806b65 <hd_iterate+0x1e8>
  806b27:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806b2b:	7f 41                	jg     806b6e <hd_iterate+0x1f1>
  806b2d:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806b31:	74 28                	je     806b5b <hd_iterate+0x1de>
  806b33:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806b37:	7f 35                	jg     806b6e <hd_iterate+0x1f1>
  806b39:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  806b3d:	74 08                	je     806b47 <hd_iterate+0x1ca>
  806b3f:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  806b43:	74 0c                	je     806b51 <hd_iterate+0x1d4>
  806b45:	eb 27                	jmp    806b6e <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  806b47:	48 c7 45 f8 d4 1d 81 	mov    QWORD PTR [rbp-0x8],0x811dd4
  806b4e:	00 
  806b4f:	eb 1d                	jmp    806b6e <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  806b51:	48 c7 45 f8 d8 1d 81 	mov    QWORD PTR [rbp-0x8],0x811dd8
  806b58:	00 
  806b59:	eb 13                	jmp    806b6e <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  806b5b:	48 c7 45 f8 dc 1d 81 	mov    QWORD PTR [rbp-0x8],0x811ddc
  806b62:	00 
  806b63:	eb 09                	jmp    806b6e <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  806b65:	48 c7 45 f8 e0 1d 81 	mov    QWORD PTR [rbp-0x8],0x811de0
  806b6c:	00 
  806b6d:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  806b6e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806b72:	48 89 c7             	mov    rdi,rax
  806b75:	e8 24 c2 ff ff       	call   802d9e <sys_find_dev>
  806b7a:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  806b7d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806b80:	89 c7                	mov    edi,eax
  806b82:	e8 eb c8 ff ff       	call   803472 <get_dev>
  806b87:	89 c7                	mov    edi,eax
  806b89:	e8 37 c8 ff ff       	call   8033c5 <dispose_device>
    for(int i=0;i<4;i++)
  806b8e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  806b92:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806b96:	0f 8e 84 fe ff ff    	jle    806a20 <hd_iterate+0xa3>
        }

    }
}
  806b9c:	c9                   	leave  
  806b9d:	c3                   	ret    

0000000000806b9e <async_check_disk>:

int async_check_disk(int disk)
{
  806b9e:	f3 0f 1e fa          	endbr64 
  806ba2:	55                   	push   rbp
  806ba3:	48 89 e5             	mov    rbp,rsp
  806ba6:	48 83 ec 20          	sub    rsp,0x20
  806baa:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  806bad:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  806bb3:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806bb9:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806bbd:	74 06                	je     806bc5 <async_check_disk+0x27>
  806bbf:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806bc3:	75 06                	jne    806bcb <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  806bc5:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  806bcb:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806bcf:	74 06                	je     806bd7 <async_check_disk+0x39>
  806bd1:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806bd5:	75 06                	jne    806bdd <async_check_disk+0x3f>
        chkcmd=0xf0;
  806bd7:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  806bdd:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806be1:	83 c0 02             	add    eax,0x2
  806be4:	0f b7 c0             	movzx  eax,ax
  806be7:	be 01 00 00 00       	mov    esi,0x1
  806bec:	89 c7                	mov    edi,eax
  806bee:	e8 6d dd ff ff       	call   804960 <outb>
    outb(disknr+3,0);
  806bf3:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806bf7:	83 c0 03             	add    eax,0x3
  806bfa:	0f b7 c0             	movzx  eax,ax
  806bfd:	be 00 00 00 00       	mov    esi,0x0
  806c02:	89 c7                	mov    edi,eax
  806c04:	e8 57 dd ff ff       	call   804960 <outb>
    outb(disknr+4,0);
  806c09:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c0d:	83 c0 04             	add    eax,0x4
  806c10:	0f b7 c0             	movzx  eax,ax
  806c13:	be 00 00 00 00       	mov    esi,0x0
  806c18:	89 c7                	mov    edi,eax
  806c1a:	e8 41 dd ff ff       	call   804960 <outb>
    outb(disknr+5,0);
  806c1f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c23:	83 c0 05             	add    eax,0x5
  806c26:	0f b7 c0             	movzx  eax,ax
  806c29:	be 00 00 00 00       	mov    esi,0x0
  806c2e:	89 c7                	mov    edi,eax
  806c30:	e8 2b dd ff ff       	call   804960 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  806c35:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  806c39:	0f b6 d0             	movzx  edx,al
  806c3c:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c40:	83 c0 06             	add    eax,0x6
  806c43:	0f b7 c0             	movzx  eax,ax
  806c46:	89 d6                	mov    esi,edx
  806c48:	89 c7                	mov    edi,eax
  806c4a:	e8 11 dd ff ff       	call   804960 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  806c4f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c53:	83 c0 07             	add    eax,0x7
  806c56:	0f b7 c0             	movzx  eax,ax
  806c59:	be 90 00 00 00       	mov    esi,0x90
  806c5e:	89 c7                	mov    edi,eax
  806c60:	e8 fb dc ff ff       	call   804960 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  806c65:	b8 00 00 00 00       	mov    eax,0x0
}
  806c6a:	c9                   	leave  
  806c6b:	c3                   	ret    

0000000000806c6c <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  806c6c:	f3 0f 1e fa          	endbr64 
  806c70:	55                   	push   rbp
  806c71:	48 89 e5             	mov    rbp,rsp
  806c74:	48 83 ec 18          	sub    rsp,0x18
  806c78:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  806c7c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  806c83:	eb 04                	jmp    806c89 <hd_do_req+0x1d>
  806c85:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806c89:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806c8c:	48 98                	cdqe   
  806c8e:	8b 14 85 40 89 42 00 	mov    edx,DWORD PTR [rax*4+0x428940]
  806c95:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806c99:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  806c9f:	39 c2                	cmp    edx,eax
  806ca1:	75 e2                	jne    806c85 <hd_do_req+0x19>
    switch (args->cmd)
  806ca3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806ca7:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  806cad:	83 f8 04             	cmp    eax,0x4
  806cb0:	74 72                	je     806d24 <hd_do_req+0xb8>
  806cb2:	83 f8 04             	cmp    eax,0x4
  806cb5:	0f 8f 96 00 00 00    	jg     806d51 <hd_do_req+0xe5>
  806cbb:	83 f8 02             	cmp    eax,0x2
  806cbe:	74 0a                	je     806cca <hd_do_req+0x5e>
  806cc0:	83 f8 03             	cmp    eax,0x3
  806cc3:	74 32                	je     806cf7 <hd_do_req+0x8b>
  806cc5:	e9 87 00 00 00       	jmp    806d51 <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  806cca:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806cce:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806cd1:	48 98                	cdqe   
  806cd3:	48 89 c6             	mov    rsi,rax
  806cd6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806cda:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806cdd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806ce1:	8b 10                	mov    edx,DWORD PTR [rax]
  806ce3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806ce6:	49 89 f0             	mov    r8,rsi
  806ce9:	be 00 00 00 00       	mov    esi,0x0
  806cee:	89 c7                	mov    edi,eax
  806cf0:	e8 f1 f4 ff ff       	call   8061e6 <request>
        break;
  806cf5:	eb 61                	jmp    806d58 <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  806cf7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806cfb:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806cfe:	48 98                	cdqe   
  806d00:	48 89 c6             	mov    rsi,rax
  806d03:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d07:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806d0a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d0e:	8b 10                	mov    edx,DWORD PTR [rax]
  806d10:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d13:	49 89 f0             	mov    r8,rsi
  806d16:	be 01 00 00 00       	mov    esi,0x1
  806d1b:	89 c7                	mov    edi,eax
  806d1d:	e8 c4 f4 ff ff       	call   8061e6 <request>
        break;
  806d22:	eb 34                	jmp    806d58 <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  806d24:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d28:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806d2b:	48 98                	cdqe   
  806d2d:	48 89 c6             	mov    rsi,rax
  806d30:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d34:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806d37:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d3b:	8b 10                	mov    edx,DWORD PTR [rax]
  806d3d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d40:	49 89 f0             	mov    r8,rsi
  806d43:	be 02 00 00 00       	mov    esi,0x2
  806d48:	89 c7                	mov    edi,eax
  806d4a:	e8 97 f4 ff ff       	call   8061e6 <request>
        break;
  806d4f:	eb 07                	jmp    806d58 <hd_do_req+0xec>
    default:return -1;
  806d51:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806d56:	eb 1e                	jmp    806d76 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  806d58:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d5c:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  806d63:	00 00 00 
    running_devman_req=args;
  806d66:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d6a:	48 89 05 b7 1b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21bb7],rax        # 428928 <running_devman_req>
    return 0;
  806d71:	b8 00 00 00 00       	mov    eax,0x0
  806d76:	c9                   	leave  
  806d77:	c3                   	ret    
  806d78:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
  806d7f:	00 

0000000000806d80 <disk_int_handler>:
  806d80:	e8 09 dc ff ff       	call   80498e <eoi>
  806d85:	e8 6d f2 ff ff       	call   805ff7 <disk_int_handler_c>
  806d8a:	48 cf                	iretq  

0000000000806d8c <read_disk_asm>:
  806d8c:	55                   	push   rbp
  806d8d:	89 e5                	mov    ebp,esp
  806d8f:	66 ba f7 01          	mov    dx,0x1f7
  806d93:	31 c9                	xor    ecx,ecx
  806d95:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  806d9a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  806d9f:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  806da4:	89 c6                	mov    esi,eax
  806da6:	66 ba f2 01          	mov    dx,0x1f2
  806daa:	88 c8                	mov    al,cl
  806dac:	ee                   	out    dx,al
  806dad:	66 ba f3 01          	mov    dx,0x1f3
  806db1:	89 f0                	mov    eax,esi
  806db3:	ee                   	out    dx,al
  806db4:	66 ff c2             	inc    dx
  806db7:	c1 e8 08             	shr    eax,0x8
  806dba:	ee                   	out    dx,al
  806dbb:	66 ff c2             	inc    dx
  806dbe:	c1 e8 08             	shr    eax,0x8
  806dc1:	ee                   	out    dx,al
  806dc2:	66 ff c2             	inc    dx
  806dc5:	66 c1 e8 08          	shr    ax,0x8
  806dc9:	24 0f                	and    al,0xf
  806dcb:	0c e0                	or     al,0xe0
  806dcd:	ee                   	out    dx,al
  806dce:	66 ff c2             	inc    dx
  806dd1:	b0 20                	mov    al,0x20
  806dd3:	ee                   	out    dx,al

0000000000806dd4 <read_disk_asm.wait>:
  806dd4:	90                   	nop
  806dd5:	ec                   	in     al,dx
  806dd6:	24 88                	and    al,0x88
  806dd8:	3c 08                	cmp    al,0x8
  806dda:	75 f8                	jne    806dd4 <read_disk_asm.wait>
  806ddc:	66 89 d7             	mov    di,dx
  806ddf:	89 c8                	mov    eax,ecx
  806de1:	66 b9 00 01          	mov    cx,0x100
  806de5:	66 f7 e1             	mul    cx
  806de8:	89 c1                	mov    ecx,eax
  806dea:	66 ba f0 01          	mov    dx,0x1f0

0000000000806dee <read_disk_asm.read>:
  806dee:	66 ed                	in     ax,dx
  806df0:	66 67 89 03          	mov    WORD PTR [ebx],ax
  806df4:	83 c3 02             	add    ebx,0x2
  806df7:	e2 f5                	loop   806dee <read_disk_asm.read>
  806df9:	c9                   	leave  
  806dfa:	b8 00 00 00 00       	mov    eax,0x0
  806dff:	c3                   	ret    

0000000000806e00 <read_disk_asm.err_disk_reading>:
  806e00:	66 ba f1 01          	mov    dx,0x1f1
  806e04:	31 c0                	xor    eax,eax
  806e06:	66 ed                	in     ax,dx
  806e08:	89 ec                	mov    esp,ebp
  806e0a:	5d                   	pop    rbp
  806e0b:	c3                   	ret    

0000000000806e0c <write_disk_asm>:
  806e0c:	55                   	push   rbp
  806e0d:	89 e5                	mov    ebp,esp
  806e0f:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  806e14:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  806e19:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  806e1e:	50                   	push   rax
  806e1f:	66 ba f2 01          	mov    dx,0x1f2
  806e23:	88 c8                	mov    al,cl
  806e25:	ee                   	out    dx,al
  806e26:	58                   	pop    rax
  806e27:	66 ba f3 01          	mov    dx,0x1f3
  806e2b:	ee                   	out    dx,al
  806e2c:	c1 e8 08             	shr    eax,0x8
  806e2f:	66 ba f4 01          	mov    dx,0x1f4
  806e33:	ee                   	out    dx,al
  806e34:	c1 e8 08             	shr    eax,0x8
  806e37:	66 ba f5 01          	mov    dx,0x1f5
  806e3b:	ee                   	out    dx,al
  806e3c:	c1 e8 08             	shr    eax,0x8
  806e3f:	24 0f                	and    al,0xf
  806e41:	0c e0                	or     al,0xe0
  806e43:	66 ba f6 01          	mov    dx,0x1f6
  806e47:	ee                   	out    dx,al
  806e48:	66 ba f7 01          	mov    dx,0x1f7
  806e4c:	b0 30                	mov    al,0x30
  806e4e:	ee                   	out    dx,al

0000000000806e4f <write_disk_asm.not_ready2>:
  806e4f:	90                   	nop
  806e50:	ec                   	in     al,dx
  806e51:	24 88                	and    al,0x88
  806e53:	3c 08                	cmp    al,0x8
  806e55:	75 f8                	jne    806e4f <write_disk_asm.not_ready2>
  806e57:	89 c8                	mov    eax,ecx
  806e59:	66 b9 00 01          	mov    cx,0x100
  806e5d:	66 f7 e1             	mul    cx
  806e60:	89 c1                	mov    ecx,eax
  806e62:	66 ba f0 01          	mov    dx,0x1f0

0000000000806e66 <write_disk_asm.go_on_write>:
  806e66:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  806e6a:	66 ef                	out    dx,ax
  806e6c:	83 c3 02             	add    ebx,0x2
  806e6f:	e2 f5                	loop   806e66 <write_disk_asm.go_on_write>
  806e71:	89 ec                	mov    esp,ebp
  806e73:	5d                   	pop    rbp
  806e74:	c3                   	ret    

0000000000806e75 <init_fat16>:

int fat16_drvi;
extern driver drv_disk;
extern int disk_drvi;
int init_fat16()
{
  806e75:	f3 0f 1e fa          	endbr64 
  806e79:	55                   	push   rbp
  806e7a:	48 89 e5             	mov    rbp,rsp
  806e7d:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
    reg_device(&fat16_dev);
  806e84:	bf a0 1e 81 00       	mov    edi,0x811ea0
  806e89:	e8 d8 ba ff ff       	call   802966 <reg_device>
    fat16_drvi=reg_driver(&fat16_drv);
  806e8e:	bf 00 1e 81 00       	mov    edi,0x811e00
  806e93:	e8 b6 bd ff ff       	call   802c4e <reg_driver>
  806e98:	89 05 26 9d c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29d26],eax        # 430bc4 <fat16_drvi>
    driver_args arg;
    load(&arg);//syscall(SYSCALL_CALL_DRVFUNC,fat16_drvi,DRVF_OPEN,&arg,0,0);
  806e9e:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  806ea5:	48 89 c7             	mov    rdi,rax
  806ea8:	e8 26 00 00 00       	call   806ed3 <load>
    reg_vol(disk_drvi,fat16_drvi,"a");
  806ead:	8b 0d 11 9d c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc29d11]        # 430bc4 <fat16_drvi>
  806eb3:	8b 05 77 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a77]        # 428930 <disk_drvi>
  806eb9:	ba 48 1f 81 00       	mov    edx,0x811f48
  806ebe:	89 ce                	mov    esi,ecx
  806ec0:	89 c7                	mov    edi,eax
  806ec2:	b8 00 00 00 00       	mov    eax,0x0
  806ec7:	e8 22 aa ff ff       	call   8018ee <reg_vol>
    return 0;
  806ecc:	b8 00 00 00 00       	mov    eax,0x0
}
  806ed1:	c9                   	leave  
  806ed2:	c3                   	ret    

0000000000806ed3 <load>:
int load(driver_args *args)
{
  806ed3:	f3 0f 1e fa          	endbr64 
  806ed7:	55                   	push   rbp
  806ed8:	48 89 e5             	mov    rbp,rsp
  806edb:	48 83 ec 20          	sub    rsp,0x20
  806edf:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    //sys_read superblock
    int req_id=-1;
  806ee3:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    read_sec(&superblock,0,1);
  806eea:	ba 01 00 00 00       	mov    edx,0x1
  806eef:	be 00 00 00 00       	mov    esi,0x0
  806ef4:	bf 60 89 42 00       	mov    edi,0x428960
  806ef9:	e8 61 0b 00 00       	call   807a5f <read_sec>
    //只能一个一个读
    read_sec(fat,superblock.rsvdSec,superblock.secPerFAT);
  806efe:	0f b7 05 71 1a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21a71]        # 428976 <superblock+0x16>
  806f05:	0f b7 d0             	movzx  edx,ax
  806f08:	0f b7 05 5f 1a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21a5f]        # 42896e <superblock+0xe>
  806f0f:	0f b7 c0             	movzx  eax,ax
  806f12:	89 c6                	mov    esi,eax
  806f14:	bf c0 cb 42 00       	mov    edi,0x42cbc0
  806f19:	e8 41 0b 00 00       	call   807a5f <read_sec>

    //sys_read root
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  806f1e:	0f b7 05 49 1a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21a49]        # 42896e <superblock+0xe>
  806f25:	0f b7 c8             	movzx  ecx,ax
  806f28:	0f b7 05 47 1a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21a47]        # 428976 <superblock+0x16>
  806f2f:	0f b7 d0             	movzx  edx,ax
    superblock.numOfFAT;
  806f32:	0f b6 05 37 1a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21a37]        # 428970 <superblock+0x10>
  806f39:	0f b6 c0             	movzx  eax,al
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  806f3c:	0f af c2             	imul   eax,edx
  806f3f:	01 c8                	add    eax,ecx
  806f41:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //printf("root sec num:%d\n",root_sec_num);
    //usually a root dir has 32 secs
    int root_sec_c=((u32)superblock.rootEntries* sizeof(dir_entry))/(u32)superblock.bytesPerSec;
  806f44:	0f b7 05 26 1a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21a26]        # 428971 <superblock+0x11>
  806f4b:	0f b7 c0             	movzx  eax,ax
  806f4e:	48 c1 e0 05          	shl    rax,0x5
  806f52:	0f b7 15 12 1a c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc21a12]        # 42896b <superblock+0xb>
  806f59:	0f b7 ca             	movzx  ecx,dx
  806f5c:	ba 00 00 00 00       	mov    edx,0x0
  806f61:	48 f7 f1             	div    rcx
  806f64:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    read_sec(root_dir,root_sec_num,root_sec_c);
  806f67:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  806f6a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806f6d:	89 c6                	mov    esi,eax
  806f6f:	bf a0 89 42 00       	mov    edi,0x4289a0
  806f74:	e8 e6 0a 00 00       	call   807a5f <read_sec>

    cur_dir.fistCluNum=0;
  806f79:	66 c7 05 38 5a c2 ff 	mov    WORD PTR [rip+0xffffffffffc25a38],0x0        # 42c9ba <cur_dir+0x1a>
  806f80:	00 00 

    //set some vars
    //why? because the .bss won't be packed into bin so any init
    //of global var in .c is meaningless.
    clu_sec_balance=superblock.rsvdSec+32+32-2;//63;
  806f82:	0f b7 05 e5 19 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc219e5]        # 42896e <superblock+0xe>
  806f89:	0f b7 c0             	movzx  eax,ax
  806f8c:	83 c0 3e             	add    eax,0x3e
  806f8f:	89 05 4b 31 00 00    	mov    DWORD PTR [rip+0x314b],eax        # 80a0e0 <clu_sec_balance>
    //printf("clu sec bal:%d\n",clu_sec_balance);
    dir_depth=0;
  806f95:	c7 05 21 9c c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29c21],0x0        # 430bc0 <dir_depth>
  806f9c:	00 00 00 
    return 0;
  806f9f:	b8 00 00 00 00       	mov    eax,0x0

}
  806fa4:	c9                   	leave  
  806fa5:	c3                   	ret    

0000000000806fa6 <verify_name>:

//检查输入的文件名长度是否合法，以及是否出现非法字符（但是不检查大小写和.）
//返回值为布尔值。
int verify_name(char *str)
{
  806fa6:	f3 0f 1e fa          	endbr64 
  806faa:	55                   	push   rbp
  806fab:	48 89 e5             	mov    rbp,rsp
  806fae:	48 83 ec 70          	sub    rsp,0x70
  806fb2:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
    char valid_ch[]="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,/![]|+";
  806fb6:	48 b8 61 62 63 64 65 	movabs rax,0x6867666564636261
  806fbd:	66 67 68 
  806fc0:	48 ba 69 6a 6b 6c 6d 	movabs rdx,0x706f6e6d6c6b6a69
  806fc7:	6e 6f 70 
  806fca:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  806fce:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  806fd2:	48 b8 71 72 73 74 75 	movabs rax,0x7877767574737271
  806fd9:	76 77 78 
  806fdc:	48 ba 79 7a 41 42 43 	movabs rdx,0x4645444342417a79
  806fe3:	44 45 46 
  806fe6:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  806fea:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  806fee:	48 b8 47 48 49 4a 4b 	movabs rax,0x4e4d4c4b4a494847
  806ff5:	4c 4d 4e 
  806ff8:	48 ba 4f 50 51 52 53 	movabs rdx,0x565554535251504f
  806fff:	54 55 56 
  807002:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  807006:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  80700a:	48 b8 57 58 59 5a 30 	movabs rax,0x333231305a595857
  807011:	31 32 33 
  807014:	48 ba 34 35 36 37 38 	movabs rdx,0x2f2c393837363534
  80701b:	39 2c 2f 
  80701e:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  807022:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  807026:	c7 45 e0 21 5b 5d 7c 	mov    DWORD PTR [rbp-0x20],0x7c5d5b21
  80702d:	66 c7 45 e4 2b 00    	mov    WORD PTR [rbp-0x1c],0x2b
    if(strlen(str)>11||strlen(str)==0) {
  807033:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807037:	48 89 c7             	mov    rdi,rax
  80703a:	e8 24 28 00 00       	call   809863 <strlen>
  80703f:	83 f8 0b             	cmp    eax,0xb
  807042:	7f 10                	jg     807054 <verify_name+0xae>
  807044:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807048:	48 89 c7             	mov    rdi,rax
  80704b:	e8 13 28 00 00       	call   809863 <strlen>
  807050:	85 c0                	test   eax,eax
  807052:	75 0a                	jne    80705e <verify_name+0xb8>
        //printf("length not valid\n");
        return 0;
  807054:	b8 00 00 00 00       	mov    eax,0x0
  807059:	e9 b3 01 00 00       	jmp    807211 <verify_name+0x26b>
    }
    int c=0,i=0,flag=0,vchf=1;
  80705e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807065:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80706c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  807073:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [rbp-0x18],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  80707a:	eb 6b                	jmp    8070e7 <verify_name+0x141>
    {
        int j=0;
  80707c:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        for(;j<sizeof(valid_ch);j++)
  807083:	eb 22                	jmp    8070a7 <verify_name+0x101>
            if(str[i]==valid_ch[j])break;
  807085:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807088:	48 63 d0             	movsxd rdx,eax
  80708b:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80708f:	48 01 d0             	add    rax,rdx
  807092:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  807095:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  807098:	48 98                	cdqe   
  80709a:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  80709f:	38 c2                	cmp    dl,al
  8070a1:	74 0e                	je     8070b1 <verify_name+0x10b>
        for(;j<sizeof(valid_ch);j++)
  8070a3:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8070a7:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8070aa:	83 f8 45             	cmp    eax,0x45
  8070ad:	76 d6                	jbe    807085 <verify_name+0xdf>
  8070af:	eb 01                	jmp    8070b2 <verify_name+0x10c>
            if(str[i]==valid_ch[j])break;
  8070b1:	90                   	nop
        if(j>=sizeof(valid_ch))
  8070b2:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8070b5:	83 f8 45             	cmp    eax,0x45
  8070b8:	76 0a                	jbe    8070c4 <verify_name+0x11e>
        {
            //printf("invalid char\n");
            return 0;//出现非法字符
  8070ba:	b8 00 00 00 00       	mov    eax,0x0
  8070bf:	e9 4d 01 00 00       	jmp    807211 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  8070c4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8070c7:	48 63 d0             	movsxd rdx,eax
  8070ca:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8070ce:	48 01 d0             	add    rax,rdx
  8070d1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070d4:	3c 20                	cmp    al,0x20
  8070d6:	74 07                	je     8070df <verify_name+0x139>
  8070d8:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        c++;
  8070df:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  8070e3:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8070e7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8070ea:	48 63 d0             	movsxd rdx,eax
  8070ed:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8070f1:	48 01 d0             	add    rax,rdx
  8070f4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8070f7:	3c 2e                	cmp    al,0x2e
  8070f9:	74 18                	je     807113 <verify_name+0x16d>
  8070fb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8070fe:	48 63 d0             	movsxd rdx,eax
  807101:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807105:	48 01 d0             	add    rax,rdx
  807108:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80710b:	84 c0                	test   al,al
  80710d:	0f 85 69 ff ff ff    	jne    80707c <verify_name+0xd6>
    }
    if(c>8||flag==0){
  807113:	83 7d fc 08          	cmp    DWORD PTR [rbp-0x4],0x8
  807117:	7f 06                	jg     80711f <verify_name+0x179>
  807119:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80711d:	75 0a                	jne    807129 <verify_name+0x183>
        //printf("file name blank\n");
        return 0;//不能全是空格
  80711f:	b8 00 00 00 00       	mov    eax,0x0
  807124:	e9 e8 00 00 00       	jmp    807211 <verify_name+0x26b>
    }
    if(str[i]=='\0')//没有扩展名
  807129:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80712c:	48 63 d0             	movsxd rdx,eax
  80712f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807133:	48 01 d0             	add    rax,rdx
  807136:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807139:	84 c0                	test   al,al
  80713b:	75 0a                	jne    807147 <verify_name+0x1a1>
        return 1;
  80713d:	b8 01 00 00 00       	mov    eax,0x1
  807142:	e9 ca 00 00 00       	jmp    807211 <verify_name+0x26b>
    c=0;
  807147:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    flag=0;
  80714e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(i++;str[i]!='\0';i++)
  807155:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807159:	e9 83 00 00 00       	jmp    8071e1 <verify_name+0x23b>
    {
        int j=0;
  80715e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
        for(;j<sizeof(valid_ch);j++)
  807165:	eb 22                	jmp    807189 <verify_name+0x1e3>
            if(str[i]==valid_ch[j])break;
  807167:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80716a:	48 63 d0             	movsxd rdx,eax
  80716d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807171:	48 01 d0             	add    rax,rdx
  807174:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  807177:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80717a:	48 98                	cdqe   
  80717c:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  807181:	38 c2                	cmp    dl,al
  807183:	74 0e                	je     807193 <verify_name+0x1ed>
        for(;j<sizeof(valid_ch);j++)
  807185:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  807189:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80718c:	83 f8 45             	cmp    eax,0x45
  80718f:	76 d6                	jbe    807167 <verify_name+0x1c1>
  807191:	eb 01                	jmp    807194 <verify_name+0x1ee>
            if(str[i]==valid_ch[j])break;
  807193:	90                   	nop
        if(j>=sizeof(valid_ch)){
  807194:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807197:	83 f8 45             	cmp    eax,0x45
  80719a:	76 07                	jbe    8071a3 <verify_name+0x1fd>
            //printf("invalid char:%x\n",str[i]);
            return 0;//出现非法字符
  80719c:	b8 00 00 00 00       	mov    eax,0x0
  8071a1:	eb 6e                	jmp    807211 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  8071a3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8071a6:	48 63 d0             	movsxd rdx,eax
  8071a9:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8071ad:	48 01 d0             	add    rax,rdx
  8071b0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8071b3:	3c 20                	cmp    al,0x20
  8071b5:	74 07                	je     8071be <verify_name+0x218>
  8071b7:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        if(str[i]=='.'){
  8071be:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8071c1:	48 63 d0             	movsxd rdx,eax
  8071c4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8071c8:	48 01 d0             	add    rax,rdx
  8071cb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8071ce:	3c 2e                	cmp    al,0x2e
  8071d0:	75 07                	jne    8071d9 <verify_name+0x233>
            //printf("multiple dots.");
            return 0;//不能多次出现.
  8071d2:	b8 00 00 00 00       	mov    eax,0x0
  8071d7:	eb 38                	jmp    807211 <verify_name+0x26b>
        }
        c++;
  8071d9:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(i++;str[i]!='\0';i++)
  8071dd:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8071e1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8071e4:	48 63 d0             	movsxd rdx,eax
  8071e7:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8071eb:	48 01 d0             	add    rax,rdx
  8071ee:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8071f1:	84 c0                	test   al,al
  8071f3:	0f 85 65 ff ff ff    	jne    80715e <verify_name+0x1b8>
    }
    if(c>3||flag==0){
  8071f9:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8071fd:	7f 06                	jg     807205 <verify_name+0x25f>
  8071ff:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  807203:	75 07                	jne    80720c <verify_name+0x266>
        //printf("file name blank\n");
        return 0;//不能全是空格
  807205:	b8 00 00 00 00       	mov    eax,0x0
  80720a:	eb 05                	jmp    807211 <verify_name+0x26b>
    }
    return 1;
  80720c:	b8 01 00 00 00       	mov    eax,0x1
}
  807211:	c9                   	leave  
  807212:	c3                   	ret    

0000000000807213 <format_name>:
//将“aaa.bb”的文件名形式转换为可以直接strcmp(,,11)的形式。
//默认文件名合法，请先检查文件名再使用。
void format_name(char *str)
{
  807213:	f3 0f 1e fa          	endbr64 
  807217:	55                   	push   rbp
  807218:	48 89 e5             	mov    rbp,rsp
  80721b:	48 83 ec 30          	sub    rsp,0x30
  80721f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char v[12]="           ";
  807223:	48 b8 20 20 20 20 20 	movabs rax,0x2020202020202020
  80722a:	20 20 20 
  80722d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  807231:	c7 45 f0 20 20 20 00 	mov    DWORD PTR [rbp-0x10],0x202020
    int ptr=0;
  807238:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    int namelen=0;
  80723f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    for(int i=0;str[i]!='\0';i++)
  807246:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80724d:	e9 9b 00 00 00       	jmp    8072ed <format_name+0xda>
    {
        if(str[i]>='a'&&str[i]<='z')
  807252:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807255:	48 63 d0             	movsxd rdx,eax
  807258:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80725c:	48 01 d0             	add    rax,rdx
  80725f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807262:	3c 60                	cmp    al,0x60
  807264:	7e 3e                	jle    8072a4 <format_name+0x91>
  807266:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807269:	48 63 d0             	movsxd rdx,eax
  80726c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807270:	48 01 d0             	add    rax,rdx
  807273:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807276:	3c 7a                	cmp    al,0x7a
  807278:	7f 2a                	jg     8072a4 <format_name+0x91>
        {
            v[ptr++]=str[i]-'a'+'A';
  80727a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80727d:	48 63 d0             	movsxd rdx,eax
  807280:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807284:	48 01 d0             	add    rax,rdx
  807287:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80728a:	8d 48 e0             	lea    ecx,[rax-0x20]
  80728d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807290:	8d 50 01             	lea    edx,[rax+0x1]
  807293:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  807296:	89 ca                	mov    edx,ecx
  807298:	48 98                	cdqe   
  80729a:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  80729e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8072a2:	eb 45                	jmp    8072e9 <format_name+0xd6>
        }
        else if(str[i]=='.')
  8072a4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8072a7:	48 63 d0             	movsxd rdx,eax
  8072aa:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8072ae:	48 01 d0             	add    rax,rdx
  8072b1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8072b4:	3c 2e                	cmp    al,0x2e
  8072b6:	75 0d                	jne    8072c5 <format_name+0xb2>
        {
            ptr+=(8-namelen);
  8072b8:	b8 08 00 00 00       	mov    eax,0x8
  8072bd:	2b 45 f8             	sub    eax,DWORD PTR [rbp-0x8]
  8072c0:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
  8072c3:	eb 24                	jmp    8072e9 <format_name+0xd6>
        }else
        {
            v[ptr++]=str[i];
  8072c5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8072c8:	48 63 d0             	movsxd rdx,eax
  8072cb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8072cf:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  8072d3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8072d6:	8d 50 01             	lea    edx,[rax+0x1]
  8072d9:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  8072dc:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
  8072df:	48 98                	cdqe   
  8072e1:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  8072e5:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
    for(int i=0;str[i]!='\0';i++)
  8072e9:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8072ed:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8072f0:	48 63 d0             	movsxd rdx,eax
  8072f3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8072f7:	48 01 d0             	add    rax,rdx
  8072fa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8072fd:	84 c0                	test   al,al
  8072ff:	0f 85 4d ff ff ff    	jne    807252 <format_name+0x3f>
        }
    }
    v[12]='\0';
  807305:	c6 45 f4 00          	mov    BYTE PTR [rbp-0xc],0x0
    strcpy(str,v);
  807309:	48 8d 55 e8          	lea    rdx,[rbp-0x18]
  80730d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807311:	48 89 d6             	mov    rsi,rdx
  807314:	48 89 c7             	mov    rdi,rax
  807317:	e8 28 23 00 00       	call   809644 <strcpy>
}
  80731c:	90                   	nop
  80731d:	c9                   	leave  
  80731e:	c3                   	ret    

000000000080731f <req_cluster>:
int req_cluster()
{
  80731f:	f3 0f 1e fa          	endbr64 
  807323:	55                   	push   rbp
  807324:	48 89 e5             	mov    rbp,rsp
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  807327:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [rbp-0x4],0x3
  80732e:	eb 2a                	jmp    80735a <req_cluster+0x3b>
    {
        if(fat[i]==0)
  807330:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807333:	48 98                	cdqe   
  807335:	0f b7 84 00 c0 cb 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cbc0]
  80733c:	00 
  80733d:	66 85 c0             	test   ax,ax
  807340:	75 14                	jne    807356 <req_cluster+0x37>
        {
            fat[i]=0xffff;
  807342:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807345:	48 98                	cdqe   
  807347:	66 c7 84 00 c0 cb 42 	mov    WORD PTR [rax+rax*1+0x42cbc0],0xffff
  80734e:	00 ff ff 
            return i;
  807351:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807354:	eb 13                	jmp    807369 <req_cluster+0x4a>
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  807356:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80735a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80735d:	3d ff 1f 00 00       	cmp    eax,0x1fff
  807362:	76 cc                	jbe    807330 <req_cluster+0x11>
        }
    }
    return -1;
  807364:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  807369:	5d                   	pop    rbp
  80736a:	c3                   	ret    

000000000080736b <write_sec>:
int write_sec(char *src, int sec_num, int sec_c)
{
  80736b:	f3 0f 1e fa          	endbr64 
  80736f:	55                   	push   rbp
  807370:	48 89 e5             	mov    rbp,rsp
  807373:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
  80737a:	48 89 bd 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rdi
  807381:	89 b5 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],esi
  807387:	89 95 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],edx
    driver_args arg={
  80738d:	48 8d 95 40 ff ff ff 	lea    rdx,[rbp-0xc0]
  807394:	b8 00 00 00 00       	mov    eax,0x0
  807399:	b9 18 00 00 00       	mov    ecx,0x18
  80739e:	48 89 d7             	mov    rdi,rdx
  8073a1:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  8073a4:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  8073ab:	89 85 48 ff ff ff    	mov    DWORD PTR [rbp-0xb8],eax
  8073b1:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  8073b7:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
  8073bd:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  8073c3:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            .src_addr=src,
            .sec_n=sec_num,
            .sec_c=sec_c
    };
    return drv_disk.read(&arg);
  8073c9:	48 8b 15 88 2c 00 00 	mov    rdx,QWORD PTR [rip+0x2c88]        # 80a058 <drv_disk+0x18>
  8073d0:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  8073d7:	48 89 c7             	mov    rdi,rax
  8073da:	ff d2                	call   rdx
}
  8073dc:	c9                   	leave  
  8073dd:	c3                   	ret    

00000000008073de <set_attr>:
void set_attr(dir_entry *f,char attr)
{
  8073de:	f3 0f 1e fa          	endbr64 
  8073e2:	55                   	push   rbp
  8073e3:	48 89 e5             	mov    rbp,rsp
  8073e6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8073ea:	89 f0                	mov    eax,esi
  8073ec:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    f->attr|=attr;
  8073ef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8073f3:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8073f7:	0a 45 f4             	or     al,BYTE PTR [rbp-0xc]
  8073fa:	89 c2                	mov    edx,eax
  8073fc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807400:	88 50 0b             	mov    BYTE PTR [rax+0xb],dl
}
  807403:	90                   	nop
  807404:	5d                   	pop    rbp
  807405:	c3                   	ret    

0000000000807406 <update_fat_and_root>:
mkdir
touch
rm
*/
void update_fat_and_root()
{
  807406:	f3 0f 1e fa          	endbr64 
  80740a:	55                   	push   rbp
  80740b:	48 89 e5             	mov    rbp,rsp
  80740e:	48 83 ec 10          	sub    rsp,0x10
    int root_loc=superblock.rsvdSec+\
  807412:	0f b7 05 55 15 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21555]        # 42896e <superblock+0xe>
  807419:	0f b7 c8             	movzx  ecx,ax
    superblock.secPerFAT*superblock.numOfFAT;
  80741c:	0f b7 05 53 15 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21553]        # 428976 <superblock+0x16>
  807423:	0f b7 d0             	movzx  edx,ax
  807426:	0f b6 05 43 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21543]        # 428970 <superblock+0x10>
  80742d:	0f b6 c0             	movzx  eax,al
  807430:	0f af c2             	imul   eax,edx
    int root_loc=superblock.rsvdSec+\
  807433:	01 c8                	add    eax,ecx
  807435:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("root_loc:0x%x\n",root_loc);
    write_sec(root_dir,root_loc,sizeof(root_dir));
  807438:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80743b:	ba 00 40 00 00       	mov    edx,0x4000
  807440:	89 c6                	mov    esi,eax
  807442:	bf a0 89 42 00       	mov    edi,0x4289a0
  807447:	e8 1f ff ff ff       	call   80736b <write_sec>
    //printf("updated root\n");
    write_sec(fat,superblock.rsvdSec,sizeof(fat));
  80744c:	0f b7 05 1b 15 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2151b]        # 42896e <superblock+0xe>
  807453:	0f b7 c0             	movzx  eax,ax
  807456:	ba 00 40 00 00       	mov    edx,0x4000
  80745b:	89 c6                	mov    esi,eax
  80745d:	bf c0 cb 42 00       	mov    edi,0x42cbc0
  807462:	e8 04 ff ff ff       	call   80736b <write_sec>
    //printf("updated fat\n");

}
  807467:	90                   	nop
  807468:	c9                   	leave  
  807469:	c3                   	ret    

000000000080746a <add_dot_and_ddot_dir>:
void add_dot_and_ddot_dir(dir_entry dir)
{
  80746a:	f3 0f 1e fa          	endbr64 
  80746e:	55                   	push   rbp
  80746f:	48 89 e5             	mov    rbp,rsp
  807472:	48 83 ec 10          	sub    rsp,0x10
    //it must be a regular dir to add. and ..
    //and this must be done when the dir is created
    //regular dir
    int cluster = dir.fistCluNum;
  807476:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  80747a:	0f b7 c0             	movzx  eax,ax
  80747d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
    superblock.secPerClu);
  807480:	0f b6 05 e6 14 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc214e6]        # 42896d <superblock+0xd>
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  807487:	0f b6 c0             	movzx  eax,al
  80748a:	8b 0d 50 2c 00 00    	mov    ecx,DWORD PTR [rip+0x2c50]        # 80a0e0 <clu_sec_balance>
  807490:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  807493:	01 d1                	add    ecx,edx
  807495:	89 c2                	mov    edx,eax
  807497:	89 ce                	mov    esi,ecx
  807499:	bf c0 c9 42 00       	mov    edi,0x42c9c0
  80749e:	e8 bc 05 00 00       	call   807a5f <read_sec>
    //.
    strcpy(a_clu_of_dir[0].name,".       ");
  8074a3:	be 4a 1f 81 00       	mov    esi,0x811f4a
  8074a8:	bf c0 c9 42 00       	mov    edi,0x42c9c0
  8074ad:	e8 92 21 00 00       	call   809644 <strcpy>
    strcpy(a_clu_of_dir[0].extension,"   ");
  8074b2:	be 53 1f 81 00       	mov    esi,0x811f53
  8074b7:	bf c8 c9 42 00       	mov    edi,0x42c9c8
  8074bc:	e8 83 21 00 00       	call   809644 <strcpy>
    a_clu_of_dir[0].fistCluNum=dir.fistCluNum;
  8074c1:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  8074c5:	66 89 05 0e 55 c2 ff 	mov    WORD PTR [rip+0xffffffffffc2550e],ax        # 42c9da <a_clu_of_dir+0x1a>
    a_clu_of_dir[0].len=0;
  8074cc:	c7 05 06 55 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc25506],0x0        # 42c9dc <a_clu_of_dir+0x1c>
  8074d3:	00 00 00 
    set_attr(&a_clu_of_dir[0],ATTR_DIR);
  8074d6:	be 10 00 00 00       	mov    esi,0x10
  8074db:	bf c0 c9 42 00       	mov    edi,0x42c9c0
  8074e0:	e8 f9 fe ff ff       	call   8073de <set_attr>
    //..
    strcpy(a_clu_of_dir[1].name,"..      ");
  8074e5:	be 57 1f 81 00       	mov    esi,0x811f57
  8074ea:	bf e0 c9 42 00       	mov    edi,0x42c9e0
  8074ef:	e8 50 21 00 00       	call   809644 <strcpy>
    strcpy(a_clu_of_dir[1].extension,"   ");
  8074f4:	be 53 1f 81 00       	mov    esi,0x811f53
  8074f9:	bf e8 c9 42 00       	mov    edi,0x42c9e8
  8074fe:	e8 41 21 00 00       	call   809644 <strcpy>
    a_clu_of_dir[1].fistCluNum=cur_dir.fistCluNum;
  807503:	0f b7 05 b0 54 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc254b0]        # 42c9ba <cur_dir+0x1a>
  80750a:	66 89 05 e9 54 c2 ff 	mov    WORD PTR [rip+0xffffffffffc254e9],ax        # 42c9fa <a_clu_of_dir+0x3a>
    a_clu_of_dir[1].len=0;
  807511:	c7 05 e1 54 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc254e1],0x0        # 42c9fc <a_clu_of_dir+0x3c>
  807518:	00 00 00 
    set_attr(&a_clu_of_dir[1],ATTR_DIR);
  80751b:	be 10 00 00 00       	mov    esi,0x10
  807520:	bf e0 c9 42 00       	mov    edi,0x42c9e0
  807525:	e8 b4 fe ff ff       	call   8073de <set_attr>
    //update the dir
    int dir_loc=cluster+clu_sec_balance;
  80752a:	8b 15 b0 2b 00 00    	mov    edx,DWORD PTR [rip+0x2bb0]        # 80a0e0 <clu_sec_balance>
  807530:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807533:	01 d0                	add    eax,edx
  807535:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  807538:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80753b:	ba 00 02 00 00       	mov    edx,0x200
  807540:	89 c6                	mov    esi,eax
  807542:	bf c0 c9 42 00       	mov    edi,0x42c9c0
  807547:	e8 1f fe ff ff       	call   80736b <write_sec>
    //no need to update fat and root
}
  80754c:	90                   	nop
  80754d:	c9                   	leave  
  80754e:	c3                   	ret    

000000000080754f <translate_attr>:
void translate_attr(char attr,char *attr_s)
{
  80754f:	f3 0f 1e fa          	endbr64 
  807553:	55                   	push   rbp
  807554:	48 89 e5             	mov    rbp,rsp
  807557:	89 f8                	mov    eax,edi
  807559:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80755d:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    //rwhds (s: system h:hidden)
    int v=attr&1;
  807560:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807564:	83 e0 01             	and    eax,0x1
  807567:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//sys_read-only
  80756a:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80756e:	74 0b                	je     80757b <translate_attr+0x2c>
        attr_s[1]='-';
  807570:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807574:	48 83 c0 01          	add    rax,0x1
  807578:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
    v=attr&2;
  80757b:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  80757f:	83 e0 02             	and    eax,0x2
  807582:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//hidden
  807585:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807589:	74 0b                	je     807596 <translate_attr+0x47>
        attr_s[2]='h';
  80758b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80758f:	48 83 c0 02          	add    rax,0x2
  807593:	c6 00 68             	mov    BYTE PTR [rax],0x68
    v=attr&4;
  807596:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  80759a:	83 e0 04             	and    eax,0x4
  80759d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//system
  8075a0:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8075a4:	74 0b                	je     8075b1 <translate_attr+0x62>
        attr_s[4]='s';
  8075a6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8075aa:	48 83 c0 04          	add    rax,0x4
  8075ae:	c6 00 73             	mov    BYTE PTR [rax],0x73
    v=attr&8;
  8075b1:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  8075b5:	83 e0 08             	and    eax,0x8
  8075b8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//volume label
  8075bb:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8075bf:	74 0b                	je     8075cc <translate_attr+0x7d>
        attr_s[3]='v';
  8075c1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8075c5:	48 83 c0 03          	add    rax,0x3
  8075c9:	c6 00 76             	mov    BYTE PTR [rax],0x76
    v=attr&16;
  8075cc:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  8075d0:	83 e0 10             	and    eax,0x10
  8075d3:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//dir
  8075d6:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8075da:	74 0b                	je     8075e7 <translate_attr+0x98>
        attr_s[3]='d';
  8075dc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8075e0:	48 83 c0 03          	add    rax,0x3
  8075e4:	c6 00 64             	mov    BYTE PTR [rax],0x64
    //archive: do nothing
    attr_s[5]='\0';
  8075e7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8075eb:	48 83 c0 05          	add    rax,0x5
  8075ef:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  8075f2:	90                   	nop
  8075f3:	5d                   	pop    rbp
  8075f4:	c3                   	ret    

00000000008075f5 <extend_cluster>:
int extend_cluster(short cluster)
{
  8075f5:	f3 0f 1e fa          	endbr64 
  8075f9:	55                   	push   rbp
  8075fa:	48 89 e5             	mov    rbp,rsp
  8075fd:	48 83 ec 18          	sub    rsp,0x18
  807601:	89 f8                	mov    eax,edi
  807603:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    int new_clu=req_cluster();
  807607:	b8 00 00 00 00       	mov    eax,0x0
  80760c:	e8 0e fd ff ff       	call   80731f <req_cluster>
  807611:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(new_clu==-1)
  807614:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  807618:	75 07                	jne    807621 <extend_cluster+0x2c>
        return -1;
  80761a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80761f:	eb 16                	jmp    807637 <extend_cluster+0x42>
    fat[cluster]=new_clu;
  807621:	0f bf 45 ec          	movsx  eax,WORD PTR [rbp-0x14]
  807625:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  807628:	48 98                	cdqe   
  80762a:	66 89 94 00 c0 cb 42 	mov    WORD PTR [rax+rax*1+0x42cbc0],dx
  807631:	00 
    return 0;
  807632:	b8 00 00 00 00       	mov    eax,0x0
}
  807637:	c9                   	leave  
  807638:	c3                   	ret    

0000000000807639 <touch>:
得出的结果换算成16进制填入即可。也就是：38H字节0~4位是日期数；38H字节5~7位和39H字节0位是月份；
39H字节的1~7位为年号，原定义中0~119分别代表1980~2099，目前高版本的Windows允许取0~127，
即年号最大可以到2107年。
*/
int touch(driver_args *arg)
{
  807639:	f3 0f 1e fa          	endbr64 
  80763d:	55                   	push   rbp
  80763e:	48 89 e5             	mov    rbp,rsp
  807641:	48 83 ec 60          	sub    rsp,0x60
  807645:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    char *name=arg->path;
  807649:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80764d:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807651:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  807655:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807659:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  80765c:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    //default set to 512
    int max_files=16;
  807660:	c7 45 ec 10 00 00 00 	mov    DWORD PTR [rbp-0x14],0x10
    dir_entry *dir_table=a_clu_of_dir;
  807667:	48 c7 45 e0 c0 c9 42 	mov    QWORD PTR [rbp-0x20],0x42c9c0
  80766e:	00 
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  80766f:	0f b6 05 f7 12 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc212f7]        # 42896d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  807676:	0f b6 c0             	movzx  eax,al
  807679:	0f b7 55 ca          	movzx  edx,WORD PTR [rbp-0x36]
  80767d:	0f b7 ca             	movzx  ecx,dx
  807680:	8b 15 5a 2a 00 00    	mov    edx,DWORD PTR [rip+0x2a5a]        # 80a0e0 <clu_sec_balance>
  807686:	01 d1                	add    ecx,edx
  807688:	89 c2                	mov    edx,eax
  80768a:	89 ce                	mov    esi,ecx
  80768c:	bf c0 c9 42 00       	mov    edi,0x42c9c0
  807691:	e8 c9 03 00 00       	call   807a5f <read_sec>
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  807696:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  80769a:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do{
        for(int i=0;i<max_files;i++)
  80769e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8076a5:	e9 2e 01 00 00       	jmp    8077d8 <touch+0x19f>
        {
            //printf("%s\n",dir_table[i].name);
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  8076aa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8076ad:	48 98                	cdqe   
  8076af:	48 c1 e0 05          	shl    rax,0x5
  8076b3:	48 89 c2             	mov    rdx,rax
  8076b6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8076ba:	48 01 d0             	add    rax,rdx
  8076bd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8076c0:	3c e5                	cmp    al,0xe5
  8076c2:	74 1e                	je     8076e2 <touch+0xa9>
            dir_table[i].name[0]==0)
  8076c4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8076c7:	48 98                	cdqe   
  8076c9:	48 c1 e0 05          	shl    rax,0x5
  8076cd:	48 89 c2             	mov    rdx,rax
  8076d0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8076d4:	48 01 d0             	add    rax,rdx
  8076d7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  8076da:	84 c0                	test   al,al
  8076dc:	0f 85 f2 00 00 00    	jne    8077d4 <touch+0x19b>
            {
                //available
                //put name
                format_name(name);
  8076e2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8076e6:	48 89 c7             	mov    rdi,rax
  8076e9:	e8 25 fb ff ff       	call   807213 <format_name>
                memcpy(dir_table[i].name,name,11);
  8076ee:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8076f1:	48 98                	cdqe   
  8076f3:	48 c1 e0 05          	shl    rax,0x5
  8076f7:	48 89 c2             	mov    rdx,rax
  8076fa:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8076fe:	48 01 d0             	add    rax,rdx
  807701:	48 89 c1             	mov    rcx,rax
  807704:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807708:	ba 0b 00 00 00       	mov    edx,0xb
  80770d:	48 89 c6             	mov    rsi,rax
  807710:	48 89 cf             	mov    rdi,rcx
  807713:	e8 2e 1e 00 00       	call   809546 <memcpy>
                int clu=req_cluster();
  807718:	b8 00 00 00 00       	mov    eax,0x0
  80771d:	e8 fd fb ff ff       	call   80731f <req_cluster>
  807722:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
                if(clu==-1)
  807725:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  807729:	75 0a                	jne    807735 <touch+0xfc>
                {
                    //puts("err: full disk");
                    return -1;
  80772b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807730:	e9 fc 00 00 00       	jmp    807831 <touch+0x1f8>
                }
                dir_table[i].fistCluNum=clu;
  807735:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807738:	48 98                	cdqe   
  80773a:	48 c1 e0 05          	shl    rax,0x5
  80773e:	48 89 c2             	mov    rdx,rax
  807741:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807745:	48 01 d0             	add    rax,rdx
  807748:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  80774b:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
                set_attr(&dir_table[i],ATTR_ARCHIVE);
  80774f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807752:	48 98                	cdqe   
  807754:	48 c1 e0 05          	shl    rax,0x5
  807758:	48 89 c2             	mov    rdx,rax
  80775b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80775f:	48 01 d0             	add    rax,rdx
  807762:	be 20 00 00 00       	mov    esi,0x20
  807767:	48 89 c7             	mov    rdi,rax
  80776a:	e8 6f fc ff ff       	call   8073de <set_attr>
                dir_table[i].len=superblock.bytesPerSec*superblock.secPerClu;
  80776f:	0f b7 05 f5 11 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc211f5]        # 42896b <superblock+0xb>
  807776:	0f b7 d0             	movzx  edx,ax
  807779:	0f b6 05 ed 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc211ed]        # 42896d <superblock+0xd>
  807780:	0f b6 c0             	movzx  eax,al
  807783:	0f af d0             	imul   edx,eax
  807786:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807789:	48 98                	cdqe   
  80778b:	48 c1 e0 05          	shl    rax,0x5
  80778f:	48 89 c1             	mov    rcx,rax
  807792:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807796:	48 01 c8             	add    rax,rcx
  807799:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
                //date and time
                //dir_table[i].lastModfDate=get_date_stab();
                //dir_table[i].lastModfTime=get_time_stab();
                //update
                write_sec(dir_table,cluster+clu_sec_balance,\
                superblock.bytesPerSec*superblock.secPerClu);
  80779c:	0f b7 05 c8 11 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc211c8]        # 42896b <superblock+0xb>
  8077a3:	0f b7 d0             	movzx  edx,ax
  8077a6:	0f b6 05 c0 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc211c0]        # 42896d <superblock+0xd>
  8077ad:	0f b6 c0             	movzx  eax,al
                write_sec(dir_table,cluster+clu_sec_balance,\
  8077b0:	0f af d0             	imul   edx,eax
  8077b3:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  8077b7:	8b 05 23 29 00 00    	mov    eax,DWORD PTR [rip+0x2923]        # 80a0e0 <clu_sec_balance>
  8077bd:	01 c1                	add    ecx,eax
  8077bf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8077c3:	89 ce                	mov    esi,ecx
  8077c5:	48 89 c7             	mov    rdi,rax
  8077c8:	e8 9e fb ff ff       	call   80736b <write_sec>
                return -1;
  8077cd:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8077d2:	eb 5d                	jmp    807831 <touch+0x1f8>
        for(int i=0;i<max_files;i++)
  8077d4:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8077d8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8077db:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
  8077de:	0f 8c c6 fe ff ff    	jl     8076aa <touch+0x71>
        if(fat[cluster]>=FAT_EOF&&extend_cluster(cluster)==-1)
        {
            //extend fail
            //puts("err:full disk");
            return -1;
        }else if(cluster<FAT_EOF)
  8077e4:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  8077e9:	77 36                	ja     807821 <touch+0x1e8>
        {
            cluster=fat[cluster];
  8077eb:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8077ef:	48 98                	cdqe   
  8077f1:	0f b7 84 00 c0 cb 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cbc0]
  8077f8:	00 
  8077f9:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  8077fd:	0f b6 05 69 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21169]        # 42896d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807804:	0f b6 d0             	movzx  edx,al
  807807:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  80780b:	8b 05 cf 28 00 00    	mov    eax,DWORD PTR [rip+0x28cf]        # 80a0e0 <clu_sec_balance>
  807811:	01 c1                	add    ecx,eax
  807813:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807817:	89 ce                	mov    esi,ecx
  807819:	48 89 c7             	mov    rdi,rax
  80781c:	e8 3e 02 00 00       	call   807a5f <read_sec>
        }
    }while(cluster<FAT_EOF);
  807821:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807826:	0f 86 72 fe ff ff    	jbe    80769e <touch+0x65>
    return 0;
  80782c:	b8 00 00 00 00       	mov    eax,0x0
}
  807831:	c9                   	leave  
  807832:	c3                   	ret    

0000000000807833 <mkdir>:
//attention: the name must be char[12]
int mkdir(driver_args *arg)
{
  807833:	f3 0f 1e fa          	endbr64 
  807837:	55                   	push   rbp
  807838:	48 89 e5             	mov    rbp,rsp
  80783b:	48 83 ec 50          	sub    rsp,0x50
  80783f:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    char *name=arg->path;
  807843:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807847:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80784b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  80784f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807853:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  807856:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    format_name(name);
  80785a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80785e:	48 89 c7             	mov    rdi,rax
  807861:	e8 ad f9 ff ff       	call   807213 <format_name>
    //regular dir
    unsigned short cluster = dir.fistCluNum;
  807866:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  80786a:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do
    {
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
            superblock.secPerClu);
  80786e:	0f b6 05 f8 10 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc210f8]        # 42896d <superblock+0xd>
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  807875:	0f b6 c0             	movzx  eax,al
  807878:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  80787c:	8b 15 5e 28 00 00    	mov    edx,DWORD PTR [rip+0x285e]        # 80a0e0 <clu_sec_balance>
  807882:	01 d1                	add    ecx,edx
  807884:	89 c2                	mov    edx,eax
  807886:	89 ce                	mov    esi,ecx
  807888:	bf c0 c9 42 00       	mov    edi,0x42c9c0
  80788d:	e8 cd 01 00 00       	call   807a5f <read_sec>
        for (int i = 0; i < 16; i++)
  807892:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807899:	e9 8c 01 00 00       	jmp    807a2a <mkdir+0x1f7>
        {
            if(a_clu_of_dir[i].fistCluNum==0||\
  80789e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8078a1:	48 98                	cdqe   
  8078a3:	48 c1 e0 05          	shl    rax,0x5
  8078a7:	48 05 da c9 42 00    	add    rax,0x42c9da
  8078ad:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8078b0:	66 85 c0             	test   ax,ax
  8078b3:	74 30                	je     8078e5 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0xe5||\
  8078b5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8078b8:	48 98                	cdqe   
  8078ba:	48 c1 e0 05          	shl    rax,0x5
  8078be:	48 05 a0 89 42 00    	add    rax,0x4289a0
  8078c4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if(a_clu_of_dir[i].fistCluNum==0||\
  8078c7:	3c e5                	cmp    al,0xe5
  8078c9:	74 1a                	je     8078e5 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0)
  8078cb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8078ce:	48 98                	cdqe   
  8078d0:	48 c1 e0 05          	shl    rax,0x5
  8078d4:	48 05 a0 89 42 00    	add    rax,0x4289a0
  8078da:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            (unsigned char)root_dir[i].name[0]==0xe5||\
  8078dd:	84 c0                	test   al,al
  8078df:	0f 85 41 01 00 00    	jne    807a26 <mkdir+0x1f3>
            {
                memset(&a_clu_of_dir[i],0,sizeof(dir_entry));
  8078e5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8078e8:	48 98                	cdqe   
  8078ea:	48 c1 e0 05          	shl    rax,0x5
  8078ee:	48 05 c0 c9 42 00    	add    rax,0x42c9c0
  8078f4:	ba 20 00 00 00       	mov    edx,0x20
  8078f9:	be 00 00 00 00       	mov    esi,0x0
  8078fe:	48 89 c7             	mov    rdi,rax
  807901:	e8 ef 1c 00 00       	call   8095f5 <memset>
                memset(a_clu_of_dir[i].name,' ',11);
  807906:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807909:	48 98                	cdqe   
  80790b:	48 c1 e0 05          	shl    rax,0x5
  80790f:	48 05 c0 c9 42 00    	add    rax,0x42c9c0
  807915:	ba 0b 00 00 00       	mov    edx,0xb
  80791a:	be 20 00 00 00       	mov    esi,0x20
  80791f:	48 89 c7             	mov    rdi,rax
  807922:	e8 ce 1c 00 00       	call   8095f5 <memset>
                strcpy(a_clu_of_dir[i].name,name);
  807927:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80792a:	48 98                	cdqe   
  80792c:	48 c1 e0 05          	shl    rax,0x5
  807930:	48 8d 90 c0 c9 42 00 	lea    rdx,[rax+0x42c9c0]
  807937:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80793b:	48 89 c6             	mov    rsi,rax
  80793e:	48 89 d7             	mov    rdi,rdx
  807941:	e8 fe 1c 00 00       	call   809644 <strcpy>
                a_clu_of_dir[i].name[strlen(name)]=' ';
  807946:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80794a:	48 89 c7             	mov    rdi,rax
  80794d:	e8 11 1f 00 00       	call   809863 <strlen>
  807952:	48 63 d0             	movsxd rdx,eax
  807955:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807958:	48 98                	cdqe   
  80795a:	48 c1 e0 05          	shl    rax,0x5
  80795e:	48 01 d0             	add    rax,rdx
  807961:	48 05 c0 c9 42 00    	add    rax,0x42c9c0
  807967:	c6 00 20             	mov    BYTE PTR [rax],0x20
                int clu=req_cluster();
  80796a:	b8 00 00 00 00       	mov    eax,0x0
  80796f:	e8 ab f9 ff ff       	call   80731f <req_cluster>
  807974:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
                if(clu==-1)//check
  807977:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  80797b:	75 0a                	jne    807987 <mkdir+0x154>
                {
                    //puts("err:full dir");
                    return -1;
  80797d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807982:	e9 d6 00 00 00       	jmp    807a5d <mkdir+0x22a>
                }
                a_clu_of_dir[i].fistCluNum=clu;
  807987:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80798a:	89 c2                	mov    edx,eax
  80798c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80798f:	48 98                	cdqe   
  807991:	48 c1 e0 05          	shl    rax,0x5
  807995:	48 05 da c9 42 00    	add    rax,0x42c9da
  80799b:	66 89 10             	mov    WORD PTR [rax],dx
                //set attr
                set_attr(&a_clu_of_dir[i],ATTR_DIR);
  80799e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8079a1:	48 98                	cdqe   
  8079a3:	48 c1 e0 05          	shl    rax,0x5
  8079a7:	48 05 c0 c9 42 00    	add    rax,0x42c9c0
  8079ad:	be 10 00 00 00       	mov    esi,0x10
  8079b2:	48 89 c7             	mov    rdi,rax
  8079b5:	e8 24 fa ff ff       	call   8073de <set_attr>
                //set length
                a_clu_of_dir[i].len=0;
  8079ba:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8079bd:	48 98                	cdqe   
  8079bf:	48 c1 e0 05          	shl    rax,0x5
  8079c3:	48 05 dc c9 42 00    	add    rax,0x42c9dc
  8079c9:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
                //date and time
                /*a_clu_of_dir[i].lastModfDate=get_date_stab();
                a_clu_of_dir[i].lastModfTime=get_time_stab();*/
                //set date:temporarily none
                //add . and ..
                add_dot_and_ddot_dir(a_clu_of_dir[i]);
  8079cf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8079d2:	48 98                	cdqe   
  8079d4:	48 c1 e0 05          	shl    rax,0x5
  8079d8:	48 05 c0 c9 42 00    	add    rax,0x42c9c0
  8079de:	ff 70 18             	push   QWORD PTR [rax+0x18]
  8079e1:	ff 70 10             	push   QWORD PTR [rax+0x10]
  8079e4:	ff 70 08             	push   QWORD PTR [rax+0x8]
  8079e7:	ff 30                	push   QWORD PTR [rax]
  8079e9:	e8 7c fa ff ff       	call   80746a <add_dot_and_ddot_dir>
  8079ee:	48 83 c4 20          	add    rsp,0x20
                //update the dir
                int dir_loc=cluster+clu_sec_balance;
  8079f2:	0f b7 55 fe          	movzx  edx,WORD PTR [rbp-0x2]
  8079f6:	8b 05 e4 26 00 00    	mov    eax,DWORD PTR [rip+0x26e4]        # 80a0e0 <clu_sec_balance>
  8079fc:	01 d0                	add    eax,edx
  8079fe:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
                write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  807a01:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807a04:	ba 00 02 00 00       	mov    edx,0x200
  807a09:	89 c6                	mov    esi,eax
  807a0b:	bf c0 c9 42 00       	mov    edi,0x42c9c0
  807a10:	e8 56 f9 ff ff       	call   80736b <write_sec>
                update_fat_and_root();
  807a15:	b8 00 00 00 00       	mov    eax,0x0
  807a1a:	e8 e7 f9 ff ff       	call   807406 <update_fat_and_root>
                return 0;
  807a1f:	b8 00 00 00 00       	mov    eax,0x0
  807a24:	eb 37                	jmp    807a5d <mkdir+0x22a>
        for (int i = 0; i < 16; i++)
  807a26:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807a2a:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  807a2e:	0f 8e 6a fe ff ff    	jle    80789e <mkdir+0x6b>
            }
        }

        if(cluster<FAT_EOF)
  807a34:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807a39:	77 12                	ja     807a4d <mkdir+0x21a>
            cluster=fat[cluster];
  807a3b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807a3f:	48 98                	cdqe   
  807a41:	0f b7 84 00 c0 cb 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cbc0]
  807a48:	00 
  807a49:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    } while (cluster<FAT_EOF);
  807a4d:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807a52:	0f 86 16 fe ff ff    	jbe    80786e <mkdir+0x3b>
    return -1;
  807a58:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  807a5d:	c9                   	leave  
  807a5e:	c3                   	ret    

0000000000807a5f <read_sec>:
    }
    
    
}*/
int read_sec(char *dist, int sec_num, int sec_count)
{
  807a5f:	f3 0f 1e fa          	endbr64 
  807a63:	55                   	push   rbp
  807a64:	48 89 e5             	mov    rbp,rsp
  807a67:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  807a6e:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
  807a75:	89 b5 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],esi
  807a7b:	89 95 20 ff ff ff    	mov    DWORD PTR [rbp-0xe0],edx
    driver_args arg={
  807a81:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  807a88:	b8 00 00 00 00       	mov    eax,0x0
  807a8d:	b9 18 00 00 00       	mov    ecx,0x18
  807a92:	48 89 d7             	mov    rdi,rdx
  807a95:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  807a98:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
  807a9e:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
  807aa4:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  807aab:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
  807ab1:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  807ab8:	00 00 00 
            .dist_addr=dist,
            .lba=sec_num,
            .sec_c=1
    };
    for(int i=0;i<sec_count;i++)
  807abb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807ac2:	eb 3e                	jmp    807b02 <read_sec+0xa3>
    {
        drv_disk.read(&arg);
  807ac4:	48 8b 15 8d 25 00 00 	mov    rdx,QWORD PTR [rip+0x258d]        # 80a058 <drv_disk+0x18>
  807acb:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  807ad2:	48 89 c7             	mov    rdi,rax
  807ad5:	ff d2                	call   rdx
        arg.dist_addr+=superblock.bytesPerSec;
  807ad7:	8b 95 34 ff ff ff    	mov    edx,DWORD PTR [rbp-0xcc]
  807add:	0f b7 05 87 0e c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20e87]        # 42896b <superblock+0xb>
  807ae4:	0f b7 c0             	movzx  eax,ax
  807ae7:	01 d0                	add    eax,edx
  807ae9:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.lba++;
  807aef:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  807af5:	83 c0 01             	add    eax,0x1
  807af8:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
    for(int i=0;i<sec_count;i++)
  807afe:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807b02:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807b05:	3b 85 20 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xe0]
  807b0b:	7c b7                	jl     807ac4 <read_sec+0x65>
    }
    return 0;
  807b0d:	b8 00 00 00 00       	mov    eax,0x0
}
  807b12:	c9                   	leave  
  807b13:	c3                   	ret    

0000000000807b14 <rm>:

int rm(driver_args* args)
{
  807b14:	f3 0f 1e fa          	endbr64 
  807b18:	55                   	push   rbp
  807b19:	48 89 e5             	mov    rbp,rsp
  807b1c:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  807b23:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
    char *name=args->path;
  807b2a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  807b31:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807b35:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    driver_args tmparg={
  807b39:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  807b40:	b8 00 00 00 00       	mov    eax,0x0
  807b45:	b9 18 00 00 00       	mov    ecx,0x18
  807b4a:	48 89 d7             	mov    rdi,rdx
  807b4d:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .path=args->dir_path,
  807b50:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  807b57:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
    driver_args tmparg={
  807b5e:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    if(get_entry(&tmparg)==-1)return -1;
  807b65:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  807b6c:	48 89 c7             	mov    rdi,rax
  807b6f:	e8 07 0a 00 00       	call   80857b <get_entry>
  807b74:	83 f8 ff             	cmp    eax,0xffffffff
  807b77:	75 0a                	jne    807b83 <rm+0x6f>
  807b79:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807b7e:	e9 a8 01 00 00       	jmp    807d2b <rm+0x217>
    dir.fistCluNum=tmparg.entry.id;
  807b83:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  807b89:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    dir_entry *dir_table=a_clu_of_dir;
  807b8d:	48 c7 45 e0 c0 c9 42 	mov    QWORD PTR [rbp-0x20],0x42c9c0
  807b94:	00 
    //regular dir
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
    superblock.secPerClu);
  807b95:	0f b6 05 d1 0d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20dd1]        # 42896d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  807b9c:	0f b6 c0             	movzx  eax,al
  807b9f:	0f b7 55 da          	movzx  edx,WORD PTR [rbp-0x26]
  807ba3:	0f b7 ca             	movzx  ecx,dx
  807ba6:	8b 15 34 25 00 00    	mov    edx,DWORD PTR [rip+0x2534]        # 80a0e0 <clu_sec_balance>
  807bac:	01 d1                	add    ecx,edx
  807bae:	89 c2                	mov    edx,eax
  807bb0:	89 ce                	mov    esi,ecx
  807bb2:	bf c0 c9 42 00       	mov    edi,0x42c9c0
  807bb7:	e8 a3 fe ff ff       	call   807a5f <read_sec>
    dir_table=a_clu_of_dir;
  807bbc:	48 c7 45 e0 c0 c9 42 	mov    QWORD PTR [rbp-0x20],0x42c9c0
  807bc3:	00 
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  807bc4:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  807bc8:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    int i=0;
  807bcc:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    while(cluster<FAT_EOF){
  807bd3:	e9 89 00 00 00       	jmp    807c61 <rm+0x14d>
        read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807bd8:	0f b6 05 8e 0d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20d8e]        # 42896d <superblock+0xd>
        read_sec(dir_table,cluster+clu_sec_balance,\
  807bdf:	0f b6 d0             	movzx  edx,al
  807be2:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807be6:	8b 05 f4 24 00 00    	mov    eax,DWORD PTR [rip+0x24f4]        # 80a0e0 <clu_sec_balance>
  807bec:	01 c1                	add    ecx,eax
  807bee:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807bf2:	89 ce                	mov    esi,ecx
  807bf4:	48 89 c7             	mov    rdi,rax
  807bf7:	e8 63 fe ff ff       	call   807a5f <read_sec>
        for(;i<16;i++)
  807bfc:	eb 44                	jmp    807c42 <rm+0x12e>
        {
            if(dir_table[i].fistCluNum==args->entry.id)
  807bfe:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c01:	48 98                	cdqe   
  807c03:	48 c1 e0 05          	shl    rax,0x5
  807c07:	48 89 c2             	mov    rdx,rax
  807c0a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c0e:	48 01 d0             	add    rax,rdx
  807c11:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  807c15:	0f b7 d0             	movzx  edx,ax
  807c18:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  807c1f:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  807c22:	39 c2                	cmp    edx,eax
  807c24:	75 18                	jne    807c3e <rm+0x12a>
            {
                if(dir_table[i].attr&ATTR_DIR){
                    //要处理里面的文件
                }
                dir_table[i].name[0]=0xe5;
  807c26:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c29:	48 98                	cdqe   
  807c2b:	48 c1 e0 05          	shl    rax,0x5
  807c2f:	48 89 c2             	mov    rdx,rax
  807c32:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c36:	48 01 d0             	add    rax,rdx
  807c39:	c6 00 e5             	mov    BYTE PTR [rax],0xe5
                goto del_entry_finish;
  807c3c:	eb 2f                	jmp    807c6d <rm+0x159>
        for(;i<16;i++)
  807c3e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807c42:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  807c46:	7e b6                	jle    807bfe <rm+0xea>
            }
        }
        if(cluster<FAT_EOF)
  807c48:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807c4d:	77 12                	ja     807c61 <rm+0x14d>
        {
            cluster=fat[cluster];
  807c4f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807c53:	48 98                	cdqe   
  807c55:	0f b7 84 00 c0 cb 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cbc0]
  807c5c:	00 
  807c5d:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    while(cluster<FAT_EOF){
  807c61:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807c66:	0f 86 6c ff ff ff    	jbe    807bd8 <rm+0xc4>
            //update
            //if you can reach here it means it's a regular dir
        }

    }
del_entry_finish:
  807c6c:	90                   	nop
    ;
    //del fat
    unsigned short del_clu=dir_table[i].fistCluNum;
  807c6d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c70:	48 98                	cdqe   
  807c72:	48 c1 e0 05          	shl    rax,0x5
  807c76:	48 89 c2             	mov    rdx,rax
  807c79:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c7d:	48 01 d0             	add    rax,rdx
  807c80:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  807c84:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
    unsigned short pion=del_clu<FAT_EOF?fat[del_clu]:0xffff;
  807c88:	66 83 7d f6 f6       	cmp    WORD PTR [rbp-0xa],0xfff6
  807c8d:	77 10                	ja     807c9f <rm+0x18b>
  807c8f:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807c93:	48 98                	cdqe   
  807c95:	0f b7 84 00 c0 cb 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cbc0]
  807c9c:	00 
  807c9d:	eb 05                	jmp    807ca4 <rm+0x190>
  807c9f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807ca4:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  807ca8:	eb 2a                	jmp    807cd4 <rm+0x1c0>
    {
        fat[del_clu]=0;
  807caa:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807cae:	48 98                	cdqe   
  807cb0:	66 c7 84 00 c0 cb 42 	mov    WORD PTR [rax+rax*1+0x42cbc0],0x0
  807cb7:	00 00 00 
        del_clu=pion;
  807cba:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  807cbe:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
        pion=fat[pion];
  807cc2:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  807cc6:	48 98                	cdqe   
  807cc8:	0f b7 84 00 c0 cb 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cbc0]
  807ccf:	00 
  807cd0:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  807cd4:	66 83 7d f4 f6       	cmp    WORD PTR [rbp-0xc],0xfff6
  807cd9:	76 cf                	jbe    807caa <rm+0x196>
    }
    fat[del_clu]=0;
  807cdb:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807cdf:	48 98                	cdqe   
  807ce1:	66 c7 84 00 c0 cb 42 	mov    WORD PTR [rax+rax*1+0x42cbc0],0x0
  807ce8:	00 00 00 
    //del dir entry
    write_sec(dir_table,cluster+clu_sec_balance,\
    superblock.secPerClu*superblock.bytesPerSec);
  807ceb:	0f b6 05 7b 0c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20c7b]        # 42896d <superblock+0xd>
  807cf2:	0f b6 d0             	movzx  edx,al
  807cf5:	0f b7 05 6f 0c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20c6f]        # 42896b <superblock+0xb>
  807cfc:	0f b7 c0             	movzx  eax,ax
    write_sec(dir_table,cluster+clu_sec_balance,\
  807cff:	0f af d0             	imul   edx,eax
  807d02:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807d06:	8b 05 d4 23 00 00    	mov    eax,DWORD PTR [rip+0x23d4]        # 80a0e0 <clu_sec_balance>
  807d0c:	01 c1                	add    ecx,eax
  807d0e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807d12:	89 ce                	mov    esi,ecx
  807d14:	48 89 c7             	mov    rdi,rax
  807d17:	e8 4f f6 ff ff       	call   80736b <write_sec>
    update_fat_and_root();
  807d1c:	b8 00 00 00 00       	mov    eax,0x0
  807d21:	e8 e0 f6 ff ff       	call   807406 <update_fat_and_root>
    return 0;
  807d26:	b8 00 00 00 00       	mov    eax,0x0
}
  807d2b:	c9                   	leave  
  807d2c:	c3                   	ret    

0000000000807d2d <find>:
int find_f=0;
int find(char *name)
{
  807d2d:	f3 0f 1e fa          	endbr64 
  807d31:	55                   	push   rbp
  807d32:	48 89 e5             	mov    rbp,rsp
  807d35:	48 83 ec 30          	sub    rsp,0x30
  807d39:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  807d3d:	c7 45 fc 00 02 00 00 	mov    DWORD PTR [rbp-0x4],0x200
    int index=0;
  807d44:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    dir_entry *dir_table=a_clu_of_dir;
  807d4b:	48 c7 45 f0 c0 c9 42 	mov    QWORD PTR [rbp-0x10],0x42c9c0
  807d52:	00 
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  807d53:	0f b7 05 60 4c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24c60]        # 42c9ba <cur_dir+0x1a>
  807d5a:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
    if(cur_dir.fistCluNum==0)
  807d5e:	0f b7 05 55 4c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24c55]        # 42c9ba <cur_dir+0x1a>
  807d65:	66 85 c0             	test   ax,ax
  807d68:	75 0a                	jne    807d74 <find+0x47>
        dir_table=root_dir;
  807d6a:	48 c7 45 f0 a0 89 42 	mov    QWORD PTR [rbp-0x10],0x4289a0
  807d71:	00 
  807d72:	eb 2b                	jmp    807d9f <find+0x72>
    else {
        max_files=16;
  807d74:	c7 45 fc 10 00 00 00 	mov    DWORD PTR [rbp-0x4],0x10
        read_sec(dir_table, cluster + clu_sec_balance, \
            superblock.secPerClu);
  807d7b:	0f b6 05 eb 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20beb]        # 42896d <superblock+0xd>
        read_sec(dir_table, cluster + clu_sec_balance, \
  807d82:	0f b6 d0             	movzx  edx,al
  807d85:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  807d89:	8b 05 51 23 00 00    	mov    eax,DWORD PTR [rip+0x2351]        # 80a0e0 <clu_sec_balance>
  807d8f:	01 c1                	add    ecx,eax
  807d91:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807d95:	89 ce                	mov    esi,ecx
  807d97:	48 89 c7             	mov    rdi,rax
  807d9a:	e8 c0 fc ff ff       	call   807a5f <read_sec>
    }
    do{
        for(int i=0;i<max_files;i++)
  807d9f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  807da6:	eb 57                	jmp    807dff <find+0xd2>
        {
            if(dir_table[i].name[0]==0||dir_table[i].name[0]==0xe5)
  807da8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807dab:	48 98                	cdqe   
  807dad:	48 c1 e0 05          	shl    rax,0x5
  807db1:	48 89 c2             	mov    rdx,rax
  807db4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807db8:	48 01 d0             	add    rax,rdx
  807dbb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807dbe:	84 c0                	test   al,al
  807dc0:	74 38                	je     807dfa <find+0xcd>
                continue;
            if(memcmp(dir_table[i].name,name,11)==0)
  807dc2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807dc5:	48 98                	cdqe   
  807dc7:	48 c1 e0 05          	shl    rax,0x5
  807dcb:	48 89 c2             	mov    rdx,rax
  807dce:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807dd2:	48 01 d0             	add    rax,rdx
  807dd5:	48 89 c1             	mov    rcx,rax
  807dd8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807ddc:	ba 0b 00 00 00       	mov    edx,0xb
  807de1:	48 89 c6             	mov    rsi,rax
  807de4:	48 89 cf             	mov    rdi,rcx
  807de7:	e8 a4 17 00 00       	call   809590 <memcmp>
  807dec:	85 c0                	test   eax,eax
  807dee:	75 0b                	jne    807dfb <find+0xce>
            {
                return index+i;
  807df0:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  807df3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807df6:	01 d0                	add    eax,edx
  807df8:	eb 71                	jmp    807e6b <find+0x13e>
                continue;
  807dfa:	90                   	nop
        for(int i=0;i<max_files;i++)
  807dfb:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  807dff:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807e02:	3b 45 fc             	cmp    eax,DWORD PTR [rbp-0x4]
  807e05:	7c a1                	jl     807da8 <find+0x7b>
            }
        }
        if(cur_dir.fistCluNum==0)
  807e07:	0f b7 05 ac 4b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24bac]        # 42c9ba <cur_dir+0x1a>
  807e0e:	66 85 c0             	test   ax,ax
  807e11:	75 07                	jne    807e1a <find+0xed>
            return -1;
  807e13:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807e18:	eb 51                	jmp    807e6b <find+0x13e>
        else if(cluster<FAT_EOF)
  807e1a:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  807e1f:	77 3a                	ja     807e5b <find+0x12e>
        {
            index+=16;
  807e21:	83 45 f8 10          	add    DWORD PTR [rbp-0x8],0x10
            cluster=fat[cluster];
  807e25:	0f b7 45 ee          	movzx  eax,WORD PTR [rbp-0x12]
  807e29:	48 98                	cdqe   
  807e2b:	0f b7 84 00 c0 cb 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cbc0]
  807e32:	00 
  807e33:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807e37:	0f b6 05 2f 0b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20b2f]        # 42896d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807e3e:	0f b6 d0             	movzx  edx,al
  807e41:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  807e45:	8b 05 95 22 00 00    	mov    eax,DWORD PTR [rip+0x2295]        # 80a0e0 <clu_sec_balance>
  807e4b:	01 c1                	add    ecx,eax
  807e4d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807e51:	89 ce                	mov    esi,ecx
  807e53:	48 89 c7             	mov    rdi,rax
  807e56:	e8 04 fc ff ff       	call   807a5f <read_sec>
        }
    }while(cluster<FAT_EOF);
  807e5b:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  807e60:	0f 86 39 ff ff ff    	jbe    807d9f <find+0x72>
    return -1;
  807e66:	b8 ff ff ff ff       	mov    eax,0xffffffff

}
  807e6b:	c9                   	leave  
  807e6c:	c3                   	ret    

0000000000807e6d <read_file_byname>:

int read_file_byname(char *full_name,char *dist,int pos,int len)
{
  807e6d:	f3 0f 1e fa          	endbr64 
  807e71:	55                   	push   rbp
  807e72:	48 89 e5             	mov    rbp,rsp
  807e75:	41 57                	push   r15
  807e77:	41 56                	push   r14
  807e79:	41 55                	push   r13
  807e7b:	41 54                	push   r12
  807e7d:	53                   	push   rbx
  807e7e:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  807e85:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  807e8c:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  807e93:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  807e99:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  807e9f:	48 89 e0             	mov    rax,rsp
  807ea2:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  807ea5:	bf 00 00 00 00       	mov    edi,0x0
  807eaa:	e8 7e fe ff ff       	call   807d2d <find>
  807eaf:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  807eb2:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  807eb6:	74 09                	je     807ec1 <read_file_byname+0x54>
  807eb8:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  807ebf:	79 0a                	jns    807ecb <read_file_byname+0x5e>
        return -1;
  807ec1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807ec6:	e9 ea 02 00 00       	jmp    8081b5 <read_file_byname+0x348>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  807ecb:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  807ed2:	48 c7 45 c0 a0 89 42 	mov    QWORD PTR [rbp-0x40],0x4289a0
  807ed9:	00 
    int in_root=1;
  807eda:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  807ee1:	0f b7 05 d2 4a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24ad2]        # 42c9ba <cur_dir+0x1a>
  807ee8:	66 85 c0             	test   ax,ax
  807eeb:	74 40                	je     807f2d <read_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  807eed:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  807ef4:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  807efb:	0f b6 05 6b 0a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20a6b]        # 42896d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  807f02:	0f b6 c0             	movzx  eax,al
  807f05:	0f b7 15 ae 4a c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc24aae]        # 42c9ba <cur_dir+0x1a>
  807f0c:	0f b7 ca             	movzx  ecx,dx
  807f0f:	8b 15 cb 21 00 00    	mov    edx,DWORD PTR [rip+0x21cb]        # 80a0e0 <clu_sec_balance>
  807f15:	01 d1                	add    ecx,edx
  807f17:	89 c2                	mov    edx,eax
  807f19:	89 ce                	mov    esi,ecx
  807f1b:	bf c0 c9 42 00       	mov    edi,0x42c9c0
  807f20:	e8 3a fb ff ff       	call   807a5f <read_sec>
        dir_table=a_clu_of_dir;
  807f25:	48 c7 45 c0 c0 c9 42 	mov    QWORD PTR [rbp-0x40],0x42c9c0
  807f2c:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  807f2d:	0f b7 05 86 4a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24a86]        # 42c9ba <cur_dir+0x1a>
  807f34:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  807f38:	eb 41                	jmp    807f7b <read_file_byname+0x10e>
        index-=16;
  807f3a:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  807f3e:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  807f43:	77 36                	ja     807f7b <read_file_byname+0x10e>
        {
            cluster=fat[cluster];
  807f45:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  807f49:	48 98                	cdqe   
  807f4b:	0f b7 84 00 c0 cb 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cbc0]
  807f52:	00 
  807f53:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807f57:	0f b6 05 0f 0a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20a0f]        # 42896d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807f5e:	0f b6 d0             	movzx  edx,al
  807f61:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  807f65:	8b 05 75 21 00 00    	mov    eax,DWORD PTR [rip+0x2175]        # 80a0e0 <clu_sec_balance>
  807f6b:	01 c1                	add    ecx,eax
  807f6d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807f71:	89 ce                	mov    esi,ecx
  807f73:	48 89 c7             	mov    rdi,rax
  807f76:	e8 e4 fa ff ff       	call   807a5f <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  807f7b:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  807f7f:	75 0d                	jne    807f8e <read_file_byname+0x121>
  807f81:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  807f85:	7e 07                	jle    807f8e <read_file_byname+0x121>
  807f87:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  807f8c:	76 ac                	jbe    807f3a <read_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  807f8e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  807f91:	48 98                	cdqe   
  807f93:	48 c1 e0 05          	shl    rax,0x5
  807f97:	48 89 c2             	mov    rdx,rax
  807f9a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807f9e:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807fa2:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  807fa5:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  807fa9:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  807fb0:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  807fb7:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  807fbb:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  807fbf:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  807fc3:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  807fc7:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  807fcb:	0f b7 c0             	movzx  eax,ax
  807fce:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  807fd1:	0f b7 05 93 09 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20993]        # 42896b <superblock+0xb>
  807fd8:	0f b7 d0             	movzx  edx,ax
  807fdb:	0f b6 05 8b 09 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2098b]        # 42896d <superblock+0xd>
  807fe2:	0f b6 c0             	movzx  eax,al
  807fe5:	0f af c2             	imul   eax,edx
  807fe8:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  807feb:	eb 25                	jmp    808012 <read_file_byname+0x1a5>
    {
        pos-=cluster_size;
  807fed:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807ff0:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        f_cluster=fat[f_cluster];
  807ff6:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807ff9:	48 98                	cdqe   
  807ffb:	0f b7 84 00 c0 cb 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cbc0]
  808002:	00 
  808003:	98                   	cwde   
  808004:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        if(pos<cluster_size)
  808007:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  80800d:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808010:	7c 0d                	jl     80801f <read_file_byname+0x1b2>
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  808012:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808018:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  80801b:	7d d0                	jge    807fed <read_file_byname+0x180>
  80801d:	eb 01                	jmp    808020 <read_file_byname+0x1b3>
            break;
  80801f:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  808020:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808027:	7e 15                	jle    80803e <read_file_byname+0x1d1>
  808029:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  80802f:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808032:	7c 0a                	jl     80803e <read_file_byname+0x1d1>
        return -1;//pos out of range
  808034:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808039:	e9 77 01 00 00       	jmp    8081b5 <read_file_byname+0x348>
    //
    char temp[cluster_size];
  80803e:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808041:	48 63 d0             	movsxd rdx,eax
  808044:	48 83 ea 01          	sub    rdx,0x1
  808048:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  80804c:	48 63 d0             	movsxd rdx,eax
  80804f:	49 89 d6             	mov    r14,rdx
  808052:	41 bf 00 00 00 00    	mov    r15d,0x0
  808058:	48 63 d0             	movsxd rdx,eax
  80805b:	49 89 d4             	mov    r12,rdx
  80805e:	41 bd 00 00 00 00    	mov    r13d,0x0
  808064:	48 98                	cdqe   
  808066:	ba 10 00 00 00       	mov    edx,0x10
  80806b:	48 83 ea 01          	sub    rdx,0x1
  80806f:	48 01 d0             	add    rax,rdx
  808072:	be 10 00 00 00       	mov    esi,0x10
  808077:	ba 00 00 00 00       	mov    edx,0x0
  80807c:	48 f7 f6             	div    rsi
  80807f:	48 6b c0 10          	imul   rax,rax,0x10
  808083:	48 89 c1             	mov    rcx,rax
  808086:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  80808d:	48 89 e2             	mov    rdx,rsp
  808090:	48 29 ca             	sub    rdx,rcx
  808093:	48 39 d4             	cmp    rsp,rdx
  808096:	74 12                	je     8080aa <read_file_byname+0x23d>
  808098:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  80809f:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  8080a6:	00 00 
  8080a8:	eb e9                	jmp    808093 <read_file_byname+0x226>
  8080aa:	48 89 c2             	mov    rdx,rax
  8080ad:	81 e2 ff 0f 00 00    	and    edx,0xfff
  8080b3:	48 29 d4             	sub    rsp,rdx
  8080b6:	48 89 c2             	mov    rdx,rax
  8080b9:	81 e2 ff 0f 00 00    	and    edx,0xfff
  8080bf:	48 85 d2             	test   rdx,rdx
  8080c2:	74 10                	je     8080d4 <read_file_byname+0x267>
  8080c4:	25 ff 0f 00 00       	and    eax,0xfff
  8080c9:	48 83 e8 08          	sub    rax,0x8
  8080cd:	48 01 e0             	add    rax,rsp
  8080d0:	48 83 08 00          	or     QWORD PTR [rax],0x0
  8080d4:	48 89 e0             	mov    rax,rsp
  8080d7:	48 83 c0 00          	add    rax,0x0
  8080db:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of reading might be not aligned
    read_sec(temp,f_cluster+clu_sec_balance,superblock.secPerClu);
  8080df:	0f b6 05 87 08 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20887]        # 42896d <superblock+0xd>
  8080e6:	0f b6 d0             	movzx  edx,al
  8080e9:	8b 0d f1 1f 00 00    	mov    ecx,DWORD PTR [rip+0x1ff1]        # 80a0e0 <clu_sec_balance>
  8080ef:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8080f2:	01 c1                	add    ecx,eax
  8080f4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8080f8:	89 ce                	mov    esi,ecx
  8080fa:	48 89 c7             	mov    rdi,rax
  8080fd:	e8 5d f9 ff ff       	call   807a5f <read_sec>
    memcpy(dist,temp+pos,cluster_size-pos);
  808102:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808105:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80810b:	89 c2                	mov    edx,eax
  80810d:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808113:	48 63 c8             	movsxd rcx,eax
  808116:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80811a:	48 01 c1             	add    rcx,rax
  80811d:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  808124:	48 89 ce             	mov    rsi,rcx
  808127:	48 89 c7             	mov    rdi,rax
  80812a:	e8 17 14 00 00       	call   809546 <memcpy>
    dist+=cluster_size-pos;
  80812f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808132:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  808138:	48 98                	cdqe   
  80813a:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
    len-=cluster_size-pos;
  808141:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808144:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80814a:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  808150:	eb 4c                	jmp    80819e <read_file_byname+0x331>
    {
        f_cluster=fat[f_cluster];
  808152:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808155:	48 98                	cdqe   
  808157:	0f b7 84 00 c0 cb 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cbc0]
  80815e:	00 
  80815f:	98                   	cwde   
  808160:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        read_sec(dist,f_cluster+clu_sec_balance,superblock.secPerClu);
  808163:	0f b6 05 03 08 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20803]        # 42896d <superblock+0xd>
  80816a:	0f b6 d0             	movzx  edx,al
  80816d:	8b 0d 6d 1f 00 00    	mov    ecx,DWORD PTR [rip+0x1f6d]        # 80a0e0 <clu_sec_balance>
  808173:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808176:	01 c1                	add    ecx,eax
  808178:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  80817f:	89 ce                	mov    esi,ecx
  808181:	48 89 c7             	mov    rdi,rax
  808184:	e8 d6 f8 ff ff       	call   807a5f <read_sec>
        dist+=cluster_size;
  808189:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80818c:	48 98                	cdqe   
  80818e:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  808195:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808198:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  80819e:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  8081a5:	7f 09                	jg     8081b0 <read_file_byname+0x343>
  8081a7:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  8081ae:	7f a2                	jg     808152 <read_file_byname+0x2e5>
    }
    return 0;
  8081b0:	b8 00 00 00 00       	mov    eax,0x0
  8081b5:	48 89 dc             	mov    rsp,rbx
    
}
  8081b8:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  8081bc:	5b                   	pop    rbx
  8081bd:	41 5c                	pop    r12
  8081bf:	41 5d                	pop    r13
  8081c1:	41 5e                	pop    r14
  8081c3:	41 5f                	pop    r15
  8081c5:	5d                   	pop    rbp
  8081c6:	c3                   	ret    

00000000008081c7 <write_file_byname>:
int write_file_byname(char *full_name,char *src,int pos,int len)
{
  8081c7:	f3 0f 1e fa          	endbr64 
  8081cb:	55                   	push   rbp
  8081cc:	48 89 e5             	mov    rbp,rsp
  8081cf:	41 57                	push   r15
  8081d1:	41 56                	push   r14
  8081d3:	41 55                	push   r13
  8081d5:	41 54                	push   r12
  8081d7:	53                   	push   rbx
  8081d8:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  8081df:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  8081e6:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  8081ed:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  8081f3:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  8081f9:	48 89 e0             	mov    rax,rsp
  8081fc:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  8081ff:	bf 00 00 00 00       	mov    edi,0x0
  808204:	e8 24 fb ff ff       	call   807d2d <find>
  808209:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  80820c:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  808210:	74 09                	je     80821b <write_file_byname+0x54>
  808212:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  808219:	79 0a                	jns    808225 <write_file_byname+0x5e>
        return -1;
  80821b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808220:	e9 1e 03 00 00       	jmp    808543 <write_file_byname+0x37c>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  808225:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  80822c:	48 c7 45 c0 a0 89 42 	mov    QWORD PTR [rbp-0x40],0x4289a0
  808233:	00 
    int in_root=1;
  808234:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  80823b:	0f b7 05 78 47 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24778]        # 42c9ba <cur_dir+0x1a>
  808242:	66 85 c0             	test   ax,ax
  808245:	74 40                	je     808287 <write_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  808247:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  80824e:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  808255:	0f b6 05 11 07 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20711]        # 42896d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  80825c:	0f b6 c0             	movzx  eax,al
  80825f:	0f b7 15 54 47 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc24754]        # 42c9ba <cur_dir+0x1a>
  808266:	0f b7 ca             	movzx  ecx,dx
  808269:	8b 15 71 1e 00 00    	mov    edx,DWORD PTR [rip+0x1e71]        # 80a0e0 <clu_sec_balance>
  80826f:	01 d1                	add    ecx,edx
  808271:	89 c2                	mov    edx,eax
  808273:	89 ce                	mov    esi,ecx
  808275:	bf c0 c9 42 00       	mov    edi,0x42c9c0
  80827a:	e8 e0 f7 ff ff       	call   807a5f <read_sec>
        dir_table=a_clu_of_dir;
  80827f:	48 c7 45 c0 c0 c9 42 	mov    QWORD PTR [rbp-0x40],0x42c9c0
  808286:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  808287:	0f b7 05 2c 47 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2472c]        # 42c9ba <cur_dir+0x1a>
  80828e:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  808292:	eb 41                	jmp    8082d5 <write_file_byname+0x10e>
        index-=16;
  808294:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  808298:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  80829d:	77 36                	ja     8082d5 <write_file_byname+0x10e>
        {
            cluster=fat[cluster];
  80829f:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  8082a3:	48 98                	cdqe   
  8082a5:	0f b7 84 00 c0 cb 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cbc0]
  8082ac:	00 
  8082ad:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  8082b1:	0f b6 05 b5 06 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc206b5]        # 42896d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  8082b8:	0f b6 d0             	movzx  edx,al
  8082bb:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  8082bf:	8b 05 1b 1e 00 00    	mov    eax,DWORD PTR [rip+0x1e1b]        # 80a0e0 <clu_sec_balance>
  8082c5:	01 c1                	add    ecx,eax
  8082c7:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8082cb:	89 ce                	mov    esi,ecx
  8082cd:	48 89 c7             	mov    rdi,rax
  8082d0:	e8 8a f7 ff ff       	call   807a5f <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  8082d5:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  8082d9:	75 0d                	jne    8082e8 <write_file_byname+0x121>
  8082db:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  8082df:	7e 07                	jle    8082e8 <write_file_byname+0x121>
  8082e1:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  8082e6:	76 ac                	jbe    808294 <write_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  8082e8:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8082eb:	48 98                	cdqe   
  8082ed:	48 c1 e0 05          	shl    rax,0x5
  8082f1:	48 89 c2             	mov    rdx,rax
  8082f4:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8082f8:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  8082fc:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8082ff:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808303:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  80830a:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  808311:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808315:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808319:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  80831d:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  808321:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  808325:	0f b7 c0             	movzx  eax,ax
  808328:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  80832b:	0f b7 05 39 06 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20639]        # 42896b <superblock+0xb>
  808332:	0f b7 d0             	movzx  edx,ax
  808335:	0f b6 05 31 06 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20631]        # 42896d <superblock+0xd>
  80833c:	0f b6 c0             	movzx  eax,al
  80833f:	0f af c2             	imul   eax,edx
  808342:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  808345:	eb 25                	jmp    80836c <write_file_byname+0x1a5>
    {
        pos-=cluster_size;
  808347:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80834a:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        if(pos<cluster_size)
  808350:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808356:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808359:	7c 1e                	jl     808379 <write_file_byname+0x1b2>
            break;
        f_cluster=fat[f_cluster];
  80835b:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80835e:	48 98                	cdqe   
  808360:	0f b7 84 00 c0 cb 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cbc0]
  808367:	00 
  808368:	98                   	cwde   
  808369:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  80836c:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808372:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808375:	7d d0                	jge    808347 <write_file_byname+0x180>
  808377:	eb 01                	jmp    80837a <write_file_byname+0x1b3>
            break;
  808379:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  80837a:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808381:	7e 15                	jle    808398 <write_file_byname+0x1d1>
  808383:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808389:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  80838c:	7c 0a                	jl     808398 <write_file_byname+0x1d1>
        return -1;//pos out of range
  80838e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808393:	e9 ab 01 00 00       	jmp    808543 <write_file_byname+0x37c>
    //
    char temp[cluster_size];
  808398:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80839b:	48 63 d0             	movsxd rdx,eax
  80839e:	48 83 ea 01          	sub    rdx,0x1
  8083a2:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  8083a6:	48 63 d0             	movsxd rdx,eax
  8083a9:	49 89 d6             	mov    r14,rdx
  8083ac:	41 bf 00 00 00 00    	mov    r15d,0x0
  8083b2:	48 63 d0             	movsxd rdx,eax
  8083b5:	49 89 d4             	mov    r12,rdx
  8083b8:	41 bd 00 00 00 00    	mov    r13d,0x0
  8083be:	48 98                	cdqe   
  8083c0:	ba 10 00 00 00       	mov    edx,0x10
  8083c5:	48 83 ea 01          	sub    rdx,0x1
  8083c9:	48 01 d0             	add    rax,rdx
  8083cc:	be 10 00 00 00       	mov    esi,0x10
  8083d1:	ba 00 00 00 00       	mov    edx,0x0
  8083d6:	48 f7 f6             	div    rsi
  8083d9:	48 6b c0 10          	imul   rax,rax,0x10
  8083dd:	48 89 c1             	mov    rcx,rax
  8083e0:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  8083e7:	48 89 e2             	mov    rdx,rsp
  8083ea:	48 29 ca             	sub    rdx,rcx
  8083ed:	48 39 d4             	cmp    rsp,rdx
  8083f0:	74 12                	je     808404 <write_file_byname+0x23d>
  8083f2:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  8083f9:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  808400:	00 00 
  808402:	eb e9                	jmp    8083ed <write_file_byname+0x226>
  808404:	48 89 c2             	mov    rdx,rax
  808407:	81 e2 ff 0f 00 00    	and    edx,0xfff
  80840d:	48 29 d4             	sub    rsp,rdx
  808410:	48 89 c2             	mov    rdx,rax
  808413:	81 e2 ff 0f 00 00    	and    edx,0xfff
  808419:	48 85 d2             	test   rdx,rdx
  80841c:	74 10                	je     80842e <write_file_byname+0x267>
  80841e:	25 ff 0f 00 00       	and    eax,0xfff
  808423:	48 83 e8 08          	sub    rax,0x8
  808427:	48 01 e0             	add    rax,rsp
  80842a:	48 83 08 00          	or     QWORD PTR [rax],0x0
  80842e:	48 89 e0             	mov    rax,rsp
  808431:	48 83 c0 00          	add    rax,0x0
  808435:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of writing might not be aligned
    if(pos>0)
  808439:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  808440:	0f 8e a2 00 00 00    	jle    8084e8 <write_file_byname+0x321>
    {
        memcpy(temp+pos,src,cluster_size-pos);
  808446:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808449:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80844f:	89 c2                	mov    edx,eax
  808451:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808457:	48 63 c8             	movsxd rcx,eax
  80845a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80845e:	48 01 c1             	add    rcx,rax
  808461:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  808468:	48 89 c6             	mov    rsi,rax
  80846b:	48 89 cf             	mov    rdi,rcx
  80846e:	e8 d3 10 00 00       	call   809546 <memcpy>
        write_sec(temp,f_cluster,cluster_size-pos);
  808473:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808476:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80847c:	89 c2                	mov    edx,eax
  80847e:	8b 4d b4             	mov    ecx,DWORD PTR [rbp-0x4c]
  808481:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808485:	89 ce                	mov    esi,ecx
  808487:	48 89 c7             	mov    rdi,rax
  80848a:	e8 dc ee ff ff       	call   80736b <write_sec>
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  80848f:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808492:	48 98                	cdqe   
  808494:	0f b7 84 00 c0 cb 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cbc0]
  80849b:	00 
  80849c:	98                   	cwde   
  80849d:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    }
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  8084a0:	eb 46                	jmp    8084e8 <write_file_byname+0x321>
    {
        write_sec(src,f_cluster+clu_sec_balance,cluster_size);
  8084a2:	8b 15 38 1c 00 00    	mov    edx,DWORD PTR [rip+0x1c38]        # 80a0e0 <clu_sec_balance>
  8084a8:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8084ab:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  8084ae:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  8084b1:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8084b8:	89 ce                	mov    esi,ecx
  8084ba:	48 89 c7             	mov    rdi,rax
  8084bd:	e8 a9 ee ff ff       	call   80736b <write_sec>
        src+=cluster_size;
  8084c2:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8084c5:	48 98                	cdqe   
  8084c7:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  8084ce:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8084d1:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  8084d7:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8084da:	48 98                	cdqe   
  8084dc:	0f b7 84 00 c0 cb 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cbc0]
  8084e3:	00 
  8084e4:	98                   	cwde   
  8084e5:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  8084e8:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  8084ef:	7f 0b                	jg     8084fc <write_file_byname+0x335>
  8084f1:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa8]
  8084f7:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8084fa:	7d a6                	jge    8084a2 <write_file_byname+0x2db>
    }
    if(len>0)
  8084fc:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  808503:	7e 39                	jle    80853e <write_file_byname+0x377>
    {
        //there might be some leftover less than a cluster
        memcpy(temp,src,len);
  808505:	8b 95 58 ff ff ff    	mov    edx,DWORD PTR [rbp-0xa8]
  80850b:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  808512:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808516:	48 89 ce             	mov    rsi,rcx
  808519:	48 89 c7             	mov    rdi,rax
  80851c:	e8 25 10 00 00       	call   809546 <memcpy>
        write_sec(temp,f_cluster+clu_sec_balance,cluster_size);
  808521:	8b 15 b9 1b 00 00    	mov    edx,DWORD PTR [rip+0x1bb9]        # 80a0e0 <clu_sec_balance>
  808527:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80852a:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80852d:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  808530:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808534:	89 ce                	mov    esi,ecx
  808536:	48 89 c7             	mov    rdi,rax
  808539:	e8 2d ee ff ff       	call   80736b <write_sec>
    }
    return 0;
  80853e:	b8 00 00 00 00       	mov    eax,0x0
  808543:	48 89 dc             	mov    rsp,rbx

}
  808546:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  80854a:	5b                   	pop    rbx
  80854b:	41 5c                	pop    r12
  80854d:	41 5d                	pop    r13
  80854f:	41 5e                	pop    r14
  808551:	41 5f                	pop    r15
  808553:	5d                   	pop    rbp
  808554:	c3                   	ret    

0000000000808555 <file_exist>:


int file_exist(dir_entry entry)
{
  808555:	f3 0f 1e fa          	endbr64 
  808559:	55                   	push   rbp
  80855a:	48 89 e5             	mov    rbp,rsp
    if((unsigned char)entry.name[0]==0xe5u||\
  80855d:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
  808561:	3c e5                	cmp    al,0xe5
  808563:	74 08                	je     80856d <file_exist+0x18>
    (unsigned char)entry.name[0]==0u)
  808565:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
    if((unsigned char)entry.name[0]==0xe5u||\
  808569:	84 c0                	test   al,al
  80856b:	75 07                	jne    808574 <file_exist+0x1f>
    {
        //printf("file not exist\n");
        return 0;
  80856d:	b8 00 00 00 00       	mov    eax,0x0
  808572:	eb 05                	jmp    808579 <file_exist+0x24>

    }
    return 1;
  808574:	b8 01 00 00 00       	mov    eax,0x1
}
  808579:	5d                   	pop    rbp
  80857a:	c3                   	ret    

000000000080857b <get_entry>:
int get_entry(driver_args* args)
{
  80857b:	f3 0f 1e fa          	endbr64 
  80857f:	55                   	push   rbp
  808580:	48 89 e5             	mov    rbp,rsp
  808583:	53                   	push   rbx
  808584:	48 81 ec e8 00 00 00 	sub    rsp,0xe8
  80858b:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
    char *name=args->path;
  808592:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808599:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80859d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    dir.fistCluNum=((vfs_dir_entry*)args->cwd)->id;
  8085a1:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8085a8:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  8085af:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8085b2:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    dir_entry entry;
    vfs_dir_entry ret;
    entry.name[0]=0xe5;
  8085b6:	c6 45 90 e5          	mov    BYTE PTR [rbp-0x70],0xe5

    char *p=name;
  8085ba:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8085be:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    char nametmp[12];
    int index=-1;
  8085c2:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [rbp-0x24],0xffffffff
    while(*name!='\0')
  8085c9:	e9 2c 01 00 00       	jmp    8086fa <get_entry+0x17f>
    {
        if(*name=='/')
  8085ce:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8085d2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8085d5:	3c 2f                	cmp    al,0x2f
  8085d7:	0f 85 18 01 00 00    	jne    8086f5 <get_entry+0x17a>
        {
            if(name-p>11)return -1;
  8085dd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8085e1:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  8085e5:	48 83 f8 0b          	cmp    rax,0xb
  8085e9:	7e 0a                	jle    8085f5 <get_entry+0x7a>
  8085eb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8085f0:	e9 50 02 00 00       	jmp    808845 <get_entry+0x2ca>
            memcpy(nametmp,p,name-p);
  8085f5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8085f9:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  8085fd:	89 c2                	mov    edx,eax
  8085ff:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  808603:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  80860a:	48 89 ce             	mov    rsi,rcx
  80860d:	48 89 c7             	mov    rdi,rax
  808610:	e8 31 0f 00 00       	call   809546 <memcpy>
            cur_dir=dir;
  808615:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808619:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80861d:	48 89 05 7c 43 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2437c],rax        # 42c9a0 <cur_dir>
  808624:	48 89 15 7d 43 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2437d],rdx        # 42c9a8 <cur_dir+0x8>
  80862b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80862f:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808633:	48 89 05 76 43 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc24376],rax        # 42c9b0 <cur_dir+0x10>
  80863a:	48 89 15 77 43 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc24377],rdx        # 42c9b8 <cur_dir+0x18>
            format_name(nametmp);
  808641:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  808648:	48 89 c7             	mov    rdi,rax
  80864b:	e8 c3 eb ff ff       	call   807213 <format_name>
            index= find(nametmp);
  808650:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  808657:	48 89 c7             	mov    rdi,rax
  80865a:	e8 ce f6 ff ff       	call   807d2d <find>
  80865f:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            if(index==-1)return -1;
  808662:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  808666:	75 0a                	jne    808672 <get_entry+0xf7>
  808668:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80866d:	e9 d3 01 00 00       	jmp    808845 <get_entry+0x2ca>
            if(cur_dir.fistCluNum==0)//在根目录
  808672:	0f b7 05 41 43 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc24341]        # 42c9ba <cur_dir+0x1a>
  808679:	66 85 c0             	test   ax,ax
  80867c:	75 31                	jne    8086af <get_entry+0x134>
                dir=root_dir[index];
  80867e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808681:	48 98                	cdqe   
  808683:	48 c1 e0 05          	shl    rax,0x5
  808687:	48 8d 88 a0 89 42 00 	lea    rcx,[rax+0x4289a0]
  80868e:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808691:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808695:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  808699:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  80869d:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8086a1:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  8086a5:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  8086a9:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  8086ad:	eb 3a                	jmp    8086e9 <get_entry+0x16e>
            else//在子目录
                dir=a_clu_of_dir[index%16];
  8086af:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8086b2:	99                   	cdq    
  8086b3:	c1 ea 1c             	shr    edx,0x1c
  8086b6:	01 d0                	add    eax,edx
  8086b8:	83 e0 0f             	and    eax,0xf
  8086bb:	29 d0                	sub    eax,edx
  8086bd:	48 98                	cdqe   
  8086bf:	48 c1 e0 05          	shl    rax,0x5
  8086c3:	48 8d 88 c0 c9 42 00 	lea    rcx,[rax+0x42c9c0]
  8086ca:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8086cd:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  8086d1:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  8086d5:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  8086d9:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8086dd:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  8086e1:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  8086e5:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
            p=name+1;
  8086e9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086ed:	48 83 c0 01          	add    rax,0x1
  8086f1:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        }
        name++;
  8086f5:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
    while(*name!='\0')
  8086fa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8086fe:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808701:	84 c0                	test   al,al
  808703:	0f 85 c5 fe ff ff    	jne    8085ce <get_entry+0x53>
    }

    //现在就可以开始找文件了
    format_name(p);
  808709:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80870d:	48 89 c7             	mov    rdi,rax
  808710:	e8 fe ea ff ff       	call   807213 <format_name>
    index= find(p);
  808715:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808719:	48 89 c7             	mov    rdi,rax
  80871c:	e8 0c f6 ff ff       	call   807d2d <find>
  808721:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    if(index==-1)return -1;
  808724:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  808728:	75 0a                	jne    808734 <get_entry+0x1b9>
  80872a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80872f:	e9 11 01 00 00       	jmp    808845 <get_entry+0x2ca>
    
    if(cur_dir.fistCluNum==0)//在根目录
  808734:	0f b7 05 7f 42 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2427f]        # 42c9ba <cur_dir+0x1a>
  80873b:	66 85 c0             	test   ax,ax
  80873e:	75 31                	jne    808771 <get_entry+0x1f6>
        entry=root_dir[index];
  808740:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808743:	48 98                	cdqe   
  808745:	48 c1 e0 05          	shl    rax,0x5
  808749:	48 8d 88 a0 89 42 00 	lea    rcx,[rax+0x4289a0]
  808750:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808753:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808757:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  80875b:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  80875f:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808763:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808767:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  80876b:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  80876f:	eb 3a                	jmp    8087ab <get_entry+0x230>
    else//在子目录
        entry=a_clu_of_dir[index%16];
  808771:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808774:	99                   	cdq    
  808775:	c1 ea 1c             	shr    edx,0x1c
  808778:	01 d0                	add    eax,edx
  80877a:	83 e0 0f             	and    eax,0xf
  80877d:	29 d0                	sub    eax,edx
  80877f:	48 98                	cdqe   
  808781:	48 c1 e0 05          	shl    rax,0x5
  808785:	48 8d 88 c0 c9 42 00 	lea    rcx,[rax+0x42c9c0]
  80878c:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  80878f:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808793:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  808797:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  80879b:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  80879f:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  8087a3:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  8087a7:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
    ret.id=entry.fistCluNum;
  8087ab:	0f b7 45 aa          	movzx  eax,WORD PTR [rbp-0x56]
  8087af:	0f b7 c0             	movzx  eax,ax
  8087b2:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    args->entry=ret;
  8087b8:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8087bf:	48 8b 8d 30 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd0]
  8087c6:	48 8b 9d 38 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xc8]
  8087cd:	48 89 48 28          	mov    QWORD PTR [rax+0x28],rcx
  8087d1:	48 89 58 30          	mov    QWORD PTR [rax+0x30],rbx
  8087d5:	48 8b 8d 40 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xc0]
  8087dc:	48 8b 9d 48 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xb8]
  8087e3:	48 89 48 38          	mov    QWORD PTR [rax+0x38],rcx
  8087e7:	48 89 58 40          	mov    QWORD PTR [rax+0x40],rbx
  8087eb:	48 8b 8d 50 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb0]
  8087f2:	48 8b 9d 58 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xa8]
  8087f9:	48 89 48 48          	mov    QWORD PTR [rax+0x48],rcx
  8087fd:	48 89 58 50          	mov    QWORD PTR [rax+0x50],rbx
  808801:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  808808:	48 8b 9d 68 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x98]
  80880f:	48 89 48 58          	mov    QWORD PTR [rax+0x58],rcx
  808813:	48 89 58 60          	mov    QWORD PTR [rax+0x60],rbx
  808817:	48 8b 8d 70 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x90]
  80881e:	48 8b 9d 78 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x88]
  808825:	48 89 48 68          	mov    QWORD PTR [rax+0x68],rcx
  808829:	48 89 58 70          	mov    QWORD PTR [rax+0x70],rbx
  80882d:	48 8b 4d 80          	mov    rcx,QWORD PTR [rbp-0x80]
  808831:	48 8b 5d 88          	mov    rbx,QWORD PTR [rbp-0x78]
  808835:	48 89 48 78          	mov    QWORD PTR [rax+0x78],rcx
  808839:	48 89 98 80 00 00 00 	mov    QWORD PTR [rax+0x80],rbx
    return 0;
  808840:	b8 00 00 00 00       	mov    eax,0x0
}
  808845:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  808849:	c9                   	leave  
  80884a:	c3                   	ret    

000000000080884b <get_fname>:
        dir=strtok(NULL,'/');
    }
    return 0;
}*/
void get_fname(char *path,char *name)
{
  80884b:	f3 0f 1e fa          	endbr64 
  80884f:	55                   	push   rbp
  808850:	48 89 e5             	mov    rbp,rsp
  808853:	48 83 ec 20          	sub    rsp,0x20
  808857:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80885b:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    char *prev,*ptr=strtok(path,'/');
  80885f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808863:	be 2f 00 00 00       	mov    esi,0x2f
  808868:	48 89 c7             	mov    rdi,rax
  80886b:	e8 18 0e 00 00       	call   809688 <strtok>
  808870:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  808874:	eb 1b                	jmp    808891 <get_fname+0x46>
    {
        prev=ptr;
  808876:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80887a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        ptr=strtok(NULL,'/');
  80887e:	be 2f 00 00 00       	mov    esi,0x2f
  808883:	bf 00 00 00 00       	mov    edi,0x0
  808888:	e8 fb 0d 00 00       	call   809688 <strtok>
  80888d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  808891:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  808896:	75 de                	jne    808876 <get_fname+0x2b>
    }
    strcpy(name,prev);
  808898:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80889c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8088a0:	48 89 d6             	mov    rsi,rdx
  8088a3:	48 89 c7             	mov    rdi,rax
  8088a6:	e8 99 0d 00 00       	call   809644 <strcpy>
}
  8088ab:	90                   	nop
  8088ac:	c9                   	leave  
  8088ad:	c3                   	ret    

00000000008088ae <read_file>:
char buf[1024];
int read_file(driver_args* args)
{
  8088ae:	f3 0f 1e fa          	endbr64 
  8088b2:	55                   	push   rbp
  8088b3:	48 89 e5             	mov    rbp,rsp
  8088b6:	48 83 ec 60          	sub    rsp,0x60
  8088ba:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    int len=args->len;
  8088be:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8088c2:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8088c5:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int pos=args->pos;
  8088c8:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8088cc:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8088cf:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  8088d2:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8088d6:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8088d9:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    char* dist=args->dist_addr;
  8088dd:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8088e1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8088e4:	48 98                	cdqe   
  8088e6:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int c=len/superblock.bytesPerSec;
  8088ea:	0f b7 05 7a 00 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2007a]        # 42896b <superblock+0xb>
  8088f1:	0f b7 f0             	movzx  esi,ax
  8088f4:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8088f7:	99                   	cdq    
  8088f8:	f7 fe                	idiv   esi
  8088fa:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    c+=len%superblock.bytesPerSec?1:0;
  8088fd:	0f b7 05 67 00 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20067]        # 42896b <superblock+0xb>
  808904:	0f b7 c8             	movzx  ecx,ax
  808907:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80890a:	99                   	cdq    
  80890b:	f7 f9                	idiv   ecx
  80890d:	89 d0                	mov    eax,edx
  80890f:	85 c0                	test   eax,eax
  808911:	0f 95 c0             	setne  al
  808914:	0f b6 c0             	movzx  eax,al
  808917:	01 45 dc             	add    DWORD PTR [rbp-0x24],eax
    //printf("[fs]%d secs to sys_read.\n",c);
    int n=0;
  80891a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808921:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  808925:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    int mpos=pos/superblock.bytesPerSec;
  808929:	0f b7 05 3b 00 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2003b]        # 42896b <superblock+0xb>
  808930:	0f b7 f8             	movzx  edi,ax
  808933:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808936:	99                   	cdq    
  808937:	f7 ff                	idiv   edi
  808939:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  80893c:	eb 16                	jmp    808954 <read_file+0xa6>
    {
         clu=fat[clu];
  80893e:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808942:	48 98                	cdqe   
  808944:	0f b7 84 00 c0 cb 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cbc0]
  80894b:	00 
  80894c:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  808950:	83 6d e4 01          	sub    DWORD PTR [rbp-0x1c],0x1
  808954:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808959:	77 06                	ja     808961 <read_file+0xb3>
  80895b:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  80895f:	7f dd                	jg     80893e <read_file+0x90>
    }
    if(mpos>0)return -1;//读取位置超出范围
  808961:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  808965:	7e 0a                	jle    808971 <read_file+0xc3>
  808967:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80896c:	e9 cd 00 00 00       	jmp    808a3e <read_file+0x190>
    pos%=superblock.bytesPerSec;
  808971:	0f b7 05 f3 ff c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1fff3]        # 42896b <superblock+0xb>
  808978:	0f b7 c8             	movzx  ecx,ax
  80897b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80897e:	99                   	cdq    
  80897f:	f7 f9                	idiv   ecx
  808981:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
    int block_size=superblock.secPerClu*superblock.bytesPerSec;
  808984:	0f b6 05 e2 ff c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1ffe2]        # 42896d <superblock+0xd>
  80898b:	0f b6 d0             	movzx  edx,al
  80898e:	0f b7 05 d6 ff c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1ffd6]        # 42896b <superblock+0xb>
  808995:	0f b7 c0             	movzx  eax,ax
  808998:	0f af c2             	imul   eax,edx
  80899b:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    while(n<c)
  80899e:	e9 89 00 00 00       	jmp    808a2c <read_file+0x17e>
    {
        read_sec(buf,clu+clu_sec_balance,superblock.secPerClu);
  8089a3:	0f b6 05 c3 ff c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1ffc3]        # 42896d <superblock+0xd>
  8089aa:	0f b6 c0             	movzx  eax,al
  8089ad:	0f b7 4d ea          	movzx  ecx,WORD PTR [rbp-0x16]
  8089b1:	8b 15 29 17 00 00    	mov    edx,DWORD PTR [rip+0x1729]        # 80a0e0 <clu_sec_balance>
  8089b7:	01 d1                	add    ecx,edx
  8089b9:	89 c2                	mov    edx,eax
  8089bb:	89 ce                	mov    esi,ecx
  8089bd:	bf e0 0b 43 00       	mov    edi,0x430be0
  8089c2:	e8 98 f0 ff ff       	call   807a5f <read_sec>
        //printf("%x+%x\n",buf,pos);
        int cplen=block_size-pos>len?len:block_size-pos;
  8089c7:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8089ca:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  8089cd:	8b 55 e0             	mov    edx,DWORD PTR [rbp-0x20]
  8089d0:	39 c2                	cmp    edx,eax
  8089d2:	0f 4e c2             	cmovle eax,edx
  8089d5:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
        memcpy(dist,buf+pos,cplen);
  8089d8:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  8089db:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8089de:	48 98                	cdqe   
  8089e0:	48 8d 88 e0 0b 43 00 	lea    rcx,[rax+0x430be0]
  8089e7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8089eb:	48 89 ce             	mov    rsi,rcx
  8089ee:	48 89 c7             	mov    rdi,rax
  8089f1:	e8 50 0b 00 00       	call   809546 <memcpy>
        n++;
  8089f6:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        dist+=block_size-pos;
  8089fa:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8089fd:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  808a00:	48 98                	cdqe   
  808a02:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        if(pos>0)pos=0;
  808a06:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808a0a:	7e 07                	jle    808a13 <read_file+0x165>
  808a0c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        clu=fat[clu];
  808a13:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808a17:	48 98                	cdqe   
  808a19:	0f b7 84 00 c0 cb 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cbc0]
  808a20:	00 
  808a21:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  808a25:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808a2a:	77 0e                	ja     808a3a <read_file+0x18c>
    while(n<c)
  808a2c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808a2f:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  808a32:	0f 8c 6b ff ff ff    	jl     8089a3 <read_file+0xf5>
  808a38:	eb 01                	jmp    808a3b <read_file+0x18d>
        if(clu>=FAT_EOF)break;
  808a3a:	90                   	nop
    }
    return n;
  808a3b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
}
  808a3e:	c9                   	leave  
  808a3f:	c3                   	ret    

0000000000808a40 <write_file>:
int write_file(driver_args* args)
{
  808a40:	f3 0f 1e fa          	endbr64 
  808a44:	55                   	push   rbp
  808a45:	48 89 e5             	mov    rbp,rsp
  808a48:	48 83 ec 50          	sub    rsp,0x50
  808a4c:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    int len=args->len;
  808a50:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808a54:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808a57:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    int pos=args->pos;
  808a5a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808a5e:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808a61:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  808a64:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808a68:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  808a6b:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    char* src=args->src_addr;
  808a6f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808a73:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808a76:	48 98                	cdqe   
  808a78:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    pos/=superblock.bytesPerSec;
  808a7c:	0f b7 05 e8 fe c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1fee8]        # 42896b <superblock+0xb>
  808a83:	0f b7 f0             	movzx  esi,ax
  808a86:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808a89:	99                   	cdq    
  808a8a:	f7 fe                	idiv   esi
  808a8c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=len/512+len%512?1:0;
  808a8f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808a92:	8d 90 ff 01 00 00    	lea    edx,[rax+0x1ff]
  808a98:	85 c0                	test   eax,eax
  808a9a:	0f 48 c2             	cmovs  eax,edx
  808a9d:	c1 f8 09             	sar    eax,0x9
  808aa0:	89 c1                	mov    ecx,eax
  808aa2:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808aa5:	99                   	cdq    
  808aa6:	c1 ea 17             	shr    edx,0x17
  808aa9:	01 d0                	add    eax,edx
  808aab:	25 ff 01 00 00       	and    eax,0x1ff
  808ab0:	29 d0                	sub    eax,edx
  808ab2:	01 c8                	add    eax,ecx
  808ab4:	85 c0                	test   eax,eax
  808ab6:	0f 95 c0             	setne  al
  808ab9:	0f b6 c0             	movzx  eax,al
  808abc:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int n=0;
  808abf:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808ac6:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  808aca:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&pos>0;pos--,clu=fat[clu]);
  808ace:	eb 16                	jmp    808ae6 <write_file+0xa6>
  808ad0:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  808ad4:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808ad8:	48 98                	cdqe   
  808ada:	0f b7 84 00 c0 cb 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cbc0]
  808ae1:	00 
  808ae2:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  808ae6:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808aeb:	77 06                	ja     808af3 <write_file+0xb3>
  808aed:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808af1:	7f dd                	jg     808ad0 <write_file+0x90>
    if(pos>0)return -1;//读取位置超出范围
  808af3:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808af7:	7e 52                	jle    808b4b <write_file+0x10b>
  808af9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808afe:	eb 59                	jmp    808b59 <write_file+0x119>
    while(n<c)
    {
        write_sec(src,clu+clu_sec_balance,1);
  808b00:	0f b7 55 ea          	movzx  edx,WORD PTR [rbp-0x16]
  808b04:	8b 05 d6 15 00 00    	mov    eax,DWORD PTR [rip+0x15d6]        # 80a0e0 <clu_sec_balance>
  808b0a:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  808b0d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808b11:	ba 01 00 00 00       	mov    edx,0x1
  808b16:	89 ce                	mov    esi,ecx
  808b18:	48 89 c7             	mov    rdi,rax
  808b1b:	e8 4b e8 ff ff       	call   80736b <write_sec>
        n++;
  808b20:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        src+=superblock.bytesPerSec;
  808b24:	0f b7 05 40 fe c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1fe40]        # 42896b <superblock+0xb>
  808b2b:	0f b7 c0             	movzx  eax,ax
  808b2e:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        clu=fat[clu];
  808b32:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808b36:	48 98                	cdqe   
  808b38:	0f b7 84 00 c0 cb 42 	movzx  eax,WORD PTR [rax+rax*1+0x42cbc0]
  808b3f:	00 
  808b40:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  808b44:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808b49:	77 0a                	ja     808b55 <write_file+0x115>
    while(n<c)
  808b4b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808b4e:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  808b51:	7c ad                	jl     808b00 <write_file+0xc0>
  808b53:	eb 01                	jmp    808b56 <write_file+0x116>
        if(clu>=FAT_EOF)break;
  808b55:	90                   	nop
    }
    return n;
  808b56:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    
  808b59:	c9                   	leave  
  808b5a:	c3                   	ret    

0000000000808b5b <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  808b5b:	f3 0f 1e fa          	endbr64 
  808b5f:	55                   	push   rbp
  808b60:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  808b63:	48 8b 05 86 84 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc28486]        # 430ff0 <vpage_base>
  808b6a:	48 05 a0 00 00 00    	add    rax,0xa0
  808b70:	48 89 05 79 84 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28479],rax        # 430ff0 <vpage_base>
    page_boffset+=SCREEN_W*2;
  808b77:	8b 05 7b 84 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2847b]        # 430ff8 <page_boffset>
  808b7d:	05 a0 00 00 00       	add    eax,0xa0
  808b82:	89 05 70 84 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28470],eax        # 430ff8 <page_boffset>
    if(vpage_base>=video_end)
  808b88:	48 8b 15 61 84 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc28461]        # 430ff0 <vpage_base>
  808b8f:	48 8b 05 52 84 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc28452]        # 430fe8 <video_end>
  808b96:	48 39 c2             	cmp    rdx,rax
  808b99:	72 0e                	jb     808ba9 <scrdown+0x4e>
        vpage_base=video_base;
  808b9b:	48 8b 05 3e 84 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2843e]        # 430fe0 <video_base>
  808ba2:	48 89 05 47 84 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28447],rax        # 430ff0 <vpage_base>
    set_origin();
  808ba9:	b8 00 00 00 00       	mov    eax,0x0
  808bae:	e8 6a 00 00 00       	call   808c1d <set_origin>
}
  808bb3:	90                   	nop
  808bb4:	5d                   	pop    rbp
  808bb5:	c3                   	ret    

0000000000808bb6 <scrup>:
void scrup()
{
  808bb6:	f3 0f 1e fa          	endbr64 
  808bba:	55                   	push   rbp
  808bbb:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  808bbe:	8b 05 34 84 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28434]        # 430ff8 <page_boffset>
  808bc4:	85 c0                	test   eax,eax
  808bc6:	75 24                	jne    808bec <scrup+0x36>
    {
        page_boffset=0;
  808bc8:	c7 05 26 84 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28426],0x0        # 430ff8 <page_boffset>
  808bcf:	00 00 00 
        vpage_base=video_base;
  808bd2:	48 8b 05 07 84 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc28407]        # 430fe0 <video_base>
  808bd9:	48 89 05 10 84 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28410],rax        # 430ff0 <vpage_base>
        set_origin();
  808be0:	b8 00 00 00 00       	mov    eax,0x0
  808be5:	e8 33 00 00 00       	call   808c1d <set_origin>
        return;
  808bea:	eb 2f                	jmp    808c1b <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  808bec:	48 8b 05 fd 83 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc283fd]        # 430ff0 <vpage_base>
  808bf3:	48 2d a0 00 00 00    	sub    rax,0xa0
  808bf9:	48 89 05 f0 83 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc283f0],rax        # 430ff0 <vpage_base>
    page_boffset-=SCREEN_W*2;
  808c00:	8b 05 f2 83 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc283f2]        # 430ff8 <page_boffset>
  808c06:	2d a0 00 00 00       	sub    eax,0xa0
  808c0b:	89 05 e7 83 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc283e7],eax        # 430ff8 <page_boffset>
    set_origin();
  808c11:	b8 00 00 00 00       	mov    eax,0x0
  808c16:	e8 02 00 00 00       	call   808c1d <set_origin>
}
  808c1b:	5d                   	pop    rbp
  808c1c:	c3                   	ret    

0000000000808c1d <set_origin>:
void set_origin(void)
{
  808c1d:	f3 0f 1e fa          	endbr64 
  808c21:	55                   	push   rbp
  808c22:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  808c25:	fa                   	cli    
    outb(port_reg_index,12);
  808c26:	8b 05 dc 83 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc283dc]        # 431008 <port_reg_index>
  808c2c:	0f b7 c0             	movzx  eax,ax
  808c2f:	be 0c 00 00 00       	mov    esi,0xc
  808c34:	89 c7                	mov    edi,eax
  808c36:	e8 25 bd ff ff       	call   804960 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  808c3b:	8b 05 b7 83 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc283b7]        # 430ff8 <page_boffset>
  808c41:	c1 e8 09             	shr    eax,0x9
  808c44:	0f b6 d0             	movzx  edx,al
  808c47:	8b 05 bf 83 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc283bf]        # 43100c <port_reg_v>
  808c4d:	0f b7 c0             	movzx  eax,ax
  808c50:	89 d6                	mov    esi,edx
  808c52:	89 c7                	mov    edi,eax
  808c54:	e8 07 bd ff ff       	call   804960 <outb>
    outb(port_reg_index,13);
  808c59:	8b 05 a9 83 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc283a9]        # 431008 <port_reg_index>
  808c5f:	0f b7 c0             	movzx  eax,ax
  808c62:	be 0d 00 00 00       	mov    esi,0xd
  808c67:	89 c7                	mov    edi,eax
  808c69:	e8 f2 bc ff ff       	call   804960 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  808c6e:	8b 05 84 83 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc28384]        # 430ff8 <page_boffset>
  808c74:	d1 e8                	shr    eax,1
  808c76:	0f b6 d0             	movzx  edx,al
  808c79:	8b 05 8d 83 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2838d]        # 43100c <port_reg_v>
  808c7f:	0f b7 c0             	movzx  eax,ax
  808c82:	89 d6                	mov    esi,edx
  808c84:	89 c7                	mov    edi,eax
  808c86:	e8 d5 bc ff ff       	call   804960 <outb>
    asm volatile("sti");
  808c8b:	fb                   	sti    

}
  808c8c:	90                   	nop
  808c8d:	5d                   	pop    rbp
  808c8e:	c3                   	ret    

0000000000808c8f <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  808c8f:	f3 0f 1e fa          	endbr64 
  808c93:	55                   	push   rbp
  808c94:	48 89 e5             	mov    rbp,rsp
  808c97:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  808c9b:	be 68 21 81 00       	mov    esi,0x812168
  808ca0:	bf 14 20 81 00       	mov    edi,0x812014
  808ca5:	e8 9a 09 00 00       	call   809644 <strcpy>
    strcpy(dev_stdout.name,"stdout");
  808caa:	be 6d 21 81 00       	mov    esi,0x81216d
  808caf:	bf d4 20 81 00       	mov    edi,0x8120d4
  808cb4:	e8 8b 09 00 00       	call   809644 <strcpy>
    reg_driver(&drv_tty);
  808cb9:	bf 60 1f 81 00       	mov    edi,0x811f60
  808cbe:	e8 8b 9f ff ff       	call   802c4e <reg_driver>
    reg_device(&dev_tty);
  808cc3:	bf 00 20 81 00       	mov    edi,0x812000
  808cc8:	e8 99 9c ff ff       	call   802966 <reg_device>
    reg_device(&dev_stdout);
  808ccd:	bf c0 20 81 00       	mov    edi,0x8120c0
  808cd2:	e8 8f 9c ff ff       	call   802966 <reg_device>
    unsigned char *vp=0x20000;
  808cd7:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  808cde:	00 
    if(*vp==0x7)
  808cdf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ce3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808ce6:	3c 07                	cmp    al,0x7
  808ce8:	75 36                	jne    808d20 <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  808cea:	c7 05 08 83 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28308],0x0        # 430ffc <video_mode>
  808cf1:	00 00 00 
        video_base=0xb0000;
  808cf4:	48 c7 05 e1 82 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc282e1],0xb0000        # 430fe0 <video_base>
  808cfb:	00 00 0b 00 
        video_end=0xb8000-1;
  808cff:	48 c7 05 de 82 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc282de],0xb7fff        # 430fe8 <video_end>
  808d06:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  808d0a:	c7 05 f4 82 c2 ff b4 	mov    DWORD PTR [rip+0xffffffffffc282f4],0x3b4        # 431008 <port_reg_index>
  808d11:	03 00 00 
        port_reg_v=0x3b5;
  808d14:	c7 05 ee 82 c2 ff b5 	mov    DWORD PTR [rip+0xffffffffffc282ee],0x3b5        # 43100c <port_reg_v>
  808d1b:	03 00 00 
  808d1e:	eb 61                	jmp    808d81 <init_tty+0xf2>
    }else if(*vp<=0x3)
  808d20:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d24:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d27:	3c 03                	cmp    al,0x3
  808d29:	77 36                	ja     808d61 <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  808d2b:	c7 05 c7 82 c2 ff 01 	mov    DWORD PTR [rip+0xffffffffffc282c7],0x1        # 430ffc <video_mode>
  808d32:	00 00 00 
        video_base=0xb8000;
  808d35:	48 c7 05 a0 82 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc282a0],0xb8000        # 430fe0 <video_base>
  808d3c:	00 80 0b 00 
        video_end=0xc0000-1;
  808d40:	48 c7 05 9d 82 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2829d],0xbffff        # 430fe8 <video_end>
  808d47:	ff ff 0b 00 
        port_reg_index=0x3d4;
  808d4b:	c7 05 b3 82 c2 ff d4 	mov    DWORD PTR [rip+0xffffffffffc282b3],0x3d4        # 431008 <port_reg_index>
  808d52:	03 00 00 
        port_reg_v=0x3d5;
  808d55:	c7 05 ad 82 c2 ff d5 	mov    DWORD PTR [rip+0xffffffffffc282ad],0x3d5        # 43100c <port_reg_v>
  808d5c:	03 00 00 
  808d5f:	eb 20                	jmp    808d81 <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  808d61:	c7 05 91 82 c2 ff 02 	mov    DWORD PTR [rip+0xffffffffffc28291],0x2        # 430ffc <video_mode>
  808d68:	00 00 00 
        video_base=0xa0000;
  808d6b:	48 c7 05 6a 82 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2826a],0xa0000        # 430fe0 <video_base>
  808d72:	00 00 0a 00 
        video_end=0xb0000-1;
  808d76:	48 c7 05 67 82 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc28267],0xaffff        # 430fe8 <video_end>
  808d7d:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  808d81:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d85:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d88:	3c 01                	cmp    al,0x1
  808d8a:	77 0f                	ja     808d9b <init_tty+0x10c>
  808d8c:	c7 05 6e 82 c2 ff 28 	mov    DWORD PTR [rip+0xffffffffffc2826e],0x28        # 431004 <line_chs>
  808d93:	00 00 00 
  808d96:	e9 91 00 00 00       	jmp    808e2c <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  808d9b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d9f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808da2:	3c 03                	cmp    al,0x3
  808da4:	76 0b                	jbe    808db1 <init_tty+0x122>
  808da6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808daa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808dad:	3c 07                	cmp    al,0x7
  808daf:	75 0c                	jne    808dbd <init_tty+0x12e>
  808db1:	c7 05 49 82 c2 ff 50 	mov    DWORD PTR [rip+0xffffffffffc28249],0x50        # 431004 <line_chs>
  808db8:	00 00 00 
  808dbb:	eb 6f                	jmp    808e2c <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  808dbd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808dc1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808dc4:	3c 05                	cmp    al,0x5
  808dc6:	76 16                	jbe    808dde <init_tty+0x14f>
  808dc8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808dcc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808dcf:	3c 09                	cmp    al,0x9
  808dd1:	74 0b                	je     808dde <init_tty+0x14f>
  808dd3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808dd7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808dda:	3c 0d                	cmp    al,0xd
  808ddc:	75 0c                	jne    808dea <init_tty+0x15b>
  808dde:	c7 05 1c 82 c2 ff 40 	mov    DWORD PTR [rip+0xffffffffffc2821c],0x140        # 431004 <line_chs>
  808de5:	01 00 00 
  808de8:	eb 42                	jmp    808e2c <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  808dea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808dee:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808df1:	3c 06                	cmp    al,0x6
  808df3:	74 16                	je     808e0b <init_tty+0x17c>
  808df5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808df9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808dfc:	3c 0a                	cmp    al,0xa
  808dfe:	74 0b                	je     808e0b <init_tty+0x17c>
  808e00:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e04:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e07:	3c 0d                	cmp    al,0xd
  808e09:	76 0c                	jbe    808e17 <init_tty+0x188>
  808e0b:	c7 05 ef 81 c2 ff 80 	mov    DWORD PTR [rip+0xffffffffffc281ef],0x280        # 431004 <line_chs>
  808e12:	02 00 00 
  808e15:	eb 15                	jmp    808e2c <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  808e17:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e1b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e1e:	3c 08                	cmp    al,0x8
  808e20:	75 0a                	jne    808e2c <init_tty+0x19d>
  808e22:	c7 05 d8 81 c2 ff a0 	mov    DWORD PTR [rip+0xffffffffffc281d8],0xa0        # 431004 <line_chs>
  808e29:	00 00 00 
    switch (*vp)
  808e2c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e30:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e33:	0f b6 c0             	movzx  eax,al
  808e36:	83 f8 14             	cmp    eax,0x14
  808e39:	77 61                	ja     808e9c <init_tty+0x20d>
  808e3b:	89 c0                	mov    eax,eax
  808e3d:	48 8b 04 c5 78 21 81 	mov    rax,QWORD PTR [rax*8+0x812178]
  808e44:	00 
  808e45:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  808e48:	c7 05 be 81 c2 ff e8 	mov    DWORD PTR [rip+0xffffffffffc281be],0x3e8        # 431010 <vpage_size>
  808e4f:	03 00 00 
  808e52:	eb 49                	jmp    808e9d <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  808e54:	c7 05 b2 81 c2 ff d0 	mov    DWORD PTR [rip+0xffffffffffc281b2],0x7d0        # 431010 <vpage_size>
  808e5b:	07 00 00 
  808e5e:	eb 3d                	jmp    808e9d <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  808e60:	c7 05 a6 81 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc281a6],0xfa00        # 431010 <vpage_size>
  808e67:	fa 00 00 
  808e6a:	eb 31                	jmp    808e9d <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  808e6c:	c7 05 9a 81 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2819a],0x1f400        # 431010 <vpage_size>
  808e73:	f4 01 00 
  808e76:	eb 25                	jmp    808e9d <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  808e78:	c7 05 8e 81 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2818e],0x7d00        # 431010 <vpage_size>
  808e7f:	7d 00 00 
  808e82:	eb 19                	jmp    808e9d <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  808e84:	c7 05 82 81 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28182],0x36b00        # 431010 <vpage_size>
  808e8b:	6b 03 00 
  808e8e:	eb 0d                	jmp    808e9d <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  808e90:	c7 05 76 81 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28176],0x4b000        # 431010 <vpage_size>
  808e97:	b0 04 00 
  808e9a:	eb 01                	jmp    808e9d <init_tty+0x20e>
    default:
        break;
  808e9c:	90                   	nop
    }
    m_ptr=video_base;
  808e9d:	48 8b 05 3c 81 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2813c]        # 430fe0 <video_base>
  808ea4:	48 89 05 3d 12 00 00 	mov    QWORD PTR [rip+0x123d],rax        # 80a0e8 <m_ptr>
    page_boffset=0;
  808eab:	c7 05 43 81 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28143],0x0        # 430ff8 <page_boffset>
  808eb2:	00 00 00 
    vpage_base=video_base;
  808eb5:	48 8b 05 24 81 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc28124]        # 430fe0 <video_base>
  808ebc:	48 89 05 2d 81 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2812d],rax        # 430ff0 <vpage_base>
    vp++;
  808ec3:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  808ec8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ecc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808ecf:	0f b6 c0             	movzx  eax,al
  808ed2:	89 05 28 81 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28128],eax        # 431000 <vpage>
    vp++;
  808ed8:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  808edd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ee1:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808ee5:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808ee9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808eec:	0f b6 c0             	movzx  eax,al
  808eef:	89 05 27 81 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28127],eax        # 43101c <stline>
    endline=*vp++;
  808ef5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ef9:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808efd:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808f01:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f04:	0f b6 c0             	movzx  eax,al
  808f07:	89 05 13 81 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28113],eax        # 431020 <endline>
    videoy=*vp++;
  808f0d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f11:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808f15:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808f19:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f1c:	0f b6 c0             	movzx  eax,al
  808f1f:	89 05 f3 80 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc280f3],eax        # 431018 <videoy>
    videox=*vp;
  808f25:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f29:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f2c:	0f b6 c0             	movzx  eax,al
  808f2f:	89 05 df 80 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc280df],eax        # 431014 <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  808f35:	90                   	nop
  808f36:	c9                   	leave  
  808f37:	c3                   	ret    

0000000000808f38 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  808f38:	f3 0f 1e fa          	endbr64 
  808f3c:	55                   	push   rbp
  808f3d:	48 89 e5             	mov    rbp,rsp
  808f40:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  808f44:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808f48:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808f4b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  808f4e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808f51:	05 00 c0 05 00       	add    eax,0x5c000
  808f56:	01 c0                	add    eax,eax
  808f58:	48 98                	cdqe   
  808f5a:	48 89 05 87 11 00 00 	mov    QWORD PTR [rip+0x1187],rax        # 80a0e8 <m_ptr>
}
  808f61:	90                   	nop
  808f62:	5d                   	pop    rbp
  808f63:	c3                   	ret    

0000000000808f64 <tell_monitor>:
int tell_monitor()
{
  808f64:	f3 0f 1e fa          	endbr64 
  808f68:	55                   	push   rbp
  808f69:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  808f6c:	48 8b 05 75 11 00 00 	mov    rax,QWORD PTR [rip+0x1175]        # 80a0e8 <m_ptr>
  808f73:	48 8b 15 66 80 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc28066]        # 430fe0 <video_base>
  808f7a:	48 29 d0             	sub    rax,rdx
  808f7d:	48 89 c2             	mov    rdx,rax
  808f80:	48 c1 ea 3f          	shr    rdx,0x3f
  808f84:	48 01 d0             	add    rax,rdx
  808f87:	48 d1 f8             	sar    rax,1
}
  808f8a:	5d                   	pop    rbp
  808f8b:	c3                   	ret    

0000000000808f8c <del_ch>:
void del_ch()
{
  808f8c:	f3 0f 1e fa          	endbr64 
  808f90:	55                   	push   rbp
  808f91:	48 89 e5             	mov    rbp,rsp
  808f94:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  808f9b:	48 8b 05 46 11 00 00 	mov    rax,QWORD PTR [rip+0x1146]        # 80a0e8 <m_ptr>
  808fa2:	48 83 e8 02          	sub    rax,0x2
  808fa6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  808faa:	b8 00 00 00 00       	mov    eax,0x0
  808faf:	e8 b0 ff ff ff       	call   808f64 <tell_monitor>
  808fb4:	89 c2                	mov    edx,eax
  808fb6:	48 63 c2             	movsxd rax,edx
  808fb9:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  808fc0:	48 c1 e8 20          	shr    rax,0x20
  808fc4:	c1 f8 05             	sar    eax,0x5
  808fc7:	89 d1                	mov    ecx,edx
  808fc9:	c1 f9 1f             	sar    ecx,0x1f
  808fcc:	29 c8                	sub    eax,ecx
  808fce:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  808fd1:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  808fd4:	89 c8                	mov    eax,ecx
  808fd6:	c1 e0 02             	shl    eax,0x2
  808fd9:	01 c8                	add    eax,ecx
  808fdb:	c1 e0 04             	shl    eax,0x4
  808fde:	29 c2                	sub    edx,eax
  808fe0:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  808fe3:	eb 17                	jmp    808ffc <del_ch+0x70>
    {
        *p=*(p+2);
  808fe5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808fe9:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  808fed:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ff1:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  808ff3:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  808ff8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808ffc:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  809000:	7e e3                	jle    808fe5 <del_ch+0x59>
    }
    driver_args args= {
  809002:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  809009:	b8 00 00 00 00       	mov    eax,0x0
  80900e:	b9 18 00 00 00       	mov    ecx,0x18
  809013:	48 89 d7             	mov    rdi,rdx
  809016:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  809019:	b8 00 00 00 00       	mov    eax,0x0
  80901e:	e8 41 ff ff ff       	call   808f64 <tell_monitor>
  809023:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  809026:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  80902c:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  809033:	48 89 c7             	mov    rdi,rax
  809036:	e8 fd fe ff ff       	call   808f38 <seek_tty>
    set_cur();
  80903b:	b8 00 00 00 00       	mov    eax,0x0
  809040:	e8 03 00 00 00       	call   809048 <set_cur>
}
  809045:	90                   	nop
  809046:	c9                   	leave  
  809047:	c3                   	ret    

0000000000809048 <set_cur>:
void set_cur()
{
  809048:	f3 0f 1e fa          	endbr64 
  80904c:	55                   	push   rbp
  80904d:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  809050:	fa                   	cli    
    outb(port_reg_index,14);
  809051:	8b 05 b1 7f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27fb1]        # 431008 <port_reg_index>
  809057:	0f b7 c0             	movzx  eax,ax
  80905a:	be 0e 00 00 00       	mov    esi,0xe
  80905f:	89 c7                	mov    edi,eax
  809061:	e8 fa b8 ff ff       	call   804960 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  809066:	48 8b 05 7b 10 00 00 	mov    rax,QWORD PTR [rip+0x107b]        # 80a0e8 <m_ptr>
  80906d:	48 8b 15 6c 7f c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27f6c]        # 430fe0 <video_base>
  809074:	48 29 d0             	sub    rax,rdx
  809077:	48 c1 f8 09          	sar    rax,0x9
  80907b:	0f b6 d0             	movzx  edx,al
  80907e:	8b 05 88 7f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27f88]        # 43100c <port_reg_v>
  809084:	0f b7 c0             	movzx  eax,ax
  809087:	89 d6                	mov    esi,edx
  809089:	89 c7                	mov    edi,eax
  80908b:	e8 d0 b8 ff ff       	call   804960 <outb>
    outb(port_reg_index,15);
  809090:	8b 05 72 7f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27f72]        # 431008 <port_reg_index>
  809096:	0f b7 c0             	movzx  eax,ax
  809099:	be 0f 00 00 00       	mov    esi,0xf
  80909e:	89 c7                	mov    edi,eax
  8090a0:	e8 bb b8 ff ff       	call   804960 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  8090a5:	48 8b 05 3c 10 00 00 	mov    rax,QWORD PTR [rip+0x103c]        # 80a0e8 <m_ptr>
  8090ac:	48 8b 15 2d 7f c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27f2d]        # 430fe0 <video_base>
  8090b3:	48 29 d0             	sub    rax,rdx
  8090b6:	48 d1 f8             	sar    rax,1
  8090b9:	0f b6 d0             	movzx  edx,al
  8090bc:	8b 05 4a 7f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27f4a]        # 43100c <port_reg_v>
  8090c2:	0f b7 c0             	movzx  eax,ax
  8090c5:	89 d6                	mov    esi,edx
  8090c7:	89 c7                	mov    edi,eax
  8090c9:	e8 92 b8 ff ff       	call   804960 <outb>
    asm volatile("sti");
  8090ce:	fb                   	sti    
}
  8090cf:	90                   	nop
  8090d0:	5d                   	pop    rbp
  8090d1:	c3                   	ret    

00000000008090d2 <read_tty>:

int read_tty(driver_args *args)
{
  8090d2:	f3 0f 1e fa          	endbr64 
  8090d6:	55                   	push   rbp
  8090d7:	48 89 e5             	mov    rbp,rsp
  8090da:	48 83 ec 20          	sub    rsp,0x20
  8090de:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  8090e2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8090e6:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8090e9:	48 98                	cdqe   
  8090eb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  8090ef:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8090f3:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8090f6:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  8090f9:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809100:	eb 4a                	jmp    80914c <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  809102:	48 8b 15 df 0f 00 00 	mov    rdx,QWORD PTR [rip+0xfdf]        # 80a0e8 <m_ptr>
  809109:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80910d:	48 8d 48 01          	lea    rcx,[rax+0x1]
  809111:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  809115:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  809118:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  80911a:	48 8b 05 c7 0f 00 00 	mov    rax,QWORD PTR [rip+0xfc7]        # 80a0e8 <m_ptr>
  809121:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  809127:	75 0d                	jne    809136 <read_tty+0x64>
  809129:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80912d:	7e 07                	jle    809136 <read_tty+0x64>
        {
            return 1;//读到尾了
  80912f:	b8 01 00 00 00       	mov    eax,0x1
  809134:	eb 2d                	jmp    809163 <read_tty+0x91>
        }
        m_ptr+=2;
  809136:	48 8b 05 ab 0f 00 00 	mov    rax,QWORD PTR [rip+0xfab]        # 80a0e8 <m_ptr>
  80913d:	48 83 c0 02          	add    rax,0x2
  809141:	48 89 05 a0 0f 00 00 	mov    QWORD PTR [rip+0xfa0],rax        # 80a0e8 <m_ptr>
    for(int i=0;i<len;i++)
  809148:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80914c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80914f:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  809152:	7c ae                	jl     809102 <read_tty+0x30>
    }
    set_cur();
  809154:	b8 00 00 00 00       	mov    eax,0x0
  809159:	e8 ea fe ff ff       	call   809048 <set_cur>
    return 0;
  80915e:	b8 00 00 00 00       	mov    eax,0x0
}
  809163:	c9                   	leave  
  809164:	c3                   	ret    

0000000000809165 <write_tty>:
int write_tty(driver_args *args)
{
  809165:	f3 0f 1e fa          	endbr64 
  809169:	55                   	push   rbp
  80916a:	48 89 e5             	mov    rbp,rsp
  80916d:	48 83 ec 30          	sub    rsp,0x30
  809171:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  809175:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809179:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80917c:	48 98                	cdqe   
  80917e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  809182:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809186:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  809189:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80918c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809193:	e9 0b 01 00 00       	jmp    8092a3 <write_tty+0x13e>
    {
        if(*src=='\n')
  809198:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80919c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80919f:	3c 0a                	cmp    al,0xa
  8091a1:	75 50                	jne    8091f3 <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  8091a3:	48 8b 05 3e 0f 00 00 	mov    rax,QWORD PTR [rip+0xf3e]        # 80a0e8 <m_ptr>
  8091aa:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  8091b0:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  8091b3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8091b6:	89 c2                	mov    edx,eax
  8091b8:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  8091bd:	48 0f af c2          	imul   rax,rdx
  8091c1:	48 c1 e8 20          	shr    rax,0x20
  8091c5:	c1 e8 07             	shr    eax,0x7
  8091c8:	8d 50 01             	lea    edx,[rax+0x1]
  8091cb:	89 d0                	mov    eax,edx
  8091cd:	c1 e0 02             	shl    eax,0x2
  8091d0:	01 d0                	add    eax,edx
  8091d2:	c1 e0 05             	shl    eax,0x5
  8091d5:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  8091d8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8091db:	05 00 80 0b 00       	add    eax,0xb8000
  8091e0:	89 c0                	mov    eax,eax
  8091e2:	48 89 05 ff 0e 00 00 	mov    QWORD PTR [rip+0xeff],rax        # 80a0e8 <m_ptr>
            src++;
  8091e9:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  8091ee:	e9 ac 00 00 00       	jmp    80929f <write_tty+0x13a>
        }else if(*src=='\0')
  8091f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8091f7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8091fa:	84 c0                	test   al,al
  8091fc:	0f 84 af 00 00 00    	je     8092b1 <write_tty+0x14c>
            break;
        if(*src=='\b')
  809202:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809206:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809209:	3c 08                	cmp    al,0x8
  80920b:	75 1e                	jne    80922b <write_tty+0xc6>
        {
            m_ptr-=2;
  80920d:	48 8b 05 d4 0e 00 00 	mov    rax,QWORD PTR [rip+0xed4]        # 80a0e8 <m_ptr>
  809214:	48 83 e8 02          	sub    rax,0x2
  809218:	48 89 05 c9 0e 00 00 	mov    QWORD PTR [rip+0xec9],rax        # 80a0e8 <m_ptr>
            *m_ptr=0;
  80921f:	48 8b 05 c2 0e 00 00 	mov    rax,QWORD PTR [rip+0xec2]        # 80a0e8 <m_ptr>
  809226:	c6 00 00             	mov    BYTE PTR [rax],0x0
  809229:	eb 3e                	jmp    809269 <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  80922b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80922f:	48 8d 42 01          	lea    rax,[rdx+0x1]
  809233:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  809237:	48 8b 05 aa 0e 00 00 	mov    rax,QWORD PTR [rip+0xeaa]        # 80a0e8 <m_ptr>
  80923e:	48 8d 48 01          	lea    rcx,[rax+0x1]
  809242:	48 89 0d 9f 0e 00 00 	mov    QWORD PTR [rip+0xe9f],rcx        # 80a0e8 <m_ptr>
  809249:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80924c:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  80924e:	48 8b 05 93 0e 00 00 	mov    rax,QWORD PTR [rip+0xe93]        # 80a0e8 <m_ptr>
  809255:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809259:	48 89 15 88 0e 00 00 	mov    QWORD PTR [rip+0xe88],rdx        # 80a0e8 <m_ptr>
  809260:	0f b6 15 89 0e 00 00 	movzx  edx,BYTE PTR [rip+0xe89]        # 80a0f0 <m_color>
  809267:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  809269:	48 8b 05 78 0e 00 00 	mov    rax,QWORD PTR [rip+0xe78]        # 80a0e8 <m_ptr>
  809270:	48 8b 0d 79 7d c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc27d79]        # 430ff0 <vpage_base>
  809277:	48 29 c8             	sub    rax,rcx
  80927a:	48 89 c2             	mov    rdx,rax
  80927d:	8b 05 8d 7d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27d8d]        # 431010 <vpage_size>
  809283:	8b 0d 7b 7d c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc27d7b]        # 431004 <line_chs>
  809289:	29 c8                	sub    eax,ecx
  80928b:	01 c0                	add    eax,eax
  80928d:	48 98                	cdqe   
  80928f:	48 39 c2             	cmp    rdx,rax
  809292:	7c 0b                	jl     80929f <write_tty+0x13a>
  809294:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  809298:	7e 05                	jle    80929f <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  80929a:	e8 bc f8 ff ff       	call   808b5b <scrdown>
    for(int i=0;i<len;i++)
  80929f:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8092a3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8092a6:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  8092a9:	0f 8c e9 fe ff ff    	jl     809198 <write_tty+0x33>
  8092af:	eb 01                	jmp    8092b2 <write_tty+0x14d>
            break;
  8092b1:	90                   	nop
        }
    }
    set_cur();
  8092b2:	b8 00 00 00 00       	mov    eax,0x0
  8092b7:	e8 8c fd ff ff       	call   809048 <set_cur>
    return 0;
  8092bc:	b8 00 00 00 00       	mov    eax,0x0
}
  8092c1:	c9                   	leave  
  8092c2:	c3                   	ret    

00000000008092c3 <cls>:

void cls(driver_args *args)
{
  8092c3:	f3 0f 1e fa          	endbr64 
  8092c7:	55                   	push   rbp
  8092c8:	48 89 e5             	mov    rbp,rsp
  8092cb:	48 83 ec 20          	sub    rsp,0x20
  8092cf:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  8092d3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8092da:	eb 16                	jmp    8092f2 <cls+0x2f>
    {
        vpage_base[i]=0;
  8092dc:	48 8b 15 0d 7d c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc27d0d]        # 430ff0 <vpage_base>
  8092e3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8092e6:	48 98                	cdqe   
  8092e8:	48 01 d0             	add    rax,rdx
  8092eb:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  8092ee:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  8092f2:	8b 05 18 7d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27d18]        # 431010 <vpage_size>
  8092f8:	01 c0                	add    eax,eax
  8092fa:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8092fd:	7c dd                	jl     8092dc <cls+0x19>
    }
    m_ptr=vpage_base;
  8092ff:	48 8b 05 ea 7c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc27cea]        # 430ff0 <vpage_base>
  809306:	48 89 05 db 0d 00 00 	mov    QWORD PTR [rip+0xddb],rax        # 80a0e8 <m_ptr>
    set_cur();
  80930d:	b8 00 00 00 00       	mov    eax,0x0
  809312:	e8 31 fd ff ff       	call   809048 <set_cur>
}
  809317:	90                   	nop
  809318:	c9                   	leave  
  809319:	c3                   	ret    

000000000080931a <set_color>:

void set_color(char color)
{
  80931a:	f3 0f 1e fa          	endbr64 
  80931e:	55                   	push   rbp
  80931f:	48 89 e5             	mov    rbp,rsp
  809322:	89 f8                	mov    eax,edi
  809324:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  809327:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80932b:	88 05 bf 0d 00 00    	mov    BYTE PTR [rip+0xdbf],al        # 80a0f0 <m_color>
}
  809331:	90                   	nop
  809332:	5d                   	pop    rbp
  809333:	c3                   	ret    

0000000000809334 <tty_do_req>:

int tty_do_req(driver_args *args)
{
  809334:	f3 0f 1e fa          	endbr64 
  809338:	55                   	push   rbp
  809339:	48 89 e5             	mov    rbp,rsp
  80933c:	48 83 ec 10          	sub    rsp,0x10
  809340:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  809344:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809348:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80934e:	83 f8 0d             	cmp    eax,0xd
  809351:	74 45                	je     809398 <tty_do_req+0x64>
  809353:	83 f8 0d             	cmp    eax,0xd
  809356:	7f 53                	jg     8093ab <tty_do_req+0x77>
  809358:	83 f8 0c             	cmp    eax,0xc
  80935b:	74 2d                	je     80938a <tty_do_req+0x56>
  80935d:	83 f8 0c             	cmp    eax,0xc
  809360:	7f 49                	jg     8093ab <tty_do_req+0x77>
  809362:	83 f8 02             	cmp    eax,0x2
  809365:	74 07                	je     80936e <tty_do_req+0x3a>
  809367:	83 f8 03             	cmp    eax,0x3
  80936a:	74 10                	je     80937c <tty_do_req+0x48>
  80936c:	eb 3d                	jmp    8093ab <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  80936e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809372:	48 89 c7             	mov    rdi,rax
  809375:	e8 58 fd ff ff       	call   8090d2 <read_tty>
        break;
  80937a:	eb 36                	jmp    8093b2 <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  80937c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809380:	48 89 c7             	mov    rdi,rax
  809383:	e8 dd fd ff ff       	call   809165 <write_tty>
        break;
  809388:	eb 28                	jmp    8093b2 <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  80938a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80938e:	48 89 c7             	mov    rdi,rax
  809391:	e8 a2 fb ff ff       	call   808f38 <seek_tty>
        break;
  809396:	eb 1a                	jmp    8093b2 <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  809398:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80939c:	48 89 c7             	mov    rdi,rax
  80939f:	b8 00 00 00 00       	mov    eax,0x0
  8093a4:	e8 bb fb ff ff       	call   808f64 <tell_monitor>
        break;
  8093a9:	eb 07                	jmp    8093b2 <tty_do_req+0x7e>
    default:return -1;
  8093ab:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8093b0:	eb 05                	jmp    8093b7 <tty_do_req+0x83>
    }
    return 0;
  8093b2:	b8 00 00 00 00       	mov    eax,0x0
}
  8093b7:	c9                   	leave  
  8093b8:	c3                   	ret    

00000000008093b9 <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  8093b9:	f3 0f 1e fa          	endbr64 
  8093bd:	55                   	push   rbp
  8093be:	48 89 e5             	mov    rbp,rsp
  8093c1:	48 83 ec 10          	sub    rsp,0x10
  8093c5:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  8093c8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8093cb:	83 c0 01             	add    eax,0x1
  8093ce:	0f b7 c0             	movzx  eax,ax
  8093d1:	be 00 00 00 00       	mov    esi,0x0
  8093d6:	89 c7                	mov    edi,eax
  8093d8:	e8 83 b5 ff ff       	call   804960 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  8093dd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8093e0:	83 c0 03             	add    eax,0x3
  8093e3:	0f b7 c0             	movzx  eax,ax
  8093e6:	be 80 00 00 00       	mov    esi,0x80
  8093eb:	89 c7                	mov    edi,eax
  8093ed:	e8 6e b5 ff ff       	call   804960 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  8093f2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8093f5:	0f b7 c0             	movzx  eax,ax
  8093f8:	be 03 00 00 00       	mov    esi,0x3
  8093fd:	89 c7                	mov    edi,eax
  8093ff:	e8 5c b5 ff ff       	call   804960 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  809404:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809407:	83 c0 01             	add    eax,0x1
  80940a:	0f b7 c0             	movzx  eax,ax
  80940d:	be 00 00 00 00       	mov    esi,0x0
  809412:	89 c7                	mov    edi,eax
  809414:	e8 47 b5 ff ff       	call   804960 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  809419:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80941c:	83 c0 03             	add    eax,0x3
  80941f:	0f b7 c0             	movzx  eax,ax
  809422:	be 03 00 00 00       	mov    esi,0x3
  809427:	89 c7                	mov    edi,eax
  809429:	e8 32 b5 ff ff       	call   804960 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  80942e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809431:	83 c0 02             	add    eax,0x2
  809434:	0f b7 c0             	movzx  eax,ax
  809437:	be c7 00 00 00       	mov    esi,0xc7
  80943c:	89 c7                	mov    edi,eax
  80943e:	e8 1d b5 ff ff       	call   804960 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  809443:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809446:	83 c0 04             	add    eax,0x4
  809449:	0f b7 c0             	movzx  eax,ax
  80944c:	be 0b 00 00 00       	mov    esi,0xb
  809451:	89 c7                	mov    edi,eax
  809453:	e8 08 b5 ff ff       	call   804960 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  809458:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80945b:	83 c0 04             	add    eax,0x4
  80945e:	0f b7 c0             	movzx  eax,ax
  809461:	be 1e 00 00 00       	mov    esi,0x1e
  809466:	89 c7                	mov    edi,eax
  809468:	e8 f3 b4 ff ff       	call   804960 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  80946d:	b8 61 00 00 00       	mov    eax,0x61
  809472:	0f b6 d0             	movzx  edx,al
  809475:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809478:	0f b7 c0             	movzx  eax,ax
  80947b:	89 d6                	mov    esi,edx
  80947d:	89 c7                	mov    edi,eax
  80947f:	e8 dc b4 ff ff       	call   804960 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  809484:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809487:	0f b6 c0             	movzx  eax,al
  80948a:	89 c7                	mov    edi,eax
  80948c:	e8 e8 b4 ff ff       	call   804979 <inb>
  809491:	0f b6 d0             	movzx  edx,al
  809494:	b8 61 00 00 00       	mov    eax,0x61
  809499:	0f be c0             	movsx  eax,al
  80949c:	39 c2                	cmp    edx,eax
  80949e:	75 17                	jne    8094b7 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  8094a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8094a3:	83 c0 04             	add    eax,0x4
  8094a6:	0f b7 c0             	movzx  eax,ax
  8094a9:	be 0f 00 00 00       	mov    esi,0xf
  8094ae:	89 c7                	mov    edi,eax
  8094b0:	e8 ab b4 ff ff       	call   804960 <outb>
  8094b5:	eb 01                	jmp    8094b8 <init_com+0xff>
        return;
  8094b7:	90                   	nop
}
  8094b8:	c9                   	leave  
  8094b9:	c3                   	ret    

00000000008094ba <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  8094ba:	f3 0f 1e fa          	endbr64 
  8094be:	55                   	push   rbp
  8094bf:	48 89 e5             	mov    rbp,rsp
  8094c2:	48 83 ec 20          	sub    rsp,0x20
  8094c6:	89 f8                	mov    eax,edi
  8094c8:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8094cb:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  8094cf:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8094d2:	83 c0 05             	add    eax,0x5
  8094d5:	0f b6 c0             	movzx  eax,al
  8094d8:	89 c7                	mov    edi,eax
  8094da:	e8 9a b4 ff ff       	call   804979 <inb>
  8094df:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  8094e2:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  8094e6:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  8094ea:	74 e3                	je     8094cf <com_putchar+0x15>
    outb(com_base, ch);
  8094ec:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  8094f0:	0f b6 d0             	movzx  edx,al
  8094f3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8094f6:	0f b7 c0             	movzx  eax,ax
  8094f9:	89 d6                	mov    esi,edx
  8094fb:	89 c7                	mov    edi,eax
  8094fd:	e8 5e b4 ff ff       	call   804960 <outb>
}
  809502:	90                   	nop
  809503:	c9                   	leave  
  809504:	c3                   	ret    

0000000000809505 <com_puts>:

void com_puts(char* s,int com_port){
  809505:	f3 0f 1e fa          	endbr64 
  809509:	55                   	push   rbp
  80950a:	48 89 e5             	mov    rbp,rsp
  80950d:	48 83 ec 10          	sub    rsp,0x10
  809511:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809515:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  809518:	eb 1d                	jmp    809537 <com_puts+0x32>
        com_putchar(*s,com_port);
  80951a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80951e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809521:	66 98                	cbw    
  809523:	0f b7 c0             	movzx  eax,ax
  809526:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  809529:	89 d6                	mov    esi,edx
  80952b:	89 c7                	mov    edi,eax
  80952d:	e8 88 ff ff ff       	call   8094ba <com_putchar>
    for(;*s;s++){
  809532:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  809537:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80953b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80953e:	84 c0                	test   al,al
  809540:	75 d8                	jne    80951a <com_puts+0x15>
    }
  809542:	90                   	nop
  809543:	90                   	nop
  809544:	c9                   	leave  
  809545:	c3                   	ret    

0000000000809546 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  809546:	f3 0f 1e fa          	endbr64 
  80954a:	55                   	push   rbp
  80954b:	48 89 e5             	mov    rbp,rsp
  80954e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809552:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809556:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  809559:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80955d:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  809560:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809567:	eb 1b                	jmp    809584 <memcpy+0x3e>
        *(dest)=*(src);
  809569:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80956d:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809570:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809574:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  809576:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80957b:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  809580:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809584:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809587:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80958a:	77 dd                	ja     809569 <memcpy+0x23>
    }
}
  80958c:	90                   	nop
  80958d:	90                   	nop
  80958e:	5d                   	pop    rbp
  80958f:	c3                   	ret    

0000000000809590 <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  809590:	f3 0f 1e fa          	endbr64 
  809594:	55                   	push   rbp
  809595:	48 89 e5             	mov    rbp,rsp
  809598:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80959c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8095a0:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  8095a3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8095aa:	eb 3a                	jmp    8095e6 <memcmp+0x56>
    {
        if(*a!=*b)
  8095ac:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095b0:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8095b3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8095b7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095ba:	38 c2                	cmp    dl,al
  8095bc:	74 1a                	je     8095d8 <memcmp+0x48>
            return *a-*b;
  8095be:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095c2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095c5:	0f b6 d0             	movzx  edx,al
  8095c8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8095cc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095cf:	0f b6 c8             	movzx  ecx,al
  8095d2:	89 d0                	mov    eax,edx
  8095d4:	29 c8                	sub    eax,ecx
  8095d6:	eb 1b                	jmp    8095f3 <memcmp+0x63>
        a++;
  8095d8:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  8095dd:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  8095e2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8095e6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8095e9:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  8095ec:	7c be                	jl     8095ac <memcmp+0x1c>
    }
    return 0;
  8095ee:	b8 00 00 00 00       	mov    eax,0x0
}
  8095f3:	5d                   	pop    rbp
  8095f4:	c3                   	ret    

00000000008095f5 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  8095f5:	f3 0f 1e fa          	endbr64 
  8095f9:	55                   	push   rbp
  8095fa:	48 89 e5             	mov    rbp,rsp
  8095fd:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809601:	89 f0                	mov    eax,esi
  809603:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  809606:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  809609:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809610:	eb 16                	jmp    809628 <memset+0x33>
        *(buf++)=value;
  809612:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809616:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80961a:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80961e:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  809622:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  809624:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809628:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80962b:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80962e:	72 e2                	jb     809612 <memset+0x1d>
    }
}
  809630:	90                   	nop
  809631:	90                   	nop
  809632:	5d                   	pop    rbp
  809633:	c3                   	ret    

0000000000809634 <get_mem_size>:

u32 get_mem_size(){
  809634:	f3 0f 1e fa          	endbr64 
  809638:	55                   	push   rbp
  809639:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80963c:	8b 05 e2 79 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc279e2]        # 431024 <mem_end>
}
  809642:	5d                   	pop    rbp
  809643:	c3                   	ret    

0000000000809644 <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  809644:	f3 0f 1e fa          	endbr64 
  809648:	55                   	push   rbp
  809649:	48 89 e5             	mov    rbp,rsp
  80964c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809650:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  809654:	eb 1d                	jmp    809673 <strcpy+0x2f>
        *(dest++)=*(buf++);
  809656:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80965a:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80965e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  809662:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809666:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80966a:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80966e:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  809671:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  809673:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809677:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80967a:	84 c0                	test   al,al
  80967c:	75 d8                	jne    809656 <strcpy+0x12>
    }
    *dest='\0';
  80967e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809682:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  809685:	90                   	nop
  809686:	5d                   	pop    rbp
  809687:	c3                   	ret    

0000000000809688 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  809688:	f3 0f 1e fa          	endbr64 
  80968c:	55                   	push   rbp
  80968d:	48 89 e5             	mov    rbp,rsp
  809690:	48 83 ec 30          	sub    rsp,0x30
  809694:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  809698:	89 f0                	mov    eax,esi
  80969a:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80969d:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  8096a2:	0f 84 9c 00 00 00    	je     809744 <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  8096a8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8096ac:	48 89 c6             	mov    rsi,rax
  8096af:	bf 40 10 43 00       	mov    edi,0x431040
  8096b4:	e8 8b ff ff ff       	call   809644 <strcpy>
        char* ptr=strtokkee;
  8096b9:	48 c7 45 e8 40 10 43 	mov    QWORD PTR [rbp-0x18],0x431040
  8096c0:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  8096c1:	c7 05 75 7b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc27b75],0x0        # 431240 <tokptr>
  8096c8:	00 00 00 
  8096cb:	eb 1c                	jmp    8096e9 <strtok+0x61>
  8096cd:	8b 05 6d 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b6d]        # 431240 <tokptr>
  8096d3:	83 c0 01             	add    eax,0x1
  8096d6:	99                   	cdq    
  8096d7:	c1 ea 17             	shr    edx,0x17
  8096da:	01 d0                	add    eax,edx
  8096dc:	25 ff 01 00 00       	and    eax,0x1ff
  8096e1:	29 d0                	sub    eax,edx
  8096e3:	89 05 57 7b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27b57],eax        # 431240 <tokptr>
  8096e9:	8b 05 51 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b51]        # 431240 <tokptr>
  8096ef:	48 98                	cdqe   
  8096f1:	0f b6 80 40 10 43 00 	movzx  eax,BYTE PTR [rax+0x431040]
  8096f8:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  8096fb:	74 13                	je     809710 <strtok+0x88>
  8096fd:	8b 05 3d 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b3d]        # 431240 <tokptr>
  809703:	48 98                	cdqe   
  809705:	0f b6 80 40 10 43 00 	movzx  eax,BYTE PTR [rax+0x431040]
  80970c:	84 c0                	test   al,al
  80970e:	75 bd                	jne    8096cd <strtok+0x45>
        strtokkee[tokptr]='\0';
  809710:	8b 05 2a 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b2a]        # 431240 <tokptr>
  809716:	48 98                	cdqe   
  809718:	c6 80 40 10 43 00 00 	mov    BYTE PTR [rax+0x431040],0x0
        tokptr=(tokptr+1)%512;
  80971f:	8b 05 1b 7b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27b1b]        # 431240 <tokptr>
  809725:	83 c0 01             	add    eax,0x1
  809728:	99                   	cdq    
  809729:	c1 ea 17             	shr    edx,0x17
  80972c:	01 d0                	add    eax,edx
  80972e:	25 ff 01 00 00       	and    eax,0x1ff
  809733:	29 d0                	sub    eax,edx
  809735:	89 05 05 7b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27b05],eax        # 431240 <tokptr>
        return ptr;
  80973b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80973f:	e9 9e 00 00 00       	jmp    8097e2 <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  809744:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80974b:	8b 05 ef 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27aef]        # 431240 <tokptr>
  809751:	48 98                	cdqe   
  809753:	48 05 40 10 43 00    	add    rax,0x431040
  809759:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80975d:	eb 20                	jmp    80977f <strtok+0xf7>
  80975f:	8b 05 db 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27adb]        # 431240 <tokptr>
  809765:	83 c0 01             	add    eax,0x1
  809768:	99                   	cdq    
  809769:	c1 ea 17             	shr    edx,0x17
  80976c:	01 d0                	add    eax,edx
  80976e:	25 ff 01 00 00       	and    eax,0x1ff
  809773:	29 d0                	sub    eax,edx
  809775:	89 05 c5 7a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27ac5],eax        # 431240 <tokptr>
  80977b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80977f:	8b 05 bb 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27abb]        # 431240 <tokptr>
  809785:	48 98                	cdqe   
  809787:	0f b6 80 40 10 43 00 	movzx  eax,BYTE PTR [rax+0x431040]
  80978e:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  809791:	74 13                	je     8097a6 <strtok+0x11e>
  809793:	8b 05 a7 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27aa7]        # 431240 <tokptr>
  809799:	48 98                	cdqe   
  80979b:	0f b6 80 40 10 43 00 	movzx  eax,BYTE PTR [rax+0x431040]
  8097a2:	84 c0                	test   al,al
  8097a4:	75 b9                	jne    80975f <strtok+0xd7>
    strtokkee[tokptr]='\0';
  8097a6:	8b 05 94 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27a94]        # 431240 <tokptr>
  8097ac:	48 98                	cdqe   
  8097ae:	c6 80 40 10 43 00 00 	mov    BYTE PTR [rax+0x431040],0x0
    tokptr=(tokptr+1)%512;
  8097b5:	8b 05 85 7a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc27a85]        # 431240 <tokptr>
  8097bb:	83 c0 01             	add    eax,0x1
  8097be:	99                   	cdq    
  8097bf:	c1 ea 17             	shr    edx,0x17
  8097c2:	01 d0                	add    eax,edx
  8097c4:	25 ff 01 00 00       	and    eax,0x1ff
  8097c9:	29 d0                	sub    eax,edx
  8097cb:	89 05 6f 7a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc27a6f],eax        # 431240 <tokptr>
    if(c)
  8097d1:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8097d5:	74 06                	je     8097dd <strtok+0x155>
        return ptr;
  8097d7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8097db:	eb 05                	jmp    8097e2 <strtok+0x15a>
    else
        return (void*)0;
  8097dd:	b8 00 00 00 00       	mov    eax,0x0
}
  8097e2:	c9                   	leave  
  8097e3:	c3                   	ret    

00000000008097e4 <strcmp>:
int strcmp(char *s1,char *s2)
{
  8097e4:	f3 0f 1e fa          	endbr64 
  8097e8:	55                   	push   rbp
  8097e9:	48 89 e5             	mov    rbp,rsp
  8097ec:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8097f0:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  8097f4:	eb 3c                	jmp    809832 <strcmp+0x4e>
		if(*s1>*s2)
  8097f6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097fa:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8097fd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809801:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809804:	38 c2                	cmp    dl,al
  809806:	7e 07                	jle    80980f <strcmp+0x2b>
			return 1;
  809808:	b8 01 00 00 00       	mov    eax,0x1
  80980d:	eb 52                	jmp    809861 <strcmp+0x7d>
		else if(*s1<*s2)
  80980f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809813:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809816:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80981a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80981d:	38 c2                	cmp    dl,al
  80981f:	7d 07                	jge    809828 <strcmp+0x44>
			return -1;
  809821:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809826:	eb 39                	jmp    809861 <strcmp+0x7d>
		s1++;
  809828:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80982d:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  809832:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809836:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809839:	84 c0                	test   al,al
  80983b:	74 0b                	je     809848 <strcmp+0x64>
  80983d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809841:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809844:	84 c0                	test   al,al
  809846:	75 ae                	jne    8097f6 <strcmp+0x12>
	}
	if(*s1==*s2)
  809848:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80984c:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80984f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809853:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809856:	38 c2                	cmp    dl,al
  809858:	75 07                	jne    809861 <strcmp+0x7d>
		return 0;
  80985a:	b8 00 00 00 00       	mov    eax,0x0
  80985f:	eb 00                	jmp    809861 <strcmp+0x7d>
}
  809861:	5d                   	pop    rbp
  809862:	c3                   	ret    

0000000000809863 <strlen>:

int strlen(char *str)
{
  809863:	f3 0f 1e fa          	endbr64 
  809867:	55                   	push   rbp
  809868:	48 89 e5             	mov    rbp,rsp
  80986b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80986f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  809876:	eb 09                	jmp    809881 <strlen+0x1e>
  809878:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80987d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809881:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809885:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809888:	84 c0                	test   al,al
  80988a:	75 ec                	jne    809878 <strlen+0x15>
    return l;
  80988c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80988f:	5d                   	pop    rbp
  809890:	c3                   	ret    

0000000000809891 <sprintf>:

void sprintf(char *dist, char *str,...)
{
  809891:	f3 0f 1e fa          	endbr64 
  809895:	55                   	push   rbp
  809896:	48 89 e5             	mov    rbp,rsp
  809899:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  8098a0:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  8098a7:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  8098ae:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  8098b5:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  8098bc:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  8098c3:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  8098ca:	84 c0                	test   al,al
  8098cc:	74 20                	je     8098ee <sprintf+0x5d>
  8098ce:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  8098d2:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  8098d6:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  8098da:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  8098de:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  8098e2:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  8098e6:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  8098ea:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  8098ee:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  8098f5:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  8098fc:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809903:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80990a:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  809911:	00 00 00 
    while (*pstr!='\n')
  809914:	eb 39                	jmp    80994f <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  809916:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80991d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809920:	3c 25                	cmp    al,0x25
  809922:	75 15                	jne    809939 <sprintf+0xa8>
  809924:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80992b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80992e:	3c 25                	cmp    al,0x25
  809930:	74 07                	je     809939 <sprintf+0xa8>
            argnum++;
  809932:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  809939:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809940:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  809947:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80994e:	01 
    while (*pstr!='\n')
  80994f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809956:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809959:	3c 0a                	cmp    al,0xa
  80995b:	75 b9                	jne    809916 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80995d:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  809964:	00 00 00 
  809967:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80996e:	00 00 00 
  809971:	48 8d 45 10          	lea    rax,[rbp+0x10]
  809975:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80997c:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  809983:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80998a:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809991:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  809998:	e9 e2 01 00 00       	jmp    809b7f <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80999d:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8099a4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099a7:	3c 25                	cmp    al,0x25
  8099a9:	0f 85 aa 01 00 00    	jne    809b59 <sprintf+0x2c8>
  8099af:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8099b6:	48 83 c0 01          	add    rax,0x1
  8099ba:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099bd:	84 c0                	test   al,al
  8099bf:	0f 84 94 01 00 00    	je     809b59 <sprintf+0x2c8>
            pstr++;
  8099c5:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  8099cc:	01 
            if(*pstr=='x'){
  8099cd:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8099d4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8099d7:	3c 78                	cmp    al,0x78
  8099d9:	75 64                	jne    809a3f <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  8099db:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  8099e1:	83 f8 2f             	cmp    eax,0x2f
  8099e4:	77 23                	ja     809a09 <sprintf+0x178>
  8099e6:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8099ed:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  8099f3:	89 d2                	mov    edx,edx
  8099f5:	48 01 d0             	add    rax,rdx
  8099f8:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  8099fe:	83 c2 08             	add    edx,0x8
  809a01:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809a07:	eb 12                	jmp    809a1b <sprintf+0x18a>
  809a09:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809a10:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809a14:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809a1b:	8b 00                	mov    eax,DWORD PTR [rax]
  809a1d:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  809a23:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  809a29:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809a30:	89 d6                	mov    esi,edx
  809a32:	48 89 c7             	mov    rdi,rax
  809a35:	e8 4e 02 00 00       	call   809c88 <sprint_hex>
            if(*pstr=='x'){
  809a3a:	e9 38 01 00 00       	jmp    809b77 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  809a3f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809a46:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a49:	3c 73                	cmp    al,0x73
  809a4b:	75 68                	jne    809ab5 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  809a4d:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809a53:	83 f8 2f             	cmp    eax,0x2f
  809a56:	77 23                	ja     809a7b <sprintf+0x1ea>
  809a58:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809a5f:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809a65:	89 d2                	mov    edx,edx
  809a67:	48 01 d0             	add    rax,rdx
  809a6a:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809a70:	83 c2 08             	add    edx,0x8
  809a73:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809a79:	eb 12                	jmp    809a8d <sprintf+0x1fc>
  809a7b:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809a82:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809a86:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809a8d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809a90:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  809a97:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  809a9e:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809aa5:	48 89 d6             	mov    rsi,rdx
  809aa8:	48 89 c7             	mov    rdi,rax
  809aab:	e8 5a 02 00 00       	call   809d0a <sprintn>
            if(*pstr=='x'){
  809ab0:	e9 c2 00 00 00       	jmp    809b77 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  809ab5:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809abc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809abf:	3c 64                	cmp    al,0x64
  809ac1:	75 66                	jne    809b29 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  809ac3:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809ac9:	83 f8 2f             	cmp    eax,0x2f
  809acc:	77 23                	ja     809af1 <sprintf+0x260>
  809ace:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809ad5:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809adb:	89 d2                	mov    edx,edx
  809add:	48 01 d0             	add    rax,rdx
  809ae0:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809ae6:	83 c2 08             	add    edx,0x8
  809ae9:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809aef:	eb 12                	jmp    809b03 <sprintf+0x272>
  809af1:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809af8:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809afc:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809b03:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809b06:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  809b0d:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  809b14:	89 c2                	mov    edx,eax
  809b16:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809b1d:	89 d6                	mov    esi,edx
  809b1f:	48 89 c7             	mov    rdi,rax
  809b22:	e8 ad 00 00 00       	call   809bd4 <sprint_decimal>
            if(*pstr=='x'){
  809b27:	eb 4e                	jmp    809b77 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  809b29:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809b30:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b33:	3c 63                	cmp    al,0x63
  809b35:	75 02                	jne    809b39 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  809b37:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  809b39:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809b40:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b43:	0f be d0             	movsx  edx,al
  809b46:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809b4d:	89 d6                	mov    esi,edx
  809b4f:	48 89 c7             	mov    rdi,rax
  809b52:	e8 3e 00 00 00       	call   809b95 <sprintchar>
            if(*pstr=='x'){
  809b57:	eb 1e                	jmp    809b77 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  809b59:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809b60:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b63:	0f be d0             	movsx  edx,al
  809b66:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809b6d:	89 d6                	mov    esi,edx
  809b6f:	48 89 c7             	mov    rdi,rax
  809b72:	e8 1e 00 00 00       	call   809b95 <sprintchar>
    for(;*pstr!='\0';pstr++){
  809b77:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  809b7e:	01 
  809b7f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809b86:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b89:	84 c0                	test   al,al
  809b8b:	0f 85 0c fe ff ff    	jne    80999d <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  809b91:	90                   	nop
  809b92:	90                   	nop
  809b93:	c9                   	leave  
  809b94:	c3                   	ret    

0000000000809b95 <sprintchar>:
void sprintchar(char *dist,char c)
{
  809b95:	f3 0f 1e fa          	endbr64 
  809b99:	55                   	push   rbp
  809b9a:	48 89 e5             	mov    rbp,rsp
  809b9d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809ba1:	89 f0                	mov    eax,esi
  809ba3:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  809ba6:	eb 05                	jmp    809bad <sprintchar+0x18>
        dist++;
  809ba8:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  809bad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809bb1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809bb4:	84 c0                	test   al,al
  809bb6:	75 f0                	jne    809ba8 <sprintchar+0x13>
    *dist++=c;
  809bb8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809bbc:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809bc0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809bc4:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  809bc8:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  809bca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809bce:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  809bd1:	90                   	nop
  809bd2:	5d                   	pop    rbp
  809bd3:	c3                   	ret    

0000000000809bd4 <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  809bd4:	f3 0f 1e fa          	endbr64 
  809bd8:	55                   	push   rbp
  809bd9:	48 89 e5             	mov    rbp,rsp
  809bdc:	48 83 ec 30          	sub    rsp,0x30
  809be0:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  809be4:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  809be7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  809bee:	eb 65                	jmp    809c55 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  809bf0:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  809bf3:	48 63 c2             	movsxd rax,edx
  809bf6:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  809bfd:	48 c1 e8 20          	shr    rax,0x20
  809c01:	c1 f8 02             	sar    eax,0x2
  809c04:	89 d6                	mov    esi,edx
  809c06:	c1 fe 1f             	sar    esi,0x1f
  809c09:	29 f0                	sub    eax,esi
  809c0b:	89 c1                	mov    ecx,eax
  809c0d:	89 c8                	mov    eax,ecx
  809c0f:	c1 e0 02             	shl    eax,0x2
  809c12:	01 c8                	add    eax,ecx
  809c14:	01 c0                	add    eax,eax
  809c16:	89 d1                	mov    ecx,edx
  809c18:	29 c1                	sub    ecx,eax
  809c1a:	89 c8                	mov    eax,ecx
  809c1c:	83 c0 30             	add    eax,0x30
  809c1f:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  809c22:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809c25:	8d 50 01             	lea    edx,[rax+0x1]
  809c28:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  809c2b:	48 98                	cdqe   
  809c2d:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  809c31:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  809c35:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  809c38:	48 63 d0             	movsxd rdx,eax
  809c3b:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  809c42:	48 c1 ea 20          	shr    rdx,0x20
  809c46:	c1 fa 02             	sar    edx,0x2
  809c49:	c1 f8 1f             	sar    eax,0x1f
  809c4c:	89 c1                	mov    ecx,eax
  809c4e:	89 d0                	mov    eax,edx
  809c50:	29 c8                	sub    eax,ecx
  809c52:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  809c55:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809c58:	83 f8 0f             	cmp    eax,0xf
  809c5b:	76 93                	jbe    809bf0 <sprint_decimal+0x1c>
    }
    while(p>0)
  809c5d:	eb 1f                	jmp    809c7e <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  809c5f:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  809c63:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809c66:	48 98                	cdqe   
  809c68:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  809c6d:	0f be d0             	movsx  edx,al
  809c70:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809c74:	89 d6                	mov    esi,edx
  809c76:	48 89 c7             	mov    rdi,rax
  809c79:	e8 17 ff ff ff       	call   809b95 <sprintchar>
    while(p>0)
  809c7e:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809c82:	7f db                	jg     809c5f <sprint_decimal+0x8b>
    }
}
  809c84:	90                   	nop
  809c85:	90                   	nop
  809c86:	c9                   	leave  
  809c87:	c3                   	ret    

0000000000809c88 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  809c88:	f3 0f 1e fa          	endbr64 
  809c8c:	55                   	push   rbp
  809c8d:	48 89 e5             	mov    rbp,rsp
  809c90:	48 83 ec 20          	sub    rsp,0x20
  809c94:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809c98:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  809c9b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  809ca2:	eb 35                	jmp    809cd9 <sprint_hex+0x51>
        unsigned char a=c%16;
  809ca4:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809ca7:	83 e0 0f             	and    eax,0xf
  809caa:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  809cad:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  809cb1:	76 06                	jbe    809cb9 <sprint_hex+0x31>
  809cb3:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  809cb7:	eb 04                	jmp    809cbd <sprint_hex+0x35>
        else a+='0';
  809cb9:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  809cbd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809cc0:	8d 50 01             	lea    edx,[rax+0x1]
  809cc3:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  809cc6:	48 98                	cdqe   
  809cc8:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  809ccc:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  809cd0:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809cd3:	c1 e8 04             	shr    eax,0x4
  809cd6:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  809cd9:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  809cdd:	7e c5                	jle    809ca4 <sprint_hex+0x1c>
    }
    while(p>0)
  809cdf:	eb 1f                	jmp    809d00 <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  809ce1:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  809ce5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809ce8:	48 98                	cdqe   
  809cea:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  809cef:	0f be d0             	movsx  edx,al
  809cf2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809cf6:	89 d6                	mov    esi,edx
  809cf8:	48 89 c7             	mov    rdi,rax
  809cfb:	e8 95 fe ff ff       	call   809b95 <sprintchar>
    while(p>0)
  809d00:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809d04:	7f db                	jg     809ce1 <sprint_hex+0x59>
    }
}
  809d06:	90                   	nop
  809d07:	90                   	nop
  809d08:	c9                   	leave  
  809d09:	c3                   	ret    

0000000000809d0a <sprintn>:
void sprintn(char *dist,char *str)
{
  809d0a:	f3 0f 1e fa          	endbr64 
  809d0e:	55                   	push   rbp
  809d0f:	48 89 e5             	mov    rbp,rsp
  809d12:	48 83 ec 10          	sub    rsp,0x10
  809d16:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809d1a:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  809d1e:	eb 20                	jmp    809d40 <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  809d20:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d24:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809d28:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  809d2c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d2f:	0f be d0             	movsx  edx,al
  809d32:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d36:	89 d6                	mov    esi,edx
  809d38:	48 89 c7             	mov    rdi,rax
  809d3b:	e8 55 fe ff ff       	call   809b95 <sprintchar>
    while(*str!='\0')
  809d40:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d44:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d47:	84 c0                	test   al,al
  809d49:	75 d5                	jne    809d20 <sprintn+0x16>
    }
  809d4b:	90                   	nop
  809d4c:	90                   	nop
  809d4d:	c9                   	leave  
  809d4e:	c3                   	ret    
  809d4f:	90                   	nop

0000000000809d50 <create_zero>:
  809d50:	e8 32 9c ff ff       	call   803987 <req_proc>
  809d55:	83 f8 ff             	cmp    eax,0xffffffff
  809d58:	74 0c                	je     809d66 <create_zero.retu>
  809d5a:	e8 f4 9c ff ff       	call   803a53 <set_proc>
  809d5f:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  809d63:	83 c4 40             	add    esp,0x40

0000000000809d66 <create_zero.retu>:
  809d66:	c3                   	ret    

0000000000809d67 <fill_desc>:
  809d67:	55                   	push   rbp
  809d68:	48 89 e5             	mov    rbp,rsp
  809d6b:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  809d6f:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  809d73:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  809d77:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  809d7b:	be ba 9e 80 00       	mov    esi,0x809eba
  809d80:	c7 04 25 ba 9e 80 00 	mov    DWORD PTR ds:0x809eba,0x0
  809d87:	00 00 00 00 
  809d8b:	c7 04 25 be 9e 80 00 	mov    DWORD PTR ds:0x809ebe,0x0
  809d92:	00 00 00 00 
  809d96:	66 67 89 0e          	mov    WORD PTR [esi],cx
  809d9a:	c1 e9 10             	shr    ecx,0x10
  809d9d:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  809da2:	c1 ea 10             	shr    edx,0x10
  809da5:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  809da9:	66 c1 ea 08          	shr    dx,0x8
  809dad:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  809db1:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  809db6:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  809dba:	c1 e1 08             	shl    ecx,0x8
  809dbd:	09 cf                	or     edi,ecx
  809dbf:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  809dc3:	8b 14 25 ba 9e 80 00 	mov    edx,DWORD PTR ds:0x809eba
  809dca:	67 89 10             	mov    DWORD PTR [eax],edx
  809dcd:	8b 14 25 be 9e 80 00 	mov    edx,DWORD PTR ds:0x809ebe
  809dd4:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  809dd8:	c9                   	leave  
  809dd9:	c3                   	ret    

0000000000809dda <switch_proc_asm>:
  809dda:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  809de0:	66 89 04 25 f8 9d 80 	mov    WORD PTR ds:0x809df8,ax
  809de7:	00 
  809de8:	c7 04 25 f4 9d 80 00 	mov    DWORD PTR ds:0x809df4,0x0
  809def:	00 00 00 00 

0000000000809df3 <switch_proc_asm.ljmp>:
  809df3:	ea                   	(bad)  
  809df4:	00 00                	add    BYTE PTR [rax],al
  809df6:	00 00                	add    BYTE PTR [rax],al
  809df8:	00 00                	add    BYTE PTR [rax],al
  809dfa:	c3                   	ret    

0000000000809dfb <switch_to>:
  809dfb:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  809e00:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  809e04:	bf 6c 9e 80 00       	mov    edi,0x809e6c
  809e09:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  809e0d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  809e11:	89 c1                	mov    ecx,eax
  809e13:	83 e9 04             	sub    ecx,0x4
  809e16:	67 89 19             	mov    DWORD PTR [ecx],ebx
  809e19:	50                   	push   rax
  809e1a:	89 f5                	mov    ebp,esi
  809e1c:	83 c5 28             	add    ebp,0x28
  809e1f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809e23:	50                   	push   rax
  809e24:	83 c5 04             	add    ebp,0x4
  809e27:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809e2b:	50                   	push   rax
  809e2c:	83 c5 04             	add    ebp,0x4
  809e2f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809e33:	50                   	push   rax
  809e34:	83 c5 04             	add    ebp,0x4
  809e37:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809e3b:	50                   	push   rax
  809e3c:	83 c5 04             	add    ebp,0x4
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
  809e5f:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  809e63:	0f 22 d8             	mov    cr3,rax
  809e66:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  809e6a:	50                   	push   rax
  809e6b:	5c                   	pop    rsp

0000000000809e6c <switch_to.leap>:
  809e6c:	ea                   	(bad)  
  809e6d:	00 00                	add    BYTE PTR [rax],al
  809e6f:	00 00                	add    BYTE PTR [rax],al
  809e71:	08 00                	or     BYTE PTR [rax],al

0000000000809e73 <save_context>:
  809e73:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  809e78:	83 c0 44             	add    eax,0x44
  809e7b:	b9 08 00 00 00       	mov    ecx,0x8
  809e80:	89 e7                	mov    edi,esp

0000000000809e82 <save_context.loops>:
  809e82:	67 8b 17             	mov    edx,DWORD PTR [edi]
  809e85:	67 89 10             	mov    DWORD PTR [eax],edx
  809e88:	83 c7 04             	add    edi,0x4
  809e8b:	83 e8 04             	sub    eax,0x4
  809e8e:	e2 f2                	loop   809e82 <save_context.loops>
  809e90:	5b                   	pop    rbx
  809e91:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  809e96:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  809e9a:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  809e9f:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  809ea3:	c3                   	ret    

0000000000809ea4 <move_to_user_mode>:
  809ea4:	66 b8 20 00          	mov    ax,0x20
  809ea8:	8e d8                	mov    ds,eax
  809eaa:	8e c0                	mov    es,eax
  809eac:	8e e8                	mov    gs,eax
  809eae:	6a 20                	push   0x20
  809eb0:	54                   	push   rsp
  809eb1:	6a 18                	push   0x18
  809eb3:	68 b9 9e 80 00       	push   0x809eb9
  809eb8:	cf                   	iret   

0000000000809eb9 <move_to_user_mode.done>:
  809eb9:	c3                   	ret    

0000000000809eba <desc>:
	...
