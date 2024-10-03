
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
  800194:	b8 5d 11 80 00       	mov    eax,0x80115d
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
  800217:	b8 e7 5b 80 00       	mov    eax,0x805be7
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 d9 00 00 00       	call   80030c <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 20 4a 80 00       	mov    eax,0x804a20
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 bd 00 00 00       	call   80030c <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 f0 6a 80 00       	mov    eax,0x806af0
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 a1 00 00 00       	call   80030c <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 e0 53 80 00       	mov    eax,0x8053e0
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
  800291:	e8 fa 44 00 00       	call   804790 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 eb 44 00 00       	call   804790 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 dc 44 00 00       	call   804790 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 cd 44 00 00       	call   804790 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 be 44 00 00       	call   804790 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 af 44 00 00       	call   804790 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 a0 44 00 00       	call   804790 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 91 44 00 00       	call   804790 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 c1 44 00 00       	call   8047ca <turn_on_int>

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
  800327:	48 8b 15 12 99 00 00 	mov    rdx,QWORD PTR [rip+0x9912]        # 809c40 <idt>
  80032e:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800332:	48 c1 e0 04          	shl    rax,0x4
  800336:	48 01 d0             	add    rax,rdx
  800339:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80033d:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800340:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800344:	48 c1 e8 10          	shr    rax,0x10
  800348:	48 89 c2             	mov    rdx,rax
  80034b:	48 8b 0d ee 98 00 00 	mov    rcx,QWORD PTR [rip+0x98ee]        # 809c40 <idt>
  800352:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800356:	48 c1 e0 04          	shl    rax,0x4
  80035a:	48 01 c8             	add    rax,rcx
  80035d:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  800361:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800365:	48 c1 e8 20          	shr    rax,0x20
  800369:	89 c1                	mov    ecx,eax
  80036b:	48 8b 15 ce 98 00 00 	mov    rdx,QWORD PTR [rip+0x98ce]        # 809c40 <idt>
  800372:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800376:	48 c1 e0 04          	shl    rax,0x4
  80037a:	48 01 c2             	add    rdx,rax
  80037d:	0f b7 c1             	movzx  eax,cx
  800380:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr;
  800383:	48 8b 15 b6 98 00 00 	mov    rdx,QWORD PTR [rip+0x98b6]        # 809c40 <idt>
  80038a:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80038e:	48 c1 e0 04          	shl    rax,0x4
  800392:	48 01 c2             	add    rdx,rax
  800395:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  800399:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
    idt[index].selector=selector;
  80039d:	48 8b 15 9c 98 00 00 	mov    rdx,QWORD PTR [rip+0x989c]        # 809c40 <idt>
  8003a4:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003a8:	48 c1 e0 04          	shl    rax,0x4
  8003ac:	48 01 c2             	add    rdx,rax
  8003af:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003b3:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003b7:	48 8b 15 82 98 00 00 	mov    rdx,QWORD PTR [rip+0x9882]        # 809c40 <idt>
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
  8003e1:	e8 d8 43 00 00       	call   8047be <eoi>
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
  8003fb:	e8 be 43 00 00       	call   8047be <eoi>
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
  800415:	e8 a4 43 00 00       	call   8047be <eoi>
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
  80042f:	e8 8a 43 00 00       	call   8047be <eoi>
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
  800449:	e8 70 43 00 00       	call   8047be <eoi>
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
  800463:	e8 56 43 00 00       	call   8047be <eoi>
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
  80047c:	e8 3d 43 00 00       	call   8047be <eoi>
    report_back_trace_of_err();
  800481:	b8 00 00 00 00       	mov    eax,0x0
  800486:	e8 5f 43 00 00       	call   8047ea <report_back_trace_of_err>
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
  8004a1:	e8 18 43 00 00       	call   8047be <eoi>
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
  8004bb:	e8 fe 42 00 00       	call   8047be <eoi>
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
  8004d4:	e8 e5 42 00 00       	call   8047be <eoi>
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
  8004ed:	e8 cc 42 00 00       	call   8047be <eoi>
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
  800507:	e8 b2 42 00 00       	call   8047be <eoi>
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
  800521:	e8 98 42 00 00       	call   8047be <eoi>
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
  800545:	e8 74 42 00 00       	call   8047be <eoi>
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
  800562:	e8 57 42 00 00       	call   8047be <eoi>
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
  80059b:	48 8b 04 c5 a0 12 81 	mov    rax,QWORD PTR [rax*8+0x8112a0]
  8005a2:	00 
  8005a3:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(b);
  8005a6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005a9:	48 98                	cdqe   
  8005ab:	48 89 c7             	mov    rdi,rax
  8005ae:	e8 28 25 00 00       	call   802adb <reg_device>
  8005b3:	e9 f7 01 00 00       	jmp    8007af <syscall+0x241>
        case 1:return dispose_device(b);
  8005b8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005bb:	89 c7                	mov    edi,eax
  8005bd:	e8 78 2f 00 00       	call   80353a <dispose_device>
  8005c2:	e9 e8 01 00 00       	jmp    8007af <syscall+0x241>
        case 2:return reg_driver(b);
  8005c7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005ca:	48 98                	cdqe   
  8005cc:	48 89 c7             	mov    rdi,rax
  8005cf:	e8 ef 27 00 00       	call   802dc3 <reg_driver>
  8005d4:	e9 d6 01 00 00       	jmp    8007af <syscall+0x241>
        case 3:return dispose_driver(b);
  8005d9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005dc:	48 98                	cdqe   
  8005de:	48 89 c7             	mov    rdi,rax
  8005e1:	e8 f2 2f 00 00       	call   8035d8 <dispose_driver>
  8005e6:	e9 c4 01 00 00       	jmp    8007af <syscall+0x241>
        case 4:return call_drv_func(b,c,d);
  8005eb:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8005ee:	48 98                	cdqe   
  8005f0:	48 89 c2             	mov    rdx,rax
  8005f3:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8005f6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005f9:	89 ce                	mov    esi,ecx
  8005fb:	89 c7                	mov    edi,eax
  8005fd:	e8 e1 2c 00 00       	call   8032e3 <call_drv_func>
  800602:	e9 a8 01 00 00       	jmp    8007af <syscall+0x241>
        case 5:return req_page_at(b,c);
  800607:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80060a:	48 98                	cdqe   
  80060c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80060f:	89 d6                	mov    esi,edx
  800611:	48 89 c7             	mov    rdi,rax
  800614:	e8 98 10 00 00       	call   8016b1 <req_page_at>
  800619:	e9 91 01 00 00       	jmp    8007af <syscall+0x241>
        case 6:return free_page(b);
  80061e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800621:	48 98                	cdqe   
  800623:	48 89 c7             	mov    rdi,rax
  800626:	e8 9a 0e 00 00       	call   8014c5 <free_page>
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
  800648:	e8 70 3d 00 00       	call   8043bd <reg_proc>
  80064d:	e9 5d 01 00 00       	jmp    8007af <syscall+0x241>
        case 8:del_proc(b);
  800652:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800655:	89 c7                	mov    edi,eax
  800657:	e8 6b 3b 00 00       	call   8041c7 <del_proc>
        case 10:chk_vm(b,c);
  80065c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80065f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800662:	89 d6                	mov    esi,edx
  800664:	89 c7                	mov    edi,eax
  800666:	e8 1f 11 00 00       	call   80178a <chk_vm>
        case 11:return sys_open(b,c);
  80066b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80066e:	48 98                	cdqe   
  800670:	48 89 c2             	mov    rdx,rax
  800673:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800676:	89 c6                	mov    esi,eax
  800678:	48 89 d7             	mov    rdi,rdx
  80067b:	e8 ee 14 00 00       	call   801b6e <sys_open>
  800680:	e9 2a 01 00 00       	jmp    8007af <syscall+0x241>
        case 12:return sys_close(b);
  800685:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800688:	89 c7                	mov    edi,eax
  80068a:	e8 a8 19 00 00       	call   802037 <sys_close>
  80068f:	e9 1b 01 00 00       	jmp    8007af <syscall+0x241>
        case 13:return sys_read(b,c,d);
  800694:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800697:	48 98                	cdqe   
  800699:	48 89 c1             	mov    rcx,rax
  80069c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80069f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006a2:	48 89 ce             	mov    rsi,rcx
  8006a5:	89 c7                	mov    edi,eax
  8006a7:	e8 a1 1a 00 00       	call   80214d <sys_read>
  8006ac:	e9 fe 00 00 00       	jmp    8007af <syscall+0x241>
        case 14:return sys_write(b,c,d);
  8006b1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006b4:	48 98                	cdqe   
  8006b6:	48 89 c1             	mov    rcx,rax
  8006b9:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006bc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006bf:	48 89 ce             	mov    rsi,rcx
  8006c2:	89 c7                	mov    edi,eax
  8006c4:	e8 f3 19 00 00       	call   8020bc <sys_write>
  8006c9:	e9 e1 00 00 00       	jmp    8007af <syscall+0x241>
        case 15:return sys_seek(b,c,d);
  8006ce:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006d1:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006d4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006d7:	89 ce                	mov    esi,ecx
  8006d9:	89 c7                	mov    edi,eax
  8006db:	e8 fe 1a 00 00       	call   8021de <sys_seek>
  8006e0:	e9 ca 00 00 00       	jmp    8007af <syscall+0x241>
        case 16:return sys_tell(b);
  8006e5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006e8:	89 c7                	mov    edi,eax
  8006ea:	e8 36 1b 00 00       	call   802225 <sys_tell>
  8006ef:	e9 bb 00 00 00       	jmp    8007af <syscall+0x241>
        case 17:return reg_vol(b,c,d);
  8006f4:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006f7:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006fa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006fd:	89 ce                	mov    esi,ecx
  8006ff:	89 c7                	mov    edi,eax
  800701:	b8 00 00 00 00       	mov    eax,0x0
  800706:	e8 58 13 00 00       	call   801a63 <reg_vol>
  80070b:	e9 9f 00 00 00       	jmp    8007af <syscall+0x241>
        case 18:return free_vol(b);
  800710:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800713:	89 c7                	mov    edi,eax
  800715:	b8 00 00 00 00       	mov    eax,0x0
  80071a:	e8 28 13 00 00       	call   801a47 <free_vol>
  80071f:	e9 8b 00 00 00       	jmp    8007af <syscall+0x241>
        case 19:return execute(b);
  800724:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800727:	48 98                	cdqe   
  800729:	48 89 c7             	mov    rdi,rax
  80072c:	e8 fc 42 00 00       	call   804a2d <execute>
  800731:	eb 7c                	jmp    8007af <syscall+0x241>
        case SYSCALL_EXIT:return sys_exit(b);
  800733:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800736:	89 c7                	mov    edi,eax
  800738:	e8 5f 3c 00 00       	call   80439c <sys_exit>
  80073d:	eb 70                	jmp    8007af <syscall+0x241>
        case SYSCALL_CALL:return exec_call(b);
  80073f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800742:	48 98                	cdqe   
  800744:	48 89 c7             	mov    rdi,rax
  800747:	e8 dc 43 00 00       	call   804b28 <exec_call>
  80074c:	eb 61                	jmp    8007af <syscall+0x241>
        case SYSCALL_MKFIFO:return sys_mkfifo(b);
  80074e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800751:	89 c7                	mov    edi,eax
  800753:	e8 90 11 00 00       	call   8018e8 <sys_mkfifo>
  800758:	eb 55                	jmp    8007af <syscall+0x241>
        case SYSCALL_MALLOC:return sys_malloc(b);
  80075a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80075d:	89 c7                	mov    edi,eax
  80075f:	e8 c8 3d 00 00       	call   80452c <sys_malloc>
  800764:	eb 49                	jmp    8007af <syscall+0x241>
        case SYSCALL_FREE:return sys_free(b);
  800766:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800769:	89 c7                	mov    edi,eax
  80076b:	e8 4a 3f 00 00       	call   8046ba <sys_free>
  800770:	eb 3d                	jmp    8007af <syscall+0x241>
        case SYSCALL_KB_READC:return sys_getkbc();
  800772:	b8 00 00 00 00       	mov    eax,0x0
  800777:	e8 7f 55 00 00       	call   805cfb <sys_getkbc>
  80077c:	0f be c0             	movsx  eax,al
  80077f:	eb 2e                	jmp    8007af <syscall+0x241>
        case SYSCALL_FIND_DEV:return sys_find_dev(b);
  800781:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800784:	48 98                	cdqe   
  800786:	48 89 c7             	mov    rdi,rax
  800789:	e8 85 27 00 00       	call   802f13 <sys_find_dev>
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
  8007a8:	e8 f8 27 00 00       	call   802fa5 <sys_operate_dev>
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
  8007d9:	e8 35 03 00 00       	call   800b13 <init_logging>
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
  80080a:	48 8b 04 c5 08 16 81 	mov    rax,QWORD PTR [rax*8+0x811608]
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
  80081e:	e8 a2 07 00 00       	call   800fc5 <set_high_mem_base>
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
  800854:	e8 83 07 00 00       	call   800fdc <set_mem_area>
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
  8008ae:	e8 f2 4c 00 00       	call   8055a5 <set_framebuffer>
  8008b3:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  8008b7:	b8 00 00 00 00       	mov    eax,0x0
  8008bc:	e8 2f 4b 00 00       	call   8053f0 <init_framebuffer>
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
  800a85:	e8 25 4a 00 00       	call   8054af <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800a8a:	bf c8 15 81 00       	mov    edi,0x8115c8
  800a8f:	e8 cd 4e 00 00       	call   805961 <print>
    init_int();
  800a94:	b8 00 00 00 00       	mov    eax,0x0
  800a99:	e8 62 f5 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800a9e:	bf e5 15 81 00       	mov    edi,0x8115e5
  800aa3:	e8 b9 4e 00 00       	call   805961 <print>
    init_memory();
  800aa8:	b8 00 00 00 00       	mov    eax,0x0
  800aad:	e8 da 07 00 00       	call   80128c <init_memory>
    init_com(PORT_COM1);
  800ab2:	bf f8 03 00 00       	mov    edi,0x3f8
  800ab7:	e8 6d 86 00 00       	call   809129 <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800abc:	be f8 03 00 00       	mov    esi,0x3f8
  800ac1:	bf f2 15 81 00       	mov    edi,0x8115f2
  800ac6:	e8 aa 87 00 00       	call   809275 <com_puts>
	init_paging();
  800acb:	b8 00 00 00 00       	mov    eax,0x0
  800ad0:	e8 e5 04 00 00       	call   800fba <init_paging>
 	init_gdt();
  800ad5:	b8 00 00 00 00       	mov    eax,0x0
  800ada:	e8 2f 3d 00 00       	call   80480e <init_gdt>
    init_drvdev_man();
  800adf:	b8 00 00 00 00       	mov    eax,0x0
  800ae4:	e8 d8 1f 00 00       	call   802ac1 <init_drvdev_man>
    init_proc();
  800ae9:	b8 00 00 00 00       	mov    eax,0x0
  800aee:	e8 b9 2e 00 00       	call   8039ac <init_proc>
    //自带驱动
    //init_tty();
    init_kb();
  800af3:	b8 00 00 00 00       	mov    eax,0x0
  800af8:	e8 cb 50 00 00       	call   805bc8 <init_kb>
    init_disk();
  800afd:	b8 00 00 00 00       	mov    eax,0x0
  800b02:	e8 45 52 00 00       	call   805d4c <init_disk>

//	init_vfs();
    //init_fat16();
	manage_proc_lock=0;
  800b07:	c7 05 37 91 00 00 00 	mov    DWORD PTR [rip+0x9137],0x0        # 809c48 <manage_proc_lock>
  800b0e:	00 00 00 
    while (1);
  800b11:	eb fe                	jmp    800b11 <main+0x360>

0000000000800b13 <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800b13:	f3 0f 1e fa          	endbr64 
  800b17:	55                   	push   rbp
  800b18:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800b1b:	48 c7 05 da f4 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff4da],0xb8000        # 400000 <video>
  800b22:	00 80 0b 00 
    xpos=0;
  800b26:	c7 05 d8 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff4d8],0x0        # 400008 <xpos>
  800b2d:	00 00 00 
    ypos=0;
  800b30:	c7 05 d2 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff4d2],0x0        # 40000c <ypos>
  800b37:	00 00 00 
}
  800b3a:	90                   	nop
  800b3b:	5d                   	pop    rbp
  800b3c:	c3                   	ret    

0000000000800b3d <itoa>:

static void itoa (char *buf, int base, int d)
{
  800b3d:	f3 0f 1e fa          	endbr64 
  800b41:	55                   	push   rbp
  800b42:	48 89 e5             	mov    rbp,rsp
  800b45:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800b49:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800b4c:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800b4f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800b53:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800b57:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800b5a:	48 98                	cdqe   
  800b5c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800b60:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800b67:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800b6b:	75 27                	jne    800b94 <itoa+0x57>
  800b6d:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800b71:	79 21                	jns    800b94 <itoa+0x57>
    {
        *p++ = '-';
  800b73:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800b77:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800b7b:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800b7f:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800b82:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800b87:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800b8a:	f7 d8                	neg    eax
  800b8c:	48 98                	cdqe   
  800b8e:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800b92:	eb 0d                	jmp    800ba1 <itoa+0x64>
    }
    else if (base == 'x')
  800b94:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800b98:	75 07                	jne    800ba1 <itoa+0x64>
        divisor = 16;
  800b9a:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800ba1:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800ba4:	48 63 c8             	movsxd rcx,eax
  800ba7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800bab:	ba 00 00 00 00       	mov    edx,0x0
  800bb0:	48 f7 f1             	div    rcx
  800bb3:	48 89 d0             	mov    rax,rdx
  800bb6:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800bb9:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800bbd:	7f 0a                	jg     800bc9 <itoa+0x8c>
  800bbf:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800bc2:	83 c0 30             	add    eax,0x30
  800bc5:	89 c1                	mov    ecx,eax
  800bc7:	eb 08                	jmp    800bd1 <itoa+0x94>
  800bc9:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800bcc:	83 c0 57             	add    eax,0x57
  800bcf:	89 c1                	mov    ecx,eax
  800bd1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800bd5:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800bd9:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800bdd:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800bdf:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800be2:	48 63 f0             	movsxd rsi,eax
  800be5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800be9:	ba 00 00 00 00       	mov    edx,0x0
  800bee:	48 f7 f6             	div    rsi
  800bf1:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800bf5:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800bfa:	75 a5                	jne    800ba1 <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800bfc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c00:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800c03:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800c07:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800c0b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c0f:	48 83 e8 01          	sub    rax,0x1
  800c13:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800c17:	eb 2b                	jmp    800c44 <itoa+0x107>
    {
        char tmp = *p1;
  800c19:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c1d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800c20:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800c23:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c27:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800c2a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c2e:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800c30:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c34:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800c38:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800c3a:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800c3f:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800c44:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c48:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800c4c:	72 cb                	jb     800c19 <itoa+0xdc>
    }
}
  800c4e:	90                   	nop
  800c4f:	90                   	nop
  800c50:	5d                   	pop    rbp
  800c51:	c3                   	ret    

0000000000800c52 <putchar>:
 
/* 在屏幕上输出字符 C 。 */
static void putchar (char c)
{
  800c52:	f3 0f 1e fa          	endbr64 
  800c56:	55                   	push   rbp
  800c57:	48 89 e5             	mov    rbp,rsp
  800c5a:	48 83 ec 20          	sub    rsp,0x20
  800c5e:	89 f8                	mov    eax,edi
  800c60:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    char s[2]={c,'\0'};
  800c63:	0f b6 45 ec          	movzx  eax,BYTE PTR [rbp-0x14]
  800c67:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  800c6a:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
    print(s);
  800c6e:	48 8d 45 fe          	lea    rax,[rbp-0x2]
  800c72:	48 89 c7             	mov    rdi,rax
  800c75:	e8 e7 4c 00 00       	call   805961 <print>
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800c7a:	c9                   	leave  
  800c7b:	c3                   	ret    

0000000000800c7c <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800c7c:	f3 0f 1e fa          	endbr64 
  800c80:	55                   	push   rbp
  800c81:	48 89 e5             	mov    rbp,rsp
  800c84:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800c8b:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800c92:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800c99:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800ca0:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800ca7:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800cae:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800cb5:	84 c0                	test   al,al
  800cb7:	74 20                	je     800cd9 <printf+0x5d>
  800cb9:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800cbd:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800cc1:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800cc5:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800cc9:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800ccd:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800cd1:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800cd5:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800cd9:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800ce0:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char c;
    char buf[20];
 
    arg++;
  800ce7:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800cee:	08 
 
    while ((c = *format++) != 0)
  800cef:	e9 29 01 00 00       	jmp    800e1d <printf+0x1a1>
    {
        if (c != '%')
  800cf4:	80 bd 3f ff ff ff 25 	cmp    BYTE PTR [rbp-0xc1],0x25
  800cfb:	74 13                	je     800d10 <printf+0x94>
            putchar (c);
  800cfd:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800d04:	89 c7                	mov    edi,eax
  800d06:	e8 47 ff ff ff       	call   800c52 <putchar>
  800d0b:	e9 0d 01 00 00       	jmp    800e1d <printf+0x1a1>
        else
        {
            char *p;
 
            c = *format++;
  800d10:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800d17:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800d1b:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800d22:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800d25:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
            switch (c)
  800d2b:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800d32:	83 f8 78             	cmp    eax,0x78
  800d35:	74 26                	je     800d5d <printf+0xe1>
  800d37:	83 f8 78             	cmp    eax,0x78
  800d3a:	0f 8f be 00 00 00    	jg     800dfe <printf+0x182>
  800d40:	83 f8 75             	cmp    eax,0x75
  800d43:	74 18                	je     800d5d <printf+0xe1>
  800d45:	83 f8 75             	cmp    eax,0x75
  800d48:	0f 8f b0 00 00 00    	jg     800dfe <printf+0x182>
  800d4e:	83 f8 64             	cmp    eax,0x64
  800d51:	74 0a                	je     800d5d <printf+0xe1>
  800d53:	83 f8 73             	cmp    eax,0x73
  800d56:	74 41                	je     800d99 <printf+0x11d>
  800d58:	e9 a1 00 00 00       	jmp    800dfe <printf+0x182>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800d5d:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800d64:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800d68:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800d6f:	8b 10                	mov    edx,DWORD PTR [rax]
  800d71:	0f be 8d 3f ff ff ff 	movsx  ecx,BYTE PTR [rbp-0xc1]
  800d78:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800d7f:	89 ce                	mov    esi,ecx
  800d81:	48 89 c7             	mov    rdi,rax
  800d84:	e8 b4 fd ff ff       	call   800b3d <itoa>
                p = buf;
  800d89:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800d90:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800d97:	eb 34                	jmp    800dcd <printf+0x151>
                break;
 
            case 's':
                p = *arg++;
  800d99:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800da0:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800da4:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800dab:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800dae:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800db5:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800dbc:	00 
  800dbd:	75 0d                	jne    800dcc <printf+0x150>
                    p = "(null)";
  800dbf:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x811650
  800dc6:	50 16 81 00 
  800dca:	eb 22                	jmp    800dee <printf+0x172>
 
string:
  800dcc:	90                   	nop
                while (*p)
  800dcd:	eb 1f                	jmp    800dee <printf+0x172>
                    putchar (*p++);
  800dcf:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800dd6:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800dda:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800de1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800de4:	0f be c0             	movsx  eax,al
  800de7:	89 c7                	mov    edi,eax
  800de9:	e8 64 fe ff ff       	call   800c52 <putchar>
                while (*p)
  800dee:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800df5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800df8:	84 c0                	test   al,al
  800dfa:	75 d3                	jne    800dcf <printf+0x153>
                break;
  800dfc:	eb 1f                	jmp    800e1d <printf+0x1a1>
 
            default:
                putchar (*((int *) arg++));
  800dfe:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e05:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e09:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e10:	8b 00                	mov    eax,DWORD PTR [rax]
  800e12:	0f be c0             	movsx  eax,al
  800e15:	89 c7                	mov    edi,eax
  800e17:	e8 36 fe ff ff       	call   800c52 <putchar>
                break;
  800e1c:	90                   	nop
    while ((c = *format++) != 0)
  800e1d:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800e24:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e28:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800e2f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e32:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
  800e38:	80 bd 3f ff ff ff 00 	cmp    BYTE PTR [rbp-0xc1],0x0
  800e3f:	0f 85 af fe ff ff    	jne    800cf4 <printf+0x78>
            }
        }
    }
}
  800e45:	90                   	nop
  800e46:	90                   	nop
  800e47:	c9                   	leave  
  800e48:	c3                   	ret    

0000000000800e49 <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800e49:	f3 0f 1e fa          	endbr64 
  800e4d:	55                   	push   rbp
  800e4e:	48 89 e5             	mov    rbp,rsp
  800e51:	48 83 ec 40          	sub    rsp,0x40
  800e55:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800e59:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800e5d:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800e60:	48 8b 15 f9 8d 00 00 	mov    rdx,QWORD PTR [rip+0x8df9]        # 809c60 <pml4>
  800e67:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800e6b:	48 c1 e8 27          	shr    rax,0x27
  800e6f:	48 c1 e0 03          	shl    rax,0x3
  800e73:	48 01 d0             	add    rax,rdx
  800e76:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800e79:	b0 00                	mov    al,0x0
  800e7b:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800e7f:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800e86:	00 00 00 
  800e89:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800e8d:	48 c1 e8 1e          	shr    rax,0x1e
  800e91:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800e94:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800e97:	48 98                	cdqe   
  800e99:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800ea0:	00 
  800ea1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800ea5:	48 01 d0             	add    rax,rdx
  800ea8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800eab:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800eaf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800eb3:	83 e0 01             	and    eax,0x1
  800eb6:	48 85 c0             	test   rax,rax
  800eb9:	75 2f                	jne    800eea <mmap+0xa1>
    {
        pdp=(page_item*)vmalloc();
  800ebb:	b8 00 00 00 00       	mov    eax,0x0
  800ec0:	e8 a3 01 00 00       	call   801068 <vmalloc>
  800ec5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        pdptp[pdpti]=(addr_t)pdp|attr;
  800ec9:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800ecc:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800ed0:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800ed3:	48 98                	cdqe   
  800ed5:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800edc:	00 
  800edd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800ee1:	48 01 f0             	add    rax,rsi
  800ee4:	48 09 ca             	or     rdx,rcx
  800ee7:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800eea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800eee:	b0 00                	mov    al,0x0
  800ef0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800ef4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800ef8:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800efd:	48 c1 e8 15          	shr    rax,0x15
  800f01:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f08:	00 
  800f09:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f0d:	48 01 d0             	add    rax,rdx
  800f10:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f13:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800f17:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f1b:	83 e0 01             	and    eax,0x1
  800f1e:	48 85 c0             	test   rax,rax
  800f21:	75 37                	jne    800f5a <mmap+0x111>
    {
        pt=(page_item*)vmalloc();
  800f23:	b8 00 00 00 00       	mov    eax,0x0
  800f28:	e8 3b 01 00 00       	call   801068 <vmalloc>
  800f2d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800f31:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f34:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800f38:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f3c:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f41:	48 c1 e8 15          	shr    rax,0x15
  800f45:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f4c:	00 
  800f4d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f51:	48 01 f0             	add    rax,rsi
  800f54:	48 09 ca             	or     rdx,rcx
  800f57:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  800f5a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f5e:	b0 00                	mov    al,0x0
  800f60:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  800f64:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  800f67:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  800f6b:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  800f71:	48 c1 ea 0c          	shr    rdx,0xc
  800f75:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  800f7c:	00 
  800f7d:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800f81:	48 01 ca             	add    rdx,rcx
  800f84:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  800f88:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  800f8b:	b8 00 00 00 00       	mov    eax,0x0
}
  800f90:	c9                   	leave  
  800f91:	c3                   	ret    

0000000000800f92 <mdemap>:

stat_t mdemap(addr_t la)
{
  800f92:	f3 0f 1e fa          	endbr64 
  800f96:	55                   	push   rbp
  800f97:	48 89 e5             	mov    rbp,rsp
  800f9a:	48 83 ec 10          	sub    rsp,0x10
  800f9e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  800fa2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fa6:	ba 00 00 00 00       	mov    edx,0x0
  800fab:	48 89 c6             	mov    rsi,rax
  800fae:	bf 00 00 00 00       	mov    edi,0x0
  800fb3:	e8 91 fe ff ff       	call   800e49 <mmap>
}
  800fb8:	c9                   	leave  
  800fb9:	c3                   	ret    

0000000000800fba <init_paging>:
int init_paging()
{
  800fba:	f3 0f 1e fa          	endbr64 
  800fbe:	55                   	push   rbp
  800fbf:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  800fc2:	90                   	nop
  800fc3:	5d                   	pop    rbp
  800fc4:	c3                   	ret    

0000000000800fc5 <set_high_mem_base>:
void set_high_mem_base(int base)
{
  800fc5:	f3 0f 1e fa          	endbr64 
  800fc9:	55                   	push   rbp
  800fca:	48 89 e5             	mov    rbp,rsp
  800fcd:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  800fd0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  800fd3:	89 05 9f 8c 00 00    	mov    DWORD PTR [rip+0x8c9f],eax        # 809c78 <high_mem_base>
}
  800fd9:	90                   	nop
  800fda:	5d                   	pop    rbp
  800fdb:	c3                   	ret    

0000000000800fdc <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  800fdc:	f3 0f 1e fa          	endbr64 
  800fe0:	55                   	push   rbp
  800fe1:	48 89 e5             	mov    rbp,rsp
  800fe4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  800fe8:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  800fec:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  800ff0:	8b 05 2a f2 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff22a]        # 400220 <mmap_t_i>
  800ff6:	48 63 d0             	movsxd rdx,eax
  800ff9:	48 89 d0             	mov    rax,rdx
  800ffc:	48 01 c0             	add    rax,rax
  800fff:	48 01 d0             	add    rax,rdx
  801002:	48 c1 e0 03          	shl    rax,0x3
  801006:	48 8d 90 40 00 40 00 	lea    rdx,[rax+0x400040]
  80100d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801011:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  801014:	8b 05 06 f2 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff206]        # 400220 <mmap_t_i>
  80101a:	48 63 d0             	movsxd rdx,eax
  80101d:	48 89 d0             	mov    rax,rdx
  801020:	48 01 c0             	add    rax,rax
  801023:	48 01 d0             	add    rax,rdx
  801026:	48 c1 e0 03          	shl    rax,0x3
  80102a:	48 8d 90 48 00 40 00 	lea    rdx,[rax+0x400048]
  801031:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801035:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  801038:	8b 05 e2 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff1e2]        # 400220 <mmap_t_i>
  80103e:	8d 50 01             	lea    edx,[rax+0x1]
  801041:	89 15 d9 f1 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff1d9],edx        # 400220 <mmap_t_i>
  801047:	48 63 d0             	movsxd rdx,eax
  80104a:	48 89 d0             	mov    rax,rdx
  80104d:	48 01 c0             	add    rax,rax
  801050:	48 01 d0             	add    rax,rdx
  801053:	48 c1 e0 03          	shl    rax,0x3
  801057:	48 8d 90 50 00 40 00 	lea    rdx,[rax+0x400050]
  80105e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801062:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  801065:	90                   	nop
  801066:	5d                   	pop    rbp
  801067:	c3                   	ret    

0000000000801068 <vmalloc>:
addr_t vmalloc()
{
  801068:	f3 0f 1e fa          	endbr64 
  80106c:	55                   	push   rbp
  80106d:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  801070:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801077:	eb 76                	jmp    8010ef <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  801079:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801080:	eb 63                	jmp    8010e5 <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  801082:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801085:	48 98                	cdqe   
  801087:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  80108e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801091:	be 01 00 00 00       	mov    esi,0x1
  801096:	89 c1                	mov    ecx,eax
  801098:	d3 e6                	shl    esi,cl
  80109a:	89 f0                	mov    eax,esi
  80109c:	21 d0                	and    eax,edx
  80109e:	85 c0                	test   eax,eax
  8010a0:	75 3f                	jne    8010e1 <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  8010a2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010a5:	48 98                	cdqe   
  8010a7:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  8010ae:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8010b1:	be 01 00 00 00       	mov    esi,0x1
  8010b6:	89 c1                	mov    ecx,eax
  8010b8:	d3 e6                	shl    esi,cl
  8010ba:	89 f0                	mov    eax,esi
  8010bc:	09 c2                	or     edx,eax
  8010be:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010c1:	48 98                	cdqe   
  8010c3:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  8010ca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010cd:	c1 e0 05             	shl    eax,0x5
  8010d0:	89 c2                	mov    edx,eax
  8010d2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8010d5:	01 d0                	add    eax,edx
  8010d7:	83 c0 20             	add    eax,0x20
  8010da:	c1 e0 0c             	shl    eax,0xc
  8010dd:	48 98                	cdqe   
  8010df:	eb 14                	jmp    8010f5 <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  8010e1:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8010e5:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8010e9:	7e 97                	jle    801082 <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8010eb:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8010ef:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8010f3:	7e 84                	jle    801079 <vmalloc+0x11>
            }
        }
    }
}
  8010f5:	5d                   	pop    rbp
  8010f6:	c3                   	ret    

00000000008010f7 <vmfree>:

int vmfree(addr_t ptr)
{
  8010f7:	f3 0f 1e fa          	endbr64 
  8010fb:	55                   	push   rbp
  8010fc:	48 89 e5             	mov    rbp,rsp
  8010ff:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  801103:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801107:	48 c1 e8 0c          	shr    rax,0xc
  80110b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  80110e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801111:	8d 50 1f             	lea    edx,[rax+0x1f]
  801114:	85 c0                	test   eax,eax
  801116:	0f 48 c2             	cmovs  eax,edx
  801119:	c1 f8 05             	sar    eax,0x5
  80111c:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  80111f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801122:	99                   	cdq    
  801123:	c1 ea 1b             	shr    edx,0x1b
  801126:	01 d0                	add    eax,edx
  801128:	83 e0 1f             	and    eax,0x1f
  80112b:	29 d0                	sub    eax,edx
  80112d:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  801130:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801133:	48 98                	cdqe   
  801135:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  80113c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80113f:	be 01 00 00 00       	mov    esi,0x1
  801144:	89 c1                	mov    ecx,eax
  801146:	d3 e6                	shl    esi,cl
  801148:	89 f0                	mov    eax,esi
  80114a:	f7 d0                	not    eax
  80114c:	21 c2                	and    edx,eax
  80114e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801151:	48 98                	cdqe   
  801153:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
}
  80115a:	90                   	nop
  80115b:	5d                   	pop    rbp
  80115c:	c3                   	ret    

000000000080115d <page_err>:
void page_err(){
  80115d:	f3 0f 1e fa          	endbr64 
  801161:	55                   	push   rbp
  801162:	48 89 e5             	mov    rbp,rsp
  801165:	53                   	push   rbx
  801166:	48 83 ec 28          	sub    rsp,0x28
    asm("cli");
  80116a:	fa                   	cli    
    print("page err\n");
  80116b:	bf 58 16 81 00       	mov    edi,0x811658
  801170:	e8 ec 47 00 00       	call   805961 <print>
    unsigned long err_code=0,l_addr=0;
  801175:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80117c:	00 
  80117d:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  801184:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  801185:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  801189:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  80118d:	0f 20 d0             	mov    rax,cr2
  801190:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  801194:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801198:	83 e0 01             	and    eax,0x1
  80119b:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  80119e:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8011a2:	75 27                	jne    8011cb <page_err+0x6e>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        mmap(vmalloc(),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  8011a4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8011a8:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  8011ae:	48 89 c3             	mov    rbx,rax
  8011b1:	b8 00 00 00 00       	mov    eax,0x0
  8011b6:	e8 ad fe ff ff       	call   801068 <vmalloc>
  8011bb:	ba 07 00 00 00       	mov    edx,0x7
  8011c0:	48 89 de             	mov    rsi,rbx
  8011c3:	48 89 c7             	mov    rdi,rax
  8011c6:	e8 7e fc ff ff       	call   800e49 <mmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  8011cb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8011cf:	83 e0 02             	and    eax,0x2
  8011d2:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("when writing\n");else //puts("when reading");
  8011d5:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8011d9:	74 0c                	je     8011e7 <page_err+0x8a>
  8011db:	bf 62 16 81 00       	mov    edi,0x811662
  8011e0:	e8 7c 47 00 00       	call   805961 <print>
  8011e5:	eb 0a                	jmp    8011f1 <page_err+0x94>
    p=err_code&4;
  8011e7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8011eb:	83 e0 04             	and    eax,0x4
  8011ee:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  8011f1:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8011f5:	75 0c                	jne    801203 <page_err+0xa6>
  8011f7:	bf 70 16 81 00       	mov    edi,0x811670
  8011fc:	e8 60 47 00 00       	call   805961 <print>
  801201:	eb 0a                	jmp    80120d <page_err+0xb0>
    p=err_code&16;
  801203:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801207:	83 e0 10             	and    eax,0x10
  80120a:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  80120d:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801211:	74 0a                	je     80121d <page_err+0xc0>
  801213:	bf 88 16 81 00       	mov    edi,0x811688
  801218:	e8 44 47 00 00       	call   805961 <print>
    unsigned int addr=0;
  80121d:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%ebp),%0":"=r"(addr));
  801224:	67 8b 45 08          	mov    eax,DWORD PTR [ebp+0x8]
  801228:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  80122b:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80122f:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  801232:	89 c6                	mov    esi,eax
  801234:	bf a8 16 81 00       	mov    edi,0x8116a8
  801239:	b8 00 00 00 00       	mov    eax,0x0
  80123e:	e8 39 fa ff ff       	call   800c7c <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  801243:	48 8b 15 56 72 c0 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc07256]        # 4084a0 <task>
  80124a:	8b 05 bc fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0febc]        # 41110c <cur_proc>
  801250:	48 98                	cdqe   
  801252:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  801259:	48 01 d0             	add    rax,rdx
  80125c:	8b 00                	mov    eax,DWORD PTR [rax]
  80125e:	83 f8 01             	cmp    eax,0x1
  801261:	75 11                	jne    801274 <page_err+0x117>
    {
        printf("sys died. please reboot.\n");
  801263:	bf ca 16 81 00       	mov    edi,0x8116ca
  801268:	b8 00 00 00 00       	mov    eax,0x0
  80126d:	e8 0a fa ff ff       	call   800c7c <printf>
        asm volatile("jmp .");
  801272:	eb fe                	jmp    801272 <page_err+0x115>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  801274:	b8 00 00 00 00       	mov    eax,0x0
  801279:	e8 40 35 00 00       	call   8047be <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n leave\r\n add $8,%esp \r\n iretq");
  80127e:	fb                   	sti    
  80127f:	c9                   	leave  
  801280:	83 c4 08             	add    esp,0x8
  801283:	48 cf                	iretq  
}
  801285:	90                   	nop
  801286:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80128a:	c9                   	leave  
  80128b:	c3                   	ret    

000000000080128c <init_memory>:
void init_memory()
{
  80128c:	f3 0f 1e fa          	endbr64 
  801290:	55                   	push   rbp
  801291:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  801294:	8b 05 86 ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfef86]        # 400220 <mmap_t_i>
  80129a:	83 e8 01             	sub    eax,0x1
  80129d:	48 63 d0             	movsxd rdx,eax
  8012a0:	48 89 d0             	mov    rax,rdx
  8012a3:	48 01 c0             	add    rax,rax
  8012a6:	48 01 d0             	add    rax,rdx
  8012a9:	48 c1 e0 03          	shl    rax,0x3
  8012ad:	48 05 40 00 40 00    	add    rax,0x400040
  8012b3:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8012b6:	8b 05 64 ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfef64]        # 400220 <mmap_t_i>
  8012bc:	83 e8 01             	sub    eax,0x1
  8012bf:	48 63 d0             	movsxd rdx,eax
  8012c2:	48 89 d0             	mov    rax,rdx
  8012c5:	48 01 c0             	add    rax,rax
  8012c8:	48 01 d0             	add    rax,rdx
  8012cb:	48 c1 e0 03          	shl    rax,0x3
  8012cf:	48 05 48 00 40 00    	add    rax,0x400048
  8012d5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8012d8:	48 01 c8             	add    rax,rcx
  8012db:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  8012df:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8012e3:	48 c1 e8 0c          	shr    rax,0xc
  8012e7:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  8012ea:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8012ed:	8d 50 1f             	lea    edx,[rax+0x1f]
  8012f0:	85 c0                	test   eax,eax
  8012f2:	0f 48 c2             	cmovs  eax,edx
  8012f5:	c1 f8 05             	sar    eax,0x5
  8012f8:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  8012fb:	48 c7 05 1a ed bf ff 	mov    QWORD PTR [rip+0xffffffffffbfed1a],0xc00000        # 400020 <page_map>
  801302:	00 00 c0 00 
    int* p=page_map;
  801306:	48 8b 05 13 ed bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfed13]        # 400020 <page_map>
  80130d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t curp=0;
  801311:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  801318:	00 
    for(int i=0;i<mmap_t_i;i++){
  801319:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  801320:	e9 91 00 00 00       	jmp    8013b6 <init_memory+0x12a>
        int cont=0;
  801325:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  80132c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80132f:	48 63 d0             	movsxd rdx,eax
  801332:	48 89 d0             	mov    rax,rdx
  801335:	48 01 c0             	add    rax,rax
  801338:	48 01 d0             	add    rax,rdx
  80133b:	48 c1 e0 03          	shl    rax,0x3
  80133f:	48 05 50 00 40 00    	add    rax,0x400050
  801345:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801348:	48 83 f8 01          	cmp    rax,0x1
  80134c:	74 07                	je     801355 <init_memory+0xc9>
            cont=-1;
  80134e:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [rbp-0x10],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  801355:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80135c:	eb 15                	jmp    801373 <init_memory+0xe7>
            *(p++)=cont;
  80135e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801362:	48 8d 50 04          	lea    rdx,[rax+0x4]
  801366:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80136a:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80136d:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  80136f:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801373:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801376:	48 63 c8             	movsxd rcx,eax
  801379:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80137c:	48 63 d0             	movsxd rdx,eax
  80137f:	48 89 d0             	mov    rax,rdx
  801382:	48 01 c0             	add    rax,rax
  801385:	48 01 d0             	add    rax,rdx
  801388:	48 c1 e0 03          	shl    rax,0x3
  80138c:	48 05 48 00 40 00    	add    rax,0x400048
  801392:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801395:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  80139c:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  8013a3:	ff 00 00 
  8013a6:	48 21 d0             	and    rax,rdx
  8013a9:	48 c1 e8 11          	shr    rax,0x11
  8013ad:	48 39 c1             	cmp    rcx,rax
  8013b0:	72 ac                	jb     80135e <init_memory+0xd2>
    for(int i=0;i<mmap_t_i;i++){
  8013b2:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8013b6:	8b 05 64 ee bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfee64]        # 400220 <mmap_t_i>
  8013bc:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  8013bf:	0f 8c 60 ff ff ff    	jl     801325 <init_memory+0x99>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  8013c5:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8013cc:	eb 1d                	jmp    8013eb <init_memory+0x15f>
        page_map[i]=0xffffffff;
  8013ce:	48 8b 15 4b ec bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfec4b]        # 400020 <page_map>
  8013d5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8013d8:	48 98                	cdqe   
  8013da:	48 c1 e0 02          	shl    rax,0x2
  8013de:	48 01 d0             	add    rax,rdx
  8013e1:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  8013e7:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  8013eb:	83 7d e8 7f          	cmp    DWORD PTR [rbp-0x18],0x7f
  8013ef:	7e dd                	jle    8013ce <init_memory+0x142>
    }
}
  8013f1:	90                   	nop
  8013f2:	90                   	nop
  8013f3:	5d                   	pop    rbp
  8013f4:	c3                   	ret    

00000000008013f5 <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  8013f5:	f3 0f 1e fa          	endbr64 
  8013f9:	55                   	push   rbp
  8013fa:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  8013fd:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801404:	e9 b0 00 00 00       	jmp    8014b9 <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  801409:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801410:	e9 96 00 00 00       	jmp    8014ab <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  801415:	48 8b 15 04 ec bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfec04]        # 400020 <page_map>
  80141c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80141f:	48 98                	cdqe   
  801421:	48 c1 e0 02          	shl    rax,0x2
  801425:	48 01 d0             	add    rax,rdx
  801428:	8b 10                	mov    edx,DWORD PTR [rax]
  80142a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80142d:	be 01 00 00 00       	mov    esi,0x1
  801432:	89 c1                	mov    ecx,eax
  801434:	d3 e6                	shl    esi,cl
  801436:	89 f0                	mov    eax,esi
  801438:	21 d0                	and    eax,edx
  80143a:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  80143d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801440:	c1 e0 05             	shl    eax,0x5
  801443:	89 c2                	mov    edx,eax
  801445:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801448:	01 d0                	add    eax,edx
  80144a:	c1 e0 0c             	shl    eax,0xc
  80144d:	3d ff ff 0f 00       	cmp    eax,0xfffff
  801452:	7e 53                	jle    8014a7 <req_a_page+0xb2>
  801454:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  801458:	75 4d                	jne    8014a7 <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  80145a:	48 8b 15 bf eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfebbf]        # 400020 <page_map>
  801461:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801464:	48 98                	cdqe   
  801466:	48 c1 e0 02          	shl    rax,0x2
  80146a:	48 01 d0             	add    rax,rdx
  80146d:	8b 10                	mov    edx,DWORD PTR [rax]
  80146f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801472:	be 01 00 00 00       	mov    esi,0x1
  801477:	89 c1                	mov    ecx,eax
  801479:	d3 e6                	shl    esi,cl
  80147b:	89 f0                	mov    eax,esi
  80147d:	89 c6                	mov    esi,eax
  80147f:	48 8b 0d 9a eb bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfeb9a]        # 400020 <page_map>
  801486:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801489:	48 98                	cdqe   
  80148b:	48 c1 e0 02          	shl    rax,0x2
  80148f:	48 01 c8             	add    rax,rcx
  801492:	09 f2                	or     edx,esi
  801494:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  801496:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801499:	c1 e0 05             	shl    eax,0x5
  80149c:	89 c2                	mov    edx,eax
  80149e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8014a1:	01 d0                	add    eax,edx
  8014a3:	48 98                	cdqe   
  8014a5:	eb 1c                	jmp    8014c3 <req_a_page+0xce>
        for(int j=0;j<32;j++){
  8014a7:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8014ab:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8014af:	0f 8e 60 ff ff ff    	jle    801415 <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  8014b5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8014b9:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8014bd:	0f 8e 46 ff ff ff    	jle    801409 <req_a_page+0x14>

            }
        }
    }
}
  8014c3:	5d                   	pop    rbp
  8014c4:	c3                   	ret    

00000000008014c5 <free_page>:

int free_page(char *paddr){
  8014c5:	f3 0f 1e fa          	endbr64 
  8014c9:	55                   	push   rbp
  8014ca:	48 89 e5             	mov    rbp,rsp
  8014cd:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  8014d1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8014d5:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8014db:	85 c0                	test   eax,eax
  8014dd:	0f 48 c2             	cmovs  eax,edx
  8014e0:	c1 f8 0c             	sar    eax,0xc
  8014e3:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8014e6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014e9:	8d 50 1f             	lea    edx,[rax+0x1f]
  8014ec:	85 c0                	test   eax,eax
  8014ee:	0f 48 c2             	cmovs  eax,edx
  8014f1:	c1 f8 05             	sar    eax,0x5
  8014f4:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8014f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014fa:	99                   	cdq    
  8014fb:	c1 ea 1b             	shr    edx,0x1b
  8014fe:	01 d0                	add    eax,edx
  801500:	83 e0 1f             	and    eax,0x1f
  801503:	29 d0                	sub    eax,edx
  801505:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  801508:	48 8b 15 11 eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb11]        # 400020 <page_map>
  80150f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801512:	48 98                	cdqe   
  801514:	48 c1 e0 02          	shl    rax,0x2
  801518:	48 01 d0             	add    rax,rdx
  80151b:	8b 10                	mov    edx,DWORD PTR [rax]
  80151d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801520:	be 01 00 00 00       	mov    esi,0x1
  801525:	89 c1                	mov    ecx,eax
  801527:	d3 e6                	shl    esi,cl
  801529:	89 f0                	mov    eax,esi
  80152b:	f7 d0                	not    eax
  80152d:	89 c6                	mov    esi,eax
  80152f:	48 8b 0d ea ea bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfeaea]        # 400020 <page_map>
  801536:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801539:	48 98                	cdqe   
  80153b:	48 c1 e0 02          	shl    rax,0x2
  80153f:	48 01 c8             	add    rax,rcx
  801542:	21 f2                	and    edx,esi
  801544:	89 10                	mov    DWORD PTR [rax],edx
}
  801546:	90                   	nop
  801547:	5d                   	pop    rbp
  801548:	c3                   	ret    

0000000000801549 <check_page>:
int check_page(int num){
  801549:	f3 0f 1e fa          	endbr64 
  80154d:	55                   	push   rbp
  80154e:	48 89 e5             	mov    rbp,rsp
  801551:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  801554:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801557:	8d 50 1f             	lea    edx,[rax+0x1f]
  80155a:	85 c0                	test   eax,eax
  80155c:	0f 48 c2             	cmovs  eax,edx
  80155f:	c1 f8 05             	sar    eax,0x5
  801562:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  801565:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801568:	99                   	cdq    
  801569:	c1 ea 1b             	shr    edx,0x1b
  80156c:	01 d0                	add    eax,edx
  80156e:	83 e0 1f             	and    eax,0x1f
  801571:	29 d0                	sub    eax,edx
  801573:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  801576:	48 8b 15 a3 ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeaa3]        # 400020 <page_map>
  80157d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801580:	48 98                	cdqe   
  801582:	48 c1 e0 02          	shl    rax,0x2
  801586:	48 01 d0             	add    rax,rdx
  801589:	8b 10                	mov    edx,DWORD PTR [rax]
  80158b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80158e:	be 01 00 00 00       	mov    esi,0x1
  801593:	89 c1                	mov    ecx,eax
  801595:	d3 e6                	shl    esi,cl
  801597:	89 f0                	mov    eax,esi
  801599:	21 d0                	and    eax,edx
  80159b:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  80159e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  8015a1:	5d                   	pop    rbp
  8015a2:	c3                   	ret    

00000000008015a3 <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  8015a3:	f3 0f 1e fa          	endbr64 
  8015a7:	55                   	push   rbp
  8015a8:	48 89 e5             	mov    rbp,rsp
  8015ab:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  8015ae:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015b1:	c1 e0 0c             	shl    eax,0xc
}
  8015b4:	5d                   	pop    rbp
  8015b5:	c3                   	ret    

00000000008015b6 <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  8015b6:	f3 0f 1e fa          	endbr64 
  8015ba:	55                   	push   rbp
  8015bb:	48 89 e5             	mov    rbp,rsp
  8015be:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8015c2:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  8015c5:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  8015c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8015cc:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  8015d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8015d7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8015da:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8015dd:	89 c0                	mov    eax,eax
  8015df:	25 00 f0 ff ff       	and    eax,0xfffff000
  8015e4:	48 09 c2             	or     rdx,rax
  8015e7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8015eb:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  8015ee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8015f2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8015f5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8015f8:	48 98                	cdqe   
  8015fa:	48 09 c2             	or     rdx,rax
  8015fd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801601:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801604:	90                   	nop
  801605:	5d                   	pop    rbp
  801606:	c3                   	ret    

0000000000801607 <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  801607:	f3 0f 1e fa          	endbr64 
  80160b:	55                   	push   rbp
  80160c:	48 89 e5             	mov    rbp,rsp
  80160f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801613:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  801616:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  801619:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80161d:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  801624:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801628:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80162b:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80162e:	0c 81                	or     al,0x81
  801630:	89 c0                	mov    eax,eax
  801632:	48 09 c2             	or     rdx,rax
  801635:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801639:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  80163c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80163f:	25 00 00 00 c0       	and    eax,0xc0000000
  801644:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  801647:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80164b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80164e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801651:	48 09 c2             	or     rdx,rax
  801654:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801658:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80165b:	90                   	nop
  80165c:	5d                   	pop    rbp
  80165d:	c3                   	ret    

000000000080165e <set_2mb_pde>:
void set_2mb_pde(page_item* pde,int pa)
{
  80165e:	f3 0f 1e fa          	endbr64 
  801662:	55                   	push   rbp
  801663:	48 89 e5             	mov    rbp,rsp
  801666:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80166a:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    *pde=0;
  80166d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801671:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT;
  801678:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80167c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80167f:	48 0d 81 10 00 00    	or     rax,0x1081
  801685:	48 89 c2             	mov    rdx,rax
  801688:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80168c:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  80168f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801692:	25 00 00 c0 ff       	and    eax,0xffc00000
  801697:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  80169a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80169e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8016a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016a4:	48 09 c2             	or     rdx,rax
  8016a7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016ab:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8016ae:	90                   	nop
  8016af:	5d                   	pop    rbp
  8016b0:	c3                   	ret    

00000000008016b1 <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  8016b1:	f3 0f 1e fa          	endbr64 
  8016b5:	55                   	push   rbp
  8016b6:	48 89 e5             	mov    rbp,rsp
  8016b9:	48 83 ec 20          	sub    rsp,0x20
  8016bd:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8016c1:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  8016c4:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  8016c9:	75 18                	jne    8016e3 <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  8016cb:	b8 00 00 00 00       	mov    eax,0x0
  8016d0:	e8 20 fd ff ff       	call   8013f5 <req_a_page>
  8016d5:	89 c7                	mov    edi,eax
  8016d7:	e8 c7 fe ff ff       	call   8015a3 <get_phyaddr>
  8016dc:	48 98                	cdqe   
  8016de:	e9 a5 00 00 00       	jmp    801788 <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  8016e3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016e7:	89 c2                	mov    edx,eax
  8016e9:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8016ec:	89 c6                	mov    esi,eax
  8016ee:	89 d7                	mov    edi,edx
  8016f0:	e8 52 01 00 00       	call   801847 <is_pgs_ava>
  8016f5:	85 c0                	test   eax,eax
  8016f7:	75 0c                	jne    801705 <req_page_at+0x54>
  8016f9:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  801700:	e9 83 00 00 00       	jmp    801788 <req_page_at+0xd7>
    int pgni=base/4096;
  801705:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801709:	48 c1 e8 0c          	shr    rax,0xc
  80170d:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  801710:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801713:	8d 50 1f             	lea    edx,[rax+0x1f]
  801716:	85 c0                	test   eax,eax
  801718:	0f 48 c2             	cmovs  eax,edx
  80171b:	c1 f8 05             	sar    eax,0x5
  80171e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  801721:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801724:	99                   	cdq    
  801725:	c1 ea 1b             	shr    edx,0x1b
  801728:	01 d0                	add    eax,edx
  80172a:	83 e0 1f             	and    eax,0x1f
  80172d:	29 d0                	sub    eax,edx
  80172f:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  801732:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801739:	eb 40                	jmp    80177b <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  80173b:	48 8b 15 de e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe8de]        # 400020 <page_map>
  801742:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801745:	48 98                	cdqe   
  801747:	48 c1 e0 02          	shl    rax,0x2
  80174b:	48 01 d0             	add    rax,rdx
  80174e:	8b 10                	mov    edx,DWORD PTR [rax]
  801750:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801753:	be 01 00 00 00       	mov    esi,0x1
  801758:	89 c1                	mov    ecx,eax
  80175a:	d3 e6                	shl    esi,cl
  80175c:	89 f0                	mov    eax,esi
  80175e:	89 c6                	mov    esi,eax
  801760:	48 8b 0d b9 e8 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe8b9]        # 400020 <page_map>
  801767:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80176a:	48 98                	cdqe   
  80176c:	48 c1 e0 02          	shl    rax,0x2
  801770:	48 01 c8             	add    rax,rcx
  801773:	09 f2                	or     edx,esi
  801775:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  801777:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80177b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80177e:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  801781:	7c b8                	jl     80173b <req_page_at+0x8a>
    }
    return 0;
  801783:	b8 00 00 00 00       	mov    eax,0x0

}
  801788:	c9                   	leave  
  801789:	c3                   	ret    

000000000080178a <chk_vm>:
int chk_vm(int base, int pgn)
{
  80178a:	f3 0f 1e fa          	endbr64 
  80178e:	55                   	push   rbp
  80178f:	48 89 e5             	mov    rbp,rsp
  801792:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801795:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  801798:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80179f:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  8017a0:	0f 20 d8             	mov    rax,cr3
  8017a3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  8017a7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8017aa:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  8017b0:	85 c0                	test   eax,eax
  8017b2:	0f 48 c2             	cmovs  eax,edx
  8017b5:	c1 f8 16             	sar    eax,0x16
  8017b8:	48 98                	cdqe   
  8017ba:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8017c1:	00 
  8017c2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8017c6:	48 01 d0             	add    rax,rdx
  8017c9:	8b 00                	mov    eax,DWORD PTR [rax]
  8017cb:	89 c0                	mov    eax,eax
  8017cd:	25 00 f0 ff ff       	and    eax,0xfffff000
  8017d2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  8017d6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8017d9:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  8017df:	85 c0                	test   eax,eax
  8017e1:	0f 48 c2             	cmovs  eax,edx
  8017e4:	c1 f8 16             	sar    eax,0x16
  8017e7:	48 98                	cdqe   
  8017e9:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8017f0:	00 
  8017f1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8017f5:	48 01 d0             	add    rax,rdx
  8017f8:	8b 00                	mov    eax,DWORD PTR [rax]
  8017fa:	83 e0 01             	and    eax,0x1
  8017fd:	85 c0                	test   eax,eax
  8017ff:	74 38                	je     801839 <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  801801:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801804:	99                   	cdq    
  801805:	c1 ea 0a             	shr    edx,0xa
  801808:	01 d0                	add    eax,edx
  80180a:	25 ff ff 3f 00       	and    eax,0x3fffff
  80180f:	29 d0                	sub    eax,edx
  801811:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801817:	85 c0                	test   eax,eax
  801819:	0f 48 c2             	cmovs  eax,edx
  80181c:	c1 f8 0c             	sar    eax,0xc
  80181f:	48 98                	cdqe   
  801821:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801828:	00 
  801829:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80182d:	48 01 d0             	add    rax,rdx
  801830:	8b 00                	mov    eax,DWORD PTR [rax]
  801832:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801835:	85 c0                	test   eax,eax
  801837:	75 07                	jne    801840 <chk_vm+0xb6>
    {
        return -1;
  801839:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80183e:	eb 05                	jmp    801845 <chk_vm+0xbb>
    }
    return 0;
  801840:	b8 00 00 00 00       	mov    eax,0x0
}
  801845:	5d                   	pop    rbp
  801846:	c3                   	ret    

0000000000801847 <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  801847:	f3 0f 1e fa          	endbr64 
  80184b:	55                   	push   rbp
  80184c:	48 89 e5             	mov    rbp,rsp
  80184f:	48 83 ec 18          	sub    rsp,0x18
  801853:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801856:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  801859:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80185c:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801862:	85 c0                	test   eax,eax
  801864:	0f 48 c2             	cmovs  eax,edx
  801867:	c1 f8 0c             	sar    eax,0xc
  80186a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  80186d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801874:	eb 1e                	jmp    801894 <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801876:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801879:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80187c:	01 d0                	add    eax,edx
  80187e:	89 c7                	mov    edi,eax
  801880:	e8 c4 fc ff ff       	call   801549 <check_page>
  801885:	85 c0                	test   eax,eax
  801887:	74 07                	je     801890 <is_pgs_ava+0x49>
  801889:	b8 00 00 00 00       	mov    eax,0x0
  80188e:	eb 11                	jmp    8018a1 <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  801890:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801894:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801897:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  80189a:	7c da                	jl     801876 <is_pgs_ava+0x2f>
    }
    return 1;
  80189c:	b8 01 00 00 00       	mov    eax,0x1

}
  8018a1:	c9                   	leave  
  8018a2:	c3                   	ret    

00000000008018a3 <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  8018a3:	f3 0f 1e fa          	endbr64 
  8018a7:	55                   	push   rbp
  8018a8:	48 89 e5             	mov    rbp,rsp
  8018ab:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8018af:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  8018b3:	c6 05 86 e9 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe986],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  8018ba:	c6 05 80 e9 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe980],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  8018c1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8018c5:	48 89 05 7c e9 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe97c],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  8018cc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8018d0:	48 89 05 79 e9 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe979],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  8018d7:	c7 05 7f e9 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe97f],0x1        # 400260 <vols+0x20>
  8018de:	00 00 00 
    return 0;
  8018e1:	b8 00 00 00 00       	mov    eax,0x0
}
  8018e6:	5d                   	pop    rbp
  8018e7:	c3                   	ret    

00000000008018e8 <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  8018e8:	f3 0f 1e fa          	endbr64 
  8018ec:	55                   	push   rbp
  8018ed:	48 89 e5             	mov    rbp,rsp
  8018f0:	48 83 ec 20          	sub    rsp,0x20
  8018f4:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  8018f7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8018fe:	eb 38                	jmp    801938 <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801900:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801903:	48 98                	cdqe   
  801905:	48 c1 e0 04          	shl    rax,0x4
  801909:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  80190f:	8b 00                	mov    eax,DWORD PTR [rax]
  801911:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801914:	75 1e                	jne    801934 <sys_mkfifo+0x4c>
  801916:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801919:	48 98                	cdqe   
  80191b:	48 c1 e0 04          	shl    rax,0x4
  80191f:	48 05 68 1e 40 00    	add    rax,0x401e68
  801925:	8b 00                	mov    eax,DWORD PTR [rax]
  801927:	83 f8 01             	cmp    eax,0x1
  80192a:	75 08                	jne    801934 <sys_mkfifo+0x4c>
            return i;
  80192c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80192f:	e9 a6 00 00 00       	jmp    8019da <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801934:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801938:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  80193c:	7e c2                	jle    801900 <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  80193e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801945:	e9 81 00 00 00       	jmp    8019cb <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  80194a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80194d:	48 98                	cdqe   
  80194f:	48 c1 e0 04          	shl    rax,0x4
  801953:	48 05 68 1e 40 00    	add    rax,0x401e68
  801959:	8b 00                	mov    eax,DWORD PTR [rax]
  80195b:	85 c0                	test   eax,eax
  80195d:	75 68                	jne    8019c7 <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  80195f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801962:	48 98                	cdqe   
  801964:	48 c1 e0 04          	shl    rax,0x4
  801968:	48 05 68 1e 40 00    	add    rax,0x401e68
  80196e:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  801974:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801977:	48 98                	cdqe   
  801979:	48 c1 e0 04          	shl    rax,0x4
  80197d:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801984:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801987:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801989:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80198c:	48 98                	cdqe   
  80198e:	48 c1 e0 04          	shl    rax,0x4
  801992:	48 05 64 1e 40 00    	add    rax,0x401e64
  801998:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  80199e:	b8 00 00 00 00       	mov    eax,0x0
  8019a3:	e8 4d fa ff ff       	call   8013f5 <req_a_page>
  8019a8:	89 c7                	mov    edi,eax
  8019aa:	e8 f4 fb ff ff       	call   8015a3 <get_phyaddr>
  8019af:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8019b2:	48 63 d2             	movsxd rdx,edx
  8019b5:	48 c1 e2 04          	shl    rdx,0x4
  8019b9:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  8019c0:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  8019c2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019c5:	eb 13                	jmp    8019da <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  8019c7:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8019cb:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  8019cf:	0f 8e 75 ff ff ff    	jle    80194a <sys_mkfifo+0x62>
        }
    }
    return -1;
  8019d5:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8019da:	c9                   	leave  
  8019db:	c3                   	ret    

00000000008019dc <sys_rmfifo>:

int sys_rmfifo(int number)
{
  8019dc:	f3 0f 1e fa          	endbr64 
  8019e0:	55                   	push   rbp
  8019e1:	48 89 e5             	mov    rbp,rsp
  8019e4:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  8019e7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8019ee:	eb 4a                	jmp    801a3a <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  8019f0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019f3:	48 98                	cdqe   
  8019f5:	48 c1 e0 04          	shl    rax,0x4
  8019f9:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  8019ff:	8b 00                	mov    eax,DWORD PTR [rax]
  801a01:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801a04:	75 30                	jne    801a36 <sys_rmfifo+0x5a>
  801a06:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a09:	48 98                	cdqe   
  801a0b:	48 c1 e0 04          	shl    rax,0x4
  801a0f:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a15:	8b 00                	mov    eax,DWORD PTR [rax]
  801a17:	83 f8 01             	cmp    eax,0x1
  801a1a:	75 1a                	jne    801a36 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801a1c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a1f:	48 98                	cdqe   
  801a21:	48 c1 e0 04          	shl    rax,0x4
  801a25:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a2b:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801a31:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a34:	eb 0f                	jmp    801a45 <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801a36:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801a3a:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801a3e:	7e b0                	jle    8019f0 <sys_rmfifo+0x14>
        }
    }
    return -1;
  801a40:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801a45:	5d                   	pop    rbp
  801a46:	c3                   	ret    

0000000000801a47 <free_vol>:
int free_vol(int voli)
{
  801a47:	f3 0f 1e fa          	endbr64 
  801a4b:	55                   	push   rbp
  801a4c:	48 89 e5             	mov    rbp,rsp
  801a4f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801a52:	c7 05 04 e8 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe804],0x0        # 400260 <vols+0x20>
  801a59:	00 00 00 
    return 0;
  801a5c:	b8 00 00 00 00       	mov    eax,0x0
}
  801a61:	5d                   	pop    rbp
  801a62:	c3                   	ret    

0000000000801a63 <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801a63:	f3 0f 1e fa          	endbr64 
  801a67:	55                   	push   rbp
  801a68:	48 89 e5             	mov    rbp,rsp
  801a6b:	48 83 ec 20          	sub    rsp,0x20
  801a6f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801a72:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801a75:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801a79:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801a80:	e9 d8 00 00 00       	jmp    801b5d <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801a85:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a88:	48 63 d0             	movsxd rdx,eax
  801a8b:	48 89 d0             	mov    rax,rdx
  801a8e:	48 c1 e0 02          	shl    rax,0x2
  801a92:	48 01 d0             	add    rax,rdx
  801a95:	48 c1 e0 03          	shl    rax,0x3
  801a99:	48 05 60 02 40 00    	add    rax,0x400260
  801a9f:	8b 00                	mov    eax,DWORD PTR [rax]
  801aa1:	85 c0                	test   eax,eax
  801aa3:	0f 85 b0 00 00 00    	jne    801b59 <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801aa9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801aac:	48 63 d0             	movsxd rdx,eax
  801aaf:	48 89 d0             	mov    rax,rdx
  801ab2:	48 c1 e0 02          	shl    rax,0x2
  801ab6:	48 01 d0             	add    rax,rdx
  801ab9:	48 c1 e0 03          	shl    rax,0x3
  801abd:	48 05 60 02 40 00    	add    rax,0x400260
  801ac3:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801ac9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801acc:	48 63 d0             	movsxd rdx,eax
  801acf:	48 89 d0             	mov    rax,rdx
  801ad2:	48 01 c0             	add    rax,rax
  801ad5:	48 01 d0             	add    rax,rdx
  801ad8:	48 c1 e0 03          	shl    rax,0x3
  801adc:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801ae3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ae6:	48 63 d0             	movsxd rdx,eax
  801ae9:	48 89 d0             	mov    rax,rdx
  801aec:	48 c1 e0 02          	shl    rax,0x2
  801af0:	48 01 d0             	add    rax,rdx
  801af3:	48 c1 e0 03          	shl    rax,0x3
  801af7:	48 05 58 02 40 00    	add    rax,0x400258
  801afd:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801b00:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b03:	89 c7                	mov    edi,eax
  801b05:	e8 0b 1b 00 00       	call   803615 <get_drv>
  801b0a:	48 89 c2             	mov    rdx,rax
  801b0d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b10:	48 63 c8             	movsxd rcx,eax
  801b13:	48 89 c8             	mov    rax,rcx
  801b16:	48 c1 e0 02          	shl    rax,0x2
  801b1a:	48 01 c8             	add    rax,rcx
  801b1d:	48 c1 e0 03          	shl    rax,0x3
  801b21:	48 05 48 02 40 00    	add    rax,0x400248
  801b27:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801b2a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b2d:	48 63 d0             	movsxd rdx,eax
  801b30:	48 89 d0             	mov    rax,rdx
  801b33:	48 c1 e0 02          	shl    rax,0x2
  801b37:	48 01 d0             	add    rax,rdx
  801b3a:	48 c1 e0 03          	shl    rax,0x3
  801b3e:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801b45:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801b49:	48 89 c6             	mov    rsi,rax
  801b4c:	48 89 d7             	mov    rdi,rdx
  801b4f:	e8 60 78 00 00       	call   8093b4 <strcpy>
            return i;
  801b54:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b57:	eb 13                	jmp    801b6c <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801b59:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801b5d:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801b61:	0f 8e 1e ff ff ff    	jle    801a85 <reg_vol+0x22>
        }
    }
    return -1;
  801b67:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801b6c:	c9                   	leave  
  801b6d:	c3                   	ret    

0000000000801b6e <sys_open>:
int sys_open(char *path, int mode)
{
  801b6e:	f3 0f 1e fa          	endbr64 
  801b72:	55                   	push   rbp
  801b73:	48 89 e5             	mov    rbp,rsp
  801b76:	53                   	push   rbx
  801b77:	48 81 ec 28 02 00 00 	sub    rsp,0x228
  801b7e:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
  801b85:	89 b5 d4 fd ff ff    	mov    DWORD PTR [rbp-0x22c],esi
    {

    }
    //根据文件路径找到相应的卷
    char volname[26];
    int i=0,rec=0;
  801b8b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801b92:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
    for(;path[i]!='/'&&i<26;i++)
  801b99:	eb 20                	jmp    801bbb <sys_open+0x4d>
        volname[i]=path[i];
  801b9b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b9e:	48 63 d0             	movsxd rdx,eax
  801ba1:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801ba8:	48 01 d0             	add    rax,rdx
  801bab:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  801bae:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801bb1:	48 98                	cdqe   
  801bb3:	88 54 05 c0          	mov    BYTE PTR [rbp+rax*1-0x40],dl
    for(;path[i]!='/'&&i<26;i++)
  801bb7:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801bbb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801bbe:	48 63 d0             	movsxd rdx,eax
  801bc1:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801bc8:	48 01 d0             	add    rax,rdx
  801bcb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801bce:	3c 2f                	cmp    al,0x2f
  801bd0:	74 06                	je     801bd8 <sys_open+0x6a>
  801bd2:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801bd6:	7e c3                	jle    801b9b <sys_open+0x2d>
    volname[i]='\0';
  801bd8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801bdb:	48 98                	cdqe   
  801bdd:	c6 44 05 c0 00       	mov    BYTE PTR [rbp+rax*1-0x40],0x0
    if(!path[i+1])
  801be2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801be5:	48 98                	cdqe   
  801be7:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801beb:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801bf2:	48 01 d0             	add    rax,rdx
  801bf5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801bf8:	84 c0                	test   al,al
  801bfa:	75 0a                	jne    801c06 <sys_open+0x98>
        return -2;//是根目录
  801bfc:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  801c01:	e9 2b 04 00 00       	jmp    802031 <sys_open+0x4c3>
    rec=i;
  801c06:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c09:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(i=0;i<MAX_VOLUMES;i++)
  801c0c:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801c13:	eb 52                	jmp    801c67 <sys_open+0xf9>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801c15:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c18:	48 63 d0             	movsxd rdx,eax
  801c1b:	48 89 d0             	mov    rax,rdx
  801c1e:	48 c1 e0 02          	shl    rax,0x2
  801c22:	48 01 d0             	add    rax,rdx
  801c25:	48 c1 e0 03          	shl    rax,0x3
  801c29:	48 05 60 02 40 00    	add    rax,0x400260
  801c2f:	8b 00                	mov    eax,DWORD PTR [rax]
  801c31:	85 c0                	test   eax,eax
  801c33:	74 2e                	je     801c63 <sys_open+0xf5>
        (strcmp(vols[i].name,volname)==0))
  801c35:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c38:	48 63 d0             	movsxd rdx,eax
  801c3b:	48 89 d0             	mov    rax,rdx
  801c3e:	48 c1 e0 02          	shl    rax,0x2
  801c42:	48 01 d0             	add    rax,rdx
  801c45:	48 c1 e0 03          	shl    rax,0x3
  801c49:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801c50:	48 8d 45 c0          	lea    rax,[rbp-0x40]
  801c54:	48 89 c6             	mov    rsi,rax
  801c57:	48 89 d7             	mov    rdi,rdx
  801c5a:	e8 f5 78 00 00       	call   809554 <strcmp>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801c5f:	85 c0                	test   eax,eax
  801c61:	74 0c                	je     801c6f <sys_open+0x101>
    for(i=0;i<MAX_VOLUMES;i++)
  801c63:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801c67:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801c6b:	7e a8                	jle    801c15 <sys_open+0xa7>
  801c6d:	eb 01                	jmp    801c70 <sys_open+0x102>
            break;
  801c6f:	90                   	nop
    if(i==MAX_VOLUMES)return -1;
  801c70:	83 7d ec 1a          	cmp    DWORD PTR [rbp-0x14],0x1a
  801c74:	75 0a                	jne    801c80 <sys_open+0x112>
  801c76:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801c7b:	e9 b1 03 00 00       	jmp    802031 <sys_open+0x4c3>
    driver_args arg={
  801c80:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  801c87:	b8 00 00 00 00       	mov    eax,0x0
  801c8c:	b9 17 00 00 00       	mov    ecx,0x17
  801c91:	48 89 d7             	mov    rdi,rdx
  801c94:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  801c97:	48 89 fa             	mov    rdx,rdi
  801c9a:	89 02                	mov    DWORD PTR [rdx],eax
  801c9c:	48 83 c2 04          	add    rdx,0x4
            .path=path+rec+1
  801ca0:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801ca3:	48 98                	cdqe   
  801ca5:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801ca9:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801cb0:	48 01 d0             	add    rax,rdx
    driver_args arg={
  801cb3:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    vfs_dir_entry dir;
    vfs_dir_entry res;
    int voln=i;
  801cba:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801cbd:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    if(vols[i].fs->find(path+rec+1,dir,&res)==-1)//找不到文件 ((driver*)vols[i].fs_drv)->find(&arg)==-1
  801cc0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801cc3:	48 63 d0             	movsxd rdx,eax
  801cc6:	48 89 d0             	mov    rax,rdx
  801cc9:	48 c1 e0 02          	shl    rax,0x2
  801ccd:	48 01 d0             	add    rax,rdx
  801cd0:	48 c1 e0 03          	shl    rax,0x3
  801cd4:	48 05 58 02 40 00    	add    rax,0x400258
  801cda:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801cdd:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  801ce1:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801ce4:	48 98                	cdqe   
  801ce6:	48 8d 48 01          	lea    rcx,[rax+0x1]
  801cea:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801cf1:	48 01 c1             	add    rcx,rax
  801cf4:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
  801cfb:	ff b5 f8 fe ff ff    	push   QWORD PTR [rbp-0x108]
  801d01:	ff b5 f0 fe ff ff    	push   QWORD PTR [rbp-0x110]
  801d07:	ff b5 e8 fe ff ff    	push   QWORD PTR [rbp-0x118]
  801d0d:	ff b5 e0 fe ff ff    	push   QWORD PTR [rbp-0x120]
  801d13:	ff b5 d8 fe ff ff    	push   QWORD PTR [rbp-0x128]
  801d19:	ff b5 d0 fe ff ff    	push   QWORD PTR [rbp-0x130]
  801d1f:	ff b5 c8 fe ff ff    	push   QWORD PTR [rbp-0x138]
  801d25:	ff b5 c0 fe ff ff    	push   QWORD PTR [rbp-0x140]
  801d2b:	ff b5 b8 fe ff ff    	push   QWORD PTR [rbp-0x148]
  801d31:	ff b5 b0 fe ff ff    	push   QWORD PTR [rbp-0x150]
  801d37:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
  801d3d:	ff b5 a0 fe ff ff    	push   QWORD PTR [rbp-0x160]
  801d43:	48 89 c6             	mov    rsi,rax
  801d46:	48 89 cf             	mov    rdi,rcx
  801d49:	ff d2                	call   rdx
  801d4b:	48 83 c4 60          	add    rsp,0x60
  801d4f:	83 f8 ff             	cmp    eax,0xffffffff
  801d52:	75 49                	jne    801d9d <sys_open+0x22f>
    {
        if(mode&FILE_MODE_WRITE) {
  801d54:	8b 85 d4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x22c]
  801d5a:	83 e0 02             	and    eax,0x2
  801d5d:	85 c0                	test   eax,eax
  801d5f:	74 32                	je     801d93 <sys_open+0x225>
            return ((driver *) vols[i].fs_drv)->touch(&arg);//这里之后要改
  801d61:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d64:	48 63 d0             	movsxd rdx,eax
  801d67:	48 89 d0             	mov    rax,rdx
  801d6a:	48 c1 e0 02          	shl    rax,0x2
  801d6e:	48 01 d0             	add    rax,rdx
  801d71:	48 c1 e0 03          	shl    rax,0x3
  801d75:	48 05 50 02 40 00    	add    rax,0x400250
  801d7b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801d7e:	48 8b 50 4c          	mov    rdx,QWORD PTR [rax+0x4c]
  801d82:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  801d89:	48 89 c7             	mov    rdi,rax
  801d8c:	ff d2                	call   rdx
  801d8e:	e9 9e 02 00 00       	jmp    802031 <sys_open+0x4c3>
        }else
            return -1;
  801d93:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801d98:	e9 94 02 00 00       	jmp    802031 <sys_open+0x4c3>
    }
    vfs_dir_entry entry=res;//=arg.entry;
  801d9d:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
  801da4:	48 8b 95 48 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b8]
  801dab:	48 89 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rax
  801db2:	48 89 95 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdx
  801db9:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
  801dc0:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
  801dc7:	48 89 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],rax
  801dce:	48 89 95 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],rdx
  801dd5:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
  801ddc:	48 8b 95 68 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x198]
  801de3:	48 89 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],rax
  801dea:	48 89 95 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],rdx
  801df1:	48 8b 85 70 fe ff ff 	mov    rax,QWORD PTR [rbp-0x190]
  801df8:	48 8b 95 78 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x188]
  801dff:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
  801e06:	48 89 95 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdx
  801e0d:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
  801e14:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
  801e1b:	48 89 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rax
  801e22:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
  801e29:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
  801e30:	48 8b 95 98 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x168]
  801e37:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
  801e3e:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
    int j=-1;
  801e45:	c7 45 e8 ff ff ff ff 	mov    DWORD PTR [rbp-0x18],0xffffffff
    for(i=0;i<MAX_OPEN_FILES;i++)
  801e4c:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801e53:	eb 5c                	jmp    801eb1 <sys_open+0x343>
    {
        if(opened[i].voln==voln&&opened[i].id==entry.id)
  801e55:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801e58:	48 63 d0             	movsxd rdx,eax
  801e5b:	48 89 d0             	mov    rax,rdx
  801e5e:	48 01 c0             	add    rax,rax
  801e61:	48 01 d0             	add    rax,rdx
  801e64:	48 c1 e0 05          	shl    rax,0x5
  801e68:	48 05 68 06 40 00    	add    rax,0x400668
  801e6e:	8b 00                	mov    eax,DWORD PTR [rax]
  801e70:	39 45 e0             	cmp    DWORD PTR [rbp-0x20],eax
  801e73:	75 38                	jne    801ead <sys_open+0x33f>
  801e75:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801e78:	48 63 d0             	movsxd rdx,eax
  801e7b:	48 89 d0             	mov    rax,rdx
  801e7e:	48 01 c0             	add    rax,rax
  801e81:	48 01 d0             	add    rax,rdx
  801e84:	48 c1 e0 05          	shl    rax,0x5
  801e88:	48 05 74 06 40 00    	add    rax,0x400674
  801e8e:	8b 10                	mov    edx,DWORD PTR [rax]
  801e90:	8b 85 f4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x20c]
  801e96:	39 c2                	cmp    edx,eax
  801e98:	75 13                	jne    801ead <sys_open+0x33f>
        {
            if(mode==FILE_MODE_WRITE)
  801e9a:	83 bd d4 fd ff ff 02 	cmp    DWORD PTR [rbp-0x22c],0x2
  801ea1:	75 0a                	jne    801ead <sys_open+0x33f>
            {
                return -1;//读模式会重新给一个fno但是指向同一个文件
  801ea3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801ea8:	e9 84 01 00 00       	jmp    802031 <sys_open+0x4c3>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801ead:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801eb1:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801eb5:	7e 9e                	jle    801e55 <sys_open+0x2e7>
            }
        }
    }
    for(i=0;i<MAX_OPEN_FILES;i++)
  801eb7:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801ebe:	eb 2b                	jmp    801eeb <sys_open+0x37d>
    {
        if(!opened[i].mode) {
  801ec0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ec3:	48 63 d0             	movsxd rdx,eax
  801ec6:	48 89 d0             	mov    rax,rdx
  801ec9:	48 01 c0             	add    rax,rax
  801ecc:	48 01 d0             	add    rax,rdx
  801ecf:	48 c1 e0 05          	shl    rax,0x5
  801ed3:	48 05 64 06 40 00    	add    rax,0x400664
  801ed9:	8b 00                	mov    eax,DWORD PTR [rax]
  801edb:	85 c0                	test   eax,eax
  801edd:	75 08                	jne    801ee7 <sys_open+0x379>
            j = i;
  801edf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ee2:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            break;
  801ee5:	eb 0a                	jmp    801ef1 <sys_open+0x383>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801ee7:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801eeb:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801eef:	7e cf                	jle    801ec0 <sys_open+0x352>
        }
    }
    if(j==-1)return -1;
  801ef1:	83 7d e8 ff          	cmp    DWORD PTR [rbp-0x18],0xffffffff
  801ef5:	75 0a                	jne    801f01 <sys_open+0x393>
  801ef7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801efc:	e9 30 01 00 00       	jmp    802031 <sys_open+0x4c3>
    opened[j]=entry;
  801f01:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801f04:	48 63 d0             	movsxd rdx,eax
  801f07:	48 89 d0             	mov    rax,rdx
  801f0a:	48 01 c0             	add    rax,rax
  801f0d:	48 01 d0             	add    rax,rdx
  801f10:	48 c1 e0 05          	shl    rax,0x5
  801f14:	48 05 60 06 40 00    	add    rax,0x400660
  801f1a:	48 8b 8d e0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x220]
  801f21:	48 8b 9d e8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x218]
  801f28:	48 89 08             	mov    QWORD PTR [rax],rcx
  801f2b:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
  801f2f:	48 8b 8d f0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x210]
  801f36:	48 8b 9d f8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x208]
  801f3d:	48 89 48 10          	mov    QWORD PTR [rax+0x10],rcx
  801f41:	48 89 58 18          	mov    QWORD PTR [rax+0x18],rbx
  801f45:	48 8b 8d 00 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x200]
  801f4c:	48 8b 9d 08 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1f8]
  801f53:	48 89 48 20          	mov    QWORD PTR [rax+0x20],rcx
  801f57:	48 89 58 28          	mov    QWORD PTR [rax+0x28],rbx
  801f5b:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
  801f62:	48 8b 9d 18 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1e8]
  801f69:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
  801f6d:	48 89 58 38          	mov    QWORD PTR [rax+0x38],rbx
  801f71:	48 8b 8d 20 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e0]
  801f78:	48 8b 9d 28 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1d8]
  801f7f:	48 89 48 40          	mov    QWORD PTR [rax+0x40],rcx
  801f83:	48 89 58 48          	mov    QWORD PTR [rax+0x48],rbx
  801f87:	48 8b 8d 30 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1d0]
  801f8e:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
  801f95:	48 89 48 50          	mov    QWORD PTR [rax+0x50],rcx
  801f99:	48 89 58 58          	mov    QWORD PTR [rax+0x58],rbx
    opened[j].fno=i;
  801f9d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801fa0:	48 63 d0             	movsxd rdx,eax
  801fa3:	48 89 d0             	mov    rax,rdx
  801fa6:	48 01 c0             	add    rax,rax
  801fa9:	48 01 d0             	add    rax,rdx
  801fac:	48 c1 e0 05          	shl    rax,0x5
  801fb0:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  801fb7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801fba:	89 02                	mov    DWORD PTR [rdx],eax
    opened[j].link_c++;
  801fbc:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801fbf:	48 63 d0             	movsxd rdx,eax
  801fc2:	48 89 d0             	mov    rax,rdx
  801fc5:	48 01 c0             	add    rax,rax
  801fc8:	48 01 d0             	add    rax,rdx
  801fcb:	48 c1 e0 05          	shl    rax,0x5
  801fcf:	48 05 6c 06 40 00    	add    rax,0x40066c
  801fd5:	8b 00                	mov    eax,DWORD PTR [rax]
  801fd7:	8d 48 01             	lea    ecx,[rax+0x1]
  801fda:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801fdd:	48 63 d0             	movsxd rdx,eax
  801fe0:	48 89 d0             	mov    rax,rdx
  801fe3:	48 01 c0             	add    rax,rax
  801fe6:	48 01 d0             	add    rax,rdx
  801fe9:	48 c1 e0 05          	shl    rax,0x5
  801fed:	48 05 6c 06 40 00    	add    rax,0x40066c
  801ff3:	89 08                	mov    DWORD PTR [rax],ecx
    add_proc_openf(&opened[j]);
  801ff5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801ff8:	48 63 d0             	movsxd rdx,eax
  801ffb:	48 89 d0             	mov    rax,rdx
  801ffe:	48 01 c0             	add    rax,rax
  802001:	48 01 d0             	add    rax,rdx
  802004:	48 c1 e0 05          	shl    rax,0x5
  802008:	48 05 60 06 40 00    	add    rax,0x400660
  80200e:	48 89 c7             	mov    rdi,rax
  802011:	e8 0e 23 00 00       	call   804324 <add_proc_openf>
    return opened[j].fno;
  802016:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802019:	48 63 d0             	movsxd rdx,eax
  80201c:	48 89 d0             	mov    rax,rdx
  80201f:	48 01 c0             	add    rax,rax
  802022:	48 01 d0             	add    rax,rdx
  802025:	48 c1 e0 05          	shl    rax,0x5
  802029:	48 05 60 06 40 00    	add    rax,0x400660
  80202f:	8b 00                	mov    eax,DWORD PTR [rax]
}
  802031:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802035:	c9                   	leave  
  802036:	c3                   	ret    

0000000000802037 <sys_close>:
int sys_close(int fno)
{
  802037:	f3 0f 1e fa          	endbr64 
  80203b:	55                   	push   rbp
  80203c:	48 89 e5             	mov    rbp,rsp
  80203f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802042:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802049:	eb 64                	jmp    8020af <sys_close+0x78>
    {
        if(opened[i].fno==fno)
  80204b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80204e:	48 63 d0             	movsxd rdx,eax
  802051:	48 89 d0             	mov    rax,rdx
  802054:	48 01 c0             	add    rax,rax
  802057:	48 01 d0             	add    rax,rdx
  80205a:	48 c1 e0 05          	shl    rax,0x5
  80205e:	48 05 60 06 40 00    	add    rax,0x400660
  802064:	8b 00                	mov    eax,DWORD PTR [rax]
  802066:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802069:	75 40                	jne    8020ab <sys_close+0x74>
        {
            opened[i].link_c--;
  80206b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80206e:	48 63 d0             	movsxd rdx,eax
  802071:	48 89 d0             	mov    rax,rdx
  802074:	48 01 c0             	add    rax,rax
  802077:	48 01 d0             	add    rax,rdx
  80207a:	48 c1 e0 05          	shl    rax,0x5
  80207e:	48 05 6c 06 40 00    	add    rax,0x40066c
  802084:	8b 00                	mov    eax,DWORD PTR [rax]
  802086:	8d 48 ff             	lea    ecx,[rax-0x1]
  802089:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80208c:	48 63 d0             	movsxd rdx,eax
  80208f:	48 89 d0             	mov    rax,rdx
  802092:	48 01 c0             	add    rax,rax
  802095:	48 01 d0             	add    rax,rdx
  802098:	48 c1 e0 05          	shl    rax,0x5
  80209c:	48 05 6c 06 40 00    	add    rax,0x40066c
  8020a2:	89 08                	mov    DWORD PTR [rax],ecx
            return 0;
  8020a4:	b8 00 00 00 00       	mov    eax,0x0
  8020a9:	eb 0f                	jmp    8020ba <sys_close+0x83>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  8020ab:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8020af:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8020b3:	7e 96                	jle    80204b <sys_close+0x14>
        }
    }
    return -1;
  8020b5:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8020ba:	5d                   	pop    rbp
  8020bb:	c3                   	ret    

00000000008020bc <sys_write>:
int sys_write(int fno, char *src, int len)
{
  8020bc:	f3 0f 1e fa          	endbr64 
  8020c0:	55                   	push   rbp
  8020c1:	48 89 e5             	mov    rbp,rsp
  8020c4:	48 83 ec 20          	sub    rsp,0x20
  8020c8:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8020cb:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8020cf:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  8020d2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8020d5:	89 c7                	mov    edi,eax
  8020d7:	e8 7d 01 00 00       	call   802259 <get_vfs_entry>
  8020dc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  8020e0:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8020e5:	75 07                	jne    8020ee <sys_write+0x32>
  8020e7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8020ec:	eb 5d                	jmp    80214b <sys_write+0x8f>
    if(f->type==FTYPE_REG)
  8020ee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8020f2:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8020f5:	85 c0                	test   eax,eax
  8020f7:	75 18                	jne    802111 <sys_write+0x55>
    {
        return vfs_write_file(f,src,len);
  8020f9:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8020fc:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  802100:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802104:	48 89 ce             	mov    rsi,rcx
  802107:	48 89 c7             	mov    rdi,rax
  80210a:	e8 67 03 00 00       	call   802476 <vfs_write_file>
  80210f:	eb 3a                	jmp    80214b <sys_write+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  802111:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802115:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802118:	83 f8 01             	cmp    eax,0x1
  80211b:	75 29                	jne    802146 <sys_write+0x8a>
    {
        int block=get_according_bnr(f);
  80211d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802121:	48 89 c7             	mov    rdi,rax
  802124:	e8 5b 04 00 00       	call   802584 <get_according_bnr>
  802129:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return write_block(f->dev,block,src,len);
  80212c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802130:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802133:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  802136:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  80213a:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  80213d:	89 c7                	mov    edi,eax
  80213f:	e8 24 08 00 00       	call   802968 <write_block>
  802144:	eb 05                	jmp    80214b <sys_write+0x8f>
    }
    return -1;
  802146:	b8 ff ff ff ff       	mov    eax,0xffffffff
            .src_addr=src,
            .len=len,
            .pos=pos
    };
    return ((driver*)vols[f->voln].fs_drv)->write(&args); */
}
  80214b:	c9                   	leave  
  80214c:	c3                   	ret    

000000000080214d <sys_read>:
int sys_read(int fno, char *dist,  int len)
{
  80214d:	f3 0f 1e fa          	endbr64 
  802151:	55                   	push   rbp
  802152:	48 89 e5             	mov    rbp,rsp
  802155:	48 83 ec 20          	sub    rsp,0x20
  802159:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80215c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802160:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  802163:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802166:	89 c7                	mov    edi,eax
  802168:	e8 ec 00 00 00       	call   802259 <get_vfs_entry>
  80216d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  802171:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802176:	75 07                	jne    80217f <sys_read+0x32>
  802178:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80217d:	eb 5d                	jmp    8021dc <sys_read+0x8f>
    if(f->type==FTYPE_REG)
  80217f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802183:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802186:	85 c0                	test   eax,eax
  802188:	75 18                	jne    8021a2 <sys_read+0x55>
    {
        return vfs_read_file(f,dist,len);
  80218a:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80218d:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  802191:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802195:	48 89 ce             	mov    rsi,rcx
  802198:	48 89 c7             	mov    rdi,rax
  80219b:	e8 37 02 00 00       	call   8023d7 <vfs_read_file>
  8021a0:	eb 3a                	jmp    8021dc <sys_read+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  8021a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021a6:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8021a9:	83 f8 01             	cmp    eax,0x1
  8021ac:	75 29                	jne    8021d7 <sys_read+0x8a>
    {
        int block=get_according_bnr(f);
  8021ae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021b2:	48 89 c7             	mov    rdi,rax
  8021b5:	e8 ca 03 00 00       	call   802584 <get_according_bnr>
  8021ba:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return read_block(f->dev,block,dist,len);
  8021bd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021c1:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8021c4:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  8021c7:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8021cb:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  8021ce:	89 c7                	mov    edi,eax
  8021d0:	e8 10 08 00 00       	call   8029e5 <read_block>
  8021d5:	eb 05                	jmp    8021dc <sys_read+0x8f>
    }
    return -1;
  8021d7:	b8 ff ff ff ff       	mov    eax,0xffffffff
    //         .len=len,
    //         .pos=pos,
    //         .entry=*f
    // };
    // return ((driver*)vols[f->voln].fs_drv)->read(&args);
}
  8021dc:	c9                   	leave  
  8021dd:	c3                   	ret    

00000000008021de <sys_seek>:
int sys_seek(int fno, int offset, int origin)
{
  8021de:	f3 0f 1e fa          	endbr64 
  8021e2:	55                   	push   rbp
  8021e3:	48 89 e5             	mov    rbp,rsp
  8021e6:	48 83 ec 20          	sub    rsp,0x20
  8021ea:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8021ed:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8021f0:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  8021f3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8021f6:	89 c7                	mov    edi,eax
  8021f8:	e8 5c 00 00 00       	call   802259 <get_vfs_entry>
  8021fd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  802201:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802206:	75 07                	jne    80220f <sys_seek+0x31>
  802208:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80220d:	eb 14                	jmp    802223 <sys_seek+0x45>
    f->ptr=offset+origin;
  80220f:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802212:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802215:	01 c2                	add    edx,eax
  802217:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80221b:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
    return 0;
  80221e:	b8 00 00 00 00       	mov    eax,0x0
}
  802223:	c9                   	leave  
  802224:	c3                   	ret    

0000000000802225 <sys_tell>:
int sys_tell(int fno)
{
  802225:	f3 0f 1e fa          	endbr64 
  802229:	55                   	push   rbp
  80222a:	48 89 e5             	mov    rbp,rsp
  80222d:	48 83 ec 20          	sub    rsp,0x20
  802231:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    vfs_dir_entry *f= get_vfs_entry(fno);
  802234:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802237:	89 c7                	mov    edi,eax
  802239:	e8 1b 00 00 00       	call   802259 <get_vfs_entry>
  80223e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  802242:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802247:	75 07                	jne    802250 <sys_tell+0x2b>
  802249:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80224e:	eb 07                	jmp    802257 <sys_tell+0x32>
    return f->ptr;
  802250:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802254:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802257:	c9                   	leave  
  802258:	c3                   	ret    

0000000000802259 <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  802259:	f3 0f 1e fa          	endbr64 
  80225d:	55                   	push   rbp
  80225e:	48 89 e5             	mov    rbp,rsp
  802261:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802264:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80226b:	eb 3f                	jmp    8022ac <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  80226d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802270:	48 63 d0             	movsxd rdx,eax
  802273:	48 89 d0             	mov    rax,rdx
  802276:	48 01 c0             	add    rax,rax
  802279:	48 01 d0             	add    rax,rdx
  80227c:	48 c1 e0 05          	shl    rax,0x5
  802280:	48 05 60 06 40 00    	add    rax,0x400660
  802286:	8b 00                	mov    eax,DWORD PTR [rax]
  802288:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80228b:	75 1b                	jne    8022a8 <get_vfs_entry+0x4f>
        {
            return &opened[i];
  80228d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802290:	48 63 d0             	movsxd rdx,eax
  802293:	48 89 d0             	mov    rax,rdx
  802296:	48 01 c0             	add    rax,rax
  802299:	48 01 d0             	add    rax,rdx
  80229c:	48 c1 e0 05          	shl    rax,0x5
  8022a0:	48 05 60 06 40 00    	add    rax,0x400660
  8022a6:	eb 0f                	jmp    8022b7 <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  8022a8:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8022ac:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8022b0:	7e bb                	jle    80226d <get_vfs_entry+0x14>
        }
    }
    return NULL;
  8022b2:	b8 00 00 00 00       	mov    eax,0x0
}
  8022b7:	5d                   	pop    rbp
  8022b8:	c3                   	ret    

00000000008022b9 <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  8022b9:	f3 0f 1e fa          	endbr64 
  8022bd:	55                   	push   rbp
  8022be:	48 89 e5             	mov    rbp,rsp
  8022c1:	48 83 ec 10          	sub    rsp,0x10
  8022c5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  8022c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022cd:	48 89 c7             	mov    rdi,rax
  8022d0:	e8 a0 04 00 00       	call   802775 <wait_on_buf>
    if(bh->b_count==0)return -1;
  8022d5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022d9:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  8022dd:	84 c0                	test   al,al
  8022df:	75 07                	jne    8022e8 <brelse+0x2f>
  8022e1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8022e6:	eb 32                	jmp    80231a <brelse+0x61>
    bh->b_count--;
  8022e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022ec:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  8022f0:	8d 50 ff             	lea    edx,[rax-0x1]
  8022f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022f7:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  8022fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022fe:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  802302:	84 c0                	test   al,al
  802304:	75 0f                	jne    802315 <brelse+0x5c>
        vmfree(bh->b_data);
  802306:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80230a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80230d:	48 89 c7             	mov    rdi,rax
  802310:	e8 e2 ed ff ff       	call   8010f7 <vmfree>
    return 0;
  802315:	b8 00 00 00 00       	mov    eax,0x0
}
  80231a:	c9                   	leave  
  80231b:	c3                   	ret    

000000000080231c <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  80231c:	f3 0f 1e fa          	endbr64 
  802320:	55                   	push   rbp
  802321:	48 89 e5             	mov    rbp,rsp
  802324:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  80232b:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  802331:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  802337:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  80233d:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  802343:	89 d6                	mov    esi,edx
  802345:	89 c7                	mov    edi,eax
  802347:	e8 78 02 00 00       	call   8025c4 <get_buf>
  80234c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  802350:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802355:	75 09                	jne    802360 <bread+0x44>
  802357:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80235e:	eb 75                	jmp    8023d5 <bread+0xb9>
    if(!bh->b_uptodate)
  802360:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802364:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  802368:	84 c0                	test   al,al
  80236a:	75 65                	jne    8023d1 <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  80236c:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  802372:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  802375:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  80237c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802380:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802383:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  802389:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  802390:	02 00 00 
        arg.lba=bh->b_blocknr;
  802393:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802397:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80239b:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  8023a1:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  8023a8:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  8023ab:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  8023b2:	48 89 c7             	mov    rdi,rax
  8023b5:	e8 82 12 00 00       	call   80363c <make_request>
  8023ba:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  8023bd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8023c0:	89 c7                	mov    edi,eax
  8023c2:	e8 88 15 00 00       	call   80394f <wait_on_req>
        clear_req(reqi);
  8023c7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8023ca:	89 c7                	mov    edi,eax
  8023cc:	e8 ae 15 00 00       	call   80397f <clear_req>
    }
    return bh;
  8023d1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8023d5:	c9                   	leave  
  8023d6:	c3                   	ret    

00000000008023d7 <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  8023d7:	f3 0f 1e fa          	endbr64 
  8023db:	55                   	push   rbp
  8023dc:	48 89 e5             	mov    rbp,rsp
  8023df:	48 83 ec 40          	sub    rsp,0x40
  8023e3:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  8023e7:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  8023eb:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  8023ee:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8023f2:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8023f5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  8023f8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8023fc:	48 89 c7             	mov    rdi,rax
  8023ff:	e8 80 01 00 00       	call   802584 <get_according_bnr>
  802404:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  802407:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80240a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80240d:	89 d6                	mov    esi,edx
  80240f:	89 c7                	mov    edi,eax
  802411:	e8 06 ff ff ff       	call   80231c <bread>
  802416:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80241a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80241d:	ba 00 02 00 00       	mov    edx,0x200
  802422:	39 d0                	cmp    eax,edx
  802424:	0f 4f c2             	cmovg  eax,edx
  802427:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  80242a:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80242d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802431:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802434:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802438:	48 89 ce             	mov    rsi,rcx
  80243b:	48 89 c7             	mov    rdi,rax
  80243e:	e8 73 6e 00 00       	call   8092b6 <memcpy>
        len-=BLOCK_SIZE;
  802443:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  80244a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80244e:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802451:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802454:	01 c2                	add    edx,eax
  802456:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80245a:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  80245d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802461:	48 89 c7             	mov    rdi,rax
  802464:	e8 50 fe ff ff       	call   8022b9 <brelse>
    }while(len>0);
  802469:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  80246d:	7f 89                	jg     8023f8 <vfs_read_file+0x21>
    return 0;
  80246f:	b8 00 00 00 00       	mov    eax,0x0
}
  802474:	c9                   	leave  
  802475:	c3                   	ret    

0000000000802476 <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  802476:	f3 0f 1e fa          	endbr64 
  80247a:	55                   	push   rbp
  80247b:	48 89 e5             	mov    rbp,rsp
  80247e:	48 83 ec 40          	sub    rsp,0x40
  802482:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802486:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80248a:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  80248d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802491:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  802494:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802497:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80249b:	48 89 c7             	mov    rdi,rax
  80249e:	e8 e1 00 00 00       	call   802584 <get_according_bnr>
  8024a3:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  8024a6:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8024a9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8024ac:	89 d6                	mov    esi,edx
  8024ae:	89 c7                	mov    edi,eax
  8024b0:	e8 0f 01 00 00       	call   8025c4 <get_buf>
  8024b5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8024b9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8024bc:	ba 00 02 00 00       	mov    edx,0x200
  8024c1:	39 d0                	cmp    eax,edx
  8024c3:	0f 4f c2             	cmovg  eax,edx
  8024c6:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  8024c9:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8024cc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8024d0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8024d3:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  8024d7:	48 89 ce             	mov    rsi,rcx
  8024da:	48 89 c7             	mov    rdi,rax
  8024dd:	e8 d4 6d 00 00       	call   8092b6 <memcpy>
        len-=BLOCK_SIZE;
  8024e2:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  8024e9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024ed:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8024f0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8024f3:	01 c2                	add    edx,eax
  8024f5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024f9:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  8024fc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802500:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802504:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802508:	48 89 c7             	mov    rdi,rax
  80250b:	e8 a9 fd ff ff       	call   8022b9 <brelse>
    }while(len>0);
  802510:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  802514:	7f 81                	jg     802497 <vfs_write_file+0x21>
    return 0;
  802516:	b8 00 00 00 00       	mov    eax,0x0
}
  80251b:	c9                   	leave  
  80251c:	c3                   	ret    

000000000080251d <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  80251d:	f3 0f 1e fa          	endbr64 
  802521:	55                   	push   rbp
  802522:	48 89 e5             	mov    rbp,rsp
  802525:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  802529:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  80252c:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  80252f:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  802533:	74 20                	je     802555 <vfs_seek_file+0x38>
  802535:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  802539:	7f 3f                	jg     80257a <vfs_seek_file+0x5d>
  80253b:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  80253f:	74 08                	je     802549 <vfs_seek_file+0x2c>
  802541:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  802545:	74 23                	je     80256a <vfs_seek_file+0x4d>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  802547:	eb 31                	jmp    80257a <vfs_seek_file+0x5d>
        f->ptr=offset;
  802549:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80254d:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802550:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802553:	eb 26                	jmp    80257b <vfs_seek_file+0x5e>
        f->ptr+=offset;
  802555:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802559:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80255c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80255f:	01 c2                	add    edx,eax
  802561:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802565:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802568:	eb 11                	jmp    80257b <vfs_seek_file+0x5e>
        f->ptr=f->size;
  80256a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80256e:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  802571:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802575:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802578:	eb 01                	jmp    80257b <vfs_seek_file+0x5e>
        break;
  80257a:	90                   	nop
    }
    return f->ptr;
  80257b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80257f:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802582:	5d                   	pop    rbp
  802583:	c3                   	ret    

0000000000802584 <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  802584:	f3 0f 1e fa          	endbr64 
  802588:	55                   	push   rbp
  802589:	48 89 e5             	mov    rbp,rsp
  80258c:	48 83 ec 10          	sub    rsp,0x10
  802590:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  802594:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802598:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80259b:	48 63 d0             	movsxd rdx,eax
  80259e:	48 89 d0             	mov    rax,rdx
  8025a1:	48 c1 e0 02          	shl    rax,0x2
  8025a5:	48 01 d0             	add    rax,rdx
  8025a8:	48 c1 e0 03          	shl    rax,0x3
  8025ac:	48 05 58 02 40 00    	add    rax,0x400258
  8025b2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8025b5:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8025b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025bd:	48 89 c7             	mov    rdi,rax
  8025c0:	ff d2                	call   rdx

}
  8025c2:	c9                   	leave  
  8025c3:	c3                   	ret    

00000000008025c4 <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  8025c4:	f3 0f 1e fa          	endbr64 
  8025c8:	55                   	push   rbp
  8025c9:	48 89 e5             	mov    rbp,rsp
  8025cc:	48 83 ec 20          	sub    rsp,0x20
  8025d0:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8025d3:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8025d6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8025dd:	e9 b9 00 00 00       	jmp    80269b <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  8025e2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8025e5:	48 98                	cdqe   
  8025e7:	48 c1 e0 06          	shl    rax,0x6
  8025eb:	48 05 90 26 40 00    	add    rax,0x402690
  8025f1:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8025f4:	0f b7 c0             	movzx  eax,ax
  8025f7:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8025fa:	0f 85 97 00 00 00    	jne    802697 <get_buf+0xd3>
  802600:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802603:	48 98                	cdqe   
  802605:	48 c1 e0 06          	shl    rax,0x6
  802609:	48 05 88 26 40 00    	add    rax,0x402688
  80260f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802612:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802615:	48 98                	cdqe   
  802617:	48 39 c2             	cmp    rdx,rax
  80261a:	75 7b                	jne    802697 <get_buf+0xd3>
        {
            repeat:
  80261c:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  80261d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802620:	48 98                	cdqe   
  802622:	48 c1 e0 06          	shl    rax,0x6
  802626:	48 05 80 26 40 00    	add    rax,0x402680
  80262c:	48 89 c7             	mov    rdi,rax
  80262f:	e8 41 01 00 00       	call   802775 <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  802634:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802637:	48 98                	cdqe   
  802639:	48 c1 e0 06          	shl    rax,0x6
  80263d:	48 05 94 26 40 00    	add    rax,0x402694
  802643:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802646:	84 c0                	test   al,al
  802648:	74 02                	je     80264c <get_buf+0x88>
                goto repeat;
  80264a:	eb d1                	jmp    80261d <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  80264c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80264f:	48 98                	cdqe   
  802651:	48 c1 e0 06          	shl    rax,0x6
  802655:	48 05 90 26 40 00    	add    rax,0x402690
  80265b:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80265e:	0f b7 c0             	movzx  eax,ax
  802661:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802664:	75 30                	jne    802696 <get_buf+0xd2>
  802666:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802669:	48 98                	cdqe   
  80266b:	48 c1 e0 06          	shl    rax,0x6
  80266f:	48 05 88 26 40 00    	add    rax,0x402688
  802675:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802678:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80267b:	48 98                	cdqe   
  80267d:	48 39 c2             	cmp    rdx,rax
  802680:	75 14                	jne    802696 <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  802682:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802685:	48 98                	cdqe   
  802687:	48 c1 e0 06          	shl    rax,0x6
  80268b:	48 05 80 26 40 00    	add    rax,0x402680
  802691:	e9 dd 00 00 00       	jmp    802773 <get_buf+0x1af>
                continue;
  802696:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802697:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80269b:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  80269f:	0f 8e 3d ff ff ff    	jle    8025e2 <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8026a5:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8026ac:	e9 b8 00 00 00       	jmp    802769 <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  8026b1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8026b4:	48 98                	cdqe   
  8026b6:	48 c1 e0 06          	shl    rax,0x6
  8026ba:	48 05 94 26 40 00    	add    rax,0x402694
  8026c0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8026c3:	84 c0                	test   al,al
  8026c5:	0f 85 9a 00 00 00    	jne    802765 <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  8026cb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8026ce:	48 98                	cdqe   
  8026d0:	48 c1 e0 06          	shl    rax,0x6
  8026d4:	48 05 93 26 40 00    	add    rax,0x402693
  8026da:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8026dd:	84 c0                	test   al,al
  8026df:	74 2e                	je     80270f <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  8026e1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8026e4:	48 98                	cdqe   
  8026e6:	48 c1 e0 06          	shl    rax,0x6
  8026ea:	48 05 80 26 40 00    	add    rax,0x402680
  8026f0:	48 89 c7             	mov    rdi,rax
  8026f3:	e8 2c 02 00 00       	call   802924 <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  8026f8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8026fb:	48 98                	cdqe   
  8026fd:	48 c1 e0 06          	shl    rax,0x6
  802701:	48 05 80 26 40 00    	add    rax,0x402680
  802707:	48 89 c7             	mov    rdi,rax
  80270a:	e8 66 00 00 00       	call   802775 <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  80270f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802712:	48 98                	cdqe   
  802714:	48 c1 e0 06          	shl    rax,0x6
  802718:	48 05 94 26 40 00    	add    rax,0x402694
  80271e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802721:	8d 50 01             	lea    edx,[rax+0x1]
  802724:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802727:	48 98                	cdqe   
  802729:	48 c1 e0 06          	shl    rax,0x6
  80272d:	48 05 94 26 40 00    	add    rax,0x402694
  802733:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  802735:	b8 00 00 00 00       	mov    eax,0x0
  80273a:	e8 29 e9 ff ff       	call   801068 <vmalloc>
  80273f:	48 89 c2             	mov    rdx,rax
  802742:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802745:	48 98                	cdqe   
  802747:	48 c1 e0 06          	shl    rax,0x6
  80274b:	48 05 80 26 40 00    	add    rax,0x402680
  802751:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  802754:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802757:	48 98                	cdqe   
  802759:	48 c1 e0 06          	shl    rax,0x6
  80275d:	48 05 80 26 40 00    	add    rax,0x402680
  802763:	eb 0e                	jmp    802773 <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802765:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  802769:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80276d:	0f 8e 3e ff ff ff    	jle    8026b1 <get_buf+0xed>
        }
    }
}
  802773:	c9                   	leave  
  802774:	c3                   	ret    

0000000000802775 <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  802775:	f3 0f 1e fa          	endbr64 
  802779:	55                   	push   rbp
  80277a:	48 89 e5             	mov    rbp,rsp
  80277d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  802781:	90                   	nop
  802782:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802786:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  80278a:	84 c0                	test   al,al
  80278c:	75 f4                	jne    802782 <wait_on_buf+0xd>
    
}
  80278e:	90                   	nop
  80278f:	90                   	nop
  802790:	5d                   	pop    rbp
  802791:	c3                   	ret    

0000000000802792 <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  802792:	f3 0f 1e fa          	endbr64 
  802796:	55                   	push   rbp
  802797:	48 89 e5             	mov    rbp,rsp
  80279a:	48 83 ec 40          	sub    rsp,0x40
  80279e:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    device *blkdev=get_dev(dev);
  8027a1:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8027a4:	89 c7                	mov    edi,eax
  8027a6:	e8 3c 0e 00 00       	call   8035e7 <get_dev>
  8027ab:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    buffer_head* bh=bread(dev,0);
  8027af:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8027b2:	be 00 00 00 00       	mov    esi,0x0
  8027b7:	89 c7                	mov    edi,eax
  8027b9:	e8 5e fb ff ff       	call   80231c <bread>
  8027be:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!bh)return -1;
  8027c2:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  8027c7:	75 0a                	jne    8027d3 <scan_dev+0x41>
  8027c9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8027ce:	e9 4f 01 00 00       	jmp    802922 <scan_dev+0x190>
    dpt_t* dpte=bh->b_data+0x1be;
  8027d3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8027d7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8027da:	48 05 be 01 00 00    	add    rax,0x1be
  8027e0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  8027e4:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8027eb:	e9 17 01 00 00       	jmp    802907 <scan_dev+0x175>
    {
        blkdev->par[i].type=dpte->type;
  8027f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8027f4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8027f7:	0f b6 d0             	movzx  edx,al
  8027fa:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  8027fe:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802801:	48 63 c8             	movsxd rcx,eax
  802804:	48 89 c8             	mov    rax,rcx
  802807:	48 01 c0             	add    rax,rax
  80280a:	48 01 c8             	add    rax,rcx
  80280d:	48 c1 e0 02          	shl    rax,0x2
  802811:	48 01 f0             	add    rax,rsi
  802814:	48 83 c0 40          	add    rax,0x40
  802818:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
        int stlba=dpte->start_lba;
  80281b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80281f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802822:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
        blkdev->par[i].start_sec=stlba;
  802825:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  802829:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80282c:	48 63 d0             	movsxd rdx,eax
  80282f:	48 89 d0             	mov    rax,rdx
  802832:	48 01 c0             	add    rax,rax
  802835:	48 01 d0             	add    rax,rdx
  802838:	48 c1 e0 02          	shl    rax,0x2
  80283c:	48 01 c8             	add    rax,rcx
  80283f:	48 8d 50 40          	lea    rdx,[rax+0x40]
  802843:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802846:	89 02                	mov    DWORD PTR [rdx],eax
        int i;
        for(i=0;i<MAX_FS;i++)
  802848:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  80284f:	eb 68                	jmp    8028b9 <scan_dev+0x127>
        {
            if(fs[i].read_superblock&&fs[i].read_superblock(dev,stlba)==0)
  802851:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  802854:	48 63 d0             	movsxd rdx,eax
  802857:	48 89 d0             	mov    rax,rdx
  80285a:	48 01 c0             	add    rax,rax
  80285d:	48 01 d0             	add    rax,rdx
  802860:	48 c1 e0 03          	shl    rax,0x3
  802864:	48 05 80 23 40 00    	add    rax,0x402380
  80286a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80286d:	48 85 c0             	test   rax,rax
  802870:	74 43                	je     8028b5 <scan_dev+0x123>
  802872:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  802875:	48 63 d0             	movsxd rdx,eax
  802878:	48 89 d0             	mov    rax,rdx
  80287b:	48 01 c0             	add    rax,rax
  80287e:	48 01 d0             	add    rax,rdx
  802881:	48 c1 e0 03          	shl    rax,0x3
  802885:	48 05 80 23 40 00    	add    rax,0x402380
  80288b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80288e:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  802891:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802894:	89 d6                	mov    esi,edx
  802896:	89 c7                	mov    edi,eax
  802898:	ff d1                	call   rcx
  80289a:	85 c0                	test   eax,eax
  80289c:	75 17                	jne    8028b5 <scan_dev+0x123>
            {
                reg_vol(dev,i,blkdev->name);//识别成功，注册卷
  80289e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8028a2:	48 8d 50 14          	lea    rdx,[rax+0x14]
  8028a6:	8b 4d f0             	mov    ecx,DWORD PTR [rbp-0x10]
  8028a9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8028ac:	89 ce                	mov    esi,ecx
  8028ae:	89 c7                	mov    edi,eax
  8028b0:	e8 ae f1 ff ff       	call   801a63 <reg_vol>
        for(i=0;i<MAX_FS;i++)
  8028b5:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8028b9:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  8028bd:	7e 92                	jle    802851 <scan_dev+0xbf>
            }
        }
        if(i==MAX_FS)
  8028bf:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  8028c3:	75 0f                	jne    8028d4 <scan_dev+0x142>
        {
            printf("err:unrecognised partition fs.\n");
  8028c5:	bf e8 16 81 00       	mov    edi,0x8116e8
  8028ca:	b8 00 00 00 00       	mov    eax,0x0
  8028cf:	e8 a8 e3 ff ff       	call   800c7c <printf>
        }

        blkdev->par[i].end_sec=dpte->end_lba;
  8028d4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8028d8:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8028db:	89 c1                	mov    ecx,eax
  8028dd:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  8028e1:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8028e4:	48 63 d0             	movsxd rdx,eax
  8028e7:	48 89 d0             	mov    rax,rdx
  8028ea:	48 01 c0             	add    rax,rax
  8028ed:	48 01 d0             	add    rax,rdx
  8028f0:	48 c1 e0 02          	shl    rax,0x2
  8028f4:	48 01 f0             	add    rax,rsi
  8028f7:	48 83 c0 40          	add    rax,0x40
  8028fb:	89 48 04             	mov    DWORD PTR [rax+0x4],ecx
        dpte++;
  8028fe:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  802903:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802907:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  80290b:	0f 8e df fe ff ff    	jle    8027f0 <scan_dev+0x5e>
    }
    brelse(bh);
  802911:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802915:	48 89 c7             	mov    rdi,rax
  802918:	e8 9c f9 ff ff       	call   8022b9 <brelse>
    return 0;
  80291d:	b8 00 00 00 00       	mov    eax,0x0
}
  802922:	c9                   	leave  
  802923:	c3                   	ret    

0000000000802924 <sync_buf>:

int sync_buf(buffer_head* bh)
{
  802924:	f3 0f 1e fa          	endbr64 
  802928:	55                   	push   rbp
  802929:	48 89 e5             	mov    rbp,rsp
  80292c:	48 83 ec 20          	sub    rsp,0x20
  802930:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  802934:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802938:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  80293c:	0f b7 c0             	movzx  eax,ax
  80293f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  802942:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802946:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80294a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  80294d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802951:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802954:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  802957:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80295a:	b9 00 02 00 00       	mov    ecx,0x200
  80295f:	89 c7                	mov    edi,eax
  802961:	e8 02 00 00 00       	call   802968 <write_block>

}
  802966:	c9                   	leave  
  802967:	c3                   	ret    

0000000000802968 <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  802968:	f3 0f 1e fa          	endbr64 
  80296c:	55                   	push   rbp
  80296d:	48 89 e5             	mov    rbp,rsp
  802970:	48 83 ec 30          	sub    rsp,0x30
  802974:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802977:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80297a:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  80297e:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  802981:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802984:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802987:	89 d6                	mov    esi,edx
  802989:	89 c7                	mov    edi,eax
  80298b:	e8 34 fc ff ff       	call   8025c4 <get_buf>
  802990:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802994:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802997:	ba 00 02 00 00       	mov    edx,0x200
  80299c:	39 d0                	cmp    eax,edx
  80299e:	0f 4f c2             	cmovg  eax,edx
  8029a1:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  8029a4:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8029a7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029ab:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8029ae:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8029b2:	48 89 ce             	mov    rsi,rcx
  8029b5:	48 89 c7             	mov    rdi,rax
  8029b8:	e8 f9 68 00 00       	call   8092b6 <memcpy>
        len-=BLOCK_SIZE;
  8029bd:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  8029c4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029c8:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  8029cc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029d0:	48 89 c7             	mov    rdi,rax
  8029d3:	e8 e1 f8 ff ff       	call   8022b9 <brelse>
    }while(len>0);
  8029d8:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  8029dc:	7f a3                	jg     802981 <write_block+0x19>
    return 0;
  8029de:	b8 00 00 00 00       	mov    eax,0x0
}
  8029e3:	c9                   	leave  
  8029e4:	c3                   	ret    

00000000008029e5 <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  8029e5:	f3 0f 1e fa          	endbr64 
  8029e9:	55                   	push   rbp
  8029ea:	48 89 e5             	mov    rbp,rsp
  8029ed:	48 83 ec 30          	sub    rsp,0x30
  8029f1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8029f4:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8029f7:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  8029fb:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  8029fe:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802a01:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802a04:	89 d6                	mov    esi,edx
  802a06:	89 c7                	mov    edi,eax
  802a08:	e8 0f f9 ff ff       	call   80231c <bread>
  802a0d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802a11:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802a14:	ba 00 02 00 00       	mov    edx,0x200
  802a19:	39 d0                	cmp    eax,edx
  802a1b:	0f 4f c2             	cmovg  eax,edx
  802a1e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  802a21:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802a24:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a28:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802a2b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802a2f:	48 89 ce             	mov    rsi,rcx
  802a32:	48 89 c7             	mov    rdi,rax
  802a35:	e8 7c 68 00 00       	call   8092b6 <memcpy>
        len-=BLOCK_SIZE;
  802a3a:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  802a41:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a45:	48 89 c7             	mov    rdi,rax
  802a48:	e8 6c f8 ff ff       	call   8022b9 <brelse>
    }while(len>0);
  802a4d:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802a51:	7f ab                	jg     8029fe <read_block+0x19>
    return 0;
  802a53:	b8 00 00 00 00       	mov    eax,0x0
}
  802a58:	c9                   	leave  
  802a59:	c3                   	ret    

0000000000802a5a <init_vfs>:

int init_vfs()
{
  802a5a:	f3 0f 1e fa          	endbr64 
  802a5e:	55                   	push   rbp
  802a5f:	48 89 e5             	mov    rbp,rsp
  802a62:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  802a66:	48 8b 05 13 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a13]        # 408480 <dev_tree>
  802a6d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  802a71:	eb 40                	jmp    802ab3 <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  802a73:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a77:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  802a7d:	48 c1 f8 02          	sar    rax,0x2
  802a81:	48 89 c2             	mov    rdx,rax
  802a84:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  802a8b:	18 9c 8f 
  802a8e:	48 0f af c2          	imul   rax,rdx
  802a92:	89 c7                	mov    edi,eax
  802a94:	e8 f9 fc ff ff       	call   802792 <scan_dev>
  802a99:	85 c0                	test   eax,eax
  802a9b:	74 07                	je     802aa4 <init_vfs+0x4a>
  802a9d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802aa2:	eb 1b                	jmp    802abf <init_vfs+0x65>
    for(;p;p=p->next)
  802aa4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802aa8:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802aaf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  802ab3:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802ab8:	75 b9                	jne    802a73 <init_vfs+0x19>
    }
    return 0;
  802aba:	b8 00 00 00 00       	mov    eax,0x0
  802abf:	c9                   	leave  
  802ac0:	c3                   	ret    

0000000000802ac1 <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  802ac1:	f3 0f 1e fa          	endbr64 
  802ac5:	55                   	push   rbp
  802ac6:	48 89 e5             	mov    rbp,rsp
}
  802ac9:	90                   	nop
  802aca:	5d                   	pop    rbp
  802acb:	c3                   	ret    

0000000000802acc <load_driver>:
int load_driver(char *path)
{
  802acc:	f3 0f 1e fa          	endbr64 
  802ad0:	55                   	push   rbp
  802ad1:	48 89 e5             	mov    rbp,rsp
  802ad4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  802ad8:	90                   	nop
  802ad9:	5d                   	pop    rbp
  802ada:	c3                   	ret    

0000000000802adb <reg_device>:

int reg_device(device* dev)
{
  802adb:	f3 0f 1e fa          	endbr64 
  802adf:	55                   	push   rbp
  802ae0:	48 89 e5             	mov    rbp,rsp
  802ae3:	53                   	push   rbx
  802ae4:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  802ae8:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  802aef:	e9 42 01 00 00       	jmp    802c36 <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  802af4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802af7:	48 63 d0             	movsxd rdx,eax
  802afa:	48 89 d0             	mov    rax,rdx
  802afd:	48 c1 e0 02          	shl    rax,0x2
  802b01:	48 01 d0             	add    rax,rdx
  802b04:	48 c1 e0 02          	shl    rax,0x2
  802b08:	48 01 d0             	add    rax,rdx
  802b0b:	48 c1 e0 03          	shl    rax,0x3
  802b0f:	48 05 90 2e 40 00    	add    rax,0x402e90
  802b15:	8b 00                	mov    eax,DWORD PTR [rax]
  802b17:	85 c0                	test   eax,eax
  802b19:	0f 85 13 01 00 00    	jne    802c32 <reg_device+0x157>
        {
            devs[i]=*dev;
  802b1f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802b22:	48 63 d0             	movsxd rdx,eax
  802b25:	48 89 d0             	mov    rax,rdx
  802b28:	48 c1 e0 02          	shl    rax,0x2
  802b2c:	48 01 d0             	add    rax,rdx
  802b2f:	48 c1 e0 02          	shl    rax,0x2
  802b33:	48 01 d0             	add    rax,rdx
  802b36:	48 c1 e0 03          	shl    rax,0x3
  802b3a:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  802b41:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802b45:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802b48:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802b4c:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802b4f:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802b53:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802b57:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802b5b:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802b5f:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802b63:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802b67:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802b6b:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802b6f:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802b73:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802b77:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802b7b:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802b7f:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802b83:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802b87:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802b8b:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802b8f:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802b93:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802b97:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802b9b:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802b9f:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802ba3:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802ba7:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802bab:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802baf:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802bb3:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802bb7:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802bbb:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802bbf:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802bc3:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802bca:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802bd1:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802bd8:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802bdf:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802be6:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802bed:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802bf4:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  802bfb:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  802c02:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  802c09:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802c0c:	48 63 d0             	movsxd rdx,eax
  802c0f:	48 89 d0             	mov    rax,rdx
  802c12:	48 c1 e0 02          	shl    rax,0x2
  802c16:	48 01 d0             	add    rax,rdx
  802c19:	48 c1 e0 02          	shl    rax,0x2
  802c1d:	48 01 d0             	add    rax,rdx
  802c20:	48 c1 e0 03          	shl    rax,0x3
  802c24:	48 05 90 2e 40 00    	add    rax,0x402e90
  802c2a:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802c30:	eb 0e                	jmp    802c40 <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  802c32:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802c36:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  802c3a:	0f 8e b4 fe ff ff    	jle    802af4 <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802c40:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  802c44:	75 0a                	jne    802c50 <reg_device+0x175>
        return -1;
  802c46:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802c4b:	e9 6d 01 00 00       	jmp    802dbd <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802c50:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  802c57:	00 
  802c58:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802c5b:	48 63 d0             	movsxd rdx,eax
  802c5e:	48 89 d0             	mov    rax,rdx
  802c61:	48 c1 e0 02          	shl    rax,0x2
  802c65:	48 01 d0             	add    rax,rdx
  802c68:	48 c1 e0 02          	shl    rax,0x2
  802c6c:	48 01 d0             	add    rax,rdx
  802c6f:	48 c1 e0 03          	shl    rax,0x3
  802c73:	48 05 80 2e 40 00    	add    rax,0x402e80
  802c79:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  802c7d:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802c81:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802c84:	83 f8 03             	cmp    eax,0x3
  802c87:	74 3b                	je     802cc4 <reg_device+0x1e9>
  802c89:	83 f8 03             	cmp    eax,0x3
  802c8c:	7f 4b                	jg     802cd9 <reg_device+0x1fe>
  802c8e:	83 f8 01             	cmp    eax,0x1
  802c91:	74 07                	je     802c9a <reg_device+0x1bf>
  802c93:	83 f8 02             	cmp    eax,0x2
  802c96:	74 17                	je     802caf <reg_device+0x1d4>
  802c98:	eb 3f                	jmp    802cd9 <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  802c9a:	48 8b 05 df 57 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc057df]        # 408480 <dev_tree>
  802ca1:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802ca5:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  802cac:	00 
        break;
  802cad:	eb 34                	jmp    802ce3 <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  802caf:	48 8b 05 d2 57 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc057d2]        # 408488 <dev_tree+0x8>
  802cb6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802cba:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  802cc1:	00 
        break;
  802cc2:	eb 1f                	jmp    802ce3 <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  802cc4:	48 8b 05 c5 57 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc057c5]        # 408490 <dev_tree+0x10>
  802ccb:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802ccf:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  802cd6:	00 
        break;
  802cd7:	eb 0a                	jmp    802ce3 <reg_device+0x208>
    default:return -1;//不可能有其他情况
  802cd9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802cde:	e9 da 00 00 00       	jmp    802dbd <reg_device+0x2e2>
    }
    if(!p){
  802ce3:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  802ce8:	75 2b                	jne    802d15 <reg_device+0x23a>
        *pp=neo;
  802cea:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802cee:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802cf2:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  802cf5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802cf9:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  802d00:	00 00 00 00 
  802d04:	eb 3d                	jmp    802d43 <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  802d06:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d0a:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802d11:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802d15:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d19:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802d20:	48 85 c0             	test   rax,rax
  802d23:	75 e1                	jne    802d06 <reg_device+0x22b>
        p->next=neo;
  802d25:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d29:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802d2d:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  802d34:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d38:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802d3c:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802d43:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d47:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802d4e:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802d52:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d56:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802d59:	83 f8 04             	cmp    eax,0x4
  802d5c:	74 3b                	je     802d99 <reg_device+0x2be>
  802d5e:	83 f8 04             	cmp    eax,0x4
  802d61:	7f 56                	jg     802db9 <reg_device+0x2de>
  802d63:	83 f8 03             	cmp    eax,0x3
  802d66:	74 21                	je     802d89 <reg_device+0x2ae>
  802d68:	83 f8 03             	cmp    eax,0x3
  802d6b:	7f 4c                	jg     802db9 <reg_device+0x2de>
  802d6d:	83 f8 01             	cmp    eax,0x1
  802d70:	74 07                	je     802d79 <reg_device+0x29e>
  802d72:	83 f8 02             	cmp    eax,0x2
  802d75:	74 32                	je     802da9 <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802d77:	eb 40                	jmp    802db9 <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  802d79:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d7d:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802d84:	00 00 00 
        break;
  802d87:	eb 31                	jmp    802dba <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  802d89:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d8d:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802d94:	00 00 00 
        break;
  802d97:	eb 21                	jmp    802dba <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  802d99:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d9d:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  802da4:	00 00 00 
        break;
  802da7:	eb 11                	jmp    802dba <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  802da9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802dad:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  802db4:	00 00 00 
        break;
  802db7:	eb 01                	jmp    802dba <reg_device+0x2df>
        break;
  802db9:	90                   	nop
    }
    return i;
  802dba:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  802dbd:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802dc1:	c9                   	leave  
  802dc2:	c3                   	ret    

0000000000802dc3 <reg_driver>:


int reg_driver(driver *drv)
{
  802dc3:	f3 0f 1e fa          	endbr64 
  802dc7:	55                   	push   rbp
  802dc8:	48 89 e5             	mov    rbp,rsp
  802dcb:	53                   	push   rbx
  802dcc:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  802dd0:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802dd7:	e9 22 01 00 00       	jmp    802efe <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  802ddc:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802ddf:	48 63 d0             	movsxd rdx,eax
  802de2:	48 89 d0             	mov    rax,rdx
  802de5:	48 c1 e0 02          	shl    rax,0x2
  802de9:	48 01 d0             	add    rax,rdx
  802dec:	48 c1 e0 05          	shl    rax,0x5
  802df0:	48 05 80 58 40 00    	add    rax,0x405880
  802df6:	8b 00                	mov    eax,DWORD PTR [rax]
  802df8:	85 c0                	test   eax,eax
  802dfa:	0f 85 fa 00 00 00    	jne    802efa <reg_driver+0x137>
        {
            drvs[i]=*drv;
  802e00:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802e03:	48 63 d0             	movsxd rdx,eax
  802e06:	48 89 d0             	mov    rax,rdx
  802e09:	48 c1 e0 02          	shl    rax,0x2
  802e0d:	48 01 d0             	add    rax,rdx
  802e10:	48 c1 e0 05          	shl    rax,0x5
  802e14:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  802e1b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802e1f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802e22:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802e26:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802e29:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802e2d:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802e31:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802e35:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802e39:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802e3d:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802e41:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802e45:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802e49:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802e4d:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802e51:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802e55:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802e59:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802e5d:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802e61:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802e65:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802e69:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802e6d:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802e71:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802e75:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802e79:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802e7d:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802e81:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802e85:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802e89:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802e8d:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802e91:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802e95:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802e99:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802e9d:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802ea4:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802eab:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802eb2:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802eb9:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802ec0:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802ec7:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802ece:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  802ed5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802ed8:	48 63 d0             	movsxd rdx,eax
  802edb:	48 89 d0             	mov    rax,rdx
  802ede:	48 c1 e0 02          	shl    rax,0x2
  802ee2:	48 01 d0             	add    rax,rdx
  802ee5:	48 c1 e0 05          	shl    rax,0x5
  802ee9:	48 05 80 58 40 00    	add    rax,0x405880
  802eef:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  802ef5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802ef8:	eb 13                	jmp    802f0d <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  802efa:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802efe:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  802f02:	0f 8e d4 fe ff ff    	jle    802ddc <reg_driver+0x19>
        }
    }
    return -1;
  802f08:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802f0d:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802f11:	c9                   	leave  
  802f12:	c3                   	ret    

0000000000802f13 <sys_find_dev>:

int sys_find_dev(char *name)
{
  802f13:	f3 0f 1e fa          	endbr64 
  802f17:	55                   	push   rbp
  802f18:	48 89 e5             	mov    rbp,rsp
  802f1b:	48 83 ec 20          	sub    rsp,0x20
  802f1f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802f23:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802f2a:	eb 6c                	jmp    802f98 <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802f2c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f2f:	48 63 d0             	movsxd rdx,eax
  802f32:	48 89 d0             	mov    rax,rdx
  802f35:	48 c1 e0 02          	shl    rax,0x2
  802f39:	48 01 d0             	add    rax,rdx
  802f3c:	48 c1 e0 02          	shl    rax,0x2
  802f40:	48 01 d0             	add    rax,rdx
  802f43:	48 c1 e0 03          	shl    rax,0x3
  802f47:	48 05 90 2e 40 00    	add    rax,0x402e90
  802f4d:	8b 00                	mov    eax,DWORD PTR [rax]
  802f4f:	85 c0                	test   eax,eax
  802f51:	74 41                	je     802f94 <sys_find_dev+0x81>
  802f53:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f56:	48 63 d0             	movsxd rdx,eax
  802f59:	48 89 d0             	mov    rax,rdx
  802f5c:	48 c1 e0 02          	shl    rax,0x2
  802f60:	48 01 d0             	add    rax,rdx
  802f63:	48 c1 e0 02          	shl    rax,0x2
  802f67:	48 01 d0             	add    rax,rdx
  802f6a:	48 c1 e0 03          	shl    rax,0x3
  802f6e:	48 83 c0 10          	add    rax,0x10
  802f72:	48 05 80 2e 40 00    	add    rax,0x402e80
  802f78:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802f7c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802f80:	48 89 d6             	mov    rsi,rdx
  802f83:	48 89 c7             	mov    rdi,rax
  802f86:	e8 c9 65 00 00       	call   809554 <strcmp>
  802f8b:	85 c0                	test   eax,eax
  802f8d:	75 05                	jne    802f94 <sys_find_dev+0x81>
            return i;
  802f8f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f92:	eb 0f                	jmp    802fa3 <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802f94:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802f98:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802f9c:	7e 8e                	jle    802f2c <sys_find_dev+0x19>
    }
    return -1;
  802f9e:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802fa3:	c9                   	leave  
  802fa4:	c3                   	ret    

0000000000802fa5 <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  802fa5:	f3 0f 1e fa          	endbr64 
  802fa9:	55                   	push   rbp
  802faa:	48 89 e5             	mov    rbp,rsp
  802fad:	48 83 ec 30          	sub    rsp,0x30
  802fb1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802fb5:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  802fb8:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  802fbc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  802fc3:	eb 67                	jmp    80302c <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802fc5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fc8:	48 63 d0             	movsxd rdx,eax
  802fcb:	48 89 d0             	mov    rax,rdx
  802fce:	48 c1 e0 02          	shl    rax,0x2
  802fd2:	48 01 d0             	add    rax,rdx
  802fd5:	48 c1 e0 02          	shl    rax,0x2
  802fd9:	48 01 d0             	add    rax,rdx
  802fdc:	48 c1 e0 03          	shl    rax,0x3
  802fe0:	48 05 90 2e 40 00    	add    rax,0x402e90
  802fe6:	8b 00                	mov    eax,DWORD PTR [rax]
  802fe8:	85 c0                	test   eax,eax
  802fea:	74 3c                	je     803028 <sys_operate_dev+0x83>
  802fec:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fef:	48 63 d0             	movsxd rdx,eax
  802ff2:	48 89 d0             	mov    rax,rdx
  802ff5:	48 c1 e0 02          	shl    rax,0x2
  802ff9:	48 01 d0             	add    rax,rdx
  802ffc:	48 c1 e0 02          	shl    rax,0x2
  803000:	48 01 d0             	add    rax,rdx
  803003:	48 c1 e0 03          	shl    rax,0x3
  803007:	48 83 c0 10          	add    rax,0x10
  80300b:	48 05 80 2e 40 00    	add    rax,0x402e80
  803011:	48 8d 50 04          	lea    rdx,[rax+0x4]
  803015:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803019:	48 89 d6             	mov    rsi,rdx
  80301c:	48 89 c7             	mov    rdi,rax
  80301f:	e8 30 65 00 00       	call   809554 <strcmp>
  803024:	85 c0                	test   eax,eax
  803026:	74 0c                	je     803034 <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  803028:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80302c:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803030:	7e 93                	jle    802fc5 <sys_operate_dev+0x20>
  803032:	eb 01                	jmp    803035 <sys_operate_dev+0x90>
            break;
  803034:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  803035:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803039:	75 0a                	jne    803045 <sys_operate_dev+0xa0>
  80303b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803040:	e9 9c 02 00 00       	jmp    8032e1 <sys_operate_dev+0x33c>
    switch (func) {
  803045:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  803049:	0f 87 8d 02 00 00    	ja     8032dc <sys_operate_dev+0x337>
  80304f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  803052:	48 8b 04 c5 08 17 81 	mov    rax,QWORD PTR [rax*8+0x811708]
  803059:	00 
  80305a:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  80305d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803060:	48 63 d0             	movsxd rdx,eax
  803063:	48 89 d0             	mov    rax,rdx
  803066:	48 c1 e0 02          	shl    rax,0x2
  80306a:	48 01 d0             	add    rax,rdx
  80306d:	48 c1 e0 02          	shl    rax,0x2
  803071:	48 01 d0             	add    rax,rdx
  803074:	48 c1 e0 03          	shl    rax,0x3
  803078:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80307e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803081:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  803085:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803089:	48 89 c7             	mov    rdi,rax
  80308c:	ff d2                	call   rdx
  80308e:	e9 4e 02 00 00       	jmp    8032e1 <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  803093:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803096:	48 63 d0             	movsxd rdx,eax
  803099:	48 89 d0             	mov    rax,rdx
  80309c:	48 c1 e0 02          	shl    rax,0x2
  8030a0:	48 01 d0             	add    rax,rdx
  8030a3:	48 c1 e0 02          	shl    rax,0x2
  8030a7:	48 01 d0             	add    rax,rdx
  8030aa:	48 c1 e0 03          	shl    rax,0x3
  8030ae:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030b4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030b7:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8030bb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030bf:	48 89 c7             	mov    rdi,rax
  8030c2:	ff d2                	call   rdx
  8030c4:	e9 18 02 00 00       	jmp    8032e1 <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  8030c9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030cc:	48 63 d0             	movsxd rdx,eax
  8030cf:	48 89 d0             	mov    rax,rdx
  8030d2:	48 c1 e0 02          	shl    rax,0x2
  8030d6:	48 01 d0             	add    rax,rdx
  8030d9:	48 c1 e0 02          	shl    rax,0x2
  8030dd:	48 01 d0             	add    rax,rdx
  8030e0:	48 c1 e0 03          	shl    rax,0x3
  8030e4:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030ea:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030ed:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  8030f1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030f5:	48 89 c7             	mov    rdi,rax
  8030f8:	ff d2                	call   rdx
  8030fa:	e9 e2 01 00 00       	jmp    8032e1 <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  8030ff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803102:	48 63 d0             	movsxd rdx,eax
  803105:	48 89 d0             	mov    rax,rdx
  803108:	48 c1 e0 02          	shl    rax,0x2
  80310c:	48 01 d0             	add    rax,rdx
  80310f:	48 c1 e0 02          	shl    rax,0x2
  803113:	48 01 d0             	add    rax,rdx
  803116:	48 c1 e0 03          	shl    rax,0x3
  80311a:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803120:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803123:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  803127:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80312b:	48 89 c7             	mov    rdi,rax
  80312e:	ff d2                	call   rdx
  803130:	e9 ac 01 00 00       	jmp    8032e1 <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  803135:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803138:	48 63 d0             	movsxd rdx,eax
  80313b:	48 89 d0             	mov    rax,rdx
  80313e:	48 c1 e0 02          	shl    rax,0x2
  803142:	48 01 d0             	add    rax,rdx
  803145:	48 c1 e0 02          	shl    rax,0x2
  803149:	48 01 d0             	add    rax,rdx
  80314c:	48 c1 e0 03          	shl    rax,0x3
  803150:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803156:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803159:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  80315d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803161:	48 89 c7             	mov    rdi,rax
  803164:	ff d2                	call   rdx
  803166:	e9 76 01 00 00       	jmp    8032e1 <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  80316b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80316e:	48 63 d0             	movsxd rdx,eax
  803171:	48 89 d0             	mov    rax,rdx
  803174:	48 c1 e0 02          	shl    rax,0x2
  803178:	48 01 d0             	add    rax,rdx
  80317b:	48 c1 e0 02          	shl    rax,0x2
  80317f:	48 01 d0             	add    rax,rdx
  803182:	48 c1 e0 03          	shl    rax,0x3
  803186:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80318c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80318f:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  803193:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803197:	48 89 c7             	mov    rdi,rax
  80319a:	ff d2                	call   rdx
  80319c:	e9 40 01 00 00       	jmp    8032e1 <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  8031a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031a4:	48 63 d0             	movsxd rdx,eax
  8031a7:	48 89 d0             	mov    rax,rdx
  8031aa:	48 c1 e0 02          	shl    rax,0x2
  8031ae:	48 01 d0             	add    rax,rdx
  8031b1:	48 c1 e0 02          	shl    rax,0x2
  8031b5:	48 01 d0             	add    rax,rdx
  8031b8:	48 c1 e0 03          	shl    rax,0x3
  8031bc:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031c2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031c5:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  8031c9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031cd:	48 89 c7             	mov    rdi,rax
  8031d0:	ff d2                	call   rdx
  8031d2:	e9 0a 01 00 00       	jmp    8032e1 <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  8031d7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031da:	48 63 d0             	movsxd rdx,eax
  8031dd:	48 89 d0             	mov    rax,rdx
  8031e0:	48 c1 e0 02          	shl    rax,0x2
  8031e4:	48 01 d0             	add    rax,rdx
  8031e7:	48 c1 e0 02          	shl    rax,0x2
  8031eb:	48 01 d0             	add    rax,rdx
  8031ee:	48 c1 e0 03          	shl    rax,0x3
  8031f2:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031f8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031fb:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  8031ff:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803203:	48 89 c7             	mov    rdi,rax
  803206:	ff d2                	call   rdx
  803208:	e9 d4 00 00 00       	jmp    8032e1 <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  80320d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803210:	48 63 d0             	movsxd rdx,eax
  803213:	48 89 d0             	mov    rax,rdx
  803216:	48 c1 e0 02          	shl    rax,0x2
  80321a:	48 01 d0             	add    rax,rdx
  80321d:	48 c1 e0 02          	shl    rax,0x2
  803221:	48 01 d0             	add    rax,rdx
  803224:	48 c1 e0 03          	shl    rax,0x3
  803228:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80322e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803231:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  803235:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803239:	48 89 c7             	mov    rdi,rax
  80323c:	ff d2                	call   rdx
  80323e:	e9 9e 00 00 00       	jmp    8032e1 <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  803243:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803246:	48 63 d0             	movsxd rdx,eax
  803249:	48 89 d0             	mov    rax,rdx
  80324c:	48 c1 e0 02          	shl    rax,0x2
  803250:	48 01 d0             	add    rax,rdx
  803253:	48 c1 e0 02          	shl    rax,0x2
  803257:	48 01 d0             	add    rax,rdx
  80325a:	48 c1 e0 03          	shl    rax,0x3
  80325e:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803264:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803267:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  80326b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80326f:	48 89 c7             	mov    rdi,rax
  803272:	ff d2                	call   rdx
  803274:	eb 6b                	jmp    8032e1 <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  803276:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803279:	48 63 d0             	movsxd rdx,eax
  80327c:	48 89 d0             	mov    rax,rdx
  80327f:	48 c1 e0 02          	shl    rax,0x2
  803283:	48 01 d0             	add    rax,rdx
  803286:	48 c1 e0 02          	shl    rax,0x2
  80328a:	48 01 d0             	add    rax,rdx
  80328d:	48 c1 e0 03          	shl    rax,0x3
  803291:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803297:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80329a:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  80329e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8032a2:	48 89 c7             	mov    rdi,rax
  8032a5:	ff d2                	call   rdx
  8032a7:	eb 38                	jmp    8032e1 <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  8032a9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032ac:	48 63 d0             	movsxd rdx,eax
  8032af:	48 89 d0             	mov    rax,rdx
  8032b2:	48 c1 e0 02          	shl    rax,0x2
  8032b6:	48 01 d0             	add    rax,rdx
  8032b9:	48 c1 e0 02          	shl    rax,0x2
  8032bd:	48 01 d0             	add    rax,rdx
  8032c0:	48 c1 e0 03          	shl    rax,0x3
  8032c4:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8032ca:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8032cd:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  8032d1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8032d5:	48 89 c7             	mov    rdi,rax
  8032d8:	ff d2                	call   rdx
  8032da:	eb 05                	jmp    8032e1 <sys_operate_dev+0x33c>
    }
    return -1;
  8032dc:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8032e1:	c9                   	leave  
  8032e2:	c3                   	ret    

00000000008032e3 <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  8032e3:	f3 0f 1e fa          	endbr64 
  8032e7:	55                   	push   rbp
  8032e8:	48 89 e5             	mov    rbp,rsp
  8032eb:	48 83 ec 10          	sub    rsp,0x10
  8032ef:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  8032f2:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  8032f5:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  8032f9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032fc:	48 63 d0             	movsxd rdx,eax
  8032ff:	48 89 d0             	mov    rax,rdx
  803302:	48 c1 e0 02          	shl    rax,0x2
  803306:	48 01 d0             	add    rax,rdx
  803309:	48 c1 e0 05          	shl    rax,0x5
  80330d:	48 05 80 58 40 00    	add    rax,0x405880
  803313:	8b 00                	mov    eax,DWORD PTR [rax]
  803315:	85 c0                	test   eax,eax
  803317:	75 0a                	jne    803323 <call_drv_func+0x40>
  803319:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80331e:	e9 15 02 00 00       	jmp    803538 <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  803323:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  803327:	0f 87 06 02 00 00    	ja     803533 <call_drv_func+0x250>
  80332d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803330:	48 8b 04 c5 68 17 81 	mov    rax,QWORD PTR [rax*8+0x811768]
  803337:	00 
  803338:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  80333b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80333e:	48 63 d0             	movsxd rdx,eax
  803341:	48 89 d0             	mov    rax,rdx
  803344:	48 c1 e0 02          	shl    rax,0x2
  803348:	48 01 d0             	add    rax,rdx
  80334b:	48 c1 e0 05          	shl    rax,0x5
  80334f:	48 05 88 58 40 00    	add    rax,0x405888
  803355:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803358:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80335c:	48 89 c7             	mov    rdi,rax
  80335f:	ff d2                	call   rdx
  803361:	e9 d2 01 00 00       	jmp    803538 <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  803366:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803369:	48 63 d0             	movsxd rdx,eax
  80336c:	48 89 d0             	mov    rax,rdx
  80336f:	48 c1 e0 02          	shl    rax,0x2
  803373:	48 01 d0             	add    rax,rdx
  803376:	48 c1 e0 05          	shl    rax,0x5
  80337a:	48 05 90 58 40 00    	add    rax,0x405890
  803380:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803383:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803387:	48 89 c7             	mov    rdi,rax
  80338a:	ff d2                	call   rdx
  80338c:	e9 a7 01 00 00       	jmp    803538 <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  803391:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803394:	48 63 d0             	movsxd rdx,eax
  803397:	48 89 d0             	mov    rax,rdx
  80339a:	48 c1 e0 02          	shl    rax,0x2
  80339e:	48 01 d0             	add    rax,rdx
  8033a1:	48 c1 e0 05          	shl    rax,0x5
  8033a5:	48 05 98 58 40 00    	add    rax,0x405898
  8033ab:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033ae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033b2:	48 89 c7             	mov    rdi,rax
  8033b5:	ff d2                	call   rdx
  8033b7:	e9 7c 01 00 00       	jmp    803538 <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  8033bc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033bf:	48 63 d0             	movsxd rdx,eax
  8033c2:	48 89 d0             	mov    rax,rdx
  8033c5:	48 c1 e0 02          	shl    rax,0x2
  8033c9:	48 01 d0             	add    rax,rdx
  8033cc:	48 c1 e0 05          	shl    rax,0x5
  8033d0:	48 05 a0 58 40 00    	add    rax,0x4058a0
  8033d6:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033d9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033dd:	48 89 c7             	mov    rdi,rax
  8033e0:	ff d2                	call   rdx
  8033e2:	e9 51 01 00 00       	jmp    803538 <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  8033e7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033ea:	48 63 d0             	movsxd rdx,eax
  8033ed:	48 89 d0             	mov    rax,rdx
  8033f0:	48 c1 e0 02          	shl    rax,0x2
  8033f4:	48 01 d0             	add    rax,rdx
  8033f7:	48 c1 e0 05          	shl    rax,0x5
  8033fb:	48 05 a8 58 40 00    	add    rax,0x4058a8
  803401:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803404:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803408:	48 89 c7             	mov    rdi,rax
  80340b:	ff d2                	call   rdx
  80340d:	e9 26 01 00 00       	jmp    803538 <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  803412:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803415:	48 63 d0             	movsxd rdx,eax
  803418:	48 89 d0             	mov    rax,rdx
  80341b:	48 c1 e0 02          	shl    rax,0x2
  80341f:	48 01 d0             	add    rax,rdx
  803422:	48 c1 e0 05          	shl    rax,0x5
  803426:	48 05 b0 58 40 00    	add    rax,0x4058b0
  80342c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80342f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803433:	48 89 c7             	mov    rdi,rax
  803436:	ff d2                	call   rdx
  803438:	e9 fb 00 00 00       	jmp    803538 <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  80343d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803440:	48 63 d0             	movsxd rdx,eax
  803443:	48 89 d0             	mov    rax,rdx
  803446:	48 c1 e0 02          	shl    rax,0x2
  80344a:	48 01 d0             	add    rax,rdx
  80344d:	48 c1 e0 05          	shl    rax,0x5
  803451:	48 05 b8 58 40 00    	add    rax,0x4058b8
  803457:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80345a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80345e:	48 89 c7             	mov    rdi,rax
  803461:	ff d2                	call   rdx
  803463:	e9 d0 00 00 00       	jmp    803538 <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  803468:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80346b:	48 63 d0             	movsxd rdx,eax
  80346e:	48 89 d0             	mov    rax,rdx
  803471:	48 c1 e0 02          	shl    rax,0x2
  803475:	48 01 d0             	add    rax,rdx
  803478:	48 c1 e0 05          	shl    rax,0x5
  80347c:	48 05 c0 58 40 00    	add    rax,0x4058c0
  803482:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803485:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803489:	48 89 c7             	mov    rdi,rax
  80348c:	ff d2                	call   rdx
  80348e:	e9 a5 00 00 00       	jmp    803538 <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  803493:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803496:	48 63 d0             	movsxd rdx,eax
  803499:	48 89 d0             	mov    rax,rdx
  80349c:	48 c1 e0 02          	shl    rax,0x2
  8034a0:	48 01 d0             	add    rax,rdx
  8034a3:	48 c1 e0 05          	shl    rax,0x5
  8034a7:	48 05 c8 58 40 00    	add    rax,0x4058c8
  8034ad:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8034b0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034b4:	48 89 c7             	mov    rdi,rax
  8034b7:	ff d2                	call   rdx
  8034b9:	eb 7d                	jmp    803538 <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  8034bb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034be:	48 63 d0             	movsxd rdx,eax
  8034c1:	48 89 d0             	mov    rax,rdx
  8034c4:	48 c1 e0 02          	shl    rax,0x2
  8034c8:	48 01 d0             	add    rax,rdx
  8034cb:	48 c1 e0 05          	shl    rax,0x5
  8034cf:	48 05 d0 58 40 00    	add    rax,0x4058d0
  8034d5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8034d8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034dc:	48 89 c7             	mov    rdi,rax
  8034df:	ff d2                	call   rdx
  8034e1:	eb 55                	jmp    803538 <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  8034e3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034e6:	48 63 d0             	movsxd rdx,eax
  8034e9:	48 89 d0             	mov    rax,rdx
  8034ec:	48 c1 e0 02          	shl    rax,0x2
  8034f0:	48 01 d0             	add    rax,rdx
  8034f3:	48 c1 e0 05          	shl    rax,0x5
  8034f7:	48 05 d8 58 40 00    	add    rax,0x4058d8
  8034fd:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803500:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803504:	48 89 c7             	mov    rdi,rax
  803507:	ff d2                	call   rdx
  803509:	eb 2d                	jmp    803538 <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  80350b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80350e:	48 63 d0             	movsxd rdx,eax
  803511:	48 89 d0             	mov    rax,rdx
  803514:	48 c1 e0 02          	shl    rax,0x2
  803518:	48 01 d0             	add    rax,rdx
  80351b:	48 c1 e0 05          	shl    rax,0x5
  80351f:	48 05 e0 58 40 00    	add    rax,0x4058e0
  803525:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803528:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80352c:	48 89 c7             	mov    rdi,rax
  80352f:	ff d2                	call   rdx
  803531:	eb 05                	jmp    803538 <call_drv_func+0x255>
    }
    return -1;
  803533:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803538:	c9                   	leave  
  803539:	c3                   	ret    

000000000080353a <dispose_device>:
int dispose_device(int dev){
  80353a:	f3 0f 1e fa          	endbr64 
  80353e:	55                   	push   rbp
  80353f:	48 89 e5             	mov    rbp,rsp
  803542:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  803545:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803548:	48 63 d0             	movsxd rdx,eax
  80354b:	48 89 d0             	mov    rax,rdx
  80354e:	48 c1 e0 02          	shl    rax,0x2
  803552:	48 01 d0             	add    rax,rdx
  803555:	48 c1 e0 02          	shl    rax,0x2
  803559:	48 01 d0             	add    rax,rdx
  80355c:	48 c1 e0 03          	shl    rax,0x3
  803560:	48 05 90 2e 40 00    	add    rax,0x402e90
  803566:	8b 00                	mov    eax,DWORD PTR [rax]
  803568:	83 f8 01             	cmp    eax,0x1
  80356b:	74 07                	je     803574 <dispose_device+0x3a>
  80356d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803572:	eb 62                	jmp    8035d6 <dispose_device+0x9c>
    device* p=&devs[dev];
  803574:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803577:	48 63 d0             	movsxd rdx,eax
  80357a:	48 89 d0             	mov    rax,rdx
  80357d:	48 c1 e0 02          	shl    rax,0x2
  803581:	48 01 d0             	add    rax,rdx
  803584:	48 c1 e0 02          	shl    rax,0x2
  803588:	48 01 d0             	add    rax,rdx
  80358b:	48 c1 e0 03          	shl    rax,0x3
  80358f:	48 05 80 2e 40 00    	add    rax,0x402e80
  803595:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  803599:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80359d:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  8035a4:	48 85 c0             	test   rax,rax
  8035a7:	74 1d                	je     8035c6 <dispose_device+0x8c>
  8035a9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8035ad:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  8035b4:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8035b8:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  8035bf:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  8035c6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8035ca:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  8035d1:	b8 00 00 00 00       	mov    eax,0x0
}
  8035d6:	5d                   	pop    rbp
  8035d7:	c3                   	ret    

00000000008035d8 <dispose_driver>:
int dispose_driver(driver *drv){
  8035d8:	f3 0f 1e fa          	endbr64 
  8035dc:	55                   	push   rbp
  8035dd:	48 89 e5             	mov    rbp,rsp
  8035e0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  8035e4:	90                   	nop
  8035e5:	5d                   	pop    rbp
  8035e6:	c3                   	ret    

00000000008035e7 <get_dev>:

device *get_dev(int devi)
{
  8035e7:	f3 0f 1e fa          	endbr64 
  8035eb:	55                   	push   rbp
  8035ec:	48 89 e5             	mov    rbp,rsp
  8035ef:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  8035f2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8035f5:	48 63 d0             	movsxd rdx,eax
  8035f8:	48 89 d0             	mov    rax,rdx
  8035fb:	48 c1 e0 02          	shl    rax,0x2
  8035ff:	48 01 d0             	add    rax,rdx
  803602:	48 c1 e0 02          	shl    rax,0x2
  803606:	48 01 d0             	add    rax,rdx
  803609:	48 c1 e0 03          	shl    rax,0x3
  80360d:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  803613:	5d                   	pop    rbp
  803614:	c3                   	ret    

0000000000803615 <get_drv>:
driver *get_drv(int drvi)
{
  803615:	f3 0f 1e fa          	endbr64 
  803619:	55                   	push   rbp
  80361a:	48 89 e5             	mov    rbp,rsp
  80361d:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  803620:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803623:	48 63 d0             	movsxd rdx,eax
  803626:	48 89 d0             	mov    rax,rdx
  803629:	48 c1 e0 02          	shl    rax,0x2
  80362d:	48 01 d0             	add    rax,rdx
  803630:	48 c1 e0 05          	shl    rax,0x5
  803634:	48 05 80 58 40 00    	add    rax,0x405880
}
  80363a:	5d                   	pop    rbp
  80363b:	c3                   	ret    

000000000080363c <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  80363c:	f3 0f 1e fa          	endbr64 
  803640:	55                   	push   rbp
  803641:	48 89 e5             	mov    rbp,rsp
  803644:	53                   	push   rbx
  803645:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  803649:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  803650:	eb 23                	jmp    803675 <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803652:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803655:	48 63 d0             	movsxd rdx,eax
  803658:	48 89 d0             	mov    rax,rdx
  80365b:	48 01 c0             	add    rax,rax
  80365e:	48 01 d0             	add    rax,rdx
  803661:	48 c1 e0 06          	shl    rax,0x6
  803665:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  80366b:	8b 00                	mov    eax,DWORD PTR [rax]
  80366d:	85 c0                	test   eax,eax
  80366f:	74 0c                	je     80367d <make_request+0x41>
    for(;i<NR_REQS;i++)
  803671:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  803675:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  803679:	7e d7                	jle    803652 <make_request+0x16>
  80367b:	eb 01                	jmp    80367e <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  80367d:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  80367e:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  803682:	75 0a                	jne    80368e <make_request+0x52>
  803684:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803689:	e9 e7 01 00 00       	jmp    803875 <make_request+0x239>
    reqs[i]=*args;//放入数组
  80368e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803691:	48 63 d0             	movsxd rdx,eax
  803694:	48 89 d0             	mov    rax,rdx
  803697:	48 01 c0             	add    rax,rax
  80369a:	48 01 d0             	add    rax,rdx
  80369d:	48 c1 e0 06          	shl    rax,0x6
  8036a1:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8036a8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8036ac:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8036af:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  8036b3:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  8036b6:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8036ba:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8036be:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8036c2:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  8036c6:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  8036ca:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  8036ce:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  8036d2:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  8036d6:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  8036da:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  8036de:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  8036e2:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  8036e6:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  8036ea:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  8036ee:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  8036f2:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  8036f6:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  8036fa:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  8036fe:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  803702:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  803706:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  80370a:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  80370e:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  803712:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  803716:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  80371a:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  80371e:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  803722:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  803726:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  80372a:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  803731:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  803738:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  80373f:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  803746:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  80374d:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  803754:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  80375b:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  803762:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  803769:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  803770:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  803777:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  80377e:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  803785:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  80378c:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  803793:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  80379a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80379e:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  8037a4:	48 63 d0             	movsxd rdx,eax
  8037a7:	48 89 d0             	mov    rax,rdx
  8037aa:	48 c1 e0 02          	shl    rax,0x2
  8037ae:	48 01 d0             	add    rax,rdx
  8037b1:	48 c1 e0 02          	shl    rax,0x2
  8037b5:	48 01 d0             	add    rax,rdx
  8037b8:	48 c1 e0 03          	shl    rax,0x3
  8037bc:	48 05 80 2e 40 00    	add    rax,0x402e80
  8037c2:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  8037c6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8037ca:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8037d1:	48 85 c0             	test   rax,rax
  8037d4:	75 27                	jne    8037fd <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  8037d6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8037d9:	48 63 d0             	movsxd rdx,eax
  8037dc:	48 89 d0             	mov    rax,rdx
  8037df:	48 01 c0             	add    rax,rax
  8037e2:	48 01 d0             	add    rax,rdx
  8037e5:	48 c1 e0 06          	shl    rax,0x6
  8037e9:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8037f0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8037f4:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  8037fb:	eb 75                	jmp    803872 <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  8037fd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803801:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803808:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  80380c:	eb 0f                	jmp    80381d <make_request+0x1e1>
  80380e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803812:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803819:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  80381d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803821:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803828:	48 85 c0             	test   rax,rax
  80382b:	75 e1                	jne    80380e <make_request+0x1d2>
        p->next=&reqs[i];
  80382d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803830:	48 63 d0             	movsxd rdx,eax
  803833:	48 89 d0             	mov    rax,rdx
  803836:	48 01 c0             	add    rax,rax
  803839:	48 01 d0             	add    rax,rdx
  80383c:	48 c1 e0 06          	shl    rax,0x6
  803840:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803847:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80384b:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  803852:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803855:	48 63 d0             	movsxd rdx,eax
  803858:	48 89 d0             	mov    rax,rdx
  80385b:	48 01 c0             	add    rax,rax
  80385e:	48 01 d0             	add    rax,rdx
  803861:	48 c1 e0 06          	shl    rax,0x6
  803865:	48 05 38 6d 40 00    	add    rax,0x406d38
  80386b:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  803872:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  803875:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  803879:	c9                   	leave  
  80387a:	c3                   	ret    

000000000080387b <do_req>:
//取出一个申请并且执行
int do_req()
{
  80387b:	f3 0f 1e fa          	endbr64 
  80387f:	55                   	push   rbp
  803880:	48 89 e5             	mov    rbp,rsp
  803883:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  803887:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80388e:	e9 ab 00 00 00       	jmp    80393e <do_req+0xc3>
    {
        device* p=dev_tree[i];
  803893:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803896:	48 98                	cdqe   
  803898:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  80389f:	00 
  8038a0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  8038a4:	e9 86 00 00 00       	jmp    80392f <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  8038a9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038ad:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  8038b4:	48 85 c0             	test   rax,rax
  8038b7:	75 67                	jne    803920 <do_req+0xa5>
  8038b9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038bd:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8038c4:	48 85 c0             	test   rax,rax
  8038c7:	74 57                	je     803920 <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  8038c9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038cd:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  8038d4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038d8:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  8038df:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038e3:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8038ea:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  8038f1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038f5:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  8038fc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803900:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  803906:	48 98                	cdqe   
  803908:	48 8b 14 c5 80 9c 80 	mov    rdx,QWORD PTR [rax*8+0x809c80]
  80390f:	00 
  803910:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803914:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  80391b:	48 89 c7             	mov    rdi,rax
  80391e:	ff d2                	call   rdx
        for(;p;p=p->next)
  803920:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803924:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  80392b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80392f:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  803934:	0f 85 6f ff ff ff    	jne    8038a9 <do_req+0x2e>
    for(int i=0;i<3;i++)
  80393a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80393e:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  803942:	0f 8e 4b ff ff ff    	jle    803893 <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  803948:	b8 00 00 00 00       	mov    eax,0x0
}
  80394d:	c9                   	leave  
  80394e:	c3                   	ret    

000000000080394f <wait_on_req>:


void wait_on_req(int reqi)
{
  80394f:	f3 0f 1e fa          	endbr64 
  803953:	55                   	push   rbp
  803954:	48 89 e5             	mov    rbp,rsp
  803957:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  80395a:	90                   	nop
  80395b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80395e:	48 63 d0             	movsxd rdx,eax
  803961:	48 89 d0             	mov    rax,rdx
  803964:	48 01 c0             	add    rax,rax
  803967:	48 01 d0             	add    rax,rdx
  80396a:	48 c1 e0 06          	shl    rax,0x6
  80396e:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  803974:	8b 00                	mov    eax,DWORD PTR [rax]
  803976:	83 f8 03             	cmp    eax,0x3
  803979:	75 e0                	jne    80395b <wait_on_req+0xc>
}
  80397b:	90                   	nop
  80397c:	90                   	nop
  80397d:	5d                   	pop    rbp
  80397e:	c3                   	ret    

000000000080397f <clear_req>:
void clear_req(int reqi)
{
  80397f:	f3 0f 1e fa          	endbr64 
  803983:	55                   	push   rbp
  803984:	48 89 e5             	mov    rbp,rsp
  803987:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  80398a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80398d:	48 63 d0             	movsxd rdx,eax
  803990:	48 89 d0             	mov    rax,rdx
  803993:	48 01 c0             	add    rax,rax
  803996:	48 01 d0             	add    rax,rdx
  803999:	48 c1 e0 06          	shl    rax,0x6
  80399d:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  8039a3:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  8039a9:	90                   	nop
  8039aa:	5d                   	pop    rbp
  8039ab:	c3                   	ret    

00000000008039ac <init_proc>:
struct process task[MAX_PROC_COUNT];
TSS scene_saver;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  8039ac:	f3 0f 1e fa          	endbr64 
  8039b0:	55                   	push   rbp
  8039b1:	48 89 e5             	mov    rbp,rsp
  8039b4:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  8039b8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8039bf:	eb 4c                	jmp    803a0d <init_proc+0x61>
        task[i].pid=-1;
  8039c1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039c4:	48 98                	cdqe   
  8039c6:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  8039cd:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8039d3:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  8039d9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039dc:	48 98                	cdqe   
  8039de:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  8039e5:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8039eb:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  8039f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039f4:	48 98                	cdqe   
  8039f6:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  8039fd:	48 05 28 85 40 00    	add    rax,0x408528
  803a03:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803a09:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803a0d:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803a11:	7e ae                	jle    8039c1 <init_proc+0x15>
    }
    cur_proc=0;//no proc
  803a13:	c7 05 ef d6 c0 ff 00 	mov    DWORD PTR [rip+0xffffffffffc0d6ef],0x0        # 41110c <cur_proc>
  803a1a:	00 00 00 
    pidd=1;
  803a1d:	c7 05 e9 d6 c0 ff 01 	mov    DWORD PTR [rip+0xffffffffffc0d6e9],0x1        # 411110 <pidd>
  803a24:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  803a27:	b8 00 00 00 00       	mov    eax,0x0
  803a2c:	e8 38 00 00 00       	call   803a69 <create_proc>
  803a31:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  803a34:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803a37:	48 98                	cdqe   
  803a39:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803a40:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803a46:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  803a4c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803a4f:	83 c0 03             	add    eax,0x3
  803a52:	c1 e0 04             	shl    eax,0x4
  803a55:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  803a58:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803a5b:	01 c0                	add    eax,eax
  803a5d:	83 c0 05             	add    eax,0x5
  803a60:	c1 e0 03             	shl    eax,0x3
  803a63:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
}
  803a66:	90                   	nop
  803a67:	c9                   	leave  
  803a68:	c3                   	ret    

0000000000803a69 <create_proc>:

int create_proc()
{
  803a69:	f3 0f 1e fa          	endbr64 
  803a6d:	55                   	push   rbp
  803a6e:	48 89 e5             	mov    rbp,rsp
  803a71:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  803a75:	b8 00 00 00 00       	mov    eax,0x0
  803a7a:	e8 62 00 00 00       	call   803ae1 <req_proc>
  803a7f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  803a82:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  803a86:	75 07                	jne    803a8f <create_proc+0x26>
  803a88:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803a8d:	eb 50                	jmp    803adf <create_proc+0x76>
    int curesp=0x9fc00-1;
  803a8f:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%esp,%0":"=m"(curesp));
  803a96:	89 65 f8             	mov    DWORD PTR [rbp-0x8],esp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0,0,0,0,0x17,0xf,0x17,0x17,0x17,0x17,curesp,0,0,0,0,index);
  803a99:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803a9c:	48 98                	cdqe   
  803a9e:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  803aa1:	52                   	push   rdx
  803aa2:	6a 00                	push   0x0
  803aa4:	6a 00                	push   0x0
  803aa6:	6a 00                	push   0x0
  803aa8:	6a 00                	push   0x0
  803aaa:	50                   	push   rax
  803aab:	6a 17                	push   0x17
  803aad:	6a 17                	push   0x17
  803aaf:	6a 17                	push   0x17
  803ab1:	6a 17                	push   0x17
  803ab3:	41 b9 0f 00 00 00    	mov    r9d,0xf
  803ab9:	41 b8 17 00 00 00    	mov    r8d,0x17
  803abf:	b9 00 00 00 00       	mov    ecx,0x0
  803ac4:	ba 00 00 00 00       	mov    edx,0x0
  803ac9:	be 00 00 00 00       	mov    esi,0x0
  803ace:	bf 00 00 00 00       	mov    edi,0x0
  803ad3:	e8 d5 00 00 00       	call   803bad <set_proc>
  803ad8:	48 83 c4 50          	add    rsp,0x50
//    task[index].tss.eip=(long)proc_zero;

    return index;
  803adc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803adf:	c9                   	leave  
  803ae0:	c3                   	ret    

0000000000803ae1 <req_proc>:
int req_proc(){
  803ae1:	f3 0f 1e fa          	endbr64 
  803ae5:	55                   	push   rbp
  803ae6:	48 89 e5             	mov    rbp,rsp
    int num=0;
  803ae9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803af0:	eb 04                	jmp    803af6 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  803af2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803af6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803af9:	48 98                	cdqe   
  803afb:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803b02:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803b08:	8b 00                	mov    eax,DWORD PTR [rax]
  803b0a:	83 f8 ff             	cmp    eax,0xffffffff
  803b0d:	74 1f                	je     803b2e <req_proc+0x4d>
  803b0f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b12:	48 98                	cdqe   
  803b14:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803b1b:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803b21:	8b 00                	mov    eax,DWORD PTR [rax]
  803b23:	83 f8 03             	cmp    eax,0x3
  803b26:	74 06                	je     803b2e <req_proc+0x4d>
  803b28:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803b2c:	7e c4                	jle    803af2 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  803b2e:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803b32:	7e 07                	jle    803b3b <req_proc+0x5a>
        return -1;
  803b34:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803b39:	eb 70                	jmp    803bab <req_proc+0xca>
    task[num].pid=pidd++;
  803b3b:	8b 05 cf d5 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d5cf]        # 411110 <pidd>
  803b41:	8d 50 01             	lea    edx,[rax+0x1]
  803b44:	89 15 c6 d5 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0d5c6],edx        # 411110 <pidd>
  803b4a:	89 c2                	mov    edx,eax
  803b4c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b4f:	48 98                	cdqe   
  803b51:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803b58:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803b5e:	89 10                	mov    DWORD PTR [rax],edx
    task[num].stat=ENDED;
  803b60:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b63:	48 98                	cdqe   
  803b65:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803b6c:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803b72:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  803b78:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b7b:	48 98                	cdqe   
  803b7d:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803b84:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803b8a:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803b90:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b93:	48 98                	cdqe   
  803b95:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803b9c:	48 05 ac 84 40 00    	add    rax,0x4084ac
  803ba2:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  803ba8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803bab:	5d                   	pop    rbp
  803bac:	c3                   	ret    

0000000000803bad <set_proc>:
void set_proc(long eax,long ebx,long ecx,long edx,long es,long cs,long ss,long ds,long fs,long gs\
,long esp,long ebp,long esi,long edi,long eflags,int proc_nr){
  803bad:	f3 0f 1e fa          	endbr64 
  803bb1:	55                   	push   rbp
  803bb2:	48 89 e5             	mov    rbp,rsp
  803bb5:	48 83 ec 40          	sub    rsp,0x40
  803bb9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803bbd:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803bc1:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803bc5:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803bc9:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  803bcd:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803bd1:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
  803bd4:	48 98                	cdqe   
  803bd6:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803bdd:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803be3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //在gdt中添加tss
//    fill_desc(&proc->tss,0xffff,SEG_SYS_TSS|SEG_PRESENT,_TSS_IND(proc_nr));
//    //添加ldt
//    fill_desc(proc->ldt, sizeof(proc->ldt),SEG_SYS_LDT|SEG_PRESENT, _LDT_IND(proc_nr));
    //设置ldt
    fill_ldt_desc(0,0xffffffff,\
  803be7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803beb:	48 83 c0 34          	add    rax,0x34
  803bef:	48 89 c1             	mov    rcx,rax
  803bf2:	ba fe cf 00 00       	mov    edx,0xcffe
  803bf7:	be ff ff ff ff       	mov    esi,0xffffffff
  803bfc:	bf 00 00 00 00       	mov    edi,0x0
  803c01:	e8 76 0d 00 00       	call   80497c <fill_ldt_desc>
    SEG_CONFORMING_RW_CODE|SEG_DPL_3,&proc->ldt[0]);
    fill_ldt_desc(0,0xffffffff,\
  803c06:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c0a:	48 83 c0 44          	add    rax,0x44
  803c0e:	48 89 c1             	mov    rcx,rax
  803c11:	ba f2 cf 00 00       	mov    edx,0xcff2
  803c16:	be ff ff ff ff       	mov    esi,0xffffffff
  803c1b:	bf 00 00 00 00       	mov    edi,0x0
  803c20:	e8 57 0d 00 00       	call   80497c <fill_ldt_desc>
    SEG_RW_DATA|SEG_DPL_3,&proc->ldt[1]);
    fill_ldt_desc(0x1c00000-0x1000,0x1000,\
  803c25:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803c29:	48 83 c0 54          	add    rax,0x54
  803c2d:	48 89 c1             	mov    rcx,rax
  803c30:	ba f6 00 00 00       	mov    edx,0xf6
  803c35:	be 00 10 00 00       	mov    esi,0x1000
  803c3a:	bf 00 f0 bf 01       	mov    edi,0x1bff000
  803c3f:	e8 38 0d 00 00       	call   80497c <fill_ldt_desc>
    SEG_STACK|SEG_DPL_3,&proc->ldt[2]);

}
  803c44:	90                   	nop
  803c45:	c9                   	leave  
  803c46:	c3                   	ret    

0000000000803c47 <proc_zero>:
void proc_zero()
{
  803c47:	f3 0f 1e fa          	endbr64 
  803c4b:	55                   	push   rbp
  803c4c:	48 89 e5             	mov    rbp,rsp

    while(1);
  803c4f:	eb fe                	jmp    803c4f <proc_zero+0x8>

0000000000803c51 <manage_proc>:
}
void manage_proc(){
  803c51:	f3 0f 1e fa          	endbr64 
  803c55:	55                   	push   rbp
  803c56:	48 89 e5             	mov    rbp,rsp
  803c59:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803c5d:	8b 05 a9 d4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d4a9]        # 41110c <cur_proc>
  803c63:	83 f8 ff             	cmp    eax,0xffffffff
  803c66:	74 2d                	je     803c95 <manage_proc+0x44>
        task[cur_proc].utime++;
  803c68:	8b 05 9e d4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d49e]        # 41110c <cur_proc>
  803c6e:	48 63 d0             	movsxd rdx,eax
  803c71:	48 69 d2 30 02 00 00 	imul   rdx,rdx,0x230
  803c78:	48 81 c2 a8 84 40 00 	add    rdx,0x4084a8
  803c7f:	8b 12                	mov    edx,DWORD PTR [rdx]
  803c81:	83 c2 01             	add    edx,0x1
  803c84:	48 98                	cdqe   
  803c86:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803c8d:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803c93:	89 10                	mov    DWORD PTR [rax],edx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803c95:	8b 05 71 d4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d471]        # 41110c <cur_proc>
  803c9b:	83 f8 ff             	cmp    eax,0xffffffff
  803c9e:	74 3c                	je     803cdc <manage_proc+0x8b>
  803ca0:	8b 05 66 d4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d466]        # 41110c <cur_proc>
  803ca6:	48 98                	cdqe   
  803ca8:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803caf:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803cb5:	8b 00                	mov    eax,DWORD PTR [rax]
  803cb7:	83 f8 01             	cmp    eax,0x1
  803cba:	77 20                	ja     803cdc <manage_proc+0x8b>
    task[cur_proc].stat!=READY){
  803cbc:	8b 05 4a d4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d44a]        # 41110c <cur_proc>
  803cc2:	48 98                	cdqe   
  803cc4:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803ccb:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803cd1:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803cd3:	83 f8 01             	cmp    eax,0x1
  803cd6:	0f 84 90 00 00 00    	je     803d6c <manage_proc+0x11b>
        if(cur_proc!=-1)
  803cdc:	8b 05 2a d4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d42a]        # 41110c <cur_proc>
  803ce2:	83 f8 ff             	cmp    eax,0xffffffff
  803ce5:	74 1b                	je     803d02 <manage_proc+0xb1>
            task[cur_proc].utime=0;
  803ce7:	8b 05 1f d4 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d41f]        # 41110c <cur_proc>
  803ced:	48 98                	cdqe   
  803cef:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803cf6:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803cfc:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=0;
  803d02:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  803d09:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803d10:	eb 41                	jmp    803d53 <manage_proc+0x102>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  803d12:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d15:	48 98                	cdqe   
  803d17:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803d1e:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d24:	8b 00                	mov    eax,DWORD PTR [rax]
  803d26:	83 f8 ff             	cmp    eax,0xffffffff
  803d29:	74 24                	je     803d4f <manage_proc+0xfe>
  803d2b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d2e:	48 98                	cdqe   
  803d30:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803d37:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803d3d:	8b 00                	mov    eax,DWORD PTR [rax]
  803d3f:	83 f8 01             	cmp    eax,0x1
  803d42:	75 0b                	jne    803d4f <manage_proc+0xfe>
  803d44:	8b 05 c2 d3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d3c2]        # 41110c <cur_proc>
  803d4a:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  803d4d:	75 0c                	jne    803d5b <manage_proc+0x10a>
        for(i=0;i<MAX_PROC_COUNT;i++){
  803d4f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803d53:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803d57:	7e b9                	jle    803d12 <manage_proc+0xc1>
  803d59:	eb 01                	jmp    803d5c <manage_proc+0x10b>
                break;
  803d5b:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  803d5c:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803d60:	7f 0d                	jg     803d6f <manage_proc+0x11e>
            return;
        //switch
        switch_proc_tss(i);
  803d62:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d65:	89 c7                	mov    edi,eax
  803d67:	e8 06 00 00 00       	call   803d72 <switch_proc_tss>
    }
    return;
  803d6c:	90                   	nop
  803d6d:	eb 01                	jmp    803d70 <manage_proc+0x11f>
            return;
  803d6f:	90                   	nop
}
  803d70:	c9                   	leave  
  803d71:	c3                   	ret    

0000000000803d72 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  803d72:	f3 0f 1e fa          	endbr64 
  803d76:	55                   	push   rbp
  803d77:	48 89 e5             	mov    rbp,rsp
  803d7a:	48 83 ec 20          	sub    rsp,0x20
  803d7e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  803d81:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803d84:	01 c0                	add    eax,eax
  803d86:	83 c0 05             	add    eax,0x5
  803d89:	c1 e0 03             	shl    eax,0x3
  803d8c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  803d8f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803d92:	89 05 74 d3 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0d374],eax        # 41110c <cur_proc>
    switch_proc_asm(sel);
  803d98:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d9b:	89 c7                	mov    edi,eax
  803d9d:	e8 a8 5d 00 00       	call   809b4a <switch_proc_asm>
}
  803da2:	90                   	nop
  803da3:	c9                   	leave  
  803da4:	c3                   	ret    

0000000000803da5 <switch_proc>:
void switch_proc(int pnr){
  803da5:	f3 0f 1e fa          	endbr64 
  803da9:	55                   	push   rbp
  803daa:	48 89 e5             	mov    rbp,rsp
  803dad:	48 81 ec 50 02 00 00 	sub    rsp,0x250
  803db4:	89 bd bc fd ff ff    	mov    DWORD PTR [rbp-0x244],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  803dba:	8b 85 bc fd ff ff    	mov    eax,DWORD PTR [rbp-0x244]
  803dc0:	48 98                	cdqe   
  803dc2:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803dc9:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  803dd0:	48 8d 85 c0 fd ff ff 	lea    rax,[rbp-0x240]
  803dd7:	48 89 d6             	mov    rsi,rdx
  803dda:	ba 46 00 00 00       	mov    edx,0x46
  803ddf:	48 89 c7             	mov    rdi,rax
  803de2:	48 89 d1             	mov    rcx,rdx
  803de5:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    save_context(&task[cur_proc].tss);
  803de8:	8b 05 1e d3 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0d31e]        # 41110c <cur_proc>
  803dee:	48 98                	cdqe   
  803df0:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803df7:	48 05 c0 01 00 00    	add    rax,0x1c0
  803dfd:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803e03:	48 83 c0 04          	add    rax,0x4
  803e07:	48 89 c7             	mov    rdi,rax
  803e0a:	e8 47 00 00 00       	call   803e56 <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  803e0f:	8b 85 bc fd ff ff    	mov    eax,DWORD PTR [rbp-0x244]
  803e15:	89 05 f1 d2 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0d2f1],eax        # 41110c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  803e1b:	8b 85 bc fd ff ff    	mov    eax,DWORD PTR [rbp-0x244]
  803e21:	01 c0                	add    eax,eax
  803e23:	83 c0 05             	add    eax,0x5
  803e26:	c1 e0 03             	shl    eax,0x3
  803e29:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(&task[pnr].tss);
  803e2c:	8b 85 bc fd ff ff    	mov    eax,DWORD PTR [rbp-0x244]
  803e32:	48 98                	cdqe   
  803e34:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803e3b:	48 05 c0 01 00 00    	add    rax,0x1c0
  803e41:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803e47:	48 83 c0 04          	add    rax,0x4
  803e4b:	48 89 c7             	mov    rdi,rax
  803e4e:	e8 1e 09 00 00       	call   804771 <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  803e53:	90                   	nop
  803e54:	c9                   	leave  
  803e55:	c3                   	ret    

0000000000803e56 <save_context>:
void save_context(TSS *tss)
{
  803e56:	f3 0f 1e fa          	endbr64 
  803e5a:	55                   	push   rbp
  803e5b:	48 89 e5             	mov    rbp,rsp
  803e5e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  803e62:	90                   	nop
  803e63:	5d                   	pop    rbp
  803e64:	c3                   	ret    

0000000000803e65 <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  803e65:	f3 0f 1e fa          	endbr64 
  803e69:	55                   	push   rbp
  803e6a:	48 89 e5             	mov    rbp,rsp
  803e6d:	48 83 ec 60          	sub    rsp,0x60
  803e71:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  803e74:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  803e77:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803e7a:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  803e80:	85 c0                	test   eax,eax
  803e82:	0f 48 c2             	cmovs  eax,edx
  803e85:	c1 f8 0c             	sar    eax,0xc
  803e88:	89 c1                	mov    ecx,eax
  803e8a:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  803e8d:	99                   	cdq    
  803e8e:	c1 ea 14             	shr    edx,0x14
  803e91:	01 d0                	add    eax,edx
  803e93:	25 ff 0f 00 00       	and    eax,0xfff
  803e98:	29 d0                	sub    eax,edx
  803e9a:	01 c8                	add    eax,ecx
  803e9c:	85 c0                	test   eax,eax
  803e9e:	0f 95 c0             	setne  al
  803ea1:	0f b6 c0             	movzx  eax,al
  803ea4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  803ea7:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  803eae:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  803eb5:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  803eb6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  803ebd:	00 
    pgind++;
  803ebe:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  803ec3:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  803eca:	e9 30 02 00 00       	jmp    8040ff <palloc+0x29a>
    {
        page_item* tblp=*pgind&0xfffff000;
  803ecf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803ed3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803ed6:	25 00 f0 ff ff       	and    eax,0xfffff000
  803edb:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  803edf:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  803ee6:	e9 fe 01 00 00       	jmp    8040e9 <palloc+0x284>
        {
            int v=*tblp&PAGE_PRESENT;
  803eeb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803eef:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803ef2:	83 e0 01             	and    eax,0x1
  803ef5:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  803ef8:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  803efc:	0f 85 de 01 00 00    	jne    8040e0 <palloc+0x27b>
            {
                int new_pg=req_a_page();
  803f02:	b8 00 00 00 00       	mov    eax,0x0
  803f07:	e8 e9 d4 ff ff       	call   8013f5 <req_a_page>
  803f0c:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  803f0f:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  803f13:	0f 85 b9 00 00 00    	jne    803fd2 <palloc+0x16d>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  803f19:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f1c:	48 98                	cdqe   
  803f1e:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803f25:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803f2b:	0f b7 00             	movzx  eax,WORD PTR [rax]
  803f2e:	0f b7 c0             	movzx  eax,ax
  803f31:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  803f34:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f37:	48 98                	cdqe   
  803f39:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803f40:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803f46:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803f4a:	0f b7 c0             	movzx  eax,ax
  803f4d:	c1 e0 10             	shl    eax,0x10
  803f50:	25 00 00 0f 00       	and    eax,0xf0000
  803f55:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  803f58:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803f5b:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  803f5e:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803f61:	89 c2                	mov    edx,eax
  803f63:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f66:	48 98                	cdqe   
  803f68:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803f6f:	48 05 f4 84 40 00    	add    rax,0x4084f4
  803f75:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  803f78:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803f7b:	48 98                	cdqe   
  803f7d:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803f84:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803f8a:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  803f8e:	0f b7 c0             	movzx  eax,ax
  803f91:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  803f94:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  803f9b:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  803f9e:	c1 e8 10             	shr    eax,0x10
  803fa1:	83 e0 0f             	and    eax,0xf
  803fa4:	89 c2                	mov    edx,eax
  803fa6:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  803fa9:	01 d0                	add    eax,edx
  803fab:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  803fae:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  803fb1:	89 c2                	mov    edx,eax
  803fb3:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  803fb6:	48 98                	cdqe   
  803fb8:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  803fbf:	48 05 f0 84 40 00    	add    rax,0x4084f0
  803fc5:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  803fc9:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803fcd:	e9 3f 01 00 00       	jmp    804111 <palloc+0x2ac>
                }
                int addr=get_phyaddr(new_pg);
  803fd2:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  803fd5:	89 c7                	mov    edi,eax
  803fd7:	e8 c7 d5 ff ff       	call   8015a3 <get_phyaddr>
  803fdc:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  803fdf:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  803fe2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803fe6:	ba 07 00 00 00       	mov    edx,0x7
  803feb:	89 ce                	mov    esi,ecx
  803fed:	48 89 c7             	mov    rdi,rax
  803ff0:	e8 c1 d5 ff ff       	call   8015b6 <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  803ff5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803ff8:	c1 e0 0a             	shl    eax,0xa
  803ffb:	89 c2                	mov    edx,eax
  803ffd:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804000:	01 d0                	add    eax,edx
  804002:	c1 e0 0c             	shl    eax,0xc
  804005:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  804008:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  80400d:	75 09                	jne    804018 <palloc+0x1b3>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  80400f:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  804012:	89 05 fc d0 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0d0fc],eax        # 411114 <palloc_paddr>
                }
                page_c--;
  804018:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  80401c:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  804020:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  804024:	0f 85 b6 00 00 00    	jne    8040e0 <palloc+0x27b>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  80402a:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80402d:	48 98                	cdqe   
  80402f:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  804036:	48 05 f4 84 40 00    	add    rax,0x4084f4
  80403c:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80403f:	0f b7 c0             	movzx  eax,ax
  804042:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804045:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804048:	48 98                	cdqe   
  80404a:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  804051:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804057:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80405b:	0f b7 c0             	movzx  eax,ax
  80405e:	c1 e0 10             	shl    eax,0x10
  804061:	25 00 00 0f 00       	and    eax,0xf0000
  804066:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  804069:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80406c:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  80406f:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804072:	89 c2                	mov    edx,eax
  804074:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804077:	48 98                	cdqe   
  804079:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  804080:	48 05 f4 84 40 00    	add    rax,0x4084f4
  804086:	66 89 10             	mov    WORD PTR [rax],dx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  804089:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80408c:	48 98                	cdqe   
  80408e:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  804095:	48 05 f0 84 40 00    	add    rax,0x4084f0
  80409b:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80409f:	0f b7 c0             	movzx  eax,ax
  8040a2:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  8040a5:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  8040ac:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8040af:	c1 e8 10             	shr    eax,0x10
  8040b2:	83 e0 0f             	and    eax,0xf
  8040b5:	89 c2                	mov    edx,eax
  8040b7:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8040ba:	01 d0                	add    eax,edx
  8040bc:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  8040bf:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  8040c2:	89 c2                	mov    edx,eax
  8040c4:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8040c7:	48 98                	cdqe   
  8040c9:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  8040d0:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8040d6:	66 89 50 09          	mov    WORD PTR [rax+0x9],dx
                    return ptr;
  8040da:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8040de:	eb 31                	jmp    804111 <palloc+0x2ac>
                }
            }
            tblp++;
  8040e0:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  8040e5:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  8040e9:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  8040f0:	0f 8e f5 fd ff ff    	jle    803eeb <palloc+0x86>
        }
        pgind++;
  8040f6:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  8040fb:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8040ff:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804106:	0f 8e c3 fd ff ff    	jle    803ecf <palloc+0x6a>
    }
    return NULL;
  80410c:	b8 00 00 00 00       	mov    eax,0x0
}
  804111:	c9                   	leave  
  804112:	c3                   	ret    

0000000000804113 <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  804113:	f3 0f 1e fa          	endbr64 
  804117:	55                   	push   rbp
  804118:	48 89 e5             	mov    rbp,rsp
  80411b:	48 83 ec 10          	sub    rsp,0x10
  80411f:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  804122:	8b 05 e4 cf c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cfe4]        # 41110c <cur_proc>
  804128:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80412b:	89 d6                	mov    esi,edx
  80412d:	89 c7                	mov    edi,eax
  80412f:	e8 31 fd ff ff       	call   803e65 <palloc>
}
  804134:	c9                   	leave  
  804135:	c3                   	ret    

0000000000804136 <proc_end>:
void proc_end()
{
  804136:	f3 0f 1e fa          	endbr64 
  80413a:	55                   	push   rbp
  80413b:	48 89 e5             	mov    rbp,rsp
  80413e:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  804142:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  804145:	8b 05 c1 cf c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cfc1]        # 41110c <cur_proc>
  80414b:	89 c7                	mov    edi,eax
  80414d:	e8 75 00 00 00       	call   8041c7 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  804152:	8b 05 b4 cf c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cfb4]        # 41110c <cur_proc>
  804158:	48 98                	cdqe   
  80415a:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  804161:	48 05 28 85 40 00    	add    rax,0x408528
  804167:	8b 00                	mov    eax,DWORD PTR [rax]
  804169:	83 f8 ff             	cmp    eax,0xffffffff
  80416c:	74 4c                	je     8041ba <proc_end+0x84>
        task[task[cur_proc].parent_pid].stat=READY;
  80416e:	8b 05 98 cf c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cf98]        # 41110c <cur_proc>
  804174:	48 98                	cdqe   
  804176:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  80417d:	48 05 28 85 40 00    	add    rax,0x408528
  804183:	8b 00                	mov    eax,DWORD PTR [rax]
  804185:	89 c0                	mov    eax,eax
  804187:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  80418e:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804194:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  80419a:	8b 05 6c cf c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cf6c]        # 41110c <cur_proc>
  8041a0:	48 98                	cdqe   
  8041a2:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  8041a9:	48 05 28 85 40 00    	add    rax,0x408528
  8041af:	8b 00                	mov    eax,DWORD PTR [rax]
  8041b1:	89 c7                	mov    edi,eax
  8041b3:	e8 ba fb ff ff       	call   803d72 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  8041b8:	eb 0a                	jmp    8041c4 <proc_end+0x8e>
        switch_proc_tss(0);
  8041ba:	bf 00 00 00 00       	mov    edi,0x0
  8041bf:	e8 ae fb ff ff       	call   803d72 <switch_proc_tss>
}
  8041c4:	90                   	nop
  8041c5:	c9                   	leave  
  8041c6:	c3                   	ret    

00000000008041c7 <del_proc>:
void del_proc(int pnr)
{
  8041c7:	f3 0f 1e fa          	endbr64 
  8041cb:	55                   	push   rbp
  8041cc:	48 89 e5             	mov    rbp,rsp
  8041cf:	48 83 ec 30          	sub    rsp,0x30
  8041d3:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  8041d6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8041d9:	48 98                	cdqe   
  8041db:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  8041e2:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8041e8:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  8041ee:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8041f1:	48 98                	cdqe   
  8041f3:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  8041fa:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804200:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  804206:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  80420b:	eb 63                	jmp    804270 <del_proc+0xa9>
    {
        page_item *tp=*p&0xfffff000;
  80420d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804211:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804214:	25 00 f0 ff ff       	and    eax,0xfffff000
  804219:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  80421d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804224:	eb 30                	jmp    804256 <del_proc+0x8f>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  804226:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80422a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80422d:	83 e0 01             	and    eax,0x1
  804230:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  804233:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  804237:	74 14                	je     80424d <del_proc+0x86>
            {
                free_page(*tp&0xfffff000);
  804239:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80423d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804240:	25 00 f0 ff ff       	and    eax,0xfffff000
  804245:	48 89 c7             	mov    rdi,rax
  804248:	e8 78 d2 ff ff       	call   8014c5 <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  80424d:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  804252:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804256:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  80425d:	7e c7                	jle    804226 <del_proc+0x5f>
        }
        vmfree(tp);
  80425f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804263:	48 89 c7             	mov    rdi,rax
  804266:	e8 8c ce ff ff       	call   8010f7 <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  80426b:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  804270:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804274:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804277:	83 e0 01             	and    eax,0x1
  80427a:	48 85 c0             	test   rax,rax
  80427d:	75 8e                	jne    80420d <del_proc+0x46>
    }
    //释放存放页目录的页面
    vmfree(p);
  80427f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804283:	48 89 c7             	mov    rdi,rax
  804286:	e8 6c ce ff ff       	call   8010f7 <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  80428b:	90                   	nop
  80428c:	c9                   	leave  
  80428d:	c3                   	ret    

000000000080428e <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  80428e:	f3 0f 1e fa          	endbr64 
  804292:	55                   	push   rbp
  804293:	48 89 e5             	mov    rbp,rsp
  804296:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804299:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  80429c:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8042a0:	75 07                	jne    8042a9 <set_proc_stat+0x1b>
  8042a2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8042a7:	eb 79                	jmp    804322 <set_proc_stat+0x94>
    int i=0;
  8042a9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  8042b0:	eb 04                	jmp    8042b6 <set_proc_stat+0x28>
  8042b2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8042b6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8042b9:	48 98                	cdqe   
  8042bb:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  8042c2:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8042c8:	8b 10                	mov    edx,DWORD PTR [rax]
  8042ca:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8042cd:	39 c2                	cmp    edx,eax
  8042cf:	75 e1                	jne    8042b2 <set_proc_stat+0x24>
    if(i==MAX_PROC_COUNT)return -1;
  8042d1:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8042d5:	75 07                	jne    8042de <set_proc_stat+0x50>
  8042d7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8042dc:	eb 44                	jmp    804322 <set_proc_stat+0x94>
    task[i].stat=stat;
  8042de:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8042e1:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8042e4:	48 63 d2             	movsxd rdx,edx
  8042e7:	48 69 d2 30 02 00 00 	imul   rdx,rdx,0x230
  8042ee:	48 81 c2 a4 84 40 00 	add    rdx,0x4084a4
  8042f5:	89 02                	mov    DWORD PTR [rdx],eax
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  8042f7:	8b 05 0f ce c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ce0f]        # 41110c <cur_proc>
  8042fd:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804300:	75 1b                	jne    80431d <set_proc_stat+0x8f>
        task[cur_proc].utime=MAX_UTIME;
  804302:	8b 05 04 ce c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ce04]        # 41110c <cur_proc>
  804308:	48 98                	cdqe   
  80430a:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  804311:	48 05 a8 84 40 00    	add    rax,0x4084a8
  804317:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  80431d:	b8 00 00 00 00       	mov    eax,0x0
}
  804322:	5d                   	pop    rbp
  804323:	c3                   	ret    

0000000000804324 <add_proc_openf>:

    return 0;
} */

int add_proc_openf(vfs_dir_entry *entry)
{
  804324:	f3 0f 1e fa          	endbr64 
  804328:	55                   	push   rbp
  804329:	48 89 e5             	mov    rbp,rsp
  80432c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804330:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  804337:	eb 56                	jmp    80438f <add_proc_openf+0x6b>
        if(task[cur_proc].openf[i]==NULL)
  804339:	8b 05 cd cd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cdcd]        # 41110c <cur_proc>
  80433f:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804342:	48 63 d2             	movsxd rdx,edx
  804345:	48 98                	cdqe   
  804347:	48 6b c0 46          	imul   rax,rax,0x46
  80434b:	48 01 d0             	add    rax,rdx
  80434e:	48 83 c0 18          	add    rax,0x18
  804352:	48 8b 04 c5 a4 84 40 	mov    rax,QWORD PTR [rax*8+0x4084a4]
  804359:	00 
  80435a:	48 85 c0             	test   rax,rax
  80435d:	75 2c                	jne    80438b <add_proc_openf+0x67>
        {
            task[cur_proc].openf[i]=entry;
  80435f:	8b 05 a7 cd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cda7]        # 41110c <cur_proc>
  804365:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804368:	48 63 d2             	movsxd rdx,edx
  80436b:	48 98                	cdqe   
  80436d:	48 6b c0 46          	imul   rax,rax,0x46
  804371:	48 01 d0             	add    rax,rdx
  804374:	48 8d 50 18          	lea    rdx,[rax+0x18]
  804378:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80437c:	48 89 04 d5 a4 84 40 	mov    QWORD PTR [rdx*8+0x4084a4],rax
  804383:	00 
            return 0;
  804384:	b8 00 00 00 00       	mov    eax,0x0
  804389:	eb 0f                	jmp    80439a <add_proc_openf+0x76>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  80438b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80438f:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  804393:	7e a4                	jle    804339 <add_proc_openf+0x15>
        }
    }
    return -1;//full
  804395:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80439a:	5d                   	pop    rbp
  80439b:	c3                   	ret    

000000000080439c <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  80439c:	f3 0f 1e fa          	endbr64 
  8043a0:	55                   	push   rbp
  8043a1:	48 89 e5             	mov    rbp,rsp
  8043a4:	48 83 ec 10          	sub    rsp,0x10
  8043a8:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  8043ab:	8b 05 5b cd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cd5b]        # 41110c <cur_proc>
  8043b1:	89 c7                	mov    edi,eax
  8043b3:	e8 0f fe ff ff       	call   8041c7 <del_proc>
    return code;
  8043b8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8043bb:	c9                   	leave  
  8043bc:	c3                   	ret    

00000000008043bd <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(int entry, vfs_dir_entry *cwd, vfs_dir_entry *exef)
{
  8043bd:	f3 0f 1e fa          	endbr64 
  8043c1:	55                   	push   rbp
  8043c2:	48 89 e5             	mov    rbp,rsp
  8043c5:	48 83 ec 40          	sub    rsp,0x40
  8043c9:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  8043cc:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  8043d0:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    
    int i=req_proc();
  8043d4:	b8 00 00 00 00       	mov    eax,0x0
  8043d9:	e8 03 f7 ff ff       	call   803ae1 <req_proc>
  8043de:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(i==-1)return -1;
  8043e1:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8043e5:	75 0a                	jne    8043f1 <reg_proc+0x34>
  8043e7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8043ec:	e9 39 01 00 00       	jmp    80452a <reg_proc+0x16d>
    /*set_proc(0,0,0,0,SEL_LDT_DATA,SEL_LDT_CODE,SEL_LDT_STACK,SEL_LDT_DATA\
    ,SEL_LDT_DATA,SEL_LDT_DATA,0x1c00000-4,0,0,0,0,i);*/
    set_proc(0,0,0,0,0x10,0x8,0x10,0x10\
  8043f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8043f4:	50                   	push   rax
  8043f5:	6a 00                	push   0x0
  8043f7:	6a 00                	push   0x0
  8043f9:	6a 00                	push   0x0
  8043fb:	6a 00                	push   0x0
  8043fd:	68 fc ff bf 01       	push   0x1bffffc
  804402:	6a 10                	push   0x10
  804404:	6a 10                	push   0x10
  804406:	6a 10                	push   0x10
  804408:	6a 10                	push   0x10
  80440a:	41 b9 08 00 00 00    	mov    r9d,0x8
  804410:	41 b8 10 00 00 00    	mov    r8d,0x10
  804416:	b9 00 00 00 00       	mov    ecx,0x0
  80441b:	ba 00 00 00 00       	mov    edx,0x0
  804420:	be 00 00 00 00       	mov    esi,0x0
  804425:	bf 00 00 00 00       	mov    edi,0x0
  80442a:	e8 7e f7 ff ff       	call   803bad <set_proc>
  80442f:	48 83 c4 50          	add    rsp,0x50
    ,0x10,0x10,0x1c00000-4,0,0,0,0,i);
    task[i].pml4=vmalloc();
  804433:	b8 00 00 00 00       	mov    eax,0x0
  804438:	e8 2b cc ff ff       	call   801068 <vmalloc>
  80443d:	48 89 c2             	mov    rdx,rax
  804440:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804443:	48 98                	cdqe   
  804445:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  80444c:	48 05 40 85 40 00    	add    rax,0x408540
  804452:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    int *pt=vmalloc();
  804456:	b8 00 00 00 00       	mov    eax,0x0
  80445b:	e8 08 cc ff ff       	call   801068 <vmalloc>
  804460:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    task[i].pml4[0]=PAGE_TABLE_ADDR|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;
  804464:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804467:	48 98                	cdqe   
  804469:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  804470:	48 05 40 85 40 00    	add    rax,0x408540
  804476:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  80447a:	48 c7 00 07 20 00 00 	mov    QWORD PTR [rax],0x2007
    /*for(int j=0;j<32;j++)
        pt[j]=(PAGE_TABLE_ADDR+j*0x1000)|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;//复制内核页表*/
    //PAGE_TABLE_ADDR|PAGE_PRESENT;//复制内核页表
    //task[i].pml4[7]=PAGE_TABLE_ADDR+7*0x1000|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//sys.dll
    int *stackb=vmalloc();
  804481:	b8 00 00 00 00       	mov    eax,0x0
  804486:	e8 dd cb ff ff       	call   801068 <vmalloc>
  80448b:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    task[i].pml4[6]=(int)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  80448f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804493:	83 c8 07             	or     eax,0x7
  804496:	89 c1                	mov    ecx,eax
  804498:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80449b:	48 98                	cdqe   
  80449d:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  8044a4:	48 05 40 85 40 00    	add    rax,0x408540
  8044aa:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8044ae:	48 8d 50 30          	lea    rdx,[rax+0x30]
  8044b2:	48 63 c1             	movsxd rax,ecx
  8044b5:	48 89 02             	mov    QWORD PTR [rdx],rax
    stackb[1023]=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  8044b8:	b8 00 00 00 00       	mov    eax,0x0
  8044bd:	e8 33 cf ff ff       	call   8013f5 <req_a_page>
  8044c2:	89 c7                	mov    edi,eax
  8044c4:	e8 da d0 ff ff       	call   8015a3 <get_phyaddr>
  8044c9:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8044cd:	48 81 c2 fc 0f 00 00 	add    rdx,0xffc
  8044d4:	83 c8 07             	or     eax,0x7
  8044d7:	89 02                	mov    DWORD PTR [rdx],eax
//    task[i].tss.cr3=task[i].pml4;

    task[i].stat=READY;
  8044d9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8044dc:	48 98                	cdqe   
  8044de:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  8044e5:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8044eb:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  8044f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8044f4:	48 98                	cdqe   
  8044f6:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  8044fd:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  804504:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804508:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].exef=exef;
  80450c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80450f:	48 98                	cdqe   
  804511:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  804518:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  80451f:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  804523:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    task[i].tss.ss=0x10;
    task[i].tss.gs=0x10;
    task[i].tss.fs=0x10;
    task[i].tss.cs=0x8;*/
//    task[i].tss.eip=entry;
    return i;
  804527:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  80452a:	c9                   	leave  
  80452b:	c3                   	ret    

000000000080452c <sys_malloc>:

void * sys_malloc(int size)
{
  80452c:	f3 0f 1e fa          	endbr64 
  804530:	55                   	push   rbp
  804531:	48 89 e5             	mov    rbp,rsp
  804534:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  804537:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80453a:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804540:	85 c0                	test   eax,eax
  804542:	0f 48 c2             	cmovs  eax,edx
  804545:	c1 f8 0c             	sar    eax,0xc
  804548:	89 c1                	mov    ecx,eax
  80454a:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80454d:	99                   	cdq    
  80454e:	c1 ea 14             	shr    edx,0x14
  804551:	01 d0                	add    eax,edx
  804553:	25 ff 0f 00 00       	and    eax,0xfff
  804558:	29 d0                	sub    eax,edx
  80455a:	01 c8                	add    eax,ecx
  80455c:	85 c0                	test   eax,eax
  80455e:	0f 95 c0             	setne  al
  804561:	0f b6 c0             	movzx  eax,al
  804564:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  804567:	8b 05 9f cb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cb9f]        # 41110c <cur_proc>
  80456d:	48 98                	cdqe   
  80456f:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  804576:	48 05 b4 84 40 00    	add    rax,0x4084b4
  80457c:	8b 00                	mov    eax,DWORD PTR [rax]
  80457e:	48 98                	cdqe   
  804580:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804584:	eb 0c                	jmp    804592 <sys_malloc+0x66>
        hp=hp->next;
  804586:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80458a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80458e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804592:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804596:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80459a:	48 85 c0             	test   rax,rax
  80459d:	74 16                	je     8045b5 <sys_malloc+0x89>
  80459f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8045a3:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8045a6:	85 c0                	test   eax,eax
  8045a8:	75 0b                	jne    8045b5 <sys_malloc+0x89>
  8045aa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8045ae:	8b 00                	mov    eax,DWORD PTR [rax]
  8045b0:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8045b3:	7e d1                	jle    804586 <sys_malloc+0x5a>
    if(hp->pgn<n)
  8045b5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8045b9:	8b 00                	mov    eax,DWORD PTR [rax]
  8045bb:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  8045be:	7e 7f                	jle    80463f <sys_malloc+0x113>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  8045c0:	8b 05 46 cb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cb46]        # 41110c <cur_proc>
  8045c6:	48 98                	cdqe   
  8045c8:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  8045cf:	48 05 b8 84 40 00    	add    rax,0x4084b8
  8045d5:	8b 10                	mov    edx,DWORD PTR [rax]
  8045d7:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8045da:	c1 e0 0c             	shl    eax,0xc
  8045dd:	01 d0                	add    eax,edx
  8045df:	3d ff ff ef 01       	cmp    eax,0x1efffff
  8045e4:	7e 0a                	jle    8045f0 <sys_malloc+0xc4>
        {
            //超过顶部
            return NULL;
  8045e6:	b8 00 00 00 00       	mov    eax,0x0
  8045eb:	e9 c8 00 00 00       	jmp    8046b8 <sys_malloc+0x18c>
        }
        int needed=n-hp->pgn;
  8045f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8045f4:	8b 10                	mov    edx,DWORD PTR [rax]
  8045f6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8045f9:	29 d0                	sub    eax,edx
  8045fb:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  8045fe:	8b 05 08 cb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0cb08]        # 41110c <cur_proc>
  804604:	48 98                	cdqe   
  804606:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  80460d:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804613:	8b 00                	mov    eax,DWORD PTR [rax]
  804615:	48 98                	cdqe   
  804617:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  80461b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804622:	eb 13                	jmp    804637 <sys_malloc+0x10b>
        {
            *p=0;//触发缺页中断
  804624:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804628:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  80462b:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804632:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804633:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804637:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80463a:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80463d:	7c e5                	jl     804624 <sys_malloc+0xf8>
        }
    }
    if(hp->pgn>n)
  80463f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804643:	8b 00                	mov    eax,DWORD PTR [rax]
  804645:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804648:	7d 59                	jge    8046a3 <sys_malloc+0x177>
    {
        //在后面新建一个头
        char *p=hp;
  80464a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80464e:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804652:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804655:	83 c0 01             	add    eax,0x1
  804658:	c1 e0 0c             	shl    eax,0xc
  80465b:	48 98                	cdqe   
  80465d:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804661:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804665:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  804669:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80466d:	8b 00                	mov    eax,DWORD PTR [rax]
  80466f:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  804672:	8d 50 ff             	lea    edx,[rax-0x1]
  804675:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804679:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  80467b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80467f:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804683:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804687:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  80468b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80468f:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804693:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804697:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80469b:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80469f:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  8046a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046a7:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  8046ae:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046b2:	48 05 00 10 00 00    	add    rax,0x1000
}
  8046b8:	5d                   	pop    rbp
  8046b9:	c3                   	ret    

00000000008046ba <sys_free>:
int sys_free(int ptr)
{
  8046ba:	f3 0f 1e fa          	endbr64 
  8046be:	55                   	push   rbp
  8046bf:	48 89 e5             	mov    rbp,rsp
  8046c2:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  8046c5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8046c8:	2d 00 10 00 00       	sub    eax,0x1000
  8046cd:	48 98                	cdqe   
  8046cf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  8046d3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8046d7:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  8046de:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8046e2:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8046e6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  8046ea:	eb 2e                	jmp    80471a <sys_free+0x60>
    {
        if(p->alloc==0)
  8046ec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046f0:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8046f3:	85 c0                	test   eax,eax
  8046f5:	75 2c                	jne    804723 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  8046f7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8046fb:	8b 10                	mov    edx,DWORD PTR [rax]
  8046fd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804701:	8b 00                	mov    eax,DWORD PTR [rax]
  804703:	83 c0 01             	add    eax,0x1
  804706:	01 c2                	add    edx,eax
  804708:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80470c:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  80470e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804712:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804716:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  80471a:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80471f:	75 cb                	jne    8046ec <sys_free+0x32>
  804721:	eb 01                	jmp    804724 <sys_free+0x6a>
            break;
  804723:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  804724:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804728:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80472c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804730:	eb 2e                	jmp    804760 <sys_free+0xa6>
    {
        if(p->alloc==0)
  804732:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804736:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804739:	85 c0                	test   eax,eax
  80473b:	75 2c                	jne    804769 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  80473d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804741:	8b 10                	mov    edx,DWORD PTR [rax]
  804743:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804747:	8b 00                	mov    eax,DWORD PTR [rax]
  804749:	83 c0 01             	add    eax,0x1
  80474c:	01 c2                	add    edx,eax
  80474e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804752:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  804754:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804758:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80475c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804760:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804765:	75 cb                	jne    804732 <sys_free+0x78>
  804767:	eb 01                	jmp    80476a <sys_free+0xb0>
            break;
  804769:	90                   	nop
    }
    //合并完成
    return 0;
  80476a:	b8 00 00 00 00       	mov    eax,0x0
}
  80476f:	5d                   	pop    rbp
  804770:	c3                   	ret    

0000000000804771 <switch_to>:

void switch_to(struct process* to){
  804771:	f3 0f 1e fa          	endbr64 
  804775:	55                   	push   rbp
  804776:	48 89 e5             	mov    rbp,rsp
  804779:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//                 "mov %2,%%rsp\r\n"
//                 "jmp __switch_to\r\n"
//                 "1done:\r\n"
//                 "popq %%rax\r\n":"=m"(task[cur_proc].tss.rsp0),"=m"(task[cur_proc].tss.rip):
//                 "m"(to->tss.rsp0),"D"(to));
}
  80477d:	90                   	nop
  80477e:	5d                   	pop    rbp
  80477f:	c3                   	ret    

0000000000804780 <__switch_to>:
void __switch_to(struct process *to){
  804780:	f3 0f 1e fa          	endbr64 
  804784:	55                   	push   rbp
  804785:	48 89 e5             	mov    rbp,rsp
  804788:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  80478c:	90                   	nop
  80478d:	5d                   	pop    rbp
  80478e:	c3                   	ret    
  80478f:	90                   	nop

0000000000804790 <outb>:
  804790:	66 89 fa             	mov    dx,di
  804793:	66 89 f0             	mov    ax,si
  804796:	ee                   	out    dx,al
  804797:	e8 29 00 00 00       	call   8047c5 <io_delay>
  80479c:	c3                   	ret    

000000000080479d <outw>:
  80479d:	66 89 fa             	mov    dx,di
  8047a0:	66 89 f0             	mov    ax,si
  8047a3:	66 ef                	out    dx,ax
  8047a5:	90                   	nop
  8047a6:	90                   	nop
  8047a7:	90                   	nop
  8047a8:	c3                   	ret    

00000000008047a9 <inb>:
  8047a9:	31 c0                	xor    eax,eax
  8047ab:	66 89 fa             	mov    dx,di
  8047ae:	ec                   	in     al,dx
  8047af:	90                   	nop
  8047b0:	90                   	nop
  8047b1:	90                   	nop
  8047b2:	c3                   	ret    

00000000008047b3 <inw>:
  8047b3:	31 c0                	xor    eax,eax
  8047b5:	66 89 fa             	mov    dx,di
  8047b8:	66 ed                	in     ax,dx
  8047ba:	90                   	nop
  8047bb:	90                   	nop
  8047bc:	90                   	nop
  8047bd:	c3                   	ret    

00000000008047be <eoi>:
  8047be:	b0 20                	mov    al,0x20
  8047c0:	e6 a0                	out    0xa0,al
  8047c2:	e6 20                	out    0x20,al
  8047c4:	c3                   	ret    

00000000008047c5 <io_delay>:
  8047c5:	90                   	nop
  8047c6:	90                   	nop
  8047c7:	90                   	nop
  8047c8:	90                   	nop
  8047c9:	c3                   	ret    

00000000008047ca <turn_on_int>:
  8047ca:	b0 f8                	mov    al,0xf8
  8047cc:	e6 21                	out    0x21,al
  8047ce:	e8 f2 ff ff ff       	call   8047c5 <io_delay>
  8047d3:	b0 af                	mov    al,0xaf
  8047d5:	e6 a1                	out    0xa1,al
  8047d7:	e8 e9 ff ff ff       	call   8047c5 <io_delay>
  8047dc:	b8 00 70 10 00       	mov    eax,0x107000
  8047e1:	0f 01 18             	lidt   [rax]
  8047e4:	90                   	nop
  8047e5:	90                   	nop
  8047e6:	90                   	nop
  8047e7:	90                   	nop
  8047e8:	fb                   	sti    
  8047e9:	c3                   	ret    

00000000008047ea <report_back_trace_of_err>:
  8047ea:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  8047ef:	50                   	push   rax
  8047f0:	68 f9 47 80 00       	push   0x8047f9
  8047f5:	83 c4 08             	add    esp,0x8
  8047f8:	c3                   	ret    

00000000008047f9 <bt_msg>:
  8047f9:	65 72 72             	gs jb  80486e <fill_desc+0x4e>
  8047fc:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  8047fd:	72 20                	jb     80481f <init_gdt+0x11>
  8047ff:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804800:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  804803:	72 73                	jb     804878 <fill_desc+0x58>
  804805:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  804808:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eea486 <_knl_end+0x2ea486>

000000000080480e <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  80480e:	f3 0f 1e fa          	endbr64 
  804812:	55                   	push   rbp
  804813:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x28,%ax\r\n"
  804816:	66 b8 28 00          	mov    ax,0x28
  80481a:	0f 00 d8             	ltr    ax
                 "ltr %ax");
}
  80481d:	90                   	nop
  80481e:	5d                   	pop    rbp
  80481f:	c3                   	ret    

0000000000804820 <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  804820:	f3 0f 1e fa          	endbr64 
  804824:	55                   	push   rbp
  804825:	48 89 e5             	mov    rbp,rsp
  804828:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80482c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804830:	89 d0                	mov    eax,edx
  804832:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  804835:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  804839:	48 8b 15 60 54 00 00 	mov    rdx,QWORD PTR [rip+0x5460]        # 809ca0 <gdt>
  804840:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804843:	48 c1 e0 04          	shl    rax,0x4
  804847:	48 01 d0             	add    rax,rdx
  80484a:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80484e:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  804852:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804856:	48 c1 e8 10          	shr    rax,0x10
  80485a:	48 89 c1             	mov    rcx,rax
  80485d:	48 8b 15 3c 54 00 00 	mov    rdx,QWORD PTR [rip+0x543c]        # 809ca0 <gdt>
  804864:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804867:	48 c1 e0 04          	shl    rax,0x4
  80486b:	48 01 d0             	add    rax,rdx
  80486e:	89 ca                	mov    edx,ecx
  804870:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  804873:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804877:	48 c1 e8 18          	shr    rax,0x18
  80487b:	48 89 c1             	mov    rcx,rax
  80487e:	48 8b 15 1b 54 00 00 	mov    rdx,QWORD PTR [rip+0x541b]        # 809ca0 <gdt>
  804885:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804888:	48 c1 e0 04          	shl    rax,0x4
  80488c:	48 01 d0             	add    rax,rdx
  80488f:	89 ca                	mov    edx,ecx
  804891:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  804894:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804898:	48 c1 e8 20          	shr    rax,0x20
  80489c:	48 89 c2             	mov    rdx,rax
  80489f:	48 8b 0d fa 53 00 00 	mov    rcx,QWORD PTR [rip+0x53fa]        # 809ca0 <gdt>
  8048a6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8048a9:	48 c1 e0 04          	shl    rax,0x4
  8048ad:	48 01 c8             	add    rax,rcx
  8048b0:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  8048b3:	48 8b 15 e6 53 00 00 	mov    rdx,QWORD PTR [rip+0x53e6]        # 809ca0 <gdt>
  8048ba:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8048bd:	48 c1 e0 04          	shl    rax,0x4
  8048c1:	48 01 d0             	add    rax,rdx
  8048c4:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8048c8:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  8048cb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8048cf:	48 c1 e8 08          	shr    rax,0x8
  8048d3:	66 25 f0 00          	and    ax,0xf0
  8048d7:	48 8b 0d c2 53 00 00 	mov    rcx,QWORD PTR [rip+0x53c2]        # 809ca0 <gdt>
  8048de:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8048e1:	48 c1 e2 04          	shl    rdx,0x4
  8048e5:	48 01 ca             	add    rdx,rcx
  8048e8:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  8048ec:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  8048f0:	90                   	nop
  8048f1:	5d                   	pop    rbp
  8048f2:	c3                   	ret    

00000000008048f3 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  8048f3:	f3 0f 1e fa          	endbr64 
  8048f7:	55                   	push   rbp
  8048f8:	48 89 e5             	mov    rbp,rsp
  8048fb:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8048fe:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  804901:	89 c8                	mov    eax,ecx
  804903:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  804907:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  80490b:	48 8b 05 8e 53 00 00 	mov    rax,QWORD PTR [rip+0x538e]        # 809ca0 <gdt>
  804912:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  804916:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804919:	48 c1 e0 04          	shl    rax,0x4
  80491d:	48 89 c2             	mov    rdx,rax
  804920:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804924:	48 01 d0             	add    rax,rdx
  804927:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80492a:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  80492d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804930:	48 c1 e0 04          	shl    rax,0x4
  804934:	48 89 c2             	mov    rdx,rax
  804937:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80493b:	48 01 d0             	add    rax,rdx
  80493e:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804941:	c1 ea 10             	shr    edx,0x10
  804944:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  804947:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80494a:	48 c1 e0 04          	shl    rax,0x4
  80494e:	48 89 c2             	mov    rdx,rax
  804951:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804955:	48 01 c2             	add    rdx,rax
  804958:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  80495c:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  804960:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804963:	48 c1 e0 04          	shl    rax,0x4
  804967:	48 89 c2             	mov    rdx,rax
  80496a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80496e:	48 01 c2             	add    rdx,rax
  804971:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  804975:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  804979:	90                   	nop
  80497a:	5d                   	pop    rbp
  80497b:	c3                   	ret    

000000000080497c <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  80497c:	f3 0f 1e fa          	endbr64 
  804980:	55                   	push   rbp
  804981:	48 89 e5             	mov    rbp,rsp
  804984:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  804987:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  80498a:	89 d0                	mov    eax,edx
  80498c:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  804990:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  804994:	90                   	nop
  804995:	5d                   	pop    rbp
  804996:	c3                   	ret    
  804997:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  80499e:	00 00 

00000000008049a0 <fill_desc>:
  8049a0:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  8049a5:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  8049aa:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  8049af:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  8049b4:	be 00 60 00 00       	mov    esi,0x6000
  8049b9:	c1 e2 03             	shl    edx,0x3
  8049bc:	01 d6                	add    esi,edx
  8049be:	66 67 89 1e          	mov    WORD PTR [esi],bx
  8049c2:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  8049c7:	c1 e8 10             	shr    eax,0x10
  8049ca:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  8049ce:	c1 eb 10             	shr    ebx,0x10
  8049d1:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  8049d5:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  8049d9:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  8049dd:	c3                   	ret    

00000000008049de <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  8049de:	f3 0f 1e fa          	endbr64 
  8049e2:	55                   	push   rbp
  8049e3:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  8049e6:	b8 00 00 00 00       	mov    eax,0x0
  8049eb:	e8 cc 16 00 00       	call   8060bc <execute_request>
    do_req();
  8049f0:	b8 00 00 00 00       	mov    eax,0x0
  8049f5:	e8 81 ee ff ff       	call   80387b <do_req>
    if(!manage_proc_lock)
  8049fa:	8b 05 48 52 00 00    	mov    eax,DWORD PTR [rip+0x5248]        # 809c48 <manage_proc_lock>
  804a00:	85 c0                	test   eax,eax
  804a02:	75 0a                	jne    804a0e <clock_c+0x30>
    {
        manage_proc();
  804a04:	b8 00 00 00 00       	mov    eax,0x0
  804a09:	e8 43 f2 ff ff       	call   803c51 <manage_proc>
    }
    //puts("1 disk req executed.");
  804a0e:	90                   	nop
  804a0f:	5d                   	pop    rbp
  804a10:	c3                   	ret    
  804a11:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  804a18:	00 00 00 
  804a1b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000804a20 <clock>:
  804a20:	b0 20                	mov    al,0x20
  804a22:	e6 a0                	out    0xa0,al
  804a24:	e6 20                	out    0x20,al
  804a26:	e8 b3 ff ff ff       	call   8049de <clock_c>
  804a2b:	48 cf                	iretq  

0000000000804a2d <execute>:
    return ind;
}
*/

int execute(char *path)
{
  804a2d:	f3 0f 1e fa          	endbr64 
  804a31:	55                   	push   rbp
  804a32:	48 89 e5             	mov    rbp,rsp
  804a35:	48 83 ec 30          	sub    rsp,0x30
  804a39:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  804a3d:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  804a44:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, 1)) == -1)return -1;
  804a4b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804a4f:	be 01 00 00 00       	mov    esi,0x1
  804a54:	48 89 c7             	mov    rdi,rax
  804a57:	e8 12 d1 ff ff       	call   801b6e <sys_open>
  804a5c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  804a5f:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804a63:	75 0a                	jne    804a6f <execute+0x42>
  804a65:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804a6a:	e9 b7 00 00 00       	jmp    804b26 <execute+0xf9>
    //
    char *p=path;
  804a6f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804a73:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  804a77:	eb 05                	jmp    804a7e <execute+0x51>
  804a79:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  804a7e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804a82:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804a85:	84 c0                	test   al,al
  804a87:	75 f0                	jne    804a79 <execute+0x4c>
    for(;*p!='/'&&p>path;p--);
  804a89:	eb 05                	jmp    804a90 <execute+0x63>
  804a8b:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  804a90:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804a94:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  804a97:	3c 2f                	cmp    al,0x2f
  804a99:	74 0a                	je     804aa5 <execute+0x78>
  804a9b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804a9f:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804aa3:	77 e6                	ja     804a8b <execute+0x5e>
    if(p>path)
  804aa5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804aa9:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  804aad:	76 2f                	jbe    804ade <execute+0xb1>
    {
        *p='\0';
  804aaf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ab3:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, 1)) == -1)return -1;
  804ab6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804aba:	be 01 00 00 00       	mov    esi,0x1
  804abf:	48 89 c7             	mov    rdi,rax
  804ac2:	e8 a7 d0 ff ff       	call   801b6e <sys_open>
  804ac7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  804aca:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  804ace:	75 07                	jne    804ad7 <execute+0xaa>
  804ad0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  804ad5:	eb 4f                	jmp    804b26 <execute+0xf9>
        *p='/';
  804ad7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804adb:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern vfs_dir_entry opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  804ade:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804ae1:	48 63 d0             	movsxd rdx,eax
  804ae4:	48 89 d0             	mov    rax,rdx
  804ae7:	48 01 c0             	add    rax,rax
  804aea:	48 01 d0             	add    rax,rdx
  804aed:	48 c1 e0 05          	shl    rax,0x5
  804af1:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  804af8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804afb:	48 63 c8             	movsxd rcx,eax
  804afe:	48 89 c8             	mov    rax,rcx
  804b01:	48 01 c0             	add    rax,rax
  804b04:	48 01 c8             	add    rax,rcx
  804b07:	48 c1 e0 05          	shl    rax,0x5
  804b0b:	48 05 60 06 40 00    	add    rax,0x400660
  804b11:	b9 90 4b 80 00       	mov    ecx,0x804b90
  804b16:	48 89 c6             	mov    rsi,rax
  804b19:	89 cf                	mov    edi,ecx
  804b1b:	e8 9d f8 ff ff       	call   8043bd <reg_proc>
  804b20:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  804b23:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  804b26:	c9                   	leave  
  804b27:	c3                   	ret    

0000000000804b28 <exec_call>:

int exec_call(char *path)
{
  804b28:	f3 0f 1e fa          	endbr64 
  804b2c:	55                   	push   rbp
  804b2d:	48 89 e5             	mov    rbp,rsp
  804b30:	48 83 ec 20          	sub    rsp,0x20
  804b34:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi=execute(path);
  804b38:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804b3c:	48 89 c7             	mov    rdi,rax
  804b3f:	e8 e9 fe ff ff       	call   804a2d <execute>
  804b44:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  804b47:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b4a:	01 c0                	add    eax,eax
  804b4c:	83 c0 05             	add    eax,0x5
  804b4f:	c1 e0 03             	shl    eax,0x3
  804b52:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  804b55:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b58:	89 c7                	mov    edi,eax
  804b5a:	e8 13 f2 ff ff       	call   803d72 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  804b5f:	90                   	nop
  804b60:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b63:	48 98                	cdqe   
  804b65:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  804b6c:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804b72:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804b75:	83 f8 03             	cmp    eax,0x3
  804b78:	75 e6                	jne    804b60 <exec_call+0x38>
    return task[pi].exit_code;
  804b7a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804b7d:	48 98                	cdqe   
  804b7f:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  804b86:	48 05 b0 84 40 00    	add    rax,0x4084b0
  804b8c:	8b 00                	mov    eax,DWORD PTR [rax]
}
  804b8e:	c9                   	leave  
  804b8f:	c3                   	ret    

0000000000804b90 <proc_start>:
int proc_start()
{
  804b90:	f3 0f 1e fa          	endbr64 
  804b94:	55                   	push   rbp
  804b95:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  804b98:	8b 05 6e c5 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0c56e]        # 41110c <cur_proc>
  804b9e:	48 98                	cdqe   
  804ba0:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  804ba7:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804bad:	48 89 c7             	mov    rdi,rax
  804bb0:	e8 1a 00 00 00       	call   804bcf <load_pe>
    //释放进程资源
    del_proc(cur_proc);
  804bb5:	8b 05 51 c5 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0c551]        # 41110c <cur_proc>
  804bbb:	89 c7                	mov    edi,eax
  804bbd:	e8 05 f6 ff ff       	call   8041c7 <del_proc>
    switch_proc_tss(0);
  804bc2:	bf 00 00 00 00       	mov    edi,0x0
  804bc7:	e8 a6 f1 ff ff       	call   803d72 <switch_proc_tss>
}
  804bcc:	90                   	nop
  804bcd:	5d                   	pop    rbp
  804bce:	c3                   	ret    

0000000000804bcf <load_pe>:
//在cr3切换到目标进程下的加载程序(但进程还没调度到那里)。
int load_pe(struct process *proc)
{
  804bcf:	f3 0f 1e fa          	endbr64 
  804bd3:	55                   	push   rbp
  804bd4:	48 89 e5             	mov    rbp,rsp
  804bd7:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  804bde:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    vfs_dir_entry *f=proc->exef;
  804be5:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  804bec:	48 8b 80 bc 00 00 00 	mov    rax,QWORD PTR [rax+0xbc]
  804bf3:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=f->fno;
  804bf7:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  804bfb:	8b 00                	mov    eax,DWORD PTR [rax]
  804bfd:	89 45 94             	mov    DWORD PTR [rbp-0x6c],eax

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  804c00:	48 8d 8d 70 fe ff ff 	lea    rcx,[rbp-0x190]
  804c07:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804c0a:	ba 44 00 00 00       	mov    edx,0x44
  804c0f:	48 89 ce             	mov    rsi,rcx
  804c12:	89 c7                	mov    edi,eax
  804c14:	e8 34 d5 ff ff       	call   80214d <sys_read>
    sys_seek(exefno,tdh.e_lfanew,SEEK_SET);
  804c19:	48 8b 85 ac fe ff ff 	mov    rax,QWORD PTR [rbp-0x154]
  804c20:	89 c1                	mov    ecx,eax
  804c22:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804c25:	ba 00 00 00 00       	mov    edx,0x0
  804c2a:	89 ce                	mov    esi,ecx
  804c2c:	89 c7                	mov    edi,eax
  804c2e:	e8 ab d5 ff ff       	call   8021de <sys_seek>
    sys_read(exefno, &tnth, sizeof(tnth));
  804c33:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  804c3a:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804c3d:	ba f8 00 00 00       	mov    edx,0xf8
  804c42:	48 89 ce             	mov    rsi,rcx
  804c45:	89 c7                	mov    edi,eax
  804c47:	e8 01 d5 ff ff       	call   80214d <sys_read>

    //是否需要移动base(先不检查)
    unsigned int nbase=tnth.OptionalHeader.ImageBase;
  804c4c:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  804c52:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  804c55:	8b 85 c0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x240]
  804c5b:	c1 e8 0c             	shr    eax,0xc
  804c5e:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
    //use_pgm_ava检查在页表中这个范围是否可用，可用就使用
    while(1)
    {
        cont:
        ;
        int pdei=nbase/PAGE_INDEX_SIZE;
  804c61:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804c64:	c1 e8 16             	shr    eax,0x16
  804c67:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
        int ptei=nbase%PAGE_INDEX_SIZE/PAGE_SIZE;
  804c6a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804c6d:	25 ff ff 3f 00       	and    eax,0x3fffff
  804c72:	c1 e8 0c             	shr    eax,0xc
  804c75:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
        int *pt=(proc->pml4[pdei]&0xfffff000);
  804c78:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  804c7f:	48 8b 90 ac 00 00 00 	mov    rdx,QWORD PTR [rax+0xac]
  804c86:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
  804c89:	48 98                	cdqe   
  804c8b:	48 c1 e0 03          	shl    rax,0x3
  804c8f:	48 01 d0             	add    rax,rdx
  804c92:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804c95:	25 00 f0 ff ff       	and    eax,0xfffff000
  804c9a:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
        for(int i=0;i<pgn;i++)
  804c9e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  804ca5:	eb 48                	jmp    804cef <load_pe+0x120>
        {
            if(pt[ptei+i%1024]&PAGE_PRESENT&&pt!=NULL)
  804ca7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804caa:	99                   	cdq    
  804cab:	c1 ea 16             	shr    edx,0x16
  804cae:	01 d0                	add    eax,edx
  804cb0:	25 ff 03 00 00       	and    eax,0x3ff
  804cb5:	29 d0                	sub    eax,edx
  804cb7:	89 c2                	mov    edx,eax
  804cb9:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  804cbc:	01 d0                	add    eax,edx
  804cbe:	48 98                	cdqe   
  804cc0:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  804cc7:	00 
  804cc8:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  804ccc:	48 01 d0             	add    rax,rdx
  804ccf:	8b 00                	mov    eax,DWORD PTR [rax]
  804cd1:	83 e0 01             	and    eax,0x1
  804cd4:	85 c0                	test   eax,eax
  804cd6:	74 13                	je     804ceb <load_pe+0x11c>
  804cd8:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
  804cdd:	74 0c                	je     804ceb <load_pe+0x11c>
            {
                //移动base
                nbase+=0x1000;
  804cdf:	81 45 fc 00 10 00 00 	add    DWORD PTR [rbp-0x4],0x1000
                goto cont;
  804ce6:	e9 76 ff ff ff       	jmp    804c61 <load_pe+0x92>
        for(int i=0;i<pgn;i++)
  804ceb:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  804cef:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804cf2:	3b 45 90             	cmp    eax,DWORD PTR [rbp-0x70]
  804cf5:	7c b0                	jl     804ca7 <load_pe+0xd8>
            }
        }
        break;
  804cf7:	90                   	nop
    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_seek(exefno,0,SEEK_SET);
  804cf8:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804cfb:	ba 00 00 00 00       	mov    edx,0x0
  804d00:	be 00 00 00 00       	mov    esi,0x0
  804d05:	89 c7                	mov    edi,eax
  804d07:	e8 d2 d4 ff ff       	call   8021de <sys_seek>
    sys_read(exefno, nbase, PAGE_SIZE);
  804d0c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d0f:	48 89 c1             	mov    rcx,rax
  804d12:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804d15:	ba 00 10 00 00       	mov    edx,0x1000
  804d1a:	48 89 ce             	mov    rsi,rcx
  804d1d:	89 c7                	mov    edi,eax
  804d1f:	e8 29 d4 ff ff       	call   80214d <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  804d24:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d27:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_NT_HEADERS32 nth=nbase+dosh->e_lfanew;
  804d2e:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804d31:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  804d38:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  804d3c:	48 01 d0             	add    rax,rdx
  804d3f:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  804d46:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804d4d:	48 83 c0 04          	add    rax,0x4
  804d51:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  804d58:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804d5f:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  804d62:	89 85 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],eax
    int page_count=prog_size/4096;
  804d68:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  804d6e:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804d74:	85 c0                	test   eax,eax
  804d76:	0f 48 c2             	cmovs  eax,edx
  804d79:	c1 f8 0c             	sar    eax,0xc
  804d7c:	89 85 60 ff ff ff    	mov    DWORD PTR [rbp-0xa0],eax

    int shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  804d82:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804d89:	8b 50 28             	mov    edx,DWORD PTR [rax+0x28]
  804d8c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804d8f:	01 d0                	add    eax,edx
  804d91:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  804d97:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  804d9d:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  804da3:	85 c0                	test   eax,eax
  804da5:	0f 48 c2             	cmovs  eax,edx
  804da8:	c1 f8 0a             	sar    eax,0xa
  804dab:	89 c1                	mov    ecx,eax
  804dad:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  804db3:	99                   	cdq    
  804db4:	c1 ea 16             	shr    edx,0x16
  804db7:	01 d0                	add    eax,edx
  804db9:	25 ff 03 00 00       	and    eax,0x3ff
  804dbe:	29 d0                	sub    eax,edx
  804dc0:	01 c8                	add    eax,ecx
  804dc2:	85 c0                	test   eax,eax
  804dc4:	0f 95 c0             	setne  al
  804dc7:	0f b6 c0             	movzx  eax,al
  804dca:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  804dd0:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  804dd6:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  804ddc:	85 c0                	test   eax,eax
  804dde:	0f 48 c2             	cmovs  eax,edx
  804de1:	c1 f8 16             	sar    eax,0x16
  804de4:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  804dea:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804df1:	89 c0                	mov    eax,eax
  804df3:	48 05 f8 00 00 00    	add    rax,0xf8
  804df9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  804dfd:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804e04:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  804e08:	0f b7 d0             	movzx  edx,ax
  804e0b:	89 d0                	mov    eax,edx
  804e0d:	c1 e0 02             	shl    eax,0x2
  804e10:	01 d0                	add    eax,edx
  804e12:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  804e15:	05 3c 01 00 00       	add    eax,0x13c
  804e1a:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    int align=nth->OptionalHeader.FileAlignment;
  804e20:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804e27:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  804e2a:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  804e30:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  804e36:	99                   	cdq    
  804e37:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  804e3d:	89 d0                	mov    eax,edx
  804e3f:	85 c0                	test   eax,eax
  804e41:	74 23                	je     804e66 <load_pe+0x297>
  804e43:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  804e49:	99                   	cdq    
  804e4a:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  804e50:	89 d1                	mov    ecx,edx
  804e52:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  804e58:	29 c8                	sub    eax,ecx
  804e5a:	89 c2                	mov    edx,eax
  804e5c:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
  804e62:	01 d0                	add    eax,edx
  804e64:	eb 06                	jmp    804e6c <load_pe+0x29d>
  804e66:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  804e6c:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  804e72:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804e79:	eb 68                	jmp    804ee3 <load_pe+0x314>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  804e7b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804e7f:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  804e82:	25 00 00 00 02       	and    eax,0x2000000
  804e87:	89 85 bc fe ff ff    	mov    DWORD PTR [rbp-0x144],eax
        if(disca)
  804e8d:	83 bd bc fe ff ff 00 	cmp    DWORD PTR [rbp-0x144],0x0
  804e94:	75 43                	jne    804ed9 <load_pe+0x30a>
            continue;
        //直接读，缺页内核解决
        sys_seek(exefno,psec->PointerToRawData,SEEK_SET);
  804e96:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804e9a:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  804e9d:	89 c1                	mov    ecx,eax
  804e9f:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804ea2:	ba 00 00 00 00       	mov    edx,0x0
  804ea7:	89 ce                	mov    esi,ecx
  804ea9:	89 c7                	mov    edi,eax
  804eab:	e8 2e d3 ff ff       	call   8021de <sys_seek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  804eb0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804eb4:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  804eb7:	89 c2                	mov    edx,eax
  804eb9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ebd:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
  804ec0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804ec3:	01 c8                	add    eax,ecx
  804ec5:	89 c0                	mov    eax,eax
  804ec7:	48 89 c1             	mov    rcx,rax
  804eca:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  804ecd:	48 89 ce             	mov    rsi,rcx
  804ed0:	89 c7                	mov    edi,eax
  804ed2:	e8 76 d2 ff ff       	call   80214d <sys_read>
  804ed7:	eb 01                	jmp    804eda <load_pe+0x30b>
            continue;
  804ed9:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  804eda:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804ede:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  804ee3:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804eea:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  804eee:	0f b7 c0             	movzx  eax,ax
  804ef1:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  804ef4:	7c 85                	jl     804e7b <load_pe+0x2ac>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  804ef6:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  804efd:	48 83 e8 80          	sub    rax,0xffffffffffffff80
  804f01:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    if(impd->Size>0)
  804f08:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  804f0f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804f12:	85 c0                	test   eax,eax
  804f14:	0f 84 71 02 00 00    	je     80518b <load_pe+0x5bc>
    {
        int tmpi=impd->VirtualAddress+nbase;
  804f1a:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  804f21:	8b 10                	mov    edx,DWORD PTR [rax]
  804f23:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804f26:	01 d0                	add    eax,edx
  804f28:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  804f2e:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  804f34:	48 98                	cdqe   
  804f36:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  804f3a:	e9 3e 02 00 00       	jmp    80517d <load_pe+0x5ae>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  804f3f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804f43:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  804f46:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804f49:	01 d0                	add    eax,edx
  804f4b:	89 c0                	mov    eax,eax
  804f4d:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  804f54:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  804f5b:	be c8 17 81 00       	mov    esi,0x8117c8
  804f60:	48 89 c7             	mov    rdi,rax
  804f63:	e8 ec 45 00 00       	call   809554 <strcmp>
  804f68:	85 c0                	test   eax,eax
  804f6a:	75 09                	jne    804f75 <load_pe+0x3a6>
            {
                dllp=0x1c00000;
  804f6c:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  804f73:	eb 25                	jmp    804f9a <load_pe+0x3cb>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  804f75:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  804f7c:	48 89 c7             	mov    rdi,rax
  804f7f:	e8 4b fc ff ff       	call   804bcf <load_pe>
  804f84:	89 85 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  804f8a:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  804f90:	89 c7                	mov    edi,eax
  804f92:	e8 c9 03 00 00       	call   805360 <get_module_addr>
  804f97:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  804f9a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804f9d:	48 98                	cdqe   
  804f9f:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  804fa6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804fa9:	48 63 d0             	movsxd rdx,eax
  804fac:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  804fb3:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  804fb7:	48 01 d0             	add    rax,rdx
  804fba:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  804fc1:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  804fc8:	8b 50 78             	mov    edx,DWORD PTR [rax+0x78]
  804fcb:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804fce:	01 d0                	add    eax,edx
  804fd0:	89 c0                	mov    eax,eax
  804fd2:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
            int funcn=dllexp->NumberOfNames;
  804fd9:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  804fe0:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  804fe3:	89 85 0c ff ff ff    	mov    DWORD PTR [rbp-0xf4],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  804fe9:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  804ff0:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  804ff3:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804ff6:	01 d0                	add    eax,edx
  804ff8:	89 c0                	mov    eax,eax
  804ffa:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  805001:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805008:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80500b:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80500e:	01 d0                	add    eax,edx
  805010:	89 c0                	mov    eax,eax
  805012:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  805019:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805020:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  805023:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805026:	01 d0                	add    eax,edx
  805028:	89 c0                	mov    eax,eax
  80502a:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  805031:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805038:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80503b:	89 85 ec fe ff ff    	mov    DWORD PTR [rbp-0x114],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  805041:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805045:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  805048:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80504b:	01 d0                	add    eax,edx
  80504d:	89 c0                	mov    eax,eax
  80504f:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  805053:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805057:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  80505a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80505d:	01 d0                	add    eax,edx
  80505f:	89 c0                	mov    eax,eax
  805061:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  805065:	e9 00 01 00 00       	jmp    80516a <load_pe+0x59b>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  80506a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80506e:	8b 00                	mov    eax,DWORD PTR [rax]
  805070:	85 c0                	test   eax,eax
  805072:	79 43                	jns    8050b7 <load_pe+0x4e8>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  805074:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805078:	8b 00                	mov    eax,DWORD PTR [rax]
  80507a:	25 ff ff ff 7f       	and    eax,0x7fffffff
  80507f:	2b 85 ec fe ff ff    	sub    eax,DWORD PTR [rbp-0x114]
  805085:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  80508b:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  805091:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805098:	00 
  805099:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8050a0:	48 01 d0             	add    rax,rdx
  8050a3:	8b 10                	mov    edx,DWORD PTR [rax]
  8050a5:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8050a8:	01 d0                	add    eax,edx
  8050aa:	89 c2                	mov    edx,eax
  8050ac:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8050b0:	89 10                	mov    DWORD PTR [rax],edx
  8050b2:	e9 a9 00 00 00       	jmp    805160 <load_pe+0x591>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  8050b7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8050bb:	8b 00                	mov    eax,DWORD PTR [rax]
  8050bd:	89 c0                	mov    eax,eax
  8050bf:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  8050c6:	48 83 85 e0 fe ff ff 	add    QWORD PTR [rbp-0x120],0x2
  8050cd:	02 
                    int i=0;
  8050ce:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  8050d5:	eb 7a                	jmp    805151 <load_pe+0x582>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  8050d7:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8050da:	48 98                	cdqe   
  8050dc:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8050e3:	00 
  8050e4:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  8050eb:	48 01 d0             	add    rax,rdx
  8050ee:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8050f1:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
  8050f8:	48 89 d6             	mov    rsi,rdx
  8050fb:	48 89 c7             	mov    rdi,rax
  8050fe:	e8 51 44 00 00       	call   809554 <strcmp>
  805103:	85 c0                	test   eax,eax
  805105:	75 46                	jne    80514d <load_pe+0x57e>
                        {
                            int ordi=funcords[i];
  805107:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80510a:	48 98                	cdqe   
  80510c:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  805110:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  805117:	48 01 d0             	add    rax,rdx
  80511a:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80511d:	98                   	cwde   
  80511e:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  805124:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
  80512a:	48 98                	cdqe   
  80512c:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805133:	00 
  805134:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80513b:	48 01 d0             	add    rax,rdx
  80513e:	8b 10                	mov    edx,DWORD PTR [rax]
  805140:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805143:	01 d0                	add    eax,edx
  805145:	89 c2                	mov    edx,eax
  805147:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80514b:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  80514d:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  805151:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  805154:	3b 85 0c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xf4]
  80515a:	0f 8c 77 ff ff ff    	jl     8050d7 <load_pe+0x508>
                        }
                    }
                }
                iataddrs++;
  805160:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  805165:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  80516a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80516e:	8b 00                	mov    eax,DWORD PTR [rax]
  805170:	85 c0                	test   eax,eax
  805172:	0f 85 f2 fe ff ff    	jne    80506a <load_pe+0x49b>
            }
            impdes++;
  805178:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  80517d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805181:	8b 00                	mov    eax,DWORD PTR [rax]
  805183:	85 c0                	test   eax,eax
  805185:	0f 85 b4 fd ff ff    	jne    804f3f <load_pe+0x370>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  80518b:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  805192:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  805193:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80519a:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [rax+0xa4]
  8051a0:	85 c0                	test   eax,eax
  8051a2:	0f 84 e8 00 00 00    	je     805290 <load_pe+0x6c1>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  8051a8:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8051af:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [rax+0xa0]
  8051b5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8051b8:	01 d0                	add    eax,edx
  8051ba:	89 c0                	mov    eax,eax
  8051bc:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                                +(u32)nbase);
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  8051c0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8051c4:	48 83 c0 40          	add    rax,0x40
  8051c8:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  8051cc:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8051d0:	48 83 c0 02          	add    rax,0x2
  8051d4:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  8051d8:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8051df:	8b 40 34             	mov    eax,DWORD PTR [rax+0x34]
  8051e2:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
        while(relp->VirtualAddress){
  8051e8:	e9 95 00 00 00       	jmp    805282 <load_pe+0x6b3>
            int pgva=relp->VirtualAddress+nbase;
  8051ed:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8051f1:	8b 10                	mov    edx,DWORD PTR [rax]
  8051f3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8051f6:	01 d0                	add    eax,edx
  8051f8:	89 85 d0 fe ff ff    	mov    DWORD PTR [rbp-0x130],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8051fe:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  805205:	eb 59                	jmp    805260 <load_pe+0x691>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  805207:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80520b:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80520e:	66 85 c0             	test   ax,ax
  805211:	74 48                	je     80525b <load_pe+0x68c>
                int *at=*reloc+pgva;//要重定位的数据的地址
  805213:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805217:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80521a:	0f b7 d0             	movzx  edx,ax
  80521d:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  805223:	01 d0                	add    eax,edx
  805225:	48 98                	cdqe   
  805227:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
                *at=*at-old_base+nbase;
  80522e:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  805235:	8b 00                	mov    eax,DWORD PTR [rax]
  805237:	2b 85 d4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x12c]
  80523d:	89 c2                	mov    edx,eax
  80523f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805242:	01 d0                	add    eax,edx
  805244:	89 c2                	mov    edx,eax
  805246:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  80524d:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  80524f:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  805254:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  805259:	eb 01                	jmp    80525c <load_pe+0x68d>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  80525b:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  80525c:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  805260:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805264:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805267:	c1 e8 02             	shr    eax,0x2
  80526a:	89 c2                	mov    edx,eax
  80526c:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  80526f:	39 c2                	cmp    edx,eax
  805271:	77 94                	ja     805207 <load_pe+0x638>
            }
            relp=(int)relp+0x1000;
  805273:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805277:	05 00 10 00 00       	add    eax,0x1000
  80527c:	48 98                	cdqe   
  80527e:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  805282:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805286:	8b 00                	mov    eax,DWORD PTR [rax]
  805288:	85 c0                	test   eax,eax
  80528a:	0f 85 5d ff ff ff    	jne    8051ed <load_pe+0x61e>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  805290:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  805297:	00 00 00 
  80529a:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  8052a1:	00 00 00 
  8052a4:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  8052ab:	00 00 00 00 
  8052af:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  8052b6:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  8052ba:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  8052c1:	ba 18 00 00 00       	mov    edx,0x18
  8052c6:	48 89 c6             	mov    rsi,rax
  8052c9:	bf 00 00 00 01       	mov    edi,0x1000000
  8052ce:	e8 e3 3f 00 00       	call   8092b6 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  8052d3:	8b 05 33 be c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0be33]        # 41110c <cur_proc>
  8052d9:	48 98                	cdqe   
  8052db:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  8052e2:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8052e8:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  8052ef:	8b 05 17 be c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0be17]        # 41110c <cur_proc>
  8052f5:	48 98                	cdqe   
  8052f7:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  8052fe:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805304:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  80530b:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  805311:	48 98                	cdqe   
  805313:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
    task[cur_proc].exit_code=main(0,NULL);
  80531a:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
  805321:	be 00 00 00 00       	mov    esi,0x0
  805326:	bf 00 00 00 00       	mov    edi,0x0
  80532b:	ff d0                	call   rax
  80532d:	8b 15 d9 bd c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0bdd9]        # 41110c <cur_proc>
  805333:	89 c1                	mov    ecx,eax
  805335:	48 63 c2             	movsxd rax,edx
  805338:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  80533f:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805345:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  805347:	8b 05 bf bd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0bdbf]        # 41110c <cur_proc>
  80534d:	48 98                	cdqe   
  80534f:	48 69 c0 30 02 00 00 	imul   rax,rax,0x230
  805356:	48 05 b0 84 40 00    	add    rax,0x4084b0
  80535c:	8b 00                	mov    eax,DWORD PTR [rax]
}
  80535e:	c9                   	leave  
  80535f:	c3                   	ret    

0000000000805360 <get_module_addr>:

int get_module_addr(int mi)
{
  805360:	f3 0f 1e fa          	endbr64 
  805364:	55                   	push   rbp
  805365:	48 89 e5             	mov    rbp,rsp
  805368:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  80536b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80536e:	48 98                	cdqe   
  805370:	8b 04 c5 20 3d 42 00 	mov    eax,DWORD PTR [rax*8+0x423d20]
}
  805377:	5d                   	pop    rbp
  805378:	c3                   	ret    

0000000000805379 <dispose_library>:
int dispose_library(int dlln)
{
  805379:	f3 0f 1e fa          	endbr64 
  80537d:	55                   	push   rbp
  80537e:	48 89 e5             	mov    rbp,rsp
  805381:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  805384:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805388:	78 09                	js     805393 <dispose_library+0x1a>
  80538a:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  805391:	7e 07                	jle    80539a <dispose_library+0x21>
  805393:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805398:	eb 1d                	jmp    8053b7 <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  80539a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80539d:	48 98                	cdqe   
  80539f:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  8053a6:	48 05 28 11 41 00    	add    rax,0x411128
  8053ac:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  8053b2:	b8 00 00 00 00       	mov    eax,0x0
}
  8053b7:	5d                   	pop    rbp
  8053b8:	c3                   	ret    

00000000008053b9 <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  8053b9:	f3 0f 1e fa          	endbr64 
  8053bd:	55                   	push   rbp
  8053be:	48 89 e5             	mov    rbp,rsp
  8053c1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  8053c5:	90                   	nop
  8053c6:	5d                   	pop    rbp
  8053c7:	c3                   	ret    

00000000008053c8 <sys_rmmod>:
int sys_rmmod(char *name)
{
  8053c8:	f3 0f 1e fa          	endbr64 
  8053cc:	55                   	push   rbp
  8053cd:	48 89 e5             	mov    rbp,rsp
  8053d0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  8053d4:	90                   	nop
  8053d5:	5d                   	pop    rbp
  8053d6:	c3                   	ret    
  8053d7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  8053de:	00 00 

00000000008053e0 <_syscall>:
  8053e0:	57                   	push   rdi
  8053e1:	56                   	push   rsi
  8053e2:	52                   	push   rdx
  8053e3:	51                   	push   rcx
  8053e4:	53                   	push   rbx
  8053e5:	50                   	push   rax
  8053e6:	e8 83 b1 ff ff       	call   80056e <syscall>
  8053eb:	48 83 c4 18          	add    rsp,0x18
  8053ef:	cf                   	iret   

00000000008053f0 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  8053f0:	f3 0f 1e fa          	endbr64 
  8053f4:	55                   	push   rbp
  8053f5:	48 89 e5             	mov    rbp,rsp
  8053f8:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  8053fc:	8b 05 32 ed c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ed32]        # 424134 <framebuffer+0x14>
  805402:	89 c0                	mov    eax,eax
  805404:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  805408:	8b 05 2a ed c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ed2a]        # 424138 <framebuffer+0x18>
  80540e:	89 c0                	mov    eax,eax
  805410:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  805414:	0f b6 05 21 ed c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1ed21]        # 42413c <framebuffer+0x1c>
  80541b:	c0 e8 03             	shr    al,0x3
  80541e:	0f b6 c0             	movzx  eax,al
  805421:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  805425:	8b 05 05 ed c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ed05]        # 424130 <framebuffer+0x10>
  80542b:	89 c0                	mov    eax,eax
  80542d:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  805431:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805435:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  80543a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  80543e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805442:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  805447:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  80544b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80544f:	48 c1 e8 0c          	shr    rax,0xc
  805453:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  805456:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  80545d:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  80545e:	48 8b 05 c3 ec c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ecc3]        # 424128 <framebuffer+0x8>
  805465:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  805469:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  805470:	00 
  805471:	eb 2d                	jmp    8054a0 <init_framebuffer+0xb0>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  805473:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  805477:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80547b:	ba 07 00 00 00       	mov    edx,0x7
  805480:	48 89 ce             	mov    rsi,rcx
  805483:	48 89 c7             	mov    rdi,rax
  805486:	e8 be b9 ff ff       	call   800e49 <mmap>
        pp+=PAGE_SIZE;
  80548b:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  805492:	00 
        p+=PAGE_SIZE;
  805493:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  80549a:	00 
    for (size_t i = 0; i < pgc; i++)
  80549b:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  8054a0:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8054a3:	48 98                	cdqe   
  8054a5:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  8054a9:	72 c8                	jb     805473 <init_framebuffer+0x83>
    }
    
    
}
  8054ab:	90                   	nop
  8054ac:	90                   	nop
  8054ad:	c9                   	leave  
  8054ae:	c3                   	ret    

00000000008054af <init_font>:
void init_font(){
  8054af:	f3 0f 1e fa          	endbr64 
  8054b3:	55                   	push   rbp
  8054b4:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  8054b7:	48 c7 05 9e ec c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1ec9e],0x809e68        # 424160 <boot_font>
  8054be:	68 9e 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  8054c2:	48 8b 05 97 ec c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ec97]        # 424160 <boot_font>
  8054c9:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  8054cc:	83 c0 07             	add    eax,0x7
  8054cf:	c1 e8 03             	shr    eax,0x3
  8054d2:	89 05 98 ec c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ec98],eax        # 424170 <font_width_bytes>
    font_width = font_width_bytes * 8;
  8054d8:	8b 05 92 ec c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ec92]        # 424170 <font_width_bytes>
  8054de:	c1 e0 03             	shl    eax,0x3
  8054e1:	89 05 81 ec c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ec81],eax        # 424168 <font_width>
    font_height = boot_font->height;
  8054e7:	48 8b 05 72 ec c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ec72]        # 424160 <boot_font>
  8054ee:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8054f1:	89 05 75 ec c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ec75],eax        # 42416c <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  8054f7:	48 8b 05 62 ec c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ec62]        # 424160 <boot_font>
  8054fe:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  805501:	89 c0                	mov    eax,eax
  805503:	48 05 68 9e 80 00    	add    rax,0x809e68
  805509:	48 89 05 68 ec c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1ec68],rax        # 424178 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  805510:	48 8b 05 49 ec c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ec49]        # 424160 <boot_font>
  805517:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80551a:	89 05 64 ec c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ec64],eax        # 424184 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  805520:	48 8b 05 39 ec c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ec39]        # 424160 <boot_font>
  805527:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  80552a:	89 05 50 ec c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ec50],eax        # 424180 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  805530:	c7 05 16 ec c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1ec16],0x0        # 424150 <fb_cursor_y>
  805537:	00 00 00 
  80553a:	8b 05 10 ec c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ec10]        # 424150 <fb_cursor_y>
  805540:	89 05 06 ec c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ec06],eax        # 42414c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width *framebuffer.common.framebuffer_bpp/8 / font_width;
  805546:	8b 15 e8 eb c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1ebe8]        # 424134 <framebuffer+0x14>
  80554c:	0f b6 05 e9 eb c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1ebe9]        # 42413c <framebuffer+0x1c>
  805553:	0f b6 c0             	movzx  eax,al
  805556:	0f af c2             	imul   eax,edx
  805559:	c1 e8 03             	shr    eax,0x3
  80555c:	8b 0d 06 ec c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1ec06]        # 424168 <font_width>
  805562:	ba 00 00 00 00       	mov    edx,0x0
  805567:	f7 f1                	div    ecx
  805569:	89 05 e5 eb c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ebe5],eax        # 424154 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height *framebuffer.common.framebuffer_bpp/8 / font_height;
  80556f:	8b 15 c3 eb c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1ebc3]        # 424138 <framebuffer+0x18>
  805575:	0f b6 05 c0 eb c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1ebc0]        # 42413c <framebuffer+0x1c>
  80557c:	0f b6 c0             	movzx  eax,al
  80557f:	0f af c2             	imul   eax,edx
  805582:	c1 e8 03             	shr    eax,0x3
  805585:	8b 35 e1 eb c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1ebe1]        # 42416c <font_height>
  80558b:	ba 00 00 00 00       	mov    edx,0x0
  805590:	f7 f6                	div    esi
  805592:	89 05 c0 eb c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1ebc0],eax        # 424158 <max_ch_nr_y>
    font_size=1;
  805598:	c7 05 06 47 00 00 01 	mov    DWORD PTR [rip+0x4706],0x1        # 809ca8 <font_size>
  80559f:	00 00 00 
}
  8055a2:	90                   	nop
  8055a3:	5d                   	pop    rbp
  8055a4:	c3                   	ret    

00000000008055a5 <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  8055a5:	f3 0f 1e fa          	endbr64 
  8055a9:	55                   	push   rbp
  8055aa:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  8055ad:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  8055b1:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  8055b5:	48 89 05 64 eb c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1eb64],rax        # 424120 <framebuffer>
  8055bc:	48 89 15 65 eb c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1eb65],rdx        # 424128 <framebuffer+0x8>
  8055c3:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  8055c7:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  8055cb:	48 89 05 5e eb c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1eb5e],rax        # 424130 <framebuffer+0x10>
  8055d2:	48 89 15 5f eb c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1eb5f],rdx        # 424138 <framebuffer+0x18>
  8055d9:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  8055dd:	48 89 05 5c eb c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1eb5c],rax        # 424140 <framebuffer+0x20>
}
  8055e4:	90                   	nop
  8055e5:	5d                   	pop    rbp
  8055e6:	c3                   	ret    

00000000008055e7 <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  8055e7:	f3 0f 1e fa          	endbr64 
  8055eb:	55                   	push   rbp
  8055ec:	48 89 e5             	mov    rbp,rsp
  8055ef:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  8055f2:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  8055f5:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  8055f8:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  8055fb:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  8055ff:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  805606:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  805607:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80560a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  80560d:	eb 64                	jmp    805673 <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  80560f:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805612:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  805615:	eb 4b                	jmp    805662 <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805617:	8b 15 13 eb c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1eb13]        # 424130 <framebuffer+0x10>
  80561d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805620:	0f af c2             	imul   eax,edx
  805623:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  805625:	0f b6 05 10 eb c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1eb10]        # 42413c <framebuffer+0x1c>
  80562c:	0f b6 c0             	movzx  eax,al
  80562f:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805633:	8d 50 07             	lea    edx,[rax+0x7]
  805636:	85 c0                	test   eax,eax
  805638:	0f 48 c2             	cmovs  eax,edx
  80563b:	c1 f8 03             	sar    eax,0x3
  80563e:	48 98                	cdqe   
  805640:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805643:	48 05 00 00 00 40    	add    rax,0x40000000
  805649:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  80564d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805651:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  805655:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805659:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  80565c:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  80565e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805662:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805665:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805668:	01 d0                	add    eax,edx
  80566a:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  80566d:	7c a8                	jl     805617 <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  80566f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805673:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  805676:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805679:	01 d0                	add    eax,edx
  80567b:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80567e:	7c 8f                	jl     80560f <fill_rect+0x28>
        }
    }
}
  805680:	90                   	nop
  805681:	90                   	nop
  805682:	5d                   	pop    rbp
  805683:	c3                   	ret    

0000000000805684 <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  805684:	f3 0f 1e fa          	endbr64 
  805688:	55                   	push   rbp
  805689:	48 89 e5             	mov    rbp,rsp
  80568c:	48 83 ec 30          	sub    rsp,0x30
  805690:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  805693:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805696:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  805699:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  80569d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8056a0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  8056a3:	eb 5a                	jmp    8056ff <draw_text+0x7b>
    {
        if(*str=='\n')
  8056a5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8056a9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8056ac:	3c 0a                	cmp    al,0xa
  8056ae:	75 1c                	jne    8056cc <draw_text+0x48>
        {
            y+=font_height*size;
  8056b0:	8b 15 b6 ea c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1eab6]        # 42416c <font_height>
  8056b6:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8056b9:	0f af d0             	imul   edx,eax
  8056bc:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8056bf:	01 d0                	add    eax,edx
  8056c1:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  8056c4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8056c7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  8056ca:	eb 2e                	jmp    8056fa <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  8056cc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8056d0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8056d3:	0f be c8             	movsx  ecx,al
  8056d6:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8056d9:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  8056dc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8056df:	89 c7                	mov    edi,eax
  8056e1:	e8 28 00 00 00       	call   80570e <draw_letter>
            tx+=size*font_width;
  8056e6:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8056e9:	8b 05 79 ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ea79]        # 424168 <font_width>
  8056ef:	0f af d0             	imul   edx,eax
  8056f2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8056f5:	01 d0                	add    eax,edx
  8056f7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  8056fa:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  8056ff:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805703:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805706:	84 c0                	test   al,al
  805708:	75 9b                	jne    8056a5 <draw_text+0x21>
    }
}
  80570a:	90                   	nop
  80570b:	90                   	nop
  80570c:	c9                   	leave  
  80570d:	c3                   	ret    

000000000080570e <draw_letter>:
void draw_letter(int x, int y, int size, char c) {
  80570e:	f3 0f 1e fa          	endbr64 
  805712:	55                   	push   rbp
  805713:	48 89 e5             	mov    rbp,rsp
  805716:	48 83 ec 30          	sub    rsp,0x30
  80571a:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  80571d:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805720:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805723:	89 c8                	mov    eax,ecx
  805725:	88 45 d0             	mov    BYTE PTR [rbp-0x30],al
    u8 *glyph = glyph_table;
  805728:	48 8b 05 49 ea c1 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc1ea49]        # 424178 <glyph_table>
  80572f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  805733:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805737:	8b 05 47 ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ea47]        # 424184 <glyph_nr>
  80573d:	39 c2                	cmp    edx,eax
  80573f:	73 13                	jae    805754 <draw_letter+0x46>
        glyph += c * bytes_per_glyph;
  805741:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805745:	8b 05 35 ea c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ea35]        # 424180 <bytes_per_glyph>
  80574b:	0f af c2             	imul   eax,edx
  80574e:	89 c0                	mov    eax,eax
  805750:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805754:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80575b:	e9 c9 00 00 00       	jmp    805829 <draw_letter+0x11b>
        u8 mask = 1 << 7;
  805760:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805764:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80576b:	e9 9a 00 00 00       	jmp    80580a <draw_letter+0xfc>
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  805770:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805773:	c1 e8 03             	shr    eax,0x3
  805776:	89 c2                	mov    edx,eax
  805778:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80577c:	48 01 d0             	add    rax,rdx
  80577f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805782:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  805785:	84 c0                	test   al,al
  805787:	74 37                	je     8057c0 <draw_letter+0xb2>
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,-1);
  805789:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80578c:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  805790:	89 c2                	mov    edx,eax
  805792:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805795:	01 d0                	add    eax,edx
  805797:	89 c6                	mov    esi,eax
  805799:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80579c:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  8057a0:	89 c2                	mov    edx,eax
  8057a2:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8057a5:	01 d0                	add    eax,edx
  8057a7:	89 c7                	mov    edi,eax
  8057a9:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  8057ac:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8057af:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
  8057b5:	89 d1                	mov    ecx,edx
  8057b7:	89 c2                	mov    edx,eax
  8057b9:	e8 29 fe ff ff       	call   8055e7 <fill_rect>
  8057be:	eb 35                	jmp    8057f5 <draw_letter+0xe7>
            } else {
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,0);
  8057c0:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8057c3:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  8057c7:	89 c2                	mov    edx,eax
  8057c9:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8057cc:	01 d0                	add    eax,edx
  8057ce:	89 c6                	mov    esi,eax
  8057d0:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8057d3:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  8057d7:	89 c2                	mov    edx,eax
  8057d9:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  8057dc:	01 d0                	add    eax,edx
  8057de:	89 c7                	mov    edi,eax
  8057e0:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  8057e3:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8057e6:	41 b8 00 00 00 00    	mov    r8d,0x0
  8057ec:	89 d1                	mov    ecx,edx
  8057ee:	89 c2                	mov    edx,eax
  8057f0:	e8 f2 fd ff ff       	call   8055e7 <fill_rect>
            }

            mask >>= 1;
  8057f5:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  8057f8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8057fb:	83 e0 07             	and    eax,0x7
  8057fe:	85 c0                	test   eax,eax
  805800:	75 04                	jne    805806 <draw_letter+0xf8>
                mask = 1 << 7;
  805802:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805806:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80580a:	8b 05 58 e9 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e958]        # 424168 <font_width>
  805810:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805813:	0f 82 57 ff ff ff    	jb     805770 <draw_letter+0x62>
            }
        }

        glyph += font_width_bytes;
  805819:	8b 05 51 e9 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e951]        # 424170 <font_width_bytes>
  80581f:	89 c0                	mov    eax,eax
  805821:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805825:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805829:	8b 05 3d e9 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e93d]        # 42416c <font_height>
  80582f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  805832:	0f 82 28 ff ff ff    	jb     805760 <draw_letter+0x52>
    }
}
  805838:	90                   	nop
  805839:	90                   	nop
  80583a:	c9                   	leave  
  80583b:	c3                   	ret    

000000000080583c <scr_up>:
//向上滚动一个像素
void scr_up(){
  80583c:	f3 0f 1e fa          	endbr64 
  805840:	55                   	push   rbp
  805841:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805844:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80584b:	eb 6c                	jmp    8058b9 <scr_up+0x7d>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  80584d:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805854:	eb 52                	jmp    8058a8 <scr_up+0x6c>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805856:	8b 15 d4 e8 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1e8d4]        # 424130 <framebuffer+0x10>
  80585c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80585f:	0f af c2             	imul   eax,edx
  805862:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  805864:	0f b6 05 d1 e8 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1e8d1]        # 42413c <framebuffer+0x1c>
  80586b:	0f b6 c0             	movzx  eax,al
  80586e:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805872:	8d 50 07             	lea    edx,[rax+0x7]
  805875:	85 c0                	test   eax,eax
  805877:	0f 48 c2             	cmovs  eax,edx
  80587a:	c1 f8 03             	sar    eax,0x3
  80587d:	48 98                	cdqe   
  80587f:	48 01 c8             	add    rax,rcx
  805882:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805888:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  80588c:	8b 05 9e e8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e89e]        # 424130 <framebuffer+0x10>
  805892:	89 c2                	mov    edx,eax
  805894:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805898:	48 01 d0             	add    rax,rdx
  80589b:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80589e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8058a2:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  8058a4:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8058a8:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8058ab:	8b 05 a3 e8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e8a3]        # 424154 <max_ch_nr_x>
  8058b1:	39 c2                	cmp    edx,eax
  8058b3:	72 a1                	jb     805856 <scr_up+0x1a>
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  8058b5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8058b9:	8b 05 99 e8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e899]        # 424158 <max_ch_nr_y>
  8058bf:	8d 50 ff             	lea    edx,[rax-0x1]
  8058c2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058c5:	39 c2                	cmp    edx,eax
  8058c7:	77 84                	ja     80584d <scr_up+0x11>
        }

    }
}
  8058c9:	90                   	nop
  8058ca:	90                   	nop
  8058cb:	5d                   	pop    rbp
  8058cc:	c3                   	ret    

00000000008058cd <scr_down>:
void scr_down(){
  8058cd:	f3 0f 1e fa          	endbr64 
  8058d1:	55                   	push   rbp
  8058d2:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  8058d5:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  8058dc:	eb 72                	jmp    805950 <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  8058de:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8058e5:	eb 58                	jmp    80593f <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  8058e7:	8b 15 43 e8 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1e843]        # 424130 <framebuffer+0x10>
  8058ed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058f0:	0f af c2             	imul   eax,edx
  8058f3:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  8058f5:	0f b6 05 40 e8 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1e840]        # 42413c <framebuffer+0x1c>
  8058fc:	0f b6 c0             	movzx  eax,al
  8058ff:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805903:	8d 50 07             	lea    edx,[rax+0x7]
  805906:	85 c0                	test   eax,eax
  805908:	0f 48 c2             	cmovs  eax,edx
  80590b:	c1 f8 03             	sar    eax,0x3
  80590e:	48 98                	cdqe   
  805910:	48 01 c8             	add    rax,rcx
  805913:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805919:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  80591d:	8b 05 0d e8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e80d]        # 424130 <framebuffer+0x10>
  805923:	89 c0                	mov    eax,eax
  805925:	48 f7 d8             	neg    rax
  805928:	48 89 c2             	mov    rdx,rax
  80592b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80592f:	48 01 d0             	add    rax,rdx
  805932:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  805935:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805939:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  80593b:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80593f:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805942:	8b 05 0c e8 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e80c]        # 424154 <max_ch_nr_x>
  805948:	39 c2                	cmp    edx,eax
  80594a:	72 9b                	jb     8058e7 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  80594c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805950:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  805953:	8b 05 ff e7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e7ff]        # 424158 <max_ch_nr_y>
  805959:	39 c2                	cmp    edx,eax
  80595b:	72 81                	jb     8058de <scr_down+0x11>
        }

    }
}
  80595d:	90                   	nop
  80595e:	90                   	nop
  80595f:	5d                   	pop    rbp
  805960:	c3                   	ret    

0000000000805961 <print>:
void print(char* s){
  805961:	f3 0f 1e fa          	endbr64 
  805965:	55                   	push   rbp
  805966:	48 89 e5             	mov    rbp,rsp
  805969:	48 83 ec 18          	sub    rsp,0x18
  80596d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(;*s;s++){
  805971:	e9 f7 00 00 00       	jmp    805a6d <print+0x10c>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  805976:	8b 15 d0 e7 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1e7d0]        # 42414c <fb_cursor_x>
  80597c:	8b 05 d2 e7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e7d2]        # 424154 <max_ch_nr_x>
  805982:	39 c2                	cmp    edx,eax
  805984:	77 0b                	ja     805991 <print+0x30>
  805986:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80598a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80598d:	3c 0a                	cmp    al,0xa
  80598f:	75 19                	jne    8059aa <print+0x49>
        {
            fb_cursor_y+=1;
  805991:	8b 05 b9 e7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e7b9]        # 424150 <fb_cursor_y>
  805997:	83 c0 01             	add    eax,0x1
  80599a:	89 05 b0 e7 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1e7b0],eax        # 424150 <fb_cursor_y>
            fb_cursor_x=0;
  8059a0:	c7 05 a2 e7 c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc1e7a2],0x0        # 42414c <fb_cursor_x>
  8059a7:	00 00 00 
        }
        if(*s=='\n')continue;
  8059aa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8059ae:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8059b1:	3c 0a                	cmp    al,0xa
  8059b3:	0f 84 ae 00 00 00    	je     805a67 <print+0x106>
        if(fb_cursor_y>=max_ch_nr_y){
  8059b9:	8b 15 91 e7 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1e791]        # 424150 <fb_cursor_y>
  8059bf:	8b 05 93 e7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e793]        # 424158 <max_ch_nr_y>
  8059c5:	39 c2                	cmp    edx,eax
  8059c7:	72 3c                	jb     805a05 <print+0xa4>
            for(int i=0;i<font_height*font_size;i++)
  8059c9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8059d0:	eb 0e                	jmp    8059e0 <print+0x7f>
                scr_up();
  8059d2:	b8 00 00 00 00       	mov    eax,0x0
  8059d7:	e8 60 fe ff ff       	call   80583c <scr_up>
            for(int i=0;i<font_height*font_size;i++)
  8059dc:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8059e0:	8b 05 86 e7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e786]        # 42416c <font_height>
  8059e6:	8b 15 bc 42 00 00    	mov    edx,DWORD PTR [rip+0x42bc]        # 809ca8 <font_size>
  8059ec:	0f af d0             	imul   edx,eax
  8059ef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8059f2:	39 c2                	cmp    edx,eax
  8059f4:	77 dc                	ja     8059d2 <print+0x71>
            fb_cursor_y=max_ch_nr_y-1;
  8059f6:	8b 05 5c e7 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e75c]        # 424158 <max_ch_nr_y>
  8059fc:	83 e8 01             	sub    eax,0x1
  8059ff:	89 05 4b e7 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1e74b],eax        # 424150 <fb_cursor_y>
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  805a05:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805a09:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a0c:	0f be d0             	movsx  edx,al
  805a0f:	8b 05 93 42 00 00    	mov    eax,DWORD PTR [rip+0x4293]        # 809ca8 <font_size>
  805a15:	8b 35 35 e7 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1e735]        # 424150 <fb_cursor_y>
  805a1b:	8b 0d 4b e7 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1e74b]        # 42416c <font_height>
  805a21:	0f af ce             	imul   ecx,esi
  805a24:	8b 35 7e 42 00 00    	mov    esi,DWORD PTR [rip+0x427e]        # 809ca8 <font_size>
  805a2a:	0f af ce             	imul   ecx,esi
  805a2d:	41 89 c8             	mov    r8d,ecx
  805a30:	8b 35 16 e7 c1 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc1e716]        # 42414c <fb_cursor_x>
  805a36:	8b 0d 2c e7 c1 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc1e72c]        # 424168 <font_width>
  805a3c:	0f af ce             	imul   ecx,esi
  805a3f:	8b 35 63 42 00 00    	mov    esi,DWORD PTR [rip+0x4263]        # 809ca8 <font_size>
  805a45:	0f af ce             	imul   ecx,esi
  805a48:	89 cf                	mov    edi,ecx
  805a4a:	89 d1                	mov    ecx,edx
  805a4c:	89 c2                	mov    edx,eax
  805a4e:	44 89 c6             	mov    esi,r8d
  805a51:	e8 b8 fc ff ff       	call   80570e <draw_letter>
        fb_cursor_x+=1;
  805a56:	8b 05 f0 e6 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1e6f0]        # 42414c <fb_cursor_x>
  805a5c:	83 c0 01             	add    eax,0x1
  805a5f:	89 05 e7 e6 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1e6e7],eax        # 42414c <fb_cursor_x>
  805a65:	eb 01                	jmp    805a68 <print+0x107>
        if(*s=='\n')continue;
  805a67:	90                   	nop
    for(;*s;s++){
  805a68:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  805a6d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805a71:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805a74:	84 c0                	test   al,al
  805a76:	0f 85 fa fe ff ff    	jne    805976 <print+0x15>
    }
}
  805a7c:	90                   	nop
  805a7d:	90                   	nop
  805a7e:	c9                   	leave  
  805a7f:	c3                   	ret    

0000000000805a80 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  805a80:	f3 0f 1e fa          	endbr64 
  805a84:	55                   	push   rbp
  805a85:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  805a88:	0f b6 05 1e e9 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1e91e]        # 4243ad <k_shift>
  805a8f:	84 c0                	test   al,al
  805a91:	0f 94 c0             	sete   al
  805a94:	88 05 13 e9 c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1e913],al        # 4243ad <k_shift>
}
  805a9a:	90                   	nop
  805a9b:	5d                   	pop    rbp
  805a9c:	c3                   	ret    

0000000000805a9d <ctrl>:
void ctrl()
{
  805a9d:	f3 0f 1e fa          	endbr64 
  805aa1:	55                   	push   rbp
  805aa2:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  805aa5:	0f b6 05 02 e9 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1e902]        # 4243ae <k_ctrl>
  805aac:	84 c0                	test   al,al
  805aae:	0f 94 c0             	sete   al
  805ab1:	88 05 f7 e8 c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1e8f7],al        # 4243ae <k_ctrl>
}
  805ab7:	90                   	nop
  805ab8:	5d                   	pop    rbp
  805ab9:	c3                   	ret    

0000000000805aba <capslock>:
void capslock()
{
  805aba:	f3 0f 1e fa          	endbr64 
  805abe:	55                   	push   rbp
  805abf:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  805ac2:	0f b6 05 e6 e8 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1e8e6]        # 4243af <k_capslock>
  805ac9:	84 c0                	test   al,al
  805acb:	0f 94 c0             	sete   al
  805ace:	88 05 db e8 c1 ff    	mov    BYTE PTR [rip+0xffffffffffc1e8db],al        # 4243af <k_capslock>
}
  805ad4:	90                   	nop
  805ad5:	5d                   	pop    rbp
  805ad6:	c3                   	ret    

0000000000805ad7 <to_ascii>:
char to_ascii(char scan_code)
{
  805ad7:	f3 0f 1e fa          	endbr64 
  805adb:	55                   	push   rbp
  805adc:	48 89 e5             	mov    rbp,rsp
  805adf:	89 f8                	mov    eax,edi
  805ae1:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  805ae4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805aeb:	e9 c7 00 00 00       	jmp    805bb7 <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  805af0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805af3:	48 63 d0             	movsxd rdx,eax
  805af6:	48 89 d0             	mov    rax,rdx
  805af9:	48 c1 e0 02          	shl    rax,0x2
  805afd:	48 01 d0             	add    rax,rdx
  805b00:	48 05 42 19 81 00    	add    rax,0x811942
  805b06:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805b09:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  805b0c:	0f 85 a1 00 00 00    	jne    805bb3 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  805b12:	0f b6 05 96 e8 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1e896]        # 4243af <k_capslock>
  805b19:	84 c0                	test   al,al
  805b1b:	74 55                	je     805b72 <to_ascii+0x9b>
  805b1d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b20:	48 63 d0             	movsxd rdx,eax
  805b23:	48 89 d0             	mov    rax,rdx
  805b26:	48 c1 e0 02          	shl    rax,0x2
  805b2a:	48 01 d0             	add    rax,rdx
  805b2d:	48 05 40 19 81 00    	add    rax,0x811940
  805b33:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805b36:	3c 60                	cmp    al,0x60
  805b38:	7e 38                	jle    805b72 <to_ascii+0x9b>
  805b3a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b3d:	48 63 d0             	movsxd rdx,eax
  805b40:	48 89 d0             	mov    rax,rdx
  805b43:	48 c1 e0 02          	shl    rax,0x2
  805b47:	48 01 d0             	add    rax,rdx
  805b4a:	48 05 40 19 81 00    	add    rax,0x811940
  805b50:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805b53:	3c 7a                	cmp    al,0x7a
  805b55:	7f 1b                	jg     805b72 <to_ascii+0x9b>
  805b57:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b5a:	48 63 d0             	movsxd rdx,eax
  805b5d:	48 89 d0             	mov    rax,rdx
  805b60:	48 c1 e0 02          	shl    rax,0x2
  805b64:	48 01 d0             	add    rax,rdx
  805b67:	48 05 41 19 81 00    	add    rax,0x811941
  805b6d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805b70:	eb 54                	jmp    805bc6 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  805b72:	0f b6 05 34 e8 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1e834]        # 4243ad <k_shift>
  805b79:	84 c0                	test   al,al
  805b7b:	74 1b                	je     805b98 <to_ascii+0xc1>
  805b7d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b80:	48 63 d0             	movsxd rdx,eax
  805b83:	48 89 d0             	mov    rax,rdx
  805b86:	48 c1 e0 02          	shl    rax,0x2
  805b8a:	48 01 d0             	add    rax,rdx
  805b8d:	48 05 41 19 81 00    	add    rax,0x811941
  805b93:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805b96:	eb 2e                	jmp    805bc6 <to_ascii+0xef>
            else return key_map[i].ascii;
  805b98:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b9b:	48 63 d0             	movsxd rdx,eax
  805b9e:	48 89 d0             	mov    rax,rdx
  805ba1:	48 c1 e0 02          	shl    rax,0x2
  805ba5:	48 01 d0             	add    rax,rdx
  805ba8:	48 05 40 19 81 00    	add    rax,0x811940
  805bae:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805bb1:	eb 13                	jmp    805bc6 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  805bb3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805bb7:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  805bbb:	0f 8e 2f ff ff ff    	jle    805af0 <to_ascii+0x19>
        }

    return '\0';
  805bc1:	b8 00 00 00 00       	mov    eax,0x0
}
  805bc6:	5d                   	pop    rbp
  805bc7:	c3                   	ret    

0000000000805bc8 <init_kb>:
int init_kb()
{
  805bc8:	f3 0f 1e fa          	endbr64 
  805bcc:	55                   	push   rbp
  805bcd:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  805bd0:	bf 80 18 81 00       	mov    edi,0x811880
  805bd5:	e8 01 cf ff ff       	call   802adb <reg_device>
    reg_driver(&drv_keyboard);
  805bda:	bf e0 17 81 00       	mov    edi,0x8117e0
  805bdf:	e8 df d1 ff ff       	call   802dc3 <reg_driver>
}
  805be4:	90                   	nop
  805be5:	5d                   	pop    rbp
  805be6:	c3                   	ret    

0000000000805be7 <key_proc>:
int key_proc()
{
  805be7:	f3 0f 1e fa          	endbr64 
  805beb:	55                   	push   rbp
  805bec:	48 89 e5             	mov    rbp,rsp
  805bef:	48 83 ec 10          	sub    rsp,0x10
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  805bf3:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  805bf7:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  805bfb:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  805bff:	bf 60 00 00 00       	mov    edi,0x60
  805c04:	e8 a0 eb ff ff       	call   8047a9 <inb>
  805c09:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  805c0c:	8b 05 aa 40 00 00    	mov    eax,DWORD PTR [rip+0x40aa]        # 809cbc <key_bufq+0xc>
  805c12:	83 c0 01             	add    eax,0x1
  805c15:	8b 0d a5 40 00 00    	mov    ecx,DWORD PTR [rip+0x40a5]        # 809cc0 <key_bufq+0x10>
  805c1b:	99                   	cdq    
  805c1c:	f7 f9                	idiv   ecx
  805c1e:	8b 05 94 40 00 00    	mov    eax,DWORD PTR [rip+0x4094]        # 809cb8 <key_bufq+0x8>
  805c24:	39 c2                	cmp    edx,eax
  805c26:	74 32                	je     805c5a <key_proc+0x73>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  805c28:	48 8b 15 81 40 00 00 	mov    rdx,QWORD PTR [rip+0x4081]        # 809cb0 <key_bufq>
  805c2f:	8b 05 87 40 00 00    	mov    eax,DWORD PTR [rip+0x4087]        # 809cbc <key_bufq+0xc>
  805c35:	48 98                	cdqe   
  805c37:	48 01 c2             	add    rdx,rax
  805c3a:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  805c3e:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  805c40:	8b 05 76 40 00 00    	mov    eax,DWORD PTR [rip+0x4076]        # 809cbc <key_bufq+0xc>
  805c46:	83 c0 01             	add    eax,0x1
  805c49:	8b 0d 71 40 00 00    	mov    ecx,DWORD PTR [rip+0x4071]        # 809cc0 <key_bufq+0x10>
  805c4f:	99                   	cdq    
  805c50:	f7 f9                	idiv   ecx
  805c52:	89 d0                	mov    eax,edx
  805c54:	89 05 62 40 00 00    	mov    DWORD PTR [rip+0x4062],eax        # 809cbc <key_bufq+0xc>
    }

    if(scan1==0x48)
  805c5a:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  805c5e:	75 0a                	jne    805c6a <key_proc+0x83>
        scr_up();
  805c60:	b8 00 00 00 00       	mov    eax,0x0
  805c65:	e8 d2 fb ff ff       	call   80583c <scr_up>
    if(scan1==0x50)
  805c6a:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  805c6e:	75 0a                	jne    805c7a <key_proc+0x93>
        scr_down();
  805c70:	b8 00 00 00 00       	mov    eax,0x0
  805c75:	e8 53 fc ff ff       	call   8058cd <scr_down>
    switch (scan1)
  805c7a:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  805c7e:	3d b6 00 00 00       	cmp    eax,0xb6
  805c83:	74 41                	je     805cc6 <key_proc+0xdf>
  805c85:	3d b6 00 00 00       	cmp    eax,0xb6
  805c8a:	7f 5e                	jg     805cea <key_proc+0x103>
  805c8c:	3d aa 00 00 00       	cmp    eax,0xaa
  805c91:	74 33                	je     805cc6 <key_proc+0xdf>
  805c93:	3d aa 00 00 00       	cmp    eax,0xaa
  805c98:	7f 50                	jg     805cea <key_proc+0x103>
  805c9a:	3d 9d 00 00 00       	cmp    eax,0x9d
  805c9f:	74 31                	je     805cd2 <key_proc+0xeb>
  805ca1:	3d 9d 00 00 00       	cmp    eax,0x9d
  805ca6:	7f 42                	jg     805cea <key_proc+0x103>
  805ca8:	83 f8 3a             	cmp    eax,0x3a
  805cab:	74 31                	je     805cde <key_proc+0xf7>
  805cad:	83 f8 3a             	cmp    eax,0x3a
  805cb0:	7f 38                	jg     805cea <key_proc+0x103>
  805cb2:	83 f8 36             	cmp    eax,0x36
  805cb5:	74 0f                	je     805cc6 <key_proc+0xdf>
  805cb7:	83 f8 36             	cmp    eax,0x36
  805cba:	7f 2e                	jg     805cea <key_proc+0x103>
  805cbc:	83 f8 1d             	cmp    eax,0x1d
  805cbf:	74 11                	je     805cd2 <key_proc+0xeb>
  805cc1:	83 f8 2a             	cmp    eax,0x2a
  805cc4:	75 24                	jne    805cea <key_proc+0x103>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  805cc6:	b8 00 00 00 00       	mov    eax,0x0
  805ccb:	e8 b0 fd ff ff       	call   805a80 <shift>
            break;
  805cd0:	eb 19                	jmp    805ceb <key_proc+0x104>
        case 0x1d:
        case 0x9d:
            ctrl();
  805cd2:	b8 00 00 00 00       	mov    eax,0x0
  805cd7:	e8 c1 fd ff ff       	call   805a9d <ctrl>
            break;
  805cdc:	eb 0d                	jmp    805ceb <key_proc+0x104>
        case 0x3a:
            capslock();
  805cde:	b8 00 00 00 00       	mov    eax,0x0
  805ce3:	e8 d2 fd ff ff       	call   805aba <capslock>
            break;
  805ce8:	eb 01                	jmp    805ceb <key_proc+0x104>
        default:
            break;
  805cea:	90                   	nop
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  805ceb:	b8 00 00 00 00       	mov    eax,0x0
  805cf0:	e8 c9 ea ff ff       	call   8047be <eoi>
    asm volatile("leave \r\n iretq");
  805cf5:	c9                   	leave  
  805cf6:	48 cf                	iretq  
}
  805cf8:	90                   	nop
  805cf9:	c9                   	leave  
  805cfa:	c3                   	ret    

0000000000805cfb <sys_getkbc>:

char sys_getkbc()
{
  805cfb:	f3 0f 1e fa          	endbr64 
  805cff:	55                   	push   rbp
  805d00:	48 89 e5             	mov    rbp,rsp
    if(key_bufq.tail==key_bufq.head)return -1;
  805d03:	8b 15 b3 3f 00 00    	mov    edx,DWORD PTR [rip+0x3fb3]        # 809cbc <key_bufq+0xc>
  805d09:	8b 05 a9 3f 00 00    	mov    eax,DWORD PTR [rip+0x3fa9]        # 809cb8 <key_bufq+0x8>
  805d0f:	39 c2                	cmp    edx,eax
  805d11:	75 07                	jne    805d1a <sys_getkbc+0x1f>
  805d13:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805d18:	eb 30                	jmp    805d4a <sys_getkbc+0x4f>
    char c=key_buf[key_bufq.tail];
  805d1a:	8b 05 9c 3f 00 00    	mov    eax,DWORD PTR [rip+0x3f9c]        # 809cbc <key_bufq+0xc>
  805d20:	48 98                	cdqe   
  805d22:	0f b6 80 a0 41 42 00 	movzx  eax,BYTE PTR [rax+0x4241a0]
  805d29:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QTAIL(key_bufq)=(QTAIL(key_bufq)+1)%QSIZE(key_bufq);
  805d2c:	8b 05 8a 3f 00 00    	mov    eax,DWORD PTR [rip+0x3f8a]        # 809cbc <key_bufq+0xc>
  805d32:	83 c0 01             	add    eax,0x1
  805d35:	8b 0d 85 3f 00 00    	mov    ecx,DWORD PTR [rip+0x3f85]        # 809cc0 <key_bufq+0x10>
  805d3b:	99                   	cdq    
  805d3c:	f7 f9                	idiv   ecx
  805d3e:	89 d0                	mov    eax,edx
  805d40:	89 05 76 3f 00 00    	mov    DWORD PTR [rip+0x3f76],eax        # 809cbc <key_bufq+0xc>
    return c;
  805d46:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  805d4a:	5d                   	pop    rbp
  805d4b:	c3                   	ret    

0000000000805d4c <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  805d4c:	f3 0f 1e fa          	endbr64 
  805d50:	55                   	push   rbp
  805d51:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  805d54:	b8 00 00 00 00       	mov    eax,0x0
  805d59:	e8 8d 09 00 00       	call   8066eb <hd_iterate>
    return 0;
  805d5e:	b8 00 00 00 00       	mov    eax,0x0
}
  805d63:	5d                   	pop    rbp
  805d64:	c3                   	ret    

0000000000805d65 <disk_int_handler_c>:

int disk_int_handler_c()
{
  805d65:	f3 0f 1e fa          	endbr64 
  805d69:	55                   	push   rbp
  805d6a:	48 89 e5             	mov    rbp,rsp
  805d6d:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  805d71:	48 8b 05 48 13 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21348]        # 4270c0 <running_req>
  805d78:	48 85 c0             	test   rax,rax
  805d7b:	75 0a                	jne    805d87 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  805d7d:	b8 01 00 00 00       	mov    eax,0x1
  805d82:	e9 a3 01 00 00       	jmp    805f2a <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  805d87:	48 8b 05 32 13 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21332]        # 4270c0 <running_req>
  805d8e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  805d92:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  805d96:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  805d9d:	48 8b 05 1c 13 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2131c]        # 4270c0 <running_req>
  805da4:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805da7:	83 f8 02             	cmp    eax,0x2
  805daa:	74 0f                	je     805dbb <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  805dac:	48 8b 05 0d 13 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2130d]        # 4270c0 <running_req>
  805db3:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  805db6:	83 f8 03             	cmp    eax,0x3
  805db9:	75 07                	jne    805dc2 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  805dbb:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  805dc2:	48 8b 05 f7 12 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc212f7]        # 4270c0 <running_req>
  805dc9:	8b 00                	mov    eax,DWORD PTR [rax]
  805dcb:	85 c0                	test   eax,eax
  805dcd:	75 42                	jne    805e11 <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  805dcf:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  805dd6:	eb 22                	jmp    805dfa <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  805dd8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805ddb:	0f b7 c0             	movzx  eax,ax
  805dde:	89 c7                	mov    edi,eax
  805de0:	e8 ce e9 ff ff       	call   8047b3 <inw>
  805de5:	89 c2                	mov    edx,eax
  805de7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805deb:	48 8d 48 02          	lea    rcx,[rax+0x2]
  805def:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  805df3:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  805df6:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  805dfa:	48 8b 05 bf 12 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc212bf]        # 4270c0 <running_req>
  805e01:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  805e04:	c1 e0 08             	shl    eax,0x8
  805e07:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  805e0a:	7c cc                	jl     805dd8 <disk_int_handler_c+0x73>
  805e0c:	e9 ca 00 00 00       	jmp    805edb <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  805e11:	48 8b 05 a8 12 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc212a8]        # 4270c0 <running_req>
  805e18:	8b 00                	mov    eax,DWORD PTR [rax]
  805e1a:	83 f8 01             	cmp    eax,0x1
  805e1d:	75 42                	jne    805e61 <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  805e1f:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805e26:	eb 25                	jmp    805e4d <disk_int_handler_c+0xe8>
            outw(port,*p++);
  805e28:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805e2c:	48 8d 50 02          	lea    rdx,[rax+0x2]
  805e30:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  805e34:	0f b7 00             	movzx  eax,WORD PTR [rax]
  805e37:	0f b7 d0             	movzx  edx,ax
  805e3a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805e3d:	0f b7 c0             	movzx  eax,ax
  805e40:	89 d6                	mov    esi,edx
  805e42:	89 c7                	mov    edi,eax
  805e44:	e8 54 e9 ff ff       	call   80479d <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  805e49:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805e4d:	48 8b 05 6c 12 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2126c]        # 4270c0 <running_req>
  805e54:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  805e57:	c1 e0 08             	shl    eax,0x8
  805e5a:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805e5d:	7c c9                	jl     805e28 <disk_int_handler_c+0xc3>
  805e5f:	eb 7a                	jmp    805edb <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  805e61:	48 8b 05 58 12 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21258]        # 4270c0 <running_req>
  805e68:	8b 00                	mov    eax,DWORD PTR [rax]
  805e6a:	83 f8 02             	cmp    eax,0x2
  805e6d:	75 34                	jne    805ea3 <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  805e6f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805e72:	83 c0 07             	add    eax,0x7
  805e75:	0f b6 c0             	movzx  eax,al
  805e78:	89 c7                	mov    edi,eax
  805e7a:	e8 2a e9 ff ff       	call   8047a9 <inb>
  805e7f:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  805e82:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805e85:	0f b7 c0             	movzx  eax,ax
  805e88:	89 c7                	mov    edi,eax
  805e8a:	e8 24 e9 ff ff       	call   8047b3 <inw>
  805e8f:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  805e93:	48 8b 05 26 12 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21226]        # 4270c0 <running_req>
  805e9a:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  805ea1:	eb 38                	jmp    805edb <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  805ea3:	48 8b 05 16 12 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21216]        # 4270c0 <running_req>
  805eaa:	8b 00                	mov    eax,DWORD PTR [rax]
  805eac:	83 f8 03             	cmp    eax,0x3
  805eaf:	75 2a                	jne    805edb <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  805eb1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  805eb4:	83 c0 07             	add    eax,0x7
  805eb7:	0f b6 c0             	movzx  eax,al
  805eba:	89 c7                	mov    edi,eax
  805ebc:	e8 e8 e8 ff ff       	call   8047a9 <inb>
  805ec1:	0f b6 c0             	movzx  eax,al
  805ec4:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  805ec7:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805eca:	89 c6                	mov    esi,eax
  805ecc:	bf 16 1b 81 00       	mov    edi,0x811b16
  805ed1:	b8 00 00 00 00       	mov    eax,0x0
  805ed6:	e8 a1 ad ff ff       	call   800c7c <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  805edb:	48 8b 05 de 11 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc211de]        # 4270c0 <running_req>
  805ee2:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  805ee9:	48 8b 05 d0 11 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc211d0]        # 4270c0 <running_req>
  805ef0:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  805ef4:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  805efb:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  805efe:	48 8b 05 c3 11 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc211c3]        # 4270c8 <running_devman_req>
  805f05:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  805f0c:	00 00 00 
    running_devman_req=NULL;
  805f0f:	48 c7 05 ae 11 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc211ae],0x0        # 4270c8 <running_devman_req>
  805f16:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  805f1a:	48 c7 05 9b 11 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2119b],0x0        # 4270c0 <running_req>
  805f21:	00 00 00 00 
    return 0;
  805f25:	b8 00 00 00 00       	mov    eax,0x0
}
  805f2a:	c9                   	leave  
  805f2b:	c3                   	ret    

0000000000805f2c <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  805f2c:	f3 0f 1e fa          	endbr64 
  805f30:	55                   	push   rbp
  805f31:	48 89 e5             	mov    rbp,rsp
  805f34:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  805f37:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f3a:	48 63 d0             	movsxd rdx,eax
  805f3d:	48 89 d0             	mov    rax,rdx
  805f40:	48 01 c0             	add    rax,rax
  805f43:	48 01 d0             	add    rax,rdx
  805f46:	48 c1 e0 04          	shl    rax,0x4
  805f4a:	48 05 dc 43 42 00    	add    rax,0x4243dc
  805f50:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805f52:	5d                   	pop    rbp
  805f53:	c3                   	ret    

0000000000805f54 <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  805f54:	f3 0f 1e fa          	endbr64 
  805f58:	55                   	push   rbp
  805f59:	48 89 e5             	mov    rbp,rsp
  805f5c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  805f5f:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805f62:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  805f65:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  805f68:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  805f6c:	8b 05 82 11 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21182]        # 4270f4 <tail>
  805f72:	83 c0 01             	add    eax,0x1
  805f75:	48 63 d0             	movsxd rdx,eax
  805f78:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  805f7f:	48 c1 ea 20          	shr    rdx,0x20
  805f83:	01 c2                	add    edx,eax
  805f85:	c1 fa 07             	sar    edx,0x7
  805f88:	89 c1                	mov    ecx,eax
  805f8a:	c1 f9 1f             	sar    ecx,0x1f
  805f8d:	29 ca                	sub    edx,ecx
  805f8f:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  805f95:	29 c8                	sub    eax,ecx
  805f97:	89 c2                	mov    edx,eax
  805f99:	8b 05 51 11 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21151]        # 4270f0 <head>
  805f9f:	39 c2                	cmp    edx,eax
  805fa1:	75 0a                	jne    805fad <request+0x59>
    {
        return -1;
  805fa3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805fa8:	e9 0d 01 00 00       	jmp    8060ba <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  805fad:	8b 05 41 11 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21141]        # 4270f4 <tail>
  805fb3:	48 63 d0             	movsxd rdx,eax
  805fb6:	48 89 d0             	mov    rax,rdx
  805fb9:	48 01 c0             	add    rax,rax
  805fbc:	48 01 d0             	add    rax,rdx
  805fbf:	48 c1 e0 04          	shl    rax,0x4
  805fc3:	48 8d 90 c4 43 42 00 	lea    rdx,[rax+0x4243c4]
  805fca:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805fcd:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  805fcf:	8b 05 1f 11 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2111f]        # 4270f4 <tail>
  805fd5:	48 63 d0             	movsxd rdx,eax
  805fd8:	48 89 d0             	mov    rax,rdx
  805fdb:	48 01 c0             	add    rax,rax
  805fde:	48 01 d0             	add    rax,rdx
  805fe1:	48 c1 e0 04          	shl    rax,0x4
  805fe5:	48 8d 90 c0 43 42 00 	lea    rdx,[rax+0x4243c0]
  805fec:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805fef:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  805ff1:	8b 05 fd 10 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc210fd]        # 4270f4 <tail>
  805ff7:	48 63 d0             	movsxd rdx,eax
  805ffa:	48 89 d0             	mov    rax,rdx
  805ffd:	48 01 c0             	add    rax,rax
  806000:	48 01 d0             	add    rax,rdx
  806003:	48 c1 e0 04          	shl    rax,0x4
  806007:	48 8d 90 c8 43 42 00 	lea    rdx,[rax+0x4243c8]
  80600e:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806011:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  806013:	8b 05 db 10 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc210db]        # 4270f4 <tail>
  806019:	48 63 d0             	movsxd rdx,eax
  80601c:	48 89 d0             	mov    rax,rdx
  80601f:	48 01 c0             	add    rax,rax
  806022:	48 01 d0             	add    rax,rdx
  806025:	48 c1 e0 04          	shl    rax,0x4
  806029:	48 8d 90 cc 43 42 00 	lea    rdx,[rax+0x4243cc]
  806030:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  806033:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  806035:	8b 05 b9 10 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc210b9]        # 4270f4 <tail>
  80603b:	48 63 d0             	movsxd rdx,eax
  80603e:	48 89 d0             	mov    rax,rdx
  806041:	48 01 c0             	add    rax,rax
  806044:	48 01 d0             	add    rax,rdx
  806047:	48 c1 e0 04          	shl    rax,0x4
  80604b:	48 05 dc 43 42 00    	add    rax,0x4243dc
  806051:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  806057:	8b 05 97 10 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21097]        # 4270f4 <tail>
  80605d:	48 63 d0             	movsxd rdx,eax
  806060:	48 89 d0             	mov    rax,rdx
  806063:	48 01 c0             	add    rax,rax
  806066:	48 01 d0             	add    rax,rdx
  806069:	48 c1 e0 04          	shl    rax,0x4
  80606d:	48 8d 90 d0 43 42 00 	lea    rdx,[rax+0x4243d0]
  806074:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806078:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  80607b:	8b 05 73 10 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21073]        # 4270f4 <tail>
  806081:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  806084:	8b 05 6a 10 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2106a]        # 4270f4 <tail>
  80608a:	8d 50 01             	lea    edx,[rax+0x1]
  80608d:	48 63 c2             	movsxd rax,edx
  806090:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806097:	48 c1 e8 20          	shr    rax,0x20
  80609b:	01 d0                	add    eax,edx
  80609d:	c1 f8 07             	sar    eax,0x7
  8060a0:	89 d1                	mov    ecx,edx
  8060a2:	c1 f9 1f             	sar    ecx,0x1f
  8060a5:	29 c8                	sub    eax,ecx
  8060a7:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8060ad:	89 d0                	mov    eax,edx
  8060af:	29 c8                	sub    eax,ecx
  8060b1:	89 05 3d 10 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2103d],eax        # 4270f4 <tail>
    return r;
  8060b7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8060ba:	5d                   	pop    rbp
  8060bb:	c3                   	ret    

00000000008060bc <execute_request>:
int execute_request(){
  8060bc:	f3 0f 1e fa          	endbr64 
  8060c0:	55                   	push   rbp
  8060c1:	48 89 e5             	mov    rbp,rsp
  8060c4:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  8060c8:	48 8b 05 f1 0f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20ff1]        # 4270c0 <running_req>
  8060cf:	48 85 c0             	test   rax,rax
  8060d2:	74 6a                	je     80613e <execute_request+0x82>
    {
        running_req->time++;
  8060d4:	48 8b 05 e5 0f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20fe5]        # 4270c0 <running_req>
  8060db:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8060de:	83 c2 01             	add    edx,0x1
  8060e1:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  8060e4:	48 8b 05 d5 0f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20fd5]        # 4270c0 <running_req>
  8060eb:	8b 00                	mov    eax,DWORD PTR [rax]
  8060ed:	83 f8 02             	cmp    eax,0x2
  8060f0:	74 0a                	je     8060fc <execute_request+0x40>
            return 2;
  8060f2:	b8 02 00 00 00       	mov    eax,0x2
  8060f7:	e9 b4 01 00 00       	jmp    8062b0 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  8060fc:	48 8b 05 bd 0f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20fbd]        # 4270c0 <running_req>
  806103:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  806106:	83 f8 0a             	cmp    eax,0xa
  806109:	7e 29                	jle    806134 <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  80610b:	48 8b 05 ae 0f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20fae]        # 4270c0 <running_req>
  806112:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  806119:	48 8b 05 a0 0f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20fa0]        # 4270c0 <running_req>
  806120:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  806127:	48 c7 05 8e 0f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20f8e],0x0        # 4270c0 <running_req>
  80612e:	00 00 00 00 
  806132:	eb 0a                	jmp    80613e <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  806134:	b8 02 00 00 00       	mov    eax,0x2
  806139:	e9 72 01 00 00       	jmp    8062b0 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  80613e:	8b 15 ac 0f c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc20fac]        # 4270f0 <head>
  806144:	8b 05 aa 0f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20faa]        # 4270f4 <tail>
  80614a:	39 c2                	cmp    edx,eax
  80614c:	75 0a                	jne    806158 <execute_request+0x9c>
  80614e:	b8 01 00 00 00       	mov    eax,0x1
  806153:	e9 58 01 00 00       	jmp    8062b0 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  806158:	8b 05 92 0f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20f92]        # 4270f0 <head>
  80615e:	48 63 d0             	movsxd rdx,eax
  806161:	48 89 d0             	mov    rax,rdx
  806164:	48 01 c0             	add    rax,rax
  806167:	48 01 d0             	add    rax,rdx
  80616a:	48 c1 e0 04          	shl    rax,0x4
  80616e:	48 05 c0 43 42 00    	add    rax,0x4243c0
  806174:	48 89 05 45 0f c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20f45],rax        # 4270c0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  80617b:	8b 05 6f 0f c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20f6f]        # 4270f0 <head>
  806181:	8d 50 01             	lea    edx,[rax+0x1]
  806184:	48 63 c2             	movsxd rax,edx
  806187:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  80618e:	48 c1 e8 20          	shr    rax,0x20
  806192:	01 d0                	add    eax,edx
  806194:	c1 f8 07             	sar    eax,0x7
  806197:	89 d1                	mov    ecx,edx
  806199:	c1 f9 1f             	sar    ecx,0x1f
  80619c:	29 c8                	sub    eax,ecx
  80619e:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  8061a4:	89 d0                	mov    eax,edx
  8061a6:	29 c8                	sub    eax,ecx
  8061a8:	89 05 42 0f c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20f42],eax        # 4270f0 <head>
    running_req->stat=REQ_STAT_WORKING;
  8061ae:	48 8b 05 0b 0f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20f0b]        # 4270c0 <running_req>
  8061b5:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  8061bc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  8061c3:	48 8b 05 f6 0e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20ef6]        # 4270c0 <running_req>
  8061ca:	8b 00                	mov    eax,DWORD PTR [rax]
  8061cc:	83 f8 03             	cmp    eax,0x3
  8061cf:	0f 84 ad 00 00 00    	je     806282 <execute_request+0x1c6>
  8061d5:	83 f8 03             	cmp    eax,0x3
  8061d8:	0f 8f bf 00 00 00    	jg     80629d <execute_request+0x1e1>
  8061de:	83 f8 02             	cmp    eax,0x2
  8061e1:	0f 84 85 00 00 00    	je     80626c <execute_request+0x1b0>
  8061e7:	83 f8 02             	cmp    eax,0x2
  8061ea:	0f 8f ad 00 00 00    	jg     80629d <execute_request+0x1e1>
  8061f0:	85 c0                	test   eax,eax
  8061f2:	74 0a                	je     8061fe <execute_request+0x142>
  8061f4:	83 f8 01             	cmp    eax,0x1
  8061f7:	74 3c                	je     806235 <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  8061f9:	e9 9f 00 00 00       	jmp    80629d <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  8061fe:	48 8b 05 bb 0e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20ebb]        # 4270c0 <running_req>
        r=async_read_disk(running_req->disk,\
  806205:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  806209:	48 8b 05 b0 0e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20eb0]        # 4270c0 <running_req>
        r=async_read_disk(running_req->disk,\
  806210:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  806213:	48 8b 05 a6 0e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20ea6]        # 4270c0 <running_req>
  80621a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  80621d:	89 c6                	mov    esi,eax
  80621f:	48 8b 05 9a 0e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20e9a]        # 4270c0 <running_req>
  806226:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806229:	89 c7                	mov    edi,eax
  80622b:	e8 a7 00 00 00       	call   8062d7 <async_read_disk>
  806230:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806233:	eb 69                	jmp    80629e <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  806235:	48 8b 05 84 0e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20e84]        # 4270c0 <running_req>
        r=async_write_disk(running_req->disk,\
  80623c:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  806240:	48 8b 05 79 0e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20e79]        # 4270c0 <running_req>
        r=async_write_disk(running_req->disk,\
  806247:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  80624a:	48 8b 05 6f 0e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20e6f]        # 4270c0 <running_req>
  806251:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  806254:	89 c6                	mov    esi,eax
  806256:	48 8b 05 63 0e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20e63]        # 4270c0 <running_req>
  80625d:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806260:	89 c7                	mov    edi,eax
  806262:	e8 88 01 00 00       	call   8063ef <async_write_disk>
  806267:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  80626a:	eb 32                	jmp    80629e <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  80626c:	48 8b 05 4d 0e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20e4d]        # 4270c0 <running_req>
  806273:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806276:	89 c7                	mov    edi,eax
  806278:	e8 8f 06 00 00       	call   80690c <async_check_disk>
  80627d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806280:	eb 1c                	jmp    80629e <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  806282:	48 8b 05 37 0e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20e37]        # 4270c0 <running_req>
  806289:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80628c:	89 c7                	mov    edi,eax
  80628e:	b8 00 00 00 00       	mov    eax,0x0
  806293:	e8 1a 00 00 00       	call   8062b2 <async_reset_disk>
  806298:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  80629b:	eb 01                	jmp    80629e <execute_request+0x1e2>
        break;
  80629d:	90                   	nop
    }
    if(r==-1)return -1;
  80629e:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8062a2:	75 07                	jne    8062ab <execute_request+0x1ef>
  8062a4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8062a9:	eb 05                	jmp    8062b0 <execute_request+0x1f4>
    return 0;
  8062ab:	b8 00 00 00 00       	mov    eax,0x0
}
  8062b0:	c9                   	leave  
  8062b1:	c3                   	ret    

00000000008062b2 <async_reset_disk>:
int async_reset_disk(int disk)
{
  8062b2:	f3 0f 1e fa          	endbr64 
  8062b6:	55                   	push   rbp
  8062b7:	48 89 e5             	mov    rbp,rsp
  8062ba:	48 83 ec 10          	sub    rsp,0x10
  8062be:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  8062c1:	be 0c 00 00 00       	mov    esi,0xc
  8062c6:	bf f6 03 00 00       	mov    edi,0x3f6
  8062cb:	e8 c0 e4 ff ff       	call   804790 <outb>
    return 0;
  8062d0:	b8 00 00 00 00       	mov    eax,0x0
}
  8062d5:	c9                   	leave  
  8062d6:	c3                   	ret    

00000000008062d7 <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  8062d7:	f3 0f 1e fa          	endbr64 
  8062db:	55                   	push   rbp
  8062dc:	48 89 e5             	mov    rbp,rsp
  8062df:	48 83 ec 30          	sub    rsp,0x30
  8062e3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8062e6:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8062e9:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8062ec:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  8062f0:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  8062f6:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  8062fd:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806301:	74 06                	je     806309 <async_read_disk+0x32>
  806303:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806307:	75 06                	jne    80630f <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  806309:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  80630f:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806313:	74 06                	je     80631b <async_read_disk+0x44>
  806315:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806319:	75 07                	jne    806322 <async_read_disk+0x4b>
        slave_disk=1;
  80631b:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  806322:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806325:	0f b6 d0             	movzx  edx,al
  806328:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80632c:	83 c0 02             	add    eax,0x2
  80632f:	0f b7 c0             	movzx  eax,ax
  806332:	89 d6                	mov    esi,edx
  806334:	89 c7                	mov    edi,eax
  806336:	e8 55 e4 ff ff       	call   804790 <outb>
    outb(port+3,lba&0xff);
  80633b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80633e:	0f b6 d0             	movzx  edx,al
  806341:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806345:	83 c0 03             	add    eax,0x3
  806348:	0f b7 c0             	movzx  eax,ax
  80634b:	89 d6                	mov    esi,edx
  80634d:	89 c7                	mov    edi,eax
  80634f:	e8 3c e4 ff ff       	call   804790 <outb>
    outb(port+4,(lba>>8)&0xff);
  806354:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806357:	c1 e8 08             	shr    eax,0x8
  80635a:	0f b6 d0             	movzx  edx,al
  80635d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806361:	83 c0 04             	add    eax,0x4
  806364:	0f b7 c0             	movzx  eax,ax
  806367:	89 d6                	mov    esi,edx
  806369:	89 c7                	mov    edi,eax
  80636b:	e8 20 e4 ff ff       	call   804790 <outb>
    outb(port+5,(lba>>16)&0xff);
  806370:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806373:	c1 e8 10             	shr    eax,0x10
  806376:	0f b6 d0             	movzx  edx,al
  806379:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80637d:	83 c0 05             	add    eax,0x5
  806380:	0f b7 c0             	movzx  eax,ax
  806383:	89 d6                	mov    esi,edx
  806385:	89 c7                	mov    edi,eax
  806387:	e8 04 e4 ff ff       	call   804790 <outb>
    char drv=slave_disk?0x10:0;
  80638c:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806390:	74 07                	je     806399 <async_read_disk+0xc2>
  806392:	b8 10 00 00 00       	mov    eax,0x10
  806397:	eb 05                	jmp    80639e <async_read_disk+0xc7>
  806399:	b8 00 00 00 00       	mov    eax,0x0
  80639e:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  8063a1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8063a4:	c1 e8 18             	shr    eax,0x18
  8063a7:	83 e0 0f             	and    eax,0xf
  8063aa:	89 c2                	mov    edx,eax
  8063ac:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  8063b0:	09 d0                	or     eax,edx
  8063b2:	83 c8 e0             	or     eax,0xffffffe0
  8063b5:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  8063b8:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  8063bc:	0f b6 d0             	movzx  edx,al
  8063bf:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8063c3:	83 c0 06             	add    eax,0x6
  8063c6:	0f b7 c0             	movzx  eax,ax
  8063c9:	89 d6                	mov    esi,edx
  8063cb:	89 c7                	mov    edi,eax
  8063cd:	e8 be e3 ff ff       	call   804790 <outb>
    outb(port+7,DISK_CMD_READ);
  8063d2:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8063d6:	83 c0 07             	add    eax,0x7
  8063d9:	0f b7 c0             	movzx  eax,ax
  8063dc:	be 20 00 00 00       	mov    esi,0x20
  8063e1:	89 c7                	mov    edi,eax
  8063e3:	e8 a8 e3 ff ff       	call   804790 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  8063e8:	b8 00 00 00 00       	mov    eax,0x0
}
  8063ed:	c9                   	leave  
  8063ee:	c3                   	ret    

00000000008063ef <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  8063ef:	f3 0f 1e fa          	endbr64 
  8063f3:	55                   	push   rbp
  8063f4:	48 89 e5             	mov    rbp,rsp
  8063f7:	48 83 ec 30          	sub    rsp,0x30
  8063fb:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8063fe:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806401:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806404:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  806408:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  80640e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806415:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806419:	74 06                	je     806421 <async_write_disk+0x32>
  80641b:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80641f:	75 06                	jne    806427 <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  806421:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806427:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80642b:	74 06                	je     806433 <async_write_disk+0x44>
  80642d:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806431:	75 07                	jne    80643a <async_write_disk+0x4b>
        slave_disk=1;
  806433:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  80643a:	bf f7 00 00 00       	mov    edi,0xf7
  80643f:	e8 65 e3 ff ff       	call   8047a9 <inb>
  806444:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  806447:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  80644b:	83 e0 01             	and    eax,0x1
  80644e:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  806451:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  806455:	74 0a                	je     806461 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  806457:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80645c:	e9 d5 00 00 00       	jmp    806536 <async_write_disk+0x147>
        }
        t&=0x88;
  806461:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  806465:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  806469:	74 02                	je     80646d <async_write_disk+0x7e>
    {
  80646b:	eb cd                	jmp    80643a <async_write_disk+0x4b>
        if(t==0x8)break;
  80646d:	90                   	nop
    }
    outb(port+2,sec_n);
  80646e:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806471:	0f b6 d0             	movzx  edx,al
  806474:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806478:	83 c0 02             	add    eax,0x2
  80647b:	0f b7 c0             	movzx  eax,ax
  80647e:	89 d6                	mov    esi,edx
  806480:	89 c7                	mov    edi,eax
  806482:	e8 09 e3 ff ff       	call   804790 <outb>
    outb(port+3,lba&0xff);
  806487:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80648a:	0f b6 d0             	movzx  edx,al
  80648d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806491:	83 c0 03             	add    eax,0x3
  806494:	0f b7 c0             	movzx  eax,ax
  806497:	89 d6                	mov    esi,edx
  806499:	89 c7                	mov    edi,eax
  80649b:	e8 f0 e2 ff ff       	call   804790 <outb>
    outb(port+4,(lba>>8)&0xff);
  8064a0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8064a3:	c1 e8 08             	shr    eax,0x8
  8064a6:	0f b6 d0             	movzx  edx,al
  8064a9:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8064ad:	83 c0 04             	add    eax,0x4
  8064b0:	0f b7 c0             	movzx  eax,ax
  8064b3:	89 d6                	mov    esi,edx
  8064b5:	89 c7                	mov    edi,eax
  8064b7:	e8 d4 e2 ff ff       	call   804790 <outb>
    outb(port+5,(lba>>16)&0xff);
  8064bc:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8064bf:	c1 e8 10             	shr    eax,0x10
  8064c2:	0f b6 d0             	movzx  edx,al
  8064c5:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8064c9:	83 c0 05             	add    eax,0x5
  8064cc:	0f b7 c0             	movzx  eax,ax
  8064cf:	89 d6                	mov    esi,edx
  8064d1:	89 c7                	mov    edi,eax
  8064d3:	e8 b8 e2 ff ff       	call   804790 <outb>
    char drv=slave_disk?0x10:0;
  8064d8:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  8064dc:	74 07                	je     8064e5 <async_write_disk+0xf6>
  8064de:	b8 10 00 00 00       	mov    eax,0x10
  8064e3:	eb 05                	jmp    8064ea <async_write_disk+0xfb>
  8064e5:	b8 00 00 00 00       	mov    eax,0x0
  8064ea:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  8064ed:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8064f0:	c1 e8 18             	shr    eax,0x18
  8064f3:	83 e0 0f             	and    eax,0xf
  8064f6:	89 c2                	mov    edx,eax
  8064f8:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  8064fc:	09 d0                	or     eax,edx
  8064fe:	83 c8 e0             	or     eax,0xffffffe0
  806501:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  806504:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  806508:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80650c:	83 c0 06             	add    eax,0x6
  80650f:	0f b7 c0             	movzx  eax,ax
  806512:	89 d6                	mov    esi,edx
  806514:	89 c7                	mov    edi,eax
  806516:	e8 75 e2 ff ff       	call   804790 <outb>
    outb(port+7,DISK_CMD_WRITE);
  80651b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80651f:	83 c0 07             	add    eax,0x7
  806522:	0f b7 c0             	movzx  eax,ax
  806525:	be 30 00 00 00       	mov    esi,0x30
  80652a:	89 c7                	mov    edi,eax
  80652c:	e8 5f e2 ff ff       	call   804790 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  806531:	b8 00 00 00 00       	mov    eax,0x0
}
  806536:	c9                   	leave  
  806537:	c3                   	ret    

0000000000806538 <read_disk>:
int read_disk(driver_args* args)
{
  806538:	f3 0f 1e fa          	endbr64 
  80653c:	55                   	push   rbp
  80653d:	48 89 e5             	mov    rbp,rsp
  806540:	48 83 ec 20          	sub    rsp,0x20
  806544:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  806548:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80654c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80654f:	48 98                	cdqe   
  806551:	48 89 c2             	mov    rdx,rax
  806554:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806558:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  80655b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80655f:	8b 00                	mov    eax,DWORD PTR [rax]
  806561:	89 ce                	mov    esi,ecx
  806563:	89 c7                	mov    edi,eax
  806565:	e8 92 05 00 00       	call   806afc <read_disk_asm>
  80656a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  80656d:	48 8b 05 4c 0b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20b4c]        # 4270c0 <running_req>
  806574:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  80657b:	48 8b 05 3e 0b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20b3e]        # 4270c0 <running_req>
  806582:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806586:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  80658d:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806590:	48 c7 05 25 0b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20b25],0x0        # 4270c0 <running_req>
  806597:	00 00 00 00 
    return ret;
  80659b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80659e:	c9                   	leave  
  80659f:	c3                   	ret    

00000000008065a0 <write_disk>:
int write_disk(driver_args* args)
{
  8065a0:	f3 0f 1e fa          	endbr64 
  8065a4:	55                   	push   rbp
  8065a5:	48 89 e5             	mov    rbp,rsp
  8065a8:	48 83 ec 20          	sub    rsp,0x20
  8065ac:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  8065b0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8065b4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8065b7:	48 98                	cdqe   
  8065b9:	48 89 c2             	mov    rdx,rax
  8065bc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8065c0:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8065c3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8065c7:	8b 00                	mov    eax,DWORD PTR [rax]
  8065c9:	89 ce                	mov    esi,ecx
  8065cb:	89 c7                	mov    edi,eax
  8065cd:	e8 aa 05 00 00       	call   806b7c <write_disk_asm>
  8065d2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  8065d5:	48 8b 05 e4 0a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20ae4]        # 4270c0 <running_req>
  8065dc:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8065e3:	48 8b 05 d6 0a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20ad6]        # 4270c0 <running_req>
  8065ea:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8065ee:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8065f5:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8065f8:	48 c7 05 bd 0a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20abd],0x0        # 4270c0 <running_req>
  8065ff:	00 00 00 00 
    return ret;
  806603:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806606:	c9                   	leave  
  806607:	c3                   	ret    

0000000000806608 <chk_result>:
int chk_result(int r)
{
  806608:	f3 0f 1e fa          	endbr64 
  80660c:	55                   	push   rbp
  80660d:	48 89 e5             	mov    rbp,rsp
  806610:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  806613:	90                   	nop
  806614:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806617:	48 63 d0             	movsxd rdx,eax
  80661a:	48 89 d0             	mov    rax,rdx
  80661d:	48 01 c0             	add    rax,rax
  806620:	48 01 d0             	add    rax,rdx
  806623:	48 c1 e0 04          	shl    rax,0x4
  806627:	48 05 dc 43 42 00    	add    rax,0x4243dc
  80662d:	8b 00                	mov    eax,DWORD PTR [rax]
  80662f:	83 f8 03             	cmp    eax,0x3
  806632:	75 e0                	jne    806614 <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  806634:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806637:	48 63 d0             	movsxd rdx,eax
  80663a:	48 89 d0             	mov    rax,rdx
  80663d:	48 01 c0             	add    rax,rax
  806640:	48 01 d0             	add    rax,rdx
  806643:	48 c1 e0 04          	shl    rax,0x4
  806647:	48 05 e0 43 42 00    	add    rax,0x4243e0
  80664d:	8b 00                	mov    eax,DWORD PTR [rax]
  80664f:	83 f8 01             	cmp    eax,0x1
  806652:	0f 94 c0             	sete   al
  806655:	0f b6 c0             	movzx  eax,al
}
  806658:	5d                   	pop    rbp
  806659:	c3                   	ret    

000000000080665a <disk_existent>:
int disk_existent(int disk)
{
  80665a:	f3 0f 1e fa          	endbr64 
  80665e:	55                   	push   rbp
  80665f:	48 89 e5             	mov    rbp,rsp
  806662:	48 83 ec 10          	sub    rsp,0x10
  806666:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  806669:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  80666d:	74 5f                	je     8066ce <disk_existent+0x74>
  80666f:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  806673:	7f 6e                	jg     8066e3 <disk_existent+0x89>
  806675:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  806679:	74 3e                	je     8066b9 <disk_existent+0x5f>
  80667b:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  80667f:	7f 62                	jg     8066e3 <disk_existent+0x89>
  806681:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  806685:	74 08                	je     80668f <disk_existent+0x35>
  806687:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  80668b:	74 17                	je     8066a4 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  80668d:	eb 54                	jmp    8066e3 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  80668f:	bf 34 1b 81 00       	mov    edi,0x811b34
  806694:	e8 7a c8 ff ff       	call   802f13 <sys_find_dev>
  806699:	83 f8 ff             	cmp    eax,0xffffffff
  80669c:	0f 95 c0             	setne  al
  80669f:	0f b6 c0             	movzx  eax,al
  8066a2:	eb 45                	jmp    8066e9 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  8066a4:	bf 38 1b 81 00       	mov    edi,0x811b38
  8066a9:	e8 65 c8 ff ff       	call   802f13 <sys_find_dev>
  8066ae:	83 f8 ff             	cmp    eax,0xffffffff
  8066b1:	0f 95 c0             	setne  al
  8066b4:	0f b6 c0             	movzx  eax,al
  8066b7:	eb 30                	jmp    8066e9 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  8066b9:	bf 3c 1b 81 00       	mov    edi,0x811b3c
  8066be:	e8 50 c8 ff ff       	call   802f13 <sys_find_dev>
  8066c3:	83 f8 ff             	cmp    eax,0xffffffff
  8066c6:	0f 95 c0             	setne  al
  8066c9:	0f b6 c0             	movzx  eax,al
  8066cc:	eb 1b                	jmp    8066e9 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  8066ce:	bf 40 1b 81 00       	mov    edi,0x811b40
  8066d3:	e8 3b c8 ff ff       	call   802f13 <sys_find_dev>
  8066d8:	83 f8 ff             	cmp    eax,0xffffffff
  8066db:	0f 95 c0             	setne  al
  8066de:	0f b6 c0             	movzx  eax,al
  8066e1:	eb 06                	jmp    8066e9 <disk_existent+0x8f>
        break;
  8066e3:	90                   	nop
    }
    return 0;
  8066e4:	b8 00 00 00 00       	mov    eax,0x0
}
  8066e9:	c9                   	leave  
  8066ea:	c3                   	ret    

00000000008066eb <hd_iterate>:
int hd_iterate()
{
  8066eb:	f3 0f 1e fa          	endbr64 
  8066ef:	55                   	push   rbp
  8066f0:	48 89 e5             	mov    rbp,rsp
  8066f3:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  8066fa:	41 b8 00 00 00 00    	mov    r8d,0x0
  806700:	b9 01 00 00 00       	mov    ecx,0x1
  806705:	ba 00 00 00 00       	mov    edx,0x0
  80670a:	be 02 00 00 00       	mov    esi,0x2
  80670f:	bf 00 00 00 00       	mov    edi,0x0
  806714:	e8 3b f8 ff ff       	call   805f54 <request>
  806719:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  80671c:	41 b8 00 00 00 00    	mov    r8d,0x0
  806722:	b9 01 00 00 00       	mov    ecx,0x1
  806727:	ba 00 00 00 00       	mov    edx,0x0
  80672c:	be 02 00 00 00       	mov    esi,0x2
  806731:	bf 01 00 00 00       	mov    edi,0x1
  806736:	e8 19 f8 ff ff       	call   805f54 <request>
  80673b:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  80673e:	41 b8 00 00 00 00    	mov    r8d,0x0
  806744:	b9 01 00 00 00       	mov    ecx,0x1
  806749:	ba 00 00 00 00       	mov    edx,0x0
  80674e:	be 02 00 00 00       	mov    esi,0x2
  806753:	bf 02 00 00 00       	mov    edi,0x2
  806758:	e8 f7 f7 ff ff       	call   805f54 <request>
  80675d:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  806760:	41 b8 00 00 00 00    	mov    r8d,0x0
  806766:	b9 01 00 00 00       	mov    ecx,0x1
  80676b:	ba 00 00 00 00       	mov    edx,0x0
  806770:	be 02 00 00 00       	mov    esi,0x2
  806775:	bf 03 00 00 00       	mov    edi,0x3
  80677a:	e8 d5 f7 ff ff       	call   805f54 <request>
  80677f:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<4;i++)
  806782:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806789:	e9 72 01 00 00       	jmp    806900 <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  80678e:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806792:	74 3b                	je     8067cf <hd_iterate+0xe4>
  806794:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806798:	7f 3e                	jg     8067d8 <hd_iterate+0xed>
  80679a:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80679e:	74 26                	je     8067c6 <hd_iterate+0xdb>
  8067a0:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8067a4:	7f 32                	jg     8067d8 <hd_iterate+0xed>
  8067a6:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8067aa:	74 08                	je     8067b4 <hd_iterate+0xc9>
  8067ac:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8067b0:	74 0b                	je     8067bd <hd_iterate+0xd2>
  8067b2:	eb 24                	jmp    8067d8 <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  8067b4:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8067bb:	eb 25                	jmp    8067e2 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  8067bd:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  8067c4:	eb 1c                	jmp    8067e2 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  8067c6:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  8067cd:	eb 13                	jmp    8067e2 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  8067cf:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  8067d6:	eb 0a                	jmp    8067e2 <hd_iterate+0xf7>
        default:
            return -1;
  8067d8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8067dd:	e9 28 01 00 00       	jmp    80690a <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  8067e2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8067e5:	48 98                	cdqe   
  8067e7:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  8067eb:	89 c7                	mov    edi,eax
  8067ed:	e8 16 fe ff ff       	call   806608 <chk_result>
  8067f2:	85 c0                	test   eax,eax
  8067f4:	0f 84 81 00 00 00    	je     80687b <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  8067fa:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8067fd:	89 c6                	mov    esi,eax
  8067ff:	bf 44 1b 81 00       	mov    edi,0x811b44
  806804:	b8 00 00 00 00       	mov    eax,0x0
  806809:	e8 6e a4 ff ff       	call   800c7c <printf>
            //新硬盘
            device hd={
  80680e:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  806815:	b8 00 00 00 00       	mov    eax,0x0
  80681a:	b9 15 00 00 00       	mov    ecx,0x15
  80681f:	48 89 d7             	mov    rdi,rdx
  806822:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  806825:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806828:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  80682e:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  806835:	00 00 00 
  806838:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  80683f:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  806842:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  806846:	7f 07                	jg     80684f <hd_iterate+0x164>
  806848:	b8 f0 01 00 00       	mov    eax,0x1f0
  80684d:	eb 05                	jmp    806854 <hd_iterate+0x169>
  80684f:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  806854:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  80685a:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  806861:	48 89 c7             	mov    rdi,rax
  806864:	e8 72 c2 ff ff       	call   802adb <reg_device>
  806869:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80686c:	48 63 d2             	movsxd rdx,edx
  80686f:	89 04 95 e0 70 42 00 	mov    DWORD PTR [rdx*4+0x4270e0],eax
  806876:	e9 81 00 00 00       	jmp    8068fc <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  80687b:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80687e:	48 98                	cdqe   
  806880:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  806884:	89 c7                	mov    edi,eax
  806886:	e8 7d fd ff ff       	call   806608 <chk_result>
  80688b:	85 c0                	test   eax,eax
  80688d:	75 6d                	jne    8068fc <hd_iterate+0x211>
        {
            switch (i)
  80688f:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806893:	74 3e                	je     8068d3 <hd_iterate+0x1e8>
  806895:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806899:	7f 41                	jg     8068dc <hd_iterate+0x1f1>
  80689b:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80689f:	74 28                	je     8068c9 <hd_iterate+0x1de>
  8068a1:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  8068a5:	7f 35                	jg     8068dc <hd_iterate+0x1f1>
  8068a7:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8068ab:	74 08                	je     8068b5 <hd_iterate+0x1ca>
  8068ad:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  8068b1:	74 0c                	je     8068bf <hd_iterate+0x1d4>
  8068b3:	eb 27                	jmp    8068dc <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  8068b5:	48 c7 45 f8 34 1b 81 	mov    QWORD PTR [rbp-0x8],0x811b34
  8068bc:	00 
  8068bd:	eb 1d                	jmp    8068dc <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  8068bf:	48 c7 45 f8 38 1b 81 	mov    QWORD PTR [rbp-0x8],0x811b38
  8068c6:	00 
  8068c7:	eb 13                	jmp    8068dc <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  8068c9:	48 c7 45 f8 3c 1b 81 	mov    QWORD PTR [rbp-0x8],0x811b3c
  8068d0:	00 
  8068d1:	eb 09                	jmp    8068dc <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  8068d3:	48 c7 45 f8 40 1b 81 	mov    QWORD PTR [rbp-0x8],0x811b40
  8068da:	00 
  8068db:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  8068dc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8068e0:	48 89 c7             	mov    rdi,rax
  8068e3:	e8 2b c6 ff ff       	call   802f13 <sys_find_dev>
  8068e8:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  8068eb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8068ee:	89 c7                	mov    edi,eax
  8068f0:	e8 f2 cc ff ff       	call   8035e7 <get_dev>
  8068f5:	89 c7                	mov    edi,eax
  8068f7:	e8 3e cc ff ff       	call   80353a <dispose_device>
    for(int i=0;i<4;i++)
  8068fc:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  806900:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806904:	0f 8e 84 fe ff ff    	jle    80678e <hd_iterate+0xa3>
        }

    }
}
  80690a:	c9                   	leave  
  80690b:	c3                   	ret    

000000000080690c <async_check_disk>:

int async_check_disk(int disk)
{
  80690c:	f3 0f 1e fa          	endbr64 
  806910:	55                   	push   rbp
  806911:	48 89 e5             	mov    rbp,rsp
  806914:	48 83 ec 20          	sub    rsp,0x20
  806918:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  80691b:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  806921:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806927:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  80692b:	74 06                	je     806933 <async_check_disk+0x27>
  80692d:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806931:	75 06                	jne    806939 <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  806933:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  806939:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  80693d:	74 06                	je     806945 <async_check_disk+0x39>
  80693f:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806943:	75 06                	jne    80694b <async_check_disk+0x3f>
        chkcmd=0xf0;
  806945:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  80694b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80694f:	83 c0 02             	add    eax,0x2
  806952:	0f b7 c0             	movzx  eax,ax
  806955:	be 01 00 00 00       	mov    esi,0x1
  80695a:	89 c7                	mov    edi,eax
  80695c:	e8 2f de ff ff       	call   804790 <outb>
    outb(disknr+3,0);
  806961:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806965:	83 c0 03             	add    eax,0x3
  806968:	0f b7 c0             	movzx  eax,ax
  80696b:	be 00 00 00 00       	mov    esi,0x0
  806970:	89 c7                	mov    edi,eax
  806972:	e8 19 de ff ff       	call   804790 <outb>
    outb(disknr+4,0);
  806977:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80697b:	83 c0 04             	add    eax,0x4
  80697e:	0f b7 c0             	movzx  eax,ax
  806981:	be 00 00 00 00       	mov    esi,0x0
  806986:	89 c7                	mov    edi,eax
  806988:	e8 03 de ff ff       	call   804790 <outb>
    outb(disknr+5,0);
  80698d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806991:	83 c0 05             	add    eax,0x5
  806994:	0f b7 c0             	movzx  eax,ax
  806997:	be 00 00 00 00       	mov    esi,0x0
  80699c:	89 c7                	mov    edi,eax
  80699e:	e8 ed dd ff ff       	call   804790 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  8069a3:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  8069a7:	0f b6 d0             	movzx  edx,al
  8069aa:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8069ae:	83 c0 06             	add    eax,0x6
  8069b1:	0f b7 c0             	movzx  eax,ax
  8069b4:	89 d6                	mov    esi,edx
  8069b6:	89 c7                	mov    edi,eax
  8069b8:	e8 d3 dd ff ff       	call   804790 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  8069bd:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8069c1:	83 c0 07             	add    eax,0x7
  8069c4:	0f b7 c0             	movzx  eax,ax
  8069c7:	be 90 00 00 00       	mov    esi,0x90
  8069cc:	89 c7                	mov    edi,eax
  8069ce:	e8 bd dd ff ff       	call   804790 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  8069d3:	b8 00 00 00 00       	mov    eax,0x0
}
  8069d8:	c9                   	leave  
  8069d9:	c3                   	ret    

00000000008069da <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  8069da:	f3 0f 1e fa          	endbr64 
  8069de:	55                   	push   rbp
  8069df:	48 89 e5             	mov    rbp,rsp
  8069e2:	48 83 ec 18          	sub    rsp,0x18
  8069e6:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  8069ea:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  8069f1:	eb 04                	jmp    8069f7 <hd_do_req+0x1d>
  8069f3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8069f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8069fa:	48 98                	cdqe   
  8069fc:	8b 14 85 e0 70 42 00 	mov    edx,DWORD PTR [rax*4+0x4270e0]
  806a03:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806a07:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  806a0d:	39 c2                	cmp    edx,eax
  806a0f:	75 e2                	jne    8069f3 <hd_do_req+0x19>
    switch (args->cmd)
  806a11:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806a15:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  806a1b:	83 f8 04             	cmp    eax,0x4
  806a1e:	74 72                	je     806a92 <hd_do_req+0xb8>
  806a20:	83 f8 04             	cmp    eax,0x4
  806a23:	0f 8f 96 00 00 00    	jg     806abf <hd_do_req+0xe5>
  806a29:	83 f8 02             	cmp    eax,0x2
  806a2c:	74 0a                	je     806a38 <hd_do_req+0x5e>
  806a2e:	83 f8 03             	cmp    eax,0x3
  806a31:	74 32                	je     806a65 <hd_do_req+0x8b>
  806a33:	e9 87 00 00 00       	jmp    806abf <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  806a38:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806a3c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806a3f:	48 98                	cdqe   
  806a41:	48 89 c6             	mov    rsi,rax
  806a44:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806a48:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806a4b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806a4f:	8b 10                	mov    edx,DWORD PTR [rax]
  806a51:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806a54:	49 89 f0             	mov    r8,rsi
  806a57:	be 00 00 00 00       	mov    esi,0x0
  806a5c:	89 c7                	mov    edi,eax
  806a5e:	e8 f1 f4 ff ff       	call   805f54 <request>
        break;
  806a63:	eb 61                	jmp    806ac6 <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  806a65:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806a69:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806a6c:	48 98                	cdqe   
  806a6e:	48 89 c6             	mov    rsi,rax
  806a71:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806a75:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806a78:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806a7c:	8b 10                	mov    edx,DWORD PTR [rax]
  806a7e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806a81:	49 89 f0             	mov    r8,rsi
  806a84:	be 01 00 00 00       	mov    esi,0x1
  806a89:	89 c7                	mov    edi,eax
  806a8b:	e8 c4 f4 ff ff       	call   805f54 <request>
        break;
  806a90:	eb 34                	jmp    806ac6 <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  806a92:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806a96:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806a99:	48 98                	cdqe   
  806a9b:	48 89 c6             	mov    rsi,rax
  806a9e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806aa2:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806aa5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806aa9:	8b 10                	mov    edx,DWORD PTR [rax]
  806aab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806aae:	49 89 f0             	mov    r8,rsi
  806ab1:	be 02 00 00 00       	mov    esi,0x2
  806ab6:	89 c7                	mov    edi,eax
  806ab8:	e8 97 f4 ff ff       	call   805f54 <request>
        break;
  806abd:	eb 07                	jmp    806ac6 <hd_do_req+0xec>
    default:return -1;
  806abf:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806ac4:	eb 1e                	jmp    806ae4 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  806ac6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806aca:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  806ad1:	00 00 00 
    running_devman_req=args;
  806ad4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806ad8:	48 89 05 e9 05 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc205e9],rax        # 4270c8 <running_devman_req>
    return 0;
  806adf:	b8 00 00 00 00       	mov    eax,0x0
  806ae4:	c9                   	leave  
  806ae5:	c3                   	ret    
  806ae6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  806aed:	00 00 00 

0000000000806af0 <disk_int_handler>:
  806af0:	e8 c9 dc ff ff       	call   8047be <eoi>
  806af5:	e8 6b f2 ff ff       	call   805d65 <disk_int_handler_c>
  806afa:	48 cf                	iretq  

0000000000806afc <read_disk_asm>:
  806afc:	55                   	push   rbp
  806afd:	89 e5                	mov    ebp,esp
  806aff:	66 ba f7 01          	mov    dx,0x1f7
  806b03:	31 c9                	xor    ecx,ecx
  806b05:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  806b0a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  806b0f:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  806b14:	89 c6                	mov    esi,eax
  806b16:	66 ba f2 01          	mov    dx,0x1f2
  806b1a:	88 c8                	mov    al,cl
  806b1c:	ee                   	out    dx,al
  806b1d:	66 ba f3 01          	mov    dx,0x1f3
  806b21:	89 f0                	mov    eax,esi
  806b23:	ee                   	out    dx,al
  806b24:	66 ff c2             	inc    dx
  806b27:	c1 e8 08             	shr    eax,0x8
  806b2a:	ee                   	out    dx,al
  806b2b:	66 ff c2             	inc    dx
  806b2e:	c1 e8 08             	shr    eax,0x8
  806b31:	ee                   	out    dx,al
  806b32:	66 ff c2             	inc    dx
  806b35:	66 c1 e8 08          	shr    ax,0x8
  806b39:	24 0f                	and    al,0xf
  806b3b:	0c e0                	or     al,0xe0
  806b3d:	ee                   	out    dx,al
  806b3e:	66 ff c2             	inc    dx
  806b41:	b0 20                	mov    al,0x20
  806b43:	ee                   	out    dx,al

0000000000806b44 <read_disk_asm.wait>:
  806b44:	90                   	nop
  806b45:	ec                   	in     al,dx
  806b46:	24 88                	and    al,0x88
  806b48:	3c 08                	cmp    al,0x8
  806b4a:	75 f8                	jne    806b44 <read_disk_asm.wait>
  806b4c:	66 89 d7             	mov    di,dx
  806b4f:	89 c8                	mov    eax,ecx
  806b51:	66 b9 00 01          	mov    cx,0x100
  806b55:	66 f7 e1             	mul    cx
  806b58:	89 c1                	mov    ecx,eax
  806b5a:	66 ba f0 01          	mov    dx,0x1f0

0000000000806b5e <read_disk_asm.read>:
  806b5e:	66 ed                	in     ax,dx
  806b60:	66 67 89 03          	mov    WORD PTR [ebx],ax
  806b64:	83 c3 02             	add    ebx,0x2
  806b67:	e2 f5                	loop   806b5e <read_disk_asm.read>
  806b69:	c9                   	leave  
  806b6a:	b8 00 00 00 00       	mov    eax,0x0
  806b6f:	c3                   	ret    

0000000000806b70 <read_disk_asm.err_disk_reading>:
  806b70:	66 ba f1 01          	mov    dx,0x1f1
  806b74:	31 c0                	xor    eax,eax
  806b76:	66 ed                	in     ax,dx
  806b78:	89 ec                	mov    esp,ebp
  806b7a:	5d                   	pop    rbp
  806b7b:	c3                   	ret    

0000000000806b7c <write_disk_asm>:
  806b7c:	55                   	push   rbp
  806b7d:	89 e5                	mov    ebp,esp
  806b7f:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  806b84:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  806b89:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  806b8e:	50                   	push   rax
  806b8f:	66 ba f2 01          	mov    dx,0x1f2
  806b93:	88 c8                	mov    al,cl
  806b95:	ee                   	out    dx,al
  806b96:	58                   	pop    rax
  806b97:	66 ba f3 01          	mov    dx,0x1f3
  806b9b:	ee                   	out    dx,al
  806b9c:	c1 e8 08             	shr    eax,0x8
  806b9f:	66 ba f4 01          	mov    dx,0x1f4
  806ba3:	ee                   	out    dx,al
  806ba4:	c1 e8 08             	shr    eax,0x8
  806ba7:	66 ba f5 01          	mov    dx,0x1f5
  806bab:	ee                   	out    dx,al
  806bac:	c1 e8 08             	shr    eax,0x8
  806baf:	24 0f                	and    al,0xf
  806bb1:	0c e0                	or     al,0xe0
  806bb3:	66 ba f6 01          	mov    dx,0x1f6
  806bb7:	ee                   	out    dx,al
  806bb8:	66 ba f7 01          	mov    dx,0x1f7
  806bbc:	b0 30                	mov    al,0x30
  806bbe:	ee                   	out    dx,al

0000000000806bbf <write_disk_asm.not_ready2>:
  806bbf:	90                   	nop
  806bc0:	ec                   	in     al,dx
  806bc1:	24 88                	and    al,0x88
  806bc3:	3c 08                	cmp    al,0x8
  806bc5:	75 f8                	jne    806bbf <write_disk_asm.not_ready2>
  806bc7:	89 c8                	mov    eax,ecx
  806bc9:	66 b9 00 01          	mov    cx,0x100
  806bcd:	66 f7 e1             	mul    cx
  806bd0:	89 c1                	mov    ecx,eax
  806bd2:	66 ba f0 01          	mov    dx,0x1f0

0000000000806bd6 <write_disk_asm.go_on_write>:
  806bd6:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  806bda:	66 ef                	out    dx,ax
  806bdc:	83 c3 02             	add    ebx,0x2
  806bdf:	e2 f5                	loop   806bd6 <write_disk_asm.go_on_write>
  806be1:	89 ec                	mov    esp,ebp
  806be3:	5d                   	pop    rbp
  806be4:	c3                   	ret    

0000000000806be5 <init_fat16>:

int fat16_drvi;
extern driver drv_disk;
extern int disk_drvi;
int init_fat16()
{
  806be5:	f3 0f 1e fa          	endbr64 
  806be9:	55                   	push   rbp
  806bea:	48 89 e5             	mov    rbp,rsp
  806bed:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
    reg_device(&fat16_dev);
  806bf4:	bf 00 1c 81 00       	mov    edi,0x811c00
  806bf9:	e8 dd be ff ff       	call   802adb <reg_device>
    fat16_drvi=reg_driver(&fat16_drv);
  806bfe:	bf 60 1b 81 00       	mov    edi,0x811b60
  806c03:	e8 bb c1 ff ff       	call   802dc3 <reg_driver>
  806c08:	89 05 56 87 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc28756],eax        # 42f364 <fat16_drvi>
    driver_args arg;
    load(&arg);//syscall(SYSCALL_CALL_DRVFUNC,fat16_drvi,DRVF_OPEN,&arg,0,0);
  806c0e:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  806c15:	48 89 c7             	mov    rdi,rax
  806c18:	e8 26 00 00 00       	call   806c43 <load>
    reg_vol(disk_drvi,fat16_drvi,"a");
  806c1d:	8b 0d 41 87 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc28741]        # 42f364 <fat16_drvi>
  806c23:	8b 05 a7 04 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc204a7]        # 4270d0 <disk_drvi>
  806c29:	ba a8 1c 81 00       	mov    edx,0x811ca8
  806c2e:	89 ce                	mov    esi,ecx
  806c30:	89 c7                	mov    edi,eax
  806c32:	b8 00 00 00 00       	mov    eax,0x0
  806c37:	e8 27 ae ff ff       	call   801a63 <reg_vol>
    return 0;
  806c3c:	b8 00 00 00 00       	mov    eax,0x0
}
  806c41:	c9                   	leave  
  806c42:	c3                   	ret    

0000000000806c43 <load>:
int load(driver_args *args)
{
  806c43:	f3 0f 1e fa          	endbr64 
  806c47:	55                   	push   rbp
  806c48:	48 89 e5             	mov    rbp,rsp
  806c4b:	48 83 ec 20          	sub    rsp,0x20
  806c4f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    //sys_read superblock
    int req_id=-1;
  806c53:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    read_sec(&superblock,0,1);
  806c5a:	ba 01 00 00 00       	mov    edx,0x1
  806c5f:	be 00 00 00 00       	mov    esi,0x0
  806c64:	bf 00 71 42 00       	mov    edi,0x427100
  806c69:	e8 61 0b 00 00       	call   8077cf <read_sec>
    //只能一个一个读
    read_sec(fat,superblock.rsvdSec,superblock.secPerFAT);
  806c6e:	0f b7 05 a1 04 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc204a1]        # 427116 <superblock+0x16>
  806c75:	0f b7 d0             	movzx  edx,ax
  806c78:	0f b7 05 8f 04 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2048f]        # 42710e <superblock+0xe>
  806c7f:	0f b7 c0             	movzx  eax,ax
  806c82:	89 c6                	mov    esi,eax
  806c84:	bf 60 b3 42 00       	mov    edi,0x42b360
  806c89:	e8 41 0b 00 00       	call   8077cf <read_sec>

    //sys_read root
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  806c8e:	0f b7 05 79 04 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20479]        # 42710e <superblock+0xe>
  806c95:	0f b7 c8             	movzx  ecx,ax
  806c98:	0f b7 05 77 04 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20477]        # 427116 <superblock+0x16>
  806c9f:	0f b7 d0             	movzx  edx,ax
    superblock.numOfFAT;
  806ca2:	0f b6 05 67 04 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc20467]        # 427110 <superblock+0x10>
  806ca9:	0f b6 c0             	movzx  eax,al
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  806cac:	0f af c2             	imul   eax,edx
  806caf:	01 c8                	add    eax,ecx
  806cb1:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //printf("root sec num:%d\n",root_sec_num);
    //usually a root dir has 32 secs
    int root_sec_c=((u32)superblock.rootEntries* sizeof(dir_entry))/(u32)superblock.bytesPerSec;
  806cb4:	0f b7 05 56 04 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20456]        # 427111 <superblock+0x11>
  806cbb:	0f b7 c0             	movzx  eax,ax
  806cbe:	48 c1 e0 05          	shl    rax,0x5
  806cc2:	0f b7 15 42 04 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc20442]        # 42710b <superblock+0xb>
  806cc9:	0f b7 ca             	movzx  ecx,dx
  806ccc:	ba 00 00 00 00       	mov    edx,0x0
  806cd1:	48 f7 f1             	div    rcx
  806cd4:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    read_sec(root_dir,root_sec_num,root_sec_c);
  806cd7:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  806cda:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806cdd:	89 c6                	mov    esi,eax
  806cdf:	bf 40 71 42 00       	mov    edi,0x427140
  806ce4:	e8 e6 0a 00 00       	call   8077cf <read_sec>

    cur_dir.fistCluNum=0;
  806ce9:	66 c7 05 68 44 c2 ff 	mov    WORD PTR [rip+0xffffffffffc24468],0x0        # 42b15a <cur_dir+0x1a>
  806cf0:	00 00 

    //set some vars
    //why? because the .bss won't be packed into bin so any init
    //of global var in .c is meaningless.
    clu_sec_balance=superblock.rsvdSec+32+32-2;//63;
  806cf2:	0f b7 05 15 04 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc20415]        # 42710e <superblock+0xe>
  806cf9:	0f b7 c0             	movzx  eax,ax
  806cfc:	83 c0 3e             	add    eax,0x3e
  806cff:	89 05 3b 31 00 00    	mov    DWORD PTR [rip+0x313b],eax        # 809e40 <clu_sec_balance>
    //printf("clu sec bal:%d\n",clu_sec_balance);
    dir_depth=0;
  806d05:	c7 05 51 86 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc28651],0x0        # 42f360 <dir_depth>
  806d0c:	00 00 00 
    return 0;
  806d0f:	b8 00 00 00 00       	mov    eax,0x0

}
  806d14:	c9                   	leave  
  806d15:	c3                   	ret    

0000000000806d16 <verify_name>:

//检查输入的文件名长度是否合法，以及是否出现非法字符（但是不检查大小写和.）
//返回值为布尔值。
int verify_name(char *str)
{
  806d16:	f3 0f 1e fa          	endbr64 
  806d1a:	55                   	push   rbp
  806d1b:	48 89 e5             	mov    rbp,rsp
  806d1e:	48 83 ec 70          	sub    rsp,0x70
  806d22:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
    char valid_ch[]="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,/![]|+";
  806d26:	48 b8 61 62 63 64 65 	movabs rax,0x6867666564636261
  806d2d:	66 67 68 
  806d30:	48 ba 69 6a 6b 6c 6d 	movabs rdx,0x706f6e6d6c6b6a69
  806d37:	6e 6f 70 
  806d3a:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  806d3e:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  806d42:	48 b8 71 72 73 74 75 	movabs rax,0x7877767574737271
  806d49:	76 77 78 
  806d4c:	48 ba 79 7a 41 42 43 	movabs rdx,0x4645444342417a79
  806d53:	44 45 46 
  806d56:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  806d5a:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  806d5e:	48 b8 47 48 49 4a 4b 	movabs rax,0x4e4d4c4b4a494847
  806d65:	4c 4d 4e 
  806d68:	48 ba 4f 50 51 52 53 	movabs rdx,0x565554535251504f
  806d6f:	54 55 56 
  806d72:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  806d76:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  806d7a:	48 b8 57 58 59 5a 30 	movabs rax,0x333231305a595857
  806d81:	31 32 33 
  806d84:	48 ba 34 35 36 37 38 	movabs rdx,0x2f2c393837363534
  806d8b:	39 2c 2f 
  806d8e:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  806d92:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  806d96:	c7 45 e0 21 5b 5d 7c 	mov    DWORD PTR [rbp-0x20],0x7c5d5b21
  806d9d:	66 c7 45 e4 2b 00    	mov    WORD PTR [rbp-0x1c],0x2b
    if(strlen(str)>11||strlen(str)==0) {
  806da3:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806da7:	48 89 c7             	mov    rdi,rax
  806daa:	e8 24 28 00 00       	call   8095d3 <strlen>
  806daf:	83 f8 0b             	cmp    eax,0xb
  806db2:	7f 10                	jg     806dc4 <verify_name+0xae>
  806db4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806db8:	48 89 c7             	mov    rdi,rax
  806dbb:	e8 13 28 00 00       	call   8095d3 <strlen>
  806dc0:	85 c0                	test   eax,eax
  806dc2:	75 0a                	jne    806dce <verify_name+0xb8>
        //printf("length not valid\n");
        return 0;
  806dc4:	b8 00 00 00 00       	mov    eax,0x0
  806dc9:	e9 b3 01 00 00       	jmp    806f81 <verify_name+0x26b>
    }
    int c=0,i=0,flag=0,vchf=1;
  806dce:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806dd5:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806ddc:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806de3:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [rbp-0x18],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  806dea:	eb 6b                	jmp    806e57 <verify_name+0x141>
    {
        int j=0;
  806dec:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        for(;j<sizeof(valid_ch);j++)
  806df3:	eb 22                	jmp    806e17 <verify_name+0x101>
            if(str[i]==valid_ch[j])break;
  806df5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806df8:	48 63 d0             	movsxd rdx,eax
  806dfb:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806dff:	48 01 d0             	add    rax,rdx
  806e02:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806e05:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806e08:	48 98                	cdqe   
  806e0a:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  806e0f:	38 c2                	cmp    dl,al
  806e11:	74 0e                	je     806e21 <verify_name+0x10b>
        for(;j<sizeof(valid_ch);j++)
  806e13:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  806e17:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806e1a:	83 f8 45             	cmp    eax,0x45
  806e1d:	76 d6                	jbe    806df5 <verify_name+0xdf>
  806e1f:	eb 01                	jmp    806e22 <verify_name+0x10c>
            if(str[i]==valid_ch[j])break;
  806e21:	90                   	nop
        if(j>=sizeof(valid_ch))
  806e22:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806e25:	83 f8 45             	cmp    eax,0x45
  806e28:	76 0a                	jbe    806e34 <verify_name+0x11e>
        {
            //printf("invalid char\n");
            return 0;//出现非法字符
  806e2a:	b8 00 00 00 00       	mov    eax,0x0
  806e2f:	e9 4d 01 00 00       	jmp    806f81 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  806e34:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806e37:	48 63 d0             	movsxd rdx,eax
  806e3a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806e3e:	48 01 d0             	add    rax,rdx
  806e41:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806e44:	3c 20                	cmp    al,0x20
  806e46:	74 07                	je     806e4f <verify_name+0x139>
  806e48:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        c++;
  806e4f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  806e53:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806e57:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806e5a:	48 63 d0             	movsxd rdx,eax
  806e5d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806e61:	48 01 d0             	add    rax,rdx
  806e64:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806e67:	3c 2e                	cmp    al,0x2e
  806e69:	74 18                	je     806e83 <verify_name+0x16d>
  806e6b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806e6e:	48 63 d0             	movsxd rdx,eax
  806e71:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806e75:	48 01 d0             	add    rax,rdx
  806e78:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806e7b:	84 c0                	test   al,al
  806e7d:	0f 85 69 ff ff ff    	jne    806dec <verify_name+0xd6>
    }
    if(c>8||flag==0){
  806e83:	83 7d fc 08          	cmp    DWORD PTR [rbp-0x4],0x8
  806e87:	7f 06                	jg     806e8f <verify_name+0x179>
  806e89:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  806e8d:	75 0a                	jne    806e99 <verify_name+0x183>
        //printf("file name blank\n");
        return 0;//不能全是空格
  806e8f:	b8 00 00 00 00       	mov    eax,0x0
  806e94:	e9 e8 00 00 00       	jmp    806f81 <verify_name+0x26b>
    }
    if(str[i]=='\0')//没有扩展名
  806e99:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806e9c:	48 63 d0             	movsxd rdx,eax
  806e9f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806ea3:	48 01 d0             	add    rax,rdx
  806ea6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806ea9:	84 c0                	test   al,al
  806eab:	75 0a                	jne    806eb7 <verify_name+0x1a1>
        return 1;
  806ead:	b8 01 00 00 00       	mov    eax,0x1
  806eb2:	e9 ca 00 00 00       	jmp    806f81 <verify_name+0x26b>
    c=0;
  806eb7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    flag=0;
  806ebe:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(i++;str[i]!='\0';i++)
  806ec5:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806ec9:	e9 83 00 00 00       	jmp    806f51 <verify_name+0x23b>
    {
        int j=0;
  806ece:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
        for(;j<sizeof(valid_ch);j++)
  806ed5:	eb 22                	jmp    806ef9 <verify_name+0x1e3>
            if(str[i]==valid_ch[j])break;
  806ed7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806eda:	48 63 d0             	movsxd rdx,eax
  806edd:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806ee1:	48 01 d0             	add    rax,rdx
  806ee4:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806ee7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806eea:	48 98                	cdqe   
  806eec:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  806ef1:	38 c2                	cmp    dl,al
  806ef3:	74 0e                	je     806f03 <verify_name+0x1ed>
        for(;j<sizeof(valid_ch);j++)
  806ef5:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  806ef9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806efc:	83 f8 45             	cmp    eax,0x45
  806eff:	76 d6                	jbe    806ed7 <verify_name+0x1c1>
  806f01:	eb 01                	jmp    806f04 <verify_name+0x1ee>
            if(str[i]==valid_ch[j])break;
  806f03:	90                   	nop
        if(j>=sizeof(valid_ch)){
  806f04:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806f07:	83 f8 45             	cmp    eax,0x45
  806f0a:	76 07                	jbe    806f13 <verify_name+0x1fd>
            //printf("invalid char:%x\n",str[i]);
            return 0;//出现非法字符
  806f0c:	b8 00 00 00 00       	mov    eax,0x0
  806f11:	eb 6e                	jmp    806f81 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  806f13:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806f16:	48 63 d0             	movsxd rdx,eax
  806f19:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806f1d:	48 01 d0             	add    rax,rdx
  806f20:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806f23:	3c 20                	cmp    al,0x20
  806f25:	74 07                	je     806f2e <verify_name+0x218>
  806f27:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        if(str[i]=='.'){
  806f2e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806f31:	48 63 d0             	movsxd rdx,eax
  806f34:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806f38:	48 01 d0             	add    rax,rdx
  806f3b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806f3e:	3c 2e                	cmp    al,0x2e
  806f40:	75 07                	jne    806f49 <verify_name+0x233>
            //printf("multiple dots.");
            return 0;//不能多次出现.
  806f42:	b8 00 00 00 00       	mov    eax,0x0
  806f47:	eb 38                	jmp    806f81 <verify_name+0x26b>
        }
        c++;
  806f49:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(i++;str[i]!='\0';i++)
  806f4d:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806f51:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  806f54:	48 63 d0             	movsxd rdx,eax
  806f57:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  806f5b:	48 01 d0             	add    rax,rdx
  806f5e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806f61:	84 c0                	test   al,al
  806f63:	0f 85 65 ff ff ff    	jne    806ece <verify_name+0x1b8>
    }
    if(c>3||flag==0){
  806f69:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  806f6d:	7f 06                	jg     806f75 <verify_name+0x25f>
  806f6f:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  806f73:	75 07                	jne    806f7c <verify_name+0x266>
        //printf("file name blank\n");
        return 0;//不能全是空格
  806f75:	b8 00 00 00 00       	mov    eax,0x0
  806f7a:	eb 05                	jmp    806f81 <verify_name+0x26b>
    }
    return 1;
  806f7c:	b8 01 00 00 00       	mov    eax,0x1
}
  806f81:	c9                   	leave  
  806f82:	c3                   	ret    

0000000000806f83 <format_name>:
//将“aaa.bb”的文件名形式转换为可以直接strcmp(,,11)的形式。
//默认文件名合法，请先检查文件名再使用。
void format_name(char *str)
{
  806f83:	f3 0f 1e fa          	endbr64 
  806f87:	55                   	push   rbp
  806f88:	48 89 e5             	mov    rbp,rsp
  806f8b:	48 83 ec 30          	sub    rsp,0x30
  806f8f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char v[12]="           ";
  806f93:	48 b8 20 20 20 20 20 	movabs rax,0x2020202020202020
  806f9a:	20 20 20 
  806f9d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  806fa1:	c7 45 f0 20 20 20 00 	mov    DWORD PTR [rbp-0x10],0x202020
    int ptr=0;
  806fa8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    int namelen=0;
  806faf:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    for(int i=0;str[i]!='\0';i++)
  806fb6:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806fbd:	e9 9b 00 00 00       	jmp    80705d <format_name+0xda>
    {
        if(str[i]>='a'&&str[i]<='z')
  806fc2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806fc5:	48 63 d0             	movsxd rdx,eax
  806fc8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806fcc:	48 01 d0             	add    rax,rdx
  806fcf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806fd2:	3c 60                	cmp    al,0x60
  806fd4:	7e 3e                	jle    807014 <format_name+0x91>
  806fd6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806fd9:	48 63 d0             	movsxd rdx,eax
  806fdc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806fe0:	48 01 d0             	add    rax,rdx
  806fe3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806fe6:	3c 7a                	cmp    al,0x7a
  806fe8:	7f 2a                	jg     807014 <format_name+0x91>
        {
            v[ptr++]=str[i]-'a'+'A';
  806fea:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806fed:	48 63 d0             	movsxd rdx,eax
  806ff0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806ff4:	48 01 d0             	add    rax,rdx
  806ff7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806ffa:	8d 48 e0             	lea    ecx,[rax-0x20]
  806ffd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807000:	8d 50 01             	lea    edx,[rax+0x1]
  807003:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  807006:	89 ca                	mov    edx,ecx
  807008:	48 98                	cdqe   
  80700a:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  80700e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807012:	eb 45                	jmp    807059 <format_name+0xd6>
        }
        else if(str[i]=='.')
  807014:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807017:	48 63 d0             	movsxd rdx,eax
  80701a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80701e:	48 01 d0             	add    rax,rdx
  807021:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807024:	3c 2e                	cmp    al,0x2e
  807026:	75 0d                	jne    807035 <format_name+0xb2>
        {
            ptr+=(8-namelen);
  807028:	b8 08 00 00 00       	mov    eax,0x8
  80702d:	2b 45 f8             	sub    eax,DWORD PTR [rbp-0x8]
  807030:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
  807033:	eb 24                	jmp    807059 <format_name+0xd6>
        }else
        {
            v[ptr++]=str[i];
  807035:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807038:	48 63 d0             	movsxd rdx,eax
  80703b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80703f:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807043:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807046:	8d 50 01             	lea    edx,[rax+0x1]
  807049:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80704c:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
  80704f:	48 98                	cdqe   
  807051:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  807055:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
    for(int i=0;str[i]!='\0';i++)
  807059:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80705d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807060:	48 63 d0             	movsxd rdx,eax
  807063:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807067:	48 01 d0             	add    rax,rdx
  80706a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80706d:	84 c0                	test   al,al
  80706f:	0f 85 4d ff ff ff    	jne    806fc2 <format_name+0x3f>
        }
    }
    v[12]='\0';
  807075:	c6 45 f4 00          	mov    BYTE PTR [rbp-0xc],0x0
    strcpy(str,v);
  807079:	48 8d 55 e8          	lea    rdx,[rbp-0x18]
  80707d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807081:	48 89 d6             	mov    rsi,rdx
  807084:	48 89 c7             	mov    rdi,rax
  807087:	e8 28 23 00 00       	call   8093b4 <strcpy>
}
  80708c:	90                   	nop
  80708d:	c9                   	leave  
  80708e:	c3                   	ret    

000000000080708f <req_cluster>:
int req_cluster()
{
  80708f:	f3 0f 1e fa          	endbr64 
  807093:	55                   	push   rbp
  807094:	48 89 e5             	mov    rbp,rsp
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  807097:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [rbp-0x4],0x3
  80709e:	eb 2a                	jmp    8070ca <req_cluster+0x3b>
    {
        if(fat[i]==0)
  8070a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8070a3:	48 98                	cdqe   
  8070a5:	0f b7 84 00 60 b3 42 	movzx  eax,WORD PTR [rax+rax*1+0x42b360]
  8070ac:	00 
  8070ad:	66 85 c0             	test   ax,ax
  8070b0:	75 14                	jne    8070c6 <req_cluster+0x37>
        {
            fat[i]=0xffff;
  8070b2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8070b5:	48 98                	cdqe   
  8070b7:	66 c7 84 00 60 b3 42 	mov    WORD PTR [rax+rax*1+0x42b360],0xffff
  8070be:	00 ff ff 
            return i;
  8070c1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8070c4:	eb 13                	jmp    8070d9 <req_cluster+0x4a>
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  8070c6:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8070ca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8070cd:	3d ff 1f 00 00       	cmp    eax,0x1fff
  8070d2:	76 cc                	jbe    8070a0 <req_cluster+0x11>
        }
    }
    return -1;
  8070d4:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8070d9:	5d                   	pop    rbp
  8070da:	c3                   	ret    

00000000008070db <write_sec>:
int write_sec(char *src, int sec_num, int sec_c)
{
  8070db:	f3 0f 1e fa          	endbr64 
  8070df:	55                   	push   rbp
  8070e0:	48 89 e5             	mov    rbp,rsp
  8070e3:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
  8070ea:	48 89 bd 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rdi
  8070f1:	89 b5 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],esi
  8070f7:	89 95 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],edx
    driver_args arg={
  8070fd:	48 8d 95 40 ff ff ff 	lea    rdx,[rbp-0xc0]
  807104:	b8 00 00 00 00       	mov    eax,0x0
  807109:	b9 18 00 00 00       	mov    ecx,0x18
  80710e:	48 89 d7             	mov    rdi,rdx
  807111:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  807114:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  80711b:	89 85 48 ff ff ff    	mov    DWORD PTR [rbp-0xb8],eax
  807121:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  807127:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
  80712d:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  807133:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            .src_addr=src,
            .sec_n=sec_num,
            .sec_c=sec_c
    };
    return drv_disk.read(&arg);
  807139:	48 8b 15 78 2c 00 00 	mov    rdx,QWORD PTR [rip+0x2c78]        # 809db8 <drv_disk+0x18>
  807140:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  807147:	48 89 c7             	mov    rdi,rax
  80714a:	ff d2                	call   rdx
}
  80714c:	c9                   	leave  
  80714d:	c3                   	ret    

000000000080714e <set_attr>:
void set_attr(dir_entry *f,char attr)
{
  80714e:	f3 0f 1e fa          	endbr64 
  807152:	55                   	push   rbp
  807153:	48 89 e5             	mov    rbp,rsp
  807156:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80715a:	89 f0                	mov    eax,esi
  80715c:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    f->attr|=attr;
  80715f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807163:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  807167:	0a 45 f4             	or     al,BYTE PTR [rbp-0xc]
  80716a:	89 c2                	mov    edx,eax
  80716c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807170:	88 50 0b             	mov    BYTE PTR [rax+0xb],dl
}
  807173:	90                   	nop
  807174:	5d                   	pop    rbp
  807175:	c3                   	ret    

0000000000807176 <update_fat_and_root>:
mkdir
touch
rm
*/
void update_fat_and_root()
{
  807176:	f3 0f 1e fa          	endbr64 
  80717a:	55                   	push   rbp
  80717b:	48 89 e5             	mov    rbp,rsp
  80717e:	48 83 ec 10          	sub    rsp,0x10
    int root_loc=superblock.rsvdSec+\
  807182:	0f b7 05 85 ff c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1ff85]        # 42710e <superblock+0xe>
  807189:	0f b7 c8             	movzx  ecx,ax
    superblock.secPerFAT*superblock.numOfFAT;
  80718c:	0f b7 05 83 ff c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1ff83]        # 427116 <superblock+0x16>
  807193:	0f b7 d0             	movzx  edx,ax
  807196:	0f b6 05 73 ff c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1ff73]        # 427110 <superblock+0x10>
  80719d:	0f b6 c0             	movzx  eax,al
  8071a0:	0f af c2             	imul   eax,edx
    int root_loc=superblock.rsvdSec+\
  8071a3:	01 c8                	add    eax,ecx
  8071a5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("root_loc:0x%x\n",root_loc);
    write_sec(root_dir,root_loc,sizeof(root_dir));
  8071a8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8071ab:	ba 00 40 00 00       	mov    edx,0x4000
  8071b0:	89 c6                	mov    esi,eax
  8071b2:	bf 40 71 42 00       	mov    edi,0x427140
  8071b7:	e8 1f ff ff ff       	call   8070db <write_sec>
    //printf("updated root\n");
    write_sec(fat,superblock.rsvdSec,sizeof(fat));
  8071bc:	0f b7 05 4b ff c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1ff4b]        # 42710e <superblock+0xe>
  8071c3:	0f b7 c0             	movzx  eax,ax
  8071c6:	ba 00 40 00 00       	mov    edx,0x4000
  8071cb:	89 c6                	mov    esi,eax
  8071cd:	bf 60 b3 42 00       	mov    edi,0x42b360
  8071d2:	e8 04 ff ff ff       	call   8070db <write_sec>
    //printf("updated fat\n");

}
  8071d7:	90                   	nop
  8071d8:	c9                   	leave  
  8071d9:	c3                   	ret    

00000000008071da <add_dot_and_ddot_dir>:
void add_dot_and_ddot_dir(dir_entry dir)
{
  8071da:	f3 0f 1e fa          	endbr64 
  8071de:	55                   	push   rbp
  8071df:	48 89 e5             	mov    rbp,rsp
  8071e2:	48 83 ec 10          	sub    rsp,0x10
    //it must be a regular dir to add. and ..
    //and this must be done when the dir is created
    //regular dir
    int cluster = dir.fistCluNum;
  8071e6:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  8071ea:	0f b7 c0             	movzx  eax,ax
  8071ed:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
    superblock.secPerClu);
  8071f0:	0f b6 05 16 ff c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1ff16]        # 42710d <superblock+0xd>
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  8071f7:	0f b6 c0             	movzx  eax,al
  8071fa:	8b 0d 40 2c 00 00    	mov    ecx,DWORD PTR [rip+0x2c40]        # 809e40 <clu_sec_balance>
  807200:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  807203:	01 d1                	add    ecx,edx
  807205:	89 c2                	mov    edx,eax
  807207:	89 ce                	mov    esi,ecx
  807209:	bf 60 b1 42 00       	mov    edi,0x42b160
  80720e:	e8 bc 05 00 00       	call   8077cf <read_sec>
    //.
    strcpy(a_clu_of_dir[0].name,".       ");
  807213:	be aa 1c 81 00       	mov    esi,0x811caa
  807218:	bf 60 b1 42 00       	mov    edi,0x42b160
  80721d:	e8 92 21 00 00       	call   8093b4 <strcpy>
    strcpy(a_clu_of_dir[0].extension,"   ");
  807222:	be b3 1c 81 00       	mov    esi,0x811cb3
  807227:	bf 68 b1 42 00       	mov    edi,0x42b168
  80722c:	e8 83 21 00 00       	call   8093b4 <strcpy>
    a_clu_of_dir[0].fistCluNum=dir.fistCluNum;
  807231:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  807235:	66 89 05 3e 3f c2 ff 	mov    WORD PTR [rip+0xffffffffffc23f3e],ax        # 42b17a <a_clu_of_dir+0x1a>
    a_clu_of_dir[0].len=0;
  80723c:	c7 05 36 3f c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc23f36],0x0        # 42b17c <a_clu_of_dir+0x1c>
  807243:	00 00 00 
    set_attr(&a_clu_of_dir[0],ATTR_DIR);
  807246:	be 10 00 00 00       	mov    esi,0x10
  80724b:	bf 60 b1 42 00       	mov    edi,0x42b160
  807250:	e8 f9 fe ff ff       	call   80714e <set_attr>
    //..
    strcpy(a_clu_of_dir[1].name,"..      ");
  807255:	be b7 1c 81 00       	mov    esi,0x811cb7
  80725a:	bf 80 b1 42 00       	mov    edi,0x42b180
  80725f:	e8 50 21 00 00       	call   8093b4 <strcpy>
    strcpy(a_clu_of_dir[1].extension,"   ");
  807264:	be b3 1c 81 00       	mov    esi,0x811cb3
  807269:	bf 88 b1 42 00       	mov    edi,0x42b188
  80726e:	e8 41 21 00 00       	call   8093b4 <strcpy>
    a_clu_of_dir[1].fistCluNum=cur_dir.fistCluNum;
  807273:	0f b7 05 e0 3e c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc23ee0]        # 42b15a <cur_dir+0x1a>
  80727a:	66 89 05 19 3f c2 ff 	mov    WORD PTR [rip+0xffffffffffc23f19],ax        # 42b19a <a_clu_of_dir+0x3a>
    a_clu_of_dir[1].len=0;
  807281:	c7 05 11 3f c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc23f11],0x0        # 42b19c <a_clu_of_dir+0x3c>
  807288:	00 00 00 
    set_attr(&a_clu_of_dir[1],ATTR_DIR);
  80728b:	be 10 00 00 00       	mov    esi,0x10
  807290:	bf 80 b1 42 00       	mov    edi,0x42b180
  807295:	e8 b4 fe ff ff       	call   80714e <set_attr>
    //update the dir
    int dir_loc=cluster+clu_sec_balance;
  80729a:	8b 15 a0 2b 00 00    	mov    edx,DWORD PTR [rip+0x2ba0]        # 809e40 <clu_sec_balance>
  8072a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8072a3:	01 d0                	add    eax,edx
  8072a5:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  8072a8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8072ab:	ba 00 02 00 00       	mov    edx,0x200
  8072b0:	89 c6                	mov    esi,eax
  8072b2:	bf 60 b1 42 00       	mov    edi,0x42b160
  8072b7:	e8 1f fe ff ff       	call   8070db <write_sec>
    //no need to update fat and root
}
  8072bc:	90                   	nop
  8072bd:	c9                   	leave  
  8072be:	c3                   	ret    

00000000008072bf <translate_attr>:
void translate_attr(char attr,char *attr_s)
{
  8072bf:	f3 0f 1e fa          	endbr64 
  8072c3:	55                   	push   rbp
  8072c4:	48 89 e5             	mov    rbp,rsp
  8072c7:	89 f8                	mov    eax,edi
  8072c9:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8072cd:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    //rwhds (s: system h:hidden)
    int v=attr&1;
  8072d0:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  8072d4:	83 e0 01             	and    eax,0x1
  8072d7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//sys_read-only
  8072da:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8072de:	74 0b                	je     8072eb <translate_attr+0x2c>
        attr_s[1]='-';
  8072e0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8072e4:	48 83 c0 01          	add    rax,0x1
  8072e8:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
    v=attr&2;
  8072eb:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  8072ef:	83 e0 02             	and    eax,0x2
  8072f2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//hidden
  8072f5:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8072f9:	74 0b                	je     807306 <translate_attr+0x47>
        attr_s[2]='h';
  8072fb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8072ff:	48 83 c0 02          	add    rax,0x2
  807303:	c6 00 68             	mov    BYTE PTR [rax],0x68
    v=attr&4;
  807306:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  80730a:	83 e0 04             	and    eax,0x4
  80730d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//system
  807310:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807314:	74 0b                	je     807321 <translate_attr+0x62>
        attr_s[4]='s';
  807316:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80731a:	48 83 c0 04          	add    rax,0x4
  80731e:	c6 00 73             	mov    BYTE PTR [rax],0x73
    v=attr&8;
  807321:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807325:	83 e0 08             	and    eax,0x8
  807328:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//volume label
  80732b:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80732f:	74 0b                	je     80733c <translate_attr+0x7d>
        attr_s[3]='v';
  807331:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807335:	48 83 c0 03          	add    rax,0x3
  807339:	c6 00 76             	mov    BYTE PTR [rax],0x76
    v=attr&16;
  80733c:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807340:	83 e0 10             	and    eax,0x10
  807343:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//dir
  807346:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80734a:	74 0b                	je     807357 <translate_attr+0x98>
        attr_s[3]='d';
  80734c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807350:	48 83 c0 03          	add    rax,0x3
  807354:	c6 00 64             	mov    BYTE PTR [rax],0x64
    //archive: do nothing
    attr_s[5]='\0';
  807357:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80735b:	48 83 c0 05          	add    rax,0x5
  80735f:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  807362:	90                   	nop
  807363:	5d                   	pop    rbp
  807364:	c3                   	ret    

0000000000807365 <extend_cluster>:
int extend_cluster(short cluster)
{
  807365:	f3 0f 1e fa          	endbr64 
  807369:	55                   	push   rbp
  80736a:	48 89 e5             	mov    rbp,rsp
  80736d:	48 83 ec 18          	sub    rsp,0x18
  807371:	89 f8                	mov    eax,edi
  807373:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    int new_clu=req_cluster();
  807377:	b8 00 00 00 00       	mov    eax,0x0
  80737c:	e8 0e fd ff ff       	call   80708f <req_cluster>
  807381:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(new_clu==-1)
  807384:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  807388:	75 07                	jne    807391 <extend_cluster+0x2c>
        return -1;
  80738a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80738f:	eb 16                	jmp    8073a7 <extend_cluster+0x42>
    fat[cluster]=new_clu;
  807391:	0f bf 45 ec          	movsx  eax,WORD PTR [rbp-0x14]
  807395:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  807398:	48 98                	cdqe   
  80739a:	66 89 94 00 60 b3 42 	mov    WORD PTR [rax+rax*1+0x42b360],dx
  8073a1:	00 
    return 0;
  8073a2:	b8 00 00 00 00       	mov    eax,0x0
}
  8073a7:	c9                   	leave  
  8073a8:	c3                   	ret    

00000000008073a9 <touch>:
得出的结果换算成16进制填入即可。也就是：38H字节0~4位是日期数；38H字节5~7位和39H字节0位是月份；
39H字节的1~7位为年号，原定义中0~119分别代表1980~2099，目前高版本的Windows允许取0~127，
即年号最大可以到2107年。
*/
int touch(driver_args *arg)
{
  8073a9:	f3 0f 1e fa          	endbr64 
  8073ad:	55                   	push   rbp
  8073ae:	48 89 e5             	mov    rbp,rsp
  8073b1:	48 83 ec 60          	sub    rsp,0x60
  8073b5:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    char *name=arg->path;
  8073b9:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8073bd:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8073c1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  8073c5:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8073c9:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8073cc:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    //default set to 512
    int max_files=16;
  8073d0:	c7 45 ec 10 00 00 00 	mov    DWORD PTR [rbp-0x14],0x10
    dir_entry *dir_table=a_clu_of_dir;
  8073d7:	48 c7 45 e0 60 b1 42 	mov    QWORD PTR [rbp-0x20],0x42b160
  8073de:	00 
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  8073df:	0f b6 05 27 fd c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fd27]        # 42710d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  8073e6:	0f b6 c0             	movzx  eax,al
  8073e9:	0f b7 55 ca          	movzx  edx,WORD PTR [rbp-0x36]
  8073ed:	0f b7 ca             	movzx  ecx,dx
  8073f0:	8b 15 4a 2a 00 00    	mov    edx,DWORD PTR [rip+0x2a4a]        # 809e40 <clu_sec_balance>
  8073f6:	01 d1                	add    ecx,edx
  8073f8:	89 c2                	mov    edx,eax
  8073fa:	89 ce                	mov    esi,ecx
  8073fc:	bf 60 b1 42 00       	mov    edi,0x42b160
  807401:	e8 c9 03 00 00       	call   8077cf <read_sec>
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  807406:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  80740a:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do{
        for(int i=0;i<max_files;i++)
  80740e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807415:	e9 2e 01 00 00       	jmp    807548 <touch+0x19f>
        {
            //printf("%s\n",dir_table[i].name);
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  80741a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80741d:	48 98                	cdqe   
  80741f:	48 c1 e0 05          	shl    rax,0x5
  807423:	48 89 c2             	mov    rdx,rax
  807426:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80742a:	48 01 d0             	add    rax,rdx
  80742d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807430:	3c e5                	cmp    al,0xe5
  807432:	74 1e                	je     807452 <touch+0xa9>
            dir_table[i].name[0]==0)
  807434:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807437:	48 98                	cdqe   
  807439:	48 c1 e0 05          	shl    rax,0x5
  80743d:	48 89 c2             	mov    rdx,rax
  807440:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807444:	48 01 d0             	add    rax,rdx
  807447:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  80744a:	84 c0                	test   al,al
  80744c:	0f 85 f2 00 00 00    	jne    807544 <touch+0x19b>
            {
                //available
                //put name
                format_name(name);
  807452:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807456:	48 89 c7             	mov    rdi,rax
  807459:	e8 25 fb ff ff       	call   806f83 <format_name>
                memcpy(dir_table[i].name,name,11);
  80745e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807461:	48 98                	cdqe   
  807463:	48 c1 e0 05          	shl    rax,0x5
  807467:	48 89 c2             	mov    rdx,rax
  80746a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80746e:	48 01 d0             	add    rax,rdx
  807471:	48 89 c1             	mov    rcx,rax
  807474:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807478:	ba 0b 00 00 00       	mov    edx,0xb
  80747d:	48 89 c6             	mov    rsi,rax
  807480:	48 89 cf             	mov    rdi,rcx
  807483:	e8 2e 1e 00 00       	call   8092b6 <memcpy>
                int clu=req_cluster();
  807488:	b8 00 00 00 00       	mov    eax,0x0
  80748d:	e8 fd fb ff ff       	call   80708f <req_cluster>
  807492:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
                if(clu==-1)
  807495:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  807499:	75 0a                	jne    8074a5 <touch+0xfc>
                {
                    //puts("err: full disk");
                    return -1;
  80749b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8074a0:	e9 fc 00 00 00       	jmp    8075a1 <touch+0x1f8>
                }
                dir_table[i].fistCluNum=clu;
  8074a5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8074a8:	48 98                	cdqe   
  8074aa:	48 c1 e0 05          	shl    rax,0x5
  8074ae:	48 89 c2             	mov    rdx,rax
  8074b1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8074b5:	48 01 d0             	add    rax,rdx
  8074b8:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8074bb:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
                set_attr(&dir_table[i],ATTR_ARCHIVE);
  8074bf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8074c2:	48 98                	cdqe   
  8074c4:	48 c1 e0 05          	shl    rax,0x5
  8074c8:	48 89 c2             	mov    rdx,rax
  8074cb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8074cf:	48 01 d0             	add    rax,rdx
  8074d2:	be 20 00 00 00       	mov    esi,0x20
  8074d7:	48 89 c7             	mov    rdi,rax
  8074da:	e8 6f fc ff ff       	call   80714e <set_attr>
                dir_table[i].len=superblock.bytesPerSec*superblock.secPerClu;
  8074df:	0f b7 05 25 fc c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1fc25]        # 42710b <superblock+0xb>
  8074e6:	0f b7 d0             	movzx  edx,ax
  8074e9:	0f b6 05 1d fc c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fc1d]        # 42710d <superblock+0xd>
  8074f0:	0f b6 c0             	movzx  eax,al
  8074f3:	0f af d0             	imul   edx,eax
  8074f6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8074f9:	48 98                	cdqe   
  8074fb:	48 c1 e0 05          	shl    rax,0x5
  8074ff:	48 89 c1             	mov    rcx,rax
  807502:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807506:	48 01 c8             	add    rax,rcx
  807509:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
                //date and time
                //dir_table[i].lastModfDate=get_date_stab();
                //dir_table[i].lastModfTime=get_time_stab();
                //update
                write_sec(dir_table,cluster+clu_sec_balance,\
                superblock.bytesPerSec*superblock.secPerClu);
  80750c:	0f b7 05 f8 fb c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1fbf8]        # 42710b <superblock+0xb>
  807513:	0f b7 d0             	movzx  edx,ax
  807516:	0f b6 05 f0 fb c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fbf0]        # 42710d <superblock+0xd>
  80751d:	0f b6 c0             	movzx  eax,al
                write_sec(dir_table,cluster+clu_sec_balance,\
  807520:	0f af d0             	imul   edx,eax
  807523:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807527:	8b 05 13 29 00 00    	mov    eax,DWORD PTR [rip+0x2913]        # 809e40 <clu_sec_balance>
  80752d:	01 c1                	add    ecx,eax
  80752f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807533:	89 ce                	mov    esi,ecx
  807535:	48 89 c7             	mov    rdi,rax
  807538:	e8 9e fb ff ff       	call   8070db <write_sec>
                return -1;
  80753d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807542:	eb 5d                	jmp    8075a1 <touch+0x1f8>
        for(int i=0;i<max_files;i++)
  807544:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807548:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80754b:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
  80754e:	0f 8c c6 fe ff ff    	jl     80741a <touch+0x71>
        if(fat[cluster]>=FAT_EOF&&extend_cluster(cluster)==-1)
        {
            //extend fail
            //puts("err:full disk");
            return -1;
        }else if(cluster<FAT_EOF)
  807554:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807559:	77 36                	ja     807591 <touch+0x1e8>
        {
            cluster=fat[cluster];
  80755b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80755f:	48 98                	cdqe   
  807561:	0f b7 84 00 60 b3 42 	movzx  eax,WORD PTR [rax+rax*1+0x42b360]
  807568:	00 
  807569:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  80756d:	0f b6 05 99 fb c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fb99]        # 42710d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807574:	0f b6 d0             	movzx  edx,al
  807577:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  80757b:	8b 05 bf 28 00 00    	mov    eax,DWORD PTR [rip+0x28bf]        # 809e40 <clu_sec_balance>
  807581:	01 c1                	add    ecx,eax
  807583:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807587:	89 ce                	mov    esi,ecx
  807589:	48 89 c7             	mov    rdi,rax
  80758c:	e8 3e 02 00 00       	call   8077cf <read_sec>
        }
    }while(cluster<FAT_EOF);
  807591:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807596:	0f 86 72 fe ff ff    	jbe    80740e <touch+0x65>
    return 0;
  80759c:	b8 00 00 00 00       	mov    eax,0x0
}
  8075a1:	c9                   	leave  
  8075a2:	c3                   	ret    

00000000008075a3 <mkdir>:
//attention: the name must be char[12]
int mkdir(driver_args *arg)
{
  8075a3:	f3 0f 1e fa          	endbr64 
  8075a7:	55                   	push   rbp
  8075a8:	48 89 e5             	mov    rbp,rsp
  8075ab:	48 83 ec 50          	sub    rsp,0x50
  8075af:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    char *name=arg->path;
  8075b3:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8075b7:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8075bb:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  8075bf:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8075c3:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8075c6:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    format_name(name);
  8075ca:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8075ce:	48 89 c7             	mov    rdi,rax
  8075d1:	e8 ad f9 ff ff       	call   806f83 <format_name>
    //regular dir
    unsigned short cluster = dir.fistCluNum;
  8075d6:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  8075da:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do
    {
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
            superblock.secPerClu);
  8075de:	0f b6 05 28 fb c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1fb28]        # 42710d <superblock+0xd>
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  8075e5:	0f b6 c0             	movzx  eax,al
  8075e8:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  8075ec:	8b 15 4e 28 00 00    	mov    edx,DWORD PTR [rip+0x284e]        # 809e40 <clu_sec_balance>
  8075f2:	01 d1                	add    ecx,edx
  8075f4:	89 c2                	mov    edx,eax
  8075f6:	89 ce                	mov    esi,ecx
  8075f8:	bf 60 b1 42 00       	mov    edi,0x42b160
  8075fd:	e8 cd 01 00 00       	call   8077cf <read_sec>
        for (int i = 0; i < 16; i++)
  807602:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807609:	e9 8c 01 00 00       	jmp    80779a <mkdir+0x1f7>
        {
            if(a_clu_of_dir[i].fistCluNum==0||\
  80760e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807611:	48 98                	cdqe   
  807613:	48 c1 e0 05          	shl    rax,0x5
  807617:	48 05 7a b1 42 00    	add    rax,0x42b17a
  80761d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  807620:	66 85 c0             	test   ax,ax
  807623:	74 30                	je     807655 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0xe5||\
  807625:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807628:	48 98                	cdqe   
  80762a:	48 c1 e0 05          	shl    rax,0x5
  80762e:	48 05 40 71 42 00    	add    rax,0x427140
  807634:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if(a_clu_of_dir[i].fistCluNum==0||\
  807637:	3c e5                	cmp    al,0xe5
  807639:	74 1a                	je     807655 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0)
  80763b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80763e:	48 98                	cdqe   
  807640:	48 c1 e0 05          	shl    rax,0x5
  807644:	48 05 40 71 42 00    	add    rax,0x427140
  80764a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            (unsigned char)root_dir[i].name[0]==0xe5||\
  80764d:	84 c0                	test   al,al
  80764f:	0f 85 41 01 00 00    	jne    807796 <mkdir+0x1f3>
            {
                memset(&a_clu_of_dir[i],0,sizeof(dir_entry));
  807655:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807658:	48 98                	cdqe   
  80765a:	48 c1 e0 05          	shl    rax,0x5
  80765e:	48 05 60 b1 42 00    	add    rax,0x42b160
  807664:	ba 20 00 00 00       	mov    edx,0x20
  807669:	be 00 00 00 00       	mov    esi,0x0
  80766e:	48 89 c7             	mov    rdi,rax
  807671:	e8 ef 1c 00 00       	call   809365 <memset>
                memset(a_clu_of_dir[i].name,' ',11);
  807676:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807679:	48 98                	cdqe   
  80767b:	48 c1 e0 05          	shl    rax,0x5
  80767f:	48 05 60 b1 42 00    	add    rax,0x42b160
  807685:	ba 0b 00 00 00       	mov    edx,0xb
  80768a:	be 20 00 00 00       	mov    esi,0x20
  80768f:	48 89 c7             	mov    rdi,rax
  807692:	e8 ce 1c 00 00       	call   809365 <memset>
                strcpy(a_clu_of_dir[i].name,name);
  807697:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80769a:	48 98                	cdqe   
  80769c:	48 c1 e0 05          	shl    rax,0x5
  8076a0:	48 8d 90 60 b1 42 00 	lea    rdx,[rax+0x42b160]
  8076a7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8076ab:	48 89 c6             	mov    rsi,rax
  8076ae:	48 89 d7             	mov    rdi,rdx
  8076b1:	e8 fe 1c 00 00       	call   8093b4 <strcpy>
                a_clu_of_dir[i].name[strlen(name)]=' ';
  8076b6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8076ba:	48 89 c7             	mov    rdi,rax
  8076bd:	e8 11 1f 00 00       	call   8095d3 <strlen>
  8076c2:	48 63 d0             	movsxd rdx,eax
  8076c5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8076c8:	48 98                	cdqe   
  8076ca:	48 c1 e0 05          	shl    rax,0x5
  8076ce:	48 01 d0             	add    rax,rdx
  8076d1:	48 05 60 b1 42 00    	add    rax,0x42b160
  8076d7:	c6 00 20             	mov    BYTE PTR [rax],0x20
                int clu=req_cluster();
  8076da:	b8 00 00 00 00       	mov    eax,0x0
  8076df:	e8 ab f9 ff ff       	call   80708f <req_cluster>
  8076e4:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
                if(clu==-1)//check
  8076e7:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8076eb:	75 0a                	jne    8076f7 <mkdir+0x154>
                {
                    //puts("err:full dir");
                    return -1;
  8076ed:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8076f2:	e9 d6 00 00 00       	jmp    8077cd <mkdir+0x22a>
                }
                a_clu_of_dir[i].fistCluNum=clu;
  8076f7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8076fa:	89 c2                	mov    edx,eax
  8076fc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8076ff:	48 98                	cdqe   
  807701:	48 c1 e0 05          	shl    rax,0x5
  807705:	48 05 7a b1 42 00    	add    rax,0x42b17a
  80770b:	66 89 10             	mov    WORD PTR [rax],dx
                //set attr
                set_attr(&a_clu_of_dir[i],ATTR_DIR);
  80770e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807711:	48 98                	cdqe   
  807713:	48 c1 e0 05          	shl    rax,0x5
  807717:	48 05 60 b1 42 00    	add    rax,0x42b160
  80771d:	be 10 00 00 00       	mov    esi,0x10
  807722:	48 89 c7             	mov    rdi,rax
  807725:	e8 24 fa ff ff       	call   80714e <set_attr>
                //set length
                a_clu_of_dir[i].len=0;
  80772a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80772d:	48 98                	cdqe   
  80772f:	48 c1 e0 05          	shl    rax,0x5
  807733:	48 05 7c b1 42 00    	add    rax,0x42b17c
  807739:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
                //date and time
                /*a_clu_of_dir[i].lastModfDate=get_date_stab();
                a_clu_of_dir[i].lastModfTime=get_time_stab();*/
                //set date:temporarily none
                //add . and ..
                add_dot_and_ddot_dir(a_clu_of_dir[i]);
  80773f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807742:	48 98                	cdqe   
  807744:	48 c1 e0 05          	shl    rax,0x5
  807748:	48 05 60 b1 42 00    	add    rax,0x42b160
  80774e:	ff 70 18             	push   QWORD PTR [rax+0x18]
  807751:	ff 70 10             	push   QWORD PTR [rax+0x10]
  807754:	ff 70 08             	push   QWORD PTR [rax+0x8]
  807757:	ff 30                	push   QWORD PTR [rax]
  807759:	e8 7c fa ff ff       	call   8071da <add_dot_and_ddot_dir>
  80775e:	48 83 c4 20          	add    rsp,0x20
                //update the dir
                int dir_loc=cluster+clu_sec_balance;
  807762:	0f b7 55 fe          	movzx  edx,WORD PTR [rbp-0x2]
  807766:	8b 05 d4 26 00 00    	mov    eax,DWORD PTR [rip+0x26d4]        # 809e40 <clu_sec_balance>
  80776c:	01 d0                	add    eax,edx
  80776e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
                write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  807771:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807774:	ba 00 02 00 00       	mov    edx,0x200
  807779:	89 c6                	mov    esi,eax
  80777b:	bf 60 b1 42 00       	mov    edi,0x42b160
  807780:	e8 56 f9 ff ff       	call   8070db <write_sec>
                update_fat_and_root();
  807785:	b8 00 00 00 00       	mov    eax,0x0
  80778a:	e8 e7 f9 ff ff       	call   807176 <update_fat_and_root>
                return 0;
  80778f:	b8 00 00 00 00       	mov    eax,0x0
  807794:	eb 37                	jmp    8077cd <mkdir+0x22a>
        for (int i = 0; i < 16; i++)
  807796:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80779a:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  80779e:	0f 8e 6a fe ff ff    	jle    80760e <mkdir+0x6b>
            }
        }

        if(cluster<FAT_EOF)
  8077a4:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  8077a9:	77 12                	ja     8077bd <mkdir+0x21a>
            cluster=fat[cluster];
  8077ab:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8077af:	48 98                	cdqe   
  8077b1:	0f b7 84 00 60 b3 42 	movzx  eax,WORD PTR [rax+rax*1+0x42b360]
  8077b8:	00 
  8077b9:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    } while (cluster<FAT_EOF);
  8077bd:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  8077c2:	0f 86 16 fe ff ff    	jbe    8075de <mkdir+0x3b>
    return -1;
  8077c8:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8077cd:	c9                   	leave  
  8077ce:	c3                   	ret    

00000000008077cf <read_sec>:
    }
    
    
}*/
int read_sec(char *dist, int sec_num, int sec_count)
{
  8077cf:	f3 0f 1e fa          	endbr64 
  8077d3:	55                   	push   rbp
  8077d4:	48 89 e5             	mov    rbp,rsp
  8077d7:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  8077de:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
  8077e5:	89 b5 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],esi
  8077eb:	89 95 20 ff ff ff    	mov    DWORD PTR [rbp-0xe0],edx
    driver_args arg={
  8077f1:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  8077f8:	b8 00 00 00 00       	mov    eax,0x0
  8077fd:	b9 18 00 00 00       	mov    ecx,0x18
  807802:	48 89 d7             	mov    rdi,rdx
  807805:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  807808:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
  80780e:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
  807814:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  80781b:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
  807821:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  807828:	00 00 00 
            .dist_addr=dist,
            .lba=sec_num,
            .sec_c=1
    };
    for(int i=0;i<sec_count;i++)
  80782b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807832:	eb 3e                	jmp    807872 <read_sec+0xa3>
    {
        drv_disk.read(&arg);
  807834:	48 8b 15 7d 25 00 00 	mov    rdx,QWORD PTR [rip+0x257d]        # 809db8 <drv_disk+0x18>
  80783b:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  807842:	48 89 c7             	mov    rdi,rax
  807845:	ff d2                	call   rdx
        arg.dist_addr+=superblock.bytesPerSec;
  807847:	8b 95 34 ff ff ff    	mov    edx,DWORD PTR [rbp-0xcc]
  80784d:	0f b7 05 b7 f8 c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1f8b7]        # 42710b <superblock+0xb>
  807854:	0f b7 c0             	movzx  eax,ax
  807857:	01 d0                	add    eax,edx
  807859:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.lba++;
  80785f:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  807865:	83 c0 01             	add    eax,0x1
  807868:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
    for(int i=0;i<sec_count;i++)
  80786e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807872:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807875:	3b 85 20 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xe0]
  80787b:	7c b7                	jl     807834 <read_sec+0x65>
    }
    return 0;
  80787d:	b8 00 00 00 00       	mov    eax,0x0
}
  807882:	c9                   	leave  
  807883:	c3                   	ret    

0000000000807884 <rm>:

int rm(driver_args* args)
{
  807884:	f3 0f 1e fa          	endbr64 
  807888:	55                   	push   rbp
  807889:	48 89 e5             	mov    rbp,rsp
  80788c:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  807893:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
    char *name=args->path;
  80789a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8078a1:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  8078a5:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    driver_args tmparg={
  8078a9:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  8078b0:	b8 00 00 00 00       	mov    eax,0x0
  8078b5:	b9 18 00 00 00       	mov    ecx,0x18
  8078ba:	48 89 d7             	mov    rdi,rdx
  8078bd:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .path=args->dir_path,
  8078c0:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8078c7:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
    driver_args tmparg={
  8078ce:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    if(get_entry(&tmparg)==-1)return -1;
  8078d5:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  8078dc:	48 89 c7             	mov    rdi,rax
  8078df:	e8 07 0a 00 00       	call   8082eb <get_entry>
  8078e4:	83 f8 ff             	cmp    eax,0xffffffff
  8078e7:	75 0a                	jne    8078f3 <rm+0x6f>
  8078e9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8078ee:	e9 a8 01 00 00       	jmp    807a9b <rm+0x217>
    dir.fistCluNum=tmparg.entry.id;
  8078f3:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  8078f9:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    dir_entry *dir_table=a_clu_of_dir;
  8078fd:	48 c7 45 e0 60 b1 42 	mov    QWORD PTR [rbp-0x20],0x42b160
  807904:	00 
    //regular dir
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
    superblock.secPerClu);
  807905:	0f b6 05 01 f8 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f801]        # 42710d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  80790c:	0f b6 c0             	movzx  eax,al
  80790f:	0f b7 55 da          	movzx  edx,WORD PTR [rbp-0x26]
  807913:	0f b7 ca             	movzx  ecx,dx
  807916:	8b 15 24 25 00 00    	mov    edx,DWORD PTR [rip+0x2524]        # 809e40 <clu_sec_balance>
  80791c:	01 d1                	add    ecx,edx
  80791e:	89 c2                	mov    edx,eax
  807920:	89 ce                	mov    esi,ecx
  807922:	bf 60 b1 42 00       	mov    edi,0x42b160
  807927:	e8 a3 fe ff ff       	call   8077cf <read_sec>
    dir_table=a_clu_of_dir;
  80792c:	48 c7 45 e0 60 b1 42 	mov    QWORD PTR [rbp-0x20],0x42b160
  807933:	00 
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  807934:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  807938:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    int i=0;
  80793c:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    while(cluster<FAT_EOF){
  807943:	e9 89 00 00 00       	jmp    8079d1 <rm+0x14d>
        read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807948:	0f b6 05 be f7 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f7be]        # 42710d <superblock+0xd>
        read_sec(dir_table,cluster+clu_sec_balance,\
  80794f:	0f b6 d0             	movzx  edx,al
  807952:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807956:	8b 05 e4 24 00 00    	mov    eax,DWORD PTR [rip+0x24e4]        # 809e40 <clu_sec_balance>
  80795c:	01 c1                	add    ecx,eax
  80795e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807962:	89 ce                	mov    esi,ecx
  807964:	48 89 c7             	mov    rdi,rax
  807967:	e8 63 fe ff ff       	call   8077cf <read_sec>
        for(;i<16;i++)
  80796c:	eb 44                	jmp    8079b2 <rm+0x12e>
        {
            if(dir_table[i].fistCluNum==args->entry.id)
  80796e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807971:	48 98                	cdqe   
  807973:	48 c1 e0 05          	shl    rax,0x5
  807977:	48 89 c2             	mov    rdx,rax
  80797a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80797e:	48 01 d0             	add    rax,rdx
  807981:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  807985:	0f b7 d0             	movzx  edx,ax
  807988:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80798f:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  807992:	39 c2                	cmp    edx,eax
  807994:	75 18                	jne    8079ae <rm+0x12a>
            {
                if(dir_table[i].attr&ATTR_DIR){
                    //要处理里面的文件
                }
                dir_table[i].name[0]=0xe5;
  807996:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807999:	48 98                	cdqe   
  80799b:	48 c1 e0 05          	shl    rax,0x5
  80799f:	48 89 c2             	mov    rdx,rax
  8079a2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8079a6:	48 01 d0             	add    rax,rdx
  8079a9:	c6 00 e5             	mov    BYTE PTR [rax],0xe5
                goto del_entry_finish;
  8079ac:	eb 2f                	jmp    8079dd <rm+0x159>
        for(;i<16;i++)
  8079ae:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8079b2:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  8079b6:	7e b6                	jle    80796e <rm+0xea>
            }
        }
        if(cluster<FAT_EOF)
  8079b8:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  8079bd:	77 12                	ja     8079d1 <rm+0x14d>
        {
            cluster=fat[cluster];
  8079bf:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8079c3:	48 98                	cdqe   
  8079c5:	0f b7 84 00 60 b3 42 	movzx  eax,WORD PTR [rax+rax*1+0x42b360]
  8079cc:	00 
  8079cd:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    while(cluster<FAT_EOF){
  8079d1:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  8079d6:	0f 86 6c ff ff ff    	jbe    807948 <rm+0xc4>
            //update
            //if you can reach here it means it's a regular dir
        }

    }
del_entry_finish:
  8079dc:	90                   	nop
    ;
    //del fat
    unsigned short del_clu=dir_table[i].fistCluNum;
  8079dd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8079e0:	48 98                	cdqe   
  8079e2:	48 c1 e0 05          	shl    rax,0x5
  8079e6:	48 89 c2             	mov    rdx,rax
  8079e9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8079ed:	48 01 d0             	add    rax,rdx
  8079f0:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  8079f4:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
    unsigned short pion=del_clu<FAT_EOF?fat[del_clu]:0xffff;
  8079f8:	66 83 7d f6 f6       	cmp    WORD PTR [rbp-0xa],0xfff6
  8079fd:	77 10                	ja     807a0f <rm+0x18b>
  8079ff:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807a03:	48 98                	cdqe   
  807a05:	0f b7 84 00 60 b3 42 	movzx  eax,WORD PTR [rax+rax*1+0x42b360]
  807a0c:	00 
  807a0d:	eb 05                	jmp    807a14 <rm+0x190>
  807a0f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807a14:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  807a18:	eb 2a                	jmp    807a44 <rm+0x1c0>
    {
        fat[del_clu]=0;
  807a1a:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807a1e:	48 98                	cdqe   
  807a20:	66 c7 84 00 60 b3 42 	mov    WORD PTR [rax+rax*1+0x42b360],0x0
  807a27:	00 00 00 
        del_clu=pion;
  807a2a:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  807a2e:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
        pion=fat[pion];
  807a32:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  807a36:	48 98                	cdqe   
  807a38:	0f b7 84 00 60 b3 42 	movzx  eax,WORD PTR [rax+rax*1+0x42b360]
  807a3f:	00 
  807a40:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  807a44:	66 83 7d f4 f6       	cmp    WORD PTR [rbp-0xc],0xfff6
  807a49:	76 cf                	jbe    807a1a <rm+0x196>
    }
    fat[del_clu]=0;
  807a4b:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  807a4f:	48 98                	cdqe   
  807a51:	66 c7 84 00 60 b3 42 	mov    WORD PTR [rax+rax*1+0x42b360],0x0
  807a58:	00 00 00 
    //del dir entry
    write_sec(dir_table,cluster+clu_sec_balance,\
    superblock.secPerClu*superblock.bytesPerSec);
  807a5b:	0f b6 05 ab f6 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f6ab]        # 42710d <superblock+0xd>
  807a62:	0f b6 d0             	movzx  edx,al
  807a65:	0f b7 05 9f f6 c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1f69f]        # 42710b <superblock+0xb>
  807a6c:	0f b7 c0             	movzx  eax,ax
    write_sec(dir_table,cluster+clu_sec_balance,\
  807a6f:	0f af d0             	imul   edx,eax
  807a72:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807a76:	8b 05 c4 23 00 00    	mov    eax,DWORD PTR [rip+0x23c4]        # 809e40 <clu_sec_balance>
  807a7c:	01 c1                	add    ecx,eax
  807a7e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807a82:	89 ce                	mov    esi,ecx
  807a84:	48 89 c7             	mov    rdi,rax
  807a87:	e8 4f f6 ff ff       	call   8070db <write_sec>
    update_fat_and_root();
  807a8c:	b8 00 00 00 00       	mov    eax,0x0
  807a91:	e8 e0 f6 ff ff       	call   807176 <update_fat_and_root>
    return 0;
  807a96:	b8 00 00 00 00       	mov    eax,0x0
}
  807a9b:	c9                   	leave  
  807a9c:	c3                   	ret    

0000000000807a9d <find>:
int find_f=0;
int find(char *name)
{
  807a9d:	f3 0f 1e fa          	endbr64 
  807aa1:	55                   	push   rbp
  807aa2:	48 89 e5             	mov    rbp,rsp
  807aa5:	48 83 ec 30          	sub    rsp,0x30
  807aa9:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  807aad:	c7 45 fc 00 02 00 00 	mov    DWORD PTR [rbp-0x4],0x200
    int index=0;
  807ab4:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    dir_entry *dir_table=a_clu_of_dir;
  807abb:	48 c7 45 f0 60 b1 42 	mov    QWORD PTR [rbp-0x10],0x42b160
  807ac2:	00 
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  807ac3:	0f b7 05 90 36 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc23690]        # 42b15a <cur_dir+0x1a>
  807aca:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
    if(cur_dir.fistCluNum==0)
  807ace:	0f b7 05 85 36 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc23685]        # 42b15a <cur_dir+0x1a>
  807ad5:	66 85 c0             	test   ax,ax
  807ad8:	75 0a                	jne    807ae4 <find+0x47>
        dir_table=root_dir;
  807ada:	48 c7 45 f0 40 71 42 	mov    QWORD PTR [rbp-0x10],0x427140
  807ae1:	00 
  807ae2:	eb 2b                	jmp    807b0f <find+0x72>
    else {
        max_files=16;
  807ae4:	c7 45 fc 10 00 00 00 	mov    DWORD PTR [rbp-0x4],0x10
        read_sec(dir_table, cluster + clu_sec_balance, \
            superblock.secPerClu);
  807aeb:	0f b6 05 1b f6 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f61b]        # 42710d <superblock+0xd>
        read_sec(dir_table, cluster + clu_sec_balance, \
  807af2:	0f b6 d0             	movzx  edx,al
  807af5:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  807af9:	8b 05 41 23 00 00    	mov    eax,DWORD PTR [rip+0x2341]        # 809e40 <clu_sec_balance>
  807aff:	01 c1                	add    ecx,eax
  807b01:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807b05:	89 ce                	mov    esi,ecx
  807b07:	48 89 c7             	mov    rdi,rax
  807b0a:	e8 c0 fc ff ff       	call   8077cf <read_sec>
    }
    do{
        for(int i=0;i<max_files;i++)
  807b0f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  807b16:	eb 57                	jmp    807b6f <find+0xd2>
        {
            if(dir_table[i].name[0]==0||dir_table[i].name[0]==0xe5)
  807b18:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807b1b:	48 98                	cdqe   
  807b1d:	48 c1 e0 05          	shl    rax,0x5
  807b21:	48 89 c2             	mov    rdx,rax
  807b24:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807b28:	48 01 d0             	add    rax,rdx
  807b2b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807b2e:	84 c0                	test   al,al
  807b30:	74 38                	je     807b6a <find+0xcd>
                continue;
            if(memcmp(dir_table[i].name,name,11)==0)
  807b32:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807b35:	48 98                	cdqe   
  807b37:	48 c1 e0 05          	shl    rax,0x5
  807b3b:	48 89 c2             	mov    rdx,rax
  807b3e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807b42:	48 01 d0             	add    rax,rdx
  807b45:	48 89 c1             	mov    rcx,rax
  807b48:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807b4c:	ba 0b 00 00 00       	mov    edx,0xb
  807b51:	48 89 c6             	mov    rsi,rax
  807b54:	48 89 cf             	mov    rdi,rcx
  807b57:	e8 a4 17 00 00       	call   809300 <memcmp>
  807b5c:	85 c0                	test   eax,eax
  807b5e:	75 0b                	jne    807b6b <find+0xce>
            {
                return index+i;
  807b60:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  807b63:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807b66:	01 d0                	add    eax,edx
  807b68:	eb 71                	jmp    807bdb <find+0x13e>
                continue;
  807b6a:	90                   	nop
        for(int i=0;i<max_files;i++)
  807b6b:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  807b6f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807b72:	3b 45 fc             	cmp    eax,DWORD PTR [rbp-0x4]
  807b75:	7c a1                	jl     807b18 <find+0x7b>
            }
        }
        if(cur_dir.fistCluNum==0)
  807b77:	0f b7 05 dc 35 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc235dc]        # 42b15a <cur_dir+0x1a>
  807b7e:	66 85 c0             	test   ax,ax
  807b81:	75 07                	jne    807b8a <find+0xed>
            return -1;
  807b83:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807b88:	eb 51                	jmp    807bdb <find+0x13e>
        else if(cluster<FAT_EOF)
  807b8a:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  807b8f:	77 3a                	ja     807bcb <find+0x12e>
        {
            index+=16;
  807b91:	83 45 f8 10          	add    DWORD PTR [rbp-0x8],0x10
            cluster=fat[cluster];
  807b95:	0f b7 45 ee          	movzx  eax,WORD PTR [rbp-0x12]
  807b99:	48 98                	cdqe   
  807b9b:	0f b7 84 00 60 b3 42 	movzx  eax,WORD PTR [rax+rax*1+0x42b360]
  807ba2:	00 
  807ba3:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807ba7:	0f b6 05 5f f5 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f55f]        # 42710d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807bae:	0f b6 d0             	movzx  edx,al
  807bb1:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  807bb5:	8b 05 85 22 00 00    	mov    eax,DWORD PTR [rip+0x2285]        # 809e40 <clu_sec_balance>
  807bbb:	01 c1                	add    ecx,eax
  807bbd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807bc1:	89 ce                	mov    esi,ecx
  807bc3:	48 89 c7             	mov    rdi,rax
  807bc6:	e8 04 fc ff ff       	call   8077cf <read_sec>
        }
    }while(cluster<FAT_EOF);
  807bcb:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  807bd0:	0f 86 39 ff ff ff    	jbe    807b0f <find+0x72>
    return -1;
  807bd6:	b8 ff ff ff ff       	mov    eax,0xffffffff

}
  807bdb:	c9                   	leave  
  807bdc:	c3                   	ret    

0000000000807bdd <read_file_byname>:

int read_file_byname(char *full_name,char *dist,int pos,int len)
{
  807bdd:	f3 0f 1e fa          	endbr64 
  807be1:	55                   	push   rbp
  807be2:	48 89 e5             	mov    rbp,rsp
  807be5:	41 57                	push   r15
  807be7:	41 56                	push   r14
  807be9:	41 55                	push   r13
  807beb:	41 54                	push   r12
  807bed:	53                   	push   rbx
  807bee:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  807bf5:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  807bfc:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  807c03:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  807c09:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  807c0f:	48 89 e0             	mov    rax,rsp
  807c12:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  807c15:	bf 00 00 00 00       	mov    edi,0x0
  807c1a:	e8 7e fe ff ff       	call   807a9d <find>
  807c1f:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  807c22:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  807c26:	74 09                	je     807c31 <read_file_byname+0x54>
  807c28:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  807c2f:	79 0a                	jns    807c3b <read_file_byname+0x5e>
        return -1;
  807c31:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807c36:	e9 ea 02 00 00       	jmp    807f25 <read_file_byname+0x348>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  807c3b:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  807c42:	48 c7 45 c0 40 71 42 	mov    QWORD PTR [rbp-0x40],0x427140
  807c49:	00 
    int in_root=1;
  807c4a:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  807c51:	0f b7 05 02 35 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc23502]        # 42b15a <cur_dir+0x1a>
  807c58:	66 85 c0             	test   ax,ax
  807c5b:	74 40                	je     807c9d <read_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  807c5d:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  807c64:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  807c6b:	0f b6 05 9b f4 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f49b]        # 42710d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  807c72:	0f b6 c0             	movzx  eax,al
  807c75:	0f b7 15 de 34 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc234de]        # 42b15a <cur_dir+0x1a>
  807c7c:	0f b7 ca             	movzx  ecx,dx
  807c7f:	8b 15 bb 21 00 00    	mov    edx,DWORD PTR [rip+0x21bb]        # 809e40 <clu_sec_balance>
  807c85:	01 d1                	add    ecx,edx
  807c87:	89 c2                	mov    edx,eax
  807c89:	89 ce                	mov    esi,ecx
  807c8b:	bf 60 b1 42 00       	mov    edi,0x42b160
  807c90:	e8 3a fb ff ff       	call   8077cf <read_sec>
        dir_table=a_clu_of_dir;
  807c95:	48 c7 45 c0 60 b1 42 	mov    QWORD PTR [rbp-0x40],0x42b160
  807c9c:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  807c9d:	0f b7 05 b6 34 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc234b6]        # 42b15a <cur_dir+0x1a>
  807ca4:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  807ca8:	eb 41                	jmp    807ceb <read_file_byname+0x10e>
        index-=16;
  807caa:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  807cae:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  807cb3:	77 36                	ja     807ceb <read_file_byname+0x10e>
        {
            cluster=fat[cluster];
  807cb5:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  807cb9:	48 98                	cdqe   
  807cbb:	0f b7 84 00 60 b3 42 	movzx  eax,WORD PTR [rax+rax*1+0x42b360]
  807cc2:	00 
  807cc3:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807cc7:	0f b6 05 3f f4 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f43f]        # 42710d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807cce:	0f b6 d0             	movzx  edx,al
  807cd1:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  807cd5:	8b 05 65 21 00 00    	mov    eax,DWORD PTR [rip+0x2165]        # 809e40 <clu_sec_balance>
  807cdb:	01 c1                	add    ecx,eax
  807cdd:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807ce1:	89 ce                	mov    esi,ecx
  807ce3:	48 89 c7             	mov    rdi,rax
  807ce6:	e8 e4 fa ff ff       	call   8077cf <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  807ceb:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  807cef:	75 0d                	jne    807cfe <read_file_byname+0x121>
  807cf1:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  807cf5:	7e 07                	jle    807cfe <read_file_byname+0x121>
  807cf7:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  807cfc:	76 ac                	jbe    807caa <read_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  807cfe:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  807d01:	48 98                	cdqe   
  807d03:	48 c1 e0 05          	shl    rax,0x5
  807d07:	48 89 c2             	mov    rdx,rax
  807d0a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807d0e:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  807d12:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  807d15:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  807d19:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  807d20:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  807d27:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  807d2b:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  807d2f:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  807d33:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  807d37:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  807d3b:	0f b7 c0             	movzx  eax,ax
  807d3e:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  807d41:	0f b7 05 c3 f3 c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1f3c3]        # 42710b <superblock+0xb>
  807d48:	0f b7 d0             	movzx  edx,ax
  807d4b:	0f b6 05 bb f3 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f3bb]        # 42710d <superblock+0xd>
  807d52:	0f b6 c0             	movzx  eax,al
  807d55:	0f af c2             	imul   eax,edx
  807d58:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  807d5b:	eb 25                	jmp    807d82 <read_file_byname+0x1a5>
    {
        pos-=cluster_size;
  807d5d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807d60:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        f_cluster=fat[f_cluster];
  807d66:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807d69:	48 98                	cdqe   
  807d6b:	0f b7 84 00 60 b3 42 	movzx  eax,WORD PTR [rax+rax*1+0x42b360]
  807d72:	00 
  807d73:	98                   	cwde   
  807d74:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        if(pos<cluster_size)
  807d77:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807d7d:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  807d80:	7c 0d                	jl     807d8f <read_file_byname+0x1b2>
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  807d82:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807d88:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  807d8b:	7d d0                	jge    807d5d <read_file_byname+0x180>
  807d8d:	eb 01                	jmp    807d90 <read_file_byname+0x1b3>
            break;
  807d8f:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  807d90:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  807d97:	7e 15                	jle    807dae <read_file_byname+0x1d1>
  807d99:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807d9f:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  807da2:	7c 0a                	jl     807dae <read_file_byname+0x1d1>
        return -1;//pos out of range
  807da4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807da9:	e9 77 01 00 00       	jmp    807f25 <read_file_byname+0x348>
    //
    char temp[cluster_size];
  807dae:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807db1:	48 63 d0             	movsxd rdx,eax
  807db4:	48 83 ea 01          	sub    rdx,0x1
  807db8:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  807dbc:	48 63 d0             	movsxd rdx,eax
  807dbf:	49 89 d6             	mov    r14,rdx
  807dc2:	41 bf 00 00 00 00    	mov    r15d,0x0
  807dc8:	48 63 d0             	movsxd rdx,eax
  807dcb:	49 89 d4             	mov    r12,rdx
  807dce:	41 bd 00 00 00 00    	mov    r13d,0x0
  807dd4:	48 98                	cdqe   
  807dd6:	ba 10 00 00 00       	mov    edx,0x10
  807ddb:	48 83 ea 01          	sub    rdx,0x1
  807ddf:	48 01 d0             	add    rax,rdx
  807de2:	be 10 00 00 00       	mov    esi,0x10
  807de7:	ba 00 00 00 00       	mov    edx,0x0
  807dec:	48 f7 f6             	div    rsi
  807def:	48 6b c0 10          	imul   rax,rax,0x10
  807df3:	48 89 c1             	mov    rcx,rax
  807df6:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  807dfd:	48 89 e2             	mov    rdx,rsp
  807e00:	48 29 ca             	sub    rdx,rcx
  807e03:	48 39 d4             	cmp    rsp,rdx
  807e06:	74 12                	je     807e1a <read_file_byname+0x23d>
  807e08:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  807e0f:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  807e16:	00 00 
  807e18:	eb e9                	jmp    807e03 <read_file_byname+0x226>
  807e1a:	48 89 c2             	mov    rdx,rax
  807e1d:	81 e2 ff 0f 00 00    	and    edx,0xfff
  807e23:	48 29 d4             	sub    rsp,rdx
  807e26:	48 89 c2             	mov    rdx,rax
  807e29:	81 e2 ff 0f 00 00    	and    edx,0xfff
  807e2f:	48 85 d2             	test   rdx,rdx
  807e32:	74 10                	je     807e44 <read_file_byname+0x267>
  807e34:	25 ff 0f 00 00       	and    eax,0xfff
  807e39:	48 83 e8 08          	sub    rax,0x8
  807e3d:	48 01 e0             	add    rax,rsp
  807e40:	48 83 08 00          	or     QWORD PTR [rax],0x0
  807e44:	48 89 e0             	mov    rax,rsp
  807e47:	48 83 c0 00          	add    rax,0x0
  807e4b:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of reading might be not aligned
    read_sec(temp,f_cluster+clu_sec_balance,superblock.secPerClu);
  807e4f:	0f b6 05 b7 f2 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f2b7]        # 42710d <superblock+0xd>
  807e56:	0f b6 d0             	movzx  edx,al
  807e59:	8b 0d e1 1f 00 00    	mov    ecx,DWORD PTR [rip+0x1fe1]        # 809e40 <clu_sec_balance>
  807e5f:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807e62:	01 c1                	add    ecx,eax
  807e64:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807e68:	89 ce                	mov    esi,ecx
  807e6a:	48 89 c7             	mov    rdi,rax
  807e6d:	e8 5d f9 ff ff       	call   8077cf <read_sec>
    memcpy(dist,temp+pos,cluster_size-pos);
  807e72:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807e75:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  807e7b:	89 c2                	mov    edx,eax
  807e7d:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  807e83:	48 63 c8             	movsxd rcx,eax
  807e86:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807e8a:	48 01 c1             	add    rcx,rax
  807e8d:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  807e94:	48 89 ce             	mov    rsi,rcx
  807e97:	48 89 c7             	mov    rdi,rax
  807e9a:	e8 17 14 00 00       	call   8092b6 <memcpy>
    dist+=cluster_size-pos;
  807e9f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807ea2:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  807ea8:	48 98                	cdqe   
  807eaa:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
    len-=cluster_size-pos;
  807eb1:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807eb4:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  807eba:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  807ec0:	eb 4c                	jmp    807f0e <read_file_byname+0x331>
    {
        f_cluster=fat[f_cluster];
  807ec2:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807ec5:	48 98                	cdqe   
  807ec7:	0f b7 84 00 60 b3 42 	movzx  eax,WORD PTR [rax+rax*1+0x42b360]
  807ece:	00 
  807ecf:	98                   	cwde   
  807ed0:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        read_sec(dist,f_cluster+clu_sec_balance,superblock.secPerClu);
  807ed3:	0f b6 05 33 f2 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f233]        # 42710d <superblock+0xd>
  807eda:	0f b6 d0             	movzx  edx,al
  807edd:	8b 0d 5d 1f 00 00    	mov    ecx,DWORD PTR [rip+0x1f5d]        # 809e40 <clu_sec_balance>
  807ee3:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  807ee6:	01 c1                	add    ecx,eax
  807ee8:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  807eef:	89 ce                	mov    esi,ecx
  807ef1:	48 89 c7             	mov    rdi,rax
  807ef4:	e8 d6 f8 ff ff       	call   8077cf <read_sec>
        dist+=cluster_size;
  807ef9:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807efc:	48 98                	cdqe   
  807efe:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  807f05:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807f08:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  807f0e:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  807f15:	7f 09                	jg     807f20 <read_file_byname+0x343>
  807f17:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  807f1e:	7f a2                	jg     807ec2 <read_file_byname+0x2e5>
    }
    return 0;
  807f20:	b8 00 00 00 00       	mov    eax,0x0
  807f25:	48 89 dc             	mov    rsp,rbx
    
}
  807f28:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  807f2c:	5b                   	pop    rbx
  807f2d:	41 5c                	pop    r12
  807f2f:	41 5d                	pop    r13
  807f31:	41 5e                	pop    r14
  807f33:	41 5f                	pop    r15
  807f35:	5d                   	pop    rbp
  807f36:	c3                   	ret    

0000000000807f37 <write_file_byname>:
int write_file_byname(char *full_name,char *src,int pos,int len)
{
  807f37:	f3 0f 1e fa          	endbr64 
  807f3b:	55                   	push   rbp
  807f3c:	48 89 e5             	mov    rbp,rsp
  807f3f:	41 57                	push   r15
  807f41:	41 56                	push   r14
  807f43:	41 55                	push   r13
  807f45:	41 54                	push   r12
  807f47:	53                   	push   rbx
  807f48:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  807f4f:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  807f56:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  807f5d:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  807f63:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  807f69:	48 89 e0             	mov    rax,rsp
  807f6c:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  807f6f:	bf 00 00 00 00       	mov    edi,0x0
  807f74:	e8 24 fb ff ff       	call   807a9d <find>
  807f79:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  807f7c:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  807f80:	74 09                	je     807f8b <write_file_byname+0x54>
  807f82:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  807f89:	79 0a                	jns    807f95 <write_file_byname+0x5e>
        return -1;
  807f8b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807f90:	e9 1e 03 00 00       	jmp    8082b3 <write_file_byname+0x37c>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  807f95:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  807f9c:	48 c7 45 c0 40 71 42 	mov    QWORD PTR [rbp-0x40],0x427140
  807fa3:	00 
    int in_root=1;
  807fa4:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  807fab:	0f b7 05 a8 31 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc231a8]        # 42b15a <cur_dir+0x1a>
  807fb2:	66 85 c0             	test   ax,ax
  807fb5:	74 40                	je     807ff7 <write_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  807fb7:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  807fbe:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  807fc5:	0f b6 05 41 f1 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f141]        # 42710d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  807fcc:	0f b6 c0             	movzx  eax,al
  807fcf:	0f b7 15 84 31 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc23184]        # 42b15a <cur_dir+0x1a>
  807fd6:	0f b7 ca             	movzx  ecx,dx
  807fd9:	8b 15 61 1e 00 00    	mov    edx,DWORD PTR [rip+0x1e61]        # 809e40 <clu_sec_balance>
  807fdf:	01 d1                	add    ecx,edx
  807fe1:	89 c2                	mov    edx,eax
  807fe3:	89 ce                	mov    esi,ecx
  807fe5:	bf 60 b1 42 00       	mov    edi,0x42b160
  807fea:	e8 e0 f7 ff ff       	call   8077cf <read_sec>
        dir_table=a_clu_of_dir;
  807fef:	48 c7 45 c0 60 b1 42 	mov    QWORD PTR [rbp-0x40],0x42b160
  807ff6:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  807ff7:	0f b7 05 5c 31 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2315c]        # 42b15a <cur_dir+0x1a>
  807ffe:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  808002:	eb 41                	jmp    808045 <write_file_byname+0x10e>
        index-=16;
  808004:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  808008:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  80800d:	77 36                	ja     808045 <write_file_byname+0x10e>
        {
            cluster=fat[cluster];
  80800f:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  808013:	48 98                	cdqe   
  808015:	0f b7 84 00 60 b3 42 	movzx  eax,WORD PTR [rax+rax*1+0x42b360]
  80801c:	00 
  80801d:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  808021:	0f b6 05 e5 f0 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f0e5]        # 42710d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  808028:	0f b6 d0             	movzx  edx,al
  80802b:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  80802f:	8b 05 0b 1e 00 00    	mov    eax,DWORD PTR [rip+0x1e0b]        # 809e40 <clu_sec_balance>
  808035:	01 c1                	add    ecx,eax
  808037:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80803b:	89 ce                	mov    esi,ecx
  80803d:	48 89 c7             	mov    rdi,rax
  808040:	e8 8a f7 ff ff       	call   8077cf <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  808045:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  808049:	75 0d                	jne    808058 <write_file_byname+0x121>
  80804b:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  80804f:	7e 07                	jle    808058 <write_file_byname+0x121>
  808051:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  808056:	76 ac                	jbe    808004 <write_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  808058:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  80805b:	48 98                	cdqe   
  80805d:	48 c1 e0 05          	shl    rax,0x5
  808061:	48 89 c2             	mov    rdx,rax
  808064:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808068:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  80806c:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  80806f:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808073:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  80807a:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  808081:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808085:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808089:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  80808d:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  808091:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  808095:	0f b7 c0             	movzx  eax,ax
  808098:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  80809b:	0f b7 05 69 f0 c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1f069]        # 42710b <superblock+0xb>
  8080a2:	0f b7 d0             	movzx  edx,ax
  8080a5:	0f b6 05 61 f0 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1f061]        # 42710d <superblock+0xd>
  8080ac:	0f b6 c0             	movzx  eax,al
  8080af:	0f af c2             	imul   eax,edx
  8080b2:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  8080b5:	eb 25                	jmp    8080dc <write_file_byname+0x1a5>
    {
        pos-=cluster_size;
  8080b7:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8080ba:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        if(pos<cluster_size)
  8080c0:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8080c6:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8080c9:	7c 1e                	jl     8080e9 <write_file_byname+0x1b2>
            break;
        f_cluster=fat[f_cluster];
  8080cb:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8080ce:	48 98                	cdqe   
  8080d0:	0f b7 84 00 60 b3 42 	movzx  eax,WORD PTR [rax+rax*1+0x42b360]
  8080d7:	00 
  8080d8:	98                   	cwde   
  8080d9:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  8080dc:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8080e2:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8080e5:	7d d0                	jge    8080b7 <write_file_byname+0x180>
  8080e7:	eb 01                	jmp    8080ea <write_file_byname+0x1b3>
            break;
  8080e9:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  8080ea:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  8080f1:	7e 15                	jle    808108 <write_file_byname+0x1d1>
  8080f3:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8080f9:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8080fc:	7c 0a                	jl     808108 <write_file_byname+0x1d1>
        return -1;//pos out of range
  8080fe:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808103:	e9 ab 01 00 00       	jmp    8082b3 <write_file_byname+0x37c>
    //
    char temp[cluster_size];
  808108:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80810b:	48 63 d0             	movsxd rdx,eax
  80810e:	48 83 ea 01          	sub    rdx,0x1
  808112:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  808116:	48 63 d0             	movsxd rdx,eax
  808119:	49 89 d6             	mov    r14,rdx
  80811c:	41 bf 00 00 00 00    	mov    r15d,0x0
  808122:	48 63 d0             	movsxd rdx,eax
  808125:	49 89 d4             	mov    r12,rdx
  808128:	41 bd 00 00 00 00    	mov    r13d,0x0
  80812e:	48 98                	cdqe   
  808130:	ba 10 00 00 00       	mov    edx,0x10
  808135:	48 83 ea 01          	sub    rdx,0x1
  808139:	48 01 d0             	add    rax,rdx
  80813c:	be 10 00 00 00       	mov    esi,0x10
  808141:	ba 00 00 00 00       	mov    edx,0x0
  808146:	48 f7 f6             	div    rsi
  808149:	48 6b c0 10          	imul   rax,rax,0x10
  80814d:	48 89 c1             	mov    rcx,rax
  808150:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  808157:	48 89 e2             	mov    rdx,rsp
  80815a:	48 29 ca             	sub    rdx,rcx
  80815d:	48 39 d4             	cmp    rsp,rdx
  808160:	74 12                	je     808174 <write_file_byname+0x23d>
  808162:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  808169:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  808170:	00 00 
  808172:	eb e9                	jmp    80815d <write_file_byname+0x226>
  808174:	48 89 c2             	mov    rdx,rax
  808177:	81 e2 ff 0f 00 00    	and    edx,0xfff
  80817d:	48 29 d4             	sub    rsp,rdx
  808180:	48 89 c2             	mov    rdx,rax
  808183:	81 e2 ff 0f 00 00    	and    edx,0xfff
  808189:	48 85 d2             	test   rdx,rdx
  80818c:	74 10                	je     80819e <write_file_byname+0x267>
  80818e:	25 ff 0f 00 00       	and    eax,0xfff
  808193:	48 83 e8 08          	sub    rax,0x8
  808197:	48 01 e0             	add    rax,rsp
  80819a:	48 83 08 00          	or     QWORD PTR [rax],0x0
  80819e:	48 89 e0             	mov    rax,rsp
  8081a1:	48 83 c0 00          	add    rax,0x0
  8081a5:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of writing might not be aligned
    if(pos>0)
  8081a9:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  8081b0:	0f 8e a2 00 00 00    	jle    808258 <write_file_byname+0x321>
    {
        memcpy(temp+pos,src,cluster_size-pos);
  8081b6:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8081b9:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  8081bf:	89 c2                	mov    edx,eax
  8081c1:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8081c7:	48 63 c8             	movsxd rcx,eax
  8081ca:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8081ce:	48 01 c1             	add    rcx,rax
  8081d1:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  8081d8:	48 89 c6             	mov    rsi,rax
  8081db:	48 89 cf             	mov    rdi,rcx
  8081de:	e8 d3 10 00 00       	call   8092b6 <memcpy>
        write_sec(temp,f_cluster,cluster_size-pos);
  8081e3:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8081e6:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  8081ec:	89 c2                	mov    edx,eax
  8081ee:	8b 4d b4             	mov    ecx,DWORD PTR [rbp-0x4c]
  8081f1:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8081f5:	89 ce                	mov    esi,ecx
  8081f7:	48 89 c7             	mov    rdi,rax
  8081fa:	e8 dc ee ff ff       	call   8070db <write_sec>
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  8081ff:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808202:	48 98                	cdqe   
  808204:	0f b7 84 00 60 b3 42 	movzx  eax,WORD PTR [rax+rax*1+0x42b360]
  80820b:	00 
  80820c:	98                   	cwde   
  80820d:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    }
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  808210:	eb 46                	jmp    808258 <write_file_byname+0x321>
    {
        write_sec(src,f_cluster+clu_sec_balance,cluster_size);
  808212:	8b 15 28 1c 00 00    	mov    edx,DWORD PTR [rip+0x1c28]        # 809e40 <clu_sec_balance>
  808218:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80821b:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80821e:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  808221:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  808228:	89 ce                	mov    esi,ecx
  80822a:	48 89 c7             	mov    rdi,rax
  80822d:	e8 a9 ee ff ff       	call   8070db <write_sec>
        src+=cluster_size;
  808232:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808235:	48 98                	cdqe   
  808237:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  80823e:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808241:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  808247:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80824a:	48 98                	cdqe   
  80824c:	0f b7 84 00 60 b3 42 	movzx  eax,WORD PTR [rax+rax*1+0x42b360]
  808253:	00 
  808254:	98                   	cwde   
  808255:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  808258:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  80825f:	7f 0b                	jg     80826c <write_file_byname+0x335>
  808261:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa8]
  808267:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  80826a:	7d a6                	jge    808212 <write_file_byname+0x2db>
    }
    if(len>0)
  80826c:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  808273:	7e 39                	jle    8082ae <write_file_byname+0x377>
    {
        //there might be some leftover less than a cluster
        memcpy(temp,src,len);
  808275:	8b 95 58 ff ff ff    	mov    edx,DWORD PTR [rbp-0xa8]
  80827b:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  808282:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808286:	48 89 ce             	mov    rsi,rcx
  808289:	48 89 c7             	mov    rdi,rax
  80828c:	e8 25 10 00 00       	call   8092b6 <memcpy>
        write_sec(temp,f_cluster+clu_sec_balance,cluster_size);
  808291:	8b 15 a9 1b 00 00    	mov    edx,DWORD PTR [rip+0x1ba9]        # 809e40 <clu_sec_balance>
  808297:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80829a:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80829d:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  8082a0:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8082a4:	89 ce                	mov    esi,ecx
  8082a6:	48 89 c7             	mov    rdi,rax
  8082a9:	e8 2d ee ff ff       	call   8070db <write_sec>
    }
    return 0;
  8082ae:	b8 00 00 00 00       	mov    eax,0x0
  8082b3:	48 89 dc             	mov    rsp,rbx

}
  8082b6:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  8082ba:	5b                   	pop    rbx
  8082bb:	41 5c                	pop    r12
  8082bd:	41 5d                	pop    r13
  8082bf:	41 5e                	pop    r14
  8082c1:	41 5f                	pop    r15
  8082c3:	5d                   	pop    rbp
  8082c4:	c3                   	ret    

00000000008082c5 <file_exist>:


int file_exist(dir_entry entry)
{
  8082c5:	f3 0f 1e fa          	endbr64 
  8082c9:	55                   	push   rbp
  8082ca:	48 89 e5             	mov    rbp,rsp
    if((unsigned char)entry.name[0]==0xe5u||\
  8082cd:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
  8082d1:	3c e5                	cmp    al,0xe5
  8082d3:	74 08                	je     8082dd <file_exist+0x18>
    (unsigned char)entry.name[0]==0u)
  8082d5:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
    if((unsigned char)entry.name[0]==0xe5u||\
  8082d9:	84 c0                	test   al,al
  8082db:	75 07                	jne    8082e4 <file_exist+0x1f>
    {
        //printf("file not exist\n");
        return 0;
  8082dd:	b8 00 00 00 00       	mov    eax,0x0
  8082e2:	eb 05                	jmp    8082e9 <file_exist+0x24>

    }
    return 1;
  8082e4:	b8 01 00 00 00       	mov    eax,0x1
}
  8082e9:	5d                   	pop    rbp
  8082ea:	c3                   	ret    

00000000008082eb <get_entry>:
int get_entry(driver_args* args)
{
  8082eb:	f3 0f 1e fa          	endbr64 
  8082ef:	55                   	push   rbp
  8082f0:	48 89 e5             	mov    rbp,rsp
  8082f3:	53                   	push   rbx
  8082f4:	48 81 ec e8 00 00 00 	sub    rsp,0xe8
  8082fb:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
    char *name=args->path;
  808302:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808309:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80830d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    dir.fistCluNum=((vfs_dir_entry*)args->cwd)->id;
  808311:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808318:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  80831f:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808322:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    dir_entry entry;
    vfs_dir_entry ret;
    entry.name[0]=0xe5;
  808326:	c6 45 90 e5          	mov    BYTE PTR [rbp-0x70],0xe5

    char *p=name;
  80832a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80832e:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    char nametmp[12];
    int index=-1;
  808332:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [rbp-0x24],0xffffffff
    while(*name!='\0')
  808339:	e9 2c 01 00 00       	jmp    80846a <get_entry+0x17f>
    {
        if(*name=='/')
  80833e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808342:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808345:	3c 2f                	cmp    al,0x2f
  808347:	0f 85 18 01 00 00    	jne    808465 <get_entry+0x17a>
        {
            if(name-p>11)return -1;
  80834d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808351:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  808355:	48 83 f8 0b          	cmp    rax,0xb
  808359:	7e 0a                	jle    808365 <get_entry+0x7a>
  80835b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808360:	e9 50 02 00 00       	jmp    8085b5 <get_entry+0x2ca>
            memcpy(nametmp,p,name-p);
  808365:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808369:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  80836d:	89 c2                	mov    edx,eax
  80836f:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  808373:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  80837a:	48 89 ce             	mov    rsi,rcx
  80837d:	48 89 c7             	mov    rdi,rax
  808380:	e8 31 0f 00 00       	call   8092b6 <memcpy>
            cur_dir=dir;
  808385:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808389:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  80838d:	48 89 05 ac 2d c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22dac],rax        # 42b140 <cur_dir>
  808394:	48 89 15 ad 2d c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22dad],rdx        # 42b148 <cur_dir+0x8>
  80839b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80839f:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  8083a3:	48 89 05 a6 2d c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22da6],rax        # 42b150 <cur_dir+0x10>
  8083aa:	48 89 15 a7 2d c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22da7],rdx        # 42b158 <cur_dir+0x18>
            format_name(nametmp);
  8083b1:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  8083b8:	48 89 c7             	mov    rdi,rax
  8083bb:	e8 c3 eb ff ff       	call   806f83 <format_name>
            index= find(nametmp);
  8083c0:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  8083c7:	48 89 c7             	mov    rdi,rax
  8083ca:	e8 ce f6 ff ff       	call   807a9d <find>
  8083cf:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            if(index==-1)return -1;
  8083d2:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  8083d6:	75 0a                	jne    8083e2 <get_entry+0xf7>
  8083d8:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8083dd:	e9 d3 01 00 00       	jmp    8085b5 <get_entry+0x2ca>
            if(cur_dir.fistCluNum==0)//在根目录
  8083e2:	0f b7 05 71 2d c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22d71]        # 42b15a <cur_dir+0x1a>
  8083e9:	66 85 c0             	test   ax,ax
  8083ec:	75 31                	jne    80841f <get_entry+0x134>
                dir=root_dir[index];
  8083ee:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8083f1:	48 98                	cdqe   
  8083f3:	48 c1 e0 05          	shl    rax,0x5
  8083f7:	48 8d 88 40 71 42 00 	lea    rcx,[rax+0x427140]
  8083fe:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808401:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808405:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  808409:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  80840d:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808411:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808415:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  808419:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  80841d:	eb 3a                	jmp    808459 <get_entry+0x16e>
            else//在子目录
                dir=a_clu_of_dir[index%16];
  80841f:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808422:	99                   	cdq    
  808423:	c1 ea 1c             	shr    edx,0x1c
  808426:	01 d0                	add    eax,edx
  808428:	83 e0 0f             	and    eax,0xf
  80842b:	29 d0                	sub    eax,edx
  80842d:	48 98                	cdqe   
  80842f:	48 c1 e0 05          	shl    rax,0x5
  808433:	48 8d 88 60 b1 42 00 	lea    rcx,[rax+0x42b160]
  80843a:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  80843d:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808441:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  808445:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  808449:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  80844d:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808451:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  808455:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
            p=name+1;
  808459:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80845d:	48 83 c0 01          	add    rax,0x1
  808461:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        }
        name++;
  808465:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
    while(*name!='\0')
  80846a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80846e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808471:	84 c0                	test   al,al
  808473:	0f 85 c5 fe ff ff    	jne    80833e <get_entry+0x53>
    }

    //现在就可以开始找文件了
    format_name(p);
  808479:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80847d:	48 89 c7             	mov    rdi,rax
  808480:	e8 fe ea ff ff       	call   806f83 <format_name>
    index= find(p);
  808485:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808489:	48 89 c7             	mov    rdi,rax
  80848c:	e8 0c f6 ff ff       	call   807a9d <find>
  808491:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    if(index==-1)return -1;
  808494:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  808498:	75 0a                	jne    8084a4 <get_entry+0x1b9>
  80849a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80849f:	e9 11 01 00 00       	jmp    8085b5 <get_entry+0x2ca>
    
    if(cur_dir.fistCluNum==0)//在根目录
  8084a4:	0f b7 05 af 2c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22caf]        # 42b15a <cur_dir+0x1a>
  8084ab:	66 85 c0             	test   ax,ax
  8084ae:	75 31                	jne    8084e1 <get_entry+0x1f6>
        entry=root_dir[index];
  8084b0:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8084b3:	48 98                	cdqe   
  8084b5:	48 c1 e0 05          	shl    rax,0x5
  8084b9:	48 8d 88 40 71 42 00 	lea    rcx,[rax+0x427140]
  8084c0:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8084c3:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  8084c7:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  8084cb:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  8084cf:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8084d3:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  8084d7:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  8084db:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  8084df:	eb 3a                	jmp    80851b <get_entry+0x230>
    else//在子目录
        entry=a_clu_of_dir[index%16];
  8084e1:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8084e4:	99                   	cdq    
  8084e5:	c1 ea 1c             	shr    edx,0x1c
  8084e8:	01 d0                	add    eax,edx
  8084ea:	83 e0 0f             	and    eax,0xf
  8084ed:	29 d0                	sub    eax,edx
  8084ef:	48 98                	cdqe   
  8084f1:	48 c1 e0 05          	shl    rax,0x5
  8084f5:	48 8d 88 60 b1 42 00 	lea    rcx,[rax+0x42b160]
  8084fc:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8084ff:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808503:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  808507:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  80850b:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  80850f:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808513:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  808517:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
    ret.id=entry.fistCluNum;
  80851b:	0f b7 45 aa          	movzx  eax,WORD PTR [rbp-0x56]
  80851f:	0f b7 c0             	movzx  eax,ax
  808522:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    args->entry=ret;
  808528:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80852f:	48 8b 8d 30 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd0]
  808536:	48 8b 9d 38 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xc8]
  80853d:	48 89 48 28          	mov    QWORD PTR [rax+0x28],rcx
  808541:	48 89 58 30          	mov    QWORD PTR [rax+0x30],rbx
  808545:	48 8b 8d 40 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xc0]
  80854c:	48 8b 9d 48 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xb8]
  808553:	48 89 48 38          	mov    QWORD PTR [rax+0x38],rcx
  808557:	48 89 58 40          	mov    QWORD PTR [rax+0x40],rbx
  80855b:	48 8b 8d 50 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb0]
  808562:	48 8b 9d 58 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xa8]
  808569:	48 89 48 48          	mov    QWORD PTR [rax+0x48],rcx
  80856d:	48 89 58 50          	mov    QWORD PTR [rax+0x50],rbx
  808571:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  808578:	48 8b 9d 68 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x98]
  80857f:	48 89 48 58          	mov    QWORD PTR [rax+0x58],rcx
  808583:	48 89 58 60          	mov    QWORD PTR [rax+0x60],rbx
  808587:	48 8b 8d 70 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x90]
  80858e:	48 8b 9d 78 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x88]
  808595:	48 89 48 68          	mov    QWORD PTR [rax+0x68],rcx
  808599:	48 89 58 70          	mov    QWORD PTR [rax+0x70],rbx
  80859d:	48 8b 4d 80          	mov    rcx,QWORD PTR [rbp-0x80]
  8085a1:	48 8b 5d 88          	mov    rbx,QWORD PTR [rbp-0x78]
  8085a5:	48 89 48 78          	mov    QWORD PTR [rax+0x78],rcx
  8085a9:	48 89 98 80 00 00 00 	mov    QWORD PTR [rax+0x80],rbx
    return 0;
  8085b0:	b8 00 00 00 00       	mov    eax,0x0
}
  8085b5:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8085b9:	c9                   	leave  
  8085ba:	c3                   	ret    

00000000008085bb <get_fname>:
        dir=strtok(NULL,'/');
    }
    return 0;
}*/
void get_fname(char *path,char *name)
{
  8085bb:	f3 0f 1e fa          	endbr64 
  8085bf:	55                   	push   rbp
  8085c0:	48 89 e5             	mov    rbp,rsp
  8085c3:	48 83 ec 20          	sub    rsp,0x20
  8085c7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8085cb:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    char *prev,*ptr=strtok(path,'/');
  8085cf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8085d3:	be 2f 00 00 00       	mov    esi,0x2f
  8085d8:	48 89 c7             	mov    rdi,rax
  8085db:	e8 18 0e 00 00       	call   8093f8 <strtok>
  8085e0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  8085e4:	eb 1b                	jmp    808601 <get_fname+0x46>
    {
        prev=ptr;
  8085e6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8085ea:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        ptr=strtok(NULL,'/');
  8085ee:	be 2f 00 00 00       	mov    esi,0x2f
  8085f3:	bf 00 00 00 00       	mov    edi,0x0
  8085f8:	e8 fb 0d 00 00       	call   8093f8 <strtok>
  8085fd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  808601:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  808606:	75 de                	jne    8085e6 <get_fname+0x2b>
    }
    strcpy(name,prev);
  808608:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80860c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808610:	48 89 d6             	mov    rsi,rdx
  808613:	48 89 c7             	mov    rdi,rax
  808616:	e8 99 0d 00 00       	call   8093b4 <strcpy>
}
  80861b:	90                   	nop
  80861c:	c9                   	leave  
  80861d:	c3                   	ret    

000000000080861e <read_file>:
char buf[1024];
int read_file(driver_args* args)
{
  80861e:	f3 0f 1e fa          	endbr64 
  808622:	55                   	push   rbp
  808623:	48 89 e5             	mov    rbp,rsp
  808626:	48 83 ec 60          	sub    rsp,0x60
  80862a:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    int len=args->len;
  80862e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808632:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808635:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int pos=args->pos;
  808638:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80863c:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  80863f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  808642:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808646:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  808649:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    char* dist=args->dist_addr;
  80864d:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808651:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808654:	48 98                	cdqe   
  808656:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int c=len/superblock.bytesPerSec;
  80865a:	0f b7 05 aa ea c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1eaaa]        # 42710b <superblock+0xb>
  808661:	0f b7 f0             	movzx  esi,ax
  808664:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808667:	99                   	cdq    
  808668:	f7 fe                	idiv   esi
  80866a:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    c+=len%superblock.bytesPerSec?1:0;
  80866d:	0f b7 05 97 ea c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1ea97]        # 42710b <superblock+0xb>
  808674:	0f b7 c8             	movzx  ecx,ax
  808677:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80867a:	99                   	cdq    
  80867b:	f7 f9                	idiv   ecx
  80867d:	89 d0                	mov    eax,edx
  80867f:	85 c0                	test   eax,eax
  808681:	0f 95 c0             	setne  al
  808684:	0f b6 c0             	movzx  eax,al
  808687:	01 45 dc             	add    DWORD PTR [rbp-0x24],eax
    //printf("[fs]%d secs to sys_read.\n",c);
    int n=0;
  80868a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808691:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  808695:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    int mpos=pos/superblock.bytesPerSec;
  808699:	0f b7 05 6b ea c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1ea6b]        # 42710b <superblock+0xb>
  8086a0:	0f b7 f8             	movzx  edi,ax
  8086a3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8086a6:	99                   	cdq    
  8086a7:	f7 ff                	idiv   edi
  8086a9:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  8086ac:	eb 16                	jmp    8086c4 <read_file+0xa6>
    {
         clu=fat[clu];
  8086ae:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  8086b2:	48 98                	cdqe   
  8086b4:	0f b7 84 00 60 b3 42 	movzx  eax,WORD PTR [rax+rax*1+0x42b360]
  8086bb:	00 
  8086bc:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  8086c0:	83 6d e4 01          	sub    DWORD PTR [rbp-0x1c],0x1
  8086c4:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  8086c9:	77 06                	ja     8086d1 <read_file+0xb3>
  8086cb:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  8086cf:	7f dd                	jg     8086ae <read_file+0x90>
    }
    if(mpos>0)return -1;//读取位置超出范围
  8086d1:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  8086d5:	7e 0a                	jle    8086e1 <read_file+0xc3>
  8086d7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8086dc:	e9 cd 00 00 00       	jmp    8087ae <read_file+0x190>
    pos%=superblock.bytesPerSec;
  8086e1:	0f b7 05 23 ea c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1ea23]        # 42710b <superblock+0xb>
  8086e8:	0f b7 c8             	movzx  ecx,ax
  8086eb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8086ee:	99                   	cdq    
  8086ef:	f7 f9                	idiv   ecx
  8086f1:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
    int block_size=superblock.secPerClu*superblock.bytesPerSec;
  8086f4:	0f b6 05 12 ea c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1ea12]        # 42710d <superblock+0xd>
  8086fb:	0f b6 d0             	movzx  edx,al
  8086fe:	0f b7 05 06 ea c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1ea06]        # 42710b <superblock+0xb>
  808705:	0f b7 c0             	movzx  eax,ax
  808708:	0f af c2             	imul   eax,edx
  80870b:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    while(n<c)
  80870e:	e9 89 00 00 00       	jmp    80879c <read_file+0x17e>
    {
        read_sec(buf,clu+clu_sec_balance,superblock.secPerClu);
  808713:	0f b6 05 f3 e9 c1 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc1e9f3]        # 42710d <superblock+0xd>
  80871a:	0f b6 c0             	movzx  eax,al
  80871d:	0f b7 4d ea          	movzx  ecx,WORD PTR [rbp-0x16]
  808721:	8b 15 19 17 00 00    	mov    edx,DWORD PTR [rip+0x1719]        # 809e40 <clu_sec_balance>
  808727:	01 d1                	add    ecx,edx
  808729:	89 c2                	mov    edx,eax
  80872b:	89 ce                	mov    esi,ecx
  80872d:	bf 80 f3 42 00       	mov    edi,0x42f380
  808732:	e8 98 f0 ff ff       	call   8077cf <read_sec>
        //printf("%x+%x\n",buf,pos);
        int cplen=block_size-pos>len?len:block_size-pos;
  808737:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  80873a:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  80873d:	8b 55 e0             	mov    edx,DWORD PTR [rbp-0x20]
  808740:	39 c2                	cmp    edx,eax
  808742:	0f 4e c2             	cmovle eax,edx
  808745:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
        memcpy(dist,buf+pos,cplen);
  808748:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80874b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80874e:	48 98                	cdqe   
  808750:	48 8d 88 80 f3 42 00 	lea    rcx,[rax+0x42f380]
  808757:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80875b:	48 89 ce             	mov    rsi,rcx
  80875e:	48 89 c7             	mov    rdi,rax
  808761:	e8 50 0b 00 00       	call   8092b6 <memcpy>
        n++;
  808766:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        dist+=block_size-pos;
  80876a:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  80876d:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  808770:	48 98                	cdqe   
  808772:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        if(pos>0)pos=0;
  808776:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80877a:	7e 07                	jle    808783 <read_file+0x165>
  80877c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        clu=fat[clu];
  808783:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808787:	48 98                	cdqe   
  808789:	0f b7 84 00 60 b3 42 	movzx  eax,WORD PTR [rax+rax*1+0x42b360]
  808790:	00 
  808791:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  808795:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  80879a:	77 0e                	ja     8087aa <read_file+0x18c>
    while(n<c)
  80879c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80879f:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  8087a2:	0f 8c 6b ff ff ff    	jl     808713 <read_file+0xf5>
  8087a8:	eb 01                	jmp    8087ab <read_file+0x18d>
        if(clu>=FAT_EOF)break;
  8087aa:	90                   	nop
    }
    return n;
  8087ab:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
}
  8087ae:	c9                   	leave  
  8087af:	c3                   	ret    

00000000008087b0 <write_file>:
int write_file(driver_args* args)
{
  8087b0:	f3 0f 1e fa          	endbr64 
  8087b4:	55                   	push   rbp
  8087b5:	48 89 e5             	mov    rbp,rsp
  8087b8:	48 83 ec 50          	sub    rsp,0x50
  8087bc:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    int len=args->len;
  8087c0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8087c4:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8087c7:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    int pos=args->pos;
  8087ca:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8087ce:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8087d1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  8087d4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8087d8:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  8087db:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    char* src=args->src_addr;
  8087df:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8087e3:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8087e6:	48 98                	cdqe   
  8087e8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    pos/=superblock.bytesPerSec;
  8087ec:	0f b7 05 18 e9 c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1e918]        # 42710b <superblock+0xb>
  8087f3:	0f b7 f0             	movzx  esi,ax
  8087f6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8087f9:	99                   	cdq    
  8087fa:	f7 fe                	idiv   esi
  8087fc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=len/512+len%512?1:0;
  8087ff:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808802:	8d 90 ff 01 00 00    	lea    edx,[rax+0x1ff]
  808808:	85 c0                	test   eax,eax
  80880a:	0f 48 c2             	cmovs  eax,edx
  80880d:	c1 f8 09             	sar    eax,0x9
  808810:	89 c1                	mov    ecx,eax
  808812:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808815:	99                   	cdq    
  808816:	c1 ea 17             	shr    edx,0x17
  808819:	01 d0                	add    eax,edx
  80881b:	25 ff 01 00 00       	and    eax,0x1ff
  808820:	29 d0                	sub    eax,edx
  808822:	01 c8                	add    eax,ecx
  808824:	85 c0                	test   eax,eax
  808826:	0f 95 c0             	setne  al
  808829:	0f b6 c0             	movzx  eax,al
  80882c:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int n=0;
  80882f:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808836:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  80883a:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&pos>0;pos--,clu=fat[clu]);
  80883e:	eb 16                	jmp    808856 <write_file+0xa6>
  808840:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  808844:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808848:	48 98                	cdqe   
  80884a:	0f b7 84 00 60 b3 42 	movzx  eax,WORD PTR [rax+rax*1+0x42b360]
  808851:	00 
  808852:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  808856:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  80885b:	77 06                	ja     808863 <write_file+0xb3>
  80885d:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808861:	7f dd                	jg     808840 <write_file+0x90>
    if(pos>0)return -1;//读取位置超出范围
  808863:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808867:	7e 52                	jle    8088bb <write_file+0x10b>
  808869:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80886e:	eb 59                	jmp    8088c9 <write_file+0x119>
    while(n<c)
    {
        write_sec(src,clu+clu_sec_balance,1);
  808870:	0f b7 55 ea          	movzx  edx,WORD PTR [rbp-0x16]
  808874:	8b 05 c6 15 00 00    	mov    eax,DWORD PTR [rip+0x15c6]        # 809e40 <clu_sec_balance>
  80887a:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80887d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808881:	ba 01 00 00 00       	mov    edx,0x1
  808886:	89 ce                	mov    esi,ecx
  808888:	48 89 c7             	mov    rdi,rax
  80888b:	e8 4b e8 ff ff       	call   8070db <write_sec>
        n++;
  808890:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        src+=superblock.bytesPerSec;
  808894:	0f b7 05 70 e8 c1 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc1e870]        # 42710b <superblock+0xb>
  80889b:	0f b7 c0             	movzx  eax,ax
  80889e:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        clu=fat[clu];
  8088a2:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  8088a6:	48 98                	cdqe   
  8088a8:	0f b7 84 00 60 b3 42 	movzx  eax,WORD PTR [rax+rax*1+0x42b360]
  8088af:	00 
  8088b0:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  8088b4:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  8088b9:	77 0a                	ja     8088c5 <write_file+0x115>
    while(n<c)
  8088bb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8088be:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  8088c1:	7c ad                	jl     808870 <write_file+0xc0>
  8088c3:	eb 01                	jmp    8088c6 <write_file+0x116>
        if(clu>=FAT_EOF)break;
  8088c5:	90                   	nop
    }
    return n;
  8088c6:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    
  8088c9:	c9                   	leave  
  8088ca:	c3                   	ret    

00000000008088cb <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  8088cb:	f3 0f 1e fa          	endbr64 
  8088cf:	55                   	push   rbp
  8088d0:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  8088d3:	48 8b 05 b6 6e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc26eb6]        # 42f790 <vpage_base>
  8088da:	48 05 a0 00 00 00    	add    rax,0xa0
  8088e0:	48 89 05 a9 6e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc26ea9],rax        # 42f790 <vpage_base>
    page_boffset+=SCREEN_W*2;
  8088e7:	8b 05 ab 6e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc26eab]        # 42f798 <page_boffset>
  8088ed:	05 a0 00 00 00       	add    eax,0xa0
  8088f2:	89 05 a0 6e c2 ff    	mov    DWORD PTR [rip+0xffffffffffc26ea0],eax        # 42f798 <page_boffset>
    if(vpage_base>=video_end)
  8088f8:	48 8b 15 91 6e c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc26e91]        # 42f790 <vpage_base>
  8088ff:	48 8b 05 82 6e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc26e82]        # 42f788 <video_end>
  808906:	48 39 c2             	cmp    rdx,rax
  808909:	72 0e                	jb     808919 <scrdown+0x4e>
        vpage_base=video_base;
  80890b:	48 8b 05 6e 6e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc26e6e]        # 42f780 <video_base>
  808912:	48 89 05 77 6e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc26e77],rax        # 42f790 <vpage_base>
    set_origin();
  808919:	b8 00 00 00 00       	mov    eax,0x0
  80891e:	e8 6a 00 00 00       	call   80898d <set_origin>
}
  808923:	90                   	nop
  808924:	5d                   	pop    rbp
  808925:	c3                   	ret    

0000000000808926 <scrup>:
void scrup()
{
  808926:	f3 0f 1e fa          	endbr64 
  80892a:	55                   	push   rbp
  80892b:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  80892e:	8b 05 64 6e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc26e64]        # 42f798 <page_boffset>
  808934:	85 c0                	test   eax,eax
  808936:	75 24                	jne    80895c <scrup+0x36>
    {
        page_boffset=0;
  808938:	c7 05 56 6e c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc26e56],0x0        # 42f798 <page_boffset>
  80893f:	00 00 00 
        vpage_base=video_base;
  808942:	48 8b 05 37 6e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc26e37]        # 42f780 <video_base>
  808949:	48 89 05 40 6e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc26e40],rax        # 42f790 <vpage_base>
        set_origin();
  808950:	b8 00 00 00 00       	mov    eax,0x0
  808955:	e8 33 00 00 00       	call   80898d <set_origin>
        return;
  80895a:	eb 2f                	jmp    80898b <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  80895c:	48 8b 05 2d 6e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc26e2d]        # 42f790 <vpage_base>
  808963:	48 2d a0 00 00 00    	sub    rax,0xa0
  808969:	48 89 05 20 6e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc26e20],rax        # 42f790 <vpage_base>
    page_boffset-=SCREEN_W*2;
  808970:	8b 05 22 6e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc26e22]        # 42f798 <page_boffset>
  808976:	2d a0 00 00 00       	sub    eax,0xa0
  80897b:	89 05 17 6e c2 ff    	mov    DWORD PTR [rip+0xffffffffffc26e17],eax        # 42f798 <page_boffset>
    set_origin();
  808981:	b8 00 00 00 00       	mov    eax,0x0
  808986:	e8 02 00 00 00       	call   80898d <set_origin>
}
  80898b:	5d                   	pop    rbp
  80898c:	c3                   	ret    

000000000080898d <set_origin>:
void set_origin(void)
{
  80898d:	f3 0f 1e fa          	endbr64 
  808991:	55                   	push   rbp
  808992:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  808995:	fa                   	cli    
    outb(port_reg_index,12);
  808996:	8b 05 0c 6e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc26e0c]        # 42f7a8 <port_reg_index>
  80899c:	0f b7 c0             	movzx  eax,ax
  80899f:	be 0c 00 00 00       	mov    esi,0xc
  8089a4:	89 c7                	mov    edi,eax
  8089a6:	e8 e5 bd ff ff       	call   804790 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  8089ab:	8b 05 e7 6d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc26de7]        # 42f798 <page_boffset>
  8089b1:	c1 e8 09             	shr    eax,0x9
  8089b4:	0f b6 d0             	movzx  edx,al
  8089b7:	8b 05 ef 6d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc26def]        # 42f7ac <port_reg_v>
  8089bd:	0f b7 c0             	movzx  eax,ax
  8089c0:	89 d6                	mov    esi,edx
  8089c2:	89 c7                	mov    edi,eax
  8089c4:	e8 c7 bd ff ff       	call   804790 <outb>
    outb(port_reg_index,13);
  8089c9:	8b 05 d9 6d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc26dd9]        # 42f7a8 <port_reg_index>
  8089cf:	0f b7 c0             	movzx  eax,ax
  8089d2:	be 0d 00 00 00       	mov    esi,0xd
  8089d7:	89 c7                	mov    edi,eax
  8089d9:	e8 b2 bd ff ff       	call   804790 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  8089de:	8b 05 b4 6d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc26db4]        # 42f798 <page_boffset>
  8089e4:	d1 e8                	shr    eax,1
  8089e6:	0f b6 d0             	movzx  edx,al
  8089e9:	8b 05 bd 6d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc26dbd]        # 42f7ac <port_reg_v>
  8089ef:	0f b7 c0             	movzx  eax,ax
  8089f2:	89 d6                	mov    esi,edx
  8089f4:	89 c7                	mov    edi,eax
  8089f6:	e8 95 bd ff ff       	call   804790 <outb>
    asm volatile("sti");
  8089fb:	fb                   	sti    

}
  8089fc:	90                   	nop
  8089fd:	5d                   	pop    rbp
  8089fe:	c3                   	ret    

00000000008089ff <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  8089ff:	f3 0f 1e fa          	endbr64 
  808a03:	55                   	push   rbp
  808a04:	48 89 e5             	mov    rbp,rsp
  808a07:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  808a0b:	be c8 1e 81 00       	mov    esi,0x811ec8
  808a10:	bf 74 1d 81 00       	mov    edi,0x811d74
  808a15:	e8 9a 09 00 00       	call   8093b4 <strcpy>
    strcpy(dev_stdout.name,"stdout");
  808a1a:	be cd 1e 81 00       	mov    esi,0x811ecd
  808a1f:	bf 34 1e 81 00       	mov    edi,0x811e34
  808a24:	e8 8b 09 00 00       	call   8093b4 <strcpy>
    reg_driver(&drv_tty);
  808a29:	bf c0 1c 81 00       	mov    edi,0x811cc0
  808a2e:	e8 90 a3 ff ff       	call   802dc3 <reg_driver>
    reg_device(&dev_tty);
  808a33:	bf 60 1d 81 00       	mov    edi,0x811d60
  808a38:	e8 9e a0 ff ff       	call   802adb <reg_device>
    reg_device(&dev_stdout);
  808a3d:	bf 20 1e 81 00       	mov    edi,0x811e20
  808a42:	e8 94 a0 ff ff       	call   802adb <reg_device>
    unsigned char *vp=0x20000;
  808a47:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  808a4e:	00 
    if(*vp==0x7)
  808a4f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808a53:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808a56:	3c 07                	cmp    al,0x7
  808a58:	75 36                	jne    808a90 <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  808a5a:	c7 05 38 6d c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc26d38],0x0        # 42f79c <video_mode>
  808a61:	00 00 00 
        video_base=0xb0000;
  808a64:	48 c7 05 11 6d c2 ff 	mov    QWORD PTR [rip+0xffffffffffc26d11],0xb0000        # 42f780 <video_base>
  808a6b:	00 00 0b 00 
        video_end=0xb8000-1;
  808a6f:	48 c7 05 0e 6d c2 ff 	mov    QWORD PTR [rip+0xffffffffffc26d0e],0xb7fff        # 42f788 <video_end>
  808a76:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  808a7a:	c7 05 24 6d c2 ff b4 	mov    DWORD PTR [rip+0xffffffffffc26d24],0x3b4        # 42f7a8 <port_reg_index>
  808a81:	03 00 00 
        port_reg_v=0x3b5;
  808a84:	c7 05 1e 6d c2 ff b5 	mov    DWORD PTR [rip+0xffffffffffc26d1e],0x3b5        # 42f7ac <port_reg_v>
  808a8b:	03 00 00 
  808a8e:	eb 61                	jmp    808af1 <init_tty+0xf2>
    }else if(*vp<=0x3)
  808a90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808a94:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808a97:	3c 03                	cmp    al,0x3
  808a99:	77 36                	ja     808ad1 <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  808a9b:	c7 05 f7 6c c2 ff 01 	mov    DWORD PTR [rip+0xffffffffffc26cf7],0x1        # 42f79c <video_mode>
  808aa2:	00 00 00 
        video_base=0xb8000;
  808aa5:	48 c7 05 d0 6c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc26cd0],0xb8000        # 42f780 <video_base>
  808aac:	00 80 0b 00 
        video_end=0xc0000-1;
  808ab0:	48 c7 05 cd 6c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc26ccd],0xbffff        # 42f788 <video_end>
  808ab7:	ff ff 0b 00 
        port_reg_index=0x3d4;
  808abb:	c7 05 e3 6c c2 ff d4 	mov    DWORD PTR [rip+0xffffffffffc26ce3],0x3d4        # 42f7a8 <port_reg_index>
  808ac2:	03 00 00 
        port_reg_v=0x3d5;
  808ac5:	c7 05 dd 6c c2 ff d5 	mov    DWORD PTR [rip+0xffffffffffc26cdd],0x3d5        # 42f7ac <port_reg_v>
  808acc:	03 00 00 
  808acf:	eb 20                	jmp    808af1 <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  808ad1:	c7 05 c1 6c c2 ff 02 	mov    DWORD PTR [rip+0xffffffffffc26cc1],0x2        # 42f79c <video_mode>
  808ad8:	00 00 00 
        video_base=0xa0000;
  808adb:	48 c7 05 9a 6c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc26c9a],0xa0000        # 42f780 <video_base>
  808ae2:	00 00 0a 00 
        video_end=0xb0000-1;
  808ae6:	48 c7 05 97 6c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc26c97],0xaffff        # 42f788 <video_end>
  808aed:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  808af1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808af5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808af8:	3c 01                	cmp    al,0x1
  808afa:	77 0f                	ja     808b0b <init_tty+0x10c>
  808afc:	c7 05 9e 6c c2 ff 28 	mov    DWORD PTR [rip+0xffffffffffc26c9e],0x28        # 42f7a4 <line_chs>
  808b03:	00 00 00 
  808b06:	e9 91 00 00 00       	jmp    808b9c <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  808b0b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b0f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b12:	3c 03                	cmp    al,0x3
  808b14:	76 0b                	jbe    808b21 <init_tty+0x122>
  808b16:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b1a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b1d:	3c 07                	cmp    al,0x7
  808b1f:	75 0c                	jne    808b2d <init_tty+0x12e>
  808b21:	c7 05 79 6c c2 ff 50 	mov    DWORD PTR [rip+0xffffffffffc26c79],0x50        # 42f7a4 <line_chs>
  808b28:	00 00 00 
  808b2b:	eb 6f                	jmp    808b9c <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  808b2d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b31:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b34:	3c 05                	cmp    al,0x5
  808b36:	76 16                	jbe    808b4e <init_tty+0x14f>
  808b38:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b3c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b3f:	3c 09                	cmp    al,0x9
  808b41:	74 0b                	je     808b4e <init_tty+0x14f>
  808b43:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b47:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b4a:	3c 0d                	cmp    al,0xd
  808b4c:	75 0c                	jne    808b5a <init_tty+0x15b>
  808b4e:	c7 05 4c 6c c2 ff 40 	mov    DWORD PTR [rip+0xffffffffffc26c4c],0x140        # 42f7a4 <line_chs>
  808b55:	01 00 00 
  808b58:	eb 42                	jmp    808b9c <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  808b5a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b5e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b61:	3c 06                	cmp    al,0x6
  808b63:	74 16                	je     808b7b <init_tty+0x17c>
  808b65:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b69:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b6c:	3c 0a                	cmp    al,0xa
  808b6e:	74 0b                	je     808b7b <init_tty+0x17c>
  808b70:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b74:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b77:	3c 0d                	cmp    al,0xd
  808b79:	76 0c                	jbe    808b87 <init_tty+0x188>
  808b7b:	c7 05 1f 6c c2 ff 80 	mov    DWORD PTR [rip+0xffffffffffc26c1f],0x280        # 42f7a4 <line_chs>
  808b82:	02 00 00 
  808b85:	eb 15                	jmp    808b9c <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  808b87:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808b8b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b8e:	3c 08                	cmp    al,0x8
  808b90:	75 0a                	jne    808b9c <init_tty+0x19d>
  808b92:	c7 05 08 6c c2 ff a0 	mov    DWORD PTR [rip+0xffffffffffc26c08],0xa0        # 42f7a4 <line_chs>
  808b99:	00 00 00 
    switch (*vp)
  808b9c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808ba0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808ba3:	0f b6 c0             	movzx  eax,al
  808ba6:	83 f8 14             	cmp    eax,0x14
  808ba9:	77 61                	ja     808c0c <init_tty+0x20d>
  808bab:	89 c0                	mov    eax,eax
  808bad:	48 8b 04 c5 d8 1e 81 	mov    rax,QWORD PTR [rax*8+0x811ed8]
  808bb4:	00 
  808bb5:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  808bb8:	c7 05 ee 6b c2 ff e8 	mov    DWORD PTR [rip+0xffffffffffc26bee],0x3e8        # 42f7b0 <vpage_size>
  808bbf:	03 00 00 
  808bc2:	eb 49                	jmp    808c0d <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  808bc4:	c7 05 e2 6b c2 ff d0 	mov    DWORD PTR [rip+0xffffffffffc26be2],0x7d0        # 42f7b0 <vpage_size>
  808bcb:	07 00 00 
  808bce:	eb 3d                	jmp    808c0d <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  808bd0:	c7 05 d6 6b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc26bd6],0xfa00        # 42f7b0 <vpage_size>
  808bd7:	fa 00 00 
  808bda:	eb 31                	jmp    808c0d <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  808bdc:	c7 05 ca 6b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc26bca],0x1f400        # 42f7b0 <vpage_size>
  808be3:	f4 01 00 
  808be6:	eb 25                	jmp    808c0d <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  808be8:	c7 05 be 6b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc26bbe],0x7d00        # 42f7b0 <vpage_size>
  808bef:	7d 00 00 
  808bf2:	eb 19                	jmp    808c0d <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  808bf4:	c7 05 b2 6b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc26bb2],0x36b00        # 42f7b0 <vpage_size>
  808bfb:	6b 03 00 
  808bfe:	eb 0d                	jmp    808c0d <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  808c00:	c7 05 a6 6b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc26ba6],0x4b000        # 42f7b0 <vpage_size>
  808c07:	b0 04 00 
  808c0a:	eb 01                	jmp    808c0d <init_tty+0x20e>
    default:
        break;
  808c0c:	90                   	nop
    }
    m_ptr=video_base;
  808c0d:	48 8b 05 6c 6b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc26b6c]        # 42f780 <video_base>
  808c14:	48 89 05 2d 12 00 00 	mov    QWORD PTR [rip+0x122d],rax        # 809e48 <m_ptr>
    page_boffset=0;
  808c1b:	c7 05 73 6b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc26b73],0x0        # 42f798 <page_boffset>
  808c22:	00 00 00 
    vpage_base=video_base;
  808c25:	48 8b 05 54 6b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc26b54]        # 42f780 <video_base>
  808c2c:	48 89 05 5d 6b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc26b5d],rax        # 42f790 <vpage_base>
    vp++;
  808c33:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  808c38:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c3c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c3f:	0f b6 c0             	movzx  eax,al
  808c42:	89 05 58 6b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc26b58],eax        # 42f7a0 <vpage>
    vp++;
  808c48:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  808c4d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c51:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808c55:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808c59:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c5c:	0f b6 c0             	movzx  eax,al
  808c5f:	89 05 57 6b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc26b57],eax        # 42f7bc <stline>
    endline=*vp++;
  808c65:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c69:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808c6d:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808c71:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c74:	0f b6 c0             	movzx  eax,al
  808c77:	89 05 43 6b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc26b43],eax        # 42f7c0 <endline>
    videoy=*vp++;
  808c7d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c81:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808c85:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  808c89:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c8c:	0f b6 c0             	movzx  eax,al
  808c8f:	89 05 23 6b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc26b23],eax        # 42f7b8 <videoy>
    videox=*vp;
  808c95:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808c99:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c9c:	0f b6 c0             	movzx  eax,al
  808c9f:	89 05 0f 6b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc26b0f],eax        # 42f7b4 <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  808ca5:	90                   	nop
  808ca6:	c9                   	leave  
  808ca7:	c3                   	ret    

0000000000808ca8 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  808ca8:	f3 0f 1e fa          	endbr64 
  808cac:	55                   	push   rbp
  808cad:	48 89 e5             	mov    rbp,rsp
  808cb0:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  808cb4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808cb8:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808cbb:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  808cbe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808cc1:	05 00 c0 05 00       	add    eax,0x5c000
  808cc6:	01 c0                	add    eax,eax
  808cc8:	48 98                	cdqe   
  808cca:	48 89 05 77 11 00 00 	mov    QWORD PTR [rip+0x1177],rax        # 809e48 <m_ptr>
}
  808cd1:	90                   	nop
  808cd2:	5d                   	pop    rbp
  808cd3:	c3                   	ret    

0000000000808cd4 <tell_monitor>:
int tell_monitor()
{
  808cd4:	f3 0f 1e fa          	endbr64 
  808cd8:	55                   	push   rbp
  808cd9:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  808cdc:	48 8b 05 65 11 00 00 	mov    rax,QWORD PTR [rip+0x1165]        # 809e48 <m_ptr>
  808ce3:	48 8b 15 96 6a c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc26a96]        # 42f780 <video_base>
  808cea:	48 29 d0             	sub    rax,rdx
  808ced:	48 89 c2             	mov    rdx,rax
  808cf0:	48 c1 ea 3f          	shr    rdx,0x3f
  808cf4:	48 01 d0             	add    rax,rdx
  808cf7:	48 d1 f8             	sar    rax,1
}
  808cfa:	5d                   	pop    rbp
  808cfb:	c3                   	ret    

0000000000808cfc <del_ch>:
void del_ch()
{
  808cfc:	f3 0f 1e fa          	endbr64 
  808d00:	55                   	push   rbp
  808d01:	48 89 e5             	mov    rbp,rsp
  808d04:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  808d0b:	48 8b 05 36 11 00 00 	mov    rax,QWORD PTR [rip+0x1136]        # 809e48 <m_ptr>
  808d12:	48 83 e8 02          	sub    rax,0x2
  808d16:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  808d1a:	b8 00 00 00 00       	mov    eax,0x0
  808d1f:	e8 b0 ff ff ff       	call   808cd4 <tell_monitor>
  808d24:	89 c2                	mov    edx,eax
  808d26:	48 63 c2             	movsxd rax,edx
  808d29:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  808d30:	48 c1 e8 20          	shr    rax,0x20
  808d34:	c1 f8 05             	sar    eax,0x5
  808d37:	89 d1                	mov    ecx,edx
  808d39:	c1 f9 1f             	sar    ecx,0x1f
  808d3c:	29 c8                	sub    eax,ecx
  808d3e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  808d41:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  808d44:	89 c8                	mov    eax,ecx
  808d46:	c1 e0 02             	shl    eax,0x2
  808d49:	01 c8                	add    eax,ecx
  808d4b:	c1 e0 04             	shl    eax,0x4
  808d4e:	29 c2                	sub    edx,eax
  808d50:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  808d53:	eb 17                	jmp    808d6c <del_ch+0x70>
    {
        *p=*(p+2);
  808d55:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d59:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  808d5d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808d61:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  808d63:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  808d68:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808d6c:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  808d70:	7e e3                	jle    808d55 <del_ch+0x59>
    }
    driver_args args= {
  808d72:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  808d79:	b8 00 00 00 00       	mov    eax,0x0
  808d7e:	b9 18 00 00 00       	mov    ecx,0x18
  808d83:	48 89 d7             	mov    rdi,rdx
  808d86:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  808d89:	b8 00 00 00 00       	mov    eax,0x0
  808d8e:	e8 41 ff ff ff       	call   808cd4 <tell_monitor>
  808d93:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  808d96:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  808d9c:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  808da3:	48 89 c7             	mov    rdi,rax
  808da6:	e8 fd fe ff ff       	call   808ca8 <seek_tty>
    set_cur();
  808dab:	b8 00 00 00 00       	mov    eax,0x0
  808db0:	e8 03 00 00 00       	call   808db8 <set_cur>
}
  808db5:	90                   	nop
  808db6:	c9                   	leave  
  808db7:	c3                   	ret    

0000000000808db8 <set_cur>:
void set_cur()
{
  808db8:	f3 0f 1e fa          	endbr64 
  808dbc:	55                   	push   rbp
  808dbd:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  808dc0:	fa                   	cli    
    outb(port_reg_index,14);
  808dc1:	8b 05 e1 69 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc269e1]        # 42f7a8 <port_reg_index>
  808dc7:	0f b7 c0             	movzx  eax,ax
  808dca:	be 0e 00 00 00       	mov    esi,0xe
  808dcf:	89 c7                	mov    edi,eax
  808dd1:	e8 ba b9 ff ff       	call   804790 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  808dd6:	48 8b 05 6b 10 00 00 	mov    rax,QWORD PTR [rip+0x106b]        # 809e48 <m_ptr>
  808ddd:	48 8b 15 9c 69 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc2699c]        # 42f780 <video_base>
  808de4:	48 29 d0             	sub    rax,rdx
  808de7:	48 c1 f8 09          	sar    rax,0x9
  808deb:	0f b6 d0             	movzx  edx,al
  808dee:	8b 05 b8 69 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc269b8]        # 42f7ac <port_reg_v>
  808df4:	0f b7 c0             	movzx  eax,ax
  808df7:	89 d6                	mov    esi,edx
  808df9:	89 c7                	mov    edi,eax
  808dfb:	e8 90 b9 ff ff       	call   804790 <outb>
    outb(port_reg_index,15);
  808e00:	8b 05 a2 69 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc269a2]        # 42f7a8 <port_reg_index>
  808e06:	0f b7 c0             	movzx  eax,ax
  808e09:	be 0f 00 00 00       	mov    esi,0xf
  808e0e:	89 c7                	mov    edi,eax
  808e10:	e8 7b b9 ff ff       	call   804790 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  808e15:	48 8b 05 2c 10 00 00 	mov    rax,QWORD PTR [rip+0x102c]        # 809e48 <m_ptr>
  808e1c:	48 8b 15 5d 69 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc2695d]        # 42f780 <video_base>
  808e23:	48 29 d0             	sub    rax,rdx
  808e26:	48 d1 f8             	sar    rax,1
  808e29:	0f b6 d0             	movzx  edx,al
  808e2c:	8b 05 7a 69 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2697a]        # 42f7ac <port_reg_v>
  808e32:	0f b7 c0             	movzx  eax,ax
  808e35:	89 d6                	mov    esi,edx
  808e37:	89 c7                	mov    edi,eax
  808e39:	e8 52 b9 ff ff       	call   804790 <outb>
    asm volatile("sti");
  808e3e:	fb                   	sti    
}
  808e3f:	90                   	nop
  808e40:	5d                   	pop    rbp
  808e41:	c3                   	ret    

0000000000808e42 <read_tty>:

int read_tty(driver_args *args)
{
  808e42:	f3 0f 1e fa          	endbr64 
  808e46:	55                   	push   rbp
  808e47:	48 89 e5             	mov    rbp,rsp
  808e4a:	48 83 ec 20          	sub    rsp,0x20
  808e4e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  808e52:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e56:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808e59:	48 98                	cdqe   
  808e5b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  808e5f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e63:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808e66:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  808e69:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  808e70:	eb 4a                	jmp    808ebc <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  808e72:	48 8b 15 cf 0f 00 00 	mov    rdx,QWORD PTR [rip+0xfcf]        # 809e48 <m_ptr>
  808e79:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808e7d:	48 8d 48 01          	lea    rcx,[rax+0x1]
  808e81:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  808e85:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  808e88:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  808e8a:	48 8b 05 b7 0f 00 00 	mov    rax,QWORD PTR [rip+0xfb7]        # 809e48 <m_ptr>
  808e91:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  808e97:	75 0d                	jne    808ea6 <read_tty+0x64>
  808e99:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  808e9d:	7e 07                	jle    808ea6 <read_tty+0x64>
        {
            return 1;//读到尾了
  808e9f:	b8 01 00 00 00       	mov    eax,0x1
  808ea4:	eb 2d                	jmp    808ed3 <read_tty+0x91>
        }
        m_ptr+=2;
  808ea6:	48 8b 05 9b 0f 00 00 	mov    rax,QWORD PTR [rip+0xf9b]        # 809e48 <m_ptr>
  808ead:	48 83 c0 02          	add    rax,0x2
  808eb1:	48 89 05 90 0f 00 00 	mov    QWORD PTR [rip+0xf90],rax        # 809e48 <m_ptr>
    for(int i=0;i<len;i++)
  808eb8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  808ebc:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808ebf:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  808ec2:	7c ae                	jl     808e72 <read_tty+0x30>
    }
    set_cur();
  808ec4:	b8 00 00 00 00       	mov    eax,0x0
  808ec9:	e8 ea fe ff ff       	call   808db8 <set_cur>
    return 0;
  808ece:	b8 00 00 00 00       	mov    eax,0x0
}
  808ed3:	c9                   	leave  
  808ed4:	c3                   	ret    

0000000000808ed5 <write_tty>:
int write_tty(driver_args *args)
{
  808ed5:	f3 0f 1e fa          	endbr64 
  808ed9:	55                   	push   rbp
  808eda:	48 89 e5             	mov    rbp,rsp
  808edd:	48 83 ec 30          	sub    rsp,0x30
  808ee1:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  808ee5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808ee9:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808eec:	48 98                	cdqe   
  808eee:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  808ef2:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808ef6:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808ef9:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  808efc:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  808f03:	e9 0b 01 00 00       	jmp    809013 <write_tty+0x13e>
    {
        if(*src=='\n')
  808f08:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f0c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f0f:	3c 0a                	cmp    al,0xa
  808f11:	75 50                	jne    808f63 <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  808f13:	48 8b 05 2e 0f 00 00 	mov    rax,QWORD PTR [rip+0xf2e]        # 809e48 <m_ptr>
  808f1a:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  808f20:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  808f23:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808f26:	89 c2                	mov    edx,eax
  808f28:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  808f2d:	48 0f af c2          	imul   rax,rdx
  808f31:	48 c1 e8 20          	shr    rax,0x20
  808f35:	c1 e8 07             	shr    eax,0x7
  808f38:	8d 50 01             	lea    edx,[rax+0x1]
  808f3b:	89 d0                	mov    eax,edx
  808f3d:	c1 e0 02             	shl    eax,0x2
  808f40:	01 d0                	add    eax,edx
  808f42:	c1 e0 05             	shl    eax,0x5
  808f45:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  808f48:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808f4b:	05 00 80 0b 00       	add    eax,0xb8000
  808f50:	89 c0                	mov    eax,eax
  808f52:	48 89 05 ef 0e 00 00 	mov    QWORD PTR [rip+0xeef],rax        # 809e48 <m_ptr>
            src++;
  808f59:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  808f5e:	e9 ac 00 00 00       	jmp    80900f <write_tty+0x13a>
        }else if(*src=='\0')
  808f63:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f67:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f6a:	84 c0                	test   al,al
  808f6c:	0f 84 af 00 00 00    	je     809021 <write_tty+0x14c>
            break;
        if(*src=='\b')
  808f72:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808f76:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f79:	3c 08                	cmp    al,0x8
  808f7b:	75 1e                	jne    808f9b <write_tty+0xc6>
        {
            m_ptr-=2;
  808f7d:	48 8b 05 c4 0e 00 00 	mov    rax,QWORD PTR [rip+0xec4]        # 809e48 <m_ptr>
  808f84:	48 83 e8 02          	sub    rax,0x2
  808f88:	48 89 05 b9 0e 00 00 	mov    QWORD PTR [rip+0xeb9],rax        # 809e48 <m_ptr>
            *m_ptr=0;
  808f8f:	48 8b 05 b2 0e 00 00 	mov    rax,QWORD PTR [rip+0xeb2]        # 809e48 <m_ptr>
  808f96:	c6 00 00             	mov    BYTE PTR [rax],0x0
  808f99:	eb 3e                	jmp    808fd9 <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  808f9b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808f9f:	48 8d 42 01          	lea    rax,[rdx+0x1]
  808fa3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  808fa7:	48 8b 05 9a 0e 00 00 	mov    rax,QWORD PTR [rip+0xe9a]        # 809e48 <m_ptr>
  808fae:	48 8d 48 01          	lea    rcx,[rax+0x1]
  808fb2:	48 89 0d 8f 0e 00 00 	mov    QWORD PTR [rip+0xe8f],rcx        # 809e48 <m_ptr>
  808fb9:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  808fbc:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  808fbe:	48 8b 05 83 0e 00 00 	mov    rax,QWORD PTR [rip+0xe83]        # 809e48 <m_ptr>
  808fc5:	48 8d 50 01          	lea    rdx,[rax+0x1]
  808fc9:	48 89 15 78 0e 00 00 	mov    QWORD PTR [rip+0xe78],rdx        # 809e48 <m_ptr>
  808fd0:	0f b6 15 79 0e 00 00 	movzx  edx,BYTE PTR [rip+0xe79]        # 809e50 <m_color>
  808fd7:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  808fd9:	48 8b 05 68 0e 00 00 	mov    rax,QWORD PTR [rip+0xe68]        # 809e48 <m_ptr>
  808fe0:	48 8b 0d a9 67 c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc267a9]        # 42f790 <vpage_base>
  808fe7:	48 29 c8             	sub    rax,rcx
  808fea:	48 89 c2             	mov    rdx,rax
  808fed:	8b 05 bd 67 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc267bd]        # 42f7b0 <vpage_size>
  808ff3:	8b 0d ab 67 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc267ab]        # 42f7a4 <line_chs>
  808ff9:	29 c8                	sub    eax,ecx
  808ffb:	01 c0                	add    eax,eax
  808ffd:	48 98                	cdqe   
  808fff:	48 39 c2             	cmp    rdx,rax
  809002:	7c 0b                	jl     80900f <write_tty+0x13a>
  809004:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  809008:	7e 05                	jle    80900f <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  80900a:	e8 bc f8 ff ff       	call   8088cb <scrdown>
    for(int i=0;i<len;i++)
  80900f:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  809013:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809016:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  809019:	0f 8c e9 fe ff ff    	jl     808f08 <write_tty+0x33>
  80901f:	eb 01                	jmp    809022 <write_tty+0x14d>
            break;
  809021:	90                   	nop
        }
    }
    set_cur();
  809022:	b8 00 00 00 00       	mov    eax,0x0
  809027:	e8 8c fd ff ff       	call   808db8 <set_cur>
    return 0;
  80902c:	b8 00 00 00 00       	mov    eax,0x0
}
  809031:	c9                   	leave  
  809032:	c3                   	ret    

0000000000809033 <cls>:

void cls(driver_args *args)
{
  809033:	f3 0f 1e fa          	endbr64 
  809037:	55                   	push   rbp
  809038:	48 89 e5             	mov    rbp,rsp
  80903b:	48 83 ec 20          	sub    rsp,0x20
  80903f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  809043:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80904a:	eb 16                	jmp    809062 <cls+0x2f>
    {
        vpage_base[i]=0;
  80904c:	48 8b 15 3d 67 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc2673d]        # 42f790 <vpage_base>
  809053:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809056:	48 98                	cdqe   
  809058:	48 01 d0             	add    rax,rdx
  80905b:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  80905e:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  809062:	8b 05 48 67 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc26748]        # 42f7b0 <vpage_size>
  809068:	01 c0                	add    eax,eax
  80906a:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80906d:	7c dd                	jl     80904c <cls+0x19>
    }
    m_ptr=vpage_base;
  80906f:	48 8b 05 1a 67 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2671a]        # 42f790 <vpage_base>
  809076:	48 89 05 cb 0d 00 00 	mov    QWORD PTR [rip+0xdcb],rax        # 809e48 <m_ptr>
    set_cur();
  80907d:	b8 00 00 00 00       	mov    eax,0x0
  809082:	e8 31 fd ff ff       	call   808db8 <set_cur>
}
  809087:	90                   	nop
  809088:	c9                   	leave  
  809089:	c3                   	ret    

000000000080908a <set_color>:

void set_color(char color)
{
  80908a:	f3 0f 1e fa          	endbr64 
  80908e:	55                   	push   rbp
  80908f:	48 89 e5             	mov    rbp,rsp
  809092:	89 f8                	mov    eax,edi
  809094:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  809097:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80909b:	88 05 af 0d 00 00    	mov    BYTE PTR [rip+0xdaf],al        # 809e50 <m_color>
}
  8090a1:	90                   	nop
  8090a2:	5d                   	pop    rbp
  8090a3:	c3                   	ret    

00000000008090a4 <tty_do_req>:

int tty_do_req(driver_args *args)
{
  8090a4:	f3 0f 1e fa          	endbr64 
  8090a8:	55                   	push   rbp
  8090a9:	48 89 e5             	mov    rbp,rsp
  8090ac:	48 83 ec 10          	sub    rsp,0x10
  8090b0:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  8090b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8090b8:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  8090be:	83 f8 0d             	cmp    eax,0xd
  8090c1:	74 45                	je     809108 <tty_do_req+0x64>
  8090c3:	83 f8 0d             	cmp    eax,0xd
  8090c6:	7f 53                	jg     80911b <tty_do_req+0x77>
  8090c8:	83 f8 0c             	cmp    eax,0xc
  8090cb:	74 2d                	je     8090fa <tty_do_req+0x56>
  8090cd:	83 f8 0c             	cmp    eax,0xc
  8090d0:	7f 49                	jg     80911b <tty_do_req+0x77>
  8090d2:	83 f8 02             	cmp    eax,0x2
  8090d5:	74 07                	je     8090de <tty_do_req+0x3a>
  8090d7:	83 f8 03             	cmp    eax,0x3
  8090da:	74 10                	je     8090ec <tty_do_req+0x48>
  8090dc:	eb 3d                	jmp    80911b <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  8090de:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8090e2:	48 89 c7             	mov    rdi,rax
  8090e5:	e8 58 fd ff ff       	call   808e42 <read_tty>
        break;
  8090ea:	eb 36                	jmp    809122 <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  8090ec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8090f0:	48 89 c7             	mov    rdi,rax
  8090f3:	e8 dd fd ff ff       	call   808ed5 <write_tty>
        break;
  8090f8:	eb 28                	jmp    809122 <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  8090fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8090fe:	48 89 c7             	mov    rdi,rax
  809101:	e8 a2 fb ff ff       	call   808ca8 <seek_tty>
        break;
  809106:	eb 1a                	jmp    809122 <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  809108:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80910c:	48 89 c7             	mov    rdi,rax
  80910f:	b8 00 00 00 00       	mov    eax,0x0
  809114:	e8 bb fb ff ff       	call   808cd4 <tell_monitor>
        break;
  809119:	eb 07                	jmp    809122 <tty_do_req+0x7e>
    default:return -1;
  80911b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809120:	eb 05                	jmp    809127 <tty_do_req+0x83>
    }
    return 0;
  809122:	b8 00 00 00 00       	mov    eax,0x0
}
  809127:	c9                   	leave  
  809128:	c3                   	ret    

0000000000809129 <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  809129:	f3 0f 1e fa          	endbr64 
  80912d:	55                   	push   rbp
  80912e:	48 89 e5             	mov    rbp,rsp
  809131:	48 83 ec 10          	sub    rsp,0x10
  809135:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  809138:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80913b:	83 c0 01             	add    eax,0x1
  80913e:	0f b7 c0             	movzx  eax,ax
  809141:	be 00 00 00 00       	mov    esi,0x0
  809146:	89 c7                	mov    edi,eax
  809148:	e8 43 b6 ff ff       	call   804790 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80914d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809150:	83 c0 03             	add    eax,0x3
  809153:	0f b7 c0             	movzx  eax,ax
  809156:	be 80 00 00 00       	mov    esi,0x80
  80915b:	89 c7                	mov    edi,eax
  80915d:	e8 2e b6 ff ff       	call   804790 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  809162:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809165:	0f b7 c0             	movzx  eax,ax
  809168:	be 03 00 00 00       	mov    esi,0x3
  80916d:	89 c7                	mov    edi,eax
  80916f:	e8 1c b6 ff ff       	call   804790 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  809174:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809177:	83 c0 01             	add    eax,0x1
  80917a:	0f b7 c0             	movzx  eax,ax
  80917d:	be 00 00 00 00       	mov    esi,0x0
  809182:	89 c7                	mov    edi,eax
  809184:	e8 07 b6 ff ff       	call   804790 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  809189:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80918c:	83 c0 03             	add    eax,0x3
  80918f:	0f b7 c0             	movzx  eax,ax
  809192:	be 03 00 00 00       	mov    esi,0x3
  809197:	89 c7                	mov    edi,eax
  809199:	e8 f2 b5 ff ff       	call   804790 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  80919e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8091a1:	83 c0 02             	add    eax,0x2
  8091a4:	0f b7 c0             	movzx  eax,ax
  8091a7:	be c7 00 00 00       	mov    esi,0xc7
  8091ac:	89 c7                	mov    edi,eax
  8091ae:	e8 dd b5 ff ff       	call   804790 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  8091b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8091b6:	83 c0 04             	add    eax,0x4
  8091b9:	0f b7 c0             	movzx  eax,ax
  8091bc:	be 0b 00 00 00       	mov    esi,0xb
  8091c1:	89 c7                	mov    edi,eax
  8091c3:	e8 c8 b5 ff ff       	call   804790 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  8091c8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8091cb:	83 c0 04             	add    eax,0x4
  8091ce:	0f b7 c0             	movzx  eax,ax
  8091d1:	be 1e 00 00 00       	mov    esi,0x1e
  8091d6:	89 c7                	mov    edi,eax
  8091d8:	e8 b3 b5 ff ff       	call   804790 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  8091dd:	b8 61 00 00 00       	mov    eax,0x61
  8091e2:	0f b6 d0             	movzx  edx,al
  8091e5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8091e8:	0f b7 c0             	movzx  eax,ax
  8091eb:	89 d6                	mov    esi,edx
  8091ed:	89 c7                	mov    edi,eax
  8091ef:	e8 9c b5 ff ff       	call   804790 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  8091f4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8091f7:	0f b6 c0             	movzx  eax,al
  8091fa:	89 c7                	mov    edi,eax
  8091fc:	e8 a8 b5 ff ff       	call   8047a9 <inb>
  809201:	0f b6 d0             	movzx  edx,al
  809204:	b8 61 00 00 00       	mov    eax,0x61
  809209:	0f be c0             	movsx  eax,al
  80920c:	39 c2                	cmp    edx,eax
  80920e:	75 17                	jne    809227 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  809210:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809213:	83 c0 04             	add    eax,0x4
  809216:	0f b7 c0             	movzx  eax,ax
  809219:	be 0f 00 00 00       	mov    esi,0xf
  80921e:	89 c7                	mov    edi,eax
  809220:	e8 6b b5 ff ff       	call   804790 <outb>
  809225:	eb 01                	jmp    809228 <init_com+0xff>
        return;
  809227:	90                   	nop
}
  809228:	c9                   	leave  
  809229:	c3                   	ret    

000000000080922a <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80922a:	f3 0f 1e fa          	endbr64 
  80922e:	55                   	push   rbp
  80922f:	48 89 e5             	mov    rbp,rsp
  809232:	48 83 ec 20          	sub    rsp,0x20
  809236:	89 f8                	mov    eax,edi
  809238:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80923b:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80923f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809242:	83 c0 05             	add    eax,0x5
  809245:	0f b6 c0             	movzx  eax,al
  809248:	89 c7                	mov    edi,eax
  80924a:	e8 5a b5 ff ff       	call   8047a9 <inb>
  80924f:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  809252:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  809256:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80925a:	74 e3                	je     80923f <com_putchar+0x15>
    outb(com_base, ch);
  80925c:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  809260:	0f b6 d0             	movzx  edx,al
  809263:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  809266:	0f b7 c0             	movzx  eax,ax
  809269:	89 d6                	mov    esi,edx
  80926b:	89 c7                	mov    edi,eax
  80926d:	e8 1e b5 ff ff       	call   804790 <outb>
}
  809272:	90                   	nop
  809273:	c9                   	leave  
  809274:	c3                   	ret    

0000000000809275 <com_puts>:

void com_puts(char* s,int com_port){
  809275:	f3 0f 1e fa          	endbr64 
  809279:	55                   	push   rbp
  80927a:	48 89 e5             	mov    rbp,rsp
  80927d:	48 83 ec 10          	sub    rsp,0x10
  809281:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809285:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  809288:	eb 1d                	jmp    8092a7 <com_puts+0x32>
        com_putchar(*s,com_port);
  80928a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80928e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809291:	66 98                	cbw    
  809293:	0f b7 c0             	movzx  eax,ax
  809296:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  809299:	89 d6                	mov    esi,edx
  80929b:	89 c7                	mov    edi,eax
  80929d:	e8 88 ff ff ff       	call   80922a <com_putchar>
    for(;*s;s++){
  8092a2:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  8092a7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092ab:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092ae:	84 c0                	test   al,al
  8092b0:	75 d8                	jne    80928a <com_puts+0x15>
    }
  8092b2:	90                   	nop
  8092b3:	90                   	nop
  8092b4:	c9                   	leave  
  8092b5:	c3                   	ret    

00000000008092b6 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  8092b6:	f3 0f 1e fa          	endbr64 
  8092ba:	55                   	push   rbp
  8092bb:	48 89 e5             	mov    rbp,rsp
  8092be:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8092c2:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8092c6:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  8092c9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8092cd:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  8092d0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8092d7:	eb 1b                	jmp    8092f4 <memcpy+0x3e>
        *(dest)=*(src);
  8092d9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8092dd:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8092e0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8092e4:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  8092e6:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  8092eb:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  8092f0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8092f4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8092f7:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  8092fa:	77 dd                	ja     8092d9 <memcpy+0x23>
    }
}
  8092fc:	90                   	nop
  8092fd:	90                   	nop
  8092fe:	5d                   	pop    rbp
  8092ff:	c3                   	ret    

0000000000809300 <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  809300:	f3 0f 1e fa          	endbr64 
  809304:	55                   	push   rbp
  809305:	48 89 e5             	mov    rbp,rsp
  809308:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80930c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809310:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  809313:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80931a:	eb 3a                	jmp    809356 <memcmp+0x56>
    {
        if(*a!=*b)
  80931c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809320:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809323:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809327:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80932a:	38 c2                	cmp    dl,al
  80932c:	74 1a                	je     809348 <memcmp+0x48>
            return *a-*b;
  80932e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809332:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809335:	0f b6 d0             	movzx  edx,al
  809338:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80933c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80933f:	0f b6 c8             	movzx  ecx,al
  809342:	89 d0                	mov    eax,edx
  809344:	29 c8                	sub    eax,ecx
  809346:	eb 1b                	jmp    809363 <memcmp+0x63>
        a++;
  809348:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80934d:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  809352:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809356:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809359:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80935c:	7c be                	jl     80931c <memcmp+0x1c>
    }
    return 0;
  80935e:	b8 00 00 00 00       	mov    eax,0x0
}
  809363:	5d                   	pop    rbp
  809364:	c3                   	ret    

0000000000809365 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  809365:	f3 0f 1e fa          	endbr64 
  809369:	55                   	push   rbp
  80936a:	48 89 e5             	mov    rbp,rsp
  80936d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809371:	89 f0                	mov    eax,esi
  809373:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  809376:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  809379:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809380:	eb 16                	jmp    809398 <memset+0x33>
        *(buf++)=value;
  809382:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809386:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80938a:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80938e:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  809392:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  809394:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809398:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80939b:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80939e:	72 e2                	jb     809382 <memset+0x1d>
    }
}
  8093a0:	90                   	nop
  8093a1:	90                   	nop
  8093a2:	5d                   	pop    rbp
  8093a3:	c3                   	ret    

00000000008093a4 <get_mem_size>:

u32 get_mem_size(){
  8093a4:	f3 0f 1e fa          	endbr64 
  8093a8:	55                   	push   rbp
  8093a9:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  8093ac:	8b 05 12 64 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc26412]        # 42f7c4 <mem_end>
}
  8093b2:	5d                   	pop    rbp
  8093b3:	c3                   	ret    

00000000008093b4 <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  8093b4:	f3 0f 1e fa          	endbr64 
  8093b8:	55                   	push   rbp
  8093b9:	48 89 e5             	mov    rbp,rsp
  8093bc:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8093c0:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  8093c4:	eb 1d                	jmp    8093e3 <strcpy+0x2f>
        *(dest++)=*(buf++);
  8093c6:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  8093ca:	48 8d 42 01          	lea    rax,[rdx+0x1]
  8093ce:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8093d2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8093d6:	48 8d 48 01          	lea    rcx,[rax+0x1]
  8093da:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  8093de:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  8093e1:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  8093e3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8093e7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8093ea:	84 c0                	test   al,al
  8093ec:	75 d8                	jne    8093c6 <strcpy+0x12>
    }
    *dest='\0';
  8093ee:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8093f2:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  8093f5:	90                   	nop
  8093f6:	5d                   	pop    rbp
  8093f7:	c3                   	ret    

00000000008093f8 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  8093f8:	f3 0f 1e fa          	endbr64 
  8093fc:	55                   	push   rbp
  8093fd:	48 89 e5             	mov    rbp,rsp
  809400:	48 83 ec 30          	sub    rsp,0x30
  809404:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  809408:	89 f0                	mov    eax,esi
  80940a:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80940d:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  809412:	0f 84 9c 00 00 00    	je     8094b4 <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  809418:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80941c:	48 89 c6             	mov    rsi,rax
  80941f:	bf e0 f7 42 00       	mov    edi,0x42f7e0
  809424:	e8 8b ff ff ff       	call   8093b4 <strcpy>
        char* ptr=strtokkee;
  809429:	48 c7 45 e8 e0 f7 42 	mov    QWORD PTR [rbp-0x18],0x42f7e0
  809430:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  809431:	c7 05 a5 65 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc265a5],0x0        # 42f9e0 <tokptr>
  809438:	00 00 00 
  80943b:	eb 1c                	jmp    809459 <strtok+0x61>
  80943d:	8b 05 9d 65 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2659d]        # 42f9e0 <tokptr>
  809443:	83 c0 01             	add    eax,0x1
  809446:	99                   	cdq    
  809447:	c1 ea 17             	shr    edx,0x17
  80944a:	01 d0                	add    eax,edx
  80944c:	25 ff 01 00 00       	and    eax,0x1ff
  809451:	29 d0                	sub    eax,edx
  809453:	89 05 87 65 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc26587],eax        # 42f9e0 <tokptr>
  809459:	8b 05 81 65 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc26581]        # 42f9e0 <tokptr>
  80945f:	48 98                	cdqe   
  809461:	0f b6 80 e0 f7 42 00 	movzx  eax,BYTE PTR [rax+0x42f7e0]
  809468:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80946b:	74 13                	je     809480 <strtok+0x88>
  80946d:	8b 05 6d 65 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2656d]        # 42f9e0 <tokptr>
  809473:	48 98                	cdqe   
  809475:	0f b6 80 e0 f7 42 00 	movzx  eax,BYTE PTR [rax+0x42f7e0]
  80947c:	84 c0                	test   al,al
  80947e:	75 bd                	jne    80943d <strtok+0x45>
        strtokkee[tokptr]='\0';
  809480:	8b 05 5a 65 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2655a]        # 42f9e0 <tokptr>
  809486:	48 98                	cdqe   
  809488:	c6 80 e0 f7 42 00 00 	mov    BYTE PTR [rax+0x42f7e0],0x0
        tokptr=(tokptr+1)%512;
  80948f:	8b 05 4b 65 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2654b]        # 42f9e0 <tokptr>
  809495:	83 c0 01             	add    eax,0x1
  809498:	99                   	cdq    
  809499:	c1 ea 17             	shr    edx,0x17
  80949c:	01 d0                	add    eax,edx
  80949e:	25 ff 01 00 00       	and    eax,0x1ff
  8094a3:	29 d0                	sub    eax,edx
  8094a5:	89 05 35 65 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc26535],eax        # 42f9e0 <tokptr>
        return ptr;
  8094ab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8094af:	e9 9e 00 00 00       	jmp    809552 <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  8094b4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  8094bb:	8b 05 1f 65 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2651f]        # 42f9e0 <tokptr>
  8094c1:	48 98                	cdqe   
  8094c3:	48 05 e0 f7 42 00    	add    rax,0x42f7e0
  8094c9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  8094cd:	eb 20                	jmp    8094ef <strtok+0xf7>
  8094cf:	8b 05 0b 65 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2650b]        # 42f9e0 <tokptr>
  8094d5:	83 c0 01             	add    eax,0x1
  8094d8:	99                   	cdq    
  8094d9:	c1 ea 17             	shr    edx,0x17
  8094dc:	01 d0                	add    eax,edx
  8094de:	25 ff 01 00 00       	and    eax,0x1ff
  8094e3:	29 d0                	sub    eax,edx
  8094e5:	89 05 f5 64 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc264f5],eax        # 42f9e0 <tokptr>
  8094eb:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8094ef:	8b 05 eb 64 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc264eb]        # 42f9e0 <tokptr>
  8094f5:	48 98                	cdqe   
  8094f7:	0f b6 80 e0 f7 42 00 	movzx  eax,BYTE PTR [rax+0x42f7e0]
  8094fe:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  809501:	74 13                	je     809516 <strtok+0x11e>
  809503:	8b 05 d7 64 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc264d7]        # 42f9e0 <tokptr>
  809509:	48 98                	cdqe   
  80950b:	0f b6 80 e0 f7 42 00 	movzx  eax,BYTE PTR [rax+0x42f7e0]
  809512:	84 c0                	test   al,al
  809514:	75 b9                	jne    8094cf <strtok+0xd7>
    strtokkee[tokptr]='\0';
  809516:	8b 05 c4 64 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc264c4]        # 42f9e0 <tokptr>
  80951c:	48 98                	cdqe   
  80951e:	c6 80 e0 f7 42 00 00 	mov    BYTE PTR [rax+0x42f7e0],0x0
    tokptr=(tokptr+1)%512;
  809525:	8b 05 b5 64 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc264b5]        # 42f9e0 <tokptr>
  80952b:	83 c0 01             	add    eax,0x1
  80952e:	99                   	cdq    
  80952f:	c1 ea 17             	shr    edx,0x17
  809532:	01 d0                	add    eax,edx
  809534:	25 ff 01 00 00       	and    eax,0x1ff
  809539:	29 d0                	sub    eax,edx
  80953b:	89 05 9f 64 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2649f],eax        # 42f9e0 <tokptr>
    if(c)
  809541:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809545:	74 06                	je     80954d <strtok+0x155>
        return ptr;
  809547:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80954b:	eb 05                	jmp    809552 <strtok+0x15a>
    else
        return (void*)0;
  80954d:	b8 00 00 00 00       	mov    eax,0x0
}
  809552:	c9                   	leave  
  809553:	c3                   	ret    

0000000000809554 <strcmp>:
int strcmp(char *s1,char *s2)
{
  809554:	f3 0f 1e fa          	endbr64 
  809558:	55                   	push   rbp
  809559:	48 89 e5             	mov    rbp,rsp
  80955c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809560:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  809564:	eb 3c                	jmp    8095a2 <strcmp+0x4e>
		if(*s1>*s2)
  809566:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80956a:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80956d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809571:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809574:	38 c2                	cmp    dl,al
  809576:	7e 07                	jle    80957f <strcmp+0x2b>
			return 1;
  809578:	b8 01 00 00 00       	mov    eax,0x1
  80957d:	eb 52                	jmp    8095d1 <strcmp+0x7d>
		else if(*s1<*s2)
  80957f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809583:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809586:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80958a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80958d:	38 c2                	cmp    dl,al
  80958f:	7d 07                	jge    809598 <strcmp+0x44>
			return -1;
  809591:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809596:	eb 39                	jmp    8095d1 <strcmp+0x7d>
		s1++;
  809598:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80959d:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  8095a2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8095a6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095a9:	84 c0                	test   al,al
  8095ab:	74 0b                	je     8095b8 <strcmp+0x64>
  8095ad:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8095b1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095b4:	84 c0                	test   al,al
  8095b6:	75 ae                	jne    809566 <strcmp+0x12>
	}
	if(*s1==*s2)
  8095b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8095bc:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8095bf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8095c3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095c6:	38 c2                	cmp    dl,al
  8095c8:	75 07                	jne    8095d1 <strcmp+0x7d>
		return 0;
  8095ca:	b8 00 00 00 00       	mov    eax,0x0
  8095cf:	eb 00                	jmp    8095d1 <strcmp+0x7d>
}
  8095d1:	5d                   	pop    rbp
  8095d2:	c3                   	ret    

00000000008095d3 <strlen>:

int strlen(char *str)
{
  8095d3:	f3 0f 1e fa          	endbr64 
  8095d7:	55                   	push   rbp
  8095d8:	48 89 e5             	mov    rbp,rsp
  8095db:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  8095df:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  8095e6:	eb 09                	jmp    8095f1 <strlen+0x1e>
  8095e8:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  8095ed:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8095f1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095f5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8095f8:	84 c0                	test   al,al
  8095fa:	75 ec                	jne    8095e8 <strlen+0x15>
    return l;
  8095fc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8095ff:	5d                   	pop    rbp
  809600:	c3                   	ret    

0000000000809601 <sprintf>:

void sprintf(char *dist, char *str,...)
{
  809601:	f3 0f 1e fa          	endbr64 
  809605:	55                   	push   rbp
  809606:	48 89 e5             	mov    rbp,rsp
  809609:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  809610:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  809617:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80961e:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  809625:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80962c:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  809633:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80963a:	84 c0                	test   al,al
  80963c:	74 20                	je     80965e <sprintf+0x5d>
  80963e:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  809642:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  809646:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80964a:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80964e:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  809652:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  809656:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80965a:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80965e:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809665:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80966c:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809673:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80967a:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  809681:	00 00 00 
    while (*pstr!='\n')
  809684:	eb 39                	jmp    8096bf <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  809686:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80968d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809690:	3c 25                	cmp    al,0x25
  809692:	75 15                	jne    8096a9 <sprintf+0xa8>
  809694:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80969b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80969e:	3c 25                	cmp    al,0x25
  8096a0:	74 07                	je     8096a9 <sprintf+0xa8>
            argnum++;
  8096a2:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  8096a9:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8096b0:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  8096b7:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  8096be:	01 
    while (*pstr!='\n')
  8096bf:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8096c6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8096c9:	3c 0a                	cmp    al,0xa
  8096cb:	75 b9                	jne    809686 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  8096cd:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  8096d4:	00 00 00 
  8096d7:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  8096de:	00 00 00 
  8096e1:	48 8d 45 10          	lea    rax,[rbp+0x10]
  8096e5:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  8096ec:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  8096f3:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  8096fa:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809701:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  809708:	e9 e2 01 00 00       	jmp    8098ef <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80970d:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809714:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809717:	3c 25                	cmp    al,0x25
  809719:	0f 85 aa 01 00 00    	jne    8098c9 <sprintf+0x2c8>
  80971f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809726:	48 83 c0 01          	add    rax,0x1
  80972a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80972d:	84 c0                	test   al,al
  80972f:	0f 84 94 01 00 00    	je     8098c9 <sprintf+0x2c8>
            pstr++;
  809735:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80973c:	01 
            if(*pstr=='x'){
  80973d:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809744:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809747:	3c 78                	cmp    al,0x78
  809749:	75 64                	jne    8097af <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80974b:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809751:	83 f8 2f             	cmp    eax,0x2f
  809754:	77 23                	ja     809779 <sprintf+0x178>
  809756:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80975d:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809763:	89 d2                	mov    edx,edx
  809765:	48 01 d0             	add    rax,rdx
  809768:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80976e:	83 c2 08             	add    edx,0x8
  809771:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809777:	eb 12                	jmp    80978b <sprintf+0x18a>
  809779:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809780:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809784:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80978b:	8b 00                	mov    eax,DWORD PTR [rax]
  80978d:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  809793:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  809799:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8097a0:	89 d6                	mov    esi,edx
  8097a2:	48 89 c7             	mov    rdi,rax
  8097a5:	e8 4e 02 00 00       	call   8099f8 <sprint_hex>
            if(*pstr=='x'){
  8097aa:	e9 38 01 00 00       	jmp    8098e7 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  8097af:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8097b6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8097b9:	3c 73                	cmp    al,0x73
  8097bb:	75 68                	jne    809825 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  8097bd:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  8097c3:	83 f8 2f             	cmp    eax,0x2f
  8097c6:	77 23                	ja     8097eb <sprintf+0x1ea>
  8097c8:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8097cf:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  8097d5:	89 d2                	mov    edx,edx
  8097d7:	48 01 d0             	add    rax,rdx
  8097da:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  8097e0:	83 c2 08             	add    edx,0x8
  8097e3:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  8097e9:	eb 12                	jmp    8097fd <sprintf+0x1fc>
  8097eb:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8097f2:	48 8d 50 08          	lea    rdx,[rax+0x8]
  8097f6:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  8097fd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809800:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  809807:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80980e:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809815:	48 89 d6             	mov    rsi,rdx
  809818:	48 89 c7             	mov    rdi,rax
  80981b:	e8 5a 02 00 00       	call   809a7a <sprintn>
            if(*pstr=='x'){
  809820:	e9 c2 00 00 00       	jmp    8098e7 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  809825:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80982c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80982f:	3c 64                	cmp    al,0x64
  809831:	75 66                	jne    809899 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  809833:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809839:	83 f8 2f             	cmp    eax,0x2f
  80983c:	77 23                	ja     809861 <sprintf+0x260>
  80983e:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809845:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80984b:	89 d2                	mov    edx,edx
  80984d:	48 01 d0             	add    rax,rdx
  809850:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809856:	83 c2 08             	add    edx,0x8
  809859:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80985f:	eb 12                	jmp    809873 <sprintf+0x272>
  809861:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809868:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80986c:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809873:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809876:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80987d:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  809884:	89 c2                	mov    edx,eax
  809886:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80988d:	89 d6                	mov    esi,edx
  80988f:	48 89 c7             	mov    rdi,rax
  809892:	e8 ad 00 00 00       	call   809944 <sprint_decimal>
            if(*pstr=='x'){
  809897:	eb 4e                	jmp    8098e7 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  809899:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8098a0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8098a3:	3c 63                	cmp    al,0x63
  8098a5:	75 02                	jne    8098a9 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  8098a7:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  8098a9:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8098b0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8098b3:	0f be d0             	movsx  edx,al
  8098b6:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8098bd:	89 d6                	mov    esi,edx
  8098bf:	48 89 c7             	mov    rdi,rax
  8098c2:	e8 3e 00 00 00       	call   809905 <sprintchar>
            if(*pstr=='x'){
  8098c7:	eb 1e                	jmp    8098e7 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  8098c9:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8098d0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8098d3:	0f be d0             	movsx  edx,al
  8098d6:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8098dd:	89 d6                	mov    esi,edx
  8098df:	48 89 c7             	mov    rdi,rax
  8098e2:	e8 1e 00 00 00       	call   809905 <sprintchar>
    for(;*pstr!='\0';pstr++){
  8098e7:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  8098ee:	01 
  8098ef:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  8098f6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8098f9:	84 c0                	test   al,al
  8098fb:	0f 85 0c fe ff ff    	jne    80970d <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  809901:	90                   	nop
  809902:	90                   	nop
  809903:	c9                   	leave  
  809904:	c3                   	ret    

0000000000809905 <sprintchar>:
void sprintchar(char *dist,char c)
{
  809905:	f3 0f 1e fa          	endbr64 
  809909:	55                   	push   rbp
  80990a:	48 89 e5             	mov    rbp,rsp
  80990d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809911:	89 f0                	mov    eax,esi
  809913:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  809916:	eb 05                	jmp    80991d <sprintchar+0x18>
        dist++;
  809918:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80991d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809921:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809924:	84 c0                	test   al,al
  809926:	75 f0                	jne    809918 <sprintchar+0x13>
    *dist++=c;
  809928:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80992c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809930:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809934:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  809938:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80993a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80993e:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  809941:	90                   	nop
  809942:	5d                   	pop    rbp
  809943:	c3                   	ret    

0000000000809944 <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  809944:	f3 0f 1e fa          	endbr64 
  809948:	55                   	push   rbp
  809949:	48 89 e5             	mov    rbp,rsp
  80994c:	48 83 ec 30          	sub    rsp,0x30
  809950:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  809954:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  809957:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80995e:	eb 65                	jmp    8099c5 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  809960:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  809963:	48 63 c2             	movsxd rax,edx
  809966:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80996d:	48 c1 e8 20          	shr    rax,0x20
  809971:	c1 f8 02             	sar    eax,0x2
  809974:	89 d6                	mov    esi,edx
  809976:	c1 fe 1f             	sar    esi,0x1f
  809979:	29 f0                	sub    eax,esi
  80997b:	89 c1                	mov    ecx,eax
  80997d:	89 c8                	mov    eax,ecx
  80997f:	c1 e0 02             	shl    eax,0x2
  809982:	01 c8                	add    eax,ecx
  809984:	01 c0                	add    eax,eax
  809986:	89 d1                	mov    ecx,edx
  809988:	29 c1                	sub    ecx,eax
  80998a:	89 c8                	mov    eax,ecx
  80998c:	83 c0 30             	add    eax,0x30
  80998f:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  809992:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809995:	8d 50 01             	lea    edx,[rax+0x1]
  809998:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80999b:	48 98                	cdqe   
  80999d:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  8099a1:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  8099a5:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8099a8:	48 63 d0             	movsxd rdx,eax
  8099ab:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  8099b2:	48 c1 ea 20          	shr    rdx,0x20
  8099b6:	c1 fa 02             	sar    edx,0x2
  8099b9:	c1 f8 1f             	sar    eax,0x1f
  8099bc:	89 c1                	mov    ecx,eax
  8099be:	89 d0                	mov    eax,edx
  8099c0:	29 c8                	sub    eax,ecx
  8099c2:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  8099c5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8099c8:	83 f8 0f             	cmp    eax,0xf
  8099cb:	76 93                	jbe    809960 <sprint_decimal+0x1c>
    }
    while(p>0)
  8099cd:	eb 1f                	jmp    8099ee <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  8099cf:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  8099d3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8099d6:	48 98                	cdqe   
  8099d8:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  8099dd:	0f be d0             	movsx  edx,al
  8099e0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8099e4:	89 d6                	mov    esi,edx
  8099e6:	48 89 c7             	mov    rdi,rax
  8099e9:	e8 17 ff ff ff       	call   809905 <sprintchar>
    while(p>0)
  8099ee:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8099f2:	7f db                	jg     8099cf <sprint_decimal+0x8b>
    }
}
  8099f4:	90                   	nop
  8099f5:	90                   	nop
  8099f6:	c9                   	leave  
  8099f7:	c3                   	ret    

00000000008099f8 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  8099f8:	f3 0f 1e fa          	endbr64 
  8099fc:	55                   	push   rbp
  8099fd:	48 89 e5             	mov    rbp,rsp
  809a00:	48 83 ec 20          	sub    rsp,0x20
  809a04:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809a08:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  809a0b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  809a12:	eb 35                	jmp    809a49 <sprint_hex+0x51>
        unsigned char a=c%16;
  809a14:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809a17:	83 e0 0f             	and    eax,0xf
  809a1a:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  809a1d:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  809a21:	76 06                	jbe    809a29 <sprint_hex+0x31>
  809a23:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  809a27:	eb 04                	jmp    809a2d <sprint_hex+0x35>
        else a+='0';
  809a29:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  809a2d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809a30:	8d 50 01             	lea    edx,[rax+0x1]
  809a33:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  809a36:	48 98                	cdqe   
  809a38:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  809a3c:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  809a40:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  809a43:	c1 e8 04             	shr    eax,0x4
  809a46:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  809a49:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  809a4d:	7e c5                	jle    809a14 <sprint_hex+0x1c>
    }
    while(p>0)
  809a4f:	eb 1f                	jmp    809a70 <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  809a51:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  809a55:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809a58:	48 98                	cdqe   
  809a5a:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  809a5f:	0f be d0             	movsx  edx,al
  809a62:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809a66:	89 d6                	mov    esi,edx
  809a68:	48 89 c7             	mov    rdi,rax
  809a6b:	e8 95 fe ff ff       	call   809905 <sprintchar>
    while(p>0)
  809a70:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809a74:	7f db                	jg     809a51 <sprint_hex+0x59>
    }
}
  809a76:	90                   	nop
  809a77:	90                   	nop
  809a78:	c9                   	leave  
  809a79:	c3                   	ret    

0000000000809a7a <sprintn>:
void sprintn(char *dist,char *str)
{
  809a7a:	f3 0f 1e fa          	endbr64 
  809a7e:	55                   	push   rbp
  809a7f:	48 89 e5             	mov    rbp,rsp
  809a82:	48 83 ec 10          	sub    rsp,0x10
  809a86:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809a8a:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  809a8e:	eb 20                	jmp    809ab0 <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  809a90:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809a94:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809a98:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  809a9c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a9f:	0f be d0             	movsx  edx,al
  809aa2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809aa6:	89 d6                	mov    esi,edx
  809aa8:	48 89 c7             	mov    rdi,rax
  809aab:	e8 55 fe ff ff       	call   809905 <sprintchar>
    while(*str!='\0')
  809ab0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809ab4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ab7:	84 c0                	test   al,al
  809ab9:	75 d5                	jne    809a90 <sprintn+0x16>
    }
  809abb:	90                   	nop
  809abc:	90                   	nop
  809abd:	c9                   	leave  
  809abe:	c3                   	ret    
  809abf:	90                   	nop

0000000000809ac0 <create_zero>:
  809ac0:	e8 1c a0 ff ff       	call   803ae1 <req_proc>
  809ac5:	83 f8 ff             	cmp    eax,0xffffffff
  809ac8:	74 0c                	je     809ad6 <create_zero.retu>
  809aca:	e8 de a0 ff ff       	call   803bad <set_proc>
  809acf:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  809ad3:	83 c4 40             	add    esp,0x40

0000000000809ad6 <create_zero.retu>:
  809ad6:	c3                   	ret    

0000000000809ad7 <fill_desc>:
  809ad7:	55                   	push   rbp
  809ad8:	48 89 e5             	mov    rbp,rsp
  809adb:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  809adf:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  809ae3:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  809ae7:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  809aeb:	be 2a 9c 80 00       	mov    esi,0x809c2a
  809af0:	c7 04 25 2a 9c 80 00 	mov    DWORD PTR ds:0x809c2a,0x0
  809af7:	00 00 00 00 
  809afb:	c7 04 25 2e 9c 80 00 	mov    DWORD PTR ds:0x809c2e,0x0
  809b02:	00 00 00 00 
  809b06:	66 67 89 0e          	mov    WORD PTR [esi],cx
  809b0a:	c1 e9 10             	shr    ecx,0x10
  809b0d:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  809b12:	c1 ea 10             	shr    edx,0x10
  809b15:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  809b19:	66 c1 ea 08          	shr    dx,0x8
  809b1d:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  809b21:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  809b26:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  809b2a:	c1 e1 08             	shl    ecx,0x8
  809b2d:	09 cf                	or     edi,ecx
  809b2f:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  809b33:	8b 14 25 2a 9c 80 00 	mov    edx,DWORD PTR ds:0x809c2a
  809b3a:	67 89 10             	mov    DWORD PTR [eax],edx
  809b3d:	8b 14 25 2e 9c 80 00 	mov    edx,DWORD PTR ds:0x809c2e
  809b44:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  809b48:	c9                   	leave  
  809b49:	c3                   	ret    

0000000000809b4a <switch_proc_asm>:
  809b4a:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  809b50:	66 89 04 25 68 9b 80 	mov    WORD PTR ds:0x809b68,ax
  809b57:	00 
  809b58:	c7 04 25 64 9b 80 00 	mov    DWORD PTR ds:0x809b64,0x0
  809b5f:	00 00 00 00 

0000000000809b63 <switch_proc_asm.ljmp>:
  809b63:	ea                   	(bad)  
  809b64:	00 00                	add    BYTE PTR [rax],al
  809b66:	00 00                	add    BYTE PTR [rax],al
  809b68:	00 00                	add    BYTE PTR [rax],al
  809b6a:	c3                   	ret    

0000000000809b6b <switch_to_old>:
  809b6b:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  809b70:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  809b74:	bf dc 9b 80 00       	mov    edi,0x809bdc
  809b79:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  809b7d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  809b81:	89 c1                	mov    ecx,eax
  809b83:	83 e9 04             	sub    ecx,0x4
  809b86:	67 89 19             	mov    DWORD PTR [ecx],ebx
  809b89:	50                   	push   rax
  809b8a:	89 f5                	mov    ebp,esi
  809b8c:	83 c5 28             	add    ebp,0x28
  809b8f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809b93:	50                   	push   rax
  809b94:	83 c5 04             	add    ebp,0x4
  809b97:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809b9b:	50                   	push   rax
  809b9c:	83 c5 04             	add    ebp,0x4
  809b9f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809ba3:	50                   	push   rax
  809ba4:	83 c5 04             	add    ebp,0x4
  809ba7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809bab:	50                   	push   rax
  809bac:	83 c5 04             	add    ebp,0x4
  809baf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809bb3:	50                   	push   rax
  809bb4:	83 c5 04             	add    ebp,0x4
  809bb7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809bbb:	50                   	push   rax
  809bbc:	83 c5 04             	add    ebp,0x4
  809bbf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809bc3:	50                   	push   rax
  809bc4:	83 c5 04             	add    ebp,0x4
  809bc7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  809bcb:	50                   	push   rax
  809bcc:	83 c5 04             	add    ebp,0x4
  809bcf:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  809bd3:	0f 22 d8             	mov    cr3,rax
  809bd6:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  809bda:	50                   	push   rax
  809bdb:	5c                   	pop    rsp

0000000000809bdc <switch_to_old.leap>:
  809bdc:	ea                   	(bad)  
  809bdd:	00 00                	add    BYTE PTR [rax],al
  809bdf:	00 00                	add    BYTE PTR [rax],al
  809be1:	08 00                	or     BYTE PTR [rax],al

0000000000809be3 <save_context>:
  809be3:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  809be8:	83 c0 44             	add    eax,0x44
  809beb:	b9 08 00 00 00       	mov    ecx,0x8
  809bf0:	89 e7                	mov    edi,esp

0000000000809bf2 <save_context.loops>:
  809bf2:	67 8b 17             	mov    edx,DWORD PTR [edi]
  809bf5:	67 89 10             	mov    DWORD PTR [eax],edx
  809bf8:	83 c7 04             	add    edi,0x4
  809bfb:	83 e8 04             	sub    eax,0x4
  809bfe:	e2 f2                	loop   809bf2 <save_context.loops>
  809c00:	5b                   	pop    rbx
  809c01:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  809c06:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  809c0a:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  809c0f:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  809c13:	c3                   	ret    

0000000000809c14 <move_to_user_mode>:
  809c14:	66 b8 20 00          	mov    ax,0x20
  809c18:	8e d8                	mov    ds,eax
  809c1a:	8e c0                	mov    es,eax
  809c1c:	8e e8                	mov    gs,eax
  809c1e:	6a 20                	push   0x20
  809c20:	54                   	push   rsp
  809c21:	6a 18                	push   0x18
  809c23:	68 29 9c 80 00       	push   0x809c29
  809c28:	cf                   	iret   

0000000000809c29 <move_to_user_mode.done>:
  809c29:	c3                   	ret    

0000000000809c2a <desc>:
	...
