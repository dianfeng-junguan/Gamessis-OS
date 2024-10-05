
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
  10005a:	c7 00 87 01 00 00    	mov    DWORD PTR [rax],0x187
  100060:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
  100067:	b8 00 10 10 00       	mov    eax,0x101000
  10006c:	0f 22 d8             	mov    cr3,rax

000000000010006f <switch_cs>:
  10006f:	bc 00 00 40 00       	mov    esp,0x400000
  100074:	b9 80 00 00 c0       	mov    ecx,0xc0000080
  100079:	0f 32                	rdmsr  
  10007b:	0f ba e8 08          	bts    eax,0x8
  10007f:	0f ba e8 00          	bts    eax,0x0
  100083:	0f 30                	wrmsr  
  100085:	0f 20 c0             	mov    rax,cr0
  100088:	0f ba e8 00          	bts    eax,0x0
  10008c:	0f ba e8 1f          	bts    eax,0x1f
  100090:	0f 22 c0             	mov    cr0,rax
  100093:	b8 db 07 80 00       	mov    eax,0x8007db
  100098:	ea                   	(bad)  
  100099:	db 07                	fild   DWORD PTR [rdi]
  10009b:	80 00 08             	add    BYTE PTR [rax],0x8
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
  800194:	b8 f0 11 80 00       	mov    eax,0x8011f0
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
  800217:	b8 d5 66 80 00       	mov    eax,0x8066d5
  80021c:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800221:	ba 08 00 00 00       	mov    edx,0x8
  800226:	48 89 c6             	mov    rsi,rax
  800229:	bf 21 00 00 00       	mov    edi,0x21
  80022e:	e8 d9 00 00 00       	call   80030c <set_gate>
	set_gate(0x20,(addr_t)clock,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  800233:	b8 a0 50 80 00       	mov    eax,0x8050a0
  800238:	b9 00 8e 00 00       	mov    ecx,0x8e00
  80023d:	ba 08 00 00 00       	mov    edx,0x8
  800242:	48 89 c6             	mov    rsi,rax
  800245:	bf 20 00 00 00       	mov    edi,0x20
  80024a:	e8 bd 00 00 00       	call   80030c <set_gate>
	set_gate(0x2e,(addr_t)disk_int_handler,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);
  80024f:	b8 e0 75 80 00       	mov    eax,0x8075e0
  800254:	b9 00 8e 00 00       	mov    ecx,0x8e00
  800259:	ba 08 00 00 00       	mov    edx,0x8
  80025e:	48 89 c6             	mov    rsi,rax
  800261:	bf 2e 00 00 00       	mov    edi,0x2e
  800266:	e8 a1 00 00 00       	call   80030c <set_gate>
    set_gate(0x80,(addr_t)_syscall,GDT_SEL_CODE,GATE_PRESENT|INT_GATE);//
  80026b:	b8 d0 5a 80 00       	mov    eax,0x805ad0
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
  800291:	e8 7a 4b 00 00       	call   804e10 <outb>
	outb(0xA0,0x11);
  800296:	be 11 00 00 00       	mov    esi,0x11
  80029b:	bf a0 00 00 00       	mov    edi,0xa0
  8002a0:	e8 6b 4b 00 00       	call   804e10 <outb>
	//ICW2
	outb(0x21,0x20);//former 0x20,0x20
  8002a5:	be 20 00 00 00       	mov    esi,0x20
  8002aa:	bf 21 00 00 00       	mov    edi,0x21
  8002af:	e8 5c 4b 00 00       	call   804e10 <outb>
	outb(0xA1,0x28);
  8002b4:	be 28 00 00 00       	mov    esi,0x28
  8002b9:	bf a1 00 00 00       	mov    edi,0xa1
  8002be:	e8 4d 4b 00 00       	call   804e10 <outb>
	//ICW3
	outb(0x21,0x04);
  8002c3:	be 04 00 00 00       	mov    esi,0x4
  8002c8:	bf 21 00 00 00       	mov    edi,0x21
  8002cd:	e8 3e 4b 00 00       	call   804e10 <outb>
	outb(0xA1,0x02);
  8002d2:	be 02 00 00 00       	mov    esi,0x2
  8002d7:	bf a1 00 00 00       	mov    edi,0xa1
  8002dc:	e8 2f 4b 00 00       	call   804e10 <outb>
	//ICW4
	outb(0x21,0x01);
  8002e1:	be 01 00 00 00       	mov    esi,0x1
  8002e6:	bf 21 00 00 00       	mov    edi,0x21
  8002eb:	e8 20 4b 00 00       	call   804e10 <outb>
	outb(0xA1,0x01);
  8002f0:	be 01 00 00 00       	mov    esi,0x1
  8002f5:	bf a1 00 00 00       	mov    edi,0xa1
  8002fa:	e8 11 4b 00 00       	call   804e10 <outb>

    turn_on_int();
  8002ff:	b8 00 00 00 00       	mov    eax,0x0
  800304:	e8 41 4b 00 00       	call   804e4a <turn_on_int>

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
  800327:	48 8b 15 32 ab 00 00 	mov    rdx,QWORD PTR [rip+0xab32]        # 80ae60 <idt>
  80032e:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800332:	48 c1 e0 04          	shl    rax,0x4
  800336:	48 01 d0             	add    rax,rdx
  800339:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80033d:	66 89 10             	mov    WORD PTR [rax],dx
    idt[index].offset_mid=(offset>>16)&0xffff;
  800340:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800344:	48 c1 e8 10          	shr    rax,0x10
  800348:	48 89 c2             	mov    rdx,rax
  80034b:	48 8b 0d 0e ab 00 00 	mov    rcx,QWORD PTR [rip+0xab0e]        # 80ae60 <idt>
  800352:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800356:	48 c1 e0 04          	shl    rax,0x4
  80035a:	48 01 c8             	add    rax,rcx
  80035d:	66 89 50 06          	mov    WORD PTR [rax+0x6],dx
    idt[index].offset_high=(offset>>32)&0x0000ffff;
  800361:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800365:	48 c1 e8 20          	shr    rax,0x20
  800369:	89 c1                	mov    ecx,eax
  80036b:	48 8b 15 ee aa 00 00 	mov    rdx,QWORD PTR [rip+0xaaee]        # 80ae60 <idt>
  800372:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  800376:	48 c1 e0 04          	shl    rax,0x4
  80037a:	48 01 c2             	add    rdx,rax
  80037d:	0f b7 c1             	movzx  eax,cx
  800380:	89 42 08             	mov    DWORD PTR [rdx+0x8],eax
    idt[index].attr=attr;
  800383:	48 8b 15 d6 aa 00 00 	mov    rdx,QWORD PTR [rip+0xaad6]        # 80ae60 <idt>
  80038a:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80038e:	48 c1 e0 04          	shl    rax,0x4
  800392:	48 01 c2             	add    rdx,rax
  800395:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  800399:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
    idt[index].selector=selector;
  80039d:	48 8b 15 bc aa 00 00 	mov    rdx,QWORD PTR [rip+0xaabc]        # 80ae60 <idt>
  8003a4:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  8003a8:	48 c1 e0 04          	shl    rax,0x4
  8003ac:	48 01 c2             	add    rdx,rax
  8003af:	0f b7 45 f8          	movzx  eax,WORD PTR [rbp-0x8]
  8003b3:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    idt[index].rsvd=0;
  8003b7:	48 8b 15 a2 aa 00 00 	mov    rdx,QWORD PTR [rip+0xaaa2]        # 80ae60 <idt>
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
  8003e1:	e8 58 4a 00 00       	call   804e3e <eoi>
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
  8003fb:	e8 3e 4a 00 00       	call   804e3e <eoi>
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
  800415:	e8 24 4a 00 00       	call   804e3e <eoi>
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
  80042f:	e8 0a 4a 00 00       	call   804e3e <eoi>
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
  800449:	e8 f0 49 00 00       	call   804e3e <eoi>
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
  800463:	e8 d6 49 00 00       	call   804e3e <eoi>
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
  80047c:	e8 bd 49 00 00       	call   804e3e <eoi>
    report_back_trace_of_err();
  800481:	b8 00 00 00 00       	mov    eax,0x0
  800486:	e8 df 49 00 00       	call   804e6a <report_back_trace_of_err>
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
  8004a1:	e8 98 49 00 00       	call   804e3e <eoi>
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
  8004bb:	e8 7e 49 00 00       	call   804e3e <eoi>
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
  8004d4:	e8 65 49 00 00       	call   804e3e <eoi>
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
  8004ed:	e8 4c 49 00 00       	call   804e3e <eoi>
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
  800507:	e8 32 49 00 00       	call   804e3e <eoi>
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
  800521:	e8 18 49 00 00       	call   804e3e <eoi>
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
  800545:	e8 f4 48 00 00       	call   804e3e <eoi>
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
  800562:	e8 d7 48 00 00       	call   804e3e <eoi>
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
  80059b:	48 8b 04 c5 a0 25 81 	mov    rax,QWORD PTR [rax*8+0x8125a0]
  8005a2:	00 
  8005a3:	3e ff e0             	notrack jmp rax
    {
        case 0:return reg_device(b);
  8005a6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005a9:	48 98                	cdqe   
  8005ab:	48 89 c7             	mov    rdi,rax
  8005ae:	e8 b1 24 00 00       	call   802a64 <reg_device>
  8005b3:	e9 f7 01 00 00       	jmp    8007af <syscall+0x241>
        case 1:return dispose_device(b);
  8005b8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005bb:	89 c7                	mov    edi,eax
  8005bd:	e8 01 2f 00 00       	call   8034c3 <dispose_device>
  8005c2:	e9 e8 01 00 00       	jmp    8007af <syscall+0x241>
        case 2:return reg_driver(b);
  8005c7:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005ca:	48 98                	cdqe   
  8005cc:	48 89 c7             	mov    rdi,rax
  8005cf:	e8 78 27 00 00       	call   802d4c <reg_driver>
  8005d4:	e9 d6 01 00 00       	jmp    8007af <syscall+0x241>
        case 3:return dispose_driver(b);
  8005d9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005dc:	48 98                	cdqe   
  8005de:	48 89 c7             	mov    rdi,rax
  8005e1:	e8 7b 2f 00 00       	call   803561 <dispose_driver>
  8005e6:	e9 c4 01 00 00       	jmp    8007af <syscall+0x241>
        case 4:return call_drv_func(b,c,d);
  8005eb:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8005ee:	48 98                	cdqe   
  8005f0:	48 89 c2             	mov    rdx,rax
  8005f3:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8005f6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8005f9:	89 ce                	mov    esi,ecx
  8005fb:	89 c7                	mov    edi,eax
  8005fd:	e8 6a 2c 00 00       	call   80326c <call_drv_func>
  800602:	e9 a8 01 00 00       	jmp    8007af <syscall+0x241>
        case 5:return req_page_at(b,c);
  800607:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80060a:	48 98                	cdqe   
  80060c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80060f:	89 d6                	mov    esi,edx
  800611:	48 89 c7             	mov    rdi,rax
  800614:	e8 32 11 00 00       	call   80174b <req_page_at>
  800619:	e9 91 01 00 00       	jmp    8007af <syscall+0x241>
        case 6:return free_page(b);
  80061e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800621:	48 98                	cdqe   
  800623:	48 89 c7             	mov    rdi,rax
  800626:	e8 34 0f 00 00       	call   80155f <free_page>
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
  800648:	e8 a3 41 00 00       	call   8047f0 <reg_proc>
  80064d:	e9 5d 01 00 00       	jmp    8007af <syscall+0x241>
        case 8:del_proc(b);
  800652:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800655:	89 c7                	mov    edi,eax
  800657:	e8 66 3f 00 00       	call   8045c2 <del_proc>
        case 10:chk_vm(b,c);
  80065c:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80065f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800662:	89 d6                	mov    esi,edx
  800664:	89 c7                	mov    edi,eax
  800666:	e8 b9 11 00 00       	call   801824 <chk_vm>
        case 11:return sys_open(b,c);
  80066b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80066e:	48 98                	cdqe   
  800670:	48 89 c2             	mov    rdx,rax
  800673:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800676:	89 c6                	mov    esi,eax
  800678:	48 89 d7             	mov    rdi,rdx
  80067b:	e8 88 15 00 00       	call   801c08 <sys_open>
  800680:	e9 2a 01 00 00       	jmp    8007af <syscall+0x241>
        case 12:return sys_close(b);
  800685:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800688:	89 c7                	mov    edi,eax
  80068a:	e8 42 1a 00 00       	call   8020d1 <sys_close>
  80068f:	e9 1b 01 00 00       	jmp    8007af <syscall+0x241>
        case 13:return sys_read(b,c,d);
  800694:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  800697:	48 98                	cdqe   
  800699:	48 89 c1             	mov    rcx,rax
  80069c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  80069f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006a2:	48 89 ce             	mov    rsi,rcx
  8006a5:	89 c7                	mov    edi,eax
  8006a7:	e8 3b 1b 00 00       	call   8021e7 <sys_read>
  8006ac:	e9 fe 00 00 00       	jmp    8007af <syscall+0x241>
        case 14:return sys_write(b,c,d);
  8006b1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8006b4:	48 98                	cdqe   
  8006b6:	48 89 c1             	mov    rcx,rax
  8006b9:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006bc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006bf:	48 89 ce             	mov    rsi,rcx
  8006c2:	89 c7                	mov    edi,eax
  8006c4:	e8 8d 1a 00 00       	call   802156 <sys_write>
  8006c9:	e9 e1 00 00 00       	jmp    8007af <syscall+0x241>
        case 15:return sys_seek(b,c,d);
  8006ce:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006d1:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006d4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006d7:	89 ce                	mov    esi,ecx
  8006d9:	89 c7                	mov    edi,eax
  8006db:	e8 98 1b 00 00       	call   802278 <sys_seek>
  8006e0:	e9 ca 00 00 00       	jmp    8007af <syscall+0x241>
        case 16:return sys_tell(b);
  8006e5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006e8:	89 c7                	mov    edi,eax
  8006ea:	e8 d0 1b 00 00       	call   8022bf <sys_tell>
  8006ef:	e9 bb 00 00 00       	jmp    8007af <syscall+0x241>
        case 17:return reg_vol(b,c,d);
  8006f4:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  8006f7:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  8006fa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8006fd:	89 ce                	mov    esi,ecx
  8006ff:	89 c7                	mov    edi,eax
  800701:	b8 00 00 00 00       	mov    eax,0x0
  800706:	e8 f2 13 00 00       	call   801afd <reg_vol>
  80070b:	e9 9f 00 00 00       	jmp    8007af <syscall+0x241>
        case 18:return free_vol(b);
  800710:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800713:	89 c7                	mov    edi,eax
  800715:	b8 00 00 00 00       	mov    eax,0x0
  80071a:	e8 c2 13 00 00       	call   801ae1 <free_vol>
  80071f:	e9 8b 00 00 00       	jmp    8007af <syscall+0x241>
        case 19:return execute(b);
  800724:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800727:	48 98                	cdqe   
  800729:	48 89 c7             	mov    rdi,rax
  80072c:	e8 c2 49 00 00       	call   8050f3 <execute>
  800731:	eb 7c                	jmp    8007af <syscall+0x241>
        case SYSCALL_EXIT:return sys_exit(b);
  800733:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800736:	89 c7                	mov    edi,eax
  800738:	e8 92 40 00 00       	call   8047cf <sys_exit>
  80073d:	eb 70                	jmp    8007af <syscall+0x241>
        case SYSCALL_CALL:return exec_call(b);
  80073f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800742:	48 98                	cdqe   
  800744:	48 89 c7             	mov    rdi,rax
  800747:	e8 a2 4a 00 00       	call   8051ee <exec_call>
  80074c:	eb 61                	jmp    8007af <syscall+0x241>
        case SYSCALL_MKFIFO:return sys_mkfifo(b);
  80074e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800751:	89 c7                	mov    edi,eax
  800753:	e8 2a 12 00 00       	call   801982 <sys_mkfifo>
  800758:	eb 55                	jmp    8007af <syscall+0x241>
        case SYSCALL_MALLOC:return sys_malloc(b);
  80075a:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80075d:	89 c7                	mov    edi,eax
  80075f:	e8 27 42 00 00       	call   80498b <sys_malloc>
  800764:	eb 49                	jmp    8007af <syscall+0x241>
        case SYSCALL_FREE:return sys_free(b);
  800766:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800769:	89 c7                	mov    edi,eax
  80076b:	e8 c2 43 00 00       	call   804b32 <sys_free>
  800770:	eb 3d                	jmp    8007af <syscall+0x241>
        case SYSCALL_KB_READC:return sys_getkbc();
  800772:	b8 00 00 00 00       	mov    eax,0x0
  800777:	e8 6d 60 00 00       	call   8067e9 <sys_getkbc>
  80077c:	0f be c0             	movsx  eax,al
  80077f:	eb 2e                	jmp    8007af <syscall+0x241>
        case SYSCALL_FIND_DEV:return sys_find_dev(b);
  800781:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  800784:	48 98                	cdqe   
  800786:	48 89 c7             	mov    rdi,rax
  800789:	e8 0e 27 00 00       	call   802e9c <sys_find_dev>
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
  8007a8:	e8 81 27 00 00       	call   802f2e <sys_operate_dev>
  8007ad:	eb 00                	jmp    8007af <syscall+0x241>
    }
    // __asm__ volatile("mov %0,%%eax\r\n mov %1,%%ebx\r\n mov %2,%%ecx\r\n mov %3,%%edx\r\n mov %4,%%esi\r\n mov %5,%%edi"\
    // ::"m"(func),"m"(a),"m"(b),"m"(c),"m"(d),"m"(e));
    // __asm__ volatile("int $0x80\r\n leave\r\n ret");
}
  8007af:	c9                   	leave  
  8007b0:	c3                   	ret    

00000000008007b1 <wrmsr>:
void wrmsr(unsigned long address,unsigned long value)
{
  8007b1:	f3 0f 1e fa          	endbr64 
  8007b5:	55                   	push   rbp
  8007b6:	48 89 e5             	mov    rbp,rsp
  8007b9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8007bd:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    __asm__ __volatile__	("wrmsr	\n\t"::"d"(value >> 32),"a"(value & 0xffffffff),"c"(address):"memory");
  8007c1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8007c5:	48 c1 e8 20          	shr    rax,0x20
  8007c9:	48 89 c2             	mov    rdx,rax
  8007cc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8007d0:	89 c0                	mov    eax,eax
  8007d2:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  8007d6:	0f 30                	wrmsr  
  8007d8:	90                   	nop
  8007d9:	5d                   	pop    rbp
  8007da:	c3                   	ret    

00000000008007db <main>:
#include <kb.h>
#include "com.h"

int manage_proc_lock=1;
void main(unsigned int magic,void* addr)
{
  8007db:	f3 0f 1e fa          	endbr64 
  8007df:	55                   	push   rbp
  8007e0:	48 89 e5             	mov    rbp,rsp
  8007e3:	48 83 ec 60          	sub    rsp,0x60
  8007e7:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  8007ea:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi

    struct multiboot_header* mbi=0ul;
  8007ee:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8007f5:	00 
    mbi=(struct multiboot_header*)addr;
  8007f6:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8007fa:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    init_logging();
  8007fe:	b8 00 00 00 00       	mov    eax,0x0
  800803:	e8 72 03 00 00       	call   800b7a <init_logging>
    }
    //获取tags
    struct multiboot_tag *tag;

	unsigned size;
    size = *(unsigned long*)addr;
  800808:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  80080c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80080f:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
//    //printf("Announced mbi size 0x%x\n", size);
	for (tag = (struct multiboot_tag *)(addr + 8);
  800812:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  800816:	48 83 c0 08          	add    rax,0x8
  80081a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80081e:	e9 5b 02 00 00       	jmp    800a7e <main+0x2a3>
		 tag->type != MULTIBOOT_TAG_TYPE_END;
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
	{
		//printf("Tag 0x%x, Size 0x%x\n", tag->type, tag->size);
		switch (tag->type)
  800823:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800827:	8b 00                	mov    eax,DWORD PTR [rax]
  800829:	83 f8 08             	cmp    eax,0x8
  80082c:	0f 87 39 02 00 00    	ja     800a6b <main+0x290>
  800832:	89 c0                	mov    eax,eax
  800834:	48 8b 04 c5 08 29 81 	mov    rax,QWORD PTR [rax*8+0x812908]
  80083b:	00 
  80083c:	3e ff e0             	notrack jmp rax
			break;
		case MULTIBOOT_TAG_TYPE_BASIC_MEMINFO:
			//printf("mem_lower = %uKB, mem_upper = %uKB\n",
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_lower,
//				   ((struct multiboot_tag_basic_meminfo *)tag)->mem_upper);
			set_high_mem_base(((struct multiboot_tag_basic_meminfo *)tag)->mem_lower);
  80083f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800843:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  800846:	89 c7                	mov    edi,eax
  800848:	e8 0b 08 00 00       	call   801058 <set_high_mem_base>
			break;
  80084d:	e9 19 02 00 00       	jmp    800a6b <main+0x290>

			break;
		case MULTIBOOT_TAG_TYPE_MMAP:
		{
			//printf("mmap\n");
            for (multiboot_memory_map_t * mmap = ((struct multiboot_tag_mmap *)tag)->entries;
  800852:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800856:	48 83 c0 10          	add    rax,0x10
  80085a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80085e:	eb 37                	jmp    800897 <main+0xbc>
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
            {
                set_mem_area(mmap->addr,mmap->len,mmap->type);
  800860:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800864:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  800867:	89 c2                	mov    edx,eax
  800869:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80086d:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  800871:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800875:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800878:	48 89 ce             	mov    rsi,rcx
  80087b:	48 89 c7             	mov    rdi,rax
  80087e:	e8 ec 07 00 00       	call   80106f <set_mem_area>
                    mmap = (multiboot_memory_map_t *)((unsigned long)mmap + ((struct multiboot_tag_mmap *)tag)->entry_size))
  800883:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800887:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80088a:	89 c2                	mov    edx,eax
  80088c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800890:	48 01 d0             	add    rax,rdx
  800893:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
                    (multiboot_uint8_t *)mmap < (multiboot_uint8_t *)tag + tag->size;
  800897:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80089b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80089e:	89 c2                	mov    edx,eax
  8008a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008a4:	48 01 d0             	add    rax,rdx
  8008a7:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  8008ab:	72 b3                	jb     800860 <main+0x85>
            }

		}
		break;
  8008ad:	e9 b9 01 00 00       	jmp    800a6b <main+0x290>
		case MULTIBOOT_TAG_TYPE_FRAMEBUFFER:
		{
			multiboot_uint32_t color;
			unsigned i;
			struct multiboot_tag_framebuffer *tagfb = (struct multiboot_tag_framebuffer *)tag;
  8008b2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8008b6:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
			void *fb = (void *) FRAMEBUFFER_ADDR;
  8008ba:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x40000000
  8008c1:	40 
			set_framebuffer(*tagfb);
  8008c2:	48 83 ec 08          	sub    rsp,0x8
  8008c6:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8008ca:	ff 70 20             	push   QWORD PTR [rax+0x20]
  8008cd:	ff 70 18             	push   QWORD PTR [rax+0x18]
  8008d0:	ff 70 10             	push   QWORD PTR [rax+0x10]
  8008d3:	ff 70 08             	push   QWORD PTR [rax+0x8]
  8008d6:	ff 30                	push   QWORD PTR [rax]
  8008d8:	e8 b8 53 00 00       	call   805c95 <set_framebuffer>
  8008dd:	48 83 c4 30          	add    rsp,0x30

            init_framebuffer();
  8008e1:	b8 00 00 00 00       	mov    eax,0x0
  8008e6:	e8 f5 51 00 00       	call   805ae0 <init_framebuffer>
			switch (tagfb->common.framebuffer_type)
  8008eb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8008ef:	0f b6 40 1d          	movzx  eax,BYTE PTR [rax+0x1d]
  8008f3:	0f b6 c0             	movzx  eax,al
  8008f6:	83 f8 02             	cmp    eax,0x2
  8008f9:	0f 84 5a 01 00 00    	je     800a59 <main+0x27e>
  8008ff:	83 f8 02             	cmp    eax,0x2
  800902:	0f 8f 5a 01 00 00    	jg     800a62 <main+0x287>
  800908:	85 c0                	test   eax,eax
  80090a:	74 0e                	je     80091a <main+0x13f>
  80090c:	83 f8 01             	cmp    eax,0x1
  80090f:	0f 84 15 01 00 00    	je     800a2a <main+0x24f>
  800915:	e9 48 01 00 00       	jmp    800a62 <main+0x287>
			case MULTIBOOT_FRAMEBUFFER_TYPE_INDEXED:
			{
				unsigned best_distance, distance;
				struct multiboot_color *palette;

				palette = tagfb->framebuffer_palette;
  80091a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80091e:	48 83 c0 22          	add    rax,0x22
  800922:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

				color = 0;
  800926:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
				best_distance = 4 * 256 * 256;
  80092d:	c7 45 e8 00 00 04 00 	mov    DWORD PTR [rbp-0x18],0x40000

				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800934:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80093b:	e9 d4 00 00 00       	jmp    800a14 <main+0x239>
				{
					distance = (0xff - palette[i].blue) * (0xff - palette[i].blue) + palette[i].red * palette[i].red + palette[i].green * palette[i].green;
  800940:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800943:	48 89 d0             	mov    rax,rdx
  800946:	48 01 c0             	add    rax,rax
  800949:	48 01 c2             	add    rdx,rax
  80094c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800950:	48 01 d0             	add    rax,rdx
  800953:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  800957:	0f b6 c0             	movzx  eax,al
  80095a:	ba ff 00 00 00       	mov    edx,0xff
  80095f:	89 d1                	mov    ecx,edx
  800961:	29 c1                	sub    ecx,eax
  800963:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  800966:	48 89 d0             	mov    rax,rdx
  800969:	48 01 c0             	add    rax,rax
  80096c:	48 01 c2             	add    rdx,rax
  80096f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800973:	48 01 d0             	add    rax,rdx
  800976:	0f b6 40 02          	movzx  eax,BYTE PTR [rax+0x2]
  80097a:	0f b6 d0             	movzx  edx,al
  80097d:	b8 ff 00 00 00       	mov    eax,0xff
  800982:	29 d0                	sub    eax,edx
  800984:	89 ce                	mov    esi,ecx
  800986:	0f af f0             	imul   esi,eax
  800989:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80098c:	48 89 d0             	mov    rax,rdx
  80098f:	48 01 c0             	add    rax,rax
  800992:	48 01 c2             	add    rdx,rax
  800995:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  800999:	48 01 d0             	add    rax,rdx
  80099c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80099f:	0f b6 c8             	movzx  ecx,al
  8009a2:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009a5:	48 89 d0             	mov    rax,rdx
  8009a8:	48 01 c0             	add    rax,rax
  8009ab:	48 01 c2             	add    rdx,rax
  8009ae:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009b2:	48 01 d0             	add    rax,rdx
  8009b5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8009b8:	0f b6 c0             	movzx  eax,al
  8009bb:	0f af c1             	imul   eax,ecx
  8009be:	01 c6                	add    esi,eax
  8009c0:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009c3:	48 89 d0             	mov    rax,rdx
  8009c6:	48 01 c0             	add    rax,rax
  8009c9:	48 01 c2             	add    rdx,rax
  8009cc:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009d0:	48 01 d0             	add    rax,rdx
  8009d3:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  8009d7:	0f b6 c8             	movzx  ecx,al
  8009da:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8009dd:	48 89 d0             	mov    rax,rdx
  8009e0:	48 01 c0             	add    rax,rax
  8009e3:	48 01 c2             	add    rdx,rax
  8009e6:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8009ea:	48 01 d0             	add    rax,rdx
  8009ed:	0f b6 40 01          	movzx  eax,BYTE PTR [rax+0x1]
  8009f1:	0f b6 c0             	movzx  eax,al
  8009f4:	0f af c1             	imul   eax,ecx
  8009f7:	01 f0                	add    eax,esi
  8009f9:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
					if (distance < best_distance)
  8009fc:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  8009ff:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  800a02:	73 0c                	jae    800a10 <main+0x235>
					{
						color = i;
  800a04:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  800a07:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
						best_distance = distance;
  800a0a:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  800a0d:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
				for (i = 0; i < tagfb->framebuffer_palette_num_colors; i++)
  800a10:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  800a14:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a18:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
  800a1c:	0f b7 c0             	movzx  eax,ax
  800a1f:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  800a22:	0f 82 18 ff ff ff    	jb     800940 <main+0x165>
					}
				}
			}
			break;
  800a28:	eb 40                	jmp    800a6a <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_RGB:
				color = ((1 << tagfb->framebuffer_blue_mask_size) - 1) << tagfb->framebuffer_blue_field_position;
  800a2a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a2e:	0f b6 40 25          	movzx  eax,BYTE PTR [rax+0x25]
  800a32:	0f b6 c0             	movzx  eax,al
  800a35:	ba 01 00 00 00       	mov    edx,0x1
  800a3a:	89 c1                	mov    ecx,eax
  800a3c:	d3 e2                	shl    edx,cl
  800a3e:	89 d0                	mov    eax,edx
  800a40:	8d 50 ff             	lea    edx,[rax-0x1]
  800a43:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800a47:	0f b6 40 24          	movzx  eax,BYTE PTR [rax+0x24]
  800a4b:	0f b6 c0             	movzx  eax,al
  800a4e:	89 c1                	mov    ecx,eax
  800a50:	d3 e2                	shl    edx,cl
  800a52:	89 d0                	mov    eax,edx
  800a54:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
				break;
  800a57:	eb 11                	jmp    800a6a <main+0x28f>

			case MULTIBOOT_FRAMEBUFFER_TYPE_EGA_TEXT:
				color = '\\' | 0x0100;
  800a59:	c7 45 c4 5c 01 00 00 	mov    DWORD PTR [rbp-0x3c],0x15c
				break;
  800a60:	eb 08                	jmp    800a6a <main+0x28f>

			default:
				color = 0xffffffff;
  800a62:	c7 45 c4 ff ff ff ff 	mov    DWORD PTR [rbp-0x3c],0xffffffff
				break;
  800a69:	90                   	nop
			}

			break;
  800a6a:	90                   	nop
		 tag = (struct multiboot_tag *)((u8 *)tag + ((tag->size + 7) & ~7)))
  800a6b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800a6f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800a72:	83 c0 07             	add    eax,0x7
  800a75:	89 c0                	mov    eax,eax
  800a77:	83 e0 f8             	and    eax,0xfffffff8
  800a7a:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
		 tag->type != MULTIBOOT_TAG_TYPE_END;
  800a7e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800a82:	8b 00                	mov    eax,DWORD PTR [rax]
  800a84:	85 c0                	test   eax,eax
  800a86:	0f 85 97 fd ff ff    	jne    800823 <main+0x48>
		}
		}
	}
	tag = (struct multiboot_tag *)((multiboot_uint8_t *)tag + ((tag->size + 7) & ~7));
  800a8c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800a90:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  800a93:	83 c0 07             	add    eax,0x7
  800a96:	89 c0                	mov    eax,eax
  800a98:	83 e0 f8             	and    eax,0xfffffff8
  800a9b:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
	//printf("Total mbi size 0x%x\n", (unsigned)tag - addr);
	char disk_count=*(char*)0x475;
  800a9f:	b8 75 04 00 00       	mov    eax,0x475
  800aa4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800aa7:	88 45 db             	mov    BYTE PTR [rbp-0x25],al
	//printf("disk count:%d\n",disk_count);
    init_font();
  800aaa:	b8 00 00 00 00       	mov    eax,0x0
  800aaf:	e8 eb 50 00 00       	call   805b9f <init_font>
    //初始化区域
    //fill_rect(0,0,100,100,255);
    print("gamessis os loaded.\nkernel:>");
  800ab4:	bf c8 28 81 00       	mov    edi,0x8128c8
  800ab9:	e8 93 55 00 00       	call   806051 <print>
    init_int();
  800abe:	b8 00 00 00 00       	mov    eax,0x0
  800ac3:	e8 38 f5 ff ff       	call   800000 <init_int>
    print("int loaded.\n");
  800ac8:	bf e5 28 81 00       	mov    edi,0x8128e5
  800acd:	e8 7f 55 00 00       	call   806051 <print>
    set_tss(0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000,0x400000);
  800ad2:	68 00 00 40 00       	push   0x400000
  800ad7:	68 00 00 40 00       	push   0x400000
  800adc:	68 00 00 40 00       	push   0x400000
  800ae1:	68 00 00 40 00       	push   0x400000
  800ae6:	41 b9 00 00 40 00    	mov    r9d,0x400000
  800aec:	41 b8 00 00 40 00    	mov    r8d,0x400000
  800af2:	b9 00 00 40 00       	mov    ecx,0x400000
  800af7:	ba 00 00 40 00       	mov    edx,0x400000
  800afc:	be 00 00 40 00       	mov    esi,0x400000
  800b01:	bf 00 00 40 00       	mov    edi,0x400000
  800b06:	e8 41 42 00 00       	call   804d4c <set_tss>
  800b0b:	48 83 c4 20          	add    rsp,0x20
    init_memory();
  800b0f:	b8 00 00 00 00       	mov    eax,0x0
  800b14:	e8 0d 08 00 00       	call   801326 <init_memory>
    init_com(PORT_COM1);
  800b19:	bf f8 03 00 00       	mov    edi,0x3f8
  800b1e:	e8 07 98 00 00       	call   80a32a <init_com>
    com_puts("gamessis os loaded.",PORT_COM1);
  800b23:	be f8 03 00 00       	mov    esi,0x3f8
  800b28:	bf f2 28 81 00       	mov    edi,0x8128f2
  800b2d:	e8 44 99 00 00       	call   80a476 <com_puts>
	init_paging();
  800b32:	b8 00 00 00 00       	mov    eax,0x0
  800b37:	e8 11 05 00 00       	call   80104d <init_paging>
 	init_gdt();
  800b3c:	b8 00 00 00 00       	mov    eax,0x0
  800b41:	e8 48 43 00 00       	call   804e8e <init_gdt>
    init_drvdev_man();
  800b46:	b8 00 00 00 00       	mov    eax,0x0
  800b4b:	e8 fa 1e 00 00       	call   802a4a <init_drvdev_man>
    init_proc();
  800b50:	b8 00 00 00 00       	mov    eax,0x0
  800b55:	e8 db 2d 00 00       	call   803935 <init_proc>
    //自带驱动
    //init_tty();
    init_kb();
  800b5a:	b8 00 00 00 00       	mov    eax,0x0
  800b5f:	e8 52 5b 00 00       	call   8066b6 <init_kb>
//    init_disk();

    DISK1_FAT32_FS_init();
  800b64:	b8 00 00 00 00       	mov    eax,0x0
  800b69:	e8 22 8e 00 00       	call   809990 <DISK1_FAT32_FS_init>
    manage_proc_lock=0;
  800b6e:	c7 05 f0 a2 00 00 00 	mov    DWORD PTR [rip+0xa2f0],0x0        # 80ae68 <manage_proc_lock>
  800b75:	00 00 00 

//    extern device *dev_tree[];
//    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
//    mount_fs("fat16",p->par,vmalloc());

    while (1);
  800b78:	eb fe                	jmp    800b78 <main+0x39d>

0000000000800b7a <init_logging>:
static unsigned char* video;
static int xpos,ypos;
/* 将整数 D 转换为字符串并保存在 BUF 中。如果 BASE 为 'd'，则 D 为十进制，如果 BASE 为 'x'，则 D 为十六进制。 */

int init_logging()
{
  800b7a:	f3 0f 1e fa          	endbr64 
  800b7e:	55                   	push   rbp
  800b7f:	48 89 e5             	mov    rbp,rsp
    video=0xb8000;
  800b82:	48 c7 05 73 f4 bf ff 	mov    QWORD PTR [rip+0xffffffffffbff473],0xb8000        # 400000 <video>
  800b89:	00 80 0b 00 
    xpos=0;
  800b8d:	c7 05 71 f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff471],0x0        # 400008 <xpos>
  800b94:	00 00 00 
    ypos=0;
  800b97:	c7 05 6b f4 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbff46b],0x0        # 40000c <ypos>
  800b9e:	00 00 00 
}
  800ba1:	90                   	nop
  800ba2:	5d                   	pop    rbp
  800ba3:	c3                   	ret    

0000000000800ba4 <itoa>:

static void itoa (char *buf, int base, int d)
{
  800ba4:	f3 0f 1e fa          	endbr64 
  800ba8:	55                   	push   rbp
  800ba9:	48 89 e5             	mov    rbp,rsp
  800bac:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
  800bb0:	89 75 c4             	mov    DWORD PTR [rbp-0x3c],esi
  800bb3:	89 55 c0             	mov    DWORD PTR [rbp-0x40],edx
    char *p = buf;
  800bb6:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800bba:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    char *p1, *p2;
    unsigned long ud = d;
  800bbe:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800bc1:	48 98                	cdqe   
  800bc3:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    int divisor = 10;
  800bc7:	c7 45 dc 0a 00 00 00 	mov    DWORD PTR [rbp-0x24],0xa
 
    /* 如果指定了 %d 并且 D 是负数，在开始添上负号。 */
    if (base == 'd' && d < 0)
  800bce:	83 7d c4 64          	cmp    DWORD PTR [rbp-0x3c],0x64
  800bd2:	75 27                	jne    800bfb <itoa+0x57>
  800bd4:	83 7d c0 00          	cmp    DWORD PTR [rbp-0x40],0x0
  800bd8:	79 21                	jns    800bfb <itoa+0x57>
    {
        *p++ = '-';
  800bda:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800bde:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800be2:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800be6:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
        buf++;
  800be9:	48 83 45 c8 01       	add    QWORD PTR [rbp-0x38],0x1
        ud = -d;
  800bee:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
  800bf1:	f7 d8                	neg    eax
  800bf3:	48 98                	cdqe   
  800bf5:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800bf9:	eb 0d                	jmp    800c08 <itoa+0x64>
    }
    else if (base == 'x')
  800bfb:	83 7d c4 78          	cmp    DWORD PTR [rbp-0x3c],0x78
  800bff:	75 07                	jne    800c08 <itoa+0x64>
        divisor = 16;
  800c01:	c7 45 dc 10 00 00 00 	mov    DWORD PTR [rbp-0x24],0x10
 
    /* 用 DIVISOR 去除 UD 直到 UD == 0。 */
    do
    {
        int remainder = ud % divisor;
  800c08:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c0b:	48 63 c8             	movsxd rcx,eax
  800c0e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c12:	ba 00 00 00 00       	mov    edx,0x0
  800c17:	48 f7 f1             	div    rcx
  800c1a:	48 89 d0             	mov    rax,rdx
  800c1d:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
 
        *p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
  800c20:	83 7d d8 09          	cmp    DWORD PTR [rbp-0x28],0x9
  800c24:	7f 0a                	jg     800c30 <itoa+0x8c>
  800c26:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c29:	83 c0 30             	add    eax,0x30
  800c2c:	89 c1                	mov    ecx,eax
  800c2e:	eb 08                	jmp    800c38 <itoa+0x94>
  800c30:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  800c33:	83 c0 57             	add    eax,0x57
  800c36:	89 c1                	mov    ecx,eax
  800c38:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c3c:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800c40:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  800c44:	88 08                	mov    BYTE PTR [rax],cl
    }
    while (ud /= divisor);
  800c46:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  800c49:	48 63 f0             	movsxd rsi,eax
  800c4c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  800c50:	ba 00 00 00 00       	mov    edx,0x0
  800c55:	48 f7 f6             	div    rsi
  800c58:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  800c5c:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
  800c61:	75 a5                	jne    800c08 <itoa+0x64>
 
    /* 在字符串尾添上终结符。 */
    *p = 0;
  800c63:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c67:	c6 00 00             	mov    BYTE PTR [rax],0x0
 
    /* 反转 BUF。 */
    p1 = buf;
  800c6a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  800c6e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    p2 = p - 1;
  800c72:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800c76:	48 83 e8 01          	sub    rax,0x1
  800c7a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    while (p1 < p2)
  800c7e:	eb 2b                	jmp    800cab <itoa+0x107>
    {
        char tmp = *p1;
  800c80:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c84:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800c87:	88 45 d7             	mov    BYTE PTR [rbp-0x29],al
        *p1 = *p2;
  800c8a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c8e:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  800c91:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800c95:	88 10                	mov    BYTE PTR [rax],dl
        *p2 = tmp;
  800c97:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800c9b:	0f b6 55 d7          	movzx  edx,BYTE PTR [rbp-0x29]
  800c9f:	88 10                	mov    BYTE PTR [rax],dl
        p1++;
  800ca1:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
        p2--;
  800ca6:	48 83 6d e8 01       	sub    QWORD PTR [rbp-0x18],0x1
    while (p1 < p2)
  800cab:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800caf:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
  800cb3:	72 cb                	jb     800c80 <itoa+0xdc>
    }
}
  800cb5:	90                   	nop
  800cb6:	90                   	nop
  800cb7:	5d                   	pop    rbp
  800cb8:	c3                   	ret    

0000000000800cb9 <putchar>:
 
/* 在屏幕上输出字符 C 。 */
static void putchar (char c)
{
  800cb9:	f3 0f 1e fa          	endbr64 
  800cbd:	55                   	push   rbp
  800cbe:	48 89 e5             	mov    rbp,rsp
  800cc1:	48 83 ec 20          	sub    rsp,0x20
  800cc5:	89 f8                	mov    eax,edi
  800cc7:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    char s[2]={c,'\0'};
  800cca:	0f b6 45 ec          	movzx  eax,BYTE PTR [rbp-0x14]
  800cce:	88 45 fe             	mov    BYTE PTR [rbp-0x2],al
  800cd1:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
    print(s);
  800cd5:	48 8d 45 fe          	lea    rax,[rbp-0x2]
  800cd9:	48 89 c7             	mov    rdi,rax
  800cdc:	e8 70 53 00 00       	call   806051 <print>
    *(video + (xpos + ypos * COLUMNS) * 2 + 1) = ATTRIBUTE;
 
    xpos++;
    if (xpos >= COLUMNS)
        goto newline;
}
  800ce1:	c9                   	leave  
  800ce2:	c3                   	ret    

0000000000800ce3 <printf>:
 
/* 格式化字符串并在屏幕上输出，就像 libc 函数 printf 一样。 */
void printf (const char *format, ...)
{
  800ce3:	f3 0f 1e fa          	endbr64 
  800ce7:	55                   	push   rbp
  800ce8:	48 89 e5             	mov    rbp,rsp
  800ceb:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  800cf2:	48 89 bd 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdi
  800cf9:	48 89 b5 58 ff ff ff 	mov    QWORD PTR [rbp-0xa8],rsi
  800d00:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  800d07:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  800d0e:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  800d15:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  800d1c:	84 c0                	test   al,al
  800d1e:	74 20                	je     800d40 <printf+0x5d>
  800d20:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  800d24:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  800d28:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  800d2c:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  800d30:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  800d34:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  800d38:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  800d3c:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7
    char **arg = (char **) &format;
  800d40:	48 8d 85 18 ff ff ff 	lea    rax,[rbp-0xe8]
  800d47:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char c;
    char buf[20];
 
    arg++;
  800d4e:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x8
  800d55:	08 
 
    while ((c = *format++) != 0)
  800d56:	e9 29 01 00 00       	jmp    800e84 <printf+0x1a1>
    {
        if (c != '%')
  800d5b:	80 bd 3f ff ff ff 25 	cmp    BYTE PTR [rbp-0xc1],0x25
  800d62:	74 13                	je     800d77 <printf+0x94>
            putchar (c);
  800d64:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800d6b:	89 c7                	mov    edi,eax
  800d6d:	e8 47 ff ff ff       	call   800cb9 <putchar>
  800d72:	e9 0d 01 00 00       	jmp    800e84 <printf+0x1a1>
        else
        {
            char *p;
 
            c = *format++;
  800d77:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800d7e:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800d82:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800d89:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800d8c:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
            switch (c)
  800d92:	0f be 85 3f ff ff ff 	movsx  eax,BYTE PTR [rbp-0xc1]
  800d99:	83 f8 78             	cmp    eax,0x78
  800d9c:	74 26                	je     800dc4 <printf+0xe1>
  800d9e:	83 f8 78             	cmp    eax,0x78
  800da1:	0f 8f be 00 00 00    	jg     800e65 <printf+0x182>
  800da7:	83 f8 75             	cmp    eax,0x75
  800daa:	74 18                	je     800dc4 <printf+0xe1>
  800dac:	83 f8 75             	cmp    eax,0x75
  800daf:	0f 8f b0 00 00 00    	jg     800e65 <printf+0x182>
  800db5:	83 f8 64             	cmp    eax,0x64
  800db8:	74 0a                	je     800dc4 <printf+0xe1>
  800dba:	83 f8 73             	cmp    eax,0x73
  800dbd:	74 41                	je     800e00 <printf+0x11d>
  800dbf:	e9 a1 00 00 00       	jmp    800e65 <printf+0x182>
            {
            case 'd':
            case 'u':
            case 'x':
                itoa (buf, c, *((int *) arg++));
  800dc4:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800dcb:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800dcf:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800dd6:	8b 10                	mov    edx,DWORD PTR [rax]
  800dd8:	0f be 8d 3f ff ff ff 	movsx  ecx,BYTE PTR [rbp-0xc1]
  800ddf:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800de6:	89 ce                	mov    esi,ecx
  800de8:	48 89 c7             	mov    rdi,rax
  800deb:	e8 b4 fd ff ff       	call   800ba4 <itoa>
                p = buf;
  800df0:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  800df7:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                goto string;
  800dfe:	eb 34                	jmp    800e34 <printf+0x151>
                break;
 
            case 's':
                p = *arg++;
  800e00:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e07:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e0b:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e12:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800e15:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
                if (! p)
  800e1c:	48 83 bd 40 ff ff ff 	cmp    QWORD PTR [rbp-0xc0],0x0
  800e23:	00 
  800e24:	75 0d                	jne    800e33 <printf+0x150>
                    p = "(null)";
  800e26:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x812950
  800e2d:	50 29 81 00 
  800e31:	eb 22                	jmp    800e55 <printf+0x172>
 
string:
  800e33:	90                   	nop
                while (*p)
  800e34:	eb 1f                	jmp    800e55 <printf+0x172>
                    putchar (*p++);
  800e36:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e3d:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e41:	48 89 95 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rdx
  800e48:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e4b:	0f be c0             	movsx  eax,al
  800e4e:	89 c7                	mov    edi,eax
  800e50:	e8 64 fe ff ff       	call   800cb9 <putchar>
                while (*p)
  800e55:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  800e5c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e5f:	84 c0                	test   al,al
  800e61:	75 d3                	jne    800e36 <printf+0x153>
                break;
  800e63:	eb 1f                	jmp    800e84 <printf+0x1a1>
 
            default:
                putchar (*((int *) arg++));
  800e65:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  800e6c:	48 8d 50 08          	lea    rdx,[rax+0x8]
  800e70:	48 89 95 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rdx
  800e77:	8b 00                	mov    eax,DWORD PTR [rax]
  800e79:	0f be c0             	movsx  eax,al
  800e7c:	89 c7                	mov    edi,eax
  800e7e:	e8 36 fe ff ff       	call   800cb9 <putchar>
                break;
  800e83:	90                   	nop
    while ((c = *format++) != 0)
  800e84:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  800e8b:	48 8d 50 01          	lea    rdx,[rax+0x1]
  800e8f:	48 89 95 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rdx
  800e96:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  800e99:	88 85 3f ff ff ff    	mov    BYTE PTR [rbp-0xc1],al
  800e9f:	80 bd 3f ff ff ff 00 	cmp    BYTE PTR [rbp-0xc1],0x0
  800ea6:	0f 85 af fe ff ff    	jne    800d5b <printf+0x78>
            }
        }
    }
}
  800eac:	90                   	nop
  800ead:	90                   	nop
  800eae:	c9                   	leave  
  800eaf:	c3                   	ret    

0000000000800eb0 <mmap>:
//以kb为单位
int high_mem_base=1024;
int mmap_t_i=0;

stat_t mmap(addr_t pa,addr_t la,u32 attr)
{
  800eb0:	f3 0f 1e fa          	endbr64 
  800eb4:	55                   	push   rbp
  800eb5:	48 89 e5             	mov    rbp,rsp
  800eb8:	48 83 ec 40          	sub    rsp,0x40
  800ebc:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  800ec0:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  800ec4:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    //从pml4中找到la所属的pml4项目，即属于第几个512GB
    page_item *pdptp= (page_item *) (pml4[la / PML4E_SIZE] & (~0xff));//指向的pdpt表
  800ec7:	48 8b 15 b2 9f 00 00 	mov    rdx,QWORD PTR [rip+0x9fb2]        # 80ae80 <pml4>
  800ece:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800ed2:	48 c1 e8 27          	shr    rax,0x27
  800ed6:	48 c1 e0 03          	shl    rax,0x3
  800eda:	48 01 d0             	add    rax,rdx
  800edd:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800ee0:	b0 00                	mov    al,0x0
  800ee2:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    //因为一个pml指向512gb内存，目前电脑还没有内存能达到这个大小，就不进行检查是否越界的判断

    //在这个512GB（一张pdpt表）中找到la所属的pdpt项目，找到指向的pd
    int pdpti=la%PML4E_SIZE/PDPTE_SIZE;
  800ee6:	48 b8 ff ff ff ff 7f 	movabs rax,0x7fffffffff
  800eed:	00 00 00 
  800ef0:	48 23 45 d0          	and    rax,QWORD PTR [rbp-0x30]
  800ef4:	48 c1 e8 1e          	shr    rax,0x1e
  800ef8:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    page_item* pdp= (page_item *) pdptp[pdpti];//指向的pd
  800efb:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800efe:	48 98                	cdqe   
  800f00:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f07:	00 
  800f08:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f0c:	48 01 d0             	add    rax,rdx
  800f0f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f12:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //检查pdptp是否被占用
    if(!((unsigned long long)pdp&PAGE_PRESENT))
  800f16:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f1a:	83 e0 01             	and    eax,0x1
  800f1d:	48 85 c0             	test   rax,rax
  800f20:	75 45                	jne    800f67 <mmap+0xb7>
    {
        pdp=(page_item*)vmalloc();
  800f22:	b8 00 00 00 00       	mov    eax,0x0
  800f27:	e8 cf 01 00 00       	call   8010fb <vmalloc>
  800f2c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        memset(pdp,0,4096);
  800f30:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f34:	ba 00 10 00 00       	mov    edx,0x1000
  800f39:	be 00 00 00 00       	mov    esi,0x0
  800f3e:	48 89 c7             	mov    rdi,rax
  800f41:	e8 20 96 00 00       	call   80a566 <memset>
        pdptp[pdpti]=(addr_t)pdp|attr;
  800f46:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800f49:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  800f4d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  800f50:	48 98                	cdqe   
  800f52:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800f59:	00 
  800f5a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  800f5e:	48 01 f0             	add    rax,rsi
  800f61:	48 09 ca             	or     rdx,rcx
  800f64:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pdp=(page_item*)((addr_t)pdp&~0xff);
  800f67:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f6b:	b0 00                	mov    al,0x0
  800f6d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

    //在pd中找到la指向的pt
    page_item* pt=(page_item*)pdp[la % PDPTE_SIZE / PDE_SIZE];
  800f71:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800f75:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800f7a:	48 c1 e8 15          	shr    rax,0x15
  800f7e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  800f85:	00 
  800f86:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800f8a:	48 01 d0             	add    rax,rdx
  800f8d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  800f90:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!((unsigned long long)pt & PAGE_PRESENT))
  800f94:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800f98:	83 e0 01             	and    eax,0x1
  800f9b:	48 85 c0             	test   rax,rax
  800f9e:	75 4d                	jne    800fed <mmap+0x13d>
    {
        pt=(page_item*)vmalloc();
  800fa0:	b8 00 00 00 00       	mov    eax,0x0
  800fa5:	e8 51 01 00 00       	call   8010fb <vmalloc>
  800faa:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        memset(pt,0,4096);
  800fae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800fb2:	ba 00 10 00 00       	mov    edx,0x1000
  800fb7:	be 00 00 00 00       	mov    esi,0x0
  800fbc:	48 89 c7             	mov    rdi,rax
  800fbf:	e8 a2 95 00 00       	call   80a566 <memset>
        pdp[la%PDPTE_SIZE/PDE_SIZE]= (addr_t)pt | attr;
  800fc4:	8b 4d cc             	mov    ecx,DWORD PTR [rbp-0x34]
  800fc7:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  800fcb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  800fcf:	25 ff ff ff 3f       	and    eax,0x3fffffff
  800fd4:	48 c1 e8 15          	shr    rax,0x15
  800fd8:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
  800fdf:	00 
  800fe0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  800fe4:	48 01 f0             	add    rax,rsi
  800fe7:	48 09 ca             	or     rdx,rcx
  800fea:	48 89 10             	mov    QWORD PTR [rax],rdx
    }
    pt=(page_item*)((addr_t)pt & ~0xff);
  800fed:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  800ff1:	b0 00                	mov    al,0x0
  800ff3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax

    //在pt中找到la指向的page
    pt[la % PDE_SIZE / PAGE_SIZE]=pa|attr;//映射
  800ff7:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  800ffa:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  800ffe:	81 e2 ff ff 1f 00    	and    edx,0x1fffff
  801004:	48 c1 ea 0c          	shr    rdx,0xc
  801008:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
  80100f:	00 
  801010:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  801014:	48 01 ca             	add    rdx,rcx
  801017:	48 0b 45 d8          	or     rax,QWORD PTR [rbp-0x28]
  80101b:	48 89 02             	mov    QWORD PTR [rdx],rax
    return NORMAL;
  80101e:	b8 00 00 00 00       	mov    eax,0x0
}
  801023:	c9                   	leave  
  801024:	c3                   	ret    

0000000000801025 <mdemap>:

stat_t mdemap(addr_t la)
{
  801025:	f3 0f 1e fa          	endbr64 
  801029:	55                   	push   rbp
  80102a:	48 89 e5             	mov    rbp,rsp
  80102d:	48 83 ec 10          	sub    rsp,0x10
  801031:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return mmap(0l,la,0);
  801035:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801039:	ba 00 00 00 00       	mov    edx,0x0
  80103e:	48 89 c6             	mov    rsi,rax
  801041:	bf 00 00 00 00       	mov    edi,0x0
  801046:	e8 65 fe ff ff       	call   800eb0 <mmap>
}
  80104b:	c9                   	leave  
  80104c:	c3                   	ret    

000000000080104d <init_paging>:
int init_paging()
{
  80104d:	f3 0f 1e fa          	endbr64 
  801051:	55                   	push   rbp
  801052:	48 89 e5             	mov    rbp,rsp
    //设置第一项pdpte，也就是内核空间
//    set_1gb_pdpt(pdpt,0,PAGE_RWX);//设置PDPT0x40000000ul
//    set_page_item(pdpt+1,PD_ADDR,PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX);

    #endif
}
  801055:	90                   	nop
  801056:	5d                   	pop    rbp
  801057:	c3                   	ret    

0000000000801058 <set_high_mem_base>:
void set_high_mem_base(int base)
{
  801058:	f3 0f 1e fa          	endbr64 
  80105c:	55                   	push   rbp
  80105d:	48 89 e5             	mov    rbp,rsp
  801060:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    high_mem_base=base;
  801063:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801066:	89 05 2c 9e 00 00    	mov    DWORD PTR [rip+0x9e2c],eax        # 80ae98 <high_mem_base>
}
  80106c:	90                   	nop
  80106d:	5d                   	pop    rbp
  80106e:	c3                   	ret    

000000000080106f <set_mem_area>:
void set_mem_area(unsigned long base, unsigned long len, unsigned long type)
{
  80106f:	f3 0f 1e fa          	endbr64 
  801073:	55                   	push   rbp
  801074:	48 89 e5             	mov    rbp,rsp
  801077:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80107b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80107f:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
    mmap_struct[mmap_t_i].base=base;
  801083:	8b 05 97 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff197]        # 400220 <mmap_t_i>
  801089:	48 63 d0             	movsxd rdx,eax
  80108c:	48 89 d0             	mov    rax,rdx
  80108f:	48 01 c0             	add    rax,rax
  801092:	48 01 d0             	add    rax,rdx
  801095:	48 c1 e0 03          	shl    rax,0x3
  801099:	48 8d 90 40 00 40 00 	lea    rdx,[rax+0x400040]
  8010a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8010a4:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i].len=len;
  8010a7:	8b 05 73 f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff173]        # 400220 <mmap_t_i>
  8010ad:	48 63 d0             	movsxd rdx,eax
  8010b0:	48 89 d0             	mov    rax,rdx
  8010b3:	48 01 c0             	add    rax,rax
  8010b6:	48 01 d0             	add    rax,rdx
  8010b9:	48 c1 e0 03          	shl    rax,0x3
  8010bd:	48 8d 90 48 00 40 00 	lea    rdx,[rax+0x400048]
  8010c4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8010c8:	48 89 02             	mov    QWORD PTR [rdx],rax
    mmap_struct[mmap_t_i++].type=type;
  8010cb:	8b 05 4f f1 bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbff14f]        # 400220 <mmap_t_i>
  8010d1:	8d 50 01             	lea    edx,[rax+0x1]
  8010d4:	89 15 46 f1 bf ff    	mov    DWORD PTR [rip+0xffffffffffbff146],edx        # 400220 <mmap_t_i>
  8010da:	48 63 d0             	movsxd rdx,eax
  8010dd:	48 89 d0             	mov    rax,rdx
  8010e0:	48 01 c0             	add    rax,rax
  8010e3:	48 01 d0             	add    rax,rdx
  8010e6:	48 c1 e0 03          	shl    rax,0x3
  8010ea:	48 8d 90 50 00 40 00 	lea    rdx,[rax+0x400050]
  8010f1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8010f5:	48 89 02             	mov    QWORD PTR [rdx],rax
}
  8010f8:	90                   	nop
  8010f9:	5d                   	pop    rbp
  8010fa:	c3                   	ret    

00000000008010fb <vmalloc>:
addr_t vmalloc()
{
  8010fb:	f3 0f 1e fa          	endbr64 
  8010ff:	55                   	push   rbp
  801100:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<VMALLOC_PGN/32;i++)
  801103:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80110a:	eb 76                	jmp    801182 <vmalloc+0x87>
    {
        for(int j=0;j<32;j++)
  80110c:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  801113:	eb 63                	jmp    801178 <vmalloc+0x7d>
        {
            if(!(vmalloc_map[i]&(1<<j)))
  801115:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801118:	48 98                	cdqe   
  80111a:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801121:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801124:	be 01 00 00 00       	mov    esi,0x1
  801129:	89 c1                	mov    ecx,eax
  80112b:	d3 e6                	shl    esi,cl
  80112d:	89 f0                	mov    eax,esi
  80112f:	21 d0                	and    eax,edx
  801131:	85 c0                	test   eax,eax
  801133:	75 3f                	jne    801174 <vmalloc+0x79>
            {
                vmalloc_map[i]|=(1<<j);
  801135:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801138:	48 98                	cdqe   
  80113a:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  801141:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801144:	be 01 00 00 00       	mov    esi,0x1
  801149:	89 c1                	mov    ecx,eax
  80114b:	d3 e6                	shl    esi,cl
  80114d:	89 f0                	mov    eax,esi
  80114f:	09 c2                	or     edx,eax
  801151:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801154:	48 98                	cdqe   
  801156:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
                return VMALLOC_BASE+(i*32+j)*0x1000;
  80115d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801160:	c1 e0 05             	shl    eax,0x5
  801163:	89 c2                	mov    edx,eax
  801165:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801168:	01 d0                	add    eax,edx
  80116a:	83 c0 20             	add    eax,0x20
  80116d:	c1 e0 0c             	shl    eax,0xc
  801170:	48 98                	cdqe   
  801172:	eb 14                	jmp    801188 <vmalloc+0x8d>
        for(int j=0;j<32;j++)
  801174:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801178:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  80117c:	7e 97                	jle    801115 <vmalloc+0x1a>
    for(int i=0;i<VMALLOC_PGN/32;i++)
  80117e:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801182:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  801186:	7e 84                	jle    80110c <vmalloc+0x11>
            }
        }
    }
}
  801188:	5d                   	pop    rbp
  801189:	c3                   	ret    

000000000080118a <vmfree>:

int vmfree(addr_t ptr)
{
  80118a:	f3 0f 1e fa          	endbr64 
  80118e:	55                   	push   rbp
  80118f:	48 89 e5             	mov    rbp,rsp
  801192:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=ptr/PAGE_SIZE;
  801196:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80119a:	48 c1 e8 0c          	shr    rax,0xc
  80119e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  8011a1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011a4:	8d 50 1f             	lea    edx,[rax+0x1f]
  8011a7:	85 c0                	test   eax,eax
  8011a9:	0f 48 c2             	cmovs  eax,edx
  8011ac:	c1 f8 05             	sar    eax,0x5
  8011af:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  8011b2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8011b5:	99                   	cdq    
  8011b6:	c1 ea 1b             	shr    edx,0x1b
  8011b9:	01 d0                	add    eax,edx
  8011bb:	83 e0 1f             	and    eax,0x1f
  8011be:	29 d0                	sub    eax,edx
  8011c0:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    vmalloc_map[n]=vmalloc_map[n]&~(unsigned int)(1<<r);
  8011c3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8011c6:	48 98                	cdqe   
  8011c8:	8b 14 85 30 00 40 00 	mov    edx,DWORD PTR [rax*4+0x400030]
  8011cf:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8011d2:	be 01 00 00 00       	mov    esi,0x1
  8011d7:	89 c1                	mov    ecx,eax
  8011d9:	d3 e6                	shl    esi,cl
  8011db:	89 f0                	mov    eax,esi
  8011dd:	f7 d0                	not    eax
  8011df:	21 c2                	and    edx,eax
  8011e1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8011e4:	48 98                	cdqe   
  8011e6:	89 14 85 30 00 40 00 	mov    DWORD PTR [rax*4+0x400030],edx
}
  8011ed:	90                   	nop
  8011ee:	5d                   	pop    rbp
  8011ef:	c3                   	ret    

00000000008011f0 <page_err>:
void page_err(){
  8011f0:	f3 0f 1e fa          	endbr64 
  8011f4:	55                   	push   rbp
  8011f5:	48 89 e5             	mov    rbp,rsp
  8011f8:	53                   	push   rbx
  8011f9:	48 83 ec 28          	sub    rsp,0x28
    asm("cli");
  8011fd:	fa                   	cli    
    print("page err\n");
  8011fe:	bf 58 29 81 00       	mov    edi,0x812958
  801203:	e8 49 4e 00 00       	call   806051 <print>
    unsigned long err_code=0,l_addr=0;
  801208:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  80120f:	00 
  801210:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  801217:	00 
    asm volatile("mov 0(%%rbp),%0":"=r"(err_code));
  801218:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
  80121c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    asm volatile("mov %%cr2,%0":"=r"(l_addr));//试图访问的地址
  801220:	0f 20 d0             	mov    rax,cr2
  801223:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    int p=err_code&1;
  801227:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80122b:	83 e0 01             	and    eax,0x1
  80122e:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

    if(!p)
  801231:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801235:	75 27                	jne    80125e <page_err+0x6e>
        //accessing non-existent page
        //检查地址合法性
        if(l_addr>=MEM_END)
            ;
        //在进程的页表中申请新页
        mmap(vmalloc(),l_addr&~0xfff,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  801237:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80123b:	48 25 00 f0 ff ff    	and    rax,0xfffffffffffff000
  801241:	48 89 c3             	mov    rbx,rax
  801244:	b8 00 00 00 00       	mov    eax,0x0
  801249:	e8 ad fe ff ff       	call   8010fb <vmalloc>
  80124e:	ba 07 00 00 00       	mov    edx,0x7
  801253:	48 89 de             	mov    rsi,rbx
  801256:	48 89 c7             	mov    rdi,rax
  801259:	e8 52 fc ff ff       	call   800eb0 <mmap>
    }
    else
    {
        //page level protection
    }
    p=err_code&2;
  80125e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801262:	83 e0 02             	and    eax,0x2
  801265:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("when writing\n");else //puts("when reading");
  801268:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  80126c:	74 0c                	je     80127a <page_err+0x8a>
  80126e:	bf 62 29 81 00       	mov    edi,0x812962
  801273:	e8 d9 4d 00 00       	call   806051 <print>
  801278:	eb 0a                	jmp    801284 <page_err+0x94>
    p=err_code&4;
  80127a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80127e:	83 e0 04             	and    eax,0x4
  801281:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(!p)print("supervisor mode\n");else //puts("user mode");
  801284:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  801288:	75 0c                	jne    801296 <page_err+0xa6>
  80128a:	bf 70 29 81 00       	mov    edi,0x812970
  80128f:	e8 bd 4d 00 00       	call   806051 <print>
  801294:	eb 0a                	jmp    8012a0 <page_err+0xb0>
    p=err_code&16;
  801296:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80129a:	83 e0 10             	and    eax,0x10
  80129d:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
    if(p)print("an instruction tries to fetch\n");
  8012a0:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
  8012a4:	74 0a                	je     8012b0 <page_err+0xc0>
  8012a6:	bf 88 29 81 00       	mov    edi,0x812988
  8012ab:	e8 a1 4d 00 00       	call   806051 <print>
    unsigned int addr=0;
  8012b0:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x0
    asm volatile("mov 8(%%ebp),%0":"=r"(addr));
  8012b7:	67 8b 45 08          	mov    eax,DWORD PTR [ebp+0x8]
  8012bb:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    printf("occurred at %x(paddr), %x(laddr)\n",addr,l_addr);
  8012be:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  8012c2:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8012c5:	89 c6                	mov    esi,eax
  8012c7:	bf a8 29 81 00       	mov    edi,0x8129a8
  8012cc:	b8 00 00 00 00       	mov    eax,0x0
  8012d1:	e8 0d fa ff ff       	call   800ce3 <printf>
    extern int cur_proc;
    extern struct process *task;
    if(task[cur_proc].pid==1)//系统进程
  8012d6:	48 8b 0d c3 71 c0 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc071c3]        # 4084a0 <task>
  8012dd:	8b 05 29 32 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc13229]        # 41450c <cur_proc>
  8012e3:	48 63 d0             	movsxd rdx,eax
  8012e6:	48 89 d0             	mov    rax,rdx
  8012e9:	48 01 c0             	add    rax,rax
  8012ec:	48 01 d0             	add    rax,rdx
  8012ef:	48 c1 e0 08          	shl    rax,0x8
  8012f3:	48 01 c8             	add    rax,rcx
  8012f6:	8b 00                	mov    eax,DWORD PTR [rax]
  8012f8:	83 f8 01             	cmp    eax,0x1
  8012fb:	75 11                	jne    80130e <page_err+0x11e>
    {
        printf("sys died. please reboot.\n");
  8012fd:	bf ca 29 81 00       	mov    edi,0x8129ca
  801302:	b8 00 00 00 00       	mov    eax,0x0
  801307:	e8 d7 f9 ff ff       	call   800ce3 <printf>
        asm volatile("jmp .");
  80130c:	eb fe                	jmp    80130c <page_err+0x11c>
    }
    //杀死问题进程
//    del_proc(cur_proc);
    // printf("killed the problem process.\n");
    // printf("shell:>");
    eoi();
  80130e:	b8 00 00 00 00       	mov    eax,0x0
  801313:	e8 26 3b 00 00       	call   804e3e <eoi>
    //这里对esp的加法是必要的，因为page fault多push了一个错误码，但是iret识别不了
    __asm__ volatile ("sti \r\n leave\r\n add $8,%esp \r\n iretq");
  801318:	fb                   	sti    
  801319:	c9                   	leave  
  80131a:	83 c4 08             	add    esp,0x8
  80131d:	48 cf                	iretq  
}
  80131f:	90                   	nop
  801320:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  801324:	c9                   	leave  
  801325:	c3                   	ret    

0000000000801326 <init_memory>:
void init_memory()
{
  801326:	f3 0f 1e fa          	endbr64 
  80132a:	55                   	push   rbp
  80132b:	48 89 e5             	mov    rbp,rsp
    extern addr_t _knl_end,_knl_start;//lds中声明的内核的结尾地址，放置位图
    //获取内存大小
    size_t mem_size=mmap_struct[mmap_t_i-1].base+mmap_struct[mmap_t_i-1].len;
  80132e:	8b 05 ec ee bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfeeec]        # 400220 <mmap_t_i>
  801334:	83 e8 01             	sub    eax,0x1
  801337:	48 63 d0             	movsxd rdx,eax
  80133a:	48 89 d0             	mov    rax,rdx
  80133d:	48 01 c0             	add    rax,rax
  801340:	48 01 d0             	add    rax,rdx
  801343:	48 c1 e0 03          	shl    rax,0x3
  801347:	48 05 40 00 40 00    	add    rax,0x400040
  80134d:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  801350:	8b 05 ca ee bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfeeca]        # 400220 <mmap_t_i>
  801356:	83 e8 01             	sub    eax,0x1
  801359:	48 63 d0             	movsxd rdx,eax
  80135c:	48 89 d0             	mov    rax,rdx
  80135f:	48 01 c0             	add    rax,rax
  801362:	48 01 d0             	add    rax,rdx
  801365:	48 c1 e0 03          	shl    rax,0x3
  801369:	48 05 48 00 40 00    	add    rax,0x400048
  80136f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801372:	48 01 c8             	add    rax,rcx
  801375:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    //计算出所需内存页数量
    int pgc=mem_size/PAGE_SIZE;
  801379:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80137d:	48 c1 e8 0c          	shr    rax,0xc
  801381:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    //计算出位图所需的字节数
    int pg_bytes=pgc/32;
  801384:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  801387:	8d 50 1f             	lea    edx,[rax+0x1f]
  80138a:	85 c0                	test   eax,eax
  80138c:	0f 48 c2             	cmovs  eax,edx
  80138f:	c1 f8 05             	sar    eax,0x5
  801392:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    page_map=(unsigned int*)PAGE_4K_ALIGN(0xc00000);
  801395:	48 c7 05 80 ec bf ff 	mov    QWORD PTR [rip+0xffffffffffbfec80],0xc00000        # 400020 <page_map>
  80139c:	00 00 c0 00 
    int* p=page_map;
  8013a0:	48 8b 05 79 ec bf ff 	mov    rax,QWORD PTR [rip+0xffffffffffbfec79]        # 400020 <page_map>
  8013a7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    addr_t curp=0;
  8013ab:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  8013b2:	00 
    for(int i=0;i<mmap_t_i;i++){
  8013b3:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8013ba:	e9 91 00 00 00       	jmp    801450 <init_memory+0x12a>
        int cont=0;
  8013bf:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
        if(mmap_struct[i].type!=MULTIBOOT_MEMORY_AVAILABLE)
  8013c6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8013c9:	48 63 d0             	movsxd rdx,eax
  8013cc:	48 89 d0             	mov    rax,rdx
  8013cf:	48 01 c0             	add    rax,rax
  8013d2:	48 01 d0             	add    rax,rdx
  8013d5:	48 c1 e0 03          	shl    rax,0x3
  8013d9:	48 05 50 00 40 00    	add    rax,0x400050
  8013df:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8013e2:	48 83 f8 01          	cmp    rax,0x1
  8013e6:	74 07                	je     8013ef <init_memory+0xc9>
            cont=-1;
  8013e8:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [rbp-0x10],0xffffffff
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  8013ef:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  8013f6:	eb 15                	jmp    80140d <init_memory+0xe7>
            *(p++)=cont;
  8013f8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8013fc:	48 8d 50 04          	lea    rdx,[rax+0x4]
  801400:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  801404:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  801407:	89 10                	mov    DWORD PTR [rax],edx
        for(int j=0;j<PAGE_4K_ALIGN(mmap_struct[i].len)/PAGE_4K_SIZE/32;j++){
  801409:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80140d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801410:	48 63 c8             	movsxd rcx,eax
  801413:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801416:	48 63 d0             	movsxd rdx,eax
  801419:	48 89 d0             	mov    rax,rdx
  80141c:	48 01 c0             	add    rax,rax
  80141f:	48 01 d0             	add    rax,rdx
  801422:	48 c1 e0 03          	shl    rax,0x3
  801426:	48 05 48 00 40 00    	add    rax,0x400048
  80142c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80142f:	48 8d 90 ff 0f 00 00 	lea    rdx,[rax+0xfff]
  801436:	48 b8 00 f0 ff ff ff 	movabs rax,0xfffffffff000
  80143d:	ff 00 00 
  801440:	48 21 d0             	and    rax,rdx
  801443:	48 c1 e8 11          	shr    rax,0x11
  801447:	48 39 c1             	cmp    rcx,rax
  80144a:	72 ac                	jb     8013f8 <init_memory+0xd2>
    for(int i=0;i<mmap_t_i;i++){
  80144c:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  801450:	8b 05 ca ed bf ff    	mov    eax,DWORD PTR [rip+0xffffffffffbfedca]        # 400220 <mmap_t_i>
  801456:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  801459:	0f 8c 60 ff ff ff    	jl     8013bf <init_memory+0x99>
        }
    }

    //低16M空间直接被内核占用
    for(int i=0;i<128;i++){
  80145f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  801466:	eb 1d                	jmp    801485 <init_memory+0x15f>
        page_map[i]=0xffffffff;
  801468:	48 8b 15 b1 eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfebb1]        # 400020 <page_map>
  80146f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801472:	48 98                	cdqe   
  801474:	48 c1 e0 02          	shl    rax,0x2
  801478:	48 01 d0             	add    rax,rdx
  80147b:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<128;i++){
  801481:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  801485:	83 7d e8 7f          	cmp    DWORD PTR [rbp-0x18],0x7f
  801489:	7e dd                	jle    801468 <init_memory+0x142>
    }
}
  80148b:	90                   	nop
  80148c:	90                   	nop
  80148d:	5d                   	pop    rbp
  80148e:	c3                   	ret    

000000000080148f <req_a_page>:
/*
page_map存储方式:
0x00000000
little end
*/
addr_t req_a_page(){
  80148f:	f3 0f 1e fa          	endbr64 
  801493:	55                   	push   rbp
  801494:	48 89 e5             	mov    rbp,rsp
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  801497:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80149e:	e9 b0 00 00 00       	jmp    801553 <req_a_page+0xc4>
        for(int j=0;j<32;j++){
  8014a3:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8014aa:	e9 96 00 00 00       	jmp    801545 <req_a_page+0xb6>
            unsigned int bit=page_map[i]&(1<<j);
  8014af:	48 8b 15 6a eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb6a]        # 400020 <page_map>
  8014b6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014b9:	48 98                	cdqe   
  8014bb:	48 c1 e0 02          	shl    rax,0x2
  8014bf:	48 01 d0             	add    rax,rdx
  8014c2:	8b 10                	mov    edx,DWORD PTR [rax]
  8014c4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8014c7:	be 01 00 00 00       	mov    esi,0x1
  8014cc:	89 c1                	mov    ecx,eax
  8014ce:	d3 e6                	shl    esi,cl
  8014d0:	89 f0                	mov    eax,esi
  8014d2:	21 d0                	and    eax,edx
  8014d4:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
            if((i*32+j)*4096>=0x100000&&!bit)
  8014d7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014da:	c1 e0 05             	shl    eax,0x5
  8014dd:	89 c2                	mov    edx,eax
  8014df:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8014e2:	01 d0                	add    eax,edx
  8014e4:	c1 e0 0c             	shl    eax,0xc
  8014e7:	3d ff ff 0f 00       	cmp    eax,0xfffff
  8014ec:	7e 53                	jle    801541 <req_a_page+0xb2>
  8014ee:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8014f2:	75 4d                	jne    801541 <req_a_page+0xb2>
            {
                page_map[i]=page_map[i]|(1<<j);
  8014f4:	48 8b 15 25 eb bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfeb25]        # 400020 <page_map>
  8014fb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8014fe:	48 98                	cdqe   
  801500:	48 c1 e0 02          	shl    rax,0x2
  801504:	48 01 d0             	add    rax,rdx
  801507:	8b 10                	mov    edx,DWORD PTR [rax]
  801509:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80150c:	be 01 00 00 00       	mov    esi,0x1
  801511:	89 c1                	mov    ecx,eax
  801513:	d3 e6                	shl    esi,cl
  801515:	89 f0                	mov    eax,esi
  801517:	89 c6                	mov    esi,eax
  801519:	48 8b 0d 00 eb bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfeb00]        # 400020 <page_map>
  801520:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801523:	48 98                	cdqe   
  801525:	48 c1 e0 02          	shl    rax,0x2
  801529:	48 01 c8             	add    rax,rcx
  80152c:	09 f2                	or     edx,esi
  80152e:	89 10                	mov    DWORD PTR [rax],edx
                return i*32+j;//num of page
  801530:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801533:	c1 e0 05             	shl    eax,0x5
  801536:	89 c2                	mov    edx,eax
  801538:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80153b:	01 d0                	add    eax,edx
  80153d:	48 98                	cdqe   
  80153f:	eb 1c                	jmp    80155d <req_a_page+0xce>
        for(int j=0;j<32;j++){
  801541:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801545:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  801549:	0f 8e 60 ff ff ff    	jle    8014af <req_a_page+0x20>
    for(int i=0;i<PAGE_BITMAP_NR;i++){
  80154f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801553:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  801557:	0f 8e 46 ff ff ff    	jle    8014a3 <req_a_page+0x14>

            }
        }
    }
}
  80155d:	5d                   	pop    rbp
  80155e:	c3                   	ret    

000000000080155f <free_page>:

int free_page(char *paddr){
  80155f:	f3 0f 1e fa          	endbr64 
  801563:	55                   	push   rbp
  801564:	48 89 e5             	mov    rbp,rsp
  801567:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int num=(int)paddr/4096;
  80156b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80156f:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  801575:	85 c0                	test   eax,eax
  801577:	0f 48 c2             	cmovs  eax,edx
  80157a:	c1 f8 0c             	sar    eax,0xc
  80157d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int n=num/32;
  801580:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801583:	8d 50 1f             	lea    edx,[rax+0x1f]
  801586:	85 c0                	test   eax,eax
  801588:	0f 48 c2             	cmovs  eax,edx
  80158b:	c1 f8 05             	sar    eax,0x5
  80158e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int r=num%32;
  801591:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801594:	99                   	cdq    
  801595:	c1 ea 1b             	shr    edx,0x1b
  801598:	01 d0                	add    eax,edx
  80159a:	83 e0 1f             	and    eax,0x1f
  80159d:	29 d0                	sub    eax,edx
  80159f:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    page_map[n]=page_map[n]&~(unsigned int)(1<<r);
  8015a2:	48 8b 15 77 ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfea77]        # 400020 <page_map>
  8015a9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8015ac:	48 98                	cdqe   
  8015ae:	48 c1 e0 02          	shl    rax,0x2
  8015b2:	48 01 d0             	add    rax,rdx
  8015b5:	8b 10                	mov    edx,DWORD PTR [rax]
  8015b7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8015ba:	be 01 00 00 00       	mov    esi,0x1
  8015bf:	89 c1                	mov    ecx,eax
  8015c1:	d3 e6                	shl    esi,cl
  8015c3:	89 f0                	mov    eax,esi
  8015c5:	f7 d0                	not    eax
  8015c7:	89 c6                	mov    esi,eax
  8015c9:	48 8b 0d 50 ea bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfea50]        # 400020 <page_map>
  8015d0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8015d3:	48 98                	cdqe   
  8015d5:	48 c1 e0 02          	shl    rax,0x2
  8015d9:	48 01 c8             	add    rax,rcx
  8015dc:	21 f2                	and    edx,esi
  8015de:	89 10                	mov    DWORD PTR [rax],edx
}
  8015e0:	90                   	nop
  8015e1:	5d                   	pop    rbp
  8015e2:	c3                   	ret    

00000000008015e3 <check_page>:
int check_page(int num){
  8015e3:	f3 0f 1e fa          	endbr64 
  8015e7:	55                   	push   rbp
  8015e8:	48 89 e5             	mov    rbp,rsp
  8015eb:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int n=num/32;
  8015ee:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8015f1:	8d 50 1f             	lea    edx,[rax+0x1f]
  8015f4:	85 c0                	test   eax,eax
  8015f6:	0f 48 c2             	cmovs  eax,edx
  8015f9:	c1 f8 05             	sar    eax,0x5
  8015fc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int r=num%32;
  8015ff:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801602:	99                   	cdq    
  801603:	c1 ea 1b             	shr    edx,0x1b
  801606:	01 d0                	add    eax,edx
  801608:	83 e0 1f             	and    eax,0x1f
  80160b:	29 d0                	sub    eax,edx
  80160d:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int bit=page_map[n]&(1<<r);
  801610:	48 8b 15 09 ea bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfea09]        # 400020 <page_map>
  801617:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80161a:	48 98                	cdqe   
  80161c:	48 c1 e0 02          	shl    rax,0x2
  801620:	48 01 d0             	add    rax,rdx
  801623:	8b 10                	mov    edx,DWORD PTR [rax]
  801625:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801628:	be 01 00 00 00       	mov    esi,0x1
  80162d:	89 c1                	mov    ecx,eax
  80162f:	d3 e6                	shl    esi,cl
  801631:	89 f0                	mov    eax,esi
  801633:	21 d0                	and    eax,edx
  801635:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    return bit;
  801638:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  80163b:	5d                   	pop    rbp
  80163c:	c3                   	ret    

000000000080163d <get_phyaddr>:
/*
 * 获得这个页对应的物理内存地址
 * */
int get_phyaddr(int num){
  80163d:	f3 0f 1e fa          	endbr64 
  801641:	55                   	push   rbp
  801642:	48 89 e5             	mov    rbp,rsp
  801645:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return num*0x1000;
  801648:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80164b:	c1 e0 0c             	shl    eax,0xc
}
  80164e:	5d                   	pop    rbp
  80164f:	c3                   	ret    

0000000000801650 <set_page_item>:

void set_page_item(page_item *item_addr,int phy_addr,int attr)
{
  801650:	f3 0f 1e fa          	endbr64 
  801654:	55                   	push   rbp
  801655:	48 89 e5             	mov    rbp,rsp
  801658:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80165c:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  80165f:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    *item_addr=0;
  801662:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801666:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *item_addr|=phy_addr&0xfffff000;
  80166d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801671:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  801674:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  801677:	89 c0                	mov    eax,eax
  801679:	25 00 f0 ff ff       	and    eax,0xfffff000
  80167e:	48 09 c2             	or     rdx,rax
  801681:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801685:	48 89 10             	mov    QWORD PTR [rax],rdx
    *item_addr|=attr;
  801688:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80168c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80168f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  801692:	48 98                	cdqe   
  801694:	48 09 c2             	or     rdx,rax
  801697:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80169b:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  80169e:	90                   	nop
  80169f:	5d                   	pop    rbp
  8016a0:	c3                   	ret    

00000000008016a1 <set_1gb_pdpt>:
void set_1gb_pdpt(page_item* ppdpt,int pa,unsigned int extra_attr)
{
  8016a1:	f3 0f 1e fa          	endbr64 
  8016a5:	55                   	push   rbp
  8016a6:	48 89 e5             	mov    rbp,rsp
  8016a9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8016ad:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  8016b0:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
    *ppdpt=0;
  8016b3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016b7:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *ppdpt|=PAGE_PRESENT|PDPTE_1GB|extra_attr;
  8016be:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016c2:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8016c5:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8016c8:	0c 81                	or     al,0x81
  8016ca:	89 c0                	mov    eax,eax
  8016cc:	48 09 c2             	or     rdx,rax
  8016cf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016d3:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffffc0000000ul;
  8016d6:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8016d9:	25 00 00 00 c0       	and    eax,0xc0000000
  8016de:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *ppdpt|=hipa;
  8016e1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016e5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8016e8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8016eb:	48 09 c2             	or     rdx,rax
  8016ee:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8016f2:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  8016f5:	90                   	nop
  8016f6:	5d                   	pop    rbp
  8016f7:	c3                   	ret    

00000000008016f8 <set_2mb_pde>:
void set_2mb_pde(page_item* pde,int pa)
{
  8016f8:	f3 0f 1e fa          	endbr64 
  8016fc:	55                   	push   rbp
  8016fd:	48 89 e5             	mov    rbp,rsp
  801700:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  801704:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    *pde=0;
  801707:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80170b:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    *pde|=PAGE_PRESENT|PAGE_4MB_PAGE|PDE_4MB_PAT;
  801712:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801716:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801719:	48 0d 81 10 00 00    	or     rax,0x1081
  80171f:	48 89 c2             	mov    rdx,rax
  801722:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801726:	48 89 10             	mov    QWORD PTR [rax],rdx
    unsigned int hipa=pa&0xffc00000;
  801729:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80172c:	25 00 00 c0 ff       	and    eax,0xffc00000
  801731:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    *pde|=hipa;
  801734:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801738:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80173b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80173e:	48 09 c2             	or     rdx,rax
  801741:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801745:	48 89 10             	mov    QWORD PTR [rax],rdx
}
  801748:	90                   	nop
  801749:	5d                   	pop    rbp
  80174a:	c3                   	ret    

000000000080174b <req_page_at>:
        page_map[i]&=(u32)(1<<j);
    return ret;
} */
//在bitmap申请指定的页面,base默认0x1000对齐
addr_t req_page_at(addr_t base,int pgn)
{
  80174b:	f3 0f 1e fa          	endbr64 
  80174f:	55                   	push   rbp
  801750:	48 89 e5             	mov    rbp,rsp
  801753:	48 83 ec 20          	sub    rsp,0x20
  801757:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80175b:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    if(base==0)//不指定地址
  80175e:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  801763:	75 18                	jne    80177d <req_page_at+0x32>
    {
        return get_phyaddr(req_a_page());
  801765:	b8 00 00 00 00       	mov    eax,0x0
  80176a:	e8 20 fd ff ff       	call   80148f <req_a_page>
  80176f:	89 c7                	mov    edi,eax
  801771:	e8 c7 fe ff ff       	call   80163d <get_phyaddr>
  801776:	48 98                	cdqe   
  801778:	e9 a5 00 00 00       	jmp    801822 <req_page_at+0xd7>
    }
    if(!is_pgs_ava(base,pgn))return -1;//先检查
  80177d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  801781:	89 c2                	mov    edx,eax
  801783:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801786:	89 c6                	mov    esi,eax
  801788:	89 d7                	mov    edi,edx
  80178a:	e8 52 01 00 00       	call   8018e1 <is_pgs_ava>
  80178f:	85 c0                	test   eax,eax
  801791:	75 0c                	jne    80179f <req_page_at+0x54>
  801793:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  80179a:	e9 83 00 00 00       	jmp    801822 <req_page_at+0xd7>
    int pgni=base/4096;
  80179f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8017a3:	48 c1 e8 0c          	shr    rax,0xc
  8017a7:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    int pgi=pgni/32;
  8017aa:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017ad:	8d 50 1f             	lea    edx,[rax+0x1f]
  8017b0:	85 c0                	test   eax,eax
  8017b2:	0f 48 c2             	cmovs  eax,edx
  8017b5:	c1 f8 05             	sar    eax,0x5
  8017b8:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    int pgj=pgni%32;
  8017bb:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8017be:	99                   	cdq    
  8017bf:	c1 ea 1b             	shr    edx,0x1b
  8017c2:	01 d0                	add    eax,edx
  8017c4:	83 e0 1f             	and    eax,0x1f
  8017c7:	29 d0                	sub    eax,edx
  8017c9:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<pgn;i++)
  8017cc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8017d3:	eb 40                	jmp    801815 <req_page_at+0xca>
    {
        page_map[i]|=(1<<pgj);
  8017d5:	48 8b 15 44 e8 bf ff 	mov    rdx,QWORD PTR [rip+0xffffffffffbfe844]        # 400020 <page_map>
  8017dc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8017df:	48 98                	cdqe   
  8017e1:	48 c1 e0 02          	shl    rax,0x2
  8017e5:	48 01 d0             	add    rax,rdx
  8017e8:	8b 10                	mov    edx,DWORD PTR [rax]
  8017ea:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  8017ed:	be 01 00 00 00       	mov    esi,0x1
  8017f2:	89 c1                	mov    ecx,eax
  8017f4:	d3 e6                	shl    esi,cl
  8017f6:	89 f0                	mov    eax,esi
  8017f8:	89 c6                	mov    esi,eax
  8017fa:	48 8b 0d 1f e8 bf ff 	mov    rcx,QWORD PTR [rip+0xffffffffffbfe81f]        # 400020 <page_map>
  801801:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801804:	48 98                	cdqe   
  801806:	48 c1 e0 02          	shl    rax,0x2
  80180a:	48 01 c8             	add    rax,rcx
  80180d:	09 f2                	or     edx,esi
  80180f:	89 10                	mov    DWORD PTR [rax],edx
    for(int i=0;i<pgn;i++)
  801811:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801815:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801818:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80181b:	7c b8                	jl     8017d5 <req_page_at+0x8a>
    }
    return 0;
  80181d:	b8 00 00 00 00       	mov    eax,0x0

}
  801822:	c9                   	leave  
  801823:	c3                   	ret    

0000000000801824 <chk_vm>:
int chk_vm(int base, int pgn)
{
  801824:	f3 0f 1e fa          	endbr64 
  801828:	55                   	push   rbp
  801829:	48 89 e5             	mov    rbp,rsp
  80182c:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80182f:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int *pdet=0;
  801832:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  801839:	00 
    asm volatile("mov %%cr3,%0":"=r"(pdet));
  80183a:	0f 20 d8             	mov    rax,cr3
  80183d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int *pt=pdet[base/PAGE_INDEX_SIZE]&0xfffff000;
  801841:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801844:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  80184a:	85 c0                	test   eax,eax
  80184c:	0f 48 c2             	cmovs  eax,edx
  80184f:	c1 f8 16             	sar    eax,0x16
  801852:	48 98                	cdqe   
  801854:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80185b:	00 
  80185c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  801860:	48 01 d0             	add    rax,rdx
  801863:	8b 00                	mov    eax,DWORD PTR [rax]
  801865:	89 c0                	mov    eax,eax
  801867:	25 00 f0 ff ff       	and    eax,0xfffff000
  80186c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  801870:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801873:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  801879:	85 c0                	test   eax,eax
  80187b:	0f 48 c2             	cmovs  eax,edx
  80187e:	c1 f8 16             	sar    eax,0x16
  801881:	48 98                	cdqe   
  801883:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80188a:	00 
  80188b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80188f:	48 01 d0             	add    rax,rdx
  801892:	8b 00                	mov    eax,DWORD PTR [rax]
  801894:	83 e0 01             	and    eax,0x1
  801897:	85 c0                	test   eax,eax
  801899:	74 38                	je     8018d3 <chk_vm+0xaf>
    !(pt[base%PAGE_INDEX_SIZE/PAGE_SIZE]&PAGE_PRESENT))
  80189b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80189e:	99                   	cdq    
  80189f:	c1 ea 0a             	shr    edx,0xa
  8018a2:	01 d0                	add    eax,edx
  8018a4:	25 ff ff 3f 00       	and    eax,0x3fffff
  8018a9:	29 d0                	sub    eax,edx
  8018ab:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8018b1:	85 c0                	test   eax,eax
  8018b3:	0f 48 c2             	cmovs  eax,edx
  8018b6:	c1 f8 0c             	sar    eax,0xc
  8018b9:	48 98                	cdqe   
  8018bb:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8018c2:	00 
  8018c3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8018c7:	48 01 d0             	add    rax,rdx
  8018ca:	8b 00                	mov    eax,DWORD PTR [rax]
  8018cc:	83 e0 01             	and    eax,0x1
    if(!(pdet[base/PAGE_INDEX_SIZE]&PAGE_PRESENT)||\
  8018cf:	85 c0                	test   eax,eax
  8018d1:	75 07                	jne    8018da <chk_vm+0xb6>
    {
        return -1;
  8018d3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8018d8:	eb 05                	jmp    8018df <chk_vm+0xbb>
    }
    return 0;
  8018da:	b8 00 00 00 00       	mov    eax,0x0
}
  8018df:	5d                   	pop    rbp
  8018e0:	c3                   	ret    

00000000008018e1 <is_pgs_ava>:
//查看指定区域的页内存是否可用
int is_pgs_ava(int base,int pgn)
{
  8018e1:	f3 0f 1e fa          	endbr64 
  8018e5:	55                   	push   rbp
  8018e6:	48 89 e5             	mov    rbp,rsp
  8018e9:	48 83 ec 18          	sub    rsp,0x18
  8018ed:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8018f0:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    int pgi=base/4096;
  8018f3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8018f6:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  8018fc:	85 c0                	test   eax,eax
  8018fe:	0f 48 c2             	cmovs  eax,edx
  801901:	c1 f8 0c             	sar    eax,0xc
  801904:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    for(int i=0;i<pgn;i++)
  801907:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80190e:	eb 1e                	jmp    80192e <is_pgs_ava+0x4d>
    {
        if(check_page(pgi+i)!=0)return 0;
  801910:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801913:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801916:	01 d0                	add    eax,edx
  801918:	89 c7                	mov    edi,eax
  80191a:	e8 c4 fc ff ff       	call   8015e3 <check_page>
  80191f:	85 c0                	test   eax,eax
  801921:	74 07                	je     80192a <is_pgs_ava+0x49>
  801923:	b8 00 00 00 00       	mov    eax,0x0
  801928:	eb 11                	jmp    80193b <is_pgs_ava+0x5a>
    for(int i=0;i<pgn;i++)
  80192a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80192e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801931:	3b 45 e8             	cmp    eax,DWORD PTR [rbp-0x18]
  801934:	7c da                	jl     801910 <is_pgs_ava+0x2f>
    }
    return 1;
  801936:	b8 01 00 00 00       	mov    eax,0x1

}
  80193b:	c9                   	leave  
  80193c:	c3                   	ret    

000000000080193d <setup_sys_vol>:
super_block sbs[MAX_SUPERBLOCKS];
fs_operations fs[MAX_FS];

buffer_head buffer_heads[NR_BUFFERHEADS];
int setup_sys_vol(void *disk_drv, void *fs_drv)
{
  80193d:	f3 0f 1e fa          	endbr64 
  801941:	55                   	push   rbp
  801942:	48 89 e5             	mov    rbp,rsp
  801945:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  801949:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    vols[0].name[0]='C';
  80194d:	c6 05 ec e8 bf ff 43 	mov    BYTE PTR [rip+0xffffffffffbfe8ec],0x43        # 400240 <vols>
    vols[0].name[1]='\0';
  801954:	c6 05 e6 e8 bf ff 00 	mov    BYTE PTR [rip+0xffffffffffbfe8e6],0x0        # 400241 <vols+0x1>
    vols[0].disk_drv=disk_drv;
  80195b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80195f:	48 89 05 e2 e8 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe8e2],rax        # 400248 <vols+0x8>
    vols[0].fs_drv=fs_drv;
  801966:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80196a:	48 89 05 df e8 bf ff 	mov    QWORD PTR [rip+0xffffffffffbfe8df],rax        # 400250 <vols+0x10>
    vols[0].stat=VOLUME_STAT_READY;
  801971:	c7 05 e5 e8 bf ff 01 	mov    DWORD PTR [rip+0xffffffffffbfe8e5],0x1        # 400260 <vols+0x20>
  801978:	00 00 00 
    return 0;
  80197b:	b8 00 00 00 00       	mov    eax,0x0
}
  801980:	5d                   	pop    rbp
  801981:	c3                   	ret    

0000000000801982 <sys_mkfifo>:
//返回管道描述符
int sys_mkfifo(int number)
{
  801982:	f3 0f 1e fa          	endbr64 
  801986:	55                   	push   rbp
  801987:	48 89 e5             	mov    rbp,rsp
  80198a:	48 83 ec 20          	sub    rsp,0x20
  80198e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    //查重
    for(int i=0;i<MAX_FIFOS;i++)
  801991:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801998:	eb 38                	jmp    8019d2 <sys_mkfifo+0x50>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  80199a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80199d:	48 98                	cdqe   
  80199f:	48 c1 e0 04          	shl    rax,0x4
  8019a3:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  8019a9:	8b 00                	mov    eax,DWORD PTR [rax]
  8019ab:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8019ae:	75 1e                	jne    8019ce <sys_mkfifo+0x4c>
  8019b0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019b3:	48 98                	cdqe   
  8019b5:	48 c1 e0 04          	shl    rax,0x4
  8019b9:	48 05 68 1e 40 00    	add    rax,0x401e68
  8019bf:	8b 00                	mov    eax,DWORD PTR [rax]
  8019c1:	83 f8 01             	cmp    eax,0x1
  8019c4:	75 08                	jne    8019ce <sys_mkfifo+0x4c>
            return i;
  8019c6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8019c9:	e9 a6 00 00 00       	jmp    801a74 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  8019ce:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8019d2:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  8019d6:	7e c2                	jle    80199a <sys_mkfifo+0x18>
        }
    }
    for(int i=0;i<MAX_FIFOS;i++)
  8019d8:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8019df:	e9 81 00 00 00       	jmp    801a65 <sys_mkfifo+0xe3>
    {
        if(fifos[i].flag==0) {
  8019e4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019e7:	48 98                	cdqe   
  8019e9:	48 c1 e0 04          	shl    rax,0x4
  8019ed:	48 05 68 1e 40 00    	add    rax,0x401e68
  8019f3:	8b 00                	mov    eax,DWORD PTR [rax]
  8019f5:	85 c0                	test   eax,eax
  8019f7:	75 68                	jne    801a61 <sys_mkfifo+0xdf>
            fifos[i].flag=1;
  8019f9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8019fc:	48 98                	cdqe   
  8019fe:	48 c1 e0 04          	shl    rax,0x4
  801a02:	48 05 68 1e 40 00    	add    rax,0x401e68
  801a08:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            fifos[i].id=number;
  801a0e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a11:	48 98                	cdqe   
  801a13:	48 c1 e0 04          	shl    rax,0x4
  801a17:	48 8d 90 6c 1e 40 00 	lea    rdx,[rax+0x401e6c]
  801a1e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801a21:	89 02                	mov    DWORD PTR [rdx],eax
            fifos[i].size=CHUNK_SIZE;
  801a23:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a26:	48 98                	cdqe   
  801a28:	48 c1 e0 04          	shl    rax,0x4
  801a2c:	48 05 64 1e 40 00    	add    rax,0x401e64
  801a32:	c7 00 00 10 00 00    	mov    DWORD PTR [rax],0x1000
            //分配内存
            fifos[i].pa= get_phyaddr(req_a_page());
  801a38:	b8 00 00 00 00       	mov    eax,0x0
  801a3d:	e8 4d fa ff ff       	call   80148f <req_a_page>
  801a42:	89 c7                	mov    edi,eax
  801a44:	e8 f4 fb ff ff       	call   80163d <get_phyaddr>
  801a49:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  801a4c:	48 63 d2             	movsxd rdx,edx
  801a4f:	48 c1 e2 04          	shl    rdx,0x4
  801a53:	48 81 c2 60 1e 40 00 	add    rdx,0x401e60
  801a5a:	89 02                	mov    DWORD PTR [rdx],eax
            return i;
  801a5c:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  801a5f:	eb 13                	jmp    801a74 <sys_mkfifo+0xf2>
    for(int i=0;i<MAX_FIFOS;i++)
  801a61:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  801a65:	83 7d f8 0f          	cmp    DWORD PTR [rbp-0x8],0xf
  801a69:	0f 8e 75 ff ff ff    	jle    8019e4 <sys_mkfifo+0x62>
        }
    }
    return -1;
  801a6f:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801a74:	c9                   	leave  
  801a75:	c3                   	ret    

0000000000801a76 <sys_rmfifo>:

int sys_rmfifo(int number)
{
  801a76:	f3 0f 1e fa          	endbr64 
  801a7a:	55                   	push   rbp
  801a7b:	48 89 e5             	mov    rbp,rsp
  801a7e:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_FIFOS;i++)
  801a81:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801a88:	eb 4a                	jmp    801ad4 <sys_rmfifo+0x5e>
    {
        if(fifos[i].id==number&&fifos[i].flag==1) {
  801a8a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801a8d:	48 98                	cdqe   
  801a8f:	48 c1 e0 04          	shl    rax,0x4
  801a93:	48 05 6c 1e 40 00    	add    rax,0x401e6c
  801a99:	8b 00                	mov    eax,DWORD PTR [rax]
  801a9b:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  801a9e:	75 30                	jne    801ad0 <sys_rmfifo+0x5a>
  801aa0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801aa3:	48 98                	cdqe   
  801aa5:	48 c1 e0 04          	shl    rax,0x4
  801aa9:	48 05 68 1e 40 00    	add    rax,0x401e68
  801aaf:	8b 00                	mov    eax,DWORD PTR [rax]
  801ab1:	83 f8 01             	cmp    eax,0x1
  801ab4:	75 1a                	jne    801ad0 <sys_rmfifo+0x5a>
            fifos[i].flag=0;
  801ab6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ab9:	48 98                	cdqe   
  801abb:	48 c1 e0 04          	shl    rax,0x4
  801abf:	48 05 68 1e 40 00    	add    rax,0x401e68
  801ac5:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
            return i;
  801acb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801ace:	eb 0f                	jmp    801adf <sys_rmfifo+0x69>
    for(int i=0;i<MAX_FIFOS;i++)
  801ad0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801ad4:	83 7d fc 0f          	cmp    DWORD PTR [rbp-0x4],0xf
  801ad8:	7e b0                	jle    801a8a <sys_rmfifo+0x14>
        }
    }
    return -1;
  801ada:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801adf:	5d                   	pop    rbp
  801ae0:	c3                   	ret    

0000000000801ae1 <free_vol>:
int free_vol(int voli)
{
  801ae1:	f3 0f 1e fa          	endbr64 
  801ae5:	55                   	push   rbp
  801ae6:	48 89 e5             	mov    rbp,rsp
  801ae9:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    vols[0].stat=VOLUME_STAT_EMPTY;
  801aec:	c7 05 6a e7 bf ff 00 	mov    DWORD PTR [rip+0xffffffffffbfe76a],0x0        # 400260 <vols+0x20>
  801af3:	00 00 00 
    return 0;
  801af6:	b8 00 00 00 00       	mov    eax,0x0
}
  801afb:	5d                   	pop    rbp
  801afc:	c3                   	ret    

0000000000801afd <reg_vol>:

int reg_vol(int disk_drvi, int fs_drvi, char *name)
{
  801afd:	f3 0f 1e fa          	endbr64 
  801b01:	55                   	push   rbp
  801b02:	48 89 e5             	mov    rbp,rsp
  801b05:	48 83 ec 20          	sub    rsp,0x20
  801b09:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  801b0c:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  801b0f:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
    for(int i=0;i<MAX_VOLUMES;i++)
  801b13:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  801b1a:	e9 d8 00 00 00       	jmp    801bf7 <reg_vol+0xfa>
    {
        if(vols[i].stat==VOLUME_STAT_EMPTY)
  801b1f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b22:	48 63 d0             	movsxd rdx,eax
  801b25:	48 89 d0             	mov    rax,rdx
  801b28:	48 c1 e0 02          	shl    rax,0x2
  801b2c:	48 01 d0             	add    rax,rdx
  801b2f:	48 c1 e0 03          	shl    rax,0x3
  801b33:	48 05 60 02 40 00    	add    rax,0x400260
  801b39:	8b 00                	mov    eax,DWORD PTR [rax]
  801b3b:	85 c0                	test   eax,eax
  801b3d:	0f 85 b0 00 00 00    	jne    801bf3 <reg_vol+0xf6>
        {
            extern driver *drvs;
            vols[i].stat=VOLUME_STAT_READY;
  801b43:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b46:	48 63 d0             	movsxd rdx,eax
  801b49:	48 89 d0             	mov    rax,rdx
  801b4c:	48 c1 e0 02          	shl    rax,0x2
  801b50:	48 01 d0             	add    rax,rdx
  801b53:	48 c1 e0 03          	shl    rax,0x3
  801b57:	48 05 60 02 40 00    	add    rax,0x400260
  801b5d:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            vols[i].fs= &fs[fs_drvi];
  801b63:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801b66:	48 63 d0             	movsxd rdx,eax
  801b69:	48 89 d0             	mov    rax,rdx
  801b6c:	48 01 c0             	add    rax,rax
  801b6f:	48 01 d0             	add    rax,rdx
  801b72:	48 c1 e0 03          	shl    rax,0x3
  801b76:	48 8d 88 80 23 40 00 	lea    rcx,[rax+0x402380]
  801b7d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801b80:	48 63 d0             	movsxd rdx,eax
  801b83:	48 89 d0             	mov    rax,rdx
  801b86:	48 c1 e0 02          	shl    rax,0x2
  801b8a:	48 01 d0             	add    rax,rdx
  801b8d:	48 c1 e0 03          	shl    rax,0x3
  801b91:	48 05 58 02 40 00    	add    rax,0x400258
  801b97:	48 89 08             	mov    QWORD PTR [rax],rcx
            vols[i].disk_drv= get_drv(disk_drvi);
  801b9a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801b9d:	89 c7                	mov    edi,eax
  801b9f:	e8 fa 19 00 00       	call   80359e <get_drv>
  801ba4:	48 89 c2             	mov    rdx,rax
  801ba7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801baa:	48 63 c8             	movsxd rcx,eax
  801bad:	48 89 c8             	mov    rax,rcx
  801bb0:	48 c1 e0 02          	shl    rax,0x2
  801bb4:	48 01 c8             	add    rax,rcx
  801bb7:	48 c1 e0 03          	shl    rax,0x3
  801bbb:	48 05 48 02 40 00    	add    rax,0x400248
  801bc1:	48 89 10             	mov    QWORD PTR [rax],rdx
            strcpy(vols[i].name,name);
  801bc4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bc7:	48 63 d0             	movsxd rdx,eax
  801bca:	48 89 d0             	mov    rax,rdx
  801bcd:	48 c1 e0 02          	shl    rax,0x2
  801bd1:	48 01 d0             	add    rax,rdx
  801bd4:	48 c1 e0 03          	shl    rax,0x3
  801bd8:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801bdf:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  801be3:	48 89 c6             	mov    rsi,rax
  801be6:	48 89 d7             	mov    rdi,rdx
  801be9:	e8 c7 89 00 00       	call   80a5b5 <strcpy>
            return i;
  801bee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  801bf1:	eb 13                	jmp    801c06 <reg_vol+0x109>
    for(int i=0;i<MAX_VOLUMES;i++)
  801bf3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  801bf7:	83 7d fc 19          	cmp    DWORD PTR [rbp-0x4],0x19
  801bfb:	0f 8e 1e ff ff ff    	jle    801b1f <reg_vol+0x22>
        }
    }
    return -1;
  801c01:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  801c06:	c9                   	leave  
  801c07:	c3                   	ret    

0000000000801c08 <sys_open>:
int sys_open(char *path, int mode)
{
  801c08:	f3 0f 1e fa          	endbr64 
  801c0c:	55                   	push   rbp
  801c0d:	48 89 e5             	mov    rbp,rsp
  801c10:	53                   	push   rbx
  801c11:	48 81 ec 28 02 00 00 	sub    rsp,0x228
  801c18:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
  801c1f:	89 b5 d4 fd ff ff    	mov    DWORD PTR [rbp-0x22c],esi
    {

    }
    //根据文件路径找到相应的卷
    char volname[26];
    int i=0,rec=0;
  801c25:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801c2c:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
    for(;path[i]!='/'&&i<26;i++)
  801c33:	eb 20                	jmp    801c55 <sys_open+0x4d>
        volname[i]=path[i];
  801c35:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c38:	48 63 d0             	movsxd rdx,eax
  801c3b:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801c42:	48 01 d0             	add    rax,rdx
  801c45:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  801c48:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c4b:	48 98                	cdqe   
  801c4d:	88 54 05 c0          	mov    BYTE PTR [rbp+rax*1-0x40],dl
    for(;path[i]!='/'&&i<26;i++)
  801c51:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801c55:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c58:	48 63 d0             	movsxd rdx,eax
  801c5b:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801c62:	48 01 d0             	add    rax,rdx
  801c65:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801c68:	3c 2f                	cmp    al,0x2f
  801c6a:	74 06                	je     801c72 <sys_open+0x6a>
  801c6c:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801c70:	7e c3                	jle    801c35 <sys_open+0x2d>
    volname[i]='\0';
  801c72:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c75:	48 98                	cdqe   
  801c77:	c6 44 05 c0 00       	mov    BYTE PTR [rbp+rax*1-0x40],0x0
    if(!path[i+1])
  801c7c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801c7f:	48 98                	cdqe   
  801c81:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801c85:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801c8c:	48 01 d0             	add    rax,rdx
  801c8f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  801c92:	84 c0                	test   al,al
  801c94:	75 0a                	jne    801ca0 <sys_open+0x98>
        return -2;//是根目录
  801c96:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  801c9b:	e9 2b 04 00 00       	jmp    8020cb <sys_open+0x4c3>
    rec=i;
  801ca0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ca3:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    for(i=0;i<MAX_VOLUMES;i++)
  801ca6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801cad:	eb 52                	jmp    801d01 <sys_open+0xf9>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801caf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801cb2:	48 63 d0             	movsxd rdx,eax
  801cb5:	48 89 d0             	mov    rax,rdx
  801cb8:	48 c1 e0 02          	shl    rax,0x2
  801cbc:	48 01 d0             	add    rax,rdx
  801cbf:	48 c1 e0 03          	shl    rax,0x3
  801cc3:	48 05 60 02 40 00    	add    rax,0x400260
  801cc9:	8b 00                	mov    eax,DWORD PTR [rax]
  801ccb:	85 c0                	test   eax,eax
  801ccd:	74 2e                	je     801cfd <sys_open+0xf5>
        (strcmp(vols[i].name,volname)==0))
  801ccf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801cd2:	48 63 d0             	movsxd rdx,eax
  801cd5:	48 89 d0             	mov    rax,rdx
  801cd8:	48 c1 e0 02          	shl    rax,0x2
  801cdc:	48 01 d0             	add    rax,rdx
  801cdf:	48 c1 e0 03          	shl    rax,0x3
  801ce3:	48 8d 90 40 02 40 00 	lea    rdx,[rax+0x400240]
  801cea:	48 8d 45 c0          	lea    rax,[rbp-0x40]
  801cee:	48 89 c6             	mov    rsi,rax
  801cf1:	48 89 d7             	mov    rdi,rdx
  801cf4:	e8 5c 8a 00 00       	call   80a755 <strcmp>
        if(vols[i].stat!=VOLUME_STAT_EMPTY&& \
  801cf9:	85 c0                	test   eax,eax
  801cfb:	74 0c                	je     801d09 <sys_open+0x101>
    for(i=0;i<MAX_VOLUMES;i++)
  801cfd:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801d01:	83 7d ec 19          	cmp    DWORD PTR [rbp-0x14],0x19
  801d05:	7e a8                	jle    801caf <sys_open+0xa7>
  801d07:	eb 01                	jmp    801d0a <sys_open+0x102>
            break;
  801d09:	90                   	nop
    if(i==MAX_VOLUMES)return -1;
  801d0a:	83 7d ec 1a          	cmp    DWORD PTR [rbp-0x14],0x1a
  801d0e:	75 0a                	jne    801d1a <sys_open+0x112>
  801d10:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801d15:	e9 b1 03 00 00       	jmp    8020cb <sys_open+0x4c3>
    driver_args arg={
  801d1a:	48 8d 95 00 ff ff ff 	lea    rdx,[rbp-0x100]
  801d21:	b8 00 00 00 00       	mov    eax,0x0
  801d26:	b9 17 00 00 00       	mov    ecx,0x17
  801d2b:	48 89 d7             	mov    rdi,rdx
  801d2e:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  801d31:	48 89 fa             	mov    rdx,rdi
  801d34:	89 02                	mov    DWORD PTR [rdx],eax
  801d36:	48 83 c2 04          	add    rdx,0x4
            .path=path+rec+1
  801d3a:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801d3d:	48 98                	cdqe   
  801d3f:	48 8d 50 01          	lea    rdx,[rax+0x1]
  801d43:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801d4a:	48 01 d0             	add    rax,rdx
    driver_args arg={
  801d4d:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
    };
    vfs_dir_entry dir;
    vfs_dir_entry res;
    int voln=i;
  801d54:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d57:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
    if(vols[i].fs->find(path+rec+1,dir,&res)==-1)//找不到文件 ((driver*)vols[i].fs_drv)->find(&arg)==-1
  801d5a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801d5d:	48 63 d0             	movsxd rdx,eax
  801d60:	48 89 d0             	mov    rax,rdx
  801d63:	48 c1 e0 02          	shl    rax,0x2
  801d67:	48 01 d0             	add    rax,rdx
  801d6a:	48 c1 e0 03          	shl    rax,0x3
  801d6e:	48 05 58 02 40 00    	add    rax,0x400258
  801d74:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801d77:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  801d7b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  801d7e:	48 98                	cdqe   
  801d80:	48 8d 48 01          	lea    rcx,[rax+0x1]
  801d84:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  801d8b:	48 01 c1             	add    rcx,rax
  801d8e:	48 8d 85 40 fe ff ff 	lea    rax,[rbp-0x1c0]
  801d95:	ff b5 f8 fe ff ff    	push   QWORD PTR [rbp-0x108]
  801d9b:	ff b5 f0 fe ff ff    	push   QWORD PTR [rbp-0x110]
  801da1:	ff b5 e8 fe ff ff    	push   QWORD PTR [rbp-0x118]
  801da7:	ff b5 e0 fe ff ff    	push   QWORD PTR [rbp-0x120]
  801dad:	ff b5 d8 fe ff ff    	push   QWORD PTR [rbp-0x128]
  801db3:	ff b5 d0 fe ff ff    	push   QWORD PTR [rbp-0x130]
  801db9:	ff b5 c8 fe ff ff    	push   QWORD PTR [rbp-0x138]
  801dbf:	ff b5 c0 fe ff ff    	push   QWORD PTR [rbp-0x140]
  801dc5:	ff b5 b8 fe ff ff    	push   QWORD PTR [rbp-0x148]
  801dcb:	ff b5 b0 fe ff ff    	push   QWORD PTR [rbp-0x150]
  801dd1:	ff b5 a8 fe ff ff    	push   QWORD PTR [rbp-0x158]
  801dd7:	ff b5 a0 fe ff ff    	push   QWORD PTR [rbp-0x160]
  801ddd:	48 89 c6             	mov    rsi,rax
  801de0:	48 89 cf             	mov    rdi,rcx
  801de3:	ff d2                	call   rdx
  801de5:	48 83 c4 60          	add    rsp,0x60
  801de9:	83 f8 ff             	cmp    eax,0xffffffff
  801dec:	75 49                	jne    801e37 <sys_open+0x22f>
    {
        if(mode&FILE_MODE_WRITE) {
  801dee:	8b 85 d4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x22c]
  801df4:	83 e0 02             	and    eax,0x2
  801df7:	85 c0                	test   eax,eax
  801df9:	74 32                	je     801e2d <sys_open+0x225>
            return ((driver *) vols[i].fs_drv)->touch(&arg);//这里之后要改
  801dfb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801dfe:	48 63 d0             	movsxd rdx,eax
  801e01:	48 89 d0             	mov    rax,rdx
  801e04:	48 c1 e0 02          	shl    rax,0x2
  801e08:	48 01 d0             	add    rax,rdx
  801e0b:	48 c1 e0 03          	shl    rax,0x3
  801e0f:	48 05 50 02 40 00    	add    rax,0x400250
  801e15:	48 8b 00             	mov    rax,QWORD PTR [rax]
  801e18:	48 8b 50 4c          	mov    rdx,QWORD PTR [rax+0x4c]
  801e1c:	48 8d 85 00 ff ff ff 	lea    rax,[rbp-0x100]
  801e23:	48 89 c7             	mov    rdi,rax
  801e26:	ff d2                	call   rdx
  801e28:	e9 9e 02 00 00       	jmp    8020cb <sys_open+0x4c3>
        }else
            return -1;
  801e2d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801e32:	e9 94 02 00 00       	jmp    8020cb <sys_open+0x4c3>
    }
    vfs_dir_entry entry=res;//=arg.entry;
  801e37:	48 8b 85 40 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1c0]
  801e3e:	48 8b 95 48 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1b8]
  801e45:	48 89 85 e0 fd ff ff 	mov    QWORD PTR [rbp-0x220],rax
  801e4c:	48 89 95 e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdx
  801e53:	48 8b 85 50 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1b0]
  801e5a:	48 8b 95 58 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x1a8]
  801e61:	48 89 85 f0 fd ff ff 	mov    QWORD PTR [rbp-0x210],rax
  801e68:	48 89 95 f8 fd ff ff 	mov    QWORD PTR [rbp-0x208],rdx
  801e6f:	48 8b 85 60 fe ff ff 	mov    rax,QWORD PTR [rbp-0x1a0]
  801e76:	48 8b 95 68 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x198]
  801e7d:	48 89 85 00 fe ff ff 	mov    QWORD PTR [rbp-0x200],rax
  801e84:	48 89 95 08 fe ff ff 	mov    QWORD PTR [rbp-0x1f8],rdx
  801e8b:	48 8b 85 70 fe ff ff 	mov    rax,QWORD PTR [rbp-0x190]
  801e92:	48 8b 95 78 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x188]
  801e99:	48 89 85 10 fe ff ff 	mov    QWORD PTR [rbp-0x1f0],rax
  801ea0:	48 89 95 18 fe ff ff 	mov    QWORD PTR [rbp-0x1e8],rdx
  801ea7:	48 8b 85 80 fe ff ff 	mov    rax,QWORD PTR [rbp-0x180]
  801eae:	48 8b 95 88 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x178]
  801eb5:	48 89 85 20 fe ff ff 	mov    QWORD PTR [rbp-0x1e0],rax
  801ebc:	48 89 95 28 fe ff ff 	mov    QWORD PTR [rbp-0x1d8],rdx
  801ec3:	48 8b 85 90 fe ff ff 	mov    rax,QWORD PTR [rbp-0x170]
  801eca:	48 8b 95 98 fe ff ff 	mov    rdx,QWORD PTR [rbp-0x168]
  801ed1:	48 89 85 30 fe ff ff 	mov    QWORD PTR [rbp-0x1d0],rax
  801ed8:	48 89 95 38 fe ff ff 	mov    QWORD PTR [rbp-0x1c8],rdx
    int j=-1;
  801edf:	c7 45 e8 ff ff ff ff 	mov    DWORD PTR [rbp-0x18],0xffffffff
    for(i=0;i<MAX_OPEN_FILES;i++)
  801ee6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801eed:	eb 5c                	jmp    801f4b <sys_open+0x343>
    {
        if(opened[i].voln==voln&&opened[i].id==entry.id)
  801eef:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801ef2:	48 63 d0             	movsxd rdx,eax
  801ef5:	48 89 d0             	mov    rax,rdx
  801ef8:	48 01 c0             	add    rax,rax
  801efb:	48 01 d0             	add    rax,rdx
  801efe:	48 c1 e0 05          	shl    rax,0x5
  801f02:	48 05 68 06 40 00    	add    rax,0x400668
  801f08:	8b 00                	mov    eax,DWORD PTR [rax]
  801f0a:	39 45 e0             	cmp    DWORD PTR [rbp-0x20],eax
  801f0d:	75 38                	jne    801f47 <sys_open+0x33f>
  801f0f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f12:	48 63 d0             	movsxd rdx,eax
  801f15:	48 89 d0             	mov    rax,rdx
  801f18:	48 01 c0             	add    rax,rax
  801f1b:	48 01 d0             	add    rax,rdx
  801f1e:	48 c1 e0 05          	shl    rax,0x5
  801f22:	48 05 74 06 40 00    	add    rax,0x400674
  801f28:	8b 10                	mov    edx,DWORD PTR [rax]
  801f2a:	8b 85 f4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x20c]
  801f30:	39 c2                	cmp    edx,eax
  801f32:	75 13                	jne    801f47 <sys_open+0x33f>
        {
            if(mode==FILE_MODE_WRITE)
  801f34:	83 bd d4 fd ff ff 02 	cmp    DWORD PTR [rbp-0x22c],0x2
  801f3b:	75 0a                	jne    801f47 <sys_open+0x33f>
            {
                return -1;//读模式会重新给一个fno但是指向同一个文件
  801f3d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801f42:	e9 84 01 00 00       	jmp    8020cb <sys_open+0x4c3>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f47:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801f4b:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801f4f:	7e 9e                	jle    801eef <sys_open+0x2e7>
            }
        }
    }
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f51:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  801f58:	eb 2b                	jmp    801f85 <sys_open+0x37d>
    {
        if(!opened[i].mode) {
  801f5a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f5d:	48 63 d0             	movsxd rdx,eax
  801f60:	48 89 d0             	mov    rax,rdx
  801f63:	48 01 c0             	add    rax,rax
  801f66:	48 01 d0             	add    rax,rdx
  801f69:	48 c1 e0 05          	shl    rax,0x5
  801f6d:	48 05 64 06 40 00    	add    rax,0x400664
  801f73:	8b 00                	mov    eax,DWORD PTR [rax]
  801f75:	85 c0                	test   eax,eax
  801f77:	75 08                	jne    801f81 <sys_open+0x379>
            j = i;
  801f79:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  801f7c:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            break;
  801f7f:	eb 0a                	jmp    801f8b <sys_open+0x383>
    for(i=0;i<MAX_OPEN_FILES;i++)
  801f81:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  801f85:	83 7d ec 3f          	cmp    DWORD PTR [rbp-0x14],0x3f
  801f89:	7e cf                	jle    801f5a <sys_open+0x352>
        }
    }
    if(j==-1)return -1;
  801f8b:	83 7d e8 ff          	cmp    DWORD PTR [rbp-0x18],0xffffffff
  801f8f:	75 0a                	jne    801f9b <sys_open+0x393>
  801f91:	b8 ff ff ff ff       	mov    eax,0xffffffff
  801f96:	e9 30 01 00 00       	jmp    8020cb <sys_open+0x4c3>
    opened[j]=entry;
  801f9b:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  801f9e:	48 63 d0             	movsxd rdx,eax
  801fa1:	48 89 d0             	mov    rax,rdx
  801fa4:	48 01 c0             	add    rax,rax
  801fa7:	48 01 d0             	add    rax,rdx
  801faa:	48 c1 e0 05          	shl    rax,0x5
  801fae:	48 05 60 06 40 00    	add    rax,0x400660
  801fb4:	48 8b 8d e0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x220]
  801fbb:	48 8b 9d e8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x218]
  801fc2:	48 89 08             	mov    QWORD PTR [rax],rcx
  801fc5:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
  801fc9:	48 8b 8d f0 fd ff ff 	mov    rcx,QWORD PTR [rbp-0x210]
  801fd0:	48 8b 9d f8 fd ff ff 	mov    rbx,QWORD PTR [rbp-0x208]
  801fd7:	48 89 48 10          	mov    QWORD PTR [rax+0x10],rcx
  801fdb:	48 89 58 18          	mov    QWORD PTR [rax+0x18],rbx
  801fdf:	48 8b 8d 00 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x200]
  801fe6:	48 8b 9d 08 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1f8]
  801fed:	48 89 48 20          	mov    QWORD PTR [rax+0x20],rcx
  801ff1:	48 89 58 28          	mov    QWORD PTR [rax+0x28],rbx
  801ff5:	48 8b 8d 10 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1f0]
  801ffc:	48 8b 9d 18 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1e8]
  802003:	48 89 48 30          	mov    QWORD PTR [rax+0x30],rcx
  802007:	48 89 58 38          	mov    QWORD PTR [rax+0x38],rbx
  80200b:	48 8b 8d 20 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1e0]
  802012:	48 8b 9d 28 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1d8]
  802019:	48 89 48 40          	mov    QWORD PTR [rax+0x40],rcx
  80201d:	48 89 58 48          	mov    QWORD PTR [rax+0x48],rbx
  802021:	48 8b 8d 30 fe ff ff 	mov    rcx,QWORD PTR [rbp-0x1d0]
  802028:	48 8b 9d 38 fe ff ff 	mov    rbx,QWORD PTR [rbp-0x1c8]
  80202f:	48 89 48 50          	mov    QWORD PTR [rax+0x50],rcx
  802033:	48 89 58 58          	mov    QWORD PTR [rax+0x58],rbx
    opened[j].fno=i;
  802037:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80203a:	48 63 d0             	movsxd rdx,eax
  80203d:	48 89 d0             	mov    rax,rdx
  802040:	48 01 c0             	add    rax,rax
  802043:	48 01 d0             	add    rax,rdx
  802046:	48 c1 e0 05          	shl    rax,0x5
  80204a:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  802051:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802054:	89 02                	mov    DWORD PTR [rdx],eax
    opened[j].link_c++;
  802056:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802059:	48 63 d0             	movsxd rdx,eax
  80205c:	48 89 d0             	mov    rax,rdx
  80205f:	48 01 c0             	add    rax,rax
  802062:	48 01 d0             	add    rax,rdx
  802065:	48 c1 e0 05          	shl    rax,0x5
  802069:	48 05 6c 06 40 00    	add    rax,0x40066c
  80206f:	8b 00                	mov    eax,DWORD PTR [rax]
  802071:	8d 48 01             	lea    ecx,[rax+0x1]
  802074:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802077:	48 63 d0             	movsxd rdx,eax
  80207a:	48 89 d0             	mov    rax,rdx
  80207d:	48 01 c0             	add    rax,rax
  802080:	48 01 d0             	add    rax,rdx
  802083:	48 c1 e0 05          	shl    rax,0x5
  802087:	48 05 6c 06 40 00    	add    rax,0x40066c
  80208d:	89 08                	mov    DWORD PTR [rax],ecx
    add_proc_openf(&opened[j]);
  80208f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802092:	48 63 d0             	movsxd rdx,eax
  802095:	48 89 d0             	mov    rax,rdx
  802098:	48 01 c0             	add    rax,rax
  80209b:	48 01 d0             	add    rax,rdx
  80209e:	48 c1 e0 05          	shl    rax,0x5
  8020a2:	48 05 60 06 40 00    	add    rax,0x400660
  8020a8:	48 89 c7             	mov    rdi,rax
  8020ab:	e8 93 26 00 00       	call   804743 <add_proc_openf>
    return opened[j].fno;
  8020b0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8020b3:	48 63 d0             	movsxd rdx,eax
  8020b6:	48 89 d0             	mov    rax,rdx
  8020b9:	48 01 c0             	add    rax,rax
  8020bc:	48 01 d0             	add    rax,rdx
  8020bf:	48 c1 e0 05          	shl    rax,0x5
  8020c3:	48 05 60 06 40 00    	add    rax,0x400660
  8020c9:	8b 00                	mov    eax,DWORD PTR [rax]
}
  8020cb:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  8020cf:	c9                   	leave  
  8020d0:	c3                   	ret    

00000000008020d1 <sys_close>:
int sys_close(int fno)
{
  8020d1:	f3 0f 1e fa          	endbr64 
  8020d5:	55                   	push   rbp
  8020d6:	48 89 e5             	mov    rbp,rsp
  8020d9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  8020dc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8020e3:	eb 64                	jmp    802149 <sys_close+0x78>
    {
        if(opened[i].fno==fno)
  8020e5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8020e8:	48 63 d0             	movsxd rdx,eax
  8020eb:	48 89 d0             	mov    rax,rdx
  8020ee:	48 01 c0             	add    rax,rax
  8020f1:	48 01 d0             	add    rax,rdx
  8020f4:	48 c1 e0 05          	shl    rax,0x5
  8020f8:	48 05 60 06 40 00    	add    rax,0x400660
  8020fe:	8b 00                	mov    eax,DWORD PTR [rax]
  802100:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802103:	75 40                	jne    802145 <sys_close+0x74>
        {
            opened[i].link_c--;
  802105:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802108:	48 63 d0             	movsxd rdx,eax
  80210b:	48 89 d0             	mov    rax,rdx
  80210e:	48 01 c0             	add    rax,rax
  802111:	48 01 d0             	add    rax,rdx
  802114:	48 c1 e0 05          	shl    rax,0x5
  802118:	48 05 6c 06 40 00    	add    rax,0x40066c
  80211e:	8b 00                	mov    eax,DWORD PTR [rax]
  802120:	8d 48 ff             	lea    ecx,[rax-0x1]
  802123:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802126:	48 63 d0             	movsxd rdx,eax
  802129:	48 89 d0             	mov    rax,rdx
  80212c:	48 01 c0             	add    rax,rax
  80212f:	48 01 d0             	add    rax,rdx
  802132:	48 c1 e0 05          	shl    rax,0x5
  802136:	48 05 6c 06 40 00    	add    rax,0x40066c
  80213c:	89 08                	mov    DWORD PTR [rax],ecx
            return 0;
  80213e:	b8 00 00 00 00       	mov    eax,0x0
  802143:	eb 0f                	jmp    802154 <sys_close+0x83>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802145:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802149:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80214d:	7e 96                	jle    8020e5 <sys_close+0x14>
        }
    }
    return -1;
  80214f:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802154:	5d                   	pop    rbp
  802155:	c3                   	ret    

0000000000802156 <sys_write>:
int sys_write(int fno, char *src, int len)
{
  802156:	f3 0f 1e fa          	endbr64 
  80215a:	55                   	push   rbp
  80215b:	48 89 e5             	mov    rbp,rsp
  80215e:	48 83 ec 20          	sub    rsp,0x20
  802162:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802165:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  802169:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  80216c:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80216f:	89 c7                	mov    edi,eax
  802171:	e8 7d 01 00 00       	call   8022f3 <get_vfs_entry>
  802176:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  80217a:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  80217f:	75 07                	jne    802188 <sys_write+0x32>
  802181:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802186:	eb 5d                	jmp    8021e5 <sys_write+0x8f>
    if(f->type==FTYPE_REG)
  802188:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80218c:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  80218f:	85 c0                	test   eax,eax
  802191:	75 18                	jne    8021ab <sys_write+0x55>
    {
        return vfs_write_file(f,src,len);
  802193:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802196:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  80219a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80219e:	48 89 ce             	mov    rsi,rcx
  8021a1:	48 89 c7             	mov    rdi,rax
  8021a4:	e8 67 03 00 00       	call   802510 <vfs_write_file>
  8021a9:	eb 3a                	jmp    8021e5 <sys_write+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  8021ab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021af:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  8021b2:	83 f8 01             	cmp    eax,0x1
  8021b5:	75 29                	jne    8021e0 <sys_write+0x8a>
    {
        int block=get_according_bnr(f);
  8021b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021bb:	48 89 c7             	mov    rdi,rax
  8021be:	e8 5b 04 00 00       	call   80261e <get_according_bnr>
  8021c3:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return write_block(f->dev,block,src,len);
  8021c6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8021ca:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  8021cd:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  8021d0:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8021d4:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  8021d7:	89 c7                	mov    edi,eax
  8021d9:	e8 13 07 00 00       	call   8028f1 <write_block>
  8021de:	eb 05                	jmp    8021e5 <sys_write+0x8f>
    }
    return -1;
  8021e0:	b8 ff ff ff ff       	mov    eax,0xffffffff
            .src_addr=src,
            .len=len,
            .pos=pos
    };
    return ((driver*)vols[f->voln].fs_drv)->write(&args); */
}
  8021e5:	c9                   	leave  
  8021e6:	c3                   	ret    

00000000008021e7 <sys_read>:
int sys_read(int fno, char *dist,  int len)
{
  8021e7:	f3 0f 1e fa          	endbr64 
  8021eb:	55                   	push   rbp
  8021ec:	48 89 e5             	mov    rbp,rsp
  8021ef:	48 83 ec 20          	sub    rsp,0x20
  8021f3:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8021f6:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  8021fa:	89 55 e8             	mov    DWORD PTR [rbp-0x18],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  8021fd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802200:	89 c7                	mov    edi,eax
  802202:	e8 ec 00 00 00       	call   8022f3 <get_vfs_entry>
  802207:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  80220b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802210:	75 07                	jne    802219 <sys_read+0x32>
  802212:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802217:	eb 5d                	jmp    802276 <sys_read+0x8f>
    if(f->type==FTYPE_REG)
  802219:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80221d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802220:	85 c0                	test   eax,eax
  802222:	75 18                	jne    80223c <sys_read+0x55>
    {
        return vfs_read_file(f,dist,len);
  802224:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  802227:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  80222b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80222f:	48 89 ce             	mov    rsi,rcx
  802232:	48 89 c7             	mov    rdi,rax
  802235:	e8 37 02 00 00       	call   802471 <vfs_read_file>
  80223a:	eb 3a                	jmp    802276 <sys_read+0x8f>
    }else if(f->type==FTYPE_BLKDEV)
  80223c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802240:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  802243:	83 f8 01             	cmp    eax,0x1
  802246:	75 29                	jne    802271 <sys_read+0x8a>
    {
        int block=get_according_bnr(f);
  802248:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80224c:	48 89 c7             	mov    rdi,rax
  80224f:	e8 ca 03 00 00       	call   80261e <get_according_bnr>
  802254:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        return read_block(f->dev,block,dist,len);
  802257:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80225b:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  80225e:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
  802261:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  802265:	8b 75 f4             	mov    esi,DWORD PTR [rbp-0xc]
  802268:	89 c7                	mov    edi,eax
  80226a:	e8 ff 06 00 00       	call   80296e <read_block>
  80226f:	eb 05                	jmp    802276 <sys_read+0x8f>
    }
    return -1;
  802271:	b8 ff ff ff ff       	mov    eax,0xffffffff
    //         .len=len,
    //         .pos=pos,
    //         .entry=*f
    // };
    // return ((driver*)vols[f->voln].fs_drv)->read(&args);
}
  802276:	c9                   	leave  
  802277:	c3                   	ret    

0000000000802278 <sys_seek>:
int sys_seek(int fno, int offset, int origin)
{
  802278:	f3 0f 1e fa          	endbr64 
  80227c:	55                   	push   rbp
  80227d:	48 89 e5             	mov    rbp,rsp
  802280:	48 83 ec 20          	sub    rsp,0x20
  802284:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802287:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80228a:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
    vfs_dir_entry *f= get_vfs_entry(fno);
  80228d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802290:	89 c7                	mov    edi,eax
  802292:	e8 5c 00 00 00       	call   8022f3 <get_vfs_entry>
  802297:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  80229b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8022a0:	75 07                	jne    8022a9 <sys_seek+0x31>
  8022a2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8022a7:	eb 14                	jmp    8022bd <sys_seek+0x45>
    f->ptr=offset+origin;
  8022a9:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8022ac:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  8022af:	01 c2                	add    edx,eax
  8022b1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022b5:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
    return 0;
  8022b8:	b8 00 00 00 00       	mov    eax,0x0
}
  8022bd:	c9                   	leave  
  8022be:	c3                   	ret    

00000000008022bf <sys_tell>:
int sys_tell(int fno)
{
  8022bf:	f3 0f 1e fa          	endbr64 
  8022c3:	55                   	push   rbp
  8022c4:	48 89 e5             	mov    rbp,rsp
  8022c7:	48 83 ec 20          	sub    rsp,0x20
  8022cb:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    vfs_dir_entry *f= get_vfs_entry(fno);
  8022ce:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8022d1:	89 c7                	mov    edi,eax
  8022d3:	e8 1b 00 00 00       	call   8022f3 <get_vfs_entry>
  8022d8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!f)return -1;
  8022dc:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8022e1:	75 07                	jne    8022ea <sys_tell+0x2b>
  8022e3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8022e8:	eb 07                	jmp    8022f1 <sys_tell+0x32>
    return f->ptr;
  8022ea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8022ee:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  8022f1:	c9                   	leave  
  8022f2:	c3                   	ret    

00000000008022f3 <get_vfs_entry>:
vfs_dir_entry *get_vfs_entry(int fno)
{
  8022f3:	f3 0f 1e fa          	endbr64 
  8022f7:	55                   	push   rbp
  8022f8:	48 89 e5             	mov    rbp,rsp
  8022fb:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    for(int i=0;i<MAX_OPEN_FILES;i++)
  8022fe:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802305:	eb 3f                	jmp    802346 <get_vfs_entry+0x53>
    {
        if(opened[i].fno==fno)
  802307:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80230a:	48 63 d0             	movsxd rdx,eax
  80230d:	48 89 d0             	mov    rax,rdx
  802310:	48 01 c0             	add    rax,rax
  802313:	48 01 d0             	add    rax,rdx
  802316:	48 c1 e0 05          	shl    rax,0x5
  80231a:	48 05 60 06 40 00    	add    rax,0x400660
  802320:	8b 00                	mov    eax,DWORD PTR [rax]
  802322:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802325:	75 1b                	jne    802342 <get_vfs_entry+0x4f>
        {
            return &opened[i];
  802327:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80232a:	48 63 d0             	movsxd rdx,eax
  80232d:	48 89 d0             	mov    rax,rdx
  802330:	48 01 c0             	add    rax,rax
  802333:	48 01 d0             	add    rax,rdx
  802336:	48 c1 e0 05          	shl    rax,0x5
  80233a:	48 05 60 06 40 00    	add    rax,0x400660
  802340:	eb 0f                	jmp    802351 <get_vfs_entry+0x5e>
    for(int i=0;i<MAX_OPEN_FILES;i++)
  802342:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802346:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80234a:	7e bb                	jle    802307 <get_vfs_entry+0x14>
        }
    }
    return NULL;
  80234c:	b8 00 00 00 00       	mov    eax,0x0
}
  802351:	5d                   	pop    rbp
  802352:	c3                   	ret    

0000000000802353 <brelse>:

//释放缓冲区（只释放这一块）
int brelse(buffer_head* bh)
{
  802353:	f3 0f 1e fa          	endbr64 
  802357:	55                   	push   rbp
  802358:	48 89 e5             	mov    rbp,rsp
  80235b:	48 83 ec 10          	sub    rsp,0x10
  80235f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    wait_on_buf(bh);
  802363:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802367:	48 89 c7             	mov    rdi,rax
  80236a:	e8 a0 04 00 00       	call   80280f <wait_on_buf>
    if(bh->b_count==0)return -1;
  80236f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802373:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  802377:	84 c0                	test   al,al
  802379:	75 07                	jne    802382 <brelse+0x2f>
  80237b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802380:	eb 32                	jmp    8023b4 <brelse+0x61>
    bh->b_count--;
  802382:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802386:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  80238a:	8d 50 ff             	lea    edx,[rax-0x1]
  80238d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802391:	88 50 14             	mov    BYTE PTR [rax+0x14],dl
    if(bh->b_count==0)
  802394:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802398:	0f b6 40 14          	movzx  eax,BYTE PTR [rax+0x14]
  80239c:	84 c0                	test   al,al
  80239e:	75 0f                	jne    8023af <brelse+0x5c>
        vmfree(bh->b_data);
  8023a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023a4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8023a7:	48 89 c7             	mov    rdi,rax
  8023aa:	e8 db ed ff ff       	call   80118a <vmfree>
    return 0;
  8023af:	b8 00 00 00 00       	mov    eax,0x0
}
  8023b4:	c9                   	leave  
  8023b5:	c3                   	ret    

00000000008023b6 <bread>:
//从设备中读取指定设备的指定块并返回缓冲区
buffer_head* bread(int dev,int blk)
{
  8023b6:	f3 0f 1e fa          	endbr64 
  8023ba:	55                   	push   rbp
  8023bb:	48 89 e5             	mov    rbp,rsp
  8023be:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
  8023c5:	89 bd 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],edi
  8023cb:	89 b5 28 ff ff ff    	mov    DWORD PTR [rbp-0xd8],esi

    buffer_head *bh=get_buf(dev,blk);
  8023d1:	8b 95 28 ff ff ff    	mov    edx,DWORD PTR [rbp-0xd8]
  8023d7:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  8023dd:	89 d6                	mov    esi,edx
  8023df:	89 c7                	mov    edi,eax
  8023e1:	e8 78 02 00 00       	call   80265e <get_buf>
  8023e6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if(!bh)return -1;//申请失败
  8023ea:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8023ef:	75 09                	jne    8023fa <bread+0x44>
  8023f1:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
  8023f8:	eb 75                	jmp    80246f <bread+0xb9>
    if(!bh->b_uptodate)
  8023fa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8023fe:	0f b6 40 12          	movzx  eax,BYTE PTR [rax+0x12]
  802402:	84 c0                	test   al,al
  802404:	75 65                	jne    80246b <bread+0xb5>
    {
        driver_args arg;
        arg.dev=dev;
  802406:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  80240c:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
        arg.cmd=DRVF_READ;
  80240f:	c7 45 d8 02 00 00 00 	mov    DWORD PTR [rbp-0x28],0x2
        arg.dist_addr=bh->b_data;
  802416:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80241a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80241d:	89 85 34 ff ff ff    	mov    DWORD PTR [rbp-0xcc],eax
        arg.len=BLOCK_SIZE;
  802423:	c7 85 48 ff ff ff 00 	mov    DWORD PTR [rbp-0xb8],0x200
  80242a:	02 00 00 
        arg.lba=bh->b_blocknr;
  80242d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802431:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  802435:	89 85 30 ff ff ff    	mov    DWORD PTR [rbp-0xd0],eax
        arg.sec_c=BLOCK_SIZE/512;//之后会改
  80243b:	c7 85 48 ff ff ff 01 	mov    DWORD PTR [rbp-0xb8],0x1
  802442:	00 00 00 
        //lock_buffer(bh);//锁定缓冲块直到读取完成
        int reqi=make_request(&arg);
  802445:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  80244c:	48 89 c7             	mov    rdi,rax
  80244f:	e8 71 11 00 00       	call   8035c5 <make_request>
  802454:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        wait_on_req(reqi);
  802457:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80245a:	89 c7                	mov    edi,eax
  80245c:	e8 77 14 00 00       	call   8038d8 <wait_on_req>
        clear_req(reqi);
  802461:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802464:	89 c7                	mov    edi,eax
  802466:	e8 9d 14 00 00       	call   803908 <clear_req>
    }
    return bh;
  80246b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80246f:	c9                   	leave  
  802470:	c3                   	ret    

0000000000802471 <vfs_read_file>:


int vfs_read_file(vfs_dir_entry *f,char *buf,int len)
{
  802471:	f3 0f 1e fa          	endbr64 
  802475:	55                   	push   rbp
  802476:	48 89 e5             	mov    rbp,rsp
  802479:	48 83 ec 40          	sub    rsp,0x40
  80247d:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802481:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  802485:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  802488:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80248c:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  80248f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802492:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802496:	48 89 c7             	mov    rdi,rax
  802499:	e8 80 01 00 00       	call   80261e <get_according_bnr>
  80249e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=bread(dev,block);
  8024a1:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  8024a4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8024a7:	89 d6                	mov    esi,edx
  8024a9:	89 c7                	mov    edi,eax
  8024ab:	e8 06 ff ff ff       	call   8023b6 <bread>
  8024b0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  8024b4:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8024b7:	ba 00 02 00 00       	mov    edx,0x200
  8024bc:	39 d0                	cmp    eax,edx
  8024be:	0f 4f c2             	cmovg  eax,edx
  8024c1:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(buf,bh->b_data,size);
  8024c4:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  8024c7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8024cb:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8024ce:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8024d2:	48 89 ce             	mov    rsi,rcx
  8024d5:	48 89 c7             	mov    rdi,rax
  8024d8:	e8 da 7f 00 00       	call   80a4b7 <memcpy>
        len-=BLOCK_SIZE;
  8024dd:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  8024e4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024e8:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8024eb:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8024ee:	01 c2                	add    edx,eax
  8024f0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8024f4:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        brelse(bh);
  8024f7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8024fb:	48 89 c7             	mov    rdi,rax
  8024fe:	e8 50 fe ff ff       	call   802353 <brelse>
    }while(len>0);
  802503:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  802507:	7f 89                	jg     802492 <vfs_read_file+0x21>
    return 0;
  802509:	b8 00 00 00 00       	mov    eax,0x0
}
  80250e:	c9                   	leave  
  80250f:	c3                   	ret    

0000000000802510 <vfs_write_file>:
int vfs_write_file(vfs_dir_entry *f,char *buf,int len)
{
  802510:	f3 0f 1e fa          	endbr64 
  802514:	55                   	push   rbp
  802515:	48 89 e5             	mov    rbp,rsp
  802518:	48 83 ec 40          	sub    rsp,0x40
  80251c:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  802520:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  802524:	89 55 cc             	mov    DWORD PTR [rbp-0x34],edx
    int dev=f->dev;
  802527:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80252b:	8b 40 20             	mov    eax,DWORD PTR [rax+0x20]
  80252e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    do{
        int block=get_according_bnr(f);
  802531:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802535:	48 89 c7             	mov    rdi,rax
  802538:	e8 e1 00 00 00       	call   80261e <get_according_bnr>
  80253d:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
        buffer_head* bh=get_buf(dev,block);
  802540:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  802543:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802546:	89 d6                	mov    esi,edx
  802548:	89 c7                	mov    edi,eax
  80254a:	e8 0f 01 00 00       	call   80265e <get_buf>
  80254f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  802553:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  802556:	ba 00 02 00 00       	mov    edx,0x200
  80255b:	39 d0                	cmp    eax,edx
  80255d:	0f 4f c2             	cmovg  eax,edx
  802560:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
        memcpy(bh->b_data,buf,size);
  802563:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  802566:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80256a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80256d:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
  802571:	48 89 ce             	mov    rsi,rcx
  802574:	48 89 c7             	mov    rdi,rax
  802577:	e8 3b 7f 00 00       	call   80a4b7 <memcpy>
        len-=BLOCK_SIZE;
  80257c:	81 6d cc 00 02 00 00 	sub    DWORD PTR [rbp-0x34],0x200
        //读写指针后移
        f->ptr+=size;
  802583:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802587:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  80258a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80258d:	01 c2                	add    edx,eax
  80258f:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802593:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        bh->b_dirt=1;//修改置位
  802596:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80259a:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  80259e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8025a2:	48 89 c7             	mov    rdi,rax
  8025a5:	e8 a9 fd ff ff       	call   802353 <brelse>
    }while(len>0);
  8025aa:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  8025ae:	7f 81                	jg     802531 <vfs_write_file+0x21>
    return 0;
  8025b0:	b8 00 00 00 00       	mov    eax,0x0
}
  8025b5:	c9                   	leave  
  8025b6:	c3                   	ret    

00000000008025b7 <vfs_seek_file>:

int vfs_seek_file(vfs_dir_entry *f,int offset,int origin)
{
  8025b7:	f3 0f 1e fa          	endbr64 
  8025bb:	55                   	push   rbp
  8025bc:	48 89 e5             	mov    rbp,rsp
  8025bf:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8025c3:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
  8025c6:	89 55 f0             	mov    DWORD PTR [rbp-0x10],edx
    switch (origin)
  8025c9:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8025cd:	74 20                	je     8025ef <vfs_seek_file+0x38>
  8025cf:	83 7d f0 02          	cmp    DWORD PTR [rbp-0x10],0x2
  8025d3:	7f 3f                	jg     802614 <vfs_seek_file+0x5d>
  8025d5:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
  8025d9:	74 08                	je     8025e3 <vfs_seek_file+0x2c>
  8025db:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  8025df:	74 23                	je     802604 <vfs_seek_file+0x4d>
        break;
    case SEEK_END:
        f->ptr=f->size;
        break;
    default:
        break;
  8025e1:	eb 31                	jmp    802614 <vfs_seek_file+0x5d>
        f->ptr=offset;
  8025e3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025e7:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8025ea:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  8025ed:	eb 26                	jmp    802615 <vfs_seek_file+0x5e>
        f->ptr+=offset;
  8025ef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025f3:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8025f6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8025f9:	01 c2                	add    edx,eax
  8025fb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8025ff:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802602:	eb 11                	jmp    802615 <vfs_seek_file+0x5e>
        f->ptr=f->size;
  802604:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802608:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  80260b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80260f:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
        break;
  802612:	eb 01                	jmp    802615 <vfs_seek_file+0x5e>
        break;
  802614:	90                   	nop
    }
    return f->ptr;
  802615:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802619:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
}
  80261c:	5d                   	pop    rbp
  80261d:	c3                   	ret    

000000000080261e <get_according_bnr>:
//返回文件ptr在块设备中的块号
int get_according_bnr(vfs_dir_entry *f)
{
  80261e:	f3 0f 1e fa          	endbr64 
  802622:	55                   	push   rbp
  802623:	48 89 e5             	mov    rbp,rsp
  802626:	48 83 ec 10          	sub    rsp,0x10
  80262a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    return vols[f->voln].fs->get_according_bnr(f);
  80262e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802632:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802635:	48 63 d0             	movsxd rdx,eax
  802638:	48 89 d0             	mov    rax,rdx
  80263b:	48 c1 e0 02          	shl    rax,0x2
  80263f:	48 01 d0             	add    rax,rdx
  802642:	48 c1 e0 03          	shl    rax,0x3
  802646:	48 05 58 02 40 00    	add    rax,0x400258
  80264c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80264f:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  802653:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802657:	48 89 c7             	mov    rdi,rax
  80265a:	ff d2                	call   rdx

}
  80265c:	c9                   	leave  
  80265d:	c3                   	ret    

000000000080265e <get_buf>:
//获取或者新建一个和dev上block相对应的缓冲区。
buffer_head* get_buf(int dev,int block)
{
  80265e:	f3 0f 1e fa          	endbr64 
  802662:	55                   	push   rbp
  802663:	48 89 e5             	mov    rbp,rsp
  802666:	48 83 ec 20          	sub    rsp,0x20
  80266a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80266d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802670:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802677:	e9 b9 00 00 00       	jmp    802735 <get_buf+0xd7>
    {
        if(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block)
  80267c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80267f:	48 98                	cdqe   
  802681:	48 c1 e0 06          	shl    rax,0x6
  802685:	48 05 90 26 40 00    	add    rax,0x402690
  80268b:	0f b7 00             	movzx  eax,WORD PTR [rax]
  80268e:	0f b7 c0             	movzx  eax,ax
  802691:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  802694:	0f 85 97 00 00 00    	jne    802731 <get_buf+0xd3>
  80269a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80269d:	48 98                	cdqe   
  80269f:	48 c1 e0 06          	shl    rax,0x6
  8026a3:	48 05 88 26 40 00    	add    rax,0x402688
  8026a9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8026ac:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8026af:	48 98                	cdqe   
  8026b1:	48 39 c2             	cmp    rdx,rax
  8026b4:	75 7b                	jne    802731 <get_buf+0xd3>
        {
            repeat:
  8026b6:	90                   	nop
            wait_on_buf(&buffer_heads[i]);//等待解锁
  8026b7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026ba:	48 98                	cdqe   
  8026bc:	48 c1 e0 06          	shl    rax,0x6
  8026c0:	48 05 80 26 40 00    	add    rax,0x402680
  8026c6:	48 89 c7             	mov    rdi,rax
  8026c9:	e8 41 01 00 00       	call   80280f <wait_on_buf>
            if(buffer_heads[i].b_count>0)//别的进程正在用
  8026ce:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026d1:	48 98                	cdqe   
  8026d3:	48 c1 e0 06          	shl    rax,0x6
  8026d7:	48 05 94 26 40 00    	add    rax,0x402694
  8026dd:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8026e0:	84 c0                	test   al,al
  8026e2:	74 02                	je     8026e6 <get_buf+0x88>
                goto repeat;
  8026e4:	eb d1                	jmp    8026b7 <get_buf+0x59>
            if(!(buffer_heads[i].b_dev==dev&&buffer_heads[i].b_blocknr==block))//别的进程修改了
  8026e6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8026e9:	48 98                	cdqe   
  8026eb:	48 c1 e0 06          	shl    rax,0x6
  8026ef:	48 05 90 26 40 00    	add    rax,0x402690
  8026f5:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8026f8:	0f b7 c0             	movzx  eax,ax
  8026fb:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8026fe:	75 30                	jne    802730 <get_buf+0xd2>
  802700:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802703:	48 98                	cdqe   
  802705:	48 c1 e0 06          	shl    rax,0x6
  802709:	48 05 88 26 40 00    	add    rax,0x402688
  80270f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  802712:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  802715:	48 98                	cdqe   
  802717:	48 39 c2             	cmp    rdx,rax
  80271a:	75 14                	jne    802730 <get_buf+0xd2>
                continue;
            return &buffer_heads[i];
  80271c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80271f:	48 98                	cdqe   
  802721:	48 c1 e0 06          	shl    rax,0x6
  802725:	48 05 80 26 40 00    	add    rax,0x402680
  80272b:	e9 dd 00 00 00       	jmp    80280d <get_buf+0x1af>
                continue;
  802730:	90                   	nop
    for(int i=0;i<NR_BUFFERHEADS;i++)
  802731:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802735:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  802739:	0f 8e 3d ff ff ff    	jle    80267c <get_buf+0x1e>
        }
    }
    //空头中找
    for(int i=0;i<NR_BUFFERHEADS;i++)
  80273f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  802746:	e9 b8 00 00 00       	jmp    802803 <get_buf+0x1a5>
    {
        if(buffer_heads[i].b_count==0)
  80274b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80274e:	48 98                	cdqe   
  802750:	48 c1 e0 06          	shl    rax,0x6
  802754:	48 05 94 26 40 00    	add    rax,0x402694
  80275a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80275d:	84 c0                	test   al,al
  80275f:	0f 85 9a 00 00 00    	jne    8027ff <get_buf+0x1a1>
        {
            if(buffer_heads[i].b_dirt)
  802765:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802768:	48 98                	cdqe   
  80276a:	48 c1 e0 06          	shl    rax,0x6
  80276e:	48 05 93 26 40 00    	add    rax,0x402693
  802774:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  802777:	84 c0                	test   al,al
  802779:	74 2e                	je     8027a9 <get_buf+0x14b>
            {
                sync_buf(&buffer_heads[i]);
  80277b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80277e:	48 98                	cdqe   
  802780:	48 c1 e0 06          	shl    rax,0x6
  802784:	48 05 80 26 40 00    	add    rax,0x402680
  80278a:	48 89 c7             	mov    rdi,rax
  80278d:	e8 1b 01 00 00       	call   8028ad <sync_buf>
                wait_on_buf(&buffer_heads[i]);
  802792:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  802795:	48 98                	cdqe   
  802797:	48 c1 e0 06          	shl    rax,0x6
  80279b:	48 05 80 26 40 00    	add    rax,0x402680
  8027a1:	48 89 c7             	mov    rdi,rax
  8027a4:	e8 66 00 00 00       	call   80280f <wait_on_buf>
            }
            buffer_heads[i].b_count++;
  8027a9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027ac:	48 98                	cdqe   
  8027ae:	48 c1 e0 06          	shl    rax,0x6
  8027b2:	48 05 94 26 40 00    	add    rax,0x402694
  8027b8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8027bb:	8d 50 01             	lea    edx,[rax+0x1]
  8027be:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027c1:	48 98                	cdqe   
  8027c3:	48 c1 e0 06          	shl    rax,0x6
  8027c7:	48 05 94 26 40 00    	add    rax,0x402694
  8027cd:	88 10                	mov    BYTE PTR [rax],dl
            //给buffer分配一个实际的缓冲区
            buffer_heads[i].b_data=vmalloc();
  8027cf:	b8 00 00 00 00       	mov    eax,0x0
  8027d4:	e8 22 e9 ff ff       	call   8010fb <vmalloc>
  8027d9:	48 89 c2             	mov    rdx,rax
  8027dc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027df:	48 98                	cdqe   
  8027e1:	48 c1 e0 06          	shl    rax,0x6
  8027e5:	48 05 80 26 40 00    	add    rax,0x402680
  8027eb:	48 89 10             	mov    QWORD PTR [rax],rdx
            return &buffer_heads[i];
  8027ee:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8027f1:	48 98                	cdqe   
  8027f3:	48 c1 e0 06          	shl    rax,0x6
  8027f7:	48 05 80 26 40 00    	add    rax,0x402680
  8027fd:	eb 0e                	jmp    80280d <get_buf+0x1af>
    for(int i=0;i<NR_BUFFERHEADS;i++)
  8027ff:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  802803:	83 7d f8 1f          	cmp    DWORD PTR [rbp-0x8],0x1f
  802807:	0f 8e 3e ff ff ff    	jle    80274b <get_buf+0xed>
        }
    }
}
  80280d:	c9                   	leave  
  80280e:	c3                   	ret    

000000000080280f <wait_on_buf>:

void wait_on_buf(buffer_head* bh)
{
  80280f:	f3 0f 1e fa          	endbr64 
  802813:	55                   	push   rbp
  802814:	48 89 e5             	mov    rbp,rsp
  802817:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    //等待缓冲区解锁
    while (bh->b_lock);
  80281b:	90                   	nop
  80281c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802820:	0f b6 40 15          	movzx  eax,BYTE PTR [rax+0x15]
  802824:	84 c0                	test   al,al
  802826:	75 f4                	jne    80281c <wait_on_buf+0xd>
    
}
  802828:	90                   	nop
  802829:	90                   	nop
  80282a:	5d                   	pop    rbp
  80282b:	c3                   	ret    

000000000080282c <scan_dev>:

//扫描块设备，读取分区，识别文件系统
int scan_dev(int dev)
{
  80282c:	f3 0f 1e fa          	endbr64 
  802830:	55                   	push   rbp
  802831:	48 89 e5             	mov    rbp,rsp
  802834:	48 83 ec 30          	sub    rsp,0x30
  802838:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
//    device *blkdev=get_dev(dev);
//    buffer_head* bh=bread(dev,0);
//    if(!bh)return -1;
    char* buf=vmalloc();
  80283b:	b8 00 00 00 00       	mov    eax,0x0
  802840:	e8 b6 e8 ff ff       	call   8010fb <vmalloc>
  802845:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    int r=request(DISK_MAJOR_MAJOR,DISK_CMD_READ,0,1,buf);
  802849:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80284d:	49 89 c0             	mov    r8,rax
  802850:	b9 01 00 00 00       	mov    ecx,0x1
  802855:	ba 00 00 00 00       	mov    edx,0x0
  80285a:	be 20 00 00 00       	mov    esi,0x20
  80285f:	bf 00 00 00 00       	mov    edi,0x0
  802864:	e8 d9 41 00 00       	call   806a42 <request>
  802869:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    chk_result(r);
  80286c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80286f:	89 c7                	mov    edi,eax
  802871:	e8 80 48 00 00       	call   8070f6 <chk_result>

    dpt_t* dpte=buf+0x1be;
  802876:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80287a:	48 05 be 01 00 00    	add    rax,0x1be
  802880:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(int i=0;i<4;i++)
  802884:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80288b:	eb 13                	jmp    8028a0 <scan_dev+0x74>
    {
//        blkdev->par[i].type=dpte->type;
        int stlba=dpte->start_lba;
  80288d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802891:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802894:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
//        {
//            printf("err:unrecognised partition fs.\n");
//        }

//        blkdev->par[i].end_sec=dpte->end_lba;
        dpte++;
  802897:	48 83 45 f8 10       	add    QWORD PTR [rbp-0x8],0x10
    for(int i=0;i<4;i++)
  80289c:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8028a0:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  8028a4:	7e e7                	jle    80288d <scan_dev+0x61>
    }
//    brelse(bh);
    return 0;
  8028a6:	b8 00 00 00 00       	mov    eax,0x0
}
  8028ab:	c9                   	leave  
  8028ac:	c3                   	ret    

00000000008028ad <sync_buf>:

int sync_buf(buffer_head* bh)
{
  8028ad:	f3 0f 1e fa          	endbr64 
  8028b1:	55                   	push   rbp
  8028b2:	48 89 e5             	mov    rbp,rsp
  8028b5:	48 83 ec 20          	sub    rsp,0x20
  8028b9:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int dev=bh->b_dev;
  8028bd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8028c1:	0f b7 40 10          	movzx  eax,WORD PTR [rax+0x10]
  8028c5:	0f b7 c0             	movzx  eax,ax
  8028c8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int block=bh->b_blocknr;
  8028cb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8028cf:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8028d3:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //这里需要调用块设备写函数write_block
    return write_block(dev,block,bh->b_data,BLOCK_SIZE);
  8028d6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8028da:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8028dd:	8b 75 f8             	mov    esi,DWORD PTR [rbp-0x8]
  8028e0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8028e3:	b9 00 02 00 00       	mov    ecx,0x200
  8028e8:	89 c7                	mov    edi,eax
  8028ea:	e8 02 00 00 00       	call   8028f1 <write_block>

}
  8028ef:	c9                   	leave  
  8028f0:	c3                   	ret    

00000000008028f1 <write_block>:
//操作块设备函数
int write_block(int dev,int block,char *buf,int len)
{
  8028f1:	f3 0f 1e fa          	endbr64 
  8028f5:	55                   	push   rbp
  8028f6:	48 89 e5             	mov    rbp,rsp
  8028f9:	48 83 ec 30          	sub    rsp,0x30
  8028fd:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  802900:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802903:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802907:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=get_buf(dev,block);
  80290a:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80290d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  802910:	89 d6                	mov    esi,edx
  802912:	89 c7                	mov    edi,eax
  802914:	e8 45 fd ff ff       	call   80265e <get_buf>
  802919:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80291d:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  802920:	ba 00 02 00 00       	mov    edx,0x200
  802925:	39 d0                	cmp    eax,edx
  802927:	0f 4f c2             	cmovg  eax,edx
  80292a:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(bh->b_data,buf,size);
  80292d:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  802930:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802934:	48 8b 00             	mov    rax,QWORD PTR [rax]
  802937:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
  80293b:	48 89 ce             	mov    rsi,rcx
  80293e:	48 89 c7             	mov    rdi,rax
  802941:	e8 71 7b 00 00       	call   80a4b7 <memcpy>
        len-=BLOCK_SIZE;
  802946:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        bh->b_dirt=1;//修改置位
  80294d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802951:	c6 40 13 01          	mov    BYTE PTR [rax+0x13],0x1
        brelse(bh);
  802955:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802959:	48 89 c7             	mov    rdi,rax
  80295c:	e8 f2 f9 ff ff       	call   802353 <brelse>
    }while(len>0);
  802961:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  802965:	7f a3                	jg     80290a <write_block+0x19>
    return 0;
  802967:	b8 00 00 00 00       	mov    eax,0x0
}
  80296c:	c9                   	leave  
  80296d:	c3                   	ret    

000000000080296e <read_block>:
int read_block(int dev,int block,char* buf,int len)
{
  80296e:	f3 0f 1e fa          	endbr64 
  802972:	55                   	push   rbp
  802973:	48 89 e5             	mov    rbp,rsp
  802976:	48 83 ec 30          	sub    rsp,0x30
  80297a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  80297d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  802980:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
  802984:	89 4d dc             	mov    DWORD PTR [rbp-0x24],ecx
    do{
        buffer_head* bh=bread(dev,block);
  802987:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  80298a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80298d:	89 d6                	mov    esi,edx
  80298f:	89 c7                	mov    edi,eax
  802991:	e8 20 fa ff ff       	call   8023b6 <bread>
  802996:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
        int size=len>BLOCK_SIZE?BLOCK_SIZE:len;//一次最多读一块，如果len大于一块，就只能读一块
  80299a:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80299d:	ba 00 02 00 00       	mov    edx,0x200
  8029a2:	39 d0                	cmp    eax,edx
  8029a4:	0f 4f c2             	cmovg  eax,edx
  8029a7:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        memcpy(buf,bh->b_data,size);
  8029aa:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  8029ad:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029b1:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  8029b4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8029b8:	48 89 ce             	mov    rsi,rcx
  8029bb:	48 89 c7             	mov    rdi,rax
  8029be:	e8 f4 7a 00 00       	call   80a4b7 <memcpy>
        len-=BLOCK_SIZE;
  8029c3:	81 6d dc 00 02 00 00 	sub    DWORD PTR [rbp-0x24],0x200
        brelse(bh);
  8029ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8029ce:	48 89 c7             	mov    rdi,rax
  8029d1:	e8 7d f9 ff ff       	call   802353 <brelse>
    }while(len>0);
  8029d6:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
  8029da:	7f ab                	jg     802987 <read_block+0x19>
    return 0;
  8029dc:	b8 00 00 00 00       	mov    eax,0x0
}
  8029e1:	c9                   	leave  
  8029e2:	c3                   	ret    

00000000008029e3 <init_vfs>:

int init_vfs()
{
  8029e3:	f3 0f 1e fa          	endbr64 
  8029e7:	55                   	push   rbp
  8029e8:	48 89 e5             	mov    rbp,rsp
  8029eb:	48 83 ec 10          	sub    rsp,0x10
    //扫描块设备
    extern device *dev_tree[];
    extern device devs[];
    blk_dev* p=dev_tree[DEVTREE_BLKDEVI];
  8029ef:	48 8b 05 8a 5a c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05a8a]        # 408480 <dev_tree>
  8029f6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    for(;p;p=p->next)
  8029fa:	eb 40                	jmp    802a3c <init_vfs+0x59>
    {
        if(scan_dev(p-devs)!=0)return -1;
  8029fc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a00:	48 2d 80 2e 40 00    	sub    rax,0x402e80
  802a06:	48 c1 f8 02          	sar    rax,0x2
  802a0a:	48 89 c2             	mov    rdx,rax
  802a0d:	48 b8 19 9c 8f c1 f9 	movabs rax,0x8f9c18f9c18f9c19
  802a14:	18 9c 8f 
  802a17:	48 0f af c2          	imul   rax,rdx
  802a1b:	89 c7                	mov    edi,eax
  802a1d:	e8 0a fe ff ff       	call   80282c <scan_dev>
  802a22:	85 c0                	test   eax,eax
  802a24:	74 07                	je     802a2d <init_vfs+0x4a>
  802a26:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802a2b:	eb 1b                	jmp    802a48 <init_vfs+0x65>
    for(;p;p=p->next)
  802a2d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  802a31:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802a38:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  802a3c:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  802a41:	75 b9                	jne    8029fc <init_vfs+0x19>
    }

    return 0;
  802a43:	b8 00 00 00 00       	mov    eax,0x0
}
  802a48:	c9                   	leave  
  802a49:	c3                   	ret    

0000000000802a4a <init_drvdev_man>:
    [OPERATIONS_KEYBOARD]=NULL,
    [OPERATIONS_MOUSE]=NULL
};
static int rhead=0,rtail=0;
int init_drvdev_man()
{
  802a4a:	f3 0f 1e fa          	endbr64 
  802a4e:	55                   	push   rbp
  802a4f:	48 89 e5             	mov    rbp,rsp
}
  802a52:	90                   	nop
  802a53:	5d                   	pop    rbp
  802a54:	c3                   	ret    

0000000000802a55 <load_driver>:
int load_driver(char *path)
{
  802a55:	f3 0f 1e fa          	endbr64 
  802a59:	55                   	push   rbp
  802a5a:	48 89 e5             	mov    rbp,rsp
  802a5d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    
}
  802a61:	90                   	nop
  802a62:	5d                   	pop    rbp
  802a63:	c3                   	ret    

0000000000802a64 <reg_device>:

int reg_device(device* dev)
{
  802a64:	f3 0f 1e fa          	endbr64 
  802a68:	55                   	push   rbp
  802a69:	48 89 e5             	mov    rbp,rsp
  802a6c:	53                   	push   rbx
  802a6d:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //TODO:查重

    //放入数组
    int i=0;
  802a71:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<MAX_DEVICES;i++)
  802a78:	e9 42 01 00 00       	jmp    802bbf <reg_device+0x15b>
    {
        if(devs[i].flag==DEV_FLAG_EMPTY)
  802a7d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802a80:	48 63 d0             	movsxd rdx,eax
  802a83:	48 89 d0             	mov    rax,rdx
  802a86:	48 c1 e0 02          	shl    rax,0x2
  802a8a:	48 01 d0             	add    rax,rdx
  802a8d:	48 c1 e0 02          	shl    rax,0x2
  802a91:	48 01 d0             	add    rax,rdx
  802a94:	48 c1 e0 03          	shl    rax,0x3
  802a98:	48 05 90 2e 40 00    	add    rax,0x402e90
  802a9e:	8b 00                	mov    eax,DWORD PTR [rax]
  802aa0:	85 c0                	test   eax,eax
  802aa2:	0f 85 13 01 00 00    	jne    802bbb <reg_device+0x157>
        {
            devs[i]=*dev;
  802aa8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802aab:	48 63 d0             	movsxd rdx,eax
  802aae:	48 89 d0             	mov    rax,rdx
  802ab1:	48 c1 e0 02          	shl    rax,0x2
  802ab5:	48 01 d0             	add    rax,rdx
  802ab8:	48 c1 e0 02          	shl    rax,0x2
  802abc:	48 01 d0             	add    rax,rdx
  802abf:	48 c1 e0 03          	shl    rax,0x3
  802ac3:	48 8d 90 80 2e 40 00 	lea    rdx,[rax+0x402e80]
  802aca:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802ace:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802ad1:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802ad5:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802ad8:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802adc:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802ae0:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802ae4:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802ae8:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802aec:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802af0:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802af4:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802af8:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802afc:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802b00:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802b04:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802b08:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802b0c:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802b10:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802b14:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802b18:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802b1c:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802b20:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802b24:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802b28:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802b2c:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802b30:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802b34:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802b38:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802b3c:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802b40:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802b44:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802b48:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802b4c:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802b53:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802b5a:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802b61:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802b68:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802b6f:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802b76:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802b7d:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  802b84:	48 8b 80 a0 00 00 00 	mov    rax,QWORD PTR [rax+0xa0]
  802b8b:	48 89 82 a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rax
            devs[i].flag=DEV_FLAG_USED;
  802b92:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802b95:	48 63 d0             	movsxd rdx,eax
  802b98:	48 89 d0             	mov    rax,rdx
  802b9b:	48 c1 e0 02          	shl    rax,0x2
  802b9f:	48 01 d0             	add    rax,rdx
  802ba2:	48 c1 e0 02          	shl    rax,0x2
  802ba6:	48 01 d0             	add    rax,rdx
  802ba9:	48 c1 e0 03          	shl    rax,0x3
  802bad:	48 05 90 2e 40 00    	add    rax,0x402e90
  802bb3:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            break;
  802bb9:	eb 0e                	jmp    802bc9 <reg_device+0x165>
    for(;i<MAX_DEVICES;i++)
  802bbb:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802bbf:	83 7d f4 3f          	cmp    DWORD PTR [rbp-0xc],0x3f
  802bc3:	0f 8e b4 fe ff ff    	jle    802a7d <reg_device+0x19>
        }
    }
    if(i==MAX_DEVICES)
  802bc9:	83 7d f4 40          	cmp    DWORD PTR [rbp-0xc],0x40
  802bcd:	75 0a                	jne    802bd9 <reg_device+0x175>
        return -1;
  802bcf:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802bd4:	e9 6d 01 00 00       	jmp    802d46 <reg_device+0x2e2>
    //添加到链表
    device* p=NULL,*neo=&devs[i],**pp;
  802bd9:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  802be0:	00 
  802be1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802be4:	48 63 d0             	movsxd rdx,eax
  802be7:	48 89 d0             	mov    rax,rdx
  802bea:	48 c1 e0 02          	shl    rax,0x2
  802bee:	48 01 d0             	add    rax,rdx
  802bf1:	48 c1 e0 02          	shl    rax,0x2
  802bf5:	48 01 d0             	add    rax,rdx
  802bf8:	48 c1 e0 03          	shl    rax,0x3
  802bfc:	48 05 80 2e 40 00    	add    rax,0x402e80
  802c02:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    switch (dev->type)
  802c06:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  802c0a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  802c0d:	83 f8 03             	cmp    eax,0x3
  802c10:	74 3b                	je     802c4d <reg_device+0x1e9>
  802c12:	83 f8 03             	cmp    eax,0x3
  802c15:	7f 4b                	jg     802c62 <reg_device+0x1fe>
  802c17:	83 f8 01             	cmp    eax,0x1
  802c1a:	74 07                	je     802c23 <reg_device+0x1bf>
  802c1c:	83 f8 02             	cmp    eax,0x2
  802c1f:	74 17                	je     802c38 <reg_device+0x1d4>
  802c21:	eb 3f                	jmp    802c62 <reg_device+0x1fe>
    {
    case DEV_TYPE_BLKDEV:
        p=dev_tree[DEVTREE_BLKDEVI];pp=&dev_tree[DEVTREE_BLKDEVI];
  802c23:	48 8b 05 56 58 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05856]        # 408480 <dev_tree>
  802c2a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802c2e:	48 c7 45 e0 80 84 40 	mov    QWORD PTR [rbp-0x20],0x408480
  802c35:	00 
        break;
  802c36:	eb 34                	jmp    802c6c <reg_device+0x208>
    
    case DEV_TYPE_CHRDEV:
        p=dev_tree[DEVTREE_CHRDEVI];pp=&dev_tree[DEVTREE_CHRDEVI];
  802c38:	48 8b 05 49 58 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc05849]        # 408488 <dev_tree+0x8>
  802c3f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802c43:	48 c7 45 e0 88 84 40 	mov    QWORD PTR [rbp-0x20],0x408488
  802c4a:	00 
        break;
  802c4b:	eb 1f                	jmp    802c6c <reg_device+0x208>
        
    case DEV_TYPE_OTHERS:
        p=dev_tree[DEVTREE_OTHERDEVI];pp=&dev_tree[DEVTREE_OTHERDEVI];
  802c4d:	48 8b 05 3c 58 c0 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc0583c]        # 408490 <dev_tree+0x10>
  802c54:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802c58:	48 c7 45 e0 90 84 40 	mov    QWORD PTR [rbp-0x20],0x408490
  802c5f:	00 
        break;
  802c60:	eb 0a                	jmp    802c6c <reg_device+0x208>
    default:return -1;//不可能有其他情况
  802c62:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802c67:	e9 da 00 00 00       	jmp    802d46 <reg_device+0x2e2>
    }
    if(!p){
  802c6c:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
  802c71:	75 2b                	jne    802c9e <reg_device+0x23a>
        *pp=neo;
  802c73:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802c77:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802c7b:	48 89 10             	mov    QWORD PTR [rax],rdx
        neo->prev=NULL;
  802c7e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802c82:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x0
  802c89:	00 00 00 00 
  802c8d:	eb 3d                	jmp    802ccc <reg_device+0x268>
    }
    else{
        for(;p->next;p=p->next);
  802c8f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802c93:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802c9a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  802c9e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802ca2:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  802ca9:	48 85 c0             	test   rax,rax
  802cac:	75 e1                	jne    802c8f <reg_device+0x22b>
        p->next=neo;
  802cae:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802cb2:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  802cb6:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
        neo->prev=p;
  802cbd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802cc1:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  802cc5:	48 89 90 98 00 00 00 	mov    QWORD PTR [rax+0x98],rdx
    }
    neo->next=NULL;
  802ccc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802cd0:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x0
  802cd7:	00 00 00 00 
    //设置相应的请求函数
    switch (neo->stype)
  802cdb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802cdf:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  802ce2:	83 f8 04             	cmp    eax,0x4
  802ce5:	74 3b                	je     802d22 <reg_device+0x2be>
  802ce7:	83 f8 04             	cmp    eax,0x4
  802cea:	7f 56                	jg     802d42 <reg_device+0x2de>
  802cec:	83 f8 03             	cmp    eax,0x3
  802cef:	74 21                	je     802d12 <reg_device+0x2ae>
  802cf1:	83 f8 03             	cmp    eax,0x3
  802cf4:	7f 4c                	jg     802d42 <reg_device+0x2de>
  802cf6:	83 f8 01             	cmp    eax,0x1
  802cf9:	74 07                	je     802d02 <reg_device+0x29e>
  802cfb:	83 f8 02             	cmp    eax,0x2
  802cfe:	74 32                	je     802d32 <reg_device+0x2ce>
        break;
    case DEV_STYPE_TTY:
        neo->operi=OPERATIONS_TTY;
        break;
    default:
        break;
  802d00:	eb 40                	jmp    802d42 <reg_device+0x2de>
        neo->operi=OPERATIONS_HD;
  802d02:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d06:	c7 80 a0 00 00 00 00 	mov    DWORD PTR [rax+0xa0],0x0
  802d0d:	00 00 00 
        break;
  802d10:	eb 31                	jmp    802d43 <reg_device+0x2df>
        neo->operi=OPERATIONS_MOUSE;
  802d12:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d16:	c7 80 a0 00 00 00 02 	mov    DWORD PTR [rax+0xa0],0x2
  802d1d:	00 00 00 
        break;
  802d20:	eb 21                	jmp    802d43 <reg_device+0x2df>
        neo->operi=OPERATIONS_KEYBOARD;
  802d22:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d26:	c7 80 a0 00 00 00 03 	mov    DWORD PTR [rax+0xa0],0x3
  802d2d:	00 00 00 
        break;
  802d30:	eb 11                	jmp    802d43 <reg_device+0x2df>
        neo->operi=OPERATIONS_TTY;
  802d32:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  802d36:	c7 80 a0 00 00 00 01 	mov    DWORD PTR [rax+0xa0],0x1
  802d3d:	00 00 00 
        break;
  802d40:	eb 01                	jmp    802d43 <reg_device+0x2df>
        break;
  802d42:	90                   	nop
    }
    return i;
  802d43:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  802d46:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802d4a:	c9                   	leave  
  802d4b:	c3                   	ret    

0000000000802d4c <reg_driver>:


int reg_driver(driver *drv)
{
  802d4c:	f3 0f 1e fa          	endbr64 
  802d50:	55                   	push   rbp
  802d51:	48 89 e5             	mov    rbp,rsp
  802d54:	53                   	push   rbx
  802d55:	48 89 7d e0          	mov    QWORD PTR [rbp-0x20],rdi
    for(int i=0;i<MAX_DRIVERS;i++)
  802d59:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  802d60:	e9 22 01 00 00       	jmp    802e87 <reg_driver+0x13b>
    {
        if(drvs[i].flag==DRV_FLAG_EMPTY)
  802d65:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802d68:	48 63 d0             	movsxd rdx,eax
  802d6b:	48 89 d0             	mov    rax,rdx
  802d6e:	48 c1 e0 02          	shl    rax,0x2
  802d72:	48 01 d0             	add    rax,rdx
  802d75:	48 c1 e0 05          	shl    rax,0x5
  802d79:	48 05 80 58 40 00    	add    rax,0x405880
  802d7f:	8b 00                	mov    eax,DWORD PTR [rax]
  802d81:	85 c0                	test   eax,eax
  802d83:	0f 85 fa 00 00 00    	jne    802e83 <reg_driver+0x137>
        {
            drvs[i]=*drv;
  802d89:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802d8c:	48 63 d0             	movsxd rdx,eax
  802d8f:	48 89 d0             	mov    rax,rdx
  802d92:	48 c1 e0 02          	shl    rax,0x2
  802d96:	48 01 d0             	add    rax,rdx
  802d99:	48 c1 e0 05          	shl    rax,0x5
  802d9d:	48 8d 90 80 58 40 00 	lea    rdx,[rax+0x405880]
  802da4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  802da8:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  802dab:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  802daf:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  802db2:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  802db6:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  802dba:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  802dbe:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  802dc2:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  802dc6:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  802dca:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  802dce:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  802dd2:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  802dd6:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  802dda:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  802dde:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  802de2:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  802de6:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  802dea:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  802dee:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  802df2:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  802df6:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  802dfa:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  802dfe:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  802e02:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  802e06:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  802e0a:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  802e0e:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  802e12:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  802e16:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  802e1a:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  802e1e:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  802e22:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  802e26:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  802e2d:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  802e34:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  802e3b:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  802e42:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  802e49:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  802e50:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  802e57:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
            drvs[i].flag=DRV_FLAG_USED;
  802e5e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802e61:	48 63 d0             	movsxd rdx,eax
  802e64:	48 89 d0             	mov    rax,rdx
  802e67:	48 c1 e0 02          	shl    rax,0x2
  802e6b:	48 01 d0             	add    rax,rdx
  802e6e:	48 c1 e0 05          	shl    rax,0x5
  802e72:	48 05 80 58 40 00    	add    rax,0x405880
  802e78:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
            return i;
  802e7e:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  802e81:	eb 13                	jmp    802e96 <reg_driver+0x14a>
    for(int i=0;i<MAX_DRIVERS;i++)
  802e83:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  802e87:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  802e8b:	0f 8e d4 fe ff ff    	jle    802d65 <reg_driver+0x19>
        }
    }
    return -1;
  802e91:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802e96:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  802e9a:	c9                   	leave  
  802e9b:	c3                   	ret    

0000000000802e9c <sys_find_dev>:

int sys_find_dev(char *name)
{
  802e9c:	f3 0f 1e fa          	endbr64 
  802ea0:	55                   	push   rbp
  802ea1:	48 89 e5             	mov    rbp,rsp
  802ea4:	48 83 ec 20          	sub    rsp,0x20
  802ea8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_DEVICES;i++)
  802eac:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  802eb3:	eb 6c                	jmp    802f21 <sys_find_dev+0x85>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802eb5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802eb8:	48 63 d0             	movsxd rdx,eax
  802ebb:	48 89 d0             	mov    rax,rdx
  802ebe:	48 c1 e0 02          	shl    rax,0x2
  802ec2:	48 01 d0             	add    rax,rdx
  802ec5:	48 c1 e0 02          	shl    rax,0x2
  802ec9:	48 01 d0             	add    rax,rdx
  802ecc:	48 c1 e0 03          	shl    rax,0x3
  802ed0:	48 05 90 2e 40 00    	add    rax,0x402e90
  802ed6:	8b 00                	mov    eax,DWORD PTR [rax]
  802ed8:	85 c0                	test   eax,eax
  802eda:	74 41                	je     802f1d <sys_find_dev+0x81>
  802edc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802edf:	48 63 d0             	movsxd rdx,eax
  802ee2:	48 89 d0             	mov    rax,rdx
  802ee5:	48 c1 e0 02          	shl    rax,0x2
  802ee9:	48 01 d0             	add    rax,rdx
  802eec:	48 c1 e0 02          	shl    rax,0x2
  802ef0:	48 01 d0             	add    rax,rdx
  802ef3:	48 c1 e0 03          	shl    rax,0x3
  802ef7:	48 83 c0 10          	add    rax,0x10
  802efb:	48 05 80 2e 40 00    	add    rax,0x402e80
  802f01:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802f05:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802f09:	48 89 d6             	mov    rsi,rdx
  802f0c:	48 89 c7             	mov    rdi,rax
  802f0f:	e8 41 78 00 00       	call   80a755 <strcmp>
  802f14:	85 c0                	test   eax,eax
  802f16:	75 05                	jne    802f1d <sys_find_dev+0x81>
            return i;
  802f18:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f1b:	eb 0f                	jmp    802f2c <sys_find_dev+0x90>
    for(int i=0;i<MAX_DEVICES;i++)
  802f1d:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802f21:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802f25:	7e 8e                	jle    802eb5 <sys_find_dev+0x19>
    }
    return -1;
  802f27:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  802f2c:	c9                   	leave  
  802f2d:	c3                   	ret    

0000000000802f2e <sys_operate_dev>:

int sys_operate_dev(char *name,int func,driver_args* args)
{
  802f2e:	f3 0f 1e fa          	endbr64 
  802f32:	55                   	push   rbp
  802f33:	48 89 e5             	mov    rbp,rsp
  802f36:	48 83 ec 30          	sub    rsp,0x30
  802f3a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  802f3e:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
  802f41:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    int i=0;
  802f45:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;i<MAX_DEVICES;i++)
  802f4c:	eb 67                	jmp    802fb5 <sys_operate_dev+0x87>
    {
        if(devs[i].flag!=DEV_FLAG_EMPTY&&strcmp(name,devs[i].name)==0)
  802f4e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f51:	48 63 d0             	movsxd rdx,eax
  802f54:	48 89 d0             	mov    rax,rdx
  802f57:	48 c1 e0 02          	shl    rax,0x2
  802f5b:	48 01 d0             	add    rax,rdx
  802f5e:	48 c1 e0 02          	shl    rax,0x2
  802f62:	48 01 d0             	add    rax,rdx
  802f65:	48 c1 e0 03          	shl    rax,0x3
  802f69:	48 05 90 2e 40 00    	add    rax,0x402e90
  802f6f:	8b 00                	mov    eax,DWORD PTR [rax]
  802f71:	85 c0                	test   eax,eax
  802f73:	74 3c                	je     802fb1 <sys_operate_dev+0x83>
  802f75:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802f78:	48 63 d0             	movsxd rdx,eax
  802f7b:	48 89 d0             	mov    rax,rdx
  802f7e:	48 c1 e0 02          	shl    rax,0x2
  802f82:	48 01 d0             	add    rax,rdx
  802f85:	48 c1 e0 02          	shl    rax,0x2
  802f89:	48 01 d0             	add    rax,rdx
  802f8c:	48 c1 e0 03          	shl    rax,0x3
  802f90:	48 83 c0 10          	add    rax,0x10
  802f94:	48 05 80 2e 40 00    	add    rax,0x402e80
  802f9a:	48 8d 50 04          	lea    rdx,[rax+0x4]
  802f9e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  802fa2:	48 89 d6             	mov    rsi,rdx
  802fa5:	48 89 c7             	mov    rdi,rax
  802fa8:	e8 a8 77 00 00       	call   80a755 <strcmp>
  802fad:	85 c0                	test   eax,eax
  802faf:	74 0c                	je     802fbd <sys_operate_dev+0x8f>
    for(;i<MAX_DEVICES;i++)
  802fb1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  802fb5:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  802fb9:	7e 93                	jle    802f4e <sys_operate_dev+0x20>
  802fbb:	eb 01                	jmp    802fbe <sys_operate_dev+0x90>
            break;
  802fbd:	90                   	nop
    }
    if(i==MAX_DEVICES)return -1;
  802fbe:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  802fc2:	75 0a                	jne    802fce <sys_operate_dev+0xa0>
  802fc4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  802fc9:	e9 9c 02 00 00       	jmp    80326a <sys_operate_dev+0x33c>
    switch (func) {
  802fce:	83 7d e4 0b          	cmp    DWORD PTR [rbp-0x1c],0xb
  802fd2:	0f 87 8d 02 00 00    	ja     803265 <sys_operate_dev+0x337>
  802fd8:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  802fdb:	48 8b 04 c5 e8 29 81 	mov    rax,QWORD PTR [rax*8+0x8129e8]
  802fe2:	00 
  802fe3:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return devs[i].drv->open(args);
  802fe6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  802fe9:	48 63 d0             	movsxd rdx,eax
  802fec:	48 89 d0             	mov    rax,rdx
  802fef:	48 c1 e0 02          	shl    rax,0x2
  802ff3:	48 01 d0             	add    rax,rdx
  802ff6:	48 c1 e0 02          	shl    rax,0x2
  802ffa:	48 01 d0             	add    rax,rdx
  802ffd:	48 c1 e0 03          	shl    rax,0x3
  803001:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803007:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80300a:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  80300e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803012:	48 89 c7             	mov    rdi,rax
  803015:	ff d2                	call   rdx
  803017:	e9 4e 02 00 00       	jmp    80326a <sys_operate_dev+0x33c>
        case DRVF_CLOSE:return devs[i].drv->close(args);
  80301c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80301f:	48 63 d0             	movsxd rdx,eax
  803022:	48 89 d0             	mov    rax,rdx
  803025:	48 c1 e0 02          	shl    rax,0x2
  803029:	48 01 d0             	add    rax,rdx
  80302c:	48 c1 e0 02          	shl    rax,0x2
  803030:	48 01 d0             	add    rax,rdx
  803033:	48 c1 e0 03          	shl    rax,0x3
  803037:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80303d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803040:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  803044:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803048:	48 89 c7             	mov    rdi,rax
  80304b:	ff d2                	call   rdx
  80304d:	e9 18 02 00 00       	jmp    80326a <sys_operate_dev+0x33c>
        case DRVF_READ :return devs[i].drv->read(args);
  803052:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803055:	48 63 d0             	movsxd rdx,eax
  803058:	48 89 d0             	mov    rax,rdx
  80305b:	48 c1 e0 02          	shl    rax,0x2
  80305f:	48 01 d0             	add    rax,rdx
  803062:	48 c1 e0 02          	shl    rax,0x2
  803066:	48 01 d0             	add    rax,rdx
  803069:	48 c1 e0 03          	shl    rax,0x3
  80306d:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803073:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803076:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  80307a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80307e:	48 89 c7             	mov    rdi,rax
  803081:	ff d2                	call   rdx
  803083:	e9 e2 01 00 00       	jmp    80326a <sys_operate_dev+0x33c>
        case DRVF_WRITE:return devs[i].drv->write(args);
  803088:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80308b:	48 63 d0             	movsxd rdx,eax
  80308e:	48 89 d0             	mov    rax,rdx
  803091:	48 c1 e0 02          	shl    rax,0x2
  803095:	48 01 d0             	add    rax,rdx
  803098:	48 c1 e0 02          	shl    rax,0x2
  80309c:	48 01 d0             	add    rax,rdx
  80309f:	48 c1 e0 03          	shl    rax,0x3
  8030a3:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030a9:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030ac:	48 8b 50 20          	mov    rdx,QWORD PTR [rax+0x20]
  8030b0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030b4:	48 89 c7             	mov    rdi,rax
  8030b7:	ff d2                	call   rdx
  8030b9:	e9 ac 01 00 00       	jmp    80326a <sys_operate_dev+0x33c>
        case DRVF_CHK  :return devs[i].drv->check(args);
  8030be:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030c1:	48 63 d0             	movsxd rdx,eax
  8030c4:	48 89 d0             	mov    rax,rdx
  8030c7:	48 c1 e0 02          	shl    rax,0x2
  8030cb:	48 01 d0             	add    rax,rdx
  8030ce:	48 c1 e0 02          	shl    rax,0x2
  8030d2:	48 01 d0             	add    rax,rdx
  8030d5:	48 c1 e0 03          	shl    rax,0x3
  8030d9:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8030df:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8030e2:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  8030e6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8030ea:	48 89 c7             	mov    rdi,rax
  8030ed:	ff d2                	call   rdx
  8030ef:	e9 76 01 00 00       	jmp    80326a <sys_operate_dev+0x33c>
        case DRVF_RSVD :return devs[i].drv->reserved(args);
  8030f4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8030f7:	48 63 d0             	movsxd rdx,eax
  8030fa:	48 89 d0             	mov    rax,rdx
  8030fd:	48 c1 e0 02          	shl    rax,0x2
  803101:	48 01 d0             	add    rax,rdx
  803104:	48 c1 e0 02          	shl    rax,0x2
  803108:	48 01 d0             	add    rax,rdx
  80310b:	48 c1 e0 03          	shl    rax,0x3
  80310f:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803115:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803118:	48 8b 50 30          	mov    rdx,QWORD PTR [rax+0x30]
  80311c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803120:	48 89 c7             	mov    rdi,rax
  803123:	ff d2                	call   rdx
  803125:	e9 40 01 00 00       	jmp    80326a <sys_operate_dev+0x33c>
        case DRVF_INT  :return devs[i].drv->inthandler(args);
  80312a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80312d:	48 63 d0             	movsxd rdx,eax
  803130:	48 89 d0             	mov    rax,rdx
  803133:	48 c1 e0 02          	shl    rax,0x2
  803137:	48 01 d0             	add    rax,rdx
  80313a:	48 c1 e0 02          	shl    rax,0x2
  80313e:	48 01 d0             	add    rax,rdx
  803141:	48 c1 e0 03          	shl    rax,0x3
  803145:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  80314b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80314e:	48 8b 50 38          	mov    rdx,QWORD PTR [rax+0x38]
  803152:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  803156:	48 89 c7             	mov    rdi,rax
  803159:	ff d2                	call   rdx
  80315b:	e9 0a 01 00 00       	jmp    80326a <sys_operate_dev+0x33c>
        case DRVF_FIND :return devs[i].drv->find(args);
  803160:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803163:	48 63 d0             	movsxd rdx,eax
  803166:	48 89 d0             	mov    rax,rdx
  803169:	48 c1 e0 02          	shl    rax,0x2
  80316d:	48 01 d0             	add    rax,rdx
  803170:	48 c1 e0 02          	shl    rax,0x2
  803174:	48 01 d0             	add    rax,rdx
  803177:	48 c1 e0 03          	shl    rax,0x3
  80317b:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803181:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803184:	48 8b 50 40          	mov    rdx,QWORD PTR [rax+0x40]
  803188:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80318c:	48 89 c7             	mov    rdi,rax
  80318f:	ff d2                	call   rdx
  803191:	e9 d4 00 00 00       	jmp    80326a <sys_operate_dev+0x33c>
        case DRVF_RM   :return devs[i].drv->rm(args);
  803196:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803199:	48 63 d0             	movsxd rdx,eax
  80319c:	48 89 d0             	mov    rax,rdx
  80319f:	48 c1 e0 02          	shl    rax,0x2
  8031a3:	48 01 d0             	add    rax,rdx
  8031a6:	48 c1 e0 02          	shl    rax,0x2
  8031aa:	48 01 d0             	add    rax,rdx
  8031ad:	48 c1 e0 03          	shl    rax,0x3
  8031b1:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031b7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031ba:	48 8b 50 48          	mov    rdx,QWORD PTR [rax+0x48]
  8031be:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031c2:	48 89 c7             	mov    rdi,rax
  8031c5:	ff d2                	call   rdx
  8031c7:	e9 9e 00 00 00       	jmp    80326a <sys_operate_dev+0x33c>
        case DRVF_TOUCH:return devs[i].drv->touch(args);
  8031cc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8031cf:	48 63 d0             	movsxd rdx,eax
  8031d2:	48 89 d0             	mov    rax,rdx
  8031d5:	48 c1 e0 02          	shl    rax,0x2
  8031d9:	48 01 d0             	add    rax,rdx
  8031dc:	48 c1 e0 02          	shl    rax,0x2
  8031e0:	48 01 d0             	add    rax,rdx
  8031e3:	48 c1 e0 03          	shl    rax,0x3
  8031e7:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  8031ed:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8031f0:	48 8b 50 50          	mov    rdx,QWORD PTR [rax+0x50]
  8031f4:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8031f8:	48 89 c7             	mov    rdi,rax
  8031fb:	ff d2                	call   rdx
  8031fd:	eb 6b                	jmp    80326a <sys_operate_dev+0x33c>
        case DRVF_MKDIR:return devs[i].drv->mkdir(args);
  8031ff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803202:	48 63 d0             	movsxd rdx,eax
  803205:	48 89 d0             	mov    rax,rdx
  803208:	48 c1 e0 02          	shl    rax,0x2
  80320c:	48 01 d0             	add    rax,rdx
  80320f:	48 c1 e0 02          	shl    rax,0x2
  803213:	48 01 d0             	add    rax,rdx
  803216:	48 c1 e0 03          	shl    rax,0x3
  80321a:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803220:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803223:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  803227:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80322b:	48 89 c7             	mov    rdi,rax
  80322e:	ff d2                	call   rdx
  803230:	eb 38                	jmp    80326a <sys_operate_dev+0x33c>
        case DRVF_LS:return    devs[i].drv->ls(args);
  803232:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803235:	48 63 d0             	movsxd rdx,eax
  803238:	48 89 d0             	mov    rax,rdx
  80323b:	48 c1 e0 02          	shl    rax,0x2
  80323f:	48 01 d0             	add    rax,rdx
  803242:	48 c1 e0 02          	shl    rax,0x2
  803246:	48 01 d0             	add    rax,rdx
  803249:	48 c1 e0 03          	shl    rax,0x3
  80324d:	48 05 f8 2e 40 00    	add    rax,0x402ef8
  803253:	48 8b 00             	mov    rax,QWORD PTR [rax]
  803256:	48 8b 50 60          	mov    rdx,QWORD PTR [rax+0x60]
  80325a:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80325e:	48 89 c7             	mov    rdi,rax
  803261:	ff d2                	call   rdx
  803263:	eb 05                	jmp    80326a <sys_operate_dev+0x33c>
    }
    return -1;
  803265:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  80326a:	c9                   	leave  
  80326b:	c3                   	ret    

000000000080326c <call_drv_func>:
int call_drv_func(int drv_n,int func_n,driver_args *args)
{
  80326c:	f3 0f 1e fa          	endbr64 
  803270:	55                   	push   rbp
  803271:	48 89 e5             	mov    rbp,rsp
  803274:	48 83 ec 10          	sub    rsp,0x10
  803278:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  80327b:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  80327e:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
    if(drvs[drv_n].flag==DRV_FLAG_EMPTY)return -1;
  803282:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803285:	48 63 d0             	movsxd rdx,eax
  803288:	48 89 d0             	mov    rax,rdx
  80328b:	48 c1 e0 02          	shl    rax,0x2
  80328f:	48 01 d0             	add    rax,rdx
  803292:	48 c1 e0 05          	shl    rax,0x5
  803296:	48 05 80 58 40 00    	add    rax,0x405880
  80329c:	8b 00                	mov    eax,DWORD PTR [rax]
  80329e:	85 c0                	test   eax,eax
  8032a0:	75 0a                	jne    8032ac <call_drv_func+0x40>
  8032a2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8032a7:	e9 15 02 00 00       	jmp    8034c1 <call_drv_func+0x255>
    /*driverfunc f=drvs[drv_n].func_thunk[func_n];
    return f(args);*/
    switch (func_n) {
  8032ac:	83 7d f8 0b          	cmp    DWORD PTR [rbp-0x8],0xb
  8032b0:	0f 87 06 02 00 00    	ja     8034bc <call_drv_func+0x250>
  8032b6:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8032b9:	48 8b 04 c5 48 2a 81 	mov    rax,QWORD PTR [rax*8+0x812a48]
  8032c0:	00 
  8032c1:	3e ff e0             	notrack jmp rax
        case DRVF_OPEN :return drvs[drv_n].open(args);
  8032c4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032c7:	48 63 d0             	movsxd rdx,eax
  8032ca:	48 89 d0             	mov    rax,rdx
  8032cd:	48 c1 e0 02          	shl    rax,0x2
  8032d1:	48 01 d0             	add    rax,rdx
  8032d4:	48 c1 e0 05          	shl    rax,0x5
  8032d8:	48 05 88 58 40 00    	add    rax,0x405888
  8032de:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8032e1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8032e5:	48 89 c7             	mov    rdi,rax
  8032e8:	ff d2                	call   rdx
  8032ea:	e9 d2 01 00 00       	jmp    8034c1 <call_drv_func+0x255>
        case DRVF_CLOSE:return drvs[drv_n].close(args);
  8032ef:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8032f2:	48 63 d0             	movsxd rdx,eax
  8032f5:	48 89 d0             	mov    rax,rdx
  8032f8:	48 c1 e0 02          	shl    rax,0x2
  8032fc:	48 01 d0             	add    rax,rdx
  8032ff:	48 c1 e0 05          	shl    rax,0x5
  803303:	48 05 90 58 40 00    	add    rax,0x405890
  803309:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80330c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803310:	48 89 c7             	mov    rdi,rax
  803313:	ff d2                	call   rdx
  803315:	e9 a7 01 00 00       	jmp    8034c1 <call_drv_func+0x255>
        case DRVF_READ :return drvs[drv_n].read(args);
  80331a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80331d:	48 63 d0             	movsxd rdx,eax
  803320:	48 89 d0             	mov    rax,rdx
  803323:	48 c1 e0 02          	shl    rax,0x2
  803327:	48 01 d0             	add    rax,rdx
  80332a:	48 c1 e0 05          	shl    rax,0x5
  80332e:	48 05 98 58 40 00    	add    rax,0x405898
  803334:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803337:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80333b:	48 89 c7             	mov    rdi,rax
  80333e:	ff d2                	call   rdx
  803340:	e9 7c 01 00 00       	jmp    8034c1 <call_drv_func+0x255>
        case DRVF_WRITE:return drvs[drv_n].write(args);
  803345:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803348:	48 63 d0             	movsxd rdx,eax
  80334b:	48 89 d0             	mov    rax,rdx
  80334e:	48 c1 e0 02          	shl    rax,0x2
  803352:	48 01 d0             	add    rax,rdx
  803355:	48 c1 e0 05          	shl    rax,0x5
  803359:	48 05 a0 58 40 00    	add    rax,0x4058a0
  80335f:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803362:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803366:	48 89 c7             	mov    rdi,rax
  803369:	ff d2                	call   rdx
  80336b:	e9 51 01 00 00       	jmp    8034c1 <call_drv_func+0x255>
        case DRVF_CHK  :return drvs[drv_n].check(args);
  803370:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803373:	48 63 d0             	movsxd rdx,eax
  803376:	48 89 d0             	mov    rax,rdx
  803379:	48 c1 e0 02          	shl    rax,0x2
  80337d:	48 01 d0             	add    rax,rdx
  803380:	48 c1 e0 05          	shl    rax,0x5
  803384:	48 05 a8 58 40 00    	add    rax,0x4058a8
  80338a:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80338d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803391:	48 89 c7             	mov    rdi,rax
  803394:	ff d2                	call   rdx
  803396:	e9 26 01 00 00       	jmp    8034c1 <call_drv_func+0x255>
        case DRVF_RSVD :return drvs[drv_n].reserved(args);
  80339b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80339e:	48 63 d0             	movsxd rdx,eax
  8033a1:	48 89 d0             	mov    rax,rdx
  8033a4:	48 c1 e0 02          	shl    rax,0x2
  8033a8:	48 01 d0             	add    rax,rdx
  8033ab:	48 c1 e0 05          	shl    rax,0x5
  8033af:	48 05 b0 58 40 00    	add    rax,0x4058b0
  8033b5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033b8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033bc:	48 89 c7             	mov    rdi,rax
  8033bf:	ff d2                	call   rdx
  8033c1:	e9 fb 00 00 00       	jmp    8034c1 <call_drv_func+0x255>
        case DRVF_INT  :return drvs[drv_n].inthandler(args);
  8033c6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033c9:	48 63 d0             	movsxd rdx,eax
  8033cc:	48 89 d0             	mov    rax,rdx
  8033cf:	48 c1 e0 02          	shl    rax,0x2
  8033d3:	48 01 d0             	add    rax,rdx
  8033d6:	48 c1 e0 05          	shl    rax,0x5
  8033da:	48 05 b8 58 40 00    	add    rax,0x4058b8
  8033e0:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8033e3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8033e7:	48 89 c7             	mov    rdi,rax
  8033ea:	ff d2                	call   rdx
  8033ec:	e9 d0 00 00 00       	jmp    8034c1 <call_drv_func+0x255>
        case DRVF_FIND :return drvs[drv_n].find(args);
  8033f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8033f4:	48 63 d0             	movsxd rdx,eax
  8033f7:	48 89 d0             	mov    rax,rdx
  8033fa:	48 c1 e0 02          	shl    rax,0x2
  8033fe:	48 01 d0             	add    rax,rdx
  803401:	48 c1 e0 05          	shl    rax,0x5
  803405:	48 05 c0 58 40 00    	add    rax,0x4058c0
  80340b:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80340e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803412:	48 89 c7             	mov    rdi,rax
  803415:	ff d2                	call   rdx
  803417:	e9 a5 00 00 00       	jmp    8034c1 <call_drv_func+0x255>
        case DRVF_RM   :return drvs[drv_n].rm(args);
  80341c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80341f:	48 63 d0             	movsxd rdx,eax
  803422:	48 89 d0             	mov    rax,rdx
  803425:	48 c1 e0 02          	shl    rax,0x2
  803429:	48 01 d0             	add    rax,rdx
  80342c:	48 c1 e0 05          	shl    rax,0x5
  803430:	48 05 c8 58 40 00    	add    rax,0x4058c8
  803436:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803439:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80343d:	48 89 c7             	mov    rdi,rax
  803440:	ff d2                	call   rdx
  803442:	eb 7d                	jmp    8034c1 <call_drv_func+0x255>
        case DRVF_TOUCH:return drvs[drv_n].touch(args);
  803444:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803447:	48 63 d0             	movsxd rdx,eax
  80344a:	48 89 d0             	mov    rax,rdx
  80344d:	48 c1 e0 02          	shl    rax,0x2
  803451:	48 01 d0             	add    rax,rdx
  803454:	48 c1 e0 05          	shl    rax,0x5
  803458:	48 05 d0 58 40 00    	add    rax,0x4058d0
  80345e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803461:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803465:	48 89 c7             	mov    rdi,rax
  803468:	ff d2                	call   rdx
  80346a:	eb 55                	jmp    8034c1 <call_drv_func+0x255>
        case DRVF_MKDIR:return drvs[drv_n].mkdir(args);
  80346c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80346f:	48 63 d0             	movsxd rdx,eax
  803472:	48 89 d0             	mov    rax,rdx
  803475:	48 c1 e0 02          	shl    rax,0x2
  803479:	48 01 d0             	add    rax,rdx
  80347c:	48 c1 e0 05          	shl    rax,0x5
  803480:	48 05 d8 58 40 00    	add    rax,0x4058d8
  803486:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  803489:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80348d:	48 89 c7             	mov    rdi,rax
  803490:	ff d2                	call   rdx
  803492:	eb 2d                	jmp    8034c1 <call_drv_func+0x255>
        case DRVF_LS:return drvs[drv_n].ls(args);
  803494:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803497:	48 63 d0             	movsxd rdx,eax
  80349a:	48 89 d0             	mov    rax,rdx
  80349d:	48 c1 e0 02          	shl    rax,0x2
  8034a1:	48 01 d0             	add    rax,rdx
  8034a4:	48 c1 e0 05          	shl    rax,0x5
  8034a8:	48 05 e0 58 40 00    	add    rax,0x4058e0
  8034ae:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8034b1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8034b5:	48 89 c7             	mov    rdi,rax
  8034b8:	ff d2                	call   rdx
  8034ba:	eb 05                	jmp    8034c1 <call_drv_func+0x255>
    }
    return -1;
  8034bc:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8034c1:	c9                   	leave  
  8034c2:	c3                   	ret    

00000000008034c3 <dispose_device>:
int dispose_device(int dev){
  8034c3:	f3 0f 1e fa          	endbr64 
  8034c7:	55                   	push   rbp
  8034c8:	48 89 e5             	mov    rbp,rsp
  8034cb:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    if(devs[dev].flag!=DEV_FLAG_USED)return -1;
  8034ce:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8034d1:	48 63 d0             	movsxd rdx,eax
  8034d4:	48 89 d0             	mov    rax,rdx
  8034d7:	48 c1 e0 02          	shl    rax,0x2
  8034db:	48 01 d0             	add    rax,rdx
  8034de:	48 c1 e0 02          	shl    rax,0x2
  8034e2:	48 01 d0             	add    rax,rdx
  8034e5:	48 c1 e0 03          	shl    rax,0x3
  8034e9:	48 05 90 2e 40 00    	add    rax,0x402e90
  8034ef:	8b 00                	mov    eax,DWORD PTR [rax]
  8034f1:	83 f8 01             	cmp    eax,0x1
  8034f4:	74 07                	je     8034fd <dispose_device+0x3a>
  8034f6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8034fb:	eb 62                	jmp    80355f <dispose_device+0x9c>
    device* p=&devs[dev];
  8034fd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  803500:	48 63 d0             	movsxd rdx,eax
  803503:	48 89 d0             	mov    rax,rdx
  803506:	48 c1 e0 02          	shl    rax,0x2
  80350a:	48 01 d0             	add    rax,rdx
  80350d:	48 c1 e0 02          	shl    rax,0x2
  803511:	48 01 d0             	add    rax,rdx
  803514:	48 c1 e0 03          	shl    rax,0x3
  803518:	48 05 80 2e 40 00    	add    rax,0x402e80
  80351e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    //从链表删除
    if(p->prev)p->prev->next=p->next;
  803522:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803526:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  80352d:	48 85 c0             	test   rax,rax
  803530:	74 1d                	je     80354f <dispose_device+0x8c>
  803532:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803536:	48 8b 80 98 00 00 00 	mov    rax,QWORD PTR [rax+0x98]
  80353d:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  803541:	48 8b 92 90 00 00 00 	mov    rdx,QWORD PTR [rdx+0x90]
  803548:	48 89 90 90 00 00 00 	mov    QWORD PTR [rax+0x90],rdx
    p->flag=DEV_FLAG_EMPTY;
  80354f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803553:	c7 40 10 00 00 00 00 	mov    DWORD PTR [rax+0x10],0x0
    return 0;
  80355a:	b8 00 00 00 00       	mov    eax,0x0
}
  80355f:	5d                   	pop    rbp
  803560:	c3                   	ret    

0000000000803561 <dispose_driver>:
int dispose_driver(driver *drv){
  803561:	f3 0f 1e fa          	endbr64 
  803565:	55                   	push   rbp
  803566:	48 89 e5             	mov    rbp,rsp
  803569:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  80356d:	90                   	nop
  80356e:	5d                   	pop    rbp
  80356f:	c3                   	ret    

0000000000803570 <get_dev>:

device *get_dev(int devi)
{
  803570:	f3 0f 1e fa          	endbr64 
  803574:	55                   	push   rbp
  803575:	48 89 e5             	mov    rbp,rsp
  803578:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &devs[devi];
  80357b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80357e:	48 63 d0             	movsxd rdx,eax
  803581:	48 89 d0             	mov    rax,rdx
  803584:	48 c1 e0 02          	shl    rax,0x2
  803588:	48 01 d0             	add    rax,rdx
  80358b:	48 c1 e0 02          	shl    rax,0x2
  80358f:	48 01 d0             	add    rax,rdx
  803592:	48 c1 e0 03          	shl    rax,0x3
  803596:	48 05 80 2e 40 00    	add    rax,0x402e80
}
  80359c:	5d                   	pop    rbp
  80359d:	c3                   	ret    

000000000080359e <get_drv>:
driver *get_drv(int drvi)
{
  80359e:	f3 0f 1e fa          	endbr64 
  8035a2:	55                   	push   rbp
  8035a3:	48 89 e5             	mov    rbp,rsp
  8035a6:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return &drvs[drvi];
  8035a9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8035ac:	48 63 d0             	movsxd rdx,eax
  8035af:	48 89 d0             	mov    rax,rdx
  8035b2:	48 c1 e0 02          	shl    rax,0x2
  8035b6:	48 01 d0             	add    rax,rdx
  8035b9:	48 c1 e0 05          	shl    rax,0x5
  8035bd:	48 05 80 58 40 00    	add    rax,0x405880
}
  8035c3:	5d                   	pop    rbp
  8035c4:	c3                   	ret    

00000000008035c5 <make_request>:

//发送一个操作设备的申请
int make_request(driver_args* args)
{
  8035c5:	f3 0f 1e fa          	endbr64 
  8035c9:	55                   	push   rbp
  8035ca:	48 89 e5             	mov    rbp,rsp
  8035cd:	53                   	push   rbx
  8035ce:	48 89 7d d0          	mov    QWORD PTR [rbp-0x30],rdi
    //在数组中寻找空项
    int i=0;
  8035d2:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
    for(;i<NR_REQS;i++)
  8035d9:	eb 23                	jmp    8035fe <make_request+0x39>
    {
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  8035db:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8035de:	48 63 d0             	movsxd rdx,eax
  8035e1:	48 89 d0             	mov    rax,rdx
  8035e4:	48 01 c0             	add    rax,rax
  8035e7:	48 01 d0             	add    rax,rdx
  8035ea:	48 c1 e0 06          	shl    rax,0x6
  8035ee:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  8035f4:	8b 00                	mov    eax,DWORD PTR [rax]
  8035f6:	85 c0                	test   eax,eax
  8035f8:	74 0c                	je     803606 <make_request+0x41>
    for(;i<NR_REQS;i++)
  8035fa:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8035fe:	83 7d f4 1f          	cmp    DWORD PTR [rbp-0xc],0x1f
  803602:	7e d7                	jle    8035db <make_request+0x16>
  803604:	eb 01                	jmp    803607 <make_request+0x42>
        if(reqs[i].stat==REQ_STAT_EMPTY)break;
  803606:	90                   	nop
    }
    if(i==NR_REQS)return -1;//满了
  803607:	83 7d f4 20          	cmp    DWORD PTR [rbp-0xc],0x20
  80360b:	75 0a                	jne    803617 <make_request+0x52>
  80360d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803612:	e9 e7 01 00 00       	jmp    8037fe <make_request+0x239>
    reqs[i]=*args;//放入数组
  803617:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80361a:	48 63 d0             	movsxd rdx,eax
  80361d:	48 89 d0             	mov    rax,rdx
  803620:	48 01 c0             	add    rax,rax
  803623:	48 01 d0             	add    rax,rdx
  803626:	48 c1 e0 06          	shl    rax,0x6
  80362a:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803631:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803635:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  803638:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
  80363c:	48 89 0a             	mov    QWORD PTR [rdx],rcx
  80363f:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
  803643:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  803647:	48 8b 58 18          	mov    rbx,QWORD PTR [rax+0x18]
  80364b:	48 89 4a 10          	mov    QWORD PTR [rdx+0x10],rcx
  80364f:	48 89 5a 18          	mov    QWORD PTR [rdx+0x18],rbx
  803653:	48 8b 48 20          	mov    rcx,QWORD PTR [rax+0x20]
  803657:	48 8b 58 28          	mov    rbx,QWORD PTR [rax+0x28]
  80365b:	48 89 4a 20          	mov    QWORD PTR [rdx+0x20],rcx
  80365f:	48 89 5a 28          	mov    QWORD PTR [rdx+0x28],rbx
  803663:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  803667:	48 8b 58 38          	mov    rbx,QWORD PTR [rax+0x38]
  80366b:	48 89 4a 30          	mov    QWORD PTR [rdx+0x30],rcx
  80366f:	48 89 5a 38          	mov    QWORD PTR [rdx+0x38],rbx
  803673:	48 8b 48 40          	mov    rcx,QWORD PTR [rax+0x40]
  803677:	48 8b 58 48          	mov    rbx,QWORD PTR [rax+0x48]
  80367b:	48 89 4a 40          	mov    QWORD PTR [rdx+0x40],rcx
  80367f:	48 89 5a 48          	mov    QWORD PTR [rdx+0x48],rbx
  803683:	48 8b 48 50          	mov    rcx,QWORD PTR [rax+0x50]
  803687:	48 8b 58 58          	mov    rbx,QWORD PTR [rax+0x58]
  80368b:	48 89 4a 50          	mov    QWORD PTR [rdx+0x50],rcx
  80368f:	48 89 5a 58          	mov    QWORD PTR [rdx+0x58],rbx
  803693:	48 8b 48 60          	mov    rcx,QWORD PTR [rax+0x60]
  803697:	48 8b 58 68          	mov    rbx,QWORD PTR [rax+0x68]
  80369b:	48 89 4a 60          	mov    QWORD PTR [rdx+0x60],rcx
  80369f:	48 89 5a 68          	mov    QWORD PTR [rdx+0x68],rbx
  8036a3:	48 8b 48 70          	mov    rcx,QWORD PTR [rax+0x70]
  8036a7:	48 8b 58 78          	mov    rbx,QWORD PTR [rax+0x78]
  8036ab:	48 89 4a 70          	mov    QWORD PTR [rdx+0x70],rcx
  8036af:	48 89 5a 78          	mov    QWORD PTR [rdx+0x78],rbx
  8036b3:	48 8b 88 80 00 00 00 	mov    rcx,QWORD PTR [rax+0x80]
  8036ba:	48 8b 98 88 00 00 00 	mov    rbx,QWORD PTR [rax+0x88]
  8036c1:	48 89 8a 80 00 00 00 	mov    QWORD PTR [rdx+0x80],rcx
  8036c8:	48 89 9a 88 00 00 00 	mov    QWORD PTR [rdx+0x88],rbx
  8036cf:	48 8b 88 90 00 00 00 	mov    rcx,QWORD PTR [rax+0x90]
  8036d6:	48 8b 98 98 00 00 00 	mov    rbx,QWORD PTR [rax+0x98]
  8036dd:	48 89 8a 90 00 00 00 	mov    QWORD PTR [rdx+0x90],rcx
  8036e4:	48 89 9a 98 00 00 00 	mov    QWORD PTR [rdx+0x98],rbx
  8036eb:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
  8036f2:	48 8b 98 a8 00 00 00 	mov    rbx,QWORD PTR [rax+0xa8]
  8036f9:	48 89 8a a0 00 00 00 	mov    QWORD PTR [rdx+0xa0],rcx
  803700:	48 89 9a a8 00 00 00 	mov    QWORD PTR [rdx+0xa8],rbx
  803707:	48 8b 88 b0 00 00 00 	mov    rcx,QWORD PTR [rax+0xb0]
  80370e:	48 8b 98 b8 00 00 00 	mov    rbx,QWORD PTR [rax+0xb8]
  803715:	48 89 8a b0 00 00 00 	mov    QWORD PTR [rdx+0xb0],rcx
  80371c:	48 89 9a b8 00 00 00 	mov    QWORD PTR [rdx+0xb8],rbx
    //插入具体设备的等待链表中
    device* dev=&devs[args->dev];
  803723:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  803727:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  80372d:	48 63 d0             	movsxd rdx,eax
  803730:	48 89 d0             	mov    rax,rdx
  803733:	48 c1 e0 02          	shl    rax,0x2
  803737:	48 01 d0             	add    rax,rdx
  80373a:	48 c1 e0 02          	shl    rax,0x2
  80373e:	48 01 d0             	add    rax,rdx
  803741:	48 c1 e0 03          	shl    rax,0x3
  803745:	48 05 80 2e 40 00    	add    rax,0x402e80
  80374b:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    if(!dev->waiting_reqs)//空的等待队列
  80374f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  803753:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  80375a:	48 85 c0             	test   rax,rax
  80375d:	75 27                	jne    803786 <make_request+0x1c1>
        dev->waiting_reqs=&reqs[i];
  80375f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  803762:	48 63 d0             	movsxd rdx,eax
  803765:	48 89 d0             	mov    rax,rdx
  803768:	48 01 c0             	add    rax,rax
  80376b:	48 01 d0             	add    rax,rdx
  80376e:	48 c1 e0 06          	shl    rax,0x6
  803772:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  803779:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80377d:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
  803784:	eb 75                	jmp    8037fb <make_request+0x236>
    else{
        driver_args* p=dev->waiting_reqs;
  803786:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80378a:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803791:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
        for(;p->next;p=p->next);
  803795:	eb 0f                	jmp    8037a6 <make_request+0x1e1>
  803797:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80379b:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  8037a2:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  8037a6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8037aa:	48 8b 80 b8 00 00 00 	mov    rax,QWORD PTR [rax+0xb8]
  8037b1:	48 85 c0             	test   rax,rax
  8037b4:	75 e1                	jne    803797 <make_request+0x1d2>
        p->next=&reqs[i];
  8037b6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8037b9:	48 63 d0             	movsxd rdx,eax
  8037bc:	48 89 d0             	mov    rax,rdx
  8037bf:	48 01 c0             	add    rax,rax
  8037c2:	48 01 d0             	add    rax,rdx
  8037c5:	48 c1 e0 06          	shl    rax,0x6
  8037c9:	48 8d 90 80 6c 40 00 	lea    rdx,[rax+0x406c80]
  8037d0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8037d4:	48 89 90 b8 00 00 00 	mov    QWORD PTR [rax+0xb8],rdx
        reqs[i].next=NULL;
  8037db:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8037de:	48 63 d0             	movsxd rdx,eax
  8037e1:	48 89 d0             	mov    rax,rdx
  8037e4:	48 01 c0             	add    rax,rax
  8037e7:	48 01 d0             	add    rax,rdx
  8037ea:	48 c1 e0 06          	shl    rax,0x6
  8037ee:	48 05 38 6d 40 00    	add    rax,0x406d38
  8037f4:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
    }

    return i;
  8037fb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
}
  8037fe:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  803802:	c9                   	leave  
  803803:	c3                   	ret    

0000000000803804 <do_req>:
//取出一个申请并且执行
int do_req()
{
  803804:	f3 0f 1e fa          	endbr64 
  803808:	55                   	push   rbp
  803809:	48 89 e5             	mov    rbp,rsp
  80380c:	48 83 ec 10          	sub    rsp,0x10
    //查看每个设备的请求情况
    //块设备
    for(int i=0;i<3;i++)
  803810:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803817:	e9 ab 00 00 00       	jmp    8038c7 <do_req+0xc3>
    {
        device* p=dev_tree[i];
  80381c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80381f:	48 98                	cdqe   
  803821:	48 8b 04 c5 80 84 40 	mov    rax,QWORD PTR [rax*8+0x408480]
  803828:	00 
  803829:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(;p;p=p->next)
  80382d:	e9 86 00 00 00       	jmp    8038b8 <do_req+0xb4>
        {
            //如果没有请求运行而且有请求要运行
            if(!p->running_req&&p->waiting_reqs)
  803832:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803836:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  80383d:	48 85 c0             	test   rax,rax
  803840:	75 67                	jne    8038a9 <do_req+0xa5>
  803842:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803846:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  80384d:	48 85 c0             	test   rax,rax
  803850:	74 57                	je     8038a9 <do_req+0xa5>
            {
                p->running_req=p->waiting_reqs;
  803852:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803856:	48 8b 90 88 00 00 00 	mov    rdx,QWORD PTR [rax+0x88]
  80385d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803861:	48 89 90 80 00 00 00 	mov    QWORD PTR [rax+0x80],rdx
                p->waiting_reqs=p->waiting_reqs->next;//取出一个
  803868:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80386c:	48 8b 80 88 00 00 00 	mov    rax,QWORD PTR [rax+0x88]
  803873:	48 8b 90 b8 00 00 00 	mov    rdx,QWORD PTR [rax+0xb8]
  80387a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80387e:	48 89 90 88 00 00 00 	mov    QWORD PTR [rax+0x88],rdx
                dev_funcs[p->operi](p->running_req);
  803885:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803889:	8b 80 a0 00 00 00    	mov    eax,DWORD PTR [rax+0xa0]
  80388f:	48 98                	cdqe   
  803891:	48 8b 14 c5 a0 ae 80 	mov    rdx,QWORD PTR [rax*8+0x80aea0]
  803898:	00 
  803899:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80389d:	48 8b 80 80 00 00 00 	mov    rax,QWORD PTR [rax+0x80]
  8038a4:	48 89 c7             	mov    rdi,rax
  8038a7:	ff d2                	call   rdx
        for(;p;p=p->next)
  8038a9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8038ad:	48 8b 80 90 00 00 00 	mov    rax,QWORD PTR [rax+0x90]
  8038b4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  8038b8:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
  8038bd:	0f 85 6f ff ff ff    	jne    803832 <do_req+0x2e>
    for(int i=0;i<3;i++)
  8038c3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8038c7:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  8038cb:	0f 8e 4b ff ff ff    	jle    80381c <do_req+0x18>
            }
            //如果还在运行（DONE的状态不能直接覆盖，因为里面的运行结果可能还没被拿走）
        }
    }
    
    return 0;
  8038d1:	b8 00 00 00 00       	mov    eax,0x0
}
  8038d6:	c9                   	leave  
  8038d7:	c3                   	ret    

00000000008038d8 <wait_on_req>:


void wait_on_req(int reqi)
{
  8038d8:	f3 0f 1e fa          	endbr64 
  8038dc:	55                   	push   rbp
  8038dd:	48 89 e5             	mov    rbp,rsp
  8038e0:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(reqs[reqi].stat!=REQ_STAT_DONE);
  8038e3:	90                   	nop
  8038e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8038e7:	48 63 d0             	movsxd rdx,eax
  8038ea:	48 89 d0             	mov    rax,rdx
  8038ed:	48 01 c0             	add    rax,rax
  8038f0:	48 01 d0             	add    rax,rdx
  8038f3:	48 c1 e0 06          	shl    rax,0x6
  8038f7:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  8038fd:	8b 00                	mov    eax,DWORD PTR [rax]
  8038ff:	83 f8 03             	cmp    eax,0x3
  803902:	75 e0                	jne    8038e4 <wait_on_req+0xc>
}
  803904:	90                   	nop
  803905:	90                   	nop
  803906:	5d                   	pop    rbp
  803907:	c3                   	ret    

0000000000803908 <clear_req>:
void clear_req(int reqi)
{
  803908:	f3 0f 1e fa          	endbr64 
  80390c:	55                   	push   rbp
  80390d:	48 89 e5             	mov    rbp,rsp
  803910:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    reqs[reqi].stat=REQ_STAT_EMPTY;
  803913:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803916:	48 63 d0             	movsxd rdx,eax
  803919:	48 89 d0             	mov    rax,rdx
  80391c:	48 01 c0             	add    rax,rax
  80391f:	48 01 d0             	add    rax,rdx
  803922:	48 c1 e0 06          	shl    rax,0x6
  803926:	48 05 2c 6d 40 00    	add    rax,0x406d2c
  80392c:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
  803932:	90                   	nop
  803933:	5d                   	pop    rbp
  803934:	c3                   	ret    

0000000000803935 <init_proc>:
TSS scene_saver;
TSS *tss=0x108000;
int cur_proc=0;
int pidd=0;
int palloc_paddr=0;
void init_proc(){
  803935:	f3 0f 1e fa          	endbr64 
  803939:	55                   	push   rbp
  80393a:	48 89 e5             	mov    rbp,rsp
  80393d:	48 83 ec 10          	sub    rsp,0x10
    //task=(struct process*)get_global_var(TASK_PCBS_ADDR);//[MAX_TASKS];;
    for(int i=0;i<MAX_PROC_COUNT;i++){
  803941:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  803948:	eb 61                	jmp    8039ab <init_proc+0x76>
        task[i].pid=-1;
  80394a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80394d:	48 63 d0             	movsxd rdx,eax
  803950:	48 89 d0             	mov    rax,rdx
  803953:	48 01 c0             	add    rax,rax
  803956:	48 01 d0             	add    rax,rdx
  803959:	48 c1 e0 08          	shl    rax,0x8
  80395d:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803963:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
        task[i].stat=ENDED;
  803969:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80396c:	48 63 d0             	movsxd rdx,eax
  80396f:	48 89 d0             	mov    rax,rdx
  803972:	48 01 c0             	add    rax,rax
  803975:	48 01 d0             	add    rax,rdx
  803978:	48 c1 e0 08          	shl    rax,0x8
  80397c:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803982:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
        task[i].parent_pid=-1;
  803988:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80398b:	48 63 d0             	movsxd rdx,eax
  80398e:	48 89 d0             	mov    rax,rdx
  803991:	48 01 c0             	add    rax,rax
  803994:	48 01 d0             	add    rax,rdx
  803997:	48 c1 e0 08          	shl    rax,0x8
  80399b:	48 05 28 85 40 00    	add    rax,0x408528
  8039a1:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    for(int i=0;i<MAX_PROC_COUNT;i++){
  8039a7:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8039ab:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  8039af:	7e 99                	jle    80394a <init_proc+0x15>
    }
    cur_proc=0;//no proc
  8039b1:	c7 05 51 0b c1 ff 00 	mov    DWORD PTR [rip+0xffffffffffc10b51],0x0        # 41450c <cur_proc>
  8039b8:	00 00 00 
    pidd=1;
  8039bb:	c7 05 4b 0b c1 ff 01 	mov    DWORD PTR [rip+0xffffffffffc10b4b],0x1        # 414510 <pidd>
  8039c2:	00 00 00 
     //创建0号进程
    int zi=create_proc();
  8039c5:	b8 00 00 00 00       	mov    eax,0x0
  8039ca:	e8 40 02 00 00       	call   803c0f <create_proc>
  8039cf:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    task[zi].stat=READY;
  8039d2:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8039d5:	48 63 d0             	movsxd rdx,eax
  8039d8:	48 89 d0             	mov    rax,rdx
  8039db:	48 01 c0             	add    rax,rax
  8039de:	48 01 d0             	add    rax,rdx
  8039e1:	48 c1 e0 08          	shl    rax,0x8
  8039e5:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8039eb:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int xi= _LDT_IND(zi)*8;
  8039f1:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8039f4:	83 c0 03             	add    eax,0x3
  8039f7:	c1 e0 04             	shl    eax,0x4
  8039fa:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    zi=_TSS_IND(zi)*8;
  8039fd:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803a00:	01 c0                	add    eax,eax
  803a02:	83 c0 05             	add    eax,0x5
  803a05:	c1 e0 03             	shl    eax,0x3
  803a08:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    //asm volatile("lldt %0"::"m"(xi));
    //asm volatile("ltr %0"::"m"(zi));
    //把内核代码段选择子写到MSR寄存器中准备用于特权级转换(sysexit，现在没用)
    wrmsr(0x174,0x8);
  803a0b:	be 08 00 00 00       	mov    esi,0x8
  803a10:	bf 74 01 00 00       	mov    edi,0x174
  803a15:	e8 97 cd ff ff       	call   8007b1 <wrmsr>
    //准备用于特权级转换(sysret，正在使用)
    wrmsr(0xc0000081,0x0020000000000000ul);
  803a1a:	48 b8 00 00 00 00 00 	movabs rax,0x20000000000000
  803a21:	00 20 00 
  803a24:	48 89 c6             	mov    rsi,rax
  803a27:	b8 81 00 00 c0       	mov    eax,0xc0000081
  803a2c:	48 89 c7             	mov    rdi,rax
  803a2f:	e8 7d cd ff ff       	call   8007b1 <wrmsr>
    //创建一个测试进程
//    create_test_proc();
}
  803a34:	90                   	nop
  803a35:	c9                   	leave  
  803a36:	c3                   	ret    

0000000000803a37 <create_test_proc>:
void create_test_proc(){
  803a37:	f3 0f 1e fa          	endbr64 
  803a3b:	55                   	push   rbp
  803a3c:	48 89 e5             	mov    rbp,rsp
  803a3f:	48 83 ec 20          	sub    rsp,0x20

    int index=req_proc();
  803a43:	b8 00 00 00 00       	mov    eax,0x0
  803a48:	e8 45 02 00 00       	call   803c92 <req_proc>
  803a4d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    task[index].stat=READY;
  803a50:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a53:	48 63 d0             	movsxd rdx,eax
  803a56:	48 89 d0             	mov    rax,rdx
  803a59:	48 01 c0             	add    rax,rax
  803a5c:	48 01 d0             	add    rax,rdx
  803a5f:	48 c1 e0 08          	shl    rax,0x8
  803a63:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803a69:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    int currsp=0x9fc00-1;
  803a6f:	c7 45 ec ff fb 09 00 	mov    DWORD PTR [rbp-0x14],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803a76:	48 89 65 ec          	mov    QWORD PTR [rbp-0x14],rsp
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803a7a:	ba 32 ae 80 00       	mov    edx,0x80ae32
  803a7f:	48 83 ec 08          	sub    rsp,0x8
  803a83:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803a86:	50                   	push   rax
  803a87:	6a 00                	push   0x0
  803a89:	52                   	push   rdx
  803a8a:	6a 00                	push   0x0
  803a8c:	6a 00                	push   0x0
  803a8e:	6a 00                	push   0x0
  803a90:	68 58 7d 00 00       	push   0x7d58
  803a95:	6a 10                	push   0x10
  803a97:	6a 10                	push   0x10
  803a99:	6a 10                	push   0x10
  803a9b:	6a 10                	push   0x10
  803a9d:	41 b9 08 00 00 00    	mov    r9d,0x8
  803aa3:	41 b8 10 00 00 00    	mov    r8d,0x10
  803aa9:	b9 00 00 00 00       	mov    ecx,0x0
  803aae:	ba 00 00 00 00       	mov    edx,0x0
  803ab3:	be 00 00 00 00       	mov    esi,0x0
  803ab8:	bf 00 00 00 00       	mov    edi,0x0
  803abd:	e8 c9 02 00 00       	call   803d8b <set_proc>
  803ac2:	48 83 c4 60          	add    rsp,0x60
             0x7e00- sizeof(stack_store_regs), 0, 0, 0, (long)ret_sys_call, 0, index);
    task[index].tss.rsp0=0x400000;
  803ac6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803ac9:	48 63 d0             	movsxd rdx,eax
  803acc:	48 89 d0             	mov    rax,rdx
  803acf:	48 01 c0             	add    rax,rax
  803ad2:	48 01 d0             	add    rax,rdx
  803ad5:	48 c1 e0 08          	shl    rax,0x8
  803ad9:	48 05 68 86 40 00    	add    rax,0x408668
  803adf:	48 c7 00 00 00 40 00 	mov    QWORD PTR [rax],0x400000
    //把还原现场时用到的堆栈设置好
    stack_store_regs *str= (stack_store_regs *) (0x7e00 - sizeof(stack_store_regs));
  803ae6:	48 c7 45 f0 58 7d 00 	mov    QWORD PTR [rbp-0x10],0x7d58
  803aed:	00 
    str->rax=0;
  803aee:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803af2:	48 c7 40 78 00 00 00 	mov    QWORD PTR [rax+0x78],0x0
  803af9:	00 
    str->rbx=0;
  803afa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803afe:	48 c7 40 70 00 00 00 	mov    QWORD PTR [rax+0x70],0x0
  803b05:	00 
    str->rcx=0;
  803b06:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b0a:	48 c7 40 68 00 00 00 	mov    QWORD PTR [rax+0x68],0x0
  803b11:	00 
    str->rdx=0x1400000;//sysret采用的返回地址
  803b12:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b16:	48 c7 40 60 00 00 40 	mov    QWORD PTR [rax+0x60],0x1400000
  803b1d:	01 
    str->rsi=0;
  803b1e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b22:	48 c7 40 50 00 00 00 	mov    QWORD PTR [rax+0x50],0x0
  803b29:	00 
    str->rdi=0;
  803b2a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b2e:	48 c7 40 58 00 00 00 	mov    QWORD PTR [rax+0x58],0x0
  803b35:	00 
    str->r15=0;
  803b36:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b3a:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  803b41:	00 
    str->r14=0;
  803b42:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b46:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  803b4d:	00 
    str->r13=0;
  803b4e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b52:	48 c7 40 20 00 00 00 	mov    QWORD PTR [rax+0x20],0x0
  803b59:	00 
    str->r12=0;
  803b5a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b5e:	48 c7 40 28 00 00 00 	mov    QWORD PTR [rax+0x28],0x0
  803b65:	00 
    str->r11=0;
  803b66:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b6a:	48 c7 40 30 00 00 00 	mov    QWORD PTR [rax+0x30],0x0
  803b71:	00 
    str->r10=0;
  803b72:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b76:	48 c7 40 38 00 00 00 	mov    QWORD PTR [rax+0x38],0x0
  803b7d:	00 
    str->r9=0;
  803b7e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b82:	48 c7 40 40 00 00 00 	mov    QWORD PTR [rax+0x40],0x0
  803b89:	00 
    str->r8=0;
  803b8a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b8e:	48 c7 40 48 00 00 00 	mov    QWORD PTR [rax+0x48],0x0
  803b95:	00 
    str->rip=0x1400000;
  803b96:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803b9a:	48 c7 80 80 00 00 00 	mov    QWORD PTR [rax+0x80],0x1400000
  803ba1:	00 00 40 01 
    str->cs=0x8;
  803ba5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803ba9:	48 c7 80 88 00 00 00 	mov    QWORD PTR [rax+0x88],0x8
  803bb0:	08 00 00 00 
    str->rflags=0x00200006;
  803bb4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bb8:	48 c7 80 90 00 00 00 	mov    QWORD PTR [rax+0x90],0x200006
  803bbf:	06 00 20 00 
    str->rsp=0x7e00;
  803bc3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bc7:	48 c7 80 98 00 00 00 	mov    QWORD PTR [rax+0x98],0x7e00
  803bce:	00 7e 00 00 
    str->ss=0x2b;
  803bd2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bd6:	48 c7 80 a0 00 00 00 	mov    QWORD PTR [rax+0xa0],0x2b
  803bdd:	2b 00 00 00 
    str->ds=0x2b;
  803be1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803be5:	48 c7 00 2b 00 00 00 	mov    QWORD PTR [rax],0x2b
    str->es=0x2b;
  803bec:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  803bf0:	48 c7 40 08 2b 00 00 	mov    QWORD PTR [rax+0x8],0x2b
  803bf7:	00 
    memcpy(0x1400000,proc_zero,1024);
  803bf8:	ba 00 04 00 00       	mov    edx,0x400
  803bfd:	be f7 3e 80 00       	mov    esi,0x803ef7
  803c02:	bf 00 00 40 01       	mov    edi,0x1400000
  803c07:	e8 ab 68 00 00       	call   80a4b7 <memcpy>

}
  803c0c:	90                   	nop
  803c0d:	c9                   	leave  
  803c0e:	c3                   	ret    

0000000000803c0f <create_proc>:
int create_proc()
{
  803c0f:	f3 0f 1e fa          	endbr64 
  803c13:	55                   	push   rbp
  803c14:	48 89 e5             	mov    rbp,rsp
  803c17:	48 83 ec 10          	sub    rsp,0x10
    int index=req_proc();
  803c1b:	b8 00 00 00 00       	mov    eax,0x0
  803c20:	e8 6d 00 00 00       	call   803c92 <req_proc>
  803c25:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(index==-1)return -1;
  803c28:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  803c2c:	75 07                	jne    803c35 <create_proc+0x26>
  803c2e:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803c33:	eb 5b                	jmp    803c90 <create_proc+0x81>
    int currsp=0x9fc00-1;
  803c35:	c7 45 f8 ff fb 09 00 	mov    DWORD PTR [rbp-0x8],0x9fbff
    asm volatile("mov %%rsp,%0":"=m"(currsp));
  803c3c:	48 89 65 f8          	mov    QWORD PTR [rbp-0x8],rsp
    //默认DPL=3
    //set_proc(0,0,0,0,0x23,0x1b,0x23,0x23,0x23,0x23,curesp,0,0,0,0,index);
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10, 0x10, 0x10,
  803c40:	b9 f7 3e 80 00       	mov    ecx,0x803ef7
  803c45:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  803c48:	48 98                	cdqe   
  803c4a:	48 83 ec 08          	sub    rsp,0x8
  803c4e:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  803c51:	52                   	push   rdx
  803c52:	6a 00                	push   0x0
  803c54:	51                   	push   rcx
  803c55:	6a 00                	push   0x0
  803c57:	6a 00                	push   0x0
  803c59:	6a 00                	push   0x0
  803c5b:	50                   	push   rax
  803c5c:	6a 10                	push   0x10
  803c5e:	6a 10                	push   0x10
  803c60:	6a 10                	push   0x10
  803c62:	6a 10                	push   0x10
  803c64:	41 b9 08 00 00 00    	mov    r9d,0x8
  803c6a:	41 b8 10 00 00 00    	mov    r8d,0x10
  803c70:	b9 00 00 00 00       	mov    ecx,0x0
  803c75:	ba 00 00 00 00       	mov    edx,0x0
  803c7a:	be 00 00 00 00       	mov    esi,0x0
  803c7f:	bf 00 00 00 00       	mov    edi,0x0
  803c84:	e8 02 01 00 00       	call   803d8b <set_proc>
  803c89:	48 83 c4 60          	add    rsp,0x60
             currsp, 0, 0, 0, (long)proc_zero, 0, index);
//    task[index].tss.eip=(long)proc_zero;

    return index;
  803c8d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803c90:	c9                   	leave  
  803c91:	c3                   	ret    

0000000000803c92 <req_proc>:
int req_proc(){
  803c92:	f3 0f 1e fa          	endbr64 
  803c96:	55                   	push   rbp
  803c97:	48 89 e5             	mov    rbp,rsp
    int num=0;
  803c9a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803ca1:	eb 04                	jmp    803ca7 <req_proc+0x15>
    num<=MAX_PROC_COUNT){
        num++;
  803ca3:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
    while(task[num].pid!=-1&&task[num].stat!=ENDED&&\
  803ca7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803caa:	48 63 d0             	movsxd rdx,eax
  803cad:	48 89 d0             	mov    rax,rdx
  803cb0:	48 01 c0             	add    rax,rax
  803cb3:	48 01 d0             	add    rax,rdx
  803cb6:	48 c1 e0 08          	shl    rax,0x8
  803cba:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803cc0:	8b 00                	mov    eax,DWORD PTR [rax]
  803cc2:	83 f8 ff             	cmp    eax,0xffffffff
  803cc5:	74 26                	je     803ced <req_proc+0x5b>
  803cc7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803cca:	48 63 d0             	movsxd rdx,eax
  803ccd:	48 89 d0             	mov    rax,rdx
  803cd0:	48 01 c0             	add    rax,rax
  803cd3:	48 01 d0             	add    rax,rdx
  803cd6:	48 c1 e0 08          	shl    rax,0x8
  803cda:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803ce0:	8b 00                	mov    eax,DWORD PTR [rax]
  803ce2:	83 f8 03             	cmp    eax,0x3
  803ce5:	74 06                	je     803ced <req_proc+0x5b>
  803ce7:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  803ceb:	7e b6                	jle    803ca3 <req_proc+0x11>
    }
    if(num>=MAX_PROC_COUNT)
  803ced:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  803cf1:	7e 0a                	jle    803cfd <req_proc+0x6b>
        return -1;
  803cf3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  803cf8:	e9 8c 00 00 00       	jmp    803d89 <req_proc+0xf7>
    task[num].pid=pidd++;
  803cfd:	8b 05 0d 08 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1080d]        # 414510 <pidd>
  803d03:	8d 50 01             	lea    edx,[rax+0x1]
  803d06:	89 15 04 08 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10804],edx        # 414510 <pidd>
  803d0c:	89 c1                	mov    ecx,eax
  803d0e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d11:	48 63 d0             	movsxd rdx,eax
  803d14:	48 89 d0             	mov    rax,rdx
  803d17:	48 01 c0             	add    rax,rax
  803d1a:	48 01 d0             	add    rax,rdx
  803d1d:	48 c1 e0 08          	shl    rax,0x8
  803d21:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803d27:	89 08                	mov    DWORD PTR [rax],ecx
    task[num].stat=ENDED;
  803d29:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d2c:	48 63 d0             	movsxd rdx,eax
  803d2f:	48 89 d0             	mov    rax,rdx
  803d32:	48 01 c0             	add    rax,rax
  803d35:	48 01 d0             	add    rax,rdx
  803d38:	48 c1 e0 08          	shl    rax,0x8
  803d3c:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803d42:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[num].utime=0;
  803d48:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d4b:	48 63 d0             	movsxd rdx,eax
  803d4e:	48 89 d0             	mov    rax,rdx
  803d51:	48 01 c0             	add    rax,rax
  803d54:	48 01 d0             	add    rax,rdx
  803d57:	48 c1 e0 08          	shl    rax,0x8
  803d5b:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803d61:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    task[num].priority=0;
  803d67:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  803d6a:	48 63 d0             	movsxd rdx,eax
  803d6d:	48 89 d0             	mov    rax,rdx
  803d70:	48 01 c0             	add    rax,rax
  803d73:	48 01 d0             	add    rax,rdx
  803d76:	48 c1 e0 08          	shl    rax,0x8
  803d7a:	48 05 ac 84 40 00    	add    rax,0x4084ac
  803d80:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return num;
  803d86:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  803d89:	5d                   	pop    rbp
  803d8a:	c3                   	ret    

0000000000803d8b <set_proc>:
void set_proc(long eax, long ebx, long ecx, long edx, long es, long cs, long ss, long ds, long fs, long gs, long esp,
              long ebp, long esi, long edi, long rip, long eflags, int proc_nr) {
  803d8b:	f3 0f 1e fa          	endbr64 
  803d8f:	55                   	push   rbp
  803d90:	48 89 e5             	mov    rbp,rsp
  803d93:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  803d97:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  803d9b:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  803d9f:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
  803da3:	4c 89 45 c8          	mov    QWORD PTR [rbp-0x38],r8
  803da7:	4c 89 4d c0          	mov    QWORD PTR [rbp-0x40],r9
    struct process* proc=&task[proc_nr];
  803dab:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
  803dae:	48 63 d0             	movsxd rdx,eax
  803db1:	48 89 d0             	mov    rax,rdx
  803db4:	48 01 c0             	add    rax,rax
  803db7:	48 01 d0             	add    rax,rdx
  803dba:	48 c1 e0 08          	shl    rax,0x8
  803dbe:	48 05 a0 84 40 00    	add    rax,0x4084a0
  803dc4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    proc->regs.rax=eax;
  803dc8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803dcc:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  803dd0:	48 89 90 48 02 00 00 	mov    QWORD PTR [rax+0x248],rdx
    proc->regs.rbx=ebx;
  803dd7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ddb:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  803ddf:	48 89 90 60 02 00 00 	mov    QWORD PTR [rax+0x260],rdx
    proc->regs.rcx=ecx;
  803de6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803dea:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  803dee:	48 89 90 50 02 00 00 	mov    QWORD PTR [rax+0x250],rdx
    proc->regs.rdx=edx;
  803df5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803df9:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  803dfd:	48 89 90 58 02 00 00 	mov    QWORD PTR [rax+0x258],rdx
    proc->regs.es=es;
  803e04:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e08:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803e0c:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cs=cs;
  803e13:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e17:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803e1b:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ss=ss;
  803e22:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e26:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  803e2a:	48 89 90 98 02 00 00 	mov    QWORD PTR [rax+0x298],rdx
    proc->regs.ds=ds;
  803e31:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e35:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803e39:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.fs=fs;
  803e40:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e44:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  803e48:	48 89 90 a8 02 00 00 	mov    QWORD PTR [rax+0x2a8],rdx
    proc->regs.gs=gs;
  803e4f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e53:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  803e57:	48 89 90 b0 02 00 00 	mov    QWORD PTR [rax+0x2b0],rdx
    proc->regs.rsp=esp;
  803e5e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e62:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
  803e66:	48 89 90 68 02 00 00 	mov    QWORD PTR [rax+0x268],rdx
    proc->regs.rbp=ebp;
  803e6d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e71:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
  803e75:	48 89 90 70 02 00 00 	mov    QWORD PTR [rax+0x270],rdx
    proc->regs.rsi=esi;
  803e7c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e80:	48 8b 55 40          	mov    rdx,QWORD PTR [rbp+0x40]
  803e84:	48 89 90 78 02 00 00 	mov    QWORD PTR [rax+0x278],rdx
    proc->regs.rdi=edi;
  803e8b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e8f:	48 8b 55 48          	mov    rdx,QWORD PTR [rbp+0x48]
  803e93:	48 89 90 80 02 00 00 	mov    QWORD PTR [rax+0x280],rdx
    proc->regs.rflags=0x202;//设置为默认值:0b 0010 0000 0010
  803e9a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803e9e:	48 c7 80 40 02 00 00 	mov    QWORD PTR [rax+0x240],0x202
  803ea5:	02 02 00 00 
    //能接受中断
    proc->regs.rip=rip;
  803ea9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ead:	48 8b 55 50          	mov    rdx,QWORD PTR [rbp+0x50]
  803eb1:	48 89 90 38 02 00 00 	mov    QWORD PTR [rax+0x238],rdx

    proc->regs.cs=cs;
  803eb8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ebc:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  803ec0:	48 89 90 90 02 00 00 	mov    QWORD PTR [rax+0x290],rdx
    proc->regs.ds=ds;
  803ec7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ecb:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  803ecf:	48 89 90 a0 02 00 00 	mov    QWORD PTR [rax+0x2a0],rdx
    proc->regs.es=es;
  803ed6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803eda:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  803ede:	48 89 90 88 02 00 00 	mov    QWORD PTR [rax+0x288],rdx
    proc->regs.cr3=PML4_ADDR;//get_phyaddr(n1);//暂时先搞成全局
  803ee5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  803ee9:	48 c7 80 30 02 00 00 	mov    QWORD PTR [rax+0x230],0x101000
  803ef0:	00 10 10 00 


}
  803ef4:	90                   	nop
  803ef5:	5d                   	pop    rbp
  803ef6:	c3                   	ret    

0000000000803ef7 <proc_zero>:
void proc_zero()
{
  803ef7:	f3 0f 1e fa          	endbr64 
  803efb:	55                   	push   rbp
  803efc:	48 89 e5             	mov    rbp,rsp
    asm volatile("leave\n"
  803eff:	c9                   	leave  
  803f00:	58                   	pop    rax
  803f01:	8e d8                	mov    ds,eax
  803f03:	58                   	pop    rax
  803f04:	8e c0                	mov    es,eax
  803f06:	41 5f                	pop    r15
  803f08:	41 5e                	pop    r14
  803f0a:	41 5d                	pop    r13
  803f0c:	41 5c                	pop    r12
  803f0e:	41 5b                	pop    r11
  803f10:	41 5a                	pop    r10
  803f12:	41 59                	pop    r9
  803f14:	41 58                	pop    r8
  803f16:	5e                   	pop    rsi
  803f17:	5f                   	pop    rdi
  803f18:	5a                   	pop    rdx
  803f19:	59                   	pop    rcx
  803f1a:	5b                   	pop    rbx
  803f1b:	58                   	pop    rax
  803f1c:	e8 1d 0f 00 00       	call   804e3e <eoi>
  803f21:	48 cf                	iretq  

0000000000803f23 <dd>:
  803f23:	90                   	nop
                 "popq %rax\n"
                 "callq eoi\n"
                 "iretq\n"
                 "dd:\n"
                 "nop\n");
    while(1);
  803f24:	eb fe                	jmp    803f24 <dd+0x1>

0000000000803f26 <manage_proc>:
}
void manage_proc(){
  803f26:	f3 0f 1e fa          	endbr64 
  803f2a:	55                   	push   rbp
  803f2b:	48 89 e5             	mov    rbp,rsp
  803f2e:	48 83 ec 10          	sub    rsp,0x10
    if(cur_proc!=-1)
  803f32:	8b 05 d4 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc105d4]        # 41450c <cur_proc>
  803f38:	83 f8 ff             	cmp    eax,0xffffffff
  803f3b:	74 39                	je     803f76 <manage_proc+0x50>
        task[cur_proc].utime++;
  803f3d:	8b 15 c9 05 c1 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc105c9]        # 41450c <cur_proc>
  803f43:	48 63 ca             	movsxd rcx,edx
  803f46:	48 89 c8             	mov    rax,rcx
  803f49:	48 01 c0             	add    rax,rax
  803f4c:	48 01 c8             	add    rax,rcx
  803f4f:	48 c1 e0 08          	shl    rax,0x8
  803f53:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803f59:	8b 00                	mov    eax,DWORD PTR [rax]
  803f5b:	8d 48 01             	lea    ecx,[rax+0x1]
  803f5e:	48 63 d2             	movsxd rdx,edx
  803f61:	48 89 d0             	mov    rax,rdx
  803f64:	48 01 c0             	add    rax,rax
  803f67:	48 01 d0             	add    rax,rdx
  803f6a:	48 c1 e0 08          	shl    rax,0x8
  803f6e:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803f74:	89 08                	mov    DWORD PTR [rax],ecx
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803f76:	8b 05 90 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10590]        # 41450c <cur_proc>
  803f7c:	83 f8 ff             	cmp    eax,0xffffffff
  803f7f:	74 4a                	je     803fcb <manage_proc+0xa5>
  803f81:	8b 05 85 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10585]        # 41450c <cur_proc>
  803f87:	48 63 d0             	movsxd rdx,eax
  803f8a:	48 89 d0             	mov    rax,rdx
  803f8d:	48 01 c0             	add    rax,rax
  803f90:	48 01 d0             	add    rax,rdx
  803f93:	48 c1 e0 08          	shl    rax,0x8
  803f97:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803f9d:	8b 00                	mov    eax,DWORD PTR [rax]
  803f9f:	83 f8 01             	cmp    eax,0x1
  803fa2:	77 27                	ja     803fcb <manage_proc+0xa5>
    task[cur_proc].stat!=READY){
  803fa4:	8b 05 62 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10562]        # 41450c <cur_proc>
  803faa:	48 63 d0             	movsxd rdx,eax
  803fad:	48 89 d0             	mov    rax,rdx
  803fb0:	48 01 c0             	add    rax,rax
  803fb3:	48 01 d0             	add    rax,rdx
  803fb6:	48 c1 e0 08          	shl    rax,0x8
  803fba:	48 05 a4 84 40 00    	add    rax,0x4084a4
  803fc0:	8b 00                	mov    eax,DWORD PTR [rax]
    if(cur_proc==-1||task[cur_proc].utime>MAX_UTIME||\
  803fc2:	83 f8 01             	cmp    eax,0x1
  803fc5:	0f 84 21 01 00 00    	je     8040ec <manage_proc+0x1c6>
        if(cur_proc!=-1)
  803fcb:	8b 05 3b 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1053b]        # 41450c <cur_proc>
  803fd1:	83 f8 ff             	cmp    eax,0xffffffff
  803fd4:	74 22                	je     803ff8 <manage_proc+0xd2>
            task[cur_proc].utime=0;
  803fd6:	8b 05 30 05 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10530]        # 41450c <cur_proc>
  803fdc:	48 63 d0             	movsxd rdx,eax
  803fdf:	48 89 d0             	mov    rax,rdx
  803fe2:	48 01 c0             	add    rax,rax
  803fe5:	48 01 d0             	add    rax,rdx
  803fe8:	48 c1 e0 08          	shl    rax,0x8
  803fec:	48 05 a8 84 40 00    	add    rax,0x4084a8
  803ff2:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        //find
        int i=0;
  803ff8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
        for(i=0;i<MAX_PROC_COUNT;i++){
  803fff:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  804006:	eb 4f                	jmp    804057 <manage_proc+0x131>
            if(task[i].pid!=-1&&task[i].stat==READY&&i!=cur_proc){
  804008:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80400b:	48 63 d0             	movsxd rdx,eax
  80400e:	48 89 d0             	mov    rax,rdx
  804011:	48 01 c0             	add    rax,rax
  804014:	48 01 d0             	add    rax,rdx
  804017:	48 c1 e0 08          	shl    rax,0x8
  80401b:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804021:	8b 00                	mov    eax,DWORD PTR [rax]
  804023:	83 f8 ff             	cmp    eax,0xffffffff
  804026:	74 2b                	je     804053 <manage_proc+0x12d>
  804028:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80402b:	48 63 d0             	movsxd rdx,eax
  80402e:	48 89 d0             	mov    rax,rdx
  804031:	48 01 c0             	add    rax,rax
  804034:	48 01 d0             	add    rax,rdx
  804037:	48 c1 e0 08          	shl    rax,0x8
  80403b:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804041:	8b 00                	mov    eax,DWORD PTR [rax]
  804043:	83 f8 01             	cmp    eax,0x1
  804046:	75 0b                	jne    804053 <manage_proc+0x12d>
  804048:	8b 05 be 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc104be]        # 41450c <cur_proc>
  80404e:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804051:	75 0c                	jne    80405f <manage_proc+0x139>
        for(i=0;i<MAX_PROC_COUNT;i++){
  804053:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  804057:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  80405b:	7e ab                	jle    804008 <manage_proc+0xe2>
  80405d:	eb 01                	jmp    804060 <manage_proc+0x13a>
                break;
  80405f:	90                   	nop
            }
        }
        if(i>=MAX_PROC_COUNT)
  804060:	83 7d fc 3f          	cmp    DWORD PTR [rbp-0x4],0x3f
  804064:	0f 8f 85 00 00 00    	jg     8040ef <manage_proc+0x1c9>
            return;
        //switch
        task[cur_proc].stat=READY;
  80406a:	8b 05 9c 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1049c]        # 41450c <cur_proc>
  804070:	48 63 d0             	movsxd rdx,eax
  804073:	48 89 d0             	mov    rax,rdx
  804076:	48 01 c0             	add    rax,rax
  804079:	48 01 d0             	add    rax,rdx
  80407c:	48 c1 e0 08          	shl    rax,0x8
  804080:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804086:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        task[i].stat=RUNNING;
  80408c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80408f:	48 63 d0             	movsxd rdx,eax
  804092:	48 89 d0             	mov    rax,rdx
  804095:	48 01 c0             	add    rax,rax
  804098:	48 01 d0             	add    rax,rdx
  80409b:	48 c1 e0 08          	shl    rax,0x8
  80409f:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8040a5:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
        switch_to(&task[cur_proc], &task[i]);
  8040ab:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8040ae:	48 63 d0             	movsxd rdx,eax
  8040b1:	48 89 d0             	mov    rax,rdx
  8040b4:	48 01 c0             	add    rax,rax
  8040b7:	48 01 d0             	add    rax,rdx
  8040ba:	48 c1 e0 08          	shl    rax,0x8
  8040be:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  8040c5:	8b 05 41 04 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10441]        # 41450c <cur_proc>
  8040cb:	48 63 c8             	movsxd rcx,eax
  8040ce:	48 89 c8             	mov    rax,rcx
  8040d1:	48 01 c0             	add    rax,rax
  8040d4:	48 01 c8             	add    rax,rcx
  8040d7:	48 c1 e0 08          	shl    rax,0x8
  8040db:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8040e1:	48 89 d6             	mov    rsi,rdx
  8040e4:	48 89 c7             	mov    rdi,rax
  8040e7:	e8 fd 0a 00 00       	call   804be9 <switch_to>
    }
    return;
  8040ec:	90                   	nop
  8040ed:	eb 01                	jmp    8040f0 <manage_proc+0x1ca>
            return;
  8040ef:	90                   	nop
}
  8040f0:	c9                   	leave  
  8040f1:	c3                   	ret    

00000000008040f2 <switch_proc_tss>:

void switch_proc_tss(int pnr)
{
  8040f2:	f3 0f 1e fa          	endbr64 
  8040f6:	55                   	push   rbp
  8040f7:	48 89 e5             	mov    rbp,rsp
  8040fa:	48 83 ec 20          	sub    rsp,0x20
  8040fe:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    int sel=_TSS_IND(pnr)*8;
  804101:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804104:	01 c0                	add    eax,eax
  804106:	83 c0 05             	add    eax,0x5
  804109:	c1 e0 03             	shl    eax,0x3
  80410c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    cur_proc=pnr;
  80410f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804112:	89 05 f4 03 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc103f4],eax        # 41450c <cur_proc>
    switch_proc_asm(sel);
  804118:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80411b:	89 c7                	mov    edi,eax
  80411d:	e8 28 6c 00 00       	call   80ad4a <switch_proc_asm>
}
  804122:	90                   	nop
  804123:	c9                   	leave  
  804124:	c3                   	ret    

0000000000804125 <switch_proc>:
void switch_proc(int pnr){
  804125:	f3 0f 1e fa          	endbr64 
  804129:	55                   	push   rbp
  80412a:	48 89 e5             	mov    rbp,rsp
  80412d:	48 81 ec 20 03 00 00 	sub    rsp,0x320
  804134:	89 bd ec fc ff ff    	mov    DWORD PTR [rbp-0x314],edi
    //printf("switching proc to %d\n",pnr);
    //printf("eip:%x\n",task[pnr].tss.eip);
    struct process p=task[pnr];
  80413a:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  804140:	48 63 d0             	movsxd rdx,eax
  804143:	48 89 d0             	mov    rax,rdx
  804146:	48 01 c0             	add    rax,rax
  804149:	48 01 d0             	add    rax,rdx
  80414c:	48 c1 e0 08          	shl    rax,0x8
  804150:	48 8d 90 a0 84 40 00 	lea    rdx,[rax+0x4084a0]
  804157:	48 8d 85 f0 fc ff ff 	lea    rax,[rbp-0x310]
  80415e:	48 89 d6             	mov    rsi,rdx
  804161:	ba 60 00 00 00       	mov    edx,0x60
  804166:	48 89 c7             	mov    rdi,rax
  804169:	48 89 d1             	mov    rcx,rdx
  80416c:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
    save_context(&task[cur_proc].tss);
  80416f:	8b 05 97 03 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10397]        # 41450c <cur_proc>
  804175:	48 63 d0             	movsxd rdx,eax
  804178:	48 89 d0             	mov    rax,rdx
  80417b:	48 01 c0             	add    rax,rax
  80417e:	48 01 d0             	add    rax,rdx
  804181:	48 c1 e0 08          	shl    rax,0x8
  804185:	48 05 c0 01 00 00    	add    rax,0x1c0
  80418b:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804191:	48 83 c0 04          	add    rax,0x4
  804195:	48 89 c7             	mov    rdi,rax
  804198:	e8 53 00 00 00       	call   8041f0 <save_context>
//    //重新设置0号进程
//    task[0].tss.eip=proc_zero;
//    task[0].tss.cr3=PAGE_INDEX_ADDR;
//    task[0].tss.eflags=0x202;
    cur_proc=pnr;
  80419d:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  8041a3:	89 05 63 03 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc10363],eax        # 41450c <cur_proc>
    int sel=_TSS_IND(pnr)*8;
  8041a9:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  8041af:	01 c0                	add    eax,eax
  8041b1:	83 c0 05             	add    eax,0x5
  8041b4:	c1 e0 03             	shl    eax,0x3
  8041b7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    switch_to(NULL, &task[pnr].tss);
  8041ba:	8b 85 ec fc ff ff    	mov    eax,DWORD PTR [rbp-0x314]
  8041c0:	48 63 d0             	movsxd rdx,eax
  8041c3:	48 89 d0             	mov    rax,rdx
  8041c6:	48 01 c0             	add    rax,rax
  8041c9:	48 01 d0             	add    rax,rdx
  8041cc:	48 c1 e0 08          	shl    rax,0x8
  8041d0:	48 05 c0 01 00 00    	add    rax,0x1c0
  8041d6:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8041dc:	48 83 c0 04          	add    rax,0x4
  8041e0:	48 89 c6             	mov    rsi,rax
  8041e3:	bf 00 00 00 00       	mov    edi,0x0
  8041e8:	e8 fc 09 00 00       	call   804be9 <switch_to>
    //asm volatile("push %0":"=r"(task[pnr].tss.eip));
    //switch_proc_asm(pnr*8+0x8*3);
}
  8041ed:	90                   	nop
  8041ee:	c9                   	leave  
  8041ef:	c3                   	ret    

00000000008041f0 <save_context>:
void save_context(TSS *tss)
{
  8041f0:	f3 0f 1e fa          	endbr64 
  8041f4:	55                   	push   rbp
  8041f5:	48 89 e5             	mov    rbp,rsp
  8041f8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
//    tss->esi=scene_saver.esi;
//    tss->edi=scene_saver.edi;
//    tss->eflags=scene_saver.eflags;
//    tss->esp=scene_saver.esp;
//    tss->ebp=scene_saver.ebp;
}
  8041fc:	90                   	nop
  8041fd:	5d                   	pop    rbp
  8041fe:	c3                   	ret    

00000000008041ff <palloc>:
    task[index].stat=READY;
    return index;
} */
//为指定进程申请新的内存，并返回这块内存的线性地址。
void* palloc(int proc_index,int size)
{
  8041ff:	f3 0f 1e fa          	endbr64 
  804203:	55                   	push   rbp
  804204:	48 89 e5             	mov    rbp,rsp
  804207:	48 83 ec 60          	sub    rsp,0x60
  80420b:	89 7d ac             	mov    DWORD PTR [rbp-0x54],edi
  80420e:	89 75 a8             	mov    DWORD PTR [rbp-0x58],esi
    int page_c=size/4096+size%4096?1:0;
  804211:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  804214:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80421a:	85 c0                	test   eax,eax
  80421c:	0f 48 c2             	cmovs  eax,edx
  80421f:	c1 f8 0c             	sar    eax,0xc
  804222:	89 c1                	mov    ecx,eax
  804224:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
  804227:	99                   	cdq    
  804228:	c1 ea 14             	shr    edx,0x14
  80422b:	01 d0                	add    eax,edx
  80422d:	25 ff 0f 00 00       	and    eax,0xfff
  804232:	29 d0                	sub    eax,edx
  804234:	01 c8                	add    eax,ecx
  804236:	85 c0                	test   eax,eax
  804238:	0f 95 c0             	setne  al
  80423b:	0f b6 c0             	movzx  eax,al
  80423e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int c=0;
  804241:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    void *ptr=NULL;
  804248:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  80424f:	00 
    page_item *pgind=NULL;//task[proc_index].tss.cr3;
  804250:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  804257:	00 
    pgind++;
  804258:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  80425d:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
  804264:	e9 76 02 00 00       	jmp    8044df <palloc+0x2e0>
    {
        page_item* tblp=*pgind&0xfffff000;
  804269:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80426d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804270:	25 00 f0 ff ff       	and    eax,0xfffff000
  804275:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        for(int j=0;j<1024;j++)
  804279:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  804280:	e9 44 02 00 00       	jmp    8044c9 <palloc+0x2ca>
        {
            int v=*tblp&PAGE_PRESENT;
  804285:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804289:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80428c:	83 e0 01             	and    eax,0x1
  80428f:	89 45 cc             	mov    DWORD PTR [rbp-0x34],eax
            if(!v)
  804292:	83 7d cc 00          	cmp    DWORD PTR [rbp-0x34],0x0
  804296:	0f 85 24 02 00 00    	jne    8044c0 <palloc+0x2c1>
            {
                int new_pg=req_a_page();
  80429c:	b8 00 00 00 00       	mov    eax,0x0
  8042a1:	e8 e9 d1 ff ff       	call   80148f <req_a_page>
  8042a6:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
                if(new_pg==-1)
  8042a9:	83 7d c8 ff          	cmp    DWORD PTR [rbp-0x38],0xffffffff
  8042ad:	0f 85 dc 00 00 00    	jne    80438f <palloc+0x190>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  8042b3:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8042b6:	48 63 d0             	movsxd rdx,eax
  8042b9:	48 89 d0             	mov    rax,rdx
  8042bc:	48 01 c0             	add    rax,rax
  8042bf:	48 01 d0             	add    rax,rdx
  8042c2:	48 c1 e0 08          	shl    rax,0x8
  8042c6:	48 05 f4 84 40 00    	add    rax,0x4084f4
  8042cc:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8042cf:	0f b7 c0             	movzx  eax,ax
  8042d2:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  8042d5:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8042d8:	48 63 d0             	movsxd rdx,eax
  8042db:	48 89 d0             	mov    rax,rdx
  8042de:	48 01 c0             	add    rax,rax
  8042e1:	48 01 d0             	add    rax,rdx
  8042e4:	48 c1 e0 08          	shl    rax,0x8
  8042e8:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8042ee:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  8042f2:	0f b7 c0             	movzx  eax,ax
  8042f5:	c1 e0 10             	shl    eax,0x10
  8042f8:	25 00 00 0f 00       	and    eax,0xf0000
  8042fd:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    size+=c;
  804300:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804303:	01 45 b4             	add    DWORD PTR [rbp-0x4c],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  804306:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  804309:	89 c1                	mov    ecx,eax
  80430b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80430e:	48 63 d0             	movsxd rdx,eax
  804311:	48 89 d0             	mov    rax,rdx
  804314:	48 01 c0             	add    rax,rax
  804317:	48 01 d0             	add    rax,rdx
  80431a:	48 c1 e0 08          	shl    rax,0x8
  80431e:	48 05 f4 84 40 00    	add    rax,0x4084f4
  804324:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  804327:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80432a:	48 63 d0             	movsxd rdx,eax
  80432d:	48 89 d0             	mov    rax,rdx
  804330:	48 01 c0             	add    rax,rax
  804333:	48 01 d0             	add    rax,rdx
  804336:	48 c1 e0 08          	shl    rax,0x8
  80433a:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804340:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804344:	0f b7 c0             	movzx  eax,ax
  804347:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    tmp_attr&=0xfff0;
  80434a:	81 65 b0 f0 ff 00 00 	and    DWORD PTR [rbp-0x50],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804351:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  804354:	c1 e8 10             	shr    eax,0x10
  804357:	83 e0 0f             	and    eax,0xf
  80435a:	89 c2                	mov    edx,eax
  80435c:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  80435f:	01 d0                	add    eax,edx
  804361:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  804364:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
  804367:	89 c1                	mov    ecx,eax
  804369:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80436c:	48 63 d0             	movsxd rdx,eax
  80436f:	48 89 d0             	mov    rax,rdx
  804372:	48 01 c0             	add    rax,rax
  804375:	48 01 d0             	add    rax,rdx
  804378:	48 c1 e0 08          	shl    rax,0x8
  80437c:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804382:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;//失败了，只能申请一部分的内存或者返回NULL
  804386:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80438a:	e9 62 01 00 00       	jmp    8044f1 <palloc+0x2f2>
                }
                int addr=get_phyaddr(new_pg);
  80438f:	8b 45 c8             	mov    eax,DWORD PTR [rbp-0x38]
  804392:	89 c7                	mov    edi,eax
  804394:	e8 a4 d2 ff ff       	call   80163d <get_phyaddr>
  804399:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
                set_page_item(tblp,addr,PAGE_PRESENT|\
  80439c:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
  80439f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8043a3:	ba 07 00 00 00       	mov    edx,0x7
  8043a8:	89 ce                	mov    esi,ecx
  8043aa:	48 89 c7             	mov    rdi,rax
  8043ad:	e8 9e d2 ff ff       	call   801650 <set_page_item>
                PAGE_RWX|PAGE_FOR_ALL);
                int laddr=i*0x400000+j*0x1000;//线性地址
  8043b2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8043b5:	c1 e0 0a             	shl    eax,0xa
  8043b8:	89 c2                	mov    edx,eax
  8043ba:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8043bd:	01 d0                	add    eax,edx
  8043bf:	c1 e0 0c             	shl    eax,0xc
  8043c2:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
                if(ptr==NULL)
  8043c5:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
  8043ca:	75 09                	jne    8043d5 <palloc+0x1d6>
                {
                   // ptr=laddr;
                    palloc_paddr=addr;
  8043cc:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8043cf:	89 05 3f 01 c1 ff    	mov    DWORD PTR [rip+0xffffffffffc1013f],eax        # 414514 <palloc_paddr>
                }
                page_c--;
  8043d5:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
                c++;
  8043d9:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
                if(page_c==0)
  8043dd:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  8043e1:	0f 85 d9 00 00 00    	jne    8044c0 <palloc+0x2c1>
                {
                    //修改ldt,增加数据空间
                    unsigned int size=task[proc_index].ldt[2].limit_lo16;
  8043e7:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8043ea:	48 63 d0             	movsxd rdx,eax
  8043ed:	48 89 d0             	mov    rax,rdx
  8043f0:	48 01 c0             	add    rax,rax
  8043f3:	48 01 d0             	add    rax,rdx
  8043f6:	48 c1 e0 08          	shl    rax,0x8
  8043fa:	48 05 f4 84 40 00    	add    rax,0x4084f4
  804400:	0f b7 00             	movzx  eax,WORD PTR [rax]
  804403:	0f b7 c0             	movzx  eax,ax
  804406:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
                    size+=(task[proc_index].ldt[2].attr&0xf)<<16;
  804409:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80440c:	48 63 d0             	movsxd rdx,eax
  80440f:	48 89 d0             	mov    rax,rdx
  804412:	48 01 c0             	add    rax,rax
  804415:	48 01 d0             	add    rax,rdx
  804418:	48 c1 e0 08          	shl    rax,0x8
  80441c:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804422:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804426:	0f b7 c0             	movzx  eax,ax
  804429:	c1 e0 10             	shl    eax,0x10
  80442c:	25 00 00 0f 00       	and    eax,0xf0000
  804431:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    size+=c;
  804434:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  804437:	01 45 bc             	add    DWORD PTR [rbp-0x44],eax
                    task[proc_index].ldt[2].limit_lo16=size&0xffff;
  80443a:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  80443d:	89 c1                	mov    ecx,eax
  80443f:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  804442:	48 63 d0             	movsxd rdx,eax
  804445:	48 89 d0             	mov    rax,rdx
  804448:	48 01 c0             	add    rax,rax
  80444b:	48 01 d0             	add    rax,rdx
  80444e:	48 c1 e0 08          	shl    rax,0x8
  804452:	48 05 f4 84 40 00    	add    rax,0x4084f4
  804458:	66 89 08             	mov    WORD PTR [rax],cx
                    int tmp_attr=task[proc_index].ldt[2].attr;
  80445b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  80445e:	48 63 d0             	movsxd rdx,eax
  804461:	48 89 d0             	mov    rax,rdx
  804464:	48 01 c0             	add    rax,rax
  804467:	48 01 d0             	add    rax,rdx
  80446a:	48 c1 e0 08          	shl    rax,0x8
  80446e:	48 05 f0 84 40 00    	add    rax,0x4084f0
  804474:	0f b7 40 09          	movzx  eax,WORD PTR [rax+0x9]
  804478:	0f b7 c0             	movzx  eax,ax
  80447b:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    tmp_attr&=0xfff0;
  80447e:	81 65 b8 f0 ff 00 00 	and    DWORD PTR [rbp-0x48],0xfff0
                    tmp_attr+=(size>>16)&0xf;
  804485:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  804488:	c1 e8 10             	shr    eax,0x10
  80448b:	83 e0 0f             	and    eax,0xf
  80448e:	89 c2                	mov    edx,eax
  804490:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  804493:	01 d0                	add    eax,edx
  804495:	89 45 b8             	mov    DWORD PTR [rbp-0x48],eax
                    task[proc_index].ldt[2].attr=tmp_attr;
  804498:	8b 45 b8             	mov    eax,DWORD PTR [rbp-0x48]
  80449b:	89 c1                	mov    ecx,eax
  80449d:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  8044a0:	48 63 d0             	movsxd rdx,eax
  8044a3:	48 89 d0             	mov    rax,rdx
  8044a6:	48 01 c0             	add    rax,rax
  8044a9:	48 01 d0             	add    rax,rdx
  8044ac:	48 c1 e0 08          	shl    rax,0x8
  8044b0:	48 05 f0 84 40 00    	add    rax,0x4084f0
  8044b6:	66 89 48 09          	mov    WORD PTR [rax+0x9],cx
                    return ptr;
  8044ba:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8044be:	eb 31                	jmp    8044f1 <palloc+0x2f2>
                }
            }
            tblp++;
  8044c0:	48 83 45 e0 08       	add    QWORD PTR [rbp-0x20],0x8
        for(int j=0;j<1024;j++)
  8044c5:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  8044c9:	81 7d dc ff 03 00 00 	cmp    DWORD PTR [rbp-0x24],0x3ff
  8044d0:	0f 8e af fd ff ff    	jle    804285 <palloc+0x86>
        }
        pgind++;
  8044d6:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
    for(int i=1;i<1024;i++)
  8044db:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8044df:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  8044e6:	0f 8e 7d fd ff ff    	jle    804269 <palloc+0x6a>
    }
    return NULL;
  8044ec:	b8 00 00 00 00       	mov    eax,0x0
}
  8044f1:	c9                   	leave  
  8044f2:	c3                   	ret    

00000000008044f3 <malloc>:
//为当前进程申请新的内存，并返回这块内存的线性地址。
void* malloc(int size)
{
  8044f3:	f3 0f 1e fa          	endbr64 
  8044f7:	55                   	push   rbp
  8044f8:	48 89 e5             	mov    rbp,rsp
  8044fb:	48 83 ec 10          	sub    rsp,0x10
  8044ff:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return palloc(cur_proc,size);
  804502:	8b 05 04 00 c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc10004]        # 41450c <cur_proc>
  804508:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80450b:	89 d6                	mov    esi,edx
  80450d:	89 c7                	mov    edi,eax
  80450f:	e8 eb fc ff ff       	call   8041ff <palloc>
}
  804514:	c9                   	leave  
  804515:	c3                   	ret    

0000000000804516 <proc_end>:
void proc_end()
{
  804516:	f3 0f 1e fa          	endbr64 
  80451a:	55                   	push   rbp
  80451b:	48 89 e5             	mov    rbp,rsp
  80451e:	48 83 ec 10          	sub    rsp,0x10
    int ret;
    asm volatile("mov %%eax,%0":"=m"(ret));
  804522:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    //printf("proc #%d ended with retv %d.\n",cur_proc,ret);
    //切换堆栈
    //asm volatile("mov %0,%%rsp"::"r"(task[0].tss.esp));
    del_proc(cur_proc);
  804525:	8b 05 e1 ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ffe1]        # 41450c <cur_proc>
  80452b:	89 c7                	mov    edi,eax
  80452d:	e8 90 00 00 00       	call   8045c2 <del_proc>
    if(task[cur_proc].parent_pid!=-1){
  804532:	8b 05 d4 ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ffd4]        # 41450c <cur_proc>
  804538:	48 63 d0             	movsxd rdx,eax
  80453b:	48 89 d0             	mov    rax,rdx
  80453e:	48 01 c0             	add    rax,rax
  804541:	48 01 d0             	add    rax,rdx
  804544:	48 c1 e0 08          	shl    rax,0x8
  804548:	48 05 28 85 40 00    	add    rax,0x408528
  80454e:	8b 00                	mov    eax,DWORD PTR [rax]
  804550:	83 f8 ff             	cmp    eax,0xffffffff
  804553:	74 60                	je     8045b5 <proc_end+0x9f>
        task[task[cur_proc].parent_pid].stat=READY;
  804555:	8b 05 b1 ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ffb1]        # 41450c <cur_proc>
  80455b:	48 63 d0             	movsxd rdx,eax
  80455e:	48 89 d0             	mov    rax,rdx
  804561:	48 01 c0             	add    rax,rax
  804564:	48 01 d0             	add    rax,rdx
  804567:	48 c1 e0 08          	shl    rax,0x8
  80456b:	48 05 28 85 40 00    	add    rax,0x408528
  804571:	8b 00                	mov    eax,DWORD PTR [rax]
  804573:	89 c2                	mov    edx,eax
  804575:	48 89 d0             	mov    rax,rdx
  804578:	48 01 c0             	add    rax,rax
  80457b:	48 01 d0             	add    rax,rdx
  80457e:	48 c1 e0 08          	shl    rax,0x8
  804582:	48 05 a4 84 40 00    	add    rax,0x4084a4
  804588:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
        switch_proc_tss(task[cur_proc].parent_pid);
  80458e:	8b 05 78 ff c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ff78]        # 41450c <cur_proc>
  804594:	48 63 d0             	movsxd rdx,eax
  804597:	48 89 d0             	mov    rax,rdx
  80459a:	48 01 c0             	add    rax,rax
  80459d:	48 01 d0             	add    rax,rdx
  8045a0:	48 c1 e0 08          	shl    rax,0x8
  8045a4:	48 05 28 85 40 00    	add    rax,0x408528
  8045aa:	8b 00                	mov    eax,DWORD PTR [rax]
  8045ac:	89 c7                	mov    edi,eax
  8045ae:	e8 3f fb ff ff       	call   8040f2 <switch_proc_tss>
    }
    else
        switch_proc_tss(0);
    //syscall(SYSCALL_DEL_PROC,cur_proc,0,0,0,0);
}
  8045b3:	eb 0a                	jmp    8045bf <proc_end+0xa9>
        switch_proc_tss(0);
  8045b5:	bf 00 00 00 00       	mov    edi,0x0
  8045ba:	e8 33 fb ff ff       	call   8040f2 <switch_proc_tss>
}
  8045bf:	90                   	nop
  8045c0:	c9                   	leave  
  8045c1:	c3                   	ret    

00000000008045c2 <del_proc>:
void del_proc(int pnr)
{
  8045c2:	f3 0f 1e fa          	endbr64 
  8045c6:	55                   	push   rbp
  8045c7:	48 89 e5             	mov    rbp,rsp
  8045ca:	48 83 ec 30          	sub    rsp,0x30
  8045ce:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
    task[pnr].stat=ENDED;
  8045d1:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8045d4:	48 63 d0             	movsxd rdx,eax
  8045d7:	48 89 d0             	mov    rax,rdx
  8045da:	48 01 c0             	add    rax,rax
  8045dd:	48 01 d0             	add    rax,rdx
  8045e0:	48 c1 e0 08          	shl    rax,0x8
  8045e4:	48 05 a4 84 40 00    	add    rax,0x4084a4
  8045ea:	c7 00 03 00 00 00    	mov    DWORD PTR [rax],0x3
    task[pnr].pid=-1;
  8045f0:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8045f3:	48 63 d0             	movsxd rdx,eax
  8045f6:	48 89 d0             	mov    rax,rdx
  8045f9:	48 01 c0             	add    rax,rax
  8045fc:	48 01 d0             	add    rax,rdx
  8045ff:	48 c1 e0 08          	shl    rax,0x8
  804603:	48 05 a0 84 40 00    	add    rax,0x4084a0
  804609:	c7 00 ff ff ff ff    	mov    DWORD PTR [rax],0xffffffff
    //释放申请的页面
    page_item *p;//task[pnr].tss.cr3;
    p++;
  80460f:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804614:	eb 63                	jmp    804679 <del_proc+0xb7>
    {
        page_item *tp=*p&0xfffff000;
  804616:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80461a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80461d:	25 00 f0 ff ff       	and    eax,0xfffff000
  804622:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<1024;i++)
  804626:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  80462d:	eb 30                	jmp    80465f <del_proc+0x9d>
        {
            unsigned int present=*tp&PAGE_PRESENT;
  80462f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804633:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804636:	83 e0 01             	and    eax,0x1
  804639:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            if(present)
  80463c:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
  804640:	74 14                	je     804656 <del_proc+0x94>
            {
                free_page(*tp&0xfffff000);
  804642:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804646:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804649:	25 00 f0 ff ff       	and    eax,0xfffff000
  80464e:	48 89 c7             	mov    rdi,rax
  804651:	e8 09 cf ff ff       	call   80155f <free_page>
                //printf("freed page at %x.\n",*tp&0xfffff000);
            }
            tp++;
  804656:	48 83 45 f0 08       	add    QWORD PTR [rbp-0x10],0x8
        for(int i=0;i<1024;i++)
  80465b:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80465f:	81 7d ec ff 03 00 00 	cmp    DWORD PTR [rbp-0x14],0x3ff
  804666:	7e c7                	jle    80462f <del_proc+0x6d>
        }
        vmfree(tp);
  804668:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80466c:	48 89 c7             	mov    rdi,rax
  80466f:	e8 16 cb ff ff       	call   80118a <vmfree>
    for(;(*p&PAGE_PRESENT)!=0;p++)
  804674:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
  804679:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80467d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  804680:	83 e0 01             	and    eax,0x1
  804683:	48 85 c0             	test   rax,rax
  804686:	75 8e                	jne    804616 <del_proc+0x54>
    }
    //释放存放页目录的页面
    vmfree(p);
  804688:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80468c:	48 89 c7             	mov    rdi,rax
  80468f:	e8 f6 ca ff ff       	call   80118a <vmfree>
    //从进程中解除cr3,tss和ldt
    //switch_proc_tss(task[pnr]);
}
  804694:	90                   	nop
  804695:	c9                   	leave  
  804696:	c3                   	ret    

0000000000804697 <set_proc_stat>:

int set_proc_stat(int pid,int stat)
{
  804697:	f3 0f 1e fa          	endbr64 
  80469b:	55                   	push   rbp
  80469c:	48 89 e5             	mov    rbp,rsp
  80469f:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  8046a2:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
    if(pid==-1)return -1;
  8046a5:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  8046a9:	75 0a                	jne    8046b5 <set_proc_stat+0x1e>
  8046ab:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8046b0:	e9 8c 00 00 00       	jmp    804741 <set_proc_stat+0xaa>
    int i=0;
  8046b5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;task[i].pid!=pid;i++);
  8046bc:	eb 04                	jmp    8046c2 <set_proc_stat+0x2b>
  8046be:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8046c2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046c5:	48 63 d0             	movsxd rdx,eax
  8046c8:	48 89 d0             	mov    rax,rdx
  8046cb:	48 01 c0             	add    rax,rax
  8046ce:	48 01 d0             	add    rax,rdx
  8046d1:	48 c1 e0 08          	shl    rax,0x8
  8046d5:	48 05 a0 84 40 00    	add    rax,0x4084a0
  8046db:	8b 10                	mov    edx,DWORD PTR [rax]
  8046dd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8046e0:	39 c2                	cmp    edx,eax
  8046e2:	75 da                	jne    8046be <set_proc_stat+0x27>
    if(i==MAX_PROC_COUNT)return -1;
  8046e4:	83 7d fc 40          	cmp    DWORD PTR [rbp-0x4],0x40
  8046e8:	75 07                	jne    8046f1 <set_proc_stat+0x5a>
  8046ea:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8046ef:	eb 50                	jmp    804741 <set_proc_stat+0xaa>
    task[i].stat=stat;
  8046f1:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  8046f4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8046f7:	48 63 c8             	movsxd rcx,eax
  8046fa:	48 89 c8             	mov    rax,rcx
  8046fd:	48 01 c0             	add    rax,rax
  804700:	48 01 c8             	add    rax,rcx
  804703:	48 c1 e0 08          	shl    rax,0x8
  804707:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80470d:	89 10                	mov    DWORD PTR [rax],edx
    //如果这就是正在运行的进程，那么马上停止
    if(cur_proc==i)
  80470f:	8b 05 f7 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fdf7]        # 41450c <cur_proc>
  804715:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  804718:	75 22                	jne    80473c <set_proc_stat+0xa5>
        task[cur_proc].utime=MAX_UTIME;
  80471a:	8b 05 ec fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fdec]        # 41450c <cur_proc>
  804720:	48 63 d0             	movsxd rdx,eax
  804723:	48 89 d0             	mov    rax,rdx
  804726:	48 01 c0             	add    rax,rax
  804729:	48 01 d0             	add    rax,rdx
  80472c:	48 c1 e0 08          	shl    rax,0x8
  804730:	48 05 a8 84 40 00    	add    rax,0x4084a8
  804736:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    return 0;
  80473c:	b8 00 00 00 00       	mov    eax,0x0
}
  804741:	5d                   	pop    rbp
  804742:	c3                   	ret    

0000000000804743 <add_proc_openf>:

    return 0;
} */

int add_proc_openf(vfs_dir_entry *entry)
{
  804743:	f3 0f 1e fa          	endbr64 
  804747:	55                   	push   rbp
  804748:	48 89 e5             	mov    rbp,rsp
  80474b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<MAX_PROC_OPENF;i++){
  80474f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  804756:	eb 6a                	jmp    8047c2 <add_proc_openf+0x7f>
        if(task[cur_proc].openf[i]==NULL)
  804758:	8b 05 ae fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fdae]        # 41450c <cur_proc>
  80475e:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804761:	48 63 ca             	movsxd rcx,edx
  804764:	48 63 d0             	movsxd rdx,eax
  804767:	48 89 d0             	mov    rax,rdx
  80476a:	48 01 c0             	add    rax,rax
  80476d:	48 01 d0             	add    rax,rdx
  804770:	48 c1 e0 05          	shl    rax,0x5
  804774:	48 01 c8             	add    rax,rcx
  804777:	48 83 c0 18          	add    rax,0x18
  80477b:	48 8b 04 c5 a4 84 40 	mov    rax,QWORD PTR [rax*8+0x4084a4]
  804782:	00 
  804783:	48 85 c0             	test   rax,rax
  804786:	75 36                	jne    8047be <add_proc_openf+0x7b>
        {
            task[cur_proc].openf[i]=entry;
  804788:	8b 05 7e fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fd7e]        # 41450c <cur_proc>
  80478e:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  804791:	48 63 ca             	movsxd rcx,edx
  804794:	48 63 d0             	movsxd rdx,eax
  804797:	48 89 d0             	mov    rax,rdx
  80479a:	48 01 c0             	add    rax,rax
  80479d:	48 01 d0             	add    rax,rdx
  8047a0:	48 c1 e0 05          	shl    rax,0x5
  8047a4:	48 01 c8             	add    rax,rcx
  8047a7:	48 8d 50 18          	lea    rdx,[rax+0x18]
  8047ab:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8047af:	48 89 04 d5 a4 84 40 	mov    QWORD PTR [rdx*8+0x4084a4],rax
  8047b6:	00 
            return 0;
  8047b7:	b8 00 00 00 00       	mov    eax,0x0
  8047bc:	eb 0f                	jmp    8047cd <add_proc_openf+0x8a>
    for(int i=0;i<MAX_PROC_OPENF;i++){
  8047be:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8047c2:	83 7d fc 1f          	cmp    DWORD PTR [rbp-0x4],0x1f
  8047c6:	7e 90                	jle    804758 <add_proc_openf+0x15>
        }
    }
    return -1;//full
  8047c8:	b8 ff ff ff ff       	mov    eax,0xffffffff
}
  8047cd:	5d                   	pop    rbp
  8047ce:	c3                   	ret    

00000000008047cf <sys_exit>:
/*
 * 进程结束。
 * */
int sys_exit(int code)
{
  8047cf:	f3 0f 1e fa          	endbr64 
  8047d3:	55                   	push   rbp
  8047d4:	48 89 e5             	mov    rbp,rsp
  8047d7:	48 83 ec 10          	sub    rsp,0x10
  8047db:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    del_proc(cur_proc);
  8047de:	8b 05 28 fd c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fd28]        # 41450c <cur_proc>
  8047e4:	89 c7                	mov    edi,eax
  8047e6:	e8 d7 fd ff ff       	call   8045c2 <del_proc>
    return code;
  8047eb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8047ee:	c9                   	leave  
  8047ef:	c3                   	ret    

00000000008047f0 <reg_proc>:
    dllmain(NULL,0,NULL);
    
}*/

int reg_proc(int entry, vfs_dir_entry *cwd, vfs_dir_entry *exef)
{
  8047f0:	f3 0f 1e fa          	endbr64 
  8047f4:	55                   	push   rbp
  8047f5:	48 89 e5             	mov    rbp,rsp
  8047f8:	48 83 ec 40          	sub    rsp,0x40
  8047fc:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  8047ff:	48 89 75 d0          	mov    QWORD PTR [rbp-0x30],rsi
  804803:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
    
    int i=req_proc();
  804807:	b8 00 00 00 00       	mov    eax,0x0
  80480c:	e8 81 f4 ff ff       	call   803c92 <req_proc>
  804811:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    if(i==-1)return -1;
  804814:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  804818:	75 0a                	jne    804824 <reg_proc+0x34>
  80481a:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80481f:	e9 65 01 00 00       	jmp    804989 <reg_proc+0x199>
    /*set_proc(0,0,0,0,SEL_LDT_DATA,SEL_LDT_CODE,SEL_LDT_STACK,SEL_LDT_DATA\
    ,SEL_LDT_DATA,SEL_LDT_DATA,0x1c00000-4,0,0,0,0,i);*/
    set_proc(0, 0, 0, 0, 0x10, 0x8, 0x10, 0x10\
  804824:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804827:	50                   	push   rax
  804828:	6a 00                	push   0x0
  80482a:	6a 00                	push   0x0
  80482c:	6a 00                	push   0x0
  80482e:	6a 00                	push   0x0
  804830:	6a 00                	push   0x0
  804832:	68 fc ff bf 01       	push   0x1bffffc
  804837:	6a 10                	push   0x10
  804839:	6a 10                	push   0x10
  80483b:	6a 10                	push   0x10
  80483d:	6a 10                	push   0x10
  80483f:	41 b9 08 00 00 00    	mov    r9d,0x8
  804845:	41 b8 10 00 00 00    	mov    r8d,0x10
  80484b:	b9 00 00 00 00       	mov    ecx,0x0
  804850:	ba 00 00 00 00       	mov    edx,0x0
  804855:	be 00 00 00 00       	mov    esi,0x0
  80485a:	bf 00 00 00 00       	mov    edi,0x0
  80485f:	e8 27 f5 ff ff       	call   803d8b <set_proc>
  804864:	48 83 c4 58          	add    rsp,0x58
, 0x10, 0x10, 0x1c00000 - 4, 0, 0, 0, 0, 0, i);
    task[i].pml4=vmalloc();
  804868:	b8 00 00 00 00       	mov    eax,0x0
  80486d:	e8 89 c8 ff ff       	call   8010fb <vmalloc>
  804872:	48 89 c1             	mov    rcx,rax
  804875:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804878:	48 63 d0             	movsxd rdx,eax
  80487b:	48 89 d0             	mov    rax,rdx
  80487e:	48 01 c0             	add    rax,rax
  804881:	48 01 d0             	add    rax,rdx
  804884:	48 c1 e0 08          	shl    rax,0x8
  804888:	48 05 40 85 40 00    	add    rax,0x408540
  80488e:	48 89 48 0c          	mov    QWORD PTR [rax+0xc],rcx
    int *pt=vmalloc();
  804892:	b8 00 00 00 00       	mov    eax,0x0
  804897:	e8 5f c8 ff ff       	call   8010fb <vmalloc>
  80489c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    task[i].pml4[0]=PAGE_TABLE_ADDR|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;
  8048a0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8048a3:	48 63 d0             	movsxd rdx,eax
  8048a6:	48 89 d0             	mov    rax,rdx
  8048a9:	48 01 c0             	add    rax,rax
  8048ac:	48 01 d0             	add    rax,rdx
  8048af:	48 c1 e0 08          	shl    rax,0x8
  8048b3:	48 05 40 85 40 00    	add    rax,0x408540
  8048b9:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8048bd:	48 c7 00 07 20 00 00 	mov    QWORD PTR [rax],0x2007
    /*for(int j=0;j<32;j++)
        pt[j]=(PAGE_TABLE_ADDR+j*0x1000)|PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL;//复制内核页表*/
    //PAGE_TABLE_ADDR|PAGE_PRESENT;//复制内核页表
    //task[i].pml4[7]=PAGE_TABLE_ADDR+7*0x1000|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;//sys.dll
    int *stackb=vmalloc();
  8048c4:	b8 00 00 00 00       	mov    eax,0x0
  8048c9:	e8 2d c8 ff ff       	call   8010fb <vmalloc>
  8048ce:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
    task[i].pml4[6]=(int)stackb|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  8048d2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8048d6:	83 c8 07             	or     eax,0x7
  8048d9:	89 c1                	mov    ecx,eax
  8048db:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8048de:	48 63 d0             	movsxd rdx,eax
  8048e1:	48 89 d0             	mov    rax,rdx
  8048e4:	48 01 c0             	add    rax,rax
  8048e7:	48 01 d0             	add    rax,rdx
  8048ea:	48 c1 e0 08          	shl    rax,0x8
  8048ee:	48 05 40 85 40 00    	add    rax,0x408540
  8048f4:	48 8b 40 0c          	mov    rax,QWORD PTR [rax+0xc]
  8048f8:	48 8d 50 30          	lea    rdx,[rax+0x30]
  8048fc:	48 63 c1             	movsxd rax,ecx
  8048ff:	48 89 02             	mov    QWORD PTR [rdx],rax
    stackb[1023]=get_phyaddr(req_a_page())|PAGE_PRESENT|PAGE_FOR_ALL|PAGE_RWX;
  804902:	b8 00 00 00 00       	mov    eax,0x0
  804907:	e8 83 cb ff ff       	call   80148f <req_a_page>
  80490c:	89 c7                	mov    edi,eax
  80490e:	e8 2a cd ff ff       	call   80163d <get_phyaddr>
  804913:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804917:	48 81 c2 fc 0f 00 00 	add    rdx,0xffc
  80491e:	83 c8 07             	or     eax,0x7
  804921:	89 02                	mov    DWORD PTR [rdx],eax
//    task[i].tss.cr3=task[i].pml4;

    task[i].stat=READY;
  804923:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804926:	48 63 d0             	movsxd rdx,eax
  804929:	48 89 d0             	mov    rax,rdx
  80492c:	48 01 c0             	add    rax,rax
  80492f:	48 01 d0             	add    rax,rdx
  804932:	48 c1 e0 08          	shl    rax,0x8
  804936:	48 05 a4 84 40 00    	add    rax,0x4084a4
  80493c:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    task[i].cwd=cwd;
  804942:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804945:	48 63 d0             	movsxd rdx,eax
  804948:	48 89 d0             	mov    rax,rdx
  80494b:	48 01 c0             	add    rax,rax
  80494e:	48 01 d0             	add    rax,rdx
  804951:	48 c1 e0 08          	shl    rax,0x8
  804955:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  80495c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804960:	48 89 42 04          	mov    QWORD PTR [rdx+0x4],rax
    task[i].exef=exef;
  804964:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  804967:	48 63 d0             	movsxd rdx,eax
  80496a:	48 89 d0             	mov    rax,rdx
  80496d:	48 01 c0             	add    rax,rax
  804970:	48 01 d0             	add    rax,rdx
  804973:	48 c1 e0 08          	shl    rax,0x8
  804977:	48 8d 90 50 85 40 00 	lea    rdx,[rax+0x408550]
  80497e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  804982:	48 89 42 0c          	mov    QWORD PTR [rdx+0xc],rax
    task[i].tss.ss=0x10;
    task[i].tss.gs=0x10;
    task[i].tss.fs=0x10;
    task[i].tss.cs=0x8;*/
//    task[i].tss.eip=entry;
    return i;
  804986:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
    proc_ret_stack *pstack=stack_paddr+stack_size-12;
    pstack->argc=0;
    pstack->argv=0;
    pstack->proc_end_addr=proc_end;
    int *pptr=pstack;*/
}
  804989:	c9                   	leave  
  80498a:	c3                   	ret    

000000000080498b <sys_malloc>:

void * sys_malloc(int size)
{
  80498b:	f3 0f 1e fa          	endbr64 
  80498f:	55                   	push   rbp
  804990:	48 89 e5             	mov    rbp,rsp
  804993:	89 7d cc             	mov    DWORD PTR [rbp-0x34],edi
    //
    int n=size/CHUNK_SIZE+size%CHUNK_SIZE?1:0;
  804996:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  804999:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80499f:	85 c0                	test   eax,eax
  8049a1:	0f 48 c2             	cmovs  eax,edx
  8049a4:	c1 f8 0c             	sar    eax,0xc
  8049a7:	89 c1                	mov    ecx,eax
  8049a9:	8b 45 cc             	mov    eax,DWORD PTR [rbp-0x34]
  8049ac:	99                   	cdq    
  8049ad:	c1 ea 14             	shr    edx,0x14
  8049b0:	01 d0                	add    eax,edx
  8049b2:	25 ff 0f 00 00       	and    eax,0xfff
  8049b7:	29 d0                	sub    eax,edx
  8049b9:	01 c8                	add    eax,ecx
  8049bb:	85 c0                	test   eax,eax
  8049bd:	0f 95 c0             	setne  al
  8049c0:	0f b6 c0             	movzx  eax,al
  8049c3:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    chunk_header *hp=(chunk_header*)task[cur_proc].mem_struct.heap_base;
  8049c6:	8b 05 40 fb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fb40]        # 41450c <cur_proc>
  8049cc:	48 63 d0             	movsxd rdx,eax
  8049cf:	48 89 d0             	mov    rax,rdx
  8049d2:	48 01 c0             	add    rax,rax
  8049d5:	48 01 d0             	add    rax,rdx
  8049d8:	48 c1 e0 08          	shl    rax,0x8
  8049dc:	48 05 b4 84 40 00    	add    rax,0x4084b4
  8049e2:	8b 00                	mov    eax,DWORD PTR [rax]
  8049e4:	48 98                	cdqe   
  8049e6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  8049ea:	eb 0c                	jmp    8049f8 <sys_malloc+0x6d>
        hp=hp->next;
  8049ec:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049f0:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8049f4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while (hp->next!=NULL&&hp->alloc==0&&hp->pgn>=n)
  8049f8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8049fc:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804a00:	48 85 c0             	test   rax,rax
  804a03:	74 16                	je     804a1b <sys_malloc+0x90>
  804a05:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a09:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804a0c:	85 c0                	test   eax,eax
  804a0e:	75 0b                	jne    804a1b <sys_malloc+0x90>
  804a10:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a14:	8b 00                	mov    eax,DWORD PTR [rax]
  804a16:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804a19:	7e d1                	jle    8049ec <sys_malloc+0x61>
    if(hp->pgn<n)
  804a1b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a1f:	8b 00                	mov    eax,DWORD PTR [rax]
  804a21:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804a24:	0f 8e 8d 00 00 00    	jle    804ab7 <sys_malloc+0x12c>
    {
        //上抬heap top
        if(task[cur_proc].mem_struct.heap_top+CHUNK_SIZE*n>=HEAP_MAXTOP)
  804a2a:	8b 05 dc fa c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fadc]        # 41450c <cur_proc>
  804a30:	48 63 d0             	movsxd rdx,eax
  804a33:	48 89 d0             	mov    rax,rdx
  804a36:	48 01 c0             	add    rax,rax
  804a39:	48 01 d0             	add    rax,rdx
  804a3c:	48 c1 e0 08          	shl    rax,0x8
  804a40:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804a46:	8b 10                	mov    edx,DWORD PTR [rax]
  804a48:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804a4b:	c1 e0 0c             	shl    eax,0xc
  804a4e:	01 d0                	add    eax,edx
  804a50:	3d ff ff ef 01       	cmp    eax,0x1efffff
  804a55:	7e 0a                	jle    804a61 <sys_malloc+0xd6>
        {
            //超过顶部
            return NULL;
  804a57:	b8 00 00 00 00       	mov    eax,0x0
  804a5c:	e9 cf 00 00 00       	jmp    804b30 <sys_malloc+0x1a5>
        }
        int needed=n-hp->pgn;
  804a61:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804a65:	8b 10                	mov    edx,DWORD PTR [rax]
  804a67:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804a6a:	29 d0                	sub    eax,edx
  804a6c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
        char* p=task[cur_proc].mem_struct.heap_top;
  804a6f:	8b 05 97 fa c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0fa97]        # 41450c <cur_proc>
  804a75:	48 63 d0             	movsxd rdx,eax
  804a78:	48 89 d0             	mov    rax,rdx
  804a7b:	48 01 c0             	add    rax,rax
  804a7e:	48 01 d0             	add    rax,rdx
  804a81:	48 c1 e0 08          	shl    rax,0x8
  804a85:	48 05 b8 84 40 00    	add    rax,0x4084b8
  804a8b:	8b 00                	mov    eax,DWORD PTR [rax]
  804a8d:	48 98                	cdqe   
  804a8f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804a93:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  804a9a:	eb 13                	jmp    804aaf <sys_malloc+0x124>
        {
            *p=0;//触发缺页中断
  804a9c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804aa0:	c6 00 00             	mov    BYTE PTR [rax],0x0
            p+=PAGE_SIZE;
  804aa3:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  804aaa:	00 
        for(int i=0;i<needed*CHUNK_SIZE/PAGE_SIZE;i++)
  804aab:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  804aaf:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804ab2:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  804ab5:	7c e5                	jl     804a9c <sys_malloc+0x111>
        }
    }
    if(hp->pgn>n)
  804ab7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804abb:	8b 00                	mov    eax,DWORD PTR [rax]
  804abd:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
  804ac0:	7d 59                	jge    804b1b <sys_malloc+0x190>
    {
        //在后面新建一个头
        char *p=hp;
  804ac2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ac6:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
        p+=(n+1)*CHUNK_SIZE;//算上存储头一个
  804aca:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804acd:	83 c0 01             	add    eax,0x1
  804ad0:	c1 e0 0c             	shl    eax,0xc
  804ad3:	48 98                	cdqe   
  804ad5:	48 01 45 d8          	add    QWORD PTR [rbp-0x28],rax
        chunk_header *np=p;
  804ad9:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  804add:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
        np->pgn=hp->pgn-n-1;
  804ae1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ae5:	8b 00                	mov    eax,DWORD PTR [rax]
  804ae7:	2b 45 e8             	sub    eax,DWORD PTR [rbp-0x18]
  804aea:	8d 50 ff             	lea    edx,[rax-0x1]
  804aed:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804af1:	89 10                	mov    DWORD PTR [rax],edx
        np->next=hp->next;
  804af3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804af7:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  804afb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804aff:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
        np->prev=hp;
  804b03:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  804b07:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804b0b:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
        hp->next=np;
  804b0f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b13:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804b17:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    }
    hp->alloc=1;//分配完毕
  804b1b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b1f:	c7 40 04 01 00 00 00 	mov    DWORD PTR [rax+0x4],0x1
    return (char*)hp+CHUNK_SIZE;//返回后边的第一个数据块地址
  804b26:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b2a:	48 05 00 10 00 00    	add    rax,0x1000
}
  804b30:	5d                   	pop    rbp
  804b31:	c3                   	ret    

0000000000804b32 <sys_free>:
int sys_free(int ptr)
{
  804b32:	f3 0f 1e fa          	endbr64 
  804b36:	55                   	push   rbp
  804b37:	48 89 e5             	mov    rbp,rsp
  804b3a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    chunk_header *hp=ptr-CHUNK_SIZE;//回退到头
  804b3d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804b40:	2d 00 10 00 00       	sub    eax,0x1000
  804b45:	48 98                	cdqe   
  804b47:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    hp->alloc=0;
  804b4b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b4f:	c7 40 04 00 00 00 00 	mov    DWORD PTR [rax+0x4],0x0
    //合并
    //向后合并
    chunk_header *p=hp->next;
  804b56:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b5a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804b5e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804b62:	eb 2e                	jmp    804b92 <sys_free+0x60>
    {
        if(p->alloc==0)
  804b64:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b68:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804b6b:	85 c0                	test   eax,eax
  804b6d:	75 2c                	jne    804b9b <sys_free+0x69>
        {
            hp->pgn+=p->pgn+1;//把区域合并
  804b6f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b73:	8b 10                	mov    edx,DWORD PTR [rax]
  804b75:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b79:	8b 00                	mov    eax,DWORD PTR [rax]
  804b7b:	83 c0 01             	add    eax,0x1
  804b7e:	01 c2                	add    edx,eax
  804b80:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804b84:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->next;
  804b86:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804b8a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  804b8e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804b92:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804b97:	75 cb                	jne    804b64 <sys_free+0x32>
  804b99:	eb 01                	jmp    804b9c <sys_free+0x6a>
            break;
  804b9b:	90                   	nop
    }
    //向前合并
    p=hp->prev;
  804b9c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804ba0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804ba4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804ba8:	eb 2e                	jmp    804bd8 <sys_free+0xa6>
    {
        if(p->alloc==0)
  804baa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bae:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  804bb1:	85 c0                	test   eax,eax
  804bb3:	75 2c                	jne    804be1 <sys_free+0xaf>
        {
            p->pgn+=hp->pgn+1;//把区域合并
  804bb5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bb9:	8b 10                	mov    edx,DWORD PTR [rax]
  804bbb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804bbf:	8b 00                	mov    eax,DWORD PTR [rax]
  804bc1:	83 c0 01             	add    eax,0x1
  804bc4:	01 c2                	add    edx,eax
  804bc6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bca:	89 10                	mov    DWORD PTR [rax],edx
        }else
            break;
        p=p->prev;
  804bcc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804bd0:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  804bd4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p!=NULL)
  804bd8:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  804bdd:	75 cb                	jne    804baa <sys_free+0x78>
  804bdf:	eb 01                	jmp    804be2 <sys_free+0xb0>
            break;
  804be1:	90                   	nop
    }
    //合并完成
    return 0;
  804be2:	b8 00 00 00 00       	mov    eax,0x0
}
  804be7:	5d                   	pop    rbp
  804be8:	c3                   	ret    

0000000000804be9 <switch_to>:

void switch_to(struct process *from, struct process *to) {
  804be9:	f3 0f 1e fa          	endbr64 
  804bed:	55                   	push   rbp
  804bee:	48 89 e5             	mov    rbp,rsp
  804bf1:	53                   	push   rbx
  804bf2:	48 89 7d f0          	mov    QWORD PTR [rbp-0x10],rdi
  804bf6:	48 89 75 e8          	mov    QWORD PTR [rbp-0x18],rsi
    cur_proc=to-task;
  804bfa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804bfe:	48 2d a0 84 40 00    	sub    rax,0x4084a0
  804c04:	48 c1 f8 08          	sar    rax,0x8
  804c08:	48 89 c2             	mov    rdx,rax
  804c0b:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
  804c12:	aa aa aa 
  804c15:	48 0f af c2          	imul   rax,rdx
  804c19:	89 05 ed f8 c0 ff    	mov    DWORD PTR [rip+0xffffffffffc0f8ed],eax        # 41450c <cur_proc>
    asm volatile("mov %%rsp,%0\r\n"
  804c1f:	4c 8b 4d f0          	mov    r9,QWORD PTR [rbp-0x10]
  804c23:	4c 8b 55 f0          	mov    r10,QWORD PTR [rbp-0x10]
  804c27:	4c 8b 5d f0          	mov    r11,QWORD PTR [rbp-0x10]
  804c2b:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  804c2f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  804c33:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804c37:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804c3b:	4c 8b 45 e8          	mov    r8,QWORD PTR [rbp-0x18]
  804c3f:	48 8b 7d f0          	mov    rdi,QWORD PTR [rbp-0x10]
  804c43:	48 8b 75 e8          	mov    rsi,QWORD PTR [rbp-0x18]
  804c47:	49 89 a1 68 02 00 00 	mov    QWORD PTR [r9+0x268],rsp
  804c4e:	48 8d 05 24 00 00 00 	lea    rax,[rip+0x24]        # 804c79 <done>
  804c55:	49 89 82 38 02 00 00 	mov    QWORD PTR [r10+0x238],rax
  804c5c:	41 8c a3 a8 02 00 00 	mov    WORD PTR [r11+0x2a8],fs
  804c63:	8c ab b0 02 00 00    	mov    WORD PTR [rbx+0x2b0],gs
  804c69:	48 8b a1 68 02 00 00 	mov    rsp,QWORD PTR [rcx+0x268]
  804c70:	41 ff b0 38 02 00 00 	push   QWORD PTR [r8+0x238]
  804c77:	eb 08                	jmp    804c81 <__switch_to>

0000000000804c79 <done>:
  804c79:	90                   	nop
                 "nop":"=m"(from->regs.rsp),"=m"(from->regs.rip),
                 "=m"(from->regs.fs),"=m"(from->regs.gs):
                "m"(to->regs.fs),"m"(to->regs.gs),"m"(to->regs.rsp),"m"(to->regs.rip),
                "D"(from),"S"(to));

}
  804c7a:	90                   	nop
  804c7b:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804c7f:	c9                   	leave  
  804c80:	c3                   	ret    

0000000000804c81 <__switch_to>:
void __switch_to(struct process *from, struct process *to) {
  804c81:	f3 0f 1e fa          	endbr64 
  804c85:	55                   	push   rbp
  804c86:	48 89 e5             	mov    rbp,rsp
  804c89:	53                   	push   rbx
  804c8a:	48 83 ec 18          	sub    rsp,0x18
  804c8e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  804c92:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804c96:	48 8b 05 23 62 00 00 	mov    rax,QWORD PTR [rip+0x6223]        # 80aec0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804c9d:	4c 8b 50 54          	mov    r10,QWORD PTR [rax+0x54]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804ca1:	48 8b 05 18 62 00 00 	mov    rax,QWORD PTR [rip+0x6218]        # 80aec0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804ca8:	4c 8b 48 4c          	mov    r9,QWORD PTR [rax+0x4c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804cac:	48 8b 05 0d 62 00 00 	mov    rax,QWORD PTR [rip+0x620d]        # 80aec0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804cb3:	4c 8b 40 44          	mov    r8,QWORD PTR [rax+0x44]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804cb7:	48 8b 05 02 62 00 00 	mov    rax,QWORD PTR [rip+0x6202]        # 80aec0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804cbe:	48 8b 78 3c          	mov    rdi,QWORD PTR [rax+0x3c]
            tss->ists[2],tss->ists[3],tss->ists[4],tss->ists[5],tss->ists[6]);
  804cc2:	48 8b 05 f7 61 00 00 	mov    rax,QWORD PTR [rip+0x61f7]        # 80aec0 <tss>
    set_tss(to->tss.rsp0,tss->rsp1,tss->rsp2,tss->ists[0],tss->ists[1],
  804cc9:	48 8b 58 34          	mov    rbx,QWORD PTR [rax+0x34]
  804ccd:	48 8b 05 ec 61 00 00 	mov    rax,QWORD PTR [rip+0x61ec]        # 80aec0 <tss>
  804cd4:	4c 8b 58 2c          	mov    r11,QWORD PTR [rax+0x2c]
  804cd8:	48 8b 05 e1 61 00 00 	mov    rax,QWORD PTR [rip+0x61e1]        # 80aec0 <tss>
  804cdf:	48 8b 48 24          	mov    rcx,QWORD PTR [rax+0x24]
  804ce3:	48 8b 05 d6 61 00 00 	mov    rax,QWORD PTR [rip+0x61d6]        # 80aec0 <tss>
  804cea:	48 8b 50 14          	mov    rdx,QWORD PTR [rax+0x14]
  804cee:	48 8b 05 cb 61 00 00 	mov    rax,QWORD PTR [rip+0x61cb]        # 80aec0 <tss>
  804cf5:	48 8b 70 0c          	mov    rsi,QWORD PTR [rax+0xc]
  804cf9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804cfd:	48 8b 80 c8 01 00 00 	mov    rax,QWORD PTR [rax+0x1c8]
  804d04:	41 52                	push   r10
  804d06:	41 51                	push   r9
  804d08:	41 50                	push   r8
  804d0a:	57                   	push   rdi
  804d0b:	49 89 d9             	mov    r9,rbx
  804d0e:	4d 89 d8             	mov    r8,r11
  804d11:	48 89 c7             	mov    rdi,rax
  804d14:	e8 33 00 00 00       	call   804d4c <set_tss>
  804d19:	48 83 c4 20          	add    rsp,0x20
    asm volatile("mov %%fs,%0\r\n"
  804d1d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  804d21:	48 8b 75 e0          	mov    rsi,QWORD PTR [rbp-0x20]
  804d25:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804d29:	48 8b 4d e8          	mov    rcx,QWORD PTR [rbp-0x18]
  804d2d:	8c a0 a8 02 00 00    	mov    WORD PTR [rax+0x2a8],fs
  804d33:	8c ae b0 02 00 00    	mov    WORD PTR [rsi+0x2b0],gs
  804d39:	8e a2 a8 02 00 00    	mov    fs,WORD PTR [rdx+0x2a8]
  804d3f:	8e a9 b0 02 00 00    	mov    gs,WORD PTR [rcx+0x2b0]
                 "mov %%gs,%1\r\n"
                 "mov %2,%%fs\r\n"
                 "mov %3,%%gs":"=m"(to->regs.fs),"=m"(to->regs.gs):
                 "m"(from->regs.fs),"m"(from->regs.gs));
}
  804d45:	90                   	nop
  804d46:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
  804d4a:	c9                   	leave  
  804d4b:	c3                   	ret    

0000000000804d4c <set_tss>:

void set_tss(u64 rsp0,u64 rsp1,u64 rsp2,u64 ist0,u64 ist1,u64 ist2,u64 ist3,u64 ist4,u64 ist5,u64 ist6){
  804d4c:	f3 0f 1e fa          	endbr64 
  804d50:	55                   	push   rbp
  804d51:	48 89 e5             	mov    rbp,rsp
  804d54:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804d58:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804d5c:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  804d60:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  804d64:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
  804d68:	4c 89 4d d0          	mov    QWORD PTR [rbp-0x30],r9
    tss->rsp0=rsp0;
  804d6c:	48 8b 05 4d 61 00 00 	mov    rax,QWORD PTR [rip+0x614d]        # 80aec0 <tss>
  804d73:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804d77:	48 89 50 04          	mov    QWORD PTR [rax+0x4],rdx
    tss->rsp1=rsp1;
  804d7b:	48 8b 05 3e 61 00 00 	mov    rax,QWORD PTR [rip+0x613e]        # 80aec0 <tss>
  804d82:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804d86:	48 89 50 0c          	mov    QWORD PTR [rax+0xc],rdx
    tss->rsp2=rsp2;
  804d8a:	48 8b 05 2f 61 00 00 	mov    rax,QWORD PTR [rip+0x612f]        # 80aec0 <tss>
  804d91:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  804d95:	48 89 50 14          	mov    QWORD PTR [rax+0x14],rdx
    tss->ists[0]=ist0;
  804d99:	48 8b 05 20 61 00 00 	mov    rax,QWORD PTR [rip+0x6120]        # 80aec0 <tss>
  804da0:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  804da4:	48 89 50 24          	mov    QWORD PTR [rax+0x24],rdx
    tss->ists[1]=ist1;
  804da8:	48 8b 05 11 61 00 00 	mov    rax,QWORD PTR [rip+0x6111]        # 80aec0 <tss>
  804daf:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  804db3:	48 89 50 2c          	mov    QWORD PTR [rax+0x2c],rdx
    tss->ists[2]=ist2;
  804db7:	48 8b 05 02 61 00 00 	mov    rax,QWORD PTR [rip+0x6102]        # 80aec0 <tss>
  804dbe:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  804dc2:	48 89 50 34          	mov    QWORD PTR [rax+0x34],rdx
    tss->ists[3]=ist3;
  804dc6:	48 8b 05 f3 60 00 00 	mov    rax,QWORD PTR [rip+0x60f3]        # 80aec0 <tss>
  804dcd:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
  804dd1:	48 89 50 3c          	mov    QWORD PTR [rax+0x3c],rdx
    tss->ists[4]=ist4;
  804dd5:	48 8b 05 e4 60 00 00 	mov    rax,QWORD PTR [rip+0x60e4]        # 80aec0 <tss>
  804ddc:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  804de0:	48 89 50 44          	mov    QWORD PTR [rax+0x44],rdx
    tss->ists[5]=ist5;
  804de4:	48 8b 05 d5 60 00 00 	mov    rax,QWORD PTR [rip+0x60d5]        # 80aec0 <tss>
  804deb:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  804def:	48 89 50 4c          	mov    QWORD PTR [rax+0x4c],rdx
    tss->ists[6]=ist6;
  804df3:	48 8b 05 c6 60 00 00 	mov    rax,QWORD PTR [rip+0x60c6]        # 80aec0 <tss>
  804dfa:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  804dfe:	48 89 50 54          	mov    QWORD PTR [rax+0x54],rdx
}
  804e02:	90                   	nop
  804e03:	5d                   	pop    rbp
  804e04:	c3                   	ret    
  804e05:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  804e0c:	00 00 00 
  804e0f:	90                   	nop

0000000000804e10 <outb>:
  804e10:	66 89 fa             	mov    dx,di
  804e13:	66 89 f0             	mov    ax,si
  804e16:	ee                   	out    dx,al
  804e17:	e8 29 00 00 00       	call   804e45 <io_delay>
  804e1c:	c3                   	ret    

0000000000804e1d <outw>:
  804e1d:	66 89 fa             	mov    dx,di
  804e20:	66 89 f0             	mov    ax,si
  804e23:	66 ef                	out    dx,ax
  804e25:	90                   	nop
  804e26:	90                   	nop
  804e27:	90                   	nop
  804e28:	c3                   	ret    

0000000000804e29 <inb>:
  804e29:	31 c0                	xor    eax,eax
  804e2b:	66 89 fa             	mov    dx,di
  804e2e:	ec                   	in     al,dx
  804e2f:	90                   	nop
  804e30:	90                   	nop
  804e31:	90                   	nop
  804e32:	c3                   	ret    

0000000000804e33 <inw>:
  804e33:	31 c0                	xor    eax,eax
  804e35:	66 89 fa             	mov    dx,di
  804e38:	66 ed                	in     ax,dx
  804e3a:	90                   	nop
  804e3b:	90                   	nop
  804e3c:	90                   	nop
  804e3d:	c3                   	ret    

0000000000804e3e <eoi>:
  804e3e:	b0 20                	mov    al,0x20
  804e40:	e6 a0                	out    0xa0,al
  804e42:	e6 20                	out    0x20,al
  804e44:	c3                   	ret    

0000000000804e45 <io_delay>:
  804e45:	90                   	nop
  804e46:	90                   	nop
  804e47:	90                   	nop
  804e48:	90                   	nop
  804e49:	c3                   	ret    

0000000000804e4a <turn_on_int>:
  804e4a:	b0 f8                	mov    al,0xf8
  804e4c:	e6 21                	out    0x21,al
  804e4e:	e8 f2 ff ff ff       	call   804e45 <io_delay>
  804e53:	b0 af                	mov    al,0xaf
  804e55:	e6 a1                	out    0xa1,al
  804e57:	e8 e9 ff ff ff       	call   804e45 <io_delay>
  804e5c:	b8 00 70 10 00       	mov    eax,0x107000
  804e61:	0f 01 18             	lidt   [rax]
  804e64:	90                   	nop
  804e65:	90                   	nop
  804e66:	90                   	nop
  804e67:	90                   	nop
  804e68:	fb                   	sti    
  804e69:	c3                   	ret    

0000000000804e6a <report_back_trace_of_err>:
  804e6a:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  804e6f:	50                   	push   rax
  804e70:	68 79 4e 80 00       	push   0x804e79
  804e75:	83 c4 08             	add    esp,0x8
  804e78:	c3                   	ret    

0000000000804e79 <bt_msg>:
  804e79:	65 72 72             	gs jb  804eee <fill_desc+0x4e>
  804e7c:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804e7d:	72 20                	jb     804e9f <init_gdt+0x11>
  804e7f:	6f                   	outs   dx,DWORD PTR ds:[rsi]
  804e80:	63 63 75             	movsxd esp,DWORD PTR [rbx+0x75]
  804e83:	72 73                	jb     804ef8 <fill_desc+0x58>
  804e85:	20 61 74             	and    BYTE PTR [rcx+0x74],ah
  804e88:	3a 25 78 5c 6e 00    	cmp    ah,BYTE PTR [rip+0x6e5c78]        # eeab06 <_knl_end+0x2eab06>

0000000000804e8e <init_gdt>:
#include "gdt.h"
#include "int.h"
descriptor *gdt=GDT_ADDR;
extern char *gdtptr;
int init_gdt()
{
  804e8e:	f3 0f 1e fa          	endbr64 
  804e92:	55                   	push   rbp
  804e93:	48 89 e5             	mov    rbp,rsp
//    fill_desc(0x108000,108,SEG_SYS_TSS|SEG_PRESENT,4);
    asm volatile("mov $0x48,%ax\r\n"
  804e96:	66 b8 48 00          	mov    ax,0x48
  804e9a:	0f 00 d8             	ltr    ax
                 "ltr %ax");  
}
  804e9d:	90                   	nop
  804e9e:	5d                   	pop    rbp
  804e9f:	c3                   	ret    

0000000000804ea0 <fill_desc>:
void fill_desc(u64 base, u64 limit, u16 attr, u32 index)
{
  804ea0:	f3 0f 1e fa          	endbr64 
  804ea4:	55                   	push   rbp
  804ea5:	48 89 e5             	mov    rbp,rsp
  804ea8:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  804eac:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  804eb0:	89 d0                	mov    eax,edx
  804eb2:	89 4d e8             	mov    DWORD PTR [rbp-0x18],ecx
  804eb5:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    gdt[index].base_12=base&0xffff;
  804eb9:	48 8b 15 08 60 00 00 	mov    rdx,QWORD PTR [rip+0x6008]        # 80aec8 <gdt>
  804ec0:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804ec3:	48 c1 e0 04          	shl    rax,0x4
  804ec7:	48 01 d0             	add    rax,rdx
  804eca:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  804ece:	66 89 50 02          	mov    WORD PTR [rax+0x2],dx
    gdt[index].base_3=(base>>16)&0xff;
  804ed2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ed6:	48 c1 e8 10          	shr    rax,0x10
  804eda:	48 89 c1             	mov    rcx,rax
  804edd:	48 8b 15 e4 5f 00 00 	mov    rdx,QWORD PTR [rip+0x5fe4]        # 80aec8 <gdt>
  804ee4:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804ee7:	48 c1 e0 04          	shl    rax,0x4
  804eeb:	48 01 d0             	add    rax,rdx
  804eee:	89 ca                	mov    edx,ecx
  804ef0:	88 50 04             	mov    BYTE PTR [rax+0x4],dl
    gdt[index].base_4=(base>>24)&0xff;
  804ef3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804ef7:	48 c1 e8 18          	shr    rax,0x18
  804efb:	48 89 c1             	mov    rcx,rax
  804efe:	48 8b 15 c3 5f 00 00 	mov    rdx,QWORD PTR [rip+0x5fc3]        # 80aec8 <gdt>
  804f05:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f08:	48 c1 e0 04          	shl    rax,0x4
  804f0c:	48 01 d0             	add    rax,rdx
  804f0f:	89 ca                	mov    edx,ecx
  804f11:	88 50 07             	mov    BYTE PTR [rax+0x7],dl
    gdt[index].base_5678=(base>>32)&0xffffffff;
  804f14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804f18:	48 c1 e8 20          	shr    rax,0x20
  804f1c:	48 89 c2             	mov    rdx,rax
  804f1f:	48 8b 0d a2 5f 00 00 	mov    rcx,QWORD PTR [rip+0x5fa2]        # 80aec8 <gdt>
  804f26:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f29:	48 c1 e0 04          	shl    rax,0x4
  804f2d:	48 01 c8             	add    rax,rcx
  804f30:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    gdt[index].limit_lo16=limit&0xffff;
  804f33:	48 8b 15 8e 5f 00 00 	mov    rdx,QWORD PTR [rip+0x5f8e]        # 80aec8 <gdt>
  804f3a:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  804f3d:	48 c1 e0 04          	shl    rax,0x4
  804f41:	48 01 d0             	add    rax,rdx
  804f44:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  804f48:	66 89 10             	mov    WORD PTR [rax],dx
    gdt[index].attr=attr|((limit>>8)&0xf0);
  804f4b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  804f4f:	48 c1 e8 08          	shr    rax,0x8
  804f53:	66 25 f0 00          	and    ax,0xf0
  804f57:	48 8b 0d 6a 5f 00 00 	mov    rcx,QWORD PTR [rip+0x5f6a]        # 80aec8 <gdt>
  804f5e:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804f61:	48 c1 e2 04          	shl    rdx,0x4
  804f65:	48 01 ca             	add    rdx,rcx
  804f68:	66 0b 45 ec          	or     ax,WORD PTR [rbp-0x14]
  804f6c:	66 89 42 05          	mov    WORD PTR [rdx+0x5],ax

}
  804f70:	90                   	nop
  804f71:	5d                   	pop    rbp
  804f72:	c3                   	ret    

0000000000804f73 <fill_gate>:

void fill_gate(u32 index,u32 offset,u16 selector,u16 attr)
{
  804f73:	f3 0f 1e fa          	endbr64 
  804f77:	55                   	push   rbp
  804f78:	48 89 e5             	mov    rbp,rsp
  804f7b:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  804f7e:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  804f81:	89 c8                	mov    eax,ecx
  804f83:	66 89 55 e4          	mov    WORD PTR [rbp-0x1c],dx
  804f87:	66 89 45 e0          	mov    WORD PTR [rbp-0x20],ax
    gate* ptr=gdt;
  804f8b:	48 8b 05 36 5f 00 00 	mov    rax,QWORD PTR [rip+0x5f36]        # 80aec8 <gdt>
  804f92:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    ptr[index].offset_low=offset&0xffff;
  804f96:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804f99:	48 c1 e0 04          	shl    rax,0x4
  804f9d:	48 89 c2             	mov    rdx,rax
  804fa0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fa4:	48 01 d0             	add    rax,rdx
  804fa7:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804faa:	66 89 10             	mov    WORD PTR [rax],dx
    ptr[index].offset_high=(offset>>16)&0xffff;
  804fad:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804fb0:	48 c1 e0 04          	shl    rax,0x4
  804fb4:	48 89 c2             	mov    rdx,rax
  804fb7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fbb:	48 01 d0             	add    rax,rdx
  804fbe:	8b 55 e8             	mov    edx,DWORD PTR [rbp-0x18]
  804fc1:	c1 ea 10             	shr    edx,0x10
  804fc4:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
    ptr[index].selector=selector;
  804fc7:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804fca:	48 c1 e0 04          	shl    rax,0x4
  804fce:	48 89 c2             	mov    rdx,rax
  804fd1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fd5:	48 01 c2             	add    rdx,rax
  804fd8:	0f b7 45 e4          	movzx  eax,WORD PTR [rbp-0x1c]
  804fdc:	66 89 42 02          	mov    WORD PTR [rdx+0x2],ax
    ptr[index].attr=attr;
  804fe0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  804fe3:	48 c1 e0 04          	shl    rax,0x4
  804fe7:	48 89 c2             	mov    rdx,rax
  804fea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  804fee:	48 01 c2             	add    rdx,rax
  804ff1:	0f b7 45 e0          	movzx  eax,WORD PTR [rbp-0x20]
  804ff5:	66 89 42 04          	mov    WORD PTR [rdx+0x4],ax
}
  804ff9:	90                   	nop
  804ffa:	5d                   	pop    rbp
  804ffb:	c3                   	ret    

0000000000804ffc <fill_ldt_desc>:

void fill_ldt_desc(u32 base, u32 limit,u16 attr,descriptor *desc)
{
  804ffc:	f3 0f 1e fa          	endbr64 
  805000:	55                   	push   rbp
  805001:	48 89 e5             	mov    rbp,rsp
  805004:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
  805007:	89 75 f8             	mov    DWORD PTR [rbp-0x8],esi
  80500a:	89 d0                	mov    eax,edx
  80500c:	48 89 4d e8          	mov    QWORD PTR [rbp-0x18],rcx
  805010:	66 89 45 f4          	mov    WORD PTR [rbp-0xc],ax
//    desc->base_lo16=base&0xffff;
//    desc->base_mid8=(base>>16)&0xff;
//    desc->base_hi8=(base>>24)&0xff;
//    desc->limit_lo16=limit&0xffff;
//    desc->attr=attr|(limit>>16&0xf)<<8;
  805014:	90                   	nop
  805015:	5d                   	pop    rbp
  805016:	c3                   	ret    
  805017:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
  80501e:	00 00 

0000000000805020 <fill_desc>:
  805020:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  805025:	67 8b 5c 24 08       	mov    ebx,DWORD PTR [esp+0x8]
  80502a:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  80502f:	67 8b 54 24 10       	mov    edx,DWORD PTR [esp+0x10]
  805034:	be 00 60 00 00       	mov    esi,0x6000
  805039:	c1 e2 03             	shl    edx,0x3
  80503c:	01 d6                	add    esi,edx
  80503e:	66 67 89 1e          	mov    WORD PTR [esi],bx
  805042:	66 67 89 46 02       	mov    WORD PTR [esi+0x2],ax
  805047:	c1 e8 10             	shr    eax,0x10
  80504a:	67 88 46 04          	mov    BYTE PTR [esi+0x4],al
  80504e:	c1 eb 10             	shr    ebx,0x10
  805051:	67 88 5e 06          	mov    BYTE PTR [esi+0x6],bl
  805055:	67 88 66 07          	mov    BYTE PTR [esi+0x7],ah
  805059:	67 09 4e 05          	or     DWORD PTR [esi+0x5],ecx
  80505d:	c3                   	ret    

000000000080505e <clock_c>:
#include <devman.h>
#include <disk.h>
extern int manage_proc_lock;
extern int cur_proc;
extern struct process *task;
void clock_c(){
  80505e:	f3 0f 1e fa          	endbr64 
  805062:	55                   	push   rbp
  805063:	48 89 e5             	mov    rbp,rsp
    //refresh_wnds();
    execute_request();
  805066:	b8 00 00 00 00       	mov    eax,0x0
  80506b:	e8 3a 1b 00 00       	call   806baa <execute_request>
    do_req();
  805070:	b8 00 00 00 00       	mov    eax,0x0
  805075:	e8 8a e7 ff ff       	call   803804 <do_req>
    if(!manage_proc_lock)
  80507a:	8b 05 e8 5d 00 00    	mov    eax,DWORD PTR [rip+0x5de8]        # 80ae68 <manage_proc_lock>
  805080:	85 c0                	test   eax,eax
  805082:	75 0a                	jne    80508e <clock_c+0x30>
    {
        manage_proc();
  805084:	b8 00 00 00 00       	mov    eax,0x0
  805089:	e8 98 ee ff ff       	call   803f26 <manage_proc>
    }
    //puts("1 disk req executed.");
  80508e:	90                   	nop
  80508f:	5d                   	pop    rbp
  805090:	c3                   	ret    
  805091:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  805098:	00 00 00 
  80509b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]

00000000008050a0 <clock>:
  8050a0:	50                   	push   rax
  8050a1:	53                   	push   rbx
  8050a2:	51                   	push   rcx
  8050a3:	52                   	push   rdx
  8050a4:	57                   	push   rdi
  8050a5:	56                   	push   rsi
  8050a6:	41 50                	push   r8
  8050a8:	41 51                	push   r9
  8050aa:	41 52                	push   r10
  8050ac:	41 53                	push   r11
  8050ae:	41 54                	push   r12
  8050b0:	41 55                	push   r13
  8050b2:	41 56                	push   r14
  8050b4:	41 57                	push   r15
  8050b6:	66 8c c0             	mov    ax,es
  8050b9:	66 50                	push   ax
  8050bb:	66 8c d8             	mov    ax,ds
  8050be:	66 50                	push   ax
  8050c0:	66 b8 10 00          	mov    ax,0x10
  8050c4:	8e c0                	mov    es,eax
  8050c6:	8e d8                	mov    ds,eax

00000000008050c8 <clock.normal_part>:
  8050c8:	b0 20                	mov    al,0x20
  8050ca:	e6 a0                	out    0xa0,al
  8050cc:	e6 20                	out    0x20,al
  8050ce:	e8 8b ff ff ff       	call   80505e <clock_c>
  8050d3:	66 58                	pop    ax
  8050d5:	8e d8                	mov    ds,eax
  8050d7:	66 58                	pop    ax
  8050d9:	8e c0                	mov    es,eax
  8050db:	41 5f                	pop    r15
  8050dd:	41 5e                	pop    r14
  8050df:	41 5d                	pop    r13
  8050e1:	41 5c                	pop    r12
  8050e3:	41 5b                	pop    r11
  8050e5:	41 5a                	pop    r10
  8050e7:	41 59                	pop    r9
  8050e9:	41 58                	pop    r8
  8050eb:	5e                   	pop    rsi
  8050ec:	5f                   	pop    rdi
  8050ed:	5a                   	pop    rdx
  8050ee:	59                   	pop    rcx
  8050ef:	5b                   	pop    rbx
  8050f0:	58                   	pop    rax
  8050f1:	48 cf                	iretq  

00000000008050f3 <execute>:
    return ind;
}
*/

int execute(char *path)
{
  8050f3:	f3 0f 1e fa          	endbr64 
  8050f7:	55                   	push   rbp
  8050f8:	48 89 e5             	mov    rbp,rsp
  8050fb:	48 83 ec 30          	sub    rsp,0x30
  8050ff:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    //尚未切换到目标进程
    //syscall(SYSCALL_REG_PROC, load_pe,0,0,0,0);
    int fno=-1,cwd_fno=-1;
  805103:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [rbp-0x14],0xffffffff
  80510a:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
    if((fno=sys_open(path, 1)) == -1)return -1;
  805111:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805115:	be 01 00 00 00       	mov    esi,0x1
  80511a:	48 89 c7             	mov    rdi,rax
  80511d:	e8 e6 ca ff ff       	call   801c08 <sys_open>
  805122:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  805125:	83 7d ec ff          	cmp    DWORD PTR [rbp-0x14],0xffffffff
  805129:	75 0a                	jne    805135 <execute+0x42>
  80512b:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805130:	e9 b7 00 00 00       	jmp    8051ec <execute+0xf9>
    //
    char *p=path;
  805135:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805139:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;*p!='\0';p++);
  80513d:	eb 05                	jmp    805144 <execute+0x51>
  80513f:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
  805144:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805148:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80514b:	84 c0                	test   al,al
  80514d:	75 f0                	jne    80513f <execute+0x4c>
    for(;*p!='/'&&p>path;p--);
  80514f:	eb 05                	jmp    805156 <execute+0x63>
  805151:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
  805156:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80515a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80515d:	3c 2f                	cmp    al,0x2f
  80515f:	74 0a                	je     80516b <execute+0x78>
  805161:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805165:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805169:	77 e6                	ja     805151 <execute+0x5e>
    if(p>path)
  80516b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80516f:	48 3b 45 d8          	cmp    rax,QWORD PTR [rbp-0x28]
  805173:	76 2f                	jbe    8051a4 <execute+0xb1>
    {
        *p='\0';
  805175:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805179:	c6 00 00             	mov    BYTE PTR [rax],0x0
        if((cwd_fno=sys_open(path, 1)) == -1)return -1;
  80517c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805180:	be 01 00 00 00       	mov    esi,0x1
  805185:	48 89 c7             	mov    rdi,rax
  805188:	e8 7b ca ff ff       	call   801c08 <sys_open>
  80518d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805190:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  805194:	75 07                	jne    80519d <execute+0xaa>
  805196:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80519b:	eb 4f                	jmp    8051ec <execute+0xf9>
        *p='/';
  80519d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8051a1:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
    }
    extern vfs_dir_entry opened[];
    extern struct process task[];
    int pi= reg_proc(proc_start, &opened[cwd_fno], &opened[fno]);
  8051a4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8051a7:	48 63 d0             	movsxd rdx,eax
  8051aa:	48 89 d0             	mov    rax,rdx
  8051ad:	48 01 c0             	add    rax,rax
  8051b0:	48 01 d0             	add    rax,rdx
  8051b3:	48 c1 e0 05          	shl    rax,0x5
  8051b7:	48 8d 90 60 06 40 00 	lea    rdx,[rax+0x400660]
  8051be:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8051c1:	48 63 c8             	movsxd rcx,eax
  8051c4:	48 89 c8             	mov    rax,rcx
  8051c7:	48 01 c0             	add    rax,rax
  8051ca:	48 01 c8             	add    rax,rcx
  8051cd:	48 c1 e0 05          	shl    rax,0x5
  8051d1:	48 05 60 06 40 00    	add    rax,0x400660
  8051d7:	b9 64 52 80 00       	mov    ecx,0x805264
  8051dc:	48 89 c6             	mov    rsi,rax
  8051df:	89 cf                	mov    edi,ecx
  8051e1:	e8 0a f6 ff ff       	call   8047f0 <reg_proc>
  8051e6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
    return pi;
  8051e9:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
}
  8051ec:	c9                   	leave  
  8051ed:	c3                   	ret    

00000000008051ee <exec_call>:

int exec_call(char *path)
{
  8051ee:	f3 0f 1e fa          	endbr64 
  8051f2:	55                   	push   rbp
  8051f3:	48 89 e5             	mov    rbp,rsp
  8051f6:	48 83 ec 20          	sub    rsp,0x20
  8051fa:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pi=execute(path);
  8051fe:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805202:	48 89 c7             	mov    rdi,rax
  805205:	e8 e9 fe ff ff       	call   8050f3 <execute>
  80520a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int tss= _TSS_IND(pi)*8;
  80520d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805210:	01 c0                	add    eax,eax
  805212:	83 c0 05             	add    eax,0x5
  805215:	c1 e0 03             	shl    eax,0x3
  805218:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    extern struct process task[];
    extern int cur_proc;
    switch_proc_tss(pi);
  80521b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80521e:	89 c7                	mov    edi,eax
  805220:	e8 cd ee ff ff       	call   8040f2 <switch_proc_tss>
    while(task[pi].stat!=ENDED);
  805225:	90                   	nop
  805226:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805229:	48 63 d0             	movsxd rdx,eax
  80522c:	48 89 d0             	mov    rax,rdx
  80522f:	48 01 c0             	add    rax,rax
  805232:	48 01 d0             	add    rax,rdx
  805235:	48 c1 e0 08          	shl    rax,0x8
  805239:	48 05 a0 84 40 00    	add    rax,0x4084a0
  80523f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805242:	83 f8 03             	cmp    eax,0x3
  805245:	75 df                	jne    805226 <exec_call+0x38>
    return task[pi].exit_code;
  805247:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80524a:	48 63 d0             	movsxd rdx,eax
  80524d:	48 89 d0             	mov    rax,rdx
  805250:	48 01 c0             	add    rax,rax
  805253:	48 01 d0             	add    rax,rdx
  805256:	48 c1 e0 08          	shl    rax,0x8
  80525a:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805260:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805262:	c9                   	leave  
  805263:	c3                   	ret    

0000000000805264 <proc_start>:
int proc_start()
{
  805264:	f3 0f 1e fa          	endbr64 
  805268:	55                   	push   rbp
  805269:	48 89 e5             	mov    rbp,rsp
    extern struct process task[];
    extern int cur_proc;
    load_pe(&task[cur_proc]);
  80526c:	8b 05 9a f2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f29a]        # 41450c <cur_proc>
  805272:	48 63 d0             	movsxd rdx,eax
  805275:	48 89 d0             	mov    rax,rdx
  805278:	48 01 c0             	add    rax,rax
  80527b:	48 01 d0             	add    rax,rdx
  80527e:	48 c1 e0 08          	shl    rax,0x8
  805282:	48 05 a0 84 40 00    	add    rax,0x4084a0
  805288:	48 89 c7             	mov    rdi,rax
  80528b:	e8 1a 00 00 00       	call   8052aa <load_pe>
    //释放进程资源
    del_proc(cur_proc);
  805290:	8b 05 76 f2 c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0f276]        # 41450c <cur_proc>
  805296:	89 c7                	mov    edi,eax
  805298:	e8 25 f3 ff ff       	call   8045c2 <del_proc>
    switch_proc_tss(0);
  80529d:	bf 00 00 00 00       	mov    edi,0x0
  8052a2:	e8 4b ee ff ff       	call   8040f2 <switch_proc_tss>
}
  8052a7:	90                   	nop
  8052a8:	5d                   	pop    rbp
  8052a9:	c3                   	ret    

00000000008052aa <load_pe>:
//在cr3切换到目标进程下的加载程序(但进程还没调度到那里)。
int load_pe(struct process *proc)
{
  8052aa:	f3 0f 1e fa          	endbr64 
  8052ae:	55                   	push   rbp
  8052af:	48 89 e5             	mov    rbp,rsp
  8052b2:	48 81 ec c0 02 00 00 	sub    rsp,0x2c0
  8052b9:	48 89 bd 48 fd ff ff 	mov    QWORD PTR [rbp-0x2b8],rdi
    // 读取文件头
    vfs_dir_entry *f=proc->exef;
  8052c0:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  8052c7:	48 8b 80 bc 00 00 00 	mov    rax,QWORD PTR [rax+0xbc]
  8052ce:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
    int exefno=f->fno;
  8052d2:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8052d6:	8b 00                	mov    eax,DWORD PTR [rax]
  8052d8:	89 45 94             	mov    DWORD PTR [rbp-0x6c],eax

    IMAGE_DOS_HEADER tdh;
    IMAGE_NT_HEADERS32 tnth;
    sys_read(exefno, &tdh, sizeof(tdh));
  8052db:	48 8d 8d 70 fe ff ff 	lea    rcx,[rbp-0x190]
  8052e2:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8052e5:	ba 44 00 00 00       	mov    edx,0x44
  8052ea:	48 89 ce             	mov    rsi,rcx
  8052ed:	89 c7                	mov    edi,eax
  8052ef:	e8 f3 ce ff ff       	call   8021e7 <sys_read>
    sys_seek(exefno,tdh.e_lfanew,SEEK_SET);
  8052f4:	48 8b 85 ac fe ff ff 	mov    rax,QWORD PTR [rbp-0x154]
  8052fb:	89 c1                	mov    ecx,eax
  8052fd:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805300:	ba 00 00 00 00       	mov    edx,0x0
  805305:	89 ce                	mov    esi,ecx
  805307:	89 c7                	mov    edi,eax
  805309:	e8 6a cf ff ff       	call   802278 <sys_seek>
    sys_read(exefno, &tnth, sizeof(tnth));
  80530e:	48 8d 8d 70 fd ff ff 	lea    rcx,[rbp-0x290]
  805315:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  805318:	ba f8 00 00 00       	mov    edx,0xf8
  80531d:	48 89 ce             	mov    rsi,rcx
  805320:	89 c7                	mov    edi,eax
  805322:	e8 c0 ce ff ff       	call   8021e7 <sys_read>

    //是否需要移动base(先不检查)
    unsigned int nbase=tnth.OptionalHeader.ImageBase;
  805327:	8b 85 a4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x25c]
  80532d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    int pgn=tnth.OptionalHeader.SizeOfImage/PAGE_SIZE;
  805330:	8b 85 c0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x240]
  805336:	c1 e8 0c             	shr    eax,0xc
  805339:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
    //use_pgm_ava检查在页表中这个范围是否可用，可用就使用
    while(1)
    {
        cont:
        ;
        int pdei=nbase/PAGE_INDEX_SIZE;
  80533c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80533f:	c1 e8 16             	shr    eax,0x16
  805342:	89 45 8c             	mov    DWORD PTR [rbp-0x74],eax
        int ptei=nbase%PAGE_INDEX_SIZE/PAGE_SIZE;
  805345:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805348:	25 ff ff 3f 00       	and    eax,0x3fffff
  80534d:	c1 e8 0c             	shr    eax,0xc
  805350:	89 45 88             	mov    DWORD PTR [rbp-0x78],eax
        int *pt=(proc->pml4[pdei]&0xfffff000);
  805353:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  80535a:	48 8b 90 ac 00 00 00 	mov    rdx,QWORD PTR [rax+0xac]
  805361:	8b 45 8c             	mov    eax,DWORD PTR [rbp-0x74]
  805364:	48 98                	cdqe   
  805366:	48 c1 e0 03          	shl    rax,0x3
  80536a:	48 01 d0             	add    rax,rdx
  80536d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  805370:	25 00 f0 ff ff       	and    eax,0xfffff000
  805375:	48 89 45 80          	mov    QWORD PTR [rbp-0x80],rax
        for(int i=0;i<pgn;i++)
  805379:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805380:	eb 48                	jmp    8053ca <load_pe+0x120>
        {
            if(pt[ptei+i%1024]&PAGE_PRESENT&&pt!=NULL)
  805382:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  805385:	99                   	cdq    
  805386:	c1 ea 16             	shr    edx,0x16
  805389:	01 d0                	add    eax,edx
  80538b:	25 ff 03 00 00       	and    eax,0x3ff
  805390:	29 d0                	sub    eax,edx
  805392:	89 c2                	mov    edx,eax
  805394:	8b 45 88             	mov    eax,DWORD PTR [rbp-0x78]
  805397:	01 d0                	add    eax,edx
  805399:	48 98                	cdqe   
  80539b:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  8053a2:	00 
  8053a3:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  8053a7:	48 01 d0             	add    rax,rdx
  8053aa:	8b 00                	mov    eax,DWORD PTR [rax]
  8053ac:	83 e0 01             	and    eax,0x1
  8053af:	85 c0                	test   eax,eax
  8053b1:	74 13                	je     8053c6 <load_pe+0x11c>
  8053b3:	48 83 7d 80 00       	cmp    QWORD PTR [rbp-0x80],0x0
  8053b8:	74 0c                	je     8053c6 <load_pe+0x11c>
            {
                //移动base
                nbase+=0x1000;
  8053ba:	81 45 fc 00 10 00 00 	add    DWORD PTR [rbp-0x4],0x1000
                goto cont;
  8053c1:	e9 76 ff ff ff       	jmp    80533c <load_pe+0x92>
        for(int i=0;i<pgn;i++)
  8053c6:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  8053ca:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  8053cd:	3b 45 90             	cmp    eax,DWORD PTR [rbp-0x70]
  8053d0:	7c b0                	jl     805382 <load_pe+0xd8>
            }
        }
        break;
  8053d2:	90                   	nop
    }

    //proc->tss.eip=tnth.OptionalHeader.AddressOfEntryPoint+nbase;
    //存放文件头
    sys_seek(exefno,0,SEEK_SET);
  8053d3:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8053d6:	ba 00 00 00 00       	mov    edx,0x0
  8053db:	be 00 00 00 00       	mov    esi,0x0
  8053e0:	89 c7                	mov    edi,eax
  8053e2:	e8 91 ce ff ff       	call   802278 <sys_seek>
    sys_read(exefno, nbase, PAGE_SIZE);
  8053e7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8053ea:	48 89 c1             	mov    rcx,rax
  8053ed:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8053f0:	ba 00 10 00 00       	mov    edx,0x1000
  8053f5:	48 89 ce             	mov    rsi,rcx
  8053f8:	89 c7                	mov    edi,eax
  8053fa:	e8 e8 cd ff ff       	call   8021e7 <sys_read>
    //dos头
    PIMAGE_DOS_HEADER dosh=nbase;
  8053ff:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805402:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
    PIMAGE_NT_HEADERS32 nth=nbase+dosh->e_lfanew;
  805409:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80540c:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  805413:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  805417:	48 01 d0             	add    rax,rdx
  80541a:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
    PIMAGE_FILE_HEADER fh=&nth->FileHeader;
  805421:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805428:	48 83 c0 04          	add    rax,0x4
  80542c:	48 89 85 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rax
    //为新进程分配内存页
    //计算所需的页
    int prog_size=nth->OptionalHeader.SizeOfImage;
  805433:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80543a:	8b 40 50             	mov    eax,DWORD PTR [rax+0x50]
  80543d:	89 85 64 ff ff ff    	mov    DWORD PTR [rbp-0x9c],eax
    int page_count=prog_size/4096;
  805443:	8b 85 64 ff ff ff    	mov    eax,DWORD PTR [rbp-0x9c]
  805449:	8d 90 ff 0f 00 00    	lea    edx,[rax+0xfff]
  80544f:	85 c0                	test   eax,eax
  805451:	0f 48 c2             	cmovs  eax,edx
  805454:	c1 f8 0c             	sar    eax,0xc
  805457:	89 85 60 ff ff ff    	mov    DWORD PTR [rbp-0xa0],eax

    int shell_addr=nth->OptionalHeader.AddressOfEntryPoint+nbase;
  80545d:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805464:	8b 50 28             	mov    edx,DWORD PTR [rax+0x28]
  805467:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80546a:	01 d0                	add    eax,edx
  80546c:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
    int page_index_item_count=page_count/1024+page_count%1024==0?0:1;
  805472:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  805478:	8d 90 ff 03 00 00    	lea    edx,[rax+0x3ff]
  80547e:	85 c0                	test   eax,eax
  805480:	0f 48 c2             	cmovs  eax,edx
  805483:	c1 f8 0a             	sar    eax,0xa
  805486:	89 c1                	mov    ecx,eax
  805488:	8b 85 60 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa0]
  80548e:	99                   	cdq    
  80548f:	c1 ea 16             	shr    edx,0x16
  805492:	01 d0                	add    eax,edx
  805494:	25 ff 03 00 00       	and    eax,0x3ff
  805499:	29 d0                	sub    eax,edx
  80549b:	01 c8                	add    eax,ecx
  80549d:	85 c0                	test   eax,eax
  80549f:	0f 95 c0             	setne  al
  8054a2:	0f b6 c0             	movzx  eax,al
  8054a5:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
    int start_pgind_item=shell_addr/PAGE_INDEX_SIZE;
  8054ab:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8054b1:	8d 90 ff ff 3f 00    	lea    edx,[rax+0x3fffff]
  8054b7:	85 c0                	test   eax,eax
  8054b9:	0f 48 c2             	cmovs  eax,edx
  8054bc:	c1 f8 16             	sar    eax,0x16
  8054bf:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax

    //sys_read sections
    PIMAGE_SECTION_HEADER psec=(u32)nth+sizeof(IMAGE_NT_HEADERS32);
  8054c5:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8054cc:	89 c0                	mov    eax,eax
  8054ce:	48 05 f8 00 00 00    	add    rax,0xf8
  8054d4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
    nth->FileHeader.NumberOfSections*sizeof(IMAGE_SECTION_HEADER);
  8054d8:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8054df:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  8054e3:	0f b7 d0             	movzx  edx,ax
  8054e6:	89 d0                	mov    eax,edx
  8054e8:	c1 e0 02             	shl    eax,0x2
  8054eb:	01 d0                	add    eax,edx
  8054ed:	c1 e0 03             	shl    eax,0x3
    int data_start=sizeof(IMAGE_DOS_HEADER)+sizeof(IMAGE_NT_HEADERS32)+\
  8054f0:	05 3c 01 00 00       	add    eax,0x13c
  8054f5:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    int align=nth->OptionalHeader.FileAlignment;
  8054fb:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805502:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
  805505:	89 85 4c ff ff ff    	mov    DWORD PTR [rbp-0xb4],eax
    data_start=data_start%align?data_start-data_start%align+align:data_start;
  80550b:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805511:	99                   	cdq    
  805512:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  805518:	89 d0                	mov    eax,edx
  80551a:	85 c0                	test   eax,eax
  80551c:	74 23                	je     805541 <load_pe+0x297>
  80551e:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805524:	99                   	cdq    
  805525:	f7 bd 4c ff ff ff    	idiv   DWORD PTR [rbp-0xb4]
  80552b:	89 d1                	mov    ecx,edx
  80552d:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805533:	29 c8                	sub    eax,ecx
  805535:	89 c2                	mov    edx,eax
  805537:	8b 85 4c ff ff ff    	mov    eax,DWORD PTR [rbp-0xb4]
  80553d:	01 d0                	add    eax,edx
  80553f:	eb 06                	jmp    805547 <load_pe+0x29d>
  805541:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  805547:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  80554d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805554:	eb 68                	jmp    8055be <load_pe+0x314>
    {
        int disca=psec->Characteristics&IMAGE_SCN_MEM_DISCARDABLE;
  805556:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80555a:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  80555d:	25 00 00 00 02       	and    eax,0x2000000
  805562:	89 85 bc fe ff ff    	mov    DWORD PTR [rbp-0x144],eax
        if(disca)
  805568:	83 bd bc fe ff ff 00 	cmp    DWORD PTR [rbp-0x144],0x0
  80556f:	75 43                	jne    8055b4 <load_pe+0x30a>
            continue;
        //直接读，缺页内核解决
        sys_seek(exefno,psec->PointerToRawData,SEEK_SET);
  805571:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805575:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805578:	89 c1                	mov    ecx,eax
  80557a:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  80557d:	ba 00 00 00 00       	mov    edx,0x0
  805582:	89 ce                	mov    esi,ecx
  805584:	89 c7                	mov    edi,eax
  805586:	e8 ed cc ff ff       	call   802278 <sys_seek>
        sys_read(exefno, psec->VirtualAddress + nbase,  psec->SizeOfRawData);
  80558b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80558f:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805592:	89 c2                	mov    edx,eax
  805594:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805598:	8b 48 0c             	mov    ecx,DWORD PTR [rax+0xc]
  80559b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80559e:	01 c8                	add    eax,ecx
  8055a0:	89 c0                	mov    eax,eax
  8055a2:	48 89 c1             	mov    rcx,rax
  8055a5:	8b 45 94             	mov    eax,DWORD PTR [rbp-0x6c]
  8055a8:	48 89 ce             	mov    rsi,rcx
  8055ab:	89 c7                	mov    edi,eax
  8055ad:	e8 35 cc ff ff       	call   8021e7 <sys_read>
  8055b2:	eb 01                	jmp    8055b5 <load_pe+0x30b>
            continue;
  8055b4:	90                   	nop
    for(int i=0;i<nth->FileHeader.NumberOfSections;i++,psec++)
  8055b5:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  8055b9:	48 83 45 f0 28       	add    QWORD PTR [rbp-0x10],0x28
  8055be:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8055c5:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
  8055c9:	0f b7 c0             	movzx  eax,ax
  8055cc:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  8055cf:	7c 85                	jl     805556 <load_pe+0x2ac>

    }

    //通过导入表加载需要的dll
    PIMAGE_DATA_DIRECTORY impd=&nth->OptionalHeader.DataDirectory[1];
  8055d1:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8055d8:	48 83 e8 80          	sub    rax,0xffffffffffffff80
  8055dc:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    if(impd->Size>0)
  8055e3:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  8055ea:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  8055ed:	85 c0                	test   eax,eax
  8055ef:	0f 84 71 02 00 00    	je     805866 <load_pe+0x5bc>
    {
        int tmpi=impd->VirtualAddress+nbase;
  8055f5:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  8055fc:	8b 10                	mov    edx,DWORD PTR [rax]
  8055fe:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805601:	01 d0                	add    eax,edx
  805603:	89 85 3c ff ff ff    	mov    DWORD PTR [rbp-0xc4],eax
        PIMAGE_IMPORT_DESCRIPTOR impdes=tmpi;
  805609:	8b 85 3c ff ff ff    	mov    eax,DWORD PTR [rbp-0xc4]
  80560f:	48 98                	cdqe   
  805611:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        int dllp;
        while (impdes->Characteristics)
  805615:	e9 3e 02 00 00       	jmp    805858 <load_pe+0x5ae>
        {
            //加载dll
            char *dllname=impdes->Name+nbase;
  80561a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80561e:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
  805621:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805624:	01 d0                	add    eax,edx
  805626:	89 c0                	mov    eax,eax
  805628:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
            //此处应有加载dll代码
            int dlli;
            if(strcmp(dllname,"sys.dll")==0)//加载系统dll的部分由内核已经完成
  80562f:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  805636:	be a8 2a 81 00       	mov    esi,0x812aa8
  80563b:	48 89 c7             	mov    rdi,rax
  80563e:	e8 12 51 00 00       	call   80a755 <strcmp>
  805643:	85 c0                	test   eax,eax
  805645:	75 09                	jne    805650 <load_pe+0x3a6>
            {
                dllp=0x1c00000;
  805647:	c7 45 dc 00 00 c0 01 	mov    DWORD PTR [rbp-0x24],0x1c00000
  80564e:	eb 25                	jmp    805675 <load_pe+0x3cb>
            }else{
                //load_pe要记录module的加载
                dlli= load_pe(proc);
  805650:	48 8b 85 48 fd ff ff 	mov    rax,QWORD PTR [rbp-0x2b8]
  805657:	48 89 c7             	mov    rdi,rax
  80565a:	e8 4b fc ff ff       	call   8052aa <load_pe>
  80565f:	89 85 2c ff ff ff    	mov    DWORD PTR [rbp-0xd4],eax
                //dlli=load_library(dllname);
                //这个是线性地址
                dllp=get_module_addr(dlli);
  805665:	8b 85 2c ff ff ff    	mov    eax,DWORD PTR [rbp-0xd4]
  80566b:	89 c7                	mov    edi,eax
  80566d:	e8 e4 03 00 00       	call   805a56 <get_module_addr>
  805672:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
            }
            //从线性地址查页表找到物理地址
            PIMAGE_DOS_HEADER dlldos=dllp;
  805675:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805678:	48 98                	cdqe   
  80567a:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
            PIMAGE_NT_HEADERS32 dllnth=dllp+dlldos->e_lfanew;
  805681:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805684:	48 63 d0             	movsxd rdx,eax
  805687:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  80568e:	48 8b 40 3c          	mov    rax,QWORD PTR [rax+0x3c]
  805692:	48 01 d0             	add    rax,rdx
  805695:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
            PIMAGE_EXPORT_DIRECTORY dllexp=(dllnth->OptionalHeader.DataDirectory[0].VirtualAddress+dllp);
  80569c:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  8056a3:	8b 50 78             	mov    edx,DWORD PTR [rax+0x78]
  8056a6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8056a9:	01 d0                	add    eax,edx
  8056ab:	89 c0                	mov    eax,eax
  8056ad:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
            int funcn=dllexp->NumberOfNames;
  8056b4:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8056bb:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  8056be:	89 85 0c ff ff ff    	mov    DWORD PTR [rbp-0xf4],eax
            char **fnames=dllexp->AddressOfNames+dllp;
  8056c4:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8056cb:	8b 50 20             	mov    edx,DWORD PTR [rax+0x20]
  8056ce:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8056d1:	01 d0                	add    eax,edx
  8056d3:	89 c0                	mov    eax,eax
  8056d5:	48 89 85 00 ff ff ff 	mov    QWORD PTR [rbp-0x100],rax
            int *funcaddrs=dllexp->AddressOfFunctions+dllp;
  8056dc:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8056e3:	8b 50 1c             	mov    edx,DWORD PTR [rax+0x1c]
  8056e6:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  8056e9:	01 d0                	add    eax,edx
  8056eb:	89 c0                	mov    eax,eax
  8056ed:	48 89 85 f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rax
            short *funcords=dllexp->AddressOfNameOrdinals+dllp;
  8056f4:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  8056fb:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8056fe:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805701:	01 d0                	add    eax,edx
  805703:	89 c0                	mov    eax,eax
  805705:	48 89 85 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rax
            //寻找nameordinal的base（最小值），里面的数据加上base才是真正的序号
            unsigned int ord_base=dllexp->Base;
  80570c:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  805713:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805716:	89 85 ec fe ff ff    	mov    DWORD PTR [rbp-0x114],eax
            //开始将导入表IAT的内容更新为函数地址
            unsigned int *iataddrs=impdes->FirstThunk+nbase;//IAT和INT内容一样，只用IAT
  80571c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805720:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  805723:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805726:	01 d0                	add    eax,edx
  805728:	89 c0                	mov    eax,eax
  80572a:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
            char **siataddrs=impdes->FirstThunk+nbase;
  80572e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805732:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
  805735:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805738:	01 d0                	add    eax,edx
  80573a:	89 c0                	mov    eax,eax
  80573c:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
            while (*iataddrs)
  805740:	e9 00 01 00 00       	jmp    805845 <load_pe+0x59b>
            {
                //判断是序号导入还是名称导入
                if(((unsigned)*iataddrs)&0x80000000)
  805745:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805749:	8b 00                	mov    eax,DWORD PTR [rax]
  80574b:	85 c0                	test   eax,eax
  80574d:	79 43                	jns    805792 <load_pe+0x4e8>
                {
                    //序号导入
                    unsigned int ord=((*iataddrs)&0x7fffffff)-ord_base;
  80574f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805753:	8b 00                	mov    eax,DWORD PTR [rax]
  805755:	25 ff ff ff 7f       	and    eax,0x7fffffff
  80575a:	2b 85 ec fe ff ff    	sub    eax,DWORD PTR [rbp-0x114]
  805760:	89 85 d8 fe ff ff    	mov    DWORD PTR [rbp-0x128],eax
                    *iataddrs=funcaddrs[ord]+dllp;
  805766:	8b 85 d8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x128]
  80576c:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  805773:	00 
  805774:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80577b:	48 01 d0             	add    rax,rdx
  80577e:	8b 10                	mov    edx,DWORD PTR [rax]
  805780:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805783:	01 d0                	add    eax,edx
  805785:	89 c2                	mov    edx,eax
  805787:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80578b:	89 10                	mov    DWORD PTR [rax],edx
  80578d:	e9 a9 00 00 00       	jmp    80583b <load_pe+0x591>
                }else
                {
                    //名称导入
                    char *import_by_name_p=*iataddrs;//指向IMPORT_BY_NAME
  805792:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805796:	8b 00                	mov    eax,DWORD PTR [rax]
  805798:	89 c0                	mov    eax,eax
  80579a:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
                    import_by_name_p+=2;//跳过开头两字节序号
  8057a1:	48 83 85 e0 fe ff ff 	add    QWORD PTR [rbp-0x120],0x2
  8057a8:	02 
                    int i=0;
  8057a9:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
                    for(;i<funcn;i++)
  8057b0:	eb 7a                	jmp    80582c <load_pe+0x582>
                    {
                        if(strcmp(import_by_name_p,fnames[i])==0)
  8057b2:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8057b5:	48 98                	cdqe   
  8057b7:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
  8057be:	00 
  8057bf:	48 8b 85 00 ff ff ff 	mov    rax,QWORD PTR [rbp-0x100]
  8057c6:	48 01 d0             	add    rax,rdx
  8057c9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8057cc:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
  8057d3:	48 89 d6             	mov    rsi,rdx
  8057d6:	48 89 c7             	mov    rdi,rax
  8057d9:	e8 77 4f 00 00       	call   80a755 <strcmp>
  8057de:	85 c0                	test   eax,eax
  8057e0:	75 46                	jne    805828 <load_pe+0x57e>
                        {
                            int ordi=funcords[i];
  8057e2:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  8057e5:	48 98                	cdqe   
  8057e7:	48 8d 14 00          	lea    rdx,[rax+rax*1]
  8057eb:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  8057f2:	48 01 d0             	add    rax,rdx
  8057f5:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8057f8:	98                   	cwde   
  8057f9:	89 85 dc fe ff ff    	mov    DWORD PTR [rbp-0x124],eax
                            *iataddrs=funcaddrs[ordi]+dllp;//导入表中的IAT内容修改成地址
  8057ff:	8b 85 dc fe ff ff    	mov    eax,DWORD PTR [rbp-0x124]
  805805:	48 98                	cdqe   
  805807:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  80580e:	00 
  80580f:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  805816:	48 01 d0             	add    rax,rdx
  805819:	8b 10                	mov    edx,DWORD PTR [rax]
  80581b:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  80581e:	01 d0                	add    eax,edx
  805820:	89 c2                	mov    edx,eax
  805822:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805826:	89 10                	mov    DWORD PTR [rax],edx
                    for(;i<funcn;i++)
  805828:	83 45 c4 01          	add    DWORD PTR [rbp-0x3c],0x1
  80582c:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
  80582f:	3b 85 0c ff ff ff    	cmp    eax,DWORD PTR [rbp-0xf4]
  805835:	0f 8c 77 ff ff ff    	jl     8057b2 <load_pe+0x508>
                        }
                    }
                }
                iataddrs++;
  80583b:	48 83 45 d0 04       	add    QWORD PTR [rbp-0x30],0x4
                siataddrs++;
  805840:	48 83 45 c8 08       	add    QWORD PTR [rbp-0x38],0x8
            while (*iataddrs)
  805845:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  805849:	8b 00                	mov    eax,DWORD PTR [rax]
  80584b:	85 c0                	test   eax,eax
  80584d:	0f 85 f2 fe ff ff    	jne    805745 <load_pe+0x49b>
            }
            impdes++;
  805853:	48 83 45 e0 14       	add    QWORD PTR [rbp-0x20],0x14
        while (impdes->Characteristics)
  805858:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80585c:	8b 00                	mov    eax,DWORD PTR [rax]
  80585e:	85 c0                	test   eax,eax
  805860:	0f 85 b4 fd ff ff    	jne    80561a <load_pe+0x370>
        }
    }


    //开始重定位
    PIMAGE_BASE_RELOCATION relp=0;
  805866:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  80586d:	00 
    if(nth->OptionalHeader.DataDirectory[5].Size>0)
  80586e:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  805875:	8b 80 a4 00 00 00    	mov    eax,DWORD PTR [rax+0xa4]
  80587b:	85 c0                	test   eax,eax
  80587d:	0f 84 e8 00 00 00    	je     80596b <load_pe+0x6c1>
    {
        relp=(u32)(nth->OptionalHeader.DataDirectory[5].VirtualAddress\
  805883:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80588a:	8b 90 a0 00 00 00    	mov    edx,DWORD PTR [rax+0xa0]
  805890:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805893:	01 d0                	add    eax,edx
  805895:	89 c0                	mov    eax,eax
  805897:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
                                +(u32)nbase);
        u16 *reloc=relp+sizeof(IMAGE_BASE_RELOCATION);
  80589b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80589f:	48 83 c0 40          	add    rax,0x40
  8058a3:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
        u16 *rtype=reloc+1;
  8058a7:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8058ab:	48 83 c0 02          	add    rax,0x2
  8058af:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
        int old_base=nth->OptionalHeader.ImageBase;
  8058b3:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  8058ba:	8b 40 34             	mov    eax,DWORD PTR [rax+0x34]
  8058bd:	89 85 d4 fe ff ff    	mov    DWORD PTR [rbp-0x12c],eax
        while(relp->VirtualAddress){
  8058c3:	e9 95 00 00 00       	jmp    80595d <load_pe+0x6b3>
            int pgva=relp->VirtualAddress+nbase;
  8058c8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8058cc:	8b 10                	mov    edx,DWORD PTR [rax]
  8058ce:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8058d1:	01 d0                	add    eax,edx
  8058d3:	89 85 d0 fe ff ff    	mov    DWORD PTR [rbp-0x130],eax
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  8058d9:	c7 45 a4 00 00 00 00 	mov    DWORD PTR [rbp-0x5c],0x0
  8058e0:	eb 59                	jmp    80593b <load_pe+0x691>
            {
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  8058e2:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8058e6:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8058e9:	66 85 c0             	test   ax,ax
  8058ec:	74 48                	je     805936 <load_pe+0x68c>
                int *at=*reloc+pgva;//要重定位的数据的地址
  8058ee:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8058f2:	0f b7 00             	movzx  eax,WORD PTR [rax]
  8058f5:	0f b7 d0             	movzx  edx,ax
  8058f8:	8b 85 d0 fe ff ff    	mov    eax,DWORD PTR [rbp-0x130]
  8058fe:	01 d0                	add    eax,edx
  805900:	48 98                	cdqe   
  805902:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
                *at=*at-old_base+nbase;
  805909:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  805910:	8b 00                	mov    eax,DWORD PTR [rax]
  805912:	2b 85 d4 fe ff ff    	sub    eax,DWORD PTR [rbp-0x12c]
  805918:	89 c2                	mov    edx,eax
  80591a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80591d:	01 d0                	add    eax,edx
  80591f:	89 c2                	mov    edx,eax
  805921:	48 8b 85 c8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x138]
  805928:	89 10                	mov    DWORD PTR [rax],edx
                //下一个
                reloc+=2;
  80592a:	48 83 45 b0 04       	add    QWORD PTR [rbp-0x50],0x4
                rtype+=2;
  80592f:	48 83 45 a8 04       	add    QWORD PTR [rbp-0x58],0x4
  805934:	eb 01                	jmp    805937 <load_pe+0x68d>
                if(*rtype==IMAGE_REL_BASED_ABSOLUTE)continue;//不用重定位
  805936:	90                   	nop
            for(int i=0;i<relp->SizeOfBlock/4;i++)
  805937:	83 45 a4 01          	add    DWORD PTR [rbp-0x5c],0x1
  80593b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80593f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  805942:	c1 e8 02             	shr    eax,0x2
  805945:	89 c2                	mov    edx,eax
  805947:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  80594a:	39 c2                	cmp    edx,eax
  80594c:	77 94                	ja     8058e2 <load_pe+0x638>
            }
            relp=(int)relp+0x1000;
  80594e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805952:	05 00 10 00 00       	add    eax,0x1000
  805957:	48 98                	cdqe   
  805959:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
        while(relp->VirtualAddress){
  80595d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805961:	8b 00                	mov    eax,DWORD PTR [rax]
  805963:	85 c0                	test   eax,eax
  805965:	0f 85 5d ff ff ff    	jne    8058c8 <load_pe+0x61e>
        }
    }
    extern struct process task[];
    extern int cur_proc;
    //初始化堆
    chunk_header hdrtmp={
  80596b:	c7 85 50 fd ff ff 00 	mov    DWORD PTR [rbp-0x2b0],0x0
  805972:	00 00 00 
  805975:	c7 85 54 fd ff ff 00 	mov    DWORD PTR [rbp-0x2ac],0x0
  80597c:	00 00 00 
  80597f:	48 c7 85 58 fd ff ff 	mov    QWORD PTR [rbp-0x2a8],0x0
  805986:	00 00 00 00 
  80598a:	48 c7 85 60 fd ff ff 	mov    QWORD PTR [rbp-0x2a0],0x0
  805991:	00 00 00 00 
            .next=NULL,
            .pgn=0,
            .prev=NULL
    };//空堆
    //拷贝触发页中断然后分配
    memcpy((chunk_header*)HEAP_BASE,&hdrtmp,sizeof(hdrtmp));
  805995:	48 8d 85 50 fd ff ff 	lea    rax,[rbp-0x2b0]
  80599c:	ba 18 00 00 00       	mov    edx,0x18
  8059a1:	48 89 c6             	mov    rsi,rax
  8059a4:	bf 00 00 00 01       	mov    edi,0x1000000
  8059a9:	e8 09 4b 00 00       	call   80a4b7 <memcpy>
    task[cur_proc].mem_struct.heap_base=HEAP_BASE;
  8059ae:	8b 05 58 eb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0eb58]        # 41450c <cur_proc>
  8059b4:	48 63 d0             	movsxd rdx,eax
  8059b7:	48 89 d0             	mov    rax,rdx
  8059ba:	48 01 c0             	add    rax,rax
  8059bd:	48 01 d0             	add    rax,rdx
  8059c0:	48 c1 e0 08          	shl    rax,0x8
  8059c4:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8059ca:	c7 40 04 00 00 00 01 	mov    DWORD PTR [rax+0x4],0x1000000
    task[cur_proc].mem_struct.heap_top=HEAP_BASE+CHUNK_SIZE;
  8059d1:	8b 05 35 eb c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0eb35]        # 41450c <cur_proc>
  8059d7:	48 63 d0             	movsxd rdx,eax
  8059da:	48 89 d0             	mov    rax,rdx
  8059dd:	48 01 c0             	add    rax,rax
  8059e0:	48 01 d0             	add    rax,rdx
  8059e3:	48 c1 e0 08          	shl    rax,0x8
  8059e7:	48 05 b0 84 40 00    	add    rax,0x4084b0
  8059ed:	c7 40 08 00 10 00 01 	mov    DWORD PTR [rax+0x8],0x1001000


    //完毕,调用入口函数
    //重定位完毕，准备调用DllMain
    typedef int (*Main)(int,void*);
    Main main=shell_addr;
  8059f4:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  8059fa:	48 98                	cdqe   
  8059fc:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
    task[cur_proc].exit_code=main(0,NULL);
  805a03:	48 8b 85 c0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x140]
  805a0a:	be 00 00 00 00       	mov    esi,0x0
  805a0f:	bf 00 00 00 00       	mov    edi,0x0
  805a14:	ff d0                	call   rax
  805a16:	8b 15 f0 ea c0 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc0eaf0]        # 41450c <cur_proc>
  805a1c:	89 c1                	mov    ecx,eax
  805a1e:	48 63 d2             	movsxd rdx,edx
  805a21:	48 89 d0             	mov    rax,rdx
  805a24:	48 01 c0             	add    rax,rax
  805a27:	48 01 d0             	add    rax,rdx
  805a2a:	48 c1 e0 08          	shl    rax,0x8
  805a2e:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805a34:	89 08                	mov    DWORD PTR [rax],ecx
    return task[cur_proc].exit_code;
  805a36:	8b 05 d0 ea c0 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc0ead0]        # 41450c <cur_proc>
  805a3c:	48 63 d0             	movsxd rdx,eax
  805a3f:	48 89 d0             	mov    rax,rdx
  805a42:	48 01 c0             	add    rax,rax
  805a45:	48 01 d0             	add    rax,rdx
  805a48:	48 c1 e0 08          	shl    rax,0x8
  805a4c:	48 05 b0 84 40 00    	add    rax,0x4084b0
  805a52:	8b 00                	mov    eax,DWORD PTR [rax]
}
  805a54:	c9                   	leave  
  805a55:	c3                   	ret    

0000000000805a56 <get_module_addr>:

int get_module_addr(int mi)
{
  805a56:	f3 0f 1e fa          	endbr64 
  805a5a:	55                   	push   rbp
  805a5b:	48 89 e5             	mov    rbp,rsp
  805a5e:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return modules[mi].base;
  805a61:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a64:	48 98                	cdqe   
  805a66:	8b 04 c5 20 71 42 00 	mov    eax,DWORD PTR [rax*8+0x427120]
}
  805a6d:	5d                   	pop    rbp
  805a6e:	c3                   	ret    

0000000000805a6f <dispose_library>:
int dispose_library(int dlln)
{
  805a6f:	f3 0f 1e fa          	endbr64 
  805a73:	55                   	push   rbp
  805a74:	48 89 e5             	mov    rbp,rsp
  805a77:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    if(dlln<0||dlln>=MAX_DLLS)return -1;
  805a7a:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  805a7e:	78 09                	js     805a89 <dispose_library+0x1a>
  805a80:	81 7d fc ff 00 00 00 	cmp    DWORD PTR [rbp-0x4],0xff
  805a87:	7e 07                	jle    805a90 <dispose_library+0x21>
  805a89:	b8 ff ff ff ff       	mov    eax,0xffffffff
  805a8e:	eb 1d                	jmp    805aad <dispose_library+0x3e>
    //空间不够，释放之前申请的
    // for(int j=0;j<dlls[dlln].page_used;j++)
    //     dispose_page(get_phyaddr(dlls[dlln].page_num[j]));
    //释放dll
    dlls[dlln].flag=DLL_STAT_EMPTY;
  805a90:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805a93:	48 98                	cdqe   
  805a95:	48 69 c0 2c 01 00 00 	imul   rax,rax,0x12c
  805a9c:	48 05 28 45 41 00    	add    rax,0x414528
  805aa2:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
    return 0;
  805aa8:	b8 00 00 00 00       	mov    eax,0x0
}
  805aad:	5d                   	pop    rbp
  805aae:	c3                   	ret    

0000000000805aaf <sys_insmod>:

    return 0;
} */

int sys_insmod(char *path)
{
  805aaf:	f3 0f 1e fa          	endbr64 
  805ab3:	55                   	push   rbp
  805ab4:	48 89 e5             	mov    rbp,rsp
  805ab7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

}
  805abb:	90                   	nop
  805abc:	5d                   	pop    rbp
  805abd:	c3                   	ret    

0000000000805abe <sys_rmmod>:
int sys_rmmod(char *name)
{
  805abe:	f3 0f 1e fa          	endbr64 
  805ac2:	55                   	push   rbp
  805ac3:	48 89 e5             	mov    rbp,rsp
  805ac6:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi

  805aca:	90                   	nop
  805acb:	5d                   	pop    rbp
  805acc:	c3                   	ret    
  805acd:	0f 1f 00             	nop    DWORD PTR [rax]

0000000000805ad0 <_syscall>:
  805ad0:	57                   	push   rdi
  805ad1:	56                   	push   rsi
  805ad2:	52                   	push   rdx
  805ad3:	51                   	push   rcx
  805ad4:	53                   	push   rbx
  805ad5:	50                   	push   rax
  805ad6:	e8 93 aa ff ff       	call   80056e <syscall>
  805adb:	48 83 c4 18          	add    rsp,0x18
  805adf:	cf                   	iret   

0000000000805ae0 <init_framebuffer>:
static u32 font_width_bytes;
static u8 *glyph_table;
static u32 bytes_per_glyph, glyph_nr;
int font_size=1;
void init_framebuffer()
{
  805ae0:	f3 0f 1e fa          	endbr64 
  805ae4:	55                   	push   rbp
  805ae5:	48 89 e5             	mov    rbp,rsp
  805ae8:	48 83 ec 50          	sub    rsp,0x50
    //映射页帧内存
    size_t w=framebuffer.common.framebuffer_width;
  805aec:	8b 05 42 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a42]        # 427534 <framebuffer+0x14>
  805af2:	89 c0                	mov    eax,eax
  805af4:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
    size_t h=framebuffer.common.framebuffer_height;
  805af8:	8b 05 3a 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a3a]        # 427538 <framebuffer+0x18>
  805afe:	89 c0                	mov    eax,eax
  805b00:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
    size_t bypp=framebuffer.common.framebuffer_bpp/8;
  805b04:	0f b6 05 31 1a c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21a31]        # 42753c <framebuffer+0x1c>
  805b0b:	c0 e8 03             	shr    al,0x3
  805b0e:	0f b6 c0             	movzx  eax,al
  805b11:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    size_t inter=framebuffer.common.framebuffer_pitch;
  805b15:	8b 05 15 1a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21a15]        # 427530 <framebuffer+0x10>
  805b1b:	89 c0                	mov    eax,eax
  805b1d:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    size_t pc=w*h;
  805b21:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  805b25:	48 0f af 45 d8       	imul   rax,QWORD PTR [rbp-0x28]
  805b2a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    size_t size=h*inter;
  805b2e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805b32:	48 0f af 45 c8       	imul   rax,QWORD PTR [rbp-0x38]
  805b37:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
    int pgc=size/PAGE_SIZE;
  805b3b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  805b3f:	48 c1 e8 0c          	shr    rax,0xc
  805b43:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    addr_t p=FRAMEBUFFER_ADDR;
  805b46:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x40000000
  805b4d:	40 
    addr_t pp=framebuffer.common.framebuffer_addr;
  805b4e:	48 8b 05 d3 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc219d3]        # 427528 <framebuffer+0x8>
  805b55:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for (size_t i = 0; i < pgc; i++)
  805b59:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  805b60:	00 
  805b61:	eb 2d                	jmp    805b90 <init_framebuffer+0xb0>
    {
        mmap(pp,p,PAGE_PRESENT|PAGE_RWX|PAGE_FOR_ALL);
  805b63:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
  805b67:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805b6b:	ba 07 00 00 00       	mov    edx,0x7
  805b70:	48 89 ce             	mov    rsi,rcx
  805b73:	48 89 c7             	mov    rdi,rax
  805b76:	e8 35 b3 ff ff       	call   800eb0 <mmap>
        pp+=PAGE_SIZE;
  805b7b:	48 81 45 f0 00 10 00 	add    QWORD PTR [rbp-0x10],0x1000
  805b82:	00 
        p+=PAGE_SIZE;
  805b83:	48 81 45 f8 00 10 00 	add    QWORD PTR [rbp-0x8],0x1000
  805b8a:	00 
    for (size_t i = 0; i < pgc; i++)
  805b8b:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  805b90:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  805b93:	48 98                	cdqe   
  805b95:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  805b99:	72 c8                	jb     805b63 <init_framebuffer+0x83>
    }
    
    
}
  805b9b:	90                   	nop
  805b9c:	90                   	nop
  805b9d:	c9                   	leave  
  805b9e:	c3                   	ret    

0000000000805b9f <init_font>:
void init_font(){
  805b9f:	f3 0f 1e fa          	endbr64 
  805ba3:	55                   	push   rbp
  805ba4:	48 89 e5             	mov    rbp,rsp
    boot_font = (struct psf2_header*) _binary_res_font_psf_start;
  805ba7:	48 c7 05 ae 19 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc219ae],0x80b180        # 427560 <boot_font>
  805bae:	80 b1 80 00 

    font_width_bytes = (boot_font->width + 7) / 8;
  805bb2:	48 8b 05 a7 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc219a7]        # 427560 <boot_font>
  805bb9:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  805bbc:	83 c0 07             	add    eax,0x7
  805bbf:	c1 e8 03             	shr    eax,0x3
  805bc2:	89 05 a8 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc219a8],eax        # 427570 <font_width_bytes>
    font_width = font_width_bytes * 8;
  805bc8:	8b 05 a2 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc219a2]        # 427570 <font_width_bytes>
  805bce:	c1 e0 03             	shl    eax,0x3
  805bd1:	89 05 91 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21991],eax        # 427568 <font_width>
    font_height = boot_font->height;
  805bd7:	48 8b 05 82 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21982]        # 427560 <boot_font>
  805bde:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  805be1:	89 05 85 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21985],eax        # 42756c <font_height>

    glyph_table = (u8*)_binary_res_font_psf_start+boot_font->header_size;
  805be7:	48 8b 05 72 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21972]        # 427560 <boot_font>
  805bee:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  805bf1:	89 c0                	mov    eax,eax
  805bf3:	48 05 80 b1 80 00    	add    rax,0x80b180
  805bf9:	48 89 05 78 19 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21978],rax        # 427578 <glyph_table>
    glyph_nr = boot_font->glyph_nr;
  805c00:	48 8b 05 59 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21959]        # 427560 <boot_font>
  805c07:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
  805c0a:	89 05 74 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21974],eax        # 427584 <glyph_nr>
    bytes_per_glyph = boot_font->bytes_per_glyph;
  805c10:	48 8b 05 49 19 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21949]        # 427560 <boot_font>
  805c17:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  805c1a:	89 05 60 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21960],eax        # 427580 <bytes_per_glyph>

    fb_cursor_x = fb_cursor_y = 0;
  805c20:	c7 05 26 19 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc21926],0x0        # 427550 <fb_cursor_y>
  805c27:	00 00 00 
  805c2a:	8b 05 20 19 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21920]        # 427550 <fb_cursor_y>
  805c30:	89 05 16 19 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc21916],eax        # 42754c <fb_cursor_x>
    max_ch_nr_x = framebuffer.common.framebuffer_width *framebuffer.common.framebuffer_bpp/8 / font_width;
  805c36:	8b 15 f8 18 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc218f8]        # 427534 <framebuffer+0x14>
  805c3c:	0f b6 05 f9 18 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc218f9]        # 42753c <framebuffer+0x1c>
  805c43:	0f b6 c0             	movzx  eax,al
  805c46:	0f af c2             	imul   eax,edx
  805c49:	c1 e8 03             	shr    eax,0x3
  805c4c:	8b 0d 16 19 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc21916]        # 427568 <font_width>
  805c52:	ba 00 00 00 00       	mov    edx,0x0
  805c57:	f7 f1                	div    ecx
  805c59:	89 05 f5 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc218f5],eax        # 427554 <max_ch_nr_x>
    max_ch_nr_y = framebuffer.common.framebuffer_height *framebuffer.common.framebuffer_bpp/8 / font_height;
  805c5f:	8b 15 d3 18 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc218d3]        # 427538 <framebuffer+0x18>
  805c65:	0f b6 05 d0 18 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc218d0]        # 42753c <framebuffer+0x1c>
  805c6c:	0f b6 c0             	movzx  eax,al
  805c6f:	0f af c2             	imul   eax,edx
  805c72:	c1 e8 03             	shr    eax,0x3
  805c75:	8b 35 f1 18 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc218f1]        # 42756c <font_height>
  805c7b:	ba 00 00 00 00       	mov    edx,0x0
  805c80:	f7 f6                	div    esi
  805c82:	89 05 d0 18 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc218d0],eax        # 427558 <max_ch_nr_y>
    font_size=1;
  805c88:	c7 05 3e 52 00 00 01 	mov    DWORD PTR [rip+0x523e],0x1        # 80aed0 <font_size>
  805c8f:	00 00 00 
}
  805c92:	90                   	nop
  805c93:	5d                   	pop    rbp
  805c94:	c3                   	ret    

0000000000805c95 <set_framebuffer>:
void set_framebuffer(struct multiboot_tag_framebuffer tag)
{
  805c95:	f3 0f 1e fa          	endbr64 
  805c99:	55                   	push   rbp
  805c9a:	48 89 e5             	mov    rbp,rsp
    framebuffer=tag;
  805c9d:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  805ca1:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
  805ca5:	48 89 05 74 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21874],rax        # 427520 <framebuffer>
  805cac:	48 89 15 75 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc21875],rdx        # 427528 <framebuffer+0x8>
  805cb3:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  805cb7:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
  805cbb:	48 89 05 6e 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2186e],rax        # 427530 <framebuffer+0x10>
  805cc2:	48 89 15 6f 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2186f],rdx        # 427538 <framebuffer+0x18>
  805cc9:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  805ccd:	48 89 05 6c 18 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2186c],rax        # 427540 <framebuffer+0x20>
}
  805cd4:	90                   	nop
  805cd5:	5d                   	pop    rbp
  805cd6:	c3                   	ret    

0000000000805cd7 <fill_rect>:

void fill_rect(int x,int y,int w,int h,unsigned int color){
  805cd7:	f3 0f 1e fa          	endbr64 
  805cdb:	55                   	push   rbp
  805cdc:	48 89 e5             	mov    rbp,rsp
  805cdf:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  805ce2:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805ce5:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805ce8:	89 4d d0             	mov    DWORD PTR [rbp-0x30],ecx
  805ceb:	44 89 45 cc          	mov    DWORD PTR [rbp-0x34],r8d
    unsigned int* fb= (unsigned int*) FRAMEBUFFER_ADDR;
  805cef:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x40000000
  805cf6:	40 
    //目前只写32bpp
    for(int py=x;py<h+x;py++){
  805cf7:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805cfa:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805cfd:	eb 64                	jmp    805d63 <fill_rect+0x8c>
        for(int px=y;px<w+y;px++){
  805cff:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805d02:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  805d05:	eb 4b                	jmp    805d52 <fill_rect+0x7b>
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805d07:	8b 15 23 18 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21823]        # 427530 <framebuffer+0x10>
  805d0d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805d10:	0f af c2             	imul   eax,edx
  805d13:	89 c1                	mov    ecx,eax
                       +px*framebuffer.common.framebuffer_bpp/8;
  805d15:	0f b6 05 20 18 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21820]        # 42753c <framebuffer+0x1c>
  805d1c:	0f b6 c0             	movzx  eax,al
  805d1f:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805d23:	8d 50 07             	lea    edx,[rax+0x7]
  805d26:	85 c0                	test   eax,eax
  805d28:	0f 48 c2             	cmovs  eax,edx
  805d2b:	c1 f8 03             	sar    eax,0x3
  805d2e:	48 98                	cdqe   
  805d30:	48 01 c8             	add    rax,rcx
            addr_t ptr=FRAMEBUFFER_ADDR+py*framebuffer.common.framebuffer_pitch
  805d33:	48 05 00 00 00 40    	add    rax,0x40000000
  805d39:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
            fb=(unsigned int*)ptr;
  805d3d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  805d41:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *fb=color;
  805d45:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805d49:	8b 55 cc             	mov    edx,DWORD PTR [rbp-0x34]
  805d4c:	89 10                	mov    DWORD PTR [rax],edx
        for(int px=y;px<w+y;px++){
  805d4e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805d52:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805d55:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805d58:	01 d0                	add    eax,edx
  805d5a:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  805d5d:	7c a8                	jl     805d07 <fill_rect+0x30>
    for(int py=x;py<h+x;py++){
  805d5f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805d63:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
  805d66:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805d69:	01 d0                	add    eax,edx
  805d6b:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  805d6e:	7c 8f                	jl     805cff <fill_rect+0x28>
        }
    }
}
  805d70:	90                   	nop
  805d71:	90                   	nop
  805d72:	5d                   	pop    rbp
  805d73:	c3                   	ret    

0000000000805d74 <draw_text>:
unsigned char letters[];
void draw_text(int x, int y, int size, char *str)
{
  805d74:	f3 0f 1e fa          	endbr64 
  805d78:	55                   	push   rbp
  805d79:	48 89 e5             	mov    rbp,rsp
  805d7c:	48 83 ec 30          	sub    rsp,0x30
  805d80:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  805d83:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  805d86:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  805d89:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    int tx=x;
  805d8d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805d90:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    while(*str!='\0')
  805d93:	eb 5a                	jmp    805def <draw_text+0x7b>
    {
        if(*str=='\n')
  805d95:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805d99:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805d9c:	3c 0a                	cmp    al,0xa
  805d9e:	75 1c                	jne    805dbc <draw_text+0x48>
        {
            y+=font_height*size;
  805da0:	8b 15 c6 17 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc217c6]        # 42756c <font_height>
  805da6:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  805da9:	0f af d0             	imul   edx,eax
  805dac:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  805daf:	01 d0                	add    eax,edx
  805db1:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
            tx=x;
  805db4:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805db7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  805dba:	eb 2e                	jmp    805dea <draw_text+0x76>
        }
        else
        {
            draw_letter(tx,y,size,*str);
  805dbc:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805dc0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805dc3:	0f be c8             	movsx  ecx,al
  805dc6:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805dc9:	8b 75 e8             	mov    esi,DWORD PTR [rbp-0x18]
  805dcc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805dcf:	89 c7                	mov    edi,eax
  805dd1:	e8 28 00 00 00       	call   805dfe <draw_letter>
            tx+=size*font_width;
  805dd6:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  805dd9:	8b 05 89 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21789]        # 427568 <font_width>
  805ddf:	0f af d0             	imul   edx,eax
  805de2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805de5:	01 d0                	add    eax,edx
  805de7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        }
        str++;
  805dea:	48 83 45 d8 01       	add    QWORD PTR [rbp-0x28],0x1
    while(*str!='\0')
  805def:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  805df3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805df6:	84 c0                	test   al,al
  805df8:	75 9b                	jne    805d95 <draw_text+0x21>
    }
}
  805dfa:	90                   	nop
  805dfb:	90                   	nop
  805dfc:	c9                   	leave  
  805dfd:	c3                   	ret    

0000000000805dfe <draw_letter>:
void draw_letter(int x, int y, int size, char c) {
  805dfe:	f3 0f 1e fa          	endbr64 
  805e02:	55                   	push   rbp
  805e03:	48 89 e5             	mov    rbp,rsp
  805e06:	48 83 ec 30          	sub    rsp,0x30
  805e0a:	89 7d dc             	mov    DWORD PTR [rbp-0x24],edi
  805e0d:	89 75 d8             	mov    DWORD PTR [rbp-0x28],esi
  805e10:	89 55 d4             	mov    DWORD PTR [rbp-0x2c],edx
  805e13:	89 c8                	mov    eax,ecx
  805e15:	88 45 d0             	mov    BYTE PTR [rbp-0x30],al
    u8 *glyph = glyph_table;
  805e18:	48 8b 05 59 17 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc21759]        # 427578 <glyph_table>
  805e1f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    if (c < glyph_nr) {
  805e23:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805e27:	8b 05 57 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21757]        # 427584 <glyph_nr>
  805e2d:	39 c2                	cmp    edx,eax
  805e2f:	73 13                	jae    805e44 <draw_letter+0x46>
        glyph += c * bytes_per_glyph;
  805e31:	0f be 55 d0          	movsx  edx,BYTE PTR [rbp-0x30]
  805e35:	8b 05 45 17 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21745]        # 427580 <bytes_per_glyph>
  805e3b:	0f af c2             	imul   eax,edx
  805e3e:	89 c0                	mov    eax,eax
  805e40:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    }
    /* output the font to frame buffer */
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805e44:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  805e4b:	e9 c9 00 00 00       	jmp    805f19 <draw_letter+0x11b>
        u8 mask = 1 << 7;
  805e50:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80

        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805e54:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  805e5b:	e9 9a 00 00 00       	jmp    805efa <draw_letter+0xfc>
            if ((*(glyph + ch_x / 8) & mask) != 0) {
  805e60:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805e63:	c1 e8 03             	shr    eax,0x3
  805e66:	89 c2                	mov    edx,eax
  805e68:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  805e6c:	48 01 d0             	add    rax,rdx
  805e6f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  805e72:	22 45 f3             	and    al,BYTE PTR [rbp-0xd]
  805e75:	84 c0                	test   al,al
  805e77:	74 37                	je     805eb0 <draw_letter+0xb2>
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,-1);
  805e79:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805e7c:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  805e80:	89 c2                	mov    edx,eax
  805e82:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805e85:	01 d0                	add    eax,edx
  805e87:	89 c6                	mov    esi,eax
  805e89:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805e8c:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  805e90:	89 c2                	mov    edx,eax
  805e92:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805e95:	01 d0                	add    eax,edx
  805e97:	89 c7                	mov    edi,eax
  805e99:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805e9c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805e9f:	41 b8 ff ff ff ff    	mov    r8d,0xffffffff
  805ea5:	89 d1                	mov    ecx,edx
  805ea7:	89 c2                	mov    edx,eax
  805ea9:	e8 29 fe ff ff       	call   805cd7 <fill_rect>
  805eae:	eb 35                	jmp    805ee5 <draw_letter+0xe7>
            } else {
                fill_rect(y+ch_y*size,x+ch_x*size,size,size,0);
  805eb0:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805eb3:	0f af 45 ec          	imul   eax,DWORD PTR [rbp-0x14]
  805eb7:	89 c2                	mov    edx,eax
  805eb9:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
  805ebc:	01 d0                	add    eax,edx
  805ebe:	89 c6                	mov    esi,eax
  805ec0:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805ec3:	0f af 45 f4          	imul   eax,DWORD PTR [rbp-0xc]
  805ec7:	89 c2                	mov    edx,eax
  805ec9:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
  805ecc:	01 d0                	add    eax,edx
  805ece:	89 c7                	mov    edi,eax
  805ed0:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  805ed3:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  805ed6:	41 b8 00 00 00 00    	mov    r8d,0x0
  805edc:	89 d1                	mov    ecx,edx
  805ede:	89 c2                	mov    edx,eax
  805ee0:	e8 f2 fd ff ff       	call   805cd7 <fill_rect>
            }

            mask >>= 1;
  805ee5:	d0 6d f3             	shr    BYTE PTR [rbp-0xd],1
            if (ch_x % 8 == 0) {
  805ee8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  805eeb:	83 e0 07             	and    eax,0x7
  805eee:	85 c0                	test   eax,eax
  805ef0:	75 04                	jne    805ef6 <draw_letter+0xf8>
                mask = 1 << 7;
  805ef2:	c6 45 f3 80          	mov    BYTE PTR [rbp-0xd],0x80
        for (u32 ch_x = 0; ch_x < font_width; ch_x++) {
  805ef6:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  805efa:	8b 05 68 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21668]        # 427568 <font_width>
  805f00:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  805f03:	0f 82 57 ff ff ff    	jb     805e60 <draw_letter+0x62>
            }
        }

        glyph += font_width_bytes;
  805f09:	8b 05 61 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21661]        # 427570 <font_width_bytes>
  805f0f:	89 c0                	mov    eax,eax
  805f11:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
    for (u32 ch_y = 0; ch_y < font_height; ch_y++) {
  805f15:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  805f19:	8b 05 4d 16 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2164d]        # 42756c <font_height>
  805f1f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  805f22:	0f 82 28 ff ff ff    	jb     805e50 <draw_letter+0x52>
    }
}
  805f28:	90                   	nop
  805f29:	90                   	nop
  805f2a:	c9                   	leave  
  805f2b:	c3                   	ret    

0000000000805f2c <scr_up>:
//向上滚动一个像素
void scr_up(){
  805f2c:	f3 0f 1e fa          	endbr64 
  805f30:	55                   	push   rbp
  805f31:	48 89 e5             	mov    rbp,rsp
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805f34:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  805f3b:	eb 6c                	jmp    805fa9 <scr_up+0x7d>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805f3d:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805f44:	eb 52                	jmp    805f98 <scr_up+0x6c>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805f46:	8b 15 e4 15 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc215e4]        # 427530 <framebuffer+0x10>
  805f4c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805f4f:	0f af c2             	imul   eax,edx
  805f52:	89 c1                	mov    ecx,eax
                    +dx*framebuffer.common.framebuffer_bpp/8);
  805f54:	0f b6 05 e1 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc215e1]        # 42753c <framebuffer+0x1c>
  805f5b:	0f b6 c0             	movzx  eax,al
  805f5e:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805f62:	8d 50 07             	lea    edx,[rax+0x7]
  805f65:	85 c0                	test   eax,eax
  805f67:	0f 48 c2             	cmovs  eax,edx
  805f6a:	c1 f8 03             	sar    eax,0x3
  805f6d:	48 98                	cdqe   
  805f6f:	48 01 c8             	add    rax,rcx
  805f72:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805f78:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p+framebuffer.common.framebuffer_pitch);
  805f7c:	8b 05 ae 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc215ae]        # 427530 <framebuffer+0x10>
  805f82:	89 c2                	mov    edx,eax
  805f84:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805f88:	48 01 d0             	add    rax,rdx
  805f8b:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  805f8e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  805f92:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805f94:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  805f98:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  805f9b:	8b 05 b3 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc215b3]        # 427554 <max_ch_nr_x>
  805fa1:	39 c2                	cmp    edx,eax
  805fa3:	72 a1                	jb     805f46 <scr_up+0x1a>
    for(int dy=0;dy<max_ch_nr_y-1;dy++){
  805fa5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  805fa9:	8b 05 a9 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc215a9]        # 427558 <max_ch_nr_y>
  805faf:	8d 50 ff             	lea    edx,[rax-0x1]
  805fb2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805fb5:	39 c2                	cmp    edx,eax
  805fb7:	77 84                	ja     805f3d <scr_up+0x11>
        }

    }
}
  805fb9:	90                   	nop
  805fba:	90                   	nop
  805fbb:	5d                   	pop    rbp
  805fbc:	c3                   	ret    

0000000000805fbd <scr_down>:
void scr_down(){
  805fbd:	f3 0f 1e fa          	endbr64 
  805fc1:	55                   	push   rbp
  805fc2:	48 89 e5             	mov    rbp,rsp
    for(int dy=1;dy<max_ch_nr_y;dy++){
  805fc5:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  805fcc:	eb 72                	jmp    806040 <scr_down+0x83>
        for(int dx=0;dx<max_ch_nr_x;dx++){
  805fce:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  805fd5:	eb 58                	jmp    80602f <scr_down+0x72>
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  805fd7:	8b 15 53 15 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc21553]        # 427530 <framebuffer+0x10>
  805fdd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  805fe0:	0f af c2             	imul   eax,edx
  805fe3:	89 c1                	mov    ecx,eax
                            +dx*framebuffer.common.framebuffer_bpp/8);
  805fe5:	0f b6 05 50 15 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21550]        # 42753c <framebuffer+0x1c>
  805fec:	0f b6 c0             	movzx  eax,al
  805fef:	0f af 45 f8          	imul   eax,DWORD PTR [rbp-0x8]
  805ff3:	8d 50 07             	lea    edx,[rax+0x7]
  805ff6:	85 c0                	test   eax,eax
  805ff8:	0f 48 c2             	cmovs  eax,edx
  805ffb:	c1 f8 03             	sar    eax,0x3
  805ffe:	48 98                	cdqe   
  806000:	48 01 c8             	add    rax,rcx
  806003:	48 05 00 00 00 40    	add    rax,0x40000000
            char *p=(char*)(FRAMEBUFFER_ADDR+dy*framebuffer.common.framebuffer_pitch
  806009:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            *p=*(p-framebuffer.common.framebuffer_pitch);
  80600d:	8b 05 1d 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2151d]        # 427530 <framebuffer+0x10>
  806013:	89 c0                	mov    eax,eax
  806015:	48 f7 d8             	neg    rax
  806018:	48 89 c2             	mov    rdx,rax
  80601b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80601f:	48 01 d0             	add    rax,rdx
  806022:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  806025:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  806029:	88 10                	mov    BYTE PTR [rax],dl
        for(int dx=0;dx<max_ch_nr_x;dx++){
  80602b:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  80602f:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  806032:	8b 05 1c 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2151c]        # 427554 <max_ch_nr_x>
  806038:	39 c2                	cmp    edx,eax
  80603a:	72 9b                	jb     805fd7 <scr_down+0x1a>
    for(int dy=1;dy<max_ch_nr_y;dy++){
  80603c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  806040:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  806043:	8b 05 0f 15 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2150f]        # 427558 <max_ch_nr_y>
  806049:	39 c2                	cmp    edx,eax
  80604b:	72 81                	jb     805fce <scr_down+0x11>
        }

    }
}
  80604d:	90                   	nop
  80604e:	90                   	nop
  80604f:	5d                   	pop    rbp
  806050:	c3                   	ret    

0000000000806051 <print>:
void print(char* s){
  806051:	f3 0f 1e fa          	endbr64 
  806055:	55                   	push   rbp
  806056:	48 89 e5             	mov    rbp,rsp
  806059:	48 83 ec 18          	sub    rsp,0x18
  80605d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(;*s;s++){
  806061:	e9 f7 00 00 00       	jmp    80615d <print+0x10c>
        if(fb_cursor_x>max_ch_nr_x||*s=='\n')
  806066:	8b 15 e0 14 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc214e0]        # 42754c <fb_cursor_x>
  80606c:	8b 05 e2 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc214e2]        # 427554 <max_ch_nr_x>
  806072:	39 c2                	cmp    edx,eax
  806074:	77 0b                	ja     806081 <print+0x30>
  806076:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80607a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80607d:	3c 0a                	cmp    al,0xa
  80607f:	75 19                	jne    80609a <print+0x49>
        {
            fb_cursor_y+=1;
  806081:	8b 05 c9 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc214c9]        # 427550 <fb_cursor_y>
  806087:	83 c0 01             	add    eax,0x1
  80608a:	89 05 c0 14 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc214c0],eax        # 427550 <fb_cursor_y>
            fb_cursor_x=0;
  806090:	c7 05 b2 14 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc214b2],0x0        # 42754c <fb_cursor_x>
  806097:	00 00 00 
        }
        if(*s=='\n')continue;
  80609a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80609e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8060a1:	3c 0a                	cmp    al,0xa
  8060a3:	0f 84 ae 00 00 00    	je     806157 <print+0x106>
        if(fb_cursor_y>=max_ch_nr_y){
  8060a9:	8b 15 a1 14 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc214a1]        # 427550 <fb_cursor_y>
  8060af:	8b 05 a3 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc214a3]        # 427558 <max_ch_nr_y>
  8060b5:	39 c2                	cmp    edx,eax
  8060b7:	72 3c                	jb     8060f5 <print+0xa4>
            for(int i=0;i<font_height*font_size;i++)
  8060b9:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8060c0:	eb 0e                	jmp    8060d0 <print+0x7f>
                scr_up();
  8060c2:	b8 00 00 00 00       	mov    eax,0x0
  8060c7:	e8 60 fe ff ff       	call   805f2c <scr_up>
            for(int i=0;i<font_height*font_size;i++)
  8060cc:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8060d0:	8b 05 96 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21496]        # 42756c <font_height>
  8060d6:	8b 15 f4 4d 00 00    	mov    edx,DWORD PTR [rip+0x4df4]        # 80aed0 <font_size>
  8060dc:	0f af d0             	imul   edx,eax
  8060df:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8060e2:	39 c2                	cmp    edx,eax
  8060e4:	77 dc                	ja     8060c2 <print+0x71>
            fb_cursor_y=max_ch_nr_y-1;
  8060e6:	8b 05 6c 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2146c]        # 427558 <max_ch_nr_y>
  8060ec:	83 e8 01             	sub    eax,0x1
  8060ef:	89 05 5b 14 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2145b],eax        # 427550 <fb_cursor_y>
        }
        draw_letter(fb_cursor_x*font_width*font_size,fb_cursor_y*font_height*font_size,font_size,*s);
  8060f5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8060f9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8060fc:	0f be d0             	movsx  edx,al
  8060ff:	8b 05 cb 4d 00 00    	mov    eax,DWORD PTR [rip+0x4dcb]        # 80aed0 <font_size>
  806105:	8b 35 45 14 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21445]        # 427550 <fb_cursor_y>
  80610b:	8b 0d 5b 14 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc2145b]        # 42756c <font_height>
  806111:	0f af ce             	imul   ecx,esi
  806114:	8b 35 b6 4d 00 00    	mov    esi,DWORD PTR [rip+0x4db6]        # 80aed0 <font_size>
  80611a:	0f af ce             	imul   ecx,esi
  80611d:	41 89 c8             	mov    r8d,ecx
  806120:	8b 35 26 14 c2 ff    	mov    esi,DWORD PTR [rip+0xffffffffffc21426]        # 42754c <fb_cursor_x>
  806126:	8b 0d 3c 14 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc2143c]        # 427568 <font_width>
  80612c:	0f af ce             	imul   ecx,esi
  80612f:	8b 35 9b 4d 00 00    	mov    esi,DWORD PTR [rip+0x4d9b]        # 80aed0 <font_size>
  806135:	0f af ce             	imul   ecx,esi
  806138:	89 cf                	mov    edi,ecx
  80613a:	89 d1                	mov    ecx,edx
  80613c:	89 c2                	mov    edx,eax
  80613e:	44 89 c6             	mov    esi,r8d
  806141:	e8 b8 fc ff ff       	call   805dfe <draw_letter>
        fb_cursor_x+=1;
  806146:	8b 05 00 14 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc21400]        # 42754c <fb_cursor_x>
  80614c:	83 c0 01             	add    eax,0x1
  80614f:	89 05 f7 13 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc213f7],eax        # 42754c <fb_cursor_x>
  806155:	eb 01                	jmp    806158 <print+0x107>
        if(*s=='\n')continue;
  806157:	90                   	nop
    for(;*s;s++){
  806158:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80615d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  806161:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806164:	84 c0                	test   al,al
  806166:	0f 85 fa fe ff ff    	jne    806066 <print+0x15>
    }
}
  80616c:	90                   	nop
  80616d:	90                   	nop
  80616e:	c9                   	leave  
  80616f:	c3                   	ret    

0000000000806170 <path_walk>:
#include "errno.h"
#include "memory.h"
#include "log.h"

struct dir_entry * path_walk(char * name,unsigned long flags)
{
  806170:	f3 0f 1e fa          	endbr64 
  806174:	55                   	push   rbp
  806175:	48 89 e5             	mov    rbp,rsp
  806178:	48 83 ec 50          	sub    rsp,0x50
  80617c:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  806180:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
    char * tmpname = NULL;
  806184:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80618b:	00 
    int tmpnamelen = 0;
  80618c:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
    struct dir_entry * parent = root_sb->root;
  806193:	48 8b 05 ee 13 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc213ee]        # 427588 <root_sb>
  80619a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80619d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    struct dir_entry * path = NULL;
  8061a1:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8061a8:	00 

    while(*name == '/')
  8061a9:	eb 05                	jmp    8061b0 <path_walk+0x40>
        name++;
  8061ab:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
    while(*name == '/')
  8061b0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061b4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8061b7:	3c 2f                	cmp    al,0x2f
  8061b9:	74 f0                	je     8061ab <path_walk+0x3b>

    if(!*name)
  8061bb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061bf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8061c2:	84 c0                	test   al,al
  8061c4:	75 09                	jne    8061cf <path_walk+0x5f>
    {
        return parent;
  8061c6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8061ca:	e9 1b 02 00 00       	jmp    8063ea <path_walk+0x27a>
    }

    for(;;)
    {
        tmpname = name;
  8061cf:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061d3:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
        while(*name && (*name != '/'))
  8061d7:	eb 05                	jmp    8061de <path_walk+0x6e>
            name++;
  8061d9:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name && (*name != '/'))
  8061de:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061e2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8061e5:	84 c0                	test   al,al
  8061e7:	74 0b                	je     8061f4 <path_walk+0x84>
  8061e9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061ed:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8061f0:	3c 2f                	cmp    al,0x2f
  8061f2:	75 e5                	jne    8061d9 <path_walk+0x69>
        tmpnamelen = name - tmpname;
  8061f4:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8061f8:	48 2b 45 f0          	sub    rax,QWORD PTR [rbp-0x10]
  8061fc:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

        path = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  8061ff:	be 00 00 00 00       	mov    esi,0x0
  806204:	bf 48 00 00 00       	mov    edi,0x48
  806209:	b8 00 00 00 00       	mov    eax,0x0
  80620e:	e8 e8 ae ff ff       	call   8010fb <vmalloc>
  806213:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
        memset(path,0,sizeof(struct dir_entry));
  806217:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80621b:	ba 48 00 00 00       	mov    edx,0x48
  806220:	be 00 00 00 00       	mov    esi,0x0
  806225:	48 89 c7             	mov    rdi,rax
  806228:	e8 39 43 00 00       	call   80a566 <memset>

        path->name = vmalloc(tmpnamelen+1,0);
  80622d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806230:	83 c0 01             	add    eax,0x1
  806233:	be 00 00 00 00       	mov    esi,0x0
  806238:	89 c7                	mov    edi,eax
  80623a:	b8 00 00 00 00       	mov    eax,0x0
  80623f:	e8 b7 ae ff ff       	call   8010fb <vmalloc>
  806244:	48 89 c2             	mov    rdx,rax
  806247:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80624b:	48 89 10             	mov    QWORD PTR [rax],rdx
        memset(path->name,0,tmpnamelen+1);
  80624e:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806251:	83 c0 01             	add    eax,0x1
  806254:	48 63 d0             	movsxd rdx,eax
  806257:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80625b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80625e:	be 00 00 00 00       	mov    esi,0x0
  806263:	48 89 c7             	mov    rdi,rax
  806266:	e8 fb 42 00 00       	call   80a566 <memset>
        memcpy(tmpname,path->name,tmpnamelen);
  80626b:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80626e:	48 63 d0             	movsxd rdx,eax
  806271:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806275:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  806278:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80627c:	48 89 ce             	mov    rsi,rcx
  80627f:	48 89 c7             	mov    rdi,rax
  806282:	e8 30 42 00 00       	call   80a4b7 <memcpy>
        path->name_length = tmpnamelen;
  806287:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80628b:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
  80628e:	89 50 08             	mov    DWORD PTR [rax+0x8],edx

        if(parent->dir_inode->inode_ops->lookup(parent->dir_inode,path) == NULL)
  806291:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806295:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  806299:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  80629d:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
  8062a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8062a5:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8062a9:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
  8062ad:	48 89 d6             	mov    rsi,rdx
  8062b0:	48 89 c7             	mov    rdi,rax
  8062b3:	ff d1                	call   rcx
  8062b5:	48 85 c0             	test   rax,rax
  8062b8:	75 3e                	jne    8062f8 <path_walk+0x188>
        {
            printf("can not find file or dir:%s\n",path->name);
  8062ba:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8062be:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8062c1:	48 89 c6             	mov    rsi,rax
  8062c4:	bf b0 2a 81 00       	mov    edi,0x812ab0
  8062c9:	b8 00 00 00 00       	mov    eax,0x0
  8062ce:	e8 10 aa ff ff       	call   800ce3 <printf>
            vmfree(path->name);
  8062d3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8062d7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8062da:	48 89 c7             	mov    rdi,rax
  8062dd:	e8 a8 ae ff ff       	call   80118a <vmfree>
            vmfree(path);
  8062e2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8062e6:	48 89 c7             	mov    rdi,rax
  8062e9:	e8 9c ae ff ff       	call   80118a <vmfree>
            return NULL;
  8062ee:	b8 00 00 00 00       	mov    eax,0x0
  8062f3:	e9 f2 00 00 00       	jmp    8063ea <path_walk+0x27a>
        }

        list_init(&path->child_node);
  8062f8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8062fc:	48 83 c0 10          	add    rax,0x10
  806300:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
    struct List * next;
};

__attribute__((always_inline)) inline void list_init(struct List * list)
{
    list->prev = list;
  806304:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  806308:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  80630c:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  80630f:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  806313:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
  806317:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80631b:	90                   	nop
        list_init(&path->subdirs_list);
  80631c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806320:	48 83 c0 20          	add    rax,0x20
  806324:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  806328:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80632c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  806330:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  806333:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  806337:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80633b:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80633f:	90                   	nop
        path->parent = parent;
  806340:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806344:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  806348:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
        list_add_to_behind(&parent->subdirs_list,&path->child_node);
  80634c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806350:	48 83 c0 10          	add    rax,0x10
  806354:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  806358:	48 83 c2 20          	add    rdx,0x20
  80635c:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
  806360:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

__attribute__((always_inline)) inline void list_add_to_behind(struct List * entry,struct List * new)	////add to entry behind
{
    new->next = entry->next;
  806364:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806368:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
  80636c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806370:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
    new->prev = entry;
  806374:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806378:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  80637c:	48 89 10             	mov    QWORD PTR [rax],rdx
    new->next->prev = new;
  80637f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  806383:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  806387:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80638b:	48 89 10             	mov    QWORD PTR [rax],rdx
    entry->next = new;
  80638e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806392:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  806396:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80639a:	90                   	nop

        if(!*name)
  80639b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80639f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8063a2:	84 c0                	test   al,al
  8063a4:	74 2a                	je     8063d0 <path_walk+0x260>
            goto last_component;
        while(*name == '/')
  8063a6:	eb 05                	jmp    8063ad <path_walk+0x23d>
            name++;
  8063a8:	48 83 45 b8 01       	add    QWORD PTR [rbp-0x48],0x1
        while(*name == '/')
  8063ad:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8063b1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8063b4:	3c 2f                	cmp    al,0x2f
  8063b6:	74 f0                	je     8063a8 <path_walk+0x238>
        if(!*name)
  8063b8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8063bc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8063bf:	84 c0                	test   al,al
  8063c1:	74 10                	je     8063d3 <path_walk+0x263>
            goto last_slash;

        parent = path;
  8063c3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8063c7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    {
  8063cb:	e9 ff fd ff ff       	jmp    8061cf <path_walk+0x5f>
            goto last_component;
  8063d0:	90                   	nop
  8063d1:	eb 01                	jmp    8063d4 <path_walk+0x264>
            goto last_slash;
  8063d3:	90                   	nop
    }

    last_slash:
    last_component:

    if(flags & 1)
  8063d4:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  8063d8:	83 e0 01             	and    eax,0x1
  8063db:	48 85 c0             	test   rax,rax
  8063de:	74 06                	je     8063e6 <path_walk+0x276>
    {
        return parent;
  8063e0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8063e4:	eb 04                	jmp    8063ea <path_walk+0x27a>
    }

    return path;
  8063e6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  8063ea:	c9                   	leave  
  8063eb:	c3                   	ret    

00000000008063ec <fill_dentry>:

int fill_dentry(void *buf,char *name, long namelen,long type,long offset)
{
  8063ec:	f3 0f 1e fa          	endbr64 
  8063f0:	55                   	push   rbp
  8063f1:	48 89 e5             	mov    rbp,rsp
  8063f4:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8063f8:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8063fc:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  806400:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  806404:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
//
//    memcpy(name,dent->d_name,namelen);
//    dent->d_namelen = namelen;
//    dent->d_type = type;
//    dent->d_offset = offset;
    return sizeof(struct dirent) + namelen;
  806408:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80640c:	83 c0 18             	add    eax,0x18
}
  80640f:	5d                   	pop    rbp
  806410:	c3                   	ret    

0000000000806411 <mount_fs>:
//function mount_root
struct super_block * root_sb = NULL;
struct file_system_type filesystem = {"filesystem",0};

struct super_block* mount_fs(char * name,struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  806411:	f3 0f 1e fa          	endbr64 
  806415:	55                   	push   rbp
  806416:	48 89 e5             	mov    rbp,rsp
  806419:	48 83 ec 30          	sub    rsp,0x30
  80641d:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  806421:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  806425:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
    struct file_system_type * p = NULL;
  806429:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  806430:	00 

    for(p = &filesystem;p;p = p->next)
  806431:	48 c7 45 f8 e0 ae 80 	mov    QWORD PTR [rbp-0x8],0x80aee0
  806438:	00 
  806439:	eb 40                	jmp    80647b <mount_fs+0x6a>
        if(!strcmp(p->name,name))
  80643b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80643f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  806442:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  806446:	48 89 d6             	mov    rsi,rdx
  806449:	48 89 c7             	mov    rdi,rax
  80644c:	e8 04 43 00 00       	call   80a755 <strcmp>
  806451:	85 c0                	test   eax,eax
  806453:	75 1a                	jne    80646f <mount_fs+0x5e>
        {
            return p->read_superblock(DPTE,buf);
  806455:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806459:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
  80645d:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
  806461:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  806465:	48 89 d6             	mov    rsi,rdx
  806468:	48 89 c7             	mov    rdi,rax
  80646b:	ff d1                	call   rcx
  80646d:	eb 18                	jmp    806487 <mount_fs+0x76>
    for(p = &filesystem;p;p = p->next)
  80646f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806473:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806477:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80647b:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  806480:	75 b9                	jne    80643b <mount_fs+0x2a>
        }
    return 0;
  806482:	b8 00 00 00 00       	mov    eax,0x0
}
  806487:	c9                   	leave  
  806488:	c3                   	ret    

0000000000806489 <register_filesystem>:

unsigned long register_filesystem(struct file_system_type * fs)
{
  806489:	f3 0f 1e fa          	endbr64 
  80648d:	55                   	push   rbp
  80648e:	48 89 e5             	mov    rbp,rsp
  806491:	48 83 ec 20          	sub    rsp,0x20
  806495:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = NULL;
  806499:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8064a0:	00 

    for(p = &filesystem;p;p = p->next)
  8064a1:	48 c7 45 f8 e0 ae 80 	mov    QWORD PTR [rbp-0x8],0x80aee0
  8064a8:	00 
  8064a9:	eb 30                	jmp    8064db <register_filesystem+0x52>
        if(!strcmp(fs->name,p->name))
  8064ab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8064af:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  8064b2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8064b6:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8064b9:	48 89 d6             	mov    rsi,rdx
  8064bc:	48 89 c7             	mov    rdi,rax
  8064bf:	e8 91 42 00 00       	call   80a755 <strcmp>
  8064c4:	85 c0                	test   eax,eax
  8064c6:	75 07                	jne    8064cf <register_filesystem+0x46>
            return 0;
  8064c8:	b8 00 00 00 00       	mov    eax,0x0
  8064cd:	eb 32                	jmp    806501 <register_filesystem+0x78>
    for(p = &filesystem;p;p = p->next)
  8064cf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8064d3:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8064d7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  8064db:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8064e0:	75 c9                	jne    8064ab <register_filesystem+0x22>

    fs->next = filesystem.next;
  8064e2:	48 8b 15 0f 4a 00 00 	mov    rdx,QWORD PTR [rip+0x4a0f]        # 80aef8 <filesystem+0x18>
  8064e9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8064ed:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
    filesystem.next = fs;
  8064f1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8064f5:	48 89 05 fc 49 00 00 	mov    QWORD PTR [rip+0x49fc],rax        # 80aef8 <filesystem+0x18>

    return 1;
  8064fc:	b8 01 00 00 00       	mov    eax,0x1
}
  806501:	c9                   	leave  
  806502:	c3                   	ret    

0000000000806503 <unregister_filesystem>:

unsigned long unregister_filesystem(struct file_system_type * fs)
{
  806503:	f3 0f 1e fa          	endbr64 
  806507:	55                   	push   rbp
  806508:	48 89 e5             	mov    rbp,rsp
  80650b:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    struct file_system_type * p = &filesystem;
  80650f:	48 c7 45 f8 e0 ae 80 	mov    QWORD PTR [rbp-0x8],0x80aee0
  806516:	00 

    while(p->next)
  806517:	eb 41                	jmp    80655a <unregister_filesystem+0x57>
        if(p->next == fs)
  806519:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80651d:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806521:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
  806525:	75 27                	jne    80654e <unregister_filesystem+0x4b>
        {
            p->next = p->next->next;
  806527:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80652b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80652f:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  806533:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806537:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
            fs->next = NULL;
  80653b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80653f:	48 c7 40 18 00 00 00 	mov    QWORD PTR [rax+0x18],0x0
  806546:	00 
            return 1;
  806547:	b8 01 00 00 00       	mov    eax,0x1
  80654c:	eb 1e                	jmp    80656c <unregister_filesystem+0x69>
        }
        else
            p = p->next;
  80654e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  806552:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806556:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    while(p->next)
  80655a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80655e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  806562:	48 85 c0             	test   rax,rax
  806565:	75 b2                	jne    806519 <unregister_filesystem+0x16>
    return 0;
  806567:	b8 00 00 00 00       	mov    eax,0x0
}
  80656c:	5d                   	pop    rbp
  80656d:	c3                   	ret    

000000000080656e <shift>:
/* 0x5D - Apps      */ {  0,        0,       0x5D,      0x5D }
        };
char k_shift=0,k_ctrl=0,k_capslock=0;

void shift()
{
  80656e:	f3 0f 1e fa          	endbr64 
  806572:	55                   	push   rbp
  806573:	48 89 e5             	mov    rbp,rsp
    k_shift=!k_shift;
  806576:	0f b6 05 30 12 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21230]        # 4277ad <k_shift>
  80657d:	84 c0                	test   al,al
  80657f:	0f 94 c0             	sete   al
  806582:	88 05 25 12 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc21225],al        # 4277ad <k_shift>
}
  806588:	90                   	nop
  806589:	5d                   	pop    rbp
  80658a:	c3                   	ret    

000000000080658b <ctrl>:
void ctrl()
{
  80658b:	f3 0f 1e fa          	endbr64 
  80658f:	55                   	push   rbp
  806590:	48 89 e5             	mov    rbp,rsp
    k_ctrl=!k_ctrl;
  806593:	0f b6 05 14 12 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21214]        # 4277ae <k_ctrl>
  80659a:	84 c0                	test   al,al
  80659c:	0f 94 c0             	sete   al
  80659f:	88 05 09 12 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc21209],al        # 4277ae <k_ctrl>
}
  8065a5:	90                   	nop
  8065a6:	5d                   	pop    rbp
  8065a7:	c3                   	ret    

00000000008065a8 <capslock>:
void capslock()
{
  8065a8:	f3 0f 1e fa          	endbr64 
  8065ac:	55                   	push   rbp
  8065ad:	48 89 e5             	mov    rbp,rsp
    k_capslock=k_capslock==0?1:0;
  8065b0:	0f b6 05 f8 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc211f8]        # 4277af <k_capslock>
  8065b7:	84 c0                	test   al,al
  8065b9:	0f 94 c0             	sete   al
  8065bc:	88 05 ed 11 c2 ff    	mov    BYTE PTR [rip+0xffffffffffc211ed],al        # 4277af <k_capslock>
}
  8065c2:	90                   	nop
  8065c3:	5d                   	pop    rbp
  8065c4:	c3                   	ret    

00000000008065c5 <to_ascii>:
char to_ascii(char scan_code)
{
  8065c5:	f3 0f 1e fa          	endbr64 
  8065c9:	55                   	push   rbp
  8065ca:	48 89 e5             	mov    rbp,rsp
  8065cd:	89 f8                	mov    eax,edi
  8065cf:	88 45 ec             	mov    BYTE PTR [rbp-0x14],al
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  8065d2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8065d9:	e9 c7 00 00 00       	jmp    8066a5 <to_ascii+0xe0>
        if(key_map[i].scan_code==scan_code)
  8065de:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8065e1:	48 63 d0             	movsxd rdx,eax
  8065e4:	48 89 d0             	mov    rax,rdx
  8065e7:	48 c1 e0 02          	shl    rax,0x2
  8065eb:	48 01 d0             	add    rax,rdx
  8065ee:	48 05 42 2c 81 00    	add    rax,0x812c42
  8065f4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8065f7:	38 45 ec             	cmp    BYTE PTR [rbp-0x14],al
  8065fa:	0f 85 a1 00 00 00    	jne    8066a1 <to_ascii+0xdc>
        {
            if(k_capslock&&key_map[i].ascii>='a'&&key_map[i].ascii<='z')return key_map[i].ascii_shift;
  806600:	0f b6 05 a8 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc211a8]        # 4277af <k_capslock>
  806607:	84 c0                	test   al,al
  806609:	74 55                	je     806660 <to_ascii+0x9b>
  80660b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80660e:	48 63 d0             	movsxd rdx,eax
  806611:	48 89 d0             	mov    rax,rdx
  806614:	48 c1 e0 02          	shl    rax,0x2
  806618:	48 01 d0             	add    rax,rdx
  80661b:	48 05 40 2c 81 00    	add    rax,0x812c40
  806621:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806624:	3c 60                	cmp    al,0x60
  806626:	7e 38                	jle    806660 <to_ascii+0x9b>
  806628:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80662b:	48 63 d0             	movsxd rdx,eax
  80662e:	48 89 d0             	mov    rax,rdx
  806631:	48 c1 e0 02          	shl    rax,0x2
  806635:	48 01 d0             	add    rax,rdx
  806638:	48 05 40 2c 81 00    	add    rax,0x812c40
  80663e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806641:	3c 7a                	cmp    al,0x7a
  806643:	7f 1b                	jg     806660 <to_ascii+0x9b>
  806645:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806648:	48 63 d0             	movsxd rdx,eax
  80664b:	48 89 d0             	mov    rax,rdx
  80664e:	48 c1 e0 02          	shl    rax,0x2
  806652:	48 01 d0             	add    rax,rdx
  806655:	48 05 41 2c 81 00    	add    rax,0x812c41
  80665b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80665e:	eb 54                	jmp    8066b4 <to_ascii+0xef>
            else if(k_shift)return key_map[i].ascii_shift;
  806660:	0f b6 05 46 11 c2 ff 	movzx  eax,BYTE PTR [rip+0xffffffffffc21146]        # 4277ad <k_shift>
  806667:	84 c0                	test   al,al
  806669:	74 1b                	je     806686 <to_ascii+0xc1>
  80666b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80666e:	48 63 d0             	movsxd rdx,eax
  806671:	48 89 d0             	mov    rax,rdx
  806674:	48 c1 e0 02          	shl    rax,0x2
  806678:	48 01 d0             	add    rax,rdx
  80667b:	48 05 41 2c 81 00    	add    rax,0x812c41
  806681:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  806684:	eb 2e                	jmp    8066b4 <to_ascii+0xef>
            else return key_map[i].ascii;
  806686:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806689:	48 63 d0             	movsxd rdx,eax
  80668c:	48 89 d0             	mov    rax,rdx
  80668f:	48 c1 e0 02          	shl    rax,0x2
  806693:	48 01 d0             	add    rax,rdx
  806696:	48 05 40 2c 81 00    	add    rax,0x812c40
  80669c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80669f:	eb 13                	jmp    8066b4 <to_ascii+0xef>
    for(int i=0;i<0x5e;i++)//sizeof(key_map)/sizeof(key_code)
  8066a1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8066a5:	83 7d fc 5d          	cmp    DWORD PTR [rbp-0x4],0x5d
  8066a9:	0f 8e 2f ff ff ff    	jle    8065de <to_ascii+0x19>
        }

    return '\0';
  8066af:	b8 00 00 00 00       	mov    eax,0x0
}
  8066b4:	5d                   	pop    rbp
  8066b5:	c3                   	ret    

00000000008066b6 <init_kb>:
int init_kb()
{
  8066b6:	f3 0f 1e fa          	endbr64 
  8066ba:	55                   	push   rbp
  8066bb:	48 89 e5             	mov    rbp,rsp
    reg_device(&dev_keyboard);
  8066be:	bf 80 2b 81 00       	mov    edi,0x812b80
  8066c3:	e8 9c c3 ff ff       	call   802a64 <reg_device>
    reg_driver(&drv_keyboard);
  8066c8:	bf e0 2a 81 00       	mov    edi,0x812ae0
  8066cd:	e8 7a c6 ff ff       	call   802d4c <reg_driver>
}
  8066d2:	90                   	nop
  8066d3:	5d                   	pop    rbp
  8066d4:	c3                   	ret    

00000000008066d5 <key_proc>:
int key_proc()
{
  8066d5:	f3 0f 1e fa          	endbr64 
  8066d9:	55                   	push   rbp
  8066da:	48 89 e5             	mov    rbp,rsp
  8066dd:	48 83 ec 10          	sub    rsp,0x10
    //获取完整的扫描码
    u8 scan1=0,scan2=0,ch=0;
  8066e1:	c6 45 ff 00          	mov    BYTE PTR [rbp-0x1],0x0
  8066e5:	c6 45 fe 00          	mov    BYTE PTR [rbp-0x2],0x0
  8066e9:	c6 45 fd 00          	mov    BYTE PTR [rbp-0x3],0x0
    key_code tmpc;
    scan1=inb(0x60);
  8066ed:	bf 60 00 00 00       	mov    edi,0x60
  8066f2:	e8 32 e7 ff ff       	call   804e29 <inb>
  8066f7:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
//    tmpc.scan_code2=scan2;
//    tmpc.ascii= ch;


//    ENQUEUE(key_bufq,tmpc)
    if((key_bufq.tail+1)%key_bufq.size!=key_bufq.head)
  8066fa:	8b 05 0c 48 00 00    	mov    eax,DWORD PTR [rip+0x480c]        # 80af0c <key_bufq+0xc>
  806700:	83 c0 01             	add    eax,0x1
  806703:	8b 0d 07 48 00 00    	mov    ecx,DWORD PTR [rip+0x4807]        # 80af10 <key_bufq+0x10>
  806709:	99                   	cdq    
  80670a:	f7 f9                	idiv   ecx
  80670c:	8b 05 f6 47 00 00    	mov    eax,DWORD PTR [rip+0x47f6]        # 80af08 <key_bufq+0x8>
  806712:	39 c2                	cmp    edx,eax
  806714:	74 32                	je     806748 <key_proc+0x73>
    {
        key_bufq.data[key_bufq.tail]=scan1;
  806716:	48 8b 15 e3 47 00 00 	mov    rdx,QWORD PTR [rip+0x47e3]        # 80af00 <key_bufq>
  80671d:	8b 05 e9 47 00 00    	mov    eax,DWORD PTR [rip+0x47e9]        # 80af0c <key_bufq+0xc>
  806723:	48 98                	cdqe   
  806725:	48 01 c2             	add    rdx,rax
  806728:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  80672c:	88 02                	mov    BYTE PTR [rdx],al
        key_bufq.tail=(key_bufq.tail+1)%key_bufq.size;
  80672e:	8b 05 d8 47 00 00    	mov    eax,DWORD PTR [rip+0x47d8]        # 80af0c <key_bufq+0xc>
  806734:	83 c0 01             	add    eax,0x1
  806737:	8b 0d d3 47 00 00    	mov    ecx,DWORD PTR [rip+0x47d3]        # 80af10 <key_bufq+0x10>
  80673d:	99                   	cdq    
  80673e:	f7 f9                	idiv   ecx
  806740:	89 d0                	mov    eax,edx
  806742:	89 05 c4 47 00 00    	mov    DWORD PTR [rip+0x47c4],eax        # 80af0c <key_bufq+0xc>
    }

    if(scan1==0x48)
  806748:	80 7d ff 48          	cmp    BYTE PTR [rbp-0x1],0x48
  80674c:	75 0a                	jne    806758 <key_proc+0x83>
        scr_up();
  80674e:	b8 00 00 00 00       	mov    eax,0x0
  806753:	e8 d4 f7 ff ff       	call   805f2c <scr_up>
    if(scan1==0x50)
  806758:	80 7d ff 50          	cmp    BYTE PTR [rbp-0x1],0x50
  80675c:	75 0a                	jne    806768 <key_proc+0x93>
        scr_down();
  80675e:	b8 00 00 00 00       	mov    eax,0x0
  806763:	e8 55 f8 ff ff       	call   805fbd <scr_down>
    switch (scan1)
  806768:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  80676c:	3d b6 00 00 00       	cmp    eax,0xb6
  806771:	74 41                	je     8067b4 <key_proc+0xdf>
  806773:	3d b6 00 00 00       	cmp    eax,0xb6
  806778:	7f 5e                	jg     8067d8 <key_proc+0x103>
  80677a:	3d aa 00 00 00       	cmp    eax,0xaa
  80677f:	74 33                	je     8067b4 <key_proc+0xdf>
  806781:	3d aa 00 00 00       	cmp    eax,0xaa
  806786:	7f 50                	jg     8067d8 <key_proc+0x103>
  806788:	3d 9d 00 00 00       	cmp    eax,0x9d
  80678d:	74 31                	je     8067c0 <key_proc+0xeb>
  80678f:	3d 9d 00 00 00       	cmp    eax,0x9d
  806794:	7f 42                	jg     8067d8 <key_proc+0x103>
  806796:	83 f8 3a             	cmp    eax,0x3a
  806799:	74 31                	je     8067cc <key_proc+0xf7>
  80679b:	83 f8 3a             	cmp    eax,0x3a
  80679e:	7f 38                	jg     8067d8 <key_proc+0x103>
  8067a0:	83 f8 36             	cmp    eax,0x36
  8067a3:	74 0f                	je     8067b4 <key_proc+0xdf>
  8067a5:	83 f8 36             	cmp    eax,0x36
  8067a8:	7f 2e                	jg     8067d8 <key_proc+0x103>
  8067aa:	83 f8 1d             	cmp    eax,0x1d
  8067ad:	74 11                	je     8067c0 <key_proc+0xeb>
  8067af:	83 f8 2a             	cmp    eax,0x2a
  8067b2:	75 24                	jne    8067d8 <key_proc+0x103>
    {
        case 0x36:
        case 0x2a:
        case 0xaa:
        case 0xb6:
            shift();
  8067b4:	b8 00 00 00 00       	mov    eax,0x0
  8067b9:	e8 b0 fd ff ff       	call   80656e <shift>
            break;
  8067be:	eb 19                	jmp    8067d9 <key_proc+0x104>
        case 0x1d:
        case 0x9d:
            ctrl();
  8067c0:	b8 00 00 00 00       	mov    eax,0x0
  8067c5:	e8 c1 fd ff ff       	call   80658b <ctrl>
            break;
  8067ca:	eb 0d                	jmp    8067d9 <key_proc+0x104>
        case 0x3a:
            capslock();
  8067cc:	b8 00 00 00 00       	mov    eax,0x0
  8067d1:	e8 d2 fd ff ff       	call   8065a8 <capslock>
            break;
  8067d6:	eb 01                	jmp    8067d9 <key_proc+0x104>
        default:
            break;
  8067d8:	90                   	nop
//        //logf("%x\n",stdin.w_ptr);
//        //print_stdin();
//        //printchar(ch);
//        //flush_screen(0);*/
//    }
    eoi();
  8067d9:	b8 00 00 00 00       	mov    eax,0x0
  8067de:	e8 5b e6 ff ff       	call   804e3e <eoi>
    asm volatile("leave \r\n iretq");
  8067e3:	c9                   	leave  
  8067e4:	48 cf                	iretq  
}
  8067e6:	90                   	nop
  8067e7:	c9                   	leave  
  8067e8:	c3                   	ret    

00000000008067e9 <sys_getkbc>:

char sys_getkbc()
{
  8067e9:	f3 0f 1e fa          	endbr64 
  8067ed:	55                   	push   rbp
  8067ee:	48 89 e5             	mov    rbp,rsp
    if(key_bufq.tail==key_bufq.head)return -1;
  8067f1:	8b 15 15 47 00 00    	mov    edx,DWORD PTR [rip+0x4715]        # 80af0c <key_bufq+0xc>
  8067f7:	8b 05 0b 47 00 00    	mov    eax,DWORD PTR [rip+0x470b]        # 80af08 <key_bufq+0x8>
  8067fd:	39 c2                	cmp    edx,eax
  8067ff:	75 07                	jne    806808 <sys_getkbc+0x1f>
  806801:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806806:	eb 30                	jmp    806838 <sys_getkbc+0x4f>
    char c=key_buf[key_bufq.tail];
  806808:	8b 05 fe 46 00 00    	mov    eax,DWORD PTR [rip+0x46fe]        # 80af0c <key_bufq+0xc>
  80680e:	48 98                	cdqe   
  806810:	0f b6 80 a0 75 42 00 	movzx  eax,BYTE PTR [rax+0x4275a0]
  806817:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
    QTAIL(key_bufq)=(QTAIL(key_bufq)+1)%QSIZE(key_bufq);
  80681a:	8b 05 ec 46 00 00    	mov    eax,DWORD PTR [rip+0x46ec]        # 80af0c <key_bufq+0xc>
  806820:	83 c0 01             	add    eax,0x1
  806823:	8b 0d e7 46 00 00    	mov    ecx,DWORD PTR [rip+0x46e7]        # 80af10 <key_bufq+0x10>
  806829:	99                   	cdq    
  80682a:	f7 f9                	idiv   ecx
  80682c:	89 d0                	mov    eax,edx
  80682e:	89 05 d8 46 00 00    	mov    DWORD PTR [rip+0x46d8],eax        # 80af0c <key_bufq+0xc>
    return c;
  806834:	0f b6 45 ff          	movzx  eax,BYTE PTR [rbp-0x1]
  806838:	5d                   	pop    rbp
  806839:	c3                   	ret    

000000000080683a <init_disk>:
        .read=async_read_disk,
        .write=async_write_disk
};
int disks[4];//四块硬盘的dev号
int init_disk()
{
  80683a:	f3 0f 1e fa          	endbr64 
  80683e:	55                   	push   rbp
  80683f:	48 89 e5             	mov    rbp,rsp
    //disk_devi= reg_device(&dev_disk);
    //disk_drvi= reg_driver(&drv_disk);
    //dev_disk.drv=&drv_disk;
    hd_iterate();
  806842:	b8 00 00 00 00       	mov    eax,0x0
  806847:	e8 8d 09 00 00       	call   8071d9 <hd_iterate>
    return 0;
  80684c:	b8 00 00 00 00       	mov    eax,0x0
}
  806851:	5d                   	pop    rbp
  806852:	c3                   	ret    

0000000000806853 <disk_int_handler_c>:

int disk_int_handler_c()
{
  806853:	f3 0f 1e fa          	endbr64 
  806857:	55                   	push   rbp
  806858:	48 89 e5             	mov    rbp,rsp
  80685b:	48 83 ec 20          	sub    rsp,0x20
    if(running_req==NULL)
  80685f:	48 8b 05 5a 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c5a]        # 42a4c0 <running_req>
  806866:	48 85 c0             	test   rax,rax
  806869:	75 0a                	jne    806875 <disk_int_handler_c+0x22>
    {
        //printf("err:null running dreq\n");
        return 1;//同步读写硬盘
  80686b:	b8 01 00 00 00       	mov    eax,0x1
  806870:	e9 a3 01 00 00       	jmp    806a18 <disk_int_handler_c+0x1c5>
    }
    short *p=running_req->buf;
  806875:	48 8b 05 44 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c44]        # 42a4c0 <running_req>
  80687c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  806880:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int port=PORT_DISK_MAJOR;
  806884:	c7 45 f4 f0 01 00 00 	mov    DWORD PTR [rbp-0xc],0x1f0
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  80688b:	48 8b 05 2e 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c2e]        # 42a4c0 <running_req>
  806892:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806895:	83 f8 02             	cmp    eax,0x2
  806898:	74 0f                	je     8068a9 <disk_int_handler_c+0x56>
    running_req->disk==DISK_SLAVE_SLAVE)
  80689a:	48 8b 05 1f 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c1f]        # 42a4c0 <running_req>
  8068a1:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
    if(running_req->disk==DISK_SLAVE_MAJOR||\
  8068a4:	83 f8 03             	cmp    eax,0x3
  8068a7:	75 07                	jne    8068b0 <disk_int_handler_c+0x5d>
        port=PORT_DISK_SLAVE;
  8068a9:	c7 45 f4 70 01 00 00 	mov    DWORD PTR [rbp-0xc],0x170
    if(running_req->func==DISKREQ_READ)
  8068b0:	48 8b 05 09 3c c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23c09]        # 42a4c0 <running_req>
  8068b7:	8b 00                	mov    eax,DWORD PTR [rax]
  8068b9:	85 c0                	test   eax,eax
  8068bb:	75 42                	jne    8068ff <disk_int_handler_c+0xac>
    {
        ////printf("sys_read dist:%x\n",p);
        //读取
        for(int i=0;i<running_req->sec_n*256;i++)
  8068bd:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8068c4:	eb 22                	jmp    8068e8 <disk_int_handler_c+0x95>
        {
            *p++=inw(port);
  8068c6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8068c9:	0f b7 c0             	movzx  eax,ax
  8068cc:	89 c7                	mov    edi,eax
  8068ce:	e8 60 e5 ff ff       	call   804e33 <inw>
  8068d3:	89 c2                	mov    edx,eax
  8068d5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8068d9:	48 8d 48 02          	lea    rcx,[rax+0x2]
  8068dd:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  8068e1:	66 89 10             	mov    WORD PTR [rax],dx
        for(int i=0;i<running_req->sec_n*256;i++)
  8068e4:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  8068e8:	48 8b 05 d1 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23bd1]        # 42a4c0 <running_req>
  8068ef:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  8068f2:	c1 e0 08             	shl    eax,0x8
  8068f5:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  8068f8:	7c cc                	jl     8068c6 <disk_int_handler_c+0x73>
  8068fa:	e9 ca 00 00 00       	jmp    8069c9 <disk_int_handler_c+0x176>
        }
    }else if(running_req->func==DISKREQ_WRITE)
  8068ff:	48 8b 05 ba 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23bba]        # 42a4c0 <running_req>
  806906:	8b 00                	mov    eax,DWORD PTR [rax]
  806908:	83 f8 01             	cmp    eax,0x1
  80690b:	75 42                	jne    80694f <disk_int_handler_c+0xfc>
    {
        for(int i=0;i<running_req->sec_n*256;i++)
  80690d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  806914:	eb 25                	jmp    80693b <disk_int_handler_c+0xe8>
            outw(port,*p++);
  806916:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80691a:	48 8d 50 02          	lea    rdx,[rax+0x2]
  80691e:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  806922:	0f b7 00             	movzx  eax,WORD PTR [rax]
  806925:	0f b7 d0             	movzx  edx,ax
  806928:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80692b:	0f b7 c0             	movzx  eax,ax
  80692e:	89 d6                	mov    esi,edx
  806930:	89 c7                	mov    edi,eax
  806932:	e8 e6 e4 ff ff       	call   804e1d <outw>
        for(int i=0;i<running_req->sec_n*256;i++)
  806937:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  80693b:	48 8b 05 7e 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b7e]        # 42a4c0 <running_req>
  806942:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  806945:	c1 e0 08             	shl    eax,0x8
  806948:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
  80694b:	7c c9                	jl     806916 <disk_int_handler_c+0xc3>
  80694d:	eb 7a                	jmp    8069c9 <disk_int_handler_c+0x176>
    }else if(running_req->func==DISKREQ_CHECK)
  80694f:	48 8b 05 6a 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b6a]        # 42a4c0 <running_req>
  806956:	8b 00                	mov    eax,DWORD PTR [rax]
  806958:	83 f8 02             	cmp    eax,0x2
  80695b:	75 34                	jne    806991 <disk_int_handler_c+0x13e>
    {
        char stat=inb(port+7);
  80695d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806960:	83 c0 07             	add    eax,0x7
  806963:	0f b6 c0             	movzx  eax,al
  806966:	89 c7                	mov    edi,eax
  806968:	e8 bc e4 ff ff       	call   804e29 <inb>
  80696d:	88 45 e7             	mov    BYTE PTR [rbp-0x19],al
        short dat=inw(port);
  806970:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  806973:	0f b7 c0             	movzx  eax,ax
  806976:	89 c7                	mov    edi,eax
  806978:	e8 b6 e4 ff ff       	call   804e33 <inw>
  80697d:	66 89 45 e4          	mov    WORD PTR [rbp-0x1c],ax
        if(1)
        {
            running_req->result=DISK_CHK_OK;
  806981:	48 8b 05 38 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b38]        # 42a4c0 <running_req>
  806988:	c7 40 20 01 00 00 00 	mov    DWORD PTR [rax+0x20],0x1
  80698f:	eb 38                	jmp    8069c9 <disk_int_handler_c+0x176>
            char err=inb(port+1);//错误原因
            printf("checking disk err:%x\nresetting hd\n",err);
            running_req->result=DISK_CHK_ERR;
            request(running_req->disk,DISKREQ_RESET,0,0,0);
        }
    }else if(running_req->func==DISKREQ_RESET)
  806991:	48 8b 05 28 3b c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23b28]        # 42a4c0 <running_req>
  806998:	8b 00                	mov    eax,DWORD PTR [rax]
  80699a:	83 f8 03             	cmp    eax,0x3
  80699d:	75 2a                	jne    8069c9 <disk_int_handler_c+0x176>
    {
        int stat=inb(port+7);
  80699f:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8069a2:	83 c0 07             	add    eax,0x7
  8069a5:	0f b6 c0             	movzx  eax,al
  8069a8:	89 c7                	mov    edi,eax
  8069aa:	e8 7a e4 ff ff       	call   804e29 <inb>
  8069af:	0f b6 c0             	movzx  eax,al
  8069b2:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
        printf("reset disk done.\nstat now:%x\n",stat);
  8069b5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  8069b8:	89 c6                	mov    esi,eax
  8069ba:	bf 16 2e 81 00       	mov    edi,0x812e16
  8069bf:	b8 00 00 00 00       	mov    eax,0x0
  8069c4:	e8 1a a3 ff ff       	call   800ce3 <printf>
    }
    running_req->stat=REQ_STAT_DONE;
  8069c9:	48 8b 05 f0 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23af0]        # 42a4c0 <running_req>
  8069d0:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8069d7:	48 8b 05 e2 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23ae2]        # 42a4c0 <running_req>
  8069de:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8069e2:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8069e9:	00 00 00 
    running_devman_req->stat=REQ_STAT_DONE;
  8069ec:	48 8b 05 d5 3a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23ad5]        # 42a4c8 <running_devman_req>
  8069f3:	c7 80 ac 00 00 00 03 	mov    DWORD PTR [rax+0xac],0x3
  8069fa:	00 00 00 
    running_devman_req=NULL;
  8069fd:	48 c7 05 c0 3a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23ac0],0x0        # 42a4c8 <running_devman_req>
  806a04:	00 00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  806a08:	48 c7 05 ad 3a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23aad],0x0        # 42a4c0 <running_req>
  806a0f:	00 00 00 00 
    return 0;
  806a13:	b8 00 00 00 00       	mov    eax,0x0
}
  806a18:	c9                   	leave  
  806a19:	c3                   	ret    

0000000000806a1a <check_dreq_stat>:
int check_dreq_stat(int req_id)
{
  806a1a:	f3 0f 1e fa          	endbr64 
  806a1e:	55                   	push   rbp
  806a1f:	48 89 e5             	mov    rbp,rsp
  806a22:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    return disk_reqs[req_id].stat;
  806a25:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  806a28:	48 63 d0             	movsxd rdx,eax
  806a2b:	48 89 d0             	mov    rax,rdx
  806a2e:	48 01 c0             	add    rax,rax
  806a31:	48 01 d0             	add    rax,rdx
  806a34:	48 c1 e0 04          	shl    rax,0x4
  806a38:	48 05 dc 77 42 00    	add    rax,0x4277dc
  806a3e:	8b 00                	mov    eax,DWORD PTR [rax]
}
  806a40:	5d                   	pop    rbp
  806a41:	c3                   	ret    

0000000000806a42 <request>:
int request(int disk,int func,int lba,int secn,char *buf){
  806a42:	f3 0f 1e fa          	endbr64 
  806a46:	55                   	push   rbp
  806a47:	48 89 e5             	mov    rbp,rsp
  806a4a:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806a4d:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806a50:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806a53:	89 4d e0             	mov    DWORD PTR [rbp-0x20],ecx
  806a56:	4c 89 45 d8          	mov    QWORD PTR [rbp-0x28],r8
    if((tail+1)%MAX_DISK_REQUEST_COUNT==head)
  806a5a:	8b 05 94 3a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23a94]        # 42a4f4 <tail>
  806a60:	83 c0 01             	add    eax,0x1
  806a63:	48 63 d0             	movsxd rdx,eax
  806a66:	48 69 d2 89 88 88 88 	imul   rdx,rdx,0xffffffff88888889
  806a6d:	48 c1 ea 20          	shr    rdx,0x20
  806a71:	01 c2                	add    edx,eax
  806a73:	c1 fa 07             	sar    edx,0x7
  806a76:	89 c1                	mov    ecx,eax
  806a78:	c1 f9 1f             	sar    ecx,0x1f
  806a7b:	29 ca                	sub    edx,ecx
  806a7d:	69 ca f0 00 00 00    	imul   ecx,edx,0xf0
  806a83:	29 c8                	sub    eax,ecx
  806a85:	89 c2                	mov    edx,eax
  806a87:	8b 05 63 3a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23a63]        # 42a4f0 <head>
  806a8d:	39 c2                	cmp    edx,eax
  806a8f:	75 0a                	jne    806a9b <request+0x59>
    {
        return -1;
  806a91:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806a96:	e9 0d 01 00 00       	jmp    806ba8 <request+0x166>
    }
    disk_reqs[tail].disk=disk;
  806a9b:	8b 05 53 3a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23a53]        # 42a4f4 <tail>
  806aa1:	48 63 d0             	movsxd rdx,eax
  806aa4:	48 89 d0             	mov    rax,rdx
  806aa7:	48 01 c0             	add    rax,rax
  806aaa:	48 01 d0             	add    rax,rdx
  806aad:	48 c1 e0 04          	shl    rax,0x4
  806ab1:	48 8d 90 c4 77 42 00 	lea    rdx,[rax+0x4277c4]
  806ab8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  806abb:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].func=func;
  806abd:	8b 05 31 3a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23a31]        # 42a4f4 <tail>
  806ac3:	48 63 d0             	movsxd rdx,eax
  806ac6:	48 89 d0             	mov    rax,rdx
  806ac9:	48 01 c0             	add    rax,rax
  806acc:	48 01 d0             	add    rax,rdx
  806acf:	48 c1 e0 04          	shl    rax,0x4
  806ad3:	48 8d 90 c0 77 42 00 	lea    rdx,[rax+0x4277c0]
  806ada:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806add:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].lba=lba;
  806adf:	8b 05 0f 3a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23a0f]        # 42a4f4 <tail>
  806ae5:	48 63 d0             	movsxd rdx,eax
  806ae8:	48 89 d0             	mov    rax,rdx
  806aeb:	48 01 c0             	add    rax,rax
  806aee:	48 01 d0             	add    rax,rdx
  806af1:	48 c1 e0 04          	shl    rax,0x4
  806af5:	48 8d 90 c8 77 42 00 	lea    rdx,[rax+0x4277c8]
  806afc:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806aff:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].sec_n=secn;
  806b01:	8b 05 ed 39 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc239ed]        # 42a4f4 <tail>
  806b07:	48 63 d0             	movsxd rdx,eax
  806b0a:	48 89 d0             	mov    rax,rdx
  806b0d:	48 01 c0             	add    rax,rax
  806b10:	48 01 d0             	add    rax,rdx
  806b13:	48 c1 e0 04          	shl    rax,0x4
  806b17:	48 8d 90 cc 77 42 00 	lea    rdx,[rax+0x4277cc]
  806b1e:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  806b21:	89 02                	mov    DWORD PTR [rdx],eax
    disk_reqs[tail].stat=REQ_STAT_READY;
  806b23:	8b 05 cb 39 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc239cb]        # 42a4f4 <tail>
  806b29:	48 63 d0             	movsxd rdx,eax
  806b2c:	48 89 d0             	mov    rax,rdx
  806b2f:	48 01 c0             	add    rax,rax
  806b32:	48 01 d0             	add    rax,rdx
  806b35:	48 c1 e0 04          	shl    rax,0x4
  806b39:	48 05 dc 77 42 00    	add    rax,0x4277dc
  806b3f:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
    disk_reqs[tail].buf=buf;
  806b45:	8b 05 a9 39 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc239a9]        # 42a4f4 <tail>
  806b4b:	48 63 d0             	movsxd rdx,eax
  806b4e:	48 89 d0             	mov    rax,rdx
  806b51:	48 01 c0             	add    rax,rax
  806b54:	48 01 d0             	add    rax,rdx
  806b57:	48 c1 e0 04          	shl    rax,0x4
  806b5b:	48 8d 90 d0 77 42 00 	lea    rdx,[rax+0x4277d0]
  806b62:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  806b66:	48 89 02             	mov    QWORD PTR [rdx],rax
    int r=tail;
  806b69:	8b 05 85 39 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23985]        # 42a4f4 <tail>
  806b6f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    tail=(tail+1)%MAX_DISK_REQUEST_COUNT;
  806b72:	8b 05 7c 39 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2397c]        # 42a4f4 <tail>
  806b78:	8d 50 01             	lea    edx,[rax+0x1]
  806b7b:	48 63 c2             	movsxd rax,edx
  806b7e:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806b85:	48 c1 e8 20          	shr    rax,0x20
  806b89:	01 d0                	add    eax,edx
  806b8b:	c1 f8 07             	sar    eax,0x7
  806b8e:	89 d1                	mov    ecx,edx
  806b90:	c1 f9 1f             	sar    ecx,0x1f
  806b93:	29 c8                	sub    eax,ecx
  806b95:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  806b9b:	89 d0                	mov    eax,edx
  806b9d:	29 c8                	sub    eax,ecx
  806b9f:	89 05 4f 39 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2394f],eax        # 42a4f4 <tail>
    return r;
  806ba5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  806ba8:	5d                   	pop    rbp
  806ba9:	c3                   	ret    

0000000000806baa <execute_request>:
int execute_request(){
  806baa:	f3 0f 1e fa          	endbr64 
  806bae:	55                   	push   rbp
  806baf:	48 89 e5             	mov    rbp,rsp
  806bb2:	48 83 ec 10          	sub    rsp,0x10
    //查看是否有已经在运行的请求
    if(running_req!=NULL)
  806bb6:	48 8b 05 03 39 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23903]        # 42a4c0 <running_req>
  806bbd:	48 85 c0             	test   rax,rax
  806bc0:	74 6a                	je     806c2c <execute_request+0x82>
    {
        running_req->time++;
  806bc2:	48 8b 05 f7 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238f7]        # 42a4c0 <running_req>
  806bc9:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  806bcc:	83 c2 01             	add    edx,0x1
  806bcf:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
        if(running_req->func!=DISKREQ_CHECK)
  806bd2:	48 8b 05 e7 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238e7]        # 42a4c0 <running_req>
  806bd9:	8b 00                	mov    eax,DWORD PTR [rax]
  806bdb:	83 f8 02             	cmp    eax,0x2
  806bde:	74 0a                	je     806bea <execute_request+0x40>
            return 2;
  806be0:	b8 02 00 00 00       	mov    eax,0x2
  806be5:	e9 b4 01 00 00       	jmp    806d9e <execute_request+0x1f4>
        if(running_req->time>MAX_DISK_CHKTIME)
  806bea:	48 8b 05 cf 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238cf]        # 42a4c0 <running_req>
  806bf1:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  806bf4:	83 f8 0a             	cmp    eax,0xa
  806bf7:	7e 29                	jle    806c22 <execute_request+0x78>
        {
            //检测硬盘超时，视为没有硬盘连接
            running_req->result=DISK_CHK_ERR;
  806bf9:	48 8b 05 c0 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238c0]        # 42a4c0 <running_req>
  806c00:	c7 40 20 02 00 00 00 	mov    DWORD PTR [rax+0x20],0x2
            running_req->stat=REQ_STAT_DONE;
  806c07:	48 8b 05 b2 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc238b2]        # 42a4c0 <running_req>
  806c0e:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
            running_req=NULL;
  806c15:	48 c7 05 a0 38 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc238a0],0x0        # 42a4c0 <running_req>
  806c1c:	00 00 00 00 
  806c20:	eb 0a                	jmp    806c2c <execute_request+0x82>
        }else
        {
            //未到时间继续等待
            return 2;
  806c22:	b8 02 00 00 00       	mov    eax,0x2
  806c27:	e9 72 01 00 00       	jmp    806d9e <execute_request+0x1f4>
        }
    }
    if(head==tail)return 1;//检查是否为空
  806c2c:	8b 15 be 38 c2 ff    	mov    edx,DWORD PTR [rip+0xffffffffffc238be]        # 42a4f0 <head>
  806c32:	8b 05 bc 38 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc238bc]        # 42a4f4 <tail>
  806c38:	39 c2                	cmp    edx,eax
  806c3a:	75 0a                	jne    806c46 <execute_request+0x9c>
  806c3c:	b8 01 00 00 00       	mov    eax,0x1
  806c41:	e9 58 01 00 00       	jmp    806d9e <execute_request+0x1f4>
    running_req=&disk_reqs[head];
  806c46:	8b 05 a4 38 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc238a4]        # 42a4f0 <head>
  806c4c:	48 63 d0             	movsxd rdx,eax
  806c4f:	48 89 d0             	mov    rax,rdx
  806c52:	48 01 c0             	add    rax,rax
  806c55:	48 01 d0             	add    rax,rdx
  806c58:	48 c1 e0 04          	shl    rax,0x4
  806c5c:	48 05 c0 77 42 00    	add    rax,0x4277c0
  806c62:	48 89 05 57 38 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23857],rax        # 42a4c0 <running_req>
    head=(head+1)%MAX_DISK_REQUEST_COUNT;
  806c69:	8b 05 81 38 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc23881]        # 42a4f0 <head>
  806c6f:	8d 50 01             	lea    edx,[rax+0x1]
  806c72:	48 63 c2             	movsxd rax,edx
  806c75:	48 69 c0 89 88 88 88 	imul   rax,rax,0xffffffff88888889
  806c7c:	48 c1 e8 20          	shr    rax,0x20
  806c80:	01 d0                	add    eax,edx
  806c82:	c1 f8 07             	sar    eax,0x7
  806c85:	89 d1                	mov    ecx,edx
  806c87:	c1 f9 1f             	sar    ecx,0x1f
  806c8a:	29 c8                	sub    eax,ecx
  806c8c:	69 c8 f0 00 00 00    	imul   ecx,eax,0xf0
  806c92:	89 d0                	mov    eax,edx
  806c94:	29 c8                	sub    eax,ecx
  806c96:	89 05 54 38 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc23854],eax        # 42a4f0 <head>
    running_req->stat=REQ_STAT_WORKING;
  806c9c:	48 8b 05 1d 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2381d]        # 42a4c0 <running_req>
  806ca3:	c7 40 1c 02 00 00 00 	mov    DWORD PTR [rax+0x1c],0x2
    //set_proc_stat(running_req->pid,SUSPENDED);
    int r=0;
  806caa:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    switch (running_req->func)
  806cb1:	48 8b 05 08 38 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23808]        # 42a4c0 <running_req>
  806cb8:	8b 00                	mov    eax,DWORD PTR [rax]
  806cba:	83 f8 03             	cmp    eax,0x3
  806cbd:	0f 84 ad 00 00 00    	je     806d70 <execute_request+0x1c6>
  806cc3:	83 f8 03             	cmp    eax,0x3
  806cc6:	0f 8f bf 00 00 00    	jg     806d8b <execute_request+0x1e1>
  806ccc:	83 f8 02             	cmp    eax,0x2
  806ccf:	0f 84 85 00 00 00    	je     806d5a <execute_request+0x1b0>
  806cd5:	83 f8 02             	cmp    eax,0x2
  806cd8:	0f 8f ad 00 00 00    	jg     806d8b <execute_request+0x1e1>
  806cde:	85 c0                	test   eax,eax
  806ce0:	74 0a                	je     806cec <execute_request+0x142>
  806ce2:	83 f8 01             	cmp    eax,0x1
  806ce5:	74 3c                	je     806d23 <execute_request+0x179>
        break;
    case DISKREQ_RESET:
        r=async_reset_disk(running_req->disk);
        break;
    default:
        break;
  806ce7:	e9 9f 00 00 00       	jmp    806d8b <execute_request+0x1e1>
        running_req->lba,running_req->sec_n,running_req->buf);
  806cec:	48 8b 05 cd 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237cd]        # 42a4c0 <running_req>
        r=async_read_disk(running_req->disk,\
  806cf3:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
        running_req->lba,running_req->sec_n,running_req->buf);
  806cf7:	48 8b 05 c2 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237c2]        # 42a4c0 <running_req>
        r=async_read_disk(running_req->disk,\
  806cfe:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
        running_req->lba,running_req->sec_n,running_req->buf);
  806d01:	48 8b 05 b8 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237b8]        # 42a4c0 <running_req>
  806d08:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_read_disk(running_req->disk,\
  806d0b:	89 c6                	mov    esi,eax
  806d0d:	48 8b 05 ac 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc237ac]        # 42a4c0 <running_req>
  806d14:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806d17:	89 c7                	mov    edi,eax
  806d19:	e8 a7 00 00 00       	call   806dc5 <async_read_disk>
  806d1e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806d21:	eb 69                	jmp    806d8c <execute_request+0x1e2>
         running_req->lba,running_req->sec_n,running_req->buf);
  806d23:	48 8b 05 96 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23796]        # 42a4c0 <running_req>
        r=async_write_disk(running_req->disk,\
  806d2a:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
         running_req->lba,running_req->sec_n,running_req->buf);
  806d2e:	48 8b 05 8b 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2378b]        # 42a4c0 <running_req>
        r=async_write_disk(running_req->disk,\
  806d35:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
         running_req->lba,running_req->sec_n,running_req->buf);
  806d38:	48 8b 05 81 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23781]        # 42a4c0 <running_req>
  806d3f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
        r=async_write_disk(running_req->disk,\
  806d42:	89 c6                	mov    esi,eax
  806d44:	48 8b 05 75 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23775]        # 42a4c0 <running_req>
  806d4b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806d4e:	89 c7                	mov    edi,eax
  806d50:	e8 88 01 00 00       	call   806edd <async_write_disk>
  806d55:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806d58:	eb 32                	jmp    806d8c <execute_request+0x1e2>
        r=async_check_disk(running_req->disk);
  806d5a:	48 8b 05 5f 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2375f]        # 42a4c0 <running_req>
  806d61:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806d64:	89 c7                	mov    edi,eax
  806d66:	e8 8f 06 00 00       	call   8073fa <async_check_disk>
  806d6b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806d6e:	eb 1c                	jmp    806d8c <execute_request+0x1e2>
        r=async_reset_disk(running_req->disk);
  806d70:	48 8b 05 49 37 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23749]        # 42a4c0 <running_req>
  806d77:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  806d7a:	89 c7                	mov    edi,eax
  806d7c:	b8 00 00 00 00       	mov    eax,0x0
  806d81:	e8 1a 00 00 00       	call   806da0 <async_reset_disk>
  806d86:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
        break;
  806d89:	eb 01                	jmp    806d8c <execute_request+0x1e2>
        break;
  806d8b:	90                   	nop
    }
    if(r==-1)return -1;
  806d8c:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
  806d90:	75 07                	jne    806d99 <execute_request+0x1ef>
  806d92:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806d97:	eb 05                	jmp    806d9e <execute_request+0x1f4>
    return 0;
  806d99:	b8 00 00 00 00       	mov    eax,0x0
}
  806d9e:	c9                   	leave  
  806d9f:	c3                   	ret    

0000000000806da0 <async_reset_disk>:
int async_reset_disk(int disk)
{
  806da0:	f3 0f 1e fa          	endbr64 
  806da4:	55                   	push   rbp
  806da5:	48 89 e5             	mov    rbp,rsp
  806da8:	48 83 ec 10          	sub    rsp,0x10
  806dac:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    outb(PORT_DISK_CONTROL,DISK_CMD_RESET);
  806daf:	be 0c 00 00 00       	mov    esi,0xc
  806db4:	bf f6 03 00 00       	mov    edi,0x3f6
  806db9:	e8 52 e0 ff ff       	call   804e10 <outb>
    return 0;
  806dbe:	b8 00 00 00 00       	mov    eax,0x0
}
  806dc3:	c9                   	leave  
  806dc4:	c3                   	ret    

0000000000806dc5 <async_read_disk>:
int async_read_disk(int disk,unsigned int lba,int sec_n,char* mem_addr)
{
  806dc5:	f3 0f 1e fa          	endbr64 
  806dc9:	55                   	push   rbp
  806dca:	48 89 e5             	mov    rbp,rsp
  806dcd:	48 83 ec 30          	sub    rsp,0x30
  806dd1:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806dd4:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806dd7:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806dda:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  806dde:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  806de4:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806deb:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806def:	74 06                	je     806df7 <async_read_disk+0x32>
  806df1:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806df5:	75 06                	jne    806dfd <async_read_disk+0x38>
        port=PORT_DISK_SLAVE;
  806df7:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806dfd:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806e01:	74 06                	je     806e09 <async_read_disk+0x44>
  806e03:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806e07:	75 07                	jne    806e10 <async_read_disk+0x4b>
        slave_disk=1;
  806e09:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    outb(port+2,sec_n);
  806e10:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806e13:	0f b6 d0             	movzx  edx,al
  806e16:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806e1a:	83 c0 02             	add    eax,0x2
  806e1d:	0f b7 c0             	movzx  eax,ax
  806e20:	89 d6                	mov    esi,edx
  806e22:	89 c7                	mov    edi,eax
  806e24:	e8 e7 df ff ff       	call   804e10 <outb>
    outb(port+3,lba&0xff);
  806e29:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806e2c:	0f b6 d0             	movzx  edx,al
  806e2f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806e33:	83 c0 03             	add    eax,0x3
  806e36:	0f b7 c0             	movzx  eax,ax
  806e39:	89 d6                	mov    esi,edx
  806e3b:	89 c7                	mov    edi,eax
  806e3d:	e8 ce df ff ff       	call   804e10 <outb>
    outb(port+4,(lba>>8)&0xff);
  806e42:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806e45:	c1 e8 08             	shr    eax,0x8
  806e48:	0f b6 d0             	movzx  edx,al
  806e4b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806e4f:	83 c0 04             	add    eax,0x4
  806e52:	0f b7 c0             	movzx  eax,ax
  806e55:	89 d6                	mov    esi,edx
  806e57:	89 c7                	mov    edi,eax
  806e59:	e8 b2 df ff ff       	call   804e10 <outb>
    outb(port+5,(lba>>16)&0xff);
  806e5e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806e61:	c1 e8 10             	shr    eax,0x10
  806e64:	0f b6 d0             	movzx  edx,al
  806e67:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806e6b:	83 c0 05             	add    eax,0x5
  806e6e:	0f b7 c0             	movzx  eax,ax
  806e71:	89 d6                	mov    esi,edx
  806e73:	89 c7                	mov    edi,eax
  806e75:	e8 96 df ff ff       	call   804e10 <outb>
    char drv=slave_disk?0x10:0;
  806e7a:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806e7e:	74 07                	je     806e87 <async_read_disk+0xc2>
  806e80:	b8 10 00 00 00       	mov    eax,0x10
  806e85:	eb 05                	jmp    806e8c <async_read_disk+0xc7>
  806e87:	b8 00 00 00 00       	mov    eax,0x0
  806e8c:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
    char lba_hi=(lba>>24)&0xf|drv|0xe0;
  806e8f:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806e92:	c1 e8 18             	shr    eax,0x18
  806e95:	83 e0 0f             	and    eax,0xf
  806e98:	89 c2                	mov    edx,eax
  806e9a:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  806e9e:	09 d0                	or     eax,edx
  806ea0:	83 c8 e0             	or     eax,0xffffffe0
  806ea3:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
    outb(port+6,lba_hi);
  806ea6:	0f b6 45 f6          	movzx  eax,BYTE PTR [rbp-0xa]
  806eaa:	0f b6 d0             	movzx  edx,al
  806ead:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806eb1:	83 c0 06             	add    eax,0x6
  806eb4:	0f b7 c0             	movzx  eax,ax
  806eb7:	89 d6                	mov    esi,edx
  806eb9:	89 c7                	mov    edi,eax
  806ebb:	e8 50 df ff ff       	call   804e10 <outb>
    outb(port+7,DISK_CMD_READ);
  806ec0:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806ec4:	83 c0 07             	add    eax,0x7
  806ec7:	0f b7 c0             	movzx  eax,ax
  806eca:	be 20 00 00 00       	mov    esi,0x20
  806ecf:	89 c7                	mov    edi,eax
  806ed1:	e8 3a df ff ff       	call   804e10 <outb>
    // }
    // for(int i=0;i<running_req->sec_n*256;i++)
    // {
    //     *mem_addr++=inw(port);
    // }
    return 0;
  806ed6:	b8 00 00 00 00       	mov    eax,0x0
}
  806edb:	c9                   	leave  
  806edc:	c3                   	ret    

0000000000806edd <async_write_disk>:
int async_write_disk(int disk,unsigned int lba, int sec_n, char* mem_ptr)
{
  806edd:	f3 0f 1e fa          	endbr64 
  806ee1:	55                   	push   rbp
  806ee2:	48 89 e5             	mov    rbp,rsp
  806ee5:	48 83 ec 30          	sub    rsp,0x30
  806ee9:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
  806eec:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  806eef:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
  806ef2:	48 89 4d d8          	mov    QWORD PTR [rbp-0x28],rcx
    unsigned short port=PORT_DISK_MAJOR;
  806ef6:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    int slave_disk=0;
  806efc:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  806f03:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  806f07:	74 06                	je     806f0f <async_write_disk+0x32>
  806f09:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806f0d:	75 06                	jne    806f15 <async_write_disk+0x38>
        port=PORT_DISK_SLAVE;
  806f0f:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_SLAVE_SLAVE||disk==DISK_MAJOR_SLAVE)
  806f15:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  806f19:	74 06                	je     806f21 <async_write_disk+0x44>
  806f1b:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  806f1f:	75 07                	jne    806f28 <async_write_disk+0x4b>
        slave_disk=1;
  806f21:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
    while (1)
    {
        byte t=inb(0x1f7);
  806f28:	bf f7 00 00 00       	mov    edi,0xf7
  806f2d:	e8 f7 de ff ff       	call   804e29 <inb>
  806f32:	88 45 f7             	mov    BYTE PTR [rbp-0x9],al
        //logf("istat:%x",t);
        byte err=t&1;
  806f35:	0f b6 45 f7          	movzx  eax,BYTE PTR [rbp-0x9]
  806f39:	83 e0 01             	and    eax,0x1
  806f3c:	88 45 f6             	mov    BYTE PTR [rbp-0xa],al
        if(err!=0)
  806f3f:	80 7d f6 00          	cmp    BYTE PTR [rbp-0xa],0x0
  806f43:	74 0a                	je     806f4f <async_write_disk+0x72>
        {
            //printf("ERR iwriting disk\n");
            return -1;
  806f45:	b8 ff ff ff ff       	mov    eax,0xffffffff
  806f4a:	e9 d5 00 00 00       	jmp    807024 <async_write_disk+0x147>
        }
        t&=0x88;
  806f4f:	80 65 f7 88          	and    BYTE PTR [rbp-0x9],0x88
        if(t==0x8)break;
  806f53:	80 7d f7 08          	cmp    BYTE PTR [rbp-0x9],0x8
  806f57:	74 02                	je     806f5b <async_write_disk+0x7e>
    {
  806f59:	eb cd                	jmp    806f28 <async_write_disk+0x4b>
        if(t==0x8)break;
  806f5b:	90                   	nop
    }
    outb(port+2,sec_n);
  806f5c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  806f5f:	0f b6 d0             	movzx  edx,al
  806f62:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806f66:	83 c0 02             	add    eax,0x2
  806f69:	0f b7 c0             	movzx  eax,ax
  806f6c:	89 d6                	mov    esi,edx
  806f6e:	89 c7                	mov    edi,eax
  806f70:	e8 9b de ff ff       	call   804e10 <outb>
    outb(port+3,lba&0xff);
  806f75:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806f78:	0f b6 d0             	movzx  edx,al
  806f7b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806f7f:	83 c0 03             	add    eax,0x3
  806f82:	0f b7 c0             	movzx  eax,ax
  806f85:	89 d6                	mov    esi,edx
  806f87:	89 c7                	mov    edi,eax
  806f89:	e8 82 de ff ff       	call   804e10 <outb>
    outb(port+4,(lba>>8)&0xff);
  806f8e:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806f91:	c1 e8 08             	shr    eax,0x8
  806f94:	0f b6 d0             	movzx  edx,al
  806f97:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806f9b:	83 c0 04             	add    eax,0x4
  806f9e:	0f b7 c0             	movzx  eax,ax
  806fa1:	89 d6                	mov    esi,edx
  806fa3:	89 c7                	mov    edi,eax
  806fa5:	e8 66 de ff ff       	call   804e10 <outb>
    outb(port+5,(lba>>16)&0xff);
  806faa:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806fad:	c1 e8 10             	shr    eax,0x10
  806fb0:	0f b6 d0             	movzx  edx,al
  806fb3:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806fb7:	83 c0 05             	add    eax,0x5
  806fba:	0f b7 c0             	movzx  eax,ax
  806fbd:	89 d6                	mov    esi,edx
  806fbf:	89 c7                	mov    edi,eax
  806fc1:	e8 4a de ff ff       	call   804e10 <outb>
    char drv=slave_disk?0x10:0;
  806fc6:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
  806fca:	74 07                	je     806fd3 <async_write_disk+0xf6>
  806fcc:	b8 10 00 00 00       	mov    eax,0x10
  806fd1:	eb 05                	jmp    806fd8 <async_write_disk+0xfb>
  806fd3:	b8 00 00 00 00       	mov    eax,0x0
  806fd8:	88 45 f5             	mov    BYTE PTR [rbp-0xb],al
    unsigned char lba_hi=(lba>>24)&0xf|drv|0xe0;
  806fdb:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  806fde:	c1 e8 18             	shr    eax,0x18
  806fe1:	83 e0 0f             	and    eax,0xf
  806fe4:	89 c2                	mov    edx,eax
  806fe6:	0f b6 45 f5          	movzx  eax,BYTE PTR [rbp-0xb]
  806fea:	09 d0                	or     eax,edx
  806fec:	83 c8 e0             	or     eax,0xffffffe0
  806fef:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    outb(port+6,lba_hi);
  806ff2:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  806ff6:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  806ffa:	83 c0 06             	add    eax,0x6
  806ffd:	0f b7 c0             	movzx  eax,ax
  807000:	89 d6                	mov    esi,edx
  807002:	89 c7                	mov    edi,eax
  807004:	e8 07 de ff ff       	call   804e10 <outb>
    outb(port+7,DISK_CMD_WRITE);
  807009:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80700d:	83 c0 07             	add    eax,0x7
  807010:	0f b7 c0             	movzx  eax,ax
  807013:	be 30 00 00 00       	mov    esi,0x30
  807018:	89 c7                	mov    edi,eax
  80701a:	e8 f1 dd ff ff       	call   804e10 <outb>
    //     if(t==0x8)break;
    // }
    // short *p=mem_ptr;
    // for(int i=0;i<running_req->sec_n*256;i++)
    //         outw(port,*p++);
    return 0;
  80701f:	b8 00 00 00 00       	mov    eax,0x0
}
  807024:	c9                   	leave  
  807025:	c3                   	ret    

0000000000807026 <read_disk>:
int read_disk(driver_args* args)
{
  807026:	f3 0f 1e fa          	endbr64 
  80702a:	55                   	push   rbp
  80702b:	48 89 e5             	mov    rbp,rsp
  80702e:	48 83 ec 20          	sub    rsp,0x20
  807032:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=read_disk_asm(args->lba,args->sec_c,args->dist_addr);
  807036:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80703a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80703d:	48 98                	cdqe   
  80703f:	48 89 c2             	mov    rdx,rax
  807042:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807046:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  807049:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80704d:	8b 00                	mov    eax,DWORD PTR [rax]
  80704f:	89 ce                	mov    esi,ecx
  807051:	89 c7                	mov    edi,eax
  807053:	e8 94 05 00 00       	call   8075ec <read_disk_asm>
  807058:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  80705b:	48 8b 05 5e 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc2345e]        # 42a4c0 <running_req>
  807062:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  807069:	48 8b 05 50 34 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc23450]        # 42a4c0 <running_req>
  807070:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  807074:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  80707b:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  80707e:	48 c7 05 37 34 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc23437],0x0        # 42a4c0 <running_req>
  807085:	00 00 00 00 
    return ret;
  807089:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80708c:	c9                   	leave  
  80708d:	c3                   	ret    

000000000080708e <write_disk>:
int write_disk(driver_args* args)
{
  80708e:	f3 0f 1e fa          	endbr64 
  807092:	55                   	push   rbp
  807093:	48 89 e5             	mov    rbp,rsp
  807096:	48 83 ec 20          	sub    rsp,0x20
  80709a:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int ret=write_disk_asm(args->lba,args->sec_c,args->src_addr);
  80709e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8070a2:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  8070a5:	48 98                	cdqe   
  8070a7:	48 89 c2             	mov    rdx,rax
  8070aa:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8070ae:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  8070b1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8070b5:	8b 00                	mov    eax,DWORD PTR [rax]
  8070b7:	89 ce                	mov    esi,ecx
  8070b9:	89 c7                	mov    edi,eax
  8070bb:	e8 ac 05 00 00       	call   80766c <write_disk_asm>
  8070c0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    
    running_req->stat=REQ_STAT_DONE;
  8070c3:	48 8b 05 f6 33 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc233f6]        # 42a4c0 <running_req>
  8070ca:	c7 40 1c 03 00 00 00 	mov    DWORD PTR [rax+0x1c],0x3
    running_req->args->stat=REQ_STAT_EMPTY;
  8070d1:	48 8b 05 e8 33 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc233e8]        # 42a4c0 <running_req>
  8070d8:	48 8b 40 28          	mov    rax,QWORD PTR [rax+0x28]
  8070dc:	c7 80 ac 00 00 00 00 	mov    DWORD PTR [rax+0xac],0x0
  8070e3:	00 00 00 
    //set_proc_stat(running_req->pid,READY);
    running_req=NULL;
  8070e6:	48 c7 05 cf 33 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc233cf],0x0        # 42a4c0 <running_req>
  8070ed:	00 00 00 00 
    return ret;
  8070f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  8070f4:	c9                   	leave  
  8070f5:	c3                   	ret    

00000000008070f6 <chk_result>:
int chk_result(int r)
{
  8070f6:	f3 0f 1e fa          	endbr64 
  8070fa:	55                   	push   rbp
  8070fb:	48 89 e5             	mov    rbp,rsp
  8070fe:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    while(disk_reqs[r].stat!=REQ_STAT_DONE);
  807101:	90                   	nop
  807102:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807105:	48 63 d0             	movsxd rdx,eax
  807108:	48 89 d0             	mov    rax,rdx
  80710b:	48 01 c0             	add    rax,rax
  80710e:	48 01 d0             	add    rax,rdx
  807111:	48 c1 e0 04          	shl    rax,0x4
  807115:	48 05 dc 77 42 00    	add    rax,0x4277dc
  80711b:	8b 00                	mov    eax,DWORD PTR [rax]
  80711d:	83 f8 03             	cmp    eax,0x3
  807120:	75 e0                	jne    807102 <chk_result+0xc>
    return disk_reqs[r].result==DISK_CHK_OK?1:0;
  807122:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807125:	48 63 d0             	movsxd rdx,eax
  807128:	48 89 d0             	mov    rax,rdx
  80712b:	48 01 c0             	add    rax,rax
  80712e:	48 01 d0             	add    rax,rdx
  807131:	48 c1 e0 04          	shl    rax,0x4
  807135:	48 05 e0 77 42 00    	add    rax,0x4277e0
  80713b:	8b 00                	mov    eax,DWORD PTR [rax]
  80713d:	83 f8 01             	cmp    eax,0x1
  807140:	0f 94 c0             	sete   al
  807143:	0f b6 c0             	movzx  eax,al
}
  807146:	5d                   	pop    rbp
  807147:	c3                   	ret    

0000000000807148 <disk_existent>:
int disk_existent(int disk)
{
  807148:	f3 0f 1e fa          	endbr64 
  80714c:	55                   	push   rbp
  80714d:	48 89 e5             	mov    rbp,rsp
  807150:	48 83 ec 10          	sub    rsp,0x10
  807154:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    switch (disk)
  807157:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  80715b:	74 5f                	je     8071bc <disk_existent+0x74>
  80715d:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
  807161:	7f 6e                	jg     8071d1 <disk_existent+0x89>
  807163:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  807167:	74 3e                	je     8071a7 <disk_existent+0x5f>
  807169:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
  80716d:	7f 62                	jg     8071d1 <disk_existent+0x89>
  80716f:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  807173:	74 08                	je     80717d <disk_existent+0x35>
  807175:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
  807179:	74 17                	je     807192 <disk_existent+0x4a>
        
    case DISK_SLAVE_SLAVE:
        return sys_find_dev("hd3")!=-1;
        break;
    default:
        break;
  80717b:	eb 54                	jmp    8071d1 <disk_existent+0x89>
        return sys_find_dev("hd0")!=-1;
  80717d:	bf 34 2e 81 00       	mov    edi,0x812e34
  807182:	e8 15 bd ff ff       	call   802e9c <sys_find_dev>
  807187:	83 f8 ff             	cmp    eax,0xffffffff
  80718a:	0f 95 c0             	setne  al
  80718d:	0f b6 c0             	movzx  eax,al
  807190:	eb 45                	jmp    8071d7 <disk_existent+0x8f>
        return sys_find_dev("hd1")!=-1;
  807192:	bf 38 2e 81 00       	mov    edi,0x812e38
  807197:	e8 00 bd ff ff       	call   802e9c <sys_find_dev>
  80719c:	83 f8 ff             	cmp    eax,0xffffffff
  80719f:	0f 95 c0             	setne  al
  8071a2:	0f b6 c0             	movzx  eax,al
  8071a5:	eb 30                	jmp    8071d7 <disk_existent+0x8f>
        return sys_find_dev("hd2")!=-1;
  8071a7:	bf 3c 2e 81 00       	mov    edi,0x812e3c
  8071ac:	e8 eb bc ff ff       	call   802e9c <sys_find_dev>
  8071b1:	83 f8 ff             	cmp    eax,0xffffffff
  8071b4:	0f 95 c0             	setne  al
  8071b7:	0f b6 c0             	movzx  eax,al
  8071ba:	eb 1b                	jmp    8071d7 <disk_existent+0x8f>
        return sys_find_dev("hd3")!=-1;
  8071bc:	bf 40 2e 81 00       	mov    edi,0x812e40
  8071c1:	e8 d6 bc ff ff       	call   802e9c <sys_find_dev>
  8071c6:	83 f8 ff             	cmp    eax,0xffffffff
  8071c9:	0f 95 c0             	setne  al
  8071cc:	0f b6 c0             	movzx  eax,al
  8071cf:	eb 06                	jmp    8071d7 <disk_existent+0x8f>
        break;
  8071d1:	90                   	nop
    }
    return 0;
  8071d2:	b8 00 00 00 00       	mov    eax,0x0
}
  8071d7:	c9                   	leave  
  8071d8:	c3                   	ret    

00000000008071d9 <hd_iterate>:
int hd_iterate()
{
  8071d9:	f3 0f 1e fa          	endbr64 
  8071dd:	55                   	push   rbp
  8071de:	48 89 e5             	mov    rbp,rsp
  8071e1:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
    char *name;
    
    int r[4];
    r[0]=request(DISK_MAJOR_MAJOR,DISKREQ_CHECK,0,1,0);
  8071e8:	41 b8 00 00 00 00    	mov    r8d,0x0
  8071ee:	b9 01 00 00 00       	mov    ecx,0x1
  8071f3:	ba 00 00 00 00       	mov    edx,0x0
  8071f8:	be 02 00 00 00       	mov    esi,0x2
  8071fd:	bf 00 00 00 00       	mov    edi,0x0
  807202:	e8 3b f8 ff ff       	call   806a42 <request>
  807207:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    r[1]=request(DISK_MAJOR_SLAVE,DISKREQ_CHECK,0,1,0);
  80720a:	41 b8 00 00 00 00    	mov    r8d,0x0
  807210:	b9 01 00 00 00       	mov    ecx,0x1
  807215:	ba 00 00 00 00       	mov    edx,0x0
  80721a:	be 02 00 00 00       	mov    esi,0x2
  80721f:	bf 01 00 00 00       	mov    edi,0x1
  807224:	e8 19 f8 ff ff       	call   806a42 <request>
  807229:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    r[2]=request(DISK_SLAVE_MAJOR,DISKREQ_CHECK,0,1,0);
  80722c:	41 b8 00 00 00 00    	mov    r8d,0x0
  807232:	b9 01 00 00 00       	mov    ecx,0x1
  807237:	ba 00 00 00 00       	mov    edx,0x0
  80723c:	be 02 00 00 00       	mov    esi,0x2
  807241:	bf 02 00 00 00       	mov    edi,0x2
  807246:	e8 f7 f7 ff ff       	call   806a42 <request>
  80724b:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
    r[3]=request(DISK_SLAVE_SLAVE,DISKREQ_CHECK,0,1,0);
  80724e:	41 b8 00 00 00 00    	mov    r8d,0x0
  807254:	b9 01 00 00 00       	mov    ecx,0x1
  807259:	ba 00 00 00 00       	mov    edx,0x0
  80725e:	be 02 00 00 00       	mov    esi,0x2
  807263:	bf 03 00 00 00       	mov    edi,0x3
  807268:	e8 d5 f7 ff ff       	call   806a42 <request>
  80726d:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
    for(int i=0;i<1;i++)
  807270:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  807277:	e9 72 01 00 00       	jmp    8073ee <hd_iterate+0x215>
    {
        int disk;
        switch (i)
  80727c:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807280:	74 3b                	je     8072bd <hd_iterate+0xe4>
  807282:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807286:	7f 3e                	jg     8072c6 <hd_iterate+0xed>
  807288:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80728c:	74 26                	je     8072b4 <hd_iterate+0xdb>
  80728e:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  807292:	7f 32                	jg     8072c6 <hd_iterate+0xed>
  807294:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  807298:	74 08                	je     8072a2 <hd_iterate+0xc9>
  80729a:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  80729e:	74 0b                	je     8072ab <hd_iterate+0xd2>
  8072a0:	eb 24                	jmp    8072c6 <hd_iterate+0xed>
        {
        case 0:disk=DISK_MAJOR_MAJOR;break;
  8072a2:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  8072a9:	eb 25                	jmp    8072d0 <hd_iterate+0xf7>
        case 1:disk=DISK_MAJOR_SLAVE;break;
  8072ab:	c7 45 f0 01 00 00 00 	mov    DWORD PTR [rbp-0x10],0x1
  8072b2:	eb 1c                	jmp    8072d0 <hd_iterate+0xf7>
        case 2:disk=DISK_SLAVE_MAJOR;break;
  8072b4:	c7 45 f0 02 00 00 00 	mov    DWORD PTR [rbp-0x10],0x2
  8072bb:	eb 13                	jmp    8072d0 <hd_iterate+0xf7>
        case 3:disk=DISK_SLAVE_SLAVE;break;
  8072bd:	c7 45 f0 03 00 00 00 	mov    DWORD PTR [rbp-0x10],0x3
  8072c4:	eb 0a                	jmp    8072d0 <hd_iterate+0xf7>
        default:
            return -1;
  8072c6:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8072cb:	e9 28 01 00 00       	jmp    8073f8 <hd_iterate+0x21f>
            break;
        }
        if(chk_result(r[i]))//&&!disk_existent(disk)
  8072d0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8072d3:	48 98                	cdqe   
  8072d5:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  8072d9:	89 c7                	mov    edi,eax
  8072db:	e8 16 fe ff ff       	call   8070f6 <chk_result>
  8072e0:	85 c0                	test   eax,eax
  8072e2:	0f 84 81 00 00 00    	je     807369 <hd_iterate+0x190>
        {
            printf("disk %d checked.\n",i);
  8072e8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8072eb:	89 c6                	mov    esi,eax
  8072ed:	bf 44 2e 81 00       	mov    edi,0x812e44
  8072f2:	b8 00 00 00 00       	mov    eax,0x0
  8072f7:	e8 e7 99 ff ff       	call   800ce3 <printf>
            //新硬盘
            device hd={
  8072fc:	48 8d 95 20 ff ff ff 	lea    rdx,[rbp-0xe0]
  807303:	b8 00 00 00 00       	mov    eax,0x0
  807308:	b9 15 00 00 00       	mov    ecx,0x15
  80730d:	48 89 d7             	mov    rdi,rdx
  807310:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
  807313:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  807316:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
  80731c:	c7 85 28 ff ff ff 01 	mov    DWORD PTR [rbp-0xd8],0x1
  807323:	00 00 00 
  807326:	c7 85 2c ff ff ff 01 	mov    DWORD PTR [rbp-0xd4],0x1
  80732d:	00 00 00 
                .type=DEV_TYPE_BLKDEV,
                .stype=DEV_STYPE_HD,
                .slave_dev=disk,
                .start_port=i<2?PORT_DISK_MAJOR:PORT_DISK_SLAVE
  807330:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  807334:	7f 07                	jg     80733d <hd_iterate+0x164>
  807336:	b8 f0 01 00 00       	mov    eax,0x1f0
  80733b:	eb 05                	jmp    807342 <hd_iterate+0x169>
  80733d:	b8 70 01 00 00       	mov    eax,0x170
            device hd={
  807342:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
            };
            disks[i]=reg_device(&hd);
  807348:	48 8d 85 20 ff ff ff 	lea    rax,[rbp-0xe0]
  80734f:	48 89 c7             	mov    rdi,rax
  807352:	e8 0d b7 ff ff       	call   802a64 <reg_device>
  807357:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80735a:	48 63 d2             	movsxd rdx,edx
  80735d:	89 04 95 e0 a4 42 00 	mov    DWORD PTR [rdx*4+0x42a4e0],eax
  807364:	e9 81 00 00 00       	jmp    8073ea <hd_iterate+0x211>
        }else if(!chk_result(r[i]))//&&disk_existent(disk)
  807369:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80736c:	48 98                	cdqe   
  80736e:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  807372:	89 c7                	mov    edi,eax
  807374:	e8 7d fd ff ff       	call   8070f6 <chk_result>
  807379:	85 c0                	test   eax,eax
  80737b:	75 6d                	jne    8073ea <hd_iterate+0x211>
        {
            switch (i)
  80737d:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807381:	74 3e                	je     8073c1 <hd_iterate+0x1e8>
  807383:	83 7d f4 03          	cmp    DWORD PTR [rbp-0xc],0x3
  807387:	7f 41                	jg     8073ca <hd_iterate+0x1f1>
  807389:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  80738d:	74 28                	je     8073b7 <hd_iterate+0x1de>
  80738f:	83 7d f4 02          	cmp    DWORD PTR [rbp-0xc],0x2
  807393:	7f 35                	jg     8073ca <hd_iterate+0x1f1>
  807395:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  807399:	74 08                	je     8073a3 <hd_iterate+0x1ca>
  80739b:	83 7d f4 01          	cmp    DWORD PTR [rbp-0xc],0x1
  80739f:	74 0c                	je     8073ad <hd_iterate+0x1d4>
  8073a1:	eb 27                	jmp    8073ca <hd_iterate+0x1f1>
            {
            case 0:name="hd0";break;
  8073a3:	48 c7 45 f8 34 2e 81 	mov    QWORD PTR [rbp-0x8],0x812e34
  8073aa:	00 
  8073ab:	eb 1d                	jmp    8073ca <hd_iterate+0x1f1>
            case 1:name="hd1";break;
  8073ad:	48 c7 45 f8 38 2e 81 	mov    QWORD PTR [rbp-0x8],0x812e38
  8073b4:	00 
  8073b5:	eb 13                	jmp    8073ca <hd_iterate+0x1f1>
            case 2:name="hd2";break;
  8073b7:	48 c7 45 f8 3c 2e 81 	mov    QWORD PTR [rbp-0x8],0x812e3c
  8073be:	00 
  8073bf:	eb 09                	jmp    8073ca <hd_iterate+0x1f1>
            case 3:name="hd3";break;
  8073c1:	48 c7 45 f8 40 2e 81 	mov    QWORD PTR [rbp-0x8],0x812e40
  8073c8:	00 
  8073c9:	90                   	nop
            }
            //有硬盘被卸载了
            int devi=sys_find_dev(name);
  8073ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8073ce:	48 89 c7             	mov    rdi,rax
  8073d1:	e8 c6 ba ff ff       	call   802e9c <sys_find_dev>
  8073d6:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            dispose_device(get_dev(devi));
  8073d9:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8073dc:	89 c7                	mov    edi,eax
  8073de:	e8 8d c1 ff ff       	call   803570 <get_dev>
  8073e3:	89 c7                	mov    edi,eax
  8073e5:	e8 d9 c0 ff ff       	call   8034c3 <dispose_device>
    for(int i=0;i<1;i++)
  8073ea:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8073ee:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  8073f2:	0f 8e 84 fe ff ff    	jle    80727c <hd_iterate+0xa3>
        }

    }
}
  8073f8:	c9                   	leave  
  8073f9:	c3                   	ret    

00000000008073fa <async_check_disk>:

int async_check_disk(int disk)
{
  8073fa:	f3 0f 1e fa          	endbr64 
  8073fe:	55                   	push   rbp
  8073ff:	48 89 e5             	mov    rbp,rsp
  807402:	48 83 ec 20          	sub    rsp,0x20
  807406:	89 7d ec             	mov    DWORD PTR [rbp-0x14],edi
    unsigned short disknr=PORT_DISK_MAJOR;
  807409:	66 c7 45 fe f0 01    	mov    WORD PTR [rbp-0x2],0x1f0
    unsigned short chkcmd=0xe0;
  80740f:	66 c7 45 fc e0 00    	mov    WORD PTR [rbp-0x4],0xe0
    if(disk==DISK_SLAVE_MAJOR||disk==DISK_SLAVE_SLAVE)
  807415:	83 7d ec 02          	cmp    DWORD PTR [rbp-0x14],0x2
  807419:	74 06                	je     807421 <async_check_disk+0x27>
  80741b:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  80741f:	75 06                	jne    807427 <async_check_disk+0x2d>
        disknr=PORT_DISK_SLAVE;
  807421:	66 c7 45 fe 70 01    	mov    WORD PTR [rbp-0x2],0x170
    if(disk==DISK_MAJOR_SLAVE||disk==DISK_SLAVE_SLAVE)
  807427:	83 7d ec 01          	cmp    DWORD PTR [rbp-0x14],0x1
  80742b:	74 06                	je     807433 <async_check_disk+0x39>
  80742d:	83 7d ec 03          	cmp    DWORD PTR [rbp-0x14],0x3
  807431:	75 06                	jne    807439 <async_check_disk+0x3f>
        chkcmd=0xf0;
  807433:	66 c7 45 fc f0 00    	mov    WORD PTR [rbp-0x4],0xf0
    outb(disknr+2,1);
  807439:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80743d:	83 c0 02             	add    eax,0x2
  807440:	0f b7 c0             	movzx  eax,ax
  807443:	be 01 00 00 00       	mov    esi,0x1
  807448:	89 c7                	mov    edi,eax
  80744a:	e8 c1 d9 ff ff       	call   804e10 <outb>
    outb(disknr+3,0);
  80744f:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807453:	83 c0 03             	add    eax,0x3
  807456:	0f b7 c0             	movzx  eax,ax
  807459:	be 00 00 00 00       	mov    esi,0x0
  80745e:	89 c7                	mov    edi,eax
  807460:	e8 ab d9 ff ff       	call   804e10 <outb>
    outb(disknr+4,0);
  807465:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  807469:	83 c0 04             	add    eax,0x4
  80746c:	0f b7 c0             	movzx  eax,ax
  80746f:	be 00 00 00 00       	mov    esi,0x0
  807474:	89 c7                	mov    edi,eax
  807476:	e8 95 d9 ff ff       	call   804e10 <outb>
    outb(disknr+5,0);
  80747b:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80747f:	83 c0 05             	add    eax,0x5
  807482:	0f b7 c0             	movzx  eax,ax
  807485:	be 00 00 00 00       	mov    esi,0x0
  80748a:	89 c7                	mov    edi,eax
  80748c:	e8 7f d9 ff ff       	call   804e10 <outb>
    outb(disknr+6,chkcmd);//主硬盘
  807491:	0f b7 45 fc          	movzx  eax,WORD PTR [rbp-0x4]
  807495:	0f b6 d0             	movzx  edx,al
  807498:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  80749c:	83 c0 06             	add    eax,0x6
  80749f:	0f b7 c0             	movzx  eax,ax
  8074a2:	89 d6                	mov    esi,edx
  8074a4:	89 c7                	mov    edi,eax
  8074a6:	e8 65 d9 ff ff       	call   804e10 <outb>
    outb(disknr+7,DISK_CMD_CHECK);
  8074ab:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
  8074af:	83 c0 07             	add    eax,0x7
  8074b2:	0f b7 c0             	movzx  eax,ax
  8074b5:	be 90 00 00 00       	mov    esi,0x90
  8074ba:	89 c7                	mov    edi,eax
  8074bc:	e8 4f d9 ff ff       	call   804e10 <outb>
    //     // {
    //     //     printf("DISK ERR\n");
    //     //     return -1;
    //     // }
    // }
    return 0;
  8074c1:	b8 00 00 00 00       	mov    eax,0x0
}
  8074c6:	c9                   	leave  
  8074c7:	c3                   	ret    

00000000008074c8 <hd_do_req>:

//接口函数：负责接收VFS的请求然后执行
int hd_do_req(driver_args *args)
{
  8074c8:	f3 0f 1e fa          	endbr64 
  8074cc:	55                   	push   rbp
  8074cd:	48 89 e5             	mov    rbp,rsp
  8074d0:	48 83 ec 18          	sub    rsp,0x18
  8074d4:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int diski=0;
  8074d8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;disks[diski]!=args->dev;diski++);
  8074df:	eb 04                	jmp    8074e5 <hd_do_req+0x1d>
  8074e1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8074e5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8074e8:	48 98                	cdqe   
  8074ea:	8b 14 85 e0 a4 42 00 	mov    edx,DWORD PTR [rax*4+0x42a4e0]
  8074f1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8074f5:	8b 80 8c 00 00 00    	mov    eax,DWORD PTR [rax+0x8c]
  8074fb:	39 c2                	cmp    edx,eax
  8074fd:	75 e2                	jne    8074e1 <hd_do_req+0x19>
    switch (args->cmd)
  8074ff:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807503:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  807509:	83 f8 04             	cmp    eax,0x4
  80750c:	74 72                	je     807580 <hd_do_req+0xb8>
  80750e:	83 f8 04             	cmp    eax,0x4
  807511:	0f 8f 96 00 00 00    	jg     8075ad <hd_do_req+0xe5>
  807517:	83 f8 02             	cmp    eax,0x2
  80751a:	74 0a                	je     807526 <hd_do_req+0x5e>
  80751c:	83 f8 03             	cmp    eax,0x3
  80751f:	74 32                	je     807553 <hd_do_req+0x8b>
  807521:	e9 87 00 00 00       	jmp    8075ad <hd_do_req+0xe5>
    {
    case DRVF_READ:
        request(diski,DISKREQ_READ,args->lba,args->sec_c,args->dist_addr);
  807526:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80752a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80752d:	48 98                	cdqe   
  80752f:	48 89 c6             	mov    rsi,rax
  807532:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807536:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  807539:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80753d:	8b 10                	mov    edx,DWORD PTR [rax]
  80753f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807542:	49 89 f0             	mov    r8,rsi
  807545:	be 00 00 00 00       	mov    esi,0x0
  80754a:	89 c7                	mov    edi,eax
  80754c:	e8 f1 f4 ff ff       	call   806a42 <request>
        break;
  807551:	eb 61                	jmp    8075b4 <hd_do_req+0xec>
    case DRVF_WRITE:
        request(diski,DISKREQ_WRITE,args->lba,args->sec_c,args->src_addr);
  807553:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807557:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80755a:	48 98                	cdqe   
  80755c:	48 89 c6             	mov    rsi,rax
  80755f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807563:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  807566:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80756a:	8b 10                	mov    edx,DWORD PTR [rax]
  80756c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80756f:	49 89 f0             	mov    r8,rsi
  807572:	be 01 00 00 00       	mov    esi,0x1
  807577:	89 c7                	mov    edi,eax
  807579:	e8 c4 f4 ff ff       	call   806a42 <request>
        break;
  80757e:	eb 34                	jmp    8075b4 <hd_do_req+0xec>
    case DRVF_CHK:
        request(diski,DISKREQ_CHECK,args->lba,args->sec_c,args->dist_addr);
  807580:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807584:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  807587:	48 98                	cdqe   
  807589:	48 89 c6             	mov    rsi,rax
  80758c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807590:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
  807593:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  807597:	8b 10                	mov    edx,DWORD PTR [rax]
  807599:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80759c:	49 89 f0             	mov    r8,rsi
  80759f:	be 02 00 00 00       	mov    esi,0x2
  8075a4:	89 c7                	mov    edi,eax
  8075a6:	e8 97 f4 ff ff       	call   806a42 <request>
        break;
  8075ab:	eb 07                	jmp    8075b4 <hd_do_req+0xec>
    default:return -1;
  8075ad:	b8 ff ff ff ff       	mov    eax,0xffffffff
  8075b2:	eb 1e                	jmp    8075d2 <hd_do_req+0x10a>
    }
    args->stat=REQ_STAT_WORKING;
  8075b4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8075b8:	c7 80 ac 00 00 00 02 	mov    DWORD PTR [rax+0xac],0x2
  8075bf:	00 00 00 
    running_devman_req=args;
  8075c2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8075c6:	48 89 05 fb 2e c2 ff 	mov    QWORD PTR [rip+0xffffffffffc22efb],rax        # 42a4c8 <running_devman_req>
    return 0;
  8075cd:	b8 00 00 00 00       	mov    eax,0x0
  8075d2:	c9                   	leave  
  8075d3:	c3                   	ret    
  8075d4:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
  8075db:	00 00 00 
  8075de:	66 90                	xchg   ax,ax

00000000008075e0 <disk_int_handler>:
  8075e0:	e8 59 d8 ff ff       	call   804e3e <eoi>
  8075e5:	e8 69 f2 ff ff       	call   806853 <disk_int_handler_c>
  8075ea:	48 cf                	iretq  

00000000008075ec <read_disk_asm>:
  8075ec:	55                   	push   rbp
  8075ed:	89 e5                	mov    ebp,esp
  8075ef:	66 ba f7 01          	mov    dx,0x1f7
  8075f3:	31 c9                	xor    ecx,ecx
  8075f5:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  8075fa:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  8075ff:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  807604:	89 c6                	mov    esi,eax
  807606:	66 ba f2 01          	mov    dx,0x1f2
  80760a:	88 c8                	mov    al,cl
  80760c:	ee                   	out    dx,al
  80760d:	66 ba f3 01          	mov    dx,0x1f3
  807611:	89 f0                	mov    eax,esi
  807613:	ee                   	out    dx,al
  807614:	66 ff c2             	inc    dx
  807617:	c1 e8 08             	shr    eax,0x8
  80761a:	ee                   	out    dx,al
  80761b:	66 ff c2             	inc    dx
  80761e:	c1 e8 08             	shr    eax,0x8
  807621:	ee                   	out    dx,al
  807622:	66 ff c2             	inc    dx
  807625:	66 c1 e8 08          	shr    ax,0x8
  807629:	24 0f                	and    al,0xf
  80762b:	0c e0                	or     al,0xe0
  80762d:	ee                   	out    dx,al
  80762e:	66 ff c2             	inc    dx
  807631:	b0 20                	mov    al,0x20
  807633:	ee                   	out    dx,al

0000000000807634 <read_disk_asm.wait>:
  807634:	90                   	nop
  807635:	ec                   	in     al,dx
  807636:	24 88                	and    al,0x88
  807638:	3c 08                	cmp    al,0x8
  80763a:	75 f8                	jne    807634 <read_disk_asm.wait>
  80763c:	66 89 d7             	mov    di,dx
  80763f:	89 c8                	mov    eax,ecx
  807641:	66 b9 00 01          	mov    cx,0x100
  807645:	66 f7 e1             	mul    cx
  807648:	89 c1                	mov    ecx,eax
  80764a:	66 ba f0 01          	mov    dx,0x1f0

000000000080764e <read_disk_asm.read>:
  80764e:	66 ed                	in     ax,dx
  807650:	66 67 89 03          	mov    WORD PTR [ebx],ax
  807654:	83 c3 02             	add    ebx,0x2
  807657:	e2 f5                	loop   80764e <read_disk_asm.read>
  807659:	c9                   	leave  
  80765a:	b8 00 00 00 00       	mov    eax,0x0
  80765f:	c3                   	ret    

0000000000807660 <read_disk_asm.err_disk_reading>:
  807660:	66 ba f1 01          	mov    dx,0x1f1
  807664:	31 c0                	xor    eax,eax
  807666:	66 ed                	in     ax,dx
  807668:	89 ec                	mov    esp,ebp
  80766a:	5d                   	pop    rbp
  80766b:	c3                   	ret    

000000000080766c <write_disk_asm>:
  80766c:	55                   	push   rbp
  80766d:	89 e5                	mov    ebp,esp
  80766f:	67 8b 44 24 08       	mov    eax,DWORD PTR [esp+0x8]
  807674:	67 8b 4c 24 0c       	mov    ecx,DWORD PTR [esp+0xc]
  807679:	67 8b 5c 24 10       	mov    ebx,DWORD PTR [esp+0x10]
  80767e:	50                   	push   rax
  80767f:	66 ba f2 01          	mov    dx,0x1f2
  807683:	88 c8                	mov    al,cl
  807685:	ee                   	out    dx,al
  807686:	58                   	pop    rax
  807687:	66 ba f3 01          	mov    dx,0x1f3
  80768b:	ee                   	out    dx,al
  80768c:	c1 e8 08             	shr    eax,0x8
  80768f:	66 ba f4 01          	mov    dx,0x1f4
  807693:	ee                   	out    dx,al
  807694:	c1 e8 08             	shr    eax,0x8
  807697:	66 ba f5 01          	mov    dx,0x1f5
  80769b:	ee                   	out    dx,al
  80769c:	c1 e8 08             	shr    eax,0x8
  80769f:	24 0f                	and    al,0xf
  8076a1:	0c e0                	or     al,0xe0
  8076a3:	66 ba f6 01          	mov    dx,0x1f6
  8076a7:	ee                   	out    dx,al
  8076a8:	66 ba f7 01          	mov    dx,0x1f7
  8076ac:	b0 30                	mov    al,0x30
  8076ae:	ee                   	out    dx,al

00000000008076af <write_disk_asm.not_ready2>:
  8076af:	90                   	nop
  8076b0:	ec                   	in     al,dx
  8076b1:	24 88                	and    al,0x88
  8076b3:	3c 08                	cmp    al,0x8
  8076b5:	75 f8                	jne    8076af <write_disk_asm.not_ready2>
  8076b7:	89 c8                	mov    eax,ecx
  8076b9:	66 b9 00 01          	mov    cx,0x100
  8076bd:	66 f7 e1             	mul    cx
  8076c0:	89 c1                	mov    ecx,eax
  8076c2:	66 ba f0 01          	mov    dx,0x1f0

00000000008076c6 <write_disk_asm.go_on_write>:
  8076c6:	66 67 8b 03          	mov    ax,WORD PTR [ebx]
  8076ca:	66 ef                	out    dx,ax
  8076cc:	83 c3 02             	add    ebx,0x2
  8076cf:	e2 f5                	loop   8076c6 <write_disk_asm.go_on_write>
  8076d1:	89 ec                	mov    esp,ebp
  8076d3:	5d                   	pop    rbp
  8076d4:	c3                   	ret    

00000000008076d5 <DISK1_FAT32_read_FAT_Entry>:
#include "mem.h"
#include "memory.h"
#include "proc.h"

unsigned int DISK1_FAT32_read_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry)
{
  8076d5:	f3 0f 1e fa          	endbr64 
  8076d9:	55                   	push   rbp
  8076da:	48 89 e5             	mov    rbp,rsp
  8076dd:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  8076e4:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  8076eb:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
	unsigned int buf[128];
	memset(buf,0,512);
  8076f1:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8076f8:	ba 00 02 00 00       	mov    edx,0x200
  8076fd:	be 00 00 00 00       	mov    esi,0x0
  807702:	48 89 c7             	mov    rdi,rax
  807705:	e8 5c 2e 00 00       	call   80a566 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  80770a:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  807711:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807715:	89 c2                	mov    edx,eax
  807717:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80771d:	c1 e8 07             	shr    eax,0x7
  807720:	01 d0                	add    eax,edx
  807722:	89 c2                	mov    edx,eax
  807724:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  80772b:	49 89 c0             	mov    r8,rax
  80772e:	b9 01 00 00 00       	mov    ecx,0x1
  807733:	be 00 00 00 00       	mov    esi,0x0
  807738:	bf 00 00 00 00       	mov    edi,0x0
  80773d:	e8 00 f3 ff ff       	call   806a42 <request>
  807742:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    chk_result(r);
  807745:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807748:	89 c7                	mov    edi,eax
  80774a:	e8 a7 f9 ff ff       	call   8070f6 <chk_result>
    printf("DISK1_FAT32_read_FAT_Entry fat_entry:%#018lx,%#010x\n",fat_entry,buf[fat_entry & 0x7f]);
  80774f:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807755:	83 e0 7f             	and    eax,0x7f
  807758:	89 c0                	mov    eax,eax
  80775a:	8b 94 85 f0 fd ff ff 	mov    edx,DWORD PTR [rbp+rax*4-0x210]
  807761:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807767:	89 c6                	mov    esi,eax
  807769:	bf 58 2e 81 00       	mov    edi,0x812e58
  80776e:	b8 00 00 00 00       	mov    eax,0x0
  807773:	e8 6b 95 ff ff       	call   800ce3 <printf>
	return buf[fat_entry & 0x7f] & 0x0fffffff;
  807778:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80777e:	83 e0 7f             	and    eax,0x7f
  807781:	89 c0                	mov    eax,eax
  807783:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  80778a:	25 ff ff ff 0f       	and    eax,0xfffffff
}
  80778f:	c9                   	leave  
  807790:	c3                   	ret    

0000000000807791 <DISK1_FAT32_write_FAT_Entry>:


unsigned long DISK1_FAT32_write_FAT_Entry(struct FAT32_sb_info * fsbi,unsigned int fat_entry,unsigned int value)
{
  807791:	f3 0f 1e fa          	endbr64 
  807795:	55                   	push   rbp
  807796:	48 89 e5             	mov    rbp,rsp
  807799:	48 81 ec 20 02 00 00 	sub    rsp,0x220
  8077a0:	48 89 bd e8 fd ff ff 	mov    QWORD PTR [rbp-0x218],rdi
  8077a7:	89 b5 e4 fd ff ff    	mov    DWORD PTR [rbp-0x21c],esi
  8077ad:	89 95 e0 fd ff ff    	mov    DWORD PTR [rbp-0x220],edx
	unsigned int buf[128];
	int i;

	memset(buf,0,512);
  8077b3:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8077ba:	ba 00 02 00 00       	mov    edx,0x200
  8077bf:	be 00 00 00 00       	mov    esi,0x0
  8077c4:	48 89 c7             	mov    rdi,rax
  8077c7:	e8 9a 2d 00 00       	call   80a566 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + (fat_entry >> 7),1,(unsigned char *)buf);
  8077cc:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8077d3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8077d7:	89 c2                	mov    edx,eax
  8077d9:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  8077df:	c1 e8 07             	shr    eax,0x7
  8077e2:	01 d0                	add    eax,edx
  8077e4:	89 c2                	mov    edx,eax
  8077e6:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8077ed:	49 89 c0             	mov    r8,rax
  8077f0:	b9 01 00 00 00       	mov    ecx,0x1
  8077f5:	be 00 00 00 00       	mov    esi,0x0
  8077fa:	bf 00 00 00 00       	mov    edi,0x0
  8077ff:	e8 3e f2 ff ff       	call   806a42 <request>
  807804:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
    chk_result(r);
  807807:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  80780a:	89 c7                	mov    edi,eax
  80780c:	e8 e5 f8 ff ff       	call   8070f6 <chk_result>
    buf[fat_entry & 0x7f] = (buf[fat_entry & 0x7f] & 0xf0000000) | (value & 0x0fffffff);
  807811:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807817:	83 e0 7f             	and    eax,0x7f
  80781a:	89 c0                	mov    eax,eax
  80781c:	8b 84 85 f0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x210]
  807823:	25 00 00 00 f0       	and    eax,0xf0000000
  807828:	89 c6                	mov    esi,eax
  80782a:	8b 85 e0 fd ff ff    	mov    eax,DWORD PTR [rbp-0x220]
  807830:	25 ff ff ff 0f       	and    eax,0xfffffff
  807835:	89 c1                	mov    ecx,eax
  807837:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  80783d:	83 e0 7f             	and    eax,0x7f
  807840:	89 c2                	mov    edx,eax
  807842:	89 f0                	mov    eax,esi
  807844:	09 c8                	or     eax,ecx
  807846:	89 d2                	mov    edx,edx
  807848:	89 84 95 f0 fd ff ff 	mov    DWORD PTR [rbp+rdx*4-0x210],eax

	for(i = 0;i < fsbi->NumFATs;i++){
  80784f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807856:	eb 61                	jmp    8078b9 <DISK1_FAT32_write_FAT_Entry+0x128>
        int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,fsbi->FAT1_firstsector + fsbi->sector_per_FAT * i + (fat_entry >> 7),1,(unsigned char *)buf);
  807858:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80785f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807863:	89 c1                	mov    ecx,eax
  807865:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  80786c:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  807870:	89 c2                	mov    edx,eax
  807872:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807875:	48 98                	cdqe   
  807877:	0f af c2             	imul   eax,edx
  80787a:	8d 14 01             	lea    edx,[rcx+rax*1]
  80787d:	8b 85 e4 fd ff ff    	mov    eax,DWORD PTR [rbp-0x21c]
  807883:	c1 e8 07             	shr    eax,0x7
  807886:	01 d0                	add    eax,edx
  807888:	89 c2                	mov    edx,eax
  80788a:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  807891:	49 89 c0             	mov    r8,rax
  807894:	b9 01 00 00 00       	mov    ecx,0x1
  807899:	be 01 00 00 00       	mov    esi,0x1
  80789e:	bf 00 00 00 00       	mov    edi,0x0
  8078a3:	e8 9a f1 ff ff       	call   806a42 <request>
  8078a8:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
        chk_result(r1);
  8078ab:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8078ae:	89 c7                	mov    edi,eax
  8078b0:	e8 41 f8 ff ff       	call   8070f6 <chk_result>
	for(i = 0;i < fsbi->NumFATs;i++){
  8078b5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  8078b9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  8078bc:	48 63 d0             	movsxd rdx,eax
  8078bf:	48 8b 85 e8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x218]
  8078c6:	48 8b 40 40          	mov    rax,QWORD PTR [rax+0x40]
  8078ca:	48 39 c2             	cmp    rdx,rax
  8078cd:	72 89                	jb     807858 <DISK1_FAT32_write_FAT_Entry+0xc7>
    }
	return 1;
  8078cf:	b8 01 00 00 00       	mov    eax,0x1
}
  8078d4:	c9                   	leave  
  8078d5:	c3                   	ret    

00000000008078d6 <FAT32_open>:


long FAT32_open(struct index_node * inode,struct file * filp)
{
  8078d6:	f3 0f 1e fa          	endbr64 
  8078da:	55                   	push   rbp
  8078db:	48 89 e5             	mov    rbp,rsp
  8078de:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8078e2:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  8078e6:	b8 01 00 00 00       	mov    eax,0x1
}
  8078eb:	5d                   	pop    rbp
  8078ec:	c3                   	ret    

00000000008078ed <FAT32_close>:


long FAT32_close(struct index_node * inode,struct file * filp)
{
  8078ed:	f3 0f 1e fa          	endbr64 
  8078f1:	55                   	push   rbp
  8078f2:	48 89 e5             	mov    rbp,rsp
  8078f5:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8078f9:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	return 1;
  8078fd:	b8 01 00 00 00       	mov    eax,0x1
}
  807902:	5d                   	pop    rbp
  807903:	c3                   	ret    

0000000000807904 <FAT32_read>:


long FAT32_read(struct file * filp,char * buf,unsigned long count,long * position)
{
  807904:	f3 0f 1e fa          	endbr64 
  807908:	55                   	push   rbp
  807909:	48 89 e5             	mov    rbp,rsp
  80790c:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  807910:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  807914:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  807918:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
  80791c:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  807920:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807924:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807928:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80792c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807930:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  807934:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807938:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80793c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807940:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807944:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807948:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

	unsigned long cluster = finode->first_cluster;
  80794c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  807950:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807953:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long sector = 0;
  807957:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  80795e:	00 
	int i,length = 0;
  80795f:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
	long retval = 0;
  807966:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  80796d:	00 
	int index = *position / fsbi->bytes_per_cluster;
  80796e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807972:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807975:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807979:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  80797d:	48 99                	cqo    
  80797f:	48 f7 fe             	idiv   rsi
  807982:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  807985:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807989:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80798c:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  807990:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  807994:	48 99                	cqo    
  807996:	48 f7 f9             	idiv   rcx
  807999:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  80799d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8079a1:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8079a5:	be 00 00 00 00       	mov    esi,0x0
  8079aa:	48 89 c7             	mov    rdi,rax
  8079ad:	b8 00 00 00 00       	mov    eax,0x0
  8079b2:	e8 44 97 ff ff       	call   8010fb <vmalloc>
  8079b7:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax

	if(!cluster)
  8079bb:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  8079c0:	75 0c                	jne    8079ce <FAT32_read+0xca>
		return -EFAULT;
  8079c2:	48 c7 c0 eb ff ff ff 	mov    rax,0xffffffffffffffeb
  8079c9:	e9 f0 01 00 00       	jmp    807bbe <FAT32_read+0x2ba>
	for(i = 0;i < index;i++)
  8079ce:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8079d5:	eb 1e                	jmp    8079f5 <FAT32_read+0xf1>
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  8079d7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8079db:	89 c2                	mov    edx,eax
  8079dd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8079e1:	89 d6                	mov    esi,edx
  8079e3:	48 89 c7             	mov    rdi,rax
  8079e6:	e8 ea fc ff ff       	call   8076d5 <DISK1_FAT32_read_FAT_Entry>
  8079eb:	89 c0                	mov    eax,eax
  8079ed:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	for(i = 0;i < index;i++)
  8079f1:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  8079f5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  8079f8:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  8079fb:	7c da                	jl     8079d7 <FAT32_read+0xd3>

	if(*position + count > filp->dentry->dir_inode->file_size)
  8079fd:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807a01:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807a04:	48 89 c2             	mov    rdx,rax
  807a07:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807a0b:	48 01 c2             	add    rdx,rax
  807a0e:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807a12:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807a16:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807a1a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807a1d:	48 39 c2             	cmp    rdx,rax
  807a20:	76 2c                	jbe    807a4e <FAT32_read+0x14a>
		index = count = filp->dentry->dir_inode->file_size - *position;
  807a22:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  807a26:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807a2a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807a2e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807a31:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807a35:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807a38:	48 89 c1             	mov    rcx,rax
  807a3b:	48 89 d0             	mov    rax,rdx
  807a3e:	48 29 c8             	sub    rax,rcx
  807a41:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
  807a45:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807a49:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
  807a4c:	eb 07                	jmp    807a55 <FAT32_read+0x151>
	else
		index = count;
  807a4e:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807a52:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax

//	printf("FAT32_read first_cluster:%d,size:%d,preempt_count:%d\n",finode->first_cluster,filp->dentry->dir_inode->file_size,current->preempt_count);

	do
	{
		memset(buffer,0,fsbi->bytes_per_cluster);
  807a55:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807a59:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807a5d:	89 c2                	mov    edx,eax
  807a5f:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807a63:	be 00 00 00 00       	mov    esi,0x0
  807a68:	48 89 c7             	mov    rdi,rax
  807a6b:	e8 f6 2a 00 00       	call   80a566 <memset>
		sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  807a70:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807a74:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  807a78:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807a7c:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  807a80:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807a84:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807a88:	48 0f af c2          	imul   rax,rdx
  807a8c:	48 01 c8             	add    rax,rcx
  807a8f:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
        int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  807a93:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807a97:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807a9b:	89 c1                	mov    ecx,eax
  807a9d:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807aa1:	89 c2                	mov    edx,eax
  807aa3:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807aa7:	49 89 c0             	mov    r8,rax
  807aaa:	be 00 00 00 00       	mov    esi,0x0
  807aaf:	bf 00 00 00 00       	mov    edi,0x0
  807ab4:	e8 89 ef ff ff       	call   806a42 <request>
  807ab9:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
		if(!chk_result(r))
  807abc:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807abf:	89 c7                	mov    edi,eax
  807ac1:	e8 30 f6 ff ff       	call   8070f6 <chk_result>
  807ac6:	85 c0                	test   eax,eax
  807ac8:	75 1c                	jne    807ae6 <FAT32_read+0x1e2>
		{
			printf("FAT32 FS(read) read disk ERROR!!!!!!!!!!\n");
  807aca:	bf 90 2e 81 00       	mov    edi,0x812e90
  807acf:	b8 00 00 00 00       	mov    eax,0x0
  807ad4:	e8 0a 92 ff ff       	call   800ce3 <printf>
			retval = -EIO;
  807ad9:	48 c7 45 e8 e3 ff ff 	mov    QWORD PTR [rbp-0x18],0xffffffffffffffe3
  807ae0:	ff 
			break;
  807ae1:	e9 ba 00 00 00       	jmp    807ba0 <FAT32_read+0x29c>
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  807ae6:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  807ae9:	48 63 d0             	movsxd rdx,eax
  807aec:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807af0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807af4:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
  807af8:	48 39 c2             	cmp    rdx,rax
  807afb:	48 0f 4e c2          	cmovle rax,rdx
  807aff:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax

		if((unsigned long)buf < MAX_TASKS)
  807b02:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807b06:	48 83 f8 1f          	cmp    rax,0x1f
  807b0a:	77 1f                	ja     807b2b <FAT32_read+0x227>
			memcpy(buffer + offset,buf,length);
  807b0c:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  807b0f:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  807b13:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807b17:	48 01 c1             	add    rcx,rax
  807b1a:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807b1e:	48 89 c6             	mov    rsi,rax
  807b21:	48 89 cf             	mov    rdi,rcx
  807b24:	e8 8e 29 00 00       	call   80a4b7 <memcpy>
  807b29:	eb 1d                	jmp    807b48 <FAT32_read+0x244>
		else
			memcpy(buffer + offset,buf,length);
  807b2b:	8b 55 bc             	mov    edx,DWORD PTR [rbp-0x44]
  807b2e:	48 8b 4d d8          	mov    rcx,QWORD PTR [rbp-0x28]
  807b32:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807b36:	48 01 c1             	add    rcx,rax
  807b39:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  807b3d:	48 89 c6             	mov    rsi,rax
  807b40:	48 89 cf             	mov    rdi,rcx
  807b43:	e8 6f 29 00 00       	call   80a4b7 <memcpy>

		index -= length;
  807b48:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  807b4b:	29 45 e4             	sub    DWORD PTR [rbp-0x1c],eax
		buf += length;
  807b4e:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  807b51:	48 98                	cdqe   
  807b53:	48 01 45 90          	add    QWORD PTR [rbp-0x70],rax
		offset -= offset;
  807b57:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  807b5e:	00 
		*position += length;
  807b5f:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807b63:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807b66:	8b 45 bc             	mov    eax,DWORD PTR [rbp-0x44]
  807b69:	48 98                	cdqe   
  807b6b:	48 01 c2             	add    rdx,rax
  807b6e:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807b72:	48 89 10             	mov    QWORD PTR [rax],rdx
	}while(index && (cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster)));
  807b75:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  807b79:	74 25                	je     807ba0 <FAT32_read+0x29c>
  807b7b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807b7f:	89 c2                	mov    edx,eax
  807b81:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  807b85:	89 d6                	mov    esi,edx
  807b87:	48 89 c7             	mov    rdi,rax
  807b8a:	e8 46 fb ff ff       	call   8076d5 <DISK1_FAT32_read_FAT_Entry>
  807b8f:	89 c0                	mov    eax,eax
  807b91:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  807b95:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807b9a:	0f 85 b5 fe ff ff    	jne    807a55 <FAT32_read+0x151>

	vmfree(buffer);
  807ba0:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  807ba4:	48 89 c7             	mov    rdi,rax
  807ba7:	e8 de 95 ff ff       	call   80118a <vmfree>
	if(!index)
  807bac:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
  807bb0:	75 08                	jne    807bba <FAT32_read+0x2b6>
		retval = count;
  807bb2:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807bb6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	return retval;
  807bba:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
}
  807bbe:	c9                   	leave  
  807bbf:	c3                   	ret    

0000000000807bc0 <FAT32_find_available_cluster>:


unsigned long FAT32_find_available_cluster(struct FAT32_sb_info * fsbi)
{
  807bc0:	f3 0f 1e fa          	endbr64 
  807bc4:	55                   	push   rbp
  807bc5:	48 89 e5             	mov    rbp,rsp
  807bc8:	48 81 ec 30 02 00 00 	sub    rsp,0x230
  807bcf:	48 89 bd d8 fd ff ff 	mov    QWORD PTR [rbp-0x228],rdi
	int i,j;
	int fat_entry;
	unsigned long sector_per_fat = fsbi->sector_per_FAT;
  807bd6:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  807bdd:	48 8b 40 38          	mov    rax,QWORD PTR [rax+0x38]
  807be1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	unsigned int buf[128];

//	fsbi->fat_fsinfo->FSI_Free_Count & fsbi->fat_fsinfo->FSI_Nxt_Free not exactly,so unuse

	for(i = 0;i < sector_per_fat;i++)
  807be5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  807bec:	e9 8b 00 00 00       	jmp    807c7c <FAT32_find_available_cluster+0xbc>
	{
		memset(buf,0,512);
  807bf1:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  807bf8:	ba 00 02 00 00       	mov    edx,0x200
  807bfd:	be 00 00 00 00       	mov    esi,0x0
  807c02:	48 89 c7             	mov    rdi,rax
  807c05:	e8 5c 29 00 00       	call   80a566 <memset>
		int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,fsbi->FAT1_firstsector + i,1,(unsigned char *)buf);
  807c0a:	48 8b 85 d8 fd ff ff 	mov    rax,QWORD PTR [rbp-0x228]
  807c11:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807c15:	89 c2                	mov    edx,eax
  807c17:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807c1a:	01 d0                	add    eax,edx
  807c1c:	89 c2                	mov    edx,eax
  807c1e:	48 8d 85 e0 fd ff ff 	lea    rax,[rbp-0x220]
  807c25:	49 89 c0             	mov    r8,rax
  807c28:	b9 01 00 00 00       	mov    ecx,0x1
  807c2d:	be 00 00 00 00       	mov    esi,0x0
  807c32:	bf 00 00 00 00       	mov    edi,0x0
  807c37:	e8 06 ee ff ff       	call   806a42 <request>
  807c3c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax

		for(j = 0;j < 128;j++)
  807c3f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  807c46:	eb 2a                	jmp    807c72 <FAT32_find_available_cluster+0xb2>
		{
			if((buf[j] & 0x0fffffff) == 0)
  807c48:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c4b:	48 98                	cdqe   
  807c4d:	8b 84 85 e0 fd ff ff 	mov    eax,DWORD PTR [rbp+rax*4-0x220]
  807c54:	25 ff ff ff 0f       	and    eax,0xfffffff
  807c59:	85 c0                	test   eax,eax
  807c5b:	75 11                	jne    807c6e <FAT32_find_available_cluster+0xae>
				return (i << 7) + j;
  807c5d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807c60:	c1 e0 07             	shl    eax,0x7
  807c63:	89 c2                	mov    edx,eax
  807c65:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  807c68:	01 d0                	add    eax,edx
  807c6a:	48 98                	cdqe   
  807c6c:	eb 22                	jmp    807c90 <FAT32_find_available_cluster+0xd0>
		for(j = 0;j < 128;j++)
  807c6e:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  807c72:	83 7d f8 7f          	cmp    DWORD PTR [rbp-0x8],0x7f
  807c76:	7e d0                	jle    807c48 <FAT32_find_available_cluster+0x88>
	for(i = 0;i < sector_per_fat;i++)
  807c78:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  807c7c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  807c7f:	48 98                	cdqe   
  807c81:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
  807c85:	0f 87 66 ff ff ff    	ja     807bf1 <FAT32_find_available_cluster+0x31>
		}
	}
	return 0;
  807c8b:	b8 00 00 00 00       	mov    eax,0x0
}
  807c90:	c9                   	leave  
  807c91:	c3                   	ret    

0000000000807c92 <FAT32_write>:


long FAT32_write(struct file * filp,char * buf,unsigned long count,long * position)
{
  807c92:	f3 0f 1e fa          	endbr64 
  807c96:	55                   	push   rbp
  807c97:	48 89 e5             	mov    rbp,rsp
  807c9a:	48 81 ec 90 00 00 00 	sub    rsp,0x90
  807ca1:	48 89 7d 88          	mov    QWORD PTR [rbp-0x78],rdi
  807ca5:	48 89 75 80          	mov    QWORD PTR [rbp-0x80],rsi
  807ca9:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
  807cb0:	48 89 8d 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rcx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  807cb7:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807cbb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807cbf:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807cc3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807cc7:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  807ccb:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807ccf:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807cd3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807cd7:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807cdb:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807cdf:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned long cluster = finode->first_cluster;
  807ce3:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807ce7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807cea:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	unsigned long next_cluster = 0;
  807cee:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  807cf5:	00 
	unsigned long sector = 0;
  807cf6:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  807cfd:	00 
	int i,length = 0;
  807cfe:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [rbp-0x54],0x0
	long retval = 0;
  807d05:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  807d0c:	00 
	long flags = 0;
  807d0d:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  807d14:	00 
	int index = *position / fsbi->bytes_per_cluster;
  807d15:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  807d1c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807d1f:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  807d23:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  807d27:	48 99                	cqo    
  807d29:	48 f7 fe             	idiv   rsi
  807d2c:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
	long offset = *position % fsbi->bytes_per_cluster;
  807d2f:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  807d36:	48 8b 00             	mov    rax,QWORD PTR [rax]
  807d39:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  807d3d:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  807d41:	48 99                	cqo    
  807d43:	48 f7 f9             	idiv   rcx
  807d46:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
	char * buffer = (char *)vmalloc(fsbi->bytes_per_cluster,0);
  807d4a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807d4e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807d52:	be 00 00 00 00       	mov    esi,0x0
  807d57:	48 89 c7             	mov    rdi,rax
  807d5a:	b8 00 00 00 00       	mov    eax,0x0
  807d5f:	e8 97 93 ff ff       	call   8010fb <vmalloc>
  807d64:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax

	if(!cluster)
  807d68:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807d6d:	75 1a                	jne    807d89 <FAT32_write+0xf7>
	{
		cluster = FAT32_find_available_cluster(fsbi);
  807d6f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807d73:	48 89 c7             	mov    rdi,rax
  807d76:	e8 45 fe ff ff       	call   807bc0 <FAT32_find_available_cluster>
  807d7b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		flags = 1;
  807d7f:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  807d86:	00 
  807d87:	eb 2f                	jmp    807db8 <FAT32_write+0x126>
	}
	else
		for(i = 0;i < index;i++)
  807d89:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
  807d90:	eb 1e                	jmp    807db0 <FAT32_write+0x11e>
			cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  807d92:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807d96:	89 c2                	mov    edx,eax
  807d98:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807d9c:	89 d6                	mov    esi,edx
  807d9e:	48 89 c7             	mov    rdi,rax
  807da1:	e8 2f f9 ff ff       	call   8076d5 <DISK1_FAT32_read_FAT_Entry>
  807da6:	89 c0                	mov    eax,eax
  807da8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
		for(i = 0;i < index;i++)
  807dac:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
  807db0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  807db3:	3b 45 d4             	cmp    eax,DWORD PTR [rbp-0x2c]
  807db6:	7c da                	jl     807d92 <FAT32_write+0x100>

	if(!cluster)
  807db8:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  807dbd:	75 18                	jne    807dd7 <FAT32_write+0x145>
	{
		vmfree(buffer);
  807dbf:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807dc3:	48 89 c7             	mov    rdi,rax
  807dc6:	e8 bf 93 ff ff       	call   80118a <vmfree>
		return -ENOSPC;
  807dcb:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  807dd2:	e9 13 03 00 00       	jmp    8080ea <FAT32_write+0x458>
	}

	if(flags)
  807dd7:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807ddc:	74 4d                	je     807e2b <FAT32_write+0x199>
	{
		finode->first_cluster = cluster;
  807dde:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  807de2:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  807de6:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  807de9:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807ded:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807df1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807df5:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807df9:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  807dfd:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  807e01:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  807e05:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807e09:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  807e0d:	48 89 c7             	mov    rdi,rax
  807e10:	ff d2                	call   rdx
		DISK1_FAT32_write_FAT_Entry(fsbi,cluster,0x0ffffff8);
  807e12:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807e16:	89 c1                	mov    ecx,eax
  807e18:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807e1c:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  807e21:	89 ce                	mov    esi,ecx
  807e23:	48 89 c7             	mov    rdi,rax
  807e26:	e8 66 f9 ff ff       	call   807791 <DISK1_FAT32_write_FAT_Entry>
	}

	index = count;
  807e2b:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  807e32:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax

	do
	{
		if(!flags)
  807e35:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  807e3a:	0f 85 91 00 00 00    	jne    807ed1 <FAT32_write+0x23f>
		{
			memset(buffer,0,fsbi->bytes_per_cluster);
  807e40:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807e44:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807e48:	89 c2                	mov    edx,eax
  807e4a:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807e4e:	be 00 00 00 00       	mov    esi,0x0
  807e53:	48 89 c7             	mov    rdi,rax
  807e56:	e8 0b 27 00 00       	call   80a566 <memset>
			sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  807e5b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807e5f:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  807e63:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807e67:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  807e6b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807e6f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807e73:	48 0f af c2          	imul   rax,rdx
  807e77:	48 01 c8             	add    rax,rcx
  807e7a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
            int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  807e7e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807e82:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807e86:	89 c1                	mov    ecx,eax
  807e88:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807e8c:	89 c2                	mov    edx,eax
  807e8e:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807e92:	49 89 c0             	mov    r8,rax
  807e95:	be 00 00 00 00       	mov    esi,0x0
  807e9a:	bf 00 00 00 00       	mov    edi,0x0
  807e9f:	e8 9e eb ff ff       	call   806a42 <request>
  807ea4:	89 45 9c             	mov    DWORD PTR [rbp-0x64],eax

			if(!chk_result(r))
  807ea7:	8b 45 9c             	mov    eax,DWORD PTR [rbp-0x64]
  807eaa:	89 c7                	mov    edi,eax
  807eac:	e8 45 f2 ff ff       	call   8070f6 <chk_result>
  807eb1:	85 c0                	test   eax,eax
  807eb3:	75 1c                	jne    807ed1 <FAT32_write+0x23f>
			{
				printf("FAT32 FS(write) read disk ERROR!!!!!!!!!!\n");
  807eb5:	bf c0 2e 81 00       	mov    edi,0x812ec0
  807eba:	b8 00 00 00 00       	mov    eax,0x0
  807ebf:	e8 1f 8e ff ff       	call   800ce3 <printf>
				retval = -EIO;
  807ec4:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  807ecb:	ff 
				break;
  807ecc:	e9 95 01 00 00       	jmp    808066 <FAT32_write+0x3d4>
			}
		}

		length = index <= fsbi->bytes_per_cluster - offset ? index : fsbi->bytes_per_cluster - offset;
  807ed1:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  807ed4:	48 63 d0             	movsxd rdx,eax
  807ed7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807edb:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  807edf:	48 2b 45 c8          	sub    rax,QWORD PTR [rbp-0x38]
  807ee3:	48 39 c2             	cmp    rdx,rax
  807ee6:	48 0f 4e c2          	cmovle rax,rdx
  807eea:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax

		if((unsigned long)buf < MAX_TASKS)
  807eed:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807ef1:	48 83 f8 1f          	cmp    rax,0x1f
  807ef5:	77 1f                	ja     807f16 <FAT32_write+0x284>
			memcpy(buf,buffer + offset,length);
  807ef7:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  807efa:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  807efe:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807f02:	48 01 c1             	add    rcx,rax
  807f05:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807f09:	48 89 ce             	mov    rsi,rcx
  807f0c:	48 89 c7             	mov    rdi,rax
  807f0f:	e8 a3 25 00 00       	call   80a4b7 <memcpy>
  807f14:	eb 1d                	jmp    807f33 <FAT32_write+0x2a1>
		else
			memcpy(buf,buffer + offset,length);
  807f16:	8b 55 ac             	mov    edx,DWORD PTR [rbp-0x54]
  807f19:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
  807f1d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807f21:	48 01 c1             	add    rcx,rax
  807f24:	48 8b 45 80          	mov    rax,QWORD PTR [rbp-0x80]
  807f28:	48 89 ce             	mov    rsi,rcx
  807f2b:	48 89 c7             	mov    rdi,rax
  807f2e:	e8 84 25 00 00       	call   80a4b7 <memcpy>

		int r=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buffer);
  807f33:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807f37:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  807f3b:	89 c1                	mov    ecx,eax
  807f3d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  807f41:	89 c2                	mov    edx,eax
  807f43:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  807f47:	49 89 c0             	mov    r8,rax
  807f4a:	be 01 00 00 00       	mov    esi,0x1
  807f4f:	bf 00 00 00 00       	mov    edi,0x0
  807f54:	e8 e9 ea ff ff       	call   806a42 <request>
  807f59:	89 45 98             	mov    DWORD PTR [rbp-0x68],eax
        if(!chk_result(r))
  807f5c:	8b 45 98             	mov    eax,DWORD PTR [rbp-0x68]
  807f5f:	89 c7                	mov    edi,eax
  807f61:	e8 90 f1 ff ff       	call   8070f6 <chk_result>
  807f66:	85 c0                	test   eax,eax
  807f68:	75 1c                	jne    807f86 <FAT32_write+0x2f4>
		{
			printf("FAT32 FS(write) write disk ERROR!!!!!!!!!!\n");
  807f6a:	bf f0 2e 81 00       	mov    edi,0x812ef0
  807f6f:	b8 00 00 00 00       	mov    eax,0x0
  807f74:	e8 6a 8d ff ff       	call   800ce3 <printf>
			retval = -EIO;
  807f79:	48 c7 45 e0 e3 ff ff 	mov    QWORD PTR [rbp-0x20],0xffffffffffffffe3
  807f80:	ff 
			break;
  807f81:	e9 e0 00 00 00       	jmp    808066 <FAT32_write+0x3d4>
		}

		index -= length;
  807f86:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807f89:	29 45 d4             	sub    DWORD PTR [rbp-0x2c],eax
		buf += length;
  807f8c:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807f8f:	48 98                	cdqe   
  807f91:	48 01 45 80          	add    QWORD PTR [rbp-0x80],rax
		offset -= offset;
  807f95:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  807f9c:	00 
		*position += length;
  807f9d:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  807fa4:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  807fa7:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
  807faa:	48 98                	cdqe   
  807fac:	48 01 c2             	add    rdx,rax
  807faf:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  807fb6:	48 89 10             	mov    QWORD PTR [rax],rdx

		if(index)
  807fb9:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  807fbd:	0f 84 a2 00 00 00    	je     808065 <FAT32_write+0x3d3>
			next_cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  807fc3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  807fc7:	89 c2                	mov    edx,eax
  807fc9:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807fcd:	89 d6                	mov    esi,edx
  807fcf:	48 89 c7             	mov    rdi,rax
  807fd2:	e8 fe f6 ff ff       	call   8076d5 <DISK1_FAT32_read_FAT_Entry>
  807fd7:	89 c0                	mov    eax,eax
  807fd9:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
		else
			break;

		if(next_cluster >= 0x0ffffff8)
  807fdd:	48 81 7d b0 f7 ff ff 	cmp    QWORD PTR [rbp-0x50],0xffffff7
  807fe4:	0f 
  807fe5:	76 72                	jbe    808059 <FAT32_write+0x3c7>
		{
			next_cluster = FAT32_find_available_cluster(fsbi);
  807fe7:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  807feb:	48 89 c7             	mov    rdi,rax
  807fee:	e8 cd fb ff ff       	call   807bc0 <FAT32_find_available_cluster>
  807ff3:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
			if(!next_cluster)
  807ff7:	48 83 7d b0 00       	cmp    QWORD PTR [rbp-0x50],0x0
  807ffc:	75 18                	jne    808016 <FAT32_write+0x384>
			{
				vmfree(buffer);
  807ffe:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808002:	48 89 c7             	mov    rdi,rax
  808005:	e8 80 91 ff ff       	call   80118a <vmfree>
				return -ENOSPC;
  80800a:	48 c7 c0 cc ff ff ff 	mov    rax,0xffffffffffffffcc
  808011:	e9 d4 00 00 00       	jmp    8080ea <FAT32_write+0x458>
			}			
				
			DISK1_FAT32_write_FAT_Entry(fsbi,cluster,next_cluster);
  808016:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80801a:	89 c2                	mov    edx,eax
  80801c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808020:	89 c1                	mov    ecx,eax
  808022:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808026:	89 ce                	mov    esi,ecx
  808028:	48 89 c7             	mov    rdi,rax
  80802b:	e8 61 f7 ff ff       	call   807791 <DISK1_FAT32_write_FAT_Entry>
			DISK1_FAT32_write_FAT_Entry(fsbi,next_cluster,0x0ffffff8);
  808030:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  808034:	89 c1                	mov    ecx,eax
  808036:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80803a:	ba f8 ff ff 0f       	mov    edx,0xffffff8
  80803f:	89 ce                	mov    esi,ecx
  808041:	48 89 c7             	mov    rdi,rax
  808044:	e8 48 f7 ff ff       	call   807791 <DISK1_FAT32_write_FAT_Entry>
			cluster = next_cluster;
  808049:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80804d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			flags = 1;
  808051:	48 c7 45 d8 01 00 00 	mov    QWORD PTR [rbp-0x28],0x1
  808058:	00 
		}

	}while(index);
  808059:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  80805d:	0f 85 d2 fd ff ff    	jne    807e35 <FAT32_write+0x1a3>
  808063:	eb 01                	jmp    808066 <FAT32_write+0x3d4>
			break;
  808065:	90                   	nop

	if(*position > filp->dentry->dir_inode->file_size)
  808066:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80806d:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808070:	48 89 c2             	mov    rdx,rax
  808073:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808077:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80807b:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80807f:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808082:	48 39 c2             	cmp    rdx,rax
  808085:	76 42                	jbe    8080c9 <FAT32_write+0x437>
	{
		filp->dentry->dir_inode->file_size = *position;
  808087:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  80808e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808091:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  808095:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808099:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80809d:	48 89 10             	mov    QWORD PTR [rax],rdx
		filp->dentry->dir_inode->sb->sb_ops->write_inode(filp->dentry->dir_inode);
  8080a0:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8080a4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8080a8:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8080ac:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8080b0:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  8080b4:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
  8080b8:	48 8b 45 88          	mov    rax,QWORD PTR [rbp-0x78]
  8080bc:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8080c0:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8080c4:	48 89 c7             	mov    rdi,rax
  8080c7:	ff d2                	call   rdx
	}

	vmfree(buffer);
  8080c9:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8080cd:	48 89 c7             	mov    rdi,rax
  8080d0:	e8 b5 90 ff ff       	call   80118a <vmfree>
	if(!index)
  8080d5:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
  8080d9:	75 0b                	jne    8080e6 <FAT32_write+0x454>
		retval = count;
  8080db:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  8080e2:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	return retval;
  8080e6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
}
  8080ea:	c9                   	leave  
  8080eb:	c3                   	ret    

00000000008080ec <FAT32_lseek>:


long FAT32_lseek(struct file * filp,long offset,long origin)
{
  8080ec:	f3 0f 1e fa          	endbr64 
  8080f0:	55                   	push   rbp
  8080f1:	48 89 e5             	mov    rbp,rsp
  8080f4:	48 83 ec 30          	sub    rsp,0x30
  8080f8:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  8080fc:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  808100:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
	struct index_node *inode = filp->dentry->dir_inode;
  808104:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808108:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80810c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808110:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	long pos = 0;
  808114:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  80811b:	00 

	switch(origin)
  80811c:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  808121:	74 21                	je     808144 <FAT32_lseek+0x58>
  808123:	48 83 7d d8 02       	cmp    QWORD PTR [rbp-0x28],0x2
  808128:	7f 4a                	jg     808174 <FAT32_lseek+0x88>
  80812a:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80812f:	74 09                	je     80813a <FAT32_lseek+0x4e>
  808131:	48 83 7d d8 01       	cmp    QWORD PTR [rbp-0x28],0x1
  808136:	74 20                	je     808158 <FAT32_lseek+0x6c>
  808138:	eb 3a                	jmp    808174 <FAT32_lseek+0x88>
	{
		case SEEK_SET:
				pos = offset;
  80813a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80813e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  808142:	eb 39                	jmp    80817d <FAT32_lseek+0x91>

		case SEEK_CUR:
				pos =  filp->position + offset;
  808144:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808148:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  80814b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80814f:	48 01 d0             	add    rax,rdx
  808152:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  808156:	eb 25                	jmp    80817d <FAT32_lseek+0x91>

		case SEEK_END:
				pos = filp->dentry->dir_inode->file_size + offset;
  808158:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80815c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808160:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808164:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808167:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80816b:	48 01 d0             	add    rax,rdx
  80816e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
			break;
  808172:	eb 09                	jmp    80817d <FAT32_lseek+0x91>

		default:
			return -EINVAL;
  808174:	48 c7 c0 e4 ff ff ff 	mov    rax,0xffffffffffffffe4
  80817b:	eb 50                	jmp    8081cd <FAT32_lseek+0xe1>
			break;
	}

	if(pos < 0 || pos > filp->dentry->dir_inode->file_size)
  80817d:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
  808182:	78 18                	js     80819c <FAT32_lseek+0xb0>
  808184:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808188:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80818c:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808190:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808193:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  808197:	48 39 c2             	cmp    rdx,rax
  80819a:	73 09                	jae    8081a5 <FAT32_lseek+0xb9>
		return -EOVERFLOW;
  80819c:	48 c7 c0 bf ff ff ff 	mov    rax,0xffffffffffffffbf
  8081a3:	eb 28                	jmp    8081cd <FAT32_lseek+0xe1>

	filp->position = pos;
  8081a5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8081a9:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8081ad:	48 89 10             	mov    QWORD PTR [rax],rdx
	printf("FAT32 FS(lseek) alert position:%d\n",filp->position);
  8081b0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8081b4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8081b7:	48 89 c6             	mov    rsi,rax
  8081ba:	bf 20 2f 81 00       	mov    edi,0x812f20
  8081bf:	b8 00 00 00 00       	mov    eax,0x0
  8081c4:	e8 1a 8b ff ff       	call   800ce3 <printf>

	return pos;
  8081c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  8081cd:	c9                   	leave  
  8081ce:	c3                   	ret    

00000000008081cf <FAT32_ioctl>:


long FAT32_ioctl(struct index_node * inode,struct file * filp,unsigned long cmd,unsigned long arg)
{}
  8081cf:	f3 0f 1e fa          	endbr64 
  8081d3:	55                   	push   rbp
  8081d4:	48 89 e5             	mov    rbp,rsp
  8081d7:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8081db:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8081df:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8081e3:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  8081e7:	90                   	nop
  8081e8:	5d                   	pop    rbp
  8081e9:	c3                   	ret    

00000000008081ea <FAT32_readdir>:

long FAT32_readdir(struct file * filp,void * dirent,filldir_t filler)
{
  8081ea:	f3 0f 1e fa          	endbr64 
  8081ee:	55                   	push   rbp
  8081ef:	48 89 e5             	mov    rbp,rsp
  8081f2:	48 83 c4 80          	add    rsp,0xffffffffffffff80
  8081f6:	48 89 7d 98          	mov    QWORD PTR [rbp-0x68],rdi
  8081fa:	48 89 75 90          	mov    QWORD PTR [rbp-0x70],rsi
  8081fe:	48 89 55 88          	mov    QWORD PTR [rbp-0x78],rdx
	struct FAT32_inode_info * finode = filp->dentry->dir_inode->private_index_info;
  808202:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808206:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80820a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80820e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808212:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
	struct FAT32_sb_info * fsbi = filp->dentry->dir_inode->sb->private_sb_info;
  808216:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80821a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80821e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  808222:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808226:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80822a:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax

	unsigned int cluster = 0;
  80822e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  808235:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
  80823c:	00 
	unsigned char * buf =NULL; 
  80823d:	48 c7 45 a8 00 00 00 	mov    QWORD PTR [rbp-0x58],0x0
  808244:	00 
	char *name = NULL;
  808245:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80824c:	00 
	int namelen = 0;
  80824d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
	int i = 0,j = 0,x = 0,y = 0;
  808254:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  80825b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
  808262:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  808269:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  808270:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
  808277:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  808278:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  80827f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  808280:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808284:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808288:	be 00 00 00 00       	mov    esi,0x0
  80828d:	48 89 c7             	mov    rdi,rax
  808290:	b8 00 00 00 00       	mov    eax,0x0
  808295:	e8 61 8e ff ff       	call   8010fb <vmalloc>
  80829a:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax

	cluster = finode->first_cluster;
  80829e:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8082a2:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8082a5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

	j = filp->position/fsbi->bytes_per_cluster;
  8082a8:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8082ac:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8082af:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8082b3:	48 8b 72 18          	mov    rsi,QWORD PTR [rdx+0x18]
  8082b7:	48 99                	cqo    
  8082b9:	48 f7 fe             	idiv   rsi
  8082bc:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
	
	for(i = 0;i<j;i++)
  8082bf:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [rbp-0x18],0x0
  8082c6:	eb 3a                	jmp    808302 <FAT32_readdir+0x118>
	{
		cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  8082c8:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  8082cb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8082cf:	89 d6                	mov    esi,edx
  8082d1:	48 89 c7             	mov    rdi,rax
  8082d4:	e8 fc f3 ff ff       	call   8076d5 <DISK1_FAT32_read_FAT_Entry>
  8082d9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
		if(cluster > 0x0ffffff7)
  8082dc:	81 7d fc f7 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff7
  8082e3:	76 19                	jbe    8082fe <FAT32_readdir+0x114>
		{
			printf("FAT32 FS(readdir) cluster didn`t exist\n");
  8082e5:	bf 48 2f 81 00       	mov    edi,0x812f48
  8082ea:	b8 00 00 00 00       	mov    eax,0x0
  8082ef:	e8 ef 89 ff ff       	call   800ce3 <printf>
			return NULL;
  8082f4:	b8 00 00 00 00       	mov    eax,0x0
  8082f9:	e9 86 05 00 00       	jmp    808884 <FAT32_readdir+0x69a>
	for(i = 0;i<j;i++)
  8082fe:	83 45 e8 01          	add    DWORD PTR [rbp-0x18],0x1
  808302:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808305:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  808308:	7c be                	jl     8082c8 <FAT32_readdir+0xde>
		}
	}

next_cluster:
  80830a:	90                   	nop
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  80830b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80830f:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  808313:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808316:	83 e8 02             	sub    eax,0x2
  808319:	89 c1                	mov    ecx,eax
  80831b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80831f:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808323:	48 0f af c1          	imul   rax,rcx
  808327:	48 01 d0             	add    rax,rdx
  80832a:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  80832e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808332:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808336:	89 c1                	mov    ecx,eax
  808338:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  80833c:	89 c2                	mov    edx,eax
  80833e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808342:	49 89 c0             	mov    r8,rax
  808345:	be 00 00 00 00       	mov    esi,0x0
  80834a:	bf 00 00 00 00       	mov    edi,0x0
  80834f:	e8 ee e6 ff ff       	call   806a42 <request>
  808354:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
    if(!chk_result(r))
  808357:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
  80835a:	89 c7                	mov    edi,eax
  80835c:	e8 95 ed ff ff       	call   8070f6 <chk_result>
  808361:	85 c0                	test   eax,eax
  808363:	75 25                	jne    80838a <FAT32_readdir+0x1a0>
	{
		printf("FAT32 FS(readdir) read disk ERROR!!!!!!!!!!\n");
  808365:	bf 70 2f 81 00       	mov    edi,0x812f70
  80836a:	b8 00 00 00 00       	mov    eax,0x0
  80836f:	e8 6f 89 ff ff       	call   800ce3 <printf>
		vmfree(buf);
  808374:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  808378:	48 89 c7             	mov    rdi,rax
  80837b:	e8 0a 8e ff ff       	call   80118a <vmfree>
		return NULL;
  808380:	b8 00 00 00 00       	mov    eax,0x0
  808385:	e9 fa 04 00 00       	jmp    808884 <FAT32_readdir+0x69a>
	}

	tmpdentry = (struct FAT32_Directory *)(buf + filp->position%fsbi->bytes_per_cluster);
  80838a:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80838e:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808391:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  808395:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  808399:	48 99                	cqo    
  80839b:	48 f7 f9             	idiv   rcx
  80839e:	48 89 d0             	mov    rax,rdx
  8083a1:	48 89 c2             	mov    rdx,rax
  8083a4:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8083a8:	48 01 d0             	add    rax,rdx
  8083ab:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  8083af:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8083b3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8083b6:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8083ba:	48 8b 4a 18          	mov    rcx,QWORD PTR [rdx+0x18]
  8083be:	48 99                	cqo    
  8083c0:	48 f7 f9             	idiv   rcx
  8083c3:	48 89 d0             	mov    rax,rdx
  8083c6:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  8083c9:	e9 2f 04 00 00       	jmp    8087fd <FAT32_readdir+0x613>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  8083ce:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8083d2:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8083d6:	3c 0f                	cmp    al,0xf
  8083d8:	0f 84 00 04 00 00    	je     8087de <FAT32_readdir+0x5f4>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  8083de:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8083e2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8083e5:	3c e5                	cmp    al,0xe5
  8083e7:	0f 84 f4 03 00 00    	je     8087e1 <FAT32_readdir+0x5f7>
  8083ed:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8083f1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8083f4:	84 c0                	test   al,al
  8083f6:	0f 84 e5 03 00 00    	je     8087e1 <FAT32_readdir+0x5f7>
  8083fc:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808400:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808403:	3c 05                	cmp    al,0x5
  808405:	0f 84 d6 03 00 00    	je     8087e1 <FAT32_readdir+0x5f7>
			continue;

		namelen = 0;
  80840b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  808412:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808416:	48 83 e8 20          	sub    rax,0x20
  80841a:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

		if(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80841e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808422:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808426:	3c 0f                	cmp    al,0xf
  808428:	0f 85 2a 02 00 00    	jne    808658 <FAT32_readdir+0x46e>
  80842e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808432:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808435:	3c e5                	cmp    al,0xe5
  808437:	0f 84 1b 02 00 00    	je     808658 <FAT32_readdir+0x46e>
  80843d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808441:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808444:	84 c0                	test   al,al
  808446:	0f 84 0c 02 00 00    	je     808658 <FAT32_readdir+0x46e>
  80844c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808450:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808453:	3c 05                	cmp    al,0x5
  808455:	0f 84 fd 01 00 00    	je     808658 <FAT32_readdir+0x46e>
		{
			j = 0;
  80845b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
			//long file/dir name read
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  808462:	eb 1a                	jmp    80847e <FAT32_readdir+0x294>
			{
				j++;
  808464:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
				if(tmpldentry->LDIR_Ord & 0x40)
  808468:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80846c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80846f:	0f b6 c0             	movzx  eax,al
  808472:	83 e0 40             	and    eax,0x40
  808475:	85 c0                	test   eax,eax
  808477:	75 34                	jne    8084ad <FAT32_readdir+0x2c3>
					break;
				tmpldentry --;
  808479:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
			while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME  && tmpldentry->LDIR_Ord != 0xe5 && tmpldentry->LDIR_Ord != 0x00 && tmpldentry->LDIR_Ord != 0x05)
  80847e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808482:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808486:	3c 0f                	cmp    al,0xf
  808488:	75 24                	jne    8084ae <FAT32_readdir+0x2c4>
  80848a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80848e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808491:	3c e5                	cmp    al,0xe5
  808493:	74 19                	je     8084ae <FAT32_readdir+0x2c4>
  808495:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808499:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80849c:	84 c0                	test   al,al
  80849e:	74 0e                	je     8084ae <FAT32_readdir+0x2c4>
  8084a0:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8084a4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8084a7:	3c 05                	cmp    al,0x5
  8084a9:	75 b9                	jne    808464 <FAT32_readdir+0x27a>
  8084ab:	eb 01                	jmp    8084ae <FAT32_readdir+0x2c4>
					break;
  8084ad:	90                   	nop
			}

			name = vmalloc(j*13+1,0);
  8084ae:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8084b1:	89 d0                	mov    eax,edx
  8084b3:	01 c0                	add    eax,eax
  8084b5:	01 d0                	add    eax,edx
  8084b7:	c1 e0 02             	shl    eax,0x2
  8084ba:	01 d0                	add    eax,edx
  8084bc:	83 c0 01             	add    eax,0x1
  8084bf:	be 00 00 00 00       	mov    esi,0x0
  8084c4:	89 c7                	mov    edi,eax
  8084c6:	b8 00 00 00 00       	mov    eax,0x0
  8084cb:	e8 2b 8c ff ff       	call   8010fb <vmalloc>
  8084d0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
			memset(name,0,j*13+1);
  8084d4:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
  8084d7:	89 d0                	mov    eax,edx
  8084d9:	01 c0                	add    eax,eax
  8084db:	01 d0                	add    eax,edx
  8084dd:	c1 e0 02             	shl    eax,0x2
  8084e0:	01 d0                	add    eax,edx
  8084e2:	83 c0 01             	add    eax,0x1
  8084e5:	89 c2                	mov    edx,eax
  8084e7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8084eb:	be 00 00 00 00       	mov    esi,0x0
  8084f0:	48 89 c7             	mov    rdi,rax
  8084f3:	e8 6e 20 00 00       	call   80a566 <memset>
			tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  8084f8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8084fc:	48 83 e8 20          	sub    rax,0x20
  808500:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax

			for(x = 0;x<j;x++,tmpldentry --)
  808504:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80850b:	e9 37 01 00 00       	jmp    808647 <FAT32_readdir+0x45d>
			{
				for(y = 0;y<5;y++)
  808510:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  808517:	eb 53                	jmp    80856c <FAT32_readdir+0x382>
					if(tmpldentry->LDIR_Name1[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  808519:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80851d:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808520:	48 63 d2             	movsxd rdx,edx
  808523:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  808528:	66 83 f8 ff          	cmp    ax,0xffff
  80852c:	74 3a                	je     808568 <FAT32_readdir+0x37e>
  80852e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808532:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808535:	48 63 d2             	movsxd rdx,edx
  808538:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80853d:	66 85 c0             	test   ax,ax
  808540:	74 26                	je     808568 <FAT32_readdir+0x37e>
						name[namelen++] = (char)tmpldentry->LDIR_Name1[y];
  808542:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808546:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808549:	48 63 d2             	movsxd rdx,edx
  80854c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  808551:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808554:	8d 50 01             	lea    edx,[rax+0x1]
  808557:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80855a:	48 63 d0             	movsxd rdx,eax
  80855d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808561:	48 01 d0             	add    rax,rdx
  808564:	89 ca                	mov    edx,ecx
  808566:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<5;y++)
  808568:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  80856c:	83 7d dc 04          	cmp    DWORD PTR [rbp-0x24],0x4
  808570:	7e a7                	jle    808519 <FAT32_readdir+0x32f>

				for(y = 0;y<6;y++)
  808572:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  808579:	eb 53                	jmp    8085ce <FAT32_readdir+0x3e4>
					if(tmpldentry->LDIR_Name2[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  80857b:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80857f:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808582:	48 63 d2             	movsxd rdx,edx
  808585:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  80858a:	66 83 f8 ff          	cmp    ax,0xffff
  80858e:	74 3a                	je     8085ca <FAT32_readdir+0x3e0>
  808590:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808594:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808597:	48 63 d2             	movsxd rdx,edx
  80859a:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  80859f:	66 85 c0             	test   ax,ax
  8085a2:	74 26                	je     8085ca <FAT32_readdir+0x3e0>
						name[namelen++] = (char)tmpldentry->LDIR_Name2[y];
  8085a4:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8085a8:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8085ab:	48 63 d2             	movsxd rdx,edx
  8085ae:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  8085b3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8085b6:	8d 50 01             	lea    edx,[rax+0x1]
  8085b9:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8085bc:	48 63 d0             	movsxd rdx,eax
  8085bf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8085c3:	48 01 d0             	add    rax,rdx
  8085c6:	89 ca                	mov    edx,ecx
  8085c8:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<6;y++)
  8085ca:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  8085ce:	83 7d dc 05          	cmp    DWORD PTR [rbp-0x24],0x5
  8085d2:	7e a7                	jle    80857b <FAT32_readdir+0x391>

				for(y = 0;y<2;y++)
  8085d4:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
  8085db:	eb 5b                	jmp    808638 <FAT32_readdir+0x44e>
					if(tmpldentry->LDIR_Name3[y] != 0xffff && tmpldentry->LDIR_Name1[y] != 0x0000)
  8085dd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8085e1:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8085e4:	48 63 d2             	movsxd rdx,edx
  8085e7:	48 83 c2 08          	add    rdx,0x8
  8085eb:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  8085f0:	66 83 f8 ff          	cmp    ax,0xffff
  8085f4:	74 3e                	je     808634 <FAT32_readdir+0x44a>
  8085f6:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  8085fa:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  8085fd:	48 63 d2             	movsxd rdx,edx
  808600:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  808605:	66 85 c0             	test   ax,ax
  808608:	74 2a                	je     808634 <FAT32_readdir+0x44a>
						name[namelen++] = (char)tmpldentry->LDIR_Name3[y];
  80860a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80860e:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
  808611:	48 63 d2             	movsxd rdx,edx
  808614:	48 83 c2 08          	add    rdx,0x8
  808618:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  80861d:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808620:	8d 50 01             	lea    edx,[rax+0x1]
  808623:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808626:	48 63 d0             	movsxd rdx,eax
  808629:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80862d:	48 01 d0             	add    rax,rdx
  808630:	89 ca                	mov    edx,ecx
  808632:	88 10                	mov    BYTE PTR [rax],dl
				for(y = 0;y<2;y++)
  808634:	83 45 dc 01          	add    DWORD PTR [rbp-0x24],0x1
  808638:	83 7d dc 01          	cmp    DWORD PTR [rbp-0x24],0x1
  80863c:	7e 9f                	jle    8085dd <FAT32_readdir+0x3f3>
			for(x = 0;x<j;x++,tmpldentry --)
  80863e:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  808642:	48 83 6d c8 20       	sub    QWORD PTR [rbp-0x38],0x20
  808647:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80864a:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
  80864d:	0f 8c bd fe ff ff    	jl     808510 <FAT32_readdir+0x326>
			}
			goto find_lookup_success;
  808653:	e9 f5 01 00 00       	jmp    80884d <FAT32_readdir+0x663>
		}

		name = vmalloc(15,0);
  808658:	be 00 00 00 00       	mov    esi,0x0
  80865d:	bf 0f 00 00 00       	mov    edi,0xf
  808662:	b8 00 00 00 00       	mov    eax,0x0
  808667:	e8 8f 8a ff ff       	call   8010fb <vmalloc>
  80866c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
		memset(name,0,15);
  808670:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808674:	ba 0f 00 00 00       	mov    edx,0xf
  808679:	be 00 00 00 00       	mov    esi,0x0
  80867e:	48 89 c7             	mov    rdi,rax
  808681:	e8 e0 1e 00 00       	call   80a566 <memset>
		//short file/dir base name compare
		for(x=0;x<8;x++)
  808686:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [rbp-0x20],0x0
  80868d:	eb 74                	jmp    808703 <FAT32_readdir+0x519>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  80868f:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808693:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808696:	48 98                	cdqe   
  808698:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80869c:	3c 20                	cmp    al,0x20
  80869e:	74 6b                	je     80870b <FAT32_readdir+0x521>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  8086a0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  8086a4:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  8086a8:	0f b6 c0             	movzx  eax,al
  8086ab:	83 e0 08             	and    eax,0x8
  8086ae:	85 c0                	test   eax,eax
  8086b0:	74 29                	je     8086db <FAT32_readdir+0x4f1>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  8086b2:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8086b6:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8086b9:	48 98                	cdqe   
  8086bb:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  8086bf:	8d 48 20             	lea    ecx,[rax+0x20]
  8086c2:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8086c5:	8d 50 01             	lea    edx,[rax+0x1]
  8086c8:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8086cb:	48 63 d0             	movsxd rdx,eax
  8086ce:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8086d2:	48 01 d0             	add    rax,rdx
  8086d5:	89 ca                	mov    edx,ecx
  8086d7:	88 10                	mov    BYTE PTR [rax],dl
  8086d9:	eb 24                	jmp    8086ff <FAT32_readdir+0x515>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  8086db:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  8086df:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  8086e2:	48 98                	cdqe   
  8086e4:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  8086e8:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8086eb:	8d 50 01             	lea    edx,[rax+0x1]
  8086ee:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8086f1:	48 63 d0             	movsxd rdx,eax
  8086f4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8086f8:	48 01 d0             	add    rax,rdx
  8086fb:	89 ca                	mov    edx,ecx
  8086fd:	88 10                	mov    BYTE PTR [rax],dl
		for(x=0;x<8;x++)
  8086ff:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  808703:	83 7d e0 07          	cmp    DWORD PTR [rbp-0x20],0x7
  808707:	7e 86                	jle    80868f <FAT32_readdir+0x4a5>
  808709:	eb 01                	jmp    80870c <FAT32_readdir+0x522>
				break;
  80870b:	90                   	nop
		}

		if(tmpdentry->DIR_Attr & ATTR_DIRECTORY)
  80870c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808710:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808714:	0f b6 c0             	movzx  eax,al
  808717:	83 e0 10             	and    eax,0x10
  80871a:	85 c0                	test   eax,eax
  80871c:	0f 85 27 01 00 00    	jne    808849 <FAT32_readdir+0x65f>
			goto find_lookup_success;

		name[namelen++] = '.';
  808722:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808725:	8d 50 01             	lea    edx,[rax+0x1]
  808728:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80872b:	48 63 d0             	movsxd rdx,eax
  80872e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808732:	48 01 d0             	add    rax,rdx
  808735:	c6 00 2e             	mov    BYTE PTR [rax],0x2e

		//short file ext name compare
		for(x=8;x<11;x++)
  808738:	c7 45 e0 08 00 00 00 	mov    DWORD PTR [rbp-0x20],0x8
  80873f:	eb 74                	jmp    8087b5 <FAT32_readdir+0x5cb>
		{
			if(tmpdentry->DIR_Name[x] == ' ')
  808741:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808745:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808748:	48 98                	cdqe   
  80874a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  80874e:	3c 20                	cmp    al,0x20
  808750:	74 6b                	je     8087bd <FAT32_readdir+0x5d3>
				break;
			if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  808752:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808756:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  80875a:	0f b6 c0             	movzx  eax,al
  80875d:	83 e0 10             	and    eax,0x10
  808760:	85 c0                	test   eax,eax
  808762:	74 29                	je     80878d <FAT32_readdir+0x5a3>
				name[namelen++] = tmpdentry->DIR_Name[x] + 32;
  808764:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808768:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  80876b:	48 98                	cdqe   
  80876d:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808771:	8d 48 20             	lea    ecx,[rax+0x20]
  808774:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808777:	8d 50 01             	lea    edx,[rax+0x1]
  80877a:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  80877d:	48 63 d0             	movsxd rdx,eax
  808780:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  808784:	48 01 d0             	add    rax,rdx
  808787:	89 ca                	mov    edx,ecx
  808789:	88 10                	mov    BYTE PTR [rax],dl
  80878b:	eb 24                	jmp    8087b1 <FAT32_readdir+0x5c7>
			else
				name[namelen++] = tmpdentry->DIR_Name[x];
  80878d:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  808791:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
  808794:	48 98                	cdqe   
  808796:	0f b6 0c 02          	movzx  ecx,BYTE PTR [rdx+rax*1]
  80879a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80879d:	8d 50 01             	lea    edx,[rax+0x1]
  8087a0:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8087a3:	48 63 d0             	movsxd rdx,eax
  8087a6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8087aa:	48 01 d0             	add    rax,rdx
  8087ad:	89 ca                	mov    edx,ecx
  8087af:	88 10                	mov    BYTE PTR [rax],dl
		for(x=8;x<11;x++)
  8087b1:	83 45 e0 01          	add    DWORD PTR [rbp-0x20],0x1
  8087b5:	83 7d e0 0a          	cmp    DWORD PTR [rbp-0x20],0xa
  8087b9:	7e 86                	jle    808741 <FAT32_readdir+0x557>
  8087bb:	eb 01                	jmp    8087be <FAT32_readdir+0x5d4>
				break;
  8087bd:	90                   	nop
		}
		if(x == 8)
  8087be:	83 7d e0 08          	cmp    DWORD PTR [rbp-0x20],0x8
  8087c2:	0f 85 84 00 00 00    	jne    80884c <FAT32_readdir+0x662>
			name[--namelen] = 0;
  8087c8:	83 6d ec 01          	sub    DWORD PTR [rbp-0x14],0x1
  8087cc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  8087cf:	48 63 d0             	movsxd rdx,eax
  8087d2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8087d6:	48 01 d0             	add    rax,rdx
  8087d9:	c6 00 00             	mov    BYTE PTR [rax],0x0
		goto find_lookup_success;
  8087dc:	eb 6e                	jmp    80884c <FAT32_readdir+0x662>
			continue;
  8087de:	90                   	nop
  8087df:	eb 01                	jmp    8087e2 <FAT32_readdir+0x5f8>
			continue;
  8087e1:	90                   	nop
	for(i = filp->position%fsbi->bytes_per_cluster;i < fsbi->bytes_per_cluster;i += 32,tmpdentry++,filp->position += 32)
  8087e2:	83 45 e8 20          	add    DWORD PTR [rbp-0x18],0x20
  8087e6:	48 83 45 d0 20       	add    QWORD PTR [rbp-0x30],0x20
  8087eb:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8087ef:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8087f2:	48 8d 50 20          	lea    rdx,[rax+0x20]
  8087f6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  8087fa:	48 89 10             	mov    QWORD PTR [rax],rdx
  8087fd:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  808800:	48 63 d0             	movsxd rdx,eax
  808803:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808807:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80880b:	48 39 c2             	cmp    rdx,rax
  80880e:	0f 8c ba fb ff ff    	jl     8083ce <FAT32_readdir+0x1e4>
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808814:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  808817:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80881b:	89 d6                	mov    esi,edx
  80881d:	48 89 c7             	mov    rdi,rax
  808820:	e8 b0 ee ff ff       	call   8076d5 <DISK1_FAT32_read_FAT_Entry>
  808825:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  808828:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  80882f:	77 05                	ja     808836 <FAT32_readdir+0x64c>
		goto next_cluster;
  808831:	e9 d5 fa ff ff       	jmp    80830b <FAT32_readdir+0x121>

	vmfree(buf);
  808836:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  80883a:	48 89 c7             	mov    rdi,rax
  80883d:	e8 48 89 ff ff       	call   80118a <vmfree>
	return NULL;
  808842:	b8 00 00 00 00       	mov    eax,0x0
  808847:	eb 3b                	jmp    808884 <FAT32_readdir+0x69a>
			goto find_lookup_success;
  808849:	90                   	nop
  80884a:	eb 01                	jmp    80884d <FAT32_readdir+0x663>
		goto find_lookup_success;
  80884c:	90                   	nop

find_lookup_success:

	filp->position += 32;
  80884d:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  808851:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808854:	48 8d 50 20          	lea    rdx,[rax+0x20]
  808858:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
  80885c:	48 89 10             	mov    QWORD PTR [rax],rdx
	return filler(dirent,name,namelen,0,0);
  80885f:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  808862:	48 63 d0             	movsxd rdx,eax
  808865:	48 8b 75 f0          	mov    rsi,QWORD PTR [rbp-0x10]
  808869:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
  80886d:	4c 8b 4d 88          	mov    r9,QWORD PTR [rbp-0x78]
  808871:	41 b8 00 00 00 00    	mov    r8d,0x0
  808877:	b9 00 00 00 00       	mov    ecx,0x0
  80887c:	48 89 c7             	mov    rdi,rax
  80887f:	41 ff d1             	call   r9
  808882:	48 98                	cdqe   
}
  808884:	c9                   	leave  
  808885:	c3                   	ret    

0000000000808886 <FAT32_create>:
	.readdir = FAT32_readdir,
};


long FAT32_create(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  808886:	f3 0f 1e fa          	endbr64 
  80888a:	55                   	push   rbp
  80888b:	48 89 e5             	mov    rbp,rsp
  80888e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  808892:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  808896:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  808899:	90                   	nop
  80889a:	5d                   	pop    rbp
  80889b:	c3                   	ret    

000000000080889c <FAT32_lookup>:


struct dir_entry * FAT32_lookup(struct index_node * parent_inode,struct dir_entry * dest_dentry)
{
  80889c:	f3 0f 1e fa          	endbr64 
  8088a0:	55                   	push   rbp
  8088a1:	48 89 e5             	mov    rbp,rsp
  8088a4:	48 83 ec 60          	sub    rsp,0x60
  8088a8:	48 89 7d a8          	mov    QWORD PTR [rbp-0x58],rdi
  8088ac:	48 89 75 a0          	mov    QWORD PTR [rbp-0x60],rsi
	struct FAT32_inode_info * finode = parent_inode->private_index_info;
  8088b0:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8088b4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8088b8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	struct FAT32_sb_info * fsbi = parent_inode->sb->private_sb_info;
  8088bc:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  8088c0:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8088c4:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8088c8:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax

	unsigned int cluster = 0;
  8088cc:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
	unsigned long sector = 0;
  8088d3:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
  8088da:	00 
	unsigned char * buf =NULL; 
  8088db:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
  8088e2:	00 
	int i = 0,j = 0,x = 0;
  8088e3:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8088ea:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  8088f1:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
	struct FAT32_Directory * tmpdentry = NULL;
  8088f8:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8088ff:	00 
	struct FAT32_LongDirectory * tmpldentry = NULL;
  808900:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  808907:	00 
	struct index_node * p = NULL;
  808908:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
  80890f:	00 

	buf = vmalloc(fsbi->bytes_per_cluster,0);
  808910:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808914:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808918:	be 00 00 00 00       	mov    esi,0x0
  80891d:	48 89 c7             	mov    rdi,rax
  808920:	b8 00 00 00 00       	mov    eax,0x0
  808925:	e8 d1 87 ff ff       	call   8010fb <vmalloc>
  80892a:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax

	cluster = finode->first_cluster;
  80892e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  808932:	48 8b 00             	mov    rax,QWORD PTR [rax]
  808935:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax

next_cluster:
	sector = fsbi->Data_firstsector + (cluster - 2) * fsbi->sector_per_cluster;
  808938:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80893c:	48 8b 50 28          	mov    rdx,QWORD PTR [rax+0x28]
  808940:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808943:	83 e8 02             	sub    eax,0x2
  808946:	89 c1                	mov    ecx,eax
  808948:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80894c:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  808950:	48 0f af c1          	imul   rax,rcx
  808954:	48 01 d0             	add    rax,rdx
  808957:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
	printf("lookup cluster:%#010x,sector:%#018lx\n",cluster,sector);
  80895b:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80895f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  808962:	89 c6                	mov    esi,eax
  808964:	bf a0 2f 81 00       	mov    edi,0x812fa0
  808969:	b8 00 00 00 00       	mov    eax,0x0
  80896e:	e8 70 83 ff ff       	call   800ce3 <printf>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  808973:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808977:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80897b:	89 c1                	mov    ecx,eax
  80897d:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  808981:	89 c2                	mov    edx,eax
  808983:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808987:	49 89 c0             	mov    r8,rax
  80898a:	be 00 00 00 00       	mov    esi,0x0
  80898f:	bf 00 00 00 00       	mov    edi,0x0
  808994:	e8 a9 e0 ff ff       	call   806a42 <request>
  808999:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
    if(!chk_result(r))
  80899c:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
  80899f:	89 c7                	mov    edi,eax
  8089a1:	e8 50 e7 ff ff       	call   8070f6 <chk_result>
  8089a6:	85 c0                	test   eax,eax
  8089a8:	75 25                	jne    8089cf <FAT32_lookup+0x133>
	{
		printf("FAT32 FS(lookup) read disk ERROR!!!!!!!!!!\n");
  8089aa:	bf c8 2f 81 00       	mov    edi,0x812fc8
  8089af:	b8 00 00 00 00       	mov    eax,0x0
  8089b4:	e8 2a 83 ff ff       	call   800ce3 <printf>
		vmfree(buf);
  8089b9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8089bd:	48 89 c7             	mov    rdi,rax
  8089c0:	e8 c5 87 ff ff       	call   80118a <vmfree>
		return NULL;
  8089c5:	b8 00 00 00 00       	mov    eax,0x0
  8089ca:	e9 f0 07 00 00       	jmp    8091bf <FAT32_lookup+0x923>
	}

	tmpdentry = (struct FAT32_Directory *)buf;
  8089cf:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8089d3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax

	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  8089d7:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  8089de:	e9 9d 05 00 00       	jmp    808f80 <FAT32_lookup+0x6e4>
	{
		if(tmpdentry->DIR_Attr == ATTR_LONG_NAME)
  8089e3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8089e7:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  8089eb:	3c 0f                	cmp    al,0xf
  8089ed:	0f 84 59 05 00 00    	je     808f4c <FAT32_lookup+0x6b0>
			continue;
		if(tmpdentry->DIR_Name[0] == 0xe5 || tmpdentry->DIR_Name[0] == 0x00 || tmpdentry->DIR_Name[0] == 0x05)
  8089f3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8089f7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  8089fa:	3c e5                	cmp    al,0xe5
  8089fc:	0f 84 4d 05 00 00    	je     808f4f <FAT32_lookup+0x6b3>
  808a02:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808a06:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808a09:	84 c0                	test   al,al
  808a0b:	0f 84 3e 05 00 00    	je     808f4f <FAT32_lookup+0x6b3>
  808a11:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808a15:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808a18:	3c 05                	cmp    al,0x5
  808a1a:	0f 84 2f 05 00 00    	je     808f4f <FAT32_lookup+0x6b3>
			continue;

		tmpldentry = (struct FAT32_LongDirectory *)tmpdentry-1;
  808a20:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808a24:	48 83 e8 20          	sub    rax,0x20
  808a28:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
		j = 0;
  808a2c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0

		//long file/dir name compare
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  808a33:	e9 88 01 00 00       	jmp    808bc0 <FAT32_lookup+0x324>
		{
			for(x=0;x<5;x++)
  808a38:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808a3f:	eb 6a                	jmp    808aab <FAT32_lookup+0x20f>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name1[x] == 0xffff)
  808a41:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808a45:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808a48:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808a4b:	7e 15                	jle    808a62 <FAT32_lookup+0x1c6>
  808a4d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808a51:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808a54:	48 63 d2             	movsxd rdx,edx
  808a57:	0f b7 44 50 01       	movzx  eax,WORD PTR [rax+rdx*2+0x1]
  808a5c:	66 83 f8 ff          	cmp    ax,0xffff
  808a60:	74 44                	je     808aa6 <FAT32_lookup+0x20a>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name1[x] != (unsigned short)(dest_dentry->name[j++]))
  808a62:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808a66:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808a69:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808a6c:	0f 8f e0 04 00 00    	jg     808f52 <FAT32_lookup+0x6b6>
  808a72:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808a76:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808a79:	48 63 d2             	movsxd rdx,edx
  808a7c:	0f b7 4c 50 01       	movzx  ecx,WORD PTR [rax+rdx*2+0x1]
  808a81:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808a85:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  808a88:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808a8b:	8d 50 01             	lea    edx,[rax+0x1]
  808a8e:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  808a91:	48 98                	cdqe   
  808a93:	48 01 f0             	add    rax,rsi
  808a96:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808a99:	66 98                	cbw    
  808a9b:	66 39 c1             	cmp    cx,ax
  808a9e:	0f 85 ae 04 00 00    	jne    808f52 <FAT32_lookup+0x6b6>
  808aa4:	eb 01                	jmp    808aa7 <FAT32_lookup+0x20b>
					continue;
  808aa6:	90                   	nop
			for(x=0;x<5;x++)
  808aa7:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808aab:	83 7d f0 04          	cmp    DWORD PTR [rbp-0x10],0x4
  808aaf:	7e 90                	jle    808a41 <FAT32_lookup+0x1a5>
					goto continue_cmp_fail;
			}
			for(x=0;x<6;x++)
  808ab1:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808ab8:	eb 6a                	jmp    808b24 <FAT32_lookup+0x288>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name2[x] == 0xffff)
  808aba:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808abe:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808ac1:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808ac4:	7e 15                	jle    808adb <FAT32_lookup+0x23f>
  808ac6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808aca:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808acd:	48 63 d2             	movsxd rdx,edx
  808ad0:	0f b7 44 50 0e       	movzx  eax,WORD PTR [rax+rdx*2+0xe]
  808ad5:	66 83 f8 ff          	cmp    ax,0xffff
  808ad9:	74 44                	je     808b1f <FAT32_lookup+0x283>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name2[x] != (unsigned short)(dest_dentry->name[j++]))
  808adb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808adf:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808ae2:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808ae5:	0f 8f 6a 04 00 00    	jg     808f55 <FAT32_lookup+0x6b9>
  808aeb:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808aef:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808af2:	48 63 d2             	movsxd rdx,edx
  808af5:	0f b7 4c 50 0e       	movzx  ecx,WORD PTR [rax+rdx*2+0xe]
  808afa:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808afe:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  808b01:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808b04:	8d 50 01             	lea    edx,[rax+0x1]
  808b07:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  808b0a:	48 98                	cdqe   
  808b0c:	48 01 f0             	add    rax,rsi
  808b0f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b12:	66 98                	cbw    
  808b14:	66 39 c1             	cmp    cx,ax
  808b17:	0f 85 38 04 00 00    	jne    808f55 <FAT32_lookup+0x6b9>
  808b1d:	eb 01                	jmp    808b20 <FAT32_lookup+0x284>
					continue;
  808b1f:	90                   	nop
			for(x=0;x<6;x++)
  808b20:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808b24:	83 7d f0 05          	cmp    DWORD PTR [rbp-0x10],0x5
  808b28:	7e 90                	jle    808aba <FAT32_lookup+0x21e>
					goto continue_cmp_fail;
			}
			for(x=0;x<2;x++)
  808b2a:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808b31:	eb 72                	jmp    808ba5 <FAT32_lookup+0x309>
			{
				if(j>dest_dentry->name_length && tmpldentry->LDIR_Name3[x] == 0xffff)
  808b33:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808b37:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808b3a:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808b3d:	7e 19                	jle    808b58 <FAT32_lookup+0x2bc>
  808b3f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808b43:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808b46:	48 63 d2             	movsxd rdx,edx
  808b49:	48 83 c2 08          	add    rdx,0x8
  808b4d:	0f b7 44 50 0c       	movzx  eax,WORD PTR [rax+rdx*2+0xc]
  808b52:	66 83 f8 ff          	cmp    ax,0xffff
  808b56:	74 48                	je     808ba0 <FAT32_lookup+0x304>
					continue;
				else if(j>dest_dentry->name_length || tmpldentry->LDIR_Name3[x] != (unsigned short)(dest_dentry->name[j++]))
  808b58:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808b5c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808b5f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808b62:	0f 8f f0 03 00 00    	jg     808f58 <FAT32_lookup+0x6bc>
  808b68:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808b6c:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
  808b6f:	48 63 d2             	movsxd rdx,edx
  808b72:	48 83 c2 08          	add    rdx,0x8
  808b76:	0f b7 4c 50 0c       	movzx  ecx,WORD PTR [rax+rdx*2+0xc]
  808b7b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808b7f:	48 8b 30             	mov    rsi,QWORD PTR [rax]
  808b82:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808b85:	8d 50 01             	lea    edx,[rax+0x1]
  808b88:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  808b8b:	48 98                	cdqe   
  808b8d:	48 01 f0             	add    rax,rsi
  808b90:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808b93:	66 98                	cbw    
  808b95:	66 39 c1             	cmp    cx,ax
  808b98:	0f 85 ba 03 00 00    	jne    808f58 <FAT32_lookup+0x6bc>
  808b9e:	eb 01                	jmp    808ba1 <FAT32_lookup+0x305>
					continue;
  808ba0:	90                   	nop
			for(x=0;x<2;x++)
  808ba1:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808ba5:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
  808ba9:	7e 88                	jle    808b33 <FAT32_lookup+0x297>
					goto continue_cmp_fail;
			}

			if(j >= dest_dentry->name_length)
  808bab:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808baf:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808bb2:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808bb5:	0f 8d 14 04 00 00    	jge    808fcf <FAT32_lookup+0x733>
			{
				goto find_lookup_success;
			}

			tmpldentry --;
  808bbb:	48 83 6d e0 20       	sub    QWORD PTR [rbp-0x20],0x20
		while(tmpldentry->LDIR_Attr == ATTR_LONG_NAME && tmpldentry->LDIR_Ord != 0xe5)
  808bc0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808bc4:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808bc8:	3c 0f                	cmp    al,0xf
  808bca:	75 0f                	jne    808bdb <FAT32_lookup+0x33f>
  808bcc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  808bd0:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808bd3:	3c e5                	cmp    al,0xe5
  808bd5:	0f 85 5d fe ff ff    	jne    808a38 <FAT32_lookup+0x19c>
		}

		//short file/dir base name compare
		j = 0;
  808bdb:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
		for(x=0;x<8;x++)
  808be2:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
  808be9:	e9 f4 01 00 00       	jmp    808de2 <FAT32_lookup+0x546>
		{
			switch(tmpdentry->DIR_Name[x])
  808bee:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808bf2:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808bf5:	48 98                	cdqe   
  808bf7:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808bfb:	0f b6 c0             	movzx  eax,al
  808bfe:	83 f8 7a             	cmp    eax,0x7a
  808c01:	0f 8f d0 01 00 00    	jg     808dd7 <FAT32_lookup+0x53b>
  808c07:	83 f8 61             	cmp    eax,0x61
  808c0a:	0f 8d e6 00 00 00    	jge    808cf6 <FAT32_lookup+0x45a>
  808c10:	83 f8 5a             	cmp    eax,0x5a
  808c13:	0f 8f be 01 00 00    	jg     808dd7 <FAT32_lookup+0x53b>
  808c19:	83 f8 41             	cmp    eax,0x41
  808c1c:	0f 8d d4 00 00 00    	jge    808cf6 <FAT32_lookup+0x45a>
  808c22:	83 f8 20             	cmp    eax,0x20
  808c25:	74 1a                	je     808c41 <FAT32_lookup+0x3a5>
  808c27:	83 f8 20             	cmp    eax,0x20
  808c2a:	0f 8c a7 01 00 00    	jl     808dd7 <FAT32_lookup+0x53b>
  808c30:	83 e8 30             	sub    eax,0x30
  808c33:	83 f8 09             	cmp    eax,0x9
  808c36:	0f 87 9b 01 00 00    	ja     808dd7 <FAT32_lookup+0x53b>
  808c3c:	e9 53 01 00 00       	jmp    808d94 <FAT32_lookup+0x4f8>
			{
				case ' ':
					if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  808c41:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808c45:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808c49:	0f b6 c0             	movzx  eax,al
  808c4c:	83 e0 10             	and    eax,0x10
  808c4f:	85 c0                	test   eax,eax
  808c51:	75 50                	jne    808ca3 <FAT32_lookup+0x407>
					{
						if(dest_dentry->name[j]=='.')
  808c53:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808c57:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  808c5a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808c5d:	48 98                	cdqe   
  808c5f:	48 01 d0             	add    rax,rdx
  808c62:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c65:	3c 2e                	cmp    al,0x2e
  808c67:	0f 84 70 01 00 00    	je     808ddd <FAT32_lookup+0x541>
							continue;
						else if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808c6d:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808c71:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808c74:	48 98                	cdqe   
  808c76:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808c7a:	0f b6 d0             	movzx  edx,al
  808c7d:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808c81:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808c84:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808c87:	48 98                	cdqe   
  808c89:	48 01 c8             	add    rax,rcx
  808c8c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808c8f:	0f be c0             	movsx  eax,al
  808c92:	39 c2                	cmp    edx,eax
  808c94:	0f 85 c1 02 00 00    	jne    808f5b <FAT32_lookup+0x6bf>
						{
							j++;
  808c9a:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808c9e:	e9 3b 01 00 00       	jmp    808dde <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808ca3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808ca7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808caa:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808cad:	7d 32                	jge    808ce1 <FAT32_lookup+0x445>
  808caf:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808cb3:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808cb6:	48 98                	cdqe   
  808cb8:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808cbc:	0f b6 d0             	movzx  edx,al
  808cbf:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808cc3:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808cc6:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808cc9:	48 98                	cdqe   
  808ccb:	48 01 c8             	add    rax,rcx
  808cce:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808cd1:	0f be c0             	movsx  eax,al
  808cd4:	39 c2                	cmp    edx,eax
  808cd6:	75 09                	jne    808ce1 <FAT32_lookup+0x445>
						{
							j++;
  808cd8:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808cdc:	e9 fd 00 00 00       	jmp    808dde <FAT32_lookup+0x542>
						}
						else if(j == dest_dentry->name_length)
  808ce1:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808ce5:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808ce8:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808ceb:	0f 85 6d 02 00 00    	jne    808f5e <FAT32_lookup+0x6c2>
							continue;
  808cf1:	e9 e8 00 00 00       	jmp    808dde <FAT32_lookup+0x542>
							goto continue_cmp_fail;
					}

				case 'A' ... 'Z':
				case 'a' ... 'z':
					if(tmpdentry->DIR_NTRes & LOWERCASE_BASE)
  808cf6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808cfa:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  808cfe:	0f b6 c0             	movzx  eax,al
  808d01:	83 e0 08             	and    eax,0x8
  808d04:	85 c0                	test   eax,eax
  808d06:	74 49                	je     808d51 <FAT32_lookup+0x4b5>
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  808d08:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808d0c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808d0f:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808d12:	0f 8d 49 02 00 00    	jge    808f61 <FAT32_lookup+0x6c5>
  808d18:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808d1c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808d1f:	48 98                	cdqe   
  808d21:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808d25:	0f b6 c0             	movzx  eax,al
  808d28:	8d 50 20             	lea    edx,[rax+0x20]
  808d2b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808d2f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808d32:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808d35:	48 98                	cdqe   
  808d37:	48 01 c8             	add    rax,rcx
  808d3a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d3d:	0f be c0             	movsx  eax,al
  808d40:	39 c2                	cmp    edx,eax
  808d42:	0f 85 19 02 00 00    	jne    808f61 <FAT32_lookup+0x6c5>
						{
							j++;
  808d48:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808d4c:	e9 8d 00 00 00       	jmp    808dde <FAT32_lookup+0x542>
						}
						else
							goto continue_cmp_fail;
					else
					{
						if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808d51:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808d55:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808d58:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808d5b:	0f 8d 03 02 00 00    	jge    808f64 <FAT32_lookup+0x6c8>
  808d61:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808d65:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808d68:	48 98                	cdqe   
  808d6a:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808d6e:	0f b6 d0             	movzx  edx,al
  808d71:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808d75:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808d78:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808d7b:	48 98                	cdqe   
  808d7d:	48 01 c8             	add    rax,rcx
  808d80:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808d83:	0f be c0             	movsx  eax,al
  808d86:	39 c2                	cmp    edx,eax
  808d88:	0f 85 d6 01 00 00    	jne    808f64 <FAT32_lookup+0x6c8>
						{
							j++;
  808d8e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808d92:	eb 4a                	jmp    808dde <FAT32_lookup+0x542>
						else
							goto continue_cmp_fail;
					}

				case '0' ... '9':
					if(j < dest_dentry->name_length && tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808d94:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808d98:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  808d9b:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
  808d9e:	0f 8d c3 01 00 00    	jge    808f67 <FAT32_lookup+0x6cb>
  808da4:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808da8:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808dab:	48 98                	cdqe   
  808dad:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808db1:	0f b6 d0             	movzx  edx,al
  808db4:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808db8:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808dbb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808dbe:	48 98                	cdqe   
  808dc0:	48 01 c8             	add    rax,rcx
  808dc3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808dc6:	0f be c0             	movsx  eax,al
  808dc9:	39 c2                	cmp    edx,eax
  808dcb:	0f 85 96 01 00 00    	jne    808f67 <FAT32_lookup+0x6cb>
					{
						j++;
  808dd1:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
						break;
  808dd5:	eb 07                	jmp    808dde <FAT32_lookup+0x542>
					}
					else
						goto continue_cmp_fail;

				default :
					j++;
  808dd7:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
					break;
  808ddb:	eb 01                	jmp    808dde <FAT32_lookup+0x542>
							continue;
  808ddd:	90                   	nop
		for(x=0;x<8;x++)
  808dde:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808de2:	83 7d f0 07          	cmp    DWORD PTR [rbp-0x10],0x7
  808de6:	0f 8e 02 fe ff ff    	jle    808bee <FAT32_lookup+0x352>
			}
		}
		//short file ext name compare
		if(!(tmpdentry->DIR_Attr & ATTR_DIRECTORY))
  808dec:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808df0:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  808df4:	0f b6 c0             	movzx  eax,al
  808df7:	83 e0 10             	and    eax,0x10
  808dfa:	85 c0                	test   eax,eax
  808dfc:	0f 85 d0 01 00 00    	jne    808fd2 <FAT32_lookup+0x736>
		{
			j++;
  808e02:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
			for(x=8;x<11;x++)
  808e06:	c7 45 f0 08 00 00 00 	mov    DWORD PTR [rbp-0x10],0x8
  808e0d:	e9 2b 01 00 00       	jmp    808f3d <FAT32_lookup+0x6a1>
			{
				switch(tmpdentry->DIR_Name[x])
  808e12:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808e16:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808e19:	48 98                	cdqe   
  808e1b:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808e1f:	0f b6 c0             	movzx  eax,al
  808e22:	83 f8 7a             	cmp    eax,0x7a
  808e25:	0f 8f 3f 01 00 00    	jg     808f6a <FAT32_lookup+0x6ce>
  808e2b:	83 f8 61             	cmp    eax,0x61
  808e2e:	7d 2e                	jge    808e5e <FAT32_lookup+0x5c2>
  808e30:	83 f8 5a             	cmp    eax,0x5a
  808e33:	0f 8f 31 01 00 00    	jg     808f6a <FAT32_lookup+0x6ce>
  808e39:	83 f8 41             	cmp    eax,0x41
  808e3c:	7d 20                	jge    808e5e <FAT32_lookup+0x5c2>
  808e3e:	83 f8 20             	cmp    eax,0x20
  808e41:	0f 84 c4 00 00 00    	je     808f0b <FAT32_lookup+0x66f>
  808e47:	83 f8 20             	cmp    eax,0x20
  808e4a:	0f 8c 1a 01 00 00    	jl     808f6a <FAT32_lookup+0x6ce>
  808e50:	83 e8 30             	sub    eax,0x30
  808e53:	83 f8 09             	cmp    eax,0x9
  808e56:	0f 87 0e 01 00 00    	ja     808f6a <FAT32_lookup+0x6ce>
  808e5c:	eb 7e                	jmp    808edc <FAT32_lookup+0x640>
				{
					case 'A' ... 'Z':
					case 'a' ... 'z':
						if(tmpdentry->DIR_NTRes & LOWERCASE_EXT)
  808e5e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  808e62:	0f b6 40 0c          	movzx  eax,BYTE PTR [rax+0xc]
  808e66:	0f b6 c0             	movzx  eax,al
  808e69:	83 e0 10             	and    eax,0x10
  808e6c:	85 c0                	test   eax,eax
  808e6e:	74 39                	je     808ea9 <FAT32_lookup+0x60d>
							if(tmpdentry->DIR_Name[x] + 32 == dest_dentry->name[j])
  808e70:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808e74:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808e77:	48 98                	cdqe   
  808e79:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808e7d:	0f b6 c0             	movzx  eax,al
  808e80:	8d 50 20             	lea    edx,[rax+0x20]
  808e83:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808e87:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808e8a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808e8d:	48 98                	cdqe   
  808e8f:	48 01 c8             	add    rax,rcx
  808e92:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808e95:	0f be c0             	movsx  eax,al
  808e98:	39 c2                	cmp    edx,eax
  808e9a:	0f 85 cd 00 00 00    	jne    808f6d <FAT32_lookup+0x6d1>
							{
								j++;
  808ea0:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  808ea4:	e9 90 00 00 00       	jmp    808f39 <FAT32_lookup+0x69d>
							}
							else
								goto continue_cmp_fail;
						else
						{
							if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808ea9:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808ead:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808eb0:	48 98                	cdqe   
  808eb2:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808eb6:	0f b6 d0             	movzx  edx,al
  808eb9:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808ebd:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808ec0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808ec3:	48 98                	cdqe   
  808ec5:	48 01 c8             	add    rax,rcx
  808ec8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808ecb:	0f be c0             	movsx  eax,al
  808ece:	39 c2                	cmp    edx,eax
  808ed0:	0f 85 9a 00 00 00    	jne    808f70 <FAT32_lookup+0x6d4>
							{
								j++;
  808ed6:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
								break;
  808eda:	eb 5d                	jmp    808f39 <FAT32_lookup+0x69d>
							else
								goto continue_cmp_fail;
						}

					case '0' ... '9':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808edc:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808ee0:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808ee3:	48 98                	cdqe   
  808ee5:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808ee9:	0f b6 d0             	movzx  edx,al
  808eec:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808ef0:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808ef3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808ef6:	48 98                	cdqe   
  808ef8:	48 01 c8             	add    rax,rcx
  808efb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808efe:	0f be c0             	movsx  eax,al
  808f01:	39 c2                	cmp    edx,eax
  808f03:	75 6e                	jne    808f73 <FAT32_lookup+0x6d7>
						{
							j++;
  808f05:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808f09:	eb 2e                	jmp    808f39 <FAT32_lookup+0x69d>
						}
						else
							goto continue_cmp_fail;

					case ' ':
						if(tmpdentry->DIR_Name[x] == dest_dentry->name[j])
  808f0b:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
  808f0f:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  808f12:	48 98                	cdqe   
  808f14:	0f b6 04 02          	movzx  eax,BYTE PTR [rdx+rax*1]
  808f18:	0f b6 d0             	movzx  edx,al
  808f1b:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  808f1f:	48 8b 08             	mov    rcx,QWORD PTR [rax]
  808f22:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  808f25:	48 98                	cdqe   
  808f27:	48 01 c8             	add    rax,rcx
  808f2a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  808f2d:	0f be c0             	movsx  eax,al
  808f30:	39 c2                	cmp    edx,eax
  808f32:	75 42                	jne    808f76 <FAT32_lookup+0x6da>
						{
							j++;
  808f34:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
							break;
  808f38:	90                   	nop
			for(x=8;x<11;x++)
  808f39:	83 45 f0 01          	add    DWORD PTR [rbp-0x10],0x1
  808f3d:	83 7d f0 0a          	cmp    DWORD PTR [rbp-0x10],0xa
  808f41:	0f 8e cb fe ff ff    	jle    808e12 <FAT32_lookup+0x576>
					default :
						goto continue_cmp_fail;
				}
			}
		}
		goto find_lookup_success;
  808f47:	e9 86 00 00 00       	jmp    808fd2 <FAT32_lookup+0x736>
			continue;
  808f4c:	90                   	nop
  808f4d:	eb 28                	jmp    808f77 <FAT32_lookup+0x6db>
			continue;
  808f4f:	90                   	nop
  808f50:	eb 25                	jmp    808f77 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  808f52:	90                   	nop
  808f53:	eb 22                	jmp    808f77 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  808f55:	90                   	nop
  808f56:	eb 1f                	jmp    808f77 <FAT32_lookup+0x6db>
					goto continue_cmp_fail;
  808f58:	90                   	nop
  808f59:	eb 1c                	jmp    808f77 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  808f5b:	90                   	nop
  808f5c:	eb 19                	jmp    808f77 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  808f5e:	90                   	nop
  808f5f:	eb 16                	jmp    808f77 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  808f61:	90                   	nop
  808f62:	eb 13                	jmp    808f77 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  808f64:	90                   	nop
  808f65:	eb 10                	jmp    808f77 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  808f67:	90                   	nop
  808f68:	eb 0d                	jmp    808f77 <FAT32_lookup+0x6db>
						goto continue_cmp_fail;
  808f6a:	90                   	nop
  808f6b:	eb 0a                	jmp    808f77 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  808f6d:	90                   	nop
  808f6e:	eb 07                	jmp    808f77 <FAT32_lookup+0x6db>
								goto continue_cmp_fail;
  808f70:	90                   	nop
  808f71:	eb 04                	jmp    808f77 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  808f73:	90                   	nop
  808f74:	eb 01                	jmp    808f77 <FAT32_lookup+0x6db>
							goto continue_cmp_fail;
  808f76:	90                   	nop
	for(i = 0;i < fsbi->bytes_per_cluster;i+= 32,tmpdentry++)
  808f77:	83 45 f8 20          	add    DWORD PTR [rbp-0x8],0x20
  808f7b:	48 83 45 e8 20       	add    QWORD PTR [rbp-0x18],0x20
  808f80:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  808f83:	48 63 d0             	movsxd rdx,eax
  808f86:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808f8a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  808f8e:	48 39 c2             	cmp    rdx,rax
  808f91:	0f 8c 4c fa ff ff    	jl     8089e3 <FAT32_lookup+0x147>

continue_cmp_fail:;
	}
	
	cluster = DISK1_FAT32_read_FAT_Entry(fsbi,cluster);
  808f97:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  808f9a:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  808f9e:	89 d6                	mov    esi,edx
  808fa0:	48 89 c7             	mov    rdi,rax
  808fa3:	e8 2d e7 ff ff       	call   8076d5 <DISK1_FAT32_read_FAT_Entry>
  808fa8:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
	if(cluster < 0x0ffffff7)
  808fab:	81 7d fc f6 ff ff 0f 	cmp    DWORD PTR [rbp-0x4],0xffffff6
  808fb2:	77 05                	ja     808fb9 <FAT32_lookup+0x71d>
		goto next_cluster;
  808fb4:	e9 7f f9 ff ff       	jmp    808938 <FAT32_lookup+0x9c>

	vmfree(buf);
  808fb9:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  808fbd:	48 89 c7             	mov    rdi,rax
  808fc0:	e8 c5 81 ff ff       	call   80118a <vmfree>
	return NULL;
  808fc5:	b8 00 00 00 00       	mov    eax,0x0
  808fca:	e9 f0 01 00 00       	jmp    8091bf <FAT32_lookup+0x923>
				goto find_lookup_success;
  808fcf:	90                   	nop
  808fd0:	eb 01                	jmp    808fd3 <FAT32_lookup+0x737>
		goto find_lookup_success;
  808fd2:	90                   	nop

find_lookup_success:
	p = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  808fd3:	be 00 00 00 00       	mov    esi,0x0
  808fd8:	bf 38 00 00 00       	mov    edi,0x38
  808fdd:	b8 00 00 00 00       	mov    eax,0x0
  808fe2:	e8 14 81 ff ff       	call   8010fb <vmalloc>
  808fe7:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
	memset(p,0,sizeof(struct index_node));
  808feb:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  808fef:	ba 38 00 00 00       	mov    edx,0x38
  808ff4:	be 00 00 00 00       	mov    esi,0x0
  808ff9:	48 89 c7             	mov    rdi,rax
  808ffc:	e8 65 15 00 00       	call   80a566 <memset>
	p->file_size = tmpdentry->DIR_FileSize;
  809001:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809005:	8b 40 1c             	mov    eax,DWORD PTR [rax+0x1c]
  809008:	89 c2                	mov    edx,eax
  80900a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80900e:	48 89 10             	mov    QWORD PTR [rax],rdx
	p->blocks = (p->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  809011:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809015:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809018:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80901c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809020:	48 01 d0             	add    rax,rdx
  809023:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  809027:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80902b:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80902f:	48 89 c1             	mov    rcx,rax
  809032:	48 89 d0             	mov    rax,rdx
  809035:	ba 00 00 00 00       	mov    edx,0x0
  80903a:	48 f7 f1             	div    rcx
  80903d:	48 89 c2             	mov    rdx,rax
  809040:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809044:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	p->attribute = (tmpdentry->DIR_Attr & ATTR_DIRECTORY) ? FS_ATTR_DIR : FS_ATTR_FILE;
  809048:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80904c:	0f b6 40 0b          	movzx  eax,BYTE PTR [rax+0xb]
  809050:	0f b6 c0             	movzx  eax,al
  809053:	83 e0 10             	and    eax,0x10
  809056:	85 c0                	test   eax,eax
  809058:	74 07                	je     809061 <FAT32_lookup+0x7c5>
  80905a:	ba 02 00 00 00       	mov    edx,0x2
  80905f:	eb 05                	jmp    809066 <FAT32_lookup+0x7ca>
  809061:	ba 01 00 00 00       	mov    edx,0x1
  809066:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80906a:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	p->sb = parent_inode->sb;
  80906e:	48 8b 45 a8          	mov    rax,QWORD PTR [rbp-0x58]
  809072:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
  809076:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80907a:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	p->f_ops = &FAT32_file_ops;
  80907e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809082:	48 c7 40 20 80 b0 80 	mov    QWORD PTR [rax+0x20],0x80b080
  809089:	00 
	p->inode_ops = &FAT32_inode_ops;
  80908a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80908e:	48 c7 40 28 c0 b0 80 	mov    QWORD PTR [rax+0x28],0x80b0c0
  809095:	00 

	p->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  809096:	be 00 00 00 00       	mov    esi,0x0
  80909b:	bf 20 00 00 00       	mov    edi,0x20
  8090a0:	b8 00 00 00 00       	mov    eax,0x0
  8090a5:	e8 51 80 ff ff       	call   8010fb <vmalloc>
  8090aa:	48 89 c2             	mov    rdx,rax
  8090ad:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8090b1:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(p->private_index_info,0,sizeof(struct FAT32_inode_info));
  8090b5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8090b9:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8090bd:	ba 20 00 00 00       	mov    edx,0x20
  8090c2:	be 00 00 00 00       	mov    esi,0x0
  8090c7:	48 89 c7             	mov    rdi,rax
  8090ca:	e8 97 14 00 00       	call   80a566 <memset>
	finode = p->private_index_info;
  8090cf:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8090d3:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8090d7:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax

	finode->first_cluster = (tmpdentry->DIR_FstClusHI<< 16 | tmpdentry->DIR_FstClusLO) & 0x0fffffff;
  8090db:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8090df:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  8090e3:	0f b7 c0             	movzx  eax,ax
  8090e6:	c1 e0 10             	shl    eax,0x10
  8090e9:	89 c2                	mov    edx,eax
  8090eb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8090ef:	0f b7 40 1a          	movzx  eax,WORD PTR [rax+0x1a]
  8090f3:	0f b7 c0             	movzx  eax,ax
  8090f6:	09 d0                	or     eax,edx
  8090f8:	48 98                	cdqe   
  8090fa:	25 ff ff ff 0f       	and    eax,0xfffffff
  8090ff:	48 89 c2             	mov    rdx,rax
  809102:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809106:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = cluster;
  809109:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  80910c:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809110:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	finode->dentry_position = tmpdentry - (struct FAT32_Directory *)buf;
  809114:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809118:	48 2b 45 c0          	sub    rax,QWORD PTR [rbp-0x40]
  80911c:	48 c1 f8 05          	sar    rax,0x5
  809120:	48 89 c2             	mov    rdx,rax
  809123:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809127:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	finode->create_date = tmpdentry->DIR_CrtTime;
  80912b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80912f:	0f b7 50 0e          	movzx  edx,WORD PTR [rax+0xe]
  809133:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809137:	66 89 50 18          	mov    WORD PTR [rax+0x18],dx
	finode->create_time = tmpdentry->DIR_CrtDate;
  80913b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80913f:	0f b7 50 10          	movzx  edx,WORD PTR [rax+0x10]
  809143:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809147:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	finode->write_date = tmpdentry->DIR_WrtTime;
  80914b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80914f:	0f b7 50 16          	movzx  edx,WORD PTR [rax+0x16]
  809153:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809157:	66 89 50 1c          	mov    WORD PTR [rax+0x1c],dx
	finode->write_time = tmpdentry->DIR_WrtDate;
  80915b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80915f:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
  809163:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809167:	66 89 50 1e          	mov    WORD PTR [rax+0x1e],dx

	if((tmpdentry->DIR_FstClusHI >> 12) && (p->attribute & FS_ATTR_FILE))
  80916b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80916f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  809173:	66 c1 e8 0c          	shr    ax,0xc
  809177:	66 85 c0             	test   ax,ax
  80917a:	74 27                	je     8091a3 <FAT32_lookup+0x907>
  80917c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809180:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809184:	83 e0 01             	and    eax,0x1
  809187:	48 85 c0             	test   rax,rax
  80918a:	74 17                	je     8091a3 <FAT32_lookup+0x907>
	{
		p->attribute |= FS_ATTR_DEVICE;
  80918c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809190:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809194:	48 83 c8 04          	or     rax,0x4
  809198:	48 89 c2             	mov    rdx,rax
  80919b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  80919f:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	}

	dest_dentry->dir_inode = p;
  8091a3:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
  8091a7:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
  8091ab:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	vmfree(buf);
  8091af:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
  8091b3:	48 89 c7             	mov    rdi,rax
  8091b6:	e8 cf 7f ff ff       	call   80118a <vmfree>
	return dest_dentry;	
  8091bb:	48 8b 45 a0          	mov    rax,QWORD PTR [rbp-0x60]
}
  8091bf:	c9                   	leave  
  8091c0:	c3                   	ret    

00000000008091c1 <FAT32_mkdir>:


long FAT32_mkdir(struct index_node * inode,struct dir_entry * dentry,int mode)
{}
  8091c1:	f3 0f 1e fa          	endbr64 
  8091c5:	55                   	push   rbp
  8091c6:	48 89 e5             	mov    rbp,rsp
  8091c9:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8091cd:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8091d1:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
  8091d4:	90                   	nop
  8091d5:	5d                   	pop    rbp
  8091d6:	c3                   	ret    

00000000008091d7 <FAT32_rmdir>:


long FAT32_rmdir(struct index_node * inode,struct dir_entry * dentry)
{}
  8091d7:	f3 0f 1e fa          	endbr64 
  8091db:	55                   	push   rbp
  8091dc:	48 89 e5             	mov    rbp,rsp
  8091df:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8091e3:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8091e7:	90                   	nop
  8091e8:	5d                   	pop    rbp
  8091e9:	c3                   	ret    

00000000008091ea <FAT32_rename>:

long FAT32_rename(struct index_node * old_inode,struct dir_entry * old_dentry,struct index_node * new_inode,struct dir_entry * new_dentry)
{}
  8091ea:	f3 0f 1e fa          	endbr64 
  8091ee:	55                   	push   rbp
  8091ef:	48 89 e5             	mov    rbp,rsp
  8091f2:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  8091f6:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  8091fa:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  8091fe:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
  809202:	90                   	nop
  809203:	5d                   	pop    rbp
  809204:	c3                   	ret    

0000000000809205 <FAT32_getattr>:

long FAT32_getattr(struct dir_entry * dentry,unsigned long * attr)
{}
  809205:	f3 0f 1e fa          	endbr64 
  809209:	55                   	push   rbp
  80920a:	48 89 e5             	mov    rbp,rsp
  80920d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809211:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809215:	90                   	nop
  809216:	5d                   	pop    rbp
  809217:	c3                   	ret    

0000000000809218 <FAT32_setattr>:

long FAT32_setattr(struct dir_entry * dentry,unsigned long * attr)
{}
  809218:	f3 0f 1e fa          	endbr64 
  80921c:	55                   	push   rbp
  80921d:	48 89 e5             	mov    rbp,rsp
  809220:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809224:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809228:	90                   	nop
  809229:	5d                   	pop    rbp
  80922a:	c3                   	ret    

000000000080922b <FAT32_compare>:
	.setattr = FAT32_setattr,
};


//// these operation need cache and list
long FAT32_compare(struct dir_entry * parent_dentry,char * source_filename,char * destination_filename){}
  80922b:	f3 0f 1e fa          	endbr64 
  80922f:	55                   	push   rbp
  809230:	48 89 e5             	mov    rbp,rsp
  809233:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809237:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  80923b:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80923f:	90                   	nop
  809240:	5d                   	pop    rbp
  809241:	c3                   	ret    

0000000000809242 <FAT32_hash>:
long FAT32_hash(struct dir_entry * dentry,char * filename){}
  809242:	f3 0f 1e fa          	endbr64 
  809246:	55                   	push   rbp
  809247:	48 89 e5             	mov    rbp,rsp
  80924a:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80924e:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809252:	90                   	nop
  809253:	5d                   	pop    rbp
  809254:	c3                   	ret    

0000000000809255 <FAT32_release>:
long FAT32_release(struct dir_entry * dentry){}
  809255:	f3 0f 1e fa          	endbr64 
  809259:	55                   	push   rbp
  80925a:	48 89 e5             	mov    rbp,rsp
  80925d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809261:	90                   	nop
  809262:	5d                   	pop    rbp
  809263:	c3                   	ret    

0000000000809264 <FAT32_iput>:
long FAT32_iput(struct dir_entry * dentry,struct index_node * inode){}
  809264:	f3 0f 1e fa          	endbr64 
  809268:	55                   	push   rbp
  809269:	48 89 e5             	mov    rbp,rsp
  80926c:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809270:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
  809274:	90                   	nop
  809275:	5d                   	pop    rbp
  809276:	c3                   	ret    

0000000000809277 <fat32_write_superblock>:
	.release = FAT32_release,
	.iput = FAT32_iput,
};


void fat32_write_superblock(struct super_block * sb){}
  809277:	f3 0f 1e fa          	endbr64 
  80927b:	55                   	push   rbp
  80927c:	48 89 e5             	mov    rbp,rsp
  80927f:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  809283:	90                   	nop
  809284:	5d                   	pop    rbp
  809285:	c3                   	ret    

0000000000809286 <fat32_put_superblock>:

void fat32_put_superblock(struct super_block * sb)
{
  809286:	f3 0f 1e fa          	endbr64 
  80928a:	55                   	push   rbp
  80928b:	48 89 e5             	mov    rbp,rsp
  80928e:	48 83 ec 10          	sub    rsp,0x10
  809292:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
	vmfree(sb->private_sb_info);
  809296:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80929a:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80929e:	48 89 c7             	mov    rdi,rax
  8092a1:	e8 e4 7e ff ff       	call   80118a <vmfree>
	vmfree(sb->root->dir_inode->private_index_info);
  8092a6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092aa:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8092ad:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8092b1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8092b5:	48 89 c7             	mov    rdi,rax
  8092b8:	e8 cd 7e ff ff       	call   80118a <vmfree>
	vmfree(sb->root->dir_inode);
  8092bd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092c1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8092c4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8092c8:	48 89 c7             	mov    rdi,rax
  8092cb:	e8 ba 7e ff ff       	call   80118a <vmfree>
	vmfree(sb->root);
  8092d0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092d4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8092d7:	48 89 c7             	mov    rdi,rax
  8092da:	e8 ab 7e ff ff       	call   80118a <vmfree>
	vmfree(sb);
  8092df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8092e3:	48 89 c7             	mov    rdi,rax
  8092e6:	e8 9f 7e ff ff       	call   80118a <vmfree>
}
  8092eb:	90                   	nop
  8092ec:	c9                   	leave  
  8092ed:	c3                   	ret    

00000000008092ee <fat32_write_inode>:

void fat32_write_inode(struct index_node * inode)
{
  8092ee:	f3 0f 1e fa          	endbr64 
  8092f2:	55                   	push   rbp
  8092f3:	48 89 e5             	mov    rbp,rsp
  8092f6:	48 83 ec 40          	sub    rsp,0x40
  8092fa:	48 89 7d c8          	mov    QWORD PTR [rbp-0x38],rdi
	struct FAT32_Directory * fdentry = NULL;
  8092fe:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  809305:	00 
	struct FAT32_Directory * buf = NULL;
  809306:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  80930d:	00 
	struct FAT32_inode_info * finode = inode->private_index_info;
  80930e:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809312:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809316:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	struct FAT32_sb_info * fsbi = inode->sb->private_sb_info;
  80931a:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  80931e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809322:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  809326:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	unsigned long sector = 0;
  80932a:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
  809331:	00 

	if(finode->dentry_location == 0)
  809332:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809336:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  80933a:	48 85 c0             	test   rax,rax
  80933d:	75 14                	jne    809353 <fat32_write_inode+0x65>
	{
		printf("FS ERROR:write root inode!\n");	
  80933f:	bf f4 2f 81 00       	mov    edi,0x812ff4
  809344:	b8 00 00 00 00       	mov    eax,0x0
  809349:	e8 95 79 ff ff       	call   800ce3 <printf>
		return ;
  80934e:	e9 30 01 00 00       	jmp    809483 <fat32_write_inode+0x195>
	}

	sector = fsbi->Data_firstsector + (finode->dentry_location - 2) * fsbi->sector_per_cluster;
  809353:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809357:	48 8b 48 28          	mov    rcx,QWORD PTR [rax+0x28]
  80935b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80935f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
  809363:	48 8d 50 fe          	lea    rdx,[rax-0x2]
  809367:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80936b:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80936f:	48 0f af c2          	imul   rax,rdx
  809373:	48 01 c8             	add    rax,rcx
  809376:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
	buf = (struct FAT32_Directory *)vmalloc(fsbi->bytes_per_cluster,0);
  80937a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80937e:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  809382:	be 00 00 00 00       	mov    esi,0x0
  809387:	48 89 c7             	mov    rdi,rax
  80938a:	b8 00 00 00 00       	mov    eax,0x0
  80938f:	e8 67 7d ff ff       	call   8010fb <vmalloc>
  809394:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	memset(buf,0,fsbi->bytes_per_cluster);
  809398:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80939c:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  8093a0:	89 c2                	mov    edx,eax
  8093a2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8093a6:	be 00 00 00 00       	mov    esi,0x0
  8093ab:	48 89 c7             	mov    rdi,rax
  8093ae:	e8 b3 11 00 00       	call   80a566 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  8093b3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8093b7:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8093bb:	89 c1                	mov    ecx,eax
  8093bd:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  8093c1:	89 c2                	mov    edx,eax
  8093c3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8093c7:	49 89 c0             	mov    r8,rax
  8093ca:	be 00 00 00 00       	mov    esi,0x0
  8093cf:	bf 00 00 00 00       	mov    edi,0x0
  8093d4:	e8 69 d6 ff ff       	call   806a42 <request>
  8093d9:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    chk_result(r);
  8093dc:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  8093df:	89 c7                	mov    edi,eax
  8093e1:	e8 10 dd ff ff       	call   8070f6 <chk_result>
    fdentry = buf+finode->dentry_position;
  8093e6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8093ea:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  8093ee:	48 c1 e0 05          	shl    rax,0x5
  8093f2:	48 89 c2             	mov    rdx,rax
  8093f5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  8093f9:	48 01 d0             	add    rax,rdx
  8093fc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax

	////alert fat32 dentry data
	fdentry->DIR_FileSize = inode->file_size;
  809400:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809404:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809407:	89 c2                	mov    edx,eax
  809409:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80940d:	89 50 1c             	mov    DWORD PTR [rax+0x1c],edx
	fdentry->DIR_FstClusLO = finode->first_cluster & 0xffff;
  809410:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809414:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809417:	89 c2                	mov    edx,eax
  809419:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80941d:	66 89 50 1a          	mov    WORD PTR [rax+0x1a],dx
	fdentry->DIR_FstClusHI = (fdentry->DIR_FstClusHI & 0xf000) | (finode->first_cluster >> 16);
  809421:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809425:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
  809429:	66 25 00 f0          	and    ax,0xf000
  80942d:	89 c2                	mov    edx,eax
  80942f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809433:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809436:	48 c1 e8 10          	shr    rax,0x10
  80943a:	09 c2                	or     edx,eax
  80943c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809440:	66 89 50 14          	mov    WORD PTR [rax+0x14],dx

	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_WRITE,sector,fsbi->sector_per_cluster,(unsigned char *)buf);
  809444:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809448:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80944c:	89 c1                	mov    ecx,eax
  80944e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  809452:	89 c2                	mov    edx,eax
  809454:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809458:	49 89 c0             	mov    r8,rax
  80945b:	be 01 00 00 00       	mov    esi,0x1
  809460:	bf 00 00 00 00       	mov    edi,0x0
  809465:	e8 d8 d5 ff ff       	call   806a42 <request>
  80946a:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
    chk_result(r1);
  80946d:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
  809470:	89 c7                	mov    edi,eax
  809472:	e8 7f dc ff ff       	call   8070f6 <chk_result>
	vmfree(buf);
  809477:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80947b:	48 89 c7             	mov    rdi,rax
  80947e:	e8 07 7d ff ff       	call   80118a <vmfree>
}
  809483:	c9                   	leave  
  809484:	c3                   	ret    

0000000000809485 <fat32_read_superblock>:

	.write_inode = fat32_write_inode,
};

struct super_block * fat32_read_superblock(struct Disk_Partition_Table_Entry * DPTE,void * buf)
{
  809485:	f3 0f 1e fa          	endbr64 
  809489:	55                   	push   rbp
  80948a:	48 89 e5             	mov    rbp,rsp
  80948d:	48 83 ec 50          	sub    rsp,0x50
  809491:	48 89 7d b8          	mov    QWORD PTR [rbp-0x48],rdi
  809495:	48 89 75 b0          	mov    QWORD PTR [rbp-0x50],rsi
	struct super_block * sbp = NULL;
  809499:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8094a0:	00 
	struct FAT32_inode_info * finode = NULL;
  8094a1:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
  8094a8:	00 
	struct FAT32_BootSector * fbs = NULL;
  8094a9:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
  8094b0:	00 
	struct FAT32_sb_info * fsbi = NULL;
  8094b1:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
  8094b8:	00 

	////super block
	sbp = (struct super_block *)vmalloc(sizeof(struct super_block),0);
  8094b9:	be 00 00 00 00       	mov    esi,0x0
  8094be:	bf 18 00 00 00       	mov    edi,0x18
  8094c3:	b8 00 00 00 00       	mov    eax,0x0
  8094c8:	e8 2e 7c ff ff       	call   8010fb <vmalloc>
  8094cd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
	memset(sbp,0,sizeof(struct super_block));
  8094d1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094d5:	ba 18 00 00 00       	mov    edx,0x18
  8094da:	be 00 00 00 00       	mov    esi,0x0
  8094df:	48 89 c7             	mov    rdi,rax
  8094e2:	e8 7f 10 00 00       	call   80a566 <memset>

	sbp->sb_ops = &FAT32_sb_ops;
  8094e7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8094eb:	48 c7 40 08 20 b1 80 	mov    QWORD PTR [rax+0x8],0x80b120
  8094f2:	00 
	sbp->private_sb_info = (struct FAT32_sb_info *)vmalloc(sizeof(struct FAT32_sb_info),0);
  8094f3:	be 00 00 00 00       	mov    esi,0x0
  8094f8:	bf 60 00 00 00       	mov    edi,0x60
  8094fd:	b8 00 00 00 00       	mov    eax,0x0
  809502:	e8 f4 7b ff ff       	call   8010fb <vmalloc>
  809507:	48 89 c2             	mov    rdx,rax
  80950a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80950e:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	memset(sbp->private_sb_info,0,sizeof(struct FAT32_sb_info));
  809512:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809516:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80951a:	ba 60 00 00 00       	mov    edx,0x60
  80951f:	be 00 00 00 00       	mov    esi,0x0
  809524:	48 89 c7             	mov    rdi,rax
  809527:	e8 3a 10 00 00       	call   80a566 <memset>

	////fat32 boot sector
	fbs = (struct FAT32_BootSector *)buf;
  80952c:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
  809530:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
	fsbi = sbp->private_sb_info;	
  809534:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809538:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
  80953c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
	fsbi->start_sector = DPTE->start_LBA;
  809540:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809544:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  809547:	89 c2                	mov    edx,eax
  809549:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80954d:	48 89 10             	mov    QWORD PTR [rax],rdx
	fsbi->sector_count = DPTE->sectors_limit;
  809550:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  809554:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
  809557:	89 c2                	mov    edx,eax
  809559:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80955d:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
	fsbi->sector_per_cluster = fbs->BPB_SecPerClus;
  809561:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809565:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  809569:	0f b6 d0             	movzx  edx,al
  80956c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809570:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
	fsbi->bytes_per_cluster = fbs->BPB_SecPerClus * fbs->BPB_BytesPerSec;
  809574:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809578:	0f b6 40 0d          	movzx  eax,BYTE PTR [rax+0xd]
  80957c:	0f b6 d0             	movzx  edx,al
  80957f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809583:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  809587:	0f b7 c0             	movzx  eax,ax
  80958a:	0f af c2             	imul   eax,edx
  80958d:	48 63 d0             	movsxd rdx,eax
  809590:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809594:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
	fsbi->bytes_per_sector = fbs->BPB_BytesPerSec;
  809598:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80959c:	0f b7 40 0b          	movzx  eax,WORD PTR [rax+0xb]
  8095a0:	0f b7 d0             	movzx  edx,ax
  8095a3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8095a7:	48 89 50 20          	mov    QWORD PTR [rax+0x20],rdx
	fsbi->Data_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt + fbs->BPB_FATSz32 * fbs->BPB_NumFATs;
  8095ab:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8095af:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  8095b2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095b6:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  8095ba:	0f b7 c0             	movzx  eax,ax
  8095bd:	8d 0c 02             	lea    ecx,[rdx+rax*1]
  8095c0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095c4:	8b 50 24             	mov    edx,DWORD PTR [rax+0x24]
  8095c7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095cb:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  8095cf:	0f b6 c0             	movzx  eax,al
  8095d2:	0f af c2             	imul   eax,edx
  8095d5:	01 c8                	add    eax,ecx
  8095d7:	89 c2                	mov    edx,eax
  8095d9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8095dd:	48 89 50 28          	mov    QWORD PTR [rax+0x28],rdx
	fsbi->FAT1_firstsector = DPTE->start_LBA + fbs->BPB_RsvdSecCnt;
  8095e1:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8095e5:	8b 50 08             	mov    edx,DWORD PTR [rax+0x8]
  8095e8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8095ec:	0f b7 40 0e          	movzx  eax,WORD PTR [rax+0xe]
  8095f0:	0f b7 c0             	movzx  eax,ax
  8095f3:	01 d0                	add    eax,edx
  8095f5:	89 c2                	mov    edx,eax
  8095f7:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8095fb:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	fsbi->sector_per_FAT = fbs->BPB_FATSz32;
  8095ff:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809603:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
  809606:	89 c2                	mov    edx,eax
  809608:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80960c:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	fsbi->NumFATs = fbs->BPB_NumFATs;
  809610:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809614:	0f b6 40 10          	movzx  eax,BYTE PTR [rax+0x10]
  809618:	0f b6 d0             	movzx  edx,al
  80961b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80961f:	48 89 50 40          	mov    QWORD PTR [rax+0x40],rdx
	fsbi->fsinfo_sector_infat = fbs->BPB_FSInfo;
  809623:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809627:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  80962b:	0f b7 d0             	movzx  edx,ax
  80962e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809632:	48 89 50 48          	mov    QWORD PTR [rax+0x48],rdx
	fsbi->bootsector_bk_infat = fbs->BPB_BkBootSec;	
  809636:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80963a:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  80963e:	0f b7 d0             	movzx  edx,ax
  809641:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809645:	48 89 50 50          	mov    QWORD PTR [rax+0x50],rdx
	
	printf("FAT32 Boot Sector\n\tBPB_FSInfo:%#018lx\n\tBPB_BkBootSec:%#018lx\n\tBPB_TotSec32:%#018lx\n",fbs->BPB_FSInfo,fbs->BPB_BkBootSec,fbs->BPB_TotSec32);
  809649:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80964d:	8b 48 20             	mov    ecx,DWORD PTR [rax+0x20]
  809650:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809654:	0f b7 40 32          	movzx  eax,WORD PTR [rax+0x32]
  809658:	0f b7 d0             	movzx  edx,ax
  80965b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80965f:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  809663:	0f b7 c0             	movzx  eax,ax
  809666:	89 c6                	mov    esi,eax
  809668:	bf 10 30 81 00       	mov    edi,0x813010
  80966d:	b8 00 00 00 00       	mov    eax,0x0
  809672:	e8 6c 76 ff ff       	call   800ce3 <printf>
	
	////fat32 fsinfo sector
	fsbi->fat_fsinfo = (struct FAT32_FSInfo *)vmalloc(sizeof(struct FAT32_FSInfo),0);
  809677:	be 00 00 00 00       	mov    esi,0x0
  80967c:	bf 00 02 00 00       	mov    edi,0x200
  809681:	b8 00 00 00 00       	mov    eax,0x0
  809686:	e8 70 7a ff ff       	call   8010fb <vmalloc>
  80968b:	48 89 c2             	mov    rdx,rax
  80968e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809692:	48 89 50 58          	mov    QWORD PTR [rax+0x58],rdx
	memset(fsbi->fat_fsinfo,0,512);
  809696:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80969a:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80969e:	ba 00 02 00 00       	mov    edx,0x200
  8096a3:	be 00 00 00 00       	mov    esi,0x0
  8096a8:	48 89 c7             	mov    rdi,rax
  8096ab:	e8 b6 0e 00 00       	call   80a566 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPTE->start_LBA + fbs->BPB_FSInfo,1,(unsigned char *)fsbi->fat_fsinfo);
  8096b0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8096b4:	48 8b 50 58          	mov    rdx,QWORD PTR [rax+0x58]
  8096b8:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
  8096bc:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
  8096bf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  8096c3:	0f b7 40 30          	movzx  eax,WORD PTR [rax+0x30]
  8096c7:	0f b7 c0             	movzx  eax,ax
  8096ca:	01 c8                	add    eax,ecx
  8096cc:	49 89 d0             	mov    r8,rdx
  8096cf:	b9 01 00 00 00       	mov    ecx,0x1
  8096d4:	89 c2                	mov    edx,eax
  8096d6:	be 00 00 00 00       	mov    esi,0x0
  8096db:	bf 00 00 00 00       	mov    edi,0x0
  8096e0:	e8 5d d3 ff ff       	call   806a42 <request>
  8096e5:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
	
	printf("FAT32 FSInfo\n\tFSI_LeadSig:%#018lx\n\tFSI_StrucSig:%#018lx\n\tFSI_Free_Count:%#018lx\n",fsbi->fat_fsinfo->FSI_LeadSig,fsbi->fat_fsinfo->FSI_StrucSig,fsbi->fat_fsinfo->FSI_Free_Count);
  8096e8:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8096ec:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  8096f0:	8b 88 e8 01 00 00    	mov    ecx,DWORD PTR [rax+0x1e8]
  8096f6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  8096fa:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  8096fe:	8b 90 e4 01 00 00    	mov    edx,DWORD PTR [rax+0x1e4]
  809704:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809708:	48 8b 40 58          	mov    rax,QWORD PTR [rax+0x58]
  80970c:	8b 00                	mov    eax,DWORD PTR [rax]
  80970e:	89 c6                	mov    esi,eax
  809710:	bf 68 30 81 00       	mov    edi,0x813068
  809715:	b8 00 00 00 00       	mov    eax,0x0
  80971a:	e8 c4 75 ff ff       	call   800ce3 <printf>
	
	////directory entry
	sbp->root = (struct dir_entry *)vmalloc(sizeof(struct dir_entry),0);
  80971f:	be 00 00 00 00       	mov    esi,0x0
  809724:	bf 48 00 00 00       	mov    edi,0x48
  809729:	b8 00 00 00 00       	mov    eax,0x0
  80972e:	e8 c8 79 ff ff       	call   8010fb <vmalloc>
  809733:	48 89 c2             	mov    rdx,rax
  809736:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80973a:	48 89 10             	mov    QWORD PTR [rax],rdx
	memset(sbp->root,0,sizeof(struct dir_entry));
  80973d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809741:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809744:	ba 48 00 00 00       	mov    edx,0x48
  809749:	be 00 00 00 00       	mov    esi,0x0
  80974e:	48 89 c7             	mov    rdi,rax
  809751:	e8 10 0e 00 00       	call   80a566 <memset>

	list_init(&sbp->root->child_node);
  809756:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80975a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80975d:	48 83 c0 10          	add    rax,0x10
  809761:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
    list->prev = list;
  809765:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809769:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  80976d:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  809770:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
  809774:	48 8b 55 c8          	mov    rdx,QWORD PTR [rbp-0x38]
  809778:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  80977c:	90                   	nop
	list_init(&sbp->root->subdirs_list);
  80977d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809781:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809784:	48 83 c0 20          	add    rax,0x20
  809788:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
    list->prev = list;
  80978c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  809790:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  809794:	48 89 10             	mov    QWORD PTR [rax],rdx
    list->next = list;
  809797:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
  80979b:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
  80979f:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
}
  8097a3:	90                   	nop
	sbp->root->parent = sbp->root;
  8097a4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097a8:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8097ab:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8097af:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
  8097b2:	48 89 50 38          	mov    QWORD PTR [rax+0x38],rdx
	sbp->root->dir_ops = &FAT32_dentry_ops;
  8097b6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097ba:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8097bd:	48 c7 40 40 00 b1 80 	mov    QWORD PTR [rax+0x40],0x80b100
  8097c4:	00 
	sbp->root->name = (char *)vmalloc(2,0);
  8097c5:	be 00 00 00 00       	mov    esi,0x0
  8097ca:	bf 02 00 00 00       	mov    edi,0x2
  8097cf:	b8 00 00 00 00       	mov    eax,0x0
  8097d4:	e8 22 79 ff ff       	call   8010fb <vmalloc>
  8097d9:	48 89 c2             	mov    rdx,rax
  8097dc:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097e0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8097e3:	48 89 10             	mov    QWORD PTR [rax],rdx
	sbp->root->name[0] = '/';
  8097e6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097ea:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8097ed:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8097f0:	c6 00 2f             	mov    BYTE PTR [rax],0x2f
	sbp->root->name_length = 1;
  8097f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8097f7:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8097fa:	c7 40 08 01 00 00 00 	mov    DWORD PTR [rax+0x8],0x1

	////index node
	sbp->root->dir_inode = (struct index_node *)vmalloc(sizeof(struct index_node),0);
  809801:	be 00 00 00 00       	mov    esi,0x0
  809806:	bf 38 00 00 00       	mov    edi,0x38
  80980b:	b8 00 00 00 00       	mov    eax,0x0
  809810:	e8 e6 78 ff ff       	call   8010fb <vmalloc>
  809815:	48 89 c2             	mov    rdx,rax
  809818:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80981c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80981f:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode,0,sizeof(struct index_node));
  809823:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809827:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80982a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80982e:	ba 38 00 00 00       	mov    edx,0x38
  809833:	be 00 00 00 00       	mov    esi,0x0
  809838:	48 89 c7             	mov    rdi,rax
  80983b:	e8 26 0d 00 00       	call   80a566 <memset>
	sbp->root->dir_inode->inode_ops = &FAT32_inode_ops;
  809840:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809844:	48 8b 00             	mov    rax,QWORD PTR [rax]
  809847:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80984b:	48 c7 40 28 c0 b0 80 	mov    QWORD PTR [rax+0x28],0x80b0c0
  809852:	00 
	sbp->root->dir_inode->f_ops = &FAT32_file_ops;
  809853:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809857:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80985a:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  80985e:	48 c7 40 20 80 b0 80 	mov    QWORD PTR [rax+0x20],0x80b080
  809865:	00 
	sbp->root->dir_inode->file_size = 0;
  809866:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80986a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80986d:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809871:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
	sbp->root->dir_inode->blocks = (sbp->root->dir_inode->file_size + fsbi->bytes_per_cluster - 1)/fsbi->bytes_per_sector;
  809878:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80987c:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80987f:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809883:	48 8b 10             	mov    rdx,QWORD PTR [rax]
  809886:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80988a:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  80988e:	48 01 d0             	add    rax,rdx
  809891:	48 8d 50 ff          	lea    rdx,[rax-0x1]
  809895:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  809899:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  80989d:	48 89 c6             	mov    rsi,rax
  8098a0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8098a4:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098a7:	48 8b 48 30          	mov    rcx,QWORD PTR [rax+0x30]
  8098ab:	48 89 d0             	mov    rax,rdx
  8098ae:	ba 00 00 00 00       	mov    edx,0x0
  8098b3:	48 f7 f6             	div    rsi
  8098b6:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
	sbp->root->dir_inode->attribute = FS_ATTR_DIR;
  8098ba:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8098be:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098c1:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8098c5:	48 c7 40 10 02 00 00 	mov    QWORD PTR [rax+0x10],0x2
  8098cc:	00 
	sbp->root->dir_inode->sb = sbp;
  8098cd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8098d1:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098d4:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  8098d8:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  8098dc:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx

	////fat32 root inode
	sbp->root->dir_inode->private_index_info = (struct FAT32_inode_info *)vmalloc(sizeof(struct FAT32_inode_info),0);
  8098e0:	be 00 00 00 00       	mov    esi,0x0
  8098e5:	bf 20 00 00 00       	mov    edi,0x20
  8098ea:	b8 00 00 00 00       	mov    eax,0x0
  8098ef:	e8 07 78 ff ff       	call   8010fb <vmalloc>
  8098f4:	48 89 c2             	mov    rdx,rax
  8098f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  8098fb:	48 8b 00             	mov    rax,QWORD PTR [rax]
  8098fe:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809902:	48 89 50 30          	mov    QWORD PTR [rax+0x30],rdx
	memset(sbp->root->dir_inode->private_index_info,0,sizeof(struct FAT32_inode_info));
  809906:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80990a:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80990d:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809911:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809915:	ba 20 00 00 00       	mov    edx,0x20
  80991a:	be 00 00 00 00       	mov    esi,0x0
  80991f:	48 89 c7             	mov    rdi,rax
  809922:	e8 3f 0c 00 00       	call   80a566 <memset>
	finode = (struct FAT32_inode_info *)sbp->root->dir_inode->private_index_info;
  809927:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80992b:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80992e:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809932:	48 8b 40 30          	mov    rax,QWORD PTR [rax+0x30]
  809936:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
	finode->first_cluster = fbs->BPB_RootClus;
  80993a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80993e:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
  809941:	89 c2                	mov    edx,eax
  809943:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809947:	48 89 10             	mov    QWORD PTR [rax],rdx
	finode->dentry_location = 0;
  80994a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80994e:	48 c7 40 08 00 00 00 	mov    QWORD PTR [rax+0x8],0x0
  809955:	00 
	finode->dentry_position = 0; 
  809956:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80995a:	48 c7 40 10 00 00 00 	mov    QWORD PTR [rax+0x10],0x0
  809961:	00 
	finode->create_date = 0;
  809962:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809966:	66 c7 40 18 00 00    	mov    WORD PTR [rax+0x18],0x0
	finode->create_time = 0;
  80996c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809970:	66 c7 40 1a 00 00    	mov    WORD PTR [rax+0x1a],0x0
	finode->write_date = 0;
  809976:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80997a:	66 c7 40 1c 00 00    	mov    WORD PTR [rax+0x1c],0x0
	finode->write_time = 0;
  809980:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  809984:	66 c7 40 1e 00 00    	mov    WORD PTR [rax+0x1e],0x0

	return sbp;
  80998a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
}
  80998e:	c9                   	leave  
  80998f:	c3                   	ret    

0000000000809990 <DISK1_FAT32_FS_init>:
	.read_superblock = fat32_read_superblock,
	.next = NULL,
};

void DISK1_FAT32_FS_init()
{
  809990:	f3 0f 1e fa          	endbr64 
  809994:	55                   	push   rbp
  809995:	48 89 e5             	mov    rbp,rsp
  809998:	48 81 ec 10 04 00 00 	sub    rsp,0x410
	int i;
	unsigned char buf[512];
	struct dir_entry * dentry = NULL;
  80999f:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
  8099a6:	00 
	struct Disk_Partition_Table DPT = {0};
  8099a7:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  8099ae:	b8 00 00 00 00       	mov    eax,0x0
  8099b3:	b9 40 00 00 00       	mov    ecx,0x40
  8099b8:	48 89 d7             	mov    rdi,rdx
  8099bb:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax

	register_filesystem(&FAT32_fs_type);
  8099be:	bf 40 b1 80 00       	mov    edi,0x80b140
  8099c3:	e8 c1 ca ff ff       	call   806489 <register_filesystem>
	
	memset(buf,0,512);
  8099c8:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8099cf:	ba 00 02 00 00       	mov    edx,0x200
  8099d4:	be 00 00 00 00       	mov    esi,0x0
  8099d9:	48 89 c7             	mov    rdi,rax
  8099dc:	e8 85 0b 00 00       	call   80a566 <memset>
	int r=request(DISK_MAJOR_MAJOR,DISKREQ_READ,0x0,1,(unsigned char *)buf);
  8099e1:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  8099e8:	49 89 c0             	mov    r8,rax
  8099eb:	b9 01 00 00 00       	mov    ecx,0x1
  8099f0:	ba 00 00 00 00       	mov    edx,0x0
  8099f5:	be 00 00 00 00       	mov    esi,0x0
  8099fa:	bf 00 00 00 00       	mov    edi,0x0
  8099ff:	e8 3e d0 ff ff       	call   806a42 <request>
  809a04:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
    chk_result(r);
  809a07:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  809a0a:	89 c7                	mov    edi,eax
  809a0c:	e8 e5 d6 ff ff       	call   8070f6 <chk_result>
    DPT = *(struct Disk_Partition_Table *)buf;
  809a11:	48 8d 95 f0 fd ff ff 	lea    rdx,[rbp-0x210]
  809a18:	48 8d 85 f0 fb ff ff 	lea    rax,[rbp-0x410]
  809a1f:	48 89 d6             	mov    rsi,rdx
  809a22:	ba 40 00 00 00       	mov    edx,0x40
  809a27:	48 89 c7             	mov    rdi,rax
  809a2a:	48 89 d1             	mov    rcx,rdx
  809a2d:	f3 48 a5             	rep movs QWORD PTR es:[rdi],QWORD PTR ds:[rsi]
	printf("DPTE[0] start_LBA:%#018lx\ttype:%#018lx\n",DPT.DPTE[0].start_LBA,DPT.DPTE[0].type);
  809a30:	0f b6 85 b2 fd ff ff 	movzx  eax,BYTE PTR [rbp-0x24e]
  809a37:	0f b6 d0             	movzx  edx,al
  809a3a:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  809a40:	89 c6                	mov    esi,eax
  809a42:	bf c0 30 81 00       	mov    edi,0x8130c0
  809a47:	b8 00 00 00 00       	mov    eax,0x0
  809a4c:	e8 92 72 ff ff       	call   800ce3 <printf>

	memset(buf,0,512);
  809a51:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809a58:	ba 00 02 00 00       	mov    edx,0x200
  809a5d:	be 00 00 00 00       	mov    esi,0x0
  809a62:	48 89 c7             	mov    rdi,rax
  809a65:	e8 fc 0a 00 00       	call   80a566 <memset>
	int r1=request(DISK_MAJOR_MAJOR,DISKREQ_READ,DPT.DPTE[0].start_LBA,1,(unsigned char *)buf);
  809a6a:	8b 85 b6 fd ff ff    	mov    eax,DWORD PTR [rbp-0x24a]
  809a70:	89 c2                	mov    edx,eax
  809a72:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809a79:	49 89 c0             	mov    r8,rax
  809a7c:	b9 01 00 00 00       	mov    ecx,0x1
  809a81:	be 00 00 00 00       	mov    esi,0x0
  809a86:	bf 00 00 00 00       	mov    edi,0x0
  809a8b:	e8 b2 cf ff ff       	call   806a42 <request>
  809a90:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    chk_result(r1);
  809a93:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  809a96:	89 c7                	mov    edi,eax
  809a98:	e8 59 d6 ff ff       	call   8070f6 <chk_result>

	root_sb = mount_fs("FAT32",&DPT.DPTE[0],buf);	//not dev node
  809a9d:	48 8d 85 f0 fd ff ff 	lea    rax,[rbp-0x210]
  809aa4:	48 8d 95 f0 fb ff ff 	lea    rdx,[rbp-0x410]
  809aab:	48 8d 8a be 01 00 00 	lea    rcx,[rdx+0x1be]
  809ab2:	48 89 c2             	mov    rdx,rax
  809ab5:	48 89 ce             	mov    rsi,rcx
  809ab8:	bf b9 30 81 00       	mov    edi,0x8130b9
  809abd:	e8 4f c9 ff ff       	call   806411 <mount_fs>
  809ac2:	48 89 05 bf da c1 ff 	mov    QWORD PTR [rip+0xffffffffffc1dabf],rax        # 427588 <root_sb>
}
  809ac9:	90                   	nop
  809aca:	c9                   	leave  
  809acb:	c3                   	ret    

0000000000809acc <scrdown>:
//{
//    video_base=addr;
//    m_ptr=addr;
//}
void scrdown(void)
{
  809acc:	f3 0f 1e fa          	endbr64 
  809ad0:	55                   	push   rbp
  809ad1:	48 89 e5             	mov    rbp,rsp
    vpage_base+=SCREEN_W*2;
  809ad4:	48 8b 05 2d 0a c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20a2d]        # 42a508 <vpage_base>
  809adb:	48 05 a0 00 00 00    	add    rax,0xa0
  809ae1:	48 89 05 20 0a c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20a20],rax        # 42a508 <vpage_base>
    page_boffset+=SCREEN_W*2;
  809ae8:	8b 05 22 0a c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20a22]        # 42a510 <page_boffset>
  809aee:	05 a0 00 00 00       	add    eax,0xa0
  809af3:	89 05 17 0a c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20a17],eax        # 42a510 <page_boffset>
    if(vpage_base>=video_end)
  809af9:	48 8b 15 08 0a c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc20a08]        # 42a508 <vpage_base>
  809b00:	48 8b 05 f9 09 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc209f9]        # 42a500 <video_end>
  809b07:	48 39 c2             	cmp    rdx,rax
  809b0a:	72 0e                	jb     809b1a <scrdown+0x4e>
        vpage_base=video_base;
  809b0c:	48 8b 05 e5 09 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc209e5]        # 42a4f8 <video_base>
  809b13:	48 89 05 ee 09 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc209ee],rax        # 42a508 <vpage_base>
    set_origin();
  809b1a:	b8 00 00 00 00       	mov    eax,0x0
  809b1f:	e8 6a 00 00 00       	call   809b8e <set_origin>
}
  809b24:	90                   	nop
  809b25:	5d                   	pop    rbp
  809b26:	c3                   	ret    

0000000000809b27 <scrup>:
void scrup()
{
  809b27:	f3 0f 1e fa          	endbr64 
  809b2b:	55                   	push   rbp
  809b2c:	48 89 e5             	mov    rbp,rsp
    if(page_boffset<=0)
  809b2f:	8b 05 db 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc209db]        # 42a510 <page_boffset>
  809b35:	85 c0                	test   eax,eax
  809b37:	75 24                	jne    809b5d <scrup+0x36>
    {
        page_boffset=0;
  809b39:	c7 05 cd 09 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc209cd],0x0        # 42a510 <page_boffset>
  809b40:	00 00 00 
        vpage_base=video_base;
  809b43:	48 8b 05 ae 09 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc209ae]        # 42a4f8 <video_base>
  809b4a:	48 89 05 b7 09 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc209b7],rax        # 42a508 <vpage_base>
        set_origin();
  809b51:	b8 00 00 00 00       	mov    eax,0x0
  809b56:	e8 33 00 00 00       	call   809b8e <set_origin>
        return;
  809b5b:	eb 2f                	jmp    809b8c <scrup+0x65>
    }
    vpage_base-=SCREEN_W*2;
  809b5d:	48 8b 05 a4 09 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc209a4]        # 42a508 <vpage_base>
  809b64:	48 2d a0 00 00 00    	sub    rax,0xa0
  809b6a:	48 89 05 97 09 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20997],rax        # 42a508 <vpage_base>
    page_boffset-=SCREEN_W*2;
  809b71:	8b 05 99 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20999]        # 42a510 <page_boffset>
  809b77:	2d a0 00 00 00       	sub    eax,0xa0
  809b7c:	89 05 8e 09 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2098e],eax        # 42a510 <page_boffset>
    set_origin();
  809b82:	b8 00 00 00 00       	mov    eax,0x0
  809b87:	e8 02 00 00 00       	call   809b8e <set_origin>
}
  809b8c:	5d                   	pop    rbp
  809b8d:	c3                   	ret    

0000000000809b8e <set_origin>:
void set_origin(void)
{
  809b8e:	f3 0f 1e fa          	endbr64 
  809b92:	55                   	push   rbp
  809b93:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  809b96:	fa                   	cli    
    outb(port_reg_index,12);
  809b97:	8b 05 83 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20983]        # 42a520 <port_reg_index>
  809b9d:	0f b7 c0             	movzx  eax,ax
  809ba0:	be 0c 00 00 00       	mov    esi,0xc
  809ba5:	89 c7                	mov    edi,eax
  809ba7:	e8 64 b2 ff ff       	call   804e10 <outb>
    outb(port_reg_v,(page_boffset>>9)&0xff);
  809bac:	8b 05 5e 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2095e]        # 42a510 <page_boffset>
  809bb2:	c1 e8 09             	shr    eax,0x9
  809bb5:	0f b6 d0             	movzx  edx,al
  809bb8:	8b 05 66 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20966]        # 42a524 <port_reg_v>
  809bbe:	0f b7 c0             	movzx  eax,ax
  809bc1:	89 d6                	mov    esi,edx
  809bc3:	89 c7                	mov    edi,eax
  809bc5:	e8 46 b2 ff ff       	call   804e10 <outb>
    outb(port_reg_index,13);
  809bca:	8b 05 50 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20950]        # 42a520 <port_reg_index>
  809bd0:	0f b7 c0             	movzx  eax,ax
  809bd3:	be 0d 00 00 00       	mov    esi,0xd
  809bd8:	89 c7                	mov    edi,eax
  809bda:	e8 31 b2 ff ff       	call   804e10 <outb>
    outb(port_reg_v,(page_boffset>>1)&0xff);
  809bdf:	8b 05 2b 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2092b]        # 42a510 <page_boffset>
  809be5:	d1 e8                	shr    eax,1
  809be7:	0f b6 d0             	movzx  edx,al
  809bea:	8b 05 34 09 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20934]        # 42a524 <port_reg_v>
  809bf0:	0f b7 c0             	movzx  eax,ax
  809bf3:	89 d6                	mov    esi,edx
  809bf5:	89 c7                	mov    edi,eax
  809bf7:	e8 14 b2 ff ff       	call   804e10 <outb>
    asm volatile("sti");
  809bfc:	fb                   	sti    

}
  809bfd:	90                   	nop
  809bfe:	5d                   	pop    rbp
  809bff:	c3                   	ret    

0000000000809c00 <init_tty>:
        .type=DEV_TYPE_CHRDEV,
        .flag=DEV_FLAG_USED,
        .drv=&drv_tty
};
void init_tty()
{
  809c00:	f3 0f 1e fa          	endbr64 
  809c04:	55                   	push   rbp
  809c05:	48 89 e5             	mov    rbp,rsp
  809c08:	48 83 ec 10          	sub    rsp,0x10
    strcpy(dev_tty.name,"tty0");
  809c0c:	be 08 33 81 00       	mov    esi,0x813308
  809c11:	bf b4 31 81 00       	mov    edi,0x8131b4
  809c16:	e8 9a 09 00 00       	call   80a5b5 <strcpy>
    strcpy(dev_stdout.name,"stdout");
  809c1b:	be 0d 33 81 00       	mov    esi,0x81330d
  809c20:	bf 74 32 81 00       	mov    edi,0x813274
  809c25:	e8 8b 09 00 00       	call   80a5b5 <strcpy>
    reg_driver(&drv_tty);
  809c2a:	bf 00 31 81 00       	mov    edi,0x813100
  809c2f:	e8 18 91 ff ff       	call   802d4c <reg_driver>
    reg_device(&dev_tty);
  809c34:	bf a0 31 81 00       	mov    edi,0x8131a0
  809c39:	e8 26 8e ff ff       	call   802a64 <reg_device>
    reg_device(&dev_stdout);
  809c3e:	bf 60 32 81 00       	mov    edi,0x813260
  809c43:	e8 1c 8e ff ff       	call   802a64 <reg_device>
    unsigned char *vp=0x20000;
  809c48:	48 c7 45 f8 00 00 02 	mov    QWORD PTR [rbp-0x8],0x20000
  809c4f:	00 
    if(*vp==0x7)
  809c50:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809c54:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c57:	3c 07                	cmp    al,0x7
  809c59:	75 36                	jne    809c91 <init_tty+0x91>
    {
        video_mode=VIDEO_MONOTEXT;
  809c5b:	c7 05 af 08 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc208af],0x0        # 42a514 <video_mode>
  809c62:	00 00 00 
        video_base=0xb0000;
  809c65:	48 c7 05 88 08 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20888],0xb0000        # 42a4f8 <video_base>
  809c6c:	00 00 0b 00 
        video_end=0xb8000-1;
  809c70:	48 c7 05 85 08 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20885],0xb7fff        # 42a500 <video_end>
  809c77:	ff 7f 0b 00 
        port_reg_index=0x3b4;
  809c7b:	c7 05 9b 08 c2 ff b4 	mov    DWORD PTR [rip+0xffffffffffc2089b],0x3b4        # 42a520 <port_reg_index>
  809c82:	03 00 00 
        port_reg_v=0x3b5;
  809c85:	c7 05 95 08 c2 ff b5 	mov    DWORD PTR [rip+0xffffffffffc20895],0x3b5        # 42a524 <port_reg_v>
  809c8c:	03 00 00 
  809c8f:	eb 61                	jmp    809cf2 <init_tty+0xf2>
    }else if(*vp<=0x3)
  809c91:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809c95:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809c98:	3c 03                	cmp    al,0x3
  809c9a:	77 36                	ja     809cd2 <init_tty+0xd2>
    {
        video_mode=VIDEO_CHROMATEXT;
  809c9c:	c7 05 6e 08 c2 ff 01 	mov    DWORD PTR [rip+0xffffffffffc2086e],0x1        # 42a514 <video_mode>
  809ca3:	00 00 00 
        video_base=0xb8000;
  809ca6:	48 c7 05 47 08 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20847],0xb8000        # 42a4f8 <video_base>
  809cad:	00 80 0b 00 
        video_end=0xc0000-1;
  809cb1:	48 c7 05 44 08 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20844],0xbffff        # 42a500 <video_end>
  809cb8:	ff ff 0b 00 
        port_reg_index=0x3d4;
  809cbc:	c7 05 5a 08 c2 ff d4 	mov    DWORD PTR [rip+0xffffffffffc2085a],0x3d4        # 42a520 <port_reg_index>
  809cc3:	03 00 00 
        port_reg_v=0x3d5;
  809cc6:	c7 05 54 08 c2 ff d5 	mov    DWORD PTR [rip+0xffffffffffc20854],0x3d5        # 42a524 <port_reg_v>
  809ccd:	03 00 00 
  809cd0:	eb 20                	jmp    809cf2 <init_tty+0xf2>
    }else{
        video_mode=VIDEO_GRAPHICS;
  809cd2:	c7 05 38 08 c2 ff 02 	mov    DWORD PTR [rip+0xffffffffffc20838],0x2        # 42a514 <video_mode>
  809cd9:	00 00 00 
        video_base=0xa0000;
  809cdc:	48 c7 05 11 08 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc20811],0xa0000        # 42a4f8 <video_base>
  809ce3:	00 00 0a 00 
        video_end=0xb0000-1;
  809ce7:	48 c7 05 0e 08 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc2080e],0xaffff        # 42a500 <video_end>
  809cee:	ff ff 0a 00 
    }
    if(*vp<=0x1)line_chs=40;
  809cf2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809cf6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809cf9:	3c 01                	cmp    al,0x1
  809cfb:	77 0f                	ja     809d0c <init_tty+0x10c>
  809cfd:	c7 05 15 08 c2 ff 28 	mov    DWORD PTR [rip+0xffffffffffc20815],0x28        # 42a51c <line_chs>
  809d04:	00 00 00 
  809d07:	e9 91 00 00 00       	jmp    809d9d <init_tty+0x19d>
    else if(*vp<=0x3||*vp==0x7)line_chs=80;
  809d0c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d10:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d13:	3c 03                	cmp    al,0x3
  809d15:	76 0b                	jbe    809d22 <init_tty+0x122>
  809d17:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d1b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d1e:	3c 07                	cmp    al,0x7
  809d20:	75 0c                	jne    809d2e <init_tty+0x12e>
  809d22:	c7 05 f0 07 c2 ff 50 	mov    DWORD PTR [rip+0xffffffffffc207f0],0x50        # 42a51c <line_chs>
  809d29:	00 00 00 
  809d2c:	eb 6f                	jmp    809d9d <init_tty+0x19d>
    else if(*vp<=0x5||*vp==0x9||*vp==0xd)line_chs=320;
  809d2e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d32:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d35:	3c 05                	cmp    al,0x5
  809d37:	76 16                	jbe    809d4f <init_tty+0x14f>
  809d39:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d3d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d40:	3c 09                	cmp    al,0x9
  809d42:	74 0b                	je     809d4f <init_tty+0x14f>
  809d44:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d48:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d4b:	3c 0d                	cmp    al,0xd
  809d4d:	75 0c                	jne    809d5b <init_tty+0x15b>
  809d4f:	c7 05 c3 07 c2 ff 40 	mov    DWORD PTR [rip+0xffffffffffc207c3],0x140        # 42a51c <line_chs>
  809d56:	01 00 00 
  809d59:	eb 42                	jmp    809d9d <init_tty+0x19d>
    else if(*vp==0x6||*vp==0xa||*vp>=0xe)line_chs=640;
  809d5b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d5f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d62:	3c 06                	cmp    al,0x6
  809d64:	74 16                	je     809d7c <init_tty+0x17c>
  809d66:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d6a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d6d:	3c 0a                	cmp    al,0xa
  809d6f:	74 0b                	je     809d7c <init_tty+0x17c>
  809d71:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d75:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d78:	3c 0d                	cmp    al,0xd
  809d7a:	76 0c                	jbe    809d88 <init_tty+0x188>
  809d7c:	c7 05 96 07 c2 ff 80 	mov    DWORD PTR [rip+0xffffffffffc20796],0x280        # 42a51c <line_chs>
  809d83:	02 00 00 
  809d86:	eb 15                	jmp    809d9d <init_tty+0x19d>
    else if(*vp==0x8)line_chs=160;
  809d88:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809d8c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809d8f:	3c 08                	cmp    al,0x8
  809d91:	75 0a                	jne    809d9d <init_tty+0x19d>
  809d93:	c7 05 7f 07 c2 ff a0 	mov    DWORD PTR [rip+0xffffffffffc2077f],0xa0        # 42a51c <line_chs>
  809d9a:	00 00 00 
    switch (*vp)
  809d9d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809da1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809da4:	0f b6 c0             	movzx  eax,al
  809da7:	83 f8 14             	cmp    eax,0x14
  809daa:	77 61                	ja     809e0d <init_tty+0x20d>
  809dac:	89 c0                	mov    eax,eax
  809dae:	48 8b 04 c5 18 33 81 	mov    rax,QWORD PTR [rax*8+0x813318]
  809db5:	00 
  809db6:	3e ff e0             	notrack jmp rax
    {
    case 0x0:case 0x1:vpage_size=40*25;break;
  809db9:	c7 05 65 07 c2 ff e8 	mov    DWORD PTR [rip+0xffffffffffc20765],0x3e8        # 42a528 <vpage_size>
  809dc0:	03 00 00 
  809dc3:	eb 49                	jmp    809e0e <init_tty+0x20e>
    case 2:case 3:case 7:vpage_size=80*25;break;
  809dc5:	c7 05 59 07 c2 ff d0 	mov    DWORD PTR [rip+0xffffffffffc20759],0x7d0        # 42a528 <vpage_size>
  809dcc:	07 00 00 
  809dcf:	eb 3d                	jmp    809e0e <init_tty+0x20e>
    case 4:case 5:case 9:case 0xd:vpage_size=320*200;break;
  809dd1:	c7 05 4d 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2074d],0xfa00        # 42a528 <vpage_size>
  809dd8:	fa 00 00 
  809ddb:	eb 31                	jmp    809e0e <init_tty+0x20e>
    case 6:case 0xa:case 0xe:vpage_size=640*200;break;
  809ddd:	c7 05 41 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20741],0x1f400        # 42a528 <vpage_size>
  809de4:	f4 01 00 
  809de7:	eb 25                	jmp    809e0e <init_tty+0x20e>
    case 8:vpage_size=160*200;break;
  809de9:	c7 05 35 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20735],0x7d00        # 42a528 <vpage_size>
  809df0:	7d 00 00 
  809df3:	eb 19                	jmp    809e0e <init_tty+0x20e>
    case 0xf:case 0x10:case 0x11:vpage_size=640*350;break;
  809df5:	c7 05 29 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20729],0x36b00        # 42a528 <vpage_size>
  809dfc:	6b 03 00 
  809dff:	eb 0d                	jmp    809e0e <init_tty+0x20e>
    case 0x12:case 0x13:case 0x14:vpage_size=640*480;break;
  809e01:	c7 05 1d 07 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc2071d],0x4b000        # 42a528 <vpage_size>
  809e08:	b0 04 00 
  809e0b:	eb 01                	jmp    809e0e <init_tty+0x20e>
    default:
        break;
  809e0d:	90                   	nop
    }
    m_ptr=video_base;
  809e0e:	48 8b 05 e3 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc206e3]        # 42a4f8 <video_base>
  809e15:	48 89 05 44 13 00 00 	mov    QWORD PTR [rip+0x1344],rax        # 80b160 <m_ptr>
    page_boffset=0;
  809e1c:	c7 05 ea 06 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc206ea],0x0        # 42a510 <page_boffset>
  809e23:	00 00 00 
    vpage_base=video_base;
  809e26:	48 8b 05 cb 06 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc206cb]        # 42a4f8 <video_base>
  809e2d:	48 89 05 d4 06 c2 ff 	mov    QWORD PTR [rip+0xffffffffffc206d4],rax        # 42a508 <vpage_base>
    vp++;
  809e34:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    vpage=*vp;
  809e39:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809e3d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e40:	0f b6 c0             	movzx  eax,al
  809e43:	89 05 cf 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc206cf],eax        # 42a518 <vpage>
    vp++;
  809e49:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    stline=*vp++;
  809e4e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809e52:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809e56:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809e5a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e5d:	0f b6 c0             	movzx  eax,al
  809e60:	89 05 ce 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc206ce],eax        # 42a534 <stline>
    endline=*vp++;
  809e66:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809e6a:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809e6e:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809e72:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e75:	0f b6 c0             	movzx  eax,al
  809e78:	89 05 ba 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc206ba],eax        # 42a538 <endline>
    videoy=*vp++;
  809e7e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809e82:	48 8d 50 01          	lea    rdx,[rax+0x1]
  809e86:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  809e8a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e8d:	0f b6 c0             	movzx  eax,al
  809e90:	89 05 9a 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2069a],eax        # 42a530 <videoy>
    videox=*vp;
  809e96:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809e9a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  809e9d:	0f b6 c0             	movzx  eax,al
  809ea0:	89 05 86 06 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20686],eax        # 42a52c <videox>
    //logf("video:\n mode:0x%x cursor:%d,%d\n",video_mode,\
    videoy,videox);
}
  809ea6:	90                   	nop
  809ea7:	c9                   	leave  
  809ea8:	c3                   	ret    

0000000000809ea9 <seek_tty>:
char m_color=MONITOR_WHITE;
int seek_tty(driver_args * args)
{
  809ea9:	f3 0f 1e fa          	endbr64 
  809ead:	55                   	push   rbp
  809eae:	48 89 e5             	mov    rbp,rsp
  809eb1:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int pos=args->pos;
  809eb5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  809eb9:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
  809ebc:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
    m_ptr=0xb8000+pos*2;
  809ebf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  809ec2:	05 00 c0 05 00       	add    eax,0x5c000
  809ec7:	01 c0                	add    eax,eax
  809ec9:	48 98                	cdqe   
  809ecb:	48 89 05 8e 12 00 00 	mov    QWORD PTR [rip+0x128e],rax        # 80b160 <m_ptr>
}
  809ed2:	90                   	nop
  809ed3:	5d                   	pop    rbp
  809ed4:	c3                   	ret    

0000000000809ed5 <tell_monitor>:
int tell_monitor()
{
  809ed5:	f3 0f 1e fa          	endbr64 
  809ed9:	55                   	push   rbp
  809eda:	48 89 e5             	mov    rbp,rsp
    return (m_ptr-video_base)/2;
  809edd:	48 8b 05 7c 12 00 00 	mov    rax,QWORD PTR [rip+0x127c]        # 80b160 <m_ptr>
  809ee4:	48 8b 15 0d 06 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc2060d]        # 42a4f8 <video_base>
  809eeb:	48 29 d0             	sub    rax,rdx
  809eee:	48 89 c2             	mov    rdx,rax
  809ef1:	48 c1 ea 3f          	shr    rdx,0x3f
  809ef5:	48 01 d0             	add    rax,rdx
  809ef8:	48 d1 f8             	sar    rax,1
}
  809efb:	5d                   	pop    rbp
  809efc:	c3                   	ret    

0000000000809efd <del_ch>:
void del_ch()
{
  809efd:	f3 0f 1e fa          	endbr64 
  809f01:	55                   	push   rbp
  809f02:	48 89 e5             	mov    rbp,rsp
  809f05:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
    char *p=m_ptr-2;
  809f0c:	48 8b 05 4d 12 00 00 	mov    rax,QWORD PTR [rip+0x124d]        # 80b160 <m_ptr>
  809f13:	48 83 e8 02          	sub    rax,0x2
  809f17:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int pos=tell_monitor()%SCREEN_W;
  809f1b:	b8 00 00 00 00       	mov    eax,0x0
  809f20:	e8 b0 ff ff ff       	call   809ed5 <tell_monitor>
  809f25:	89 c2                	mov    edx,eax
  809f27:	48 63 c2             	movsxd rax,edx
  809f2a:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  809f31:	48 c1 e8 20          	shr    rax,0x20
  809f35:	c1 f8 05             	sar    eax,0x5
  809f38:	89 d1                	mov    ecx,edx
  809f3a:	c1 f9 1f             	sar    ecx,0x1f
  809f3d:	29 c8                	sub    eax,ecx
  809f3f:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  809f42:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  809f45:	89 c8                	mov    eax,ecx
  809f47:	c1 e0 02             	shl    eax,0x2
  809f4a:	01 c8                	add    eax,ecx
  809f4c:	c1 e0 04             	shl    eax,0x4
  809f4f:	29 c2                	sub    edx,eax
  809f51:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
    for(;pos<SCREEN_W-1;pos++)
  809f54:	eb 17                	jmp    809f6d <del_ch+0x70>
    {
        *p=*(p+2);
  809f56:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809f5a:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
  809f5e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  809f62:	88 10                	mov    BYTE PTR [rax],dl
        p+=2;
  809f64:	48 83 45 f8 02       	add    QWORD PTR [rbp-0x8],0x2
    for(;pos<SCREEN_W-1;pos++)
  809f69:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  809f6d:	83 7d f4 4e          	cmp    DWORD PTR [rbp-0xc],0x4e
  809f71:	7e e3                	jle    809f56 <del_ch+0x59>
    }
    driver_args args= {
  809f73:	48 8d 95 30 ff ff ff 	lea    rdx,[rbp-0xd0]
  809f7a:	b8 00 00 00 00       	mov    eax,0x0
  809f7f:	b9 18 00 00 00       	mov    ecx,0x18
  809f84:	48 89 d7             	mov    rdi,rdx
  809f87:	f3 48 ab             	rep stos QWORD PTR es:[rdi],rax
            .pos=tell_monitor() - 1
  809f8a:	b8 00 00 00 00       	mov    eax,0x0
  809f8f:	e8 41 ff ff ff       	call   809ed5 <tell_monitor>
  809f94:	83 e8 01             	sub    eax,0x1
    driver_args args= {
  809f97:	89 85 44 ff ff ff    	mov    DWORD PTR [rbp-0xbc],eax
    };
    seek_tty(&args);
  809f9d:	48 8d 85 30 ff ff ff 	lea    rax,[rbp-0xd0]
  809fa4:	48 89 c7             	mov    rdi,rax
  809fa7:	e8 fd fe ff ff       	call   809ea9 <seek_tty>
    set_cur();
  809fac:	b8 00 00 00 00       	mov    eax,0x0
  809fb1:	e8 03 00 00 00       	call   809fb9 <set_cur>
}
  809fb6:	90                   	nop
  809fb7:	c9                   	leave  
  809fb8:	c3                   	ret    

0000000000809fb9 <set_cur>:
void set_cur()
{
  809fb9:	f3 0f 1e fa          	endbr64 
  809fbd:	55                   	push   rbp
  809fbe:	48 89 e5             	mov    rbp,rsp
    asm volatile("cli");
  809fc1:	fa                   	cli    
    outb(port_reg_index,14);
  809fc2:	8b 05 58 05 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20558]        # 42a520 <port_reg_index>
  809fc8:	0f b7 c0             	movzx  eax,ax
  809fcb:	be 0e 00 00 00       	mov    esi,0xe
  809fd0:	89 c7                	mov    edi,eax
  809fd2:	e8 39 ae ff ff       	call   804e10 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>9)&0xff);
  809fd7:	48 8b 05 82 11 00 00 	mov    rax,QWORD PTR [rip+0x1182]        # 80b160 <m_ptr>
  809fde:	48 8b 15 13 05 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc20513]        # 42a4f8 <video_base>
  809fe5:	48 29 d0             	sub    rax,rdx
  809fe8:	48 c1 f8 09          	sar    rax,0x9
  809fec:	0f b6 d0             	movzx  edx,al
  809fef:	8b 05 2f 05 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2052f]        # 42a524 <port_reg_v>
  809ff5:	0f b7 c0             	movzx  eax,ax
  809ff8:	89 d6                	mov    esi,edx
  809ffa:	89 c7                	mov    edi,eax
  809ffc:	e8 0f ae ff ff       	call   804e10 <outb>
    outb(port_reg_index,15);
  80a001:	8b 05 19 05 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20519]        # 42a520 <port_reg_index>
  80a007:	0f b7 c0             	movzx  eax,ax
  80a00a:	be 0f 00 00 00       	mov    esi,0xf
  80a00f:	89 c7                	mov    edi,eax
  80a011:	e8 fa ad ff ff       	call   804e10 <outb>
    outb(port_reg_v,((m_ptr-video_base)>>1)&0xff);
  80a016:	48 8b 05 43 11 00 00 	mov    rax,QWORD PTR [rip+0x1143]        # 80b160 <m_ptr>
  80a01d:	48 8b 15 d4 04 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc204d4]        # 42a4f8 <video_base>
  80a024:	48 29 d0             	sub    rax,rdx
  80a027:	48 d1 f8             	sar    rax,1
  80a02a:	0f b6 d0             	movzx  edx,al
  80a02d:	8b 05 f1 04 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc204f1]        # 42a524 <port_reg_v>
  80a033:	0f b7 c0             	movzx  eax,ax
  80a036:	89 d6                	mov    esi,edx
  80a038:	89 c7                	mov    edi,eax
  80a03a:	e8 d1 ad ff ff       	call   804e10 <outb>
    asm volatile("sti");
  80a03f:	fb                   	sti    
}
  80a040:	90                   	nop
  80a041:	5d                   	pop    rbp
  80a042:	c3                   	ret    

000000000080a043 <read_tty>:

int read_tty(driver_args *args)
{
  80a043:	f3 0f 1e fa          	endbr64 
  80a047:	55                   	push   rbp
  80a048:	48 89 e5             	mov    rbp,rsp
  80a04b:	48 83 ec 20          	sub    rsp,0x20
  80a04f:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    char* dist=args->dist_addr;
  80a053:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a057:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
  80a05a:	48 98                	cdqe   
  80a05c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80a060:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a064:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80a067:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80a06a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80a071:	eb 4a                	jmp    80a0bd <read_tty+0x7a>
    {
        *dist++=*m_ptr;
  80a073:	48 8b 15 e6 10 00 00 	mov    rdx,QWORD PTR [rip+0x10e6]        # 80b160 <m_ptr>
  80a07a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a07e:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80a082:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80a086:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80a089:	88 10                	mov    BYTE PTR [rax],dl
        if(m_ptr==0xbffff&&i>0)
  80a08b:	48 8b 05 ce 10 00 00 	mov    rax,QWORD PTR [rip+0x10ce]        # 80b160 <m_ptr>
  80a092:	48 3d ff ff 0b 00    	cmp    rax,0xbffff
  80a098:	75 0d                	jne    80a0a7 <read_tty+0x64>
  80a09a:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80a09e:	7e 07                	jle    80a0a7 <read_tty+0x64>
        {
            return 1;//读到尾了
  80a0a0:	b8 01 00 00 00       	mov    eax,0x1
  80a0a5:	eb 2d                	jmp    80a0d4 <read_tty+0x91>
        }
        m_ptr+=2;
  80a0a7:	48 8b 05 b2 10 00 00 	mov    rax,QWORD PTR [rip+0x10b2]        # 80b160 <m_ptr>
  80a0ae:	48 83 c0 02          	add    rax,0x2
  80a0b2:	48 89 05 a7 10 00 00 	mov    QWORD PTR [rip+0x10a7],rax        # 80b160 <m_ptr>
    for(int i=0;i<len;i++)
  80a0b9:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a0bd:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a0c0:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80a0c3:	7c ae                	jl     80a073 <read_tty+0x30>
    }
    set_cur();
  80a0c5:	b8 00 00 00 00       	mov    eax,0x0
  80a0ca:	e8 ea fe ff ff       	call   809fb9 <set_cur>
    return 0;
  80a0cf:	b8 00 00 00 00       	mov    eax,0x0
}
  80a0d4:	c9                   	leave  
  80a0d5:	c3                   	ret    

000000000080a0d6 <write_tty>:
int write_tty(driver_args *args)
{
  80a0d6:	f3 0f 1e fa          	endbr64 
  80a0da:	55                   	push   rbp
  80a0db:	48 89 e5             	mov    rbp,rsp
  80a0de:	48 83 ec 30          	sub    rsp,0x30
  80a0e2:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
    char* src=args->src_addr;
  80a0e6:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a0ea:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
  80a0ed:	48 98                	cdqe   
  80a0ef:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
    int len=args->len;
  80a0f3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a0f7:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
  80a0fa:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
    for(int i=0;i<len;i++)
  80a0fd:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
  80a104:	e9 0b 01 00 00       	jmp    80a214 <write_tty+0x13e>
    {
        if(*src=='\n')
  80a109:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a10d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a110:	3c 0a                	cmp    al,0xa
  80a112:	75 50                	jne    80a164 <write_tty+0x8e>
        {
            unsigned int off=m_ptr-0xb8000;
  80a114:	48 8b 05 45 10 00 00 	mov    rax,QWORD PTR [rip+0x1045]        # 80b160 <m_ptr>
  80a11b:	48 2d 00 80 0b 00    	sub    rax,0xb8000
  80a121:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            off=(off/160+1)*160;
  80a124:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a127:	89 c2                	mov    edx,eax
  80a129:	b8 cd cc cc cc       	mov    eax,0xcccccccd
  80a12e:	48 0f af c2          	imul   rax,rdx
  80a132:	48 c1 e8 20          	shr    rax,0x20
  80a136:	c1 e8 07             	shr    eax,0x7
  80a139:	8d 50 01             	lea    edx,[rax+0x1]
  80a13c:	89 d0                	mov    eax,edx
  80a13e:	c1 e0 02             	shl    eax,0x2
  80a141:	01 d0                	add    eax,edx
  80a143:	c1 e0 05             	shl    eax,0x5
  80a146:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
            ////logf("%x\n",off);
            m_ptr=0xb8000u+off;
  80a149:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  80a14c:	05 00 80 0b 00       	add    eax,0xb8000
  80a151:	89 c0                	mov    eax,eax
  80a153:	48 89 05 06 10 00 00 	mov    QWORD PTR [rip+0x1006],rax        # 80b160 <m_ptr>
            src++;
  80a15a:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
            continue;
  80a15f:	e9 ac 00 00 00       	jmp    80a210 <write_tty+0x13a>
        }else if(*src=='\0')
  80a164:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a168:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a16b:	84 c0                	test   al,al
  80a16d:	0f 84 af 00 00 00    	je     80a222 <write_tty+0x14c>
            break;
        if(*src=='\b')
  80a173:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a177:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a17a:	3c 08                	cmp    al,0x8
  80a17c:	75 1e                	jne    80a19c <write_tty+0xc6>
        {
            m_ptr-=2;
  80a17e:	48 8b 05 db 0f 00 00 	mov    rax,QWORD PTR [rip+0xfdb]        # 80b160 <m_ptr>
  80a185:	48 83 e8 02          	sub    rax,0x2
  80a189:	48 89 05 d0 0f 00 00 	mov    QWORD PTR [rip+0xfd0],rax        # 80b160 <m_ptr>
            *m_ptr=0;
  80a190:	48 8b 05 c9 0f 00 00 	mov    rax,QWORD PTR [rip+0xfc9]        # 80b160 <m_ptr>
  80a197:	c6 00 00             	mov    BYTE PTR [rax],0x0
  80a19a:	eb 3e                	jmp    80a1da <write_tty+0x104>
        }else
        {
            *m_ptr++=*src++;
  80a19c:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  80a1a0:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80a1a4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  80a1a8:	48 8b 05 b1 0f 00 00 	mov    rax,QWORD PTR [rip+0xfb1]        # 80b160 <m_ptr>
  80a1af:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80a1b3:	48 89 0d a6 0f 00 00 	mov    QWORD PTR [rip+0xfa6],rcx        # 80b160 <m_ptr>
  80a1ba:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80a1bd:	88 10                	mov    BYTE PTR [rax],dl
            *m_ptr++=m_color;
  80a1bf:	48 8b 05 9a 0f 00 00 	mov    rax,QWORD PTR [rip+0xf9a]        # 80b160 <m_ptr>
  80a1c6:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a1ca:	48 89 15 8f 0f 00 00 	mov    QWORD PTR [rip+0xf8f],rdx        # 80b160 <m_ptr>
  80a1d1:	0f b6 15 90 0f 00 00 	movzx  edx,BYTE PTR [rip+0xf90]        # 80b168 <m_color>
  80a1d8:	88 10                	mov    BYTE PTR [rax],dl
        }
        if(m_ptr-vpage_base>=vpage_size*2-line_chs*2&&i>0)
  80a1da:	48 8b 05 7f 0f 00 00 	mov    rax,QWORD PTR [rip+0xf7f]        # 80b160 <m_ptr>
  80a1e1:	48 8b 0d 20 03 c2 ff 	mov    rcx,QWORD PTR [rip+0xffffffffffc20320]        # 42a508 <vpage_base>
  80a1e8:	48 29 c8             	sub    rax,rcx
  80a1eb:	48 89 c2             	mov    rdx,rax
  80a1ee:	8b 05 34 03 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20334]        # 42a528 <vpage_size>
  80a1f4:	8b 0d 22 03 c2 ff    	mov    ecx,DWORD PTR [rip+0xffffffffffc20322]        # 42a51c <line_chs>
  80a1fa:	29 c8                	sub    eax,ecx
  80a1fc:	01 c0                	add    eax,eax
  80a1fe:	48 98                	cdqe   
  80a200:	48 39 c2             	cmp    rdx,rax
  80a203:	7c 0b                	jl     80a210 <write_tty+0x13a>
  80a205:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
  80a209:	7e 05                	jle    80a210 <write_tty+0x13a>
        {
            //下滚一行
            scrdown();
  80a20b:	e8 bc f8 ff ff       	call   809acc <scrdown>
    for(int i=0;i<len;i++)
  80a210:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  80a214:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  80a217:	3b 45 f0             	cmp    eax,DWORD PTR [rbp-0x10]
  80a21a:	0f 8c e9 fe ff ff    	jl     80a109 <write_tty+0x33>
  80a220:	eb 01                	jmp    80a223 <write_tty+0x14d>
            break;
  80a222:	90                   	nop
        }
    }
    set_cur();
  80a223:	b8 00 00 00 00       	mov    eax,0x0
  80a228:	e8 8c fd ff ff       	call   809fb9 <set_cur>
    return 0;
  80a22d:	b8 00 00 00 00       	mov    eax,0x0
}
  80a232:	c9                   	leave  
  80a233:	c3                   	ret    

000000000080a234 <cls>:

void cls(driver_args *args)
{
  80a234:	f3 0f 1e fa          	endbr64 
  80a238:	55                   	push   rbp
  80a239:	48 89 e5             	mov    rbp,rsp
  80a23c:	48 83 ec 20          	sub    rsp,0x20
  80a240:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    for(int i=0;i<vpage_size*2;i+=2)
  80a244:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a24b:	eb 16                	jmp    80a263 <cls+0x2f>
    {
        vpage_base[i]=0;
  80a24d:	48 8b 15 b4 02 c2 ff 	mov    rdx,QWORD PTR [rip+0xffffffffffc202b4]        # 42a508 <vpage_base>
  80a254:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a257:	48 98                	cdqe   
  80a259:	48 01 d0             	add    rax,rdx
  80a25c:	c6 00 00             	mov    BYTE PTR [rax],0x0
    for(int i=0;i<vpage_size*2;i+=2)
  80a25f:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
  80a263:	8b 05 bf 02 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc202bf]        # 42a528 <vpage_size>
  80a269:	01 c0                	add    eax,eax
  80a26b:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  80a26e:	7c dd                	jl     80a24d <cls+0x19>
    }
    m_ptr=vpage_base;
  80a270:	48 8b 05 91 02 c2 ff 	mov    rax,QWORD PTR [rip+0xffffffffffc20291]        # 42a508 <vpage_base>
  80a277:	48 89 05 e2 0e 00 00 	mov    QWORD PTR [rip+0xee2],rax        # 80b160 <m_ptr>
    set_cur();
  80a27e:	b8 00 00 00 00       	mov    eax,0x0
  80a283:	e8 31 fd ff ff       	call   809fb9 <set_cur>
}
  80a288:	90                   	nop
  80a289:	c9                   	leave  
  80a28a:	c3                   	ret    

000000000080a28b <set_color>:

void set_color(char color)
{
  80a28b:	f3 0f 1e fa          	endbr64 
  80a28f:	55                   	push   rbp
  80a290:	48 89 e5             	mov    rbp,rsp
  80a293:	89 f8                	mov    eax,edi
  80a295:	88 45 fc             	mov    BYTE PTR [rbp-0x4],al
    m_color=color;
  80a298:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
  80a29c:	88 05 c6 0e 00 00    	mov    BYTE PTR [rip+0xec6],al        # 80b168 <m_color>
}
  80a2a2:	90                   	nop
  80a2a3:	5d                   	pop    rbp
  80a2a4:	c3                   	ret    

000000000080a2a5 <tty_do_req>:

int tty_do_req(driver_args *args)
{
  80a2a5:	f3 0f 1e fa          	endbr64 
  80a2a9:	55                   	push   rbp
  80a2aa:	48 89 e5             	mov    rbp,rsp
  80a2ad:	48 83 ec 10          	sub    rsp,0x10
  80a2b1:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
    switch (args->cmd)
  80a2b5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a2b9:	8b 80 a8 00 00 00    	mov    eax,DWORD PTR [rax+0xa8]
  80a2bf:	83 f8 0d             	cmp    eax,0xd
  80a2c2:	74 45                	je     80a309 <tty_do_req+0x64>
  80a2c4:	83 f8 0d             	cmp    eax,0xd
  80a2c7:	7f 53                	jg     80a31c <tty_do_req+0x77>
  80a2c9:	83 f8 0c             	cmp    eax,0xc
  80a2cc:	74 2d                	je     80a2fb <tty_do_req+0x56>
  80a2ce:	83 f8 0c             	cmp    eax,0xc
  80a2d1:	7f 49                	jg     80a31c <tty_do_req+0x77>
  80a2d3:	83 f8 02             	cmp    eax,0x2
  80a2d6:	74 07                	je     80a2df <tty_do_req+0x3a>
  80a2d8:	83 f8 03             	cmp    eax,0x3
  80a2db:	74 10                	je     80a2ed <tty_do_req+0x48>
  80a2dd:	eb 3d                	jmp    80a31c <tty_do_req+0x77>
    {
    case DRVF_READ:
        read_tty(args);
  80a2df:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a2e3:	48 89 c7             	mov    rdi,rax
  80a2e6:	e8 58 fd ff ff       	call   80a043 <read_tty>
        break;
  80a2eb:	eb 36                	jmp    80a323 <tty_do_req+0x7e>
    case DRVF_WRITE:
        write_tty(args);
  80a2ed:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a2f1:	48 89 c7             	mov    rdi,rax
  80a2f4:	e8 dd fd ff ff       	call   80a0d6 <write_tty>
        break;
  80a2f9:	eb 28                	jmp    80a323 <tty_do_req+0x7e>
    case DRVF_SEEK:
        seek_tty(args);
  80a2fb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a2ff:	48 89 c7             	mov    rdi,rax
  80a302:	e8 a2 fb ff ff       	call   809ea9 <seek_tty>
        break;
  80a307:	eb 1a                	jmp    80a323 <tty_do_req+0x7e>
    case DRVF_TELL:
        tell_monitor(args);
  80a309:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a30d:	48 89 c7             	mov    rdi,rax
  80a310:	b8 00 00 00 00       	mov    eax,0x0
  80a315:	e8 bb fb ff ff       	call   809ed5 <tell_monitor>
        break;
  80a31a:	eb 07                	jmp    80a323 <tty_do_req+0x7e>
    default:return -1;
  80a31c:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80a321:	eb 05                	jmp    80a328 <tty_do_req+0x83>
    }
    return 0;
  80a323:	b8 00 00 00 00       	mov    eax,0x0
}
  80a328:	c9                   	leave  
  80a329:	c3                   	ret    

000000000080a32a <init_com>:
//
#include "com.h"
#include "int.h"


void init_com(int base_port){
  80a32a:	f3 0f 1e fa          	endbr64 
  80a32e:	55                   	push   rbp
  80a32f:	48 89 e5             	mov    rbp,rsp
  80a332:	48 83 ec 10          	sub    rsp,0x10
  80a336:	89 7d fc             	mov    DWORD PTR [rbp-0x4],edi
    /* disable all interrupts */
    outb(base_port + COM_REG_IER, 0x00);
  80a339:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a33c:	83 c0 01             	add    eax,0x1
  80a33f:	0f b7 c0             	movzx  eax,ax
  80a342:	be 00 00 00 00       	mov    esi,0x0
  80a347:	89 c7                	mov    edi,eax
  80a349:	e8 c2 aa ff ff       	call   804e10 <outb>
    
    /* enable DLAB to set bound rate divisor */
    outb(base_port + COM_REG_LCR, 0x80);
  80a34e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a351:	83 c0 03             	add    eax,0x3
  80a354:	0f b7 c0             	movzx  eax,ax
  80a357:	be 80 00 00 00       	mov    esi,0x80
  80a35c:	89 c7                	mov    edi,eax
  80a35e:	e8 ad aa ff ff       	call   804e10 <outb>
    
    /* set divisor to 38400 baud */
    outb(base_port + COM_REG_DLL, 0x03);
  80a363:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a366:	0f b7 c0             	movzx  eax,ax
  80a369:	be 03 00 00 00       	mov    esi,0x3
  80a36e:	89 c7                	mov    edi,eax
  80a370:	e8 9b aa ff ff       	call   804e10 <outb>
    outb(base_port + COM_REG_DLM, 0x00);
  80a375:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a378:	83 c0 01             	add    eax,0x1
  80a37b:	0f b7 c0             	movzx  eax,ax
  80a37e:	be 00 00 00 00       	mov    esi,0x0
  80a383:	89 c7                	mov    edi,eax
  80a385:	e8 86 aa ff ff       	call   804e10 <outb>
    
    /* 8 data bits, parity off, 1 stop bit, DLAB latch off */
    outb(base_port + COM_REG_LCR, 0x03);
  80a38a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a38d:	83 c0 03             	add    eax,0x3
  80a390:	0f b7 c0             	movzx  eax,ax
  80a393:	be 03 00 00 00       	mov    esi,0x3
  80a398:	89 c7                	mov    edi,eax
  80a39a:	e8 71 aa ff ff       	call   804e10 <outb>
    
    /* enable FIFO */
    outb(base_port + COM_REG_FCR, 0xC7);
  80a39f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a3a2:	83 c0 02             	add    eax,0x2
  80a3a5:	0f b7 c0             	movzx  eax,ax
  80a3a8:	be c7 00 00 00       	mov    esi,0xc7
  80a3ad:	89 c7                	mov    edi,eax
  80a3af:	e8 5c aa ff ff       	call   804e10 <outb>

    /* enable IRQs, set RTS/DSR */
    outb(base_port + COM_REG_MCR, 0x0B);
  80a3b4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a3b7:	83 c0 04             	add    eax,0x4
  80a3ba:	0f b7 c0             	movzx  eax,ax
  80a3bd:	be 0b 00 00 00       	mov    esi,0xb
  80a3c2:	89 c7                	mov    edi,eax
  80a3c4:	e8 47 aa ff ff       	call   804e10 <outb>
    
    /* set in loopback mode and test serial chip */
    outb(base_port + COM_REG_MCR, 0x1E);
  80a3c9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a3cc:	83 c0 04             	add    eax,0x4
  80a3cf:	0f b7 c0             	movzx  eax,ax
  80a3d2:	be 1e 00 00 00       	mov    esi,0x1e
  80a3d7:	89 c7                	mov    edi,eax
  80a3d9:	e8 32 aa ff ff       	call   804e10 <outb>
    
    /* write a byte to test serial chip */
    outb(base_port + COM_REG_TX, "arttnba3"[0]);
  80a3de:	b8 61 00 00 00       	mov    eax,0x61
  80a3e3:	0f b6 d0             	movzx  edx,al
  80a3e6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a3e9:	0f b7 c0             	movzx  eax,ax
  80a3ec:	89 d6                	mov    esi,edx
  80a3ee:	89 c7                	mov    edi,eax
  80a3f0:	e8 1b aa ff ff       	call   804e10 <outb>
    
    /* check if serial is faulty */
    if (inb(base_port + COM_REG_RX) != "arttnba3"[0]) {
  80a3f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a3f8:	0f b6 c0             	movzx  eax,al
  80a3fb:	89 c7                	mov    edi,eax
  80a3fd:	e8 27 aa ff ff       	call   804e29 <inb>
  80a402:	0f b6 d0             	movzx  edx,al
  80a405:	b8 61 00 00 00       	mov    eax,0x61
  80a40a:	0f be c0             	movsx  eax,al
  80a40d:	39 c2                	cmp    edx,eax
  80a40f:	75 17                	jne    80a428 <init_com+0xfe>
        return;
    }
    
    /* set in normal mode */
    outb(base_port + COM_REG_MCR, 0x0F);
  80a411:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a414:	83 c0 04             	add    eax,0x4
  80a417:	0f b7 c0             	movzx  eax,ax
  80a41a:	be 0f 00 00 00       	mov    esi,0xf
  80a41f:	89 c7                	mov    edi,eax
  80a421:	e8 ea a9 ff ff       	call   804e10 <outb>
  80a426:	eb 01                	jmp    80a429 <init_com+0xff>
        return;
  80a428:	90                   	nop
}
  80a429:	c9                   	leave  
  80a42a:	c3                   	ret    

000000000080a42b <com_putchar>:
void com_putchar(unsigned short ch,int com_base)
{
  80a42b:	f3 0f 1e fa          	endbr64 
  80a42f:	55                   	push   rbp
  80a430:	48 89 e5             	mov    rbp,rsp
  80a433:	48 83 ec 20          	sub    rsp,0x20
  80a437:	89 f8                	mov    eax,edi
  80a439:	89 75 e8             	mov    DWORD PTR [rbp-0x18],esi
  80a43c:	66 89 45 ec          	mov    WORD PTR [rbp-0x14],ax
    unsigned char res;
    /* wait for the port to be ready */
    do {
        res = inb(com_base + COM_REG_LSR);
  80a440:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80a443:	83 c0 05             	add    eax,0x5
  80a446:	0f b6 c0             	movzx  eax,al
  80a449:	89 c7                	mov    edi,eax
  80a44b:	e8 d9 a9 ff ff       	call   804e29 <inb>
  80a450:	88 45 ff             	mov    BYTE PTR [rbp-0x1],al
        res &= 0x20;
  80a453:	80 65 ff 20          	and    BYTE PTR [rbp-0x1],0x20
    } while (res == 0);
  80a457:	80 7d ff 00          	cmp    BYTE PTR [rbp-0x1],0x0
  80a45b:	74 e3                	je     80a440 <com_putchar+0x15>
    outb(com_base, ch);
  80a45d:	0f b7 45 ec          	movzx  eax,WORD PTR [rbp-0x14]
  80a461:	0f b6 d0             	movzx  edx,al
  80a464:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  80a467:	0f b7 c0             	movzx  eax,ax
  80a46a:	89 d6                	mov    esi,edx
  80a46c:	89 c7                	mov    edi,eax
  80a46e:	e8 9d a9 ff ff       	call   804e10 <outb>
}
  80a473:	90                   	nop
  80a474:	c9                   	leave  
  80a475:	c3                   	ret    

000000000080a476 <com_puts>:

void com_puts(char* s,int com_port){
  80a476:	f3 0f 1e fa          	endbr64 
  80a47a:	55                   	push   rbp
  80a47b:	48 89 e5             	mov    rbp,rsp
  80a47e:	48 83 ec 10          	sub    rsp,0x10
  80a482:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a486:	89 75 f4             	mov    DWORD PTR [rbp-0xc],esi
    for(;*s;s++){
  80a489:	eb 1d                	jmp    80a4a8 <com_puts+0x32>
        com_putchar(*s,com_port);
  80a48b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a48f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a492:	66 98                	cbw    
  80a494:	0f b7 c0             	movzx  eax,ax
  80a497:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  80a49a:	89 d6                	mov    esi,edx
  80a49c:	89 c7                	mov    edi,eax
  80a49e:	e8 88 ff ff ff       	call   80a42b <com_putchar>
    for(;*s;s++){
  80a4a3:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
  80a4a8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a4ac:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a4af:	84 c0                	test   al,al
  80a4b1:	75 d8                	jne    80a48b <com_puts+0x15>
    }
  80a4b3:	90                   	nop
  80a4b4:	90                   	nop
  80a4b5:	c9                   	leave  
  80a4b6:	c3                   	ret    

000000000080a4b7 <memcpy>:
#include "mem.h"
#include "typename.h"
static u32 mem_end;
static u32 usr_mem_base;
void memcpy(u8* dest, u8 *src,u32 size){
  80a4b7:	f3 0f 1e fa          	endbr64 
  80a4bb:	55                   	push   rbp
  80a4bc:	48 89 e5             	mov    rbp,rsp
  80a4bf:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a4c3:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80a4c7:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    *dest=0xff;//如果页内存还没分配，这样就可以先激发缺页异常分配了，之后写数据就会完整不会少开头第一个字节。
  80a4ca:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a4ce:	c6 00 ff             	mov    BYTE PTR [rax],0xff
    for(int i=0;i<size;i++){
  80a4d1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a4d8:	eb 1b                	jmp    80a4f5 <memcpy+0x3e>
        *(dest)=*(src);
  80a4da:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a4de:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a4e1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a4e5:	88 10                	mov    BYTE PTR [rax],dl
        dest++;
  80a4e7:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        src++;
  80a4ec:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<size;i++){
  80a4f1:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a4f5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a4f8:	39 45 dc             	cmp    DWORD PTR [rbp-0x24],eax
  80a4fb:	77 dd                	ja     80a4da <memcpy+0x23>
    }
}
  80a4fd:	90                   	nop
  80a4fe:	90                   	nop
  80a4ff:	5d                   	pop    rbp
  80a500:	c3                   	ret    

000000000080a501 <memcmp>:
int memcmp(u8 *a,u8* b,int len)
{
  80a501:	f3 0f 1e fa          	endbr64 
  80a505:	55                   	push   rbp
  80a506:	48 89 e5             	mov    rbp,rsp
  80a509:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a50d:	48 89 75 e0          	mov    QWORD PTR [rbp-0x20],rsi
  80a511:	89 55 dc             	mov    DWORD PTR [rbp-0x24],edx
    for(int i=0;i<len;i++)
  80a514:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a51b:	eb 3a                	jmp    80a557 <memcmp+0x56>
    {
        if(*a!=*b)
  80a51d:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a521:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a524:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a528:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a52b:	38 c2                	cmp    dl,al
  80a52d:	74 1a                	je     80a549 <memcmp+0x48>
            return *a-*b;
  80a52f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a533:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a536:	0f b6 d0             	movzx  edx,al
  80a539:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
  80a53d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a540:	0f b6 c8             	movzx  ecx,al
  80a543:	89 d0                	mov    eax,edx
  80a545:	29 c8                	sub    eax,ecx
  80a547:	eb 1b                	jmp    80a564 <memcmp+0x63>
        a++;
  80a549:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
        b++;
  80a54e:	48 83 45 e0 01       	add    QWORD PTR [rbp-0x20],0x1
    for(int i=0;i<len;i++)
  80a553:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a557:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a55a:	3b 45 dc             	cmp    eax,DWORD PTR [rbp-0x24]
  80a55d:	7c be                	jl     80a51d <memcmp+0x1c>
    }
    return 0;
  80a55f:	b8 00 00 00 00       	mov    eax,0x0
}
  80a564:	5d                   	pop    rbp
  80a565:	c3                   	ret    

000000000080a566 <memset>:
void memset(u8 *buf,u8 value,u32 size){
  80a566:	f3 0f 1e fa          	endbr64 
  80a56a:	55                   	push   rbp
  80a56b:	48 89 e5             	mov    rbp,rsp
  80a56e:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80a572:	89 f0                	mov    eax,esi
  80a574:	89 55 e0             	mov    DWORD PTR [rbp-0x20],edx
  80a577:	88 45 e4             	mov    BYTE PTR [rbp-0x1c],al
    for(u32 i=0;i<size;i++){
  80a57a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  80a581:	eb 16                	jmp    80a599 <memset+0x33>
        *(buf++)=value;
  80a583:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a587:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80a58b:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
  80a58f:	0f b6 55 e4          	movzx  edx,BYTE PTR [rbp-0x1c]
  80a593:	88 10                	mov    BYTE PTR [rax],dl
    for(u32 i=0;i<size;i++){
  80a595:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a599:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80a59c:	3b 45 e0             	cmp    eax,DWORD PTR [rbp-0x20]
  80a59f:	72 e2                	jb     80a583 <memset+0x1d>
    }
}
  80a5a1:	90                   	nop
  80a5a2:	90                   	nop
  80a5a3:	5d                   	pop    rbp
  80a5a4:	c3                   	ret    

000000000080a5a5 <get_mem_size>:

u32 get_mem_size(){
  80a5a5:	f3 0f 1e fa          	endbr64 
  80a5a9:	55                   	push   rbp
  80a5aa:	48 89 e5             	mov    rbp,rsp
    return mem_end;
  80a5ad:	8b 05 89 ff c1 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc1ff89]        # 42a53c <mem_end>
}
  80a5b3:	5d                   	pop    rbp
  80a5b4:	c3                   	ret    

000000000080a5b5 <strcpy>:
#include "str.h"
#include <stdarg.h>
void strcpy(unsigned char* dest, unsigned char *buf){
  80a5b5:	f3 0f 1e fa          	endbr64 
  80a5b9:	55                   	push   rbp
  80a5ba:	48 89 e5             	mov    rbp,rsp
  80a5bd:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a5c1:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*buf!='\0'){
  80a5c5:	eb 1d                	jmp    80a5e4 <strcpy+0x2f>
        *(dest++)=*(buf++);
  80a5c7:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
  80a5cb:	48 8d 42 01          	lea    rax,[rdx+0x1]
  80a5cf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  80a5d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a5d7:	48 8d 48 01          	lea    rcx,[rax+0x1]
  80a5db:	48 89 4d f8          	mov    QWORD PTR [rbp-0x8],rcx
  80a5df:	0f b6 12             	movzx  edx,BYTE PTR [rdx]
  80a5e2:	88 10                	mov    BYTE PTR [rax],dl
    while(*buf!='\0'){
  80a5e4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a5e8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a5eb:	84 c0                	test   al,al
  80a5ed:	75 d8                	jne    80a5c7 <strcpy+0x12>
    }
    *dest='\0';
  80a5ef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a5f3:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80a5f6:	90                   	nop
  80a5f7:	5d                   	pop    rbp
  80a5f8:	c3                   	ret    

000000000080a5f9 <strtok>:
static char strtokkee[512],*strtokkeeptr=strtokkee;
static int tokptr=0;
static char retbuf[512],*retbptr=retbuf;
char* strtok(char *str,char splitter){
  80a5f9:	f3 0f 1e fa          	endbr64 
  80a5fd:	55                   	push   rbp
  80a5fe:	48 89 e5             	mov    rbp,rsp
  80a601:	48 83 ec 30          	sub    rsp,0x30
  80a605:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80a609:	89 f0                	mov    eax,esi
  80a60b:	88 45 d4             	mov    BYTE PTR [rbp-0x2c],al
    //limit: cannot cut string longer than 512
    if(str!=(void*)0){
  80a60e:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
  80a613:	0f 84 9c 00 00 00    	je     80a6b5 <strtok+0xbc>
        //cut for the first time
        strcpy(strtokkee,str);
  80a619:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80a61d:	48 89 c6             	mov    rsi,rax
  80a620:	bf 60 a5 42 00       	mov    edi,0x42a560
  80a625:	e8 8b ff ff ff       	call   80a5b5 <strcpy>
        char* ptr=strtokkee;
  80a62a:	48 c7 45 e8 60 a5 42 	mov    QWORD PTR [rbp-0x18],0x42a560
  80a631:	00 
        for(tokptr=0;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512);
  80a632:	c7 05 24 01 c2 ff 00 	mov    DWORD PTR [rip+0xffffffffffc20124],0x0        # 42a760 <tokptr>
  80a639:	00 00 00 
  80a63c:	eb 1c                	jmp    80a65a <strtok+0x61>
  80a63e:	8b 05 1c 01 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2011c]        # 42a760 <tokptr>
  80a644:	83 c0 01             	add    eax,0x1
  80a647:	99                   	cdq    
  80a648:	c1 ea 17             	shr    edx,0x17
  80a64b:	01 d0                	add    eax,edx
  80a64d:	25 ff 01 00 00       	and    eax,0x1ff
  80a652:	29 d0                	sub    eax,edx
  80a654:	89 05 06 01 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20106],eax        # 42a760 <tokptr>
  80a65a:	8b 05 00 01 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20100]        # 42a760 <tokptr>
  80a660:	48 98                	cdqe   
  80a662:	0f b6 80 60 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a560]
  80a669:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80a66c:	74 13                	je     80a681 <strtok+0x88>
  80a66e:	8b 05 ec 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc200ec]        # 42a760 <tokptr>
  80a674:	48 98                	cdqe   
  80a676:	0f b6 80 60 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a560]
  80a67d:	84 c0                	test   al,al
  80a67f:	75 bd                	jne    80a63e <strtok+0x45>
        strtokkee[tokptr]='\0';
  80a681:	8b 05 d9 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc200d9]        # 42a760 <tokptr>
  80a687:	48 98                	cdqe   
  80a689:	c6 80 60 a5 42 00 00 	mov    BYTE PTR [rax+0x42a560],0x0
        tokptr=(tokptr+1)%512;
  80a690:	8b 05 ca 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc200ca]        # 42a760 <tokptr>
  80a696:	83 c0 01             	add    eax,0x1
  80a699:	99                   	cdq    
  80a69a:	c1 ea 17             	shr    edx,0x17
  80a69d:	01 d0                	add    eax,edx
  80a69f:	25 ff 01 00 00       	and    eax,0x1ff
  80a6a4:	29 d0                	sub    eax,edx
  80a6a6:	89 05 b4 00 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc200b4],eax        # 42a760 <tokptr>
        return ptr;
  80a6ac:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a6b0:	e9 9e 00 00 00       	jmp    80a753 <strtok+0x15a>
    }
    //go on cutting
    int c=0;
  80a6b5:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    char* ptr=strtokkee+tokptr;
  80a6bc:	8b 05 9e 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2009e]        # 42a760 <tokptr>
  80a6c2:	48 98                	cdqe   
  80a6c4:	48 05 60 a5 42 00    	add    rax,0x42a560
  80a6ca:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
    for(;strtokkee[tokptr]!=splitter&&strtokkee[tokptr]!='\0';tokptr=(tokptr+1)%512,c++);
  80a6ce:	eb 20                	jmp    80a6f0 <strtok+0xf7>
  80a6d0:	8b 05 8a 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2008a]        # 42a760 <tokptr>
  80a6d6:	83 c0 01             	add    eax,0x1
  80a6d9:	99                   	cdq    
  80a6da:	c1 ea 17             	shr    edx,0x17
  80a6dd:	01 d0                	add    eax,edx
  80a6df:	25 ff 01 00 00       	and    eax,0x1ff
  80a6e4:	29 d0                	sub    eax,edx
  80a6e6:	89 05 74 00 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc20074],eax        # 42a760 <tokptr>
  80a6ec:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a6f0:	8b 05 6a 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc2006a]        # 42a760 <tokptr>
  80a6f6:	48 98                	cdqe   
  80a6f8:	0f b6 80 60 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a560]
  80a6ff:	38 45 d4             	cmp    BYTE PTR [rbp-0x2c],al
  80a702:	74 13                	je     80a717 <strtok+0x11e>
  80a704:	8b 05 56 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20056]        # 42a760 <tokptr>
  80a70a:	48 98                	cdqe   
  80a70c:	0f b6 80 60 a5 42 00 	movzx  eax,BYTE PTR [rax+0x42a560]
  80a713:	84 c0                	test   al,al
  80a715:	75 b9                	jne    80a6d0 <strtok+0xd7>
    strtokkee[tokptr]='\0';
  80a717:	8b 05 43 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20043]        # 42a760 <tokptr>
  80a71d:	48 98                	cdqe   
  80a71f:	c6 80 60 a5 42 00 00 	mov    BYTE PTR [rax+0x42a560],0x0
    tokptr=(tokptr+1)%512;
  80a726:	8b 05 34 00 c2 ff    	mov    eax,DWORD PTR [rip+0xffffffffffc20034]        # 42a760 <tokptr>
  80a72c:	83 c0 01             	add    eax,0x1
  80a72f:	99                   	cdq    
  80a730:	c1 ea 17             	shr    edx,0x17
  80a733:	01 d0                	add    eax,edx
  80a735:	25 ff 01 00 00       	and    eax,0x1ff
  80a73a:	29 d0                	sub    eax,edx
  80a73c:	89 05 1e 00 c2 ff    	mov    DWORD PTR [rip+0xffffffffffc2001e],eax        # 42a760 <tokptr>
    if(c)
  80a742:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80a746:	74 06                	je     80a74e <strtok+0x155>
        return ptr;
  80a748:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a74c:	eb 05                	jmp    80a753 <strtok+0x15a>
    else
        return (void*)0;
  80a74e:	b8 00 00 00 00       	mov    eax,0x0
}
  80a753:	c9                   	leave  
  80a754:	c3                   	ret    

000000000080a755 <strcmp>:
int strcmp(char *s1,char *s2)
{
  80a755:	f3 0f 1e fa          	endbr64 
  80a759:	55                   	push   rbp
  80a75a:	48 89 e5             	mov    rbp,rsp
  80a75d:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80a761:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
	while(*s1!='\0'&&*s2!='\0'){
  80a765:	eb 3c                	jmp    80a7a3 <strcmp+0x4e>
		if(*s1>*s2)
  80a767:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a76b:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a76e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a772:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a775:	38 c2                	cmp    dl,al
  80a777:	7e 07                	jle    80a780 <strcmp+0x2b>
			return 1;
  80a779:	b8 01 00 00 00       	mov    eax,0x1
  80a77e:	eb 52                	jmp    80a7d2 <strcmp+0x7d>
		else if(*s1<*s2)
  80a780:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a784:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a787:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a78b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a78e:	38 c2                	cmp    dl,al
  80a790:	7d 07                	jge    80a799 <strcmp+0x44>
			return -1;
  80a792:	b8 ff ff ff ff       	mov    eax,0xffffffff
  80a797:	eb 39                	jmp    80a7d2 <strcmp+0x7d>
		s1++;
  80a799:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
		s2++;
  80a79e:	48 83 45 f0 01       	add    QWORD PTR [rbp-0x10],0x1
	while(*s1!='\0'&&*s2!='\0'){
  80a7a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a7a7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a7aa:	84 c0                	test   al,al
  80a7ac:	74 0b                	je     80a7b9 <strcmp+0x64>
  80a7ae:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a7b2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a7b5:	84 c0                	test   al,al
  80a7b7:	75 ae                	jne    80a767 <strcmp+0x12>
	}
	if(*s1==*s2)
  80a7b9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80a7bd:	0f b6 10             	movzx  edx,BYTE PTR [rax]
  80a7c0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80a7c4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a7c7:	38 c2                	cmp    dl,al
  80a7c9:	75 07                	jne    80a7d2 <strcmp+0x7d>
		return 0;
  80a7cb:	b8 00 00 00 00       	mov    eax,0x0
  80a7d0:	eb 00                	jmp    80a7d2 <strcmp+0x7d>
}
  80a7d2:	5d                   	pop    rbp
  80a7d3:	c3                   	ret    

000000000080a7d4 <strlen>:

int strlen(char *str)
{
  80a7d4:	f3 0f 1e fa          	endbr64 
  80a7d8:	55                   	push   rbp
  80a7d9:	48 89 e5             	mov    rbp,rsp
  80a7dc:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
    int l=0;
  80a7e0:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    for(;*str!='\0';str++,l++);
  80a7e7:	eb 09                	jmp    80a7f2 <strlen+0x1e>
  80a7e9:	48 83 45 e8 01       	add    QWORD PTR [rbp-0x18],0x1
  80a7ee:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  80a7f2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80a7f6:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a7f9:	84 c0                	test   al,al
  80a7fb:	75 ec                	jne    80a7e9 <strlen+0x15>
    return l;
  80a7fd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
}
  80a800:	5d                   	pop    rbp
  80a801:	c3                   	ret    

000000000080a802 <sprintf>:

void sprintf(char *dist, char *str,...)
{
  80a802:	f3 0f 1e fa          	endbr64 
  80a806:	55                   	push   rbp
  80a807:	48 89 e5             	mov    rbp,rsp
  80a80a:	48 81 ec 10 01 00 00 	sub    rsp,0x110
  80a811:	48 89 bd f8 fe ff ff 	mov    QWORD PTR [rbp-0x108],rdi
  80a818:	48 89 b5 f0 fe ff ff 	mov    QWORD PTR [rbp-0x110],rsi
  80a81f:	48 89 95 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rdx
  80a826:	48 89 8d 68 ff ff ff 	mov    QWORD PTR [rbp-0x98],rcx
  80a82d:	4c 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],r8
  80a834:	4c 89 8d 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],r9
  80a83b:	84 c0                	test   al,al
  80a83d:	74 20                	je     80a85f <sprintf+0x5d>
  80a83f:	0f 29 45 80          	movaps XMMWORD PTR [rbp-0x80],xmm0
  80a843:	0f 29 4d 90          	movaps XMMWORD PTR [rbp-0x70],xmm1
  80a847:	0f 29 55 a0          	movaps XMMWORD PTR [rbp-0x60],xmm2
  80a84b:	0f 29 5d b0          	movaps XMMWORD PTR [rbp-0x50],xmm3
  80a84f:	0f 29 65 c0          	movaps XMMWORD PTR [rbp-0x40],xmm4
  80a853:	0f 29 6d d0          	movaps XMMWORD PTR [rbp-0x30],xmm5
  80a857:	0f 29 75 e0          	movaps XMMWORD PTR [rbp-0x20],xmm6
  80a85b:	0f 29 7d f0          	movaps XMMWORD PTR [rbp-0x10],xmm7

    //count num of args
    char *pstr=str;
  80a85f:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80a866:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    char *prev=str;
  80a86d:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80a874:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
    int argnum=0;
  80a87b:	c7 85 3c ff ff ff 00 	mov    DWORD PTR [rbp-0xc4],0x0
  80a882:	00 00 00 
    while (*pstr!='\n')
  80a885:	eb 39                	jmp    80a8c0 <sprintf+0xbe>
    {
        if(*pstr=='%'&&*prev!='%')
  80a887:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a88e:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a891:	3c 25                	cmp    al,0x25
  80a893:	75 15                	jne    80a8aa <sprintf+0xa8>
  80a895:	48 8b 85 40 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc0]
  80a89c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a89f:	3c 25                	cmp    al,0x25
  80a8a1:	74 07                	je     80a8aa <sprintf+0xa8>
            argnum++;
  80a8a3:	83 85 3c ff ff ff 01 	add    DWORD PTR [rbp-0xc4],0x1
        prev=pstr;
  80a8aa:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a8b1:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
        pstr++;
  80a8b8:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80a8bf:	01 
    while (*pstr!='\n')
  80a8c0:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a8c7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a8ca:	3c 0a                	cmp    al,0xa
  80a8cc:	75 b9                	jne    80a887 <sprintf+0x85>
    }

    va_list vargs;
    va_start(vargs,str);
  80a8ce:	c7 85 08 ff ff ff 10 	mov    DWORD PTR [rbp-0xf8],0x10
  80a8d5:	00 00 00 
  80a8d8:	c7 85 0c ff ff ff 30 	mov    DWORD PTR [rbp-0xf4],0x30
  80a8df:	00 00 00 
  80a8e2:	48 8d 45 10          	lea    rax,[rbp+0x10]
  80a8e6:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  80a8ed:	48 8d 85 50 ff ff ff 	lea    rax,[rbp-0xb0]
  80a8f4:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
    pstr=str;
  80a8fb:	48 8b 85 f0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x110]
  80a902:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
    for(;*pstr!='\0';pstr++){
  80a909:	e9 e2 01 00 00       	jmp    80aaf0 <sprintf+0x2ee>
        if(*pstr=='%'&&*(pstr+1)!='\0'){
  80a90e:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a915:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a918:	3c 25                	cmp    al,0x25
  80a91a:	0f 85 aa 01 00 00    	jne    80aaca <sprintf+0x2c8>
  80a920:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a927:	48 83 c0 01          	add    rax,0x1
  80a92b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a92e:	84 c0                	test   al,al
  80a930:	0f 84 94 01 00 00    	je     80aaca <sprintf+0x2c8>
            pstr++;
  80a936:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80a93d:	01 
            if(*pstr=='x'){
  80a93e:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a945:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a948:	3c 78                	cmp    al,0x78
  80a94a:	75 64                	jne    80a9b0 <sprintf+0x1ae>
                int v=va_arg(vargs,int);
  80a94c:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80a952:	83 f8 2f             	cmp    eax,0x2f
  80a955:	77 23                	ja     80a97a <sprintf+0x178>
  80a957:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80a95e:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80a964:	89 d2                	mov    edx,edx
  80a966:	48 01 d0             	add    rax,rdx
  80a969:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80a96f:	83 c2 08             	add    edx,0x8
  80a972:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80a978:	eb 12                	jmp    80a98c <sprintf+0x18a>
  80a97a:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80a981:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80a985:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80a98c:	8b 00                	mov    eax,DWORD PTR [rax]
  80a98e:	89 85 24 ff ff ff    	mov    DWORD PTR [rbp-0xdc],eax
                sprint_hex(dist,v);
  80a994:	8b 95 24 ff ff ff    	mov    edx,DWORD PTR [rbp-0xdc]
  80a99a:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80a9a1:	89 d6                	mov    esi,edx
  80a9a3:	48 89 c7             	mov    rdi,rax
  80a9a6:	e8 4e 02 00 00       	call   80abf9 <sprint_hex>
            if(*pstr=='x'){
  80a9ab:	e9 38 01 00 00       	jmp    80aae8 <sprintf+0x2e6>
            }else if(*pstr=='s'){
  80a9b0:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80a9b7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80a9ba:	3c 73                	cmp    al,0x73
  80a9bc:	75 68                	jne    80aa26 <sprintf+0x224>
                char* v=va_arg(vargs,char*);
  80a9be:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80a9c4:	83 f8 2f             	cmp    eax,0x2f
  80a9c7:	77 23                	ja     80a9ec <sprintf+0x1ea>
  80a9c9:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80a9d0:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80a9d6:	89 d2                	mov    edx,edx
  80a9d8:	48 01 d0             	add    rax,rdx
  80a9db:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80a9e1:	83 c2 08             	add    edx,0x8
  80a9e4:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80a9ea:	eb 12                	jmp    80a9fe <sprintf+0x1fc>
  80a9ec:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80a9f3:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80a9f7:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80a9fe:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa01:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
                sprintn(dist,v);
  80aa08:	48 8b 95 28 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xd8]
  80aa0f:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80aa16:	48 89 d6             	mov    rsi,rdx
  80aa19:	48 89 c7             	mov    rdi,rax
  80aa1c:	e8 5a 02 00 00       	call   80ac7b <sprintn>
            if(*pstr=='x'){
  80aa21:	e9 c2 00 00 00       	jmp    80aae8 <sprintf+0x2e6>
            }else if(*pstr=='d'){
  80aa26:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80aa2d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aa30:	3c 64                	cmp    al,0x64
  80aa32:	75 66                	jne    80aa9a <sprintf+0x298>
                char* v=va_arg(vargs,char*);
  80aa34:	8b 85 08 ff ff ff    	mov    eax,DWORD PTR [rbp-0xf8]
  80aa3a:	83 f8 2f             	cmp    eax,0x2f
  80aa3d:	77 23                	ja     80aa62 <sprintf+0x260>
  80aa3f:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  80aa46:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80aa4c:	89 d2                	mov    edx,edx
  80aa4e:	48 01 d0             	add    rax,rdx
  80aa51:	8b 95 08 ff ff ff    	mov    edx,DWORD PTR [rbp-0xf8]
  80aa57:	83 c2 08             	add    edx,0x8
  80aa5a:	89 95 08 ff ff ff    	mov    DWORD PTR [rbp-0xf8],edx
  80aa60:	eb 12                	jmp    80aa74 <sprintf+0x272>
  80aa62:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  80aa69:	48 8d 50 08          	lea    rdx,[rax+0x8]
  80aa6d:	48 89 95 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rdx
  80aa74:	48 8b 00             	mov    rax,QWORD PTR [rax]
  80aa77:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
                sprint_decimal(dist,v);
  80aa7e:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  80aa85:	89 c2                	mov    edx,eax
  80aa87:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80aa8e:	89 d6                	mov    esi,edx
  80aa90:	48 89 c7             	mov    rdi,rax
  80aa93:	e8 ad 00 00 00       	call   80ab45 <sprint_decimal>
            if(*pstr=='x'){
  80aa98:	eb 4e                	jmp    80aae8 <sprintf+0x2e6>
            }else if(*pstr=='c'){
  80aa9a:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80aaa1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aaa4:	3c 63                	cmp    al,0x63
  80aaa6:	75 02                	jne    80aaaa <sprintf+0x2a8>
                char v=va_arg(vargs,char);
  80aaa8:	0f 0b                	ud2    
                sprintchar(dist,v);
            }else{
                sprintchar(dist,*pstr);
  80aaaa:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80aab1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aab4:	0f be d0             	movsx  edx,al
  80aab7:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80aabe:	89 d6                	mov    esi,edx
  80aac0:	48 89 c7             	mov    rdi,rax
  80aac3:	e8 3e 00 00 00       	call   80ab06 <sprintchar>
            if(*pstr=='x'){
  80aac8:	eb 1e                	jmp    80aae8 <sprintf+0x2e6>
            }
        }else{
            sprintchar(dist,*pstr);
  80aaca:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80aad1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aad4:	0f be d0             	movsx  edx,al
  80aad7:	48 8b 85 f8 fe ff ff 	mov    rax,QWORD PTR [rbp-0x108]
  80aade:	89 d6                	mov    esi,edx
  80aae0:	48 89 c7             	mov    rdi,rax
  80aae3:	e8 1e 00 00 00       	call   80ab06 <sprintchar>
    for(;*pstr!='\0';pstr++){
  80aae8:	48 83 85 48 ff ff ff 	add    QWORD PTR [rbp-0xb8],0x1
  80aaef:	01 
  80aaf0:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  80aaf7:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aafa:	84 c0                	test   al,al
  80aafc:	0f 85 0c fe ff ff    	jne    80a90e <sprintf+0x10c>
        }
    }
    va_end(vargs);
}
  80ab02:	90                   	nop
  80ab03:	90                   	nop
  80ab04:	c9                   	leave  
  80ab05:	c3                   	ret    

000000000080ab06 <sprintchar>:
void sprintchar(char *dist,char c)
{
  80ab06:	f3 0f 1e fa          	endbr64 
  80ab0a:	55                   	push   rbp
  80ab0b:	48 89 e5             	mov    rbp,rsp
  80ab0e:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80ab12:	89 f0                	mov    eax,esi
  80ab14:	88 45 f4             	mov    BYTE PTR [rbp-0xc],al
    while(*dist!='\0')
  80ab17:	eb 05                	jmp    80ab1e <sprintchar+0x18>
        dist++;
  80ab19:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
    while(*dist!='\0')
  80ab1e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab22:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80ab25:	84 c0                	test   al,al
  80ab27:	75 f0                	jne    80ab19 <sprintchar+0x13>
    *dist++=c;
  80ab29:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab2d:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80ab31:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
  80ab35:	0f b6 55 f4          	movzx  edx,BYTE PTR [rbp-0xc]
  80ab39:	88 10                	mov    BYTE PTR [rax],dl
    *dist='\0';
  80ab3b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80ab3f:	c6 00 00             	mov    BYTE PTR [rax],0x0
}
  80ab42:	90                   	nop
  80ab43:	5d                   	pop    rbp
  80ab44:	c3                   	ret    

000000000080ab45 <sprint_decimal>:
void sprint_decimal(char *dist,int c)
{
  80ab45:	f3 0f 1e fa          	endbr64 
  80ab49:	55                   	push   rbp
  80ab4a:	48 89 e5             	mov    rbp,rsp
  80ab4d:	48 83 ec 30          	sub    rsp,0x30
  80ab51:	48 89 7d d8          	mov    QWORD PTR [rbp-0x28],rdi
  80ab55:	89 75 d4             	mov    DWORD PTR [rbp-0x2c],esi
    unsigned char st[22];
    int p=0;
  80ab58:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<sizeof(unsigned long)*2){
  80ab5f:	eb 65                	jmp    80abc6 <sprint_decimal+0x81>
        unsigned char a=c%10+'0';
  80ab61:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
  80ab64:	48 63 c2             	movsxd rax,edx
  80ab67:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  80ab6e:	48 c1 e8 20          	shr    rax,0x20
  80ab72:	c1 f8 02             	sar    eax,0x2
  80ab75:	89 d6                	mov    esi,edx
  80ab77:	c1 fe 1f             	sar    esi,0x1f
  80ab7a:	29 f0                	sub    eax,esi
  80ab7c:	89 c1                	mov    ecx,eax
  80ab7e:	89 c8                	mov    eax,ecx
  80ab80:	c1 e0 02             	shl    eax,0x2
  80ab83:	01 c8                	add    eax,ecx
  80ab85:	01 c0                	add    eax,eax
  80ab87:	89 d1                	mov    ecx,edx
  80ab89:	29 c1                	sub    ecx,eax
  80ab8b:	89 c8                	mov    eax,ecx
  80ab8d:	83 c0 30             	add    eax,0x30
  80ab90:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        st[p++]=a;
  80ab93:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ab96:	8d 50 01             	lea    edx,[rax+0x1]
  80ab99:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80ab9c:	48 98                	cdqe   
  80ab9e:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80aba2:	88 54 05 e0          	mov    BYTE PTR [rbp+rax*1-0x20],dl
        c/=10;
  80aba6:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
  80aba9:	48 63 d0             	movsxd rdx,eax
  80abac:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
  80abb3:	48 c1 ea 20          	shr    rdx,0x20
  80abb7:	c1 fa 02             	sar    edx,0x2
  80abba:	c1 f8 1f             	sar    eax,0x1f
  80abbd:	89 c1                	mov    ecx,eax
  80abbf:	89 d0                	mov    eax,edx
  80abc1:	29 c8                	sub    eax,ecx
  80abc3:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
    while(p<sizeof(unsigned long)*2){
  80abc6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80abc9:	83 f8 0f             	cmp    eax,0xf
  80abcc:	76 93                	jbe    80ab61 <sprint_decimal+0x1c>
    }
    while(p>0)
  80abce:	eb 1f                	jmp    80abef <sprint_decimal+0xaa>
    {
        sprintchar(dist,st[--p]);
  80abd0:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80abd4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80abd7:	48 98                	cdqe   
  80abd9:	0f b6 44 05 e0       	movzx  eax,BYTE PTR [rbp+rax*1-0x20]
  80abde:	0f be d0             	movsx  edx,al
  80abe1:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
  80abe5:	89 d6                	mov    esi,edx
  80abe7:	48 89 c7             	mov    rdi,rax
  80abea:	e8 17 ff ff ff       	call   80ab06 <sprintchar>
    while(p>0)
  80abef:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80abf3:	7f db                	jg     80abd0 <sprint_decimal+0x8b>
    }
}
  80abf5:	90                   	nop
  80abf6:	90                   	nop
  80abf7:	c9                   	leave  
  80abf8:	c3                   	ret    

000000000080abf9 <sprint_hex>:
void sprint_hex(char *dist,unsigned int c)
{
  80abf9:	f3 0f 1e fa          	endbr64 
  80abfd:	55                   	push   rbp
  80abfe:	48 89 e5             	mov    rbp,rsp
  80ac01:	48 83 ec 20          	sub    rsp,0x20
  80ac05:	48 89 7d e8          	mov    QWORD PTR [rbp-0x18],rdi
  80ac09:	89 75 e4             	mov    DWORD PTR [rbp-0x1c],esi
    unsigned char st[10];
    int p=0;
  80ac0c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
    while(p<10){
  80ac13:	eb 35                	jmp    80ac4a <sprint_hex+0x51>
        unsigned char a=c%16;
  80ac15:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80ac18:	83 e0 0f             	and    eax,0xf
  80ac1b:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
        if(a>9)a+='a'-10;
  80ac1e:	80 7d fb 09          	cmp    BYTE PTR [rbp-0x5],0x9
  80ac22:	76 06                	jbe    80ac2a <sprint_hex+0x31>
  80ac24:	80 45 fb 57          	add    BYTE PTR [rbp-0x5],0x57
  80ac28:	eb 04                	jmp    80ac2e <sprint_hex+0x35>
        else a+='0';
  80ac2a:	80 45 fb 30          	add    BYTE PTR [rbp-0x5],0x30
        st[p++]=a;
  80ac2e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ac31:	8d 50 01             	lea    edx,[rax+0x1]
  80ac34:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
  80ac37:	48 98                	cdqe   
  80ac39:	0f b6 55 fb          	movzx  edx,BYTE PTR [rbp-0x5]
  80ac3d:	88 54 05 f1          	mov    BYTE PTR [rbp+rax*1-0xf],dl
        c/=16;
  80ac41:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  80ac44:	c1 e8 04             	shr    eax,0x4
  80ac47:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
    while(p<10){
  80ac4a:	83 7d fc 09          	cmp    DWORD PTR [rbp-0x4],0x9
  80ac4e:	7e c5                	jle    80ac15 <sprint_hex+0x1c>
    }
    while(p>0)
  80ac50:	eb 1f                	jmp    80ac71 <sprint_hex+0x78>
    {
        sprintchar(dist,st[--p]);
  80ac52:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
  80ac56:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  80ac59:	48 98                	cdqe   
  80ac5b:	0f b6 44 05 f1       	movzx  eax,BYTE PTR [rbp+rax*1-0xf]
  80ac60:	0f be d0             	movsx  edx,al
  80ac63:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  80ac67:	89 d6                	mov    esi,edx
  80ac69:	48 89 c7             	mov    rdi,rax
  80ac6c:	e8 95 fe ff ff       	call   80ab06 <sprintchar>
    while(p>0)
  80ac71:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  80ac75:	7f db                	jg     80ac52 <sprint_hex+0x59>
    }
}
  80ac77:	90                   	nop
  80ac78:	90                   	nop
  80ac79:	c9                   	leave  
  80ac7a:	c3                   	ret    

000000000080ac7b <sprintn>:
void sprintn(char *dist,char *str)
{
  80ac7b:	f3 0f 1e fa          	endbr64 
  80ac7f:	55                   	push   rbp
  80ac80:	48 89 e5             	mov    rbp,rsp
  80ac83:	48 83 ec 10          	sub    rsp,0x10
  80ac87:	48 89 7d f8          	mov    QWORD PTR [rbp-0x8],rdi
  80ac8b:	48 89 75 f0          	mov    QWORD PTR [rbp-0x10],rsi
    while(*str!='\0')
  80ac8f:	eb 20                	jmp    80acb1 <sprintn+0x36>
    {
        sprintchar(dist,*str++);
  80ac91:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80ac95:	48 8d 50 01          	lea    rdx,[rax+0x1]
  80ac99:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  80ac9d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80aca0:	0f be d0             	movsx  edx,al
  80aca3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  80aca7:	89 d6                	mov    esi,edx
  80aca9:	48 89 c7             	mov    rdi,rax
  80acac:	e8 55 fe ff ff       	call   80ab06 <sprintchar>
    while(*str!='\0')
  80acb1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  80acb5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
  80acb8:	84 c0                	test   al,al
  80acba:	75 d5                	jne    80ac91 <sprintn+0x16>
    }
  80acbc:	90                   	nop
  80acbd:	90                   	nop
  80acbe:	c9                   	leave  
  80acbf:	c3                   	ret    

000000000080acc0 <create_zero>:
  80acc0:	e8 cd 8f ff ff       	call   803c92 <req_proc>
  80acc5:	83 f8 ff             	cmp    eax,0xffffffff
  80acc8:	74 0c                	je     80acd6 <create_zero.retu>
  80acca:	e8 bc 90 ff ff       	call   803d8b <set_proc>
  80accf:	67 8b 04 24          	mov    eax,DWORD PTR [esp]
  80acd3:	83 c4 40             	add    esp,0x40

000000000080acd6 <create_zero.retu>:
  80acd6:	c3                   	ret    

000000000080acd7 <fill_desc>:
  80acd7:	55                   	push   rbp
  80acd8:	48 89 e5             	mov    rbp,rsp
  80acdb:	67 8b 45 14          	mov    eax,DWORD PTR [ebp+0x14]
  80acdf:	67 8b 5d 10          	mov    ebx,DWORD PTR [ebp+0x10]
  80ace3:	67 8b 4d 0c          	mov    ecx,DWORD PTR [ebp+0xc]
  80ace7:	67 8b 55 08          	mov    edx,DWORD PTR [ebp+0x8]
  80aceb:	be 2a ae 80 00       	mov    esi,0x80ae2a
  80acf0:	c7 04 25 2a ae 80 00 	mov    DWORD PTR ds:0x80ae2a,0x0
  80acf7:	00 00 00 00 
  80acfb:	c7 04 25 2e ae 80 00 	mov    DWORD PTR ds:0x80ae2e,0x0
  80ad02:	00 00 00 00 
  80ad06:	66 67 89 0e          	mov    WORD PTR [esi],cx
  80ad0a:	c1 e9 10             	shr    ecx,0x10
  80ad0d:	66 67 89 56 02       	mov    WORD PTR [esi+0x2],dx
  80ad12:	c1 ea 10             	shr    edx,0x10
  80ad15:	67 88 56 04          	mov    BYTE PTR [esi+0x4],dl
  80ad19:	66 c1 ea 08          	shr    dx,0x8
  80ad1d:	67 88 56 07          	mov    BYTE PTR [esi+0x7],dl
  80ad21:	66 67 89 5e 05       	mov    WORD PTR [esi+0x5],bx
  80ad26:	67 8b 7e 04          	mov    edi,DWORD PTR [esi+0x4]
  80ad2a:	c1 e1 08             	shl    ecx,0x8
  80ad2d:	09 cf                	or     edi,ecx
  80ad2f:	67 89 7e 04          	mov    DWORD PTR [esi+0x4],edi
  80ad33:	8b 14 25 2a ae 80 00 	mov    edx,DWORD PTR ds:0x80ae2a
  80ad3a:	67 89 10             	mov    DWORD PTR [eax],edx
  80ad3d:	8b 14 25 2e ae 80 00 	mov    edx,DWORD PTR ds:0x80ae2e
  80ad44:	67 89 50 04          	mov    DWORD PTR [eax+0x4],edx
  80ad48:	c9                   	leave  
  80ad49:	c3                   	ret    

000000000080ad4a <switch_proc_asm>:
  80ad4a:	66 67 8b 44 24 04    	mov    ax,WORD PTR [esp+0x4]
  80ad50:	66 89 04 25 68 ad 80 	mov    WORD PTR ds:0x80ad68,ax
  80ad57:	00 
  80ad58:	c7 04 25 64 ad 80 00 	mov    DWORD PTR ds:0x80ad64,0x0
  80ad5f:	00 00 00 00 

000000000080ad63 <switch_proc_asm.ljmp>:
  80ad63:	ea                   	(bad)  
  80ad64:	00 00                	add    BYTE PTR [rax],al
  80ad66:	00 00                	add    BYTE PTR [rax],al
  80ad68:	00 00                	add    BYTE PTR [rax],al
  80ad6a:	c3                   	ret    

000000000080ad6b <switch_to_old>:
  80ad6b:	67 8b 74 24 04       	mov    esi,DWORD PTR [esp+0x4]
  80ad70:	67 8b 5e 20          	mov    ebx,DWORD PTR [esi+0x20]
  80ad74:	bf dc ad 80 00       	mov    edi,0x80addc
  80ad79:	67 89 5f 01          	mov    DWORD PTR [edi+0x1],ebx
  80ad7d:	67 8b 46 38          	mov    eax,DWORD PTR [esi+0x38]
  80ad81:	89 c1                	mov    ecx,eax
  80ad83:	83 e9 04             	sub    ecx,0x4
  80ad86:	67 89 19             	mov    DWORD PTR [ecx],ebx
  80ad89:	50                   	push   rax
  80ad8a:	89 f5                	mov    ebp,esi
  80ad8c:	83 c5 28             	add    ebp,0x28
  80ad8f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80ad93:	50                   	push   rax
  80ad94:	83 c5 04             	add    ebp,0x4
  80ad97:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80ad9b:	50                   	push   rax
  80ad9c:	83 c5 04             	add    ebp,0x4
  80ad9f:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80ada3:	50                   	push   rax
  80ada4:	83 c5 04             	add    ebp,0x4
  80ada7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80adab:	50                   	push   rax
  80adac:	83 c5 04             	add    ebp,0x4
  80adaf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80adb3:	50                   	push   rax
  80adb4:	83 c5 04             	add    ebp,0x4
  80adb7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80adbb:	50                   	push   rax
  80adbc:	83 c5 04             	add    ebp,0x4
  80adbf:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80adc3:	50                   	push   rax
  80adc4:	83 c5 04             	add    ebp,0x4
  80adc7:	67 8b 45 00          	mov    eax,DWORD PTR [ebp+0x0]
  80adcb:	50                   	push   rax
  80adcc:	83 c5 04             	add    ebp,0x4
  80adcf:	67 8b 46 1c          	mov    eax,DWORD PTR [esi+0x1c]
  80add3:	0f 22 d8             	mov    cr3,rax
  80add6:	67 8b 46 24          	mov    eax,DWORD PTR [esi+0x24]
  80adda:	50                   	push   rax
  80addb:	5c                   	pop    rsp

000000000080addc <switch_to_old.leap>:
  80addc:	ea                   	(bad)  
  80addd:	00 00                	add    BYTE PTR [rax],al
  80addf:	00 00                	add    BYTE PTR [rax],al
  80ade1:	08 00                	or     BYTE PTR [rax],al

000000000080ade3 <save_context>:
  80ade3:	67 8b 44 24 24       	mov    eax,DWORD PTR [esp+0x24]
  80ade8:	83 c0 44             	add    eax,0x44
  80adeb:	b9 08 00 00 00       	mov    ecx,0x8
  80adf0:	89 e7                	mov    edi,esp

000000000080adf2 <save_context.loops>:
  80adf2:	67 8b 17             	mov    edx,DWORD PTR [edi]
  80adf5:	67 89 10             	mov    DWORD PTR [eax],edx
  80adf8:	83 c7 04             	add    edi,0x4
  80adfb:	83 e8 04             	sub    eax,0x4
  80adfe:	e2 f2                	loop   80adf2 <save_context.loops>
  80ae00:	5b                   	pop    rbx
  80ae01:	67 8b 44 24 04       	mov    eax,DWORD PTR [esp+0x4]
  80ae06:	67 89 58 24          	mov    DWORD PTR [eax+0x24],ebx
  80ae0a:	67 48 8b 1c 24       	mov    rbx,QWORD PTR [esp]
  80ae0f:	67 89 58 20          	mov    DWORD PTR [eax+0x20],ebx
  80ae13:	c3                   	ret    

000000000080ae14 <move_to_user_mode>:
  80ae14:	66 b8 20 00          	mov    ax,0x20
  80ae18:	8e d8                	mov    ds,eax
  80ae1a:	8e c0                	mov    es,eax
  80ae1c:	8e e8                	mov    gs,eax
  80ae1e:	6a 20                	push   0x20
  80ae20:	54                   	push   rsp
  80ae21:	6a 18                	push   0x18
  80ae23:	68 29 ae 80 00       	push   0x80ae29
  80ae28:	cf                   	iret   

000000000080ae29 <move_to_user_mode.done>:
  80ae29:	c3                   	ret    

000000000080ae2a <desc>:
	...

000000000080ae32 <ret_sys_call>:
  80ae32:	58                   	pop    rax
  80ae33:	8e d8                	mov    ds,eax
  80ae35:	58                   	pop    rax
  80ae36:	8e c0                	mov    es,eax
  80ae38:	41 5f                	pop    r15
  80ae3a:	41 5e                	pop    r14
  80ae3c:	41 5d                	pop    r13
  80ae3e:	41 5c                	pop    r12
  80ae40:	41 5b                	pop    r11
  80ae42:	41 5a                	pop    r10
  80ae44:	41 59                	pop    r9
  80ae46:	41 58                	pop    r8
  80ae48:	5e                   	pop    rsi
  80ae49:	5f                   	pop    rdi
  80ae4a:	5a                   	pop    rdx
  80ae4b:	59                   	pop    rcx
  80ae4c:	5b                   	pop    rbx
  80ae4d:	58                   	pop    rax

000000000080ae4e <tmp>:
  80ae4e:	48 0f 07             	sysretq 
