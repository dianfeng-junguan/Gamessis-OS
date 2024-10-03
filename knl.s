
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
  800194:	b8 90 11 80 00       	mov    eax,0x801190
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
  800217:	b8 57 63 80 00       	mov    eax,0x806357
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 d9 00 00 00       	call   80030c <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 20 51 80 00       	mov    eax,0x805120
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 bd 00 00 00       	call   80030c <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 60 72 80 00       	mov    eax,0x807260
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 a1 00 00 00       	call   80030c <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 50 5b 80 00       	mov    eax,0x805b50
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
  800291:	e8 fa 4b 00 00       	call   804e90 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 eb 4b 00 00       	call   804e90 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 dc 4b 00 00       	call   804e90 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 cd 4b 00 00       	call   804e90 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 be 4b 00 00       	call   804e90 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 af 4b 00 00       	call   804e90 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 a0 4b 00 00       	call   804e90 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 91 4b 00 00       	call   804e90 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 c1 4b 00 00       	call   804eca <turn_on_int>

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
  800327:	48 8b 15 92 a0 00 00 	mov    rdx,QWORD PTR [rip+0xa092]        # 80a3c0 <idt>
  80032e:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800332:	48 c1 e0 04          	shl    rax,0x4
  800336:	48 01 d0             	add    rax,rdx
  800339:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80033d:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800340:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800344:	48 c1 e8 10          	shr    rax,0x10
  800348:	48 89 c2             	mov    rdx,rax
  80034b:	48 8b 0d 6e a0 00 00 	mov    rcx,QWORD PTR [rip+0xa06e]        # 80a3c0 <idt>
  800352:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800356:	48 c1 e0 04          	shl    rax,0x4
  80035a:	48 01 c8             	add    rax,rcx
  80035d:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  800361:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800365:	48 c1 e8 20          	shr    rax,0x20
  800369:	89 c1                	mov    ecx,eax
  80036b:	48 8b 15 4e a0 00 00 	mov    rdx,QWORD PTR [rip+0xa04e]        # 80a3c0 <idt>
  800372:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800376:	48 c1 e0 04          	shl    rax,0x4
  80037a:	48 01 c2             	add    rdx,rax
  80037d:	0f b7 c1             	movzx  eax,cx
  800380:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr;
  800383:	48 8b 15 36 a0 00 00 	mov    rdx,QWORD PTR [rip+0xa036]        # 80a3c0 <idt>
  80038a:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80038e:	48 c1 e0 04          	shl    rax,0x4
  800392:	48 01 c2             	add    rdx,rax
  800395:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  800399:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
    idt[index].selector=selector;
  80039d:	48 8b 15 1c a0 00 00 	mov    rdx,QWORD PTR [rip+0xa01c]        # 80a3c0 <idt>
  8003a4:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003a8:	48 c1 e0 04          	shl    rax,0x4
  8003ac:	48 01 c2             	add    rdx,rax
  8003af:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003b3:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003b7:	48 8b 15 02 a0 00 00 	mov    rdx,QWORD PTR [rip+0xa002]        # 80a3c0 <idt>
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
  8003e1:	e8 d8 4a 00 00       	call   804ebe <eoi>
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
  8003fb:	e8 be 4a 00 00       	call   804ebe <eoi>
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
  800415:	e8 a4 4a 00 00       	call   804ebe <eoi>
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
  80042f:	e8 8a 4a 00 00       	call   804ebe <eoi>
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
  800449:	e8 70 4a 00 00       	call   804ebe <eoi>
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
  800463:	e8 56 4a 00 00       	call   804ebe <eoi>
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
  80047c:	e8 3d 4a 00 00       	call   804ebe <eoi>
    report_back_trace_of_err();
  800481:	b8 00 00 00 00       	mov    eax,0x0
  800486:	e8 5f 4a 00 00       	call   804eea <report_back_trace_of_err>
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
  8004a1:	e8 18 4a 00 00       	call   804ebe <eoi>
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
  8004bb:	e8 fe 49 00 00       	call   804ebe <eoi>
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
  8004d4:	e8 e5 49 00 00       	call   804ebe <eoi>
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
  8004ed:	e8 cc 49 00 00       	call   804ebe <eoi>
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
  800507:	e8 b2 49 00 00       	call   804ebe <eoi>
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
  800521:	e8 98 49 00 00       	call   804ebe <eoi>
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
  800545:	e8 74 49 00 00       	call   804ebe <eoi>
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
  800562:	e8 57 49 00 00       	call   804ebe <eoi>
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
  80059b:	48 8b 04 c5 20 1a 81 	mov    rax,QWORD PTR [rax*8+0x811a20]
  8005a2:	00 
  8005a3:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(b);
  8005a6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005a9:	48 98                	cdqe   
  8005ab:	48 89 c7             	mov    rdi,rax
  8005ae:	e8 62 25 00 00       	call   802b15 <reg_device>
  8005b3:	e9 f7 01 00 00       	jmp    8007af <syscall+0x241>
        case 1:return dispose_device(b);
  8005b8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005bb:	89 c7                	mov    edi,eax
  8005bd:	e8 b2 2f 00 00       	call   803574 <dispose_device>
  8005c2:	e9 e8 01 00 00       	jmp    8007af <syscall+0x241>
        case 2:return reg_driver(b);
  8005c7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005ca:	48 98                	cdqe   
  8005cc:	48 89 c7             	mov    rdi,rax
  8005cf:	e8 29 28 00 00       	call   802dfd <reg_driver>
  8005d4:	e9 d6 01 00 00       	jmp    8007af <syscall+0x241>
        case 3:return dispose_driver(b);
  8005d9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005dc:	48 98                	cdqe   
  8005de:	48 89 c7             	mov    rdi,rax
  8005e1:	e8 2c 30 00 00       	call   803612 <dispose_driver>
  8005e6:	e9 c4 01 00 00       	jmp    8007af <syscall+0x241>
        case 4:return call_drv_func(b,c,d);
  8005eb:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8005ee:	48 98                	cdqe   
  8005f0:	48 89 c2             	mov    rdx,rax
  8005f3:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8005f6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005f9:	89 ce                	mov    esi,ecx
  8005fb:	89 c7                	mov    edi,eax
  8005fd:	e8 1b 2d 00 00       	call   80331d <call_drv_func>
  800602:	e9 a8 01 00 00       	jmp    8007af <syscall+0x241>
        case 5:return req_page_at(b,c);
  800607:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80060a:	48 98                	cdqe   
  80060c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80060f:	89 d6                	mov    esi,edx
  800611:	48 89 c7             	mov    rdi,rax
  800614:	e8 d2 10 00 00       	call   8016eb <req_page_at>
  800619:	e9 91 01 00 00       	jmp    8007af <syscall+0x241>
        case 6:return free_page(b);
  80061e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800621:	48 98                	cdqe   
  800623:	48 89 c7             	mov    rdi,rax
  800626:	e8 d4 0e 00 00       	call   8014ff <free_page>
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
  800648:	e8 2e 42 00 00       	call   80487b <reg_proc>
  80064d:	e9 5d 01 00 00       	jmp    8007af <syscall+0x241>
        case 8:del_proc(b);
  800652:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800655:	89 c7                	mov    edi,eax
  800657:	e8 f1 3f 00 00       	call   80464d <del_proc>
        case 10:chk_vm(b,c);
  80065c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80065f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800662:	89 d6                	mov    esi,edx
  800664:	89 c7                	mov    edi,eax
  800666:	e8 59 11 00 00       	call   8017c4 <chk_vm>
        case 11:return sys_open(b,c);
  80066b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80066e:	48 98                	cdqe   
  800670:	48 89 c2             	mov    rdx,rax
  800673:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800676:	89 c6                	mov    esi,eax
  800678:	48 89 d7             	mov    rdi,rdx
  80067b:	e8 28 15 00 00       	call   801ba8 <sys_open>
  800680:	e9 2a 01 00 00       	jmp    8007af <syscall+0x241>
        case 12:return sys_close(b);
  800685:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800688:	89 c7                	mov    edi,eax
  80068a:	e8 e2 19 00 00       	call   802071 <sys_close>
  80068f:	e9 1b 01 00 00       	jmp    8007af <syscall+0x241>
        case 13:return sys_read(b,c,d);
  800694:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800697:	48 98                	cdqe   
  800699:	48 89 c1             	mov    rcx,rax
  80069c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80069f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006a2:	48 89 ce             	mov    rsi,rcx
  8006a5:	89 c7                	mov    edi,eax
  8006a7:	e8 db 1a 00 00       	call   802187 <sys_read>
  8006ac:	e9 fe 00 00 00       	jmp    8007af <syscall+0x241>
        case 14:return sys_write(b,c,d);
  8006b1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006b4:	48 98                	cdqe   
  8006b6:	48 89 c1             	mov    rcx,rax
  8006b9:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006bc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006bf:	48 89 ce             	mov    rsi,rcx
  8006c2:	89 c7                	mov    edi,eax
  8006c4:	e8 2d 1a 00 00       	call   8020f6 <sys_write>
  8006c9:	e9 e1 00 00 00       	jmp    8007af <syscall+0x241>
        case 15:return sys_seek(b,c,d);
  8006ce:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006d1:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006d4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006d7:	89 ce                	mov    esi,ecx
  8006d9:	89 c7                	mov    edi,eax
  8006db:	e8 38 1b 00 00       	call   802218 <sys_seek>
  8006e0:	e9 ca 00 00 00       	jmp    8007af <syscall+0x241>
        case 16:return sys_tell(b);
  8006e5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006e8:	89 c7                	mov    edi,eax
  8006ea:	e8 70 1b 00 00       	call   80225f <sys_tell>
  8006ef:	e9 bb 00 00 00       	jmp    8007af <syscall+0x241>
        case 17:return reg_vol(b,c,d);
  8006f4:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006f7:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006fa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006fd:	89 ce                	mov    esi,ecx
  8006ff:	89 c7                	mov    edi,eax
  800701:	b8 00 00 00 00       	mov    eax,0x0
  800706:	e8 92 13 00 00       	call   801a9d <reg_vol>
  80070b:	e9 9f 00 00 00       	jmp    8007af <syscall+0x241>
        case 18:return free_vol(b);
  800710:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800713:	89 c7                	mov    edi,eax
  800715:	b8 00 00 00 00       	mov    eax,0x0
  80071a:	e8 62 13 00 00       	call   801a81 <free_vol>
  80071f:	e9 8b 00 00 00       	jmp    8007af <syscall+0x241>
        case 19:return execute(b);
  800724:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800727:	48 98                	cdqe   
  800729:	48 89 c7             	mov    rdi,rax
  80072c:	e8 42 4a 00 00       	call   805173 <execute>
  800731:	eb 7c                	jmp    8007af <syscall+0x241>
        case SYSCALL_EXIT:return sys_exit(b);
  800733:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800736:	89 c7                	mov    edi,eax
  800738:	e8 1d 41 00 00       	call   80485a <sys_exit>
  80073d:	eb 70                	jmp    8007af <syscall+0x241>
        case SYSCALL_CALL:return exec_call(b);
  80073f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800742:	48 98                	cdqe   
  800744:	48 89 c7             	mov    rdi,rax
  800747:	e8 22 4b 00 00       	call   80526e <exec_call>
  80074c:	eb 61                	jmp    8007af <syscall+0x241>
        case SYSCALL_MKFIFO:return sys_mkfifo(b);
  80074e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800751:	89 c7                	mov    edi,eax
  800753:	e8 ca 11 00 00       	call   801922 <sys_mkfifo>
  800758:	eb 55                	jmp    8007af <syscall+0x241>
        case SYSCALL_MALLOC:return sys_malloc(b);
  80075a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80075d:	89 c7                	mov    edi,eax
  80075f:	e8 b2 42 00 00       	call   804a16 <sys_malloc>
  800764:	eb 49                	jmp    8007af <syscall+0x241>
        case SYSCALL_FREE:return sys_free(b);
  800766:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800769:	89 c7                	mov    edi,eax
  80076b:	e8 4d 44 00 00       	call   804bbd <sys_free>
  800770:	eb 3d                	jmp    8007af <syscall+0x241>
        case SYSCALL_KB_READC:return sys_getkbc();
  800772:	b8 00 00 00 00       	mov    eax,0x0
  800777:	e8 ef 5c 00 00       	call   80646b <sys_getkbc>
  80077c:	0f be c0             	movsx  eax,al
  80077f:	eb 2e                	jmp    8007af <syscall+0x241>
        case SYSCALL_FIND_DEV:return sys_find_dev(b);
  800781:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800784:	48 98                	cdqe   
  800786:	48 89 c7             	mov    rdi,rax
  800789:	e8 bf 27 00 00       	call   802f4d <sys_find_dev>
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
  8007a8:	e8 32 28 00 00       	call   802fdf <sys_operate_dev>
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
  8007d9:	e8 68 03 00 00       	call   800b46 <init_logging>
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
  80080a:	48 8b 04 c5 88 1d 81 	mov    rax,QWORD PTR [rax*8+0x811d88]
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
  80081e:	e8 d5 07 00 00       	call   800ff8 <set_high_mem_base>
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
  800854:	e8 b6 07 00 00       	call   80100f <set_mem_area>
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
  8008ae:	e8 62 54 00 00       	call   805d15 <set_framebuffer>
  8008b3:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  8008b7:	b8 00 00 00 00       	mov    eax,0x0
  8008bc:	e8 9f 52 00 00       	call   805b60 <init_framebuffer>
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
  800a85:	e8 95 51 00 00       	call   805c1f <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800a8a:	bf 48 1d 81 00       	mov    edi,0x811d48
  800a8f:	e8 3d 56 00 00       	call   8060d1 <print>
    init_int();
  800a94:	b8 00 00 00 00       	mov    eax,0x0
  800a99:	e8 62 f5 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800a9e:	bf 65 1d 81 00       	mov    edi,0x811d65
  800aa3:	e8 29 56 00 00       	call   8060d1 <print>
    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
  800aa8:	68 00 00 40 00       	push   0x400000
  800aad:	68 00 00 40 00       	push   0x400000
  800ab2:	68 00 00 40 00       	push   0x400000
  800ab7:	68 00 00 40 00       	push   0x400000
  800abc:	41 b9 00 00 40 00    	mov    r9d,0x400000
  800ac2:	41 b8 00 00 40 00    	mov    r8d,0x400000
  800ac8:	b9 00 00 40 00       	mov    ecx,0x400000
  800acd:	ba 00 00 40 00       	mov    edx,0x400000
  800ad2:	be 00 00 40 00       	mov    esi,0x400000
  800ad7:	bf 00 00 40 00       	mov    edi,0x400000
  800adc:	e8 f6 42 00 00       	call   804dd7 <set_tss>
  800ae1:	48 83 c4 20          	add    rsp,0x20
    init_memory();
  800ae5:	b8 00 00 00 00       	mov    eax,0x0
  800aea:	e8 d7 07 00 00       	call   8012c6 <init_memory>
    init_com(PORT_COM1);
  800aef:	bf f8 03 00 00       	mov    edi,0x3f8
  800af4:	e8 a0 8d 00 00       	call   809899 <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800af9:	be f8 03 00 00       	mov    esi,0x3f8
  800afe:	bf 72 1d 81 00       	mov    edi,0x811d72
  800b03:	e8 dd 8e 00 00       	call   8099e5 <com_puts>
	init_paging();
  800b08:	b8 00 00 00 00       	mov    eax,0x0
  800b0d:	e8 db 04 00 00       	call   800fed <init_paging>
 	init_gdt();
  800b12:	b8 00 00 00 00       	mov    eax,0x0
  800b17:	e8 f2 43 00 00       	call   804f0e <init_gdt>
    init_drvdev_man();
  800b1c:	b8 00 00 00 00       	mov    eax,0x0
  800b21:	e8 d5 1f 00 00       	call   802afb <init_drvdev_man>
    init_proc();
  800b26:	b8 00 00 00 00       	mov    eax,0x0
  800b2b:	e8 b6 2e 00 00       	call   8039e6 <init_proc>
    //自带驱动
    //init_tty();
    init_kb();
  800b30:	b8 00 00 00 00       	mov    eax,0x0
  800b35:	e8 fe 57 00 00       	call   806338 <init_kb>
    manage_proc_lock=0;
  800b3a:	c7 05 84 98 00 00 00 	mov    DWORD PTR [rip+0x9884],0x0        # 80a3c8 <manage_proc_lock>
  800b41:	00 00 00 
    while (1);
  800b44:	eb fe                	jmp    800b44 <main+0x393>

0000000000800b46 <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800b46:	f3 0f 1e fa          	endbr64 
  800b4a:	55                   	push   rbp
  800b4b:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800b4e:	48 c7 05 a7 f4 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff4a7],0xb8000        # 400000 <video>
  800b55:	00 80 0b 00 
    xpos=0;
  800b59:	c7 05 a5 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff4a5],0x0        # 400008 <xpos>
  800b60:	00 00 00 
    ypos=0;
  800b63:	c7 05 9f f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff49f],0x0        # 40000c <ypos>
  800b6a:	00 00 00 
}
  800b6d:	90                   	nop
  800b6e:	5d                   	pop    rbp
  800b6f:	c3                   	ret    

0000000000800b70 <itoa>:

static void itoa (char *buf, int base, int d)
{
  800b70:	f3 0f 1e fa          	endbr64 
  800b74:	55                   	push   rbp
  800b75:	48 89 e5             	mov    rbp,rsp
  800b78:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800b7c:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800b7f:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800b82:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800b86:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800b8a:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800b8d:	48 98                	cdqe   
  800b8f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800b93:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800b9a:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800b9e:	75 27                	jne    800bc7 <itoa+0x57>
  800ba0:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800ba4:	79 21                	jns    800bc7 <itoa+0x57>
    {
        *p++ = '-';
  800ba6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800baa:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800bae:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800bb2:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800bb5:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800bba:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800bbd:	f7 d8                	neg    eax
  800bbf:	48 98                	cdqe   
  800bc1:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800bc5:	eb 0d                	jmp    800bd4 <itoa+0x64>
    }
    else if (base == 'x')
  800bc7:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800bcb:	75 07                	jne    800bd4 <itoa+0x64>
        divisor = 16;
  800bcd:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800bd4:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800bd7:	48 63 c8             	movsxd rcx,eax
  800bda:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800bde:	ba 00 00 00 00       	mov    edx,0x0
  800be3:	48 f7 f1             	div    rcx
  800be6:	48 89 d0             	mov    rax,rdx
  800be9:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800bec:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800bf0:	7f 0a                	jg     800bfc <itoa+0x8c>
  800bf2:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800bf5:	83 c0 30             	add    eax,0x30
  800bf8:	89 c1                	mov    ecx,eax
  800bfa:	eb 08                	jmp    800c04 <itoa+0x94>
  800bfc:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800bff:	83 c0 57             	add    eax,0x57
  800c02:	89 c1                	mov    ecx,eax
  800c04:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c08:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c0c:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c10:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800c12:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c15:	48 63 f0             	movsxd rsi,eax
  800c18:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c1c:	ba 00 00 00 00       	mov    edx,0x0
  800c21:	48 f7 f6             	div    rsi
  800c24:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c28:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800c2d:	75 a5                	jne    800bd4 <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800c2f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c33:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800c36:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800c3a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800c3e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c42:	48 83 e8 01          	sub    rax,0x1
  800c46:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800c4a:	eb 2b                	jmp    800c77 <itoa+0x107>
    {
        char tmp = *p1;
  800c4c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c50:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800c53:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800c56:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c5a:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800c5d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c61:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800c63:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c67:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800c6b:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800c6d:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800c72:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800c77:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c7b:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800c7f:	72 cb                	jb     800c4c <itoa+0xdc>
    }
}
  800c81:	90                   	nop
  800c82:	90                   	nop
  800c83:	5d                   	pop    rbp
  800c84:	c3                   	ret    

0000000000800c85 <putchar>:
 
/* 在屏幕上输出字符 C 。 */
static void putchar (char c)
{
  800c85:	f3 0f 1e fa          	endbr64 
  800c89:	55                   	push   rbp
  800c8a:	48 89 e5             	mov    rbp,rsp
  800c8d:	48 83 ec 20          	sub    rsp,0x20
  800c91:	89 f8                	mov    eax,edi
  800c93:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    char s[2]={c,'\0'};
  800c96:	0f b6 45 ec          	movzx  eax,BYTE PTR [rbp-0x14]
  800c9a:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  800c9d:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
    print(s);
  800ca1:	48 8d 45 fe          	lea    rax,[rbp-0x2]
  800ca5:	48 89 c7             	mov    rdi,rax
  800ca8:	e8 24 54 00 00       	call   8060d1 <print>
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800cad:	c9                   	leave  
  800cae:	c3                   	ret    

0000000000800caf <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800caf:	f3 0f 1e fa          	endbr64 
  800cb3:	55                   	push   rbp
  800cb4:	48 89 e5             	mov    rbp,rsp
  800cb7:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800cbe:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800cc5:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800ccc:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800cd3:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800cda:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800ce1:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800ce8:	84 c0                	test   al,al
  800cea:	74 20                	je     800d0c <printf+0x5d>
  800cec:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800cf0:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800cf4:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800cf8:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800cfc:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800d00:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800d04:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800d08:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800d0c:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800d13:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char c;
    char buf[20];
 
    arg++;
  800d1a:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800d21:	08 
 
    while ((c = *format++) != 0)
  800d22:	e9 29 01 00 00       	jmp    800e50 <printf+0x1a1>
    {
        if (c != '%')
  800d27:	80 bd 3f ff ff ff 25 	cmp    BYTE PTR [rbp-0xc1],0x25
  800d2e:	74 13                	je     800d43 <printf+0x94>
            putchar (c);
  800d30:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800d37:	89 c7                	mov    edi,eax
  800d39:	e8 47 ff ff ff       	call   800c85 <putchar>
  800d3e:	e9 0d 01 00 00       	jmp    800e50 <printf+0x1a1>
        else
        {
            char *p;
 
            c = *format++;
  800d43:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800d4a:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800d4e:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800d55:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800d58:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
            switch (c)
  800d5e:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800d65:	83 f8 78             	cmp    eax,0x78
  800d68:	74 26                	je     800d90 <printf+0xe1>
  800d6a:	83 f8 78             	cmp    eax,0x78
  800d6d:	0f 8f be 00 00 00    	jg     800e31 <printf+0x182>
  800d73:	83 f8 75             	cmp    eax,0x75
  800d76:	74 18                	je     800d90 <printf+0xe1>
  800d78:	83 f8 75             	cmp    eax,0x75
  800d7b:	0f 8f b0 00 00 00    	jg     800e31 <printf+0x182>
  800d81:	83 f8 64             	cmp    eax,0x64
  800d84:	74 0a                	je     800d90 <printf+0xe1>
  800d86:	83 f8 73             	cmp    eax,0x73
  800d89:	74 41                	je     800dcc <printf+0x11d>
  800d8b:	e9 a1 00 00 00       	jmp    800e31 <printf+0x182>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800d90:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800d97:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800d9b:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800da2:	8b 10                	mov    edx,DWORD PTR [rax]
  800da4:	0f be 8d 3f ff ff ff 	movsx  ecx,BYTE PTR [rbp-0xc1]
  800dab:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800db2:	89 ce                	mov    esi,ecx
  800db4:	48 89 c7             	mov    rdi,rax
  800db7:	e8 b4 fd ff ff       	call   800b70 <itoa>
                p = buf;
  800dbc:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800dc3:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800dca:	eb 34                	jmp    800e00 <printf+0x151>
                break;
 
            case 's':
                p = *arg++;
  800dcc:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800dd3:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800dd7:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800dde:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800de1:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800de8:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800def:	00 
  800df0:	75 0d                	jne    800dff <printf+0x150>
                    p = "(null)";
  800df2:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x811dd0
  800df9:	d0 1d 81 00 
  800dfd:	eb 22                	jmp    800e21 <printf+0x172>
 
string:
  800dff:	90                   	nop
                while (*p)
  800e00:	eb 1f                	jmp    800e21 <printf+0x172>
                    putchar (*p++);
  800e02:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e09:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e0d:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800e14:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e17:	0f be c0             	movsx  eax,al
  800e1a:	89 c7                	mov    edi,eax
  800e1c:	e8 64 fe ff ff       	call   800c85 <putchar>
                while (*p)
  800e21:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e28:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e2b:	84 c0                	test   al,al
  800e2d:	75 d3                	jne    800e02 <printf+0x153>
                break;
  800e2f:	eb 1f                	jmp    800e50 <printf+0x1a1>
 
            default:
                putchar (*((int *) arg++));
  800e31:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e38:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e3c:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e43:	8b 00                	mov    eax,DWORD PTR [rax]
  800e45:	0f be c0             	movsx  eax,al
  800e48:	89 c7                	mov    edi,eax
  800e4a:	e8 36 fe ff ff       	call   800c85 <putchar>
                break;
  800e4f:	90                   	nop
    while ((c = *format++) != 0)
  800e50:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800e57:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e5b:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800e62:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e65:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
  800e6b:	80 bd 3f ff ff ff 00 	cmp    BYTE PTR [rbp-0xc1],0x0
  800e72:	0f 85 af fe ff ff    	jne    800d27 <printf+0x78>
            }
        }
    }
}
  800e78:	90                   	nop
  800e79:	90                   	nop
  800e7a:	c9                   	leave  
  800e7b:	c3                   	ret    

0000000000800e7c <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800e7c:	f3 0f 1e fa          	endbr64 
  800e80:	55                   	push   rbp
  800e81:	48 89 e5             	mov    rbp,rsp
  800e84:	48 83 ec 40          	sub    rsp,0x40
  800e88:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800e8c:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800e90:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800e93:	48 8b 15 46 95 00 00 	mov    rdx,QWORD PTR [rip+0x9546]        # 80a3e0 <pml4>
  800e9a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800e9e:	48 c1 e8 27          	shr    rax,0x27
  800ea2:	48 c1 e0 03          	shl    rax,0x3
  800ea6:	48 01 d0             	add    rax,rdx
  800ea9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800eac:	b0 00                	mov    al,0x0
  800eae:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800eb2:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800eb9:	00 00 00 
  800ebc:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800ec0:	48 c1 e8 1e          	shr    rax,0x1e
  800ec4:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800ec7:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800eca:	48 98                	cdqe   
  800ecc:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800ed3:	00 
  800ed4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800ed8:	48 01 d0             	add    rax,rdx
  800edb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800ede:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800ee2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800ee6:	83 e0 01             	and    eax,0x1
  800ee9:	48 85 c0             	test   rax,rax
  800eec:	75 2f                	jne    800f1d <mmap+0xa1>
    {
        pdp=(page_item*)vmalloc();
  800eee:	b8 00 00 00 00       	mov    eax,0x0
  800ef3:	e8 a3 01 00 00       	call   80109b <vmalloc>
  800ef8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        pdptp[pdpti]=(addr_t)pdp|attr;
  800efc:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800eff:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800f03:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f06:	48 98                	cdqe   
  800f08:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f0f:	00 
  800f10:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f14:	48 01 f0             	add    rax,rsi
  800f17:	48 09 ca             	or     rdx,rcx
  800f1a:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800f1d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f21:	b0 00                	mov    al,0x0
  800f23:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800f27:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f2b:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f30:	48 c1 e8 15          	shr    rax,0x15
  800f34:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f3b:	00 
  800f3c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f40:	48 01 d0             	add    rax,rdx
  800f43:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f46:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800f4a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f4e:	83 e0 01             	and    eax,0x1
  800f51:	48 85 c0             	test   rax,rax
  800f54:	75 37                	jne    800f8d <mmap+0x111>
    {
        pt=(page_item*)vmalloc();
  800f56:	b8 00 00 00 00       	mov    eax,0x0
  800f5b:	e8 3b 01 00 00       	call   80109b <vmalloc>
  800f60:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800f64:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f67:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800f6b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f6f:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f74:	48 c1 e8 15          	shr    rax,0x15
  800f78:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f7f:	00 
  800f80:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f84:	48 01 f0             	add    rax,rsi
  800f87:	48 09 ca             	or     rdx,rcx
  800f8a:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  800f8d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f91:	b0 00                	mov    al,0x0
  800f93:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  800f97:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  800f9a:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  800f9e:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  800fa4:	48 c1 ea 0c          	shr    rdx,0xc
  800fa8:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  800faf:	00 
  800fb0:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800fb4:	48 01 ca             	add    rdx,rcx
  800fb7:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  800fbb:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  800fbe:	b8 00 00 00 00       	mov    eax,0x0
}
  800fc3:	c9                   	leave  
  800fc4:	c3                   	ret    

0000000000800fc5 <mdemap>:

stat_t mdemap(addr_t la)
{
  800fc5:	f3 0f 1e fa          	endbr64 
  800fc9:	55                   	push   rbp
  800fca:	48 89 e5             	mov    rbp,rsp
  800fcd:	48 83 ec 10          	sub    rsp,0x10
  800fd1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  800fd5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fd9:	ba 00 00 00 00       	mov    edx,0x0
  800fde:	48 89 c6             	mov    rsi,rax
  800fe1:	bf 00 00 00 00       	mov    edi,0x0
  800fe6:	e8 91 fe ff ff       	call   800e7c <mmap>
}
  800feb:	c9                   	leave  
  800fec:	c3                   	ret    

0000000000800fed <init_paging>:
int init_paging()
{
  800fed:	f3 0f 1e fa          	endbr64 
  800ff1:	55                   	push   rbp
  800ff2:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  800ff5:	90                   	nop
  800ff6:	5d                   	pop    rbp
  800ff7:	c3                   	ret    

0000000000800ff8 <set_high_mem_base>:
void set_high_mem_base(int base)
{
  800ff8:	f3 0f 1e fa          	endbr64 
  800ffc:	55                   	push   rbp
  800ffd:	48 89 e5             	mov    rbp,rsp
  801000:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  801003:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801006:	89 05 ec 93 00 00    	mov    DWORD PTR [rip+0x93ec],eax        # 80a3f8 <high_mem_base>
}
  80100c:	90                   	nop
  80100d:	5d                   	pop    rbp
  80100e:	c3                   	ret    

000000000080100f <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  80100f:	f3 0f 1e fa          	endbr64 
  801013:	55                   	push   rbp
  801014:	48 89 e5             	mov    rbp,rsp
  801017:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80101b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80101f:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  801023:	8b 05 f7 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff1f7]        # 400220 <mmap_t_i>
  801029:	48 63 d0             	movsxd rdx,eax
  80102c:	48 89 d0             	mov    rax,rdx
  80102f:	48 01 c0             	add    rax,rax
  801032:	48 01 d0             	add    rax,rdx
  801035:	48 c1 e0 03          	shl    rax,0x3
  801039:	48 8d 90 40 00 40 00 	lea    rdx,[rax+0x400040]
  801040:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801044:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  801047:	8b 05 d3 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff1d3]        # 400220 <mmap_t_i>
  80104d:	48 63 d0             	movsxd rdx,eax
  801050:	48 89 d0             	mov    rax,rdx
  801053:	48 01 c0             	add    rax,rax
  801056:	48 01 d0             	add    rax,rdx
  801059:	48 c1 e0 03          	shl    rax,0x3
  80105d:	48 8d 90 48 00 40 00 	lea    rdx,[rax+0x400048]
  801064:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801068:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  80106b:	8b 05 af f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff1af]        # 400220 <mmap_t_i>
  801071:	8d 50 01             	lea    edx,[rax+0x1]
  801074:	89 15 a6 f1 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff1a6],edx        # 400220 <mmap_t_i>
  80107a:	48 63 d0             	movsxd rdx,eax
  80107d:	48 89 d0             	mov    rax,rdx
  801080:	48 01 c0             	add    rax,rax
  801083:	48 01 d0             	add    rax,rdx
  801086:	48 c1 e0 03          	shl    rax,0x3
  80108a:	48 8d 90 50 00 40 00 	lea    rdx,[rax+0x400050]
  801091:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801095:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  801098:	90                   	nop
  801099:	5d                   	pop    rbp
  80109a:	c3                   	ret    

000000000080109b <vmalloc>:
addr_t vmalloc()
{
  80109b:	f3 0f 1e fa          	endbr64 
  80109f:	55                   	push   rbp
  8010a0:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  8010a3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8010aa:	eb 76                	jmp    801122 <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  8010ac:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8010b3:	eb 63                	jmp    801118 <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  8010b5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010b8:	48 98                	cdqe   
  8010ba:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  8010c1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8010c4:	be 01 00 00 00       	mov    esi,0x1
  8010c9:	89 c1                	mov    ecx,eax
  8010cb:	d3 e6                	shl    esi,cl
  8010cd:	89 f0                	mov    eax,esi
  8010cf:	21 d0                	and    eax,edx
  8010d1:	85 c0                	test   eax,eax
  8010d3:	75 3f                	jne    801114 <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  8010d5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010d8:	48 98                	cdqe   
  8010da:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  8010e1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8010e4:	be 01 00 00 00       	mov    esi,0x1
  8010e9:	89 c1                	mov    ecx,eax
  8010eb:	d3 e6                	shl    esi,cl
  8010ed:	89 f0                	mov    eax,esi
  8010ef:	09 c2                	or     edx,eax
  8010f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8010f4:	48 98                	cdqe   
  8010f6:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  8010fd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801100:	c1 e0 05             	shl    eax,0x5
  801103:	89 c2                	mov    edx,eax
  801105:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801108:	01 d0                	add    eax,edx
  80110a:	83 c0 20             	add    eax,0x20
  80110d:	c1 e0 0c             	shl    eax,0xc
  801110:	48 98                	cdqe   
  801112:	eb 14                	jmp    801128 <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  801114:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801118:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80111c:	7e 97                	jle    8010b5 <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  80111e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801122:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  801126:	7e 84                	jle    8010ac <vmalloc+0x11>
            }
        }
    }
}
  801128:	5d                   	pop    rbp
  801129:	c3                   	ret    

000000000080112a <vmfree>:

int vmfree(addr_t ptr)
{
  80112a:	f3 0f 1e fa          	endbr64 
  80112e:	55                   	push   rbp
  80112f:	48 89 e5             	mov    rbp,rsp
  801132:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  801136:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80113a:	48 c1 e8 0c          	shr    rax,0xc
  80113e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  801141:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801144:	8d 50 1f             	lea    edx,[rax+0x1f]
  801147:	85 c0                	test   eax,eax
  801149:	0f 48 c2             	cmovs  eax,edx
  80114c:	c1 f8 05             	sar    eax,0x5
  80114f:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  801152:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801155:	99                   	cdq    
  801156:	c1 ea 1b             	shr    edx,0x1b
  801159:	01 d0                	add    eax,edx
  80115b:	83 e0 1f             	and    eax,0x1f
  80115e:	29 d0                	sub    eax,edx
  801160:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  801163:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801166:	48 98                	cdqe   
  801168:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  80116f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801172:	be 01 00 00 00       	mov    esi,0x1
  801177:	89 c1                	mov    ecx,eax
  801179:	d3 e6                	shl    esi,cl
  80117b:	89 f0                	mov    eax,esi
  80117d:	f7 d0                	not    eax
  80117f:	21 c2                	and    edx,eax
  801181:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801184:	48 98                	cdqe   
  801186:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
}
  80118d:	90                   	nop
  80118e:	5d                   	pop    rbp
  80118f:	c3                   	ret    

0000000000801190 <page_err>:
void page_err(){
  801190:	f3 0f 1e fa          	endbr64 
  801194:	55                   	push   rbp
  801195:	48 89 e5             	mov    rbp,rsp
  801198:	53                   	push   rbx
  801199:	48 83 ec 28          	sub    rsp,0x28
    asm("cli");
  80119d:	fa                   	cli    
    print("page err\n");
  80119e:	bf d8 1d 81 00       	mov    edi,0x811dd8
  8011a3:	e8 29 4f 00 00       	call   8060d1 <print>
    unsigned long err_code=0,l_addr=0;
  8011a8:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8011af:	00 
  8011b0:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  8011b7:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  8011b8:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  8011bc:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  8011c0:	0f 20 d0             	mov    rax,cr2
  8011c3:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  8011c7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8011cb:	83 e0 01             	and    eax,0x1
  8011ce:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  8011d1:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8011d5:	75 27                	jne    8011fe <page_err+0x6e>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        mmap(vmalloc(),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  8011d7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8011db:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  8011e1:	48 89 c3             	mov    rbx,rax
  8011e4:	b8 00 00 00 00       	mov    eax,0x0
  8011e9:	e8 ad fe ff ff       	call   80109b <vmalloc>
  8011ee:	ba 07 00 00 00       	mov    edx,0x7
  8011f3:	48 89 de             	mov    rsi,rbx
  8011f6:	48 89 c7             	mov    rdi,rax
  8011f9:	e8 7e fc ff ff       	call   800e7c <mmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  8011fe:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801202:	83 e0 02             	and    eax,0x2
  801205:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("when writing\n");else //puts("when reading");
  801208:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80120c:	74 0c                	je     80121a <page_err+0x8a>
  80120e:	bf e2 1d 81 00       	mov    edi,0x811de2
  801213:	e8 b9 4e 00 00       	call   8060d1 <print>
  801218:	eb 0a                	jmp    801224 <page_err+0x94>
    p=err_code&4;
  80121a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80121e:	83 e0 04             	and    eax,0x4
  801221:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  801224:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801228:	75 0c                	jne    801236 <page_err+0xa6>
  80122a:	bf f0 1d 81 00       	mov    edi,0x811df0
  80122f:	e8 9d 4e 00 00       	call   8060d1 <print>
  801234:	eb 0a                	jmp    801240 <page_err+0xb0>
    p=err_code&16;
  801236:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80123a:	83 e0 10             	and    eax,0x10
  80123d:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  801240:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801244:	74 0a                	je     801250 <page_err+0xc0>
  801246:	bf 08 1e 81 00       	mov    edi,0x811e08
  80124b:	e8 81 4e 00 00       	call   8060d1 <print>
    unsigned int addr=0;
  801250:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%ebp),%0":"=r"(addr));
  801257:	67 8b 45 08          	mov    eax,DWORD PTR [ebp+0x8]
  80125b:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  80125e:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  801262:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  801265:	89 c6                	mov    esi,eax
  801267:	bf 28 1e 81 00       	mov    edi,0x811e28
  80126c:	b8 00 00 00 00       	mov    eax,0x0
  801271:	e8 39 fa ff ff       	call   800caf <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  801276:	48 8b 0d 23 72 c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc07223]        # 4084a0 <task>
  80127d:	8b 05 89 32 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc13289]        # 41450c <cur_proc>
  801283:	48 63 d0             	movsxd rdx,eax
  801286:	48 89 d0             	mov    rax,rdx
  801289:	48 01 c0             	add    rax,rax
  80128c:	48 01 d0             	add    rax,rdx
  80128f:	48 c1 e0 08          	shl    rax,0x8
  801293:	48 01 c8             	add    rax,rcx
  801296:	8b 00                	mov    eax,DWORD PTR [rax]
  801298:	83 f8 01             	cmp    eax,0x1
  80129b:	75 11                	jne    8012ae <page_err+0x11e>
    {
        printf("sys died. please reboot.\n");
  80129d:	bf 4a 1e 81 00       	mov    edi,0x811e4a
  8012a2:	b8 00 00 00 00       	mov    eax,0x0
  8012a7:	e8 03 fa ff ff       	call   800caf <printf>
        asm volatile("jmp .");
  8012ac:	eb fe                	jmp    8012ac <page_err+0x11c>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  8012ae:	b8 00 00 00 00       	mov    eax,0x0
  8012b3:	e8 06 3c 00 00       	call   804ebe <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n leave\r\n add $8,%esp \r\n iretq");
  8012b8:	fb                   	sti    
  8012b9:	c9                   	leave  
  8012ba:	83 c4 08             	add    esp,0x8
  8012bd:	48 cf                	iretq  
}
  8012bf:	90                   	nop
  8012c0:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8012c4:	c9                   	leave  
  8012c5:	c3                   	ret    

00000000008012c6 <init_memory>:
void init_memory()
{
  8012c6:	f3 0f 1e fa          	endbr64 
  8012ca:	55                   	push   rbp
  8012cb:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  8012ce:	8b 05 4c ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfef4c]        # 400220 <mmap_t_i>
  8012d4:	83 e8 01             	sub    eax,0x1
  8012d7:	48 63 d0             	movsxd rdx,eax
  8012da:	48 89 d0             	mov    rax,rdx
  8012dd:	48 01 c0             	add    rax,rax
  8012e0:	48 01 d0             	add    rax,rdx
  8012e3:	48 c1 e0 03          	shl    rax,0x3
  8012e7:	48 05 40 00 40 00    	add    rax,0x400040
  8012ed:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8012f0:	8b 05 2a ef bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfef2a]        # 400220 <mmap_t_i>
  8012f6:	83 e8 01             	sub    eax,0x1
  8012f9:	48 63 d0             	movsxd rdx,eax
  8012fc:	48 89 d0             	mov    rax,rdx
  8012ff:	48 01 c0             	add    rax,rax
  801302:	48 01 d0             	add    rax,rdx
  801305:	48 c1 e0 03          	shl    rax,0x3
  801309:	48 05 48 00 40 00    	add    rax,0x400048
  80130f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801312:	48 01 c8             	add    rax,rcx
  801315:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  801319:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80131d:	48 c1 e8 0c          	shr    rax,0xc
  801321:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  801324:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  801327:	8d 50 1f             	lea    edx,[rax+0x1f]
  80132a:	85 c0                	test   eax,eax
  80132c:	0f 48 c2             	cmovs  eax,edx
  80132f:	c1 f8 05             	sar    eax,0x5
  801332:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  801335:	48 c7 05 e0 ec bf ff 	mov    QWORD PTR [rip+0xffffffffffbfece0],0xc00000        # 400020 <page_map>
  80133c:	00 00 c0 00 
    int* p=page_map;
  801340:	48 8b 05 d9 ec bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfecd9]        # 400020 <page_map>
  801347:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t curp=0;
  80134b:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  801352:	00 
    for(int i=0;i<mmap_t_i;i++){
  801353:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80135a:	e9 91 00 00 00       	jmp    8013f0 <init_memory+0x12a>
        int cont=0;
  80135f:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  801366:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801369:	48 63 d0             	movsxd rdx,eax
  80136c:	48 89 d0             	mov    rax,rdx
  80136f:	48 01 c0             	add    rax,rax
  801372:	48 01 d0             	add    rax,rdx
  801375:	48 c1 e0 03          	shl    rax,0x3
  801379:	48 05 50 00 40 00    	add    rax,0x400050
  80137f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801382:	48 83 f8 01          	cmp    rax,0x1
  801386:	74 07                	je     80138f <init_memory+0xc9>
            cont=-1;
  801388:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [rbp-0x10],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  80138f:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801396:	eb 15                	jmp    8013ad <init_memory+0xe7>
            *(p++)=cont;
  801398:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80139c:	48 8d 50 04          	lea    rdx,[rax+0x4]
  8013a0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8013a4:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8013a7:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  8013a9:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8013ad:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8013b0:	48 63 c8             	movsxd rcx,eax
  8013b3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8013b6:	48 63 d0             	movsxd rdx,eax
  8013b9:	48 89 d0             	mov    rax,rdx
  8013bc:	48 01 c0             	add    rax,rax
  8013bf:	48 01 d0             	add    rax,rdx
  8013c2:	48 c1 e0 03          	shl    rax,0x3
  8013c6:	48 05 48 00 40 00    	add    rax,0x400048
  8013cc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8013cf:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  8013d6:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  8013dd:	ff 00 00 
  8013e0:	48 21 d0             	and    rax,rdx
  8013e3:	48 c1 e8 11          	shr    rax,0x11
  8013e7:	48 39 c1             	cmp    rcx,rax
  8013ea:	72 ac                	jb     801398 <init_memory+0xd2>
    for(int i=0;i<mmap_t_i;i++){
  8013ec:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8013f0:	8b 05 2a ee bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfee2a]        # 400220 <mmap_t_i>
  8013f6:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  8013f9:	0f 8c 60 ff ff ff    	jl     80135f <init_memory+0x99>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  8013ff:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  801406:	eb 1d                	jmp    801425 <init_memory+0x15f>
        page_map[i]=0xffffffff;
  801408:	48 8b 15 11 ec bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfec11]        # 400020 <page_map>
  80140f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801412:	48 98                	cdqe   
  801414:	48 c1 e0 02          	shl    rax,0x2
  801418:	48 01 d0             	add    rax,rdx
  80141b:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  801421:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  801425:	83 7d e8 7f          	cmp    DWORD PTR [rbp-0x18],0x7f
  801429:	7e dd                	jle    801408 <init_memory+0x142>
    }
}
  80142b:	90                   	nop
  80142c:	90                   	nop
  80142d:	5d                   	pop    rbp
  80142e:	c3                   	ret    

000000000080142f <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  80142f:	f3 0f 1e fa          	endbr64 
  801433:	55                   	push   rbp
  801434:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801437:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80143e:	e9 b0 00 00 00       	jmp    8014f3 <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  801443:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80144a:	e9 96 00 00 00       	jmp    8014e5 <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  80144f:	48 8b 15 ca eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfebca]        # 400020 <page_map>
  801456:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801459:	48 98                	cdqe   
  80145b:	48 c1 e0 02          	shl    rax,0x2
  80145f:	48 01 d0             	add    rax,rdx
  801462:	8b 10                	mov    edx,DWORD PTR [rax]
  801464:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801467:	be 01 00 00 00       	mov    esi,0x1
  80146c:	89 c1                	mov    ecx,eax
  80146e:	d3 e6                	shl    esi,cl
  801470:	89 f0                	mov    eax,esi
  801472:	21 d0                	and    eax,edx
  801474:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  801477:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80147a:	c1 e0 05             	shl    eax,0x5
  80147d:	89 c2                	mov    edx,eax
  80147f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801482:	01 d0                	add    eax,edx
  801484:	c1 e0 0c             	shl    eax,0xc
  801487:	3d ff ff 0f 00       	cmp    eax,0xfffff
  80148c:	7e 53                	jle    8014e1 <req_a_page+0xb2>
  80148e:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  801492:	75 4d                	jne    8014e1 <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  801494:	48 8b 15 85 eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb85]        # 400020 <page_map>
  80149b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80149e:	48 98                	cdqe   
  8014a0:	48 c1 e0 02          	shl    rax,0x2
  8014a4:	48 01 d0             	add    rax,rdx
  8014a7:	8b 10                	mov    edx,DWORD PTR [rax]
  8014a9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8014ac:	be 01 00 00 00       	mov    esi,0x1
  8014b1:	89 c1                	mov    ecx,eax
  8014b3:	d3 e6                	shl    esi,cl
  8014b5:	89 f0                	mov    eax,esi
  8014b7:	89 c6                	mov    esi,eax
  8014b9:	48 8b 0d 60 eb bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfeb60]        # 400020 <page_map>
  8014c0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014c3:	48 98                	cdqe   
  8014c5:	48 c1 e0 02          	shl    rax,0x2
  8014c9:	48 01 c8             	add    rax,rcx
  8014cc:	09 f2                	or     edx,esi
  8014ce:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  8014d0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014d3:	c1 e0 05             	shl    eax,0x5
  8014d6:	89 c2                	mov    edx,eax
  8014d8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8014db:	01 d0                	add    eax,edx
  8014dd:	48 98                	cdqe   
  8014df:	eb 1c                	jmp    8014fd <req_a_page+0xce>
        for(int j=0;j<32;j++){
  8014e1:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8014e5:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8014e9:	0f 8e 60 ff ff ff    	jle    80144f <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  8014ef:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8014f3:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8014f7:	0f 8e 46 ff ff ff    	jle    801443 <req_a_page+0x14>

            }
        }
    }
}
  8014fd:	5d                   	pop    rbp
  8014fe:	c3                   	ret    

00000000008014ff <free_page>:

int free_page(char *paddr){
  8014ff:	f3 0f 1e fa          	endbr64 
  801503:	55                   	push   rbp
  801504:	48 89 e5             	mov    rbp,rsp
  801507:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  80150b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80150f:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801515:	85 c0                	test   eax,eax
  801517:	0f 48 c2             	cmovs  eax,edx
  80151a:	c1 f8 0c             	sar    eax,0xc
  80151d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  801520:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801523:	8d 50 1f             	lea    edx,[rax+0x1f]
  801526:	85 c0                	test   eax,eax
  801528:	0f 48 c2             	cmovs  eax,edx
  80152b:	c1 f8 05             	sar    eax,0x5
  80152e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  801531:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801534:	99                   	cdq    
  801535:	c1 ea 1b             	shr    edx,0x1b
  801538:	01 d0                	add    eax,edx
  80153a:	83 e0 1f             	and    eax,0x1f
  80153d:	29 d0                	sub    eax,edx
  80153f:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  801542:	48 8b 15 d7 ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfead7]        # 400020 <page_map>
  801549:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80154c:	48 98                	cdqe   
  80154e:	48 c1 e0 02          	shl    rax,0x2
  801552:	48 01 d0             	add    rax,rdx
  801555:	8b 10                	mov    edx,DWORD PTR [rax]
  801557:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80155a:	be 01 00 00 00       	mov    esi,0x1
  80155f:	89 c1                	mov    ecx,eax
  801561:	d3 e6                	shl    esi,cl
  801563:	89 f0                	mov    eax,esi
  801565:	f7 d0                	not    eax
  801567:	89 c6                	mov    esi,eax
  801569:	48 8b 0d b0 ea bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfeab0]        # 400020 <page_map>
  801570:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801573:	48 98                	cdqe   
  801575:	48 c1 e0 02          	shl    rax,0x2
  801579:	48 01 c8             	add    rax,rcx
  80157c:	21 f2                	and    edx,esi
  80157e:	89 10                	mov    DWORD PTR [rax],edx
}
  801580:	90                   	nop
  801581:	5d                   	pop    rbp
  801582:	c3                   	ret    

0000000000801583 <check_page>:
int check_page(int num){
  801583:	f3 0f 1e fa          	endbr64 
  801587:	55                   	push   rbp
  801588:	48 89 e5             	mov    rbp,rsp
  80158b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  80158e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801591:	8d 50 1f             	lea    edx,[rax+0x1f]
  801594:	85 c0                	test   eax,eax
  801596:	0f 48 c2             	cmovs  eax,edx
  801599:	c1 f8 05             	sar    eax,0x5
  80159c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  80159f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8015a2:	99                   	cdq    
  8015a3:	c1 ea 1b             	shr    edx,0x1b
  8015a6:	01 d0                	add    eax,edx
  8015a8:	83 e0 1f             	and    eax,0x1f
  8015ab:	29 d0                	sub    eax,edx
  8015ad:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  8015b0:	48 8b 15 69 ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfea69]        # 400020 <page_map>
  8015b7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015ba:	48 98                	cdqe   
  8015bc:	48 c1 e0 02          	shl    rax,0x2
  8015c0:	48 01 d0             	add    rax,rdx
  8015c3:	8b 10                	mov    edx,DWORD PTR [rax]
  8015c5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8015c8:	be 01 00 00 00       	mov    esi,0x1
  8015cd:	89 c1                	mov    ecx,eax
  8015cf:	d3 e6                	shl    esi,cl
  8015d1:	89 f0                	mov    eax,esi
  8015d3:	21 d0                	and    eax,edx
  8015d5:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  8015d8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  8015db:	5d                   	pop    rbp
  8015dc:	c3                   	ret    

00000000008015dd <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  8015dd:	f3 0f 1e fa          	endbr64 
  8015e1:	55                   	push   rbp
  8015e2:	48 89 e5             	mov    rbp,rsp
  8015e5:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  8015e8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8015eb:	c1 e0 0c             	shl    eax,0xc
}
  8015ee:	5d                   	pop    rbp
  8015ef:	c3                   	ret    

00000000008015f0 <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  8015f0:	f3 0f 1e fa          	endbr64 
  8015f4:	55                   	push   rbp
  8015f5:	48 89 e5             	mov    rbp,rsp
  8015f8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8015fc:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  8015ff:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  801602:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801606:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  80160d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801611:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801614:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801617:	89 c0                	mov    eax,eax
  801619:	25 00 f0 ff ff       	and    eax,0xfffff000
  80161e:	48 09 c2             	or     rdx,rax
  801621:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801625:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  801628:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80162c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80162f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801632:	48 98                	cdqe   
  801634:	48 09 c2             	or     rdx,rax
  801637:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80163b:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80163e:	90                   	nop
  80163f:	5d                   	pop    rbp
  801640:	c3                   	ret    

0000000000801641 <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  801641:	f3 0f 1e fa          	endbr64 
  801645:	55                   	push   rbp
  801646:	48 89 e5             	mov    rbp,rsp
  801649:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80164d:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  801650:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  801653:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801657:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  80165e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801662:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801665:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  801668:	0c 81                	or     al,0x81
  80166a:	89 c0                	mov    eax,eax
  80166c:	48 09 c2             	or     rdx,rax
  80166f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801673:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  801676:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801679:	25 00 00 00 c0       	and    eax,0xc0000000
  80167e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  801681:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801685:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801688:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80168b:	48 09 c2             	or     rdx,rax
  80168e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801692:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801695:	90                   	nop
  801696:	5d                   	pop    rbp
  801697:	c3                   	ret    

0000000000801698 <set_2mb_pde>:
void set_2mb_pde(page_item* pde,int pa)
{
  801698:	f3 0f 1e fa          	endbr64 
  80169c:	55                   	push   rbp
  80169d:	48 89 e5             	mov    rbp,rsp
  8016a0:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8016a4:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    *pde=0;
  8016a7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016ab:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT;
  8016b2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016b6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8016b9:	48 0d 81 10 00 00    	or     rax,0x1081
  8016bf:	48 89 c2             	mov    rdx,rax
  8016c2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016c6:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  8016c9:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8016cc:	25 00 00 c0 ff       	and    eax,0xffc00000
  8016d1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  8016d4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016d8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8016db:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016de:	48 09 c2             	or     rdx,rax
  8016e1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016e5:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8016e8:	90                   	nop
  8016e9:	5d                   	pop    rbp
  8016ea:	c3                   	ret    

00000000008016eb <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  8016eb:	f3 0f 1e fa          	endbr64 
  8016ef:	55                   	push   rbp
  8016f0:	48 89 e5             	mov    rbp,rsp
  8016f3:	48 83 ec 20          	sub    rsp,0x20
  8016f7:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8016fb:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  8016fe:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  801703:	75 18                	jne    80171d <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  801705:	b8 00 00 00 00       	mov    eax,0x0
  80170a:	e8 20 fd ff ff       	call   80142f <req_a_page>
  80170f:	89 c7                	mov    edi,eax
  801711:	e8 c7 fe ff ff       	call   8015dd <get_phyaddr>
  801716:	48 98                	cdqe   
  801718:	e9 a5 00 00 00       	jmp    8017c2 <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  80171d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801721:	89 c2                	mov    edx,eax
  801723:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801726:	89 c6                	mov    esi,eax
  801728:	89 d7                	mov    edi,edx
  80172a:	e8 52 01 00 00       	call   801881 <is_pgs_ava>
  80172f:	85 c0                	test   eax,eax
  801731:	75 0c                	jne    80173f <req_page_at+0x54>
  801733:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80173a:	e9 83 00 00 00       	jmp    8017c2 <req_page_at+0xd7>
    int pgni=base/4096;
  80173f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801743:	48 c1 e8 0c          	shr    rax,0xc
  801747:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  80174a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80174d:	8d 50 1f             	lea    edx,[rax+0x1f]
  801750:	85 c0                	test   eax,eax
  801752:	0f 48 c2             	cmovs  eax,edx
  801755:	c1 f8 05             	sar    eax,0x5
  801758:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  80175b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80175e:	99                   	cdq    
  80175f:	c1 ea 1b             	shr    edx,0x1b
  801762:	01 d0                	add    eax,edx
  801764:	83 e0 1f             	and    eax,0x1f
  801767:	29 d0                	sub    eax,edx
  801769:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  80176c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801773:	eb 40                	jmp    8017b5 <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  801775:	48 8b 15 a4 e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe8a4]        # 400020 <page_map>
  80177c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80177f:	48 98                	cdqe   
  801781:	48 c1 e0 02          	shl    rax,0x2
  801785:	48 01 d0             	add    rax,rdx
  801788:	8b 10                	mov    edx,DWORD PTR [rax]
  80178a:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80178d:	be 01 00 00 00       	mov    esi,0x1
  801792:	89 c1                	mov    ecx,eax
  801794:	d3 e6                	shl    esi,cl
  801796:	89 f0                	mov    eax,esi
  801798:	89 c6                	mov    esi,eax
  80179a:	48 8b 0d 7f e8 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe87f]        # 400020 <page_map>
  8017a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017a4:	48 98                	cdqe   
  8017a6:	48 c1 e0 02          	shl    rax,0x2
  8017aa:	48 01 c8             	add    rax,rcx
  8017ad:	09 f2                	or     edx,esi
  8017af:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  8017b1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8017b5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017b8:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8017bb:	7c b8                	jl     801775 <req_page_at+0x8a>
    }
    return 0;
  8017bd:	b8 00 00 00 00       	mov    eax,0x0

}
  8017c2:	c9                   	leave  
  8017c3:	c3                   	ret    

00000000008017c4 <chk_vm>:
int chk_vm(int base, int pgn)
{
  8017c4:	f3 0f 1e fa          	endbr64 
  8017c8:	55                   	push   rbp
  8017c9:	48 89 e5             	mov    rbp,rsp
  8017cc:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8017cf:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  8017d2:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8017d9:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  8017da:	0f 20 d8             	mov    rax,cr3
  8017dd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  8017e1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8017e4:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  8017ea:	85 c0                	test   eax,eax
  8017ec:	0f 48 c2             	cmovs  eax,edx
  8017ef:	c1 f8 16             	sar    eax,0x16
  8017f2:	48 98                	cdqe   
  8017f4:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8017fb:	00 
  8017fc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801800:	48 01 d0             	add    rax,rdx
  801803:	8b 00                	mov    eax,DWORD PTR [rax]
  801805:	89 c0                	mov    eax,eax
  801807:	25 00 f0 ff ff       	and    eax,0xfffff000
  80180c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801810:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801813:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  801819:	85 c0                	test   eax,eax
  80181b:	0f 48 c2             	cmovs  eax,edx
  80181e:	c1 f8 16             	sar    eax,0x16
  801821:	48 98                	cdqe   
  801823:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80182a:	00 
  80182b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80182f:	48 01 d0             	add    rax,rdx
  801832:	8b 00                	mov    eax,DWORD PTR [rax]
  801834:	83 e0 01             	and    eax,0x1
  801837:	85 c0                	test   eax,eax
  801839:	74 38                	je     801873 <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  80183b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80183e:	99                   	cdq    
  80183f:	c1 ea 0a             	shr    edx,0xa
  801842:	01 d0                	add    eax,edx
  801844:	25 ff ff 3f 00       	and    eax,0x3fffff
  801849:	29 d0                	sub    eax,edx
  80184b:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801851:	85 c0                	test   eax,eax
  801853:	0f 48 c2             	cmovs  eax,edx
  801856:	c1 f8 0c             	sar    eax,0xc
  801859:	48 98                	cdqe   
  80185b:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  801862:	00 
  801863:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  801867:	48 01 d0             	add    rax,rdx
  80186a:	8b 00                	mov    eax,DWORD PTR [rax]
  80186c:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  80186f:	85 c0                	test   eax,eax
  801871:	75 07                	jne    80187a <chk_vm+0xb6>
    {
        return -1;
  801873:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801878:	eb 05                	jmp    80187f <chk_vm+0xbb>
    }
    return 0;
  80187a:	b8 00 00 00 00       	mov    eax,0x0
}
  80187f:	5d                   	pop    rbp
  801880:	c3                   	ret    

0000000000801881 <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  801881:	f3 0f 1e fa          	endbr64 
  801885:	55                   	push   rbp
  801886:	48 89 e5             	mov    rbp,rsp
  801889:	48 83 ec 18          	sub    rsp,0x18
  80188d:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801890:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  801893:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801896:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80189c:	85 c0                	test   eax,eax
  80189e:	0f 48 c2             	cmovs  eax,edx
  8018a1:	c1 f8 0c             	sar    eax,0xc
  8018a4:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  8018a7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8018ae:	eb 1e                	jmp    8018ce <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  8018b0:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8018b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018b6:	01 d0                	add    eax,edx
  8018b8:	89 c7                	mov    edi,eax
  8018ba:	e8 c4 fc ff ff       	call   801583 <check_page>
  8018bf:	85 c0                	test   eax,eax
  8018c1:	74 07                	je     8018ca <is_pgs_ava+0x49>
  8018c3:	b8 00 00 00 00       	mov    eax,0x0
  8018c8:	eb 11                	jmp    8018db <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  8018ca:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8018ce:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8018d1:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  8018d4:	7c da                	jl     8018b0 <is_pgs_ava+0x2f>
    }
    return 1;
  8018d6:	b8 01 00 00 00       	mov    eax,0x1

}
  8018db:	c9                   	leave  
  8018dc:	c3                   	ret    

00000000008018dd <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  8018dd:	f3 0f 1e fa          	endbr64 
  8018e1:	55                   	push   rbp
  8018e2:	48 89 e5             	mov    rbp,rsp
  8018e5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8018e9:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  8018ed:	c6 05 4c e9 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe94c],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  8018f4:	c6 05 46 e9 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe946],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  8018fb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8018ff:	48 89 05 42 e9 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe942],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  801906:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80190a:	48 89 05 3f e9 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe93f],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  801911:	c7 05 45 e9 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe945],0x1        # 400260 <vols+0x20>
  801918:	00 00 00 
    return 0;
  80191b:	b8 00 00 00 00       	mov    eax,0x0
}
  801920:	5d                   	pop    rbp
  801921:	c3                   	ret    

0000000000801922 <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  801922:	f3 0f 1e fa          	endbr64 
  801926:	55                   	push   rbp
  801927:	48 89 e5             	mov    rbp,rsp
  80192a:	48 83 ec 20          	sub    rsp,0x20
  80192e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  801931:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801938:	eb 38                	jmp    801972 <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  80193a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80193d:	48 98                	cdqe   
  80193f:	48 c1 e0 04          	shl    rax,0x4
  801943:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801949:	8b 00                	mov    eax,DWORD PTR [rax]
  80194b:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80194e:	75 1e                	jne    80196e <sys_mkfifo+0x4c>
  801950:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801953:	48 98                	cdqe   
  801955:	48 c1 e0 04          	shl    rax,0x4
  801959:	48 05 68 1e 40 00    	add    rax,0x401e68
  80195f:	8b 00                	mov    eax,DWORD PTR [rax]
  801961:	83 f8 01             	cmp    eax,0x1
  801964:	75 08                	jne    80196e <sys_mkfifo+0x4c>
            return i;
  801966:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801969:	e9 a6 00 00 00       	jmp    801a14 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  80196e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801972:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801976:	7e c2                	jle    80193a <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  801978:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80197f:	e9 81 00 00 00       	jmp    801a05 <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  801984:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801987:	48 98                	cdqe   
  801989:	48 c1 e0 04          	shl    rax,0x4
  80198d:	48 05 68 1e 40 00    	add    rax,0x401e68
  801993:	8b 00                	mov    eax,DWORD PTR [rax]
  801995:	85 c0                	test   eax,eax
  801997:	75 68                	jne    801a01 <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  801999:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80199c:	48 98                	cdqe   
  80199e:	48 c1 e0 04          	shl    rax,0x4
  8019a2:	48 05 68 1e 40 00    	add    rax,0x401e68
  8019a8:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  8019ae:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019b1:	48 98                	cdqe   
  8019b3:	48 c1 e0 04          	shl    rax,0x4
  8019b7:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  8019be:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8019c1:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  8019c3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019c6:	48 98                	cdqe   
  8019c8:	48 c1 e0 04          	shl    rax,0x4
  8019cc:	48 05 64 1e 40 00    	add    rax,0x401e64
  8019d2:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  8019d8:	b8 00 00 00 00       	mov    eax,0x0
  8019dd:	e8 4d fa ff ff       	call   80142f <req_a_page>
  8019e2:	89 c7                	mov    edi,eax
  8019e4:	e8 f4 fb ff ff       	call   8015dd <get_phyaddr>
  8019e9:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8019ec:	48 63 d2             	movsxd rdx,edx
  8019ef:	48 c1 e2 04          	shl    rdx,0x4
  8019f3:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  8019fa:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  8019fc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019ff:	eb 13                	jmp    801a14 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801a01:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801a05:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  801a09:	0f 8e 75 ff ff ff    	jle    801984 <sys_mkfifo+0x62>
        }
    }
    return -1;
  801a0f:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801a14:	c9                   	leave  
  801a15:	c3                   	ret    

0000000000801a16 <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801a16:	f3 0f 1e fa          	endbr64 
  801a1a:	55                   	push   rbp
  801a1b:	48 89 e5             	mov    rbp,rsp
  801a1e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801a21:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801a28:	eb 4a                	jmp    801a74 <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801a2a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a2d:	48 98                	cdqe   
  801a2f:	48 c1 e0 04          	shl    rax,0x4
  801a33:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801a39:	8b 00                	mov    eax,DWORD PTR [rax]
  801a3b:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801a3e:	75 30                	jne    801a70 <sys_rmfifo+0x5a>
  801a40:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a43:	48 98                	cdqe   
  801a45:	48 c1 e0 04          	shl    rax,0x4
  801a49:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a4f:	8b 00                	mov    eax,DWORD PTR [rax]
  801a51:	83 f8 01             	cmp    eax,0x1
  801a54:	75 1a                	jne    801a70 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801a56:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a59:	48 98                	cdqe   
  801a5b:	48 c1 e0 04          	shl    rax,0x4
  801a5f:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a65:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801a6b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a6e:	eb 0f                	jmp    801a7f <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801a70:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801a74:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801a78:	7e b0                	jle    801a2a <sys_rmfifo+0x14>
        }
    }
    return -1;
  801a7a:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801a7f:	5d                   	pop    rbp
  801a80:	c3                   	ret    

0000000000801a81 <free_vol>:
int free_vol(int voli)
{
  801a81:	f3 0f 1e fa          	endbr64 
  801a85:	55                   	push   rbp
  801a86:	48 89 e5             	mov    rbp,rsp
  801a89:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801a8c:	c7 05 ca e7 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe7ca],0x0        # 400260 <vols+0x20>
  801a93:	00 00 00 
    return 0;
  801a96:	b8 00 00 00 00       	mov    eax,0x0
}
  801a9b:	5d                   	pop    rbp
  801a9c:	c3                   	ret    

0000000000801a9d <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801a9d:	f3 0f 1e fa          	endbr64 
  801aa1:	55                   	push   rbp
  801aa2:	48 89 e5             	mov    rbp,rsp
  801aa5:	48 83 ec 20          	sub    rsp,0x20
  801aa9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801aac:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801aaf:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801ab3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801aba:	e9 d8 00 00 00       	jmp    801b97 <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801abf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ac2:	48 63 d0             	movsxd rdx,eax
  801ac5:	48 89 d0             	mov    rax,rdx
  801ac8:	48 c1 e0 02          	shl    rax,0x2
  801acc:	48 01 d0             	add    rax,rdx
  801acf:	48 c1 e0 03          	shl    rax,0x3
  801ad3:	48 05 60 02 40 00    	add    rax,0x400260
  801ad9:	8b 00                	mov    eax,DWORD PTR [rax]
  801adb:	85 c0                	test   eax,eax
  801add:	0f 85 b0 00 00 00    	jne    801b93 <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801ae3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ae6:	48 63 d0             	movsxd rdx,eax
  801ae9:	48 89 d0             	mov    rax,rdx
  801aec:	48 c1 e0 02          	shl    rax,0x2
  801af0:	48 01 d0             	add    rax,rdx
  801af3:	48 c1 e0 03          	shl    rax,0x3
  801af7:	48 05 60 02 40 00    	add    rax,0x400260
  801afd:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801b03:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801b06:	48 63 d0             	movsxd rdx,eax
  801b09:	48 89 d0             	mov    rax,rdx
  801b0c:	48 01 c0             	add    rax,rax
  801b0f:	48 01 d0             	add    rax,rdx
  801b12:	48 c1 e0 03          	shl    rax,0x3
  801b16:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801b1d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b20:	48 63 d0             	movsxd rdx,eax
  801b23:	48 89 d0             	mov    rax,rdx
  801b26:	48 c1 e0 02          	shl    rax,0x2
  801b2a:	48 01 d0             	add    rax,rdx
  801b2d:	48 c1 e0 03          	shl    rax,0x3
  801b31:	48 05 58 02 40 00    	add    rax,0x400258
  801b37:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801b3a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b3d:	89 c7                	mov    edi,eax
  801b3f:	e8 0b 1b 00 00       	call   80364f <get_drv>
  801b44:	48 89 c2             	mov    rdx,rax
  801b47:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b4a:	48 63 c8             	movsxd rcx,eax
  801b4d:	48 89 c8             	mov    rax,rcx
  801b50:	48 c1 e0 02          	shl    rax,0x2
  801b54:	48 01 c8             	add    rax,rcx
  801b57:	48 c1 e0 03          	shl    rax,0x3
  801b5b:	48 05 48 02 40 00    	add    rax,0x400248
  801b61:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801b64:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b67:	48 63 d0             	movsxd rdx,eax
  801b6a:	48 89 d0             	mov    rax,rdx
  801b6d:	48 c1 e0 02          	shl    rax,0x2
  801b71:	48 01 d0             	add    rax,rdx
  801b74:	48 c1 e0 03          	shl    rax,0x3
  801b78:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801b7f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801b83:	48 89 c6             	mov    rsi,rax
  801b86:	48 89 d7             	mov    rdi,rdx
  801b89:	e8 96 7f 00 00       	call   809b24 <strcpy>
            return i;
  801b8e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b91:	eb 13                	jmp    801ba6 <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801b93:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801b97:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801b9b:	0f 8e 1e ff ff ff    	jle    801abf <reg_vol+0x22>
        }
    }
    return -1;
  801ba1:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801ba6:	c9                   	leave  
  801ba7:	c3                   	ret    

0000000000801ba8 <sys_open>:
int sys_open(char *path, int mode)
{
  801ba8:	f3 0f 1e fa          	endbr64 
  801bac:	55                   	push   rbp
  801bad:	48 89 e5             	mov    rbp,rsp
  801bb0:	53                   	push   rbx
  801bb1:	48 81 ec 28 02 00 00 	sub    rsp,0x228
  801bb8:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
  801bbf:	89 b5 d4 fd ff ff    	mov    DWORD PTR [rbp-0x22c],esi
    {

    }
    //根据文件路径找到相应的卷
    char volname[26];
    int i=0,rec=0;
  801bc5:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801bcc:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
    for(;path[i]!='/'&&i<26;i++)
  801bd3:	eb 20                	jmp    801bf5 <sys_open+0x4d>
        volname[i]=path[i];
  801bd5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801bd8:	48 63 d0             	movsxd rdx,eax
  801bdb:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801be2:	48 01 d0             	add    rax,rdx
  801be5:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  801be8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801beb:	48 98                	cdqe   
  801bed:	88 54 05 c0          	mov    BYTE PTR [rbp+rax*1-0x40],dl
    for(;path[i]!='/'&&i<26;i++)
  801bf1:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801bf5:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801bf8:	48 63 d0             	movsxd rdx,eax
  801bfb:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801c02:	48 01 d0             	add    rax,rdx
  801c05:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801c08:	3c 2f                	cmp    al,0x2f
  801c0a:	74 06                	je     801c12 <sys_open+0x6a>
  801c0c:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801c10:	7e c3                	jle    801bd5 <sys_open+0x2d>
    volname[i]='\0';
  801c12:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c15:	48 98                	cdqe   
  801c17:	c6 44 05 c0 00       	mov    BYTE PTR [rbp+rax*1-0x40],0x0
    if(!path[i+1])
  801c1c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c1f:	48 98                	cdqe   
  801c21:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801c25:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801c2c:	48 01 d0             	add    rax,rdx
  801c2f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801c32:	84 c0                	test   al,al
  801c34:	75 0a                	jne    801c40 <sys_open+0x98>
        return -2;//是根目录
  801c36:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  801c3b:	e9 2b 04 00 00       	jmp    80206b <sys_open+0x4c3>
    rec=i;
  801c40:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c43:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(i=0;i<MAX_VOLUMES;i++)
  801c46:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801c4d:	eb 52                	jmp    801ca1 <sys_open+0xf9>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801c4f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c52:	48 63 d0             	movsxd rdx,eax
  801c55:	48 89 d0             	mov    rax,rdx
  801c58:	48 c1 e0 02          	shl    rax,0x2
  801c5c:	48 01 d0             	add    rax,rdx
  801c5f:	48 c1 e0 03          	shl    rax,0x3
  801c63:	48 05 60 02 40 00    	add    rax,0x400260
  801c69:	8b 00                	mov    eax,DWORD PTR [rax]
  801c6b:	85 c0                	test   eax,eax
  801c6d:	74 2e                	je     801c9d <sys_open+0xf5>
        (strcmp(vols[i].name,volname)==0))
  801c6f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c72:	48 63 d0             	movsxd rdx,eax
  801c75:	48 89 d0             	mov    rax,rdx
  801c78:	48 c1 e0 02          	shl    rax,0x2
  801c7c:	48 01 d0             	add    rax,rdx
  801c7f:	48 c1 e0 03          	shl    rax,0x3
  801c83:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801c8a:	48 8d 45 c0          	lea    rax,[rbp-0x40]
  801c8e:	48 89 c6             	mov    rsi,rax
  801c91:	48 89 d7             	mov    rdi,rdx
  801c94:	e8 2b 80 00 00       	call   809cc4 <strcmp>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801c99:	85 c0                	test   eax,eax
  801c9b:	74 0c                	je     801ca9 <sys_open+0x101>
    for(i=0;i<MAX_VOLUMES;i++)
  801c9d:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801ca1:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801ca5:	7e a8                	jle    801c4f <sys_open+0xa7>
  801ca7:	eb 01                	jmp    801caa <sys_open+0x102>
            break;
  801ca9:	90                   	nop
    if(i==MAX_VOLUMES)return -1;
  801caa:	83 7d ec 1a          	cmp    DWORD PTR [rbp-0x14],0x1a
  801cae:	75 0a                	jne    801cba <sys_open+0x112>
  801cb0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801cb5:	e9 b1 03 00 00       	jmp    80206b <sys_open+0x4c3>
    driver_args arg={
  801cba:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  801cc1:	b8 00 00 00 00       	mov    eax,0x0
  801cc6:	b9 17 00 00 00       	mov    ecx,0x17
  801ccb:	48 89 d7             	mov    rdi,rdx
  801cce:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  801cd1:	48 89 fa             	mov    rdx,rdi
  801cd4:	89 02                	mov    DWORD PTR [rdx],eax
  801cd6:	48 83 c2 04          	add    rdx,0x4
            .path=path+rec+1
  801cda:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801cdd:	48 98                	cdqe   
  801cdf:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801ce3:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801cea:	48 01 d0             	add    rax,rdx
    driver_args arg={
  801ced:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    vfs_dir_entry dir;
    vfs_dir_entry res;
    int voln=i;
  801cf4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801cf7:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    if(vols[i].fs->find(path+rec+1,dir,&res)==-1)//找不到文件 ((driver*)vols[i].fs_drv)->find(&arg)==-1
  801cfa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801cfd:	48 63 d0             	movsxd rdx,eax
  801d00:	48 89 d0             	mov    rax,rdx
  801d03:	48 c1 e0 02          	shl    rax,0x2
  801d07:	48 01 d0             	add    rax,rdx
  801d0a:	48 c1 e0 03          	shl    rax,0x3
  801d0e:	48 05 58 02 40 00    	add    rax,0x400258
  801d14:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801d17:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  801d1b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801d1e:	48 98                	cdqe   
  801d20:	48 8d 48 01          	lea    rcx,[rax+0x1]
  801d24:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801d2b:	48 01 c1             	add    rcx,rax
  801d2e:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
  801d35:	ff b5 f8 fe ff ff    	push   QWORD PTR [rbp-0x108]
  801d3b:	ff b5 f0 fe ff ff    	push   QWORD PTR [rbp-0x110]
  801d41:	ff b5 e8 fe ff ff    	push   QWORD PTR [rbp-0x118]
  801d47:	ff b5 e0 fe ff ff    	push   QWORD PTR [rbp-0x120]
  801d4d:	ff b5 d8 fe ff ff    	push   QWORD PTR [rbp-0x128]
  801d53:	ff b5 d0 fe ff ff    	push   QWORD PTR [rbp-0x130]
  801d59:	ff b5 c8 fe ff ff    	push   QWORD PTR [rbp-0x138]
  801d5f:	ff b5 c0 fe ff ff    	push   QWORD PTR [rbp-0x140]
  801d65:	ff b5 b8 fe ff ff    	push   QWORD PTR [rbp-0x148]
  801d6b:	ff b5 b0 fe ff ff    	push   QWORD PTR [rbp-0x150]
  801d71:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
  801d77:	ff b5 a0 fe ff ff    	push   QWORD PTR [rbp-0x160]
  801d7d:	48 89 c6             	mov    rsi,rax
  801d80:	48 89 cf             	mov    rdi,rcx
  801d83:	ff d2                	call   rdx
  801d85:	48 83 c4 60          	add    rsp,0x60
  801d89:	83 f8 ff             	cmp    eax,0xffffffff
  801d8c:	75 49                	jne    801dd7 <sys_open+0x22f>
    {
        if(mode&FILE_MODE_WRITE) {
  801d8e:	8b 85 d4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x22c]
  801d94:	83 e0 02             	and    eax,0x2
  801d97:	85 c0                	test   eax,eax
  801d99:	74 32                	je     801dcd <sys_open+0x225>
            return ((driver *) vols[i].fs_drv)->touch(&arg);//这里之后要改
  801d9b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d9e:	48 63 d0             	movsxd rdx,eax
  801da1:	48 89 d0             	mov    rax,rdx
  801da4:	48 c1 e0 02          	shl    rax,0x2
  801da8:	48 01 d0             	add    rax,rdx
  801dab:	48 c1 e0 03          	shl    rax,0x3
  801daf:	48 05 50 02 40 00    	add    rax,0x400250
  801db5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801db8:	48 8b 50 4c          	mov    rdx,QWORD PTR [rax+0x4c]
  801dbc:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  801dc3:	48 89 c7             	mov    rdi,rax
  801dc6:	ff d2                	call   rdx
  801dc8:	e9 9e 02 00 00       	jmp    80206b <sys_open+0x4c3>
        }else
            return -1;
  801dcd:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801dd2:	e9 94 02 00 00       	jmp    80206b <sys_open+0x4c3>
    }
    vfs_dir_entry entry=res;//=arg.entry;
  801dd7:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
  801dde:	48 8b 95 48 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b8]
  801de5:	48 89 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rax
  801dec:	48 89 95 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdx
  801df3:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
  801dfa:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
  801e01:	48 89 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],rax
  801e08:	48 89 95 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],rdx
  801e0f:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
  801e16:	48 8b 95 68 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x198]
  801e1d:	48 89 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],rax
  801e24:	48 89 95 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],rdx
  801e2b:	48 8b 85 70 fe ff ff 	mov    rax,QWORD PTR [rbp-0x190]
  801e32:	48 8b 95 78 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x188]
  801e39:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
  801e40:	48 89 95 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdx
  801e47:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
  801e4e:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
  801e55:	48 89 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rax
  801e5c:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
  801e63:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
  801e6a:	48 8b 95 98 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x168]
  801e71:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
  801e78:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
    int j=-1;
  801e7f:	c7 45 e8 ff ff ff ff 	mov    DWORD PTR [rbp-0x18],0xffffffff
    for(i=0;i<MAX_OPEN_FILES;i++)
  801e86:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801e8d:	eb 5c                	jmp    801eeb <sys_open+0x343>
    {
        if(opened[i].voln==voln&&opened[i].id==entry.id)
  801e8f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801e92:	48 63 d0             	movsxd rdx,eax
  801e95:	48 89 d0             	mov    rax,rdx
  801e98:	48 01 c0             	add    rax,rax
  801e9b:	48 01 d0             	add    rax,rdx
  801e9e:	48 c1 e0 05          	shl    rax,0x5
  801ea2:	48 05 68 06 40 00    	add    rax,0x400668
  801ea8:	8b 00                	mov    eax,DWORD PTR [rax]
  801eaa:	39 45 e0             	cmp    DWORD PTR [rbp-0x20],eax
  801ead:	75 38                	jne    801ee7 <sys_open+0x33f>
  801eaf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801eb2:	48 63 d0             	movsxd rdx,eax
  801eb5:	48 89 d0             	mov    rax,rdx
  801eb8:	48 01 c0             	add    rax,rax
  801ebb:	48 01 d0             	add    rax,rdx
  801ebe:	48 c1 e0 05          	shl    rax,0x5
  801ec2:	48 05 74 06 40 00    	add    rax,0x400674
  801ec8:	8b 10                	mov    edx,DWORD PTR [rax]
  801eca:	8b 85 f4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x20c]
  801ed0:	39 c2                	cmp    edx,eax
  801ed2:	75 13                	jne    801ee7 <sys_open+0x33f>
        {
            if(mode==FILE_MODE_WRITE)
  801ed4:	83 bd d4 fd ff ff 02 	cmp    DWORD PTR [rbp-0x22c],0x2
  801edb:	75 0a                	jne    801ee7 <sys_open+0x33f>
            {
                return -1;//读模式会重新给一个fno但是指向同一个文件
  801edd:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801ee2:	e9 84 01 00 00       	jmp    80206b <sys_open+0x4c3>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801ee7:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801eeb:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801eef:	7e 9e                	jle    801e8f <sys_open+0x2e7>
            }
        }
    }
    for(i=0;i<MAX_OPEN_FILES;i++)
  801ef1:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801ef8:	eb 2b                	jmp    801f25 <sys_open+0x37d>
    {
        if(!opened[i].mode) {
  801efa:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801efd:	48 63 d0             	movsxd rdx,eax
  801f00:	48 89 d0             	mov    rax,rdx
  801f03:	48 01 c0             	add    rax,rax
  801f06:	48 01 d0             	add    rax,rdx
  801f09:	48 c1 e0 05          	shl    rax,0x5
  801f0d:	48 05 64 06 40 00    	add    rax,0x400664
  801f13:	8b 00                	mov    eax,DWORD PTR [rax]
  801f15:	85 c0                	test   eax,eax
  801f17:	75 08                	jne    801f21 <sys_open+0x379>
            j = i;
  801f19:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f1c:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            break;
  801f1f:	eb 0a                	jmp    801f2b <sys_open+0x383>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f21:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801f25:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801f29:	7e cf                	jle    801efa <sys_open+0x352>
        }
    }
    if(j==-1)return -1;
  801f2b:	83 7d e8 ff          	cmp    DWORD PTR [rbp-0x18],0xffffffff
  801f2f:	75 0a                	jne    801f3b <sys_open+0x393>
  801f31:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801f36:	e9 30 01 00 00       	jmp    80206b <sys_open+0x4c3>
    opened[j]=entry;
  801f3b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801f3e:	48 63 d0             	movsxd rdx,eax
  801f41:	48 89 d0             	mov    rax,rdx
  801f44:	48 01 c0             	add    rax,rax
  801f47:	48 01 d0             	add    rax,rdx
  801f4a:	48 c1 e0 05          	shl    rax,0x5
  801f4e:	48 05 60 06 40 00    	add    rax,0x400660
  801f54:	48 8b 8d e0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x220]
  801f5b:	48 8b 9d e8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x218]
  801f62:	48 89 08             	mov    QWORD PTR [rax],rcx
  801f65:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
  801f69:	48 8b 8d f0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x210]
  801f70:	48 8b 9d f8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x208]
  801f77:	48 89 48 10          	mov    QWORD PTR [rax+0x10],rcx
  801f7b:	48 89 58 18          	mov    QWORD PTR [rax+0x18],rbx
  801f7f:	48 8b 8d 00 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x200]
  801f86:	48 8b 9d 08 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1f8]
  801f8d:	48 89 48 20          	mov    QWORD PTR [rax+0x20],rcx
  801f91:	48 89 58 28          	mov    QWORD PTR [rax+0x28],rbx
  801f95:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
  801f9c:	48 8b 9d 18 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1e8]
  801fa3:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
  801fa7:	48 89 58 38          	mov    QWORD PTR [rax+0x38],rbx
  801fab:	48 8b 8d 20 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e0]
  801fb2:	48 8b 9d 28 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1d8]
  801fb9:	48 89 48 40          	mov    QWORD PTR [rax+0x40],rcx
  801fbd:	48 89 58 48          	mov    QWORD PTR [rax+0x48],rbx
  801fc1:	48 8b 8d 30 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1d0]
  801fc8:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
  801fcf:	48 89 48 50          	mov    QWORD PTR [rax+0x50],rcx
  801fd3:	48 89 58 58          	mov    QWORD PTR [rax+0x58],rbx
    opened[j].fno=i;
  801fd7:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801fda:	48 63 d0             	movsxd rdx,eax
  801fdd:	48 89 d0             	mov    rax,rdx
  801fe0:	48 01 c0             	add    rax,rax
  801fe3:	48 01 d0             	add    rax,rdx
  801fe6:	48 c1 e0 05          	shl    rax,0x5
  801fea:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  801ff1:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ff4:	89 02                	mov    DWORD PTR [rdx],eax
    opened[j].link_c++;
  801ff6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801ff9:	48 63 d0             	movsxd rdx,eax
  801ffc:	48 89 d0             	mov    rax,rdx
  801fff:	48 01 c0             	add    rax,rax
  802002:	48 01 d0             	add    rax,rdx
  802005:	48 c1 e0 05          	shl    rax,0x5
  802009:	48 05 6c 06 40 00    	add    rax,0x40066c
  80200f:	8b 00                	mov    eax,DWORD PTR [rax]
  802011:	8d 48 01             	lea    ecx,[rax+0x1]
  802014:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802017:	48 63 d0             	movsxd rdx,eax
  80201a:	48 89 d0             	mov    rax,rdx
  80201d:	48 01 c0             	add    rax,rax
  802020:	48 01 d0             	add    rax,rdx
  802023:	48 c1 e0 05          	shl    rax,0x5
  802027:	48 05 6c 06 40 00    	add    rax,0x40066c
  80202d:	89 08                	mov    DWORD PTR [rax],ecx
    add_proc_openf(&opened[j]);
  80202f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802032:	48 63 d0             	movsxd rdx,eax
  802035:	48 89 d0             	mov    rax,rdx
  802038:	48 01 c0             	add    rax,rax
  80203b:	48 01 d0             	add    rax,rdx
  80203e:	48 c1 e0 05          	shl    rax,0x5
  802042:	48 05 60 06 40 00    	add    rax,0x400660
  802048:	48 89 c7             	mov    rdi,rax
  80204b:	e8 7e 27 00 00       	call   8047ce <add_proc_openf>
    return opened[j].fno;
  802050:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802053:	48 63 d0             	movsxd rdx,eax
  802056:	48 89 d0             	mov    rax,rdx
  802059:	48 01 c0             	add    rax,rax
  80205c:	48 01 d0             	add    rax,rdx
  80205f:	48 c1 e0 05          	shl    rax,0x5
  802063:	48 05 60 06 40 00    	add    rax,0x400660
  802069:	8b 00                	mov    eax,DWORD PTR [rax]
}
  80206b:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  80206f:	c9                   	leave  
  802070:	c3                   	ret    

0000000000802071 <sys_close>:
int sys_close(int fno)
{
  802071:	f3 0f 1e fa          	endbr64 
  802075:	55                   	push   rbp
  802076:	48 89 e5             	mov    rbp,rsp
  802079:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  80207c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802083:	eb 64                	jmp    8020e9 <sys_close+0x78>
    {
        if(opened[i].fno==fno)
  802085:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802088:	48 63 d0             	movsxd rdx,eax
  80208b:	48 89 d0             	mov    rax,rdx
  80208e:	48 01 c0             	add    rax,rax
  802091:	48 01 d0             	add    rax,rdx
  802094:	48 c1 e0 05          	shl    rax,0x5
  802098:	48 05 60 06 40 00    	add    rax,0x400660
  80209e:	8b 00                	mov    eax,DWORD PTR [rax]
  8020a0:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8020a3:	75 40                	jne    8020e5 <sys_close+0x74>
        {
            opened[i].link_c--;
  8020a5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020a8:	48 63 d0             	movsxd rdx,eax
  8020ab:	48 89 d0             	mov    rax,rdx
  8020ae:	48 01 c0             	add    rax,rax
  8020b1:	48 01 d0             	add    rax,rdx
  8020b4:	48 c1 e0 05          	shl    rax,0x5
  8020b8:	48 05 6c 06 40 00    	add    rax,0x40066c
  8020be:	8b 00                	mov    eax,DWORD PTR [rax]
  8020c0:	8d 48 ff             	lea    ecx,[rax-0x1]
  8020c3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020c6:	48 63 d0             	movsxd rdx,eax
  8020c9:	48 89 d0             	mov    rax,rdx
  8020cc:	48 01 c0             	add    rax,rax
  8020cf:	48 01 d0             	add    rax,rdx
  8020d2:	48 c1 e0 05          	shl    rax,0x5
  8020d6:	48 05 6c 06 40 00    	add    rax,0x40066c
  8020dc:	89 08                	mov    DWORD PTR [rax],ecx
            return 0;
  8020de:	b8 00 00 00 00       	mov    eax,0x0
  8020e3:	eb 0f                	jmp    8020f4 <sys_close+0x83>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  8020e5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8020e9:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8020ed:	7e 96                	jle    802085 <sys_close+0x14>
        }
    }
    return -1;
  8020ef:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8020f4:	5d                   	pop    rbp
  8020f5:	c3                   	ret    

00000000008020f6 <sys_write>:
int sys_write(int fno, char *src, int len)
{
  8020f6:	f3 0f 1e fa          	endbr64 
  8020fa:	55                   	push   rbp
  8020fb:	48 89 e5             	mov    rbp,rsp
  8020fe:	48 83 ec 20          	sub    rsp,0x20
  802102:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802105:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802109:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  80210c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80210f:	89 c7                	mov    edi,eax
  802111:	e8 7d 01 00 00       	call   802293 <get_vfs_entry>
  802116:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  80211a:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80211f:	75 07                	jne    802128 <sys_write+0x32>
  802121:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802126:	eb 5d                	jmp    802185 <sys_write+0x8f>
    if(f->type==FTYPE_REG)
  802128:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80212c:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80212f:	85 c0                	test   eax,eax
  802131:	75 18                	jne    80214b <sys_write+0x55>
    {
        return vfs_write_file(f,src,len);
  802133:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802136:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  80213a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80213e:	48 89 ce             	mov    rsi,rcx
  802141:	48 89 c7             	mov    rdi,rax
  802144:	e8 67 03 00 00       	call   8024b0 <vfs_write_file>
  802149:	eb 3a                	jmp    802185 <sys_write+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  80214b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80214f:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802152:	83 f8 01             	cmp    eax,0x1
  802155:	75 29                	jne    802180 <sys_write+0x8a>
    {
        int block=get_according_bnr(f);
  802157:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80215b:	48 89 c7             	mov    rdi,rax
  80215e:	e8 5b 04 00 00       	call   8025be <get_according_bnr>
  802163:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return write_block(f->dev,block,src,len);
  802166:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80216a:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  80216d:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  802170:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802174:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  802177:	89 c7                	mov    edi,eax
  802179:	e8 24 08 00 00       	call   8029a2 <write_block>
  80217e:	eb 05                	jmp    802185 <sys_write+0x8f>
    }
    return -1;
  802180:	b8 ff ff ff ff       	mov    eax,0xffffffff
            .src_addr=src,
            .len=len,
            .pos=pos
    };
    return ((driver*)vols[f->voln].fs_drv)->write(&args); */
}
  802185:	c9                   	leave  
  802186:	c3                   	ret    

0000000000802187 <sys_read>:
int sys_read(int fno, char *dist,  int len)
{
  802187:	f3 0f 1e fa          	endbr64 
  80218b:	55                   	push   rbp
  80218c:	48 89 e5             	mov    rbp,rsp
  80218f:	48 83 ec 20          	sub    rsp,0x20
  802193:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802196:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80219a:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  80219d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8021a0:	89 c7                	mov    edi,eax
  8021a2:	e8 ec 00 00 00       	call   802293 <get_vfs_entry>
  8021a7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  8021ab:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8021b0:	75 07                	jne    8021b9 <sys_read+0x32>
  8021b2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8021b7:	eb 5d                	jmp    802216 <sys_read+0x8f>
    if(f->type==FTYPE_REG)
  8021b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021bd:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8021c0:	85 c0                	test   eax,eax
  8021c2:	75 18                	jne    8021dc <sys_read+0x55>
    {
        return vfs_read_file(f,dist,len);
  8021c4:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8021c7:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8021cb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021cf:	48 89 ce             	mov    rsi,rcx
  8021d2:	48 89 c7             	mov    rdi,rax
  8021d5:	e8 37 02 00 00       	call   802411 <vfs_read_file>
  8021da:	eb 3a                	jmp    802216 <sys_read+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  8021dc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021e0:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8021e3:	83 f8 01             	cmp    eax,0x1
  8021e6:	75 29                	jne    802211 <sys_read+0x8a>
    {
        int block=get_according_bnr(f);
  8021e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021ec:	48 89 c7             	mov    rdi,rax
  8021ef:	e8 ca 03 00 00       	call   8025be <get_according_bnr>
  8021f4:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return read_block(f->dev,block,dist,len);
  8021f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021fb:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8021fe:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  802201:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802205:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  802208:	89 c7                	mov    edi,eax
  80220a:	e8 10 08 00 00       	call   802a1f <read_block>
  80220f:	eb 05                	jmp    802216 <sys_read+0x8f>
    }
    return -1;
  802211:	b8 ff ff ff ff       	mov    eax,0xffffffff
    //         .len=len,
    //         .pos=pos,
    //         .entry=*f
    // };
    // return ((driver*)vols[f->voln].fs_drv)->read(&args);
}
  802216:	c9                   	leave  
  802217:	c3                   	ret    

0000000000802218 <sys_seek>:
int sys_seek(int fno, int offset, int origin)
{
  802218:	f3 0f 1e fa          	endbr64 
  80221c:	55                   	push   rbp
  80221d:	48 89 e5             	mov    rbp,rsp
  802220:	48 83 ec 20          	sub    rsp,0x20
  802224:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802227:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80222a:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  80222d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802230:	89 c7                	mov    edi,eax
  802232:	e8 5c 00 00 00       	call   802293 <get_vfs_entry>
  802237:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  80223b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802240:	75 07                	jne    802249 <sys_seek+0x31>
  802242:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802247:	eb 14                	jmp    80225d <sys_seek+0x45>
    f->ptr=offset+origin;
  802249:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80224c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80224f:	01 c2                	add    edx,eax
  802251:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802255:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
    return 0;
  802258:	b8 00 00 00 00       	mov    eax,0x0
}
  80225d:	c9                   	leave  
  80225e:	c3                   	ret    

000000000080225f <sys_tell>:
int sys_tell(int fno)
{
  80225f:	f3 0f 1e fa          	endbr64 
  802263:	55                   	push   rbp
  802264:	48 89 e5             	mov    rbp,rsp
  802267:	48 83 ec 20          	sub    rsp,0x20
  80226b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    vfs_dir_entry *f= get_vfs_entry(fno);
  80226e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802271:	89 c7                	mov    edi,eax
  802273:	e8 1b 00 00 00       	call   802293 <get_vfs_entry>
  802278:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  80227c:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802281:	75 07                	jne    80228a <sys_tell+0x2b>
  802283:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802288:	eb 07                	jmp    802291 <sys_tell+0x32>
    return f->ptr;
  80228a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80228e:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  802291:	c9                   	leave  
  802292:	c3                   	ret    

0000000000802293 <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  802293:	f3 0f 1e fa          	endbr64 
  802297:	55                   	push   rbp
  802298:	48 89 e5             	mov    rbp,rsp
  80229b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  80229e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8022a5:	eb 3f                	jmp    8022e6 <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  8022a7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8022aa:	48 63 d0             	movsxd rdx,eax
  8022ad:	48 89 d0             	mov    rax,rdx
  8022b0:	48 01 c0             	add    rax,rax
  8022b3:	48 01 d0             	add    rax,rdx
  8022b6:	48 c1 e0 05          	shl    rax,0x5
  8022ba:	48 05 60 06 40 00    	add    rax,0x400660
  8022c0:	8b 00                	mov    eax,DWORD PTR [rax]
  8022c2:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8022c5:	75 1b                	jne    8022e2 <get_vfs_entry+0x4f>
        {
            return &opened[i];
  8022c7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8022ca:	48 63 d0             	movsxd rdx,eax
  8022cd:	48 89 d0             	mov    rax,rdx
  8022d0:	48 01 c0             	add    rax,rax
  8022d3:	48 01 d0             	add    rax,rdx
  8022d6:	48 c1 e0 05          	shl    rax,0x5
  8022da:	48 05 60 06 40 00    	add    rax,0x400660
  8022e0:	eb 0f                	jmp    8022f1 <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  8022e2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8022e6:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8022ea:	7e bb                	jle    8022a7 <get_vfs_entry+0x14>
        }
    }
    return NULL;
  8022ec:	b8 00 00 00 00       	mov    eax,0x0
}
  8022f1:	5d                   	pop    rbp
  8022f2:	c3                   	ret    

00000000008022f3 <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  8022f3:	f3 0f 1e fa          	endbr64 
  8022f7:	55                   	push   rbp
  8022f8:	48 89 e5             	mov    rbp,rsp
  8022fb:	48 83 ec 10          	sub    rsp,0x10
  8022ff:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  802303:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802307:	48 89 c7             	mov    rdi,rax
  80230a:	e8 a0 04 00 00       	call   8027af <wait_on_buf>
    if(bh->b_count==0)return -1;
  80230f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802313:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  802317:	84 c0                	test   al,al
  802319:	75 07                	jne    802322 <brelse+0x2f>
  80231b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802320:	eb 32                	jmp    802354 <brelse+0x61>
    bh->b_count--;
  802322:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802326:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  80232a:	8d 50 ff             	lea    edx,[rax-0x1]
  80232d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802331:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  802334:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802338:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  80233c:	84 c0                	test   al,al
  80233e:	75 0f                	jne    80234f <brelse+0x5c>
        vmfree(bh->b_data);
  802340:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802344:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802347:	48 89 c7             	mov    rdi,rax
  80234a:	e8 db ed ff ff       	call   80112a <vmfree>
    return 0;
  80234f:	b8 00 00 00 00       	mov    eax,0x0
}
  802354:	c9                   	leave  
  802355:	c3                   	ret    

0000000000802356 <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  802356:	f3 0f 1e fa          	endbr64 
  80235a:	55                   	push   rbp
  80235b:	48 89 e5             	mov    rbp,rsp
  80235e:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  802365:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  80236b:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  802371:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  802377:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  80237d:	89 d6                	mov    esi,edx
  80237f:	89 c7                	mov    edi,eax
  802381:	e8 78 02 00 00       	call   8025fe <get_buf>
  802386:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  80238a:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80238f:	75 09                	jne    80239a <bread+0x44>
  802391:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  802398:	eb 75                	jmp    80240f <bread+0xb9>
    if(!bh->b_uptodate)
  80239a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80239e:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  8023a2:	84 c0                	test   al,al
  8023a4:	75 65                	jne    80240b <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  8023a6:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  8023ac:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  8023af:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  8023b6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023ba:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8023bd:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  8023c3:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  8023ca:	02 00 00 
        arg.lba=bh->b_blocknr;
  8023cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023d1:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8023d5:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  8023db:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  8023e2:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  8023e5:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  8023ec:	48 89 c7             	mov    rdi,rax
  8023ef:	e8 82 12 00 00       	call   803676 <make_request>
  8023f4:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  8023f7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8023fa:	89 c7                	mov    edi,eax
  8023fc:	e8 88 15 00 00       	call   803989 <wait_on_req>
        clear_req(reqi);
  802401:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802404:	89 c7                	mov    edi,eax
  802406:	e8 ae 15 00 00       	call   8039b9 <clear_req>
    }
    return bh;
  80240b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80240f:	c9                   	leave  
  802410:	c3                   	ret    

0000000000802411 <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  802411:	f3 0f 1e fa          	endbr64 
  802415:	55                   	push   rbp
  802416:	48 89 e5             	mov    rbp,rsp
  802419:	48 83 ec 40          	sub    rsp,0x40
  80241d:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802421:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  802425:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  802428:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80242c:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  80242f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802432:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802436:	48 89 c7             	mov    rdi,rax
  802439:	e8 80 01 00 00       	call   8025be <get_according_bnr>
  80243e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  802441:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  802444:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802447:	89 d6                	mov    esi,edx
  802449:	89 c7                	mov    edi,eax
  80244b:	e8 06 ff ff ff       	call   802356 <bread>
  802450:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802454:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802457:	ba 00 02 00 00       	mov    edx,0x200
  80245c:	39 d0                	cmp    eax,edx
  80245e:	0f 4f c2             	cmovg  eax,edx
  802461:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  802464:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  802467:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80246b:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  80246e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802472:	48 89 ce             	mov    rsi,rcx
  802475:	48 89 c7             	mov    rdi,rax
  802478:	e8 a9 75 00 00       	call   809a26 <memcpy>
        len-=BLOCK_SIZE;
  80247d:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  802484:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802488:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80248b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80248e:	01 c2                	add    edx,eax
  802490:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802494:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  802497:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80249b:	48 89 c7             	mov    rdi,rax
  80249e:	e8 50 fe ff ff       	call   8022f3 <brelse>
    }while(len>0);
  8024a3:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  8024a7:	7f 89                	jg     802432 <vfs_read_file+0x21>
    return 0;
  8024a9:	b8 00 00 00 00       	mov    eax,0x0
}
  8024ae:	c9                   	leave  
  8024af:	c3                   	ret    

00000000008024b0 <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  8024b0:	f3 0f 1e fa          	endbr64 
  8024b4:	55                   	push   rbp
  8024b5:	48 89 e5             	mov    rbp,rsp
  8024b8:	48 83 ec 40          	sub    rsp,0x40
  8024bc:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  8024c0:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  8024c4:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  8024c7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024cb:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8024ce:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  8024d1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024d5:	48 89 c7             	mov    rdi,rax
  8024d8:	e8 e1 00 00 00       	call   8025be <get_according_bnr>
  8024dd:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  8024e0:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8024e3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8024e6:	89 d6                	mov    esi,edx
  8024e8:	89 c7                	mov    edi,eax
  8024ea:	e8 0f 01 00 00       	call   8025fe <get_buf>
  8024ef:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8024f3:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8024f6:	ba 00 02 00 00       	mov    edx,0x200
  8024fb:	39 d0                	cmp    eax,edx
  8024fd:	0f 4f c2             	cmovg  eax,edx
  802500:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  802503:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  802506:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80250a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80250d:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802511:	48 89 ce             	mov    rsi,rcx
  802514:	48 89 c7             	mov    rdi,rax
  802517:	e8 0a 75 00 00       	call   809a26 <memcpy>
        len-=BLOCK_SIZE;
  80251c:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  802523:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802527:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80252a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80252d:	01 c2                	add    edx,eax
  80252f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802533:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  802536:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80253a:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  80253e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  802542:	48 89 c7             	mov    rdi,rax
  802545:	e8 a9 fd ff ff       	call   8022f3 <brelse>
    }while(len>0);
  80254a:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  80254e:	7f 81                	jg     8024d1 <vfs_write_file+0x21>
    return 0;
  802550:	b8 00 00 00 00       	mov    eax,0x0
}
  802555:	c9                   	leave  
  802556:	c3                   	ret    

0000000000802557 <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  802557:	f3 0f 1e fa          	endbr64 
  80255b:	55                   	push   rbp
  80255c:	48 89 e5             	mov    rbp,rsp
  80255f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  802563:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  802566:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  802569:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  80256d:	74 20                	je     80258f <vfs_seek_file+0x38>
  80256f:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  802573:	7f 3f                	jg     8025b4 <vfs_seek_file+0x5d>
  802575:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  802579:	74 08                	je     802583 <vfs_seek_file+0x2c>
  80257b:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  80257f:	74 23                	je     8025a4 <vfs_seek_file+0x4d>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  802581:	eb 31                	jmp    8025b4 <vfs_seek_file+0x5d>
        f->ptr=offset;
  802583:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802587:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80258a:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  80258d:	eb 26                	jmp    8025b5 <vfs_seek_file+0x5e>
        f->ptr+=offset;
  80258f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802593:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  802596:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802599:	01 c2                	add    edx,eax
  80259b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80259f:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8025a2:	eb 11                	jmp    8025b5 <vfs_seek_file+0x5e>
        f->ptr=f->size;
  8025a4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025a8:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  8025ab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025af:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8025b2:	eb 01                	jmp    8025b5 <vfs_seek_file+0x5e>
        break;
  8025b4:	90                   	nop
    }
    return f->ptr;
  8025b5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025b9:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  8025bc:	5d                   	pop    rbp
  8025bd:	c3                   	ret    

00000000008025be <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  8025be:	f3 0f 1e fa          	endbr64 
  8025c2:	55                   	push   rbp
  8025c3:	48 89 e5             	mov    rbp,rsp
  8025c6:	48 83 ec 10          	sub    rsp,0x10
  8025ca:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  8025ce:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025d2:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8025d5:	48 63 d0             	movsxd rdx,eax
  8025d8:	48 89 d0             	mov    rax,rdx
  8025db:	48 c1 e0 02          	shl    rax,0x2
  8025df:	48 01 d0             	add    rax,rdx
  8025e2:	48 c1 e0 03          	shl    rax,0x3
  8025e6:	48 05 58 02 40 00    	add    rax,0x400258
  8025ec:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8025ef:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8025f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025f7:	48 89 c7             	mov    rdi,rax
  8025fa:	ff d2                	call   rdx

}
  8025fc:	c9                   	leave  
  8025fd:	c3                   	ret    

00000000008025fe <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  8025fe:	f3 0f 1e fa          	endbr64 
  802602:	55                   	push   rbp
  802603:	48 89 e5             	mov    rbp,rsp
  802606:	48 83 ec 20          	sub    rsp,0x20
  80260a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80260d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802610:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802617:	e9 b9 00 00 00       	jmp    8026d5 <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  80261c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80261f:	48 98                	cdqe   
  802621:	48 c1 e0 06          	shl    rax,0x6
  802625:	48 05 90 26 40 00    	add    rax,0x402690
  80262b:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80262e:	0f b7 c0             	movzx  eax,ax
  802631:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802634:	0f 85 97 00 00 00    	jne    8026d1 <get_buf+0xd3>
  80263a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80263d:	48 98                	cdqe   
  80263f:	48 c1 e0 06          	shl    rax,0x6
  802643:	48 05 88 26 40 00    	add    rax,0x402688
  802649:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80264c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80264f:	48 98                	cdqe   
  802651:	48 39 c2             	cmp    rdx,rax
  802654:	75 7b                	jne    8026d1 <get_buf+0xd3>
        {
            repeat:
  802656:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  802657:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80265a:	48 98                	cdqe   
  80265c:	48 c1 e0 06          	shl    rax,0x6
  802660:	48 05 80 26 40 00    	add    rax,0x402680
  802666:	48 89 c7             	mov    rdi,rax
  802669:	e8 41 01 00 00       	call   8027af <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  80266e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802671:	48 98                	cdqe   
  802673:	48 c1 e0 06          	shl    rax,0x6
  802677:	48 05 94 26 40 00    	add    rax,0x402694
  80267d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802680:	84 c0                	test   al,al
  802682:	74 02                	je     802686 <get_buf+0x88>
                goto repeat;
  802684:	eb d1                	jmp    802657 <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  802686:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802689:	48 98                	cdqe   
  80268b:	48 c1 e0 06          	shl    rax,0x6
  80268f:	48 05 90 26 40 00    	add    rax,0x402690
  802695:	0f b7 00             	movzx  eax,WORD PTR [rax]
  802698:	0f b7 c0             	movzx  eax,ax
  80269b:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80269e:	75 30                	jne    8026d0 <get_buf+0xd2>
  8026a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026a3:	48 98                	cdqe   
  8026a5:	48 c1 e0 06          	shl    rax,0x6
  8026a9:	48 05 88 26 40 00    	add    rax,0x402688
  8026af:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8026b2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8026b5:	48 98                	cdqe   
  8026b7:	48 39 c2             	cmp    rdx,rax
  8026ba:	75 14                	jne    8026d0 <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  8026bc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026bf:	48 98                	cdqe   
  8026c1:	48 c1 e0 06          	shl    rax,0x6
  8026c5:	48 05 80 26 40 00    	add    rax,0x402680
  8026cb:	e9 dd 00 00 00       	jmp    8027ad <get_buf+0x1af>
                continue;
  8026d0:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8026d1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8026d5:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8026d9:	0f 8e 3d ff ff ff    	jle    80261c <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8026df:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8026e6:	e9 b8 00 00 00       	jmp    8027a3 <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  8026eb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8026ee:	48 98                	cdqe   
  8026f0:	48 c1 e0 06          	shl    rax,0x6
  8026f4:	48 05 94 26 40 00    	add    rax,0x402694
  8026fa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8026fd:	84 c0                	test   al,al
  8026ff:	0f 85 9a 00 00 00    	jne    80279f <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  802705:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802708:	48 98                	cdqe   
  80270a:	48 c1 e0 06          	shl    rax,0x6
  80270e:	48 05 93 26 40 00    	add    rax,0x402693
  802714:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802717:	84 c0                	test   al,al
  802719:	74 2e                	je     802749 <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  80271b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80271e:	48 98                	cdqe   
  802720:	48 c1 e0 06          	shl    rax,0x6
  802724:	48 05 80 26 40 00    	add    rax,0x402680
  80272a:	48 89 c7             	mov    rdi,rax
  80272d:	e8 2c 02 00 00       	call   80295e <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  802732:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802735:	48 98                	cdqe   
  802737:	48 c1 e0 06          	shl    rax,0x6
  80273b:	48 05 80 26 40 00    	add    rax,0x402680
  802741:	48 89 c7             	mov    rdi,rax
  802744:	e8 66 00 00 00       	call   8027af <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  802749:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80274c:	48 98                	cdqe   
  80274e:	48 c1 e0 06          	shl    rax,0x6
  802752:	48 05 94 26 40 00    	add    rax,0x402694
  802758:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80275b:	8d 50 01             	lea    edx,[rax+0x1]
  80275e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802761:	48 98                	cdqe   
  802763:	48 c1 e0 06          	shl    rax,0x6
  802767:	48 05 94 26 40 00    	add    rax,0x402694
  80276d:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  80276f:	b8 00 00 00 00       	mov    eax,0x0
  802774:	e8 22 e9 ff ff       	call   80109b <vmalloc>
  802779:	48 89 c2             	mov    rdx,rax
  80277c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80277f:	48 98                	cdqe   
  802781:	48 c1 e0 06          	shl    rax,0x6
  802785:	48 05 80 26 40 00    	add    rax,0x402680
  80278b:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  80278e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802791:	48 98                	cdqe   
  802793:	48 c1 e0 06          	shl    rax,0x6
  802797:	48 05 80 26 40 00    	add    rax,0x402680
  80279d:	eb 0e                	jmp    8027ad <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80279f:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8027a3:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  8027a7:	0f 8e 3e ff ff ff    	jle    8026eb <get_buf+0xed>
        }
    }
}
  8027ad:	c9                   	leave  
  8027ae:	c3                   	ret    

00000000008027af <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  8027af:	f3 0f 1e fa          	endbr64 
  8027b3:	55                   	push   rbp
  8027b4:	48 89 e5             	mov    rbp,rsp
  8027b7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  8027bb:	90                   	nop
  8027bc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8027c0:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  8027c4:	84 c0                	test   al,al
  8027c6:	75 f4                	jne    8027bc <wait_on_buf+0xd>
    
}
  8027c8:	90                   	nop
  8027c9:	90                   	nop
  8027ca:	5d                   	pop    rbp
  8027cb:	c3                   	ret    

00000000008027cc <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  8027cc:	f3 0f 1e fa          	endbr64 
  8027d0:	55                   	push   rbp
  8027d1:	48 89 e5             	mov    rbp,rsp
  8027d4:	48 83 ec 40          	sub    rsp,0x40
  8027d8:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    device *blkdev=get_dev(dev);
  8027db:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8027de:	89 c7                	mov    edi,eax
  8027e0:	e8 3c 0e 00 00       	call   803621 <get_dev>
  8027e5:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    buffer_head* bh=bread(dev,0);
  8027e9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8027ec:	be 00 00 00 00       	mov    esi,0x0
  8027f1:	89 c7                	mov    edi,eax
  8027f3:	e8 5e fb ff ff       	call   802356 <bread>
  8027f8:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!bh)return -1;
  8027fc:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  802801:	75 0a                	jne    80280d <scan_dev+0x41>
  802803:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802808:	e9 4f 01 00 00       	jmp    80295c <scan_dev+0x190>
    dpt_t* dpte=bh->b_data+0x1be;
  80280d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802811:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802814:	48 05 be 01 00 00    	add    rax,0x1be
  80281a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  80281e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802825:	e9 17 01 00 00       	jmp    802941 <scan_dev+0x175>
    {
        blkdev->par[i].type=dpte->type;
  80282a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80282e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802831:	0f b6 d0             	movzx  edx,al
  802834:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  802838:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80283b:	48 63 c8             	movsxd rcx,eax
  80283e:	48 89 c8             	mov    rax,rcx
  802841:	48 01 c0             	add    rax,rax
  802844:	48 01 c8             	add    rax,rcx
  802847:	48 c1 e0 02          	shl    rax,0x2
  80284b:	48 01 f0             	add    rax,rsi
  80284e:	48 83 c0 40          	add    rax,0x40
  802852:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
        int stlba=dpte->start_lba;
  802855:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802859:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80285c:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
        blkdev->par[i].start_sec=stlba;
  80285f:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  802863:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802866:	48 63 d0             	movsxd rdx,eax
  802869:	48 89 d0             	mov    rax,rdx
  80286c:	48 01 c0             	add    rax,rax
  80286f:	48 01 d0             	add    rax,rdx
  802872:	48 c1 e0 02          	shl    rax,0x2
  802876:	48 01 c8             	add    rax,rcx
  802879:	48 8d 50 40          	lea    rdx,[rax+0x40]
  80287d:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802880:	89 02                	mov    DWORD PTR [rdx],eax
        int i;
        for(i=0;i<MAX_FS;i++)
  802882:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  802889:	eb 68                	jmp    8028f3 <scan_dev+0x127>
        {
            if(fs[i].read_superblock&&fs[i].read_superblock(dev,stlba)==0)
  80288b:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80288e:	48 63 d0             	movsxd rdx,eax
  802891:	48 89 d0             	mov    rax,rdx
  802894:	48 01 c0             	add    rax,rax
  802897:	48 01 d0             	add    rax,rdx
  80289a:	48 c1 e0 03          	shl    rax,0x3
  80289e:	48 05 80 23 40 00    	add    rax,0x402380
  8028a4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8028a7:	48 85 c0             	test   rax,rax
  8028aa:	74 43                	je     8028ef <scan_dev+0x123>
  8028ac:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8028af:	48 63 d0             	movsxd rdx,eax
  8028b2:	48 89 d0             	mov    rax,rdx
  8028b5:	48 01 c0             	add    rax,rax
  8028b8:	48 01 d0             	add    rax,rdx
  8028bb:	48 c1 e0 03          	shl    rax,0x3
  8028bf:	48 05 80 23 40 00    	add    rax,0x402380
  8028c5:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8028c8:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8028cb:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8028ce:	89 d6                	mov    esi,edx
  8028d0:	89 c7                	mov    edi,eax
  8028d2:	ff d1                	call   rcx
  8028d4:	85 c0                	test   eax,eax
  8028d6:	75 17                	jne    8028ef <scan_dev+0x123>
            {
                reg_vol(dev,i,blkdev->name);//识别成功，注册卷
  8028d8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8028dc:	48 8d 50 14          	lea    rdx,[rax+0x14]
  8028e0:	8b 4d f0             	mov    ecx,DWORD PTR [rbp-0x10]
  8028e3:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8028e6:	89 ce                	mov    esi,ecx
  8028e8:	89 c7                	mov    edi,eax
  8028ea:	e8 ae f1 ff ff       	call   801a9d <reg_vol>
        for(i=0;i<MAX_FS;i++)
  8028ef:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8028f3:	83 7d f0 1f          	cmp    DWORD PTR [rbp-0x10],0x1f
  8028f7:	7e 92                	jle    80288b <scan_dev+0xbf>
            }
        }
        if(i==MAX_FS)
  8028f9:	83 7d f0 20          	cmp    DWORD PTR [rbp-0x10],0x20
  8028fd:	75 0f                	jne    80290e <scan_dev+0x142>
        {
            printf("err:unrecognised partition fs.\n");
  8028ff:	bf 68 1e 81 00       	mov    edi,0x811e68
  802904:	b8 00 00 00 00       	mov    eax,0x0
  802909:	e8 a1 e3 ff ff       	call   800caf <printf>
        }

        blkdev->par[i].end_sec=dpte->end_lba;
  80290e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802912:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802915:	89 c1                	mov    ecx,eax
  802917:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  80291b:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80291e:	48 63 d0             	movsxd rdx,eax
  802921:	48 89 d0             	mov    rax,rdx
  802924:	48 01 c0             	add    rax,rax
  802927:	48 01 d0             	add    rax,rdx
  80292a:	48 c1 e0 02          	shl    rax,0x2
  80292e:	48 01 f0             	add    rax,rsi
  802931:	48 83 c0 40          	add    rax,0x40
  802935:	89 48 04             	mov    DWORD PTR [rax+0x4],ecx
        dpte++;
  802938:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  80293d:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802941:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  802945:	0f 8e df fe ff ff    	jle    80282a <scan_dev+0x5e>
    }
    brelse(bh);
  80294b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80294f:	48 89 c7             	mov    rdi,rax
  802952:	e8 9c f9 ff ff       	call   8022f3 <brelse>
    return 0;
  802957:	b8 00 00 00 00       	mov    eax,0x0
}
  80295c:	c9                   	leave  
  80295d:	c3                   	ret    

000000000080295e <sync_buf>:

int sync_buf(buffer_head* bh)
{
  80295e:	f3 0f 1e fa          	endbr64 
  802962:	55                   	push   rbp
  802963:	48 89 e5             	mov    rbp,rsp
  802966:	48 83 ec 20          	sub    rsp,0x20
  80296a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  80296e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802972:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  802976:	0f b7 c0             	movzx  eax,ax
  802979:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  80297c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802980:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  802984:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  802987:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80298b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80298e:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  802991:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802994:	b9 00 02 00 00       	mov    ecx,0x200
  802999:	89 c7                	mov    edi,eax
  80299b:	e8 02 00 00 00       	call   8029a2 <write_block>

}
  8029a0:	c9                   	leave  
  8029a1:	c3                   	ret    

00000000008029a2 <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  8029a2:	f3 0f 1e fa          	endbr64 
  8029a6:	55                   	push   rbp
  8029a7:	48 89 e5             	mov    rbp,rsp
  8029aa:	48 83 ec 30          	sub    rsp,0x30
  8029ae:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8029b1:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8029b4:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  8029b8:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  8029bb:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8029be:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8029c1:	89 d6                	mov    esi,edx
  8029c3:	89 c7                	mov    edi,eax
  8029c5:	e8 34 fc ff ff       	call   8025fe <get_buf>
  8029ca:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8029ce:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8029d1:	ba 00 02 00 00       	mov    edx,0x200
  8029d6:	39 d0                	cmp    eax,edx
  8029d8:	0f 4f c2             	cmovg  eax,edx
  8029db:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  8029de:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8029e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029e5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8029e8:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  8029ec:	48 89 ce             	mov    rsi,rcx
  8029ef:	48 89 c7             	mov    rdi,rax
  8029f2:	e8 2f 70 00 00       	call   809a26 <memcpy>
        len-=BLOCK_SIZE;
  8029f7:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  8029fe:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a02:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802a06:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a0a:	48 89 c7             	mov    rdi,rax
  802a0d:	e8 e1 f8 ff ff       	call   8022f3 <brelse>
    }while(len>0);
  802a12:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802a16:	7f a3                	jg     8029bb <write_block+0x19>
    return 0;
  802a18:	b8 00 00 00 00       	mov    eax,0x0
}
  802a1d:	c9                   	leave  
  802a1e:	c3                   	ret    

0000000000802a1f <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  802a1f:	f3 0f 1e fa          	endbr64 
  802a23:	55                   	push   rbp
  802a24:	48 89 e5             	mov    rbp,rsp
  802a27:	48 83 ec 30          	sub    rsp,0x30
  802a2b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802a2e:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802a31:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802a35:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  802a38:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802a3b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802a3e:	89 d6                	mov    esi,edx
  802a40:	89 c7                	mov    edi,eax
  802a42:	e8 0f f9 ff ff       	call   802356 <bread>
  802a47:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802a4b:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802a4e:	ba 00 02 00 00       	mov    edx,0x200
  802a53:	39 d0                	cmp    eax,edx
  802a55:	0f 4f c2             	cmovg  eax,edx
  802a58:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  802a5b:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802a5e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a62:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802a65:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802a69:	48 89 ce             	mov    rsi,rcx
  802a6c:	48 89 c7             	mov    rdi,rax
  802a6f:	e8 b2 6f 00 00       	call   809a26 <memcpy>
        len-=BLOCK_SIZE;
  802a74:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  802a7b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a7f:	48 89 c7             	mov    rdi,rax
  802a82:	e8 6c f8 ff ff       	call   8022f3 <brelse>
    }while(len>0);
  802a87:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802a8b:	7f ab                	jg     802a38 <read_block+0x19>
    return 0;
  802a8d:	b8 00 00 00 00       	mov    eax,0x0
}
  802a92:	c9                   	leave  
  802a93:	c3                   	ret    

0000000000802a94 <init_vfs>:

int init_vfs()
{
  802a94:	f3 0f 1e fa          	endbr64 
  802a98:	55                   	push   rbp
  802a99:	48 89 e5             	mov    rbp,rsp
  802a9c:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  802aa0:	48 8b 05 d9 59 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc059d9]        # 408480 <dev_tree>
  802aa7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  802aab:	eb 40                	jmp    802aed <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  802aad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802ab1:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  802ab7:	48 c1 f8 02          	sar    rax,0x2
  802abb:	48 89 c2             	mov    rdx,rax
  802abe:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  802ac5:	18 9c 8f 
  802ac8:	48 0f af c2          	imul   rax,rdx
  802acc:	89 c7                	mov    edi,eax
  802ace:	e8 f9 fc ff ff       	call   8027cc <scan_dev>
  802ad3:	85 c0                	test   eax,eax
  802ad5:	74 07                	je     802ade <init_vfs+0x4a>
  802ad7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802adc:	eb 1b                	jmp    802af9 <init_vfs+0x65>
    for(;p;p=p->next)
  802ade:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802ae2:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802ae9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  802aed:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802af2:	75 b9                	jne    802aad <init_vfs+0x19>
    }
    return 0;
  802af4:	b8 00 00 00 00       	mov    eax,0x0
  802af9:	c9                   	leave  
  802afa:	c3                   	ret    

0000000000802afb <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  802afb:	f3 0f 1e fa          	endbr64 
  802aff:	55                   	push   rbp
  802b00:	48 89 e5             	mov    rbp,rsp
}
  802b03:	90                   	nop
  802b04:	5d                   	pop    rbp
  802b05:	c3                   	ret    

0000000000802b06 <load_driver>:
int load_driver(char *path)
{
  802b06:	f3 0f 1e fa          	endbr64 
  802b0a:	55                   	push   rbp
  802b0b:	48 89 e5             	mov    rbp,rsp
  802b0e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  802b12:	90                   	nop
  802b13:	5d                   	pop    rbp
  802b14:	c3                   	ret    

0000000000802b15 <reg_device>:

int reg_device(device* dev)
{
  802b15:	f3 0f 1e fa          	endbr64 
  802b19:	55                   	push   rbp
  802b1a:	48 89 e5             	mov    rbp,rsp
  802b1d:	53                   	push   rbx
  802b1e:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  802b22:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  802b29:	e9 42 01 00 00       	jmp    802c70 <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  802b2e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802b31:	48 63 d0             	movsxd rdx,eax
  802b34:	48 89 d0             	mov    rax,rdx
  802b37:	48 c1 e0 02          	shl    rax,0x2
  802b3b:	48 01 d0             	add    rax,rdx
  802b3e:	48 c1 e0 02          	shl    rax,0x2
  802b42:	48 01 d0             	add    rax,rdx
  802b45:	48 c1 e0 03          	shl    rax,0x3
  802b49:	48 05 90 2e 40 00    	add    rax,0x402e90
  802b4f:	8b 00                	mov    eax,DWORD PTR [rax]
  802b51:	85 c0                	test   eax,eax
  802b53:	0f 85 13 01 00 00    	jne    802c6c <reg_device+0x157>
        {
            devs[i]=*dev;
  802b59:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802b5c:	48 63 d0             	movsxd rdx,eax
  802b5f:	48 89 d0             	mov    rax,rdx
  802b62:	48 c1 e0 02          	shl    rax,0x2
  802b66:	48 01 d0             	add    rax,rdx
  802b69:	48 c1 e0 02          	shl    rax,0x2
  802b6d:	48 01 d0             	add    rax,rdx
  802b70:	48 c1 e0 03          	shl    rax,0x3
  802b74:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  802b7b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802b7f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802b82:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802b86:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802b89:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802b8d:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802b91:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802b95:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802b99:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802b9d:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802ba1:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802ba5:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802ba9:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802bad:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802bb1:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802bb5:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802bb9:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802bbd:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802bc1:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802bc5:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802bc9:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802bcd:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802bd1:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802bd5:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802bd9:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802bdd:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802be1:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802be5:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802be9:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802bed:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802bf1:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802bf5:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802bf9:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802bfd:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802c04:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802c0b:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802c12:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802c19:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802c20:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802c27:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802c2e:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  802c35:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  802c3c:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  802c43:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802c46:	48 63 d0             	movsxd rdx,eax
  802c49:	48 89 d0             	mov    rax,rdx
  802c4c:	48 c1 e0 02          	shl    rax,0x2
  802c50:	48 01 d0             	add    rax,rdx
  802c53:	48 c1 e0 02          	shl    rax,0x2
  802c57:	48 01 d0             	add    rax,rdx
  802c5a:	48 c1 e0 03          	shl    rax,0x3
  802c5e:	48 05 90 2e 40 00    	add    rax,0x402e90
  802c64:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802c6a:	eb 0e                	jmp    802c7a <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  802c6c:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802c70:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  802c74:	0f 8e b4 fe ff ff    	jle    802b2e <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802c7a:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  802c7e:	75 0a                	jne    802c8a <reg_device+0x175>
        return -1;
  802c80:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802c85:	e9 6d 01 00 00       	jmp    802df7 <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802c8a:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  802c91:	00 
  802c92:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802c95:	48 63 d0             	movsxd rdx,eax
  802c98:	48 89 d0             	mov    rax,rdx
  802c9b:	48 c1 e0 02          	shl    rax,0x2
  802c9f:	48 01 d0             	add    rax,rdx
  802ca2:	48 c1 e0 02          	shl    rax,0x2
  802ca6:	48 01 d0             	add    rax,rdx
  802ca9:	48 c1 e0 03          	shl    rax,0x3
  802cad:	48 05 80 2e 40 00    	add    rax,0x402e80
  802cb3:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  802cb7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802cbb:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802cbe:	83 f8 03             	cmp    eax,0x3
  802cc1:	74 3b                	je     802cfe <reg_device+0x1e9>
  802cc3:	83 f8 03             	cmp    eax,0x3
  802cc6:	7f 4b                	jg     802d13 <reg_device+0x1fe>
  802cc8:	83 f8 01             	cmp    eax,0x1
  802ccb:	74 07                	je     802cd4 <reg_device+0x1bf>
  802ccd:	83 f8 02             	cmp    eax,0x2
  802cd0:	74 17                	je     802ce9 <reg_device+0x1d4>
  802cd2:	eb 3f                	jmp    802d13 <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  802cd4:	48 8b 05 a5 57 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc057a5]        # 408480 <dev_tree>
  802cdb:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802cdf:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  802ce6:	00 
        break;
  802ce7:	eb 34                	jmp    802d1d <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  802ce9:	48 8b 05 98 57 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05798]        # 408488 <dev_tree+0x8>
  802cf0:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802cf4:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  802cfb:	00 
        break;
  802cfc:	eb 1f                	jmp    802d1d <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  802cfe:	48 8b 05 8b 57 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0578b]        # 408490 <dev_tree+0x10>
  802d05:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802d09:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  802d10:	00 
        break;
  802d11:	eb 0a                	jmp    802d1d <reg_device+0x208>
    default:return -1;//不可能有其他情况
  802d13:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802d18:	e9 da 00 00 00       	jmp    802df7 <reg_device+0x2e2>
    }
    if(!p){
  802d1d:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  802d22:	75 2b                	jne    802d4f <reg_device+0x23a>
        *pp=neo;
  802d24:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802d28:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802d2c:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  802d2f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d33:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  802d3a:	00 00 00 00 
  802d3e:	eb 3d                	jmp    802d7d <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  802d40:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d44:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802d4b:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802d4f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d53:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802d5a:	48 85 c0             	test   rax,rax
  802d5d:	75 e1                	jne    802d40 <reg_device+0x22b>
        p->next=neo;
  802d5f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802d63:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802d67:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  802d6e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d72:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802d76:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802d7d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d81:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802d88:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802d8c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d90:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802d93:	83 f8 04             	cmp    eax,0x4
  802d96:	74 3b                	je     802dd3 <reg_device+0x2be>
  802d98:	83 f8 04             	cmp    eax,0x4
  802d9b:	7f 56                	jg     802df3 <reg_device+0x2de>
  802d9d:	83 f8 03             	cmp    eax,0x3
  802da0:	74 21                	je     802dc3 <reg_device+0x2ae>
  802da2:	83 f8 03             	cmp    eax,0x3
  802da5:	7f 4c                	jg     802df3 <reg_device+0x2de>
  802da7:	83 f8 01             	cmp    eax,0x1
  802daa:	74 07                	je     802db3 <reg_device+0x29e>
  802dac:	83 f8 02             	cmp    eax,0x2
  802daf:	74 32                	je     802de3 <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802db1:	eb 40                	jmp    802df3 <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  802db3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802db7:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802dbe:	00 00 00 
        break;
  802dc1:	eb 31                	jmp    802df4 <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  802dc3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802dc7:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802dce:	00 00 00 
        break;
  802dd1:	eb 21                	jmp    802df4 <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  802dd3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802dd7:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  802dde:	00 00 00 
        break;
  802de1:	eb 11                	jmp    802df4 <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  802de3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802de7:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  802dee:	00 00 00 
        break;
  802df1:	eb 01                	jmp    802df4 <reg_device+0x2df>
        break;
  802df3:	90                   	nop
    }
    return i;
  802df4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  802df7:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802dfb:	c9                   	leave  
  802dfc:	c3                   	ret    

0000000000802dfd <reg_driver>:


int reg_driver(driver *drv)
{
  802dfd:	f3 0f 1e fa          	endbr64 
  802e01:	55                   	push   rbp
  802e02:	48 89 e5             	mov    rbp,rsp
  802e05:	53                   	push   rbx
  802e06:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  802e0a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802e11:	e9 22 01 00 00       	jmp    802f38 <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  802e16:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802e19:	48 63 d0             	movsxd rdx,eax
  802e1c:	48 89 d0             	mov    rax,rdx
  802e1f:	48 c1 e0 02          	shl    rax,0x2
  802e23:	48 01 d0             	add    rax,rdx
  802e26:	48 c1 e0 05          	shl    rax,0x5
  802e2a:	48 05 80 58 40 00    	add    rax,0x405880
  802e30:	8b 00                	mov    eax,DWORD PTR [rax]
  802e32:	85 c0                	test   eax,eax
  802e34:	0f 85 fa 00 00 00    	jne    802f34 <reg_driver+0x137>
        {
            drvs[i]=*drv;
  802e3a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802e3d:	48 63 d0             	movsxd rdx,eax
  802e40:	48 89 d0             	mov    rax,rdx
  802e43:	48 c1 e0 02          	shl    rax,0x2
  802e47:	48 01 d0             	add    rax,rdx
  802e4a:	48 c1 e0 05          	shl    rax,0x5
  802e4e:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  802e55:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802e59:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802e5c:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802e60:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802e63:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802e67:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802e6b:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802e6f:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802e73:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802e77:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802e7b:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802e7f:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802e83:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802e87:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802e8b:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802e8f:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802e93:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802e97:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802e9b:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802e9f:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802ea3:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802ea7:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802eab:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802eaf:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802eb3:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802eb7:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802ebb:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802ebf:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802ec3:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802ec7:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802ecb:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802ecf:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802ed3:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802ed7:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802ede:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802ee5:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802eec:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802ef3:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802efa:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802f01:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802f08:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  802f0f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802f12:	48 63 d0             	movsxd rdx,eax
  802f15:	48 89 d0             	mov    rax,rdx
  802f18:	48 c1 e0 02          	shl    rax,0x2
  802f1c:	48 01 d0             	add    rax,rdx
  802f1f:	48 c1 e0 05          	shl    rax,0x5
  802f23:	48 05 80 58 40 00    	add    rax,0x405880
  802f29:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  802f2f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802f32:	eb 13                	jmp    802f47 <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  802f34:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802f38:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  802f3c:	0f 8e d4 fe ff ff    	jle    802e16 <reg_driver+0x19>
        }
    }
    return -1;
  802f42:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802f47:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802f4b:	c9                   	leave  
  802f4c:	c3                   	ret    

0000000000802f4d <sys_find_dev>:

int sys_find_dev(char *name)
{
  802f4d:	f3 0f 1e fa          	endbr64 
  802f51:	55                   	push   rbp
  802f52:	48 89 e5             	mov    rbp,rsp
  802f55:	48 83 ec 20          	sub    rsp,0x20
  802f59:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802f5d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802f64:	eb 6c                	jmp    802fd2 <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802f66:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f69:	48 63 d0             	movsxd rdx,eax
  802f6c:	48 89 d0             	mov    rax,rdx
  802f6f:	48 c1 e0 02          	shl    rax,0x2
  802f73:	48 01 d0             	add    rax,rdx
  802f76:	48 c1 e0 02          	shl    rax,0x2
  802f7a:	48 01 d0             	add    rax,rdx
  802f7d:	48 c1 e0 03          	shl    rax,0x3
  802f81:	48 05 90 2e 40 00    	add    rax,0x402e90
  802f87:	8b 00                	mov    eax,DWORD PTR [rax]
  802f89:	85 c0                	test   eax,eax
  802f8b:	74 41                	je     802fce <sys_find_dev+0x81>
  802f8d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f90:	48 63 d0             	movsxd rdx,eax
  802f93:	48 89 d0             	mov    rax,rdx
  802f96:	48 c1 e0 02          	shl    rax,0x2
  802f9a:	48 01 d0             	add    rax,rdx
  802f9d:	48 c1 e0 02          	shl    rax,0x2
  802fa1:	48 01 d0             	add    rax,rdx
  802fa4:	48 c1 e0 03          	shl    rax,0x3
  802fa8:	48 83 c0 10          	add    rax,0x10
  802fac:	48 05 80 2e 40 00    	add    rax,0x402e80
  802fb2:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802fb6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802fba:	48 89 d6             	mov    rsi,rdx
  802fbd:	48 89 c7             	mov    rdi,rax
  802fc0:	e8 ff 6c 00 00       	call   809cc4 <strcmp>
  802fc5:	85 c0                	test   eax,eax
  802fc7:	75 05                	jne    802fce <sys_find_dev+0x81>
            return i;
  802fc9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fcc:	eb 0f                	jmp    802fdd <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802fce:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802fd2:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802fd6:	7e 8e                	jle    802f66 <sys_find_dev+0x19>
    }
    return -1;
  802fd8:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802fdd:	c9                   	leave  
  802fde:	c3                   	ret    

0000000000802fdf <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  802fdf:	f3 0f 1e fa          	endbr64 
  802fe3:	55                   	push   rbp
  802fe4:	48 89 e5             	mov    rbp,rsp
  802fe7:	48 83 ec 30          	sub    rsp,0x30
  802feb:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802fef:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  802ff2:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  802ff6:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  802ffd:	eb 67                	jmp    803066 <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802fff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803002:	48 63 d0             	movsxd rdx,eax
  803005:	48 89 d0             	mov    rax,rdx
  803008:	48 c1 e0 02          	shl    rax,0x2
  80300c:	48 01 d0             	add    rax,rdx
  80300f:	48 c1 e0 02          	shl    rax,0x2
  803013:	48 01 d0             	add    rax,rdx
  803016:	48 c1 e0 03          	shl    rax,0x3
  80301a:	48 05 90 2e 40 00    	add    rax,0x402e90
  803020:	8b 00                	mov    eax,DWORD PTR [rax]
  803022:	85 c0                	test   eax,eax
  803024:	74 3c                	je     803062 <sys_operate_dev+0x83>
  803026:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803029:	48 63 d0             	movsxd rdx,eax
  80302c:	48 89 d0             	mov    rax,rdx
  80302f:	48 c1 e0 02          	shl    rax,0x2
  803033:	48 01 d0             	add    rax,rdx
  803036:	48 c1 e0 02          	shl    rax,0x2
  80303a:	48 01 d0             	add    rax,rdx
  80303d:	48 c1 e0 03          	shl    rax,0x3
  803041:	48 83 c0 10          	add    rax,0x10
  803045:	48 05 80 2e 40 00    	add    rax,0x402e80
  80304b:	48 8d 50 04          	lea    rdx,[rax+0x4]
  80304f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803053:	48 89 d6             	mov    rsi,rdx
  803056:	48 89 c7             	mov    rdi,rax
  803059:	e8 66 6c 00 00       	call   809cc4 <strcmp>
  80305e:	85 c0                	test   eax,eax
  803060:	74 0c                	je     80306e <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  803062:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803066:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80306a:	7e 93                	jle    802fff <sys_operate_dev+0x20>
  80306c:	eb 01                	jmp    80306f <sys_operate_dev+0x90>
            break;
  80306e:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  80306f:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803073:	75 0a                	jne    80307f <sys_operate_dev+0xa0>
  803075:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80307a:	e9 9c 02 00 00       	jmp    80331b <sys_operate_dev+0x33c>
    switch (func) {
  80307f:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  803083:	0f 87 8d 02 00 00    	ja     803316 <sys_operate_dev+0x337>
  803089:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80308c:	48 8b 04 c5 88 1e 81 	mov    rax,QWORD PTR [rax*8+0x811e88]
  803093:	00 
  803094:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  803097:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80309a:	48 63 d0             	movsxd rdx,eax
  80309d:	48 89 d0             	mov    rax,rdx
  8030a0:	48 c1 e0 02          	shl    rax,0x2
  8030a4:	48 01 d0             	add    rax,rdx
  8030a7:	48 c1 e0 02          	shl    rax,0x2
  8030ab:	48 01 d0             	add    rax,rdx
  8030ae:	48 c1 e0 03          	shl    rax,0x3
  8030b2:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030b8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030bb:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  8030bf:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030c3:	48 89 c7             	mov    rdi,rax
  8030c6:	ff d2                	call   rdx
  8030c8:	e9 4e 02 00 00       	jmp    80331b <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  8030cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030d0:	48 63 d0             	movsxd rdx,eax
  8030d3:	48 89 d0             	mov    rax,rdx
  8030d6:	48 c1 e0 02          	shl    rax,0x2
  8030da:	48 01 d0             	add    rax,rdx
  8030dd:	48 c1 e0 02          	shl    rax,0x2
  8030e1:	48 01 d0             	add    rax,rdx
  8030e4:	48 c1 e0 03          	shl    rax,0x3
  8030e8:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030ee:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030f1:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8030f5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030f9:	48 89 c7             	mov    rdi,rax
  8030fc:	ff d2                	call   rdx
  8030fe:	e9 18 02 00 00       	jmp    80331b <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  803103:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803106:	48 63 d0             	movsxd rdx,eax
  803109:	48 89 d0             	mov    rax,rdx
  80310c:	48 c1 e0 02          	shl    rax,0x2
  803110:	48 01 d0             	add    rax,rdx
  803113:	48 c1 e0 02          	shl    rax,0x2
  803117:	48 01 d0             	add    rax,rdx
  80311a:	48 c1 e0 03          	shl    rax,0x3
  80311e:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803124:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803127:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80312b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80312f:	48 89 c7             	mov    rdi,rax
  803132:	ff d2                	call   rdx
  803134:	e9 e2 01 00 00       	jmp    80331b <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
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
  80315d:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  803161:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803165:	48 89 c7             	mov    rdi,rax
  803168:	ff d2                	call   rdx
  80316a:	e9 ac 01 00 00       	jmp    80331b <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  80316f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803172:	48 63 d0             	movsxd rdx,eax
  803175:	48 89 d0             	mov    rax,rdx
  803178:	48 c1 e0 02          	shl    rax,0x2
  80317c:	48 01 d0             	add    rax,rdx
  80317f:	48 c1 e0 02          	shl    rax,0x2
  803183:	48 01 d0             	add    rax,rdx
  803186:	48 c1 e0 03          	shl    rax,0x3
  80318a:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803190:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803193:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  803197:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80319b:	48 89 c7             	mov    rdi,rax
  80319e:	ff d2                	call   rdx
  8031a0:	e9 76 01 00 00       	jmp    80331b <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  8031a5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031a8:	48 63 d0             	movsxd rdx,eax
  8031ab:	48 89 d0             	mov    rax,rdx
  8031ae:	48 c1 e0 02          	shl    rax,0x2
  8031b2:	48 01 d0             	add    rax,rdx
  8031b5:	48 c1 e0 02          	shl    rax,0x2
  8031b9:	48 01 d0             	add    rax,rdx
  8031bc:	48 c1 e0 03          	shl    rax,0x3
  8031c0:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031c6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031c9:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  8031cd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031d1:	48 89 c7             	mov    rdi,rax
  8031d4:	ff d2                	call   rdx
  8031d6:	e9 40 01 00 00       	jmp    80331b <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  8031db:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031de:	48 63 d0             	movsxd rdx,eax
  8031e1:	48 89 d0             	mov    rax,rdx
  8031e4:	48 c1 e0 02          	shl    rax,0x2
  8031e8:	48 01 d0             	add    rax,rdx
  8031eb:	48 c1 e0 02          	shl    rax,0x2
  8031ef:	48 01 d0             	add    rax,rdx
  8031f2:	48 c1 e0 03          	shl    rax,0x3
  8031f6:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031fc:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031ff:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  803203:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803207:	48 89 c7             	mov    rdi,rax
  80320a:	ff d2                	call   rdx
  80320c:	e9 0a 01 00 00       	jmp    80331b <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  803211:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803214:	48 63 d0             	movsxd rdx,eax
  803217:	48 89 d0             	mov    rax,rdx
  80321a:	48 c1 e0 02          	shl    rax,0x2
  80321e:	48 01 d0             	add    rax,rdx
  803221:	48 c1 e0 02          	shl    rax,0x2
  803225:	48 01 d0             	add    rax,rdx
  803228:	48 c1 e0 03          	shl    rax,0x3
  80322c:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803232:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803235:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  803239:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80323d:	48 89 c7             	mov    rdi,rax
  803240:	ff d2                	call   rdx
  803242:	e9 d4 00 00 00       	jmp    80331b <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  803247:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80324a:	48 63 d0             	movsxd rdx,eax
  80324d:	48 89 d0             	mov    rax,rdx
  803250:	48 c1 e0 02          	shl    rax,0x2
  803254:	48 01 d0             	add    rax,rdx
  803257:	48 c1 e0 02          	shl    rax,0x2
  80325b:	48 01 d0             	add    rax,rdx
  80325e:	48 c1 e0 03          	shl    rax,0x3
  803262:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803268:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80326b:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  80326f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803273:	48 89 c7             	mov    rdi,rax
  803276:	ff d2                	call   rdx
  803278:	e9 9e 00 00 00       	jmp    80331b <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  80327d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803280:	48 63 d0             	movsxd rdx,eax
  803283:	48 89 d0             	mov    rax,rdx
  803286:	48 c1 e0 02          	shl    rax,0x2
  80328a:	48 01 d0             	add    rax,rdx
  80328d:	48 c1 e0 02          	shl    rax,0x2
  803291:	48 01 d0             	add    rax,rdx
  803294:	48 c1 e0 03          	shl    rax,0x3
  803298:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80329e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8032a1:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  8032a5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8032a9:	48 89 c7             	mov    rdi,rax
  8032ac:	ff d2                	call   rdx
  8032ae:	eb 6b                	jmp    80331b <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  8032b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032b3:	48 63 d0             	movsxd rdx,eax
  8032b6:	48 89 d0             	mov    rax,rdx
  8032b9:	48 c1 e0 02          	shl    rax,0x2
  8032bd:	48 01 d0             	add    rax,rdx
  8032c0:	48 c1 e0 02          	shl    rax,0x2
  8032c4:	48 01 d0             	add    rax,rdx
  8032c7:	48 c1 e0 03          	shl    rax,0x3
  8032cb:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8032d1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8032d4:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  8032d8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8032dc:	48 89 c7             	mov    rdi,rax
  8032df:	ff d2                	call   rdx
  8032e1:	eb 38                	jmp    80331b <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  8032e3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032e6:	48 63 d0             	movsxd rdx,eax
  8032e9:	48 89 d0             	mov    rax,rdx
  8032ec:	48 c1 e0 02          	shl    rax,0x2
  8032f0:	48 01 d0             	add    rax,rdx
  8032f3:	48 c1 e0 02          	shl    rax,0x2
  8032f7:	48 01 d0             	add    rax,rdx
  8032fa:	48 c1 e0 03          	shl    rax,0x3
  8032fe:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803304:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803307:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  80330b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80330f:	48 89 c7             	mov    rdi,rax
  803312:	ff d2                	call   rdx
  803314:	eb 05                	jmp    80331b <sys_operate_dev+0x33c>
    }
    return -1;
  803316:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80331b:	c9                   	leave  
  80331c:	c3                   	ret    

000000000080331d <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  80331d:	f3 0f 1e fa          	endbr64 
  803321:	55                   	push   rbp
  803322:	48 89 e5             	mov    rbp,rsp
  803325:	48 83 ec 10          	sub    rsp,0x10
  803329:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  80332c:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  80332f:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  803333:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803336:	48 63 d0             	movsxd rdx,eax
  803339:	48 89 d0             	mov    rax,rdx
  80333c:	48 c1 e0 02          	shl    rax,0x2
  803340:	48 01 d0             	add    rax,rdx
  803343:	48 c1 e0 05          	shl    rax,0x5
  803347:	48 05 80 58 40 00    	add    rax,0x405880
  80334d:	8b 00                	mov    eax,DWORD PTR [rax]
  80334f:	85 c0                	test   eax,eax
  803351:	75 0a                	jne    80335d <call_drv_func+0x40>
  803353:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803358:	e9 15 02 00 00       	jmp    803572 <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  80335d:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  803361:	0f 87 06 02 00 00    	ja     80356d <call_drv_func+0x250>
  803367:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80336a:	48 8b 04 c5 e8 1e 81 	mov    rax,QWORD PTR [rax*8+0x811ee8]
  803371:	00 
  803372:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  803375:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803378:	48 63 d0             	movsxd rdx,eax
  80337b:	48 89 d0             	mov    rax,rdx
  80337e:	48 c1 e0 02          	shl    rax,0x2
  803382:	48 01 d0             	add    rax,rdx
  803385:	48 c1 e0 05          	shl    rax,0x5
  803389:	48 05 88 58 40 00    	add    rax,0x405888
  80338f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803392:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803396:	48 89 c7             	mov    rdi,rax
  803399:	ff d2                	call   rdx
  80339b:	e9 d2 01 00 00       	jmp    803572 <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  8033a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033a3:	48 63 d0             	movsxd rdx,eax
  8033a6:	48 89 d0             	mov    rax,rdx
  8033a9:	48 c1 e0 02          	shl    rax,0x2
  8033ad:	48 01 d0             	add    rax,rdx
  8033b0:	48 c1 e0 05          	shl    rax,0x5
  8033b4:	48 05 90 58 40 00    	add    rax,0x405890
  8033ba:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033bd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033c1:	48 89 c7             	mov    rdi,rax
  8033c4:	ff d2                	call   rdx
  8033c6:	e9 a7 01 00 00       	jmp    803572 <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  8033cb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033ce:	48 63 d0             	movsxd rdx,eax
  8033d1:	48 89 d0             	mov    rax,rdx
  8033d4:	48 c1 e0 02          	shl    rax,0x2
  8033d8:	48 01 d0             	add    rax,rdx
  8033db:	48 c1 e0 05          	shl    rax,0x5
  8033df:	48 05 98 58 40 00    	add    rax,0x405898
  8033e5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033e8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033ec:	48 89 c7             	mov    rdi,rax
  8033ef:	ff d2                	call   rdx
  8033f1:	e9 7c 01 00 00       	jmp    803572 <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  8033f6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033f9:	48 63 d0             	movsxd rdx,eax
  8033fc:	48 89 d0             	mov    rax,rdx
  8033ff:	48 c1 e0 02          	shl    rax,0x2
  803403:	48 01 d0             	add    rax,rdx
  803406:	48 c1 e0 05          	shl    rax,0x5
  80340a:	48 05 a0 58 40 00    	add    rax,0x4058a0
  803410:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803413:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803417:	48 89 c7             	mov    rdi,rax
  80341a:	ff d2                	call   rdx
  80341c:	e9 51 01 00 00       	jmp    803572 <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  803421:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803424:	48 63 d0             	movsxd rdx,eax
  803427:	48 89 d0             	mov    rax,rdx
  80342a:	48 c1 e0 02          	shl    rax,0x2
  80342e:	48 01 d0             	add    rax,rdx
  803431:	48 c1 e0 05          	shl    rax,0x5
  803435:	48 05 a8 58 40 00    	add    rax,0x4058a8
  80343b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80343e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803442:	48 89 c7             	mov    rdi,rax
  803445:	ff d2                	call   rdx
  803447:	e9 26 01 00 00       	jmp    803572 <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  80344c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80344f:	48 63 d0             	movsxd rdx,eax
  803452:	48 89 d0             	mov    rax,rdx
  803455:	48 c1 e0 02          	shl    rax,0x2
  803459:	48 01 d0             	add    rax,rdx
  80345c:	48 c1 e0 05          	shl    rax,0x5
  803460:	48 05 b0 58 40 00    	add    rax,0x4058b0
  803466:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803469:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80346d:	48 89 c7             	mov    rdi,rax
  803470:	ff d2                	call   rdx
  803472:	e9 fb 00 00 00       	jmp    803572 <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  803477:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80347a:	48 63 d0             	movsxd rdx,eax
  80347d:	48 89 d0             	mov    rax,rdx
  803480:	48 c1 e0 02          	shl    rax,0x2
  803484:	48 01 d0             	add    rax,rdx
  803487:	48 c1 e0 05          	shl    rax,0x5
  80348b:	48 05 b8 58 40 00    	add    rax,0x4058b8
  803491:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803494:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803498:	48 89 c7             	mov    rdi,rax
  80349b:	ff d2                	call   rdx
  80349d:	e9 d0 00 00 00       	jmp    803572 <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  8034a2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034a5:	48 63 d0             	movsxd rdx,eax
  8034a8:	48 89 d0             	mov    rax,rdx
  8034ab:	48 c1 e0 02          	shl    rax,0x2
  8034af:	48 01 d0             	add    rax,rdx
  8034b2:	48 c1 e0 05          	shl    rax,0x5
  8034b6:	48 05 c0 58 40 00    	add    rax,0x4058c0
  8034bc:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8034bf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034c3:	48 89 c7             	mov    rdi,rax
  8034c6:	ff d2                	call   rdx
  8034c8:	e9 a5 00 00 00       	jmp    803572 <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  8034cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034d0:	48 63 d0             	movsxd rdx,eax
  8034d3:	48 89 d0             	mov    rax,rdx
  8034d6:	48 c1 e0 02          	shl    rax,0x2
  8034da:	48 01 d0             	add    rax,rdx
  8034dd:	48 c1 e0 05          	shl    rax,0x5
  8034e1:	48 05 c8 58 40 00    	add    rax,0x4058c8
  8034e7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8034ea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034ee:	48 89 c7             	mov    rdi,rax
  8034f1:	ff d2                	call   rdx
  8034f3:	eb 7d                	jmp    803572 <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  8034f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8034f8:	48 63 d0             	movsxd rdx,eax
  8034fb:	48 89 d0             	mov    rax,rdx
  8034fe:	48 c1 e0 02          	shl    rax,0x2
  803502:	48 01 d0             	add    rax,rdx
  803505:	48 c1 e0 05          	shl    rax,0x5
  803509:	48 05 d0 58 40 00    	add    rax,0x4058d0
  80350f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803512:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803516:	48 89 c7             	mov    rdi,rax
  803519:	ff d2                	call   rdx
  80351b:	eb 55                	jmp    803572 <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  80351d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803520:	48 63 d0             	movsxd rdx,eax
  803523:	48 89 d0             	mov    rax,rdx
  803526:	48 c1 e0 02          	shl    rax,0x2
  80352a:	48 01 d0             	add    rax,rdx
  80352d:	48 c1 e0 05          	shl    rax,0x5
  803531:	48 05 d8 58 40 00    	add    rax,0x4058d8
  803537:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80353a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80353e:	48 89 c7             	mov    rdi,rax
  803541:	ff d2                	call   rdx
  803543:	eb 2d                	jmp    803572 <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  803545:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803548:	48 63 d0             	movsxd rdx,eax
  80354b:	48 89 d0             	mov    rax,rdx
  80354e:	48 c1 e0 02          	shl    rax,0x2
  803552:	48 01 d0             	add    rax,rdx
  803555:	48 c1 e0 05          	shl    rax,0x5
  803559:	48 05 e0 58 40 00    	add    rax,0x4058e0
  80355f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803562:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803566:	48 89 c7             	mov    rdi,rax
  803569:	ff d2                	call   rdx
  80356b:	eb 05                	jmp    803572 <call_drv_func+0x255>
    }
    return -1;
  80356d:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  803572:	c9                   	leave  
  803573:	c3                   	ret    

0000000000803574 <dispose_device>:
int dispose_device(int dev){
  803574:	f3 0f 1e fa          	endbr64 
  803578:	55                   	push   rbp
  803579:	48 89 e5             	mov    rbp,rsp
  80357c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  80357f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803582:	48 63 d0             	movsxd rdx,eax
  803585:	48 89 d0             	mov    rax,rdx
  803588:	48 c1 e0 02          	shl    rax,0x2
  80358c:	48 01 d0             	add    rax,rdx
  80358f:	48 c1 e0 02          	shl    rax,0x2
  803593:	48 01 d0             	add    rax,rdx
  803596:	48 c1 e0 03          	shl    rax,0x3
  80359a:	48 05 90 2e 40 00    	add    rax,0x402e90
  8035a0:	8b 00                	mov    eax,DWORD PTR [rax]
  8035a2:	83 f8 01             	cmp    eax,0x1
  8035a5:	74 07                	je     8035ae <dispose_device+0x3a>
  8035a7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8035ac:	eb 62                	jmp    803610 <dispose_device+0x9c>
    device* p=&devs[dev];
  8035ae:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8035b1:	48 63 d0             	movsxd rdx,eax
  8035b4:	48 89 d0             	mov    rax,rdx
  8035b7:	48 c1 e0 02          	shl    rax,0x2
  8035bb:	48 01 d0             	add    rax,rdx
  8035be:	48 c1 e0 02          	shl    rax,0x2
  8035c2:	48 01 d0             	add    rax,rdx
  8035c5:	48 c1 e0 03          	shl    rax,0x3
  8035c9:	48 05 80 2e 40 00    	add    rax,0x402e80
  8035cf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  8035d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8035d7:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  8035de:	48 85 c0             	test   rax,rax
  8035e1:	74 1d                	je     803600 <dispose_device+0x8c>
  8035e3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8035e7:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  8035ee:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8035f2:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  8035f9:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  803600:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803604:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  80360b:	b8 00 00 00 00       	mov    eax,0x0
}
  803610:	5d                   	pop    rbp
  803611:	c3                   	ret    

0000000000803612 <dispose_driver>:
int dispose_driver(driver *drv){
  803612:	f3 0f 1e fa          	endbr64 
  803616:	55                   	push   rbp
  803617:	48 89 e5             	mov    rbp,rsp
  80361a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  80361e:	90                   	nop
  80361f:	5d                   	pop    rbp
  803620:	c3                   	ret    

0000000000803621 <get_dev>:

device *get_dev(int devi)
{
  803621:	f3 0f 1e fa          	endbr64 
  803625:	55                   	push   rbp
  803626:	48 89 e5             	mov    rbp,rsp
  803629:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  80362c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80362f:	48 63 d0             	movsxd rdx,eax
  803632:	48 89 d0             	mov    rax,rdx
  803635:	48 c1 e0 02          	shl    rax,0x2
  803639:	48 01 d0             	add    rax,rdx
  80363c:	48 c1 e0 02          	shl    rax,0x2
  803640:	48 01 d0             	add    rax,rdx
  803643:	48 c1 e0 03          	shl    rax,0x3
  803647:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  80364d:	5d                   	pop    rbp
  80364e:	c3                   	ret    

000000000080364f <get_drv>:
driver *get_drv(int drvi)
{
  80364f:	f3 0f 1e fa          	endbr64 
  803653:	55                   	push   rbp
  803654:	48 89 e5             	mov    rbp,rsp
  803657:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  80365a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80365d:	48 63 d0             	movsxd rdx,eax
  803660:	48 89 d0             	mov    rax,rdx
  803663:	48 c1 e0 02          	shl    rax,0x2
  803667:	48 01 d0             	add    rax,rdx
  80366a:	48 c1 e0 05          	shl    rax,0x5
  80366e:	48 05 80 58 40 00    	add    rax,0x405880
}
  803674:	5d                   	pop    rbp
  803675:	c3                   	ret    

0000000000803676 <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  803676:	f3 0f 1e fa          	endbr64 
  80367a:	55                   	push   rbp
  80367b:	48 89 e5             	mov    rbp,rsp
  80367e:	53                   	push   rbx
  80367f:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  803683:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  80368a:	eb 23                	jmp    8036af <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  80368c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80368f:	48 63 d0             	movsxd rdx,eax
  803692:	48 89 d0             	mov    rax,rdx
  803695:	48 01 c0             	add    rax,rax
  803698:	48 01 d0             	add    rax,rdx
  80369b:	48 c1 e0 06          	shl    rax,0x6
  80369f:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  8036a5:	8b 00                	mov    eax,DWORD PTR [rax]
  8036a7:	85 c0                	test   eax,eax
  8036a9:	74 0c                	je     8036b7 <make_request+0x41>
    for(;i<NR_REQS;i++)
  8036ab:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8036af:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  8036b3:	7e d7                	jle    80368c <make_request+0x16>
  8036b5:	eb 01                	jmp    8036b8 <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  8036b7:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  8036b8:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  8036bc:	75 0a                	jne    8036c8 <make_request+0x52>
  8036be:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8036c3:	e9 e7 01 00 00       	jmp    8038af <make_request+0x239>
    reqs[i]=*args;//放入数组
  8036c8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8036cb:	48 63 d0             	movsxd rdx,eax
  8036ce:	48 89 d0             	mov    rax,rdx
  8036d1:	48 01 c0             	add    rax,rax
  8036d4:	48 01 d0             	add    rax,rdx
  8036d7:	48 c1 e0 06          	shl    rax,0x6
  8036db:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8036e2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8036e6:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8036e9:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  8036ed:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  8036f0:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  8036f4:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  8036f8:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  8036fc:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  803700:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  803704:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  803708:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  80370c:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  803710:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  803714:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  803718:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  80371c:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  803720:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  803724:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  803728:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  80372c:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  803730:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  803734:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  803738:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  80373c:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  803740:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  803744:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  803748:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  80374c:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  803750:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  803754:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  803758:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  80375c:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  803760:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  803764:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  80376b:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  803772:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  803779:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  803780:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  803787:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  80378e:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  803795:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  80379c:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  8037a3:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  8037aa:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  8037b1:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  8037b8:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  8037bf:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  8037c6:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  8037cd:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  8037d4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8037d8:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  8037de:	48 63 d0             	movsxd rdx,eax
  8037e1:	48 89 d0             	mov    rax,rdx
  8037e4:	48 c1 e0 02          	shl    rax,0x2
  8037e8:	48 01 d0             	add    rax,rdx
  8037eb:	48 c1 e0 02          	shl    rax,0x2
  8037ef:	48 01 d0             	add    rax,rdx
  8037f2:	48 c1 e0 03          	shl    rax,0x3
  8037f6:	48 05 80 2e 40 00    	add    rax,0x402e80
  8037fc:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  803800:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803804:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  80380b:	48 85 c0             	test   rax,rax
  80380e:	75 27                	jne    803837 <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  803810:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803813:	48 63 d0             	movsxd rdx,eax
  803816:	48 89 d0             	mov    rax,rdx
  803819:	48 01 c0             	add    rax,rax
  80381c:	48 01 d0             	add    rax,rdx
  80381f:	48 c1 e0 06          	shl    rax,0x6
  803823:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  80382a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80382e:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  803835:	eb 75                	jmp    8038ac <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  803837:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80383b:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803842:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  803846:	eb 0f                	jmp    803857 <make_request+0x1e1>
  803848:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80384c:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803853:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  803857:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80385b:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  803862:	48 85 c0             	test   rax,rax
  803865:	75 e1                	jne    803848 <make_request+0x1d2>
        p->next=&reqs[i];
  803867:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80386a:	48 63 d0             	movsxd rdx,eax
  80386d:	48 89 d0             	mov    rax,rdx
  803870:	48 01 c0             	add    rax,rax
  803873:	48 01 d0             	add    rax,rdx
  803876:	48 c1 e0 06          	shl    rax,0x6
  80387a:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803881:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  803885:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  80388c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80388f:	48 63 d0             	movsxd rdx,eax
  803892:	48 89 d0             	mov    rax,rdx
  803895:	48 01 c0             	add    rax,rax
  803898:	48 01 d0             	add    rax,rdx
  80389b:	48 c1 e0 06          	shl    rax,0x6
  80389f:	48 05 38 6d 40 00    	add    rax,0x406d38
  8038a5:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  8038ac:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  8038af:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8038b3:	c9                   	leave  
  8038b4:	c3                   	ret    

00000000008038b5 <do_req>:
//取出一个申请并且执行
int do_req()
{
  8038b5:	f3 0f 1e fa          	endbr64 
  8038b9:	55                   	push   rbp
  8038ba:	48 89 e5             	mov    rbp,rsp
  8038bd:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  8038c1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8038c8:	e9 ab 00 00 00       	jmp    803978 <do_req+0xc3>
    {
        device* p=dev_tree[i];
  8038cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038d0:	48 98                	cdqe   
  8038d2:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  8038d9:	00 
  8038da:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  8038de:	e9 86 00 00 00       	jmp    803969 <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  8038e3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038e7:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  8038ee:	48 85 c0             	test   rax,rax
  8038f1:	75 67                	jne    80395a <do_req+0xa5>
  8038f3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038f7:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  8038fe:	48 85 c0             	test   rax,rax
  803901:	74 57                	je     80395a <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  803903:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803907:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  80390e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803912:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  803919:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80391d:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803924:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  80392b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80392f:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  803936:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80393a:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  803940:	48 98                	cdqe   
  803942:	48 8b 14 c5 00 a4 80 	mov    rdx,QWORD PTR [rax*8+0x80a400]
  803949:	00 
  80394a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80394e:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  803955:	48 89 c7             	mov    rdi,rax
  803958:	ff d2                	call   rdx
        for(;p;p=p->next)
  80395a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80395e:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  803965:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  803969:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  80396e:	0f 85 6f ff ff ff    	jne    8038e3 <do_req+0x2e>
    for(int i=0;i<3;i++)
  803974:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803978:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  80397c:	0f 8e 4b ff ff ff    	jle    8038cd <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  803982:	b8 00 00 00 00       	mov    eax,0x0
}
  803987:	c9                   	leave  
  803988:	c3                   	ret    

0000000000803989 <wait_on_req>:


void wait_on_req(int reqi)
{
  803989:	f3 0f 1e fa          	endbr64 
  80398d:	55                   	push   rbp
  80398e:	48 89 e5             	mov    rbp,rsp
  803991:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  803994:	90                   	nop
  803995:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803998:	48 63 d0             	movsxd rdx,eax
  80399b:	48 89 d0             	mov    rax,rdx
  80399e:	48 01 c0             	add    rax,rax
  8039a1:	48 01 d0             	add    rax,rdx
  8039a4:	48 c1 e0 06          	shl    rax,0x6
  8039a8:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  8039ae:	8b 00                	mov    eax,DWORD PTR [rax]
  8039b0:	83 f8 03             	cmp    eax,0x3
  8039b3:	75 e0                	jne    803995 <wait_on_req+0xc>
}
  8039b5:	90                   	nop
  8039b6:	90                   	nop
  8039b7:	5d                   	pop    rbp
  8039b8:	c3                   	ret    

00000000008039b9 <clear_req>:
void clear_req(int reqi)
{
  8039b9:	f3 0f 1e fa          	endbr64 
  8039bd:	55                   	push   rbp
  8039be:	48 89 e5             	mov    rbp,rsp
  8039c1:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  8039c4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039c7:	48 63 d0             	movsxd rdx,eax
  8039ca:	48 89 d0             	mov    rax,rdx
  8039cd:	48 01 c0             	add    rax,rax
  8039d0:	48 01 d0             	add    rax,rdx
  8039d3:	48 c1 e0 06          	shl    rax,0x6
  8039d7:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  8039dd:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  8039e3:	90                   	nop
  8039e4:	5d                   	pop    rbp
  8039e5:	c3                   	ret    

00000000008039e6 <init_proc>:
TSS scene_saver;
TSS *tss=0x108000;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  8039e6:	f3 0f 1e fa          	endbr64 
  8039ea:	55                   	push   rbp
  8039eb:	48 89 e5             	mov    rbp,rsp
  8039ee:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  8039f2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8039f9:	eb 61                	jmp    803a5c <init_proc+0x76>
        task[i].pid=-1;
  8039fb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8039fe:	48 63 d0             	movsxd rdx,eax
  803a01:	48 89 d0             	mov    rax,rdx
  803a04:	48 01 c0             	add    rax,rax
  803a07:	48 01 d0             	add    rax,rdx
  803a0a:	48 c1 e0 08          	shl    rax,0x8
  803a0e:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803a14:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  803a1a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a1d:	48 63 d0             	movsxd rdx,eax
  803a20:	48 89 d0             	mov    rax,rdx
  803a23:	48 01 c0             	add    rax,rax
  803a26:	48 01 d0             	add    rax,rdx
  803a29:	48 c1 e0 08          	shl    rax,0x8
  803a2d:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803a33:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  803a39:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a3c:	48 63 d0             	movsxd rdx,eax
  803a3f:	48 89 d0             	mov    rax,rdx
  803a42:	48 01 c0             	add    rax,rax
  803a45:	48 01 d0             	add    rax,rdx
  803a48:	48 c1 e0 08          	shl    rax,0x8
  803a4c:	48 05 28 85 40 00    	add    rax,0x408528
  803a52:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803a58:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  803a5c:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803a60:	7e 99                	jle    8039fb <init_proc+0x15>
    }
    cur_proc=0;//no proc
  803a62:	c7 05 a0 0a c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc10aa0],0x0        # 41450c <cur_proc>
  803a69:	00 00 00 
    pidd=1;
  803a6c:	c7 05 9a 0a c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc10a9a],0x1        # 414510 <pidd>
  803a73:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  803a76:	b8 00 00 00 00       	mov    eax,0x0
  803a7b:	e8 0e 02 00 00       	call   803c8e <create_proc>
  803a80:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  803a83:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803a86:	48 63 d0             	movsxd rdx,eax
  803a89:	48 89 d0             	mov    rax,rdx
  803a8c:	48 01 c0             	add    rax,rax
  803a8f:	48 01 d0             	add    rax,rdx
  803a92:	48 c1 e0 08          	shl    rax,0x8
  803a96:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803a9c:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  803aa2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803aa5:	83 c0 03             	add    eax,0x3
  803aa8:	c1 e0 04             	shl    eax,0x4
  803aab:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  803aae:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803ab1:	01 c0                	add    eax,eax
  803ab3:	83 c0 05             	add    eax,0x5
  803ab6:	c1 e0 03             	shl    eax,0x3
  803ab9:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    //创建一个测试进程
    create_test_proc();
  803abc:	b8 00 00 00 00       	mov    eax,0x0
  803ac1:	e8 03 00 00 00       	call   803ac9 <create_test_proc>
}
  803ac6:	90                   	nop
  803ac7:	c9                   	leave  
  803ac8:	c3                   	ret    

0000000000803ac9 <create_test_proc>:
void create_test_proc(){
  803ac9:	f3 0f 1e fa          	endbr64 
  803acd:	55                   	push   rbp
  803ace:	48 89 e5             	mov    rbp,rsp
  803ad1:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  803ad5:	b8 00 00 00 00       	mov    eax,0x0
  803ada:	e8 32 02 00 00       	call   803d11 <req_proc>
  803adf:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=READY;
  803ae2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ae5:	48 63 d0             	movsxd rdx,eax
  803ae8:	48 89 d0             	mov    rax,rdx
  803aeb:	48 01 c0             	add    rax,rax
  803aee:	48 01 d0             	add    rax,rdx
  803af1:	48 c1 e0 08          	shl    rax,0x8
  803af5:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803afb:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int currsp=0x9fc00-1;
  803b01:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803b08:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803b0c:	ba 76 3f 80 00       	mov    edx,0x803f76
  803b11:	48 83 ec 08          	sub    rsp,0x8
  803b15:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b18:	50                   	push   rax
  803b19:	6a 00                	push   0x0
  803b1b:	52                   	push   rdx
  803b1c:	6a 00                	push   0x0
  803b1e:	6a 00                	push   0x0
  803b20:	6a 00                	push   0x0
  803b22:	68 58 7d 00 00       	push   0x7d58
  803b27:	6a 10                	push   0x10
  803b29:	6a 10                	push   0x10
  803b2b:	6a 10                	push   0x10
  803b2d:	6a 10                	push   0x10
  803b2f:	41 b9 08 00 00 00    	mov    r9d,0x8
  803b35:	41 b8 10 00 00 00    	mov    r8d,0x10
  803b3b:	b9 00 00 00 00       	mov    ecx,0x0
  803b40:	ba 00 00 00 00       	mov    edx,0x0
  803b45:	be 00 00 00 00       	mov    esi,0x0
  803b4a:	bf 00 00 00 00       	mov    edi,0x0
  803b4f:	e8 b6 02 00 00       	call   803e0a <set_proc>
  803b54:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)proc_zero, 0, index);
    task[index].tss.rsp0=0x400000;
  803b58:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803b5b:	48 63 d0             	movsxd rdx,eax
  803b5e:	48 89 d0             	mov    rax,rdx
  803b61:	48 01 c0             	add    rax,rax
  803b64:	48 01 d0             	add    rax,rdx
  803b67:	48 c1 e0 08          	shl    rax,0x8
  803b6b:	48 05 68 86 40 00    	add    rax,0x408668
  803b71:	48 c7 00 00 00 40 00 	mov    QWORD PTR [rax],0x400000
    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  803b78:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  803b7f:	00 
    str->rax=0;
  803b80:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b84:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  803b8b:	00 
    str->rbx=0;
  803b8c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b90:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  803b97:	00 
    str->rcx=0;
  803b98:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b9c:	48 c7 40 68 00 00 00 	mov    QWORD PTR [rax+0x68],0x0
  803ba3:	00 
    str->rdx=0;
  803ba4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803ba8:	48 c7 40 60 00 00 00 	mov    QWORD PTR [rax+0x60],0x0
  803baf:	00 
    str->rsi=0;
  803bb0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bb4:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  803bbb:	00 
    str->rdi=0;
  803bbc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bc0:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  803bc7:	00 
    str->r15=0;
  803bc8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bcc:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  803bd3:	00 
    str->r14=0;
  803bd4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bd8:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  803bdf:	00 
    str->r13=0;
  803be0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803be4:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  803beb:	00 
    str->r12=0;
  803bec:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bf0:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  803bf7:	00 
    str->r11=0;
  803bf8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bfc:	48 c7 40 30 00 00 00 	mov    QWORD PTR [rax+0x30],0x0
  803c03:	00 
    str->r10=0;
  803c04:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c08:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  803c0f:	00 
    str->r9=0;
  803c10:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c14:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  803c1b:	00 
    str->r8=0;
  803c1c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c20:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  803c27:	00 
    str->rip=(unsigned long)proc_zero;
  803c28:	ba 76 3f 80 00       	mov    edx,0x803f76
  803c2d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c31:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
    str->cs=0x8;
  803c38:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c3c:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  803c43:	08 00 00 00 
    str->rflags=0;
  803c47:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c4b:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  803c52:	00 00 00 00 
    str->rsp=0x7e00- sizeof(stack_store_regs);
  803c56:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c5a:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7d58
  803c61:	58 7d 00 00 
    str->ss=0x10;
  803c65:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c69:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x10
  803c70:	10 00 00 00 
    str->ds=0x10;
  803c74:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c78:	48 c7 00 10 00 00 00 	mov    QWORD PTR [rax],0x10
    str->es=0x10;
  803c7f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803c83:	48 c7 40 08 10 00 00 	mov    QWORD PTR [rax+0x8],0x10
  803c8a:	00 

}
  803c8b:	90                   	nop
  803c8c:	c9                   	leave  
  803c8d:	c3                   	ret    

0000000000803c8e <create_proc>:
int create_proc()
{
  803c8e:	f3 0f 1e fa          	endbr64 
  803c92:	55                   	push   rbp
  803c93:	48 89 e5             	mov    rbp,rsp
  803c96:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  803c9a:	b8 00 00 00 00       	mov    eax,0x0
  803c9f:	e8 6d 00 00 00       	call   803d11 <req_proc>
  803ca4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  803ca7:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  803cab:	75 07                	jne    803cb4 <create_proc+0x26>
  803cad:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803cb2:	eb 5b                	jmp    803d0f <create_proc+0x81>
    int currsp=0x9fc00-1;
  803cb4:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803cbb:	48 89 65 f8          	mov    QWORD PTR [rbp-0x8],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803cbf:	b9 76 3f 80 00       	mov    ecx,0x803f76
  803cc4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803cc7:	48 98                	cdqe   
  803cc9:	48 83 ec 08          	sub    rsp,0x8
  803ccd:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  803cd0:	52                   	push   rdx
  803cd1:	6a 00                	push   0x0
  803cd3:	51                   	push   rcx
  803cd4:	6a 00                	push   0x0
  803cd6:	6a 00                	push   0x0
  803cd8:	6a 00                	push   0x0
  803cda:	50                   	push   rax
  803cdb:	6a 10                	push   0x10
  803cdd:	6a 10                	push   0x10
  803cdf:	6a 10                	push   0x10
  803ce1:	6a 10                	push   0x10
  803ce3:	41 b9 08 00 00 00    	mov    r9d,0x8
  803ce9:	41 b8 10 00 00 00    	mov    r8d,0x10
  803cef:	b9 00 00 00 00       	mov    ecx,0x0
  803cf4:	ba 00 00 00 00       	mov    edx,0x0
  803cf9:	be 00 00 00 00       	mov    esi,0x0
  803cfe:	bf 00 00 00 00       	mov    edi,0x0
  803d03:	e8 02 01 00 00       	call   803e0a <set_proc>
  803d08:	48 83 c4 60          	add    rsp,0x60
             currsp, 0, 0, 0, (long)proc_zero, 0, index);
//    task[index].tss.eip=(long)proc_zero;

    return index;
  803d0c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803d0f:	c9                   	leave  
  803d10:	c3                   	ret    

0000000000803d11 <req_proc>:
int req_proc(){
  803d11:	f3 0f 1e fa          	endbr64 
  803d15:	55                   	push   rbp
  803d16:	48 89 e5             	mov    rbp,rsp
    int num=0;
  803d19:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803d20:	eb 04                	jmp    803d26 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  803d22:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803d26:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d29:	48 63 d0             	movsxd rdx,eax
  803d2c:	48 89 d0             	mov    rax,rdx
  803d2f:	48 01 c0             	add    rax,rax
  803d32:	48 01 d0             	add    rax,rdx
  803d35:	48 c1 e0 08          	shl    rax,0x8
  803d39:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d3f:	8b 00                	mov    eax,DWORD PTR [rax]
  803d41:	83 f8 ff             	cmp    eax,0xffffffff
  803d44:	74 26                	je     803d6c <req_proc+0x5b>
  803d46:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d49:	48 63 d0             	movsxd rdx,eax
  803d4c:	48 89 d0             	mov    rax,rdx
  803d4f:	48 01 c0             	add    rax,rax
  803d52:	48 01 d0             	add    rax,rdx
  803d55:	48 c1 e0 08          	shl    rax,0x8
  803d59:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803d5f:	8b 00                	mov    eax,DWORD PTR [rax]
  803d61:	83 f8 03             	cmp    eax,0x3
  803d64:	74 06                	je     803d6c <req_proc+0x5b>
  803d66:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803d6a:	7e b6                	jle    803d22 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  803d6c:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803d70:	7e 0a                	jle    803d7c <req_proc+0x6b>
        return -1;
  803d72:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803d77:	e9 8c 00 00 00       	jmp    803e08 <req_proc+0xf7>
    task[num].pid=pidd++;
  803d7c:	8b 05 8e 07 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1078e]        # 414510 <pidd>
  803d82:	8d 50 01             	lea    edx,[rax+0x1]
  803d85:	89 15 85 07 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10785],edx        # 414510 <pidd>
  803d8b:	89 c1                	mov    ecx,eax
  803d8d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d90:	48 63 d0             	movsxd rdx,eax
  803d93:	48 89 d0             	mov    rax,rdx
  803d96:	48 01 c0             	add    rax,rax
  803d99:	48 01 d0             	add    rax,rdx
  803d9c:	48 c1 e0 08          	shl    rax,0x8
  803da0:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803da6:	89 08                	mov    DWORD PTR [rax],ecx
    task[num].stat=ENDED;
  803da8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803dab:	48 63 d0             	movsxd rdx,eax
  803dae:	48 89 d0             	mov    rax,rdx
  803db1:	48 01 c0             	add    rax,rax
  803db4:	48 01 d0             	add    rax,rdx
  803db7:	48 c1 e0 08          	shl    rax,0x8
  803dbb:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803dc1:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  803dc7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803dca:	48 63 d0             	movsxd rdx,eax
  803dcd:	48 89 d0             	mov    rax,rdx
  803dd0:	48 01 c0             	add    rax,rax
  803dd3:	48 01 d0             	add    rax,rdx
  803dd6:	48 c1 e0 08          	shl    rax,0x8
  803dda:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803de0:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803de6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803de9:	48 63 d0             	movsxd rdx,eax
  803dec:	48 89 d0             	mov    rax,rdx
  803def:	48 01 c0             	add    rax,rax
  803df2:	48 01 d0             	add    rax,rdx
  803df5:	48 c1 e0 08          	shl    rax,0x8
  803df9:	48 05 ac 84 40 00    	add    rax,0x4084ac
  803dff:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  803e05:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803e08:	5d                   	pop    rbp
  803e09:	c3                   	ret    

0000000000803e0a <set_proc>:
void set_proc(long eax, long ebx, long ecx, long edx, long es, long cs, long ss, long ds, long fs, long gs, long esp,
              long ebp, long esi, long edi, long rip, long eflags, int proc_nr) {
  803e0a:	f3 0f 1e fa          	endbr64 
  803e0e:	55                   	push   rbp
  803e0f:	48 89 e5             	mov    rbp,rsp
  803e12:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803e16:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803e1a:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803e1e:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803e22:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  803e26:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803e2a:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  803e2d:	48 63 d0             	movsxd rdx,eax
  803e30:	48 89 d0             	mov    rax,rdx
  803e33:	48 01 c0             	add    rax,rax
  803e36:	48 01 d0             	add    rax,rdx
  803e39:	48 c1 e0 08          	shl    rax,0x8
  803e3d:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803e43:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=eax;
  803e47:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e4b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803e4f:	48 89 90 48 02 00 00 	mov    QWORD PTR [rax+0x248],rdx
    proc->regs.rbx=ebx;
  803e56:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e5a:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  803e5e:	48 89 90 60 02 00 00 	mov    QWORD PTR [rax+0x260],rdx
    proc->regs.rcx=ecx;
  803e65:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e69:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803e6d:	48 89 90 50 02 00 00 	mov    QWORD PTR [rax+0x250],rdx
    proc->regs.rdx=edx;
  803e74:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e78:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  803e7c:	48 89 90 58 02 00 00 	mov    QWORD PTR [rax+0x258],rdx
    proc->regs.es=es;
  803e83:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e87:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803e8b:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cs=cs;
  803e92:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e96:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803e9a:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ss=ss;
  803ea1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ea5:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803ea9:	48 89 90 98 02 00 00 	mov    QWORD PTR [rax+0x298],rdx
    proc->regs.ds=ds;
  803eb0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803eb4:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803eb8:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.fs=fs;
  803ebf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ec3:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803ec7:	48 89 90 a8 02 00 00 	mov    QWORD PTR [rax+0x2a8],rdx
    proc->regs.gs=gs;
  803ece:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ed2:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803ed6:	48 89 90 b0 02 00 00 	mov    QWORD PTR [rax+0x2b0],rdx
    proc->regs.rsp=esp;
  803edd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ee1:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803ee5:	48 89 90 68 02 00 00 	mov    QWORD PTR [rax+0x268],rdx
    proc->regs.rbp=ebp;
  803eec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ef0:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803ef4:	48 89 90 70 02 00 00 	mov    QWORD PTR [rax+0x270],rdx
    proc->regs.rsi=esi;
  803efb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803eff:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803f03:	48 89 90 78 02 00 00 	mov    QWORD PTR [rax+0x278],rdx
    proc->regs.rdi=edi;
  803f0a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f0e:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803f12:	48 89 90 80 02 00 00 	mov    QWORD PTR [rax+0x280],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  803f19:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f1d:	48 c7 80 40 02 00 00 	mov    QWORD PTR [rax+0x240],0x202
  803f24:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  803f28:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f2c:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  803f30:	48 89 90 38 02 00 00 	mov    QWORD PTR [rax+0x238],rdx

    proc->regs.cs=cs;
  803f37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f3b:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803f3f:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ds=ds;
  803f46:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f4a:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803f4e:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.es=es;
  803f55:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f59:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803f5d:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803f64:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803f68:	48 c7 80 30 02 00 00 	mov    QWORD PTR [rax+0x230],0x101000
  803f6f:	00 10 10 00 


}
  803f73:	90                   	nop
  803f74:	5d                   	pop    rbp
  803f75:	c3                   	ret    

0000000000803f76 <proc_zero>:
void proc_zero()
{
  803f76:	f3 0f 1e fa          	endbr64 
  803f7a:	55                   	push   rbp
  803f7b:	48 89 e5             	mov    rbp,rsp
    asm volatile("leave\n"
  803f7e:	c9                   	leave  
  803f7f:	58                   	pop    rax
  803f80:	8e d8                	mov    ds,eax
  803f82:	58                   	pop    rax
  803f83:	8e c0                	mov    es,eax
  803f85:	41 5f                	pop    r15
  803f87:	41 5e                	pop    r14
  803f89:	41 5d                	pop    r13
  803f8b:	41 5c                	pop    r12
  803f8d:	41 5b                	pop    r11
  803f8f:	41 5a                	pop    r10
  803f91:	41 59                	pop    r9
  803f93:	41 58                	pop    r8
  803f95:	5e                   	pop    rsi
  803f96:	5f                   	pop    rdi
  803f97:	5a                   	pop    rdx
  803f98:	59                   	pop    rcx
  803f99:	5b                   	pop    rbx
  803f9a:	48 8d 05 0d 00 00 00 	lea    rax,[rip+0xd]        # 803fae <dd>
  803fa1:	48 89 44 24 08       	mov    QWORD PTR [rsp+0x8],rax
  803fa6:	58                   	pop    rax
  803fa7:	e8 12 0f 00 00       	call   804ebe <eoi>
  803fac:	48 cf                	iretq  

0000000000803fae <dd>:
  803fae:	90                   	nop
                 "popq %rax\n"
                 "callq eoi\n"
                 "iretq\n"
                 "dd:\n"
                 "nop\n");
    while(1);
  803faf:	eb fe                	jmp    803faf <dd+0x1>

0000000000803fb1 <manage_proc>:
}
void manage_proc(){
  803fb1:	f3 0f 1e fa          	endbr64 
  803fb5:	55                   	push   rbp
  803fb6:	48 89 e5             	mov    rbp,rsp
  803fb9:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803fbd:	8b 05 49 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10549]        # 41450c <cur_proc>
  803fc3:	83 f8 ff             	cmp    eax,0xffffffff
  803fc6:	74 39                	je     804001 <manage_proc+0x50>
        task[cur_proc].utime++;
  803fc8:	8b 15 3e 05 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc1053e]        # 41450c <cur_proc>
  803fce:	48 63 ca             	movsxd rcx,edx
  803fd1:	48 89 c8             	mov    rax,rcx
  803fd4:	48 01 c0             	add    rax,rax
  803fd7:	48 01 c8             	add    rax,rcx
  803fda:	48 c1 e0 08          	shl    rax,0x8
  803fde:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803fe4:	8b 00                	mov    eax,DWORD PTR [rax]
  803fe6:	8d 48 01             	lea    ecx,[rax+0x1]
  803fe9:	48 63 d2             	movsxd rdx,edx
  803fec:	48 89 d0             	mov    rax,rdx
  803fef:	48 01 c0             	add    rax,rax
  803ff2:	48 01 d0             	add    rax,rdx
  803ff5:	48 c1 e0 08          	shl    rax,0x8
  803ff9:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803fff:	89 08                	mov    DWORD PTR [rax],ecx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  804001:	8b 05 05 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10505]        # 41450c <cur_proc>
  804007:	83 f8 ff             	cmp    eax,0xffffffff
  80400a:	74 4a                	je     804056 <manage_proc+0xa5>
  80400c:	8b 05 fa 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc104fa]        # 41450c <cur_proc>
  804012:	48 63 d0             	movsxd rdx,eax
  804015:	48 89 d0             	mov    rax,rdx
  804018:	48 01 c0             	add    rax,rax
  80401b:	48 01 d0             	add    rax,rdx
  80401e:	48 c1 e0 08          	shl    rax,0x8
  804022:	48 05 a8 84 40 00    	add    rax,0x4084a8
  804028:	8b 00                	mov    eax,DWORD PTR [rax]
  80402a:	83 f8 01             	cmp    eax,0x1
  80402d:	77 27                	ja     804056 <manage_proc+0xa5>
    task[cur_proc].stat!=READY){
  80402f:	8b 05 d7 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc104d7]        # 41450c <cur_proc>
  804035:	48 63 d0             	movsxd rdx,eax
  804038:	48 89 d0             	mov    rax,rdx
  80403b:	48 01 c0             	add    rax,rax
  80403e:	48 01 d0             	add    rax,rdx
  804041:	48 c1 e0 08          	shl    rax,0x8
  804045:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80404b:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  80404d:	83 f8 01             	cmp    eax,0x1
  804050:	0f 84 21 01 00 00    	je     804177 <manage_proc+0x1c6>
        if(cur_proc!=-1)
  804056:	8b 05 b0 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc104b0]        # 41450c <cur_proc>
  80405c:	83 f8 ff             	cmp    eax,0xffffffff
  80405f:	74 22                	je     804083 <manage_proc+0xd2>
            task[cur_proc].utime=0;
  804061:	8b 05 a5 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc104a5]        # 41450c <cur_proc>
  804067:	48 63 d0             	movsxd rdx,eax
  80406a:	48 89 d0             	mov    rax,rdx
  80406d:	48 01 c0             	add    rax,rax
  804070:	48 01 d0             	add    rax,rdx
  804073:	48 c1 e0 08          	shl    rax,0x8
  804077:	48 05 a8 84 40 00    	add    rax,0x4084a8
  80407d:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=0;
  804083:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  80408a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  804091:	eb 4f                	jmp    8040e2 <manage_proc+0x131>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  804093:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804096:	48 63 d0             	movsxd rdx,eax
  804099:	48 89 d0             	mov    rax,rdx
  80409c:	48 01 c0             	add    rax,rax
  80409f:	48 01 d0             	add    rax,rdx
  8040a2:	48 c1 e0 08          	shl    rax,0x8
  8040a6:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8040ac:	8b 00                	mov    eax,DWORD PTR [rax]
  8040ae:	83 f8 ff             	cmp    eax,0xffffffff
  8040b1:	74 2b                	je     8040de <manage_proc+0x12d>
  8040b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8040b6:	48 63 d0             	movsxd rdx,eax
  8040b9:	48 89 d0             	mov    rax,rdx
  8040bc:	48 01 c0             	add    rax,rax
  8040bf:	48 01 d0             	add    rax,rdx
  8040c2:	48 c1 e0 08          	shl    rax,0x8
  8040c6:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8040cc:	8b 00                	mov    eax,DWORD PTR [rax]
  8040ce:	83 f8 01             	cmp    eax,0x1
  8040d1:	75 0b                	jne    8040de <manage_proc+0x12d>
  8040d3:	8b 05 33 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10433]        # 41450c <cur_proc>
  8040d9:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8040dc:	75 0c                	jne    8040ea <manage_proc+0x139>
        for(i=0;i<MAX_PROC_COUNT;i++){
  8040de:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8040e2:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8040e6:	7e ab                	jle    804093 <manage_proc+0xe2>
  8040e8:	eb 01                	jmp    8040eb <manage_proc+0x13a>
                break;
  8040ea:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  8040eb:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8040ef:	0f 8f 85 00 00 00    	jg     80417a <manage_proc+0x1c9>
            return;
        //switch
        task[cur_proc].stat=READY;
  8040f5:	8b 05 11 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10411]        # 41450c <cur_proc>
  8040fb:	48 63 d0             	movsxd rdx,eax
  8040fe:	48 89 d0             	mov    rax,rdx
  804101:	48 01 c0             	add    rax,rax
  804104:	48 01 d0             	add    rax,rdx
  804107:	48 c1 e0 08          	shl    rax,0x8
  80410b:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804111:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        task[i].stat=RUNNING;
  804117:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80411a:	48 63 d0             	movsxd rdx,eax
  80411d:	48 89 d0             	mov    rax,rdx
  804120:	48 01 c0             	add    rax,rax
  804123:	48 01 d0             	add    rax,rdx
  804126:	48 c1 e0 08          	shl    rax,0x8
  80412a:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804130:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        switch_to(&task[cur_proc], &task[i]);
  804136:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804139:	48 63 d0             	movsxd rdx,eax
  80413c:	48 89 d0             	mov    rax,rdx
  80413f:	48 01 c0             	add    rax,rax
  804142:	48 01 d0             	add    rax,rdx
  804145:	48 c1 e0 08          	shl    rax,0x8
  804149:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  804150:	8b 05 b6 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc103b6]        # 41450c <cur_proc>
  804156:	48 63 c8             	movsxd rcx,eax
  804159:	48 89 c8             	mov    rax,rcx
  80415c:	48 01 c0             	add    rax,rax
  80415f:	48 01 c8             	add    rax,rcx
  804162:	48 c1 e0 08          	shl    rax,0x8
  804166:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80416c:	48 89 d6             	mov    rsi,rdx
  80416f:	48 89 c7             	mov    rdi,rax
  804172:	e8 fd 0a 00 00       	call   804c74 <switch_to>
    }
    return;
  804177:	90                   	nop
  804178:	eb 01                	jmp    80417b <manage_proc+0x1ca>
            return;
  80417a:	90                   	nop
}
  80417b:	c9                   	leave  
  80417c:	c3                   	ret    

000000000080417d <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  80417d:	f3 0f 1e fa          	endbr64 
  804181:	55                   	push   rbp
  804182:	48 89 e5             	mov    rbp,rsp
  804185:	48 83 ec 20          	sub    rsp,0x20
  804189:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  80418c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80418f:	01 c0                	add    eax,eax
  804191:	83 c0 05             	add    eax,0x5
  804194:	c1 e0 03             	shl    eax,0x3
  804197:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  80419a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80419d:	89 05 69 03 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10369],eax        # 41450c <cur_proc>
    switch_proc_asm(sel);
  8041a3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8041a6:	89 c7                	mov    edi,eax
  8041a8:	e8 0d 61 00 00       	call   80a2ba <switch_proc_asm>
}
  8041ad:	90                   	nop
  8041ae:	c9                   	leave  
  8041af:	c3                   	ret    

00000000008041b0 <switch_proc>:
void switch_proc(int pnr){
  8041b0:	f3 0f 1e fa          	endbr64 
  8041b4:	55                   	push   rbp
  8041b5:	48 89 e5             	mov    rbp,rsp
  8041b8:	48 81 ec 20 03 00 00 	sub    rsp,0x320
  8041bf:	89 bd ec fc ff ff    	mov    DWORD PTR [rbp-0x314],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  8041c5:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  8041cb:	48 63 d0             	movsxd rdx,eax
  8041ce:	48 89 d0             	mov    rax,rdx
  8041d1:	48 01 c0             	add    rax,rax
  8041d4:	48 01 d0             	add    rax,rdx
  8041d7:	48 c1 e0 08          	shl    rax,0x8
  8041db:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  8041e2:	48 8d 85 f0 fc ff ff 	lea    rax,[rbp-0x310]
  8041e9:	48 89 d6             	mov    rsi,rdx
  8041ec:	ba 60 00 00 00       	mov    edx,0x60
  8041f1:	48 89 c7             	mov    rdi,rax
  8041f4:	48 89 d1             	mov    rcx,rdx
  8041f7:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    save_context(&task[cur_proc].tss);
  8041fa:	8b 05 0c 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1030c]        # 41450c <cur_proc>
  804200:	48 63 d0             	movsxd rdx,eax
  804203:	48 89 d0             	mov    rax,rdx
  804206:	48 01 c0             	add    rax,rax
  804209:	48 01 d0             	add    rax,rdx
  80420c:	48 c1 e0 08          	shl    rax,0x8
  804210:	48 05 c0 01 00 00    	add    rax,0x1c0
  804216:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80421c:	48 83 c0 04          	add    rax,0x4
  804220:	48 89 c7             	mov    rdi,rax
  804223:	e8 53 00 00 00       	call   80427b <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  804228:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  80422e:	89 05 d8 02 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc102d8],eax        # 41450c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  804234:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  80423a:	01 c0                	add    eax,eax
  80423c:	83 c0 05             	add    eax,0x5
  80423f:	c1 e0 03             	shl    eax,0x3
  804242:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  804245:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  80424b:	48 63 d0             	movsxd rdx,eax
  80424e:	48 89 d0             	mov    rax,rdx
  804251:	48 01 c0             	add    rax,rax
  804254:	48 01 d0             	add    rax,rdx
  804257:	48 c1 e0 08          	shl    rax,0x8
  80425b:	48 05 c0 01 00 00    	add    rax,0x1c0
  804261:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804267:	48 83 c0 04          	add    rax,0x4
  80426b:	48 89 c6             	mov    rsi,rax
  80426e:	bf 00 00 00 00       	mov    edi,0x0
  804273:	e8 fc 09 00 00       	call   804c74 <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  804278:	90                   	nop
  804279:	c9                   	leave  
  80427a:	c3                   	ret    

000000000080427b <save_context>:
void save_context(TSS *tss)
{
  80427b:	f3 0f 1e fa          	endbr64 
  80427f:	55                   	push   rbp
  804280:	48 89 e5             	mov    rbp,rsp
  804283:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  804287:	90                   	nop
  804288:	5d                   	pop    rbp
  804289:	c3                   	ret    

000000000080428a <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  80428a:	f3 0f 1e fa          	endbr64 
  80428e:	55                   	push   rbp
  80428f:	48 89 e5             	mov    rbp,rsp
  804292:	48 83 ec 60          	sub    rsp,0x60
  804296:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  804299:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  80429c:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  80429f:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8042a5:	85 c0                	test   eax,eax
  8042a7:	0f 48 c2             	cmovs  eax,edx
  8042aa:	c1 f8 0c             	sar    eax,0xc
  8042ad:	89 c1                	mov    ecx,eax
  8042af:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  8042b2:	99                   	cdq    
  8042b3:	c1 ea 14             	shr    edx,0x14
  8042b6:	01 d0                	add    eax,edx
  8042b8:	25 ff 0f 00 00       	and    eax,0xfff
  8042bd:	29 d0                	sub    eax,edx
  8042bf:	01 c8                	add    eax,ecx
  8042c1:	85 c0                	test   eax,eax
  8042c3:	0f 95 c0             	setne  al
  8042c6:	0f b6 c0             	movzx  eax,al
  8042c9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  8042cc:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  8042d3:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8042da:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  8042db:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8042e2:	00 
    pgind++;
  8042e3:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  8042e8:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  8042ef:	e9 76 02 00 00       	jmp    80456a <palloc+0x2e0>
    {
        page_item* tblp=*pgind&0xfffff000;
  8042f4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8042f8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8042fb:	25 00 f0 ff ff       	and    eax,0xfffff000
  804300:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  804304:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  80430b:	e9 44 02 00 00       	jmp    804554 <palloc+0x2ca>
        {
            int v=*tblp&PAGE_PRESENT;
  804310:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804314:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804317:	83 e0 01             	and    eax,0x1
  80431a:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  80431d:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  804321:	0f 85 24 02 00 00    	jne    80454b <palloc+0x2c1>
            {
                int new_pg=req_a_page();
  804327:	b8 00 00 00 00       	mov    eax,0x0
  80432c:	e8 fe d0 ff ff       	call   80142f <req_a_page>
  804331:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  804334:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  804338:	0f 85 dc 00 00 00    	jne    80441a <palloc+0x190>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  80433e:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804341:	48 63 d0             	movsxd rdx,eax
  804344:	48 89 d0             	mov    rax,rdx
  804347:	48 01 c0             	add    rax,rax
  80434a:	48 01 d0             	add    rax,rdx
  80434d:	48 c1 e0 08          	shl    rax,0x8
  804351:	48 05 f4 84 40 00    	add    rax,0x4084f4
  804357:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80435a:	0f b7 c0             	movzx  eax,ax
  80435d:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804360:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804363:	48 63 d0             	movsxd rdx,eax
  804366:	48 89 d0             	mov    rax,rdx
  804369:	48 01 c0             	add    rax,rax
  80436c:	48 01 d0             	add    rax,rdx
  80436f:	48 c1 e0 08          	shl    rax,0x8
  804373:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804379:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  80437d:	0f b7 c0             	movzx  eax,ax
  804380:	c1 e0 10             	shl    eax,0x10
  804383:	25 00 00 0f 00       	and    eax,0xf0000
  804388:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  80438b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80438e:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  804391:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  804394:	89 c1                	mov    ecx,eax
  804396:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804399:	48 63 d0             	movsxd rdx,eax
  80439c:	48 89 d0             	mov    rax,rdx
  80439f:	48 01 c0             	add    rax,rax
  8043a2:	48 01 d0             	add    rax,rdx
  8043a5:	48 c1 e0 08          	shl    rax,0x8
  8043a9:	48 05 f4 84 40 00    	add    rax,0x4084f4
  8043af:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  8043b2:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8043b5:	48 63 d0             	movsxd rdx,eax
  8043b8:	48 89 d0             	mov    rax,rdx
  8043bb:	48 01 c0             	add    rax,rax
  8043be:	48 01 d0             	add    rax,rdx
  8043c1:	48 c1 e0 08          	shl    rax,0x8
  8043c5:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8043cb:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8043cf:	0f b7 c0             	movzx  eax,ax
  8043d2:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  8043d5:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  8043dc:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8043df:	c1 e8 10             	shr    eax,0x10
  8043e2:	83 e0 0f             	and    eax,0xf
  8043e5:	89 c2                	mov    edx,eax
  8043e7:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  8043ea:	01 d0                	add    eax,edx
  8043ec:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  8043ef:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  8043f2:	89 c1                	mov    ecx,eax
  8043f4:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8043f7:	48 63 d0             	movsxd rdx,eax
  8043fa:	48 89 d0             	mov    rax,rdx
  8043fd:	48 01 c0             	add    rax,rax
  804400:	48 01 d0             	add    rax,rdx
  804403:	48 c1 e0 08          	shl    rax,0x8
  804407:	48 05 f0 84 40 00    	add    rax,0x4084f0
  80440d:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  804411:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804415:	e9 62 01 00 00       	jmp    80457c <palloc+0x2f2>
                }
                int addr=get_phyaddr(new_pg);
  80441a:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  80441d:	89 c7                	mov    edi,eax
  80441f:	e8 b9 d1 ff ff       	call   8015dd <get_phyaddr>
  804424:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  804427:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  80442a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80442e:	ba 07 00 00 00       	mov    edx,0x7
  804433:	89 ce                	mov    esi,ecx
  804435:	48 89 c7             	mov    rdi,rax
  804438:	e8 b3 d1 ff ff       	call   8015f0 <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  80443d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804440:	c1 e0 0a             	shl    eax,0xa
  804443:	89 c2                	mov    edx,eax
  804445:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  804448:	01 d0                	add    eax,edx
  80444a:	c1 e0 0c             	shl    eax,0xc
  80444d:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  804450:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  804455:	75 09                	jne    804460 <palloc+0x1d6>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  804457:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80445a:	89 05 b4 00 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc100b4],eax        # 414514 <palloc_paddr>
                }
                page_c--;
  804460:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  804464:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  804468:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80446c:	0f 85 d9 00 00 00    	jne    80454b <palloc+0x2c1>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  804472:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804475:	48 63 d0             	movsxd rdx,eax
  804478:	48 89 d0             	mov    rax,rdx
  80447b:	48 01 c0             	add    rax,rax
  80447e:	48 01 d0             	add    rax,rdx
  804481:	48 c1 e0 08          	shl    rax,0x8
  804485:	48 05 f4 84 40 00    	add    rax,0x4084f4
  80448b:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80448e:	0f b7 c0             	movzx  eax,ax
  804491:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804494:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804497:	48 63 d0             	movsxd rdx,eax
  80449a:	48 89 d0             	mov    rax,rdx
  80449d:	48 01 c0             	add    rax,rax
  8044a0:	48 01 d0             	add    rax,rdx
  8044a3:	48 c1 e0 08          	shl    rax,0x8
  8044a7:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8044ad:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8044b1:	0f b7 c0             	movzx  eax,ax
  8044b4:	c1 e0 10             	shl    eax,0x10
  8044b7:	25 00 00 0f 00       	and    eax,0xf0000
  8044bc:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  8044bf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8044c2:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  8044c5:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  8044c8:	89 c1                	mov    ecx,eax
  8044ca:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8044cd:	48 63 d0             	movsxd rdx,eax
  8044d0:	48 89 d0             	mov    rax,rdx
  8044d3:	48 01 c0             	add    rax,rax
  8044d6:	48 01 d0             	add    rax,rdx
  8044d9:	48 c1 e0 08          	shl    rax,0x8
  8044dd:	48 05 f4 84 40 00    	add    rax,0x4084f4
  8044e3:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  8044e6:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8044e9:	48 63 d0             	movsxd rdx,eax
  8044ec:	48 89 d0             	mov    rax,rdx
  8044ef:	48 01 c0             	add    rax,rax
  8044f2:	48 01 d0             	add    rax,rdx
  8044f5:	48 c1 e0 08          	shl    rax,0x8
  8044f9:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8044ff:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804503:	0f b7 c0             	movzx  eax,ax
  804506:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  804509:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804510:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804513:	c1 e8 10             	shr    eax,0x10
  804516:	83 e0 0f             	and    eax,0xf
  804519:	89 c2                	mov    edx,eax
  80451b:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  80451e:	01 d0                	add    eax,edx
  804520:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  804523:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804526:	89 c1                	mov    ecx,eax
  804528:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80452b:	48 63 d0             	movsxd rdx,eax
  80452e:	48 89 d0             	mov    rax,rdx
  804531:	48 01 c0             	add    rax,rax
  804534:	48 01 d0             	add    rax,rdx
  804537:	48 c1 e0 08          	shl    rax,0x8
  80453b:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804541:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;
  804545:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804549:	eb 31                	jmp    80457c <palloc+0x2f2>
                }
            }
            tblp++;
  80454b:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  804550:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  804554:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  80455b:	0f 8e af fd ff ff    	jle    804310 <palloc+0x86>
        }
        pgind++;
  804561:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  804566:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80456a:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804571:	0f 8e 7d fd ff ff    	jle    8042f4 <palloc+0x6a>
    }
    return NULL;
  804577:	b8 00 00 00 00       	mov    eax,0x0
}
  80457c:	c9                   	leave  
  80457d:	c3                   	ret    

000000000080457e <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  80457e:	f3 0f 1e fa          	endbr64 
  804582:	55                   	push   rbp
  804583:	48 89 e5             	mov    rbp,rsp
  804586:	48 83 ec 10          	sub    rsp,0x10
  80458a:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  80458d:	8b 05 79 ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ff79]        # 41450c <cur_proc>
  804593:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804596:	89 d6                	mov    esi,edx
  804598:	89 c7                	mov    edi,eax
  80459a:	e8 eb fc ff ff       	call   80428a <palloc>
}
  80459f:	c9                   	leave  
  8045a0:	c3                   	ret    

00000000008045a1 <proc_end>:
void proc_end()
{
  8045a1:	f3 0f 1e fa          	endbr64 
  8045a5:	55                   	push   rbp
  8045a6:	48 89 e5             	mov    rbp,rsp
  8045a9:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  8045ad:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  8045b0:	8b 05 56 ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ff56]        # 41450c <cur_proc>
  8045b6:	89 c7                	mov    edi,eax
  8045b8:	e8 90 00 00 00       	call   80464d <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  8045bd:	8b 05 49 ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ff49]        # 41450c <cur_proc>
  8045c3:	48 63 d0             	movsxd rdx,eax
  8045c6:	48 89 d0             	mov    rax,rdx
  8045c9:	48 01 c0             	add    rax,rax
  8045cc:	48 01 d0             	add    rax,rdx
  8045cf:	48 c1 e0 08          	shl    rax,0x8
  8045d3:	48 05 28 85 40 00    	add    rax,0x408528
  8045d9:	8b 00                	mov    eax,DWORD PTR [rax]
  8045db:	83 f8 ff             	cmp    eax,0xffffffff
  8045de:	74 60                	je     804640 <proc_end+0x9f>
        task[task[cur_proc].parent_pid].stat=READY;
  8045e0:	8b 05 26 ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ff26]        # 41450c <cur_proc>
  8045e6:	48 63 d0             	movsxd rdx,eax
  8045e9:	48 89 d0             	mov    rax,rdx
  8045ec:	48 01 c0             	add    rax,rax
  8045ef:	48 01 d0             	add    rax,rdx
  8045f2:	48 c1 e0 08          	shl    rax,0x8
  8045f6:	48 05 28 85 40 00    	add    rax,0x408528
  8045fc:	8b 00                	mov    eax,DWORD PTR [rax]
  8045fe:	89 c2                	mov    edx,eax
  804600:	48 89 d0             	mov    rax,rdx
  804603:	48 01 c0             	add    rax,rax
  804606:	48 01 d0             	add    rax,rdx
  804609:	48 c1 e0 08          	shl    rax,0x8
  80460d:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804613:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  804619:	8b 05 ed fe c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0feed]        # 41450c <cur_proc>
  80461f:	48 63 d0             	movsxd rdx,eax
  804622:	48 89 d0             	mov    rax,rdx
  804625:	48 01 c0             	add    rax,rax
  804628:	48 01 d0             	add    rax,rdx
  80462b:	48 c1 e0 08          	shl    rax,0x8
  80462f:	48 05 28 85 40 00    	add    rax,0x408528
  804635:	8b 00                	mov    eax,DWORD PTR [rax]
  804637:	89 c7                	mov    edi,eax
  804639:	e8 3f fb ff ff       	call   80417d <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  80463e:	eb 0a                	jmp    80464a <proc_end+0xa9>
        switch_proc_tss(0);
  804640:	bf 00 00 00 00       	mov    edi,0x0
  804645:	e8 33 fb ff ff       	call   80417d <switch_proc_tss>
}
  80464a:	90                   	nop
  80464b:	c9                   	leave  
  80464c:	c3                   	ret    

000000000080464d <del_proc>:
void del_proc(int pnr)
{
  80464d:	f3 0f 1e fa          	endbr64 
  804651:	55                   	push   rbp
  804652:	48 89 e5             	mov    rbp,rsp
  804655:	48 83 ec 30          	sub    rsp,0x30
  804659:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  80465c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80465f:	48 63 d0             	movsxd rdx,eax
  804662:	48 89 d0             	mov    rax,rdx
  804665:	48 01 c0             	add    rax,rax
  804668:	48 01 d0             	add    rax,rdx
  80466b:	48 c1 e0 08          	shl    rax,0x8
  80466f:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804675:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  80467b:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80467e:	48 63 d0             	movsxd rdx,eax
  804681:	48 89 d0             	mov    rax,rdx
  804684:	48 01 c0             	add    rax,rax
  804687:	48 01 d0             	add    rax,rdx
  80468a:	48 c1 e0 08          	shl    rax,0x8
  80468e:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804694:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  80469a:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  80469f:	eb 63                	jmp    804704 <del_proc+0xb7>
    {
        page_item *tp=*p&0xfffff000;
  8046a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8046a5:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8046a8:	25 00 f0 ff ff       	and    eax,0xfffff000
  8046ad:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  8046b1:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8046b8:	eb 30                	jmp    8046ea <del_proc+0x9d>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  8046ba:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8046be:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8046c1:	83 e0 01             	and    eax,0x1
  8046c4:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  8046c7:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  8046cb:	74 14                	je     8046e1 <del_proc+0x94>
            {
                free_page(*tp&0xfffff000);
  8046cd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8046d1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8046d4:	25 00 f0 ff ff       	and    eax,0xfffff000
  8046d9:	48 89 c7             	mov    rdi,rax
  8046dc:	e8 1e ce ff ff       	call   8014ff <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  8046e1:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  8046e6:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8046ea:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  8046f1:	7e c7                	jle    8046ba <del_proc+0x6d>
        }
        vmfree(tp);
  8046f3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8046f7:	48 89 c7             	mov    rdi,rax
  8046fa:	e8 2b ca ff ff       	call   80112a <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  8046ff:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  804704:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804708:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80470b:	83 e0 01             	and    eax,0x1
  80470e:	48 85 c0             	test   rax,rax
  804711:	75 8e                	jne    8046a1 <del_proc+0x54>
    }
    //释放存放页目录的页面
    vmfree(p);
  804713:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804717:	48 89 c7             	mov    rdi,rax
  80471a:	e8 0b ca ff ff       	call   80112a <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  80471f:	90                   	nop
  804720:	c9                   	leave  
  804721:	c3                   	ret    

0000000000804722 <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  804722:	f3 0f 1e fa          	endbr64 
  804726:	55                   	push   rbp
  804727:	48 89 e5             	mov    rbp,rsp
  80472a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80472d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  804730:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  804734:	75 0a                	jne    804740 <set_proc_stat+0x1e>
  804736:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80473b:	e9 8c 00 00 00       	jmp    8047cc <set_proc_stat+0xaa>
    int i=0;
  804740:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  804747:	eb 04                	jmp    80474d <set_proc_stat+0x2b>
  804749:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80474d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804750:	48 63 d0             	movsxd rdx,eax
  804753:	48 89 d0             	mov    rax,rdx
  804756:	48 01 c0             	add    rax,rax
  804759:	48 01 d0             	add    rax,rdx
  80475c:	48 c1 e0 08          	shl    rax,0x8
  804760:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804766:	8b 10                	mov    edx,DWORD PTR [rax]
  804768:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80476b:	39 c2                	cmp    edx,eax
  80476d:	75 da                	jne    804749 <set_proc_stat+0x27>
    if(i==MAX_PROC_COUNT)return -1;
  80476f:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  804773:	75 07                	jne    80477c <set_proc_stat+0x5a>
  804775:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80477a:	eb 50                	jmp    8047cc <set_proc_stat+0xaa>
    task[i].stat=stat;
  80477c:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80477f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804782:	48 63 c8             	movsxd rcx,eax
  804785:	48 89 c8             	mov    rax,rcx
  804788:	48 01 c0             	add    rax,rax
  80478b:	48 01 c8             	add    rax,rcx
  80478e:	48 c1 e0 08          	shl    rax,0x8
  804792:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804798:	89 10                	mov    DWORD PTR [rax],edx
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  80479a:	8b 05 6c fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fd6c]        # 41450c <cur_proc>
  8047a0:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8047a3:	75 22                	jne    8047c7 <set_proc_stat+0xa5>
        task[cur_proc].utime=MAX_UTIME;
  8047a5:	8b 05 61 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fd61]        # 41450c <cur_proc>
  8047ab:	48 63 d0             	movsxd rdx,eax
  8047ae:	48 89 d0             	mov    rax,rdx
  8047b1:	48 01 c0             	add    rax,rax
  8047b4:	48 01 d0             	add    rax,rdx
  8047b7:	48 c1 e0 08          	shl    rax,0x8
  8047bb:	48 05 a8 84 40 00    	add    rax,0x4084a8
  8047c1:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  8047c7:	b8 00 00 00 00       	mov    eax,0x0
}
  8047cc:	5d                   	pop    rbp
  8047cd:	c3                   	ret    

00000000008047ce <add_proc_openf>:

    return 0;
} */

int add_proc_openf(vfs_dir_entry *entry)
{
  8047ce:	f3 0f 1e fa          	endbr64 
  8047d2:	55                   	push   rbp
  8047d3:	48 89 e5             	mov    rbp,rsp
  8047d6:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8047da:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8047e1:	eb 6a                	jmp    80484d <add_proc_openf+0x7f>
        if(task[cur_proc].openf[i]==NULL)
  8047e3:	8b 05 23 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fd23]        # 41450c <cur_proc>
  8047e9:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8047ec:	48 63 ca             	movsxd rcx,edx
  8047ef:	48 63 d0             	movsxd rdx,eax
  8047f2:	48 89 d0             	mov    rax,rdx
  8047f5:	48 01 c0             	add    rax,rax
  8047f8:	48 01 d0             	add    rax,rdx
  8047fb:	48 c1 e0 05          	shl    rax,0x5
  8047ff:	48 01 c8             	add    rax,rcx
  804802:	48 83 c0 18          	add    rax,0x18
  804806:	48 8b 04 c5 a4 84 40 	mov    rax,QWORD PTR [rax*8+0x4084a4]
  80480d:	00 
  80480e:	48 85 c0             	test   rax,rax
  804811:	75 36                	jne    804849 <add_proc_openf+0x7b>
        {
            task[cur_proc].openf[i]=entry;
  804813:	8b 05 f3 fc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fcf3]        # 41450c <cur_proc>
  804819:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80481c:	48 63 ca             	movsxd rcx,edx
  80481f:	48 63 d0             	movsxd rdx,eax
  804822:	48 89 d0             	mov    rax,rdx
  804825:	48 01 c0             	add    rax,rax
  804828:	48 01 d0             	add    rax,rdx
  80482b:	48 c1 e0 05          	shl    rax,0x5
  80482f:	48 01 c8             	add    rax,rcx
  804832:	48 8d 50 18          	lea    rdx,[rax+0x18]
  804836:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80483a:	48 89 04 d5 a4 84 40 	mov    QWORD PTR [rdx*8+0x4084a4],rax
  804841:	00 
            return 0;
  804842:	b8 00 00 00 00       	mov    eax,0x0
  804847:	eb 0f                	jmp    804858 <add_proc_openf+0x8a>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  804849:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80484d:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  804851:	7e 90                	jle    8047e3 <add_proc_openf+0x15>
        }
    }
    return -1;//full
  804853:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  804858:	5d                   	pop    rbp
  804859:	c3                   	ret    

000000000080485a <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  80485a:	f3 0f 1e fa          	endbr64 
  80485e:	55                   	push   rbp
  80485f:	48 89 e5             	mov    rbp,rsp
  804862:	48 83 ec 10          	sub    rsp,0x10
  804866:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  804869:	8b 05 9d fc c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fc9d]        # 41450c <cur_proc>
  80486f:	89 c7                	mov    edi,eax
  804871:	e8 d7 fd ff ff       	call   80464d <del_proc>
    return code;
  804876:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  804879:	c9                   	leave  
  80487a:	c3                   	ret    

000000000080487b <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(int entry, vfs_dir_entry *cwd, vfs_dir_entry *exef)
{
  80487b:	f3 0f 1e fa          	endbr64 
  80487f:	55                   	push   rbp
  804880:	48 89 e5             	mov    rbp,rsp
  804883:	48 83 ec 40          	sub    rsp,0x40
  804887:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  80488a:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  80488e:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    
    int i=req_proc();
  804892:	b8 00 00 00 00       	mov    eax,0x0
  804897:	e8 75 f4 ff ff       	call   803d11 <req_proc>
  80489c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(i==-1)return -1;
  80489f:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  8048a3:	75 0a                	jne    8048af <reg_proc+0x34>
  8048a5:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8048aa:	e9 65 01 00 00       	jmp    804a14 <reg_proc+0x199>
    /*set_proc(0,0,0,0,SEL_LDT_DATA,SEL_LDT_CODE,SEL_LDT_STACK,SEL_LDT_DATA\
    ,SEL_LDT_DATA,SEL_LDT_DATA,0x1c00000-4,0,0,0,0,i);*/
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10\
  8048af:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8048b2:	50                   	push   rax
  8048b3:	6a 00                	push   0x0
  8048b5:	6a 00                	push   0x0
  8048b7:	6a 00                	push   0x0
  8048b9:	6a 00                	push   0x0
  8048bb:	6a 00                	push   0x0
  8048bd:	68 fc ff bf 01       	push   0x1bffffc
  8048c2:	6a 10                	push   0x10
  8048c4:	6a 10                	push   0x10
  8048c6:	6a 10                	push   0x10
  8048c8:	6a 10                	push   0x10
  8048ca:	41 b9 08 00 00 00    	mov    r9d,0x8
  8048d0:	41 b8 10 00 00 00    	mov    r8d,0x10
  8048d6:	b9 00 00 00 00       	mov    ecx,0x0
  8048db:	ba 00 00 00 00       	mov    edx,0x0
  8048e0:	be 00 00 00 00       	mov    esi,0x0
  8048e5:	bf 00 00 00 00       	mov    edi,0x0
  8048ea:	e8 1b f5 ff ff       	call   803e0a <set_proc>
  8048ef:	48 83 c4 58          	add    rsp,0x58
, 0x10, 0x10, 0x1c00000 - 4, 0, 0, 0, 0, 0, i);
    task[i].pml4=vmalloc();
  8048f3:	b8 00 00 00 00       	mov    eax,0x0
  8048f8:	e8 9e c7 ff ff       	call   80109b <vmalloc>
  8048fd:	48 89 c1             	mov    rcx,rax
  804900:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804903:	48 63 d0             	movsxd rdx,eax
  804906:	48 89 d0             	mov    rax,rdx
  804909:	48 01 c0             	add    rax,rax
  80490c:	48 01 d0             	add    rax,rdx
  80490f:	48 c1 e0 08          	shl    rax,0x8
  804913:	48 05 40 85 40 00    	add    rax,0x408540
  804919:	48 89 48 0c          	mov    QWORD PTR [rax+0xc],rcx
    int *pt=vmalloc();
  80491d:	b8 00 00 00 00       	mov    eax,0x0
  804922:	e8 74 c7 ff ff       	call   80109b <vmalloc>
  804927:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    task[i].pml4[0]=PAGE_TABLE_ADDR|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;
  80492b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80492e:	48 63 d0             	movsxd rdx,eax
  804931:	48 89 d0             	mov    rax,rdx
  804934:	48 01 c0             	add    rax,rax
  804937:	48 01 d0             	add    rax,rdx
  80493a:	48 c1 e0 08          	shl    rax,0x8
  80493e:	48 05 40 85 40 00    	add    rax,0x408540
  804944:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804948:	48 c7 00 07 20 00 00 	mov    QWORD PTR [rax],0x2007
    /*for(int j=0;j<32;j++)
        pt[j]=(PAGE_TABLE_ADDR+j*0x1000)|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;//复制内核页表*/
    //PAGE_TABLE_ADDR|PAGE_PRESENT;//复制内核页表
    //task[i].pml4[7]=PAGE_TABLE_ADDR+7*0x1000|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//sys.dll
    int *stackb=vmalloc();
  80494f:	b8 00 00 00 00       	mov    eax,0x0
  804954:	e8 42 c7 ff ff       	call   80109b <vmalloc>
  804959:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    task[i].pml4[6]=(int)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  80495d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804961:	83 c8 07             	or     eax,0x7
  804964:	89 c1                	mov    ecx,eax
  804966:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804969:	48 63 d0             	movsxd rdx,eax
  80496c:	48 89 d0             	mov    rax,rdx
  80496f:	48 01 c0             	add    rax,rax
  804972:	48 01 d0             	add    rax,rdx
  804975:	48 c1 e0 08          	shl    rax,0x8
  804979:	48 05 40 85 40 00    	add    rax,0x408540
  80497f:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  804983:	48 8d 50 30          	lea    rdx,[rax+0x30]
  804987:	48 63 c1             	movsxd rax,ecx
  80498a:	48 89 02             	mov    QWORD PTR [rdx],rax
    stackb[1023]=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  80498d:	b8 00 00 00 00       	mov    eax,0x0
  804992:	e8 98 ca ff ff       	call   80142f <req_a_page>
  804997:	89 c7                	mov    edi,eax
  804999:	e8 3f cc ff ff       	call   8015dd <get_phyaddr>
  80499e:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  8049a2:	48 81 c2 fc 0f 00 00 	add    rdx,0xffc
  8049a9:	83 c8 07             	or     eax,0x7
  8049ac:	89 02                	mov    DWORD PTR [rdx],eax
//    task[i].tss.cr3=task[i].pml4;

    task[i].stat=READY;
  8049ae:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8049b1:	48 63 d0             	movsxd rdx,eax
  8049b4:	48 89 d0             	mov    rax,rdx
  8049b7:	48 01 c0             	add    rax,rax
  8049ba:	48 01 d0             	add    rax,rdx
  8049bd:	48 c1 e0 08          	shl    rax,0x8
  8049c1:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8049c7:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  8049cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8049d0:	48 63 d0             	movsxd rdx,eax
  8049d3:	48 89 d0             	mov    rax,rdx
  8049d6:	48 01 c0             	add    rax,rax
  8049d9:	48 01 d0             	add    rax,rdx
  8049dc:	48 c1 e0 08          	shl    rax,0x8
  8049e0:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  8049e7:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8049eb:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].exef=exef;
  8049ef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8049f2:	48 63 d0             	movsxd rdx,eax
  8049f5:	48 89 d0             	mov    rax,rdx
  8049f8:	48 01 c0             	add    rax,rax
  8049fb:	48 01 d0             	add    rax,rdx
  8049fe:	48 c1 e0 08          	shl    rax,0x8
  804a02:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  804a09:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  804a0d:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    task[i].tss.ss=0x10;
    task[i].tss.gs=0x10;
    task[i].tss.fs=0x10;
    task[i].tss.cs=0x8;*/
//    task[i].tss.eip=entry;
    return i;
  804a11:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  804a14:	c9                   	leave  
  804a15:	c3                   	ret    

0000000000804a16 <sys_malloc>:

void * sys_malloc(int size)
{
  804a16:	f3 0f 1e fa          	endbr64 
  804a1a:	55                   	push   rbp
  804a1b:	48 89 e5             	mov    rbp,rsp
  804a1e:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  804a21:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804a24:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  804a2a:	85 c0                	test   eax,eax
  804a2c:	0f 48 c2             	cmovs  eax,edx
  804a2f:	c1 f8 0c             	sar    eax,0xc
  804a32:	89 c1                	mov    ecx,eax
  804a34:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804a37:	99                   	cdq    
  804a38:	c1 ea 14             	shr    edx,0x14
  804a3b:	01 d0                	add    eax,edx
  804a3d:	25 ff 0f 00 00       	and    eax,0xfff
  804a42:	29 d0                	sub    eax,edx
  804a44:	01 c8                	add    eax,ecx
  804a46:	85 c0                	test   eax,eax
  804a48:	0f 95 c0             	setne  al
  804a4b:	0f b6 c0             	movzx  eax,al
  804a4e:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  804a51:	8b 05 b5 fa c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fab5]        # 41450c <cur_proc>
  804a57:	48 63 d0             	movsxd rdx,eax
  804a5a:	48 89 d0             	mov    rax,rdx
  804a5d:	48 01 c0             	add    rax,rax
  804a60:	48 01 d0             	add    rax,rdx
  804a63:	48 c1 e0 08          	shl    rax,0x8
  804a67:	48 05 b4 84 40 00    	add    rax,0x4084b4
  804a6d:	8b 00                	mov    eax,DWORD PTR [rax]
  804a6f:	48 98                	cdqe   
  804a71:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804a75:	eb 0c                	jmp    804a83 <sys_malloc+0x6d>
        hp=hp->next;
  804a77:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a7b:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804a7f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  804a83:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a87:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804a8b:	48 85 c0             	test   rax,rax
  804a8e:	74 16                	je     804aa6 <sys_malloc+0x90>
  804a90:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a94:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804a97:	85 c0                	test   eax,eax
  804a99:	75 0b                	jne    804aa6 <sys_malloc+0x90>
  804a9b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a9f:	8b 00                	mov    eax,DWORD PTR [rax]
  804aa1:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804aa4:	7e d1                	jle    804a77 <sys_malloc+0x61>
    if(hp->pgn<n)
  804aa6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804aaa:	8b 00                	mov    eax,DWORD PTR [rax]
  804aac:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804aaf:	0f 8e 8d 00 00 00    	jle    804b42 <sys_malloc+0x12c>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  804ab5:	8b 05 51 fa c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fa51]        # 41450c <cur_proc>
  804abb:	48 63 d0             	movsxd rdx,eax
  804abe:	48 89 d0             	mov    rax,rdx
  804ac1:	48 01 c0             	add    rax,rax
  804ac4:	48 01 d0             	add    rax,rdx
  804ac7:	48 c1 e0 08          	shl    rax,0x8
  804acb:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804ad1:	8b 10                	mov    edx,DWORD PTR [rax]
  804ad3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804ad6:	c1 e0 0c             	shl    eax,0xc
  804ad9:	01 d0                	add    eax,edx
  804adb:	3d ff ff ef 01       	cmp    eax,0x1efffff
  804ae0:	7e 0a                	jle    804aec <sys_malloc+0xd6>
        {
            //超过顶部
            return NULL;
  804ae2:	b8 00 00 00 00       	mov    eax,0x0
  804ae7:	e9 cf 00 00 00       	jmp    804bbb <sys_malloc+0x1a5>
        }
        int needed=n-hp->pgn;
  804aec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804af0:	8b 10                	mov    edx,DWORD PTR [rax]
  804af2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804af5:	29 d0                	sub    eax,edx
  804af7:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  804afa:	8b 05 0c fa c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fa0c]        # 41450c <cur_proc>
  804b00:	48 63 d0             	movsxd rdx,eax
  804b03:	48 89 d0             	mov    rax,rdx
  804b06:	48 01 c0             	add    rax,rax
  804b09:	48 01 d0             	add    rax,rdx
  804b0c:	48 c1 e0 08          	shl    rax,0x8
  804b10:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804b16:	8b 00                	mov    eax,DWORD PTR [rax]
  804b18:	48 98                	cdqe   
  804b1a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804b1e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804b25:	eb 13                	jmp    804b3a <sys_malloc+0x124>
        {
            *p=0;//触发缺页中断
  804b27:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b2b:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  804b2e:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804b35:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804b36:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804b3a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b3d:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  804b40:	7c e5                	jl     804b27 <sys_malloc+0x111>
        }
    }
    if(hp->pgn>n)
  804b42:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b46:	8b 00                	mov    eax,DWORD PTR [rax]
  804b48:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804b4b:	7d 59                	jge    804ba6 <sys_malloc+0x190>
    {
        //在后面新建一个头
        char *p=hp;
  804b4d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b51:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804b55:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804b58:	83 c0 01             	add    eax,0x1
  804b5b:	c1 e0 0c             	shl    eax,0xc
  804b5e:	48 98                	cdqe   
  804b60:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804b64:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804b68:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  804b6c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b70:	8b 00                	mov    eax,DWORD PTR [rax]
  804b72:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  804b75:	8d 50 ff             	lea    edx,[rax-0x1]
  804b78:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804b7c:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  804b7e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b82:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804b86:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804b8a:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  804b8e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804b92:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804b96:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804b9a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b9e:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804ba2:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804ba6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804baa:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  804bb1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bb5:	48 05 00 10 00 00    	add    rax,0x1000
}
  804bbb:	5d                   	pop    rbp
  804bbc:	c3                   	ret    

0000000000804bbd <sys_free>:
int sys_free(int ptr)
{
  804bbd:	f3 0f 1e fa          	endbr64 
  804bc1:	55                   	push   rbp
  804bc2:	48 89 e5             	mov    rbp,rsp
  804bc5:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  804bc8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804bcb:	2d 00 10 00 00       	sub    eax,0x1000
  804bd0:	48 98                	cdqe   
  804bd2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  804bd6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804bda:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  804be1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804be5:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804be9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804bed:	eb 2e                	jmp    804c1d <sys_free+0x60>
    {
        if(p->alloc==0)
  804bef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bf3:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804bf6:	85 c0                	test   eax,eax
  804bf8:	75 2c                	jne    804c26 <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  804bfa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804bfe:	8b 10                	mov    edx,DWORD PTR [rax]
  804c00:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c04:	8b 00                	mov    eax,DWORD PTR [rax]
  804c06:	83 c0 01             	add    eax,0x1
  804c09:	01 c2                	add    edx,eax
  804c0b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c0f:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  804c11:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c15:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804c19:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804c1d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804c22:	75 cb                	jne    804bef <sys_free+0x32>
  804c24:	eb 01                	jmp    804c27 <sys_free+0x6a>
            break;
  804c26:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  804c27:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c2b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804c2f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804c33:	eb 2e                	jmp    804c63 <sys_free+0xa6>
    {
        if(p->alloc==0)
  804c35:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c39:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804c3c:	85 c0                	test   eax,eax
  804c3e:	75 2c                	jne    804c6c <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  804c40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c44:	8b 10                	mov    edx,DWORD PTR [rax]
  804c46:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804c4a:	8b 00                	mov    eax,DWORD PTR [rax]
  804c4c:	83 c0 01             	add    eax,0x1
  804c4f:	01 c2                	add    edx,eax
  804c51:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c55:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  804c57:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804c5b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804c5f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804c63:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804c68:	75 cb                	jne    804c35 <sys_free+0x78>
  804c6a:	eb 01                	jmp    804c6d <sys_free+0xb0>
            break;
  804c6c:	90                   	nop
    }
    //合并完成
    return 0;
  804c6d:	b8 00 00 00 00       	mov    eax,0x0
}
  804c72:	5d                   	pop    rbp
  804c73:	c3                   	ret    

0000000000804c74 <switch_to>:

void switch_to(struct process *from, struct process *to) {
  804c74:	f3 0f 1e fa          	endbr64 
  804c78:	55                   	push   rbp
  804c79:	48 89 e5             	mov    rbp,rsp
  804c7c:	53                   	push   rbx
  804c7d:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  804c81:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  804c85:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804c89:	48 2d a0 84 40 00    	sub    rax,0x4084a0
  804c8f:	48 c1 f8 08          	sar    rax,0x8
  804c93:	48 89 c2             	mov    rdx,rax
  804c96:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
  804c9d:	aa aa aa 
  804ca0:	48 0f af c2          	imul   rax,rdx
  804ca4:	89 05 62 f8 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0f862],eax        # 41450c <cur_proc>
    asm volatile("mov %%rsp,%0\r\n"
  804caa:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  804cae:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  804cb2:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  804cb6:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  804cba:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804cbe:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804cc2:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804cc6:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  804cca:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  804cce:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  804cd2:	49 89 a1 68 02 00 00 	mov    QWORD PTR [r9+0x268],rsp
  804cd9:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 804d04 <done>
  804ce0:	49 89 82 38 02 00 00 	mov    QWORD PTR [r10+0x238],rax
  804ce7:	41 8c a3 a8 02 00 00 	mov    WORD PTR [r11+0x2a8],fs
  804cee:	8c ab b0 02 00 00    	mov    WORD PTR [rbx+0x2b0],gs
  804cf4:	48 8b a1 68 02 00 00 	mov    rsp,QWORD PTR [rcx+0x268]
  804cfb:	41 ff b0 38 02 00 00 	push   QWORD PTR [r8+0x238]
  804d02:	eb 08                	jmp    804d0c <__switch_to>

0000000000804d04 <done>:
  804d04:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  804d05:	90                   	nop
  804d06:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804d0a:	c9                   	leave  
  804d0b:	c3                   	ret    

0000000000804d0c <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  804d0c:	f3 0f 1e fa          	endbr64 
  804d10:	55                   	push   rbp
  804d11:	48 89 e5             	mov    rbp,rsp
  804d14:	53                   	push   rbx
  804d15:	48 83 ec 18          	sub    rsp,0x18
  804d19:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  804d1d:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804d21:	48 8b 05 f8 56 00 00 	mov    rax,QWORD PTR [rip+0x56f8]        # 80a420 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804d28:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804d2c:	48 8b 05 ed 56 00 00 	mov    rax,QWORD PTR [rip+0x56ed]        # 80a420 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804d33:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804d37:	48 8b 05 e2 56 00 00 	mov    rax,QWORD PTR [rip+0x56e2]        # 80a420 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804d3e:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804d42:	48 8b 05 d7 56 00 00 	mov    rax,QWORD PTR [rip+0x56d7]        # 80a420 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804d49:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804d4d:	48 8b 05 cc 56 00 00 	mov    rax,QWORD PTR [rip+0x56cc]        # 80a420 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804d54:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  804d58:	48 8b 05 c1 56 00 00 	mov    rax,QWORD PTR [rip+0x56c1]        # 80a420 <tss>
  804d5f:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  804d63:	48 8b 05 b6 56 00 00 	mov    rax,QWORD PTR [rip+0x56b6]        # 80a420 <tss>
  804d6a:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  804d6e:	48 8b 05 ab 56 00 00 	mov    rax,QWORD PTR [rip+0x56ab]        # 80a420 <tss>
  804d75:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  804d79:	48 8b 05 a0 56 00 00 	mov    rax,QWORD PTR [rip+0x56a0]        # 80a420 <tss>
  804d80:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  804d84:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804d88:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  804d8f:	41 52                	push   r10
  804d91:	41 51                	push   r9
  804d93:	41 50                	push   r8
  804d95:	57                   	push   rdi
  804d96:	49 89 d9             	mov    r9,rbx
  804d99:	4d 89 d8             	mov    r8,r11
  804d9c:	48 89 c7             	mov    rdi,rax
  804d9f:	e8 33 00 00 00       	call   804dd7 <set_tss>
  804da4:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  804da8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804dac:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  804db0:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804db4:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804db8:	8c a0 a8 02 00 00    	mov    WORD PTR [rax+0x2a8],fs
  804dbe:	8c ae b0 02 00 00    	mov    WORD PTR [rsi+0x2b0],gs
  804dc4:	8e a2 a8 02 00 00    	mov    fs,WORD PTR [rdx+0x2a8]
  804dca:	8e a9 b0 02 00 00    	mov    gs,WORD PTR [rcx+0x2b0]
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  804dd0:	90                   	nop
  804dd1:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804dd5:	c9                   	leave  
  804dd6:	c3                   	ret    

0000000000804dd7 <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  804dd7:	f3 0f 1e fa          	endbr64 
  804ddb:	55                   	push   rbp
  804ddc:	48 89 e5             	mov    rbp,rsp
  804ddf:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804de3:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804de7:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  804deb:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  804def:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  804df3:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  804df7:	48 8b 05 22 56 00 00 	mov    rax,QWORD PTR [rip+0x5622]        # 80a420 <tss>
  804dfe:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804e02:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  804e06:	48 8b 05 13 56 00 00 	mov    rax,QWORD PTR [rip+0x5613]        # 80a420 <tss>
  804e0d:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804e11:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  804e15:	48 8b 05 04 56 00 00 	mov    rax,QWORD PTR [rip+0x5604]        # 80a420 <tss>
  804e1c:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804e20:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  804e24:	48 8b 05 f5 55 00 00 	mov    rax,QWORD PTR [rip+0x55f5]        # 80a420 <tss>
  804e2b:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  804e2f:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  804e33:	48 8b 05 e6 55 00 00 	mov    rax,QWORD PTR [rip+0x55e6]        # 80a420 <tss>
  804e3a:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804e3e:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  804e42:	48 8b 05 d7 55 00 00 	mov    rax,QWORD PTR [rip+0x55d7]        # 80a420 <tss>
  804e49:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804e4d:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  804e51:	48 8b 05 c8 55 00 00 	mov    rax,QWORD PTR [rip+0x55c8]        # 80a420 <tss>
  804e58:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  804e5c:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  804e60:	48 8b 05 b9 55 00 00 	mov    rax,QWORD PTR [rip+0x55b9]        # 80a420 <tss>
  804e67:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  804e6b:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  804e6f:	48 8b 05 aa 55 00 00 	mov    rax,QWORD PTR [rip+0x55aa]        # 80a420 <tss>
  804e76:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  804e7a:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  804e7e:	48 8b 05 9b 55 00 00 	mov    rax,QWORD PTR [rip+0x559b]        # 80a420 <tss>
  804e85:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  804e89:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  804e8d:	90                   	nop
  804e8e:	5d                   	pop    rbp
  804e8f:	c3                   	ret    

0000000000804e90 <outb>:
  804e90:	66 89 fa             	mov    dx,di
  804e93:	66 89 f0             	mov    ax,si
  804e96:	ee                   	out    dx,al
  804e97:	e8 29 00 00 00       	call   804ec5 <io_delay>
  804e9c:	c3                   	ret    

0000000000804e9d <outw>:
  804e9d:	66 89 fa             	mov    dx,di
  804ea0:	66 89 f0             	mov    ax,si
  804ea3:	66 ef                	out    dx,ax
  804ea5:	90                   	nop
  804ea6:	90                   	nop
  804ea7:	90                   	nop
  804ea8:	c3                   	ret    

0000000000804ea9 <inb>:
  804ea9:	31 c0                	xor    eax,eax
  804eab:	66 89 fa             	mov    dx,di
  804eae:	ec                   	in     al,dx
  804eaf:	90                   	nop
  804eb0:	90                   	nop
  804eb1:	90                   	nop
  804eb2:	c3                   	ret    

0000000000804eb3 <inw>:
  804eb3:	31 c0                	xor    eax,eax
  804eb5:	66 89 fa             	mov    dx,di
  804eb8:	66 ed                	in     ax,dx
  804eba:	90                   	nop
  804ebb:	90                   	nop
  804ebc:	90                   	nop
  804ebd:	c3                   	ret    

0000000000804ebe <eoi>:
  804ebe:	b0 20                	mov    al,0x20
  804ec0:	e6 a0                	out    0xa0,al
  804ec2:	e6 20                	out    0x20,al
  804ec4:	c3                   	ret    

0000000000804ec5 <io_delay>:
  804ec5:	90                   	nop
  804ec6:	90                   	nop
  804ec7:	90                   	nop
  804ec8:	90                   	nop
  804ec9:	c3                   	ret    

0000000000804eca <turn_on_int>:
  804eca:	b0 f8                	mov    al,0xf8
  804ecc:	e6 21                	out    0x21,al
  804ece:	e8 f2 ff ff ff       	call   804ec5 <io_delay>
  804ed3:	b0 af                	mov    al,0xaf
  804ed5:	e6 a1                	out    0xa1,al
  804ed7:	e8 e9 ff ff ff       	call   804ec5 <io_delay>
  804edc:	b8 00 70 10 00       	mov    eax,0x107000
  804ee1:	0f 01 18             	lidt   [rax]
  804ee4:	90                   	nop
  804ee5:	90                   	nop
  804ee6:	90                   	nop
  804ee7:	90                   	nop
  804ee8:	fb                   	sti    
  804ee9:	c3                   	ret    

0000000000804eea <report_back_trace_of_err>:
  804eea:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  804eef:	50                   	push   rax
  804ef0:	68 f9 4e 80 00       	push   0x804ef9
  804ef5:	83 c4 08             	add    esp,0x8
  804ef8:	c3                   	ret    

0000000000804ef9 <bt_msg>:
  804ef9:	65 72 72             	gs jb  804f6e <fill_desc+0x4e>
  804efc:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804efd:	72 20                	jb     804f1f <init_gdt+0x11>
  804eff:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804f00:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  804f03:	72 73                	jb     804f78 <fill_desc+0x58>
  804f05:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  804f08:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eeab86 <_knl_end+0x2eab86>

0000000000804f0e <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  804f0e:	f3 0f 1e fa          	endbr64 
  804f12:	55                   	push   rbp
  804f13:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x28,%ax\r\n"
  804f16:	66 b8 28 00          	mov    ax,0x28
  804f1a:	0f 00 d8             	ltr    ax
                 "ltr %ax");
}
  804f1d:	90                   	nop
  804f1e:	5d                   	pop    rbp
  804f1f:	c3                   	ret    

0000000000804f20 <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  804f20:	f3 0f 1e fa          	endbr64 
  804f24:	55                   	push   rbp
  804f25:	48 89 e5             	mov    rbp,rsp
  804f28:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804f2c:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804f30:	89 d0                	mov    eax,edx
  804f32:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  804f35:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  804f39:	48 8b 15 e8 54 00 00 	mov    rdx,QWORD PTR [rip+0x54e8]        # 80a428 <gdt>
  804f40:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f43:	48 c1 e0 04          	shl    rax,0x4
  804f47:	48 01 d0             	add    rax,rdx
  804f4a:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804f4e:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  804f52:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804f56:	48 c1 e8 10          	shr    rax,0x10
  804f5a:	48 89 c1             	mov    rcx,rax
  804f5d:	48 8b 15 c4 54 00 00 	mov    rdx,QWORD PTR [rip+0x54c4]        # 80a428 <gdt>
  804f64:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f67:	48 c1 e0 04          	shl    rax,0x4
  804f6b:	48 01 d0             	add    rax,rdx
  804f6e:	89 ca                	mov    edx,ecx
  804f70:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  804f73:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804f77:	48 c1 e8 18          	shr    rax,0x18
  804f7b:	48 89 c1             	mov    rcx,rax
  804f7e:	48 8b 15 a3 54 00 00 	mov    rdx,QWORD PTR [rip+0x54a3]        # 80a428 <gdt>
  804f85:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f88:	48 c1 e0 04          	shl    rax,0x4
  804f8c:	48 01 d0             	add    rax,rdx
  804f8f:	89 ca                	mov    edx,ecx
  804f91:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  804f94:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804f98:	48 c1 e8 20          	shr    rax,0x20
  804f9c:	48 89 c2             	mov    rdx,rax
  804f9f:	48 8b 0d 82 54 00 00 	mov    rcx,QWORD PTR [rip+0x5482]        # 80a428 <gdt>
  804fa6:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804fa9:	48 c1 e0 04          	shl    rax,0x4
  804fad:	48 01 c8             	add    rax,rcx
  804fb0:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  804fb3:	48 8b 15 6e 54 00 00 	mov    rdx,QWORD PTR [rip+0x546e]        # 80a428 <gdt>
  804fba:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804fbd:	48 c1 e0 04          	shl    rax,0x4
  804fc1:	48 01 d0             	add    rax,rdx
  804fc4:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804fc8:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  804fcb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804fcf:	48 c1 e8 08          	shr    rax,0x8
  804fd3:	66 25 f0 00          	and    ax,0xf0
  804fd7:	48 8b 0d 4a 54 00 00 	mov    rcx,QWORD PTR [rip+0x544a]        # 80a428 <gdt>
  804fde:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804fe1:	48 c1 e2 04          	shl    rdx,0x4
  804fe5:	48 01 ca             	add    rdx,rcx
  804fe8:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  804fec:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  804ff0:	90                   	nop
  804ff1:	5d                   	pop    rbp
  804ff2:	c3                   	ret    

0000000000804ff3 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  804ff3:	f3 0f 1e fa          	endbr64 
  804ff7:	55                   	push   rbp
  804ff8:	48 89 e5             	mov    rbp,rsp
  804ffb:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804ffe:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805001:	89 c8                	mov    eax,ecx
  805003:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  805007:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  80500b:	48 8b 05 16 54 00 00 	mov    rax,QWORD PTR [rip+0x5416]        # 80a428 <gdt>
  805012:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  805016:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805019:	48 c1 e0 04          	shl    rax,0x4
  80501d:	48 89 c2             	mov    rdx,rax
  805020:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805024:	48 01 d0             	add    rax,rdx
  805027:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80502a:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  80502d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805030:	48 c1 e0 04          	shl    rax,0x4
  805034:	48 89 c2             	mov    rdx,rax
  805037:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80503b:	48 01 d0             	add    rax,rdx
  80503e:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  805041:	c1 ea 10             	shr    edx,0x10
  805044:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  805047:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80504a:	48 c1 e0 04          	shl    rax,0x4
  80504e:	48 89 c2             	mov    rdx,rax
  805051:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805055:	48 01 c2             	add    rdx,rax
  805058:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  80505c:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  805060:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805063:	48 c1 e0 04          	shl    rax,0x4
  805067:	48 89 c2             	mov    rdx,rax
  80506a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80506e:	48 01 c2             	add    rdx,rax
  805071:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  805075:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  805079:	90                   	nop
  80507a:	5d                   	pop    rbp
  80507b:	c3                   	ret    

000000000080507c <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  80507c:	f3 0f 1e fa          	endbr64 
  805080:	55                   	push   rbp
  805081:	48 89 e5             	mov    rbp,rsp
  805084:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  805087:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  80508a:	89 d0                	mov    eax,edx
  80508c:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  805090:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  805094:	90                   	nop
  805095:	5d                   	pop    rbp
  805096:	c3                   	ret    
  805097:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  80509e:	00 00 

00000000008050a0 <fill_desc>:
  8050a0:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  8050a5:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  8050aa:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  8050af:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  8050b4:	be 00 60 00 00       	mov    esi,0x6000
  8050b9:	c1 e2 03             	shl    edx,0x3
  8050bc:	01 d6                	add    esi,edx
  8050be:	66 67 89 1e          	mov    WORD PTR [esi],bx
  8050c2:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  8050c7:	c1 e8 10             	shr    eax,0x10
  8050ca:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  8050ce:	c1 eb 10             	shr    ebx,0x10
  8050d1:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  8050d5:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  8050d9:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  8050dd:	c3                   	ret    

00000000008050de <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  8050de:	f3 0f 1e fa          	endbr64 
  8050e2:	55                   	push   rbp
  8050e3:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  8050e6:	b8 00 00 00 00       	mov    eax,0x0
  8050eb:	e8 3c 17 00 00       	call   80682c <execute_request>
    do_req();
  8050f0:	b8 00 00 00 00       	mov    eax,0x0
  8050f5:	e8 bb e7 ff ff       	call   8038b5 <do_req>
    if(!manage_proc_lock)
  8050fa:	8b 05 c8 52 00 00    	mov    eax,DWORD PTR [rip+0x52c8]        # 80a3c8 <manage_proc_lock>
  805100:	85 c0                	test   eax,eax
  805102:	75 0a                	jne    80510e <clock_c+0x30>
    {
        manage_proc();
  805104:	b8 00 00 00 00       	mov    eax,0x0
  805109:	e8 a3 ee ff ff       	call   803fb1 <manage_proc>
    }
    //puts("1 disk req executed.");
  80510e:	90                   	nop
  80510f:	5d                   	pop    rbp
  805110:	c3                   	ret    
  805111:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805118:	00 00 00 
  80511b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

0000000000805120 <clock>:
  805120:	50                   	push   rax
  805121:	53                   	push   rbx
  805122:	51                   	push   rcx
  805123:	52                   	push   rdx
  805124:	57                   	push   rdi
  805125:	56                   	push   rsi
  805126:	41 50                	push   r8
  805128:	41 51                	push   r9
  80512a:	41 52                	push   r10
  80512c:	41 53                	push   r11
  80512e:	41 54                	push   r12
  805130:	41 55                	push   r13
  805132:	41 56                	push   r14
  805134:	41 57                	push   r15
  805136:	66 8c c0             	mov    ax,es
  805139:	66 50                	push   ax
  80513b:	66 8c d8             	mov    ax,ds
  80513e:	66 50                	push   ax
  805140:	66 b8 10 00          	mov    ax,0x10
  805144:	8e c0                	mov    es,eax
  805146:	8e d8                	mov    ds,eax

0000000000805148 <clock.normal_part>:
  805148:	b0 20                	mov    al,0x20
  80514a:	e6 a0                	out    0xa0,al
  80514c:	e6 20                	out    0x20,al
  80514e:	e8 8b ff ff ff       	call   8050de <clock_c>
  805153:	66 58                	pop    ax
  805155:	8e d8                	mov    ds,eax
  805157:	66 58                	pop    ax
  805159:	8e c0                	mov    es,eax
  80515b:	41 5f                	pop    r15
  80515d:	41 5e                	pop    r14
  80515f:	41 5d                	pop    r13
  805161:	41 5c                	pop    r12
  805163:	41 5b                	pop    r11
  805165:	41 5a                	pop    r10
  805167:	41 59                	pop    r9
  805169:	41 58                	pop    r8
  80516b:	5e                   	pop    rsi
  80516c:	5f                   	pop    rdi
  80516d:	5a                   	pop    rdx
  80516e:	59                   	pop    rcx
  80516f:	5b                   	pop    rbx
  805170:	58                   	pop    rax
  805171:	48 cf                	iretq  

0000000000805173 <execute>:
    return ind;
}
*/

int execute(char *path)
{
  805173:	f3 0f 1e fa          	endbr64 
  805177:	55                   	push   rbp
  805178:	48 89 e5             	mov    rbp,rsp
  80517b:	48 83 ec 30          	sub    rsp,0x30
  80517f:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  805183:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  80518a:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, 1)) == -1)return -1;
  805191:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805195:	be 01 00 00 00       	mov    esi,0x1
  80519a:	48 89 c7             	mov    rdi,rax
  80519d:	e8 06 ca ff ff       	call   801ba8 <sys_open>
  8051a2:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  8051a5:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8051a9:	75 0a                	jne    8051b5 <execute+0x42>
  8051ab:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8051b0:	e9 b7 00 00 00       	jmp    80526c <execute+0xf9>
    //
    char *p=path;
  8051b5:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8051b9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  8051bd:	eb 05                	jmp    8051c4 <execute+0x51>
  8051bf:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  8051c4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8051c8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8051cb:	84 c0                	test   al,al
  8051cd:	75 f0                	jne    8051bf <execute+0x4c>
    for(;*p!='/'&&p>path;p--);
  8051cf:	eb 05                	jmp    8051d6 <execute+0x63>
  8051d1:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  8051d6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8051da:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8051dd:	3c 2f                	cmp    al,0x2f
  8051df:	74 0a                	je     8051eb <execute+0x78>
  8051e1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8051e5:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  8051e9:	77 e6                	ja     8051d1 <execute+0x5e>
    if(p>path)
  8051eb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8051ef:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  8051f3:	76 2f                	jbe    805224 <execute+0xb1>
    {
        *p='\0';
  8051f5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8051f9:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, 1)) == -1)return -1;
  8051fc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805200:	be 01 00 00 00       	mov    esi,0x1
  805205:	48 89 c7             	mov    rdi,rax
  805208:	e8 9b c9 ff ff       	call   801ba8 <sys_open>
  80520d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805210:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  805214:	75 07                	jne    80521d <execute+0xaa>
  805216:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80521b:	eb 4f                	jmp    80526c <execute+0xf9>
        *p='/';
  80521d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805221:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern vfs_dir_entry opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  805224:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805227:	48 63 d0             	movsxd rdx,eax
  80522a:	48 89 d0             	mov    rax,rdx
  80522d:	48 01 c0             	add    rax,rax
  805230:	48 01 d0             	add    rax,rdx
  805233:	48 c1 e0 05          	shl    rax,0x5
  805237:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  80523e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805241:	48 63 c8             	movsxd rcx,eax
  805244:	48 89 c8             	mov    rax,rcx
  805247:	48 01 c0             	add    rax,rax
  80524a:	48 01 c8             	add    rax,rcx
  80524d:	48 c1 e0 05          	shl    rax,0x5
  805251:	48 05 60 06 40 00    	add    rax,0x400660
  805257:	b9 e4 52 80 00       	mov    ecx,0x8052e4
  80525c:	48 89 c6             	mov    rsi,rax
  80525f:	89 cf                	mov    edi,ecx
  805261:	e8 15 f6 ff ff       	call   80487b <reg_proc>
  805266:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  805269:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  80526c:	c9                   	leave  
  80526d:	c3                   	ret    

000000000080526e <exec_call>:

int exec_call(char *path)
{
  80526e:	f3 0f 1e fa          	endbr64 
  805272:	55                   	push   rbp
  805273:	48 89 e5             	mov    rbp,rsp
  805276:	48 83 ec 20          	sub    rsp,0x20
  80527a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi=execute(path);
  80527e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805282:	48 89 c7             	mov    rdi,rax
  805285:	e8 e9 fe ff ff       	call   805173 <execute>
  80528a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  80528d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805290:	01 c0                	add    eax,eax
  805292:	83 c0 05             	add    eax,0x5
  805295:	c1 e0 03             	shl    eax,0x3
  805298:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  80529b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80529e:	89 c7                	mov    edi,eax
  8052a0:	e8 d8 ee ff ff       	call   80417d <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  8052a5:	90                   	nop
  8052a6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8052a9:	48 63 d0             	movsxd rdx,eax
  8052ac:	48 89 d0             	mov    rax,rdx
  8052af:	48 01 c0             	add    rax,rax
  8052b2:	48 01 d0             	add    rax,rdx
  8052b5:	48 c1 e0 08          	shl    rax,0x8
  8052b9:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8052bf:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8052c2:	83 f8 03             	cmp    eax,0x3
  8052c5:	75 df                	jne    8052a6 <exec_call+0x38>
    return task[pi].exit_code;
  8052c7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8052ca:	48 63 d0             	movsxd rdx,eax
  8052cd:	48 89 d0             	mov    rax,rdx
  8052d0:	48 01 c0             	add    rax,rax
  8052d3:	48 01 d0             	add    rax,rdx
  8052d6:	48 c1 e0 08          	shl    rax,0x8
  8052da:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8052e0:	8b 00                	mov    eax,DWORD PTR [rax]
}
  8052e2:	c9                   	leave  
  8052e3:	c3                   	ret    

00000000008052e4 <proc_start>:
int proc_start()
{
  8052e4:	f3 0f 1e fa          	endbr64 
  8052e8:	55                   	push   rbp
  8052e9:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  8052ec:	8b 05 1a f2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f21a]        # 41450c <cur_proc>
  8052f2:	48 63 d0             	movsxd rdx,eax
  8052f5:	48 89 d0             	mov    rax,rdx
  8052f8:	48 01 c0             	add    rax,rax
  8052fb:	48 01 d0             	add    rax,rdx
  8052fe:	48 c1 e0 08          	shl    rax,0x8
  805302:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805308:	48 89 c7             	mov    rdi,rax
  80530b:	e8 1a 00 00 00       	call   80532a <load_pe>
    //释放进程资源
    del_proc(cur_proc);
  805310:	8b 05 f6 f1 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f1f6]        # 41450c <cur_proc>
  805316:	89 c7                	mov    edi,eax
  805318:	e8 30 f3 ff ff       	call   80464d <del_proc>
    switch_proc_tss(0);
  80531d:	bf 00 00 00 00       	mov    edi,0x0
  805322:	e8 56 ee ff ff       	call   80417d <switch_proc_tss>
}
  805327:	90                   	nop
  805328:	5d                   	pop    rbp
  805329:	c3                   	ret    

000000000080532a <load_pe>:
//在cr3切换到目标进程下的加载程序(但进程还没调度到那里)。
int load_pe(struct process *proc)
{
  80532a:	f3 0f 1e fa          	endbr64 
  80532e:	55                   	push   rbp
  80532f:	48 89 e5             	mov    rbp,rsp
  805332:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  805339:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    vfs_dir_entry *f=proc->exef;
  805340:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805347:	48 8b 80 bc 00 00 00 	mov    rax,QWORD PTR [rax+0xbc]
  80534e:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=f->fno;
  805352:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  805356:	8b 00                	mov    eax,DWORD PTR [rax]
  805358:	89 45 94             	mov    DWORD PTR [rbp-0x6c],eax

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  80535b:	48 8d 8d 70 fe ff ff 	lea    rcx,[rbp-0x190]
  805362:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805365:	ba 44 00 00 00       	mov    edx,0x44
  80536a:	48 89 ce             	mov    rsi,rcx
  80536d:	89 c7                	mov    edi,eax
  80536f:	e8 13 ce ff ff       	call   802187 <sys_read>
    sys_seek(exefno,tdh.e_lfanew,SEEK_SET);
  805374:	48 8b 85 ac fe ff ff 	mov    rax,QWORD PTR [rbp-0x154]
  80537b:	89 c1                	mov    ecx,eax
  80537d:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805380:	ba 00 00 00 00       	mov    edx,0x0
  805385:	89 ce                	mov    esi,ecx
  805387:	89 c7                	mov    edi,eax
  805389:	e8 8a ce ff ff       	call   802218 <sys_seek>
    sys_read(exefno, &tnth, sizeof(tnth));
  80538e:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  805395:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805398:	ba f8 00 00 00       	mov    edx,0xf8
  80539d:	48 89 ce             	mov    rsi,rcx
  8053a0:	89 c7                	mov    edi,eax
  8053a2:	e8 e0 cd ff ff       	call   802187 <sys_read>

    //是否需要移动base(先不检查)
    unsigned int nbase=tnth.OptionalHeader.ImageBase;
  8053a7:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  8053ad:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  8053b0:	8b 85 c0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x240]
  8053b6:	c1 e8 0c             	shr    eax,0xc
  8053b9:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
    //use_pgm_ava检查在页表中这个范围是否可用，可用就使用
    while(1)
    {
        cont:
        ;
        int pdei=nbase/PAGE_INDEX_SIZE;
  8053bc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053bf:	c1 e8 16             	shr    eax,0x16
  8053c2:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
        int ptei=nbase%PAGE_INDEX_SIZE/PAGE_SIZE;
  8053c5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053c8:	25 ff ff 3f 00       	and    eax,0x3fffff
  8053cd:	c1 e8 0c             	shr    eax,0xc
  8053d0:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
        int *pt=(proc->pml4[pdei]&0xfffff000);
  8053d3:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  8053da:	48 8b 90 ac 00 00 00 	mov    rdx,QWORD PTR [rax+0xac]
  8053e1:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
  8053e4:	48 98                	cdqe   
  8053e6:	48 c1 e0 03          	shl    rax,0x3
  8053ea:	48 01 d0             	add    rax,rdx
  8053ed:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8053f0:	25 00 f0 ff ff       	and    eax,0xfffff000
  8053f5:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
        for(int i=0;i<pgn;i++)
  8053f9:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805400:	eb 48                	jmp    80544a <load_pe+0x120>
        {
            if(pt[ptei+i%1024]&PAGE_PRESENT&&pt!=NULL)
  805402:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805405:	99                   	cdq    
  805406:	c1 ea 16             	shr    edx,0x16
  805409:	01 d0                	add    eax,edx
  80540b:	25 ff 03 00 00       	and    eax,0x3ff
  805410:	29 d0                	sub    eax,edx
  805412:	89 c2                	mov    edx,eax
  805414:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  805417:	01 d0                	add    eax,edx
  805419:	48 98                	cdqe   
  80541b:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805422:	00 
  805423:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  805427:	48 01 d0             	add    rax,rdx
  80542a:	8b 00                	mov    eax,DWORD PTR [rax]
  80542c:	83 e0 01             	and    eax,0x1
  80542f:	85 c0                	test   eax,eax
  805431:	74 13                	je     805446 <load_pe+0x11c>
  805433:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
  805438:	74 0c                	je     805446 <load_pe+0x11c>
            {
                //移动base
                nbase+=0x1000;
  80543a:	81 45 fc 00 10 00 00 	add    DWORD PTR [rbp-0x4],0x1000
                goto cont;
  805441:	e9 76 ff ff ff       	jmp    8053bc <load_pe+0x92>
        for(int i=0;i<pgn;i++)
  805446:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80544a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80544d:	3b 45 90             	cmp    eax,DWORD PTR [rbp-0x70]
  805450:	7c b0                	jl     805402 <load_pe+0xd8>
            }
        }
        break;
  805452:	90                   	nop
    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_seek(exefno,0,SEEK_SET);
  805453:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805456:	ba 00 00 00 00       	mov    edx,0x0
  80545b:	be 00 00 00 00       	mov    esi,0x0
  805460:	89 c7                	mov    edi,eax
  805462:	e8 b1 cd ff ff       	call   802218 <sys_seek>
    sys_read(exefno, nbase, PAGE_SIZE);
  805467:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80546a:	48 89 c1             	mov    rcx,rax
  80546d:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805470:	ba 00 10 00 00       	mov    edx,0x1000
  805475:	48 89 ce             	mov    rsi,rcx
  805478:	89 c7                	mov    edi,eax
  80547a:	e8 08 cd ff ff       	call   802187 <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  80547f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805482:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_NT_HEADERS32 nth=nbase+dosh->e_lfanew;
  805489:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80548c:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805493:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  805497:	48 01 d0             	add    rax,rdx
  80549a:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  8054a1:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8054a8:	48 83 c0 04          	add    rax,0x4
  8054ac:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  8054b3:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8054ba:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  8054bd:	89 85 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],eax
    int page_count=prog_size/4096;
  8054c3:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  8054c9:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8054cf:	85 c0                	test   eax,eax
  8054d1:	0f 48 c2             	cmovs  eax,edx
  8054d4:	c1 f8 0c             	sar    eax,0xc
  8054d7:	89 85 60 ff ff ff    	mov    DWORD PTR [rbp-0xa0],eax

    int shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  8054dd:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8054e4:	8b 50 28             	mov    edx,DWORD PTR [rax+0x28]
  8054e7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8054ea:	01 d0                	add    eax,edx
  8054ec:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  8054f2:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  8054f8:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  8054fe:	85 c0                	test   eax,eax
  805500:	0f 48 c2             	cmovs  eax,edx
  805503:	c1 f8 0a             	sar    eax,0xa
  805506:	89 c1                	mov    ecx,eax
  805508:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  80550e:	99                   	cdq    
  80550f:	c1 ea 16             	shr    edx,0x16
  805512:	01 d0                	add    eax,edx
  805514:	25 ff 03 00 00       	and    eax,0x3ff
  805519:	29 d0                	sub    eax,edx
  80551b:	01 c8                	add    eax,ecx
  80551d:	85 c0                	test   eax,eax
  80551f:	0f 95 c0             	setne  al
  805522:	0f b6 c0             	movzx  eax,al
  805525:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  80552b:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  805531:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  805537:	85 c0                	test   eax,eax
  805539:	0f 48 c2             	cmovs  eax,edx
  80553c:	c1 f8 16             	sar    eax,0x16
  80553f:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  805545:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80554c:	89 c0                	mov    eax,eax
  80554e:	48 05 f8 00 00 00    	add    rax,0xf8
  805554:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  805558:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80555f:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  805563:	0f b7 d0             	movzx  edx,ax
  805566:	89 d0                	mov    eax,edx
  805568:	c1 e0 02             	shl    eax,0x2
  80556b:	01 d0                	add    eax,edx
  80556d:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  805570:	05 3c 01 00 00       	add    eax,0x13c
  805575:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    int align=nth->OptionalHeader.FileAlignment;
  80557b:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805582:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  805585:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  80558b:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805591:	99                   	cdq    
  805592:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  805598:	89 d0                	mov    eax,edx
  80559a:	85 c0                	test   eax,eax
  80559c:	74 23                	je     8055c1 <load_pe+0x297>
  80559e:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  8055a4:	99                   	cdq    
  8055a5:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  8055ab:	89 d1                	mov    ecx,edx
  8055ad:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  8055b3:	29 c8                	sub    eax,ecx
  8055b5:	89 c2                	mov    edx,eax
  8055b7:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
  8055bd:	01 d0                	add    eax,edx
  8055bf:	eb 06                	jmp    8055c7 <load_pe+0x29d>
  8055c1:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  8055c7:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  8055cd:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8055d4:	eb 68                	jmp    80563e <load_pe+0x314>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  8055d6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8055da:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  8055dd:	25 00 00 00 02       	and    eax,0x2000000
  8055e2:	89 85 bc fe ff ff    	mov    DWORD PTR [rbp-0x144],eax
        if(disca)
  8055e8:	83 bd bc fe ff ff 00 	cmp    DWORD PTR [rbp-0x144],0x0
  8055ef:	75 43                	jne    805634 <load_pe+0x30a>
            continue;
        //直接读，缺页内核解决
        sys_seek(exefno,psec->PointerToRawData,SEEK_SET);
  8055f1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8055f5:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  8055f8:	89 c1                	mov    ecx,eax
  8055fa:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8055fd:	ba 00 00 00 00       	mov    edx,0x0
  805602:	89 ce                	mov    esi,ecx
  805604:	89 c7                	mov    edi,eax
  805606:	e8 0d cc ff ff       	call   802218 <sys_seek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  80560b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80560f:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805612:	89 c2                	mov    edx,eax
  805614:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805618:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
  80561b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80561e:	01 c8                	add    eax,ecx
  805620:	89 c0                	mov    eax,eax
  805622:	48 89 c1             	mov    rcx,rax
  805625:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805628:	48 89 ce             	mov    rsi,rcx
  80562b:	89 c7                	mov    edi,eax
  80562d:	e8 55 cb ff ff       	call   802187 <sys_read>
  805632:	eb 01                	jmp    805635 <load_pe+0x30b>
            continue;
  805634:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  805635:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805639:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  80563e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805645:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  805649:	0f b7 c0             	movzx  eax,ax
  80564c:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80564f:	7c 85                	jl     8055d6 <load_pe+0x2ac>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  805651:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805658:	48 83 e8 80          	sub    rax,0xffffffffffffff80
  80565c:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    if(impd->Size>0)
  805663:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80566a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80566d:	85 c0                	test   eax,eax
  80566f:	0f 84 71 02 00 00    	je     8058e6 <load_pe+0x5bc>
    {
        int tmpi=impd->VirtualAddress+nbase;
  805675:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80567c:	8b 10                	mov    edx,DWORD PTR [rax]
  80567e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805681:	01 d0                	add    eax,edx
  805683:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  805689:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  80568f:	48 98                	cdqe   
  805691:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  805695:	e9 3e 02 00 00       	jmp    8058d8 <load_pe+0x5ae>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  80569a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80569e:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  8056a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8056a4:	01 d0                	add    eax,edx
  8056a6:	89 c0                	mov    eax,eax
  8056a8:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  8056af:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  8056b6:	be 48 1f 81 00       	mov    esi,0x811f48
  8056bb:	48 89 c7             	mov    rdi,rax
  8056be:	e8 01 46 00 00       	call   809cc4 <strcmp>
  8056c3:	85 c0                	test   eax,eax
  8056c5:	75 09                	jne    8056d0 <load_pe+0x3a6>
            {
                dllp=0x1c00000;
  8056c7:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  8056ce:	eb 25                	jmp    8056f5 <load_pe+0x3cb>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  8056d0:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  8056d7:	48 89 c7             	mov    rdi,rax
  8056da:	e8 4b fc ff ff       	call   80532a <load_pe>
  8056df:	89 85 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  8056e5:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  8056eb:	89 c7                	mov    edi,eax
  8056ed:	e8 e4 03 00 00       	call   805ad6 <get_module_addr>
  8056f2:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  8056f5:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8056f8:	48 98                	cdqe   
  8056fa:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  805701:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805704:	48 63 d0             	movsxd rdx,eax
  805707:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  80570e:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  805712:	48 01 d0             	add    rax,rdx
  805715:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  80571c:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  805723:	8b 50 78             	mov    edx,DWORD PTR [rax+0x78]
  805726:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805729:	01 d0                	add    eax,edx
  80572b:	89 c0                	mov    eax,eax
  80572d:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
            int funcn=dllexp->NumberOfNames;
  805734:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80573b:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80573e:	89 85 0c ff ff ff    	mov    DWORD PTR [rbp-0xf4],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  805744:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80574b:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  80574e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805751:	01 d0                	add    eax,edx
  805753:	89 c0                	mov    eax,eax
  805755:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  80575c:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805763:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  805766:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805769:	01 d0                	add    eax,edx
  80576b:	89 c0                	mov    eax,eax
  80576d:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  805774:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80577b:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80577e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805781:	01 d0                	add    eax,edx
  805783:	89 c0                	mov    eax,eax
  805785:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  80578c:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805793:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805796:	89 85 ec fe ff ff    	mov    DWORD PTR [rbp-0x114],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  80579c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8057a0:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  8057a3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8057a6:	01 d0                	add    eax,edx
  8057a8:	89 c0                	mov    eax,eax
  8057aa:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  8057ae:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8057b2:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  8057b5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8057b8:	01 d0                	add    eax,edx
  8057ba:	89 c0                	mov    eax,eax
  8057bc:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  8057c0:	e9 00 01 00 00       	jmp    8058c5 <load_pe+0x59b>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  8057c5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8057c9:	8b 00                	mov    eax,DWORD PTR [rax]
  8057cb:	85 c0                	test   eax,eax
  8057cd:	79 43                	jns    805812 <load_pe+0x4e8>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  8057cf:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8057d3:	8b 00                	mov    eax,DWORD PTR [rax]
  8057d5:	25 ff ff ff 7f       	and    eax,0x7fffffff
  8057da:	2b 85 ec fe ff ff    	sub    eax,DWORD PTR [rbp-0x114]
  8057e0:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  8057e6:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  8057ec:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8057f3:	00 
  8057f4:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8057fb:	48 01 d0             	add    rax,rdx
  8057fe:	8b 10                	mov    edx,DWORD PTR [rax]
  805800:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805803:	01 d0                	add    eax,edx
  805805:	89 c2                	mov    edx,eax
  805807:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80580b:	89 10                	mov    DWORD PTR [rax],edx
  80580d:	e9 a9 00 00 00       	jmp    8058bb <load_pe+0x591>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  805812:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805816:	8b 00                	mov    eax,DWORD PTR [rax]
  805818:	89 c0                	mov    eax,eax
  80581a:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  805821:	48 83 85 e0 fe ff ff 	add    QWORD PTR [rbp-0x120],0x2
  805828:	02 
                    int i=0;
  805829:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  805830:	eb 7a                	jmp    8058ac <load_pe+0x582>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  805832:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  805835:	48 98                	cdqe   
  805837:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  80583e:	00 
  80583f:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  805846:	48 01 d0             	add    rax,rdx
  805849:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80584c:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
  805853:	48 89 d6             	mov    rsi,rdx
  805856:	48 89 c7             	mov    rdi,rax
  805859:	e8 66 44 00 00       	call   809cc4 <strcmp>
  80585e:	85 c0                	test   eax,eax
  805860:	75 46                	jne    8058a8 <load_pe+0x57e>
                        {
                            int ordi=funcords[i];
  805862:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  805865:	48 98                	cdqe   
  805867:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  80586b:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  805872:	48 01 d0             	add    rax,rdx
  805875:	0f b7 00             	movzx  eax,WORD PTR [rax]
  805878:	98                   	cwde   
  805879:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  80587f:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
  805885:	48 98                	cdqe   
  805887:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80588e:	00 
  80588f:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  805896:	48 01 d0             	add    rax,rdx
  805899:	8b 10                	mov    edx,DWORD PTR [rax]
  80589b:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80589e:	01 d0                	add    eax,edx
  8058a0:	89 c2                	mov    edx,eax
  8058a2:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8058a6:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  8058a8:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  8058ac:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8058af:	3b 85 0c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xf4]
  8058b5:	0f 8c 77 ff ff ff    	jl     805832 <load_pe+0x508>
                        }
                    }
                }
                iataddrs++;
  8058bb:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  8058c0:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  8058c5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8058c9:	8b 00                	mov    eax,DWORD PTR [rax]
  8058cb:	85 c0                	test   eax,eax
  8058cd:	0f 85 f2 fe ff ff    	jne    8057c5 <load_pe+0x49b>
            }
            impdes++;
  8058d3:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  8058d8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8058dc:	8b 00                	mov    eax,DWORD PTR [rax]
  8058de:	85 c0                	test   eax,eax
  8058e0:	0f 85 b4 fd ff ff    	jne    80569a <load_pe+0x370>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  8058e6:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  8058ed:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  8058ee:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8058f5:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [rax+0xa4]
  8058fb:	85 c0                	test   eax,eax
  8058fd:	0f 84 e8 00 00 00    	je     8059eb <load_pe+0x6c1>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  805903:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80590a:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [rax+0xa0]
  805910:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805913:	01 d0                	add    eax,edx
  805915:	89 c0                	mov    eax,eax
  805917:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                                +(u32)nbase);
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  80591b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80591f:	48 83 c0 40          	add    rax,0x40
  805923:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  805927:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80592b:	48 83 c0 02          	add    rax,0x2
  80592f:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  805933:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80593a:	8b 40 34             	mov    eax,DWORD PTR [rax+0x34]
  80593d:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
        while(relp->VirtualAddress){
  805943:	e9 95 00 00 00       	jmp    8059dd <load_pe+0x6b3>
            int pgva=relp->VirtualAddress+nbase;
  805948:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80594c:	8b 10                	mov    edx,DWORD PTR [rax]
  80594e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805951:	01 d0                	add    eax,edx
  805953:	89 85 d0 fe ff ff    	mov    DWORD PTR [rbp-0x130],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  805959:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  805960:	eb 59                	jmp    8059bb <load_pe+0x691>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  805962:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  805966:	0f b7 00             	movzx  eax,WORD PTR [rax]
  805969:	66 85 c0             	test   ax,ax
  80596c:	74 48                	je     8059b6 <load_pe+0x68c>
                int *at=*reloc+pgva;//要重定位的数据的地址
  80596e:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  805972:	0f b7 00             	movzx  eax,WORD PTR [rax]
  805975:	0f b7 d0             	movzx  edx,ax
  805978:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  80597e:	01 d0                	add    eax,edx
  805980:	48 98                	cdqe   
  805982:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
                *at=*at-old_base+nbase;
  805989:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  805990:	8b 00                	mov    eax,DWORD PTR [rax]
  805992:	2b 85 d4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x12c]
  805998:	89 c2                	mov    edx,eax
  80599a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80599d:	01 d0                	add    eax,edx
  80599f:	89 c2                	mov    edx,eax
  8059a1:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  8059a8:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  8059aa:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  8059af:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  8059b4:	eb 01                	jmp    8059b7 <load_pe+0x68d>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8059b6:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8059b7:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  8059bb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8059bf:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8059c2:	c1 e8 02             	shr    eax,0x2
  8059c5:	89 c2                	mov    edx,eax
  8059c7:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  8059ca:	39 c2                	cmp    edx,eax
  8059cc:	77 94                	ja     805962 <load_pe+0x638>
            }
            relp=(int)relp+0x1000;
  8059ce:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8059d2:	05 00 10 00 00       	add    eax,0x1000
  8059d7:	48 98                	cdqe   
  8059d9:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  8059dd:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8059e1:	8b 00                	mov    eax,DWORD PTR [rax]
  8059e3:	85 c0                	test   eax,eax
  8059e5:	0f 85 5d ff ff ff    	jne    805948 <load_pe+0x61e>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  8059eb:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  8059f2:	00 00 00 
  8059f5:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  8059fc:	00 00 00 
  8059ff:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  805a06:	00 00 00 00 
  805a0a:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  805a11:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  805a15:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  805a1c:	ba 18 00 00 00       	mov    edx,0x18
  805a21:	48 89 c6             	mov    rsi,rax
  805a24:	bf 00 00 00 01       	mov    edi,0x1000000
  805a29:	e8 f8 3f 00 00       	call   809a26 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  805a2e:	8b 05 d8 ea c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ead8]        # 41450c <cur_proc>
  805a34:	48 63 d0             	movsxd rdx,eax
  805a37:	48 89 d0             	mov    rax,rdx
  805a3a:	48 01 c0             	add    rax,rax
  805a3d:	48 01 d0             	add    rax,rdx
  805a40:	48 c1 e0 08          	shl    rax,0x8
  805a44:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805a4a:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  805a51:	8b 05 b5 ea c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0eab5]        # 41450c <cur_proc>
  805a57:	48 63 d0             	movsxd rdx,eax
  805a5a:	48 89 d0             	mov    rax,rdx
  805a5d:	48 01 c0             	add    rax,rax
  805a60:	48 01 d0             	add    rax,rdx
  805a63:	48 c1 e0 08          	shl    rax,0x8
  805a67:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805a6d:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  805a74:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  805a7a:	48 98                	cdqe   
  805a7c:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
    task[cur_proc].exit_code=main(0,NULL);
  805a83:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
  805a8a:	be 00 00 00 00       	mov    esi,0x0
  805a8f:	bf 00 00 00 00       	mov    edi,0x0
  805a94:	ff d0                	call   rax
  805a96:	8b 15 70 ea c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0ea70]        # 41450c <cur_proc>
  805a9c:	89 c1                	mov    ecx,eax
  805a9e:	48 63 d2             	movsxd rdx,edx
  805aa1:	48 89 d0             	mov    rax,rdx
  805aa4:	48 01 c0             	add    rax,rax
  805aa7:	48 01 d0             	add    rax,rdx
  805aaa:	48 c1 e0 08          	shl    rax,0x8
  805aae:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805ab4:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  805ab6:	8b 05 50 ea c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ea50]        # 41450c <cur_proc>
  805abc:	48 63 d0             	movsxd rdx,eax
  805abf:	48 89 d0             	mov    rax,rdx
  805ac2:	48 01 c0             	add    rax,rax
  805ac5:	48 01 d0             	add    rax,rdx
  805ac8:	48 c1 e0 08          	shl    rax,0x8
  805acc:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805ad2:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805ad4:	c9                   	leave  
  805ad5:	c3                   	ret    

0000000000805ad6 <get_module_addr>:

int get_module_addr(int mi)
{
  805ad6:	f3 0f 1e fa          	endbr64 
  805ada:	55                   	push   rbp
  805adb:	48 89 e5             	mov    rbp,rsp
  805ade:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  805ae1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805ae4:	48 98                	cdqe   
  805ae6:	8b 04 c5 20 71 42 00 	mov    eax,DWORD PTR [rax*8+0x427120]
}
  805aed:	5d                   	pop    rbp
  805aee:	c3                   	ret    

0000000000805aef <dispose_library>:
int dispose_library(int dlln)
{
  805aef:	f3 0f 1e fa          	endbr64 
  805af3:	55                   	push   rbp
  805af4:	48 89 e5             	mov    rbp,rsp
  805af7:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  805afa:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805afe:	78 09                	js     805b09 <dispose_library+0x1a>
  805b00:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  805b07:	7e 07                	jle    805b10 <dispose_library+0x21>
  805b09:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805b0e:	eb 1d                	jmp    805b2d <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  805b10:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805b13:	48 98                	cdqe   
  805b15:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  805b1c:	48 05 28 45 41 00    	add    rax,0x414528
  805b22:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  805b28:	b8 00 00 00 00       	mov    eax,0x0
}
  805b2d:	5d                   	pop    rbp
  805b2e:	c3                   	ret    

0000000000805b2f <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  805b2f:	f3 0f 1e fa          	endbr64 
  805b33:	55                   	push   rbp
  805b34:	48 89 e5             	mov    rbp,rsp
  805b37:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  805b3b:	90                   	nop
  805b3c:	5d                   	pop    rbp
  805b3d:	c3                   	ret    

0000000000805b3e <sys_rmmod>:
int sys_rmmod(char *name)
{
  805b3e:	f3 0f 1e fa          	endbr64 
  805b42:	55                   	push   rbp
  805b43:	48 89 e5             	mov    rbp,rsp
  805b46:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  805b4a:	90                   	nop
  805b4b:	5d                   	pop    rbp
  805b4c:	c3                   	ret    
  805b4d:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000805b50 <_syscall>:
  805b50:	57                   	push   rdi
  805b51:	56                   	push   rsi
  805b52:	52                   	push   rdx
  805b53:	51                   	push   rcx
  805b54:	53                   	push   rbx
  805b55:	50                   	push   rax
  805b56:	e8 13 aa ff ff       	call   80056e <syscall>
  805b5b:	48 83 c4 18          	add    rsp,0x18
  805b5f:	cf                   	iret   

0000000000805b60 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  805b60:	f3 0f 1e fa          	endbr64 
  805b64:	55                   	push   rbp
  805b65:	48 89 e5             	mov    rbp,rsp
  805b68:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  805b6c:	8b 05 c2 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc219c2]        # 427534 <framebuffer+0x14>
  805b72:	89 c0                	mov    eax,eax
  805b74:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  805b78:	8b 05 ba 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc219ba]        # 427538 <framebuffer+0x18>
  805b7e:	89 c0                	mov    eax,eax
  805b80:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  805b84:	0f b6 05 b1 19 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc219b1]        # 42753c <framebuffer+0x1c>
  805b8b:	c0 e8 03             	shr    al,0x3
  805b8e:	0f b6 c0             	movzx  eax,al
  805b91:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  805b95:	8b 05 95 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21995]        # 427530 <framebuffer+0x10>
  805b9b:	89 c0                	mov    eax,eax
  805b9d:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  805ba1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805ba5:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  805baa:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  805bae:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805bb2:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  805bb7:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  805bbb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805bbf:	48 c1 e8 0c          	shr    rax,0xc
  805bc3:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  805bc6:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  805bcd:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  805bce:	48 8b 05 53 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21953]        # 427528 <framebuffer+0x8>
  805bd5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  805bd9:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  805be0:	00 
  805be1:	eb 2d                	jmp    805c10 <init_framebuffer+0xb0>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  805be3:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  805be7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805beb:	ba 07 00 00 00       	mov    edx,0x7
  805bf0:	48 89 ce             	mov    rsi,rcx
  805bf3:	48 89 c7             	mov    rdi,rax
  805bf6:	e8 81 b2 ff ff       	call   800e7c <mmap>
        pp+=PAGE_SIZE;
  805bfb:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  805c02:	00 
        p+=PAGE_SIZE;
  805c03:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  805c0a:	00 
    for (size_t i = 0; i < pgc; i++)
  805c0b:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  805c10:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  805c13:	48 98                	cdqe   
  805c15:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  805c19:	72 c8                	jb     805be3 <init_framebuffer+0x83>
    }
    
    
}
  805c1b:	90                   	nop
  805c1c:	90                   	nop
  805c1d:	c9                   	leave  
  805c1e:	c3                   	ret    

0000000000805c1f <init_font>:
void init_font(){
  805c1f:	f3 0f 1e fa          	endbr64 
  805c23:	55                   	push   rbp
  805c24:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  805c27:	48 c7 05 2e 19 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2192e],0x80a5e8        # 427560 <boot_font>
  805c2e:	e8 a5 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  805c32:	48 8b 05 27 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21927]        # 427560 <boot_font>
  805c39:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  805c3c:	83 c0 07             	add    eax,0x7
  805c3f:	c1 e8 03             	shr    eax,0x3
  805c42:	89 05 28 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21928],eax        # 427570 <font_width_bytes>
    font_width = font_width_bytes * 8;
  805c48:	8b 05 22 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21922]        # 427570 <font_width_bytes>
  805c4e:	c1 e0 03             	shl    eax,0x3
  805c51:	89 05 11 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21911],eax        # 427568 <font_width>
    font_height = boot_font->height;
  805c57:	48 8b 05 02 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21902]        # 427560 <boot_font>
  805c5e:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  805c61:	89 05 05 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21905],eax        # 42756c <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  805c67:	48 8b 05 f2 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218f2]        # 427560 <boot_font>
  805c6e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  805c71:	89 c0                	mov    eax,eax
  805c73:	48 05 e8 a5 80 00    	add    rax,0x80a5e8
  805c79:	48 89 05 f8 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc218f8],rax        # 427578 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  805c80:	48 8b 05 d9 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218d9]        # 427560 <boot_font>
  805c87:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805c8a:	89 05 f4 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc218f4],eax        # 427584 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  805c90:	48 8b 05 c9 18 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc218c9]        # 427560 <boot_font>
  805c97:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805c9a:	89 05 e0 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc218e0],eax        # 427580 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  805ca0:	c7 05 a6 18 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc218a6],0x0        # 427550 <fb_cursor_y>
  805ca7:	00 00 00 
  805caa:	8b 05 a0 18 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc218a0]        # 427550 <fb_cursor_y>
  805cb0:	89 05 96 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21896],eax        # 42754c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width *framebuffer.common.framebuffer_bpp/8 / font_width;
  805cb6:	8b 15 78 18 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21878]        # 427534 <framebuffer+0x14>
  805cbc:	0f b6 05 79 18 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21879]        # 42753c <framebuffer+0x1c>
  805cc3:	0f b6 c0             	movzx  eax,al
  805cc6:	0f af c2             	imul   eax,edx
  805cc9:	c1 e8 03             	shr    eax,0x3
  805ccc:	8b 0d 96 18 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21896]        # 427568 <font_width>
  805cd2:	ba 00 00 00 00       	mov    edx,0x0
  805cd7:	f7 f1                	div    ecx
  805cd9:	89 05 75 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21875],eax        # 427554 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height *framebuffer.common.framebuffer_bpp/8 / font_height;
  805cdf:	8b 15 53 18 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21853]        # 427538 <framebuffer+0x18>
  805ce5:	0f b6 05 50 18 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21850]        # 42753c <framebuffer+0x1c>
  805cec:	0f b6 c0             	movzx  eax,al
  805cef:	0f af c2             	imul   eax,edx
  805cf2:	c1 e8 03             	shr    eax,0x3
  805cf5:	8b 35 71 18 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21871]        # 42756c <font_height>
  805cfb:	ba 00 00 00 00       	mov    edx,0x0
  805d00:	f7 f6                	div    esi
  805d02:	89 05 50 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21850],eax        # 427558 <max_ch_nr_y>
    font_size=1;
  805d08:	c7 05 1e 47 00 00 01 	mov    DWORD PTR [rip+0x471e],0x1        # 80a430 <font_size>
  805d0f:	00 00 00 
}
  805d12:	90                   	nop
  805d13:	5d                   	pop    rbp
  805d14:	c3                   	ret    

0000000000805d15 <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  805d15:	f3 0f 1e fa          	endbr64 
  805d19:	55                   	push   rbp
  805d1a:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  805d1d:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  805d21:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  805d25:	48 89 05 f4 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc217f4],rax        # 427520 <framebuffer>
  805d2c:	48 89 15 f5 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc217f5],rdx        # 427528 <framebuffer+0x8>
  805d33:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  805d37:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  805d3b:	48 89 05 ee 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc217ee],rax        # 427530 <framebuffer+0x10>
  805d42:	48 89 15 ef 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc217ef],rdx        # 427538 <framebuffer+0x18>
  805d49:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  805d4d:	48 89 05 ec 17 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc217ec],rax        # 427540 <framebuffer+0x20>
}
  805d54:	90                   	nop
  805d55:	5d                   	pop    rbp
  805d56:	c3                   	ret    

0000000000805d57 <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  805d57:	f3 0f 1e fa          	endbr64 
  805d5b:	55                   	push   rbp
  805d5c:	48 89 e5             	mov    rbp,rsp
  805d5f:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  805d62:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805d65:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805d68:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  805d6b:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  805d6f:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  805d76:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  805d77:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805d7a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805d7d:	eb 64                	jmp    805de3 <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  805d7f:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805d82:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  805d85:	eb 4b                	jmp    805dd2 <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805d87:	8b 15 a3 17 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc217a3]        # 427530 <framebuffer+0x10>
  805d8d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805d90:	0f af c2             	imul   eax,edx
  805d93:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  805d95:	0f b6 05 a0 17 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc217a0]        # 42753c <framebuffer+0x1c>
  805d9c:	0f b6 c0             	movzx  eax,al
  805d9f:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805da3:	8d 50 07             	lea    edx,[rax+0x7]
  805da6:	85 c0                	test   eax,eax
  805da8:	0f 48 c2             	cmovs  eax,edx
  805dab:	c1 f8 03             	sar    eax,0x3
  805dae:	48 98                	cdqe   
  805db0:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805db3:	48 05 00 00 00 40    	add    rax,0x40000000
  805db9:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  805dbd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805dc1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  805dc5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805dc9:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  805dcc:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  805dce:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805dd2:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805dd5:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805dd8:	01 d0                	add    eax,edx
  805dda:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  805ddd:	7c a8                	jl     805d87 <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  805ddf:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805de3:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  805de6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805de9:	01 d0                	add    eax,edx
  805deb:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  805dee:	7c 8f                	jl     805d7f <fill_rect+0x28>
        }
    }
}
  805df0:	90                   	nop
  805df1:	90                   	nop
  805df2:	5d                   	pop    rbp
  805df3:	c3                   	ret    

0000000000805df4 <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  805df4:	f3 0f 1e fa          	endbr64 
  805df8:	55                   	push   rbp
  805df9:	48 89 e5             	mov    rbp,rsp
  805dfc:	48 83 ec 30          	sub    rsp,0x30
  805e00:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  805e03:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805e06:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  805e09:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  805e0d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805e10:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  805e13:	eb 5a                	jmp    805e6f <draw_text+0x7b>
    {
        if(*str=='\n')
  805e15:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e19:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805e1c:	3c 0a                	cmp    al,0xa
  805e1e:	75 1c                	jne    805e3c <draw_text+0x48>
        {
            y+=font_height*size;
  805e20:	8b 15 46 17 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21746]        # 42756c <font_height>
  805e26:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  805e29:	0f af d0             	imul   edx,eax
  805e2c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805e2f:	01 d0                	add    eax,edx
  805e31:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  805e34:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805e37:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805e3a:	eb 2e                	jmp    805e6a <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  805e3c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e40:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805e43:	0f be c8             	movsx  ecx,al
  805e46:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805e49:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  805e4c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805e4f:	89 c7                	mov    edi,eax
  805e51:	e8 28 00 00 00       	call   805e7e <draw_letter>
            tx+=size*font_width;
  805e56:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805e59:	8b 05 09 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21709]        # 427568 <font_width>
  805e5f:	0f af d0             	imul   edx,eax
  805e62:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805e65:	01 d0                	add    eax,edx
  805e67:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  805e6a:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  805e6f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805e73:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805e76:	84 c0                	test   al,al
  805e78:	75 9b                	jne    805e15 <draw_text+0x21>
    }
}
  805e7a:	90                   	nop
  805e7b:	90                   	nop
  805e7c:	c9                   	leave  
  805e7d:	c3                   	ret    

0000000000805e7e <draw_letter>:
void draw_letter(int x, int y, int size, char c) {
  805e7e:	f3 0f 1e fa          	endbr64 
  805e82:	55                   	push   rbp
  805e83:	48 89 e5             	mov    rbp,rsp
  805e86:	48 83 ec 30          	sub    rsp,0x30
  805e8a:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  805e8d:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805e90:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805e93:	89 c8                	mov    eax,ecx
  805e95:	88 45 d0             	mov    BYTE PTR [rbp-0x30],al
    u8 *glyph = glyph_table;
  805e98:	48 8b 05 d9 16 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc216d9]        # 427578 <glyph_table>
  805e9f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  805ea3:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805ea7:	8b 05 d7 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc216d7]        # 427584 <glyph_nr>
  805ead:	39 c2                	cmp    edx,eax
  805eaf:	73 13                	jae    805ec4 <draw_letter+0x46>
        glyph += c * bytes_per_glyph;
  805eb1:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805eb5:	8b 05 c5 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc216c5]        # 427580 <bytes_per_glyph>
  805ebb:	0f af c2             	imul   eax,edx
  805ebe:	89 c0                	mov    eax,eax
  805ec0:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805ec4:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805ecb:	e9 c9 00 00 00       	jmp    805f99 <draw_letter+0x11b>
        u8 mask = 1 << 7;
  805ed0:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805ed4:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805edb:	e9 9a 00 00 00       	jmp    805f7a <draw_letter+0xfc>
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  805ee0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805ee3:	c1 e8 03             	shr    eax,0x3
  805ee6:	89 c2                	mov    edx,eax
  805ee8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805eec:	48 01 d0             	add    rax,rdx
  805eef:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805ef2:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  805ef5:	84 c0                	test   al,al
  805ef7:	74 37                	je     805f30 <draw_letter+0xb2>
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,-1);
  805ef9:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805efc:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  805f00:	89 c2                	mov    edx,eax
  805f02:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805f05:	01 d0                	add    eax,edx
  805f07:	89 c6                	mov    esi,eax
  805f09:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805f0c:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  805f10:	89 c2                	mov    edx,eax
  805f12:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805f15:	01 d0                	add    eax,edx
  805f17:	89 c7                	mov    edi,eax
  805f19:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805f1c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805f1f:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
  805f25:	89 d1                	mov    ecx,edx
  805f27:	89 c2                	mov    edx,eax
  805f29:	e8 29 fe ff ff       	call   805d57 <fill_rect>
  805f2e:	eb 35                	jmp    805f65 <draw_letter+0xe7>
            } else {
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,0);
  805f30:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805f33:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  805f37:	89 c2                	mov    edx,eax
  805f39:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805f3c:	01 d0                	add    eax,edx
  805f3e:	89 c6                	mov    esi,eax
  805f40:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805f43:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  805f47:	89 c2                	mov    edx,eax
  805f49:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805f4c:	01 d0                	add    eax,edx
  805f4e:	89 c7                	mov    edi,eax
  805f50:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805f53:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805f56:	41 b8 00 00 00 00    	mov    r8d,0x0
  805f5c:	89 d1                	mov    ecx,edx
  805f5e:	89 c2                	mov    edx,eax
  805f60:	e8 f2 fd ff ff       	call   805d57 <fill_rect>
            }

            mask >>= 1;
  805f65:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  805f68:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805f6b:	83 e0 07             	and    eax,0x7
  805f6e:	85 c0                	test   eax,eax
  805f70:	75 04                	jne    805f76 <draw_letter+0xf8>
                mask = 1 << 7;
  805f72:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805f76:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805f7a:	8b 05 e8 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc215e8]        # 427568 <font_width>
  805f80:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805f83:	0f 82 57 ff ff ff    	jb     805ee0 <draw_letter+0x62>
            }
        }

        glyph += font_width_bytes;
  805f89:	8b 05 e1 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc215e1]        # 427570 <font_width_bytes>
  805f8f:	89 c0                	mov    eax,eax
  805f91:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805f95:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805f99:	8b 05 cd 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc215cd]        # 42756c <font_height>
  805f9f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  805fa2:	0f 82 28 ff ff ff    	jb     805ed0 <draw_letter+0x52>
    }
}
  805fa8:	90                   	nop
  805fa9:	90                   	nop
  805faa:	c9                   	leave  
  805fab:	c3                   	ret    

0000000000805fac <scr_up>:
//向上滚动一个像素
void scr_up(){
  805fac:	f3 0f 1e fa          	endbr64 
  805fb0:	55                   	push   rbp
  805fb1:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805fb4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805fbb:	eb 6c                	jmp    806029 <scr_up+0x7d>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805fbd:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805fc4:	eb 52                	jmp    806018 <scr_up+0x6c>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805fc6:	8b 15 64 15 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21564]        # 427530 <framebuffer+0x10>
  805fcc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805fcf:	0f af c2             	imul   eax,edx
  805fd2:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  805fd4:	0f b6 05 61 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21561]        # 42753c <framebuffer+0x1c>
  805fdb:	0f b6 c0             	movzx  eax,al
  805fde:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805fe2:	8d 50 07             	lea    edx,[rax+0x7]
  805fe5:	85 c0                	test   eax,eax
  805fe7:	0f 48 c2             	cmovs  eax,edx
  805fea:	c1 f8 03             	sar    eax,0x3
  805fed:	48 98                	cdqe   
  805fef:	48 01 c8             	add    rax,rcx
  805ff2:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805ff8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  805ffc:	8b 05 2e 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2152e]        # 427530 <framebuffer+0x10>
  806002:	89 c2                	mov    edx,eax
  806004:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806008:	48 01 d0             	add    rax,rdx
  80600b:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80600e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806012:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  806014:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  806018:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  80601b:	8b 05 33 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21533]        # 427554 <max_ch_nr_x>
  806021:	39 c2                	cmp    edx,eax
  806023:	72 a1                	jb     805fc6 <scr_up+0x1a>
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  806025:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806029:	8b 05 29 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21529]        # 427558 <max_ch_nr_y>
  80602f:	8d 50 ff             	lea    edx,[rax-0x1]
  806032:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806035:	39 c2                	cmp    edx,eax
  806037:	77 84                	ja     805fbd <scr_up+0x11>
        }

    }
}
  806039:	90                   	nop
  80603a:	90                   	nop
  80603b:	5d                   	pop    rbp
  80603c:	c3                   	ret    

000000000080603d <scr_down>:
void scr_down(){
  80603d:	f3 0f 1e fa          	endbr64 
  806041:	55                   	push   rbp
  806042:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  806045:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  80604c:	eb 72                	jmp    8060c0 <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  80604e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  806055:	eb 58                	jmp    8060af <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  806057:	8b 15 d3 14 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc214d3]        # 427530 <framebuffer+0x10>
  80605d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806060:	0f af c2             	imul   eax,edx
  806063:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  806065:	0f b6 05 d0 14 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc214d0]        # 42753c <framebuffer+0x1c>
  80606c:	0f b6 c0             	movzx  eax,al
  80606f:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  806073:	8d 50 07             	lea    edx,[rax+0x7]
  806076:	85 c0                	test   eax,eax
  806078:	0f 48 c2             	cmovs  eax,edx
  80607b:	c1 f8 03             	sar    eax,0x3
  80607e:	48 98                	cdqe   
  806080:	48 01 c8             	add    rax,rcx
  806083:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  806089:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  80608d:	8b 05 9d 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2149d]        # 427530 <framebuffer+0x10>
  806093:	89 c0                	mov    eax,eax
  806095:	48 f7 d8             	neg    rax
  806098:	48 89 c2             	mov    rdx,rax
  80609b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80609f:	48 01 d0             	add    rax,rdx
  8060a2:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  8060a5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8060a9:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  8060ab:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8060af:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8060b2:	8b 05 9c 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2149c]        # 427554 <max_ch_nr_x>
  8060b8:	39 c2                	cmp    edx,eax
  8060ba:	72 9b                	jb     806057 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  8060bc:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8060c0:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8060c3:	8b 05 8f 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2148f]        # 427558 <max_ch_nr_y>
  8060c9:	39 c2                	cmp    edx,eax
  8060cb:	72 81                	jb     80604e <scr_down+0x11>
        }

    }
}
  8060cd:	90                   	nop
  8060ce:	90                   	nop
  8060cf:	5d                   	pop    rbp
  8060d0:	c3                   	ret    

00000000008060d1 <print>:
void print(char* s){
  8060d1:	f3 0f 1e fa          	endbr64 
  8060d5:	55                   	push   rbp
  8060d6:	48 89 e5             	mov    rbp,rsp
  8060d9:	48 83 ec 18          	sub    rsp,0x18
  8060dd:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(;*s;s++){
  8060e1:	e9 f7 00 00 00       	jmp    8061dd <print+0x10c>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  8060e6:	8b 15 60 14 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21460]        # 42754c <fb_cursor_x>
  8060ec:	8b 05 62 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21462]        # 427554 <max_ch_nr_x>
  8060f2:	39 c2                	cmp    edx,eax
  8060f4:	77 0b                	ja     806101 <print+0x30>
  8060f6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8060fa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8060fd:	3c 0a                	cmp    al,0xa
  8060ff:	75 19                	jne    80611a <print+0x49>
        {
            fb_cursor_y+=1;
  806101:	8b 05 49 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21449]        # 427550 <fb_cursor_y>
  806107:	83 c0 01             	add    eax,0x1
  80610a:	89 05 40 14 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21440],eax        # 427550 <fb_cursor_y>
            fb_cursor_x=0;
  806110:	c7 05 32 14 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21432],0x0        # 42754c <fb_cursor_x>
  806117:	00 00 00 
        }
        if(*s=='\n')continue;
  80611a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80611e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806121:	3c 0a                	cmp    al,0xa
  806123:	0f 84 ae 00 00 00    	je     8061d7 <print+0x106>
        if(fb_cursor_y>=max_ch_nr_y){
  806129:	8b 15 21 14 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21421]        # 427550 <fb_cursor_y>
  80612f:	8b 05 23 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21423]        # 427558 <max_ch_nr_y>
  806135:	39 c2                	cmp    edx,eax
  806137:	72 3c                	jb     806175 <print+0xa4>
            for(int i=0;i<font_height*font_size;i++)
  806139:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  806140:	eb 0e                	jmp    806150 <print+0x7f>
                scr_up();
  806142:	b8 00 00 00 00       	mov    eax,0x0
  806147:	e8 60 fe ff ff       	call   805fac <scr_up>
            for(int i=0;i<font_height*font_size;i++)
  80614c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806150:	8b 05 16 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21416]        # 42756c <font_height>
  806156:	8b 15 d4 42 00 00    	mov    edx,DWORD PTR [rip+0x42d4]        # 80a430 <font_size>
  80615c:	0f af d0             	imul   edx,eax
  80615f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806162:	39 c2                	cmp    edx,eax
  806164:	77 dc                	ja     806142 <print+0x71>
            fb_cursor_y=max_ch_nr_y-1;
  806166:	8b 05 ec 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc213ec]        # 427558 <max_ch_nr_y>
  80616c:	83 e8 01             	sub    eax,0x1
  80616f:	89 05 db 13 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc213db],eax        # 427550 <fb_cursor_y>
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  806175:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806179:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80617c:	0f be d0             	movsx  edx,al
  80617f:	8b 05 ab 42 00 00    	mov    eax,DWORD PTR [rip+0x42ab]        # 80a430 <font_size>
  806185:	8b 35 c5 13 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc213c5]        # 427550 <fb_cursor_y>
  80618b:	8b 0d db 13 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc213db]        # 42756c <font_height>
  806191:	0f af ce             	imul   ecx,esi
  806194:	8b 35 96 42 00 00    	mov    esi,DWORD PTR [rip+0x4296]        # 80a430 <font_size>
  80619a:	0f af ce             	imul   ecx,esi
  80619d:	41 89 c8             	mov    r8d,ecx
  8061a0:	8b 35 a6 13 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc213a6]        # 42754c <fb_cursor_x>
  8061a6:	8b 0d bc 13 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc213bc]        # 427568 <font_width>
  8061ac:	0f af ce             	imul   ecx,esi
  8061af:	8b 35 7b 42 00 00    	mov    esi,DWORD PTR [rip+0x427b]        # 80a430 <font_size>
  8061b5:	0f af ce             	imul   ecx,esi
  8061b8:	89 cf                	mov    edi,ecx
  8061ba:	89 d1                	mov    ecx,edx
  8061bc:	89 c2                	mov    edx,eax
  8061be:	44 89 c6             	mov    esi,r8d
  8061c1:	e8 b8 fc ff ff       	call   805e7e <draw_letter>
        fb_cursor_x+=1;
  8061c6:	8b 05 80 13 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21380]        # 42754c <fb_cursor_x>
  8061cc:	83 c0 01             	add    eax,0x1
  8061cf:	89 05 77 13 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21377],eax        # 42754c <fb_cursor_x>
  8061d5:	eb 01                	jmp    8061d8 <print+0x107>
        if(*s=='\n')continue;
  8061d7:	90                   	nop
    for(;*s;s++){
  8061d8:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  8061dd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8061e1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8061e4:	84 c0                	test   al,al
  8061e6:	0f 85 fa fe ff ff    	jne    8060e6 <print+0x15>
    }
}
  8061ec:	90                   	nop
  8061ed:	90                   	nop
  8061ee:	c9                   	leave  
  8061ef:	c3                   	ret    

00000000008061f0 <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  8061f0:	f3 0f 1e fa          	endbr64 
  8061f4:	55                   	push   rbp
  8061f5:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  8061f8:	0f b6 05 ae 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc215ae]        # 4277ad <k_shift>
  8061ff:	84 c0                	test   al,al
  806201:	0f 94 c0             	sete   al
  806204:	88 05 a3 15 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc215a3],al        # 4277ad <k_shift>
}
  80620a:	90                   	nop
  80620b:	5d                   	pop    rbp
  80620c:	c3                   	ret    

000000000080620d <ctrl>:
void ctrl()
{
  80620d:	f3 0f 1e fa          	endbr64 
  806211:	55                   	push   rbp
  806212:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  806215:	0f b6 05 92 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21592]        # 4277ae <k_ctrl>
  80621c:	84 c0                	test   al,al
  80621e:	0f 94 c0             	sete   al
  806221:	88 05 87 15 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc21587],al        # 4277ae <k_ctrl>
}
  806227:	90                   	nop
  806228:	5d                   	pop    rbp
  806229:	c3                   	ret    

000000000080622a <capslock>:
void capslock()
{
  80622a:	f3 0f 1e fa          	endbr64 
  80622e:	55                   	push   rbp
  80622f:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  806232:	0f b6 05 76 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21576]        # 4277af <k_capslock>
  806239:	84 c0                	test   al,al
  80623b:	0f 94 c0             	sete   al
  80623e:	88 05 6b 15 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc2156b],al        # 4277af <k_capslock>
}
  806244:	90                   	nop
  806245:	5d                   	pop    rbp
  806246:	c3                   	ret    

0000000000806247 <to_ascii>:
char to_ascii(char scan_code)
{
  806247:	f3 0f 1e fa          	endbr64 
  80624b:	55                   	push   rbp
  80624c:	48 89 e5             	mov    rbp,rsp
  80624f:	89 f8                	mov    eax,edi
  806251:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  806254:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80625b:	e9 c7 00 00 00       	jmp    806327 <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  806260:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806263:	48 63 d0             	movsxd rdx,eax
  806266:	48 89 d0             	mov    rax,rdx
  806269:	48 c1 e0 02          	shl    rax,0x2
  80626d:	48 01 d0             	add    rax,rdx
  806270:	48 05 c2 20 81 00    	add    rax,0x8120c2
  806276:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806279:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  80627c:	0f 85 a1 00 00 00    	jne    806323 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  806282:	0f b6 05 26 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21526]        # 4277af <k_capslock>
  806289:	84 c0                	test   al,al
  80628b:	74 55                	je     8062e2 <to_ascii+0x9b>
  80628d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806290:	48 63 d0             	movsxd rdx,eax
  806293:	48 89 d0             	mov    rax,rdx
  806296:	48 c1 e0 02          	shl    rax,0x2
  80629a:	48 01 d0             	add    rax,rdx
  80629d:	48 05 c0 20 81 00    	add    rax,0x8120c0
  8062a3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8062a6:	3c 60                	cmp    al,0x60
  8062a8:	7e 38                	jle    8062e2 <to_ascii+0x9b>
  8062aa:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8062ad:	48 63 d0             	movsxd rdx,eax
  8062b0:	48 89 d0             	mov    rax,rdx
  8062b3:	48 c1 e0 02          	shl    rax,0x2
  8062b7:	48 01 d0             	add    rax,rdx
  8062ba:	48 05 c0 20 81 00    	add    rax,0x8120c0
  8062c0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8062c3:	3c 7a                	cmp    al,0x7a
  8062c5:	7f 1b                	jg     8062e2 <to_ascii+0x9b>
  8062c7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8062ca:	48 63 d0             	movsxd rdx,eax
  8062cd:	48 89 d0             	mov    rax,rdx
  8062d0:	48 c1 e0 02          	shl    rax,0x2
  8062d4:	48 01 d0             	add    rax,rdx
  8062d7:	48 05 c1 20 81 00    	add    rax,0x8120c1
  8062dd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8062e0:	eb 54                	jmp    806336 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  8062e2:	0f b6 05 c4 14 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc214c4]        # 4277ad <k_shift>
  8062e9:	84 c0                	test   al,al
  8062eb:	74 1b                	je     806308 <to_ascii+0xc1>
  8062ed:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8062f0:	48 63 d0             	movsxd rdx,eax
  8062f3:	48 89 d0             	mov    rax,rdx
  8062f6:	48 c1 e0 02          	shl    rax,0x2
  8062fa:	48 01 d0             	add    rax,rdx
  8062fd:	48 05 c1 20 81 00    	add    rax,0x8120c1
  806303:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806306:	eb 2e                	jmp    806336 <to_ascii+0xef>
            else return key_map[i].ascii;
  806308:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80630b:	48 63 d0             	movsxd rdx,eax
  80630e:	48 89 d0             	mov    rax,rdx
  806311:	48 c1 e0 02          	shl    rax,0x2
  806315:	48 01 d0             	add    rax,rdx
  806318:	48 05 c0 20 81 00    	add    rax,0x8120c0
  80631e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806321:	eb 13                	jmp    806336 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  806323:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806327:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  80632b:	0f 8e 2f ff ff ff    	jle    806260 <to_ascii+0x19>
        }

    return '\0';
  806331:	b8 00 00 00 00       	mov    eax,0x0
}
  806336:	5d                   	pop    rbp
  806337:	c3                   	ret    

0000000000806338 <init_kb>:
int init_kb()
{
  806338:	f3 0f 1e fa          	endbr64 
  80633c:	55                   	push   rbp
  80633d:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  806340:	bf 00 20 81 00       	mov    edi,0x812000
  806345:	e8 cb c7 ff ff       	call   802b15 <reg_device>
    reg_driver(&drv_keyboard);
  80634a:	bf 60 1f 81 00       	mov    edi,0x811f60
  80634f:	e8 a9 ca ff ff       	call   802dfd <reg_driver>
}
  806354:	90                   	nop
  806355:	5d                   	pop    rbp
  806356:	c3                   	ret    

0000000000806357 <key_proc>:
int key_proc()
{
  806357:	f3 0f 1e fa          	endbr64 
  80635b:	55                   	push   rbp
  80635c:	48 89 e5             	mov    rbp,rsp
  80635f:	48 83 ec 10          	sub    rsp,0x10
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  806363:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  806367:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  80636b:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  80636f:	bf 60 00 00 00       	mov    edi,0x60
  806374:	e8 30 eb ff ff       	call   804ea9 <inb>
  806379:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  80637c:	8b 05 ca 40 00 00    	mov    eax,DWORD PTR [rip+0x40ca]        # 80a44c <key_bufq+0xc>
  806382:	83 c0 01             	add    eax,0x1
  806385:	8b 0d c5 40 00 00    	mov    ecx,DWORD PTR [rip+0x40c5]        # 80a450 <key_bufq+0x10>
  80638b:	99                   	cdq    
  80638c:	f7 f9                	idiv   ecx
  80638e:	8b 05 b4 40 00 00    	mov    eax,DWORD PTR [rip+0x40b4]        # 80a448 <key_bufq+0x8>
  806394:	39 c2                	cmp    edx,eax
  806396:	74 32                	je     8063ca <key_proc+0x73>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  806398:	48 8b 15 a1 40 00 00 	mov    rdx,QWORD PTR [rip+0x40a1]        # 80a440 <key_bufq>
  80639f:	8b 05 a7 40 00 00    	mov    eax,DWORD PTR [rip+0x40a7]        # 80a44c <key_bufq+0xc>
  8063a5:	48 98                	cdqe   
  8063a7:	48 01 c2             	add    rdx,rax
  8063aa:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8063ae:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  8063b0:	8b 05 96 40 00 00    	mov    eax,DWORD PTR [rip+0x4096]        # 80a44c <key_bufq+0xc>
  8063b6:	83 c0 01             	add    eax,0x1
  8063b9:	8b 0d 91 40 00 00    	mov    ecx,DWORD PTR [rip+0x4091]        # 80a450 <key_bufq+0x10>
  8063bf:	99                   	cdq    
  8063c0:	f7 f9                	idiv   ecx
  8063c2:	89 d0                	mov    eax,edx
  8063c4:	89 05 82 40 00 00    	mov    DWORD PTR [rip+0x4082],eax        # 80a44c <key_bufq+0xc>
    }

    if(scan1==0x48)
  8063ca:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  8063ce:	75 0a                	jne    8063da <key_proc+0x83>
        scr_up();
  8063d0:	b8 00 00 00 00       	mov    eax,0x0
  8063d5:	e8 d2 fb ff ff       	call   805fac <scr_up>
    if(scan1==0x50)
  8063da:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  8063de:	75 0a                	jne    8063ea <key_proc+0x93>
        scr_down();
  8063e0:	b8 00 00 00 00       	mov    eax,0x0
  8063e5:	e8 53 fc ff ff       	call   80603d <scr_down>
    switch (scan1)
  8063ea:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8063ee:	3d b6 00 00 00       	cmp    eax,0xb6
  8063f3:	74 41                	je     806436 <key_proc+0xdf>
  8063f5:	3d b6 00 00 00       	cmp    eax,0xb6
  8063fa:	7f 5e                	jg     80645a <key_proc+0x103>
  8063fc:	3d aa 00 00 00       	cmp    eax,0xaa
  806401:	74 33                	je     806436 <key_proc+0xdf>
  806403:	3d aa 00 00 00       	cmp    eax,0xaa
  806408:	7f 50                	jg     80645a <key_proc+0x103>
  80640a:	3d 9d 00 00 00       	cmp    eax,0x9d
  80640f:	74 31                	je     806442 <key_proc+0xeb>
  806411:	3d 9d 00 00 00       	cmp    eax,0x9d
  806416:	7f 42                	jg     80645a <key_proc+0x103>
  806418:	83 f8 3a             	cmp    eax,0x3a
  80641b:	74 31                	je     80644e <key_proc+0xf7>
  80641d:	83 f8 3a             	cmp    eax,0x3a
  806420:	7f 38                	jg     80645a <key_proc+0x103>
  806422:	83 f8 36             	cmp    eax,0x36
  806425:	74 0f                	je     806436 <key_proc+0xdf>
  806427:	83 f8 36             	cmp    eax,0x36
  80642a:	7f 2e                	jg     80645a <key_proc+0x103>
  80642c:	83 f8 1d             	cmp    eax,0x1d
  80642f:	74 11                	je     806442 <key_proc+0xeb>
  806431:	83 f8 2a             	cmp    eax,0x2a
  806434:	75 24                	jne    80645a <key_proc+0x103>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  806436:	b8 00 00 00 00       	mov    eax,0x0
  80643b:	e8 b0 fd ff ff       	call   8061f0 <shift>
            break;
  806440:	eb 19                	jmp    80645b <key_proc+0x104>
        case 0x1d:
        case 0x9d:
            ctrl();
  806442:	b8 00 00 00 00       	mov    eax,0x0
  806447:	e8 c1 fd ff ff       	call   80620d <ctrl>
            break;
  80644c:	eb 0d                	jmp    80645b <key_proc+0x104>
        case 0x3a:
            capslock();
  80644e:	b8 00 00 00 00       	mov    eax,0x0
  806453:	e8 d2 fd ff ff       	call   80622a <capslock>
            break;
  806458:	eb 01                	jmp    80645b <key_proc+0x104>
        default:
            break;
  80645a:	90                   	nop
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  80645b:	b8 00 00 00 00       	mov    eax,0x0
  806460:	e8 59 ea ff ff       	call   804ebe <eoi>
    asm volatile("leave \r\n iretq");
  806465:	c9                   	leave  
  806466:	48 cf                	iretq  
}
  806468:	90                   	nop
  806469:	c9                   	leave  
  80646a:	c3                   	ret    

000000000080646b <sys_getkbc>:

char sys_getkbc()
{
  80646b:	f3 0f 1e fa          	endbr64 
  80646f:	55                   	push   rbp
  806470:	48 89 e5             	mov    rbp,rsp
    if(key_bufq.tail==key_bufq.head)return -1;
  806473:	8b 15 d3 3f 00 00    	mov    edx,DWORD PTR [rip+0x3fd3]        # 80a44c <key_bufq+0xc>
  806479:	8b 05 c9 3f 00 00    	mov    eax,DWORD PTR [rip+0x3fc9]        # 80a448 <key_bufq+0x8>
  80647f:	39 c2                	cmp    edx,eax
  806481:	75 07                	jne    80648a <sys_getkbc+0x1f>
  806483:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806488:	eb 30                	jmp    8064ba <sys_getkbc+0x4f>
    char c=key_buf[key_bufq.tail];
  80648a:	8b 05 bc 3f 00 00    	mov    eax,DWORD PTR [rip+0x3fbc]        # 80a44c <key_bufq+0xc>
  806490:	48 98                	cdqe   
  806492:	0f b6 80 a0 75 42 00 	movzx  eax,BYTE PTR [rax+0x4275a0]
  806499:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QTAIL(key_bufq)=(QTAIL(key_bufq)+1)%QSIZE(key_bufq);
  80649c:	8b 05 aa 3f 00 00    	mov    eax,DWORD PTR [rip+0x3faa]        # 80a44c <key_bufq+0xc>
  8064a2:	83 c0 01             	add    eax,0x1
  8064a5:	8b 0d a5 3f 00 00    	mov    ecx,DWORD PTR [rip+0x3fa5]        # 80a450 <key_bufq+0x10>
  8064ab:	99                   	cdq    
  8064ac:	f7 f9                	idiv   ecx
  8064ae:	89 d0                	mov    eax,edx
  8064b0:	89 05 96 3f 00 00    	mov    DWORD PTR [rip+0x3f96],eax        # 80a44c <key_bufq+0xc>
    return c;
  8064b6:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  8064ba:	5d                   	pop    rbp
  8064bb:	c3                   	ret    

00000000008064bc <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  8064bc:	f3 0f 1e fa          	endbr64 
  8064c0:	55                   	push   rbp
  8064c1:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  8064c4:	b8 00 00 00 00       	mov    eax,0x0
  8064c9:	e8 8d 09 00 00       	call   806e5b <hd_iterate>
    return 0;
  8064ce:	b8 00 00 00 00       	mov    eax,0x0
}
  8064d3:	5d                   	pop    rbp
  8064d4:	c3                   	ret    

00000000008064d5 <disk_int_handler_c>:

int disk_int_handler_c()
{
  8064d5:	f3 0f 1e fa          	endbr64 
  8064d9:	55                   	push   rbp
  8064da:	48 89 e5             	mov    rbp,rsp
  8064dd:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  8064e1:	48 8b 05 d8 3f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23fd8]        # 42a4c0 <running_req>
  8064e8:	48 85 c0             	test   rax,rax
  8064eb:	75 0a                	jne    8064f7 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  8064ed:	b8 01 00 00 00       	mov    eax,0x1
  8064f2:	e9 a3 01 00 00       	jmp    80669a <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  8064f7:	48 8b 05 c2 3f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23fc2]        # 42a4c0 <running_req>
  8064fe:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806502:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  806506:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  80650d:	48 8b 05 ac 3f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23fac]        # 42a4c0 <running_req>
  806514:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806517:	83 f8 02             	cmp    eax,0x2
  80651a:	74 0f                	je     80652b <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  80651c:	48 8b 05 9d 3f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23f9d]        # 42a4c0 <running_req>
  806523:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  806526:	83 f8 03             	cmp    eax,0x3
  806529:	75 07                	jne    806532 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  80652b:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  806532:	48 8b 05 87 3f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23f87]        # 42a4c0 <running_req>
  806539:	8b 00                	mov    eax,DWORD PTR [rax]
  80653b:	85 c0                	test   eax,eax
  80653d:	75 42                	jne    806581 <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  80653f:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  806546:	eb 22                	jmp    80656a <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  806548:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80654b:	0f b7 c0             	movzx  eax,ax
  80654e:	89 c7                	mov    edi,eax
  806550:	e8 5e e9 ff ff       	call   804eb3 <inw>
  806555:	89 c2                	mov    edx,eax
  806557:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80655b:	48 8d 48 02          	lea    rcx,[rax+0x2]
  80655f:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  806563:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  806566:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  80656a:	48 8b 05 4f 3f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23f4f]        # 42a4c0 <running_req>
  806571:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806574:	c1 e0 08             	shl    eax,0x8
  806577:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  80657a:	7c cc                	jl     806548 <disk_int_handler_c+0x73>
  80657c:	e9 ca 00 00 00       	jmp    80664b <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  806581:	48 8b 05 38 3f c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23f38]        # 42a4c0 <running_req>
  806588:	8b 00                	mov    eax,DWORD PTR [rax]
  80658a:	83 f8 01             	cmp    eax,0x1
  80658d:	75 42                	jne    8065d1 <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  80658f:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  806596:	eb 25                	jmp    8065bd <disk_int_handler_c+0xe8>
            outw(port,*p++);
  806598:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80659c:	48 8d 50 02          	lea    rdx,[rax+0x2]
  8065a0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8065a4:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8065a7:	0f b7 d0             	movzx  edx,ax
  8065aa:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8065ad:	0f b7 c0             	movzx  eax,ax
  8065b0:	89 d6                	mov    esi,edx
  8065b2:	89 c7                	mov    edi,eax
  8065b4:	e8 e4 e8 ff ff       	call   804e9d <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  8065b9:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8065bd:	48 8b 05 fc 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23efc]        # 42a4c0 <running_req>
  8065c4:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8065c7:	c1 e0 08             	shl    eax,0x8
  8065ca:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8065cd:	7c c9                	jl     806598 <disk_int_handler_c+0xc3>
  8065cf:	eb 7a                	jmp    80664b <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  8065d1:	48 8b 05 e8 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23ee8]        # 42a4c0 <running_req>
  8065d8:	8b 00                	mov    eax,DWORD PTR [rax]
  8065da:	83 f8 02             	cmp    eax,0x2
  8065dd:	75 34                	jne    806613 <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  8065df:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8065e2:	83 c0 07             	add    eax,0x7
  8065e5:	0f b6 c0             	movzx  eax,al
  8065e8:	89 c7                	mov    edi,eax
  8065ea:	e8 ba e8 ff ff       	call   804ea9 <inb>
  8065ef:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  8065f2:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8065f5:	0f b7 c0             	movzx  eax,ax
  8065f8:	89 c7                	mov    edi,eax
  8065fa:	e8 b4 e8 ff ff       	call   804eb3 <inw>
  8065ff:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  806603:	48 8b 05 b6 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23eb6]        # 42a4c0 <running_req>
  80660a:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  806611:	eb 38                	jmp    80664b <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  806613:	48 8b 05 a6 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23ea6]        # 42a4c0 <running_req>
  80661a:	8b 00                	mov    eax,DWORD PTR [rax]
  80661c:	83 f8 03             	cmp    eax,0x3
  80661f:	75 2a                	jne    80664b <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  806621:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806624:	83 c0 07             	add    eax,0x7
  806627:	0f b6 c0             	movzx  eax,al
  80662a:	89 c7                	mov    edi,eax
  80662c:	e8 78 e8 ff ff       	call   804ea9 <inb>
  806631:	0f b6 c0             	movzx  eax,al
  806634:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  806637:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80663a:	89 c6                	mov    esi,eax
  80663c:	bf 96 22 81 00       	mov    edi,0x812296
  806641:	b8 00 00 00 00       	mov    eax,0x0
  806646:	e8 64 a6 ff ff       	call   800caf <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  80664b:	48 8b 05 6e 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23e6e]        # 42a4c0 <running_req>
  806652:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  806659:	48 8b 05 60 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23e60]        # 42a4c0 <running_req>
  806660:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806664:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  80666b:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  80666e:	48 8b 05 53 3e c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23e53]        # 42a4c8 <running_devman_req>
  806675:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  80667c:	00 00 00 
    running_devman_req=NULL;
  80667f:	48 c7 05 3e 3e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23e3e],0x0        # 42a4c8 <running_devman_req>
  806686:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  80668a:	48 c7 05 2b 3e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23e2b],0x0        # 42a4c0 <running_req>
  806691:	00 00 00 00 
    return 0;
  806695:	b8 00 00 00 00       	mov    eax,0x0
}
  80669a:	c9                   	leave  
  80669b:	c3                   	ret    

000000000080669c <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  80669c:	f3 0f 1e fa          	endbr64 
  8066a0:	55                   	push   rbp
  8066a1:	48 89 e5             	mov    rbp,rsp
  8066a4:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  8066a7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8066aa:	48 63 d0             	movsxd rdx,eax
  8066ad:	48 89 d0             	mov    rax,rdx
  8066b0:	48 01 c0             	add    rax,rax
  8066b3:	48 01 d0             	add    rax,rdx
  8066b6:	48 c1 e0 04          	shl    rax,0x4
  8066ba:	48 05 dc 77 42 00    	add    rax,0x4277dc
  8066c0:	8b 00                	mov    eax,DWORD PTR [rax]
}
  8066c2:	5d                   	pop    rbp
  8066c3:	c3                   	ret    

00000000008066c4 <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  8066c4:	f3 0f 1e fa          	endbr64 
  8066c8:	55                   	push   rbp
  8066c9:	48 89 e5             	mov    rbp,rsp
  8066cc:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8066cf:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8066d2:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  8066d5:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  8066d8:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  8066dc:	8b 05 12 3e c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23e12]        # 42a4f4 <tail>
  8066e2:	83 c0 01             	add    eax,0x1
  8066e5:	48 63 d0             	movsxd rdx,eax
  8066e8:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  8066ef:	48 c1 ea 20          	shr    rdx,0x20
  8066f3:	01 c2                	add    edx,eax
  8066f5:	c1 fa 07             	sar    edx,0x7
  8066f8:	89 c1                	mov    ecx,eax
  8066fa:	c1 f9 1f             	sar    ecx,0x1f
  8066fd:	29 ca                	sub    edx,ecx
  8066ff:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  806705:	29 c8                	sub    eax,ecx
  806707:	89 c2                	mov    edx,eax
  806709:	8b 05 e1 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23de1]        # 42a4f0 <head>
  80670f:	39 c2                	cmp    edx,eax
  806711:	75 0a                	jne    80671d <request+0x59>
    {
        return -1;
  806713:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806718:	e9 0d 01 00 00       	jmp    80682a <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  80671d:	8b 05 d1 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23dd1]        # 42a4f4 <tail>
  806723:	48 63 d0             	movsxd rdx,eax
  806726:	48 89 d0             	mov    rax,rdx
  806729:	48 01 c0             	add    rax,rax
  80672c:	48 01 d0             	add    rax,rdx
  80672f:	48 c1 e0 04          	shl    rax,0x4
  806733:	48 8d 90 c4 77 42 00 	lea    rdx,[rax+0x4277c4]
  80673a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80673d:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  80673f:	8b 05 af 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23daf]        # 42a4f4 <tail>
  806745:	48 63 d0             	movsxd rdx,eax
  806748:	48 89 d0             	mov    rax,rdx
  80674b:	48 01 c0             	add    rax,rax
  80674e:	48 01 d0             	add    rax,rdx
  806751:	48 c1 e0 04          	shl    rax,0x4
  806755:	48 8d 90 c0 77 42 00 	lea    rdx,[rax+0x4277c0]
  80675c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80675f:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  806761:	8b 05 8d 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23d8d]        # 42a4f4 <tail>
  806767:	48 63 d0             	movsxd rdx,eax
  80676a:	48 89 d0             	mov    rax,rdx
  80676d:	48 01 c0             	add    rax,rax
  806770:	48 01 d0             	add    rax,rdx
  806773:	48 c1 e0 04          	shl    rax,0x4
  806777:	48 8d 90 c8 77 42 00 	lea    rdx,[rax+0x4277c8]
  80677e:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806781:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  806783:	8b 05 6b 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23d6b]        # 42a4f4 <tail>
  806789:	48 63 d0             	movsxd rdx,eax
  80678c:	48 89 d0             	mov    rax,rdx
  80678f:	48 01 c0             	add    rax,rax
  806792:	48 01 d0             	add    rax,rdx
  806795:	48 c1 e0 04          	shl    rax,0x4
  806799:	48 8d 90 cc 77 42 00 	lea    rdx,[rax+0x4277cc]
  8067a0:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8067a3:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  8067a5:	8b 05 49 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23d49]        # 42a4f4 <tail>
  8067ab:	48 63 d0             	movsxd rdx,eax
  8067ae:	48 89 d0             	mov    rax,rdx
  8067b1:	48 01 c0             	add    rax,rax
  8067b4:	48 01 d0             	add    rax,rdx
  8067b7:	48 c1 e0 04          	shl    rax,0x4
  8067bb:	48 05 dc 77 42 00    	add    rax,0x4277dc
  8067c1:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  8067c7:	8b 05 27 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23d27]        # 42a4f4 <tail>
  8067cd:	48 63 d0             	movsxd rdx,eax
  8067d0:	48 89 d0             	mov    rax,rdx
  8067d3:	48 01 c0             	add    rax,rax
  8067d6:	48 01 d0             	add    rax,rdx
  8067d9:	48 c1 e0 04          	shl    rax,0x4
  8067dd:	48 8d 90 d0 77 42 00 	lea    rdx,[rax+0x4277d0]
  8067e4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8067e8:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  8067eb:	8b 05 03 3d c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23d03]        # 42a4f4 <tail>
  8067f1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  8067f4:	8b 05 fa 3c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23cfa]        # 42a4f4 <tail>
  8067fa:	8d 50 01             	lea    edx,[rax+0x1]
  8067fd:	48 63 c2             	movsxd rax,edx
  806800:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806807:	48 c1 e8 20          	shr    rax,0x20
  80680b:	01 d0                	add    eax,edx
  80680d:	c1 f8 07             	sar    eax,0x7
  806810:	89 d1                	mov    ecx,edx
  806812:	c1 f9 1f             	sar    ecx,0x1f
  806815:	29 c8                	sub    eax,ecx
  806817:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  80681d:	89 d0                	mov    eax,edx
  80681f:	29 c8                	sub    eax,ecx
  806821:	89 05 cd 3c c2 ff    	mov    DWORD PTR [rip+0xffffffffffc23ccd],eax        # 42a4f4 <tail>
    return r;
  806827:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80682a:	5d                   	pop    rbp
  80682b:	c3                   	ret    

000000000080682c <execute_request>:
int execute_request(){
  80682c:	f3 0f 1e fa          	endbr64 
  806830:	55                   	push   rbp
  806831:	48 89 e5             	mov    rbp,rsp
  806834:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  806838:	48 8b 05 81 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c81]        # 42a4c0 <running_req>
  80683f:	48 85 c0             	test   rax,rax
  806842:	74 6a                	je     8068ae <execute_request+0x82>
    {
        running_req->time++;
  806844:	48 8b 05 75 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c75]        # 42a4c0 <running_req>
  80684b:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  80684e:	83 c2 01             	add    edx,0x1
  806851:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  806854:	48 8b 05 65 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c65]        # 42a4c0 <running_req>
  80685b:	8b 00                	mov    eax,DWORD PTR [rax]
  80685d:	83 f8 02             	cmp    eax,0x2
  806860:	74 0a                	je     80686c <execute_request+0x40>
            return 2;
  806862:	b8 02 00 00 00       	mov    eax,0x2
  806867:	e9 b4 01 00 00       	jmp    806a20 <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  80686c:	48 8b 05 4d 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c4d]        # 42a4c0 <running_req>
  806873:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  806876:	83 f8 0a             	cmp    eax,0xa
  806879:	7e 29                	jle    8068a4 <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  80687b:	48 8b 05 3e 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c3e]        # 42a4c0 <running_req>
  806882:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  806889:	48 8b 05 30 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c30]        # 42a4c0 <running_req>
  806890:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  806897:	48 c7 05 1e 3c c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23c1e],0x0        # 42a4c0 <running_req>
  80689e:	00 00 00 00 
  8068a2:	eb 0a                	jmp    8068ae <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  8068a4:	b8 02 00 00 00       	mov    eax,0x2
  8068a9:	e9 72 01 00 00       	jmp    806a20 <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  8068ae:	8b 15 3c 3c c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc23c3c]        # 42a4f0 <head>
  8068b4:	8b 05 3a 3c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23c3a]        # 42a4f4 <tail>
  8068ba:	39 c2                	cmp    edx,eax
  8068bc:	75 0a                	jne    8068c8 <execute_request+0x9c>
  8068be:	b8 01 00 00 00       	mov    eax,0x1
  8068c3:	e9 58 01 00 00       	jmp    806a20 <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  8068c8:	8b 05 22 3c c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23c22]        # 42a4f0 <head>
  8068ce:	48 63 d0             	movsxd rdx,eax
  8068d1:	48 89 d0             	mov    rax,rdx
  8068d4:	48 01 c0             	add    rax,rax
  8068d7:	48 01 d0             	add    rax,rdx
  8068da:	48 c1 e0 04          	shl    rax,0x4
  8068de:	48 05 c0 77 42 00    	add    rax,0x4277c0
  8068e4:	48 89 05 d5 3b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23bd5],rax        # 42a4c0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  8068eb:	8b 05 ff 3b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23bff]        # 42a4f0 <head>
  8068f1:	8d 50 01             	lea    edx,[rax+0x1]
  8068f4:	48 63 c2             	movsxd rax,edx
  8068f7:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  8068fe:	48 c1 e8 20          	shr    rax,0x20
  806902:	01 d0                	add    eax,edx
  806904:	c1 f8 07             	sar    eax,0x7
  806907:	89 d1                	mov    ecx,edx
  806909:	c1 f9 1f             	sar    ecx,0x1f
  80690c:	29 c8                	sub    eax,ecx
  80690e:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  806914:	89 d0                	mov    eax,edx
  806916:	29 c8                	sub    eax,ecx
  806918:	89 05 d2 3b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc23bd2],eax        # 42a4f0 <head>
    running_req->stat=REQ_STAT_WORKING;
  80691e:	48 8b 05 9b 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b9b]        # 42a4c0 <running_req>
  806925:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  80692c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  806933:	48 8b 05 86 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b86]        # 42a4c0 <running_req>
  80693a:	8b 00                	mov    eax,DWORD PTR [rax]
  80693c:	83 f8 03             	cmp    eax,0x3
  80693f:	0f 84 ad 00 00 00    	je     8069f2 <execute_request+0x1c6>
  806945:	83 f8 03             	cmp    eax,0x3
  806948:	0f 8f bf 00 00 00    	jg     806a0d <execute_request+0x1e1>
  80694e:	83 f8 02             	cmp    eax,0x2
  806951:	0f 84 85 00 00 00    	je     8069dc <execute_request+0x1b0>
  806957:	83 f8 02             	cmp    eax,0x2
  80695a:	0f 8f ad 00 00 00    	jg     806a0d <execute_request+0x1e1>
  806960:	85 c0                	test   eax,eax
  806962:	74 0a                	je     80696e <execute_request+0x142>
  806964:	83 f8 01             	cmp    eax,0x1
  806967:	74 3c                	je     8069a5 <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  806969:	e9 9f 00 00 00       	jmp    806a0d <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  80696e:	48 8b 05 4b 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b4b]        # 42a4c0 <running_req>
        r=async_read_disk(running_req->disk,\
  806975:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  806979:	48 8b 05 40 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b40]        # 42a4c0 <running_req>
        r=async_read_disk(running_req->disk,\
  806980:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  806983:	48 8b 05 36 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b36]        # 42a4c0 <running_req>
  80698a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  80698d:	89 c6                	mov    esi,eax
  80698f:	48 8b 05 2a 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b2a]        # 42a4c0 <running_req>
  806996:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806999:	89 c7                	mov    edi,eax
  80699b:	e8 a7 00 00 00       	call   806a47 <async_read_disk>
  8069a0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8069a3:	eb 69                	jmp    806a0e <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  8069a5:	48 8b 05 14 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b14]        # 42a4c0 <running_req>
        r=async_write_disk(running_req->disk,\
  8069ac:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  8069b0:	48 8b 05 09 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b09]        # 42a4c0 <running_req>
        r=async_write_disk(running_req->disk,\
  8069b7:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  8069ba:	48 8b 05 ff 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23aff]        # 42a4c0 <running_req>
  8069c1:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  8069c4:	89 c6                	mov    esi,eax
  8069c6:	48 8b 05 f3 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23af3]        # 42a4c0 <running_req>
  8069cd:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8069d0:	89 c7                	mov    edi,eax
  8069d2:	e8 88 01 00 00       	call   806b5f <async_write_disk>
  8069d7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8069da:	eb 32                	jmp    806a0e <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  8069dc:	48 8b 05 dd 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23add]        # 42a4c0 <running_req>
  8069e3:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8069e6:	89 c7                	mov    edi,eax
  8069e8:	e8 8f 06 00 00       	call   80707c <async_check_disk>
  8069ed:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  8069f0:	eb 1c                	jmp    806a0e <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  8069f2:	48 8b 05 c7 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23ac7]        # 42a4c0 <running_req>
  8069f9:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8069fc:	89 c7                	mov    edi,eax
  8069fe:	b8 00 00 00 00       	mov    eax,0x0
  806a03:	e8 1a 00 00 00       	call   806a22 <async_reset_disk>
  806a08:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806a0b:	eb 01                	jmp    806a0e <execute_request+0x1e2>
        break;
  806a0d:	90                   	nop
    }
    if(r==-1)return -1;
  806a0e:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  806a12:	75 07                	jne    806a1b <execute_request+0x1ef>
  806a14:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806a19:	eb 05                	jmp    806a20 <execute_request+0x1f4>
    return 0;
  806a1b:	b8 00 00 00 00       	mov    eax,0x0
}
  806a20:	c9                   	leave  
  806a21:	c3                   	ret    

0000000000806a22 <async_reset_disk>:
int async_reset_disk(int disk)
{
  806a22:	f3 0f 1e fa          	endbr64 
  806a26:	55                   	push   rbp
  806a27:	48 89 e5             	mov    rbp,rsp
  806a2a:	48 83 ec 10          	sub    rsp,0x10
  806a2e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  806a31:	be 0c 00 00 00       	mov    esi,0xc
  806a36:	bf f6 03 00 00       	mov    edi,0x3f6
  806a3b:	e8 50 e4 ff ff       	call   804e90 <outb>
    return 0;
  806a40:	b8 00 00 00 00       	mov    eax,0x0
}
  806a45:	c9                   	leave  
  806a46:	c3                   	ret    

0000000000806a47 <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  806a47:	f3 0f 1e fa          	endbr64 
  806a4b:	55                   	push   rbp
  806a4c:	48 89 e5             	mov    rbp,rsp
  806a4f:	48 83 ec 30          	sub    rsp,0x30
  806a53:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806a56:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806a59:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806a5c:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  806a60:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  806a66:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806a6d:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806a71:	74 06                	je     806a79 <async_read_disk+0x32>
  806a73:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806a77:	75 06                	jne    806a7f <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  806a79:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806a7f:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806a83:	74 06                	je     806a8b <async_read_disk+0x44>
  806a85:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806a89:	75 07                	jne    806a92 <async_read_disk+0x4b>
        slave_disk=1;
  806a8b:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  806a92:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806a95:	0f b6 d0             	movzx  edx,al
  806a98:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806a9c:	83 c0 02             	add    eax,0x2
  806a9f:	0f b7 c0             	movzx  eax,ax
  806aa2:	89 d6                	mov    esi,edx
  806aa4:	89 c7                	mov    edi,eax
  806aa6:	e8 e5 e3 ff ff       	call   804e90 <outb>
    outb(port+3,lba&0xff);
  806aab:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806aae:	0f b6 d0             	movzx  edx,al
  806ab1:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806ab5:	83 c0 03             	add    eax,0x3
  806ab8:	0f b7 c0             	movzx  eax,ax
  806abb:	89 d6                	mov    esi,edx
  806abd:	89 c7                	mov    edi,eax
  806abf:	e8 cc e3 ff ff       	call   804e90 <outb>
    outb(port+4,(lba>>8)&0xff);
  806ac4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806ac7:	c1 e8 08             	shr    eax,0x8
  806aca:	0f b6 d0             	movzx  edx,al
  806acd:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806ad1:	83 c0 04             	add    eax,0x4
  806ad4:	0f b7 c0             	movzx  eax,ax
  806ad7:	89 d6                	mov    esi,edx
  806ad9:	89 c7                	mov    edi,eax
  806adb:	e8 b0 e3 ff ff       	call   804e90 <outb>
    outb(port+5,(lba>>16)&0xff);
  806ae0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806ae3:	c1 e8 10             	shr    eax,0x10
  806ae6:	0f b6 d0             	movzx  edx,al
  806ae9:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806aed:	83 c0 05             	add    eax,0x5
  806af0:	0f b7 c0             	movzx  eax,ax
  806af3:	89 d6                	mov    esi,edx
  806af5:	89 c7                	mov    edi,eax
  806af7:	e8 94 e3 ff ff       	call   804e90 <outb>
    char drv=slave_disk?0x10:0;
  806afc:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806b00:	74 07                	je     806b09 <async_read_disk+0xc2>
  806b02:	b8 10 00 00 00       	mov    eax,0x10
  806b07:	eb 05                	jmp    806b0e <async_read_disk+0xc7>
  806b09:	b8 00 00 00 00       	mov    eax,0x0
  806b0e:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  806b11:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806b14:	c1 e8 18             	shr    eax,0x18
  806b17:	83 e0 0f             	and    eax,0xf
  806b1a:	89 c2                	mov    edx,eax
  806b1c:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  806b20:	09 d0                	or     eax,edx
  806b22:	83 c8 e0             	or     eax,0xffffffe0
  806b25:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  806b28:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  806b2c:	0f b6 d0             	movzx  edx,al
  806b2f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806b33:	83 c0 06             	add    eax,0x6
  806b36:	0f b7 c0             	movzx  eax,ax
  806b39:	89 d6                	mov    esi,edx
  806b3b:	89 c7                	mov    edi,eax
  806b3d:	e8 4e e3 ff ff       	call   804e90 <outb>
    outb(port+7,DISK_CMD_READ);
  806b42:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806b46:	83 c0 07             	add    eax,0x7
  806b49:	0f b7 c0             	movzx  eax,ax
  806b4c:	be 20 00 00 00       	mov    esi,0x20
  806b51:	89 c7                	mov    edi,eax
  806b53:	e8 38 e3 ff ff       	call   804e90 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  806b58:	b8 00 00 00 00       	mov    eax,0x0
}
  806b5d:	c9                   	leave  
  806b5e:	c3                   	ret    

0000000000806b5f <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  806b5f:	f3 0f 1e fa          	endbr64 
  806b63:	55                   	push   rbp
  806b64:	48 89 e5             	mov    rbp,rsp
  806b67:	48 83 ec 30          	sub    rsp,0x30
  806b6b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806b6e:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806b71:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806b74:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  806b78:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  806b7e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806b85:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806b89:	74 06                	je     806b91 <async_write_disk+0x32>
  806b8b:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806b8f:	75 06                	jne    806b97 <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  806b91:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806b97:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806b9b:	74 06                	je     806ba3 <async_write_disk+0x44>
  806b9d:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806ba1:	75 07                	jne    806baa <async_write_disk+0x4b>
        slave_disk=1;
  806ba3:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  806baa:	bf f7 00 00 00       	mov    edi,0xf7
  806baf:	e8 f5 e2 ff ff       	call   804ea9 <inb>
  806bb4:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  806bb7:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  806bbb:	83 e0 01             	and    eax,0x1
  806bbe:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  806bc1:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  806bc5:	74 0a                	je     806bd1 <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  806bc7:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806bcc:	e9 d5 00 00 00       	jmp    806ca6 <async_write_disk+0x147>
        }
        t&=0x88;
  806bd1:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  806bd5:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  806bd9:	74 02                	je     806bdd <async_write_disk+0x7e>
    {
  806bdb:	eb cd                	jmp    806baa <async_write_disk+0x4b>
        if(t==0x8)break;
  806bdd:	90                   	nop
    }
    outb(port+2,sec_n);
  806bde:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806be1:	0f b6 d0             	movzx  edx,al
  806be4:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806be8:	83 c0 02             	add    eax,0x2
  806beb:	0f b7 c0             	movzx  eax,ax
  806bee:	89 d6                	mov    esi,edx
  806bf0:	89 c7                	mov    edi,eax
  806bf2:	e8 99 e2 ff ff       	call   804e90 <outb>
    outb(port+3,lba&0xff);
  806bf7:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806bfa:	0f b6 d0             	movzx  edx,al
  806bfd:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c01:	83 c0 03             	add    eax,0x3
  806c04:	0f b7 c0             	movzx  eax,ax
  806c07:	89 d6                	mov    esi,edx
  806c09:	89 c7                	mov    edi,eax
  806c0b:	e8 80 e2 ff ff       	call   804e90 <outb>
    outb(port+4,(lba>>8)&0xff);
  806c10:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806c13:	c1 e8 08             	shr    eax,0x8
  806c16:	0f b6 d0             	movzx  edx,al
  806c19:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c1d:	83 c0 04             	add    eax,0x4
  806c20:	0f b7 c0             	movzx  eax,ax
  806c23:	89 d6                	mov    esi,edx
  806c25:	89 c7                	mov    edi,eax
  806c27:	e8 64 e2 ff ff       	call   804e90 <outb>
    outb(port+5,(lba>>16)&0xff);
  806c2c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806c2f:	c1 e8 10             	shr    eax,0x10
  806c32:	0f b6 d0             	movzx  edx,al
  806c35:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c39:	83 c0 05             	add    eax,0x5
  806c3c:	0f b7 c0             	movzx  eax,ax
  806c3f:	89 d6                	mov    esi,edx
  806c41:	89 c7                	mov    edi,eax
  806c43:	e8 48 e2 ff ff       	call   804e90 <outb>
    char drv=slave_disk?0x10:0;
  806c48:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806c4c:	74 07                	je     806c55 <async_write_disk+0xf6>
  806c4e:	b8 10 00 00 00       	mov    eax,0x10
  806c53:	eb 05                	jmp    806c5a <async_write_disk+0xfb>
  806c55:	b8 00 00 00 00       	mov    eax,0x0
  806c5a:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  806c5d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806c60:	c1 e8 18             	shr    eax,0x18
  806c63:	83 e0 0f             	and    eax,0xf
  806c66:	89 c2                	mov    edx,eax
  806c68:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  806c6c:	09 d0                	or     eax,edx
  806c6e:	83 c8 e0             	or     eax,0xffffffe0
  806c71:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  806c74:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  806c78:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c7c:	83 c0 06             	add    eax,0x6
  806c7f:	0f b7 c0             	movzx  eax,ax
  806c82:	89 d6                	mov    esi,edx
  806c84:	89 c7                	mov    edi,eax
  806c86:	e8 05 e2 ff ff       	call   804e90 <outb>
    outb(port+7,DISK_CMD_WRITE);
  806c8b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806c8f:	83 c0 07             	add    eax,0x7
  806c92:	0f b7 c0             	movzx  eax,ax
  806c95:	be 30 00 00 00       	mov    esi,0x30
  806c9a:	89 c7                	mov    edi,eax
  806c9c:	e8 ef e1 ff ff       	call   804e90 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  806ca1:	b8 00 00 00 00       	mov    eax,0x0
}
  806ca6:	c9                   	leave  
  806ca7:	c3                   	ret    

0000000000806ca8 <read_disk>:
int read_disk(driver_args* args)
{
  806ca8:	f3 0f 1e fa          	endbr64 
  806cac:	55                   	push   rbp
  806cad:	48 89 e5             	mov    rbp,rsp
  806cb0:	48 83 ec 20          	sub    rsp,0x20
  806cb4:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  806cb8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806cbc:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806cbf:	48 98                	cdqe   
  806cc1:	48 89 c2             	mov    rdx,rax
  806cc4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806cc8:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806ccb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806ccf:	8b 00                	mov    eax,DWORD PTR [rax]
  806cd1:	89 ce                	mov    esi,ecx
  806cd3:	89 c7                	mov    edi,eax
  806cd5:	e8 92 05 00 00       	call   80726c <read_disk_asm>
  806cda:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  806cdd:	48 8b 05 dc 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237dc]        # 42a4c0 <running_req>
  806ce4:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  806ceb:	48 8b 05 ce 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237ce]        # 42a4c0 <running_req>
  806cf2:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806cf6:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  806cfd:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806d00:	48 c7 05 b5 37 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc237b5],0x0        # 42a4c0 <running_req>
  806d07:	00 00 00 00 
    return ret;
  806d0b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806d0e:	c9                   	leave  
  806d0f:	c3                   	ret    

0000000000806d10 <write_disk>:
int write_disk(driver_args* args)
{
  806d10:	f3 0f 1e fa          	endbr64 
  806d14:	55                   	push   rbp
  806d15:	48 89 e5             	mov    rbp,rsp
  806d18:	48 83 ec 20          	sub    rsp,0x20
  806d1c:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  806d20:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d24:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  806d27:	48 98                	cdqe   
  806d29:	48 89 c2             	mov    rdx,rax
  806d2c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d30:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  806d33:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806d37:	8b 00                	mov    eax,DWORD PTR [rax]
  806d39:	89 ce                	mov    esi,ecx
  806d3b:	89 c7                	mov    edi,eax
  806d3d:	e8 aa 05 00 00       	call   8072ec <write_disk_asm>
  806d42:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  806d45:	48 8b 05 74 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23774]        # 42a4c0 <running_req>
  806d4c:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  806d53:	48 8b 05 66 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23766]        # 42a4c0 <running_req>
  806d5a:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  806d5e:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  806d65:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806d68:	48 c7 05 4d 37 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2374d],0x0        # 42a4c0 <running_req>
  806d6f:	00 00 00 00 
    return ret;
  806d73:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806d76:	c9                   	leave  
  806d77:	c3                   	ret    

0000000000806d78 <chk_result>:
int chk_result(int r)
{
  806d78:	f3 0f 1e fa          	endbr64 
  806d7c:	55                   	push   rbp
  806d7d:	48 89 e5             	mov    rbp,rsp
  806d80:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  806d83:	90                   	nop
  806d84:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806d87:	48 63 d0             	movsxd rdx,eax
  806d8a:	48 89 d0             	mov    rax,rdx
  806d8d:	48 01 c0             	add    rax,rax
  806d90:	48 01 d0             	add    rax,rdx
  806d93:	48 c1 e0 04          	shl    rax,0x4
  806d97:	48 05 dc 77 42 00    	add    rax,0x4277dc
  806d9d:	8b 00                	mov    eax,DWORD PTR [rax]
  806d9f:	83 f8 03             	cmp    eax,0x3
  806da2:	75 e0                	jne    806d84 <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  806da4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806da7:	48 63 d0             	movsxd rdx,eax
  806daa:	48 89 d0             	mov    rax,rdx
  806dad:	48 01 c0             	add    rax,rax
  806db0:	48 01 d0             	add    rax,rdx
  806db3:	48 c1 e0 04          	shl    rax,0x4
  806db7:	48 05 e0 77 42 00    	add    rax,0x4277e0
  806dbd:	8b 00                	mov    eax,DWORD PTR [rax]
  806dbf:	83 f8 01             	cmp    eax,0x1
  806dc2:	0f 94 c0             	sete   al
  806dc5:	0f b6 c0             	movzx  eax,al
}
  806dc8:	5d                   	pop    rbp
  806dc9:	c3                   	ret    

0000000000806dca <disk_existent>:
int disk_existent(int disk)
{
  806dca:	f3 0f 1e fa          	endbr64 
  806dce:	55                   	push   rbp
  806dcf:	48 89 e5             	mov    rbp,rsp
  806dd2:	48 83 ec 10          	sub    rsp,0x10
  806dd6:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  806dd9:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  806ddd:	74 5f                	je     806e3e <disk_existent+0x74>
  806ddf:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  806de3:	7f 6e                	jg     806e53 <disk_existent+0x89>
  806de5:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  806de9:	74 3e                	je     806e29 <disk_existent+0x5f>
  806deb:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  806def:	7f 62                	jg     806e53 <disk_existent+0x89>
  806df1:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  806df5:	74 08                	je     806dff <disk_existent+0x35>
  806df7:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  806dfb:	74 17                	je     806e14 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  806dfd:	eb 54                	jmp    806e53 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  806dff:	bf b4 22 81 00       	mov    edi,0x8122b4
  806e04:	e8 44 c1 ff ff       	call   802f4d <sys_find_dev>
  806e09:	83 f8 ff             	cmp    eax,0xffffffff
  806e0c:	0f 95 c0             	setne  al
  806e0f:	0f b6 c0             	movzx  eax,al
  806e12:	eb 45                	jmp    806e59 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  806e14:	bf b8 22 81 00       	mov    edi,0x8122b8
  806e19:	e8 2f c1 ff ff       	call   802f4d <sys_find_dev>
  806e1e:	83 f8 ff             	cmp    eax,0xffffffff
  806e21:	0f 95 c0             	setne  al
  806e24:	0f b6 c0             	movzx  eax,al
  806e27:	eb 30                	jmp    806e59 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  806e29:	bf bc 22 81 00       	mov    edi,0x8122bc
  806e2e:	e8 1a c1 ff ff       	call   802f4d <sys_find_dev>
  806e33:	83 f8 ff             	cmp    eax,0xffffffff
  806e36:	0f 95 c0             	setne  al
  806e39:	0f b6 c0             	movzx  eax,al
  806e3c:	eb 1b                	jmp    806e59 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  806e3e:	bf c0 22 81 00       	mov    edi,0x8122c0
  806e43:	e8 05 c1 ff ff       	call   802f4d <sys_find_dev>
  806e48:	83 f8 ff             	cmp    eax,0xffffffff
  806e4b:	0f 95 c0             	setne  al
  806e4e:	0f b6 c0             	movzx  eax,al
  806e51:	eb 06                	jmp    806e59 <disk_existent+0x8f>
        break;
  806e53:	90                   	nop
    }
    return 0;
  806e54:	b8 00 00 00 00       	mov    eax,0x0
}
  806e59:	c9                   	leave  
  806e5a:	c3                   	ret    

0000000000806e5b <hd_iterate>:
int hd_iterate()
{
  806e5b:	f3 0f 1e fa          	endbr64 
  806e5f:	55                   	push   rbp
  806e60:	48 89 e5             	mov    rbp,rsp
  806e63:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  806e6a:	41 b8 00 00 00 00    	mov    r8d,0x0
  806e70:	b9 01 00 00 00       	mov    ecx,0x1
  806e75:	ba 00 00 00 00       	mov    edx,0x0
  806e7a:	be 02 00 00 00       	mov    esi,0x2
  806e7f:	bf 00 00 00 00       	mov    edi,0x0
  806e84:	e8 3b f8 ff ff       	call   8066c4 <request>
  806e89:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  806e8c:	41 b8 00 00 00 00    	mov    r8d,0x0
  806e92:	b9 01 00 00 00       	mov    ecx,0x1
  806e97:	ba 00 00 00 00       	mov    edx,0x0
  806e9c:	be 02 00 00 00       	mov    esi,0x2
  806ea1:	bf 01 00 00 00       	mov    edi,0x1
  806ea6:	e8 19 f8 ff ff       	call   8066c4 <request>
  806eab:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  806eae:	41 b8 00 00 00 00    	mov    r8d,0x0
  806eb4:	b9 01 00 00 00       	mov    ecx,0x1
  806eb9:	ba 00 00 00 00       	mov    edx,0x0
  806ebe:	be 02 00 00 00       	mov    esi,0x2
  806ec3:	bf 02 00 00 00       	mov    edi,0x2
  806ec8:	e8 f7 f7 ff ff       	call   8066c4 <request>
  806ecd:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  806ed0:	41 b8 00 00 00 00    	mov    r8d,0x0
  806ed6:	b9 01 00 00 00       	mov    ecx,0x1
  806edb:	ba 00 00 00 00       	mov    edx,0x0
  806ee0:	be 02 00 00 00       	mov    esi,0x2
  806ee5:	bf 03 00 00 00       	mov    edi,0x3
  806eea:	e8 d5 f7 ff ff       	call   8066c4 <request>
  806eef:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<4;i++)
  806ef2:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  806ef9:	e9 72 01 00 00       	jmp    807070 <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  806efe:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806f02:	74 3b                	je     806f3f <hd_iterate+0xe4>
  806f04:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  806f08:	7f 3e                	jg     806f48 <hd_iterate+0xed>
  806f0a:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806f0e:	74 26                	je     806f36 <hd_iterate+0xdb>
  806f10:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  806f14:	7f 32                	jg     806f48 <hd_iterate+0xed>
  806f16:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  806f1a:	74 08                	je     806f24 <hd_iterate+0xc9>
  806f1c:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  806f20:	74 0b                	je     806f2d <hd_iterate+0xd2>
  806f22:	eb 24                	jmp    806f48 <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  806f24:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  806f2b:	eb 25                	jmp    806f52 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  806f2d:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  806f34:	eb 1c                	jmp    806f52 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  806f36:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  806f3d:	eb 13                	jmp    806f52 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  806f3f:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  806f46:	eb 0a                	jmp    806f52 <hd_iterate+0xf7>
        default:
            return -1;
  806f48:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806f4d:	e9 28 01 00 00       	jmp    80707a <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  806f52:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806f55:	48 98                	cdqe   
  806f57:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  806f5b:	89 c7                	mov    edi,eax
  806f5d:	e8 16 fe ff ff       	call   806d78 <chk_result>
  806f62:	85 c0                	test   eax,eax
  806f64:	0f 84 81 00 00 00    	je     806feb <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  806f6a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806f6d:	89 c6                	mov    esi,eax
  806f6f:	bf c4 22 81 00       	mov    edi,0x8122c4
  806f74:	b8 00 00 00 00       	mov    eax,0x0
  806f79:	e8 31 9d ff ff       	call   800caf <printf>
            //新硬盘
            device hd={
  806f7e:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  806f85:	b8 00 00 00 00       	mov    eax,0x0
  806f8a:	b9 15 00 00 00       	mov    ecx,0x15
  806f8f:	48 89 d7             	mov    rdi,rdx
  806f92:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  806f95:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  806f98:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  806f9e:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  806fa5:	00 00 00 
  806fa8:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  806faf:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  806fb2:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  806fb6:	7f 07                	jg     806fbf <hd_iterate+0x164>
  806fb8:	b8 f0 01 00 00       	mov    eax,0x1f0
  806fbd:	eb 05                	jmp    806fc4 <hd_iterate+0x169>
  806fbf:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  806fc4:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  806fca:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  806fd1:	48 89 c7             	mov    rdi,rax
  806fd4:	e8 3c bb ff ff       	call   802b15 <reg_device>
  806fd9:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  806fdc:	48 63 d2             	movsxd rdx,edx
  806fdf:	89 04 95 e0 a4 42 00 	mov    DWORD PTR [rdx*4+0x42a4e0],eax
  806fe6:	e9 81 00 00 00       	jmp    80706c <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  806feb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806fee:	48 98                	cdqe   
  806ff0:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  806ff4:	89 c7                	mov    edi,eax
  806ff6:	e8 7d fd ff ff       	call   806d78 <chk_result>
  806ffb:	85 c0                	test   eax,eax
  806ffd:	75 6d                	jne    80706c <hd_iterate+0x211>
        {
            switch (i)
  806fff:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807003:	74 3e                	je     807043 <hd_iterate+0x1e8>
  807005:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807009:	7f 41                	jg     80704c <hd_iterate+0x1f1>
  80700b:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80700f:	74 28                	je     807039 <hd_iterate+0x1de>
  807011:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  807015:	7f 35                	jg     80704c <hd_iterate+0x1f1>
  807017:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80701b:	74 08                	je     807025 <hd_iterate+0x1ca>
  80701d:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  807021:	74 0c                	je     80702f <hd_iterate+0x1d4>
  807023:	eb 27                	jmp    80704c <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  807025:	48 c7 45 f8 b4 22 81 	mov    QWORD PTR [rbp-0x8],0x8122b4
  80702c:	00 
  80702d:	eb 1d                	jmp    80704c <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  80702f:	48 c7 45 f8 b8 22 81 	mov    QWORD PTR [rbp-0x8],0x8122b8
  807036:	00 
  807037:	eb 13                	jmp    80704c <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  807039:	48 c7 45 f8 bc 22 81 	mov    QWORD PTR [rbp-0x8],0x8122bc
  807040:	00 
  807041:	eb 09                	jmp    80704c <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  807043:	48 c7 45 f8 c0 22 81 	mov    QWORD PTR [rbp-0x8],0x8122c0
  80704a:	00 
  80704b:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  80704c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807050:	48 89 c7             	mov    rdi,rax
  807053:	e8 f5 be ff ff       	call   802f4d <sys_find_dev>
  807058:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  80705b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80705e:	89 c7                	mov    edi,eax
  807060:	e8 bc c5 ff ff       	call   803621 <get_dev>
  807065:	89 c7                	mov    edi,eax
  807067:	e8 08 c5 ff ff       	call   803574 <dispose_device>
    for(int i=0;i<4;i++)
  80706c:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  807070:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807074:	0f 8e 84 fe ff ff    	jle    806efe <hd_iterate+0xa3>
        }

    }
}
  80707a:	c9                   	leave  
  80707b:	c3                   	ret    

000000000080707c <async_check_disk>:

int async_check_disk(int disk)
{
  80707c:	f3 0f 1e fa          	endbr64 
  807080:	55                   	push   rbp
  807081:	48 89 e5             	mov    rbp,rsp
  807084:	48 83 ec 20          	sub    rsp,0x20
  807088:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  80708b:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  807091:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  807097:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  80709b:	74 06                	je     8070a3 <async_check_disk+0x27>
  80709d:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8070a1:	75 06                	jne    8070a9 <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  8070a3:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  8070a9:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  8070ad:	74 06                	je     8070b5 <async_check_disk+0x39>
  8070af:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  8070b3:	75 06                	jne    8070bb <async_check_disk+0x3f>
        chkcmd=0xf0;
  8070b5:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  8070bb:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8070bf:	83 c0 02             	add    eax,0x2
  8070c2:	0f b7 c0             	movzx  eax,ax
  8070c5:	be 01 00 00 00       	mov    esi,0x1
  8070ca:	89 c7                	mov    edi,eax
  8070cc:	e8 bf dd ff ff       	call   804e90 <outb>
    outb(disknr+3,0);
  8070d1:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8070d5:	83 c0 03             	add    eax,0x3
  8070d8:	0f b7 c0             	movzx  eax,ax
  8070db:	be 00 00 00 00       	mov    esi,0x0
  8070e0:	89 c7                	mov    edi,eax
  8070e2:	e8 a9 dd ff ff       	call   804e90 <outb>
    outb(disknr+4,0);
  8070e7:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8070eb:	83 c0 04             	add    eax,0x4
  8070ee:	0f b7 c0             	movzx  eax,ax
  8070f1:	be 00 00 00 00       	mov    esi,0x0
  8070f6:	89 c7                	mov    edi,eax
  8070f8:	e8 93 dd ff ff       	call   804e90 <outb>
    outb(disknr+5,0);
  8070fd:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807101:	83 c0 05             	add    eax,0x5
  807104:	0f b7 c0             	movzx  eax,ax
  807107:	be 00 00 00 00       	mov    esi,0x0
  80710c:	89 c7                	mov    edi,eax
  80710e:	e8 7d dd ff ff       	call   804e90 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  807113:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  807117:	0f b6 d0             	movzx  edx,al
  80711a:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80711e:	83 c0 06             	add    eax,0x6
  807121:	0f b7 c0             	movzx  eax,ax
  807124:	89 d6                	mov    esi,edx
  807126:	89 c7                	mov    edi,eax
  807128:	e8 63 dd ff ff       	call   804e90 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  80712d:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807131:	83 c0 07             	add    eax,0x7
  807134:	0f b7 c0             	movzx  eax,ax
  807137:	be 90 00 00 00       	mov    esi,0x90
  80713c:	89 c7                	mov    edi,eax
  80713e:	e8 4d dd ff ff       	call   804e90 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  807143:	b8 00 00 00 00       	mov    eax,0x0
}
  807148:	c9                   	leave  
  807149:	c3                   	ret    

000000000080714a <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  80714a:	f3 0f 1e fa          	endbr64 
  80714e:	55                   	push   rbp
  80714f:	48 89 e5             	mov    rbp,rsp
  807152:	48 83 ec 18          	sub    rsp,0x18
  807156:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  80715a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  807161:	eb 04                	jmp    807167 <hd_do_req+0x1d>
  807163:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807167:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80716a:	48 98                	cdqe   
  80716c:	8b 14 85 e0 a4 42 00 	mov    edx,DWORD PTR [rax*4+0x42a4e0]
  807173:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807177:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  80717d:	39 c2                	cmp    edx,eax
  80717f:	75 e2                	jne    807163 <hd_do_req+0x19>
    switch (args->cmd)
  807181:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807185:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80718b:	83 f8 04             	cmp    eax,0x4
  80718e:	74 72                	je     807202 <hd_do_req+0xb8>
  807190:	83 f8 04             	cmp    eax,0x4
  807193:	0f 8f 96 00 00 00    	jg     80722f <hd_do_req+0xe5>
  807199:	83 f8 02             	cmp    eax,0x2
  80719c:	74 0a                	je     8071a8 <hd_do_req+0x5e>
  80719e:	83 f8 03             	cmp    eax,0x3
  8071a1:	74 32                	je     8071d5 <hd_do_req+0x8b>
  8071a3:	e9 87 00 00 00       	jmp    80722f <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  8071a8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8071ac:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8071af:	48 98                	cdqe   
  8071b1:	48 89 c6             	mov    rsi,rax
  8071b4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8071b8:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8071bb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8071bf:	8b 10                	mov    edx,DWORD PTR [rax]
  8071c1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8071c4:	49 89 f0             	mov    r8,rsi
  8071c7:	be 00 00 00 00       	mov    esi,0x0
  8071cc:	89 c7                	mov    edi,eax
  8071ce:	e8 f1 f4 ff ff       	call   8066c4 <request>
        break;
  8071d3:	eb 61                	jmp    807236 <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  8071d5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8071d9:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8071dc:	48 98                	cdqe   
  8071de:	48 89 c6             	mov    rsi,rax
  8071e1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8071e5:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8071e8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8071ec:	8b 10                	mov    edx,DWORD PTR [rax]
  8071ee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8071f1:	49 89 f0             	mov    r8,rsi
  8071f4:	be 01 00 00 00       	mov    esi,0x1
  8071f9:	89 c7                	mov    edi,eax
  8071fb:	e8 c4 f4 ff ff       	call   8066c4 <request>
        break;
  807200:	eb 34                	jmp    807236 <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  807202:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807206:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807209:	48 98                	cdqe   
  80720b:	48 89 c6             	mov    rsi,rax
  80720e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807212:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  807215:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807219:	8b 10                	mov    edx,DWORD PTR [rax]
  80721b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80721e:	49 89 f0             	mov    r8,rsi
  807221:	be 02 00 00 00       	mov    esi,0x2
  807226:	89 c7                	mov    edi,eax
  807228:	e8 97 f4 ff ff       	call   8066c4 <request>
        break;
  80722d:	eb 07                	jmp    807236 <hd_do_req+0xec>
    default:return -1;
  80722f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807234:	eb 1e                	jmp    807254 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  807236:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80723a:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  807241:	00 00 00 
    running_devman_req=args;
  807244:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807248:	48 89 05 79 32 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23279],rax        # 42a4c8 <running_devman_req>
    return 0;
  80724f:	b8 00 00 00 00       	mov    eax,0x0
  807254:	c9                   	leave  
  807255:	c3                   	ret    
  807256:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  80725d:	00 00 00 

0000000000807260 <disk_int_handler>:
  807260:	e8 59 dc ff ff       	call   804ebe <eoi>
  807265:	e8 6b f2 ff ff       	call   8064d5 <disk_int_handler_c>
  80726a:	48 cf                	iretq  

000000000080726c <read_disk_asm>:
  80726c:	55                   	push   rbp
  80726d:	89 e5                	mov    ebp,esp
  80726f:	66 ba f7 01          	mov    dx,0x1f7
  807273:	31 c9                	xor    ecx,ecx
  807275:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  80727a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80727f:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  807284:	89 c6                	mov    esi,eax
  807286:	66 ba f2 01          	mov    dx,0x1f2
  80728a:	88 c8                	mov    al,cl
  80728c:	ee                   	out    dx,al
  80728d:	66 ba f3 01          	mov    dx,0x1f3
  807291:	89 f0                	mov    eax,esi
  807293:	ee                   	out    dx,al
  807294:	66 ff c2             	inc    dx
  807297:	c1 e8 08             	shr    eax,0x8
  80729a:	ee                   	out    dx,al
  80729b:	66 ff c2             	inc    dx
  80729e:	c1 e8 08             	shr    eax,0x8
  8072a1:	ee                   	out    dx,al
  8072a2:	66 ff c2             	inc    dx
  8072a5:	66 c1 e8 08          	shr    ax,0x8
  8072a9:	24 0f                	and    al,0xf
  8072ab:	0c e0                	or     al,0xe0
  8072ad:	ee                   	out    dx,al
  8072ae:	66 ff c2             	inc    dx
  8072b1:	b0 20                	mov    al,0x20
  8072b3:	ee                   	out    dx,al

00000000008072b4 <read_disk_asm.wait>:
  8072b4:	90                   	nop
  8072b5:	ec                   	in     al,dx
  8072b6:	24 88                	and    al,0x88
  8072b8:	3c 08                	cmp    al,0x8
  8072ba:	75 f8                	jne    8072b4 <read_disk_asm.wait>
  8072bc:	66 89 d7             	mov    di,dx
  8072bf:	89 c8                	mov    eax,ecx
  8072c1:	66 b9 00 01          	mov    cx,0x100
  8072c5:	66 f7 e1             	mul    cx
  8072c8:	89 c1                	mov    ecx,eax
  8072ca:	66 ba f0 01          	mov    dx,0x1f0

00000000008072ce <read_disk_asm.read>:
  8072ce:	66 ed                	in     ax,dx
  8072d0:	66 67 89 03          	mov    WORD PTR [ebx],ax
  8072d4:	83 c3 02             	add    ebx,0x2
  8072d7:	e2 f5                	loop   8072ce <read_disk_asm.read>
  8072d9:	c9                   	leave  
  8072da:	b8 00 00 00 00       	mov    eax,0x0
  8072df:	c3                   	ret    

00000000008072e0 <read_disk_asm.err_disk_reading>:
  8072e0:	66 ba f1 01          	mov    dx,0x1f1
  8072e4:	31 c0                	xor    eax,eax
  8072e6:	66 ed                	in     ax,dx
  8072e8:	89 ec                	mov    esp,ebp
  8072ea:	5d                   	pop    rbp
  8072eb:	c3                   	ret    

00000000008072ec <write_disk_asm>:
  8072ec:	55                   	push   rbp
  8072ed:	89 e5                	mov    ebp,esp
  8072ef:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  8072f4:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  8072f9:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  8072fe:	50                   	push   rax
  8072ff:	66 ba f2 01          	mov    dx,0x1f2
  807303:	88 c8                	mov    al,cl
  807305:	ee                   	out    dx,al
  807306:	58                   	pop    rax
  807307:	66 ba f3 01          	mov    dx,0x1f3
  80730b:	ee                   	out    dx,al
  80730c:	c1 e8 08             	shr    eax,0x8
  80730f:	66 ba f4 01          	mov    dx,0x1f4
  807313:	ee                   	out    dx,al
  807314:	c1 e8 08             	shr    eax,0x8
  807317:	66 ba f5 01          	mov    dx,0x1f5
  80731b:	ee                   	out    dx,al
  80731c:	c1 e8 08             	shr    eax,0x8
  80731f:	24 0f                	and    al,0xf
  807321:	0c e0                	or     al,0xe0
  807323:	66 ba f6 01          	mov    dx,0x1f6
  807327:	ee                   	out    dx,al
  807328:	66 ba f7 01          	mov    dx,0x1f7
  80732c:	b0 30                	mov    al,0x30
  80732e:	ee                   	out    dx,al

000000000080732f <write_disk_asm.not_ready2>:
  80732f:	90                   	nop
  807330:	ec                   	in     al,dx
  807331:	24 88                	and    al,0x88
  807333:	3c 08                	cmp    al,0x8
  807335:	75 f8                	jne    80732f <write_disk_asm.not_ready2>
  807337:	89 c8                	mov    eax,ecx
  807339:	66 b9 00 01          	mov    cx,0x100
  80733d:	66 f7 e1             	mul    cx
  807340:	89 c1                	mov    ecx,eax
  807342:	66 ba f0 01          	mov    dx,0x1f0

0000000000807346 <write_disk_asm.go_on_write>:
  807346:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  80734a:	66 ef                	out    dx,ax
  80734c:	83 c3 02             	add    ebx,0x2
  80734f:	e2 f5                	loop   807346 <write_disk_asm.go_on_write>
  807351:	89 ec                	mov    esp,ebp
  807353:	5d                   	pop    rbp
  807354:	c3                   	ret    

0000000000807355 <init_fat16>:

int fat16_drvi;
extern driver drv_disk;
extern int disk_drvi;
int init_fat16()
{
  807355:	f3 0f 1e fa          	endbr64 
  807359:	55                   	push   rbp
  80735a:	48 89 e5             	mov    rbp,rsp
  80735d:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
    reg_device(&fat16_dev);
  807364:	bf 80 23 81 00       	mov    edi,0x812380
  807369:	e8 a7 b7 ff ff       	call   802b15 <reg_device>
    fat16_drvi=reg_driver(&fat16_drv);
  80736e:	bf e0 22 81 00       	mov    edi,0x8122e0
  807373:	e8 85 ba ff ff       	call   802dfd <reg_driver>
  807378:	89 05 e6 b3 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2b3e6],eax        # 432764 <fat16_drvi>
    driver_args arg;
    load(&arg);//syscall(SYSCALL_CALL_DRVFUNC,fat16_drvi,DRVF_OPEN,&arg,0,0);
  80737e:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  807385:	48 89 c7             	mov    rdi,rax
  807388:	e8 26 00 00 00       	call   8073b3 <load>
    reg_vol(disk_drvi,fat16_drvi,"a");
  80738d:	8b 0d d1 b3 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc2b3d1]        # 432764 <fat16_drvi>
  807393:	8b 05 37 31 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23137]        # 42a4d0 <disk_drvi>
  807399:	ba 28 24 81 00       	mov    edx,0x812428
  80739e:	89 ce                	mov    esi,ecx
  8073a0:	89 c7                	mov    edi,eax
  8073a2:	b8 00 00 00 00       	mov    eax,0x0
  8073a7:	e8 f1 a6 ff ff       	call   801a9d <reg_vol>
    return 0;
  8073ac:	b8 00 00 00 00       	mov    eax,0x0
}
  8073b1:	c9                   	leave  
  8073b2:	c3                   	ret    

00000000008073b3 <load>:
int load(driver_args *args)
{
  8073b3:	f3 0f 1e fa          	endbr64 
  8073b7:	55                   	push   rbp
  8073b8:	48 89 e5             	mov    rbp,rsp
  8073bb:	48 83 ec 20          	sub    rsp,0x20
  8073bf:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    //sys_read superblock
    int req_id=-1;
  8073c3:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    read_sec(&superblock,0,1);
  8073ca:	ba 01 00 00 00       	mov    edx,0x1
  8073cf:	be 00 00 00 00       	mov    esi,0x0
  8073d4:	bf 00 a5 42 00       	mov    edi,0x42a500
  8073d9:	e8 61 0b 00 00       	call   807f3f <read_sec>
    //只能一个一个读
    read_sec(fat,superblock.rsvdSec,superblock.secPerFAT);
  8073de:	0f b7 05 31 31 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc23131]        # 42a516 <superblock+0x16>
  8073e5:	0f b7 d0             	movzx  edx,ax
  8073e8:	0f b7 05 1f 31 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2311f]        # 42a50e <superblock+0xe>
  8073ef:	0f b7 c0             	movzx  eax,ax
  8073f2:	89 c6                	mov    esi,eax
  8073f4:	bf 60 e7 42 00       	mov    edi,0x42e760
  8073f9:	e8 41 0b 00 00       	call   807f3f <read_sec>

    //sys_read root
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  8073fe:	0f b7 05 09 31 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc23109]        # 42a50e <superblock+0xe>
  807405:	0f b7 c8             	movzx  ecx,ax
  807408:	0f b7 05 07 31 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc23107]        # 42a516 <superblock+0x16>
  80740f:	0f b7 d0             	movzx  edx,ax
    superblock.numOfFAT;
  807412:	0f b6 05 f7 30 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc230f7]        # 42a510 <superblock+0x10>
  807419:	0f b6 c0             	movzx  eax,al
    int root_sec_num=superblock.rsvdSec+superblock.secPerFAT*\
  80741c:	0f af c2             	imul   eax,edx
  80741f:	01 c8                	add    eax,ecx
  807421:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //printf("root sec num:%d\n",root_sec_num);
    //usually a root dir has 32 secs
    int root_sec_c=((u32)superblock.rootEntries* sizeof(dir_entry))/(u32)superblock.bytesPerSec;
  807424:	0f b7 05 e6 30 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc230e6]        # 42a511 <superblock+0x11>
  80742b:	0f b7 c0             	movzx  eax,ax
  80742e:	48 c1 e0 05          	shl    rax,0x5
  807432:	0f b7 15 d2 30 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc230d2]        # 42a50b <superblock+0xb>
  807439:	0f b7 ca             	movzx  ecx,dx
  80743c:	ba 00 00 00 00       	mov    edx,0x0
  807441:	48 f7 f1             	div    rcx
  807444:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    read_sec(root_dir,root_sec_num,root_sec_c);
  807447:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80744a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80744d:	89 c6                	mov    esi,eax
  80744f:	bf 40 a5 42 00       	mov    edi,0x42a540
  807454:	e8 e6 0a 00 00       	call   807f3f <read_sec>

    cur_dir.fistCluNum=0;
  807459:	66 c7 05 f8 70 c2 ff 	mov    WORD PTR [rip+0xffffffffffc270f8],0x0        # 42e55a <cur_dir+0x1a>
  807460:	00 00 

    //set some vars
    //why? because the .bss won't be packed into bin so any init
    //of global var in .c is meaningless.
    clu_sec_balance=superblock.rsvdSec+32+32-2;//63;
  807462:	0f b7 05 a5 30 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc230a5]        # 42a50e <superblock+0xe>
  807469:	0f b7 c0             	movzx  eax,ax
  80746c:	83 c0 3e             	add    eax,0x3e
  80746f:	89 05 4b 31 00 00    	mov    DWORD PTR [rip+0x314b],eax        # 80a5c0 <clu_sec_balance>
    //printf("clu sec bal:%d\n",clu_sec_balance);
    dir_depth=0;
  807475:	c7 05 e1 b2 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2b2e1],0x0        # 432760 <dir_depth>
  80747c:	00 00 00 
    return 0;
  80747f:	b8 00 00 00 00       	mov    eax,0x0

}
  807484:	c9                   	leave  
  807485:	c3                   	ret    

0000000000807486 <verify_name>:

//检查输入的文件名长度是否合法，以及是否出现非法字符（但是不检查大小写和.）
//返回值为布尔值。
int verify_name(char *str)
{
  807486:	f3 0f 1e fa          	endbr64 
  80748a:	55                   	push   rbp
  80748b:	48 89 e5             	mov    rbp,rsp
  80748e:	48 83 ec 70          	sub    rsp,0x70
  807492:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
    char valid_ch[]="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789,/![]|+";
  807496:	48 b8 61 62 63 64 65 	movabs rax,0x6867666564636261
  80749d:	66 67 68 
  8074a0:	48 ba 69 6a 6b 6c 6d 	movabs rdx,0x706f6e6d6c6b6a69
  8074a7:	6e 6f 70 
  8074aa:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  8074ae:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  8074b2:	48 b8 71 72 73 74 75 	movabs rax,0x7877767574737271
  8074b9:	76 77 78 
  8074bc:	48 ba 79 7a 41 42 43 	movabs rdx,0x4645444342417a79
  8074c3:	44 45 46 
  8074c6:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  8074ca:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  8074ce:	48 b8 47 48 49 4a 4b 	movabs rax,0x4e4d4c4b4a494847
  8074d5:	4c 4d 4e 
  8074d8:	48 ba 4f 50 51 52 53 	movabs rdx,0x565554535251504f
  8074df:	54 55 56 
  8074e2:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  8074e6:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  8074ea:	48 b8 57 58 59 5a 30 	movabs rax,0x333231305a595857
  8074f1:	31 32 33 
  8074f4:	48 ba 34 35 36 37 38 	movabs rdx,0x2f2c393837363534
  8074fb:	39 2c 2f 
  8074fe:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
  807502:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  807506:	c7 45 e0 21 5b 5d 7c 	mov    DWORD PTR [rbp-0x20],0x7c5d5b21
  80750d:	66 c7 45 e4 2b 00    	mov    WORD PTR [rbp-0x1c],0x2b
    if(strlen(str)>11||strlen(str)==0) {
  807513:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807517:	48 89 c7             	mov    rdi,rax
  80751a:	e8 24 28 00 00       	call   809d43 <strlen>
  80751f:	83 f8 0b             	cmp    eax,0xb
  807522:	7f 10                	jg     807534 <verify_name+0xae>
  807524:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807528:	48 89 c7             	mov    rdi,rax
  80752b:	e8 13 28 00 00       	call   809d43 <strlen>
  807530:	85 c0                	test   eax,eax
  807532:	75 0a                	jne    80753e <verify_name+0xb8>
        //printf("length not valid\n");
        return 0;
  807534:	b8 00 00 00 00       	mov    eax,0x0
  807539:	e9 b3 01 00 00       	jmp    8076f1 <verify_name+0x26b>
    }
    int c=0,i=0,flag=0,vchf=1;
  80753e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807545:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  80754c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  807553:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [rbp-0x18],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  80755a:	eb 6b                	jmp    8075c7 <verify_name+0x141>
    {
        int j=0;
  80755c:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        for(;j<sizeof(valid_ch);j++)
  807563:	eb 22                	jmp    807587 <verify_name+0x101>
            if(str[i]==valid_ch[j])break;
  807565:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807568:	48 63 d0             	movsxd rdx,eax
  80756b:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80756f:	48 01 d0             	add    rax,rdx
  807572:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  807575:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  807578:	48 98                	cdqe   
  80757a:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  80757f:	38 c2                	cmp    dl,al
  807581:	74 0e                	je     807591 <verify_name+0x10b>
        for(;j<sizeof(valid_ch);j++)
  807583:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  807587:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  80758a:	83 f8 45             	cmp    eax,0x45
  80758d:	76 d6                	jbe    807565 <verify_name+0xdf>
  80758f:	eb 01                	jmp    807592 <verify_name+0x10c>
            if(str[i]==valid_ch[j])break;
  807591:	90                   	nop
        if(j>=sizeof(valid_ch))
  807592:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  807595:	83 f8 45             	cmp    eax,0x45
  807598:	76 0a                	jbe    8075a4 <verify_name+0x11e>
        {
            //printf("invalid char\n");
            return 0;//出现非法字符
  80759a:	b8 00 00 00 00       	mov    eax,0x0
  80759f:	e9 4d 01 00 00       	jmp    8076f1 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  8075a4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8075a7:	48 63 d0             	movsxd rdx,eax
  8075aa:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8075ae:	48 01 d0             	add    rax,rdx
  8075b1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8075b4:	3c 20                	cmp    al,0x20
  8075b6:	74 07                	je     8075bf <verify_name+0x139>
  8075b8:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        c++;
  8075bf:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(;str[i]!='.'&&str[i]!='\0';i++)
  8075c3:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8075c7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8075ca:	48 63 d0             	movsxd rdx,eax
  8075cd:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8075d1:	48 01 d0             	add    rax,rdx
  8075d4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8075d7:	3c 2e                	cmp    al,0x2e
  8075d9:	74 18                	je     8075f3 <verify_name+0x16d>
  8075db:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8075de:	48 63 d0             	movsxd rdx,eax
  8075e1:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8075e5:	48 01 d0             	add    rax,rdx
  8075e8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8075eb:	84 c0                	test   al,al
  8075ed:	0f 85 69 ff ff ff    	jne    80755c <verify_name+0xd6>
    }
    if(c>8||flag==0){
  8075f3:	83 7d fc 08          	cmp    DWORD PTR [rbp-0x4],0x8
  8075f7:	7f 06                	jg     8075ff <verify_name+0x179>
  8075f9:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8075fd:	75 0a                	jne    807609 <verify_name+0x183>
        //printf("file name blank\n");
        return 0;//不能全是空格
  8075ff:	b8 00 00 00 00       	mov    eax,0x0
  807604:	e9 e8 00 00 00       	jmp    8076f1 <verify_name+0x26b>
    }
    if(str[i]=='\0')//没有扩展名
  807609:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80760c:	48 63 d0             	movsxd rdx,eax
  80760f:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807613:	48 01 d0             	add    rax,rdx
  807616:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807619:	84 c0                	test   al,al
  80761b:	75 0a                	jne    807627 <verify_name+0x1a1>
        return 1;
  80761d:	b8 01 00 00 00       	mov    eax,0x1
  807622:	e9 ca 00 00 00       	jmp    8076f1 <verify_name+0x26b>
    c=0;
  807627:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    flag=0;
  80762e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(i++;str[i]!='\0';i++)
  807635:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807639:	e9 83 00 00 00       	jmp    8076c1 <verify_name+0x23b>
    {
        int j=0;
  80763e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
        for(;j<sizeof(valid_ch);j++)
  807645:	eb 22                	jmp    807669 <verify_name+0x1e3>
            if(str[i]==valid_ch[j])break;
  807647:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80764a:	48 63 d0             	movsxd rdx,eax
  80764d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807651:	48 01 d0             	add    rax,rdx
  807654:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  807657:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80765a:	48 98                	cdqe   
  80765c:	0f b6 44 05 a0       	movzx  eax,BYTE PTR [rbp+rax*1-0x60]
  807661:	38 c2                	cmp    dl,al
  807663:	74 0e                	je     807673 <verify_name+0x1ed>
        for(;j<sizeof(valid_ch);j++)
  807665:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  807669:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80766c:	83 f8 45             	cmp    eax,0x45
  80766f:	76 d6                	jbe    807647 <verify_name+0x1c1>
  807671:	eb 01                	jmp    807674 <verify_name+0x1ee>
            if(str[i]==valid_ch[j])break;
  807673:	90                   	nop
        if(j>=sizeof(valid_ch)){
  807674:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807677:	83 f8 45             	cmp    eax,0x45
  80767a:	76 07                	jbe    807683 <verify_name+0x1fd>
            //printf("invalid char:%x\n",str[i]);
            return 0;//出现非法字符
  80767c:	b8 00 00 00 00       	mov    eax,0x0
  807681:	eb 6e                	jmp    8076f1 <verify_name+0x26b>
        }
        if(str[i]!=' ')flag=1;
  807683:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807686:	48 63 d0             	movsxd rdx,eax
  807689:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80768d:	48 01 d0             	add    rax,rdx
  807690:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807693:	3c 20                	cmp    al,0x20
  807695:	74 07                	je     80769e <verify_name+0x218>
  807697:	c7 45 f4 01 00 00 00 	mov    DWORD PTR [rbp-0xc],0x1
        if(str[i]=='.'){
  80769e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8076a1:	48 63 d0             	movsxd rdx,eax
  8076a4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8076a8:	48 01 d0             	add    rax,rdx
  8076ab:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8076ae:	3c 2e                	cmp    al,0x2e
  8076b0:	75 07                	jne    8076b9 <verify_name+0x233>
            //printf("multiple dots.");
            return 0;//不能多次出现.
  8076b2:	b8 00 00 00 00       	mov    eax,0x0
  8076b7:	eb 38                	jmp    8076f1 <verify_name+0x26b>
        }
        c++;
  8076b9:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    for(i++;str[i]!='\0';i++)
  8076bd:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8076c1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8076c4:	48 63 d0             	movsxd rdx,eax
  8076c7:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8076cb:	48 01 d0             	add    rax,rdx
  8076ce:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8076d1:	84 c0                	test   al,al
  8076d3:	0f 85 65 ff ff ff    	jne    80763e <verify_name+0x1b8>
    }
    if(c>3||flag==0){
  8076d9:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  8076dd:	7f 06                	jg     8076e5 <verify_name+0x25f>
  8076df:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8076e3:	75 07                	jne    8076ec <verify_name+0x266>
        //printf("file name blank\n");
        return 0;//不能全是空格
  8076e5:	b8 00 00 00 00       	mov    eax,0x0
  8076ea:	eb 05                	jmp    8076f1 <verify_name+0x26b>
    }
    return 1;
  8076ec:	b8 01 00 00 00       	mov    eax,0x1
}
  8076f1:	c9                   	leave  
  8076f2:	c3                   	ret    

00000000008076f3 <format_name>:
//将“aaa.bb”的文件名形式转换为可以直接strcmp(,,11)的形式。
//默认文件名合法，请先检查文件名再使用。
void format_name(char *str)
{
  8076f3:	f3 0f 1e fa          	endbr64 
  8076f7:	55                   	push   rbp
  8076f8:	48 89 e5             	mov    rbp,rsp
  8076fb:	48 83 ec 30          	sub    rsp,0x30
  8076ff:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char v[12]="           ";
  807703:	48 b8 20 20 20 20 20 	movabs rax,0x2020202020202020
  80770a:	20 20 20 
  80770d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  807711:	c7 45 f0 20 20 20 00 	mov    DWORD PTR [rbp-0x10],0x202020
    int ptr=0;
  807718:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    int namelen=0;
  80771f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    for(int i=0;str[i]!='\0';i++)
  807726:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80772d:	e9 9b 00 00 00       	jmp    8077cd <format_name+0xda>
    {
        if(str[i]>='a'&&str[i]<='z')
  807732:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807735:	48 63 d0             	movsxd rdx,eax
  807738:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80773c:	48 01 d0             	add    rax,rdx
  80773f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807742:	3c 60                	cmp    al,0x60
  807744:	7e 3e                	jle    807784 <format_name+0x91>
  807746:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807749:	48 63 d0             	movsxd rdx,eax
  80774c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807750:	48 01 d0             	add    rax,rdx
  807753:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807756:	3c 7a                	cmp    al,0x7a
  807758:	7f 2a                	jg     807784 <format_name+0x91>
        {
            v[ptr++]=str[i]-'a'+'A';
  80775a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80775d:	48 63 d0             	movsxd rdx,eax
  807760:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  807764:	48 01 d0             	add    rax,rdx
  807767:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80776a:	8d 48 e0             	lea    ecx,[rax-0x20]
  80776d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807770:	8d 50 01             	lea    edx,[rax+0x1]
  807773:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  807776:	89 ca                	mov    edx,ecx
  807778:	48 98                	cdqe   
  80777a:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  80777e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807782:	eb 45                	jmp    8077c9 <format_name+0xd6>
        }
        else if(str[i]=='.')
  807784:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  807787:	48 63 d0             	movsxd rdx,eax
  80778a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80778e:	48 01 d0             	add    rax,rdx
  807791:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807794:	3c 2e                	cmp    al,0x2e
  807796:	75 0d                	jne    8077a5 <format_name+0xb2>
        {
            ptr+=(8-namelen);
  807798:	b8 08 00 00 00       	mov    eax,0x8
  80779d:	2b 45 f8             	sub    eax,DWORD PTR [rbp-0x8]
  8077a0:	01 45 fc             	add    DWORD PTR [rbp-0x4],eax
  8077a3:	eb 24                	jmp    8077c9 <format_name+0xd6>
        }else
        {
            v[ptr++]=str[i];
  8077a5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8077a8:	48 63 d0             	movsxd rdx,eax
  8077ab:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8077af:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  8077b3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8077b6:	8d 50 01             	lea    edx,[rax+0x1]
  8077b9:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  8077bc:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
  8077bf:	48 98                	cdqe   
  8077c1:	88 54 05 e8          	mov    BYTE PTR [rbp+rax*1-0x18],dl
            namelen++;
  8077c5:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
    for(int i=0;str[i]!='\0';i++)
  8077c9:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8077cd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8077d0:	48 63 d0             	movsxd rdx,eax
  8077d3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8077d7:	48 01 d0             	add    rax,rdx
  8077da:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8077dd:	84 c0                	test   al,al
  8077df:	0f 85 4d ff ff ff    	jne    807732 <format_name+0x3f>
        }
    }
    v[12]='\0';
  8077e5:	c6 45 f4 00          	mov    BYTE PTR [rbp-0xc],0x0
    strcpy(str,v);
  8077e9:	48 8d 55 e8          	lea    rdx,[rbp-0x18]
  8077ed:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8077f1:	48 89 d6             	mov    rsi,rdx
  8077f4:	48 89 c7             	mov    rdi,rax
  8077f7:	e8 28 23 00 00       	call   809b24 <strcpy>
}
  8077fc:	90                   	nop
  8077fd:	c9                   	leave  
  8077fe:	c3                   	ret    

00000000008077ff <req_cluster>:
int req_cluster()
{
  8077ff:	f3 0f 1e fa          	endbr64 
  807803:	55                   	push   rbp
  807804:	48 89 e5             	mov    rbp,rsp
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  807807:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [rbp-0x4],0x3
  80780e:	eb 2a                	jmp    80783a <req_cluster+0x3b>
    {
        if(fat[i]==0)
  807810:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807813:	48 98                	cdqe   
  807815:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  80781c:	00 
  80781d:	66 85 c0             	test   ax,ax
  807820:	75 14                	jne    807836 <req_cluster+0x37>
        {
            fat[i]=0xffff;
  807822:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807825:	48 98                	cdqe   
  807827:	66 c7 84 00 60 e7 42 	mov    WORD PTR [rax+rax*1+0x42e760],0xffff
  80782e:	00 ff ff 
            return i;
  807831:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807834:	eb 13                	jmp    807849 <req_cluster+0x4a>
    for(int i=3;i<sizeof(fat)/sizeof(short);i++)
  807836:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80783a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80783d:	3d ff 1f 00 00       	cmp    eax,0x1fff
  807842:	76 cc                	jbe    807810 <req_cluster+0x11>
        }
    }
    return -1;
  807844:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  807849:	5d                   	pop    rbp
  80784a:	c3                   	ret    

000000000080784b <write_sec>:
int write_sec(char *src, int sec_num, int sec_c)
{
  80784b:	f3 0f 1e fa          	endbr64 
  80784f:	55                   	push   rbp
  807850:	48 89 e5             	mov    rbp,rsp
  807853:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
  80785a:	48 89 bd 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rdi
  807861:	89 b5 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],esi
  807867:	89 95 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],edx
    driver_args arg={
  80786d:	48 8d 95 40 ff ff ff 	lea    rdx,[rbp-0xc0]
  807874:	b8 00 00 00 00       	mov    eax,0x0
  807879:	b9 18 00 00 00       	mov    ecx,0x18
  80787e:	48 89 d7             	mov    rdi,rdx
  807881:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  807884:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  80788b:	89 85 48 ff ff ff    	mov    DWORD PTR [rbp-0xb8],eax
  807891:	8b 85 34 ff ff ff    	mov    eax,DWORD PTR [rbp-0xcc]
  807897:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
  80789d:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  8078a3:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            .src_addr=src,
            .sec_n=sec_num,
            .sec_c=sec_c
    };
    return drv_disk.read(&arg);
  8078a9:	48 8b 15 88 2c 00 00 	mov    rdx,QWORD PTR [rip+0x2c88]        # 80a538 <drv_disk+0x18>
  8078b0:	48 8d 85 40 ff ff ff 	lea    rax,[rbp-0xc0]
  8078b7:	48 89 c7             	mov    rdi,rax
  8078ba:	ff d2                	call   rdx
}
  8078bc:	c9                   	leave  
  8078bd:	c3                   	ret    

00000000008078be <set_attr>:
void set_attr(dir_entry *f,char attr)
{
  8078be:	f3 0f 1e fa          	endbr64 
  8078c2:	55                   	push   rbp
  8078c3:	48 89 e5             	mov    rbp,rsp
  8078c6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8078ca:	89 f0                	mov    eax,esi
  8078cc:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    f->attr|=attr;
  8078cf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8078d3:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8078d7:	0a 45 f4             	or     al,BYTE PTR [rbp-0xc]
  8078da:	89 c2                	mov    edx,eax
  8078dc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8078e0:	88 50 0b             	mov    BYTE PTR [rax+0xb],dl
}
  8078e3:	90                   	nop
  8078e4:	5d                   	pop    rbp
  8078e5:	c3                   	ret    

00000000008078e6 <update_fat_and_root>:
mkdir
touch
rm
*/
void update_fat_and_root()
{
  8078e6:	f3 0f 1e fa          	endbr64 
  8078ea:	55                   	push   rbp
  8078eb:	48 89 e5             	mov    rbp,rsp
  8078ee:	48 83 ec 10          	sub    rsp,0x10
    int root_loc=superblock.rsvdSec+\
  8078f2:	0f b7 05 15 2c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22c15]        # 42a50e <superblock+0xe>
  8078f9:	0f b7 c8             	movzx  ecx,ax
    superblock.secPerFAT*superblock.numOfFAT;
  8078fc:	0f b7 05 13 2c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22c13]        # 42a516 <superblock+0x16>
  807903:	0f b7 d0             	movzx  edx,ax
  807906:	0f b6 05 03 2c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22c03]        # 42a510 <superblock+0x10>
  80790d:	0f b6 c0             	movzx  eax,al
  807910:	0f af c2             	imul   eax,edx
    int root_loc=superblock.rsvdSec+\
  807913:	01 c8                	add    eax,ecx
  807915:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("root_loc:0x%x\n",root_loc);
    write_sec(root_dir,root_loc,sizeof(root_dir));
  807918:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80791b:	ba 00 40 00 00       	mov    edx,0x4000
  807920:	89 c6                	mov    esi,eax
  807922:	bf 40 a5 42 00       	mov    edi,0x42a540
  807927:	e8 1f ff ff ff       	call   80784b <write_sec>
    //printf("updated root\n");
    write_sec(fat,superblock.rsvdSec,sizeof(fat));
  80792c:	0f b7 05 db 2b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22bdb]        # 42a50e <superblock+0xe>
  807933:	0f b7 c0             	movzx  eax,ax
  807936:	ba 00 40 00 00       	mov    edx,0x4000
  80793b:	89 c6                	mov    esi,eax
  80793d:	bf 60 e7 42 00       	mov    edi,0x42e760
  807942:	e8 04 ff ff ff       	call   80784b <write_sec>
    //printf("updated fat\n");

}
  807947:	90                   	nop
  807948:	c9                   	leave  
  807949:	c3                   	ret    

000000000080794a <add_dot_and_ddot_dir>:
void add_dot_and_ddot_dir(dir_entry dir)
{
  80794a:	f3 0f 1e fa          	endbr64 
  80794e:	55                   	push   rbp
  80794f:	48 89 e5             	mov    rbp,rsp
  807952:	48 83 ec 10          	sub    rsp,0x10
    //it must be a regular dir to add. and ..
    //and this must be done when the dir is created
    //regular dir
    int cluster = dir.fistCluNum;
  807956:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  80795a:	0f b7 c0             	movzx  eax,ax
  80795d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
    superblock.secPerClu);
  807960:	0f b6 05 a6 2b c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22ba6]        # 42a50d <superblock+0xd>
    read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  807967:	0f b6 c0             	movzx  eax,al
  80796a:	8b 0d 50 2c 00 00    	mov    ecx,DWORD PTR [rip+0x2c50]        # 80a5c0 <clu_sec_balance>
  807970:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  807973:	01 d1                	add    ecx,edx
  807975:	89 c2                	mov    edx,eax
  807977:	89 ce                	mov    esi,ecx
  807979:	bf 60 e5 42 00       	mov    edi,0x42e560
  80797e:	e8 bc 05 00 00       	call   807f3f <read_sec>
    //.
    strcpy(a_clu_of_dir[0].name,".       ");
  807983:	be 2a 24 81 00       	mov    esi,0x81242a
  807988:	bf 60 e5 42 00       	mov    edi,0x42e560
  80798d:	e8 92 21 00 00       	call   809b24 <strcpy>
    strcpy(a_clu_of_dir[0].extension,"   ");
  807992:	be 33 24 81 00       	mov    esi,0x812433
  807997:	bf 68 e5 42 00       	mov    edi,0x42e568
  80799c:	e8 83 21 00 00       	call   809b24 <strcpy>
    a_clu_of_dir[0].fistCluNum=dir.fistCluNum;
  8079a1:	0f b7 45 2a          	movzx  eax,WORD PTR [rbp+0x2a]
  8079a5:	66 89 05 ce 6b c2 ff 	mov    WORD PTR [rip+0xffffffffffc26bce],ax        # 42e57a <a_clu_of_dir+0x1a>
    a_clu_of_dir[0].len=0;
  8079ac:	c7 05 c6 6b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc26bc6],0x0        # 42e57c <a_clu_of_dir+0x1c>
  8079b3:	00 00 00 
    set_attr(&a_clu_of_dir[0],ATTR_DIR);
  8079b6:	be 10 00 00 00       	mov    esi,0x10
  8079bb:	bf 60 e5 42 00       	mov    edi,0x42e560
  8079c0:	e8 f9 fe ff ff       	call   8078be <set_attr>
    //..
    strcpy(a_clu_of_dir[1].name,"..      ");
  8079c5:	be 37 24 81 00       	mov    esi,0x812437
  8079ca:	bf 80 e5 42 00       	mov    edi,0x42e580
  8079cf:	e8 50 21 00 00       	call   809b24 <strcpy>
    strcpy(a_clu_of_dir[1].extension,"   ");
  8079d4:	be 33 24 81 00       	mov    esi,0x812433
  8079d9:	bf 88 e5 42 00       	mov    edi,0x42e588
  8079de:	e8 41 21 00 00       	call   809b24 <strcpy>
    a_clu_of_dir[1].fistCluNum=cur_dir.fistCluNum;
  8079e3:	0f b7 05 70 6b c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc26b70]        # 42e55a <cur_dir+0x1a>
  8079ea:	66 89 05 a9 6b c2 ff 	mov    WORD PTR [rip+0xffffffffffc26ba9],ax        # 42e59a <a_clu_of_dir+0x3a>
    a_clu_of_dir[1].len=0;
  8079f1:	c7 05 a1 6b c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc26ba1],0x0        # 42e59c <a_clu_of_dir+0x3c>
  8079f8:	00 00 00 
    set_attr(&a_clu_of_dir[1],ATTR_DIR);
  8079fb:	be 10 00 00 00       	mov    esi,0x10
  807a00:	bf 80 e5 42 00       	mov    edi,0x42e580
  807a05:	e8 b4 fe ff ff       	call   8078be <set_attr>
    //update the dir
    int dir_loc=cluster+clu_sec_balance;
  807a0a:	8b 15 b0 2b 00 00    	mov    edx,DWORD PTR [rip+0x2bb0]        # 80a5c0 <clu_sec_balance>
  807a10:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807a13:	01 d0                	add    eax,edx
  807a15:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  807a18:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807a1b:	ba 00 02 00 00       	mov    edx,0x200
  807a20:	89 c6                	mov    esi,eax
  807a22:	bf 60 e5 42 00       	mov    edi,0x42e560
  807a27:	e8 1f fe ff ff       	call   80784b <write_sec>
    //no need to update fat and root
}
  807a2c:	90                   	nop
  807a2d:	c9                   	leave  
  807a2e:	c3                   	ret    

0000000000807a2f <translate_attr>:
void translate_attr(char attr,char *attr_s)
{
  807a2f:	f3 0f 1e fa          	endbr64 
  807a33:	55                   	push   rbp
  807a34:	48 89 e5             	mov    rbp,rsp
  807a37:	89 f8                	mov    eax,edi
  807a39:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  807a3d:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    //rwhds (s: system h:hidden)
    int v=attr&1;
  807a40:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807a44:	83 e0 01             	and    eax,0x1
  807a47:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//sys_read-only
  807a4a:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807a4e:	74 0b                	je     807a5b <translate_attr+0x2c>
        attr_s[1]='-';
  807a50:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807a54:	48 83 c0 01          	add    rax,0x1
  807a58:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
    v=attr&2;
  807a5b:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807a5f:	83 e0 02             	and    eax,0x2
  807a62:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//hidden
  807a65:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807a69:	74 0b                	je     807a76 <translate_attr+0x47>
        attr_s[2]='h';
  807a6b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807a6f:	48 83 c0 02          	add    rax,0x2
  807a73:	c6 00 68             	mov    BYTE PTR [rax],0x68
    v=attr&4;
  807a76:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807a7a:	83 e0 04             	and    eax,0x4
  807a7d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//system
  807a80:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807a84:	74 0b                	je     807a91 <translate_attr+0x62>
        attr_s[4]='s';
  807a86:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807a8a:	48 83 c0 04          	add    rax,0x4
  807a8e:	c6 00 73             	mov    BYTE PTR [rax],0x73
    v=attr&8;
  807a91:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807a95:	83 e0 08             	and    eax,0x8
  807a98:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//volume label
  807a9b:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807a9f:	74 0b                	je     807aac <translate_attr+0x7d>
        attr_s[3]='v';
  807aa1:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807aa5:	48 83 c0 03          	add    rax,0x3
  807aa9:	c6 00 76             	mov    BYTE PTR [rax],0x76
    v=attr&16;
  807aac:	0f be 45 ec          	movsx  eax,BYTE PTR [rbp-0x14]
  807ab0:	83 e0 10             	and    eax,0x10
  807ab3:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(v)//dir
  807ab6:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807aba:	74 0b                	je     807ac7 <translate_attr+0x98>
        attr_s[3]='d';
  807abc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807ac0:	48 83 c0 03          	add    rax,0x3
  807ac4:	c6 00 64             	mov    BYTE PTR [rax],0x64
    //archive: do nothing
    attr_s[5]='\0';
  807ac7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807acb:	48 83 c0 05          	add    rax,0x5
  807acf:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  807ad2:	90                   	nop
  807ad3:	5d                   	pop    rbp
  807ad4:	c3                   	ret    

0000000000807ad5 <extend_cluster>:
int extend_cluster(short cluster)
{
  807ad5:	f3 0f 1e fa          	endbr64 
  807ad9:	55                   	push   rbp
  807ada:	48 89 e5             	mov    rbp,rsp
  807add:	48 83 ec 18          	sub    rsp,0x18
  807ae1:	89 f8                	mov    eax,edi
  807ae3:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    int new_clu=req_cluster();
  807ae7:	b8 00 00 00 00       	mov    eax,0x0
  807aec:	e8 0e fd ff ff       	call   8077ff <req_cluster>
  807af1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(new_clu==-1)
  807af4:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  807af8:	75 07                	jne    807b01 <extend_cluster+0x2c>
        return -1;
  807afa:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807aff:	eb 16                	jmp    807b17 <extend_cluster+0x42>
    fat[cluster]=new_clu;
  807b01:	0f bf 45 ec          	movsx  eax,WORD PTR [rbp-0x14]
  807b05:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  807b08:	48 98                	cdqe   
  807b0a:	66 89 94 00 60 e7 42 	mov    WORD PTR [rax+rax*1+0x42e760],dx
  807b11:	00 
    return 0;
  807b12:	b8 00 00 00 00       	mov    eax,0x0
}
  807b17:	c9                   	leave  
  807b18:	c3                   	ret    

0000000000807b19 <touch>:
得出的结果换算成16进制填入即可。也就是：38H字节0~4位是日期数；38H字节5~7位和39H字节0位是月份；
39H字节的1~7位为年号，原定义中0~119分别代表1980~2099，目前高版本的Windows允许取0~127，
即年号最大可以到2107年。
*/
int touch(driver_args *arg)
{
  807b19:	f3 0f 1e fa          	endbr64 
  807b1d:	55                   	push   rbp
  807b1e:	48 89 e5             	mov    rbp,rsp
  807b21:	48 83 ec 60          	sub    rsp,0x60
  807b25:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    char *name=arg->path;
  807b29:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807b2d:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807b31:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  807b35:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  807b39:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  807b3c:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    //default set to 512
    int max_files=16;
  807b40:	c7 45 ec 10 00 00 00 	mov    DWORD PTR [rbp-0x14],0x10
    dir_entry *dir_table=a_clu_of_dir;
  807b47:	48 c7 45 e0 60 e5 42 	mov    QWORD PTR [rbp-0x20],0x42e560
  807b4e:	00 
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  807b4f:	0f b6 05 b7 29 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc229b7]        # 42a50d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  807b56:	0f b6 c0             	movzx  eax,al
  807b59:	0f b7 55 ca          	movzx  edx,WORD PTR [rbp-0x36]
  807b5d:	0f b7 ca             	movzx  ecx,dx
  807b60:	8b 15 5a 2a 00 00    	mov    edx,DWORD PTR [rip+0x2a5a]        # 80a5c0 <clu_sec_balance>
  807b66:	01 d1                	add    ecx,edx
  807b68:	89 c2                	mov    edx,eax
  807b6a:	89 ce                	mov    esi,ecx
  807b6c:	bf 60 e5 42 00       	mov    edi,0x42e560
  807b71:	e8 c9 03 00 00       	call   807f3f <read_sec>
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  807b76:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  807b7a:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do{
        for(int i=0;i<max_files;i++)
  807b7e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807b85:	e9 2e 01 00 00       	jmp    807cb8 <touch+0x19f>
        {
            //printf("%s\n",dir_table[i].name);
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  807b8a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807b8d:	48 98                	cdqe   
  807b8f:	48 c1 e0 05          	shl    rax,0x5
  807b93:	48 89 c2             	mov    rdx,rax
  807b96:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807b9a:	48 01 d0             	add    rax,rdx
  807b9d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  807ba0:	3c e5                	cmp    al,0xe5
  807ba2:	74 1e                	je     807bc2 <touch+0xa9>
            dir_table[i].name[0]==0)
  807ba4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807ba7:	48 98                	cdqe   
  807ba9:	48 c1 e0 05          	shl    rax,0x5
  807bad:	48 89 c2             	mov    rdx,rax
  807bb0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807bb4:	48 01 d0             	add    rax,rdx
  807bb7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if((unsigned char)dir_table[i].name[0]==0xe5||\
  807bba:	84 c0                	test   al,al
  807bbc:	0f 85 f2 00 00 00    	jne    807cb4 <touch+0x19b>
            {
                //available
                //put name
                format_name(name);
  807bc2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807bc6:	48 89 c7             	mov    rdi,rax
  807bc9:	e8 25 fb ff ff       	call   8076f3 <format_name>
                memcpy(dir_table[i].name,name,11);
  807bce:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807bd1:	48 98                	cdqe   
  807bd3:	48 c1 e0 05          	shl    rax,0x5
  807bd7:	48 89 c2             	mov    rdx,rax
  807bda:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807bde:	48 01 d0             	add    rax,rdx
  807be1:	48 89 c1             	mov    rcx,rax
  807be4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807be8:	ba 0b 00 00 00       	mov    edx,0xb
  807bed:	48 89 c6             	mov    rsi,rax
  807bf0:	48 89 cf             	mov    rdi,rcx
  807bf3:	e8 2e 1e 00 00       	call   809a26 <memcpy>
                int clu=req_cluster();
  807bf8:	b8 00 00 00 00       	mov    eax,0x0
  807bfd:	e8 fd fb ff ff       	call   8077ff <req_cluster>
  807c02:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
                if(clu==-1)
  807c05:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  807c09:	75 0a                	jne    807c15 <touch+0xfc>
                {
                    //puts("err: full disk");
                    return -1;
  807c0b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807c10:	e9 fc 00 00 00       	jmp    807d11 <touch+0x1f8>
                }
                dir_table[i].fistCluNum=clu;
  807c15:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c18:	48 98                	cdqe   
  807c1a:	48 c1 e0 05          	shl    rax,0x5
  807c1e:	48 89 c2             	mov    rdx,rax
  807c21:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c25:	48 01 d0             	add    rax,rdx
  807c28:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  807c2b:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
                set_attr(&dir_table[i],ATTR_ARCHIVE);
  807c2f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c32:	48 98                	cdqe   
  807c34:	48 c1 e0 05          	shl    rax,0x5
  807c38:	48 89 c2             	mov    rdx,rax
  807c3b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c3f:	48 01 d0             	add    rax,rdx
  807c42:	be 20 00 00 00       	mov    esi,0x20
  807c47:	48 89 c7             	mov    rdi,rax
  807c4a:	e8 6f fc ff ff       	call   8078be <set_attr>
                dir_table[i].len=superblock.bytesPerSec*superblock.secPerClu;
  807c4f:	0f b7 05 b5 28 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc228b5]        # 42a50b <superblock+0xb>
  807c56:	0f b7 d0             	movzx  edx,ax
  807c59:	0f b6 05 ad 28 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc228ad]        # 42a50d <superblock+0xd>
  807c60:	0f b6 c0             	movzx  eax,al
  807c63:	0f af d0             	imul   edx,eax
  807c66:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c69:	48 98                	cdqe   
  807c6b:	48 c1 e0 05          	shl    rax,0x5
  807c6f:	48 89 c1             	mov    rcx,rax
  807c72:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807c76:	48 01 c8             	add    rax,rcx
  807c79:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
                //date and time
                //dir_table[i].lastModfDate=get_date_stab();
                //dir_table[i].lastModfTime=get_time_stab();
                //update
                write_sec(dir_table,cluster+clu_sec_balance,\
                superblock.bytesPerSec*superblock.secPerClu);
  807c7c:	0f b7 05 88 28 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22888]        # 42a50b <superblock+0xb>
  807c83:	0f b7 d0             	movzx  edx,ax
  807c86:	0f b6 05 80 28 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22880]        # 42a50d <superblock+0xd>
  807c8d:	0f b6 c0             	movzx  eax,al
                write_sec(dir_table,cluster+clu_sec_balance,\
  807c90:	0f af d0             	imul   edx,eax
  807c93:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807c97:	8b 05 23 29 00 00    	mov    eax,DWORD PTR [rip+0x2923]        # 80a5c0 <clu_sec_balance>
  807c9d:	01 c1                	add    ecx,eax
  807c9f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807ca3:	89 ce                	mov    esi,ecx
  807ca5:	48 89 c7             	mov    rdi,rax
  807ca8:	e8 9e fb ff ff       	call   80784b <write_sec>
                return -1;
  807cad:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807cb2:	eb 5d                	jmp    807d11 <touch+0x1f8>
        for(int i=0;i<max_files;i++)
  807cb4:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807cb8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807cbb:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
  807cbe:	0f 8c c6 fe ff ff    	jl     807b8a <touch+0x71>
        if(fat[cluster]>=FAT_EOF&&extend_cluster(cluster)==-1)
        {
            //extend fail
            //puts("err:full disk");
            return -1;
        }else if(cluster<FAT_EOF)
  807cc4:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807cc9:	77 36                	ja     807d01 <touch+0x1e8>
        {
            cluster=fat[cluster];
  807ccb:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807ccf:	48 98                	cdqe   
  807cd1:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  807cd8:	00 
  807cd9:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807cdd:	0f b6 05 29 28 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22829]        # 42a50d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  807ce4:	0f b6 d0             	movzx  edx,al
  807ce7:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807ceb:	8b 05 cf 28 00 00    	mov    eax,DWORD PTR [rip+0x28cf]        # 80a5c0 <clu_sec_balance>
  807cf1:	01 c1                	add    ecx,eax
  807cf3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  807cf7:	89 ce                	mov    esi,ecx
  807cf9:	48 89 c7             	mov    rdi,rax
  807cfc:	e8 3e 02 00 00       	call   807f3f <read_sec>
        }
    }while(cluster<FAT_EOF);
  807d01:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807d06:	0f 86 72 fe ff ff    	jbe    807b7e <touch+0x65>
    return 0;
  807d0c:	b8 00 00 00 00       	mov    eax,0x0
}
  807d11:	c9                   	leave  
  807d12:	c3                   	ret    

0000000000807d13 <mkdir>:
//attention: the name must be char[12]
int mkdir(driver_args *arg)
{
  807d13:	f3 0f 1e fa          	endbr64 
  807d17:	55                   	push   rbp
  807d18:	48 89 e5             	mov    rbp,rsp
  807d1b:	48 83 ec 50          	sub    rsp,0x50
  807d1f:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    char *name=arg->path;
  807d23:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807d27:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  807d2b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    dir_entry dir;
    dir.fistCluNum=arg->entry.id;
  807d2f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807d33:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  807d36:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    format_name(name);
  807d3a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807d3e:	48 89 c7             	mov    rdi,rax
  807d41:	e8 ad f9 ff ff       	call   8076f3 <format_name>
    //regular dir
    unsigned short cluster = dir.fistCluNum;
  807d46:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  807d4a:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    do
    {
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
            superblock.secPerClu);
  807d4e:	0f b6 05 b8 27 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc227b8]        # 42a50d <superblock+0xd>
        read_sec(a_clu_of_dir,cluster+clu_sec_balance,\
  807d55:	0f b6 c0             	movzx  eax,al
  807d58:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  807d5c:	8b 15 5e 28 00 00    	mov    edx,DWORD PTR [rip+0x285e]        # 80a5c0 <clu_sec_balance>
  807d62:	01 d1                	add    ecx,edx
  807d64:	89 c2                	mov    edx,eax
  807d66:	89 ce                	mov    esi,ecx
  807d68:	bf 60 e5 42 00       	mov    edi,0x42e560
  807d6d:	e8 cd 01 00 00       	call   807f3f <read_sec>
        for (int i = 0; i < 16; i++)
  807d72:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807d79:	e9 8c 01 00 00       	jmp    807f0a <mkdir+0x1f7>
        {
            if(a_clu_of_dir[i].fistCluNum==0||\
  807d7e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807d81:	48 98                	cdqe   
  807d83:	48 c1 e0 05          	shl    rax,0x5
  807d87:	48 05 7a e5 42 00    	add    rax,0x42e57a
  807d8d:	0f b7 00             	movzx  eax,WORD PTR [rax]
  807d90:	66 85 c0             	test   ax,ax
  807d93:	74 30                	je     807dc5 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0xe5||\
  807d95:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807d98:	48 98                	cdqe   
  807d9a:	48 c1 e0 05          	shl    rax,0x5
  807d9e:	48 05 40 a5 42 00    	add    rax,0x42a540
  807da4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            if(a_clu_of_dir[i].fistCluNum==0||\
  807da7:	3c e5                	cmp    al,0xe5
  807da9:	74 1a                	je     807dc5 <mkdir+0xb2>
            (unsigned char)root_dir[i].name[0]==0)
  807dab:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807dae:	48 98                	cdqe   
  807db0:	48 c1 e0 05          	shl    rax,0x5
  807db4:	48 05 40 a5 42 00    	add    rax,0x42a540
  807dba:	0f b6 00             	movzx  eax,BYTE PTR [rax]
            (unsigned char)root_dir[i].name[0]==0xe5||\
  807dbd:	84 c0                	test   al,al
  807dbf:	0f 85 41 01 00 00    	jne    807f06 <mkdir+0x1f3>
            {
                memset(&a_clu_of_dir[i],0,sizeof(dir_entry));
  807dc5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807dc8:	48 98                	cdqe   
  807dca:	48 c1 e0 05          	shl    rax,0x5
  807dce:	48 05 60 e5 42 00    	add    rax,0x42e560
  807dd4:	ba 20 00 00 00       	mov    edx,0x20
  807dd9:	be 00 00 00 00       	mov    esi,0x0
  807dde:	48 89 c7             	mov    rdi,rax
  807de1:	e8 ef 1c 00 00       	call   809ad5 <memset>
                memset(a_clu_of_dir[i].name,' ',11);
  807de6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807de9:	48 98                	cdqe   
  807deb:	48 c1 e0 05          	shl    rax,0x5
  807def:	48 05 60 e5 42 00    	add    rax,0x42e560
  807df5:	ba 0b 00 00 00       	mov    edx,0xb
  807dfa:	be 20 00 00 00       	mov    esi,0x20
  807dff:	48 89 c7             	mov    rdi,rax
  807e02:	e8 ce 1c 00 00       	call   809ad5 <memset>
                strcpy(a_clu_of_dir[i].name,name);
  807e07:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807e0a:	48 98                	cdqe   
  807e0c:	48 c1 e0 05          	shl    rax,0x5
  807e10:	48 8d 90 60 e5 42 00 	lea    rdx,[rax+0x42e560]
  807e17:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807e1b:	48 89 c6             	mov    rsi,rax
  807e1e:	48 89 d7             	mov    rdi,rdx
  807e21:	e8 fe 1c 00 00       	call   809b24 <strcpy>
                a_clu_of_dir[i].name[strlen(name)]=' ';
  807e26:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807e2a:	48 89 c7             	mov    rdi,rax
  807e2d:	e8 11 1f 00 00       	call   809d43 <strlen>
  807e32:	48 63 d0             	movsxd rdx,eax
  807e35:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807e38:	48 98                	cdqe   
  807e3a:	48 c1 e0 05          	shl    rax,0x5
  807e3e:	48 01 d0             	add    rax,rdx
  807e41:	48 05 60 e5 42 00    	add    rax,0x42e560
  807e47:	c6 00 20             	mov    BYTE PTR [rax],0x20
                int clu=req_cluster();
  807e4a:	b8 00 00 00 00       	mov    eax,0x0
  807e4f:	e8 ab f9 ff ff       	call   8077ff <req_cluster>
  807e54:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
                if(clu==-1)//check
  807e57:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  807e5b:	75 0a                	jne    807e67 <mkdir+0x154>
                {
                    //puts("err:full dir");
                    return -1;
  807e5d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  807e62:	e9 d6 00 00 00       	jmp    807f3d <mkdir+0x22a>
                }
                a_clu_of_dir[i].fistCluNum=clu;
  807e67:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807e6a:	89 c2                	mov    edx,eax
  807e6c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807e6f:	48 98                	cdqe   
  807e71:	48 c1 e0 05          	shl    rax,0x5
  807e75:	48 05 7a e5 42 00    	add    rax,0x42e57a
  807e7b:	66 89 10             	mov    WORD PTR [rax],dx
                //set attr
                set_attr(&a_clu_of_dir[i],ATTR_DIR);
  807e7e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807e81:	48 98                	cdqe   
  807e83:	48 c1 e0 05          	shl    rax,0x5
  807e87:	48 05 60 e5 42 00    	add    rax,0x42e560
  807e8d:	be 10 00 00 00       	mov    esi,0x10
  807e92:	48 89 c7             	mov    rdi,rax
  807e95:	e8 24 fa ff ff       	call   8078be <set_attr>
                //set length
                a_clu_of_dir[i].len=0;
  807e9a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807e9d:	48 98                	cdqe   
  807e9f:	48 c1 e0 05          	shl    rax,0x5
  807ea3:	48 05 7c e5 42 00    	add    rax,0x42e57c
  807ea9:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
                //date and time
                /*a_clu_of_dir[i].lastModfDate=get_date_stab();
                a_clu_of_dir[i].lastModfTime=get_time_stab();*/
                //set date:temporarily none
                //add . and ..
                add_dot_and_ddot_dir(a_clu_of_dir[i]);
  807eaf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807eb2:	48 98                	cdqe   
  807eb4:	48 c1 e0 05          	shl    rax,0x5
  807eb8:	48 05 60 e5 42 00    	add    rax,0x42e560
  807ebe:	ff 70 18             	push   QWORD PTR [rax+0x18]
  807ec1:	ff 70 10             	push   QWORD PTR [rax+0x10]
  807ec4:	ff 70 08             	push   QWORD PTR [rax+0x8]
  807ec7:	ff 30                	push   QWORD PTR [rax]
  807ec9:	e8 7c fa ff ff       	call   80794a <add_dot_and_ddot_dir>
  807ece:	48 83 c4 20          	add    rsp,0x20
                //update the dir
                int dir_loc=cluster+clu_sec_balance;
  807ed2:	0f b7 55 fe          	movzx  edx,WORD PTR [rbp-0x2]
  807ed6:	8b 05 e4 26 00 00    	mov    eax,DWORD PTR [rip+0x26e4]        # 80a5c0 <clu_sec_balance>
  807edc:	01 d0                	add    eax,edx
  807ede:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
                write_sec(a_clu_of_dir,dir_loc,sizeof(a_clu_of_dir));
  807ee1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  807ee4:	ba 00 02 00 00       	mov    edx,0x200
  807ee9:	89 c6                	mov    esi,eax
  807eeb:	bf 60 e5 42 00       	mov    edi,0x42e560
  807ef0:	e8 56 f9 ff ff       	call   80784b <write_sec>
                update_fat_and_root();
  807ef5:	b8 00 00 00 00       	mov    eax,0x0
  807efa:	e8 e7 f9 ff ff       	call   8078e6 <update_fat_and_root>
                return 0;
  807eff:	b8 00 00 00 00       	mov    eax,0x0
  807f04:	eb 37                	jmp    807f3d <mkdir+0x22a>
        for (int i = 0; i < 16; i++)
  807f06:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807f0a:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  807f0e:	0f 8e 6a fe ff ff    	jle    807d7e <mkdir+0x6b>
            }
        }

        if(cluster<FAT_EOF)
  807f14:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807f19:	77 12                	ja     807f2d <mkdir+0x21a>
            cluster=fat[cluster];
  807f1b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807f1f:	48 98                	cdqe   
  807f21:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  807f28:	00 
  807f29:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    } while (cluster<FAT_EOF);
  807f2d:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  807f32:	0f 86 16 fe ff ff    	jbe    807d4e <mkdir+0x3b>
    return -1;
  807f38:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  807f3d:	c9                   	leave  
  807f3e:	c3                   	ret    

0000000000807f3f <read_sec>:
    }
    
    
}*/
int read_sec(char *dist, int sec_num, int sec_count)
{
  807f3f:	f3 0f 1e fa          	endbr64 
  807f43:	55                   	push   rbp
  807f44:	48 89 e5             	mov    rbp,rsp
  807f47:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  807f4e:	48 89 bd 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rdi
  807f55:	89 b5 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],esi
  807f5b:	89 95 20 ff ff ff    	mov    DWORD PTR [rbp-0xe0],edx
    driver_args arg={
  807f61:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  807f68:	b8 00 00 00 00       	mov    eax,0x0
  807f6d:	b9 18 00 00 00       	mov    ecx,0x18
  807f72:	48 89 d7             	mov    rdi,rdx
  807f75:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  807f78:	8b 85 24 ff ff ff    	mov    eax,DWORD PTR [rbp-0xdc]
  807f7e:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
  807f84:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  807f8b:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
  807f91:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  807f98:	00 00 00 
            .dist_addr=dist,
            .lba=sec_num,
            .sec_c=1
    };
    for(int i=0;i<sec_count;i++)
  807f9b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807fa2:	eb 3e                	jmp    807fe2 <read_sec+0xa3>
    {
        drv_disk.read(&arg);
  807fa4:	48 8b 15 8d 25 00 00 	mov    rdx,QWORD PTR [rip+0x258d]        # 80a538 <drv_disk+0x18>
  807fab:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  807fb2:	48 89 c7             	mov    rdi,rax
  807fb5:	ff d2                	call   rdx
        arg.dist_addr+=superblock.bytesPerSec;
  807fb7:	8b 95 34 ff ff ff    	mov    edx,DWORD PTR [rbp-0xcc]
  807fbd:	0f b7 05 47 25 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22547]        # 42a50b <superblock+0xb>
  807fc4:	0f b7 c0             	movzx  eax,ax
  807fc7:	01 d0                	add    eax,edx
  807fc9:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.lba++;
  807fcf:	8b 85 30 ff ff ff    	mov    eax,DWORD PTR [rbp-0xd0]
  807fd5:	83 c0 01             	add    eax,0x1
  807fd8:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
    for(int i=0;i<sec_count;i++)
  807fde:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807fe2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807fe5:	3b 85 20 ff ff ff    	cmp    eax,DWORD PTR [rbp-0xe0]
  807feb:	7c b7                	jl     807fa4 <read_sec+0x65>
    }
    return 0;
  807fed:	b8 00 00 00 00       	mov    eax,0x0
}
  807ff2:	c9                   	leave  
  807ff3:	c3                   	ret    

0000000000807ff4 <rm>:

int rm(driver_args* args)
{
  807ff4:	f3 0f 1e fa          	endbr64 
  807ff8:	55                   	push   rbp
  807ff9:	48 89 e5             	mov    rbp,rsp
  807ffc:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  808003:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
    char *name=args->path;
  80800a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  808011:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  808015:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    driver_args tmparg={
  808019:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  808020:	b8 00 00 00 00       	mov    eax,0x0
  808025:	b9 18 00 00 00       	mov    ecx,0x18
  80802a:	48 89 d7             	mov    rdi,rdx
  80802d:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .path=args->dir_path,
  808030:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  808037:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
    driver_args tmparg={
  80803e:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    if(get_entry(&tmparg)==-1)return -1;
  808045:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  80804c:	48 89 c7             	mov    rdi,rax
  80804f:	e8 07 0a 00 00       	call   808a5b <get_entry>
  808054:	83 f8 ff             	cmp    eax,0xffffffff
  808057:	75 0a                	jne    808063 <rm+0x6f>
  808059:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80805e:	e9 a8 01 00 00       	jmp    80820b <rm+0x217>
    dir.fistCluNum=tmparg.entry.id;
  808063:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  808069:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    dir_entry *dir_table=a_clu_of_dir;
  80806d:	48 c7 45 e0 60 e5 42 	mov    QWORD PTR [rbp-0x20],0x42e560
  808074:	00 
    //regular dir
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
    superblock.secPerClu);
  808075:	0f b6 05 91 24 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc22491]        # 42a50d <superblock+0xd>
    read_sec(a_clu_of_dir,dir.fistCluNum+clu_sec_balance,\
  80807c:	0f b6 c0             	movzx  eax,al
  80807f:	0f b7 55 da          	movzx  edx,WORD PTR [rbp-0x26]
  808083:	0f b7 ca             	movzx  ecx,dx
  808086:	8b 15 34 25 00 00    	mov    edx,DWORD PTR [rip+0x2534]        # 80a5c0 <clu_sec_balance>
  80808c:	01 d1                	add    ecx,edx
  80808e:	89 c2                	mov    edx,eax
  808090:	89 ce                	mov    esi,ecx
  808092:	bf 60 e5 42 00       	mov    edi,0x42e560
  808097:	e8 a3 fe ff ff       	call   807f3f <read_sec>
    dir_table=a_clu_of_dir;
  80809c:	48 c7 45 e0 60 e5 42 	mov    QWORD PTR [rbp-0x20],0x42e560
  8080a3:	00 
    //current cluster you're at
    unsigned short cluster=dir.fistCluNum;
  8080a4:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  8080a8:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    int i=0;
  8080ac:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    while(cluster<FAT_EOF){
  8080b3:	e9 89 00 00 00       	jmp    808141 <rm+0x14d>
        read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  8080b8:	0f b6 05 4e 24 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2244e]        # 42a50d <superblock+0xd>
        read_sec(dir_table,cluster+clu_sec_balance,\
  8080bf:	0f b6 d0             	movzx  edx,al
  8080c2:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  8080c6:	8b 05 f4 24 00 00    	mov    eax,DWORD PTR [rip+0x24f4]        # 80a5c0 <clu_sec_balance>
  8080cc:	01 c1                	add    ecx,eax
  8080ce:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8080d2:	89 ce                	mov    esi,ecx
  8080d4:	48 89 c7             	mov    rdi,rax
  8080d7:	e8 63 fe ff ff       	call   807f3f <read_sec>
        for(;i<16;i++)
  8080dc:	eb 44                	jmp    808122 <rm+0x12e>
        {
            if(dir_table[i].fistCluNum==args->entry.id)
  8080de:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8080e1:	48 98                	cdqe   
  8080e3:	48 c1 e0 05          	shl    rax,0x5
  8080e7:	48 89 c2             	mov    rdx,rax
  8080ea:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8080ee:	48 01 d0             	add    rax,rdx
  8080f1:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  8080f5:	0f b7 d0             	movzx  edx,ax
  8080f8:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  8080ff:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  808102:	39 c2                	cmp    edx,eax
  808104:	75 18                	jne    80811e <rm+0x12a>
            {
                if(dir_table[i].attr&ATTR_DIR){
                    //要处理里面的文件
                }
                dir_table[i].name[0]=0xe5;
  808106:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  808109:	48 98                	cdqe   
  80810b:	48 c1 e0 05          	shl    rax,0x5
  80810f:	48 89 c2             	mov    rdx,rax
  808112:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808116:	48 01 d0             	add    rax,rdx
  808119:	c6 00 e5             	mov    BYTE PTR [rax],0xe5
                goto del_entry_finish;
  80811c:	eb 2f                	jmp    80814d <rm+0x159>
        for(;i<16;i++)
  80811e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  808122:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  808126:	7e b6                	jle    8080de <rm+0xea>
            }
        }
        if(cluster<FAT_EOF)
  808128:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  80812d:	77 12                	ja     808141 <rm+0x14d>
        {
            cluster=fat[cluster];
  80812f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  808133:	48 98                	cdqe   
  808135:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  80813c:	00 
  80813d:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
    while(cluster<FAT_EOF){
  808141:	66 83 7d fe f6       	cmp    WORD PTR [rbp-0x2],0xfff6
  808146:	0f 86 6c ff ff ff    	jbe    8080b8 <rm+0xc4>
            //update
            //if you can reach here it means it's a regular dir
        }

    }
del_entry_finish:
  80814c:	90                   	nop
    ;
    //del fat
    unsigned short del_clu=dir_table[i].fistCluNum;
  80814d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  808150:	48 98                	cdqe   
  808152:	48 c1 e0 05          	shl    rax,0x5
  808156:	48 89 c2             	mov    rdx,rax
  808159:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80815d:	48 01 d0             	add    rax,rdx
  808160:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  808164:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
    unsigned short pion=del_clu<FAT_EOF?fat[del_clu]:0xffff;
  808168:	66 83 7d f6 f6       	cmp    WORD PTR [rbp-0xa],0xfff6
  80816d:	77 10                	ja     80817f <rm+0x18b>
  80816f:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  808173:	48 98                	cdqe   
  808175:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  80817c:	00 
  80817d:	eb 05                	jmp    808184 <rm+0x190>
  80817f:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808184:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  808188:	eb 2a                	jmp    8081b4 <rm+0x1c0>
    {
        fat[del_clu]=0;
  80818a:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  80818e:	48 98                	cdqe   
  808190:	66 c7 84 00 60 e7 42 	mov    WORD PTR [rax+rax*1+0x42e760],0x0
  808197:	00 00 00 
        del_clu=pion;
  80819a:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  80819e:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
        pion=fat[pion];
  8081a2:	0f b7 45 f4          	movzx  eax,WORD PTR [rbp-0xc]
  8081a6:	48 98                	cdqe   
  8081a8:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  8081af:	00 
  8081b0:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
    while(pion<FAT_EOF)
  8081b4:	66 83 7d f4 f6       	cmp    WORD PTR [rbp-0xc],0xfff6
  8081b9:	76 cf                	jbe    80818a <rm+0x196>
    }
    fat[del_clu]=0;
  8081bb:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
  8081bf:	48 98                	cdqe   
  8081c1:	66 c7 84 00 60 e7 42 	mov    WORD PTR [rax+rax*1+0x42e760],0x0
  8081c8:	00 00 00 
    //del dir entry
    write_sec(dir_table,cluster+clu_sec_balance,\
    superblock.secPerClu*superblock.bytesPerSec);
  8081cb:	0f b6 05 3b 23 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2233b]        # 42a50d <superblock+0xd>
  8081d2:	0f b6 d0             	movzx  edx,al
  8081d5:	0f b7 05 2f 23 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2232f]        # 42a50b <superblock+0xb>
  8081dc:	0f b7 c0             	movzx  eax,ax
    write_sec(dir_table,cluster+clu_sec_balance,\
  8081df:	0f af d0             	imul   edx,eax
  8081e2:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  8081e6:	8b 05 d4 23 00 00    	mov    eax,DWORD PTR [rip+0x23d4]        # 80a5c0 <clu_sec_balance>
  8081ec:	01 c1                	add    ecx,eax
  8081ee:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8081f2:	89 ce                	mov    esi,ecx
  8081f4:	48 89 c7             	mov    rdi,rax
  8081f7:	e8 4f f6 ff ff       	call   80784b <write_sec>
    update_fat_and_root();
  8081fc:	b8 00 00 00 00       	mov    eax,0x0
  808201:	e8 e0 f6 ff ff       	call   8078e6 <update_fat_and_root>
    return 0;
  808206:	b8 00 00 00 00       	mov    eax,0x0
}
  80820b:	c9                   	leave  
  80820c:	c3                   	ret    

000000000080820d <find>:
int find_f=0;
int find(char *name)
{
  80820d:	f3 0f 1e fa          	endbr64 
  808211:	55                   	push   rbp
  808212:	48 89 e5             	mov    rbp,rsp
  808215:	48 83 ec 30          	sub    rsp,0x30
  808219:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  80821d:	c7 45 fc 00 02 00 00 	mov    DWORD PTR [rbp-0x4],0x200
    int index=0;
  808224:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    dir_entry *dir_table=a_clu_of_dir;
  80822b:	48 c7 45 f0 60 e5 42 	mov    QWORD PTR [rbp-0x10],0x42e560
  808232:	00 
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  808233:	0f b7 05 20 63 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc26320]        # 42e55a <cur_dir+0x1a>
  80823a:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
    if(cur_dir.fistCluNum==0)
  80823e:	0f b7 05 15 63 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc26315]        # 42e55a <cur_dir+0x1a>
  808245:	66 85 c0             	test   ax,ax
  808248:	75 0a                	jne    808254 <find+0x47>
        dir_table=root_dir;
  80824a:	48 c7 45 f0 40 a5 42 	mov    QWORD PTR [rbp-0x10],0x42a540
  808251:	00 
  808252:	eb 2b                	jmp    80827f <find+0x72>
    else {
        max_files=16;
  808254:	c7 45 fc 10 00 00 00 	mov    DWORD PTR [rbp-0x4],0x10
        read_sec(dir_table, cluster + clu_sec_balance, \
            superblock.secPerClu);
  80825b:	0f b6 05 ab 22 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc222ab]        # 42a50d <superblock+0xd>
        read_sec(dir_table, cluster + clu_sec_balance, \
  808262:	0f b6 d0             	movzx  edx,al
  808265:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  808269:	8b 05 51 23 00 00    	mov    eax,DWORD PTR [rip+0x2351]        # 80a5c0 <clu_sec_balance>
  80826f:	01 c1                	add    ecx,eax
  808271:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808275:	89 ce                	mov    esi,ecx
  808277:	48 89 c7             	mov    rdi,rax
  80827a:	e8 c0 fc ff ff       	call   807f3f <read_sec>
    }
    do{
        for(int i=0;i<max_files;i++)
  80827f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  808286:	eb 57                	jmp    8082df <find+0xd2>
        {
            if(dir_table[i].name[0]==0||dir_table[i].name[0]==0xe5)
  808288:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80828b:	48 98                	cdqe   
  80828d:	48 c1 e0 05          	shl    rax,0x5
  808291:	48 89 c2             	mov    rdx,rax
  808294:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808298:	48 01 d0             	add    rax,rdx
  80829b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80829e:	84 c0                	test   al,al
  8082a0:	74 38                	je     8082da <find+0xcd>
                continue;
            if(memcmp(dir_table[i].name,name,11)==0)
  8082a2:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8082a5:	48 98                	cdqe   
  8082a7:	48 c1 e0 05          	shl    rax,0x5
  8082ab:	48 89 c2             	mov    rdx,rax
  8082ae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8082b2:	48 01 d0             	add    rax,rdx
  8082b5:	48 89 c1             	mov    rcx,rax
  8082b8:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8082bc:	ba 0b 00 00 00       	mov    edx,0xb
  8082c1:	48 89 c6             	mov    rsi,rax
  8082c4:	48 89 cf             	mov    rdi,rcx
  8082c7:	e8 a4 17 00 00       	call   809a70 <memcmp>
  8082cc:	85 c0                	test   eax,eax
  8082ce:	75 0b                	jne    8082db <find+0xce>
            {
                return index+i;
  8082d0:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8082d3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8082d6:	01 d0                	add    eax,edx
  8082d8:	eb 71                	jmp    80834b <find+0x13e>
                continue;
  8082da:	90                   	nop
        for(int i=0;i<max_files;i++)
  8082db:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  8082df:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8082e2:	3b 45 fc             	cmp    eax,DWORD PTR [rbp-0x4]
  8082e5:	7c a1                	jl     808288 <find+0x7b>
            }
        }
        if(cur_dir.fistCluNum==0)
  8082e7:	0f b7 05 6c 62 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2626c]        # 42e55a <cur_dir+0x1a>
  8082ee:	66 85 c0             	test   ax,ax
  8082f1:	75 07                	jne    8082fa <find+0xed>
            return -1;
  8082f3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8082f8:	eb 51                	jmp    80834b <find+0x13e>
        else if(cluster<FAT_EOF)
  8082fa:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  8082ff:	77 3a                	ja     80833b <find+0x12e>
        {
            index+=16;
  808301:	83 45 f8 10          	add    DWORD PTR [rbp-0x8],0x10
            cluster=fat[cluster];
  808305:	0f b7 45 ee          	movzx  eax,WORD PTR [rbp-0x12]
  808309:	48 98                	cdqe   
  80830b:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808312:	00 
  808313:	66 89 45 ee          	mov    WORD PTR [rbp-0x12],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  808317:	0f b6 05 ef 21 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc221ef]        # 42a50d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  80831e:	0f b6 d0             	movzx  edx,al
  808321:	0f b7 4d ee          	movzx  ecx,WORD PTR [rbp-0x12]
  808325:	8b 05 95 22 00 00    	mov    eax,DWORD PTR [rip+0x2295]        # 80a5c0 <clu_sec_balance>
  80832b:	01 c1                	add    ecx,eax
  80832d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808331:	89 ce                	mov    esi,ecx
  808333:	48 89 c7             	mov    rdi,rax
  808336:	e8 04 fc ff ff       	call   807f3f <read_sec>
        }
    }while(cluster<FAT_EOF);
  80833b:	66 83 7d ee f6       	cmp    WORD PTR [rbp-0x12],0xfff6
  808340:	0f 86 39 ff ff ff    	jbe    80827f <find+0x72>
    return -1;
  808346:	b8 ff ff ff ff       	mov    eax,0xffffffff

}
  80834b:	c9                   	leave  
  80834c:	c3                   	ret    

000000000080834d <read_file_byname>:

int read_file_byname(char *full_name,char *dist,int pos,int len)
{
  80834d:	f3 0f 1e fa          	endbr64 
  808351:	55                   	push   rbp
  808352:	48 89 e5             	mov    rbp,rsp
  808355:	41 57                	push   r15
  808357:	41 56                	push   r14
  808359:	41 55                	push   r13
  80835b:	41 54                	push   r12
  80835d:	53                   	push   rbx
  80835e:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  808365:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  80836c:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  808373:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  808379:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  80837f:	48 89 e0             	mov    rax,rsp
  808382:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  808385:	bf 00 00 00 00       	mov    edi,0x0
  80838a:	e8 7e fe ff ff       	call   80820d <find>
  80838f:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  808392:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  808396:	74 09                	je     8083a1 <read_file_byname+0x54>
  808398:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  80839f:	79 0a                	jns    8083ab <read_file_byname+0x5e>
        return -1;
  8083a1:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8083a6:	e9 ea 02 00 00       	jmp    808695 <read_file_byname+0x348>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  8083ab:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  8083b2:	48 c7 45 c0 40 a5 42 	mov    QWORD PTR [rbp-0x40],0x42a540
  8083b9:	00 
    int in_root=1;
  8083ba:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  8083c1:	0f b7 05 92 61 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc26192]        # 42e55a <cur_dir+0x1a>
  8083c8:	66 85 c0             	test   ax,ax
  8083cb:	74 40                	je     80840d <read_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  8083cd:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  8083d4:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  8083db:	0f b6 05 2b 21 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2212b]        # 42a50d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  8083e2:	0f b6 c0             	movzx  eax,al
  8083e5:	0f b7 15 6e 61 c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc2616e]        # 42e55a <cur_dir+0x1a>
  8083ec:	0f b7 ca             	movzx  ecx,dx
  8083ef:	8b 15 cb 21 00 00    	mov    edx,DWORD PTR [rip+0x21cb]        # 80a5c0 <clu_sec_balance>
  8083f5:	01 d1                	add    ecx,edx
  8083f7:	89 c2                	mov    edx,eax
  8083f9:	89 ce                	mov    esi,ecx
  8083fb:	bf 60 e5 42 00       	mov    edi,0x42e560
  808400:	e8 3a fb ff ff       	call   807f3f <read_sec>
        dir_table=a_clu_of_dir;
  808405:	48 c7 45 c0 60 e5 42 	mov    QWORD PTR [rbp-0x40],0x42e560
  80840c:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  80840d:	0f b7 05 46 61 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc26146]        # 42e55a <cur_dir+0x1a>
  808414:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  808418:	eb 41                	jmp    80845b <read_file_byname+0x10e>
        index-=16;
  80841a:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  80841e:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  808423:	77 36                	ja     80845b <read_file_byname+0x10e>
        {
            cluster=fat[cluster];
  808425:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  808429:	48 98                	cdqe   
  80842b:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808432:	00 
  808433:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  808437:	0f b6 05 cf 20 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc220cf]        # 42a50d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  80843e:	0f b6 d0             	movzx  edx,al
  808441:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  808445:	8b 05 75 21 00 00    	mov    eax,DWORD PTR [rip+0x2175]        # 80a5c0 <clu_sec_balance>
  80844b:	01 c1                	add    ecx,eax
  80844d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808451:	89 ce                	mov    esi,ecx
  808453:	48 89 c7             	mov    rdi,rax
  808456:	e8 e4 fa ff ff       	call   807f3f <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  80845b:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  80845f:	75 0d                	jne    80846e <read_file_byname+0x121>
  808461:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  808465:	7e 07                	jle    80846e <read_file_byname+0x121>
  808467:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  80846c:	76 ac                	jbe    80841a <read_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  80846e:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  808471:	48 98                	cdqe   
  808473:	48 c1 e0 05          	shl    rax,0x5
  808477:	48 89 c2             	mov    rdx,rax
  80847a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  80847e:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  808482:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808485:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808489:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  808490:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  808497:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  80849b:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  80849f:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  8084a3:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  8084a7:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  8084ab:	0f b7 c0             	movzx  eax,ax
  8084ae:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  8084b1:	0f b7 05 53 20 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc22053]        # 42a50b <superblock+0xb>
  8084b8:	0f b7 d0             	movzx  edx,ax
  8084bb:	0f b6 05 4b 20 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc2204b]        # 42a50d <superblock+0xd>
  8084c2:	0f b6 c0             	movzx  eax,al
  8084c5:	0f af c2             	imul   eax,edx
  8084c8:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  8084cb:	eb 25                	jmp    8084f2 <read_file_byname+0x1a5>
    {
        pos-=cluster_size;
  8084cd:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8084d0:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        f_cluster=fat[f_cluster];
  8084d6:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8084d9:	48 98                	cdqe   
  8084db:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  8084e2:	00 
  8084e3:	98                   	cwde   
  8084e4:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        if(pos<cluster_size)
  8084e7:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8084ed:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8084f0:	7c 0d                	jl     8084ff <read_file_byname+0x1b2>
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  8084f2:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8084f8:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8084fb:	7d d0                	jge    8084cd <read_file_byname+0x180>
  8084fd:	eb 01                	jmp    808500 <read_file_byname+0x1b3>
            break;
  8084ff:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  808500:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808507:	7e 15                	jle    80851e <read_file_byname+0x1d1>
  808509:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  80850f:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808512:	7c 0a                	jl     80851e <read_file_byname+0x1d1>
        return -1;//pos out of range
  808514:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808519:	e9 77 01 00 00       	jmp    808695 <read_file_byname+0x348>
    //
    char temp[cluster_size];
  80851e:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808521:	48 63 d0             	movsxd rdx,eax
  808524:	48 83 ea 01          	sub    rdx,0x1
  808528:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  80852c:	48 63 d0             	movsxd rdx,eax
  80852f:	49 89 d6             	mov    r14,rdx
  808532:	41 bf 00 00 00 00    	mov    r15d,0x0
  808538:	48 63 d0             	movsxd rdx,eax
  80853b:	49 89 d4             	mov    r12,rdx
  80853e:	41 bd 00 00 00 00    	mov    r13d,0x0
  808544:	48 98                	cdqe   
  808546:	ba 10 00 00 00       	mov    edx,0x10
  80854b:	48 83 ea 01          	sub    rdx,0x1
  80854f:	48 01 d0             	add    rax,rdx
  808552:	be 10 00 00 00       	mov    esi,0x10
  808557:	ba 00 00 00 00       	mov    edx,0x0
  80855c:	48 f7 f6             	div    rsi
  80855f:	48 6b c0 10          	imul   rax,rax,0x10
  808563:	48 89 c1             	mov    rcx,rax
  808566:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  80856d:	48 89 e2             	mov    rdx,rsp
  808570:	48 29 ca             	sub    rdx,rcx
  808573:	48 39 d4             	cmp    rsp,rdx
  808576:	74 12                	je     80858a <read_file_byname+0x23d>
  808578:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  80857f:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  808586:	00 00 
  808588:	eb e9                	jmp    808573 <read_file_byname+0x226>
  80858a:	48 89 c2             	mov    rdx,rax
  80858d:	81 e2 ff 0f 00 00    	and    edx,0xfff
  808593:	48 29 d4             	sub    rsp,rdx
  808596:	48 89 c2             	mov    rdx,rax
  808599:	81 e2 ff 0f 00 00    	and    edx,0xfff
  80859f:	48 85 d2             	test   rdx,rdx
  8085a2:	74 10                	je     8085b4 <read_file_byname+0x267>
  8085a4:	25 ff 0f 00 00       	and    eax,0xfff
  8085a9:	48 83 e8 08          	sub    rax,0x8
  8085ad:	48 01 e0             	add    rax,rsp
  8085b0:	48 83 08 00          	or     QWORD PTR [rax],0x0
  8085b4:	48 89 e0             	mov    rax,rsp
  8085b7:	48 83 c0 00          	add    rax,0x0
  8085bb:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of reading might be not aligned
    read_sec(temp,f_cluster+clu_sec_balance,superblock.secPerClu);
  8085bf:	0f b6 05 47 1f c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21f47]        # 42a50d <superblock+0xd>
  8085c6:	0f b6 d0             	movzx  edx,al
  8085c9:	8b 0d f1 1f 00 00    	mov    ecx,DWORD PTR [rip+0x1ff1]        # 80a5c0 <clu_sec_balance>
  8085cf:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8085d2:	01 c1                	add    ecx,eax
  8085d4:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8085d8:	89 ce                	mov    esi,ecx
  8085da:	48 89 c7             	mov    rdi,rax
  8085dd:	e8 5d f9 ff ff       	call   807f3f <read_sec>
    memcpy(dist,temp+pos,cluster_size-pos);
  8085e2:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8085e5:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  8085eb:	89 c2                	mov    edx,eax
  8085ed:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8085f3:	48 63 c8             	movsxd rcx,eax
  8085f6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8085fa:	48 01 c1             	add    rcx,rax
  8085fd:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  808604:	48 89 ce             	mov    rsi,rcx
  808607:	48 89 c7             	mov    rdi,rax
  80860a:	e8 17 14 00 00       	call   809a26 <memcpy>
    dist+=cluster_size-pos;
  80860f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808612:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  808618:	48 98                	cdqe   
  80861a:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
    len-=cluster_size-pos;
  808621:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808624:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80862a:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  808630:	eb 4c                	jmp    80867e <read_file_byname+0x331>
    {
        f_cluster=fat[f_cluster];
  808632:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808635:	48 98                	cdqe   
  808637:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  80863e:	00 
  80863f:	98                   	cwde   
  808640:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
        read_sec(dist,f_cluster+clu_sec_balance,superblock.secPerClu);
  808643:	0f b6 05 c3 1e c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21ec3]        # 42a50d <superblock+0xd>
  80864a:	0f b6 d0             	movzx  edx,al
  80864d:	8b 0d 6d 1f 00 00    	mov    ecx,DWORD PTR [rip+0x1f6d]        # 80a5c0 <clu_sec_balance>
  808653:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808656:	01 c1                	add    ecx,eax
  808658:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  80865f:	89 ce                	mov    esi,ecx
  808661:	48 89 c7             	mov    rdi,rax
  808664:	e8 d6 f8 ff ff       	call   807f3f <read_sec>
        dist+=cluster_size;
  808669:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80866c:	48 98                	cdqe   
  80866e:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  808675:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808678:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
    while (f_cluster<FAT_EOF&&len>0)
  80867e:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808685:	7f 09                	jg     808690 <read_file_byname+0x343>
  808687:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  80868e:	7f a2                	jg     808632 <read_file_byname+0x2e5>
    }
    return 0;
  808690:	b8 00 00 00 00       	mov    eax,0x0
  808695:	48 89 dc             	mov    rsp,rbx
    
}
  808698:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  80869c:	5b                   	pop    rbx
  80869d:	41 5c                	pop    r12
  80869f:	41 5d                	pop    r13
  8086a1:	41 5e                	pop    r14
  8086a3:	41 5f                	pop    r15
  8086a5:	5d                   	pop    rbp
  8086a6:	c3                   	ret    

00000000008086a7 <write_file_byname>:
int write_file_byname(char *full_name,char *src,int pos,int len)
{
  8086a7:	f3 0f 1e fa          	endbr64 
  8086ab:	55                   	push   rbp
  8086ac:	48 89 e5             	mov    rbp,rsp
  8086af:	41 57                	push   r15
  8086b1:	41 56                	push   r14
  8086b3:	41 55                	push   r13
  8086b5:	41 54                	push   r12
  8086b7:	53                   	push   rbx
  8086b8:	48 81 ec 88 00 00 00 	sub    rsp,0x88
  8086bf:	48 89 bd 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rdi
  8086c6:	48 89 b5 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rsi
  8086cd:	89 95 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],edx
  8086d3:	89 8d 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],ecx
  8086d9:	48 89 e0             	mov    rax,rsp
  8086dc:	48 89 c3             	mov    rbx,rax
    int index= find(NULL);
  8086df:	bf 00 00 00 00       	mov    edi,0x0
  8086e4:	e8 24 fb ff ff       	call   80820d <find>
  8086e9:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
    if(index==-1||pos<0)
  8086ec:	83 7d cc ff          	cmp    DWORD PTR [rbp-0x34],0xffffffff
  8086f0:	74 09                	je     8086fb <write_file_byname+0x54>
  8086f2:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  8086f9:	79 0a                	jns    808705 <write_file_byname+0x5e>
        return -1;
  8086fb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808700:	e9 1e 03 00 00       	jmp    808a23 <write_file_byname+0x37c>
    
    //default set to 512
    int max_files=MAX_FILES_PER_DIR;
  808705:	c7 45 b0 00 02 00 00 	mov    DWORD PTR [rbp-0x50],0x200
    dir_entry *dir_table=root_dir;
  80870c:	48 c7 45 c0 40 a5 42 	mov    QWORD PTR [rbp-0x40],0x42a540
  808713:	00 
    int in_root=1;
  808714:	c7 45 bc 01 00 00 00 	mov    DWORD PTR [rbp-0x44],0x1
    if(cur_dir.fistCluNum!=0)
  80871b:	0f b7 05 38 5e c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc25e38]        # 42e55a <cur_dir+0x1a>
  808722:	66 85 c0             	test   ax,ax
  808725:	74 40                	je     808767 <write_file_byname+0xc0>
    {
        //regular dir
        in_root=0;
  808727:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
        max_files=16;
  80872e:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
        superblock.secPerClu);
  808735:	0f b6 05 d1 1d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21dd1]        # 42a50d <superblock+0xd>
        read_sec(a_clu_of_dir,cur_dir.fistCluNum+clu_sec_balance,\
  80873c:	0f b6 c0             	movzx  eax,al
  80873f:	0f b7 15 14 5e c2 ff 	movzx  edx,WORD PTR [rip+0xffffffffffc25e14]        # 42e55a <cur_dir+0x1a>
  808746:	0f b7 ca             	movzx  ecx,dx
  808749:	8b 15 71 1e 00 00    	mov    edx,DWORD PTR [rip+0x1e71]        # 80a5c0 <clu_sec_balance>
  80874f:	01 d1                	add    ecx,edx
  808751:	89 c2                	mov    edx,eax
  808753:	89 ce                	mov    esi,ecx
  808755:	bf 60 e5 42 00       	mov    edi,0x42e560
  80875a:	e8 e0 f7 ff ff       	call   807f3f <read_sec>
        dir_table=a_clu_of_dir;
  80875f:	48 c7 45 c0 60 e5 42 	mov    QWORD PTR [rbp-0x40],0x42e560
  808766:	00 
    }
    //current cluster you're at
    unsigned short cluster=cur_dir.fistCluNum;
  808767:	0f b7 05 ec 5d c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc25dec]        # 42e55a <cur_dir+0x1a>
  80876e:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  808772:	eb 41                	jmp    8087b5 <write_file_byname+0x10e>
        index-=16;
  808774:	83 6d cc 10          	sub    DWORD PTR [rbp-0x34],0x10
        if(cluster<FAT_EOF)
  808778:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  80877d:	77 36                	ja     8087b5 <write_file_byname+0x10e>
        {
            cluster=fat[cluster];
  80877f:	0f b7 45 ba          	movzx  eax,WORD PTR [rbp-0x46]
  808783:	48 98                	cdqe   
  808785:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  80878c:	00 
  80878d:	66 89 45 ba          	mov    WORD PTR [rbp-0x46],ax
            //update
            //if you can reach here it means it's a regular dir
            read_sec(dir_table,cluster+clu_sec_balance,\
            superblock.secPerClu);
  808791:	0f b6 05 75 1d c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21d75]        # 42a50d <superblock+0xd>
            read_sec(dir_table,cluster+clu_sec_balance,\
  808798:	0f b6 d0             	movzx  edx,al
  80879b:	0f b7 4d ba          	movzx  ecx,WORD PTR [rbp-0x46]
  80879f:	8b 05 1b 1e 00 00    	mov    eax,DWORD PTR [rip+0x1e1b]        # 80a5c0 <clu_sec_balance>
  8087a5:	01 c1                	add    ecx,eax
  8087a7:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8087ab:	89 ce                	mov    esi,ecx
  8087ad:	48 89 c7             	mov    rdi,rax
  8087b0:	e8 8a f7 ff ff       	call   807f3f <read_sec>
    while(!in_root&&index>=16&&cluster<FAT_EOF){
  8087b5:	83 7d bc 00          	cmp    DWORD PTR [rbp-0x44],0x0
  8087b9:	75 0d                	jne    8087c8 <write_file_byname+0x121>
  8087bb:	83 7d cc 0f          	cmp    DWORD PTR [rbp-0x34],0xf
  8087bf:	7e 07                	jle    8087c8 <write_file_byname+0x121>
  8087c1:	66 83 7d ba f6       	cmp    WORD PTR [rbp-0x46],0xfff6
  8087c6:	76 ac                	jbe    808774 <write_file_byname+0xcd>
        }
    }
    //arrived
    dir_entry file=dir_table[index];
  8087c8:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8087cb:	48 98                	cdqe   
  8087cd:	48 c1 e0 05          	shl    rax,0x5
  8087d1:	48 89 c2             	mov    rdx,rax
  8087d4:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8087d8:	48 8d 0c 02          	lea    rcx,[rdx+rax*1]
  8087dc:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  8087df:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  8087e3:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  8087ea:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  8087f1:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  8087f5:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  8087f9:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
  8087fd:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
    int f_cluster = file.fistCluNum;
  808801:	0f b7 45 8a          	movzx  eax,WORD PTR [rbp-0x76]
  808805:	0f b7 c0             	movzx  eax,ax
  808808:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    int cluster_size=superblock.bytesPerSec*superblock.secPerClu;
  80880b:	0f b7 05 f9 1c c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21cf9]        # 42a50b <superblock+0xb>
  808812:	0f b7 d0             	movzx  edx,ax
  808815:	0f b6 05 f1 1c c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21cf1]        # 42a50d <superblock+0xd>
  80881c:	0f b6 c0             	movzx  eax,al
  80881f:	0f af c2             	imul   eax,edx
  808822:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  808825:	eb 25                	jmp    80884c <write_file_byname+0x1a5>
    {
        pos-=cluster_size;
  808827:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80882a:	29 85 5c ff ff ff    	sub    DWORD PTR [rbp-0xa4],eax
        if(pos<cluster_size)
  808830:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808836:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808839:	7c 1e                	jl     808859 <write_file_byname+0x1b2>
            break;
        f_cluster=fat[f_cluster];
  80883b:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80883e:	48 98                	cdqe   
  808840:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808847:	00 
  808848:	98                   	cwde   
  808849:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while(fat[f_cluster]<FAT_EOF&&pos>=cluster_size)
  80884c:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808852:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  808855:	7d d0                	jge    808827 <write_file_byname+0x180>
  808857:	eb 01                	jmp    80885a <write_file_byname+0x1b3>
            break;
  808859:	90                   	nop
    }
    if(f_cluster>=FAT_EOF&&pos>=cluster_size)
  80885a:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  808861:	7e 15                	jle    808878 <write_file_byname+0x1d1>
  808863:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808869:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  80886c:	7c 0a                	jl     808878 <write_file_byname+0x1d1>
        return -1;//pos out of range
  80886e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808873:	e9 ab 01 00 00       	jmp    808a23 <write_file_byname+0x37c>
    //
    char temp[cluster_size];
  808878:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80887b:	48 63 d0             	movsxd rdx,eax
  80887e:	48 83 ea 01          	sub    rdx,0x1
  808882:	48 89 55 a0          	mov    QWORD PTR [rbp-0x60],rdx
  808886:	48 63 d0             	movsxd rdx,eax
  808889:	49 89 d6             	mov    r14,rdx
  80888c:	41 bf 00 00 00 00    	mov    r15d,0x0
  808892:	48 63 d0             	movsxd rdx,eax
  808895:	49 89 d4             	mov    r12,rdx
  808898:	41 bd 00 00 00 00    	mov    r13d,0x0
  80889e:	48 98                	cdqe   
  8088a0:	ba 10 00 00 00       	mov    edx,0x10
  8088a5:	48 83 ea 01          	sub    rdx,0x1
  8088a9:	48 01 d0             	add    rax,rdx
  8088ac:	be 10 00 00 00       	mov    esi,0x10
  8088b1:	ba 00 00 00 00       	mov    edx,0x0
  8088b6:	48 f7 f6             	div    rsi
  8088b9:	48 6b c0 10          	imul   rax,rax,0x10
  8088bd:	48 89 c1             	mov    rcx,rax
  8088c0:	48 81 e1 00 f0 ff ff 	and    rcx,0xfffffffffffff000
  8088c7:	48 89 e2             	mov    rdx,rsp
  8088ca:	48 29 ca             	sub    rdx,rcx
  8088cd:	48 39 d4             	cmp    rsp,rdx
  8088d0:	74 12                	je     8088e4 <write_file_byname+0x23d>
  8088d2:	48 81 ec 00 10 00 00 	sub    rsp,0x1000
  8088d9:	48 83 8c 24 f8 0f 00 	or     QWORD PTR [rsp+0xff8],0x0
  8088e0:	00 00 
  8088e2:	eb e9                	jmp    8088cd <write_file_byname+0x226>
  8088e4:	48 89 c2             	mov    rdx,rax
  8088e7:	81 e2 ff 0f 00 00    	and    edx,0xfff
  8088ed:	48 29 d4             	sub    rsp,rdx
  8088f0:	48 89 c2             	mov    rdx,rax
  8088f3:	81 e2 ff 0f 00 00    	and    edx,0xfff
  8088f9:	48 85 d2             	test   rdx,rdx
  8088fc:	74 10                	je     80890e <write_file_byname+0x267>
  8088fe:	25 ff 0f 00 00       	and    eax,0xfff
  808903:	48 83 e8 08          	sub    rax,0x8
  808907:	48 01 e0             	add    rax,rsp
  80890a:	48 83 08 00          	or     QWORD PTR [rax],0x0
  80890e:	48 89 e0             	mov    rax,rsp
  808911:	48 83 c0 00          	add    rax,0x0
  808915:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    //the first time of writing might not be aligned
    if(pos>0)
  808919:	83 bd 5c ff ff ff 00 	cmp    DWORD PTR [rbp-0xa4],0x0
  808920:	0f 8e a2 00 00 00    	jle    8089c8 <write_file_byname+0x321>
    {
        memcpy(temp+pos,src,cluster_size-pos);
  808926:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808929:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80892f:	89 c2                	mov    edx,eax
  808931:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  808937:	48 63 c8             	movsxd rcx,eax
  80893a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80893e:	48 01 c1             	add    rcx,rax
  808941:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  808948:	48 89 c6             	mov    rsi,rax
  80894b:	48 89 cf             	mov    rdi,rcx
  80894e:	e8 d3 10 00 00       	call   809a26 <memcpy>
        write_sec(temp,f_cluster,cluster_size-pos);
  808953:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  808956:	2b 85 5c ff ff ff    	sub    eax,DWORD PTR [rbp-0xa4]
  80895c:	89 c2                	mov    edx,eax
  80895e:	8b 4d b4             	mov    ecx,DWORD PTR [rbp-0x4c]
  808961:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808965:	89 ce                	mov    esi,ecx
  808967:	48 89 c7             	mov    rdi,rax
  80896a:	e8 dc ee ff ff       	call   80784b <write_sec>
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  80896f:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808972:	48 98                	cdqe   
  808974:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  80897b:	00 
  80897c:	98                   	cwde   
  80897d:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    }
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  808980:	eb 46                	jmp    8089c8 <write_file_byname+0x321>
    {
        write_sec(src,f_cluster+clu_sec_balance,cluster_size);
  808982:	8b 15 38 1c 00 00    	mov    edx,DWORD PTR [rip+0x1c38]        # 80a5c0 <clu_sec_balance>
  808988:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80898b:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  80898e:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  808991:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  808998:	89 ce                	mov    esi,ecx
  80899a:	48 89 c7             	mov    rdi,rax
  80899d:	e8 a9 ee ff ff       	call   80784b <write_sec>
        src+=cluster_size;
  8089a2:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8089a5:	48 98                	cdqe   
  8089a7:	48 01 85 60 ff ff ff 	add    QWORD PTR [rbp-0xa0],rax
        len-=cluster_size;
  8089ae:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8089b1:	29 85 58 ff ff ff    	sub    DWORD PTR [rbp-0xa8],eax
        if(fat[f_cluster]>=FAT_EOF&&len>0)
        {
            //extend
            extend_cluster(f_cluster);
        }
        f_cluster=fat[f_cluster];
  8089b7:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8089ba:	48 98                	cdqe   
  8089bc:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  8089c3:	00 
  8089c4:	98                   	cwde   
  8089c5:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    while (f_cluster<FAT_EOF&&len>=cluster_size)
  8089c8:	81 7d b4 f6 ff 00 00 	cmp    DWORD PTR [rbp-0x4c],0xfff6
  8089cf:	7f 0b                	jg     8089dc <write_file_byname+0x335>
  8089d1:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa8]
  8089d7:	3b 45 ac             	cmp    eax,DWORD PTR [rbp-0x54]
  8089da:	7d a6                	jge    808982 <write_file_byname+0x2db>
    }
    if(len>0)
  8089dc:	83 bd 58 ff ff ff 00 	cmp    DWORD PTR [rbp-0xa8],0x0
  8089e3:	7e 39                	jle    808a1e <write_file_byname+0x377>
    {
        //there might be some leftover less than a cluster
        memcpy(temp,src,len);
  8089e5:	8b 95 58 ff ff ff    	mov    edx,DWORD PTR [rbp-0xa8]
  8089eb:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  8089f2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8089f6:	48 89 ce             	mov    rsi,rcx
  8089f9:	48 89 c7             	mov    rdi,rax
  8089fc:	e8 25 10 00 00       	call   809a26 <memcpy>
        write_sec(temp,f_cluster+clu_sec_balance,cluster_size);
  808a01:	8b 15 b9 1b 00 00    	mov    edx,DWORD PTR [rip+0x1bb9]        # 80a5c0 <clu_sec_balance>
  808a07:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  808a0a:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  808a0d:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  808a10:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808a14:	89 ce                	mov    esi,ecx
  808a16:	48 89 c7             	mov    rdi,rax
  808a19:	e8 2d ee ff ff       	call   80784b <write_sec>
    }
    return 0;
  808a1e:	b8 00 00 00 00       	mov    eax,0x0
  808a23:	48 89 dc             	mov    rsp,rbx

}
  808a26:	48 8d 65 d8          	lea    rsp,[rbp-0x28]
  808a2a:	5b                   	pop    rbx
  808a2b:	41 5c                	pop    r12
  808a2d:	41 5d                	pop    r13
  808a2f:	41 5e                	pop    r14
  808a31:	41 5f                	pop    r15
  808a33:	5d                   	pop    rbp
  808a34:	c3                   	ret    

0000000000808a35 <file_exist>:


int file_exist(dir_entry entry)
{
  808a35:	f3 0f 1e fa          	endbr64 
  808a39:	55                   	push   rbp
  808a3a:	48 89 e5             	mov    rbp,rsp
    if((unsigned char)entry.name[0]==0xe5u||\
  808a3d:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
  808a41:	3c e5                	cmp    al,0xe5
  808a43:	74 08                	je     808a4d <file_exist+0x18>
    (unsigned char)entry.name[0]==0u)
  808a45:	0f b6 45 10          	movzx  eax,BYTE PTR [rbp+0x10]
    if((unsigned char)entry.name[0]==0xe5u||\
  808a49:	84 c0                	test   al,al
  808a4b:	75 07                	jne    808a54 <file_exist+0x1f>
    {
        //printf("file not exist\n");
        return 0;
  808a4d:	b8 00 00 00 00       	mov    eax,0x0
  808a52:	eb 05                	jmp    808a59 <file_exist+0x24>

    }
    return 1;
  808a54:	b8 01 00 00 00       	mov    eax,0x1
}
  808a59:	5d                   	pop    rbp
  808a5a:	c3                   	ret    

0000000000808a5b <get_entry>:
int get_entry(driver_args* args)
{
  808a5b:	f3 0f 1e fa          	endbr64 
  808a5f:	55                   	push   rbp
  808a60:	48 89 e5             	mov    rbp,rsp
  808a63:	53                   	push   rbx
  808a64:	48 81 ec e8 00 00 00 	sub    rsp,0xe8
  808a6b:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
    char *name=args->path;
  808a72:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808a79:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  808a7d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    dir_entry dir;
    dir.fistCluNum=((vfs_dir_entry*)args->cwd)->id;
  808a81:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808a88:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  808a8f:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808a92:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    dir_entry entry;
    vfs_dir_entry ret;
    entry.name[0]=0xe5;
  808a96:	c6 45 90 e5          	mov    BYTE PTR [rbp-0x70],0xe5

    char *p=name;
  808a9a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808a9e:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    char nametmp[12];
    int index=-1;
  808aa2:	c7 45 dc ff ff ff ff 	mov    DWORD PTR [rbp-0x24],0xffffffff
    while(*name!='\0')
  808aa9:	e9 2c 01 00 00       	jmp    808bda <get_entry+0x17f>
    {
        if(*name=='/')
  808aae:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808ab2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808ab5:	3c 2f                	cmp    al,0x2f
  808ab7:	0f 85 18 01 00 00    	jne    808bd5 <get_entry+0x17a>
        {
            if(name-p>11)return -1;
  808abd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808ac1:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  808ac5:	48 83 f8 0b          	cmp    rax,0xb
  808ac9:	7e 0a                	jle    808ad5 <get_entry+0x7a>
  808acb:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808ad0:	e9 50 02 00 00       	jmp    808d25 <get_entry+0x2ca>
            memcpy(nametmp,p,name-p);
  808ad5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808ad9:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
  808add:	89 c2                	mov    edx,eax
  808adf:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  808ae3:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  808aea:	48 89 ce             	mov    rsi,rcx
  808aed:	48 89 c7             	mov    rdi,rax
  808af0:	e8 31 0f 00 00       	call   809a26 <memcpy>
            cur_dir=dir;
  808af5:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808af9:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808afd:	48 89 05 3c 5a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc25a3c],rax        # 42e540 <cur_dir>
  808b04:	48 89 15 3d 5a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc25a3d],rdx        # 42e548 <cur_dir+0x8>
  808b0b:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808b0f:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  808b13:	48 89 05 36 5a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc25a36],rax        # 42e550 <cur_dir+0x10>
  808b1a:	48 89 15 37 5a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc25a37],rdx        # 42e558 <cur_dir+0x18>
            format_name(nametmp);
  808b21:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  808b28:	48 89 c7             	mov    rdi,rax
  808b2b:	e8 c3 eb ff ff       	call   8076f3 <format_name>
            index= find(nametmp);
  808b30:	48 8d 85 24 ff ff ff 	lea    rax,[rbp-0xdc]
  808b37:	48 89 c7             	mov    rdi,rax
  808b3a:	e8 ce f6 ff ff       	call   80820d <find>
  808b3f:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            if(index==-1)return -1;
  808b42:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  808b46:	75 0a                	jne    808b52 <get_entry+0xf7>
  808b48:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808b4d:	e9 d3 01 00 00       	jmp    808d25 <get_entry+0x2ca>
            if(cur_dir.fistCluNum==0)//在根目录
  808b52:	0f b7 05 01 5a c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc25a01]        # 42e55a <cur_dir+0x1a>
  808b59:	66 85 c0             	test   ax,ax
  808b5c:	75 31                	jne    808b8f <get_entry+0x134>
                dir=root_dir[index];
  808b5e:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808b61:	48 98                	cdqe   
  808b63:	48 c1 e0 05          	shl    rax,0x5
  808b67:	48 8d 88 40 a5 42 00 	lea    rcx,[rax+0x42a540]
  808b6e:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808b71:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808b75:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  808b79:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  808b7d:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808b81:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808b85:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  808b89:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
  808b8d:	eb 3a                	jmp    808bc9 <get_entry+0x16e>
            else//在子目录
                dir=a_clu_of_dir[index%16];
  808b8f:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808b92:	99                   	cdq    
  808b93:	c1 ea 1c             	shr    edx,0x1c
  808b96:	01 d0                	add    eax,edx
  808b98:	83 e0 0f             	and    eax,0xf
  808b9b:	29 d0                	sub    eax,edx
  808b9d:	48 98                	cdqe   
  808b9f:	48 c1 e0 05          	shl    rax,0x5
  808ba3:	48 8d 88 60 e5 42 00 	lea    rcx,[rax+0x42e560]
  808baa:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808bad:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808bb1:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
  808bb5:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
  808bb9:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808bbd:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808bc1:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
  808bc5:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
            p=name+1;
  808bc9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808bcd:	48 83 c0 01          	add    rax,0x1
  808bd1:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        }
        name++;
  808bd5:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
    while(*name!='\0')
  808bda:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808bde:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808be1:	84 c0                	test   al,al
  808be3:	0f 85 c5 fe ff ff    	jne    808aae <get_entry+0x53>
    }

    //现在就可以开始找文件了
    format_name(p);
  808be9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808bed:	48 89 c7             	mov    rdi,rax
  808bf0:	e8 fe ea ff ff       	call   8076f3 <format_name>
    index= find(p);
  808bf5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808bf9:	48 89 c7             	mov    rdi,rax
  808bfc:	e8 0c f6 ff ff       	call   80820d <find>
  808c01:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    if(index==-1)return -1;
  808c04:	83 7d dc ff          	cmp    DWORD PTR [rbp-0x24],0xffffffff
  808c08:	75 0a                	jne    808c14 <get_entry+0x1b9>
  808c0a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808c0f:	e9 11 01 00 00       	jmp    808d25 <get_entry+0x2ca>
    
    if(cur_dir.fistCluNum==0)//在根目录
  808c14:	0f b7 05 3f 59 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2593f]        # 42e55a <cur_dir+0x1a>
  808c1b:	66 85 c0             	test   ax,ax
  808c1e:	75 31                	jne    808c51 <get_entry+0x1f6>
        entry=root_dir[index];
  808c20:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808c23:	48 98                	cdqe   
  808c25:	48 c1 e0 05          	shl    rax,0x5
  808c29:	48 8d 88 40 a5 42 00 	lea    rcx,[rax+0x42a540]
  808c30:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808c33:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808c37:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  808c3b:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  808c3f:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808c43:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808c47:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  808c4b:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
  808c4f:	eb 3a                	jmp    808c8b <get_entry+0x230>
    else//在子目录
        entry=a_clu_of_dir[index%16];
  808c51:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  808c54:	99                   	cdq    
  808c55:	c1 ea 1c             	shr    edx,0x1c
  808c58:	01 d0                	add    eax,edx
  808c5a:	83 e0 0f             	and    eax,0xf
  808c5d:	29 d0                	sub    eax,edx
  808c5f:	48 98                	cdqe   
  808c61:	48 c1 e0 05          	shl    rax,0x5
  808c65:	48 8d 88 60 e5 42 00 	lea    rcx,[rax+0x42e560]
  808c6c:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  808c6f:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
  808c73:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
  808c77:	48 89 55 98          	mov    QWORD PTR [rbp-0x68],rdx
  808c7b:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
  808c7f:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
  808c83:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
  808c87:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
    ret.id=entry.fistCluNum;
  808c8b:	0f b7 45 aa          	movzx  eax,WORD PTR [rbp-0x56]
  808c8f:	0f b7 c0             	movzx  eax,ax
  808c92:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    args->entry=ret;
  808c98:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  808c9f:	48 8b 8d 30 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd0]
  808ca6:	48 8b 9d 38 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xc8]
  808cad:	48 89 48 28          	mov    QWORD PTR [rax+0x28],rcx
  808cb1:	48 89 58 30          	mov    QWORD PTR [rax+0x30],rbx
  808cb5:	48 8b 8d 40 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xc0]
  808cbc:	48 8b 9d 48 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xb8]
  808cc3:	48 89 48 38          	mov    QWORD PTR [rax+0x38],rcx
  808cc7:	48 89 58 40          	mov    QWORD PTR [rax+0x40],rbx
  808ccb:	48 8b 8d 50 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xb0]
  808cd2:	48 8b 9d 58 ff ff ff 	mov    rbx,QWORD PTR [rbp-0xa8]
  808cd9:	48 89 48 48          	mov    QWORD PTR [rax+0x48],rcx
  808cdd:	48 89 58 50          	mov    QWORD PTR [rax+0x50],rbx
  808ce1:	48 8b 8d 60 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xa0]
  808ce8:	48 8b 9d 68 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x98]
  808cef:	48 89 48 58          	mov    QWORD PTR [rax+0x58],rcx
  808cf3:	48 89 58 60          	mov    QWORD PTR [rax+0x60],rbx
  808cf7:	48 8b 8d 70 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x90]
  808cfe:	48 8b 9d 78 ff ff ff 	mov    rbx,QWORD PTR [rbp-0x88]
  808d05:	48 89 48 68          	mov    QWORD PTR [rax+0x68],rcx
  808d09:	48 89 58 70          	mov    QWORD PTR [rax+0x70],rbx
  808d0d:	48 8b 4d 80          	mov    rcx,QWORD PTR [rbp-0x80]
  808d11:	48 8b 5d 88          	mov    rbx,QWORD PTR [rbp-0x78]
  808d15:	48 89 48 78          	mov    QWORD PTR [rax+0x78],rcx
  808d19:	48 89 98 80 00 00 00 	mov    QWORD PTR [rax+0x80],rbx
    return 0;
  808d20:	b8 00 00 00 00       	mov    eax,0x0
}
  808d25:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  808d29:	c9                   	leave  
  808d2a:	c3                   	ret    

0000000000808d2b <get_fname>:
        dir=strtok(NULL,'/');
    }
    return 0;
}*/
void get_fname(char *path,char *name)
{
  808d2b:	f3 0f 1e fa          	endbr64 
  808d2f:	55                   	push   rbp
  808d30:	48 89 e5             	mov    rbp,rsp
  808d33:	48 83 ec 20          	sub    rsp,0x20
  808d37:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  808d3b:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    char *prev,*ptr=strtok(path,'/');
  808d3f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808d43:	be 2f 00 00 00       	mov    esi,0x2f
  808d48:	48 89 c7             	mov    rdi,rax
  808d4b:	e8 18 0e 00 00       	call   809b68 <strtok>
  808d50:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  808d54:	eb 1b                	jmp    808d71 <get_fname+0x46>
    {
        prev=ptr;
  808d56:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808d5a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        ptr=strtok(NULL,'/');
  808d5e:	be 2f 00 00 00       	mov    esi,0x2f
  808d63:	bf 00 00 00 00       	mov    edi,0x0
  808d68:	e8 fb 0d 00 00       	call   809b68 <strtok>
  808d6d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    while(ptr!=NULL)
  808d71:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  808d76:	75 de                	jne    808d56 <get_fname+0x2b>
    }
    strcpy(name,prev);
  808d78:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  808d7c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808d80:	48 89 d6             	mov    rsi,rdx
  808d83:	48 89 c7             	mov    rdi,rax
  808d86:	e8 99 0d 00 00       	call   809b24 <strcpy>
}
  808d8b:	90                   	nop
  808d8c:	c9                   	leave  
  808d8d:	c3                   	ret    

0000000000808d8e <read_file>:
char buf[1024];
int read_file(driver_args* args)
{
  808d8e:	f3 0f 1e fa          	endbr64 
  808d92:	55                   	push   rbp
  808d93:	48 89 e5             	mov    rbp,rsp
  808d96:	48 83 ec 60          	sub    rsp,0x60
  808d9a:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
    int len=args->len;
  808d9e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808da2:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808da5:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int pos=args->pos;
  808da8:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808dac:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808daf:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  808db2:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808db6:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  808db9:	66 89 45 ca          	mov    WORD PTR [rbp-0x36],ax
    char* dist=args->dist_addr;
  808dbd:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808dc1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  808dc4:	48 98                	cdqe   
  808dc6:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int c=len/superblock.bytesPerSec;
  808dca:	0f b7 05 3a 17 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc2173a]        # 42a50b <superblock+0xb>
  808dd1:	0f b7 f0             	movzx  esi,ax
  808dd4:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808dd7:	99                   	cdq    
  808dd8:	f7 fe                	idiv   esi
  808dda:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    c+=len%superblock.bytesPerSec?1:0;
  808ddd:	0f b7 05 27 17 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21727]        # 42a50b <superblock+0xb>
  808de4:	0f b7 c8             	movzx  ecx,ax
  808de7:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808dea:	99                   	cdq    
  808deb:	f7 f9                	idiv   ecx
  808ded:	89 d0                	mov    eax,edx
  808def:	85 c0                	test   eax,eax
  808df1:	0f 95 c0             	setne  al
  808df4:	0f b6 c0             	movzx  eax,al
  808df7:	01 45 dc             	add    DWORD PTR [rbp-0x24],eax
    //printf("[fs]%d secs to sys_read.\n",c);
    int n=0;
  808dfa:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808e01:	0f b7 45 ca          	movzx  eax,WORD PTR [rbp-0x36]
  808e05:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    int mpos=pos/superblock.bytesPerSec;
  808e09:	0f b7 05 fb 16 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc216fb]        # 42a50b <superblock+0xb>
  808e10:	0f b7 f8             	movzx  edi,ax
  808e13:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808e16:	99                   	cdq    
  808e17:	f7 ff                	idiv   edi
  808e19:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  808e1c:	eb 16                	jmp    808e34 <read_file+0xa6>
    {
         clu=fat[clu];
  808e1e:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808e22:	48 98                	cdqe   
  808e24:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808e2b:	00 
  808e2c:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&mpos>0;mpos--)
  808e30:	83 6d e4 01          	sub    DWORD PTR [rbp-0x1c],0x1
  808e34:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808e39:	77 06                	ja     808e41 <read_file+0xb3>
  808e3b:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  808e3f:	7f dd                	jg     808e1e <read_file+0x90>
    }
    if(mpos>0)return -1;//读取位置超出范围
  808e41:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  808e45:	7e 0a                	jle    808e51 <read_file+0xc3>
  808e47:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808e4c:	e9 cd 00 00 00       	jmp    808f1e <read_file+0x190>
    pos%=superblock.bytesPerSec;
  808e51:	0f b7 05 b3 16 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc216b3]        # 42a50b <superblock+0xb>
  808e58:	0f b7 c8             	movzx  ecx,ax
  808e5b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808e5e:	99                   	cdq    
  808e5f:	f7 f9                	idiv   ecx
  808e61:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
    int block_size=superblock.secPerClu*superblock.bytesPerSec;
  808e64:	0f b6 05 a2 16 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc216a2]        # 42a50d <superblock+0xd>
  808e6b:	0f b6 d0             	movzx  edx,al
  808e6e:	0f b7 05 96 16 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21696]        # 42a50b <superblock+0xb>
  808e75:	0f b7 c0             	movzx  eax,ax
  808e78:	0f af c2             	imul   eax,edx
  808e7b:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    while(n<c)
  808e7e:	e9 89 00 00 00       	jmp    808f0c <read_file+0x17e>
    {
        read_sec(buf,clu+clu_sec_balance,superblock.secPerClu);
  808e83:	0f b6 05 83 16 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21683]        # 42a50d <superblock+0xd>
  808e8a:	0f b6 c0             	movzx  eax,al
  808e8d:	0f b7 4d ea          	movzx  ecx,WORD PTR [rbp-0x16]
  808e91:	8b 15 29 17 00 00    	mov    edx,DWORD PTR [rip+0x1729]        # 80a5c0 <clu_sec_balance>
  808e97:	01 d1                	add    ecx,edx
  808e99:	89 c2                	mov    edx,eax
  808e9b:	89 ce                	mov    esi,ecx
  808e9d:	bf 80 27 43 00       	mov    edi,0x432780
  808ea2:	e8 98 f0 ff ff       	call   807f3f <read_sec>
        //printf("%x+%x\n",buf,pos);
        int cplen=block_size-pos>len?len:block_size-pos;
  808ea7:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  808eaa:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  808ead:	8b 55 e0             	mov    edx,DWORD PTR [rbp-0x20]
  808eb0:	39 c2                	cmp    edx,eax
  808eb2:	0f 4e c2             	cmovle eax,edx
  808eb5:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
        memcpy(dist,buf+pos,cplen);
  808eb8:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  808ebb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808ebe:	48 98                	cdqe   
  808ec0:	48 8d 88 80 27 43 00 	lea    rcx,[rax+0x432780]
  808ec7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808ecb:	48 89 ce             	mov    rsi,rcx
  808ece:	48 89 c7             	mov    rdi,rax
  808ed1:	e8 50 0b 00 00       	call   809a26 <memcpy>
        n++;
  808ed6:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        dist+=block_size-pos;
  808eda:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  808edd:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
  808ee0:	48 98                	cdqe   
  808ee2:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        if(pos>0)pos=0;
  808ee6:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808eea:	7e 07                	jle    808ef3 <read_file+0x165>
  808eec:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        clu=fat[clu];
  808ef3:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808ef7:	48 98                	cdqe   
  808ef9:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808f00:	00 
  808f01:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  808f05:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808f0a:	77 0e                	ja     808f1a <read_file+0x18c>
    while(n<c)
  808f0c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808f0f:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  808f12:	0f 8c 6b ff ff ff    	jl     808e83 <read_file+0xf5>
  808f18:	eb 01                	jmp    808f1b <read_file+0x18d>
        if(clu>=FAT_EOF)break;
  808f1a:	90                   	nop
    }
    return n;
  808f1b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
}
  808f1e:	c9                   	leave  
  808f1f:	c3                   	ret    

0000000000808f20 <write_file>:
int write_file(driver_args* args)
{
  808f20:	f3 0f 1e fa          	endbr64 
  808f24:	55                   	push   rbp
  808f25:	48 89 e5             	mov    rbp,rsp
  808f28:	48 83 ec 50          	sub    rsp,0x50
  808f2c:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
    int len=args->len;
  808f30:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f34:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  808f37:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    int pos=args->pos;
  808f3a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f3e:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  808f41:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    dir_entry f;
    f.fistCluNum=args->entry.id;
  808f44:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f48:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  808f4b:	66 89 45 da          	mov    WORD PTR [rbp-0x26],ax
    char* src=args->src_addr;
  808f4f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808f53:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808f56:	48 98                	cdqe   
  808f58:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    pos/=superblock.bytesPerSec;
  808f5c:	0f b7 05 a8 15 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc215a8]        # 42a50b <superblock+0xb>
  808f63:	0f b7 f0             	movzx  esi,ax
  808f66:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808f69:	99                   	cdq    
  808f6a:	f7 fe                	idiv   esi
  808f6c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=len/512+len%512?1:0;
  808f6f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808f72:	8d 90 ff 01 00 00    	lea    edx,[rax+0x1ff]
  808f78:	85 c0                	test   eax,eax
  808f7a:	0f 48 c2             	cmovs  eax,edx
  808f7d:	c1 f8 09             	sar    eax,0x9
  808f80:	89 c1                	mov    ecx,eax
  808f82:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  808f85:	99                   	cdq    
  808f86:	c1 ea 17             	shr    edx,0x17
  808f89:	01 d0                	add    eax,edx
  808f8b:	25 ff 01 00 00       	and    eax,0x1ff
  808f90:	29 d0                	sub    eax,edx
  808f92:	01 c8                	add    eax,ecx
  808f94:	85 c0                	test   eax,eax
  808f96:	0f 95 c0             	setne  al
  808f99:	0f b6 c0             	movzx  eax,al
  808f9c:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    int n=0;
  808f9f:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    unsigned short clu=f.fistCluNum;
  808fa6:	0f b7 45 da          	movzx  eax,WORD PTR [rbp-0x26]
  808faa:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
    for(;clu<FAT_EOF&&pos>0;pos--,clu=fat[clu]);
  808fae:	eb 16                	jmp    808fc6 <write_file+0xa6>
  808fb0:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  808fb4:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  808fb8:	48 98                	cdqe   
  808fba:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  808fc1:	00 
  808fc2:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
  808fc6:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  808fcb:	77 06                	ja     808fd3 <write_file+0xb3>
  808fcd:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808fd1:	7f dd                	jg     808fb0 <write_file+0x90>
    if(pos>0)return -1;//读取位置超出范围
  808fd3:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  808fd7:	7e 52                	jle    80902b <write_file+0x10b>
  808fd9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  808fde:	eb 59                	jmp    809039 <write_file+0x119>
    while(n<c)
    {
        write_sec(src,clu+clu_sec_balance,1);
  808fe0:	0f b7 55 ea          	movzx  edx,WORD PTR [rbp-0x16]
  808fe4:	8b 05 d6 15 00 00    	mov    eax,DWORD PTR [rip+0x15d6]        # 80a5c0 <clu_sec_balance>
  808fea:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  808fed:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808ff1:	ba 01 00 00 00       	mov    edx,0x1
  808ff6:	89 ce                	mov    esi,ecx
  808ff8:	48 89 c7             	mov    rdi,rax
  808ffb:	e8 4b e8 ff ff       	call   80784b <write_sec>
        n++;
  809000:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
        src+=superblock.bytesPerSec;
  809004:	0f b7 05 00 15 c2 ff 	movzx  eax,WORD PTR [rip+0xffffffffffc21500]        # 42a50b <superblock+0xb>
  80900b:	0f b7 c0             	movzx  eax,ax
  80900e:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
        clu=fat[clu];
  809012:	0f b7 45 ea          	movzx  eax,WORD PTR [rbp-0x16]
  809016:	48 98                	cdqe   
  809018:	0f b7 84 00 60 e7 42 	movzx  eax,WORD PTR [rax+rax*1+0x42e760]
  80901f:	00 
  809020:	66 89 45 ea          	mov    WORD PTR [rbp-0x16],ax
        if(clu>=FAT_EOF)break;
  809024:	66 83 7d ea f6       	cmp    WORD PTR [rbp-0x16],0xfff6
  809029:	77 0a                	ja     809035 <write_file+0x115>
    while(n<c)
  80902b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80902e:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  809031:	7c ad                	jl     808fe0 <write_file+0xc0>
  809033:	eb 01                	jmp    809036 <write_file+0x116>
        if(clu>=FAT_EOF)break;
  809035:	90                   	nop
    }
    return n;
  809036:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
    
  809039:	c9                   	leave  
  80903a:	c3                   	ret    

000000000080903b <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  80903b:	f3 0f 1e fa          	endbr64 
  80903f:	55                   	push   rbp
  809040:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  809043:	48 8b 05 46 9b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc29b46]        # 432b90 <vpage_base>
  80904a:	48 05 a0 00 00 00    	add    rax,0xa0
  809050:	48 89 05 39 9b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc29b39],rax        # 432b90 <vpage_base>
    page_boffset+=SCREEN_W*2;
  809057:	8b 05 3b 9b c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29b3b]        # 432b98 <page_boffset>
  80905d:	05 a0 00 00 00       	add    eax,0xa0
  809062:	89 05 30 9b c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29b30],eax        # 432b98 <page_boffset>
    if(vpage_base>=video_end)
  809068:	48 8b 15 21 9b c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc29b21]        # 432b90 <vpage_base>
  80906f:	48 8b 05 12 9b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc29b12]        # 432b88 <video_end>
  809076:	48 39 c2             	cmp    rdx,rax
  809079:	72 0e                	jb     809089 <scrdown+0x4e>
        vpage_base=video_base;
  80907b:	48 8b 05 fe 9a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc29afe]        # 432b80 <video_base>
  809082:	48 89 05 07 9b c2 ff 	mov    QWORD PTR [rip+0xffffffffffc29b07],rax        # 432b90 <vpage_base>
    set_origin();
  809089:	b8 00 00 00 00       	mov    eax,0x0
  80908e:	e8 6a 00 00 00       	call   8090fd <set_origin>
}
  809093:	90                   	nop
  809094:	5d                   	pop    rbp
  809095:	c3                   	ret    

0000000000809096 <scrup>:
void scrup()
{
  809096:	f3 0f 1e fa          	endbr64 
  80909a:	55                   	push   rbp
  80909b:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  80909e:	8b 05 f4 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29af4]        # 432b98 <page_boffset>
  8090a4:	85 c0                	test   eax,eax
  8090a6:	75 24                	jne    8090cc <scrup+0x36>
    {
        page_boffset=0;
  8090a8:	c7 05 e6 9a c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29ae6],0x0        # 432b98 <page_boffset>
  8090af:	00 00 00 
        vpage_base=video_base;
  8090b2:	48 8b 05 c7 9a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc29ac7]        # 432b80 <video_base>
  8090b9:	48 89 05 d0 9a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc29ad0],rax        # 432b90 <vpage_base>
        set_origin();
  8090c0:	b8 00 00 00 00       	mov    eax,0x0
  8090c5:	e8 33 00 00 00       	call   8090fd <set_origin>
        return;
  8090ca:	eb 2f                	jmp    8090fb <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  8090cc:	48 8b 05 bd 9a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc29abd]        # 432b90 <vpage_base>
  8090d3:	48 2d a0 00 00 00    	sub    rax,0xa0
  8090d9:	48 89 05 b0 9a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc29ab0],rax        # 432b90 <vpage_base>
    page_boffset-=SCREEN_W*2;
  8090e0:	8b 05 b2 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29ab2]        # 432b98 <page_boffset>
  8090e6:	2d a0 00 00 00       	sub    eax,0xa0
  8090eb:	89 05 a7 9a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29aa7],eax        # 432b98 <page_boffset>
    set_origin();
  8090f1:	b8 00 00 00 00       	mov    eax,0x0
  8090f6:	e8 02 00 00 00       	call   8090fd <set_origin>
}
  8090fb:	5d                   	pop    rbp
  8090fc:	c3                   	ret    

00000000008090fd <set_origin>:
void set_origin(void)
{
  8090fd:	f3 0f 1e fa          	endbr64 
  809101:	55                   	push   rbp
  809102:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  809105:	fa                   	cli    
    outb(port_reg_index,12);
  809106:	8b 05 9c 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a9c]        # 432ba8 <port_reg_index>
  80910c:	0f b7 c0             	movzx  eax,ax
  80910f:	be 0c 00 00 00       	mov    esi,0xc
  809114:	89 c7                	mov    edi,eax
  809116:	e8 75 bd ff ff       	call   804e90 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  80911b:	8b 05 77 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a77]        # 432b98 <page_boffset>
  809121:	c1 e8 09             	shr    eax,0x9
  809124:	0f b6 d0             	movzx  edx,al
  809127:	8b 05 7f 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a7f]        # 432bac <port_reg_v>
  80912d:	0f b7 c0             	movzx  eax,ax
  809130:	89 d6                	mov    esi,edx
  809132:	89 c7                	mov    edi,eax
  809134:	e8 57 bd ff ff       	call   804e90 <outb>
    outb(port_reg_index,13);
  809139:	8b 05 69 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a69]        # 432ba8 <port_reg_index>
  80913f:	0f b7 c0             	movzx  eax,ax
  809142:	be 0d 00 00 00       	mov    esi,0xd
  809147:	89 c7                	mov    edi,eax
  809149:	e8 42 bd ff ff       	call   804e90 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  80914e:	8b 05 44 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a44]        # 432b98 <page_boffset>
  809154:	d1 e8                	shr    eax,1
  809156:	0f b6 d0             	movzx  edx,al
  809159:	8b 05 4d 9a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29a4d]        # 432bac <port_reg_v>
  80915f:	0f b7 c0             	movzx  eax,ax
  809162:	89 d6                	mov    esi,edx
  809164:	89 c7                	mov    edi,eax
  809166:	e8 25 bd ff ff       	call   804e90 <outb>
    asm volatile("sti");
  80916b:	fb                   	sti    

}
  80916c:	90                   	nop
  80916d:	5d                   	pop    rbp
  80916e:	c3                   	ret    

000000000080916f <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  80916f:	f3 0f 1e fa          	endbr64 
  809173:	55                   	push   rbp
  809174:	48 89 e5             	mov    rbp,rsp
  809177:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  80917b:	be 48 26 81 00       	mov    esi,0x812648
  809180:	bf f4 24 81 00       	mov    edi,0x8124f4
  809185:	e8 9a 09 00 00       	call   809b24 <strcpy>
    strcpy(dev_stdout.name,"stdout");
  80918a:	be 4d 26 81 00       	mov    esi,0x81264d
  80918f:	bf b4 25 81 00       	mov    edi,0x8125b4
  809194:	e8 8b 09 00 00       	call   809b24 <strcpy>
    reg_driver(&drv_tty);
  809199:	bf 40 24 81 00       	mov    edi,0x812440
  80919e:	e8 5a 9c ff ff       	call   802dfd <reg_driver>
    reg_device(&dev_tty);
  8091a3:	bf e0 24 81 00       	mov    edi,0x8124e0
  8091a8:	e8 68 99 ff ff       	call   802b15 <reg_device>
    reg_device(&dev_stdout);
  8091ad:	bf a0 25 81 00       	mov    edi,0x8125a0
  8091b2:	e8 5e 99 ff ff       	call   802b15 <reg_device>
    unsigned char *vp=0x20000;
  8091b7:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  8091be:	00 
    if(*vp==0x7)
  8091bf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8091c3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8091c6:	3c 07                	cmp    al,0x7
  8091c8:	75 36                	jne    809200 <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  8091ca:	c7 05 c8 99 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc299c8],0x0        # 432b9c <video_mode>
  8091d1:	00 00 00 
        video_base=0xb0000;
  8091d4:	48 c7 05 a1 99 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc299a1],0xb0000        # 432b80 <video_base>
  8091db:	00 00 0b 00 
        video_end=0xb8000-1;
  8091df:	48 c7 05 9e 99 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2999e],0xb7fff        # 432b88 <video_end>
  8091e6:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  8091ea:	c7 05 b4 99 c2 ff b4 	mov    DWORD PTR [rip+0xffffffffffc299b4],0x3b4        # 432ba8 <port_reg_index>
  8091f1:	03 00 00 
        port_reg_v=0x3b5;
  8091f4:	c7 05 ae 99 c2 ff b5 	mov    DWORD PTR [rip+0xffffffffffc299ae],0x3b5        # 432bac <port_reg_v>
  8091fb:	03 00 00 
  8091fe:	eb 61                	jmp    809261 <init_tty+0xf2>
    }else if(*vp<=0x3)
  809200:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809204:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809207:	3c 03                	cmp    al,0x3
  809209:	77 36                	ja     809241 <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  80920b:	c7 05 87 99 c2 ff 01 	mov    DWORD PTR [rip+0xffffffffffc29987],0x1        # 432b9c <video_mode>
  809212:	00 00 00 
        video_base=0xb8000;
  809215:	48 c7 05 60 99 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc29960],0xb8000        # 432b80 <video_base>
  80921c:	00 80 0b 00 
        video_end=0xc0000-1;
  809220:	48 c7 05 5d 99 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2995d],0xbffff        # 432b88 <video_end>
  809227:	ff ff 0b 00 
        port_reg_index=0x3d4;
  80922b:	c7 05 73 99 c2 ff d4 	mov    DWORD PTR [rip+0xffffffffffc29973],0x3d4        # 432ba8 <port_reg_index>
  809232:	03 00 00 
        port_reg_v=0x3d5;
  809235:	c7 05 6d 99 c2 ff d5 	mov    DWORD PTR [rip+0xffffffffffc2996d],0x3d5        # 432bac <port_reg_v>
  80923c:	03 00 00 
  80923f:	eb 20                	jmp    809261 <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  809241:	c7 05 51 99 c2 ff 02 	mov    DWORD PTR [rip+0xffffffffffc29951],0x2        # 432b9c <video_mode>
  809248:	00 00 00 
        video_base=0xa0000;
  80924b:	48 c7 05 2a 99 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2992a],0xa0000        # 432b80 <video_base>
  809252:	00 00 0a 00 
        video_end=0xb0000-1;
  809256:	48 c7 05 27 99 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc29927],0xaffff        # 432b88 <video_end>
  80925d:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  809261:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809265:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809268:	3c 01                	cmp    al,0x1
  80926a:	77 0f                	ja     80927b <init_tty+0x10c>
  80926c:	c7 05 2e 99 c2 ff 28 	mov    DWORD PTR [rip+0xffffffffffc2992e],0x28        # 432ba4 <line_chs>
  809273:	00 00 00 
  809276:	e9 91 00 00 00       	jmp    80930c <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  80927b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80927f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809282:	3c 03                	cmp    al,0x3
  809284:	76 0b                	jbe    809291 <init_tty+0x122>
  809286:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80928a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80928d:	3c 07                	cmp    al,0x7
  80928f:	75 0c                	jne    80929d <init_tty+0x12e>
  809291:	c7 05 09 99 c2 ff 50 	mov    DWORD PTR [rip+0xffffffffffc29909],0x50        # 432ba4 <line_chs>
  809298:	00 00 00 
  80929b:	eb 6f                	jmp    80930c <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  80929d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092a1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092a4:	3c 05                	cmp    al,0x5
  8092a6:	76 16                	jbe    8092be <init_tty+0x14f>
  8092a8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092ac:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092af:	3c 09                	cmp    al,0x9
  8092b1:	74 0b                	je     8092be <init_tty+0x14f>
  8092b3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092b7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092ba:	3c 0d                	cmp    al,0xd
  8092bc:	75 0c                	jne    8092ca <init_tty+0x15b>
  8092be:	c7 05 dc 98 c2 ff 40 	mov    DWORD PTR [rip+0xffffffffffc298dc],0x140        # 432ba4 <line_chs>
  8092c5:	01 00 00 
  8092c8:	eb 42                	jmp    80930c <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  8092ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092ce:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092d1:	3c 06                	cmp    al,0x6
  8092d3:	74 16                	je     8092eb <init_tty+0x17c>
  8092d5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092d9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092dc:	3c 0a                	cmp    al,0xa
  8092de:	74 0b                	je     8092eb <init_tty+0x17c>
  8092e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092e4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092e7:	3c 0d                	cmp    al,0xd
  8092e9:	76 0c                	jbe    8092f7 <init_tty+0x188>
  8092eb:	c7 05 af 98 c2 ff 80 	mov    DWORD PTR [rip+0xffffffffffc298af],0x280        # 432ba4 <line_chs>
  8092f2:	02 00 00 
  8092f5:	eb 15                	jmp    80930c <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  8092f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092fb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8092fe:	3c 08                	cmp    al,0x8
  809300:	75 0a                	jne    80930c <init_tty+0x19d>
  809302:	c7 05 98 98 c2 ff a0 	mov    DWORD PTR [rip+0xffffffffffc29898],0xa0        # 432ba4 <line_chs>
  809309:	00 00 00 
    switch (*vp)
  80930c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809310:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809313:	0f b6 c0             	movzx  eax,al
  809316:	83 f8 14             	cmp    eax,0x14
  809319:	77 61                	ja     80937c <init_tty+0x20d>
  80931b:	89 c0                	mov    eax,eax
  80931d:	48 8b 04 c5 58 26 81 	mov    rax,QWORD PTR [rax*8+0x812658]
  809324:	00 
  809325:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  809328:	c7 05 7e 98 c2 ff e8 	mov    DWORD PTR [rip+0xffffffffffc2987e],0x3e8        # 432bb0 <vpage_size>
  80932f:	03 00 00 
  809332:	eb 49                	jmp    80937d <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  809334:	c7 05 72 98 c2 ff d0 	mov    DWORD PTR [rip+0xffffffffffc29872],0x7d0        # 432bb0 <vpage_size>
  80933b:	07 00 00 
  80933e:	eb 3d                	jmp    80937d <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  809340:	c7 05 66 98 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29866],0xfa00        # 432bb0 <vpage_size>
  809347:	fa 00 00 
  80934a:	eb 31                	jmp    80937d <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  80934c:	c7 05 5a 98 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2985a],0x1f400        # 432bb0 <vpage_size>
  809353:	f4 01 00 
  809356:	eb 25                	jmp    80937d <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  809358:	c7 05 4e 98 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2984e],0x7d00        # 432bb0 <vpage_size>
  80935f:	7d 00 00 
  809362:	eb 19                	jmp    80937d <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  809364:	c7 05 42 98 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29842],0x36b00        # 432bb0 <vpage_size>
  80936b:	6b 03 00 
  80936e:	eb 0d                	jmp    80937d <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  809370:	c7 05 36 98 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29836],0x4b000        # 432bb0 <vpage_size>
  809377:	b0 04 00 
  80937a:	eb 01                	jmp    80937d <init_tty+0x20e>
    default:
        break;
  80937c:	90                   	nop
    }
    m_ptr=video_base;
  80937d:	48 8b 05 fc 97 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc297fc]        # 432b80 <video_base>
  809384:	48 89 05 3d 12 00 00 	mov    QWORD PTR [rip+0x123d],rax        # 80a5c8 <m_ptr>
    page_boffset=0;
  80938b:	c7 05 03 98 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29803],0x0        # 432b98 <page_boffset>
  809392:	00 00 00 
    vpage_base=video_base;
  809395:	48 8b 05 e4 97 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc297e4]        # 432b80 <video_base>
  80939c:	48 89 05 ed 97 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc297ed],rax        # 432b90 <vpage_base>
    vp++;
  8093a3:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  8093a8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8093ac:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8093af:	0f b6 c0             	movzx  eax,al
  8093b2:	89 05 e8 97 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc297e8],eax        # 432ba0 <vpage>
    vp++;
  8093b8:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  8093bd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8093c1:	48 8d 50 01          	lea    rdx,[rax+0x1]
  8093c5:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8093c9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8093cc:	0f b6 c0             	movzx  eax,al
  8093cf:	89 05 e7 97 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc297e7],eax        # 432bbc <stline>
    endline=*vp++;
  8093d5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8093d9:	48 8d 50 01          	lea    rdx,[rax+0x1]
  8093dd:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8093e1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8093e4:	0f b6 c0             	movzx  eax,al
  8093e7:	89 05 d3 97 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc297d3],eax        # 432bc0 <endline>
    videoy=*vp++;
  8093ed:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8093f1:	48 8d 50 01          	lea    rdx,[rax+0x1]
  8093f5:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  8093f9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8093fc:	0f b6 c0             	movzx  eax,al
  8093ff:	89 05 b3 97 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc297b3],eax        # 432bb8 <videoy>
    videox=*vp;
  809405:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809409:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80940c:	0f b6 c0             	movzx  eax,al
  80940f:	89 05 9f 97 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2979f],eax        # 432bb4 <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  809415:	90                   	nop
  809416:	c9                   	leave  
  809417:	c3                   	ret    

0000000000809418 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  809418:	f3 0f 1e fa          	endbr64 
  80941c:	55                   	push   rbp
  80941d:	48 89 e5             	mov    rbp,rsp
  809420:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  809424:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809428:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  80942b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  80942e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809431:	05 00 c0 05 00       	add    eax,0x5c000
  809436:	01 c0                	add    eax,eax
  809438:	48 98                	cdqe   
  80943a:	48 89 05 87 11 00 00 	mov    QWORD PTR [rip+0x1187],rax        # 80a5c8 <m_ptr>
}
  809441:	90                   	nop
  809442:	5d                   	pop    rbp
  809443:	c3                   	ret    

0000000000809444 <tell_monitor>:
int tell_monitor()
{
  809444:	f3 0f 1e fa          	endbr64 
  809448:	55                   	push   rbp
  809449:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  80944c:	48 8b 05 75 11 00 00 	mov    rax,QWORD PTR [rip+0x1175]        # 80a5c8 <m_ptr>
  809453:	48 8b 15 26 97 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc29726]        # 432b80 <video_base>
  80945a:	48 29 d0             	sub    rax,rdx
  80945d:	48 89 c2             	mov    rdx,rax
  809460:	48 c1 ea 3f          	shr    rdx,0x3f
  809464:	48 01 d0             	add    rax,rdx
  809467:	48 d1 f8             	sar    rax,1
}
  80946a:	5d                   	pop    rbp
  80946b:	c3                   	ret    

000000000080946c <del_ch>:
void del_ch()
{
  80946c:	f3 0f 1e fa          	endbr64 
  809470:	55                   	push   rbp
  809471:	48 89 e5             	mov    rbp,rsp
  809474:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  80947b:	48 8b 05 46 11 00 00 	mov    rax,QWORD PTR [rip+0x1146]        # 80a5c8 <m_ptr>
  809482:	48 83 e8 02          	sub    rax,0x2
  809486:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  80948a:	b8 00 00 00 00       	mov    eax,0x0
  80948f:	e8 b0 ff ff ff       	call   809444 <tell_monitor>
  809494:	89 c2                	mov    edx,eax
  809496:	48 63 c2             	movsxd rax,edx
  809499:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  8094a0:	48 c1 e8 20          	shr    rax,0x20
  8094a4:	c1 f8 05             	sar    eax,0x5
  8094a7:	89 d1                	mov    ecx,edx
  8094a9:	c1 f9 1f             	sar    ecx,0x1f
  8094ac:	29 c8                	sub    eax,ecx
  8094ae:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  8094b1:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8094b4:	89 c8                	mov    eax,ecx
  8094b6:	c1 e0 02             	shl    eax,0x2
  8094b9:	01 c8                	add    eax,ecx
  8094bb:	c1 e0 04             	shl    eax,0x4
  8094be:	29 c2                	sub    edx,eax
  8094c0:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  8094c3:	eb 17                	jmp    8094dc <del_ch+0x70>
    {
        *p=*(p+2);
  8094c5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094c9:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  8094cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094d1:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  8094d3:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  8094d8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8094dc:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  8094e0:	7e e3                	jle    8094c5 <del_ch+0x59>
    }
    driver_args args= {
  8094e2:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  8094e9:	b8 00 00 00 00       	mov    eax,0x0
  8094ee:	b9 18 00 00 00       	mov    ecx,0x18
  8094f3:	48 89 d7             	mov    rdi,rdx
  8094f6:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  8094f9:	b8 00 00 00 00       	mov    eax,0x0
  8094fe:	e8 41 ff ff ff       	call   809444 <tell_monitor>
  809503:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  809506:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  80950c:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  809513:	48 89 c7             	mov    rdi,rax
  809516:	e8 fd fe ff ff       	call   809418 <seek_tty>
    set_cur();
  80951b:	b8 00 00 00 00       	mov    eax,0x0
  809520:	e8 03 00 00 00       	call   809528 <set_cur>
}
  809525:	90                   	nop
  809526:	c9                   	leave  
  809527:	c3                   	ret    

0000000000809528 <set_cur>:
void set_cur()
{
  809528:	f3 0f 1e fa          	endbr64 
  80952c:	55                   	push   rbp
  80952d:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  809530:	fa                   	cli    
    outb(port_reg_index,14);
  809531:	8b 05 71 96 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29671]        # 432ba8 <port_reg_index>
  809537:	0f b7 c0             	movzx  eax,ax
  80953a:	be 0e 00 00 00       	mov    esi,0xe
  80953f:	89 c7                	mov    edi,eax
  809541:	e8 4a b9 ff ff       	call   804e90 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  809546:	48 8b 05 7b 10 00 00 	mov    rax,QWORD PTR [rip+0x107b]        # 80a5c8 <m_ptr>
  80954d:	48 8b 15 2c 96 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc2962c]        # 432b80 <video_base>
  809554:	48 29 d0             	sub    rax,rdx
  809557:	48 c1 f8 09          	sar    rax,0x9
  80955b:	0f b6 d0             	movzx  edx,al
  80955e:	8b 05 48 96 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29648]        # 432bac <port_reg_v>
  809564:	0f b7 c0             	movzx  eax,ax
  809567:	89 d6                	mov    esi,edx
  809569:	89 c7                	mov    edi,eax
  80956b:	e8 20 b9 ff ff       	call   804e90 <outb>
    outb(port_reg_index,15);
  809570:	8b 05 32 96 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29632]        # 432ba8 <port_reg_index>
  809576:	0f b7 c0             	movzx  eax,ax
  809579:	be 0f 00 00 00       	mov    esi,0xf
  80957e:	89 c7                	mov    edi,eax
  809580:	e8 0b b9 ff ff       	call   804e90 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  809585:	48 8b 05 3c 10 00 00 	mov    rax,QWORD PTR [rip+0x103c]        # 80a5c8 <m_ptr>
  80958c:	48 8b 15 ed 95 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc295ed]        # 432b80 <video_base>
  809593:	48 29 d0             	sub    rax,rdx
  809596:	48 d1 f8             	sar    rax,1
  809599:	0f b6 d0             	movzx  edx,al
  80959c:	8b 05 0a 96 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2960a]        # 432bac <port_reg_v>
  8095a2:	0f b7 c0             	movzx  eax,ax
  8095a5:	89 d6                	mov    esi,edx
  8095a7:	89 c7                	mov    edi,eax
  8095a9:	e8 e2 b8 ff ff       	call   804e90 <outb>
    asm volatile("sti");
  8095ae:	fb                   	sti    
}
  8095af:	90                   	nop
  8095b0:	5d                   	pop    rbp
  8095b1:	c3                   	ret    

00000000008095b2 <read_tty>:

int read_tty(driver_args *args)
{
  8095b2:	f3 0f 1e fa          	endbr64 
  8095b6:	55                   	push   rbp
  8095b7:	48 89 e5             	mov    rbp,rsp
  8095ba:	48 83 ec 20          	sub    rsp,0x20
  8095be:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  8095c2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095c6:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8095c9:	48 98                	cdqe   
  8095cb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  8095cf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095d3:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8095d6:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  8095d9:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8095e0:	eb 4a                	jmp    80962c <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  8095e2:	48 8b 15 df 0f 00 00 	mov    rdx,QWORD PTR [rip+0xfdf]        # 80a5c8 <m_ptr>
  8095e9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8095ed:	48 8d 48 01          	lea    rcx,[rax+0x1]
  8095f1:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  8095f5:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  8095f8:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  8095fa:	48 8b 05 c7 0f 00 00 	mov    rax,QWORD PTR [rip+0xfc7]        # 80a5c8 <m_ptr>
  809601:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  809607:	75 0d                	jne    809616 <read_tty+0x64>
  809609:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80960d:	7e 07                	jle    809616 <read_tty+0x64>
        {
            return 1;//读到尾了
  80960f:	b8 01 00 00 00       	mov    eax,0x1
  809614:	eb 2d                	jmp    809643 <read_tty+0x91>
        }
        m_ptr+=2;
  809616:	48 8b 05 ab 0f 00 00 	mov    rax,QWORD PTR [rip+0xfab]        # 80a5c8 <m_ptr>
  80961d:	48 83 c0 02          	add    rax,0x2
  809621:	48 89 05 a0 0f 00 00 	mov    QWORD PTR [rip+0xfa0],rax        # 80a5c8 <m_ptr>
    for(int i=0;i<len;i++)
  809628:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80962c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80962f:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  809632:	7c ae                	jl     8095e2 <read_tty+0x30>
    }
    set_cur();
  809634:	b8 00 00 00 00       	mov    eax,0x0
  809639:	e8 ea fe ff ff       	call   809528 <set_cur>
    return 0;
  80963e:	b8 00 00 00 00       	mov    eax,0x0
}
  809643:	c9                   	leave  
  809644:	c3                   	ret    

0000000000809645 <write_tty>:
int write_tty(driver_args *args)
{
  809645:	f3 0f 1e fa          	endbr64 
  809649:	55                   	push   rbp
  80964a:	48 89 e5             	mov    rbp,rsp
  80964d:	48 83 ec 30          	sub    rsp,0x30
  809651:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  809655:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809659:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80965c:	48 98                	cdqe   
  80965e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  809662:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809666:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  809669:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80966c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  809673:	e9 0b 01 00 00       	jmp    809783 <write_tty+0x13e>
    {
        if(*src=='\n')
  809678:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80967c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80967f:	3c 0a                	cmp    al,0xa
  809681:	75 50                	jne    8096d3 <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  809683:	48 8b 05 3e 0f 00 00 	mov    rax,QWORD PTR [rip+0xf3e]        # 80a5c8 <m_ptr>
  80968a:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  809690:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  809693:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  809696:	89 c2                	mov    edx,eax
  809698:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  80969d:	48 0f af c2          	imul   rax,rdx
  8096a1:	48 c1 e8 20          	shr    rax,0x20
  8096a5:	c1 e8 07             	shr    eax,0x7
  8096a8:	8d 50 01             	lea    edx,[rax+0x1]
  8096ab:	89 d0                	mov    eax,edx
  8096ad:	c1 e0 02             	shl    eax,0x2
  8096b0:	01 d0                	add    eax,edx
  8096b2:	c1 e0 05             	shl    eax,0x5
  8096b5:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  8096b8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8096bb:	05 00 80 0b 00       	add    eax,0xb8000
  8096c0:	89 c0                	mov    eax,eax
  8096c2:	48 89 05 ff 0e 00 00 	mov    QWORD PTR [rip+0xeff],rax        # 80a5c8 <m_ptr>
            src++;
  8096c9:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  8096ce:	e9 ac 00 00 00       	jmp    80977f <write_tty+0x13a>
        }else if(*src=='\0')
  8096d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8096d7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8096da:	84 c0                	test   al,al
  8096dc:	0f 84 af 00 00 00    	je     809791 <write_tty+0x14c>
            break;
        if(*src=='\b')
  8096e2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8096e6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8096e9:	3c 08                	cmp    al,0x8
  8096eb:	75 1e                	jne    80970b <write_tty+0xc6>
        {
            m_ptr-=2;
  8096ed:	48 8b 05 d4 0e 00 00 	mov    rax,QWORD PTR [rip+0xed4]        # 80a5c8 <m_ptr>
  8096f4:	48 83 e8 02          	sub    rax,0x2
  8096f8:	48 89 05 c9 0e 00 00 	mov    QWORD PTR [rip+0xec9],rax        # 80a5c8 <m_ptr>
            *m_ptr=0;
  8096ff:	48 8b 05 c2 0e 00 00 	mov    rax,QWORD PTR [rip+0xec2]        # 80a5c8 <m_ptr>
  809706:	c6 00 00             	mov    BYTE PTR [rax],0x0
  809709:	eb 3e                	jmp    809749 <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  80970b:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80970f:	48 8d 42 01          	lea    rax,[rdx+0x1]
  809713:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  809717:	48 8b 05 aa 0e 00 00 	mov    rax,QWORD PTR [rip+0xeaa]        # 80a5c8 <m_ptr>
  80971e:	48 8d 48 01          	lea    rcx,[rax+0x1]
  809722:	48 89 0d 9f 0e 00 00 	mov    QWORD PTR [rip+0xe9f],rcx        # 80a5c8 <m_ptr>
  809729:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80972c:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  80972e:	48 8b 05 93 0e 00 00 	mov    rax,QWORD PTR [rip+0xe93]        # 80a5c8 <m_ptr>
  809735:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809739:	48 89 15 88 0e 00 00 	mov    QWORD PTR [rip+0xe88],rdx        # 80a5c8 <m_ptr>
  809740:	0f b6 15 89 0e 00 00 	movzx  edx,BYTE PTR [rip+0xe89]        # 80a5d0 <m_color>
  809747:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  809749:	48 8b 05 78 0e 00 00 	mov    rax,QWORD PTR [rip+0xe78]        # 80a5c8 <m_ptr>
  809750:	48 8b 0d 39 94 c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc29439]        # 432b90 <vpage_base>
  809757:	48 29 c8             	sub    rax,rcx
  80975a:	48 89 c2             	mov    rdx,rax
  80975d:	8b 05 4d 94 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2944d]        # 432bb0 <vpage_size>
  809763:	8b 0d 3b 94 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc2943b]        # 432ba4 <line_chs>
  809769:	29 c8                	sub    eax,ecx
  80976b:	01 c0                	add    eax,eax
  80976d:	48 98                	cdqe   
  80976f:	48 39 c2             	cmp    rdx,rax
  809772:	7c 0b                	jl     80977f <write_tty+0x13a>
  809774:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  809778:	7e 05                	jle    80977f <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  80977a:	e8 bc f8 ff ff       	call   80903b <scrdown>
    for(int i=0;i<len;i++)
  80977f:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  809783:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809786:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  809789:	0f 8c e9 fe ff ff    	jl     809678 <write_tty+0x33>
  80978f:	eb 01                	jmp    809792 <write_tty+0x14d>
            break;
  809791:	90                   	nop
        }
    }
    set_cur();
  809792:	b8 00 00 00 00       	mov    eax,0x0
  809797:	e8 8c fd ff ff       	call   809528 <set_cur>
    return 0;
  80979c:	b8 00 00 00 00       	mov    eax,0x0
}
  8097a1:	c9                   	leave  
  8097a2:	c3                   	ret    

00000000008097a3 <cls>:

void cls(driver_args *args)
{
  8097a3:	f3 0f 1e fa          	endbr64 
  8097a7:	55                   	push   rbp
  8097a8:	48 89 e5             	mov    rbp,rsp
  8097ab:	48 83 ec 20          	sub    rsp,0x20
  8097af:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  8097b3:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8097ba:	eb 16                	jmp    8097d2 <cls+0x2f>
    {
        vpage_base[i]=0;
  8097bc:	48 8b 15 cd 93 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc293cd]        # 432b90 <vpage_base>
  8097c3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8097c6:	48 98                	cdqe   
  8097c8:	48 01 d0             	add    rax,rdx
  8097cb:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  8097ce:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  8097d2:	8b 05 d8 93 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc293d8]        # 432bb0 <vpage_size>
  8097d8:	01 c0                	add    eax,eax
  8097da:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  8097dd:	7c dd                	jl     8097bc <cls+0x19>
    }
    m_ptr=vpage_base;
  8097df:	48 8b 05 aa 93 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc293aa]        # 432b90 <vpage_base>
  8097e6:	48 89 05 db 0d 00 00 	mov    QWORD PTR [rip+0xddb],rax        # 80a5c8 <m_ptr>
    set_cur();
  8097ed:	b8 00 00 00 00       	mov    eax,0x0
  8097f2:	e8 31 fd ff ff       	call   809528 <set_cur>
}
  8097f7:	90                   	nop
  8097f8:	c9                   	leave  
  8097f9:	c3                   	ret    

00000000008097fa <set_color>:

void set_color(char color)
{
  8097fa:	f3 0f 1e fa          	endbr64 
  8097fe:	55                   	push   rbp
  8097ff:	48 89 e5             	mov    rbp,rsp
  809802:	89 f8                	mov    eax,edi
  809804:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  809807:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80980b:	88 05 bf 0d 00 00    	mov    BYTE PTR [rip+0xdbf],al        # 80a5d0 <m_color>
}
  809811:	90                   	nop
  809812:	5d                   	pop    rbp
  809813:	c3                   	ret    

0000000000809814 <tty_do_req>:

int tty_do_req(driver_args *args)
{
  809814:	f3 0f 1e fa          	endbr64 
  809818:	55                   	push   rbp
  809819:	48 89 e5             	mov    rbp,rsp
  80981c:	48 83 ec 10          	sub    rsp,0x10
  809820:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  809824:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809828:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80982e:	83 f8 0d             	cmp    eax,0xd
  809831:	74 45                	je     809878 <tty_do_req+0x64>
  809833:	83 f8 0d             	cmp    eax,0xd
  809836:	7f 53                	jg     80988b <tty_do_req+0x77>
  809838:	83 f8 0c             	cmp    eax,0xc
  80983b:	74 2d                	je     80986a <tty_do_req+0x56>
  80983d:	83 f8 0c             	cmp    eax,0xc
  809840:	7f 49                	jg     80988b <tty_do_req+0x77>
  809842:	83 f8 02             	cmp    eax,0x2
  809845:	74 07                	je     80984e <tty_do_req+0x3a>
  809847:	83 f8 03             	cmp    eax,0x3
  80984a:	74 10                	je     80985c <tty_do_req+0x48>
  80984c:	eb 3d                	jmp    80988b <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  80984e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809852:	48 89 c7             	mov    rdi,rax
  809855:	e8 58 fd ff ff       	call   8095b2 <read_tty>
        break;
  80985a:	eb 36                	jmp    809892 <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  80985c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809860:	48 89 c7             	mov    rdi,rax
  809863:	e8 dd fd ff ff       	call   809645 <write_tty>
        break;
  809868:	eb 28                	jmp    809892 <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  80986a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80986e:	48 89 c7             	mov    rdi,rax
  809871:	e8 a2 fb ff ff       	call   809418 <seek_tty>
        break;
  809876:	eb 1a                	jmp    809892 <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  809878:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80987c:	48 89 c7             	mov    rdi,rax
  80987f:	b8 00 00 00 00       	mov    eax,0x0
  809884:	e8 bb fb ff ff       	call   809444 <tell_monitor>
        break;
  809889:	eb 07                	jmp    809892 <tty_do_req+0x7e>
    default:return -1;
  80988b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809890:	eb 05                	jmp    809897 <tty_do_req+0x83>
    }
    return 0;
  809892:	b8 00 00 00 00       	mov    eax,0x0
}
  809897:	c9                   	leave  
  809898:	c3                   	ret    

0000000000809899 <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  809899:	f3 0f 1e fa          	endbr64 
  80989d:	55                   	push   rbp
  80989e:	48 89 e5             	mov    rbp,rsp
  8098a1:	48 83 ec 10          	sub    rsp,0x10
  8098a5:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  8098a8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8098ab:	83 c0 01             	add    eax,0x1
  8098ae:	0f b7 c0             	movzx  eax,ax
  8098b1:	be 00 00 00 00       	mov    esi,0x0
  8098b6:	89 c7                	mov    edi,eax
  8098b8:	e8 d3 b5 ff ff       	call   804e90 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  8098bd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8098c0:	83 c0 03             	add    eax,0x3
  8098c3:	0f b7 c0             	movzx  eax,ax
  8098c6:	be 80 00 00 00       	mov    esi,0x80
  8098cb:	89 c7                	mov    edi,eax
  8098cd:	e8 be b5 ff ff       	call   804e90 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  8098d2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8098d5:	0f b7 c0             	movzx  eax,ax
  8098d8:	be 03 00 00 00       	mov    esi,0x3
  8098dd:	89 c7                	mov    edi,eax
  8098df:	e8 ac b5 ff ff       	call   804e90 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  8098e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8098e7:	83 c0 01             	add    eax,0x1
  8098ea:	0f b7 c0             	movzx  eax,ax
  8098ed:	be 00 00 00 00       	mov    esi,0x0
  8098f2:	89 c7                	mov    edi,eax
  8098f4:	e8 97 b5 ff ff       	call   804e90 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  8098f9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8098fc:	83 c0 03             	add    eax,0x3
  8098ff:	0f b7 c0             	movzx  eax,ax
  809902:	be 03 00 00 00       	mov    esi,0x3
  809907:	89 c7                	mov    edi,eax
  809909:	e8 82 b5 ff ff       	call   804e90 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  80990e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809911:	83 c0 02             	add    eax,0x2
  809914:	0f b7 c0             	movzx  eax,ax
  809917:	be c7 00 00 00       	mov    esi,0xc7
  80991c:	89 c7                	mov    edi,eax
  80991e:	e8 6d b5 ff ff       	call   804e90 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  809923:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809926:	83 c0 04             	add    eax,0x4
  809929:	0f b7 c0             	movzx  eax,ax
  80992c:	be 0b 00 00 00       	mov    esi,0xb
  809931:	89 c7                	mov    edi,eax
  809933:	e8 58 b5 ff ff       	call   804e90 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  809938:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80993b:	83 c0 04             	add    eax,0x4
  80993e:	0f b7 c0             	movzx  eax,ax
  809941:	be 1e 00 00 00       	mov    esi,0x1e
  809946:	89 c7                	mov    edi,eax
  809948:	e8 43 b5 ff ff       	call   804e90 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  80994d:	b8 61 00 00 00       	mov    eax,0x61
  809952:	0f b6 d0             	movzx  edx,al
  809955:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809958:	0f b7 c0             	movzx  eax,ax
  80995b:	89 d6                	mov    esi,edx
  80995d:	89 c7                	mov    edi,eax
  80995f:	e8 2c b5 ff ff       	call   804e90 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  809964:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809967:	0f b6 c0             	movzx  eax,al
  80996a:	89 c7                	mov    edi,eax
  80996c:	e8 38 b5 ff ff       	call   804ea9 <inb>
  809971:	0f b6 d0             	movzx  edx,al
  809974:	b8 61 00 00 00       	mov    eax,0x61
  809979:	0f be c0             	movsx  eax,al
  80997c:	39 c2                	cmp    edx,eax
  80997e:	75 17                	jne    809997 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  809980:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809983:	83 c0 04             	add    eax,0x4
  809986:	0f b7 c0             	movzx  eax,ax
  809989:	be 0f 00 00 00       	mov    esi,0xf
  80998e:	89 c7                	mov    edi,eax
  809990:	e8 fb b4 ff ff       	call   804e90 <outb>
  809995:	eb 01                	jmp    809998 <init_com+0xff>
        return;
  809997:	90                   	nop
}
  809998:	c9                   	leave  
  809999:	c3                   	ret    

000000000080999a <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80999a:	f3 0f 1e fa          	endbr64 
  80999e:	55                   	push   rbp
  80999f:	48 89 e5             	mov    rbp,rsp
  8099a2:	48 83 ec 20          	sub    rsp,0x20
  8099a6:	89 f8                	mov    eax,edi
  8099a8:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  8099ab:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  8099af:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8099b2:	83 c0 05             	add    eax,0x5
  8099b5:	0f b6 c0             	movzx  eax,al
  8099b8:	89 c7                	mov    edi,eax
  8099ba:	e8 ea b4 ff ff       	call   804ea9 <inb>
  8099bf:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  8099c2:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  8099c6:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  8099ca:	74 e3                	je     8099af <com_putchar+0x15>
    outb(com_base, ch);
  8099cc:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  8099d0:	0f b6 d0             	movzx  edx,al
  8099d3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8099d6:	0f b7 c0             	movzx  eax,ax
  8099d9:	89 d6                	mov    esi,edx
  8099db:	89 c7                	mov    edi,eax
  8099dd:	e8 ae b4 ff ff       	call   804e90 <outb>
}
  8099e2:	90                   	nop
  8099e3:	c9                   	leave  
  8099e4:	c3                   	ret    

00000000008099e5 <com_puts>:

void com_puts(char* s,int com_port){
  8099e5:	f3 0f 1e fa          	endbr64 
  8099e9:	55                   	push   rbp
  8099ea:	48 89 e5             	mov    rbp,rsp
  8099ed:	48 83 ec 10          	sub    rsp,0x10
  8099f1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8099f5:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  8099f8:	eb 1d                	jmp    809a17 <com_puts+0x32>
        com_putchar(*s,com_port);
  8099fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8099fe:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a01:	66 98                	cbw    
  809a03:	0f b7 c0             	movzx  eax,ax
  809a06:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  809a09:	89 d6                	mov    esi,edx
  809a0b:	89 c7                	mov    edi,eax
  809a0d:	e8 88 ff ff ff       	call   80999a <com_putchar>
    for(;*s;s++){
  809a12:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  809a17:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809a1b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a1e:	84 c0                	test   al,al
  809a20:	75 d8                	jne    8099fa <com_puts+0x15>
    }
  809a22:	90                   	nop
  809a23:	90                   	nop
  809a24:	c9                   	leave  
  809a25:	c3                   	ret    

0000000000809a26 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  809a26:	f3 0f 1e fa          	endbr64 
  809a2a:	55                   	push   rbp
  809a2b:	48 89 e5             	mov    rbp,rsp
  809a2e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809a32:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809a36:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  809a39:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809a3d:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  809a40:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809a47:	eb 1b                	jmp    809a64 <memcpy+0x3e>
        *(dest)=*(src);
  809a49:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809a4d:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809a50:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809a54:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  809a56:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  809a5b:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  809a60:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809a64:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809a67:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  809a6a:	77 dd                	ja     809a49 <memcpy+0x23>
    }
}
  809a6c:	90                   	nop
  809a6d:	90                   	nop
  809a6e:	5d                   	pop    rbp
  809a6f:	c3                   	ret    

0000000000809a70 <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  809a70:	f3 0f 1e fa          	endbr64 
  809a74:	55                   	push   rbp
  809a75:	48 89 e5             	mov    rbp,rsp
  809a78:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809a7c:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  809a80:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  809a83:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809a8a:	eb 3a                	jmp    809ac6 <memcmp+0x56>
    {
        if(*a!=*b)
  809a8c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809a90:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809a93:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809a97:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809a9a:	38 c2                	cmp    dl,al
  809a9c:	74 1a                	je     809ab8 <memcmp+0x48>
            return *a-*b;
  809a9e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809aa2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809aa5:	0f b6 d0             	movzx  edx,al
  809aa8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809aac:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809aaf:	0f b6 c8             	movzx  ecx,al
  809ab2:	89 d0                	mov    eax,edx
  809ab4:	29 c8                	sub    eax,ecx
  809ab6:	eb 1b                	jmp    809ad3 <memcmp+0x63>
        a++;
  809ab8:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  809abd:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  809ac2:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809ac6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809ac9:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  809acc:	7c be                	jl     809a8c <memcmp+0x1c>
    }
    return 0;
  809ace:	b8 00 00 00 00       	mov    eax,0x0
}
  809ad3:	5d                   	pop    rbp
  809ad4:	c3                   	ret    

0000000000809ad5 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  809ad5:	f3 0f 1e fa          	endbr64 
  809ad9:	55                   	push   rbp
  809ada:	48 89 e5             	mov    rbp,rsp
  809add:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  809ae1:	89 f0                	mov    eax,esi
  809ae3:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  809ae6:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  809ae9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  809af0:	eb 16                	jmp    809b08 <memset+0x33>
        *(buf++)=value;
  809af2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809af6:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809afa:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  809afe:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  809b02:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  809b04:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809b08:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809b0b:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  809b0e:	72 e2                	jb     809af2 <memset+0x1d>
    }
}
  809b10:	90                   	nop
  809b11:	90                   	nop
  809b12:	5d                   	pop    rbp
  809b13:	c3                   	ret    

0000000000809b14 <get_mem_size>:

u32 get_mem_size(){
  809b14:	f3 0f 1e fa          	endbr64 
  809b18:	55                   	push   rbp
  809b19:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  809b1c:	8b 05 a2 90 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc290a2]        # 432bc4 <mem_end>
}
  809b22:	5d                   	pop    rbp
  809b23:	c3                   	ret    

0000000000809b24 <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  809b24:	f3 0f 1e fa          	endbr64 
  809b28:	55                   	push   rbp
  809b29:	48 89 e5             	mov    rbp,rsp
  809b2c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809b30:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  809b34:	eb 1d                	jmp    809b53 <strcpy+0x2f>
        *(dest++)=*(buf++);
  809b36:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  809b3a:	48 8d 42 01          	lea    rax,[rdx+0x1]
  809b3e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  809b42:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b46:	48 8d 48 01          	lea    rcx,[rax+0x1]
  809b4a:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  809b4e:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  809b51:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  809b53:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809b57:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809b5a:	84 c0                	test   al,al
  809b5c:	75 d8                	jne    809b36 <strcpy+0x12>
    }
    *dest='\0';
  809b5e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809b62:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  809b65:	90                   	nop
  809b66:	5d                   	pop    rbp
  809b67:	c3                   	ret    

0000000000809b68 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  809b68:	f3 0f 1e fa          	endbr64 
  809b6c:	55                   	push   rbp
  809b6d:	48 89 e5             	mov    rbp,rsp
  809b70:	48 83 ec 30          	sub    rsp,0x30
  809b74:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  809b78:	89 f0                	mov    eax,esi
  809b7a:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  809b7d:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  809b82:	0f 84 9c 00 00 00    	je     809c24 <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  809b88:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809b8c:	48 89 c6             	mov    rsi,rax
  809b8f:	bf e0 2b 43 00       	mov    edi,0x432be0
  809b94:	e8 8b ff ff ff       	call   809b24 <strcpy>
        char* ptr=strtokkee;
  809b99:	48 c7 45 e8 e0 2b 43 	mov    QWORD PTR [rbp-0x18],0x432be0
  809ba0:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  809ba1:	c7 05 35 92 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc29235],0x0        # 432de0 <tokptr>
  809ba8:	00 00 00 
  809bab:	eb 1c                	jmp    809bc9 <strtok+0x61>
  809bad:	8b 05 2d 92 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2922d]        # 432de0 <tokptr>
  809bb3:	83 c0 01             	add    eax,0x1
  809bb6:	99                   	cdq    
  809bb7:	c1 ea 17             	shr    edx,0x17
  809bba:	01 d0                	add    eax,edx
  809bbc:	25 ff 01 00 00       	and    eax,0x1ff
  809bc1:	29 d0                	sub    eax,edx
  809bc3:	89 05 17 92 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29217],eax        # 432de0 <tokptr>
  809bc9:	8b 05 11 92 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29211]        # 432de0 <tokptr>
  809bcf:	48 98                	cdqe   
  809bd1:	0f b6 80 e0 2b 43 00 	movzx  eax,BYTE PTR [rax+0x432be0]
  809bd8:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  809bdb:	74 13                	je     809bf0 <strtok+0x88>
  809bdd:	8b 05 fd 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc291fd]        # 432de0 <tokptr>
  809be3:	48 98                	cdqe   
  809be5:	0f b6 80 e0 2b 43 00 	movzx  eax,BYTE PTR [rax+0x432be0]
  809bec:	84 c0                	test   al,al
  809bee:	75 bd                	jne    809bad <strtok+0x45>
        strtokkee[tokptr]='\0';
  809bf0:	8b 05 ea 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc291ea]        # 432de0 <tokptr>
  809bf6:	48 98                	cdqe   
  809bf8:	c6 80 e0 2b 43 00 00 	mov    BYTE PTR [rax+0x432be0],0x0
        tokptr=(tokptr+1)%512;
  809bff:	8b 05 db 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc291db]        # 432de0 <tokptr>
  809c05:	83 c0 01             	add    eax,0x1
  809c08:	99                   	cdq    
  809c09:	c1 ea 17             	shr    edx,0x17
  809c0c:	01 d0                	add    eax,edx
  809c0e:	25 ff 01 00 00       	and    eax,0x1ff
  809c13:	29 d0                	sub    eax,edx
  809c15:	89 05 c5 91 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc291c5],eax        # 432de0 <tokptr>
        return ptr;
  809c1b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809c1f:	e9 9e 00 00 00       	jmp    809cc2 <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  809c24:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  809c2b:	8b 05 af 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc291af]        # 432de0 <tokptr>
  809c31:	48 98                	cdqe   
  809c33:	48 05 e0 2b 43 00    	add    rax,0x432be0
  809c39:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  809c3d:	eb 20                	jmp    809c5f <strtok+0xf7>
  809c3f:	8b 05 9b 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2919b]        # 432de0 <tokptr>
  809c45:	83 c0 01             	add    eax,0x1
  809c48:	99                   	cdq    
  809c49:	c1 ea 17             	shr    edx,0x17
  809c4c:	01 d0                	add    eax,edx
  809c4e:	25 ff 01 00 00       	and    eax,0x1ff
  809c53:	29 d0                	sub    eax,edx
  809c55:	89 05 85 91 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc29185],eax        # 432de0 <tokptr>
  809c5b:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809c5f:	8b 05 7b 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2917b]        # 432de0 <tokptr>
  809c65:	48 98                	cdqe   
  809c67:	0f b6 80 e0 2b 43 00 	movzx  eax,BYTE PTR [rax+0x432be0]
  809c6e:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  809c71:	74 13                	je     809c86 <strtok+0x11e>
  809c73:	8b 05 67 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29167]        # 432de0 <tokptr>
  809c79:	48 98                	cdqe   
  809c7b:	0f b6 80 e0 2b 43 00 	movzx  eax,BYTE PTR [rax+0x432be0]
  809c82:	84 c0                	test   al,al
  809c84:	75 b9                	jne    809c3f <strtok+0xd7>
    strtokkee[tokptr]='\0';
  809c86:	8b 05 54 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29154]        # 432de0 <tokptr>
  809c8c:	48 98                	cdqe   
  809c8e:	c6 80 e0 2b 43 00 00 	mov    BYTE PTR [rax+0x432be0],0x0
    tokptr=(tokptr+1)%512;
  809c95:	8b 05 45 91 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc29145]        # 432de0 <tokptr>
  809c9b:	83 c0 01             	add    eax,0x1
  809c9e:	99                   	cdq    
  809c9f:	c1 ea 17             	shr    edx,0x17
  809ca2:	01 d0                	add    eax,edx
  809ca4:	25 ff 01 00 00       	and    eax,0x1ff
  809ca9:	29 d0                	sub    eax,edx
  809cab:	89 05 2f 91 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2912f],eax        # 432de0 <tokptr>
    if(c)
  809cb1:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  809cb5:	74 06                	je     809cbd <strtok+0x155>
        return ptr;
  809cb7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809cbb:	eb 05                	jmp    809cc2 <strtok+0x15a>
    else
        return (void*)0;
  809cbd:	b8 00 00 00 00       	mov    eax,0x0
}
  809cc2:	c9                   	leave  
  809cc3:	c3                   	ret    

0000000000809cc4 <strcmp>:
int strcmp(char *s1,char *s2)
{
  809cc4:	f3 0f 1e fa          	endbr64 
  809cc8:	55                   	push   rbp
  809cc9:	48 89 e5             	mov    rbp,rsp
  809ccc:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809cd0:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  809cd4:	eb 3c                	jmp    809d12 <strcmp+0x4e>
		if(*s1>*s2)
  809cd6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809cda:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809cdd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809ce1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809ce4:	38 c2                	cmp    dl,al
  809ce6:	7e 07                	jle    809cef <strcmp+0x2b>
			return 1;
  809ce8:	b8 01 00 00 00       	mov    eax,0x1
  809ced:	eb 52                	jmp    809d41 <strcmp+0x7d>
		else if(*s1<*s2)
  809cef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809cf3:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809cf6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809cfa:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809cfd:	38 c2                	cmp    dl,al
  809cff:	7d 07                	jge    809d08 <strcmp+0x44>
			return -1;
  809d01:	b8 ff ff ff ff       	mov    eax,0xffffffff
  809d06:	eb 39                	jmp    809d41 <strcmp+0x7d>
		s1++;
  809d08:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  809d0d:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  809d12:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d16:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d19:	84 c0                	test   al,al
  809d1b:	74 0b                	je     809d28 <strcmp+0x64>
  809d1d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d21:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d24:	84 c0                	test   al,al
  809d26:	75 ae                	jne    809cd6 <strcmp+0x12>
	}
	if(*s1==*s2)
  809d28:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d2c:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  809d2f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809d33:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d36:	38 c2                	cmp    dl,al
  809d38:	75 07                	jne    809d41 <strcmp+0x7d>
		return 0;
  809d3a:	b8 00 00 00 00       	mov    eax,0x0
  809d3f:	eb 00                	jmp    809d41 <strcmp+0x7d>
}
  809d41:	5d                   	pop    rbp
  809d42:	c3                   	ret    

0000000000809d43 <strlen>:

int strlen(char *str)
{
  809d43:	f3 0f 1e fa          	endbr64 
  809d47:	55                   	push   rbp
  809d48:	48 89 e5             	mov    rbp,rsp
  809d4b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  809d4f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  809d56:	eb 09                	jmp    809d61 <strlen+0x1e>
  809d58:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  809d5d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  809d61:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809d65:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d68:	84 c0                	test   al,al
  809d6a:	75 ec                	jne    809d58 <strlen+0x15>
    return l;
  809d6c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  809d6f:	5d                   	pop    rbp
  809d70:	c3                   	ret    

0000000000809d71 <sprintf>:

void sprintf(char *dist, char *str,...)
{
  809d71:	f3 0f 1e fa          	endbr64 
  809d75:	55                   	push   rbp
  809d76:	48 89 e5             	mov    rbp,rsp
  809d79:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  809d80:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  809d87:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  809d8e:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  809d95:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  809d9c:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  809da3:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  809daa:	84 c0                	test   al,al
  809dac:	74 20                	je     809dce <sprintf+0x5d>
  809dae:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  809db2:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  809db6:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  809dba:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  809dbe:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  809dc2:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  809dc6:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  809dca:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  809dce:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809dd5:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  809ddc:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809de3:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  809dea:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  809df1:	00 00 00 
    while (*pstr!='\n')
  809df4:	eb 39                	jmp    809e2f <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  809df6:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809dfd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e00:	3c 25                	cmp    al,0x25
  809e02:	75 15                	jne    809e19 <sprintf+0xa8>
  809e04:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  809e0b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e0e:	3c 25                	cmp    al,0x25
  809e10:	74 07                	je     809e19 <sprintf+0xa8>
            argnum++;
  809e12:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  809e19:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809e20:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  809e27:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  809e2e:	01 
    while (*pstr!='\n')
  809e2f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809e36:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e39:	3c 0a                	cmp    al,0xa
  809e3b:	75 b9                	jne    809df6 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  809e3d:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  809e44:	00 00 00 
  809e47:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  809e4e:	00 00 00 
  809e51:	48 8d 45 10          	lea    rax,[rbp+0x10]
  809e55:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  809e5c:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  809e63:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  809e6a:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  809e71:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  809e78:	e9 e2 01 00 00       	jmp    80a05f <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  809e7d:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809e84:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e87:	3c 25                	cmp    al,0x25
  809e89:	0f 85 aa 01 00 00    	jne    80a039 <sprintf+0x2c8>
  809e8f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809e96:	48 83 c0 01          	add    rax,0x1
  809e9a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e9d:	84 c0                	test   al,al
  809e9f:	0f 84 94 01 00 00    	je     80a039 <sprintf+0x2c8>
            pstr++;
  809ea5:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  809eac:	01 
            if(*pstr=='x'){
  809ead:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809eb4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809eb7:	3c 78                	cmp    al,0x78
  809eb9:	75 64                	jne    809f1f <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  809ebb:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809ec1:	83 f8 2f             	cmp    eax,0x2f
  809ec4:	77 23                	ja     809ee9 <sprintf+0x178>
  809ec6:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809ecd:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809ed3:	89 d2                	mov    edx,edx
  809ed5:	48 01 d0             	add    rax,rdx
  809ed8:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809ede:	83 c2 08             	add    edx,0x8
  809ee1:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809ee7:	eb 12                	jmp    809efb <sprintf+0x18a>
  809ee9:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809ef0:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809ef4:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809efb:	8b 00                	mov    eax,DWORD PTR [rax]
  809efd:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  809f03:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  809f09:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809f10:	89 d6                	mov    esi,edx
  809f12:	48 89 c7             	mov    rdi,rax
  809f15:	e8 4e 02 00 00       	call   80a168 <sprint_hex>
            if(*pstr=='x'){
  809f1a:	e9 38 01 00 00       	jmp    80a057 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  809f1f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809f26:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809f29:	3c 73                	cmp    al,0x73
  809f2b:	75 68                	jne    809f95 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  809f2d:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809f33:	83 f8 2f             	cmp    eax,0x2f
  809f36:	77 23                	ja     809f5b <sprintf+0x1ea>
  809f38:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809f3f:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809f45:	89 d2                	mov    edx,edx
  809f47:	48 01 d0             	add    rax,rdx
  809f4a:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809f50:	83 c2 08             	add    edx,0x8
  809f53:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809f59:	eb 12                	jmp    809f6d <sprintf+0x1fc>
  809f5b:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809f62:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809f66:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809f6d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809f70:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  809f77:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  809f7e:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809f85:	48 89 d6             	mov    rsi,rdx
  809f88:	48 89 c7             	mov    rdi,rax
  809f8b:	e8 5a 02 00 00       	call   80a1ea <sprintn>
            if(*pstr=='x'){
  809f90:	e9 c2 00 00 00       	jmp    80a057 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  809f95:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  809f9c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809f9f:	3c 64                	cmp    al,0x64
  809fa1:	75 66                	jne    80a009 <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  809fa3:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  809fa9:	83 f8 2f             	cmp    eax,0x2f
  809fac:	77 23                	ja     809fd1 <sprintf+0x260>
  809fae:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  809fb5:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809fbb:	89 d2                	mov    edx,edx
  809fbd:	48 01 d0             	add    rax,rdx
  809fc0:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  809fc6:	83 c2 08             	add    edx,0x8
  809fc9:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  809fcf:	eb 12                	jmp    809fe3 <sprintf+0x272>
  809fd1:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  809fd8:	48 8d 50 08          	lea    rdx,[rax+0x8]
  809fdc:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  809fe3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809fe6:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  809fed:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  809ff4:	89 c2                	mov    edx,eax
  809ff6:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  809ffd:	89 d6                	mov    esi,edx
  809fff:	48 89 c7             	mov    rdi,rax
  80a002:	e8 ad 00 00 00       	call   80a0b4 <sprint_decimal>
            if(*pstr=='x'){
  80a007:	eb 4e                	jmp    80a057 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80a009:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a010:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a013:	3c 63                	cmp    al,0x63
  80a015:	75 02                	jne    80a019 <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80a017:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80a019:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a020:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a023:	0f be d0             	movsx  edx,al
  80a026:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80a02d:	89 d6                	mov    esi,edx
  80a02f:	48 89 c7             	mov    rdi,rax
  80a032:	e8 3e 00 00 00       	call   80a075 <sprintchar>
            if(*pstr=='x'){
  80a037:	eb 1e                	jmp    80a057 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80a039:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a040:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a043:	0f be d0             	movsx  edx,al
  80a046:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80a04d:	89 d6                	mov    esi,edx
  80a04f:	48 89 c7             	mov    rdi,rax
  80a052:	e8 1e 00 00 00       	call   80a075 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80a057:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80a05e:	01 
  80a05f:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a066:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a069:	84 c0                	test   al,al
  80a06b:	0f 85 0c fe ff ff    	jne    809e7d <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80a071:	90                   	nop
  80a072:	90                   	nop
  80a073:	c9                   	leave  
  80a074:	c3                   	ret    

000000000080a075 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80a075:	f3 0f 1e fa          	endbr64 
  80a079:	55                   	push   rbp
  80a07a:	48 89 e5             	mov    rbp,rsp
  80a07d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a081:	89 f0                	mov    eax,esi
  80a083:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80a086:	eb 05                	jmp    80a08d <sprintchar+0x18>
        dist++;
  80a088:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80a08d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a091:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a094:	84 c0                	test   al,al
  80a096:	75 f0                	jne    80a088 <sprintchar+0x13>
    *dist++=c;
  80a098:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a09c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a0a0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80a0a4:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80a0a8:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80a0aa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a0ae:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80a0b1:	90                   	nop
  80a0b2:	5d                   	pop    rbp
  80a0b3:	c3                   	ret    

000000000080a0b4 <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80a0b4:	f3 0f 1e fa          	endbr64 
  80a0b8:	55                   	push   rbp
  80a0b9:	48 89 e5             	mov    rbp,rsp
  80a0bc:	48 83 ec 30          	sub    rsp,0x30
  80a0c0:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80a0c4:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80a0c7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80a0ce:	eb 65                	jmp    80a135 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80a0d0:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80a0d3:	48 63 c2             	movsxd rax,edx
  80a0d6:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80a0dd:	48 c1 e8 20          	shr    rax,0x20
  80a0e1:	c1 f8 02             	sar    eax,0x2
  80a0e4:	89 d6                	mov    esi,edx
  80a0e6:	c1 fe 1f             	sar    esi,0x1f
  80a0e9:	29 f0                	sub    eax,esi
  80a0eb:	89 c1                	mov    ecx,eax
  80a0ed:	89 c8                	mov    eax,ecx
  80a0ef:	c1 e0 02             	shl    eax,0x2
  80a0f2:	01 c8                	add    eax,ecx
  80a0f4:	01 c0                	add    eax,eax
  80a0f6:	89 d1                	mov    ecx,edx
  80a0f8:	29 c1                	sub    ecx,eax
  80a0fa:	89 c8                	mov    eax,ecx
  80a0fc:	83 c0 30             	add    eax,0x30
  80a0ff:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80a102:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a105:	8d 50 01             	lea    edx,[rax+0x1]
  80a108:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80a10b:	48 98                	cdqe   
  80a10d:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80a111:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80a115:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80a118:	48 63 d0             	movsxd rdx,eax
  80a11b:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80a122:	48 c1 ea 20          	shr    rdx,0x20
  80a126:	c1 fa 02             	sar    edx,0x2
  80a129:	c1 f8 1f             	sar    eax,0x1f
  80a12c:	89 c1                	mov    ecx,eax
  80a12e:	89 d0                	mov    eax,edx
  80a130:	29 c8                	sub    eax,ecx
  80a132:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80a135:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a138:	83 f8 0f             	cmp    eax,0xf
  80a13b:	76 93                	jbe    80a0d0 <sprint_decimal+0x1c>
    }
    while(p>0)
  80a13d:	eb 1f                	jmp    80a15e <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80a13f:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80a143:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a146:	48 98                	cdqe   
  80a148:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80a14d:	0f be d0             	movsx  edx,al
  80a150:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a154:	89 d6                	mov    esi,edx
  80a156:	48 89 c7             	mov    rdi,rax
  80a159:	e8 17 ff ff ff       	call   80a075 <sprintchar>
    while(p>0)
  80a15e:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80a162:	7f db                	jg     80a13f <sprint_decimal+0x8b>
    }
}
  80a164:	90                   	nop
  80a165:	90                   	nop
  80a166:	c9                   	leave  
  80a167:	c3                   	ret    

000000000080a168 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80a168:	f3 0f 1e fa          	endbr64 
  80a16c:	55                   	push   rbp
  80a16d:	48 89 e5             	mov    rbp,rsp
  80a170:	48 83 ec 20          	sub    rsp,0x20
  80a174:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a178:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80a17b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80a182:	eb 35                	jmp    80a1b9 <sprint_hex+0x51>
        unsigned char a=c%16;
  80a184:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80a187:	83 e0 0f             	and    eax,0xf
  80a18a:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80a18d:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80a191:	76 06                	jbe    80a199 <sprint_hex+0x31>
  80a193:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80a197:	eb 04                	jmp    80a19d <sprint_hex+0x35>
        else a+='0';
  80a199:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80a19d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a1a0:	8d 50 01             	lea    edx,[rax+0x1]
  80a1a3:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80a1a6:	48 98                	cdqe   
  80a1a8:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80a1ac:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80a1b0:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80a1b3:	c1 e8 04             	shr    eax,0x4
  80a1b6:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80a1b9:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80a1bd:	7e c5                	jle    80a184 <sprint_hex+0x1c>
    }
    while(p>0)
  80a1bf:	eb 1f                	jmp    80a1e0 <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80a1c1:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80a1c5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a1c8:	48 98                	cdqe   
  80a1ca:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80a1cf:	0f be d0             	movsx  edx,al
  80a1d2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a1d6:	89 d6                	mov    esi,edx
  80a1d8:	48 89 c7             	mov    rdi,rax
  80a1db:	e8 95 fe ff ff       	call   80a075 <sprintchar>
    while(p>0)
  80a1e0:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80a1e4:	7f db                	jg     80a1c1 <sprint_hex+0x59>
    }
}
  80a1e6:	90                   	nop
  80a1e7:	90                   	nop
  80a1e8:	c9                   	leave  
  80a1e9:	c3                   	ret    

000000000080a1ea <sprintn>:
void sprintn(char *dist,char *str)
{
  80a1ea:	f3 0f 1e fa          	endbr64 
  80a1ee:	55                   	push   rbp
  80a1ef:	48 89 e5             	mov    rbp,rsp
  80a1f2:	48 83 ec 10          	sub    rsp,0x10
  80a1f6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a1fa:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80a1fe:	eb 20                	jmp    80a220 <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80a200:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a204:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a208:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80a20c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a20f:	0f be d0             	movsx  edx,al
  80a212:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a216:	89 d6                	mov    esi,edx
  80a218:	48 89 c7             	mov    rdi,rax
  80a21b:	e8 55 fe ff ff       	call   80a075 <sprintchar>
    while(*str!='\0')
  80a220:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a224:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a227:	84 c0                	test   al,al
  80a229:	75 d5                	jne    80a200 <sprintn+0x16>
    }
  80a22b:	90                   	nop
  80a22c:	90                   	nop
  80a22d:	c9                   	leave  
  80a22e:	c3                   	ret    
  80a22f:	90                   	nop

000000000080a230 <create_zero>:
  80a230:	e8 dc 9a ff ff       	call   803d11 <req_proc>
  80a235:	83 f8 ff             	cmp    eax,0xffffffff
  80a238:	74 0c                	je     80a246 <create_zero.retu>
  80a23a:	e8 cb 9b ff ff       	call   803e0a <set_proc>
  80a23f:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80a243:	83 c4 40             	add    esp,0x40

000000000080a246 <create_zero.retu>:
  80a246:	c3                   	ret    

000000000080a247 <fill_desc>:
  80a247:	55                   	push   rbp
  80a248:	48 89 e5             	mov    rbp,rsp
  80a24b:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80a24f:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80a253:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80a257:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80a25b:	be 9a a3 80 00       	mov    esi,0x80a39a
  80a260:	c7 04 25 9a a3 80 00 	mov    DWORD PTR ds:0x80a39a,0x0
  80a267:	00 00 00 00 
  80a26b:	c7 04 25 9e a3 80 00 	mov    DWORD PTR ds:0x80a39e,0x0
  80a272:	00 00 00 00 
  80a276:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80a27a:	c1 e9 10             	shr    ecx,0x10
  80a27d:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80a282:	c1 ea 10             	shr    edx,0x10
  80a285:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80a289:	66 c1 ea 08          	shr    dx,0x8
  80a28d:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80a291:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80a296:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80a29a:	c1 e1 08             	shl    ecx,0x8
  80a29d:	09 cf                	or     edi,ecx
  80a29f:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80a2a3:	8b 14 25 9a a3 80 00 	mov    edx,DWORD PTR ds:0x80a39a
  80a2aa:	67 89 10             	mov    DWORD PTR [eax],edx
  80a2ad:	8b 14 25 9e a3 80 00 	mov    edx,DWORD PTR ds:0x80a39e
  80a2b4:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80a2b8:	c9                   	leave  
  80a2b9:	c3                   	ret    

000000000080a2ba <switch_proc_asm>:
  80a2ba:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80a2c0:	66 89 04 25 d8 a2 80 	mov    WORD PTR ds:0x80a2d8,ax
  80a2c7:	00 
  80a2c8:	c7 04 25 d4 a2 80 00 	mov    DWORD PTR ds:0x80a2d4,0x0
  80a2cf:	00 00 00 00 

000000000080a2d3 <switch_proc_asm.ljmp>:
  80a2d3:	ea                   	(bad)  
  80a2d4:	00 00                	add    BYTE PTR [rax],al
  80a2d6:	00 00                	add    BYTE PTR [rax],al
  80a2d8:	00 00                	add    BYTE PTR [rax],al
  80a2da:	c3                   	ret    

000000000080a2db <switch_to_old>:
  80a2db:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80a2e0:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80a2e4:	bf 4c a3 80 00       	mov    edi,0x80a34c
  80a2e9:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80a2ed:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80a2f1:	89 c1                	mov    ecx,eax
  80a2f3:	83 e9 04             	sub    ecx,0x4
  80a2f6:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80a2f9:	50                   	push   rax
  80a2fa:	89 f5                	mov    ebp,esi
  80a2fc:	83 c5 28             	add    ebp,0x28
  80a2ff:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a303:	50                   	push   rax
  80a304:	83 c5 04             	add    ebp,0x4
  80a307:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a30b:	50                   	push   rax
  80a30c:	83 c5 04             	add    ebp,0x4
  80a30f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a313:	50                   	push   rax
  80a314:	83 c5 04             	add    ebp,0x4
  80a317:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a31b:	50                   	push   rax
  80a31c:	83 c5 04             	add    ebp,0x4
  80a31f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a323:	50                   	push   rax
  80a324:	83 c5 04             	add    ebp,0x4
  80a327:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a32b:	50                   	push   rax
  80a32c:	83 c5 04             	add    ebp,0x4
  80a32f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a333:	50                   	push   rax
  80a334:	83 c5 04             	add    ebp,0x4
  80a337:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80a33b:	50                   	push   rax
  80a33c:	83 c5 04             	add    ebp,0x4
  80a33f:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80a343:	0f 22 d8             	mov    cr3,rax
  80a346:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80a34a:	50                   	push   rax
  80a34b:	5c                   	pop    rsp

000000000080a34c <switch_to_old.leap>:
  80a34c:	ea                   	(bad)  
  80a34d:	00 00                	add    BYTE PTR [rax],al
  80a34f:	00 00                	add    BYTE PTR [rax],al
  80a351:	08 00                	or     BYTE PTR [rax],al

000000000080a353 <save_context>:
  80a353:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80a358:	83 c0 44             	add    eax,0x44
  80a35b:	b9 08 00 00 00       	mov    ecx,0x8
  80a360:	89 e7                	mov    edi,esp

000000000080a362 <save_context.loops>:
  80a362:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80a365:	67 89 10             	mov    DWORD PTR [eax],edx
  80a368:	83 c7 04             	add    edi,0x4
  80a36b:	83 e8 04             	sub    eax,0x4
  80a36e:	e2 f2                	loop   80a362 <save_context.loops>
  80a370:	5b                   	pop    rbx
  80a371:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80a376:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80a37a:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80a37f:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80a383:	c3                   	ret    

000000000080a384 <move_to_user_mode>:
  80a384:	66 b8 20 00          	mov    ax,0x20
  80a388:	8e d8                	mov    ds,eax
  80a38a:	8e c0                	mov    es,eax
  80a38c:	8e e8                	mov    gs,eax
  80a38e:	6a 20                	push   0x20
  80a390:	54                   	push   rsp
  80a391:	6a 18                	push   0x18
  80a393:	68 99 a3 80 00       	push   0x80a399
  80a398:	cf                   	iret   

000000000080a399 <move_to_user_mode.done>:
  80a399:	c3                   	ret    

000000000080a39a <desc>:
	...
